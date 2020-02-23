Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DB18416989B
	for <lists+alsa-devel@lfdr.de>; Sun, 23 Feb 2020 17:12:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 74355167E;
	Sun, 23 Feb 2020 17:11:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 74355167E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582474340;
	bh=utqPp3+MNjasTCqwAhzdWUmeaaT9Yl5tNvxelF/Ppzk=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qjPSYDjT9Isi1bbo9jlMRn4nCPxi1z3msLaC/360aWSI+0tz6wwMGFOUCwGtWuEuN
	 ZMSBGSG8plcLuAr7/6zOJJH1DGBdNA9W44gynLbzpP0Oo5mnZ4aIK121YDC5eXYQoR
	 bpF0RteOsWyPGABi1OrTdQyGiaMc3AgIX3gjtDWo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 516BFF80143;
	Sun, 23 Feb 2020 17:10:39 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 97521F80142; Sun, 23 Feb 2020 17:10:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
Received: from sdfa3.org (sdfa3.org [62.210.178.46])
 by alsa1.perex.cz (Postfix) with ESMTP id EAE00F80137
 for <alsa-devel@alsa-project.org>; Sun, 23 Feb 2020 17:10:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EAE00F80137
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sdfa3.org header.i=@sdfa3.org
 header.b="KWv9O2dV"
Received: from [192.168.2.10] (unknown [78.193.54.22])
 by sdfa3.org (Postfix) with ESMTPSA id CA3D8230122E;
 Sun, 23 Feb 2020 17:10:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=sdfa3.org; s=mail;
 t=1582474226; bh=utqPp3+MNjasTCqwAhzdWUmeaaT9Yl5tNvxelF/Ppzk=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=KWv9O2dVv5idofd2aBhfHvLcAYA6nrqYaGMGPXbLUZNuN4T/ZA1zGO9o44mJPuuTY
 1XEiIhXsFmvGSqJtsViUdOQu/W7dXLB/6OEd+y9sP0QBFK9NH/gbm5EUCtvsYF0aM6
 geOPmKZziQa7AM6FmZTW24BUYm6f77lnwp7ATxdM=
Subject: Re: [alsa-devel] [PATCH] ASoC: codecs: make PCM5102A codec selectable
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org
References: <20200214002505.13112-1-david.douard@sdfa3.org>
 <ae4df82b-4493-4086-1654-2b6d62cf7d0e@linux.intel.com>
From: David Douard <david.douard@sdfa3.org>
Autocrypt: addr=david.douard@sdfa3.org; prefer-encrypt=mutual; keydata=
 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
 39aDQss0rHXIm1YDGEv5hiQ1bzw=
Message-ID: <01adc4dc-e83e-c9a7-d4ab-71fa1aa30ee0@sdfa3.org>
Date: Sun, 23 Feb 2020 17:10:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <ae4df82b-4493-4086-1654-2b6d62cf7d0e@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
Cc: Mark Brown <broonie@kernel.org>
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

Le 18/02/2020 à 17:04, Pierre-Louis Bossart a écrit :
> [Adding Mark Brown - CC: maintainers if you want your patch to be applied]
> 
> On 2/13/20 6:25 PM, David Douard wrote:
>> The PCM5102A codec entry in the Kconfig file lacks a title/description
>> to make it selectable in menuconfig (since it has no dependent i2s/spi
>> sub-modules like e.g. the pcm512x one).
> 
> For my education, who uses this codec? it's not selected by any machine
> driver?

This codec is needed to drive PCM5102A based i2s DAC. It can be found in
several low cost I2S DAC break boards (I have a Polyvection one for
example) and is generally used on SBC like the RPi, Odroid or Orange Pi.

On such devices, the driver will be selected via a proper declaration of
the device in the device tree (e.g. in a custom dts file). See for
example this issue I submitted to the Armbian project (together with a
PR that patches this very same issue I described in this thread):

  https://github.com/armbian/build/issues/1798

David


>> ---
>>   sound/soc/codecs/Kconfig | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
>> index 7e90f5d83097..676fa62e9b7f 100644
>> --- a/sound/soc/codecs/Kconfig
>> +++ b/sound/soc/codecs/Kconfig
>> @@ -934,7 +934,7 @@ config SND_SOC_PCM3168A_SPI
>>       select REGMAP_SPI
>>     config SND_SOC_PCM5102A
>> -    tristate
>> +    tristate "Texas Instruments PCM5102A CODEC"
>>     config SND_SOC_PCM512x
>>       tristate
>>
