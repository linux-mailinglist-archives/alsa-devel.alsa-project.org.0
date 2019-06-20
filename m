Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2329D4DC50
	for <lists+alsa-devel@lfdr.de>; Thu, 20 Jun 2019 23:14:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A43A19F6;
	Thu, 20 Jun 2019 23:13:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A43A19F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1561065241;
	bh=rEn2i2HBT9JsMLEM/SNcXECG2mXVeDsSJEPGQ0phPgM=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SoEmlNZzQgUMKMMlfXZBki8JeuQ8tCAeA/49aWX/6wqoyrJXHf1Jw4rTEijJZO5wi
	 6FAxTSBL7E5SHkSc/A02yCqEPUDLpKAofRvyjsLV84+ZELNJBmMl3ggTReEWHOZzuK
	 rknBKTZUgrYVVHreNJ47nw/fL2bC7GwCblfNct+I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 05A85F89717;
	Thu, 20 Jun 2019 23:12:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 708E1F89717; Thu, 20 Jun 2019 23:12:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_65,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AEE78F808AF
 for <alsa-devel@alsa-project.org>; Thu, 20 Jun 2019 23:12:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AEE78F808AF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch
 header.b="ZyyEIWc8"
Received: by mail-ed1-x544.google.com with SMTP id r12so6693911edo.5
 for <alsa-devel@alsa-project.org>; Thu, 20 Jun 2019 14:12:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:mail-followup-to
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=959ru36WY2J0Xrly1vs1MXuZnqXsrreyoL0xoecTXQA=;
 b=ZyyEIWc8g9qNg4ofLToKGhgAmro8fi/qsiplRDzzYnsQzgUBFe4c86Ee/wR4SebDjt
 d63ZPlgcJxB1wYNf1eIPn3M3bB13fdEww4NsSF+uA3/ahauLDZUM1S12sFjWLoIzrkEq
 HMbsASyI+4J0m7OfyVxoUW085H+KZiQlel8eY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to:user-agent;
 bh=959ru36WY2J0Xrly1vs1MXuZnqXsrreyoL0xoecTXQA=;
 b=Ydwgy777In/jfUe6r106SLZXkjLJEPoHtIvq4ePJu4NH+ZlnxJI+gNDSQNoOxTfSoR
 XicBywtHS8KWmCTZplgprQ9e5hBt49No4WAR5wMTBBI26Rg/82W0aQDKnvnl5nusFpLS
 YZwOG9e5qPtAc/iwN1LqMmC8Gq870uICOql/Uyf1oEa86YFsEtvn3Qt0fmYb8cnNIsaE
 OKWrr9OYK7VKw02T5RspmxHllG1LpLNh00BE9lSu1ak8ZfIaPs6G8+XFiEVipkOMcZT/
 zusNK/bp7gc7vyUAau9E9GBQtyELzm9ytnQOKDKFbse5Cez2LETIQSZcLxvt3+/zqPQc
 4FZQ==
X-Gm-Message-State: APjAAAUbc7CHftERfzv6MQCnF5NbHS/BHk7OHHDScQequcXdh+QtSsER
 HpVPb9XGWJU5cnQomVXDZGBzvw==
X-Google-Smtp-Source: APXvYqx3EnsHuhcIFTP2RIslvwoM3AQZ6N+bN+bCoN37PG+nA2hCPhd0nIWscWNoh843HbyPEoTJjw==
X-Received: by 2002:a17:906:2510:: with SMTP id
 i16mr98153366ejb.130.1561065130725; 
 Thu, 20 Jun 2019 14:12:10 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id p18sm76849ejr.61.2019.06.20.14.12.08
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 20 Jun 2019 14:12:09 -0700 (PDT)
Date: Thu, 20 Jun 2019 23:12:04 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Cheng-yi Chiang <cychiang@chromium.org>
Message-ID: <20190620211204.GW12905@phenom.ffwll.local>
Mail-Followup-To: Cheng-yi Chiang <cychiang@chromium.org>,
 Hans Verkuil <hverkuil@xs4all.nl>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Jaroslav Kysela <perex@perex.cz>,
 Russell King <rmk+kernel@armlinux.org.uk>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 David Airlie <airlied@linux.ie>, Rob Herring <robh+dt@kernel.org>,
 Heiko Stuebner <heiko@sntech.de>,
 Doug Anderson <dianders@chromium.org>,
 Dylan Reid <dgreid@chromium.org>, tzungbi@chromium.org,
 linux-media@vger.kernel.org,
 "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>, 
 dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
 Dariusz Marcinkiewicz <darekm@google.com>
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
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAFv8NwLbS_f4cfeorzqtmRzQSY0u1tgM7fitAokg_QfViPvq=Q@mail.gmail.com>
X-Operating-System: Linux phenom 4.19.0-5-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>, Heiko Stuebner <heiko@sntech.de>,
 Liam Girdwood <lgirdwood@gmail.com>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Takashi Iwai <tiwai@suse.com>,
 Hans Verkuil <hverkuil@xs4all.nl>, Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 linux-rockchip@lists.infradead.org, Dylan Reid <dgreid@chromium.org>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org, tzungbi@chromium.org,
 Daniel Vetter <daniel@ffwll.ch>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Russell King <rmk+kernel@armlinux.org.uk>, Rob Herring <robh+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Doug Anderson <dianders@chromium.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, Mark Brown <broonie@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Dariusz Marcinkiewicz <darekm@google.com>
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

Massively cutting this thread, since halfway through in my previous reply
I realized that maybe hdmi_codec is a much better starting point.

On Thu, Jun 20, 2019 at 09:23:23PM +0800, Cheng-yi Chiang wrote:
> On Thu, Jun 20, 2019 at 5:25 PM Daniel Vetter <daniel@ffwll.ch> wrote:
> > Yeah fully agreeing that hdmi_audio_code is probably a better starting
> > point. Problem is that becuase hdmi_codec is built on top of platform
> > device it's quite a bit harder to extend with callbacks and things like
> > that, without breaking the driver model.
> >
> > I need to think about this more, but if all we need to look at is
> > hdmi_codec, then I think this becomes a lot easier. And we can ignore
> > drm_audio_component.h completely.
> 
> 
> It is surprising that you think this way.
> Maybe the original patch before hdmi-notifier was introduced is the
> better way to solve this issue, if we only need to look at hdmi_codec.
> 
> The history of hdmi_codec driver is in this patch series:
> 
> https://lore.kernel.org/patchwork/patch/539656/

Hm, this doesn't seem to be the hdmi_codec driver I meant, but another,
new one. I was talking about SND_SOC_HDMI_CODEC.

> There was a callback mechanism implemented between dw-hdmi and hdmi
> codec driver.
> It was later consolidated by Doug in this patch for better jack status
> reporting:
> 
> https://chromium-review.googlesource.com/c/chromiumos/third_party/kernel/+/303573/

Hm that still seems entirely separate hdmi-codec specific to dw-hdmi only
...

> I am not sure why the original patch series did not get fully accepted
> in the upstream.
> It was quite long time ago.
> 
> But if you think this might be the right way to do, then it is even
> better for us because the patch series and Doug's patch had been quite
> stable
> on our RK3288 products for about four years with plenty of users, so
> we have much higher confidence in them.
> I can rebase and clean up them and post another patch for review.
> 
> Please let me know what approach you feel is better.
> Thanks again!

Not sure we're talking about the same. What I had in mind is to add jack
status to the hdmi-codec.c stuff, which is used by multiple soc drm
display drivers already. Looking at git grep output, there seems to be
already some support for dw-hdmi synopsys drm_bridge driver. I thought of
extending that. Does that not work for you?

Thanks, Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
