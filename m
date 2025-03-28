Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CB8F3A74B83
	for <lists+alsa-devel@lfdr.de>; Fri, 28 Mar 2025 14:49:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DF0E8601B6;
	Fri, 28 Mar 2025 14:48:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DF0E8601B6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1743169741;
	bh=8L+SUkeSr6AN7ETpPiE2B7uLK7SY/igXcxe7jyzt0Bs=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=NfShHMhFKi49f1CZdcZLybKsi73qDhoecxnXbCj/0A6RegXAdlWfly5gIHenA6uOb
	 xGtR9ScH1feIoblLgl9NoK0YeUk/Se060uX3H5YzGzoZrMrv3EEgiN1vHiT5iDHytz
	 kebIerRsMXr0C5Ywpi75n2b47IQ8ZzZR7YrQYj/Q=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3C951F805B5; Fri, 28 Mar 2025 14:48:29 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 21992F805BD;
	Fri, 28 Mar 2025 14:48:29 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6CF2BF80548; Fri, 28 Mar 2025 14:48:25 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0DFE2F800E5
	for <alsa-devel@alsa-project.org>; Fri, 28 Mar 2025 14:48:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0DFE2F800E5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=ibrTYFfk;
	dkim=pass (1024-bit key,
 unprotected) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com
 header.b=mzoeb/Gc
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id
 52S81d7Z001257;
	Fri, 28 Mar 2025 08:48:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=vso3ODo4NheqA49y
	28km21DzDJ/D1+pYH24z9PZlELA=; b=ibrTYFfkzWeU2LUm6qcDzhQPJPPIwmz3
	gzGikE6w0Zj9aSd4IbPdjuInLToKTvwz3jaYWdpp7S231QSGINyEHikw3nuQEBRO
	5U5UKZqPKKyFVYW1uNroOMNRwP3mEWBzyaqhFbvuH2aq6jROZ3Q8DFicJ9J0kvyo
	OqEi+5WCHyo5xvnk6/iXCOFx/q9gw/MIXyRMGwIvGC4ZoLa1PldOo9xqbfx/echD
	LjHRqMxAtNDSb0YB32nid9+IEC/7eFEnrqiwOSq7iuA1A6VkiRGv9rhRS94RQ4lL
	YlO9mUNiO5V/ZLROLdYQBv769d49SUWXw5+5NlQUOK7iebxeyRecfg==
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2044.outbound.protection.outlook.com [104.47.58.44])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 45ndnu1a1r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 28 Mar 2025 08:48:19 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OdwdFt4DlWwAr9jU5i1p/9oJDF+R4GTsG7twzQ8SBrkPOQeUJqrrfRTcicYZVl4YjL4wkAJgm7Vf2sRK1Ho4ocBsLRzphXm4e/RG1ZV1OoxNj/Fv1olwWJo+azjXElje6fCXbqdBwBtZ4mM5m4s5zMd9YlCDhld/lmiVNYmccxlFGiZLy3pXpnDagD/idvbEeb9ZL4YcLRS/b4lSdnawNA4Gnma2BKyZMXnr/zo2NU74GNdA1Jkozs0MW1jw1PasC56lcMfwY5y67+RrnoFkD35QsZ/v+0I5yfA+f13CTLRRkxs3oVxMZJil2TT/2xaeJAA/0EAZGDzoaTLNDyiJ4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vso3ODo4NheqA49y28km21DzDJ/D1+pYH24z9PZlELA=;
 b=fU2zQY7l8OFSuW+Hj904kuQsOQaalnmXtom2XjZ4gQywHG5y15sEPXPwumkbGcyBcxlzHvNmdKTbX3vH42//QUhFeSsozzdHowE4e4EAoIf6YsFIz02wNgJ3cShbk2+IKtk92e9KVZeSVSvMM9i7XtPWelDO6RTtyn6jvf+04C0UI+fDk3LVv3ksUaWXkd6ceko2mCFBgOEgSDrdEwxP+dobTibntBAa1tTx40lYOBnEpmprCOFWf2p0Vmsfwu7b8xq7d7qmnXwHiXIcFJujWwCFfWMs6Dwoa23hd2YHZveHMY6CXtP27/qK9c8P0WgYFYyYRvmoNoaAw4AL7KvMkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=alsa-project.org smtp.mailfrom=cirrus.com;
 dmarc=fail (p=reject sp=reject pct=100) action=oreject
 header.from=opensource.cirrus.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vso3ODo4NheqA49y28km21DzDJ/D1+pYH24z9PZlELA=;
 b=mzoeb/GcJTpUSR2JEkM28H4ONPzogchfkXURCt62uAbfic+F4latIZwMEvbGXxtjTe55ly9s264aFVBNR41sAz28xayTYP0GpLlzNff6UCCRHHEKU0PjkDxph5jUc2ti1+f2KOVEQYQk/9yEOZwfpDBj7GdMKN0t2U+YDsHY52c=
Received: from BL1PR13CA0362.namprd13.prod.outlook.com (2603:10b6:208:2c0::7)
 by SA3PR19MB7746.namprd19.prod.outlook.com (2603:10b6:806:2fa::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Fri, 28 Mar
 2025 13:48:17 +0000
Received: from BL6PEPF00022574.namprd02.prod.outlook.com
 (2603:10b6:208:2c0:cafe::e5) by BL1PR13CA0362.outlook.office365.com
 (2603:10b6:208:2c0::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8606.14 via Frontend Transport; Fri,
 28 Mar 2025 13:48:16 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of cirrus.com does not
 designate 84.19.233.75 as permitted sender) receiver=protection.outlook.com;
 client-ip=84.19.233.75; helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BL6PEPF00022574.mail.protection.outlook.com (10.167.249.42) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.20
 via Frontend Transport; Fri, 28 Mar 2025 13:48:15 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com
 [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id A8655406547;
	Fri, 28 Mar 2025 13:48:14 +0000 (UTC)
Received: from ediswws03.ad.cirrus.com (ediswws03.ad.cirrus.com
 [198.90.208.11])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 6A36C820244;
	Fri, 28 Mar 2025 13:48:14 +0000 (UTC)
From: Maciej Strozek <mstrozek@opensource.cirrus.com>
To: perex@perex.cz
Cc: alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
        Maciej Strozek <mstrozek@opensource.cirrus.com>
Subject: [PATCH alsa-ucm-conf v2 1/2] sof-soundwire: cs42l43: Drop headset mic
 from mic mute LED
Date: Fri, 28 Mar 2025 13:48:08 +0000
Message-Id: <20250328134809.3008238-1-mstrozek@opensource.cirrus.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00022574:EE_|SA3PR19MB7746:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 3bd62a51-b80e-4a1f-31c6-08dd6dff30d2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|36860700013|61400799027|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?zg/ssCl8cn/OqHvcHq/g7/iMLSicATf2c2Kfjlu6Y3911HgVSN5uXOE9K1Wq?=
 =?us-ascii?Q?/JRQBe+/jpaK53ti06xR+fNsklXF07UOMeDEkkeDzHtai2J4tsQOk+rw6P2t?=
 =?us-ascii?Q?t4tsMjZ71Hu3snRPSaKX550XEw+zSfNRYwNbsO2DM7Ap7eNakTGj3iJQaznJ?=
 =?us-ascii?Q?AQ3U58BGAHTMWVq+iw4qTrkESXX+VkSoZzPdMzcAmw8TQmOzHF0YnHZMMBP5?=
 =?us-ascii?Q?rmBReDoxKUaG0pappxJcuc39lMA2JjCs7SAFWDqs55ZOprOaL6Ica+SXzE19?=
 =?us-ascii?Q?qeri1Sn4ts+F/YSH9Ohbgn2KS2lYoAQMw28g4EbSft/zz4FQHaBbPOARTesE?=
 =?us-ascii?Q?agkRgQvxR5Yp0LwnzD+uJN+TMZeZyF747CmrUJMlGDIegFscesvT9S+Nbtli?=
 =?us-ascii?Q?DR5UEWSdk8AFfjrd57gPsc9hWWOwYNlqYbU5Y/I+GxveB5H4ZctQ0XZrlIcJ?=
 =?us-ascii?Q?RZDB7ay2kooxwybei0mXXvDD9JMbzkPWIYBYehBC6OvY0Lxygei/irPwC7aO?=
 =?us-ascii?Q?zsC8d6anelxNEsZFXi3r4RdhlSRWIYDlENoip+NJ2XKVHtIx33R0EbzBv2rz?=
 =?us-ascii?Q?47Bho/02h9QpeX3XyMkhm3vkHdunNmF2pP2kTICFZAby0ABGJTdMnWZDBgbP?=
 =?us-ascii?Q?vtUeKxakkCngQEsh3Rbn82jm5GK3oqrmoQOgGi7E+pbdqmbhmVhl0VSOFMzU?=
 =?us-ascii?Q?mgC1lPaQneVg3vaHbOTSUlyZ+r7xBy7JMV6R3YBIzFMZORpmlszfJb5ilByi?=
 =?us-ascii?Q?znCCs6hhCeHIcuD5516OtUXIr03AJutC5amZJIsFGoiPucKSCJorhr6tkpJZ?=
 =?us-ascii?Q?KzFnvqCs+DitzOWUlRHd/FDdm827jpW7y+PeVNl4gegbG/NRczk/l4Dkph+u?=
 =?us-ascii?Q?rldc4YZeauSK15QHQZGczNDwmt3sAGMWoyBOQp56TuBlf3zFhE/09RfRbTAZ?=
 =?us-ascii?Q?BNN8bv4Q+HE6WlRiVTcUwZjwUlLLLSEXbYAc64lhKLw1cbtcv6Bulc1/Dbce?=
 =?us-ascii?Q?SpHyU3vstEheYI5b7M5niyEWQCt3NQnUWqE1d9sVPzSpkR58WtmLO/d2mkuE?=
 =?us-ascii?Q?9OPOVz57qMomK1DctpsnKdFJH2czB3CkE86sS/EQkgElXZf6QfUFX5CWlmg7?=
 =?us-ascii?Q?GgsxaB8Or++sVC2lEFm6c1ZYi7JmMlrtVGrlqRR+bdvHU4xfnC0OJoAZ7GRn?=
 =?us-ascii?Q?A+BicvOYWw/LvSBvNftlCuhq5dWAMwlo58HjsQVSzD69h+Xgp/BnI2ICKVoF?=
 =?us-ascii?Q?mY/XLiaDjh0ViaXQDiCUK0obo/uzP9rlKnhVEIwFZ4c9k/Z1TLyclePam/Yn?=
 =?us-ascii?Q?inLNDPjfPLKjYtpRxklkl4gUt3Wil4b5SW9OzIB9h7ViL1pxfCgvteQnFFH8?=
 =?us-ascii?Q?XtmZh3Eg7QjnLIq2bkdR+2Ue6WEi9V4KOMJhqmNj5b/zojW4Unqp1NAKmoxz?=
 =?us-ascii?Q?cMpVRqXdtFttuAPwrTouzb+DXgT6GpEwREj8j22Y+d6rtOEQw1V5wCBZ+PYV?=
 =?us-ascii?Q?/SgU919UQRAYkgU=3D?=
X-Forefront-Antispam-Report: 
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(61400799027)(82310400026);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2025 13:48:15.7616
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 3bd62a51-b80e-4a1f-31c6-08dd6dff30d2
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL6PEPF00022574.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR19MB7746
X-Authority-Analysis: v=2.4 cv=GoJC+l1C c=1 sm=1 tr=0 ts=67e6a8a3 cx=c_pps
 a=di3315gfm3qlniCp1Rh91A==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=Vs1iUdzkB0EA:10 a=s63m1ICgrNkA:10
 a=RWc_ulEos4gA:10 a=NEAV23lmAAAA:8 a=w1d2syhTAAAA:8 a=v5nzFTQaneLPnvQRnKoA:9
 a=BGLuxUZjE2igh1l4FkT-:22
X-Proofpoint-GUID: D7s43bfIJM0xv5qLd3-3GbMPJcEY2BWP
X-Proofpoint-ORIG-GUID: D7s43bfIJM0xv5qLd3-3GbMPJcEY2BWP
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: GSY4HKGJDCECPVBHHMDQSW2K4ENGLZ7I
X-Message-ID-Hash: GSY4HKGJDCECPVBHHMDQSW2K4ENGLZ7I
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GSY4HKGJDCECPVBHHMDQSW2K4ENGLZ7I/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

As per conversation in [1], let headsets be dropped from LED bindings.

[1]: https://github.com/alsa-project/alsa-ucm-conf/pull/512

Signed-off-by: Maciej Strozek <mstrozek@opensource.cirrus.com>
---
v2: Added DisableSequences back
---
 ucm2/codecs/cs42l43/init.conf | 6 ------
 1 file changed, 6 deletions(-)

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
--
2.39.5

