Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 15EFA1617B
	for <lists+alsa-devel@lfdr.de>; Tue,  7 May 2019 11:52:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ADA301865;
	Tue,  7 May 2019 11:51:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ADA301865
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557222756;
	bh=fdXh0OPNmNyUn/+vTgs0wMKH0/ihvoWvkeW95FW3CO0=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=E4ZiGTJCv+6IojmRWq3+w0gGhNAI5Lc71eA8p7QThcXXITMEoDFo2/okZQhpHtYxW
	 OR1ugs0sADW0kh8tu+YzZDtWGIuxUHByHGq2juOV1i04XManzoFXN/Reh2bKOTq+3c
	 B3k9EzS8+rnwlUVo9KxuyORqaU5hulpIuyVG4+7c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 95957F89671;
	Tue,  7 May 2019 11:50:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 88FAEF89674; Tue,  7 May 2019 11:50:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,SPF_PASS,T_DKIMWL_WL_HIGH,
 URIBL_BLOCKED,USER_IN_DEF_SPF_WL autolearn=disabled version=3.4.0
Received: from mail-vk1-xa43.google.com (mail-vk1-xa43.google.com
 [IPv6:2607:f8b0:4864:20::a43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C01B1F89671
 for <alsa-devel@alsa-project.org>; Tue,  7 May 2019 11:50:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C01B1F89671
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="bR7etZ1B"
Received: by mail-vk1-xa43.google.com with SMTP id q189so3883439vkq.11
 for <alsa-devel@alsa-project.org>; Tue, 07 May 2019 02:50:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ItZj+cZayrvSVkSWqDa4A7M4jL0GmunrDFPDNocBX6Q=;
 b=bR7etZ1B5jxM7NxI4H5Ov/jd2EPcgkuWMfFiLD5BvJZZcGNPPUs0JMKXtDagW3DTwp
 TapWrKXXE1kc/+Lxcglp7oaTAJLR4LvKzprPWJEB6fg5dEUAe35Dhx+jwgF3Q7Shl3Ba
 9cc/ljRlabgtSYS/5KICPXbmRRYHuIZbJFEW0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ItZj+cZayrvSVkSWqDa4A7M4jL0GmunrDFPDNocBX6Q=;
 b=Mi0znHRaFfxW4SKtZ/8I+rKwbuIjjqzmIzxtbXTZUz+ORobNthaHjoL2KxGDtG6luI
 K2bobNwAIX66RBNNCHe3XcWqMDah28UMQDaDuOZCtjj8qK/b4DSgvrgP8+Ll+t2Ja0pF
 f1VQukaMWEUsTexRzZjnpPiNq6RI3qxAqM7dJJR95wnBccCzftSysdqv6CeFIIaeKBL1
 311GAQO0ajg3GFq3JG1VCrUKgWiq/xZDxJ58PLt/wA3Mfjlf7+zcl1xwOUbPYMGsHd9K
 J5Gs8zhAJY9kXeweVtFEvhk6amiSoxW/HmcQtYRnUjRikItBZZ4MSuZifzIMzGRBRICB
 fnNg==
X-Gm-Message-State: APjAAAVXOAySF9ga1pNhoJCJ93FwdJQ1/9RDtEDJonhQY4rg2ssHiNLD
 0A+ChVtb0h1FDwV4KnLC2iHENRS4No++1A7MzfIZ9w==
X-Google-Smtp-Source: APXvYqxqHK/+FtHyw2cyBS5z6nFUlGd7uR8B9ID7V7BGH3XqT8oKHyCS9RsjAXV7mYIWeto8ZZ9tMQz+I1zo6ct5Okg=
X-Received: by 2002:a1f:a385:: with SMTP id m127mr12122695vke.88.1557222643680; 
 Tue, 07 May 2019 02:50:43 -0700 (PDT)
MIME-Version: 1.0
References: <20190503220233.64546-1-gwendal@chromium.org>
 <20190503220233.64546-31-gwendal@chromium.org>
In-Reply-To: <20190503220233.64546-31-gwendal@chromium.org>
From: Cheng-yi Chiang <cychiang@chromium.org>
Date: Tue, 7 May 2019 17:50:17 +0800
Message-ID: <CAFv8NwJzSrAU+AsFuqy6YBabmYKO+jJmDeS27_rE=hcqUU-tvQ@mail.gmail.com>
To: Gwendal Grignou <gwendal@chromium.org>
Cc: "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>, linux-iio@vger.kernel.org,
 Benson Leung <bleung@chromium.org>, Takashi Iwai <tiwai@suse.com>,
 Guenter Roeck <groeck@chromium.org>, Mark Brown <broonie@kernel.org>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Lee Jones <lee.jones@linaro.org>, jic23@kernel.org
Subject: Re: [alsa-devel] [PATCH v2 30/30] mfd: cros_ec: Update I2S API
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hi Gwendal,
Thanks for the fix!


From: Gwendal Grignou <gwendal@chromium.org>
Date: Sat, May 4, 2019 at 6:03 AM
To: <enric.balletbo@collabora.com>, <bleung@chromium.org>,
<groeck@chromium.org>, <lee.jones@linaro.org>, <jic23@kernel.org>,
<broonie@kernel.org>, <cychiang@chromium.org>, <tiwai@suse.com>
Cc: <linux-iio@vger.kernel.org>, <alsa-devel@alsa-project.org>, Gwendal Grignou

> Improve I2S API.
> Rename ec_response_codec_gain into ec_codec_i2s_gain,
> update caller accordlingly.
>
> Acked-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
> Signed-off-by: Gwendal Grignou <gwendal@chromium.org>
> ---
>  include/linux/mfd/cros_ec_commands.h | 44 +++++++++++++---------------
>  sound/soc/codecs/cros_ec_codec.c     |  8 ++---
>  2 files changed, 24 insertions(+), 28 deletions(-)
>
> diff --git a/include/linux/mfd/cros_ec_commands.h b/include/linux/mfd/cros_ec_commands.h
> index fc8babce1576..fa397722f17e 100644
> --- a/include/linux/mfd/cros_ec_commands.h
> +++ b/include/linux/mfd/cros_ec_commands.h
> @@ -4471,6 +4471,7 @@ enum mkbp_cec_event {
>  /* Commands for I2S recording on audio codec. */
>
>  #define EC_CMD_CODEC_I2S 0x00BC
> +#define EC_WOV_I2S_SAMPLE_RATE 48000
>
>  enum ec_codec_i2s_subcmd {
>         EC_CODEC_SET_SAMPLE_DEPTH = 0x0,
> @@ -4480,6 +4481,7 @@ enum ec_codec_i2s_subcmd {
>         EC_CODEC_I2S_SET_CONFIG = 0x4,
>         EC_CODEC_I2S_SET_TDM_CONFIG = 0x5,
>         EC_CODEC_I2S_SET_BCLK = 0x6,
> +       EC_CODEC_I2S_SUBCMD_COUNT = 0x7,
>  };
>
>  enum ec_sample_depth_value {
> @@ -4496,6 +4498,21 @@ enum ec_i2s_config {
>         EC_DAI_FMT_PCM_TDM = 5,
>  };
>
> +/*
> + * For subcommand EC_CODEC_GET_GAIN.
> + */
> +struct __ec_align1 ec_codec_i2s_gain {
> +       uint8_t left;
> +       uint8_t right;
> +};
> +
> +struct __ec_todo_unpacked ec_param_codec_i2s_tdm {
> +       int16_t ch0_delay; /* 0 to 496 */
> +       int16_t ch1_delay; /* -1 to 496 */
> +       uint8_t adjacent_to_ch0;
> +       uint8_t adjacent_to_ch1;
> +};
> +
>  struct __ec_todo_packed ec_param_codec_i2s {
>         /* enum ec_codec_i2s_subcmd */
>         uint8_t cmd;
> @@ -4510,10 +4527,7 @@ struct __ec_todo_packed ec_param_codec_i2s {
>                  * EC_CODEC_SET_GAIN
>                  * Value should be 0~43 for both channels.
>                  */
> -               struct __ec_align1 ec_param_codec_i2s_set_gain {
> -                       uint8_t left;
> -                       uint8_t right;
> -               } gain;
> +               struct ec_codec_i2s_gain gain;
>
>                 /*
>                  * EC_CODEC_I2S_ENABLE
> @@ -4522,7 +4536,7 @@ struct __ec_todo_packed ec_param_codec_i2s {
>                 uint8_t i2s_enable;
>
>                 /*
> -                * EC_CODEC_I2S_SET_COFNIG
> +                * EC_CODEC_I2S_SET_CONFIG
>                  * Value should be one of ec_i2s_config.
>                  */
>                 uint8_t i2s_config;
> @@ -4531,18 +4545,7 @@ struct __ec_todo_packed ec_param_codec_i2s {
>                  * EC_CODEC_I2S_SET_TDM_CONFIG
>                  * Value should be one of ec_i2s_config.
>                  */
> -               struct __ec_todo_unpacked ec_param_codec_i2s_tdm {
> -                       /*
> -                        * 0 to 496
> -                        */
> -                       int16_t ch0_delay;
> -                       /*
> -                        * -1 to 496
> -                        */
> -                       int16_t ch1_delay;
> -                       uint8_t adjacent_to_ch0;
> -                       uint8_t adjacent_to_ch1;
> -               } tdm_param;
> +               struct ec_param_codec_i2s_tdm tdm_param;
>
>                 /*
>                  * EC_CODEC_I2S_SET_BCLK
> @@ -4551,13 +4554,6 @@ struct __ec_todo_packed ec_param_codec_i2s {
>         };
>  };
>
> -/*
> - * For subcommand EC_CODEC_GET_GAIN.
> - */
> -struct ec_response_codec_gain {
> -       uint8_t left;
> -       uint8_t right;
> -} __ec_align1;
>
>  /*****************************************************************************/
>  /* System commands */
> diff --git a/sound/soc/codecs/cros_ec_codec.c b/sound/soc/codecs/cros_ec_codec.c
> index 99a3af8a15ff..87830ed5ebf4 100644
> --- a/sound/soc/codecs/cros_ec_codec.c
> +++ b/sound/soc/codecs/cros_ec_codec.c
> @@ -38,21 +38,21 @@ static const DECLARE_TLV_DB_SCALE(ec_mic_gain_tlv, 0, 100, 0);
>
>  static int ec_command_get_gain(struct snd_soc_component *component,
>                                struct ec_param_codec_i2s *param,
> -                              struct ec_response_codec_gain *resp)
> +                              struct ec_codec_i2s_gain *resp)
>  {
>         struct cros_ec_codec_data *codec_data =
>                 snd_soc_component_get_drvdata(component);
>         struct cros_ec_device *ec_device = codec_data->ec_device;
>         u8 buffer[sizeof(struct cros_ec_command) +
>                   max(sizeof(struct ec_param_codec_i2s),
> -                     sizeof(struct ec_response_codec_gain))];
> +                     sizeof(struct ec_codec_i2s_gain))];
>         struct cros_ec_command *msg = (struct cros_ec_command *)&buffer;
>         int ret;
>
>         msg->version = 0;
>         msg->command = EC_CMD_CODEC_I2S;
>         msg->outsize = sizeof(struct ec_param_codec_i2s);
> -       msg->insize = sizeof(struct ec_response_codec_gain);
> +       msg->insize = sizeof(struct ec_codec_i2s_gain);
>
>         memcpy(msg->data, param, msg->outsize);
>
> @@ -226,7 +226,7 @@ static int get_ec_mic_gain(struct snd_soc_component *component,
>                            u8 *left, u8 *right)
>  {
>         struct ec_param_codec_i2s param;
> -       struct ec_response_codec_gain resp;
> +       struct ec_codec_i2s_gain resp;
>         int ret;
>
>         param.cmd = EC_CODEC_GET_GAIN;
> --
> 2.21.0.1020.gf2820cf01a-goog
>
Acked-by: Cheng-Yi Chiang <cychiang@chromium.org>
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
