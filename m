Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A3874D7E0E
	for <lists+alsa-devel@lfdr.de>; Mon, 14 Mar 2022 10:02:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 176B417F6;
	Mon, 14 Mar 2022 10:01:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 176B417F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1647248535;
	bh=oPfRK2FlwSAxSpdbLvSWmWhgfzN2gWEN45IqscDe+ks=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sf+Yb6PKXmOx+GXRHigTvRFzP1J3I7WRzVylF6MVDOtCkw/oOBQZA9OSBukN6ydAi
	 UocfJdC3Zn/rrcH6qwj6xYLomhsMmJ+zJyRHAWLGsvcWTGCZWeYm/eIc50MnH3aN8C
	 vle/N6mWq9MuPVCyfDAnUnOAGzMLgEYG2uAmURTA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6FDF2F80100;
	Mon, 14 Mar 2022 10:01:08 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EF4BAF80100; Mon, 14 Mar 2022 10:01:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,PRX_BODY_30,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1D17DF80095
 for <alsa-devel@alsa-project.org>; Mon, 14 Mar 2022 10:01:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1D17DF80095
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com
 header.b="MgZCFoLm"
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id DEE661F43B23
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1647248461;
 bh=oPfRK2FlwSAxSpdbLvSWmWhgfzN2gWEN45IqscDe+ks=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=MgZCFoLmTFJGMbknh/8pjSR/JiUHD+6YaHFhKIVmrBhpIBcBYt9IFSW5i0ncGVp+m
 JKf2Nlu29xtCS2ueo+4WCVabQN40X3r9W24iLPvekAJoTnETCwpdr0gY5qp6dtnM7i
 OsJboo2zNhr6vAcf/S7SRi+dHu4PpAPnZGYJ4+cGjachXrtMBZRx96IhZzx2P3nBj5
 vmkj/8C3nd3ynT4TF5rKLD/cNy7rpXt/BIxBhLfdwtHPpFyZvMfdvoRV0B6M9ZSFzN
 +nV/waCUpEP/IjqvwAnt4pdWqr/1d16RM4i1DrSWEuX8bW782zjK3j11qjarOUbIRE
 h3KWww5Xz6WMw==
Message-ID: <db4d4b19-0c44-0bad-3544-01237bbb6c07@collabora.com>
Date: Mon, 14 Mar 2022 10:00:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH 4/5] ASoC: mediatek: mt8195: add machine driver with
 mt6359, max98390 and rt5682
Content-Language: en-US
To: Trevor Wu <trevor.wu@mediatek.com>, broonie@kernel.org, tiwai@suse.com,
 robh+dt@kernel.org, matthias.bgg@gmail.com
References: <20220308072435.22460-1-trevor.wu@mediatek.com>
 <20220308072435.22460-5-trevor.wu@mediatek.com>
 <e812796f-6b9b-fe9d-50a7-b681d7b174fd@collabora.com>
 <5fafa7d8a23fbdce82272529d817816f42c4ac37.camel@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <5fafa7d8a23fbdce82272529d817816f42c4ac37.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 yc.hung@mediatek.com, aaronyu@google.com, linux-arm-kernel@lists.infradead.org
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

Il 12/03/22 17:18, Trevor Wu ha scritto:
> On Thu, 2022-03-10 at 16:21 +0100, AngeloGioacchino Del Regno wrote:
>> Il 08/03/22 08:24, Trevor Wu ha scritto:
>>> This patch adds support for mt8195 board with mt6359, max98390 and
>>> rt5682.
>>>
>>> Signed-off-by: Trevor Wu <trevor.wu@mediatek.com>
>>
>> Hello Trevor,
>> thanks for the patch! However, there's something to improve...
>>
>>> ---
>>>    sound/soc/mediatek/Kconfig                    |   16 +
>>>    sound/soc/mediatek/mt8195/Makefile            |    5 +
>>>    .../mt8195/mt8195-mt6359-max98390-rt5682.c    | 1058
>>> +++++++++++++++++
>>>    3 files changed, 1079 insertions(+)
>>>    create mode 100644 sound/soc/mediatek/mt8195/mt8195-mt6359-
>>> max98390-rt5682.c
>>>    
>>>
> 
> [...]
>>> +
>>> +static const struct snd_soc_dapm_widget
>>> +	mt8195_mt6359_max98390_rt5682_widgets[] = {
>>> +	SND_SOC_DAPM_SPK("Left Speaker", NULL),
>>> +	SND_SOC_DAPM_SPK("Right Speaker", NULL),
>>> +	SND_SOC_DAPM_HP("Headphone Jack", NULL),
>>
>> We can at least partially reuse existing UCM2 configuration if you
>> slightly change the names for these controls.
>>
> 
> I don't know what the UCM2 configuration means.
> Could you give me more information?
> 

UCM == Use Case Manager;
In short, it's userspace (alsa-lib) configuration for sound cards, allowing
to configure the various mixers for various usecases (speaker/headphone/HDMI
playback, headset/internal microphone, etc).

Check this GitHub repository for more information:
https://github.com/alsa-project/alsa-ucm-conf/tree/master/ucm2

> 
>> Specifically, MAX98090 (yes I know it's a different codec) has names
>> "Speaker Left", "Speaker Right" instead, we will be able to at least
>> partially reuse these (or get uniform naming, which is still good).
>> As for the "Headphone Jack", it's simply "Headphone".
>>
>> Please note that the actual control names in userspace will be,
>> exactly,
>>
>> "Speaker Left Switch", "Speaker Right Switch",
>> "Headphone Left Switch", "Headphone Right Switch"...
>>
>> ....where "Switch" gets automatically appended because of the control
>> type.
>>
>>> +	SND_SOC_DAPM_MIC("Headset Mic", NULL),
>>
>> This "Headset Mic" name is fine.
>>
>>> +	SND_SOC_DAPM_MIXER(SOF_DMA_DL2, SND_SOC_NOPM, 0, 0, NULL, 0),
>>> +	SND_SOC_DAPM_MIXER(SOF_DMA_DL3, SND_SOC_NOPM, 0, 0, NULL, 0),
>>> +	SND_SOC_DAPM_MIXER(SOF_DMA_UL4, SND_SOC_NOPM, 0, 0, NULL, 0),
>>> +	SND_SOC_DAPM_MIXER(SOF_DMA_UL5, SND_SOC_NOPM, 0, 0, NULL, 0),
>>> +};
>>> +
> [...]
>>> +
>>> +static struct snd_soc_dai_link
>>> mt8195_mt6359_max98390_rt5682_dai_links[] = {
>>
>>
>> ... again, different name, same contents ...
>>
>>
>> And I won't go on repeating the same thing over and over again.
>> I think that the best idea here is to either create a mt8195-mt6359-
>> rt5682-common.c
>> file, or to rename the others to something else and get them all in
>> the same file.
>>
>>
>> Regards,
>> Angelo
> 
> Hi Angelo,
> 
> Thanks for your review.
> Please forgive me for deleting some comments above.
> I totally agree that most code can be reused.
> I will try revising and merging all mt8195 machine drivers in a file.

No worries. Looking forward to see the next version.
Thank you!

Regards,
Angelo

> 
> Thanks,
> Trevor
> 


