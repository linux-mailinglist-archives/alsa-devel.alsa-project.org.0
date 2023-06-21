Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D56A673790A
	for <lists+alsa-devel@lfdr.de>; Wed, 21 Jun 2023 04:21:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 68917839;
	Wed, 21 Jun 2023 04:20:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 68917839
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687314104;
	bh=ZvzEJLobR9oDwP+hTPdAaBeeLWsXG5emKgAs7ggy5j0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=G0QX1ch05ze+wP0c8Sjj5PUxNxlr5+xXD60vGU9IxxpLULYTmxR1DITB2Qd4AWY50
	 ua3ndMIco7ZMZdpogNH/R3zTe6UxTx9zGmPgIRtdHj8DS8ySje8wxHx5AW0HZxeY/W
	 aIA5x6fLEmy0U2cFUwKR6iq/+xgd+By3VzIfJ5mM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D9D0EF8055B; Wed, 21 Jun 2023 04:19:27 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1FD74F8055B;
	Wed, 21 Jun 2023 04:19:27 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DB714F80552; Wed, 21 Jun 2023 04:19:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on20714.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:7010::714])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B4F61F80552
	for <alsa-devel@alsa-project.org>; Wed, 21 Jun 2023 04:19:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B4F61F80552
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=NXTXQALt
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VoUVzcfk0cKWngq5IW57Y0dZwXVAd6FvGxzH3xnWhqZO9aqp2caQuY4kyu6CoAylRUIT4HR7scJFRt731FBFGpqNxXyQE6rI/5cLxtW8uos/mBdQHeguEINWFix5aRhrMX6Lp6+aVIQlb6QgludakAtTnPWtFOGVOHRivYtKl8NuDyVBJSObwUBduC/qwPaigW44ugKgzGlfftc3qeU9ujMuY3hy0nA75kRTAD/5fYl2sWjrl8P8FYyx3AQWplXD2F2cafyX5FoAXSGN0qq0h3tQUyS6uz3mAnW7T0EQT4dqYksh1ho0KEvzw/rsCck/1HQJC2sH3Y4Y5Zx54V0/OQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z7Nz3ovcO9NzCr9cuHSAciV97qMj4QaTT1NBStXRn+4=;
 b=ImWid2tl4b3osMPeVc/6NWkyo+V8PnPn4DWaIA8/kF+w+y3ccA3NDovtCYjXKBU0E/zP5gxSZlDItIASrkOC5zc/cddsBSjewvoMppWoKo6w+8C75Jio+9Q3z1WQPtNUbpVBNcjIjxea8PO+I1fYGrYNMDks29ByYClAau5aNKNpuO3MZVe/A5DUfOapjH/ijkC4mSbxeixjcADfsHMliYfQbyRXBXjQZpezwRBnzKnO1pSBAtCTzDdkNJ3o0LpDDpakyFhImsC1YAuGaLvTg5PnjnGKR+EKmxtWsmxI84KoyYI+1Ds3JsJdqTM/88ixBTlD0nkf9n8w1rgu6e8OXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z7Nz3ovcO9NzCr9cuHSAciV97qMj4QaTT1NBStXRn+4=;
 b=NXTXQALtOjPIYshNs++ewB1DP0W+GxucWlE689CO6QW0e6SkYxwxfys7GRJKGqRo9o/kGMTnIP0DZqY3rV5JeESkszc4qlm71h80t4scogP96WO3euk5BQ1V4pj/7HNP33Kv+etUZQlkHGcKak6LxDMzUdK8Z1MuxyLEz/8Bvmg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYWPR01MB9694.jpnprd01.prod.outlook.com (2603:1096:400:230::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.23; Wed, 21 Jun
 2023 02:19:14 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3ac7:b366:51f:3e26]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3ac7:b366:51f:3e26%6]) with mapi id 15.20.6521.023; Wed, 21 Jun 2023
 02:19:14 +0000
Message-ID: <87edm5blr2.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 09/14] ASoC: simple-card.c: enable multi Component support
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
In-Reply-To: <87r0q5blta.wl-kuninori.morimoto.gx@renesas.com>
References: <87r0q5blta.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 21 Jun 2023 02:19:13 +0000
X-ClientProxiedBy: TYAPR01CA0042.jpnprd01.prod.outlook.com
 (2603:1096:404:28::30) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYWPR01MB9694:EE_
X-MS-Office365-Filtering-Correlation-Id: 30946eb9-74ed-46da-4599-08db71fde817
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	4eD769D7z89I6/e/trW7P/HNcrJu2bW1hXthRnsefJ/DklmkCDrLU7LpbK1tsHWnoNawcjhuLP16/rL+fb173o83z2Q6ZnC9fwMvGciLlJIsqhx/hdrP94M5Wd6RC0DY+dTmBaRyzxtQABlJh8Y73Q1kZEKNR24pZaM9zvH3ScF1Y7/gt54pd3uGq5WEOtb7jpUH/dYbyleTRFFNEqllSXQdS40ZpaVHiRsvgo0EtjuED3ienAPEBxQGdnQQLRWbQFR66xei2u7v+/oZXV/9Xhh1lQQbhsQKq28CjLMI+UHn8TZh5Wdomrfetg6gPZ+Bi2XHTzj4UYK2s7GYY50RUHIbFZUOEAe+akesQ5lj/1mKfBt2A9/zTuh4LmP+ydi1SxCzlibB1ChVe/+Ic36xuIPaCFr8neXO4Q+5jsooCdLLzMaKgBCq2xbBaZWU0zlqPc72lfs5HSThED3YgG4wqQg7wVuoiB2mqeNcbmKay4p7f8rQE5MQ+ORGHVl2WmYE+mAjTCzv30sSJ5kk6qUAkHKnHINdlg5KNYYMBqRPsmS6WX6fq7pKGtbaS5m4evrNbS9/fiOkVzswpN+asYk6/l2ozi9rgl0MtGclV1EOjAtaS9uOzcXbwggtCICxbuoo
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(346002)(39860400002)(396003)(376002)(136003)(451199021)(36756003)(66946007)(66476007)(478600001)(83380400001)(52116002)(6486002)(5660300002)(86362001)(66556008)(2906002)(41300700001)(8936002)(316002)(4326008)(6916009)(8676002)(186003)(6512007)(38100700002)(38350700002)(6506007)(2616005)(26005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?UAiz09fX4RcQbOxvCPSYHGthgefbAyWZvelbR/RKPdNsUT9329rslQsYOVoc?=
 =?us-ascii?Q?SpkIbAs0FraWttugEr7WcPQOJEq4rocdowrvKdb1+mkailyFwbClGp8JLtD5?=
 =?us-ascii?Q?oPxQ67SSzRpwlPH9ZQZrUkHnxvWly/vpqNiVYJDkoJW4QR6aO795GcgOCH9a?=
 =?us-ascii?Q?xgTke0M/K5m3d/CvIWcKPPKNjf+TlDCpafM77Neq2ojKSBleybxh542r9Hov?=
 =?us-ascii?Q?yxtQcuerCen68K6L47qqm5cCZnSrpQ5S2TSjVJpRZuVbkyJQ42PK3aFVYzyh?=
 =?us-ascii?Q?xZACYxCEoCI/fFVSFTB+izeRH9RG7OsVlhvdkTrn1/VFPsHK/1Rw8SEy2Y9K?=
 =?us-ascii?Q?PFdjDbBD+V1glUX32yk/4rRIOsIa4SmwmlGDzrnuvFa43wsdegW9xc6F3u6X?=
 =?us-ascii?Q?cYQZgur1L+LPvZSHPmoZGj2K/jv50FvAVc+jGtDNmWTZ7vq2B+aQzbAkJjSD?=
 =?us-ascii?Q?CF8g39NOOUt2Rt7oALwujTwqqadKMnbmgRBMEA+krvrRB7EkvysQhmgu6+MV?=
 =?us-ascii?Q?8sMWeZjbNH3OWDlqgUCSene59NRALY3XdQ59Li7jpNzbQBIpJnfI7TFkRtkv?=
 =?us-ascii?Q?cd4PgJBA7dFEvZqkEFWWLa0ChhA0TtPi/KWeo+Y6m6ltmpgvQcffq8bUY2I2?=
 =?us-ascii?Q?xKw5UqXH03WvEF3L8KLGbOnLlrPM1lzLCD27J/zOVuebFWLfj6ATZX6qIXYr?=
 =?us-ascii?Q?mo4dl+Y4jb4NLLaxWalF6Xp+7iT11kbH2UfGZMr5KPCOodYsSMa1PYHQ2UW1?=
 =?us-ascii?Q?PKlL79ic0c2kFm2zw9NSWLCwO5CxTUB6XhKtgMcwNa5ITAYWmI/QzRko0G9u?=
 =?us-ascii?Q?GU7r40K/tF67a6/VJ660s9VeCxKqdD1scTumv/3RH6HN8laAyf/snXndEIlz?=
 =?us-ascii?Q?S1UGGEnviQXPCp392GAcHsbjfD2ZfFmc6+wEF7ag2EZ7ztDTY95y89CG5Vx2?=
 =?us-ascii?Q?5QUXYJTjNl1FFq3GTsMKiPS3DCNpgr0b6RCyBF9B4UUlnhY8bdhBILZtSbzE?=
 =?us-ascii?Q?H6xKHIDO1HUyEisgNYjturr78aCoyWZqy3fNzXwmJkvfbPc3kZlFMRdIqVG2?=
 =?us-ascii?Q?p874AjngOek3BBzs4RLgYNC2Xw+Iv7lQqCfooECyC5H2H9YfYALoL6xMBj/c?=
 =?us-ascii?Q?viiGmP9heWTh0yRk0t1ZJJUN73ZkOZzwhhCG2FMNnNNh7irvp5vd+K6dLd7Z?=
 =?us-ascii?Q?zzx1IN9D3d2k63ujnAcXsZH9QHWzcuLDzc920e76vXNk+M2d0JzajLNk1M9D?=
 =?us-ascii?Q?UI4IuwMgCvtTXT4Mcsm7hLig/3IeL8ap+j+hyXeEoAW/lF0MDUmjk8b+muhN?=
 =?us-ascii?Q?8W6mT5QwU262NvMnk40/0XshaiHNcfyMG3i4uUDhpf3pNfb7o5nZbwiPQTY1?=
 =?us-ascii?Q?OJfpRMDrHYMvsTBbQOu33SXQcozwsFuZckpumfPLYSKFtsrg8nC6DKH5DvHZ?=
 =?us-ascii?Q?cHrHsMxbfjJ2S+1ldY8Lit3gNScMNKkPwDHVFOVjc25EBh61xFqxEJOD3kOC?=
 =?us-ascii?Q?5DuYeo5uRRViHmb5KQGD61Co5DHWD5dnfXrmCseflfKEk8jbe/cpEuHsanyG?=
 =?us-ascii?Q?K7BkKenG4CZkyuK+Fwy6QUThR1ZNEzqg9tEeQ0gXezKXkfh7jzcN+UzUqrmo?=
 =?us-ascii?Q?5fBRl3zJ5Ogd6qLJkmrKphQ=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 30946eb9-74ed-46da-4599-08db71fde817
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jun 2023 02:19:14.6598
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 YI9bXQiTF0q3ik0qxxtg8Xn5NvZX1WQyBHDwahyLRXx/1n1HX3zJyvLGbCt92WXaI+D8hBtPOXln+9EqZiK/xO8caPSLVieiAI812KUuhQNoZAUAbHF+og9C+SBdLw67
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB9694
Message-ID-Hash: 6BTM55O22YTR4U54SWHBWE6GXMUSL6HQ
X-Message-ID-Hash: 6BTM55O22YTR4U54SWHBWE6GXMUSL6HQ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6BTM55O22YTR4U54SWHBWE6GXMUSL6HQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

If CPU/Codec driver keeps its DAI node, we can directly identify actual
DAI by using snd_soc_get_dai_via_args().
This means we can use multi Component.

This patch enables multi Component support for Simple Card

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/generic/simple-card.c | 20 ++++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/sound/soc/generic/simple-card.c b/sound/soc/generic/simple-card.c
index 0745bf6a09aa..9470b1e67f9e 100644
--- a/sound/soc/generic/simple-card.c
+++ b/sound/soc/generic/simple-card.c
@@ -52,11 +52,13 @@ static int asoc_simple_parse_platform(struct device_node *node,
 	return 0;
 }
 
-static int asoc_simple_parse_dai(struct device_node *node,
+static int asoc_simple_parse_dai(struct device *dev,
+				 struct device_node *node,
 				 struct snd_soc_dai_link_component *dlc,
 				 int *is_single_link)
 {
 	struct of_phandle_args args;
+	struct snd_soc_dai *dai;
 	int ret;
 
 	if (!node)
@@ -70,6 +72,19 @@ static int asoc_simple_parse_dai(struct device_node *node,
 	if (ret)
 		return ret;
 
+	/*
+	 * Try to find from DAI args
+	 */
+	dai = snd_soc_get_dai_via_args(&args);
+	if (dai) {
+		dlc->dai_name = snd_soc_dai_name_get(dai);
+		dlc->dai_args = snd_soc_copy_dai_args(dev, &args);
+		if (!dlc->dai_args)
+			return -ENOMEM;
+
+		goto parse_dai_end;
+	}
+
 	/*
 	 * FIXME
 	 *
@@ -93,6 +108,7 @@ static int asoc_simple_parse_dai(struct device_node *node,
 	if (ret < 0)
 		return ret;
 
+parse_dai_end:
 	if (is_single_link)
 		*is_single_link = !args.args_count;
 
@@ -156,7 +172,7 @@ static int simple_parse_node(struct asoc_simple_priv *priv,
 
 	simple_parse_mclk_fs(top, np, dai_props, prefix);
 
-	ret = asoc_simple_parse_dai(np, dlc, cpu);
+	ret = asoc_simple_parse_dai(dev, np, dlc, cpu);
 	if (ret)
 		return ret;
 
-- 
2.25.1

