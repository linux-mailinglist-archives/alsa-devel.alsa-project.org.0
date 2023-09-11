Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 09DDC79B1C8
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Sep 2023 01:57:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 59259E92;
	Tue, 12 Sep 2023 01:56:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 59259E92
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694476645;
	bh=lyNUMozV3X75wdPa6c/h1akraJ1wptwb4Yd7Xgf6iK4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=c3LAPHghp/ldKtT5l1oS0b74Z8pySaKNLkSQbVQJbCv6OWJP1XWrmKLN1pF8Reqa1
	 7mH/ID3+Y96Y7V3vWBpDP9uE+FKbDLudAE859cS0+BK5IpxZWZki86cHFsLFXXShj7
	 vIp/IfNvVGFrtkQFqbTwUcgF7K4yThN7UZv77Qcw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D2EF3F806B1; Tue, 12 Sep 2023 01:51:59 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 149FCF806AB;
	Tue, 12 Sep 2023 01:51:58 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 65FE3F805B5; Tue, 12 Sep 2023 01:51:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2070a.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::70a])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C37C3F8057B
	for <alsa-devel@alsa-project.org>; Tue, 12 Sep 2023 01:50:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C37C3F8057B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=mHADqHJ7
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OzYo+Tt9iHA814KPRrVF7s2pMMaP6fngEa7HXOTg0htsql10TGBQtlBj9S3vCfACtjUTrTQCfxYkedSMe9qnICAkueFgfBOtWhunJQcWqTRfWdtpNSPMipuRj9l3Mu+2nymTMulutNKCTnNEFgSmUvjyqRZtL/cXGSPA1rYQRvJotjy6CHVRbUuQmnPu8H5GpkGRiwthF1MhPy4h71SemyY4tYYDtfC5NTJwMkPlv2bgh/ajzVrURqRjIikwF9g7Q7buSyAHIkE/3bqwrP2sjeHAeME7t9P1Juyowes9qJTUuxgJna7UyIaCcPjZ7Mxj3iHZU4k2vtKIvooa4QicxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Pq/8uknxbA8g5mEBHdDBYwphkBwUM4HLrzkI+ZA0hIE=;
 b=a4NEcTx1c258NtFQ4nyVbQE/PoA9JZp9fkL3udFN2wmf40KDkqA5oqRrFnlUis/aotEpmcH1aUWg+L1fjltaNyICR33MU7bq9Kf1uJ5Y5nuo7KakGAQCZ1EnNPYfBGAQdu/pDoT6vgY+XwrCRAa+ivXRixF4GqidT9Id8ZhN2puKv55eh93S7rWUtXGw0QFh2i6iO7zfkKNUp0ClQgw0hIljRvUuLiIzdhRUib6owHNu1JuvLC8wI5NuTZxIKBdl3H28ebMK1KfUlvEL0DYWw7UxFs7NJX48zdXIVynY0QPYec15ul0v8yC4ERim8zYakxx+8Sltx82pX3CnJDQzdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pq/8uknxbA8g5mEBHdDBYwphkBwUM4HLrzkI+ZA0hIE=;
 b=mHADqHJ7amshA+BWqubzFAUvsiuT3gPDbIAnmNMQxRaWBvLHYbZw5HtziEEOPy3sqrA8bmRTMTDQEo8w7WTXX/WddH4aMHuADjFkRkIUaRbbBYfeyRL2CW1vQ5tkFZvvE/mJB3vN3Kbz8tpMgzNgd5zOCe+rMkt4EPo+sMgdOgw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OS3PR01MB9445.jpnprd01.prod.outlook.com (2603:1096:604:1ce::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.37; Mon, 11 Sep
 2023 23:50:14 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::8c08:d94c:8e54:9b5d]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::8c08:d94c:8e54:9b5d%6]) with mapi id 15.20.6768.036; Mon, 11 Sep 2023
 23:50:13 +0000
Message-ID: <878r9cqngq.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Alper Nebi Yasak <alpernebiyasak@gmail.com>,
 Heiko Stuebner <heiko@sntech.de>, Jaroslav Kysela <perex@perex.cz>,
 Judy Hsiao <judyhsiao@chromium.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org
Subject: [PATCH 31/54] ASoC: rockchip: convert not to use asoc_xxx()
In-Reply-To: <87h6o0s275.wl-kuninori.morimoto.gx@renesas.com>
References: <87h6o0s275.wl-kuninori.morimoto.gx@renesas.com>
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 11 Sep 2023 23:50:13 +0000
X-ClientProxiedBy: TYCPR01CA0092.jpnprd01.prod.outlook.com
 (2603:1096:405:3::32) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|OS3PR01MB9445:EE_
X-MS-Office365-Filtering-Correlation-Id: 3dceeeb8-778c-44fa-f37e-08dbb321d7bb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	fBBvcBfc+gMxZADTlOEcDJQTyUPyfQOkP11NLL8E7I6oiwsArDppSWarLbRCArg6Tc0hqTQr54RLkS0gl8Diwo3W1+WK2dFlnXo3A5mtBkdrHLLqzJscPNOi84BRNkrlAsw+AFWroCQe4qlhJ3maL60QczxOedOI8oF7gUz1veJ74IMToAJ8olRjbYXgen+XJBv291aavFzSY/WPQHZv/YvG9nhoEDCKZ//mu7Ko9JbcBj9iDQldpzqMBRT/Nh7kP2+OMSaoDTyx8mSwcZxlWskFLc7sGD1NMZlHI2Z8b4vA6Xg+hRFS255wPKzHAT+BN4dO8ckbgGmDx8z9FxPL+V/TcaCoWxfNHshkCbLMtz8VFG0KmzZG08qDdrLyaqPwMoVAMpd3dioGEOEXGHuH4qr2/1Beu5e7CU0nPn9xisdsLR25b4LR0upDBGqsq+SFI42CD5fNIrEgEz6AoRPzXgIYlimt7OmEoW/AG921L1BAwQjZjaEbClrviyd4Frb0fGfPM69pmV3ZLp6TDPedMguTY72ipuugfgaQY0TwUnfk03ZjBfYJrkhIDJtlgIu/Vyexkm/avIgN+YnSpAJRMQlbGiFLOEv288UMOwYy+WQRcgGSGf6JjRpryx8PF2tK10ePiYuzLyg0gYfhfTuSpg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(366004)(376002)(136003)(39860400002)(396003)(1800799009)(186009)(451199024)(83380400001)(66556008)(110136005)(38100700002)(36756003)(38350700002)(86362001)(316002)(66476007)(66946007)(8936002)(4326008)(8676002)(41300700001)(5660300002)(6506007)(6486002)(52116002)(6512007)(2906002)(478600001)(2616005)(26005)(21314003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?I5EpYHerJoBV0jtkJiGtLsCKABDYQv/Prb2gKhnQiuhsAD/t9tJPwPTh5Zgl?=
 =?us-ascii?Q?PyiTKhZZILpO581Qhwg8HuKW9ZO3ROFiwuZmiZyXyjX5J7SXGUL3pUQTeY4t?=
 =?us-ascii?Q?L5DIGBmj/3X1qLxffQRVwNn7mGlyMGBkBFZPrSzt9CmjZk76b1/E2klVuwX0?=
 =?us-ascii?Q?GNKDNMW3T7H429bF51iDkpaLVIb72WlmZyY8g39Rq5dFSS8naBTXK++SfjN6?=
 =?us-ascii?Q?98GBVM9N53sdZxeCW/W6YZ016rAdZSeRUy1BRgcWUL5TbhtURagKMVMP5CJc?=
 =?us-ascii?Q?BOoGOCWh4nEOWWF7jG5IJlkj+8DMbdjgDLNa4rDcJEhf1cCa7nrS0j26+Xn8?=
 =?us-ascii?Q?h6WJRPYFG1Sun3k/kNz7NJskp4y0cxjSzYv/SgSwjXurTsQDdHh5HBpR0wX/?=
 =?us-ascii?Q?oVVxTBHO9DKX96Z7Y8N40P7IFP/DfT666H8iSMu3sdV53xjMpaBSzXVB3IXC?=
 =?us-ascii?Q?rYOP6JrD3TicoC6kb+IUOzy0h+yhB5jb6CWfytemZIFG20+2hEWK17ELh/lk?=
 =?us-ascii?Q?sSBR+CE08CwX21Nnv9XhoWJL/GZzTpnLDsU0gWx2b+Grec8nYfiEPxtBj8Ex?=
 =?us-ascii?Q?0jtzi7pHmyhLk6E1zDFv3Dcxrf8jlej7swKlDNUthw0QvGEt9kFboiKY1yYE?=
 =?us-ascii?Q?4orBj2A8WIU/JQXbZuAwgev2Qa4lnTxTvrcfPwXkTIhzv96LZPk0nVQLybqS?=
 =?us-ascii?Q?OoHdbTEiIlRlyCVnDe9fEpDw6Ed4x6aESFCSJSpgpPJ18QBhz+xTBjOI01/F?=
 =?us-ascii?Q?hgR+PeXCdAGNVHmUdRm21n5wdLUncVBwBNjWcuxQH2SLP9k0Mt4ZakgGzIvW?=
 =?us-ascii?Q?1feMgAFaXFJiSiB3jfdSi/lHHF4OjXErRyOJWg+U82P0A5GOosC0aubmOAeD?=
 =?us-ascii?Q?rSMqXLVzdRoipRu9N32Jc4YStFN/44VsnGyi1neG/YqWBzKkKM1Kt6R8dzMg?=
 =?us-ascii?Q?BTsXkOsF78DHZ1Gq03bNe9Srb3ND21HkL08FqsFy5dpvB2OS1b50gAL4W5en?=
 =?us-ascii?Q?nkVW5P90WpNMQ5aOdexpTIbzgjBNAFwmi+JEMRVZo+nZMlqTKTuqLJrd3GVl?=
 =?us-ascii?Q?n7qXSWt16PeRvj2kLcrR9rsjr9bsQLbxHrdN1vSDBpJIkDMCMjqR2OSV7iTU?=
 =?us-ascii?Q?YnSvTRNZ8rebZSwkfJxi9vNhH3qV4c28EM1NcGrr0SNdSfgjsQmZklhkQg8i?=
 =?us-ascii?Q?F4FT+ytQXwrePsaug9uIS+Y5KLonkxRoZVlW8NdzyNQS2ggZgOygFYZE41It?=
 =?us-ascii?Q?Cr2J4ev1Bwt5mLmux72szSlbLywPRQ41byVODrQgY+1l6ec5CPOHCH6USDfv?=
 =?us-ascii?Q?NR4bhJVrwlEpayW/5j5RtuhXUrcNNcOEi34J79WWpdofpg1Y9whBmV+NUVTm?=
 =?us-ascii?Q?Ff6zaoBcRr2ZvRIMH3pl2A09JJvhsQDP1K+vcLusYWpy+5a5/6SWAQZwd9UD?=
 =?us-ascii?Q?7NnOm7hzV6opH8Yi/Yb2aNHqWc0S8rlfjQ0yZw8ejeQUHjO4FXnxIskVDrQi?=
 =?us-ascii?Q?EmjgXK3SEvz2Aylbo/n2SfNZ0LZfuLzt+rlO0+wAV9nscW+HU5J/uEzqt3L9?=
 =?us-ascii?Q?Bfemjsys2KrqYSiyNFcTwvcoRJD2e86EsR52CD2/2n/J/i2+6wD1Z+swTqlp?=
 =?us-ascii?Q?bh6hP9dSBTOt3eSxCAKbS4Y=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 3dceeeb8-778c-44fa-f37e-08dbb321d7bb
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2023 23:50:13.9066
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 KQaHzDIiHNi+iMhoc/BdTQaI782II+lGRQtWyxejYQJXqUpU1u4bTLRnmF4z5VoScFmaUd46I0Br3AhvT3fF0lDrB820pgB9s49ikRK9YBVhouihU96KiHx0d8OG0Zr1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB9445
Message-ID-Hash: LFFS7U5ZJFMQCLZMDBGCBOXC4SJ4NEJQ
X-Message-ID-Hash: LFFS7U5ZJFMQCLZMDBGCBOXC4SJ4NEJQ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LFFS7U5ZJFMQCLZMDBGCBOXC4SJ4NEJQ/>
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
index 0c6bd9a019dbe..5ff499c81d3f2 100644
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
index 0f704d22d21b0..4c3b8b3635300 100644
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
index 834fbb5cf8103..74e7d6ee0f28b 100644
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
index 150ac524a5903..17087b504a37e 100644
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
index ef9fdf0386cbd..d5cfef9be1af8 100644
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

