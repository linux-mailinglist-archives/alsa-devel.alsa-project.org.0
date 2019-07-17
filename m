Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A31CC6B479
	for <lists+alsa-devel@lfdr.de>; Wed, 17 Jul 2019 04:19:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 017401686;
	Wed, 17 Jul 2019 04:18:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 017401686
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563329986;
	bh=6PEH95DFoqWrEVpEa7qWjFrYpAMY4IEw+uRdygKT+WA=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jFZ0Prt2gmuTE6LN/3uINx9ngRF051KeepZf8vmb3c4ubyHyPGdiPEIFJ+e3Z3MhL
	 1pA5cdFNvY5MghjFYfSdwW2FV6uT31taCivQmJ8k8IfzOPX1h0WIIKsEQ9nvctIN9P
	 Vq8CRfhohykzP3Gf+QpRB5gKug+Q1j5b/ejNjxC0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 893A3F80363;
	Wed, 17 Jul 2019 04:18:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 612B9F80363; Wed, 17 Jul 2019 04:17:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID, DKIM_VALID_AU, HEADER_FROM_DIFFERENT_DOMAINS, SPF_HELO_NONE,
 SPF_PASS, 
 URIBL_BLOCKED,USER_IN_DEF_SPF_WL autolearn=disabled version=3.4.0
Received: from mail-vs1-xe41.google.com (mail-vs1-xe41.google.com
 [IPv6:2607:f8b0:4864:20::e41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C91B7F800C4
 for <alsa-devel@alsa-project.org>; Wed, 17 Jul 2019 04:17:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C91B7F800C4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="nUiqNxzK"
Received: by mail-vs1-xe41.google.com with SMTP id m8so15418039vsj.0
 for <alsa-devel@alsa-project.org>; Tue, 16 Jul 2019 19:17:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Yeo9/78yIZ/9VC2V6OzC4jD48Q2tlshLhO2xlpzyNJY=;
 b=nUiqNxzKLCH4uh7Rdk28OYJeCqZg+QKn/Ua3o40RM8WpdDaG3iflhnr8M/qkqbKcgw
 MB6O6mEn6WPNEgokSircT8LHVL2pkHwIAhiObF6mtO0l5foVBQDuDCYQgfQ/yKy2vod1
 EiRO1lNXlRxUc2xtXifWRV0NCnbRPoBSHfW0o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Yeo9/78yIZ/9VC2V6OzC4jD48Q2tlshLhO2xlpzyNJY=;
 b=ty6YNpT+dV36o8nSFepJGaXmRRQ09O+6RlWUbI/+b5SFuFRel+UXeVCyl2F1W+2VDo
 3eUpDsvEY0GsKmDn2hMq9nh7G9f/H0+6MbW60sahul/ft1LtMI+a9OjEQQXUnj3lG1lw
 vfNkowl4+rc0loRoPLKciq3phjuPkxS5s7Z86mogJjGPtms5He5JNb4oV4oOZE+P4ePw
 uKH7gL/aTdOhNugwwWMmGqLr5XmREEgsCMDDMcC95U4+Db3eXQAHRgVAi+YqZ3alUixV
 Rxi+2kQWcIdAgeKdHn8SHu4ldzOJini42tD4acnxRgoU5LgVRegAbSdyyc9oZ5k7Oj+X
 X+vg==
X-Gm-Message-State: APjAAAUYM6ERruebAhvPK9tDcbdhOahwUBHeiumkIjJXd1U8tH7YkXei
 jbbsb1PPIx9CukHBqPnyhbWkOWDeiLKZHvcYIWHU9Q==
X-Google-Smtp-Source: APXvYqxWnVBbK8jRKVsd6t2y7gQJuZMs4DlVLf7zXq9OOaLMsZSZoBF8H9LF78AxDMSny/dXL5TfEDzdnilbzMthY7M=
X-Received: by 2002:a67:ebcb:: with SMTP id y11mr13049180vso.138.1563329872293; 
 Tue, 16 Jul 2019 19:17:52 -0700 (PDT)
MIME-Version: 1.0
References: <20190716115725.66558-1-cychiang@chromium.org>
 <20190716115725.66558-3-cychiang@chromium.org>
 <CA+Px+wWuCBvWra8+=szQOrvr3iv2YPMeoHHVtJ1vmaZWEEQ44A@mail.gmail.com>
In-Reply-To: <CA+Px+wWuCBvWra8+=szQOrvr3iv2YPMeoHHVtJ1vmaZWEEQ44A@mail.gmail.com>
From: Cheng-yi Chiang <cychiang@chromium.org>
Date: Wed, 17 Jul 2019 10:17:25 +0800
Message-ID: <CAFv8NwKVEpnUi=+Hvi1_2vdYqWFd49zu8eoQbMwnjg6i_PGhcA@mail.gmail.com>
To: Tzung-Bi Shih <tzungbi@google.com>
Cc: ALSA development <alsa-devel@alsa-project.org>,
 Douglas Anderson <dianders@chromium.org>, Heiko Stuebner <heiko@sntech.de>,
 Liam Girdwood <lgirdwood@gmail.com>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Takashi Iwai <tiwai@suse.com>,
 tzungbi@chromium.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Hans Verkuil <hverkuil@xs4all.nl>, Andrzej Hajda <a.hajda@samsung.com>,
 Russell King <rmk+kernel@armlinux.org.uk>, Mark Brown <broonie@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Daniel Vetter <daniel@ffwll.ch>, linux-rockchip@lists.infradead.org,
 Dylan Reid <dgreid@chromium.org>, linux-arm-kernel@lists.infradead.org
Subject: Re: [alsa-devel] [PATCH v4 2/5] drm: bridge: dw-hdmi: Report
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

On Tue, Jul 16, 2019 at 10:13 PM Tzung-Bi Shih <tzungbi@google.com> wrote:
>
> On Tue, Jul 16, 2019 at 7:57 PM Cheng-Yi Chiang <cychiang@chromium.org> wrote:
> >
> > Change the Kconfig of DRM_DW_HDMI so it selects SND_SOC_HDMI_CODEC.
> > This is for the typedef of hdmi_codec_plugged_cb to be used in dw-hdmi.c.
> Not sure why you select SND_SOC_HDMI_CODEC in this patch.  To have
> definition of hdmi_codec_plugged_cb, include hdmi-codec.h should be
> sufficient.
>
Thank you for the review!
I misunderstood when to change Kconfig.
Will fix in v5.
> >
> > diff --git a/drivers/gpu/drm/bridge/synopsys/Kconfig b/drivers/gpu/drm/bridge/synopsys/Kconfig
> > index 21a1be3ced0f..309da052db97 100644
> > --- a/drivers/gpu/drm/bridge/synopsys/Kconfig
> > +++ b/drivers/gpu/drm/bridge/synopsys/Kconfig
> > @@ -4,6 +4,7 @@ config DRM_DW_HDMI
> >         select DRM_KMS_HELPER
> >         select REGMAP_MMIO
> >         select CEC_CORE if CEC_NOTIFIER
> > +       select SND_SOC_HDMI_CODEC
> So that it is weird to select this option.
>
Will be removed in v5.
Thanks!
> >
> >  config DRM_DW_HDMI_AHB_AUDIO
> >         tristate "Synopsys Designware AHB Audio interface"
> > @@ -20,7 +21,6 @@ config DRM_DW_HDMI_I2S_AUDIO
> >         tristate "Synopsys Designware I2S Audio interface"
> >         depends on SND_SOC
> >         depends on DRM_DW_HDMI
> > -       select SND_SOC_HDMI_CODEC
> Also strange for deselecting the option.  Should be in another commit
> for another reason?
Will be removed in v5.
Thanks!
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
