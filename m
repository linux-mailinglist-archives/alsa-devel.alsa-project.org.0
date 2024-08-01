Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (unknown [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 332469445AD
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Aug 2024 09:40:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E1E083410;
	Thu,  1 Aug 2024 09:40:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E1E083410
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722498013;
	bh=OOfg8tkbJLzoJgO5JTTXrI0kZwxWgXWhiT0Ax3KckYI=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=AYdW9zxMrPltJEiax2y/mXkQgRkZKEHqYhr8RqiXkzZwAnwp2k3KaFMM0XGZH0HLu
	 zNnRNMzHz1R2vtFs13g155mMez2q+oF83eswKt3ozSAS7KUWBl+o2vAiwIXb751JFF
	 xbOXPYMOPtGSFByQcOiRs4JQGC2e/Jphl0StdtNw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F31A1F805A0; Thu,  1 Aug 2024 09:39:58 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1142AF805B0;
	Thu,  1 Aug 2024 09:39:58 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0749DF80448; Thu,  1 Aug 2024 08:27:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2062e.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2418::62e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 05624F800E3
	for <alsa-devel@alsa-project.org>; Thu,  1 Aug 2024 08:27:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 05624F800E3
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=KpdsnkFi
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fv8C854327lhwdt3rHiIFYnvqu2jYlzlDuA4gkZ+Shp+rt31I/pUiHpX1FIe43afR1lUBj2mdTe47mzZXoztTX5NXYcPFNDaG16lL+ay8uHl/w45ZXJh7LUDF8J9B1N6clHO+ZakIGdBVKYLeLVZUUkfeIphlNneGP9H5R7vwIzmpH8MDLSf0R+gopGHV8jzDgcG72q4f/9qhQTct2QaRKQIs5Yxh15z47Rj7AMNfb0OAS7QXWa17BEsBYPeaFV/SuxZE25YlTyrgXKjA3fxbzQF3DNus5VBRh7XWUjU0cknQAuuDQSvakBm88wXxRzIXxx4i0mIukHLqYOfdczbMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gFa3Pog6ZiXET4635aNpUlAaMrc7TXECglk3ZuIN4/I=;
 b=mALMWm1EJ4eH8Dhv0sjArpmvKVAJuhfd+EWRwbBk1527lDKRX8quIiphojD/dvLm7dRWFJuxTVm8jZOmv7UPibNQs/aEKVirmm2+T+0ON6ZBw4ImMm0WQYLiGyI4AUnQHJWtYIIQRlbjEK621P29PGx8vn1KAPf8HHRTE2zcb3SHEs3nLeuXjzeVNWOZsBedEpkXEWyOCs4SJOKPkk0qIlEGBW92UTJEs4tmNTEvSF71YPs+yPL6NYOicsSoTEn82kv/YiHQ0uQv6my2OAntO78WZEZTjoTdLQWAVDyjSw7YimF2o98SN+o4bUriaXT7Wjb8s0JoRH0EPIj2LVDIMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gFa3Pog6ZiXET4635aNpUlAaMrc7TXECglk3ZuIN4/I=;
 b=KpdsnkFiCm0STUYW2c9cenjVBUdfUB24SRWMJeLxf0EhG98vwkl7b4V4Z2JY8GqfuzexRXYabyE/SRN+SyU7DsjRo9bB+ChYlZRo7V0oMsoW79qh402WKvANBmBeCTxFrgyFG5CyjTEv6HGlI2NtlJwKioN4UgfjRSMr5X2W3cU=
Received: from DS7PR03CA0333.namprd03.prod.outlook.com (2603:10b6:8:55::15) by
 CYYPR12MB8890.namprd12.prod.outlook.com (2603:10b6:930:c7::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7828.22; Thu, 1 Aug 2024 06:27:00 +0000
Received: from DS1PEPF00017091.namprd03.prod.outlook.com
 (2603:10b6:8:55:cafe::72) by DS7PR03CA0333.outlook.office365.com
 (2603:10b6:8:55::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.21 via Frontend
 Transport; Thu, 1 Aug 2024 06:27:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF00017091.mail.protection.outlook.com (10.167.17.133) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7828.19 via Frontend Transport; Thu, 1 Aug 2024 06:27:00 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 1 Aug
 2024 01:26:58 -0500
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39
 via Frontend Transport; Thu, 1 Aug 2024 01:26:51 -0500
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>
CC: <alsa-devel@alsa-project.org>, <yung-chuan.liao@linux.intel.com>,
	<pierre-louis.bossart@linux.intel.com>, <Basavaraj.Hiregoudar@amd.com>,
	<Sunil-kumar.Dommati@amd.com>, <venkataprasad.potturu@amd.com>, "Vijendar
 Mukunda" <Vijendar.Mukunda@amd.com>, Cezary Rojewski
	<cezary.rojewski@intel.com>, Liam Girdwood <liam.r.girdwood@linux.intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, Ranjani Sridharan
	<ranjani.sridharan@linux.intel.com>, Kai Vehmanen
	<kai.vehmanen@linux.intel.com>, Jaroslav Kysela <perex@perex.cz>, "Takashi
 Iwai" <tiwai@suse.com>, Charles Keepax <ckeepax@opensource.cirrus.com>,
	"Maciej Strozek" <mstrozek@opensource.cirrus.com>, Chao Song
	<chao.song@linux.intel.com>, Kuninori Morimoto
	<kuninori.morimoto.gx@renesas.com>, jairaj-arava <jairaj.arava@intel.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>, Brent Lu <brent.lu@intel.com>,
	Rander Wang <rander.wang@intel.com>, Christophe JAILLET
	<christophe.jaillet@wanadoo.fr>, "open list:SOUND - SOC LAYER / DYNAMIC AUDIO
 POWER MANAGEM..." <linux-sound@vger.kernel.org>, open list
	<linux-kernel@vger.kernel.org>
Subject: [PATCH 04/31] ASoC: intel: rename soundwire codec helper functions
Date: Thu, 1 Aug 2024 11:53:49 +0530
Message-ID: <20240801062416.2203673-5-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240801062416.2203673-1-Vijendar.Mukunda@amd.com>
References: <20240801062416.2203673-1-Vijendar.Mukunda@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: Vijendar.Mukunda@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017091:EE_|CYYPR12MB8890:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a2c9968-bdd4-43bf-ec06-08dcb1f2f344
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|7416014|1800799024|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?7lz4ltUiac61CLJiiKp4RvfdipHJ/GDFaJ3p8X4qRy4ijJbzp4XccKhvq4o5?=
 =?us-ascii?Q?5s3OXxynztTcwuQii43LhYCO0OAkwxqHngaz15u75ZSAP+vgstThm36VjXyQ?=
 =?us-ascii?Q?Tw4Iz8LurpbmiiSTnYoUgBB8YMfJV2OcJTcebQbbndpwPddt7/o9DiPZeQXF?=
 =?us-ascii?Q?qTMB+DaC26t6zjhVm0S6gCZ8wwtSzsRnbqlVCHPQvbftBsQIdqfJTe0FA4zp?=
 =?us-ascii?Q?NMgc1/co+gmaiLEtxrQU76ZV1WU2zLGvq9m6lsUN8cAmiaYAze12Ul/+MR9M?=
 =?us-ascii?Q?h4F7Qdh38IsfZzohBHDO6Lb9Qt74+68Cjxh6V9O+5ODWY5NU3kO7uc7km2wA?=
 =?us-ascii?Q?KUENpyU7OK//AFRuiQZ67LibfSJFMGxUFqKlXZvOp+VKYRh8ieuJWaJhiI0S?=
 =?us-ascii?Q?CrnzyLMvGcD4Dm1vwyxd4VMy6TOyIf/H5X/6D90UIG2HcZsaX1L5ItThX+nZ?=
 =?us-ascii?Q?s2iqJWNbCYhBbhduxGnZZCECR/rfTGY8aZlV+ZpwA6hU5+CaTcnbECyZVxvW?=
 =?us-ascii?Q?aNpmFHS0+MK7qPLsl6tCAME5+bAbpD9CeZrGwjf2Jh41UwmWhYbkePLfGays?=
 =?us-ascii?Q?ac+s8PFNMXWz6wiuRo5b0LJvTBvuGmQSjXUaVUcMRsiGo0BKKX6S06Y0NdR/?=
 =?us-ascii?Q?BcMI1oMBXKFUUIohnUU3qv2BbCEM0GA7AV5goxNRPBSrqHW9VYw7MAUTwXCr?=
 =?us-ascii?Q?DkRqJuwbNhCSDDjyJpGc7xZHZSkvBVe5mPPMoAJ4+Bg1vt/uu6dPhJ2IykRJ?=
 =?us-ascii?Q?q9r+gvvGQiySAV783PEfw8DBzJz7EPcwwkfnQGmuXNX1r1iRSOmE3ssiJImm?=
 =?us-ascii?Q?b4cjuTixRtKlZfOkYcGTRVgd3RabGfGnHBbacLEbE5TQy8JRi4xLn7kIoO7o?=
 =?us-ascii?Q?wNUmNCtQzIFkOOGeX7V9uJXHEE3gHV7fGHCefCsF7LInmCMq/Uxk9J8l4mTh?=
 =?us-ascii?Q?/PhceL2QZZD948WMlS9Zsrr+sMjT1oKjYS985Ybh7DIGOVtL5i4+tUvPPvfr?=
 =?us-ascii?Q?naoAjD7wwTmj9fe3SooUKDj7OLtArkL1JSP3o8201ogTpeF7RDqKCejxp4br?=
 =?us-ascii?Q?W1LIuSRC39MUtt2aRhH1RplKT1/Ec6JmNmB18oYboCXRqcYN3VjEAZAS7/m0?=
 =?us-ascii?Q?ZgTvk1t3VOOfzPthU5wFkDsSX06ufwLy0bwRgEcL3RRzKKzCAJtRBAy4J4+x?=
 =?us-ascii?Q?H3XTe2cSyoty7tM7zcqrbzbfhIBkpM4xYa/L86dJobCz8+0cOfch0JaXhUH+?=
 =?us-ascii?Q?efozWCIbm6AG7IvlZXp7KLQ2Em7PY79n/k6Q7zpXIG8spZrx3IkaB3trrHZV?=
 =?us-ascii?Q?grrWjldXALGivFolO0DetXx5DZr1l/kD6/BQceWWU0uPOx+8zUiKTg4RuoXi?=
 =?us-ascii?Q?+wotaoEqi4dNClj3GmP+YkAieW3h4f4VK4Eywm9R3QmSi5u9uA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2024 06:27:00.0256
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 5a2c9968-bdd4-43bf-ec06-08dcb1f2f344
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DS1PEPF00017091.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8890
Message-ID-Hash: WQO5ZOKAQ23VO345LCRVU2JCCJ25ZRSV
X-Message-ID-Hash: WQO5ZOKAQ23VO345LCRVU2JCCJ25ZRSV
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WQO5ZOKAQ23VO345LCRVU2JCCJ25ZRSV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Rename SoundWire codec helper functions with "asoc_sdw" tag.

Link: https://github.com/thesofproject/linux/pull/5068
Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/bridge_cs35l56.c       |  18 +-
 sound/soc/intel/boards/sof_sdw.c              | 154 +++++++++---------
 sound/soc/intel/boards/sof_sdw_common.h       | 104 ++++++------
 sound/soc/intel/boards/sof_sdw_cs42l42.c      |   2 +-
 sound/soc/intel/boards/sof_sdw_cs42l43.c      |  16 +-
 sound/soc/intel/boards/sof_sdw_cs_amp.c       |  10 +-
 sound/soc/intel/boards/sof_sdw_dmic.c         |   2 +-
 sound/soc/intel/boards/sof_sdw_maxim.c        |  22 +--
 sound/soc/intel/boards/sof_sdw_rt5682.c       |   2 +-
 sound/soc/intel/boards/sof_sdw_rt700.c        |   2 +-
 sound/soc/intel/boards/sof_sdw_rt711.c        |  12 +-
 sound/soc/intel/boards/sof_sdw_rt712_sdca.c   |   2 +-
 sound/soc/intel/boards/sof_sdw_rt722_sdca.c   |   2 +-
 sound/soc/intel/boards/sof_sdw_rt_amp.c       |  14 +-
 sound/soc/intel/boards/sof_sdw_rt_dmic.c      |   2 +-
 .../boards/sof_sdw_rt_sdca_jack_common.c      |  12 +-
 16 files changed, 188 insertions(+), 188 deletions(-)

diff --git a/sound/soc/intel/boards/bridge_cs35l56.c b/sound/soc/intel/boards/bridge_cs35l56.c
index 6b2526c781e5..55e5cfbb2f14 100644
--- a/sound/soc/intel/boards/bridge_cs35l56.c
+++ b/sound/soc/intel/boards/bridge_cs35l56.c
@@ -95,8 +95,8 @@ static const struct snd_soc_dai_link bridge_dai_template = {
 	SND_SOC_DAILINK_REG(bridge_dai),
 };
 
-int bridge_cs35l56_count_sidecar(struct snd_soc_card *card,
-				 int *num_dais, int *num_devs)
+int asoc_sdw_bridge_cs35l56_count_sidecar(struct snd_soc_card *card,
+					  int *num_dais, int *num_devs)
 {
 	if (sof_sdw_quirk & SOC_SDW_SIDECAR_AMPS) {
 		(*num_dais)++;
@@ -106,9 +106,9 @@ int bridge_cs35l56_count_sidecar(struct snd_soc_card *card,
 	return 0;
 }
 
-int bridge_cs35l56_add_sidecar(struct snd_soc_card *card,
-			       struct snd_soc_dai_link **dai_links,
-			       struct snd_soc_codec_conf **codec_conf)
+int asoc_sdw_bridge_cs35l56_add_sidecar(struct snd_soc_card *card,
+					struct snd_soc_dai_link **dai_links,
+					struct snd_soc_codec_conf **codec_conf)
 {
 	if (sof_sdw_quirk & SOC_SDW_SIDECAR_AMPS) {
 		**dai_links = bridge_dai_template;
@@ -125,10 +125,10 @@ int bridge_cs35l56_add_sidecar(struct snd_soc_card *card,
 	return 0;
 }
 
-int bridge_cs35l56_spk_init(struct snd_soc_card *card,
-			    struct snd_soc_dai_link *dai_links,
-			    struct asoc_sdw_codec_info *info,
-			    bool playback)
+int asoc_sdw_bridge_cs35l56_spk_init(struct snd_soc_card *card,
+				     struct snd_soc_dai_link *dai_links,
+				     struct asoc_sdw_codec_info *info,
+				     bool playback)
 {
 	if (sof_sdw_quirk & SOC_SDW_SIDECAR_AMPS)
 		info->amp_num += ARRAY_SIZE(bridge_cs35l56_name_prefixes);
diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index 9395daf220e9..64418976aba4 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -740,7 +740,7 @@ static struct asoc_sdw_codec_info codec_info_list[] = {
 				.dai_name = "rt700-aif1",
 				.dai_type = SOC_SDW_DAI_TYPE_JACK,
 				.dailink = {SOC_SDW_JACK_OUT_DAI_ID, SOC_SDW_JACK_IN_DAI_ID},
-				.rtd_init = rt700_rtd_init,
+				.rtd_init = asoc_sdw_rt700_rtd_init,
 				.controls = rt700_controls,
 				.num_controls = ARRAY_SIZE(rt700_controls),
 				.widgets = rt700_widgets,
@@ -758,9 +758,9 @@ static struct asoc_sdw_codec_info codec_info_list[] = {
 				.dai_name = "rt711-sdca-aif1",
 				.dai_type = SOC_SDW_DAI_TYPE_JACK,
 				.dailink = {SOC_SDW_JACK_OUT_DAI_ID, SOC_SDW_JACK_IN_DAI_ID},
-				.init = sof_sdw_rt_sdca_jack_init,
-				.exit = sof_sdw_rt_sdca_jack_exit,
-				.rtd_init = rt_sdca_jack_rtd_init,
+				.init = asoc_sdw_rt_sdca_jack_init,
+				.exit = asoc_sdw_rt_sdca_jack_exit,
+				.rtd_init = asoc_sdw_rt_sdca_jack_rtd_init,
 				.controls = generic_jack_controls,
 				.num_controls = ARRAY_SIZE(generic_jack_controls),
 				.widgets = generic_jack_widgets,
@@ -778,9 +778,9 @@ static struct asoc_sdw_codec_info codec_info_list[] = {
 				.dai_name = "rt711-aif1",
 				.dai_type = SOC_SDW_DAI_TYPE_JACK,
 				.dailink = {SOC_SDW_JACK_OUT_DAI_ID, SOC_SDW_JACK_IN_DAI_ID},
-				.init = sof_sdw_rt711_init,
-				.exit = sof_sdw_rt711_exit,
-				.rtd_init = rt711_rtd_init,
+				.init = asoc_sdw_rt711_init,
+				.exit = asoc_sdw_rt711_exit,
+				.rtd_init = asoc_sdw_rt711_rtd_init,
 				.controls = generic_jack_controls,
 				.num_controls = ARRAY_SIZE(generic_jack_controls),
 				.widgets = generic_jack_widgets,
@@ -798,9 +798,9 @@ static struct asoc_sdw_codec_info codec_info_list[] = {
 				.dai_name = "rt712-sdca-aif1",
 				.dai_type = SOC_SDW_DAI_TYPE_JACK,
 				.dailink = {SOC_SDW_JACK_OUT_DAI_ID, SOC_SDW_JACK_IN_DAI_ID},
-				.init = sof_sdw_rt_sdca_jack_init,
-				.exit = sof_sdw_rt_sdca_jack_exit,
-				.rtd_init = rt_sdca_jack_rtd_init,
+				.init = asoc_sdw_rt_sdca_jack_init,
+				.exit = asoc_sdw_rt_sdca_jack_exit,
+				.rtd_init = asoc_sdw_rt_sdca_jack_rtd_init,
 				.controls = generic_jack_controls,
 				.num_controls = ARRAY_SIZE(generic_jack_controls),
 				.widgets = generic_jack_widgets,
@@ -811,9 +811,9 @@ static struct asoc_sdw_codec_info codec_info_list[] = {
 				.dai_name = "rt712-sdca-aif2",
 				.dai_type = SOC_SDW_DAI_TYPE_AMP,
 				.dailink = {SOC_SDW_AMP_OUT_DAI_ID, SOC_SDW_UNUSED_DAI_ID},
-				.init = sof_sdw_rt_amp_init,
-				.exit = sof_sdw_rt_amp_exit,
-				.rtd_init = rt712_spk_rtd_init,
+				.init = asoc_sdw_rt_amp_init,
+				.exit = asoc_sdw_rt_amp_exit,
+				.rtd_init = asoc_sdw_rt712_spk_rtd_init,
 				.controls = generic_spk_controls,
 				.num_controls = ARRAY_SIZE(generic_spk_controls),
 				.widgets = generic_spk_widgets,
@@ -831,7 +831,7 @@ static struct asoc_sdw_codec_info codec_info_list[] = {
 				.dai_name = "rt712-sdca-dmic-aif1",
 				.dai_type = SOC_SDW_DAI_TYPE_MIC,
 				.dailink = {SOC_SDW_UNUSED_DAI_ID, SOC_SDW_DMIC_DAI_ID},
-				.rtd_init = rt_dmic_rtd_init,
+				.rtd_init = asoc_sdw_rt_dmic_rtd_init,
 			},
 		},
 		.dai_num = 1,
@@ -845,9 +845,9 @@ static struct asoc_sdw_codec_info codec_info_list[] = {
 				.dai_name = "rt712-sdca-aif1",
 				.dai_type = SOC_SDW_DAI_TYPE_JACK,
 				.dailink = {SOC_SDW_JACK_OUT_DAI_ID, SOC_SDW_JACK_IN_DAI_ID},
-				.init = sof_sdw_rt_sdca_jack_init,
-				.exit = sof_sdw_rt_sdca_jack_exit,
-				.rtd_init = rt_sdca_jack_rtd_init,
+				.init = asoc_sdw_rt_sdca_jack_init,
+				.exit = asoc_sdw_rt_sdca_jack_exit,
+				.rtd_init = asoc_sdw_rt_sdca_jack_rtd_init,
 				.controls = generic_jack_controls,
 				.num_controls = ARRAY_SIZE(generic_jack_controls),
 				.widgets = generic_jack_widgets,
@@ -865,7 +865,7 @@ static struct asoc_sdw_codec_info codec_info_list[] = {
 				.dai_name = "rt712-sdca-dmic-aif1",
 				.dai_type = SOC_SDW_DAI_TYPE_MIC,
 				.dailink = {SOC_SDW_UNUSED_DAI_ID, SOC_SDW_DMIC_DAI_ID},
-				.rtd_init = rt_dmic_rtd_init,
+				.rtd_init = asoc_sdw_rt_dmic_rtd_init,
 			},
 		},
 		.dai_num = 1,
@@ -879,9 +879,9 @@ static struct asoc_sdw_codec_info codec_info_list[] = {
 				.dai_name = "rt1308-aif",
 				.dai_type = SOC_SDW_DAI_TYPE_AMP,
 				.dailink = {SOC_SDW_AMP_OUT_DAI_ID, SOC_SDW_UNUSED_DAI_ID},
-				.init = sof_sdw_rt_amp_init,
-				.exit = sof_sdw_rt_amp_exit,
-				.rtd_init = rt_amp_spk_rtd_init,
+				.init = asoc_sdw_rt_amp_init,
+				.exit = asoc_sdw_rt_amp_exit,
+				.rtd_init = asoc_sdw_rt_amp_spk_rtd_init,
 				.controls = generic_spk_controls,
 				.num_controls = ARRAY_SIZE(generic_spk_controls),
 				.widgets = generic_spk_widgets,
@@ -889,7 +889,7 @@ static struct asoc_sdw_codec_info codec_info_list[] = {
 			},
 		},
 		.dai_num = 1,
-		.ops = &sof_sdw_rt1308_i2s_ops,
+		.ops = &soc_sdw_rt1308_i2s_ops,
 	},
 	{
 		.part_id = 0x1316,
@@ -899,9 +899,9 @@ static struct asoc_sdw_codec_info codec_info_list[] = {
 				.dai_name = "rt1316-aif",
 				.dai_type = SOC_SDW_DAI_TYPE_AMP,
 				.dailink = {SOC_SDW_AMP_OUT_DAI_ID, SOC_SDW_AMP_IN_DAI_ID},
-				.init = sof_sdw_rt_amp_init,
-				.exit = sof_sdw_rt_amp_exit,
-				.rtd_init = rt_amp_spk_rtd_init,
+				.init = asoc_sdw_rt_amp_init,
+				.exit = asoc_sdw_rt_amp_exit,
+				.rtd_init = asoc_sdw_rt_amp_spk_rtd_init,
 				.controls = generic_spk_controls,
 				.num_controls = ARRAY_SIZE(generic_spk_controls),
 				.widgets = generic_spk_widgets,
@@ -918,9 +918,9 @@ static struct asoc_sdw_codec_info codec_info_list[] = {
 				.dai_name = "rt1318-aif",
 				.dai_type = SOC_SDW_DAI_TYPE_AMP,
 				.dailink = {SOC_SDW_AMP_OUT_DAI_ID, SOC_SDW_AMP_IN_DAI_ID},
-				.init = sof_sdw_rt_amp_init,
-				.exit = sof_sdw_rt_amp_exit,
-				.rtd_init = rt_amp_spk_rtd_init,
+				.init = asoc_sdw_rt_amp_init,
+				.exit = asoc_sdw_rt_amp_exit,
+				.rtd_init = asoc_sdw_rt_amp_spk_rtd_init,
 				.controls = generic_spk_controls,
 				.num_controls = ARRAY_SIZE(generic_spk_controls),
 				.widgets = generic_spk_widgets,
@@ -939,7 +939,7 @@ static struct asoc_sdw_codec_info codec_info_list[] = {
 				.dai_name = "rt715-sdca-aif2",
 				.dai_type = SOC_SDW_DAI_TYPE_MIC,
 				.dailink = {SOC_SDW_UNUSED_DAI_ID, SOC_SDW_DMIC_DAI_ID},
-				.rtd_init = rt_dmic_rtd_init,
+				.rtd_init = asoc_sdw_rt_dmic_rtd_init,
 			},
 		},
 		.dai_num = 1,
@@ -954,7 +954,7 @@ static struct asoc_sdw_codec_info codec_info_list[] = {
 				.dai_name = "rt715-sdca-aif2",
 				.dai_type = SOC_SDW_DAI_TYPE_MIC,
 				.dailink = {SOC_SDW_UNUSED_DAI_ID, SOC_SDW_DMIC_DAI_ID},
-				.rtd_init = rt_dmic_rtd_init,
+				.rtd_init = asoc_sdw_rt_dmic_rtd_init,
 			},
 		},
 		.dai_num = 1,
@@ -969,7 +969,7 @@ static struct asoc_sdw_codec_info codec_info_list[] = {
 				.dai_name = "rt715-aif2",
 				.dai_type = SOC_SDW_DAI_TYPE_MIC,
 				.dailink = {SOC_SDW_UNUSED_DAI_ID, SOC_SDW_DMIC_DAI_ID},
-				.rtd_init = rt_dmic_rtd_init,
+				.rtd_init = asoc_sdw_rt_dmic_rtd_init,
 			},
 		},
 		.dai_num = 1,
@@ -984,7 +984,7 @@ static struct asoc_sdw_codec_info codec_info_list[] = {
 				.dai_name = "rt715-aif2",
 				.dai_type = SOC_SDW_DAI_TYPE_MIC,
 				.dailink = {SOC_SDW_UNUSED_DAI_ID, SOC_SDW_DMIC_DAI_ID},
-				.rtd_init = rt_dmic_rtd_init,
+				.rtd_init = asoc_sdw_rt_dmic_rtd_init,
 			},
 		},
 		.dai_num = 1,
@@ -998,9 +998,9 @@ static struct asoc_sdw_codec_info codec_info_list[] = {
 				.dai_name = "rt722-sdca-aif1",
 				.dai_type = SOC_SDW_DAI_TYPE_JACK,
 				.dailink = {SOC_SDW_JACK_OUT_DAI_ID, SOC_SDW_JACK_IN_DAI_ID},
-				.init = sof_sdw_rt_sdca_jack_init,
-				.exit = sof_sdw_rt_sdca_jack_exit,
-				.rtd_init = rt_sdca_jack_rtd_init,
+				.init = asoc_sdw_rt_sdca_jack_init,
+				.exit = asoc_sdw_rt_sdca_jack_exit,
+				.rtd_init = asoc_sdw_rt_sdca_jack_rtd_init,
 				.controls = generic_jack_controls,
 				.num_controls = ARRAY_SIZE(generic_jack_controls),
 				.widgets = generic_jack_widgets,
@@ -1012,9 +1012,9 @@ static struct asoc_sdw_codec_info codec_info_list[] = {
 				.dai_type = SOC_SDW_DAI_TYPE_AMP,
 				/* No feedback capability is provided by rt722-sdca codec driver*/
 				.dailink = {SOC_SDW_AMP_OUT_DAI_ID, SOC_SDW_UNUSED_DAI_ID},
-				.init = sof_sdw_rt_amp_init,
-				.exit = sof_sdw_rt_amp_exit,
-				.rtd_init = rt722_spk_rtd_init,
+				.init = asoc_sdw_rt_amp_init,
+				.exit = asoc_sdw_rt_amp_exit,
+				.rtd_init = asoc_sdw_rt722_spk_rtd_init,
 				.controls = generic_spk_controls,
 				.num_controls = ARRAY_SIZE(generic_spk_controls),
 				.widgets = generic_spk_widgets,
@@ -1025,7 +1025,7 @@ static struct asoc_sdw_codec_info codec_info_list[] = {
 				.dai_name = "rt722-sdca-aif3",
 				.dai_type = SOC_SDW_DAI_TYPE_MIC,
 				.dailink = {SOC_SDW_UNUSED_DAI_ID, SOC_SDW_DMIC_DAI_ID},
-				.rtd_init = rt_dmic_rtd_init,
+				.rtd_init = asoc_sdw_rt_dmic_rtd_init,
 			},
 		},
 		.dai_num = 3,
@@ -1038,8 +1038,8 @@ static struct asoc_sdw_codec_info codec_info_list[] = {
 				.dai_name = "max98373-aif1",
 				.dai_type = SOC_SDW_DAI_TYPE_AMP,
 				.dailink = {SOC_SDW_AMP_OUT_DAI_ID, SOC_SDW_AMP_IN_DAI_ID},
-				.init = sof_sdw_maxim_init,
-				.rtd_init = maxim_spk_rtd_init,
+				.init = asoc_sdw_maxim_init,
+				.rtd_init = asoc_sdw_maxim_spk_rtd_init,
 				.controls = maxim_controls,
 				.num_controls = ARRAY_SIZE(maxim_controls),
 				.widgets = maxim_widgets,
@@ -1056,8 +1056,8 @@ static struct asoc_sdw_codec_info codec_info_list[] = {
 				.dai_name = "max98363-aif1",
 				.dai_type = SOC_SDW_DAI_TYPE_AMP,
 				.dailink = {SOC_SDW_AMP_OUT_DAI_ID, SOC_SDW_UNUSED_DAI_ID},
-				.init = sof_sdw_maxim_init,
-				.rtd_init = maxim_spk_rtd_init,
+				.init = asoc_sdw_maxim_init,
+				.rtd_init = asoc_sdw_maxim_spk_rtd_init,
 				.controls = maxim_controls,
 				.num_controls = ARRAY_SIZE(maxim_controls),
 				.widgets = maxim_widgets,
@@ -1074,7 +1074,7 @@ static struct asoc_sdw_codec_info codec_info_list[] = {
 				.dai_name = "rt5682-sdw",
 				.dai_type = SOC_SDW_DAI_TYPE_JACK,
 				.dailink = {SOC_SDW_JACK_OUT_DAI_ID, SOC_SDW_JACK_IN_DAI_ID},
-				.rtd_init = rt5682_rtd_init,
+				.rtd_init = asoc_sdw_rt5682_rtd_init,
 				.controls = generic_jack_controls,
 				.num_controls = ARRAY_SIZE(generic_jack_controls),
 				.widgets = generic_jack_widgets,
@@ -1091,8 +1091,8 @@ static struct asoc_sdw_codec_info codec_info_list[] = {
 				.dai_name = "cs35l56-sdw1",
 				.dai_type = SOC_SDW_DAI_TYPE_AMP,
 				.dailink = {SOC_SDW_AMP_OUT_DAI_ID, SOC_SDW_AMP_IN_DAI_ID},
-				.init = sof_sdw_cs_amp_init,
-				.rtd_init = cs_spk_rtd_init,
+				.init = asoc_sdw_cs_amp_init,
+				.rtd_init = asoc_sdw_cs_spk_rtd_init,
 				.controls = generic_spk_controls,
 				.num_controls = ARRAY_SIZE(generic_spk_controls),
 				.widgets = generic_spk_widgets,
@@ -1109,7 +1109,7 @@ static struct asoc_sdw_codec_info codec_info_list[] = {
 				.dai_name = "cs42l42-sdw",
 				.dai_type = SOC_SDW_DAI_TYPE_JACK,
 				.dailink = {SOC_SDW_JACK_OUT_DAI_ID, SOC_SDW_JACK_IN_DAI_ID},
-				.rtd_init = cs42l42_rtd_init,
+				.rtd_init = asoc_sdw_cs42l42_rtd_init,
 				.controls = generic_jack_controls,
 				.num_controls = ARRAY_SIZE(generic_jack_controls),
 				.widgets = generic_jack_widgets,
@@ -1121,15 +1121,15 @@ static struct asoc_sdw_codec_info codec_info_list[] = {
 	{
 		.part_id = 0x4243,
 		.codec_name = "cs42l43-codec",
-		.count_sidecar = bridge_cs35l56_count_sidecar,
-		.add_sidecar = bridge_cs35l56_add_sidecar,
+		.count_sidecar = asoc_sdw_bridge_cs35l56_count_sidecar,
+		.add_sidecar = asoc_sdw_bridge_cs35l56_add_sidecar,
 		.dais = {
 			{
 				.direction = {true, false},
 				.dai_name = "cs42l43-dp5",
 				.dai_type = SOC_SDW_DAI_TYPE_JACK,
 				.dailink = {SOC_SDW_JACK_OUT_DAI_ID, SOC_SDW_UNUSED_DAI_ID},
-				.rtd_init = cs42l43_hs_rtd_init,
+				.rtd_init = asoc_sdw_cs42l43_hs_rtd_init,
 				.controls = generic_jack_controls,
 				.num_controls = ARRAY_SIZE(generic_jack_controls),
 				.widgets = generic_jack_widgets,
@@ -1140,7 +1140,7 @@ static struct asoc_sdw_codec_info codec_info_list[] = {
 				.dai_name = "cs42l43-dp1",
 				.dai_type = SOC_SDW_DAI_TYPE_MIC,
 				.dailink = {SOC_SDW_UNUSED_DAI_ID, SOC_SDW_DMIC_DAI_ID},
-				.rtd_init = cs42l43_dmic_rtd_init,
+				.rtd_init = asoc_sdw_cs42l43_dmic_rtd_init,
 				.widgets = generic_dmic_widgets,
 				.num_widgets = ARRAY_SIZE(generic_dmic_widgets),
 			},
@@ -1155,8 +1155,8 @@ static struct asoc_sdw_codec_info codec_info_list[] = {
 				.dai_name = "cs42l43-dp6",
 				.dai_type = SOC_SDW_DAI_TYPE_AMP,
 				.dailink = {SOC_SDW_AMP_OUT_DAI_ID, SOC_SDW_UNUSED_DAI_ID},
-				.init = sof_sdw_cs42l43_spk_init,
-				.rtd_init = cs42l43_spk_rtd_init,
+				.init = asoc_sdw_cs42l43_spk_init,
+				.rtd_init = asoc_sdw_cs42l43_spk_rtd_init,
 				.controls = generic_spk_controls,
 				.num_controls = ARRAY_SIZE(generic_spk_controls),
 				.widgets = generic_spk_widgets,
@@ -1220,7 +1220,7 @@ static struct asoc_sdw_codec_info codec_info_list[] = {
 	},
 };
 
-static struct asoc_sdw_codec_info *find_codec_info_part(const u64 adr)
+static struct asoc_sdw_codec_info *asoc_sdw_find_codec_info_part(const u64 adr)
 {
 	unsigned int part_id, sdw_version;
 	int i;
@@ -1241,7 +1241,7 @@ static struct asoc_sdw_codec_info *find_codec_info_part(const u64 adr)
 
 }
 
-static struct asoc_sdw_codec_info *find_codec_info_acpi(const u8 *acpi_id)
+static struct asoc_sdw_codec_info *asoc_sdw_find_codec_info_acpi(const u8 *acpi_id)
 {
 	int i;
 
@@ -1255,8 +1255,8 @@ static struct asoc_sdw_codec_info *find_codec_info_acpi(const u8 *acpi_id)
 	return NULL;
 }
 
-static struct asoc_sdw_codec_info *find_codec_info_dai(const char *dai_name,
-						       int *dai_index)
+static struct asoc_sdw_codec_info *asoc_sdw_find_codec_info_dai(const char *dai_name,
+								int *dai_index)
 {
 	int i, j;
 
@@ -1320,12 +1320,12 @@ static int init_simple_dai_link(struct device *dev, struct snd_soc_dai_link *dai
 	return 0;
 }
 
-static bool is_unique_device(const struct snd_soc_acpi_link_adr *adr_link,
-			     unsigned int sdw_version,
-			     unsigned int mfg_id,
-			     unsigned int part_id,
-			     unsigned int class_id,
-			     int index_in_link)
+static bool asoc_sdw_is_unique_device(const struct snd_soc_acpi_link_adr *adr_link,
+				      unsigned int sdw_version,
+				      unsigned int mfg_id,
+				      unsigned int part_id,
+				      unsigned int class_id,
+				      int index_in_link)
 {
 	int i;
 
@@ -1354,10 +1354,10 @@ static bool is_unique_device(const struct snd_soc_acpi_link_adr *adr_link,
 	return true;
 }
 
-static const char *get_codec_name(struct device *dev,
-				  const struct asoc_sdw_codec_info *codec_info,
-				  const struct snd_soc_acpi_link_adr *adr_link,
-				  int adr_index)
+static const char *asoc_sdw_get_codec_name(struct device *dev,
+					   const struct asoc_sdw_codec_info *codec_info,
+					   const struct snd_soc_acpi_link_adr *adr_link,
+					   int adr_index)
 {
 	u64 adr = adr_link->adr_d[adr_index].adr;
 	unsigned int sdw_version = SDW_VERSION(adr);
@@ -1369,8 +1369,8 @@ static const char *get_codec_name(struct device *dev,
 
 	if (codec_info->codec_name)
 		return devm_kstrdup(dev, codec_info->codec_name, GFP_KERNEL);
-	else if (is_unique_device(adr_link, sdw_version, mfg_id, part_id,
-				  class_id, adr_index))
+	else if (asoc_sdw_is_unique_device(adr_link, sdw_version, mfg_id, part_id,
+					   class_id, adr_index))
 		return devm_kasprintf(dev, GFP_KERNEL, "sdw:0:%01x:%04x:%04x:%02x",
 				      link_id, mfg_id, part_id, class_id);
 	else
@@ -1380,7 +1380,7 @@ static const char *get_codec_name(struct device *dev,
 	return NULL;
 }
 
-static int sof_sdw_rtd_init(struct snd_soc_pcm_runtime *rtd)
+static int asoc_sdw_rtd_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct snd_soc_card *card = rtd->card;
 	struct asoc_sdw_codec_info *codec_info;
@@ -1390,7 +1390,7 @@ static int sof_sdw_rtd_init(struct snd_soc_pcm_runtime *rtd)
 	int i;
 
 	for_each_rtd_codec_dais(rtd, i, dai) {
-		codec_info = find_codec_info_dai(dai->name, &dai_index);
+		codec_info = asoc_sdw_find_codec_info_dai(dai->name, &dai_index);
 		if (!codec_info)
 			return -EINVAL;
 
@@ -1538,13 +1538,13 @@ static int parse_sdw_endpoints(struct snd_soc_card *card,
 				return -EINVAL;
 			}
 
-			codec_info = find_codec_info_part(adr_dev->adr);
+			codec_info = asoc_sdw_find_codec_info_part(adr_dev->adr);
 			if (!codec_info)
 				return -EINVAL;
 
 			ctx->ignore_pch_dmic |= codec_info->ignore_pch_dmic;
 
-			codec_name = get_codec_name(dev, codec_info, adr_link, i);
+			codec_name = asoc_sdw_get_codec_name(dev, codec_info, adr_link, i);
 			if (!codec_name)
 				return -ENOMEM;
 
@@ -1736,7 +1736,7 @@ static int create_sdw_dailink(struct snd_soc_card *card,
 
 		init_dai_link(dev, *dai_links, be_id, name, playback, capture,
 			      cpus, num_cpus, codecs, num_codecs,
-			      sof_sdw_rtd_init, &sdw_ops);
+			      asoc_sdw_rtd_init, &sdw_ops);
 
 		/*
 		 * SoundWire DAILINKs use 'stream' functions and Bank Switch operations
@@ -1831,7 +1831,7 @@ static int create_dmic_dailinks(struct snd_soc_card *card,
 	ret = init_simple_dai_link(dev, *dai_links, be_id, "dmic01",
 				   0, 1, // DMIC only supports capture
 				   "DMIC01 Pin", "dmic-codec", "dmic-hifi",
-				   sof_sdw_dmic_init, NULL);
+				   asoc_sdw_dmic_init, NULL);
 	if (ret)
 		return ret;
 
@@ -1840,7 +1840,7 @@ static int create_dmic_dailinks(struct snd_soc_card *card,
 	ret = init_simple_dai_link(dev, *dai_links, be_id, "dmic16k",
 				   0, 1, // DMIC only supports capture
 				   "DMIC16k Pin", "dmic-codec", "dmic-hifi",
-				   /* don't call sof_sdw_dmic_init() twice */
+				   /* don't call asoc_sdw_dmic_init() twice */
 				   NULL, NULL);
 	if (ret)
 		return ret;
@@ -1956,7 +1956,7 @@ static int sof_card_dai_links_create(struct snd_soc_card *card)
 	 * system only when I2S mode is supported, not sdw mode.
 	 * Here check ACPI ID to confirm I2S is supported.
 	 */
-	ssp_info = find_codec_info_acpi(mach->id);
+	ssp_info = asoc_sdw_find_codec_info_acpi(mach->id);
 	if (ssp_info) {
 		ssp_mask = SOF_SSP_GET_PORT(sof_sdw_quirk);
 		ssp_num = hweight_long(ssp_mask);
diff --git a/sound/soc/intel/boards/sof_sdw_common.h b/sound/soc/intel/boards/sof_sdw_common.h
index e88b5627560b..28db2f1c6dae 100644
--- a/sound/soc/intel/boards/sof_sdw_common.h
+++ b/sound/soc/intel/boards/sof_sdw_common.h
@@ -148,75 +148,75 @@ int sof_sdw_hdmi_init(struct snd_soc_pcm_runtime *rtd);
 int sof_sdw_hdmi_card_late_probe(struct snd_soc_card *card);
 
 /* DMIC support */
-int sof_sdw_dmic_init(struct snd_soc_pcm_runtime *rtd);
+int asoc_sdw_dmic_init(struct snd_soc_pcm_runtime *rtd);
 
 /* RT711 support */
-int sof_sdw_rt711_init(struct snd_soc_card *card,
-		       struct snd_soc_dai_link *dai_links,
-		       struct asoc_sdw_codec_info *info,
-		       bool playback);
-int sof_sdw_rt711_exit(struct snd_soc_card *card, struct snd_soc_dai_link *dai_link);
+int asoc_sdw_rt711_init(struct snd_soc_card *card,
+			struct snd_soc_dai_link *dai_links,
+			struct asoc_sdw_codec_info *info,
+			bool playback);
+int asoc_sdw_rt711_exit(struct snd_soc_card *card, struct snd_soc_dai_link *dai_link);
 
 /* RT711-SDCA support */
-int sof_sdw_rt_sdca_jack_init(struct snd_soc_card *card,
-			      struct snd_soc_dai_link *dai_links,
-			      struct asoc_sdw_codec_info *info,
-			      bool playback);
-int sof_sdw_rt_sdca_jack_exit(struct snd_soc_card *card, struct snd_soc_dai_link *dai_link);
+int asoc_sdw_rt_sdca_jack_init(struct snd_soc_card *card,
+			       struct snd_soc_dai_link *dai_links,
+			       struct asoc_sdw_codec_info *info,
+			       bool playback);
+int asoc_sdw_rt_sdca_jack_exit(struct snd_soc_card *card, struct snd_soc_dai_link *dai_link);
 
 /* RT1308 I2S support */
-extern const struct snd_soc_ops sof_sdw_rt1308_i2s_ops;
+extern const struct snd_soc_ops soc_sdw_rt1308_i2s_ops;
 
 /* generic amp support */
-int sof_sdw_rt_amp_init(struct snd_soc_card *card,
+int asoc_sdw_rt_amp_init(struct snd_soc_card *card,
+			 struct snd_soc_dai_link *dai_links,
+			 struct asoc_sdw_codec_info *info,
+			 bool playback);
+int asoc_sdw_rt_amp_exit(struct snd_soc_card *card, struct snd_soc_dai_link *dai_link);
+
+/* MAXIM codec support */
+int asoc_sdw_maxim_init(struct snd_soc_card *card,
 			struct snd_soc_dai_link *dai_links,
 			struct asoc_sdw_codec_info *info,
 			bool playback);
-int sof_sdw_rt_amp_exit(struct snd_soc_card *card, struct snd_soc_dai_link *dai_link);
-
-/* MAXIM codec support */
-int sof_sdw_maxim_init(struct snd_soc_card *card,
-		       struct snd_soc_dai_link *dai_links,
-		       struct asoc_sdw_codec_info *info,
-		       bool playback);
 
 /* CS42L43 support */
-int sof_sdw_cs42l43_spk_init(struct snd_soc_card *card,
-			     struct snd_soc_dai_link *dai_links,
-			     struct asoc_sdw_codec_info *info,
-			     bool playback);
+int asoc_sdw_cs42l43_spk_init(struct snd_soc_card *card,
+			      struct snd_soc_dai_link *dai_links,
+			      struct asoc_sdw_codec_info *info,
+			      bool playback);
 
 /* CS AMP support */
-int bridge_cs35l56_count_sidecar(struct snd_soc_card *card,
-				 int *num_dais, int *num_devs);
-int bridge_cs35l56_add_sidecar(struct snd_soc_card *card,
-			       struct snd_soc_dai_link **dai_links,
-			       struct snd_soc_codec_conf **codec_conf);
-int bridge_cs35l56_spk_init(struct snd_soc_card *card,
-			    struct snd_soc_dai_link *dai_links,
-			    struct asoc_sdw_codec_info *info,
-			    bool playback);
-
-int sof_sdw_cs_amp_init(struct snd_soc_card *card,
-			struct snd_soc_dai_link *dai_links,
-			struct asoc_sdw_codec_info *info,
-			bool playback);
+int asoc_sdw_bridge_cs35l56_count_sidecar(struct snd_soc_card *card,
+					  int *num_dais, int *num_devs);
+int asoc_sdw_bridge_cs35l56_add_sidecar(struct snd_soc_card *card,
+					struct snd_soc_dai_link **dai_links,
+					struct snd_soc_codec_conf **codec_conf);
+int asoc_sdw_bridge_cs35l56_spk_init(struct snd_soc_card *card,
+				     struct snd_soc_dai_link *dai_links,
+				     struct asoc_sdw_codec_info *info,
+				     bool playback);
+
+int asoc_sdw_cs_amp_init(struct snd_soc_card *card,
+			 struct snd_soc_dai_link *dai_links,
+			 struct asoc_sdw_codec_info *info,
+			 bool playback);
 
 /* dai_link init callbacks */
 
-int cs42l42_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai);
-int cs42l43_hs_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai);
-int cs42l43_spk_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai);
-int cs42l43_dmic_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai);
-int cs_spk_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai);
-int maxim_spk_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai);
-int rt5682_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai);
-int rt700_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai);
-int rt711_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai);
-int rt712_spk_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai);
-int rt722_spk_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai);
-int rt_dmic_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai);
-int rt_amp_spk_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai);
-int rt_sdca_jack_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai);
+int asoc_sdw_cs42l42_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai);
+int asoc_sdw_cs42l43_hs_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai);
+int asoc_sdw_cs42l43_spk_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai);
+int asoc_sdw_cs42l43_dmic_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai);
+int asoc_sdw_cs_spk_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai);
+int asoc_sdw_maxim_spk_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai);
+int asoc_sdw_rt5682_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai);
+int asoc_sdw_rt700_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai);
+int asoc_sdw_rt711_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai);
+int asoc_sdw_rt712_spk_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai);
+int asoc_sdw_rt722_spk_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai);
+int asoc_sdw_rt_dmic_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai);
+int asoc_sdw_rt_amp_spk_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai);
+int asoc_sdw_rt_sdca_jack_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai);
 
 #endif
diff --git a/sound/soc/intel/boards/sof_sdw_cs42l42.c b/sound/soc/intel/boards/sof_sdw_cs42l42.c
index fc18e4aa3dbe..d28477c50469 100644
--- a/sound/soc/intel/boards/sof_sdw_cs42l42.c
+++ b/sound/soc/intel/boards/sof_sdw_cs42l42.c
@@ -36,7 +36,7 @@ static struct snd_soc_jack_pin cs42l42_jack_pins[] = {
 	},
 };
 
-int cs42l42_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai)
+int asoc_sdw_cs42l42_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai)
 {
 	struct snd_soc_card *card = rtd->card;
 	struct mc_private *ctx = snd_soc_card_get_drvdata(card);
diff --git a/sound/soc/intel/boards/sof_sdw_cs42l43.c b/sound/soc/intel/boards/sof_sdw_cs42l43.c
index 1688f29a977a..bb371b2649cf 100644
--- a/sound/soc/intel/boards/sof_sdw_cs42l43.c
+++ b/sound/soc/intel/boards/sof_sdw_cs42l43.c
@@ -48,7 +48,7 @@ static struct snd_soc_jack_pin sof_jack_pins[] = {
 	},
 };
 
-int cs42l43_hs_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai)
+int asoc_sdw_cs42l43_hs_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai)
 {
 	struct snd_soc_component *component = snd_soc_rtd_to_codec(rtd, 0)->component;
 	struct mc_private *ctx = snd_soc_card_get_drvdata(rtd->card);
@@ -99,7 +99,7 @@ int cs42l43_hs_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai
 	return ret;
 }
 
-int cs42l43_spk_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai)
+int asoc_sdw_cs42l43_spk_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai)
 {
 	struct snd_soc_card *card = rtd->card;
 	int ret;
@@ -121,10 +121,10 @@ int cs42l43_spk_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *da
 	return ret;
 }
 
-int sof_sdw_cs42l43_spk_init(struct snd_soc_card *card,
-			     struct snd_soc_dai_link *dai_links,
-			     struct asoc_sdw_codec_info *info,
-			     bool playback)
+int asoc_sdw_cs42l43_spk_init(struct snd_soc_card *card,
+			      struct snd_soc_dai_link *dai_links,
+			      struct asoc_sdw_codec_info *info,
+			      bool playback)
 {
 	/* Do init on playback link only. */
 	if (!playback)
@@ -132,10 +132,10 @@ int sof_sdw_cs42l43_spk_init(struct snd_soc_card *card,
 
 	info->amp_num++;
 
-	return bridge_cs35l56_spk_init(card, dai_links, info, playback);
+	return asoc_sdw_bridge_cs35l56_spk_init(card, dai_links, info, playback);
 }
 
-int cs42l43_dmic_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai)
+int asoc_sdw_cs42l43_dmic_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai)
 {
 	struct snd_soc_card *card = rtd->card;
 	int ret;
diff --git a/sound/soc/intel/boards/sof_sdw_cs_amp.c b/sound/soc/intel/boards/sof_sdw_cs_amp.c
index 206fe7610a56..6479974bd2c3 100644
--- a/sound/soc/intel/boards/sof_sdw_cs_amp.c
+++ b/sound/soc/intel/boards/sof_sdw_cs_amp.c
@@ -14,7 +14,7 @@
 
 #define CODEC_NAME_SIZE	8
 
-int cs_spk_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai)
+int asoc_sdw_cs_spk_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai)
 {
 	const char *dai_name = rtd->dai_link->codecs->dai_name;
 	struct snd_soc_card *card = rtd->card;
@@ -45,10 +45,10 @@ int cs_spk_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai)
 	return 0;
 }
 
-int sof_sdw_cs_amp_init(struct snd_soc_card *card,
-			struct snd_soc_dai_link *dai_links,
-			struct asoc_sdw_codec_info *info,
-			bool playback)
+int asoc_sdw_cs_amp_init(struct snd_soc_card *card,
+			 struct snd_soc_dai_link *dai_links,
+			 struct asoc_sdw_codec_info *info,
+			 bool playback)
 {
 	/* Do init on playback link only. */
 	if (!playback)
diff --git a/sound/soc/intel/boards/sof_sdw_dmic.c b/sound/soc/intel/boards/sof_sdw_dmic.c
index 19df0f7a1d85..d9f2e072f401 100644
--- a/sound/soc/intel/boards/sof_sdw_dmic.c
+++ b/sound/soc/intel/boards/sof_sdw_dmic.c
@@ -19,7 +19,7 @@ static const struct snd_soc_dapm_route dmic_map[] = {
 	{"DMic", NULL, "SoC DMIC"},
 };
 
-int sof_sdw_dmic_init(struct snd_soc_pcm_runtime *rtd)
+int asoc_sdw_dmic_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct snd_soc_card *card = rtd->card;
 	int ret;
diff --git a/sound/soc/intel/boards/sof_sdw_maxim.c b/sound/soc/intel/boards/sof_sdw_maxim.c
index f689dc29c493..fd8347e28849 100644
--- a/sound/soc/intel/boards/sof_sdw_maxim.c
+++ b/sound/soc/intel/boards/sof_sdw_maxim.c
@@ -21,7 +21,7 @@ static const struct snd_soc_dapm_route max_98373_dapm_routes[] = {
 	{ "Right Spk", NULL, "Right BE_OUT" },
 };
 
-int maxim_spk_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai)
+int asoc_sdw_maxim_spk_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai)
 {
 	struct snd_soc_card *card = rtd->card;
 	int ret;
@@ -75,7 +75,7 @@ static int mx8373_enable_spk_pin(struct snd_pcm_substream *substream, bool enabl
 	return 0;
 }
 
-static int mx8373_sdw_prepare(struct snd_pcm_substream *substream)
+static int asoc_sdw_mx8373_prepare(struct snd_pcm_substream *substream)
 {
 	int ret;
 
@@ -87,7 +87,7 @@ static int mx8373_sdw_prepare(struct snd_pcm_substream *substream)
 	return mx8373_enable_spk_pin(substream, true);
 }
 
-static int mx8373_sdw_hw_free(struct snd_pcm_substream *substream)
+static int asoc_sdw_mx8373_hw_free(struct snd_pcm_substream *substream)
 {
 	int ret;
 
@@ -101,14 +101,14 @@ static int mx8373_sdw_hw_free(struct snd_pcm_substream *substream)
 
 static const struct snd_soc_ops max_98373_sdw_ops = {
 	.startup = asoc_sdw_startup,
-	.prepare = mx8373_sdw_prepare,
+	.prepare = asoc_sdw_mx8373_prepare,
 	.trigger = asoc_sdw_trigger,
 	.hw_params = asoc_sdw_hw_params,
-	.hw_free = mx8373_sdw_hw_free,
+	.hw_free = asoc_sdw_mx8373_hw_free,
 	.shutdown = asoc_sdw_shutdown,
 };
 
-static int mx8373_sdw_late_probe(struct snd_soc_card *card)
+static int asoc_sdw_mx8373_sdw_late_probe(struct snd_soc_card *card)
 {
 	struct snd_soc_dapm_context *dapm = &card->dapm;
 
@@ -118,10 +118,10 @@ static int mx8373_sdw_late_probe(struct snd_soc_card *card)
 	return snd_soc_dapm_sync(dapm);
 }
 
-int sof_sdw_maxim_init(struct snd_soc_card *card,
-		       struct snd_soc_dai_link *dai_links,
-		       struct asoc_sdw_codec_info *info,
-		       bool playback)
+int asoc_sdw_maxim_init(struct snd_soc_card *card,
+			struct snd_soc_dai_link *dai_links,
+			struct asoc_sdw_codec_info *info,
+			bool playback)
 {
 	info->amp_num++;
 
@@ -133,7 +133,7 @@ int sof_sdw_maxim_init(struct snd_soc_card *card,
 		 */
 		break;
 	case SOF_SDW_PART_ID_MAX98373:
-		info->codec_card_late_probe = mx8373_sdw_late_probe;
+		info->codec_card_late_probe = asoc_sdw_mx8373_sdw_late_probe;
 		dai_links->ops = &max_98373_sdw_ops;
 		break;
 	default:
diff --git a/sound/soc/intel/boards/sof_sdw_rt5682.c b/sound/soc/intel/boards/sof_sdw_rt5682.c
index 67737815d016..3584638e2192 100644
--- a/sound/soc/intel/boards/sof_sdw_rt5682.c
+++ b/sound/soc/intel/boards/sof_sdw_rt5682.c
@@ -35,7 +35,7 @@ static struct snd_soc_jack_pin rt5682_jack_pins[] = {
 	},
 };
 
-int rt5682_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai)
+int asoc_sdw_rt5682_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai)
 {
 	struct snd_soc_card *card = rtd->card;
 	struct mc_private *ctx = snd_soc_card_get_drvdata(card);
diff --git a/sound/soc/intel/boards/sof_sdw_rt700.c b/sound/soc/intel/boards/sof_sdw_rt700.c
index 0db730071be2..a90d69573736 100644
--- a/sound/soc/intel/boards/sof_sdw_rt700.c
+++ b/sound/soc/intel/boards/sof_sdw_rt700.c
@@ -33,7 +33,7 @@ static struct snd_soc_jack_pin rt700_jack_pins[] = {
 	},
 };
 
-int rt700_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai)
+int asoc_sdw_rt700_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai)
 {
 	struct snd_soc_card *card = rtd->card;
 	struct mc_private *ctx = snd_soc_card_get_drvdata(card);
diff --git a/sound/soc/intel/boards/sof_sdw_rt711.c b/sound/soc/intel/boards/sof_sdw_rt711.c
index fff76291fca2..e4d300d7d5ef 100644
--- a/sound/soc/intel/boards/sof_sdw_rt711.c
+++ b/sound/soc/intel/boards/sof_sdw_rt711.c
@@ -59,7 +59,7 @@ static struct snd_soc_jack_pin rt711_jack_pins[] = {
 	},
 };
 
-int rt711_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai)
+int asoc_sdw_rt711_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai)
 {
 	struct snd_soc_card *card = rtd->card;
 	struct mc_private *ctx = snd_soc_card_get_drvdata(card);
@@ -111,7 +111,7 @@ int rt711_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai)
 	return ret;
 }
 
-int sof_sdw_rt711_exit(struct snd_soc_card *card, struct snd_soc_dai_link *dai_link)
+int asoc_sdw_rt711_exit(struct snd_soc_card *card, struct snd_soc_dai_link *dai_link)
 {
 	struct mc_private *ctx = snd_soc_card_get_drvdata(card);
 
@@ -124,10 +124,10 @@ int sof_sdw_rt711_exit(struct snd_soc_card *card, struct snd_soc_dai_link *dai_l
 	return 0;
 }
 
-int sof_sdw_rt711_init(struct snd_soc_card *card,
-		       struct snd_soc_dai_link *dai_links,
-		       struct asoc_sdw_codec_info *info,
-		       bool playback)
+int asoc_sdw_rt711_init(struct snd_soc_card *card,
+			struct snd_soc_dai_link *dai_links,
+			struct asoc_sdw_codec_info *info,
+			bool playback)
 {
 	struct mc_private *ctx = snd_soc_card_get_drvdata(card);
 	struct device *sdw_dev;
diff --git a/sound/soc/intel/boards/sof_sdw_rt712_sdca.c b/sound/soc/intel/boards/sof_sdw_rt712_sdca.c
index 788796461885..bb09d1ddafd2 100644
--- a/sound/soc/intel/boards/sof_sdw_rt712_sdca.c
+++ b/sound/soc/intel/boards/sof_sdw_rt712_sdca.c
@@ -26,7 +26,7 @@ static const struct snd_soc_dapm_route rt712_spk_map[] = {
 	{ "Speaker", NULL, "rt712 SPOR" },
 };
 
-int rt712_spk_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai)
+int asoc_sdw_rt712_spk_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai)
 {
 	struct snd_soc_card *card = rtd->card;
 	int ret;
diff --git a/sound/soc/intel/boards/sof_sdw_rt722_sdca.c b/sound/soc/intel/boards/sof_sdw_rt722_sdca.c
index 083d281bd052..2da9134ad1a3 100644
--- a/sound/soc/intel/boards/sof_sdw_rt722_sdca.c
+++ b/sound/soc/intel/boards/sof_sdw_rt722_sdca.c
@@ -19,7 +19,7 @@ static const struct snd_soc_dapm_route rt722_spk_map[] = {
 	{ "Speaker", NULL, "rt722 SPK" },
 };
 
-int rt722_spk_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai)
+int asoc_sdw_rt722_spk_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai)
 {
 	struct snd_soc_card *card = rtd->card;
 	int ret;
diff --git a/sound/soc/intel/boards/sof_sdw_rt_amp.c b/sound/soc/intel/boards/sof_sdw_rt_amp.c
index da1a8cc1c63d..4cf392c84cc7 100644
--- a/sound/soc/intel/boards/sof_sdw_rt_amp.c
+++ b/sound/soc/intel/boards/sof_sdw_rt_amp.c
@@ -173,7 +173,7 @@ static const struct snd_soc_dapm_route *get_codec_name_and_route(struct snd_soc_
 		return rt1318_map;
 }
 
-int rt_amp_spk_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai)
+int asoc_sdw_rt_amp_spk_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai)
 {
 	struct snd_soc_card *card = rtd->card;
 	const struct snd_soc_dapm_route *rt_amp_map;
@@ -233,11 +233,11 @@ static int rt1308_i2s_hw_params(struct snd_pcm_substream *substream,
 }
 
 /* machine stream operations */
-const struct snd_soc_ops sof_sdw_rt1308_i2s_ops = {
+const struct snd_soc_ops soc_sdw_rt1308_i2s_ops = {
 	.hw_params = rt1308_i2s_hw_params,
 };
 
-int sof_sdw_rt_amp_exit(struct snd_soc_card *card, struct snd_soc_dai_link *dai_link)
+int asoc_sdw_rt_amp_exit(struct snd_soc_card *card, struct snd_soc_dai_link *dai_link)
 {
 	struct mc_private *ctx = snd_soc_card_get_drvdata(card);
 
@@ -254,10 +254,10 @@ int sof_sdw_rt_amp_exit(struct snd_soc_card *card, struct snd_soc_dai_link *dai_
 	return 0;
 }
 
-int sof_sdw_rt_amp_init(struct snd_soc_card *card,
-			struct snd_soc_dai_link *dai_links,
-			struct asoc_sdw_codec_info *info,
-			bool playback)
+int asoc_sdw_rt_amp_init(struct snd_soc_card *card,
+			 struct snd_soc_dai_link *dai_links,
+			 struct asoc_sdw_codec_info *info,
+			 bool playback)
 {
 	struct mc_private *ctx = snd_soc_card_get_drvdata(card);
 	struct device *sdw_dev1, *sdw_dev2;
diff --git a/sound/soc/intel/boards/sof_sdw_rt_dmic.c b/sound/soc/intel/boards/sof_sdw_rt_dmic.c
index ea7c1a4bc566..64960b059834 100644
--- a/sound/soc/intel/boards/sof_sdw_rt_dmic.c
+++ b/sound/soc/intel/boards/sof_sdw_rt_dmic.c
@@ -12,7 +12,7 @@
 #include "sof_board_helpers.h"
 #include "sof_sdw_common.h"
 
-int rt_dmic_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai)
+int asoc_sdw_rt_dmic_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai)
 {
 	struct snd_soc_card *card = rtd->card;
 	struct snd_soc_component *component;
diff --git a/sound/soc/intel/boards/sof_sdw_rt_sdca_jack_common.c b/sound/soc/intel/boards/sof_sdw_rt_sdca_jack_common.c
index 9c3b93f808a2..d84aec2b4c78 100644
--- a/sound/soc/intel/boards/sof_sdw_rt_sdca_jack_common.c
+++ b/sound/soc/intel/boards/sof_sdw_rt_sdca_jack_common.c
@@ -83,7 +83,7 @@ static const char * const need_sdca_suffix[] = {
 	"rt711", "rt713"
 };
 
-int rt_sdca_jack_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai)
+int asoc_sdw_rt_sdca_jack_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai)
 {
 	struct snd_soc_card *card = rtd->card;
 	struct mc_private *ctx = snd_soc_card_get_drvdata(card);
@@ -161,7 +161,7 @@ int rt_sdca_jack_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *d
 	return ret;
 }
 
-int sof_sdw_rt_sdca_jack_exit(struct snd_soc_card *card, struct snd_soc_dai_link *dai_link)
+int asoc_sdw_rt_sdca_jack_exit(struct snd_soc_card *card, struct snd_soc_dai_link *dai_link)
 {
 	struct mc_private *ctx = snd_soc_card_get_drvdata(card);
 
@@ -178,10 +178,10 @@ int sof_sdw_rt_sdca_jack_exit(struct snd_soc_card *card, struct snd_soc_dai_link
 	return 0;
 }
 
-int sof_sdw_rt_sdca_jack_init(struct snd_soc_card *card,
-			      struct snd_soc_dai_link *dai_links,
-			      struct asoc_sdw_codec_info *info,
-			      bool playback)
+int asoc_sdw_rt_sdca_jack_init(struct snd_soc_card *card,
+			       struct snd_soc_dai_link *dai_links,
+			       struct asoc_sdw_codec_info *info,
+			       bool playback)
 {
 	struct mc_private *ctx = snd_soc_card_get_drvdata(card);
 	struct device *sdw_dev;
-- 
2.34.1

