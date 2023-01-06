Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E34D365FD76
	for <lists+alsa-devel@lfdr.de>; Fri,  6 Jan 2023 10:19:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B3AC91411D;
	Fri,  6 Jan 2023 10:18:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B3AC91411D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1672996766;
	bh=80/tDextTrqDeTEgIRUNzmKh1Vykbj2Pk/ybzeQ+Ebk=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=tX/zKv3I1m2ZHxcigL8sEVwvLtn5nWdYfZp5Q9yRyNqLe1WMdP5s3yMw1YFfhqqKI
	 j6gUNNHqPF8u8UeuvNaAu7lDREOMZfGNJT3YnyfInKK53sbxzyArfBU/PBx9WsYxgS
	 vhCwqrUz6fz+x8fElPu4e2pnxO3o428dz3D9E9Ws=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 55F49F805B3;
	Fri,  6 Jan 2023 10:16:19 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CE418F805AD; Fri,  6 Jan 2023 10:16:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
 RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from KOR01-SL2-obe.outbound.protection.outlook.com
 (mail-sl2kor01on2059.outbound.protection.outlook.com [40.107.129.59])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DBEB7F8055B
 for <alsa-devel@alsa-project.org>; Fri,  6 Jan 2023 10:16:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DBEB7F8055B
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AW0rndZGom95Hu/fnsvQizZ5HMkq4HKoZ5iKw1+I50Fyba9J15Hf34fiWgQMy3JViGZqeUCAYJA2F3WG9VuPjOmr6whzNZyrldwIjlV2qA0Sh6Nl8BI8EoW9DB4ZQ/j7ps/eRKTF+45tMzNj8LnqFQ7/dmp+M19Rx4aCxny60EJ/QrkGBEgn7+zeayie81u9eAHARUtOMARZXS6nSgTTV/T9XT0PWQe+xmj4U/Y+63GXwmka4dCxrLn+CDOoSQorjkgg608LE3V4MMWv3UzzvKYdfhBvDoCZeXcKLhQq1N4Q4Ii2FlCVfaWtPkUYY/4sItxF9MLtehCZYcCQQAVUJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y9X6PNsBEn6jTGmw853j7067dblU7AKTUHfuz7jqFAM=;
 b=VDLejRtxWJ+6L2QcBC58tunDa2a19Nith9AXqNfwf90/uSSz1ekyQhA9g72uxdE+5PByVRNBpcyJn/iN2jCXv403qNahDgH8dlpR5I7rV4aRXla+py0fu/35lYOHaSIV/Yq9qXpgS6tApt0V5ar3nTFkzJfGbAlGHeReDfK4rb+8zhAl3ocqXxHYhQ+G7fK/WZD/0Z7+ki/H2juvqEjHoJd+gMpZrjDxvEb2t71ciOJLk4sroSJLnnkLLIps8rHvDMn+q1vUK+wzdescErzgidzEgJRAfSEhRvWCLgE0llCaEvIPLLpGjjbMBTVEj+43VmSoPQUcjCD2yC74RceTbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=irondevice.com; dmarc=pass action=none
 header.from=irondevice.com; dkim=pass header.d=irondevice.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=irondevice.com;
Received: from SLXP216MB0077.KORP216.PROD.OUTLOOK.COM (2603:1096:100:7::23) by
 PS2P216MB1300.KORP216.PROD.OUTLOOK.COM (2603:1096:301:98::11) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5944.19; Fri, 6 Jan 2023 09:15:58 +0000
Received: from SLXP216MB0077.KORP216.PROD.OUTLOOK.COM
 ([fe80::3d9:7f82:fa73:e727]) by SLXP216MB0077.KORP216.PROD.OUTLOOK.COM
 ([fe80::3d9:7f82:fa73:e727%7]) with mapi id 15.20.5944.019; Fri, 6 Jan 2023
 09:15:58 +0000
From: Kiseok Jo <kiseok.jo@irondevice.com>
To: Mark Brown <broonie@kernel.org>
Subject: [PATCH 06/14] Use the prefixs all definitions
Date: Fri,  6 Jan 2023 18:15:35 +0900
Message-Id: <20230106091543.2440-7-kiseok.jo@irondevice.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230106091543.2440-1-kiseok.jo@irondevice.com>
References: <20230106091543.2440-1-kiseok.jo@irondevice.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SL2PR01CA0017.apcprd01.prod.exchangelabs.com
 (2603:1096:100:41::29) To SLXP216MB0077.KORP216.PROD.OUTLOOK.COM
 (2603:1096:100:7::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SLXP216MB0077:EE_|PS2P216MB1300:EE_
X-MS-Office365-Filtering-Correlation-Id: 05acb0e1-87e2-47c8-c3f6-08daefc69f01
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +zyaM5c7vqZ86CH9/fHK+h2Xa8s6AsDp6GGnCXqy0AbzEG0MJdv22nt/Jxf/2kxqtzfrxiFcmAgC3CyXe8vN05vg2f9+bH4o8JQrQ9AKViFz/JRvRxZ0WEtdmheXyC7atbLVBWjfR85BXsK7jLuw1LRt2dGMaphgPFguIVMn8aT3KboDOmNgRBVhrkYNSONRE3sqcJSxGfQAOLjejZTPUoGpZwDWS5NTcP/qrivv/Cn3qDRQQVaJOHDjCLBVfii733Vk3l8ybAD+5MtbkSsiGP7HCWLcJ43LlmZ5s4n4fvtNk74XkmjwO2wc6/uX/uluGxM/2A9phqdX2kbHHrUhinJjPDnlXBFhhAHXUHhl0xG8kIO/ET3DBkt/f5nt3APPT01KSNVfDCEQBXgLrm13D7y+avFivYiFU1UaB+uSH/u+5rzZ1BGrJysA9q+amNy/A0i9nBBqIvGefrC5i5LRNHMsQDi2PmlqCmNwo1w6IPUJjYRUvOKc6n8VOgA7PO9WjPXDE10Z7+d2SueSwLJOX0VF+lUo8eXa7z0zB2ZB7iSXjBZfbGxUpfVTFtSv5M0TuTCzsk7hb03+4Mu2cA1utpGtAzT6wGZQ23lfVvsVSTa18lE+7bZ3g/UxXtqR01dD6+35YhTwmNNakfRCgDEZnLNtFeMfq4/wUlaSx2VG1SEm1QLfe+XeHvGqkYquCCUIAMYFg9/l/i6xTfFH4ABPTQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SLXP216MB0077.KORP216.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230022)(366004)(39840400004)(396003)(376002)(136003)(346002)(451199015)(8936002)(2906002)(5660300002)(30864003)(44832011)(8676002)(41300700001)(4326008)(54906003)(6916009)(66476007)(66946007)(52116002)(66556008)(316002)(6486002)(478600001)(83380400001)(26005)(186003)(6512007)(6666004)(6506007)(2616005)(38350700002)(1076003)(38100700002)(86362001)(36756003)(2004002)(579004)(559001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?wowHWD/dBJTxmeW5vXxoa3fMN0tubCr/Ww2QLioTVFhJhgvAC5EVtSIIpwlz?=
 =?us-ascii?Q?5NEOF7HKA3198braMpiha0ldqIpphl3yhm28vrEs9qmk1LWtDxk7wYCY6u4R?=
 =?us-ascii?Q?+tPJqR9dmNqf7kUS55uzVJdQy9LeWRpgIGzCa30VTK+BBxq7BHMhqdLbJE9i?=
 =?us-ascii?Q?yPujySxc7ageegMa0K+H/5fR9LqBt5p3jqNNipCSL8J6Z5o8ASMBmWCRTbUu?=
 =?us-ascii?Q?VkHFDcNDQymiBDz7Af0fl11irFvTImaHHrsewQfQ68MmqgBEQSVhhf+ZNqcE?=
 =?us-ascii?Q?oTVytF8McX0wmTMcneK2e7TWmrF7F+LeR6CduKLu3GQ67lnkL8rYFh/9MqIl?=
 =?us-ascii?Q?4ibDbqK3SVfUeBniHWPxg+IKwYEPF4lfo7eZNLWU4yyx8Oo8y/3aLPU5t34W?=
 =?us-ascii?Q?cGm8df8BVQyEb0mUF2TgClzxHc0BMEzCNUAaBVDVFDjJiL/yz5v6kfeGHeOc?=
 =?us-ascii?Q?uFfsHIN1R8o0wrSxTgsG3XxR2y/L3pipa0Ll+aksy2rPOHZiKjkiA03QvTSJ?=
 =?us-ascii?Q?DmZ7L7uafImBz3HTC+GIL936gOdlA4kkXuvSazvOWzhLabxMubhkuta6H7qY?=
 =?us-ascii?Q?0UE8Qoa5zUiAV9IX0FaeGA8KiJGov2Qr5e5JHal8HHsuQP05tgDg6g09fUqi?=
 =?us-ascii?Q?dBIPak2s3ZC3A4+ASV2EFA7LWZn3hYXeNDiiK8+Am41ZzyPXY/FPi7HXw5eE?=
 =?us-ascii?Q?p8OANcz8/S0BaXGOSTQiDH8uhz8hBvSob9/EW5dxwtzJh0Pdui7cwR6Hh0Nf?=
 =?us-ascii?Q?4t4AyXubWy35mrjMhAVwHkuk4KkV1m11Hy6NPgvYWTuChsuVQUWKIFsM9/A5?=
 =?us-ascii?Q?ByVQ1M9ZYXHcYHcnYmBDhnqoMTKjmYT9tO1q0ZNJUcAtiISp0hxxvX23KNRk?=
 =?us-ascii?Q?9bMBRETGn76hdMawJFjj9+V1OS90Uuva1mdefq8UbOCA7Id1halOe0j2E51s?=
 =?us-ascii?Q?qvbuvefNM3Mb7kXsoMJe5WzNq48JqOM6WHLHADDj2Kd1f65bAlDJMUatu+th?=
 =?us-ascii?Q?pg74xsWWIuAT2P5eJWwV4XwkAZEPVSubZ72cKtV2Bo4HavPOpzyV8vU0VQsI?=
 =?us-ascii?Q?MmhWanqOwhYdUmVfx7Vn0g9heUYCMYewSr8XfUvy+f6EYZSuZpBQOUVR+RX1?=
 =?us-ascii?Q?B6KR18a5gU89VVqxdr/rurpnhwXXqSI5jsUgHjPBgZXROHquVjFMJ3BzsUDs?=
 =?us-ascii?Q?uwIAnqxv4DA0PUryyxmWgxDhWgMScBTwPJqTPUcxD4FWrWrxH9dpBto9QySS?=
 =?us-ascii?Q?ZQ6nRoKR43wqjS5/DomZmIfJCWJqMSZylyI0HOOWAKarzGgD42ztA5V6Fsuf?=
 =?us-ascii?Q?rhdpapUk4ISWtuL3UdQwKHnoT95glS78GGeYSJbhhk7zW1p91tHfzfsdktyG?=
 =?us-ascii?Q?6WO6PiwmGoYm/H69clfaHkI3gRYnV2rtE4Z699f8kImy889KKfsI033Bl2gA?=
 =?us-ascii?Q?PjDYqsH6PrMqBLuSNJDniLiU8uX6ZbCNb0mIIoclth+l4xUuobC3K6ahSeZi?=
 =?us-ascii?Q?JujcdnG2fl4/rXa1mKYBFQ6fiRxdcs+q0LrJM6pSVvcO4dv7+eLhw96WU7in?=
 =?us-ascii?Q?fl70rs+ZjjHofO7wdDprFdG8Ur+eMZWCLjnn63Ab?=
X-OriginatorOrg: irondevice.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 05acb0e1-87e2-47c8-c3f6-08daefc69f01
X-MS-Exchange-CrossTenant-AuthSource: SLXP216MB0077.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2023 09:15:58.1446 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b4849faa-3337-494e-a76a-cb25a3b3d7d1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I/fAnQevyKDZtKU5/NSjFe+AQXewgoYAl/8O2MrR8fQOgNSZEQyH9gAMnpqO8VDWw94A+FB8GWaoyTqRa1cgtO5WnZg2vJGfRvHZOVg0YWI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PS2P216MB1300
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
 Kiseok Jo <kiseok.jo@irondevice.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Modified to the kernel coding style.

Signed-off-by: Kiseok Jo <kiseok.jo@irondevice.com>
Reported-by: Mark Brown <broonie@kernel.org>
Reported-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/codecs/sma1303.c | 570 +++++++++++---------------
 sound/soc/codecs/sma1303.h | 802 ++++++++++++++++++-------------------
 2 files changed, 642 insertions(+), 730 deletions(-)

diff --git a/sound/soc/codecs/sma1303.c b/sound/soc/codecs/sma1303.c
index 1ef0b145f5ba..42352fa6de56 100644
--- a/sound/soc/codecs/sma1303.c
+++ b/sound/soc/codecs/sma1303.c
@@ -1,12 +1,11 @@
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
+// sma1303.c -- sma1303 ALSA SoC Audio driver
+//
+// Copyright 2023 Iron Device Corporation
+//
+// Auther: Gyuhwa Park <gyuhwa.park@irondevice.com>
+//         Kiseok Jo <kiseok.jo@irondevice.com>
 
 #include <linux/module.h>
 #include <linux/moduleparam.h>
@@ -61,29 +60,29 @@ struct sma1303_pll_match {
 
 struct sma1303_priv {
 	enum sma1303_type devtype;
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
 	int num_of_pll_matches;
 	int retry_cnt;
-	unsigned int sys_clk_id;
-	unsigned int init_vol;
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
@@ -245,7 +244,7 @@ EXPORT_SYMBOL(sma1303_set_callback_func);
 static int sma1303_regmap_write(struct sma1303_priv *sma1303,
 				unsigned int reg, unsigned int val)
 {
-	int ret = 0;
+	int ret;
 	int cnt = sma1303->retry_cnt;
 
 	while (cnt--) {
@@ -264,7 +263,7 @@ static int sma1303_regmap_write(struct sma1303_priv *sma1303,
 static int sma1303_regmap_update_bits(struct sma1303_priv *sma1303,
 		unsigned int reg, unsigned int mask, unsigned int val)
 {
-	int ret = 0;
+	int ret;
 	int cnt = sma1303->retry_cnt;
 
 	while (cnt--) {
@@ -308,25 +307,11 @@ static int bytes_ext_get(struct snd_kcontrol *kcontrol,
 	struct soc_bytes_ext *params = (void *)kcontrol->private_value;
 	unsigned int i, reg_val;
 	u8 *val;
-	int ret = -1;
+	int ret;
 
-	if (component == NULL) {
-		pr_err("%s:component is NULL\n", __func__);
-		return ret;
-	}
-	if (sma1303 == NULL) {
-		pr_err("%s:sma1303 is NULL\n", __func__);
-		return ret;
-	}
 	val = (u8 *)ucontrol->value.bytes.data;
 	for (i = 0; i < params->max; i++) {
 		ret = sma1303_regmap_read(sma1303, reg + i, &reg_val);
-		if (ret < 0) {
-			dev_err(component->dev,
-				"Failed to read, register: %x ret: %d\n",
-				reg + i, ret);
-			return ret;
-		}
 		if (sizeof(reg_val) > 2)
 			reg_val = cpu_to_le32(reg_val);
 		else
@@ -334,7 +319,7 @@ static int bytes_ext_get(struct snd_kcontrol *kcontrol,
 		memcpy(val + i, &reg_val, sizeof(u8));
 	}
 
-	return 0;
+	return ret;
 }
 
 static int bytes_ext_put(struct snd_kcontrol *kcontrol,
@@ -346,16 +331,8 @@ static int bytes_ext_put(struct snd_kcontrol *kcontrol,
 	struct soc_bytes_ext *params = (void *)kcontrol->private_value;
 	void *data;
 	u8 *val;
-	int i, ret = -1;
+	int i, ret;
 
-	if (component == NULL) {
-		pr_err("%s:component is NULL\n", __func__);
-		return ret;
-	}
-	if (sma1303 == NULL) {
-		pr_err("%s:sma1303 is NULL\n", __func__);
-		return ret;
-	}
 	data = kmemdup(ucontrol->value.bytes.data,
 			params->max, GFP_KERNEL | GFP_DMA);
 	if (!data)
@@ -407,41 +384,25 @@ static int sma1303_postscaler_config_get(struct snd_kcontrol *kcontrol,
 	struct snd_soc_component *component =
 		snd_soc_kcontrol_component(kcontrol);
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
+	int ret, data, val;
 
 	ret = sma1303_regmap_read(sma1303, SMA1303_90_POSTSCALER, &data);
-	if (ret < 0) {
-		dev_err(component->dev,
-			"Failed to read, register: %x ret: %d\n",
-				SMA1303_90_POSTSCALER, ret);
-		return ret;
-	}
-
-	val = data & BYP_POST_MASK;
+	val = data & SMA1303_BYP_POST_MASK;
 	switch (val) {
-	case BYP_POST_SCALER:
+	case SMA1303_BYP_POST_SCALER:
 		ucontrol->value.integer.value[0] = 1;
 		break;
-	case EN_POST_SCALER:
+	case SMA1303_EN_POST_SCALER:
 		ucontrol->value.integer.value[0] = 0;
 		break;
 	default:
 		dev_err(component->dev,
 				"Invalid value, register: %x value: %d\n",
 					SMA1303_90_POSTSCALER, val);
-		return ret;
+		return -EINVAL;
 	}
 
-	return 0;
+	return ret;
 }
 
 static int sma1303_postscaler_config_put(struct snd_kcontrol *kcontrol,
@@ -451,33 +412,24 @@ static int sma1303_postscaler_config_put(struct snd_kcontrol *kcontrol,
 		snd_soc_kcontrol_component(kcontrol);
 	struct sma1303_priv *sma1303 = snd_soc_component_get_drvdata(component);
 	int sel = (int)ucontrol->value.integer.value[0];
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
+	int val;
 
 	switch (sel) {
 	case 0:
-		val = EN_POST_SCALER;
+		val = SMA1303_EN_POST_SCALER;
 		break;
 	case 1:
-		val = BYP_POST_SCALER;
+		val = SMA1303_BYP_POST_SCALER;
 		break;
 	default:
 		dev_err(component->dev,
 				"Invalid value, register: %x\n",
 					SMA1303_90_POSTSCALER);
-		return ret;
+		return -EINVAL;
 	}
 
 	return sma1303_regmap_update_bits(sma1303,
-			SMA1303_90_POSTSCALER, BYP_POST_MASK, val);
+			SMA1303_90_POSTSCALER, SMA1303_BYP_POST_MASK, val);
 }
 
 static const char * const sma1303_o_format_text[] = {
@@ -492,37 +444,28 @@ static int sma1303_o_format_get(struct snd_kcontrol *kcontrol,
 	struct snd_soc_component *component =
 		snd_soc_kcontrol_component(kcontrol);
 	struct sma1303_priv *sma1303 = snd_soc_component_get_drvdata(component);
-	int val, data, ret = -1;
-
-	if (component == NULL) {
-		pr_err("%s:component is NULL\n", __func__);
-		return ret;
-	}
-	if (sma1303 == NULL) {
-		pr_err("%s:sma1303 is NULL\n", __func__);
-		return ret;
-	}
+	int val, data, ret;
 
 	ret = sma1303_regmap_read(sma1303, SMA1303_A4_TOP_MAN3, &data);
-	val = data & O_FORMAT_MASK;
+	val = data & SMA1303_O_FORMAT_MASK;
 	switch (val) {
-	case O_FMT_LJ:
+	case SMA1303_O_FMT_LJ:
 		ucontrol->value.integer.value[0] = 0;
 		break;
-	case O_FMT_I2S:
+	case SMA1303_O_FMT_I2S:
 		ucontrol->value.integer.value[0] = 1;
 		break;
-	case O_FMT_TDM:
+	case SMA1303_O_FMT_TDM:
 		ucontrol->value.integer.value[0] = 2;
 		break;
 	default:
 		dev_err(component->dev,
 			"Invalid value, register: %x\n",
 				SMA1303_A4_TOP_MAN3);
-		return ret;
+		return -EINVAL;
 	}
 
-	return 0;
+	return ret;
 }
 static int sma1303_o_format_put(struct snd_kcontrol *kcontrol,
 				struct snd_ctl_elem_value *ucontrol)
@@ -531,36 +474,27 @@ static int sma1303_o_format_put(struct snd_kcontrol *kcontrol,
 		snd_soc_kcontrol_component(kcontrol);
 	struct sma1303_priv *sma1303 = snd_soc_component_get_drvdata(component);
 	int sel = (int)ucontrol->value.integer.value[0];
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
+	int val;
 
 	switch (sel) {
 	case 0:
-		val = O_FMT_LJ;
+		val = SMA1303_O_FMT_LJ;
 		break;
 	case 1:
-		val = O_FMT_I2S;
+		val = SMA1303_O_FMT_I2S;
 		break;
 	case 2:
-		val = O_FMT_TDM;
+		val = SMA1303_O_FMT_TDM;
 		break;
 	default:
 		dev_err(component->dev,
 			"Invalid value, register: %x\n",
 				SMA1303_A4_TOP_MAN3);
-		return ret;
+		return -EINVAL;
 	}
 
 	return sma1303_regmap_update_bits(sma1303,
-			SMA1303_A4_TOP_MAN3, O_FORMAT_MASK, val);
+			SMA1303_A4_TOP_MAN3, SMA1303_O_FORMAT_MASK, val);
 }
 
 static const char * const sma1303_aif_in_source_text[] = {
@@ -587,18 +521,22 @@ static int sma1303_startup(struct snd_soc_component *component)
 		return ret;
 	}
 
-	ret += sma1303_regmap_update_bits(sma1303,
-			SMA1303_8E_PLL_CTRL, PLL_PD2_MASK, PLL_OPERATION2);
+	ret += sma1303_regmap_update_bits(sma1303, SMA1303_8E_PLL_CTRL,
+			SMA1303_PLL_PD2_MASK, SMA1303_PLL_OPERATION2);
 
-	ret += sma1303_regmap_update_bits(sma1303,
-			SMA1303_00_SYSTEM_CTRL, POWER_MASK, POWER_ON);
+	ret += sma1303_regmap_update_bits(sma1303, SMA1303_00_SYSTEM_CTRL,
+			SMA1303_POWER_MASK, SMA1303_POWER_ON);
 
 	if (sma1303->amp_mode == SMA1303_MONO)
 		ret += sma1303_regmap_update_bits(sma1303,
-			SMA1303_10_SYSTEM_CTRL1, SPK_MODE_MASK, SPK_MONO);
+				SMA1303_10_SYSTEM_CTRL1,
+				SMA1303_SPK_MODE_MASK,
+				SMA1303_SPK_MONO);
 	else
 		ret += sma1303_regmap_update_bits(sma1303,
-			SMA1303_10_SYSTEM_CTRL1, SPK_MODE_MASK, SPK_STEREO);
+				SMA1303_10_SYSTEM_CTRL1,
+				SMA1303_SPK_MODE_MASK,
+				SMA1303_SPK_STEREO);
 
 	if (sma1303->check_fault_status) {
 		if (sma1303->check_fault_period > 0)
@@ -611,8 +549,8 @@ static int sma1303_startup(struct snd_soc_component *component)
 					CHECK_PERIOD_TIME * HZ);
 	}
 
-	ret += sma1303_regmap_update_bits(sma1303,
-			SMA1303_0E_MUTE_VOL_CTRL, SPK_MUTE_MASK, SPK_UNMUTE);
+	ret += sma1303_regmap_update_bits(sma1303, SMA1303_0E_MUTE_VOL_CTRL,
+			SMA1303_SPK_MUTE_MASK, SMA1303_SPK_UNMUTE);
 
 	sma1303->amp_power_status = true;
 
@@ -630,21 +568,21 @@ static int sma1303_shutdown(struct snd_soc_component *component)
 		return ret;
 	}
 
-	ret += sma1303_regmap_update_bits(sma1303,
-			SMA1303_0E_MUTE_VOL_CTRL, SPK_MUTE_MASK, SPK_MUTE);
+	ret += sma1303_regmap_update_bits(sma1303, SMA1303_0E_MUTE_VOL_CTRL,
+			SMA1303_SPK_MUTE_MASK, SMA1303_SPK_MUTE);
 
 	cancel_delayed_work_sync(&sma1303->check_fault_work);
 
 	msleep(55);
 
-	ret += sma1303_regmap_update_bits(sma1303,
-			SMA1303_10_SYSTEM_CTRL1, SPK_MODE_MASK, SPK_OFF);
+	ret += sma1303_regmap_update_bits(sma1303, SMA1303_10_SYSTEM_CTRL1,
+			SMA1303_SPK_MODE_MASK, SMA1303_SPK_OFF);
 
-	ret += sma1303_regmap_update_bits(sma1303,
-			SMA1303_00_SYSTEM_CTRL, POWER_MASK, POWER_OFF);
+	ret += sma1303_regmap_update_bits(sma1303, SMA1303_00_SYSTEM_CTRL,
+			SMA1303_POWER_MASK, SMA1303_POWER_OFF);
 
-	ret += sma1303_regmap_update_bits(sma1303,
-			SMA1303_8E_PLL_CTRL, PLL_PD2_MASK, PLL_PD2);
+	ret += sma1303_regmap_update_bits(sma1303, SMA1303_8E_PLL_CTRL,
+			SMA1303_PLL_PD2_MASK, SMA1303_PLL_PD2);
 
 	sma1303->amp_power_status = false;
 
@@ -666,30 +604,30 @@ static int sma1303_aif_in_event(struct snd_soc_dapm_widget *w,
 		case 0:
 			ret += sma1303_regmap_update_bits(sma1303,
 					SMA1303_11_SYSTEM_CTRL2,
-					MONOMIX_MASK,
-					MONOMIX_ON);
+					SMA1303_MONOMIX_MASK,
+					SMA1303_MONOMIX_ON);
 			ret += sma1303->amp_mode = SMA1303_MONO;
 			break;
 		case 1:
 			ret += sma1303_regmap_update_bits(sma1303,
 					SMA1303_11_SYSTEM_CTRL2,
-					MONOMIX_MASK,
-					MONOMIX_OFF);
+					SMA1303_MONOMIX_MASK,
+					SMA1303_MONOMIX_OFF);
 			ret += sma1303_regmap_update_bits(sma1303,
 					SMA1303_11_SYSTEM_CTRL2,
-					LR_DATA_SW_MASK,
-					LR_DATA_SW_NORMAL);
+					SMA1303_LR_DATA_SW_MASK,
+					SMA1303_LR_DATA_SW_NORMAL);
 			ret += sma1303->amp_mode = SMA1303_STEREO;
 			break;
 		case 2:
 			ret += sma1303_regmap_update_bits(sma1303,
 					SMA1303_11_SYSTEM_CTRL2,
-					MONOMIX_MASK,
-					MONOMIX_OFF);
+					SMA1303_MONOMIX_MASK,
+					SMA1303_MONOMIX_OFF);
 			ret += sma1303_regmap_update_bits(sma1303,
 					SMA1303_11_SYSTEM_CTRL2,
-					LR_DATA_SW_MASK,
-					LR_DATA_SW_NORMAL);
+					SMA1303_LR_DATA_SW_MASK,
+					SMA1303_LR_DATA_SW_NORMAL);
 			sma1303->amp_mode = SMA1303_STEREO;
 			break;
 		default:
@@ -720,72 +658,72 @@ static int sma1303_aif_out_event(struct snd_soc_dapm_widget *w,
 		case 0:
 			ret += sma1303_regmap_update_bits(sma1303,
 					SMA1303_A3_TOP_MAN2,
-					TEST_CLKO_EN_MASK,
-					NORMAL_SDO);
+					SMA1303_TEST_CLKO_EN_MASK,
+					SMA1303_NORMAL_SDO);
 			ret += sma1303_regmap_update_bits(sma1303,
 					SMA1303_09_OUTPUT_CTRL,
-					PORT_OUT_SEL_MASK,
-					OUT_SEL_DISABLE);
+					SMA1303_PORT_OUT_SEL_MASK,
+					SMA1303_OUT_SEL_DISABLE);
 			break;
 		case 1:
 			ret += sma1303_regmap_update_bits(sma1303,
 					SMA1303_A3_TOP_MAN2,
-					TEST_CLKO_EN_MASK,
-					NORMAL_SDO);
+					SMA1303_TEST_CLKO_EN_MASK,
+					SMA1303_NORMAL_SDO);
 			ret += sma1303_regmap_update_bits(sma1303,
 					SMA1303_09_OUTPUT_CTRL,
-					PORT_OUT_SEL_MASK,
-					FORMAT_CONVERTER);
+					SMA1303_PORT_OUT_SEL_MASK,
+					SMA1303_FORMAT_CONVERTER);
 			break;
 		case 2:
 			ret += sma1303_regmap_update_bits(sma1303,
 					SMA1303_A3_TOP_MAN2,
-					TEST_CLKO_EN_MASK,
-					NORMAL_SDO);
+					SMA1303_TEST_CLKO_EN_MASK,
+					SMA1303_NORMAL_SDO);
 			ret += sma1303_regmap_update_bits(sma1303,
 					SMA1303_09_OUTPUT_CTRL,
-					PORT_OUT_SEL_MASK,
-					MIXER_OUTPUT);
+					SMA1303_PORT_OUT_SEL_MASK,
+					SMA1303_MIXER_OUTPUT);
 			break;
 		case 3:
 			ret += sma1303_regmap_update_bits(sma1303,
 					SMA1303_A3_TOP_MAN2,
-					TEST_CLKO_EN_MASK,
-					NORMAL_SDO);
+					SMA1303_TEST_CLKO_EN_MASK,
+					SMA1303_NORMAL_SDO);
 			ret += sma1303_regmap_update_bits(sma1303,
 					SMA1303_09_OUTPUT_CTRL,
-					PORT_OUT_SEL_MASK,
-					SPEAKER_PATH);
+					SMA1303_PORT_OUT_SEL_MASK,
+					SMA1303_SPEAKER_PATH);
 			break;
 		case 4:
 			ret += sma1303_regmap_update_bits(sma1303,
 					SMA1303_A3_TOP_MAN2,
-					TEST_CLKO_EN_MASK,
-					NORMAL_SDO);
+					SMA1303_TEST_CLKO_EN_MASK,
+					SMA1303_NORMAL_SDO);
 			ret += sma1303_regmap_update_bits(sma1303,
 					SMA1303_09_OUTPUT_CTRL,
-					PORT_OUT_SEL_MASK,
-					POSTSCALER_OUTPUT);
+					SMA1303_PORT_OUT_SEL_MASK,
+					SMA1303_POSTSCALER_OUTPUT);
 			break;
 		case 5:
 			ret += sma1303_regmap_update_bits(sma1303,
 					SMA1303_A3_TOP_MAN2,
-					TEST_CLKO_EN_MASK,
-					CLK_OUT_SDO);
+					SMA1303_TEST_CLKO_EN_MASK,
+					SMA1303_CLK_OUT_SDO);
 			ret += sma1303_regmap_update_bits(sma1303,
 					SMA1303_A3_TOP_MAN2,
-					MON_OSC_PLL_MASK,
-					PLL_SDO);
+					SMA1303_MON_OSC_PLL_MASK,
+					SMA1303_PLL_SDO);
 			break;
 		case 6:
 			ret += sma1303_regmap_update_bits(sma1303,
 					SMA1303_A3_TOP_MAN2,
-					TEST_CLKO_EN_MASK,
-					CLK_OUT_SDO);
+					SMA1303_TEST_CLKO_EN_MASK,
+					SMA1303_CLK_OUT_SDO);
 			ret += sma1303_regmap_update_bits(sma1303,
 					SMA1303_A3_TOP_MAN2,
-					MON_OSC_PLL_MASK,
-					PLL_OSC);
+					SMA1303_MON_OSC_PLL_MASK,
+					SMA1303_OSC_SDO);
 			break;
 		default:
 			dev_err(sma1303->dev, "%s : Invald value (%d)\n",
@@ -814,24 +752,24 @@ static int sma1303_sdo_event(struct snd_soc_dapm_widget *w,
 			"%s : SND_SOC_DAPM_PRE_PMU\n", __func__);
 		ret += sma1303_regmap_update_bits(sma1303,
 				SMA1303_09_OUTPUT_CTRL,
-				PORT_CONFIG_MASK,
-				OUTPUT_PORT_ENABLE);
+				SMA1303_PORT_CONFIG_MASK,
+				SMA1303_OUTPUT_PORT_ENABLE);
 		ret += sma1303_regmap_update_bits(sma1303,
 				SMA1303_A3_TOP_MAN2,
-				SDO_OUTPUT_MASK,
-				NORMAL_OUT);
+				SMA1303_SDO_OUTPUT_MASK,
+				SMA1303_NORMAL_OUT);
 		break;
 	case SND_SOC_DAPM_POST_PMD:
 		dev_info(sma1303->dev,
 			"%s : SND_SOC_DAPM_POST_PMD\n", __func__);
 		ret += sma1303_regmap_update_bits(sma1303,
 				SMA1303_09_OUTPUT_CTRL,
-				PORT_CONFIG_MASK,
-				INPUT_PORT_ONLY);
+				SMA1303_PORT_CONFIG_MASK,
+				SMA1303_INPUT_PORT_ONLY);
 		ret += sma1303_regmap_update_bits(sma1303,
 				SMA1303_A3_TOP_MAN2,
-				SDO_OUTPUT_MASK,
-				HIGH_Z_OUT);
+				SMA1303_SDO_OUTPUT_MASK,
+				SMA1303_HIGH_Z_OUT);
 		break;
 	}
 	return ret;
@@ -964,8 +902,8 @@ static int sma1303_setup_pll(struct snd_soc_component *component,
 
 		ret += sma1303_regmap_update_bits(sma1303,
 				SMA1303_A2_TOP_MAN1,
-				PLL_PD_MASK|PLL_REF_CLK_MASK,
-				PLL_OPERATION|PLL_SCK);
+				SMA1303_PLL_PD_MASK|SMA1303_PLL_REF_CLK_MASK,
+				SMA1303_PLL_OPERATION|SMA1303_PLL_SCK);
 	}
 
 	ret += sma1303_regmap_write(sma1303,
@@ -1033,24 +971,28 @@ static int sma1303_dai_hw_params_amp(struct snd_pcm_substream *substream,
 		case 44100:
 		case 48000:
 		case 96000:
-		ret += sma1303_regmap_update_bits(sma1303,
-				SMA1303_A2_TOP_MAN1,
-				DAC_DN_CONV_MASK, DAC_DN_CONV_DISABLE);
+			ret += sma1303_regmap_update_bits(sma1303,
+					SMA1303_A2_TOP_MAN1,
+					SMA1303_DAC_DN_CONV_MASK,
+					SMA1303_DAC_DN_CONV_DISABLE);
 
-		ret += sma1303_regmap_update_bits(sma1303,
-				SMA1303_01_INPUT1_CTRL1,
-				LEFTPOL_MASK, LOW_FIRST_CH);
-		break;
+			ret += sma1303_regmap_update_bits(sma1303,
+					SMA1303_01_INPUT1_CTRL1,
+					SMA1303_LEFTPOL_MASK,
+					SMA1303_LOW_FIRST_CH);
+			break;
 
 		case 192000:
-		ret += sma1303_regmap_update_bits(sma1303,
-				SMA1303_A2_TOP_MAN1,
-				DAC_DN_CONV_MASK, DAC_DN_CONV_ENABLE);
+			ret += sma1303_regmap_update_bits(sma1303,
+					SMA1303_A2_TOP_MAN1,
+					SMA1303_DAC_DN_CONV_MASK,
+					SMA1303_DAC_DN_CONV_ENABLE);
 
-		ret += sma1303_regmap_update_bits(sma1303,
-				SMA1303_01_INPUT1_CTRL1,
-				LEFTPOL_MASK, HIGH_FIRST_CH);
-		break;
+			ret += sma1303_regmap_update_bits(sma1303,
+					SMA1303_01_INPUT1_CTRL1,
+					SMA1303_LEFTPOL_MASK,
+					SMA1303_HIGH_FIRST_CH);
+			break;
 
 		default:
 			dev_err(component->dev, "%s not support rate : %d\n",
@@ -1069,7 +1011,8 @@ static int sma1303_dai_hw_params_amp(struct snd_pcm_substream *substream,
 				__func__);
 			ret += sma1303_regmap_update_bits(sma1303,
 					SMA1303_A4_TOP_MAN3,
-					SCK_RATE_MASK, SCK_32FS);
+					SMA1303_SCK_RATE_MASK,
+					SMA1303_SCK_32FS);
 			break;
 
 		case SNDRV_PCM_FORMAT_S24_LE:
@@ -1078,7 +1021,8 @@ static int sma1303_dai_hw_params_amp(struct snd_pcm_substream *substream,
 				__func__);
 			ret += sma1303_regmap_update_bits(sma1303,
 					SMA1303_A4_TOP_MAN3,
-					SCK_RATE_MASK, SCK_64FS);
+					SMA1303_SCK_RATE_MASK,
+					SMA1303_SCK_64FS);
 			break;
 		case SNDRV_PCM_FORMAT_S32_LE:
 			dev_info(component->dev,
@@ -1086,7 +1030,8 @@ static int sma1303_dai_hw_params_amp(struct snd_pcm_substream *substream,
 				__func__);
 			ret += sma1303_regmap_update_bits(sma1303,
 					SMA1303_A4_TOP_MAN3,
-					SCK_RATE_MASK, SCK_64FS);
+					SMA1303_SCK_RATE_MASK,
+					SMA1303_SCK_64FS);
 			break;
 		default:
 			dev_err(component->dev,
@@ -1100,13 +1045,13 @@ static int sma1303_dai_hw_params_amp(struct snd_pcm_substream *substream,
 	case 16:
 		switch (sma1303->format) {
 		case SND_SOC_DAIFMT_I2S:
-			input_format |= STANDARD_I2S;
+			input_format |= SMA1303_STANDARD_I2S;
 			break;
 		case SND_SOC_DAIFMT_LEFT_J:
-			input_format |= LJ;
+			input_format |= SMA1303_LJ;
 			break;
 		case SND_SOC_DAIFMT_RIGHT_J:
-			input_format |= RJ_16BIT;
+			input_format |= SMA1303_RJ_16BIT;
 			break;
 		}
 		break;
@@ -1114,13 +1059,13 @@ static int sma1303_dai_hw_params_amp(struct snd_pcm_substream *substream,
 	case 32:
 		switch (sma1303->format) {
 		case SND_SOC_DAIFMT_I2S:
-			input_format |= STANDARD_I2S;
+			input_format |= SMA1303_STANDARD_I2S;
 			break;
 		case SND_SOC_DAIFMT_LEFT_J:
-			input_format |= LJ;
+			input_format |= SMA1303_LJ;
 			break;
 		case SND_SOC_DAIFMT_RIGHT_J:
-			input_format |= RJ_24BIT;
+			input_format |= SMA1303_RJ_24BIT;
 			break;
 		}
 		break;
@@ -1134,7 +1079,7 @@ static int sma1303_dai_hw_params_amp(struct snd_pcm_substream *substream,
 
 	ret += sma1303_regmap_update_bits(sma1303,
 			SMA1303_01_INPUT1_CTRL1,
-			I2S_MODE_MASK, input_format);
+			SMA1303_I2S_MODE_MASK, input_format);
 	return ret;
 }
 
@@ -1181,13 +1126,15 @@ static int sma1303_dai_mute(struct snd_soc_dai *dai, int mute, int stream)
 
 		ret += sma1303_regmap_update_bits(sma1303,
 				SMA1303_0E_MUTE_VOL_CTRL,
-				SPK_MUTE_MASK, SPK_MUTE);
+				SMA1303_SPK_MUTE_MASK,
+				SMA1303_SPK_MUTE);
 	} else {
 		dev_info(component->dev, "%s : %s\n", __func__, "UNMUTE");
 
 		ret += sma1303_regmap_update_bits(sma1303,
 				SMA1303_0E_MUTE_VOL_CTRL,
-				SPK_MUTE_MASK, SPK_UNMUTE);
+				SMA1303_SPK_MUTE_MASK,
+				SMA1303_SPK_UNMUTE);
 	}
 
 	return ret;
@@ -1207,7 +1154,8 @@ static int sma1303_dai_set_fmt_amp(struct snd_soc_dai *dai,
 				"%s : %s\n", __func__, "I2S/TDM Device mode");
 		ret += sma1303_regmap_update_bits(sma1303,
 				SMA1303_01_INPUT1_CTRL1,
-				CONTROLLER_DEVICE_MASK, DEVICE_MODE);
+				SMA1303_CONTROLLER_DEVICE_MASK,
+				SMA1303_DEVICE_MODE);
 		break;
 
 	case SND_SOC_DAIFMT_CBM_CFM:
@@ -1215,7 +1163,8 @@ static int sma1303_dai_set_fmt_amp(struct snd_soc_dai *dai,
 			"%s : %s\n", __func__, "I2S/TDM Controller mode");
 		ret += sma1303_regmap_update_bits(sma1303,
 				SMA1303_01_INPUT1_CTRL1,
-				CONTROLLER_DEVICE_MASK, CONTROLLER_MODE);
+				SMA1303_CONTROLLER_DEVICE_MASK,
+				SMA1303_CONTROLLER_MODE);
 		break;
 
 	default:
@@ -1246,22 +1195,24 @@ static int sma1303_dai_set_fmt_amp(struct snd_soc_dai *dai,
 			__func__, "Invert BCLK + Normal Frame");
 		ret += sma1303_regmap_update_bits(sma1303,
 				SMA1303_01_INPUT1_CTRL1,
-				SCK_RISING_MASK, SCK_RISING_EDGE);
+				SMA1303_SCK_RISING_MASK,
+				SMA1303_SCK_RISING_EDGE);
 		break;
 	case SND_SOC_DAIFMT_IB_IF:
 		dev_info(component->dev, "%s : %s\n",
 			__func__, "Invert BCLK + Invert Frame");
 		ret += sma1303_regmap_update_bits(sma1303,
 				SMA1303_01_INPUT1_CTRL1,
-				LEFTPOL_MASK|SCK_RISING_MASK,
-				HIGH_FIRST_CH|SCK_RISING_EDGE);
+				SMA1303_LEFTPOL_MASK|SMA1303_SCK_RISING_MASK,
+				SMA1303_HIGH_FIRST_CH|SMA1303_SCK_RISING_EDGE);
 		break;
 	case SND_SOC_DAIFMT_NB_IF:
 		dev_info(component->dev, "%s : %s\n",
 			__func__, "Normal BCLK + Invert Frame");
 		ret += sma1303_regmap_update_bits(sma1303,
 				SMA1303_01_INPUT1_CTRL1,
-				LEFTPOL_MASK, HIGH_FIRST_CH);
+				SMA1303_LEFTPOL_MASK,
+				SMA1303_HIGH_FIRST_CH);
 		break;
 	case SND_SOC_DAIFMT_NB_NF:
 		dev_info(component->dev, "%s : %s\n",
@@ -1290,61 +1241,70 @@ static int sma1303_dai_set_tdm_slot(struct snd_soc_dai *dai,
 	sma1303->frame_size = slot_width * slots;
 
 	ret += sma1303_regmap_update_bits(sma1303,
-			SMA1303_A4_TOP_MAN3,
-			O_FORMAT_MASK, O_FMT_TDM);
+				SMA1303_A4_TOP_MAN3,
+				SMA1303_O_FORMAT_MASK,
+				SMA1303_O_FMT_TDM);
 
 	switch (slot_width) {
 	case 16:
-	ret += sma1303_regmap_update_bits(sma1303,
-			SMA1303_A6_TDM2,
-			TDM_DL_MASK, TDM_DL_16);
-	break;
+		ret += sma1303_regmap_update_bits(sma1303,
+					SMA1303_A6_TDM2,
+					SMA1303_TDM_DL_MASK,
+					SMA1303_TDM_DL_16);
+		break;
 	case 32:
-	ret += sma1303_regmap_update_bits(sma1303,
-			SMA1303_A6_TDM2,
-			TDM_DL_MASK, TDM_DL_32);
-	break;
+		ret += sma1303_regmap_update_bits(sma1303,
+					SMA1303_A6_TDM2,
+					SMA1303_TDM_DL_MASK,
+					SMA1303_TDM_DL_32);
+		break;
 	default:
-	dev_err(component->dev, "%s not support TDM %d slot_width\n",
-				__func__, slot_width);
+		dev_err(component->dev, "%s not support TDM %d slot_width\n",
+					__func__, slot_width);
 	}
 
 	switch (slots) {
 	case 4:
-	ret += sma1303_regmap_update_bits(sma1303,
-			SMA1303_A6_TDM2,
-			TDM_N_SLOT_MASK, TDM_N_SLOT_4);
-	break;
+		ret += sma1303_regmap_update_bits(sma1303,
+					SMA1303_A6_TDM2,
+					SMA1303_TDM_N_SLOT_MASK,
+					SMA1303_TDM_N_SLOT_4);
+		break;
 	case 8:
-	ret += sma1303_regmap_update_bits(sma1303,
-			SMA1303_A6_TDM2,
-			TDM_N_SLOT_MASK, TDM_N_SLOT_8);
-	break;
+		ret += sma1303_regmap_update_bits(sma1303,
+					SMA1303_A6_TDM2,
+					SMA1303_TDM_N_SLOT_MASK,
+					SMA1303_TDM_N_SLOT_8);
+		break;
 	default:
-	dev_err(component->dev, "%s not support TDM %d slots\n",
+		dev_err(component->dev, "%s not support TDM %d slots\n",
 				__func__, slots);
 	}
 
 	if (sma1303->tdm_slot_rx < slots)
 		ret += sma1303_regmap_update_bits(sma1303,
-				SMA1303_A5_TDM1, TDM_SLOT1_RX_POS_MASK,
-				(sma1303->tdm_slot_rx) << 3);
+					SMA1303_A5_TDM1,
+					SMA1303_TDM_SLOT1_RX_POS_MASK,
+					(sma1303->tdm_slot_rx) << 3);
 	else
 		dev_err(component->dev, "%s Incorrect tdm-slot-rx %d set\n",
-				__func__, sma1303->tdm_slot_rx);
+					__func__, sma1303->tdm_slot_rx);
 
 	ret += sma1303_regmap_update_bits(sma1303,
-			SMA1303_A5_TDM1,
-			TDM_CLK_POL_MASK, TDM_CLK_POL_RISE);
+				SMA1303_A5_TDM1,
+				SMA1303_TDM_CLK_POL_MASK,
+				SMA1303_TDM_CLK_POL_RISE);
 
 	ret += sma1303_regmap_update_bits(sma1303,
-			SMA1303_A5_TDM1,
-			TDM_TX_MODE_MASK, TDM_TX_MONO);
+				SMA1303_A5_TDM1,
+				SMA1303_TDM_TX_MODE_MASK,
+				SMA1303_TDM_TX_MONO);
 
 	if (sma1303->tdm_slot_tx < slots)
 		ret += sma1303_regmap_update_bits(sma1303,
-				SMA1303_A6_TDM2, TDM_SLOT1_TX_POS_MASK,
-				(sma1303->tdm_slot_tx) << 3);
+					SMA1303_A6_TDM2,
+					SMA1303_TDM_SLOT1_TX_POS_MASK,
+					(sma1303->tdm_slot_tx) << 3);
 	else
 		dev_err(component->dev, "%s Incorrect tdm-slot-tx %d set\n",
 				__func__, sma1303->tdm_slot_tx);
@@ -1365,25 +1325,25 @@ static const struct snd_soc_dai_ops sma1303_dai_ops_amp = {
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
@@ -1433,7 +1393,7 @@ static void sma1303_check_fault_worker(struct work_struct *work)
 		return;
 	}
 
-	if (~over_temp & OT1_OK_STATUS) {
+	if (~over_temp & SMA1303_OT1_OK_STATUS) {
 		dev_crit(sma1303->dev,
 			"%s : OT1(Over Temperature Level 1)\n", __func__);
 
@@ -1449,23 +1409,23 @@ static void sma1303_check_fault_worker(struct work_struct *work)
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
@@ -1491,31 +1451,17 @@ static void sma1303_check_fault_worker(struct work_struct *work)
 					CHECK_PERIOD_TIME * HZ);
 	}
 
-	if (!(~over_temp & OT1_OK_STATUS) && !(~over_temp & OT2_OK_STATUS)
-			&& !(ocp_val & OCP_SPK_STATUS)
-			&& !(ocp_val & OCP_BST_STATUS)
-			&& !(ocp_val & CLK_MON_STATUS)
-			&& !(uvlo_val & UVLO_BST_STATUS)) {
+	if (!(~over_temp & SMA1303_OT1_OK_STATUS)
+			&& !(~over_temp & SMA1303_OT2_OK_STATUS)
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
@@ -1559,7 +1505,7 @@ static int sma1303_probe(struct snd_soc_component *component)
 
 	ret += sma1303_regmap_update_bits(sma1303,
 			SMA1303_00_SYSTEM_CTRL,
-			RESETBYI2C_MASK, RESETBYI2C_RESET);
+			SMA1303_RESETBYI2C_MASK, SMA1303_RESETBYI2C_RESET);
 
 	ret += sma1303_regmap_read(sma1303, SMA1303_FF_DEVICE_INDEX, &status);
 	if (ret < 0) {
@@ -1568,10 +1514,10 @@ static int sma1303_probe(struct snd_soc_component *component)
 				SMA1303_FF_DEVICE_INDEX, ret);
 		return ret;
 	}
-	sma1303->rev_num = status & REV_NUM_STATUS;
-	if (sma1303->rev_num == REV_NUM_TV0)
+	sma1303->rev_num = status & SMA1303_REV_NUM_STATUS;
+	if (sma1303->rev_num == SMA1303_REV_NUM_TV0)
 		dev_info(component->dev, "SMA1303 Trimming Version 0\n");
-	else if (sma1303->rev_num == REV_NUM_TV1)
+	else if (sma1303->rev_num == SMA1303_REV_NUM_TV1)
 		dev_info(component->dev, "SMA1303 Trimming Version 1\n");
 
 	ret += sma1303_regmap_read(sma1303, SMA1303_FB_STATUS2, &otp_stat);
@@ -1580,10 +1526,10 @@ static int sma1303_probe(struct snd_soc_component *component)
 			"failed to read, register: %02X, ret: %d\n",
 				SMA1303_FF_DEVICE_INDEX, ret);
 
-	if (((sma1303->rev_num == REV_NUM_TV0) &&
-		((otp_stat & 0x0E) == OTP_STAT_OK_0)) ||
-		((sma1303->rev_num != REV_NUM_TV0) &&
-		((otp_stat & 0x0C) == OTP_STAT_OK_1)))
+	if (((sma1303->rev_num == SMA1303_REV_NUM_TV0) &&
+		((otp_stat & 0x0E) == SMA1303_OTP_STAT_OK_0)) ||
+		((sma1303->rev_num != SMA1303_REV_NUM_TV0) &&
+		((otp_stat & 0x0C) == SMA1303_OTP_STAT_OK_1)))
 		dev_info(component->dev, "SMA1303 OTP Status Successful\n");
 	else
 		dev_info(component->dev, "SMA1303 OTP Status Fail\n");
@@ -1612,8 +1558,6 @@ static void sma1303_remove(struct snd_soc_component *component)
 static const struct snd_soc_component_driver sma1303_component = {
 	.probe = sma1303_probe,
 	.remove = sma1303_remove,
-	.suspend = sma1303_suspend,
-	.resume = sma1303_resume,
 	.controls = sma1303_snd_controls,
 	.num_controls = ARRAY_SIZE(sma1303_snd_controls),
 	.dapm_widgets = sma1303_dapm_widgets,
@@ -1722,8 +1666,6 @@ static int sma1303_i2c_probe(struct i2c_client *client,
 	u32 value;
 	unsigned int device_info;
 
-	dev_info(&client->dev, "%s is here. Driver version REV018\n", __func__);
-
 	sma1303 = devm_kzalloc(&client->dev, sizeof(struct sma1303_priv),
 							GFP_KERNEL);
 
@@ -1737,8 +1679,6 @@ static int sma1303_i2c_probe(struct i2c_client *client,
 		dev_err(&client->dev,
 			"Failed to allocate register map: %d\n", ret);
 
-		devm_kfree(&client->dev, sma1303);
-
 		return ret;
 	}
 
@@ -1807,14 +1747,14 @@ static int sma1303_i2c_probe(struct i2c_client *client,
 	ret = sma1303_regmap_read(sma1303,
 			SMA1303_FF_DEVICE_INDEX, &device_info);
 
-	if ((ret != 0) || ((device_info & 0xF8) != DEVICE_ID)) {
+	if ((ret != 0) || ((device_info & 0xF8) != SMA1303_DEVICE_ID)) {
 		dev_err(&client->dev, "device initialization error (%d 0x%02X)",
 				ret, device_info);
 	}
 	dev_info(&client->dev, "chip version 0x%02X\n", device_info);
 
 	sma1303->last_over_temp = 0xC0;
-	sma1303->last_ocp_val = 0x0A;
+	sma1303->last_ocp_val = 0x08;
 	sma1303->tsdw_cnt = 0;
 	sma1303->init_vol = 0x31;
 	sma1303->cur_vol = sma1303->init_vol;
@@ -1826,7 +1766,6 @@ static int sma1303_i2c_probe(struct i2c_client *client,
 	mutex_init(&sma1303->lock);
 	sma1303->check_fault_period = CHECK_PERIOD_TIME;
 
-	sma1303->devtype = id->driver_data;
 	sma1303->dev = &client->dev;
 	sma1303->kobj = &client->dev.kobj;
 
@@ -1844,10 +1783,6 @@ static int sma1303_i2c_probe(struct i2c_client *client,
 
 	if (ret) {
 		dev_err(&client->dev, "Failed to register component");
-		snd_soc_unregister_component(&client->dev);
-
-		if (sma1303)
-			devm_kfree(&client->dev, sma1303);
 
 		return ret;
 	}
@@ -1870,11 +1805,6 @@ static void sma1303_i2c_remove(struct i2c_client *client)
 		(struct sma1303_priv *) i2c_get_clientdata(client);
 
 	cancel_delayed_work_sync(&sma1303->check_fault_work);
-
-	snd_soc_unregister_component(&client->dev);
-
-	if (sma1303)
-		devm_kfree(&client->dev, sma1303);
 }
 
 static const struct i2c_device_id sma1303_i2c_id[] = {
@@ -1899,25 +1829,7 @@ static struct i2c_driver sma1303_i2c_driver = {
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
index 95535546fd73..a96c3de28d57 100644
--- a/sound/soc/codecs/sma1303.h
+++ b/sound/soc/codecs/sma1303.h
@@ -1,11 +1,11 @@
-/* SPDX-License-Identifier: GPL-2.0-or-later
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
  * sma1303.h -- sma1303 ALSA SoC Audio driver
  *
- * Copyright 2022 Iron Device Corporation
+ * Copyright 2023 Iron Device Corporation
+ *
+ * Author: Kiseok Jo <kiseok.jo@irondevice.com>
  *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License version 2 as
- * published by the Free Software Foundation.
  */
 
 #ifndef _SMA1303_H
@@ -113,504 +113,504 @@ void sma1303_set_callback_func(struct callback_ops ops);
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

