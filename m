Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 57BFC6AB466
	for <lists+alsa-devel@lfdr.de>; Mon,  6 Mar 2023 02:46:32 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D1650102C;
	Mon,  6 Mar 2023 02:45:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D1650102C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678067189;
	bh=Y0yY69CrmttnHwXpiGgK3tf0Su7FjX+bKQ5zRhuF5NI=;
	h=From:Subject:To:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=S4SWtjOrW7fWQLcrmoGptpXup4xBYdgFWpQXnmC95+vaHCUVSdjqW9zHAwk0mg+SC
	 zk9tFCFt5Zv4nFtSAg9cPhrAEv5hxATnaH4o4iy0rCDxdzL34K5obN0CJaGryJctjB
	 it4q6BERQCl07ztdKovVG56brv+go0NZvkkSFLvo=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3B078F80431;
	Mon,  6 Mar 2023 02:45:39 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 744EEF80529; Mon,  6 Mar 2023 02:44:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No,
 score=-3.7 required=5.0 tests=AC_FROM_MANY_DOTS,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2070d.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::70d])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id AF250F804FE
	for <alsa-devel@alsa-project.org>; Mon,  6 Mar 2023 02:44:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AF250F804FE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=oRDuws8M
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UMx7JsB5Mx5Qy+L/M4f442pZ4G1Qz+5XLjE5Ukmdib7ETRXNibulcarnV/AeCkMX/otpCv0iWaDkfYf/f3/ngpUSI2k3LfI/AiXpAinWxpnC1MR0x2Y6PP6+puQvxgIv2beXoTJJ0QkupHyULb3sScXazmDIAp/bqkSAD9hOhNAby00TKhMNDXwsN0D67kX3pZW7rgjDr/w0dpADE1T57HfEY9ClkWuGktSbyN5pMDS1a1klX4v3Pk89fitlJ3z0rW2/rM2VO/q8x+zsdsjK2ck9wmdnOyvv4XvqLv64o8QOMUPB/wJTz0c7++tErkf3yQoyvu/J/3r4+eyKDFpmHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VU8urnfpBPxAuCPlP0pLaIrdaK/KbiDpprT1y3zi/Ss=;
 b=WDew/9Dfbfxfnr9QjxpFK5/l0SuiYiY3RGuthrkh7P1NJoFEnSkm/gmQr27Lh64cgTsVhTNUU5dt9uYkXf9+Xo0EsfcNqZAIxcFabPlSsWHANDuQU5vNuoswndedT3rCmVFpMUPRCOQ99Azjchcy8m97w/AiWEIhBzno6yLhTufSiftQ+MqhdUuj0SRggHVDdLKfMyD7MwBY8UlN3k7q7gETKKbAQIHD4dKbxu+QJktixq7+PJaI6FJPoVmX6Xn1MxGNsKKI/Vbs4avNvNFoO+8IkTqI631VQ9M4yFmSSW1K4RK98nTzFT30CsN8BY3TGwTsE/bXNIJnA4Jvrtkobw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VU8urnfpBPxAuCPlP0pLaIrdaK/KbiDpprT1y3zi/Ss=;
 b=oRDuws8MGuDTSV96mLbvs3FmLCL0fhQc4httKkUwou6eL2DsKD2Yukis5/Hz4qsrapIybb02GA+ilAN4r9KZ10JxFh0e5EW9j0DJ3gHDBaWAKgNHoNK2Apt14Uj6ub4m7DL4RXL4jqIlprr7e08Ege3eALzriQTpWe1XSyxfCco=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYCPR01MB9925.jpnprd01.prod.outlook.com (2603:1096:400:20f::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.27; Mon, 6 Mar
 2023 01:44:14 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::e03e:1938:695b:f472]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::e03e:1938:695b:f472%7]) with mapi id 15.20.6156.027; Mon, 6 Mar 2023
 01:44:14 +0000
Message-ID: <87ttyy64cy.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH] ASoC: soc-core.c: remove useless dev_dbg()
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 6 Mar 2023 01:44:13 +0000
X-ClientProxiedBy: TYBP286CA0048.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:404:10a::36) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYCPR01MB9925:EE_
X-MS-Office365-Filtering-Correlation-Id: e3d49b89-f175-405e-7e17-08db1de44a47
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	dZca/n1uah6kWlKg0gcT/X4auxyZ4k65bJhnfvunoZwKKFCkxw7rQNopPZVQKweSLBMMnb9QTgH7Ksp4XgcQ4F9J82CQpLtIfKW4lOCZZbVgmplq/iEaMh+O+dbeMaS0BXTg7ecAe+dl4gjXDHeBy5dbHmYcXmJo7DkZdwoMpzMST+9Ks+FYD+k8wKVcUJsQcvzTpHK3ntCs8hmBPFpOPQ5xUgi5tflwINMFPW9gYSkpzIFwh+/QKUiqsLa+TOkXT0NnNZ9fy65i56HUJzyMxqRGqLg28C4dX+xJws2eRIC8LLmdyO8rxxPWdnpOB8jT54YMD2YqAJhG8zwlEeJn7C1TLB+yeFQ8+M45O1j4iaRrE8JYbfrRKeBtjapFMQXv+ntdA1IgX5fpTyfhv25sRFACD/73QnFJu7wbCQANQGu5x65VURVuRHtYKfH5U8acufuxaSCxe7qiGJ33WWHSEOE+YV4Q1DrS1N5UZICCIXvBFjTfisKz9nqVitPMk6a1qOuvp5EEbHP5lFfyFJCN/dHOjVLbQG9RewzzLilZY0m/7LzCh0AHrREzdqcp0zYhUr6KuDygO5WyzvPBifa8QsDo7GIB3bsmrJ73Cz6QB21YRgymjbWCxrp0XTUCLRFHkwEiL2ZfzHOMpb0yan3+XKfUCjWgGQ7xVmfuaHYMipdU65IZpg921FRc60vOSiPtC0bMSsWbQT5FSgbKl0yurQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(346002)(376002)(136003)(39860400002)(366004)(396003)(451199018)(36756003)(83380400001)(6506007)(6512007)(186003)(26005)(52116002)(2616005)(6486002)(41300700001)(8936002)(66476007)(66556008)(66946007)(86362001)(4326008)(2906002)(8676002)(6916009)(5660300002)(316002)(38350700002)(38100700002)(478600001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?JgbcSj1CIn+XPrycUIvcLHcTCYetlULYD4/l/UZnmcZMukXhyHlqQYbO7Zzv?=
 =?us-ascii?Q?i9hza/IcgG7LL6M3bXZ/F7V6Y1hmzBzWt382SDrLFABE1YraDz+shvbj59Rs?=
 =?us-ascii?Q?IX+6yx1D5xXvnp25V6okIzcgai1+au6YeiTMQvNt9Cx4kxJsKVG+LRI28STp?=
 =?us-ascii?Q?DYoIWJ+KbMzuAV2rLuMfg4yKfWzohyaa6w9B70dYuHGtWB1NNPK7/ofKRb+Q?=
 =?us-ascii?Q?Oon7XrXyOy5EVPUrVdNZYbyT6XkG8R2mFYJuiqiTKpkI4DEF5ODmsLyP0LtH?=
 =?us-ascii?Q?IgBbI+YSZgk79rSJVwUlJZtI26KnQNOBCAN8h/gXi2D5EmsxDFgdgwLbgWPz?=
 =?us-ascii?Q?SF4Lbg4L7oWrAqpNZbh/ILF+MQYz8RijiAOEetuZB/f7SlCdocE9xqsXfbwz?=
 =?us-ascii?Q?CSNQHV9vSBwyyp2aCmqnDiuz1W4JJoIs2RA8/gazDYBEA+lwW6jFI+YjULGS?=
 =?us-ascii?Q?eqmU3Mc444aNwV0Olmm/upekej2Amq/fb+HRRBYp6GJiWQH4eBq5Ep2tMEYs?=
 =?us-ascii?Q?kLqovAbY6froyl5JHji1qJdBgZjdJ+miV4oGjpAEijE0G1KLbnG/c7lN7XYW?=
 =?us-ascii?Q?9WgIsuJIrxSZqnhH5rC35C6LOgB1CPYW5Ej19SQyXVD039THE4wu1cM+NtHG?=
 =?us-ascii?Q?shzPr5iRle0mAgywJuLvGWYta/oEO7NZPcO5EQ9KtIj1IfYt8UXONrOuoWJm?=
 =?us-ascii?Q?ziYgIkMDAn82a2/dWH/B2yXJqtDDSmrHmTVcwBnZPdPWICoSo8jR/qBqRpk7?=
 =?us-ascii?Q?vIFUi6KEvRi5kAghA5Nj3HIBk8hi6yE6yttqse41WXy4cW85UJId9y6aNNbb?=
 =?us-ascii?Q?I0EWHZAKNN8ULmHBJyTb2gM9oVrECscrFjF0Vu+v4/g/5nDI4EPqE98Q4ru1?=
 =?us-ascii?Q?eXbKLY4/o2fUi7uRd3U0OYUZe7swlLxvdKjrGSdxuT7KsJOvXAqNx7BJ4EvL?=
 =?us-ascii?Q?i7PcWJIOk6jPd0Se2Ia2M04Wxh4iRDzFB94rZF5h18Wze5RGe8x9J38JUHR/?=
 =?us-ascii?Q?4Z+YTE5n6e5D1lF0AVqY1jVb4iVMqlBxp/FDLwoGqoNSx9s81F1z9DxEj30/?=
 =?us-ascii?Q?c9bXqVj5FVzzvJjxS2glxq4dgk0SKHwWqLmU6wp8lv5r9yjflgopGtjVZFXU?=
 =?us-ascii?Q?2xhcnDBB79bGBG1g43cM3C7rsVrMfp4qqtZMgHFXPhBX9w3PXy+gK/hRoxxR?=
 =?us-ascii?Q?Fvt24ZAUYXtuk2+GU5JiBbfzXJj5pzCi2ujak6U4S5vndmg7Xio+aLMisbi1?=
 =?us-ascii?Q?84GzmSjQwdxrAv3dRmYSgGy3pWxxtJSarJ/boNLu+ecP6TKNVUclCtLM4uYQ?=
 =?us-ascii?Q?lBJ32rG6VMZn7PtIjefAB2GhyfPPLEwyFU0gCwX/dXCvuja26TvZRWnKfGMe?=
 =?us-ascii?Q?UQ56/AvCPoO39iVJnHFyIaRkvI0DIjOFjwUValS1kNGTlnkaNOw40C706v68?=
 =?us-ascii?Q?twTqx/cJUCoWhYBm5Nd9y0pBJ7lXBBgLyNi95ZrChjWE4I9cL1sTcKVlWYyq?=
 =?us-ascii?Q?7eocyhHI3z1X29sU6bWRlRn0PcoBDhQJh0aeVARObRSyJh13XyTTCIiW7VNo?=
 =?us-ascii?Q?OHTMuRP04VJjcITIHpvlmjB80jEutE0lD82WaPm3C/Ps10OyZ2TkgdJAPBBf?=
 =?us-ascii?Q?yXMMse1WenUme13fTAorALY=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 e3d49b89-f175-405e-7e17-08db1de44a47
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2023 01:44:13.9942
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 jegoerYXscTZngac/BdKDI02sBARTpY2/2uCXHCRYBhBAPCnJJ2HHqaJDHtm+Nv7psQFjxCPfNe9g4MU0qo387/LGuF16dhAbZF/L1Y/lvI66FB6nR4I1BG0TkoKNrE9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB9925
Message-ID-Hash: SPIQ3C46Y5WB32VIAC7H7WH74RRVBPOQ
X-Message-ID-Hash: SPIQ3C46Y5WB32VIAC7H7WH74RRVBPOQ
X-MailFrom: kuninori.morimoto.gx@renesas.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Linux-ALSA <alsa-devel@alsa-project.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SPIQ3C46Y5WB32VIAC7H7WH74RRVBPOQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

soc-core.c is using dev_dbg(), but some of them are useless.
It indicates many dev_dbg() at snd_soc_runtime_get_dai_fmt(),
but all of them are just noise, almost no meanings.

dev_dbg() on soc_probe_link_dais() indicates dai link and its
loop order, but it is just noise, no information.

dev_dbg() on snd_soc_register_dai() is duplicated.

This patch cleanup these.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/soc-core.c | 13 -------------
 1 file changed, 13 deletions(-)

diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 71b022f7edfd..2faa0d8d0d8e 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -1033,7 +1033,6 @@ static void snd_soc_runtime_get_dai_fmt(struct snd_soc_pcm_runtime *rtd)
 {
 	struct snd_soc_dai_link *dai_link = rtd->dai_link;
 	struct snd_soc_dai *dai, *not_used;
-	struct device *dev = rtd->dev;
 	u64 pos, possible_fmt;
 	unsigned int mask = 0, dai_fmt = 0;
 	int i, j, priority, pri, until;
@@ -1075,8 +1074,6 @@ static void snd_soc_runtime_get_dai_fmt(struct snd_soc_pcm_runtime *rtd)
 	 */
 	until = snd_soc_dai_get_fmt_max_priority(rtd);
 	for (priority = 1; priority <= until; priority++) {
-
-		dev_dbg(dev, "priority = %d\n", priority);
 		for_each_rtd_dais(rtd, j, not_used) {
 
 			possible_fmt = ULLONG_MAX;
@@ -1085,7 +1082,6 @@ static void snd_soc_runtime_get_dai_fmt(struct snd_soc_pcm_runtime *rtd)
 
 				pri = (j >= i) ? priority : priority - 1;
 				fmt = snd_soc_dai_get_fmt(dai, pri);
-				dev_dbg(dev, "%s: (pri, fmt) = (%d, %016llX)\n", dai->name, pri, fmt);
 				possible_fmt &= fmt;
 			}
 			if (possible_fmt)
@@ -1095,8 +1091,6 @@ static void snd_soc_runtime_get_dai_fmt(struct snd_soc_pcm_runtime *rtd)
 	/* Not Found */
 	return;
 found:
-	dev_dbg(dev, "found auto selected format: %016llX\n", possible_fmt);
-
 	/*
 	 * convert POSSIBLE_DAIFMT to DAIFMT
 	 *
@@ -1457,11 +1451,6 @@ static int soc_probe_link_dais(struct snd_soc_card *card)
 
 	for_each_comp_order(order) {
 		for_each_card_rtds(card, rtd) {
-
-			dev_dbg(card->dev,
-				"ASoC: probe %s dai link %d late %d\n",
-				card->name, rtd->num, order);
-
 			/* probe all rtd connected DAIs in good order */
 			ret = snd_soc_pcm_dai_probe(rtd, order);
 			if (ret)
@@ -2421,8 +2410,6 @@ struct snd_soc_dai *snd_soc_register_dai(struct snd_soc_component *component,
 	struct device *dev = component->dev;
 	struct snd_soc_dai *dai;
 
-	dev_dbg(dev, "ASoC: dynamically register DAI %s\n", dev_name(dev));
-
 	lockdep_assert_held(&client_mutex);
 
 	dai = devm_kzalloc(dev, sizeof(*dai), GFP_KERNEL);
-- 
2.25.1

