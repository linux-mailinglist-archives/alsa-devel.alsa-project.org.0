Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 32597685CF6
	for <lists+alsa-devel@lfdr.de>; Wed,  1 Feb 2023 03:02:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 125571E8;
	Wed,  1 Feb 2023 03:01:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 125571E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675216933;
	bh=IgjlsKVvdpy1x13nm46AKK0bCSaS5btydejTuueHaIE=;
	h=From:Subject:To:In-Reply-To:References:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=IdMnTrYSrALipP2ET9Qfxachihi/BXPRwPw4YsVdFNC2Ws6HBHlR/df0tZIoo9Ofn
	 Y2Gs50SXfCqeYRcBNVDm0vtUqHKcHEQpgXIpKkvqvka7TyO8WDW8Nv3thIiNc7+weY
	 YmLXGcwnSE8ABOx4c1gqCGnoAovb0WMsG69+bY/o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 507D9F80519;
	Wed,  1 Feb 2023 03:00:29 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 732F2F8053D; Wed,  1 Feb 2023 03:00:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_PASS,T_SPF_HELO_TEMPERROR,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from outbound.mail.protection.outlook.com
 (mail-sgaapc01on2071d.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:feab::71d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6D852F804EB
 for <alsa-devel@alsa-project.org>; Wed,  1 Feb 2023 03:00:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6D852F804EB
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=msjWe6TM
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UQYrfVmZT6IXgPiY1ydo8cQSOPPM1FJj56rlYyNO/tpeAlQsNY6EYV5Fcp/+8n7MrBEnldP2+9o/49Apg0gxlNF7JLlVQX9hcA6AjZJui7fzSXQvzwJ+2C/vDhsgBH37v0ojcolore/E2NtDT7WNpl6LQ5qecNY1bzCKb1BE52j/kpsugJX16l58nrT09zsDw2/M7UgcBqr39vO1OILQizPfPWw0+TrH9dd7LrTJSVfEwl4H90Cp+mdjLprujccM7z7xXNHElOujqrZG763p7CX2kqMYjY+nUrN9e8vut0m48C9fPtaOFD0F43DLO8oW7E8LJlotx5krX2OokS/b3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VDbUFlUtUZa6HzeKA9B+Heke7MSpgzLdP3/or/wzC60=;
 b=hIXYHo9odLwB7DDJjw9ErLfLj8/pFic35xyiBFB7bSh3lp5GxT0ibsX3qV5K2xLcc7ZsI/U1DUrNCIaj8JVSfibv5w7AqXGAw7Xy2hgr+vIxXJC5sLcLk2gYfZLR7xT8bf3T57YqO+o3ngC6yXu++8t2aUujWsGa8pKK/D0acUzf9NdbNedec6sFFaZVtKauqWDeTtAL2eYjOsw5XM6XE4Z5eEu/arqlmvhHAMjT6IZldYM7fjZGS8bargnviPC6MuszpBrbacivkToWcB/f8ix4c1Vn9JTBjiQ7EDjsjIslt103j1Nf5S7NCJFui83PrDO95UJOKlOU6DiArmhhUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VDbUFlUtUZa6HzeKA9B+Heke7MSpgzLdP3/or/wzC60=;
 b=msjWe6TMmqv9zAuDuURAJbRGY7UAfjyHIUdjTIvXX+k1MDYHw5OwRI64UN4ZG2zQ/zdiHB4Lh2lE2Isf1dT4GoyFxpPKdfkUBKU/OcnTkr4aQE7d7UEItaK/oSskwT0x4nCMC21+R0LQzR1v/0gpsx4TkLbV2drfeP/QQCI+SM4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYCPR01MB5600.jpnprd01.prod.outlook.com (2603:1096:400:43::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.22; Wed, 1 Feb
 2023 02:00:13 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::4b75:8d8e:d89a:7860]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::4b75:8d8e:d89a:7860%8]) with mapi id 15.20.6043.036; Wed, 1 Feb 2023
 02:00:13 +0000
Message-ID: <871qna6t77.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 06/15] ASoC: rsnd: use same debug message format on clkout
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
In-Reply-To: <87a61y6t8e.wl-kuninori.morimoto.gx@renesas.com>
References: <87a61y6t8e.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 1 Feb 2023 02:00:13 +0000
X-ClientProxiedBy: TYCPR01CA0179.jpnprd01.prod.outlook.com
 (2603:1096:400:2b2::14) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYCPR01MB5600:EE_
X-MS-Office365-Filtering-Correlation-Id: 0121844f-45fa-49b7-9c2d-08db03f80e6f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3ysbMOKI5HkWc8AT+cNglTJC3H3Rq2flNH0yZzBYbTfVUoOXaqGuILl9ww1X25jV/draV5On5uAeZmThBoYi74XUFhKR6fb7maxLNwBG8j04CrLQP1e5exi4ks+X2yqQ6W/N/yQdW51sIMA/MBciw8eJsNyi5r2RjsFR3SBrmeF0jDB78tQftj5T+0tVTCNaEfaM8rr2A9WheA85L5SuAhjFIxH8D13MmXGtyi2ms4OhGy89bpXqKzmd4Zm9+dHlP0MUpiIcZ6HTVs9GTWgQ1xrSlQ3X3WnUQVps2R3UdvoxBs1njQdJaCoJiZnfO4NCVCYDrQXJ0KFQmAlrjeGwMSGKAbCenMhVM/GKGwFp02VBK1vR6QdGZajrXnisKrUUeHt5FBc+e3FxB9sFJRsC5HY+0PZag9B61mV0QxkRp0gtqP/gqyb9mpDwnr8UR6Hy758GBFvuNhH7del7Y/A83POtSAw6yQKE4uHi+PVmHCYHaZucA69P+xkr6aFiwxiDTZgm8jFKEiU/3z7qAQoM95eemg4/3y5PFTqxynD+P3Y7ha5XiKYwX5xeUvY4YGH3+8sr5B7jqRElPwCa5sflYR/fIaGOhlWiG1+td7TSwqVpkmLBroupS47aUuEpjTp0JMFVvH9r1E3SdMvIqX9QuQr7rbIsT+opF5n3ZYX/LWVYE8miG0rQjCi5cTDEf/CSKLI8HsOE/Ii2fojt2dohRA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB8426.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(376002)(346002)(39860400002)(366004)(136003)(396003)(451199018)(186003)(83380400001)(316002)(41300700001)(8936002)(6916009)(8676002)(66476007)(4326008)(66556008)(66946007)(6506007)(6512007)(478600001)(26005)(2616005)(52116002)(6486002)(86362001)(2906002)(15650500001)(5660300002)(4744005)(38350700002)(38100700002)(36756003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?GWYQvjMkgl77HmoBAukLXKIYQJUy9AxDq77zxskYDBb5Lw0S5sXzkcFch+B6?=
 =?us-ascii?Q?9Q08+F2FC5x3KB995yF6S29HjlLIh6TaZ7Sq9+UpT5A2idXfjPOlLh7xwhFt?=
 =?us-ascii?Q?GKPQxDh6V0ehrJCPRMJqvdv4pzQK4yjRUTiuakuPBcbxGGSs69OKzucVtuCA?=
 =?us-ascii?Q?VmwiauD0P+erWOceMHeOUAjPWz8QPCz4LfKdNjviT/4yWERnkhJ/pFOpy1y/?=
 =?us-ascii?Q?0kLDoZPmNs6iwNAmOwPMeaZxf6KwOkobTVZxE/TnirNELeHdrJQ1DOo8n0Ej?=
 =?us-ascii?Q?GTSlGIm3KFwmQl/acg81ujak67ZaRy8g+xOJaQn6gTxBmVd4HOfantBhsFJl?=
 =?us-ascii?Q?AW1YGe2ner8Cz+8NmRgfu8izyNmPXTqUAO5Y0jh2mP+3BZJXcwZastb9mEOT?=
 =?us-ascii?Q?z5ilTcH0KcJuIuBeuBgXq6anPXrartd2Z4C42OZBY70JuSmatbkqXPNDaZaA?=
 =?us-ascii?Q?ml8ugCavL3KdSu1AHFsHNYWRmkAJ8SBEcw/pUEZ9AC4lJ97TSQF339GPABYV?=
 =?us-ascii?Q?XyHfuim1p/99TVuMvXwkkxqwuXZ8ejDTbnBHNt3KFBj4F43jXvm4p5Rp4z6u?=
 =?us-ascii?Q?wVVNtY/QLaQeLUs7wE4BtLq0AARDzQY+vjvar8wU1xyPqgW85Vz5FXGTsz7c?=
 =?us-ascii?Q?98IO9i3/edqyTSd4Nb2efy2Pejm9/xl9xD4bkbrYll0d/rXWVIe1cEFD48X1?=
 =?us-ascii?Q?lxH+lL0h5AwLOhHs8IXXhFSGx3+AGC5fAXpPr/mTPuifcUVynd9V8m4oLMKm?=
 =?us-ascii?Q?lxgpjOl2/pHJMhU6UNjdOL2t0WAkyRqhktsZX2QoYSjZNZ6Zg8qdK7z6rWE0?=
 =?us-ascii?Q?9tatWuqRDCe9g+hmGAKDKWlW3EVZUeAPSLXWGt3oqrofY+NOs336wT8a0wBA?=
 =?us-ascii?Q?PqE4Oja8EnhEtBRdtxKJV+LCJtKK2zs9y8nkUaUOk2xfGWOwmpsDaXPEdhWU?=
 =?us-ascii?Q?+UjDpuK8T6AvjSkMfnIalSJESKLxEVEt/WD+/aMpBbvLmLmpjhPJHejcJmiv?=
 =?us-ascii?Q?4N584dAU1YnTXmvQtPMgVSbyZ4FoIFHfIrVpfRO6RYA8u6hmEgdY26Aj0jYd?=
 =?us-ascii?Q?FSBpmKKzapce4mc509pRmk5HvXIqS9hr4B+BBTlr6kJ2xZ2/YkAU/75O9Q1U?=
 =?us-ascii?Q?49V1TGAWnszUfwPblavOU8Cuz2SHGN1QBUQOThE+XsYlqhGz9bgYDugDz24c?=
 =?us-ascii?Q?R1thjIdRvy7VOfqd8OSWQf/Dje5EDerVbu4dv/p/hu1aKotuXB+pi/rT9dBZ?=
 =?us-ascii?Q?uesH+UQquAh//2UmISg/NYeYR0B7rNA2MuXxHJpZNNfsYkOXXo/nc8DhKHeR?=
 =?us-ascii?Q?qGWw7TOBoqtgKYU3nnOF+LCGMPIYKJ9yMEnhC6ynQ7irEBOsq4jtYLT+2u9G?=
 =?us-ascii?Q?J+fFEzPvbZqZ+X9p3nTErWwQ0N+kLW4vnf96fvicf5iUhsr6wVK1IgS2JKwg?=
 =?us-ascii?Q?cx7mVz4ZoB7E6UYrQ3REsew6/3QmKlwePDL1bx7FhR3rB7BVvnZxjQJcfWlc?=
 =?us-ascii?Q?yKo5gbdakEaMHkz/2wbVKL5sM7C6d12WNhWbidwL1a81ozW6+cqvqIGhMNQ1?=
 =?us-ascii?Q?1PhXhiWrPZYcYC07n24Qh0j0Aq2R5mXzlAgOji/fyFlRqha9H3YYPpdufR3j?=
 =?us-ascii?Q?rDNe3RBx8w29Qt77KVMMnc0=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0121844f-45fa-49b7-9c2d-08db03f80e6f
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Feb 2023 02:00:13.2962 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hKSqtTJN4Pm7a5S/daKM7H9gIFfJtz2BgbtXQzaXIIbDMnj73RQ0nAuSnRhLxAjXuUzrdAWluOXifJrw6OZQysCAp0qf1y2w0L/tTfG9ilxpgsIIzzLYEpD73X0+Zt99
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB5600
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

This patch follows clkin debug message style on clkout.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/sh/rcar/adg.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/sh/rcar/adg.c b/sound/soc/sh/rcar/adg.c
index ca1e1281cefa..2c7958620524 100644
--- a/sound/soc/sh/rcar/adg.c
+++ b/sound/soc/sh/rcar/adg.c
@@ -661,8 +661,8 @@ void rsnd_adg_clk_dbg_info(struct rsnd_priv *priv, struct seq_file *m)
 	 * by BRGCKR::BRGCKR_31
 	 */
 	for_each_rsnd_clkout(clk, adg, i)
-		dbg_msg(dev, m, "clkout %d : %pa : %ld\n", i,
-			clk, clk_get_rate(clk));
+		dbg_msg(dev, m, "%-18s : %pa : %ld\n",
+			__clk_get_name(clk), clk, clk_get_rate(clk));
 }
 #else
 #define rsnd_adg_clk_dbg_info(priv, m)
-- 
2.25.1

