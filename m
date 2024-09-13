Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D8E16977BDB
	for <lists+alsa-devel@lfdr.de>; Fri, 13 Sep 2024 11:08:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8CE4CE72;
	Fri, 13 Sep 2024 11:08:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8CE4CE72
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1726218492;
	bh=akWy9Jc7+hF8GsuZFH9CGA48tSlEyDt4Hgfa1IFYXJc=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=VITqdiO4yylodtfY0U9w31oa8mLgSMGPAPZdOITAEYxfuCUHn6iFHsKBrnRFHP0dW
	 OMpwHmaLRjXBvvwB6QAyImChMT5geEcJrwkhW0DecAFU2f9sYoH8wX9BbFygkRh0oc
	 3MRNpMNJ+a5GUEio7+t5BKJljkWPj1FDgWAiq8Mk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EF02CF80604; Fri, 13 Sep 2024 11:07:23 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2CBC0F80603;
	Fri, 13 Sep 2024 11:07:23 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 85ACAF805C6; Fri, 13 Sep 2024 11:07:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20606.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2415::606])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 90AA4F805C6
	for <alsa-devel@alsa-project.org>; Fri, 13 Sep 2024 11:07:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 90AA4F805C6
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=XE7XSnef
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ir2ihDnq5F2PLbYeSLSzTwfWRKC+J6SoyFxAgmUJH9xYyDtFikpIB/42ZbspBXB+SNHbdM5zMGsS1dzfVVO9f4Z7980qQeSCvuN5awZYgcWjUjvvs/UZ9n365qPqHpAiT1zlfyCnT3WpHT+Uz9bpMuapogTbZH6v+oK9mtjXS2aM69MpXbFKPek8GlRpM9T8vxkfSpYMOOA33JHFJ7eVYuMFP5shdx7gZ2/1TrAcL4gA/FW7hUO8eHfIWsI5GAin4imI882QdQtRMMmbqYSWOJLs/qB48j9r4AZ8/IQHqxHeCS+PdzzZjDrpDiDDbEqT9WL1PDp5RqQKvf70n8LJPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=19q26TQkLNuoRQJYZM+DRc1DluH0Dy5Xu3w7aezap6U=;
 b=IHQUiZROGl6SR0+CvpTJyyaCqy+pl8/U66bPESFXx9fAGHDz63sfMH28EPBpBlNvmSRpQMAehzVPEOlQr7Y/bazxMvLcQtJmyqSdbJIHPsoeDqdyYlH/RcuvSWQWYbasY1k1HTox44PUiMl7a8pfDsOAmDjzVMMmJKKi8dmOEBcDiu6wrn/m/pTKaVkOsL4isJU5xE4IRTOkAbRDObcN2jUQlMa8PzLaTT9Ln57lHuBHh22PmmN+BXhCXFvitRaXl2cEVCgaKTQXeQIfW0VMrhkyWcSndNKhOxKEnHKbhCJIkDyA+bvhhROEVouiqY51sorO71S0AiE1owfxcPYCrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=19q26TQkLNuoRQJYZM+DRc1DluH0Dy5Xu3w7aezap6U=;
 b=XE7XSnefelBxcnu+1b20kR+aKDZg+0oupXq0FNuie1i8IQhY7bon2Y+CgHSe2Hg8uuUL18JWu26Zv7V4qWerb4yKGs8FQVhPSOTWJ2LW1AsXE4LCB4xB4gYEvlVWijd7I1DqPJK25bktUDvzbZMbyRpANGYJxtgt/5XGJs03/so=
Received: from PH8PR02CA0007.namprd02.prod.outlook.com (2603:10b6:510:2d0::18)
 by SJ0PR12MB6781.namprd12.prod.outlook.com (2603:10b6:a03:44b::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.24; Fri, 13 Sep
 2024 09:07:08 +0000
Received: from CY4PEPF0000EE35.namprd05.prod.outlook.com
 (2603:10b6:510:2d0:cafe::3d) by PH8PR02CA0007.outlook.office365.com
 (2603:10b6:510:2d0::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.23 via Frontend
 Transport; Fri, 13 Sep 2024 09:07:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EE35.mail.protection.outlook.com (10.167.242.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7918.13 via Frontend Transport; Fri, 13 Sep 2024 09:07:07 +0000
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 13 Sep 2024 04:06:57 -0500
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>
CC: <alsa-devel@alsa-project.org>, <pierre-louis.bossart@linux.intel.com>,
	<yung-chuan.liao@linux.intel.com>, <ranjani.sridharan@linux.intel.com>,
	<lgirdwood@gmail.com>, <perex@perex.cz>, <tiwai@suse.com>,
	<Basavaraj.Hiregoudar@amd.com>, <Sunil-kumar.Dommati@amd.com>,
	<venkataprasad.potturu@amd.com>, <kai.vehmanen@linux.intel.com>,
	<ckeepax@opensource.cirrus.com>, <linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Subject: [PATCH 2/5] ASoC: intel: sof_sdw: rename soundwire parsing helper
 functions
Date: Fri, 13 Sep 2024 14:36:28 +0530
Message-ID: <20240913090631.1834543-3-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE35:EE_|SJ0PR12MB6781:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c1cbc95-1138-4b17-7a2e-08dcd3d37179
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|7416014|376014|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?KGEIbOXqNHLupUyBUDju1r0mYuV0QOdG8VzkRH9eHlFVsblnWgCr/6hXzbdB?=
 =?us-ascii?Q?tG+jI/NQ0lGeI8oDuNM1gD26jnC/h5bYjk5zyKNK13BxWRYZZSCLj5iPO1no?=
 =?us-ascii?Q?aQGaDFiBx9QpJKL3AffCSgWGyXBh04qPgc3Ij0xUKCRhazPTOusOccRzhX5l?=
 =?us-ascii?Q?MLE5XVeO5NrGrK1IGyBEpny1eMyWBkK+QhSURgdcST/zOgutwEjxFFrSaa3d?=
 =?us-ascii?Q?6jeKUjEA1FQt3GP9ckIJM3pBOwDx3tTdd0eLY7rrz2lBfyz4+X9xnvUbFuL9?=
 =?us-ascii?Q?T1evK8/iN7ULUUthugrlyh2QLiRSC+JSsogW1DBv5Nl4F4GqnFrEbqOgkfAw?=
 =?us-ascii?Q?4ZMgA6OBRu+VX1Z0hNabwHEWvbmZEAg4lymQiQHEknASqtf/BdKLUeBcbqRx?=
 =?us-ascii?Q?eDn/S0Hux+iDQS2CRQ+BgoviHLZjFIL0rmZNYxshQGeU8eIwLpM7mcXdGEYS?=
 =?us-ascii?Q?Dv8DQjBJokxWxYNLWkS6IMo20ZhJ7uvLNVo3o8v+Ags+Rf68qDpHPm7vHTT8?=
 =?us-ascii?Q?RQ1ixN5j4xrE3OYewqG2eqDgMAodEVpyHfPg+jG88hguSLX2ozBhJtWsENVH?=
 =?us-ascii?Q?5QDWBzhaoTLTM0pU/Cew89sab+NnOY++4BseUzSR8nuZkx77ZtXvpzLBRsyQ?=
 =?us-ascii?Q?HU0fbR15Cj9Psgy6OzfGPLRBIgag5qrMasRWC2Yfh+cBkvf9aM0MQIScBiR0?=
 =?us-ascii?Q?2JKSvjJd4JecL7+Oorsh+65YAU36eM3siMW8xaefa3FnVmBASxape+eZkrnD?=
 =?us-ascii?Q?jGzSQUcO+jjCowISHfWUE4XQnaC5lY3zAuap9nAYjgJljt+ixZb274u4r/jP?=
 =?us-ascii?Q?Vr2KS5M2/kdOsfHA1l5vESsyrMPueIXyWtqJCv6szRT5kQWaPLd0bR1rC4gh?=
 =?us-ascii?Q?rN4Jrbqz5oB5H3Z7bEeS/Yvh/uRrB7yxLLVerLRedDOrbMqNX3aR9n71RtEX?=
 =?us-ascii?Q?XYZ9OVXB2RT5biMDlXbhiGqnx73OdAxgm8w2oZMSK4IR30VNajti2FShQ3p6?=
 =?us-ascii?Q?e3VJuUFibU5wLFVZ/qBDJ7bjojKHzX78kNpsJG+t5eWhsAQFgUd0SSbBJ0Bk?=
 =?us-ascii?Q?mfs0SICrsu8Nb+zS0BYXcvGID85xbIo17rRlkIXVC9dpfzShqxqQRtEIu/ak?=
 =?us-ascii?Q?mM4I1nsPZjmb1Wq7+RWKgbdExVvYzxmOAeQaYrvfrttkPPVG8glFrZJKQG/S?=
 =?us-ascii?Q?XCdTASkFXhirFqTCjXt0wMw/1gVRDa9UgSUZYCEmVW87It73Gfv4crpy2GXa?=
 =?us-ascii?Q?jY3MFvBd+OL2U0nn2UVHAX3FBQi2gjJzD6XTLmforjwKmSkNF/8FAKSpp3tw?=
 =?us-ascii?Q?vvUTio5H3BoqWPjsmgU6qRs2pOr75fDN0wtvbATfiWr2X50INlLL3xWZBONT?=
 =?us-ascii?Q?paI6BJ7f9dtd3J3B4x7PosIVyL9baDfMCn73ZWMFqOHhYPQS9ildi9LbdTF7?=
 =?us-ascii?Q?DJgzgXaDS3fQ07yvq2uF7JE99z/Jm5Z4?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(7416014)(376014)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2024 09:07:07.3239
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 0c1cbc95-1138-4b17-7a2e-08dcd3d37179
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CY4PEPF0000EE35.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6781
Message-ID-Hash: 777BPV2VBMJVFK7ZRKD5GFS466GM66Q5
X-Message-ID-Hash: 777BPV2VBMJVFK7ZRKD5GFS466GM66Q5
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/777BPV2VBMJVFK7ZRKD5GFS466GM66Q5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Rename SoundWire parsing helper functions with 'asoc_sdw' tag
to make it generic.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/intel/boards/sof_sdw.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index 6eeddced1f6f..222cf4a37707 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -640,7 +640,7 @@ struct asoc_sdw_dailink {
 
 static const char * const type_strings[] = {"SimpleJack", "SmartAmp", "SmartMic"};
 
-static int count_sdw_endpoints(struct snd_soc_card *card, int *num_devs, int *num_ends)
+static int asoc_sdw_count_sdw_endpoints(struct snd_soc_card *card, int *num_devs, int *num_ends)
 {
 	struct device *dev = card->dev;
 	struct snd_soc_acpi_mach *mach = dev_get_platdata(dev);
@@ -660,8 +660,8 @@ static int count_sdw_endpoints(struct snd_soc_card *card, int *num_devs, int *nu
 	return 0;
 }
 
-static struct asoc_sdw_dailink *find_dailink(struct asoc_sdw_dailink *dailinks,
-					     const struct snd_soc_acpi_endpoint *new)
+static struct asoc_sdw_dailink *asoc_sdw_find_dailink(struct asoc_sdw_dailink *dailinks,
+						      const struct snd_soc_acpi_endpoint *new)
 {
 	while (dailinks->initialised) {
 		if (new->aggregated && dailinks->group_id == new->group_id)
@@ -677,10 +677,10 @@ static struct asoc_sdw_dailink *find_dailink(struct asoc_sdw_dailink *dailinks,
 	return dailinks;
 }
 
-static int parse_sdw_endpoints(struct snd_soc_card *card,
-			       struct asoc_sdw_dailink *sof_dais,
-			       struct asoc_sdw_endpoint *sof_ends,
-			       int *num_devs)
+static int asoc_sdw_parse_sdw_endpoints(struct snd_soc_card *card,
+					struct asoc_sdw_dailink *sof_dais,
+					struct asoc_sdw_endpoint *sof_ends,
+					int *num_devs)
 {
 	struct device *dev = card->dev;
 	struct asoc_sdw_mc_private *ctx = snd_soc_card_get_drvdata(card);
@@ -743,7 +743,7 @@ static int parse_sdw_endpoints(struct snd_soc_card *card,
 
 				adr_end = &adr_dev->endpoints[j];
 				dai_info = &codec_info->dais[adr_end->num];
-				sof_dai = find_dailink(sof_dais, adr_end);
+				sof_dai = asoc_sdw_find_dailink(sof_dais, adr_end);
 
 				if (dai_info->quirk && !(dai_info->quirk & sof_sdw_quirk))
 					continue;
@@ -1115,7 +1115,7 @@ static int sof_card_dai_links_create(struct snd_soc_card *card)
 	unsigned long ssp_mask;
 	int ret;
 
-	ret = count_sdw_endpoints(card, &num_devs, &num_ends);
+	ret = asoc_sdw_count_sdw_endpoints(card, &num_devs, &num_ends);
 	if (ret < 0) {
 		dev_err(dev, "failed to count devices/endpoints: %d\n", ret);
 		return ret;
@@ -1133,7 +1133,7 @@ static int sof_card_dai_links_create(struct snd_soc_card *card)
 		goto err_dai;
 	}
 
-	ret = parse_sdw_endpoints(card, sof_dais, sof_ends, &num_devs);
+	ret = asoc_sdw_parse_sdw_endpoints(card, sof_dais, sof_ends, &num_devs);
 	if (ret < 0)
 		goto err_end;
 
-- 
2.34.1

