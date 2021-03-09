Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F0E1A333A12
	for <lists+alsa-devel@lfdr.de>; Wed, 10 Mar 2021 11:32:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6C704179B;
	Wed, 10 Mar 2021 11:32:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6C704179B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615372372;
	bh=X5B2/gx1QGVoL1mkOIwexgUg78cVc8UCgPQNpauha+U=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RBXKafR/MJFfFeCMdNYBYIsRXTlqDrPzPXeuApTTm4KiQz7kJAwfXAAf1FwQPBREb
	 s5blaThDEXn2nR84BzLd2teHOgwdpgRH4pe9Qe07DgJpN7e+lFUO11J2bssOcDiwRg
	 BiiswZyziRa50vydkeEiq6LTi/vLc5rvSvZFiDc4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0C1AAF80424;
	Wed, 10 Mar 2021 11:30:34 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3D9E5F80227; Tue,  9 Mar 2021 23:30:40 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_30,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from ssl.serverraum.org (ssl.serverraum.org
 [IPv6:2a01:4f8:151:8464::1:2])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 11C2DF800D0
 for <alsa-devel@alsa-project.org>; Tue,  9 Mar 2021 23:30:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 11C2DF800D0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=walle.cc header.i=@walle.cc
 header.b="sFwZIOc4"
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 9EC5D2223A;
 Tue,  9 Mar 2021 23:30:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1615329018;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hd2LMGNdbPy56tyf0yjAuAUyGKnyIDHM2Ywt14xCuRI=;
 b=sFwZIOc4jVQsnrU/IpsFHUvES+v/WU9a6X0fpFw+fV9cJ+ypQyetm5o8RxYUHXYvEgrE73
 2f7r39G59iKuo2YJYarJW9iR83Cy1zEA/I2tKdhpoDqA14pE3yAukYE3qGBBaj7hEgrLwp
 pOkNBuLWgTuo5kH8kqvpySYtTeL2VU4=
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Tue, 09 Mar 2021 23:30:16 +0100
From: Michael Walle <michael@walle.cc>
To: Sameer Pujar <spujar@nvidia.com>
Subject: Re: [PATCH 1/3] ASoC: simple-card-utils: Fix device module clock
In-Reply-To: <e8b80188-978c-29fa-b5d4-9788a9f2282f@nvidia.com>
References: <1612939421-19900-2-git-send-email-spujar@nvidia.com>
 <20210309144156.18887-1-michael@walle.cc>
 <e8b80188-978c-29fa-b5d4-9788a9f2282f@nvidia.com>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <611ed3362dee3b3b7c7a80edfe763fd0@walle.cc>
X-Sender: michael@walle.cc
X-Mailman-Approved-At: Wed, 10 Mar 2021 11:30:10 +0100
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 kuninori.morimoto.gx@renesas.com, robh@kernel.org,
 linux-kernel@vger.kernel.org, jonathanh@nvidia.com, sharadg@nvidia.com,
 broonie@kernel.org, thierry.reding@gmail.com, linux-tegra@vger.kernel.org
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

Hi Sameer,

Am 2021-03-09 17:27, schrieb Sameer Pujar:
> On 3/9/2021 8:11 PM, Michael Walle wrote:
>>> If "clocks = <&xxx>" is specified from the CPU or Codec component
>>> device node, the clock is not getting enabled. Thus audio playback
>>> or capture fails.
>>> 
>>> Fix this by populating "simple_dai->clk" field when clocks property
>>> is specified from device node as well. Also tidy up by re-organising
>>> conditional statements of parsing logic.
>>> 
>>> Fixes: bb6fc620c2ed ("ASoC: simple-card-utils: add 
>>> asoc_simple_card_parse_clk()")
>>> Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
>>> Signed-off-by: Sameer Pujar <spujar@nvidia.com>
>> 
>> This actually breaks sound on my board
>> (arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var3-ads2.dts).
>> The codec on this board (wm8904) has a fixed clock input (only 
>> distinct
>> frequencies are supported) and uses the FLL of the codec to generate 
>> the
>> desired sample rate.
>> 
>> It seems that after this patch the clock rate of the codecs clock 
>> (rather
>> than the FLL) is tried to be changed. Which fails, because it doesn't
>> support arbitrary frequencies.
> 
> Yes, after the given change the clock will be updated if "*mclk-fs"
> property is specified.
> 
> DT you mentioned has property "simple-audio-card,mclk-fs = <256>",
> which means you need a clock that is a function of sample rate. But as
> per above you want a fixed clock for MCLK. I think if you drop this
> property, the clock updates won't happen. Earlier for your case, this
> property was not used at all because the clock handle was not
> populated.

You mean to drop the mclk-fs property? I can't do that because I
actually need a frequency of 256 * sample rate. But that doesn't
necessarily need to be the MCLK, because the codec itself has a
FLL/PLL which can be used to generate any frequency for a given
MCLK. So that is a valid scenario. See also commit 13409d27cb39
("ASoC: wm8904: configure sysclk/FLL automatically").

-michael
