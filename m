Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 59E475096A2
	for <lists+alsa-devel@lfdr.de>; Thu, 21 Apr 2022 07:23:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 659391E82;
	Thu, 21 Apr 2022 07:22:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 659391E82
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650518611;
	bh=h/5k3qbgOJbPDo42Xu97U91a7abmg+S0fT0kgG4DAYU=;
	h=From:Subject:To:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=d6M4OotG87fmS5glBYsU3V/p9YDJP2MOp/iRaLpPIxKsOuKTMZWJqw924XESBkPcc
	 m2xiirCLLUOTjQOE1lGCTJNSU8/Mb3TfXHaT38vFDGiYA7Uxl3n34OLqdwbeOwlocZ
	 IkjcQS6OLS9lEnhxnFAzp1GfYNj9l9dB9s0z+QHs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2B8DDF804FD;
	Thu, 21 Apr 2022 04:55:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 17E6FF804FE; Thu, 21 Apr 2022 04:55:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.9 required=5.0 tests=AC_FROM_MANY_DOTS, DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on20711.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:7010::711])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6AE87F804FB
 for <alsa-devel@alsa-project.org>; Thu, 21 Apr 2022 04:55:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6AE87F804FB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com
 header.b="G84womgV"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hyPb8RorgmVF5yhUYZrlEYCTXDjoFCfm2VE9Ec5ydSCoSB5K59b/b1npX5Dzx9rGF6KWDTxhLwlzFRYIEqKiZqI2Rwi98BMFuk9rhlNGMqeLRjgY4NDIB0ha6Raeho+DGGpwhlEuaNvokimHI+V6CwZGv4+WwUlBOTllaV72HUuiehMFbFbYhliVPfXAHH2iWCkgSsgDrUwwuXtsIPvbQi1h6LdB2V5SxEmCsamjVVaJMUuY9Ts+Fkzn92Pk3Z0f1hqPbmISQob7CoPylbFcF3y2ZpUZvvFnH9ydvD+Gv0AnUHbfGFh0FmO+m1oBb1py0GDh/zwVMy4iGO7rcYeleQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d1uMoVNpbzG8fCdJ7jOJ2GBexQK5A28SqxY2aMgaGI4=;
 b=c5SBBtu6h/zbcGosa0fvoYrpwldxPQf0Y4YtiqzNuVbA3i9FKLWlCepHDFgxpvSXRp6KAVF7RgwSpNrLVuGlmMYEABmW0nR2Q7ZTlPmn6pggRPE7dBrUea1OSCJNTGyTcEUi2iUIDywnaUdofwssaM+SYp4JjRCE11O5ezCkDakdI2J94MUPEDfTa/XYAN5hyXsYiLhWK5afIEN3lVcxAiZt4YAmjsYoa1YksUst1+PGhTpDH2rrswjyZorWGB7Nm5L7GuFtUw+FqaTPyz60QEQl6LfSYPQ6y+94ox8cWjsjgBonY/ScQ7wd4GrrBHccdGuRLxGnysV6zu3qPW5FhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d1uMoVNpbzG8fCdJ7jOJ2GBexQK5A28SqxY2aMgaGI4=;
 b=G84womgVqOGOumpFRn593IZTSxkNSO1rVkDXBK7pMkt1FGmkAiMGbdNxKy6FvNR++UkNWmnyGmm0x/VMG/4o/kWTDAnyp99d/skjERV7Ttx1hZdaW7ZidS83NDOzYWAwczKchS7+/cb1O21jerAD38Dw/rifyCyrDoexLpL3yYI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TY2PR01MB2314.jpnprd01.prod.outlook.com (2603:1096:404:10::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.25; Thu, 21 Apr
 2022 02:55:27 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::697c:9b30:7de5:706f]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::697c:9b30:7de5:706f%5]) with mapi id 15.20.5186.014; Thu, 21 Apr 2022
 02:55:27 +0000
Message-ID: <87r15rgn6p.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH] ASoC: rsnd: care default case on
 rsnd_ssiu_busif_err_status_clear()
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 21 Apr 2022 02:55:27 +0000
X-ClientProxiedBy: TYCPR01CA0027.jpnprd01.prod.outlook.com
 (2603:1096:405:1::15) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 84dd8665-eb2c-4ad4-968d-08da234263a3
X-MS-TrafficTypeDiagnostic: TY2PR01MB2314:EE_
X-Microsoft-Antispam-PRVS: <TY2PR01MB2314BDDDA7556B206B238A31D4F49@TY2PR01MB2314.jpnprd01.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 63DXbgfuOtQinmHczeriJ6vLnUTUL1yKuDQOrJewy/6yqo4O5xG8VJqrfgwIK45BZfBsy/c+qemfncdWU9t8zgwRO7jHlYHIaucH++G8XdAwswLAjN4MXLQBgzldo9E8QhQoD67uFP3EafHZUgfvxrF3cV0y/UiSSn0fkHymq4J+K0EhcG8nA6kfI+grHpm2QCFnVUNnxDkfFmIhGokbkA30S6oaexo3ABR2r3FfBy/Fe8Af+V3ntYzBCG9XJhVq99bNBpLPycZF8oscnDrw4F+qjclsgWWtceRc9VAZ4EGuG4qEbiwc02a+hVUsnBLyu9g+i5ZWVcl+48aCtbYqQ6xYCapSq55bpssrSG487YauXGSkHqy2X8W1i8V1z22s7cdeuZcK6a9iiA/31+INFS3sZZiL1FiwlMjdVKSc1wBPoGpENVgKM4A+CFOFFqGwh0y9AaC9sGUGPSz6CAbzOYbZ+mNGtIgM6zRcoCyfOy4HQaqksBZmH67ir4CNKnVeonxL1xfs2tcEE557kIg7z8sr5oDfHhRhVL/K3GouQCBJx225mvAeYagXLkgBWfWZ/0a/KJx/lfBp/hpTZCUxg9WVDhhf1FkmyrB0PTDQ0NGGXAarhXprRLLd72hXhZQubc5NWe8voQd9Ub5zCLUrrzcKNT9cRBhvNO/bY3we9Dd2LX8dYQjNLxGqbWKbKk6L1VOapV1drtloPIVtYekJrw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB8426.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(6506007)(6512007)(508600001)(6486002)(4326008)(86362001)(52116002)(54906003)(38100700002)(38350700002)(6916009)(66556008)(316002)(66946007)(2616005)(8676002)(66476007)(26005)(83380400001)(36756003)(8936002)(2906002)(5660300002)(186003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?SAXdNOUfy2gan4jVaavNvmOzAT98blckRebaEWqOlwWVEF7vRsZ9OK4Snn05?=
 =?us-ascii?Q?ywpAniNX4/8yWnfLe21AUYb7aDvFVMiFib6/8E9Id9UY9wlekQ+bu9GLhsWZ?=
 =?us-ascii?Q?g9A+Od8lwWJ5/UlSxHhSxAQvwatq3HHQpZBdj6f3ip47b969vOEQfeO/Zg4q?=
 =?us-ascii?Q?ennMQPvkUCETNpHP/xvuiYoRAzTrZE40gKiba3U8UGuVaJc/Ty/V3T6qWyKL?=
 =?us-ascii?Q?8svby7/OKUOyf8n8PzZVjeFsWfR3HomjqnpeDx+jKePOjZ+HaonUYTUkWUtC?=
 =?us-ascii?Q?y8M8Uy/Xs7WQzWt0Ey0oL292kKdWwzRvX41df3ADpQIqiXZCSNyrvzbQQE+f?=
 =?us-ascii?Q?5UBkuljzb8OeoVRJ2zsho5AnrPXNDlLALdkiXf4UFw1ymucUHgGbbXbmUPEJ?=
 =?us-ascii?Q?pvFNnojkqFcHrajFxzL2Gg2z0eEbOGDb1J/b1W19RboT9GIc4/bgCZczKLS4?=
 =?us-ascii?Q?PjrPDg0iQ80gCt8UZ6l5nyakrwpubYiYilrtp66lr1CyrjV42UNU+YhsSGNs?=
 =?us-ascii?Q?JZA4weSpP03icCw0fd35IZKuC2qvZZQSXMs5nJhqhnP4GUU7QzNzahwPXeok?=
 =?us-ascii?Q?gTtUR9MqA6fuPrFMxCEeRhIfpqD3RiagOF07sVLBsp4qWqvamEcGrGxhzD5W?=
 =?us-ascii?Q?zRV1wztOS9VBJb4qgDIfgwZ3ihWskl8+T/nQhox/5Oonh51+AQlY+MfV9gHx?=
 =?us-ascii?Q?WTpvxS6m/0RPLVoDCva6WR+f4bWJXlL5ak9vDyPIrGg29aeegA+JrDU25kCx?=
 =?us-ascii?Q?bjielWmNx2ofMI/IllWN5Lc1DkEWZC5q+albG+LGzhbT3GRH+/bmAzhxoGzg?=
 =?us-ascii?Q?9r7UAS4lCKsuzcpJeD8D02hL3eypQ1nzmSZDl39gRJJge8Q0CZW5nAjKkuDq?=
 =?us-ascii?Q?FZrG/Ur7DgLpKzkkWDM67mCfZNNEbgKD9uYLfGCsY/zPAFHNKmja3aqvw4zS?=
 =?us-ascii?Q?lsgCOBJ7E0EfirTgjGoSWljieZNqXppg+oRsWYPQubZD83/kxWRLm8PyeNeW?=
 =?us-ascii?Q?PSipqu8ahCeXQXwk6quNKZd+wNxel8V0m7BzYonNA6MQBw8jp0A7ET42mhD2?=
 =?us-ascii?Q?+/xXCZZCiWGcuG6IiKv9Tyo/wQc485BO9ltQZl3LckyjcNtG6MYbzdrD1EvN?=
 =?us-ascii?Q?SDoNiHUyj5suyK42AtcsXYZ2JjUPWbKowvC/uyGyvr7i3XDy/1SMS9Egav8t?=
 =?us-ascii?Q?NirE2Lr87ag7yflmsdE6zKYLYTIwIfdLEqAn0O7Ws3GAUkWXw7FZno9Bo4uz?=
 =?us-ascii?Q?KrtfzfSyWQt6bM1ogiAHwugPgk4+esuihEH7OU48AGGF4GXwO4tljHpfj0l6?=
 =?us-ascii?Q?lApQklPZlgU/chOetAZ2TJ/AV6TAXs0qewzUXwSDNcjWlS1PFm5sIerIuTwD?=
 =?us-ascii?Q?l1GyO3tlRRK0q+oxZsfPeAKXn5/bnza2cc8vpzywWNoRy92AZOUrCHThT4vh?=
 =?us-ascii?Q?8fx68MuELc5BuHgMjqJcWETc4HMGJT+fxXRoidV+eC0bmSuOAGHDQi7gVloK?=
 =?us-ascii?Q?xFaprLXUB74ptozy/xfu3aaEEEVFMX+2zOF+hf5vRcpZQuOWhqF2lsTZRQMv?=
 =?us-ascii?Q?MoRIwWHT4hvwTwDavl1ixqCYbAqB23wIiaquljoo/FQWVHUkyLrvpET0z45C?=
 =?us-ascii?Q?Fk3WlZj9BwyMOzeIa7VzTCS6+CUeyM2rBTgGLS3xMMGQsXKCtp1TwZmXe73n?=
 =?us-ascii?Q?4yIwuir9AK9UW/v1TsLIo3DbjkqDk61mNa6Bsu1O5c+n9qzDq29Si30CzeT+?=
 =?us-ascii?Q?kS6zRR9ERHXOA8h+Goi/ugzLT4o5PePi3584ozEK/0wETBKAtABp?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 84dd8665-eb2c-4ad4-968d-08da234263a3
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2022 02:55:27.5325 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OOV5dyuNW/RXfiPNI1rbdKtv3dtR6+0nT4BCevv1t5OK0Yv5sJ0OlLvwMNBZWHzZvwaESMUu9LiTLXX+C0YUhXhIUFIL96sfGtM9GAP5M1RO6e5cEvrbJQ9bse/qI5+/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR01MB2314
Cc: Linux-ALSA <alsa-devel@alsa-project.org>,
 Dan Carpenter <dan.carpenter@oracle.com>
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

commit cfb7b8bf1e2d66 ("ASoC: rsnd: tidyup
rsnd_ssiu_busif_err_status_clear()") merged duplicate code, but it didn't
care about default case, and causes smatch warnings.

smatch warnings:
sound/soc/sh/rcar/ssiu.c:112 rsnd_ssiu_busif_err_status_clear() \
	error: uninitialized symbol 'offset'.
sound/soc/sh/rcar/ssiu.c:114 rsnd_ssiu_busif_err_status_clear() \
	error: uninitialized symbol 'shift'.

This patch cares it.

Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/sh/rcar/ssiu.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/sound/soc/sh/rcar/ssiu.c b/sound/soc/sh/rcar/ssiu.c
index 0d8f97633dd2..138f95dd9f4a 100644
--- a/sound/soc/sh/rcar/ssiu.c
+++ b/sound/soc/sh/rcar/ssiu.c
@@ -102,6 +102,8 @@ bool rsnd_ssiu_busif_err_status_clear(struct rsnd_mod *mod)
 		shift  = 1;
 		offset = 1;
 		break;
+	default:
+		goto out;
 	}
 
 	for (i = 0; i < 4; i++) {
@@ -120,7 +122,7 @@ bool rsnd_ssiu_busif_err_status_clear(struct rsnd_mod *mod)
 		}
 		rsnd_mod_write(mod, reg, val);
 	}
-
+out:
 	return error;
 }
 
-- 
2.25.1

