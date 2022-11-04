Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E59E61959A
	for <lists+alsa-devel@lfdr.de>; Fri,  4 Nov 2022 12:47:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D74E515E0;
	Fri,  4 Nov 2022 12:46:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D74E515E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1667562433;
	bh=GPfFG8d3MNDwdDimRXH3HJXCpZ2rK69qHDPkNBenzTg=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VTGCBNCtqdczV9sw2zKWwApE9tPA2wpAkwRR0m3gvjuQHivB6RRtG8KstYDa8QY/M
	 1rkDQl94ekypM1FRFOgQQ+VRsmMZj12ihHsEVEZx6ZFmyJg6Xa9d94rsIBmbGzp0vu
	 ssZX/1DE9rT14Yt7FtJVHdsDyIWC9olhUe9fxkWQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 194D5F80149;
	Fri,  4 Nov 2022 12:46:18 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 91132F80448; Fri,  4 Nov 2022 12:46:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 776AFF80149
 for <alsa-devel@alsa-project.org>; Fri,  4 Nov 2022 12:46:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 776AFF80149
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de
 header.b="AhmK5JQy"
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id E0504850FD;
 Fri,  4 Nov 2022 12:46:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1667562369;
 bh=serea9Dd61ADrxdfYjX6D7Pe24xNMWckuTa4T82u48k=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=AhmK5JQy7N5kAS9PZuqi0fhLVd6rm98iwFX1Vpjg6hlSaad5jrc3+HwGyXcthHboP
 9MetQRTD+4XXoJIglw/v8IYJEUVTrPD+nLGmKzTBLn8mLH5VQdbXop9sutt7nYzlYi
 O5T1ox6lwnahnCQHF2p4qARo3oSnTGWuWX6o0Mz6+spL7tRNDu/iU8Ept8W5ZJ/rBO
 gt5qnJilf97ljaBFm7JhHc0pBlA6nZLDMPrx1ER8ASzKmlhEOgtgInEDpwoOsVwjYN
 hFoJPRl4wTOOvdzhlGWY02C6ghpZACaeei9oX6yyag3+tnpnZRdaAJ2fCR27KlXiX+
 qTXvKt5IqKmCQ==
Message-ID: <55c564c9-af7a-bc34-0340-d31bf7ffb0c8@denx.de>
Date: Fri, 4 Nov 2022 12:22:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH] ASoC: dt-bindings: fsl-sai: Convert to YAML DT schema
Content-Language: en-US
To: Shengjiu Wang <shengjiu.wang@gmail.com>
References: <20221103182016.95808-1-marex@denx.de>
 <CAA+D8ANyXq7N+QfupnncTiJjEb8AN7hnb6T-1Cf8xs8yfYUFfg@mail.gmail.com>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <CAA+D8ANyXq7N+QfupnncTiJjEb8AN7hnb6T-1Cf8xs8yfYUFfg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Xiubo Li <Xiubo.Lee@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Nicolin Chen <nicoleotsuka@gmail.com>, Mark Brown <broonie@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Fabio Estevam <festevam@gmail.com>
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

On 11/4/22 09:11, Shengjiu Wang wrote:
> On Fri, Nov 4, 2022 at 2:20 AM Marek Vasut <marex@denx.de> wrote:
> 
>> Convert the SAI bindings to YAML DT schema to permit validation.
>> Add Shengjiu as maintainer, derived from sound/soc/fsl/fsl_sai.c
>> get_maintainer result.
>>
>> Describe existing used combinations of compatible strings, add the
>> missing imx7d-sai compatible string which is used on i.MX7 .
>>
>> Properties lsb-first, fsl,sai-synchronous-rx, fsl,sai-asynchronous,
>> fsl,dataline are no longer listed as required, since those are clearly
>> optional, even the description says so, so does their usage.
>>
>> Fix the undefined edma channel macro per arch/arm/boot/dts/vfxxx.dtsi ,
>> use the value itself just like in the vfxxx.dtsi .
>>
>> Document interrupts property, which was previously undocumented, but
>> it is required property of this IP.
>>
>> Document #sound-sai-cells, which should be zero for this IP.
>>
>> Document fsl,imx6ul-iomuxc-gpr and its dependency on MX6UL and
>> fsl,sai-mclk-direction-output .
>>
>> Signed-off-by: Marek Vasut <marex@denx.de>
>> ---
>> Cc: Fabio Estevam <festevam@gmail.com>
>> Cc: Jaroslav Kysela <perex@perex.cz>
>> Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
>> Cc: Liam Girdwood <lgirdwood@gmail.com>
>> Cc: Mark Brown <broonie@kernel.org>
>> Cc: Nicolin Chen <nicoleotsuka@gmail.com>
>> Cc: Rob Herring <robh+dt@kernel.org>
>> Cc: Shengjiu Wang <shengjiu.wang@gmail.com>
>> Cc: Takashi Iwai <tiwai@suse.com>
>> Cc: Xiubo Li <Xiubo.Lee@gmail.com>
>> Cc: alsa-devel@alsa-project.org
>> To: devicetree@vger.kernel.org
>> ---
>>   .../devicetree/bindings/sound/fsl-sai.yaml    | 188 ++++++++++++++++++
>>
> 
> Documentation/devicetree/bindings/sound/fsl,sai.yaml
> I have done conversion. If there is any update/change, please send patch
> base on it.

I noticed that, thanks for that. I'll see if there is anything left to do.
