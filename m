Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 21111792F76
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Sep 2023 22:06:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6A2167F1;
	Tue,  5 Sep 2023 22:05:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6A2167F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693944396;
	bh=rx7JKZ+OS1Nq7Amjoo6aePjgwrrZH8Qp1tnxqXahcCo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=NogknrHnpuebq1rCWVJmsbv3b1Vyk8XYBx3WALH9IeQelLfipZ8RICK9lAmUZ8NrB
	 XT9o//3ugl5bgm0mD0OMXIc/E4OS5sTwZaq7C0f4sw3/wlPc8rmlGj9OzTA23++Kcr
	 gm0aIRKZ77aHjof1SLejwNyWtzIaqnbsaqIxzjgY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EA55EF80552; Tue,  5 Sep 2023 22:05:45 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8D301F8047D;
	Tue,  5 Sep 2023 22:05:45 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 66412F80494; Tue,  5 Sep 2023 22:05:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8C1C6F80431
	for <alsa-devel@alsa-project.org>; Tue,  5 Sep 2023 22:05:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8C1C6F80431
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=collabora.com header.i=@collabora.com
 header.a=rsa-sha256 header.s=mail header.b=TTbcRdlH
Received: from [192.168.1.90] (unknown [81.18.92.207])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id DD61966071F8;
	Tue,  5 Sep 2023 21:05:30 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1693944331;
	bh=rx7JKZ+OS1Nq7Amjoo6aePjgwrrZH8Qp1tnxqXahcCo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=TTbcRdlHMnEYhX251dp8jJqg2DDJ+9OuyzILhYlXa8dDmP+a4rfodZh7FkU2HlVzb
	 nlvRtja8N3QO7+h86MWQ/+OTOzc0cbEibcTTvpTPw0RmU2ESCWLiocj9fbW4kP7Q2A
	 O7bVKlbXR5iOXeQ+3+cRLztJhsPhDpJaHgJsLVjjdfEHmM8/PjIQzYxQBu4juBiTpR
	 WQx6H20lL6u87DFch6svtwiPGyd/LKzddj5Xox5qmxjYhS7as04gd1Bp2IkTH9/iWK
	 RtJqvxx8iHGzEKbA0jX0Wj+ZtQF2/gNrBEbKyoq8PquA0F+KAztjNBFh+UKFrIULKr
	 d628+9lxXU9Tw==
Message-ID: <1cd66d6d-6a39-41eb-8646-0a6e6f473e8d@collabora.com>
Date: Tue, 5 Sep 2023 23:05:28 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/9] ASoC: cs35l41: Fix broken shared boost activation
Content-Language: en-US
To: "Rhodes, David" <drhodes@opensource.cirrus.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: James Schulman <james.schulman@cirrus.com>,
 David Rhodes <david.rhodes@cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Stefan Binding <sbinding@opensource.cirrus.com>,
 alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
 linux-kernel@vger.kernel.org, kernel@collabora.com
References: <20230902210621.1184693-1-cristian.ciocaltea@collabora.com>
 <20230902210621.1184693-5-cristian.ciocaltea@collabora.com>
 <20230905102933.GL103419@ediswmail.ad.cirrus.com>
 <c3328c1d-07f4-ae3f-88cd-b4b767a667b2@opensource.cirrus.com>
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <c3328c1d-07f4-ae3f-88cd-b4b767a667b2@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: MCUVUK3CHE6QQWJE5C2SHJAAVXLJDYBD
X-Message-ID-Hash: MCUVUK3CHE6QQWJE5C2SHJAAVXLJDYBD
X-MailFrom: cristian.ciocaltea@collabora.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MCUVUK3CHE6QQWJE5C2SHJAAVXLJDYBD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 9/5/23 21:11, Rhodes, David wrote:
> On 9/5/23 5:29 AM, Charles Keepax wrote:
>> On Sun, Sep 03, 2023 at 12:06:16AM +0300, Cristian Ciocaltea wrote:
>>> Enabling the active/passive shared boosts involves writing the MDSYNC UP
>>> register sequence, which cannot be performed before receiving the PLL
>>> lock signal.
>>>
> 
>>
>> Thanks for looking at this apologies this was missed in the
>> initial review of the patch.
>>
> 
> Thanks Cristian, I agree with the intent of your patch.
> We do not expect that clocks are always available before the DAPM PMU
> event and shared boost should still be configured if they are not.
> 
>>> +int cs35l41_mdsync_up(struct regmap *regmap)
>>> +{
>>> +    struct reg_sequence cs35l41_mdsync_up_seq[] = {
>>> +        {CS35L41_PWR_CTRL3, 0},
>>> +        {CS35L41_PWR_CTRL1, 0x00000000, 3000},
>>> +        {CS35L41_PWR_CTRL1, 0x00000001, 3000},
>>> +    };
> 
> I don't know why PWR_CTRL1 is included in the up sequence here.
> This toggles GLOBAL_EN, which will cause the PLL to unlock and lock
> again. Doing this defeats the purpose of setting SYNC_EN in a separate
> operation, which is to only do so when the amp is powered on and has
> locked the PLL. GLOBAL_EN is set by the mdsync_down_seq, so all that is
> needed when the PLL is locked is to set SYNC_EN.

Unfortunately I had to rely on the existing implementation as I don't 
have access to the datasheet.

If I got it right, we should drop all write operations on PWR_CTRL1, 
and simply set the CS35L41_SYNC_EN_MASK bit in PWR_CTRL3.
 
>>
>> Is this now safe? By pulling this out into a worker thread, it is
>> no longer under the DAPM lock, which makes me worry this can race
>> with the other uses of PWR_CTRL3 which could theoretically change
>> state between when you read the reg and when you write it.

That's a good point, it should be fixed implicitly by replacing the 
read/write operations with a single regmap_update_bits() call, which 
is protected by regmap's internal lock.

> 
> The Class-H DAPM widget also uses the PWR_CTRL3 register.
> 
>>
>> One question I might also have would be does a worker thread make
>> more sense or would it be simpler to do the mdsync power up
>> directly in response to the PLL lock IRQ?
>>
> 
> I  agree with implementing this in the PLL lock IRQ.
> As I described above, all that would need to be done is to set SYNC_EN
> in the PLL Lock IRQ handler.

As a matter of fact I initially considered doing this in the IRQ handler, 
but I also wanted to understand the reasoning behind current solution. 
Therefore I searched the ML archive for any relevant review comments, 
and I came across [1] which raises some concerns regarding the PLL lock 
signal, e.g. lack of documentation regarding trigger time & frequency.

If going with the IRQ handler approach is still the recommended approach,
I will handle it in v2.

Thanks for reviewing,
Cristian

[1] https://lore.kernel.org/all/20230207114855.GC36097@ediswmail.ad.cirrus.com/
