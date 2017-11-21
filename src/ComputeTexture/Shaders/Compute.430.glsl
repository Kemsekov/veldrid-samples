#version 430

uniform ScreenSizeBuffer
{
    float ScreenWidth;
    float ScreenHeight;
    vec2 Padding_;
};

uniform ShiftBuffer
{
    float RShift;
    float GShift;
    float BShift;
    float Padding1_;
};

layout(rgba32f) uniform image2D Tex;

layout(local_size_x = 1, local_size_y = 1, local_size_z = 1) in;

void main()
{
    float x = (gl_GlobalInvocationID.x + RShift);
    float y = (gl_GlobalInvocationID.y + GShift);

    imageStore(Tex, ivec2(gl_GlobalInvocationID.xy), vec4(x / ScreenWidth, y / ScreenHeight, BShift, 1));
}
