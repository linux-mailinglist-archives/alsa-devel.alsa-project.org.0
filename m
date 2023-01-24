Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 620DF678E00
	for <lists+alsa-devel@lfdr.de>; Tue, 24 Jan 2023 03:10:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C5972E8D;
	Tue, 24 Jan 2023 03:09:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C5972E8D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674526235;
	bh=2fNNpSfO24r+GmKD76Pbiz/ETMMgq6wF0jWrKVIUeL4=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=W2JOfWV33N4Xvk5Gb784AJhQJ8BK2AGobMoSGDNyLZWxRDy1pSuNf0A4XPs/bEASU
	 kuUW9vep4VQC1XB3+oDmlSR49mwDZ00kQ3xuAPyCresHgTe7xtzdTAWvt2bqBGrQSQ
	 QR5ZPnngii6NFcuHvxWBUe4BjhtMSfQ0t0oO+LXA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8942DF80551;
	Tue, 24 Jan 2023 03:09:05 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DB177F80548; Tue, 24 Jan 2023 03:09:02 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
 SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on2121.outbound.protection.outlook.com [40.107.114.121])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 57D43F803DC
 for <alsa-devel@alsa-project.org>; Tue, 24 Jan 2023 03:08:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 57D43F803DC
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=WOS0wnAR
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mH/V5x0rnvFCAXBock2ZhC+/wxAYaw9H6PTVTpkvLD0LhvbbEUU2Qmdcv21MMO6w6aep7b7CJ9s8X46ngC5L8YzpSCI5JPQsrpoaoxjtrP8eHPoJF8iBZA12zgfia1vEgdhGE9XGbEMOWuc0bJxMIxp4adoCw0nASuKZF7+Ut8ccCX4GdxWci4ZUOEP6w1vYvI2tJ0ZjOnHfL6YRSUyt64IG5atI+CC/FKS6/1vFZy2PC7AJjVtKEwZMrKoaIudfLXOmLImr9ytZiNaGzxORyip1twgVx9tzdALes8BZ8l2RhTXYUz2Nu3eOmWDJkjvDcHwyNknhKkU9yipywVI2DQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o+DHAC/qAHFuTBfjBrmASsqdMC94lXiyUM2PUGJLHhM=;
 b=I8v+Lp9sjfMqvdAe0B+DIzmPPtKHihRBG32sZjC7UGrNJMICcYsijzrjfuLLln/RPBJpCTcBp2d//ojX0IjGjGpYhs9G+y25mXLwddPHrJxThcdKMJiPmJRxzrvjdLpU33OAscb331cpVZjpLr1Z3b7XSk1diIv0JgvUKTxpyCUFEQm+sLlx2YxFpBOTmSUdrJoXL7MDzqyDIpNboRlxl7YYYLQTvDM/M+ebYyjtnVXA29FzWfpz8ZEpBGC2MEIAsfJXO4BVbN9lZtFPVvnBaab3Fn9PlR/6n0ZADl7AcBDneAm0lLrVovkXzEFM2HI17ZhtoNoKEDE8ft7oAoCV8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o+DHAC/qAHFuTBfjBrmASsqdMC94lXiyUM2PUGJLHhM=;
 b=WOS0wnARjze5u0lIj4QD/yEUBleLsdB6uJ4y8MydcxdXv41uY0iuD9m9YWznRD0i5ekQ6R36xwa0XMsHUQQYz9Tyr4AOJ0vtocVI0tMhDSIQLT+cdyIGMF+QFfXUQ2lDKlrjAfM2l427N9KfWWCsjXt5elBunaG79ERQ1W0DWb8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYCPR01MB6128.jpnprd01.prod.outlook.com (2603:1096:400:61::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Tue, 24 Jan
 2023 02:08:54 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3cd7:a7b5:ea86:9ae]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3cd7:a7b5:ea86:9ae%6]) with mapi id 15.20.6002.033; Tue, 24 Jan 2023
 02:08:54 +0000
Message-ID: <87pmb4u1je.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Mark Brown <broonie@kernel.org>
In-Reply-To: <87y1psu1m1.wl-kuninori.morimoto.gx@renesas.com>
References: <87y1psu1m1.wl-kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 06/25] ASoC: hdmi-codec: use helper function
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 24 Jan 2023 02:08:53 +0000
X-ClientProxiedBy: TYCPR01CA0149.jpnprd01.prod.outlook.com
 (2603:1096:400:2b7::9) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYCPR01MB6128:EE_
X-MS-Office365-Filtering-Correlation-Id: 243fda16-9b14-4026-22d1-08dafdaff186
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZC+0uSNRRrArMv5kUauZmZasAAfxKi7vLSK2MsNVpVONnIQb42Cb8gGPiBX31r0MMbKT0g6ITDWOo5RqgcQzWobEF3OUqHVj5CkOfGWQU+Tzgt8v8dxlbEzqm9KEZ6Tz0bAVUil43qM8/qb2086mWub8Q8iYkweVJZ9Ttpgq3ki1KQnK5ovr9fXvge2Nm7vpiecM4kbJ1/zAqflMdM09fGqrPOhxz6yNLWjETvkj3M34ERHF8ku+vUGGnmkHH2Hqm3md2u1uAdNox2Z6YhTWJiAscdUtVJxqnZT67Sta6j2W65Uh4/28QIn3E+iLUMr6yBHBpow/jyeARAqw6F3C/T3C8LsIpFN9a1yO5JG4U4IVe1e29t/RjguxW6O3Zi5l8jk+69KRMJRSPuwpupNZCBURbFYidO9Xo2VE+dn9AN0huo+k98TSL4a7+upVeqsUAhxUNGRgOcUWLVZtAY438IWreVtLOEcxK7Ce5zdIjKWScclLR2T+n9nAyixMbd8E2naL5NEfhKPKhgeBVQWfuBDGJQf82ALC3lXhHnDut12vWpCgy0qaZg4c9i3PCfyltalih65HnhlTWfffjgzy331m8PIL4oJD4w2QlfoSFM5pJ95iMcDzkHSpAPE+kZbUrlbXo/wqBGHefHW/WiSeFOSV3fOhaxZl5wpBM8HhNIiY+sv5DjER/zHcdWLzGxRm5n7Q2GleJzgkbHpzdsNaBQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB8426.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(136003)(366004)(346002)(376002)(39860400002)(451199015)(36756003)(86362001)(66556008)(2906002)(8936002)(66476007)(6916009)(66946007)(5660300002)(38350700002)(38100700002)(6486002)(54906003)(52116002)(4326008)(316002)(8676002)(41300700001)(478600001)(83380400001)(186003)(2616005)(6506007)(26005)(6512007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?RnsXDeJ4kqFIm+9spf8pHpDBY1D4p+O8SVrBIfePj2qZD+tt6ZncNh0HrKtx?=
 =?us-ascii?Q?d/wp41M8sZ+R2BEdhvScxdInGAVym+GBktqKGpw/Pkb9z3Mfrmm2pDSSvilq?=
 =?us-ascii?Q?ky4k0yeBMezPVM+RJkwbyuaOBA/5eFt/+c+zPR/3LWNXIOAtjmJaanglzsDY?=
 =?us-ascii?Q?ymVTLclJsrS82JGsc836ies7ruNSNpK6nkTv3rbmVBoZStTrrcG1IVxhNyRT?=
 =?us-ascii?Q?bhbt/ArMxF60MlVYNImvPpgm4rh2kpJwiMpE3I9BepAOu9FraHmnexPDde9b?=
 =?us-ascii?Q?5ZxX/5HcEs81FSEZgLuu4PraJTEtteUL3vwbYzeR1OF1KzyWnGttPq1hdQ//?=
 =?us-ascii?Q?9zU+Ju80THbbcANwKbd2R91jqaz/wDah90JN2FCtHJth9rOfxGATrXkZh7oi?=
 =?us-ascii?Q?yZuay6oxoAF6ctVPcRu6KpwlKdTBLcm75YN/BFTNLkPeOC7mPElTD28p5eUV?=
 =?us-ascii?Q?LIlsuwfsthpI5eMuL5eh+hCvF54n7Do7gzam4Nlkh8JuCP4qXAXfYrJI4ImJ?=
 =?us-ascii?Q?X6nJ4kFYU0rN8sSH4rWwtES5No0A3yyvd8sKbi+yfRaSghG1RFSm2Lfj6usR?=
 =?us-ascii?Q?QfA7PTxN1qHnZxR02zKwCVpes8TZNT7ud1E6jCAGr9pR80skuGMGDLuz/v0A?=
 =?us-ascii?Q?JHrncYkV0hd93iSn1ZAk7le0dNJw4A1bEApjqiV3UNTeNDYSDIpBwpqiPcvQ?=
 =?us-ascii?Q?axdPkL+bdl1+6z5HL6VcEZiRrLwMnz/HuOZ+kR8qtV49w1fJFg+3vnRrINn6?=
 =?us-ascii?Q?TQAOG4Gj9wK3Cn42CI6qaoIgnfluNgdCsZzFVH3BwdUbVn/oaasIB3tAgGUt?=
 =?us-ascii?Q?NLFx5YUah5BK3tAPNXVmnVXhBQcJFThBiBXGvSvpCbucr9/9JSs6Dq9GTf8P?=
 =?us-ascii?Q?zlMPr7/sv4ExlSXECQj+iH+AusnHThAph8cvYTa2YvcPmIBY70xEA2+Ly2jI?=
 =?us-ascii?Q?h6colQROHbGXmVvumIsmTCRSVLqGavYTX8UWlAr1Hl7CCoQHz1jUtMMOeoYd?=
 =?us-ascii?Q?i1XfMWimfdjT76o34PKLZX/7/2r85NxILmkRWcZ7cKBTnyrmqJ/tRazVqofD?=
 =?us-ascii?Q?dMm9ZlRPChe5jQtjwcSPqt2tE5gGpov0mD0mAlNAQyx3nYfR9aF6xveZJ/Ol?=
 =?us-ascii?Q?8GP49r0ala/70DjOA+gk2RvxszSCTOVUWBA87J8dzgI2be6jRiXh2nqsWnJb?=
 =?us-ascii?Q?L+lvs4XZdjvmM/TSaoUgtEfIn5lVpHfUwEyBfYh1j0bjj+nRdmptm80D6hnx?=
 =?us-ascii?Q?31G0o3cNUKvHAW5ehB4uwsJyij+J/bk4I5hI2Sp9KoTBqxGlEtAlH+ezB12B?=
 =?us-ascii?Q?DzE0EHVDIJ16UY//pD8PRto1U2nyqfjfFubsTHpRrMpp10XpwiS3EzAViXf4?=
 =?us-ascii?Q?51bBUTg7yqlLIruB85uiUQpavdpd/6CVVSgzkE9UErKbuK/3Mr98HjP5OxDM?=
 =?us-ascii?Q?WqivEKOolStjKR1UgbKaW1ig6Bpk4WhCPEC1AQ6kJU1Gqoh0fMdVhmo7tt5q?=
 =?us-ascii?Q?gx9Ful6RprZrWRRPirRcS94GZ3Ec7aV0hJHq0EI1iZ7LtNqttumEbeOobCkR?=
 =?us-ascii?Q?grmTGAUciP6/ARLhYIPBoxsqbm1zaombv4jjEF16mL+WT0HWyctNwBTZEVPF?=
 =?us-ascii?Q?HQh6nBUkcOaeulMPlsL4yYk=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 243fda16-9b14-4026-22d1-08dafdaff186
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2023 02:08:54.0800 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ki/n1zLbsXG/AQFqXiaiYYefanfxr8tmBlLzjOi3eR0MfARhS7i5Dd0UU88RVNSFqB5w7FHAUx0k2pPF4ovzhNpx0Y8hIG7b55pRxv/Xme3e1Narm7WjuRAoC7DqsKy7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB6128
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
Cc: Dmitry Osipenko <digetx@gmail.com>,
 Linux-ALSA <alsa-devel@alsa-project.org>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Current ASoC has many helper function.
This patch use it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/hdmi-codec.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/sound/soc/codecs/hdmi-codec.c b/sound/soc/codecs/hdmi-codec.c
index 74cbbe16f9ae..01e8ffda2a4b 100644
--- a/sound/soc/codecs/hdmi-codec.c
+++ b/sound/soc/codecs/hdmi-codec.c
@@ -518,7 +518,7 @@ static int hdmi_codec_hw_params(struct snd_pcm_substream *substream,
 				struct snd_soc_dai *dai)
 {
 	struct hdmi_codec_priv *hcp = snd_soc_dai_get_drvdata(dai);
-	struct hdmi_codec_daifmt *cf = dai->playback_dma_data;
+	struct hdmi_codec_daifmt *cf = snd_soc_dai_dma_data_get_playback(dai);
 	struct hdmi_codec_params hp = {
 		.iec = {
 			.status = { 0 },
@@ -562,7 +562,7 @@ static int hdmi_codec_prepare(struct snd_pcm_substream *substream,
 			      struct snd_soc_dai *dai)
 {
 	struct hdmi_codec_priv *hcp = snd_soc_dai_get_drvdata(dai);
-	struct hdmi_codec_daifmt *cf = dai->playback_dma_data;
+	struct hdmi_codec_daifmt *cf = snd_soc_dai_dma_data_get_playback(dai);
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	unsigned int channels = runtime->channels;
 	unsigned int width = snd_pcm_format_width(runtime->format);
@@ -597,7 +597,7 @@ static int hdmi_codec_prepare(struct snd_pcm_substream *substream,
 static int hdmi_codec_i2s_set_fmt(struct snd_soc_dai *dai,
 				  unsigned int fmt)
 {
-	struct hdmi_codec_daifmt *cf = dai->playback_dma_data;
+	struct hdmi_codec_daifmt *cf = snd_soc_dai_dma_data_get_playback(dai);
 
 	/* Reset daifmt */
 	memset(cf, 0, sizeof(*cf));
@@ -834,7 +834,8 @@ static int hdmi_dai_probe(struct snd_soc_dai *dai)
 	if (!daifmt)
 		return -ENOMEM;
 
-	dai->playback_dma_data = daifmt;
+	snd_soc_dai_dma_data_set_playback(dai, daifmt);
+
 	return 0;
 }
 
@@ -891,7 +892,7 @@ static int hdmi_dai_spdif_probe(struct snd_soc_dai *dai)
 	if (ret)
 		return ret;
 
-	cf = dai->playback_dma_data;
+	cf = snd_soc_dai_dma_data_get_playback(dai);
 	cf->fmt = HDMI_SPDIF;
 
 	return 0;
-- 
2.25.1

