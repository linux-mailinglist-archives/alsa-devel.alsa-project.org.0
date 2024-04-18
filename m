Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 13C118A91F5
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Apr 2024 06:18:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 734F6950;
	Thu, 18 Apr 2024 06:18:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 734F6950
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1713413903;
	bh=CHH52AfOvY/ePAYShjYVG0+TbHowSsfj/36VOxK6S/M=;
	h=To:In-Reply-To:References:From:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=XgFWSFHmLCfR4hgxKcgYS1p0rHwDLbc5qvCEd/T9S9SNuuKvqhIZWMJXuy+fXU3+M
	 kX+37QzkjxMYIpS/I2JNoUsecCmZHkm74iJJ9UPCjZbSJQqS6BbGirpSffACJsv3UT
	 5b0+rKJz3T7ltVExSu4LT/33Zdp8nrquTFysnRMk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A2801F8076A; Thu, 18 Apr 2024 06:15:22 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 08226F8075E;
	Thu, 18 Apr 2024 06:15:22 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2D046F80710; Thu, 18 Apr 2024 06:15:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=unavailable autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20600.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:201a::600])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B6D4CF8065A
	for <alsa-devel@alsa-project.org>; Thu, 18 Apr 2024 06:14:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B6D4CF8065A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=Drjbhyvn
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a4axM/IK79dZu2X+APXURNguhMzh8C0xh2NNZWh24xU2jJ1oO+Qx0IrCv0KQR7Cncnwf8dA6e8EtQBY/iHkLy4UMpk2fIGRqTdLAkkw2GBP/LgQgalGYDdyifqZALFigfyP1vA22C2DBrfy+i3yBsGTB2a7nRezBlk87g4+UftLPwYF7cCgsur9lnQ71Z6Yo7H7My4THkOBMAC9UkBOXxp8ZFmSz+JtAAzBxHJiO1WH/br5+vy8+fn/MJEDpe/qny4GyskjY6fZBGWWTEc5yAL5fPxC8bBzN/10KVTyTQULzakAecYg9Bg3D3X8i+O3ObZDUijt9OVDvfpJcZpf+jQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nnB78NWGFgzHzMXoyH9pGduHLaXhOvPT8HGW0b2aEZM=;
 b=kmQ+f2bzMY6OmSGAYn4c0LXdxzMhfO50hfMIVYHP/Glf9uhF+w2JJwcbEAMHvtFGomij9qvHmUNAxykBfsAPqVLvQjnBKYHFoM4DLavgZCiN2b0cooD5jw90lVVnm28M0MmehcH3CVKge2WE6XQxYYdio+4/WWYHcaWGrsQLnq8IYw4Sob/nLsOlHFVt8Sm7dI1R1bqaZzwLzsDt5bTG8eJ9ofv92wJ6tWxaOcA/UmWlFztqLCB4kBsT+iHmhA7T3HSmhMpnHdS4/PWu8pd5LhJYf48O5UPZwh4VvCP+8vtmbdPrc+xqeJzlWa9R8WiEKnc+r8IWxV2UPj+ZReKJhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nnB78NWGFgzHzMXoyH9pGduHLaXhOvPT8HGW0b2aEZM=;
 b=DrjbhyvnuUzp8MQZNJZWcx8eQjMqsd0zM8WoC+eFpBNILpBhrbaH/ZyJr2H6dSkSxeKm5ManHflC3Fm8W/6/RoOZeuDvk1uDMglOkd3I7ifyiwVk4qdZTk1qPBkNDZGXQ7onF72yBTbv19AArNBY/wd3KuPK6a0ZcWxOTfoWuHk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSAPR01MB7397.jpnprd01.prod.outlook.com
 (2603:1096:604:142::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.39; Thu, 18 Apr
 2024 04:14:46 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::131e:55c0:a4a0:713b]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::131e:55c0:a4a0:713b%7]) with mapi id 15.20.7472.037; Thu, 18 Apr 2024
 04:14:46 +0000
Message-ID: <87ttjz71e2.wl-kuninori.morimoto.gx@renesas.com>
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
Subject: [PATCH v3 16/23] ASoC: fsl: Replace playback/capture_only to
 playback/capture_assertion
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 18 Apr 2024 04:14:45 +0000
X-ClientProxiedBy: TY2PR0101CA0008.apcprd01.prod.exchangelabs.com
 (2603:1096:404:92::20) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSAPR01MB7397:EE_
X-MS-Office365-Filtering-Correlation-Id: b0a4d611-c47d-441d-2cf1-08dc5f5e14f9
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ekSQxGbzIGuCey2+B1ZQw+4JpGziZl+SYwds8sUCxCZetNdP9h2rCP698wa7KLRHECVPeWnGn15wJpzYc3HL69DHpvyXO7KWnF1FkneX1qQNnJQibEHdIrgQ4FpAV7fNLv7Fo0qCIJxS8HZFFLbLftaOuKWaXrHGTgUWJEPebjIv/CyWh11MSeTP9dfAsQ8cgly4p6Q2jvQmI5QW2CVK9liaTYVJjctYB/jM5Iip+w7pfYsqDe0Ux7rgLknFkUMrwH1qgB/uZjD+sHKh/Njb2d5chZHzg6BQadjcejLN/UNlfDInBjnlfIhJyeDMJoP0BXoV/U/Z1K454/rwc03RB9nEk4UhZrOnDE+tnwmZq62lZAbuN3c201Da2J4wPbCYgNKpe+IrhfrzC04HSB1VNMmT7Y+T1torlyD/dVkMNr1rnEvrBW6kw+3BxEY7+Jl0TBEPzmIobvktqLQ4qw1ZGDXxJqxhDYS5AvX3s+piWtcRklgsd0XVLtX30FO9n3G/K9362kRDgPdyVztiXFcMTd6YXSzTCYHNcCaGlFyAlMvrzFzNtnhfvyFf7cfocX5q5CmiwMpd6GSsCChKbrec/44mqV+PtGg0CPMkHnpJU7mP0PMoh/uraVeFYRFfHAlybTxoKD797Mn3U3l0e7uj7k1GBUgtfipjYX3ilxDtforJ3g0fMne3r+vXjrdSwXNdJB2TlR5Mwr6rvpQRdB/Lwshb4Uyq1RVZFY1oZH1DZpw=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(52116005)(7416005)(1800799015)(376005)(366007)(38350700005)(921011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?CrIg/N07+0CmfFG1n0pSKaORo/wwAxULJlKDSlhKs4R0zLzt2/b3S0nyDynx?=
 =?us-ascii?Q?yjtzxIuMDeE4RDYVxDpPPd0Qpb3xv1VVZJDtV7T0E+++7glupLiKQJuzlI8T?=
 =?us-ascii?Q?J2fJ55vBI3a1bdvATyuDxbMkiSDwFH94nUq8BbrrVrJ+cCOX+SD/nuHKBDzL?=
 =?us-ascii?Q?YjnaaO8SfA+ZIVJa1nlJUyCrHACT77eMd5qvLqVS8Hbkffn3BKgeLIRySamk?=
 =?us-ascii?Q?QEMjeCIUHHH1NFre9nVHtgrhkjmyzrRB/l73uRirD3cV9Dyr9eSzv7ymQzVO?=
 =?us-ascii?Q?FvvWIyoLonhgzF84AmnyNDuX7hlXhNEBhy4uNoCsJQbUjc+rveOM3Es1nd5G?=
 =?us-ascii?Q?1nagSwADXaUH8FPnoEVRNGF8H3/nTnoBzLU8MvlpXvdTWN0P6bPhSgCUG/Sv?=
 =?us-ascii?Q?e7Hj9u7juaKlVOMEbDJ6qdOItdrAOqWCuGMfPiuPJZWsrNNLHAP8wglhWpmv?=
 =?us-ascii?Q?OkEb8Gao+BMKr1rK6B9uwyA/Q+oWEp68mfVuuLJIpfsG044vjhkhpic2z7an?=
 =?us-ascii?Q?G6tDBaQ0qATFwCb0SqvVReuI6urRTcINq6Y6Pyn189G5wUw2p6Fw58vXyXRf?=
 =?us-ascii?Q?Mz/190fYpMESNtX/TDA8qVa1WGCJt/jL3aD26nvnSiKmK9BvFt7t6Pcmhwwg?=
 =?us-ascii?Q?/eD3oUMxxrQj4bbzoLAufMbi46qSuOhxEwmb3Trli7MeMSAOel9HjTfV2bs4?=
 =?us-ascii?Q?SfmftC4M6HtRv2RHkNBizZv6rMjzJvGLfRn+ZX4283EPlTMnKQhXOkwqueOq?=
 =?us-ascii?Q?ND6qm6ITD36Zw1bae9iIHHKBnPhAVoC1FrObLc/yOAqrttpJPbjx5wOfNEVr?=
 =?us-ascii?Q?UQ1iCDJGihorej6J95TepAKy8Duxh06PkYwspQ83QLJruhYMu9np9NTYfjTD?=
 =?us-ascii?Q?3Ggx438mxN16JhG759Sh/eif/EIxgGgEDZPgsbulRkMDVKIZiKHTvovXD8Vg?=
 =?us-ascii?Q?hTwTPs259Fw1y1HslqHAvHR3Cn3uz9bKaY22q9dVdWS4wcr/J0iptIcpQVpu?=
 =?us-ascii?Q?B2cItkMtBcAopRhh4XrxQPAIFIRms/ZKYABDkwthYjJqSdI6216BU+Cn5DyK?=
 =?us-ascii?Q?sBRyPCOXbfWKDu9ZloL6i6ArGrfPUAXZl0RJCyIWZzl4+N5ZNG0cS33FcjIR?=
 =?us-ascii?Q?OkiuxCX2MvOgLyTTU2ZCX6kiWn5wELqR4LUghDch9DDjoC6kClxjRldr1o08?=
 =?us-ascii?Q?41GaqyJpoxk5julP2LaQnFSl/HB6MK3e1chKcYikZWO9Vf0iaxq5Yjx+a68W?=
 =?us-ascii?Q?mGMAOAA7vQuYCISiKyW4ISyNl7SDuLFQvzRRKZVxKDHr4NQXfI8BH61nAtFH?=
 =?us-ascii?Q?yU0MS2s5MtVaurx0SZn3wSyrBpeeDaugl9TXXV7jShcC3iNNazwKAduu9XAZ?=
 =?us-ascii?Q?EhOvKlIDdy4sGGskny7CylVrhA+yNjT3XRTLMh+Li3Z2U7+ufrVxBwGCB3zU?=
 =?us-ascii?Q?keBmaObVTGDsQWePI2dF6L3fd8GCtoi3Gsj3/0lF4C9s6MDxwLjjRq/BkSXB?=
 =?us-ascii?Q?lTIY0kanujhNf/62Wi9hQggTkYtvIoo8VoXu5BUbHkeoWVfkTEa3y3XTOSPG?=
 =?us-ascii?Q?9WxAVyCoFXXR7yWVIZIzxzAge/Ph5j+jnL9SCRZL/DVFdtozmFmhyvL564Vj?=
 =?us-ascii?Q?qpo6f0f2tGNbyWbUtoKB9G8=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 b0a4d611-c47d-441d-2cf1-08dc5f5e14f9
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2024 04:14:46.4182
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 oFNV935Wx9qznKP/L1ui2b+2MbTXUV4pCfF55wll8htA2Zi0/g7RDvQjuu+LYcFk4zSNYNw1Z77LScmgXaTcBoZZEELwLt7UuxQdzn5H//mj6xqeZf30AIQV4uktA5ou
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSAPR01MB7397
Message-ID-Hash: MQ3WO72XWJSROJE6EG3WGUPRXTCNAVU2
X-Message-ID-Hash: MQ3WO72XWJSROJE6EG3WGUPRXTCNAVU2
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MQ3WO72XWJSROJE6EG3WGUPRXTCNAVU2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

soc_get_playback_capture() is now handling DPCM and normal
comprehensively for playback/capture stream in same code.
This patch converts xxx_only flag to xxx_assertion.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/fsl/imx-hdmi.c  | 12 ++++++------
 sound/soc/fsl/imx-rpmsg.c | 10 +++++-----
 sound/soc/fsl/imx-spdif.c | 10 +++++-----
 3 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/sound/soc/fsl/imx-hdmi.c b/sound/soc/fsl/imx-hdmi.c
index e454085c6e5c..53ae87a7b640 100644
--- a/sound/soc/fsl/imx-hdmi.c
+++ b/sound/soc/fsl/imx-hdmi.c
@@ -143,8 +143,8 @@ static int imx_hdmi_probe(struct platform_device *pdev)
 	data->dai.cpus->dai_name = dev_name(&cpu_pdev->dev);
 	data->dai.platforms->of_node = cpu_np;
 	data->dai.ops = &imx_hdmi_ops;
-	data->dai.playback_only = true;
-	data->dai.capture_only = false;
+	data->dai.playback_assertion = true;
+	data->dai.capture_assertion = false;
 	data->dai.init = imx_hdmi_init;
 
 	put_device(&cpu_pdev->dev);
@@ -169,8 +169,8 @@ static int imx_hdmi_probe(struct platform_device *pdev)
 	}
 
 	if (hdmi_out) {
-		data->dai.playback_only = true;
-		data->dai.capture_only = false;
+		data->dai.playback_assertion = true;
+		data->dai.capture_assertion = false;
 		data->dai.codecs->dai_name = "i2s-hifi";
 		data->dai.codecs->name = "hdmi-audio-codec.1";
 		data->dai.dai_fmt = data->dai_fmt |
@@ -179,8 +179,8 @@ static int imx_hdmi_probe(struct platform_device *pdev)
 	}
 
 	if (hdmi_in) {
-		data->dai.playback_only = false;
-		data->dai.capture_only = true;
+		data->dai.playback_assertion = false;
+		data->dai.capture_assertion = true;
 		data->dai.codecs->dai_name = "i2s-hifi";
 		data->dai.codecs->name = "hdmi-audio-codec.2";
 		data->dai.dai_fmt = data->dai_fmt |
diff --git a/sound/soc/fsl/imx-rpmsg.c b/sound/soc/fsl/imx-rpmsg.c
index 0f1ad7ad7d27..2254b7c0c3ff 100644
--- a/sound/soc/fsl/imx-rpmsg.c
+++ b/sound/soc/fsl/imx-rpmsg.c
@@ -185,18 +185,18 @@ static int imx_rpmsg_probe(struct platform_device *pdev)
 		data->dai.platforms->name = platform_name;
 	else
 		data->dai.platforms->name = "rpmsg-audio-channel";
-	data->dai.playback_only = true;
-	data->dai.capture_only = true;
+	data->dai.playback_assertion = true;
+	data->dai.capture_assertion = true;
 	data->card.num_links = 1;
 	data->card.dai_link = &data->dai;
 
 	if (of_property_read_bool(np, "fsl,rpmsg-out"))
-		data->dai.capture_only = false;
+		data->dai.capture_assertion = false;
 
 	if (of_property_read_bool(np, "fsl,rpmsg-in"))
-		data->dai.playback_only = false;
+		data->dai.playback_assertion = false;
 
-	if (data->dai.playback_only && data->dai.capture_only) {
+	if (data->dai.playback_assertion && data->dai.capture_assertion) {
 		dev_err(&pdev->dev, "no enabled rpmsg DAI link\n");
 		ret = -EINVAL;
 		goto fail;
diff --git a/sound/soc/fsl/imx-spdif.c b/sound/soc/fsl/imx-spdif.c
index 1e57939a7e29..aaf87eaf7607 100644
--- a/sound/soc/fsl/imx-spdif.c
+++ b/sound/soc/fsl/imx-spdif.c
@@ -47,16 +47,16 @@ static int imx_spdif_audio_probe(struct platform_device *pdev)
 	data->dai.name = "S/PDIF PCM";
 	data->dai.stream_name = "S/PDIF PCM";
 	data->dai.cpus->of_node = spdif_np;
-	data->dai.playback_only = true;
-	data->dai.capture_only = true;
+	data->dai.playback_assertion = true;
+	data->dai.capture_assertion = true;
 
 	if (of_property_read_bool(np, "spdif-out"))
-		data->dai.capture_only = false;
+		data->dai.capture_assertion = false;
 
 	if (of_property_read_bool(np, "spdif-in"))
-		data->dai.playback_only = false;
+		data->dai.playback_assertion = false;
 
-	if (data->dai.playback_only && data->dai.capture_only) {
+	if (data->dai.playback_assertion && data->dai.capture_assertion) {
 		dev_err(&pdev->dev, "no enabled S/PDIF DAI link\n");
 		goto end;
 	}
-- 
2.25.1

