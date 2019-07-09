Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8148E6353E
	for <lists+alsa-devel@lfdr.de>; Tue,  9 Jul 2019 13:57:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0160A1668;
	Tue,  9 Jul 2019 13:56:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0160A1668
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1562673468;
	bh=s87MgcKlayAR5MaySj5xSNAeTl0M8o9LPk6qi8wJ6Rk=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pZbimgPZYPPq5Wzzqej/aseK75wA8kkdIPkkAru3ILJE0JH3I/xNrsINRivP+1vPe
	 QN3yDSSHgvdcdD1JseyORYAUTIsivOOg9/IZRGa3OV9a0ZWt15uxgRC6GoFDHtPuS1
	 HHv6ivlUy+elFzPCjqFtlYAXeTXPe6/1szOK59Ic=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7C36EF80276;
	Tue,  9 Jul 2019 13:56:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1B1EDF80274; Tue,  9 Jul 2019 13:56:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,PDS_NO_HELO_DNS,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_IN_DEF_SPF_WL autolearn=disabled
 version=3.4.0
Received: from mail-vs1-xe42.google.com (mail-vs1-xe42.google.com
 [IPv6:2607:f8b0:4864:20::e42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 59DB9F800E2
 for <alsa-devel@alsa-project.org>; Tue,  9 Jul 2019 13:55:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 59DB9F800E2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="Hif8gvZ3"
Received: by mail-vs1-xe42.google.com with SMTP id v129so10443894vsb.11
 for <alsa-devel@alsa-project.org>; Tue, 09 Jul 2019 04:55:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BVsg21whGsT0nCQujzZPC48g95cuUgQWLBZNQAx+pZc=;
 b=Hif8gvZ34qKJMh958dAAJSHO70lREX96FjBgtOfqYNFJyuQpBMR0C1BjfHgf8lDQ92
 sADjoOm6BOziZ8iFV4rfX/D+8PH0/e3yQd9VX01BYzeP27ufOcJLZvyArqht8aRbI3eJ
 IS7yqBpL3VKcMJ1o6/XM6Re5YNCRXm029XCfc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BVsg21whGsT0nCQujzZPC48g95cuUgQWLBZNQAx+pZc=;
 b=OzetVhvVnnbeN0gA6fZ8WUuE2g+eYKj9FHv+hXHqGWFxflZOinFJ4JokwKeBY8pf/o
 P92xhBZdiN3KdQmqsc2X4314jQq19Lw87ChCJgAULfRHuM9qHYTpQ1e43gsFJdAJ177K
 DdFXqhZRTjkq6OuCDFx0dPlnI0384f2Cm2nvQxz8gyQdYptjTBe5117Mr7gMhIZXPEBU
 Je2vZk8X/aM1lMC5o4xoNuBaUvOpuGF62iTYl3Ksn8ErbKMMYIJwlp/11WbJdnCvJ0CU
 NVLrg7y++eAZ/U8JyPYHZ3UqAeLBjZ8zkT5LEEHsUNoO8DlRIjfUybKqDbNOBOdBTgVx
 hyvQ==
X-Gm-Message-State: APjAAAWcH3k2bZ0YsU0WaGSjACxlJYO52VIe9042kbx/IJ1JneM0rr0h
 kvSvxIKBRrZ8DZlIRug1wWlcllgKWa9dgY5HP81tnA==
X-Google-Smtp-Source: APXvYqzIvsL1PEG4x0OPfoI+B4eR1OeQ7eQJVZ/D8bs1VUH/IGuRilDy9DOu2h4I32heosv7RyuyXtXOhjY3Ym1TCUo=
X-Received: by 2002:a67:ebcb:: with SMTP id y11mr13483911vso.138.1562673356146; 
 Tue, 09 Jul 2019 04:55:56 -0700 (PDT)
MIME-Version: 1.0
References: <20190705042623.129541-1-cychiang@chromium.org>
 <20190705042623.129541-2-cychiang@chromium.org>
 <3d5755cf-34e9-44f7-3b03-6bdfca84ff95@intel.com>
In-Reply-To: <3d5755cf-34e9-44f7-3b03-6bdfca84ff95@intel.com>
From: Cheng-yi Chiang <cychiang@chromium.org>
Date: Tue, 9 Jul 2019 19:55:29 +0800
Message-ID: <CAFv8NwLos-XcB9K8315vmmfKn+z0XaBph3QxSwrmqhfYqoju2Q@mail.gmail.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>, Doug Anderson <dianders@chromium.org>,
 Heiko Stuebner <heiko@sntech.de>, Liam Girdwood <lgirdwood@gmail.com>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Takashi Iwai <tiwai@suse.com>, tzungbi@chromium.org,
 linux-kernel <linux-kernel@vger.kernel.org>, Hans Verkuil <hverkuil@xs4all.nl>,
 Andrzej Hajda <a.hajda@samsung.com>, Russell King <rmk+kernel@armlinux.org.uk>,
 Mark Brown <broonie@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Daniel Vetter <daniel@ffwll.ch>, linux-rockchip@lists.infradead.org,
 Dylan Reid <dgreid@chromium.org>, linux-arm-kernel@lists.infradead.org
Subject: Re: [alsa-devel] [PATCH 1/4] ASoC: hdmi-codec: Add an op to set
 callback function for plug event
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

On Tue, Jul 9, 2019 at 7:47 PM Cezary Rojewski
<cezary.rojewski@intel.com> wrote:
>
> On 2019-07-05 06:26, Cheng-Yi Chiang wrote:
> > +static void hdmi_codec_jack_report(struct hdmi_codec_priv *hcp,
> > +                                unsigned int jack_status)
> > +{
> > +     if (!hcp->jack)
> > +             return;
> > +
> > +     if (jack_status != hcp->jack_status) {
> > +             snd_soc_jack_report(hcp->jack, jack_status, SND_JACK_LINEOUT);
> > +             hcp->jack_status = jack_status;
> > +     }
> > +}
>
> Single "if" statement instead? The first "if" does not even cover all
> cases - if the secondary check fails, you'll "return;" too.
>
ACK.
I will fix in v2.
> > +/**
> > + * hdmi_codec_set_jack_detect - register HDMI plugged callback
> > + * @component: the hdmi-codec instance
> > + * @jack: ASoC jack to report (dis)connection events on
> > + */
> > +int hdmi_codec_set_jack_detect(struct snd_soc_component *component,
> > +                            struct snd_soc_jack *jack)
> > +{
> > +     struct hdmi_codec_priv *hcp = snd_soc_component_get_drvdata(component);
> > +     int ret;
> > +
> > +     if (hcp->hcd.ops->hook_plugged_cb) {
> > +             hcp->jack = jack;
> > +             ret = hcp->hcd.ops->hook_plugged_cb(component->dev->parent,
> > +                                                 hcp->hcd.data,
> > +                                                 plugged_cb);
> > +             if (ret) {
> > +                     hcp->jack = NULL;
> > +                     return ret;
> > +             }
> > +             return 0;
> > +     }
> > +     return -EOPNOTSUPP;
> > +}
> > +EXPORT_SYMBOL_GPL(hdmi_codec_set_jack_detect);
>
> int ret = -EOPNOTSUPP;
> (...)
>
> return ret;
>
> In consequence, you can reduce the number of "return(s)" and also remove
> the redundant parenthesis for the if-statement used to set jack to NULL.
>
> Czarek
ACK
will fix in v2.

Thanks a lot for the review!
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
