Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A51B194A375
	for <lists+alsa-devel@lfdr.de>; Wed,  7 Aug 2024 10:56:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 17969191C;
	Wed,  7 Aug 2024 10:56:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 17969191C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1723020990;
	bh=8nXWNviDyf9XOYe5n7yDx33vkYVLw0mSCy5pXLvIedY=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=A2xarUMrXuVsHq4Z0x9YFrfcNX3YWuDqLONg2t5gLdviX6DBd/YJROOIEkpuE1r+r
	 g2Qv2zamp3xYGqU4c0GUizI1VG00HbfNY2SPscES79f/QpwTOPe37e2zsrU5nZl0nR
	 I6az3L567rz+zDGis9gBCU64c3vy0y90Pl6XBo5E=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D58D6F805A0; Wed,  7 Aug 2024 10:56:00 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9E4E1F805AE;
	Wed,  7 Aug 2024 10:55:58 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 409ACF802DB; Wed,  7 Aug 2024 10:52:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2062d.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2412::62d])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2C190F800BF
	for <alsa-devel@alsa-project.org>; Wed,  7 Aug 2024 10:52:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2C190F800BF
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=GHdE1z7W
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TwzM9+F3XGrb610hWVUdOB1OEgF3eyC1JsOVRa22OsVFDlrlNGY02tyK/yZVFnrSoZ+/jpCgNBuu4Zmha6QuWmdwVsvDOEcZfoIWJDfQKzT54i4rPME66sy63d5prrrF5/8s73QPjG0q+jIlY/Xjrs+z2qc1DQ44OFZvojvbX15ST92jVaccxctVFHmPgeuKz7trdiTnLbyUBVG3MKGs5shf5w7OSU6Ty6vkqBXBk7ZvqxyGNYdzIjj5WWjfm6n2bbhJvpDdfj2pmXyfX1kzgdIKgaGKeAz6fKqCj57ATaws5aOpmtLObZxmIJmq3xrc/GCtJvGVI8I3aTZP1l6Ldg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PsvA8deCsHoDrrkYgodlqtuNzHusZC/0ypIGu8ltK+U=;
 b=YuYh5X8dMVe62jWn+lHRhTFMcIYaRbLPET5Fy5S7hQxSsVLNYdgtX4LryyPN17mrxWpnKNMbsIUn3VgqcgzNiP1lP+5E6ONxIHx4kytt6yFdJ2GLckOFPsUGrFZmzn+EI698Nc3r9G6apXlWNP7gHM/HZlHfUOsz/htKvd8LO7fjbbZ+wqbAhqYyki8SYgPIdXozzhQQp+xEUs/rptlQxO9v8OfpwuTCoq6QalpwDh1IlAZcamjZPuqD+xrlXeDr34bBICNTUwezde9fkwBads3Yqd+xJjDfmKO1YBCPMoXfX38TfoJ4hpUXHqucVIjUdMnuI0M5tjDncJM/hk2sng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PsvA8deCsHoDrrkYgodlqtuNzHusZC/0ypIGu8ltK+U=;
 b=GHdE1z7W7qz1U8Xm4rlz+hOAsu8IVxp3kXdCLnqz8eNIwQSTVOwRqp7B79KrFyXR9wW8nShBxwL0Ix/AoRiaXNvXXWnHh+ktWbYYSFilvAK3Z8Ym+44NTznbhVXDCutBaZ3Nic/EIL4FeVGfrXojt4le5HpoB47VZ/JzKiDT5PE=
Received: from CH0PR13CA0007.namprd13.prod.outlook.com (2603:10b6:610:b1::12)
 by PH8PR12MB8605.namprd12.prod.outlook.com (2603:10b6:510:1cc::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.21; Wed, 7 Aug
 2024 08:52:14 +0000
Received: from CH2PEPF0000013D.namprd02.prod.outlook.com
 (2603:10b6:610:b1:cafe::e1) by CH0PR13CA0007.outlook.office365.com
 (2603:10b6:610:b1::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.11 via Frontend
 Transport; Wed, 7 Aug 2024 08:52:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH2PEPF0000013D.mail.protection.outlook.com (10.167.244.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7849.8 via Frontend Transport; Wed, 7 Aug 2024 08:52:13 +0000
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 7 Aug 2024 03:52:08 -0500
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>
CC: <alsa-devel@alsa-project.org>, <Basavaraj.Hiregoudar@amd.com>,
	<Sunil-kumar.Dommati@amd.com>, <venkataprasad.potturu@amd.com>,
	<sunpeng.li@amd.com>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>, "Liam
 Girdwood" <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, "Takashi
 Iwai" <tiwai@suse.com>, Syed Saba Kareem <Syed.SabaKareem@amd.com>, "Kuninori
 Morimoto" <kuninori.morimoto.gx@renesas.com>, Jeff Johnson
	<quic_jjohnson@quicinc.com>, "open list:SOUND - SOC LAYER / DYNAMIC AUDIO
 POWER MANAGEM..." <linux-sound@vger.kernel.org>, open list
	<linux-kernel@vger.kernel.org>
Subject: [PATCH] ASoC: amd: acp: add ZSC control register programming sequence
Date: Wed, 7 Aug 2024 14:21:48 +0530
Message-ID: <20240807085154.1987681-1-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000013D:EE_|PH8PR12MB8605:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ba44dd9-29b2-4370-e612-08dcb6be3b1c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?kNqPra0qK8ZpsMEXQdcFqTqp78s4nXNITc45b8sDBkA2RwR4E/Lrx03ab9B0?=
 =?us-ascii?Q?vioNumb/FKGb96JrhirmwXR5NYoRjUsdDk8F8InQ7ymu+JG1gpttAVmqukQY?=
 =?us-ascii?Q?xKY0eFBVe+EtIIclENy3lu9nLscJSQ67T2jrIlVEUEHaUSIqrOtSdNscOv3m?=
 =?us-ascii?Q?bVkPhoEpuZkCqV9CddurBn9GHU7zMUYsrhLO718Pzfvs6amqTey0o3/X7OUb?=
 =?us-ascii?Q?V85b/BLBhIR2LtnM7EN6XXCO0KSPiWC8aRchO6ZthAviaWr2WqKQCagTjJ47?=
 =?us-ascii?Q?qlPPmEJNW83uhQR2572wv9l4JX5rdcnFJxseQl0CNTHio4/6VpOn9P8INWq1?=
 =?us-ascii?Q?aUHUumvC1hUxUtanjIVL9VaTvLQzjg0piExuWp30cjJQQ1MInu7IB4jj+bOd?=
 =?us-ascii?Q?Lmaqbc3BNx968/01xtiFjI0VoUh9Gyp+2WH90JegoblcT0hH7REnMIR9gkVC?=
 =?us-ascii?Q?VMDQO2ph+NToG0a/ZPM9xodYPJlmWr7KQAmC51LaK1jaAO0JJssvrhIb3ekp?=
 =?us-ascii?Q?eIDiR2V5xU1NT9u1odvRPybbbNnhCFmXJq2VFpbdO7PvoGkx1ZoJqCHG5KYY?=
 =?us-ascii?Q?YWhD7847Yf0qfml9PwsydBKWrGKETvJgCIeJHqO6bsaILaP2Uy9ALFULCQjj?=
 =?us-ascii?Q?sK73dtSG50lltxObq0/binQVEkT7OGC+07kW9lahSWadcQ68bSfqxaiwm7P9?=
 =?us-ascii?Q?cXiETKvQjQJluv1djEy2jNC3vimKMfsd05hGO88fZpUKTGfStroOSP1ntCXH?=
 =?us-ascii?Q?uLFdZKBS07R54Ss8EswT8IGWSvzLO1ghWgIOiT/qL2t3hg0jJCKKjssSEqHN?=
 =?us-ascii?Q?BdKyjL8ihIwWLbLbD/9bTH3GCWbh6ABJnG82grTFN4KU5RwpG9FgPp1ygDYl?=
 =?us-ascii?Q?CSMclyBCvuZSh3LGxLj2gJ/HycvpGO8b6qyIa81wPteMDUbcM4n8E1yL9/bq?=
 =?us-ascii?Q?qoX7u3gCs9THZLmmkr10gWcR1TtWRUe3fljy3gtWwqoqk5+z83dECOjbehjk?=
 =?us-ascii?Q?libv+rBkqAjGsIT17aU+cxS3RNkIENUo1J99CpQJIJp4npjmWGNKlZbs2nbh?=
 =?us-ascii?Q?TwkYuVO+lFO9Hu2cWBYrzsA9XtBEHOkgzo63jmIzXFWmaDmvsBK0eB3ttmsm?=
 =?us-ascii?Q?PnysqNJJvVJ020tEGxptLSfX0Eu8ZyNLhi9i/e84PFYMyBa12mzgLVzJNLNO?=
 =?us-ascii?Q?rawlXtbNBJ+1qCP0Ii4IRv3lERB8byZ++c9MYxmy+S4CdHegg7jFUn6NIISf?=
 =?us-ascii?Q?AaM//ZAXe9dJdkZ1VX5pHDeH3aiDn+8upjMoGjhTTF5xBYfGTfqsP8hwnwA8?=
 =?us-ascii?Q?Fy5fOUzI0ibX5dbig410YMyofMqNer484EPW8zV4k0wDDVsPyJY/TxiLfjDQ?=
 =?us-ascii?Q?y4ZAWVZyGNDHMp54EWwEsx+WIYofpL5e8Nu5ApKtyZWNVZ/Xe6eJ5fyRmTTP?=
 =?us-ascii?Q?eqQC6Ts23SHthiGqil0c7keijPzCA5k0?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2024 08:52:13.0777
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 7ba44dd9-29b2-4370-e612-08dcb6be3b1c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH2PEPF0000013D.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB8605
Message-ID-Hash: 4HYRVDIWOU3ZUTPAPGKH4FLL4DLYP7CK
X-Message-ID-Hash: 4HYRVDIWOU3ZUTPAPGKH4FLL4DLYP7CK
X-MailFrom: Vijendar.Mukunda@amd.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4HYRVDIWOU3ZUTPAPGKH4FLL4DLYP7CK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add ZSC Control register programming sequence for ACP D0 and D3 state
transitions for ACP7.0 onwards. This will allow ACP to enter low power
state when ACP enters D3 state. When ACP enters D0 State, ZSC control
should be disabled.

Tested-by: Leo Li <sunpeng.li@amd.com>
Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 sound/soc/amd/acp/acp-legacy-common.c | 5 +++++
 sound/soc/amd/acp/amd.h               | 2 ++
 2 files changed, 7 insertions(+)

diff --git a/sound/soc/amd/acp/acp-legacy-common.c b/sound/soc/amd/acp/acp-legacy-common.c
index 4422cec81e3c..04bd605fdce3 100644
--- a/sound/soc/amd/acp/acp-legacy-common.c
+++ b/sound/soc/amd/acp/acp-legacy-common.c
@@ -321,6 +321,8 @@ int acp_init(struct acp_chip_info *chip)
 		pr_err("ACP reset failed\n");
 		return ret;
 	}
+	if (chip->acp_rev >= ACP70_DEV)
+		writel(0, chip->base + ACP_ZSC_DSP_CTRL);
 	return 0;
 }
 EXPORT_SYMBOL_NS_GPL(acp_init, SND_SOC_ACP_COMMON);
@@ -336,6 +338,9 @@ int acp_deinit(struct acp_chip_info *chip)
 
 	if (chip->acp_rev != ACP70_DEV)
 		writel(0, chip->base + ACP_CONTROL);
+
+	if (chip->acp_rev >= ACP70_DEV)
+		writel(0x01, chip->base + ACP_ZSC_DSP_CTRL);
 	return 0;
 }
 EXPORT_SYMBOL_NS_GPL(acp_deinit, SND_SOC_ACP_COMMON);
diff --git a/sound/soc/amd/acp/amd.h b/sound/soc/amd/acp/amd.h
index 87a4813783f9..c095a34a7229 100644
--- a/sound/soc/amd/acp/amd.h
+++ b/sound/soc/amd/acp/amd.h
@@ -103,6 +103,8 @@
 #define ACP70_PGFSM_CONTROL			ACP6X_PGFSM_CONTROL
 #define ACP70_PGFSM_STATUS			ACP6X_PGFSM_STATUS
 
+#define ACP_ZSC_DSP_CTRL			0x0001014
+#define ACP_ZSC_STS				0x0001018
 #define ACP_SOFT_RST_DONE_MASK	0x00010001
 
 #define ACP_PGFSM_CNTL_POWER_ON_MASK            0xffffffff
-- 
2.34.1

