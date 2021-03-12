Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 42532338C5A
	for <lists+alsa-devel@lfdr.de>; Fri, 12 Mar 2021 13:05:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D2DA1173A;
	Fri, 12 Mar 2021 13:04:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D2DA1173A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615550739;
	bh=WmBMo+7DBf7I4tCU8ChkUvKqC1hUz/3HAp5FogFUJyw=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XXt5bVzdDusaMLjQzS1AJ+T9nGkSaXMvkTnW1nLMJVc9gpYykP+DQzWDu0MmjIFMY
	 IHNVY5pKOiEIVWqOGNVfE8vvOAG1W+Q+q8EVUDQ+d507oARPawI/DLzGuNZFmBmYeO
	 QovsBCItuZrT73o9uU7wP+VQGLWcyWv4HNrAKDYU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EF638F802E7;
	Fri, 12 Mar 2021 13:01:59 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B2D15F802E0; Fri, 12 Mar 2021 13:01:57 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from ssl.serverraum.org (ssl.serverraum.org [176.9.125.105])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B9B46F801D8
 for <alsa-devel@alsa-project.org>; Fri, 12 Mar 2021 13:01:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B9B46F801D8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=walle.cc header.i=@walle.cc
 header.b="iaj7o6dL"
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 9B6AC22238;
 Fri, 12 Mar 2021 13:01:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1615550502;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fW2gTmh4PzgbJrGWy/381fOG4Lx9Rw+iMj4STBKbzXc=;
 b=iaj7o6dL1mWyPoPOEazdaiHA68HsVTcD2IfHTNByW16TuaT+wokwGVZpyjVLNsvzDu4ufY
 kt7WueG1k02GKHrkht1oWyMJEvYRzWpi5JkC5vwmta2TTZeSTZTy7fl8RKjYhf1Vtd6W+6
 1Efo06VnGYEf29lcBWXB0JqFA3kFzdg=
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Fri, 12 Mar 2021 13:01:41 +0100
From: Michael Walle <michael@walle.cc>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 1/3] ASoC: simple-card-utils: Fix device module clock
In-Reply-To: <20210312113544.GB5348@sirena.org.uk>
References: <1612939421-19900-2-git-send-email-spujar@nvidia.com>
 <20210309144156.18887-1-michael@walle.cc>
 <e8b80188-978c-29fa-b5d4-9788a9f2282f@nvidia.com>
 <611ed3362dee3b3b7c7a80edfe763fd0@walle.cc>
 <ca540fb6-2ea7-90b0-66ad-097e99b6e585@nvidia.com>
 <20210311161558.GG4962@sirena.org.uk>
 <f21b87f1afb3eda54b5f00f2d1c146d3@walle.cc>
 <20210312113544.GB5348@sirena.org.uk>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <6ed28bb5330879b1919aced5174f319f@walle.cc>
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

Am 2021-03-12 12:35, schrieb Mark Brown:
> On Thu, Mar 11, 2021 at 11:11:15PM +0100, Michael Walle wrote:
>> Am 2021-03-11 17:15, schrieb Mark Brown:
> 
>> > The trick is figuring out if it's best to vary the input clock
>> > or to use the FLL to adapt a fixed input clock,
> 
>> For simple-audio-card you can set the "clock" property if you want
>> that clock to be changed/enabled/disabled. But that doesn't seem to
>> be the way to go, at least it was NAKed by Rob for the 
>> audio-graph-card.
>> I don't see a way to figure out if MCLK should be controlled by
>> simple-*-card without adding further properties to the device tree.
> 
> If the card has a clock API clock as sysclk then set_sysclk(() should
> be configuring that clock.

What do you mean by "the card". The simple-audio-card itself?

Take a look at:
https://elixir.bootlin.com/linux/v5.12-rc2/source/arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var3-ads2.dts#L29

Does the card has a clock? IMHO the WM8904 codec has a clock, but not
the audio card.

-michael
