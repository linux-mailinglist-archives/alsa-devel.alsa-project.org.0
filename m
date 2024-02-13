Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3755D852D4E
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Feb 2024 11:01:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A351A86F;
	Tue, 13 Feb 2024 11:00:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A351A86F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1707818469;
	bh=cVV/IHvHgosEFZwF8TVZgUPovyuJO6ZLbQNTlYmYIms=;
	h=From:To:CC:References:In-Reply-To:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=sVRmQN+v9eGN5oIsMmxZ0JqAw0drEYA2OTaL6cIImkbZ5XoqiCC+VwXzJOZLKxozY
	 RQ3AVJcEzLfCnX6sI2Vn4g+L9+HIFfjBjg37q2il4Q00RPMLc+3LxXfSXlg44aR2CS
	 +nxCdS7iT3nsk3AJqj+WiLyBIe109+ievGqvibYM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C7141F80588; Tue, 13 Feb 2024 11:00:36 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E1D80F805A1;
	Tue, 13 Feb 2024 11:00:35 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1CF13F80238; Tue, 13 Feb 2024 11:00:26 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 6475DF8015B
	for <alsa-devel@alsa-project.org>; Tue, 13 Feb 2024 11:00:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6475DF8015B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=DJ6FBow3
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 41D6usn6030912;
	Tue, 13 Feb 2024 04:00:07 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:references:in-reply-to:subject:date:message-id
	:mime-version:content-type:content-transfer-encoding; s=
	PODMain02222019; bh=RLSQFPTXCZBB55mewGC3/S3cyEfZxcsMBJJpNhdcNt4=; b=
	DJ6FBow3hk9Y64sQGT+Sibpc0GPRWb1aMIf1T6YR2E1g1b2Q0xZPjwBGyWdVhJ8P
	v0lXstwqh/pcFmenTwfnvKWhHH5c19bCHOc4MN5Lm7esb3bp7yPWCNN6OhgbJXll
	tt+uxHBrwD+WiVv/wwoJmtS/2b58IP7VT1i/IVByczEwSdKw07Wsv58RkGwZ1SvR
	qbHLZdctdqnMBL8Am/Xstlc7D8e1V3Vn9T/8qZuKb7iXdbMAshc8KEBU2vSGPPlY
	pjNwr/0dhVm6ZmpXs7qnbMA/jqYG6B0iYd9nK/G3KGOPKk757e9oOXJ8rgtJ90rd
	EpEjVGU451Np8bWgVBijpw==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3w67e22y13-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 13 Feb 2024 04:00:07 -0600 (CST)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Tue, 13 Feb
 2024 10:00:03 +0000
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 ediex01.ad.cirrus.com (198.61.84.80) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40 via Frontend Transport; Tue, 13 Feb 2024 10:00:03 +0000
Received: from LONN2DGDQ73 (LONN2DGDQ73.ad.cirrus.com [198.61.64.235])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 53A2F820243;
	Tue, 13 Feb 2024 10:00:03 +0000 (UTC)
From: Stefan Binding <sbinding@opensource.cirrus.com>
To: 'Tomasz Kudela' <ramzes005@gmail.com>
CC: <alsa-devel@alsa-project.org>, <andy.chi@canonical.com>,
        <david.rhodes@cirrus.com>, <james.schulman@cirrus.com>,
        <kailang@realtek.com>, <linux-kernel@vger.kernel.org>,
        <linux-sound@vger.kernel.org>, <luke@ljones.dev>,
        <patches@opensource.cirrus.com>, <perex@perex.cz>,
        <rf@opensource.cirrus.com>, <ruinairas1992@gmail.com>,
        <shenghao-ding@ti.com>, <tiwai@suse.com>,
        <vitalyr@opensource.cirrus.com>
References: <20240212193327.59507-1-ramzes005@gmail.com>
 <20240213082116.15049-1-ramzes005@gmail.com>
In-Reply-To: <20240213082116.15049-1-ramzes005@gmail.com>
Subject: RE: [PATCH v2] Add Lenovo Legion 7i gen7 sound quirk
Date: Tue, 13 Feb 2024 10:00:03 +0000
Message-ID: <000101da5e63$6a2565e0$3e7031a0$@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQL5cxh77Ymk4rKL11VQD0BqvrFTygGP9Uvorr1f3IA=
X-Proofpoint-ORIG-GUID: 4w35IuzkN3UfhFYAz8bRE5jDqIfh_Shl
X-Proofpoint-GUID: 4w35IuzkN3UfhFYAz8bRE5jDqIfh_Shl
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: DDMTUE46FU7EGDD3PAH2KS437XVBADDU
X-Message-ID-Hash: DDMTUE46FU7EGDD3PAH2KS437XVBADDU
X-MailFrom: prvs=97731e7e6d=sbinding@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DDMTUE46FU7EGDD3PAH2KS437XVBADDU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi,

> -----Original Message-----
> From: Tomasz Kudela <ramzes005@gmail.com>
> Sent: Tuesday, February 13, 2024 8:21 AM
> To: ramzes005@gmail.com
> Cc: alsa-devel@alsa-project.org; andy.chi@canonical.com;
> david.rhodes@cirrus.com; james.schulman@cirrus.com;
> kailang@realtek.com; linux-kernel@vger.kernel.org; linux-
> sound@vger.kernel.org; luke@ljones.dev;
> patches@opensource.cirrus.com; perex@perex.cz;
> rf@opensource.cirrus.com; ruinairas1992@gmail.com;
> sbinding@opensource.cirrus.com; shenghao-ding@ti.com;
> tiwai@suse.com; vitalyr@opensource.cirrus.com
> Subject: [PATCH v2] Add Lenovo Legion 7i gen7 sound quirk
> 
> From: "T. Kudela" <ramzes005@gmail.com>
> 
> Add sound support for the Legion 7i gen7 laptop (16IAX7).
> 
> Signed-off-by: Tomasz Kudela <ramzes005@gmail.com>
> ---
>  sound/pci/hda/cs35l41_hda_property.c | 2 ++
>  sound/pci/hda/patch_realtek.c        | 1 +
>  2 files changed, 3 insertions(+)
> 
> diff --git a/sound/pci/hda/cs35l41_hda_property.c
> b/sound/pci/hda/cs35l41_hda_property.c
> index d74cf11eef1e..8a6b484b2184 100644
> --- a/sound/pci/hda/cs35l41_hda_property.c
> +++ b/sound/pci/hda/cs35l41_hda_property.c
> @@ -95,6 +95,7 @@ static const struct cs35l41_config
> cs35l41_config_table[] = {
>  	{ "10431F12", 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0
> }, 0, 1, -1, 1000, 4500, 24 },
>  	{ "10431F1F", 2, EXTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0
> }, 1, -1, 0, 0, 0, 0 },
>  	{ "10431F62", 2, EXTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0
> }, 1, 2, 0, 0, 0, 0 },
> +	{ "17AA386F", 2, EXTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0
> }, 0, 1, -1, 0, 0, 0 },

I don't believe this laptop has a Speaker ID, so this configuration
should be:

{ "17AA386F", 2, EXTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 0,
-1, -1, 0, 0, 0 },

Thanks,
Stefan

>  	{ "17AA38B4", 2, EXTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0
> }, 0, 1, -1, 0, 0, 0 },
>  	{ "17AA38B5", 2, EXTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0
> }, 0, 1, -1, 0, 0, 0 },
>  	{ "17AA38B6", 2, EXTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0
> }, 0, 1, -1, 0, 0, 0 },
> @@ -431,6 +432,7 @@ static const struct cs35l41_prop_model
> cs35l41_prop_model_table[] = {
>  	{ "CSC3551", "10431F12", generic_dsd_config },
>  	{ "CSC3551", "10431F1F", generic_dsd_config },
>  	{ "CSC3551", "10431F62", generic_dsd_config },
> +	{ "CSC3551", "17AA386F", generic_dsd_config },
>  	{ "CSC3551", "17AA38B4", generic_dsd_config },
>  	{ "CSC3551", "17AA38B5", generic_dsd_config },
>  	{ "CSC3551", "17AA38B6", generic_dsd_config },
> diff --git a/sound/pci/hda/patch_realtek.c
> b/sound/pci/hda/patch_realtek.c
> index 6994c4c5073c..0029f61d4693 100644
> --- a/sound/pci/hda/patch_realtek.c
> +++ b/sound/pci/hda/patch_realtek.c
> @@ -10260,6 +10260,7 @@ static const struct snd_pci_quirk
> alc269_fixup_tbl[] = {
>  	SND_PCI_QUIRK(0x17aa, 0x3853, "Lenovo Yoga 7 15ITL5",
> ALC287_FIXUP_YOGA7_14ITL_SPEAKERS),
>  	SND_PCI_QUIRK(0x17aa, 0x3855, "Legion 7 16ITHG6",
> ALC287_FIXUP_LEGION_16ITHG6),
>  	SND_PCI_QUIRK(0x17aa, 0x3869, "Lenovo Yoga7 14IAL7",
> ALC287_FIXUP_YOGA9_14IAP7_BASS_SPK_PIN),
> +	SND_PCI_QUIRK(0x17aa, 0x386f, "Legion 7i 16IAX7",
> ALC287_FIXUP_CS35L41_I2C_2),
>  	SND_PCI_QUIRK(0x17aa, 0x3870, "Lenovo Yoga 7 14ARB7",
> ALC287_FIXUP_YOGA7_14ARB7_I2C),
>  	SND_PCI_QUIRK(0x17aa, 0x387d, "Yoga S780-16 pro Quad AAC",
> ALC287_FIXUP_TAS2781_I2C),
>  	SND_PCI_QUIRK(0x17aa, 0x387e, "Yoga S780-16 pro Quad YC",
> ALC287_FIXUP_TAS2781_I2C),
> --
> 2.34.1
> 


