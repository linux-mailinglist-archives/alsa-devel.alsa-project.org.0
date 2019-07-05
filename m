Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F09AB60186
	for <lists+alsa-devel@lfdr.de>; Fri,  5 Jul 2019 09:33:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6C8AC16A0;
	Fri,  5 Jul 2019 09:32:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6C8AC16A0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1562312024;
	bh=R6JoEZ7rSGbTYO66vLrPQNEJ05s6HdgjOuwg5zqYq6I=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UFl6iE0no3THsAteBZE2uNHVA17pv8DY5OnEyeCuCc3Hglf8z1SBwwE62Cew0q7sJ
	 oNS7toLYj/Ffe2PddeblQ4y9ec6Nrpp/3MXOGgMaczty/q64tlOn2KEtAN1dj9hGRl
	 WahQ7f9twWCUQAp+gbcuAuZ56SEU6RsUbd6BKYaA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 814D9F80133;
	Fri,  5 Jul 2019 09:31:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 563ACF8011F; Fri,  5 Jul 2019 09:31:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID, DKIM_VALID_AU, HEADER_FROM_DIFFERENT_DOMAINS, SPF_HELO_NONE,
 SPF_PASS, 
 T_PDS_NO_HELO_DNS,URIBL_BLOCKED,USER_IN_DEF_SPF_WL autolearn=disabled
 version=3.4.0
Received: from mail-vs1-xe43.google.com (mail-vs1-xe43.google.com
 [IPv6:2607:f8b0:4864:20::e43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2B1E4F800E6
 for <alsa-devel@alsa-project.org>; Fri,  5 Jul 2019 09:31:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2B1E4F800E6
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="NCAVIjM5"
Received: by mail-vs1-xe43.google.com with SMTP id j26so3269480vsn.10
 for <alsa-devel@alsa-project.org>; Fri, 05 Jul 2019 00:31:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rMd1u8f9GUtGM2BNqO4dxPBPUfEK4qgo6+64JcBSfZo=;
 b=NCAVIjM5oXEoOyTfLc1j5S059x2rfCv7/17EWp9Et1EVImM8xhz2b6qhUPm19tM+aD
 3+ZVdwnBS+Jajb4BoM70kV1GQ47wbUmxTn50xE4ev9Bx8gVtRLhl8fBx3ZksvBDiuqrQ
 xUg2H8J4gy8WPGrDWXxNkCsWaztk5/XXtdEP4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rMd1u8f9GUtGM2BNqO4dxPBPUfEK4qgo6+64JcBSfZo=;
 b=G4imcrpsHWCWl0O+0zMYlbmrEPhJ6rqJkZ3u944qtmb8yaQaL66cNF6XESyiLxq+9g
 d+kAtq2AoNqoYM1HhApmGfjdk93AdkmCiswZKkxIFSoMskLA9dZMmYdp0SGfbLPD10G0
 DPAluHLjHuAdeg1xgiu4q8CKnyeGY0yZSYVSOtNTh1MDB08Bugs2hKIeorIpHtcHppm5
 dZQsSul4q5UbjbWzv807aKRsDaLdoiL30uMSIPmkRSykQDbiAYVO0K62eDea/4gFQOV1
 sEgabVlzGVi/YdLZ+bFdtAKzS42La/uDA9rsWJ7P8Riy1/2fZfcfwTU/31KhPgblpMz2
 0+Sw==
X-Gm-Message-State: APjAAAV5IRJWw8k81FkodvstR73cLOLl+EDl92Sz3g6TGlb+47so9Php
 W8o5ntHDLAlyi+QpBau3BUKSkmnTWeo6R620MIN/Ag==
X-Google-Smtp-Source: APXvYqz5mVOrkTHRsNytg+i93CjQ2GDoPSDWloDYQwydMlp+jUPs4nifh/0Ua8DYEXIwTxR4ajiGrHIn+cmJ3Pylqm0=
X-Received: by 2002:a67:eada:: with SMTP id s26mr1279515vso.163.1562311911794; 
 Fri, 05 Jul 2019 00:31:51 -0700 (PDT)
MIME-Version: 1.0
References: <20190705042623.129541-1-cychiang@chromium.org>
 <20190705042623.129541-3-cychiang@chromium.org>
 <VI1PR06MB41425D1F24AC653F08AFA463ACF50@VI1PR06MB4142.eurprd06.prod.outlook.com>
In-Reply-To: <VI1PR06MB41425D1F24AC653F08AFA463ACF50@VI1PR06MB4142.eurprd06.prod.outlook.com>
From: Cheng-yi Chiang <cychiang@chromium.org>
Date: Fri, 5 Jul 2019 15:31:24 +0800
Message-ID: <CAFv8NwJXbJo=z_NDj+JQHD9LOmnbfM8v_N1uHn4sdBzF-FZQfA@mail.gmail.com>
To: Jonas Karlman <jonas@kwiboo.se>
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "tzungbi@chromium.org" <tzungbi@chromium.org>,
 Heiko Stuebner <heiko@sntech.de>, Liam Girdwood <lgirdwood@gmail.com>,
 David Airlie <airlied@linux.ie>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "dianders@chromium.org" <dianders@chromium.org>,
 Hans Verkuil <hverkuil@xs4all.nl>,
 "linux-rockchip@lists.infradead.org" <linux-rockchip@lists.infradead.org>,
 Russell King <rmk+kernel@armlinux.org.uk>, Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Daniel Vetter <daniel@ffwll.ch>, "dgreid@chromium.org" <dgreid@chromium.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
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

On Fri, Jul 5, 2019 at 1:45 PM Jonas Karlman <jonas@kwiboo.se> wrote:
>
> On 2019-07-05 06:26, Cheng-Yi Chiang wrote:
> > Allow codec driver register callback function for plug event.
> >
> > The callback registration flow:
> > dw-hdmi <--- hw-hdmi-i2s-audio <--- hdmi-codec
> >
> > dw-hdmi-i2s-audio implements hook_plugged_cb op
> > so codec driver can register the callback.
> >
> > dw-hdmi implements set_plugged_cb op so platform device can register the
> > callback.
> >
> > When connector plug/unplug event happens, report this event using the
> > callback.
> >
> > Make sure that audio and drm are using the single source of truth for
> > connector status.
>
> I have a similar notification need for making a snd_ctl_notify() call from hdmi-codec when ELD changes,
> see [1] for work in progress patches (part of a dw-hdmi multi-channel lpcm series I am preparing).
>
> Any suggestions on how to handle a ELD change notification?
> Should I use a similar pattern as in this series?

Hi Jonas, I think we are using a very similar pattern.
The difference is that in my series the function is not exposed on hdmi-codec.h.
I think your method makes sense for your case because
dw-hdmi-i2s-audio.c needs to access and update data inside
dw_hdmi_i2s_audio_data,
while in my use case it is only a thin layer setting up the callback
for jack status.

> (I lost track of the hdmi-notifier/drm_audio_component discussion)
>

It was a long discussion.
I think the conclusion was that if we are only talking about
hdmi-codec, then we just need to extend the ops exposed in hdmi-codec
and don't need to use
hdmi-notifier or drm_audio_component.

> [1] https://github.com/Kwiboo/linux-rockchip/compare/54b40fdd264c7ed96017271eb6524cca4ff755ab...9c17284e8a8657e8b1da53a1c7ff056cbd8ce43c
>
> Best regards,
> Jonas
>
> >
> > Signed-off-by: Cheng-Yi Chiang <cychiang@chromium.org>
> > ---
> >  .../gpu/drm/bridge/synopsys/dw-hdmi-audio.h   |  3 ++
> >  .../drm/bridge/synopsys/dw-hdmi-i2s-audio.c   | 10 ++++++
> >  drivers/gpu/drm/bridge/synopsys/dw-hdmi.c     | 34 ++++++++++++++++++-
> >  3 files changed, 46 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-audio.h b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-audio.h
> > index 63b5756f463b..f523c590984e 100644
> > --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-audio.h
> > +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-audio.h
> > @@ -2,6 +2,8 @@
> >  #ifndef DW_HDMI_AUDIO_H
> >  #define DW_HDMI_AUDIO_H
> >
> > +#include <sound/hdmi-codec.h>
> > +
> >  struct dw_hdmi;
> >
> >  struct dw_hdmi_audio_data {
> > @@ -17,6 +19,7 @@ struct dw_hdmi_i2s_audio_data {
> >
> >       void (*write)(struct dw_hdmi *hdmi, u8 val, int offset);
> >       u8 (*read)(struct dw_hdmi *hdmi, int offset);
> > +     int (*set_plugged_cb)(struct dw_hdmi *hdmi, hdmi_codec_plugged_cb fn);
> >  };
> >
> >  #endif
> > diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-i2s-audio.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-i2s-audio.c
> > index 5cbb71a866d5..7b93cf05c985 100644
> > --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-i2s-audio.c
> > +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-i2s-audio.c
> > @@ -104,10 +104,20 @@ static int dw_hdmi_i2s_get_dai_id(struct snd_soc_component *component,
> >       return -EINVAL;
> >  }
> >
> > +static int dw_hdmi_i2s_hook_plugged_cb(struct device *dev, void *data,
> > +                                    hdmi_codec_plugged_cb fn)
> > +{
> > +     struct dw_hdmi_i2s_audio_data *audio = data;
> > +     struct dw_hdmi *hdmi = audio->hdmi;
> > +
> > +     return audio->set_plugged_cb(hdmi, fn);
> > +}
> > +
> >  static struct hdmi_codec_ops dw_hdmi_i2s_ops = {
> >       .hw_params      = dw_hdmi_i2s_hw_params,
> >       .audio_shutdown = dw_hdmi_i2s_audio_shutdown,
> >       .get_dai_id     = dw_hdmi_i2s_get_dai_id,
> > +     .hook_plugged_cb = dw_hdmi_i2s_hook_plugged_cb,
> >  };
> >
> >  static int snd_dw_hdmi_probe(struct platform_device *pdev)
> > diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> > index 045b1b13fd0e..c69a399fc7ca 100644
> > --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> > +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> > @@ -26,6 +26,8 @@
> >  #include <drm/drm_probe_helper.h>
> >  #include <drm/bridge/dw_hdmi.h>
> >
> > +#include <sound/hdmi-codec.h>
> > +
> >  #include <uapi/linux/media-bus-format.h>
> >  #include <uapi/linux/videodev2.h>
> >
> > @@ -185,6 +187,9 @@ struct dw_hdmi {
> >       void (*disable_audio)(struct dw_hdmi *hdmi);
> >
> >       struct cec_notifier *cec_notifier;
> > +
> > +     hdmi_codec_plugged_cb plugged_cb;
> > +     enum drm_connector_status last_connector_result;
> >  };
> >
> >  #define HDMI_IH_PHY_STAT0_RX_SENSE \
> > @@ -209,6 +214,17 @@ static inline u8 hdmi_readb(struct dw_hdmi *hdmi, int offset)
> >       return val;
> >  }
> >
> > +static int hdmi_set_plugged_cb(struct dw_hdmi *hdmi, hdmi_codec_plugged_cb fn)
> > +{
> > +     mutex_lock(&hdmi->mutex);
> > +     hdmi->plugged_cb = fn;
> > +     if (hdmi->audio && !IS_ERR(hdmi->audio))
> > +             fn(hdmi->audio,
> > +                hdmi->last_connector_result == connector_status_connected);
> > +     mutex_unlock(&hdmi->mutex);
> > +     return 0;
> > +}
> > +
> >  static void hdmi_modb(struct dw_hdmi *hdmi, u8 data, u8 mask, unsigned reg)
> >  {
> >       regmap_update_bits(hdmi->regm, reg << hdmi->reg_shift, mask, data);
> > @@ -2044,6 +2060,7 @@ dw_hdmi_connector_detect(struct drm_connector *connector, bool force)
> >  {
> >       struct dw_hdmi *hdmi = container_of(connector, struct dw_hdmi,
> >                                            connector);
> > +     enum drm_connector_status result;
> >
> >       mutex_lock(&hdmi->mutex);
> >       hdmi->force = DRM_FORCE_UNSPECIFIED;
> > @@ -2051,7 +2068,20 @@ dw_hdmi_connector_detect(struct drm_connector *connector, bool force)
> >       dw_hdmi_update_phy_mask(hdmi);
> >       mutex_unlock(&hdmi->mutex);
> >
> > -     return hdmi->phy.ops->read_hpd(hdmi, hdmi->phy.data);
> > +     result = hdmi->phy.ops->read_hpd(hdmi, hdmi->phy.data);
> > +
> > +     mutex_lock(&hdmi->mutex);
> > +     if (result != hdmi->last_connector_result) {
> > +             dev_dbg(hdmi->dev, "read_hpd result: %d", result);
> > +             if (hdmi->plugged_cb && hdmi->audio && !IS_ERR(hdmi->audio)) {
> > +                     hdmi->plugged_cb(hdmi->audio,
> > +                                      result == connector_status_connected);
> > +                     hdmi->last_connector_result = result;
> > +             }
> > +     }
> > +     mutex_unlock(&hdmi->mutex);
> > +
> > +     return result;
> >  }
> >
> >  static int dw_hdmi_connector_get_modes(struct drm_connector *connector)
> > @@ -2460,6 +2490,7 @@ __dw_hdmi_probe(struct platform_device *pdev,
> >       hdmi->rxsense = true;
> >       hdmi->phy_mask = (u8)~(HDMI_PHY_HPD | HDMI_PHY_RX_SENSE);
> >       hdmi->mc_clkdis = 0x7f;
> > +     hdmi->last_connector_result = connector_status_disconnected;
> >
> >       mutex_init(&hdmi->mutex);
> >       mutex_init(&hdmi->audio_mutex);
> > @@ -2653,6 +2684,7 @@ __dw_hdmi_probe(struct platform_device *pdev,
> >               audio.hdmi      = hdmi;
> >               audio.write     = hdmi_writeb;
> >               audio.read      = hdmi_readb;
> > +             audio.set_plugged_cb = hdmi_set_plugged_cb;
> >               hdmi->enable_audio = dw_hdmi_i2s_audio_enable;
> >               hdmi->disable_audio = dw_hdmi_i2s_audio_disable;
> >
>
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
