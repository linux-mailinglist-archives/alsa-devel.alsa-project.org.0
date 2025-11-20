Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FA60C7579F
	for <lists+alsa-devel@lfdr.de>; Thu, 20 Nov 2025 17:53:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A4AC860285;
	Thu, 20 Nov 2025 17:53:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A4AC860285
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1763657619;
	bh=99uCtvgEOVjeP0F2ThNgV6ZyT6N8o+/8BSswJQdhhec=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=UTCAizIHM+3rRjgOcBQ5Eb/TREHqgrfnW7MtrH31esWlRXmy9kb1+5crrptJx31pn
	 FX7JRVSvfRJ5UKOV1bMYXIzikI4Bspue0mQtcVvViQ3SQ1+SnXfmlHr/GtrIKHGuzq
	 4eDoIx2Dzzpy1brzIAtB/jKkgF9o0uhz1gDINxZQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5937AF806C4; Thu, 20 Nov 2025 17:51:32 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C97D9F806C1;
	Thu, 20 Nov 2025 17:51:32 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CDF74F80301; Thu, 20 Nov 2025 10:22:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.3 required=5.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,KHOP_HELO_FCRDNS,T_SPF_HELO_TEMPERROR,T_SPF_TEMPERROR
	shortcircuit=no autolearn=no autolearn_force=no version=3.4.6
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazon11013071.outbound.protection.outlook.com
 [40.107.201.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B445DF80072
	for <alsa-devel@alsa-project.org>; Thu, 20 Nov 2025 10:22:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B445DF80072
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=selector1 header.b=FRzuQqWa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B2oVeHZmCLHuxhvEc5l7oVHBnAbc24Gp/xQ432ZarNiZgMu2reo27WCSqyQWjKk6W10YWDf3QH4dOs2izOe2LL5BdFUw/qgWfzXMJQ6TY/3g+rGY7kXpINRnBlVwvBC/DrRho6nifuX5YZIstyjamqvpd9UI/l77hrLSMFcCBU5O3qVIfaAOCnoeMvgPECsIeIgjtIzhLMkxK9IRs3ni9txJi8VCL7DdCMC7F4wtN/sICeeMgSNrpkQzhyjDLccpCOtj1d4ic8El21Z5SrScoSmeuQYTLog0ODWi3JbsseaFK92MjSDh4x1VqIRJAWTkEqC2mEWpQcg1nXJlwBV9lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PjRoxYtr+HwTX/62uVJXlN0rY04P0tBxVtRmL8VDcuA=;
 b=WY6uKTUHHxzAgT8gS/tTPYon883qLonUOoOV2g0xWXYx5DZM6t1CAV1RYbXVR/R0io2NNL8egiUwi5sR1BvCuYWfmG2q/lO4MYYcnBhRkQCK18ARm8c66fuemM5PsPqdAwplfe4JkZRjs0E1ftZbfIgPvBNEcOTJQaJRsWFfyLZMJA6jawLnqWZbYT4b8w7pNILaijW+Zm1i9bN2ZHuNACEUoWRUP0+esy261wEibnHPuLcQMJZv5m3v0Lp8sMPq52KxsV7LC3bctkkiux5qJMkcOjrvn3AqdG456/4mDk1DSKgj7e+Ah9HXdjqB5X/aicTXP6PgfSQObaUIhWXe+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=linaro.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PjRoxYtr+HwTX/62uVJXlN0rY04P0tBxVtRmL8VDcuA=;
 b=FRzuQqWaBAZCvcOuJIFirioCu28z7PPMTl204paV0p+1PcaxSixBdrEsmuTLoVHlyUev3waI5SAr/W8Q1GPvBNA5sxNnIZLi7hzzEJ3IKIdfYUObf/Stx7TD3ujyMbI9EyqoOj0Bmkyg4E6RmQZLpqIF/c9I07X0fdfElWhhRz0=
Received: from BN9PR03CA0897.namprd03.prod.outlook.com (2603:10b6:408:13c::32)
 by SJ0PR10MB4800.namprd10.prod.outlook.com (2603:10b6:a03:2da::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Thu, 20 Nov
 2025 09:22:29 +0000
Received: from BN2PEPF000044AA.namprd04.prod.outlook.com
 (2603:10b6:408:13c:cafe::22) by BN9PR03CA0897.outlook.office365.com
 (2603:10b6:408:13c::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.10 via Frontend Transport; Thu,
 20 Nov 2025 09:22:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BN2PEPF000044AA.mail.protection.outlook.com (10.167.243.105) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.9 via Frontend Transport; Thu, 20 Nov 2025 09:22:27 +0000
Received: from DFLE200.ent.ti.com (10.64.6.58) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 20 Nov
 2025 03:22:16 -0600
Received: from DFLE206.ent.ti.com (10.64.6.64) by DFLE200.ent.ti.com
 (10.64.6.58) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 20 Nov
 2025 03:22:16 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE206.ent.ti.com
 (10.64.6.64) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 20 Nov 2025 03:22:16 -0600
Received: from LTPW0EX92E.dhcp.ti.com ([10.249.133.122])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5AK9L1c73383883;
	Thu, 20 Nov 2025 03:22:10 -0600
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
Subject: [PATCH v1 7/8] ASoC: tas2783A: use acpi initialisation table
Date: Thu, 20 Nov 2025 14:50:49 +0530
Message-ID: <20251120092050.1218-7-niranjan.hy@ti.com>
X-Mailer: git-send-email 2.33.0.windows.2
In-Reply-To: <20251120092050.1218-1-niranjan.hy@ti.com>
References: <20251120092050.1218-1-niranjan.hy@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044AA:EE_|SJ0PR10MB4800:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ecb8533-f7c5-43d3-9376-08de2816528a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|7416014|376014|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?1muGoourC9ZY9TCEL8K3VtUzp2aOZVQk35YMHQQyH4KZ3mBhigZqgUz7QbTR?=
 =?us-ascii?Q?6OjotWZ65VxTqrkR0D2ajBzIuf+SpW5Qtb5Ux2kdGnFni0UuQ8Fm5EQvW2Pi?=
 =?us-ascii?Q?LrTbJ4S0BTy+FNUpYGxOAmy1tSt2q5Z8GS6VI/jpeTnf+sXWw8PY0ozbB/Js?=
 =?us-ascii?Q?vOoFt/yZum05d8agwqE8ai1hJXxLOo2nmKPhEZ8QIJdw25wIX1VdzIEr1s79?=
 =?us-ascii?Q?9t7kYGqA2/i3iVTqatJ74awRTmv++Cor/98kIU612NVRcjBzaNdY6m8+wHlF?=
 =?us-ascii?Q?agAXlKiXc6z3vgGOFWlMvKWgMZAgEHxheS4ObuQyBuq5VlO6GczHjJP1lKW/?=
 =?us-ascii?Q?oMRmHQ4QflagcKk1HbAyuEs2JP8qO8/op9IZg3s6PeoMP9aJQdzGe6loVTYs?=
 =?us-ascii?Q?Kv8X3RNeT+BH8F80gw0tH8W9+aJbz6NH8WUX9jBO/36FZ9wF+ki7VkihmUi3?=
 =?us-ascii?Q?R2RbLZDY6OCOWQqAVqaPIyxr/M7Qe+e9Zm9tYqQPIM7nNYp6npU/JHfvzDTk?=
 =?us-ascii?Q?Gs7LUR4YCDmk/n2sfwqLARq6fNX4KcWYqpBx//BEW9Mqb1cgfYIJpXsM8HzG?=
 =?us-ascii?Q?TK0qzWrvOhTdb+0tT1JXdwd7U3JJTobQ5pFE9VgLRK44ugNyH4NAJYkDuzwA?=
 =?us-ascii?Q?r3V9xjq45Ub4EWRcov7KIDh39nfvebSUgnpwuLg1wuMlOagPdGFg/l1ucujQ?=
 =?us-ascii?Q?W1GY7HEuH+cDV8TWSzeAKNyaSzzJwRTzHLizrcM5826IZXKpsui5iDqaoDP8?=
 =?us-ascii?Q?PklzEUHAJMBf/nAkPUd4Yq3pHku9yDeQelrwrqzMVyyrzMP4emwVDhx/fpb9?=
 =?us-ascii?Q?ZScRUkNqtbsukFHwDznmw16RbfCIdhxt47xW6TXW2sRLeAUx8ABdjrgoh/ZZ?=
 =?us-ascii?Q?yfMnZ5m9l7W19Vp2P72WDSfXcjwhFymbqzXGFp1LIyewEnutZIEED6fFKOBF?=
 =?us-ascii?Q?8QLh+mt+2hhPWDTKhNX2OUO5MKRGO+Xo6xs+eObZOCqCW6dnYzTWkRhXU5KE?=
 =?us-ascii?Q?sMeXkBWff8/s0m4UtfMK5ivtJ0Brk1D0iE8+vUvjcCCcRm0xY7Bkf7mT//R9?=
 =?us-ascii?Q?Dz2i4IrCqjtrhNsGtcb0VAdBurOjlL6ZsxjIpQbE6yeIASYvoR9PMs6PvXai?=
 =?us-ascii?Q?HE5tprIUZKML3gqHIAZMvR+KjVEaBHZQskg8FfNkJE7bcByKLywGB30tORQ2?=
 =?us-ascii?Q?nMj3G+Dx5qgr+iEhOFVTJ5OKrjm72GNAd/Jh7pP8ZWQ32ZZAF1qADb8ZRw9g?=
 =?us-ascii?Q?dJexH4stwd9dQqsJ20aGWt1hJBTqIkM2TQ6TNYhW2IH9x4b/rPfavkhGPVMJ?=
 =?us-ascii?Q?VO5DjEnxYkmYuKyNOzuNK03td2uwZY/R1e9NU4mm/Dy9Lt65kIIvn7iw3W1L?=
 =?us-ascii?Q?B3I6LmzBx3H2TkUHduGwvIwQTxDNwBs8U81jPTm8UEWNAJ7/UTwJHWRWKND4?=
 =?us-ascii?Q?qgeeWWB9iAXH+uKU1Q6Fagk3bPbaGqVLeakLI9BqHOEeak5rM2hhg+xRWEUy?=
 =?us-ascii?Q?pJaK1N8HhKVD/5Q6zuafUIkj3osas16NHKY5k6gnnzKopQCmGk2Ef6OpDsIT?=
 =?us-ascii?Q?jHz3oxbUUOOaPIPZGyM=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700013)(7416014)(376014)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2025 09:22:27.1179
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 3ecb8533-f7c5-43d3-9376-08de2816528a
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN2PEPF000044AA.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4800
X-MailFrom: niranjan.hy@ti.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: IKAEPU56NIAIDW2XEZZQAEYHZO7W2GJR
X-Message-ID-Hash: IKAEPU56NIAIDW2XEZZQAEYHZO7W2GJR
X-Mailman-Approved-At: Thu, 20 Nov 2025 16:51:13 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IKAEPU56NIAIDW2XEZZQAEYHZO7W2GJR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This patch adds support for parsing the initilisation
data from ACPI table. This table is required to configure
each device correctly so that correct channel's data is
selected during playback.

Signed-off-by: Niranjan H Y <niranjan.hy@ti.com>
---
 sound/soc/codecs/Kconfig       |  1 +
 sound/soc/codecs/tas2783-sdw.c | 61 +++++++++++++++++++++++++++++++---
 2 files changed, 58 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
index 433af9bc7..94d66e4d5 100644
--- a/sound/soc/codecs/Kconfig
+++ b/sound/soc/codecs/Kconfig
@@ -2146,6 +2146,7 @@ config SND_SOC_TAS2781_I2C
 config SND_SOC_TAS2783_SDW
 	tristate "Texas Instruments TAS2783 speaker amplifier (sdw)"
 	depends on SOUNDWIRE
+	depends on SND_SOC_SDCA
 	depends on EFI
 	select REGMAP_SOUNDWIRE
 	select REGMAP_SOUNDWIRE_MBQ
diff --git a/sound/soc/codecs/tas2783-sdw.c b/sound/soc/codecs/tas2783-sdw.c
index adfbccedb..5be163664 100644
--- a/sound/soc/codecs/tas2783-sdw.c
+++ b/sound/soc/codecs/tas2783-sdw.c
@@ -32,6 +32,7 @@
 #include <sound/soc.h>
 #include <sound/tlv.h>
 #include <sound/tas2781-tlv.h>
+#include <sound/sdca_function.h>
 
 #include "tas2783.h"
 
@@ -78,6 +79,7 @@ struct tas2783_prv {
 	struct snd_soc_component *component;
 	struct calibration_data cali_data;
 	struct sdw_slave *sdw_peripheral;
+	struct sdca_function_data *sa_func_data;
 	enum sdw_slave_status status;
 	/* calibration */
 	struct mutex calib_lock;
@@ -1179,7 +1181,7 @@ static s32 tas_io_init(struct device *dev, struct sdw_slave *slave)
 	struct pci_dev *pci;
 	struct sdw_bus *bus;
 	struct tas2783_prv *tas_dev = dev_get_drvdata(dev);
-	s32 ret;
+	s32 ret, i;
 	u8 unique_id = tas_dev->sdw_peripheral->id.unique_id;
 
 	if (tas_dev->hw_init)
@@ -1223,9 +1225,24 @@ static s32 tas_io_init(struct device *dev, struct sdw_slave *slave)
 		dev_err(tas_dev->dev, "fw request, wait_event timeout\n");
 		ret = -EAGAIN;
 	} else {
-		ret = regmap_multi_reg_write(tas_dev->regmap, tas2783_init_seq,
-					     ARRAY_SIZE(tas2783_init_seq));
-		tas_dev->hw_init = true;
+		if (tas_dev->sa_func_data) {
+			for (i = 0; i < tas_dev->sa_func_data->num_init_table; i++) {
+				ret = regmap_write(tas_dev->regmap,
+						   tas_dev->sa_func_data->init_table[i].addr,
+						   tas_dev->sa_func_data->init_table[i].val);
+				if (ret)
+					break;
+			}
+		} else {
+			ret = regmap_multi_reg_write(tas_dev->regmap, tas2783_init_seq,
+						     ARRAY_SIZE(tas2783_init_seq));
+		}
+
+		if (ret)
+			dev_err(tas_dev->dev,
+				"init writes failed, err=%d", ret);
+		else
+			tas_dev->hw_init = true;
 	}
 
 	return ret;
@@ -1275,12 +1292,47 @@ static s32 tas_sdw_probe(struct sdw_slave *peripheral,
 	struct regmap *regmap;
 	struct device *dev = &peripheral->dev;
 	struct tas2783_prv *tas_dev;
+	struct sdca_function_data *function_data = NULL;
+	int ret, i;
 
 	tas_dev = devm_kzalloc(dev, sizeof(*tas_dev), GFP_KERNEL);
 	if (!tas_dev)
 		return dev_err_probe(dev, -ENOMEM,
 				     "Failed devm_kzalloc");
 
+	i = -1;
+	/* check if we have any SDCA function data available */
+	if (peripheral->sdca_data.num_functions > 0) {
+		dev_dbg(dev, "SDCA functions found: %d", peripheral->sdca_data.num_functions);
+
+		/* Look for Smart Amp function type */
+		for (i = 0; i < peripheral->sdca_data.num_functions; i++) {
+			if (peripheral->sdca_data.function[i].type ==
+			    SDCA_FUNCTION_TYPE_SMART_AMP) {
+				dev_info(dev, "Found Smart Amp function at index %d", i);
+				break;
+			}
+		}
+	}
+
+	if (i >= 0 && i < peripheral->sdca_data.num_functions) {
+		/* Allocate memory for function data */
+		function_data = devm_kzalloc(dev, sizeof(*function_data),
+					     GFP_KERNEL);
+		if (!function_data)
+			return dev_err_probe(dev, -ENOMEM,
+					     "failed to parse sdca functions");
+
+		/* Parse the function */
+		ret = sdca_parse_function(dev, peripheral,
+					  &peripheral->sdca_data.function[i],
+					  function_data);
+		if (!ret)
+			tas_dev->sa_func_data = function_data;
+		else
+			dev_warn(dev, "smartamp function parse failed:err%d, using defaults", ret);
+	}
+
 	tas_dev->dev = dev;
 	tas_dev->sdw_peripheral = peripheral;
 	tas_dev->hw_init = false;
@@ -1335,6 +1387,7 @@ static struct sdw_driver tas_sdw_driver = {
 };
 module_sdw_driver(tas_sdw_driver);
 
+MODULE_IMPORT_NS("SND_SOC_SDCA");
 MODULE_AUTHOR("Texas Instruments Inc.");
 MODULE_DESCRIPTION("ASoC TAS2783 SoundWire Driver");
 MODULE_LICENSE("GPL");
-- 
2.25.1

