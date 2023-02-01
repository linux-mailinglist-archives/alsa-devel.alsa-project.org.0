Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 275A3685D02
	for <lists+alsa-devel@lfdr.de>; Wed,  1 Feb 2023 03:04:32 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3977ADEE;
	Wed,  1 Feb 2023 03:03:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3977ADEE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675217071;
	bh=6uqR5tACbc2JbNkpj0zFRwKwFEkhsW7lFOPLLOYbnXw=;
	h=From:Subject:To:In-Reply-To:References:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=ImYpt8q69A1XMXVoQgphBZfyJNr3GjDdCiZDoCZ8WaWYUbGBVjqnbRz3TMkATRvuF
	 A2lw0hi4uhkuSroxBhBwdp0gC0EUbrJV1yO/JZACM7Bkki9nFBaC0V1fOzKrIgz2jr
	 /O8QL5V43hVrU7bNANyHuRvQ7LFdOcpItk04cBds=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A751BF8055A;
	Wed,  1 Feb 2023 03:01:03 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 772D5F805C2; Wed,  1 Feb 2023 03:01:02 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from APC01-PSA-obe.outbound.protection.outlook.com
 (mail-psaapc01on2071f.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:feae::71f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 72D99F805B5
 for <alsa-devel@alsa-project.org>; Wed,  1 Feb 2023 03:00:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 72D99F805B5
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=D7SO5x2Z
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Dxu4WfgXmFK+ZV/876DRl2Qk+Ay+P2bOewkuQOmDGFUJIwGjHET+W/Fk8pp6U0KfpjDOi7k22WvF2FAeE2g5lEO9qEmouYoSZKNM4oSMfLPwY3401fWgzBv0wMIoTadCjIEOMSI7LX2GSh59RC/rsfmRBOx2I/mh0GhMNwxDll6kwAKYUQc1PohUUHqH3poQi/5xyUqZpggU9oYqCSAaCpKKBNuD3MwAsYuOmWWIZ0eTl9hezGTCaBu1nAp0uiITxUIUQkH89qALFMKiusS50o/Vd5z2FUxqW0BvyefVNaK11pz52/ygFCJ2U7G6qeQqXr9TbiyBmIkKUy9HfDJalA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EwH602cBiOgxqlwlXuVbOe1kRkUpaokcoM8mI6nHzRI=;
 b=eYPbbhalST2XC52VHNHYvaz6jJnjAX36BNq2K7ZCEXS+OK8dDavJsUS42EvQMvHRvE1MmpjNhaLLqIDJpbb+y6Q1G8AUOx2o+KpoWCtqR/ib5zNMNea/F4k8Z27tUd5f6SLCrlFwk+OhWuhJCg8cyIBOVENEkHipg7OccON99jC/vvnI4JIZA0NnAIAr9j/kpCC193INTZED/ErWsk99EeRV26C8xAH0bS0UUVIkwlS3QIk3Qxu9MMsJD78gfd28W/hgx6oIHGNGz9a99vU8bpbUrALHoa/lKTPh8GFH4pyDJ4tzoYdqyc5oUAvcx8YlmV7iI8at+I0CJkk/zPif8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EwH602cBiOgxqlwlXuVbOe1kRkUpaokcoM8mI6nHzRI=;
 b=D7SO5x2ZJvi3IeRjtokjO5Db0WYiONvDyo2yjgxi7tOd0ythAU9VdHv7yeX7Aty0xxY3x6IWeVrQMR41rYiC/bYTpPnmmRR4uPC+BTdDWOC0n0DgLzgJ9FCvkm2dpG4uUivFL0wZ5erxmtCvgWqVocAg8aKaqCYhtauocNPitbQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OS0PR01MB5444.jpnprd01.prod.outlook.com (2603:1096:604:ab::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.38; Wed, 1 Feb
 2023 02:00:49 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::4b75:8d8e:d89a:7860]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::4b75:8d8e:d89a:7860%8]) with mapi id 15.20.6043.036; Wed, 1 Feb 2023
 02:00:49 +0000
Message-ID: <87r0va5elq.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 13/15] ASoC: rsnd: dma.c: tidyup rsnd_dma_probe()
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
In-Reply-To: <87a61y6t8e.wl-kuninori.morimoto.gx@renesas.com>
References: <87a61y6t8e.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 1 Feb 2023 02:00:49 +0000
X-ClientProxiedBy: TYAPR01CA0163.jpnprd01.prod.outlook.com
 (2603:1096:404:7e::31) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|OS0PR01MB5444:EE_
X-MS-Office365-Filtering-Correlation-Id: e8db4a23-0d13-4dda-6957-08db03f82429
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tGcMPDzsrSYoHpRxEwlQzeQexMoA8mLqykI/ViwSxsSQdmy0uT7nv/trwThW20Aveu7j/YuJ4+tiWKbeTo0rTK6VprPf36p19j32JpN5TN1BKoRs8K/9+Gz3HTULBqyEJ2II3K1gkf25OBb9Gpya9vGgQ67IkncUorcniGTmBfncj388kSWAPUTFBywdGG52z7e4A6T6K3sIgZhjcn2HHEukxgEf0NEn3EIYctajfN53FVnMfwBIn+wF3dE+Fpi/n3gN2kn743M667R0UHZIyhG/MZRP7/Qx2sNK6ZnJ4G3B2A5f1mOAJUiYd5r/CP3cQiKOFOj5oR+r2B74GFdolWxFx7jpF6h4SeRWZsW6Sn3Ex4Sn2ukz1BH353IHy2GVjs2lAiZz83VM21y8v/Blz2xP4eYtZ80Tc9iE4vMa0j1+SUZFzDcaWGARP3wniW62l5yzC0qq7i26aJzOYlP6qAdEB14D8wdRxE42+V9sy0erKkSHnYzSBOxwKkcDhkABX9M4NHYsZXFVbdFMZAQrqTVNK29KJx96OzSzU6bWO+UvEAiMYUtgEscti9rsijMhQSYWAOnD0/zXducpFuXCUp+dxeSuuIGn9bHDyLeHMCfrYpNnVW48PhP9dM4uUfK56POV6PA27oZ9Mf44qvn104UxTxMCyIHy3LCeJDDmpD16JDB2AZCghV2dWxlRomGwTjbyCsVOIB2uzlkxM4mz2A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB8426.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(39860400002)(396003)(366004)(376002)(346002)(136003)(451199018)(2616005)(36756003)(6506007)(186003)(26005)(6486002)(478600001)(2906002)(86362001)(52116002)(6512007)(38100700002)(5660300002)(316002)(38350700002)(4326008)(6916009)(66556008)(66476007)(66946007)(83380400001)(8936002)(8676002)(41300700001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?jUqduj8wB5ICYWg8iBYpK3Yb0jJXODqnUlWJZQGggKwZ9FbPSLejwjSTI79g?=
 =?us-ascii?Q?ahOi010631/OMAYPt//Gw7TikJtzG+crz2+XTSJegGs+ZkZCSCktv2ypldg4?=
 =?us-ascii?Q?rx8I4tdHXzUTge/ghi7gHmqB9HQ1OydveUr/B7p3lccuKrLOdAmgNXQlYfsN?=
 =?us-ascii?Q?NfuMXPg6AEmar5maRgoP1E4Qco39PuslXDDr+YDhpFX5e3GVaqnPbriluW0g?=
 =?us-ascii?Q?mjE0gBHSFSaQ1t7DH4ppFl/0F8/5HPRHcIrzRj439MjQgC5N1RRR0BheKU6r?=
 =?us-ascii?Q?nHkRCGqsvNEYrUF+ynEqpRFVlpQ0YIJcw4eL4yr8WCqMds7b/tP3o0FgeIwf?=
 =?us-ascii?Q?p4LWSwgL/q+zOFOiKslDRBUvsemW8U+EDg7z4jofRAhrCbKtHhyfnDLEuggj?=
 =?us-ascii?Q?VK1mDCU4M6zpE423PJGMl6ultLGV2QF2HpG81pebNksCKi/Vj/4VPxCgijD4?=
 =?us-ascii?Q?Yg+jWYZBDfHKdfLvfl14cZwvcyKpUWH680siQt/pDBKjKoQhyxzexb6NJdlM?=
 =?us-ascii?Q?m37HPiTqMvdAKwwsAS7fz0spcRjxqXHhHOJ69A5MHeXevSv4T9+QJNkPgYz8?=
 =?us-ascii?Q?m2gp7Xia0tSH5Yq0nJtpe8uCYBGxS57NqGK2yia7SBSDdhTYB0YLg0usba/m?=
 =?us-ascii?Q?F3/OnRyvlnh4p5ydoVLPaV2kF2VF4XRQ8KxeULzkrLARk2+k8riwByedMACy?=
 =?us-ascii?Q?GALeNA98L7LM6lKV+vM+J37G6bD0jHerRW/suicYAPOecbpg2+ngJkyn3L3+?=
 =?us-ascii?Q?hUuajyl3tKc55t7XnYj5rKUZ9HmG9tDz9k68b43xzbwSHm+Agq6SHN7zm15A?=
 =?us-ascii?Q?Z6YxkAnZ53dlEYuS99HeAmFl9PkJeZ940v+7sURZRo4F67q7wxqFMWkhj2tp?=
 =?us-ascii?Q?bNFVs+BeZLEw85YuComrOctfdgB91+MEL5eI0D17zdJ/Y/V1p+yfqqxhgmUb?=
 =?us-ascii?Q?+bmHtGFNgzEgScHYZH/3xv1OwtZHor05b2R9ltPup7Xo8rmm3WTlikCpDTn9?=
 =?us-ascii?Q?dLaheS1zZlrIAhbx9ubzBvWHBlo9oGYcVLtsWW20aJcwpKmVenlf8vy4meze?=
 =?us-ascii?Q?hz6kHXJmrE9y1tFjUerrPEq0aRpOFLG5tMHVlY8RgRBUwvZAhBNB4PJAjZid?=
 =?us-ascii?Q?A49NSMoMfdV9Rtv+ppdnlYcQDzuughOXAPGC49vEHM4u0Qh2GIcdwM+2Ybtc?=
 =?us-ascii?Q?T+8KbDiKbJoIpVhVDvNaShzoAa/lN8Lq0s62sQP8sZMtKQjAfiSarFAP1qJh?=
 =?us-ascii?Q?dclgnO5bAjlrT4DSAjDphW/nV3h8aJ8CPw099o2EwwDQeWoh6p6OYb5HEdkG?=
 =?us-ascii?Q?1HvOwhcfvWffV1R+EkvpjEm1gZAcXBFPoIL2EsFfgvvN8jCtri1eHrHJSUY7?=
 =?us-ascii?Q?aQ4rhRm4QEzlRVgHYkDTSqC3uHvVU1eFh79Cx75EOj2/KkoJ4IG7aRlvfeoL?=
 =?us-ascii?Q?9F7eokVjfUez4AYm4ZKagDjd4nsGnwmXmcRGbF/rk81eGn8gX9SiKhvFwSA7?=
 =?us-ascii?Q?Yr3q/mvpqoaDaFBNQ/s9y3+eJqR4pSRmeWQv3D5M63jjiRJ23wUnCUQ0E6h/?=
 =?us-ascii?Q?Gb1Vuorr3miBpBU+769KrYrqD1yEWwx5gC8AxaBDsh1zFHrTRq0z0hSJFord?=
 =?us-ascii?Q?aiuRK1GDL4DcHqT42ExoSN8=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e8db4a23-0d13-4dda-6957-08db03f82429
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Feb 2023 02:00:49.7617 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7ajvBO1sEhC9l1hNfew7Cw0+cbfyDsscu/qJEbiNuqhqt3s3WDYtm61fSdwnftjH99E9rVVn1zMMVCY8CfhXK4sEBnqhfJ4LJU9vH6JdDWa+qbJTF+GJpmGuJlT/tyHI
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS0PR01MB5444
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
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

This patch tidyups rsnd_dma_probe(), but there is no effect.

This is prepare for Gen4 support.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/sh/rcar/dma.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/sound/soc/sh/rcar/dma.c b/sound/soc/sh/rcar/dma.c
index b422c3bd34de..9aca5ff791a3 100644
--- a/sound/soc/sh/rcar/dma.c
+++ b/sound/soc/sh/rcar/dma.c
@@ -885,13 +885,18 @@ int rsnd_dma_probe(struct rsnd_priv *priv)
 	/*
 	 * for Gen2 or later
 	 */
-	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "audmapp");
 	dmac = devm_kzalloc(dev, sizeof(*dmac), GFP_KERNEL);
-	if (!dmac || !res) {
+	if (!dmac) {
 		dev_err(dev, "dma allocate failed\n");
 		return 0; /* it will be PIO mode */
 	}
 
+	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "audmapp");
+	if (!res) {
+		dev_err(dev, "lack of audmapp in DT\n");
+		return 0; /* it will be PIO mode */
+	}
+
 	dmac->dmapp_num = 0;
 	dmac->ppres  = res->start;
 	dmac->ppbase = devm_ioremap_resource(dev, res);
-- 
2.25.1

