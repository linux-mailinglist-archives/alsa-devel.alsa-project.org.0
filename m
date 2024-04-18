Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C9FE8A91E2
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Apr 2024 06:15:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 819B0DF6;
	Thu, 18 Apr 2024 06:15:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 819B0DF6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1713413737;
	bh=Kxnd0H32+e6C7IlRBgHhSR7C2uOPz+1yIkoySGVqFOE=;
	h=To:In-Reply-To:References:From:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=bINoU/daEF9ALUqSXBb2Ym15BxRuiRVvcPDkn8MNzZLh8SjVOVOuZpcVwO3ej4Ean
	 Y3I7aOv+dX56KErefQaR0ZaIlPPfLl+mF6sG8/nVjbeoiWeqkWRJX2jIsUN+Kj04wS
	 9ZCzstprnpVwS2g0/nlPQJJMv5k56j1P5Vl8JmaI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B13E5F80494; Thu, 18 Apr 2024 06:14:38 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B3457F80610;
	Thu, 18 Apr 2024 06:14:37 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 29C5BF8025A; Thu, 18 Apr 2024 06:13:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20600.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:201a::600])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id F26F5F80568
	for <alsa-devel@alsa-project.org>; Thu, 18 Apr 2024 06:13:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F26F5F80568
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=ezLExBLU
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dNUcba1jkJ10WF4D7hwNQJHOanL9ZZMWY2+VAnWfJbaO+J+I3IdgsFDO+ohsuUjXx8p+y0PPwBihrOX/Fp9nJgaBcyXF+VT+H5+/3SKhdJwpiDJk9kAYNOrPYfPSS2luxW5We+3NgBCicO6YFiWIH2Cr/Ed1sPd6KeQ3IvscXOcGY17Y88j8m88v9lmNcJ6HB7k8iGydfwTQa6zxbxYujQABBTMVlgyvJB2TUQMfzBkDD+rnMY6AK3veu6LUcLHw2lAu/t8lvV3JFOG6eDrGUuWU9oarBbG6Mrcfz8Aev+NtNllJVRAe/P8Al/Fb2mscUFnqUy5k4q8msaTAt+/A6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fsy4flBypaWLZ/M2nrPYJYJ/3wDyjmftOvHiS1GzmgM=;
 b=UCbNYyITfZht+FJsQFE7MheYv5JPdFXcYpdf7vdMX5y4jDiT8T2ikWK/fDbsiqao0cINtoOBed2z8971ynSmo8USfFWPXq6lYHEnI8xZ4AhV0opB97B0fqawWumNlD5lWqkPAFpG5lheU7T/3pR0RcorqHUAafF0NeNZPcDA/vL6x3yHRl/D6I/ckBLdPEu8b21uFRmN1mG9v2D9Pd9Gbs1ilC2yTeBDoceSQDZB/o0aJVQs4I80s+tjX8zVUDEaYcwZzCLyD81Jr5ivSVFphrTgbmaX1ltljnkhetVpMXAOwwlNza4jGkJqZPYkzwz2rQ2oVcRq5xGGw1og3EweZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fsy4flBypaWLZ/M2nrPYJYJ/3wDyjmftOvHiS1GzmgM=;
 b=ezLExBLU9sSYXp8i3QecoaVYNwRq6D+h+zCv/Z0evlTjhxgxOfWgOmBo+NfffaFdMEUGaXZ2XfidM0dc9PrTxYQ9A9nNhiPayWlDiL/unJ53isdPV52mYmmm+K9vjHMOSCdpPS8UhnyIS78yGZIM+2Aq1/tByoQBClbrXVR4Ih8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSAPR01MB7397.jpnprd01.prod.outlook.com
 (2603:1096:604:142::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.39; Thu, 18 Apr
 2024 04:13:07 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::131e:55c0:a4a0:713b]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::131e:55c0:a4a0:713b%7]) with mapi id 15.20.7472.037; Thu, 18 Apr 2024
 04:13:07 +0000
Message-ID: <87a5lr8g19.wl-kuninori.morimoto.gx@renesas.com>
To: =?ISO-8859-2?Q?=22Amadeusz_S=B3awi=F1ski=22?=
 <amadeuszx.slawinski@linux.intel.com>,	Alexandre Belloni
 <alexandre.belloni@bootlin.com>,	Alper Nebi Yasak
 <alpernebiyasak@gmail.com>,	AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>,	Banajit Goswami
 <bgoswami@quicinc.com>,	Bard Liao <yung-chuan.liao@linux.intel.com>,	Brent
 Lu <brent.lu@intel.com>,	Cezary Rojewski <cezary.rojewski@intel.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,	Claudiu Beznea
 <claudiu.beznea@tuxon.dev>,	Cristian Ciocaltea
 <cristian.ciocaltea@collabora.com>,	Daniel Baluta <daniel.baluta@nxp.com>,
	Hans de Goede <hdegoede@redhat.com>,	Jaroslav Kysela <perex@perex.cz>,
	Jerome Brunet <jbrunet@baylibre.com>,	Jiawei Wang <me@jwang.link>,	Jonathan
 Corbet <corbet@lwn.net>,	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Kevin Hilman <khilman@baylibre.com>,	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,	Maso Huang <maso.huang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,	Neil Armstrong
 <neil.armstrong@linaro.org>,	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,	Pierre-Louis Bossart
 <pierre-louis.bossart@linux.intel.com>,	Ranjani Sridharan
 <ranjani.sridharan@linux.intel.com>,	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,	Sylwester Nawrocki
 <s.nawrocki@samsung.com>,	Takashi Iwai <tiwai@suse.com>,	Vinod Koul
 <vkoul@kernel.org>,	Xiubo Li <Xiubo.Lee@gmail.com>,
	alsa-devel@alsa-project.org,	imx@lists.linux.dev,
	linux-doc@vger.kernel.org,	linux-sound@vger.kernel.org
In-Reply-To: <87h6fz8g3u.wl-kuninori.morimoto.gx@renesas.com>
References: <87h6fz8g3u.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v3 05/23] ASoC: fsl: Replace dpcm_playback/capture to
 playback/capture_assertion
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 18 Apr 2024 04:13:06 +0000
X-ClientProxiedBy: TYCP286CA0348.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:7c::11) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSAPR01MB7397:EE_
X-MS-Office365-Filtering-Correlation-Id: 2af238a9-8d4c-4c8e-aea1-08dc5f5dda20
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	KGex6StHamwj2njPRfJRX/Dyi5MOA19GF21+18bsakn2vLULxE0ER7iKlx2nJMZe09/822GWZkS2WBgDAO+3IZwqrqVZtRJeJ3Pmo0IyzWIVagDlyOHkVIeioKxTrgzGtdOTERtlHcAfe8kymWvuUZltoMJr9KxGfBZ6Zyzu5sKC48400hr8kKQ6t/xIPZxav6Y9Z1FIS4z0inB1cqgHidnj+xaGbr0cUvz+r7vgKyZXwHiD0qBw7F76A4FLJVCYUDrA/e/r2eCQDl+AQpcpxWRGp8FEmwUiwsMRUjvts0ba+yRjhz84krxvjE3mPC2dy8r3hzCFxMP9thPh0g3lbr/cVQaGEEylH1+sLNoU173Rl6cBN3qHKS9RTsxZVoV/B2bGpd3b3Xb4xiMN/R04QlmvUVITuTxwyUNSpWKghl6LpDxXQAaN9ihqdVBCjHuOK/hKSHt90XlmAVTIdP3GOKF1Dn0s9m/Me0Yxn63UA/bbXm/kWeR9hH0P1eOSY4l/KAbik48mFntlB8W25vmyWSxqMpI/f8T2R1rpGNAtgGXVAMh167hKd8t2wUmnA/6/7QpX+6e5jZ17yNnRnw3Ve3ngk/HAnKP3kxny5jIbiiZeENsMy74JO1ZnZ/dfUuwiuXk6vq+rUFHxadTYLlT4ndJb4BaUhp6DlBObfaii42RL6fg8X/xOUqDr5HtHSKC8IcbuDYFSte9SZ5XeVuLD3obW114jKT8ECR2vgc3znW0=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(52116005)(7416005)(1800799015)(376005)(366007)(38350700005)(921011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?jaJg+teJeA4AHzODyg+/bUhpva2t4Lf/b/nwu6LoN+Hh+8I/C6GUOcGwPZBH?=
 =?us-ascii?Q?GEIU7HVge0t6qwxwYhG72dDRBfgsznW4u5otMqWuAVEX6pv7PeMkYFv+affQ?=
 =?us-ascii?Q?Rnl4UASIQRjEAUzlCqoS4VufAAk49Zi1T19vcYECfXYUeHjBNjxFzASCYGMr?=
 =?us-ascii?Q?qaoN/6qPr87/LBCkcczWC2Vkr7VKvox/BzKPBMFGb+RL0GaaRyXIDG57YttH?=
 =?us-ascii?Q?hBoagGH6T3hKZa//8s8pBZfdSMa77uZYeKZYP3sqEfEiXeKhcxpYq6zz+QbV?=
 =?us-ascii?Q?gq7nPO0VnNMoYQiZl68xXoDZhXi7Kxz/QwU4OFPGToK1Iu/noGlF3h0zAEbo?=
 =?us-ascii?Q?n49XQ3tmwkaTdKo8bYzuVgvDs6sd7nw59nCHLetwxDMuZUYdUZhmGuAupzhq?=
 =?us-ascii?Q?IZMOqXKqzOM5KAVE3IxyUu1IOYtZQZ+wkLXUd5JSE8r7mlfsc169x6YnuWnz?=
 =?us-ascii?Q?56Iqrat0z2yf/nzk8P4MBYAQfPj+FpeqtQV5nE5b33dW7WybizIXXapzLt8Y?=
 =?us-ascii?Q?CnKsxlkS8hf2cOGM13lIo94FvmhfJRb36GQlQnkjMiouQT1rqIyH6JU0oRCO?=
 =?us-ascii?Q?6Mk3xo6lqoeRme424UYIZvlpJqG8z4SqNE8qpKVW2cRc6xW56IOpHlBaXQ58?=
 =?us-ascii?Q?lp7xlngNsQt4K7n3lvE0RkvSx7ZpFC8WpwyoRAaNxH+6r6tMpYOYsEg9UNrK?=
 =?us-ascii?Q?RyIXGMKXmuRwNRCQpumm/Yx5km3B1cgSz4YzZ6p3PRK3SVh8RMCLXi1w3nr6?=
 =?us-ascii?Q?HOhzE/UsYIUupWcrURDsxz26yw8rsq30xv4qlVYKnF3Vo9Aj3E9Y3GWSED8W?=
 =?us-ascii?Q?TDZVOsNAY2S20hfSs2RQqg+MgRdgIocwvlA+e8JkPF1DrDxoAPv2FuiwVcd0?=
 =?us-ascii?Q?Yubz7CozNR42RZKS02l+s6ylKLP1WxzerEd4/TQgHngcuKsQ9wmo2JQ+X1gG?=
 =?us-ascii?Q?745NNiwE59QSVen92LA3p12Uwpn+urAi9w/FB43aNP1jtGhdcl8UYO0u2+Ik?=
 =?us-ascii?Q?NlBzUfuHisCjXNe91nJSploJunwhU9VPsxk6WaMGcHi37I1NbwunIyy+iD54?=
 =?us-ascii?Q?Hy/a8IER45Y0Y5gF6w1vhhVJjIOJB8v9BEKiuE2jS7HEV2jaeI98SD5g8uDX?=
 =?us-ascii?Q?KFPqb79tSez/dTKGeGyEUEDtKbh63MorcN78dge+i1ouRq9SJiyzaBK1gZQr?=
 =?us-ascii?Q?V4cmYO93l8wAURIJ74K8ca65NMaIrh+XUHmLjMiWoykHnSuFAqxQqCLeYHzx?=
 =?us-ascii?Q?N8k21oIpHHlTEjWjUlXOIvmeT05L0lIAqCe2fiZL6KCmxPezkgZViaz+JxcZ?=
 =?us-ascii?Q?/hsKv+MErVGFTkgR+EVQMDihWABg14VfJu7wn7XA+/NY5qnCWGSAJLQIqkFn?=
 =?us-ascii?Q?qknk9Xs9nZFxC16NxSfimv4O+GDHwZYsDd2OfR51ARmVnoPboHkrYhpOo4s/?=
 =?us-ascii?Q?AnAhmXH9kKChYQxTtQWiUKDloRNuh+nYOQulfwKrbrLJ5BcbIRhvttN0qaaa?=
 =?us-ascii?Q?v+EjNLTuhliJ2CY+I25HfnsMBmZk4xH1QFq+qn9ySGISTsUwjjTgXLl0afEe?=
 =?us-ascii?Q?O5OJPWtjCqHPJ/sYvRFHGqzsrQ1jKGDBQcGaOOL/yvlg2r3qWPVLnUZL2pTa?=
 =?us-ascii?Q?PdUKr/zSeCyGI8yZgCQFKU8=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 2af238a9-8d4c-4c8e-aea1-08dc5f5dda20
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2024 04:13:07.6763
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 gbHtBae41QmCvDMgmc4qBXRWSsy1KuXY05fzaN1rTBupzvWRiJPZ6qcyR0PpXv0WHFF1rN5M23Y4tUOCCTEMHUnzKEmBK54HzEMsODhXi8EVEaZKX2fRf7CEEYylWmaZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSAPR01MB7397
Message-ID-Hash: MERAOKIGEJW6OKVJE3GPEN7LTHNJPOLY
X-Message-ID-Hash: MERAOKIGEJW6OKVJE3GPEN7LTHNJPOLY
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MERAOKIGEJW6OKVJE3GPEN7LTHNJPOLY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

soc_get_playback_capture() is now handling DPCM and normal
comprehensively for playback/capture stream in same code.
This patch converts dpcm_xxx flag to xxx_assertion.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/fsl/fsl-asoc-card.c | 20 ++++++++++----------
 sound/soc/fsl/imx-audmix.c    |  8 ++++----
 sound/soc/fsl/imx-card.c      |  4 ++--
 3 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/sound/soc/fsl/fsl-asoc-card.c b/sound/soc/fsl/fsl-asoc-card.c
index f6d2564864c6..50ca3e72eb21 100644
--- a/sound/soc/fsl/fsl-asoc-card.c
+++ b/sound/soc/fsl/fsl-asoc-card.c
@@ -320,8 +320,8 @@ static const struct snd_soc_dai_link fsl_asoc_card_dai[] = {
 	{
 		.name = "HiFi-ASRC-FE",
 		.stream_name = "HiFi-ASRC-FE",
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
+		.playback_assertion = 1,
+		.capture_assertion = 1,
 		.dynamic = 1,
 		SND_SOC_DAILINK_REG(hifi_fe),
 	},
@@ -330,8 +330,8 @@ static const struct snd_soc_dai_link fsl_asoc_card_dai[] = {
 		.stream_name = "HiFi-ASRC-BE",
 		.be_hw_params_fixup = be_hw_params_fixup,
 		.ops = &fsl_asoc_card_ops,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
+		.playback_assertion = 1,
+		.capture_assertion = 1,
 		.no_pcm = 1,
 		SND_SOC_DAILINK_REG(hifi_be),
 	},
@@ -649,8 +649,8 @@ static int fsl_asoc_card_probe(struct platform_device *pdev)
 	} else if (of_device_is_compatible(np, "fsl,imx-audio-tlv320aic31xx")) {
 		codec_dai_name = "tlv320dac31xx-hifi";
 		priv->dai_fmt |= SND_SOC_DAIFMT_CBS_CFS;
-		priv->dai_link[1].dpcm_capture = 0;
-		priv->dai_link[2].dpcm_capture = 0;
+		priv->dai_link[1].capture_assertion = 0;
+		priv->dai_link[2].capture_assertion = 0;
 		priv->cpu_priv.sysclk_dir[TX] = SND_SOC_CLOCK_OUT;
 		priv->cpu_priv.sysclk_dir[RX] = SND_SOC_CLOCK_OUT;
 		priv->card.dapm_routes = audio_map_tx;
@@ -676,15 +676,15 @@ static int fsl_asoc_card_probe(struct platform_device *pdev)
 		priv->dai_fmt = SND_SOC_DAIFMT_LEFT_J |
 				SND_SOC_DAIFMT_CBC_CFC |
 				SND_SOC_DAIFMT_NB_NF;
-		priv->dai_link[1].dpcm_capture = 0;
-		priv->dai_link[2].dpcm_capture = 0;
+		priv->dai_link[1].capture_assertion = 0;
+		priv->dai_link[2].capture_assertion = 0;
 		priv->card.dapm_routes = audio_map_tx;
 		priv->card.num_dapm_routes = ARRAY_SIZE(audio_map_tx);
 	} else if (of_device_is_compatible(np, "fsl,imx-audio-wm8524")) {
 		codec_dai_name = "wm8524-hifi";
 		priv->dai_fmt |= SND_SOC_DAIFMT_CBC_CFC;
-		priv->dai_link[1].dpcm_capture = 0;
-		priv->dai_link[2].dpcm_capture = 0;
+		priv->dai_link[1].capture_assertion = 0;
+		priv->dai_link[2].capture_assertion = 0;
 		priv->cpu_priv.slot_width = 32;
 		priv->card.dapm_routes = audio_map_tx;
 		priv->card.num_dapm_routes = ARRAY_SIZE(audio_map_tx);
diff --git a/sound/soc/fsl/imx-audmix.c b/sound/soc/fsl/imx-audmix.c
index 2aeb18397bcb..ca768375e7c7 100644
--- a/sound/soc/fsl/imx-audmix.c
+++ b/sound/soc/fsl/imx-audmix.c
@@ -258,8 +258,8 @@ static int imx_audmix_probe(struct platform_device *pdev)
 		priv->dai[i].cpus->of_node = args.np;
 		priv->dai[i].cpus->dai_name = dev_name(&cpu_pdev->dev);
 		priv->dai[i].dynamic = 1;
-		priv->dai[i].dpcm_playback = 1;
-		priv->dai[i].dpcm_capture = (i == 0 ? 1 : 0);
+		priv->dai[i].playback_assertion = 1;
+		priv->dai[i].capture_assertion = (i == 0 ? 1 : 0);
 		priv->dai[i].ignore_pmdown_time = 1;
 		priv->dai[i].ops = &imx_audmix_fe_ops;
 
@@ -283,8 +283,8 @@ static int imx_audmix_probe(struct platform_device *pdev)
 		priv->dai[num_dai + i].cpus->of_node = audmix_np;
 		priv->dai[num_dai + i].cpus->dai_name = be_name;
 		priv->dai[num_dai + i].no_pcm = 1;
-		priv->dai[num_dai + i].dpcm_playback = 1;
-		priv->dai[num_dai + i].dpcm_capture  = 1;
+		priv->dai[num_dai + i].playback_assertion = 1;
+		priv->dai[num_dai + i].capture_assertion  = 1;
 		priv->dai[num_dai + i].ignore_pmdown_time = 1;
 		priv->dai[num_dai + i].ops = &imx_audmix_be_ops;
 
diff --git a/sound/soc/fsl/imx-card.c b/sound/soc/fsl/imx-card.c
index 9c7e24cebd7b..873f6f89dcf5 100644
--- a/sound/soc/fsl/imx-card.c
+++ b/sound/soc/fsl/imx-card.c
@@ -814,8 +814,8 @@ static int imx_card_probe(struct platform_device *pdev)
 		}
 		for_each_card_prelinks(&data->card, i, link) {
 			if (link->dynamic == 1 && link_be) {
-				link->dpcm_playback = link_be->dpcm_playback;
-				link->dpcm_capture = link_be->dpcm_capture;
+				link->playback_assertion = link_be->playback_assertion;
+				link->capture_assertion  = link_be->capture_assertion;
 			}
 		}
 	}
-- 
2.25.1

