Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B23160193
	for <lists+alsa-devel@lfdr.de>; Fri,  5 Jul 2019 09:37:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A84B51699;
	Fri,  5 Jul 2019 09:36:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A84B51699
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1562312260;
	bh=kT72P7Ar8p8amLq+Gyf05cif/h1nEZLO6orR7LcoegM=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=No2K0B+OtPLXd8LLt/6jw1+5jJtyollY8tSQdPinZnAID9YlNNCWuQzPlAyPDQftT
	 nRV52ZW5bRd3/8MhJFti38soCDP9CgRttWI8LCZZoBequxEkDkERmn8xU6KJa488/Y
	 AJkwj6De/EJNbcSbTVtHzIjNeacBlPPmbsESKkOs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EC539F80133;
	Fri,  5 Jul 2019 09:35:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8E118F8011F; Fri,  5 Jul 2019 09:35:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID, DKIM_VALID_AU, HEADER_FROM_DIFFERENT_DOMAINS, SPF_HELO_NONE,
 SPF_PASS, 
 T_PDS_NO_HELO_DNS,URIBL_BLOCKED,USER_IN_DEF_SPF_WL autolearn=disabled
 version=3.4.0
Received: from mail-vs1-xe44.google.com (mail-vs1-xe44.google.com
 [IPv6:2607:f8b0:4864:20::e44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8BF1EF800E6
 for <alsa-devel@alsa-project.org>; Fri,  5 Jul 2019 09:35:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8BF1EF800E6
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="YlCq+DE8"
Received: by mail-vs1-xe44.google.com with SMTP id v129so3267955vsb.11
 for <alsa-devel@alsa-project.org>; Fri, 05 Jul 2019 00:35:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DICfq5XTcQzxq11n/NHs27mGioZf4mAb5LvXEz+xYZo=;
 b=YlCq+DE8tSdVqwbF3dpt0TH/SmtFyBBicmFzm5tIOkFu9Btry9eggH7ZbR7zIsjneP
 vl5S6rdRmPU2O0sguGIJrqbsKGX1U2kmIJ3+JV7oWErOccYdO7obFudkwSYRDf4dH5nu
 cljbA5+v7H9LJh5TheVtDJLkkn8k5OS1t+mj0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DICfq5XTcQzxq11n/NHs27mGioZf4mAb5LvXEz+xYZo=;
 b=r6yVp+9BCLSq4oYGQaWDg3MWLUseLeRCr6VSIP5IicZ3jDjCzjmiHpzNi0mblkp/p5
 le4d/q3fzqJKIju4krXJLNICE9LDEIcaqiQKRSHRHaLBddxpbh/IQTGwgfxNOTr3uawq
 LWwKNxSD3nQPj4G4ZzawmEEs8/81ajxaUpWV3SfhP4jvonRVWjlBE41VzscSHShaMIGT
 WvkwUNIFxgft9MVkxopvIty1Ko4c9bfO8GdpjLjTjwOzI1GC9K3RAAqBoXQhG4RZhDi/
 /RErznyyWk+6TGs872nNFpMwZMadYp6Q9+9v0jGya4zkembxxP59qQTonDXTbR6AM0v3
 N3Tg==
X-Gm-Message-State: APjAAAVgZzU7zMAMmuyfhUnI2cB8UZv2tWa2idNDkejeFqjCmWwFX6xw
 hvNdKfkZhOYV+CjBDi7Oo2Lf5eMhumQYCEp1ACDVwQ==
X-Google-Smtp-Source: APXvYqzc+pyNbVyeJdIdT5O/oHPA0+Ko7qWiAF8npTA/knIhPiNLZILpC61LRZIQfdUztKYjkkq02bq7H2jdTEwOT38=
X-Received: by 2002:a67:fb87:: with SMTP id n7mr1309522vsr.9.1562312148663;
 Fri, 05 Jul 2019 00:35:48 -0700 (PDT)
MIME-Version: 1.0
References: <20190705042623.129541-1-cychiang@chromium.org>
 <20190705042623.129541-3-cychiang@chromium.org>
 <CA+Px+wWwudeG5BLOkgcq_sJqfTxmre1O=XqU8OM6oqC966TUuQ@mail.gmail.com>
In-Reply-To: <CA+Px+wWwudeG5BLOkgcq_sJqfTxmre1O=XqU8OM6oqC966TUuQ@mail.gmail.com>
From: Cheng-yi Chiang <cychiang@chromium.org>
Date: Fri, 5 Jul 2019 15:35:22 +0800
Message-ID: <CAFv8NwJBSvN-7LRX8ZMOQ4hwQ1NA9y09L0tGOyCDvsXRbADUSA@mail.gmail.com>
To: Tzung-Bi Shih <tzungbi@google.com>
Cc: ALSA development <alsa-devel@alsa-project.org>,
 Doug Anderson <dianders@chromium.org>, Heiko Stuebner <heiko@sntech.de>,
 Liam Girdwood <lgirdwood@gmail.com>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Takashi Iwai <tiwai@suse.com>,
 tzungbi@chromium.org, linux-kernel <linux-kernel@vger.kernel.org>,
 Hans Verkuil <hverkuil@xs4all.nl>, Andrzej Hajda <a.hajda@samsung.com>,
 Russell King <rmk+kernel@armlinux.org.uk>, Mark Brown <broonie@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Daniel Vetter <daniel@ffwll.ch>, linux-rockchip@lists.infradead.org,
 Dylan Reid <dgreid@chromium.org>, linux-arm-kernel@lists.infradead.org
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

On Fri, Jul 5, 2019 at 3:09 PM Tzung-Bi Shih <tzungbi@google.com> wrote:
>
> On Fri, Jul 5, 2019 at 12:26 PM Cheng-Yi Chiang <cychiang@chromium.org> wrote:
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
> >         void (*write)(struct dw_hdmi *hdmi, u8 val, int offset);
> >         u8 (*read)(struct dw_hdmi *hdmi, int offset);
> > +       int (*set_plugged_cb)(struct dw_hdmi *hdmi, hdmi_codec_plugged_cb fn);
> >  };
> >
> >  #endif
> > diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-i2s-audio.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-i2s-audio.c
> > index 5cbb71a866d5..7b93cf05c985 100644
> > --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-i2s-audio.c
> > +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-i2s-audio.c
> > @@ -104,10 +104,20 @@ static int dw_hdmi_i2s_get_dai_id(struct snd_soc_component *component,
> >         return -EINVAL;
> >  }
> >
> > +static int dw_hdmi_i2s_hook_plugged_cb(struct device *dev, void *data,
> > +                                      hdmi_codec_plugged_cb fn)
> > +{
> > +       struct dw_hdmi_i2s_audio_data *audio = data;
> > +       struct dw_hdmi *hdmi = audio->hdmi;
> > +
> > +       return audio->set_plugged_cb(hdmi, fn);
> > +}
> > +
> The first parameter dev could be removed.  Not used.
>
Hi Tzungbi, thanks for the review.

I am not sure about this one.
I think it depends on the DRM driver so I need to keep both..
E.g.
drivers/gpu/drm/rockchip/cdn-dp-core.c
it needs dev to access the required data.
You can check this patch:

"efc9194bcff8  ASoC: hdmi-codec: callback function will be called with
private data"

It explains that some cases use *dev, some cases use *data.

> >  static struct hdmi_codec_ops dw_hdmi_i2s_ops = {
> >         .hw_params      = dw_hdmi_i2s_hw_params,
> >         .audio_shutdown = dw_hdmi_i2s_audio_shutdown,
> >         .get_dai_id     = dw_hdmi_i2s_get_dai_id,
> > +       .hook_plugged_cb = dw_hdmi_i2s_hook_plugged_cb,
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
> >         void (*disable_audio)(struct dw_hdmi *hdmi);
> >
> >         struct cec_notifier *cec_notifier;
> > +
> > +       hdmi_codec_plugged_cb plugged_cb;
> > +       enum drm_connector_status last_connector_result;
> >  };
> >
> >  #define HDMI_IH_PHY_STAT0_RX_SENSE \
> > @@ -209,6 +214,17 @@ static inline u8 hdmi_readb(struct dw_hdmi *hdmi, int offset)
> >         return val;
> >  }
> >
> > +static int hdmi_set_plugged_cb(struct dw_hdmi *hdmi, hdmi_codec_plugged_cb fn)
> > +{
> > +       mutex_lock(&hdmi->mutex);
> > +       hdmi->plugged_cb = fn;
> > +       if (hdmi->audio && !IS_ERR(hdmi->audio))
> I would expect if IS_ERR(hdmi->audio), then this should not be called
> (i.e. should exit somewhere earlier).
>
ACK. I should fix that.
Thanks!
> > +               fn(hdmi->audio,
> > +                  hdmi->last_connector_result == connector_status_connected);
> > +       mutex_unlock(&hdmi->mutex);
> > +       return 0;
> > +}
> > +
> >  static void hdmi_modb(struct dw_hdmi *hdmi, u8 data, u8 mask, unsigned reg)
> >  {
> >         regmap_update_bits(hdmi->regm, reg << hdmi->reg_shift, mask, data);
> > @@ -2044,6 +2060,7 @@ dw_hdmi_connector_detect(struct drm_connector *connector, bool force)
> >  {
> >         struct dw_hdmi *hdmi = container_of(connector, struct dw_hdmi,
> >                                              connector);
> > +       enum drm_connector_status result;
> >
> >         mutex_lock(&hdmi->mutex);
> >         hdmi->force = DRM_FORCE_UNSPECIFIED;
> > @@ -2051,7 +2068,20 @@ dw_hdmi_connector_detect(struct drm_connector *connector, bool force)
> >         dw_hdmi_update_phy_mask(hdmi);
> >         mutex_unlock(&hdmi->mutex);
> >
> > -       return hdmi->phy.ops->read_hpd(hdmi, hdmi->phy.data);
> > +       result = hdmi->phy.ops->read_hpd(hdmi, hdmi->phy.data);
> > +
> > +       mutex_lock(&hdmi->mutex);
> > +       if (result != hdmi->last_connector_result) {
> > +               dev_dbg(hdmi->dev, "read_hpd result: %d", result);
> > +               if (hdmi->plugged_cb && hdmi->audio && !IS_ERR(hdmi->audio)) {
> Share the same concern above.
ACK
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
