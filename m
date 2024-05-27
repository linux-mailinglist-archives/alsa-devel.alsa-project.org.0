Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F6348D00BA
	for <lists+alsa-devel@lfdr.de>; Mon, 27 May 2024 15:00:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 24AB4DF8;
	Mon, 27 May 2024 14:59:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 24AB4DF8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1716814807;
	bh=RAkzFFqQu34Q3YXgcLIlTC9WfEiCFD7e+tKEsOSe6Ao=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=FrFpmDmHKxsMr7mgy1Ecpn8j2DR0FPrIIXACyP/NR04vul9k3pZPEkY1pVxIHhRqd
	 Afo5UeZCQFpzgQ+5TN6VphnpR0lrxle2iBMucpeILYUkK+ijLlbPlY5PTiHEAc1S2E
	 MQ5o76UGDK6Z/A5aquzJw1F9xQhPrHcNBjRvglbM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 795ADF805D9; Mon, 27 May 2024 14:59:14 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4E4D4F805C6;
	Mon, 27 May 2024 14:59:14 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 98184F8047C; Mon, 27 May 2024 14:57:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20625.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e88::625])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 15C22F80149
	for <alsa-devel@alsa-project.org>; Mon, 27 May 2024 14:56:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 15C22F80149
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256
 header.s=selector2 header.b=f6+a9bvx
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gdiAznLc+tXYdXeUaNv+aOFDVuaU+HUxfEoVRDfkrJVOHCFhIvP1+b/0bS31KelfVTU8dlQ8haJNGEV2SU9+SqgNrt5dTm5X4QbFKHPzt+2P5IXNZau24Haf37K+bAPthI5AZBoitF7NFV+fkp4C0xnfotUhMX2N2GYxsyxRu21+N/3h6WhCwOyQdgYLMJzCFaj5fP7Wq4r+yf8UgRY8xLiEAgNAqnJWSJ8KuDWrTLV1TOHDrttjedbA+bnV4d2VnZc+P8sjVEG1SxM9YSkudLy5+aO0AzShEgah29dC5TcwsKJqhsouSJeN104VBEv04+GCh9ARiE9qICEvGPWAxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wnkj4wBXchlVFTLDqqNEicEPhlk1BjsiuyZF+MT6G1M=;
 b=GCrR1nR3uHGO+h4fovFUPsx8Edg7klALNStqKgFFebzsEOCM6cdvnw1tObvrw0JrG8dbK2N0jm+W6d2kQlsXIoz752fz6PkIX4Q3xyLLVlDtY4KRV3mF8AUsan5geJVdYcbVETnBUVThCriqiTRBLuQ8wasS+B8rXZ17zDouDIJ42Tg8XnJiSQngInAP/8Oqw0H/5rJwZq7Nic4b1PgXzsD8vrTWG3gNmOsOEM6+b5oQ8sWDz64giTaTrQXslTAxto+vSU8Qdpf2GAdYU3lUHf+0D6Xe5X8bb8Gifr0OEgY8FRWrhIHQfCVxcY2dMls5EeqUwsEzCyRMmSzNTGEyGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wnkj4wBXchlVFTLDqqNEicEPhlk1BjsiuyZF+MT6G1M=;
 b=f6+a9bvxym/4CFTbQ5LxYo2T/X7X6mjPJ7Swf4t1iZSQbld4KlgRfhq3mHt8xOSOR6lkqt1HXnTBJRMKShFQfMb75taRfN/WeKNLAnCodmfGNN2zJxBrMTdueNP5npN1YRvSZXM9YLjDD1dkddposnA0if0mpQJ/BApw3S0HdEbixTGH7zT1YdF/lDDJdS8AXmJmyVjRVtZQG/xCPuiyNDNpGs5Z+YQh6uxnTRQBUat3h/IqPCsdcDdcRZN2gYqD9qtSrzHpy65ZS/4HN7kGAYOZLjUcx2ZtayvMnR/oNsZFUfpQ2kXVOb1CJ7iBqqHXwAt6FhSl1E5LkhbmVcAtkg==
Received: from BN0PR02CA0014.namprd02.prod.outlook.com (2603:10b6:408:e4::19)
 by DM6PR12MB4434.namprd12.prod.outlook.com (2603:10b6:5:2ad::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.29; Mon, 27 May
 2024 12:56:37 +0000
Received: from BL6PEPF0002256E.namprd02.prod.outlook.com
 (2603:10b6:408:e4:cafe::7e) by BN0PR02CA0014.outlook.office365.com
 (2603:10b6:408:e4::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.30 via Frontend
 Transport; Mon, 27 May 2024 12:56:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BL6PEPF0002256E.mail.protection.outlook.com (10.167.249.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7633.15 via Frontend Transport; Mon, 27 May 2024 12:56:37 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 27 May
 2024 05:56:20 -0700
Received: from rnnvmail205.nvidia.com (10.129.68.10) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 27 May
 2024 05:56:20 -0700
Received: from build-spujar-20240506T080629452.internal (10.127.8.9) by
 mail.nvidia.com (10.129.68.10) with Microsoft SMTP Server id 15.2.1544.4 via
 Frontend Transport; Mon, 27 May 2024 05:56:20 -0700
From: Sameer Pujar <spujar@nvidia.com>
To: <broonie@kernel.org>, <linux-sound@vger.kernel.org>,
	<alsa-devel@alsa-project.org>
CC: <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<lgirdwood@gmail.com>, <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
	<mkumard@nvidia.com>, <spujar@nvidia.com>
Subject: [PATCH v2 2/2] ASoC: tegra: I2S client convert formats handling
Date: Mon, 27 May 2024 12:56:07 +0000
Message-ID: <20240527125608.2461300-3-spujar@nvidia.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240527125608.2461300-1-spujar@nvidia.com>
References: <20240527125608.2461300-1-spujar@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0002256E:EE_|DM6PR12MB4434:EE_
X-MS-Office365-Filtering-Correlation-Id: 62a4e48c-34ad-44e0-9dfc-08dc7e4c71e4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230031|36860700004|82310400017|1800799015|376005;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?myW5sSYvg1PfbI3ZUSWI8TkZs25ApcXgZxwypHeMa3qxuXPm1Pwh5oIC6fzY?=
 =?us-ascii?Q?z47p/CWg+iSYMqp9V5v3U4JBY03vc7YzakgLpSIUKAHF+6u8CkLwcr8ONK5L?=
 =?us-ascii?Q?W4OPdEMd+l1jDdJBRfssJ/5DEOuZuHoDqVaFko0Yo94rRM+Z6Az38HMyJHbh?=
 =?us-ascii?Q?Z0MP4bbADbZ/WpAEkuMsWw/kyEHqLdebQlYnlYn3VD2oYMTmva1Db8oA+NTL?=
 =?us-ascii?Q?aNvwv4pndtBGBleTpqReMEaBx6c/jcqyPzWwtK4ir8izLnVwKhfsGjYdfTFY?=
 =?us-ascii?Q?uSLPP+cPdRlOtM5srqh236w28lrX72RyJNMYNtHh3b5PFyChxjfq87/l4GAd?=
 =?us-ascii?Q?MrG5Cv7bczGH/U+//lqCBdpZqLoJrS+DCAMCmpqANqVwmXWiRpe1lsaB6yac?=
 =?us-ascii?Q?dOx7tWqvyF9g7qhZRgRo+QFkTbr4b1+Ubqvs9EG4ODR6s22RGcZ9illq1iMi?=
 =?us-ascii?Q?zoY/gMxNcEMWOmbQ3vv8OqoMkOcQNQjmlD1F38f0AGlxAPIhUs0mQ/7vZn+y?=
 =?us-ascii?Q?Wq598nyG4Cl5CWjD+TMlua2IRjNUVZ2KWmBGf+IN2lHeM1uy5mahMNQ/le9S?=
 =?us-ascii?Q?msZDzNEnQ8hc1Exuo773DL6p+JuyfWLOq8/JIwGcNEr85CSts9+gwNqoQlJr?=
 =?us-ascii?Q?JP9hEX5QXlrXbPgFdQhaOy/lWKO+lFmtQf3w8r7qGso4BBis9qQJeDtTRYOs?=
 =?us-ascii?Q?cmUY+mTQhzbGbcdstKdLLxsFmU/0WstRDTWlT8QqCIP6fdwPfDOvoGoiOBv7?=
 =?us-ascii?Q?C395ehb076VVY0juoYqYEtF9hcVND5ACmoagQowRFnCuqtKuNBsf5c9eRn3B?=
 =?us-ascii?Q?t9VqGZAkmwBkhOgOp4CjKbjNSiWOLouT78Aro5LZfEtheKrTTSuc+IDZNtJW?=
 =?us-ascii?Q?G4vetUViYni/xQZLQ3XxbzXq25qkkBwoEmo3StoIB/Lq/rGIdkDB9Lau2MxX?=
 =?us-ascii?Q?m4lKKVpWPkbHi+b9QQ/p0Dgkaft+2gnBtCdzRf9pRuW/7FbYtCmZ1mwE13cc?=
 =?us-ascii?Q?I9fyv/l0y/8qUxCjlFqsCrGHwbbPCzn9EqzamKnOPuo8p9vWZjqaWHqtnE4M?=
 =?us-ascii?Q?2LxPjfZ4e+PwzQMXHYtoO3osBxj2Yr73wHm03nFk6gk59Bmn3LNRipdpx1zM?=
 =?us-ascii?Q?hpiyRBipEleOPUL7661MdYqt8w5L5mg+8Pkw0l6Y2Vc3QAKtNsBPochlldH/?=
 =?us-ascii?Q?gnOrQsv3PbcHTiW7AjXUzHt0w/ZlXOsAjZpeNbVm5I4KTZpXtx/nGmENYve1?=
 =?us-ascii?Q?bdXsLWe272FgmgsV1kRVliJ5q+eUarFy0yojwwMtD5re85nszO8adm6LlPak?=
 =?us-ascii?Q?+G+22Tg+mrJN438blxVABPOKWngAtgPFFCijO+WyqBnPxotjSgZ+w/EQG5Vp?=
 =?us-ascii?Q?KqzJLXQKBGBXvr5BTGko0d6qq1FK?=
X-Forefront-Antispam-Report: 
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230031)(36860700004)(82310400017)(1800799015)(376005);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2024 12:56:37.1002
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 62a4e48c-34ad-44e0-9dfc-08dc7e4c71e4
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL6PEPF0002256E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4434
Message-ID-Hash: 67IYE3MDF6UUVXF47A2PWDDWNLBZ5QHI
X-Message-ID-Hash: 67IYE3MDF6UUVXF47A2PWDDWNLBZ5QHI
X-MailFrom: spujar@nvidia.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/67IYE3MDF6UUVXF47A2PWDDWNLBZ5QHI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Mohan Kumar <mkumard@nvidia.com>

The AHUB HW modules are interconnected with CIF which are capable of
supporting Channel and Sample bit format conversion. Due to this, the
I2S Client can have different Channel and Sample bit from the hw_params()
and this config is passed from CIF port of I2S DT node which can help to
perform this conversion.

For e.g. HFP usecase consists of BT SCO with 1ch and 8k audio data
which needs to be converted and mixed with external codec playback and
capture path which is of 2ch and 48k format.

For HFP Playback:
  The path includes mono to stereo and 8k to 48k conversion
    _ _ _ _       _ _ _          _ _ _        _ _ _ _ _       _ _ _ _ _ _
   |       |1ch  |      | 1ch   |     |2ch   | SFC     | 2ch |           |
   |BT SCO |---->| I2Sx |------>| CIF |----->| 8k->48k |---->| Codec I2Sy|
   |_ _ _ _|     |_ _ __|client |_ _ _|audio |_ _ _ _ _|     |_ _ _ _ _ _|

For HFP Capture:
  The path includes stereo to mono and 48k to 8k conversion
    _ _ _ _ _ _       _ _ _ _ _        _ _ _         _ _ _ _       _ _ _ _
   |           | 2ch | SFC     | 2ch  |     | 1ch   |       | 1ch |       |
   | codec I2Sy|---->| 48k->8k |----->| CIF |------>| I2Sx  |---->| BT SCO|
   |_ _ _ _ _ _|     |_ _ _ _ _| audio|_ _ _|client |_ _ _ _|     |_ _ _ _|

For above two path, I2S client channel uses existing DT binding to pass
channels and format conversion in I2Sx CIF Port.

Signed-off-by: Mohan Kumar <mkumard@nvidia.com>
Signed-off-by: Sameer Pujar <spujar@nvidia.com>
---
 sound/soc/tegra/tegra210_i2s.c | 71 ++++++++++++++++++++++++++++++++--
 sound/soc/tegra/tegra210_i2s.h |  2 +
 2 files changed, 69 insertions(+), 4 deletions(-)

diff --git a/sound/soc/tegra/tegra210_i2s.c b/sound/soc/tegra/tegra210_i2s.c
index ba7fdd7405ac..fe4fde844d86 100644
--- a/sound/soc/tegra/tegra210_i2s.c
+++ b/sound/soc/tegra/tegra210_i2s.c
@@ -8,11 +8,13 @@
 #include <linux/device.h>
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
+#include <linux/of_graph.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/regmap.h>
 #include <sound/core.h>
 #include <sound/pcm_params.h>
+#include <sound/simple_card_utils.h>
 #include <sound/soc.h>
 #include "tegra210_i2s.h"
 #include "tegra_cif.h"
@@ -603,6 +605,7 @@ static int tegra210_i2s_hw_params(struct snd_pcm_substream *substream,
 	struct tegra210_i2s *i2s = snd_soc_dai_get_drvdata(dai);
 	unsigned int sample_size, channels, srate, val, reg, path;
 	struct tegra_cif_conf cif_conf;
+	snd_pcm_format_t sample_format;
 
 	memset(&cif_conf, 0, sizeof(struct tegra_cif_conf));
 
@@ -615,28 +618,51 @@ static int tegra210_i2s_hw_params(struct snd_pcm_substream *substream,
 
 	cif_conf.audio_ch = channels;
 	cif_conf.client_ch = channels;
+	if (i2s->client_channels)
+		cif_conf.client_ch = i2s->client_channels;
 
+	/* AHUB CIF Audio bits configs */
 	switch (params_format(params)) {
+	case SNDRV_PCM_FORMAT_S8:
+		cif_conf.audio_bits = TEGRA_ACIF_BITS_8;
+		break;
+	case SNDRV_PCM_FORMAT_S16_LE:
+		cif_conf.audio_bits = TEGRA_ACIF_BITS_16;
+		break;
+	case SNDRV_PCM_FORMAT_S32_LE:
+		cif_conf.audio_bits = TEGRA_ACIF_BITS_32;
+		break;
+	default:
+		dev_err(dev, "unsupported params audio bit format!\n");
+		return -EOPNOTSUPP;
+	}
+
+	sample_format = params_format(params);
+	if (i2s->client_sample_format >= 0)
+		sample_format = (snd_pcm_format_t)i2s->client_sample_format;
+
+	/*
+	 * Format of the I2S for sending/receiving the audio
+	 * to/from external device.
+	 */
+	switch (sample_format) {
 	case SNDRV_PCM_FORMAT_S8:
 		val = I2S_BITS_8;
 		sample_size = 8;
-		cif_conf.audio_bits = TEGRA_ACIF_BITS_8;
 		cif_conf.client_bits = TEGRA_ACIF_BITS_8;
 		break;
 	case SNDRV_PCM_FORMAT_S16_LE:
 		val = I2S_BITS_16;
 		sample_size = 16;
-		cif_conf.audio_bits = TEGRA_ACIF_BITS_16;
 		cif_conf.client_bits = TEGRA_ACIF_BITS_16;
 		break;
 	case SNDRV_PCM_FORMAT_S32_LE:
 		val = I2S_BITS_32;
 		sample_size = 32;
-		cif_conf.audio_bits = TEGRA_ACIF_BITS_32;
 		cif_conf.client_bits = TEGRA_ACIF_BITS_32;
 		break;
 	default:
-		dev_err(dev, "unsupported format!\n");
+		dev_err(dev, "unsupported client bit format!\n");
 		return -EOPNOTSUPP;
 	}
 
@@ -872,6 +898,40 @@ static const struct regmap_config tegra210_i2s_regmap_config = {
 	.cache_type		= REGCACHE_FLAT,
 };
 
+/*
+ * The AHUB HW modules are interconnected with CIF which are capable of
+ * supporting Channel and Sample bit format conversion. This needs different
+ * CIF Audio and client configuration. As one of the config comes from
+ * params_channels() or params_format(), the extra configuration is passed from
+ * CIF Port of DT I2S node which can help to perform this conversion.
+ *
+ *    4ch          audio = 4ch      client = 2ch       2ch
+ *   -----> ADMAIF -----------> CIF -------------> I2S ---->
+ */
+static void tegra210_parse_client_convert(struct device *dev)
+{
+	struct tegra210_i2s *i2s = dev_get_drvdata(dev);
+	struct device_node *ports, *ep;
+	struct simple_util_data data = {};
+	int cif_port = 0;
+
+	ports = of_get_child_by_name(dev->of_node, "ports");
+	if (ports) {
+		ep = of_graph_get_endpoint_by_regs(ports, cif_port, -1);
+		if (ep) {
+			simple_util_parse_convert(ep, NULL, &data);
+			of_node_put(ep);
+		}
+		of_node_put(ports);
+	}
+
+	if (data.convert_channels)
+		i2s->client_channels = data.convert_channels;
+
+	if (data.convert_sample_format)
+		i2s->client_sample_format = simple_util_get_sample_fmt(&data);
+}
+
 static int tegra210_i2s_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -887,6 +947,7 @@ static int tegra210_i2s_probe(struct platform_device *pdev)
 	i2s->tx_mask = DEFAULT_I2S_SLOT_MASK;
 	i2s->rx_mask = DEFAULT_I2S_SLOT_MASK;
 	i2s->loopback = false;
+	i2s->client_sample_format = -EINVAL;
 
 	dev_set_drvdata(dev, i2s);
 
@@ -916,6 +977,8 @@ static int tegra210_i2s_probe(struct platform_device *pdev)
 		return PTR_ERR(i2s->regmap);
 	}
 
+	tegra210_parse_client_convert(dev);
+
 	regcache_cache_only(i2s->regmap, true);
 
 	err = devm_snd_soc_register_component(dev, &tegra210_i2s_cmpnt,
diff --git a/sound/soc/tegra/tegra210_i2s.h b/sound/soc/tegra/tegra210_i2s.h
index 030d70c45e18..fe478f3d8435 100644
--- a/sound/soc/tegra/tegra210_i2s.h
+++ b/sound/soc/tegra/tegra210_i2s.h
@@ -112,6 +112,8 @@ struct tegra210_i2s {
 	struct clk *clk_i2s;
 	struct clk *clk_sync_input;
 	struct regmap *regmap;
+	int client_sample_format;
+	unsigned int client_channels;
 	unsigned int stereo_to_mono[I2S_PATHS];
 	unsigned int mono_to_stereo[I2S_PATHS];
 	unsigned int dai_fmt;
-- 
2.45.1

