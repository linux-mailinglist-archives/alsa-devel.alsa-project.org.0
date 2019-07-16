Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7253B6A837
	for <lists+alsa-devel@lfdr.de>; Tue, 16 Jul 2019 14:06:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F30BB168C;
	Tue, 16 Jul 2019 14:05:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F30BB168C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563278807;
	bh=XXhSXwLC52ZnAmGqTWfPLhzH5HNbNwkwCXyaFRV9ZgE=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NCM3+15hQOIAWoaSBU1Ls11N3MAmvjhvvmjtobjVmAfg/jlfhz/BMuTAv3toTgPvb
	 t+i3hYlCifUHvY0b0YEhXioDZIMPuY5iLoq+USjlg68SlM/YjRfY/lG1XNHERrm6lC
	 Ms+aAEkDIjte48KWVipL4gGTQ+2EuvzETVLjTM3U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5037BF80376;
	Tue, 16 Jul 2019 14:05:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AD8E7F80376; Tue, 16 Jul 2019 14:04:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID, DKIM_VALID_AU, HEADER_FROM_DIFFERENT_DOMAINS, SPF_HELO_NONE,
 SPF_PASS, 
 URIBL_BLOCKED,USER_IN_DEF_SPF_WL autolearn=disabled version=3.4.0
Received: from mail-vk1-xa44.google.com (mail-vk1-xa44.google.com
 [IPv6:2607:f8b0:4864:20::a44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0407EF800C4
 for <alsa-devel@alsa-project.org>; Tue, 16 Jul 2019 14:04:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0407EF800C4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="mkw993/n"
Received: by mail-vk1-xa44.google.com with SMTP id w186so4112501vkd.11
 for <alsa-devel@alsa-project.org>; Tue, 16 Jul 2019 05:04:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=P7ULxAuKEaSYzWYdGTr4IlP25QOrvD8KBofH6zWNyzQ=;
 b=mkw993/neQKAw2c2FfYVkxn+sOjDePcI0SFBqSo2uQ9XgxU7qFjPiY3YH5IUddHb1f
 0Zi+0q7QkAQBUfFLrw7PZjyy/zDoBIwIax+0NNKvtUxDk8C+SkzNSpFCXzQ0EZg4L/nh
 NgyhuIC9Ws15LrFjfBQKOKwslddMzuYtVkZiU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=P7ULxAuKEaSYzWYdGTr4IlP25QOrvD8KBofH6zWNyzQ=;
 b=sus/ZIIn2mKUKVXnyuqPlof/K3bTaZmmmj2dGOdUG27Rf7rDjn4WOehWlp01Xx18OM
 OebWw5kV0Kp1Z9+fz/RHrGn8cFzDwlDdEw/8gGwGQIvHVVQ3ezS6MwsEOcnWkn/kmCmd
 b13H8HLWPvs7g6FHwrm42VTCPAucdlFMG4k+7QE4L5hrRTDWCQmOVTq5j5U0jBSiRZva
 51YAhSMqceyGQ/gvwDhZbR/XZHWqxU0yebhgszU62lQCd7Szp4UUBEndVWFZIIWau3qW
 VoWeFIjcbFjXd4kI2Oa9W5Btv/5dk1EQmja1D4ePUa31iJBsvYGBfyv1mfJjgCn60Wfh
 QE2g==
X-Gm-Message-State: APjAAAUmjT8wFxFJD5QeqfYw/ana8Xdy0NHILi2y+3bwvJ6F0lvY+3aP
 lkajSqDkVbmPJDHPtsIQYLVD6FCffm1BFWFwzBHkyw==
X-Google-Smtp-Source: APXvYqyV5nIBgRiOBlht43v8TH2KL+F06jklrgKSVXF6ezSHVkI2KPhvG8Y407cVFJ0e5gFjSSA+0asgnIsC1+p+aiY=
X-Received: by 2002:a1f:3692:: with SMTP id d140mr11929548vka.88.1563278694560; 
 Tue, 16 Jul 2019 05:04:54 -0700 (PDT)
MIME-Version: 1.0
References: <20190712100443.221322-1-cychiang@chromium.org>
 <20190712100443.221322-3-cychiang@chromium.org>
 <20190712104748.zlgxgdjbtj2gw4yz@shell.armlinux.org.uk>
In-Reply-To: <20190712104748.zlgxgdjbtj2gw4yz@shell.armlinux.org.uk>
From: Cheng-yi Chiang <cychiang@chromium.org>
Date: Tue, 16 Jul 2019 20:04:28 +0800
Message-ID: <CAFv8NwLBr+USzOJvSZzMt_EzxA=07-NTGzuKdusaMxbFyrBjFQ@mail.gmail.com>
To: Russell King - ARM Linux admin <linux@armlinux.org.uk>
Cc: "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>, tzungbi@chromium.org,
 Heiko Stuebner <heiko@sntech.de>, Liam Girdwood <lgirdwood@gmail.com>,
 David Airlie <airlied@linux.ie>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, Doug Anderson <dianders@chromium.org>,
 Hans Verkuil <hverkuil@xs4all.nl>, linux-rockchip@lists.infradead.org,
 Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Daniel Vetter <daniel@ffwll.ch>, Dylan Reid <dgreid@chromium.org>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [alsa-devel] [PATCH v3 2/5] drm: bridge: dw-hdmi: Report
 connector status using callback
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

On Fri, Jul 12, 2019 at 6:48 PM Russell King - ARM Linux admin
<linux@armlinux.org.uk> wrote:
>
> On Fri, Jul 12, 2019 at 06:04:40PM +0800, Cheng-Yi Chiang wrote:
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
> >
> > Signed-off-by: Cheng-Yi Chiang <cychiang@chromium.org>
> > ---
> >  .../gpu/drm/bridge/synopsys/dw-hdmi-audio.h   |  3 +
> >  .../drm/bridge/synopsys/dw-hdmi-i2s-audio.c   | 10 ++++
> >  drivers/gpu/drm/bridge/synopsys/dw-hdmi.c     | 55 ++++++++++++++++++-
> >  3 files changed, 67 insertions(+), 1 deletion(-)
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
> > index 045b1b13fd0e..ce6646067472 100644
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
> > @@ -209,6 +214,40 @@ static inline u8 hdmi_readb(struct dw_hdmi *hdmi, int offset)
> >       return val;
> >  }
> >
> > +static void handle_plugged_change(struct dw_hdmi *hdmi, bool plugged)
> > +{
> > +     struct platform_device *codec_pdev;
> > +
> > +     if (!hdmi->audio || IS_ERR(hdmi->audio))
> > +             return;
> > +     codec_pdev = platform_get_drvdata(hdmi->audio);
> > +     if (!codec_pdev || IS_ERR(codec_pdev))
> > +             return;
>
> This looks fragile to me, poking about in another device's driver data
> from another driver is really not a good design decision.  I think this
> can be simplified if the registration function took the function
> pointer and the struct device pointer, and then you only need one test
> below:
>
Hi Russell, Thank you for the detailed review.
ACK to this suggestion.
I have updated the registration function following your suggestion in v4.
It looks much cleaner.

> > +     if (!hdmi->plugged_cb)
> > +             return;
> > +
> > +     hdmi->plugged_cb(&codec_pdev->dev, plugged);
> > +}
> > +
> > +static int hdmi_set_plugged_cb(struct dw_hdmi *hdmi, hdmi_codec_plugged_cb fn)
> > +{
> > +     bool plugged;
> > +     struct platform_device *codec_pdev;
> > +
> > +     if (!hdmi->audio || IS_ERR(hdmi->audio))
> > +             return -EINVAL;
>
> Given the current code structure, how can this ever be true when the
> function is called?
>
ACK
Removed in v4.
> > +     codec_pdev = platform_get_drvdata(hdmi->audio);
> > +     if (!codec_pdev || IS_ERR(codec_pdev))
> > +             return -EINVAL;
>
> This doesn't seem like a good idea as I've pointed out above.
>
ACK
Fixed in v4.
> > +
> > +     mutex_lock(&hdmi->mutex);
> > +     hdmi->plugged_cb = fn;
> > +     plugged = hdmi->last_connector_result == connector_status_connected;
> > +     handle_plugged_change(hdmi, plugged);
> > +     mutex_unlock(&hdmi->mutex);
>
> Should be a blank line here for readability.
>
ACK
Fixed in v4.
> > +     return 0;
> > +}
> > +
> >  static void hdmi_modb(struct dw_hdmi *hdmi, u8 data, u8 mask, unsigned reg)
> >  {
> >       regmap_update_bits(hdmi->regm, reg << hdmi->reg_shift, mask, data);
> > @@ -2044,6 +2083,7 @@ dw_hdmi_connector_detect(struct drm_connector *connector, bool force)
> >  {
> >       struct dw_hdmi *hdmi = container_of(connector, struct dw_hdmi,
> >                                            connector);
> > +     enum drm_connector_status result;
> >
> >       mutex_lock(&hdmi->mutex);
> >       hdmi->force = DRM_FORCE_UNSPECIFIED;
> > @@ -2051,7 +2091,18 @@ dw_hdmi_connector_detect(struct drm_connector *connector, bool force)
> >       dw_hdmi_update_phy_mask(hdmi);
> >       mutex_unlock(&hdmi->mutex);
> >
> > -     return hdmi->phy.ops->read_hpd(hdmi, hdmi->phy.data);
> > +     result = hdmi->phy.ops->read_hpd(hdmi, hdmi->phy.data);
> > +
> > +     mutex_lock(&hdmi->mutex);
> > +     if (result != hdmi->last_connector_result) {
> > +             dev_dbg(hdmi->dev, "read_hpd result: %d", result);
> > +             handle_plugged_change(hdmi,
> > +                                   result == connector_status_connected);
> > +             hdmi->last_connector_result = result;
> > +     }
> > +     mutex_unlock(&hdmi->mutex);
> > +
> > +     return result;
> >  }
> >
> >  static int dw_hdmi_connector_get_modes(struct drm_connector *connector)
> > @@ -2460,6 +2511,7 @@ __dw_hdmi_probe(struct platform_device *pdev,
> >       hdmi->rxsense = true;
> >       hdmi->phy_mask = (u8)~(HDMI_PHY_HPD | HDMI_PHY_RX_SENSE);
> >       hdmi->mc_clkdis = 0x7f;
> > +     hdmi->last_connector_result = connector_status_disconnected;
> >
> >       mutex_init(&hdmi->mutex);
> >       mutex_init(&hdmi->audio_mutex);
> > @@ -2653,6 +2705,7 @@ __dw_hdmi_probe(struct platform_device *pdev,
> >               audio.hdmi      = hdmi;
> >               audio.write     = hdmi_writeb;
> >               audio.read      = hdmi_readb;
> > +             audio.set_plugged_cb = hdmi_set_plugged_cb;
>
> Why is this necessary?
>
> The I2S audio driver already depends on the dw-hdmi module through its
> use of functions already exported.  Indirecting this through the
> platform data makes no sense.
>
> Just rename hdmi_set_plugged_cb to dw_hdmi_set_plugged_cb() and export
> it for dw-hdmi-i2s-audio.c to use.
ACK.
Your suggestion makes sense.
Removed in v4.

>
> Thanks.
Thanks so much!

>
> --
> RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
> FTTC broadband for 0.8mile line in suburbia: sync at 12.1Mbps down 622kbps up
> According to speedtest.net: 11.9Mbps down 500kbps up
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
