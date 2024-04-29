Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E25788B778A
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Apr 2024 15:47:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 449E2845;
	Tue, 30 Apr 2024 15:47:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 449E2845
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1714484851;
	bh=JKKbafSuoPn8Q0v0LpzntyGjrFoJpfFeVfyKmby/OBg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=l5wMUJ5XTePe5UaNL9e8nQMbk0cUBFBme3KXnY9OdH6plGOWuCNaHlilkcgQez3aB
	 66YNegvyDx4ZnL125YwUi+NFswQqoXUjLLSmDHCVk8QVG5UHW0XwWzBG5RZpsku3/+
	 iTA1w4Do1n8pfT+BBjzYVBnPK3jo8idvPd1QH80I=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E13F1F805A1; Tue, 30 Apr 2024 15:47:00 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B638AF80269;
	Tue, 30 Apr 2024 15:46:59 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B7D98F8028D; Mon, 29 Apr 2024 20:39:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from www.schimsalabim.eu (vps01.schimsalabim.eu
 [IPv6:2a01:238:430d:5000:21c4:1c57:b27f:c8a])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 59820F80100
	for <alsa-devel@alsa-project.org>; Mon, 29 Apr 2024 20:39:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 59820F80100
Received: from [192.168.0.158] (82-217-109-137.cable.dynamic.v4.ziggo.nl
 [82.217.109.137])
	(authenticated bits=0)
	by h2374449.stratoserver.net (8.14.7/8.14.7) with ESMTP id 43TIdTVN028081
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 29 Apr 2024 20:39:29 +0200
Message-ID: <534a73a7-bc41-42a7-a060-bc1465f3a21e@schimsalabim.eu>
Date: Mon, 29 Apr 2024 20:39:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: sunxi: DMIC: Add controls for adjusting the mic
 gains
To: =?UTF-8?Q?Jernej_=C5=A0krabec?= <jernej.skrabec@gmail.com>,
        Ban Tao <fengzheng923@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, Chen-Yu Tsai <wens@csie.org>,
        Samuel Holland <samuel@sholland.org>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
        linux-kernel@vger.kernel.org
References: <20240422150213.4040734-1-joao@schimsalabim.eu>
 <5772237.DvuYhMxLoT@jernej-laptop>
 <e256942d-eba1-4800-bd02-c490167dea12@schimsalabim.eu>
 <2262648.iZASKD2KPV@jernej-laptop>
Content-Language: en-US
From: Joao Schim <joao@schimsalabim.eu>
In-Reply-To: <2262648.iZASKD2KPV@jernej-laptop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-MailFrom: joao@schimsalabim.eu
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: MD54TE46DAO6I2I2QAHZ5O2GAEX5MBAF
X-Message-ID-Hash: MD54TE46DAO6I2I2QAHZ5O2GAEX5MBAF
X-Mailman-Approved-At: Tue, 30 Apr 2024 13:46:56 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MD54TE46DAO6I2I2QAHZ5O2GAEX5MBAF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 4/26/24 16:39, Jernej Škrabec wrote:
> Dne četrtek, 25. april 2024 ob 13:03:56 GMT +2 je Joao Schim napisal(a):
>> On 4/24/24 20:42, Jernej Škrabec wrote:
>>> Hi Joao,
>> Hi Jernej,  thanks for your prompt response.
>>> Dne ponedeljek, 22. april 2024 ob 17:02:13 GMT +2 je Joao Schim napisal(a):
>>>> The AllWinner H6 and later SoCs that sport a DMIC block contain a set of registers to control
>>>> the gain (left + right) of each of the four supported channels.
>>>>
>>>> Add ASoC controls for changing each of the stereo channel gains using alsamixer and alike
>>> Add SoB tag.
>> Yeah, i realized that too late. Thanks for bringing that to my
>> attention. I will add it in v1.
>>>> ---
>>>>    sound/soc/sunxi/sun50i-dmic.c | 34 ++++++++++++++++++++++++++++++++++
>>>>    1 file changed, 34 insertions(+)
>>>>
>>>> diff --git a/sound/soc/sunxi/sun50i-dmic.c b/sound/soc/sunxi/sun50i-dmic.c
>>>> index c76628bc86c6..f8613d8c3462 100644
>>>> --- a/sound/soc/sunxi/sun50i-dmic.c
>>>> +++ b/sound/soc/sunxi/sun50i-dmic.c
>>>> @@ -14,6 +14,7 @@
>>>>    #include <sound/dmaengine_pcm.h>
>>>>    #include <sound/pcm_params.h>
>>>>    #include <sound/soc.h>
>>>> +#include <sound/tlv.h>
>>>>    
>>>>    #define SUN50I_DMIC_EN_CTL			(0x00)
>>>>    	#define SUN50I_DMIC_EN_CTL_GLOBE			BIT(8)
>>>> @@ -43,6 +44,17 @@
>>>>    	#define SUN50I_DMIC_CH_NUM_N_MASK			GENMASK(2, 0)
>>>>    #define SUN50I_DMIC_CNT				(0x2c)
>>>>    	#define SUN50I_DMIC_CNT_N				(1 << 0)
>>>> +#define SUN50I_DMIC_D0D1_VOL_CTR		(0x30)
>>>> +	#define SUN50I_DMIC_D0D1_VOL_CTR_0R			(0)
>>>> +	#define SUN50I_DMIC_D0D1_VOL_CTR_0L			(8)
>>>> +	#define SUN50I_DMIC_D0D1_VOL_CTR_1R			(16)
>>>> +	#define SUN50I_DMIC_D0D1_VOL_CTR_1L			(24)
>>>> +#define SUN50I_DMIC_D2D3_VOL_CTR                (0x34)
>>>> +        #define SUN50I_DMIC_D2D3_VOL_CTR_2R                     (0)
>>>> +        #define SUN50I_DMIC_D2D3_VOL_CTR_2L                     (8)
>>>> +        #define SUN50I_DMIC_D2D3_VOL_CTR_3R                     (16)
>>>> +        #define SUN50I_DMIC_D2D3_VOL_CTR_3L                     (24)
>>>> +
>>>>    #define SUN50I_DMIC_HPF_CTRL			(0x38)
>>>>    #define SUN50I_DMIC_VERSION			(0x50)
>>>>    
>>>> @@ -273,8 +285,30 @@ static const struct of_device_id sun50i_dmic_of_match[] = {
>>>>    };
>>>>    MODULE_DEVICE_TABLE(of, sun50i_dmic_of_match);
>>>>    
>>>> +static const DECLARE_TLV_DB_SCALE(sun50i_dmic_vol_scale, -12000, 75, 1);
>>> DECLARE_TLV_DB_SCALE is old name, SNDRV_CTL_TLVD_DECLARE_DB_SCALE should be
>>> used instead.
>> I can't seem to find that define in HEAD. what code-base are you
>> referring to that i should checkout ?
> Here is define:
> https://elixir.bootlin.com/linux/v6.9-rc1/source/include/uapi/sound/tlv.h#L52
>
> However, I'm not sure if this message means DECLARE_TLV_DB_SCALE is
> deprecated or not:
> https://elixir.bootlin.com/linux/v6.9-rc1/source/include/sound/tlv.h#L12

Right, apparently i sneaked in another D in the name. That explains i 
could not find it.

Will send v1 in a few minutes. Thanks.

Kind regards,

Joao

> Best regards,
> Jernej
>
>>> Other than that, it looks fine.
>> Thanks.
>>
>>> Best regards,
>>> Jernej
>>>
>>>> +
>>>> +static const struct snd_kcontrol_new sun50i_dmic_controls[] = {
>>>> +
>>>> +        SOC_DOUBLE_TLV("DMIC Channel 0 Capture Volume", SUN50I_DMIC_D0D1_VOL_CTR,
>>>> +                       SUN50I_DMIC_D0D1_VOL_CTR_0L, SUN50I_DMIC_D0D1_VOL_CTR_0R,
>>>> +                       0xFF, 0, sun50i_dmic_vol_scale),
>>>> +        SOC_DOUBLE_TLV("DMIC Channel 1 Capture Volume", SUN50I_DMIC_D0D1_VOL_CTR,
>>>> +                       SUN50I_DMIC_D0D1_VOL_CTR_1L, SUN50I_DMIC_D0D1_VOL_CTR_1R,
>>>> +                       0xFF, 0, sun50i_dmic_vol_scale),
>>>> +        SOC_DOUBLE_TLV("DMIC Channel 2 Capture Volume", SUN50I_DMIC_D2D3_VOL_CTR,
>>>> +                       SUN50I_DMIC_D2D3_VOL_CTR_2L, SUN50I_DMIC_D2D3_VOL_CTR_2R,
>>>> +                       0xFF, 0, sun50i_dmic_vol_scale),
>>>> +        SOC_DOUBLE_TLV("DMIC Channel 3 Capture Volume", SUN50I_DMIC_D2D3_VOL_CTR,
>>>> +                       SUN50I_DMIC_D2D3_VOL_CTR_3L, SUN50I_DMIC_D2D3_VOL_CTR_3R,
>>>> +                       0xFF, 0, sun50i_dmic_vol_scale),
>>>> +
>>>> +
>>>> +};
>>>> +
>>>>    static const struct snd_soc_component_driver sun50i_dmic_component = {
>>>>    	.name           = "sun50i-dmic",
>>>> +	.controls	= sun50i_dmic_controls,
>>>> +	.num_controls	= ARRAY_SIZE(sun50i_dmic_controls),
>>>>    };
>>>>    
>>>>    static int sun50i_dmic_runtime_suspend(struct device *dev)
>>>>
>>>
>>>
>> Kind regards,
>>
>> Joao
>>
>>
>
>
>
