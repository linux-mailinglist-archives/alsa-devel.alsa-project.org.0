Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AC9A0888D44
	for <lists+alsa-devel@lfdr.de>; Mon, 25 Mar 2024 05:44:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3AB9C162C;
	Mon, 25 Mar 2024 05:44:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3AB9C162C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1711341850;
	bh=DRJo5Zh7uoUsqlhBa9LN8X9mkwIp5Hf2eepH8DBYf3s=;
	h=To:In-Reply-To:References:From:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=CjZOBP9O/JQWrzw3btOPLMbg/AGvAxV5ofUYgvvB7uUws8Dd/+K8gn4yIPQ8ENqaM
	 EugfJ2fm6cVemi3Je4iAslRi6GymV5ie4vjg27M8iunO8UONcQ25usWyIdA6QFFpC0
	 p77dCeq7PpciWKnQjlZtMFOi5GClP4c2lXCs2OvQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1742EF80610; Mon, 25 Mar 2024 05:42:58 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AFA73F805EA;
	Mon, 25 Mar 2024 05:42:57 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0751AF8025F; Mon, 25 Mar 2024 05:36:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20601.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:201a::601])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DBE46F80236
	for <alsa-devel@alsa-project.org>; Mon, 25 Mar 2024 05:36:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DBE46F80236
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=WVXW0bsB
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R2Lu8+JdwfUFleyOunvuMt9vdzH4Qq7R3yqLU4Z4iKameUN+VMOLNxyoBYdNXP7nLCUgLs6P/Z2Ebwccvt0Xrv2Qk6hxA29GE+1l1x5Llz8DLrRL+FRmg/SW30TsP1pHJCcwMz0rYz6X1l1PntgO4hePzvvHi5G/mfHr+myaOZneRXQGjW+khgNgylZkpqlfeBkX7qgpboRvjat3hjNnXcTiHMwtXRu7g3prWn59JSAdy3cuXsXZ3C7Gg8wTBmXR5qs2mp1nPJ3rgyQZfEEsrt/ivu6NeDxHvi6s7wIt0bEGp2VLP4zyqpa1QvofptpXTcZVyz2dnYUDE5KXnv7jAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Uz6U1imtp4A5ePlvKD0/SLhzN1hah03F7tGbrV3yCBI=;
 b=CJKSHKSQ8wV4jUyvYrEG9KoLqZe/LUtCUa79gnF3lviVKEVMWX3RvlkuyPzDvLa3SrJ4z1m4ZGModsO+gCO723T74C2T4pUTVK2C3Qeoukq50yzqaDSf9L8f/2xJep9uyZmTljGNNLo8rYgEJjs59VazLQ2Dz8FV+bmevvlU5L1+MeNrzL18ivtYSRVOMSzfAGiMtqW+0VfNeySZVJ9ubo4iH0Qpw0GfPQbrZ5N7LRwOKfkf2WLHPY0c/Tpck1Mwl1LyA8E5mD/cdfIu3DWnG/UegVSfgM+tqRMofnZrdOBNEjrKqJ/kDMj0b4HbhELDOyq02jjwygeorZRiRVod9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Uz6U1imtp4A5ePlvKD0/SLhzN1hah03F7tGbrV3yCBI=;
 b=WVXW0bsBu9ZtY+/LB81djuMIhLgyGAF3JUzXDKAdParqlN7GzECfLbndb0D+0nAaZsDhXQHkiuTAJfYL8wiE8st7S31iWpzmami72zxD0z50jrDGgA/+DW7wF5fPG4DEbQ8/Pljk9NpTO8/wO1Z2uJo2l5L0CJktmgiTfGkTWA4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB10698.jpnprd01.prod.outlook.com
 (2603:1096:400:296::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.31; Mon, 25 Mar
 2024 04:36:39 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::131e:55c0:a4a0:713b]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::131e:55c0:a4a0:713b%7]) with mapi id 15.20.7386.025; Mon, 25 Mar 2024
 04:36:39 +0000
Message-ID: <87h6gv53mx.wl-kuninori.morimoto.gx@renesas.com>
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
Subject: [PATCH 05/15] ASoC: meson: replace dpcm_playback/capture to
 playback/capture_only
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 25 Mar 2024 04:36:39 +0000
X-ClientProxiedBy: TYCPR01CA0105.jpnprd01.prod.outlook.com
 (2603:1096:405:4::21) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB10698:EE_
X-MS-Office365-Filtering-Correlation-Id: bfdd4d5e-149e-4095-61ba-08dc4c8529ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	NiJdGQTpvTILSieWHtHsZh7MZgtvUDB61xDdDdCmBFaWbgRnQnHztDUHBWUgxvrKrrquxl3Vi3dQ8eFYGOI83QIoRGrS3gVyfXj/sI+iFxT0NUkgye6XbQ74e2M5/edWOJjdh83t/sD2sgY+SUO3Rh6W41H55jVLqMIqcLLYGt/dIxESX1C1BqlORNPSDqDa3ro3ktYxQKJ6ld63Ckb7FNXVSza5yQ3YR3f/gPU9g47vP/ZtiCmKK/TeylfBODUhZ5YOYeq9+yJSAnPZcG5ku3uScDecv0c9p6kS85nA3BiIU/zz3chqxBc0PdX6Qnse16IXP54Jr9wZ20yN3Y8puAZeajx6H4M3OA4u/Wt/TJyPin0cTQUduIkZp0U5GFHW94ajFb8iUGK+vM36PLQBNSlKvOu6jjL4VHtybT5Wfjf/BxoJKGyxAM7fF8eScuccesjxHqO3PAoyvfaD/cEP9pZ+tmISrqGF18jtEGLH0inofZjAL8by2Bsvi6+RCy33/Z2O8kCahOC3vMwO+uGbUBg7hGdUBnITQE1rRYnF9+vgp3H7fN0o5y8JxzTbRZagUhWjZSwaHClgGauLVWdtmxVTv+mnmXsrCIBW9UZSaOJNS4FYHnw043MIeKwd6sboZXlVrtpYcA4ibFcVguDCKudthmbvu6TDyZT3EDgrLoaBK0S8nEgU/sUdToHiWhbo8XWCz1GNFHMHP/HVxydGxyf3r8TpeNT5CWyGnGHOaec=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(376005)(7416005)(52116005)(1800799015)(38350700005)(921011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Kya4C9wViqwMeaKSW/VpGq2Dh5knCuOpc78+E5tpRiYZWipjPgdZJNcZ4ZQV?=
 =?us-ascii?Q?5SypNCSUkRJzk/YJm1I7amIyOHNK0NgQzk4rTUsRLzEmW88YgvgW4rBrKPnH?=
 =?us-ascii?Q?/fN0TtQBz772DJQCiobaBqwM6GdilWH8r2tVxitQsH3v5IQkny72JLoMm8US?=
 =?us-ascii?Q?Y3PF2xbzP5BqZs1TM9e3aM+02loeAcaFHJJKG/emmTDF4UkFtJ/KKBL7q5gp?=
 =?us-ascii?Q?aYbVaMm378uZ/pD9fU/D7CYy/w1Qmh2eXIM4pIQCS++H29FO2/8cjH3K4Hlw?=
 =?us-ascii?Q?roikpEeTmpeGXrWW9LFq1CbOUS0ZvW5FLDQTPkXwUWGonM6bFheu3NiDN/9B?=
 =?us-ascii?Q?02ILrPrj32HFFMbVfqanFJh6Mzs0Xvmt+QB4nUzSz6Afsg/gw75fkbRhv9bt?=
 =?us-ascii?Q?ViPNIaObZuCnGDeztPhaLjf4W08+H1oYbidZcQOY4U5B040lVxACIy014dii?=
 =?us-ascii?Q?19T3+Mvl0uxAKLfQzjGIQxIrJvbu+2eao2MfmbyyF6dVowTzftnWUPNbBKmr?=
 =?us-ascii?Q?s9dNPW58fnOenKY8iSsXvGRGM/oByEq14FRwITsCeu4XszhOsb1AQtq+TDNX?=
 =?us-ascii?Q?+Ap3StXMYJP7DgzF3z+KJHYcAy8kuFCucRo4iyTKGS7vJpypZpBXyi4sPmP8?=
 =?us-ascii?Q?clFLsMI0rCKsylVJ1w/9YFbrW4C5hPOGZtbHfkpZEIeO/BFK2oUH9hkAFhFL?=
 =?us-ascii?Q?mDOwQ6qKSOWh8YWxW4xkLV7n59kthHQVf7QgjDL2G0pmQmwQLyfbbDuSyMlL?=
 =?us-ascii?Q?y0aghFka6/W1F2b6v3K83VFKMo4pXTATeJhbTz5DbpRQ2j4FM2Si6aVdZeer?=
 =?us-ascii?Q?BehNeXk0w2gFCugXjYfBtOp0DMMf23oBA+E2HEA1hHKAeRc4rft0yQ6JgzrE?=
 =?us-ascii?Q?mxtxD3xWyuz5CSTx/ykDV0v7cC8fxUp7LcSzJUhHay2aSvzMQDvVdLY1Iyjz?=
 =?us-ascii?Q?vG1NjurIQERU/LBn79AXnUEGQ45uIhtlePl6fYIj80RHjQ2LdOXtwpHcfPmU?=
 =?us-ascii?Q?HgU87HXjs4z0xyf67qGifseVqkLxEGUuTLYdlwIEZVOqLl1jtgVXB4yTufyB?=
 =?us-ascii?Q?biJ4ec7BU0Cw7L4K9/T47ao/LhdQdcvYL50ueBk7m6hSnf1eFBVPHpbzDYeh?=
 =?us-ascii?Q?GdtG3QBfnubzhbd+khJW/pUPlWeUnK1PbwnpHSgWvupfyyzh7HaMO0SzIZY9?=
 =?us-ascii?Q?v9u3R8Dhw76TFT4nIApzcEtWFfTnO3hJh25torJxXxKbNXtIJurlANN+IL4R?=
 =?us-ascii?Q?VnStdSBXje0Y0dgoo838WR5MPsDadCOzw04u89C0w7GGXyCpdl+nsWzcTi3M?=
 =?us-ascii?Q?/BMM+soCOJA9zmZI5i4phT7Gfd4N0XXRbrcLvMc8AFcVc1qHh4ewyulwyzhF?=
 =?us-ascii?Q?LMyFREs0jlsSsSSxa+dpiQisbW2yoijqT9cJhuM666/ONvteLhAC2HRxLYUV?=
 =?us-ascii?Q?Dl1j1QTXNx35IqPdyAqiKXoB9vFD6mugn0jcVoQ76YzqGjX96kv67pHViB9V?=
 =?us-ascii?Q?hOZKDMw4RlVsa62M/hp6QyA6yYOyC2OzuYFwvQb/qlQ00RFsrTg1g2n9+u96?=
 =?us-ascii?Q?4YwcTYEP2fiPVR0RopjfjW1nrhZ5licILM/U/Ult6IiOe4Ewp9wOUglrL5I3?=
 =?us-ascii?Q?LjURvoAJJjQuqFG90eXZkIo=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 bfdd4d5e-149e-4095-61ba-08dc4c8529ac
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2024 04:36:39.4099
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 2nuGccxAcHPtz1mRxW/XF4ZURwv0pUTtXvdhaCmIzRtp5cXZWCcF+mpC++X75jnr/dRaHqf4yIDYYwF8zqafHpkidSjwd3rNybvKSFy/PygX7VST0lJGPxfkOLgsjNK9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB10698
Message-ID-Hash: MTHMNNYISAVIZRRW63E426OJFS2IKY7S
X-Message-ID-Hash: MTHMNNYISAVIZRRW63E426OJFS2IKY7S
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MTHMNNYISAVIZRRW63E426OJFS2IKY7S/>
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
 sound/soc/meson/axg-card.c         | 8 ++++----
 sound/soc/meson/meson-card-utils.c | 4 ++--
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/sound/soc/meson/axg-card.c b/sound/soc/meson/axg-card.c
index 3180aa4d3a15..21bf1453af43 100644
--- a/sound/soc/meson/axg-card.c
+++ b/sound/soc/meson/axg-card.c
@@ -132,7 +132,7 @@ static int axg_card_add_tdm_loopback(struct snd_soc_card *card,
 	lb->stream_name = lb->name;
 	lb->cpus->of_node = pad->cpus->of_node;
 	lb->cpus->dai_name = "TDM Loopback";
-	lb->dpcm_capture = 1;
+	lb->capture_only = 1;
 	lb->no_pcm = 1;
 	lb->ops = &axg_card_tdm_be_ops;
 	lb->init = axg_card_tdm_dai_lb_init;
@@ -176,7 +176,7 @@ static int axg_card_parse_cpu_tdm_slots(struct snd_soc_card *card,
 
 	/* Disable playback is the interface has no tx slots */
 	if (!tx)
-		link->dpcm_playback = 0;
+		link->capture_only = 1;
 
 	for (i = 0, rx = 0; i < AXG_TDM_NUM_LANES; i++) {
 		snprintf(propname, 32, "dai-tdm-slot-rx-mask-%d", i);
@@ -186,7 +186,7 @@ static int axg_card_parse_cpu_tdm_slots(struct snd_soc_card *card,
 
 	/* Disable capture is the interface has no rx slots */
 	if (!rx)
-		link->dpcm_capture = 0;
+		link->playback_only = 1;
 
 	/* ... but the interface should at least have one of them */
 	if (!tx && !rx) {
@@ -275,7 +275,7 @@ static int axg_card_parse_tdm(struct snd_soc_card *card,
 		return ret;
 
 	/* Add loopback if the pad dai has playback */
-	if (link->dpcm_playback) {
+	if (!link->capture_only) {
 		ret = axg_card_add_tdm_loopback(card, index);
 		if (ret)
 			return ret;
diff --git a/sound/soc/meson/meson-card-utils.c b/sound/soc/meson/meson-card-utils.c
index ed6c7e2f609c..1a4ef124e4e2 100644
--- a/sound/soc/meson/meson-card-utils.c
+++ b/sound/soc/meson/meson-card-utils.c
@@ -186,9 +186,9 @@ int meson_card_set_fe_link(struct snd_soc_card *card,
 	link->dpcm_merged_rate = 1;
 
 	if (is_playback)
-		link->dpcm_playback = 1;
+		link->playback_only = 1;
 	else
-		link->dpcm_capture = 1;
+		link->capture_only = 1;
 
 	return meson_card_set_link_name(card, link, node, "fe");
 }
-- 
2.25.1

