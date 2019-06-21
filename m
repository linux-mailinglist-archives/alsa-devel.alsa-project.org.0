Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E7824E452
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Jun 2019 11:42:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1BD6D1663;
	Fri, 21 Jun 2019 11:41:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1BD6D1663
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1561110123;
	bh=ngqa47QShYQYNcRb/VhxpKKInFH6Mp6EbL2i6qbNaro=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nPzrn4MR0WMS7J9lmVFEOqPb5G5Z/C7GJ/72aDDt9bFjWSPYyQZBrKWXhuQ9vMNW5
	 QE+enWNS4z9v5oFhWMWH+OqAIWSD91GcceMxtqPyybVP+ksbsnh25FqFfrUHqK0eWW
	 7BBpc3HCNTPa7iToLy/nOC8wgCOk74sRMfSEPoXU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 43AD6F89682;
	Fri, 21 Jun 2019 11:40:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 03DA8F896B8; Fri, 21 Jun 2019 11:40:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,PRX_BODY_65,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_IN_DEF_SPF_WL autolearn=disabled
 version=3.4.0
Received: from mail-vk1-xa43.google.com (mail-vk1-xa43.google.com
 [IPv6:2607:f8b0:4864:20::a43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D9D4EF80059
 for <alsa-devel@alsa-project.org>; Fri, 21 Jun 2019 11:40:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D9D4EF80059
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="aISYU0Au"
Received: by mail-vk1-xa43.google.com with SMTP id b64so1155309vke.13
 for <alsa-devel@alsa-project.org>; Fri, 21 Jun 2019 02:40:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8vCdcbqoZQ1U1i7mBxY4bPH1TOrRBXQaqjxbkNh/nbQ=;
 b=aISYU0AuOWSMAGgxgMsNgcwyyCsQfgC0WTiJZVc6DjDjjnxMKUEageDY0FcrkMp5o7
 ifs6RlrFO0OjnAJaxSecDeakh4ZBOJPZ3vTpXi66AbMzyFoXJ4nrLFwPI1pk8zMLyg1v
 CuJnbc9bE0uzsi55qKLvlz/emOEVFfRxcBzaA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8vCdcbqoZQ1U1i7mBxY4bPH1TOrRBXQaqjxbkNh/nbQ=;
 b=PEtKDBMdWpvKPAEQEPBiSNTx1FYk1Glc+FNTeIcxb60NwJHcZckrUJBAb/LDe+DftM
 3phZhbmQFUg7ZpKlZVT5ld6e3g8hrApdxEyTT63YqKgE7JSADV9Q0O3mKbEAz9MkxBq8
 k/9nkmWLfxELim3bmU8s/do+8E97hdgYZOy0f6QdLnkhDQtIcdTS0QLebunw3b/m/TxL
 dZ1CIZymtRuo/ToznLhi1K+9uXMmWCRmjWo/TPJ0Z8BW1MDyAbwbvmIMJSoCyaA3X+cj
 ygNd0IK2GtmAYN0JLgMto4QPBd+bOi3qiNYoVKbfqEnsI4vwhF0afbxOHr0JrvF1UIcX
 g8LA==
X-Gm-Message-State: APjAAAWAijDMjJ3Sa+zAtct/pjSfiQJWw/SY+UFgNO+JKS7yGz63FRzK
 qa2IjUGrQqzc6ZalqCWbqi7/p/QTmuzbRANqYgwCAg==
X-Google-Smtp-Source: APXvYqzqmaV63/sDh2pA+DmjqQt0rIScMqSjGIjM8UgwlzzNNUo2pMiNP3RyCDxLsaSVfiTVd9xkzA40WBjyjKt8VfQ=
X-Received: by 2002:a1f:3692:: with SMTP id d140mr9227965vka.88.1561110010447; 
 Fri, 21 Jun 2019 02:40:10 -0700 (PDT)
MIME-Version: 1.0
References: <20190603080931.GG21222@phenom.ffwll.local>
 <CAFv8Nw+1sB8i1d87vLeKxRricZOi4gnXFSgOzW9k0sa_Tzybjg@mail.gmail.com>
 <20190604072411.GP21222@phenom.ffwll.local>
 <CAFv8NwKL9ZL=gNpDmdRV+R9eq22+Da_1kzuYBv8kMMyV3Hq14g@mail.gmail.com>
 <20190611123455.GD2458@phenom.ffwll.local>
 <CAFv8NwJxs-R=ehgeqyx=e+T5OmUBsk3uWnUb2t0cC-LDPS7G5w@mail.gmail.com>
 <20190618121220.GU12905@phenom.ffwll.local>
 <CAFv8NwLci2ALi3V-e=8jjatciHWOoOj-FeajwNLWRpWRtqgBdg@mail.gmail.com>
 <20190620092506.GP12905@phenom.ffwll.local>
 <CAFv8NwLbS_f4cfeorzqtmRzQSY0u1tgM7fitAokg_QfViPvq=Q@mail.gmail.com>
 <20190620211204.GW12905@phenom.ffwll.local>
In-Reply-To: <20190620211204.GW12905@phenom.ffwll.local>
From: Cheng-yi Chiang <cychiang@chromium.org>
Date: Fri, 21 Jun 2019 17:39:43 +0800
Message-ID: <CAFv8Nw+m-+pshD_cxKe4Nc_4wP3ttpAfDU7EFb-e+ZBcYNA51Q@mail.gmail.com>
To: Cheng-yi Chiang <cychiang@chromium.org>, Hans Verkuil <hverkuil@xs4all.nl>,
 linux-kernel <linux-kernel@vger.kernel.org>, 
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Mark Brown <broonie@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Jaroslav Kysela <perex@perex.cz>, 
 Russell King <rmk+kernel@armlinux.org.uk>, Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 David Airlie <airlied@linux.ie>, 
 Rob Herring <robh+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Doug Anderson <dianders@chromium.org>, Dylan Reid <dgreid@chromium.org>,
 tzungbi@chromium.org, linux-media@vger.kernel.org, 
 "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>, dri-devel@lists.freedesktop.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 devicetree@vger.kernel.org, Dariusz Marcinkiewicz <darekm@google.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [alsa-devel] [PATCH 1/7] video: add HDMI state notifier support
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

On Fri, Jun 21, 2019 at 5:12 AM Daniel Vetter <daniel@ffwll.ch> wrote:
>
> Massively cutting this thread, since halfway through in my previous reply
> I realized that maybe hdmi_codec is a much better starting point.
>
ACK
> On Thu, Jun 20, 2019 at 09:23:23PM +0800, Cheng-yi Chiang wrote:
> > On Thu, Jun 20, 2019 at 5:25 PM Daniel Vetter <daniel@ffwll.ch> wrote:
> > > Yeah fully agreeing that hdmi_audio_code is probably a better starting
> > > point. Problem is that becuase hdmi_codec is built on top of platform
> > > device it's quite a bit harder to extend with callbacks and things like
> > > that, without breaking the driver model.
> > >
> > > I need to think about this more, but if all we need to look at is
> > > hdmi_codec, then I think this becomes a lot easier. And we can ignore
> > > drm_audio_component.h completely.
> >
> >
> > It is surprising that you think this way.
> > Maybe the original patch before hdmi-notifier was introduced is the
> > better way to solve this issue, if we only need to look at hdmi_codec.
> >
> > The history of hdmi_codec driver is in this patch series:
> >
> > https://lore.kernel.org/patchwork/patch/539656/
>
> Hm, this doesn't seem to be the hdmi_codec driver I meant, but another,
> new one. I was talking about SND_SOC_HDMI_CODEC.
>
Yes you are right. They are different codec drivers.
Sorry for the confusion. What I meant was that my use case on RK3288
was using dw-hdmi-audio.c codec driver,
which was later replaced by a more general version hdmi-codec.c.

> > There was a callback mechanism implemented between dw-hdmi and hdmi
> > codec driver.
> > It was later consolidated by Doug in this patch for better jack status
> > reporting:
> >
> > https://chromium-review.googlesource.com/c/chromiumos/third_party/kernel/+/303573/
>
> Hm that still seems entirely separate hdmi-codec specific to dw-hdmi only
> ...
>
Again you are right. Sorry for the confusion. What I meant is that
this callback mechanism should work on hdmi-codec.c driver as well.

> > I am not sure why the original patch series did not get fully accepted
> > in the upstream.
> > It was quite long time ago.
> >
> > But if you think this might be the right way to do, then it is even
> > better for us because the patch series and Doug's patch had been quite
> > stable
> > on our RK3288 products for about four years with plenty of users, so
> > we have much higher confidence in them.
> > I can rebase and clean up them and post another patch for review.
> >
> > Please let me know what approach you feel is better.
> > Thanks again!
>
> Not sure we're talking about the same. What I had in mind is to add jack
> status to the hdmi-codec.c stuff, which is used by multiple soc drm
> display drivers already. Looking at git grep output, there seems to be
> already some support for dw-hdmi synopsys drm_bridge driver. I thought of
> extending that. Does that not work for you?
>
I think extending current interface will work.
There is a struct hdmi_codec_pdata to let ALSA codec driver access
some ops through platform data.
And after this patch

https://lore.kernel.org/patchwork/patch/692324/

ALSA codec driver can get access to the struct on DRM side.
Based on this I can add a new ops to register callback function for jack status.
It will be similar to Doug's chromium patch above.
I think that is quite a feasible way, and can benefit all boards using
hdmi-codec.c.

Thanks a lot!!

> Thanks, Daniel
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
