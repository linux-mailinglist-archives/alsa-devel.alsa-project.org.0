Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4033E338011
	for <lists+alsa-devel@lfdr.de>; Thu, 11 Mar 2021 23:12:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AD3971707;
	Thu, 11 Mar 2021 23:12:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AD3971707
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615500778;
	bh=1g2qsOT1xdF9g8M3euZyS860e1JCg9RNWTQ+YVxQoAE=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sIkgnXd/TuO5CEd1A8eaj3eeGDncYzhbqM4deKh7dbDiiHb87NAp+9o0ua0/K3uMd
	 b1a7oR51w9qLb9qfXPTmTG3TGrMkvobgjnbDYWu+hkcyJ1LrN7GbHUlPDUuKdYMxkr
	 XW52KvjpA8+GEWtkdn+CdkhoiGiQngJ/MweJml3I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0D3BAF8010D;
	Thu, 11 Mar 2021 23:11:28 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CF8C2F80227; Thu, 11 Mar 2021 23:11:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from ssl.serverraum.org (ssl.serverraum.org
 [IPv6:2a01:4f8:151:8464::1:2])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4E4EBF800BF
 for <alsa-devel@alsa-project.org>; Thu, 11 Mar 2021 23:11:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4E4EBF800BF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=walle.cc header.i=@walle.cc
 header.b="l/wtr47o"
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 5B5A52224F;
 Thu, 11 Mar 2021 23:11:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1615500675;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WsPITZ64nIWI+4FRusiGTBCLY0TRr7/LpaTTzy5rpfE=;
 b=l/wtr47oZIFZkvukRdDqx0Yj4naCigu5BD9AeZS5626ItX0mk4ZONt6BKlZ3+YmjEIxmWW
 Rjo/kOfBd78omPKmg0B+71lY71DJkeN8Va45ywiR/+rdXrvjMKjt06HRc4uPT/7+zavxCJ
 +JyyrtHbiqzXJD4XpFEUtijKHJU5G0Q=
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Thu, 11 Mar 2021 23:11:15 +0100
From: Michael Walle <michael@walle.cc>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 1/3] ASoC: simple-card-utils: Fix device module clock
In-Reply-To: <20210311161558.GG4962@sirena.org.uk>
References: <1612939421-19900-2-git-send-email-spujar@nvidia.com>
 <20210309144156.18887-1-michael@walle.cc>
 <e8b80188-978c-29fa-b5d4-9788a9f2282f@nvidia.com>
 <611ed3362dee3b3b7c7a80edfe763fd0@walle.cc>
 <ca540fb6-2ea7-90b0-66ad-097e99b6e585@nvidia.com>
 <20210311161558.GG4962@sirena.org.uk>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <f21b87f1afb3eda54b5f00f2d1c146d3@walle.cc>
X-Sender: michael@walle.cc
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 kuninori.morimoto.gx@renesas.com, robh@kernel.org,
 Sameer Pujar <spujar@nvidia.com>, linux-kernel@vger.kernel.org,
 jonathanh@nvidia.com, sharadg@nvidia.com, thierry.reding@gmail.com,
 linux-tegra@vger.kernel.org
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

Am 2021-03-11 17:15, schrieb Mark Brown:
> On Wed, Mar 10, 2021 at 08:20:28PM +0530, Sameer Pujar wrote:
> 
>> If I read this correctly below is the configuration you need,
>> SoC -> MCLK(fixed rate) -> PLL(wm8904) -> PLL output (256 * fs) -> 
>> sysclk
> 
> For this device for integration with something like simple-audio-card
> since there's limited flexibility within the device the simplest thing
> would be to not make the internal clocking of the device visible and
> just have it figure out how to use the input clock, using the MCLK
> directly if possible otherwise using the FLL to generate a suitable
> clock.

Before this patch, part of this was already happening. That is,
simple-audio-card called set_sysclk(samplerate * mclk-fs), then
the codec figured out that its mclk was different than the
requested sample rate and enabled its FLL to generate the requested
sample rate automatically.

With this patch applied, simple-audio-card already tries to change
mclk, which isn't working in my case (the MCLK isn't generated by
a PLL and just supports fixed frequencies) and thus breaks audio. And
this patch also propagate to the stable kernels and breaks my
board there, too.

> The trick is figuring out if it's best to vary the input clock
> or to use the FLL to adapt a fixed input clock,

For simple-audio-card you can set the "clock" property if you want
that clock to be changed/enabled/disabled. But that doesn't seem to
be the way to go, at least it was NAKed by Rob for the audio-graph-card.
I don't see a way to figure out if MCLK should be controlled by
simple-*-card without adding further properties to the device tree.

> and of course adapting any existing users if things get changed.

To be frank, I don't see that happening.

-michael
