Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EB7F073616F
	for <lists+alsa-devel@lfdr.de>; Tue, 20 Jun 2023 04:16:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 333DF74C;
	Tue, 20 Jun 2023 04:16:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 333DF74C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687227416;
	bh=TKMcsJdjDct6fxgU3yrn2J1Au9docZmnkPHOF040L48=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=XsYz6m34VJV422J/Z1ylWQ8xT3uLxmV3GeCm9utuMLUOwGDxHpPw2mUKViNXxRzcM
	 Yba2qIal/XasE0BYSP92ZgYSoLTYgYzYCiyd54n8bi+FGNK2MuO6SHVywIo2Vo1RbW
	 IAIK/fEjbGTQA8bAN8dq+Irn/SldpSHaM/Xos/XY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 81D00F805AA; Tue, 20 Jun 2023 04:14:44 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DE80CF80589;
	Tue, 20 Jun 2023 04:14:43 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 28CA2F80589; Tue, 20 Jun 2023 04:14:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20716.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::716])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 59D81F8057A
	for <alsa-devel@alsa-project.org>; Tue, 20 Jun 2023 04:14:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 59D81F8057A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=Fj2Nh74b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NtUrrl2lzQr3tzXO/zvNAUNdhnZnZXmGsnSJia6WjB4c7lsM9KH/OHyGhouUCFNqgIpfGV0/Pw4JKucwBKDpQJ0o1g8NWZIUxKMGGmBotbdkUdjdJkNG+yp8A/IBmdZCbPkgbnkcCMt+tNunIeSrAxxbED7Zm6RDb/YD10KQDjCnQW+Wi9ViXaFC+11NmwFBCdaWdjzoio70v/dhBIdzfzK19X10WZHdnICdT0cksyV+BwSWqKSTYNxnxdfxlo3v9G1LmXQsUy21vBaBg82Ff/OMg9m9QFki6WDsVnIT4Pa5bAW9A4FO3JjdY1DAQNhT5nsUKRyp5WnL8x2kbBAUAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CPkSwybPvWp/m43idPntF7ZIzkj+MnuR1p14B9pv4T8=;
 b=Oyj50EMFHKFyzoJG5aNSZyyKtcfAnTAuBjHdo6mHNOB3mbkrh0BaTIjqhaL7t57MShVMsmVGOm5TcK9Ln4dNCN8qXRerx+rbvzSYGAQS/76KvCv3u5arIAlS2pg0+oUv57sKedXml+lhrJkU2XMIxEHQEBGcvmIPozDNu+t1MBHEa3lZctjRG9UzajwyyZV9KCtQxYZw6L5MAh4TbH6kbLhvhslYeVppemEBVopkcL1UEg498QPInfA8OB3nmFMkTlmHz/j4aqh5PWKp4I0hbuKtMQ9NdyPBpcA/VqdATDNYPPc9TgfB8jVxO8w9/JyXF3giAQ86huOgG2CkB7VbvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CPkSwybPvWp/m43idPntF7ZIzkj+MnuR1p14B9pv4T8=;
 b=Fj2Nh74bhusaGVEQ3essJPhSUgK9MdGVS60ltXskVHqv/23pl1Md549jxU62ZjMdo/m2XC5zsf2ufyYjX8JMHK8WZoQpSdThJ6bbd6elzP50FsfBlViWfLTKBRWfBHzq0Cs5ECKKwPIj2I2hc4iYt3BUr7ghUCAz1PVnDE5myqI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OS0PR01MB5665.jpnprd01.prod.outlook.com (2603:1096:604:b3::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.37; Tue, 20 Jun
 2023 02:14:30 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3ac7:b366:51f:3e26]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3ac7:b366:51f:3e26%6]) with mapi id 15.20.6500.029; Tue, 20 Jun 2023
 02:14:30 +0000
Message-ID: <87legedgmy.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Jerome Brunet <jbrunet@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Takashi Iwai <tiwai@suse.com>
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 alsa-devel@alsa-project.org
Subject: [PATCH v3 5/9] ASoC: meson: use snd_soc_{of_}get_dlc()
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
In-Reply-To: <87sfamdgo1.wl-kuninori.morimoto.gx@renesas.com>
References: <87sfamdgo1.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 20 Jun 2023 02:14:30 +0000
X-ClientProxiedBy: TYCPR01CA0040.jpnprd01.prod.outlook.com
 (2603:1096:405:1::28) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|OS0PR01MB5665:EE_
X-MS-Office365-Filtering-Correlation-Id: fab83e48-9c41-4a09-ae7d-08db713414b9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	0BGMKGIKr+sae3rcLLMBrcbZVltxvRpmPVc0jqwb6EnbO5LiQucngvKXyEcRQ8+LCDD8rOwJ1pyiZR/XbgKT9gl/z/ZoT26fwdoXNruXqLC+m+X8ZHTV7QOHeR2uVC1LhrRqbxbtMjMAfXhwBt5RZJoECss5UU3SpKwDWZu0s8n3+vnPlgOIXWCx7tswkqZa/oAkRL9bOs/RfBdHAYBIl2EBxYiIf+KWWXv2ozAfvbyXuxcR7yZYSfwbb6BuCh9tGJRVsaG9DwEnGpDQSCH8EFrS2hBmsL4WlTakQE8oKvyjLTFc9VO+tKSh3fGB4qtkWEm0W2XiMmuIXzBwdKLUFwY0REbJCiAC8rzNqXfvT6hXO5BJUnnI3lkZ4GqbUR7oBcXVP+EtBGmqX2q9tjKfVMHjKNdJneLbtvTtWkU6mOxYqelc7fJyb+NgFf+UrdeifHdoFCCa5TXEhQN/rpo4t6nCBx4H6TJPMRYWpn6Z0hylrPAQYfbi1DPXQRbwhwdNsf4ud8GAKsYaceEGZOIQXe4BMUzWOtN1iX+B24R+TcyJqJ4zvQpL1IZDVLWU8UUcsWYT9+a/V3haEYhSMDzOYdZO0nbBZiaS28Ph9eg0zfKX5cxmt973cTkzquB6YrSL
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(136003)(376002)(346002)(366004)(396003)(451199021)(2906002)(5660300002)(8936002)(8676002)(36756003)(41300700001)(86362001)(478600001)(26005)(6506007)(6512007)(186003)(110136005)(52116002)(6486002)(66946007)(66556008)(66476007)(4326008)(316002)(38100700002)(38350700002)(2616005)(83380400001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?qDEN6GbUCvqpCsZJ9SX+n6w8jzT0o2cWPwUAoGNUwz9sEfj58AVYMlXmpbs5?=
 =?us-ascii?Q?wVNQvFZY6IPHVcytS657j58B/4GB9cwEkVWoSQ+T9NS8bF8TJMVewMJFk8Uc?=
 =?us-ascii?Q?aQ3cyFzI6ecvEJZO1i2BBYogZEvk85c0ORtBDinELguzOIb4AYTIXzLxvLpR?=
 =?us-ascii?Q?j6D0E+L+AEFcbZePDnvReqb/f9MQfhgfPxk8/k8+IvMKZwbxX2hPg00m/nBu?=
 =?us-ascii?Q?UO0hM6fbHHrj6hQL9u7GcZ1f0EtO83LTd8eCF9yOl/2gRWRfXifKbfrieD8q?=
 =?us-ascii?Q?alonYHoX1C4ZqkhN+wofdulOj1+gfrPzxkJxudOvYXDVA53L/UB2KmBbx5xF?=
 =?us-ascii?Q?Oy9aIuQdgs5R+0rg0Bp4V4ZeTvKhl0Y7Io/RupV8tJ7TgzcmsXIrWcHhVhJs?=
 =?us-ascii?Q?N+SNF4zFq2gwhZj11zwa9s7dwmmVU9TkgCUmhTUbbO8k2qSZ6eQ+jBIM7XTY?=
 =?us-ascii?Q?TwBB+L21bP/UWbY/IpA5QD2vPiC24pNhbYZoeuUo9nZjkYO74k5qXcQFhs4S?=
 =?us-ascii?Q?SQ+Ldu0f+69Fy624bZ8Ao8P2aGM7OLcDlhm0v2XDOMvhFiwO7Tg9m1vQhthO?=
 =?us-ascii?Q?HND0hDJgOx0nazqLgHfzDHdI1YrBzSc5G01MUgcqBmgXKnbYtzEUFhoKHHR7?=
 =?us-ascii?Q?6A3nDPdUmCp4N8J7FPjvyP+j5zzOnqk7tJtLM9Wkh74rm/CbGSQE2q/eKjep?=
 =?us-ascii?Q?862qxfnn1BPA9zX14mxul2wh1nM7VJ+W+NTcfhpClgyveU4xLU0WIObfXuLB?=
 =?us-ascii?Q?PPZgJWzOVNXTnDJPh2qBVEuH9zn+PEViLsUXdvSHEN15f3hlpP8x4CB96JkD?=
 =?us-ascii?Q?h+1bssc+RKlhHGfv283f8wlYJj1owx0T4hM4QwNOJZXAD6iuz9CEHEG3JQCI?=
 =?us-ascii?Q?nhe5l3tXXcjiZdi6Fc9vIiIhz/PofCFUKYOqWPATgJ6kN4fqrQp73yzWtm+P?=
 =?us-ascii?Q?8djiXaU8UKgxJt4wmeKdkM02ysiNhElodrgsggOeRTCxhhXDBR5fNZFdb/Qb?=
 =?us-ascii?Q?+/0ICo4KnObAUeH8W7D+VcxDSifPx8HLeI8WdwykpU+g9UPVbUDrYTNXYhEy?=
 =?us-ascii?Q?mTbI/rOStmgU1c40+4gXe8e6LA3VxGMGIyc2kMS3QUwR6dBp18Wbw9R3rrwR?=
 =?us-ascii?Q?WZuIqnnxSBDKpZ+h/V5BAZlo1zf7073Q6qamvNbXYas0wtdiTml74nWE07le?=
 =?us-ascii?Q?uDhHSn3xXZrP61LCBjnIKchyVN37Ccb3YrjINHx5otFomWozYXdie1sE2Dm6?=
 =?us-ascii?Q?94GOzoPzenQsy7Qq3dLOCgxsxC0dzj0ZZWXFDZhzY3itTOqtDe5k4smoz4cE?=
 =?us-ascii?Q?Mwd6hMmd3FvvZo9IaQTBDPwOX/xYWKFx8zUvFx1WJY+CAbC7M4FDMOhHn8ft?=
 =?us-ascii?Q?Pus6Fa5dT9C2qewY5hUv/3PFy0c59Jh6KHLncJArZuY7oB/K8JAyu++0BCHX?=
 =?us-ascii?Q?UAECsHBzHudVSRKBIS/aZIXMRnR8Um3x42yOQvCTc50xal7tUpQuKbUx8NFh?=
 =?us-ascii?Q?y2o9IO4pCQPHOiSRdqNvN9OeuXwp0mPid0rOOp1PphOV9/Ct8hofCJ90edw9?=
 =?us-ascii?Q?7PIGHcO/LV97GhDouql1h9fKfrtO3EG2uezQ6eDj2iqQupYJKyYqT8S7EuVG?=
 =?us-ascii?Q?s3E5FmYSQYE3SMWXdzBKdGY=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 fab83e48-9c41-4a09-ae7d-08db713414b9
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2023 02:14:30.4012
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 wrIAaDkBOsrLg/SVClMFuoCnwt9u4k6OPBxrHNTkL6AL9SNscaPSH0CkWt/CVKAB8KXUlvQ8arEewpwiHjkng0XjaCQlHo0MZu2Tfwm/HyliDt/uEWLpsnngyrfmx5HS
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS0PR01MB5665
Message-ID-Hash: TN3EKDWBCLSLV3QQLYYPCUIEFX6XEU2F
X-Message-ID-Hash: TN3EKDWBCLSLV3QQLYYPCUIEFX6XEU2F
X-MailFrom: kuninori.morimoto.gx@renesas.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TN3EKDWBCLSLV3QQLYYPCUIEFX6XEU2F/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Current ASoC has snd_soc_{of_}get_dai_name() to get DAI name
for dlc (snd_soc_dai_link_component).
But we now can use snd_soc_{of_}get_dlc() for it. Let's use it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/meson/axg-card.c         |  3 +--
 sound/soc/meson/gx-card.c          |  3 +--
 sound/soc/meson/meson-card-utils.c | 16 +++++-----------
 sound/soc/meson/meson-card.h       |  3 +--
 4 files changed, 8 insertions(+), 17 deletions(-)

diff --git a/sound/soc/meson/axg-card.c b/sound/soc/meson/axg-card.c
index 74e7cf0ef8d5..f10c0c17863e 100644
--- a/sound/soc/meson/axg-card.c
+++ b/sound/soc/meson/axg-card.c
@@ -319,8 +319,7 @@ static int axg_card_add_link(struct snd_soc_card *card, struct device_node *np,
 	dai_link->cpus = cpu;
 	dai_link->num_cpus = 1;
 
-	ret = meson_card_parse_dai(card, np, &dai_link->cpus->of_node,
-				   &dai_link->cpus->dai_name);
+	ret = meson_card_parse_dai(card, np, dai_link->cpus);
 	if (ret)
 		return ret;
 
diff --git a/sound/soc/meson/gx-card.c b/sound/soc/meson/gx-card.c
index 58c411d3c489..a26b620fc177 100644
--- a/sound/soc/meson/gx-card.c
+++ b/sound/soc/meson/gx-card.c
@@ -90,8 +90,7 @@ static int gx_card_add_link(struct snd_soc_card *card, struct device_node *np,
 	dai_link->cpus = cpu;
 	dai_link->num_cpus = 1;
 
-	ret = meson_card_parse_dai(card, np, &dai_link->cpus->of_node,
-				   &dai_link->cpus->dai_name);
+	ret = meson_card_parse_dai(card, np, dai_link->cpus);
 	if (ret)
 		return ret;
 
diff --git a/sound/soc/meson/meson-card-utils.c b/sound/soc/meson/meson-card-utils.c
index ffc5111f9e3c..f7fd9c013e19 100644
--- a/sound/soc/meson/meson-card-utils.c
+++ b/sound/soc/meson/meson-card-utils.c
@@ -74,23 +74,18 @@ EXPORT_SYMBOL_GPL(meson_card_reallocate_links);
 
 int meson_card_parse_dai(struct snd_soc_card *card,
 			 struct device_node *node,
-			 struct device_node **dai_of_node,
-			 const char **dai_name)
+			 struct snd_soc_dai_link_component *dlc)
 {
-	struct of_phandle_args args;
 	int ret;
 
-	if (!dai_name || !dai_of_node || !node)
+	if (!dlc || !node)
 		return -EINVAL;
 
-	ret = of_parse_phandle_with_args(node, "sound-dai",
-					 "#sound-dai-cells", 0, &args);
+	ret = snd_soc_of_get_dlc(node, NULL, dlc, 0);
 	if (ret)
 		return dev_err_probe(card->dev, ret, "can't parse dai\n");
 
-	*dai_of_node = args.np;
-
-	return snd_soc_get_dai_name(&args, dai_name);
+	return ret;
 }
 EXPORT_SYMBOL_GPL(meson_card_parse_dai);
 
@@ -160,8 +155,7 @@ int meson_card_set_be_link(struct snd_soc_card *card,
 	link->num_codecs = num_codecs;
 
 	for_each_child_of_node(node, np) {
-		ret = meson_card_parse_dai(card, np, &codec->of_node,
-					   &codec->dai_name);
+		ret = meson_card_parse_dai(card, np, codec);
 		if (ret) {
 			of_node_put(np);
 			return ret;
diff --git a/sound/soc/meson/meson-card.h b/sound/soc/meson/meson-card.h
index 74314071c80d..a5374324a189 100644
--- a/sound/soc/meson/meson-card.h
+++ b/sound/soc/meson/meson-card.h
@@ -39,8 +39,7 @@ int meson_card_reallocate_links(struct snd_soc_card *card,
 				unsigned int num_links);
 int meson_card_parse_dai(struct snd_soc_card *card,
 			 struct device_node *node,
-			 struct device_node **dai_of_node,
-			 const char **dai_name);
+			 struct snd_soc_dai_link_component *dlc);
 int meson_card_set_be_link(struct snd_soc_card *card,
 			   struct snd_soc_dai_link *link,
 			   struct device_node *node);
-- 
2.25.1

