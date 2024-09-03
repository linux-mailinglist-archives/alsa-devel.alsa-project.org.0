Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B46C0969BF7
	for <lists+alsa-devel@lfdr.de>; Tue,  3 Sep 2024 13:35:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A1924843;
	Tue,  3 Sep 2024 13:35:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A1924843
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1725363357;
	bh=mPH1eQkY2c6pfp7i55vbvaSq1AN7XRAZG/wPCY+9Bbc=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Jt2jPHhMLWXEVEhtJN7BsmjCJXQH4MOv9aB0HPgWeLEYa4Tmtx9g1C0jklSRJdfc1
	 ZyDnfVUTsumqaxWa+ISJeoB9140S4eKtotA8VHVHWck050I0AWlYRL76o8Da4TEMZY
	 uFYXbxXIOATrj2aD4V+qxSmv8ZRBB6Wyu7PBUDNw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 134D4F805F9; Tue,  3 Sep 2024 13:35:11 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A140BF80603;
	Tue,  3 Sep 2024 13:35:11 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 61D91F8059F; Tue,  3 Sep 2024 13:35:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20606.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2414::606])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E0880F80199
	for <alsa-devel@alsa-project.org>; Tue,  3 Sep 2024 13:35:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E0880F80199
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=LJjtrtP1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UbOiU7vyAcHUG2dICCZzaWvrO+do/wIwJ/XyG3dxZ6w/W1g0akVIfjrFdQef8kTfW/fGuJXs8+ai4nUCnnRABrS7IxXee5d8ieg8GwX5imP08ZnPHbYEFvPTO47rY1nKsvwbk9KZH7TzKTJg8K5Z4NZJOx9TW1gRUL2nksz4WU82QJsak3kqdQI4DFL6jizFeLu9HioOnVuNbtKPoBdoovnWfqmkG90U53WcwS61GyybZJw/9rB0E0JzSTNckk2DdW0zBhL//YeIFWHje05F7lFBBMbL5lo9jbQa9mU4pjUUa5Unj8z72m53wU0NiR8tIqxMRnlKyL2QtP9D1SMQrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SG7wZ6YM1q45EvH4nB1/vewtBNpPEVGhKnFgAICTw8w=;
 b=OODraAG4AaUILrj/cvYxTY7+6eZdOUdDG/c1M9U8zffBQ9P50q6QXV0KT/Fs/Jn/0nSqzR61iaplqbijcludLDaXeONXnP/0LGFBGZIaEF4dqExmzdInY896UcVLXE3nSo4Hw1EuSqI1eEDVgCgEltY2ti+LT0OHPlhDFBWM0W93MVu24OgKxFdn7/5xlu98oOJoM5j+nbp6/NZIVuWYB2UESQYFHULS9mRpzEwWvcCPu3+Ykek3ygt51gKI79J0F0iCDOZlMMVkF38SXonKzZziBA3bZqg3EpBTMWuMqYvdHnJpoO+kSeYo2BqcvQajywftRhI/wzEc4QDORJJo9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SG7wZ6YM1q45EvH4nB1/vewtBNpPEVGhKnFgAICTw8w=;
 b=LJjtrtP1+dTVRp3vg05bvQp1I/XxtIZ4mrg8RbPmCNkYOGaLT3TnTO7jdZ1keMokRoSKsLyUmEBYR6r2CDfqwW/seteu5IMuOKzlYf49qhfaNGDnpiOTij7eIMsNaJwELWJXA5013vn2afW+bouHbCN2LQbgEvE6L4Wu5FI6CuE=
Received: from DS0PR17CA0018.namprd17.prod.outlook.com (2603:10b6:8:191::18)
 by CH2PR12MB4120.namprd12.prod.outlook.com (2603:10b6:610:7b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.23; Tue, 3 Sep
 2024 11:34:55 +0000
Received: from DS1PEPF00017097.namprd05.prod.outlook.com
 (2603:10b6:8:191:cafe::7b) by DS0PR17CA0018.outlook.office365.com
 (2603:10b6:8:191::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.20 via Frontend
 Transport; Tue, 3 Sep 2024 11:34:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DS1PEPF00017097.mail.protection.outlook.com (10.167.18.101) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7918.13 via Frontend Transport; Tue, 3 Sep 2024 11:34:54 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 3 Sep
 2024 06:34:54 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 3 Sep
 2024 06:34:53 -0500
Received: from prasad-r9-mach.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 3 Sep 2024 06:34:45 -0500
From: Venkata Prasad Potturu <venkataprasad.potturu@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
CC: <Vijendar.Mukunda@amd.com>, <Basavaraj.Hiregoudar@amd.com>,
	<Sunil-kumar.Dommati@amd.com>, <syed.sabakareem@amd.com>, "Venkata Prasad
 Potturu" <venkataprasad.potturu@amd.com>, Liam Girdwood
	<lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai
	<tiwai@suse.com>, Syed Saba Kareem <Syed.SabaKareem@amd.com>, Jeff Johnson
	<quic_jjohnson@quicinc.com>, Kuninori Morimoto
	<kuninori.morimoto.gx@renesas.com>, "open list:SOUND - SOC LAYER / DYNAMIC
 AUDIO POWER MANAGEM..." <linux-sound@vger.kernel.org>, open list
	<linux-kernel@vger.kernel.org>
Subject: [PATCH 02/12] ASoC: amd: acp: Refactor I2S dai driver
Date: Tue, 3 Sep 2024 17:04:17 +0530
Message-ID: <20240903113427.182997-3-venkataprasad.potturu@amd.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240903113427.182997-1-venkataprasad.potturu@amd.com>
References: <20240903113427.182997-1-venkataprasad.potturu@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: venkataprasad.potturu@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017097:EE_|CH2PR12MB4120:EE_
X-MS-Office365-Filtering-Correlation-Id: 98cf2d25-547c-47c5-fd80-08dccc0c6ed4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|376014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?N6eV2MTWdvrXIXTvA++53RHAGcCdVI73tOkyq0j+WCSM0StQUj1LmHw9hI7w?=
 =?us-ascii?Q?rX/OpGIriZ+nOCE44pxY+zaEZZqGWXTCV4a4oWhRZ2588lEDUEyPHPrnIKs5?=
 =?us-ascii?Q?3eqLdH6jcA5IcreeoO8ntGemkIIlzh+zjaN21BqluC7KRNurUUFDI4kPYD6c?=
 =?us-ascii?Q?FHHNMGncS0M/I/vgcYPZsSuLVMwHLX3eUh+hYJqkzi7og4p+KfSGjuvdf5pT?=
 =?us-ascii?Q?Qy3e62X7CRQYJ0zNy7g0mK7x3919sp2FNPuatbcTU1tUyYEokGAvnKuzFHOO?=
 =?us-ascii?Q?vYeU+FIAxBk4AtzfUoKedAisZgmFN8fxT/oVLlAEnwRw/0ShiUlnwZFAwWzi?=
 =?us-ascii?Q?/87zChIt646te1MUqMO0V582s3M3gXt6h/zTqML15lThZJ7knHlipPKdt1IP?=
 =?us-ascii?Q?vnzrO4JWtNRJhK7LOzyfkx/kxbrP9HisaEeP4hljebGnTkhmO9E5Gfhobr0t?=
 =?us-ascii?Q?b2piRoIpe3O0MJiAX9creA/b8SM/PcXR1YpS9CJulMJqDrqfLRAjRn8ctNz8?=
 =?us-ascii?Q?h6ArlerWtE7G4pOBBrQd4hBoxIO565K25YtdJKapsfIFBw0fJkoDIoX3a1ZJ?=
 =?us-ascii?Q?rcHIiwMaFiK8cTFMBO4Uj1ExDqWvBcEmie47joUo2RuW4k0doEfSIG5QBvFG?=
 =?us-ascii?Q?oPsuq8a0ZhQAc5/tbUygmVg5eWNMyuit5xfLUrr+WZbGeIkETlMHSFax0yZt?=
 =?us-ascii?Q?K5vOghnu82JNn7vx/kkMFCJdIfaAJ7k+n1DiPkifuP0HVILWAtHQkMwRNBjV?=
 =?us-ascii?Q?EEkizcwg8dvRVZFZBoaHgaB4rAtWjCFd+BbZxHn3/2MdHNUrV/6PoRyyPJt9?=
 =?us-ascii?Q?iCbuGinyWL6Vl8mHdwKUPdCu7ew/HK0hkW+V0NU3RH3y3JX5xyHKjqWN02y9?=
 =?us-ascii?Q?kJGcsC+BJvJ6NowSRCQKw/5XQkS/Q3daa+Gz0AAeNJAOEnFFv/Y1zLw0ZDem?=
 =?us-ascii?Q?Ck2YMGBVNLnjoGDoq+FqQ2RCYvZ3kiAVeHuKwYC4T908pvPr0zS+8oQsKhM1?=
 =?us-ascii?Q?HzKATHRhMOKb4+I6fmfICIxgD2/ouykleu747wee54PP4u3BBeozwwxxPxOV?=
 =?us-ascii?Q?aubf+5PlWZd2VUV6FU6YzK0rUbxxAFgQaSJ2L3L2PgTmih1QNgSN3xpC7dMn?=
 =?us-ascii?Q?bzqpjnHPjXNNefxGqWrpos2PhP2waPVwhMoe08lW3vKAfviJf28ZJqTBtk2a?=
 =?us-ascii?Q?2D8RwoFRH5/3LpzBGgNTyGPnPEM86zi3kUGF39Mv+l3BVDRccRbaZHH2/K9i?=
 =?us-ascii?Q?QoWhOqBCtphKzxQcfmatLdwAYsI9I6SVZHDaWXkcahYdpX0yCp6y/lRhYhDU?=
 =?us-ascii?Q?1Ywej2b49LrjtzupQtoFf8V1Diq1jt0r8S8b8BuJNoAz2cHjydSXl8M7+QsK?=
 =?us-ascii?Q?0EMhluXqLNaWNRxG+OpsGGbTMXyN+c8n2q8iOI1KbhkCEyQboyxsJ1/rfyYX?=
 =?us-ascii?Q?EUnrzmSJYlg=3D?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2024 11:34:54.9956
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 98cf2d25-547c-47c5-fd80-08dccc0c6ed4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DS1PEPF00017097.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4120
Message-ID-Hash: 7UW27VPEKP67XBAWRUCGZZROXBVQV3GE
X-Message-ID-Hash: 7UW27VPEKP67XBAWRUCGZZROXBVQV3GE
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7UW27VPEKP67XBAWRUCGZZROXBVQV3GE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

All I2S instances are connected to different powertile form acp6.0
onwards, refactor dai driver to support all I2S instances for all acp
platforms.

Signed-off-by: Venkata Prasad Potturu <venkataprasad.potturu@amd.com>
---
 sound/soc/amd/acp/acp-i2s.c           | 49 ++++++++---------
 sound/soc/amd/acp/acp-legacy-common.c | 32 +++++------
 sound/soc/amd/acp/amd.h               | 16 +++---
 sound/soc/amd/acp/chip_offset_byte.h  | 77 ++++++++++++++-------------
 4 files changed, 90 insertions(+), 84 deletions(-)

diff --git a/sound/soc/amd/acp/acp-i2s.c b/sound/soc/amd/acp/acp-i2s.c
index 5d1d27078626..aca99020120a 100644
--- a/sound/soc/amd/acp/acp-i2s.c
+++ b/sound/soc/amd/acp/acp-i2s.c
@@ -339,16 +339,16 @@ static int acp_i2s_trigger(struct snd_pcm_substream *substream, int cmd, struct
 		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
 			switch (dai->driver->id) {
 			case I2S_BT_INSTANCE:
-				water_val = ACP_BT_TX_INTR_WATERMARK_SIZE;
+				water_val = ACP_BT_TX_INTR_WATERMARK_SIZE(adata);
 				reg_val = ACP_BTTDM_ITER;
 				ier_val = ACP_BTTDM_IER;
-				buf_reg = ACP_BT_TX_RINGBUFSIZE;
+				buf_reg = ACP_BT_TX_RINGBUFSIZE(adata);
 				break;
 			case I2S_SP_INSTANCE:
-				water_val = ACP_I2S_TX_INTR_WATERMARK_SIZE;
+				water_val = ACP_I2S_TX_INTR_WATERMARK_SIZE(adata);
 				reg_val = ACP_I2STDM_ITER;
 				ier_val = ACP_I2STDM_IER;
-				buf_reg = ACP_I2S_TX_RINGBUFSIZE;
+				buf_reg = ACP_I2S_TX_RINGBUFSIZE(adata);
 				break;
 			case I2S_HS_INSTANCE:
 				water_val = ACP_HS_TX_INTR_WATERMARK_SIZE;
@@ -363,16 +363,16 @@ static int acp_i2s_trigger(struct snd_pcm_substream *substream, int cmd, struct
 		} else {
 			switch (dai->driver->id) {
 			case I2S_BT_INSTANCE:
-				water_val = ACP_BT_RX_INTR_WATERMARK_SIZE;
+				water_val = ACP_BT_RX_INTR_WATERMARK_SIZE(adata);
 				reg_val = ACP_BTTDM_IRER;
 				ier_val = ACP_BTTDM_IER;
-				buf_reg = ACP_BT_RX_RINGBUFSIZE;
+				buf_reg = ACP_BT_RX_RINGBUFSIZE(adata);
 				break;
 			case I2S_SP_INSTANCE:
-				water_val = ACP_I2S_RX_INTR_WATERMARK_SIZE;
+				water_val = ACP_I2S_RX_INTR_WATERMARK_SIZE(adata);
 				reg_val = ACP_I2STDM_IRER;
 				ier_val = ACP_I2STDM_IER;
-				buf_reg = ACP_I2S_RX_RINGBUFSIZE;
+				buf_reg = ACP_I2S_RX_RINGBUFSIZE(adata);
 				break;
 			case I2S_HS_INSTANCE:
 				water_val = ACP_HS_RX_INTR_WATERMARK_SIZE;
@@ -385,6 +385,7 @@ static int acp_i2s_trigger(struct snd_pcm_substream *substream, int cmd, struct
 				return -EINVAL;
 			}
 		}
+
 		writel(period_bytes, adata->acp_base + water_val);
 		writel(buf_size, adata->acp_base + buf_reg);
 		if (rsrc->soc_mclk)
@@ -463,43 +464,43 @@ static int acp_i2s_prepare(struct snd_pcm_substream *substream, struct snd_soc_d
 	switch (dai->driver->id) {
 	case I2S_SP_INSTANCE:
 		if (dir == SNDRV_PCM_STREAM_PLAYBACK) {
-			reg_dma_size = ACP_I2S_TX_DMA_SIZE;
+			reg_dma_size = ACP_I2S_TX_DMA_SIZE(adata);
 			acp_fifo_addr = rsrc->sram_pte_offset +
 						SP_PB_FIFO_ADDR_OFFSET;
-			reg_fifo_addr =	ACP_I2S_TX_FIFOADDR;
-			reg_fifo_size = ACP_I2S_TX_FIFOSIZE;
+			reg_fifo_addr =	ACP_I2S_TX_FIFOADDR(adata);
+			reg_fifo_size = ACP_I2S_TX_FIFOSIZE(adata);
 
 			phy_addr = I2S_SP_TX_MEM_WINDOW_START + stream->reg_offset;
-			writel(phy_addr, adata->acp_base + ACP_I2S_TX_RINGBUFADDR);
+			writel(phy_addr, adata->acp_base + ACP_I2S_TX_RINGBUFADDR(adata));
 		} else {
-			reg_dma_size = ACP_I2S_RX_DMA_SIZE;
+			reg_dma_size = ACP_I2S_RX_DMA_SIZE(adata);
 			acp_fifo_addr = rsrc->sram_pte_offset +
 						SP_CAPT_FIFO_ADDR_OFFSET;
-			reg_fifo_addr = ACP_I2S_RX_FIFOADDR;
-			reg_fifo_size = ACP_I2S_RX_FIFOSIZE;
+			reg_fifo_addr = ACP_I2S_RX_FIFOADDR(adata);
+			reg_fifo_size = ACP_I2S_RX_FIFOSIZE(adata);
 			phy_addr = I2S_SP_RX_MEM_WINDOW_START + stream->reg_offset;
-			writel(phy_addr, adata->acp_base + ACP_I2S_RX_RINGBUFADDR);
+			writel(phy_addr, adata->acp_base + ACP_I2S_RX_RINGBUFADDR(adata));
 		}
 		break;
 	case I2S_BT_INSTANCE:
 		if (dir == SNDRV_PCM_STREAM_PLAYBACK) {
-			reg_dma_size = ACP_BT_TX_DMA_SIZE;
+			reg_dma_size = ACP_BT_TX_DMA_SIZE(adata);
 			acp_fifo_addr = rsrc->sram_pte_offset +
 						BT_PB_FIFO_ADDR_OFFSET;
-			reg_fifo_addr = ACP_BT_TX_FIFOADDR;
-			reg_fifo_size = ACP_BT_TX_FIFOSIZE;
+			reg_fifo_addr = ACP_BT_TX_FIFOADDR(adata);
+			reg_fifo_size = ACP_BT_TX_FIFOSIZE(adata);
 
 			phy_addr = I2S_BT_TX_MEM_WINDOW_START + stream->reg_offset;
-			writel(phy_addr, adata->acp_base + ACP_BT_TX_RINGBUFADDR);
+			writel(phy_addr, adata->acp_base + ACP_BT_TX_RINGBUFADDR(adata));
 		} else {
-			reg_dma_size = ACP_BT_RX_DMA_SIZE;
+			reg_dma_size = ACP_BT_RX_DMA_SIZE(adata);
 			acp_fifo_addr = rsrc->sram_pte_offset +
 						BT_CAPT_FIFO_ADDR_OFFSET;
-			reg_fifo_addr = ACP_BT_RX_FIFOADDR;
-			reg_fifo_size = ACP_BT_RX_FIFOSIZE;
+			reg_fifo_addr = ACP_BT_RX_FIFOADDR(adata);
+			reg_fifo_size = ACP_BT_RX_FIFOSIZE(adata);
 
 			phy_addr = I2S_BT_TX_MEM_WINDOW_START + stream->reg_offset;
-			writel(phy_addr, adata->acp_base + ACP_BT_RX_RINGBUFADDR);
+			writel(phy_addr, adata->acp_base + ACP_BT_RX_RINGBUFADDR(adata));
 		}
 		break;
 	case I2S_HS_INSTANCE:
diff --git a/sound/soc/amd/acp/acp-legacy-common.c b/sound/soc/amd/acp/acp-legacy-common.c
index 3cc083fac837..be01b178172e 100644
--- a/sound/soc/amd/acp/acp-legacy-common.c
+++ b/sound/soc/amd/acp/acp-legacy-common.c
@@ -113,40 +113,40 @@ static int set_acp_i2s_dma_fifo(struct snd_pcm_substream *substream,
 	switch (dai->driver->id) {
 	case I2S_SP_INSTANCE:
 		if (dir == SNDRV_PCM_STREAM_PLAYBACK) {
-			reg_dma_size = ACP_I2S_TX_DMA_SIZE;
+			reg_dma_size = ACP_I2S_TX_DMA_SIZE(adata);
 			acp_fifo_addr = rsrc->sram_pte_offset +
 					SP_PB_FIFO_ADDR_OFFSET;
-			reg_fifo_addr = ACP_I2S_TX_FIFOADDR;
-			reg_fifo_size = ACP_I2S_TX_FIFOSIZE;
+			reg_fifo_addr = ACP_I2S_TX_FIFOADDR(adata);
+			reg_fifo_size = ACP_I2S_TX_FIFOSIZE(adata);
 			phy_addr = I2S_SP_TX_MEM_WINDOW_START + stream->reg_offset;
-			writel(phy_addr, adata->acp_base + ACP_I2S_TX_RINGBUFADDR);
+			writel(phy_addr, adata->acp_base + ACP_I2S_TX_RINGBUFADDR(adata));
 		} else {
-			reg_dma_size = ACP_I2S_RX_DMA_SIZE;
+			reg_dma_size = ACP_I2S_RX_DMA_SIZE(adata);
 			acp_fifo_addr = rsrc->sram_pte_offset +
 					SP_CAPT_FIFO_ADDR_OFFSET;
-			reg_fifo_addr = ACP_I2S_RX_FIFOADDR;
-			reg_fifo_size = ACP_I2S_RX_FIFOSIZE;
+			reg_fifo_addr = ACP_I2S_RX_FIFOADDR(adata);
+			reg_fifo_size = ACP_I2S_RX_FIFOSIZE(adata);
 			phy_addr = I2S_SP_RX_MEM_WINDOW_START + stream->reg_offset;
-			writel(phy_addr, adata->acp_base + ACP_I2S_RX_RINGBUFADDR);
+			writel(phy_addr, adata->acp_base + ACP_I2S_RX_RINGBUFADDR(adata));
 		}
 		break;
 	case I2S_BT_INSTANCE:
 		if (dir == SNDRV_PCM_STREAM_PLAYBACK) {
-			reg_dma_size = ACP_BT_TX_DMA_SIZE;
+			reg_dma_size = ACP_BT_TX_DMA_SIZE(adata);
 			acp_fifo_addr = rsrc->sram_pte_offset +
 					BT_PB_FIFO_ADDR_OFFSET;
-			reg_fifo_addr = ACP_BT_TX_FIFOADDR;
-			reg_fifo_size = ACP_BT_TX_FIFOSIZE;
+			reg_fifo_addr = ACP_BT_TX_FIFOADDR(adata);
+			reg_fifo_size = ACP_BT_TX_FIFOSIZE(adata);
 			phy_addr = I2S_BT_TX_MEM_WINDOW_START + stream->reg_offset;
-			writel(phy_addr, adata->acp_base + ACP_BT_TX_RINGBUFADDR);
+			writel(phy_addr, adata->acp_base + ACP_BT_TX_RINGBUFADDR(adata));
 		} else {
-			reg_dma_size = ACP_BT_RX_DMA_SIZE;
+			reg_dma_size = ACP_BT_RX_DMA_SIZE(adata);
 			acp_fifo_addr = rsrc->sram_pte_offset +
 					BT_CAPT_FIFO_ADDR_OFFSET;
-			reg_fifo_addr = ACP_BT_RX_FIFOADDR;
-			reg_fifo_size = ACP_BT_RX_FIFOSIZE;
+			reg_fifo_addr = ACP_BT_RX_FIFOADDR(adata);
+			reg_fifo_size = ACP_BT_RX_FIFOSIZE(adata);
 			phy_addr = I2S_BT_TX_MEM_WINDOW_START + stream->reg_offset;
-			writel(phy_addr, adata->acp_base + ACP_BT_RX_RINGBUFADDR);
+			writel(phy_addr, adata->acp_base + ACP_BT_RX_RINGBUFADDR(adata));
 		}
 		break;
 	case I2S_HS_INSTANCE:
diff --git a/sound/soc/amd/acp/amd.h b/sound/soc/amd/acp/amd.h
index 4f0cd7dd04e5..9fb4e234d518 100644
--- a/sound/soc/amd/acp/amd.h
+++ b/sound/soc/amd/acp/amd.h
@@ -259,12 +259,12 @@ static inline u64 acp_get_byte_count(struct acp_dev_data *adata, int dai_id, int
 	if (direction == SNDRV_PCM_STREAM_PLAYBACK) {
 		switch (dai_id) {
 		case I2S_BT_INSTANCE:
-			high = readl(adata->acp_base + ACP_BT_TX_LINEARPOSITIONCNTR_HIGH);
-			low = readl(adata->acp_base + ACP_BT_TX_LINEARPOSITIONCNTR_LOW);
+			high = readl(adata->acp_base + ACP_BT_TX_LINEARPOSITIONCNTR_HIGH(adata));
+			low = readl(adata->acp_base + ACP_BT_TX_LINEARPOSITIONCNTR_LOW(adata));
 			break;
 		case I2S_SP_INSTANCE:
-			high = readl(adata->acp_base + ACP_I2S_TX_LINEARPOSITIONCNTR_HIGH);
-			low = readl(adata->acp_base + ACP_I2S_TX_LINEARPOSITIONCNTR_LOW);
+			high = readl(adata->acp_base + ACP_I2S_TX_LINEARPOSITIONCNTR_HIGH(adata));
+			low = readl(adata->acp_base + ACP_I2S_TX_LINEARPOSITIONCNTR_LOW(adata));
 			break;
 		case I2S_HS_INSTANCE:
 			high = readl(adata->acp_base + ACP_HS_TX_LINEARPOSITIONCNTR_HIGH);
@@ -277,12 +277,12 @@ static inline u64 acp_get_byte_count(struct acp_dev_data *adata, int dai_id, int
 	} else {
 		switch (dai_id) {
 		case I2S_BT_INSTANCE:
-			high = readl(adata->acp_base + ACP_BT_RX_LINEARPOSITIONCNTR_HIGH);
-			low = readl(adata->acp_base + ACP_BT_RX_LINEARPOSITIONCNTR_LOW);
+			high = readl(adata->acp_base + ACP_BT_RX_LINEARPOSITIONCNTR_HIGH(adata));
+			low = readl(adata->acp_base + ACP_BT_RX_LINEARPOSITIONCNTR_LOW(adata));
 			break;
 		case I2S_SP_INSTANCE:
-			high = readl(adata->acp_base + ACP_I2S_RX_LINEARPOSITIONCNTR_HIGH);
-			low = readl(adata->acp_base + ACP_I2S_RX_LINEARPOSITIONCNTR_LOW);
+			high = readl(adata->acp_base + ACP_I2S_RX_LINEARPOSITIONCNTR_HIGH(adata));
+			low = readl(adata->acp_base + ACP_I2S_RX_LINEARPOSITIONCNTR_LOW(adata));
 			break;
 		case I2S_HS_INSTANCE:
 			high = readl(adata->acp_base + ACP_HS_RX_LINEARPOSITIONCNTR_HIGH);
diff --git a/sound/soc/amd/acp/chip_offset_byte.h b/sound/soc/amd/acp/chip_offset_byte.h
index 18da734c0e9e..97b8b49f1e64 100644
--- a/sound/soc/amd/acp/chip_offset_byte.h
+++ b/sound/soc/amd/acp/chip_offset_byte.h
@@ -32,42 +32,47 @@
 
 /* Registers from ACP_AUDIO_BUFFERS block */
 
-#define ACP_I2S_RX_RINGBUFADDR                        0x2000
-#define ACP_I2S_RX_RINGBUFSIZE                        0x2004
-#define ACP_I2S_RX_LINKPOSITIONCNTR                   0x2008
-#define ACP_I2S_RX_FIFOADDR                           0x200C
-#define ACP_I2S_RX_FIFOSIZE                           0x2010
-#define ACP_I2S_RX_DMA_SIZE                           0x2014
-#define ACP_I2S_RX_LINEARPOSITIONCNTR_HIGH            0x2018
-#define ACP_I2S_RX_LINEARPOSITIONCNTR_LOW             0x201C
-#define ACP_I2S_RX_INTR_WATERMARK_SIZE                0x2020
-#define ACP_I2S_TX_RINGBUFADDR                        0x2024
-#define ACP_I2S_TX_RINGBUFSIZE                        0x2028
-#define ACP_I2S_TX_LINKPOSITIONCNTR                   0x202C
-#define ACP_I2S_TX_FIFOADDR                           0x2030
-#define ACP_I2S_TX_FIFOSIZE                           0x2034
-#define ACP_I2S_TX_DMA_SIZE                           0x2038
-#define ACP_I2S_TX_LINEARPOSITIONCNTR_HIGH            0x203C
-#define ACP_I2S_TX_LINEARPOSITIONCNTR_LOW             0x2040
-#define ACP_I2S_TX_INTR_WATERMARK_SIZE                0x2044
-#define ACP_BT_RX_RINGBUFADDR                         0x2048
-#define ACP_BT_RX_RINGBUFSIZE                         0x204C
-#define ACP_BT_RX_LINKPOSITIONCNTR                    0x2050
-#define ACP_BT_RX_FIFOADDR                            0x2054
-#define ACP_BT_RX_FIFOSIZE                            0x2058
-#define ACP_BT_RX_DMA_SIZE                            0x205C
-#define ACP_BT_RX_LINEARPOSITIONCNTR_HIGH             0x2060
-#define ACP_BT_RX_LINEARPOSITIONCNTR_LOW              0x2064
-#define ACP_BT_RX_INTR_WATERMARK_SIZE                 0x2068
-#define ACP_BT_TX_RINGBUFADDR                         0x206C
-#define ACP_BT_TX_RINGBUFSIZE                         0x2070
-#define ACP_BT_TX_LINKPOSITIONCNTR                    0x2074
-#define ACP_BT_TX_FIFOADDR                            0x2078
-#define ACP_BT_TX_FIFOSIZE                            0x207C
-#define ACP_BT_TX_DMA_SIZE                            0x2080
-#define ACP_BT_TX_LINEARPOSITIONCNTR_HIGH             0x2084
-#define ACP_BT_TX_LINEARPOSITIONCNTR_LOW              0x2088
-#define ACP_BT_TX_INTR_WATERMARK_SIZE                 0x208C
+#define ACP_I2S_REG_ADDR(acp_adata, addr) \
+			 ((addr) + (acp_adata->rsrc->irqp_used * \
+			 acp_adata->rsrc->irq_reg_offset))
+
+#define ACP_I2S_RX_RINGBUFADDR(adata)               ACP_I2S_REG_ADDR(adata, 0x2000)
+#define ACP_I2S_RX_RINGBUFSIZE(adata)               ACP_I2S_REG_ADDR(adata, 0x2004)
+#define ACP_I2S_RX_LINKPOSITIONCNTR(adata)          ACP_I2S_REG_ADDR(adata, 0x2008)
+#define ACP_I2S_RX_FIFOADDR(adata)                  ACP_I2S_REG_ADDR(adata, 0x200C)
+#define ACP_I2S_RX_FIFOSIZE(adata)                  ACP_I2S_REG_ADDR(adata, 0x2010)
+#define ACP_I2S_RX_DMA_SIZE(adata)                  ACP_I2S_REG_ADDR(adata, 0x2014)
+#define ACP_I2S_RX_LINEARPOSITIONCNTR_HIGH(adata)   ACP_I2S_REG_ADDR(adata, 0x2018)
+#define ACP_I2S_RX_LINEARPOSITIONCNTR_LOW(adata)    ACP_I2S_REG_ADDR(adata, 0x201C)
+#define ACP_I2S_RX_INTR_WATERMARK_SIZE(adata)       ACP_I2S_REG_ADDR(adata, 0x2020)
+#define ACP_I2S_TX_RINGBUFADDR(adata)               ACP_I2S_REG_ADDR(adata, 0x2024)
+#define ACP_I2S_TX_RINGBUFSIZE(adata)               ACP_I2S_REG_ADDR(adata, 0x2028)
+#define ACP_I2S_TX_LINKPOSITIONCNTR(adata)          ACP_I2S_REG_ADDR(adata, 0x202C)
+#define ACP_I2S_TX_FIFOADDR(adata)                  ACP_I2S_REG_ADDR(adata, 0x2030)
+#define ACP_I2S_TX_FIFOSIZE(adata)                  ACP_I2S_REG_ADDR(adata, 0x2034)
+#define ACP_I2S_TX_DMA_SIZE(adata)                  ACP_I2S_REG_ADDR(adata, 0x2038)
+#define ACP_I2S_TX_LINEARPOSITIONCNTR_HIGH(adata)   ACP_I2S_REG_ADDR(adata, 0x203C)
+#define ACP_I2S_TX_LINEARPOSITIONCNTR_LOW(adata)    ACP_I2S_REG_ADDR(adata, 0x2040)
+#define ACP_I2S_TX_INTR_WATERMARK_SIZE(adata)       ACP_I2S_REG_ADDR(adata, 0x2044)
+#define ACP_BT_RX_RINGBUFADDR(adata)                ACP_I2S_REG_ADDR(adata, 0x2048)
+#define ACP_BT_RX_RINGBUFSIZE(adata)                ACP_I2S_REG_ADDR(adata, 0x204C)
+#define ACP_BT_RX_LINKPOSITIONCNTR(adata)           ACP_I2S_REG_ADDR(adata, 0x2050)
+#define ACP_BT_RX_FIFOADDR(adata)                   ACP_I2S_REG_ADDR(adata, 0x2054)
+#define ACP_BT_RX_FIFOSIZE(adata)                   ACP_I2S_REG_ADDR(adata, 0x2058)
+#define ACP_BT_RX_DMA_SIZE(adata)                   ACP_I2S_REG_ADDR(adata, 0x205C)
+#define ACP_BT_RX_LINEARPOSITIONCNTR_HIGH(adata)    ACP_I2S_REG_ADDR(adata, 0x2060)
+#define ACP_BT_RX_LINEARPOSITIONCNTR_LOW(adata)     ACP_I2S_REG_ADDR(adata, 0x2064)
+#define ACP_BT_RX_INTR_WATERMARK_SIZE(adata)        ACP_I2S_REG_ADDR(adata, 0x2068)
+#define ACP_BT_TX_RINGBUFADDR(adata)                ACP_I2S_REG_ADDR(adata, 0x206C)
+#define ACP_BT_TX_RINGBUFSIZE(adata)                ACP_I2S_REG_ADDR(adata, 0x2070)
+#define ACP_BT_TX_LINKPOSITIONCNTR(adata)           ACP_I2S_REG_ADDR(adata, 0x2074)
+#define ACP_BT_TX_FIFOADDR(adata)                   ACP_I2S_REG_ADDR(adata, 0x2078)
+#define ACP_BT_TX_FIFOSIZE(adata)                   ACP_I2S_REG_ADDR(adata, 0x207C)
+#define ACP_BT_TX_DMA_SIZE(adata)                   ACP_I2S_REG_ADDR(adata, 0x2080)
+#define ACP_BT_TX_LINEARPOSITIONCNTR_HIGH(adata)    ACP_I2S_REG_ADDR(adata, 0x2084)
+#define ACP_BT_TX_LINEARPOSITIONCNTR_LOW(adata)     ACP_I2S_REG_ADDR(adata, 0x2088)
+#define ACP_BT_TX_INTR_WATERMARK_SIZE(adata)        ACP_I2S_REG_ADDR(adata, 0x208C)
+
 #define ACP_HS_RX_RINGBUFADDR			      0x3A90
 #define ACP_HS_RX_RINGBUFSIZE			      0x3A94
 #define ACP_HS_RX_LINKPOSITIONCNTR		      0x3A98
-- 
2.39.2

