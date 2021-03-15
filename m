Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7755633B21A
	for <lists+alsa-devel@lfdr.de>; Mon, 15 Mar 2021 13:07:12 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DB7BA1711;
	Mon, 15 Mar 2021 13:06:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DB7BA1711
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615810032;
	bh=jnCNw8FYTDMzF9GbZ0MD8cTZgBWfISm0ZH3FoBXDJdk=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WOi8DX20AdgpimF3JBmEWtrEB3VOs1fFQt/ATjPtJvfZZpkyho3YhpYSJiXbmyc9c
	 5ARjkBs3WEH7mc6yllwLZNJ5UZ42A96j51tjHiXTep6x4vLg4iGO5sURyHqfFZD1md
	 uOw3FKPsP9vXQqNwUBQlYuUJw1I3wyul9FqiQH74=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F3F6BF8010E;
	Mon, 15 Mar 2021 13:05:41 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 648B2F80171; Mon, 15 Mar 2021 13:05:39 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from ssl.serverraum.org (ssl.serverraum.org [176.9.125.105])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 86347F80100
 for <alsa-devel@alsa-project.org>; Mon, 15 Mar 2021 13:05:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 86347F80100
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=walle.cc header.i=@walle.cc
 header.b="BszTYF2f"
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 574BC22172;
 Mon, 15 Mar 2021 13:05:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1615809930;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=56lCTBoJc0zn0J8RcUtKReFHALPDLgWyoBcvGIIJrSo=;
 b=BszTYF2fRmRNnTp2xegfjD1M2aL7Lv/SCZp2gUsxRz9qL408p1dFznBJQRUXFOa+pcOgLM
 Bb3m8lvAeQkYYDvmlC6pzSOI5Sh6XWmUUH2lVRJGgiaPIK+qi8MJqFtiarVOojGSsRK9FE
 IJQFg0/hF+UbpkNIqCjKlQSBGwk1w+s=
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Mon, 15 Mar 2021 13:05:30 +0100
From: Michael Walle <michael@walle.cc>
To: Mark Brown <broonie@kernel.org>, Sameer Pujar <spujar@nvidia.com>
Subject: Re: [PATCH 1/3] ASoC: simple-card-utils: Fix device module clock
In-Reply-To: <20210312134642.GF5348@sirena.org.uk>
References: <20210309144156.18887-1-michael@walle.cc>
 <e8b80188-978c-29fa-b5d4-9788a9f2282f@nvidia.com>
 <611ed3362dee3b3b7c7a80edfe763fd0@walle.cc>
 <ca540fb6-2ea7-90b0-66ad-097e99b6e585@nvidia.com>
 <20210311161558.GG4962@sirena.org.uk>
 <f21b87f1afb3eda54b5f00f2d1c146d3@walle.cc>
 <20210312113544.GB5348@sirena.org.uk>
 <6ed28bb5330879b1919aced5174f319f@walle.cc>
 <20210312120456.GD5348@sirena.org.uk>
 <684332700f8be9f77348a510eb6eba22@walle.cc>
 <20210312134642.GF5348@sirena.org.uk>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <8cdf1cfa971945792b509a687a4de735@walle.cc>
X-Sender: michael@walle.cc
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 kuninori.morimoto.gx@renesas.com, robh@kernel.org,
 linux-kernel@vger.kernel.org, jonathanh@nvidia.com, sharadg@nvidia.com,
 thierry.reding@gmail.com, linux-tegra@vger.kernel.org
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Am 2021-03-12 14:46, schrieb Mark Brown:
> On Fri, Mar 12, 2021 at 01:30:02PM +0100, Michael Walle wrote:
> 
>> The card calls set_sysclk(), which eventually ends up in the codec.
>> The codec therefore, could figure out if it needs to configure the
>> clock or if it can use its internal FLL.
>> Is that what you mean?
> 
> Yes.
> 
>> But the set_sysclk() of the codec isn't even called, because the
>> card itself already tries to call clk_set_rate() on the Codec's MCLK,
>> which returns with an error [0].
> 
> OK, so I think we need to push this down a level so that the clock
> setting is implemented by the core/CODEC rather than by simple-card,
> with the helpers being something the CODEC can opt out of.

Sameer, it looks like the proper fix should be to add the clock
support to your codec.

I've also looked at other users of "simple-audio-card" and
it looks like they will break too. For example,
- arch/arm64/boot/dts/rockchip/rk3399.dtsi
     If I'm not mistaken, this will try to set the first clock
     of hdmi@ff940000 there, which is "iahb".
- arch/arm/boot/dts/sun8i-a33.dtsi
     There "&ccu CLK_BUS_CODEC" of codec@1c22e00 will be changed

And it doesn't stop there, it also sets the first clock
of the CPU endpoint, which I guess just works because .set_rate
is a noop for the most clocks which are used there.

-michael
