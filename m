Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BE53F7AE5CF
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Sep 2023 08:26:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5937FEBE;
	Tue, 26 Sep 2023 08:25:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5937FEBE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695709597;
	bh=LnCtSq1jqW1eAoBBMF+qhpMgw4dBUm9OPUb2O5f918k=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=CborefIbsvU4282uInYyWikTf4aEDxK87sZfskuenIVz7ZnSp3Wef4hWjqQlMiNqE
	 jnG/hu5K9HNlqR6xW9NIM+1zA8La/lS0pn1h3YkUng5ofMnc2CjMXNGjykypcuhBSh
	 L3mZsncCeACZoisUfy6FzyrygjULnxg8NaT2W+1o=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BA9E4F8060C; Tue, 26 Sep 2023 08:23:05 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DCE1DF805CA;
	Tue, 26 Sep 2023 08:23:04 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1F6FDF80571; Tue, 26 Sep 2023 08:22:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on20713.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:7010::713])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 67CCBF80580
	for <alsa-devel@alsa-project.org>; Tue, 26 Sep 2023 08:22:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 67CCBF80580
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=j5hjxoae
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QpYLtQbIqREjZqBJ283mQowBiup4dpGvQBMOtAqZUbMCBBy5/4CJu/L2pUCB38gM83Ehv8s0/V1T8DZKaEDp7zNRZ4BVDiVFCel2TQQYtYkKp7IxDTIdorvMQ+xYYe/DCNfOfsI4S35GNxakKeYERtCWCmX3iqO4dzYhYGgDiVCac41b7vuq0jhkHdlhwsUOoqxW9CvFWrVa4URIeCJt7xyJfnlqxkJ2thXNbm0W8+DSA3QFOusjb2qTTPF6FY+qji5g1A5B69kl2WPvu1gnxoTnaCwkQXrxugbbc7USC4Hjn3Y/GRKMi1jX5MVn5+/t2K9m7zMCkS3Zaw+njsmRqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=auZrzbhqbqtYM4YKP4ddFQq9onOt5tAEW6w7hFdGeKk=;
 b=NIx7BBM21VgbYKgoLp1mphBrEN7/OyEd/Pjx64uDOQrlxid7XSNF3vO72I4/XHaQCCBT3uH8ffSfhAbcEkal+8xKZxSDKcTCWbxulie9yjIQkQZvzUj0kaK2US+447XPpn4yN6qMmVJ7rU211ne4QZ7YgEz9m79FMDGyWccKADgamSQy51cA57ul8nLrP2Mi16kcGp0qNBvtroqc8+tMMLcXtPZBM+qsuAchtKlF90IIYBpfIR8G305UxIoKa6mOu+gu0Z6D1Wzktj/3Op0lxEU++vFyDtv+EjhqjEjlmVNOISFsuJ3gvdaPh5hMLqtyoQhORuxbU6443WPabOUvhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=auZrzbhqbqtYM4YKP4ddFQq9onOt5tAEW6w7hFdGeKk=;
 b=j5hjxoaeCNKjTBNNIoZiChaDkDN7st8KPoTwfZwjbzCMyYAllU+oD0f0eJi17vy3g7v1j5jWrUMUk+x1wdMCYFsf4iiwDP5KJEzD0OdpM3ys6m5tAt2ZTNQV/lRLLXN/sXhcSJpbZyGrAI9HsxHKjd49FNa1VmBGXBcxp2uWCbY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYCPR01MB10364.jpnprd01.prod.outlook.com (2603:1096:400:240::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Tue, 26 Sep
 2023 06:22:37 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::d2a3:45df:a180:595c]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::d2a3:45df:a180:595c%6]) with mapi id 15.20.6813.027; Tue, 26 Sep 2023
 06:22:37 +0000
Message-ID: <87jzsdh2s2.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Jonathan Hunter <jonathanh@nvidia.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Svyatoslav Ryhel <clamor95@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Thierry Reding <thierry.reding@gmail.com>
Cc: alsa-devel@alsa-project.org
Subject: [PATCH v2 21/54] ASoC: tegra: convert not to use asoc_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
In-Reply-To: <87edilihhg.wl-kuninori.morimoto.gx@renesas.com>
References: <87edilihhg.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 26 Sep 2023 06:22:37 +0000
X-ClientProxiedBy: TYCPR01CA0069.jpnprd01.prod.outlook.com
 (2603:1096:405:2::33) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYCPR01MB10364:EE_
X-MS-Office365-Filtering-Correlation-Id: ab7ca7a7-cf76-4c8d-03d2-08dbbe58fabb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	WIdzg+SWRxa8E+s4IVUGrhpQiCFKLuDH1StesVn2fCH7XrYxykNcFR9z2Yjlnp5Qla4lFL2v5b81mrUSdKDj51rPAGIkyAGA9ypKKmv3HQecv1gna4z8K51o6HS5MRmFneCPYpVSCOU0g+jSMCe3nvRyMn62OY0De50LDW/AfQ62EaLmSoRtGFN4fiDF3BUKOC+xL3GPWK6ruyuBlNweAZ13SeG9pGnGkCdOgKyAE5O+HM5WKbGcoRTwggVRy4cRIj5MmeMKjOgYiuUSsuWihP+oQ+8oFGi5XvH0f6jjwf3PJXt39/FYZyd2UeMkJQP4yWvp92NQwKEm/s4YhOvselts9iOoyQbgW0hzuYoxj/ezReVVBJCYDtuTCiZn046p/H7H0sd4+9nciKUvkN7NIeeSLazlo8Gi5Wfq9fmZQV3QbFg2dK6pJENHabtnJoatobVvhapTZ6YnOz729HjbIGmfPze53zDeXreC/HSqZgvsJehtq1i2NNndGN/veOUdrQdpjrIFDCJb0z8pSUNLEPdH5BHmP4YCV9JaHgITaRMTAnVep6PlAdLzD2P8UnB+0jn9C/biXMvn/3cxCcHbn7DfRAXh38epGm1bfspCMPG/G0nMlEuaPceuahN+UXM18EkoyV8ORoRdXFvUfbB09Q==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(136003)(376002)(39860400002)(366004)(346002)(230922051799003)(1800799009)(186009)(451199024)(52116002)(478600001)(6512007)(41300700001)(38100700002)(38350700002)(316002)(26005)(2616005)(5660300002)(83380400001)(66476007)(66556008)(6486002)(6506007)(110136005)(8676002)(4326008)(66946007)(8936002)(2906002)(86362001)(36756003)(21314003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?+I/Tbw957yJET0rY7dnuj64hjKJOrzkFGjpRHvY0wxfVUFL1KTTen5QZsvna?=
 =?us-ascii?Q?/iROqZtlWYZEg+BUj7LV+AQiRj90gj6zclVOy3ma/rxdx9Y8uZqTH6Zaz5tg?=
 =?us-ascii?Q?WiFwkWXhyxdjhVjm/qa2lzH4OzV7BaE+189LKP1fi/YN7wx+hWuyyBUdd5eb?=
 =?us-ascii?Q?seFK9czOimlaliz5rcujhQJOqePxdupM0SbhqoqqdB01h37Rfg1u9haLxLU+?=
 =?us-ascii?Q?48keD0FaM8Ik0SwX3oraGQbWLPX3m7yiqkhVuUcS48KSNlOtRkGNqEhSOrV2?=
 =?us-ascii?Q?NpJlmgrQ/sUi5kkvH8Jm6IomG+T3WV+0xJq8Bful/EzdZJTc3sgZEMO2Dnf4?=
 =?us-ascii?Q?pdlawJvF1oAd94/ejpSLhn1lXYvJz1e/r1P77SvuQGLOWtexXCBQpkXVgEN3?=
 =?us-ascii?Q?DHoUFf8i5Xz9dyVxTAXER0upWYfoCVeUhTUO5r14pDKO3allQGTgJAsUIRnW?=
 =?us-ascii?Q?l8V7sphQgqGOdR7q+pHzC0QaWw0AFvMAQqbeaAGvJWb0ym2u3hDJi3QFMW/U?=
 =?us-ascii?Q?5DsGnFJMIJ4W3LhdHj0ysZH8zMXK4bBYoS7+FcfpqksaQU/RrjeKWWXnj2Tr?=
 =?us-ascii?Q?ccoWd3iltpYV7zu93R44INMjcP7Vkmimmh91J1neQzU8wkqV2SABpBin7nf1?=
 =?us-ascii?Q?WzxIcAm/T2lSPl78Q+SaN3XypBN5jQbjK5uT+UNsfH8ZCcSNVAISRx2BT1P0?=
 =?us-ascii?Q?sV3cdtVACe8MeVRfoKL3JcX90Qv375A6V0h0uhjn+h03kRok9jku1Bsy8+O8?=
 =?us-ascii?Q?kxsQF568IcLJEINI0cQNsjinl4Yxnx6fij07qWxtMdc2lzrGEPKKcs/oBq46?=
 =?us-ascii?Q?y9rKpecRNJYyMFGj7a4b8DzljpVjwYIfYq6Rq7YZyH96nvhg9GvgTfMCoUqF?=
 =?us-ascii?Q?LPp4pzZJe3c5FnkgsqI7S57u+qkWDRCQWzhhO75n4yxawRlLvr9VLmQdKGF0?=
 =?us-ascii?Q?iKDNGyf3sFySHwMmSmWdlHJVVF1NlOb2loiYjcY2wfivFyE7e82+1BJ4pho3?=
 =?us-ascii?Q?g94B/YXQBrDzb3z9XrmBcwjGD8MrYU5P2VJNE9DztK+gYDB2KhO0r3BOMMN7?=
 =?us-ascii?Q?QriDPcqrQPCfx1ftp+RnycdH5dRYAwNJaFbj0jvDUpSsoOkeTpaeK2Mo8FuQ?=
 =?us-ascii?Q?TTkmGJg6KKC/UBuWoCS0A84eMPZDdBnlic+LEtNM10nr5QLlvJ8asOT46Ep6?=
 =?us-ascii?Q?rx+fbPGGQcWy2zEcoGWQiDPldQmqnTmXpA/ubaBhW0iFIuq/WOTcHjjCQ0Mr?=
 =?us-ascii?Q?TNzr0bPhn35z5XX7spDveGR5BwcQrkbhi3MLOFJXDPH/O0ZCCjL+41iKNDVt?=
 =?us-ascii?Q?ywy1O/mcHaYR0IKh0VT0Uo2b27iU83UIXQzYOEHTnXMKeBoN8Xa9KN9b39nC?=
 =?us-ascii?Q?7DjiVy3RnMSKJPsXd7QaI8uiDwv5fTnSd7NoFfrw3IU7GNeIgMBf0vwphEo5?=
 =?us-ascii?Q?dYIETn4KmheDROaDEQLHmcEh6neF64Snc2l9W2ReG9kLUZ+3LzTBl/ZGNnVN?=
 =?us-ascii?Q?QgZZ4GBTDsF/6xikoXLg4+72SCZF9Bj1WI9zn1Jwwt25ep+QF49bqgZ87U+G?=
 =?us-ascii?Q?raXMHFZE15J8LE8Yk4RVUqXXpOH23qi5r8IC9XhIEi6Fwm3S1pVOVeua+ZuI?=
 =?us-ascii?Q?zIOsgUB4OVR8KP+IqsXTt7g=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 ab7ca7a7-cf76-4c8d-03d2-08dbbe58fabb
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2023 06:22:37.7043
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 IdUufIf4ywxPmBReluEDCKCg/gcb7a6jAuLhbYHXAbdJQiY4QaV3HqgNcjNdJ9X2KuzykGt5fTcLzo8WuBepgNqQmgkaptO54FGKxEy9/2qlZJWaElUGet/45AMICInt
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB10364
Message-ID-Hash: Z6BX5YRDJOLO76MWASKK3VRHQXDZ3VDW
X-Message-ID-Hash: Z6BX5YRDJOLO76MWASKK3VRHQXDZ3VDW
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Z6BX5YRDJOLO76MWASKK3VRHQXDZ3VDW/>
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
 sound/soc/tegra/tegra_asoc_machine.c     |  2 +-
 sound/soc/tegra/tegra_audio_graph_card.c | 22 +++++++++++-----------
 sound/soc/tegra/tegra_pcm.c              |  4 ++--
 sound/soc/tegra/tegra_wm8903.c           |  4 ++--
 4 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/sound/soc/tegra/tegra_asoc_machine.c b/sound/soc/tegra/tegra_asoc_machine.c
index f5092b410926..0e75c6d5c0c5 100644
--- a/sound/soc/tegra/tegra_asoc_machine.c
+++ b/sound/soc/tegra/tegra_asoc_machine.c
@@ -288,7 +288,7 @@ static int tegra_machine_hw_params(struct snd_pcm_substream *substream,
 				   struct snd_pcm_hw_params *params)
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
-	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
+	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
 	struct snd_soc_card *card = rtd->card;
 	struct tegra_machine *machine = snd_soc_card_get_drvdata(card);
 	unsigned int srate = params_rate(params);
diff --git a/sound/soc/tegra/tegra_audio_graph_card.c b/sound/soc/tegra/tegra_audio_graph_card.c
index 4737e776d383..27e9f41188b4 100644
--- a/sound/soc/tegra/tegra_audio_graph_card.c
+++ b/sound/soc/tegra/tegra_audio_graph_card.c
@@ -34,7 +34,7 @@ enum srate_type {
 };
 
 struct tegra_audio_priv {
-	struct asoc_simple_priv simple;
+	struct simple_util_priv simple;
 	struct clk *clk_plla_out0;
 	struct clk *clk_plla;
 };
@@ -64,8 +64,8 @@ static bool need_clk_update(struct snd_soc_dai *dai)
 static int tegra_audio_graph_update_pll(struct snd_pcm_substream *substream,
 					struct snd_pcm_hw_params *params)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
-	struct asoc_simple_priv *simple = snd_soc_card_get_drvdata(rtd->card);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	struct simple_util_priv *simple = snd_soc_card_get_drvdata(rtd->card);
 	struct tegra_audio_priv *priv = simple_to_tegra_priv(simple);
 	struct device *dev = rtd->card->dev;
 	const struct tegra_audio_cdata *data = of_device_get_match_data(dev);
@@ -152,8 +152,8 @@ static int tegra_audio_graph_update_pll(struct snd_pcm_substream *substream,
 static int tegra_audio_graph_hw_params(struct snd_pcm_substream *substream,
 				       struct snd_pcm_hw_params *params)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
-	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
 	int err;
 
 	if (need_clk_update(cpu_dai)) {
@@ -162,18 +162,18 @@ static int tegra_audio_graph_hw_params(struct snd_pcm_substream *substream,
 			return err;
 	}
 
-	return asoc_simple_hw_params(substream, params);
+	return simple_util_hw_params(substream, params);
 }
 
 static const struct snd_soc_ops tegra_audio_graph_ops = {
-	.startup	= asoc_simple_startup,
-	.shutdown	= asoc_simple_shutdown,
+	.startup	= simple_util_startup,
+	.shutdown	= simple_util_shutdown,
 	.hw_params	= tegra_audio_graph_hw_params,
 };
 
 static int tegra_audio_graph_card_probe(struct snd_soc_card *card)
 {
-	struct asoc_simple_priv *simple = snd_soc_card_get_drvdata(card);
+	struct simple_util_priv *simple = snd_soc_card_get_drvdata(card);
 	struct tegra_audio_priv *priv = simple_to_tegra_priv(simple);
 
 	priv->clk_plla = devm_clk_get(card->dev, "pll_a");
@@ -188,7 +188,7 @@ static int tegra_audio_graph_card_probe(struct snd_soc_card *card)
 		return PTR_ERR(priv->clk_plla_out0);
 	}
 
-	return asoc_graph_card_probe(card);
+	return graph_util_card_probe(card);
 }
 
 static int tegra_audio_graph_probe(struct platform_device *pdev)
@@ -248,7 +248,7 @@ static struct platform_driver tegra_audio_graph_card = {
 		.of_match_table = graph_of_tegra_match,
 	},
 	.probe = tegra_audio_graph_probe,
-	.remove = asoc_simple_remove,
+	.remove = simple_util_remove,
 };
 module_platform_driver(tegra_audio_graph_card);
 
diff --git a/sound/soc/tegra/tegra_pcm.c b/sound/soc/tegra/tegra_pcm.c
index 0b69cebc9a33..142e8d4eefd5 100644
--- a/sound/soc/tegra/tegra_pcm.c
+++ b/sound/soc/tegra/tegra_pcm.c
@@ -79,7 +79,7 @@ int tegra_pcm_open(struct snd_soc_component *component,
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
 	struct snd_dmaengine_dai_dma_data *dmap;
 	struct dma_chan *chan;
-	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
 	int ret;
 
 	if (rtd->dai_link->no_pcm)
@@ -151,7 +151,7 @@ int tegra_pcm_hw_params(struct snd_soc_component *component,
 	if (rtd->dai_link->no_pcm)
 		return 0;
 
-	dmap = snd_soc_dai_get_dma_data(asoc_rtd_to_cpu(rtd, 0), substream);
+	dmap = snd_soc_dai_get_dma_data(snd_soc_rtd_to_cpu(rtd, 0), substream);
 	if (!dmap)
 		return 0;
 
diff --git a/sound/soc/tegra/tegra_wm8903.c b/sound/soc/tegra/tegra_wm8903.c
index b3cd0a34da63..6116d2e30fca 100644
--- a/sound/soc/tegra/tegra_wm8903.c
+++ b/sound/soc/tegra/tegra_wm8903.c
@@ -75,7 +75,7 @@ static int tegra_wm8903_init(struct snd_soc_pcm_runtime *rtd)
 		return err;
 
 	if (!machine->gpiod_mic_det && machine->asoc->add_mic_jack) {
-		struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
+		struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
 		struct snd_soc_component *component = codec_dai->component;
 		int shrt = 0;
 
@@ -105,7 +105,7 @@ static int tegra_wm8903_remove(struct snd_soc_card *card)
 {
 	struct snd_soc_dai_link *link = &card->dai_link[0];
 	struct snd_soc_pcm_runtime *rtd = snd_soc_get_pcm_runtime(card, link);
-	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
+	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
 	struct snd_soc_component *component = codec_dai->component;
 
 	wm8903_mic_detect(component, NULL, 0, 0);
-- 
2.25.1

