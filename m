Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 188C3829219
	for <lists+alsa-devel@lfdr.de>; Wed, 10 Jan 2024 02:29:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6F05114E1;
	Wed, 10 Jan 2024 02:28:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6F05114E1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1704850147;
	bh=9SByBTzrZHFbn6YXWGSu6BCUf/tLFbWvyAD45E5Fdbo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=A6GLDxzzJQnbMGSxQ8yEfLba+VpDr0GGtuOcSUCSLtuVknkKoh9sfaHOpYgh2Ammh
	 PrFoYEpj8j4dYlPZ8OSd17JQweOxiOXqtnGpaOiTDeKi7cYdfJSxCHKN6I5s+KSV43
	 Gdez2xNAHojWrVXggxX5M+a4FV3J+sWIwcLcuWkE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6F0F7F805E1; Wed, 10 Jan 2024 02:28:29 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4C5FFF805EA;
	Wed, 10 Jan 2024 02:28:29 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BBEE0F80568; Wed, 10 Jan 2024 02:28:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20700.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:201a::700])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5548AF80548
	for <alsa-devel@alsa-project.org>; Wed, 10 Jan 2024 02:28:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5548AF80548
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=GQMOZBUF
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RrUcs04g2xlnaoPY7WW/yzmhUqJhnEZJFS1bDscJycof0OoGJzV66F72XaHfN9svfIKiDET0xEdnQphmMhuECP1X8r99bXHhgSChDy2Ei1Uxot4o6gpm0bfk7DP4XcI+p/wHA5IR2A0fNNxH93KjTLPbfoc4/s1uUKpyac0ZpsB0rDQmDwSi10kzimgxIcATixo6Aoa15LnmorER+EGkq96JOBoRy4p+Ho3U6iLFNATwemRIEAktKd4pvpRT8R4C1b3WjNvgQL00rvvgY6hf/hOZ9Ddgm686bnUuu3kP8i+Af8gCU6my2al3XfHkyvJNvrwZ/KjoLGhfor4f0Rdekg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E/R2Ml0u4O3e+OPdQgyvOtF/61mvDytmz+g3HZauYYI=;
 b=QAnkwG1JEV11vjKyvrtpkJ7rl9aIJdHc5qtjz7dIHcPKs1oqszpG8doUqOsRMcdVXKoq1RBL3nJGLzk6QP5WXs5UgWChtMl080zmP+VFwIikvle7TUkd+5synFvdvUlX2C9E86qiSYFoisR+afUdEhqFytJeC1f50Xb+Hf7SDQNtdGjvW2hTSgiEIwfeueTovVRnmJMm5IHi9v0G+fbsLoY1nd6MWO1QWAbd5kKtp9IKYuT6KLGgq7CWul9ljE90prioBD+5Mr8YV/NUmG7ilt/soJ7uVHYgpTdfQjjAwQeS0yWBxvAmkJz1r4Sht5IjYZtvtYTLLZ3n/SYLtCdbCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E/R2Ml0u4O3e+OPdQgyvOtF/61mvDytmz+g3HZauYYI=;
 b=GQMOZBUFdaoOHe8hzNxzJI1dnT/zUheyg3QjuMZzUhkJr9mkHDwqZSlLnvKApNa7vtdCAB30brA7WQyBBPwIY8FnZjToXJffb3vh7Apj3fg7NBRPIzo4ei/C5SQHMbEiK3GkGzzOi6NmiGJntVeg1IuAuQD15Hug3zZ80slb64A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB8341.jpnprd01.prod.outlook.com
 (2603:1096:400:15c::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.17; Wed, 10 Jan
 2024 01:28:05 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::91d:1bfa:edc4:1c5b]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::91d:1bfa:edc4:1c5b%7]) with mapi id 15.20.7181.015; Wed, 10 Jan 2024
 01:28:05 +0000
Message-ID: <874jfmgeoq.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org
In-Reply-To: <877ckigepg.wl-kuninori.morimoto.gx@renesas.com>
References: <877ckigepg.wl-kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 2/6] ASoC: fsl: use devm_snd_soc_register_card()
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 10 Jan 2024 01:28:05 +0000
X-ClientProxiedBy: TYAPR01CA0156.jpnprd01.prod.outlook.com
 (2603:1096:404:7e::24) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB8341:EE_
X-MS-Office365-Filtering-Correlation-Id: acfb996e-711c-488f-c8a8-08dc117b6535
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Nk/AdrKFJlf3CJnd62iRMiQnsuWfw0r277IRmb15Yfg2y0boq2XMKBN/NdIE5NrAlWiey+DaOiaXorNMnImS0Vwen38cFGUaDSBwGi877RNrdi2/q3Dj0WIjGlF4AmGoe6t9KUNIN+7PlUGQrL68qukunddoygb8wbRSyj6yg/7+ybcjw1lJMyjUvkkf9his9DmonLg35/FvuBI1I4lgAJ6qYdrC8z7wjJKUP2yJ/v2vvc7wMrpAzYvYn0rvi1LwtFpMi8GaGsck6i6Za03fEnYh2BwvKUiu68Kh+r9SUkmGtoENL/K2h9zk72177O4svaZY9H3JzFU0g2UjDwRPK5Moa3c5tNgVlnbVzqNZ1C+fF/7ddxWXolS3U5anF9TsjqGT5A7gRNhFHYIgwnEV/qSQmrHZx/GyiX60f1nUKC8XQPbpLqsxPQ5vyhXqoVxkx+snmomhPdEJ/LdOcDyEami5ouvuiJrm9C/M2c4YllIF2LSlV6y3cPX7brYIGK0ujUbYaw26bzWDPdvEr8Yoz8IUTKAovE8Np6lrmu552uKxoT5+GLPw9VsYfuHRfawPfXnfIjANV7Banmh56bqc6QPMZ2Xeo55hJhMdXz3XCnITqSfpXKP7+iy/A1bW4yYl
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(346002)(396003)(39860400002)(136003)(376002)(230922051799003)(451199024)(1800799012)(64100799003)(186009)(38100700002)(38350700005)(36756003)(86362001)(83380400001)(2616005)(26005)(66946007)(110136005)(6506007)(6512007)(478600001)(52116002)(316002)(8936002)(8676002)(6486002)(66556008)(66476007)(2906002)(41300700001)(4326008)(5660300002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?1tSb/ozUJCrziBM0Fpjdc8mPay7OO9QQ4wX+AdXsKG3wwpOKrYbB5OEAVdOx?=
 =?us-ascii?Q?wpHPiJl/IldCM57w2DphPwuahwXx6NVdZQS7Ry3Q1GYxVQFpfdkpAAdngUYJ?=
 =?us-ascii?Q?IzVNSQ2L1juIuOupuE2rGwii8EleJ+1YoqowTCmW6JMsbaCmTdT/MbKJiBU2?=
 =?us-ascii?Q?GnSorCLvbtMC1Q/GDsIaHJje+yB1+DhN5NmJWDU5HkVYbgUsbaykEj29sHtQ?=
 =?us-ascii?Q?qo80rit6Eu/N16JF+Ol5GpSxPLz7mnCwT8esUB7lKIaoy9qqwBVMx8c5oLrp?=
 =?us-ascii?Q?ZW+3RIVwDmDQH1Co7Jk6rVIqPLDwlZCECGkdaFJlCI1zKOy9zWuBYC7D3EyQ?=
 =?us-ascii?Q?CamUwS2z4XIm50ThgPUZG9SN+NO30IshejV6Ioa3EDy0RPfSXTz07G+OkFaT?=
 =?us-ascii?Q?oZPzny4YNhT0iePUsSxMZEvywg6RkXNZ42qjPVv+ry49bOHIqV/DS8dOoh03?=
 =?us-ascii?Q?Db4PlveBut/M8nq4xZFF4EOrmNLp3LO8tU41AmNZmRWU+Zw4YwNaXz89k2mu?=
 =?us-ascii?Q?r1vOGkd+l6y/PpzzxEXvI+/dBhzBHsU48CKPpzb5yYiqYN7bSTGRuAxZbQfE?=
 =?us-ascii?Q?raTtU3l+wsgX2mPmZPRX5dze0SxRvefeBcJbGf08LrHKz/wni+18jxZbqUXJ?=
 =?us-ascii?Q?Ri410FLP88GfqpKPTcZ51jQhLnUupVBqbVhDAKHUhx7xgzVdJNE20QrHS7BL?=
 =?us-ascii?Q?3b2jT10LJOLpSpCwp1xHOODQd1ip+rIpvUy9FrdWQUKzf63tqTgTmuUPdRFu?=
 =?us-ascii?Q?v0DuQfZ9kEI9VLR5gGlMqXQkYT2wnNwRUX6Po5cPOSkt4oStoML0LFrg2Rx8?=
 =?us-ascii?Q?dUrHpqlhbljy/nIuz1GCHpVQRnCqIfaKv+x7q5l9yRJpP19lMwDGIVU1iprE?=
 =?us-ascii?Q?Qky+8o9XqDT0ywPEjW+OqUn7OxYP8AtmoOp/TJmSWwaNFO/ebLfgiWb/Wi7n?=
 =?us-ascii?Q?0rmXuk5eHuCPJ0fo0y5KY/KHQgLT516h/Q68cDY6Wn0tMi5T93BEsraRtsC5?=
 =?us-ascii?Q?eOF9aEdpbrOysCy6K4vKeiIK0iYwytW4Ots2b27JmaLdtQlsXt6sTuARnHEj?=
 =?us-ascii?Q?XAHf9MhVDpG90PTHnYgAuWbKW80oOMeCwrmZR+sMK7Bd9+deBds2hdAmgVjr?=
 =?us-ascii?Q?if+Qkl7JCnXmz4cVSEDFgwTEg2HQc39BvXLWWXbyAu2hl8LBjDjnrnsW5e+Q?=
 =?us-ascii?Q?jW+L8WEhu977c6D2mCWrxX8oMjd8zvh1q3qHbj5Hl1BMKf+vPtodXwV47OGe?=
 =?us-ascii?Q?kLQdjbGT4kRd/6oOftkWWhPaRuwRUJE0C8A5z3iI4R0efXp1JLc/oiCo35FX?=
 =?us-ascii?Q?vV1+GL0PhjhNqGrDz5lCYVEl1HMzRvwozEHZDXeX5i9x094OxLUM6QeA5CfD?=
 =?us-ascii?Q?D3t2jJk9S330OxYDTLLmeYl0mC24xOu/V46d1yPG+if5435e1CBaADuJDdbE?=
 =?us-ascii?Q?U/f1Ht9qeYPRGIwUcUlQ5EYp1+aEAyMmkNk3iETffRpYqBhOL9q8ufNdeZqz?=
 =?us-ascii?Q?PgcrbmvUQssnXOFVqmGCDosFgnkdJytM7XpvpLUzuVM7YOH0tX2JNURWz08O?=
 =?us-ascii?Q?sYdC/k0GMDr4YnHS4C3rIAckn9Yd9+/SeY+xyq7Q7vPNpbzySjnAMMRNg0WD?=
 =?us-ascii?Q?BXhraAfZ8BOgLKnwDOxvnm8=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 acfb996e-711c-488f-c8a8-08dc117b6535
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2024 01:28:05.7525
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 saV8EiOqkzLlQP2Ip16yVIivco9BPEA+BTSTIOK+Aa12CgUiLZzUBvLVACqYt6bD8V2xEPlrySxk+XNbDyhEYzkZ6UW8eaycfHPJoivX6tPE82JOWeze0gQyOkQbvrbz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB8341
Message-ID-Hash: YBWMFQWDF3XIXV5YNCZE6UTFXQI2TS7G
X-Message-ID-Hash: YBWMFQWDF3XIXV5YNCZE6UTFXQI2TS7G
X-MailFrom: kuninori.morimoto.gx@renesas.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YBWMFQWDF3XIXV5YNCZE6UTFXQI2TS7G/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Let's use devm_snd_soc_register_card() instead of snd_soc_register_card()
and ignore snd_soc_unregister_card()

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/fsl/eukrea-tlv320.c       | 8 +-------
 sound/soc/fsl/p1022_ds.c            | 3 +--
 sound/soc/fsl/p1022_rdk.c           | 3 +--
 sound/soc/fsl/pcm030-audio-fabric.c | 3 +--
 4 files changed, 4 insertions(+), 13 deletions(-)

diff --git a/sound/soc/fsl/eukrea-tlv320.c b/sound/soc/fsl/eukrea-tlv320.c
index 63f1f05da947..6be074ea0b3f 100644
--- a/sound/soc/fsl/eukrea-tlv320.c
+++ b/sound/soc/fsl/eukrea-tlv320.c
@@ -196,7 +196,7 @@ static int eukrea_tlv320_probe(struct platform_device *pdev)
 		}
 	}
 
-	ret = snd_soc_register_card(&eukrea_tlv320);
+	ret = devm_snd_soc_register_card(&pdev->dev, &eukrea_tlv320);
 err:
 	if (ret)
 		dev_err(&pdev->dev, "snd_soc_register_card failed (%d)\n", ret);
@@ -205,11 +205,6 @@ static int eukrea_tlv320_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static void eukrea_tlv320_remove(struct platform_device *pdev)
-{
-	snd_soc_unregister_card(&eukrea_tlv320);
-}
-
 static const struct of_device_id imx_tlv320_dt_ids[] = {
 	{ .compatible = "eukrea,asoc-tlv320"},
 	{ /* sentinel */ }
@@ -222,7 +217,6 @@ static struct platform_driver eukrea_tlv320_driver = {
 		.of_match_table = imx_tlv320_dt_ids,
 	},
 	.probe = eukrea_tlv320_probe,
-	.remove_new = eukrea_tlv320_remove,
 };
 
 module_platform_driver(eukrea_tlv320_driver);
diff --git a/sound/soc/fsl/p1022_ds.c b/sound/soc/fsl/p1022_ds.c
index 6f5eecf6d88c..da247dc705e0 100644
--- a/sound/soc/fsl/p1022_ds.c
+++ b/sound/soc/fsl/p1022_ds.c
@@ -374,7 +374,7 @@ static int p1022_ds_probe(struct platform_device *pdev)
 	mdata->card.dai_link = mdata->dai;
 
 	/* Register with ASoC */
-	ret = snd_soc_register_card(&mdata->card);
+	ret = devm_snd_soc_register_card(&pdev->dev, &mdata->card);
 	if (ret) {
 		dev_err(&pdev->dev, "could not register card\n");
 		goto error;
@@ -402,7 +402,6 @@ static void p1022_ds_remove(struct platform_device *pdev)
 	struct machine_data *mdata =
 		container_of(card, struct machine_data, card);
 
-	snd_soc_unregister_card(card);
 	kfree(mdata);
 }
 
diff --git a/sound/soc/fsl/p1022_rdk.c b/sound/soc/fsl/p1022_rdk.c
index 18d129c21648..67ae8a335fd1 100644
--- a/sound/soc/fsl/p1022_rdk.c
+++ b/sound/soc/fsl/p1022_rdk.c
@@ -325,7 +325,7 @@ static int p1022_rdk_probe(struct platform_device *pdev)
 	mdata->card.dai_link = mdata->dai;
 
 	/* Register with ASoC */
-	ret = snd_soc_register_card(&mdata->card);
+	ret = devm_snd_soc_register_card(&pdev->dev, &mdata->card);
 	if (ret) {
 		dev_err(&pdev->dev, "could not register card (ret=%i)\n", ret);
 		goto error;
@@ -351,7 +351,6 @@ static void p1022_rdk_remove(struct platform_device *pdev)
 	struct machine_data *mdata =
 		container_of(card, struct machine_data, card);
 
-	snd_soc_unregister_card(card);
 	kfree(mdata);
 }
 
diff --git a/sound/soc/fsl/pcm030-audio-fabric.c b/sound/soc/fsl/pcm030-audio-fabric.c
index 2bab0fc1de59..edef8ee8d8b0 100644
--- a/sound/soc/fsl/pcm030-audio-fabric.c
+++ b/sound/soc/fsl/pcm030-audio-fabric.c
@@ -97,7 +97,7 @@ static int pcm030_fabric_probe(struct platform_device *op)
 		platform_device_put(pdata->codec_device);
 	}
 
-	ret = snd_soc_register_card(card);
+	ret = devm_snd_soc_register_card(&op->dev, card);
 	if (ret) {
 		dev_err(&op->dev, "snd_soc_register_card() failed: %d\n", ret);
 		platform_device_unregister(pdata->codec_device);
@@ -112,7 +112,6 @@ static void pcm030_fabric_remove(struct platform_device *op)
 {
 	struct pcm030_audio_data *pdata = platform_get_drvdata(op);
 
-	snd_soc_unregister_card(pdata->card);
 	platform_device_unregister(pdata->codec_device);
 }
 
-- 
2.25.1

