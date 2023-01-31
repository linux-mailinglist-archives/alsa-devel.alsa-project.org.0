Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 837FC6821D9
	for <lists+alsa-devel@lfdr.de>; Tue, 31 Jan 2023 03:05:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5D2ECECC;
	Tue, 31 Jan 2023 03:04:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5D2ECECC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675130733;
	bh=NgI+iqiNiU+Ubc6bXhDmiBoCwFO9hDTzrUjWABDyKAU=;
	h=From:Subject:To:In-Reply-To:References:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=rv0M9wuLRgNk36pDd0pl4pAgvqHxbJlY63/Q1bZzdOyznyrMg9bivSr1Dux0CQrGo
	 tj3+3iyxATiRdgVMmjCa3E4GbxRmmddWjzXM5Lqf1sPMWTiE/8SWaSypbNQEYXwYjW
	 QTAFwRvppv5ALkWxrmMTxk/gWmiz46dJgtT0+0SI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 08C48F805CA;
	Tue, 31 Jan 2023 03:01:39 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D9936F805CA; Tue, 31 Jan 2023 03:01:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from APC01-PSA-obe.outbound.protection.outlook.com
 (mail-psaapc01on20716.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:feae::716])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A53C9F8007C
 for <alsa-devel@alsa-project.org>; Tue, 31 Jan 2023 03:01:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A53C9F8007C
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=AXMVJrUr
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aNWQorEGSE96z5gIAa+RXt3VNzmlFSG4QBZ9K0Inc7r5Id75ZSV5gmIsESaERw5SwTGkWjP0WUTJ9swwh1vHlRIRzp7bWDxUr98LA73eN/ndzNplfWpoauRWjPdSxSxdYyqzs2zTm3kLEAd/kpFEPDmD5xJlKjiSsknE/80H3h8KUPDDQlDIM1JcXGBjscbC8MzqAlHk515VLOy++nvtw0Avfp2e6Utawc2ptwmSJHeNLiYK9MmM39kUyLPgfEOHvSyUzIWuuxpRI+vYLoTYXqoL3dulGpHnc9lDKiEPuTwUrA+a3+TWhHtJKSJXl4WselhWHnwXTkDwiGjySBz3Dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h52yfGmX289l85qsipnJHVZlnNYu7OlW2JlZeBfgM6M=;
 b=apxu+RJa3dP5EfcnozqvjjQSxB2pZNRMa7zMhJhCihTEatqxFnJPSvTkmYCHSYQ7Wz9bRsu1YVsmLH4xeHqfzdkEKkeL2BbXBWKnsRiMYP+zOBvbCxE3AWRXT1gc4ll2VrBbw6KIQNinsl3/jDVf8qQLYYCYlZ1iiWlxCkIILfuqYczFt1BRXwk5kepgMkmhxczR241fQoXFedZ3RBnbQEXUBNTxyHFH8TRUJLJmD+5Vrxwn6yLjfsh/XcUTUC56kKXJfJJkPIr6v9cwgVrfsbXcHQ+XP3Ml6rsSimE1nS93jGNe+Eq5ENgjtZWBN8KocNjJ0POYKjAjgRUf46yB9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h52yfGmX289l85qsipnJHVZlnNYu7OlW2JlZeBfgM6M=;
 b=AXMVJrUrSJjjfkL7aW+hvoOQKufxQFq7DmrqvsuL36osoAmcJH/QPMJ41b0DVgR+SElimbDA2npna1PJma+/tF22Uv9pQZj9sN+3rSFaGaERq5w+Xv+AZ0nCVkgs7rlp5CwKMQlknnGfFB68B2PpuiKHu8G6VWSuQwb4bPW/4V4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYWPR01MB8464.jpnprd01.prod.outlook.com (2603:1096:400:173::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.38; Tue, 31 Jan
 2023 02:01:29 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::4b75:8d8e:d89a:7860]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::4b75:8d8e:d89a:7860%8]) with mapi id 15.20.6043.036; Tue, 31 Jan 2023
 02:01:29 +0000
Message-ID: <87k013ea2u.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v3 20/25] ASoC: soc-core.c: use helper function
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
In-Reply-To: <87cz6vfosc.wl-kuninori.morimoto.gx@renesas.com>
References: <87cz6vfosc.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 31 Jan 2023 02:01:29 +0000
X-ClientProxiedBy: TYCPR01CA0119.jpnprd01.prod.outlook.com
 (2603:1096:405:4::35) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYWPR01MB8464:EE_
X-MS-Office365-Filtering-Correlation-Id: 66f4e3b1-2232-4a03-a69e-08db032f118c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: n5x7r1SY1HQpuHaIw6rlFW7EW0J846prxR5DIZv3T3M/JnLyRG8oUIxI7vWQhe3OmFCmNkCk5A7jnsdz+h9ATweelVkXwZLjH8w26aikojkx6ZL2aEDGm5j8Jvag30v1FazYT/bi+k8RqsKFKyhqw+oelYG6x57dy5Qm+cl7N5e0jx+ydQAXKVkbTJYS6t1dUqWTpAbG5p5cT6l07+qpTcwJDOJDfEARquMVH5xktADFbLr7rFbHxsvLymAxDSoqTwc+KPFpcR9zPuEClJZlaq6TSH8AO55LreaanJQZiJqo4I6WElPk96hHvTyYgBYhVujbcENyDapTME66LnjadV5yLEs+DBFePbebv6f+6zA6zy08weoKac9nN081BwPcJvzS8VnO9j2el9q+8RDcj4jZwV5oEzBRAhTVQPd0WX9IzLAalpHpU5xYczsRbF0jLU0uNivC+9WD2Yaz3Qt4DIAKZ9qOFGCWwZotUp1zhbKDKO9zTJPqgw5tuX/MO7bDOgj7f44FoCtDEDGE+1vd8gpFhOnLFuhcKFInazC4YmyDotY7WZ9xBVImIhVH8xYeBE4sFfrEjb+t9VVtDh0DPptO388zHdOmiIp0W6UDdZ4k8xZ5f3wZxKYhtqTWeLc0qeumcXRW35APNLH3rMEeV4clhKX2koSQ1V5WHdVbgxYe6Z+zwp8OLAR7I8wDKtvlGtP1fKQDE+EbH4NUnM37hw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB8426.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(376002)(136003)(39860400002)(346002)(396003)(366004)(451199018)(36756003)(2906002)(83380400001)(316002)(2616005)(8676002)(478600001)(52116002)(6486002)(6506007)(6512007)(26005)(186003)(6916009)(86362001)(66556008)(66476007)(5660300002)(8936002)(41300700001)(4326008)(66946007)(38100700002)(38350700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Ly6i9Q/GAHW7kSGws7+fdzQ6HJEJru3ACoUOJkoyCO7Lh+7YqNtR25AJm+6c?=
 =?us-ascii?Q?QXZNyjAr0Br2Xdwv9SU9Jp1SpFD0EEfD4l7sUqcqo3NuFgy80t2UttCpDauZ?=
 =?us-ascii?Q?EeCNAKSEXl9IaJdGBiWWBbNFfKVcqGXaFNpJsSq3yHT2kMAWuwIYcp45CbUU?=
 =?us-ascii?Q?AVMBGKQIsvTPpRWI7XXu+LFqB3xUoCeMKWMQSMHXltBPfz7rqIKmb/sd/sVO?=
 =?us-ascii?Q?SgV+Y8Etj6zGpHciME7bKVsyFgywoEV7NM5kpNFylH1tfEOoAOa3eh8ZbtQX?=
 =?us-ascii?Q?GRWr38RZKL70hX+QkFvDlSrYAsL0tf9MJZSK6T11WYnxfb85+5Yk85LT8ScX?=
 =?us-ascii?Q?9tVfaxJsWmdv2EWXOOGh2w5eoUdSGvmJzajDPnx9vQEx7oNIBs2XlMQtTji6?=
 =?us-ascii?Q?j1qVnl4g3ZJzAVAJxFAoY03zCYeQLtrQEOIL1/ErHcdp1q1hj8KErdstsJEe?=
 =?us-ascii?Q?jYs/CEpYNeUNrM9WazLIjoxMmFNP9USNXkLfaVt1p2FE8Ck9h5UqY/F3gc9y?=
 =?us-ascii?Q?gPpOIhqDHTMUsBaa+CntyNCy40d6h39tE3k3p+lLjiGXAqSP7M8rX4/WpHwf?=
 =?us-ascii?Q?+Slb7Of3M63tYzW8iaZUNFhvtl10gHjVzi2UT4VynbP47MWb/PypsYqIZiSO?=
 =?us-ascii?Q?UA1eQ2FNnQbUwonDhA1MMqafv/z8Ggi1bC4NgRT2QnS6YMbLvhICEp+vY620?=
 =?us-ascii?Q?jlcCMovRK4d/MM4+HVfcXl8YuUJs7tCtEsSbV1VQ1X1jt/+WzsPlYTSv/KG7?=
 =?us-ascii?Q?Iq+3nLhjxqLS8yYtTie16l5joEfPAhKGGVIF2mZDKIG/Q1Uzl6zRvI6eL3Tp?=
 =?us-ascii?Q?fO2A3gmZqk+NBXkY7aQG4O6IL9uXRretN9Dt3o6sSBkkjlwdpcDKyzTXdy/x?=
 =?us-ascii?Q?8K+YplTtPlXVh4BsVZhrpvQ5jrFV6skEarYEgNB9d13p6EavZHAC28JxhD/0?=
 =?us-ascii?Q?4UGh5W3hc321+CNP9PkaceaznVjwPpy2hDMf40r+p6VYl+btLPTdOydq8oRT?=
 =?us-ascii?Q?e2GOum1CFVbUkym/oqf1MmcuFyqp/MEYpCDwiu4cWo+1TSu2mtGkuqr4eKwh?=
 =?us-ascii?Q?yF3XuVN4If7JT2nxn6vPWEreoSaxHV8Xy6unWu9n8Ruhc7R5BzLxJ6g/O7OK?=
 =?us-ascii?Q?/Tf1W8tSGXwOJJUjvcITsE2B483PzG0+bYrQ01Aj8aqfyeJs/NQGV4f+cP42?=
 =?us-ascii?Q?vxmQdEJkWz10qM4rPFZ7Jcea5uuqC7jcz9v8JY/H4aFc4iTDh7Lell3Vvv7p?=
 =?us-ascii?Q?6BSzyVnhJSQMtROXVRSyvGqSSo9rNre6Dl/0LwDe1BQnAFZw3evCoB3KVMYC?=
 =?us-ascii?Q?0qd7HZpBMpPSBuCAW6GQVIaGz683uoZ5U9IjrIK+7XO6ucZwPf/Q/kePqduK?=
 =?us-ascii?Q?JOVYQA8+f16eVWy/1Rs6C9hgLLJM3VYQ/D9meOSZ+Y98WtTVVG+9+h8/+X5u?=
 =?us-ascii?Q?eEeLdj9ChyJJ8/p8QBbLAVivFtwLKcnMnEniUnj3jBvXraFMgnyZ1dNfVxaB?=
 =?us-ascii?Q?hx5LkE5YgKqTRnLOzb3n60SWkZpZQGdJXz8u0SXL3P4559XOfeypDwO4Rh02?=
 =?us-ascii?Q?mloDhW0xX0YkpCSSmug8nD1LDTIPhgbTCe8rD0kvMNayBeegTNu8M/QPqI+0?=
 =?us-ascii?Q?vd8LsSJf6gUlabRL2Qx1GnM=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 66f4e3b1-2232-4a03-a69e-08db032f118c
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2023 02:01:29.6771 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dAWZjPQ/LBx9IzvjqTWr5ZRcW2O8scMgedQ+pACpIvhT/dx1kQWItCLCyTQJ3NdFCG9r0ToDtlQr8Hnx3cYeaTE3rciE5T3DDOkq2HwQBu1+X21L9OigbfvT0J7mK00i
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB8464
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

Current ASoC has many helper function.
This patch use it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/soc-core.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index e613698824fd..71b022f7edfd 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -553,7 +553,7 @@ int snd_soc_suspend(struct device *dev)
 	int i;
 
 	/* If the card is not initialized yet there is nothing to do */
-	if (!card->instantiated)
+	if (!snd_soc_card_is_instantiated(card))
 		return 0;
 
 	/*
@@ -695,7 +695,7 @@ int snd_soc_resume(struct device *dev)
 	struct snd_soc_component *component;
 
 	/* If the card is not initialized yet there is nothing to do */
-	if (!card->instantiated)
+	if (!snd_soc_card_is_instantiated(card))
 		return 0;
 
 	/* activate pins from sleep state */
@@ -1915,7 +1915,7 @@ static void soc_cleanup_card_resources(struct snd_soc_card *card)
 
 static void snd_soc_unbind_card(struct snd_soc_card *card, bool unregister)
 {
-	if (card->instantiated) {
+	if (snd_soc_card_is_instantiated(card)) {
 		card->instantiated = false;
 		snd_soc_flush_all_delayed_work(card);
 
@@ -2126,7 +2126,7 @@ int snd_soc_poweroff(struct device *dev)
 	struct snd_soc_card *card = dev_get_drvdata(dev);
 	struct snd_soc_component *component;
 
-	if (!card->instantiated)
+	if (!snd_soc_card_is_instantiated(card))
 		return 0;
 
 	/*
-- 
2.25.1

