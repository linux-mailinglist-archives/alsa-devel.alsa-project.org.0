Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 725018A91FC
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Apr 2024 06:19:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C65F693A;
	Thu, 18 Apr 2024 06:19:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C65F693A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1713413994;
	bh=gpSpG+U0cb9Mygwo566jjTkKPkKgSqqIclxxbdi6BFI=;
	h=To:In-Reply-To:References:From:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=eDYHVOmQDHq0BQLzQf7R5+i+GaqyvrWRqfflqoyPptdevXMC0L6oHi9FQ7IpoPQf1
	 wN0URje+oVcCo1d/gwJ+bYPSEcl10TqcyPb+o4LMtYpPPkkpuIt3eJjRmZRiQfEOjI
	 cVoopyOLCqz+nppkqHOYev5Y3JOXP5mYMkVILNbM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E3B83F80C75; Thu, 18 Apr 2024 06:15:50 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 897F9F80C74;
	Thu, 18 Apr 2024 06:15:50 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 61AE1F80623; Thu, 18 Apr 2024 06:15:46 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 2AF46F80897
	for <alsa-devel@alsa-project.org>; Thu, 18 Apr 2024 06:15:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2AF46F80897
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=LkHQnqkF
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Am0N7inAAgVWo6cc4cUQeB6W+tRewQJuMoDGB7BF0VAbaTsgUr1fZUN82HqD/NRux6kaR7YpUX4T67YKQ2jb+q5gAfxnt6eLfWs4BE96q7qp+0jr4PJ4z13Zu66SzGXYH8FlmZZ0cOrCryLZvKDesSDFGPooUCzt2cGAduct7WJ/7omAJ14cc60jmkD1DeKSCj34xO2SMIqZ7ZFl82FaMJ/+/0jlGqrlBgINygZbU3NkTaomSD4vRhYAeNaj2yow+KCChMtJwHduqpDFSP8mrDfzmzEvRMh1UVpnsXgNnMEBNde0VXYY5jX7FjDCC6cSBPPYoH0TYAKYimr0ordZhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M32q7kxBHy+CNmGy5HKB6MulJCXyj/IoK53451u9JxA=;
 b=OlKnbgDvD2Ty49M3vcaZxanHTheSc6dzLvHi33JjUu6een7pQduvkRmG5ApBpD8sAjfOu3UGMCkD/biDyjmoR7ZIaPt58zV7R0SVY8+NyXqC0qCl7YfgWKsuwpHKRhTqDgqu6SLpXxnWesj8iVNLwyNx9UGDRi1MST0iDngk7z3ItqpGoE9kuU2D2kx/v7BzjPdTvbnUdw5H8sEFTmOHPNgpz8W23EmxVIt0Lzh51NR7Nu1NlXRCILXa0thD9dtfT++SHYDsSc9nK5u2dOA7HXMQoDz+c5/bSGlECNIWNCNQc4xKfwuBABpPSTzf2/VTiKCUIDt83pal+GLEXlnAhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M32q7kxBHy+CNmGy5HKB6MulJCXyj/IoK53451u9JxA=;
 b=LkHQnqkFTmnlKOUIL4EUADHdMSaxV/0VJn49A2Ak2Yulwbw0eEHBqUM6wSpDwVsH5OL1L1GTnwZd+K6VHY+h5P/5ufFUn5P4buoGpxncWXzvZMcNiBtB0YQpEh5AILwfH3iyXd3MyR+hNJeaNfMBtZr1k8udPOW3MJTBuDr5nn4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSAPR01MB7397.jpnprd01.prod.outlook.com
 (2603:1096:604:142::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.39; Thu, 18 Apr
 2024 04:15:28 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::131e:55c0:a4a0:713b]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::131e:55c0:a4a0:713b%7]) with mapi id 15.20.7472.037; Thu, 18 Apr 2024
 04:15:28 +0000
Message-ID: <87mspr71cw.wl-kuninori.morimoto.gx@renesas.com>
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
Subject: [PATCH v3 21/23] ASoC: generic: Replace playback/capture_only to
 playback/capture_assertion
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 18 Apr 2024 04:15:27 +0000
X-ClientProxiedBy: TYCP301CA0039.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:380::16) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSAPR01MB7397:EE_
X-MS-Office365-Filtering-Correlation-Id: 26e8068f-3b2f-425f-c1a9-08dc5f5e2df8
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	IUag9ux0B+mtJ3Tv4G8jIhmf+bSDHPcvgZ5UBYngxkO5XxCM/l08LWl0qJmL6lzwyv7fzRJQLISdc31UD5oTObjv0ru086vAXT95poIkAKzwOX8cbfSWf1kaAeXvCsV3wTdoFncPMwV5rFW4PpVTpW8VDv1YdjMw+m3ghm//XrNwsUMt0ZcFMTZjEovraZCc3aPHqsboynB0zYW7g6/kIJSbX7GczZtgNi6c/h7ct2UDHYxtvW2wDikCs9KpILhysyt36Bb+X7ba1tNK6dQ9n85TwjBuU6n9QrI45tQJ/GQ/+A/Jn75ySyRiBfdMGpcN4vlMfqwO4aOg2X1wjvNppd29JgjJj81zD6C9bQIt7uuitJPua4gVXYEK8IEZPbL3nsS930eAoCu6NbFgtQa+e59mFsblwZnAxgf1+y982oklrrq6ylCSEM+nf2E3G5MdJe0j2kcu/Tvcg41WBusmM81m6KwyDqxYnOvqk1a6hgG/4cfAEHFtiAEKLvZGvS2wkSana+uvPIIsZyuRR+0U2hjM9sKi1XPqY+XbPCtp9PU3rgM6FdzijuHcakGw3OiP/sTT85uETjs3THRczEbll2y+32J+plRK764o7JrlK8n2VT0J5kxESFKQe13ZRYznOPzx+cYoGycG3UkMNbi2SrK0qShG9O15yEcNN0V9WPOqHWckk0wG7LQUTVKp0WuU0yPt2GwPLCCO9jcTpbSKDe4KHN8nuoDHPhdSNMSXWdI=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(52116005)(7416005)(1800799015)(376005)(366007)(38350700005)(921011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?fNN1STNYHZaVovauQeW4DQV7Gc/fKmAGe6wN1+DK/UH4h4VBh3TwGRLdWvwU?=
 =?us-ascii?Q?eTVh7wam25tM9Ptq1PJOuIRkYi+PXxIGQeiK6Re98fDVPm+U/RhZFTPK73RU?=
 =?us-ascii?Q?5Wty3oud6Ij6eLzMYlDoXIqMPjKYHTYvPMn0PuEsebSd+6DM8gKDQIgCFgrE?=
 =?us-ascii?Q?4uxeqL1EWm/cjn/MQyZIq2yraJWTpe4zIXrUeFN3Hahkl1853reer71Gd4P2?=
 =?us-ascii?Q?a3gs+KWgt5U/QInWRpk1w+Ry+sl0kneIGSa4ldIW7LPYZtQ1cms6s8c/tW4o?=
 =?us-ascii?Q?1/Kj/5EZoW1klRsy7fyExEza9/2WXvrD7zjklbX3HNKSa1DDQ6Hn74DEJNyC?=
 =?us-ascii?Q?FapvDKaaxtWsQfWjyBd+/YRieUiyvALfred0vQXjKkGZJY3K/ne2KkyCwPiR?=
 =?us-ascii?Q?epzcUZnljk7xmwHzL6b4Sac3uCj/bucSbsKrJCa7yT0RBi4s4QGE82qXClZ0?=
 =?us-ascii?Q?GL4fl2JhyPYfnFaTN2RHsC2TaB/uFF58YyyKJFab3oeOyavcn8HObXd93JlQ?=
 =?us-ascii?Q?T/Qoh+0kkgje7P8id5p7PW2wR6l9IFOix2QaM5BKA03RHIaBtM39uFq/JWYb?=
 =?us-ascii?Q?4yLMRcplGycI6hlaUBz30B1xtxjThCy308g1GuRFCmaA6Unu0/MS5SHOtSA7?=
 =?us-ascii?Q?1UEj7IY2/arFctZOk3lfSLb41NPEoF/4AO8aPj8OUirXMjS6ad2dUHJGY1o3?=
 =?us-ascii?Q?xuik0tIquqS5sl91KE59PcOP9XPtjdm+Qror8R7bXBcdwwTDhdZc2P8LpVl5?=
 =?us-ascii?Q?9ep7HNA2ckuBYZxSDOQElKvdZeXJUMaV21PFvb6DOAIhn6dAhYXztJ5szf3k?=
 =?us-ascii?Q?HIyf+iykEOWr1qebOF3sl9jIkp5GPtz9J1yY7cYJtDgX2P3iQ0Z4JchsrEEj?=
 =?us-ascii?Q?HTCYsUNuU+68wiEEFtxHizYm8qd5OszEDH4YN3yGjnupM2z6e5jVlnLWUacp?=
 =?us-ascii?Q?I4uGh31u3Vjphe3ZpGyJ8cRF9qruGGN2A6sGUJunSSjQf/iJWEHQ6DFknD5y?=
 =?us-ascii?Q?X1jBCbVR2db2YkFsxltIkqCQzoWP32AXX/ro6JoU8/vBhLtRsS0lpj8neVcZ?=
 =?us-ascii?Q?fuADqxES6f+Qdajwv7QLmnomEN8chCosvUfkzSneazV0WexAzcS04dyIxBlg?=
 =?us-ascii?Q?fXmpSoG3mEJ69U9Y8FoKUzMdTZu7Eo7u72UbEAqWMBAKE0eWDUsoeT6YBWl4?=
 =?us-ascii?Q?BxwTF/ldylpn+OtIq7TYaiSctbTs8/a6+lZu4GHfnDkhgArQEyBrZJfhx9cY?=
 =?us-ascii?Q?74SWZebAMs6/vIfhLJn4e1s5XdOmDU2m+5LLxU4Z16uH6JWhawScK4y5l64y?=
 =?us-ascii?Q?UtfEZ77SlLi4c8XgAhRkSElYG9c+HfNXbJYkUTEFY3NrL2+8twpBem0ziFBS?=
 =?us-ascii?Q?9fpQip8u66320RDDnS+1U/TuuoRTliPD3wn8RS9GJhVpQZe4dLml9ZHbDajk?=
 =?us-ascii?Q?uF7/7366teUAzOwrHW/tqidngqUHiRzDhx+mHw4tvQeIw/ItaNMsqiGtidZX?=
 =?us-ascii?Q?74dKU+ZRHlzOhzj3MBKjgk5ytOGw66gGR9dcQ6CWMGS0FjUdiKRgzmJ+A7WL?=
 =?us-ascii?Q?jAToItAMBHRVhn+R1+6zcsTi8yl7HfuPv7n7Em6ryFvDHvOKRUbon1j0smkW?=
 =?us-ascii?Q?Bd2D3sGuBX65xD7nyt0yaI8=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 26e8068f-3b2f-425f-c1a9-08dc5f5e2df8
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2024 04:15:28.3576
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 0F1gMke9ghPbQv4ByTfS8jJQMRicOsYLy/Cc/QMQglQ6nN8iBhHyJ6D3jYrVjU3Drr5oNqOA3+CHsN3p93PveNBLtMvnUNpudERmNT23lk+UaEyh/U7fa6+ZHYHZew0T
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSAPR01MB7397
Message-ID-Hash: 6R2OADA4II2KIBPYEHVT64UD7EGRWRXA
X-Message-ID-Hash: 6R2OADA4II2KIBPYEHVT64UD7EGRWRXA
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6R2OADA4II2KIBPYEHVT64UD7EGRWRXA/>
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
 include/sound/simple_card_utils.h     | 2 +-
 sound/soc/generic/audio-graph-card2.c | 8 ++++----
 sound/soc/generic/simple-card-utils.c | 6 +++---
 3 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/include/sound/simple_card_utils.h b/include/sound/simple_card_utils.h
index ad67957b7b48..42e464090cf3 100644
--- a/include/sound/simple_card_utils.h
+++ b/include/sound/simple_card_utils.h
@@ -196,7 +196,7 @@ int graph_util_parse_dai(struct device *dev, struct device_node *ep,
 			 struct snd_soc_dai_link_component *dlc, int *is_single_link);
 
 int graph_util_parse_link_direction(struct device_node *np,
-				    bool *is_playback_only, bool *is_capture_only);
+				    bool *playback_assertion, bool *capture_assertion);
 
 #ifdef DEBUG
 static inline void simple_util_debug_dai(struct simple_util_priv *priv,
diff --git a/sound/soc/generic/audio-graph-card2.c b/sound/soc/generic/audio-graph-card2.c
index 0d2ac4c9ba3d..3007b95eeaaa 100644
--- a/sound/soc/generic/audio-graph-card2.c
+++ b/sound/soc/generic/audio-graph-card2.c
@@ -759,7 +759,7 @@ static void graph_link_init(struct simple_util_priv *priv,
 	struct device_node *ep;
 	struct device_node *ports;
 	unsigned int daifmt = 0, daiclk = 0;
-	bool playback_only = 0, capture_only = 0;
+	bool playback_assertion = 0, capture_assertion = 0;
 	unsigned int bit_frame = 0;
 
 	if (graph_lnk_is_multi(port)) {
@@ -798,10 +798,10 @@ static void graph_link_init(struct simple_util_priv *priv,
 	if (is_cpu_node)
 		daiclk = snd_soc_daifmt_clock_provider_flipped(daiclk);
 
-	graph_util_parse_link_direction(port, &playback_only, &capture_only);
+	graph_util_parse_link_direction(port, &playback_assertion, &capture_assertion);
 
-	dai_link->playback_only = playback_only;
-	dai_link->capture_only = capture_only;
+	dai_link->playback_assertion = playback_assertion;
+	dai_link->capture_assertion  = capture_assertion;
 
 	dai_link->dai_fmt	= daifmt | daiclk;
 	dai_link->init		= simple_util_dai_init;
diff --git a/sound/soc/generic/simple-card-utils.c b/sound/soc/generic/simple-card-utils.c
index b4876b4f259d..48233f410348 100644
--- a/sound/soc/generic/simple-card-utils.c
+++ b/sound/soc/generic/simple-card-utils.c
@@ -1127,7 +1127,7 @@ int graph_util_parse_dai(struct device *dev, struct device_node *ep,
 EXPORT_SYMBOL_GPL(graph_util_parse_dai);
 
 int graph_util_parse_link_direction(struct device_node *np,
-				    bool *playback_only, bool *capture_only)
+				    bool *playback_assertion, bool *capture_assertion)
 {
 	bool is_playback_only = false;
 	bool is_capture_only = false;
@@ -1138,8 +1138,8 @@ int graph_util_parse_link_direction(struct device_node *np,
 	if (is_playback_only && is_capture_only)
 		return -EINVAL;
 
-	*playback_only = is_playback_only;
-	*capture_only = is_capture_only;
+	*playback_assertion = is_playback_only;
+	*capture_assertion  = is_capture_only;
 
 	return 0;
 }
-- 
2.25.1

