Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DB571C757A8
	for <lists+alsa-devel@lfdr.de>; Thu, 20 Nov 2025 17:53:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 742FF60260;
	Thu, 20 Nov 2025 17:53:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 742FF60260
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1763657639;
	bh=kthHVKvH9Y0p4Ly6TxBEi8Gu+MYu0Gq6xvOUZdpGbcc=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=VmdLWpo1iIhm8yTj2D80/73kMUt/LcNXa5DbnxecoF/HojioBlW4S2NcqWUr8E48j
	 sW0TqEZo6m7erjrKMzHD+JXa7OcetFqIotCIQIBxBEq8eeSsdP/+wgWG39dUOmAcCE
	 o4xnZOcD57PLnHvLxCw9gKgu2YGmPECx3lVH5yWg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 556FFF806DC; Thu, 20 Nov 2025 17:51:35 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E67ABF806E3;
	Thu, 20 Nov 2025 17:51:34 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8EDC4F8021D; Thu, 20 Nov 2025 10:22:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.3 required=5.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,KHOP_HELO_FCRDNS,T_SPF_HELO_TEMPERROR,T_SPF_TEMPERROR
	shortcircuit=no autolearn=no autolearn_force=no version=3.4.6
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11013009.outbound.protection.outlook.com
 [40.93.201.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B580BF8001E
	for <alsa-devel@alsa-project.org>; Thu, 20 Nov 2025 10:22:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B580BF8001E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=selector1 header.b=WJcqoqPe
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GPk+uoRDtc9nvwyHoAQ8Ty9Y+AYF3m/EQ3r//bl0djCkSATHJrHaW4fgb25wA2sRJkH5QSjpoRUKOCeUbni1HqNIwT30v3YPHSq4LCbOmdVLFMo3jm8aEN9NpJsRVHIiwr05uu4sx9wSzyHRKVqRS4Md9nfP1TuGKTyFVMAcahFJNlHE07SWOvD0ujNutniRvIa/vbAbESWJ/I5SDPLTsvELMbA7ZsizGAh41q0uXCSupdVixnU+h29jvVjr2PtMB0PNlcwPvI6xMAFld3FojofHffJJdq9SjC4Hji2Z9F5SnQCARhEn+b9b5ARlvnT9iIQsaYs4HRyxCn4vcbAGhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=inACY9p8A97dULUhJle5/gJH0h96GUwOKOh8QcZzq5M=;
 b=s/VAnKfhdVgxOl69v5iSLYI8g5MmuB1M6WhEyv6X+qggBPpp2ZWwvFdIxTLYEIDrLINw2jNP9+KlMhXNHRnWIV8TmK49nyRMbpM70zTL9b7RRy2ioKvCm6ckx3vugH4H1TUhxA5Uuv/x9PGlhrsoheq8MC6HF3Ub6PCUcC2r9tLmAsSuaO1knr3CWyTpnySYv/DeoX0iNAAz7pe4zw/+ygLUc308wulsC/i5X4mBeKozZXUcw/oh8hJI6AwJ2lW9s3kGSXLXI/NzGP/2Cp8lDJZwtrresyLQC3lWSBgepWwzckwnzpZiSmKiGKpqGMnI9q/Q3M5Q0NP//Pz4fyDKfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=linaro.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=inACY9p8A97dULUhJle5/gJH0h96GUwOKOh8QcZzq5M=;
 b=WJcqoqPez2VnSEbpeIHWgKFqeiwEXSn9bDqZzZdrsCI4hqFHaK18X4TP4M7EtKVw9OkQBGBQFTtpynAGIyEC0eZY2sdfBUwjewbaNHs+58k0Rx3thcE6rq0saca+soGxK+LX7Jd2pE68o70IJk6ugtfy0wEPplBDiOVUlSgy1QQ=
Received: from SJ0PR03CA0127.namprd03.prod.outlook.com (2603:10b6:a03:33c::12)
 by DS7PR10MB5926.namprd10.prod.outlook.com (2603:10b6:8:86::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.11; Thu, 20 Nov
 2025 09:22:28 +0000
Received: from MWH0EPF000971E9.namprd02.prod.outlook.com
 (2603:10b6:a03:33c:cafe::4d) by SJ0PR03CA0127.outlook.office365.com
 (2603:10b6:a03:33c::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.10 via Frontend Transport; Thu,
 20 Nov 2025 09:22:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 MWH0EPF000971E9.mail.protection.outlook.com (10.167.243.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.9 via Frontend Transport; Thu, 20 Nov 2025 09:22:27 +0000
Received: from DLEE209.ent.ti.com (157.170.170.98) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 20 Nov
 2025 03:22:23 -0600
Received: from DLEE201.ent.ti.com (157.170.170.76) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 20 Nov
 2025 03:22:23 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE201.ent.ti.com
 (157.170.170.76) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 20 Nov 2025 03:22:23 -0600
Received: from LTPW0EX92E.dhcp.ti.com ([10.249.133.122])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5AK9L1c83383883;
	Thu, 20 Nov 2025 03:22:18 -0600
From: Niranjan H Y <niranjan.hy@ti.com>
To: <alsa-devel@alsa-project.org>
CC: <linux-sound@vger.kernel.org>, <lgirdwood@gmail.com>,
	<broonie@kernel.org>, <ckeepax@opensource.cirrus.com>,
	<yung-chuan.liao@linux.intel.com>, <ranjani.sridharan@linux.intel.com>,
	<perex@perex.cz>, <tiwai@suse.com>, <cezary.rojewski@intel.com>,
	<peter.ujfalusi@linux.intel.com>, <kai.vehmanen@linux.intel.com>,
	<pierre-louis.bossart@linux.dev>, <navada@ti.com>, <shenghao-ding@ti.com>,
	<v-hampiholi@ti.com>, <baojun.xu@ti.com>, <dan.carpenter@linaro.org>,
	Niranjan H Y <niranjan.hy@ti.com>
Subject: [PATCH v1 8/8] ASoC: tas2783A: read slave properties from acpi table
Date: Thu, 20 Nov 2025 14:50:50 +0530
Message-ID: <20251120092050.1218-8-niranjan.hy@ti.com>
X-Mailer: git-send-email 2.33.0.windows.2
In-Reply-To: <20251120092050.1218-1-niranjan.hy@ti.com>
References: <20251120092050.1218-1-niranjan.hy@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000971E9:EE_|DS7PR10MB5926:EE_
X-MS-Office365-Filtering-Correlation-Id: f713dbb5-9109-4c30-48c5-08de28165301
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|7416014|376014|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?UnfhWaMvBgyQAbbMjoTMIhFkZomCaOZa5YbohycDJtAb5mFUUavNho6IYRWF?=
 =?us-ascii?Q?tQi88bmBYC46TW/dfzIB6UenPUI4JMmrb84L/c98l46K1bRqJcku1Nq3GwmQ?=
 =?us-ascii?Q?PlpKghL2R09HxFzPkZwiMipBD6y1nuMRBhaK/S//FQEO9oWTwmoy4i/fKQp4?=
 =?us-ascii?Q?XII/cD/JiMixd3pQ7Sp+vM0HuG2j8zVTKNIOugij65D5eO6utKuJRCBvgGwT?=
 =?us-ascii?Q?UMyEQDvNdN2JeluTT372OqYuQPY/UP6glx2zDZWmzZPme1udcNzugsBScaF7?=
 =?us-ascii?Q?4L1A6ntAIWQyacBWIYeJFbfJOQ9fkVwzBtyahMN58bOZKBR5YibXZGRNyC+l?=
 =?us-ascii?Q?xTKLNOFGwGiAPS/xI8RouZf3jZ8Y5GNbxJ5EO+M+QCZlBUxEnR3qFPB7jWEM?=
 =?us-ascii?Q?pph7cHk3NkfL7sjOkgBbxQHHbxwG73t+6HQWK+BpchvGKeUOCsrYGweHmUqT?=
 =?us-ascii?Q?fSbsPrUjcKTkskLzXLTv/DkwvCXulY98HPuPXgwGAyOmwMcXO4FVVRqWcFIV?=
 =?us-ascii?Q?oMJTfXL0UtuKKbNV3KvcrFP272dFp2gETThYc+uMUH2xsVgAiOgsgBGBP0lo?=
 =?us-ascii?Q?NgCz02Sj9pNmMPLErOldJG0FTE8kyUbBZbdaym8lCEDFolK5tlOPYwhua3ax?=
 =?us-ascii?Q?O2qR9q0BHWsCv/PVuiTO7n0FPT3hqSlF5R0uxaApDRIKLbzhLH/W0AmOEMdr?=
 =?us-ascii?Q?TQtUGCa726EBq139dhPnok0a656LwTWsA/tAeBLQQPnEvV6AnbcImNiQrexc?=
 =?us-ascii?Q?y1YXI5YEZZZuxrjEMZcMV2R0qZouHsmDJA2px4d3w3vnSASSdcIa9sbAhGSS?=
 =?us-ascii?Q?FoNx0cKT9Nb4ae2byiyeaCH+DGwb3nmgIJ3unTuqK+7NZpd0DTvbmt5MIV5C?=
 =?us-ascii?Q?9MqWscJuysFDOhjfMjb8I2QEeL+FfcJwlk7+aRkNqhVU87IG1TaMXG5fHKld?=
 =?us-ascii?Q?L2BJjUz0sRagqsA6HbHUiBep22u0nAdaKgEUpGdVitr6743nCEh7Ad0MNyNy?=
 =?us-ascii?Q?4DyocYaBM8gwDrG8L4tws3FBQsrCgJ2Ze//sVjyEUAWyxL7UJyO18WFm2OiM?=
 =?us-ascii?Q?moz/5ksSSg5IqgDP+cpDthYWS2B7qQ021KW0WufddKJDLozk24VuID+4fIM/?=
 =?us-ascii?Q?/P8NAqc20vrz8QFjF0EWNLC32I6KcnN+ZRQtaqDSBdwW2V/R+Tat14xdIBes?=
 =?us-ascii?Q?otWCElz98bp32UWHiz1Yu6Eioo2lxNVdne1o/13pJJZ5DC0uQI8WGFLVy0is?=
 =?us-ascii?Q?IcjPOGZsUQImZwlVWc0IedktJ5rbQ98IKGW3ikiCuKl/oXo7CW1g3IjYng0J?=
 =?us-ascii?Q?YecL0bSBm4i0mGczCYKQ/lp1qhd6A+YfTr3U0i735aBtq/pyyOG7wCndymIY?=
 =?us-ascii?Q?CdWIkO4UaDoNKr5Um1o7Aam+gR66j6+GG0wo+SCk9KuwjPmfUHMITaymc3Yl?=
 =?us-ascii?Q?jEogHZCGahi8n2xhvIhQpYI+QFWBllbsatp/U/YasUQ3sUz2DR3GKvBGSZOU?=
 =?us-ascii?Q?Cd3mJWDpRbUd19OzrNntBGawIqWJQcyWHHMd7t9JXlntJUVy2uDhDn92pKx0?=
 =?us-ascii?Q?TaxnNte4D0zW+mdrS6M=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(7416014)(376014)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2025 09:22:27.9402
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 f713dbb5-9109-4c30-48c5-08de28165301
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	MWH0EPF000971E9.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB5926
X-MailFrom: niranjan.hy@ti.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: JN5KTNFBHHZVXNGMAIZHNY4234B4DG6V
X-Message-ID-Hash: JN5KTNFBHHZVXNGMAIZHNY4234B4DG6V
X-Mailman-Approved-At: Thu, 20 Nov 2025 16:51:13 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JN5KTNFBHHZVXNGMAIZHNY4234B4DG6V/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Currently device is using hardcoded slave properties
using the .read_prop callback from "struct sdw_slave_ops".
This patch removes this and uses the sdw_slave_read_prop API
to read the data directly from the ACPI table.

Signed-off-by: Niranjan H Y <niranjan.hy@ti.com>
---
 sound/soc/codecs/tas2783-sdw.c | 66 +++-------------------------------
 1 file changed, 5 insertions(+), 61 deletions(-)

diff --git a/sound/soc/codecs/tas2783-sdw.c b/sound/soc/codecs/tas2783-sdw.c
index 5be163664..c5f0c0f93 100644
--- a/sound/soc/codecs/tas2783-sdw.c
+++ b/sound/soc/codecs/tas2783-sdw.c
@@ -1059,66 +1059,6 @@ static s32 tas_init(struct tas2783_prv *tas_dev)
 	return ret;
 }
 
-static s32 tas_read_prop(struct sdw_slave *slave)
-{
-	struct sdw_slave_prop *prop = &slave->prop;
-	s32 nval;
-	s32 i, j;
-	u32 bit;
-	unsigned long addr;
-	struct sdw_dpn_prop *dpn;
-
-	prop->scp_int1_mask =
-		SDW_SCP_INT1_BUS_CLASH | SDW_SCP_INT1_PARITY;
-	prop->quirks = SDW_SLAVE_QUIRKS_INVALID_INITIAL_PARITY;
-
-	prop->paging_support = true;
-
-	/* first we need to allocate memory for set bits in port lists */
-	prop->source_ports = 0x04; /* BITMAP: 00000100 */
-	prop->sink_ports = 0x2; /* BITMAP:  00000010 */
-
-	nval = hweight32(prop->source_ports);
-	prop->src_dpn_prop = devm_kcalloc(&slave->dev, nval,
-					  sizeof(*prop->src_dpn_prop), GFP_KERNEL);
-	if (!prop->src_dpn_prop)
-		return -ENOMEM;
-
-	i = 0;
-	dpn = prop->src_dpn_prop;
-	addr = prop->source_ports;
-	for_each_set_bit(bit, &addr, 32) {
-		dpn[i].num = bit;
-		dpn[i].type = SDW_DPN_FULL;
-		dpn[i].simple_ch_prep_sm = false;
-		dpn[i].ch_prep_timeout = 10;
-		i++;
-	}
-
-	/* do this again for sink now */
-	nval = hweight32(prop->sink_ports);
-	prop->sink_dpn_prop = devm_kcalloc(&slave->dev, nval,
-					   sizeof(*prop->sink_dpn_prop), GFP_KERNEL);
-	if (!prop->sink_dpn_prop)
-		return -ENOMEM;
-
-	j = 0;
-	dpn = prop->sink_dpn_prop;
-	addr = prop->sink_ports;
-	for_each_set_bit(bit, &addr, 32) {
-		dpn[j].num = bit;
-		dpn[j].type = SDW_DPN_FULL;
-		dpn[j].simple_ch_prep_sm = false;
-		dpn[j].ch_prep_timeout = 10;
-		j++;
-	}
-
-	/* set the timeout values */
-	prop->clk_stop_timeout = 200;
-
-	return 0;
-}
-
 static s32 tas2783_sdca_dev_suspend(struct device *dev)
 {
 	struct tas2783_prv *tas_dev = dev_get_drvdata(dev);
@@ -1277,7 +1217,6 @@ static s32 tas_update_status(struct sdw_slave *slave,
 }
 
 static const struct sdw_slave_ops tas_sdw_ops = {
-	.read_prop	= tas_read_prop,
 	.update_status	= tas_update_status,
 };
 
@@ -1295,6 +1234,11 @@ static s32 tas_sdw_probe(struct sdw_slave *peripheral,
 	struct sdca_function_data *function_data = NULL;
 	int ret, i;
 
+	ret = sdw_slave_read_prop(peripheral);
+	if (ret)
+		return dev_err_probe(dev, ret,
+				     "slave property read failed");
+
 	tas_dev = devm_kzalloc(dev, sizeof(*tas_dev), GFP_KERNEL);
 	if (!tas_dev)
 		return dev_err_probe(dev, -ENOMEM,
-- 
2.25.1

