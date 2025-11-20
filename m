Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 026D4C75787
	for <lists+alsa-devel@lfdr.de>; Thu, 20 Nov 2025 17:51:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 64F166022D;
	Thu, 20 Nov 2025 17:51:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 64F166022D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1763657514;
	bh=dqu3wIineSSGCLEXmX72mItLGq52ufi+3wssHtCe2cA=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=JIetxfNBnMfmCLJIxmX5LpCkKCacKaYI0s6v4n+O3tXcsow8CyCnGJXdhpwPCZFag
	 VQHiW5316iC/HrhdMGWFMmsFDnFABoyc6b1H+LV5wwy334Xk5z5pQTn+3AAdlbU8BA
	 Uid0vOc4F6lqDs8qb/vmalBkfDrF270+U4AfNA0o=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 47F77F805D4; Thu, 20 Nov 2025 17:51:17 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 07B15F805BB;
	Thu, 20 Nov 2025 17:51:17 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7CFBBF8021D; Thu, 20 Nov 2025 10:21:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.3 required=5.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,KHOP_HELO_FCRDNS,T_SPF_HELO_TEMPERROR,T_SPF_TEMPERROR
	shortcircuit=no autolearn=no autolearn_force=no version=3.4.6
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazon11010052.outbound.protection.outlook.com [52.101.85.52])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 46158F8001E
	for <alsa-devel@alsa-project.org>; Thu, 20 Nov 2025 10:21:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 46158F8001E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=selector1 header.b=c6wz+DM4
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bdXnTyLcf4L9FCaDSUbS8Bewnlpd8rIKEhoC6/JTYdn+gvZPcZvav9t3H1rClfwfhxtNzPhIlZ+Z9sFdMMyfNMiVmp/KMUv6JQcieKOov2pJI8Ojzd3CR8DlAtmdV4935ztINV0ysbqYvOtv8CDAGwMusLlTxk9HQ78i4YP5jOfVUGljuSq/gDb6oqyqnBCDWSFr2bwIeK96JgULkCH6h1wry5PGXG+jxzEjIwnC0joU0ZyiVADcRMV5wO/TdNkqvwhs9dysDBh2SGi/1uN8NYYPBaDQigTydf1BCSXew+c9y/ox+MsOrI8s0jRvukKBYGTEKDug8dDqZiDJqefnSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7a6E+V97azwQiTgjqXVzpzpqM+ij+SIyLqCzfZYfpJg=;
 b=JmJnlMc0BNHXVLNjgblgGhLLi7Z9XwN7/+plMI1ebb1tLwYNOiGlpsWOLXSXnwkohMDoVotLQFLPXy1wVca3QvuwbH/U1tyRqIno8IIybQWZooQcxSoyrRreCGTy9ypj8o1qFP+NSwml6OrCmN+R9tOUdMtAwBmhpV6M1cdziuxQd8FJCJpezLPhGcyKyx6gxXlXAaDRnAK0wofnqVy+vnmXgtpVzhi6urubSD0WhcLIAWfe42wporffMYxI04ItJvYdULrVKAPX0yiKcnIo8V0zt3MSIIhoLmY459XeTrR/HXHIQ9Yum1dOrErqnkBqreQaM/Pd3GBFO7VglUkA6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=linaro.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7a6E+V97azwQiTgjqXVzpzpqM+ij+SIyLqCzfZYfpJg=;
 b=c6wz+DM4sjA3G+wdvjiaGjjObKL/Ub0QA0SgjkwnwlzhX+4nf059Ueb6UeQrYK9Mi/ixTnlCHY5BNThGgBWq1CAGsqw9p8PmzSW4ZAfgaw6IU6iL5/CcVI1eVEOQh/V7t+Khf6waEfr216GdgRmJ3TQ9hZfbpuX3VDApZ0RmB4g=
Received: from BN0PR04CA0078.namprd04.prod.outlook.com (2603:10b6:408:ea::23)
 by MN2PR10MB4270.namprd10.prod.outlook.com (2603:10b6:208:1d6::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.11; Thu, 20 Nov
 2025 09:21:11 +0000
Received: from BN1PEPF00005FFE.namprd05.prod.outlook.com
 (2603:10b6:408:ea:cafe::74) by BN0PR04CA0078.outlook.office365.com
 (2603:10b6:408:ea::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.11 via Frontend Transport; Thu,
 20 Nov 2025 09:21:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BN1PEPF00005FFE.mail.protection.outlook.com (10.167.243.230) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.9 via Frontend Transport; Thu, 20 Nov 2025 09:21:10 +0000
Received: from DLEE215.ent.ti.com (157.170.170.118) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 20 Nov
 2025 03:21:08 -0600
Received: from DLEE200.ent.ti.com (157.170.170.75) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 20 Nov
 2025 03:21:07 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 20 Nov 2025 03:21:07 -0600
Received: from LTPW0EX92E.dhcp.ti.com ([10.249.133.122])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5AK9L1c13383883;
	Thu, 20 Nov 2025 03:21:02 -0600
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
Subject: [PATCH v1 1/8] ASoC: tas2783A: sdw_utils: support ch 3 & 4
Date: Thu, 20 Nov 2025 14:50:43 +0530
Message-ID: <20251120092050.1218-1-niranjan.hy@ti.com>
X-Mailer: git-send-email 2.33.0.windows.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00005FFE:EE_|MN2PR10MB4270:EE_
X-MS-Office365-Filtering-Correlation-Id: a01b7852-8f73-40af-96ba-08de2816251d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|7416014|376014|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?4voA6BoIkapejpYbhTqzSo4pMgEKtMxVysKmGuewvju89SiXmp01gqvIxmxv?=
 =?us-ascii?Q?toPyUyVcjjtYX1bhGk+PVxb+jutz12KELSoImo1ed+Evqy2ONRFhofrwtKeZ?=
 =?us-ascii?Q?cCGU1OL16BCsa/NEAAaqxYyxc8YJHuZV2t9/Zv39rrChv64VxL5uuVbrdJBV?=
 =?us-ascii?Q?AMeLry8qYSbYb/Tk2V+9MeJunPesysCKRpePsGi7UmSbmzXGH+e5KoNgASK2?=
 =?us-ascii?Q?T2zj73P3k3HphSGVg5aYC9NKzhJYfEQ0lWqh5VH7cZr0MTiHomX3iQ7ArXgw?=
 =?us-ascii?Q?LHnyALh67TtUyCPYXhwUsRqN+s02zYw0eiKHSrPoxIskOIc2f+8HTmITwYey?=
 =?us-ascii?Q?VHJ+RVV3xM1BX61WzUERoQpoumUfub69XtJzdYjgUoHKT4IOEYRlD8E7TcTd?=
 =?us-ascii?Q?lFrFFGuMF5n2IM8eTiD9+5KzA374/DjbkTu13myJv0fUKQUt8BsuLeyr6Rkh?=
 =?us-ascii?Q?2ifPhCjqJ1dzR7uF8iJnrwII7+GJyjL4UzQc9mT/y9OiceRE1bqd0lNTBjc4?=
 =?us-ascii?Q?4oQm4nxtSeqyeHFkLAnbTWKNJ/TvPxG7YbjX5QsMkMX97y+WJNa25h7ONyVl?=
 =?us-ascii?Q?6mkJ1FWXDo8RJTTIuPwaIpolRcv+7e10QLBpxGvoDqbgHzjLr997Z+lGVilY?=
 =?us-ascii?Q?BFHnm0eT0HhKCms0hIp7clxH4hpPpEd2d6rm2rrPtYWLuEKUDnR8iKoeqM7c?=
 =?us-ascii?Q?O4TpD7x7KS1+UWyS9vT3iPnWan+fjM2gFYlSNFQXXUNE079r3RYKvl+L6Izu?=
 =?us-ascii?Q?ACURhIQsWWnMgia3+5PTYuEZyNykMvazHaZ56MTg3XhHK3G3RNleojZ3ZaQQ?=
 =?us-ascii?Q?bkSfmNYPWrqFYi3hcsorPmG0EVwoo6qvdXb0FpEqx2g8QFKwApn4iu5F/5gc?=
 =?us-ascii?Q?OXymOgnUMdBYpU9KZ7uPth1tfsI4PcXvVzHNw+pFbJIzdtIQVxQSSQFgpYs8?=
 =?us-ascii?Q?klhcLGuDI85UwR2xMaUOK8Wm2pREoffLN8DI6KajgYn/eVlnv+9JQI4pNXNb?=
 =?us-ascii?Q?1EjKPciOtc5j1+0DHLLY08P4clVmOCvtZgT0ciXG97zgrmDkq6DVGxDFXi9C?=
 =?us-ascii?Q?8eCo5rWIrbE9ZeO0+kYwlyB+nBO7Eo0qwGL25syJjJbK/OffB5tTeoqJNDQ1?=
 =?us-ascii?Q?XrAvMqSwls1RxGRJW9Pqhh2WOLxU4hxKTqowN16XZTR9OyVZt/N7ny4usBbz?=
 =?us-ascii?Q?akzWR9ulwZVyv8HEZxkG4CUOvkq7lQjg3PO3/c9yOvgOzorfvDHURZktwexC?=
 =?us-ascii?Q?kQep/cL2nK4unjAQgS6E2d/1679XNmsENi6LwGIgPYYfY3jciOlBwIlbwMGi?=
 =?us-ascii?Q?pgGhDs9janCIrRy60HhRrSuS2AxoZDhXoewQ76ldBaC73rR+71WvV62t7bPk?=
 =?us-ascii?Q?YjNYw3oWFCJIJrL6yM/xiTVbfn6+WNAmrjw3ELAdxUUVlOI2ANUWirqGepJE?=
 =?us-ascii?Q?+zW+gRg/UFjM5mLuv1ZhFl8//lTai/dl1GbKzimEOKg8o9CVzPmD55dml5ki?=
 =?us-ascii?Q?M3AIq7MejeebN7itGEAVr/DAcFVZdoonNg7r/WU6iO7OoiU/l9oCEVvaK0do?=
 =?us-ascii?Q?R7sT2geYU6SMB/G7oH4=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(7416014)(376014)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2025 09:21:10.9020
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 a01b7852-8f73-40af-96ba-08de2816251d
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN1PEPF00005FFE.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB4270
X-MailFrom: niranjan.hy@ti.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: SCJLGN7WC52HBANKDA5RN4VHZO5T4NM6
X-Message-ID-Hash: SCJLGN7WC52HBANKDA5RN4VHZO5T4NM6
X-Mailman-Approved-At: Thu, 20 Nov 2025 16:51:12 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SCJLGN7WC52HBANKDA5RN4VHZO5T4NM6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

 Currently the machine driver for tas2783A can only
support 2 channels. This patch adds support for
2 channel playback with 4 device setup.

Signed-off-by: Niranjan H Y <niranjan.hy@ti.com>
---
 sound/soc/sdw_utils/soc_sdw_ti_amp.c |  4 ++++
 sound/soc/sdw_utils/soc_sdw_utils.c  | 22 ++++++++++++++++++----
 2 files changed, 22 insertions(+), 4 deletions(-)

diff --git a/sound/soc/sdw_utils/soc_sdw_ti_amp.c b/sound/soc/sdw_utils/soc_sdw_ti_amp.c
index cbd60faec..488ef2ef4 100644
--- a/sound/soc/sdw_utils/soc_sdw_ti_amp.c
+++ b/sound/soc/sdw_utils/soc_sdw_ti_amp.c
@@ -58,6 +58,10 @@ int asoc_sdw_ti_spk_rtd_init(struct snd_soc_pcm_runtime *rtd,
 			strscpy(speaker, "Left Spk", sizeof(speaker));
 		} else if (!strncmp(prefix, "tas2783-2", strlen("tas2783-2"))) {
 			strscpy(speaker, "Right Spk", sizeof(speaker));
+		} else if (!strncmp(prefix, "tas2783-3", strlen("tas2783-3"))) {
+			strscpy(speaker, "Left Spk2", sizeof(speaker));
+		} else if (!strncmp(prefix, "tas2783-4", strlen("tas2783-4"))) {
+			strscpy(speaker, "Right Spk2", sizeof(speaker));
 		} else {
 			ret = -EINVAL;
 			dev_err(card->dev, "unhandled prefix %s", prefix);
diff --git a/sound/soc/sdw_utils/soc_sdw_utils.c b/sound/soc/sdw_utils/soc_sdw_utils.c
index 824fb613c..ec00f13a6 100644
--- a/sound/soc/sdw_utils/soc_sdw_utils.c
+++ b/sound/soc/sdw_utils/soc_sdw_utils.c
@@ -40,11 +40,25 @@ static const struct snd_soc_dapm_widget lr_spk_widgets[] = {
 	SND_SOC_DAPM_SPK("Right Spk", NULL),
 };
 
+static const struct snd_soc_dapm_widget lr_4spk_widgets[] = {
+	SND_SOC_DAPM_SPK("Left Spk", NULL),
+	SND_SOC_DAPM_SPK("Right Spk", NULL),
+	SND_SOC_DAPM_SPK("Left Spk2", NULL),
+	SND_SOC_DAPM_SPK("Right Spk2", NULL),
+};
+
 static const struct snd_kcontrol_new lr_spk_controls[] = {
 	SOC_DAPM_PIN_SWITCH("Left Spk"),
 	SOC_DAPM_PIN_SWITCH("Right Spk"),
 };
 
+static const struct snd_kcontrol_new lr_4spk_controls[] = {
+	SOC_DAPM_PIN_SWITCH("Left Spk"),
+	SOC_DAPM_PIN_SWITCH("Right Spk"),
+	SOC_DAPM_PIN_SWITCH("Left Spk2"),
+	SOC_DAPM_PIN_SWITCH("Right Spk2"),
+};
+
 static const struct snd_soc_dapm_widget rt700_widgets[] = {
 	SND_SOC_DAPM_HP("Headphones", NULL),
 	SND_SOC_DAPM_MIC("AMIC", NULL),
@@ -69,10 +83,10 @@ struct asoc_sdw_codec_info codec_info_list[] = {
 				.dailink = {SOC_SDW_AMP_OUT_DAI_ID, SOC_SDW_AMP_IN_DAI_ID},
 				.init = asoc_sdw_ti_amp_init,
 				.rtd_init = asoc_sdw_ti_spk_rtd_init,
-				.controls = lr_spk_controls,
-				.num_controls = ARRAY_SIZE(lr_spk_controls),
-				.widgets = lr_spk_widgets,
-				.num_widgets = ARRAY_SIZE(lr_spk_widgets),
+				.controls = lr_4spk_controls,
+				.num_controls = ARRAY_SIZE(lr_4spk_controls),
+				.widgets = lr_4spk_widgets,
+				.num_widgets = ARRAY_SIZE(lr_4spk_widgets),
 			},
 		},
 		.dai_num = 1,
-- 
2.25.1

