Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 124515420B9
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Jun 2022 04:10:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AF1251A45;
	Wed,  8 Jun 2022 04:09:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AF1251A45
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654654235;
	bh=WRmPSjUV/M7AwJeyAguvYq+0Ll14Y6hEdk3jTb7PgqY=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ES2ZweINvjyhNnCExrTU1ZnmbrCbQIfa/pSAbVwVK2U3GObZQWXbRKNhWzQGmyQYx
	 pXbeF8Lr9hW8rk5VlaKJbEnXzgeeAV+A3ic1XcgALbCrip/aDvGd3BAja9sDI/hjV9
	 YFUuqjS8EUAG3zBw+5PZBc0JDYENlp8tUHwMcEvk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 350AAF800C7;
	Wed,  8 Jun 2022 04:09:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C57EBF800C7; Wed,  8 Jun 2022 04:09:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.9 required=5.0 tests=AC_FROM_MANY_DOTS, DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on2072d.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:7010::72d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B4552F800C7
 for <alsa-devel@alsa-project.org>; Wed,  8 Jun 2022 04:09:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B4552F800C7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com
 header.b="JQJlFNb3"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HhA6+7XiDv4UQMqsrQhVi/NoFw6dyChcQgiHCM4En6mfvJaU4HbhX9NIqmT/F0OO1WQZhph4zBCQJZBk7qJSTj+jNx56temsQFIXj6Q+CfbEu0Il/mPdexnvLSULSzFCkOCbAWiMNLGh5ovotWSfZ7A1bW/JwE1vRCAm0w/I2MFlooqHm1KMnMWivtUXM58+60jObqfnCnW3MNjSGzekD4SGDE0bQkmN3tE32zhUqRREN1NlWt6qIPi04UKIGoRMKetQXlhP8pZyF1+bf71BGIr8H5QX8WUY+Xan/VP4lFBEiZQEl1qAZzKsukQzzlqvr2HtMfTtxZn2RBisB2C4FQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=liG54dLo5Vy9bxaoiSVDzISfv/AADYd/YYH9Qre1BBM=;
 b=I4o8LrSdOL95J1Gj7gdlxLYUULIaIxlM+XTt6PSl0FuAQc5aR7umhIziFJo6VnJOSlaMPOeCcb2sSeCz/AN9rR7Y6Sitx2N4+6zvJX1i0YYe+A2jrRcVQrBO0pPFW/C6D77jVekpgAKxkgvpyvsrrUAuRWq63rNjluY8jmVPpvs7XW+IU9rCRsd+I0FVFOVPALfM3f7ref2KvUc+oQ9dJ6nNCcdgeYfBPkK2SvjQo8rIxmIxAh+xPEZ5XIftAzRMKdYZoNFRvyuUyLfyOcyrRlcd/PLW99EIzP1NBVtdXIEaoupdqM2e3sZ8U5KLyxSJEsu0n39QyKUgzxwWsPSTNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=liG54dLo5Vy9bxaoiSVDzISfv/AADYd/YYH9Qre1BBM=;
 b=JQJlFNb3ua9N85RYC8G+U39/PUoheKapV8o9c1nu0HCc5s5gW87xf4mdL0oPUCbIVSn+iImzU7C1mwRYz0CaKFIZ/PgCS1ajKO1kDL0PIC8bXhIbCSDtA/ImsfgPl0U4lzO0LaWcGexs/IvIoetNdW78MHwuPFtfXnF2XGFfWZQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYAPR01MB2431.jpnprd01.prod.outlook.com (2603:1096:404:82::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.16; Wed, 8 Jun
 2022 02:09:17 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::f4d9:ee3d:e07b:171a]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::f4d9:ee3d:e07b:171a%9]) with mapi id 15.20.5314.019; Wed, 8 Jun 2022
 02:09:17 +0000
Message-ID: <87h74v29f7.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Mark Brown <broonie@kernel.org>
Subject: [PATCH] ASoC: ak4613: cares Simple-Audio-Card case for TDM
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 8 Jun 2022 02:09:16 +0000
X-ClientProxiedBy: TYAPR01CA0007.jpnprd01.prod.outlook.com (2603:1096:404::19)
 To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 09a17f21-b059-422e-45a9-08da48f3e41f
X-MS-TrafficTypeDiagnostic: TYAPR01MB2431:EE_
X-Microsoft-Antispam-PRVS: <TYAPR01MB24316E705DD870F32D631543D4A49@TYAPR01MB2431.jpnprd01.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VoO8RjpyrRG6yzm3p9ZHvF9tFiT1eD1TCKAHmJ1lhRvimpyqAxuFvNK5InroiBmTkS9zNdZ4WlnjABQwjmlQI+mKFgiSQAcjZE39KgeMVrzKS+4paoLzAObsdB/UvnQdOmcDVIvlYsa9F744k3Tmh91f0pTx5teDl1RdlbJOtRszqLVT+K0jBwO5BgiCwzBeq1Iaff6e72mz47JsphGhb8ODcCfcrGv9VVWeMH3ALCrU2eorFwND839B7iQ8//1zlKvyuJAYyKG+FK6dg0nlVpm8GK7UI8Yfi265JLBC/PbSNj2AxKwB6aBd6nMVZQK1Fjqom3X0tBs9TMKQPJDjEPuZx4H85dbulg6S89F19e0rTm3/BVnYRKHrHpusMC12xq/1kkiI4tpSxWC2kD0oPIazKTFP6HiM7XKeq3odeVF3ekCAUJhjFFR4/qTeRHeYe4Cmo4aJlJp+Vw2LCQQGgbsc+ma4Qf69qhRb4nt1zgu78nvFObCRIEwmIVTrNgBvpG3g5M82b7J56bVKUG5VECsodgOAanSXbyBOAh6oY0LjBLwbqVxUXH/I5jvDYZDbofvY4lCUufPjW0na6C6DiNDB0HLOQFHEES9JhIRlZsi8ArjV8/qtVPbiuzlT7xV8BBtyAtXe2pbhAPPEmJxkNHrWUjZPjAdXKv2hcrrLH6Qj02kIiL2qSvlYEKR5fmVINUDxyR4TmBiy5FuxUo93Dw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB8426.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(6512007)(26005)(66476007)(8676002)(4326008)(6506007)(6486002)(52116002)(86362001)(66946007)(66556008)(508600001)(2616005)(186003)(2906002)(36756003)(6916009)(54906003)(316002)(83380400001)(8936002)(38100700002)(38350700002)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Hoc7d+Lvb3G/WP9+i0lM3P2rqVx6KktZJYoaj/SgHP6WbI8aa56C0w8sWX3A?=
 =?us-ascii?Q?ZtEgEqz/aks4hO/ku33EfwY6vMoVSXDNVDcKE5FJiClc8uZBrRNZrk58fylF?=
 =?us-ascii?Q?DCaZOxiFchdN+2bIcBs5ah50NpOH1tjFuQXpbNRXze+jq8r90NckUIG4X7kS?=
 =?us-ascii?Q?EqufuPRf8Qmtyd6DeFtmJHkmew9oK7nxQK1Mwz38QemaKAgy9UiYogtOeMEu?=
 =?us-ascii?Q?1PW2PPMJSsV3II7rXXYRpNGsuzwVMmSivvyxH6bOoLcGTS7BO6jfB/vR4kYg?=
 =?us-ascii?Q?RxVbvkk98JCaPm6gf/be8N+SPchAb8MMTQsVYparLU+lT5pVb2y3boAoCs/D?=
 =?us-ascii?Q?C7Bb5UVeFyjyty8Owwu/lJGMvyu1saFRtiFqKNsormXpF9qi+Ux52kMZy9MY?=
 =?us-ascii?Q?cYeivkoUEWqPT2AH0xCfr8nnlJj9wzfkiMX2cZNx/4Y330srjlieNobCv0oC?=
 =?us-ascii?Q?bh8RuRB92AAv0XzXUOK/DW53Ijrxcqyj9NAXdPlvs+jYAovwdJDpeD5ogWlU?=
 =?us-ascii?Q?qKl4Uk7xKB9Pux9sKDyRYKB65JKZy7fe74qUpY5sbhS7fwZpTwwfoIuuG8S5?=
 =?us-ascii?Q?O8+q/3+3OHD0Q+6eogbDxIT5AkAXPFs1mLMZakUDMTnYFpIPQKgtaqGDi83K?=
 =?us-ascii?Q?wrQ6Ji7u6Jlr3uur4ElCMJWwK+3FbDciyl54xSXyYi5s26BRAhd1Ma03CTix?=
 =?us-ascii?Q?QSCL8w9PMK6vxvQnAqhe5Is4vIxWF0lPbpUf7w4siCNU8B3AW+t4ae1TzN9c?=
 =?us-ascii?Q?mt1vZSejPRKHKbb8INgtpOntb2YLB0c0GYgServ+YzqFPlyT3HEClLsRO8vs?=
 =?us-ascii?Q?C7meQ5KdkgK+GpmOIdfa/Bn1WancuS6rg5J1ayyXv3j26qBJPx1kMoEqOcg+?=
 =?us-ascii?Q?gH0JuJE5CWeWz7hF2za0UbdHprnmQu+uHg1fi4PEKJDgxgFj/GBkQ8ZBUKMk?=
 =?us-ascii?Q?9AZjkoYf+WQKfJdfWL/NaAlG9qbglnIrWox3lgk9sECky33cACGVwJOcb46r?=
 =?us-ascii?Q?n1uoXIlVoY9Qvgw/LCrzAxzdVY7zb4ba5pkkTUrqA27vg2xar/A/0N3S2gHP?=
 =?us-ascii?Q?duGHP454bmAUiT1MUyny7WytCMPz5pOeF2LqzZyn8ejmvjE2mZkT0Ie4p6oO?=
 =?us-ascii?Q?ctMYzvPF3qTMy45du5G71/i7t/SsRob2IqdqWMDkgJHLSmahoRTBLJyf0umv?=
 =?us-ascii?Q?giNQfsHDFP1G+E4waHM56a6X2yHf0OiO+flsvZimHdfvyhVUwbnhkzFx6EGO?=
 =?us-ascii?Q?lTIhJj6nrpuRNJFtGq9fXzsKO6an4FJZZre23zvU14iS1Hh+5PQcvJ6DZ09u?=
 =?us-ascii?Q?RQXveH6udLKmD/vCwzOiBygAl8W0G+tAFMS2Rng5pJCnZFn6sApovrloOixQ?=
 =?us-ascii?Q?IQODSLkaBTV5/m0ih6FKf9X5XrSQB3KM4+27V1BpUywoE7rOtfiAWJYcBeJF?=
 =?us-ascii?Q?jxwNoIyYV74Niwk6IlSSlSmXuYHLwZjHLKYEeQfZdnBscYzzkTfVMJM//zXM?=
 =?us-ascii?Q?XhZLQOFCvmM7ixWDMTcRtMOSgP9tza34HgaJQSL1nFQXO6NtezAm+f5/6hej?=
 =?us-ascii?Q?D6Huxvnrj4DRU+l4wqmn43kiCY20gvYNOFMpCdctiR8ARdK1QnfJ5Nn9HYBu?=
 =?us-ascii?Q?AV088Xn6JW8d/D+Y4Y+rBpBIP4QlECPKsduInkaUlNv4sSHrLh+IGEPwQNiF?=
 =?us-ascii?Q?wXB8t1SS1aueAqQeH51O0SqlpL6RkrHNN5EkEh6f06xiuoAsAq+Vfeyx9KPf?=
 =?us-ascii?Q?Vk1BQ9bvbiy3vA3AP/OrMbRnjcJo3UPi+N/nj67PjgTuQ2qhpAT5?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 09a17f21-b059-422e-45a9-08da48f3e41f
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2022 02:09:16.9273 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dilo+PjcMWNhMq+uh77fnU+wfGe1uXJ/FOnxnOr0xvZkrNai/2myn7UBASiibrzI7tXlUrutRnu33Xg+r81ohL50kF5jQ4LiBIrNc/kuIEu36sW5oGwPDsTuMdbR426h
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB2431
Cc: Linux-ALSA <alsa-devel@alsa-project.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>
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

Renesas is the only user of ak4613 on upstream for now, and
commit f28dbaa958fbd8 ("ASoC: ak4613: add TDM256 support")
added TDM256 support. Renesas tested part of it, because of
board connection.

It was assuming ak4613 is probed via Audio-Graph-Card, but it
might be probed via Simple-Audio-Card either.
It will indicates WARNING in such case. This patch fixup it.

Reported-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/ak4613.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/ak4613.c b/sound/soc/codecs/ak4613.c
index 03b829930769..dbdd421f832e 100644
--- a/sound/soc/codecs/ak4613.c
+++ b/sound/soc/codecs/ak4613.c
@@ -868,10 +868,12 @@ static void ak4613_parse_of(struct ak4613_priv *priv,
 
 	/*
 	 * connected STDI
+	 * TDM support is assuming it is probed via Audio-Graph-Card style here.
+	 * Default is SDTIx1 if it was probed via Simple-Audio-Card for now.
 	 */
 	sdti_num = of_graph_get_endpoint_count(np);
-	if (WARN_ON((sdti_num > 3) || (sdti_num < 1)))
-		return;
+	if ((sdti_num >= SDTx_MAX) || (sdti_num < 1))
+		sdti_num = 1;
 
 	AK4613_CONFIG_SDTI_set(priv, sdti_num);
 }
-- 
2.25.1

