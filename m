Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C7AFB51EB3
	for <lists+alsa-devel@lfdr.de>; Wed, 10 Sep 2025 19:15:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 164E26020A;
	Wed, 10 Sep 2025 19:15:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 164E26020A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1757524544;
	bh=eo1gOvc3N98bAaeAHa9YLPZ/YUa1XTBHgJzNR8TWLJE=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=InwKjcxy05mXV+l3NqLdAQIm/1r4pD2nqFCIkXRXekMKXRzOr2kMGfZnxlMFyfAoV
	 c0CMz7Ej0jvNYDkKu7GoI5p18ond0v9576qUZ/gLphPWfpShwnjTmPiGzTndiD24ll
	 n1uuJEeIFjeRtcyE2aQc5HPf5/cLoU1oE4Hwadlg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 754CDF805CB; Wed, 10 Sep 2025 19:15:10 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DA91DF805C3;
	Wed, 10 Sep 2025 19:15:09 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4C471F8042F; Wed, 10 Sep 2025 19:14:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2066.outbound.protection.outlook.com [40.107.237.66])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E33A0F80134
	for <alsa-devel@alsa-project.org>; Wed, 10 Sep 2025 19:14:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E33A0F80134
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=oQSndI/b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wQma+jVf+W0LCVEoLRZG+kU98P6EivAHxYUnYFjoDFM6QeZ964uAghdzsPTZNhSju4do2oiP+MSFhG+w0nvCgjlWChGjWf2fXB/0h/yHrtv1VGbtj1Qxt8Gjh9b2Hid871P2WhimvvpWVHmBQEckNhHQr7fDlQrDInJvhlZFHcB9IsjQsxLoYW/VMMD2MdoeE9OYNmi6XJ3YN/OqPi7man9zHKPkbGlA4F2p6qjoiRJ2mXtH/ti/50bdUsaglZWzkTtHWwWofb8wktyZ9Np0LAlnHYWBKraLbsXr8cxgquMgD7H8QStgKfTZGxbpxabMfUalRwj5kcaYXuo1REebiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m/WHqlEieSdAEidT1vQbjDvj4mrx3eeRaciDspbJTkQ=;
 b=M56cM/7BbY9kqKXwYTSC/E6Tr7YtTLetVDUZQv79PZ4qwzl5fi8OHYPmio6E+DjHf1RK+h8ZOquNzT9M+D86H77hsc/kJsUV33QO1zbWYxVyYwWGdw3VCzueaWifvXxmmGB/JTJh92V7JFgVmKl+9JI3r6JEhwTVvr7jA+l71e8qbGOSKT6BTC3658HRJc4xgmMRnaevI/LJrGi5M1C/RKKhkdNTARmuo24src6EHN92ePAuIftiUCFCq333aYi5okj/wkPT9nSrR6R8cN1QdnNau7+NXbPd8hbCD7Q+uFo4oBn6BCzL1HIjBswg0phvnQT1xEehlMzEX43gu33fKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m/WHqlEieSdAEidT1vQbjDvj4mrx3eeRaciDspbJTkQ=;
 b=oQSndI/btxMzLsMrFFTMX+dAdpE5k7ilpCBXcNO81JlQWtHpuGjNl62JuKygWVpGM6L4Zhbk8sVp4ySXa8fekjEAe9vebRZk8/fLIfyH2ryAwriONP6kwSLvfVjEsq/B04nf7M1tevMzLMBNBokffMWyRneao15mHkW7ITeMBJo=
Received: from DM6PR01CA0008.prod.exchangelabs.com (2603:10b6:5:296::13) by
 PH8PR12MB6891.namprd12.prod.outlook.com (2603:10b6:510:1cb::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Wed, 10 Sep
 2025 17:14:32 +0000
Received: from CY4PEPF0000EE3C.namprd03.prod.outlook.com
 (2603:10b6:5:296:cafe::2b) by DM6PR01CA0008.outlook.office365.com
 (2603:10b6:5:296::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9115.15 via Frontend Transport; Wed,
 10 Sep 2025 17:14:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CY4PEPF0000EE3C.mail.protection.outlook.com (10.167.242.13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9115.13 via Frontend Transport; Wed, 10 Sep 2025 17:14:31 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 10 Sep
 2025 10:14:30 -0700
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 10 Sep
 2025 10:14:30 -0700
Received: from r9-mach.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Wed, 10 Sep 2025 10:14:25 -0700
From: Venkata Prasad Potturu <venkataprasad.potturu@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
CC: <Vijendar.Mukunda@amd.com>, <Basavaraj.Hiregoudar@amd.com>,
	<Sunil-kumar.Dommati@amd.com>, <syed.sabakareem@amd.com>, "Venkata Prasad
 Potturu" <venkataprasad.potturu@amd.com>, Liam Girdwood
	<lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai
	<tiwai@suse.com>, Greg KH <gregkh@linuxfoundation.org>, Ranjani Sridharan
	<ranjani.sridharan@linux.intel.com>, Daniel Baluta <daniel.baluta@nxp.com>,
	Peter Zijlstra <peterz@infradead.org>, "open list:SOUND - SOC LAYER / DYNAMIC
 AUDIO POWER MANAGEM..." <linux-sound@vger.kernel.org>, open list
	<linux-kernel@vger.kernel.org>
Subject: [PATCH v2] ASoC: amd: acp: Fix incorrect retrival of acp_chip_info
Date: Wed, 10 Sep 2025 22:43:59 +0530
Message-ID: <20250910171419.3682468-1-venkataprasad.potturu@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE3C:EE_|PH8PR12MB6891:EE_
X-MS-Office365-Filtering-Correlation-Id: 643eae52-6160-41be-73ec-08ddf08d81b4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|7416014|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?7V9qS1xvN/pOs1sqyWUcVeON6DLViixYDxOKM0p6Em7CNy8YV0hy/RAUjoPN?=
 =?us-ascii?Q?XgJk3gR/G9xS6t68qXKVPUd+ssPpQ38dBDDnqVUvd8OAKlKxifkdTWpLoRpA?=
 =?us-ascii?Q?+6UTF2XpCkyBxRMkKFK4IxamFJhPToL0LxLYDxR/qzYTL3fKlTffOX5S7oUt?=
 =?us-ascii?Q?F1rveQSQFMkcyznUeHiJzDb4QjfeQI0Yj1Te+PBljQvDUWFPNnkrUOoijUwy?=
 =?us-ascii?Q?YHuQxm+Wt39U3pcUK0odpOTkNlR21ssgC9K82Ep4n7tEf80C8UrzHvKgSmS+?=
 =?us-ascii?Q?xFremJH5Q0oPbBCBFhNtNWiyAqvlhCMxVtsTOFYEMi1XahdmiLitGDNv9ZrN?=
 =?us-ascii?Q?+sA0wIb7wq17g3UpAuMCAJPp71apPu51uzj3VuYRNuswwelLJ1pASInzcCXK?=
 =?us-ascii?Q?sNCpilXBIO/IKhaxqxTna69fA0oIQN7Dk8THe2BMhv46/2zg3/htqWFNVlw6?=
 =?us-ascii?Q?ufAuIZYgI2CdT3pp5ZMVxrZEHV0IXDJX8UujLLyp8V14VXDMNzItmYAI+kaq?=
 =?us-ascii?Q?sjCcgMU0EdRswIor7XDx7PAAbCAhbcysC3sS7LgJADDH75JMdNcUwlFAP43l?=
 =?us-ascii?Q?JOFbbQKvYqHN3eUMAaMGaLe3QRPz4E/04wZh2ABQwqQuFHZrVqbxNcrmW4nM?=
 =?us-ascii?Q?S+D0koeLBC9ZZsT3HZmG03JVn081W2vM6m6qJQS/Ac1+1fvpd96efXL0BBrZ?=
 =?us-ascii?Q?Gs44ga9kHK0UJLiCqw+xdPdnSh5dWMi3FlTO7Fq9SePZVRXQZO0FkWteNjQW?=
 =?us-ascii?Q?NEnz/5hzKLkzwCUndgdW8QkPi3ogJB0zcGx+Tm8auxPVbzqQQukmEtnv81Nn?=
 =?us-ascii?Q?0TgXSJmcsQkY27WxMZnzTwWsZhiDeYM8RQAv7jZaXw2QtQimbeUPJHaYf6p1?=
 =?us-ascii?Q?+Do6bdQCkGLn17AUW0C7Np3KoETyPVMsOj4cEgMySNI+p02BZPSrj1e3Qs3x?=
 =?us-ascii?Q?4zN8v5J+QiiPREpQhpubEs4vswVueubWEj2l2zPBch3MiyIYPUTTI6PXGXnm?=
 =?us-ascii?Q?akx7nCMnfWbWScGaDGnr8CtJsvp06puAouWAQckJYkhPe6V9XRfCZaSb6mew?=
 =?us-ascii?Q?UgcYqDA4Kp1I7Fi1is4rhxiV38d9OZ/iTbVBYoHcJNx5qvC49TK7h5Frrm+0?=
 =?us-ascii?Q?zLMVxWZrCXe2HNz4DGP/DMWwfdWwGprBYCp1VV2UTF6hMvZjtSKreIp93LhB?=
 =?us-ascii?Q?P9+IvLRy3u/ulX/qy0pydgvRZ9gvRUCMjaDyGXYILxsDedpFxhWbixN25R8D?=
 =?us-ascii?Q?wXdB21gtEnfnyqQj2qcSnvY9SuKqQQX1FI5xoztq4WakD0tl3sDkRWEbxn9G?=
 =?us-ascii?Q?6YEN900GB+7oU/t5M6hnIKVRAdxQLpOkp0/8funG113MqohTt/FjFH5iLkhK?=
 =?us-ascii?Q?MsopzM4gZdGb2E+MFWu3rAn/8YfjPE4DtLn3QBnzxNSlgjrikM+T2ImG58Tx?=
 =?us-ascii?Q?gQpNvS5/JyLuRgvwDAbDwY/vdFRO/ihyHX32szAHNE4d2ub2arzF71IIkKBP?=
 =?us-ascii?Q?nb/1hNPJEWb19wk4dlhlGihApLqST8PlbNN1?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(7416014)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2025 17:14:31.2735
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 643eae52-6160-41be-73ec-08ddf08d81b4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CY4PEPF0000EE3C.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6891
Message-ID-Hash: TT6PRZV4VNCPQJNIX5VSIMFDGNOYNHN7
X-Message-ID-Hash: TT6PRZV4VNCPQJNIX5VSIMFDGNOYNHN7
X-MailFrom: venkataprasad.potturu@amd.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TT6PRZV4VNCPQJNIX5VSIMFDGNOYNHN7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Use dev_get_drvdata(dev->parent) instead of dev_get_platdata(dev)
to correctly obtain acp_chip_info members in the acp I2S driver.
Previously, some members were not updated properly due to incorrect
data access, which could potentially lead to null pointer
dereferences.

This issue was missed in the earlier commit
("ASoC: amd: acp: Fix NULL pointer deref in acp_i2s_set_tdm_slot"),
which only addressed set_tdm_slot(). This change ensures that all
relevant functions correctly retrieve acp_chip_info, preventing
further null pointer dereference issues.

Fixes: e3933683b25e ("ASoC: amd: acp: Remove redundant acp_dev_data structure")

Signed-off-by: Venkata Prasad Potturu <venkataprasad.potturu@amd.com>

---

Changes since v1:
- Update the commit description.

 sound/soc/amd/acp/acp-i2s.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/sound/soc/amd/acp/acp-i2s.c b/sound/soc/amd/acp/acp-i2s.c
index 617690362ad7..4ba0a66981ea 100644
--- a/sound/soc/amd/acp/acp-i2s.c
+++ b/sound/soc/amd/acp/acp-i2s.c
@@ -73,7 +73,7 @@ static int acp_i2s_set_fmt(struct snd_soc_dai *cpu_dai,
 			   unsigned int fmt)
 {
 	struct device *dev = cpu_dai->component->dev;
-	struct acp_chip_info *chip = dev_get_platdata(dev);
+	struct acp_chip_info *chip = dev_get_drvdata(dev->parent);
 	int mode;
 
 	mode = fmt & SND_SOC_DAIFMT_FORMAT_MASK;
@@ -199,7 +199,7 @@ static int acp_i2s_hwparams(struct snd_pcm_substream *substream, struct snd_pcm_
 	u32 reg_val, fmt_reg, tdm_fmt;
 	u32 lrclk_div_val, bclk_div_val;
 
-	chip = dev_get_platdata(dev);
+	chip = dev_get_drvdata(dev->parent);
 	rsrc = chip->rsrc;
 
 	/* These values are as per Hardware Spec */
@@ -386,7 +386,7 @@ static int acp_i2s_trigger(struct snd_pcm_substream *substream, int cmd, struct
 {
 	struct acp_stream *stream = substream->runtime->private_data;
 	struct device *dev = dai->component->dev;
-	struct acp_chip_info *chip = dev_get_platdata(dev);
+	struct acp_chip_info *chip = dev_get_drvdata(dev->parent);
 	struct acp_resource *rsrc = chip->rsrc;
 	u32 val, period_bytes, reg_val, ier_val, water_val, buf_size, buf_reg;
 
@@ -516,14 +516,13 @@ static int acp_i2s_trigger(struct snd_pcm_substream *substream, int cmd, struct
 static int acp_i2s_prepare(struct snd_pcm_substream *substream, struct snd_soc_dai *dai)
 {
 	struct device *dev = dai->component->dev;
-	struct acp_chip_info *chip = dev_get_platdata(dev);
+	struct acp_chip_info *chip = dev_get_drvdata(dev->parent);
 	struct acp_resource *rsrc = chip->rsrc;
 	struct acp_stream *stream = substream->runtime->private_data;
 	u32 reg_dma_size = 0, reg_fifo_size = 0, reg_fifo_addr = 0;
 	u32 phy_addr = 0, acp_fifo_addr = 0, ext_int_ctrl;
 	unsigned int dir = substream->stream;
 
-	chip = dev_get_platdata(dev);
 	switch (dai->driver->id) {
 	case I2S_SP_INSTANCE:
 		if (dir == SNDRV_PCM_STREAM_PLAYBACK) {
@@ -632,7 +631,7 @@ static int acp_i2s_startup(struct snd_pcm_substream *substream, struct snd_soc_d
 {
 	struct acp_stream *stream = substream->runtime->private_data;
 	struct device *dev = dai->component->dev;
-	struct acp_chip_info *chip = dev_get_platdata(dev);
+	struct acp_chip_info *chip = dev_get_drvdata(dev->parent);
 	struct acp_resource *rsrc = chip->rsrc;
 	unsigned int dir = substream->stream;
 	unsigned int irq_bit = 0;
-- 
2.43.0

