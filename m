Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 031AC706C4B
	for <lists+alsa-devel@lfdr.de>; Wed, 17 May 2023 17:11:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 36F20200;
	Wed, 17 May 2023 17:10:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 36F20200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684336273;
	bh=BrW8utkPJOxoIND7izOm/XEslPXwZWFXJRck8b/4gfM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=gd07/TJg1vG8aghzZ3hJZPw1ut2XGkgYSmp4LM7rCCnIBPx6INofDYx9RchNiyzfp
	 5C8lygW9WfSixdkfa7iwqVCRV0ehdy44Jdb4eOjCjTtJP6O27vvHoO2Bz8TO/c8/1c
	 QlQS7UocyvkDy2LK0R9aPskkCKibCHZlBjmKH9cY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EBB3DF80549; Wed, 17 May 2023 17:10:22 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5C9E3F8025A;
	Wed, 17 May 2023 17:10:22 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3B3E1F802E8; Wed, 17 May 2023 17:10:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [46.235.227.172])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 67290F8016A
	for <alsa-devel@alsa-project.org>; Wed, 17 May 2023 17:10:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 67290F8016A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=collabora.com header.i=@collabora.com
 header.a=rsa-sha256 header.s=mail header.b=FuRybqK3
Received: from [IPV6:2001:b07:2ed:14ed:a962:cd4d:a84:1eab] (unknown
 [IPv6:2001:b07:2ed:14ed:a962:cd4d:a84:1eab])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 81954660588A;
	Wed, 17 May 2023 16:10:11 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1684336212;
	bh=BrW8utkPJOxoIND7izOm/XEslPXwZWFXJRck8b/4gfM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=FuRybqK3UvoHRJVoF0gtJq7kqiuCcsKekfjjhb5FSLWjBNJklmmij6wRSym/gTVSd
	 PeUmkXloGmT8DMC7ypKNSwpPCi7HwtIsTfb5dDltnzn7XyId5bDAHyBsuq99dbKbaO
	 qV2acIPdh7HYFcfPWTHkypsPGJEgiqHDkL/41RfQYK3JvWfyc3bM/eqAEChYLWPkUK
	 e3xuHQXJ9jR9m+sngBhcfi4FCD0PuoDq5/oqFLOmikXaNrbDjoHuuBLeYPTDFrkxOJ
	 0mRHrdJiPmYhd52jCx+gvylcbI/CezvomXKablFTISBJWRzIu6KZ9eO8GooGD38j+K
	 u5x+MqDbpHy1w==
Message-ID: <aee5f540-4f8b-f087-57d4-bfdafa4a0568@collabora.com>
Date: Wed, 17 May 2023 17:10:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH 2/5] ASoC: mediatek: mt8188-mt6359: register hdmi/dp jack
 pins
Content-Language: en-US
To: =?UTF-8?B?VHJldm9yIFd1ICjlkLPmlofoia8p?= <Trevor.Wu@mediatek.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "broonie@kernel.org" <broonie@kernel.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>, "tiwai@suse.com"
 <tiwai@suse.com>, "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "perex@perex.cz" <perex@perex.cz>
Cc: "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
References: <20230517111534.32630-1-trevor.wu@mediatek.com>
 <20230517111534.32630-3-trevor.wu@mediatek.com>
 <154497b3-f5c7-45d6-edd5-729642b80be5@collabora.com>
 <9685a64561fc90d592481ae5e95d1e849fe3c55b.camel@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <9685a64561fc90d592481ae5e95d1e849fe3c55b.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Message-ID-Hash: DRMGND2KO4ME5Z6H7NBPLOFIDDV7FDGJ
X-Message-ID-Hash: DRMGND2KO4ME5Z6H7NBPLOFIDDV7FDGJ
X-MailFrom: angelogioacchino.delregno@collabora.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DRMGND2KO4ME5Z6H7NBPLOFIDDV7FDGJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Il 17/05/23 14:10, Trevor Wu (吳文良) ha scritto:
> On Wed, 2023-05-17 at 13:31 +0200, AngeloGioacchino Del Regno wrote:
>> External email : Please do not click links or open attachments until
>> you have verified the sender or the content.
>>
>>
>> Il 17/05/23 13:15, Trevor Wu ha scritto:
>>> Some userspace applications need jack control events, so register
>>> hdmi
>>> and dp jack pins to activate jack control events.
>>>
>>> Signed-off-by: Trevor Wu <trevor.wu@mediatek.com>
>>> ---
>>>    sound/soc/mediatek/mt8188/mt8188-mt6359.c | 27
>>> +++++++++++++++++++----
>>>    1 file changed, 23 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/sound/soc/mediatek/mt8188/mt8188-mt6359.c
>>> b/sound/soc/mediatek/mt8188/mt8188-mt6359.c
>>> index 833bc362dad2..6c3f36e2fffd 100644
>>> --- a/sound/soc/mediatek/mt8188/mt8188-mt6359.c
>>> +++ b/sound/soc/mediatek/mt8188/mt8188-mt6359.c
>>> @@ -151,6 +151,20 @@ struct mt8188_mt6359_priv {
>>>        struct snd_soc_jack hdmi_jack;
>>>    };
>>>
>>> +static struct snd_soc_jack_pin mt8188_hdmi_jack_pins[] = {
>>> +     {
>>> +             .pin = "HDMI",
>>
>> "HDMI Jack" is more consistent with the snd_soc_jack_new_pins() call
>> performed
>> later.
> 
> Hi Angelo,
> 
> I see jack_kctl_name_gen() will append "Jack" to the name if I don't
> name the pin "HDMI Jack". Do you mean that I could directly use "HDMI
> Jack" because ALSA uses the name finally?
> 

You're right and I just checked; the comment even says
'remove redundant " Jack" from src_name'

So yes, the current names are fine. Sorry about that.

Regards,
Angelo

