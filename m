Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A710BB6290
	for <lists+alsa-devel@lfdr.de>; Wed, 18 Sep 2019 13:54:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 39485167F;
	Wed, 18 Sep 2019 13:54:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 39485167F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1568807699;
	bh=DPTyM7bw1cN7rhKHpzOsi8xgW0QgaMfyT+eiYqNonkw=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=N5LDv2vgMUIZwyOsa60M0j6k2CbJNisqEhEZC9Oe9X5KgKjyl42loT6sIH3Mrz6lh
	 525hZ1eUvSzoIFHXNl+qK56xsvmLAA0ETR+XnkV6i7mREgtjJNasoyauuZAnUZuwlZ
	 yPO0jHvIRukHvYk8RXWNEBAKuXKrbnYYlFIHxdFI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 257D4F80527;
	Wed, 18 Sep 2019 13:53:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 63EDDF80506; Wed, 18 Sep 2019 13:53:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID, DKIM_VALID_AU, HEADER_FROM_DIFFERENT_DOMAINS, SPF_HELO_NONE,
 SPF_PASS, 
 URIBL_BLOCKED,USER_IN_DEF_SPF_WL autolearn=disabled version=3.4.0
Received: from mail-vs1-xe43.google.com (mail-vs1-xe43.google.com
 [IPv6:2607:f8b0:4864:20::e43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9F310F800C1
 for <alsa-devel@alsa-project.org>; Wed, 18 Sep 2019 13:53:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9F310F800C1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="fego5LxI"
Received: by mail-vs1-xe43.google.com with SMTP id b123so4254198vsb.5
 for <alsa-devel@alsa-project.org>; Wed, 18 Sep 2019 04:53:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1KlX045+but4kZYDkxl79NCCq10iOcslEdRaiYLes50=;
 b=fego5LxIL6sB7nuVbbaJVJB9N7WNC8aIjmYR0y5szXrjm/cLvc2AEl4CT76peU8LyO
 ovgIJAkEcVdo/HQkTbgy73bCOznMQ54xCR6vuEpJF43zd/anX3d2aaBum9pZVtNEW2/S
 KaQ6549ctO0oKG1CzL2x+C+6Ci98YSp8YZRfo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1KlX045+but4kZYDkxl79NCCq10iOcslEdRaiYLes50=;
 b=fzLFc+BOms0XwvNVFkIZCMz3HVinaX1dYVR+P0v/y+sZTYevt/54QeZgo9YtWTl4X6
 LGFgrmxrqWgZFQwOkRepPhBYMmHauJsUwpB+5Zd3WH7zFod47XfQuEyXocvbepTiItk9
 FcyKLQjfFvi3uT9GNgDlM/bNOlGbGBSAR8CCGOiK65nlOSy7peNb+lW/eydHvGv/Wum1
 YUDhpX1KtJNuFcVpToIANc0rrCID0U85cfsFiv8j6xRtPoGWfrbVUV/Cd/Vuj5X2zgx0
 E+IP92N6/w3sNmO+7Sjsp5G3Hv9DMwmmmKTvW/PAZMFbIsoaFOP0ih4HCq2s4CIUfJnT
 tRfA==
X-Gm-Message-State: APjAAAXrGuf12We0UQmOLqeUO4WE+XGR06Qj7Jbrl6Vwzs6wBkduvYYu
 pEKRQCeDeARtvMA1lsdmqwLxsAuRBWdM9gqga+lEfg==
X-Google-Smtp-Source: APXvYqyhL40Vy4UIINlY/uIQouC/knlNQeJfWaG2W2HqYygbGI5RQ+ggz1DPkhARkI89YhNy/gvof3y7jgV5PmDT70U=
X-Received: by 2002:a67:db8d:: with SMTP id f13mr1855977vsk.163.1568807586619; 
 Wed, 18 Sep 2019 04:53:06 -0700 (PDT)
MIME-Version: 1.0
References: <20190918082500.209281-1-cychiang@chromium.org>
 <20190918082500.209281-3-cychiang@chromium.org>
 <1j7e663sfu.fsf@starbuckisacylon.baylibre.com>
In-Reply-To: <1j7e663sfu.fsf@starbuckisacylon.baylibre.com>
From: Cheng-yi Chiang <cychiang@chromium.org>
Date: Wed, 18 Sep 2019 19:52:39 +0800
Message-ID: <CAFv8Nw+JssR+qJYWaQAjDRbHuNidHXQBPLsbOM7kNs4MN-Nkkw@mail.gmail.com>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>, Heiko Stuebner <heiko@sntech.de>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, linux-kernel <linux-kernel@vger.kernel.org>,
 Hans Verkuil <hverkuil@xs4all.nl>, Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Takashi Iwai <tiwai@suse.com>, linux-rockchip@lists.infradead.org,
 Dylan Reid <dgreid@chromium.org>, tzungbi@chromium.org,
 Jonas Karlman <jonas@kwiboo.se>, Liam Girdwood <lgirdwood@gmail.com>,
 Russell King <rmk+kernel@armlinux.org.uk>, Mark Brown <broonie@kernel.org>,
 linux-arm-kernel@lists.infradead.org, Jernej Skrabec <jernej.skrabec@siol.net>,
 Doug Anderson <dianders@chromium.org>, Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [alsa-devel] [PATCH v6 2/4] drm: dw-hdmi-i2s: Use fixed id for
	codec device
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

On Wed, Sep 18, 2019 at 4:43 PM Jerome Brunet <jbrunet@baylibre.com> wrote:
>
>
> On Wed 18 Sep 2019 at 10:24, Cheng-Yi Chiang <cychiang@chromium.org> wrote:
>
> > The problem of using auto ID is that the device name will be like
> > hdmi-audio-codec.<id number>.auto.
> >
> > The number might be changed when there are other platform devices being
> > created before hdmi-audio-codec device.
> > Use a fixed name so machine driver can set codec name on the DAI link.
> >
> > Using the fixed name should be fine because there will only be one
> > hdmi-audio-codec device.
>
> While this is true all platforms we know of (I suppose), It might not be
> the case later on. I wonder if making such assumption is really
> desirable in a code which is used by quite a few different platforms.
>
> Instead of trying to predict what the device name will be, can't you just
> query it in your machine driver ? Using a device tree phandle maybe ?
>
> It is quite usual to set the dai links this way, "simple-card" is a good
> example of this.
>

Hi Jerome,
Thanks for the quick reply!
And thanks for pointing this out.
I found that
soc_component_to_node searches upward for one layer so it can find the
node which creates hdmi-audio-codec in runtime. This works even that
hdmi-audio-codec does not have its own node in dts.
I will change accordingly in v7.
Thanks!



> >
> > Fix the codec name in rockchip rk3288_hdmi_analog machine driver.
> >
> > Signed-off-by: Cheng-Yi Chiang <cychiang@chromium.org>
> > ---
> >  drivers/gpu/drm/bridge/synopsys/dw-hdmi-i2s-audio.c | 2 +-
> >  sound/soc/rockchip/rk3288_hdmi_analog.c             | 3 ++-
> >  2 files changed, 3 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-i2s-audio.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-i2s-audio.c
> > index d7e65c869415..86bd482b9f94 100644
> > --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-i2s-audio.c
> > +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-i2s-audio.c
> > @@ -193,7 +193,7 @@ static int snd_dw_hdmi_probe(struct platform_device *pdev)
> >
> >       memset(&pdevinfo, 0, sizeof(pdevinfo));
> >       pdevinfo.parent         = pdev->dev.parent;
> > -     pdevinfo.id             = PLATFORM_DEVID_AUTO;
> > +     pdevinfo.id             = PLATFORM_DEVID_NONE;
> >       pdevinfo.name           = HDMI_CODEC_DRV_NAME;
> >       pdevinfo.data           = &pdata;
> >       pdevinfo.size_data      = sizeof(pdata);
> > diff --git a/sound/soc/rockchip/rk3288_hdmi_analog.c b/sound/soc/rockchip/rk3288_hdmi_analog.c
> > index 767700c34ee2..8286025a8747 100644
> > --- a/sound/soc/rockchip/rk3288_hdmi_analog.c
> > +++ b/sound/soc/rockchip/rk3288_hdmi_analog.c
> > @@ -15,6 +15,7 @@
> >  #include <linux/gpio.h>
> >  #include <linux/of_gpio.h>
> >  #include <sound/core.h>
> > +#include <sound/hdmi-codec.h>
> >  #include <sound/jack.h>
> >  #include <sound/pcm.h>
> >  #include <sound/pcm_params.h>
> > @@ -142,7 +143,7 @@ static const struct snd_soc_ops rk_ops = {
> >  SND_SOC_DAILINK_DEFS(audio,
> >       DAILINK_COMP_ARRAY(COMP_EMPTY()),
> >       DAILINK_COMP_ARRAY(COMP_CODEC(NULL, NULL),
> > -                        COMP_CODEC("hdmi-audio-codec.2.auto", "i2s-hifi")),
> > +                        COMP_CODEC(HDMI_CODEC_DRV_NAME, "i2s-hifi")),
> >       DAILINK_COMP_ARRAY(COMP_EMPTY()));
> >
> >  static struct snd_soc_dai_link rk_dailink = {
>
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
