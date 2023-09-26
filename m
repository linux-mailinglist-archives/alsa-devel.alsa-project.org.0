Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CB747AE5E2
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Sep 2023 08:29:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 07F13ED1;
	Tue, 26 Sep 2023 08:28:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 07F13ED1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695709780;
	bh=4rfzFU13D9pRjlCMxBFXyVrUxUyQB6CguSmje4jFwLc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=VQe+w036WNPMiBsOkjof7DFVubJ+BcqfDfR7NTBsjXlZ3MM9FeAWp0lH+MccPlIJy
	 v3Y0EcY8zNRHQ137kAtgFYl4Bja3+7Myg3/wI3W2Sh/X7pD3At3i8Ko7ceSnkEHurE
	 GoMp/yBE3w2wmS1MVw0ZTWZrxTOAIYGO3Q1+Dlx0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 823B2F80570; Tue, 26 Sep 2023 08:24:16 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E5C46F805EB;
	Tue, 26 Sep 2023 08:24:15 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D692DF80564; Tue, 26 Sep 2023 08:24:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on20703.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:7010::703])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3F128F805E3
	for <alsa-devel@alsa-project.org>; Tue, 26 Sep 2023 08:23:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3F128F805E3
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=arA+JePB
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n47j3h3cPeksvNsGblGTYW+zh+kN0ppL4WEFW5l0TrHe17+4FGz1C4rDWhYrviZqlFGwW9zBF4/HZvYe3vgtumCIhBlXy1t+nRHi4U02lDmUtlzSMrVQaBrUB+EH+x9NsBd0gddH+plSJpsifejUj8+eG7JLIn9HaMbQE5CXE/SGB+zWoLjfYOi7KVYZoBJfcUh4Od/EVLC5lSd5UaLuVz6NFD/Tk0uNVtq13g8S2llVDXahDwi30MjHrvaKgP7a/YqAJb+Tdl9OWIp19ImRdLU0ox/O9yfoAKTCVTIe1RXunyjdrBxJnEwl8JXh53YvjQzaOL/f/dvf2/Z1+X8qxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LD5grfTtkRq4nbBfn/AKspHCx4hYDINip0/Py7OSUw8=;
 b=J7jVFiA+JeDyR7fVwlP+4dQ7YiKl3FZ6no/epwZt6NVcqu27tz7KzaeIlndeZMm1zIv67TVGVENUuzsv8hOeFT7R+5My2wA3TGcOfIx3R+ymza0uToYwLZngo8/qe1/HKRWXKWHGdIO1OXnLD8evcszcYfTBCK8SdtTg5YJKMNWzqpGvXecMh5tRBnHvgM+5NQglp725s9gQoflBLsSi2uXciF0iuFmEF+zCi/7FTQ5rwVnkFmBMy/8K2oHewSYL+50eT2ggkI28A/JdT9MoMDsdJWev9Mr6YK+hvKZQxAuY5dSw1hqZGnfSJ/G4bBE8jbpLumVvpZY+WR7OkofIfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LD5grfTtkRq4nbBfn/AKspHCx4hYDINip0/Py7OSUw8=;
 b=arA+JePBd40oDydy2Q31nNT7ESigqILTOVPQdhJDf+SHdF32mT1LZ4ILuLZT5dMBvQaml39s+IYnNgJevBjNCnB9Vj/lygpHcRKTgKhS/K9l4DtBwd05TQUt68FwD5r7v8lstVAbs3ZAlDpngRkLg9MOjJdDIcdcjfb+N3+bJmE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYCPR01MB6175.jpnprd01.prod.outlook.com (2603:1096:400:4b::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Tue, 26 Sep
 2023 06:23:42 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::d2a3:45df:a180:595c]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::d2a3:45df:a180:595c%6]) with mapi id 15.20.6813.027; Tue, 26 Sep 2023
 06:23:42 +0000
Message-ID: <875y3xh2qa.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Alper Nebi Yasak <alpernebiyasak@gmail.com>,
 Heiko Stuebner <heiko@sntech.de>, Jaroslav Kysela <perex@perex.cz>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org
Subject: [PATCH v2 31/54] ASoC: rockchip: convert not to use asoc_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
In-Reply-To: <87edilihhg.wl-kuninori.morimoto.gx@renesas.com>
References: <87edilihhg.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 26 Sep 2023 06:23:42 +0000
X-ClientProxiedBy: TYCPR01CA0066.jpnprd01.prod.outlook.com
 (2603:1096:405:2::30) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYCPR01MB6175:EE_
X-MS-Office365-Filtering-Correlation-Id: 33297591-c5dd-4a0d-e022-08dbbe592179
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	bi7SBsmA86utmcdg2+BBgbhsJRKpeWxspYhwfTctJbhbutfoHby85SJUpXMg1jC40p6RxKu29muVhNyEL8cx2mfl4+0zj2mSojPI9YbPlF/zFNEYsWapYdZq9qluwM7YPat/y9SzRJTIZ+n/4EMSmQVeykjCHXuQRqra7DsJ17yI5LY2E5PVx8DCyA/Xl2Mux+QjNRZiOnekn1DFeIunYFST5lCthnprBG/N5BcLk2Q7Q2acXWWq8+HbM98TZtlKWg3CndR203DdJdlRUNLqbml3Z4r59qjaHb/KeqeIR0lYttHXT/B20Pr80spIH01W5Fqyra5C5/ArxBUWg6aH1PK9scVpzHTOPEf34P6HJtGH0/EvdJNTKPfIeOYKludQrj4Zoo9UhXLm39ijJ0YyqySv+6+Ox8Ph+1lno7ow0mi6vNQVkcRwSdoPyvAL3i8j+7O9fZQfLcMY9Vmeby7T9QqLRn7cFib1AkZjilJQlem2UiNf751aqSFWpw+YhIrDJdYC21xc3O3aWflHu05tOslOpoIZBx0RxsJ2qPp1E/Bc0cfYIqjh70frc6WoZqlVq+KQP8LkAVUYSWsMGAd9+anBt1EO34vmmsheku4Y0O1tWQlUTyASkoX6US9wwCzqg43w0WqiF3NdxEkBBtVmsA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(396003)(366004)(346002)(136003)(39860400002)(230922051799003)(1800799009)(186009)(451199024)(6506007)(6512007)(52116002)(26005)(478600001)(66476007)(66556008)(66946007)(86362001)(2616005)(110136005)(6486002)(38100700002)(38350700002)(83380400001)(2906002)(8936002)(8676002)(36756003)(4326008)(5660300002)(316002)(41300700001)(21314003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?VVC4gitVSFOAVz/N1UPkGTq9w5i8lXDosR3vU7kMlIpy0Vkm0kQxMaA7HJ3m?=
 =?us-ascii?Q?InyDc9g2bkKboxkHhDLdn5ZLUQl6V4v4aM5LLtQkJedePOMe1/asYbT1YZAX?=
 =?us-ascii?Q?dYGN35eZ3f/VEqj3MnzAmJpfRvF0Cn42QeMH6hs6WvQ96eLpYW6J/B5QhBdI?=
 =?us-ascii?Q?hIfxUOnyBfx1gizxnCEcPsPC0iK0/gaMIZDmbWP+3FybVSDfcjWcNwHb6B6K?=
 =?us-ascii?Q?5rq7vpNilPiur6XteXrO/bFCaVH0Pe+Q3FIX12+BRyjkimXNK6paidZ6yqED?=
 =?us-ascii?Q?NfZuGKU11HfYbkZk3gPAcYBXSclWeWb/0R7zrlv+DDmS04krNrwbmUSRhVHn?=
 =?us-ascii?Q?eUG8izm2TZj1Tz1h3BnFVNgV5Mt9Mqd7TIHXrbE2y+Nwt0KGU7LTVEEM7zTb?=
 =?us-ascii?Q?yZ7pPn3VztcjPU58tSN9SMPNaWbmlSDIZdqSq75nbdWL+U5HpojrKUWaj08R?=
 =?us-ascii?Q?n39IZvgkqDh1QYEA6RIFhNIG2iCthmP2FSjzN+2bW9IuSdJexe8vzikMOnTt?=
 =?us-ascii?Q?8aK2FPGAQkTh7+4rsz8+xZgO4JzR08cEowoRyq0CYfhg55+GSjgPUWXkWPp/?=
 =?us-ascii?Q?6yttawvbVCnkdoqhRgTys3GGGRnFELed2nXwcfaCceh6yoaICTcagO+Br0m4?=
 =?us-ascii?Q?KY4onTxcONwvgCQ+rLOqe5P0huRi+MZV6pKpf2IvNwPoAyiHdhEvWGqo+zCq?=
 =?us-ascii?Q?qHzz7ZWwd83KEoLXNKDW8L0NDl4IytOHBFl0yKm+VTKJ8ADLeejlaK+d6obm?=
 =?us-ascii?Q?jO1GHkTmYuGbDw7C2D+0MlOdb8VyDMBb5vxI4r3WRSRXoN/r3UEO+lAGSxrh?=
 =?us-ascii?Q?E2+kzdfv3Ce5EVI2nXJDR18JpQdcxWpBxecSddELZP5vt8M7o2woVPsp1y54?=
 =?us-ascii?Q?Uqhhe5WGA+qmMULAKFWmJB0sGE3Fz8ovJMYmRw/rqCZxV9jE01jT3Br7Ca3h?=
 =?us-ascii?Q?Rzm5fmf2uHoAYXojur5/up7wGs48MNRKP7anMadsgpzcPIXiGBzLQ+WAYHxu?=
 =?us-ascii?Q?o1+hE6PrDhdj/yYRG9vOPt26cXgGTVUdDsLgaNwKEOzu6MLOyx+jt4pM+mud?=
 =?us-ascii?Q?g9hGc4Aos0KhPqgsjlrFRJLDSeCyEwAsNTiygjzMMKEtr95yRak7sGzIoKnJ?=
 =?us-ascii?Q?YJsfx2tlL9ML8WojCHiZ6qzxYcOGDxUWjMj68XCkOYDCVSiFdCHYUmR6UlvW?=
 =?us-ascii?Q?Ixtf2uNQwq0UTLrnWOTS7bM5b1V907tjc6l4bwX5+zcyb0lbJGJ6Z2dBsO6P?=
 =?us-ascii?Q?Nzp3n3gN2XughitsOnLkH0Vj1i57C4T3K2kBDGnAibbwdQiIWJre68QM9u6r?=
 =?us-ascii?Q?w53mCDmhTJDAbBNZ9ch8sv7hqDXG/qQBtReA5Xqv961BsTG8ZY/r8faTbHgG?=
 =?us-ascii?Q?3kiIXwgxi7AJSt+nkd0kYbjY2H7Lj18Ns8uxMnqEpuxX6Rl7tnc++1vGPa5h?=
 =?us-ascii?Q?L4FvegxC269tujlw4aqeNpJmGidKaoYS2J46Nfmp4dyqak2TYWp10nRlqI0v?=
 =?us-ascii?Q?LypkeOJH3OeDHVqRdwdE9s9EszAC1fYgi4vDuUDr+zZEl2YwvWcb3reow6Ci?=
 =?us-ascii?Q?3+4NbRCg9gDB14O2cx/gj1V9WTGnUkCat5aYEjkkoSBrqpE23DdkZhcpAW4A?=
 =?us-ascii?Q?kdfBmuP0ghoohdIU6Ea3c88=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 33297591-c5dd-4a0d-e022-08dbbe592179
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2023 06:23:42.8334
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 A3Gi1kZilslB32rtDWHO8wQ7jXgza596cPsVfIRVN3Z8+YlmeHgc1GrJVKoLuFsafTDqo1JteXIwl0ujxYMh1ydPlE/u1M5oeEx9Wu0fH5cDc4cVjCPVSexqAPkO3Axl
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB6175
Message-ID-Hash: 7TTT5634QZTAKLVEQG25RB2QNWE2ZXJX
X-Message-ID-Hash: 7TTT5634QZTAKLVEQG25RB2QNWE2ZXJX
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7TTT5634QZTAKLVEQG25RB2QNWE2ZXJX/>
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
 sound/soc/rockchip/rk3288_hdmi_analog.c |  6 +++---
 sound/soc/rockchip/rk3399_gru_sound.c   | 26 ++++++++++++-------------
 sound/soc/rockchip/rockchip_i2s.c       |  2 +-
 sound/soc/rockchip/rockchip_max98090.c  |  8 ++++----
 sound/soc/rockchip/rockchip_rt5645.c    |  8 ++++----
 5 files changed, 25 insertions(+), 25 deletions(-)

diff --git a/sound/soc/rockchip/rk3288_hdmi_analog.c b/sound/soc/rockchip/rk3288_hdmi_analog.c
index 0c6bd9a019db..5ff499c81d3f 100644
--- a/sound/soc/rockchip/rk3288_hdmi_analog.c
+++ b/sound/soc/rockchip/rk3288_hdmi_analog.c
@@ -66,9 +66,9 @@ static int rk_hw_params(struct snd_pcm_substream *substream,
 			struct snd_pcm_hw_params *params)
 {
 	int ret = 0;
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
-	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
-	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
+	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
 	int mclk;
 
 	switch (params_rate(params)) {
diff --git a/sound/soc/rockchip/rk3399_gru_sound.c b/sound/soc/rockchip/rk3399_gru_sound.c
index 0f704d22d21b..4c3b8b363530 100644
--- a/sound/soc/rockchip/rk3399_gru_sound.c
+++ b/sound/soc/rockchip/rk3399_gru_sound.c
@@ -68,13 +68,13 @@ static const struct snd_kcontrol_new rockchip_controls[] = {
 static int rockchip_sound_max98357a_hw_params(struct snd_pcm_substream *substream,
 			     struct snd_pcm_hw_params *params)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	unsigned int mclk;
 	int ret;
 
 	mclk = params_rate(params) * SOUND_FS;
 
-	ret = snd_soc_dai_set_sysclk(asoc_rtd_to_cpu(rtd, 0), 0, mclk, 0);
+	ret = snd_soc_dai_set_sysclk(snd_soc_rtd_to_cpu(rtd, 0), 0, mclk, 0);
 	if (ret) {
 		dev_err(rtd->card->dev, "%s() error setting sysclk to %u: %d\n",
 				__func__, mclk, ret);
@@ -87,9 +87,9 @@ static int rockchip_sound_max98357a_hw_params(struct snd_pcm_substream *substrea
 static int rockchip_sound_rt5514_hw_params(struct snd_pcm_substream *substream,
 			     struct snd_pcm_hw_params *params)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
-	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
-	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
+	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
 	unsigned int mclk;
 	int ret;
 
@@ -119,9 +119,9 @@ static int rockchip_sound_rt5514_hw_params(struct snd_pcm_substream *substream,
 static int rockchip_sound_da7219_hw_params(struct snd_pcm_substream *substream,
 			     struct snd_pcm_hw_params *params)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
-	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
-	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
+	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
 	int mclk, ret;
 
 	/* in bypass mode, the mclk has to be one of the frequencies below */
@@ -172,7 +172,7 @@ static struct snd_soc_jack cdn_dp_card_jack;
 
 static int rockchip_sound_cdndp_init(struct snd_soc_pcm_runtime *rtd)
 {
-	struct snd_soc_component *component = asoc_rtd_to_codec(rtd, 0)->component;
+	struct snd_soc_component *component = snd_soc_rtd_to_codec(rtd, 0)->component;
 	struct snd_soc_card *card = rtd->card;
 	int ret;
 
@@ -189,8 +189,8 @@ static int rockchip_sound_cdndp_init(struct snd_soc_pcm_runtime *rtd)
 
 static int rockchip_sound_da7219_init(struct snd_soc_pcm_runtime *rtd)
 {
-	struct snd_soc_component *component = asoc_rtd_to_codec(rtd, 0)->component;
-	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
+	struct snd_soc_component *component = snd_soc_rtd_to_codec(rtd, 0)->component;
+	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
 	int ret;
 
 	/* We need default MCLK and PLL settings for the accessory detection */
@@ -238,13 +238,13 @@ static int rockchip_sound_da7219_init(struct snd_soc_pcm_runtime *rtd)
 static int rockchip_sound_dmic_hw_params(struct snd_pcm_substream *substream,
 			     struct snd_pcm_hw_params *params)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	unsigned int mclk;
 	int ret;
 
 	mclk = params_rate(params) * SOUND_FS;
 
-	ret = snd_soc_dai_set_sysclk(asoc_rtd_to_cpu(rtd, 0), 0, mclk, 0);
+	ret = snd_soc_dai_set_sysclk(snd_soc_rtd_to_cpu(rtd, 0), 0, mclk, 0);
 	if (ret) {
 		dev_err(rtd->card->dev, "%s() error setting sysclk to %u: %d\n",
 				__func__, mclk, ret);
diff --git a/sound/soc/rockchip/rockchip_i2s.c b/sound/soc/rockchip/rockchip_i2s.c
index 834fbb5cf810..74e7d6ee0f28 100644
--- a/sound/soc/rockchip/rockchip_i2s.c
+++ b/sound/soc/rockchip/rockchip_i2s.c
@@ -352,7 +352,7 @@ static int rockchip_i2s_hw_params(struct snd_pcm_substream *substream,
 				  struct snd_soc_dai *dai)
 {
 	struct rk_i2s_dev *i2s = to_info(dai);
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	unsigned int val = 0;
 	unsigned int mclk_rate, bclk_rate, div_bclk, div_lrck;
 
diff --git a/sound/soc/rockchip/rockchip_max98090.c b/sound/soc/rockchip/rockchip_max98090.c
index 150ac524a590..17087b504a37 100644
--- a/sound/soc/rockchip/rockchip_max98090.c
+++ b/sound/soc/rockchip/rockchip_max98090.c
@@ -144,9 +144,9 @@ static int rk_aif1_hw_params(struct snd_pcm_substream *substream,
 			     struct snd_pcm_hw_params *params)
 {
 	int ret = 0;
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
-	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
-	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
+	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
 	int mclk;
 
 	switch (params_rate(params)) {
@@ -226,7 +226,7 @@ static struct snd_soc_jack rk_hdmi_jack;
 static int rk_hdmi_init(struct snd_soc_pcm_runtime *runtime)
 {
 	struct snd_soc_card *card = runtime->card;
-	struct snd_soc_component *component = asoc_rtd_to_codec(runtime, 0)->component;
+	struct snd_soc_component *component = snd_soc_rtd_to_codec(runtime, 0)->component;
 	int ret;
 
 	/* enable jack detection */
diff --git a/sound/soc/rockchip/rockchip_rt5645.c b/sound/soc/rockchip/rockchip_rt5645.c
index ef9fdf0386cb..d5cfef9be1af 100644
--- a/sound/soc/rockchip/rockchip_rt5645.c
+++ b/sound/soc/rockchip/rockchip_rt5645.c
@@ -65,9 +65,9 @@ static int rk_aif1_hw_params(struct snd_pcm_substream *substream,
 			     struct snd_pcm_hw_params *params)
 {
 	int ret = 0;
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
-	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
-	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
+	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
 	int mclk;
 
 	switch (params_rate(params)) {
@@ -125,7 +125,7 @@ static int rk_init(struct snd_soc_pcm_runtime *runtime)
 		return ret;
 	}
 
-	return rt5645_set_jack_detect(asoc_rtd_to_codec(runtime, 0)->component,
+	return rt5645_set_jack_detect(snd_soc_rtd_to_codec(runtime, 0)->component,
 				     &headset_jack,
 				     &headset_jack,
 				     &headset_jack);
-- 
2.25.1

