Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AE78843EAC
	for <lists+alsa-devel@lfdr.de>; Wed, 31 Jan 2024 12:43:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E457DE0F;
	Wed, 31 Jan 2024 12:43:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E457DE0F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1706701418;
	bh=1LrKOT6zOkvOtdG1q90dBaEd32pdBD9e7IHCq6opG3E=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=bDenKa+9HQOZqGiueno3jYNJ+T9tddGnWjHQbyTJbMwLP9tZXlOXG8atIMFmrKqVe
	 5FQhZp9uYUF3gCwxk6ApUXoTICzbT5AkwjZsrqdslmiH6+64olLDkUMlcKiJyiBh8g
	 jIcCZPObCRc7Qec1NaMxuj61HB4SWNhmAmcBY6Rg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 73A23F80563; Wed, 31 Jan 2024 12:43:07 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E0772F8056F;
	Wed, 31 Jan 2024 12:43:05 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D3085F8055C; Wed, 31 Jan 2024 12:43:00 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7530AF804E7
	for <alsa-devel@alsa-project.org>; Wed, 31 Jan 2024 12:42:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7530AF804E7
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=collabora.com header.i=@collabora.com
 header.a=rsa-sha256 header.s=mail header.b=ABzV98aI
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1706701373;
	bh=1LrKOT6zOkvOtdG1q90dBaEd32pdBD9e7IHCq6opG3E=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ABzV98aIWDp/moh2/6kSB/75RQPaCX1CmoupAYsmYelEfLo0KtRw9iQs4R8ItoJ4R
	 r1mCT5mRcu9gnjvrMDcPN44gMPE4P3xt98NCrMUKooo1NS+eDLDrptHunAYN+Vl4m2
	 XJTlC4JKQakK4DZ0iOxlCy+AzQ+730fZWFI5MXlQojMjH2Ix9fps5FJIk0Lv7jD/6s
	 NQXi7vZDeFeKQKaLNGl7TygDovkqpVTeAufE/87T5HPAbA/lvOi0zpHp5IredGZXB8
	 R9BcWPxsOb5Sr7sJ7hV1ZrBXeRlpPNh/9iYFGj5xvIwGQnLzIO9ZHgtLCMINIcF/lA
	 ZpIrfScC/5ikQ==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 58C1B3781FE1;
	Wed, 31 Jan 2024 11:42:52 +0000 (UTC)
Message-ID: <11f4cfd2-f6a2-45cb-923a-95760a1b9883@collabora.com>
Date: Wed, 31 Jan 2024 12:42:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [v3 2/3] ASoC: mediatek: mt8186: correct the HDMI widgets
Content-Language: en-US
To: =?UTF-8?B?SmlheGluIFl1ICjkv57lrrbpkasp?= <Jiaxin.Yu@mediatek.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "ajye_huang@compal.corp-partner.google.com"
 <ajye_huang@compal.corp-partner.google.com>,
 =?UTF-8?B?Q2h1bnh1IExpICjmnY7mmKXml60p?= <Chunxu.Li@mediatek.com>,
 =?UTF-8?B?QWxsZW4tS0ggQ2hlbmcgKOeoi+WGoOWLsik=?=
 <Allen-KH.Cheng@mediatek.com>,
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
 "nfraprado@collabora.com" <nfraprado@collabora.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Mark Brown <broonie@kernel.org>, Chen-Yu Tsai <wenst@chromium.org>
References: <20230730180803.22570-1-jiaxin.yu@mediatek.com>
 <20230730180803.22570-3-jiaxin.yu@mediatek.com>
 <25e6ab45-ecad-4bc3-bf4d-983243c939ad@sirena.org.uk>
 <c6ae8630d06138b6d0156c19323afebf0718f522.camel@mediatek.com>
 <089fe457-1c61-4b7b-ad37-a67e7f46cb56@sirena.org.uk>
 <6aa6947865795fc534b61f5b8a80b3c42fd5a0cd.camel@mediatek.com>
 <9c90185c-9cd4-4a08-9925-be5d460af54d@sirena.org.uk>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <9c90185c-9cd4-4a08-9925-be5d460af54d@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Message-ID-Hash: BHR762HAFLG5QGTRDBF2TE2CR6AMOUDQ
X-Message-ID-Hash: BHR762HAFLG5QGTRDBF2TE2CR6AMOUDQ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BHR762HAFLG5QGTRDBF2TE2CR6AMOUDQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Il 03/08/23 21:33, Mark Brown ha scritto:
> On Thu, Aug 03, 2023 at 07:20:15AM +0000, Jiaxin Yu (俞家鑫) wrote:
> 
>> I agree with you, in fact the speaker is indeed doing this way. But
>> about the hdmi that on the board, I did not find a defination link
>> snd_soc_dapm_hdmi, so I use snd_soc_dapm_line to replace. The purpose
>> is to control it link speaker. Or what do you suggest I should do?
> 
> I think the sensible thing here is to define a DIGITAL_OUTPUT() which
> can be used for HDMI, S/PDIF and anything else that comes up and isn't
> clearly wrong like reusing one of the analog descriptions is.

Hello Jiaxin,

the MT8186 Corsola Chromebooks are broken upstream without this series.

Are you still interested in upstreaming this one?

Thanks,
Angelo
