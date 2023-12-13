Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D6768806D5D
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Dec 2023 12:07:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F2D6B112;
	Wed,  6 Dec 2023 12:07:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F2D6B112
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701860847;
	bh=5wwTK0G6IvfQbK/gbVtvMze0bGgPqdvQXffEB2WeNkk=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=GEmXt5JocuUfA5aXsc3Y7LiC74tVQ4mRIMBWqVFY6Mt7TXUIbDJUC0rDptcP7jqR5
	 KasXdffkFrisaocDrCh7sj1xVmnVi7SPXRKMuaDJvrdnm2GOAXAQlfjbR+wLMxXmby
	 siz+9Kyj356lD+Vu9WCC6VsnXzezvSEV+vGcwsiI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9B3D5F8057D; Wed,  6 Dec 2023 12:06:55 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E124CF80571;
	Wed,  6 Dec 2023 12:06:54 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 059F6F8025F; Wed,  6 Dec 2023 12:06:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20612.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eaa::612])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 69B7EF800AC
	for <alsa-devel@alsa-project.org>; Wed,  6 Dec 2023 12:06:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 69B7EF800AC
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=xcQXbEqC
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SpvVU0rtc8eRU1E33bjydU1VCyaDz9Icrk7wUsuhs+V/8mjxk1MPtaqzMVf3lJFe88gywfDKM10L300iF1wPr9wsBIedUi6Mvc5+Jq80V1jLX60vNxdDsbunnUXBdLNRvZ73U2rfQi1piT/dCfE1Ur66U/lqTv50dSEat1T0VpcGXUBW9pHW2j5SMaxKdAMOwnzZkE0Eh4Ei5QYt+pKkU99U+59+oGaIEyJiGt9k5Xc1UKK56WVrEhg+TokXOoauPavY4SajYj184CiTbe7r03Rc0ZLvhJ+jn66eJ9A8HXhzdjTUOdkPtnmk7jT4Y8PkETGMvQ+xybCVI+KN/rPgVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/vvXWSHBYZgr9lE5HLHqahrWcZxeUN4rh5k6aov2QBw=;
 b=XPAc7yOykKpvCWMXeCCfDR+8cs6OrC0qCiPdF2YEl5TOTGzWfGlbkjQEi4N0aZ3RfYYGdBYDEsi5MXC19BFe2bpKgRXLnO75daGrg6IDX6TdD1GVistgwdqFhAnwGptgZjUNxdlPkdLWjJof94xAlkAV7Ky8l0rUV/rCC+vcnWt2pYALBRkcH64ugXd5u8tp103/ISNaP+vL7BT36UyoxMkeZ8iRkLYgjHbAbE24nHCg/dM0ZvjJRzEaht8dZkm+1Df7yDGmN6Gl0eBHvECTg4grtq2wA/RxNZr09fnhYRsYP6CH6xXQ/2ZkrCM6bqOywML7iXVRTGFaA77xDV/W5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/vvXWSHBYZgr9lE5HLHqahrWcZxeUN4rh5k6aov2QBw=;
 b=xcQXbEqCV/yOPYtvFpLMHTxDhOiBSez4JG0qMIY2umaGopQFxAArdf7Xu5LUv3G2imMlQpvBDlqw5sPYOLKvkgTUp4EgoW/t7gsiojUID+gkdqG4775ltjNIRl/dEdXM7FYN485MqgH8i1q8wCWzBJZFrWfBSVTA1d+faoTLi2c=
Received: from MW4PR04CA0074.namprd04.prod.outlook.com (2603:10b6:303:6b::19)
 by DS0PR12MB8443.namprd12.prod.outlook.com (2603:10b6:8:126::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.37; Wed, 6 Dec
 2023 11:06:25 +0000
Received: from CO1PEPF000044FD.namprd21.prod.outlook.com
 (2603:10b6:303:6b:cafe::c6) by MW4PR04CA0074.outlook.office365.com
 (2603:10b6:303:6b::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.34 via Frontend
 Transport; Wed, 6 Dec 2023 11:06:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1PEPF000044FD.mail.protection.outlook.com (10.167.241.203) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7091.2 via Frontend Transport; Wed, 6 Dec 2023 11:06:25 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Wed, 6 Dec
 2023 05:06:24 -0600
Received: from prasad-lnx-mach.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.34 via Frontend
 Transport; Wed, 6 Dec 2023 05:06:20 -0600
From: Venkata Prasad Potturu <venkataprasad.potturu@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
CC: <Vijendar.Mukunda@amd.com>, <Basavaraj.Hiregoudar@amd.com>,
	<Sunil-kumar.Dommati@amd.com>, <syed.sabakareem@amd.com>, "Venkata Prasad
 Potturu" <venkataprasad.potturu@amd.com>, Liam Girdwood
	<lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai
	<tiwai@suse.com>, "Marian Postevca" <posteuca@mutex.one>, "open list:SOUND -
 SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..." <linux-sound@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: [PATCH 1/7] ASoC: amd: Add new dmi entries for acp5x platform
Date: Wed, 6 Dec 2023 16:36:12 +0530
Message-ID: <20231206110620.1695591-1-venkataprasad.potturu@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044FD:EE_|DS0PR12MB8443:EE_
X-MS-Office365-Filtering-Correlation-Id: bbcbdd4f-e756-484e-22a9-08dbf64b6359
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	J4DYWNDnVITvJmmxe/gQ6WKgz73kaOH2QuYe7hUo8CDWWgvsMwMIcqXhinz9ninW+yUtMzR1wpM8IcR3RmQ0j/jYeOUvNuphUt1BqgjavL3nyC4BwPLO/EreWanbxS6K2QYiQkpe/yhL9iMxC8KSzeR214BUIh+WGi23GQRErSAG8dvdGYRDxb2da0eb9uI7X3PpPgIkKBpLU7SpP0MmsX2KS00eKN6tnIEMU5o0eUWW1E56rzAOFLRWabSDlE5vpzo6COxC+bUJb2/JaC58ZqOSfolJmc6ZetzU40pIL2c0N3Eex8QXIGR0orrHnxM2mTIzE+l6P/fZB94llwTv2IJ7aCOqmeilNftjn3xeXj2oingWEsAMO9LRPBli/8rOWlAwgO5b7a4w9PJPwcy4n7mmhG0icIivIEamfe+QBE5hbx0p5pPqDNWEB0CkKcIppqfRyupp4aCDcwBTLGqth+PnqqE/WDJu+sneDC3xDC7eXyVPkNbAbtiEgZuA4UMwIV9Z8F5nK2lj04aYyGVGRxMH1CzDlPzNymP6sxXkKfQjpgFS1Fh0pZSi5QkYLr6imfzVRoxqFCsWlChgpvB4I7rHlGo4DKp8quBdXwJVfNBNyi5hYlXsxeupoLzHPihX0PhHYbvT7SIWY13VR4idO+IJoVwxt5ILlz/Vr0L2XDzc+ncgGBiQoWh1gywDs673KNzZUotmo6eefI1A9agjHv+70L3v5zD/xYzVh2OYww9cnmZH3oaGzHQR3o+lVzBxzvfpT9Oea/EXTyhdE5JLVRSOdWlJpnR2SPN2f5m6G49qi5rk4LE+M7oPABlHimmHcGtuilrgP8yp1UmTw7Siww==
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(346002)(396003)(376002)(39860400002)(136003)(230922051799003)(82310400011)(64100799003)(451199024)(1800799012)(186009)(36840700001)(46966006)(40470700004)(8676002)(8936002)(70206006)(70586007)(478600001)(40480700001)(4326008)(7696005)(6666004)(5660300002)(316002)(54906003)(110136005)(2906002)(2616005)(40460700003)(26005)(1076003)(36756003)(47076005)(81166007)(82740400003)(356005)(36860700001)(83380400001)(426003)(336012)(41300700001)(86362001)(42413004)(32563001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2023 11:06:25.1104
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 bbcbdd4f-e756-484e-22a9-08dbf64b6359
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CO1PEPF000044FD.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8443
Message-ID-Hash: DDA3XTDO5H53NMHQI5OQWJ2BTYVUM6S7
X-Message-ID-Hash: DDA3XTDO5H53NMHQI5OQWJ2BTYVUM6S7
X-MailFrom: venkataprasad.potturu@amd.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DDA3XTDO5H53NMHQI5OQWJ2BTYVUM6S7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add sys_vendor and product_name dmi entries for acp5x platform.

Signed-off-by: Venkata Prasad Potturu <venkataprasad.potturu@amd.com>
---
 sound/soc/amd/acp-config.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/sound/soc/amd/acp-config.c b/sound/soc/amd/acp-config.c
index 20cee7104c2b..19a30f145143 100644
--- a/sound/soc/amd/acp-config.c
+++ b/sound/soc/amd/acp-config.c
@@ -3,7 +3,7 @@
 // This file is provided under a dual BSD/GPLv2 license. When using or
 // redistributing this file, you may do so under either license.
 //
-// Copyright(c) 2021 Advanced Micro Devices, Inc.
+// Copyright(c) 2021, 2023 Advanced Micro Devices, Inc.
 //
 // Authors: Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>
 //
@@ -47,6 +47,19 @@ static const struct config_entry config_table[] = {
 			{}
 		},
 	},
+	{
+		.flags = FLAG_AMD_LEGACY,
+		.device = ACP_PCI_DEV_ID,
+		.dmi_table = (const struct dmi_system_id []) {
+			{
+				.matches = {
+					DMI_MATCH(DMI_SYS_VENDOR, "Valve"),
+					DMI_MATCH(DMI_PRODUCT_NAME, "Jupiter"),
+				},
+			},
+			{}
+		},
+	},
 	{
 		.flags = FLAG_AMD_SOF,
 		.device = ACP_PCI_DEV_ID,
-- 
2.25.1

