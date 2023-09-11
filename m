Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BCD379B168
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Sep 2023 01:56:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 680AEE92;
	Tue, 12 Sep 2023 01:55:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 680AEE92
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694476576;
	bh=xY2Pfr+NFHw/NUDfaqt9qKDL+Wpasw6vimEJ+Vtc6n4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=LkZb2parQm8dmLjT8VA0yG1lAqwE51H6zHJ7O0ZybQ40vc9Vapav0njdhfp4xAYF2
	 DaY+lLe5obwRf2oZQAj8W/YNu/Iam38GbrfGitgic2aoFn+yfZX6Vc2QRd+J218aIa
	 vdeYyiE8xdHaQvIatJ78Fw4RqQpQjB5jPmohqWAk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 70573F80693; Tue, 12 Sep 2023 01:51:29 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1B661F80613;
	Tue, 12 Sep 2023 01:51:28 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 13C08F805A8; Tue, 12 Sep 2023 01:51:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20719.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::719])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 20C56F80579
	for <alsa-devel@alsa-project.org>; Tue, 12 Sep 2023 01:50:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 20C56F80579
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=kOEKqCXC
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L5jxD1BKrZ9/WAaZHFSE1nVg74S5ZXyGdEhLxchlObOmPzRf3aCmNdlwSWtA80u3XOcmGYzAcfymE25e1ogyefvzzqHwtC/YQTJ4/46cjaQy+mtHHphxh8xrzHA6vlFjWsflCXPJKvMHaQOxkLCA+Abd6FYsW+1fg55UiP1GK2URG5Oe0mYutfeU/h1lHGrEmbjFpwlZzIg39OAtoZv1n41RnrD/QBJnm6cqmQ6xlE84LkhN0M/a4z1nrLhyg9cHnciGvyu5iPPhHMsDLgaXRcpsx8HB/etJu/Hr4fO+nwvmIzxSTaRJql7Dr56TQb4dUYu5SyaAsmipwp/7yi5Mmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sCtDvXbzy4ziKLMu9vLX7kHKn3XUVPPphnL0Z9CMA8Q=;
 b=c5jYoevI3vZPdYysN8DZ6F+4jNB9QnsAN93t41XFsTTKPQQpY+M7pNugaOt/JlwPHgGRXknRelazr5KlX+HBLT3NDWPh6HykQ0yfFYex3w1GnKmy4PcgKsz6WWZNaqoiFSBd0quIONufFY3MIUEacp49bnb4l2WpH/K1cgvAzrtekXxRp+WLQWGpweuyPBg5wEOG5K6gyc3n9mmfa4vgSaSJbcFdiTqWaEMAj33Fn9ZXhD1CNDRb3yNAtnMvR/8LwDHFqTFs0iEgerV3xPAuqYFzLS8xNGz4Ux2avzEnzyZYEzX6TlD4uhbZYSlBzISUZOK2ftP4zOs4jPgKjFTYLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sCtDvXbzy4ziKLMu9vLX7kHKn3XUVPPphnL0Z9CMA8Q=;
 b=kOEKqCXCHt+DSipLmeXubuslx6dIMPTmaiOh5OItd+vh4dHiHy+ysnT3XFoR2IHEb5jCqyxsZRkhh3w4+1Bg9foKcQg6rMc8bcpgwTyE0hqhT3X8FCRmuOdULyL21nZnqBi7Gq/TudvubxYo8dxCBLCkazuCFZSAEo375akPuJA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OS3PR01MB9445.jpnprd01.prod.outlook.com (2603:1096:604:1ce::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.37; Mon, 11 Sep
 2023 23:50:01 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::8c08:d94c:8e54:9b5d]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::8c08:d94c:8e54:9b5d%6]) with mapi id 15.20.6768.036; Mon, 11 Sep 2023
 23:50:01 +0000
Message-ID: <87bke8qnh3.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>,
 YingKun Meng <mengyingkun@loongson.cn>
Cc: alsa-devel@alsa-project.org
Subject: [PATCH 29/54] ASoC: loongson: convert not to use asoc_xxx()
In-Reply-To: <87h6o0s275.wl-kuninori.morimoto.gx@renesas.com>
References: <87h6o0s275.wl-kuninori.morimoto.gx@renesas.com>
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 11 Sep 2023 23:50:01 +0000
X-ClientProxiedBy: TYXPR01CA0064.jpnprd01.prod.outlook.com
 (2603:1096:403:a::34) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|OS3PR01MB9445:EE_
X-MS-Office365-Filtering-Correlation-Id: dad37f04-14c0-4ae6-c883-08dbb321d060
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	yUmaqbj6aPuBHYGsBojWzEWm31a7AXTwpy7E+umc+7KGD8abAVnvfUsNVP9eo6784GTE/DYVAF8eT5B/ZHtQcIUtBtSElu0CD9KkxnSqo6Bx4ZFubIvisv4ZFGCJfBZc4aCTaNgb4j9uRQHEMco8NXtgw1zeyIBqEh6bb2HRwtoAbFnsIhUxbTSc+F2Qeu6qFC9cbzKVjyygpXYEpmPpFf+3oWwHQoxcja+jcYj41jfYzeWEupcUO993myhfJRo3TsckSa1Hsf8LycVYJhIUX6bClkU860YQV8LwRnGwLw9WHkYfyXiQVpmQE/5O1PJgvCUHHiiIHfaiQiH9E8LpaO5oqjSQXl+Huds76+W1cuqb9o/qy2ouWkDGyoqMAY8I4w7lVHQkBFTF8wEyJ/XuIqUiuTvP4jOwOWtHTE7vLj4+aBZ8sp0pzRWaxajPRUC5FUuzUbSPU5d+IZ5tc44lKCfpujGgXq2589mkvzLuB6Gy+gip7BZZDSsjpxCWuYYURHZJWCERCbxMRRxo6p7OR+a0Lw1lAv0i3Z1pe8/KyuWYKnbpJ/30wMMrt3yxxNQxjZu1Da01uwnw3sdln4ZQHCiVcVp9QP+FpPKAGTf67k1qjk9Ef0pxtdNlfTEjcK2DNRsd0RakW/GhPpeAKgpB6w==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(366004)(376002)(136003)(39860400002)(396003)(1800799009)(186009)(451199024)(83380400001)(66556008)(110136005)(38100700002)(36756003)(38350700002)(86362001)(316002)(66476007)(66946007)(8936002)(4326008)(8676002)(41300700001)(5660300002)(6506007)(6486002)(52116002)(6512007)(2906002)(478600001)(2616005)(26005)(21314003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?2drpi/Ahek6caM18Add8CuRV2zQADCL0Mhqw2gjnhRtFdMDZWuqinx8X4H9n?=
 =?us-ascii?Q?9/esq9QoMOyCE5tFxZHB2PdtJviHKn3Bz16dJBc3buuiyWxTldmc4JcpFJ7T?=
 =?us-ascii?Q?w1PYdACBpqqChAc5XXhOvnWcPSRCJwg4kDFn+huYL+Il3xWnKWGkCZDtwsSK?=
 =?us-ascii?Q?96Cgq/Z66IYchehwg8r1k43tmB+pfC5NcuU0i89d/+a9CYlsZBQ9T4yjlWjj?=
 =?us-ascii?Q?k5ZjlHLUG7CdvVrePjTDRchKmFmO/cz89ycFfh03s5X/wba7l8KRUiaQCmsv?=
 =?us-ascii?Q?WZzfDhzztgBNGtej+O2ArI4kUPFuVz98HiUE68yotg00omHSOixk+gfMk9I+?=
 =?us-ascii?Q?4mOWt3wmcTCAW+fIMQkGfIJd+Ehl9CYRhu0fURiI+WYrwOCjVlC9z03Xsigg?=
 =?us-ascii?Q?Je7OTxDVCdhxrPXUKlZOYXzI423Bxst6nQlfoy6JdHzPQTMWv2p+wX4JF2jp?=
 =?us-ascii?Q?8oeulBh43Ji44Z7lOkfgT+vnb7YC1B7ymM4d5rj5C90tyyw7Nee5dNIkuR20?=
 =?us-ascii?Q?wnYLfxzlez95k+HJBnvClKxdO5nfntoUfH3/WnpPmlNp4KkinWIKkjdsj61Y?=
 =?us-ascii?Q?4MHI/XvVWg86T3CEKZ5TcZVdt20/7ULI7BIsobPAqoXK9FE8EIBo+TwFOQLv?=
 =?us-ascii?Q?GzssfUz80J6kAuHjEOIE+AGe7m226U4JPjprtUb58yE53HppMlmCQR43kTfA?=
 =?us-ascii?Q?GbaYe4T1fVeb+fI1W+A9d+ehSFpy0X94pEzdv2ZksTY25AJkMe580/lztcBp?=
 =?us-ascii?Q?Pq9RzjHic9xuihIn9KFsYY6jykBDy06Z7X1nkJTetp0S90Wc1Eod/bsJ/xQb?=
 =?us-ascii?Q?2QGS9xkI1T/YXsS6Oe99jrN7EXMJNYGDi6XjfImauFg+ZbxH5tq0dB+x9kyt?=
 =?us-ascii?Q?/WHxFoRsrvKrgo0iNbFrsLjUygOY0m8vrpLXL52yj1qF1vqMu+CPD4bOfXra?=
 =?us-ascii?Q?OixwbZCHK9/BZkdSYfHWRRgZ8SsNykBwBgIMDpidaRJ7DJk8/Zab8doz2TZf?=
 =?us-ascii?Q?9FtV0j8QYuvjUEa2q8jl7QSUljuC5guLKyYWjdkfRJuksRq8kGR1DlghwaOr?=
 =?us-ascii?Q?j1sxKxfzGaVIdnPursnFiJDdUlo/PFbA5kkv5HomfQGhv+ys6hOBqajh4VzR?=
 =?us-ascii?Q?mmpMFy7Sppy7SNUB8+LUSGBM5R0vqvNuL75Gri3ImA19Poze8fNxOM8GdrxP?=
 =?us-ascii?Q?+NLrT+js39Cw0k5bFP00G39gU5nxUJLFGES3943bxOSFNN42H2SIpuRhVqce?=
 =?us-ascii?Q?ykuXGxIuMGXHer7sthH0X94ZMFBBCe4W76OfcOYBbwUCo9pg1S3uQxdHnDXP?=
 =?us-ascii?Q?m1/J+f65WtBcixfKJRFz8YMEnqeHiEQaLnGJmGj+M7CeMdhw9XgIYYK0L4U3?=
 =?us-ascii?Q?SAW08SLATPz4QpmPxjLM7XFeJFRCK/PSYG1e0ttbJ6Lp+4YG5bYzkFKm3mBl?=
 =?us-ascii?Q?QxRH/AHhjPJnew/cuFq44tLynIjziEH/cBlQuycPdWBsXV9M5bj/cVvDELWh?=
 =?us-ascii?Q?Z5TteA+aV8rGUaWagfmTQ6HKHvY/tiP83ddJwZq3oqwpAdA0b3HtcfK8+mVS?=
 =?us-ascii?Q?wtGYzLibVBN0CnrWzHz8CYr73XUOSgXU0oAR4FYm/Ic8PpfMSyv1kbfrZoyp?=
 =?us-ascii?Q?rl+3OVAe/psD4z9NBDD9EHA=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 dad37f04-14c0-4ae6-c883-08dbb321d060
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2023 23:50:01.6569
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 NNaQWu1ek/Y3x+QweGb1ANHS+GaJhYPngfpHlXswPcHR4eWkHLU3Iof/Gx3NAS5pJL+zm3STMLOz200WjqfjT1J2OPw1tU8a62YQ48vI0h1TpEcAORXxTu3ffiHpuDo/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB9445
Message-ID-Hash: 5IP2X6LGT46772BW4KV2UBL5DTSXULZ3
X-Message-ID-Hash: 5IP2X6LGT46772BW4KV2UBL5DTSXULZ3
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
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5IP2X6LGT46772BW4KV2UBL5DTSXULZ3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

ASoC is now unified asoc_xxx() into snd_soc_xxx().
This patch convert asoc_xxx() to snd_soc_xxx().

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/loongson/loongson_card.c | 4 ++--
 sound/soc/loongson/loongson_dma.c  | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/loongson/loongson_card.c b/sound/soc/loongson/loongson_card.c
index 406ee8db1a3c5..e8432d466f60f 100644
--- a/sound/soc/loongson/loongson_card.c
+++ b/sound/soc/loongson/loongson_card.c
@@ -24,8 +24,8 @@ static int loongson_card_hw_params(struct snd_pcm_substream *substream,
 				   struct snd_pcm_hw_params *params)
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
-	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
-	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
+	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
 	struct loongson_card_data *ls_card = snd_soc_card_get_drvdata(rtd->card);
 	int ret, mclk;
 
diff --git a/sound/soc/loongson/loongson_dma.c b/sound/soc/loongson/loongson_dma.c
index 65b6719e61c56..8090662e8ff24 100644
--- a/sound/soc/loongson/loongson_dma.c
+++ b/sound/soc/loongson/loongson_dma.c
@@ -267,7 +267,7 @@ static int loongson_pcm_open(struct snd_soc_component *component,
 		goto pos_err;
 	}
 
-	dma_data = snd_soc_dai_get_dma_data(asoc_rtd_to_cpu(rtd, 0), substream);
+	dma_data = snd_soc_dai_get_dma_data(snd_soc_rtd_to_cpu(rtd, 0), substream);
 	prtd->dma_data = dma_data;
 
 	substream->runtime->private_data = prtd;
@@ -321,7 +321,7 @@ static int loongson_pcm_new(struct snd_soc_component *component,
 		if (!substream)
 			continue;
 
-		dma_data = snd_soc_dai_get_dma_data(asoc_rtd_to_cpu(rtd, 0),
+		dma_data = snd_soc_dai_get_dma_data(snd_soc_rtd_to_cpu(rtd, 0),
 						    substream);
 		ret = devm_request_irq(card->dev, dma_data->irq,
 				       loongson_pcm_dma_irq,
-- 
2.25.1

