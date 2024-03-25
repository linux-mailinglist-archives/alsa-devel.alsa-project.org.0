Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C148888D4C
	for <lists+alsa-devel@lfdr.de>; Mon, 25 Mar 2024 05:44:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ABDD31928;
	Mon, 25 Mar 2024 05:44:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ABDD31928
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1711341893;
	bh=Y8bv7LO+8iPaPvEGVYXI7MbBbezS2N4piXRp9YFR15w=;
	h=To:In-Reply-To:References:From:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=XXCHUwaidgh2NjJc2LlBhUsPIkJA4QuYZl8b594ORHnzJ/S5SbpDd/qCsdkEBO0+p
	 ynoCfw0NLuIIZPhc1QV/tQihCLHD73DYplk4UdKqNKW+g/VbqsquF/BHqMblMEWp+4
	 hKgzXc+IbZ5jjiUAaONjjO7VrDcBegUG3CLTb8JU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7F8C6F80675; Mon, 25 Mar 2024 05:43:10 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id F1318F80690;
	Mon, 25 Mar 2024 05:43:07 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3E778F802DB; Mon, 25 Mar 2024 05:37:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=unavailable
	autolearn_force=no version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on20600.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2019::600])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0B5C4F80236
	for <alsa-devel@alsa-project.org>; Mon, 25 Mar 2024 05:37:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0B5C4F80236
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=Zue5Jw9R
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cltThmqctn9mOAqqip7WiC2+N1MxIbbb98TiSHLIo0yDx1cojpJ7EdEuLvP8PFQeUj3sVGs9i+JBsLamwzwpKM35VrBs6ljVZlfVk4yWDgOcis80Ke/cDpPfVdvE2uQUxgds9IXOazwFYpfb3U435LtASFUzqzrfzvgfKK58+2ceC88BSFEkpyQYgLJXz79q+0qJAwd5IlIn59KQjHLThfLTyOr23sVmJSff/R5uVVEDob3AL5eHFGWHaN25f++C6QjzY4DVVzR/TISSVjxJtBrG/oshkYN2iNYuuER9dVGgkTHP1F1+zFeVCOI6bD+1Fmsl4jz+CHim2vlUb3V/OQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ndJqpDAcFeambkWRz30iOvqkQXrFwApplExAHPWuUIM=;
 b=GuHIBJDDLXxGN88mpDu4Jg1KCNHfpYa5F8/FWxspZCvFUI95U/Yv6RPuuBztgF1UbPfq08nh+SXz4l+7BVCeIhic2C72p3sU1VYUQ/urUc0dEU565+t7Ir01ovgr8NccPheH2qBsm7Zow8rLh8wMR+OoIulx6QuHq6RCmI44GpM3xg36RKqW+g9ZPduDtlviuznMMvPlr738qsQ9BjCPHziE0jqZdm35gO4XWKH78UPzYKsJahYX/o65JVRKjHtpLiUqWf+YcdJaUyb2v4Fi3ajJoSqFOQxJ15IS9I8SlktagiZVR2C9U6S1gDyaWZACvixnlQ0OwFGnUP4EpM59Hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ndJqpDAcFeambkWRz30iOvqkQXrFwApplExAHPWuUIM=;
 b=Zue5Jw9RlSLxDiuc+uu6tk32Y2FKXSVRZQvCJ8n6/Zt53fsgVLucjbeSJppAIkEDxriTRwZBzuQHt+tajzBxgTbWmE5/In+rBPiWPjr+vDCmB3IQVuUYQcFTclFYIi+g1eg3VLMSYsyldY866yJBhOUVVIChz/tCJrnLLdfbv/0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS3PR01MB9512.jpnprd01.prod.outlook.com
 (2603:1096:604:1cb::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.31; Mon, 25 Mar
 2024 04:37:05 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::131e:55c0:a4a0:713b]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::131e:55c0:a4a0:713b%7]) with mapi id 15.20.7386.025; Mon, 25 Mar 2024
 04:37:05 +0000
Message-ID: <87bk7353m7.wl-kuninori.morimoto.gx@renesas.com>
To: =?ISO-8859-2?Q?=22Amadeusz_S=B3awi=F1ski=22?=
 <amadeuszx.slawinski@linux.intel.com>,	Alper Nebi Yasak
 <alpernebiyasak@gmail.com>,	AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>,	Banajit Goswami
 <bgoswami@quicinc.com>,	Bard Liao <yung-chuan.liao@linux.intel.com>,	Brent
 Lu <brent.lu@intel.com>,	Cezary Rojewski <cezary.rojewski@intel.com>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,	Daniel Baluta
 <daniel.baluta@nxp.com>,	Hans de Goede <hdegoede@redhat.com>,	Jaroslav
 Kysela <perex@perex.cz>,	Jerome Brunet <jbrunet@baylibre.com>,	Kai Vehmanen
 <kai.vehmanen@linux.intel.com>,	Kevin Hilman <khilman@baylibre.com>,	Liam
 Girdwood <lgirdwood@gmail.com>,	Linus Walleij <linus.walleij@linaro.org>,
	Mark Brown <broonie@kernel.org>,	Maso Huang <maso.huang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,	Neil Armstrong
 <neil.armstrong@linaro.org>,	Peter Ujfalusi
 <peter.ujfalusi@linux.intel.com>,	Pierre-Louis Bossart
 <pierre-louis.bossart@linux.intel.com>,	Ranjani Sridharan
 <ranjani.sridharan@linux.intel.com>,	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,	Sylwester Nawrocki
 <s.nawrocki@samsung.com>,	Takashi Iwai <tiwai@suse.com>,	Trevor Wu
 <trevor.wu@mediatek.com>,	Vinod Koul <vkoul@kernel.org>,	Xiubo Li
 <Xiubo.Lee@gmail.com>,	alsa-devel@alsa-project.org,	imx@lists.linux.dev,
	linux-sound@vger.kernel.org,	linux-stm32@st-md-mailman.stormreply.com
In-Reply-To: <87o7b353of.wl-kuninori.morimoto.gx@renesas.com>
References: <87o7b353of.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 09/15] ASoC: Intel/avs: replace dpcm_playback/capture to
 playback/capture_only
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 25 Mar 2024 04:37:04 +0000
X-ClientProxiedBy: TYCPR01CA0201.jpnprd01.prod.outlook.com
 (2603:1096:405:7a::18) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS3PR01MB9512:EE_
X-MS-Office365-Filtering-Correlation-Id: d493e754-09b2-43aa-0660-08dc4c853901
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	mOt/yfjISuesAhnFODSkiinCtG+eRWN9kjl46lyLgTNWn6p0HU8NyRLnGIGJqHmP1BcKWuN+XVebD9CQmmCirHwNHbcQvTxlBgOUHm/hOpRtPJGePLrQcbNx3/Ejli8PiA0Y/G5RYARDIWksAPTtHNOzKHzheNveOO6253agCJ6pfn1L12zjY6Q/rnC+5Edd+1d5dyV7iW8/AjVx/v+haKA7Ei1yDi68sfTTF4YByAT3uvbDFWtPxhRdF/b1HpECs8f2+T1Vhnwn7L5KKptWocpR2k6sDXPjY4HVtwjRx/T5MJbXOHsmL5uU2oip5Y0Jk8o1au7XKzEsolHnKqNHE9VWlniX6SQCNO/eaD4KMD0cmObvw/RuGlqcCOPjDq/XoKb3O+g0Nn1y9w4a+FxWd6ZCjF3xUb+aUgGKeUy1s+k5QDC+gbpIOEU2ljXqOtu9k9ACXC+RjRsFsYcyRXRJ61XW8HxvychPLvAcAUhSk/099mWi3xkDrDGJJTLTvutFmPPLVRRDHj+s4lZ0JHXzy/fgP5yZU9iBEFZYtVswA9IDLDiTJaXbYEBn6twlDEIv44gvlw8IIKiCHOZ1HGV/V524pGo5TA73IZqcSnJpOyT1LSdFeNoy6BPCky4GFNcuKX7ThByb6rPHTX6YYB8KtcDj4Dsuc7+1R4x67BQfishwpS5uq77nNLXLtxDR9cgHZWiqe4qI16nnwtrZe2df0HoI+YnUYFvsyEvMW8cEv74=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7416005)(52116005)(1800799015)(376005)(366007)(38350700005)(921011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?MUh1Gd58o8sIXQnJyj78Ajq5szir/P0tKMr1LjlSm8PIfC6/mqSFjkjRbSYd?=
 =?us-ascii?Q?Q/fl7gbkw+3xfbdZ40l5AUiq0L90JalkKESDVcxBLa9KntFU6xZd+Kdn5m85?=
 =?us-ascii?Q?ULk1nJKF5oZ+EJ2V9rUmDd7StlKSkD0pZOUTrR/5T3ojSe1WQTflBMy6Bzgq?=
 =?us-ascii?Q?5/OZxAY8D72gcw33HPdZoNzSkTrLvvgdIWYE4aaslwe/TJQZk69aL7G8jtz7?=
 =?us-ascii?Q?t672yHeHKlbXf4h8bp0vdIejaMhKDo3RNqDBmvRyJU5iMNgXR8MsmZZpBp3h?=
 =?us-ascii?Q?0yzrgy85tRojmlaOfHqMdeaMWsDNxECFO40qosoOy2VOkMxbuHSyBqe5JdCb?=
 =?us-ascii?Q?z9bBoMDfSoBE029S31I2B0bNzr9eyovZFf8s7bapUK71ztQgbM/eYLP1LDFO?=
 =?us-ascii?Q?TcCz3NaznLxwYnHQ1vlNJor7pEPXVH4nh+SmwKp8mfMdRNHG++eADW47b3iq?=
 =?us-ascii?Q?f8kR+Idmq5JDfsXMRfHTLfckua00ewGzfU3B+kiBd3QG8mSiKHESaqhJcdHI?=
 =?us-ascii?Q?loAp0L2Kz7udlPoMgzfUALhRAKFG0QBK/pGmjtXPOdofE86UI1sAfALuCLGy?=
 =?us-ascii?Q?st9PkBTDfRcDZCMwN8Dx0CQ857Kf8jc65e7fia+V048II/IIkk5qsoXV46yP?=
 =?us-ascii?Q?A+wMB8c8hw1UO/13p0UBFQzp1RHRVSnXsIr9zewkRCFbmX8zLpclHi3Da/3x?=
 =?us-ascii?Q?1SRTS8JKpgAARtJawPVr6ExgWOpViHkiNbd7OjnWvnTBIyAtLetG6xr4fok9?=
 =?us-ascii?Q?u4kQ21fONh2M4xP5OglB2O3PpvFr/1Zop1p/0YLeEpKGaiDWmAwGAMQeQ7Ka?=
 =?us-ascii?Q?EpTh0czMnqRCBXyJ9XLoyOrs2MzLwOoMqmQ9kNwzXWdx5QXQzSuTsaZJ2jXY?=
 =?us-ascii?Q?dBfJSbSxZFjMMcFx3mR2p3l6XanvOH0fwwYCszI+a3mvuJsDboUtq9+ZFal9?=
 =?us-ascii?Q?IhEcZGEfNiE7lGcuIbNLCE/IHNu+nXg7TY5cABYRj97g96tkclq6S6jbGA54?=
 =?us-ascii?Q?HxSo3vlBdija6/nefQFeS38NaQhf8KPxGQVFjviUcQWP8DW8fUZ5nUKs9gyK?=
 =?us-ascii?Q?L/U1RDmaYZVQvYj9jyBIDneXxzghRXkUZg9U4bpThr2G/KSREiq895v2/Hgx?=
 =?us-ascii?Q?lj61BIfkW6N7uX5hhWXCQ3xk5dPrx8jkVFDM3akaA4FrDVuBd+ouBB9dYKro?=
 =?us-ascii?Q?pt859uAGb9qvlwkRpq7pc96fJ2VnqRMVYTUyhVeArEwe67kKEtYjcWHgVhei?=
 =?us-ascii?Q?B521BHkLniXU0zmhdKaacm2K6lHmoZeUnshEOm/F2HbrN9wrl+3nfikiXX+D?=
 =?us-ascii?Q?0N5W2yV2NtVXWbNmh8C5QsyPdvSmEYb+CMh1bvPNpCBGKjndMKVIW9rz8vyA?=
 =?us-ascii?Q?Ldaj70FgmL5Mx4KgIUiu/ye7Szs72Dom0a0eVNetDw9UeMRp5vxa7k3dQ7kV?=
 =?us-ascii?Q?5GU4gtcelXUfznaMnsrFmiQN/vFyFML680J1AwYDt1XJkKqIsQF745USkFX2?=
 =?us-ascii?Q?X3XOXeGUmTs1KijT1ajbYzaPoHG8PwpH/berbYHUX4vWUCfCv1yEmZqqiOcU?=
 =?us-ascii?Q?yqm0p+tVq6YWtWUWRq/pl7sEnffdGZ18mk0Gvn7IDQfd4sTN5ICHnXiBaEe2?=
 =?us-ascii?Q?mLVMXYK1PtRvTMk83bv3vco=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 d493e754-09b2-43aa-0660-08dc4c853901
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2024 04:37:05.1239
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 tC4P7Fh+TrNzeuEoFrLcN5A4zdijir0aZS/pkQYGrBKpZHRNSmYWwgJHdF3J/IRhOQXHI9a/ufy+LjVUAIgoXoQfsG5bMds04eytwf+38lCTkRHY7XFDquK6mnJmgGEy
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB9512
Message-ID-Hash: ZXSJMBE2KN6LATZSIJ6NHOWPUV4YZCNI
X-Message-ID-Hash: ZXSJMBE2KN6LATZSIJ6NHOWPUV4YZCNI
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZXSJMBE2KN6LATZSIJ6NHOWPUV4YZCNI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

soc_get_playback_capture() is now handling DPCM and normal comprehensively
for playback/capture stream. We can use playback/capture_only flag
instead of using dpcm_playback/capture. This patch replace these.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/intel/avs/boards/da7219.c    | 2 --
 sound/soc/intel/avs/boards/dmic.c      | 4 ++--
 sound/soc/intel/avs/boards/es8336.c    | 2 --
 sound/soc/intel/avs/boards/hdaudio.c   | 4 ----
 sound/soc/intel/avs/boards/i2s_test.c  | 2 --
 sound/soc/intel/avs/boards/max98357a.c | 2 +-
 sound/soc/intel/avs/boards/max98373.c  | 2 --
 sound/soc/intel/avs/boards/max98927.c  | 2 --
 sound/soc/intel/avs/boards/nau8825.c   | 2 --
 sound/soc/intel/avs/boards/rt274.c     | 2 --
 sound/soc/intel/avs/boards/rt286.c     | 2 --
 sound/soc/intel/avs/boards/rt298.c     | 2 --
 sound/soc/intel/avs/boards/rt5514.c    | 2 +-
 sound/soc/intel/avs/boards/rt5663.c    | 2 --
 sound/soc/intel/avs/boards/rt5682.c    | 2 --
 sound/soc/intel/avs/boards/ssm4567.c   | 2 --
 16 files changed, 4 insertions(+), 32 deletions(-)

diff --git a/sound/soc/intel/avs/boards/da7219.c b/sound/soc/intel/avs/boards/da7219.c
index c018f84fe025..2b4c8983545a 100644
--- a/sound/soc/intel/avs/boards/da7219.c
+++ b/sound/soc/intel/avs/boards/da7219.c
@@ -203,8 +203,6 @@ static int avs_create_dai_link(struct device *dev, const char *platform_name, in
 	dl->exit = avs_da7219_codec_exit;
 	dl->nonatomic = 1;
 	dl->no_pcm = 1;
-	dl->dpcm_capture = 1;
-	dl->dpcm_playback = 1;
 
 	*dai_link = dl;
 
diff --git a/sound/soc/intel/avs/boards/dmic.c b/sound/soc/intel/avs/boards/dmic.c
index ba2bc7f689eb..49c18a8de997 100644
--- a/sound/soc/intel/avs/boards/dmic.c
+++ b/sound/soc/intel/avs/boards/dmic.c
@@ -22,7 +22,7 @@ static struct snd_soc_dai_link card_dai_links[] = {
 	{
 		.name = "DMIC",
 		.id = 0,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		.nonatomic = 1,
 		.no_pcm = 1,
 		SND_SOC_DAILINK_REG(dmic_pin, dmic_codec, platform),
@@ -30,7 +30,7 @@ static struct snd_soc_dai_link card_dai_links[] = {
 	{
 		.name = "DMIC WoV",
 		.id = 1,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		.nonatomic = 1,
 		.no_pcm = 1,
 		.ignore_suspend = 1,
diff --git a/sound/soc/intel/avs/boards/es8336.c b/sound/soc/intel/avs/boards/es8336.c
index 1090082e7d5b..b1f850772cc9 100644
--- a/sound/soc/intel/avs/boards/es8336.c
+++ b/sound/soc/intel/avs/boards/es8336.c
@@ -233,8 +233,6 @@ static int avs_create_dai_link(struct device *dev, const char *platform_name, in
 	dl->ops = &avs_es8336_ops;
 	dl->nonatomic = 1;
 	dl->no_pcm = 1;
-	dl->dpcm_capture = 1;
-	dl->dpcm_playback = 1;
 
 	*dai_link = dl;
 
diff --git a/sound/soc/intel/avs/boards/hdaudio.c b/sound/soc/intel/avs/boards/hdaudio.c
index 79b4aca41333..e96d8a5a7706 100644
--- a/sound/soc/intel/avs/boards/hdaudio.c
+++ b/sound/soc/intel/avs/boards/hdaudio.c
@@ -39,8 +39,6 @@ static int avs_create_dai_links(struct device *dev, struct hda_codec *codec, int
 		dl[i].id = i;
 		dl[i].nonatomic = 1;
 		dl[i].no_pcm = 1;
-		dl[i].dpcm_playback = 1;
-		dl[i].dpcm_capture = 1;
 		dl[i].platforms = platform;
 		dl[i].num_platforms = 1;
 		dl[i].ignore_pmdown_time = 1;
@@ -160,8 +158,6 @@ static struct snd_soc_dai_link probing_link = {
 	.id = -1,
 	.nonatomic = 1,
 	.no_pcm = 1,
-	.dpcm_playback = 1,
-	.dpcm_capture = 1,
 	.cpus = &snd_soc_dummy_dlc,
 	.num_cpus = 1,
 	.init = avs_probing_link_init,
diff --git a/sound/soc/intel/avs/boards/i2s_test.c b/sound/soc/intel/avs/boards/i2s_test.c
index 28f254eb0d03..7159abb1c82f 100644
--- a/sound/soc/intel/avs/boards/i2s_test.c
+++ b/sound/soc/intel/avs/boards/i2s_test.c
@@ -46,8 +46,6 @@ static int avs_create_dai_link(struct device *dev, const char *platform_name, in
 	dl->id = 0;
 	dl->nonatomic = 1;
 	dl->no_pcm = 1;
-	dl->dpcm_capture = 1;
-	dl->dpcm_playback = 1;
 
 	*dai_link = dl;
 
diff --git a/sound/soc/intel/avs/boards/max98357a.c b/sound/soc/intel/avs/boards/max98357a.c
index a83b95f25129..5cdf97bbd688 100644
--- a/sound/soc/intel/avs/boards/max98357a.c
+++ b/sound/soc/intel/avs/boards/max98357a.c
@@ -82,7 +82,7 @@ static int avs_create_dai_link(struct device *dev, const char *platform_name, in
 	dl->be_hw_params_fixup = avs_max98357a_be_fixup;
 	dl->nonatomic = 1;
 	dl->no_pcm = 1;
-	dl->dpcm_playback = 1;
+	dl->playback_only = 1;
 
 	*dai_link = dl;
 
diff --git a/sound/soc/intel/avs/boards/max98373.c b/sound/soc/intel/avs/boards/max98373.c
index 3b980a025e6f..223984553fbc 100644
--- a/sound/soc/intel/avs/boards/max98373.c
+++ b/sound/soc/intel/avs/boards/max98373.c
@@ -134,8 +134,6 @@ static int avs_create_dai_link(struct device *dev, const char *platform_name, in
 	dl->be_hw_params_fixup = avs_max98373_be_fixup;
 	dl->nonatomic = 1;
 	dl->no_pcm = 1;
-	dl->dpcm_capture = 1;
-	dl->dpcm_playback = 1;
 	dl->ignore_pmdown_time = 1;
 	dl->ops = &avs_max98373_ops;
 
diff --git a/sound/soc/intel/avs/boards/max98927.c b/sound/soc/intel/avs/boards/max98927.c
index 86dd2b228df3..199e9a1abcc6 100644
--- a/sound/soc/intel/avs/boards/max98927.c
+++ b/sound/soc/intel/avs/boards/max98927.c
@@ -131,8 +131,6 @@ static int avs_create_dai_link(struct device *dev, const char *platform_name, in
 	dl->be_hw_params_fixup = avs_max98927_be_fixup;
 	dl->nonatomic = 1;
 	dl->no_pcm = 1;
-	dl->dpcm_capture = 1;
-	dl->dpcm_playback = 1;
 	dl->ignore_pmdown_time = 1;
 	dl->ops = &avs_max98927_ops;
 
diff --git a/sound/soc/intel/avs/boards/nau8825.c b/sound/soc/intel/avs/boards/nau8825.c
index 1c1e2083f474..dd9539dcaa73 100644
--- a/sound/soc/intel/avs/boards/nau8825.c
+++ b/sound/soc/intel/avs/boards/nau8825.c
@@ -210,8 +210,6 @@ static int avs_create_dai_link(struct device *dev, const char *platform_name, in
 	dl->ops = &avs_nau8825_ops;
 	dl->nonatomic = 1;
 	dl->no_pcm = 1;
-	dl->dpcm_capture = 1;
-	dl->dpcm_playback = 1;
 
 	*dai_link = dl;
 
diff --git a/sound/soc/intel/avs/boards/rt274.c b/sound/soc/intel/avs/boards/rt274.c
index bfcb8845fd15..e9bc00cc80b4 100644
--- a/sound/soc/intel/avs/boards/rt274.c
+++ b/sound/soc/intel/avs/boards/rt274.c
@@ -183,8 +183,6 @@ static int avs_create_dai_link(struct device *dev, const char *platform_name, in
 	dl->be_hw_params_fixup = avs_rt274_be_fixup;
 	dl->nonatomic = 1;
 	dl->no_pcm = 1;
-	dl->dpcm_capture = 1;
-	dl->dpcm_playback = 1;
 
 	*dai_link = dl;
 
diff --git a/sound/soc/intel/avs/boards/rt286.c b/sound/soc/intel/avs/boards/rt286.c
index 28d7d86b1cc9..9d8d10ebd734 100644
--- a/sound/soc/intel/avs/boards/rt286.c
+++ b/sound/soc/intel/avs/boards/rt286.c
@@ -153,8 +153,6 @@ static int avs_create_dai_link(struct device *dev, const char *platform_name, in
 	dl->ops = &avs_rt286_ops;
 	dl->nonatomic = 1;
 	dl->no_pcm = 1;
-	dl->dpcm_capture = 1;
-	dl->dpcm_playback = 1;
 
 	*dai_link = dl;
 
diff --git a/sound/soc/intel/avs/boards/rt298.c b/sound/soc/intel/avs/boards/rt298.c
index 80f490b9e118..4e7096bcf5c1 100644
--- a/sound/soc/intel/avs/boards/rt298.c
+++ b/sound/soc/intel/avs/boards/rt298.c
@@ -173,8 +173,6 @@ static int avs_create_dai_link(struct device *dev, const char *platform_name, in
 	dl->ops = &avs_rt298_ops;
 	dl->nonatomic = 1;
 	dl->no_pcm = 1;
-	dl->dpcm_capture = 1;
-	dl->dpcm_playback = 1;
 
 	*dai_link = dl;
 
diff --git a/sound/soc/intel/avs/boards/rt5514.c b/sound/soc/intel/avs/boards/rt5514.c
index 60105f453ae2..43285cd2aef0 100644
--- a/sound/soc/intel/avs/boards/rt5514.c
+++ b/sound/soc/intel/avs/boards/rt5514.c
@@ -121,7 +121,7 @@ static int avs_create_dai_link(struct device *dev, const char *platform_name, in
 	dl->be_hw_params_fixup = avs_rt5514_be_fixup;
 	dl->nonatomic = 1;
 	dl->no_pcm = 1;
-	dl->dpcm_capture = 1;
+	dl->capture_only = 1;
 	dl->ops = &avs_rt5514_ops;
 
 	*dai_link = dl;
diff --git a/sound/soc/intel/avs/boards/rt5663.c b/sound/soc/intel/avs/boards/rt5663.c
index b4762c2a7bf2..2a38cd85dd11 100644
--- a/sound/soc/intel/avs/boards/rt5663.c
+++ b/sound/soc/intel/avs/boards/rt5663.c
@@ -171,8 +171,6 @@ static int avs_create_dai_link(struct device *dev, const char *platform_name, in
 	dl->be_hw_params_fixup = avs_rt5663_be_fixup;
 	dl->nonatomic = 1;
 	dl->no_pcm = 1;
-	dl->dpcm_capture = 1;
-	dl->dpcm_playback = 1;
 	dl->ops = &avs_rt5663_ops;
 
 	*dai_link = dl;
diff --git a/sound/soc/intel/avs/boards/rt5682.c b/sound/soc/intel/avs/boards/rt5682.c
index 243f979fda98..b87e08827430 100644
--- a/sound/soc/intel/avs/boards/rt5682.c
+++ b/sound/soc/intel/avs/boards/rt5682.c
@@ -242,8 +242,6 @@ static int avs_create_dai_link(struct device *dev, const char *platform_name, in
 	dl->ops = &avs_rt5682_ops;
 	dl->nonatomic = 1;
 	dl->no_pcm = 1;
-	dl->dpcm_capture = 1;
-	dl->dpcm_playback = 1;
 
 	*dai_link = dl;
 
diff --git a/sound/soc/intel/avs/boards/ssm4567.c b/sound/soc/intel/avs/boards/ssm4567.c
index 4a0e136835ff..b777cfb56beb 100644
--- a/sound/soc/intel/avs/boards/ssm4567.c
+++ b/sound/soc/intel/avs/boards/ssm4567.c
@@ -123,8 +123,6 @@ static int avs_create_dai_link(struct device *dev, const char *platform_name, in
 	dl->be_hw_params_fixup = avs_ssm4567_be_fixup;
 	dl->nonatomic = 1;
 	dl->no_pcm = 1;
-	dl->dpcm_capture = 1;
-	dl->dpcm_playback = 1;
 	dl->ignore_pmdown_time = 1;
 
 	*dai_link = dl;
-- 
2.25.1

