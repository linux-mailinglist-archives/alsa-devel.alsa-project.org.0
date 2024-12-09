Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DF80F9E901B
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Dec 2024 11:27:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0F8BC857;
	Mon,  9 Dec 2024 11:27:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0F8BC857
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1733740044;
	bh=DwprayAsRbxlOZeWXOFPlnqBe65LrNBQCeIZ5sLxRhw=;
	h=Date:Subject:To:CC:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=l47Ri8zYz8HgYvkqEfTcULRbA0IwyLuo7O/6Q9lTWxRQnTLR1YZEDOsedB11WCKwP
	 MlyylTGAER/QHkcJF/LAJ19dJsfeDiwb2vub1G13BP0t5P0e4FprP7V0Uu35u+C+yW
	 GU4yipZPeJn220rZ6tH8akcO+Uq9mwFt55z0TH78=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A8E34F805AD; Mon,  9 Dec 2024 11:26:51 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 26AA7F805BA;
	Mon,  9 Dec 2024 11:26:51 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9B820F80482; Mon,  9 Dec 2024 11:26:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 92DFAF8032D
	for <alsa-devel@alsa-project.org>; Mon,  9 Dec 2024 11:26:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 92DFAF8032D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=bRnZp1DX
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id
 4B92URrX022860;
	Mon, 9 Dec 2024 04:26:42 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=6ELUabJeV2DuJWxQPcmBua6WsWFynHySKPd0DBqNBb0=; b=
	bRnZp1DXHMfTK2APMmzw0GUG16a0hB8ANO7u3NAl9oFzXWX3Y7VB6+D0+zqSR70B
	yAuov7f4KWN7hH/KR1c4xTMS6P8z5kaVyGBDjdfiKRl9MmAyJSfchzLzsE++W+kQ
	qQvWWm8ZMfPlTKuo5QevD23fzI2SDMixnDf2FpCzHfWmF8TSAMVlqUJqXJ8zuO19
	CxOEBK6GafQ9OG0TaMtkAoelE922GNVJrjOQeEg3dGZzT2x15jA1HdGdJCs+vi8P
	gpVLPNynoltdcetKkwP4yy0jOB8u+DO7AaN6+pSrPNEWjwh8+xOAQVoMoP8J5Tx5
	ZBi388JmOVR6jNHqya1J9A==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 43cmn21u5a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 09 Dec 2024 04:26:42 -0600 (CST)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.13; Mon, 9 Dec
 2024 10:26:39 +0000
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex01.ad.cirrus.com (198.61.84.80) with Microsoft SMTP Server id
 15.2.1544.13 via Frontend Transport; Mon, 9 Dec 2024 10:26:39 +0000
Received: from [198.90.208.18] (ediswws06.ad.cirrus.com [198.90.208.18])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 94922820248;
	Mon,  9 Dec 2024 10:26:39 +0000 (UTC)
Message-ID: <edff6f0d-7f2e-4a27-b14f-f079855a737c@opensource.cirrus.com>
Date: Mon, 9 Dec 2024 10:26:39 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/17] ASoC: remove snd_soc_dai_set_tristate()
To: Charles Keepax <ckeepax@opensource.cirrus.com>,
        Kuninori Morimoto
	<kuninori.morimoto.gx@renesas.com>
CC: =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
        =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
        Daniel Mack
	<daniel@zonque.org>,
        David Rhodes <david.rhodes@cirrus.com>,
        Haojian Zhuang
	<haojian.zhuang@gmail.com>,
        Jaroslav Kysela <perex@perex.cz>,
        "Lars-Peter
 Clausen" <lars@metafoo.de>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Luca
 Ceresoli <luca.ceresoli@bootlin.com>,
        Mark Brown <broonie@kernel.org>,
        Peter
 Ujfalusi <peter.ujfalusi@gmail.com>,
        Robert Jarzmik <robert.jarzmik@free.fr>,
        "Takashi Iwai" <tiwai@suse.com>, <alsa-devel@alsa-project.org>,
        <linux-rpi-kernel@lists.infradead.org>, <linux-sound@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>
References: <87wmg9mhkk.wl-kuninori.morimoto.gx@renesas.com>
 <Z1a99HJuL04nWuqx@opensource.cirrus.com>
Content-Language: en-GB
From: Richard Fitzgerald <rf@opensource.cirrus.com>
In-Reply-To: <Z1a99HJuL04nWuqx@opensource.cirrus.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: FoClcTI9iDQt6WmgLjf93qdLdb-8gTkV
X-Proofpoint-ORIG-GUID: FoClcTI9iDQt6WmgLjf93qdLdb-8gTkV
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: XGTPXC6GNW4UMQI5IJ73LHYLK6J5JOKB
X-Message-ID-Hash: XGTPXC6GNW4UMQI5IJ73LHYLK6J5JOKB
X-MailFrom: prvs=90738ed0c1=rf@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XGTPXC6GNW4UMQI5IJ73LHYLK6J5JOKB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 09/12/2024 9:52 am, Charles Keepax wrote:
> On Mon, Dec 09, 2024 at 07:38:52AM +0000, Kuninori Morimoto wrote:
>> Hi Mark
>>
>> snd_soc_dai_set_tristate() has added in v2.6.27 (2008/Oct) by this commit
>>
>> 	8c6529dbf881303920a415c2d14a500218661949
>> 	("ALSA: asoc: core - add Digital Audio Interface (DAI) control functions.")
>>
>> But it has never been used during this 16 years.
>> Let's remove it.
> 
> We have definitely used it in out of tree code for some phones in
> our times. Whilst I don't feel super strongly, I would say it seems
> like fairly reasonable functionality and it does no harm, so I
> would vote to keep it.
> 
> Thanks,
> Charles

Yes, I'd forgotten that this function even existed. Now I've been
reminded of it, it's a useful function because our I2S/TDM DAIs have
configurable tri-stating. If we remove the function the alternative
of using a pinmux driver is a lot of overhead.

But the kerneldoc description is not very good:

"Tristates the DAI so that others can use it."

That makes it sound like it disables the DAI. Should it say "Set the DAI
TX pin to be hi-impedance in TDM slots where it is not transmitting"?
