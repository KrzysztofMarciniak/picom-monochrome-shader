#version 330

in vec2 texcoord;
uniform sampler2D tex;

vec4 default_post_processing(vec4 c);

vec4 window_shader() {
    vec2 tex_size = vec2(textureSize(tex, 0));
    vec4 color = texture(tex, texcoord / tex_size);

    float luminance = dot(color.rgb, vec3(0.2126, 0.7152, 0.0722));
    float black_or_white = step(0.50, luminance);
    color.rgb = vec3(black_or_white);

    return default_post_processing(color);
}
