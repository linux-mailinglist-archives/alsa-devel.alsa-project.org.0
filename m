Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B24877FEC71
	for <lists+alsa-devel@lfdr.de>; Thu, 30 Nov 2023 11:00:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ECC57DEF;
	Thu, 30 Nov 2023 11:00:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ECC57DEF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701338443;
	bh=XJXTd0OT4xNI7eBFH2hkpydz+XyJc2sXDu1qAxhmFMU=;
	h=Date:From:To:CC:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=vh7iQ2GyLj7LFXgPKSLVNDXiegK+eFahlTpLMgl2yROBbRW9roxPpxHbC+pryyiXo
	 sVF3Dan2qGqhcRd5a6b4SxmAQ2v0oyFEfmfOatH/iPOTQgcea3IrGya6MfwueUrays
	 YZXDjsZzZFMgRMMos6YIbsl2KtvpgFYUKu1EQQ5w=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 04861F80564; Thu, 30 Nov 2023 11:00:10 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6BCE6F80571;
	Thu, 30 Nov 2023 11:00:10 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 682F9F8016E; Thu, 30 Nov 2023 10:58:57 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5D76FF800F5
	for <alsa-devel@alsa-project.org>; Thu, 30 Nov 2023 10:58:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5D76FF800F5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=DyD2BmfQ
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 3AU794Rx032229;
	Thu, 30 Nov 2023 03:58:47 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	date:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to; s=PODMain02222019; bh=1rOwpFjOxzEjLmE
	ZDplb6yDZq9WDb8VUAMixCUzaH4g=; b=DyD2BmfQHB0BvZFAzh87LUECHRuw7RE
	f6x/idiqOmNFOS/TUrUXtDf5/fzDyk0CV4u0Fd1h9HQS90Zh8PlRh+5bE//C5aPc
	TcCD34t4nD5DvavIZrkhw7o/4Iqv6D82VjKXV0UOcFqFCajZOXziJyRpjMtTi0LG
	ylXkvbrHYyDcAi+QS7fJ98/Bu9OqeVDtwvF+MdkXQfc/J9f078jyVJ8dTQtEbV+l
	VAxA5jYmt5rmrnWPvMtUJDB/lhcE1kB0IEWvxj4GLGc2QMM61cSeqsydsCOsoBJ5
	S9E9FxTUcl3Nm3wFHF1e4/LWgHbPE4VwEQ7HGTchgE8wyxggWF2tFvw==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3unvhp9vgn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 30 Nov 2023 03:58:47 -0600 (CST)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.39; Thu, 30 Nov
 2023 09:58:44 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.39 via Frontend Transport; Thu, 30 Nov 2023 09:58:39 +0000
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com
 [198.61.86.93])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 7B3F646B;
	Thu, 30 Nov 2023 09:58:39 +0000 (UTC)
Date: Thu, 30 Nov 2023 09:58:39 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Linus Walleij <linus.walleij@linaro.org>
CC: Paul Handrigan <Paul.Handrigan@cirrus.com>,
        James Schulman
	<james.schulman@cirrus.com>,
        David Rhodes <david.rhodes@cirrus.com>,
        "Richard
 Fitzgerald" <rf@opensource.cirrus.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, "Takashi
 Iwai" <tiwai@suse.com>,
        Hartley Sweeten <hsweeten@visionengravers.com>,
        Alexander Sverdlin <alexander.sverdlin@gmail.com>,
        Nikita Shubin
	<nikita.shubin@maquefel.me>,
        <alsa-devel@alsa-project.org>, <patches@opensource.cirrus.com>,
        <linux-sound@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH 00/10] ASoC: Convert Cirrus codecs to GPIO descriptors
Message-ID: <20231130095839.GS32655@ediswmail.ad.cirrus.com>
References: <20231129-descriptors-sound-cirrus-v1-0-31aa74425ff8@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20231129-descriptors-sound-cirrus-v1-0-31aa74425ff8@linaro.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-GUID: zg2bKV2ldjblk2ECC4yce6v9havYl31k
X-Proofpoint-ORIG-GUID: zg2bKV2ldjblk2ECC4yce6v9havYl31k
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: JDRZURIVONNY265J6GM7X67HBQV3ADCR
X-Message-ID-Hash: JDRZURIVONNY265J6GM7X67HBQV3ADCR
X-MailFrom: prvs=76980857b9=ckeepax@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JDRZURIVONNY265J6GM7X67HBQV3ADCR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, Nov 29, 2023 at 10:28:36PM +0100, Linus Walleij wrote:
> This series walks over the Cirrus Logic ASoC drivers and
> clean out the use of legacy GPIO numbers and legacy
> GPIO APIs.
> 
> The CS4271 affects an ASoC driver for EP93xx which Nikita is
> actively working on moving over to device tree, so I don't
> know about that patch specifically, but I think the collision
> would be max "the file was deleted".
> 
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---

Except for the typo Mark spotted the series looks good to me:

Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
