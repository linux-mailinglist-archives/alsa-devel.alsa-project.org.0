Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A14D6775021
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Aug 2023 03:08:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 68EEFE88;
	Wed,  9 Aug 2023 03:08:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 68EEFE88
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691543331;
	bh=A9B9gzzNBxj91uHBAqKTnTO2lc/xqnkqr9q81n6OaXk=;
	h=From:Subject:To:Cc:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=S+/v4w7lefmftJKfD9lr2seGFkWGwBKIvfdzNacu4993ne7t8S0jj8XqTM0kJXXuR
	 zZLlI0bxHJ6faw/4ZgqzZ/g0CnpVPtv1o5GZSGUzIhWGfgSuN1ZTm68fN3BoxOUJxE
	 B7Y2m5eOQEoenpyvRWhsDsu2LFSkZeHdE+qubg4Q=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F1771F80116; Wed,  9 Aug 2023 03:08:00 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A76DAF80116;
	Wed,  9 Aug 2023 03:08:00 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 70C79F80134; Wed,  9 Aug 2023 03:07:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.8 required=5.0 tests=AC_FROM_MANY_DOTS,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=no autolearn_force=no
	version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20724.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::724])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 21022F800FB
	for <alsa-devel@alsa-project.org>; Wed,  9 Aug 2023 03:07:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 21022F800FB
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=AT2sFdjC
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DwPf1Be6hVci9iIbi4v6R2Nbe7rmhvJ84qc0LzwT7xaTc6QtWYHuXmJ581qzjfCwlczBOY8XMivz4Jy3XAdBuS9agwT+qjWJ6m0OvD0pnriE8J9/5ywMJBlXhCqVrrr+tjxVtgwzQjtFTDCjYCI0grHltReox6W3JqL1PoCv9BEJ9pEjvYy40UA1h+UNgnckjYuUzKJWQgJMhnDYRMdAO0Mj0C9CcoVb4qgu2bkW/VndEPLnLzbn2L3X9jDAJdF7FYXrKSvLOiFnyZwq/dY6ke1Uotgb3I51jYc51GEsBBOGyvFEJ8UHGyrdc56MZD6m1tp4tKmWAsOWznyf4ES0aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M3lQRAsP3kG+23TW++5lTT3cnlten2nZW6W9UkbuiNA=;
 b=jAeS+/2tyVuxwoBLOjX3dStI1bAOh3nOl4oqhpXrfH4ZF7TdGmGw8QbIghbXFVVQvvg/huPOQnbS+Pvx7/mIVBCWPHGPHX2mzvtvzRCREY85KHg81j0st0+/Q3E8+WVPHpgqAG23ISXoog60uQf62+DG8weDZpV9N0fxJOh71qLyk54UFxgpmwG+dNUj43RmJLUaXdcjIEoefpXMdtTpzMNTnAIdSXb3FlSOs7wUx1HGzh85lRX1Msv4mU8sMxwPLnfkgFvh70X+aAmbRim83MhKPNm61kHGZC3cY8tdrosMHVXfj+nd9RFtgaUOdZRJwcY+q0mv8HIfvZUc/y2MEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M3lQRAsP3kG+23TW++5lTT3cnlten2nZW6W9UkbuiNA=;
 b=AT2sFdjCe31qnZFaVjv7GDWd5Kk8LLvJ2XT/tZhe4aDbqJt6xoQcMW/Rg4OTmlewjOmLRKafOH3n2CyAGptzThRj9wpHqYg0AUjNHiXtZ1ZDH+q4MMCDtL/UD9kGzX52ZEj03onJJD0IN812Oq8TpNVoR5gtuvaWCuw0DDhxUi8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYCPR01MB6287.jpnprd01.prod.outlook.com (2603:1096:400:79::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.28; Wed, 9 Aug
 2023 01:07:45 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::e6db:c2b4:3f89:e3a5]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::e6db:c2b4:3f89:e3a5%3]) with mapi id 15.20.6652.028; Wed, 9 Aug 2023
 01:07:45 +0000
Message-ID: <87bkfh9g68.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH] ASoC: rsnd: call of_node_put() when break
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 9 Aug 2023 01:07:45 +0000
X-ClientProxiedBy: TY2PR04CA0006.apcprd04.prod.outlook.com
 (2603:1096:404:f6::18) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYCPR01MB6287:EE_
X-MS-Office365-Filtering-Correlation-Id: e67439d1-16a2-44aa-aaf7-08db98750a1d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	65xUp783t6NbP1XWJ2AkwamUAMDBu91bk3bCjBJBnXArKN91kexoZxJKenBv9Ijaf2DJxjGCJ2aDH6O+iI2yNpq8roGb0aa0nvADp5KTZ9d/Em5HxJ5TQ9q1cTexwa921I+JG5L58LZ8ZYYJBc8NvHUzTyrciomf+f770vLLNAhTL7r/7qFMXaGL4MsPzXOkYwRwqTZ1uqE/xOfvlgr+zNviy6PTE9Wos7JN0fTtrFaU7PKQmjgqVzxn7+cRGZKb5I3tIt32YziAu4SX7irnzJPXCS08e12Nilproz+Q+MT70rIQp9TSep66wrudKfPVTDkbQgLTOE5R6d+tTi+FJNdR3ZTvHFEybd1eIs1hzv2EmQY0NHtEUkZF1cvyzIgbP3f3IU+oK2Rd5xs9gzWk5wlHyf//UOAVw35ooMWA3m8EqvXeFEerguz88a5VNrUon9kismpMd9jUZyRXTjqDJgwUHU5cIUClCnWUX00wNcwuChc74Isgaf+XJGYHEAVZtCoFXVUrlFqnb1KTzP4i6bC3Rkswjg/ilw92K8jKOq3JXZsXFSFA+POBtK33IY39Kz9yzpdzMYcDBRddLaUNrI4aVfxNNHcYStn1v/B9o+M=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(376002)(39860400002)(366004)(136003)(396003)(451199021)(1800799006)(186006)(26005)(6506007)(36756003)(6512007)(52116002)(86362001)(6486002)(478600001)(2616005)(6916009)(41300700001)(4326008)(66476007)(66556008)(66946007)(316002)(8676002)(5660300002)(8936002)(38100700002)(38350700002)(4744005)(2906002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?CCzj/VTYJES+YuCli9cFTmJczgEu7qZFmKUTjofVWRt+h5liLgdhOEEYCZmU?=
 =?us-ascii?Q?KM8pNjymFbvjYYXzLaqXFT6X9qNG1fIobrlhwoFvKT9WBnhJUf0Ww9Fw36wd?=
 =?us-ascii?Q?Y1oRNEDNWINtuN2yucGFPLLiXgQzc6JNHLZNY75tXHPjYmrYTN8c50yJu/Si?=
 =?us-ascii?Q?ywRKcnAXfIyM/qXAkk4cAuX15XhTRzIBEbMlhydhWucyOzQig8bnExsy8ulO?=
 =?us-ascii?Q?wc21vOb2UJ1ruJ/Q7XOvRQfXdcDg+hCt44MqpiaqfUmUiLckdHt79LSdUy6R?=
 =?us-ascii?Q?KGisl/YVlfHCBbjYexfEVRkqdbrVCiHPoUXJoaIsY8unBpA1RY+WQuXC8HH/?=
 =?us-ascii?Q?c4gy5BlglaKA/6kMWYVcYw29Berh8UhxbsKImQpYdAXbDNENlAOSYy0X6wrF?=
 =?us-ascii?Q?KPUArVL///mk4s5n+GW6jDnzFbV9ogsWzHfEkbBisKZ5GgdS2nS5/MP5UPxP?=
 =?us-ascii?Q?SGoI6O9CTpuqsocqUFlLOOHo+MVy0iL1JiN0uzaEjQ6QNnSp18aHj2j3dMhq?=
 =?us-ascii?Q?hJosk5fBVQ+p6hVadW6mizd5TPDXO2HH3ghPye7KwAvo8Z72GJZmDKRDf+f8?=
 =?us-ascii?Q?6HalXh2U7rPJWu84FoFUpvem+wslTnD/oS18ZfUhqQ1sC6S+f02SzLI9iPfV?=
 =?us-ascii?Q?dheSNrszTMFGkEetLXwi9JZ7SZqA9YV9X3uhEosiJs/ugfSsC4wcQT2pdXl9?=
 =?us-ascii?Q?H4bwCI8YoxcrxwKTHH2QquVzXGzPs9nNmcHy4iPd2wdg5WIdtawY1YDFqWP2?=
 =?us-ascii?Q?Vg/CpKGPNG1HfomKw9jRPI0+p6LXhVrVWHhHTbcASCjN4mYX+TDBy/dRaA0P?=
 =?us-ascii?Q?EkpvzUkSXQQkWfcAie9AdvbyOjBFQwhE+Ck/OsDRK2cjZLiCDf7P4Q8yRdBU?=
 =?us-ascii?Q?NUD+4CJqcnGUWiqckR4BCPY9ZtArv46B4+uKuoTu9JHIwh0e/csRdIfhfAt5?=
 =?us-ascii?Q?TbsCFAp1/Wa6u+2eFtADauj9iEjwRX1eu245oHUq4dk5NeBW7UENd6bDTKT6?=
 =?us-ascii?Q?PW5z59l7hDI18YJDktILuGGK8m9WjaGNHcsCAA1LI8PLrc0+J4gGNLog8vAs?=
 =?us-ascii?Q?qQfjErddzNsW+8my5LKS9FY0q4q7JX0lj5qX/5lZYxrtGmm1uZ7nNgambC8t?=
 =?us-ascii?Q?ZbVaVxhPR+EYiwxD4IyEbq6or6cL/QYKfpXM11di3C9Reow0ADyTnYzEE4zT?=
 =?us-ascii?Q?BkRF6NUIsfErexGMd/VPHUezrZWRgS10F8SvB3ohWRKMMcaq9LwsM/Ckbg0F?=
 =?us-ascii?Q?0RlyCkIWFpFTSPnd4pLJ5W+cZ1MdGY0rPrNriekEeCKBQ2P0P9IpSSi9RY06?=
 =?us-ascii?Q?AOZQLIfzW21McXHumhTVDLLFKet9TKqdPv8nhl5j7hrWfzwc/AHCo7FGXGUK?=
 =?us-ascii?Q?3iM6f1tZCAOTt8kHZGIwme+Odr0OZnmW+z+07OdMRjZy0ZgmsmMf6UxOSKfV?=
 =?us-ascii?Q?8hysolhM3ExjRUaX8EbPDbyJWqG8jg07qlh+pm9xSD4UKVPRj4s6X6hEuzpu?=
 =?us-ascii?Q?VEzJor1aSkfL26eLG1Fw9aXafDnTl86LkCsjfA0lKu2yceqFxZzo1CMPYwAq?=
 =?us-ascii?Q?64kOzGaiyE2iauxdje8q8S2/mnlKRXZ9D7BMmo5wnjjMNNAnCa63RTicPUBF?=
 =?us-ascii?Q?N93HPm86tStTfklUzib0iUU=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 e67439d1-16a2-44aa-aaf7-08db98750a1d
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Aug 2023 01:07:45.2698
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 ISZzEhVbxfhIh2lOyoLQt9L+x63dPBgm3AZJpeu/lLxKBv5+Y4GkLNH9DDhqf5CN05Tff3J7mESkUmPlUT90gVU71+SHp5PrALq2cHrekiAJccgUe6xM5wk3tpvqcir5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB6287
Message-ID-Hash: H7EYDGGKSKSCNVFCXXORD6X7E6LGPJKK
X-Message-ID-Hash: H7EYDGGKSKSCNVFCXXORD6X7E6LGPJKK
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
Archived-At: <>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

We need to call of_node_put() when break from
for_each_child_of_node(). This patch add missing
of_node_put().

Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@inria.fr>
Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/sh/rcar/core.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/sh/rcar/core.c b/sound/soc/sh/rcar/core.c
index 069add7b1b71..e29c2fee9521 100644
--- a/sound/soc/sh/rcar/core.c
+++ b/sound/soc/sh/rcar/core.c
@@ -1282,6 +1282,7 @@ static int rsnd_dai_of_node(struct rsnd_priv *priv, int *is_graph)
 		i++;
 		if (i >= RSND_MAX_COMPONENT) {
 			dev_info(dev, "reach to max component\n");
+			of_node_put(node);
 			break;
 		}
 	}
@@ -1301,6 +1302,7 @@ static int rsnd_dai_of_node(struct rsnd_priv *priv, int *is_graph)
 		i++;
 		if (i >= RSND_MAX_COMPONENT) {
 			dev_info(dev, "reach to max component\n");
+			of_node_put(node);
 			break;
 		}
 	}
-- 
2.25.1

