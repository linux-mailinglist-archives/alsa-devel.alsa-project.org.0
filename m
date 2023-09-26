Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AE62F7AE5E0
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Sep 2023 08:28:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 287FDEF2;
	Tue, 26 Sep 2023 08:27:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 287FDEF2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695709725;
	bh=VK/7lx5CD3PCBo3eHOOAg043eX85koVKwbclAlsLWio=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=CEgTvXrXc9dFjZ8jjCfkp7NUatT73iBJuqs+EDlZb9v5FFN8EvnCM1ROh7RtxRAde
	 sGOoYQdflSlC8fCfQPhvI8bOLoJldkhQpd//fXbiBO327W7q70Ps9DYMzvwydr36Sk
	 jv3cmkyhWGoK9yOgIuWFaSJW/QN/ZjtMxAS3rMtc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B6890F80659; Tue, 26 Sep 2023 08:23:52 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C1EB9F80637;
	Tue, 26 Sep 2023 08:23:51 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B9C32F805CB; Tue, 26 Sep 2023 08:23:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on20722.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:7010::722])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id AFC66F805A8
	for <alsa-devel@alsa-project.org>; Tue, 26 Sep 2023 08:23:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AFC66F805A8
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=Qf/7vCHk
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Px6cTSHLU+RGow7QS/szapX6TEw55Sia3a8BBupTUd1AKFhMYTLmpSLCJ6QT+/l32LOZd2JmhRKNxGmdL8q5BWLW4KF4twqhNEgzVkqaHWuEtG9TQDH3WJPwbvCFrZVWKoGuMiRe3XFHK+dG4ZmHaTf3DyUTaosa56tYdkJL2bNiEJxqS+TrhsE6UHjW7cR6UsU+62R/LG5fLtnu7a9p9QEvWaStWiyZeSEmW+FY3eWRrdt0y+1M+G9qfXVCZ33+L6XBk03EsZGYnMTb+pDl6hHk0UFAMLbpSO9Rdo/Sa9TKpxPy2JFILIxgWUJ6d1Ur3G423n3vrTxbiP+30Wm9MA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d8uvhqIMueOFs3ABrCGKlChMaIP73x7Ow1e1bk+2mg0=;
 b=BZ+prr+k61l2dL1eqav6pr2wvlpYQX9iZFbdXC+x1vUqVAeA0UTOkVD06dAyzRKqcE11j/62LghjlB7D9QeCpeC1j9dkFkhRVppmYKSK+p/kPeXUzhVAUWTDoaQcfhy0w1IUJusfv6m4a0Wy1ejR6A6/d+Cmb2G0+jkXqqHge8j1IOpYLiyTikn4gkgK9TsUcJUq6DAlzik7jb+rXaLz/2UK+N3BVlysGonHmJeBUtuQouCC9dLb+Wt8MKNT58m8uNvxuyaS0m8OMyKp83qJT9RYIxMmYbu4/zNUJJbDZcLAnv3xzGmGfsowUN0P/QFsCngZtA1ncpPcnULSvmNdSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d8uvhqIMueOFs3ABrCGKlChMaIP73x7Ow1e1bk+2mg0=;
 b=Qf/7vCHkE4BZOB17Lewl4WTJTN63UptquCd3AVmR32BVCdA4uVOwjvW5toXZY8bL8pP3PxQr5fCVCpiqkqhQBcq71N+dmEa1N80teNCNn6iI3LzW8nDnzWFLavbumbPSvwd5d/o5bHwRV2Ac6Fb4IQhmCXmzfoabTo47GADjMLs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYCPR01MB6175.jpnprd01.prod.outlook.com (2603:1096:400:4b::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Tue, 26 Sep
 2023 06:23:25 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::d2a3:45df:a180:595c]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::d2a3:45df:a180:595c%6]) with mapi id 15.20.6813.027; Tue, 26 Sep 2023
 06:23:25 +0000
Message-ID: <878r8th2qs.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>,
 YingKun Meng <mengyingkun@loongson.cn>
Cc: alsa-devel@alsa-project.org
Subject: [PATCH v2 29/54] ASoC: loongson: convert not to use asoc_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
In-Reply-To: <87edilihhg.wl-kuninori.morimoto.gx@renesas.com>
References: <87edilihhg.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 26 Sep 2023 06:23:24 +0000
X-ClientProxiedBy: TYCP286CA0141.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:31b::6) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYCPR01MB6175:EE_
X-MS-Office365-Filtering-Correlation-Id: f39c8e0a-6e8d-4e49-b4b7-08dbbe5916ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ak5nFjaN2TNlKckKiF+73h3/LFKJ+8k48O/9RA/D8ycbcb8UhbDJOwfj8Syo6d329S2akQuV3BQ2YXw/3E8rZFt5mN2GEmm8Aa8ggaz/HgOBP9D3ZhPyjzrgzcdjvAbODL+TAhkcRMWCr7MrKuJZvs9A6AQmf7dRSIg74JgLclMJGae4YBPxuaQtEhBIObBVq1ZnpjI6VpRtVFxgtXoyn535A4DA7zEgVQP7auX7p2zid/CotNxEbyRNRtpTB98G/YuPNPY/GYUG3TdstrA0kiHBdyNmeN8DEx6rM+Ufcq42pr3Czp1gQ9O7M5DuSdVoPXjuR9G/k7lnNMoBC7376MFbAjjQrRww6Ck70y9TQ24xaPusS389dEuhdnOimYdmeXAA8G9TpcRlt06M7BaP826BJrXSDWhSxp3S8s/WZBJYRzr9sy1MDDFJMwi4K0tQkFxRgFUDMkOmhVo1UIfrmnjwMJUpBQ1ZW4cyw5MXuMOuohJuv/8NA4HVuon8+qdnmL8TK1GF2kCRc7fbbbiK8MEvcHaTJGgUd3meDWynCxXyr1qsBZkRlJj78+i4YKmw9CI7UQXfbU6Y/YcFhcAVj9cgz5m4J0H7J6oWaWPUTc2Lm6B+Yvv4Yzi08bTJ5IGL3KjgywS+4ifgr8CIyqcjng==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(396003)(366004)(346002)(136003)(39860400002)(230922051799003)(1800799009)(186009)(451199024)(6506007)(6512007)(52116002)(26005)(478600001)(66476007)(66556008)(66946007)(86362001)(2616005)(110136005)(6486002)(38100700002)(38350700002)(83380400001)(2906002)(8936002)(8676002)(36756003)(4326008)(5660300002)(316002)(41300700001)(21314003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?SUwkPzQCxC+0XFwrPH2krDde23ucpuo2PCF5fczsc0MYM/dXaCUC26IFVzxK?=
 =?us-ascii?Q?wFXCLdBnSY/VdjLHc8o27lVwD26C0CKo/snwILWafaRmflHuw6D4IFbAHOp/?=
 =?us-ascii?Q?xPtUO1uyMaFOtWew9lLdlZbfd1AouLuimqj/9cVRCD5qp6dYEmkf1gKhApL6?=
 =?us-ascii?Q?Wu3P/6kpT2PE6EtD79eb7lRICHnv1u3KK02njofEvo0FebS86a+IQmXsGCZ2?=
 =?us-ascii?Q?Xw4XnULUPshs8vdpfCWep1n73/SrOjV8bQv2A6GdojM/EJHKTy9VPAj+mvEl?=
 =?us-ascii?Q?N94BM79Ss23LOEDyfnOucehzPQXzYoDVY9Oe4KZVwOmAJ8UFn10DLwo34uJ4?=
 =?us-ascii?Q?0Yvs1Z+bQzqTzuXktCa4Z8JJPHBz9157WljaY0ZtXbTgcKp39FWjzUYVwRfL?=
 =?us-ascii?Q?VRRCIgXoNEHMEM+fr99APzUU9vjF0LZD4KGYSpKZxs5w8D4XskPk5D/YWaVZ?=
 =?us-ascii?Q?GzoAqTTlZDzjVuvqCRNehmNBavaXDPvZD1L6gkVWLC0/fcydhZdiXJWbDjyz?=
 =?us-ascii?Q?jGyfVXJLI16jAsdfd4qQHndkYODZrhi33nMMQAaMVit3cb8vggLfP194CFCv?=
 =?us-ascii?Q?Yp+GeXyHs6DC8AWYAdlxGmsOAd659oBVRvSuw9v7VwWrOywlkx2IVyLdtKOp?=
 =?us-ascii?Q?6CzlkRIBsBV6PMN1FytTtnOS/mNAe7/fpVPRNGfYuOIF+UcZYNbUbD6B+z6/?=
 =?us-ascii?Q?sSVyIffo4cCKl/1V/8JVSJTHELMChL+p+3doNZcHtY7pHkkA04b+Ad3asHU1?=
 =?us-ascii?Q?B6LABtHn0lvPOmo8jEkDCfvZ54ptIQxI2EeWXYikTkw+3Intc2SeHS5v05qp?=
 =?us-ascii?Q?oY6Owgo7y5NHxefFlbSkFCl5ncgYeZkKhWJcorq+tAcdbHefdtCgRFlQ4p6n?=
 =?us-ascii?Q?XacrnMuBji1h5hx9bNPw7/hJzF0WN5yD2IPXFg7Z77miqUncLB/lJvkmLECE?=
 =?us-ascii?Q?BJBGlUMIrVmNZ499NI/Cs712fL/U27A4oJ1VVD4LPDNW9mTwzi6AA6x2r/Bd?=
 =?us-ascii?Q?5j76sv2r0WRFvOu+TJgxEyftrEeU80JPaQsFTe3tpH0VrbRoT96+YZnYNcou?=
 =?us-ascii?Q?8vPC13lmjRZwHO3M5TKcsQHNVP9Hw736kMXt9acgPzS5KY5A4wOGV3Rs2fRd?=
 =?us-ascii?Q?RNYHWJ6XZ4ZXRZne6yNst2geqvvoAS1JgD1gmAwUKG7gYLIX+PS2yTBdsE5x?=
 =?us-ascii?Q?Ii7Sm1G1+jT8s0CHluvijMOVS3V2JeOpZ72kaUrEtCpHA349v9Jzi9Z/Ri1W?=
 =?us-ascii?Q?lnupRkJwJSykfMAprxiyCU7U4Itpw/8Z01pSX7c02I0gz/EoYA83UQDF2Dr3?=
 =?us-ascii?Q?kGJBo5cMDIwq2v+lqF8PIvqk+HqNvGytJ+EY4O+ZqsyUytVVIAgZdR9byEz0?=
 =?us-ascii?Q?qGRPWjI2wBMLoaGEg048tpdfLi/ACNlpK7ATI7+czNlHoncS9SdYiHEMwlXO?=
 =?us-ascii?Q?Od0nEBb/H6MY2v1T3T8s2UB8Go5sLXwWJnfk632cU1uNatyou+5Qjl+PD/Ez?=
 =?us-ascii?Q?CZobBiXkcyeDRZIt77OVCq5lZ3Dg0/3f0vZere6yzarVVyULh0J0pb5a0NP9?=
 =?us-ascii?Q?TMZ7dZccD5XJYC8At0BK1F+4Rj3HnyDiyily68om59hvLKsDCNAGf+NUuNOh?=
 =?us-ascii?Q?5wSGYPWM+6zzDjVyHhKi4rE=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 f39c8e0a-6e8d-4e49-b4b7-08dbbe5916ac
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2023 06:23:25.2264
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 hkhrUICkzNpcur/zFasmCNOu5cZBESOSYA+H5jK2qxKV4vkV9+vSWj+diyZIdbjPYPRKN2NXyBaHstoJfikqS0mzPIf6MZLU5F9yno4705rbsYJapDvBOSUOM7SGbDH8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB6175
Message-ID-Hash: SZ7ZOSEWJU527JEPIVB3NJKTSEP4PN7Q
X-Message-ID-Hash: SZ7ZOSEWJU527JEPIVB3NJKTSEP4PN7Q
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SZ7ZOSEWJU527JEPIVB3NJKTSEP4PN7Q/>
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
index 406ee8db1a3c..e8432d466f60 100644
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
index 65b6719e61c5..8090662e8ff2 100644
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

