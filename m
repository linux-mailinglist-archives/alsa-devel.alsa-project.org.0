Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A8FA53741A
	for <lists+alsa-devel@lfdr.de>; Mon, 30 May 2022 06:30:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8A86D1895;
	Mon, 30 May 2022 06:29:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8A86D1895
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1653885000;
	bh=1uQDGmwOfx2FhM+jMh98yRGeqrbvUiSYKjjQ4Ybqrtw=;
	h=From:Subject:To:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=pPJjhnMEmwSFORmbKCYOsfo60QNE11hNkRxWT4OmHIUslzECSadOufBxBUsvqBQb5
	 2mKCuS5YpGgaP4vZzPxiLsi8MVUXsq+3BnqB4R3zq59A4C7RG3IakNBmaedNA1gEx/
	 wBiCWUyY4wLGdadkk3UTsMTLQeg3Y8ZLdFqYIo/Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DA4C9F801F5;
	Mon, 30 May 2022 06:29:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8D672F8019D; Mon, 30 May 2022 06:28:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.9 required=5.0 tests=AC_FROM_MANY_DOTS, DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on20715.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:7010::715])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0F928F800DE
 for <alsa-devel@alsa-project.org>; Mon, 30 May 2022 06:28:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0F928F800DE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com
 header.b="i4Yd4WlE"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=egZV27PBVBDQj8XfzH6Ih3mCytjfV8svevq91vC3Psw9BDgW/o37a2FEZzk3jYNMz0iF38EtFQoLjuBbCNHi556pLJtkjUrOo90M4FZqnh2uycxUUGc51dJ0q31+yjVsSJCtEmG5jbYghurttMgscjL0REdbwmHUnDUB5Eaybu+L1aRlKxdW5X4gd//bOdBF8rEEtsaqnH5SgvIeKQnEwtQBwhLrNutQsk4vxCXhc43V+V4PBVjt99WQf2r3agkiEMz1aUov7iGeO6Zsqc9+JN6hubr7BQZjx5ExX3AEftwbKMe08ShuwuTpfciE++M7d+2xqyxL+tTNisoZ/LbnWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tDbOdg+7n6gdrhMwkpZk28nMnT4rmmpMAKe2A0tH6Hk=;
 b=UFYI90jd4q1BwwDfJGPrThRk2Yo27U8XUzMExsy307N2LIIZ5ER+7bTFM6NA13p4J9TF4Fc6oWe2iFX4liA1Iy5daJqDe62Qzp0sNCTEDdZgThYUOKN3gODrsrRt6LHAVg3r6hVvlhOsidut5ATBXwhOeot/9jCpieOHQkxl2xGBZQitbM9/9Kfn4x8Q4CwDQyRVKvQ6lQCytNFlU0lnt5GFh1YFOgNT4FEdKkY8ibJub1fzoXm9jnvhWN/5jSMxpS2wjuweBOd+6oAzlV/iMxmOwwOlRVriEFDekCbaQHtCyuFwrK9GYvZNmsI71ZzeTBdbQxjpgRVjSxq3JeQFzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tDbOdg+7n6gdrhMwkpZk28nMnT4rmmpMAKe2A0tH6Hk=;
 b=i4Yd4WlEcLY1EaC79xAP6LacpkDM/HIhVo66VDQ3MyRhHYre5eHkQL/2p+6BV52+Y8p18ZJAKi295WVrT/nV5xJIywYRhceCZ97FlElRxBTPRTztAiFC9t2Q3RCWYZ0LbS7000Rgvk2bEm3OA+OTfZFcbhGEosKTClg06k4dsPc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OSAPR01MB5123.jpnprd01.prod.outlook.com (2603:1096:604:68::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.13; Mon, 30 May
 2022 04:28:44 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::f4d9:ee3d:e07b:171a]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::f4d9:ee3d:e07b:171a%8]) with mapi id 15.20.5293.019; Mon, 30 May 2022
 04:28:44 +0000
Message-ID: <87o7zflk3n.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH] ASoC: simple-card-utils: rename
 asoc_simple_init_dai_link_params() to asoc_simple_init_for_codec2codec()
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 30 May 2022 04:28:44 +0000
X-ClientProxiedBy: TYCPR01CA0133.jpnprd01.prod.outlook.com
 (2603:1096:400:26d::14) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 984871fd-2e81-4994-aae9-08da41f4e1f9
X-MS-TrafficTypeDiagnostic: OSAPR01MB5123:EE_
X-Microsoft-Antispam-PRVS: <OSAPR01MB51235C956EDF8D0F4C311E71D4DD9@OSAPR01MB5123.jpnprd01.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: trIr/Pun+WW+6TvYVn23eR6JNvmrXOFxfrnCUHm9jsZfy5ELTZ1b/Bs8wddbRpEb914aVN3bj7ZXYU1pEHIbkrPQqDTnfAdtoUHCAcpgbxQBuGncqLFBiBTiE1lSopGmhgneNwdOXEe5ivS+4+bCQyxVLDHJIorn3iWtIZ3RKV/qU4KumcMPh5JqsiYH/Sx71uLt2D6UQ4QdpC9pN6eOikQhLm+hdfjSMAmUUAONSKVLdOw9oMGpmo89H0EGeHpoioE43HG2Mn7GyNyQN3hWdKFRFx6B3HM90PGVpqEos72D36DT3MQFIV2mbZrUZKMmX1FzgH5WKwa5TOcCXt61W1gzvv+W7agiVy2vz0wJLqwMSnYkmDGoq0uqhl+UKmJ1CPZFs851FWmkoZMintZJ4I4A7NUUoUGsShh0hMRL5Z1SPQaqMSqP+ig4JkOKnyu6yHTRYQOiOecTXe0y/xSijsDJaPxUiFFPbPYqaWLsSFkCc6hTZfPsGrwUK7FGYEX84IeOs1LFNf84JXkrliaMlcvD8CsTFExoF/nXeFW921HKjwKeTccrc/vBBElB7u9F0sVSlH0npV5wNc+Na+wcupAm9XMaFB+qttKICRcnx/WhhPyXeDoIdVX1+PYN8gAOv8ISEVJWGtf3XzjcIHk0C4ESDH59FCiT2orMQmBlJRChKejb49FfnTXmaJ/dHSPl086OtYhTeGsL5y7o9961PQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB8426.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(316002)(6512007)(26005)(6506007)(2616005)(8676002)(2906002)(6916009)(508600001)(6486002)(52116002)(86362001)(186003)(38100700002)(38350700002)(36756003)(83380400001)(8936002)(66476007)(4326008)(66946007)(5660300002)(66556008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?cHufgEjFXGMYaSCbG07C0mG7MFUYvOnTHVDgGIeuQCQ7eTdj7V9vacFqIOZo?=
 =?us-ascii?Q?cTZht1Q2W+5Chvc7g99HQig+vnd8xCi0k9urUsY5ArKdbzyM2YGGWlBYlhen?=
 =?us-ascii?Q?f+p5kO/qKBocCJfft+NlDjXUZlt75GCKnoCNFeEZCe56ggRPqmgYrf/VroD6?=
 =?us-ascii?Q?sif18GzXDAVlwWF4Bofd/fmxz87pYbq0mVCfVS93vI5fVWXB2EiSPVn70hVr?=
 =?us-ascii?Q?EuUsquJfkw7632WxLZL2lkMyz5uXnToSafzHFS2fpU+xKD/BQAkTq4QpCdhr?=
 =?us-ascii?Q?JwT6QiAOT9dVOH4EzW4I8K7zB0rBG4OoU39f+SpU1Tlah7qdFCoQyM4sUp9V?=
 =?us-ascii?Q?IzIc8/sJkYHXfwqQGMYlNHTrjuUAOaTk8GkrxgEemT01HZwycIEEVa+QtUZk?=
 =?us-ascii?Q?G3bQY13YpM4ntO2gMmJ2AT3jsCdKBZZE1gti1ghkh2h+5SeP912WJ3/hIwMu?=
 =?us-ascii?Q?qRrJJDMtdYwBfILLd3/AKQH8+2ZSLH0CuUgzZC0+20PWuh3nnLNpK+NSzh28?=
 =?us-ascii?Q?haNUapRsdevNEzT2z6ZKILI+jptTVPrbtVmivYWKWZuMcaniUFpthAMZriDI?=
 =?us-ascii?Q?F7ngDb1IbXvFa7o7nEwvBuemkF1KZGHxLdPgS3DIg5HMrPfENiXqnMigU2f2?=
 =?us-ascii?Q?i2iaefCkWUjkT/8olLJRmdy5G9rQ8b4xKP9zy2hZPASkaD8/2CZNcyBi1T5Q?=
 =?us-ascii?Q?WswmvLEClJ8ELkAeA+jcdDxUSddZaXqkwWuG3P0AtbXpBVhqASL7eNQQ1Q4Q?=
 =?us-ascii?Q?64ZizW07J0lNDzIfv6nCQMWVsD/MhY0ZXNYWHIv0Hthi8MZ9il32EqInulTG?=
 =?us-ascii?Q?n1p6k8ahhtjyBtN4wKud18ugJaVwaPa4nl4T1+yVCwT9bYYk7xcS8mRepJjj?=
 =?us-ascii?Q?r1bc6TevYPigPsh21n/t0gu17jf2lpMo3Vu0TVks8kviP1ooLuF4ATVipNpa?=
 =?us-ascii?Q?YO2gxdmQhMu6B9GHlJhXt2yTCib0T0YmuTlhO4uA03kQsr1/tuGbg5HpqqzZ?=
 =?us-ascii?Q?PZ3u1gAXDCZmNQmdrPQFknFLWpkTQ4iPa4tWPSdb9cvwyAb0eCGUQWQWN9Dj?=
 =?us-ascii?Q?et5V91CMBy0PfbdSycYX1jCTP3GC9WsobHYjpcZGHy8Yh4RnKw/fTG6Ykads?=
 =?us-ascii?Q?hT+yeyyQLaQjndUFycf9AEqqLeICEoIUxTgfUcZmHbse8vghOvBsEtytO+D2?=
 =?us-ascii?Q?EISa7ImwyKOkuV3fME0KaAMN5qcGCuIilRZ4xxpNY+FCWGH5qnUGT5Gr7Ubn?=
 =?us-ascii?Q?cfU+oyksHZQA0kq5zxsUQ12bUn/H4ty7rYt7x3hpvWmQDprLyaqwh5edI35V?=
 =?us-ascii?Q?GxpEJMK16hE/g23+YZmqWe7TK++5LRj31iixhtKqsLgtZV6SNJMRprC7xkuB?=
 =?us-ascii?Q?4BPy6eirmMbj4u0LbHRIcn7uYTbopSnnJbT1X/wogw6y8wZYoeM2lCA0UxhO?=
 =?us-ascii?Q?YRiKzUPdfz+bPz5Kksms7jsUWzfZ/Af9ZxJW9SYpmxc97b714Jo2keOW2sQl?=
 =?us-ascii?Q?AVfsAZMgpuq9pEdP6zz7mBdHuA866qZV/VTfJB1ckFG+N8eFWCQYU5lsGoyv?=
 =?us-ascii?Q?Jdy0+bBJsR/uJzyRGNHkuF5WImMfeAEaes7jsMxLF+P0+faQHgUWoQx+IlwE?=
 =?us-ascii?Q?11JTUewe/brJ3a9QG2v6//0IIpX+c23Gp78EcxyRTQ9dzCxc7GkpQJJa4SSG?=
 =?us-ascii?Q?K30/D8mmEMlxxtM8brUBcqhkkVMEQAnkowia12UKngbSWfqAIQoX2FgKCB58?=
 =?us-ascii?Q?frOK2ZfFF8EANDHYNSkRZF0MTR2ON6mB9DDrsQr3kUQzDiIQkDeG?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 984871fd-2e81-4994-aae9-08da41f4e1f9
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2022 04:28:44.6657 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tidLbWnMsqEHBFBIUODyxvSB+NBSsO4NQanNDPfaLK759LrqexoCBXwVfDT5HDsHl57jgqqWFp5mnxqEh+soFR7Pg/jvHFrBqQTqfooQpG8cuG8C701Nyx18HPBX86jO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSAPR01MB5123
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

commit 95cfc0a0aaf5752071 ("ASoC: simple-card: Add support for
codec2codec DAI links") added the function
asoc_simple_init_dai_link_params() to initialize dai_link "params".
It is very straight naming, but difficult to noticed that it is for
Codec2Codec support. Handling Codec2Codec is one of very tricky part
on ALSA SoC, thus it is very important to clarify it. This patch
renames the function name.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/generic/simple-card-utils.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/generic/simple-card-utils.c b/sound/soc/generic/simple-card-utils.c
index 539d7f081bd7..fa080f166345 100644
--- a/sound/soc/generic/simple-card-utils.c
+++ b/sound/soc/generic/simple-card-utils.c
@@ -513,7 +513,7 @@ static int asoc_simple_init_dai(struct snd_soc_dai *dai,
 	return 0;
 }
 
-static int asoc_simple_init_dai_link_params(struct snd_soc_pcm_runtime *rtd,
+static int asoc_simple_init_for_codec2codec(struct snd_soc_pcm_runtime *rtd,
 					    struct simple_dai_props *dai_props)
 {
 	struct snd_soc_dai_link *dai_link = rtd->dai_link;
@@ -575,7 +575,7 @@ int asoc_simple_dai_init(struct snd_soc_pcm_runtime *rtd)
 			return ret;
 	}
 
-	ret = asoc_simple_init_dai_link_params(rtd, props);
+	ret = asoc_simple_init_for_codec2codec(rtd, props);
 	if (ret < 0)
 		return ret;
 
-- 
2.25.1

