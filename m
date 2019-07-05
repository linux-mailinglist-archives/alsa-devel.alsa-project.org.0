Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E42160147
	for <lists+alsa-devel@lfdr.de>; Fri,  5 Jul 2019 09:11:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DF199168F;
	Fri,  5 Jul 2019 09:10:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DF199168F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1562310681;
	bh=LChqeNgOWnqYZmfZhE+8MVw/82bwWiUlzvMA6VkvQBU=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=T9/JeRnXkNwXsAJznY5ZpIY+v9AFitnKv2EmB1fgT1XWMlUeXAijv6kdBzSm3YSXL
	 WrAI+DdE0b7EM01UrZD73n83m0VkN7eL7bKFgFErFtSCR0pH6lOWYN6ID5Hbf6CbY5
	 Ve/nD/s3H3U5DWYeAaNDwVbX8E6Gb7IPERCGcNCw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B9A66F80137;
	Fri,  5 Jul 2019 09:09:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 04576F80135; Fri,  5 Jul 2019 09:09:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,ENV_AND_HDR_SPF_MATCH,SPF_HELO_NONE,SPF_PASS,
 T_PDS_NO_HELO_DNS,URIBL_BLOCKED,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
 autolearn=disabled version=3.4.0
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com
 [IPv6:2607:f8b0:4864:20::341])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 64902F800E7
 for <alsa-devel@alsa-project.org>; Fri,  5 Jul 2019 09:09:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 64902F800E7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="Hn5+GLp2"
Received: by mail-ot1-x341.google.com with SMTP id o101so8106967ota.8
 for <alsa-devel@alsa-project.org>; Fri, 05 Jul 2019 00:09:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+HA1gRJUU1q/vq10J2Cj5qnKuph6mRHyYxPoVAGdEoY=;
 b=Hn5+GLp28rD0iRoGwRHbRq7GRqhDGFy99Nq0elsuKdVJNwUHVcdvJRg+gisPdFcpAZ
 qEdsBQ/afocCCAKXjvk+7j6rsUbqRcawLyzd70CSM0IbNIX9k0WdbOckw9qauhSBUKbs
 KsS8UCyQhKHpbg2mJG97lYMWJdWnZIc9xlhH1aPkk/x65Lyq+DEu9zuQz3itB4uXU5Jx
 Wp2757OkuQRX27nYk26bC5yZaCPgQVKegnpuEwUi3IhMmeam8wEmZq0QBjIAZzjRK2Vy
 J6XUiGXIqYCImxBzdj/5HNLtVcjYug3zt2+FpURR/lYSVsNYx9z7L0YratiSYcZPpaf3
 EX3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+HA1gRJUU1q/vq10J2Cj5qnKuph6mRHyYxPoVAGdEoY=;
 b=UdcLnd2iJ/vs8Go5A9nGeWH1efFPEpxabEaqg/Z/ucsB/Sn5f8SrqUtZV5DoQKRwa3
 FYzC3WaoYE/le0S83LZPWb+VDXbFHKUudZeiKO7orbPtj/15fWxG4kDiy8WEqlYQ2Oeo
 6JVhvKA4FbG0hWfiZNEF4dMjEBX5BrIGCSOKnU+ZiSyKNnCd9F4Jdypx28bRiuNiVhuG
 LCHG52fumFmQBu7EAumwtdalCE/pXugFGymCxhhi8hTWDQc8leHNj/eQs2Sufx9FgSHY
 EypyObwLss9iQXiI0Iy57j0TODBd2mNHJ1QNItB489CJWv1iVn2l0GjClNaNskbkYGJ0
 oP8w==
X-Gm-Message-State: APjAAAU+OzJZCCe9n1t0HAacxkR3DGxJkbWpYX927ixSd5pkaKLpCzk1
 BmYkuyMGMC9UDDi4N7cFGFJtUr+dHXhzPbirgF1TLQ==
X-Google-Smtp-Source: APXvYqx8fFkXm04Sl60WDxMfdqFj9kg/zYj7b4ElJ1xZR84JewuoulDPbrbiGgNIHjmSgRkaFR30qgpyyakxkZEcxHc=
X-Received: by 2002:a9d:6195:: with SMTP id g21mr1790572otk.103.1562310559416; 
 Fri, 05 Jul 2019 00:09:19 -0700 (PDT)
MIME-Version: 1.0
References: <20190705042623.129541-1-cychiang@chromium.org>
 <20190705042623.129541-3-cychiang@chromium.org>
In-Reply-To: <20190705042623.129541-3-cychiang@chromium.org>
From: Tzung-Bi Shih <tzungbi@google.com>
Date: Fri, 5 Jul 2019 15:09:08 +0800
Message-ID: <CA+Px+wWwudeG5BLOkgcq_sJqfTxmre1O=XqU8OM6oqC966TUuQ@mail.gmail.com>
To: Cheng-Yi Chiang <cychiang@chromium.org>
Cc: ALSA development <alsa-devel@alsa-project.org>, dianders@chromium.org,
 Heiko Stuebner <heiko@sntech.de>, Liam Girdwood <lgirdwood@gmail.com>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Takashi Iwai <tiwai@suse.com>, tzungbi@chromium.org,
 linux-kernel@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>,
 Andrzej Hajda <a.hajda@samsung.com>, Russell King <rmk+kernel@armlinux.org.uk>,
 Mark Brown <broonie@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Daniel Vetter <daniel@ffwll.ch>, linux-rockchip@lists.infradead.org,
 dgreid@chromium.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [alsa-devel] [PATCH 2/4] drm: bridge: dw-hdmi: Report connector
	status using callback
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

On Fri, Jul 5, 2019 at 12:26 PM Cheng-Yi Chiang <cychiang@chromium.org> wrote:
> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-audio.h b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-audio.h
> index 63b5756f463b..f523c590984e 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-audio.h
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-audio.h
> @@ -2,6 +2,8 @@
>  #ifndef DW_HDMI_AUDIO_H
>  #define DW_HDMI_AUDIO_H
>
> +#include <sound/hdmi-codec.h>
> +
>  struct dw_hdmi;
>
>  struct dw_hdmi_audio_data {
> @@ -17,6 +19,7 @@ struct dw_hdmi_i2s_audio_data {
>
>         void (*write)(struct dw_hdmi *hdmi, u8 val, int offset);
>         u8 (*read)(struct dw_hdmi *hdmi, int offset);
> +       int (*set_plugged_cb)(struct dw_hdmi *hdmi, hdmi_codec_plugged_cb fn);
>  };
>
>  #endif
> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-i2s-audio.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-i2s-audio.c
> index 5cbb71a866d5..7b93cf05c985 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-i2s-audio.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-i2s-audio.c
> @@ -104,10 +104,20 @@ static int dw_hdmi_i2s_get_dai_id(struct snd_soc_component *component,
>         return -EINVAL;
>  }
>
> +static int dw_hdmi_i2s_hook_plugged_cb(struct device *dev, void *data,
> +                                      hdmi_codec_plugged_cb fn)
> +{
> +       struct dw_hdmi_i2s_audio_data *audio = data;
> +       struct dw_hdmi *hdmi = audio->hdmi;
> +
> +       return audio->set_plugged_cb(hdmi, fn);
> +}
> +
The first parameter dev could be removed.  Not used.

>  static struct hdmi_codec_ops dw_hdmi_i2s_ops = {
>         .hw_params      = dw_hdmi_i2s_hw_params,
>         .audio_shutdown = dw_hdmi_i2s_audio_shutdown,
>         .get_dai_id     = dw_hdmi_i2s_get_dai_id,
> +       .hook_plugged_cb = dw_hdmi_i2s_hook_plugged_cb,
>  };
>
>  static int snd_dw_hdmi_probe(struct platform_device *pdev)
> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> index 045b1b13fd0e..c69a399fc7ca 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> @@ -26,6 +26,8 @@
>  #include <drm/drm_probe_helper.h>
>  #include <drm/bridge/dw_hdmi.h>
>
> +#include <sound/hdmi-codec.h>
> +
>  #include <uapi/linux/media-bus-format.h>
>  #include <uapi/linux/videodev2.h>
>
> @@ -185,6 +187,9 @@ struct dw_hdmi {
>         void (*disable_audio)(struct dw_hdmi *hdmi);
>
>         struct cec_notifier *cec_notifier;
> +
> +       hdmi_codec_plugged_cb plugged_cb;
> +       enum drm_connector_status last_connector_result;
>  };
>
>  #define HDMI_IH_PHY_STAT0_RX_SENSE \
> @@ -209,6 +214,17 @@ static inline u8 hdmi_readb(struct dw_hdmi *hdmi, int offset)
>         return val;
>  }
>
> +static int hdmi_set_plugged_cb(struct dw_hdmi *hdmi, hdmi_codec_plugged_cb fn)
> +{
> +       mutex_lock(&hdmi->mutex);
> +       hdmi->plugged_cb = fn;
> +       if (hdmi->audio && !IS_ERR(hdmi->audio))
I would expect if IS_ERR(hdmi->audio), then this should not be called
(i.e. should exit somewhere earlier).

> +               fn(hdmi->audio,
> +                  hdmi->last_connector_result == connector_status_connected);
> +       mutex_unlock(&hdmi->mutex);
> +       return 0;
> +}
> +
>  static void hdmi_modb(struct dw_hdmi *hdmi, u8 data, u8 mask, unsigned reg)
>  {
>         regmap_update_bits(hdmi->regm, reg << hdmi->reg_shift, mask, data);
> @@ -2044,6 +2060,7 @@ dw_hdmi_connector_detect(struct drm_connector *connector, bool force)
>  {
>         struct dw_hdmi *hdmi = container_of(connector, struct dw_hdmi,
>                                              connector);
> +       enum drm_connector_status result;
>
>         mutex_lock(&hdmi->mutex);
>         hdmi->force = DRM_FORCE_UNSPECIFIED;
> @@ -2051,7 +2068,20 @@ dw_hdmi_connector_detect(struct drm_connector *connector, bool force)
>         dw_hdmi_update_phy_mask(hdmi);
>         mutex_unlock(&hdmi->mutex);
>
> -       return hdmi->phy.ops->read_hpd(hdmi, hdmi->phy.data);
> +       result = hdmi->phy.ops->read_hpd(hdmi, hdmi->phy.data);
> +
> +       mutex_lock(&hdmi->mutex);
> +       if (result != hdmi->last_connector_result) {
> +               dev_dbg(hdmi->dev, "read_hpd result: %d", result);
> +               if (hdmi->plugged_cb && hdmi->audio && !IS_ERR(hdmi->audio)) {
Share the same concern above.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
