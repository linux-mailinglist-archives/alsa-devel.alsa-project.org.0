Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 49B51C47DF1
	for <lists+alsa-devel@lfdr.de>; Mon, 10 Nov 2025 17:18:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CCB9160221;
	Mon, 10 Nov 2025 17:18:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CCB9160221
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1762791535;
	bh=19V9Nsa2rLhFe6WcJMxiJ8wEi8SeAcREn6fEsmFJV48=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ix1YTJJhOyDIDvbifqoJ5X6WATEHyYmbt32tBG8hMj3SBcQrDDjzEkPyW2LmnHmjQ
	 bOxPK3wvbE/bLo7TwpkWZZqsdglpB0M4cNvYaO1BWtryzPXTcaIOfuTkJ7HwV6EFFj
	 m8jLowBV58/GaslJMKTob+GnHmMvE/4NOhZIx++s=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9FF6CF805C1; Mon, 10 Nov 2025 17:18:23 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id F2B34F805C9;
	Mon, 10 Nov 2025 17:18:22 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7E9ECF80254; Mon, 10 Nov 2025 17:17:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.3 required=5.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,KHOP_HELO_FCRDNS,T_SPF_HELO_TEMPERROR,T_SPF_TEMPERROR
	shortcircuit=no autolearn=no autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 511F3F8007E
	for <alsa-devel@alsa-project.org>; Mon, 10 Nov 2025 17:17:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 511F3F8007E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=as67Tsb7;
	dkim=pass (1024-bit key,
 unprotected) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com
 header.b=SUj71ymc
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AACECDe2814587;
	Mon, 10 Nov 2025 10:17:36 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=spGPx1GQV+UgHBufT4
	Ki4TxLok50j3Y44apjiUSI0Uo=; b=as67Tsb7PzhATbixuDbJaK95PGSMdahH34
	4e52VQ/XkxJguJRZr108Jnv5SW4up4MFSRkYB6cZASi4iauUp/ZfzRLRxhAmyL6a
	FeOWFm2+9pzEJ7t+5ZmTpN4aK65bPbB2hhdcfZTGUFjAiFemti8QGUWfTiJ/TzDB
	pbuVFt23GYcntif4e7ECWLWeLW40pkPhbNt5AtDofSjOfnZy6Ap5prFeqcAUDfXv
	yTHttTu6OUOxU6NCxZiiKtLFhlVWtwHcPwJmTJ8jS6NTJuBbJk3UpM49OCPpAplD
	xf/vQ8gqcVl9xmtZ8tRbOUDzxNVzN08vUrrHXQ+Kxa+LqCUwp09g==
Received: from sa9pr02cu001.outbound.protection.outlook.com
 (mail-southcentralusazon11023091.outbound.protection.outlook.com
 [40.93.196.91])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4abfvkranx-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 10 Nov 2025 10:17:35 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bhC1wOJIoKv6ESGZQGcNgNcH0E4zTfLFsnWvAKWPzcGqjvShXtTOt1SFvyD0M7dLvjvkGvTq2GdEFQOVcarevt8pZbdV+8G4UCbLrs8WJeo1WW9DoJ8jJTVG63eBDBbp7tx41Z3f1x2Yd4tvF9aERANl+Z9I7Tl0XqERTOm3A78uudoIcEBL/NjcF2CJFV3iwl2vXuEas+FiEUCZzndmVmd3nY1vhkAnopPnbxFD/yfh+H6uYyBZVYboAcbHWD3BKcWC1j/eLMgnLQWvxoZahvEN+78tFGPpskOA9kBrbJV8V3rNRLEvdz7hFi43p0oC8syG7tw6jJSMghXiQekgpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=spGPx1GQV+UgHBufT4Ki4TxLok50j3Y44apjiUSI0Uo=;
 b=VkORFF886xbnxNsTKlXfZhjsUm6p2tx6Wl2YLIWS3xwe28EyHxpbOYh5lYzKxdacCXin6x2ZhSyKnM+g3lPnlt93k4mYnnTsQ2vLTdSbFCLaAEA/32D1K2muu3t/XotegdPQrjDbNbjCiCvtNM/+uJrWGb4OPR+LySGzLCMrUrEhJStlU6JxsWKHdW//H4RKyHEPa5CzY3ybpRV9P8YdXv97J+EHTJGDa0K4Vx82sTw8ngJ7FbNmG9fdt9sg3Q4IwSKWAGrdA6ih78Aov/MCEPw0BYHlkbkdu4SHw3FZp9u8jpUkqf4+r3XoiUgO9IjZuEL9E12AQ6YYz/9T/pS7qA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=alsa-project.org
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=spGPx1GQV+UgHBufT4Ki4TxLok50j3Y44apjiUSI0Uo=;
 b=SUj71ymcmSJRIbf4TT5XafT8wrQj32cjYzFG4Rauf+OdZPw49Jis8/uuXFfo7EqTIMwIuT4KF+z/J/s0IMSUmzrACmdxZQXlc5h6cj/biOLk7WOHiqrlX44vaoZ2sJXO0kRA1uqzTB4xJ81gbI5pN943KrPb30TGnxZ2VeAwpzA=
Received: from PH7P220CA0057.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:32b::20)
 by SA3PR19MB7475.namprd19.prod.outlook.com (2603:10b6:806:307::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Mon, 10 Nov
 2025 16:17:33 +0000
Received: from SJ1PEPF000023D8.namprd21.prod.outlook.com
 (2603:10b6:510:32b:cafe::b1) by PH7P220CA0057.outlook.office365.com
 (2603:10b6:510:32b::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.16 via Frontend Transport; Mon,
 10 Nov 2025 16:17:28 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SJ1PEPF000023D8.mail.protection.outlook.com (10.167.244.73) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.0
 via Frontend Transport; Mon, 10 Nov 2025 16:17:31 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com
 [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 85C3D406540;
	Mon, 10 Nov 2025 16:17:29 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 62FB3820257;
	Mon, 10 Nov 2025 16:17:29 +0000 (UTC)
Date: Mon, 10 Nov 2025 16:17:28 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Niranjan H Y <niranjan.hy@ti.com>
Cc: alsa-devel@alsa-project.org, broonie@kernel.org,
        mstrozek@opensource.cirrus.com, yung-chuan.liao@linux.intel.com,
        linux-sound@vger.kernel.org, lgirdwood@gmail.com, perex@perex.cz,
        tiwai@suse.com, cezary.rojewski@intel.com,
        peter.ujfalusi@linux.intel.com, ranjani.sridharan@linux.intel.com,
        kai.vehmanen@linux.intel.com, pierre-louis.bossart@linux.dev,
        navada@ti.com, shenghao-ding@ti.com, v-hampiholi@ti.com,
        baojun.xu@ti.com, dan.carpenter@linaro.org
Subject: Re: [PATCH v2] ASoC: SDCA: bug fix while parsing
 mipi-sdca-control-cn-list
Message-ID: <aRIQGDmIGlh/6HSo@opensource.cirrus.com>
References: <20251110152646.192-1-niranjan.hy@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251110152646.192-1-niranjan.hy@ti.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023D8:EE_|SA3PR19MB7475:EE_
X-MS-Office365-Filtering-Correlation-Id: cc48b536-9374-4703-a06e-08de2074a6bd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|61400799027|7416014|376014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?DlQiMQSWLef0iHQpbRHueVU0ZMEhV1rT2DALZbbPjhX+ps9LH8b9EvsqQdXx?=
 =?us-ascii?Q?jKOS/1aGFGe27JBpnW4wBygOUOIBaMhC0/rLLAzcFicIPCmr7QIc++Wtw9+O?=
 =?us-ascii?Q?NL/9LK+wst24S3ZRQZ0UZrUmW5H1/0lbm/MMW9SF+7VXV5viKRIjdXqzdEmm?=
 =?us-ascii?Q?BWL+z3aGUjrauhGj7/CuTsLSnTwA8QWovD25e6Mrki7BICgf3Er/ittueioU?=
 =?us-ascii?Q?nTShITbxkeka1yJmMTLJCTrD6/kgjXJ5hiAVBo9Fy9Jf6K1gyaN5fgd1hc2p?=
 =?us-ascii?Q?SxBcmSh87kTwrsatHSC0Cq95WYrAn7pU/OI1BS3ZdUq836A/ClSF+urqBfEu?=
 =?us-ascii?Q?FZ/gUEsONaCIWnAK+i1Et1iuC9nGq07a7UZfcWYFOIyDqVbqCDEk/OAhkRHP?=
 =?us-ascii?Q?fu7V0Tso3qYdD6K5/eV/cjPvyLFGV+4tCWYAlOuURB46Bslx2OIlVdwurpiY?=
 =?us-ascii?Q?rp5huFNhmqU5oWejcMnYrGL08nQORFe6xq5UP9/rUw1h9twarpKgkrZIFzt4?=
 =?us-ascii?Q?m2Iv2fuRaR/24eLjvNsdpzFqUqu+7bf1R/AuSl2p7ObOI2b7FEog6n8Y+q8D?=
 =?us-ascii?Q?Vl2JlnT6Xt7RoW5roky3kG3eJdk91FYPglia77xYm86+mPTU86eb20h1vOaK?=
 =?us-ascii?Q?uke1TcOQYVdByWRNISbNdlXC7ux58eU11uC4a+TA9pI7vXAeMEvJQTCJpwjI?=
 =?us-ascii?Q?T0ko4KauKB49rDZ/zPlWBqTcNnr/zO7qeaBf0g/t95ttAsi+CS41ARNli8fD?=
 =?us-ascii?Q?yLvigF2H5skfEfnN6sy9dWlhyTK6GAPNV01j16rIeEWClcFL8pP8XN0mVAEZ?=
 =?us-ascii?Q?3ahd/KFaxAcVeruNaqbLnyfCiElPBZMyDww5/NyrCMdY0wXNMvqR99A3rS4O?=
 =?us-ascii?Q?g3rH6lHzPj2n42cQnUH0zxobeoDtxE5BoGzZ8L/M8B9dyUr3eZhJUQiRSmbV?=
 =?us-ascii?Q?rpVCEkIyFtu0lZVEID/8/bZoRPM6XI50dMDUbW2Z1YN1TP8EUjNr2AbiWuTG?=
 =?us-ascii?Q?eTmi8HzS57lPGoRrpxLYsA1L9kBSm01T6Kpw9kTfYB/GG5d1rpG2hdXneUkW?=
 =?us-ascii?Q?KvQEexfdzVwvgec05LDrL8L1lf5wXheywcHT9EeJ1cJM8oiP+i8q2kUc7lCl?=
 =?us-ascii?Q?bJ4R33V5IfShkvO8z7WaUdJPKOLD7e/LyMVgX0UE8f9i1JNAHUjkKvWOtKs1?=
 =?us-ascii?Q?Pdf/qx0xyFKxvfVbDf7bNhl+cmHSUhEjQW7OdEhuzCLl41BrgSVogfeTL7aU?=
 =?us-ascii?Q?4b+8GGgQ5MVOPRnvPWoIYRV7Jzos+BXKM5JIYfFmgQeamFbDRURIbfuGxEIo?=
 =?us-ascii?Q?kBAmMhgCFyGPkgpwh9hVYjZv+Iu0ZWgMSCe/MIwQ7C9J4ofsq6n6vScfUZYO?=
 =?us-ascii?Q?y6Ne8WEf1frAs6UoKXe74/2pN9Xd85RJV4uoTr7NZWO28bJOuGSbH0fA6cio?=
 =?us-ascii?Q?1sLTK3aldwq19q3gYONkQAsBKR7B2Twq2I9I1qHiqTQTCc4dfCe0oMQnzt0d?=
 =?us-ascii?Q?L3eNYAZRn8m/f19iInsnPl8qqztmBrS/QloPp0qcH8DB2TfcHZKN1pwlFN/I?=
 =?us-ascii?Q?DtQ39Orp6olLW9IRSNE=3D?=
X-Forefront-Antispam-Report: 
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(7416014)(376014)(36860700013)(82310400026);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2025 16:17:31.5518
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 cc48b536-9374-4703-a06e-08de2074a6bd
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: 
 TreatMessagesAsInternal-SJ1PEPF000023D8.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR19MB7475
X-Proofpoint-GUID: IGkdZlFsCrkY9EzE03y-IMCyW03FYAjV
X-Authority-Analysis: v=2.4 cv=e5MLiKp/ c=1 sm=1 tr=0 ts=6912101f cx=c_pps
 a=H2sYsg3hgj+L3aiWSAFbmg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=6UeiqGixMTsA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=sozttTNsAAAA:8 a=w1d2syhTAAAA:8
 a=mVzE9yZg0VaeB_GhK8YA:9 a=CjuIK1q_8ugA:10 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEwMDEzNyBTYWx0ZWRfXwIXgIGVRN1Wz
 vYMg21SHS+qREo3uhV12+i8P2WVMHUC4I12fG+79vPnBTF4RtrXb7enyCqTvzstM8jS7hTjlLw8
 nNv5oBeshGeMXaF/VcCSXylA2WZ+irJbP20Wn8ab31PUb94stsGBEVWqQxZzBO2f0cXmvPtZhFX
 OI2Dc3Pe86k9lDw1QhvytS/8MTWhxlwCsyOe4xzKjBW7Z4mx6u/G7wLx1De5veG8E04iZdBeJ5H
 dWjWw2t9U8w3H2tHMpkZbXozCKIQWZseC8dp0xg3wqL2mm+N3H9ybt+KiiKuJQXOUDzrNo3tgYr
 731QF/IlSDMIhsvEUahgV8lWTetKAW/2Uflofu8i/By98G3AmH/CLmB7RWyVGPCRkhbAdP3mDai
 cwosREYyaRHZNlOmTC+N4NCHAoMWxw==
X-Proofpoint-ORIG-GUID: IGkdZlFsCrkY9EzE03y-IMCyW03FYAjV
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: M4IZ7RV2VKD4IY2MURPETF5FAT3SWIDX
X-Message-ID-Hash: M4IZ7RV2VKD4IY2MURPETF5FAT3SWIDX
X-MailFrom: prvs=0409da937c=ckeepax@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/M4IZ7RV2VKD4IY2MURPETF5FAT3SWIDX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, Nov 10, 2025 at 08:56:46PM +0530, Niranjan H Y wrote:
> "struct sdca_control" declares "values" field as integer array.
> But the memory allocated to it is of char array. This causes
> crash for sdca_parse_function API. This patch addresses the
> issue by allocating correct data size.
> 
> Signed-off-by: Niranjan H Y <niranjan.hy@ti.com>
> ---

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
