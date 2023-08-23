Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B1A4784DC0
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Aug 2023 02:20:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2E179827;
	Wed, 23 Aug 2023 02:20:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2E179827
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692750057;
	bh=b26ng2bZuN3dFeg+auLkkIGgsmF3bImaXUj7WtdQ/5I=;
	h=From:Subject:To:Cc:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=VxFBcifh4Q7C/rlDgB41C1mQFOyN/zM2Hse9YMvs9fqskVOeClxFuHUrf9eEdYSy6
	 vgjAJ2Vcn9kUUMRcsYNpXEaVIuOSmPitDBjK2lbjiUCLuXJNtVUlSxowcFPOubldEn
	 vlPnK44v8R9PuDXVlqYGiwCBEl1xMvvGDUW+0g/w=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 56D56F804DA; Wed, 23 Aug 2023 02:19:59 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C0CACF800F5;
	Wed, 23 Aug 2023 02:19:58 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C96A6F80158; Wed, 23 Aug 2023 02:19:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.8 required=5.0 tests=AC_FROM_MANY_DOTS,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=no autolearn_force=no
	version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on2072f.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:7010::72f])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6C594F80022
	for <alsa-devel@alsa-project.org>; Wed, 23 Aug 2023 02:19:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6C594F80022
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=KK4Mwlow
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cQ6urJY+HOd6FuF2A0pt1Bf4LzDNoUEqBejQsKiJwrusl9Hn2+HHi74YAUgczd5SuebOhM9i+7l9EVHOSFTeDOlT9B10V/uYI4kXQZZJj7F0XNR3ToZOfopQ9mxuLAwIASoWGEsAubLDi0ry+s4jwoLPaOihvYyoIcQbhr8dARz7RO2Vr6G5T/Fq9MnY4hpQ14IisXURKPQodKOp1oHlnDgTNpIDONhEo08fwzNCN3dNQI0TUtWpfjqWPGS94FsyWgrHp1RMhLgVWG3GVQKVFjcd/sd9ank+ZMzvBoScjDbUfnR2xEFH93Mksqk3KMmZJ6XZBFnxX95rgrh7Hwoj+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=npzJhzuJrVl4qev+NM8gEu4FG3X2HER3PT2bJV24lVI=;
 b=d4ulp8PcM+/CooZDZHcW4V3oQp7qVmfJDzRB0m3W8giA552Ifbk/8pzvi8lVjn85XHjuULSd7/VzRwebGGwj0Yp196w94WTJIbXa+2Rz/5wASknM0EC1k01OlBboIEpGtF8ejudUJTSS89hM0BhKCGAFjZFgp9iE8zFKaa94B54M8UZQGxL1bkG/jSZ6h7+9k3oMWVpleyTX+ZwA/zMXFqJM5Kzh1I7t9jmYnyq0Wp1pP6IfMWwFwywfmQt9bC85xqnbqfNB95QpLUtVRRuINWZal4lCylOyf1OvDamahbEFV4i3GJpleAlhuYnHwfSZYk+0NqyJozhzTjMlFWZZcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=npzJhzuJrVl4qev+NM8gEu4FG3X2HER3PT2bJV24lVI=;
 b=KK4MwlowA4HTitNxdw7z95ef+EgI+Xdh57Ofjaf9amIMAF1SulhbG4LVFs13dmvHaVLyAFsZLVaw9qkf4IMmKEUSZnuO9IOVNy3jKVlIrTR5QUXRbnnvu9b4GwDTBdxSGQHK0pnstuKbNiJhjfgdeChy1jyCbZbMpXHLBI+3dmc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB8440.jpnprd01.prod.outlook.com (2603:1096:400:15d::5)
 by OS0PR01MB6002.jpnprd01.prod.outlook.com (2603:1096:604:cf::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.26; Wed, 23 Aug
 2023 00:19:43 +0000
Received: from TYCPR01MB8440.jpnprd01.prod.outlook.com
 ([fe80::7b2c:6f3a:1aa:79d3]) by TYCPR01MB8440.jpnprd01.prod.outlook.com
 ([fe80::7b2c:6f3a:1aa:79d3%4]) with mapi id 15.20.6699.025; Wed, 23 Aug 2023
 00:19:43 +0000
Message-ID: <87edjuzk2p.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH] ASoC: audio-graph-card2: add comment for format property
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 23 Aug 2023 00:19:42 +0000
X-ClientProxiedBy: TY2PR02CA0063.apcprd02.prod.outlook.com
 (2603:1096:404:e2::27) To TYCPR01MB8440.jpnprd01.prod.outlook.com
 (2603:1096:400:15d::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB8440:EE_|OS0PR01MB6002:EE_
X-MS-Office365-Filtering-Correlation-Id: 312ff975-c6b9-4dbf-4603-08dba36ea608
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	d+iH2KtBWnDnXrn1ILq6X8fnad5hy5vS/zsvTD8BsOmTKQQLjS3GN1aSS6BLogFaEdzwUiU6oTC7YPPbyEfH5mtV2oRoKFW4kMqmvGjNINhPK0cpvGxA1+Wv2fQCHMFaztOYQgZEZtZPdj3QRmEg/FEazdxpwdq9gFPiadQAbvOjHkTw2VN2qRxdH8qdDDjtW5BaJ0TDxiUbeZvgsyr1wnYkq+aZdQloAlCq+A+TGhmImijsXW4XYQ/Doh5FCrKo5WTzCysgIo7ARqqOepS/YTgOoed8RJtzvjihEKEvxzJE17/TnN3DXOuJHiqktzmx/Y+zQaUeDHNdc+o04u+gQbQbGLP6/4w1/zCINtrRuEL2GqbZbs3JiUc2vHkytKh6olnfeHkPMgTYxTwTDoI33Ujpxbn/A/SGG9M7E+o+ROkAirS+bvwg0GHhBAGJjGcg7w4Ck1PacOR/BB7rUBXRlczjI96zb2vMTbzAyVN15qp920cEFWDxpYniS8wDVBI3V/6IjY1bhoBTTkYIryiLD/B1XI+2CigU73O15sFTMCgX47Hjq2bFlGiVV0AX0tyOYTFz5Ih1903v0JpR55Yeyc18xbXMUnsxA2LqoknVUlDMyCyqMC5VIXf+sYtQlgqm
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB8440.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(39860400002)(346002)(136003)(376002)(396003)(451199024)(186009)(1800799009)(36756003)(478600001)(86362001)(6486002)(66556008)(6506007)(66476007)(316002)(6916009)(66946007)(52116002)(41300700001)(6512007)(38350700002)(38100700002)(8676002)(4326008)(8936002)(5660300002)(26005)(2616005)(2906002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?ggVULQdXq1JvVwVPgPi52w2jG5JZQDTn8I8d/pGw2q3CrCi9h3GPtmD7jTDf?=
 =?us-ascii?Q?fU8CvI8KR5/+Xm4o5LYrPAlVaXaZ6DajbCFVFV+9E5TFIx5uBHwxGsonC4k7?=
 =?us-ascii?Q?dulHEgSbKZp6w8rnFf1iDwGKC77vFuxYtXYGHMkd5a2KVTpmbxJnEIjfx9gI?=
 =?us-ascii?Q?O9aYc5LTpTKAhANXtzlnAdeDTBPkMROm4nM9UAKgbW+gMRO9nb2ENi1Rly+C?=
 =?us-ascii?Q?hFu4sCLMcEtWUhxR5xahS73Fj4loXC87fsIvnLW14zYX+gCjhNNIGbD2+fFz?=
 =?us-ascii?Q?nEpI3DtOypxg9xEL2mCPTHOJ4nq10qDFi8IujuCQUIyPuFUtl6yCok8KaVuB?=
 =?us-ascii?Q?/h8rd6M6/y7hariDmHMGYNnxyXCysDWxsjUjopQ3hhVpvAnSfjCXOeFUmtoU?=
 =?us-ascii?Q?ElXCgBs4IupjLKWViyNXeGOzCeIdw8tox4WqWzL6iTY/9glGHg4oxEmIW/E7?=
 =?us-ascii?Q?rpMYhcA9rUKi7oLPHJ9DE6gKPXcNNlw9XA2Ch5dGznOG5Jpbz2c+nj0cRqVM?=
 =?us-ascii?Q?hARLPVXh9RSvcRfeHLzQeYIK9i9ShAFylu7TzO6vuzA0TI0/+rS2iJpq07DU?=
 =?us-ascii?Q?O2MfjtjjCed92bRsDlw8jmHPvDg6viFMEIp676RLkRww0k2d2+8s22xvszrp?=
 =?us-ascii?Q?OZjjoEJHpPNFAHC7Nq8xWXxyw5FGfTyEkRxyOJyQjuSyxFYaxyM89V+fH3by?=
 =?us-ascii?Q?J/ylJ2jgnIhDpi1UGJw158nwD6gSk5pzqio3ks6y9qYjC5Kr8ps10AjZRVxE?=
 =?us-ascii?Q?VqvmKtlsiIzF8wpJxRqCN/GkVvFM4vDgxCVAG1EjUNppsHGqTlr9TKQG4jtf?=
 =?us-ascii?Q?m/sk03yXhqWIXHmgE7rvZwjQacn7Rifus2ZUln2kXVxqZvXKzjTHryByd1TK?=
 =?us-ascii?Q?guZBHcos4NgcOO/lCfEUQEjvSktztm02LDqGzhiGwJa/f4h5qpStfwqTP1NN?=
 =?us-ascii?Q?sEWBi4dsIbvB3FC4EwVLwyXErUrbVQEtUdCfcjpAfiUcJuDG6GVvkF/kklUn?=
 =?us-ascii?Q?043nwL/wItnLlWneUitAwU1M3JPq98SnI7n7tjHQXpdj6wwtsProqGiIydB8?=
 =?us-ascii?Q?1SBu10yS8NoiVFQKv6+MNt21CUUCq8JFEHHEEv3DnQv6WTGRVgRDq2XHUdpm?=
 =?us-ascii?Q?S1RX5wti9ma9WysABS+h3+fvO6H3awhoWow8xpr8dOWPAaSIgBiSEsK7lbF8?=
 =?us-ascii?Q?eebwYLrzCnJOiE2P8O1Ct83wL+EmW5ngOURR0ijpl9oHYdQrer5SLI7LoKY9?=
 =?us-ascii?Q?iIZPwNAUIiBH/5YRo4ymCfR92d58zFkFMwKlzzcW1A62vM/Ywq8610L7ee31?=
 =?us-ascii?Q?EKkNWrdy4xSxpoN0BX4x3CjALUuuS3HgsLBwnrNV+KgRBzEcjVXQjTBtOV80?=
 =?us-ascii?Q?YW3clzaPLgr+zGZE+9Oxu1NLmDvoIyakAULQzb7peCgaPRoFw1BmQgGrV/YN?=
 =?us-ascii?Q?P8QHv5GPFJCao/LZRISoMtejEA2yahSyoO4nxBw279ytHiSBOp12nXv7ocTA?=
 =?us-ascii?Q?a38mkMiuq43WNe8HZjuQcDZ0VlNRVyVm1XszKc7N0ezaXi0rDUcQZhg7OHK7?=
 =?us-ascii?Q?BInryapY2wShTj/oclBvSIDLgxXsxuf/hgyG7fGLhjLTF3mGadlckpvgON0O?=
 =?us-ascii?Q?7Z3T7bR5qrlG4GNS0nYGIv0=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 312ff975-c6b9-4dbf-4603-08dba36ea608
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB8440.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2023 00:19:43.1174
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 ig31VuC7xRdGfZNO2FINM4zCbxSogn2sXb1ePp4fLnPLfFHOX/BcVaBJ89G0svcCtqjmh+uKb4DnXwnONGGKJkyaraz9Qxnh25Rqzy6AC4ragSAAgU9EG+oI6EqjsGkF
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS0PR01MB6002
Message-ID-Hash: NFJODEABDLLOR2QIHR4ADLIRT7DXVDMC
X-Message-ID-Hash: NFJODEABDLLOR2QIHR4ADLIRT7DXVDMC
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NFJODEABDLLOR2QIHR4ADLIRT7DXVDMC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

We don't need to have "format" property on DT any more if
CPU/Codec driver has .auto_selectable_formats settings
on snd_soc_dai_ops. The sample dtsi doesn't have it.
To avoid user confusion, this patch indicates it on comment.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 .../soc/generic/audio-graph-card2-custom-sample.dtsi |  7 +++++++
 sound/soc/generic/audio-graph-card2.c                | 12 ++++++++++++
 2 files changed, 19 insertions(+)

diff --git a/sound/soc/generic/audio-graph-card2-custom-sample.dtsi b/sound/soc/generic/audio-graph-card2-custom-sample.dtsi
index 2ac0de3c21da..8acaa2ddb335 100644
--- a/sound/soc/generic/audio-graph-card2-custom-sample.dtsi
+++ b/sound/soc/generic/audio-graph-card2-custom-sample.dtsi
@@ -34,6 +34,13 @@
  *		...
  *	};
  *
+ *
+ * Below sample doesn't use "format" property,
+ * because test-component driver (test-cpu/test-codec) is supporting
+ * snd_soc_dai_ops :: .auto_selectable_formats.
+ * see
+ *	snd_soc_runtime_get_dai_fmt()
+ *	linux/sound/soc/generic/test-component.c :: test_dai_formats
  */
 / {
 	/*
diff --git a/sound/soc/generic/audio-graph-card2.c b/sound/soc/generic/audio-graph-card2.c
index 542c4a114940..1fae810a2833 100644
--- a/sound/soc/generic/audio-graph-card2.c
+++ b/sound/soc/generic/audio-graph-card2.c
@@ -47,6 +47,18 @@
  see
 	graph_parse_daifmt().
 
+ "format" property is no longer needed on DT if both CPU/Codec drivers are
+ supporting snd_soc_dai_ops :: .auto_selectable_formats.
+ see
+	snd_soc_runtime_get_dai_fmt()
+
+	sample driver
+		linux/sound/soc/sh/rcar/core.c
+		linux/sound/soc/codecs/ak4613.c
+		linux/sound/soc/codecs/pcm3168a.c
+		linux/sound/soc/soc-utils.c
+		linux/sound/soc/generic/test-component.c
+
  ************************************
 	Normal Audio-Graph
  ************************************
-- 
2.25.1

