Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F3C6F977BDE
	for <lists+alsa-devel@lfdr.de>; Fri, 13 Sep 2024 11:08:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 66539A4D;
	Fri, 13 Sep 2024 11:08:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 66539A4D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1726218511;
	bh=2Lc4GiLB8K1mdzeTgxlYGhsrGSETeSJTaQUqJMgN+WE=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=e1IS6NRgxmi1g9mof5c9GTi5752CHwkfT0zElIlOwV6Ndmg0+bsgHcE6EDl4eyGfn
	 CsKCnoZH5x16TfNGEBjsSIRape5r7JZ27g7FKIinkGS/uBpQuVdluHgqbgzspgezrY
	 G2J530kQQGm2EHw5NUpjJdd+bvxmqx4yXscRjL2Q=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3DFF3F80621; Fri, 13 Sep 2024 11:07:28 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DFB66F80611;
	Fri, 13 Sep 2024 11:07:27 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DC777F805F0; Fri, 13 Sep 2024 11:07:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2061f.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2417::61f])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C6354F805C6
	for <alsa-devel@alsa-project.org>; Fri, 13 Sep 2024 11:07:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C6354F805C6
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=LH+x8Ulr
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AOuEJ5Yxw9AEgZwoL8EQ/2ZIQoervGaaT0jqoGqiwKCg8UqXf6L7D1BoYdMgP8LVOEcYwiuNADJDQPcwhckvr/nCjORTdZKTP0ZVCcYfeqHkZ5PidG0h/Xjws85NYd+MW+zsOQ0NdL3ZNClqMr57WawZqdJsNW9Zpz1SBAXRMp6bs/sGTaT2yXE953q0aDJ/SPnRje8HwcuSSYxzLKmI4Rl1ZcsKceT9cV3BxJfTsvLVBYXDhQy8y8H1Li8kcTpjJ+63ic2HdSQa8R0o5eQqP0YMF9Hxw7T/RoX1X9AYgfvPjkqvhNY3eXG4AmPFi1Y0ZAnSa7BgLQjG0sn+gj9+1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2TGVG1rAtIOo6XDRP4na37RieCa1dYr9ZKoZRy2HGPk=;
 b=wcKmobwM0OZpYXwIheCZBIuxoslmJNleWr/pNjoKYYQwjndp2gtY3kIeXBOn8n3vZ+zZtPRiwYIZ2Zy2Zg4mZHtWpeme4SdgPoref6NnrtyirM27T7lQLWCvYuCFCJlebzkMvfKzvmUibFr57WB8Z78WKh3oHGfGmLsFX4BEqfvgUScUnDSFxm2q081pf9qd9vE6i9M/MexUp8MEdwHm2AfrvevkxxZu0E80U8IaLQ9KKMHlKyShvb+TWjLFaHF5eO7RRkC9851in4WCXzMTuXV9tWWQ9u+B7sz9R5frExlbZjadizcpPAeQUTub783erRBFYmYaKe9w3cPo/73N1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2TGVG1rAtIOo6XDRP4na37RieCa1dYr9ZKoZRy2HGPk=;
 b=LH+x8Ulr7yroSbLJgiOuA39uUkUbfOCiwNA4JACRpfk9bqb19b/y51jPpfaSL5kVVGLf6mlgGxBqZsdnrfNkPwzr3aVPH5Am2pzIiNoS9xCZ/k1h7e9wl19vhI+Vzu4QBziJXs5foTkNQ4r9MgcOe7QACgga0wpTp1hkWOPmJxw=
Received: from PH8PR02CA0014.namprd02.prod.outlook.com (2603:10b6:510:2d0::6)
 by SJ2PR12MB7944.namprd12.prod.outlook.com (2603:10b6:a03:4c5::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.24; Fri, 13 Sep
 2024 09:07:11 +0000
Received: from CY4PEPF0000EE35.namprd05.prod.outlook.com
 (2603:10b6:510:2d0:cafe::dc) by PH8PR02CA0014.outlook.office365.com
 (2603:10b6:510:2d0::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.23 via Frontend
 Transport; Fri, 13 Sep 2024 09:07:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EE35.mail.protection.outlook.com (10.167.242.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7918.13 via Frontend Transport; Fri, 13 Sep 2024 09:07:11 +0000
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 13 Sep 2024 04:07:02 -0500
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>
CC: <alsa-devel@alsa-project.org>, <pierre-louis.bossart@linux.intel.com>,
	<yung-chuan.liao@linux.intel.com>, <ranjani.sridharan@linux.intel.com>,
	<lgirdwood@gmail.com>, <perex@perex.cz>, <tiwai@suse.com>,
	<Basavaraj.Hiregoudar@amd.com>, <Sunil-kumar.Dommati@amd.com>,
	<venkataprasad.potturu@amd.com>, <kai.vehmanen@linux.intel.com>,
	<ckeepax@opensource.cirrus.com>, <linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Subject: [PATCH 3/5] ASoC: sdw_util/intel: move soundwire endpoint and dai
 link structures
Date: Fri, 13 Sep 2024 14:36:29 +0530
Message-ID: <20240913090631.1834543-4-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240913090631.1834543-1-Vijendar.Mukunda@amd.com>
References: <20240913090631.1834543-1-Vijendar.Mukunda@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE35:EE_|SJ2PR12MB7944:EE_
X-MS-Office365-Filtering-Correlation-Id: 8671b957-db5d-4a71-d2dc-08dcd3d373fa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|7416014|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?IoNyGWLD/SvzZY+WTV+aQi3G2GBkqkSY8ifbGmOP/1D3ZtzQjqAlpILs52AL?=
 =?us-ascii?Q?/Acnh1QIT7WI25QGMzMbeI5ngjqgLEhwbTsaHNIOGW1JcTCo29cGaMxCaZQl?=
 =?us-ascii?Q?o4U6BEsk9iTSg+QBy9yiaqHeFmsFUK09pGS3zhz37QakSt5qBk9/2aDzS8+Y?=
 =?us-ascii?Q?Hh0xDAtF2TTNBvhMI4oWfAbMswVJAb5sHgrQZXa4n6GpIMAOSxwwqOlbK0OA?=
 =?us-ascii?Q?HZEsyPqwdFCG/aSxtTu94Lu2gSoM+lEPUEizL3fzi7MWH/5Y3chp0gaRSmPf?=
 =?us-ascii?Q?C4KOiHB5LPvY+Zn12UwMp6VIJ0NP0n4xkbueXizxzWbIiq1Lp58J7lYCTmPd?=
 =?us-ascii?Q?iPeYTAGNNlfdWxsx0qccMtcDylPxVLiVbcLekLE29n6zr/WFh9z1JOBbiEc6?=
 =?us-ascii?Q?6sECagDEVBM87yaqifoGUTryJoMqonE+AO3TxP2r2YoNDwgoMOQkeV3UHKH0?=
 =?us-ascii?Q?1EpSciGZmPstinbojrAMYtN0HU/T5aNve7brSDNl+pcY6iuUuZByrhPssY1g?=
 =?us-ascii?Q?EQKTrjm7D47+gZCLeZ1gWfdfUHinSfU8PRCZWCCLPQyfHkIDUooTX6kF90s/?=
 =?us-ascii?Q?xR9S/pBYl4KjS0ZTJGi0wH887mybesxGEnmaJWS1LLoLrihix9KlfFjDHN5L?=
 =?us-ascii?Q?0xZulyDc+QHZvdNxkSUT8TfDx3jFdeowDaElfxmvogiXSYsgLuwktZQoT1T4?=
 =?us-ascii?Q?j0jDLwYC0jvJMCkanFdpiBCWVsyg/6SxL39CGYClZi3AImnDZbFyueYG3Rxr?=
 =?us-ascii?Q?EGqYkfc11DWQ9SC82tV4dCD1YDGsuGRhVp3LpatbM88hFFHZ7RjHwRrDJ4aa?=
 =?us-ascii?Q?HDpN5QJ63gxT/szEiNq25VpuIwGEc3++wPGc7QfTR02AcOsiLRwCJc7LuxGp?=
 =?us-ascii?Q?dG/Tn11BSwyXu+5DOzDTzHsB1GaVazFb8s5uS7RxI7ozVve/LW9RzjdmkoSG?=
 =?us-ascii?Q?ulTgfC7VMBbh6GXAQQAE7obZfc+QPSJ66gFJ0ptDpqEot0m8t5E144POHoTB?=
 =?us-ascii?Q?h8PECd+EmUgol4xZKnubXQtkoOTMS9kGHbqn41GoVZNs9XQAL3bnyRC8QfGR?=
 =?us-ascii?Q?ws8zXs7J9RVgGTqt6JGFzD4LdklBN21U/Uh6MY4gF1bx3G0XDz93BBKsOoQB?=
 =?us-ascii?Q?DJyAtahXizfQqL2vH8GNA90llwzIgOH5RV3ZqwmZQ4sy1YqexhS9uLdMUeGi?=
 =?us-ascii?Q?lR509kGAd4BttyW5O5TQ7YvCshCd7FkmbPBMJpFAZvlQlYf78Q6ti/kknGTS?=
 =?us-ascii?Q?5FajKorWmEMi3f6frUFHQsKfdeig+YAYW63hknReamiNTftdlghWS3/KEqCT?=
 =?us-ascii?Q?TJN/BhWrjdlJP5Wpcvvt0Af2e2kSymyZGSKgN2MTc9kiUt2xy8U4N/rLV+dH?=
 =?us-ascii?Q?sAG2AveRuN9wqgz97prr1qkpAC4pzMplWKg1I9lVvfGnDmstHr31pZiVeORu?=
 =?us-ascii?Q?+c1/0I08rIYxpQ6t2+o3jkt49HNstRPs?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2024 09:07:11.5270
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 8671b957-db5d-4a71-d2dc-08dcd3d373fa
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CY4PEPF0000EE35.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB7944
Message-ID-Hash: 3TG3NT47IXETZWE276EWDDOTE4VEMCMJ
X-Message-ID-Hash: 3TG3NT47IXETZWE276EWDDOTE4VEMCMJ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3TG3NT47IXETZWE276EWDDOTE4VEMCMJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Move Soundwire endpoint and dai link structures from Intel generic machine
driver code to common place holder(soc_sdw_utils.h). These structures will
be used in other platform SoundWire machine driver code.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 include/sound/soc_sdw_utils.h    | 21 +++++++++++++++++++++
 sound/soc/intel/boards/sof_sdw.c | 21 ---------------------
 2 files changed, 21 insertions(+), 21 deletions(-)

diff --git a/include/sound/soc_sdw_utils.h b/include/sound/soc_sdw_utils.h
index e366b7968c2d..e3482720a3eb 100644
--- a/include/sound/soc_sdw_utils.h
+++ b/include/sound/soc_sdw_utils.h
@@ -93,6 +93,27 @@ struct asoc_sdw_mc_private {
 	int codec_info_list_count;
 };
 
+struct asoc_sdw_endpoint {
+	struct list_head list;
+
+	u32 link_mask;
+	const char *codec_name;
+	const char *name_prefix;
+	bool include_sidecar;
+
+	struct asoc_sdw_codec_info *codec_info;
+	const struct asoc_sdw_dai_info *dai_info;
+};
+
+struct asoc_sdw_dailink {
+	bool initialised;
+
+	u8 group_id;
+	u32 link_mask[SNDRV_PCM_STREAM_LAST + 1];
+	int num_devs[SNDRV_PCM_STREAM_LAST + 1];
+	struct list_head endpoints;
+};
+
 extern struct asoc_sdw_codec_info codec_info_list[];
 int asoc_sdw_get_codec_info_list_count(void);
 
diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index 222cf4a37707..6b30659f0e25 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -617,27 +617,6 @@ static const struct snd_soc_ops sdw_ops = {
 	.shutdown = asoc_sdw_shutdown,
 };
 
-struct asoc_sdw_endpoint {
-	struct list_head list;
-
-	u32 link_mask;
-	const char *codec_name;
-	const char *name_prefix;
-	bool include_sidecar;
-
-	struct asoc_sdw_codec_info *codec_info;
-	const struct asoc_sdw_dai_info *dai_info;
-};
-
-struct asoc_sdw_dailink {
-	bool initialised;
-
-	u8 group_id;
-	u32 link_mask[SNDRV_PCM_STREAM_LAST + 1];
-	int num_devs[SNDRV_PCM_STREAM_LAST + 1];
-	struct list_head endpoints;
-};
-
 static const char * const type_strings[] = {"SimpleJack", "SmartAmp", "SmartMic"};
 
 static int asoc_sdw_count_sdw_endpoints(struct snd_soc_card *card, int *num_devs, int *num_ends)
-- 
2.34.1

