Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EF5BA74B85
	for <lists+alsa-devel@lfdr.de>; Fri, 28 Mar 2025 14:49:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0E265601E6;
	Fri, 28 Mar 2025 14:49:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0E265601E6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1743169757;
	bh=gzrrO1ngmxtuwdssbmatfuWJeBbieGvzKTSeK4Sav+A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=s3rOTgL9faqL5W1UhTD1d77tsBwfvFKM9tsquJZ72XLR2APESxLO4sHhdusqX+j/N
	 0IlFmlgm1m/LfqOlk0dfdyXcXHaahmWUfI1ouEsnspNm84a2ZDN8ZmrFFT2AJag/MZ
	 9BYWSBLRTf2T2ExYlYXxkgQToaJNRJGbfHOPtkWc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0BD2CF805EC; Fri, 28 Mar 2025 14:48:32 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EF06BF805EC;
	Fri, 28 Mar 2025 14:48:31 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 33806F80548; Fri, 28 Mar 2025 14:48:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 36DA7F80212
	for <alsa-devel@alsa-project.org>; Fri, 28 Mar 2025 14:48:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 36DA7F80212
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=lcP9x3Iw;
	dkim=pass (1024-bit key,
 unprotected) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com
 header.b=hNM9wZD/
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id
 52S81fnu031388;
	Fri, 28 Mar 2025 08:48:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=mukKDQp+5Lzf4+gxwDusAd+D5836KTnTMAqeXCBTP0c=; b=
	lcP9x3Iw+vDqEyMDqCVmgp9RuiJC3PO12mvhB4ihdmAXR3XuKSzVIEFI4Nj3YcOk
	hvXR373sj8UmaLJfHEGZARXcdVB2RKuj0hYaZCZOeEUZLt8YTmRzFLs0kwYv/juT
	8lDZufth0y/FpGHATxNm8+gS7QBF/H5MFa8VIcOt6DwhJLVGnt8x8rr/2yFzZVB0
	lx/x3lQc926DMAX8HMQebTghF20YBwLLxuDdtQtkEMXFw1ru9x03Vu/mcSXvlx50
	W7sJjcOqPhjs0C3ULqJJ2n3qJ6hjGVXV8GMOFEjLxlkiF46+aLvDk6AnfhMoAIkQ
	MKZ0FigPs0g6uZ2Xi8JDBA==
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2174.outbound.protection.outlook.com [104.47.58.174])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 45jntc1hap-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 28 Mar 2025 08:48:23 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G9XM0gdJW2/jsqOqwjExokAuydiaLa27L1/KFb5Et50OwJvT+7tUWbIlBOWcCEFcfdlLPQ9TVBLSIYCth2SGsU+j/QbmvMH4k4KMPEZrkl3Hy6lHrS5Z8GmdcHIov9Z3eVfHi9non4Mgx9egbBKGi7PRpx6Rr97l4FWSMfqRIBr+bPt50Go8Xy9lVMTzCDbA2s2Qeyva3n8VBxPvdj/9ta8gB7YrAooV9WxzfumM00sWx1XTXy9zChhttB46qQRrd4uY3z4zS8SE56em6lzw/lEzY+8U5IzusI8v+tLvQejyezog1olRhhZnA/0TkFyhcD+9H5uEGMr/qgREWRLAqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mukKDQp+5Lzf4+gxwDusAd+D5836KTnTMAqeXCBTP0c=;
 b=wsRubfWUoAQ6sOnl6fXZ/tqe3jrw+LWhNPtBpOsKK4Z4NENhGegHCxVJl2qQr9qtI3SAEuzs9VWarPwBffqyLddhFhT5sHsDg8T107aRZ3VUNyu6R+IiReh7zxeyZYmGlxJBMtSavMb1OeBSSiFcPLgEU/YY5YkE1Ay0ZtlusnX2+v46hN+6DMvVb24qA/CazMzeabOa6lAQOfEaRfhrScs5MHnL7P9oX/Huk/dDk6luJiHOWfbfhHFcKSbusvVIvaTWA6h3KhZg/Dl0ftl2CC/mAUOe73ayoRYNaJZCQ+x7eX1krPA5yyYvOaCRs2Z9fEgn9RKuQ3TTcyh0NJEosw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=temperror (sender ip
 is 84.19.233.75) smtp.rcpttodomain=alsa-project.org smtp.mailfrom=cirrus.com;
 dmarc=temperror action=none header.from=opensource.cirrus.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mukKDQp+5Lzf4+gxwDusAd+D5836KTnTMAqeXCBTP0c=;
 b=hNM9wZD/Re0ExiVP4PDiQUNF1d9RAcVUsE59F+8L3956DMmR2YV5rfvpLvxpDdyECwTo8LlwMilvsN1Z+gW/KtmmgiVIOUENtsQb5NzJWzw9+vAaTeQJw4GeQKIIDMQ52euhv55sH+Buuw4unXfuRvHhJrLdsovCrLmBzgzOEHg=
Received: from BL1PR13CA0450.namprd13.prod.outlook.com (2603:10b6:208:2c3::35)
 by SJ0PR19MB6678.namprd19.prod.outlook.com (2603:10b6:a03:44f::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Fri, 28 Mar
 2025 13:48:17 +0000
Received: from BL6PEPF00022572.namprd02.prod.outlook.com
 (2603:10b6:208:2c3:cafe::a0) by BL1PR13CA0450.outlook.office365.com
 (2603:10b6:208:2c3::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8606.14 via Frontend Transport; Fri,
 28 Mar 2025 13:48:16 +0000
X-MS-Exchange-Authentication-Results: spf=temperror (sender IP is
 84.19.233.75) smtp.mailfrom=cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=temperror action=none header.from=opensource.cirrus.com;
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of cirrus.com: DNS Timeout)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BL6PEPF00022572.mail.protection.outlook.com (10.167.249.40) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.20
 via Frontend Transport; Fri, 28 Mar 2025 13:48:15 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com
 [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id A94E340654A;
	Fri, 28 Mar 2025 13:48:14 +0000 (UTC)
Received: from ediswws03.ad.cirrus.com (ediswws03.ad.cirrus.com
 [198.90.208.11])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 7879B82255C;
	Fri, 28 Mar 2025 13:48:14 +0000 (UTC)
From: Maciej Strozek <mstrozek@opensource.cirrus.com>
To: perex@perex.cz
Cc: alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
        Maciej Strozek <mstrozek@opensource.cirrus.com>
Subject: [PATCH alsa-ucm-conf v2 2/2] sof-soundwire: cs42l43: Control hardware
 volume to avoid clipping
Date: Fri, 28 Mar 2025 13:48:09 +0000
Message-Id: <20250328134809.3008238-2-mstrozek@opensource.cirrus.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250328134809.3008238-1-mstrozek@opensource.cirrus.com>
References: <20250328134809.3008238-1-mstrozek@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00022572:EE_|SJ0PR19MB6678:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: f6d4fd6b-fac3-4100-84c6-08dd6dff30d1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|61400799027|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?MDaGU+qJMQcg89t1TtJQcdDzMcwJdUGTu3IEu6IYyd51soa9erKDQ+1aCiyD?=
 =?us-ascii?Q?fLlR6YZesdp4HEcgBDTUeZUhRC6U22mGpLH5WbIhUuSHm2O/NbtnZTlYRj18?=
 =?us-ascii?Q?rzkgSBpOS6vVdSbBsaVPcprb/hxCAacfPEXgzOaimkfP2r/3uuQpCCifjWUp?=
 =?us-ascii?Q?TghBNYdK6p4JKtnXwVEQfh6YoMluGTJ03aOxLFPgKT+WAyCL3nKJS6j4EX1G?=
 =?us-ascii?Q?IF2Iwgvm+4MC5BJVptm+mBezmgWnUrimu91ow+ZdYJnsQ5oTGo+ZcwaVtEbf?=
 =?us-ascii?Q?h2jRUY+VYb1FCZ1F7HwO36RMVNqZ8fd3158oRRlRxSlAEo8anXlGTe71t+zw?=
 =?us-ascii?Q?KgShy/DIhvGw3X/qLNu9YVq0/rC6ZzZwWHisiQu4QAX2D8d1DGokdOWCOnR0?=
 =?us-ascii?Q?U6jZzHrIaL8IeSsLnoxj/8s2mNw2b7NNOQcuxUtzfPbigiTsTHw1QPb6Y2O4?=
 =?us-ascii?Q?QQlOHZZFd1KDtSQ3EW5VRsmw8kzVEGkBGvFBQGxvDF+9Y3ANdCMqzePlo43U?=
 =?us-ascii?Q?AiX1gfiJfMV2zYsJNooexfXrpjFD6l3Wl7FraqjVErmfi0H0p1zQCa/ZkDOx?=
 =?us-ascii?Q?Tu3B0VW7qXYWLnttkbiDhIEsY+6+oe17V+x1/IUMqDve0NycR6r5x3ozcbRA?=
 =?us-ascii?Q?aOjMSq0cwSqw/cpvt0w7N7hQra6PljmqNBjMCPG9W339pgFqGILI0kYZNIgp?=
 =?us-ascii?Q?UOncfcK7BqIHF2yIf9Kc+ZWi+ceEWVzDCNES6kadKcyDMQ38a6D0W53wTMme?=
 =?us-ascii?Q?tahresI+8jzftzu1Ajf6+ZZmU0AMJhrWvHhI710eV6QVadqyns18/Q8ItaCm?=
 =?us-ascii?Q?j/TsxdaJ1qExirhf2f7bddBOKn2VJ0fBj7EYQvjECC/CYFkKsUmwgFEt+wQf?=
 =?us-ascii?Q?LZpdzKZ4ZeVfCXdiep0L6OJXybNxPAAKxpeBNEFymOzh0jqIbVcCmI6uVo8e?=
 =?us-ascii?Q?DH4y3RlCTUXJ3Eme2e1D/Nfg04rWczvhrDVnIStQTnFzLvrl+tV7h8tKodI/?=
 =?us-ascii?Q?rt0L6kXuFLSfpiv9HpB/mtkuDhQ+mDQScw3yNpzD4xiMDjUjtBkzRY/mFN8k?=
 =?us-ascii?Q?9/oi3gXwU2AkOfVl38bSTLsuZCopvaUPz0927cRIInEEHeyBTSiLa2Cn935z?=
 =?us-ascii?Q?oJVDCpeYiqoYqo9rZMiMTW2MPqBZX2vDSlPna+zWKFmtmN0zVPsl0Aei+ggy?=
 =?us-ascii?Q?I/x2YP9vcF2tEonvBEVuk616LgLSKA/JPAUnyZL9Yo2TS+/DXmhzQyPNgWFo?=
 =?us-ascii?Q?Vu2c+rfRXtEPS0BGO6Ot239CgOKSUhQKFtRbzIBvagIr3Lsgf8rNyWznFVC6?=
 =?us-ascii?Q?38kiVYDR30rRtwnOreCmcZPfjRgDVRCtGj+qd2XZXmuX42teRKVWu9X2OKT0?=
 =?us-ascii?Q?20WbN3baZPywCmS/InS6beLeoilnnmqbPafV0GuGWfVQRW7+5ZvB8SJfWuPL?=
 =?us-ascii?Q?F4GI7+Fx/fxYLMKEmw0vr6PkyWYO3TTfDRywUiSG824uZkNa5Nv3dHYk51p2?=
 =?us-ascii?Q?RSWwX4cuq8bjqNKhdanKoqtVSNP056S03NIc?=
X-Forefront-Antispam-Report: 
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(61400799027)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2025 13:48:15.7416
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 f6d4fd6b-fac3-4100-84c6-08dd6dff30d1
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL6PEPF00022572.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR19MB6678
X-Authority-Analysis: v=2.4 cv=JJM7s9Kb c=1 sm=1 tr=0 ts=67e6a8a7 cx=c_pps
 a=qvBKVd3KFl3zkoLf5jvq7Q==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=Vs1iUdzkB0EA:10 a=RWc_ulEos4gA:10 a=w1d2syhTAAAA:8
 a=DyZ_2FFYdYKSEs-sC6wA:9 a=BGLuxUZjE2igh1l4FkT-:22
X-Proofpoint-ORIG-GUID: wy7P-gcoKHrh1qd2B51N7zOR4J9xwYmd
X-Proofpoint-GUID: wy7P-gcoKHrh1qd2B51N7zOR4J9xwYmd
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: ZJF2C2UZFLYAX7E2RQP53MKHFGXT53AN
X-Message-ID-Hash: ZJF2C2UZFLYAX7E2RQP53MKHFGXT53AN
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZJF2C2UZFLYAX7E2RQP53MKHFGXT53AN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hardware volume control in cs42l43 can go up to +31.5dB which can cause audio
degradation. For best results, keep the hardware volume set to 0dB and let
software volume control the output.

Signed-off-by: Maciej Strozek <mstrozek@opensource.cirrus.com>
---
v2: No changes
---
 ucm2/sof-soundwire/cs42l43-spk.conf | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/ucm2/sof-soundwire/cs42l43-spk.conf b/ucm2/sof-soundwire/cs42l43-spk.conf
index 693c450b..b2b32e57 100644
--- a/ucm2/sof-soundwire/cs42l43-spk.conf
+++ b/ucm2/sof-soundwire/cs42l43-spk.conf
@@ -1,5 +1,14 @@
 # Use case Configuration for sof-soundwire card

+LibraryConfig.remap.Config {
+	ctl.default.map {
+		"name='cs42l43 Speaker Playback Switch'" {
+			"name='cs42l43 Speaker Digital Switch'".vindex.0 0
+			"name='cs42l43 Speaker Digital Switch'".vindex.1 1
+		}
+	}
+}
+
 SectionDevice."Speaker" {
 	Comment "Speaker"

@@ -8,6 +17,7 @@ SectionDevice."Speaker" {
 	]

 	EnableSequence [
+		cset "name='cs42l43 Speaker Digital Volume' 128"
 		cset "name='cs42l43 Speaker L Input 1' 'DP6RX1'"
 		cset "name='cs42l43 Speaker R Input 1' 'DP6RX2'"
 	]
@@ -20,6 +30,7 @@ SectionDevice."Speaker" {
 	Value {
 		PlaybackPriority 100
 		PlaybackPCM "hw:${CardId},2"
-		PlaybackMixerElem "cs42l43 Speaker Digital"
+		PlaybackMixer "default:${CardId}"
+		PlaybackMixerElem "cs42l43 Speaker"
 	}
 }
--
2.39.5

