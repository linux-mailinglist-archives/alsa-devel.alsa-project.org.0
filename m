Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DA1625B806D
	for <lists+alsa-devel@lfdr.de>; Wed, 14 Sep 2022 07:00:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E4A7217C9;
	Wed, 14 Sep 2022 06:59:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E4A7217C9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663131608;
	bh=eCuDAY3m/t1ajmUi/MZ9tYBsw+eLpDzCUTU+lwl6Rmw=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=sXfZ0pEYQgVQe8oa3Mta/uREG17RXuD4Kj9KxiBhMDIJoguJIY0LaiD5umxVIoTFW
	 hILq8+YTgbSGm5ZhcIh6UjxcqHG1ph1GJe2BBTgsyswCnOH7ZUmc+8B61Nte4xlyI4
	 eSUuwnHiV7SZFVPqAmj3FLVQNIVu5Z5w9FMqCMFE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2B63BF801D8;
	Wed, 14 Sep 2022 06:59:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 51FE9F8016E; Wed, 14 Sep 2022 06:59:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.4 required=5.0 tests=FORGED_SPF_HELO,
 KHOP_HELO_FCRDNS,SPF_HELO_PASS,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from KOR01-PS2-obe.outbound.protection.outlook.com
 (mail-ps2kor01on2059.outbound.protection.outlook.com [40.107.128.59])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C2341F800C0
 for <alsa-devel@alsa-project.org>; Wed, 14 Sep 2022 06:58:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C2341F800C0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gj6XMuH/zPIqemHXhAIGH5eyQb88YsA6hJyaEpqxjjfatvl7ovYzGwj7XtSOJ+p+FCWe8nyVSFXUR7vFm/el7OM9pXjHhNDVrPMyxJ1/c0LozA0EX7BTqsat7s3O2zpEEVrJmXjiOljQUlvaN2uIkJA/4E0ft9WPpr4Fj3BoC3WZhYHE3a0GkfGLTIDrzWxs3rJP2nTGPpuddI4eazknT5JfD4H7I1S7C5PJmAohSCz6x+6Ib+0P+4iPsA5qdD7CLcauKMDK3ywDkyK6ELrebWAVpXUidzw3a7ynBy5CwbjkgJqkc6s+3/2NWgQpMFzSo9oXyUZjW45/oUzgCl0Xmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bgVDxxM7/mOZbBFDH+IpwKSikzRgJj/eHu3/xBte2fA=;
 b=AphYXUfaq1Moa6K9tMqXbIUn18yl151HGemBEePNdkPYluFnjHAlaCADunzDhFaS+I3SALs9K0n5DphVKKm0IqklSIey0VMqx5wB2qiBcJU9Jzc3Tg4lMWj9VTw7IEeHoYnUFgRjpPx2ysgYiIkgtfMGknCPfKqh9a1+jbfNbHHc/KjwBSCDfeudxI+K31iLt1s1cbBm9H9srp/DiqC38KJWvdu3rcoaeutCc2dvOrIA4YjQtHcQFKRRB7UmqGgIbXyEonqFGT4vHbnsUvQ6RQ8KMYsG3CuzkXheh6IKyYmFdn4JXkvwgSgsJgMmXDOakZZKgBcT4mzbXPqvJODZHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=irondevice.com; dmarc=pass action=none
 header.from=irondevice.com; dkim=pass header.d=irondevice.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=irondevice.com;
Received: from SLXP216MB0077.KORP216.PROD.OUTLOOK.COM (2603:1096:100:7::23) by
 PU4P216MB1323.KORP216.PROD.OUTLOOK.COM (2603:1096:301:a9::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5612.12; Wed, 14 Sep 2022 04:58:45 +0000
Received: from SLXP216MB0077.KORP216.PROD.OUTLOOK.COM
 ([fe80::c0c8:be70:d34b:6dd]) by SLXP216MB0077.KORP216.PROD.OUTLOOK.COM
 ([fe80::c0c8:be70:d34b:6dd%5]) with mapi id 15.20.5612.022; Wed, 14 Sep 2022
 04:58:45 +0000
From: Kiseok Jo <kiseok.jo@irondevice.com>
To: Gyuhwa Park <gyuhwa.park@irondevice.com>, Mark Brown <broonie@kernel.org>
Subject: [PATCH 3/4] ASoC: sma1303: Add driver for Iron Device SMA1303 Amp
Date: Wed, 14 Sep 2022 13:57:10 +0900
Message-Id: <20220914045712.8775-4-kiseok.jo@irondevice.com>
X-Mailer: git-send-email 2.30.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SL2P216CA0183.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:1a::13) To SLXP216MB0077.KORP216.PROD.OUTLOOK.COM
 (2603:1096:100:7::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SLXP216MB0077:EE_|PU4P216MB1323:EE_
X-MS-Office365-Filtering-Correlation-Id: ed4c36d0-cc64-4959-416d-08da960dcd32
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: R6Q/mW8Ej9V6oJCfr3FsFnX3q9iGX8Fv2Qs5s+qMgtyfcMtgwJxS2/D8zuIhPjOsTSzPh+K2YmewHbr80tZ0AefMg2XsRaC5eKywvyu5W2/gZES1dPU8MlwMRN//EoClvz0R2fXj8M7ZWSTAb2tiRX5mIayoB6f5LTNbvNOQaQ4dWM6FHPxyqZ0myoE7j/yPBYEqi83i82DUIzdFKsGQwkttodhaFUDAGRqXJT4IoZY4C1fyHwaSg+lAlE2xpa2BDynXSNXw/RhU8dS5r/VGOo4EWOUrJlUPHUl24AjXYV7+A8g4MjKBjkdhMbtz5EcV463cC+/Xtu/vr16GQ1UXdaXgvql/30iavR99XvbF6lqAZ/QNnjLBu2h6IImpCMdG/aCO1+PbNujTGM0fMUPACW7RpGRyDzkSt7FnNyDGbvJGIZCPBETCDy/uT6mkf/mAdPxjGJ+rdR67eAGUrPIXQ2Yx9G4cgIQayIKTMcReX6vUYCbvDpnhF9lsFNJHnxne8icnSHwNTPz3Ek5jSjhwgTYBc7X+fBd6inNkFx0dhG3GV9di4A6PVWAhTk6KjiMxFFI+4s2m3frsLOJMp+aqHWUg3qbfazNbkJjHPVfV1oKwY3gaQC2dBgLiadZsqrZdN1GDnXOC5dwC8pkLzP96p2V5PhNDS2ncY44Y4uVjFUqor2t/a1euwq0poG0fzycTJPeqJ3F7M3BuXRSkgAmITOYxi+1/yiOima2oZFZwVAzLBZoFpiZvNCbl9smVfo45KbNM7mdWFnVB5Ceckcbiiw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SLXP216MB0077.KORP216.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230022)(396003)(376002)(39830400003)(136003)(346002)(366004)(451199015)(38100700002)(38350700002)(2616005)(86362001)(478600001)(6486002)(41300700001)(107886003)(52116002)(1076003)(186003)(316002)(6666004)(6506007)(66556008)(110136005)(8676002)(36756003)(66476007)(4326008)(30864003)(2906002)(6512007)(83380400001)(26005)(66946007)(5660300002)(8936002)(44832011)(2004002)(559001)(579004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?L7bZISEYZyjTp+rf8bNmla8pUsaJdZJNYOrTSlNrnaxWqLIry5NaMjttma2z?=
 =?us-ascii?Q?YIlTd0KIXU7MSMHojewoyGp1UjeZIeFusP8WzTlA6L0tImYW3Dv0xedMtvjr?=
 =?us-ascii?Q?aofrUxzxC2lfTrVoFfHlkijiCSlTznhFHOaPFSwikLGwbg/JGqAUi75OkV0W?=
 =?us-ascii?Q?/me+nrI+XnqxDa95Zc8XdAXdrq154bGu20Yeqox6yxmFaakmrPdxwJrx88fH?=
 =?us-ascii?Q?GVQ9j7s4KPNOQ9g2vOan8xda7iqR4WKUpYV/ticxJo4y9Hy+JNF2deIkkelL?=
 =?us-ascii?Q?JmAjGcl/KED7wPtIcjjnBcNenycYsFovBZ+jUtdfSYY0KhUTa3frZTz2I6Zo?=
 =?us-ascii?Q?Fgnpi1Y81I0Oi2Wiw7/irK17SiAojeQVo1M6kvwEJdqGb4x/+rkCoYHCzl+m?=
 =?us-ascii?Q?0qWcRddiqIOcjq1A6k4IsPs6C/BbMWjv8XdZjVrqBPxzFkayTDhQ0Vmy1IHT?=
 =?us-ascii?Q?jm34lNeqxrii3bx4QHWLEgiyyyfTpJxMCf7gzwqaIz7ranSux7zYB1/Yy+A/?=
 =?us-ascii?Q?VZB40NzpgQCdOslSYFhE5novYhJveQNHzHr45E9NY9zs2IGhclROPE5vlwx+?=
 =?us-ascii?Q?T1hMBP+ZOr4FsECL476xajQIfutR8skzgfZq7rOVxUTApkyEjfU7NM7kUYi2?=
 =?us-ascii?Q?NkkXY4wjSYjI/VfpyiurlWmg2J/USOhK2v0a8Z9eeQz9UvPSI8wmWg3foORb?=
 =?us-ascii?Q?cmTHd0FiSa3wZkT3mLhy31wngh31LwnqLAMEjfHFjPQL0UHeTingYfcy6x19?=
 =?us-ascii?Q?CAnfNCjzAzxV+QKK8NPyTPmSgyJr/8Cqp3H+XK+73JFuYVPfnpNv2c0S4IOe?=
 =?us-ascii?Q?VuZa95w9l4xx0HtsQERkKt/un8hHVoubsWAWUUt+o1DeYx51LudwCjA35nJl?=
 =?us-ascii?Q?vsER84C7BmLUrvaUYaOBO2nIhmq9Me4QRWsXRl2KGlNNcvv1Djrn6q7V7qfE?=
 =?us-ascii?Q?3kzqDLbfVzBwHQnJvM2U7aRGSrgVtS2K9AvcKb5neEYrticl6NQY/2qhp4Wd?=
 =?us-ascii?Q?+I5ThUP6Yak7f8ny27rowoV9JUU/6P4p+lnoFVOlPk6YCpRR/PHAt6cFssW2?=
 =?us-ascii?Q?vAaFO0iUJg8KNYBC6imCtCPZu2hySnQ7uxVBymiWs2+z9BXRrCXph0UGd7//?=
 =?us-ascii?Q?+AgQM4aYIoPwD3RE4iok7a6BzOMrqi5dZMMYPbkFBt3U8CcoZE9mP7MAPaus?=
 =?us-ascii?Q?j55yoeV3q7gBI5/jxT7dvp9oYYwc4MmNew1dEAtOBx/wDLS+S5uPhnE1V/Ai?=
 =?us-ascii?Q?nf38Quwsg4PlAPR5BhhQZY/7rjTU7VqrQdsOyjXJJxAmEhQqTHyE6aRbeQbg?=
 =?us-ascii?Q?AOJMghhIlbRt+OqGvdU8dngaIn9ndhA9hsx0x3iv91rcz5mM2sxyzgh6Utpt?=
 =?us-ascii?Q?uWvhvsWSITU8Qvwzq6foZjbhwQ/63QW/L3s8DPvUQ1YTf7ofNXa1Hjp0mVzn?=
 =?us-ascii?Q?1rA7x+H4Zp6F8EfBLyKHCPzwiZJt3I28/h9T+/pG6TBYgkWhA2nrqW2rbrmx?=
 =?us-ascii?Q?X00vIGCXDOAXJfYeIQnO3LShsLBjIv8zo+kQtdWEKPI1UI9bsx6U07f1JwBD?=
 =?us-ascii?Q?vhceT/JjfG0eHzQ8w4kqaHLGxTrO1MT3U+f0R6vB?=
X-OriginatorOrg: irondevice.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ed4c36d0-cc64-4959-416d-08da960dcd32
X-MS-Exchange-CrossTenant-AuthSource: SLXP216MB0077.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2022 04:58:45.3960 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b4849faa-3337-494e-a76a-cb25a3b3d7d1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CU7qbm4CiYCr6LH9U/jnT7ERYabLyCTekfyi5KCojATf9Dt+IGGYVr5/X1Z7kPP+mPigF/qVlhPDLI7zi4S9/4bwGjB38XBi2w+p6QvH2ac=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PU4P216MB1323
Cc: alsa-devel@alsa-project.org, application@irondevice.com,
 Kiseok Jo <kiseok.jo@irondevice.com>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

The Iron Device SMA1303 is a boosted Class-D audio amplifier.

Signed-off-by: Kiseok Jo <kiseok.jo@irondevice.com>
Reviewed-by: Gyuhwa Park <gyuhwa.park@irondevice.com>
---
 sound/soc/codecs/sma1303.c | 2781 ++++++++++--------------------------
 sound/soc/codecs/sma1303.h |    7 +-
 2 files changed, 762 insertions(+), 2026 deletions(-)

diff --git a/sound/soc/codecs/sma1303.c b/sound/soc/codecs/sma1303.c
index cbdfba1ed7cf..03c969a4891e 100644
--- a/sound/soc/codecs/sma1303.c
+++ b/sound/soc/codecs/sma1303.c
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
 /* sma1303.c -- sma1303 ALSA SoC Audio driver
  *
- * Copyright 2019 Iron Device Corporation
+ * Copyright 2022 Iron Device Corporation
  *
  * This program is free software; you can redistribute it and/or modify
  * it under the terms of the GNU General Public License version 2 as
@@ -59,10 +59,15 @@ struct sma1303_pll_match {
 
 struct sma1303_priv {
 	enum sma1303_type devtype;
+	struct device *dev;
 	struct attribute_group *attr_grp;
 	struct kobject *kobj;
 	struct regmap *regmap;
 	struct sma1303_pll_match *pll_matches;
+	struct mutex lock;
+	struct delayed_work check_fault_work;
+	bool amp_power_status;
+	bool usage_status;
 	int num_of_pll_matches;
 	unsigned int sys_clk_id;
 	unsigned int init_vol;
@@ -70,25 +75,15 @@ struct sma1303_priv {
 	unsigned int tdm_slot_rx;
 	unsigned int tdm_slot_tx;
 	unsigned int tsdw_cnt;
-	unsigned int bst_vol_lvl_status;
-	unsigned int flt_vdd_gain_status;
-	bool sdo_bypass_flag;
-	bool amp_power_status;
-	bool force_amp_power_down;
-	bool stereo_two_chip;
-	bool impossible_bst_ctrl;
-	bool fault_reg_flag;
-	struct mutex lock;
-	struct delayed_work check_fault_work;
-	long check_fault_period;
-	long check_fault_status;
 	unsigned int format;
-	struct device *dev;
 	unsigned int rev_num;
 	unsigned int last_over_temp;
 	unsigned int last_ocp_val;
 	unsigned int last_bclk;
 	unsigned int frame_size;
+	unsigned int amp_mode;
+	long check_fault_period;
+	long check_fault_status;
 };
 
 static struct sma1303_pll_match sma1303_pll_matches[] = {
@@ -111,15 +106,15 @@ static const struct reg_default sma1303_reg_def[] = {
 	{ 0x03, 0x11 },
 	{ 0x04, 0x17 },
 	{ 0x09, 0x00 },
-	{ 0x0A, 0x58 },
-	{ 0x0B, 0xD8 },
-	{ 0x0C, 0x8C },
+	{ 0x0A, 0x31 },
+	{ 0x0B, 0x98 },
+	{ 0x0C, 0x84 },
 	{ 0x0D, 0x07 },
-	{ 0x0E, 0xAF },
+	{ 0x0E, 0x3F },
 	{ 0x10, 0x00 },
 	{ 0x11, 0x00 },
 	{ 0x12, 0x00 },
-	{ 0x14, 0x60 },
+	{ 0x14, 0x5C },
 	{ 0x15, 0x01 },
 	{ 0x16, 0x0F },
 	{ 0x17, 0x0F },
@@ -132,38 +127,33 @@ static const struct reg_default sma1303_reg_def[] = {
 	{ 0x25, 0x00 },
 	{ 0x26, 0x04 },
 	{ 0x33, 0x00 },
-	{ 0x34, 0x0C },
 	{ 0x36, 0x92 },
-	{ 0x37, 0x3F },
-	{ 0x38, 0x64 },
-	{ 0x3B, 0x00 },
-	{ 0x3C, 0x00 },
+	{ 0x37, 0x27 },
+	{ 0x3B, 0x5A },
+	{ 0x3C, 0x20 },
 	{ 0x3D, 0x00 },
 	{ 0x3E, 0x03 },
-	{ 0x3F, 0x00 },
+	{ 0x3F, 0x0C },
 	{ 0x8B, 0x07 },
 	{ 0x8C, 0x70 },
 	{ 0x8D, 0x8B },
 	{ 0x8E, 0x6F },
 	{ 0x8F, 0x03 },
-	{ 0x90, 0x31 },
+	{ 0x90, 0x26 },
 	{ 0x91, 0x42 },
-	{ 0x92, 0x80 },
+	{ 0x92, 0xE0 },
 	{ 0x94, 0x35 },
-	{ 0x95, 0x44 },
+	{ 0x95, 0x0C },
 	{ 0x96, 0x42 },
-	{ 0x97, 0x9A },
+	{ 0x97, 0x95 },
 	{ 0xA0, 0x00 },
 	{ 0xA1, 0x3B },
-	{ 0xA2, 0x48 },
+	{ 0xA2, 0xC8 },
 	{ 0xA3, 0x28 },
 	{ 0xA4, 0x40 },
 	{ 0xA5, 0x01 },
 	{ 0xA6, 0x41 },
 	{ 0xA7, 0x00 },
-	{ 0xFA, 0xE0 },
-	{ 0xFB, 0x06 },
-	{ 0xFF, 0x10 },
 };
 
 static bool sma1303_readable_register(struct device *dev, unsigned int reg)
@@ -210,8 +200,8 @@ static bool sma1303_writeable_register(struct device *dev, unsigned int reg)
 	case SMA1303_10_SYSTEM_CTRL1 ... SMA1303_12_SYSTEM_CTRL3:
 	case SMA1303_14_MODULATOR ... SMA1303_1B_BASS_SPK7:
 	case SMA1303_23_COMP_LIM1 ... SMA1303_26_COMP_LIM4:
-	case SMA1303_33_SDM_CTRL ... SMA1303_34_OTP_DATA1:
-	case SMA1303_36_PROTECTION  ... SMA1303_38_OTP_TRM0:
+	case SMA1303_33_SDM_CTRL:
+	case SMA1303_36_PROTECTION  ... SMA1303_37_SLOPE_CTRL:
 	case SMA1303_3B_TEST1  ... SMA1303_3F_ATEST2:
 	case SMA1303_8B_PLL_POST_N ... SMA1303_92_FDPEC_CTRL:
 	case SMA1303_94_BOOST_CTRL1 ... SMA1303_97_BOOST_CTRL4:
@@ -243,6 +233,32 @@ static bool sma1303_volatile_register(struct device *dev, unsigned int reg)
 
 static const DECLARE_TLV_DB_SCALE(sma1303_spk_tlv, -6000, 50, 0);
 
+static int sma1303_regmap_write(struct regmap *map, struct device *dev,
+				unsigned int reg, unsigned int val)
+{
+	int ret = 0;
+
+	ret = regmap_write(map, reg, val);
+	if (ret < 0) {
+		dev_err(dev, "Failed to write, register: 0x%02X, ret: %d\n",
+			       reg, ret);
+	}
+	return ret;
+}
+
+static int sma1303_regmap_update_bits(struct regmap *map, struct device *dev,
+		unsigned int reg, unsigned int mask, unsigned int val)
+{
+	int ret = 0;
+
+	ret = regmap_update_bits(map, reg, mask, val);
+	if (ret < 0) {
+		dev_err(dev, "Failed to write, register: 0x%02X, ret: %d\n",
+			       reg, ret);
+	}
+	return ret;
+}
+
 static int bytes_ext_get(struct snd_kcontrol *kcontrol,
 			struct snd_ctl_elem_value *ucontrol, int reg)
 {
@@ -252,10 +268,25 @@ static int bytes_ext_get(struct snd_kcontrol *kcontrol,
 	struct soc_bytes_ext *params = (void *)kcontrol->private_value;
 	unsigned int i, reg_val;
 	u8 *val;
+	int ret = -1;
 
+	if (component == NULL) {
+		pr_err("%s:component is NULL\n", __func__);
+		return ret;
+	}
+	if (sma1303 == NULL) {
+		pr_err("%s:sma1303 is NULL\n", __func__);
+		return ret;
+	}
 	val = (u8 *)ucontrol->value.bytes.data;
 	for (i = 0; i < params->max; i++) {
-		regmap_read(sma1303->regmap, reg + i, &reg_val);
+		ret = regmap_read(sma1303->regmap, reg + i, &reg_val);
+		if (ret < 0) {
+			dev_err(component->dev,
+				"Failed to read, register: %x ret: %d\n",
+				reg + i, ret);
+			return ret;
+		}
 		if (sizeof(reg_val) > 2)
 			reg_val = cpu_to_le32(reg_val);
 		else
@@ -275,8 +306,16 @@ static int bytes_ext_put(struct snd_kcontrol *kcontrol,
 	struct soc_bytes_ext *params = (void *)kcontrol->private_value;
 	void *data;
 	u8 *val;
-	int i, ret;
+	int i, ret = -1;
 
+	if (component == NULL) {
+		pr_err("%s:component is NULL\n", __func__);
+		return ret;
+	}
+	if (sma1303 == NULL) {
+		pr_err("%s:sma1303 is NULL\n", __func__);
+		return ret;
+	}
 	data = kmemdup(ucontrol->value.bytes.data,
 			params->max, GFP_KERNEL | GFP_DMA);
 	if (!data)
@@ -284,11 +323,10 @@ static int bytes_ext_put(struct snd_kcontrol *kcontrol,
 
 	val = (u8 *)data;
 	for (i = 0; i < params->max; i++) {
-		ret = regmap_write(sma1303->regmap, reg + i, *(val + i));
-		if (ret) {
-			dev_err(component->dev,
-				"configuration fail, register: %x ret: %d\n",
-				reg + i, ret);
+		ret = sma1303_regmap_write(
+				sma1303->regmap, component->dev,
+				reg + i, *(val + i));
+		if (ret < 0) {
 			kfree(data);
 			return ret;
 		}
@@ -298,1831 +336,609 @@ static int bytes_ext_put(struct snd_kcontrol *kcontrol,
 	return 0;
 }
 
-static int power_up_down_control_get(struct snd_kcontrol *kcontrol,
+static int amp_usage_status_get(struct snd_kcontrol *kcontrol,
 		struct snd_ctl_elem_value *ucontrol)
 {
 	struct snd_soc_component *component =
 		snd_soc_kcontrol_component(kcontrol);
 	struct sma1303_priv *sma1303 = snd_soc_component_get_drvdata(component);
+	int ret = -1;
 
-	ucontrol->value.integer.value[0] = sma1303->amp_power_status;
-
-	return 0;
-}
-
-static int power_up_down_control_put(struct snd_kcontrol *kcontrol,
-		struct snd_ctl_elem_value *ucontrol)
-{
-	struct snd_soc_component *component =
-		snd_soc_kcontrol_component(kcontrol);
-	struct sma1303_priv *sma1303 = snd_soc_component_get_drvdata(component);
-	int sel = (int)ucontrol->value.integer.value[0];
+	if (component == NULL) {
+		pr_err("%s:component is NULL\n", __func__);
+		return ret;
+	}
+	if (sma1303 == NULL) {
+		pr_err("%s:sma1303 is NULL\n", __func__);
+		return ret;
+	}
+	ucontrol->value.integer.value[0] = sma1303->usage_status;
 
-	if (sel && !(sma1303->force_amp_power_down))
-		sma1303_startup(component);
+	if (sma1303->usage_status)
+		dev_info(component->dev, "Amplifier Power Control Enabled\n");
 	else
-		sma1303_shutdown(component);
-
-	return 0;
-}
-
-static int power_down_control_get(struct snd_kcontrol *kcontrol,
-		struct snd_ctl_elem_value *ucontrol)
-{
-	struct snd_soc_component *component =
-		snd_soc_kcontrol_component(kcontrol);
-	struct sma1303_priv *sma1303 = snd_soc_component_get_drvdata(component);
-
-	ucontrol->value.integer.value[0] = sma1303->force_amp_power_down;
+		dev_info(component->dev, "Amplifier Power Control Disabled\n");
 
 	return 0;
 }
 
-static int power_down_control_put(struct snd_kcontrol *kcontrol,
+static int amp_usage_status_put(struct snd_kcontrol *kcontrol,
 		struct snd_ctl_elem_value *ucontrol)
 {
 	struct snd_soc_component *component =
 		snd_soc_kcontrol_component(kcontrol);
 	struct sma1303_priv *sma1303 = snd_soc_component_get_drvdata(component);
+	int ret = -1;
 
-	sma1303->force_amp_power_down = ucontrol->value.integer.value[0];
-
-	if (sma1303->force_amp_power_down) {
-		dev_info(component->dev, "%s\n", "Force AMP Power Down");
-		sma1303_shutdown(component);
+	if (component == NULL) {
+		pr_err("%s:component is NULL\n", __func__);
+		return ret;
+	}
+	if (sma1303 == NULL) {
+		pr_err("%s:sma1303 is NULL\n", __func__);
+		return ret;
 	}
 
-	return 0;
-}
-
-static int force_sdo_bypass_get(struct snd_kcontrol *kcontrol,
-		struct snd_ctl_elem_value *ucontrol)
-{
-	struct snd_soc_component *component =
-		snd_soc_kcontrol_component(kcontrol);
-	struct sma1303_priv *sma1303 = snd_soc_component_get_drvdata(component);
-
-	ucontrol->value.integer.value[0] = sma1303->sdo_bypass_flag;
-
-	return 0;
-}
-
-static int force_sdo_bypass_put(struct snd_kcontrol *kcontrol,
-		struct snd_ctl_elem_value *ucontrol)
-{
-	struct snd_soc_component *component =
-		snd_soc_kcontrol_component(kcontrol);
-	struct sma1303_priv *sma1303 = snd_soc_component_get_drvdata(component);
-	int sel = (int)ucontrol->value.integer.value[0];
-
-	sma1303->sdo_bypass_flag = (bool)sel;
-
-	return 0;
-}
-
-static const char * const sma1303_input_format_text[] = {
-	"I2S", "LJ", "Reserved", "Reserved",
-	"RJ_16", "RJ_18", "RJ_20", "RJ_24"};
-
-static const struct soc_enum sma1303_input_format_enum =
-SOC_ENUM_SINGLE_EXT(ARRAY_SIZE(sma1303_input_format_text),
-		sma1303_input_format_text);
-
-static int sma1303_input_format_get(struct snd_kcontrol *kcontrol,
-				struct snd_ctl_elem_value *ucontrol)
-{
-	struct snd_soc_component *component =
-		snd_soc_kcontrol_component(kcontrol);
-	struct sma1303_priv *sma1303 = snd_soc_component_get_drvdata(component);
-	int val;
-
-	regmap_read(sma1303->regmap, SMA1303_01_INPUT1_CTRL1, &val);
-	ucontrol->value.integer.value[0] = ((val & 0x70) >> 4);
-
-	return 0;
-}
-
-static int sma1303_input_format_put(struct snd_kcontrol *kcontrol,
-		struct snd_ctl_elem_value *ucontrol)
-{
-	struct snd_soc_component *component =
-		snd_soc_kcontrol_component(kcontrol);
-	struct sma1303_priv *sma1303 = snd_soc_component_get_drvdata(component);
-	int sel = (int)ucontrol->value.integer.value[0];
+	if ((sma1303->usage_status
+			!= ucontrol->value.integer.value[0])
+			&& (!ucontrol->value.integer.value[0])) {
+		dev_info(component->dev, "%s\n", "Force AMP Power Down");
+		ret = sma1303_shutdown(component);
+		if (ret < 0) {
+			ucontrol->value.integer.value[0]
+			       = sma1303->usage_status;
+			return ret;
+		}
 
-	regmap_update_bits(sma1303->regmap,
-		SMA1303_01_INPUT1_CTRL1, 0x70, (sel << 4));
+	}
+	sma1303->usage_status = ucontrol->value.integer.value[0];
 
 	return 0;
 }
 
-static const char * const sma1303_in_audio_mode_text[] = {
-	"I2S mode", "PCM short", "PCM long", "Reserved"};
-
-static const struct soc_enum sma1303_in_audio_mode_enum =
-SOC_ENUM_SINGLE_EXT(ARRAY_SIZE(sma1303_in_audio_mode_text),
-		sma1303_in_audio_mode_text);
+static const char * const sma1303_amp_mode_text[] = {
+	"1 Chip", "Mono on 2 chips", "Left in 2 chips", "Right in 2chips"};
 
-static int sma1303_in_audio_mode_get(struct snd_kcontrol *kcontrol,
+static const struct soc_enum sma1303_amp_mode_enum =
+	SOC_ENUM_SINGLE_EXT(ARRAY_SIZE(sma1303_amp_mode_text),
+			sma1303_amp_mode_text);
+static int sma1303_amp_mode_get(struct snd_kcontrol *kcontrol,
 				struct snd_ctl_elem_value *ucontrol)
 {
 	struct snd_soc_component *component =
 		snd_soc_kcontrol_component(kcontrol);
 	struct sma1303_priv *sma1303 = snd_soc_component_get_drvdata(component);
-	int val;
+	int ret = -1;
 
-	regmap_read(sma1303->regmap, SMA1303_02_INPUT1_CTRL2, &val);
-	ucontrol->value.integer.value[0] = ((val & 0xC0) >> 6);
+	if (component == NULL) {
+		pr_err("%s:component is NULL\n", __func__);
+		return ret;
+	}
+	if (sma1303 == NULL) {
+		pr_err("%s:sma1303 is NULL\n", __func__);
+		return ret;
+	}
+	ucontrol->value.integer.value[0] = sma1303->amp_mode;
 
+	switch (sma1303->amp_mode) {
+	case ONE_CHIP_SOLUTION:
+		dev_info(component->dev, "Amplifier 1 Chip Solution\n");
+		break;
+	case MONO_TWO_CHIP_SOLUTION:
+		dev_info(component->dev, "Amplifier Mono 2 Chips Solution\n");
+		break;
+	case LEFT_TWO_CHIP_SOLUTION:
+		dev_info(component->dev, "Amplifier Stereo(Left) 2 Chips Solution\n");
+		break;
+	case RIGHT_TWO_CHIP_SOLUTION:
+		dev_info(component->dev, "Amplifier Stereo(Right) 2 Chips Solution\n");
+		break;
+	default:
+		dev_err(component->dev, "Invalid Value");
+		return ret;
+	}
 	return 0;
-}
-
-static int sma1303_in_audio_mode_put(struct snd_kcontrol *kcontrol,
-				struct snd_ctl_elem_value *ucontrol)
-{
-	struct snd_soc_component *component =
-		snd_soc_kcontrol_component(kcontrol);
-	struct sma1303_priv *sma1303 = snd_soc_component_get_drvdata(component);
-	int sel = (int)ucontrol->value.integer.value[0];
-
-	regmap_update_bits(sma1303->regmap,
-		SMA1303_02_INPUT1_CTRL2, 0xC0, (sel << 6));
 
-	return 0;
 }
 
-static const char * const sma1303_pcm_n_slot_text[] = {
-	"Slot_1", "Slot_2", "Slot_3", "Slot_4", "Slot_5", "Slot_6",
-	"Slot_7", "Slot_8", "Slot_9", "Slot_10", "Slot_11", "Slot_12",
-	"Slot_13", "Slot_14", "Slot_15", "Slot_16"};
-
-static const struct soc_enum sma1303_pcm_n_slot_enum =
-SOC_ENUM_SINGLE_EXT(ARRAY_SIZE(sma1303_pcm_n_slot_text),
-		sma1303_pcm_n_slot_text);
-
-static int sma1303_pcm_n_slot_get(struct snd_kcontrol *kcontrol,
-				struct snd_ctl_elem_value *ucontrol)
+static int sma1303_amp_mode_put(struct snd_kcontrol *kcontrol,
+		struct snd_ctl_elem_value *ucontrol)
 {
 	struct snd_soc_component *component =
 		snd_soc_kcontrol_component(kcontrol);
 	struct sma1303_priv *sma1303 = snd_soc_component_get_drvdata(component);
-	int val;
-
-	regmap_read(sma1303->regmap, SMA1303_03_INPUT1_CTRL3, &val);
-	ucontrol->value.integer.value[0] = (val & 0x0F);
+	int ret = 0;
 
-	return 0;
-}
-
-static int sma1303_pcm_n_slot_put(struct snd_kcontrol *kcontrol,
-				struct snd_ctl_elem_value *ucontrol)
-{
-	struct snd_soc_component *component =
-		snd_soc_kcontrol_component(kcontrol);
-	struct sma1303_priv *sma1303 = snd_soc_component_get_drvdata(component);
-	int sel = (int)ucontrol->value.integer.value[0];
+	if (component == NULL) {
+		pr_err("%s:component is NULL\n", __func__);
+		return -1;
+	}
+	if (sma1303 == NULL) {
+		pr_err("%s:sma1303 is NULL\n", __func__);
+		return -1;
+	}
 
-	regmap_update_bits(sma1303->regmap,
-		SMA1303_03_INPUT1_CTRL3, 0x0F, sel);
+	sma1303->amp_mode = ucontrol->value.integer.value[0];
+
+	switch (sma1303->amp_mode) {
+	case ONE_CHIP_SOLUTION:
+	case MONO_TWO_CHIP_SOLUTION:
+		ret += sma1303_regmap_update_bits(
+				sma1303->regmap, component->dev,
+				SMA1303_11_SYSTEM_CTRL2,
+				MONOMIX_MASK, MONOMIX_ON);
+		ret += sma1303_regmap_update_bits(
+				sma1303->regmap, component->dev,
+				SMA1303_11_SYSTEM_CTRL2,
+				LR_DATA_SW_MASK, LR_DATA_SW_NORMAL);
+		break;
+	case LEFT_TWO_CHIP_SOLUTION:
+		ret += sma1303_regmap_update_bits(
+				sma1303->regmap, component->dev,
+				SMA1303_11_SYSTEM_CTRL2,
+				MONOMIX_MASK, MONOMIX_OFF);
+		ret += sma1303_regmap_update_bits(
+				sma1303->regmap, component->dev,
+				SMA1303_11_SYSTEM_CTRL2,
+				LR_DATA_SW_MASK, LR_DATA_SW_NORMAL);
+		break;
+	case RIGHT_TWO_CHIP_SOLUTION:
+		ret += sma1303_regmap_update_bits(
+				sma1303->regmap, component->dev,
+				SMA1303_11_SYSTEM_CTRL2,
+				MONOMIX_MASK, MONOMIX_OFF);
+		ret += sma1303_regmap_update_bits(
+				sma1303->regmap, component->dev,
+				SMA1303_11_SYSTEM_CTRL2,
+				LR_DATA_SW_MASK, LR_DATA_SW_SWAP);
+		break;
+	default:
+		dev_err(component->dev, "Invalid Value");
+		ret += -1;
+	}
 
-	return 0;
+	return ret;
 }
 
-static const char * const sma1303_pcm1_slot_text[] = {
-	"Slot_1", "Slot_2", "Slot_3", "Slot_4", "Slot_5", "Slot_6",
-	"Slot_7", "Slot_8", "Slot_9", "Slot_10", "Slot_11", "Slot_12",
-	"Slot_13", "Slot_14", "Slot_15", "Slot_16"};
-
-static const struct soc_enum sma1303_pcm1_slot_enum =
-SOC_ENUM_SINGLE_EXT(ARRAY_SIZE(sma1303_pcm1_slot_text),
-		sma1303_pcm1_slot_text);
-
-static int sma1303_pcm1_slot_get(struct snd_kcontrol *kcontrol,
-				struct snd_ctl_elem_value *ucontrol)
-{
-	struct snd_soc_component *component =
-		snd_soc_kcontrol_component(kcontrol);
-	struct sma1303_priv *sma1303 = snd_soc_component_get_drvdata(component);
-	int val;
-
-	regmap_read(sma1303->regmap, SMA1303_04_INPUT1_CTRL4, &val);
-	ucontrol->value.integer.value[0] = ((val & 0xF0) >> 4);
+static const char * const sma1303_outport_config_text[] = {
+	"Enable", "Disable"};
 
-	return 0;
-}
+static const struct soc_enum sma1303_outport_config_enum =
+	SOC_ENUM_SINGLE_EXT(ARRAY_SIZE(sma1303_outport_config_text),
+			sma1303_outport_config_text);
 
-static int sma1303_pcm1_slot_put(struct snd_kcontrol *kcontrol,
+static int sma1303_outport_config_get(struct snd_kcontrol *kcontrol,
 				struct snd_ctl_elem_value *ucontrol)
 {
 	struct snd_soc_component *component =
 		snd_soc_kcontrol_component(kcontrol);
 	struct sma1303_priv *sma1303 = snd_soc_component_get_drvdata(component);
-	int sel = (int)ucontrol->value.integer.value[0];
-
-	regmap_update_bits(sma1303->regmap,
-		SMA1303_04_INPUT1_CTRL4, 0xF0, (sel << 4));
-
-	return 0;
-}
-
-static const char * const sma1303_pcm2_slot_text[] = {
-	"Slot_1", "Slot_2", "Slot_3", "Slot_4", "Slot_5", "Slot_6",
-	"Slot_7", "Slot_8", "Slot_9", "Slot_10", "Slot_11", "Slot_12",
-	"Slot_13", "Slot_14", "Slot_15", "Slot_16"};
+	int ret = -1, data, val;
 
-static const struct soc_enum sma1303_pcm2_slot_enum =
-SOC_ENUM_SINGLE_EXT(ARRAY_SIZE(sma1303_pcm2_slot_text),
-		sma1303_pcm2_slot_text);
+	if (component == NULL) {
+		pr_err("%s:component is NULL\n", __func__);
+		return ret;
+	}
+	if (sma1303 == NULL) {
+		pr_err("%s:sma1303 is NULL\n", __func__);
+		return ret;
+	}
 
-static int sma1303_pcm2_slot_get(struct snd_kcontrol *kcontrol,
-				struct snd_ctl_elem_value *ucontrol)
-{
-	struct snd_soc_component *component =
-		snd_soc_kcontrol_component(kcontrol);
-	struct sma1303_priv *sma1303 = snd_soc_component_get_drvdata(component);
-	int val;
+	ret = regmap_read(sma1303->regmap, SMA1303_09_OUTPUT_CTRL, &data);
+	if (ret < 0) {
+		dev_err(component->dev,
+			"Failed to read, register: %x ret: %d\n",
+				SMA1303_09_OUTPUT_CTRL, ret);
+		return ret;
+	}
 
-	regmap_read(sma1303->regmap, SMA1303_04_INPUT1_CTRL4, &val);
-	ucontrol->value.integer.value[0] = (val & 0x0F);
+	val = data & PORT_CONFIG_MASK;
+	switch (val) {
+	case INPUT_PORT_ONLY:
+		ucontrol->value.integer.value[0] = 1;
+		break;
+	case OUTPUT_PORT_ENABLE:
+		ucontrol->value.integer.value[0] = 0;
+		break;
+	default:
+		dev_err(component->dev,
+				"Invalid value, register: %x value: %d\n",
+					SMA1303_09_OUTPUT_CTRL, val);
+		return ret;
+	}
 
 	return 0;
 }
 
-static int sma1303_pcm2_slot_put(struct snd_kcontrol *kcontrol,
+static int sma1303_outport_config_put(struct snd_kcontrol *kcontrol,
 				struct snd_ctl_elem_value *ucontrol)
 {
 	struct snd_soc_component *component =
 		snd_soc_kcontrol_component(kcontrol);
 	struct sma1303_priv *sma1303 = snd_soc_component_get_drvdata(component);
 	int sel = (int)ucontrol->value.integer.value[0];
+	int val, ret = -1;
 
-	regmap_update_bits(sma1303->regmap,
-		SMA1303_04_INPUT1_CTRL4, 0x0F, sel);
-
-	return 0;
-}
-
-static const char * const sma1303_port_config_text[] = {
-	"IN_Port", "Reserved", "OUT_Port", "Reserved"};
-
-static const struct soc_enum sma1303_port_config_enum =
-	SOC_ENUM_SINGLE_EXT(ARRAY_SIZE(sma1303_port_config_text),
-			sma1303_port_config_text);
-
-static int sma1303_port_config_get(struct snd_kcontrol *kcontrol,
-				struct snd_ctl_elem_value *ucontrol)
-{
-	struct snd_soc_component *component =
-		snd_soc_kcontrol_component(kcontrol);
-	struct sma1303_priv *sma1303 = snd_soc_component_get_drvdata(component);
-	int val;
-
-	regmap_read(sma1303->regmap, SMA1303_09_OUTPUT_CTRL, &val);
-	ucontrol->value.integer.value[0] = ((val & 0x60) >> 5);
-
-	return 0;
-}
-
-static int sma1303_port_config_put(struct snd_kcontrol *kcontrol,
-				struct snd_ctl_elem_value *ucontrol)
-{
-	struct snd_soc_component *component =
-		snd_soc_kcontrol_component(kcontrol);
-	struct sma1303_priv *sma1303 = snd_soc_component_get_drvdata(component);
-	int sel = (int)ucontrol->value.integer.value[0];
+	if (component == NULL) {
+		pr_err("%s:component is NULL\n", __func__);
+		return ret;
+	}
+	if (sma1303 == NULL) {
+		pr_err("%s:sma1303 is NULL\n", __func__);
+		return ret;
+	}
 
-	regmap_update_bits(sma1303->regmap,
-		SMA1303_09_OUTPUT_CTRL, 0x60, (sel << 5));
+	switch (sel) {
+	case 0:
+		val = OUTPUT_PORT_ENABLE;
+		break;
+	case 1:
+		val = INPUT_PORT_ONLY;
+		break;
+	default:
+		dev_err(component->dev,
+				"Invalid value, register: %x\n",
+					SMA1303_09_OUTPUT_CTRL);
+		return ret;
+	}
 
-	return 0;
+	return sma1303_regmap_update_bits(sma1303->regmap, component->dev,
+			SMA1303_09_OUTPUT_CTRL, PORT_CONFIG_MASK, val);
 }
 
+static const char * const sma1303_spkmute_text[] = {
+	"Unmute", "Mute"};
 
-static const char * const sma1303_port_out_sel_text[] = {
-	"Disable", "Format_C", "Mixer_out", "After_DSP",
-	"Postscaler", "Reserved", "Reserved", "Reserved"};
-
-static const struct soc_enum sma1303_port_out_sel_enum =
-	SOC_ENUM_SINGLE_EXT(ARRAY_SIZE(sma1303_port_out_sel_text),
-	sma1303_port_out_sel_text);
-
-static int sma1303_port_out_sel_get(struct snd_kcontrol *kcontrol,
-				struct snd_ctl_elem_value *ucontrol)
-{
-	struct snd_soc_component *component =
-		snd_soc_kcontrol_component(kcontrol);
-	struct sma1303_priv *sma1303 = snd_soc_component_get_drvdata(component);
-	int val;
+static const struct soc_enum sma1303_spkmute_enum =
+	SOC_ENUM_SINGLE(SMA1303_0E_MUTE_VOL_CTRL, 0,
+			ARRAY_SIZE(sma1303_spkmute_text),
+			sma1303_spkmute_text);
 
-	regmap_read(sma1303->regmap, SMA1303_09_OUTPUT_CTRL, &val);
-	ucontrol->value.integer.value[0] = (val & 0x07);
+static const char * const sma1303_spkmode_text[] = {
+	"Off", "On"};
 
-	return 0;
-}
+static const struct soc_enum sma1303_spkmode_enum =
+	SOC_ENUM_SINGLE_EXT(ARRAY_SIZE(sma1303_spkmode_text),
+	sma1303_spkmode_text);
 
-static int sma1303_port_out_sel_put(struct snd_kcontrol *kcontrol,
+static int sma1303_spkmode_get(struct snd_kcontrol *kcontrol,
 				struct snd_ctl_elem_value *ucontrol)
 {
 	struct snd_soc_component *component =
 		snd_soc_kcontrol_component(kcontrol);
 	struct sma1303_priv *sma1303 = snd_soc_component_get_drvdata(component);
-	int sel = (int)ucontrol->value.integer.value[0];
-
-	regmap_update_bits(sma1303->regmap,
-		SMA1303_09_OUTPUT_CTRL, 0x07, sel);
-
-	return 0;
-}
+	int val, data, ret = -1;
 
-static const char * const sma1303_bst_off_slope_text[] = {
-	"6.7ns", "4.8ns", "2.6ns", "1.2ns"};
+	if (component == NULL) {
+		pr_err("%s:component is NULL\n", __func__);
+		return ret;
+	}
+	if (sma1303 == NULL) {
+		pr_err("%s:sma1303 is NULL\n", __func__);
+		return ret;
+	}
 
-static const struct soc_enum sma1303_bst_off_slope_enum =
-	SOC_ENUM_SINGLE_EXT(ARRAY_SIZE(sma1303_bst_off_slope_text),
-	sma1303_bst_off_slope_text);
+	ret = regmap_read(sma1303->regmap, SMA1303_10_SYSTEM_CTRL1, &data);
+	if (ret < 0) {
+		dev_err(component->dev,
+			"Failed to read, register: %x ret: %d\n",
+				SMA1303_10_SYSTEM_CTRL1, ret);
+		return ret;
+	}
 
-static int sma1303_bst_off_slope_get(struct snd_kcontrol *kcontrol,
-				struct snd_ctl_elem_value *ucontrol)
-{
-	struct snd_soc_component *component =
-		snd_soc_kcontrol_component(kcontrol);
-	struct sma1303_priv *sma1303 = snd_soc_component_get_drvdata(component);
-	int val;
-
-	regmap_read(sma1303->regmap, SMA1303_0B_BST_TEST, &val);
-	ucontrol->value.integer.value[0] = ((val & 0xC0) >> 6);
-
-	return 0;
-}
-
-static int sma1303_bst_off_slope_put(struct snd_kcontrol *kcontrol,
-				struct snd_ctl_elem_value *ucontrol)
-{
-	struct snd_soc_component *component =
-		snd_soc_kcontrol_component(kcontrol);
-	struct sma1303_priv *sma1303 = snd_soc_component_get_drvdata(component);
-	int sel = (int)ucontrol->value.integer.value[0];
-
-	regmap_update_bits(sma1303->regmap,
-		SMA1303_0B_BST_TEST, 0xC0, (sel << 6));
-
-	return 0;
-}
-
-static const char * const sma1303_set_ocp_h_text[] = {
-	"4.5", "3.2", "2.1", "0.9"};
-
-static const struct soc_enum sma1303_set_ocp_h_enum =
-	SOC_ENUM_SINGLE_EXT(ARRAY_SIZE(sma1303_set_ocp_h_text),
-	sma1303_set_ocp_h_text);
-
-static int sma1303_set_ocp_h_get(struct snd_kcontrol *kcontrol,
-				struct snd_ctl_elem_value *ucontrol)
-{
-	struct snd_soc_component *component =
-		snd_soc_kcontrol_component(kcontrol);
-	struct sma1303_priv *sma1303 = snd_soc_component_get_drvdata(component);
-	int val;
-
-	regmap_read(sma1303->regmap, SMA1303_0C_BST_TEST1, &val);
-	ucontrol->value.integer.value[0] = ((val & 0xC0) >> 6);
-
-	return 0;
-}
-
-static int sma1303_set_ocp_h_put(struct snd_kcontrol *kcontrol,
-				struct snd_ctl_elem_value *ucontrol)
-{
-	struct snd_soc_component *component =
-		snd_soc_kcontrol_component(kcontrol);
-	struct sma1303_priv *sma1303 = snd_soc_component_get_drvdata(component);
-	int sel = (int)ucontrol->value.integer.value[0];
-
-	regmap_update_bits(sma1303->regmap,
-		SMA1303_0C_BST_TEST1, 0xC0, (sel << 6));
-
-	return 0;
-}
-
-static const char * const sma1303_spk_off_slope_text[] = {
-	"00", "01", "10", "11"};
-
-static const struct soc_enum sma1303_spk_off_slope_enum =
-	SOC_ENUM_SINGLE_EXT(ARRAY_SIZE(sma1303_spk_off_slope_text),
-	sma1303_spk_off_slope_text);
-
-static int sma1303_spk_off_slope_get(struct snd_kcontrol *kcontrol,
-				struct snd_ctl_elem_value *ucontrol)
-{
-	struct snd_soc_component *component =
-		snd_soc_kcontrol_component(kcontrol);
-	struct sma1303_priv *sma1303 = snd_soc_component_get_drvdata(component);
-	int val;
-
-	regmap_read(sma1303->regmap, SMA1303_0D_SPK_TEST, &val);
-	ucontrol->value.integer.value[0] = (val & 0x03);
-
-	return 0;
-}
-
-static int sma1303_spk_off_slope_put(struct snd_kcontrol *kcontrol,
-				struct snd_ctl_elem_value *ucontrol)
-{
-	struct snd_soc_component *component =
-		snd_soc_kcontrol_component(kcontrol);
-	struct sma1303_priv *sma1303 = snd_soc_component_get_drvdata(component);
-	int sel = (int)ucontrol->value.integer.value[0];
-
-	regmap_update_bits(sma1303->regmap,
-		SMA1303_0D_SPK_TEST, 0x03, sel);
-
-	return 0;
-}
-
-static const char * const sma1303_vol_slope_text[] = {
-	"Off", "Slow(1sec)", "Medium(0.5sec)",
-	"Fast(0.1sec)"};
-
-static const struct soc_enum sma1303_vol_slope_enum =
-	SOC_ENUM_SINGLE_EXT(ARRAY_SIZE(sma1303_vol_slope_text),
-	sma1303_vol_slope_text);
-
-static int sma1303_vol_slope_get(struct snd_kcontrol *kcontrol,
-				struct snd_ctl_elem_value *ucontrol)
-{
-	struct snd_soc_component *component =
-		snd_soc_kcontrol_component(kcontrol);
-	struct sma1303_priv *sma1303 = snd_soc_component_get_drvdata(component);
-	int val;
-
-	regmap_read(sma1303->regmap, SMA1303_0E_MUTE_VOL_CTRL, &val);
-	ucontrol->value.integer.value[0] = ((val & 0xC0) >> 6);
-
-	return 0;
-}
-
-static int sma1303_vol_slope_put(struct snd_kcontrol *kcontrol,
-				struct snd_ctl_elem_value *ucontrol)
-{
-	struct snd_soc_component *component =
-		snd_soc_kcontrol_component(kcontrol);
-	struct sma1303_priv *sma1303 = snd_soc_component_get_drvdata(component);
-	int sel = (int)ucontrol->value.integer.value[0];
-
-	regmap_update_bits(sma1303->regmap,
-		SMA1303_0E_MUTE_VOL_CTRL, 0xC0, (sel << 6));
-
-	return 0;
-}
-
-static const char * const sma1303_mute_slope_text[] = {
-	"Off", "Slow(200ms)", "Medium(50ms)",
-	"Fast(10ms)"};
-
-static const struct soc_enum sma1303_mute_slope_enum =
-	SOC_ENUM_SINGLE_EXT(ARRAY_SIZE(sma1303_mute_slope_text),
-	sma1303_mute_slope_text);
-
-static int sma1303_mute_slope_get(struct snd_kcontrol *kcontrol,
-				struct snd_ctl_elem_value *ucontrol)
-{
-	struct snd_soc_component *component =
-		snd_soc_kcontrol_component(kcontrol);
-	struct sma1303_priv *sma1303 = snd_soc_component_get_drvdata(component);
-	int val;
-
-	regmap_read(sma1303->regmap, SMA1303_0E_MUTE_VOL_CTRL, &val);
-	ucontrol->value.integer.value[0] = ((val & 0x30) >> 4);
-
-	return 0;
-}
-
-static int sma1303_mute_slope_put(struct snd_kcontrol *kcontrol,
-				struct snd_ctl_elem_value *ucontrol)
-{
-	struct snd_soc_component *component =
-		snd_soc_kcontrol_component(kcontrol);
-	struct sma1303_priv *sma1303 = snd_soc_component_get_drvdata(component);
-	int sel = (int)ucontrol->value.integer.value[0];
-
-	regmap_update_bits(sma1303->regmap,
-		SMA1303_0E_MUTE_VOL_CTRL, 0x30, (sel << 4));
-
-	return 0;
-}
-
-static const char * const sma1303_spkmode_text[] = {
-	"Off", "Mono", "Reserved", "Reserved",
-	"Stereo", "Reserved", "Reserved", "Reserved"};
-
-static const struct soc_enum sma1303_spkmode_enum =
-	SOC_ENUM_SINGLE_EXT(ARRAY_SIZE(sma1303_spkmode_text),
-	sma1303_spkmode_text);
-
-static int sma1303_spkmode_get(struct snd_kcontrol *kcontrol,
-				struct snd_ctl_elem_value *ucontrol)
-{
-	struct snd_soc_component *component =
-		snd_soc_kcontrol_component(kcontrol);
-	struct sma1303_priv *sma1303 = snd_soc_component_get_drvdata(component);
-	int val;
-
-	regmap_read(sma1303->regmap, SMA1303_10_SYSTEM_CTRL1, &val);
-	ucontrol->value.integer.value[0] = ((val & 0x1C) >> 2);
-
-	return 0;
-}
-
-static int sma1303_spkmode_put(struct snd_kcontrol *kcontrol,
-				struct snd_ctl_elem_value *ucontrol)
-{
-	struct snd_soc_component *component =
-		snd_soc_kcontrol_component(kcontrol);
-	struct sma1303_priv *sma1303 = snd_soc_component_get_drvdata(component);
-	int sel = (int)ucontrol->value.integer.value[0];
-
-	regmap_update_bits(sma1303->regmap,
-		SMA1303_10_SYSTEM_CTRL1, 0x1C, (sel << 2));
-
-	if (sel == (SPK_MONO >> 2))
-		sma1303->stereo_two_chip = false;
-	else if (sel == (SPK_STEREO >> 2))
-		sma1303->stereo_two_chip = true;
-
-	return 0;
-}
-
-static const char * const sma1303_input_gain_text[] = {
-	"Gain_0dB", "Gain_M6dB", "Gain_M12dB", "Gain_MInf"};
-
-static const struct soc_enum sma1303_input_gain_enum =
-SOC_ENUM_SINGLE_EXT(ARRAY_SIZE(sma1303_input_gain_text),
-		sma1303_input_gain_text);
-
-static int sma1303_input_gain_get(struct snd_kcontrol *kcontrol,
-				struct snd_ctl_elem_value *ucontrol)
-{
-	struct snd_soc_component *component =
-		snd_soc_kcontrol_component(kcontrol);
-	struct sma1303_priv *sma1303 = snd_soc_component_get_drvdata(component);
-	int val;
-
-	regmap_read(sma1303->regmap, SMA1303_12_SYSTEM_CTRL3, &val);
-	ucontrol->value.integer.value[0] = ((val & 0xC0) >> 6);
-
-	return 0;
-}
-
-static int sma1303_input_gain_put(struct snd_kcontrol *kcontrol,
-				struct snd_ctl_elem_value *ucontrol)
-{
-	struct snd_soc_component *component =
-		snd_soc_kcontrol_component(kcontrol);
-	struct sma1303_priv *sma1303 = snd_soc_component_get_drvdata(component);
-	int sel = (int)ucontrol->value.integer.value[0];
-
-	regmap_update_bits(sma1303->regmap,
-		SMA1303_12_SYSTEM_CTRL3, 0xC0, (sel << 6));
-
-	return 0;
-}
-
-static const char * const sma1303_input_r_gain_text[] = {
-	"Gain_0dB", "Gain_M6dB", "Gain_M12dB", "Gain_MInf"};
-
-static const struct soc_enum sma1303_input_r_gain_enum =
-SOC_ENUM_SINGLE_EXT(ARRAY_SIZE(sma1303_input_r_gain_text),
-		sma1303_input_r_gain_text);
-
-static int sma1303_input_r_gain_get(struct snd_kcontrol *kcontrol,
-				struct snd_ctl_elem_value *ucontrol)
-{
-	struct snd_soc_component *component =
-		snd_soc_kcontrol_component(kcontrol);
-	struct sma1303_priv *sma1303 = snd_soc_component_get_drvdata(component);
-	int val;
-
-	regmap_read(sma1303->regmap, SMA1303_12_SYSTEM_CTRL3, &val);
-	ucontrol->value.integer.value[0] = ((val & 0x30) >> 4);
-
-	return 0;
-}
-
-static int sma1303_input_r_gain_put(struct snd_kcontrol *kcontrol,
-				struct snd_ctl_elem_value *ucontrol)
-{
-	struct snd_soc_component *component =
-		snd_soc_kcontrol_component(kcontrol);
-	struct sma1303_priv *sma1303 = snd_soc_component_get_drvdata(component);
-	int sel = (int)ucontrol->value.integer.value[0];
-
-	regmap_update_bits(sma1303->regmap,
-		SMA1303_12_SYSTEM_CTRL3, 0x30, (sel << 4));
-
-	return 0;
-}
-
-static const char * const sma1303_spk_hysfb_text[] = {
-	"f_625kHz", "f_414kHz", "f_297kHz", "f_226kHz"};
-
-static const struct soc_enum sma1303_spk_hysfb_enum =
-SOC_ENUM_SINGLE_EXT(ARRAY_SIZE(sma1303_spk_hysfb_text), sma1303_spk_hysfb_text);
-
-static int sma1303_spk_hysfb_get(struct snd_kcontrol *kcontrol,
-				struct snd_ctl_elem_value *ucontrol)
-{
-	struct snd_soc_component *component =
-		snd_soc_kcontrol_component(kcontrol);
-	struct sma1303_priv *sma1303 = snd_soc_component_get_drvdata(component);
-	int val;
-
-	regmap_read(sma1303->regmap, SMA1303_14_MODULATOR, &val);
-	ucontrol->value.integer.value[0] = ((val & 0xC0) >> 6);
-
-	return 0;
-}
-
-static int sma1303_spk_hysfb_put(struct snd_kcontrol *kcontrol,
-				struct snd_ctl_elem_value *ucontrol)
-{
-	struct snd_soc_component *component =
-		snd_soc_kcontrol_component(kcontrol);
-	struct sma1303_priv *sma1303 = snd_soc_component_get_drvdata(component);
-	int sel = (int)ucontrol->value.integer.value[0];
-
-	regmap_update_bits(sma1303->regmap,
-		SMA1303_14_MODULATOR, 0xC0, (sel << 6));
-
-	return 0;
-}
-
-static int spk_bdelay_get(struct snd_kcontrol *kcontrol,
-				struct snd_ctl_elem_value *ucontrol)
-{
-	return bytes_ext_get(kcontrol, ucontrol, SMA1303_14_MODULATOR);
-}
-
-static int spk_bdelay_put(struct snd_kcontrol *kcontrol,
-				struct snd_ctl_elem_value *ucontrol)
-{
-	return bytes_ext_put(kcontrol, ucontrol, SMA1303_14_MODULATOR);
-}
-
-static int bass_spk_coeff_get(struct snd_kcontrol *kcontrol,
-				struct snd_ctl_elem_value *ucontrol)
-{
-	return bytes_ext_get(kcontrol, ucontrol, SMA1303_15_BASS_SPK1);
-}
-
-static int bass_spk_coeff_put(struct snd_kcontrol *kcontrol,
-				struct snd_ctl_elem_value *ucontrol)
-{
-	return bytes_ext_put(kcontrol, ucontrol, SMA1303_15_BASS_SPK1);
-}
-
-static int comp_lim_spk_coeff_get(struct snd_kcontrol *kcontrol,
-				struct snd_ctl_elem_value *ucontrol)
-{
-	return bytes_ext_get(kcontrol, ucontrol, SMA1303_23_COMP_LIM1);
-}
-
-static int comp_lim_spk_coeff_put(struct snd_kcontrol *kcontrol,
-				struct snd_ctl_elem_value *ucontrol)
-{
-	return bytes_ext_put(kcontrol, ucontrol, SMA1303_23_COMP_LIM1);
-}
-
-static const char * const sma1303_lr_delay_text[] = {
-	"Delay_00", "Delay_01", "Delay_10", "Delay_11"};
-
-static const struct soc_enum sma1303_lr_delay_enum =
-SOC_ENUM_SINGLE_EXT(ARRAY_SIZE(sma1303_lr_delay_text), sma1303_lr_delay_text);
-
-static int sma1303_lr_delay_get(struct snd_kcontrol *kcontrol,
-				struct snd_ctl_elem_value *ucontrol)
-{
-	struct snd_soc_component *component =
-		snd_soc_kcontrol_component(kcontrol);
-	struct sma1303_priv *sma1303 = snd_soc_component_get_drvdata(component);
-	int val;
-
-	regmap_read(sma1303->regmap, SMA1303_36_PROTECTION, &val);
-	ucontrol->value.integer.value[0] = ((val & 0x60) >> 5);
-
-	return 0;
-}
-
-static int sma1303_lr_delay_put(struct snd_kcontrol *kcontrol,
-				struct snd_ctl_elem_value *ucontrol)
-{
-	struct snd_soc_component *component =
-		snd_soc_kcontrol_component(kcontrol);
-	struct sma1303_priv *sma1303 = snd_soc_component_get_drvdata(component);
-	int sel = (int)ucontrol->value.integer.value[0];
-
-	regmap_update_bits(sma1303->regmap,
-		SMA1303_36_PROTECTION, 0x60, (sel << 5));
-
-	return 0;
-}
-
-static const char * const sma1303_otp_mode_text[] = {
-	"Disable", "I_L1_S_L2", "R_L1_S_L2", "S_L1_S_L2"};
-
-static const struct soc_enum sma1303_otp_mode_enum =
-SOC_ENUM_SINGLE_EXT(ARRAY_SIZE(sma1303_otp_mode_text), sma1303_otp_mode_text);
-
-static int sma1303_otp_mode_get(struct snd_kcontrol *kcontrol,
-				struct snd_ctl_elem_value *ucontrol)
-{
-	struct snd_soc_component *component =
-		snd_soc_kcontrol_component(kcontrol);
-	struct sma1303_priv *sma1303 = snd_soc_component_get_drvdata(component);
-	int val;
-
-	regmap_read(sma1303->regmap, SMA1303_36_PROTECTION, &val);
-	ucontrol->value.integer.value[0] = (val & 0x03);
-
-	return 0;
-}
-
-static int sma1303_otp_mode_put(struct snd_kcontrol *kcontrol,
-				struct snd_ctl_elem_value *ucontrol)
-{
-	struct snd_soc_component *component =
-		snd_soc_kcontrol_component(kcontrol);
-	struct sma1303_priv *sma1303 = snd_soc_component_get_drvdata(component);
-	int sel = (int)ucontrol->value.integer.value[0];
-
-	regmap_update_bits(sma1303->regmap, SMA1303_36_PROTECTION, 0x03, sel);
-
-	return 0;
-}
-
-static int slope_ctrl_get(struct snd_kcontrol *kcontrol,
-				struct snd_ctl_elem_value *ucontrol)
-{
-	return bytes_ext_get(kcontrol, ucontrol, SMA1303_37_SLOPE_CTRL);
-}
-
-static int slope_ctrl_put(struct snd_kcontrol *kcontrol,
-				struct snd_ctl_elem_value *ucontrol)
-{
-	return bytes_ext_put(kcontrol, ucontrol, SMA1303_37_SLOPE_CTRL);
-}
-
-static int test_mode_get(struct snd_kcontrol *kcontrol,
-				struct snd_ctl_elem_value *ucontrol)
-{
-	return bytes_ext_get(kcontrol, ucontrol, SMA1303_3B_TEST1);
-}
-
-static int test_mode_put(struct snd_kcontrol *kcontrol,
-				struct snd_ctl_elem_value *ucontrol)
-{
-	return bytes_ext_put(kcontrol, ucontrol, SMA1303_3B_TEST1);
-}
-
-static int pll_setting_get(struct snd_kcontrol *kcontrol,
-				struct snd_ctl_elem_value *ucontrol)
-{
-	return bytes_ext_get(kcontrol, ucontrol, SMA1303_8B_PLL_POST_N);
-}
-
-static int pll_setting_put(struct snd_kcontrol *kcontrol,
-				struct snd_ctl_elem_value *ucontrol)
-{
-	return bytes_ext_put(kcontrol, ucontrol, SMA1303_8B_PLL_POST_N);
-}
-
-static int pll_pd_ctrl_get(struct snd_kcontrol *kcontrol,
-				struct snd_ctl_elem_value *ucontrol)
-{
-	return bytes_ext_get(kcontrol, ucontrol, SMA1303_8E_PLL_CTRL);
-}
-
-static int pll_pd_ctrl_put(struct snd_kcontrol *kcontrol,
-				struct snd_ctl_elem_value *ucontrol)
-{
-	return bytes_ext_put(kcontrol, ucontrol, SMA1303_8E_PLL_CTRL);
-}
-
-static const char * const sma1303_trm_lvl_text[] = {
-	"On", "Off"};
-
-static const struct soc_enum sma1303_trm_lvl_enum =
-SOC_ENUM_SINGLE_EXT(ARRAY_SIZE(sma1303_trm_lvl_text),
-			sma1303_trm_lvl_text);
-
-static int sma1303_trm_lvl_get(struct snd_kcontrol *kcontrol,
-				struct snd_ctl_elem_value *ucontrol)
-{
-	struct snd_soc_component *component =
-		snd_soc_kcontrol_component(kcontrol);
-	struct sma1303_priv *sma1303 = snd_soc_component_get_drvdata(component);
-	int val;
-
-	regmap_read(sma1303->regmap, SMA1303_8E_PLL_CTRL, &val);
-	ucontrol->value.integer.value[0] = ((val & 0x10) >> 4);
-
-	return 0;
-}
-
-static int sma1303_trm_lvl_put(struct snd_kcontrol *kcontrol,
-				struct snd_ctl_elem_value *ucontrol)
-{
-	struct snd_soc_component *component =
-		snd_soc_kcontrol_component(kcontrol);
-	struct sma1303_priv *sma1303 = snd_soc_component_get_drvdata(component);
-	int sel = (int)ucontrol->value.integer.value[0];
-	int device_info, otp_data;
-
-	regmap_read(sma1303->regmap, SMA1303_34_OTP_DATA1, &otp_data);
-	regmap_read(sma1303->regmap, SMA1303_FF_DEVICE_INDEX, &device_info);
-
-	if (((device_info & 0x03) != REV_NUM_TV0) && (sel == 1))
-		regmap_update_bits(sma1303->regmap,
-			SMA1303_8E_PLL_CTRL, 0x10,
-			(((otp_data & 0x20) >> 5) << 4));
-	else
-		regmap_update_bits(sma1303->regmap,
-			SMA1303_8E_PLL_CTRL, 0x10, 0 << 4);
-
-	return 0;
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
-}
-
-static const char * const sma1303_attack_lvl_text[] = {
-	"BST_ON", "LVL_0.0625FS", "LVL_0.125FS", "LVL_0.1875FS",
-	"LVL_0.25FS", "LVL_0.3125FS", "LVL_0.375FS", "LVL_0.4375FS",
-	"LVL_0.5FS", "LVL_0.5625FS", "LVL_0.625FS", "LVL_0.6875FS",
-	"LVL_0.75FS", "LVL_0.8125FS", "LVL_0.875FS", "BST_OFF"};
-
-static const struct soc_enum sma1303_attack_lvl_enum =
-SOC_ENUM_SINGLE_EXT(ARRAY_SIZE(sma1303_attack_lvl_text),
-		sma1303_attack_lvl_text);
-
-static int sma1303_attack_lvl_get(struct snd_kcontrol *kcontrol,
-				struct snd_ctl_elem_value *ucontrol)
-{
-	struct snd_soc_component *component =
-		snd_soc_kcontrol_component(kcontrol);
-	struct sma1303_priv *sma1303 = snd_soc_component_get_drvdata(component);
-	int val;
-
-	regmap_read(sma1303->regmap, SMA1303_91_CLASS_G_CTRL, &val);
-	ucontrol->value.integer.value[0] = ((val & 0xF0) >> 4);
-
-	return 0;
-}
-
-static int sma1303_attack_lvl_put(struct snd_kcontrol *kcontrol,
-				struct snd_ctl_elem_value *ucontrol)
-{
-	struct snd_soc_component *component =
-		snd_soc_kcontrol_component(kcontrol);
-	struct sma1303_priv *sma1303 = snd_soc_component_get_drvdata(component);
-	int sel = (int)ucontrol->value.integer.value[0];
-
-	regmap_update_bits(sma1303->regmap,
-		SMA1303_91_CLASS_G_CTRL, 0xF0, (sel << 4));
-
-	return 0;
-}
-
-static const char * const sma1303_release_time_text[] = {
-	"Time_0ms", "Time_20ms", "Time_40ms", "Time_60ms",
-	"Time_80ms", "Time_100ms", "Time_120ms", "Time_140ms",
-	"Time_160ms", "Time_180ms", "Time_200ms", "Time_220ms",
-	"Time_240ms", "Time_260ms", "Time_280ms", "Time_300ms"};
-
-static const struct soc_enum sma1303_release_time_enum =
-SOC_ENUM_SINGLE_EXT(ARRAY_SIZE(sma1303_release_time_text),
-		sma1303_release_time_text);
-
-static int sma1303_release_time_get(struct snd_kcontrol *kcontrol,
-				struct snd_ctl_elem_value *ucontrol)
-{
-	struct snd_soc_component *component =
-		snd_soc_kcontrol_component(kcontrol);
-	struct sma1303_priv *sma1303 = snd_soc_component_get_drvdata(component);
-	int val;
-
-	regmap_read(sma1303->regmap, SMA1303_91_CLASS_G_CTRL, &val);
-	ucontrol->value.integer.value[0] = (val & 0x0F);
-
-	return 0;
-}
-
-static int sma1303_release_time_put(struct snd_kcontrol *kcontrol,
-				struct snd_ctl_elem_value *ucontrol)
-{
-	struct snd_soc_component *component =
-		snd_soc_kcontrol_component(kcontrol);
-	struct sma1303_priv *sma1303 = snd_soc_component_get_drvdata(component);
-	int sel = (int)ucontrol->value.integer.value[0];
-
-	regmap_update_bits(sma1303->regmap,
-		SMA1303_91_CLASS_G_CTRL, 0x0F, sel);
-
-	return 0;
-}
-
-static const char * const sma1303_flt_vdd_gain_text[] = {
-	"VDD_2.4V", "VDD_2.45V", "VDD_2.5V", "VDD_2.55V",
-	"VDD_2.6V", "VDD_2.65V", "VDD_2.7V", "VDD_2.75V",
-	"VDD_2.8V", "VDD_2.85V", "VDD_2.9V", "VDD_2.95V",
-	"VDD_3.0V", "VDD_3.05V", "VDD_3.1V", "VDD_3.15V"};
-
-static const struct soc_enum sma1303_flt_vdd_gain_enum =
-SOC_ENUM_SINGLE_EXT(ARRAY_SIZE(sma1303_flt_vdd_gain_text),
-		sma1303_flt_vdd_gain_text);
-
-static int sma1303_flt_vdd_gain_get(struct snd_kcontrol *kcontrol,
-				struct snd_ctl_elem_value *ucontrol)
-{
-	struct snd_soc_component *component =
-		snd_soc_kcontrol_component(kcontrol);
-	struct sma1303_priv *sma1303 = snd_soc_component_get_drvdata(component);
-	int val;
-
-	regmap_read(sma1303->regmap, SMA1303_92_FDPEC_CTRL, &val);
-	ucontrol->value.integer.value[0] = ((val & 0xF0) >> 4);
-
-	return 0;
-}
-
-static int sma1303_flt_vdd_gain_put(struct snd_kcontrol *kcontrol,
-				struct snd_ctl_elem_value *ucontrol)
-{
-	struct snd_soc_component *component =
-		snd_soc_kcontrol_component(kcontrol);
-	struct sma1303_priv *sma1303 = snd_soc_component_get_drvdata(component);
-	int sel = (int)ucontrol->value.integer.value[0];
-
-	sma1303->flt_vdd_gain_status = sel;
-
-	regmap_update_bits(sma1303->regmap,
-		SMA1303_92_FDPEC_CTRL, 0xF0, (sel << 4));
-
-	return 0;
-}
-
-static const char * const sma1303_trm_osc_text[] = {
-	"f_1.4MHz", "f_1.5MHz", "f_1.8MHz", "f_2.0MHz",
-	"f_2.2MHz", "f_2.5MHz", "f_2.7MHz", "f_3.1MHz"};
-
-static const struct soc_enum sma1303_trm_osc_enum =
-SOC_ENUM_SINGLE_EXT(ARRAY_SIZE(sma1303_trm_osc_text), sma1303_trm_osc_text);
-
-static int sma1303_trm_osc_get(struct snd_kcontrol *kcontrol,
-				struct snd_ctl_elem_value *ucontrol)
-{
-	struct snd_soc_component *component =
-		snd_soc_kcontrol_component(kcontrol);
-	struct sma1303_priv *sma1303 = snd_soc_component_get_drvdata(component);
-	int val;
-
-	regmap_read(sma1303->regmap, SMA1303_94_BOOST_CTRL1, &val);
-	ucontrol->value.integer.value[0] = ((val & 0x70) >> 4);
-
-	return 0;
-}
-
-static int sma1303_trm_osc_put(struct snd_kcontrol *kcontrol,
-				struct snd_ctl_elem_value *ucontrol)
-{
-	struct snd_soc_component *component =
-		snd_soc_kcontrol_component(kcontrol);
-	struct sma1303_priv *sma1303 = snd_soc_component_get_drvdata(component);
-	int sel = (int)ucontrol->value.integer.value[0];
-
-	regmap_update_bits(sma1303->regmap,
-		SMA1303_94_BOOST_CTRL1, 0x70, (sel << 4));
-
-	return 0;
-}
-
-static const char * const sma1303_trm_rmp_text[] = {
-	"RMP_0.49A/us", "RMP_0.98A/us", "RMP_1.47A/us", "RMP_1.96A/us",
-	"RMP_2.45A/us", "RMP_2.94A/us", "RMP_3.43A/us", "RMP_3.92A/us"};
-
-static const struct soc_enum sma1303_trm_rmp_enum =
-SOC_ENUM_SINGLE_EXT(ARRAY_SIZE(sma1303_trm_rmp_text), sma1303_trm_rmp_text);
-
-static int sma1303_trm_rmp_get(struct snd_kcontrol *kcontrol,
-				struct snd_ctl_elem_value *ucontrol)
-{
-	struct snd_soc_component *component =
-		snd_soc_kcontrol_component(kcontrol);
-	struct sma1303_priv *sma1303 = snd_soc_component_get_drvdata(component);
-	int val;
-
-	regmap_read(sma1303->regmap, SMA1303_94_BOOST_CTRL1, &val);
-	ucontrol->value.integer.value[0] = (val & 0x07);
-
-	return 0;
-}
-
-static int sma1303_trm_rmp_put(struct snd_kcontrol *kcontrol,
-				struct snd_ctl_elem_value *ucontrol)
-{
-	struct snd_soc_component *component =
-		snd_soc_kcontrol_component(kcontrol);
-	struct sma1303_priv *sma1303 = snd_soc_component_get_drvdata(component);
-	int sel = (int)ucontrol->value.integer.value[0];
-
-	regmap_update_bits(sma1303->regmap,
-		SMA1303_94_BOOST_CTRL1, 0x07, sel);
-
-	return 0;
-}
-
-static const char * const sma1303_trm_ocl_text[] = {
-	"I_2.0A", "I_2.3A", "I_2.6A", "I_2.8A",
-	"I_3.1A", "I_3.4A", "I_3.7A", "I_3.9A"};
-
-static const struct soc_enum sma1303_trm_ocl_enum =
-SOC_ENUM_SINGLE_EXT(ARRAY_SIZE(sma1303_trm_ocl_text), sma1303_trm_ocl_text);
-
-static int sma1303_trm_ocl_get(struct snd_kcontrol *kcontrol,
-				struct snd_ctl_elem_value *ucontrol)
-{
-	struct snd_soc_component *component =
-		snd_soc_kcontrol_component(kcontrol);
-	struct sma1303_priv *sma1303 = snd_soc_component_get_drvdata(component);
-	int val;
-
-	regmap_read(sma1303->regmap, SMA1303_95_BOOST_CTRL2, &val);
-	ucontrol->value.integer.value[0] = ((val & 0x70) >> 4);
-
-	return 0;
-}
-
-static int sma1303_trm_ocl_put(struct snd_kcontrol *kcontrol,
-				struct snd_ctl_elem_value *ucontrol)
-{
-	struct snd_soc_component *component =
-		snd_soc_kcontrol_component(kcontrol);
-	struct sma1303_priv *sma1303 = snd_soc_component_get_drvdata(component);
-	int sel = (int)ucontrol->value.integer.value[0];
-
-	regmap_update_bits(sma1303->regmap,
-		SMA1303_95_BOOST_CTRL2, 0x70, (sel << 4));
-
-	return 0;
-}
-
-static const char * const sma1303_trm_comp_i_text[] = {
-	"IG_30pF", "IG_60pF", "IG_90pF", "IG_120pF"};
-
-static const struct soc_enum sma1303_trm_comp_i_enum =
-SOC_ENUM_SINGLE_EXT(ARRAY_SIZE(sma1303_trm_comp_i_text),
-			sma1303_trm_comp_i_text);
-
-static int sma1303_trm_comp_i_get(struct snd_kcontrol *kcontrol,
-				struct snd_ctl_elem_value *ucontrol)
-{
-	struct snd_soc_component *component =
-		snd_soc_kcontrol_component(kcontrol);
-	struct sma1303_priv *sma1303 = snd_soc_component_get_drvdata(component);
-	int val;
-
-	regmap_read(sma1303->regmap, SMA1303_95_BOOST_CTRL2, &val);
-	ucontrol->value.integer.value[0] = ((val & 0x0C) >> 2);
-
-	return 0;
-}
-
-static int sma1303_trm_comp_i_put(struct snd_kcontrol *kcontrol,
-				struct snd_ctl_elem_value *ucontrol)
-{
-	struct snd_soc_component *component =
-		snd_soc_kcontrol_component(kcontrol);
-	struct sma1303_priv *sma1303 = snd_soc_component_get_drvdata(component);
-	int sel = (int)ucontrol->value.integer.value[0];
-
-	regmap_update_bits(sma1303->regmap,
-		SMA1303_95_BOOST_CTRL2, 0x0C, (sel << 2));
-
-	return 0;
-}
-
-static const char * const sma1303_trm_comp_p_text[] = {
-	"PG_0.5Mohm", "PG_0.375Mohm", "PG_0.25Mohm", "PG_0.125Mohm"};
-
-static const struct soc_enum sma1303_trm_comp_p_enum =
-SOC_ENUM_SINGLE_EXT(ARRAY_SIZE(sma1303_trm_comp_p_text),
-			sma1303_trm_comp_p_text);
-
-static int sma1303_trm_comp_p_get(struct snd_kcontrol *kcontrol,
-				struct snd_ctl_elem_value *ucontrol)
-{
-	struct snd_soc_component *component =
-		snd_soc_kcontrol_component(kcontrol);
-	struct sma1303_priv *sma1303 = snd_soc_component_get_drvdata(component);
-	int val;
-
-	regmap_read(sma1303->regmap, SMA1303_95_BOOST_CTRL2, &val);
-	ucontrol->value.integer.value[0] = (val & 0x03);
-
-	return 0;
-}
-
-static int sma1303_trm_comp_p_put(struct snd_kcontrol *kcontrol,
-				struct snd_ctl_elem_value *ucontrol)
-{
-	struct snd_soc_component *component =
-		snd_soc_kcontrol_component(kcontrol);
-	struct sma1303_priv *sma1303 = snd_soc_component_get_drvdata(component);
-	int sel = (int)ucontrol->value.integer.value[0];
-
-	regmap_update_bits(sma1303->regmap,
-		SMA1303_95_BOOST_CTRL2, 0x03, sel);
-
-	return 0;
-}
-
-static const char * const sma1303_trm_dt_text[] = {
-	"Time_16.0ns", "Time_14.0ns", "Time_12.0ns", "Time_11.0ns",
-	"Time_10.0ns", "Time_9.0ns", "Time_8.0ns", "Time_7.3ns",
-	"Time_6.7ns", "Time_6.2ns", "Time_5.8ns", "Time_5.4ns",
-	"Time_5.1ns", "Time_4.8ns", "Time_2.1ns", "Time_2.1ns"};
-
-static const struct soc_enum sma1303_trm_dt_enum =
-SOC_ENUM_SINGLE_EXT(ARRAY_SIZE(sma1303_trm_dt_text), sma1303_trm_dt_text);
-
-static int sma1303_trm_dt_get(struct snd_kcontrol *kcontrol,
-				struct snd_ctl_elem_value *ucontrol)
-{
-	struct snd_soc_component *component =
-		snd_soc_kcontrol_component(kcontrol);
-	struct sma1303_priv *sma1303 = snd_soc_component_get_drvdata(component);
-	int val;
-
-	regmap_read(sma1303->regmap, SMA1303_96_BOOST_CTRL3, &val);
-	ucontrol->value.integer.value[0] = ((val & 0xF0) >> 4);
-
-	return 0;
-}
-
-static int sma1303_trm_dt_put(struct snd_kcontrol *kcontrol,
-				struct snd_ctl_elem_value *ucontrol)
-{
-	struct snd_soc_component *component =
-		snd_soc_kcontrol_component(kcontrol);
-	struct sma1303_priv *sma1303 = snd_soc_component_get_drvdata(component);
-	int sel = (int)ucontrol->value.integer.value[0];
-
-	regmap_update_bits(sma1303->regmap,
-		SMA1303_96_BOOST_CTRL3, 0xF0, (sel << 4));
-
-	return 0;
-}
-
-static const char * const sma1303_trm_slw_text[] = {
-	"Time_6.7ns", "Time_4.8ns", "Time_2.6ns", "Time_1.2ns"};
-
-static const struct soc_enum sma1303_trm_slw_enum =
-SOC_ENUM_SINGLE_EXT(ARRAY_SIZE(sma1303_trm_slw_text), sma1303_trm_slw_text);
-
-static int sma1303_trm_slw_get(struct snd_kcontrol *kcontrol,
-				struct snd_ctl_elem_value *ucontrol)
-{
-	struct snd_soc_component *component =
-		snd_soc_kcontrol_component(kcontrol);
-	struct sma1303_priv *sma1303 = snd_soc_component_get_drvdata(component);
-	int val;
-
-	regmap_read(sma1303->regmap, SMA1303_96_BOOST_CTRL3, &val);
-	ucontrol->value.integer.value[0] = (val & 0x03);
-
-	return 0;
-}
-
-static int sma1303_trm_slw_put(struct snd_kcontrol *kcontrol,
-				struct snd_ctl_elem_value *ucontrol)
-{
-	struct snd_soc_component *component =
-		snd_soc_kcontrol_component(kcontrol);
-	struct sma1303_priv *sma1303 = snd_soc_component_get_drvdata(component);
-	int sel = (int)ucontrol->value.integer.value[0];
-
-	regmap_update_bits(sma1303->regmap,
-		SMA1303_96_BOOST_CTRL3, 0x03, sel);
-
-	return 0;
-}
-
-static const char * const sma1303_trm_vbst_text[] = {
-	"BST_5.5V", "BST_5.6V", "BST_5.7V", "BST_5.8V",
-	"BST_5.9V", "BST_6.0V", "BST_6.1V", "BST_6.2V"};
-
-static const struct soc_enum sma1303_trm_vbst_enum =
-SOC_ENUM_SINGLE_EXT(ARRAY_SIZE(sma1303_trm_vbst_text), sma1303_trm_vbst_text);
-
-static int sma1303_trm_vbst_get(struct snd_kcontrol *kcontrol,
-				struct snd_ctl_elem_value *ucontrol)
-{
-	struct snd_soc_component *component =
-		snd_soc_kcontrol_component(kcontrol);
-	struct sma1303_priv *sma1303 = snd_soc_component_get_drvdata(component);
-	int val;
-
-	regmap_read(sma1303->regmap, SMA1303_97_BOOST_CTRL4, &val);
-	ucontrol->value.integer.value[0] = ((val & 0x1C) >> 2);
-
-	return 0;
-}
-
-static int sma1303_trm_vbst_put(struct snd_kcontrol *kcontrol,
-				struct snd_ctl_elem_value *ucontrol)
-{
-	struct snd_soc_component *component =
-		snd_soc_kcontrol_component(kcontrol);
-	struct sma1303_priv *sma1303 = snd_soc_component_get_drvdata(component);
-	int sel = (int)ucontrol->value.integer.value[0];
-
-	if (sma1303->impossible_bst_ctrl)
-		dev_info(component->dev,
-		"Trimming of boost voltage does not change on 'impossible-bst-ctrl' property\n");
-	else {
-		sma1303->bst_vol_lvl_status = sel;
-
-		regmap_update_bits(sma1303->regmap,
-			SMA1303_97_BOOST_CTRL4, 0x1C, (sel << 2));
-	}
-
-	return 0;
-}
-
-static const char * const sma1303_trm_tmin_text[] = {
-	"Time_40ns", "Time_80ns", "Time_120ns", "Time_160ns"};
-
-static const struct soc_enum sma1303_trm_tmin_enum =
-SOC_ENUM_SINGLE_EXT(ARRAY_SIZE(sma1303_trm_tmin_text), sma1303_trm_tmin_text);
-
-static int sma1303_trm_tmin_get(struct snd_kcontrol *kcontrol,
-				struct snd_ctl_elem_value *ucontrol)
-{
-	struct snd_soc_component *component =
-		snd_soc_kcontrol_component(kcontrol);
-	struct sma1303_priv *sma1303 = snd_soc_component_get_drvdata(component);
-	int val;
-
-	regmap_read(sma1303->regmap, SMA1303_97_BOOST_CTRL4, &val);
-	ucontrol->value.integer.value[0] = (val & 0x03);
-
-	return 0;
-}
-
-static int sma1303_trm_tmin_put(struct snd_kcontrol *kcontrol,
-				struct snd_ctl_elem_value *ucontrol)
-{
-	struct snd_soc_component *component =
-		snd_soc_kcontrol_component(kcontrol);
-	struct sma1303_priv *sma1303 = snd_soc_component_get_drvdata(component);
-	int sel = (int)ucontrol->value.integer.value[0];
-
-	regmap_update_bits(sma1303->regmap,
-		SMA1303_97_BOOST_CTRL4, 0x03, sel);
-
-	return 0;
-}
-
-static const char * const sma1303_pll_div_text[] = {
-	"PLL_OUT", "PLL_OUT/2", "PLL_OUT/4", "PLL_OUT/8"};
-
-static const struct soc_enum sma1303_pll_div_enum =
-SOC_ENUM_SINGLE_EXT(ARRAY_SIZE(sma1303_pll_div_text), sma1303_pll_div_text);
-
-static int sma1303_pll_div_get(struct snd_kcontrol *kcontrol,
-				struct snd_ctl_elem_value *ucontrol)
-{
-	struct snd_soc_component *component =
-		snd_soc_kcontrol_component(kcontrol);
-	struct sma1303_priv *sma1303 = snd_soc_component_get_drvdata(component);
-	int val;
-
-	regmap_read(sma1303->regmap, SMA1303_A2_TOP_MAN1, &val);
-	ucontrol->value.integer.value[0] = ((val & 0x30) >> 4);
-
-	return 0;
-}
-
-static int sma1303_pll_div_put(struct snd_kcontrol *kcontrol,
-				struct snd_ctl_elem_value *ucontrol)
-{
-	struct snd_soc_component *component =
-		snd_soc_kcontrol_component(kcontrol);
-	struct sma1303_priv *sma1303 = snd_soc_component_get_drvdata(component);
-	int sel = (int)ucontrol->value.integer.value[0];
-
-	regmap_update_bits(sma1303->regmap,
-		SMA1303_A2_TOP_MAN1, 0x30, (sel << 4));
-
-	return 0;
-}
-
-static const char * const sma1303_o_format_text[] = {
-	"Reserved", "LJ", "I2S", "Reserved",
-	"TDM", "Reserved", "Reserved", "Reserved"};
-
-static const struct soc_enum sma1303_o_format_enum =
-SOC_ENUM_SINGLE_EXT(ARRAY_SIZE(sma1303_o_format_text), sma1303_o_format_text);
-
-static int sma1303_o_format_get(struct snd_kcontrol *kcontrol,
-				struct snd_ctl_elem_value *ucontrol)
-{
-	struct snd_soc_component *component =
-		snd_soc_kcontrol_component(kcontrol);
-	struct sma1303_priv *sma1303 = snd_soc_component_get_drvdata(component);
-	int val;
-
-	regmap_read(sma1303->regmap, SMA1303_A4_TOP_MAN3, &val);
-	ucontrol->value.integer.value[0] = ((val & 0xE0) >> 5);
-
-	return 0;
-}
-
-static int sma1303_o_format_put(struct snd_kcontrol *kcontrol,
-				struct snd_ctl_elem_value *ucontrol)
-{
-	struct snd_soc_component *component =
-		snd_soc_kcontrol_component(kcontrol);
-	struct sma1303_priv *sma1303 = snd_soc_component_get_drvdata(component);
-	int sel = (int)ucontrol->value.integer.value[0];
-
-	regmap_update_bits(sma1303->regmap,
-		SMA1303_A4_TOP_MAN3, 0xE0, (sel << 5));
-
-	return 0;
-}
-
-static const char * const sma1303_sck_rate_text[] = {
-	"fs_64", "fs_64", "fs_32", "fs_32"};
-
-static const struct soc_enum sma1303_sck_rate_enum =
-SOC_ENUM_SINGLE_EXT(ARRAY_SIZE(sma1303_sck_rate_text), sma1303_sck_rate_text);
-
-static int sma1303_sck_rate_get(struct snd_kcontrol *kcontrol,
-				struct snd_ctl_elem_value *ucontrol)
-{
-	struct snd_soc_component *component =
-		snd_soc_kcontrol_component(kcontrol);
-	struct sma1303_priv *sma1303 = snd_soc_component_get_drvdata(component);
-	int val;
-
-	regmap_read(sma1303->regmap, SMA1303_A4_TOP_MAN3, &val);
-	ucontrol->value.integer.value[0] = ((val & 0x18) >> 3);
-
-	return 0;
-}
-
-static int sma1303_sck_rate_put(struct snd_kcontrol *kcontrol,
-				struct snd_ctl_elem_value *ucontrol)
-{
-	struct snd_soc_component *component =
-		snd_soc_kcontrol_component(kcontrol);
-	struct sma1303_priv *sma1303 = snd_soc_component_get_drvdata(component);
-	int sel = (int)ucontrol->value.integer.value[0];
-
-	regmap_update_bits(sma1303->regmap,
-		SMA1303_A4_TOP_MAN3, 0x18, (sel << 3));
-
-	return 0;
-}
-
-static const char * const sma1303_tdm_slot1_rx_text[] = {
-	"0", "1", "2", "3", "4", "5", "6", "7"};
-
-static const struct soc_enum sma1303_tdm_slot1_rx_enum =
-	SOC_ENUM_SINGLE_EXT(ARRAY_SIZE(sma1303_tdm_slot1_rx_text),
-		sma1303_tdm_slot1_rx_text);
-
-static int sma1303_tdm_slot1_rx_get(struct snd_kcontrol *kcontrol,
-				struct snd_ctl_elem_value *ucontrol)
-{
-	struct snd_soc_component *component =
-		snd_soc_kcontrol_component(kcontrol);
-	struct sma1303_priv *sma1303 = snd_soc_component_get_drvdata(component);
-	int val;
-
-	regmap_read(sma1303->regmap, SMA1303_A5_TDM1, &val);
-	ucontrol->value.integer.value[0] = ((val & 0x38) >> 3);
-
-	return 0;
-}
-
-static int sma1303_tdm_slot1_rx_put(struct snd_kcontrol *kcontrol,
-				struct snd_ctl_elem_value *ucontrol)
-{
-	struct snd_soc_component *component =
-		snd_soc_kcontrol_component(kcontrol);
-	struct sma1303_priv *sma1303 = snd_soc_component_get_drvdata(component);
-	int sel = (int)ucontrol->value.integer.value[0];
-
-	regmap_update_bits(sma1303->regmap,
-		SMA1303_A5_TDM1, 0x38, (sel << 3));
-
-	return 0;
-}
-
-static const char * const sma1303_tdm_slot2_rx_text[] = {
-	"0", "1", "2", "3", "4", "5", "6", "7"};
-
-static const struct soc_enum sma1303_tdm_slot2_rx_enum =
-	SOC_ENUM_SINGLE_EXT(ARRAY_SIZE(sma1303_tdm_slot2_rx_text),
-		sma1303_tdm_slot2_rx_text);
-
-static int sma1303_tdm_slot2_rx_get(struct snd_kcontrol *kcontrol,
-				struct snd_ctl_elem_value *ucontrol)
-{
-	struct snd_soc_component *component =
-		snd_soc_kcontrol_component(kcontrol);
-	struct sma1303_priv *sma1303 = snd_soc_component_get_drvdata(component);
-	int val;
-
-	regmap_read(sma1303->regmap, SMA1303_A5_TDM1, &val);
-	ucontrol->value.integer.value[0] = ((val & 0x07) >> 0);
-
-	return 0;
-}
-
-static int sma1303_tdm_slot2_rx_put(struct snd_kcontrol *kcontrol,
-				struct snd_ctl_elem_value *ucontrol)
-{
-	struct snd_soc_component *component =
-		snd_soc_kcontrol_component(kcontrol);
-	struct sma1303_priv *sma1303 = snd_soc_component_get_drvdata(component);
-	int sel = (int)ucontrol->value.integer.value[0];
-
-	regmap_update_bits(sma1303->regmap,
-		SMA1303_A5_TDM1, 0x07, (sel << 0));
+	val = data & SPK_MODE_MASK;
+	if (sma1303->amp_mode == ONE_CHIP_SOLUTION) {
+		switch (val) {
+		case SPK_OFF:
+			ucontrol->value.integer.value[0] = 0;
+			break;
+		case SPK_MONO:
+			ucontrol->value.integer.value[0] = 1;
+			break;
+		default:
+			dev_err(component->dev,
+				"Invalid value, register: %x\n",
+					SMA1303_10_SYSTEM_CTRL1);
+			return ret;
+		}
+	} else {
+		switch (val) {
+		case SPK_OFF:
+			ucontrol->value.integer.value[0] = 0;
+			break;
+		case SPK_STEREO:
+			ucontrol->value.integer.value[0] = 1;
+			break;
+		default:
+			dev_err(component->dev,
+				"Invalid value, register: %x\n",
+					SMA1303_10_SYSTEM_CTRL1);
+			return ret;
+		}
+	}
 
 	return 0;
 }
 
-static const char * const sma1303_tdm_slot1_tx_text[] = {
-	"0", "1", "2", "3", "4", "5", "6", "7"};
-
-static const struct soc_enum sma1303_tdm_slot1_tx_enum =
-	SOC_ENUM_SINGLE_EXT(ARRAY_SIZE(sma1303_tdm_slot1_tx_text),
-			sma1303_tdm_slot1_tx_text);
-
-static int sma1303_tdm_slot1_tx_get(struct snd_kcontrol *kcontrol,
+static int sma1303_spkmode_put(struct snd_kcontrol *kcontrol,
 				struct snd_ctl_elem_value *ucontrol)
 {
 	struct snd_soc_component *component =
 		snd_soc_kcontrol_component(kcontrol);
 	struct sma1303_priv *sma1303 = snd_soc_component_get_drvdata(component);
-	int val;
+	int sel = (int)ucontrol->value.integer.value[0];
+	int val, ret = -1;
 
-	regmap_read(sma1303->regmap, SMA1303_A6_TDM2, &val);
-	ucontrol->value.integer.value[0] = ((val & 0x38) >> 3);
+	if (component == NULL) {
+		pr_err("%s:component is NULL\n", __func__);
+		return ret;
+	}
+	if (sma1303 == NULL) {
+		pr_err("%s:sma1303 is NULL\n", __func__);
+		return ret;
+	}
 
-	return 0;
+	switch (sel) {
+	case 0:
+		val = SPK_OFF;
+		break;
+	case 1:
+		if (sma1303->amp_mode == ONE_CHIP_SOLUTION)
+			val = SPK_MONO;
+		else
+			val = SPK_STEREO;
+		break;
+	default:
+		dev_err(component->dev,
+			"Invalid value, register: %x\n",
+				SMA1303_10_SYSTEM_CTRL1);
+		return ret;
+	}
+
+	return sma1303_regmap_update_bits(sma1303->regmap, component->dev,
+			SMA1303_10_SYSTEM_CTRL1, SPK_MODE_MASK, val);
 }
 
-static int sma1303_tdm_slot1_tx_put(struct snd_kcontrol *kcontrol,
+static int postscaler_get(struct snd_kcontrol *kcontrol,
 				struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component =
-		snd_soc_kcontrol_component(kcontrol);
-	struct sma1303_priv *sma1303 = snd_soc_component_get_drvdata(component);
-	int sel = (int)ucontrol->value.integer.value[0];
-
-	regmap_update_bits(sma1303->regmap,
-		SMA1303_A6_TDM2, 0x38, (sel << 3));
+	return bytes_ext_get(kcontrol, ucontrol, SMA1303_90_POSTSCALER);
+}
 
-	return 0;
+static int postscaler_put(struct snd_kcontrol *kcontrol,
+	struct snd_ctl_elem_value *ucontrol)
+{
+	return bytes_ext_put(kcontrol, ucontrol, SMA1303_90_POSTSCALER);
 }
 
-static const char * const sma1303_tdm_slot2_tx_text[] = {
-	"0", "1", "2", "3", "4", "5", "6", "7"};
+static const char * const sma1303_postscaler_config_text[] = {
+	"Enable", "Disable"};
 
-static const struct soc_enum sma1303_tdm_slot2_tx_enum =
-	SOC_ENUM_SINGLE_EXT(ARRAY_SIZE(sma1303_tdm_slot2_tx_text),
-			sma1303_tdm_slot2_tx_text);
+static const struct soc_enum sma1303_postscaler_config_enum =
+	SOC_ENUM_SINGLE_EXT(ARRAY_SIZE(sma1303_postscaler_config_text),
+			sma1303_postscaler_config_text);
 
-static int sma1303_tdm_slot2_tx_get(struct snd_kcontrol *kcontrol,
+static int sma1303_postscaler_config_get(struct snd_kcontrol *kcontrol,
 				struct snd_ctl_elem_value *ucontrol)
 {
 	struct snd_soc_component *component =
 		snd_soc_kcontrol_component(kcontrol);
 	struct sma1303_priv *sma1303 = snd_soc_component_get_drvdata(component);
-	int val;
+	int ret = -1, data, val;
 
-	regmap_read(sma1303->regmap, SMA1303_A6_TDM2, &val);
-	ucontrol->value.integer.value[0] = ((val & 0x07) >> 0);
+	if (component == NULL) {
+		pr_err("%s:component is NULL\n", __func__);
+		return ret;
+	}
+	if (sma1303 == NULL) {
+		pr_err("%s:sma1303 is NULL\n", __func__);
+		return ret;
+	}
+
+	ret = regmap_read(sma1303->regmap, SMA1303_90_POSTSCALER, &data);
+	if (ret < 0) {
+		dev_err(component->dev,
+			"Failed to read, register: %x ret: %d\n",
+				SMA1303_90_POSTSCALER, ret);
+		return ret;
+	}
+
+	val = data & BYP_POST_MASK;
+	switch (val) {
+	case BYP_POST_SCALER:
+		ucontrol->value.integer.value[0] = 1;
+		break;
+	case EN_POST_SCALER:
+		ucontrol->value.integer.value[0] = 0;
+		break;
+	default:
+		dev_err(component->dev,
+				"Invalid value, register: %x value: %d\n",
+					SMA1303_90_POSTSCALER, val);
+		return ret;
+	}
 
 	return 0;
 }
 
-static int sma1303_tdm_slot2_tx_put(struct snd_kcontrol *kcontrol,
+static int sma1303_postscaler_config_put(struct snd_kcontrol *kcontrol,
 				struct snd_ctl_elem_value *ucontrol)
 {
 	struct snd_soc_component *component =
 		snd_soc_kcontrol_component(kcontrol);
 	struct sma1303_priv *sma1303 = snd_soc_component_get_drvdata(component);
 	int sel = (int)ucontrol->value.integer.value[0];
+	int val, ret = -1;
+
+	if (component == NULL) {
+		pr_err("%s:component is NULL\n", __func__);
+		return ret;
+	}
+	if (sma1303 == NULL) {
+		pr_err("%s:sma1303 is NULL\n", __func__);
+		return ret;
+	}
 
-	regmap_update_bits(sma1303->regmap,
-		SMA1303_A6_TDM2, 0x07, (sel << 0));
+	switch (sel) {
+	case 0:
+		val = EN_POST_SCALER;
+		break;
+	case 1:
+		val = BYP_POST_SCALER;
+		break;
+	default:
+		dev_err(component->dev,
+				"Invalid value, register: %x\n",
+					SMA1303_90_POSTSCALER);
+		return ret;
+	}
 
-	return 0;
+	return sma1303_regmap_update_bits(sma1303->regmap, component->dev,
+			SMA1303_90_POSTSCALER, BYP_POST_MASK, val);
 }
 
-static const char * const sma1303_clk_mon_time_sel_text[] = {
-	"Time_80us", "Time_40us", "Time_20us", "Time_10us"};
+static const char * const sma1303_o_format_text[] = {
+	"LJ", "I2S", "TDM"};
 
-static const struct soc_enum sma1303_clk_mon_time_sel_enum =
-	SOC_ENUM_SINGLE_EXT(ARRAY_SIZE(sma1303_clk_mon_time_sel_text),
-			sma1303_clk_mon_time_sel_text);
+static const struct soc_enum sma1303_o_format_enum =
+SOC_ENUM_SINGLE_EXT(ARRAY_SIZE(sma1303_o_format_text), sma1303_o_format_text);
 
-static int sma1303_clk_mon_time_sel_get(struct snd_kcontrol *kcontrol,
+static int sma1303_o_format_get(struct snd_kcontrol *kcontrol,
 				struct snd_ctl_elem_value *ucontrol)
 {
 	struct snd_soc_component *component =
 		snd_soc_kcontrol_component(kcontrol);
 	struct sma1303_priv *sma1303 = snd_soc_component_get_drvdata(component);
-	int val;
+	int val, data, ret = -1;
+
+	if (component == NULL) {
+		pr_err("%s:component is NULL\n", __func__);
+		return ret;
+	}
+	if (sma1303 == NULL) {
+		pr_err("%s:sma1303 is NULL\n", __func__);
+		return ret;
+	}
 
-	regmap_read(sma1303->regmap, SMA1303_A7_CLK_MON, &val);
-	ucontrol->value.integer.value[0] = ((val & 0xC0) >> 6);
+	ret = regmap_read(sma1303->regmap, SMA1303_A4_TOP_MAN3, &data);
+	val = data & O_FORMAT_MASK;
+	switch (val) {
+	case O_FMT_LJ:
+		ucontrol->value.integer.value[0] = 0;
+		break;
+	case O_FMT_I2S:
+		ucontrol->value.integer.value[0] = 1;
+		break;
+	case O_FMT_TDM:
+		ucontrol->value.integer.value[0] = 2;
+		break;
+	default:
+		dev_err(component->dev,
+			"Invalid value, register: %x\n",
+				SMA1303_A4_TOP_MAN3);
+		return ret;
+	}
 
 	return 0;
 }
-
-static int sma1303_clk_mon_time_sel_put(struct snd_kcontrol *kcontrol,
+static int sma1303_o_format_put(struct snd_kcontrol *kcontrol,
 				struct snd_ctl_elem_value *ucontrol)
 {
 	struct snd_soc_component *component =
 		snd_soc_kcontrol_component(kcontrol);
 	struct sma1303_priv *sma1303 = snd_soc_component_get_drvdata(component);
 	int sel = (int)ucontrol->value.integer.value[0];
+	int val, ret = -1;
+
+	if (component == NULL) {
+		pr_err("%s:component is NULL\n", __func__);
+		return ret;
+	}
+	if (sma1303 == NULL) {
+		pr_err("%s:sma1303 is NULL\n", __func__);
+		return ret;
+	}
 
-	regmap_update_bits(sma1303->regmap,
-		SMA1303_A7_CLK_MON, 0xC0, (sel << 6));
+	switch (sel) {
+	case 0:
+		val = O_FMT_LJ;
+		break;
+	case 1:
+		val = O_FMT_I2S;
+		break;
+	case 2:
+		val = O_FMT_TDM;
+		break;
+	default:
+		dev_err(component->dev,
+			"Invalid value, register: %x\n",
+				SMA1303_A4_TOP_MAN3);
+		return ret;
+	}
 
-	return 0;
-}
+	return sma1303_regmap_update_bits(sma1303->regmap, component->dev,
+			SMA1303_A4_TOP_MAN3, O_FORMAT_MASK, val);
+}
+
+static const char * const sma1303_sdo_source_texts[] = {
+	"Disable", "Format_C", "Mixer_Out", "After_DSP", "After_Post"};
+static const unsigned int sma1303_sdo_source_values[] = {
+	OUT_SEL_DISABLE,
+	FORMAT_CONVERTER,
+	MIXER_OUTPUT,
+	SPEAKER_PATH,
+	POSTSCALER_OUTPUT};
+static SOC_VALUE_ENUM_SINGLE_DECL(sma1303_sdo_source_enum,
+		SMA1303_09_OUTPUT_CTRL,
+		0, PORT_OUT_SEL_MASK,
+		sma1303_sdo_source_texts,
+		sma1303_sdo_source_values);
+static const struct snd_kcontrol_new sma1303_sdo_source_mux =
+	SOC_DAPM_ENUM("SDO Source", sma1303_sdo_source_enum);
 
 static const struct snd_kcontrol_new sma1303_snd_controls[] = {
-SOC_SINGLE("I2C Reg Reset(1:reset_0:normal)",
-		SMA1303_00_SYSTEM_CTRL, 1, 1, 0),
-SOC_SINGLE_EXT("Power Up(1:Up_0:Down)", SND_SOC_NOPM, 0, 1, 0,
-	power_up_down_control_get, power_up_down_control_put),
-SOC_SINGLE_EXT("Force AMP Power Down", SND_SOC_NOPM, 0, 1, 0,
-	power_down_control_get, power_down_control_put),
-SOC_SINGLE_EXT("Force SDO Bypass", SND_SOC_NOPM, 0, 1, 0,
-	force_sdo_bypass_get, force_sdo_bypass_put),
-SOC_SINGLE("I2S/PCM Clock mode(1:M_2:S)",
-		SMA1303_01_INPUT1_CTRL1, 7, 1, 0),
-SOC_ENUM_EXT("I2S input format(I2S_LJ_RJ)", sma1303_input_format_enum,
-	sma1303_input_format_get, sma1303_input_format_put),
-SOC_SINGLE("First-channel pol I2S(1:H_0:L)",
-		SMA1303_01_INPUT1_CTRL1, 3, 1, 0),
-SOC_SINGLE("Data written SCK edge(1:R_0:F)",
-		SMA1303_01_INPUT1_CTRL1, 2, 1, 0),
-SOC_ENUM_EXT("Input audio mode", sma1303_in_audio_mode_enum,
-	sma1303_in_audio_mode_get, sma1303_in_audio_mode_put),
-SOC_SINGLE("Data inversion(1:R_0:L)",
-		SMA1303_02_INPUT1_CTRL2, 5, 1, 0),
-SOC_SINGLE("Decoding select(1:A_0:u)",
-		SMA1303_02_INPUT1_CTRL2, 4, 1, 0),
-SOC_SINGLE("Companding PCM data(1:C_2:L)",
-		SMA1303_02_INPUT1_CTRL2, 3, 1, 0),
-SOC_SINGLE("PCM sample freq(1:16kHz_0:8kHz)",
-		SMA1303_02_INPUT1_CTRL2, 2, 1, 0),
-SOC_SINGLE("PCM stereo/mono(1:S_0:M)",
-		SMA1303_02_INPUT1_CTRL2, 1, 1, 0),
-SOC_SINGLE("PCM data length(1:16_0:8)",
-		SMA1303_02_INPUT1_CTRL2, 0, 1, 0),
-SOC_ENUM_EXT("Number of slots per sampling period(PCM)",
-		sma1303_pcm_n_slot_enum, sma1303_pcm_n_slot_get,
-		sma1303_pcm_n_slot_put),
-SOC_ENUM_EXT("Position of the first sample at 8,16kHz",
-		sma1303_pcm1_slot_enum, sma1303_pcm1_slot_get,
-		sma1303_pcm1_slot_put),
-SOC_ENUM_EXT("Position of the second sample at 16kHz",
-		sma1303_pcm2_slot_enum, sma1303_pcm2_slot_get,
-		sma1303_pcm2_slot_put),
-SOC_ENUM_EXT("Port In/Out port config", sma1303_port_config_enum,
-	sma1303_port_config_get, sma1303_port_config_put),
-SOC_ENUM_EXT("Port Output Source", sma1303_port_out_sel_enum,
-	sma1303_port_out_sel_get, sma1303_port_out_sel_put),
+SOC_SINGLE_EXT("Amplifier Usage", SND_SOC_NOPM, 0, 1, 0,
+	amp_usage_status_get, amp_usage_status_put),
+SOC_ENUM_EXT("Amplifier Mode", sma1303_amp_mode_enum,
+	sma1303_amp_mode_get, sma1303_amp_mode_put),
+SOC_ENUM_EXT("Outport config", sma1303_outport_config_enum,
+	sma1303_outport_config_get, sma1303_outport_config_put),
 SOC_SINGLE_TLV("Speaker Volume", SMA1303_0A_SPK_VOL,
 		0, 167, 1, sma1303_spk_tlv),
-SOC_ENUM_EXT("BST Turn-off slope", sma1303_bst_off_slope_enum,
-	sma1303_bst_off_slope_get, sma1303_bst_off_slope_put),
-SOC_SINGLE("OCP Test(1:test_0:normal)",
-		SMA1303_0B_BST_TEST, 5, 1, 0),
-SOC_SINGLE("LEB(1:long_0:short)",
-		SMA1303_0B_BST_TEST, 4, 1, 0),
-SOC_SINGLE("P-Gain sel(1:normal_0:high)",
-		SMA1303_0B_BST_TEST, 3, 1, 0),
-SOC_SINGLE("VCOMP Mon(1:mon_0:normal)",
-		SMA1303_0B_BST_TEST, 2, 1, 0),
-SOC_SINGLE("PMOS Test(1:pmos_0:normal)",
-		SMA1303_0B_BST_TEST, 1, 1, 0),
-SOC_SINGLE("NMOS Test(1:nmos_0:normal)",
-		SMA1303_0B_BST_TEST, 0, 1, 0),
-SOC_ENUM_EXT("High Side OCP lvl", sma1303_set_ocp_h_enum,
-	sma1303_set_ocp_h_get, sma1303_set_ocp_h_put),
-SOC_SINGLE("OCL Test(1:test_0:normal)",
-		SMA1303_0C_BST_TEST1, 5, 1, 0),
-SOC_SINGLE("Loop Check(1:en_0:normal)",
-		SMA1303_0C_BST_TEST1, 4, 1, 0),
-SOC_SINGLE("SH Protection(1:en_0:dis)",
-		SMA1303_0C_BST_TEST1, 3, 1, 0),
-SOC_SINGLE("SPK OCP filter delay(1:Normal_0:Long)",
-		SMA1303_0D_SPK_TEST, 2, 1, 0),
-SOC_ENUM_EXT("SPK turn off slope control", sma1303_spk_off_slope_enum,
-	sma1303_spk_off_slope_get, sma1303_spk_off_slope_put),
-SOC_ENUM_EXT("Volume slope", sma1303_vol_slope_enum,
-	sma1303_vol_slope_get, sma1303_vol_slope_put),
-SOC_ENUM_EXT("Mute slope", sma1303_mute_slope_enum,
-	sma1303_mute_slope_get, sma1303_mute_slope_put),
-SOC_SINGLE("Speaker Mute Switch(1:muted_0:un)",
-		SMA1303_0E_MUTE_VOL_CTRL, 0, 1, 0),
-SOC_ENUM_EXT("Speaker Mode", sma1303_spkmode_enum,
+SOC_ENUM("Speaker Mute Switch", sma1303_spkmute_enum),
+SOC_ENUM_EXT("Speaker Output", sma1303_spkmode_enum,
 	sma1303_spkmode_get, sma1303_spkmode_put),
-SOC_SINGLE("Speaker Bass(1:en_0:dis)", SMA1303_11_SYSTEM_CTRL2, 6, 1, 0),
-SOC_SINGLE("Speaker Comp/Limiter(1:en_0:dis)",
-		SMA1303_11_SYSTEM_CTRL2, 5, 1, 0),
-SOC_SINGLE("LR_DATA_SW(1:swap_0:normal)", SMA1303_11_SYSTEM_CTRL2, 4, 1, 0),
-SOC_SINGLE("Mono Mix(1:en_0:dis)", SMA1303_11_SYSTEM_CTRL2, 0, 1, 0),
-SOC_ENUM_EXT("Input gain", sma1303_input_gain_enum,
-	sma1303_input_gain_get, sma1303_input_gain_put),
-SOC_ENUM_EXT("Input gain for right channel", sma1303_input_r_gain_enum,
-	sma1303_input_r_gain_get, sma1303_input_r_gain_put),
-SOC_ENUM_EXT("Speaker HYSFB", sma1303_spk_hysfb_enum,
-	sma1303_spk_hysfb_get, sma1303_spk_hysfb_put),
-SND_SOC_BYTES_EXT("Speaker BDELAY", 1, spk_bdelay_get, spk_bdelay_put),
-SND_SOC_BYTES_EXT("Bass Boost SPK Coeff", 7,
-	bass_spk_coeff_get, bass_spk_coeff_put),
-SND_SOC_BYTES_EXT("DRC SPK Coeff", 4,
-	comp_lim_spk_coeff_get, comp_lim_spk_coeff_put),
-SOC_SINGLE("SPK modulator sync(1:1/8_0:1/4)",
-		SMA1303_33_SDM_CTRL, 2, 1, 0),
-SOC_SINGLE("Edge displacement(1:dis_0:en)",
-		SMA1303_36_PROTECTION, 7, 1, 0),
-SOC_ENUM_EXT("PWM LR delay", sma1303_lr_delay_enum,
-		sma1303_lr_delay_get, sma1303_lr_delay_put),
-SOC_SINGLE("OCP spk output state(1:dis_0:en)",
-		SMA1303_36_PROTECTION, 3, 1, 0),
-SOC_SINGLE("OCP mode(1:SD_0:AR)",
-		SMA1303_36_PROTECTION, 2, 1, 0),
-SOC_ENUM_EXT("OTP mode", sma1303_otp_mode_enum,
-		sma1303_otp_mode_get, sma1303_otp_mode_put),
-SND_SOC_BYTES_EXT("SlopeCTRL", 1, slope_ctrl_get, slope_ctrl_put),
-SND_SOC_BYTES_EXT("Test mode(Test 1~3_ATEST 1~2)",
-		5, test_mode_get, test_mode_put),
-SND_SOC_BYTES_EXT("PLL Setting", 5, pll_setting_get, pll_setting_put),
-SND_SOC_BYTES_EXT("PLL Power control", 1, pll_pd_ctrl_get, pll_pd_ctrl_put),
-SOC_ENUM_EXT("Trimming of OTP Level(1:on_0:off)", sma1303_trm_lvl_enum,
-	sma1303_trm_lvl_get, sma1303_trm_lvl_put),
-SOC_SINGLE("Low OCL mode(1:normal_0:low)",
-		SMA1303_8E_PLL_CTRL, 3, 1, 0),
 SND_SOC_BYTES_EXT("Postscaler Set", 1,
 		postscaler_get, postscaler_put),
-SOC_SINGLE("Postscaler(1:bypass_0:en)",
-		SMA1303_90_POSTSCALER, 0, 1, 0),
-SOC_ENUM_EXT("Attack level control", sma1303_attack_lvl_enum,
-	sma1303_attack_lvl_get, sma1303_attack_lvl_put),
-SOC_ENUM_EXT("Release time control", sma1303_release_time_enum,
-	sma1303_release_time_get, sma1303_release_time_put),
-SOC_ENUM_EXT("Filtered VDD gain control", sma1303_flt_vdd_gain_enum,
-	sma1303_flt_vdd_gain_get, sma1303_flt_vdd_gain_put),
-SOC_SINGLE("Fast charge(1:dis_0:en)",
-		SMA1303_92_FDPEC_CTRL, 2, 1, 0),
-SOC_ENUM_EXT("Trimming of switching frequency", sma1303_trm_osc_enum,
-	sma1303_trm_osc_get, sma1303_trm_osc_put),
-SOC_ENUM_EXT("Trimming of ramp compensation", sma1303_trm_rmp_enum,
-	sma1303_trm_rmp_get, sma1303_trm_rmp_put),
-SOC_ENUM_EXT("Trimming of over current limit", sma1303_trm_ocl_enum,
-	sma1303_trm_ocl_get, sma1303_trm_ocl_put),
-SOC_ENUM_EXT("Trimming of loop comp I gain", sma1303_trm_comp_i_enum,
-	sma1303_trm_comp_i_get, sma1303_trm_comp_i_put),
-SOC_ENUM_EXT("Trimming of loop comp P gain", sma1303_trm_comp_p_enum,
-	sma1303_trm_comp_p_get, sma1303_trm_comp_p_put),
-SOC_ENUM_EXT("Trimming of driver deadtime", sma1303_trm_dt_enum,
-	sma1303_trm_dt_get, sma1303_trm_dt_put),
-SOC_ENUM_EXT("Trimming of switching slew", sma1303_trm_slw_enum,
-	sma1303_trm_slw_get, sma1303_trm_slw_put),
-SOC_ENUM_EXT("Trimming of boost voltage", sma1303_trm_vbst_enum,
-	sma1303_trm_vbst_get, sma1303_trm_vbst_put),
-SOC_ENUM_EXT("Trimming of minimum on-time", sma1303_trm_tmin_enum,
-	sma1303_trm_tmin_get, sma1303_trm_tmin_put),
-SOC_SINGLE("PAD SDO(1:3mA_0:2mA)",
-		SMA1303_A0_PAD_CTRL0, 2, 1, 0),
-SOC_SINGLE("PAD Input LRCK(1:on_0:off)",
-		SMA1303_A1_PAD_CTRL1, 5, 1, 0),
-SOC_SINGLE("PAD Input SCK(1:on_0:off)",
-		SMA1303_A1_PAD_CTRL1, 4, 1, 0),
-SOC_SINGLE("PAD Input SDI(1:on_0:off)",
-		SMA1303_A1_PAD_CTRL1, 3, 1, 0),
-SOC_SINGLE("PAD Input SDO(1:on_0:off)",
-		SMA1303_A1_PAD_CTRL1, 2, 1, 0),
-SOC_SINGLE("PAD Input SDA(1:on_0:off)",
-		SMA1303_A1_PAD_CTRL1, 1, 1, 0),
-SOC_SINGLE("PAD Input SCL(1:on_0:off)",
-		SMA1303_A1_PAD_CTRL1, 0, 1, 0),
-SOC_SINGLE("PLL Lock Skip Mode(1:dis_0:en)",
-		SMA1303_A2_TOP_MAN1, 7, 1, 0),
-SOC_SINGLE("PLL Power Down(1:PD_0:oper)",
-		SMA1303_A2_TOP_MAN1, 6, 1, 0),
-SOC_ENUM_EXT("PLL Test Divider at SDO", sma1303_pll_div_enum,
-		sma1303_pll_div_get, sma1303_pll_div_put),
-SOC_SINGLE("PLL Ref Clk(1:SCK_0:PLL_REF_Clk1)",
-		SMA1303_A2_TOP_MAN1, 3, 1, 0),
-SOC_SINGLE("DAC Down Conver(1:C_0:N)",
-		SMA1303_A2_TOP_MAN1, 2, 1, 0),
-SOC_SINGLE("SDO Pad Output Ctrl(1:L_0:H)",
-		SMA1303_A2_TOP_MAN1, 1, 1, 0),
-SOC_SINGLE("SDO_output2(1:only_0:normal)",
-		SMA1303_A2_TOP_MAN1, 0, 1, 0),
-SOC_SINGLE("Monitoring at SDO(1:OSC_0:PLL)",
-		SMA1303_A3_TOP_MAN2, 7, 1, 0),
-SOC_SINGLE("Test clk out en(1:Clk out_0:N)",
-		SMA1303_A3_TOP_MAN2, 6, 1, 0),
-SOC_SINGLE("SDO output(1:H_0:N)",
-		SMA1303_A3_TOP_MAN2, 3, 1, 0),
-SOC_SINGLE("Clk Monitor(1:Not_0:Mon)",
-		SMA1303_A3_TOP_MAN2, 1, 1, 0),
-SOC_SINGLE("OSC PD(1:PD_0:N)",
-		SMA1303_A3_TOP_MAN2, 0, 1, 0),
-SOC_ENUM_EXT("TOP Manager Output Format", sma1303_o_format_enum,
+SOC_ENUM_EXT("Postscaler Config", sma1303_postscaler_config_enum,
+	sma1303_postscaler_config_get, sma1303_postscaler_config_put),
+SOC_ENUM_EXT("Output Format", sma1303_o_format_enum,
 	sma1303_o_format_get, sma1303_o_format_put),
-SOC_ENUM_EXT("TOP Manager SCK rate", sma1303_sck_rate_enum,
-	sma1303_sck_rate_get, sma1303_sck_rate_put),
-SOC_SINGLE("TOP Manager LRCK Pol(1:H_0:L)",
-		SMA1303_A4_TOP_MAN3, 0, 1, 0),
-SOC_SINGLE("TDM clk pol(1:fall_0:rise)",
-		SMA1303_A5_TDM1, 7, 1, 0),
-SOC_SINGLE("TDM Tx(1:stereo_0:mono)",
-		SMA1303_A5_TDM1, 6, 1, 0),
-SOC_ENUM_EXT("TDM slot1 pos Rx", sma1303_tdm_slot1_rx_enum,
-		sma1303_tdm_slot1_rx_get, sma1303_tdm_slot1_rx_put),
-SOC_ENUM_EXT("TDM slot2 pos Rx", sma1303_tdm_slot2_rx_enum,
-		sma1303_tdm_slot2_rx_get, sma1303_tdm_slot2_rx_put),
-SOC_SINGLE("TDM Data Length(1:32_0:16)",
-		SMA1303_A6_TDM2, 7, 1, 0),
-SOC_SINGLE("TDM n-slot(1:8_0:4)",
-		SMA1303_A6_TDM2, 6, 1, 0),
-SOC_ENUM_EXT("TDM slot1 pos Tx", sma1303_tdm_slot1_tx_enum,
-		sma1303_tdm_slot1_tx_get, sma1303_tdm_slot1_tx_put),
-SOC_ENUM_EXT("TDM slot2 pos Tx", sma1303_tdm_slot2_tx_enum,
-		sma1303_tdm_slot2_tx_get, sma1303_tdm_slot2_tx_put),
-SOC_ENUM_EXT("Clk monitor time select", sma1303_clk_mon_time_sel_enum,
-		sma1303_clk_mon_time_sel_get, sma1303_clk_mon_time_sel_put),
-SOC_SINGLE("Noise Gen mod(1:en_0:normal)",
-		SMA1303_A7_CLK_MON, 5, 1, 0),
-SOC_SINGLE("Noise Gen post(1:en_0:normal)",
-		SMA1303_A7_CLK_MON, 4, 1, 0),
-SOC_SINGLE("Limiter Oper Range(1:en_0:dis)",
-		SMA1303_A7_CLK_MON, 3, 1, 0),
 };
 
 static int sma1303_startup(struct snd_soc_component *component)
 {
 	struct sma1303_priv *sma1303 = snd_soc_component_get_drvdata(component);
+	int ret = 0;
 
 	if (sma1303->amp_power_status) {
 		dev_info(component->dev, "%s : %s\n",
 			__func__, "Already AMP Power on");
-		return 0;
+		return ret;
 	}
 
-	dev_info(component->dev, "%s : TRM_%s, FLT_%s\n",
-	__func__, sma1303_trm_vbst_text[sma1303->bst_vol_lvl_status],
-	sma1303_flt_vdd_gain_text[sma1303->flt_vdd_gain_status]);
+	ret += sma1303_regmap_update_bits(sma1303->regmap, component->dev,
+			SMA1303_8E_PLL_CTRL, PLL_PD2_MASK, PLL_OPERATION2);
 
-	regmap_update_bits(sma1303->regmap, SMA1303_8E_PLL_CTRL,
-			PLL_PD2_MASK, PLL_OPERATION2);
+	ret += sma1303_regmap_update_bits(sma1303->regmap, component->dev,
+			SMA1303_00_SYSTEM_CTRL, POWER_MASK, POWER_ON);
 
-	regmap_update_bits(sma1303->regmap, SMA1303_00_SYSTEM_CTRL,
-			POWER_MASK, POWER_ON);
-
-	if (sma1303->stereo_two_chip == true) {
-		regmap_update_bits(sma1303->regmap, SMA1303_10_SYSTEM_CTRL1,
-				SPK_MODE_MASK, SPK_STEREO);
-	} else {
-		regmap_update_bits(sma1303->regmap, SMA1303_10_SYSTEM_CTRL1,
-				SPK_MODE_MASK, SPK_MONO);
-	}
+	if (sma1303->amp_mode == ONE_CHIP_SOLUTION)
+		ret += sma1303_regmap_update_bits(sma1303->regmap, component->dev,
+			SMA1303_10_SYSTEM_CTRL1, SPK_MODE_MASK, SPK_MONO);
+	else
+		ret += sma1303_regmap_update_bits(sma1303->regmap, component->dev,
+			SMA1303_10_SYSTEM_CTRL1, SPK_MODE_MASK, SPK_STEREO);
 
 	if (sma1303->check_fault_status) {
 		if (sma1303->check_fault_period > 0)
@@ -2135,43 +951,44 @@ static int sma1303_startup(struct snd_soc_component *component)
 					CHECK_PERIOD_TIME * HZ);
 	}
 
-	regmap_update_bits(sma1303->regmap, SMA1303_0E_MUTE_VOL_CTRL,
-			SPK_MUTE_MASK, SPK_UNMUTE);
+	ret += sma1303_regmap_update_bits(sma1303->regmap, component->dev,
+			SMA1303_0E_MUTE_VOL_CTRL, SPK_MUTE_MASK, SPK_UNMUTE);
 
 	sma1303->amp_power_status = true;
 
-	return 0;
+	return ret;
 }
 
 static int sma1303_shutdown(struct snd_soc_component *component)
 {
 	struct sma1303_priv *sma1303 = snd_soc_component_get_drvdata(component);
+	int ret = 0;
 
 	if (!(sma1303->amp_power_status)) {
 		dev_info(component->dev, "%s : %s\n",
 			__func__, "Already AMP Shutdown");
-		return 0;
+		return ret;
 	}
 
-	regmap_update_bits(sma1303->regmap, SMA1303_0E_MUTE_VOL_CTRL,
-			SPK_MUTE_MASK, SPK_MUTE);
+	ret += sma1303_regmap_update_bits(sma1303->regmap, component->dev,
+			SMA1303_0E_MUTE_VOL_CTRL, SPK_MUTE_MASK, SPK_MUTE);
 
 	cancel_delayed_work_sync(&sma1303->check_fault_work);
 
 	msleep(55);
 
-	regmap_update_bits(sma1303->regmap, SMA1303_10_SYSTEM_CTRL1,
-			SPK_MODE_MASK, SPK_OFF);
+	ret += sma1303_regmap_update_bits(sma1303->regmap, component->dev,
+			SMA1303_10_SYSTEM_CTRL1, SPK_MODE_MASK, SPK_OFF);
 
-	regmap_update_bits(sma1303->regmap, SMA1303_00_SYSTEM_CTRL,
-			POWER_MASK, POWER_OFF);
+	ret += sma1303_regmap_update_bits(sma1303->regmap, component->dev,
+			SMA1303_00_SYSTEM_CTRL, POWER_MASK, POWER_OFF);
 
-	regmap_update_bits(sma1303->regmap, SMA1303_8E_PLL_CTRL,
-			PLL_PD2_MASK, PLL_PD2);
+	ret += sma1303_regmap_update_bits(sma1303->regmap, component->dev,
+			SMA1303_8E_PLL_CTRL, PLL_PD2_MASK, PLL_PD2);
 
 	sma1303->amp_power_status = false;
 
-	return 0;
+	return ret;
 }
 
 static int sma1303_clk_supply_event(struct snd_soc_dapm_widget *w,
@@ -2204,7 +1021,7 @@ static int sma1303_dac_event(struct snd_soc_dapm_widget *w,
 	case SND_SOC_DAPM_PRE_PMU:
 		dev_info(component->dev, "%s : PRE_PMU\n", __func__);
 
-		if (sma1303->force_amp_power_down == false)
+		if (sma1303->usage_status)
 			sma1303_startup(component);
 
 		break;
@@ -2236,37 +1053,40 @@ static int sma1303_dac_feedback_event(struct snd_soc_dapm_widget *w,
 	struct snd_soc_component *component =
 		snd_soc_dapm_to_component(w->dapm);
 	struct sma1303_priv *sma1303 = snd_soc_component_get_drvdata(component);
+	int ret = 0;
 
-	if (!sma1303->sdo_bypass_flag) {
-		switch (event) {
-		case SND_SOC_DAPM_PRE_PMU:
-			dev_info(component->dev,
-					"%s : DAC feedback ON\n", __func__);
-			regmap_update_bits(sma1303->regmap,
+	switch (event) {
+	case SND_SOC_DAPM_PRE_PMU:
+		dev_info(component->dev,
+				"%s : DAC feedback ON\n", __func__);
+		ret += sma1303_regmap_update_bits(
+				sma1303->regmap, component->dev,
 				SMA1303_09_OUTPUT_CTRL,
-					PORT_CONFIG_MASK|PORT_OUT_SEL_MASK,
-					OUTPUT_PORT_ENABLE|SPEAKER_PATH);
-			regmap_update_bits(sma1303->regmap,
-				SMA1303_A3_TOP_MAN2, SDO_OUTPUT_MASK,
-					NORMAL_OUT);
-			break;
+				PORT_CONFIG_MASK|PORT_OUT_SEL_MASK,
+				OUTPUT_PORT_ENABLE|SPEAKER_PATH);
 
-		case SND_SOC_DAPM_PRE_PMD:
-			dev_info(component->dev,
-					"%s : DAC feedback OFF\n", __func__);
-			regmap_update_bits(sma1303->regmap,
-				SMA1303_09_OUTPUT_CTRL, PORT_OUT_SEL_MASK,
-					OUT_SEL_DISABLE);
-			regmap_update_bits(sma1303->regmap,
-				SMA1303_A3_TOP_MAN2, SDO_OUTPUT_MASK,
-					HIGH_Z_OUT);
-			break;
-		}
-	} else
+		ret += sma1303_regmap_update_bits(
+				sma1303->regmap, component->dev,
+				SMA1303_A3_TOP_MAN2,
+				SDO_OUTPUT_MASK, NORMAL_OUT);
+		break;
+
+	case SND_SOC_DAPM_PRE_PMD:
 		dev_info(component->dev,
-				"%s : Force SDO Setting Bypass\n", __func__);
+				"%s : DAC feedback OFF\n", __func__);
+		ret += sma1303_regmap_update_bits(
+				sma1303->regmap, component->dev,
+				SMA1303_09_OUTPUT_CTRL,
+				PORT_OUT_SEL_MASK, OUT_SEL_DISABLE);
 
-	return 0;
+		ret += sma1303_regmap_update_bits(
+				sma1303->regmap, component->dev,
+				SMA1303_A3_TOP_MAN2, SDO_OUTPUT_MASK,
+				HIGH_Z_OUT);
+		break;
+	}
+
+	return ret;
 }
 
 static const struct snd_soc_dapm_widget sma1303_dapm_widgets[] = {
@@ -2280,12 +1100,18 @@ SND_SOC_DAPM_ADC_E("DAC_FEEDBACK", "Capture", SND_SOC_NOPM, 0, 0,
 				SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_PRE_PMD),
 SND_SOC_DAPM_OUTPUT("SPK"),
 SND_SOC_DAPM_INPUT("SDO"),
+SND_SOC_DAPM_MUX("SDO Source", SND_SOC_NOPM, 0, 0, &sma1303_sdo_source_mux),
 };
 
 static const struct snd_soc_dapm_route sma1303_audio_map[] = {
 {"DAC", NULL, "CLK_SUPPLY"},
 {"SPK", NULL, "DAC"},
-{"DAC_FEEDBACK", NULL, "SDO"},
+{"SDO Source", "Disable", "SDO"},
+{"SDO Source", "Format_C", "SDO"},
+{"SDO Source", "Mixer_Out", "SDO"},
+{"SDO Source", "After_DSP", "SDO"},
+{"SDO Source", "After_Post", "SDO"},
+{"DAC_FEEDBACK", NULL, "SDO Source"},
 };
 
 static int sma1303_setup_pll(struct snd_soc_component *component,
@@ -2293,7 +1119,7 @@ static int sma1303_setup_pll(struct snd_soc_component *component,
 {
 	struct sma1303_priv *sma1303 = snd_soc_component_get_drvdata(component);
 
-	int i = 0;
+	int i = 0, ret = 0;
 
 	dev_info(component->dev, "%s : BCLK = %dHz\n",
 		__func__, bclk);
@@ -2312,21 +1138,30 @@ static int sma1303_setup_pll(struct snd_soc_component *component,
 			return -EINVAL;
 		}
 
-		regmap_update_bits(sma1303->regmap, SMA1303_A2_TOP_MAN1,
+		ret += sma1303_regmap_update_bits(
+				sma1303->regmap, component->dev,
+				SMA1303_A2_TOP_MAN1,
 				PLL_PD_MASK|PLL_REF_CLK_MASK,
 				PLL_OPERATION|PLL_SCK);
 	}
 
-	regmap_write(sma1303->regmap, SMA1303_8B_PLL_POST_N,
+	ret += sma1303_regmap_write(sma1303->regmap, component->dev,
+			SMA1303_8B_PLL_POST_N,
 			sma1303->pll_matches[i].post_n);
-	regmap_write(sma1303->regmap, SMA1303_8C_PLL_N,
+
+	ret += sma1303_regmap_write(sma1303->regmap, component->dev,
+			SMA1303_8C_PLL_N,
 			sma1303->pll_matches[i].n);
-	regmap_write(sma1303->regmap, SMA1303_8D_PLL_A_SETTING,
+
+	ret += sma1303_regmap_write(sma1303->regmap, component->dev,
+			SMA1303_8D_PLL_A_SETTING,
 			sma1303->pll_matches[i].vco);
-	regmap_write(sma1303->regmap, SMA1303_8F_PLL_P_CP,
+
+	ret += sma1303_regmap_write(sma1303->regmap, component->dev,
+			SMA1303_8F_PLL_P_CP,
 			sma1303->pll_matches[i].p_cp);
 
-	return 0;
+	return ret;
 }
 
 static int sma1303_dai_hw_params_amp(struct snd_pcm_substream *substream,
@@ -2336,6 +1171,7 @@ static int sma1303_dai_hw_params_amp(struct snd_pcm_substream *substream,
 	struct sma1303_priv *sma1303 = snd_soc_component_get_drvdata(component);
 	unsigned int input_format = 0;
 	unsigned int bclk = 0;
+	int ret = 0;
 
 	if (sma1303->format == SND_SOC_DAIFMT_DSP_A)
 		bclk = params_rate(params) * sma1303->frame_size;
@@ -2350,7 +1186,7 @@ static int sma1303_dai_hw_params_amp(struct snd_pcm_substream *substream,
 
 	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
 
-		if (sma1303->force_amp_power_down == false &&
+		if (sma1303->usage_status &&
 			(sma1303->sys_clk_id == SMA1303_PLL_CLKIN_MCLK
 			|| sma1303->sys_clk_id == SMA1303_PLL_CLKIN_BCLK)) {
 
@@ -2375,16 +1211,26 @@ static int sma1303_dai_hw_params_amp(struct snd_pcm_substream *substream,
 		case 44100:
 		case 48000:
 		case 96000:
-		regmap_update_bits(sma1303->regmap, SMA1303_A2_TOP_MAN1,
+		ret += sma1303_regmap_update_bits(
+				sma1303->regmap, component->dev,
+				SMA1303_A2_TOP_MAN1,
 				DAC_DN_CONV_MASK, DAC_DN_CONV_DISABLE);
-		regmap_update_bits(sma1303->regmap, SMA1303_01_INPUT1_CTRL1,
+
+		ret += sma1303_regmap_update_bits(
+				sma1303->regmap, component->dev,
+				SMA1303_01_INPUT1_CTRL1,
 				LEFTPOL_MASK, LOW_FIRST_CH);
 		break;
 
 		case 192000:
-		regmap_update_bits(sma1303->regmap, SMA1303_A2_TOP_MAN1,
+		ret += sma1303_regmap_update_bits(
+				sma1303->regmap, component->dev,
+				SMA1303_A2_TOP_MAN1,
 				DAC_DN_CONV_MASK, DAC_DN_CONV_ENABLE);
-		regmap_update_bits(sma1303->regmap, SMA1303_01_INPUT1_CTRL1,
+
+		ret += sma1303_regmap_update_bits(
+				sma1303->regmap, component->dev,
+				SMA1303_01_INPUT1_CTRL1,
 				LEFTPOL_MASK, HIGH_FIRST_CH);
 		break;
 
@@ -2392,7 +1238,7 @@ static int sma1303_dai_hw_params_amp(struct snd_pcm_substream *substream,
 			dev_err(component->dev, "%s not support rate : %d\n",
 				__func__, params_rate(params));
 
-		return -EINVAL;
+			return -EINVAL;
 		}
 
 	} else {
@@ -2403,14 +1249,30 @@ static int sma1303_dai_hw_params_amp(struct snd_pcm_substream *substream,
 			dev_info(component->dev,
 				"%s set format SNDRV_PCM_FORMAT_S16_LE\n",
 				__func__);
+			ret += sma1303_regmap_update_bits(
+					sma1303->regmap, component->dev,
+					SMA1303_A4_TOP_MAN3,
+					SCK_RATE_MASK, SCK_32FS);
 			break;
 
 		case SNDRV_PCM_FORMAT_S24_LE:
 			dev_info(component->dev,
 				"%s set format SNDRV_PCM_FORMAT_S24_LE\n",
 				__func__);
+			ret += sma1303_regmap_update_bits(
+					sma1303->regmap, component->dev,
+					SMA1303_A4_TOP_MAN3,
+					SCK_RATE_MASK, SCK_64FS);
+			break;
+		case SNDRV_PCM_FORMAT_S32_LE:
+			dev_info(component->dev,
+				"%s set format SNDRV_PCM_FORMAT_S32_LE\n",
+				__func__);
+			ret += sma1303_regmap_update_bits(
+					sma1303->regmap, component->dev,
+					SMA1303_A4_TOP_MAN3,
+					SCK_RATE_MASK, SCK_64FS);
 			break;
-
 		default:
 			dev_err(component->dev,
 				"%s not support data bit : %d\n", __func__,
@@ -2434,6 +1296,7 @@ static int sma1303_dai_hw_params_amp(struct snd_pcm_substream *substream,
 		}
 		break;
 	case 24:
+	case 32:
 		switch (sma1303->format) {
 		case SND_SOC_DAIFMT_I2S:
 			input_format |= STANDARD_I2S;
@@ -2454,10 +1317,11 @@ static int sma1303_dai_hw_params_amp(struct snd_pcm_substream *substream,
 		return -EINVAL;
 	}
 
-	regmap_update_bits(sma1303->regmap, SMA1303_01_INPUT1_CTRL1,
-				I2S_MODE_MASK, input_format);
-
-	return 0;
+	ret += sma1303_regmap_update_bits(
+			sma1303->regmap, component->dev,
+			SMA1303_01_INPUT1_CTRL1,
+			I2S_MODE_MASK, input_format);
+	return ret;
 }
 
 static int sma1303_dai_set_sysclk_amp(struct snd_soc_dai *dai,
@@ -2487,29 +1351,34 @@ static int sma1303_dai_mute(struct snd_soc_dai *dai, int mute, int stream)
 {
 	struct snd_soc_component *component = dai->component;
 	struct sma1303_priv *sma1303 = snd_soc_component_get_drvdata(component);
+	int ret = 0;
 
 	if (stream == SNDRV_PCM_STREAM_CAPTURE)
-		return 0;
+		return ret;
 
 	if (!(sma1303->amp_power_status)) {
 		dev_info(component->dev, "%s : %s\n",
 			__func__, "Already AMP Shutdown");
-		return 0;
+		return ret;
 	}
 
 	if (mute) {
 		dev_info(component->dev, "%s : %s\n", __func__, "MUTE");
 
-		regmap_update_bits(sma1303->regmap, SMA1303_0E_MUTE_VOL_CTRL,
-					SPK_MUTE_MASK, SPK_MUTE);
+		ret += sma1303_regmap_update_bits(
+				sma1303->regmap, component->dev,
+				SMA1303_0E_MUTE_VOL_CTRL,
+				SPK_MUTE_MASK, SPK_MUTE);
 	} else {
 		dev_info(component->dev, "%s : %s\n", __func__, "UNMUTE");
 
-		regmap_update_bits(sma1303->regmap, SMA1303_0E_MUTE_VOL_CTRL,
-					SPK_MUTE_MASK, SPK_UNMUTE);
+		ret += sma1303_regmap_update_bits(
+				sma1303->regmap, component->dev,
+				SMA1303_0E_MUTE_VOL_CTRL,
+				SPK_MUTE_MASK, SPK_UNMUTE);
 	}
 
-	return 0;
+	return ret;
 }
 
 static int sma1303_dai_set_fmt_amp(struct snd_soc_dai *dai,
@@ -2517,21 +1386,25 @@ static int sma1303_dai_set_fmt_amp(struct snd_soc_dai *dai,
 {
 	struct snd_soc_component *component  = dai->component;
 	struct sma1303_priv *sma1303 = snd_soc_component_get_drvdata(component);
+	int ret = 0;
 
 	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
 
 	case SND_SOC_DAIFMT_CBS_CFS:
 		dev_info(component->dev,
 				"%s : %s\n", __func__, "I2S/TDM Device mode");
-		regmap_update_bits(sma1303->regmap, SMA1303_01_INPUT1_CTRL1,
+		ret += sma1303_regmap_update_bits(
+				sma1303->regmap, component->dev,
+				SMA1303_01_INPUT1_CTRL1,
 				CONTROLLER_DEVICE_MASK, DEVICE_MODE);
-
 		break;
 
 	case SND_SOC_DAIFMT_CBM_CFM:
 		dev_info(component->dev,
 			"%s : %s\n", __func__, "I2S/TDM Controller mode");
-		regmap_update_bits(sma1303->regmap, SMA1303_01_INPUT1_CTRL1,
+		ret += sma1303_regmap_update_bits(
+				sma1303->regmap, component->dev,
+				SMA1303_01_INPUT1_CTRL1,
 				CONTROLLER_DEVICE_MASK, CONTROLLER_MODE);
 		break;
 
@@ -2561,21 +1434,27 @@ static int sma1303_dai_set_fmt_amp(struct snd_soc_dai *dai,
 	case SND_SOC_DAIFMT_IB_NF:
 		dev_info(component->dev, "%s : %s\n",
 			__func__, "Invert BCLK + Normal Frame");
-		regmap_update_bits(sma1303->regmap, SMA1303_01_INPUT1_CTRL1,
-					SCK_RISING_MASK, SCK_RISING_EDGE);
+		ret += sma1303_regmap_update_bits(
+				sma1303->regmap, component->dev,
+				SMA1303_01_INPUT1_CTRL1,
+				SCK_RISING_MASK, SCK_RISING_EDGE);
 		break;
 	case SND_SOC_DAIFMT_IB_IF:
 		dev_info(component->dev, "%s : %s\n",
 			__func__, "Invert BCLK + Invert Frame");
-		regmap_update_bits(sma1303->regmap, SMA1303_01_INPUT1_CTRL1,
-					LEFTPOL_MASK|SCK_RISING_MASK,
-					HIGH_FIRST_CH|SCK_RISING_EDGE);
+		ret += sma1303_regmap_update_bits(
+				sma1303->regmap, component->dev,
+				SMA1303_01_INPUT1_CTRL1,
+				LEFTPOL_MASK|SCK_RISING_MASK,
+				HIGH_FIRST_CH|SCK_RISING_EDGE);
 		break;
 	case SND_SOC_DAIFMT_NB_IF:
 		dev_info(component->dev, "%s : %s\n",
 			__func__, "Normal BCLK + Invert Frame");
-		regmap_update_bits(sma1303->regmap, SMA1303_01_INPUT1_CTRL1,
-					LEFTPOL_MASK, HIGH_FIRST_CH);
+		ret += sma1303_regmap_update_bits(
+				sma1303->regmap, component->dev,
+				SMA1303_01_INPUT1_CTRL1,
+				LEFTPOL_MASK, HIGH_FIRST_CH);
 		break;
 	case SND_SOC_DAIFMT_NB_NF:
 		dev_info(component->dev, "%s : %s\n",
@@ -2587,7 +1466,7 @@ static int sma1303_dai_set_fmt_amp(struct snd_soc_dai *dai,
 		return -EINVAL;
 	}
 
-	return 0;
+	return ret;
 }
 
 static int sma1303_dai_set_tdm_slot(struct snd_soc_dai *dai,
@@ -2596,23 +1475,30 @@ static int sma1303_dai_set_tdm_slot(struct snd_soc_dai *dai,
 {
 	struct snd_soc_component *component = dai->component;
 	struct sma1303_priv *sma1303 = snd_soc_component_get_drvdata(component);
+	int ret = 0;
 
 	dev_info(component->dev, "%s : slots = %d, slot_width - %d\n",
 			__func__, slots, slot_width);
 
 	sma1303->frame_size = slot_width * slots;
 
-	regmap_update_bits(sma1303->regmap, SMA1303_A4_TOP_MAN3,
-				O_FORMAT_MASK, O_FMT_TDM);
+	ret += sma1303_regmap_update_bits(
+			sma1303->regmap, component->dev,
+			SMA1303_A4_TOP_MAN3,
+			O_FORMAT_MASK, O_FMT_TDM);
 
 	switch (slot_width) {
 	case 16:
-	regmap_update_bits(sma1303->regmap, SMA1303_A6_TDM2,
-					TDM_DL_MASK, TDM_DL_16);
+	ret += sma1303_regmap_update_bits(
+			sma1303->regmap, component->dev,
+			SMA1303_A6_TDM2,
+			TDM_DL_MASK, TDM_DL_16);
 	break;
 	case 32:
-	regmap_update_bits(sma1303->regmap, SMA1303_A6_TDM2,
-					TDM_DL_MASK, TDM_DL_32);
+	ret += sma1303_regmap_update_bits(
+			sma1303->regmap, component->dev,
+			SMA1303_A6_TDM2,
+			TDM_DL_MASK, TDM_DL_32);
 	break;
 	default:
 	dev_err(component->dev, "%s not support TDM %d slot_width\n",
@@ -2621,12 +1507,16 @@ static int sma1303_dai_set_tdm_slot(struct snd_soc_dai *dai,
 
 	switch (slots) {
 	case 4:
-	regmap_update_bits(sma1303->regmap, SMA1303_A6_TDM2,
-					TDM_N_SLOT_MASK, TDM_N_SLOT_4);
+	ret += sma1303_regmap_update_bits(
+			sma1303->regmap, component->dev,
+			SMA1303_A6_TDM2,
+			TDM_N_SLOT_MASK, TDM_N_SLOT_4);
 	break;
 	case 8:
-	regmap_update_bits(sma1303->regmap, SMA1303_A6_TDM2,
-					TDM_N_SLOT_MASK, TDM_N_SLOT_8);
+	ret += sma1303_regmap_update_bits(
+			sma1303->regmap, component->dev,
+			SMA1303_A6_TDM2,
+			TDM_N_SLOT_MASK, TDM_N_SLOT_8);
 	break;
 	default:
 	dev_err(component->dev, "%s not support TDM %d slots\n",
@@ -2634,26 +1524,34 @@ static int sma1303_dai_set_tdm_slot(struct snd_soc_dai *dai,
 	}
 
 	if (sma1303->tdm_slot_rx < slots)
-		regmap_update_bits(sma1303->regmap,
-			SMA1303_A5_TDM1, TDM_SLOT1_RX_POS_MASK,
-			(sma1303->tdm_slot_rx) << 3);
+		ret += sma1303_regmap_update_bits(
+				sma1303->regmap, component->dev,
+				SMA1303_A5_TDM1, TDM_SLOT1_RX_POS_MASK,
+				(sma1303->tdm_slot_rx) << 3);
 	else
 		dev_err(component->dev, "%s Incorrect tdm-slot-rx %d set\n",
 				__func__, sma1303->tdm_slot_rx);
 
-	regmap_update_bits(sma1303->regmap, SMA1303_A5_TDM1,
-					TDM_CLK_POL_MASK, TDM_CLK_POL_RISE);
-	regmap_update_bits(sma1303->regmap, SMA1303_A5_TDM1,
-					TDM_TX_MODE_MASK, TDM_TX_MONO);
+	ret += sma1303_regmap_update_bits(
+			sma1303->regmap, component->dev,
+			SMA1303_A5_TDM1,
+			TDM_CLK_POL_MASK, TDM_CLK_POL_RISE);
+
+	ret += sma1303_regmap_update_bits(
+			sma1303->regmap, component->dev,
+			SMA1303_A5_TDM1,
+			TDM_TX_MODE_MASK, TDM_TX_MONO);
+
 	if (sma1303->tdm_slot_tx < slots)
-		regmap_update_bits(sma1303->regmap,
-			SMA1303_A6_TDM2, TDM_SLOT1_TX_POS_MASK,
-			(sma1303->tdm_slot_tx) << 3);
+		ret += sma1303_regmap_update_bits(
+				sma1303->regmap, component->dev,
+				SMA1303_A6_TDM2, TDM_SLOT1_TX_POS_MASK,
+				(sma1303->tdm_slot_tx) << 3);
 	else
 		dev_err(component->dev, "%s Incorrect tdm-slot-tx %d set\n",
 				__func__, sma1303->tdm_slot_tx);
 
-	return 0;
+	return ret;
 }
 
 static const struct snd_soc_dai_ops sma1303_dai_ops_amp = {
@@ -2690,47 +1588,12 @@ static struct snd_soc_dai_driver sma1303_dai[] = {
 }
 };
 
-static int sma1303_set_bias_level(struct snd_soc_component *component,
-				enum snd_soc_bias_level level)
-{
-	switch (level) {
-	case SND_SOC_BIAS_ON:
-
-		dev_info(component->dev, "%s\n", "SND_SOC_BIAS_ON");
-		sma1303_startup(component);
-
-		break;
-
-	case SND_SOC_BIAS_PREPARE:
-
-		dev_info(component->dev, "%s\n", "SND_SOC_BIAS_PREPARE");
-
-		break;
-
-	case SND_SOC_BIAS_STANDBY:
-
-		dev_info(component->dev, "%s\n", "SND_SOC_BIAS_STANDBY");
-
-		break;
-
-	case SND_SOC_BIAS_OFF:
-
-		dev_info(component->dev, "%s\n", "SND_SOC_BIAS_OFF");
-		sma1303_shutdown(component);
-
-		break;
-	}
-
-	return 0;
-}
-
 static void sma1303_check_fault_worker(struct work_struct *work)
 {
 	struct sma1303_priv *sma1303 =
 		container_of(work, struct sma1303_priv, check_fault_work.work);
-	int ret;
+	int ret = 0;
 	unsigned int over_temp, ocp_val, uvlo_val;
-	bool fault_val_flag = false;
 
 	mutex_lock(&sma1303->lock);
 
@@ -2777,14 +1640,15 @@ static void sma1303_check_fault_worker(struct work_struct *work)
 			"%s : OT1(Over Temperature Level 1)\n", __func__);
 
 		if ((sma1303->cur_vol + 6) <= 0xFF)
-			regmap_write(sma1303->regmap,
+			sma1303_regmap_write(
+				sma1303->regmap, sma1303->dev,
 				SMA1303_0A_SPK_VOL, sma1303->cur_vol + 6);
 
 		sma1303->tsdw_cnt++;
-		fault_val_flag = true;
 	} else if (sma1303->tsdw_cnt) {
-		regmap_write(sma1303->regmap,
-			SMA1303_0A_SPK_VOL, sma1303->init_vol);
+		sma1303_regmap_write(
+				sma1303->regmap, sma1303->dev,
+				SMA1303_0A_SPK_VOL, sma1303->init_vol);
 		sma1303->tsdw_cnt = 0;
 		sma1303->cur_vol = sma1303->init_vol;
 	}
@@ -2792,27 +1656,22 @@ static void sma1303_check_fault_worker(struct work_struct *work)
 	if (~over_temp & OT2_OK_STATUS) {
 		dev_crit(sma1303->dev,
 			"%s : OT2(Over Temperature Level 2)\n", __func__);
-		fault_val_flag = true;
 	}
 	if (ocp_val & OCP_SPK_STATUS) {
 		dev_crit(sma1303->dev,
 			"%s : OCP_SPK(Over Current Protect SPK)\n", __func__);
-		fault_val_flag = true;
 	}
 	if (ocp_val & OCP_BST_STATUS) {
 		dev_crit(sma1303->dev,
 			"%s : OCP_BST(Over Current Protect Boost)\n", __func__);
-		fault_val_flag = true;
 	}
 	if ((ocp_val & CLK_MON_STATUS) && (sma1303->amp_power_status)) {
 		dev_crit(sma1303->dev,
 			"%s : CLK_FAULT(No clock input)\n", __func__);
-		fault_val_flag = true;
 	}
 	if (uvlo_val & UVLO_BST_STATUS) {
 		dev_crit(sma1303->dev,
 			"%s : UVLO(Under Voltage Lock Out)\n", __func__);
-		fault_val_flag = true;
 	}
 
 	if ((over_temp != sma1303->last_over_temp) ||
@@ -2836,82 +1695,11 @@ static void sma1303_check_fault_worker(struct work_struct *work)
 					CHECK_PERIOD_TIME * HZ);
 	}
 
-	if (fault_val_flag && sma1303->fault_reg_flag) {
-		int i, j = 0;
-		char reg[256];
-		char reg_str[12][50] = { };
-		bool state;
-
-		regmap_bulk_read(sma1303->regmap,
-			SMA1303_00_SYSTEM_CTRL, reg, ARRAY_SIZE(reg));
-		dev_crit(sma1303->dev, "\n");
-		dev_crit(sma1303->dev, "sma1303 register values\n");
-		dev_crit(sma1303->dev, "\t   0\t1\t2\t3\t4\t5\t6\t7\t8\t9\tA\tB\tC\tD\tE\tF\n");
-		dev_crit(sma1303->dev, "\t  ---------------------------------------------------------------------------------------------------------\n");
-		for (i = 0; i <= SMA1303_A7_CLK_MON; i++) {
-			switch (i) {
-			case SMA1303_00_SYSTEM_CTRL ... SMA1303_04_INPUT1_CTRL4:
-			case SMA1303_09_OUTPUT_CTRL
-				... SMA1303_0E_MUTE_VOL_CTRL:
-			case SMA1303_10_SYSTEM_CTRL1
-				... SMA1303_12_SYSTEM_CTRL3:
-			case SMA1303_14_MODULATOR ... SMA1303_1B_BASS_SPK7:
-			case SMA1303_23_COMP_LIM1 ... SMA1303_26_COMP_LIM4:
-			case SMA1303_33_SDM_CTRL ... SMA1303_34_OTP_DATA1:
-			case SMA1303_36_PROTECTION  ... SMA1303_38_OTP_TRM0:
-			case SMA1303_3B_TEST1  ... SMA1303_3F_ATEST2:
-			case SMA1303_8B_PLL_POST_N ... SMA1303_92_FDPEC_CTRL:
-			case SMA1303_94_BOOST_CTRL1 ... SMA1303_97_BOOST_CTRL4:
-			case SMA1303_A0_PAD_CTRL0 ... SMA1303_A7_CLK_MON:
-				state = true;
-				break;
-			default:
-				state = false;
-			}
-			if (state == false)
-				sprintf(reg_str[j], "%sX\t", reg_str[j]);
-			else
-				sprintf(reg_str[j], "%s%02X\t",
-					reg_str[j], reg[i]);
-
-			if (i%16 == 15 || i == SMA1303_A7_CLK_MON) {
-				dev_crit(sma1303->dev, "%X  |%s",
-					j, reg_str[j]);
-				j++;
-			}
-		}
-
-		for (i = SMA1303_FA_STATUS1-10;
-				i <= SMA1303_FF_DEVICE_INDEX; i++) {
-			switch (i) {
-			case SMA1303_FA_STATUS1 ... SMA1303_FB_STATUS2:
-			case SMA1303_FF_DEVICE_INDEX:
-				state = true;
-				break;
-			default:
-				state = false;
-			}
-			if (state == false)
-				sprintf(reg_str[j], "%sX\t", reg_str[j]);
-			else
-				sprintf(reg_str[j], "%s%02X\t",
-					reg_str[j], reg[i]);
-
-			if (i == SMA1303_FF_DEVICE_INDEX) {
-				dev_crit(sma1303->dev, "F  |%s",  reg_str[j]);
-				j++;
-			}
-		}
-		sma1303->fault_reg_flag = false;
-	}
-
 	if (!(~over_temp & OT1_OK_STATUS) && !(~over_temp & OT2_OK_STATUS)
 			&& !(ocp_val & OCP_SPK_STATUS)
 			&& !(ocp_val & OCP_BST_STATUS)
 			&& !(ocp_val & CLK_MON_STATUS)
 			&& !(uvlo_val & UVLO_BST_STATUS)) {
-		fault_val_flag = false;
-		sma1303->fault_reg_flag = true;
 	}
 
 	mutex_unlock(&sma1303->lock);
@@ -2932,89 +1720,14 @@ static int sma1303_resume(struct snd_soc_component *component)
 #define sma1303_resume NULL
 #endif
 
-static int sma1303_reset(struct snd_soc_component *component)
-{
-	struct sma1303_priv *sma1303 = snd_soc_component_get_drvdata(component);
-	int ret;
-	unsigned int status, otp_stat;
-
-	regmap_update_bits(sma1303->regmap,
-		SMA1303_00_SYSTEM_CTRL, RESETBYI2C_MASK, RESETBYI2C_RESET);
-
-	ret = regmap_read(sma1303->regmap, SMA1303_FF_DEVICE_INDEX, &status);
-
-	if (ret != 0)
-		dev_err(sma1303->dev,
-			"failed to read SMA1303_FA_STATUS1 : %d\n", ret);
-	else
-		sma1303->rev_num = status & REV_NUM_STATUS;
-
-	if (sma1303->rev_num == REV_NUM_TV0)
-		dev_info(component->dev, "SMA1303 Trimming Version 0\n");
-	else if (sma1303->rev_num == REV_NUM_TV1)
-		dev_info(component->dev, "SMA1303 Trimming Version 1\n");
-
-	regmap_read(sma1303->regmap, SMA1303_FB_STATUS2, &otp_stat);
-
-	if (((sma1303->rev_num == REV_NUM_TV0) &&
-		((otp_stat & 0x0E) == OTP_STAT_OK_0)) ||
-		((sma1303->rev_num != REV_NUM_TV0) &&
-		((otp_stat & 0x0C) == OTP_STAT_OK_1)))
-		dev_info(component->dev, "SMA1303 OTP Status Successful\n");
-	else
-		dev_info(component->dev, "SMA1303 OTP Status Fail\n");
-
-	regmap_write(sma1303->regmap, SMA1303_00_SYSTEM_CTRL, 0x80);
-	regmap_write(sma1303->regmap, SMA1303_0A_SPK_VOL, sma1303->init_vol);
-	regmap_update_bits(sma1303->regmap,
-		SMA1303_0B_BST_TEST, BST_OFF_SLOPE_MASK, BST_OFF_SLOPE_2_6ns);
-	regmap_update_bits(sma1303->regmap,
-		SMA1303_0C_BST_TEST1, EN_SH_PRT_MASK, EN_SH_PRT_DISABLE);
-	regmap_write(sma1303->regmap, SMA1303_0E_MUTE_VOL_CTRL,	0x3F);
-	regmap_write(sma1303->regmap, SMA1303_10_SYSTEM_CTRL1, 0x04);
-
-	if (sma1303->stereo_two_chip == true) {
-		regmap_update_bits(sma1303->regmap,
-		SMA1303_11_SYSTEM_CTRL2, MONOMIX_MASK, MONOMIX_OFF);
-	} else {
-		regmap_update_bits(sma1303->regmap,
-		SMA1303_11_SYSTEM_CTRL2, MONOMIX_MASK, MONOMIX_ON);
-	}
-
-	regmap_write(sma1303->regmap, SMA1303_14_MODULATOR, 0x5c);
-	regmap_write(sma1303->regmap, SMA1303_3B_TEST1, 0x5A);
-	regmap_update_bits(sma1303->regmap, SMA1303_3C_TEST2,
-		SDM_SYNC_DIS_MASK, SDM_SYNC_DISABLE);
-	regmap_update_bits(sma1303->regmap, SMA1303_3F_ATEST2,
-			SPK_OUT_FREQ_MASK, SPK_OUT_FREQ_410K);
-	regmap_update_bits(sma1303->regmap, SMA1303_3F_ATEST2,
-			LOW_POWER_MODE_MASK, LOW_POWER_MODE_ENABLE);
-	regmap_write(sma1303->regmap, SMA1303_90_POSTSCALER, 0x26);
-	regmap_write(sma1303->regmap, SMA1303_91_CLASS_G_CTRL, 0x42);
-	regmap_write(sma1303->regmap, SMA1303_92_FDPEC_CTRL, 0xE0);
-	sma1303->flt_vdd_gain_status = (FLT_VDD_GAIN_3P10 >> 4);
-	regmap_write(sma1303->regmap, SMA1303_94_BOOST_CTRL1, 0x35);
-	regmap_write(sma1303->regmap, SMA1303_37_SLOPE_CTRL, 0x27);
-	regmap_write(sma1303->regmap, SMA1303_95_BOOST_CTRL2, 0x0C);
-	regmap_write(sma1303->regmap, SMA1303_97_BOOST_CTRL4,	0x95);
-	sma1303->bst_vol_lvl_status = (TRM_VBST_6P0 >> 2);
-	regmap_write(sma1303->regmap, SMA1303_96_BOOST_CTRL3, 0x42);
-	regmap_update_bits(sma1303->regmap,
-			SMA1303_A2_TOP_MAN1, PLL_LOCK_SKIP_MASK,
-			PLL_LOCK_DISABLE);
-
-	dev_info(component->dev,
-		"%s init_vol is 0x%x\n", __func__, sma1303->init_vol);
-
-	return 0;
-}
-
 static int sma1303_probe(struct snd_soc_component *component)
 {
+	struct sma1303_priv *sma1303 = snd_soc_component_get_drvdata(component);
 	struct snd_soc_dapm_context *dapm =
 		snd_soc_component_get_dapm(component);
 	char *dapm_widget_str = NULL;
-	int prefix_len = 0, str_max = 30;
+	int prefix_len = 0, str_max = 30, ret = 0, i = 0;
+	unsigned int status, otp_stat;
 
 	if (component->name_prefix != NULL) {
 		dev_info(component->dev, "%s : component name prefix - %s\n",
@@ -3048,9 +1761,51 @@ static int sma1303_probe(struct snd_soc_component *component)
 
 	snd_soc_dapm_sync(dapm);
 
-	sma1303_reset(component);
+	ret += sma1303_regmap_update_bits(
+			sma1303->regmap, component->dev,
+			SMA1303_00_SYSTEM_CTRL,
+			RESETBYI2C_MASK, RESETBYI2C_RESET);
 
-	return 0;
+	ret += regmap_read(sma1303->regmap, SMA1303_FF_DEVICE_INDEX, &status);
+	if (ret < 0) {
+		dev_err(sma1303->dev,
+			"failed to read, register: %02X, ret: %d\n",
+				SMA1303_FF_DEVICE_INDEX, ret);
+		return ret;
+	}
+	sma1303->rev_num = status & REV_NUM_STATUS;
+	if (sma1303->rev_num == REV_NUM_TV0)
+		dev_info(component->dev, "SMA1303 Trimming Version 0\n");
+	else if (sma1303->rev_num == REV_NUM_TV1)
+		dev_info(component->dev, "SMA1303 Trimming Version 1\n");
+
+	ret += regmap_read(sma1303->regmap, SMA1303_FB_STATUS2, &otp_stat);
+	if (ret < 0)
+		dev_err(sma1303->dev,
+			"failed to read, register: %02X, ret: %d\n",
+				SMA1303_FF_DEVICE_INDEX, ret);
+
+	if (((sma1303->rev_num == REV_NUM_TV0) &&
+		((otp_stat & 0x0E) == OTP_STAT_OK_0)) ||
+		((sma1303->rev_num != REV_NUM_TV0) &&
+		((otp_stat & 0x0C) == OTP_STAT_OK_1)))
+		dev_info(component->dev, "SMA1303 OTP Status Successful\n");
+	else
+		dev_info(component->dev, "SMA1303 OTP Status Fail\n");
+
+	for (i = 0; i < (unsigned int)ARRAY_SIZE(sma1303_reg_def); i++)
+		ret += sma1303_regmap_write(
+				sma1303->regmap, component->dev,
+				sma1303_reg_def[i].reg,
+				sma1303_reg_def[i].def);
+
+	ret += sma1303_regmap_write(sma1303->regmap, component->dev,
+			SMA1303_0A_SPK_VOL, sma1303->init_vol);
+
+	dev_info(component->dev,
+		"%s init_vol is 0x%x\n", __func__, sma1303->init_vol);
+
+	return ret;
 }
 
 static void sma1303_remove(struct snd_soc_component *component)
@@ -3058,7 +1813,6 @@ static void sma1303_remove(struct snd_soc_component *component)
 	struct sma1303_priv *sma1303 = snd_soc_component_get_drvdata(component);
 
 	cancel_delayed_work_sync(&sma1303->check_fault_work);
-	sma1303_set_bias_level(component, SND_SOC_BIAS_OFF);
 }
 
 static const struct snd_soc_component_driver sma1303_component = {
@@ -3195,29 +1949,6 @@ static int sma1303_i2c_probe(struct i2c_client *client,
 	}
 
 	if (np) {
-		if (!of_property_read_u32(np, "init-vol", &value)) {
-			dev_info(&client->dev,
-				"init_vol is 0x%x from DT\n", value);
-			sma1303->init_vol = value;
-		} else {
-			dev_info(&client->dev,
-				"init_vol is set with 0x31(-0.5dB)\n");
-			sma1303->init_vol = 0x31;
-		}
-		if (of_property_read_bool(np, "stereo-two-chip")) {
-			dev_info(&client->dev, "Stereo for two chip solution\n");
-				sma1303->stereo_two_chip = true;
-		} else {
-			dev_info(&client->dev, "Mono for one chip solution\n");
-				sma1303->stereo_two_chip = false;
-		}
-		if (of_property_read_bool(np, "impossible-bst-ctrl")) {
-			dev_info(&client->dev, "Boost control setting is not possible\n");
-				sma1303->impossible_bst_ctrl = true;
-		} else {
-			dev_info(&client->dev, "Boost control setting is possible\n");
-				sma1303->impossible_bst_ctrl = false;
-		}
 		if (!of_property_read_u32(np, "tdm-slot-rx", &value)) {
 			dev_info(&client->dev,
 				"tdm slot rx is '%d' from DT\n", value);
@@ -3276,6 +2007,7 @@ static int sma1303_i2c_probe(struct i2c_client *client,
 	sma1303->last_over_temp = 0xC0;
 	sma1303->last_ocp_val = 0x0A;
 	sma1303->tsdw_cnt = 0;
+	sma1303->init_vol = 0x31;
 	sma1303->cur_vol = sma1303->init_vol;
 	sma1303->last_bclk = 0;
 
@@ -3291,11 +2023,10 @@ static int sma1303_i2c_probe(struct i2c_client *client,
 
 	i2c_set_clientdata(client, sma1303);
 
-	sma1303->sdo_bypass_flag = false;
-	sma1303->force_amp_power_down = false;
+	sma1303->amp_mode = ONE_CHIP_SOLUTION;
+	sma1303->usage_status = true;
 	sma1303->amp_power_status = false;
 	sma1303->check_fault_status = true;
-	sma1303->fault_reg_flag = true;
 	sma1303->pll_matches = sma1303_pll_matches;
 	sma1303->num_of_pll_matches =
 		ARRAY_SIZE(sma1303_pll_matches);
diff --git a/sound/soc/codecs/sma1303.h b/sound/soc/codecs/sma1303.h
index 377c8afbbed8..d1fa2acaba85 100644
--- a/sound/soc/codecs/sma1303.h
+++ b/sound/soc/codecs/sma1303.h
@@ -1,7 +1,7 @@
 /* SPDX-License-Identifier: GPL-2.0-or-later
  * sma1303.h -- sma1303 ALSA SoC Audio driver
  *
- * Copyright 2019 Silicon Mitus Corporation / Iron Device Corporation
+ * Copyright 2022 Iron Device Corporation
  *
  * This program is free software; you can redistribute it and/or modify
  * it under the terms of the GNU General Public License version 2 as
@@ -21,6 +21,11 @@
 #define  SMA1303_PLL_CLKIN_MCLK		0x02
 #define  SMA1303_PLL_CLKIN_BCLK		0x03
 
+#define  ONE_CHIP_SOLUTION		0x00
+#define  MONO_TWO_CHIP_SOLUTION		0x01
+#define  LEFT_TWO_CHIP_SOLUTION		0x02
+#define  RIGHT_TWO_CHIP_SOLUTION	0x03
+
 /*
  * SMA1303 Register Definition
  */
-- 
2.30.2

