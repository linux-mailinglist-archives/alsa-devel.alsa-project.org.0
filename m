Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F438797CFC
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Sep 2023 21:49:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EEA5D846;
	Thu,  7 Sep 2023 21:48:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EEA5D846
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694116189;
	bh=wpcCB1XXiTxtp4A/yEkAREYNKjUpf9GsXoBRPflBxIs=;
	h=Subject:From:In-Reply-To:Date:CC:References:To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=G38tlo6CCz+tmWAF6I4gsARCOGvm2LacdjziydJo3ALNs+0pi1kM58YxlLpOoRMTx
	 UePuycijtTOln63JyebuBrkdSDbC9zGPSMCTAkbjFJSRU5UYJJYKOej8BdXugAhVN9
	 x+qK0pQGJ4A9/3FwJqk8xfSLDcVXOTAkf77THhG8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7B208F80549; Thu,  7 Sep 2023 21:48:58 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 363F1F8047D;
	Thu,  7 Sep 2023 21:48:58 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A11A5F80494; Thu,  7 Sep 2023 21:48:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id F1825F800F5
	for <alsa-devel@alsa-project.org>; Thu,  7 Sep 2023 21:48:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F1825F800F5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=GwXEOP0I
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 387IfbE1028366;
	Thu, 7 Sep 2023 14:48:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to; s=
	PODMain02222019; bh=wpcCB1XXiTxtp4A/yEkAREYNKjUpf9GsXoBRPflBxIs=; b=
	GwXEOP0IuPbWhv8WisKYsokLHxAgdmsLEa1aTSvBOl5U8cbcnXnW/xN3IoxeuADs
	27EnghnKGLjSchLLllPFe2Xd1xL7+skhzkxZMJsBpf9+UZ9+jVQ9GmTv5sPr5eqr
	JudN1bpzFH4CtQRVvxe6nQCseHq0chmUEBTg7fva9H5trc/x2Ol/oeyaAxFxREBR
	/4Ulc7f8roVFZHU6BreyXviCEJSfCiH8a160eYGreIStNBFGMnKrHuR9+BVuxFiX
	divc9im+WVpgOTTbqjrufJJYBZ+aYnK+Wc7+BdcbK9xJv1ABg6ECxN35TBn6+DR4
	m9mpcpY3g3T8o/sojKeSuw==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3sv1fhx3mu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 07 Sep 2023 14:48:49 -0500 (CDT)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.37; Thu, 7 Sep
 2023 20:48:48 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.37 via Frontend
 Transport; Thu, 7 Sep 2023 20:48:48 +0100
Received: from smtpclient.apple (macC02FN0GLMD6T.ad.cirrus.com
 [141.131.156.171])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 1FEDE458;
	Thu,  7 Sep 2023 19:48:46 +0000 (UTC)
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0 (Mac OS X Mail 16.0 \(3731.700.6\))
Subject: Re: [PATCH v3 3/4] ASoC: cs35l45: Connect DSP to the monitoring
 signals
From: "Rivera-Matos, Ricardo" <rriveram@opensource.cirrus.com>
In-Reply-To: <20230901085025.GB103419@ediswmail.ad.cirrus.com>
Date: Thu, 7 Sep 2023 14:48:35 -0500
CC: Vlad Karpovich <vkarpovi@opensource.cirrus.com>,
        James Schulman
	<james.schulman@cirrus.com>,
        David Rhodes <david.rhodes@cirrus.com>,
        "Richard
 Fitzgerald" <rf@opensource.cirrus.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, "Takashi
 Iwai" <tiwai@suse.com>,
        Rob Herring <robh+dt@kernel.org>, <alsa-devel@alsa-project.org>,
        <patches@opensource.cirrus.com>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>
Content-Transfer-Encoding: quoted-printable
Message-ID: <3EEF7D10-C220-4D23-856B-249994084CF3@opensource.cirrus.com>
References: <20230831162042.471801-1-vkarpovi@opensource.cirrus.com>
 <20230831162042.471801-3-vkarpovi@opensource.cirrus.com>
 <20230901085025.GB103419@ediswmail.ad.cirrus.com>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
X-Mailer: Apple Mail (2.3731.700.6)
X-Proofpoint-ORIG-GUID: tP_D_MR_2ZRWMl8uKWjmus0j1vMGtdA9
X-Proofpoint-GUID: tP_D_MR_2ZRWMl8uKWjmus0j1vMGtdA9
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: YFJFNTTB62W6XZGSE3YEUSVQCIF6RSRY
X-Message-ID-Hash: YFJFNTTB62W6XZGSE3YEUSVQCIF6RSRY
X-MailFrom: prvs=4614c9396b=rriveram@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YFJFNTTB62W6XZGSE3YEUSVQCIF6RSRY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



> On Sep 1, 2023, at 3:50 AM, Charles Keepax =
<ckeepax@opensource.cirrus.com> wrote:
>=20
> On Thu, Aug 31, 2023 at 11:20:41AM -0500, Vlad Karpovich wrote:
>> Link VMON, IMON, TEMPMON, VDD_BSTMON and VDD_BATTMON
>> to DSP1. The CSPL firmware uses them for the speaker calibration
>> and monitoring.
>>=20
>> Signed-off-by: Vlad Karpovich <vkarpovi@opensource.cirrus.com>
>> ---
>=20
> Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>
>=20
> Thanks,
> Charles

Acked-by: Ricardo Rivera-Matos <rriveram@opensource.cirrus.com>=
