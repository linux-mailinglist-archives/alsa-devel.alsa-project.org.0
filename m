Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B6330737905
	for <lists+alsa-devel@lfdr.de>; Wed, 21 Jun 2023 04:20:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DC9C682B;
	Wed, 21 Jun 2023 04:19:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DC9C682B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687314026;
	bh=59JwKT+uxxPMWEDoXn+yhk0Tr7grUPlrfP/Gz55k8Og=;
	h=From:Subject:To:Cc:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=PMi4wIeh9mJDeh51WmUgTAlyX6GfSOHjXx6717Mk0DFErFnpfsaqdk6bq0vl83jT9
	 y6/cH/pq0m7ua2b8yOdk90y9h2OKRbocp5bCT7UwojjOXaEvqYK7iyWuXDYfZ8Mq4D
	 Q1nL5jvZ9/fZ8x4IuhRASX4YKCi2d3zv5Smsk/lI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 949D6F8057C; Wed, 21 Jun 2023 04:18:40 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 187EBF80579;
	Wed, 21 Jun 2023 04:18:40 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8D522F8057A; Wed, 21 Jun 2023 04:18:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on20700.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:7010::700])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9DE03F8055C
	for <alsa-devel@alsa-project.org>; Wed, 21 Jun 2023 04:18:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9DE03F8055C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=mhCA6mBr
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Jk/uju1NlFEfq9kWy+PK90N89rfR06LcdPPRSyxh0TlqVP58a/jZrf9H9Bd5fPiegq9K3/Y9rs6M76+P1K411PltQdOcnEauKHqOvetv/E4GhYRbL3YFac8xtz74NJKKf6Tsbp36cRTNHoxf8KsgDK0DhKOAeXjau08StFlX76GHz8/GPKEhjPEYcorkqm1MHip7+BWkru/QpAL9M4a0o1ss5bA/BtProUewt/+hcBVUOSHCaqiTCqj6JXIIalqyP7TZgzuiYqd84bmZfGdfdG90Gry8bG/LogJAFqMdhCL0zMNdOEzOKJl1uL67LLaohrkV4INNFjJj7wguA3YplQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p3bu54FfF1UkFL2NKVAoo12gBgoLh+yZcS4BaoU/9FE=;
 b=eYXwuWz3+iPd0aI1uIkicK/yQRniNAM5YoSF9msNXg45XVYGE+orkg4rWbFiVj7PF5zomJiFgvO9lwlj3fQDMRabm5ES2HSjjV2BmKTmOFhcgBGZZlN5+sbaa1Ox+X8dTG2/btWwT/oRqSGahtS+K0Pm9xX0s7ddDnbtzQ10xL7Ci/MBEaYil3uvQcj/BBbRZfaV8oIcFxgCqh6q2t9Qq9mTeG1WcBr82OPjTmjuNevx6oufLNIurJd1C4OW0+z9+Dxs4HOirwWvc8WlhJm3cjiUDRFu0Enw07fTAuA692fbzXm0EQLX7KU2I2oVTktE1ApjFzFCQdGO+FBIeMq8gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p3bu54FfF1UkFL2NKVAoo12gBgoLh+yZcS4BaoU/9FE=;
 b=mhCA6mBrQXcZ7FBzcjHP+GTZJrnhJkAhyhVCjvXDBUxu0MI4Nc78PgnU1QrWnJopa1aVaGzhN/J3s7FfdqZfWG5K8GuEB3LRUtKN8eN22KGKY8R7Rof1MnSHW91EdsNg2jjJbJPzZhrmgKrkI1DtHR5NJ8F2J2DmthWiIMNsvfo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYCPR01MB10367.jpnprd01.prod.outlook.com (2603:1096:400:243::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.23; Wed, 21 Jun
 2023 02:18:25 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3ac7:b366:51f:3e26]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3ac7:b366:51f:3e26%6]) with mapi id 15.20.6521.023; Wed, 21 Jun 2023
 02:18:25 +0000
Message-ID: <87mt0tblsf.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 03/14] ASoC: soc-dai.c: add DAI get/match functions
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
In-Reply-To: <87r0q5blta.wl-kuninori.morimoto.gx@renesas.com>
References: <87r0q5blta.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 21 Jun 2023 02:18:25 +0000
X-ClientProxiedBy: TYAPR01CA0202.jpnprd01.prod.outlook.com
 (2603:1096:404:29::22) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYCPR01MB10367:EE_
X-MS-Office365-Filtering-Correlation-Id: 74bbb0ff-2e52-4d93-52ff-08db71fdcb2b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	6IMjOcoAccvD54SvbTYupFsYcp+GbKlSQNfLK6SduMy2toIASLCAOWh/7a5KCFxanLjsahck7z3679Y7LiIS/QEUPN2+pJ1XhKqky6RLRn8K6hWqobG/pIEo1j69FdyV471hHAulFFve7+ww+PJn3AbrPhJC/iss/rVr353FEKmdCjdM/xwfZrtOVS/iYWFZXglcUFBvisqE4Cmg0+GtFiEcKfzFA5UOxr/7kKUiyoY0Xbjs4PVFYuknAEGFYhqHJ4kBOHrgCHNta3L3xgm0A2YuA2vRcrP9gxMNnY9N/JFcRgoL9XW6Zty3s1a/G2UsqmYiOLn1T+YU2wRlzQhJhtauPGHZb8t60BVXRRJ+Dh5L58fUAiD8qq6j0Nw4ZfMjdtokfwvtlt5S9/i3aCgbIcbWmEzp/kWUkjbZOJ5h4JUSjfXnOvI/qta2IMckZWLTHP2h64Yalp1fqXxgZjOiuyzkvM09svsmFoh69GG72da5a5pjGzrQ+/gp0CiiqCSUEZ6VJf0pFNOIsaIaTWgelaQnwj51g8b1qMgu7qC8qMPfc9zKXumRzYn0y2weToR1j+MnznobxU7N6v2osryhSbc4PuegLQzLk6t2/d2LEku8Brx1r6w+xjlikn01r2Gz
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(39860400002)(396003)(346002)(136003)(366004)(451199021)(66946007)(66476007)(66556008)(4326008)(6916009)(186003)(2616005)(38100700002)(38350700002)(86362001)(6506007)(26005)(6512007)(83380400001)(36756003)(478600001)(6486002)(52116002)(8936002)(8676002)(5660300002)(2906002)(316002)(41300700001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Xm0f9QmlfrL/FQLJR1u3UD6mwb4dw1k4pxxWZWiy/YHy7+C1N6voltSvRdtE?=
 =?us-ascii?Q?8PXU3G6XhBtAKTjVoPrcg2d+P9kHVL1SUx4OLdu2CnvTVK4/bZmJ+9QXu6AA?=
 =?us-ascii?Q?duEMMbbyCQIfwIsJ7b0Gqoqt2xaHIvaOpK3On84wQ/BGLj0SD8pZsLPQ6kHp?=
 =?us-ascii?Q?n4tf3IoiZxnWKZ+D/GNJT7SsjD9Zbi0dM4KVv7E8PUMNovko4WDd1N6Y8wse?=
 =?us-ascii?Q?krupircQhgAu+/WJtu/FqbMD64KLs/bpyjGH02LmEaubVsv6tCtk0AT6Naaw?=
 =?us-ascii?Q?2FileSOcjb6/TBejnPllec7xEnTqSAyecKJ2jWCEyB7c2LPtP0+CrDjRrm3V?=
 =?us-ascii?Q?4ZcrMdydyFCPAvSHZYAU7/NgCDdHxxa8QYcRw7+3eayDsPbnpdndUO4uhl1Y?=
 =?us-ascii?Q?eLpSYJWO9uW9vUisIQcUMjejlpshHoJYvcuIk1rMkF7TTmKbO6gTy9mVsNWk?=
 =?us-ascii?Q?LorjKaBMQpIOWk0y5nsWGnt55KEsk8aYa01bOO5Ywj9FKYNFHRuffhBAGgRr?=
 =?us-ascii?Q?06gRBl2wvuMhjT6DA6iaYAGSsVdN1D3GFtc4czdETDGhL9EDCgv+dKBPdOxH?=
 =?us-ascii?Q?mCdbojIUQrnGFu2z2nf/63uAUz+mMqP4HlSdpd669GWfUIC9OXr1/55GjdVH?=
 =?us-ascii?Q?Sp1pfcVs0Ple0aHB2N1oGM8TPpsv3aiqvX9lJ0zn9mEn5meRGOMVCZBFofBl?=
 =?us-ascii?Q?Yo6rvKko0FP7Nw/7KDQya8DdWBjZ+VCzdnjFs2Wcg0HZjwsfk2hHoqv/Dcxy?=
 =?us-ascii?Q?tpP5Le+c5y0S4AmbMySn9oOgXi1iySeIwkczluIXoDkgwQO9S8LwGkf8zpJE?=
 =?us-ascii?Q?s0Kma01d3S2PGWBiqpWc59TVbwAPdO/oXaE0YHXh5ys2pKtCq2rH5mLCNuXn?=
 =?us-ascii?Q?hkGm1Jj+WfCD7GwjHiYp+AwY+YWRf2dYwfCFmKkM0eGaylscQJIEBBuQhiOz?=
 =?us-ascii?Q?+J4fuvBrnteRgwGnp61nXZNmIydyoxKieb4YJ/fo8uUAF1E5yypuhqntQqay?=
 =?us-ascii?Q?eJKPgunI7YtISqRs0GrfVZe5EG44JcJ2vn77eqIVuxPFVUphGBFsJkQSjbA/?=
 =?us-ascii?Q?T/tN0p5Z8lPCqi4IYofMq24DNfdwlbbATE17NlG7bZ2SsebPN+/oBnRMckq6?=
 =?us-ascii?Q?xKPfySiERHcSTgcazZhIWuodcHKS+z8HmvmqGSROir5iTQWR1Vc70Ia/OwPf?=
 =?us-ascii?Q?nckHSFHXfbytR1dbRlStwp+Z4pQECanElPkrsme5RnO48vsZCo/mXE9n7bx+?=
 =?us-ascii?Q?+N3F0kYRqC+B5eoES/6i7HVaVYTXXOAdbaqf8jVsvqPcgzxTglHkgHoLlC+S?=
 =?us-ascii?Q?B7i6121kKBwQW2PTzOR3DnA8NVE2AO7qitCZioystKqUvjyHfZ7RaPvcgzBg?=
 =?us-ascii?Q?Agg4LyMDRVwInRvn/5QI44gEP9Bh5KnW6UiXmgp7gFnGD2B4yDO1vyO/WchN?=
 =?us-ascii?Q?S4VfzGI8+KZmc9HwwQXmQTO1omvK3VHf1eQOEE0Uwqu81mpXcQCo6SjFP/gA?=
 =?us-ascii?Q?YX7++YRAlD125Nbcc47WzrGTGogJzkJpSL7OseLfoc//GpHoeMk+w770740+?=
 =?us-ascii?Q?fFRMGcedP6vsO40sDpr87YWHjvWBlQBzUvrKCzr4neHTWqQeqIglkSY5zgKx?=
 =?us-ascii?Q?UjP7SwFUTKeZD9XvHQryLTk=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 74bbb0ff-2e52-4d93-52ff-08db71fdcb2b
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jun 2023 02:18:25.3998
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 s683M8HnSKDWjOCR3s3p0UdrUTDPwSaSLit1ICQaQV8wO6BJghRbUh7vnZaLBaT/VL9Gow+5kFV5cche59rrr+NAPzcqWgdsi8bRX47mSccpH1WZct0/J5bPKYqUUM74
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB10367
Message-ID-Hash: UEBBWT6U7MVH77CEZYBRENEH352ATO2J
X-Message-ID-Hash: UEBBWT6U7MVH77CEZYBRENEH352ATO2J
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UEBBWT6U7MVH77CEZYBRENEH352ATO2J/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Current ASoC is specifying and checking DAI name.
But where it came from and how to check was ambiguous.
This patch adds snd_soc_dai_name_get() / snd_soc_dlc_dai_is_match()
and makes it clear.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 include/sound/soc-dai.h |  2 ++
 sound/soc/soc-core.c    | 62 +++++++++++++++++++++++++++++++----------
 2 files changed, 49 insertions(+), 15 deletions(-)

diff --git a/include/sound/soc-dai.h b/include/sound/soc-dai.h
index e3906ecda740..a4538040e88d 100644
--- a/include/sound/soc-dai.h
+++ b/include/sound/soc-dai.h
@@ -271,6 +271,8 @@ int snd_soc_dai_compr_get_metadata(struct snd_soc_dai *dai,
 				   struct snd_compr_stream *cstream,
 				   struct snd_compr_metadata *metadata);
 
+const char *snd_soc_dai_name_get(struct snd_soc_dai *dai);
+
 struct snd_soc_dai_ops {
 	/*
 	 * DAI clocking configuration, all optional.
diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 4b66c6d87fa2..bd811d10b792 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -253,6 +253,47 @@ static inline int snd_soc_dlc_dai_is_empty(struct snd_soc_dai_link_component *dl
 	return !dlc->dai_name;
 }
 
+static int snd_soc_is_matching_dai(const struct snd_soc_dai_link_component *dlc,
+				   struct snd_soc_dai *dai)
+{
+	if (!dlc)
+		return 0;
+
+	if (!dlc->dai_name)
+		return 1;
+
+	/* see snd_soc_dai_name_get() */
+
+	if (strcmp(dlc->dai_name, dai->name) == 0)
+		return 1;
+
+	if (dai->driver->name &&
+	    strcmp(dai->driver->name, dlc->dai_name) == 0)
+		return 1;
+
+	if (dai->component->name &&
+	    strcmp(dlc->dai_name, dai->component->name) == 0)
+		return 1;
+
+	return 0;
+}
+
+const char *snd_soc_dai_name_get(struct snd_soc_dai *dai)
+{
+	/* see snd_soc_is_matching_dai() */
+	if (dai->name)
+		return dai->name;
+
+	if (dai->driver->name)
+		return dai->driver->name;
+
+	if (dai->component->name)
+		return dai->component->name;
+
+	return NULL;
+}
+EXPORT_SYMBOL_GPL(snd_soc_dai_name_get);
+
 static int snd_soc_rtd_add_component(struct snd_soc_pcm_runtime *rtd,
 				     struct snd_soc_component *component)
 {
@@ -810,18 +851,11 @@ struct snd_soc_dai *snd_soc_find_dai(
 	lockdep_assert_held(&client_mutex);
 
 	/* Find CPU DAI from registered DAIs */
-	for_each_component(component) {
-		if (!snd_soc_is_matching_component(dlc, component))
-			continue;
-		for_each_component_dais(component, dai) {
-			if (dlc->dai_name && strcmp(dai->name, dlc->dai_name)
-			    && (!dai->driver->name
-				|| strcmp(dai->driver->name, dlc->dai_name)))
-				continue;
-
-			return dai;
-		}
-	}
+	for_each_component(component)
+		if (snd_soc_is_matching_component(dlc, component))
+			for_each_component_dais(component, dai)
+				if (snd_soc_is_matching_dai(dlc, dai))
+					return dai;
 
 	return NULL;
 }
@@ -3315,9 +3349,7 @@ int snd_soc_get_dlc(const struct of_phandle_args *args, struct snd_soc_dai_link_
 			}
 
 			dlc->of_node	= args->np;
-			dlc->dai_name	= dai->driver->name;
-			if (!dlc->dai_name)
-				dlc->dai_name = pos->name;
+			dlc->dai_name	= snd_soc_dai_name_get(dai);
 		} else if (ret) {
 			/*
 			 * if another error than ENOTSUPP is returned go on and
-- 
2.25.1

