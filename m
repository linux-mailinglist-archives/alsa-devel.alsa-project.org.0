Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (unknown [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DA0C944A49
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Aug 2024 13:25:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0B9E33D55;
	Thu,  1 Aug 2024 13:24:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0B9E33D55
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722511505;
	bh=n1G6gUesQG1dvcESNYMfRmNBdz7RcgT8+ICnelzaOvM=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=DDBnX4i1AwLQasbw0k5se86RIA+N9oO9z1CPqgHqQqeKHdDopkmAe8vYyKROj4taI
	 GqGWt50zxa8y4KU5scV1Ao+6EArWXob/M9ok1Ktj9YsBCT1PYJXbSjFZ5Oe45a8OBI
	 0+nuxqekAKuBcb/8u8CcX0RD9XfR2DrUyZx4Vwlc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7BF03F805AA; Thu,  1 Aug 2024 13:24:34 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8BC39F80269;
	Thu,  1 Aug 2024 13:24:33 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 739ACF8026A; Thu,  1 Aug 2024 13:19:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on20600.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2405::600])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1BC04F8057A
	for <alsa-devel@alsa-project.org>; Thu,  1 Aug 2024 13:19:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1BC04F8057A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=eUflpqa+
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RY3hNgm4KNM2IW+0/laLsXRsLNDoA5G1tfN15+0SCJ/7nPcJCw0LtNf6XEiOfKEcwL6h57i4FLcJbyJMo7oul+oFIbcSIsm5Fhr7BwvRZVLEccfaVrwzXErPuctHgajbbuWrDJfsPgMzYmjL5WDfWHgn0brleI5URMI7Wli7s4aZ35LskJVI4cB6FPlli30uNEc2DSBxLG4rIvCTUln1qxWR0YQkic6UlheZLV2NGAFl3p30HPnvBYQKSQAIpSr1ldaxu84BQgH8ty6QkDJ1mIStdMIHMB5DRf4gmNluy8R52mv51cQe2p/rogFUaQXS1s6JiR4VR52+7mNcvXy3VQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mqsZlHdsWDbIqdDv4tVmZaPMeiJkSbsfPbnrxJaTCFE=;
 b=uKuZE8L/HOs4o2Sa3xDFAdzDQXLkQUGPqPyYSBTwuVGe+BuR1m0GKgs7AUr35nmnPl6bCR1794Gv8S+1W69qF0erdHqY+SGZmMV8Wob47B0WW+xYhRgy9voCKUw1N+wBR7PCMaJPwZEvxJJrgdSEZyVVvkIxGHJThVsq86f6sorNrwFXKUYC4GAK8lb4kTLB36SuPhwI0nOXhGto9EyC5HIF0Z1z/BqXgKgbaicCrRz4n98LVlyW3VGYIETzpOMc2P1NRpxpbhV2wTeRA5tEQVKeBn+9LIVAPfDwxxXISuXvTlfLYggBCrvqXdQ9MMXqKyNSl0NUfUEoopV05d3baQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mqsZlHdsWDbIqdDv4tVmZaPMeiJkSbsfPbnrxJaTCFE=;
 b=eUflpqa+zcTBqcLy1OnzscRnUug32tjb4g9QSaX37bioe7TY7aTMYS6tQXdyppHfBf9enLN2OG4kKeEZwaTC6i/RTd1rFYC0cL4ygEavB7ue33gCtNcVx7F2hArddFWoWwMktccNLawZW46GDs7Ro+qi78fetZIPFKfwKX7yZuI=
Received: from BN9PR03CA0324.namprd03.prod.outlook.com (2603:10b6:408:112::29)
 by DS0PR12MB9347.namprd12.prod.outlook.com (2603:10b6:8:193::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.23; Thu, 1 Aug
 2024 11:19:06 +0000
Received: from BN3PEPF0000B074.namprd04.prod.outlook.com
 (2603:10b6:408:112:cafe::d7) by BN9PR03CA0324.outlook.office365.com
 (2603:10b6:408:112::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.34 via Frontend
 Transport; Thu, 1 Aug 2024 11:19:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN3PEPF0000B074.mail.protection.outlook.com (10.167.243.119) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7828.19 via Frontend Transport; Thu, 1 Aug 2024 11:19:05 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 1 Aug
 2024 06:19:04 -0500
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39
 via Frontend Transport; Thu, 1 Aug 2024 06:18:55 -0500
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>
CC: <vijendar.mukunda@amd.com>, <Basavaraj.Hiregoudar@amd.com>,
	<Sunil-kumar.Dommati@amd.com>, <alsa-devel@alsa-project.org>,
	<pierre-louis.bossart@linux.intel.com>, <venkataprasad.potturu@amd.com>,
	<yung-chuan.liao@linux.intel.com>, <linux-sound@vger.kernel.org>, "Vijendar
 Mukunda" <Vijendar.Mukunda@amd.com>, Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, "Cezary
 Rojewski" <cezary.rojewski@intel.com>, Peter Ujfalusi
	<peter.ujfalusi@linux.intel.com>, Ranjani Sridharan
	<ranjani.sridharan@linux.intel.com>, Kai Vehmanen
	<kai.vehmanen@linux.intel.com>, Charles Keepax
	<ckeepax@opensource.cirrus.com>, open list <linux-kernel@vger.kernel.org>
Subject: [PATCH RESEND 23/31] ASoC: intel/sdw_utils: move soundwire
 codec_info_list structure
Date: Thu, 1 Aug 2024 16:48:09 +0530
Message-ID: <20240801111821.18076-3-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240801111821.18076-1-Vijendar.Mukunda@amd.com>
References: <20240801091446.10457-1-Vijendar.Mukunda@amd.com>
 <20240801111821.18076-1-Vijendar.Mukunda@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: Vijendar.Mukunda@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B074:EE_|DS0PR12MB9347:EE_
X-MS-Office365-Filtering-Correlation-Id: 89833c42-6461-4d41-2cde-08dcb21bc17a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|36860700013|376014|7416014|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?Cd4fk6F7dkd8Krw1I1F04LoITJruj6JiLGn5ZV9W9qs//4PwlKK8e7KnfN1d?=
 =?us-ascii?Q?LWwqI53wXVT0mWBQSB8USFh4DBYXp3lBmUPZnn+OjLxp2zVuQ0w0X6L/rAip?=
 =?us-ascii?Q?i8luUBUPn9vadhLsNJc8WvIuOFBCnpS89r8VI/Fohyzg5Zgh0FYVRNB3qd0X?=
 =?us-ascii?Q?ZCJMf20RDeTeVZaG0uU9lqRmZb3MlgyguNINS4tGCU3xjQl9axgefvhl1onD?=
 =?us-ascii?Q?l23Y4aznkA6pLseIEdv0o0vn+lx6W/0ql7G9VptEzzQqVrqsV/7Sssiyti93?=
 =?us-ascii?Q?lBgj64m0v7n7ohnuyKkpD4KsRUVTE7t+iHri5LdjhAOkcLB8iXSItNqv0Z3h?=
 =?us-ascii?Q?90lssLozFKrnWikm5149pArzvU0D8LmgFoTUruzYY+zqIZFhK5glQlbvFw9U?=
 =?us-ascii?Q?acaEjAReTolGMul4eFMR81m1YXpXCHBy5283i+3vy9XFseuLh5Ad/kfWcFk7?=
 =?us-ascii?Q?xrGj2YsdvvdR0IrkizoLui9+sTgZ1rNy4v3MDQNfVdchXr3bfDvpsnQVYL3Y?=
 =?us-ascii?Q?OkM52i/TvbMAdA+YghpbCiCodt6Kk0hyQz1KuEJ/r43r9QsK+1Ad4PUv8dlX?=
 =?us-ascii?Q?Dj4pYlK+nMNqWhgHEEGkKDaZHBsjpSl2QKwP5ULSaQObgrPHCYXSXoWMdA6l?=
 =?us-ascii?Q?PdtqbG8KbQVxUQJvZyqJRaSyAocNrULbePHM0xG7dfM79FA+9KsRkXLC/OTM?=
 =?us-ascii?Q?VfPGlDu6IFpEciVk38wb/BI9jO0e107rnI7s60o7wRYlTTTo0Vag+Hf94R/b?=
 =?us-ascii?Q?a7FxyGK/lO+5QM/1yHvUcpyPOkHwHI1/YiGZuhgm2kJNyqCYvas9YaC8CXkz?=
 =?us-ascii?Q?KpfZ/F671D+a8oFvISny98v/S443gcizDx6GVNtFpJcfB48YRQK9M+uzjSGQ?=
 =?us-ascii?Q?2wCPZciNGLVrPXm0vUkLUcChlzuaFe5T3yVyOMfxpx6rx+dIFWN3LYTlLI8Z?=
 =?us-ascii?Q?4tNLXdljb1HlL3MEZSqStCGAUFhvSOpfCwGzxW/VWD3mi34dptbT5mqHHLZo?=
 =?us-ascii?Q?V6liELKtet3qSm14tTYZefAdTI/NZtn/Hys8fHkdqS/w6SCQw50EK8r+ICzK?=
 =?us-ascii?Q?AampUHEHx4M9rl7GUurO+lALfpaGAHYMRH/CcLB//H+t65txhHdczN8KaudP?=
 =?us-ascii?Q?bK1OxV/TJYhipnftmcQu0bxuCccyp/vgQy7AqceaEM5RFIgm+uYHD/rreRYY?=
 =?us-ascii?Q?InIsYrJKMO1BOQSZiIFAoI6wiFYjGsLg4DMjZQCns+rU0fz4SzgGYMHYNXrS?=
 =?us-ascii?Q?5wjBrKdQTN1G+AM+dxBBPoEEITpXrQMf9E2XcD+NH28gICbS7FqFlYxMBqMO?=
 =?us-ascii?Q?dHdR2AlOp90K9pqPbRAco5I1THe+F9Z/osaFU0ZCkFDyDrHeCkaepvRI2AHF?=
 =?us-ascii?Q?3CQUWq51xw5gBTFwAwx1jnM+l9T+CA55hweba2E9Xm+GRqAWbw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(7416014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2024 11:19:05.8857
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 89833c42-6461-4d41-2cde-08dcb21bc17a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN3PEPF0000B074.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB9347
Message-ID-Hash: DI34PLG6KMHGPK64GMEL6SFPOFD4I6YR
X-Message-ID-Hash: DI34PLG6KMHGPK64GMEL6SFPOFD4I6YR
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DI34PLG6KMHGPK64GMEL6SFPOFD4I6YR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

SoundWire 'codec_info_list' structure is not a platform specific one.
Move codec_info_list structure to common file soc_sdw_utils.c.
Move codec helper functions which uses codec_info_list structure to common
place holder and rename the function by adding _sdw tag. This will allow
to use 'codec_info_list' structure and it's helper functions in other
platform machine driver.

Link: https://github.com/thesofproject/linux/pull/5068
Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 include/sound/soc_sdw_utils.h       |  13 +
 sound/soc/intel/boards/sof_sdw.c    | 658 +---------------------------
 sound/soc/sdw_utils/soc_sdw_utils.c | 657 +++++++++++++++++++++++++++
 3 files changed, 676 insertions(+), 652 deletions(-)

diff --git a/include/sound/soc_sdw_utils.h b/include/sound/soc_sdw_utils.h
index 7912ff7d2bb9..9d99a460ba27 100644
--- a/include/sound/soc_sdw_utils.h
+++ b/include/sound/soc_sdw_utils.h
@@ -90,8 +90,12 @@ struct asoc_sdw_mc_private {
 	bool ignore_internal_dmic;
 	void *private;
 	unsigned long mc_quirk;
+	int codec_info_list_count;
 };
 
+extern struct asoc_sdw_codec_info codec_info_list[];
+int asoc_sdw_get_codec_info_list_count(void);
+
 int asoc_sdw_startup(struct snd_pcm_substream *substream);
 int asoc_sdw_prepare(struct snd_pcm_substream *substream);
 int asoc_sdw_prepare(struct snd_pcm_substream *substream);
@@ -106,6 +110,15 @@ const char *asoc_sdw_get_codec_name(struct device *dev,
 				    const struct snd_soc_acpi_link_adr *adr_link,
 				    int adr_index);
 
+struct asoc_sdw_codec_info *asoc_sdw_find_codec_info_part(const u64 adr);
+
+struct asoc_sdw_codec_info *asoc_sdw_find_codec_info_acpi(const u8 *acpi_id);
+
+struct asoc_sdw_codec_info *asoc_sdw_find_codec_info_dai(const char *dai_name,
+							 int *dai_index);
+
+int asoc_sdw_rtd_init(struct snd_soc_pcm_runtime *rtd);
+
 /* DMIC support */
 int asoc_sdw_dmic_init(struct snd_soc_pcm_runtime *rtd);
 
diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index e310843974a7..87f3e5aa1477 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -548,50 +548,6 @@ static struct snd_soc_dai_link_component platform_component[] = {
 	}
 };
 
-static const struct snd_soc_dapm_widget generic_dmic_widgets[] = {
-	SND_SOC_DAPM_MIC("DMIC", NULL),
-};
-
-static const struct snd_soc_dapm_widget generic_jack_widgets[] = {
-	SND_SOC_DAPM_HP("Headphone", NULL),
-	SND_SOC_DAPM_MIC("Headset Mic", NULL),
-};
-
-static const struct snd_kcontrol_new generic_jack_controls[] = {
-	SOC_DAPM_PIN_SWITCH("Headphone"),
-	SOC_DAPM_PIN_SWITCH("Headset Mic"),
-};
-
-static const struct snd_soc_dapm_widget generic_spk_widgets[] = {
-	SND_SOC_DAPM_SPK("Speaker", NULL),
-};
-
-static const struct snd_kcontrol_new generic_spk_controls[] = {
-	SOC_DAPM_PIN_SWITCH("Speaker"),
-};
-
-static const struct snd_soc_dapm_widget maxim_widgets[] = {
-	SND_SOC_DAPM_SPK("Left Spk", NULL),
-	SND_SOC_DAPM_SPK("Right Spk", NULL),
-};
-
-static const struct snd_kcontrol_new maxim_controls[] = {
-	SOC_DAPM_PIN_SWITCH("Left Spk"),
-	SOC_DAPM_PIN_SWITCH("Right Spk"),
-};
-
-static const struct snd_soc_dapm_widget rt700_widgets[] = {
-	SND_SOC_DAPM_HP("Headphones", NULL),
-	SND_SOC_DAPM_MIC("AMIC", NULL),
-	SND_SOC_DAPM_SPK("Speaker", NULL),
-};
-
-static const struct snd_kcontrol_new rt700_controls[] = {
-	SOC_DAPM_PIN_SWITCH("Headphones"),
-	SOC_DAPM_PIN_SWITCH("AMIC"),
-	SOC_DAPM_PIN_SWITCH("Speaker"),
-};
-
 static const struct snd_soc_ops sdw_ops = {
 	.startup = asoc_sdw_startup,
 	.prepare = asoc_sdw_prepare,
@@ -601,547 +557,6 @@ static const struct snd_soc_ops sdw_ops = {
 	.shutdown = asoc_sdw_shutdown,
 };
 
-static struct asoc_sdw_codec_info codec_info_list[] = {
-	{
-		.part_id = 0x700,
-		.dais = {
-			{
-				.direction = {true, true},
-				.dai_name = "rt700-aif1",
-				.dai_type = SOC_SDW_DAI_TYPE_JACK,
-				.dailink = {SOC_SDW_JACK_OUT_DAI_ID, SOC_SDW_JACK_IN_DAI_ID},
-				.rtd_init = asoc_sdw_rt700_rtd_init,
-				.controls = rt700_controls,
-				.num_controls = ARRAY_SIZE(rt700_controls),
-				.widgets = rt700_widgets,
-				.num_widgets = ARRAY_SIZE(rt700_widgets),
-			},
-		},
-		.dai_num = 1,
-	},
-	{
-		.part_id = 0x711,
-		.version_id = 3,
-		.dais = {
-			{
-				.direction = {true, true},
-				.dai_name = "rt711-sdca-aif1",
-				.dai_type = SOC_SDW_DAI_TYPE_JACK,
-				.dailink = {SOC_SDW_JACK_OUT_DAI_ID, SOC_SDW_JACK_IN_DAI_ID},
-				.init = asoc_sdw_rt_sdca_jack_init,
-				.exit = asoc_sdw_rt_sdca_jack_exit,
-				.rtd_init = asoc_sdw_rt_sdca_jack_rtd_init,
-				.controls = generic_jack_controls,
-				.num_controls = ARRAY_SIZE(generic_jack_controls),
-				.widgets = generic_jack_widgets,
-				.num_widgets = ARRAY_SIZE(generic_jack_widgets),
-			},
-		},
-		.dai_num = 1,
-	},
-	{
-		.part_id = 0x711,
-		.version_id = 2,
-		.dais = {
-			{
-				.direction = {true, true},
-				.dai_name = "rt711-aif1",
-				.dai_type = SOC_SDW_DAI_TYPE_JACK,
-				.dailink = {SOC_SDW_JACK_OUT_DAI_ID, SOC_SDW_JACK_IN_DAI_ID},
-				.init = asoc_sdw_rt711_init,
-				.exit = asoc_sdw_rt711_exit,
-				.rtd_init = asoc_sdw_rt711_rtd_init,
-				.controls = generic_jack_controls,
-				.num_controls = ARRAY_SIZE(generic_jack_controls),
-				.widgets = generic_jack_widgets,
-				.num_widgets = ARRAY_SIZE(generic_jack_widgets),
-			},
-		},
-		.dai_num = 1,
-	},
-	{
-		.part_id = 0x712,
-		.version_id = 3,
-		.dais =	{
-			{
-				.direction = {true, true},
-				.dai_name = "rt712-sdca-aif1",
-				.dai_type = SOC_SDW_DAI_TYPE_JACK,
-				.dailink = {SOC_SDW_JACK_OUT_DAI_ID, SOC_SDW_JACK_IN_DAI_ID},
-				.init = asoc_sdw_rt_sdca_jack_init,
-				.exit = asoc_sdw_rt_sdca_jack_exit,
-				.rtd_init = asoc_sdw_rt_sdca_jack_rtd_init,
-				.controls = generic_jack_controls,
-				.num_controls = ARRAY_SIZE(generic_jack_controls),
-				.widgets = generic_jack_widgets,
-				.num_widgets = ARRAY_SIZE(generic_jack_widgets),
-			},
-			{
-				.direction = {true, false},
-				.dai_name = "rt712-sdca-aif2",
-				.dai_type = SOC_SDW_DAI_TYPE_AMP,
-				.dailink = {SOC_SDW_AMP_OUT_DAI_ID, SOC_SDW_UNUSED_DAI_ID},
-				.init = asoc_sdw_rt_amp_init,
-				.exit = asoc_sdw_rt_amp_exit,
-				.rtd_init = asoc_sdw_rt712_spk_rtd_init,
-				.controls = generic_spk_controls,
-				.num_controls = ARRAY_SIZE(generic_spk_controls),
-				.widgets = generic_spk_widgets,
-				.num_widgets = ARRAY_SIZE(generic_spk_widgets),
-			},
-		},
-		.dai_num = 2,
-	},
-	{
-		.part_id = 0x1712,
-		.version_id = 3,
-		.dais =	{
-			{
-				.direction = {false, true},
-				.dai_name = "rt712-sdca-dmic-aif1",
-				.dai_type = SOC_SDW_DAI_TYPE_MIC,
-				.dailink = {SOC_SDW_UNUSED_DAI_ID, SOC_SDW_DMIC_DAI_ID},
-				.rtd_init = asoc_sdw_rt_dmic_rtd_init,
-			},
-		},
-		.dai_num = 1,
-	},
-	{
-		.part_id = 0x713,
-		.version_id = 3,
-		.dais =	{
-			{
-				.direction = {true, true},
-				.dai_name = "rt712-sdca-aif1",
-				.dai_type = SOC_SDW_DAI_TYPE_JACK,
-				.dailink = {SOC_SDW_JACK_OUT_DAI_ID, SOC_SDW_JACK_IN_DAI_ID},
-				.init = asoc_sdw_rt_sdca_jack_init,
-				.exit = asoc_sdw_rt_sdca_jack_exit,
-				.rtd_init = asoc_sdw_rt_sdca_jack_rtd_init,
-				.controls = generic_jack_controls,
-				.num_controls = ARRAY_SIZE(generic_jack_controls),
-				.widgets = generic_jack_widgets,
-				.num_widgets = ARRAY_SIZE(generic_jack_widgets),
-			},
-		},
-		.dai_num = 1,
-	},
-	{
-		.part_id = 0x1713,
-		.version_id = 3,
-		.dais =	{
-			{
-				.direction = {false, true},
-				.dai_name = "rt712-sdca-dmic-aif1",
-				.dai_type = SOC_SDW_DAI_TYPE_MIC,
-				.dailink = {SOC_SDW_UNUSED_DAI_ID, SOC_SDW_DMIC_DAI_ID},
-				.rtd_init = asoc_sdw_rt_dmic_rtd_init,
-			},
-		},
-		.dai_num = 1,
-	},
-	{
-		.part_id = 0x1308,
-		.acpi_id = "10EC1308",
-		.dais = {
-			{
-				.direction = {true, false},
-				.dai_name = "rt1308-aif",
-				.dai_type = SOC_SDW_DAI_TYPE_AMP,
-				.dailink = {SOC_SDW_AMP_OUT_DAI_ID, SOC_SDW_UNUSED_DAI_ID},
-				.init = asoc_sdw_rt_amp_init,
-				.exit = asoc_sdw_rt_amp_exit,
-				.rtd_init = asoc_sdw_rt_amp_spk_rtd_init,
-				.controls = generic_spk_controls,
-				.num_controls = ARRAY_SIZE(generic_spk_controls),
-				.widgets = generic_spk_widgets,
-				.num_widgets = ARRAY_SIZE(generic_spk_widgets),
-			},
-		},
-		.dai_num = 1,
-		.ops = &soc_sdw_rt1308_i2s_ops,
-	},
-	{
-		.part_id = 0x1316,
-		.dais = {
-			{
-				.direction = {true, true},
-				.dai_name = "rt1316-aif",
-				.dai_type = SOC_SDW_DAI_TYPE_AMP,
-				.dailink = {SOC_SDW_AMP_OUT_DAI_ID, SOC_SDW_AMP_IN_DAI_ID},
-				.init = asoc_sdw_rt_amp_init,
-				.exit = asoc_sdw_rt_amp_exit,
-				.rtd_init = asoc_sdw_rt_amp_spk_rtd_init,
-				.controls = generic_spk_controls,
-				.num_controls = ARRAY_SIZE(generic_spk_controls),
-				.widgets = generic_spk_widgets,
-				.num_widgets = ARRAY_SIZE(generic_spk_widgets),
-			},
-		},
-		.dai_num = 1,
-	},
-	{
-		.part_id = 0x1318,
-		.dais = {
-			{
-				.direction = {true, true},
-				.dai_name = "rt1318-aif",
-				.dai_type = SOC_SDW_DAI_TYPE_AMP,
-				.dailink = {SOC_SDW_AMP_OUT_DAI_ID, SOC_SDW_AMP_IN_DAI_ID},
-				.init = asoc_sdw_rt_amp_init,
-				.exit = asoc_sdw_rt_amp_exit,
-				.rtd_init = asoc_sdw_rt_amp_spk_rtd_init,
-				.controls = generic_spk_controls,
-				.num_controls = ARRAY_SIZE(generic_spk_controls),
-				.widgets = generic_spk_widgets,
-				.num_widgets = ARRAY_SIZE(generic_spk_widgets),
-			},
-		},
-		.dai_num = 1,
-	},
-	{
-		.part_id = 0x714,
-		.version_id = 3,
-		.ignore_internal_dmic = true,
-		.dais = {
-			{
-				.direction = {false, true},
-				.dai_name = "rt715-sdca-aif2",
-				.dai_type = SOC_SDW_DAI_TYPE_MIC,
-				.dailink = {SOC_SDW_UNUSED_DAI_ID, SOC_SDW_DMIC_DAI_ID},
-				.rtd_init = asoc_sdw_rt_dmic_rtd_init,
-			},
-		},
-		.dai_num = 1,
-	},
-	{
-		.part_id = 0x715,
-		.version_id = 3,
-		.ignore_internal_dmic = true,
-		.dais = {
-			{
-				.direction = {false, true},
-				.dai_name = "rt715-sdca-aif2",
-				.dai_type = SOC_SDW_DAI_TYPE_MIC,
-				.dailink = {SOC_SDW_UNUSED_DAI_ID, SOC_SDW_DMIC_DAI_ID},
-				.rtd_init = asoc_sdw_rt_dmic_rtd_init,
-			},
-		},
-		.dai_num = 1,
-	},
-	{
-		.part_id = 0x714,
-		.version_id = 2,
-		.ignore_internal_dmic = true,
-		.dais = {
-			{
-				.direction = {false, true},
-				.dai_name = "rt715-aif2",
-				.dai_type = SOC_SDW_DAI_TYPE_MIC,
-				.dailink = {SOC_SDW_UNUSED_DAI_ID, SOC_SDW_DMIC_DAI_ID},
-				.rtd_init = asoc_sdw_rt_dmic_rtd_init,
-			},
-		},
-		.dai_num = 1,
-	},
-	{
-		.part_id = 0x715,
-		.version_id = 2,
-		.ignore_internal_dmic = true,
-		.dais = {
-			{
-				.direction = {false, true},
-				.dai_name = "rt715-aif2",
-				.dai_type = SOC_SDW_DAI_TYPE_MIC,
-				.dailink = {SOC_SDW_UNUSED_DAI_ID, SOC_SDW_DMIC_DAI_ID},
-				.rtd_init = asoc_sdw_rt_dmic_rtd_init,
-			},
-		},
-		.dai_num = 1,
-	},
-	{
-		.part_id = 0x722,
-		.version_id = 3,
-		.dais = {
-			{
-				.direction = {true, true},
-				.dai_name = "rt722-sdca-aif1",
-				.dai_type = SOC_SDW_DAI_TYPE_JACK,
-				.dailink = {SOC_SDW_JACK_OUT_DAI_ID, SOC_SDW_JACK_IN_DAI_ID},
-				.init = asoc_sdw_rt_sdca_jack_init,
-				.exit = asoc_sdw_rt_sdca_jack_exit,
-				.rtd_init = asoc_sdw_rt_sdca_jack_rtd_init,
-				.controls = generic_jack_controls,
-				.num_controls = ARRAY_SIZE(generic_jack_controls),
-				.widgets = generic_jack_widgets,
-				.num_widgets = ARRAY_SIZE(generic_jack_widgets),
-			},
-			{
-				.direction = {true, false},
-				.dai_name = "rt722-sdca-aif2",
-				.dai_type = SOC_SDW_DAI_TYPE_AMP,
-				/* No feedback capability is provided by rt722-sdca codec driver*/
-				.dailink = {SOC_SDW_AMP_OUT_DAI_ID, SOC_SDW_UNUSED_DAI_ID},
-				.init = asoc_sdw_rt_amp_init,
-				.exit = asoc_sdw_rt_amp_exit,
-				.rtd_init = asoc_sdw_rt722_spk_rtd_init,
-				.controls = generic_spk_controls,
-				.num_controls = ARRAY_SIZE(generic_spk_controls),
-				.widgets = generic_spk_widgets,
-				.num_widgets = ARRAY_SIZE(generic_spk_widgets),
-			},
-			{
-				.direction = {false, true},
-				.dai_name = "rt722-sdca-aif3",
-				.dai_type = SOC_SDW_DAI_TYPE_MIC,
-				.dailink = {SOC_SDW_UNUSED_DAI_ID, SOC_SDW_DMIC_DAI_ID},
-				.rtd_init = asoc_sdw_rt_dmic_rtd_init,
-			},
-		},
-		.dai_num = 3,
-	},
-	{
-		.part_id = 0x8373,
-		.dais = {
-			{
-				.direction = {true, true},
-				.dai_name = "max98373-aif1",
-				.dai_type = SOC_SDW_DAI_TYPE_AMP,
-				.dailink = {SOC_SDW_AMP_OUT_DAI_ID, SOC_SDW_AMP_IN_DAI_ID},
-				.init = asoc_sdw_maxim_init,
-				.rtd_init = asoc_sdw_maxim_spk_rtd_init,
-				.controls = maxim_controls,
-				.num_controls = ARRAY_SIZE(maxim_controls),
-				.widgets = maxim_widgets,
-				.num_widgets = ARRAY_SIZE(maxim_widgets),
-			},
-		},
-		.dai_num = 1,
-	},
-	{
-		.part_id = 0x8363,
-		.dais = {
-			{
-				.direction = {true, false},
-				.dai_name = "max98363-aif1",
-				.dai_type = SOC_SDW_DAI_TYPE_AMP,
-				.dailink = {SOC_SDW_AMP_OUT_DAI_ID, SOC_SDW_UNUSED_DAI_ID},
-				.init = asoc_sdw_maxim_init,
-				.rtd_init = asoc_sdw_maxim_spk_rtd_init,
-				.controls = maxim_controls,
-				.num_controls = ARRAY_SIZE(maxim_controls),
-				.widgets = maxim_widgets,
-				.num_widgets = ARRAY_SIZE(maxim_widgets),
-			},
-		},
-		.dai_num = 1,
-	},
-	{
-		.part_id = 0x5682,
-		.dais = {
-			{
-				.direction = {true, true},
-				.dai_name = "rt5682-sdw",
-				.dai_type = SOC_SDW_DAI_TYPE_JACK,
-				.dailink = {SOC_SDW_JACK_OUT_DAI_ID, SOC_SDW_JACK_IN_DAI_ID},
-				.rtd_init = asoc_sdw_rt5682_rtd_init,
-				.controls = generic_jack_controls,
-				.num_controls = ARRAY_SIZE(generic_jack_controls),
-				.widgets = generic_jack_widgets,
-				.num_widgets = ARRAY_SIZE(generic_jack_widgets),
-			},
-		},
-		.dai_num = 1,
-	},
-	{
-		.part_id = 0x3556,
-		.dais = {
-			{
-				.direction = {true, true},
-				.dai_name = "cs35l56-sdw1",
-				.dai_type = SOC_SDW_DAI_TYPE_AMP,
-				.dailink = {SOC_SDW_AMP_OUT_DAI_ID, SOC_SDW_AMP_IN_DAI_ID},
-				.init = asoc_sdw_cs_amp_init,
-				.rtd_init = asoc_sdw_cs_spk_rtd_init,
-				.controls = generic_spk_controls,
-				.num_controls = ARRAY_SIZE(generic_spk_controls),
-				.widgets = generic_spk_widgets,
-				.num_widgets = ARRAY_SIZE(generic_spk_widgets),
-			},
-		},
-		.dai_num = 1,
-	},
-	{
-		.part_id = 0x4242,
-		.dais = {
-			{
-				.direction = {true, true},
-				.dai_name = "cs42l42-sdw",
-				.dai_type = SOC_SDW_DAI_TYPE_JACK,
-				.dailink = {SOC_SDW_JACK_OUT_DAI_ID, SOC_SDW_JACK_IN_DAI_ID},
-				.rtd_init = asoc_sdw_cs42l42_rtd_init,
-				.controls = generic_jack_controls,
-				.num_controls = ARRAY_SIZE(generic_jack_controls),
-				.widgets = generic_jack_widgets,
-				.num_widgets = ARRAY_SIZE(generic_jack_widgets),
-			},
-		},
-		.dai_num = 1,
-	},
-	{
-		.part_id = 0x4243,
-		.codec_name = "cs42l43-codec",
-		.count_sidecar = asoc_sdw_bridge_cs35l56_count_sidecar,
-		.add_sidecar = asoc_sdw_bridge_cs35l56_add_sidecar,
-		.dais = {
-			{
-				.direction = {true, false},
-				.dai_name = "cs42l43-dp5",
-				.dai_type = SOC_SDW_DAI_TYPE_JACK,
-				.dailink = {SOC_SDW_JACK_OUT_DAI_ID, SOC_SDW_UNUSED_DAI_ID},
-				.rtd_init = asoc_sdw_cs42l43_hs_rtd_init,
-				.controls = generic_jack_controls,
-				.num_controls = ARRAY_SIZE(generic_jack_controls),
-				.widgets = generic_jack_widgets,
-				.num_widgets = ARRAY_SIZE(generic_jack_widgets),
-			},
-			{
-				.direction = {false, true},
-				.dai_name = "cs42l43-dp1",
-				.dai_type = SOC_SDW_DAI_TYPE_MIC,
-				.dailink = {SOC_SDW_UNUSED_DAI_ID, SOC_SDW_DMIC_DAI_ID},
-				.rtd_init = asoc_sdw_cs42l43_dmic_rtd_init,
-				.widgets = generic_dmic_widgets,
-				.num_widgets = ARRAY_SIZE(generic_dmic_widgets),
-			},
-			{
-				.direction = {false, true},
-				.dai_name = "cs42l43-dp2",
-				.dai_type = SOC_SDW_DAI_TYPE_JACK,
-				.dailink = {SOC_SDW_UNUSED_DAI_ID, SOC_SDW_JACK_IN_DAI_ID},
-			},
-			{
-				.direction = {true, false},
-				.dai_name = "cs42l43-dp6",
-				.dai_type = SOC_SDW_DAI_TYPE_AMP,
-				.dailink = {SOC_SDW_AMP_OUT_DAI_ID, SOC_SDW_UNUSED_DAI_ID},
-				.init = asoc_sdw_cs42l43_spk_init,
-				.rtd_init = asoc_sdw_cs42l43_spk_rtd_init,
-				.controls = generic_spk_controls,
-				.num_controls = ARRAY_SIZE(generic_spk_controls),
-				.widgets = generic_spk_widgets,
-				.num_widgets = ARRAY_SIZE(generic_spk_widgets),
-				.quirk = SOC_SDW_CODEC_SPKR | SOC_SDW_SIDECAR_AMPS,
-			},
-		},
-		.dai_num = 4,
-	},
-	{
-		.part_id = 0xaaaa, /* generic codec mockup */
-		.version_id = 0,
-		.dais = {
-			{
-				.direction = {true, true},
-				.dai_name = "sdw-mockup-aif1",
-				.dai_type = SOC_SDW_DAI_TYPE_JACK,
-				.dailink = {SOC_SDW_JACK_OUT_DAI_ID, SOC_SDW_JACK_IN_DAI_ID},
-			},
-		},
-		.dai_num = 1,
-	},
-	{
-		.part_id = 0xaa55, /* headset codec mockup */
-		.version_id = 0,
-		.dais = {
-			{
-				.direction = {true, true},
-				.dai_name = "sdw-mockup-aif1",
-				.dai_type = SOC_SDW_DAI_TYPE_JACK,
-				.dailink = {SOC_SDW_JACK_OUT_DAI_ID, SOC_SDW_JACK_IN_DAI_ID},
-			},
-		},
-		.dai_num = 1,
-	},
-	{
-		.part_id = 0x55aa, /* amplifier mockup */
-		.version_id = 0,
-		.dais = {
-			{
-				.direction = {true, true},
-				.dai_name = "sdw-mockup-aif1",
-				.dai_type = SOC_SDW_DAI_TYPE_AMP,
-				.dailink = {SOC_SDW_AMP_OUT_DAI_ID, SOC_SDW_AMP_IN_DAI_ID},
-			},
-		},
-		.dai_num = 1,
-	},
-	{
-		.part_id = 0x5555,
-		.version_id = 0,
-		.dais = {
-			{
-				.dai_name = "sdw-mockup-aif1",
-				.direction = {false, true},
-				.dai_type = SOC_SDW_DAI_TYPE_MIC,
-				.dailink = {SOC_SDW_UNUSED_DAI_ID, SOC_SDW_DMIC_DAI_ID},
-			},
-		},
-		.dai_num = 1,
-	},
-};
-
-static struct asoc_sdw_codec_info *asoc_sdw_find_codec_info_part(const u64 adr)
-{
-	unsigned int part_id, sdw_version;
-	int i;
-
-	part_id = SDW_PART_ID(adr);
-	sdw_version = SDW_VERSION(adr);
-	for (i = 0; i < ARRAY_SIZE(codec_info_list); i++)
-		/*
-		 * A codec info is for all sdw version with the part id if
-		 * version_id is not specified in the codec info.
-		 */
-		if (part_id == codec_info_list[i].part_id &&
-		    (!codec_info_list[i].version_id ||
-		     sdw_version == codec_info_list[i].version_id))
-			return &codec_info_list[i];
-
-	return NULL;
-
-}
-
-static struct asoc_sdw_codec_info *asoc_sdw_find_codec_info_acpi(const u8 *acpi_id)
-{
-	int i;
-
-	if (!acpi_id[0])
-		return NULL;
-
-	for (i = 0; i < ARRAY_SIZE(codec_info_list); i++)
-		if (!memcmp(codec_info_list[i].acpi_id, acpi_id, ACPI_ID_LEN))
-			return &codec_info_list[i];
-
-	return NULL;
-}
-
-static struct asoc_sdw_codec_info *asoc_sdw_find_codec_info_dai(const char *dai_name,
-								int *dai_index)
-{
-	int i, j;
-
-	for (i = 0; i < ARRAY_SIZE(codec_info_list); i++) {
-		for (j = 0; j < codec_info_list[i].dai_num; j++) {
-			if (!strcmp(codec_info_list[i].dais[j].dai_name, dai_name)) {
-				*dai_index = j;
-				return &codec_info_list[i];
-			}
-		}
-	}
-
-	return NULL;
-}
-
 static void init_dai_link(struct device *dev, struct snd_soc_dai_link *dai_links,
 			  int *be_id, char *name, int playback, int capture,
 			  struct snd_soc_dai_link_component *cpus, int cpus_num,
@@ -1190,69 +605,6 @@ static int init_simple_dai_link(struct device *dev, struct snd_soc_dai_link *dai
 	return 0;
 }
 
-static int asoc_sdw_rtd_init(struct snd_soc_pcm_runtime *rtd)
-{
-	struct snd_soc_card *card = rtd->card;
-	struct asoc_sdw_codec_info *codec_info;
-	struct snd_soc_dai *dai;
-	int dai_index;
-	int ret;
-	int i;
-
-	for_each_rtd_codec_dais(rtd, i, dai) {
-		codec_info = asoc_sdw_find_codec_info_dai(dai->name, &dai_index);
-		if (!codec_info)
-			return -EINVAL;
-
-		/*
-		 * A codec dai can be connected to different dai links for capture and playback,
-		 * but we only need to call the rtd_init function once.
-		 * The rtd_init for each codec dai is independent. So, the order of rtd_init
-		 * doesn't matter.
-		 */
-		if (codec_info->dais[dai_index].rtd_init_done)
-			continue;
-
-		/*
-		 * Add card controls and dapm widgets for the first codec dai.
-		 * The controls and widgets will be used for all codec dais.
-		 */
-
-		if (i > 0)
-			goto skip_add_controls_widgets;
-
-		if (codec_info->dais[dai_index].controls) {
-			ret = snd_soc_add_card_controls(card, codec_info->dais[dai_index].controls,
-							codec_info->dais[dai_index].num_controls);
-			if (ret) {
-				dev_err(card->dev, "%#x controls addition failed: %d\n",
-					codec_info->part_id, ret);
-				return ret;
-			}
-		}
-		if (codec_info->dais[dai_index].widgets) {
-			ret = snd_soc_dapm_new_controls(&card->dapm,
-							codec_info->dais[dai_index].widgets,
-							codec_info->dais[dai_index].num_widgets);
-			if (ret) {
-				dev_err(card->dev, "%#x widgets addition failed: %d\n",
-					codec_info->part_id, ret);
-				return ret;
-			}
-		}
-
-skip_add_controls_widgets:
-		if (codec_info->dais[dai_index].rtd_init) {
-			ret = codec_info->dais[dai_index].rtd_init(rtd, dai);
-			if (ret)
-				return ret;
-		}
-		codec_info->dais[dai_index].rtd_init_done = true;
-	}
-
-	return 0;
-}
-
 struct sof_sdw_endpoint {
 	struct list_head list;
 
@@ -1871,7 +1223,7 @@ static int sof_sdw_card_late_probe(struct snd_soc_card *card)
 	int ret = 0;
 	int i;
 
-	for (i = 0; i < ARRAY_SIZE(codec_info_list); i++) {
+	for (i = 0; i < ctx->codec_info_list_count; i++) {
 		if (codec_info_list[i].codec_card_late_probe) {
 			ret = codec_info_list[i].codec_card_late_probe(card);
 
@@ -1907,10 +1259,11 @@ static struct snd_soc_dai_link *mc_find_codec_dai_used(struct snd_soc_card *card
 static void mc_dailink_exit_loop(struct snd_soc_card *card)
 {
 	struct snd_soc_dai_link *dai_link;
+	struct asoc_sdw_mc_private *ctx = snd_soc_card_get_drvdata(card);
 	int ret;
 	int i, j;
 
-	for (i = 0; i < ARRAY_SIZE(codec_info_list); i++) {
+	for (i = 0; i < ctx->codec_info_list_count; i++) {
 		for (j = 0; j < codec_info_list[i].dai_num; j++) {
 			codec_info_list[i].dais[j].rtd_init_done = false;
 			/* Check each dai in codec_info_lis to see if it is used in the link */
@@ -1955,6 +1308,7 @@ static int mc_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	ctx->private = intel_ctx;
+	ctx->codec_info_list_count = asoc_sdw_get_codec_info_list_count();
 	card = &ctx->card;
 	card->dev = &pdev->dev;
 	card->name = "soundwire";
@@ -1975,7 +1329,7 @@ static int mc_probe(struct platform_device *pdev)
 
 	ctx->mc_quirk = sof_sdw_quirk;
 	/* reset amp_num to ensure amp_num++ starts from 0 in each probe */
-	for (i = 0; i < ARRAY_SIZE(codec_info_list); i++)
+	for (i = 0; i < ctx->codec_info_list_count; i++)
 		codec_info_list[i].amp_num = 0;
 
 	if (mach->mach_params.subsystem_id_set) {
@@ -1993,7 +1347,7 @@ static int mc_probe(struct platform_device *pdev)
 	 * amp_num will only be increased for active amp
 	 * codecs on used platform
 	 */
-	for (i = 0; i < ARRAY_SIZE(codec_info_list); i++)
+	for (i = 0; i < ctx->codec_info_list_count; i++)
 		amp_num += codec_info_list[i].amp_num;
 
 	card->components = devm_kasprintf(card->dev, GFP_KERNEL,
diff --git a/sound/soc/sdw_utils/soc_sdw_utils.c b/sound/soc/sdw_utils/soc_sdw_utils.c
index 2b59ddc61078..a496b4eff6e3 100644
--- a/sound/soc/sdw_utils/soc_sdw_utils.c
+++ b/sound/soc/sdw_utils/soc_sdw_utils.c
@@ -12,6 +12,663 @@
 #include <linux/soundwire/sdw_type.h>
 #include <sound/soc_sdw_utils.h>
 
+static const struct snd_soc_dapm_widget generic_dmic_widgets[] = {
+	SND_SOC_DAPM_MIC("DMIC", NULL),
+};
+
+static const struct snd_soc_dapm_widget generic_jack_widgets[] = {
+	SND_SOC_DAPM_HP("Headphone", NULL),
+	SND_SOC_DAPM_MIC("Headset Mic", NULL),
+};
+
+static const struct snd_kcontrol_new generic_jack_controls[] = {
+	SOC_DAPM_PIN_SWITCH("Headphone"),
+	SOC_DAPM_PIN_SWITCH("Headset Mic"),
+};
+
+static const struct snd_soc_dapm_widget generic_spk_widgets[] = {
+	SND_SOC_DAPM_SPK("Speaker", NULL),
+};
+
+static const struct snd_kcontrol_new generic_spk_controls[] = {
+	SOC_DAPM_PIN_SWITCH("Speaker"),
+};
+
+static const struct snd_soc_dapm_widget maxim_widgets[] = {
+	SND_SOC_DAPM_SPK("Left Spk", NULL),
+	SND_SOC_DAPM_SPK("Right Spk", NULL),
+};
+
+static const struct snd_kcontrol_new maxim_controls[] = {
+	SOC_DAPM_PIN_SWITCH("Left Spk"),
+	SOC_DAPM_PIN_SWITCH("Right Spk"),
+};
+
+static const struct snd_soc_dapm_widget rt700_widgets[] = {
+	SND_SOC_DAPM_HP("Headphones", NULL),
+	SND_SOC_DAPM_MIC("AMIC", NULL),
+	SND_SOC_DAPM_SPK("Speaker", NULL),
+};
+
+static const struct snd_kcontrol_new rt700_controls[] = {
+	SOC_DAPM_PIN_SWITCH("Headphones"),
+	SOC_DAPM_PIN_SWITCH("AMIC"),
+	SOC_DAPM_PIN_SWITCH("Speaker"),
+};
+
+struct asoc_sdw_codec_info codec_info_list[] = {
+	{
+		.part_id = 0x700,
+		.dais = {
+			{
+				.direction = {true, true},
+				.dai_name = "rt700-aif1",
+				.dai_type = SOC_SDW_DAI_TYPE_JACK,
+				.dailink = {SOC_SDW_JACK_OUT_DAI_ID, SOC_SDW_JACK_IN_DAI_ID},
+				.rtd_init = asoc_sdw_rt700_rtd_init,
+				.controls = rt700_controls,
+				.num_controls = ARRAY_SIZE(rt700_controls),
+				.widgets = rt700_widgets,
+				.num_widgets = ARRAY_SIZE(rt700_widgets),
+			},
+		},
+		.dai_num = 1,
+	},
+	{
+		.part_id = 0x711,
+		.version_id = 3,
+		.dais = {
+			{
+				.direction = {true, true},
+				.dai_name = "rt711-sdca-aif1",
+				.dai_type = SOC_SDW_DAI_TYPE_JACK,
+				.dailink = {SOC_SDW_JACK_OUT_DAI_ID, SOC_SDW_JACK_IN_DAI_ID},
+				.init = asoc_sdw_rt_sdca_jack_init,
+				.exit = asoc_sdw_rt_sdca_jack_exit,
+				.rtd_init = asoc_sdw_rt_sdca_jack_rtd_init,
+				.controls = generic_jack_controls,
+				.num_controls = ARRAY_SIZE(generic_jack_controls),
+				.widgets = generic_jack_widgets,
+				.num_widgets = ARRAY_SIZE(generic_jack_widgets),
+			},
+		},
+		.dai_num = 1,
+	},
+	{
+		.part_id = 0x711,
+		.version_id = 2,
+		.dais = {
+			{
+				.direction = {true, true},
+				.dai_name = "rt711-aif1",
+				.dai_type = SOC_SDW_DAI_TYPE_JACK,
+				.dailink = {SOC_SDW_JACK_OUT_DAI_ID, SOC_SDW_JACK_IN_DAI_ID},
+				.init = asoc_sdw_rt711_init,
+				.exit = asoc_sdw_rt711_exit,
+				.rtd_init = asoc_sdw_rt711_rtd_init,
+				.controls = generic_jack_controls,
+				.num_controls = ARRAY_SIZE(generic_jack_controls),
+				.widgets = generic_jack_widgets,
+				.num_widgets = ARRAY_SIZE(generic_jack_widgets),
+			},
+		},
+		.dai_num = 1,
+	},
+	{
+		.part_id = 0x712,
+		.version_id = 3,
+		.dais =	{
+			{
+				.direction = {true, true},
+				.dai_name = "rt712-sdca-aif1",
+				.dai_type = SOC_SDW_DAI_TYPE_JACK,
+				.dailink = {SOC_SDW_JACK_OUT_DAI_ID, SOC_SDW_JACK_IN_DAI_ID},
+				.init = asoc_sdw_rt_sdca_jack_init,
+				.exit = asoc_sdw_rt_sdca_jack_exit,
+				.rtd_init = asoc_sdw_rt_sdca_jack_rtd_init,
+				.controls = generic_jack_controls,
+				.num_controls = ARRAY_SIZE(generic_jack_controls),
+				.widgets = generic_jack_widgets,
+				.num_widgets = ARRAY_SIZE(generic_jack_widgets),
+			},
+			{
+				.direction = {true, false},
+				.dai_name = "rt712-sdca-aif2",
+				.dai_type = SOC_SDW_DAI_TYPE_AMP,
+				.dailink = {SOC_SDW_AMP_OUT_DAI_ID, SOC_SDW_UNUSED_DAI_ID},
+				.init = asoc_sdw_rt_amp_init,
+				.exit = asoc_sdw_rt_amp_exit,
+				.rtd_init = asoc_sdw_rt712_spk_rtd_init,
+				.controls = generic_spk_controls,
+				.num_controls = ARRAY_SIZE(generic_spk_controls),
+				.widgets = generic_spk_widgets,
+				.num_widgets = ARRAY_SIZE(generic_spk_widgets),
+			},
+		},
+		.dai_num = 2,
+	},
+	{
+		.part_id = 0x1712,
+		.version_id = 3,
+		.dais =	{
+			{
+				.direction = {false, true},
+				.dai_name = "rt712-sdca-dmic-aif1",
+				.dai_type = SOC_SDW_DAI_TYPE_MIC,
+				.dailink = {SOC_SDW_UNUSED_DAI_ID, SOC_SDW_DMIC_DAI_ID},
+				.rtd_init = asoc_sdw_rt_dmic_rtd_init,
+			},
+		},
+		.dai_num = 1,
+	},
+	{
+		.part_id = 0x713,
+		.version_id = 3,
+		.dais =	{
+			{
+				.direction = {true, true},
+				.dai_name = "rt712-sdca-aif1",
+				.dai_type = SOC_SDW_DAI_TYPE_JACK,
+				.dailink = {SOC_SDW_JACK_OUT_DAI_ID, SOC_SDW_JACK_IN_DAI_ID},
+				.init = asoc_sdw_rt_sdca_jack_init,
+				.exit = asoc_sdw_rt_sdca_jack_exit,
+				.rtd_init = asoc_sdw_rt_sdca_jack_rtd_init,
+				.controls = generic_jack_controls,
+				.num_controls = ARRAY_SIZE(generic_jack_controls),
+				.widgets = generic_jack_widgets,
+				.num_widgets = ARRAY_SIZE(generic_jack_widgets),
+			},
+		},
+		.dai_num = 1,
+	},
+	{
+		.part_id = 0x1713,
+		.version_id = 3,
+		.dais =	{
+			{
+				.direction = {false, true},
+				.dai_name = "rt712-sdca-dmic-aif1",
+				.dai_type = SOC_SDW_DAI_TYPE_MIC,
+				.dailink = {SOC_SDW_UNUSED_DAI_ID, SOC_SDW_DMIC_DAI_ID},
+				.rtd_init = asoc_sdw_rt_dmic_rtd_init,
+			},
+		},
+		.dai_num = 1,
+	},
+	{
+		.part_id = 0x1308,
+		.acpi_id = "10EC1308",
+		.dais = {
+			{
+				.direction = {true, false},
+				.dai_name = "rt1308-aif",
+				.dai_type = SOC_SDW_DAI_TYPE_AMP,
+				.dailink = {SOC_SDW_AMP_OUT_DAI_ID, SOC_SDW_UNUSED_DAI_ID},
+				.init = asoc_sdw_rt_amp_init,
+				.exit = asoc_sdw_rt_amp_exit,
+				.rtd_init = asoc_sdw_rt_amp_spk_rtd_init,
+				.controls = generic_spk_controls,
+				.num_controls = ARRAY_SIZE(generic_spk_controls),
+				.widgets = generic_spk_widgets,
+				.num_widgets = ARRAY_SIZE(generic_spk_widgets),
+			},
+		},
+		.dai_num = 1,
+		.ops = &soc_sdw_rt1308_i2s_ops,
+	},
+	{
+		.part_id = 0x1316,
+		.dais = {
+			{
+				.direction = {true, true},
+				.dai_name = "rt1316-aif",
+				.dai_type = SOC_SDW_DAI_TYPE_AMP,
+				.dailink = {SOC_SDW_AMP_OUT_DAI_ID, SOC_SDW_AMP_IN_DAI_ID},
+				.init = asoc_sdw_rt_amp_init,
+				.exit = asoc_sdw_rt_amp_exit,
+				.rtd_init = asoc_sdw_rt_amp_spk_rtd_init,
+				.controls = generic_spk_controls,
+				.num_controls = ARRAY_SIZE(generic_spk_controls),
+				.widgets = generic_spk_widgets,
+				.num_widgets = ARRAY_SIZE(generic_spk_widgets),
+			},
+		},
+		.dai_num = 1,
+	},
+	{
+		.part_id = 0x1318,
+		.dais = {
+			{
+				.direction = {true, true},
+				.dai_name = "rt1318-aif",
+				.dai_type = SOC_SDW_DAI_TYPE_AMP,
+				.dailink = {SOC_SDW_AMP_OUT_DAI_ID, SOC_SDW_AMP_IN_DAI_ID},
+				.init = asoc_sdw_rt_amp_init,
+				.exit = asoc_sdw_rt_amp_exit,
+				.rtd_init = asoc_sdw_rt_amp_spk_rtd_init,
+				.controls = generic_spk_controls,
+				.num_controls = ARRAY_SIZE(generic_spk_controls),
+				.widgets = generic_spk_widgets,
+				.num_widgets = ARRAY_SIZE(generic_spk_widgets),
+			},
+		},
+		.dai_num = 1,
+	},
+	{
+		.part_id = 0x714,
+		.version_id = 3,
+		.ignore_internal_dmic = true,
+		.dais = {
+			{
+				.direction = {false, true},
+				.dai_name = "rt715-sdca-aif2",
+				.dai_type = SOC_SDW_DAI_TYPE_MIC,
+				.dailink = {SOC_SDW_UNUSED_DAI_ID, SOC_SDW_DMIC_DAI_ID},
+				.rtd_init = asoc_sdw_rt_dmic_rtd_init,
+			},
+		},
+		.dai_num = 1,
+	},
+	{
+		.part_id = 0x715,
+		.version_id = 3,
+		.ignore_internal_dmic = true,
+		.dais = {
+			{
+				.direction = {false, true},
+				.dai_name = "rt715-sdca-aif2",
+				.dai_type = SOC_SDW_DAI_TYPE_MIC,
+				.dailink = {SOC_SDW_UNUSED_DAI_ID, SOC_SDW_DMIC_DAI_ID},
+				.rtd_init = asoc_sdw_rt_dmic_rtd_init,
+			},
+		},
+		.dai_num = 1,
+	},
+	{
+		.part_id = 0x714,
+		.version_id = 2,
+		.ignore_internal_dmic = true,
+		.dais = {
+			{
+				.direction = {false, true},
+				.dai_name = "rt715-aif2",
+				.dai_type = SOC_SDW_DAI_TYPE_MIC,
+				.dailink = {SOC_SDW_UNUSED_DAI_ID, SOC_SDW_DMIC_DAI_ID},
+				.rtd_init = asoc_sdw_rt_dmic_rtd_init,
+			},
+		},
+		.dai_num = 1,
+	},
+	{
+		.part_id = 0x715,
+		.version_id = 2,
+		.ignore_internal_dmic = true,
+		.dais = {
+			{
+				.direction = {false, true},
+				.dai_name = "rt715-aif2",
+				.dai_type = SOC_SDW_DAI_TYPE_MIC,
+				.dailink = {SOC_SDW_UNUSED_DAI_ID, SOC_SDW_DMIC_DAI_ID},
+				.rtd_init = asoc_sdw_rt_dmic_rtd_init,
+			},
+		},
+		.dai_num = 1,
+	},
+	{
+		.part_id = 0x722,
+		.version_id = 3,
+		.dais = {
+			{
+				.direction = {true, true},
+				.dai_name = "rt722-sdca-aif1",
+				.dai_type = SOC_SDW_DAI_TYPE_JACK,
+				.dailink = {SOC_SDW_JACK_OUT_DAI_ID, SOC_SDW_JACK_IN_DAI_ID},
+				.init = asoc_sdw_rt_sdca_jack_init,
+				.exit = asoc_sdw_rt_sdca_jack_exit,
+				.rtd_init = asoc_sdw_rt_sdca_jack_rtd_init,
+				.controls = generic_jack_controls,
+				.num_controls = ARRAY_SIZE(generic_jack_controls),
+				.widgets = generic_jack_widgets,
+				.num_widgets = ARRAY_SIZE(generic_jack_widgets),
+			},
+			{
+				.direction = {true, false},
+				.dai_name = "rt722-sdca-aif2",
+				.dai_type = SOC_SDW_DAI_TYPE_AMP,
+				/* No feedback capability is provided by rt722-sdca codec driver*/
+				.dailink = {SOC_SDW_AMP_OUT_DAI_ID, SOC_SDW_UNUSED_DAI_ID},
+				.init = asoc_sdw_rt_amp_init,
+				.exit = asoc_sdw_rt_amp_exit,
+				.rtd_init = asoc_sdw_rt722_spk_rtd_init,
+				.controls = generic_spk_controls,
+				.num_controls = ARRAY_SIZE(generic_spk_controls),
+				.widgets = generic_spk_widgets,
+				.num_widgets = ARRAY_SIZE(generic_spk_widgets),
+			},
+			{
+				.direction = {false, true},
+				.dai_name = "rt722-sdca-aif3",
+				.dai_type = SOC_SDW_DAI_TYPE_MIC,
+				.dailink = {SOC_SDW_UNUSED_DAI_ID, SOC_SDW_DMIC_DAI_ID},
+				.rtd_init = asoc_sdw_rt_dmic_rtd_init,
+			},
+		},
+		.dai_num = 3,
+	},
+	{
+		.part_id = 0x8373,
+		.dais = {
+			{
+				.direction = {true, true},
+				.dai_name = "max98373-aif1",
+				.dai_type = SOC_SDW_DAI_TYPE_AMP,
+				.dailink = {SOC_SDW_AMP_OUT_DAI_ID, SOC_SDW_AMP_IN_DAI_ID},
+				.init = asoc_sdw_maxim_init,
+				.rtd_init = asoc_sdw_maxim_spk_rtd_init,
+				.controls = maxim_controls,
+				.num_controls = ARRAY_SIZE(maxim_controls),
+				.widgets = maxim_widgets,
+				.num_widgets = ARRAY_SIZE(maxim_widgets),
+			},
+		},
+		.dai_num = 1,
+	},
+	{
+		.part_id = 0x8363,
+		.dais = {
+			{
+				.direction = {true, false},
+				.dai_name = "max98363-aif1",
+				.dai_type = SOC_SDW_DAI_TYPE_AMP,
+				.dailink = {SOC_SDW_AMP_OUT_DAI_ID, SOC_SDW_UNUSED_DAI_ID},
+				.init = asoc_sdw_maxim_init,
+				.rtd_init = asoc_sdw_maxim_spk_rtd_init,
+				.controls = maxim_controls,
+				.num_controls = ARRAY_SIZE(maxim_controls),
+				.widgets = maxim_widgets,
+				.num_widgets = ARRAY_SIZE(maxim_widgets),
+			},
+		},
+		.dai_num = 1,
+	},
+	{
+		.part_id = 0x5682,
+		.dais = {
+			{
+				.direction = {true, true},
+				.dai_name = "rt5682-sdw",
+				.dai_type = SOC_SDW_DAI_TYPE_JACK,
+				.dailink = {SOC_SDW_JACK_OUT_DAI_ID, SOC_SDW_JACK_IN_DAI_ID},
+				.rtd_init = asoc_sdw_rt5682_rtd_init,
+				.controls = generic_jack_controls,
+				.num_controls = ARRAY_SIZE(generic_jack_controls),
+				.widgets = generic_jack_widgets,
+				.num_widgets = ARRAY_SIZE(generic_jack_widgets),
+			},
+		},
+		.dai_num = 1,
+	},
+	{
+		.part_id = 0x3556,
+		.dais = {
+			{
+				.direction = {true, true},
+				.dai_name = "cs35l56-sdw1",
+				.dai_type = SOC_SDW_DAI_TYPE_AMP,
+				.dailink = {SOC_SDW_AMP_OUT_DAI_ID, SOC_SDW_AMP_IN_DAI_ID},
+				.init = asoc_sdw_cs_amp_init,
+				.rtd_init = asoc_sdw_cs_spk_rtd_init,
+				.controls = generic_spk_controls,
+				.num_controls = ARRAY_SIZE(generic_spk_controls),
+				.widgets = generic_spk_widgets,
+				.num_widgets = ARRAY_SIZE(generic_spk_widgets),
+			},
+		},
+		.dai_num = 1,
+	},
+	{
+		.part_id = 0x4242,
+		.dais = {
+			{
+				.direction = {true, true},
+				.dai_name = "cs42l42-sdw",
+				.dai_type = SOC_SDW_DAI_TYPE_JACK,
+				.dailink = {SOC_SDW_JACK_OUT_DAI_ID, SOC_SDW_JACK_IN_DAI_ID},
+				.rtd_init = asoc_sdw_cs42l42_rtd_init,
+				.controls = generic_jack_controls,
+				.num_controls = ARRAY_SIZE(generic_jack_controls),
+				.widgets = generic_jack_widgets,
+				.num_widgets = ARRAY_SIZE(generic_jack_widgets),
+			},
+		},
+		.dai_num = 1,
+	},
+	{
+		.part_id = 0x4243,
+		.codec_name = "cs42l43-codec",
+		.count_sidecar = asoc_sdw_bridge_cs35l56_count_sidecar,
+		.add_sidecar = asoc_sdw_bridge_cs35l56_add_sidecar,
+		.dais = {
+			{
+				.direction = {true, false},
+				.dai_name = "cs42l43-dp5",
+				.dai_type = SOC_SDW_DAI_TYPE_JACK,
+				.dailink = {SOC_SDW_JACK_OUT_DAI_ID, SOC_SDW_UNUSED_DAI_ID},
+				.rtd_init = asoc_sdw_cs42l43_hs_rtd_init,
+				.controls = generic_jack_controls,
+				.num_controls = ARRAY_SIZE(generic_jack_controls),
+				.widgets = generic_jack_widgets,
+				.num_widgets = ARRAY_SIZE(generic_jack_widgets),
+			},
+			{
+				.direction = {false, true},
+				.dai_name = "cs42l43-dp1",
+				.dai_type = SOC_SDW_DAI_TYPE_MIC,
+				.dailink = {SOC_SDW_UNUSED_DAI_ID, SOC_SDW_DMIC_DAI_ID},
+				.rtd_init = asoc_sdw_cs42l43_dmic_rtd_init,
+				.widgets = generic_dmic_widgets,
+				.num_widgets = ARRAY_SIZE(generic_dmic_widgets),
+			},
+			{
+				.direction = {false, true},
+				.dai_name = "cs42l43-dp2",
+				.dai_type = SOC_SDW_DAI_TYPE_JACK,
+				.dailink = {SOC_SDW_UNUSED_DAI_ID, SOC_SDW_JACK_IN_DAI_ID},
+			},
+			{
+				.direction = {true, false},
+				.dai_name = "cs42l43-dp6",
+				.dai_type = SOC_SDW_DAI_TYPE_AMP,
+				.dailink = {SOC_SDW_AMP_OUT_DAI_ID, SOC_SDW_UNUSED_DAI_ID},
+				.init = asoc_sdw_cs42l43_spk_init,
+				.rtd_init = asoc_sdw_cs42l43_spk_rtd_init,
+				.controls = generic_spk_controls,
+				.num_controls = ARRAY_SIZE(generic_spk_controls),
+				.widgets = generic_spk_widgets,
+				.num_widgets = ARRAY_SIZE(generic_spk_widgets),
+				.quirk = SOC_SDW_CODEC_SPKR | SOC_SDW_SIDECAR_AMPS,
+			},
+		},
+		.dai_num = 4,
+	},
+	{
+		.part_id = 0xaaaa, /* generic codec mockup */
+		.version_id = 0,
+		.dais = {
+			{
+				.direction = {true, true},
+				.dai_name = "sdw-mockup-aif1",
+				.dai_type = SOC_SDW_DAI_TYPE_JACK,
+				.dailink = {SOC_SDW_JACK_OUT_DAI_ID, SOC_SDW_JACK_IN_DAI_ID},
+			},
+		},
+		.dai_num = 1,
+	},
+	{
+		.part_id = 0xaa55, /* headset codec mockup */
+		.version_id = 0,
+		.dais = {
+			{
+				.direction = {true, true},
+				.dai_name = "sdw-mockup-aif1",
+				.dai_type = SOC_SDW_DAI_TYPE_JACK,
+				.dailink = {SOC_SDW_JACK_OUT_DAI_ID, SOC_SDW_JACK_IN_DAI_ID},
+			},
+		},
+		.dai_num = 1,
+	},
+	{
+		.part_id = 0x55aa, /* amplifier mockup */
+		.version_id = 0,
+		.dais = {
+			{
+				.direction = {true, true},
+				.dai_name = "sdw-mockup-aif1",
+				.dai_type = SOC_SDW_DAI_TYPE_AMP,
+				.dailink = {SOC_SDW_AMP_OUT_DAI_ID, SOC_SDW_AMP_IN_DAI_ID},
+			},
+		},
+		.dai_num = 1,
+	},
+	{
+		.part_id = 0x5555,
+		.version_id = 0,
+		.dais = {
+			{
+				.dai_name = "sdw-mockup-aif1",
+				.direction = {false, true},
+				.dai_type = SOC_SDW_DAI_TYPE_MIC,
+				.dailink = {SOC_SDW_UNUSED_DAI_ID, SOC_SDW_DMIC_DAI_ID},
+			},
+		},
+		.dai_num = 1,
+	},
+};
+EXPORT_SYMBOL_NS(codec_info_list, SND_SOC_SDW_UTILS);
+
+int asoc_sdw_get_codec_info_list_count(void)
+{
+	return ARRAY_SIZE(codec_info_list);
+};
+EXPORT_SYMBOL_NS(asoc_sdw_get_codec_info_list_count, SND_SOC_SDW_UTILS);
+
+struct asoc_sdw_codec_info *asoc_sdw_find_codec_info_part(const u64 adr)
+{
+	unsigned int part_id, sdw_version;
+	int i;
+
+	part_id = SDW_PART_ID(adr);
+	sdw_version = SDW_VERSION(adr);
+	for (i = 0; i < ARRAY_SIZE(codec_info_list); i++)
+		/*
+		 * A codec info is for all sdw version with the part id if
+		 * version_id is not specified in the codec info.
+		 */
+		if (part_id == codec_info_list[i].part_id &&
+		    (!codec_info_list[i].version_id ||
+		     sdw_version == codec_info_list[i].version_id))
+			return &codec_info_list[i];
+
+	return NULL;
+}
+EXPORT_SYMBOL_NS(asoc_sdw_find_codec_info_part, SND_SOC_SDW_UTILS);
+
+struct asoc_sdw_codec_info *asoc_sdw_find_codec_info_acpi(const u8 *acpi_id)
+{
+	int i;
+
+	if (!acpi_id[0])
+		return NULL;
+
+	for (i = 0; i < ARRAY_SIZE(codec_info_list); i++)
+		if (!memcmp(codec_info_list[i].acpi_id, acpi_id, ACPI_ID_LEN))
+			return &codec_info_list[i];
+
+	return NULL;
+}
+EXPORT_SYMBOL_NS(asoc_sdw_find_codec_info_acpi, SND_SOC_SDW_UTILS);
+
+struct asoc_sdw_codec_info *asoc_sdw_find_codec_info_dai(const char *dai_name, int *dai_index)
+{
+	int i, j;
+
+	for (i = 0; i < ARRAY_SIZE(codec_info_list); i++) {
+		for (j = 0; j < codec_info_list[i].dai_num; j++) {
+			if (!strcmp(codec_info_list[i].dais[j].dai_name, dai_name)) {
+				*dai_index = j;
+				return &codec_info_list[i];
+			}
+		}
+	}
+
+	return NULL;
+}
+EXPORT_SYMBOL_NS(asoc_sdw_find_codec_info_dai, SND_SOC_SDW_UTILS);
+
+int asoc_sdw_rtd_init(struct snd_soc_pcm_runtime *rtd)
+{
+	struct snd_soc_card *card = rtd->card;
+	struct asoc_sdw_codec_info *codec_info;
+	struct snd_soc_dai *dai;
+	int dai_index;
+	int ret;
+	int i;
+
+	for_each_rtd_codec_dais(rtd, i, dai) {
+		codec_info = asoc_sdw_find_codec_info_dai(dai->name, &dai_index);
+		if (!codec_info)
+			return -EINVAL;
+
+		/*
+		 * A codec dai can be connected to different dai links for capture and playback,
+		 * but we only need to call the rtd_init function once.
+		 * The rtd_init for each codec dai is independent. So, the order of rtd_init
+		 * doesn't matter.
+		 */
+		if (codec_info->dais[dai_index].rtd_init_done)
+			continue;
+
+		/*
+		 * Add card controls and dapm widgets for the first codec dai.
+		 * The controls and widgets will be used for all codec dais.
+		 */
+
+		if (i > 0)
+			goto skip_add_controls_widgets;
+
+		if (codec_info->dais[dai_index].controls) {
+			ret = snd_soc_add_card_controls(card, codec_info->dais[dai_index].controls,
+							codec_info->dais[dai_index].num_controls);
+			if (ret) {
+				dev_err(card->dev, "%#x controls addition failed: %d\n",
+					codec_info->part_id, ret);
+				return ret;
+			}
+		}
+		if (codec_info->dais[dai_index].widgets) {
+			ret = snd_soc_dapm_new_controls(&card->dapm,
+							codec_info->dais[dai_index].widgets,
+							codec_info->dais[dai_index].num_widgets);
+			if (ret) {
+				dev_err(card->dev, "%#x widgets addition failed: %d\n",
+					codec_info->part_id, ret);
+				return ret;
+			}
+		}
+
+skip_add_controls_widgets:
+		if (codec_info->dais[dai_index].rtd_init) {
+			ret = codec_info->dais[dai_index].rtd_init(rtd, dai);
+			if (ret)
+				return ret;
+		}
+		codec_info->dais[dai_index].rtd_init_done = true;
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_NS(asoc_sdw_rtd_init, SND_SOC_SDW_UTILS);
+
 /* these wrappers are only needed to avoid typecast compilation errors */
 int asoc_sdw_startup(struct snd_pcm_substream *substream)
 {
-- 
2.34.1

