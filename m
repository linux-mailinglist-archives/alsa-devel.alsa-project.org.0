Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 276626354A
	for <lists+alsa-devel@lfdr.de>; Tue,  9 Jul 2019 14:01:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AE9F31669;
	Tue,  9 Jul 2019 14:00:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AE9F31669
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1562673673;
	bh=e6Ri4rPpzh5HmDFeoAPrYPXNvjekSWN0TLi8Sel7lm0=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MjxVSO+YrdQ3IAK/x4RGRdla4NNVCLbGgIxwzGMXUkLTi/xePcWGbQih7feKIDOSz
	 u4sapfw3od/jlv2PyQL4BdCk//HiOwZgGyLVvsW7X2v8jlzhZbxrgKuzztZorzLmxE
	 5jyheec2RRa5DuCGzPOzpgHK1MiuiJOLmuGLgM60=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F41ADF80273;
	Tue,  9 Jul 2019 13:59:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9F122F80274; Tue,  9 Jul 2019 13:59:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,PDS_NO_HELO_DNS,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_IN_DEF_SPF_WL autolearn=disabled
 version=3.4.0
Received: from mail-vs1-xe44.google.com (mail-vs1-xe44.google.com
 [IPv6:2607:f8b0:4864:20::e44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1A7E5F800E2
 for <alsa-devel@alsa-project.org>; Tue,  9 Jul 2019 13:59:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1A7E5F800E2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="b6eUu3HO"
Received: by mail-vs1-xe44.google.com with SMTP id k9so10435097vso.5
 for <alsa-devel@alsa-project.org>; Tue, 09 Jul 2019 04:59:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RiTv9D9r+HWewv08+uDjzds8jJ160NpsMW3nG+2KdoY=;
 b=b6eUu3HOZ32VMVxihS1TEiZDDJGMWpTKkUmCzgDy0Wn1UIqQ2Hg/sRGYSq7RTss8Dt
 EUsDIbda6QYf9S42qsjMSo76RaQmk/AXAegCp/GvMR+GeNmoH1GewBpHbDxaucdsY43j
 Ic831T+DuHkmI1k4SYW5LLWcFpi0VyYWE6dxU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RiTv9D9r+HWewv08+uDjzds8jJ160NpsMW3nG+2KdoY=;
 b=bAa6decKmHcBBjlzzbSzUT1UiBI0KG+zZxyUrchS7vjrOxtzSJJnbrR8S8uVCpdINr
 WrJldM3rGy/jc0Q4kyBHXGg+Qr0QVsHBq3ruuPgkH167j2vb+2Y6Ko4YI40JFrxdg+Hc
 36neRzaDSbwW3DgBN8Nagq1cY+jhNb8nYxRRImy3+s0FfbuxKpttACDQnQND1ot6ivi0
 FqnfUxdShRFVuzU2q1A2ysFW5TWF4d1zVzsNl15UHFzOKrrGJigzXh852ULDC9q/ANsM
 lMzzzUcQJzec3koMqv8kOie1yE8ykwSjgyW3ne+v44E0/SQzyBAE3ygn6h/t1lYs4tY5
 h7Ww==
X-Gm-Message-State: APjAAAWDEk2Anauh2fhj+rOXUA1i8rkn2seCprdw4BovBef9Wyqi+dtP
 qGtj9YDTV9n3kwFTuQHs2ow4r0wRwIMuHfLWtucgLQ==
X-Google-Smtp-Source: APXvYqyNbkbPQt5s+GfBLT3QI7iGlZiQWtRzOE3HxXG0lIDjqNAi3SYslwEYCGrQlbUmVYhU38as6OOl9n5yJb/dYW4=
X-Received: by 2002:a67:d386:: with SMTP id b6mr14020005vsj.170.1562673563188; 
 Tue, 09 Jul 2019 04:59:23 -0700 (PDT)
MIME-Version: 1.0
References: <20190705042623.129541-1-cychiang@chromium.org>
 <20190705042623.129541-2-cychiang@chromium.org>
 <CA+Px+wXtmf9dQQP7ywPLp7Qbbvqau=WnO3qhZ8+qmbJD1gjx+A@mail.gmail.com>
 <20190705121240.GA20625@sirena.org.uk>
 <CAFv8NwLP-hUBW8FZW5kooaggeNRG7LAEd2pd_-70YBrVMY-+CQ@mail.gmail.com>
In-Reply-To: <CAFv8NwLP-hUBW8FZW5kooaggeNRG7LAEd2pd_-70YBrVMY-+CQ@mail.gmail.com>
From: Cheng-yi Chiang <cychiang@chromium.org>
Date: Tue, 9 Jul 2019 19:58:56 +0800
Message-ID: <CAFv8NwJHpY+ptc+WbeRhsKB8wGnt08r38GG7WUYTrt=wZaGqqA@mail.gmail.com>
To: Mark Brown <broonie@kernel.org>
Cc: ALSA development <alsa-devel@alsa-project.org>,
 Doug Anderson <dianders@chromium.org>, Heiko Stuebner <heiko@sntech.de>,
 Liam Girdwood <lgirdwood@gmail.com>, David Airlie <airlied@linux.ie>,
 linux-kernel <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 Takashi Iwai <tiwai@suse.com>, tzungbi@chromium.org,
 Hans Verkuil <hverkuil@xs4all.nl>, Tzung-Bi Shih <tzungbi@google.com>,
 Russell King <rmk+kernel@armlinux.org.uk>, Andrzej Hajda <a.hajda@samsung.com>,
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

On Mon, Jul 8, 2019 at 1:03 PM Cheng-yi Chiang <cychiang@chromium.org> wrote:
>
> On Fri, Jul 5, 2019 at 8:12 PM Mark Brown <broonie@kernel.org> wrote:
> >
> > On Fri, Jul 05, 2019 at 03:08:37PM +0800, Tzung-Bi Shih wrote:
> > > On Fri, Jul 5, 2019 at 12:26 PM Cheng-Yi Chiang <cychiang@chromium.org> wrote:
> >
> > > > +typedef void (*hdmi_codec_plugged_cb)(struct platform_device *dev,
> > > > +                                     bool plugged);
> > > > +
> >
> > > The callback prototype is "weird" by struct platform_device.  Is it
> > > possible to having snd_soc_component instead of platform_device?
> >
> > Or if it's got to be a device why not just a generic device so
> > we're not tied to a particular bus here?
>
> My intention was to invoke the call in dw-hdmi.c like this:
>
>     hdmi->plugged_cb(hdmi->audio,
>                                    result == connector_status_connected);
>
> Here hdmi->audio is a platform_device.
> I think dw-hdmi can not get  snd_soc_component easily.
> I can use a generic device here so the ops is more general.
> The calling will be like
>     hdmi->plugged_cb(&hdmi->audio->dev,
>                                    result == connector_status_connected);
> I will update this in v2.
> Thanks!

I have thought about this a bit more. And I think the more proper
interface is to pass in a generic struct device* for codec.
This way, the user of hdmi-codec driver on the DRM side is not limited
to the relation chain of
audio platform device -> codec platform device, which is just a
special case in dw-hdmi driver.
As long as DRM side can get hdmi-codec device pointer through
drv_data, it can use this callback.
Hope this makes the interface more generic.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
