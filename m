Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B977592775B
	for <lists+alsa-devel@lfdr.de>; Thu,  4 Jul 2024 15:43:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 83C6B14DD;
	Thu,  4 Jul 2024 15:43:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 83C6B14DD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1720100614;
	bh=OdKFGAEGDljVRH3KqT5PQmpzNTGROAowpEkKAVKVxtU=;
	h=From:To:CC:References:In-Reply-To:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=SE69MX5hU9kOFmwVnx6Z8i6LVji7+uY9nBBgX1QCVbpegoGZ9Urdmsw3tfNHjHWpQ
	 YhElJadRpBq5J6vbL/ubvGYTBGRumuqdQMcD0E5Me6jHggC2AudhiN1AO7MlB2JEN7
	 yC8/7EqMijYSXsEEA8xT6XxgmOPet7ORl7VMiHDA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E6412F805AE; Thu,  4 Jul 2024 15:43:01 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 920D8F800FA;
	Thu,  4 Jul 2024 15:42:59 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2DA92F8025E; Thu,  4 Jul 2024 15:35:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 58C6BF800FE
	for <alsa-devel@alsa-project.org>; Thu,  4 Jul 2024 15:34:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 58C6BF800FE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=nC+5PKRE
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id
 46470QHK029807;
	Thu, 4 Jul 2024 08:34:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=TVTfZbwazCO3Mwpj4WnL9Blm/V6O7FXH8ucyLUfzWc4=; b=
	nC+5PKREDPp9O2Q7U6nSOaD9u2OBl9CAQkC99/rvv6A9KVodR06J+AZbzBz8G9Uv
	KaapRZnVNtF6t40kKGEUQkuqI8pdVWNxoPfSNfMc0HqgQ0C4wzRlSZD0J1xi6Oce
	qqCI1BbK9FYRxK+WPj+AuxdJX7f4MJOaJMkpO2WXi/r85jgeSiaEW0gLKWmahA0R
	NrHfJFFspZ3F1DxxnGHN/nikZnYbgEk6hOosVDRlt+qWwzEV+nImUYMri/t54V84
	4ClTT9p3jwtoE18ialf6aFdo43R8uhEulMkzkCHzDa4Pt16MzdbgOEfN7swEP/Ue
	KYIFj88G8RIdH7KPe7PdXw==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 405jg38ee7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 04 Jul 2024 08:34:40 -0500 (CDT)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 4 Jul 2024
 14:34:39 +0100
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex01.ad.cirrus.com (198.61.84.80) with Microsoft SMTP Server id
 15.2.1544.9 via Frontend Transport; Thu, 4 Jul 2024 14:34:39 +0100
Received: from LONNCK4V044 (LONNCK4V044.ad.cirrus.com [198.90.188.46])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 0D634820244;
	Thu,  4 Jul 2024 13:34:39 +0000 (UTC)
From: "Stefan Binding (Opensource)" <sbinding@opensource.cirrus.com>
To: 'MadEnvel' <envelsavinds@gmail.com>, <tiwai@suse.com>,
        <rf@opensource.cirrus.com>
CC: <david.rhodes@cirrus.com>, <alsa-devel@alsa-project.org>,
        <patches@opensource.cirrus.com>
References: <20240701205516.22662-1-envelsavinds@gmail.com>
 <20240701205516.22662-2-envelsavinds@gmail.com>
In-Reply-To: <20240701205516.22662-2-envelsavinds@gmail.com>
Subject: RE: [PATCH 1/1] Fix swapped left and right channels for Lenovo
 ThinBook 13x Gen4 sound
Date: Thu, 4 Jul 2024 14:34:38 +0100
Message-ID: <002401dace16$eb3da8e0$c1b8faa0$@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQIuj9Y3bJtyj9LLTFo3xGbMpswyqQNDJZtcsST062A=
X-Proofpoint-ORIG-GUID: 3C53tXebnmRlVSUqnJ94TTpXigPUd6qK
X-Proofpoint-GUID: 3C53tXebnmRlVSUqnJ94TTpXigPUd6qK
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: VKVTGRYG5UIGS3QWTB3EOU6B2Y4YRDYK
X-Message-ID-Hash: VKVTGRYG5UIGS3QWTB3EOU6B2Y4YRDYK
X-MailFrom: prvs=491571888b=sbinding@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VKVTGRYG5UIGS3QWTB3EOU6B2Y4YRDYK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Reviewed-by: Stefan Binding <sbinding@opensource.cirrus.com>

> -----Original Message-----
> From: MadEnvel <envelsavinds@gmail.com>
> Sent: Monday, July 1, 2024 9:55 PM
> To: tiwai@suse.com; rf@opensource.cirrus.com
> Cc: david.rhodes@cirrus.com; alsa-devel@alsa-project.org;
> patches@opensource.cirrus.com; MadEnvel <envelsavinds@gmail.com>
> Subject: [PATCH 1/1] Fix swapped left and right channels for Lenovo
ThinBook
> 13x Gen4 sound
> 
> Signed-off-by: MadEnvel <envelsavinds@gmail.com>
> ---
>  sound/pci/hda/cs35l41_hda_property.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/sound/pci/hda/cs35l41_hda_property.c
> b/sound/pci/hda/cs35l41_hda_property.c
> index 51998d1c72ff..80c816922f78 100644
> --- a/sound/pci/hda/cs35l41_hda_property.c
> +++ b/sound/pci/hda/cs35l41_hda_property.c
> @@ -128,8 +128,8 @@ static const struct cs35l41_config
> cs35l41_config_table[] = {
>  	{ "17AA38B5", 2, EXTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 },
> 0, 1, -1, 0, 0, 0 },
>  	{ "17AA38B6", 2, EXTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 },
> 0, 1, -1, 0, 0, 0 },
>  	{ "17AA38B7", 2, EXTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 },
> 0, 1, -1, 0, 0, 0 },
> -	{ "17AA38C7", 4, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT,
> CS35L41_LEFT, CS35L41_RIGHT }, 0, 2, -1, 1000, 4500, 24 },
> -	{ "17AA38C8", 4, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT,
> CS35L41_LEFT, CS35L41_RIGHT }, 0, 2, -1, 1000, 4500, 24 },
> +	{ "17AA38C7", 4, INTERNAL, { CS35L41_RIGHT, CS35L41_LEFT,
> CS35L41_RIGHT, CS35L41_LEFT }, 0, 2, -1, 1000, 4500, 24 },
> +	{ "17AA38C8", 4, INTERNAL, { CS35L41_RIGHT, CS35L41_LEFT,
> CS35L41_RIGHT, CS35L41_LEFT }, 0, 2, -1, 1000, 4500, 24 },
>  	{ "17AA38F9", 2, EXTERNAL, { CS35L41_RIGHT, CS35L41_LEFT, 0, 0 },
> 0, 2, -1, 0, 0, 0 },
>  	{ "17AA38FA", 2, EXTERNAL, { CS35L41_RIGHT, CS35L41_LEFT, 0, 0 },
> 0, 2, -1, 0, 0, 0 },
>  	{}
> --
> 2.45.2


