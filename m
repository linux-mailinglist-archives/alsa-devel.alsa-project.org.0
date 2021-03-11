Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 292F6337003
	for <lists+alsa-devel@lfdr.de>; Thu, 11 Mar 2021 11:29:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BA99C1828;
	Thu, 11 Mar 2021 11:28:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BA99C1828
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615458586;
	bh=mXvQuqaIDUTK9PXeLyZ6Ln41fHVcWQHK+4cF6uBIykI=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=r/4a8YKdpkchICyDVsiP7cdqRq3BuwFkgFn9pUIZAPKrfkZxL849nWIKo7WwSZNIv
	 XArZ026y1l9Es41+rEGAMkZnDmaevji9syrPul3/EY0McvIBJQI1nr03m5xrXQwKXO
	 NQP/+ruc4xvyokvdJJ6Xcw+AYuJ7zObuI/YhKg2c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 35CF3F80256;
	Thu, 11 Mar 2021 11:28:16 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 02B5CF80227; Thu, 11 Mar 2021 11:28:09 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_30,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from ssl.serverraum.org (ssl.serverraum.org [176.9.125.105])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8ADD6F800BF
 for <alsa-devel@alsa-project.org>; Thu, 11 Mar 2021 11:27:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8ADD6F800BF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=walle.cc header.i=@walle.cc
 header.b="GRjVx3HB"
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id E6F0722253;
 Thu, 11 Mar 2021 11:27:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1615458472;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=F/pKw0dxLFS0KoV3Ebsgp8qficdXlTrq+SBNJfX8nr4=;
 b=GRjVx3HBxYsMYSofVWTR5ZJiOQCtwJTZeGIpMwTuEKerCg2pEkn+9jx93ZV/TE60Rif77T
 6Fa/8ObPm3/RcRb46zuXnUnUucsPDPODe/1lIz+m4JZHlbWfYO1dmZuVQW0yun+dAq5C4L
 e2VvFjiO4wfJkaNSAoHvH4jaoK7ypO0=
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Thu, 11 Mar 2021 11:27:51 +0100
From: Michael Walle <michael@walle.cc>
To: Sameer Pujar <spujar@nvidia.com>
Subject: Re: [PATCH 1/3] ASoC: simple-card-utils: Fix device module clock
In-Reply-To: <ca540fb6-2ea7-90b0-66ad-097e99b6e585@nvidia.com>
References: <1612939421-19900-2-git-send-email-spujar@nvidia.com>
 <20210309144156.18887-1-michael@walle.cc>
 <e8b80188-978c-29fa-b5d4-9788a9f2282f@nvidia.com>
 <611ed3362dee3b3b7c7a80edfe763fd0@walle.cc>
 <ca540fb6-2ea7-90b0-66ad-097e99b6e585@nvidia.com>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <eb26f8e0a4c99d0c9de9d92612102718@walle.cc>
X-Sender: michael@walle.cc
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

Am 2021-03-10 15:50, schrieb Sameer Pujar:
> On 3/10/2021 4:00 AM, Michael Walle wrote:
>> Am 2021-03-09 17:27, schrieb Sameer Pujar:
>>> On 3/9/2021 8:11 PM, Michael Walle wrote:
>>>>> If "clocks = <&xxx>" is specified from the CPU or Codec component
>>>>> device node, the clock is not getting enabled. Thus audio playback
>>>>> or capture fails.
>>>>> 
>>>>> Fix this by populating "simple_dai->clk" field when clocks property
>>>>> is specified from device node as well. Also tidy up by 
>>>>> re-organising
>>>>> conditional statements of parsing logic.
>>>>> 
>>>>> Fixes: bb6fc620c2ed ("ASoC: simple-card-utils: add
>>>>> asoc_simple_card_parse_clk()")
>>>>> Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
>>>>> Signed-off-by: Sameer Pujar <spujar@nvidia.com>
>>>> 
>>>> This actually breaks sound on my board
>>>> (arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var3-ads2.dts).
>>>> The codec on this board (wm8904) has a fixed clock input (only
>>>> distinct
>>>> frequencies are supported) and uses the FLL of the codec to generate
>>>> the
>>>> desired sample rate.
>>>> 
>>>> It seems that after this patch the clock rate of the codecs clock
>>>> (rather
>>>> than the FLL) is tried to be changed. Which fails, because it 
>>>> doesn't
>>>> support arbitrary frequencies.
>>> 
>>> Yes, after the given change the clock will be updated if "*mclk-fs"
>>> property is specified.
>>> 
>>> DT you mentioned has property "simple-audio-card,mclk-fs = <256>",
>>> which means you need a clock that is a function of sample rate. But 
>>> as
>>> per above you want a fixed clock for MCLK. I think if you drop this
>>> property, the clock updates won't happen. Earlier for your case, this
>>> property was not used at all because the clock handle was not
>>> populated.
>> 
>> You mean to drop the mclk-fs property? I can't do that because I
>> actually need a frequency of 256 * sample rate. But that doesn't
>> necessarily need to be the MCLK, because the codec itself has a
>> FLL/PLL which can be used to generate any frequency for a given
>> MCLK. So that is a valid scenario. See also commit 13409d27cb39
>> ("ASoC: wm8904: configure sysclk/FLL automatically").
>> 

I've had a closer look at this and it seems you're messing around
with the clock of the codec's node (which is _not_ a subnode of
the simple-audio-card). I don't think this is correct.

I guess you should rather set the clock property in the codec
subnode of the simple-audio-card, which is then picked up by the
simple-audio-card driver and changed accordingly.

For example:
		simple-audio-card,dai-link@0 {
			reg = <0>;
			bitclock-master = <&dailink0_master>;
			frame-master = <&dailink0_master>;
			format = "i2s";

			cpu {
				sound-dai = <&sai6>;
			};

			dailink0_master: codec {
				sound-dai = <&wm8904>;
				clocks = <&mclk>;
			};
		};

In this case mclk will be enabled and disabled accordingly.

Could you test this?

-michael
