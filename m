Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (unknown [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 929E7944887
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Aug 2024 11:34:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AABA33BAA;
	Thu,  1 Aug 2024 11:34:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AABA33BAA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722504875;
	bh=nelUTE3UCSrTjZfAXz+ulsgjGceDQrtX87jFBIIf/U4=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=H7Fevr1Q6upOe2VcWi/SW/1hIAteHUMLJ/qZVmwOlGJr3l4JT2iwCFSmHt5AbxUqy
	 s1bArsKzwfLETpKu2FfAsT9MiyvrjuxaTg2+Pj+w6ZQu3Sv/N9B9yawMUGtS06mQIr
	 jW4wb96xvAj++4RuV5oO4jnsSSczlMQ9/mqJMAVc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DC17CF805AC; Thu,  1 Aug 2024 11:34:06 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E365EF805A0;
	Thu,  1 Aug 2024 11:34:05 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 969ADF8026A; Thu,  1 Aug 2024 11:20:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2060e.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2407::60e])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CFE6DF8007E
	for <alsa-devel@alsa-project.org>; Thu,  1 Aug 2024 11:19:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CFE6DF8007E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=J5Qf5RM1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K1twrXD5AUM/HCvb8DA4n698SGJPAlq/rESN9fmmqDQ06l2SBoL2RgbUUyraFXQh2+NahaJkEdFQUCOg819ta0GGalsapajjB9G9X/OvB2dPotQrgaJWDRxGl54yXTAPgFXYLaStg8GRKvWjTQKP4viDgwWkJg0jwKBMM52qWJwYJ40Mw27UQ4rFoWUYNgu2oD69ZyXgBJ9aQ1gb/rHdPlzjReohTXhkfWk5OZ2zI+kEWba6yHqME/kQk/mx0g3zoP76bgWHibbMW2XAj4lfzNkiPslLjcbGUmrB5jvgzpZBzqnRIOe2ZiQZelvVbyg2OPhjBzlBRLZD2P1wp/XxBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3h/1p+WbV/j7E5Ukqg9CVqE+GidDOg+hifcmtgW1fCc=;
 b=j1Q6kW1ixeA85kmOGhb9PYlxJ6E1YazCGxXrbwKKFalrVH5/FgeEIuAZujL9ljqg4yc5GED+o+pMr+HumjAABhK5eZEcGrz0ImNtdSN0iqwfwzo6TIdz7j3fOZD4SqSO8kInyF4QYcOJBtx+RDgHUWGq3cZ015xMCDjzufr2Nmtmnb/dv1jndu0jTbcoPLXWKl/u6fvHytz3IqDcLTkeldL+2RPk33SEWGa9/moGeCyiWDIAgE0g7LTH6BQf3Wy9+iOqrtFeTwF/q3V39zsH18BLf8WudNuIUjRkxWPcur6BaEeHuQVTi/ethS48FhY5Sn3JBM7eNlXM8iK/wNqg6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3h/1p+WbV/j7E5Ukqg9CVqE+GidDOg+hifcmtgW1fCc=;
 b=J5Qf5RM1LcdJlC5Ar1Yu6WmsxClWfLb5n+rELTaMW+4p8/Sdn/XphPBJX7m7gNYadqKd9YuMJOhUWxOEbJ60SPjsEmJjuCRW61QoTcl579I33hx1vWcWJkEmR/ecg3SuSbhrdat7nufL4X2RtcFWJ/Gy3Kty2caDYNUdnneTkos=
Received: from DS7PR03CA0248.namprd03.prod.outlook.com (2603:10b6:5:3b3::13)
 by IA0PR12MB8226.namprd12.prod.outlook.com (2603:10b6:208:403::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.22; Thu, 1 Aug
 2024 09:19:52 +0000
Received: from DS2PEPF00003441.namprd04.prod.outlook.com
 (2603:10b6:5:3b3:cafe::5a) by DS7PR03CA0248.outlook.office365.com
 (2603:10b6:5:3b3::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.34 via Frontend
 Transport; Thu, 1 Aug 2024 09:19:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS2PEPF00003441.mail.protection.outlook.com (10.167.17.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7828.19 via Frontend Transport; Thu, 1 Aug 2024 09:19:52 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 1 Aug
 2024 04:19:51 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 1 Aug
 2024 04:19:50 -0500
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39
 via Frontend Transport; Thu, 1 Aug 2024 04:19:44 -0500
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>
CC: <alsa-devel@alsa-project.org>, <pierre-louis.bossart@linux.intel.com>,
	<yung-chuan.liao@linux.intel.com>, <Basavaraj.Hiregoudar@amd.com>,
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
Subject: [PATCH RESEND 11/31] ASoC: intel/sdw_utils: move rtk dmic helper
 functions
Date: Thu, 1 Aug 2024 14:44:26 +0530
Message-ID: <20240801091446.10457-12-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240801091446.10457-1-Vijendar.Mukunda@amd.com>
References: <20240801091446.10457-1-Vijendar.Mukunda@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00003441:EE_|IA0PR12MB8226:EE_
X-MS-Office365-Filtering-Correlation-Id: 23a101d6-99f4-4f9d-17a3-08dcb20b1991
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|36860700013|7416014|82310400026|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?74ZgPy2m+rzM25UdoOtGEgfynJSZKiuOIo8ylbDbhHJuhALU+u0uT+JppVKl?=
 =?us-ascii?Q?KXPHR6oiWfFHy+5jU3OfL/ug5P2hmfQTlAKQIlsFAv3RGFw/8x4KdzeH2ahg?=
 =?us-ascii?Q?o6qEz+tL2qxgUzMxeMq3eBMMPwlsl2jtSyP1Cv6o+mXvfqAWpaNp1FYt8w5s?=
 =?us-ascii?Q?kbIkzZFOLQMi2v/tLxyP8kzcFaA8abIg0Xkw+4DQH5g59YmDHgpwLTw53zwj?=
 =?us-ascii?Q?x8cFbilV7LxNMTowLW7rdtJGBPeiOVT5Z+Rjd5QRiSAw/RGjc3r//QziqWuS?=
 =?us-ascii?Q?WQ68f3ZeTH2AIMDXC7ElH9aUtP3M1u9lv5KYldFQNcbptjfmWqOkax5Bd9ZQ?=
 =?us-ascii?Q?9knlMXekdEtsGbPJ8oTbjVvKy+Y/l98rhtOy9m0J3eVFT5ZtEGALjMnf9zXz?=
 =?us-ascii?Q?Tq/nZKnhQOanRthQbuBG5BG9tWXNo5QcCbdBMTTPgbHx6nxWzvjn/2TVHGQ3?=
 =?us-ascii?Q?Uj7uZty6NUDtNTKJ8i1n9NkcB5z5O/rmvm29YUX0vwS3KOWSv9hOiWgpX4JV?=
 =?us-ascii?Q?6KQ8OI4btK+deSEBBvkXmLh59grKD48i1fguWBZbPrwWmlt4jQTE8QU2VrdU?=
 =?us-ascii?Q?xDmzwBjX5bPmNhPy3nPdu52Ld4kv6KIamXZb1CrBhUOrzBF4DcLirl+3qcDj?=
 =?us-ascii?Q?kKRGL9v8iNbJBtJ67kOohTYZSEjh+TdISSqaVV/f2rJVBWgomre8qxHjSKJ6?=
 =?us-ascii?Q?n+2RDe39hFCmbd8D3s8pwyL/9XwxjM5KY4ps4A3SWWK94/NkDUSCXfnTnhdX?=
 =?us-ascii?Q?dCEAmOvkoZdnYWI2waJ2i8CGSYMWll6V7jxGXO9zWorgO6Bdvtzxndwu7fkk?=
 =?us-ascii?Q?UrgidSawECrglrDhW747X2pul2wpgCWmiAVmGqpDhuIA5O57G1r52bm77+ks?=
 =?us-ascii?Q?wGJATiZ/rSyBzcX8kY0rHo7xSNMVuRf0YXyqJXJJLRTBuCt5jsN5DvCGBBBe?=
 =?us-ascii?Q?8M0rsqOT2ZjH22Sb4kRQtQws9H9ad12VcFj7YXUm4e+xF6Y0zNho3JQMzAME?=
 =?us-ascii?Q?VzdIT/RhVElhArcRS3cT1VYBj3clz27PQsKVisjFtGEqZhDBzqEqaeukR0sS?=
 =?us-ascii?Q?+CQbZuGgyLtizkRdaDmO5kPozcknv8RloRS3BcAk4fe9MOxmjvXkjr7oVgvN?=
 =?us-ascii?Q?H3aYWPwCh272roxLMWjTmX8hNoGl+EjOeMUCgsllbmshUySYScRrckYLMv6V?=
 =?us-ascii?Q?Xf6G8rS0qlN0C7YnU2zsi7dLvMRPXSWAl7rE/aw/7xI4Dx65Cmf4Bsmqh8Jk?=
 =?us-ascii?Q?NciP2qqEYMQOnPdvshCYqkIQQqaBIhqrtXxQtu9LeBQ6gQDUQywnuo8OINbV?=
 =?us-ascii?Q?zOMdb2HWnBhz0q4EnndOLQhB3YILdXa6wiu0g9QP7NpYROeokkQA+Eyu6l2B?=
 =?us-ascii?Q?KDfeZF6Uf+PEfZc7rQ01LD2da3gint/BR3wNup8rPTfKNfrnyg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(7416014)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2024 09:19:52.1528
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 23a101d6-99f4-4f9d-17a3-08dcb20b1991
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DS2PEPF00003441.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8226
Message-ID-Hash: Q5TZMK363CAWTSDTBSQUFVHQMW3HNMRU
X-Message-ID-Hash: Q5TZMK363CAWTSDTBSQUFVHQMW3HNMRU
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Q5TZMK363CAWTSDTBSQUFVHQMW3HNMRU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Move rtk SoundWire dmic helper functions implementation to sdw_utils
folder to make it generic.

Link: https://github.com/thesofproject/linux/pull/5068
Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 include/sound/soc_sdw_utils.h                            | 3 +++
 sound/soc/intel/boards/Makefile                          | 1 -
 sound/soc/intel/boards/sof_sdw_common.h                  | 1 -
 sound/soc/sdw_utils/Makefile                             | 2 +-
 .../sof_sdw_rt_dmic.c => sdw_utils/soc_sdw_rt_dmic.c}    | 9 +++++----
 5 files changed, 9 insertions(+), 7 deletions(-)
 rename sound/soc/{intel/boards/sof_sdw_rt_dmic.c => sdw_utils/soc_sdw_rt_dmic.c} (77%)

diff --git a/include/sound/soc_sdw_utils.h b/include/sound/soc_sdw_utils.h
index 0ffbd9847532..9fa102fc03c3 100644
--- a/include/sound/soc_sdw_utils.h
+++ b/include/sound/soc_sdw_utils.h
@@ -72,4 +72,7 @@ const char *asoc_sdw_get_codec_name(struct device *dev,
 /* DMIC support */
 int asoc_sdw_dmic_init(struct snd_soc_pcm_runtime *rtd);
 
+/* dai_link init callbacks */
+int asoc_sdw_rt_dmic_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai);
+
 #endif
diff --git a/sound/soc/intel/boards/Makefile b/sound/soc/intel/boards/Makefile
index 8ac6f7b5fbee..dca8eecfa820 100644
--- a/sound/soc/intel/boards/Makefile
+++ b/sound/soc/intel/boards/Makefile
@@ -40,7 +40,6 @@ snd-soc-sof-sdw-y += sof_sdw.o				\
 			sof_sdw_rt5682.o sof_sdw_rt700.o	\
 			sof_sdw_rt711.o sof_sdw_rt_sdca_jack_common.o	\
 			sof_sdw_rt712_sdca.o sof_sdw_rt722_sdca.o	\
-			sof_sdw_rt_dmic.o			\
 			sof_sdw_cs42l42.o sof_sdw_cs42l43.o	\
 			sof_sdw_cs_amp.o			\
 			sof_sdw_hdmi.o
diff --git a/sound/soc/intel/boards/sof_sdw_common.h b/sound/soc/intel/boards/sof_sdw_common.h
index 81b654407651..73227ebf8e7b 100644
--- a/sound/soc/intel/boards/sof_sdw_common.h
+++ b/sound/soc/intel/boards/sof_sdw_common.h
@@ -162,7 +162,6 @@ int asoc_sdw_rt700_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai
 int asoc_sdw_rt711_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai);
 int asoc_sdw_rt712_spk_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai);
 int asoc_sdw_rt722_spk_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai);
-int asoc_sdw_rt_dmic_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai);
 int asoc_sdw_rt_amp_spk_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai);
 int asoc_sdw_rt_sdca_jack_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai);
 
diff --git a/sound/soc/sdw_utils/Makefile b/sound/soc/sdw_utils/Makefile
index de8aff8744d8..2c8f70465a12 100644
--- a/sound/soc/sdw_utils/Makefile
+++ b/sound/soc/sdw_utils/Makefile
@@ -1,3 +1,3 @@
 # SPDX-License-Identifier: GPL-2.0-only
-snd-soc-sdw-utils-y := soc_sdw_utils.o soc_sdw_dmic.o
+snd-soc-sdw-utils-y := soc_sdw_utils.o soc_sdw_dmic.o soc_sdw_rt_dmic.o
 obj-$(CONFIG_SND_SOC_SDW_UTILS) += snd-soc-sdw-utils.o
diff --git a/sound/soc/intel/boards/sof_sdw_rt_dmic.c b/sound/soc/sdw_utils/soc_sdw_rt_dmic.c
similarity index 77%
rename from sound/soc/intel/boards/sof_sdw_rt_dmic.c
rename to sound/soc/sdw_utils/soc_sdw_rt_dmic.c
index 64960b059834..7f24806d809d 100644
--- a/sound/soc/intel/boards/sof_sdw_rt_dmic.c
+++ b/sound/soc/sdw_utils/soc_sdw_rt_dmic.c
@@ -1,16 +1,17 @@
 // SPDX-License-Identifier: GPL-2.0-only
+// This file incorporates work covered by the following copyright notice:
 // Copyright (c) 2024 Intel Corporation
+// Copyright (c) 2024 Advanced Micro Devices, Inc.
 
 /*
- * sof_sdw_rt_dmic - Helpers to handle Realtek SDW DMIC from generic machine driver
+ * soc_sdw_rt_dmic - Helpers to handle Realtek SDW DMIC from generic machine driver
  */
 
 #include <linux/device.h>
 #include <linux/errno.h>
 #include <sound/soc.h>
 #include <sound/soc-acpi.h>
-#include "sof_board_helpers.h"
-#include "sof_sdw_common.h"
+#include <sound/soc_sdw_utils.h>
 
 int asoc_sdw_rt_dmic_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai)
 {
@@ -39,4 +40,4 @@ int asoc_sdw_rt_dmic_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_da
 
 	return 0;
 }
-MODULE_IMPORT_NS(SND_SOC_INTEL_SOF_BOARD_HELPERS);
+EXPORT_SYMBOL_NS(asoc_sdw_rt_dmic_rtd_init, SND_SOC_SDW_UTILS);
-- 
2.34.1

