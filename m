Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 63CE8A7458A
	for <lists+alsa-devel@lfdr.de>; Fri, 28 Mar 2025 09:37:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EF35960195;
	Fri, 28 Mar 2025 09:37:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EF35960195
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1743151039;
	bh=0+r3ZCC2JEqI9yA6V3BON/X2i9DVTW29rXnjeTr+Bmw=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=lVqcXLtesFQjAHCMsj6YEWAaYX8onScnmHQHWhqlNhvQ5nEXs2AZ+Rtf+tkkbkAwb
	 3FvXmZtZUKv59DW1peQBEpJ9A5q1daVsf5AD2BkME+7O4EyTiZs23r0VDFKp4Iq0Au
	 5LXSO61Wlk1Jm7IwWcLFxhJQXFb5GXj/WszTXtdo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 35F23F805B1; Fri, 28 Mar 2025 09:36:43 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1CC8BF805B5;
	Fri, 28 Mar 2025 09:36:43 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E3F49F80548; Fri, 28 Mar 2025 09:36:39 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9D6EEF80095
	for <alsa-devel@alsa-project.org>; Fri, 28 Mar 2025 09:36:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9D6EEF80095
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=Ob9rK+8m;
	dkim=pass (1024-bit key,
 unprotected) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com
 header.b=ZX5KcmEg
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id
 52S81cxs001248;
	Fri, 28 Mar 2025 03:36:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=qcV5D5NLS0A5cBuE
	DXBpC0bz7AYMmUi4rZC/aTziqiE=; b=Ob9rK+8mk71sys4xBEGoL+xEgVR/5Lsg
	Xrv0WDnRBy83faQF8UDT5kWFK6rf05uofqre3vJrjNSkCOUcq+t1lwjLJ2FeDr8d
	J5tROmalwNdB1ggul4clhYjL0NBABhGWaaZA5fxvAzz3tQGdgmbxUj5BMkKOcuuf
	Uyi9avUWrIoUbFuooMydMi+ii5sdn/nctz1zXq8F5ULCnac0XgghkInNp1p6Yink
	vpknMX0ckmZqMvBokF6OTxhiydeADyj/54btKwy9UtpRik5R5U2M0YJkkQx/ABft
	gPsqNNjdRGZZskHiUDjDfb9Nmg0R8ZkuAu6yeHj7FGD6id5Uw2h/UQ==
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2172.outbound.protection.outlook.com [104.47.56.172])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 45ndnu0vkb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 28 Mar 2025 03:36:34 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ShUtqoGfnEJD3FSrQubaXTm8O+z4WsI2OGkSBS+t+jXAVQTjBI9+nf97wcbMd9O0ROy+O2K3hUdIyOtziB4zOlG1SEaePrLb9aup12VoJKPcYggfpkuFZODv1g5EffZ5VY9Ajf6Hpf7U5yySZqVa/DtDMlP/XRI6ucGQycKK9UIdV6Q6jmtfyiK4SscuerQfrSR/rDVfvi4/rlXJ2wPmsRe7xA9wzu30CVs1tdOploBiodkxYgZPg6pCgmj/0PvYwMPQ54mmvF/gWPk/sTBUANdJwCw/zm1TnX/VnfLaprSRdP/fHBFektxUdGR/q5Ay0fJR40CpbW4hGIjvS9Pcvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qcV5D5NLS0A5cBuEDXBpC0bz7AYMmUi4rZC/aTziqiE=;
 b=J2u0aczCm+P+2j3Aqp5Ri/90KDlJvRvB2LFqJG1vztX9g4XMGjr0fZhoNGknViZ5W+085tk9MSMPRxV7sSsSlU4x8OpxrC5UZf5VeMATZ9MVARU8mnqi9Dh02L/ECfKH2mTFv1YkiCibmDUh7trykti8ZunAA4R5xpb9DPgJsKIN/C+C1QR9EfpiK0bPrHGH3yOe2uiSPB0L5Q6XECMUiBxNr1v2Sz/CoZR+dVjC8v7MF70F99tKIkWWCMEgCTFpTqOu393xLt+H1EcFqMUxSUK5X8jT29Uts1eODgmztFzlkLw8m+H5ePJgQ4hV1wPShK8qbM0in3SahdzEzkvtLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=alsa-project.org smtp.mailfrom=cirrus.com;
 dmarc=fail (p=reject sp=reject pct=100) action=oreject
 header.from=opensource.cirrus.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qcV5D5NLS0A5cBuEDXBpC0bz7AYMmUi4rZC/aTziqiE=;
 b=ZX5KcmEgpU1igEKypDa5oAbPr1XcsbX6j/g7ryG1AyYnEqta3OLXnp1Gnc8FQR/VstQ+FiJi2/sSAe9/L2cB3h9MAgZfSolHGR5pK6jzgwe3Vycy53TcpYZ0RWg0lwMzf8LanJrF16La0ZwYpgaIgamo+MiGtrYZyEvAiB28PCQ=
Received: from BL1PR13CA0434.namprd13.prod.outlook.com (2603:10b6:208:2c3::19)
 by SJ1PR19MB6137.namprd19.prod.outlook.com (2603:10b6:a03:48c::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Fri, 28 Mar
 2025 08:36:29 +0000
Received: from BL6PEPF0001AB51.namprd04.prod.outlook.com
 (2603:10b6:208:2c3:cafe::4c) by BL1PR13CA0434.outlook.office365.com
 (2603:10b6:208:2c3::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8606.14 via Frontend Transport; Fri,
 28 Mar 2025 08:36:29 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of cirrus.com does not
 designate 84.19.233.75 as permitted sender) receiver=protection.outlook.com;
 client-ip=84.19.233.75; helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BL6PEPF0001AB51.mail.protection.outlook.com (10.167.242.75) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.20
 via Frontend Transport; Fri, 28 Mar 2025 08:36:27 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com
 [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 89B7B406541;
	Fri, 28 Mar 2025 08:36:26 +0000 (UTC)
Received: from ediswws03.ad.cirrus.com (ediswws03.ad.cirrus.com
 [198.90.208.11])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 6D1DE820248;
	Fri, 28 Mar 2025 08:36:26 +0000 (UTC)
From: Maciej Strozek <mstrozek@opensource.cirrus.com>
To: perex@perex.cz
Cc: alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
        Maciej Strozek <mstrozek@opensource.cirrus.com>
Subject: [PATCH alsa-ucm-conf 1/2] sof-soundwire: cs42l43: Drop headset mic
 from mic mute LED
Date: Fri, 28 Mar 2025 08:36:18 +0000
Message-Id: <20250328083619.1262150-1-mstrozek@opensource.cirrus.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB51:EE_|SJ1PR19MB6137:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 503d3c21-3db6-431b-ae40-08dd6dd3a1fc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|61400799027|82310400026|36860700013|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?NyMq2zIUK7rYVz0zxsOKkfC2aQljul/7eWyyccYELbN6JPkHRQRZPCQXSm0w?=
 =?us-ascii?Q?qQZxehDZiBLlO6XajanlZJxZnkZFgJa84jZLPRVwJ5p8/BpwIPw5OADUuChg?=
 =?us-ascii?Q?Yn7Uebhlz2sdKlvEhSITWGE/4u5avhiJoItDP8S56vQpC/8wuYz8CBNeFY/y?=
 =?us-ascii?Q?e58POgIG3JQy9btMaZqODjqbZ39kQgqemMNUEvu9YeVZYXYdymGO3OFdfdJi?=
 =?us-ascii?Q?MOzraPlIifI1rssgN80iGOwBzAS/aqCnPVuuuTNXcw8H97ZtKOmsUSOBQhDk?=
 =?us-ascii?Q?RKkze+i1dQpgjrlgA8UjIdvzvrrw23Qgcirx671X1Jtdf/veiRhgFjVCQSAM?=
 =?us-ascii?Q?iqjrxTy6Cc4h2GNBgHWcvfrt2kZqrdlOOCCZ1YjaD2VHD4/ruDuyTuFj56Sf?=
 =?us-ascii?Q?MhavSojqy/FrQqLDlIuCMr9s4tJUacC2z0a6TcGm68+k8PzbPCx/E0X9Ozih?=
 =?us-ascii?Q?6CEGR9MeoCDTrNKffd5hpPIJl61+yQmPTHffqiVGQeIkyf2NgFz+l0IJEXGR?=
 =?us-ascii?Q?CqGNMmvywohXH0c0MkqrAPoQCXGw/FYw667b9AgKzZoH8ATsIzi6Fesqf3lQ?=
 =?us-ascii?Q?9Rw6CPKE4J63tRSEXdBjUQCCCeP0AD021g9k/3U1iu8EWzaaPa5R1IGM8Kz2?=
 =?us-ascii?Q?4wXibXJ0ixClMcuc1b/1pIxf9rtguN9eExFy5EI0LqYcTRsHGyLcb3uimOWv?=
 =?us-ascii?Q?VxNHkpQmVfYTQd85T63ci/nDJrxC5/YUZiu4wrNGqKn66Do+kR9kIyr8VttG?=
 =?us-ascii?Q?4dPOgMNL+34bRcvfqBFJccPzvz/Dq4HnarSoUu6t505XKErDqDl7v5fAzhbi?=
 =?us-ascii?Q?OqOpL8shHVe92OlWJTUHPP3GXvI2R85Wz3rBPvkKYhtxNfN+h1Dgvdz0Xm+Z?=
 =?us-ascii?Q?0zw0i6WwIARLqfsjAJb4p4UefXEYaWCG26nyOhdk0GYbOqjcSSTT4gTI6G+j?=
 =?us-ascii?Q?BgrM+zzIOkS3VmWOXOVUDlKqZ3ohPqKGVNyZ42Zk4jLEJcksjFI4DtMZM/bN?=
 =?us-ascii?Q?PmpWCSvB+7r2aKPdBy2m+90pvx/IcBGGjI9zSk+/2NODW7wAzi0swriLvLPm?=
 =?us-ascii?Q?UuhDsv6kP99k9HUhBQvwQ+GY9ibmWjaEIeIuFSSMuR1hHRqTBmgke/EQj9PA?=
 =?us-ascii?Q?pUvB8sNVoMXXR05Y6Gxi4OF3MdDC0Ml3YTvYHGjny/04G3pOJ6uo5FuzOU03?=
 =?us-ascii?Q?jpMM/N3zyLmtKH4JIrxjYNhpJ/rK+JugnEEnCGv56q+6WCUjRSnkM5Sz9oLM?=
 =?us-ascii?Q?G4SvdejWKNGxT6stFiamv2kawKGxkwUtOuNIdhBjRzTCUxJQV89Kk0YrXZuB?=
 =?us-ascii?Q?Xqs+DiRQwmuYkRSK7IYWNVNH4GBO1YM8rOaEL72p6wMlrxpOff/5TvbAA2D5?=
 =?us-ascii?Q?+Jv39j1CEht81bGCalhQ7gfjuc9nf/uCELwrKHj+tmEtGRzwplYjihbAievu?=
 =?us-ascii?Q?m5X5fwSViNWiurEqgzMAPUF3H64FkeLxZavp0UUWKaW7AHVuMfS20VfoMk0D?=
 =?us-ascii?Q?Rt5YWBUUkqHNuxA=3D?=
X-Forefront-Antispam-Report: 
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(61400799027)(82310400026)(36860700013)(13003099007);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2025 08:36:27.7665
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 503d3c21-3db6-431b-ae40-08dd6dd3a1fc
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL6PEPF0001AB51.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR19MB6137
X-Authority-Analysis: v=2.4 cv=GoJC+l1C c=1 sm=1 tr=0 ts=67e65f92 cx=c_pps
 a=kqCqMoaEgQjRYYKBKtAp1Q==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=Vs1iUdzkB0EA:10 a=s63m1ICgrNkA:10
 a=RWc_ulEos4gA:10 a=NEAV23lmAAAA:8 a=w1d2syhTAAAA:8 a=v8IP7J7gjG_votRiVfsA:9
 a=BGLuxUZjE2igh1l4FkT-:22
X-Proofpoint-GUID: piQfwxlSk65sxMEBtEPpugS4rhqCR6oR
X-Proofpoint-ORIG-GUID: piQfwxlSk65sxMEBtEPpugS4rhqCR6oR
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: HQE5OKGMEQFK2N4KBYLVHASW2OBAIHNJ
X-Message-ID-Hash: HQE5OKGMEQFK2N4KBYLVHASW2OBAIHNJ
X-MailFrom: prvs=3182ccdba2=maciej.strozek@cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HQE5OKGMEQFK2N4KBYLVHASW2OBAIHNJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

As per conversation in [1], let headsets be dropped from LED bindings.
Also remove turning off the mics on device disable since they are now
not needed.

[1]: https://github.com/alsa-project/alsa-ucm-conf/pull/512

Signed-off-by: Maciej Strozek <mstrozek@opensource.cirrus.com>
---
 ucm2/codecs/cs42l43/init.conf        | 6 ------
 ucm2/sof-soundwire/cs42l43-dmic.conf | 2 --
 ucm2/sof-soundwire/cs42l43.conf      | 1 -
 3 files changed, 9 deletions(-)

diff --git a/ucm2/codecs/cs42l43/init.conf b/ucm2/codecs/cs42l43/init.conf
index 0e987c21..c0fa863c 100644
--- a/ucm2/codecs/cs42l43/init.conf
+++ b/ucm2/codecs/cs42l43/init.conf
@@ -10,9 +10,3 @@ LibraryConfig.remap.Config {
 		}
 	}
 }
-
-BootSequence [
-	cset "name='cs42l43 Decimator 1 Switch' 0"
-]
-
-Macro [{ SetLED { LED="mic" Action="attach" CtlId="cs42l43 Decimator 1 Switch" } }]
diff --git a/ucm2/sof-soundwire/cs42l43-dmic.conf b/ucm2/sof-soundwire/cs42l43-dmic.conf
index 70ce40ff..b68a70d1 100644
--- a/ucm2/sof-soundwire/cs42l43-dmic.conf
+++ b/ucm2/sof-soundwire/cs42l43-dmic.conf
@@ -13,8 +13,6 @@ SectionDevice."Mic" {
 	]

 	DisableSequence [
-		cset "name='cs42l43 Decimator 3 Switch' 0"
-		cset "name='cs42l43 Decimator 4 Switch' 0"
 		cset "name='cs42l43 DP1TX1 Input' 'None'"
 		cset "name='cs42l43 DP1TX2 Input' 'None'"
 	]
diff --git a/ucm2/sof-soundwire/cs42l43.conf b/ucm2/sof-soundwire/cs42l43.conf
index 4b4e1187..51832126 100644
--- a/ucm2/sof-soundwire/cs42l43.conf
+++ b/ucm2/sof-soundwire/cs42l43.conf
@@ -33,7 +33,6 @@ SectionDevice."Headset" {
 	]

 	DisableSequence [
-		cset "name='cs42l43 Decimator 1 Switch' 0"
 		cset "name='cs42l43 DP2TX1 Input' 'None'"
 		cset "name='cs42l43 DP2TX2 Input' 'None'"
 	]
--
2.39.5

