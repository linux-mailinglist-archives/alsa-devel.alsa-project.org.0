Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FDFE977BE0
	for <lists+alsa-devel@lfdr.de>; Fri, 13 Sep 2024 11:08:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0AC67A4A;
	Fri, 13 Sep 2024 11:08:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0AC67A4A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1726218533;
	bh=Di1bxmwysb9WFJAKyqXgluM5cz8Fev/gtt65EeoHnt8=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Qjh3jljFukYFivkEar5y/JTqW3G/W5eh+Z92KQRNHs+2a6IEDeDsAThD0aaro86XJ
	 HQBREdxX01xB4Kq0326tDlzYJbQrMT6mkrz5/5difyHWDlB3oxLlfTCx5l+JjsMYwS
	 GO3DzOQq0dqAKa0rFS12l0TM3g0NYZ5cbzmBtmQI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id ACD4AF80654; Fri, 13 Sep 2024 11:07:36 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BABCAF8063A;
	Fri, 13 Sep 2024 11:07:35 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0B522F80518; Fri, 13 Sep 2024 11:07:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on20624.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2407::624])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 50251F805F7
	for <alsa-devel@alsa-project.org>; Fri, 13 Sep 2024 11:07:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 50251F805F7
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=oy7lqV36
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GSWdKxCDbLbACAoSSdSXDzYrbdyp/qIpk9WagLM/V3mZdLXTcfGc/yf3bGcO1lxnyQpisAGFmxbfHbIMODlJOPQcJrx8xb/ejNiNGmauvcN5OUgsclRVpM12DPUn67UnzebzIZ4oVUllfn8DB5/UpEiqh7gZfngD1cZFv0g3u+K12Gu8gAMZ8nUKo0wxyv1STGJKD+Zbq9J/dyVRMNm4PinVldjGb4g4uFVD3kR/eTcIvrH0FV/ECQ0lNY3WbRus/2gyzn2yHAE7Tl16ijsgcZtFb14Td6y24MWGPkzMjJ8wTIWtNSYNYBmldRx+pk0TLlpd/KW0JF9S6MFLQDMp7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eM3RbXQpsn0B5ikrQSLkhLs6a25j5zbxsfe8PhyKsac=;
 b=IdaGthl58915j8ZNgUoglOl2zoM6PTUaKwcYp/K8uC8i4o/Xpttv1aP3+G++d5eEsLpNqrwPaEQCTobHnw4xxxf7nJ0Tw6wU6oHFabtIuFECGWHdmMQ1FfTVHhrc/qMoCfsqvql3YoNQBvkrBMeGWuA5kjXoo8tj0BtTMgyXYfHY70WqMsB5plsB8I8jAT5zhbx6sARDE5kE71+575+Fv91Ogk84rOQVbFvolgNMnWbWsiw76ErOKxHoSMytXr58xwon1aEvGYt1HqBdYYiyTAI5KGGl4zpZY6XJFAu4pwB38PzC+dwQ4IFynnwMUn54fvsiOKOrVRyAR6uT5P/inw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eM3RbXQpsn0B5ikrQSLkhLs6a25j5zbxsfe8PhyKsac=;
 b=oy7lqV36luqevGfU1P/RPRSv2srZrpM+S0pghr5lvalUIC0zm2IwqTUatF9mYqEo7TjxbZaC8u7bo+UEpWLUeY9cAqV2jluPcZZbwrJTHdxD46kyVXTMydb6I8m24hCMIcBibMwkDaja/PIm1MwYvPkfAv/toJ0LpmwaMvTyEdw=
Received: from PH7P222CA0010.NAMP222.PROD.OUTLOOK.COM (2603:10b6:510:33a::9)
 by MW6PR12MB8897.namprd12.prod.outlook.com (2603:10b6:303:24a::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.24; Fri, 13 Sep
 2024 09:07:16 +0000
Received: from CY4PEPF0000EE34.namprd05.prod.outlook.com
 (2603:10b6:510:33a:cafe::a9) by PH7P222CA0010.outlook.office365.com
 (2603:10b6:510:33a::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.27 via Frontend
 Transport; Fri, 13 Sep 2024 09:07:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EE34.mail.protection.outlook.com (10.167.242.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7918.13 via Frontend Transport; Fri, 13 Sep 2024 09:07:15 +0000
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 13 Sep 2024 04:07:06 -0500
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>
CC: <alsa-devel@alsa-project.org>, <pierre-louis.bossart@linux.intel.com>,
	<yung-chuan.liao@linux.intel.com>, <ranjani.sridharan@linux.intel.com>,
	<lgirdwood@gmail.com>, <perex@perex.cz>, <tiwai@suse.com>,
	<Basavaraj.Hiregoudar@amd.com>, <Sunil-kumar.Dommati@amd.com>,
	<venkataprasad.potturu@amd.com>, <kai.vehmanen@linux.intel.com>,
	<ckeepax@opensource.cirrus.com>, <linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Subject: [PATCH 4/5] ASoC: sdw_utils/intel: move soundwire endpoint parsing
 helper functions
Date: Fri, 13 Sep 2024 14:36:30 +0530
Message-ID: <20240913090631.1834543-5-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE34:EE_|MW6PR12MB8897:EE_
X-MS-Office365-Filtering-Correlation-Id: 2718fa33-3033-44b7-8308-08dcd3d37692
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|82310400026|7416014|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?F5hKH6ntRz+ishMrbKrrd2EwOROi8qmSbkUX4cFWBk4OkzcyK9eX5ejv93fQ?=
 =?us-ascii?Q?cTypnSx4zVQwPiERTBUUQJQs1x25U0UD3G+DUofJNWT2yfVj/etGssi/NQGk?=
 =?us-ascii?Q?93Lw2q+KRDXXxavrjp1p9i33fVhmRm79aWdEKv8XFmFL9WgNk2BA2m5QSehw?=
 =?us-ascii?Q?/Dv/A6V+cozePUdzoI9GpaitICTChAcYUVQLiDBW5FVpfq4ra9zFbiZkfSiK?=
 =?us-ascii?Q?+6tUqON1UdkG+wkjkVIiXpPR5KQJY2MtiQ6uNm6IL/Qzp+TTwjJRY3doKNbp?=
 =?us-ascii?Q?NsqvxLidwP74/IIHfJ4jEZwFiCXupRFQ6Cd0LeLWYTEPqm81vNjrqUEVzzgv?=
 =?us-ascii?Q?24s+TvK+XA20DWgXNkU/QZYP0AXS1Yxp77/cCtyBjBYLvdekL7oj6x+tQ5bT?=
 =?us-ascii?Q?XbQXZH1kBT0x9qtH3UmeMWW7OQixVIyK+v9RftVIDycnqqpHjGotjnURzcDo?=
 =?us-ascii?Q?3sXgbB1wQ5+fEvE06lUhZInWeNONseV7PS+mBDlAnKPOjKZu7Ab80jxhVG2a?=
 =?us-ascii?Q?fmQlSxo3HPLF0MzYDRL+ZoQ6z4SCLMN2x9zar+iw0LCd2leeonBNwQqAeAvZ?=
 =?us-ascii?Q?tqBufKuqN99Xjk+UNX+IXse7Mx5Qy/5GrShNLMD+lJFdruPO5LUNNi3VwKKM?=
 =?us-ascii?Q?kFYxN3Q742JcYfGwDKW9AM0iAW2pREuDA7n1W1th30b//6LEbnYiuPEGRVE+?=
 =?us-ascii?Q?RH5brJUVGjt6+oPGhAlAaDWd5Wtu0AgB7ZuXLmaUcRqo5RgBEEvosRySFwzH?=
 =?us-ascii?Q?Hhu1HBi+O+9BiPzhMA/OKAn1ChyQ4tSeMra4/ZJuwNOmrSSUMR+8ON5TM94f?=
 =?us-ascii?Q?wGeWW27CxrOeq5rqQad5euUdFEjVnx3yclzIdQy801MuZMZaghuOr7yolWEj?=
 =?us-ascii?Q?gWAkBj+ymsKe5+nYZLMkBLC0+4hgcvBh2JY4Z7oVrLcMfU9NJNYBdxDwq28N?=
 =?us-ascii?Q?LQv0pYHt1pX48fykkT2gaNDkBf2O7fFPDCDaIOjvAyO2z+7BH2UeDl3wtsxo?=
 =?us-ascii?Q?4SfvOpjd8yMmKX5mPQvjsnVEJQZNZCje6Y4oDWpOUCu1xX3ZCY+gP6P/UGXp?=
 =?us-ascii?Q?ohIr2YTUM71BdriJgQL7JRpHaJ0tcNSep/oMy7v+Xqf8oeNPYTvGxN+8LTlI?=
 =?us-ascii?Q?ncTAJISHVtD3Z4Jhi9xhOohorJ91Th3DfGqDov8TeUvtY1oMFX2L99efsMsT?=
 =?us-ascii?Q?yaxuCcTn9DwxicsQ7QE2ZZfq6JfktNs9JFVY0BZF/1ws6tDL7DA8P40AqS2D?=
 =?us-ascii?Q?99f8LW4UJXhf0KUHPPH4hkQTUnWAiBAelL0xysRot/SuUrKRh+98d76y1Xav?=
 =?us-ascii?Q?wDKJ1qYriO5bEgW6i7dhZ8qLo+P9JMd5C9zhki+iZNqruGKrcOP406LfEfsc?=
 =?us-ascii?Q?HT5R/0h0u0ZsP220QnjYGsFEd7FLctJjYhORxC8tZpFywy5VCZ6pCdTa7xLa?=
 =?us-ascii?Q?lyRu7rqI57eejJR7JljgjvijD0GMMlYY?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(7416014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2024 09:07:15.8766
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 2718fa33-3033-44b7-8308-08dcd3d37692
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CY4PEPF0000EE34.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8897
Message-ID-Hash: L2FMXX5QKOGEN4VZJNXISTLXHXO5PFLQ
X-Message-ID-Hash: L2FMXX5QKOGEN4VZJNXISTLXHXO5PFLQ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/L2FMXX5QKOGEN4VZJNXISTLXHXO5PFLQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Move SoundWire endpoint parsing helper functions to common place holder.
These functions will be used by other platform machine driver code.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 include/sound/soc_sdw_utils.h       |  10 ++
 sound/soc/intel/boards/sof_sdw.c    | 158 ---------------------------
 sound/soc/sdw_utils/soc_sdw_utils.c | 161 ++++++++++++++++++++++++++++
 3 files changed, 171 insertions(+), 158 deletions(-)

diff --git a/include/sound/soc_sdw_utils.h b/include/sound/soc_sdw_utils.h
index e3482720a3eb..f68c1f193b3b 100644
--- a/include/sound/soc_sdw_utils.h
+++ b/include/sound/soc_sdw_utils.h
@@ -161,6 +161,16 @@ int asoc_sdw_init_simple_dai_link(struct device *dev, struct snd_soc_dai_link *d
 				  int (*init)(struct snd_soc_pcm_runtime *rtd),
 				  const struct snd_soc_ops *ops);
 
+int asoc_sdw_count_sdw_endpoints(struct snd_soc_card *card, int *num_devs, int *num_ends);
+
+struct asoc_sdw_dailink *asoc_sdw_find_dailink(struct asoc_sdw_dailink *dailinks,
+					       const struct snd_soc_acpi_endpoint *new);
+
+int asoc_sdw_parse_sdw_endpoints(struct snd_soc_card *card,
+				 struct asoc_sdw_dailink *soc_dais,
+				 struct asoc_sdw_endpoint *soc_ends,
+				 int *num_devs);
+
 int asoc_sdw_rtd_init(struct snd_soc_pcm_runtime *rtd);
 
 /* DMIC support */
diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index 6b30659f0e25..5196d96f5c0e 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -619,164 +619,6 @@ static const struct snd_soc_ops sdw_ops = {
 
 static const char * const type_strings[] = {"SimpleJack", "SmartAmp", "SmartMic"};
 
-static int asoc_sdw_count_sdw_endpoints(struct snd_soc_card *card, int *num_devs, int *num_ends)
-{
-	struct device *dev = card->dev;
-	struct snd_soc_acpi_mach *mach = dev_get_platdata(dev);
-	struct snd_soc_acpi_mach_params *mach_params = &mach->mach_params;
-	const struct snd_soc_acpi_link_adr *adr_link;
-	int i;
-
-	for (adr_link = mach_params->links; adr_link->num_adr; adr_link++) {
-		*num_devs += adr_link->num_adr;
-
-		for (i = 0; i < adr_link->num_adr; i++)
-			*num_ends += adr_link->adr_d[i].num_endpoints;
-	}
-
-	dev_dbg(dev, "Found %d devices with %d endpoints\n", *num_devs, *num_ends);
-
-	return 0;
-}
-
-static struct asoc_sdw_dailink *asoc_sdw_find_dailink(struct asoc_sdw_dailink *dailinks,
-						      const struct snd_soc_acpi_endpoint *new)
-{
-	while (dailinks->initialised) {
-		if (new->aggregated && dailinks->group_id == new->group_id)
-			return dailinks;
-
-		dailinks++;
-	}
-
-	INIT_LIST_HEAD(&dailinks->endpoints);
-	dailinks->group_id = new->group_id;
-	dailinks->initialised = true;
-
-	return dailinks;
-}
-
-static int asoc_sdw_parse_sdw_endpoints(struct snd_soc_card *card,
-					struct asoc_sdw_dailink *sof_dais,
-					struct asoc_sdw_endpoint *sof_ends,
-					int *num_devs)
-{
-	struct device *dev = card->dev;
-	struct asoc_sdw_mc_private *ctx = snd_soc_card_get_drvdata(card);
-	struct snd_soc_acpi_mach *mach = dev_get_platdata(dev);
-	struct snd_soc_acpi_mach_params *mach_params = &mach->mach_params;
-	const struct snd_soc_acpi_link_adr *adr_link;
-	struct asoc_sdw_endpoint *sof_end = sof_ends;
-	int num_dais = 0;
-	int i, j;
-	int ret;
-
-	for (adr_link = mach_params->links; adr_link->num_adr; adr_link++) {
-		int num_link_dailinks = 0;
-
-		if (!is_power_of_2(adr_link->mask)) {
-			dev_err(dev, "link with multiple mask bits: 0x%x\n",
-				adr_link->mask);
-			return -EINVAL;
-		}
-
-		for (i = 0; i < adr_link->num_adr; i++) {
-			const struct snd_soc_acpi_adr_device *adr_dev = &adr_link->adr_d[i];
-			struct asoc_sdw_codec_info *codec_info;
-			const char *codec_name;
-
-			if (!adr_dev->name_prefix) {
-				dev_err(dev, "codec 0x%llx does not have a name prefix\n",
-					adr_dev->adr);
-				return -EINVAL;
-			}
-
-			codec_info = asoc_sdw_find_codec_info_part(adr_dev->adr);
-			if (!codec_info)
-				return -EINVAL;
-
-			ctx->ignore_internal_dmic |= codec_info->ignore_internal_dmic;
-
-			codec_name = asoc_sdw_get_codec_name(dev, codec_info, adr_link, i);
-			if (!codec_name)
-				return -ENOMEM;
-
-			dev_dbg(dev, "Adding prefix %s for %s\n",
-				adr_dev->name_prefix, codec_name);
-
-			sof_end->name_prefix = adr_dev->name_prefix;
-
-			if (codec_info->count_sidecar && codec_info->add_sidecar) {
-				ret = codec_info->count_sidecar(card, &num_dais, num_devs);
-				if (ret)
-					return ret;
-
-				sof_end->include_sidecar = true;
-			}
-
-			for (j = 0; j < adr_dev->num_endpoints; j++) {
-				const struct snd_soc_acpi_endpoint *adr_end;
-				const struct asoc_sdw_dai_info *dai_info;
-				struct asoc_sdw_dailink *sof_dai;
-				int stream;
-
-				adr_end = &adr_dev->endpoints[j];
-				dai_info = &codec_info->dais[adr_end->num];
-				sof_dai = asoc_sdw_find_dailink(sof_dais, adr_end);
-
-				if (dai_info->quirk && !(dai_info->quirk & sof_sdw_quirk))
-					continue;
-
-				dev_dbg(dev,
-					"Add dev: %d, 0x%llx end: %d, %s, %c/%c to %s: %d\n",
-					ffs(adr_link->mask) - 1, adr_dev->adr,
-					adr_end->num, type_strings[dai_info->dai_type],
-					dai_info->direction[SNDRV_PCM_STREAM_PLAYBACK] ? 'P' : '-',
-					dai_info->direction[SNDRV_PCM_STREAM_CAPTURE] ? 'C' : '-',
-					adr_end->aggregated ? "group" : "solo",
-					adr_end->group_id);
-
-				if (adr_end->num >= codec_info->dai_num) {
-					dev_err(dev,
-						"%d is too many endpoints for codec: 0x%x\n",
-						adr_end->num, codec_info->part_id);
-					return -EINVAL;
-				}
-
-				for_each_pcm_streams(stream) {
-					if (dai_info->direction[stream] &&
-					    dai_info->dailink[stream] < 0) {
-						dev_err(dev,
-							"Invalid dailink id %d for codec: 0x%x\n",
-							dai_info->dailink[stream],
-							codec_info->part_id);
-						return -EINVAL;
-					}
-
-					if (dai_info->direction[stream]) {
-						num_dais += !sof_dai->num_devs[stream];
-						sof_dai->num_devs[stream]++;
-						sof_dai->link_mask[stream] |= adr_link->mask;
-					}
-				}
-
-				num_link_dailinks += !!list_empty(&sof_dai->endpoints);
-				list_add_tail(&sof_end->list, &sof_dai->endpoints);
-
-				sof_end->link_mask = adr_link->mask;
-				sof_end->codec_name = codec_name;
-				sof_end->codec_info = codec_info;
-				sof_end->dai_info = dai_info;
-				sof_end++;
-			}
-		}
-
-		ctx->append_dai_type |= (num_link_dailinks > 1);
-	}
-
-	return num_dais;
-}
-
 static int create_sdw_dailink(struct snd_soc_card *card,
 			      struct asoc_sdw_dailink *sof_dai,
 			      struct snd_soc_dai_link **dai_links,
diff --git a/sound/soc/sdw_utils/soc_sdw_utils.c b/sound/soc/sdw_utils/soc_sdw_utils.c
index d59ccb56642c..a6070f822eb9 100644
--- a/sound/soc/sdw_utils/soc_sdw_utils.c
+++ b/sound/soc/sdw_utils/soc_sdw_utils.c
@@ -1005,5 +1005,166 @@ int asoc_sdw_init_simple_dai_link(struct device *dev, struct snd_soc_dai_link *d
 }
 EXPORT_SYMBOL_NS(asoc_sdw_init_simple_dai_link, SND_SOC_SDW_UTILS);
 
+int asoc_sdw_count_sdw_endpoints(struct snd_soc_card *card, int *num_devs, int *num_ends)
+{
+	struct device *dev = card->dev;
+	struct snd_soc_acpi_mach *mach = dev_get_platdata(dev);
+	struct snd_soc_acpi_mach_params *mach_params = &mach->mach_params;
+	const struct snd_soc_acpi_link_adr *adr_link;
+	int i;
+
+	for (adr_link = mach_params->links; adr_link->num_adr; adr_link++) {
+		*num_devs += adr_link->num_adr;
+
+		for (i = 0; i < adr_link->num_adr; i++)
+			*num_ends += adr_link->adr_d[i].num_endpoints;
+	}
+
+	dev_dbg(dev, "Found %d devices with %d endpoints\n", *num_devs, *num_ends);
+
+	return 0;
+}
+EXPORT_SYMBOL_NS(asoc_sdw_count_sdw_endpoints, SND_SOC_SDW_UTILS);
+
+struct asoc_sdw_dailink *asoc_sdw_find_dailink(struct asoc_sdw_dailink *dailinks,
+					       const struct snd_soc_acpi_endpoint *new)
+{
+	while (dailinks->initialised) {
+		if (new->aggregated && dailinks->group_id == new->group_id)
+			return dailinks;
+
+		dailinks++;
+	}
+
+	INIT_LIST_HEAD(&dailinks->endpoints);
+	dailinks->group_id = new->group_id;
+	dailinks->initialised = true;
+
+	return dailinks;
+}
+EXPORT_SYMBOL_NS(asoc_sdw_find_dailink, SND_SOC_SDW_UTILS);
+
+int asoc_sdw_parse_sdw_endpoints(struct snd_soc_card *card,
+				 struct asoc_sdw_dailink *soc_dais,
+				 struct asoc_sdw_endpoint *soc_ends,
+				 int *num_devs)
+{
+	struct device *dev = card->dev;
+	struct asoc_sdw_mc_private *ctx = snd_soc_card_get_drvdata(card);
+	struct snd_soc_acpi_mach *mach = dev_get_platdata(dev);
+	struct snd_soc_acpi_mach_params *mach_params = &mach->mach_params;
+	const struct snd_soc_acpi_link_adr *adr_link;
+	struct asoc_sdw_endpoint *soc_end = soc_ends;
+	int num_dais = 0;
+	int i, j;
+	int ret;
+
+	for (adr_link = mach_params->links; adr_link->num_adr; adr_link++) {
+		int num_link_dailinks = 0;
+
+		if (!is_power_of_2(adr_link->mask)) {
+			dev_err(dev, "link with multiple mask bits: 0x%x\n",
+				adr_link->mask);
+			return -EINVAL;
+		}
+
+		for (i = 0; i < adr_link->num_adr; i++) {
+			const struct snd_soc_acpi_adr_device *adr_dev = &adr_link->adr_d[i];
+			struct asoc_sdw_codec_info *codec_info;
+			const char *codec_name;
+
+			if (!adr_dev->name_prefix) {
+				dev_err(dev, "codec 0x%llx does not have a name prefix\n",
+					adr_dev->adr);
+				return -EINVAL;
+			}
+
+			codec_info = asoc_sdw_find_codec_info_part(adr_dev->adr);
+			if (!codec_info)
+				return -EINVAL;
+
+			ctx->ignore_internal_dmic |= codec_info->ignore_internal_dmic;
+
+			codec_name = asoc_sdw_get_codec_name(dev, codec_info, adr_link, i);
+			if (!codec_name)
+				return -ENOMEM;
+
+			dev_dbg(dev, "Adding prefix %s for %s\n",
+				adr_dev->name_prefix, codec_name);
+
+			soc_end->name_prefix = adr_dev->name_prefix;
+
+			if (codec_info->count_sidecar && codec_info->add_sidecar) {
+				ret = codec_info->count_sidecar(card, &num_dais, num_devs);
+				if (ret)
+					return ret;
+
+				soc_end->include_sidecar = true;
+			}
+
+			for (j = 0; j < adr_dev->num_endpoints; j++) {
+				const struct snd_soc_acpi_endpoint *adr_end;
+				const struct asoc_sdw_dai_info *dai_info;
+				struct asoc_sdw_dailink *soc_dai;
+				int stream;
+
+				adr_end = &adr_dev->endpoints[j];
+				dai_info = &codec_info->dais[adr_end->num];
+				soc_dai = asoc_sdw_find_dailink(soc_dais, adr_end);
+
+				if (dai_info->quirk && !(dai_info->quirk & ctx->mc_quirk))
+					continue;
+
+				dev_dbg(dev,
+					"Add dev: %d, 0x%llx end: %d, dai: %d, %c/%c to %s: %d\n",
+					ffs(adr_link->mask) - 1, adr_dev->adr,
+					adr_end->num, dai_info->dai_type,
+					dai_info->direction[SNDRV_PCM_STREAM_PLAYBACK] ? 'P' : '-',
+					dai_info->direction[SNDRV_PCM_STREAM_CAPTURE] ? 'C' : '-',
+					adr_end->aggregated ? "group" : "solo",
+					adr_end->group_id);
+
+				if (adr_end->num >= codec_info->dai_num) {
+					dev_err(dev,
+						"%d is too many endpoints for codec: 0x%x\n",
+						adr_end->num, codec_info->part_id);
+					return -EINVAL;
+				}
+
+				for_each_pcm_streams(stream) {
+					if (dai_info->direction[stream] &&
+					    dai_info->dailink[stream] < 0) {
+						dev_err(dev,
+							"Invalid dailink id %d for codec: 0x%x\n",
+							dai_info->dailink[stream],
+							codec_info->part_id);
+						return -EINVAL;
+					}
+
+					if (dai_info->direction[stream]) {
+						num_dais += !soc_dai->num_devs[stream];
+						soc_dai->num_devs[stream]++;
+						soc_dai->link_mask[stream] |= adr_link->mask;
+					}
+				}
+
+				num_link_dailinks += !!list_empty(&soc_dai->endpoints);
+				list_add_tail(&soc_end->list, &soc_dai->endpoints);
+
+				soc_end->link_mask = adr_link->mask;
+				soc_end->codec_name = codec_name;
+				soc_end->codec_info = codec_info;
+				soc_end->dai_info = dai_info;
+				soc_end++;
+			}
+		}
+
+		ctx->append_dai_type |= (num_link_dailinks > 1);
+	}
+
+	return num_dais;
+}
+EXPORT_SYMBOL_NS(asoc_sdw_parse_sdw_endpoints, SND_SOC_SDW_UTILS);
+
 MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION("SoundWire ASoC helpers");
-- 
2.34.1

