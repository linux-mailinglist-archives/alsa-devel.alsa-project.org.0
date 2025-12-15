Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F3953CC6BB4
	for <lists+alsa-devel@lfdr.de>; Wed, 17 Dec 2025 10:12:16 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 93D656024E;
	Wed, 17 Dec 2025 10:12:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 93D656024E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1765962736;
	bh=dwZlQ7OU8buLjWLfvuRuAhulHPIYc62DL2IuwEnIAR0=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ud6lI942PwkhNRTegKmO7X3ed6akrS7FMuV9FbE4fVvktgjd3d4+UU8CeFqWjCUid
	 tRK9dB0cmZAv/JjsdnaJZZA+utMiFxWUY/b3ehHy+0eYKKVKfdUXok8RSVFDarWT/8
	 YGP1FePyd1VUesO3FC+41Ngripgz2c8LykIzM7Zg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 70AFAF806C8; Wed, 17 Dec 2025 10:10:22 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 78F1CF806D1;
	Wed, 17 Dec 2025 10:10:22 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 42E30F80169; Mon, 15 Dec 2025 16:33:25 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.3 required=5.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,KHOP_HELO_FCRDNS,T_SPF_HELO_TEMPERROR,T_SPF_TEMPERROR
	shortcircuit=no autolearn=no autolearn_force=no version=3.4.6
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazon11011031.outbound.protection.outlook.com
 [40.93.194.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 79AE6F800DF
	for <alsa-devel@alsa-project.org>; Mon, 15 Dec 2025 16:33:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 79AE6F800DF
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=selector1 header.b=Nr6tLIdP
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SgfPxcY7QyAKKk8lrc+qYdLcH+7xxbkSgrqhXJOJIoGPhX5pbBUaDMoLmjkU8eOMAxMiWsJXM5cVj+0v1zFyO1C+kDqEvC6C1zVu7PDH/ONBGgQ31j3tZy9DDW2y11qAaxZVVRMTI1I79QG1siUaOtrH7+RdAR/0C8GW1fgJU22QeNGYG+Hvhj22SKe4657hetoWG95kihfk7WEwS5y8Jnj6cqqgNYR0+YmJxLc46IHbZLOwvLXzmyE7NWz2WX+d/uwZhNQLJlqa0sONdFtFznqTnI7U+fIMEgD0ufE/I3L7IAP416QpACUZYYHchWfatNQs+owikYJ8czvKQnQaIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8mH6Dbg6SH/wU8ndjgSAPtXY8Qxf3/QojKL1aCwXqzQ=;
 b=XSvXapY13TuKbMoCovtKyQ+HcCmmnalhadFC+C+b/aL2Mc5LyPw+dT0qAq5Ds2CwyrMXX9p97S8MG84V9m98f6o5b40gElX4/ykh7TX/QW2jDWHoPuUG+n9wht8kt3hl4fwM+NDlwDZ3MSHVJ7sCogcdmX/34QX1vtHoTUjP47HQhPCjaJ7e3SKZv1s4JhUVJYgHzwEzdMnsk3k5J8EViBh46y6R+zL9WIE34PzuyCqTtoADWgEfHDr/9ppwahdtciiSWJmTMhifKSyaH9w0ATj3wrTK6/z5z5Wn8wYrx2ETAPFIwdgNa7dQRMc9A2g/5f8UfyvdJ2tn1yv9HzeEMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=linaro.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8mH6Dbg6SH/wU8ndjgSAPtXY8Qxf3/QojKL1aCwXqzQ=;
 b=Nr6tLIdPqjORI5tJXzxQhbgrBc6svpsBmAXlfOfm44mHpRNuR00GYxy/4EVzOiI3k7L+SbIIyALd8yp8HeLRghDUYU3mNkl9tfQnQHWGbZRuRt5mPzuU0YOzT4for7LQrgldoY1MHyrzkChO3XqE+xpy02gNwxrj29kHQXiAYz0=
Received: from SJ0PR03CA0254.namprd03.prod.outlook.com (2603:10b6:a03:3a0::19)
 by DS0PR10MB6919.namprd10.prod.outlook.com (2603:10b6:8:11c::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Mon, 15 Dec
 2025 15:33:17 +0000
Received: from MWH0EPF000989E7.namprd02.prod.outlook.com
 (2603:10b6:a03:3a0:cafe::a0) by SJ0PR03CA0254.outlook.office365.com
 (2603:10b6:a03:3a0::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9412.13 via Frontend Transport; Mon,
 15 Dec 2025 15:33:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 MWH0EPF000989E7.mail.protection.outlook.com (10.167.241.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9434.6 via Frontend Transport; Mon, 15 Dec 2025 15:33:16 +0000
Received: from DLEE203.ent.ti.com (157.170.170.78) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 15 Dec
 2025 09:33:12 -0600
Received: from DLEE212.ent.ti.com (157.170.170.114) by DLEE203.ent.ti.com
 (157.170.170.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 15 Dec
 2025 09:33:12 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 15 Dec 2025 09:33:12 -0600
Received: from LTPW0EX92E.dhcp.ti.com (ltpw0ex92e.dhcp.ti.com [10.82.30.14])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5BFFWTta2639809;
	Mon, 15 Dec 2025 09:33:07 -0600
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
Subject: [PATCH v2 7/8] ASoC: tas2783A: use acpi initialisation table
Date: Mon, 15 Dec 2025 21:02:18 +0530
Message-ID: <20251215153219.810-7-niranjan.hy@ti.com>
X-Mailer: git-send-email 2.33.0.windows.2
In-Reply-To: <20251215153219.810-1-niranjan.hy@ti.com>
References: <20251215153219.810-1-niranjan.hy@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000989E7:EE_|DS0PR10MB6919:EE_
X-MS-Office365-Filtering-Correlation-Id: 892e4472-8e84-4c7a-9182-08de3bef44c1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|7416014|376014|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?oHUkNnm+bpc0VkKFy9iaTGLuHYA6/aBzhVZjeVQEly48JiijdNlpqgVWj2BT?=
 =?us-ascii?Q?1G0REaG0p+su12QT0BNDOlmIVQT4vsuQyAomJilSKLJjoXeCMwV489W9IEhu?=
 =?us-ascii?Q?RcYNUL998WqOqOlrMql5ONj0Ckhd8jlP9KzmiLE3pwC4plDcGiu63uSIaYQN?=
 =?us-ascii?Q?eeD4IxZYcglrX2vSndMXCPjpcOJwiUDf+Qh2KTL1zjFPaP1gNaNKICgQTtVP?=
 =?us-ascii?Q?X1guwQeDDPMx9ymqsOvsFmQWMiHrL7rHQ2YrhHj7CcRA9eqsAaPv8EGw0rD+?=
 =?us-ascii?Q?iSAShU9gLEzQbCi0FwBa3+ewKtF+0L+2vC/0o8p97+yOubCaK56oE/2ATcD8?=
 =?us-ascii?Q?Gj7vUef70RgNXU4KeY+GP+G5+q/GNoC6FnrN8DBZReP0iNo3kAmk5XpAPJ3n?=
 =?us-ascii?Q?neD2VG6kGQQCi6oue5Gr4GKiPpR1yY50rWiStC0iZf8M6ImMx1QXay0jFV+v?=
 =?us-ascii?Q?gyjVwBN3dtTI073dWZ4WPREk8p18aB5njuPm4xz407TKhRP4cyerf2QjGS+X?=
 =?us-ascii?Q?k66zwsoFUfuDB3D3mvBqP67uLkSLvLm3y7A7VzmO8/oXk5Wb5TCDTpr2b1Hy?=
 =?us-ascii?Q?VPjQY22B4eM6phAIZrkd+m8BFXt9+NF4W/tufhRJYZ790QHqgheN70WOKMVj?=
 =?us-ascii?Q?YiThnhmi2BPCWtENqX86f6m2Mt+OdHBMcbnyBk9NvHktLGywSvEm+60LklAu?=
 =?us-ascii?Q?GkIMksUXlUIXjjUd8ARrtlnyfr4nJQzJCkcD2ximOBTwguupvZKo3I15TYQb?=
 =?us-ascii?Q?6rs4SWdx5D49PIRdGrpsaT6Ju6AaaC719QhBGV6ah93FbwNqlcyrwJWJ+JLQ?=
 =?us-ascii?Q?B3a8IUV8VCrAIscDyY1uK4q7ssJqhB9Xf8dQlPimJqD5Btn3ukcEduF9hig3?=
 =?us-ascii?Q?fZ3npQWWiG/j4OepPUod8wnAo+EsWMqNyuyWvH4xdLFVKRSc2/n57TeJaAjh?=
 =?us-ascii?Q?0Xr2FCaQ8i9BZRZe5FS8SCRJ3/cL6AzNYC2wGpnyRczx8PYT+2QpqjuArSTa?=
 =?us-ascii?Q?ojFisbUYLfXWqi5u4evAYEVPXh+QshuM+E9+0JdeG8nkPS/pc+GzDZw6WjWV?=
 =?us-ascii?Q?A7mtiavzEB+sQub3CzQcDHR3NnYgryo3pH5OAEBi7mVGFZCkXJ31nXpi+Brh?=
 =?us-ascii?Q?FmwBDP/WS2cmPVp1DvCc8O4oQGT05rA4ZACgLExPn/NUWARfk4t9A2PGSEoi?=
 =?us-ascii?Q?/bzHGtcDxfwyB0cHmgExktOxt3xfosvcKZddU0R5F7i7/kASDnnX5FVzs6XJ?=
 =?us-ascii?Q?Rf+1BQC1vEdjEUUcwF8a30E5xzlbup4kk+zXq0QsDy+kEQkyDocwPpxOc6D7?=
 =?us-ascii?Q?1WMrDM/E/ezK7rD0ZwCqHrluL1i6BdIhcLIA3LofcSujNY2V+6IrUWiPlPty?=
 =?us-ascii?Q?djA4/RZoonfMfwFLrjf487RSDYIbepc5xPL4JtKJ7ggF7JWtpmu+im8hvcz3?=
 =?us-ascii?Q?3VMOs2U9Nwxt7VjcaDIn3XB+zaGyDWOjUpjg6hOXBxUHhUcdtBM460884KPk?=
 =?us-ascii?Q?k0k0Ex4oE6woIaI2/O45syfh/D2AyMkunSWkuPOyLn9y3dZkZgVP13CcuH/f?=
 =?us-ascii?Q?f/5N+syIQrExrR547UU=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(7416014)(376014)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2025 15:33:16.8934
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 892e4472-8e84-4c7a-9182-08de3bef44c1
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	MWH0EPF000989E7.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB6919
X-MailFrom: niranjan.hy@ti.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: NZFEBOLXI25C4V3VIZD2SFVZ5HQLRHNV
X-Message-ID-Hash: NZFEBOLXI25C4V3VIZD2SFVZ5HQLRHNV
X-Mailman-Approved-At: Wed, 17 Dec 2025 09:09:57 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NZFEBOLXI25C4V3VIZD2SFVZ5HQLRHNV/>
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
v2:
* use API sdca_regmap_write_init for updating the slave device
  with init table
---
 sound/soc/codecs/Kconfig       |  1 +
 sound/soc/codecs/tas2783-sdw.c | 54 ++++++++++++++++++++++++++++++++--
 2 files changed, 52 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
index 061791e61..93a266a12 100644
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
index adfbccedb..679fb5cb1 100644
--- a/sound/soc/codecs/tas2783-sdw.c
+++ b/sound/soc/codecs/tas2783-sdw.c
@@ -32,6 +32,8 @@
 #include <sound/soc.h>
 #include <sound/tlv.h>
 #include <sound/tas2781-tlv.h>
+#include <sound/sdca_function.h>
+#include <sound/sdca_regmap.h>
 
 #include "tas2783.h"
 
@@ -78,6 +80,7 @@ struct tas2783_prv {
 	struct snd_soc_component *component;
 	struct calibration_data cali_data;
 	struct sdw_slave *sdw_peripheral;
+	struct sdca_function_data *sa_func_data;
 	enum sdw_slave_status status;
 	/* calibration */
 	struct mutex calib_lock;
@@ -1223,9 +1226,18 @@ static s32 tas_io_init(struct device *dev, struct sdw_slave *slave)
 		dev_err(tas_dev->dev, "fw request, wait_event timeout\n");
 		ret = -EAGAIN;
 	} else {
-		ret = regmap_multi_reg_write(tas_dev->regmap, tas2783_init_seq,
-					     ARRAY_SIZE(tas2783_init_seq));
-		tas_dev->hw_init = true;
+		if (tas_dev->sa_func_data)
+			ret = sdca_regmap_write_init(dev, tas_dev->regmap,
+						     tas_dev->sa_func_data);
+		else
+			ret = regmap_multi_reg_write(tas_dev->regmap, tas2783_init_seq,
+						     ARRAY_SIZE(tas2783_init_seq));
+
+		if (ret)
+			dev_err(tas_dev->dev,
+				"init writes failed, err=%d", ret);
+		else
+			tas_dev->hw_init = true;
 	}
 
 	return ret;
@@ -1275,12 +1287,47 @@ static s32 tas_sdw_probe(struct sdw_slave *peripheral,
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
@@ -1335,6 +1382,7 @@ static struct sdw_driver tas_sdw_driver = {
 };
 module_sdw_driver(tas_sdw_driver);
 
+MODULE_IMPORT_NS("SND_SOC_SDCA");
 MODULE_AUTHOR("Texas Instruments Inc.");
 MODULE_DESCRIPTION("ASoC TAS2783 SoundWire Driver");
 MODULE_LICENSE("GPL");
-- 
2.43.0

