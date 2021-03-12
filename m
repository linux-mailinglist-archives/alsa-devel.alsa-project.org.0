Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BC19A338D1D
	for <lists+alsa-devel@lfdr.de>; Fri, 12 Mar 2021 13:31:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 570591713;
	Fri, 12 Mar 2021 13:30:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 570591713
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615552307;
	bh=p/fyUU6/cwt6MQDqBQu2n306GiOaBTF+4aI30Io7tOk=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XfN6iZIdcj9OD9PUFFmT9vuqHQKa983qG8jrlJkYY4YtZGc8WdUWSoZIyzYLmh/Py
	 LHzanknz4czDIZeJOmwKGC9eMLTrqeiJrNE40uhAwx/Vo0qe5HXEZYlkpuh5GtmsMD
	 uRZ7sZGaOY/buZuyDXLpmzRnP5DY0NaFD7syL0e8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D8844F800BF;
	Fri, 12 Mar 2021 13:30:16 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C1822F801D8; Fri, 12 Mar 2021 13:30:13 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from ssl.serverraum.org (ssl.serverraum.org [176.9.125.105])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E417DF800BF
 for <alsa-devel@alsa-project.org>; Fri, 12 Mar 2021 13:30:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E417DF800BF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=walle.cc header.i=@walle.cc
 header.b="JUibZx2Y"
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 550BD22238;
 Fri, 12 Mar 2021 13:30:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1615552202;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DLDt3qK5Lj/9krzodd0NKRhKwpbPQn93pLiyIHMlDW4=;
 b=JUibZx2YXrL0+9ptaGFBZofuARSICiab+jH7Ss0cay9ZcmU0D3vh1gZdeXXD0DNc3h3g60
 LMYwkXdk50J1K4d0J8tLLq6ujOw7IzFxnNqUyJ+Zaj8wxNqlj0qw3slHj3m1GJZl1orOYk
 p42hD3MvuvCFZihjvNoxAoQCNJZhEPs=
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Fri, 12 Mar 2021 13:30:02 +0100
From: Michael Walle <michael@walle.cc>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 1/3] ASoC: simple-card-utils: Fix device module clock
In-Reply-To: <20210312120456.GD5348@sirena.org.uk>
References: <1612939421-19900-2-git-send-email-spujar@nvidia.com>
 <20210309144156.18887-1-michael@walle.cc>
 <e8b80188-978c-29fa-b5d4-9788a9f2282f@nvidia.com>
 <611ed3362dee3b3b7c7a80edfe763fd0@walle.cc>
 <ca540fb6-2ea7-90b0-66ad-097e99b6e585@nvidia.com>
 <20210311161558.GG4962@sirena.org.uk>
 <f21b87f1afb3eda54b5f00f2d1c146d3@walle.cc>
 <20210312113544.GB5348@sirena.org.uk>
 <6ed28bb5330879b1919aced5174f319f@walle.cc>
 <20210312120456.GD5348@sirena.org.uk>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <684332700f8be9f77348a510eb6eba22@walle.cc>
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

Am 2021-03-12 13:04, schrieb Mark Brown:
> On Fri, Mar 12, 2021 at 01:01:41PM +0100, Michael Walle wrote:
>> Am 2021-03-12 12:35, schrieb Mark Brown:
> 
>> > If the card has a clock API clock as sysclk then set_sysclk(() should
>> > be configuring that clock.
> 
>> What do you mean by "the card". The simple-audio-card itself?
> 
>> Take a look at:
>> https://elixir.bootlin.com/linux/v5.12-rc2/source/arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var3-ads2.dts#L29
> 
>> Does the card has a clock? IMHO the WM8904 codec has a clock, but not
>> the audio card.
> 
> The clock on the CODEC, which the card configures.  The CODEC should be
> passing on the configuration to the clock API.

Sorry, I don't understand.

The card calls set_sysclk(), which eventually ends up in the codec.
The codec therefore, could figure out if it needs to configure the
clock or if it can use its internal FLL.
Is that what you mean?

But the set_sysclk() of the codec isn't even called, because the
card itself already tries to call clk_set_rate() on the Codec's MCLK,
which returns with an error [0].

[0] 
https://elixir.bootlin.com/linux/v5.12-rc2/source/sound/soc/generic/simple-card-utils.c#L265

-michael
