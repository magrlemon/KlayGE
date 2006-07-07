float3 decompress_normal(float4 comp_normal)
{
	float3 normal;
	normal.xy = comp_normal.ag * 2 - 1;
	normal.z = sqrt(1 - dot(normal.xy, normal.xy));
	return normal;
}

float4 decode_hdr_yc(float y, float2 c)
{
	float Y = exp2(y * 65536 / 2048 - 16);
	float2 C = c;
	C *= C;
	
	return float4(Y * float3(C.g, (1 - C.g - C.r), C.r) / float3(0.299f, 0.587f, 0.114f), 1);
}
