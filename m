Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 26A40CC6BC3
	for <lists+alsa-devel@lfdr.de>; Wed, 17 Dec 2025 10:12:53 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A04776023F;
	Wed, 17 Dec 2025 10:12:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A04776023F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1765962772;
	bh=cnwU0gfcml10bV+9CSjtZw5bkJwRKLACP7inVfjW2D8=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=A9/4zwDuRU6DDYVYGZYq5MpZlfJc4ThTYoIUPa2Y2crfDE0nJYZnBpH2DGr4EBcaz
	 h1KrUUeaH3mJ9r4tmUA9AEtQlcq1ohFCPoixBI8XnEpDyEcaMUW6wFEF4R5huHEF3w
	 EUurwN7CgsUVSx9UWRD4YYbS5X7k4sfddKjngV2E=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 23832F80717; Wed, 17 Dec 2025 10:10:33 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E1117F80717;
	Wed, 17 Dec 2025 10:10:32 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9D7F7F80169; Mon, 15 Dec 2025 16:33:34 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.3 required=5.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,KHOP_HELO_FCRDNS,T_SPF_HELO_TEMPERROR,T_SPF_TEMPERROR
	shortcircuit=no autolearn=no autolearn_force=no version=3.4.6
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazon11011065.outbound.protection.outlook.com [52.101.62.65])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C13A5F800BA
	for <alsa-devel@alsa-project.org>; Mon, 15 Dec 2025 16:33:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C13A5F800BA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=selector1 header.b=wXi9DeaV
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HxiVzxVDDK6I8LpCpdTVVHhj1D6GJgifO1mBpynB/5MkfEo8p+wpxnbK2C+iUqVlmwOMev7x0LEyUgu9xbuLAxxJtYy0BN4EbWUaTLCcETEmkWPdHBe7y3dhKLugcjw1pASAtDiOce7/gv/FNQi7SVcUnY0pbhhJbn9vErHteEfqs7qKcGX1XtKdQzTMRWx6XK9VhN5S7QbYuP0ltN0Ywb/lOcBkiGOhwc6P7pHjt/r5mV0nLqrYzoUF9IcvqWmqJNqDl+UTB3MX6qwD8NVGlSVIkBtzuyVZY2j/QzXf4RMA8HQ1wpShYfs86XMYEpkOp2O2S+mHAx+t98O57/BAAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oabcEDZOBhQuZvFe9DvJS0rIH4f47sU04/zsRB1ghh8=;
 b=HTpnuJbmwKZ+yNv9W0ynjXZacqD4NnEQkp2UP9iCnPaoG600hcGpj/C0Z2ogm7sYQzjIqjc+xlTNGxwl2nmIgbiVTlLHdiPcflKF3jbe26H4N4heF+fgSmEhXTfFaSYHN7tbDEp+w1vHj/YWAB+WnqccrfIGCnOCIQREYOlBAHODPYcMl0cYWu1ptgR+pqBVSVtB1ny8cicM0sPsCqkF5OA4xplssz2BKELMAdTE3RVi8BR2ZuFzfom/YiumYbzAa+aijxAK+1+HFUmEmR74DN7ubR2jxLGjJyidN7Vn7wJsPDFxltj7g39/YSzfYaV/6X40T0M3AXexWnLh9X7o8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=linaro.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oabcEDZOBhQuZvFe9DvJS0rIH4f47sU04/zsRB1ghh8=;
 b=wXi9DeaViFtr9NLrSsDAQsFG9Gm1nA809UH6v8zyttLWbhe4CWLJrTqXG4DQoZYhMSknBOyuaO695Cj/BV2RbdpSt9TSaEzdHcJagONvrjUu8obc0lQmWq7lF1oaJbwAnBr9ZSyr5sZHnWJAgeqbh5uAO4nXJAJqXV3YKZqZP3A=
Received: from BL1PR13CA0086.namprd13.prod.outlook.com (2603:10b6:208:2b8::31)
 by CO1PR10MB4740.namprd10.prod.outlook.com (2603:10b6:303:9d::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Mon, 15 Dec
 2025 15:33:27 +0000
Received: from MN1PEPF0000F0DF.namprd04.prod.outlook.com
 (2603:10b6:208:2b8:cafe::96) by BL1PR13CA0086.outlook.office365.com
 (2603:10b6:208:2b8::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.6 via Frontend Transport; Mon,
 15 Dec 2025 15:33:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 MN1PEPF0000F0DF.mail.protection.outlook.com (10.167.242.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9434.6 via Frontend Transport; Mon, 15 Dec 2025 15:33:26 +0000
Received: from DLEE208.ent.ti.com (157.170.170.97) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 15 Dec
 2025 09:33:20 -0600
Received: from DLEE214.ent.ti.com (157.170.170.117) by DLEE208.ent.ti.com
 (157.170.170.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 15 Dec
 2025 09:33:20 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 15 Dec 2025 09:33:20 -0600
Received: from LTPW0EX92E.dhcp.ti.com (ltpw0ex92e.dhcp.ti.com [10.82.30.14])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5BFFWTtb2639809;
	Mon, 15 Dec 2025 09:33:15 -0600
From: Niranjan H Y <niranjan.hy@ti.com>
To: <alsa-devel@alsa-project.org>
CC: <linux-sound@vger.kernel.org>, <broonie@kernel.org>,
	<ckeepax@opensource.cirrus.com>, <lgirdwood@gmail.com>,
	<yung-chuan.liao@linux.intel.com>, <ranjani.sridharan@linux.intel.com>,
	<perex@perex.cz>, <tiwai@suse.com>, <cezary.rojewski@intel.com>,
	<peter.ujfalusi@linux.intel.com>, <kai.vehmanen@linux.intel.com>,
	<pierre-louis.bossart@linux.dev>, <shenghao-ding@ti.com>,
	<v-hampiholi@ti.com>, <baojun.xu@ti.com>, <dan.carpenter@linaro.org>,
	<sandeepk@ti.com>, Niranjan H Y <niranjan.hy@ti.com>
Subject: [PATCH v2 8/8] ASoC: tas2783A: read slave properties from acpi table
Date: Mon, 15 Dec 2025 21:02:19 +0530
Message-ID: <20251215153219.810-8-niranjan.hy@ti.com>
X-Mailer: git-send-email 2.33.0.windows.2
In-Reply-To: <20251215153219.810-1-niranjan.hy@ti.com>
References: <20251215153219.810-1-niranjan.hy@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0DF:EE_|CO1PR10MB4740:EE_
X-MS-Office365-Filtering-Correlation-Id: d6406dfa-f180-4869-c7a7-08de3bef4a37
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|7416014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?K7cwnzgKkMVZbMp6xvU3Ix6RxTf8QS9+rD2SALbISzFEJLe0XntYF+cvlKb7?=
 =?us-ascii?Q?L1QlUKNhcfik+x702WThlEvABCp5OetfyIkq7/KVmdbAikQsA4ew6CGOJ/kU?=
 =?us-ascii?Q?9ABRQVKDxnm0frNUfo4PjZJzmQfXlwwhZ6kluR3FlKC7foQJvpoihzZiTeHa?=
 =?us-ascii?Q?pPucQaH8mL/NTNE+u2riV3f9jCGMGykZGmHtJ6icFWt6LURUXOM93/gP42AL?=
 =?us-ascii?Q?9REs4JjbQvsJRYce9ekKa/mCfKy/OrRhybvAiNxNJmyFvtBCtO6Lhkjmdl+0?=
 =?us-ascii?Q?Ty7dU0nztVkh0Zw0/R5fwfxvbSePRcPL1YmVC+oygm5xtnPfHlxjNhZEi8oG?=
 =?us-ascii?Q?9iRL9IlEEhREoDIB/QEsmFWxhhqVSWvEDu2DGlbctD/Rk+vOEsny+XWpQT+L?=
 =?us-ascii?Q?tGi/JE2rdlzW4bQsc7as9i9GOLCEsmF03e8zs9l1a1p3w9V2XOLVzQKdQakT?=
 =?us-ascii?Q?wghmXBvZpxbDfsx/W1XAUVy22dYFYQiEM4xNgieyAkCQsGMdY0fTQsyiUuxf?=
 =?us-ascii?Q?dGnhiKXVPM5eSDTgw9CZi+hGRSNjmw0k2yjiBauZcLNWPO3+nCPA4nxLhbBY?=
 =?us-ascii?Q?GLB0lJxI+i9Dj+U8s/tIug+2izvOA8/5mMjPcyj6qcH4HJtlDyMVU2dX9uGg?=
 =?us-ascii?Q?dFaWWe16A5coCkwpU5Ss3exhYFITmT80PKOiAQt7oM6OSnYnfxJwBURa6F3+?=
 =?us-ascii?Q?2qGopY3iicgP4NXHLtLonti268P46fW1IeODS9/GHpqrFFKx/BtiOUHV0fjV?=
 =?us-ascii?Q?PTux+tJ5MIGLecuUGhMLww0iqSyQlsi3JytWWI5xAyCCna0WcDRNCdM2FsZM?=
 =?us-ascii?Q?RnNT+c0UOTwq4QHr/z6AMMjctiJIJVnCxAenHLgN1OQE7/mqu+kMd/FvB4e8?=
 =?us-ascii?Q?7pB7WwPmBh9sGwesKG8q4HBNzj38Qq6qUKvIbXZ3A+InR4I8YfO4x27QvqkT?=
 =?us-ascii?Q?OhRbdQc60hQPnp/K/p5WCLWLrNccTXZGFE8j+Fb06edqFS9qTdw/QWmTJ6IS?=
 =?us-ascii?Q?tiotwmYaemeDTxFRYqHSbwGoMyRGUAvs+bSGt3Z8LoAhH/r/dZHb6MBVIUHh?=
 =?us-ascii?Q?1E3zAo4e2zy6gYJZlDze1ePWS2h/lEHEQkBLPYW4g9fdAbs87Ad6TMXb9rxB?=
 =?us-ascii?Q?ioAEPmIMOf83ErxVmClmEJo8a072gu/JTSIFPkhxz+ng33itJ66aLZ19tc2s?=
 =?us-ascii?Q?s9LrUeV+rG0n20gO6mP9bmkquVjXS/IXc2iGOHrhuwsuscxiJrefoMT2SyuU?=
 =?us-ascii?Q?WeBbx/bgsUvfYaj93wOnj1vJvo84FoFv/1pEe0muZlAaLQYxajnAfuTvTPeN?=
 =?us-ascii?Q?dg5OZGrs9KKgjKpRmHlbDBnBy8H6oTSv74G4mZ2Ko3G6p6eoTnE7/+nXnCAL?=
 =?us-ascii?Q?OPayWu45hnO6nGwkiRtqIBDo0ZRL/HqBejcDUXsKdwpsIiAcBqnH72ouUY9S?=
 =?us-ascii?Q?CA2NMKrChzFrvKAxLdNAE6aaNIyjEUaYFn43iwRdobD7isGwTyNPdHRUVpO4?=
 =?us-ascii?Q?s9u3Fj1e1JBN8bktsJ+x1VQm9N2oqUi+FNpsjpLlBL48j5BkHP1YmYpWgVyX?=
 =?us-ascii?Q?B7NoEhZhXgvgDbeL4bw=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2025 15:33:26.0339
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 d6406dfa-f180-4869-c7a7-08de3bef4a37
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	MN1PEPF0000F0DF.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4740
X-MailFrom: niranjan.hy@ti.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: BL3KGQPJBGYJDV3QG7VNMEVI2AELSB7F
X-Message-ID-Hash: BL3KGQPJBGYJDV3QG7VNMEVI2AELSB7F
X-Mailman-Approved-At: Wed, 17 Dec 2025 09:10:08 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BL3KGQPJBGYJDV3QG7VNMEVI2AELSB7F/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Currently device is using hardcoded slave properties
using the .read_prop callback from "struct sdw_slave_ops".
This patch removes this and uses the sdw_slave_read_prop API
to read the data directly from the ACPI table.

Signed-off-by: Niranjan H Y <niranjan.hy@ti.com>
Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
v2:
- no change
---
 sound/soc/codecs/tas2783-sdw.c | 66 +++-------------------------------
 1 file changed, 5 insertions(+), 61 deletions(-)

diff --git a/sound/soc/codecs/tas2783-sdw.c b/sound/soc/codecs/tas2783-sdw.c
index 679fb5cb1..af812f95a 100644
--- a/sound/soc/codecs/tas2783-sdw.c
+++ b/sound/soc/codecs/tas2783-sdw.c
@@ -1060,66 +1060,6 @@ static s32 tas_init(struct tas2783_prv *tas_dev)
 	return ret;
 }
 
-static s32 tas_read_prop(struct sdw_slave *slave)
-{
-	struct sdw_slave_prop *prop = &slave->prop;
-	s32 nval;
-	s32 i, j;
-	u32 bit;
-	unsigned long addr;
-	struct sdw_dpn_prop *dpn;
-
-	prop->scp_int1_mask =
-		SDW_SCP_INT1_BUS_CLASH | SDW_SCP_INT1_PARITY;
-	prop->quirks = SDW_SLAVE_QUIRKS_INVALID_INITIAL_PARITY;
-
-	prop->paging_support = true;
-
-	/* first we need to allocate memory for set bits in port lists */
-	prop->source_ports = 0x04; /* BITMAP: 00000100 */
-	prop->sink_ports = 0x2; /* BITMAP:  00000010 */
-
-	nval = hweight32(prop->source_ports);
-	prop->src_dpn_prop = devm_kcalloc(&slave->dev, nval,
-					  sizeof(*prop->src_dpn_prop), GFP_KERNEL);
-	if (!prop->src_dpn_prop)
-		return -ENOMEM;
-
-	i = 0;
-	dpn = prop->src_dpn_prop;
-	addr = prop->source_ports;
-	for_each_set_bit(bit, &addr, 32) {
-		dpn[i].num = bit;
-		dpn[i].type = SDW_DPN_FULL;
-		dpn[i].simple_ch_prep_sm = false;
-		dpn[i].ch_prep_timeout = 10;
-		i++;
-	}
-
-	/* do this again for sink now */
-	nval = hweight32(prop->sink_ports);
-	prop->sink_dpn_prop = devm_kcalloc(&slave->dev, nval,
-					   sizeof(*prop->sink_dpn_prop), GFP_KERNEL);
-	if (!prop->sink_dpn_prop)
-		return -ENOMEM;
-
-	j = 0;
-	dpn = prop->sink_dpn_prop;
-	addr = prop->sink_ports;
-	for_each_set_bit(bit, &addr, 32) {
-		dpn[j].num = bit;
-		dpn[j].type = SDW_DPN_FULL;
-		dpn[j].simple_ch_prep_sm = false;
-		dpn[j].ch_prep_timeout = 10;
-		j++;
-	}
-
-	/* set the timeout values */
-	prop->clk_stop_timeout = 200;
-
-	return 0;
-}
-
 static s32 tas2783_sdca_dev_suspend(struct device *dev)
 {
 	struct tas2783_prv *tas_dev = dev_get_drvdata(dev);
@@ -1272,7 +1212,6 @@ static s32 tas_update_status(struct sdw_slave *slave,
 }
 
 static const struct sdw_slave_ops tas_sdw_ops = {
-	.read_prop	= tas_read_prop,
 	.update_status	= tas_update_status,
 };
 
@@ -1290,6 +1229,11 @@ static s32 tas_sdw_probe(struct sdw_slave *peripheral,
 	struct sdca_function_data *function_data = NULL;
 	int ret, i;
 
+	ret = sdw_slave_read_prop(peripheral);
+	if (ret)
+		return dev_err_probe(dev, ret,
+				     "slave property read failed");
+
 	tas_dev = devm_kzalloc(dev, sizeof(*tas_dev), GFP_KERNEL);
 	if (!tas_dev)
 		return dev_err_probe(dev, -ENOMEM,
-- 
2.43.0

