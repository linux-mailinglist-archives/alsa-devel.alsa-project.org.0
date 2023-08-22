Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 503A678373E
	for <lists+alsa-devel@lfdr.de>; Tue, 22 Aug 2023 03:13:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2197584A;
	Tue, 22 Aug 2023 03:12:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2197584A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692666787;
	bh=sdiT6EcxQmtqvUQ5btMdBk8aOVn69yQ+KfWOs/MbeuU=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=DPRgUsv/5/G+0/FFcAK6kBAFW2rodMEe3r44/r7Hq5gd6Kz+gxoXrA5qEh5yc062G
	 N9eyTo3YdjVSj4xQ80XPv70YubBUajNYTsbF9/YDtpim7KDIl6r/zJlsGFFvVsVNcK
	 e58yVaO7lqhNAzEpee+hHgfspKhqAgI89au3+q9k=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EF32EF8055B; Tue, 22 Aug 2023 03:11:36 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4D3ACF80557;
	Tue, 22 Aug 2023 03:11:36 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1B974F8055A; Tue, 22 Aug 2023 03:11:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.8 required=5.0 tests=AC_FROM_MANY_DOTS,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=no autolearn_force=no
	version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on2070f.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:7010::70f])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6B188F80537
	for <alsa-devel@alsa-project.org>; Tue, 22 Aug 2023 03:11:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6B188F80537
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=GM63h8pw
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GtijsbHv8gzsMU5ntqohuukFyTKou9SYxCO8CIOGw4c9pmElHsf0h66M7a0KYoJ7sI3/KX/DS9PzL1N5iNzah6vzoK3pW8d6qkJTBT2vy5Sv9PTyAKrpgPIXAEJ3O0yuTnQIt/+AUQ2D4XMoPl/qXRd4iEV4zD3l0AW1MRi66SGbaZ9F4jlgX4gKDMF4BOTLPmAGPz84zXifa/eCeMC5ldTcygnIdn0iiMYRFKsUwjF1JiCUv2/3cfwFhmLF4Azl047nZXKZy+ItjsNG1D36nPylvGmpJAHyA1njb7vWO8ucc3kjx8hEbNY+TVRFhlqtesE4Z7r1arrmVXjUM3BMGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=grYvWVf/lyhiz9k75Rm+433jJpF+DwuCtQpNEQ9hgMM=;
 b=TMSfH96eqZ4JzaFuiMrq6bttZyy5WpK86NhvfoUmnDXaH1l1AYj7MdB15+ejwhNNehYVKR9m79PE34ww4D6x7UxLOextxJ3mayNmjAWr1v3NQVybSWS5h0/28v+iXIMUUqeTTduIq6GMcJCkEEV1NIIw2KqVIGFLPzDa1LzOsUeAV1Q64tM6WNXEfuvKEMU0Jpg7mprsVCoH7oEQPQZyds4N+oHO9nm5jOnros9HJhfUk9lP+tWji69ziPmcWGE/QnO6Z77qhlXTUB2CIZCXarOZDMnGHr4zhVUpff8SwSvrXC+1cGhG0TL8+hXye3cd1K/XlSba/T8brTufsYNFNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=grYvWVf/lyhiz9k75Rm+433jJpF+DwuCtQpNEQ9hgMM=;
 b=GM63h8pwM/KnUcKXYhwIymNaGuHICF2h5+Cdd8v8Eu/s8n3e5YIfqWtu0Dv1IBY8i18wgNgTD3ua2TArXugxqCSiXWSrN+zF5BP2Ry35mSPPrTmkhk0uuK6Uj4A+gH15kfcA1NwT0CWTV0yggFuS4V/bHmxMqtJz3QRejOKWe2s=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYWPR01MB9708.jpnprd01.prod.outlook.com (2603:1096:400:232::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.25; Tue, 22 Aug
 2023 01:11:23 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::8c08:d94c:8e54:9b5d]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::8c08:d94c:8e54:9b5d%5]) with mapi id 15.20.6699.025; Tue, 22 Aug 2023
 01:11:23 +0000
Message-ID: <878ra3ubid.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Daniel Mack <daniel@zonque.org>,
 Haojian Zhuang <haojian.zhuang@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Robert Jarzmik <robert.jarzmik@free.fr>, Takashi Iwai <tiwai@suse.com>,
 Yangtao Li <frank.li@vivo.com>
Cc: alsa-devel@alsa-project.org
Subject: [PATCH] ASoC: pxa: merge DAI call back functions into ops
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 22 Aug 2023 01:11:23 +0000
X-ClientProxiedBy: TYAPR03CA0018.apcprd03.prod.outlook.com
 (2603:1096:404:14::30) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYWPR01MB9708:EE_
X-MS-Office365-Filtering-Correlation-Id: 74524163-2b74-4202-e233-08dba2acb398
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	TIq5Mus2MzWs6bRqOa0zD57pU+Zk9Q2WpvXUbQBeWkJVjpOQ+tldvHANPT12yv95bK4VCF0un8snhT8fTqCgRhZlOSJ8kEw016NdUpcu0mF2oe5W9slXPK366yJj2GD9jfBvET334zgYdNmfC1fweU1xpWYR5/ClC1Yz14iJxMT+NZvuB/lbZQObb8yScqdi0YTI0LeQzSmPL35O2s/BZMj5YwC4npMZFNe471mrZEakerVR76C36oaeYfsBuCJB6HOFhh+9+i4rbS+U2HaqzaSghbdj4hqQPB/VQn+Byscar7PJfZle6QziqTLoiVChJqH5VsUzVu5gja1+ppz7XCwryj3jp9OIGMHpCpo+rSkgN4ns/d8WvCJny9AlybNBOVAFQtG6usGhDwA1iHW0HnB8kRwU24Eaj7J4K+Jg4ANT4IIXB+gnE3FMqaQLKCMOqjtxYTdhPdgFMuexqQRe6r1gBavI2oHAYO6aMN3UeFvMlqpzYw1UCJRjv3nf46AafjNbv/JKl00LUM4jpiwTMRp6/VckD+NHTbYcUN43/Ui5Tt1gd6IpQOA/otAQVgOPSYYSxtDyamF9vihQ2o1GQco1gfsBYmad88Z9vk87pSmXXdy1Ar44c+WYMg9yx2JCc1/MOHyv2r8uJX4higtz7A==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(376002)(346002)(366004)(396003)(39860400002)(451199024)(1800799009)(186009)(2906002)(110136005)(36756003)(316002)(66476007)(66556008)(66946007)(8936002)(8676002)(4326008)(5660300002)(6506007)(6486002)(6512007)(2616005)(26005)(52116002)(41300700001)(38100700002)(38350700002)(966005)(83380400001)(86362001)(478600001)(41080700001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?8MArGPNv/gRgiBRlV1pPE2FgWjzg8dmo7uxJZN+50aPcaYFI5g7toRfy4tRm?=
 =?us-ascii?Q?9MWauFwQSC0OH4laRR76Hzg1gV9fwSBmH2XsPyw4rVz16raQu5nHjT/hcRSq?=
 =?us-ascii?Q?kI29y9a39GQV4Mk3Q/+Bns1lVsnRGAzNnJyr94414+5V4n9YJYfGyXx7yiwD?=
 =?us-ascii?Q?FpqwDG8/Y1WxpprteFITg4rNye/ggMbfEa+kOrhCtzK23hn920sAlUzv2mBi?=
 =?us-ascii?Q?0RzG1s/Wyfsq1tNNq83opZqRnas4J7oj/A7uLm3n/S7cg/QAgT8X1sa2Xp/Y?=
 =?us-ascii?Q?BIhGLivK1m7A40ZO0DGNF/6dfBe3KzuQVROZge7HPkd3XFJdy7VPHnVvuUK8?=
 =?us-ascii?Q?xGweBDUmkK/yd34FNAw3VuxBF/rywejj5tlpmntJOlVUlH0H+OZi1PS7pprL?=
 =?us-ascii?Q?481jxAKnMa1HQXXdPPKUndZU0ai8ardqJIHluN6+vxYRvQBT5j/CkyFK3yws?=
 =?us-ascii?Q?r0yiMVNuF2LHK1d5noXLnamL0JU+SuN5OqhIA3oxmU5QmWuQeqJdUgfnhR1S?=
 =?us-ascii?Q?/Pfb+XjN9ZJlMoHaMsyuaQqAl9MwOymiM/y8NyKP6EcAKlTo5g9O5wxwEJWr?=
 =?us-ascii?Q?xDnP76QnFnllwO99YffEUQdiNVjCQ+d4/34dp7LZI/9yJjJcgjc94E0bt1aK?=
 =?us-ascii?Q?wuL2YaxgNaSTqH8L0Irf9OncMNeGRZO4odSm3ovfh0qtRpHS6Xea4tQsJNzx?=
 =?us-ascii?Q?JNjr1kd2SPGUPSzf6lKGUJL+Ci+1HczEgamlrr0uJFxcVwISyPtbIbtdnpl5?=
 =?us-ascii?Q?SK8D4x3WGXNDNwjTalpSCUuJRqPp6SzvPb3HTg2h/DPxaqqAPlcBOjb772ZQ?=
 =?us-ascii?Q?HsfW7vcIppbLDTIRFl5pNOw2nWYI+teign6yflmS9S4/FWm1uh1DXhIq+VNq?=
 =?us-ascii?Q?DGf/RJBmNgxl63PU6hjjVtwo1jOkVr5a3+vUW3A0Ie6TC+Q6xNTdni3E446p?=
 =?us-ascii?Q?iQoS6ZNI6v2Vh2qdDFp7vuIfK+delpNFSU1qS6QbVMfAWaBgeaWRWbwNB3OK?=
 =?us-ascii?Q?XeWvxoa23AaRhpaAS8rtIGbZ1VRbim9qJnNggsnwLmkUmj6w72PyB7Zwx8w5?=
 =?us-ascii?Q?RKkxZKQ0JmY/4vhPLWKQR9kcm7irp8NDDxHSXPD2FlQpuEiBIYSZXswAYbSt?=
 =?us-ascii?Q?uKzuZsZkznuTLcMG/hYfpOAVaig2QgcIwrVp2+TsLQbXZZyTwB6L7Kfu5C57?=
 =?us-ascii?Q?HGR1s6326LtWAn+8UbDpaEW79nM23pgYyEe9SpfEl5laO5gtZSjljRzey1cA?=
 =?us-ascii?Q?Gr3eMYvEwEOY/EmqmqSCzubG2d8B/Z04zkIHk6ratfT127kvctnS7a2gS52s?=
 =?us-ascii?Q?PdatLjazaIbxhlN8hAS2tELBVz/6H62zP7mKAPniCvIfAI9/XTpBm3bw6LsM?=
 =?us-ascii?Q?CeWiTV2HgRSo5u8XsfwvzVBilTfpi3CdOOka4Xa891JEa0hU8kbutXj61VkF?=
 =?us-ascii?Q?Xwexp/SAEjteXco2XoUEZzNiRggQZNTlqvfh0/lrn291EbKJspcTA+j+EYeT?=
 =?us-ascii?Q?+kpK/09Bb9XQMZ03LwNId8pAP08s8+ZhX5GG2UCyf+spAfxFDB25WQF2SHiL?=
 =?us-ascii?Q?g9DhWkDNfNmUuZGrxpcNyzPx2qPSNk8LD6ORogYUXg1J8Ey+e7qO8LB5kYru?=
 =?us-ascii?Q?SNjkJTeXo81Yo0NV3ojbYMc=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 74524163-2b74-4202-e233-08dba2acb398
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2023 01:11:23.5321
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 P7LPKVl3NohkWQ2xn2FEjrnEAprVnnPFoZvYRB7z14dPbc9lpZK4itTpPn4Hk2KyjvelYPzbYrxenH91r8mHwNaymkOJb0DQmHBq2uEghP5M9B+bLjiqiHVpBfxMbOnQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB9708
Message-ID-Hash: 5JY7FSOXZ5YTZA5LWGHKWEG2G577ZTZ2
X-Message-ID-Hash: 5JY7FSOXZ5YTZA5LWGHKWEG2G577ZTZ2
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5JY7FSOXZ5YTZA5LWGHKWEG2G577ZTZ2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

ALSA SoC merges DAI call backs into .ops.
This patch merge these into one.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202308151142.hoM5o9LV-lkp@intel.com/
Fixes: 446b31e89493 ("ASoC: soc-dai.h: remove unused call back functions")
Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/pxa/pxa2xx-i2s.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/pxa/pxa2xx-i2s.c b/sound/soc/pxa/pxa2xx-i2s.c
index 10636506b622..437bfccd04f8 100644
--- a/sound/soc/pxa/pxa2xx-i2s.c
+++ b/sound/soc/pxa/pxa2xx-i2s.c
@@ -329,6 +329,8 @@ static int  pxa2xx_i2s_remove(struct snd_soc_dai *dai)
 		SNDRV_PCM_RATE_48000 | SNDRV_PCM_RATE_96000)
 
 static const struct snd_soc_dai_ops pxa_i2s_dai_ops = {
+	.probe		= pxa2xx_i2s_probe,
+	.remove		= pxa2xx_i2s_remove,
 	.startup	= pxa2xx_i2s_startup,
 	.shutdown	= pxa2xx_i2s_shutdown,
 	.trigger	= pxa2xx_i2s_trigger,
@@ -338,8 +340,6 @@ static const struct snd_soc_dai_ops pxa_i2s_dai_ops = {
 };
 
 static struct snd_soc_dai_driver pxa_i2s_dai = {
-	.probe = pxa2xx_i2s_probe,
-	.remove = pxa2xx_i2s_remove,
 	.playback = {
 		.channels_min = 2,
 		.channels_max = 2,
-- 
2.25.1

