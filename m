Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5633E46F274
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Dec 2021 18:48:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CE3742116;
	Thu,  9 Dec 2021 18:47:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CE3742116
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1639072128;
	bh=XX7Az4m+vMneNXVh+c8EtxXb8jwoVlfzBM+kRJye7jM=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=CGSwAYh/5oYyeFk1GCis8IyjTiKTnzQessxgyrO0BHS5SBEb5pywhdhralgYH8EYM
	 RQ542r2toDHcwyhmBaUViE4RpwdycGOpZ+vbxggKSx90zkOJzDHY10uv3ZJnZgYBUY
	 v0CQ6Gl0v9oCKjAV6LMW7rtw/sVYxyR4EyCiNF9g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3678AF804BD;
	Thu,  9 Dec 2021 18:47:38 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D67F4F804AE; Thu,  9 Dec 2021 18:47:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 MSGID_FROM_MTA_HEADER, SPF_HELO_NONE, SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2063.outbound.protection.outlook.com [40.107.20.63])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AC38FF8032B
 for <alsa-devel@alsa-project.org>; Thu,  9 Dec 2021 18:47:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AC38FF8032B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=NXP1.onmicrosoft.com
 header.i=@NXP1.onmicrosoft.com header.b="mGwokeEc"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UyEhOO8DLFltZyRPXfsqfjNqEIRGLK7CAEs6h3G3e2bqogrzJFo1bwTC7UCNxXowzkY826i0bcZOGWatoj0KkhRQZtoZkCEFx+FmsNxRkeaVi/AtaQLwHeKSt3J07W40gr9UU60aqsbqgAgcosrdDhlxb8Z+ISXG/PVnT3IZCXneY+OXMA6brbWqcHi7Xhm29AEj2VZedHfwkSN5Y64xOiQBf+GrHgvUSWZFy5SkFhDgiuaea11h9qHpUjsF+Iwq8DDyVPvNmtwsiqVlMBH/BFTObeOeNAsoZtUYaTfs8Pj36v0buo6wpTPjiqmM41A1mqs2tG1Coe6MdOfbOlCt5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bkglh73YqracFUZm5bF60zZv1dln4i0u4N0aJMzB03I=;
 b=lb7gD3B+dUsWJbeujy60r+jkFwgR0UOUgfQXex5btoGiWI4964Pss8TsXjBApv9A3LAUp09tALLAb5id/ElOIV9XwNoFqPj09BYnPNc69qpXHmlSf2MPFpthv7609t3bUEhnLHrJQtQaZHgSc17bsqgFlYOWV8CA3PzEL+ECv5yYUN4tAB5P1A3FgYw/xfw1LlMizsdJ1gCWM8Wt+iQCMoHx4ehS3+/iyrY+qufftRmkdNVmpzwzrvckb7hsxw8UYhC6Mz13wOCdLoEfLIwZLPKrzyBi4psIDyJUu36tiBh4bXMXS0iMajWf4hLJ3hO4spUbQdTwBJE7ipIUg+kjWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bkglh73YqracFUZm5bF60zZv1dln4i0u4N0aJMzB03I=;
 b=mGwokeEcscMjFTppptZxTg3mTrowfmnW2ywB2qP1xTVXpRzhLXpe6/b6lfHxwx7JUbjdPGGAHdsTQm3kKV2+rDai7a5KZHqvDGgOReDmAWFnhIjXLb8wzghDPCf/uJkXR/KzgHhs89EZKCZB9rLQJBUP09nKBfCSkvNTXvg3O1s=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from VI1PR04MB5151.eurprd04.prod.outlook.com (2603:10a6:803:61::28)
 by VE1PR04MB7263.eurprd04.prod.outlook.com (2603:10a6:800:1af::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.21; Thu, 9 Dec
 2021 17:47:19 +0000
Received: from VI1PR04MB5151.eurprd04.prod.outlook.com
 ([fe80::3de6:806c:e71:2a2f]) by VI1PR04MB5151.eurprd04.prod.outlook.com
 ([fe80::3de6:806c:e71:2a2f%5]) with mapi id 15.20.4755.025; Thu, 9 Dec 2021
 17:47:18 +0000
From: Daniel Baluta <daniel.baluta@oss.nxp.com>
To: broonie@kernel.org
Subject: [PATCH] ASoC: SOF: Remove pm_runtime_put_autosuspend() for SOF OF
 device
Date: Thu,  9 Dec 2021 19:46:57 +0200
Message-Id: <20211209174657.141268-1-daniel.baluta@oss.nxp.com>
X-Mailer: git-send-email 2.27.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VI1PR07CA0293.eurprd07.prod.outlook.com
 (2603:10a6:800:130::21) To VI1PR04MB5151.eurprd04.prod.outlook.com
 (2603:10a6:803:61::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (5.12.254.68) by
 VI1PR07CA0293.eurprd07.prod.outlook.com (2603:10a6:800:130::21) with
 Microsoft SMTP Server (version=TLS1_2, cipher=) via Frontend Transport;
 Thu, 9 Dec 2021 17:47:16 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9d63b28a-51af-4156-1019-08d9bb3bf0ea
X-MS-TrafficTypeDiagnostic: VE1PR04MB7263:EE_
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-Microsoft-Antispam-PRVS: <VE1PR04MB72633E545730A09787214C41B8709@VE1PR04MB7263.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1002;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: J1YGZbyiQs2phZgR2BlqpTf+/PBOPhbbRHciePye6TM6MNoVm/4eHhxEwhFHs/wUczalXPj0L8uPaXm6NAOZll50cYDuPC8zU1fn9/WVYucTSk8kWlFfrbLsPQHPN3J7X4Or0hB4RQ+855kBwYpUCr/LKnM7AHrrp0ANr6RExXP3KWWKlrPmrr3QDqE3vspWUF98+kcI5wXKYQGW+W84xdP7p5E27N129YbM2re+BslIH2bNptyusenDMRw3PlCRkKYANUvQJjLCdGT1PxDi2WkSb9Zf8O5dpV4Ag+0u6spodsZOFEollTe+UZKWvRIK3uW9Xl8bPFVUUmjyDYI+fQvB1offlsI6OLW4eWzlYqzcxrbp+WQXCGXFwyUk14cGld/daFmcfaZqPDAPFU+PluiOsSBhfxQDzj6uqlq1ZttM1rKhHuCNPec++zoGUSCfAQJzYxLX6HpGc2xoBIS4pxYiigfIBM+GcCaN4PNDZnRVKgBKBwlzGXHXv+KybhYbfZAFfQPut9eTueUsbu8dhFsLzOQRwIpWbNE71PSjesDPUrtGur1CNoKUV33njImEihzIYhLAMsZXrlXS89UOQtvgbAARindmrZUednmvXHt4piqF2xy/O3gR9UJCauFyXgP0e57IxdJ4xNlmBOVJ0BkJCOTgcOJPsrpHvRPQLQsxpU0H9YvT6Ae5aRjqv3vreXE3bXccVwjeIbYaDjw7G/Omuj8pOvZys8JfVMiKiHzZz5PPdFZJkLL9qB0FWM4Eha4vWyOC3BxFdRviEzpRR6yJB61usvN6YHHw6oY6MyI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB5151.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(44832011)(38350700002)(6666004)(38100700002)(6512007)(6486002)(86362001)(52116002)(4326008)(5660300002)(956004)(2616005)(8676002)(26005)(6916009)(54906003)(6506007)(2906002)(66556008)(508600001)(66476007)(316002)(83380400001)(1076003)(186003)(8936002)(66946007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?38Kph5fzwNG1TLfk/T7Az27ldAKqZV9vm8NxFU506hEnUNPVqtfa/iv7oUP7?=
 =?us-ascii?Q?D1qhwdGWJuLv3Vg6SpYJ8D2Z7D5IDBB1Hin3Ytg+OSWt9fhh84+f6IKjI1HP?=
 =?us-ascii?Q?+LF7q/aKWwsOf1vg0tMlK60I/KBOXXlSluicwcRhoZOxritJ3DwD7fVg94m+?=
 =?us-ascii?Q?CPWXB8G1nb7jrj5PwPGiZGRoFSnI9PJERTr0jH2Sw+I+P8uNgqAfZaGqwKEa?=
 =?us-ascii?Q?MeIP4HbCSaKnquAkpJlfYt4ncvpMyGJZJ3tWUaLByQ9yJXx/gJoeyc8r6m6F?=
 =?us-ascii?Q?NhTJsmevYe3lGNUEBLwqEjpx5V8PYFDLEK94F/5+8xe0dIVYDtyFdsMbdbUb?=
 =?us-ascii?Q?bZ4sdmO+cb4kMHgT788zkN7fcldSYn/V8tf8QZlZ45H46wSvWhXIeD50+tWy?=
 =?us-ascii?Q?iSimtlkg7TDGSpod7O62AnmBKyGVgZyjCj7G+LtuHdzFoi2oyGMxHG+RrM3n?=
 =?us-ascii?Q?WSWyN/Ti38QSFFdLmy0m9XAS82VItk4etzfZi6GdOaxYAZTr8avtlep9JFes?=
 =?us-ascii?Q?L6eqFDwAlSfO50MgP2EgBgCJeJtQALVve9T850mkAwbI3gAN6xRWEe/iB7qY?=
 =?us-ascii?Q?Luvuqxxo2PNvC8gw/pSiTKPpWjGP1WM+fw7c2wzCUQzS+7RXF3ECNTFlSQBm?=
 =?us-ascii?Q?W3H+oks4jtZaPV0x7qpWJvCnv9Zv1rA1PC6MtmqcI3pWULQgIWQf9B6OEMZa?=
 =?us-ascii?Q?6f/SuO2BEOo8Z0Aep/j7p7Wk7FVo1WvpFedsD01weR86BA2GzR0uCtXJUGGK?=
 =?us-ascii?Q?etoAve4JmEYHAxLaHEQvdzfJ+aE3JjKRY2AJ4Kcb1wJI3dggx4mbakE+y+Ej?=
 =?us-ascii?Q?+12IXUwwZO7du5c8JM5Clumy2JaC/FonmhANjTfXbEbX5N00x/DmLOvWrh3l?=
 =?us-ascii?Q?M4vnp5Ig4SU72JRfWjp0vzpuZKD8qTzsmDfC1jlOexfOwipmXx6tPHlC4EAe?=
 =?us-ascii?Q?ip4PdDCFwkAvwNpQXilmQxdJqp2uCiyseheRmd91kwjEoP+fINLtoo8m3xYK?=
 =?us-ascii?Q?OoGxnkc5INJSWJZeSVCHW4JXPGaUp3mkaoiGqi/QrmAYEkrNhALTv+hiWoMN?=
 =?us-ascii?Q?blKCfudZm55tsOB3kGSQr9n7MpBntaFmaAwt6hWvTmkZng/qkGn8KrqA61Js?=
 =?us-ascii?Q?vaNqvYdct+Np0eU/o6C/DeS5w3zbDxW3bRzxExJ5LG5EkaMZj9nS4Uh+anBG?=
 =?us-ascii?Q?W5p7PO1pt2CMRpTFJUKM2sGFphwTbmHqbKcRvKV6+SDCNvW2TrvkIAyH4oyX?=
 =?us-ascii?Q?E7dgkPlB7Y6aGT7G4NRvK6s5rnsBmev7FQIKWUVUi7CZAkixTTV8/0wl78Py?=
 =?us-ascii?Q?mSnr/vG4cWYfrhZ4WbdpTCPno7hDl4NNKhK+d2y7iNyQQgPAGZbpPbaE0ViR?=
 =?us-ascii?Q?MrncB1dKO8LHCWbMnwlHsW/cODh+2XK4/q7vY5ifKzs4jXRKsbyjTaDrYnou?=
 =?us-ascii?Q?65ugj/uqR6DtUOWQ4dbtFXHQBr8cqce7Ni7vCjngClE18xqWiAKaCw6pPc+0?=
 =?us-ascii?Q?WRjV959sdaD0zTHdKCJ0X+SVWLcyOuxStdUOHu9JGhILRGJ+4vHVxwXMDJOG?=
 =?us-ascii?Q?0fNScvoZP+3JTFlUVD9NTdoH4bbRcfA0o0Pfbg6e5QN5fXhI6P/eWPmDaTkg?=
 =?us-ascii?Q?468z+N92RVNkilUXsGB7tbg=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d63b28a-51af-4156-1019-08d9bb3bf0ea
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5151.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2021 17:47:18.8280 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fT5jwdwVOWe0X0hfut0klceK2927lV83hs0NBhNNTbYSHmXV4ZXo/BeFs+IKRYmAyh0Ojvx03sCmtzmvTDooKg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7263
Cc: pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org,
 Allen-KH Cheng <Allen-KH.Cheng@mediatek.com>, kai.vehmanen@linux.intel.com,
 lgirdwood@gmail.com, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, Paul Olaru <paul.olaru@oss.nxp.com>,
 Daniel Baluta <daniel.baluta@nxp.com>
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

From: Allen-KH Cheng <Allen-KH.Cheng@mediatek.com>

In SOF OF device, pm_runtime_put_autosuspend() is not
matching any pm_runtime_get_sync().

This is imbalanced for PM runtime.

Also, for consistency we call pm_runtime_mark_last_busy()
before enabling PM runtime.

1. Remove pm_runtime_put_autosuspend() in probe_complete
2. Reorder PM runtime calls int probe_complete

Signed-off-by: Allen-KH Cheng <Allen-KH.Cheng@mediatek.com>
Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
Reviewed-by: Paul Olaru <paul.olaru@oss.nxp.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/sof-of-dev.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/sound/soc/sof/sof-of-dev.c b/sound/soc/sof/sof-of-dev.c
index 412cbb824b84..b0089698eecb 100644
--- a/sound/soc/sof/sof-of-dev.c
+++ b/sound/soc/sof/sof-of-dev.c
@@ -74,11 +74,9 @@ static void sof_of_probe_complete(struct device *dev)
 	/* allow runtime_pm */
 	pm_runtime_set_autosuspend_delay(dev, SND_SOF_SUSPEND_DELAY_MS);
 	pm_runtime_use_autosuspend(dev);
+	pm_runtime_mark_last_busy(dev);
 	pm_runtime_set_active(dev);
 	pm_runtime_enable(dev);
-
-	pm_runtime_mark_last_busy(dev);
-	pm_runtime_put_autosuspend(dev);
 }
 
 static int sof_of_probe(struct platform_device *pdev)
-- 
2.27.0

