Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 248185ADBD6
	for <lists+alsa-devel@lfdr.de>; Tue,  6 Sep 2022 01:19:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BF0A71672;
	Tue,  6 Sep 2022 01:18:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BF0A71672
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662419955;
	bh=KWSl+/hP6Tj4LOXrppGp2b3nXy7jv3Kqva2A0nsPoPo=;
	h=From:Subject:To:In-Reply-To:References:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=g6qLjj6NAzWtXoB1LsEgH4T38kipxc3XjN0TnJ16PEsSN3V4fUeTQ1eQVKE0nzVHq
	 gPE6I2osN8XIzvDUJ1x5zEITxhMqbiXYmAqw8b6KGg0t/rXayVDX9BSb/IAh+qK1I+
	 /dITwwcm91hlD/pG4RlSBvWN8JBsUOPmS7kcCkmA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2D22FF80537;
	Tue,  6 Sep 2022 01:17:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DB0C5F8053A; Tue,  6 Sep 2022 01:17:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2134.outbound.protection.outlook.com [40.107.113.134])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 87B29F80527
 for <alsa-devel@alsa-project.org>; Tue,  6 Sep 2022 01:17:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 87B29F80527
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com
 header.b="KFkXRlLF"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fn+cLhgyo1LZYgWQAdKM6s9LA3ALCYtdawCI+CZWSUc0ZA0Li6HFPPwnkjJ2ckKd7PmqtLwZ72ZsOccK9eda/bIOMn6QEbZND5wx6sVhU51hel0vAfZzLD4ZXyOD2ZbOquOtRvyq2tZmU2zQorImeveARbNt42ZTitqcAv8P9tIVz1X2cYMFbRJ/yuXBrFlo+nx3sDujadrUbRcOL42Rc4VuwBP4mAplyx+gQPr8nEA5Sn8UyS5kDltIZ7/rxFlQZmCRGKdHyAlH+z5Ih7tsFa9QjPzehEK1uIz6+njAZu9PYdfbj3P4G4jEeUTjf43IEZE3aAHrO8qB04wsmgFq/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J7iTlzp8jfmxFM6sj2H48rAdpaZzF9UDcomdiQDpYfI=;
 b=SkLUF6/eDDuf/UJuVBrVGPZxgQheW15y3I1zlqyXMEzcPi6MO0tF8hvMKhqJQT0BTAsjX8FPDnsnGIefW5EeiWWQW/KCKJ9lUSTnTaqNW/7tmfMIcwUvutyC4dj3ikgK0e86eYQCJChjd4Fj4uFwiWdm72ccr0MvPA91qk0rnu7QmOafHIWkWmA5ybrYkW+16Xzrnd3y7hyUIQEjX0iiAh3lsdErAiYPY3cTuVdtsDg1L8cg0pdVZrGmx/KvhhAHd+shST0jVHKro/wb3+TadxTX8kHjAT8czYi4ebWuoK+pelWCwA00ngp3Wco80c+0/mIqyjf8QRaaeUQgOpfLPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J7iTlzp8jfmxFM6sj2H48rAdpaZzF9UDcomdiQDpYfI=;
 b=KFkXRlLFnIxA093uS5S4eHSpjm/KCwXIU2m3iLLmCtBcxnlqyAuDyWUGaBFOkMWSn9gjfYcEzsKVrW2GZr3WvBzuV/tA9rBx9vDZD8jjUGGNdOKaqL17ReI5VHTVwl0gZL1Fct9jxKWyOkYQZnp20+2e+YBKnRmG5B8uNDVvkU8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYCPR01MB8191.jpnprd01.prod.outlook.com (2603:1096:400:104::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.12; Mon, 5 Sep
 2022 23:17:44 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::bdab:be26:6e36:88c6]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::bdab:be26:6e36:88c6%3]) with mapi id 15.20.5588.018; Mon, 5 Sep 2022
 23:17:44 +0000
Message-ID: <87zgfd8l7s.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 2/4] ASoC: soc-dapm.c: don't use WARN_ON() at
 snd_soc_dai_link_event_pre_pmu()
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
In-Reply-To: <8735d59zt9.wl-kuninori.morimoto.gx@renesas.com>
References: <8735d59zt9.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 5 Sep 2022 23:17:43 +0000
X-ClientProxiedBy: TY2PR01CA0023.jpnprd01.prod.outlook.com
 (2603:1096:404:a::35) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ae1349db-ac15-4312-d956-08da8f94d641
X-MS-TrafficTypeDiagnostic: TYCPR01MB8191:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dsWKfVuTshoTZG9tmRENr4xAVSfAw+loTJcmxwdZAhnnVKHm9CU6DD9pArmkCGrw7MZz4EEaHqd0QC5YN7pznmGc0BMDVeP4q+y5IjpYfHSSrBI8bmkRTeJ5KOoZDPvjFVKnxYY2JwNQskmawr0O8o73P99E52CxxthXF4I8thCEMycfk9TlrErOsSZN+lJS2l6XtuMj5v4sRG/z/n55jUMZ3rJuCdMgwE1UhYiJ61d3LU77k8bkwsLLa3hUn0wxP0ILht93z8lqx3H/tX35iP8t0OOI/4WPshwr+o3klG5kpAYNCeQ5cVQFc7GsXGf/qVKO5dg1IPDHmbFWEnKL92Hv4+VgKzvQkqYdj064CxmBejuZlO8TYTYfr7ThTLziLKA9Z9sKLkRd56K20r6ZjzSGPIXJrD44rTFCfRVst62kph3QeP8whWi+cmFKtUjp4vrw6EHG+i4Tyb1lrXbVRkOqQ6XMtQeLxcU2E6A1ILG8x7+ZajcmXccoW0/0lSIfnWxUZEsJ8Jb0h37aOGedvrYqlpyiBq1smv7tZjg4h8Q8vh1A+WTPQcpQvWiQcQbdQVkH5f0Mi6WDjj6Y5UP3wWaRNKX58/DM6TzD3uA6llmDc2DmGhKnckZiuzIolX65opexfgiMihiRBoOeqxeyaSm3FdVkTuyXu10TaAIHrDpMM3eu3sRxO19PU861QlKPqI3d22yhUFIaghT6xV3/8tvTeWVbNH69nTdCAPG1UN6Dw6yAQ06yCVnyAtzRUmalZXBm4av27UrKxtQOqG4vwQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB8426.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(376002)(346002)(396003)(136003)(39860400002)(366004)(8936002)(83380400001)(8676002)(66476007)(66556008)(66946007)(4326008)(6506007)(52116002)(26005)(6512007)(4744005)(41300700001)(2616005)(186003)(86362001)(38100700002)(6916009)(316002)(2906002)(478600001)(6486002)(38350700002)(36756003)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Hmy50xCZUpWdLMuNH58bBfzdnLJw8tLpDfUVXp5usS5+cIrACvmACrbeN4tS?=
 =?us-ascii?Q?HSGPjCgu3v7GSUk9/oRde9Qj4S2VkV5meGvnjbh9o4t12rAmUUu2q/RPtedy?=
 =?us-ascii?Q?U6/42/XSoBGMjG1zlpVRiz2HmQxKxPHjRDLzPgplqMuQ7ZxCkfce5FZZyj4F?=
 =?us-ascii?Q?9Jo+mK3ww4qFJ5vad1gkr23+LsImvIv7R1ffMj674C18Ooy7yi9uK3igtOLN?=
 =?us-ascii?Q?iNg2rigoPn1hhq7rwrFOXyfGmZiixIGYQNjVzbZKLpnKQVTP8FjpO8BKxy/z?=
 =?us-ascii?Q?K6quqZ46sznAcOn6cUYAjYL7X87bkavkFGwtaQVCIX+ZmdDtrxFi0alB36KT?=
 =?us-ascii?Q?M07sgtc27fPPptTLOQz3AuGA/96j2aRJV4ctvGuKLJSS4olhKO2bH9JWghOj?=
 =?us-ascii?Q?phOc2Qy6E3q5etzYXDiVDLbkG1vDaC5esdEJZW0W0y7BTL2zin6PA+ggRkGl?=
 =?us-ascii?Q?gPvNCUnzBOIuWERuRnrMwQL/nwowWhVBENvRFHiKt6J98VP7vCNOy0iouwXl?=
 =?us-ascii?Q?A7KJj1KUBsdfcks3tMNkPVT0ADoDjZ97zW9K/eGU9i8cCwrHl3M1Y1dezKee?=
 =?us-ascii?Q?gfml4CJSBnrhebGPJu7F+XynFdIYZbAErX3hKNqBGURhr1NtiCXZkFh10aH6?=
 =?us-ascii?Q?YskKsI3Cfjsntik7e16EA9zusBALtPRy7PBEXRD0ZhjsnQ5p0cLr1XEjXuVT?=
 =?us-ascii?Q?f84GlUy441dQuh+EHItwUrNbwYooZ5C1UdsH+qgO/CxHC8RsUFX3L86fz3hE?=
 =?us-ascii?Q?0fPUDj2Zrc2SVSsWK3Me14cdAxGn0P2fOxafAYpWn1mQKeiLWamIRX3/K/qJ?=
 =?us-ascii?Q?CZTK058i96JOW7JZiVoakzKBTC6M3b49x7fKKCHLohLAfNqFqyxA3kdhBLMd?=
 =?us-ascii?Q?GYBHmyNjh3GJgwQSuO5e2wQc3vO8IKS2pYGZvGqmVwiUY3jR7k/3/D/cXJjv?=
 =?us-ascii?Q?cU18vCsvSdWI+p6HDmPG9Cd07YoZlUPIUqBIIgZ5BaTlX9tY+14ZjqHr7hIT?=
 =?us-ascii?Q?/FeH7CXm8MAmzHYpdEfarlLapUZjPddt47qXF1BeSOC5Qi5am0lBy6eIutgp?=
 =?us-ascii?Q?B1tSU4suWS7Y9Iv1DxoF9Q4kksMedcdfqYx43fEnz+7MLpqr426tM039D0bD?=
 =?us-ascii?Q?MxUMEij0TC57Y2wSrbu68dswgmKViyw9ohM8uQY+9AQSaRh0StW3IQhVRAFb?=
 =?us-ascii?Q?rqxZqsZ5bSHsN/RIMZWZ5vn3YXiLeCkqJD5AWbXYCbSv1W6tGAvOmn4pMhhI?=
 =?us-ascii?Q?mIQHWVQh5Un+7hjJirEU/Oct9NzSItvW1YYkWc7nOyh2RWVB7htAvopE2oN6?=
 =?us-ascii?Q?Fq5KS5gGCyddUYVss5vyhkByR0Q4uZYWUNRbXk2nyphcQ1uQC4vm5sVpg8bC?=
 =?us-ascii?Q?TRyJ35Gm1yDO3T2iVkRvjc5Q/H9GEavzSleoPg6yJUgHrQdQ+Bs/TIYnUVG/?=
 =?us-ascii?Q?SumEqu+6e6sLpWvqfT0qboyBsHwLfZITo04a9iVJAK9e3PJu+/2S2c4E+Hn+?=
 =?us-ascii?Q?shnG1u6PHY/3SqrYFLSqt8AK9dHqHs7eHAfgZSnzOnIanrsSyu2o8h5RhNBN?=
 =?us-ascii?Q?k4mLngHwyA9OntH2gBcKxankxoTUcEZPDSx+pbPXkpjcIHfjvxHKnnu3bxN3?=
 =?us-ascii?Q?ojOKBfVXta5pSx1ub/GLMLo=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ae1349db-ac15-4312-d956-08da8f94d641
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2022 23:17:44.0066 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bgcUgujb+x9nYhwojutryGN/ZS012Mm9sHhI+14A1PEmUQBYJvawnp1JY+YZYL4PKht0c2tdp1OE8zXUiHoR6ECoW/RHraU/JeD/ykqG0ONEnJaLEC9tTbiLO0wBwJH0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB8191
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

Current snd_soc_dai_link_event_pre_pmu() is checking "config".
It is using dev_err() (A) if it was NULL, so we don't need to use
WARN_ON() (B) to check it, it is over-kill. This patch removes it.

(B)	if (WARN_ON(!config)) {
(A)		dev_err(...);
		...
	}

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/soc-dapm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/soc-dapm.c b/sound/soc/soc-dapm.c
index 7d4e4068f870..bc7d64b570b4 100644
--- a/sound/soc/soc-dapm.c
+++ b/sound/soc/soc-dapm.c
@@ -3883,7 +3883,7 @@ snd_soc_dai_link_event_pre_pmu(struct snd_soc_dapm_widget *w,
 	 * necessary
 	 */
 	config = rtd->dai_link->params + rtd->params_select;
-	if (WARN_ON(!config)) {
+	if (!config) {
 		dev_err(w->dapm->dev, "ASoC: link config missing\n");
 		ret = -EINVAL;
 		goto out;
-- 
2.25.1

