Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (unknown [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 023A39446D1
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Aug 2024 10:42:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8E5AC3491;
	Thu,  1 Aug 2024 10:42:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8E5AC3491
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722501756;
	bh=wn3Jq4xtXK/6EdLFmKyHGMbG0b6DR9OJpXRhch1t0b8=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=pafjWPiVq8EJhZpmOiboBcYW2yGTlMrZxtuXDeSUbsw9ggBV0ecWNdW+izd8Nc0pH
	 wiMdLSnec6PaeG4v0ZEuXIVo0oHK7dUvX1aHztuTUzhkEqh1wxe10rkTBkrji7AX5I
	 J+kPZdWb+ndgFVmY2FKDH04g23cY2L7cecT1eiXY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 89FB6F805E2; Thu,  1 Aug 2024 10:41:49 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8EB9DF805E6;
	Thu,  1 Aug 2024 10:41:49 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B903DF8026A; Thu,  1 Aug 2024 08:28:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on20611.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:240a::611])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E006BF8019B
	for <alsa-devel@alsa-project.org>; Thu,  1 Aug 2024 08:28:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E006BF8019B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=5J6OjXLK
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=md+2bVvMUrpXNAt64baKRiSrYk9PnXoKanbOzgrmuMQS4vR0t7D4jeUsqPdMlN9b6UZZeuglErZbnKaR6nJuvezvb4LV1WBjV7lrXXsf5kdKCCR3PAeVAkWLDI2Y6j9ryvcVxlrcWhGhWieqBlz0bGrZm98w+Dk+TERnI7hTTM8F8Gq2Z5FPYVxQpwZTaA+wRMfnG1jhypHNAKJHRXUEGHyHzXDi67EA+Lu9cqyQ2/vkUaXtB2P/a2oHqDE0c1vKNPdnCxe5ybr0b9kWglXnaIr69/DcRqjMoYYqwmsnwOiA9QydkyItIRz58MwVoJuXO6VOQG5xSyE7N5ku1pOP0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n32lpJGaVISCUycsy6PmNSawqp2e9DMRtw/J5CxqmaM=;
 b=UcZVYIl7RcGksYwHACCAwSCf23VNeUpSSWlBOthDOU0Hh3CpXZRpezrsuoepPBKn1oAsEehHFrhsevkg6qWmOtCwA1ztSN5RZwcXp/IzxBLoPr/DKhU67CM9kJuKHgMe8mjLXyKf50/irGKxlWRIElSPsmNJ1RvKR8VaDDKpzEgf2CZr7Mqm2/VtAVMy097OFlNK24xuyOBlBtFGCfw5dC4F19KH4BUy27nXSXuZU5Qn+QkFtsQloYCsW6PoTdpxjutfXwUjrR4hFz9wqMzJqaBQNzAVjYRhkRhGuQOzQCnwRmOUUiy3It+2yY4uU5849Mgaht1ShwXcg+oJhBbtPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n32lpJGaVISCUycsy6PmNSawqp2e9DMRtw/J5CxqmaM=;
 b=5J6OjXLKXhENlnyNe8dGsTXHbNeWJ9dKvorLLOIl9RkWXPwYi6vR4gs2xUdbkEtn5yrm8vvxb74odmp6ebWBRDfb7Ks2zC30jYS7hRz1quubAkxrrSuvHpjqExSielZOQe2ml9PYKVJjNl6XJ9UHXctdkgmgNNqjBVO+A03Gu9I=
Received: from MN2PR12CA0026.namprd12.prod.outlook.com (2603:10b6:208:a8::39)
 by CH3PR12MB7641.namprd12.prod.outlook.com (2603:10b6:610:150::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.33; Thu, 1 Aug
 2024 06:28:46 +0000
Received: from MN1PEPF0000F0E4.namprd04.prod.outlook.com
 (2603:10b6:208:a8:cafe::8e) by MN2PR12CA0026.outlook.office365.com
 (2603:10b6:208:a8::39) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.22 via Frontend
 Transport; Thu, 1 Aug 2024 06:28:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 MN1PEPF0000F0E4.mail.protection.outlook.com (10.167.242.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7828.19 via Frontend Transport; Thu, 1 Aug 2024 06:28:46 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 1 Aug
 2024 01:28:45 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 1 Aug
 2024 01:28:45 -0500
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39
 via Frontend Transport; Thu, 1 Aug 2024 01:28:39 -0500
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>
CC: <alsa-devel@alsa-project.org>, <yung-chuan.liao@linux.intel.com>,
	<pierre-louis.bossart@linux.intel.com>, <Basavaraj.Hiregoudar@amd.com>,
	<Sunil-kumar.Dommati@amd.com>, <venkataprasad.potturu@amd.com>, "Vijendar
 Mukunda" <Vijendar.Mukunda@amd.com>, Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, "Cezary
 Rojewski" <cezary.rojewski@intel.com>, Peter Ujfalusi
	<peter.ujfalusi@linux.intel.com>, Ranjani Sridharan
	<ranjani.sridharan@linux.intel.com>, Kai Vehmanen
	<kai.vehmanen@linux.intel.com>, Brent Lu <brent.lu@intel.com>, Charles Keepax
	<ckeepax@opensource.cirrus.com>, Maciej Strozek
	<mstrozek@opensource.cirrus.com>, Chao Song <chao.song@linux.intel.com>,
	"open list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
	<linux-sound@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Subject: [PATCH 10/31] ASoC: intel/sdw_utils: move dmic codec helper function
Date: Thu, 1 Aug 2024 11:53:55 +0530
Message-ID: <20240801062416.2203673-11-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240801062416.2203673-1-Vijendar.Mukunda@amd.com>
References: <20240801062416.2203673-1-Vijendar.Mukunda@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: Vijendar.Mukunda@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0E4:EE_|CH3PR12MB7641:EE_
X-MS-Office365-Filtering-Correlation-Id: a4a3178d-510e-40c3-9583-08dcb1f33271
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|82310400026|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?R+tHkucs4LfgzOaoCuwUEy2+trHF1Td7MsKFeslPD9m0+WcYjzJAPRCwRW4U?=
 =?us-ascii?Q?KfE4I+Yd8wPvagIUPjfoqWB0SXg8qx6ywUjzG+yKzEWSf+5bp9fdN8XITwRD?=
 =?us-ascii?Q?MDr+6xaba0AAHefOmRsq1jgB5hPWlgHc2EQ6E64hvaFaZOnKb9fYuhJIyDCC?=
 =?us-ascii?Q?e8vqgn06DuWZ5dFAoZnR0Zi9MiVd3b2NJWZNWDZ+r1qg5k42CAPsa55uK6gB?=
 =?us-ascii?Q?JRtzRZfFf+XCYv8f0H0bEm0efdS+lRGahOcqoOPXn+g4VxjjqhBLq+o4Tw5R?=
 =?us-ascii?Q?XvPK+GE5/++1G2UN9EMLk3DVyJUJfkkWDJDTY6rU8Y2x9FSnVtLptce6OC55?=
 =?us-ascii?Q?u43HFVjRylS74qp9HnN4KriBo5q1YJ+X2+q+FMPmRNvLm/8s9pKM9ShjVl+b?=
 =?us-ascii?Q?9bMRth5/fhvOpdb+Y0DiKPqDvORBqLTq6oqA76yq3CJ+C8pPLCaJ3u+6yOAI?=
 =?us-ascii?Q?eU969Yl8Y5b6AHgoTsZlROJ+YpeBHZiv5AbZeKky/ENcW4Vvix7G4jc8c2ad?=
 =?us-ascii?Q?CLV9HOupE0ggNd5YAPgjyGCMBnDaELr2nz8YiWlBgsft0imS+K2tGVvD55qu?=
 =?us-ascii?Q?4zfsAvfZZdTwheiKuTI+s0fEfo2YCjMoiQIdto+Blhjoc/3o9/2Gw6rAJ9jy?=
 =?us-ascii?Q?oXKYkqIE4NzRj8y8V5QFCJcJLi9NmIxplmD9Gm/Sdj6IE70heIuTOksR7pcm?=
 =?us-ascii?Q?HdhmTIVKz3G8pWVMzDYcDebS/zRw7j+I+r844oFlwaVReD26V3giQ9BsnYji?=
 =?us-ascii?Q?imwHucNZmyIpGA9/eCs3Nwv5E9PVrWK2EDnGwdSp1wdxHumRn4j55fpdxvVO?=
 =?us-ascii?Q?VkZa3IoQyphr49HLDP1+Y83YbydSWRVQzmahWXe4sctyDpaM/YjC1EGvue+2?=
 =?us-ascii?Q?oKmUc8yGDoNlK5mC6JKUlub3aGfeWqZKBkIO8s2RrkGV5qmQiXReEoiQneqk?=
 =?us-ascii?Q?8a9CKMFEj/zxFLFKyrUfDnUz67VBs9ICaYBMt5SP5ZOIjwDVNeQKIF6pvqNJ?=
 =?us-ascii?Q?pZTT/pduVUHpvgIHuqHEi1yLqH/5OGLUEraJq1Vzgw884MmY4nI44CZ64PIT?=
 =?us-ascii?Q?aik8ezzVzwyrzAY37GVNaCUjHM/dIOPWpHICYvnd/BAg5LWvwW48fAydyfU3?=
 =?us-ascii?Q?r6wNkRcd0xvBbefaNdq9XNAA8d7fwV5sH2XKmpZ9KBWtQHtmCpojlOpZzBH5?=
 =?us-ascii?Q?STcSBympeRYu3xPAmLMw0Vm+1zidOkBWmxQzUUctiVjf09CoxDOo73QpW00r?=
 =?us-ascii?Q?OoFXQ84EaquLMHyZXaRp0L6PaVv1Wief9bfRfDKdJvEJouY9Bn4ptm40rDZ0?=
 =?us-ascii?Q?opAWB4P8AXDeetsTYgTXO3/17Mmas29Gjz5ADSuURuSJDISJ3ww69I3vbLCp?=
 =?us-ascii?Q?N+CrdSvUWSSwwKeeE98711w7mRpvub4dQv0PCq49/iztCTynHg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(7416014)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2024 06:28:46.0616
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 a4a3178d-510e-40c3-9583-08dcb1f33271
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	MN1PEPF0000F0E4.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7641
Message-ID-Hash: T7CMW64JDKYCH4RV45CS733TC4DOSVRS
X-Message-ID-Hash: T7CMW64JDKYCH4RV45CS733TC4DOSVRS
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/T7CMW64JDKYCH4RV45CS733TC4DOSVRS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Move generic dmic codec helper function implementation to
sdw_utils folder so that this function can be used by other platform
machine drivers.

Link: https://github.com/thesofproject/linux/pull/5068
Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 include/sound/soc_sdw_utils.h                             | 4 ++++
 sound/soc/intel/boards/Makefile                           | 1 -
 sound/soc/intel/boards/sof_sdw_common.h                   | 3 ---
 sound/soc/sdw_utils/Makefile                              | 2 +-
 .../boards/sof_sdw_dmic.c => sdw_utils/soc_sdw_dmic.c}    | 8 +++++---
 5 files changed, 10 insertions(+), 8 deletions(-)
 rename sound/soc/{intel/boards/sof_sdw_dmic.c => sdw_utils/soc_sdw_dmic.c} (76%)

diff --git a/include/sound/soc_sdw_utils.h b/include/sound/soc_sdw_utils.h
index 7ca3a6afdfb1..0ffbd9847532 100644
--- a/include/sound/soc_sdw_utils.h
+++ b/include/sound/soc_sdw_utils.h
@@ -68,4 +68,8 @@ const char *asoc_sdw_get_codec_name(struct device *dev,
 				    const struct asoc_sdw_codec_info *codec_info,
 				    const struct snd_soc_acpi_link_adr *adr_link,
 				    int adr_index);
+
+/* DMIC support */
+int asoc_sdw_dmic_init(struct snd_soc_pcm_runtime *rtd);
+
 #endif
diff --git a/sound/soc/intel/boards/Makefile b/sound/soc/intel/boards/Makefile
index dc6fe110f279..8ac6f7b5fbee 100644
--- a/sound/soc/intel/boards/Makefile
+++ b/sound/soc/intel/boards/Makefile
@@ -43,7 +43,6 @@ snd-soc-sof-sdw-y += sof_sdw.o				\
 			sof_sdw_rt_dmic.o			\
 			sof_sdw_cs42l42.o sof_sdw_cs42l43.o	\
 			sof_sdw_cs_amp.o			\
-			sof_sdw_dmic.o				\
 			sof_sdw_hdmi.o
 obj-$(CONFIG_SND_SOC_INTEL_SOF_RT5682_MACH) += snd-soc-sof_rt5682.o
 obj-$(CONFIG_SND_SOC_INTEL_SOF_CS42L42_MACH) += snd-soc-sof_cs42l42.o
diff --git a/sound/soc/intel/boards/sof_sdw_common.h b/sound/soc/intel/boards/sof_sdw_common.h
index 688cbc3afb29..81b654407651 100644
--- a/sound/soc/intel/boards/sof_sdw_common.h
+++ b/sound/soc/intel/boards/sof_sdw_common.h
@@ -97,9 +97,6 @@ int sof_sdw_hdmi_init(struct snd_soc_pcm_runtime *rtd);
 
 int sof_sdw_hdmi_card_late_probe(struct snd_soc_card *card);
 
-/* DMIC support */
-int asoc_sdw_dmic_init(struct snd_soc_pcm_runtime *rtd);
-
 /* RT711 support */
 int asoc_sdw_rt711_init(struct snd_soc_card *card,
 			struct snd_soc_dai_link *dai_links,
diff --git a/sound/soc/sdw_utils/Makefile b/sound/soc/sdw_utils/Makefile
index 29b2852be287..de8aff8744d8 100644
--- a/sound/soc/sdw_utils/Makefile
+++ b/sound/soc/sdw_utils/Makefile
@@ -1,3 +1,3 @@
 # SPDX-License-Identifier: GPL-2.0-only
-snd-soc-sdw-utils-y := soc_sdw_utils.o
+snd-soc-sdw-utils-y := soc_sdw_utils.o soc_sdw_dmic.o
 obj-$(CONFIG_SND_SOC_SDW_UTILS) += snd-soc-sdw-utils.o
diff --git a/sound/soc/intel/boards/sof_sdw_dmic.c b/sound/soc/sdw_utils/soc_sdw_dmic.c
similarity index 76%
rename from sound/soc/intel/boards/sof_sdw_dmic.c
rename to sound/soc/sdw_utils/soc_sdw_dmic.c
index d9f2e072f401..fc2aae985084 100644
--- a/sound/soc/intel/boards/sof_sdw_dmic.c
+++ b/sound/soc/sdw_utils/soc_sdw_dmic.c
@@ -1,14 +1,16 @@
 // SPDX-License-Identifier: GPL-2.0-only
+// This file incorporates work covered by the following copyright notice:
 // Copyright (c) 2020 Intel Corporation
+// Copyright (c) 2024 Advanced Micro Devices, Inc.
 
 /*
- *  sof_sdw_dmic - Helpers to handle dmic from generic machine driver
+ *  soc_sdw_dmic - Helpers to handle dmic from generic machine driver
  */
 
 #include <sound/soc.h>
 #include <sound/soc-acpi.h>
 #include <sound/soc-dapm.h>
-#include "sof_sdw_common.h"
+#include <sound/soc_sdw_utils.h>
 
 static const struct snd_soc_dapm_widget dmic_widgets[] = {
 	SND_SOC_DAPM_MIC("SoC DMIC", NULL),
@@ -40,4 +42,4 @@ int asoc_sdw_dmic_init(struct snd_soc_pcm_runtime *rtd)
 
 	return ret;
 }
-
+EXPORT_SYMBOL_NS(asoc_sdw_dmic_init, SND_SOC_SDW_UTILS);
-- 
2.34.1

