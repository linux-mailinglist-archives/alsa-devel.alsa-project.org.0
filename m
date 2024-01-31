Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D909843F87
	for <lists+alsa-devel@lfdr.de>; Wed, 31 Jan 2024 13:38:00 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1F990DEE;
	Wed, 31 Jan 2024 13:37:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1F990DEE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1706704680;
	bh=Ve4gakTdVS97IwqTqcMnjzvWFWX6F6kTDN1mDs18iWk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=YFVD1xvnsM/1g8I98lNQKh35l3dgyfrduMXrcEaT3OmUQriRpa+gudyZEpt88Llah
	 Mlr9X2Q2MPK14tnSISdTZCXc5PLMlvr1zr38URDqO3tEZM90MWtyk+LalBuNHbJnrC
	 Cu+NlUZKuI2IQQTXqz2oybLxTKdmENED6GBgB1VI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 78E57F805AE; Wed, 31 Jan 2024 13:37:27 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 91503F80570;
	Wed, 31 Jan 2024 13:37:26 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C36BFF8055C; Wed, 31 Jan 2024 13:37:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [IPv6:2a00:1098:ed:100::25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DDC2CF8020D
	for <alsa-devel@alsa-project.org>; Wed, 31 Jan 2024 13:37:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DDC2CF8020D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=collabora.com header.i=@collabora.com
 header.a=rsa-sha256 header.s=mail header.b=41d6lcDs
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1706704635;
	bh=Ve4gakTdVS97IwqTqcMnjzvWFWX6F6kTDN1mDs18iWk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=41d6lcDsQ90ipamoTz3UtZcsw2iXlPy7t1JTzpmTLR9qEbkF37yICg6gufCEmP0xi
	 WikrqZ5S9PupmXPsKWNrWuwr2aMpfDF4Y5cy5uQhRf0fBEAaBbetM4/ChJaJNQ4T+c
	 5LnyycU1ikRrIP4h9TjQXLse8mkj35nDJorXGj47AR//KMgBFNOVWJgkBqcG033AnQ
	 26XmZh/XWEklOHVyRvibqt4MB36P9DxGhsgfcdpXqn1x3UqKWKXDaWUuy/Oljwtcmi
	 LvTmnmT2eqU2su1/k/KGbdmAaHNxHCsjOhhX5fh7AFIJUShIbrSH3R/UBn7xFO0oef
	 l5gafT5LSpoxw==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 65D1D378203B;
	Wed, 31 Jan 2024 12:37:14 +0000 (UTC)
Message-ID: <6020133f-53ee-4bbe-856f-7b7b0957081f@collabora.com>
Date: Wed, 31 Jan 2024 13:37:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [v3 2/3] ASoC: mediatek: mt8186: correct the HDMI widgets
Content-Language: en-US
To: =?UTF-8?B?SmlheGluIFl1ICjkv57lrrbpkasp?= <Jiaxin.Yu@mediatek.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "wenst@chromium.org" <wenst@chromium.org>,
 "ajye_huang@compal.corp-partner.google.com"
 <ajye_huang@compal.corp-partner.google.com>,
 =?UTF-8?B?Q2h1bnh1IExpICjmnY7mmKXml60p?= <Chunxu.Li@mediatek.com>,
 =?UTF-8?B?QWxsZW4tS0ggQ2hlbmcgKOeoi+WGoOWLsik=?=
 <Allen-KH.Cheng@mediatek.com>, "broonie@kernel.org" <broonie@kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "kuninori.morimoto.gx@renesas.com" <kuninori.morimoto.gx@renesas.com>,
 "andrzej.hajda@intel.com" <andrzej.hajda@intel.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 "robert.foss@linaro.org" <robert.foss@linaro.org>,
 "Laurent.pinchart@ideasonboard.com" <Laurent.pinchart@ideasonboard.com>,
 "neil.armstrong@linaro.org" <neil.armstrong@linaro.org>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "nfraprado@collabora.com" <nfraprado@collabora.com>
References: <20230730180803.22570-1-jiaxin.yu@mediatek.com>
 <20230730180803.22570-3-jiaxin.yu@mediatek.com>
 <25e6ab45-ecad-4bc3-bf4d-983243c939ad@sirena.org.uk>
 <c6ae8630d06138b6d0156c19323afebf0718f522.camel@mediatek.com>
 <089fe457-1c61-4b7b-ad37-a67e7f46cb56@sirena.org.uk>
 <6aa6947865795fc534b61f5b8a80b3c42fd5a0cd.camel@mediatek.com>
 <9c90185c-9cd4-4a08-9925-be5d460af54d@sirena.org.uk>
 <11f4cfd2-f6a2-45cb-923a-95760a1b9883@collabora.com>
 <aeef45d131e3e0131b57958253c85cd50a378f63.camel@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <aeef45d131e3e0131b57958253c85cd50a378f63.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Message-ID-Hash: KKYNBP6J2HLPQOPISDY37OD7QAWITKGL
X-Message-ID-Hash: KKYNBP6J2HLPQOPISDY37OD7QAWITKGL
X-MailFrom: angelogioacchino.delregno@collabora.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KKYNBP6J2HLPQOPISDY37OD7QAWITKGL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Il 31/01/24 13:25, Jiaxin Yu (俞家鑫) ha scritto:
> On Wed, 2024-01-31 at 12:42 +0100, AngeloGioacchino Del Regno wrote:
>> Il 03/08/23 21:33, Mark Brown ha scritto:
>>> On Thu, Aug 03, 2023 at 07:20:15AM +0000, Jiaxin Yu (俞家鑫) wrote:
>>>
>>>> I agree with you, in fact the speaker is indeed doing this way.
>>>> But
>>>> about the hdmi that on the board, I did not find a defination
>>>> link
>>>> snd_soc_dapm_hdmi, so I use snd_soc_dapm_line to replace. The
>>>> purpose
>>>> is to control it link speaker. Or what do you suggest I should
>>>> do?
>>>
>>> I think the sensible thing here is to define a DIGITAL_OUTPUT()
>>> which
>>> can be used for HDMI, S/PDIF and anything else that comes up and
>>> isn't
>>> clearly wrong like reusing one of the analog descriptions is.
>>
>> Hello Jiaxin,
>>
>> the MT8186 Corsola Chromebooks are broken upstream without this
>> series.
>>
>> Are you still interested in upstreaming this one?
>>
>> Thanks,
>> Angelo
> 
> Hello Angelo,
> 
> No, I'm still interesting in upstream this series. It's just that I
> have less time recently. I'm considering revisiting this issue next
> mouth. Do you have any suggestions for this?
> 

Nothing on top of Mark's suggestions.

Angelo


