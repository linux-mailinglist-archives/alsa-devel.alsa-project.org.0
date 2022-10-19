Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A393B60372F
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Oct 2022 02:38:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2BC15A81E;
	Wed, 19 Oct 2022 02:38:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2BC15A81E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666139930;
	bh=Z5ypgF4kyn/zGFL+XOSNJmsGz35Cdw+1X9hMiCpNKIg=;
	h=From:Subject:To:In-Reply-To:References:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tqNT5iDT8JMBtCNpKboBUus/i26/W4fMhnjFKIGW8OtbV2/4zd3J1wHuudraBoVtk
	 KMBCNM5VPGdLnwI9IJvQtvSdqRmwHc4jH2YgckBI8xUaNOjzbps9G9Xeuv+Eb03U5W
	 DP0B+qK4iWsMzEd66j7nt/KrWKUvS8Oz4v2R3SAs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 22DA5F804DF;
	Wed, 19 Oct 2022 02:37:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AC244F80559; Wed, 19 Oct 2022 02:37:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on2100.outbound.protection.outlook.com [40.107.114.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 20EA4F80568
 for <alsa-devel@alsa-project.org>; Wed, 19 Oct 2022 02:37:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 20EA4F80568
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com
 header.b="aKaV0Bn2"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IsoHVkQVoHjD9VvklO/jpGHIQ0e3frmKmYgP1dNIESv+u4Fo4C1HhAzN0UsNT3CuSVk+rMW8b1t2sCnqFGzUU0yR3zabJLhybyYM2d25HJdVTezFa9Ufzd4bLx3CajQFKKLZnE6aElafJ76MuvFqRkZQfxdUAku0Y7TcNMr6nvbWMntxjNpUf2ozRVXbyJn196xnOH4w2fsJjM4z8BiaNKOovw+CVo5a+apgm1UZu3p+iH1/Gg/48hDZHjhmDuTxTEkDhJ5XNKfPYxGpm3ma4B9q4RJdR+eK3aZfvCy2NwAO0WmDSu3lUo8yvfstk0Rxq3nT+tnBenHy2OfoDhoEhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P1dcD58IHI2bVXrfEPybspbiXOjQvm4c89L2cuOJrkw=;
 b=FcSPiLspt5Ywp7j1id1B3YpeDzZNcp9t6PJVax2wLCOcqYmSvXG4SeVbE7+J2kC4OImn32FU1dY1KjwVEbVqm4IL74I+P0wb+cJPbbza2TkkSF1KBRep0lDeDYGjIRr8s8J8oeeB644yFHuW4uRZkIn92XGVgSjiz/m4WalmseeIScSmda2GwVPqG6GwmHKLx+JOtOMHLXpkE1+WaEossksZvkkaee2WWmKHQBgsnfuhkmof1a4LuTNAIgrL5YVcq/CAqysjiBC7pwtZSBnsJaMctQ5MJTeiLvJB++wGRiMn9qoi7I9tcWqIfS/j1du6L9pBm3H5N7reekKAt5j3HQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P1dcD58IHI2bVXrfEPybspbiXOjQvm4c89L2cuOJrkw=;
 b=aKaV0Bn2GittbOfhkp1ce+bjRxyoH0s0Kvz2AA/yJ2WSReDRZo4GfLZglbiExLv14PszngDsbzRHkVi43azpCU7ZIkGld6aRJOGQi2wj7Vd/MiwXmnsd5pphqcUnSiGhr/+3AykStQ4M9UGYOa6zEfN9vfNp+25+vx2QcMOdmGc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYCPR01MB10412.jpnprd01.prod.outlook.com (2603:1096:400:244::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.26; Wed, 19 Oct
 2022 00:37:00 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::4cba:2bd5:dfd4:f3cf]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::4cba:2bd5:dfd4:f3cf%5]) with mapi id 15.20.5723.034; Wed, 19 Oct 2022
 00:37:00 +0000
Message-ID: <871qr4tzro.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 07/11] ASoC: soc-dapm.c: cleanup snd_soc_dapm_new_dai()
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
In-Reply-To: <87bkq8tzu1.wl-kuninori.morimoto.gx@renesas.com>
References: <87bkq8tzu1.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 19 Oct 2022 00:37:00 +0000
X-ClientProxiedBy: TY2PR01CA0024.jpnprd01.prod.outlook.com
 (2603:1096:404:a::36) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYCPR01MB10412:EE_
X-MS-Office365-Filtering-Correlation-Id: 928b5007-fe99-46d4-59ba-08dab16a08f8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 723CV8R9tAqTr38omdJTX95kBsjOy4dndTrrpKM36cqUW0SzF2AYPg0eaG01EhSc7Kywt1odW5OQXk/qAf7Mu9+VCVLZnASwyx4Ywni0zkDXaU41G50q3FUHLtOjHR1ZO6/66JdV3sbXYcUoaCRomI/tkeg3Ycfkj960xcf2GXop+lxjRNbVw0vg+tfYBYTDZt5sn3R/9hUns+1V4do8geb8YaE6j+mI7OuEChjkmGi26sSWGCgQIIpDb1V3k/4aDqXlppyGmTg5XXURJdLhnWF24whXwY2bFwamp6LV2P7kyh1D9DuQSsnxoclB0lyyJAWXj0B58nF61jOOEnOjBWT4vy/u5TE031t1RyosokZnqzhlAdsuVNv7w36BmVpjrPtkEzXzl99DjfKooMQDL7M6qmVXa311n0rbH9aWUniWgRQO1PuplbrxVSbk0HIHBmypCogYpKAqQC/6m68iK/coKwy6+9MHOcgPY0pAjZ+33myDUO1N1D2shbgUV1fVCVRRm+8PreYy+ZG583zArJUAoA9omCKCW+/aAigHmF/3gPi5tUwCZ1FE33QbebS/ZNzevEyXmOGAMfjRfLCeu0ZYuCIZ8y2PMqpoGQNDw1MkWKrDtU8tNSjWzX4Jm2JCGmJpiDivOyPNBFb8PV1TXAqZsBX9PK8z+rq1yKyV0vUPViWgeG0ZLA6TV15svLOOtokk138pdMijSkutFz/+GP0DaU15tbDJb1v/YNEtqdIyeJylWghBTYRhfAgkhLqckrDhkriWQVE/4YUgRtzeZQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB8426.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(39860400002)(396003)(366004)(136003)(376002)(451199015)(66556008)(8676002)(316002)(66476007)(6916009)(41300700001)(478600001)(4326008)(26005)(52116002)(6506007)(6512007)(186003)(2616005)(5660300002)(6486002)(2906002)(8936002)(36756003)(83380400001)(38100700002)(66946007)(38350700002)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?VEIpZnPm/gBmUNy57Ac00AJpUkqrrhMOXuocQY7WrssnTuUbSDRox/Pxaqko?=
 =?us-ascii?Q?KtbTFZi5Ww3n/3RVLEYgIh0xHtL21GX/RJWAqn1IOL2Be+xOT1LyQ2/Tvz5h?=
 =?us-ascii?Q?Ecfxxt6ZJwV3flV7VyMOubtoNwlV3hBWraigZOqPmCzdxi87HhLg0AUwcvtH?=
 =?us-ascii?Q?cKyEiQLk5fihWvzidUd1UKrquktZDwBLn7NCqPEit8r/GIHcX5AVr9n9TDXb?=
 =?us-ascii?Q?sFlsH2279MAbf1l+bfNtTantkC2S7UGJ/5v9wRhX4x4Zz8JaJNEXMr1yhmwl?=
 =?us-ascii?Q?K9j2rOWHF8ddyJzqzZVE8wZ5nU36efJTGq3TSByz8sr7JlPIiaAKVfEHDwX3?=
 =?us-ascii?Q?B/NBoI16pah5S2gQl5PcbtzePQnZwdT+eT2xuUJ8Yrf7kSGtmYRTz8U0zPlC?=
 =?us-ascii?Q?0bzTZIojz45HX6qvBMa+QwZHHSc86vnSCTJyFg4b92jsFR75TeK2yzLfQaDj?=
 =?us-ascii?Q?KLXKZlVzOQ2CRIgPGswf/bbVx1GyWSjZREDoXgpj0fNKnL4OZZ4uQJwKWnn/?=
 =?us-ascii?Q?mA0Veiyq7nr9XKkeqjeond7t0iEN+Oy/INYo42UmoXTY1YImL3XvWAwJuaXL?=
 =?us-ascii?Q?OXwDx1Yf0BzL2V6gCd954Y36ReVPz0kgRm4z7phq1vnP0P7hDSpUbUcluQ8m?=
 =?us-ascii?Q?1l3FrPiO4HX1jpsWDZHFce9MecqIgrntFK2re6GrWvyd/dtgf6qlxU1Nlahe?=
 =?us-ascii?Q?t/FIB3nDR1yxYdya/5vKOx14nOs4ziAe+O3mpciz0bgMMonQ11arr80z/iM+?=
 =?us-ascii?Q?6cU5Q3EDbCCGCSwRA/i8bTpmp+GQsuCJ4OOPIipse7D7c98+47XunwKyDwjT?=
 =?us-ascii?Q?sg90SUcWupv7tOjNR4i/yg1XEO72UOeumjZZNmBek5K0dHzm3l/4CaUswJ8n?=
 =?us-ascii?Q?S5/r/rqTFu2GnoPhkrhAsM2ogT2S4tFIxow2qWKI1kbL16mRkk1WKJlnewUI?=
 =?us-ascii?Q?PHwAr1tlfQ7BUiZgbjnNFgvmrg3xh1Hw+DeJH6Jjl94TB4p5ND+tXNytFmf0?=
 =?us-ascii?Q?X4UMouFB/+q90cfYutiomhgp1vr3PBHKQ9AUOPWW/ZasOCl8tz17M9XCVlsx?=
 =?us-ascii?Q?pRIklEUuSPpyVoivH/EgvZwdOPCgQyGCfsCopZsr62FNsxDcZ5yULN0zGk2g?=
 =?us-ascii?Q?zOyaBTyYc1SYEu9PdhBep07t4aAUchcXEK7Xsj3i3m4eTrLDlmmWiKHAtma4?=
 =?us-ascii?Q?zXz5YRkk9idA6YkZ6zssgtrSz9v8zA1iuNXkDbhCGaFvBjm+ydDYuFjAZZwF?=
 =?us-ascii?Q?B++gUpgWJ8wUnNtWzsmCenb1bFHrb8sLRTH5VVlR5aSOEs9kTjVZKMpgVIRm?=
 =?us-ascii?Q?hRHzf5r1kQgvCJlQKj+zZoB4wE6UY0b1mc3GApl1NkSvcwbuiacQSLkvJTdd?=
 =?us-ascii?Q?PVHv2UIk1uYt9oy3C+UuA8XCRAt2GVjIjNWk3lI9cqhLS8fs+azcXxleKHkk?=
 =?us-ascii?Q?/3UeKt6Gx9H2DfyIJ5JJCD8BdhOc1WnlYrWmk2vv4oZ43BDhTZqfx/mkDZvf?=
 =?us-ascii?Q?4seuIqUZvZk1NUWH2khVYLqDskSsJtoWkdJnzLS6fKhjXvcLiW3qHSbbH9zM?=
 =?us-ascii?Q?rNVkGmFqe2dRv/xjN0ALOMM3CUr5exIwJO6LQw2dUtLVpmHKYYVj3fTQQpfy?=
 =?us-ascii?Q?EhN053c4GBowChy09VeQfuc=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 928b5007-fe99-46d4-59ba-08dab16a08f8
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2022 00:37:00.2739 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qhQzALuVYKVGQd7BgENGdhhXxhqCfadjbmRq5/RgrOcb2P/hDuMFDJxCrNUA+hxsZlHH6sZeGYgaPJBlTON8Qq9YCD4h00khb0tyqnBTUH2N7CdPkgDx8Ka/x3yU/AKi
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB10412
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

snd_soc_dapm_new_dai() setups local variable "template" at (X) and (Y),
which is used at (Z). But these are difficult to read.

	static struct snd_soc_dapm_widget * snd_soc_dapm_new_dai()
	{
		...

 ^		template.reg = ...
 |		template.id = ...
(X)		template.name = ...
 |		template.event = ...
 |		template.event_flags = ...
 v		template.kcontrol_news = ...

		if (rtd->dai_link->num_params > 1) {
			...
 ^			template.num_kcontrols = ...
(Y)			template.kcontrol_news = ...
 v			...
		}

		...
(Z)		w = snd_soc_dapm_new_control_unlocked(..., &template);

	}

And this function has error message, but not for all cases.
This patch (1) setups "template" in one place, and indicate error message
for all cases. This patch cleanup the code, but nothing changed for
meaning.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/soc-dapm.c | 56 ++++++++++++++++++++++----------------------
 1 file changed, 28 insertions(+), 28 deletions(-)

diff --git a/sound/soc/soc-dapm.c b/sound/soc/soc-dapm.c
index 7a170e16d34e..ddaa079cfe5c 100644
--- a/sound/soc/soc-dapm.c
+++ b/sound/soc/soc-dapm.c
@@ -4131,56 +4131,53 @@ snd_soc_dapm_new_dai(struct snd_soc_card *card,
 	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
 	struct snd_soc_dapm_widget template;
 	struct snd_soc_dapm_widget *w;
+	const struct snd_kcontrol_new *kcontrol_news;
+	int num_kcontrols;
 	const char **w_param_text;
 	unsigned long private_value = 0;
 	char *link_name;
-	int ret;
+	int ret = -ENOMEM;
 
 	link_name = devm_kasprintf(card->dev, GFP_KERNEL, "%s-%s",
 				   rtd->dai_link->name, id);
 	if (!link_name)
-		return ERR_PTR(-ENOMEM);
-
-	memset(&template, 0, sizeof(template));
-	template.reg = SND_SOC_NOPM;
-	template.id = snd_soc_dapm_dai_link;
-	template.name = link_name;
-	template.event = snd_soc_dai_link_event;
-	template.event_flags = SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMU |
-		SND_SOC_DAPM_PRE_PMD | SND_SOC_DAPM_POST_PMD;
-	template.kcontrol_news = NULL;
+		goto name_fail;
 
 	/* allocate memory for control, only in case of multiple configs */
+	w_param_text	= NULL;
+	kcontrol_news	= NULL;
+	num_kcontrols	= 0;
 	if (rtd->dai_link->num_params > 1) {
 		w_param_text = devm_kcalloc(card->dev,
 					    rtd->dai_link->num_params,
 					    sizeof(char *), GFP_KERNEL);
-		if (!w_param_text) {
-			ret = -ENOMEM;
+		if (!w_param_text)
 			goto param_fail;
-		}
 
-		template.num_kcontrols = 1;
-		template.kcontrol_news =
-					snd_soc_dapm_alloc_kcontrol(card,
-						link_name,
-						rtd->dai_link->params,
-						rtd->dai_link->num_params,
-						w_param_text, &private_value);
-		if (!template.kcontrol_news) {
-			ret = -ENOMEM;
+		num_kcontrols = 1;
+		kcontrol_news = snd_soc_dapm_alloc_kcontrol(card, link_name,
+							    rtd->dai_link->params,
+							    rtd->dai_link->num_params,
+							    w_param_text, &private_value);
+		if (!kcontrol_news)
 			goto param_fail;
-		}
-	} else {
-		w_param_text = NULL;
 	}
+
+	memset(&template, 0, sizeof(template));
+	template.reg		= SND_SOC_NOPM;
+	template.id		= snd_soc_dapm_dai_link;
+	template.name		= link_name;
+	template.event		= snd_soc_dai_link_event;
+	template.event_flags	= SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMU |
+				  SND_SOC_DAPM_PRE_PMD | SND_SOC_DAPM_POST_PMD;
+	template.kcontrol_news	= kcontrol_news;
+	template.num_kcontrols	= num_kcontrols;
+
 	dev_dbg(card->dev, "ASoC: adding %s widget\n", link_name);
 
 	w = snd_soc_dapm_new_control_unlocked(&card->dapm, &template);
 	if (IS_ERR(w)) {
 		ret = PTR_ERR(w);
-		dev_err(rtd->dev, "ASoC: Failed to create %s widget: %d\n",
-			link_name, ret);
 		goto outfree_kcontrol_news;
 	}
 
@@ -4194,6 +4191,9 @@ snd_soc_dapm_new_dai(struct snd_soc_card *card,
 				   rtd->dai_link->num_params, w_param_text);
 param_fail:
 	devm_kfree(card->dev, link_name);
+name_fail:
+	dev_err(rtd->dev, "ASoC: Failed to create %s-%s widget: %d\n",
+		rtd->dai_link->name, id, ret);
 	return ERR_PTR(ret);
 }
 
-- 
2.25.1

