Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C539FA7458E
	for <lists+alsa-devel@lfdr.de>; Fri, 28 Mar 2025 09:37:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D1DAD601BE;
	Fri, 28 Mar 2025 09:37:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D1DAD601BE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1743151052;
	bh=OFUrZLA8FmY3Q51amSKnDuBWBjGzbEL6Wg6MY2nX9W8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Z/DsXoU4ffeTEXGGXidvrMs3PYOeIA60Qx4uo795bS8o/Vb0RWntpzD9bUbZDq/a0
	 E0X+R6azWjCs5mAip3j/KaLUSeMga1TUuq1013mH/YF/aagMRgg2YE8mQSkEF3kayY
	 D1/PsUNvz/e3QdQldGVNS7/ssdeZkkhZTiAjoxwc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 16D63F805E2; Fri, 28 Mar 2025 09:37:00 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0443AF805EA;
	Fri, 28 Mar 2025 09:37:00 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2007DF80571; Fri, 28 Mar 2025 09:36:57 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4BC0AF800E5
	for <alsa-devel@alsa-project.org>; Fri, 28 Mar 2025 09:36:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4BC0AF800E5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=Yfk/aM+I;
	dkim=pass (1024-bit key,
 unprotected) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com
 header.b=i3vxZydh
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id
 52S81dsG001257;
	Fri, 28 Mar 2025 03:36:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=rLb6htfyZKV1mR+D7n9iYBPPI8VrBFZIHykwlgjwY/M=; b=
	Yfk/aM+IWlf3wDDHZiYTcA+DXELIg3T1VQvGAYRUDhafTieZrpSs7fK+Islq/rk7
	07Fely3RI20xZzrFLUVb6VIwXjWmCpHIGGfY0O13XR8PjPHh/XsymCDrtT1X97Wg
	v6IYjpOPcThBSGCUCLMB6U4wWFZUWgTFtPIwDn6yTFJ4FE/Dl+ro09ZsEUmHwPlU
	QN/TaqgWBymZYyfAkDfDe7MZoYX6gaeN61u+6VDqvEofZGRL43zRhczCV8nhSJEB
	7Zn7xiQymkIhO+GXDm61x0YHJr6NXAMMJep1in7vxbQHTyg86Ra5ghoYG3BnmCSZ
	r7CLztPwYM7FCmzc7r5wTg==
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2041.outbound.protection.outlook.com [104.47.66.41])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 45ndnu0vkj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 28 Mar 2025 03:36:53 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wMn21wHXgMni0DUZ1c4ACMtWfJFMqy3meBAXKf+N2yn31/z4yzMKFxdoe3vpicjBSFaDrTmQIyXLafCKM2V2icWdez8Ql5hDCMuDrwaVC2e0qCFGjkl6BDAxNyqXMx6BCQrnGXhiSxWJzy2dgXhdH6+cEMDCLDAakZwb+s0c8Q55EtAJMQLMweevlzeZJMKWtAGADrSJ9txwPbUirGwzgv/DLH0n0uXcXKrY38J2IjNibOnZqp4QhORo6yCfNVJXHsaJ8tkRY37skJR+CW1WkILTEhA1PTC4rs/JmlDE++Nba1UHukPuaaNnLvbvlPN/bzSJGbyzsIE9y5+yfVQN9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rLb6htfyZKV1mR+D7n9iYBPPI8VrBFZIHykwlgjwY/M=;
 b=VqPVg/xifZcoE6ke3ysqwOoWlkjUwgRYpDIUtuiD2e9Np9iV+fUTGM3FVyKCIdm/T+RX2ZImPvKgXYRt/0rR2aXZAFYi9xsG14mTo4EI0eV1M4giGmZnh29ZUz61uGIWkrC83/555469Rq+MK9fVHxCYp8FstQtCuQePFKvzn0QjofEZmN/d7450X/nOojT5HIkVi96cw5a0m4zeXnmMgAf3cQcaDQqR9UE/GoU7XNwaWLlh8PJTVOUnLlybgJKnAE1OhCFclYDWlew0bS19+8gcyGS5Fr2sU8uzlSO5FC6CPZuYwVF0xIOLKJWtLEVDFPLJ4gmLvN7+uug6n/1ipw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=alsa-project.org smtp.mailfrom=cirrus.com;
 dmarc=fail (p=reject sp=reject pct=100) action=oreject
 header.from=opensource.cirrus.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rLb6htfyZKV1mR+D7n9iYBPPI8VrBFZIHykwlgjwY/M=;
 b=i3vxZydhYw8TFf9vv/X0E5bQMGLIiHKbghueis5ld4wvCmvjhKu0dgtPCxeZN/kIZ3U2i4sY5ghKbcZR5vLBMFRqTdpgpTlA0M+JGGU3EMq9HrXn5/aKdNH7KiER8AlHUM9Hk12n/d4hEzf59/gEcox7azHugs3t2WMBU82wHZI=
Received: from SJ0PR03CA0194.namprd03.prod.outlook.com (2603:10b6:a03:2ef::19)
 by BN5PR19MB8967.namprd19.prod.outlook.com (2603:10b6:408:2aa::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Fri, 28 Mar
 2025 08:36:48 +0000
Received: from SJ1PEPF000026CA.namprd04.prod.outlook.com
 (2603:10b6:a03:2ef:cafe::50) by SJ0PR03CA0194.outlook.office365.com
 (2603:10b6:a03:2ef::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.43 via Frontend Transport; Fri,
 28 Mar 2025 08:36:48 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of cirrus.com does not
 designate 84.19.233.75 as permitted sender) receiver=protection.outlook.com;
 client-ip=84.19.233.75; helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SJ1PEPF000026CA.mail.protection.outlook.com (10.167.244.107) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.20
 via Frontend Transport; Fri, 28 Mar 2025 08:36:47 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com
 [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 56208406541;
	Fri, 28 Mar 2025 08:36:45 +0000 (UTC)
Received: from ediswws03.ad.cirrus.com (ediswws03.ad.cirrus.com
 [198.90.208.11])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 44D2C820248;
	Fri, 28 Mar 2025 08:36:45 +0000 (UTC)
From: Maciej Strozek <mstrozek@opensource.cirrus.com>
To: perex@perex.cz
Cc: alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
        Maciej Strozek <mstrozek@opensource.cirrus.com>
Subject: [PATCH alsa-ucm-conf 2/2] sof-soundwire: cs42l43: Control hardware
 volume to avoid clipping
Date: Fri, 28 Mar 2025 08:36:19 +0000
Message-Id: <20250328083619.1262150-2-mstrozek@opensource.cirrus.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250328083619.1262150-1-mstrozek@opensource.cirrus.com>
References: <20250328083619.1262150-1-mstrozek@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000026CA:EE_|BN5PR19MB8967:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 54c87aef-c171-45be-020c-08dd6dd3ad8c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|61400799027|376014|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?e0AkRil/v2CogfraqM2QX25gm0k2R3dmwU0CHc2/a+js64CXXsW4L2PPsF63?=
 =?us-ascii?Q?GLo+Z/UKvgzAI4uphLwbutjnYOy8htN8iVhU8JCicHvEmf19L1d2JYE5IyyV?=
 =?us-ascii?Q?slyuvkE/c/IQ7137rQN2e42QIbkxfNsYVV97+2OgM9a11WqG2YloEbJYyzBK?=
 =?us-ascii?Q?m7m6w0glRjYumR1ACrUac6T6phTTmfyNDaWYQiHDwDVCJT4IKX9E0CyoJ4IR?=
 =?us-ascii?Q?NQ6biHzhREeToDc2fcO2TNsjBQVUd03NV3aDvBxo5ySjGYanLsABJiEJ+/Oo?=
 =?us-ascii?Q?ouWZ627qvfbWMythl5T7aSyhwzzbkPjTq3owGrLr4MnLU+HHQU+yxyk1BI4H?=
 =?us-ascii?Q?/u703+mm6v6yoswt7+swFuxHIF1oqZxfixFbkTZ8Oc6xLOmX8kxrlreg+vna?=
 =?us-ascii?Q?hIA1RVPFzy1E7IVvp8sYs/CKphaldQFWqy2fFmcT2KoeIjfRd4ONvwndsJge?=
 =?us-ascii?Q?TeiUmfOBRYyLZGczsJp5KFN3ijqD5ibkKe8NLAtNffeZnsk+dyPPdbMlDCVj?=
 =?us-ascii?Q?rlNZdXWmBtEyPyAEn35U6ISFFmLGK7p6yaNQwGwBgIZyeI20zGgqJV2Bq+CL?=
 =?us-ascii?Q?EvdPANL0tibCwl4+Hew0FY5vgwb+GtmoVDl48D8YDTKQVc786d4WbIJuusHe?=
 =?us-ascii?Q?f5ZUHJSMM8H9Vy6dpBBxwNsSvO29dpAQpM7Zbn7bTM+YjEuR8SdUUtXK62Hu?=
 =?us-ascii?Q?cbwl5pZsil9Yr371EEmxqAiRHGnyC7/Zss+Q11Sjl4rUsUdLTnZvKkIvWJ4w?=
 =?us-ascii?Q?tgyv/+dNw3EMBNwgbSoJHldhop+lvJIY4E4QSviXKN4ttltOLD1CyDPnOutd?=
 =?us-ascii?Q?CAJ/QE3r/DzPeIlWVHmsQ7i2Xm1XZ6V4ucqpPRwb3pjfmC3iUWRy9Pe/Kf9M?=
 =?us-ascii?Q?aqwEFhhnOOgroPF2Zogbk1NixKNklte0KWfdD/Axs5PQNttavKZe0FpIZEuH?=
 =?us-ascii?Q?FHHpl1R1EVdZPIgQ6jtPJKHi3+ktwM6Bnl5vAK39hJEwMYTbE2kFDLVZ1Mkq?=
 =?us-ascii?Q?PfnEs2ojvOy6TaAeuAmyVBLSz5E4M6gp2A3jCpneXjDnZ5pX/bv/ekZX7ajI?=
 =?us-ascii?Q?jX692kHVgnMFUzCDLbJlHXkrJ1L86rSctjrWtE03dKFgL0HsHhCrHODQaoI0?=
 =?us-ascii?Q?Ceex0OKbU/c2T27b9r++qAYUpJwdtXASerWszsjxylejErgImv4RRbJNtE9E?=
 =?us-ascii?Q?bph0k+ASaiDlVf9mhCoTAdOv69UphRramlM0eWL3D0fA/lZ0BOU2L6dyxcye?=
 =?us-ascii?Q?29ekNDzcI1PgdDV2sVcXH9iu+XDALS2ydN+JwcC6BcXoBoJWJSeNMomBgmRu?=
 =?us-ascii?Q?ZODjAxw5KSCyYlfF6YTHDM8Vg1zds7loUkex0mD0PgJhTMJ5gUbTxEFHZ35R?=
 =?us-ascii?Q?5CQqCM46jQvrigkMLj1kyLLLlcXBDd5XJYCgStCuxq+O9UfPLeQ7IACvnH1D?=
 =?us-ascii?Q?p8xW7zbUANyvicytZikBDh5k2LSJlt67KE3WhJSm/tJVTDxMPPa4oneHxCqE?=
 =?us-ascii?Q?12bXMD4vyTB05MM=3D?=
X-Forefront-Antispam-Report: 
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(61400799027)(376014)(36860700013);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2025 08:36:47.0357
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 54c87aef-c171-45be-020c-08dd6dd3ad8c
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ1PEPF000026CA.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN5PR19MB8967
X-Authority-Analysis: v=2.4 cv=GoJC+l1C c=1 sm=1 tr=0 ts=67e65fa5 cx=c_pps
 a=7lEIVCGJCL/qymYIH7Lzhw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=Vs1iUdzkB0EA:10 a=s63m1ICgrNkA:10
 a=RWc_ulEos4gA:10 a=w1d2syhTAAAA:8 a=DyZ_2FFYdYKSEs-sC6wA:9
 a=BGLuxUZjE2igh1l4FkT-:22
X-Proofpoint-GUID: mthmq0sQCThy8yMEUlDCtzNbMW_eHu6g
X-Proofpoint-ORIG-GUID: mthmq0sQCThy8yMEUlDCtzNbMW_eHu6g
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: ZQSMGBQR4HVROAFN2XU3AELCY3LMVKYA
X-Message-ID-Hash: ZQSMGBQR4HVROAFN2XU3AELCY3LMVKYA
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZQSMGBQR4HVROAFN2XU3AELCY3LMVKYA/>
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

