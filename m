Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AAD488A91EA
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Apr 2024 06:16:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D82E1B65;
	Thu, 18 Apr 2024 06:16:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D82E1B65
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1713413773;
	bh=sYh8jtTawX/FkpfDHKWeTJcjO4NaJLHkZc3fdH3M0KA=;
	h=To:In-Reply-To:References:From:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=uedrqJbbD7UgaBfrYIYk96fstn7MWKnqyLc2tW52T0SfTBEMkpmK8VZE0bRmCB/Gj
	 s2iZKiH4L1/BSe0rlX3TYAmCHQkyyfoZd4cU5g1kdD3IrfEgM+krPAAAyLrzINfnXA
	 +eRnhb0uG2Y8HiVUxSM0r5pBSRNQRUKSHK+jXIH0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 77753F805D2; Thu, 18 Apr 2024 06:14:51 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EEA1BF805C2;
	Thu, 18 Apr 2024 06:14:50 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B1B2EF80494; Thu, 18 Apr 2024 06:13:36 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 11F20F80124
	for <alsa-devel@alsa-project.org>; Thu, 18 Apr 2024 06:13:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 11F20F80124
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=klU2aU5h
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kUVJ4rZLwJROm/W53VmJTyM0F76CBkXZXe+nAfGgMyVGIaBsO7ZvLe7zPFCXz1xjEw7Ywaj86wyVLq/cybF9qh5ojWsd6ABrlUwD1VaJmafgHrypou01ypmyab4E2W5fYTk8z/rFkPstzKwUeWAUo/ije4Z7T/j3Jl8inMUIU9IrgppAv1CACU8DC78iMX+JzP8aJQQ5iLgBOlclhMbyLkIblW7gGMNIIa9vEQGitpbJjqJdlrcfALdV1PrVOH/ncVcVNdjfARYWHxCS9N1McH4WUsd8+iW++DcLw7+HIZkxwh+z4DqlD73TW79JM288vyYKRRrkPQB5MKHIRfrutg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lkQXMt+6YY8yxS+T9XCdXja22jM+cVphmJQGitbX2vY=;
 b=PSl+VLf/IPhenWWfmRErpg0BuNWWHqae3wkLBn1yYtgfwiwButAX8kZx/hNAQxcakSx9GZGQQcuNX02upiGwyiPBhBhn5l3o+jJMjh+mjqAiQHqJ6G73HzgjcWJqx8JHO9gb6RYz2/dLdJQX9PeGf1NnT+XQXOnx6xFuzWql14Pg0dMxWPbem6gY9wZ/N5NlPJk+ETkwLLAJOPzoLhUvVslNWCN3vGdoZdu4CvUbunZY3VjrZZw6IHqVlluKUIenuvLmG8zEZHXc+Zbta0qIbnWR2twDomJUOfGPvT3JUAcMqStSIm+zVmtjY+jvCtfB+cMxgsbl1r/MNvM3bSDk2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lkQXMt+6YY8yxS+T9XCdXja22jM+cVphmJQGitbX2vY=;
 b=klU2aU5h6L1AIzCPcYyJ5Lm3fUAZ64sX7KJezEAK9kNF0pADo3EbOxSGk3pxN9mlApLRwY7G0yB/rWVFaLntPY2XfXqs8r073BTcFoj8n65kw0jmezgIeGLF92rBg8tUsXaFwaDmJyOLFf2hhygXYDxB5zOF/n3MxO/P4i+/Ldo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSAPR01MB7397.jpnprd01.prod.outlook.com
 (2603:1096:604:142::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.39; Thu, 18 Apr
 2024 04:13:27 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::131e:55c0:a4a0:713b]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::131e:55c0:a4a0:713b%7]) with mapi id 15.20.7472.037; Thu, 18 Apr 2024
 04:13:27 +0000
Message-ID: <877cgv8g0o.wl-kuninori.morimoto.gx@renesas.com>
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
Subject: [PATCH v3 07/23] ASoC: meson: Replace dpcm_playback/capture to
 playback/capture_assertion
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 18 Apr 2024 04:13:27 +0000
X-ClientProxiedBy: TYCP286CA0251.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:456::20) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSAPR01MB7397:EE_
X-MS-Office365-Filtering-Correlation-Id: 93960a2d-ff5a-4ef6-a831-08dc5f5de624
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	siEXAoDhF8pdgA4lCAGoVsY1YBWOPgUm0/deJ4WoGGpK08L/9eeX6TG0IdZU4hQWLu4j+UIV6u4NTd7Pnu0Z6hAHanU36DVNAa+2H5CgP+UiU8iPCat48AjIRNnH1TX7HibYvzUtN9N7sBUYuwjo4xrC7LIooTqk4X2Pb3J1p6cp4+nOlT/z7tFTdz+tSnYWfZ4Uc+VMwYl5b1dbx/aX0kkyzkiTON+vg4ygZThVv9cSmO5rVj6ntgru0I7zth5hCb0LD2wB6WsZYVcBtdMu+bXPGmvgKds4BWngOPAPQJ18e33Rpl9TEZjlNCx0pDr6Z7F0T/XzGGagO9s0GTI0vFnvawne3yiw0Rbc9JIPuwc3+q3qfqQzfR0P6HQvG650S6nVyYa24pimNS1We7q1if2d93ouiuF33KhkL0MMZsPJtCv4NKNzMYmIh326GSznfBl+BT7ExSnJiG2lFjn9q3hAmlZRbm7ZveTH0VovrBa5j7hDxj+DfdrBmJBjE1xqAXczvfxlTQwss+jTWpCGa+UfDEaYd1sKi+DByETxK6BAKooIs2ZJwiAbUkixVh6xuoIicQh5HRJ7dFSSyqCZhI2TZdXvjx5lorFk4Hgxw+iW2gor4UikjIaIDVLjt08T8RQmzsu2cA/cN+aiPMgE5G9LFF4Ng+hDyHYnS18H5j1EcJtFYpthuRM3tHzoK8vYZpc0EugTu1m8EZAhfGemkFoq3+dsisw/co4X7YVpEYM=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(52116005)(7416005)(1800799015)(376005)(366007)(38350700005)(921011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?gc1Qyx5woil9XLRKSWUgBs5Y/aIspLpLcHXy6HtwPlSSpM+HAA3TbnYSpPGX?=
 =?us-ascii?Q?Nz6AVUhlYRgaEC3vqlZwqq7/hk4BRoPYQ9DUtdo7dLmxhCKXGGwd2okF0Dwk?=
 =?us-ascii?Q?xJEu2DWK+ALVIdt6+GOqhzBR3NnGbMCCygJ/l+hDMRCWwseHY+ZcQhg1u/qo?=
 =?us-ascii?Q?5hNWPhdUoKk4fllLIiT0mxVAQQLVHP5ZfudIAykKWUfA7aBxBlFFgQmmjXYh?=
 =?us-ascii?Q?2XFFW1KGcji7szgiE3QxyLO4bLBXvzqAmxRQrPh29wbQKJt5wIWbEFBdGoSK?=
 =?us-ascii?Q?wKtW13TGJCWVED5OfdkEPAm5dx/7DbdeQoLHSlqoVZPrn28DAnNB2ZmAzz3F?=
 =?us-ascii?Q?ter6Md7jp8OMA0K72oV1xI2l01UX42wyD8lk4YIUShO5gIeb4UAdZHWHzTFO?=
 =?us-ascii?Q?KDBwlxUdvPo6nDifYwDJ7i7QWo9U2hGREkZY02lMhKeQJECgKGoR6TgGrsIE?=
 =?us-ascii?Q?D2NNWgpGGCzmN+oxIWunolMMm+nlMSOG4yaHRFwquziMnK5WZ5Dq2q+HV3YF?=
 =?us-ascii?Q?CdpkSjbhPfNQBX8j/3a2tKvWEsW14hsJNlapbDgQo0/rRFos3AhKP8hrPKCt?=
 =?us-ascii?Q?Ki8Rk+UCrn0AnpStRsj3zEGEO8Zx4u92T71l1yIJOql+IUDVO2T140dzK4Uq?=
 =?us-ascii?Q?lUMTTLeCNUTqD4Djl9rwFv+rRM/ErNOT7bhuyKp18hNYfpQnzjGg5qqA6DW9?=
 =?us-ascii?Q?Q5RKDYqiOWlH+yhGUoL9UucxyIT9KE4y3XuWhzi5CfBC4vphV8aEKd9QBfo6?=
 =?us-ascii?Q?N0VAnTzANufuA0+DQSHZmu3Za1QJfI59iKBQ81G0MciQ1RH9AtD314Q6cvTS?=
 =?us-ascii?Q?9ZIsMW6F7/UvFIzAkkzH5++HPk0fnSXZIrZ33Tqec4p5Rz5q+RvEPQ7STx+o?=
 =?us-ascii?Q?VlikJBP2HwfJoQZcmy6E+tOpjiMN09JcF5gUzBoZuFyQ/J7D+JOke7mRs0w8?=
 =?us-ascii?Q?82SFIjD84uySB0Lmaa96Wn8Dn/Gl2v2MrP2PUYn+dwZVAFXwhp6Eq3XQ/sOJ?=
 =?us-ascii?Q?+p5xyhPngWoFDbKXNZFt4SChIIwzMcRe5HXTKO2ayFgh/OHFTVUu/8qfbrpA?=
 =?us-ascii?Q?n0ofcSmx4D/1s1i+krZyL1VIUhb9WIz9ZCV10b8zlydzIQnIpgvhD2esoeNm?=
 =?us-ascii?Q?EJy/ONiqFdRP19wSdTW711H0mc7IaueoYr9p/u3pZZU0YS/66F1R5HeWDTbK?=
 =?us-ascii?Q?dlkI9dNuctPOc5nkDjUfejFl3ZxkgphtCutu/wPrFtHkOITnp4bzMilp5Ljp?=
 =?us-ascii?Q?pK9H19b+ITCrTAo0mXdS9KPfphKKshWjN/jY2LnvZSMT2Lp7UiV4iqzL6pAJ?=
 =?us-ascii?Q?kzvFDWwG7skS8E69eGAIkuxydq0Ac/XR5vYMimTEi+GEOYsoFlF1u3pSjBvL?=
 =?us-ascii?Q?WGU0mqtUNK3eR7bRGCTzYZ+QGIDERfwPeyZ0qgfW/vg64T2IamZn7+JDf5V/?=
 =?us-ascii?Q?O4uEQ5WwkXg+O57pLPBG9TVcyAffGKwArXYawb4CMWEMwO0ajrYGKkB5s82q?=
 =?us-ascii?Q?w/y87kXxMgFPp8r3IHNI7Ht43yslDXlqbse+aazT6FsrrgIChSQTp9NddhwG?=
 =?us-ascii?Q?0oGF4dUBOVS58pPlkhMFEO8R92nFy7Pz4XRvZ2aiZDhTLjrdPXYJF8HDTpKU?=
 =?us-ascii?Q?CmhwRp+9NariCps3JdQhfzM=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 93960a2d-ff5a-4ef6-a831-08dc5f5de624
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2024 04:13:27.8298
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 wTYDRqts5wrqRwI4Y0/6rG5ZOtHp34cPJX6RYHybpfp53AU6xQPzv0Iv9uT1ppWT9Dihfw0I8AcqKARvuCLXxHRfd9IG/AlYptCNQEpgSVxSCPcFRdZ2hZcqxw2P8xZC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSAPR01MB7397
Message-ID-Hash: 3M6IETV3W56F3VUFEKVKXEISFTLDEZHN
X-Message-ID-Hash: 3M6IETV3W56F3VUFEKVKXEISFTLDEZHN
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3M6IETV3W56F3VUFEKVKXEISFTLDEZHN/>
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
 sound/soc/meson/axg-card.c         | 8 ++++----
 sound/soc/meson/meson-card-utils.c | 4 ++--
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/sound/soc/meson/axg-card.c b/sound/soc/meson/axg-card.c
index 48f14c28f79d..55198cdc6daa 100644
--- a/sound/soc/meson/axg-card.c
+++ b/sound/soc/meson/axg-card.c
@@ -132,7 +132,7 @@ static int axg_card_add_tdm_loopback(struct snd_soc_card *card,
 	lb->stream_name = lb->name;
 	lb->cpus->of_node = pad->cpus->of_node;
 	lb->cpus->dai_name = "TDM Loopback";
-	lb->dpcm_capture = 1;
+	lb->capture_assertion = 1;
 	lb->no_pcm = 1;
 	lb->ops = &axg_card_tdm_be_ops;
 	lb->init = axg_card_tdm_dai_lb_init;
@@ -176,7 +176,7 @@ static int axg_card_parse_cpu_tdm_slots(struct snd_soc_card *card,
 
 	/* Disable playback is the interface has no tx slots */
 	if (!tx)
-		link->dpcm_playback = 0;
+		link->playback_assertion = 0;
 
 	for (i = 0, rx = 0; i < AXG_TDM_NUM_LANES; i++) {
 		snprintf(propname, 32, "dai-tdm-slot-rx-mask-%d", i);
@@ -186,7 +186,7 @@ static int axg_card_parse_cpu_tdm_slots(struct snd_soc_card *card,
 
 	/* Disable capture is the interface has no rx slots */
 	if (!rx)
-		link->dpcm_capture = 0;
+		link->capture_assertion = 0;
 
 	/* ... but the interface should at least have one of them */
 	if (!tx && !rx) {
@@ -275,7 +275,7 @@ static int axg_card_parse_tdm(struct snd_soc_card *card,
 		return ret;
 
 	/* Add loopback if the pad dai has playback */
-	if (link->dpcm_playback) {
+	if (link->playback_assertion) {
 		ret = axg_card_add_tdm_loopback(card, index);
 		if (ret)
 			return ret;
diff --git a/sound/soc/meson/meson-card-utils.c b/sound/soc/meson/meson-card-utils.c
index ed6c7e2f609c..ac417e673951 100644
--- a/sound/soc/meson/meson-card-utils.c
+++ b/sound/soc/meson/meson-card-utils.c
@@ -186,9 +186,9 @@ int meson_card_set_fe_link(struct snd_soc_card *card,
 	link->dpcm_merged_rate = 1;
 
 	if (is_playback)
-		link->dpcm_playback = 1;
+		link->playback_assertion = 1;
 	else
-		link->dpcm_capture = 1;
+		link->capture_assertion = 1;
 
 	return meson_card_set_link_name(card, link, node, "fe");
 }
-- 
2.25.1

