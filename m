Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A75134CF449
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Mar 2022 10:09:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3AF3516FC;
	Mon,  7 Mar 2022 10:08:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3AF3516FC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646644146;
	bh=mKuKc24peBTHJq96oPXVMVEPFG1UMKdTfUdLfSGxtH0=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TmcssQ360xrXMXziabqRQyPBRcWOuYJNrrCxZD4baK0bSOqvlirfA3/wY2LgYbJnk
	 93sWOf667mwWbja3+gQll2yJP7rgDH4Lsr7rWOydghnovwc2DDDP8UAGMH2przKD5K
	 xuX4N7r0GsjIPzn7zjsJrtLlzqKSmwCtjNmiisDY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 913FEF80159;
	Mon,  7 Mar 2022 10:07:58 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B2344F8013F; Mon,  7 Mar 2022 10:07:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 UNPARSEABLE_RELAY,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8C2D1F800D1
 for <alsa-devel@alsa-project.org>; Mon,  7 Mar 2022 10:07:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8C2D1F800D1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com
 header.b="S+nr6l6u"
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 2631B1F43859
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1646644069;
 bh=mKuKc24peBTHJq96oPXVMVEPFG1UMKdTfUdLfSGxtH0=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=S+nr6l6ud+gdKu5ahDRDne/nb8H6YRD77OPWBF4KsxIFPSWoe0DszZrrWihtjWXaT
 KIcAbqgmYkYHkpqe6Z6JIVmXD00hmusob2Umsc2496UYcKdboInRXDfzCggoz19RLR
 yUcKjJLTR5n9L4ijWAvo0cXjEp1LFJ2idl8PREEPXlHFCtEDOHQS3xaoyiRnW2c6Is
 Tx6TPN7W1wrUrHC8GJH3UPzLbd3U+G4/vlXNJyg0fofeJG/E+3SOzatheWUZxcRDZa
 SK2WUgGituRC1LNkpgBKcCC0WJyGTNKbC2Oj4PfAu+ykatmh19xUR76VCfEYLa1aZ8
 g2zwcLTBmrPYA==
Message-ID: <e2299a96-9f91-0ca3-1617-18029b3940d2@collabora.com>
Date: Mon, 7 Mar 2022 10:07:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [v2 01/17] ASoC: mediatek: mt6366: add codec driver
Content-Language: en-US
To: Jiaxin Yu <jiaxin.yu@mediatek.com>, broonie@kernel.org
References: <20220217134205.15400-1-jiaxin.yu@mediatek.com>
 <20220217134205.15400-2-jiaxin.yu@mediatek.com>
 <b22976ee-6426-cabf-f153-fbe093611e97@collabora.com>
 <6555d89deb9087825f865b9d4265f07465e7ae09.camel@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <6555d89deb9087825f865b9d4265f07465e7ae09.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 geert+renesas@glider.be, linux-kernel@vger.kernel.org, zhangqilong3@huawei.com,
 tiwai@suse.com, lgirdwood@gmail.com, tzungbi@google.com, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, trevor.wu@mediatek.com,
 p.zabel@pengutronix.de, matthias.bgg@gmail.com, aaronyu@google.com,
 linux-arm-kernel@lists.infradead.org
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

Il 05/03/22 05:24, Jiaxin Yu ha scritto:
> On Fri, 2022-02-18 at 15:54 +0100, AngeloGioacchino Del Regno wrote:
>> Il 17/02/22 14:41, Jiaxin Yu ha scritto:
>>> Mt6366 is a new version of mt6358, and they are same about audio
>>> part.
>>> So we can reuse the driver of mt6358.
>>>
>>> Signed-off-by: Jiaxin Yu <jiaxin.yu@mediatek.com>
>>
>> Hello Jiaxin,
>> I'm sorry but this commit makes very little sense.
>>
>> If you want to advertise MT6366 support, please write a note and/or
>> a new compatible string inside of the mt6358 driver (and dt-
>> bindings),
>> then, please drop this commit.
>>
> 
> Hello angelogioacchino,
> 
> Thank you for your advice.
> 
> If I add a new compatible string inside of the mt6358 driver and dt-
> bindings, then the machine driver which want to use mt6366 should
> select SND_SOC_MT6358.
> 
> like below:
> 
> config SND_SOC_MT8186_MT6366_DA7219_MAX98357
> 	tristate "ASoC Audio driver for MT8186 with DA7219 MAX98357A
> codec"
>   	depends on I2C && GPIOLIB
>   	depends on SND_SOC_MT8186 && MTK_PMIC_WRAP
>   	select SND_SOC_MT6366   ==> SND_SOC_MT6358
> 	...
> 
> I just doubt it's enough to make sense. I originally wanted to put this
> relationship in the sound/soc/codecs layer. So that this relationship
> is not perceived by users(machine driver).
> However, if the general practice is like this, I will adopt your
> suggestion. Thank you again.
> 

Yes this is acceptable, please do it like that.

Thanks,
Angelo

>>
>>> ---
>>>    sound/soc/codecs/Kconfig  | 8 ++++++++
>>>    sound/soc/codecs/Makefile | 1 +
>>>    2 files changed, 9 insertions(+)
>>>
>>> diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
>>> index 8fa24783ce01..6631094678f5 100644
>>> --- a/sound/soc/codecs/Kconfig
>>> +++ b/sound/soc/codecs/Kconfig
>>> @@ -132,6 +132,7 @@ config SND_SOC_ALL_CODECS
>>>    	imply SND_SOC_MT6351
>>>    	imply SND_SOC_MT6358
>>>    	imply SND_SOC_MT6359
>>> +	imply SND_SOC_MT6366
>>>    	imply SND_SOC_MT6660
>>>    	imply SND_SOC_NAU8315
>>>    	imply SND_SOC_NAU8540
>>> @@ -1888,6 +1889,13 @@ config SND_SOC_MT6359_ACCDET
>>>    	  for ASoC codec soc-jack detection mechanism.
>>>    	  Select N if you don't have jack on board.
>>>    
>>> +config SND_SOC_MT6366
>>> +	tristate "MediaTek MT6366 Codec"
>>> +	depends on MTK_PMIC_WRAP
>>> +	help
>>> +	  Enable support for the platform which uses MT6366 as
>>> +	  external codec device.
>>> +
>>>    config SND_SOC_MT6660
>>>    	tristate "Mediatek MT6660 Speaker Amplifier"
>>>    	depends on I2C
>>> diff --git a/sound/soc/codecs/Makefile b/sound/soc/codecs/Makefile
>>> index 42d00aa4ee46..1279684feaf0 100644
>>> --- a/sound/soc/codecs/Makefile
>>> +++ b/sound/soc/codecs/Makefile
>>> @@ -465,6 +465,7 @@ obj-$(CONFIG_SND_SOC_MT6351)	+= snd-soc-
>>> mt6351.o
>>>    obj-$(CONFIG_SND_SOC_MT6358)	+= snd-soc-mt6358.o
>>>    obj-$(CONFIG_SND_SOC_MT6359)	+= snd-soc-mt6359.o
>>>    obj-$(CONFIG_SND_SOC_MT6359_ACCDET) += mt6359-accdet.o
>>> +obj-$(CONFIG_SND_SOC_MT6366)	+= snd-soc-mt6358.o
>>>    obj-$(CONFIG_SND_SOC_MT6660)	+= snd-soc-mt6660.o
>>>    obj-$(CONFIG_SND_SOC_NAU8315)   += snd-soc-nau8315.o
>>>    obj-$(CONFIG_SND_SOC_NAU8540)   += snd-soc-nau8540.o
>>
>>
> 

