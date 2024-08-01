Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (unknown [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B5CE79446E6
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Aug 2024 10:44:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6B6A33529;
	Thu,  1 Aug 2024 10:44:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6B6A33529
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722501876;
	bh=xij3naBl87+OREF9dc9kTrO34TLDnQQpaz8qw7uMZ1s=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=IvL/9VHD0PTmv0rvf47xshcw/JfCpSngw4+eCHnYDV3QC6IDQYSFiVjayDsBzOnrr
	 BOT2ywTQqJbS5JpczNXLPV8eRHhjehlAOtYEKCzVcj13++41tZtlJx5LZbA5R+m63t
	 RtG50ZRc0NPVXYGWknU3Cz+Dw+LCUmsq2w6rcUwc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 664F7F80614; Thu,  1 Aug 2024 10:43:33 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DFD8AF80614;
	Thu,  1 Aug 2024 10:43:32 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 48822F8026A; Thu,  1 Aug 2024 08:31:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20600.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2412::600])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8FD6FF8019B
	for <alsa-devel@alsa-project.org>; Thu,  1 Aug 2024 08:30:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8FD6FF8019B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=TzIwWX/+
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bKX/m+VXcOzuVre6GN9i05gcHfAu5ElDJuzpaCs5j9mUo1gQZQ6Vc4JaIWz2BrQ7+Bn+j13VDj3FYTmXoamHkF1UCUE2/GOIBVchjXb1AiI1AE7djZVl7uqDUaxXKHtBCcPS2yetFWRI28v2k3grTgPtoeyfLzRxun9x3d4oYm9VAz59WwdTuGcotaR1aFb/V4TsYSSNHjenmHPlCF0I7R/KywY5okLfi5LS8GBl4+rj2rRBc7xlreSWyxBlTQuB9n62GjJlsC4Ko7rRFkeSG2V0oQtUT4YEpY+WkwWkCVofszkF6U61NxwHXexOm2NkT/GpTqVIq8IRbL6RmPP4Hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R4NJX/xVdvB3sXXMqg8vz7h4Q1OLf3RVEKnXa41Cz+c=;
 b=jBYNlwC6v5pWbq7btQ5KlMteRibh+bu5WYCgyrhromz9rWKhNoTVkiZgvupFBnjcoi1IU+L2gxOVKFz0yq4wnHWzveb9idio/8YlW8Ryf0AsOAiSW7+RVJmTiFlZj2SK9F1fDnU1lPcNUoveXE2amoTfgjjMyqKlGzMESIEHZVEjR97uRGktB9uPY7GXbW5jGjnxGxPd/JVrLaQ76jm1ZmVHdCvVMHGHzS3z6GNmsQlpOCfKcDHOQKYIJ2atVku8S8orbvW2PQfFsll0gaSwP4FPYRhoH4jrFjqnj8IaG5EBajCalJprDMNTFHhmFKrrd4PjjUzEIgZdOwYCDTyHiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R4NJX/xVdvB3sXXMqg8vz7h4Q1OLf3RVEKnXa41Cz+c=;
 b=TzIwWX/++MUF2E899J8L7/Gh503Dhpi9wYMe+32XMGbR5XyyscllCxC4ggaNT/zgneWgR/o0Aopw7I/2JTR5UvxsDDqXxwzfVJ/BfK4j9aIAmLfX0Kgsjm5BTJ+8U/eNtu62p0I5NETwE90kF2E3YTZSn7T2zQNjMg9l589/Ud0=
Received: from SJ0PR03CA0261.namprd03.prod.outlook.com (2603:10b6:a03:3a0::26)
 by MN2PR12MB4270.namprd12.prod.outlook.com (2603:10b6:208:1d9::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.21; Thu, 1 Aug
 2024 06:30:47 +0000
Received: from SJ5PEPF00000204.namprd05.prod.outlook.com
 (2603:10b6:a03:3a0:cafe::48) by SJ0PR03CA0261.outlook.office365.com
 (2603:10b6:a03:3a0::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.22 via Frontend
 Transport; Thu, 1 Aug 2024 06:30:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SJ5PEPF00000204.mail.protection.outlook.com (10.167.244.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7828.19 via Frontend Transport; Thu, 1 Aug 2024 06:30:46 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 1 Aug
 2024 01:30:45 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 1 Aug
 2024 01:30:44 -0500
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39
 via Frontend Transport; Thu, 1 Aug 2024 01:30:38 -0500
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
	<kai.vehmanen@linux.intel.com>, Charles Keepax
	<ckeepax@opensource.cirrus.com>, Maciej Strozek
	<mstrozek@opensource.cirrus.com>, Chao Song <chao.song@linux.intel.com>,
	Rander Wang <rander.wang@intel.com>, Kuninori Morimoto
	<kuninori.morimoto.gx@renesas.com>, jairaj-arava <jairaj.arava@intel.com>,
	Brent Lu <brent.lu@intel.com>, Christophe JAILLET
	<christophe.jaillet@wanadoo.fr>, "open list:SOUND - SOC LAYER / DYNAMIC AUDIO
 POWER MANAGEM..." <linux-sound@vger.kernel.org>, open list
	<linux-kernel@vger.kernel.org>
Subject: [PATCH 14/31] ASoC: intel: split soundwire machine driver private
 data
Date: Thu, 1 Aug 2024 11:53:59 +0530
Message-ID: <20240801062416.2203673-15-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF00000204:EE_|MN2PR12MB4270:EE_
X-MS-Office365-Filtering-Correlation-Id: 9eb18fab-72dc-4baa-7acd-08dcb1f37a3f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014|7416014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?hFZh2+HBjt+22bgGoSOKlPmCkMGk5p0vAy3zymaJiF1zN20T+GHhvtUBkv4M?=
 =?us-ascii?Q?G1961Be9fFELjDtzXo7teCgNv4+QP0CHGKhtbqz0oshJLTGUW4YPVsDWQLKQ?=
 =?us-ascii?Q?WQ+c4D2fuzrvync/MudQi41/VojDQJh5J97N5/HytZrNwIdxBFZB3EoUwPkE?=
 =?us-ascii?Q?ljPKuC4psLUNoCRrlSAoUdZPKKVlAQgtO+gvuznySFiis1G5ZfSd3cKKR4au?=
 =?us-ascii?Q?CueHPLxw8Kh8AOq7XeTtpQX87oyh64iHEwrfuQAq1/H0PVviD6mDijM/u6kQ?=
 =?us-ascii?Q?LJGt11Cp+kNqEpvn8e4h/uNcT5IoGL3+TGdiKI+iUUPH1VE7kS7PVnt98uXE?=
 =?us-ascii?Q?8ac+8XjN7HEFDoS3QT1RY8mB8fpUKv+ETtcusiqs0kvWQnfpxi+w88VSnXyk?=
 =?us-ascii?Q?K2GzTttJkbjDjTz31iexphk9Jii5cSwpcHTz4sl/7Du/Hjw53AsIzCdnW0W5?=
 =?us-ascii?Q?8ajgYo9jn/ubI80NTnQIN1YHd7qXw0CvL3AwM1buXb9bF6UirP/UdfwBX8DF?=
 =?us-ascii?Q?OJJbkCA1aO66CfAyggPHUwxbXFmEeMMA8Y2ic3ROBKIqQ0+fsLpOOcMI/NED?=
 =?us-ascii?Q?6+R2JNpuUu+dZJ/XBSLGfAwiBW9Rwp0JaAgoJqxRLPFBo9z9yHchb4HgabBl?=
 =?us-ascii?Q?eGRP+lpp/tVKeTMBPqbo26SlJd9xvghnNE8lKcXAy0CPXPHXHtAKfPOks9eN?=
 =?us-ascii?Q?k9IJe3xXOwBJu8m4nFKBxoQEhkjBDBmQu/ofkT3SKb2of7inIwr6hac48F1d?=
 =?us-ascii?Q?Gc5LRG2UEUHPktl4RIO+9S4LKsMNtxxWa46eneK7Ep2Pcfs324qQIxM+pXib?=
 =?us-ascii?Q?5KEfmGdegw83nfZ7l99/6qFhlHyCsXp6qMfIgopksL4SLJCTOzHOw29zZ63u?=
 =?us-ascii?Q?ezeoEovZEaWlkdAp//CkhdGGo8s8gZAI+qBQBdJJSI+oF7cp2VxnqkS5djY/?=
 =?us-ascii?Q?6FeS8fBkF3zxQIEk+0itlfuQDC+E/pbI9dpQkxrk3iA8hfIVx0ZmHTXfxJQf?=
 =?us-ascii?Q?vm9tbIKGFuXMkt5LfSslpGg/Vww6T1cwDl+RhOcaEAsd/W/smWGEboBL8H5L?=
 =?us-ascii?Q?JebXvXFBT9kYkUfvXZURLOjFRkTLXSIUHWRAU7uZH+WVJrYK/ojjKun00kAQ?=
 =?us-ascii?Q?YQ3nPdNyODGlwydV/qcre9ChYRKOIlXDvvSHEua/dLkmMZ0LQZE1EVdw4j0i?=
 =?us-ascii?Q?NNfeolhNBqMEwKAZklhnGKd+BJeqN210l04ffK2IgOkvwRbZDjuoBaZ3HsnV?=
 =?us-ascii?Q?cu8OsfLTlQk2htS8/mu5VISlwv7ejKBRr5unwKvlgmleRIjw2vs9bcbZDT6/?=
 =?us-ascii?Q?IZrbdWdXBBRfe1yCEZxjqv6eQuFBySa5v3ltnViTGqZaawmdy2hbCoN+Wc5m?=
 =?us-ascii?Q?DUoAxiq5n2XF+wlQUXlW5khp7EGbDSW83Sxokvq+oSzPFFojWg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014)(7416014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2024 06:30:46.4511
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 9eb18fab-72dc-4baa-7acd-08dcb1f37a3f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ5PEPF00000204.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4270
Message-ID-Hash: WXA27DDFB4U6JPKUIC6KA6QZGPA3KRG5
X-Message-ID-Hash: WXA27DDFB4U6JPKUIC6KA6QZGPA3KRG5
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WXA27DDFB4U6JPKUIC6KA6QZGPA3KRG5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Split intel generic SoundWire machine driver private data into two
structures. One structure is generic one which can be used by other
platform machine driver and the other one is intel specific one.
Move generic machine driver private data to soc_sdw_utils.h.
Define a void pointer in generic machine driver private data structure
and assign the vendor specific structure in mc_probe() call.

Link: https://github.com/thesofproject/linux/pull/5068
Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 include/sound/soc_sdw_utils.h                 | 10 +++++
 sound/soc/intel/boards/sof_sdw.c              | 37 ++++++++++++-------
 sound/soc/intel/boards/sof_sdw_common.h       |  8 +---
 sound/soc/intel/boards/sof_sdw_cs42l42.c      |  2 +-
 sound/soc/intel/boards/sof_sdw_cs42l43.c      |  2 +-
 sound/soc/intel/boards/sof_sdw_hdmi.c         | 14 ++++---
 sound/soc/intel/boards/sof_sdw_rt5682.c       |  2 +-
 sound/soc/intel/boards/sof_sdw_rt700.c        |  2 +-
 sound/soc/intel/boards/sof_sdw_rt711.c        |  6 +--
 sound/soc/intel/boards/sof_sdw_rt_amp.c       |  4 +-
 .../boards/sof_sdw_rt_sdca_jack_common.c      |  6 +--
 11 files changed, 55 insertions(+), 38 deletions(-)

diff --git a/include/sound/soc_sdw_utils.h b/include/sound/soc_sdw_utils.h
index 5bc2a89bced4..eb713cdf4079 100644
--- a/include/sound/soc_sdw_utils.h
+++ b/include/sound/soc_sdw_utils.h
@@ -55,6 +55,16 @@ struct asoc_sdw_codec_info {
 			    struct snd_soc_codec_conf **codec_conf);
 };
 
+struct asoc_sdw_mc_private {
+	struct snd_soc_card card;
+	struct snd_soc_jack sdw_headset;
+	struct device *headset_codec_dev; /* only one headset per card */
+	struct device *amp_dev1, *amp_dev2;
+	bool append_dai_type;
+	bool ignore_internal_dmic;
+	void *private;
+};
+
 int asoc_sdw_startup(struct snd_pcm_substream *substream);
 int asoc_sdw_prepare(struct snd_pcm_substream *substream);
 int asoc_sdw_prepare(struct snd_pcm_substream *substream);
diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index e1d2b744987f..236e3fab66b9 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -1319,7 +1319,7 @@ static int parse_sdw_endpoints(struct snd_soc_card *card,
 			       int *num_devs)
 {
 	struct device *dev = card->dev;
-	struct mc_private *ctx = snd_soc_card_get_drvdata(card);
+	struct asoc_sdw_mc_private *ctx = snd_soc_card_get_drvdata(card);
 	struct snd_soc_acpi_mach *mach = dev_get_platdata(dev);
 	struct snd_soc_acpi_mach_params *mach_params = &mach->mach_params;
 	const struct snd_soc_acpi_link_adr *adr_link;
@@ -1440,7 +1440,8 @@ static int create_sdw_dailink(struct snd_soc_card *card,
 			      int *be_id, struct snd_soc_codec_conf **codec_conf)
 {
 	struct device *dev = card->dev;
-	struct mc_private *ctx = snd_soc_card_get_drvdata(card);
+	struct asoc_sdw_mc_private *ctx = snd_soc_card_get_drvdata(card);
+	struct intel_mc_ctx *intel_ctx = (struct intel_mc_ctx *)ctx->private;
 	struct sof_sdw_endpoint *sof_end;
 	int stream;
 	int ret;
@@ -1519,7 +1520,7 @@ static int create_sdw_dailink(struct snd_soc_card *card,
 
 			if (cur_link != sof_end->link_mask) {
 				int link_num = ffs(sof_end->link_mask) - 1;
-				int pin_num = ctx->sdw_pin_index[link_num]++;
+				int pin_num = intel_ctx->sdw_pin_index[link_num]++;
 
 				cur_link = sof_end->link_mask;
 
@@ -1573,11 +1574,12 @@ static int create_sdw_dailinks(struct snd_soc_card *card,
 			       struct sof_sdw_dailink *sof_dais,
 			       struct snd_soc_codec_conf **codec_conf)
 {
-	struct mc_private *ctx = snd_soc_card_get_drvdata(card);
+	struct asoc_sdw_mc_private *ctx = snd_soc_card_get_drvdata(card);
+	struct intel_mc_ctx *intel_ctx = (struct intel_mc_ctx *)ctx->private;
 	int ret, i;
 
 	for (i = 0; i < SDW_MAX_LINKS; i++)
-		ctx->sdw_pin_index[i] = SOC_SDW_INTEL_BIDIR_PDI_BASE;
+		intel_ctx->sdw_pin_index[i] = SOC_SDW_INTEL_BIDIR_PDI_BASE;
 
 	/* generate DAI links by each sdw link */
 	while (sof_dais->initialised) {
@@ -1665,7 +1667,8 @@ static int create_hdmi_dailinks(struct snd_soc_card *card,
 				int hdmi_num)
 {
 	struct device *dev = card->dev;
-	struct mc_private *ctx = snd_soc_card_get_drvdata(card);
+	struct asoc_sdw_mc_private *ctx = snd_soc_card_get_drvdata(card);
+	struct intel_mc_ctx *intel_ctx = (struct intel_mc_ctx *)ctx->private;
 	int i, ret;
 
 	for (i = 0; i < hdmi_num; i++) {
@@ -1673,7 +1676,7 @@ static int create_hdmi_dailinks(struct snd_soc_card *card,
 		char *cpu_dai_name = devm_kasprintf(dev, GFP_KERNEL, "iDisp%d Pin", i + 1);
 		char *codec_name, *codec_dai_name;
 
-		if (ctx->hdmi.idisp_codec) {
+		if (intel_ctx->hdmi.idisp_codec) {
 			codec_name = "ehdaudio0D2";
 			codec_dai_name = devm_kasprintf(dev, GFP_KERNEL,
 							"intel-hdmi-hifi%d", i + 1);
@@ -1721,7 +1724,8 @@ static int sof_card_dai_links_create(struct snd_soc_card *card)
 	struct device *dev = card->dev;
 	struct snd_soc_acpi_mach *mach = dev_get_platdata(card->dev);
 	int sdw_be_num = 0, ssp_num = 0, dmic_num = 0, bt_num = 0;
-	struct mc_private *ctx = snd_soc_card_get_drvdata(card);
+	struct asoc_sdw_mc_private *ctx = snd_soc_card_get_drvdata(card);
+	struct intel_mc_ctx *intel_ctx = (struct intel_mc_ctx *)ctx->private;
 	struct snd_soc_acpi_mach_params *mach_params = &mach->mach_params;
 	struct snd_soc_codec_conf *codec_conf;
 	struct asoc_sdw_codec_info *ssp_info;
@@ -1773,7 +1777,7 @@ static int sof_card_dai_links_create(struct snd_soc_card *card)
 	}
 
 	if (mach_params->codec_mask & IDISP_CODEC_MASK)
-		ctx->hdmi.idisp_codec = true;
+		intel_ctx->hdmi.idisp_codec = true;
 
 	if (sof_sdw_quirk & SOF_SDW_TGL_HDMI)
 		hdmi_num = SOF_TGL_HDMI_COUNT;
@@ -1789,7 +1793,7 @@ static int sof_card_dai_links_create(struct snd_soc_card *card)
 
 	dev_dbg(dev, "sdw %d, ssp %d, dmic %d, hdmi %d, bt: %d\n",
 		sdw_be_num, ssp_num, dmic_num,
-		ctx->hdmi.idisp_codec ? hdmi_num : 0, bt_num);
+		intel_ctx->hdmi.idisp_codec ? hdmi_num : 0, bt_num);
 
 	codec_conf = devm_kcalloc(dev, num_devs, sizeof(*codec_conf), GFP_KERNEL);
 	if (!codec_conf) {
@@ -1862,7 +1866,8 @@ static int sof_card_dai_links_create(struct snd_soc_card *card)
 
 static int sof_sdw_card_late_probe(struct snd_soc_card *card)
 {
-	struct mc_private *ctx = snd_soc_card_get_drvdata(card);
+	struct asoc_sdw_mc_private *ctx = snd_soc_card_get_drvdata(card);
+	struct intel_mc_ctx *intel_ctx = (struct intel_mc_ctx *)ctx->private;
 	int ret = 0;
 	int i;
 
@@ -1875,7 +1880,7 @@ static int sof_sdw_card_late_probe(struct snd_soc_card *card)
 		}
 	}
 
-	if (ctx->hdmi.idisp_codec)
+	if (intel_ctx->hdmi.idisp_codec)
 		ret = sof_sdw_hdmi_card_late_probe(card);
 
 	return ret;
@@ -1934,16 +1939,22 @@ static int mc_probe(struct platform_device *pdev)
 {
 	struct snd_soc_acpi_mach *mach = dev_get_platdata(&pdev->dev);
 	struct snd_soc_card *card;
-	struct mc_private *ctx;
+	struct asoc_sdw_mc_private *ctx;
+	struct intel_mc_ctx *intel_ctx;
 	int amp_num = 0, i;
 	int ret;
 
 	dev_dbg(&pdev->dev, "Entry\n");
 
+	intel_ctx = devm_kzalloc(&pdev->dev, sizeof(*intel_ctx), GFP_KERNEL);
+	if (!intel_ctx)
+		return -ENOMEM;
+
 	ctx = devm_kzalloc(&pdev->dev, sizeof(*ctx), GFP_KERNEL);
 	if (!ctx)
 		return -ENOMEM;
 
+	ctx->private = intel_ctx;
 	card = &ctx->card;
 	card->dev = &pdev->dev;
 	card->name = "soundwire";
diff --git a/sound/soc/intel/boards/sof_sdw_common.h b/sound/soc/intel/boards/sof_sdw_common.h
index c7672dc1320c..7954472c11bb 100644
--- a/sound/soc/intel/boards/sof_sdw_common.h
+++ b/sound/soc/intel/boards/sof_sdw_common.h
@@ -78,16 +78,10 @@ enum {
 #define SOC_SDW_DAI_TYPE_AMP		1
 #define SOC_SDW_DAI_TYPE_MIC		2
 
-struct mc_private {
-	struct snd_soc_card card;
-	struct snd_soc_jack sdw_headset;
+struct intel_mc_ctx {
 	struct sof_hdmi_private hdmi;
-	struct device *headset_codec_dev; /* only one headset per card */
-	struct device *amp_dev1, *amp_dev2;
 	/* To store SDW Pin index for each SoundWire link */
 	unsigned int sdw_pin_index[SDW_MAX_LINKS];
-	bool append_dai_type;
-	bool ignore_internal_dmic;
 };
 
 extern unsigned long sof_sdw_quirk;
diff --git a/sound/soc/intel/boards/sof_sdw_cs42l42.c b/sound/soc/intel/boards/sof_sdw_cs42l42.c
index d28477c50469..3ce2f65f994a 100644
--- a/sound/soc/intel/boards/sof_sdw_cs42l42.c
+++ b/sound/soc/intel/boards/sof_sdw_cs42l42.c
@@ -39,7 +39,7 @@ static struct snd_soc_jack_pin cs42l42_jack_pins[] = {
 int asoc_sdw_cs42l42_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai)
 {
 	struct snd_soc_card *card = rtd->card;
-	struct mc_private *ctx = snd_soc_card_get_drvdata(card);
+	struct asoc_sdw_mc_private *ctx = snd_soc_card_get_drvdata(card);
 	struct snd_soc_component *component;
 	struct snd_soc_jack *jack;
 	int ret;
diff --git a/sound/soc/intel/boards/sof_sdw_cs42l43.c b/sound/soc/intel/boards/sof_sdw_cs42l43.c
index bb371b2649cf..47d05fe7de53 100644
--- a/sound/soc/intel/boards/sof_sdw_cs42l43.c
+++ b/sound/soc/intel/boards/sof_sdw_cs42l43.c
@@ -51,7 +51,7 @@ static struct snd_soc_jack_pin sof_jack_pins[] = {
 int asoc_sdw_cs42l43_hs_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai)
 {
 	struct snd_soc_component *component = snd_soc_rtd_to_codec(rtd, 0)->component;
-	struct mc_private *ctx = snd_soc_card_get_drvdata(rtd->card);
+	struct asoc_sdw_mc_private *ctx = snd_soc_card_get_drvdata(rtd->card);
 	struct snd_soc_jack *jack = &ctx->sdw_headset;
 	struct snd_soc_card *card = rtd->card;
 	int ret;
diff --git a/sound/soc/intel/boards/sof_sdw_hdmi.c b/sound/soc/intel/boards/sof_sdw_hdmi.c
index f34fabdf9d93..4084119a9a5f 100644
--- a/sound/soc/intel/boards/sof_sdw_hdmi.c
+++ b/sound/soc/intel/boards/sof_sdw_hdmi.c
@@ -17,23 +17,25 @@
 
 int sof_sdw_hdmi_init(struct snd_soc_pcm_runtime *rtd)
 {
-	struct mc_private *ctx = snd_soc_card_get_drvdata(rtd->card);
+	struct asoc_sdw_mc_private *ctx = snd_soc_card_get_drvdata(rtd->card);
+	struct intel_mc_ctx *intel_ctx = (struct intel_mc_ctx *)ctx->private;
 	struct snd_soc_dai *dai = snd_soc_rtd_to_codec(rtd, 0);
 
-	ctx->hdmi.hdmi_comp = dai->component;
+	intel_ctx->hdmi.hdmi_comp = dai->component;
 
 	return 0;
 }
 
 int sof_sdw_hdmi_card_late_probe(struct snd_soc_card *card)
 {
-	struct mc_private *ctx = snd_soc_card_get_drvdata(card);
+	struct asoc_sdw_mc_private *ctx = snd_soc_card_get_drvdata(card);
+	struct intel_mc_ctx *intel_ctx = (struct intel_mc_ctx *)ctx->private;
 
-	if (!ctx->hdmi.idisp_codec)
+	if (!intel_ctx->hdmi.idisp_codec)
 		return 0;
 
-	if (!ctx->hdmi.hdmi_comp)
+	if (!intel_ctx->hdmi.hdmi_comp)
 		return -EINVAL;
 
-	return hda_dsp_hdmi_build_controls(card, ctx->hdmi.hdmi_comp);
+	return hda_dsp_hdmi_build_controls(card, intel_ctx->hdmi.hdmi_comp);
 }
diff --git a/sound/soc/intel/boards/sof_sdw_rt5682.c b/sound/soc/intel/boards/sof_sdw_rt5682.c
index 3584638e2192..7e52720e0195 100644
--- a/sound/soc/intel/boards/sof_sdw_rt5682.c
+++ b/sound/soc/intel/boards/sof_sdw_rt5682.c
@@ -38,7 +38,7 @@ static struct snd_soc_jack_pin rt5682_jack_pins[] = {
 int asoc_sdw_rt5682_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai)
 {
 	struct snd_soc_card *card = rtd->card;
-	struct mc_private *ctx = snd_soc_card_get_drvdata(card);
+	struct asoc_sdw_mc_private *ctx = snd_soc_card_get_drvdata(card);
 	struct snd_soc_component *component;
 	struct snd_soc_jack *jack;
 	int ret;
diff --git a/sound/soc/intel/boards/sof_sdw_rt700.c b/sound/soc/intel/boards/sof_sdw_rt700.c
index a90d69573736..0abaaeacfd90 100644
--- a/sound/soc/intel/boards/sof_sdw_rt700.c
+++ b/sound/soc/intel/boards/sof_sdw_rt700.c
@@ -36,7 +36,7 @@ static struct snd_soc_jack_pin rt700_jack_pins[] = {
 int asoc_sdw_rt700_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai)
 {
 	struct snd_soc_card *card = rtd->card;
-	struct mc_private *ctx = snd_soc_card_get_drvdata(card);
+	struct asoc_sdw_mc_private *ctx = snd_soc_card_get_drvdata(card);
 	struct snd_soc_component *component;
 	struct snd_soc_jack *jack;
 	int ret;
diff --git a/sound/soc/intel/boards/sof_sdw_rt711.c b/sound/soc/intel/boards/sof_sdw_rt711.c
index e4d300d7d5ef..fb5bc611b5e7 100644
--- a/sound/soc/intel/boards/sof_sdw_rt711.c
+++ b/sound/soc/intel/boards/sof_sdw_rt711.c
@@ -62,7 +62,7 @@ static struct snd_soc_jack_pin rt711_jack_pins[] = {
 int asoc_sdw_rt711_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai)
 {
 	struct snd_soc_card *card = rtd->card;
-	struct mc_private *ctx = snd_soc_card_get_drvdata(card);
+	struct asoc_sdw_mc_private *ctx = snd_soc_card_get_drvdata(card);
 	struct snd_soc_component *component;
 	struct snd_soc_jack *jack;
 	int ret;
@@ -113,7 +113,7 @@ int asoc_sdw_rt711_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai
 
 int asoc_sdw_rt711_exit(struct snd_soc_card *card, struct snd_soc_dai_link *dai_link)
 {
-	struct mc_private *ctx = snd_soc_card_get_drvdata(card);
+	struct asoc_sdw_mc_private *ctx = snd_soc_card_get_drvdata(card);
 
 	if (!ctx->headset_codec_dev)
 		return 0;
@@ -129,7 +129,7 @@ int asoc_sdw_rt711_init(struct snd_soc_card *card,
 			struct asoc_sdw_codec_info *info,
 			bool playback)
 {
-	struct mc_private *ctx = snd_soc_card_get_drvdata(card);
+	struct asoc_sdw_mc_private *ctx = snd_soc_card_get_drvdata(card);
 	struct device *sdw_dev;
 	int ret;
 
diff --git a/sound/soc/intel/boards/sof_sdw_rt_amp.c b/sound/soc/intel/boards/sof_sdw_rt_amp.c
index 4cf392c84cc7..fff746671c1d 100644
--- a/sound/soc/intel/boards/sof_sdw_rt_amp.c
+++ b/sound/soc/intel/boards/sof_sdw_rt_amp.c
@@ -239,7 +239,7 @@ const struct snd_soc_ops soc_sdw_rt1308_i2s_ops = {
 
 int asoc_sdw_rt_amp_exit(struct snd_soc_card *card, struct snd_soc_dai_link *dai_link)
 {
-	struct mc_private *ctx = snd_soc_card_get_drvdata(card);
+	struct asoc_sdw_mc_private *ctx = snd_soc_card_get_drvdata(card);
 
 	if (ctx->amp_dev1) {
 		device_remove_software_node(ctx->amp_dev1);
@@ -259,7 +259,7 @@ int asoc_sdw_rt_amp_init(struct snd_soc_card *card,
 			 struct asoc_sdw_codec_info *info,
 			 bool playback)
 {
-	struct mc_private *ctx = snd_soc_card_get_drvdata(card);
+	struct asoc_sdw_mc_private *ctx = snd_soc_card_get_drvdata(card);
 	struct device *sdw_dev1, *sdw_dev2;
 	int ret;
 
diff --git a/sound/soc/intel/boards/sof_sdw_rt_sdca_jack_common.c b/sound/soc/intel/boards/sof_sdw_rt_sdca_jack_common.c
index d84aec2b4c78..8059e483835d 100644
--- a/sound/soc/intel/boards/sof_sdw_rt_sdca_jack_common.c
+++ b/sound/soc/intel/boards/sof_sdw_rt_sdca_jack_common.c
@@ -86,7 +86,7 @@ static const char * const need_sdca_suffix[] = {
 int asoc_sdw_rt_sdca_jack_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai)
 {
 	struct snd_soc_card *card = rtd->card;
-	struct mc_private *ctx = snd_soc_card_get_drvdata(card);
+	struct asoc_sdw_mc_private *ctx = snd_soc_card_get_drvdata(card);
 	struct snd_soc_component *component;
 	struct snd_soc_jack *jack;
 	int ret;
@@ -163,7 +163,7 @@ int asoc_sdw_rt_sdca_jack_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_s
 
 int asoc_sdw_rt_sdca_jack_exit(struct snd_soc_card *card, struct snd_soc_dai_link *dai_link)
 {
-	struct mc_private *ctx = snd_soc_card_get_drvdata(card);
+	struct asoc_sdw_mc_private *ctx = snd_soc_card_get_drvdata(card);
 
 	if (!ctx->headset_codec_dev)
 		return 0;
@@ -183,7 +183,7 @@ int asoc_sdw_rt_sdca_jack_init(struct snd_soc_card *card,
 			       struct asoc_sdw_codec_info *info,
 			       bool playback)
 {
-	struct mc_private *ctx = snd_soc_card_get_drvdata(card);
+	struct asoc_sdw_mc_private *ctx = snd_soc_card_get_drvdata(card);
 	struct device *sdw_dev;
 	int ret;
 
-- 
2.34.1

