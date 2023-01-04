Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ACB565CD50
	for <lists+alsa-devel@lfdr.de>; Wed,  4 Jan 2023 07:46:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7084A926C;
	Wed,  4 Jan 2023 07:45:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7084A926C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1672814765;
	bh=ptuhtFN65ug/ui/nEjOjG20myewVJkVVOWDGcdi2Euo=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=ERuSYulD7in4OGIypk05+uKjiqA2o0zsBDvL/kFm+mrcMtqdudkHRzvLZCpBny6DU
	 60FC6XRDEZC4pvxDbVQMBn8KUxYRZuHxf9EXE4yjj+BcS+EsW6GNp54aub5AWuHsMK
	 Tj1dm8iwPPPNYPzt24DQPLkpRZqzEONM+S8FONyM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7A1B8F80552;
	Wed,  4 Jan 2023 07:44:21 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 45956F80543; Wed,  4 Jan 2023 07:44:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
 RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from KOR01-PS2-obe.outbound.protection.outlook.com
 (mail-ps2kor01on2087.outbound.protection.outlook.com [40.107.128.87])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 932FCF8032D
 for <alsa-devel@alsa-project.org>; Wed,  4 Jan 2023 07:44:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 932FCF8032D
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SUr9lZOvDvxyQ9UnQNID7rbb+n/0f3s6MJyI+eHST6EdiTEfloeMIFiRb4zPBllWCSp3o+giSYPLiE75XVmNkL+S+LyroyXg3lSlkzoCTR70aqq1tw+GL+mS0iz4NuaMZ7FHuiWt+MWlE9vB1R+NRSmw8x3jp+gnnsijr4SeL4D9w08jJjRxf4wnLG5HPp2Rx7n8QFlOFeYZojllKTwmsQYXbejkc58P0pcpTcqwu2lpBmaoUm72WSIKR+sgBmLeeRbo96OqFwmp5Or6RxE5BYbDpt27E3/mob/ZPSUnejJAS39Arl4unG3qP1MkIU6izFgDULf1okbxHNv8wdz0LQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jNNWvXGsCOdjNh+N8y9g8j25FH7TBZGnza8rfzkp7Qo=;
 b=JQGA7RXSqUN8xvv/YLCRQxcdTQohtfEKtGMwIKURRv09BggVn1R34VKxAUqYnOHYpJCpttrj/C0e0xYWP2IicaheglXxwY9XU7P5N+SnDE6jgjAQ99aR9pb26lIZgFJWVFheg+lDAHto+zEaOmJ04oeWm2Kl5cbgy8Pi63MsqwZVa9RtKmQQL+Z1sAX10nxFhSnwZGqj5T7ur0n2j6Pjan5U1aP6kKXV91c2iYMC+dsOhWtZ2k0Cnto/mWlN2JGvOZY3MX9dfmQKD/cjuJhZUK+pWEXCeDReXPG/AMZsEx0hQKIr4TzCDsRqgJn9uYvqCxvUuvCoNloibNdbZ01Gow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=irondevice.com; dmarc=pass action=none
 header.from=irondevice.com; dkim=pass header.d=irondevice.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=irondevice.com;
Received: from SLXP216MB0077.KORP216.PROD.OUTLOOK.COM (2603:1096:100:7::23) by
 PU4P216MB1820.KORP216.PROD.OUTLOOK.COM (2603:1096:301:10a::14) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5944.19; Wed, 4 Jan 2023 06:44:09 +0000
Received: from SLXP216MB0077.KORP216.PROD.OUTLOOK.COM
 ([fe80::3d9:7f82:fa73:e727]) by SLXP216MB0077.KORP216.PROD.OUTLOOK.COM
 ([fe80::3d9:7f82:fa73:e727%7]) with mapi id 15.20.5944.019; Wed, 4 Jan 2023
 06:44:09 +0000
From: Kiseok Jo <kiseok.jo@irondevice.com>
To: Mark Brown <broonie@kernel.org>
Subject: [PATCH 3/3] ASOC: sma1303: change the overall contents
Date: Wed,  4 Jan 2023 15:43:42 +0900
Message-Id: <20230104064342.2094-4-kiseok.jo@irondevice.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230104064342.2094-1-kiseok.jo@irondevice.com>
References: <20230104064342.2094-1-kiseok.jo@irondevice.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SL2P216CA0141.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:1::20) To SLXP216MB0077.KORP216.PROD.OUTLOOK.COM
 (2603:1096:100:7::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SLXP216MB0077:EE_|PU4P216MB1820:EE_
X-MS-Office365-Filtering-Correlation-Id: d48912f8-9cbe-4b26-3399-08daee1f14d7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +dA9mb++ITt/+vqgaR7ztLrQLVnqkixbbeaaWmnsOHkF65aVb/7H9ZzkE6eC/4+ulHm5/XVBm3ap1c1g37mOrxurwfneei/vr4py0kF70ZkzZiRBdd85PpFvZ2DfKLxaF9IyN6aOxvNO4qucMBDJEZLoQ75k0ezx7aMjof7XiaEKdCg5Gkm9U7kW6w3nLHPuELvfxFVU50L6ZZipeAiWOZrRb3e9Jpdyo+qi5vYs5z1VCtcNcE0i40ETpBoeE7yGe2PCbhzXAEuuX+AD7LpwkHrzYwcy6FfvCabQ2nnshn+AxQKOzQ1YOk1xxXONQMB3RGnNKfEc3Zzj7xe+U5QSkIyLZHC54uPZCmlfW1ql2Yrt+7h2XUTkvjmpOXGbrdFbOQbvvyZ8v1nwg61V/46ZnakRuf/ORT+H4DcWKRFzmtOITHBuSZs+EU29SSRQaO+13jY8MgV74PylJDmk0FKGzYhqMGPVHJEwvtjzC4nQa9IlANkMYnW0fT/XxudLinPPMTSMytKPizpyK1+UwT3HoflHHoOOIcHnIE8HjbqHjevB+S6H7ZVJHJmiUzvGxtH13CrO+bGDTcD1wGT0gbsVIYVbhnll5HDRmSR9/1iLBtnZuVmxD9cl6LBhggf4pPamiEDlvKQQHOl12eKHD/7/HyVObF4kaXU8MDUEKrzKGxqWLlBa7B4rIqT00OHZC37XaYV/oK7akVYO5qNCRvqo3e5bf4Ii7kT1uS7YEzN7KlQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SLXP216MB0077.KORP216.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230022)(366004)(39830400003)(376002)(346002)(396003)(136003)(451199015)(5660300002)(2906002)(44832011)(8936002)(41300700001)(4326008)(478600001)(8676002)(30864003)(316002)(66476007)(66946007)(6916009)(66556008)(52116002)(6486002)(6666004)(6512007)(26005)(6506007)(107886003)(83380400001)(1076003)(186003)(38100700002)(2616005)(38350700002)(86362001)(36756003)(2004002)(559001)(579004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?xBoPm/6b2K820VBxuedYK9JssKjU6KUdWCkPvh4v8VYSl5oYlkmYmMZEWpME?=
 =?us-ascii?Q?3FQHIP6wZKNa8jsO9yG8EKhVR/XkOQFNLNmOXvJGP70HBxFwJMq93OFyJJnK?=
 =?us-ascii?Q?2QlKDfz1OwBUf4HOoivej3gGa0xaFqDNkhmM33Hmi3eqOasDm1En/IR2cO56?=
 =?us-ascii?Q?6uHlz/1wR/ZN7RlttRGRnsN6LOqcZtbYhHAHlv16RMXJHf+xdvJMR5CoRXnd?=
 =?us-ascii?Q?b7n3SN7XbnxyL0e3sD+35rX8yJWo6JUg7PsBvMcErOFbG7xoYbf6Zp0tdmAy?=
 =?us-ascii?Q?vEFMtqTP34jR1CNmMYHXIBM34Bf+Rc4R9wv1d8pGWnc7/nr16E40KwYN4pG1?=
 =?us-ascii?Q?Y4bl85VaPenxRCFPEJm+ho+oPal2hs86zWaF2YAT5AsKNgYTbRk6lcWlwylI?=
 =?us-ascii?Q?qYonoU0oM+IUbP2xwhldLS+ALbZxarj0q21bTEKVkLPr010yt9BEA9WNr8yv?=
 =?us-ascii?Q?wLDuqcOhVpHsjkYepHMccfbvWdWC4pEx2tbd7MhnOKYXxeWbDJmRDqVilKk1?=
 =?us-ascii?Q?x0Jfw++5yh1Oua40/iuQqtKpPbuSj354UA/1NAJrfZ0i+9+9itxHp6pvD4C4?=
 =?us-ascii?Q?8hHFKxQS3NUrp6Am09j3kUC8KgXSuQqcMTMTNrdHpJkdTr2R3pIafzesF8nH?=
 =?us-ascii?Q?AcYC0nI3LwtdfsaVeS4fjK6FzozPGz8lJ2znDNzUYTe4k1FmNbIMSiNVsFie?=
 =?us-ascii?Q?AouRSZ6eA5zKnkrupXrNR/1qljveD5KO2dbB8XC139N7caukT3c8qAARG8jj?=
 =?us-ascii?Q?A++vu4oWDLvUgh2fLPwNgibybB4T+qd0Z6IrLasrNVbjpwBwYhngAM50LcbY?=
 =?us-ascii?Q?2uKFp58uGdpZegZhXfY+QABtCQs1lM39j59O2/60eyv2AWriCJtA8pU9wEtY?=
 =?us-ascii?Q?9DLWJnMxyAOZdzc66F+Cojne6qO6qX4kWwX/IsXzFnbjH6P+9OJ8PY5hiSjo?=
 =?us-ascii?Q?+fL0tt6E5I8bf+GiuTVsh/G0UvRkpA6tOAK/vl5S7HekBRrbllWzyWyl/B6n?=
 =?us-ascii?Q?3oeQXRR2H4EQSRkOROuc5thkF47yssxOYA5MQChdEtamxih4uwLm39em176L?=
 =?us-ascii?Q?8ic/kcOXEfaFJmDXZclGYqABTnWVAGdHdumUe2KdtgP62K2xgNB20ljFwhdI?=
 =?us-ascii?Q?RRWfcSP19qUKGZ/ZheZ2EgMhTQYfIi+VRqJqsRB6Z0HFQQUozBwtkGlGPaCn?=
 =?us-ascii?Q?Wvo7QUVg4yAml18UqE5Z+o16UVNmEajuGGtcos7IzOcLf5kE/oylckYBh7id?=
 =?us-ascii?Q?B7FXQKJBPDlNsaFuvMFwK7dE/Z1bOx2vYLZwV/3cGOWl7+2FRARoIh0ovaRm?=
 =?us-ascii?Q?jNcAhgGNJrsJz4+RS1uIkcvOLWXeMAmw1lAsRpi+0NpdPSBzI1DtcuFtX1hD?=
 =?us-ascii?Q?A8paNXO88wRJCfz4wbaUXR6uxYUC8NFxDrTLcXr4nfgZpA29ntMkHbcHGJ1t?=
 =?us-ascii?Q?T4lUsd9MYiQDtU/Be5J5CTaQF8lChtB0jt3483yJUVjQF8Si8rMm5iJDnc7g?=
 =?us-ascii?Q?Ho3BBgjbZfZxAspr6nflUBD9bw9l5BtJdzuXl27cGudnm3xuFO9tqss++98G?=
 =?us-ascii?Q?hEYOvOQ+UGYwYG6ePClZyFSuV5rrkbdKCYdBGt3j?=
X-OriginatorOrg: irondevice.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d48912f8-9cbe-4b26-3399-08daee1f14d7
X-MS-Exchange-CrossTenant-AuthSource: SLXP216MB0077.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jan 2023 06:44:09.3640 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b4849faa-3337-494e-a76a-cb25a3b3d7d1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AGFCyMWr3uv9tXVYvSr8bEU/v3oZYJPYKK04OpSxlA9hhRWCpsAASGn86PAy9fX7YciSOmwfDP0EJVMwZITNQ9mWxygM2wRxDWLQ3Bqt5Bs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PU4P216MB1820
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Cc: alsa-devel@alsa-project.org, application@irondevice.com,
 Kiseok Jo <kiseok.jo@irondevice.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Change the component function like DAPM route, widget and controls.
Apply the hw params according to DAI fmt.(Not be user controllable)
Remove unnecessary content.
Revise the style following the kernel coding style.

Signed-off-by: Kiseok Jo <kiseok.jo@irondevice.com>
---
 scripts/kconfig/mconf-cfg  |    2 +
 sound/soc/codecs/sma1303.c | 1709 ++++++++++++++----------------------
 sound/soc/codecs/sma1303.h |  811 ++++++++---------
 3 files changed, 1065 insertions(+), 1457 deletions(-)
 create mode 100644 scripts/kconfig/mconf-cfg

diff --git a/scripts/kconfig/mconf-cfg b/scripts/kconfig/mconf-cfg
new file mode 100644
index 000000000000..4a779eb4a169
--- /dev/null
+++ b/scripts/kconfig/mconf-cfg
@@ -0,0 +1,2 @@
+cflags="-D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600"
+libs="-lncursesw -ltinfo"
diff --git a/sound/soc/codecs/sma1303.c b/sound/soc/codecs/sma1303.c
index 03c969a4891e..f6a1cf77c016 100644
--- a/sound/soc/codecs/sma1303.c
+++ b/sound/soc/codecs/sma1303.c
@@ -1,35 +1,35 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
-/* sma1303.c -- sma1303 ALSA SoC Audio driver
- *
- * Copyright 2022 Iron Device Corporation
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License version 2 as
- * published by the Free Software Foundation.
- */
+//
+// sma1303.c - sma1303 ALSA SoC Audio driver
+//
+// Copyright 2022 Iron Device Corporation
+//
+// Author: Gyuhwa Park <gyuhwa.park@irondevice.com>
+//         Kiseok Jo <kiseok.jo@irondevice.com>
 
+#include <asm/div64.h>
+#include <linux/delay.h>
+#include <linux/i2c.h>
+#include <linux/init.h>
+#include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/moduleparam.h>
-#include <linux/kernel.h>
-#include <linux/init.h>
-#include <linux/delay.h>
+#include <linux/of_device.h>
 #include <linux/pm.h>
-#include <linux/i2c.h>
 #include <linux/regmap.h>
+#include <linux/slab.h>
 #include <linux/version.h>
 #include <sound/core.h>
+#include <sound/initval.h>
 #include <sound/pcm.h>
 #include <sound/pcm_params.h>
 #include <sound/soc.h>
-#include <sound/initval.h>
 #include <sound/tlv.h>
-#include <linux/of_device.h>
-#include <linux/slab.h>
-#include <asm/div64.h>
 
 #include "sma1303.h"
 
 #define CHECK_PERIOD_TIME 1 /* sec per HZ */
+#define MAX_CONTROL_NAME 48
 
 #define PLL_MATCH(_input_clk_name, _output_clk_name, _input_clk,\
 		_post_n, _n, _vco,  _p_cp)\
@@ -43,9 +43,7 @@
 	.p_cp		= _p_cp,\
 }
 
-enum sma1303_type {
-	SMA1303,
-};
+struct callback_ops gCallback;
 
 struct sma1303_pll_match {
 	char *input_clk_name;
@@ -58,34 +56,35 @@ struct sma1303_pll_match {
 };
 
 struct sma1303_priv {
-	enum sma1303_type devtype;
-	struct device *dev;
 	struct attribute_group *attr_grp;
+	struct delayed_work check_fault_work;
+	struct device *dev;
 	struct kobject *kobj;
+	struct mutex lock;
 	struct regmap *regmap;
 	struct sma1303_pll_match *pll_matches;
-	struct mutex lock;
-	struct delayed_work check_fault_work;
 	bool amp_power_status;
-	bool usage_status;
+	bool force_mute_status;
 	int num_of_pll_matches;
-	unsigned int sys_clk_id;
-	unsigned int init_vol;
+	int retry_cnt;
+	unsigned int amp_mode;
 	unsigned int cur_vol;
+	unsigned int format;
+	unsigned int frame_size;
+	unsigned int init_vol;
+	unsigned int last_bclk;
+	unsigned int last_ocp_val;
+	unsigned int last_over_temp;
+	unsigned int rev_num;
+	unsigned int sys_clk_id;
 	unsigned int tdm_slot_rx;
 	unsigned int tdm_slot_tx;
 	unsigned int tsdw_cnt;
-	unsigned int format;
-	unsigned int rev_num;
-	unsigned int last_over_temp;
-	unsigned int last_ocp_val;
-	unsigned int last_bclk;
-	unsigned int frame_size;
-	unsigned int amp_mode;
 	long check_fault_period;
 	long check_fault_status;
 };
 
+static struct snd_kcontrol_new *sma1303_controls;
 static struct sma1303_pll_match sma1303_pll_matches[] = {
 PLL_MATCH("1.411MHz",  "24.595MHz", 1411200,  0x07, 0xF4, 0x8B, 0x03),
 PLL_MATCH("1.536MHz",  "24.576MHz", 1536000,  0x07, 0xE0, 0x8B, 0x03),
@@ -233,688 +232,486 @@ static bool sma1303_volatile_register(struct device *dev, unsigned int reg)
 
 static const DECLARE_TLV_DB_SCALE(sma1303_spk_tlv, -6000, 50, 0);
 
-static int sma1303_regmap_write(struct regmap *map, struct device *dev,
-				unsigned int reg, unsigned int val)
+void sma1303_set_callback_func(struct callback_ops ops)
 {
-	int ret = 0;
-
-	ret = regmap_write(map, reg, val);
-	if (ret < 0) {
-		dev_err(dev, "Failed to write, register: 0x%02X, ret: %d\n",
-			       reg, ret);
-	}
-	return ret;
+	if (ops.set_i2c_err)
+		gCallback.set_i2c_err = ops.set_i2c_err;
 }
+EXPORT_SYMBOL(sma1303_set_callback_func);
 
-static int sma1303_regmap_update_bits(struct regmap *map, struct device *dev,
-		unsigned int reg, unsigned int mask, unsigned int val)
+static int sma1303_regmap_write(struct sma1303_priv *sma1303,
+				unsigned int reg, unsigned int val)
 {
-	int ret = 0;
+	int ret;
+	int cnt = sma1303->retry_cnt;
 
-	ret = regmap_update_bits(map, reg, mask, val);
-	if (ret < 0) {
-		dev_err(dev, "Failed to write, register: 0x%02X, ret: %d\n",
-			       reg, ret);
+	while (cnt--) {
+		ret = regmap_write(sma1303->regmap, reg, val);
+		if (ret < 0) {
+			dev_err(sma1303->dev, "Failed to write [0x%02X]\n", reg);
+			if (gCallback.set_i2c_err)
+				gCallback.set_i2c_err(sma1303->dev, ret);
+		} else
+			break;
 	}
 	return ret;
 }
 
-static int bytes_ext_get(struct snd_kcontrol *kcontrol,
-			struct snd_ctl_elem_value *ucontrol, int reg)
+static int sma1303_regmap_update_bits(struct sma1303_priv *sma1303,
+		unsigned int reg, unsigned int mask, unsigned int val)
 {
-	struct snd_soc_component *component =
-		snd_soc_kcontrol_component(kcontrol);
-	struct sma1303_priv *sma1303 = snd_soc_component_get_drvdata(component);
-	struct soc_bytes_ext *params = (void *)kcontrol->private_value;
-	unsigned int i, reg_val;
-	u8 *val;
-	int ret = -1;
+	int ret;
+	int cnt = sma1303->retry_cnt;
 
-	if (component == NULL) {
-		pr_err("%s:component is NULL\n", __func__);
-		return ret;
-	}
-	if (sma1303 == NULL) {
-		pr_err("%s:sma1303 is NULL\n", __func__);
-		return ret;
-	}
-	val = (u8 *)ucontrol->value.bytes.data;
-	for (i = 0; i < params->max; i++) {
-		ret = regmap_read(sma1303->regmap, reg + i, &reg_val);
+	while (cnt--) {
+		ret = regmap_update_bits(sma1303->regmap, reg, mask, val);
 		if (ret < 0) {
-			dev_err(component->dev,
-				"Failed to read, register: %x ret: %d\n",
-				reg + i, ret);
-			return ret;
-		}
-		if (sizeof(reg_val) > 2)
-			reg_val = cpu_to_le32(reg_val);
-		else
-			reg_val = cpu_to_le16(reg_val);
-		memcpy(val + i, &reg_val, sizeof(u8));
+			dev_err(sma1303->dev, "Failed to update [0x%02X]\n", reg);
+			if (gCallback.set_i2c_err)
+				gCallback.set_i2c_err(sma1303->dev, ret);
+		} else
+			break;
 	}
-
-	return 0;
+	return ret;
 }
 
-static int bytes_ext_put(struct snd_kcontrol *kcontrol,
-			struct snd_ctl_elem_value *ucontrol, int reg)
+static int sma1303_regmap_read(struct sma1303_priv *sma1303,
+		unsigned int reg, unsigned int *val)
 {
-	struct snd_soc_component *component =
-		snd_soc_kcontrol_component(kcontrol);
-	struct sma1303_priv *sma1303 = snd_soc_component_get_drvdata(component);
-	struct soc_bytes_ext *params = (void *)kcontrol->private_value;
-	void *data;
-	u8 *val;
-	int i, ret = -1;
-
-	if (component == NULL) {
-		pr_err("%s:component is NULL\n", __func__);
-		return ret;
-	}
-	if (sma1303 == NULL) {
-		pr_err("%s:sma1303 is NULL\n", __func__);
-		return ret;
-	}
-	data = kmemdup(ucontrol->value.bytes.data,
-			params->max, GFP_KERNEL | GFP_DMA);
-	if (!data)
-		return -ENOMEM;
+	int ret;
+	int cnt = sma1303->retry_cnt;
 
-	val = (u8 *)data;
-	for (i = 0; i < params->max; i++) {
-		ret = sma1303_regmap_write(
-				sma1303->regmap, component->dev,
-				reg + i, *(val + i));
+	while (cnt--) {
+		ret = regmap_read(sma1303->regmap, reg, val);
 		if (ret < 0) {
-			kfree(data);
-			return ret;
-		}
-	}
-	kfree(data);
-
-	return 0;
-}
-
-static int amp_usage_status_get(struct snd_kcontrol *kcontrol,
-		struct snd_ctl_elem_value *ucontrol)
-{
-	struct snd_soc_component *component =
-		snd_soc_kcontrol_component(kcontrol);
-	struct sma1303_priv *sma1303 = snd_soc_component_get_drvdata(component);
-	int ret = -1;
-
-	if (component == NULL) {
-		pr_err("%s:component is NULL\n", __func__);
-		return ret;
-	}
-	if (sma1303 == NULL) {
-		pr_err("%s:sma1303 is NULL\n", __func__);
-		return ret;
+			dev_err(sma1303->dev, "Failed to read [0x%02X]\n", reg);
+			if (gCallback.set_i2c_err)
+				gCallback.set_i2c_err(sma1303->dev, ret);
+		} else
+			break;
 	}
-	ucontrol->value.integer.value[0] = sma1303->usage_status;
-
-	if (sma1303->usage_status)
-		dev_info(component->dev, "Amplifier Power Control Enabled\n");
-	else
-		dev_info(component->dev, "Amplifier Power Control Disabled\n");
-
-	return 0;
+	return ret;
 }
 
-static int amp_usage_status_put(struct snd_kcontrol *kcontrol,
-		struct snd_ctl_elem_value *ucontrol)
-{
-	struct snd_soc_component *component =
-		snd_soc_kcontrol_component(kcontrol);
-	struct sma1303_priv *sma1303 = snd_soc_component_get_drvdata(component);
-	int ret = -1;
+static const char * const sma1303_aif_in_source_text[] = {
+	"Mono", "Left", "Right"};
+static const char * const sma1303_aif_out_source_text[] = {
+	"Disable", "After_FmtC", "After_Mixer", "After_DSP", "After_Post",
+		"Clk_PLL", "Clk_OSC"};
 
-	if (component == NULL) {
-		pr_err("%s:component is NULL\n", __func__);
-		return ret;
-	}
-	if (sma1303 == NULL) {
-		pr_err("%s:sma1303 is NULL\n", __func__);
-		return ret;
-	}
-
-	if ((sma1303->usage_status
-			!= ucontrol->value.integer.value[0])
-			&& (!ucontrol->value.integer.value[0])) {
-		dev_info(component->dev, "%s\n", "Force AMP Power Down");
-		ret = sma1303_shutdown(component);
-		if (ret < 0) {
-			ucontrol->value.integer.value[0]
-			       = sma1303->usage_status;
-			return ret;
-		}
+static const struct soc_enum sma1303_aif_in_source_enum =
+	SOC_ENUM_SINGLE_EXT(ARRAY_SIZE(sma1303_aif_in_source_text),
+			sma1303_aif_in_source_text);
+static const struct soc_enum sma1303_aif_out_source_enum =
+	SOC_ENUM_SINGLE_EXT(ARRAY_SIZE(sma1303_aif_out_source_text),
+			sma1303_aif_out_source_text);
 
-	}
-	sma1303->usage_status = ucontrol->value.integer.value[0];
-
-	return 0;
-}
-
-static const char * const sma1303_amp_mode_text[] = {
-	"1 Chip", "Mono on 2 chips", "Left in 2 chips", "Right in 2chips"};
-
-static const struct soc_enum sma1303_amp_mode_enum =
-	SOC_ENUM_SINGLE_EXT(ARRAY_SIZE(sma1303_amp_mode_text),
-			sma1303_amp_mode_text);
-static int sma1303_amp_mode_get(struct snd_kcontrol *kcontrol,
+static int sma1303_postscaler_get(struct snd_kcontrol *kcontrol,
 				struct snd_ctl_elem_value *ucontrol)
 {
 	struct snd_soc_component *component =
 		snd_soc_kcontrol_component(kcontrol);
 	struct sma1303_priv *sma1303 = snd_soc_component_get_drvdata(component);
-	int ret = -1;
+	int val, ret;
 
-	if (component == NULL) {
-		pr_err("%s:component is NULL\n", __func__);
-		return ret;
-	}
-	if (sma1303 == NULL) {
-		pr_err("%s:sma1303 is NULL\n", __func__);
-		return ret;
-	}
-	ucontrol->value.integer.value[0] = sma1303->amp_mode;
-
-	switch (sma1303->amp_mode) {
-	case ONE_CHIP_SOLUTION:
-		dev_info(component->dev, "Amplifier 1 Chip Solution\n");
-		break;
-	case MONO_TWO_CHIP_SOLUTION:
-		dev_info(component->dev, "Amplifier Mono 2 Chips Solution\n");
-		break;
-	case LEFT_TWO_CHIP_SOLUTION:
-		dev_info(component->dev, "Amplifier Stereo(Left) 2 Chips Solution\n");
-		break;
-	case RIGHT_TWO_CHIP_SOLUTION:
-		dev_info(component->dev, "Amplifier Stereo(Right) 2 Chips Solution\n");
-		break;
-	default:
-		dev_err(component->dev, "Invalid Value");
-		return ret;
-	}
-	return 0;
+	ret = sma1303_regmap_read(sma1303, SMA1303_90_POSTSCALER, &val);
+	ucontrol->value.integer.value[0] = (val & 0x7E) >> 1;
 
+	return ret;
 }
 
-static int sma1303_amp_mode_put(struct snd_kcontrol *kcontrol,
-		struct snd_ctl_elem_value *ucontrol)
+static int sma1303_postscaler_put(struct snd_kcontrol *kcontrol,
+	struct snd_ctl_elem_value *ucontrol)
 {
 	struct snd_soc_component *component =
 		snd_soc_kcontrol_component(kcontrol);
 	struct sma1303_priv *sma1303 = snd_soc_component_get_drvdata(component);
-	int ret = 0;
+	int ret, sel = (int)ucontrol->value.integer.value[0];
 
-	if (component == NULL) {
-		pr_err("%s:component is NULL\n", __func__);
-		return -1;
-	}
-	if (sma1303 == NULL) {
-		pr_err("%s:sma1303 is NULL\n", __func__);
-		return -1;
-	}
-
-	sma1303->amp_mode = ucontrol->value.integer.value[0];
-
-	switch (sma1303->amp_mode) {
-	case ONE_CHIP_SOLUTION:
-	case MONO_TWO_CHIP_SOLUTION:
-		ret += sma1303_regmap_update_bits(
-				sma1303->regmap, component->dev,
-				SMA1303_11_SYSTEM_CTRL2,
-				MONOMIX_MASK, MONOMIX_ON);
-		ret += sma1303_regmap_update_bits(
-				sma1303->regmap, component->dev,
-				SMA1303_11_SYSTEM_CTRL2,
-				LR_DATA_SW_MASK, LR_DATA_SW_NORMAL);
-		break;
-	case LEFT_TWO_CHIP_SOLUTION:
-		ret += sma1303_regmap_update_bits(
-				sma1303->regmap, component->dev,
-				SMA1303_11_SYSTEM_CTRL2,
-				MONOMIX_MASK, MONOMIX_OFF);
-		ret += sma1303_regmap_update_bits(
-				sma1303->regmap, component->dev,
-				SMA1303_11_SYSTEM_CTRL2,
-				LR_DATA_SW_MASK, LR_DATA_SW_NORMAL);
-		break;
-	case RIGHT_TWO_CHIP_SOLUTION:
-		ret += sma1303_regmap_update_bits(
-				sma1303->regmap, component->dev,
-				SMA1303_11_SYSTEM_CTRL2,
-				MONOMIX_MASK, MONOMIX_OFF);
-		ret += sma1303_regmap_update_bits(
-				sma1303->regmap, component->dev,
-				SMA1303_11_SYSTEM_CTRL2,
-				LR_DATA_SW_MASK, LR_DATA_SW_SWAP);
-		break;
-	default:
-		dev_err(component->dev, "Invalid Value");
-		ret += -1;
-	}
+	ret = sma1303_regmap_update_bits(sma1303,
+			SMA1303_90_POSTSCALER, 0x70, (sel << 1));
 
 	return ret;
 }
 
-static const char * const sma1303_outport_config_text[] = {
-	"Enable", "Disable"};
-
-static const struct soc_enum sma1303_outport_config_enum =
-	SOC_ENUM_SINGLE_EXT(ARRAY_SIZE(sma1303_outport_config_text),
-			sma1303_outport_config_text);
-
-static int sma1303_outport_config_get(struct snd_kcontrol *kcontrol,
+static int sma1303_force_mute_get(struct snd_kcontrol *kcontrol,
 				struct snd_ctl_elem_value *ucontrol)
 {
 	struct snd_soc_component *component =
 		snd_soc_kcontrol_component(kcontrol);
 	struct sma1303_priv *sma1303 = snd_soc_component_get_drvdata(component);
-	int ret = -1, data, val;
 
-	if (component == NULL) {
-		pr_err("%s:component is NULL\n", __func__);
-		return ret;
-	}
-	if (sma1303 == NULL) {
-		pr_err("%s:sma1303 is NULL\n", __func__);
-		return ret;
-	}
-
-	ret = regmap_read(sma1303->regmap, SMA1303_09_OUTPUT_CTRL, &data);
-	if (ret < 0) {
-		dev_err(component->dev,
-			"Failed to read, register: %x ret: %d\n",
-				SMA1303_09_OUTPUT_CTRL, ret);
-		return ret;
-	}
-
-	val = data & PORT_CONFIG_MASK;
-	switch (val) {
-	case INPUT_PORT_ONLY:
-		ucontrol->value.integer.value[0] = 1;
-		break;
-	case OUTPUT_PORT_ENABLE:
-		ucontrol->value.integer.value[0] = 0;
-		break;
-	default:
-		dev_err(component->dev,
-				"Invalid value, register: %x value: %d\n",
-					SMA1303_09_OUTPUT_CTRL, val);
-		return ret;
-	}
+	ucontrol->value.integer.value[0] = (int)sma1303->force_mute_status;
+	dev_info(sma1303->dev, "%s : Force Mute %s\n", __func__,
+			sma1303->force_mute_status ? "ON" : "OFF");
 
 	return 0;
 }
 
-static int sma1303_outport_config_put(struct snd_kcontrol *kcontrol,
-				struct snd_ctl_elem_value *ucontrol)
+static int sma1303_force_mute_put(struct snd_kcontrol *kcontrol,
+	struct snd_ctl_elem_value *ucontrol)
 {
 	struct snd_soc_component *component =
 		snd_soc_kcontrol_component(kcontrol);
 	struct sma1303_priv *sma1303 = snd_soc_component_get_drvdata(component);
-	int sel = (int)ucontrol->value.integer.value[0];
-	int val, ret = -1;
-
-	if (component == NULL) {
-		pr_err("%s:component is NULL\n", __func__);
-		return ret;
-	}
-	if (sma1303 == NULL) {
-		pr_err("%s:sma1303 is NULL\n", __func__);
-		return ret;
-	}
 
-	switch (sel) {
-	case 0:
-		val = OUTPUT_PORT_ENABLE;
-		break;
-	case 1:
-		val = INPUT_PORT_ONLY;
-		break;
-	default:
-		dev_err(component->dev,
-				"Invalid value, register: %x\n",
-					SMA1303_09_OUTPUT_CTRL);
-		return ret;
-	}
+	sma1303->force_mute_status = (bool)ucontrol->value.integer.value[0];
+	dev_info(sma1303->dev, "%s : Force Mute %s\n", __func__,
+			sma1303->force_mute_status ? "ON" : "OFF");
 
-	return sma1303_regmap_update_bits(sma1303->regmap, component->dev,
-			SMA1303_09_OUTPUT_CTRL, PORT_CONFIG_MASK, val);
+	return 0;
 }
 
-static const char * const sma1303_spkmute_text[] = {
-	"Unmute", "Mute"};
-
-static const struct soc_enum sma1303_spkmute_enum =
-	SOC_ENUM_SINGLE(SMA1303_0E_MUTE_VOL_CTRL, 0,
-			ARRAY_SIZE(sma1303_spkmute_text),
-			sma1303_spkmute_text);
-
-static const char * const sma1303_spkmode_text[] = {
-	"Off", "On"};
-
-static const struct soc_enum sma1303_spkmode_enum =
-	SOC_ENUM_SINGLE_EXT(ARRAY_SIZE(sma1303_spkmode_text),
-	sma1303_spkmode_text);
-
-static int sma1303_spkmode_get(struct snd_kcontrol *kcontrol,
-				struct snd_ctl_elem_value *ucontrol)
+static int sma1303_aif_in_event(struct snd_soc_dapm_widget *w,
+			struct snd_kcontrol *kcontrol, int event)
 {
 	struct snd_soc_component *component =
-		snd_soc_kcontrol_component(kcontrol);
+			snd_soc_dapm_to_component(w->dapm);
 	struct sma1303_priv *sma1303 = snd_soc_component_get_drvdata(component);
-	int val, data, ret = -1;
+	unsigned int mux = dapm_kcontrol_get_value(w->kcontrols[0]);
 
-	if (component == NULL) {
-		pr_err("%s:component is NULL\n", __func__);
-		return ret;
-	}
-	if (sma1303 == NULL) {
-		pr_err("%s:sma1303 is NULL\n", __func__);
-		return ret;
-	}
-
-	ret = regmap_read(sma1303->regmap, SMA1303_10_SYSTEM_CTRL1, &data);
-	if (ret < 0) {
-		dev_err(component->dev,
-			"Failed to read, register: %x ret: %d\n",
-				SMA1303_10_SYSTEM_CTRL1, ret);
-		return ret;
-	}
-
-	val = data & SPK_MODE_MASK;
-	if (sma1303->amp_mode == ONE_CHIP_SOLUTION) {
-		switch (val) {
-		case SPK_OFF:
-			ucontrol->value.integer.value[0] = 0;
+	switch (event) {
+	case SND_SOC_DAPM_PRE_PMU:
+		switch(mux) {
+		case 0:
+			sma1303_regmap_update_bits(sma1303,
+					SMA1303_11_SYSTEM_CTRL2,
+					SMA1303_MONOMIX_MASK,
+					SMA1303_MONOMIX_ON);
+			sma1303->amp_mode = SMA1303_MONO;
 			break;
-		case SPK_MONO:
-			ucontrol->value.integer.value[0] = 1;
+		case 1:
+			sma1303_regmap_update_bits(sma1303,
+					SMA1303_11_SYSTEM_CTRL2,
+					SMA1303_MONOMIX_MASK,
+					SMA1303_MONOMIX_OFF);
+			sma1303_regmap_update_bits(sma1303,
+					SMA1303_11_SYSTEM_CTRL2,
+					SMA1303_LR_DATA_SW_MASK,
+					SMA1303_LR_DATA_SW_NORMAL);
+			sma1303->amp_mode = SMA1303_STEREO;
 			break;
-		default:
-			dev_err(component->dev,
-				"Invalid value, register: %x\n",
-					SMA1303_10_SYSTEM_CTRL1);
-			return ret;
-		}
-	} else {
-		switch (val) {
-		case SPK_OFF:
-			ucontrol->value.integer.value[0] = 0;
-			break;
-		case SPK_STEREO:
-			ucontrol->value.integer.value[0] = 1;
+		case 2:
+			sma1303_regmap_update_bits(sma1303,
+					SMA1303_11_SYSTEM_CTRL2,
+					SMA1303_MONOMIX_MASK,
+					SMA1303_MONOMIX_OFF);
+			sma1303_regmap_update_bits(sma1303,
+					SMA1303_11_SYSTEM_CTRL2,
+					SMA1303_LR_DATA_SW_MASK,
+					SMA1303_LR_DATA_SW_NORMAL);
+			sma1303->amp_mode = SMA1303_STEREO;
 			break;
 		default:
-			dev_err(component->dev,
-				"Invalid value, register: %x\n",
-					SMA1303_10_SYSTEM_CTRL1);
-			return ret;
+			dev_err(sma1303->dev,"%s : Invald value (%d)\n",
+								__func__, mux);
+			return -EINVAL;
 		}
-	}
 
+		dev_info(sma1303->dev, "%s : Source : %s\n", __func__,
+					sma1303_aif_in_source_text[mux]);
+		break;
+	}
 	return 0;
 }
-
-static int sma1303_spkmode_put(struct snd_kcontrol *kcontrol,
-				struct snd_ctl_elem_value *ucontrol)
+static int sma1303_aif_out_event(struct snd_soc_dapm_widget *w,
+			struct snd_kcontrol *kcontrol, int event)
 {
 	struct snd_soc_component *component =
-		snd_soc_kcontrol_component(kcontrol);
+			snd_soc_dapm_to_component(w->dapm);
 	struct sma1303_priv *sma1303 = snd_soc_component_get_drvdata(component);
-	int sel = (int)ucontrol->value.integer.value[0];
-	int val, ret = -1;
+	unsigned int mux = dapm_kcontrol_get_value(w->kcontrols[0]);
 
-	if (component == NULL) {
-		pr_err("%s:component is NULL\n", __func__);
-		return ret;
-	}
-	if (sma1303 == NULL) {
-		pr_err("%s:sma1303 is NULL\n", __func__);
-		return ret;
-	}
+	switch (event) {
+	case SND_SOC_DAPM_PRE_PMU:
+		switch(mux) {
+		case 0:
+			sma1303_regmap_update_bits(sma1303,
+					SMA1303_A3_TOP_MAN2,
+					SMA1303_TEST_CLKO_EN_MASK,
+					SMA1303_NORMAL_SDO);
+			sma1303_regmap_update_bits(sma1303,
+					SMA1303_09_OUTPUT_CTRL,
+					SMA1303_PORT_OUT_SEL_MASK,
+					SMA1303_OUT_SEL_DISABLE);
+			break;
+		case 1:
+			sma1303_regmap_update_bits(sma1303,
+					SMA1303_A3_TOP_MAN2,
+					SMA1303_TEST_CLKO_EN_MASK,
+					SMA1303_NORMAL_SDO);
+			sma1303_regmap_update_bits(sma1303,
+					SMA1303_09_OUTPUT_CTRL,
+					SMA1303_PORT_OUT_SEL_MASK,
+					SMA1303_FORMAT_CONVERTER);
+			break;
+		case 2:
+			sma1303_regmap_update_bits(sma1303,
+					SMA1303_A3_TOP_MAN2,
+					SMA1303_TEST_CLKO_EN_MASK,
+					SMA1303_NORMAL_SDO);
+			sma1303_regmap_update_bits(sma1303,
+					SMA1303_09_OUTPUT_CTRL,
+					SMA1303_PORT_OUT_SEL_MASK,
+					SMA1303_MIXER_OUTPUT);
+			break;
+		case 3:
+			sma1303_regmap_update_bits(sma1303,
+					SMA1303_A3_TOP_MAN2,
+					SMA1303_TEST_CLKO_EN_MASK,
+					SMA1303_NORMAL_SDO);
+			sma1303_regmap_update_bits(sma1303,
+					SMA1303_09_OUTPUT_CTRL,
+					SMA1303_PORT_OUT_SEL_MASK,
+					SMA1303_SPEAKER_PATH);
+			break;
+		case 4:
+			sma1303_regmap_update_bits(sma1303,
+					SMA1303_A3_TOP_MAN2,
+					SMA1303_TEST_CLKO_EN_MASK,
+					SMA1303_NORMAL_SDO);
+			sma1303_regmap_update_bits(sma1303,
+					SMA1303_09_OUTPUT_CTRL,
+					SMA1303_PORT_OUT_SEL_MASK,
+					SMA1303_POSTSCALER_OUTPUT);
+			break;
+		case 5:
+			sma1303_regmap_update_bits(sma1303,
+					SMA1303_A3_TOP_MAN2,
+					SMA1303_TEST_CLKO_EN_MASK,
+					SMA1303_CLK_OUT_SDO);
+			sma1303_regmap_update_bits(sma1303,
+					SMA1303_A3_TOP_MAN2,
+					SMA1303_MON_OSC_PLL_MASK,
+					SMA1303_PLL_SDO);
+			break;
+		case 6:
+			sma1303_regmap_update_bits(sma1303,
+					SMA1303_A3_TOP_MAN2,
+					SMA1303_TEST_CLKO_EN_MASK,
+					SMA1303_CLK_OUT_SDO);
+			sma1303_regmap_update_bits(sma1303,
+					SMA1303_A3_TOP_MAN2,
+					SMA1303_MON_OSC_PLL_MASK,
+					SMA1303_OSC_SDO);
+			break;
+		default:
+			dev_err(sma1303->dev,"%s : Invald value (%d)\n",
+								__func__, mux);
+			return -EINVAL;
+		}
 
-	switch (sel) {
-	case 0:
-		val = SPK_OFF;
+		dev_info(sma1303->dev, "%s : Source : %s\n", __func__,
+					sma1303_aif_out_source_text[mux]);
 		break;
-	case 1:
-		if (sma1303->amp_mode == ONE_CHIP_SOLUTION)
-			val = SPK_MONO;
-		else
-			val = SPK_STEREO;
-		break;
-	default:
-		dev_err(component->dev,
-			"Invalid value, register: %x\n",
-				SMA1303_10_SYSTEM_CTRL1);
-		return ret;
 	}
-
-	return sma1303_regmap_update_bits(sma1303->regmap, component->dev,
-			SMA1303_10_SYSTEM_CTRL1, SPK_MODE_MASK, val);
-}
-
-static int postscaler_get(struct snd_kcontrol *kcontrol,
-				struct snd_ctl_elem_value *ucontrol)
-{
-	return bytes_ext_get(kcontrol, ucontrol, SMA1303_90_POSTSCALER);
-}
-
-static int postscaler_put(struct snd_kcontrol *kcontrol,
-	struct snd_ctl_elem_value *ucontrol)
-{
-	return bytes_ext_put(kcontrol, ucontrol, SMA1303_90_POSTSCALER);
+	return 0;
 }
 
-static const char * const sma1303_postscaler_config_text[] = {
-	"Enable", "Disable"};
-
-static const struct soc_enum sma1303_postscaler_config_enum =
-	SOC_ENUM_SINGLE_EXT(ARRAY_SIZE(sma1303_postscaler_config_text),
-			sma1303_postscaler_config_text);
-
-static int sma1303_postscaler_config_get(struct snd_kcontrol *kcontrol,
-				struct snd_ctl_elem_value *ucontrol)
+static int sma1303_post_scaler_event(struct snd_soc_dapm_widget *w,
+			struct snd_kcontrol *kcontrol, int event)
 {
 	struct snd_soc_component *component =
-		snd_soc_kcontrol_component(kcontrol);
+			snd_soc_dapm_to_component(w->dapm);
 	struct sma1303_priv *sma1303 = snd_soc_component_get_drvdata(component);
-	int ret = -1, data, val;
-
-	if (component == NULL) {
-		pr_err("%s:component is NULL\n", __func__);
-		return ret;
-	}
-	if (sma1303 == NULL) {
-		pr_err("%s:sma1303 is NULL\n", __func__);
-		return ret;
-	}
-
-	ret = regmap_read(sma1303->regmap, SMA1303_90_POSTSCALER, &data);
-	if (ret < 0) {
-		dev_err(component->dev,
-			"Failed to read, register: %x ret: %d\n",
-				SMA1303_90_POSTSCALER, ret);
-		return ret;
-	}
 
-	val = data & BYP_POST_MASK;
-	switch (val) {
-	case BYP_POST_SCALER:
-		ucontrol->value.integer.value[0] = 1;
+	switch (event) {
+	case SND_SOC_DAPM_PRE_PMU:
+		dev_info(sma1303->dev, "%s : SND_SOC_DAPM_PRE_PMU\n", __func__);
+		sma1303_regmap_update_bits(sma1303,
+				SMA1303_90_POSTSCALER,
+				SMA1303_BYP_POST_MASK,
+				SMA1303_EN_POST_SCALER);
 		break;
-	case EN_POST_SCALER:
-		ucontrol->value.integer.value[0] = 0;
+	case SND_SOC_DAPM_POST_PMD:
+		dev_info(sma1303->dev,
+				"%s : SND_SOC_DAPM_POST_PMD\n", __func__);
+		sma1303_regmap_update_bits(sma1303,
+				SMA1303_90_POSTSCALER,
+				SMA1303_BYP_POST_MASK,
+				SMA1303_BYP_POST_SCALER);
 		break;
-	default:
-		dev_err(component->dev,
-				"Invalid value, register: %x value: %d\n",
-					SMA1303_90_POSTSCALER, val);
-		return ret;
 	}
-
 	return 0;
 }
 
-static int sma1303_postscaler_config_put(struct snd_kcontrol *kcontrol,
-				struct snd_ctl_elem_value *ucontrol)
+static int sma1303_power_event(struct snd_soc_dapm_widget *w,
+			struct snd_kcontrol *kcontrol, int event)
 {
 	struct snd_soc_component *component =
-		snd_soc_kcontrol_component(kcontrol);
+			snd_soc_dapm_to_component(w->dapm);
 	struct sma1303_priv *sma1303 = snd_soc_component_get_drvdata(component);
-	int sel = (int)ucontrol->value.integer.value[0];
-	int val, ret = -1;
-
-	if (component == NULL) {
-		pr_err("%s:component is NULL\n", __func__);
-		return ret;
-	}
-	if (sma1303 == NULL) {
-		pr_err("%s:sma1303 is NULL\n", __func__);
-		return ret;
-	}
 
-	switch (sel) {
-	case 0:
-		val = EN_POST_SCALER;
+	switch (event) {
+	case SND_SOC_DAPM_POST_PMU:
+		dev_info(sma1303->dev,
+				"%s : SND_SOC_DAPM_POST_PMU\n", __func__);
+		sma1303_startup(component);
 		break;
-	case 1:
-		val = BYP_POST_SCALER;
+	case SND_SOC_DAPM_PRE_PMD:
+		dev_info(sma1303->dev, "%s : SND_SOC_DAPM_PRE_PMD\n", __func__);
+		sma1303_shutdown(component);
 		break;
-	default:
-		dev_err(component->dev,
-				"Invalid value, register: %x\n",
-					SMA1303_90_POSTSCALER);
-		return ret;
 	}
-
-	return sma1303_regmap_update_bits(sma1303->regmap, component->dev,
-			SMA1303_90_POSTSCALER, BYP_POST_MASK, val);
+	return 0;
 }
 
-static const char * const sma1303_o_format_text[] = {
-	"LJ", "I2S", "TDM"};
-
-static const struct soc_enum sma1303_o_format_enum =
-SOC_ENUM_SINGLE_EXT(ARRAY_SIZE(sma1303_o_format_text), sma1303_o_format_text);
-
-static int sma1303_o_format_get(struct snd_kcontrol *kcontrol,
-				struct snd_ctl_elem_value *ucontrol)
+static int sma1303_sdo_event(struct snd_soc_dapm_widget *w,
+			struct snd_kcontrol *kcontrol, int event)
 {
 	struct snd_soc_component *component =
-		snd_soc_kcontrol_component(kcontrol);
+			snd_soc_dapm_to_component(w->dapm);
 	struct sma1303_priv *sma1303 = snd_soc_component_get_drvdata(component);
-	int val, data, ret = -1;
 
-	if (component == NULL) {
-		pr_err("%s:component is NULL\n", __func__);
-		return ret;
-	}
-	if (sma1303 == NULL) {
-		pr_err("%s:sma1303 is NULL\n", __func__);
-		return ret;
-	}
-
-	ret = regmap_read(sma1303->regmap, SMA1303_A4_TOP_MAN3, &data);
-	val = data & O_FORMAT_MASK;
-	switch (val) {
-	case O_FMT_LJ:
-		ucontrol->value.integer.value[0] = 0;
-		break;
-	case O_FMT_I2S:
-		ucontrol->value.integer.value[0] = 1;
-		break;
-	case O_FMT_TDM:
-		ucontrol->value.integer.value[0] = 2;
+	switch (event) {
+	case SND_SOC_DAPM_PRE_PMU:
+		dev_info(sma1303->dev, "%s : SND_SOC_DAPM_PRE_PMU\n", __func__);
+		sma1303_regmap_update_bits(sma1303,
+				SMA1303_09_OUTPUT_CTRL,
+				SMA1303_PORT_CONFIG_MASK,
+				SMA1303_OUTPUT_PORT_ENABLE);
+		sma1303_regmap_update_bits(sma1303,
+				SMA1303_A3_TOP_MAN2,
+				SMA1303_SDO_OUTPUT_MASK,
+				SMA1303_NORMAL_OUT);
+		break;
+	case SND_SOC_DAPM_POST_PMD:
+		dev_info(sma1303->dev,
+				"%s : SND_SOC_DAPM_POST_PMD\n", __func__);
+		sma1303_regmap_update_bits(sma1303,
+				SMA1303_09_OUTPUT_CTRL,
+				SMA1303_PORT_CONFIG_MASK,
+				SMA1303_INPUT_PORT_ONLY);
+		sma1303_regmap_update_bits(sma1303,
+				SMA1303_A3_TOP_MAN2,
+				SMA1303_SDO_OUTPUT_MASK,
+				SMA1303_HIGH_Z_OUT);
 		break;
-	default:
-		dev_err(component->dev,
-			"Invalid value, register: %x\n",
-				SMA1303_A4_TOP_MAN3);
-		return ret;
 	}
-
 	return 0;
 }
-static int sma1303_o_format_put(struct snd_kcontrol *kcontrol,
-				struct snd_ctl_elem_value *ucontrol)
+
+static const struct snd_kcontrol_new sma1303_aif_in_source_control =
+	SOC_DAPM_ENUM("AIF IN Source",sma1303_aif_in_source_enum);
+static const struct snd_kcontrol_new sma1303_aif_out_source_control =
+	SOC_DAPM_ENUM("AIF OUT Source",sma1303_aif_out_source_enum);
+static const struct snd_kcontrol_new sma1303_sdo_control =
+	SOC_DAPM_SINGLE_VIRT("Switch", 1);
+static const struct snd_kcontrol_new sma1303_post_scaler_control =
+	SOC_DAPM_SINGLE_VIRT("Switch", 1);
+static const struct snd_kcontrol_new sma1303_enable_control =
+	SOC_DAPM_SINGLE_VIRT("Switch", 1);
+static const struct snd_kcontrol_new sma1303_snd_controls[] = {
+	SOC_SINGLE_EXT("Postscaler Gain", SMA1303_90_POSTSCALER, 1, 0x30, 0,
+			sma1303_postscaler_get, sma1303_postscaler_put),
+	SOC_SINGLE_BOOL_EXT("Force Mute", 0,
+			sma1303_force_mute_get, sma1303_force_mute_put),
+	SOC_SINGLE_TLV("Speaker Volume", SMA1303_0A_SPK_VOL,
+		0, 167, 1, sma1303_spk_tlv),
+};
+
+static const struct snd_soc_dapm_widget sma1303_dapm_widgets[] = {
+	/* platform domain */
+	SND_SOC_DAPM_OUTPUT("SPK"),
+	SND_SOC_DAPM_INPUT("SDO"),
+
+	/* path domain */
+	SND_SOC_DAPM_MUX_E("AIF IN Source", SND_SOC_NOPM, 0, 0,
+				&sma1303_aif_in_source_control,
+				sma1303_aif_in_event,
+				SND_SOC_DAPM_PRE_PMU),
+	SND_SOC_DAPM_MUX_E("AIF OUT Source", SND_SOC_NOPM, 0, 0,
+				&sma1303_aif_out_source_control,
+				sma1303_aif_out_event,
+				SND_SOC_DAPM_PRE_PMU),
+	SND_SOC_DAPM_SWITCH_E("SDO Enable", SND_SOC_NOPM, 0, 0,
+				&sma1303_sdo_control,
+				sma1303_sdo_event,
+				SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_MIXER("Entry", SND_SOC_NOPM, 0, 0, NULL, 0),
+	SND_SOC_DAPM_SWITCH_E("Post Scaler", SND_SOC_NOPM, 0, 1,
+				&sma1303_post_scaler_control,
+				sma1303_post_scaler_event,
+				SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_OUT_DRV_E("AMP Power", SND_SOC_NOPM, 0, 0, NULL, 0,
+				sma1303_power_event,
+				SND_SOC_DAPM_POST_PMU | SND_SOC_DAPM_PRE_PMD),
+	SND_SOC_DAPM_SWITCH("AMP Enable", SND_SOC_NOPM, 0, 1,
+				&sma1303_enable_control),
+
+	/* stream domain */
+	SND_SOC_DAPM_AIF_IN("AIF IN", "Playback", 0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_OUT("AIF OUT", "Capture", 0, SND_SOC_NOPM, 0, 0),
+};
+
+static const struct snd_soc_dapm_route sma1303_audio_map[] = {
+	/* Playback */
+	{"AIF IN Source", "Mono", "AIF IN"},
+	{"AIF IN Source", "Left", "AIF IN"},
+	{"AIF IN Source", "Right", "AIF IN"},
+
+	{"SDO Enable", "Switch", "AIF IN"},
+	{"AIF OUT Source", "Disable", "SDO Enable"},
+	{"AIF OUT Source", "After_FmtC", "SDO Enable"},
+	{"AIF OUT Source", "After_Mixer", "SDO Enable"},
+	{"AIF OUT Source", "After_DSP", "SDO Enable"},
+	{"AIF OUT Source", "After_Post", "SDO Enable"},
+	{"AIF OUT Source", "Clk_PLL", "SDO Enable"},
+	{"AIF OUT Source", "Clk_OSC", "SDO Enable"},
+
+	{"Entry", NULL, "AIF OUT Source"},
+	{"Entry", NULL, "AIF IN Source"},
+
+	{"Post Scaler", "Switch", "Entry"},
+	{"AMP Power", NULL, "Entry"},
+	{"AMP Power", NULL, "Post Scaler"},
+
+	{"AMP Enable", "Switch", "AMP Power"},
+	{"SPK", NULL, "AMP Enable"},
+
+	/* Capture */
+	{"AIF OUT", NULL, "AMP Enable"},
+};
+
+static int sma1303_add_component_controls(struct snd_soc_component *component)
 {
-	struct snd_soc_component *component =
-		snd_soc_kcontrol_component(kcontrol);
 	struct sma1303_priv *sma1303 = snd_soc_component_get_drvdata(component);
-	int sel = (int)ucontrol->value.integer.value[0];
-	int val, ret = -1;
-
-	if (component == NULL) {
-		pr_err("%s:component is NULL\n", __func__);
-		return ret;
-	}
-	if (sma1303 == NULL) {
-		pr_err("%s:sma1303 is NULL\n", __func__);
-		return ret;
+	unsigned char **name;
+	int index, ret=0;
+
+	sma1303_controls = devm_kzalloc(sma1303->dev,
+			sizeof(sma1303_snd_controls), GFP_KERNEL);
+	name = devm_kzalloc(sma1303->dev,
+			ARRAY_SIZE(sma1303_snd_controls), GFP_KERNEL);
+
+	for (index=0; index<ARRAY_SIZE(sma1303_snd_controls); index++) {
+		sma1303_controls[index] = sma1303_snd_controls[index];
+		name[index] = devm_kzalloc(sma1303->dev,
+				MAX_CONTROL_NAME, GFP_KERNEL);
+		if (!name[index]) {
+			dev_err(sma1303->dev, "%s : No Memory - %s\n",
+				__func__, sma1303_snd_controls[index].name);
+			sma1303_controls[index].name =
+				sma1303_snd_controls[index].name;
+		}
+		else {
+			scnprintf(name[index], MAX_CONTROL_NAME, "%s %s",
+				sma1303->dev->driver->name,
+				sma1303_snd_controls[index].name);
+			sma1303_controls[index].name = name[index];
+		}
 	}
 
-	switch (sel) {
-	case 0:
-		val = O_FMT_LJ;
-		break;
-	case 1:
-		val = O_FMT_I2S;
-		break;
-	case 2:
-		val = O_FMT_TDM;
-		break;
-	default:
-		dev_err(component->dev,
-			"Invalid value, register: %x\n",
-				SMA1303_A4_TOP_MAN3);
-		return ret;
-	}
+	ret = snd_soc_add_component_controls(component,
+			sma1303_controls, ARRAY_SIZE(sma1303_snd_controls));
 
-	return sma1303_regmap_update_bits(sma1303->regmap, component->dev,
-			SMA1303_A4_TOP_MAN3, O_FORMAT_MASK, val);
-}
+	dev_info(sma1303->dev, "%s : prefix=\"%s\", num=%d, ret=%d\n", __func__,
+			sma1303->dev->driver->name,
+			ARRAY_SIZE(sma1303_snd_controls), ret);
 
-static const char * const sma1303_sdo_source_texts[] = {
-	"Disable", "Format_C", "Mixer_Out", "After_DSP", "After_Post"};
-static const unsigned int sma1303_sdo_source_values[] = {
-	OUT_SEL_DISABLE,
-	FORMAT_CONVERTER,
-	MIXER_OUTPUT,
-	SPEAKER_PATH,
-	POSTSCALER_OUTPUT};
-static SOC_VALUE_ENUM_SINGLE_DECL(sma1303_sdo_source_enum,
-		SMA1303_09_OUTPUT_CTRL,
-		0, PORT_OUT_SEL_MASK,
-		sma1303_sdo_source_texts,
-		sma1303_sdo_source_values);
-static const struct snd_kcontrol_new sma1303_sdo_source_mux =
-	SOC_DAPM_ENUM("SDO Source", sma1303_sdo_source_enum);
+	return ret;
 
-static const struct snd_kcontrol_new sma1303_snd_controls[] = {
-SOC_SINGLE_EXT("Amplifier Usage", SND_SOC_NOPM, 0, 1, 0,
-	amp_usage_status_get, amp_usage_status_put),
-SOC_ENUM_EXT("Amplifier Mode", sma1303_amp_mode_enum,
-	sma1303_amp_mode_get, sma1303_amp_mode_put),
-SOC_ENUM_EXT("Outport config", sma1303_outport_config_enum,
-	sma1303_outport_config_get, sma1303_outport_config_put),
-SOC_SINGLE_TLV("Speaker Volume", SMA1303_0A_SPK_VOL,
-		0, 167, 1, sma1303_spk_tlv),
-SOC_ENUM("Speaker Mute Switch", sma1303_spkmute_enum),
-SOC_ENUM_EXT("Speaker Output", sma1303_spkmode_enum,
-	sma1303_spkmode_get, sma1303_spkmode_put),
-SND_SOC_BYTES_EXT("Postscaler Set", 1,
-		postscaler_get, postscaler_put),
-SOC_ENUM_EXT("Postscaler Config", sma1303_postscaler_config_enum,
-	sma1303_postscaler_config_get, sma1303_postscaler_config_put),
-SOC_ENUM_EXT("Output Format", sma1303_o_format_enum,
-	sma1303_o_format_get, sma1303_o_format_put),
-};
+}
 
 static int sma1303_startup(struct snd_soc_component *component)
 {
@@ -927,18 +724,20 @@ static int sma1303_startup(struct snd_soc_component *component)
 		return ret;
 	}
 
-	ret += sma1303_regmap_update_bits(sma1303->regmap, component->dev,
-			SMA1303_8E_PLL_CTRL, PLL_PD2_MASK, PLL_OPERATION2);
+	ret += sma1303_regmap_update_bits(sma1303, SMA1303_8E_PLL_CTRL,
+			SMA1303_PLL_PD2_MASK, SMA1303_PLL_OPERATION2);
 
-	ret += sma1303_regmap_update_bits(sma1303->regmap, component->dev,
-			SMA1303_00_SYSTEM_CTRL, POWER_MASK, POWER_ON);
+	ret += sma1303_regmap_update_bits(sma1303, SMA1303_00_SYSTEM_CTRL,
+			SMA1303_POWER_MASK, SMA1303_POWER_ON);
 
-	if (sma1303->amp_mode == ONE_CHIP_SOLUTION)
-		ret += sma1303_regmap_update_bits(sma1303->regmap, component->dev,
-			SMA1303_10_SYSTEM_CTRL1, SPK_MODE_MASK, SPK_MONO);
+	if (sma1303->amp_mode == SMA1303_MONO)
+		ret += sma1303_regmap_update_bits(sma1303,
+			SMA1303_10_SYSTEM_CTRL1,
+			SMA1303_SPK_MODE_MASK, SMA1303_SPK_MONO);
 	else
-		ret += sma1303_regmap_update_bits(sma1303->regmap, component->dev,
-			SMA1303_10_SYSTEM_CTRL1, SPK_MODE_MASK, SPK_STEREO);
+		ret += sma1303_regmap_update_bits(sma1303,
+			SMA1303_10_SYSTEM_CTRL1,
+			SMA1303_SPK_MODE_MASK, SMA1303_SPK_STEREO);
 
 	if (sma1303->check_fault_status) {
 		if (sma1303->check_fault_period > 0)
@@ -951,8 +750,8 @@ static int sma1303_startup(struct snd_soc_component *component)
 					CHECK_PERIOD_TIME * HZ);
 	}
 
-	ret += sma1303_regmap_update_bits(sma1303->regmap, component->dev,
-			SMA1303_0E_MUTE_VOL_CTRL, SPK_MUTE_MASK, SPK_UNMUTE);
+	/*ret += sma1303_regmap_update_bits(sma1303, SMA1303_0E_MUTE_VOL_CTRL,
+			SMA1303_SPK_MUTE_MASK, SMA1303_SPK_UNMUTE);*/
 
 	sma1303->amp_power_status = true;
 
@@ -970,150 +769,27 @@ static int sma1303_shutdown(struct snd_soc_component *component)
 		return ret;
 	}
 
-	ret += sma1303_regmap_update_bits(sma1303->regmap, component->dev,
-			SMA1303_0E_MUTE_VOL_CTRL, SPK_MUTE_MASK, SPK_MUTE);
+	/*ret += sma1303_regmap_update_bits(sma1303, SMA1303_0E_MUTE_VOL_CTRL,
+				SMA1303_SPK_MUTE_MASK, SMA1303_SPK_MUTE);*/
 
 	cancel_delayed_work_sync(&sma1303->check_fault_work);
 
 	msleep(55);
 
-	ret += sma1303_regmap_update_bits(sma1303->regmap, component->dev,
-			SMA1303_10_SYSTEM_CTRL1, SPK_MODE_MASK, SPK_OFF);
+	ret += sma1303_regmap_update_bits(sma1303, SMA1303_10_SYSTEM_CTRL1,
+				SMA1303_SPK_MODE_MASK, SMA1303_SPK_OFF);
 
-	ret += sma1303_regmap_update_bits(sma1303->regmap, component->dev,
-			SMA1303_00_SYSTEM_CTRL, POWER_MASK, POWER_OFF);
+	ret += sma1303_regmap_update_bits(sma1303, SMA1303_00_SYSTEM_CTRL,
+				SMA1303_POWER_MASK, SMA1303_POWER_OFF);
 
-	ret += sma1303_regmap_update_bits(sma1303->regmap, component->dev,
-			SMA1303_8E_PLL_CTRL, PLL_PD2_MASK, PLL_PD2);
+	ret += sma1303_regmap_update_bits(sma1303, SMA1303_8E_PLL_CTRL,
+				SMA1303_PLL_PD2_MASK, SMA1303_PLL_PD2);
 
 	sma1303->amp_power_status = false;
 
 	return ret;
 }
 
-static int sma1303_clk_supply_event(struct snd_soc_dapm_widget *w,
-			struct snd_kcontrol *kcontrol, int event)
-{
-	struct snd_soc_component *component =
-		snd_soc_dapm_to_component(w->dapm);
-
-	switch (event) {
-	case SND_SOC_DAPM_PRE_PMU:
-		dev_info(component->dev, "%s : PRE_PMU\n", __func__);
-	break;
-
-	case SND_SOC_DAPM_POST_PMD:
-		dev_info(component->dev, "%s : POST_PMD\n", __func__);
-	break;
-	}
-
-	return 0;
-}
-
-static int sma1303_dac_event(struct snd_soc_dapm_widget *w,
-			struct snd_kcontrol *kcontrol, int event)
-{
-	struct snd_soc_component *component =
-		snd_soc_dapm_to_component(w->dapm);
-	struct sma1303_priv *sma1303 = snd_soc_component_get_drvdata(component);
-
-	switch (event) {
-	case SND_SOC_DAPM_PRE_PMU:
-		dev_info(component->dev, "%s : PRE_PMU\n", __func__);
-
-		if (sma1303->usage_status)
-			sma1303_startup(component);
-
-		break;
-
-	case SND_SOC_DAPM_POST_PMU:
-		dev_info(component->dev, "%s : POST_PMU\n", __func__);
-
-		break;
-
-	case SND_SOC_DAPM_PRE_PMD:
-		dev_info(component->dev, "%s : PRE_PMD\n", __func__);
-
-		sma1303_shutdown(component);
-
-		break;
-
-	case SND_SOC_DAPM_POST_PMD:
-		dev_info(component->dev, "%s : POST_PMD\n", __func__);
-
-		break;
-	}
-
-	return 0;
-}
-
-static int sma1303_dac_feedback_event(struct snd_soc_dapm_widget *w,
-			struct snd_kcontrol *kcontrol, int event)
-{
-	struct snd_soc_component *component =
-		snd_soc_dapm_to_component(w->dapm);
-	struct sma1303_priv *sma1303 = snd_soc_component_get_drvdata(component);
-	int ret = 0;
-
-	switch (event) {
-	case SND_SOC_DAPM_PRE_PMU:
-		dev_info(component->dev,
-				"%s : DAC feedback ON\n", __func__);
-		ret += sma1303_regmap_update_bits(
-				sma1303->regmap, component->dev,
-				SMA1303_09_OUTPUT_CTRL,
-				PORT_CONFIG_MASK|PORT_OUT_SEL_MASK,
-				OUTPUT_PORT_ENABLE|SPEAKER_PATH);
-
-		ret += sma1303_regmap_update_bits(
-				sma1303->regmap, component->dev,
-				SMA1303_A3_TOP_MAN2,
-				SDO_OUTPUT_MASK, NORMAL_OUT);
-		break;
-
-	case SND_SOC_DAPM_PRE_PMD:
-		dev_info(component->dev,
-				"%s : DAC feedback OFF\n", __func__);
-		ret += sma1303_regmap_update_bits(
-				sma1303->regmap, component->dev,
-				SMA1303_09_OUTPUT_CTRL,
-				PORT_OUT_SEL_MASK, OUT_SEL_DISABLE);
-
-		ret += sma1303_regmap_update_bits(
-				sma1303->regmap, component->dev,
-				SMA1303_A3_TOP_MAN2, SDO_OUTPUT_MASK,
-				HIGH_Z_OUT);
-		break;
-	}
-
-	return ret;
-}
-
-static const struct snd_soc_dapm_widget sma1303_dapm_widgets[] = {
-SND_SOC_DAPM_SUPPLY("CLK_SUPPLY", SND_SOC_NOPM, 0, 0, sma1303_clk_supply_event,
-				SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
-SND_SOC_DAPM_DAC_E("DAC", "Playback", SND_SOC_NOPM, 0, 0, sma1303_dac_event,
-				SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMU |
-				SND_SOC_DAPM_PRE_PMD | SND_SOC_DAPM_POST_PMD),
-SND_SOC_DAPM_ADC_E("DAC_FEEDBACK", "Capture", SND_SOC_NOPM, 0, 0,
-				sma1303_dac_feedback_event,
-				SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_PRE_PMD),
-SND_SOC_DAPM_OUTPUT("SPK"),
-SND_SOC_DAPM_INPUT("SDO"),
-SND_SOC_DAPM_MUX("SDO Source", SND_SOC_NOPM, 0, 0, &sma1303_sdo_source_mux),
-};
-
-static const struct snd_soc_dapm_route sma1303_audio_map[] = {
-{"DAC", NULL, "CLK_SUPPLY"},
-{"SPK", NULL, "DAC"},
-{"SDO Source", "Disable", "SDO"},
-{"SDO Source", "Format_C", "SDO"},
-{"SDO Source", "Mixer_Out", "SDO"},
-{"SDO Source", "After_DSP", "SDO"},
-{"SDO Source", "After_Post", "SDO"},
-{"DAC_FEEDBACK", NULL, "SDO Source"},
-};
-
 static int sma1303_setup_pll(struct snd_soc_component *component,
 		unsigned int bclk)
 {
@@ -1139,26 +815,21 @@ static int sma1303_setup_pll(struct snd_soc_component *component,
 		}
 
 		ret += sma1303_regmap_update_bits(
-				sma1303->regmap, component->dev,
-				SMA1303_A2_TOP_MAN1,
-				PLL_PD_MASK|PLL_REF_CLK_MASK,
-				PLL_OPERATION|PLL_SCK);
+				sma1303, SMA1303_A2_TOP_MAN1,
+				SMA1303_PLL_PD_MASK|SMA1303_PLL_REF_CLK_MASK,
+				SMA1303_PLL_OPERATION|SMA1303_PLL_SCK);
 	}
 
-	ret += sma1303_regmap_write(sma1303->regmap, component->dev,
-			SMA1303_8B_PLL_POST_N,
+	ret += sma1303_regmap_write(sma1303, SMA1303_8B_PLL_POST_N,
 			sma1303->pll_matches[i].post_n);
 
-	ret += sma1303_regmap_write(sma1303->regmap, component->dev,
-			SMA1303_8C_PLL_N,
+	ret += sma1303_regmap_write(sma1303, SMA1303_8C_PLL_N,
 			sma1303->pll_matches[i].n);
 
-	ret += sma1303_regmap_write(sma1303->regmap, component->dev,
-			SMA1303_8D_PLL_A_SETTING,
+	ret += sma1303_regmap_write(sma1303, SMA1303_8D_PLL_A_SETTING,
 			sma1303->pll_matches[i].vco);
 
-	ret += sma1303_regmap_write(sma1303->regmap, component->dev,
-			SMA1303_8F_PLL_P_CP,
+	ret += sma1303_regmap_write(sma1303, SMA1303_8F_PLL_P_CP,
 			sma1303->pll_matches[i].p_cp);
 
 	return ret;
@@ -1169,7 +840,6 @@ static int sma1303_dai_hw_params_amp(struct snd_pcm_substream *substream,
 {
 	struct snd_soc_component *component = dai->component;
 	struct sma1303_priv *sma1303 = snd_soc_component_get_drvdata(component);
-	unsigned int input_format = 0;
 	unsigned int bclk = 0;
 	int ret = 0;
 
@@ -1186,18 +856,11 @@ static int sma1303_dai_hw_params_amp(struct snd_pcm_substream *substream,
 
 	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
 
-		if (sma1303->usage_status &&
-			(sma1303->sys_clk_id == SMA1303_PLL_CLKIN_MCLK
-			|| sma1303->sys_clk_id == SMA1303_PLL_CLKIN_BCLK)) {
+		if (sma1303->sys_clk_id == SMA1303_PLL_CLKIN_MCLK
+			|| sma1303->sys_clk_id == SMA1303_PLL_CLKIN_BCLK) {
 
 			if (sma1303->last_bclk != bclk) {
-				if (sma1303->amp_power_status) {
-					sma1303_shutdown(component);
-					sma1303_setup_pll(component, bclk);
-					sma1303_startup(component);
-				} else
-					sma1303_setup_pll(component, bclk);
-
+				sma1303_setup_pll(component, bclk);
 				sma1303->last_bclk = bclk;
 			}
 		}
@@ -1211,27 +874,25 @@ static int sma1303_dai_hw_params_amp(struct snd_pcm_substream *substream,
 		case 44100:
 		case 48000:
 		case 96000:
-		ret += sma1303_regmap_update_bits(
-				sma1303->regmap, component->dev,
-				SMA1303_A2_TOP_MAN1,
-				DAC_DN_CONV_MASK, DAC_DN_CONV_DISABLE);
+			ret += sma1303_regmap_update_bits(
+				sma1303, SMA1303_A2_TOP_MAN1,
+				SMA1303_DAC_DN_CONV_MASK,
+				SMA1303_DAC_DN_CONV_DISABLE);
 
-		ret += sma1303_regmap_update_bits(
-				sma1303->regmap, component->dev,
-				SMA1303_01_INPUT1_CTRL1,
-				LEFTPOL_MASK, LOW_FIRST_CH);
+			ret += sma1303_regmap_update_bits(
+				sma1303, SMA1303_01_INPUT1_CTRL1,
+				SMA1303_LEFTPOL_MASK, SMA1303_LOW_FIRST_CH);
 		break;
 
 		case 192000:
-		ret += sma1303_regmap_update_bits(
-				sma1303->regmap, component->dev,
-				SMA1303_A2_TOP_MAN1,
-				DAC_DN_CONV_MASK, DAC_DN_CONV_ENABLE);
+			ret += sma1303_regmap_update_bits(
+				sma1303, SMA1303_A2_TOP_MAN1,
+				SMA1303_DAC_DN_CONV_MASK,
+				SMA1303_DAC_DN_CONV_ENABLE);
 
-		ret += sma1303_regmap_update_bits(
-				sma1303->regmap, component->dev,
-				SMA1303_01_INPUT1_CTRL1,
-				LEFTPOL_MASK, HIGH_FIRST_CH);
+			ret += sma1303_regmap_update_bits(
+				sma1303, SMA1303_01_INPUT1_CTRL1,
+				SMA1303_LEFTPOL_MASK, SMA1303_HIGH_FIRST_CH);
 		break;
 
 		default:
@@ -1250,9 +911,9 @@ static int sma1303_dai_hw_params_amp(struct snd_pcm_substream *substream,
 				"%s set format SNDRV_PCM_FORMAT_S16_LE\n",
 				__func__);
 			ret += sma1303_regmap_update_bits(
-					sma1303->regmap, component->dev,
-					SMA1303_A4_TOP_MAN3,
-					SCK_RATE_MASK, SCK_32FS);
+					sma1303, SMA1303_A4_TOP_MAN3,
+					SMA1303_SCK_RATE_MASK,
+					SMA1303_SCK_32FS);
 			break;
 
 		case SNDRV_PCM_FORMAT_S24_LE:
@@ -1260,18 +921,18 @@ static int sma1303_dai_hw_params_amp(struct snd_pcm_substream *substream,
 				"%s set format SNDRV_PCM_FORMAT_S24_LE\n",
 				__func__);
 			ret += sma1303_regmap_update_bits(
-					sma1303->regmap, component->dev,
-					SMA1303_A4_TOP_MAN3,
-					SCK_RATE_MASK, SCK_64FS);
+					sma1303, SMA1303_A4_TOP_MAN3,
+					SMA1303_SCK_RATE_MASK,
+					SMA1303_SCK_64FS);
 			break;
 		case SNDRV_PCM_FORMAT_S32_LE:
 			dev_info(component->dev,
 				"%s set format SNDRV_PCM_FORMAT_S32_LE\n",
 				__func__);
 			ret += sma1303_regmap_update_bits(
-					sma1303->regmap, component->dev,
-					SMA1303_A4_TOP_MAN3,
-					SCK_RATE_MASK, SCK_64FS);
+					sma1303, SMA1303_A4_TOP_MAN3,
+					SMA1303_SCK_RATE_MASK,
+					SMA1303_SCK_64FS);
 			break;
 		default:
 			dev_err(component->dev,
@@ -1280,47 +941,69 @@ static int sma1303_dai_hw_params_amp(struct snd_pcm_substream *substream,
 			return -EINVAL;
 		}
 	}
-
-	switch (params_width(params)) {
-	case 16:
-		switch (sma1303->format) {
-		case SND_SOC_DAIFMT_I2S:
-			input_format |= STANDARD_I2S;
-			break;
-		case SND_SOC_DAIFMT_LEFT_J:
-			input_format |= LJ;
+	switch (sma1303->format) {
+	case SND_SOC_DAIFMT_I2S:
+		ret += sma1303_regmap_update_bits(sma1303,
+				SMA1303_01_INPUT1_CTRL1,
+				SMA1303_I2S_MODE_MASK,
+				SMA1303_STANDARD_I2S);
+		ret += sma1303_regmap_update_bits(sma1303,
+				SMA1303_A4_TOP_MAN3,
+				SMA1303_O_FORMAT_MASK,
+				SMA1303_O_FMT_I2S);
+		break;
+	case SND_SOC_DAIFMT_LEFT_J:
+		ret += sma1303_regmap_update_bits(sma1303,
+				SMA1303_01_INPUT1_CTRL1,
+				SMA1303_I2S_MODE_MASK,
+				SMA1303_LJ);
+		ret += sma1303_regmap_update_bits(sma1303,
+				SMA1303_A4_TOP_MAN3,
+				SMA1303_O_FORMAT_MASK,
+				SMA1303_O_FMT_LJ);
+		break;
+	case SND_SOC_DAIFMT_RIGHT_J:
+		switch (params_width(params)) {
+		case 16:
+			ret += sma1303_regmap_update_bits(sma1303,
+					SMA1303_01_INPUT1_CTRL1,
+					SMA1303_I2S_MODE_MASK,
+					SMA1303_RJ_16BIT);
 			break;
-		case SND_SOC_DAIFMT_RIGHT_J:
-			input_format |= RJ_16BIT;
+		case 24:
+		case 32:
+			ret += sma1303_regmap_update_bits(sma1303,
+					SMA1303_01_INPUT1_CTRL1,
+					SMA1303_I2S_MODE_MASK,
+					SMA1303_RJ_24BIT);
 			break;
 		}
 		break;
+	case SND_SOC_DAIFMT_DSP_A:
+		ret += sma1303_regmap_update_bits(sma1303,
+				SMA1303_01_INPUT1_CTRL1,
+				SMA1303_I2S_MODE_MASK,
+				SMA1303_STANDARD_I2S);
+		ret += sma1303_regmap_update_bits(sma1303,
+				SMA1303_A4_TOP_MAN3,
+				SMA1303_O_FORMAT_MASK,
+				SMA1303_O_FMT_TDM);
+		break;
+	}
+
+	switch (params_width(params)) {
+	case 16:
 	case 24:
 	case 32:
-		switch (sma1303->format) {
-		case SND_SOC_DAIFMT_I2S:
-			input_format |= STANDARD_I2S;
-			break;
-		case SND_SOC_DAIFMT_LEFT_J:
-			input_format |= LJ;
-			break;
-		case SND_SOC_DAIFMT_RIGHT_J:
-			input_format |= RJ_24BIT;
-			break;
-		}
+		dev_info(sma1303->dev, "%s : data bit : %d\n", __func__,
+					params_format(params));
 		break;
-
 	default:
 		dev_err(component->dev,
 			"%s not support data bit : %d\n", __func__,
 					params_format(params));
 		return -EINVAL;
 	}
-
-	ret += sma1303_regmap_update_bits(
-			sma1303->regmap, component->dev,
-			SMA1303_01_INPUT1_CTRL1,
-			I2S_MODE_MASK, input_format);
 	return ret;
 }
 
@@ -1343,6 +1026,7 @@ static int sma1303_dai_set_sysclk_amp(struct snd_soc_dai *dai,
 		dev_err(component->dev, "Invalid clk id: %d\n", clk_id);
 		return -EINVAL;
 	}
+	dev_info(sma1303->dev, "%s : freq = %u\n", __func__, freq);
 	sma1303->sys_clk_id = clk_id;
 	return 0;
 }
@@ -1357,25 +1041,27 @@ static int sma1303_dai_mute(struct snd_soc_dai *dai, int mute, int stream)
 		return ret;
 
 	if (!(sma1303->amp_power_status)) {
-		dev_info(component->dev, "%s : %s\n",
+		dev_info(sma1303->dev, "%s : %s\n",
 			__func__, "Already AMP Shutdown");
 		return ret;
 	}
 
 	if (mute) {
-		dev_info(component->dev, "%s : %s\n", __func__, "MUTE");
+		dev_info(sma1303->dev, "%s : %s\n", __func__, "MUTE");
 
 		ret += sma1303_regmap_update_bits(
-				sma1303->regmap, component->dev,
-				SMA1303_0E_MUTE_VOL_CTRL,
-				SPK_MUTE_MASK, SPK_MUTE);
+				sma1303, SMA1303_0E_MUTE_VOL_CTRL,
+				SMA1303_SPK_MUTE_MASK, SMA1303_SPK_MUTE);
 	} else {
-		dev_info(component->dev, "%s : %s\n", __func__, "UNMUTE");
-
-		ret += sma1303_regmap_update_bits(
-				sma1303->regmap, component->dev,
-				SMA1303_0E_MUTE_VOL_CTRL,
-				SPK_MUTE_MASK, SPK_UNMUTE);
+		if (!sma1303->force_mute_status) {
+			dev_info(sma1303->dev, "%s : %s\n", __func__, "UNMUTE");
+			ret += sma1303_regmap_update_bits(
+				sma1303, SMA1303_0E_MUTE_VOL_CTRL,
+				SMA1303_SPK_MUTE_MASK, SMA1303_SPK_UNMUTE);
+		} else {
+			dev_info(sma1303->dev,
+					"%s : FORCE MUTE!!!\n", __func__);
+		}
 	}
 
 	return ret;
@@ -1391,25 +1077,25 @@ static int sma1303_dai_set_fmt_amp(struct snd_soc_dai *dai,
 	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
 
 	case SND_SOC_DAIFMT_CBS_CFS:
-		dev_info(component->dev,
-				"%s : %s\n", __func__, "I2S/TDM Device mode");
+		dev_info(sma1303->dev,
+				"%s : %s\n", __func__, "Device mode");
 		ret += sma1303_regmap_update_bits(
-				sma1303->regmap, component->dev,
-				SMA1303_01_INPUT1_CTRL1,
-				CONTROLLER_DEVICE_MASK, DEVICE_MODE);
+				sma1303, SMA1303_01_INPUT1_CTRL1,
+				SMA1303_CONTROLLER_DEVICE_MASK,
+				SMA1303_DEVICE_MODE);
 		break;
 
 	case SND_SOC_DAIFMT_CBM_CFM:
-		dev_info(component->dev,
-			"%s : %s\n", __func__, "I2S/TDM Controller mode");
+		dev_info(sma1303->dev,
+			"%s : %s\n", __func__, "Controller mode");
 		ret += sma1303_regmap_update_bits(
-				sma1303->regmap, component->dev,
-				SMA1303_01_INPUT1_CTRL1,
-				CONTROLLER_DEVICE_MASK, CONTROLLER_MODE);
+				sma1303, SMA1303_01_INPUT1_CTRL1,
+				SMA1303_CONTROLLER_DEVICE_MASK,
+				SMA1303_CONTROLLER_MODE);
 		break;
 
 	default:
-		dev_err(component->dev,
+		dev_err(sma1303->dev,
 			"Unsupported Controller/Device : 0x%x\n", fmt);
 		return -EINVAL;
 	}
@@ -1435,26 +1121,24 @@ static int sma1303_dai_set_fmt_amp(struct snd_soc_dai *dai,
 		dev_info(component->dev, "%s : %s\n",
 			__func__, "Invert BCLK + Normal Frame");
 		ret += sma1303_regmap_update_bits(
-				sma1303->regmap, component->dev,
-				SMA1303_01_INPUT1_CTRL1,
-				SCK_RISING_MASK, SCK_RISING_EDGE);
+				sma1303, SMA1303_01_INPUT1_CTRL1,
+				SMA1303_SCK_RISING_MASK,
+				SMA1303_SCK_RISING_EDGE);
 		break;
 	case SND_SOC_DAIFMT_IB_IF:
 		dev_info(component->dev, "%s : %s\n",
 			__func__, "Invert BCLK + Invert Frame");
 		ret += sma1303_regmap_update_bits(
-				sma1303->regmap, component->dev,
-				SMA1303_01_INPUT1_CTRL1,
-				LEFTPOL_MASK|SCK_RISING_MASK,
-				HIGH_FIRST_CH|SCK_RISING_EDGE);
+				sma1303, SMA1303_01_INPUT1_CTRL1,
+				SMA1303_LEFTPOL_MASK|SMA1303_SCK_RISING_MASK,
+				SMA1303_HIGH_FIRST_CH|SMA1303_SCK_RISING_EDGE);
 		break;
 	case SND_SOC_DAIFMT_NB_IF:
 		dev_info(component->dev, "%s : %s\n",
 			__func__, "Normal BCLK + Invert Frame");
 		ret += sma1303_regmap_update_bits(
-				sma1303->regmap, component->dev,
-				SMA1303_01_INPUT1_CTRL1,
-				LEFTPOL_MASK, HIGH_FIRST_CH);
+				sma1303, SMA1303_01_INPUT1_CTRL1,
+				SMA1303_LEFTPOL_MASK, SMA1303_HIGH_FIRST_CH);
 		break;
 	case SND_SOC_DAIFMT_NB_NF:
 		dev_info(component->dev, "%s : %s\n",
@@ -1483,22 +1167,19 @@ static int sma1303_dai_set_tdm_slot(struct snd_soc_dai *dai,
 	sma1303->frame_size = slot_width * slots;
 
 	ret += sma1303_regmap_update_bits(
-			sma1303->regmap, component->dev,
-			SMA1303_A4_TOP_MAN3,
-			O_FORMAT_MASK, O_FMT_TDM);
+			sma1303, SMA1303_A4_TOP_MAN3,
+			SMA1303_O_FORMAT_MASK, SMA1303_O_FMT_TDM);
 
 	switch (slot_width) {
 	case 16:
 	ret += sma1303_regmap_update_bits(
-			sma1303->regmap, component->dev,
-			SMA1303_A6_TDM2,
-			TDM_DL_MASK, TDM_DL_16);
+			sma1303, SMA1303_A6_TDM2,
+			SMA1303_TDM_DL_MASK, SMA1303_TDM_DL_16);
 	break;
 	case 32:
 	ret += sma1303_regmap_update_bits(
-			sma1303->regmap, component->dev,
-			SMA1303_A6_TDM2,
-			TDM_DL_MASK, TDM_DL_32);
+			sma1303, SMA1303_A6_TDM2,
+			SMA1303_TDM_DL_MASK, SMA1303_TDM_DL_32);
 	break;
 	default:
 	dev_err(component->dev, "%s not support TDM %d slot_width\n",
@@ -1508,15 +1189,13 @@ static int sma1303_dai_set_tdm_slot(struct snd_soc_dai *dai,
 	switch (slots) {
 	case 4:
 	ret += sma1303_regmap_update_bits(
-			sma1303->regmap, component->dev,
-			SMA1303_A6_TDM2,
-			TDM_N_SLOT_MASK, TDM_N_SLOT_4);
+			sma1303, SMA1303_A6_TDM2,
+			SMA1303_TDM_N_SLOT_MASK, SMA1303_TDM_N_SLOT_4);
 	break;
 	case 8:
 	ret += sma1303_regmap_update_bits(
-			sma1303->regmap, component->dev,
-			SMA1303_A6_TDM2,
-			TDM_N_SLOT_MASK, TDM_N_SLOT_8);
+			sma1303, SMA1303_A6_TDM2,
+			SMA1303_TDM_N_SLOT_MASK, SMA1303_TDM_N_SLOT_8);
 	break;
 	default:
 	dev_err(component->dev, "%s not support TDM %d slots\n",
@@ -1525,27 +1204,25 @@ static int sma1303_dai_set_tdm_slot(struct snd_soc_dai *dai,
 
 	if (sma1303->tdm_slot_rx < slots)
 		ret += sma1303_regmap_update_bits(
-				sma1303->regmap, component->dev,
-				SMA1303_A5_TDM1, TDM_SLOT1_RX_POS_MASK,
+				sma1303, SMA1303_A5_TDM1,
+				SMA1303_TDM_SLOT1_RX_POS_MASK,
 				(sma1303->tdm_slot_rx) << 3);
 	else
 		dev_err(component->dev, "%s Incorrect tdm-slot-rx %d set\n",
 				__func__, sma1303->tdm_slot_rx);
 
 	ret += sma1303_regmap_update_bits(
-			sma1303->regmap, component->dev,
-			SMA1303_A5_TDM1,
-			TDM_CLK_POL_MASK, TDM_CLK_POL_RISE);
+			sma1303, SMA1303_A5_TDM1,
+			SMA1303_TDM_CLK_POL_MASK, SMA1303_TDM_CLK_POL_RISE);
 
 	ret += sma1303_regmap_update_bits(
-			sma1303->regmap, component->dev,
-			SMA1303_A5_TDM1,
-			TDM_TX_MODE_MASK, TDM_TX_MONO);
+			sma1303, SMA1303_A5_TDM1,
+			SMA1303_TDM_TX_MODE_MASK, SMA1303_TDM_TX_MONO);
 
 	if (sma1303->tdm_slot_tx < slots)
 		ret += sma1303_regmap_update_bits(
-				sma1303->regmap, component->dev,
-				SMA1303_A6_TDM2, TDM_SLOT1_TX_POS_MASK,
+				sma1303, SMA1303_A6_TDM2,
+				SMA1303_TDM_SLOT1_TX_POS_MASK,
 				(sma1303->tdm_slot_tx) << 3);
 	else
 		dev_err(component->dev, "%s Incorrect tdm-slot-tx %d set\n",
@@ -1567,25 +1244,25 @@ static const struct snd_soc_dai_ops sma1303_dai_ops_amp = {
 		SNDRV_PCM_FMTBIT_S32_LE)
 
 static struct snd_soc_dai_driver sma1303_dai[] = {
-{
-	.name = "sma1303-amplifier",
-	.id = 0,
-	.playback = {
-	.stream_name = "Playback",
-	.channels_min = 1,
-	.channels_max = 2,
-	.rates = SMA1303_RATES,
-	.formats = SMA1303_FORMATS,
+	{
+		.name = "sma1303-amplifier",
+		.id = 0,
+		.playback = {
+			.stream_name = "Playback",
+			.channels_min = 1,
+			.channels_max = 2,
+			.rates = SMA1303_RATES,
+			.formats = SMA1303_FORMATS,
+		},
+		.capture = {
+			.stream_name = "Capture",
+			.channels_min = 1,
+			.channels_max = 2,
+			.rates = SMA1303_RATES,
+			.formats = SMA1303_FORMATS,
+		},
+		.ops = &sma1303_dai_ops_amp,
 	},
-	.capture = {
-	.stream_name = "Capture",
-	.channels_min = 1,
-	.channels_max = 2,
-	.rates = SMA1303_RATES,
-	.formats = SMA1303_FORMATS,
-	},
-	.ops = &sma1303_dai_ops_amp,
-}
 };
 
 static void sma1303_check_fault_worker(struct work_struct *work)
@@ -1598,10 +1275,10 @@ static void sma1303_check_fault_worker(struct work_struct *work)
 	mutex_lock(&sma1303->lock);
 
 	if (sma1303->tsdw_cnt)
-		ret = regmap_read(sma1303->regmap,
+		ret = sma1303_regmap_read(sma1303,
 			SMA1303_0A_SPK_VOL, &sma1303->cur_vol);
 	else
-		ret = regmap_read(sma1303->regmap,
+		ret = sma1303_regmap_read(sma1303,
 			SMA1303_0A_SPK_VOL, &sma1303->init_vol);
 
 	if (ret != 0) {
@@ -1611,7 +1288,7 @@ static void sma1303_check_fault_worker(struct work_struct *work)
 		return;
 	}
 
-	ret = regmap_read(sma1303->regmap, SMA1303_FA_STATUS1, &over_temp);
+	ret = sma1303_regmap_read(sma1303, SMA1303_FA_STATUS1, &over_temp);
 	if (ret != 0) {
 		dev_err(sma1303->dev,
 			"failed to read SMA1303_FA_STATUS1 : %d\n", ret);
@@ -1619,7 +1296,7 @@ static void sma1303_check_fault_worker(struct work_struct *work)
 		return;
 	}
 
-	ret = regmap_read(sma1303->regmap, SMA1303_FB_STATUS2, &ocp_val);
+	ret = sma1303_regmap_read(sma1303, SMA1303_FB_STATUS2, &ocp_val);
 	if (ret != 0) {
 		dev_err(sma1303->dev,
 			"failed to read SMA1303_FB_STATUS2 : %d\n", ret);
@@ -1627,7 +1304,7 @@ static void sma1303_check_fault_worker(struct work_struct *work)
 		return;
 	}
 
-	ret = regmap_read(sma1303->regmap, SMA1303_FF_DEVICE_INDEX, &uvlo_val);
+	ret = sma1303_regmap_read(sma1303, SMA1303_FF_DEVICE_INDEX, &uvlo_val);
 	if (ret != 0) {
 		dev_err(sma1303->dev,
 			"failed to read SMA1303_FF_DEVICE_INDEX : %d\n", ret);
@@ -1635,41 +1312,39 @@ static void sma1303_check_fault_worker(struct work_struct *work)
 		return;
 	}
 
-	if (~over_temp & OT1_OK_STATUS) {
+	if (~over_temp & SMA1303_OT1_OK_STATUS) {
 		dev_crit(sma1303->dev,
 			"%s : OT1(Over Temperature Level 1)\n", __func__);
 
 		if ((sma1303->cur_vol + 6) <= 0xFF)
-			sma1303_regmap_write(
-				sma1303->regmap, sma1303->dev,
+			sma1303_regmap_write(sma1303,
 				SMA1303_0A_SPK_VOL, sma1303->cur_vol + 6);
 
 		sma1303->tsdw_cnt++;
 	} else if (sma1303->tsdw_cnt) {
-		sma1303_regmap_write(
-				sma1303->regmap, sma1303->dev,
+		sma1303_regmap_write(sma1303,
 				SMA1303_0A_SPK_VOL, sma1303->init_vol);
 		sma1303->tsdw_cnt = 0;
 		sma1303->cur_vol = sma1303->init_vol;
 	}
 
-	if (~over_temp & OT2_OK_STATUS) {
+	if (~over_temp & SMA1303_OT2_OK_STATUS) {
 		dev_crit(sma1303->dev,
 			"%s : OT2(Over Temperature Level 2)\n", __func__);
 	}
-	if (ocp_val & OCP_SPK_STATUS) {
+	if (ocp_val & SMA1303_OCP_SPK_STATUS) {
 		dev_crit(sma1303->dev,
 			"%s : OCP_SPK(Over Current Protect SPK)\n", __func__);
 	}
-	if (ocp_val & OCP_BST_STATUS) {
+	if (ocp_val & SMA1303_OCP_BST_STATUS) {
 		dev_crit(sma1303->dev,
 			"%s : OCP_BST(Over Current Protect Boost)\n", __func__);
 	}
-	if ((ocp_val & CLK_MON_STATUS) && (sma1303->amp_power_status)) {
+	if ((ocp_val & SMA1303_CLK_MON_STATUS) && (sma1303->amp_power_status)) {
 		dev_crit(sma1303->dev,
 			"%s : CLK_FAULT(No clock input)\n", __func__);
 	}
-	if (uvlo_val & UVLO_BST_STATUS) {
+	if (uvlo_val & SMA1303_UVLO_BST_STATUS) {
 		dev_crit(sma1303->dev,
 			"%s : UVLO(Under Voltage Lock Out)\n", __func__);
 	}
@@ -1695,111 +1370,28 @@ static void sma1303_check_fault_worker(struct work_struct *work)
 					CHECK_PERIOD_TIME * HZ);
 	}
 
-	if (!(~over_temp & OT1_OK_STATUS) && !(~over_temp & OT2_OK_STATUS)
-			&& !(ocp_val & OCP_SPK_STATUS)
-			&& !(ocp_val & OCP_BST_STATUS)
-			&& !(ocp_val & CLK_MON_STATUS)
-			&& !(uvlo_val & UVLO_BST_STATUS)) {
+	if (!(~over_temp & SMA1303_OT1_OK_STATUS) && !(~over_temp & SMA1303_OT2_OK_STATUS)
+			&& !(ocp_val & SMA1303_OCP_SPK_STATUS)
+			&& !(ocp_val & SMA1303_OCP_BST_STATUS)
+			&& !(ocp_val & SMA1303_CLK_MON_STATUS)
+			&& !(uvlo_val & SMA1303_UVLO_BST_STATUS)) {
 	}
 
 	mutex_unlock(&sma1303->lock);
 }
 
-#ifdef CONFIG_PM
-static int sma1303_suspend(struct snd_soc_component *component)
-{
-	return 0;
-}
-
-static int sma1303_resume(struct snd_soc_component *component)
-{
-	return 0;
-}
-#else
-#define sma1303_suspend NULL
-#define sma1303_resume NULL
-#endif
-
 static int sma1303_probe(struct snd_soc_component *component)
 {
 	struct sma1303_priv *sma1303 = snd_soc_component_get_drvdata(component);
 	struct snd_soc_dapm_context *dapm =
 		snd_soc_component_get_dapm(component);
-	char *dapm_widget_str = NULL;
-	int prefix_len = 0, str_max = 30, ret = 0, i = 0;
-	unsigned int status, otp_stat;
-
-	if (component->name_prefix != NULL) {
-		dev_info(component->dev, "%s : component name prefix - %s\n",
-			__func__, component->name_prefix);
-
-		prefix_len = strlen(component->name_prefix);
-		dapm_widget_str = kzalloc(prefix_len + str_max, GFP_KERNEL);
-
-		if (!dapm_widget_str) {
-			kfree(dapm_widget_str);
-			return -ENOMEM;
-		}
-
-		strcpy(dapm_widget_str, component->name_prefix);
-		strcat(dapm_widget_str, " Playback");
-
-		snd_soc_dapm_ignore_suspend(dapm, dapm_widget_str);
-
-		memset(dapm_widget_str + prefix_len, 0, str_max);
-
-		strcpy(dapm_widget_str, component->name_prefix);
-		strcat(dapm_widget_str, " SPK");
-
-		snd_soc_dapm_ignore_suspend(dapm, dapm_widget_str);
+	int ret = 0;
 
-		kfree(dapm_widget_str);
-	} else {
-		snd_soc_dapm_ignore_suspend(dapm, "Playback");
-		snd_soc_dapm_ignore_suspend(dapm, "SPK");
-	}
+	ret += sma1303_add_component_controls(component);
 
 	snd_soc_dapm_sync(dapm);
 
-	ret += sma1303_regmap_update_bits(
-			sma1303->regmap, component->dev,
-			SMA1303_00_SYSTEM_CTRL,
-			RESETBYI2C_MASK, RESETBYI2C_RESET);
-
-	ret += regmap_read(sma1303->regmap, SMA1303_FF_DEVICE_INDEX, &status);
-	if (ret < 0) {
-		dev_err(sma1303->dev,
-			"failed to read, register: %02X, ret: %d\n",
-				SMA1303_FF_DEVICE_INDEX, ret);
-		return ret;
-	}
-	sma1303->rev_num = status & REV_NUM_STATUS;
-	if (sma1303->rev_num == REV_NUM_TV0)
-		dev_info(component->dev, "SMA1303 Trimming Version 0\n");
-	else if (sma1303->rev_num == REV_NUM_TV1)
-		dev_info(component->dev, "SMA1303 Trimming Version 1\n");
-
-	ret += regmap_read(sma1303->regmap, SMA1303_FB_STATUS2, &otp_stat);
-	if (ret < 0)
-		dev_err(sma1303->dev,
-			"failed to read, register: %02X, ret: %d\n",
-				SMA1303_FF_DEVICE_INDEX, ret);
-
-	if (((sma1303->rev_num == REV_NUM_TV0) &&
-		((otp_stat & 0x0E) == OTP_STAT_OK_0)) ||
-		((sma1303->rev_num != REV_NUM_TV0) &&
-		((otp_stat & 0x0C) == OTP_STAT_OK_1)))
-		dev_info(component->dev, "SMA1303 OTP Status Successful\n");
-	else
-		dev_info(component->dev, "SMA1303 OTP Status Fail\n");
-
-	for (i = 0; i < (unsigned int)ARRAY_SIZE(sma1303_reg_def); i++)
-		ret += sma1303_regmap_write(
-				sma1303->regmap, component->dev,
-				sma1303_reg_def[i].reg,
-				sma1303_reg_def[i].def);
-
-	ret += sma1303_regmap_write(sma1303->regmap, component->dev,
+	ret += sma1303_regmap_write(sma1303,
 			SMA1303_0A_SPK_VOL, sma1303->init_vol);
 
 	dev_info(component->dev,
@@ -1818,10 +1410,6 @@ static void sma1303_remove(struct snd_soc_component *component)
 static const struct snd_soc_component_driver sma1303_component = {
 	.probe = sma1303_probe,
 	.remove = sma1303_remove,
-	.suspend = sma1303_suspend,
-	.resume = sma1303_resume,
-	.controls = sma1303_snd_controls,
-	.num_controls = ARRAY_SIZE(sma1303_snd_controls),
 	.dapm_widgets = sma1303_dapm_widgets,
 	.num_dapm_widgets = ARRAY_SIZE(sma1303_dapm_widgets),
 	.dapm_routes = sma1303_audio_map,
@@ -1924,9 +1512,9 @@ static int sma1303_i2c_probe(struct i2c_client *client,
 {
 	struct sma1303_priv *sma1303;
 	struct device_node *np = client->dev.of_node;
-	int ret;
+	int ret, i = 0;
 	u32 value;
-	unsigned int device_info;
+	unsigned int device_info, status, otp_stat;
 
 	dev_info(&client->dev, "%s is here. Driver version REV018\n", __func__);
 
@@ -1943,12 +1531,29 @@ static int sma1303_i2c_probe(struct i2c_client *client,
 		dev_err(&client->dev,
 			"Failed to allocate register map: %d\n", ret);
 
-		devm_kfree(&client->dev, sma1303);
-
 		return ret;
 	}
 
 	if (np) {
+		if (!of_property_read_u32(np, "i2c-retry_count", &value)) {
+			if (value > 50 || value < 0) {
+				sma1303->retry_cnt = SMA1303_I2C_RETRY_COUNT;
+				dev_info(&client->dev,
+					"I2C retry count out of range\n");
+				dev_info(&client->dev,
+					"  Set default setting = %d\n",
+						SMA1303_I2C_RETRY_COUNT);
+			} else {
+				sma1303->retry_cnt = value;
+				dev_info(&client->dev,
+					"I2C retry count = %d\n", value);
+			}
+		} else {
+			dev_info(&client->dev,
+				"I2C retry count = %d\n",
+					SMA1303_I2C_RETRY_COUNT);
+			sma1303->retry_cnt = SMA1303_I2C_RETRY_COUNT;
+		}
 		if (!of_property_read_u32(np, "tdm-slot-rx", &value)) {
 			dev_info(&client->dev,
 				"tdm slot rx is '%d' from DT\n", value);
@@ -1995,51 +1600,72 @@ static int sma1303_i2c_probe(struct i2c_client *client,
 		return -ENODEV;
 	}
 
-	ret = regmap_read(sma1303->regmap,
+	ret = sma1303_regmap_read(sma1303,
 		SMA1303_FF_DEVICE_INDEX, &device_info);
 
-	if ((ret != 0) || ((device_info & 0xF8) != DEVICE_ID)) {
+	if ((ret != 0) || ((device_info & 0xF8) != SMA1303_DEVICE_ID)) {
 		dev_err(&client->dev, "device initialization error (%d 0x%02X)",
 				ret, device_info);
 	}
 	dev_info(&client->dev, "chip version 0x%02X\n", device_info);
 
+	ret += sma1303_regmap_update_bits(
+			sma1303, SMA1303_00_SYSTEM_CTRL,
+			SMA1303_RESETBYI2C_MASK, SMA1303_RESETBYI2C_RESET);
+
+	ret += sma1303_regmap_read(sma1303, SMA1303_FF_DEVICE_INDEX, &status);
+
+	sma1303->rev_num = status & SMA1303_REV_NUM_STATUS;
+	if (sma1303->rev_num == SMA1303_REV_NUM_TV0)
+		dev_info(&client->dev, "SMA1303 Trimming Version 0\n");
+	else if (sma1303->rev_num == SMA1303_REV_NUM_TV1)
+		dev_info(&client->dev, "SMA1303 Trimming Version 1\n");
+
+	ret += sma1303_regmap_read(sma1303, SMA1303_FB_STATUS2, &otp_stat);
+
+	if (((sma1303->rev_num == SMA1303_REV_NUM_TV0) &&
+		((otp_stat & 0x0E) == SMA1303_OTP_STAT_OK_0)) ||
+		((sma1303->rev_num != SMA1303_REV_NUM_TV0) &&
+		((otp_stat & 0x0C) == SMA1303_OTP_STAT_OK_1)))
+		dev_info(&client->dev, "SMA1303 OTP Status Successful\n");
+	else
+		dev_info(&client->dev, "SMA1303 OTP Status Fail\n");
+
+	for (i = 0; i < ARRAY_SIZE(sma1303_reg_def); i++)
+		ret += sma1303_regmap_write(sma1303,
+				sma1303_reg_def[i].reg,
+				sma1303_reg_def[i].def);
+
+	sma1303->amp_mode = SMA1303_MONO;
+	sma1303->amp_power_status = false;
+	sma1303->force_mute_status = false;
+	sma1303->last_bclk = 0;
 	sma1303->last_over_temp = 0xC0;
 	sma1303->last_ocp_val = 0x0A;
-	sma1303->tsdw_cnt = 0;
 	sma1303->init_vol = 0x31;
 	sma1303->cur_vol = sma1303->init_vol;
-	sma1303->last_bclk = 0;
+	sma1303->tsdw_cnt = 0;
 
 	INIT_DELAYED_WORK(&sma1303->check_fault_work,
 		sma1303_check_fault_worker);
-
-	mutex_init(&sma1303->lock);
+	sma1303->check_fault_status = true;
 	sma1303->check_fault_period = CHECK_PERIOD_TIME;
 
-	sma1303->devtype = id->driver_data;
+	sma1303->pll_matches = sma1303_pll_matches;
+	sma1303->num_of_pll_matches =
+		ARRAY_SIZE(sma1303_pll_matches);
 	sma1303->dev = &client->dev;
 	sma1303->kobj = &client->dev.kobj;
 
-	i2c_set_clientdata(client, sma1303);
+	mutex_init(&sma1303->lock);
 
-	sma1303->amp_mode = ONE_CHIP_SOLUTION;
-	sma1303->usage_status = true;
-	sma1303->amp_power_status = false;
-	sma1303->check_fault_status = true;
-	sma1303->pll_matches = sma1303_pll_matches;
-	sma1303->num_of_pll_matches =
-		ARRAY_SIZE(sma1303_pll_matches);
+	i2c_set_clientdata(client, sma1303);
 
 	ret = devm_snd_soc_register_component(&client->dev,
 			&sma1303_component, sma1303_dai, 1);
 
 	if (ret) {
 		dev_err(&client->dev, "Failed to register component");
-		snd_soc_unregister_component(&client->dev);
-
-		if (sma1303)
-			devm_kfree(&client->dev, sma1303);
 
 		return ret;
 	}
@@ -2056,19 +1682,12 @@ static int sma1303_i2c_probe(struct i2c_client *client,
 	return ret;
 }
 
-static int sma1303_i2c_remove(struct i2c_client *client)
+static void sma1303_i2c_remove(struct i2c_client *client)
 {
 	struct sma1303_priv *sma1303 =
 		(struct sma1303_priv *) i2c_get_clientdata(client);
 
 	cancel_delayed_work_sync(&sma1303->check_fault_work);
-
-	snd_soc_unregister_component(&client->dev);
-
-	if (sma1303)
-		devm_kfree(&client->dev, sma1303);
-
-	return 0;
 }
 
 static const struct i2c_device_id sma1303_i2c_id[] = {
@@ -2093,25 +1712,7 @@ static struct i2c_driver sma1303_i2c_driver = {
 	.id_table = sma1303_i2c_id,
 };
 
-static int __init sma1303_init(void)
-{
-	int ret;
-
-	ret = i2c_add_driver(&sma1303_i2c_driver);
-
-	if (ret)
-		pr_err("Failed to register sma1303 I2C driver: %d\n", ret);
-
-	return ret;
-}
-
-static void __exit sma1303_exit(void)
-{
-	i2c_del_driver(&sma1303_i2c_driver);
-}
-
-module_init(sma1303_init);
-module_exit(sma1303_exit);
+module_i2c_driver(sma1303_i2c_driver);
 
 MODULE_DESCRIPTION("ALSA SoC SMA1303 driver");
 MODULE_AUTHOR("Gyuhwa Park, <gyuhwa.park@irondevice.com>");
diff --git a/sound/soc/codecs/sma1303.h b/sound/soc/codecs/sma1303.h
index d1fa2acaba85..7e67eb2727be 100644
--- a/sound/soc/codecs/sma1303.h
+++ b/sound/soc/codecs/sma1303.h
@@ -1,16 +1,21 @@
 /* SPDX-License-Identifier: GPL-2.0-or-later
+ *
  * sma1303.h -- sma1303 ALSA SoC Audio driver
  *
  * Copyright 2022 Iron Device Corporation
  *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License version 2 as
- * published by the Free Software Foundation.
  */
 
 #ifndef _SMA1303_H
 #define _SMA1303_H
 
+typedef void (*callback_fptr) (void *device, int err);
+struct callback_ops {
+	callback_fptr set_i2c_err;
+};
+
+void sma1303_set_callback_func(struct callback_ops ops);
+
 #define  SMA1303_I2C_ADDR_00		0x1e
 #define  SMA1303_I2C_ADDR_01		0x3e
 #define  SMA1303_I2C_ADDR_10		0x5e
@@ -21,10 +26,10 @@
 #define  SMA1303_PLL_CLKIN_MCLK		0x02
 #define  SMA1303_PLL_CLKIN_BCLK		0x03
 
-#define  ONE_CHIP_SOLUTION		0x00
-#define  MONO_TWO_CHIP_SOLUTION		0x01
-#define  LEFT_TWO_CHIP_SOLUTION		0x02
-#define  RIGHT_TWO_CHIP_SOLUTION	0x03
+#define  SMA1303_MONO			0x00
+#define  SMA1303_STEREO			0x01
+
+#define  SMA1303_I2C_RETRY_COUNT	3
 
 /*
  * SMA1303 Register Definition
@@ -106,504 +111,504 @@
 /* SMA1303 Registers Bit Fields */
 
 /* SYSTEM_CTRL : 0x00 */
-#define RESETBYI2C_MASK (1<<1)
-#define RESETBYI2C_NORMAL (0<<1)
-#define RESETBYI2C_RESET (1<<1)
+#define SMA1303_RESETBYI2C_MASK (1<<1)
+#define SMA1303_RESETBYI2C_NORMAL (0<<1)
+#define SMA1303_RESETBYI2C_RESET (1<<1)
 
-#define POWER_MASK (1<<0)
-#define POWER_OFF (0<<0)
-#define POWER_ON (1<<0)
+#define SMA1303_POWER_MASK (1<<0)
+#define SMA1303_POWER_OFF (0<<0)
+#define SMA1303_POWER_ON (1<<0)
 
 /* INTPUT CTRL1 : 0x01 */
-#define CONTROLLER_DEVICE_MASK (1<<7)
-#define DEVICE_MODE	(0<<7)
-#define CONTROLLER_MODE	(1<<7)
-
-#define I2S_MODE_MASK	(7<<4)
-#define STANDARD_I2S	(0<<4)
-#define LJ		(1<<4)
-#define RJ_16BIT	(4<<4)
-#define RJ_18BIT	(5<<4)
-#define RJ_20BIT	(6<<4)
-#define RJ_24BIT	(7<<4)
-
-#define LEFTPOL_MASK	(1<<3)
-#define LOW_FIRST_CH	(0<<3)
-#define HIGH_FIRST_CH	(1<<3)
-
-#define SCK_RISING_MASK	(1<<2)
-#define SCK_FALLING_EDGE	(0<<2)
-#define SCK_RISING_EDGE	(1<<2)
+#define SMA1303_CONTROLLER_DEVICE_MASK (1<<7)
+#define SMA1303_DEVICE_MODE	(0<<7)
+#define SMA1303_CONTROLLER_MODE	(1<<7)
+
+#define SMA1303_I2S_MODE_MASK	(7<<4)
+#define SMA1303_STANDARD_I2S	(0<<4)
+#define SMA1303_LJ		(1<<4)
+#define SMA1303_RJ_16BIT	(4<<4)
+#define SMA1303_RJ_18BIT	(5<<4)
+#define SMA1303_RJ_20BIT	(6<<4)
+#define SMA1303_RJ_24BIT	(7<<4)
+
+#define SMA1303_LEFTPOL_MASK	(1<<3)
+#define SMA1303_LOW_FIRST_CH	(0<<3)
+#define SMA1303_HIGH_FIRST_CH	(1<<3)
+
+#define SMA1303_SCK_RISING_MASK	(1<<2)
+#define SMA1303_SCK_FALLING_EDGE	(0<<2)
+#define SMA1303_SCK_RISING_EDGE	(1<<2)
 
 /* INTPUT CTRL2 : 0x02 */
-#define IMODE_MASK (3<<6)
-#define I2S	(0<<6)
-#define PCM_SHORT (1<<6)
-#define PCM_LONG (2<<6)
+#define SMA1303_IMODE_MASK (3<<6)
+#define SMA1303_I2S	(0<<6)
+#define SMA1303_PCM_SHORT (1<<6)
+#define SMA1303_PCM_LONG (2<<6)
 
-#define RIGHT_FIRST_MASK (1<<5)
-#define LEFT_NORMAL (0<<5)
-#define RIGHT_INVERTED (1<<5)
+#define RSMA1303_IGHT_FIRST_MASK (1<<5)
+#define SMA1303_LEFT_NORMAL (0<<5)
+#define SMA1303_RIGHT_INVERTED (1<<5)
 
-#define PCM_ALAW_MASK (1<<4)
-#define PCM_U_DECODING (0<<4)
-#define PCM_A_DECODING (1<<4)
+#define SMA1303_PCM_ALAW_MASK (1<<4)
+#define SMA1303_PCM_U_DECODING (0<<4)
+#define SMA1303_PCM_A_DECODING (1<<4)
 
-#define PCM_COMP_MASK (1<<3)
-#define PCM_LINEAR (0<<3)
-#define PCM_COMPANDING (1<<3)
+#define SMA1303_PCM_COMP_MASK (1<<3)
+#define SMA1303_PCM_LINEAR (0<<3)
+#define SMA1303_PCM_COMPANDING (1<<3)
 
-#define INPUTSEL_MASK (1<<2)
-#define PCM_8KHZ (0<<2)
-#define PCM_16KHZ (1<<2)
+#define SMA1303_INPUTSEL_MASK (1<<2)
+#define SMA1303_PCM_8KHZ (0<<2)
+#define SMA1303_PCM_16KHZ (1<<2)
 
-#define PCM_STEREO_MASK (1<<1)
-#define PCM_MONO (0<<1)
-#define PCM_STEREO (1<<1)
+#define SMA1303_PCM_STEREO_MASK (1<<1)
+#define SMA1303_PCM_MONO (0<<1)
+#define SMA1303_PCM_STEREO (1<<1)
 
-#define PCM_DL_MASK (1<<0)
-#define PCM_8BIT (0<<0)
-#define PCM_16BIT (1<<0)
+#define SMA1303_PCM_DL_MASK (1<<0)
+#define SMA1303_PCM_8BIT (0<<0)
+#define SMA1303_PCM_16BIT (1<<0)
 
 /* INTPUT CTRL3 : 0x03 */
-#define PCM_N_SLOT_MASK (15<<0)
-#define PCM_N_SLOT1 (0<<0)
-#define PCM_N_SLOT2 (1<<0)
-#define PCM_N_SLOT3 (2<<0)
-#define PCM_N_SLOT4 (3<<0)
-#define PCM_N_SLOT5 (4<<0)
-#define PCM_N_SLOT6 (5<<0)
-#define PCM_N_SLOT7 (6<<0)
-#define PCM_N_SLOT8 (7<<0)
-#define PCM_N_SLOT9 (8<<0)
-#define PCM_N_SLOT10 (9<<0)
-#define PCM_N_SLOT11 (10<<0)
-#define PCM_N_SLOT12 (11<<0)
-#define PCM_N_SLOT13 (12<<0)
-#define PCM_N_SLOT14 (13<<0)
-#define PCM_N_SLOT15 (14<<0)
-#define PCM_N_SLOT16 (15<<0)
+#define SMA1303_PCM_N_SLOT_MASK (15<<0)
+#define SMA1303_PCM_N_SLOT1 (0<<0)
+#define SMA1303_PCM_N_SLOT2 (1<<0)
+#define SMA1303_PCM_N_SLOT3 (2<<0)
+#define SMA1303_PCM_N_SLOT4 (3<<0)
+#define SMA1303_PCM_N_SLOT5 (4<<0)
+#define SMA1303_PCM_N_SLOT6 (5<<0)
+#define SMA1303_PCM_N_SLOT7 (6<<0)
+#define SMA1303_PCM_N_SLOT8 (7<<0)
+#define SMA1303_PCM_N_SLOT9 (8<<0)
+#define SMA1303_PCM_N_SLOT10 (9<<0)
+#define SMA1303_PCM_N_SLOT11 (10<<0)
+#define SMA1303_PCM_N_SLOT12 (11<<0)
+#define SMA1303_PCM_N_SLOT13 (12<<0)
+#define SMA1303_PCM_N_SLOT14 (13<<0)
+#define SMA1303_PCM_N_SLOT15 (14<<0)
+#define SMA1303_PCM_N_SLOT16 (15<<0)
 
 /* INTPUT CTRL4 : 0x04 */
-#define PCM1_SLOT_MASK (15<<4)
-#define PCM1_SLOT1 (0<<4)
-#define PCM1_SLOT2 (1<<4)
-#define PCM1_SLOT3 (2<<4)
-#define PCM1_SLOT4 (3<<4)
-#define PCM1_SLOT5 (4<<4)
-#define PCM1_SLOT6 (5<<4)
-#define PCM1_SLOT7 (6<<4)
-#define PCM1_SLOT8 (7<<4)
-#define PCM1_SLOT9 (8<<4)
-#define PCM1_SLOT10 (9<<4)
-#define PCM1_SLOT11 (10<<4)
-#define PCM1_SLOT12 (11<<4)
-#define PCM1_SLOT13 (12<<4)
-#define PCM1_SLOT14 (13<<4)
-#define PCM1_SLOT15 (14<<4)
-#define PCM1_SLOT16 (15<<4)
-
-#define PCM2_SLOT_MASK (15<<0)
-#define PCM2_SLOT1 (0<<0)
-#define PCM2_SLOT2 (1<<0)
-#define PCM2_SLOT3 (2<<0)
-#define PCM2_SLOT4 (3<<0)
-#define PCM2_SLOT5 (4<<0)
-#define PCM2_SLOT6 (5<<0)
-#define PCM2_SLOT7 (6<<0)
-#define PCM2_SLOT8 (7<<0)
-#define PCM2_SLOT9 (8<<0)
-#define PCM2_SLOT10 (9<<0)
-#define PCM2_SLOT11 (10<<0)
-#define PCM2_SLOT12 (11<<0)
-#define PCM2_SLOT13 (12<<0)
-#define PCM2_SLOT14 (13<<0)
-#define PCM2_SLOT15 (14<<0)
-#define PCM2_SLOT16 (15<<0)
+#define SMA1303_PCM1_SLOT_MASK (15<<4)
+#define SMA1303_PCM1_SLOT1 (0<<4)
+#define SMA1303_PCM1_SLOT2 (1<<4)
+#define SMA1303_PCM1_SLOT3 (2<<4)
+#define SMA1303_PCM1_SLOT4 (3<<4)
+#define SMA1303_PCM1_SLOT5 (4<<4)
+#define SMA1303_PCM1_SLOT6 (5<<4)
+#define SMA1303_PCM1_SLOT7 (6<<4)
+#define SMA1303_PCM1_SLOT8 (7<<4)
+#define SMA1303_PCM1_SLOT9 (8<<4)
+#define SMA1303_PCM1_SLOT10 (9<<4)
+#define SMA1303_PCM1_SLOT11 (10<<4)
+#define SMA1303_PCM1_SLOT12 (11<<4)
+#define SMA1303_PCM1_SLOT13 (12<<4)
+#define SMA1303_PCM1_SLOT14 (13<<4)
+#define SMA1303_PCM1_SLOT15 (14<<4)
+#define SMA1303_PCM1_SLOT16 (15<<4)
+
+#define SMA1303_PCM2_SLOT_MASK (15<<0)
+#define SMA1303_PCM2_SLOT1 (0<<0)
+#define SMA1303_PCM2_SLOT2 (1<<0)
+#define SMA1303_PCM2_SLOT3 (2<<0)
+#define SMA1303_PCM2_SLOT4 (3<<0)
+#define SMA1303_PCM2_SLOT5 (4<<0)
+#define SMA1303_PCM2_SLOT6 (5<<0)
+#define SMA1303_PCM2_SLOT7 (6<<0)
+#define SMA1303_PCM2_SLOT8 (7<<0)
+#define SMA1303_PCM2_SLOT9 (8<<0)
+#define SMA1303_PCM2_SLOT10 (9<<0)
+#define SMA1303_PCM2_SLOT11 (10<<0)
+#define SMA1303_PCM2_SLOT12 (11<<0)
+#define SMA1303_PCM2_SLOT13 (12<<0)
+#define SMA1303_PCM2_SLOT14 (13<<0)
+#define SMA1303_PCM2_SLOT15 (14<<0)
+#define SMA1303_PCM2_SLOT16 (15<<0)
 
 /* OUTPUT CTRL : 0x09 */
-#define PORT_CONFIG_MASK (3<<5)
-#define INPUT_PORT_ONLY (0<<5)
-#define OUTPUT_PORT_ENABLE (2<<5)
+#define SMA1303_PORT_CONFIG_MASK (3<<5)
+#define SMA1303_INPUT_PORT_ONLY (0<<5)
+#define SMA1303_OUTPUT_PORT_ENABLE (2<<5)
 
-#define PORT_OUT_SEL_MASK (7<<0)
-#define OUT_SEL_DISABLE (0<<0)
-#define FORMAT_CONVERTER (1<<0)
-#define MIXER_OUTPUT (2<<0)
-#define SPEAKER_PATH (3<<0)
-#define POSTSCALER_OUTPUT (4<<0)
+#define SMA1303_PORT_OUT_SEL_MASK (7<<0)
+#define SMA1303_OUT_SEL_DISABLE (0<<0)
+#define SMA1303_FORMAT_CONVERTER (1<<0)
+#define SMA1303_MIXER_OUTPUT (2<<0)
+#define SMA1303_SPEAKER_PATH (3<<0)
+#define SMA1303_POSTSCALER_OUTPUT (4<<0)
 
 /* BST_TEST : 0x0B */
-#define BST_OFF_SLOPE_MASK (3<<6)
-#define BST_OFF_SLOPE_6_7ns (0<<6)
-#define BST_OFF_SLOPE_4_8ns (1<<6)
-#define BST_OFF_SLOPE_2_6ns (2<<6)
-#define BST_OFF_SLOPE_1_2ns (3<<6)
+#define SMA1303_BST_OFF_SLOPE_MASK (3<<6)
+#define SMA1303_BST_OFF_SLOPE_6_7ns (0<<6)
+#define SMA1303_BST_OFF_SLOPE_4_8ns (1<<6)
+#define SMA1303_BST_OFF_SLOPE_2_6ns (2<<6)
+#define SMA1303_BST_OFF_SLOPE_1_2ns (3<<6)
 
-#define OCP_TEST_MASK (1<<5)
-#define OCP_NORMAL_MODE (0<<5)
-#define OCP_TEST_MODE (1<<5)
+#define SMA1303_OCP_TEST_MASK (1<<5)
+#define SMA1303_OCP_NORMAL_MODE (0<<5)
+#define SMA1303_OCP_TEST_MODE (1<<5)
 
-#define BST_FAST_LEBN_MASK (1<<4)
-#define BST_SHORT_LEB (0<<4)
-#define BST_LONG_LEB (1<<4)
+#define SMA1303_BST_FAST_LEBN_MASK (1<<4)
+#define SMA1303_BST_SHORT_LEB (0<<4)
+#define SMA1303_BST_LONG_LEB (1<<4)
 
-#define HIGH_PGAIN_MASK (1<<3)
-#define NORMAL_P_GAIN (0<<3)
-#define HIGH_P_GAIN (1<<3)
+#define SMA1303_HIGH_PGAIN_MASK (1<<3)
+#define SMA1303_NORMAL_P_GAIN (0<<3)
+#define SMA1303_HIGH_P_GAIN (1<<3)
 
-#define VCOMP_MASK (1<<2)
-#define VCOMP_NORMAL_MODE (0<<2)
-#define VCOMP_V_MON_MODE (1<<2)
+#define SMA1303_VCOMP_MASK (1<<2)
+#define SMA1303_VCOMP_NORMAL_MODE (0<<2)
+#define SMA1303_VCOMP_V_MON_MODE (1<<2)
 
-#define PMOS_ON_MASK (1<<1)
-#define PMOS_NORMAL_MODE (0<<1)
-#define PMOS_TEST_MODE (1<<1)
+#define SMA1303_PMOS_ON_MASK (1<<1)
+#define SMA1303_PMOS_NORMAL_MODE (0<<1)
+#define SMA1303_PMOS_TEST_MODE (1<<1)
 
-#define NMOS_ON_MASK (1<<0)
-#define NMOS_NORMAL_MODE (0<<0)
-#define NMOS_TEST_MODE (1<<0)
+#define SMA1303_NMOS_ON_MASK (1<<0)
+#define SMA1303_NMOS_NORMAL_MODE (0<<0)
+#define SMA1303_NMOS_TEST_MODE (1<<0)
 
 /* BST_TEST1 : 0x0C */
-#define SET_OCP_H_MASK (3<<6)
-#define HIGH_OCP_4_5_LVL (0<<6)
-#define HIGH_OCP_3_2_LVL (1<<6)
-#define HIGH_OCP_2_1_LVL (2<<6)
-#define HIGH_OCP_0_9_LVL (3<<6)
+#define SMA1303_SET_OCP_H_MASK (3<<6)
+#define SMA1303_HIGH_OCP_4_5_LVL (0<<6)
+#define SMA1303_HIGH_OCP_3_2_LVL (1<<6)
+#define SMA1303_HIGH_OCP_2_1_LVL (2<<6)
+#define SMA1303_HIGH_OCP_0_9_LVL (3<<6)
 
-#define OCL_TEST_MASK (1<<5)
-#define OCL_NORMAL_MODE (0<<5)
-#define OCL_TEST_MODE (1<<5)
+#define SMA1303_OCL_TEST_MASK (1<<5)
+#define SMA1303_OCL_NORMAL_MODE (0<<5)
+#define SMA1303_OCL_TEST_MODE (1<<5)
 
-#define LOOP_CHECK_MASK (1<<4)
-#define BST_LOOP_NORMAL_MODE (0<<4)
-#define BST_LOOP_CHECK_MODE (1<<4)
+#define SMA1303_LOOP_CHECK_MASK (1<<4)
+#define SMA1303_BST_LOOP_NORMAL_MODE (0<<4)
+#define SMA1303_BST_LOOP_CHECK_MODE (1<<4)
 
-#define EN_SH_PRT_MASK (1<<3)
-#define EN_SH_PRT_DISABLE (0<<3)
-#define EN_SH_PRT_ENABLE (1<<3)
+#define SMA1303_EN_SH_PRT_MASK (1<<3)
+#define SMA1303_EN_SH_PRT_DISABLE (0<<3)
+#define SMA1303_EN_SH_PRT_ENABLE (1<<3)
 
 /* SPK_TEST : 0x0D */
-#define VREF_MON_MASK (1<<3)
-#define VREF_NORMAL_MODE (0<<3)
-#define VREF_V_MON_MODE (1<<3)
+#define SMA1303_VREF_MON_MASK (1<<3)
+#define SMA1303_VREF_NORMAL_MODE (0<<3)
+#define SMA1303_VREF_V_MON_MODE (1<<3)
 
-#define SPK_OCP_DLYN_MASK (1<<2)
-#define SPK_OCP_LONG_DELAY (0<<2)
-#define SPK_OCP_NORMAL (1<<2)
+#define SMA1303_SPK_OCP_DLYN_MASK (1<<2)
+#define SMA1303_SPK_OCP_LONG_DELAY (0<<2)
+#define SMA1303_SPK_OCP_NORMAL (1<<2)
 
-#define SPK_OFF_SLOPE_MASK (3<<0)
-#define SPK_OFF_SLOPE_SLOW (0<<0)
-#define SPK_OFF_SLOPE_FAST (3<<0)
+#define SMA1303_SPK_OFF_SLOPE_MASK (3<<0)
+#define SMA1303_SPK_OFF_SLOPE_SLOW (0<<0)
+#define SMA1303_SPK_OFF_SLOPE_FAST (3<<0)
 
 /* MUTE_VOL_CTRL : 0x0E */
-#define VOL_SLOPE_MASK (3<<6)
-#define VOL_SLOPE_OFF (0<<6)
-#define VOL_SLOPE_SLOW (1<<6)
-#define VOL_SLOPE_MID (2<<6)
-#define VOL_SLOPE_FAST (3<<6)
-
-#define MUTE_SLOPE_MASK (3<<4)
-#define MUTE_SLOPE_OFF (0<<4)
-#define MUTE_SLOPE_SLOW (1<<4)
-#define MUTE_SLOPE_MID (2<<4)
-#define MUTE_SLOPE_FAST (3<<4)
-
-#define SPK_MUTE_MASK (1<<0)
-#define SPK_UNMUTE (0<<0)
-#define SPK_MUTE (1<<0)
+#define SMA1303_VOL_SLOPE_MASK (3<<6)
+#define SMA1303_VOL_SLOPE_OFF (0<<6)
+#define SMA1303_VOL_SLOPE_SLOW (1<<6)
+#define SMA1303_VOL_SLOPE_MID (2<<6)
+#define SMA1303_VOL_SLOPE_FAST (3<<6)
+
+#define SMA1303_MUTE_SLOPE_MASK (3<<4)
+#define SMA1303_MUTE_SLOPE_OFF (0<<4)
+#define SMA1303_MUTE_SLOPE_SLOW (1<<4)
+#define SMA1303_MUTE_SLOPE_MID (2<<4)
+#define SMA1303_MUTE_SLOPE_FAST (3<<4)
+
+#define SMA1303_SPK_MUTE_MASK (1<<0)
+#define SMA1303_SPK_UNMUTE (0<<0)
+#define SMA1303_SPK_MUTE (1<<0)
 
 /* SYSTEM_CTRL1 :0x10 */
-#define SPK_MODE_MASK (7<<2)
-#define SPK_OFF (0<<2)
-#define SPK_MONO (1<<2)
-#define SPK_STEREO (4<<2)
+#define SMA1303_SPK_MODE_MASK (7<<2)
+#define SMA1303_SPK_OFF (0<<2)
+#define SMA1303_SPK_MONO (1<<2)
+#define SMA1303_SPK_STEREO (4<<2)
 
 /* SYSTEM_CTRL2 : 0x11 */
-#define SPK_BS_MASK (1<<6)
-#define SPK_BS_BYP (0<<6)
-#define SPK_BS_EN (1<<6)
-#define SPK_LIM_MASK (1<<5)
-#define SPK_LIM_BYP (0<<5)
-#define SPK_LIM_EN (1<<5)
+#define SMA1303_SPK_BS_MASK (1<<6)
+#define SMA1303_SPK_BS_BYP (0<<6)
+#define SMA1303_SPK_BS_EN (1<<6)
+#define SMA1303_SPK_LIM_MASK (1<<5)
+#define SMA1303_SPK_LIM_BYP (0<<5)
+#define SMA1303_SPK_LIM_EN (1<<5)
 
-#define LR_DATA_SW_MASK (1<<4)
-#define LR_DATA_SW_NORMAL (0<<4)
-#define LR_DATA_SW_SWAP (1<<4)
+#define SMA1303_LR_DATA_SW_MASK (1<<4)
+#define SMA1303_LR_DATA_SW_NORMAL (0<<4)
+#define SMA1303_LR_DATA_SW_SWAP (1<<4)
 
-#define MONOMIX_MASK (1<<0)
-#define MONOMIX_OFF (0<<0)
-#define MONOMIX_ON (1<<0)
+#define SMA1303_MONOMIX_MASK (1<<0)
+#define SMA1303_MONOMIX_OFF (0<<0)
+#define SMA1303_MONOMIX_ON (1<<0)
 
 /* SYSTEM_CTRL3 : 0x12 */
-#define INPUT_MASK (3<<6)
-#define INPUT_0_DB (0<<6)
-#define INPUT_M6_DB (1<<6)
-#define INPUT_M12_DB (2<<6)
-#define INPUT_INFI_DB (3<<6)
-#define INPUT_R_MASK (3<<4)
-#define INPUT_R_0_DB (0<<4)
-#define INPUT_R_M6_DB (1<<4)
-#define INPUT_R_M12_DB (2<<4)
-#define INPUT_R_INFI_DB (3<<4)
+#define SMA1303_INPUT_MASK (3<<6)
+#define SMA1303_INPUT_0_DB (0<<6)
+#define SMA1303_INPUT_M6_DB (1<<6)
+#define SMA1303_INPUT_M12_DB (2<<6)
+#define SMA1303_INPUT_INFI_DB (3<<6)
+#define SMA1303_INPUT_R_MASK (3<<4)
+#define SMA1303_INPUT_R_0_DB (0<<4)
+#define SMA1303_INPUT_R_M6_DB (1<<4)
+#define SMA1303_INPUT_R_M12_DB (2<<4)
+#define SMA1303_INPUT_R_INFI_DB (3<<4)
 
 /* Modulator : 0x14 */
-#define SPK_HYSFB_MASK (3<<6)
-#define HYSFB_625K (0<<6)
-#define HYSFB_414K (1<<6)
-#define HYSFB_297K (2<<6)
-#define HYSFB_226K (3<<6)
-#define SPK_BDELAY_MASK (63<<0)
+#define SMA1303_SPK_HYSFB_MASK (3<<6)
+#define SMA1303_HYSFB_625K (0<<6)
+#define SMA1303_HYSFB_414K (1<<6)
+#define SMA1303_HYSFB_297K (2<<6)
+#define SMA1303_HYSFB_226K (3<<6)
+#define SMA1303_SPK_BDELAY_MASK (63<<0)
 
 /* SDM CONTROL : 0x33 */
-#define SDM_Q_SEL_MASK (1<<2)
-#define QUART_SEL_1_DIV_4 (0<<2)
-#define QUART_SEL_1_DIV_8 (1<<2)
+#define SMA1303_SDM_Q_SEL_MASK (1<<2)
+#define SMA1303_QUART_SEL_1_DIV_4 (0<<2)
+#define SMA1303_QUART_SEL_1_DIV_8 (1<<2)
 
 /* OTP_DATA1 : 0x34 */
-#define OTP_LVL_MASK (1<<5)
-#define OTP_LVL_NORMAL (0<<5)
-#define OTP_LVL_LOW (1<<5)
+#define SMA1303_OTP_LVL_MASK (1<<5)
+#define SMA1303_OTP_LVL_NORMAL (0<<5)
+#define SMA1303_OTP_LVL_LOW (1<<5)
 
 /* PROTECTION : 0x36 */
-#define EDGE_DIS_MASK (1<<7)
-#define EDGE_DIS_ENABLE (0<<7)
-#define EDGE_DIS_DISABLE (1<<7)
+#define SMA1303_EDGE_DIS_MASK (1<<7)
+#define SMA1303_EDGE_DIS_ENABLE (0<<7)
+#define SMA1303_EDGE_DIS_DISABLE (1<<7)
 
-#define SPK_OCP_DIS_MASK (1<<3)
-#define SPK_OCP_ENABLE (0<<3)
-#define SPK_OCP_DISABLE (1<<3)
+#define SMA1303_SPK_OCP_DIS_MASK (1<<3)
+#define SMA1303_SPK_OCP_ENABLE (0<<3)
+#define SMA1303_SPK_OCP_DISABLE (1<<3)
 
-#define OCP_MODE_MASK (1<<2)
-#define AUTO_RECOVER (0<<2)
-#define SHUT_DOWN_PERMANENT (1<<2)
+#define SMA1303_OCP_MODE_MASK (1<<2)
+#define SMA1303_AUTO_RECOVER (0<<2)
+#define SMA1303_SHUT_DOWN_PERMANENT (1<<2)
 
-#define OTP_MODE_MASK (3<<0)
-#define OTP_MODE_DISABLE (0<<0)
-#define IG_THR1_SHUT_THR2 (1<<0)
-#define REC_THR1_SHUT_THR2 (2<<0)
-#define SHUT_THR1_SHUT_THR2 (3<<0)
+#define SMA1303_OTP_MODE_MASK (3<<0)
+#define SMA1303_OTP_MODE_DISABLE (0<<0)
+#define SMA1303_IG_THR1_SHUT_THR2 (1<<0)
+#define SMA1303_REC_THR1_SHUT_THR2 (2<<0)
+#define SMA1303_SHUT_THR1_SHUT_THR2 (3<<0)
 
 /* TEST2 : 0x3C */
-#define SPK_HSDM_BP_MASK (1<<4)
-#define SPK_HSDM_ENABLE (0<<4)
-#define SPK_HSDM_BYPASS (1<<4)
+#define SMA1303_SPK_HSDM_BP_MASK (1<<4)
+#define SMA1303_SPK_HSDM_ENABLE (0<<4)
+#define SMA1303_SPK_HSDM_BYPASS (1<<4)
 
-#define SDM_SYNC_DIS_MASK (1<<5)
-#define SDM_SYNC_NORMAL (0<<5)
-#define SDM_SYNC_DISABLE (1<<5)
+#define SMA1303_SDM_SYNC_DIS_MASK (1<<5)
+#define SMA1303_SDM_SYNC_NORMAL (0<<5)
+#define SMA1303_SDM_SYNC_DISABLE (1<<5)
 
 /* ATEST2 : 0x3F */
-#define SPK_OUT_FREQ_MASK (1<<2)
-#define SPK_OUT_FREQ_360K (0<<2)
-#define SPK_OUT_FREQ_410K (1<<2)
+#define SMA1303_SPK_OUT_FREQ_MASK (1<<2)
+#define SMA1303_SPK_OUT_FREQ_360K (0<<2)
+#define SMA1303_SPK_OUT_FREQ_410K (1<<2)
 
-#define LOW_POWER_MODE_MASK (1<<3)
-#define LOW_POWER_MODE_DISABLE (0<<3)
-#define LOW_POWER_MODE_ENABLE (1<<3)
+#define SMA1303_LOW_POWER_MODE_MASK (1<<3)
+#define SMA1303_LOW_POWER_MODE_DISABLE (0<<3)
+#define SMA1303_LOW_POWER_MODE_ENABLE (1<<3)
 
-#define THERMAL_ADJUST_MASK (3<<5)
-#define THERMAL_150_110 (0<<5)
-#define THERMAL_160_120 (1<<5)
-#define THERMAL_140_100 (2<<5)
+#define SMA1303_THERMAL_ADJUST_MASK (3<<5)
+#define SMA1303_THERMAL_150_110 (0<<5)
+#define SMA1303_THERMAL_160_120 (1<<5)
+#define SMA1303_THERMAL_140_100 (2<<5)
 
-#define FAST_OFF_DRIVE_SPK_MASK (1<<0)
-#define FAST_OFF_DRIVE_SPK_DISABLE (0<<0)
-#define FAST_OFF_DRIVE_SPK_ENABLE (1<<0)
+#define SMA1303_FAST_OFF_DRIVE_SPK_MASK (1<<0)
+#define SMA1303_FAST_OFF_DRIVE_SPK_DISABLE (0<<0)
+#define SMA1303_FAST_OFF_DRIVE_SPK_ENABLE (1<<0)
 
 /* PLL_CTRL : 0x8E */
-#define TRM_LVL_MASK (1<<4)
-#define TRM_LVL_NORMAL (0<<4)
-#define TRM_LVL_LOW (1<<4)
+#define SMA1303_TRM_LVL_MASK (1<<4)
+#define SMA1303_TRM_LVL_NORMAL (0<<4)
+#define SMA1303_TRM_LVL_LOW (1<<4)
 
-#define LOW_OCL_MODE_MASK (1<<3)
-#define LOW_OCL_MODE (0<<3)
-#define NORMAL_OCL_MODE (1<<3)
+#define SMA1303_LOW_OCL_MODE_MASK (1<<3)
+#define SMA1303_LOW_OCL_MODE (0<<3)
+#define SMA1303_NORMAL_OCL_MODE (1<<3)
 
-#define PLL_PD2_MASK (7<<0)
-#define PLL_PD2 (7<<0)
-#define PLL_OPERATION2 (0<<0)
+#define SMA1303_PLL_PD2_MASK (7<<0)
+#define SMA1303_PLL_PD2 (7<<0)
+#define SMA1303_PLL_OPERATION2 (0<<0)
 
 /* POSTSCALER : 0x90 */
-#define BYP_POST_MASK (1<<0)
-#define EN_POST_SCALER (0<<0)
-#define BYP_POST_SCALER (1<<0)
+#define SMA1303_BYP_POST_MASK (1<<0)
+#define SMA1303_EN_POST_SCALER (0<<0)
+#define SMA1303_BYP_POST_SCALER (1<<0)
 
 /* FDPEC CONTROL : 0x92 */
-#define FLT_VDD_GAIN_MASK (15<<4)
-#define FLT_VDD_GAIN_2P40 (0<<4)
-#define FLT_VDD_GAIN_2P45 (1<<4)
-#define FLT_VDD_GAIN_2P50 (2<<4)
-#define FLT_VDD_GAIN_2P55 (3<<4)
-#define FLT_VDD_GAIN_2P60 (4<<4)
-#define FLT_VDD_GAIN_2P65 (5<<4)
-#define FLT_VDD_GAIN_2P70 (6<<4)
-#define FLT_VDD_GAIN_2P75 (7<<4)
-#define FLT_VDD_GAIN_2P80 (8<<4)
-#define FLT_VDD_GAIN_2P85 (9<<4)
-#define FLT_VDD_GAIN_2P90 (10<<4)
-#define FLT_VDD_GAIN_2P95 (11<<4)
-#define FLT_VDD_GAIN_3P00 (12<<4)
-#define FLT_VDD_GAIN_3P05 (13<<4)
-#define FLT_VDD_GAIN_3P10 (14<<4)
-#define FLT_VDD_GAIN_3P15 (15<<4)
-
-#define DIS_FCHG_MASK (1<<2)
-#define EN_FAST_CHARGE (0<<2)
-#define DIS_FAST_CHARGE (1<<2)
+#define SMA1303_FLT_VDD_GAIN_MASK (15<<4)
+#define SMA1303_FLT_VDD_GAIN_2P40 (0<<4)
+#define SMA1303_FLT_VDD_GAIN_2P45 (1<<4)
+#define SMA1303_FLT_VDD_GAIN_2P50 (2<<4)
+#define SMA1303_FLT_VDD_GAIN_2P55 (3<<4)
+#define SMA1303_FLT_VDD_GAIN_2P60 (4<<4)
+#define SMA1303_FLT_VDD_GAIN_2P65 (5<<4)
+#define SMA1303_FLT_VDD_GAIN_2P70 (6<<4)
+#define SMA1303_FLT_VDD_GAIN_2P75 (7<<4)
+#define SMA1303_FLT_VDD_GAIN_2P80 (8<<4)
+#define SMA1303_FLT_VDD_GAIN_2P85 (9<<4)
+#define SMA1303_FLT_VDD_GAIN_2P90 (10<<4)
+#define SMA1303_FLT_VDD_GAIN_2P95 (11<<4)
+#define SMA1303_FLT_VDD_GAIN_3P00 (12<<4)
+#define SMA1303_FLT_VDD_GAIN_3P05 (13<<4)
+#define SMA1303_FLT_VDD_GAIN_3P10 (14<<4)
+#define SMA1303_FLT_VDD_GAIN_3P15 (15<<4)
+
+#define SMA1303_DIS_FCHG_MASK (1<<2)
+#define SMA1303_EN_FAST_CHARGE (0<<2)
+#define SMA1303_DIS_FAST_CHARGE (1<<2)
 
 /* BOOST_CONTROL4 : 0x97 */
-#define TRM_VBST_MASK (7<<2)
-#define TRM_VBST_5P5 (0<<2)
-#define TRM_VBST_5P6 (1<<2)
-#define TRM_VBST_5P7 (2<<2)
-#define TRM_VBST_5P8 (3<<2)
-#define TRM_VBST_5P9 (4<<2)
-#define TRM_VBST_6P0 (5<<2)
-#define TRM_VBST_6P1 (6<<2)
-#define TRM_VBST_6P2 (7<<2)
+#define SMA1303_TRM_VBST_MASK (7<<2)
+#define SMA1303_TRM_VBST_5P5 (0<<2)
+#define SMA1303_TRM_VBST_5P6 (1<<2)
+#define SMA1303_TRM_VBST_5P7 (2<<2)
+#define SMA1303_TRM_VBST_5P8 (3<<2)
+#define SMA1303_TRM_VBST_5P9 (4<<2)
+#define SMA1303_TRM_VBST_6P0 (5<<2)
+#define SMA1303_TRM_VBST_6P1 (6<<2)
+#define SMA1303_TRM_VBST_6P2 (7<<2)
 
 /* TOP_MAN1 : 0xA2 */
-#define PLL_LOCK_SKIP_MASK (1<<7)
-#define PLL_LOCK_ENABLE (0<<7)
-#define PLL_LOCK_DISABLE (1<<7)
+#define SMA1303_PLL_LOCK_SKIP_MASK (1<<7)
+#define SMA1303_PLL_LOCK_ENABLE (0<<7)
+#define SMA1303_PLL_LOCK_DISABLE (1<<7)
 
-#define PLL_PD_MASK (1<<6)
-#define PLL_OPERATION (0<<6)
-#define PLL_PD (1<<6)
+#define SMA1303_PLL_PD_MASK (1<<6)
+#define SMA1303_PLL_OPERATION (0<<6)
+#define SMA1303_PLL_PD (1<<6)
 
-#define PLL_DIV_MASK (3<<4)
-#define PLL_OUT (0<<4)
-#define PLL_OUT_2 (1<<4)
-#define PLL_OUT_4 (2<<4)
-#define PLL_OUT_8 (3<<4)
+#define SMA1303_PLL_DIV_MASK (3<<4)
+#define SMA1303_PLL_OUT (0<<4)
+#define SMA1303_PLL_OUT_2 (1<<4)
+#define SMA1303_PLL_OUT_4 (2<<4)
+#define SMA1303_PLL_OUT_8 (3<<4)
 
-#define PLL_REF_CLK_MASK (1<<3)
-#define PLL_REF_CLK1 (0<<3)
-#define PLL_SCK (1<<3)
+#define SMA1303_PLL_REF_CLK_MASK (1<<3)
+#define SMA1303_PLL_REF_CLK1 (0<<3)
+#define SMA1303_PLL_SCK (1<<3)
 
-#define DAC_DN_CONV_MASK (1<<2)
-#define DAC_DN_CONV_DISABLE (0<<2)
-#define DAC_DN_CONV_ENABLE (1<<2)
+#define SMA1303_DAC_DN_CONV_MASK (1<<2)
+#define SMA1303_DAC_DN_CONV_DISABLE (0<<2)
+#define SMA1303_DAC_DN_CONV_ENABLE (1<<2)
 
-#define SDO_IO_MASK (1<<1)
-#define HIGH_Z_LRCK_H (0<<1)
-#define HIGH_Z_LRCK_L (1<<1)
+#define SMA1303_SDO_IO_MASK (1<<1)
+#define SMA1303_HIGH_Z_LRCK_H (0<<1)
+#define SMA1303_HIGH_Z_LRCK_L (1<<1)
 
-#define SDO_OUTPUT2_MASK (1<<0)
-#define SDO_NORMAL (0<<0)
-#define SDO_OUTPUT_ONLY (1<<0)
+#define SMA1303_SDO_OUTPUT2_MASK (1<<0)
+#define SMA1303_SDO_NORMAL (0<<0)
+#define SMA1303_SDO_OUTPUT_ONLY (1<<0)
 
 /* TOP_MAN2 : 0xA3 */
-#define MON_OSC_PLL_MASK (1<<7)
-#define PLL_SDO (0<<7)
-#define PLL_OSC (1<<7)
+#define SMA1303_MON_OSC_PLL_MASK (1<<7)
+#define SMA1303_PLL_SDO (0<<7)
+#define SMA1303_OSC_SDO (1<<7)
 
-#define TEST_CLKO_EN_MASK (1<<6)
-#define NORMAL_SDO (0<<6)
-#define CLK_OUT_SDO (1<<6)
+#define SMA1303_TEST_CLKO_EN_MASK (1<<6)
+#define SMA1303_NORMAL_SDO (0<<6)
+#define SMA1303_CLK_OUT_SDO (1<<6)
 
-#define SDO_OUTPUT_MASK (1<<3)
-#define NORMAL_OUT (0<<3)
-#define HIGH_Z_OUT (1<<3)
+#define SMA1303_SDO_OUTPUT_MASK (1<<3)
+#define SMA1303_NORMAL_OUT (0<<3)
+#define SMA1303_HIGH_Z_OUT (1<<3)
 
-#define CLOCK_MON_MASK (1<<1)
-#define CLOCK_MON (0<<1)
-#define CLOCK_NOT_MON (1<<1)
+#define SMA1303_CLOCK_MON_MASK (1<<1)
+#define SMA1303_CLOCK_MON (0<<1)
+#define SMA1303_CLOCK_NOT_MON (1<<1)
 
-#define OSC_PD_MASK (1<<0)
-#define NORMAL_OPERATION_OSC (0<<0)
-#define POWER_DOWN_OSC (1<<0)
+#define SMA1303_OSC_PD_MASK (1<<0)
+#define SMA1303_NORMAL_OPERATION_OSC (0<<0)
+#define SMA1303_POWER_DOWN_OSC (1<<0)
 
 /* TOP_MAN3 0xA4 */
-#define O_FORMAT_MASK (7<<5)
-#define O_FMT_LJ (1<<5)
-#define O_FMT_I2S (2<<5)
-#define O_FMT_TDM (4<<5)
+#define SMA1303_O_FORMAT_MASK (7<<5)
+#define SMA1303_O_FMT_LJ (1<<5)
+#define SMA1303_O_FMT_I2S (2<<5)
+#define SMA1303_O_FMT_TDM (4<<5)
 
-#define SCK_RATE_MASK (1<<3)
-#define SCK_64FS (0<<3)
-#define SCK_32FS (2<<3)
+#define SMA1303_SCK_RATE_MASK (1<<3)
+#define SMA1303_SCK_64FS (0<<3)
+#define SMA1303_SCK_32FS (2<<3)
 
-#define LRCK_POL_MASK (1<<0)
-#define L_VALID (0<<0)
-#define R_VALID (1<<0)
+#define SMA1303_LRCK_POL_MASK (1<<0)
+#define SMA1303_L_VALID (0<<0)
+#define SMA1303_R_VALID (1<<0)
 
 /* TDM1 FORMAT : 0xA5 */
-#define TDM_CLK_POL_MASK (1<<7)
-#define TDM_CLK_POL_RISE (0<<7)
-#define TDM_CLK_POL_FALL (1<<7)
-
-#define TDM_TX_MODE_MASK (1<<6)
-#define TDM_TX_MONO (0<<6)
-#define TDM_TX_STEREO (1<<6)
-
-#define TDM_SLOT1_RX_POS_MASK (7<<3)
-#define TDM_SLOT1_RX_POS_0 (0<<3)
-#define TDM_SLOT1_RX_POS_1 (1<<3)
-#define TDM_SLOT1_RX_POS_2 (2<<3)
-#define TDM_SLOT1_RX_POS_3 (3<<3)
-#define TDM_SLOT1_RX_POS_4 (4<<3)
-#define TDM_SLOT1_RX_POS_5 (5<<3)
-#define TDM_SLOT1_RX_POS_6 (6<<3)
-#define TDM_SLOT1_RX_POS_7 (7<<3)
-
-#define TDM_SLOT2_RX_POS_MASK (7<<0)
-#define TDM_SLOT2_RX_POS_0 (0<<0)
-#define TDM_SLOT2_RX_POS_1 (1<<0)
-#define TDM_SLOT2_RX_POS_2 (2<<0)
-#define TDM_SLOT2_RX_POS_3 (3<<0)
-#define TDM_SLOT2_RX_POS_4 (4<<0)
-#define TDM_SLOT2_RX_POS_5 (5<<0)
-#define TDM_SLOT2_RX_POS_6 (6<<0)
-#define TDM_SLOT2_RX_POS_7 (7<<0)
+#define SMA1303_TDM_CLK_POL_MASK (1<<7)
+#define SMA1303_TDM_CLK_POL_RISE (0<<7)
+#define SMA1303_TDM_CLK_POL_FALL (1<<7)
+
+#define SMA1303_TDM_TX_MODE_MASK (1<<6)
+#define SMA1303_TDM_TX_MONO (0<<6)
+#define SMA1303_TDM_TX_STEREO (1<<6)
+
+#define SMA1303_TDM_SLOT1_RX_POS_MASK (7<<3)
+#define SMA1303_TDM_SLOT1_RX_POS_0 (0<<3)
+#define SMA1303_TDM_SLOT1_RX_POS_1 (1<<3)
+#define SMA1303_TDM_SLOT1_RX_POS_2 (2<<3)
+#define SMA1303_TDM_SLOT1_RX_POS_3 (3<<3)
+#define SMA1303_TDM_SLOT1_RX_POS_4 (4<<3)
+#define SMA1303_TDM_SLOT1_RX_POS_5 (5<<3)
+#define SMA1303_TDM_SLOT1_RX_POS_6 (6<<3)
+#define SMA1303_TDM_SLOT1_RX_POS_7 (7<<3)
+
+#define SMA1303_TDM_SLOT2_RX_POS_MASK (7<<0)
+#define SMA1303_TDM_SLOT2_RX_POS_0 (0<<0)
+#define SMA1303_TDM_SLOT2_RX_POS_1 (1<<0)
+#define SMA1303_TDM_SLOT2_RX_POS_2 (2<<0)
+#define SMA1303_TDM_SLOT2_RX_POS_3 (3<<0)
+#define SMA1303_TDM_SLOT2_RX_POS_4 (4<<0)
+#define SMA1303_TDM_SLOT2_RX_POS_5 (5<<0)
+#define SMA1303_TDM_SLOT2_RX_POS_6 (6<<0)
+#define SMA1303_TDM_SLOT2_RX_POS_7 (7<<0)
 
 /* TDM2 FORMAT : 0xA6 */
-#define TDM_DL_MASK (1<<7)
-#define TDM_DL_16 (0<<7)
-#define TDM_DL_32 (1<<7)
-
-#define TDM_N_SLOT_MASK (1<<6)
-#define TDM_N_SLOT_4 (0<<6)
-#define TDM_N_SLOT_8 (1<<6)
-
-#define TDM_SLOT1_TX_POS_MASK (7<<3)
-#define TDM_SLOT1_TX_POS_0 (0<<3)
-#define TDM_SLOT1_TX_POS_1 (1<<3)
-#define TDM_SLOT1_TX_POS_2 (2<<3)
-#define TDM_SLOT1_TX_POS_3 (3<<3)
-#define TDM_SLOT1_TX_POS_4 (4<<3)
-#define TDM_SLOT1_TX_POS_5 (5<<3)
-#define TDM_SLOT1_TX_POS_6 (6<<3)
-#define TDM_SLOT1_TX_POS_7 (7<<3)
-
-#define TDM_SLOT2_TX_POS_MASK (7<<0)
-#define TDM_SLOT2_TX_POS_0 (0<<0)
-#define TDM_SLOT2_TX_POS_1 (1<<0)
-#define TDM_SLOT2_TX_POS_2 (2<<0)
-#define TDM_SLOT2_TX_POS_3 (3<<0)
-#define TDM_SLOT2_TX_POS_4 (4<<0)
-#define TDM_SLOT2_TX_POS_5 (5<<0)
-#define TDM_SLOT2_TX_POS_6 (6<<0)
-#define TDM_SLOT2_TX_POS_7 (7<<0)
+#define SMA1303_TDM_DL_MASK (1<<7)
+#define SMA1303_TDM_DL_16 (0<<7)
+#define SMA1303_TDM_DL_32 (1<<7)
+
+#define SMA1303_TDM_N_SLOT_MASK (1<<6)
+#define SMA1303_TDM_N_SLOT_4 (0<<6)
+#define SMA1303_TDM_N_SLOT_8 (1<<6)
+
+#define SMA1303_TDM_SLOT1_TX_POS_MASK (7<<3)
+#define SMA1303_TDM_SLOT1_TX_POS_0 (0<<3)
+#define SMA1303_TDM_SLOT1_TX_POS_1 (1<<3)
+#define SMA1303_TDM_SLOT1_TX_POS_2 (2<<3)
+#define SMA1303_TDM_SLOT1_TX_POS_3 (3<<3)
+#define SMA1303_TDM_SLOT1_TX_POS_4 (4<<3)
+#define SMA1303_TDM_SLOT1_TX_POS_5 (5<<3)
+#define SMA1303_TDM_SLOT1_TX_POS_6 (6<<3)
+#define SMA1303_TDM_SLOT1_TX_POS_7 (7<<3)
+
+#define SMA1303_TDM_SLOT2_TX_POS_MASK (7<<0)
+#define SMA1303_TDM_SLOT2_TX_POS_0 (0<<0)
+#define SMA1303_TDM_SLOT2_TX_POS_1 (1<<0)
+#define SMA1303_TDM_SLOT2_TX_POS_2 (2<<0)
+#define SMA1303_TDM_SLOT2_TX_POS_3 (3<<0)
+#define SMA1303_TDM_SLOT2_TX_POS_4 (4<<0)
+#define SMA1303_TDM_SLOT2_TX_POS_5 (5<<0)
+#define SMA1303_TDM_SLOT2_TX_POS_6 (6<<0)
+#define SMA1303_TDM_SLOT2_TX_POS_7 (7<<0)
 
 /* STATUS1 : 0xFA */
-#define OT1_OK_STATUS (1<<7)
-#define OT2_OK_STATUS (1<<6)
+#define SMA1303_OT1_OK_STATUS (1<<7)
+#define SMA1303_OT2_OK_STATUS (1<<6)
 
 /* STATUS2 : 0xFB */
-#define OCP_SPK_STATUS (1<<5)
-#define OCP_BST_STATUS (1<<4)
-#define OTP_STAT_OK_0 (5<<1)
-#define OTP_STAT_OK_1 (2<<2)
+#define SMA1303_OCP_SPK_STATUS (1<<5)
+#define SMA1303_OCP_BST_STATUS (1<<4)
+#define SMA1303_OTP_STAT_OK_0 (5<<1)
+#define SMA1303_OTP_STAT_OK_1 (2<<2)
 
-#define CLK_MON_STATUS (1<<0)
+#define SMA1303_CLK_MON_STATUS (1<<0)
 
 /* DEVICE_INFO : 0xFF */
-#define DEVICE_ID (2<<3)
-#define UVLO_BST_STATUS (1<<2)
-#define REV_NUM_STATUS (3<<0)
-#define REV_NUM_TV0 (0<<0)
-#define REV_NUM_TV1 (1<<0)
+#define SMA1303_DEVICE_ID (2<<3)
+#define SMA1303_UVLO_BST_STATUS (1<<2)
+#define SMA1303_REV_NUM_STATUS (3<<0)
+#define SMA1303_REV_NUM_TV0 (0<<0)
+#define SMA1303_REV_NUM_TV1 (1<<0)
 
 #endif
-- 
2.30.2

