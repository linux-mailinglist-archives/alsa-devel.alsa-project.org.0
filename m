Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CDB60562ACF
	for <lists+alsa-devel@lfdr.de>; Fri,  1 Jul 2022 07:19:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 70F4716D5;
	Fri,  1 Jul 2022 07:18:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 70F4716D5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656652775;
	bh=kbqjyszXmfA6bhThiPigmUaqWfmoON0qCgDwmK0wf50=;
	h=From:Subject:To:In-Reply-To:References:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=T2u5+lPnNDXhxtrVfk1Ob4sRukGhjK9DQD8YpRB5g0zYYC/WX/cHA1I8lnOEz9BtN
	 FCl2hA3ut37y6alByIoneE9s3FstXfDqoa7WEOvRV7+VDlM7CW1Y5sy1Kyig4Cbykz
	 KcECh9kTbkThl2yW1lz9oAAWphG5uVqBSswhqFcc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 60019F804E2;
	Fri,  1 Jul 2022 07:18:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 579BCF80535; Fri,  1 Jul 2022 07:18:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on2129.outbound.protection.outlook.com [40.107.114.129])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C63DBF80535
 for <alsa-devel@alsa-project.org>; Fri,  1 Jul 2022 07:18:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C63DBF80535
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com
 header.b="SAj+M2lL"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HJbrfHxRn/ovdLQJEFoY9IBv8o2UHyNT/iTR+bnJJyWKGwsciezK3FJxXoB4oA9L1SP+2+rDy9sUjkaUNtgQziR4RIbL/tsfTTsNMIl1K3MKtT8S8xLVddheToC1oV0POSk4Fw9e+mKa6zvY+l/xi9KUoPL0xNlRFTwUzaEPLMMWzbUgyCn/lT5LJc/sZNEQw3SaArTz5UwEEMFKIcC2NJueVaCRGJ/W6chRp48qBRZY1I6W1tz9ch3xMydEl5wV6bIeJ0GfbvfY1Ok8hsb/TS9rl9sWZyNdl972dVAOIo82dnQGOk+E3WdAnnYH8uBbuE7NAWctiy8ya8HDQa9j0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Tf1RWRnFQ0vBNJeGCtPt32wed/O4ckggnwinGirrCGk=;
 b=j4gFY0vx7a7gl+2D7H7uuPVI47+HpyCOqFYtW3sBPTPKA0Me6fGf+MsPThBg5CMNyjwynFVe0he1FQbRO0zRQtghEmgAJebqLReHMacE+N2myF3ofGQOv33KTIQ9kKOHF3m/6dUB/2E26o4OYF3OX04xXQofFEG7CqRJebgYBAbr2kIllAKE6K8dg8mWdg4b2C+ZvVotPULicOAU/hnpRql3Mvl3jtmpWIy/OxGzQIMrEh3ALA72Yc2R8nJCzvZNCaV++KNt58u2U12kgxrs6XUzPpWvq6wbCdea/m3kv9vaVXL3CCsEPQ8+h/RKTEyqdzApWdqz9VphY0flcQEFtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tf1RWRnFQ0vBNJeGCtPt32wed/O4ckggnwinGirrCGk=;
 b=SAj+M2lLqgDFDnUI2cFfFbpDei9Mj6G+og9ITxUxhhFCbfJek2SB6/suquWolG9IV0ASi6zP56tKES7hxMVXUJbjyUDs6HfUedKhv9bSG6201KpcsMmilvTcbzFLUdZ27mBBZ4yVS6hebj4L2Mc9aBV5HlO5g9ythvf28/wjO/U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYWPR01MB8838.jpnprd01.prod.outlook.com (2603:1096:400:17c::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.14; Fri, 1 Jul
 2022 05:18:15 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3838:1a73:ae46:bab2]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3838:1a73:ae46:bab2%5]) with mapi id 15.20.5395.014; Fri, 1 Jul 2022
 05:18:15 +0000
Message-ID: <87h741s961.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 1/6] ASoC: audio-graph-card2.c: use of_property_read_u32() for
 rate
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
In-Reply-To: <87ilohs96p.wl-kuninori.morimoto.gx@renesas.com>
References: <87ilohs96p.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Fri, 1 Jul 2022 05:18:14 +0000
X-ClientProxiedBy: TYBP286CA0039.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:404:10a::27) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 41a99cbf-269d-4796-ee35-08da5b211976
X-MS-TrafficTypeDiagnostic: TYWPR01MB8838:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /lOlVr5BzlYA4PxeGnvHCQyeRfCN7A55G5Tha4sZlxhlYzYnFKm9OxfE0uNDENE5Zcxho0oStqq6GWFTwKZTU/kCb7KCsM2JVKSlja6ty/cpIC1bYklAbzTB9tOLNAMRpLvwZ88CnmQvAZRAEm10VGC3/GtxZK7nrFvm4aD+su0+fdPvFAILEBr4BHEfhh7kwnTCxbqPy2iKHLdAqAJQOj+/yBSE2XsE+ct/z2BEArBUW672DFl9vQoIluJ/EY+iUF9kYWdgwt8J9K1ZYuMubBD76G7auJ6kLroksP6e5hMDR8o2MZ/efYr/kr4T3Zkj0RNEpvwi2L8NZSkBKwGSNLxnyjLHGAtW/tUzyV61l3STl9S08KQ4U6R5AcbR7ob7ljJZZ9ifHJcRng/slum+KzAkjtiDyLBvu46hRxhIn806dxMbjIKd5cKTR5vUisjdvEmpsKjQVk3PYvyQwH934i5kOF1Yo0YI9c8Q7uCMkTo/ecxbZMJcUbEZehKb5EWvJlas5SaaElBUEpuwglNmwIAVFfXQEmIBQM6satHt2eY7n6wc9NaGRiChlFWBQy5eWi4dKKGkgEpvt9ZyjlHV/2cVUXwAS5PJjpkB7xSHlpWQjMqfwkeBECg5JS9Wrig4a3A6lHdCMZq43VoTcLty+BsNQRiHrQ9hy6MkXC58WWjLw/JmuVPPspdcD0Vk8I1GIi1EINd4zFxFTM0Nhpx6pwLcywYE7Wu3jOpGy5zmb4J5ZH4obPsg9/7RFXHUJKqK0orFSjcU2vxAdbCR+y4voNmpLMhGgMdxZqJjZnQ0rxSH+/4ipi78b2EnAwa5tsQF
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB8426.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(136003)(376002)(346002)(396003)(39860400002)(366004)(186003)(2616005)(2906002)(6486002)(478600001)(83380400001)(36756003)(8936002)(26005)(5660300002)(6916009)(316002)(66476007)(6512007)(38350700002)(8676002)(66946007)(38100700002)(86362001)(4326008)(66556008)(41300700001)(6506007)(52116002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qJHT+QalPfW/5ABhejv1XLx0Mc1/jza0Bc3ssFJCmxbj3gmS4PCr7XwffX9v?=
 =?us-ascii?Q?ScLbqCUAPKZjJPGBfs55dpUBzrxCjgZYwlBlgKdJ3ZAO31aU7OgVr8jWhgpF?=
 =?us-ascii?Q?3w9Y+X4VkPQQ81I61EXnmIJZZDaRJ6/daj5KiNd+pJVGB3liRTas+LRAq7w2?=
 =?us-ascii?Q?S7b4AYHfcM1VN3oMb9aMlhkY8S6EB34ngSVGonEeqfHGDTV6DIKK5wW3sp50?=
 =?us-ascii?Q?a8BiEgTsUsNtC7utlU9K+gkQ/aiQrEtDUnxSNXYXDC7uNL6rzp+FSQ0ID2l4?=
 =?us-ascii?Q?dPMNzKff3ZKVqGaBSSV7sKesCz+Bledv9aOe3VUBz2kb6mqkTKhcJdX7ChfU?=
 =?us-ascii?Q?Toximtgrnvy3BKmgNELm92JGsuvDshogc5MhRMljy2h7UM75uFLF86UZpUeE?=
 =?us-ascii?Q?a4kYR2ZQNRP1twR9xxzW68cahBht7ITS3HKgNeO372lmezrVS780j+OoZ2V8?=
 =?us-ascii?Q?cgE8oRR9IOkLOlVwtEyZqNuMamnJFMErr+uRRw4yZvGVLAHMIvqA+n1plcyh?=
 =?us-ascii?Q?pvHBdUEMnOLidwFEHdZUG9OmfeLHKSPQH/+bq/O6wWmVyFuC0lOkKKAmmPmT?=
 =?us-ascii?Q?SMrJfHZkPSDEzw6SyDEM7CoD9PTN/Ns5uHAeFHDVlzhek3DIi758s4Hk2DMb?=
 =?us-ascii?Q?HCc6S/rxkIGK83IoqVn0SPAh24mX7ssWiQNLxgwOGnicXfSgrVYhDcpsVmjC?=
 =?us-ascii?Q?S9xVUGdREM39c3K8jvXsG213pwseril5Auoflx08Ty5MYBwK1LB5hbXKK5Bg?=
 =?us-ascii?Q?vHn/a2ms21s1qZ+MdR8qNxJWrwlrmNtuh7IMKfWpvsEk4jec4PE7Ir92hWNO?=
 =?us-ascii?Q?bSowzM217ecGNMSW6z2Fzfpd8yhI5eZaUkFFDco3HKgPcBXn/AQ4yjVbiO4D?=
 =?us-ascii?Q?IpupykNM5qnljjnRPy/wLZTQxawwEBL9GoPgN7tR6s90LlGWI+rooc1OwXnR?=
 =?us-ascii?Q?V6m1q7RHA1jLiMBALb43IFgLUvU2CtNr4MwF+jInwYBVecu9EDvx28AN2/ao?=
 =?us-ascii?Q?l9DwAG5Sf5q+BgV1b70gXvrt0Q7SNYuetSzY19S+z66zKrXsCH3x//l0QXTg?=
 =?us-ascii?Q?Yac9jIAVSBe/r4bsNhN9sgN6ieu6orstxeV7bU6VLGW08WZVSRbqc59wOtb7?=
 =?us-ascii?Q?rTNjzQHYI7BJ+TvImsoMb55h1X7j56TCcclES99v03do/KY2n1QUfn8FPlLs?=
 =?us-ascii?Q?6TQ46WucZTqtReUeNnKox+ytvkgELPx09Uic39SI8BHopnZHxwbYdu05reUD?=
 =?us-ascii?Q?nWZj9uslT/Eg75CRCD7Y4kaZKMbUCZcIHTc3iqGt8Y8twEH33bhUK2WZGXbw?=
 =?us-ascii?Q?1tFw17k75nd2ITJuMoMDa9Q/8AO6/37kjAXYrYRaceneLQ7BOHMt2qmj+M1R?=
 =?us-ascii?Q?NeO3q3tWknBO3pcuF76udPV95urttOTANn6s4PjrPe8MbtfUduoQlaaU86Wf?=
 =?us-ascii?Q?DyZZTmBEXSBT1FcLd5uOW01H2re2w/oDRgVNrPOyRo45QDeHvziDW3ntTxeV?=
 =?us-ascii?Q?ACIWqjF5vH58RcnnEJUU0ut6mENfRxaNtaKSAJ2LmDqEeyS+nbYwxWeQz61F?=
 =?us-ascii?Q?ib4bkSoK+J6qNaOZ+A3sjbmY2NvoU0mBJwruTNmLO6Ga3wkLWm5RUfUK5ota?=
 =?us-ascii?Q?53qZQ702mTnZeqB5uJhPUzQ=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 41a99cbf-269d-4796-ee35-08da5b211976
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2022 05:18:15.5743 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H9dL2ud0IOU2kXTSFBpYivWZVVtil5k2ajanDS1RECua6tIjC6/DSgZpZ23RAklh4szSHsTP9CRB5y6mdLNFiJNvnAHzMHkFgEAyrwdNVWoRvWeLCfOXuoB+0v3DfFbD
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB8838
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
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

From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Audio Graph Card2 is using of_get_property(), but it should use
of_property_read_u32() to getting rate. Otherwise the setting will be
strange value. This patch fixup it.

Fixes: c3a15c92a67b701 ("ASoC: audio-graph-card2: add Codec2Codec support")
Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/generic/audio-graph-card2.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/sound/soc/generic/audio-graph-card2.c b/sound/soc/generic/audio-graph-card2.c
index d34b29a49268..8e0628e6f2a0 100644
--- a/sound/soc/generic/audio-graph-card2.c
+++ b/sound/soc/generic/audio-graph-card2.c
@@ -856,7 +856,7 @@ int audio_graph2_link_c2c(struct asoc_simple_priv *priv,
 	struct device_node *port0, *port1, *ports;
 	struct device_node *codec0_port, *codec1_port;
 	struct device_node *ep0, *ep1;
-	u32 val;
+	u32 val = 0;
 	int ret = -EINVAL;
 
 	/*
@@ -880,7 +880,8 @@ int audio_graph2_link_c2c(struct asoc_simple_priv *priv,
 	ports = of_get_parent(port0);
 	port1 = of_get_next_child(ports, lnk);
 
-	if (!of_get_property(ports, "rate", &val)) {
+	of_property_read_u32(ports, "rate", &val);
+	if (!val) {
 		struct device *dev = simple_priv_to_dev(priv);
 
 		dev_err(dev, "Codec2Codec needs rate settings\n");
-- 
2.25.1

