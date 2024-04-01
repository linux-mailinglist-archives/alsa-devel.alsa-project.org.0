Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AB5288936A1
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Apr 2024 02:34:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3EF7021A2;
	Mon,  1 Apr 2024 02:34:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3EF7021A2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1711931689;
	bh=GHJO74wmkCkgkuFXEtmcfl6/NHgKNzQmzMCyv7JuyUw=;
	h=To:In-Reply-To:References:From:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=sXgCyx+OgVFwZeBXzh+uhUBixOZwcBzgC7fxC/8TLVmw1dxFK8jUkybm1BALMWE6F
	 hlAM0wrqywRuJra8X2TGxJQLEVBuB9VqC9L7U9ndyVsvgpgYFKm5V/ZOus3wrZYIS1
	 RmzIDLa/VpxxMRjTzXUjs8fwKuN6fF2tiMgpf4Oo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 55E9EF80709; Mon,  1 Apr 2024 02:32:25 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A072EF806E1;
	Mon,  1 Apr 2024 02:32:25 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 31221F806C7; Mon,  1 Apr 2024 02:32:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on20700.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2019::700])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4D6A2F80571
	for <alsa-devel@alsa-project.org>; Mon,  1 Apr 2024 02:32:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4D6A2F80571
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=A4BM5/NX
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V9HDVyyzdX8BFiFF7XXF3p9LvHNEjMGRLVDuI1P6VB0CKjEijNDsTjtLB++OFx/a3zmt9BGuN6jlDU9c8beobl4eAlsDsow+UuSBLiF/Pbgc4x2bAp3yiTGNSmuJX2DkDFeWIopBGTetJk8Hmq727YuIUDhv2NGXE1RpjT1kHmYlZBgvScSK3gna5VIYsGut1cv6G9ov7dbC1MPV27mrD+W1to1P9G+M25CidywmyvQhk7DaCmgmF1vcGjXWZ6vGKr2hZv16iDlG8wUiMf3/aLOVVs5nSkBemlR5DS6qIUvGVVRGAg6zE+zJvQPCeNtshOlxjKj67TECkiRSO+fVCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3gEaMGiOsQnhdj9KifbArfzeB046aB2fLnh9I/rTfeI=;
 b=ZjOtb6txRA+c63Jyj4Lj7hLFHbw3raqYgCMaisS3RLtOR/UkWDCMJo0em24v+93qcuBQMNOK3+ULE6jYRJsgmWGVqU0d0hrt9XGhnhaKjT9hpoWvH4j9zT+uht0XLeg0tafOetf6Ix4hSPEzhF1hgk+l8DNoYSfuCSRvMJvCoxxu4jrrDIfXwbrl2jQ3aNEdNeKlmAWlTnxOjX/M74L9HFRUw0OLXblKg0MwnEXMUWsTU3sSNw1E1zw32Im8VIMdcU7uuLrq0V9VWIB1do7LQPI+XUuEWjCT93uZlOaO8/LUpihUShdWdkOXuohILW2sqStzJjma9ItgCYYOAeX+uA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3gEaMGiOsQnhdj9KifbArfzeB046aB2fLnh9I/rTfeI=;
 b=A4BM5/NXUCEoEm4MilpfM3J4XiM0Z1MNQkxIIb7xxE2Ik+Ijc13JjtoUpudMsU9YVGRjzuBnezqftbHvbbrGcA9kQRxr+Q54hQhmJDFPOaSeSIzVBPhnglPAtVQZAlSuk6bNWx5zEHq19Ogr6ltR9L1lNnQgV0wt+RjVZv+6ERY=
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY3PR01MB9964.jpnprd01.prod.outlook.com
 (2603:1096:400:1df::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Mon, 1 Apr
 2024 00:31:59 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::131e:55c0:a4a0:713b]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::131e:55c0:a4a0:713b%7]) with mapi id 15.20.7386.025; Mon, 1 Apr 2024
 00:31:59 +0000
Message-ID: <87il11udmp.wl-kuninori.morimoto.gx@renesas.com>
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
In-Reply-To: <87zfuesz8y.wl-kuninori.morimoto.gx@renesas.com>
References: <87zfuesz8y.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 12/16] ASoC: Intel: avs: boards: Replace
 dpcm_playback/capture to playback/capture_only
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 1 Apr 2024 00:31:58 +0000
X-ClientProxiedBy: TYAPR01CA0079.jpnprd01.prod.outlook.com
 (2603:1096:404:2c::19) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY3PR01MB9964:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	EAGezpCxCzOabQ3zByoJc27hFLdezjokyOQOzZm/OF3E2Zf41ai8W1EgprYX+QhGI2fM07Ev8rj/RRAFqYH/VoClW/qmHjico4P8EgvnNUKybPPwseNzlJM8xmF9lxgC9fiw7NolDStj9dMjiSm9WLxE49MWnE1n9Sn+g6nZL+CnjJAIIiI8VolEW117b3h0cL86VUNW+RIOaSs3r+6IxvvoXr2FGVfPtkBFm1poBFQiUnfgcXERFK120UT846Ydteb6ZPdSs7d2b1AxXXlcp6knWCSKWckRMr2/mkbOmkHM5xjFMftjOz6vIndbKdZUKr1kvtidsEOvF3bRVfD+OAi+8DGgQYpRIHYeLihzUujIzu8FzDnxZRtKSmw1q+wWHCU3DdYBYArZA54ONuyqYsZk+S7wpkheg5OOW1VI/wU8w0bUXYHIg1Le5aVSwCVSkuslhEZxCi7KC9uPC6w6k1mxXoqk2offOp73EvnbI08rVb/VD953l2/aa6NKg9ejm6in1bzV3Gnh1xye3s0hlAwgaswVrCPS0HFmHl+43Md7m4icxJw4xNqu5IKEwq8vOs+dNDmw/StPnoSoOUCsK31zmv59Mene/e2yKwZ2smnaAisJkyHpClUg/eK/or1KPguHjc8mesOGYPBREwah+0UvCd0ONigApm9CKzsnikh789J+VbIDeSafr+eeY3LJ15EJjKzwWBazdXlGwGzRDNDGoJ8FzPq8iFaeIGuFz04=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(52116005)(7416005)(376005)(1800799015)(38350700005)(921011);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?FeVL/B27phPM3u8K0tIznNYm1n7jTREChB06LeT+pUQHJO8Qy2l4GrhBC92n?=
 =?us-ascii?Q?ZoVwM+tOg6ItE1r9ilLsLs+Uuj58nj8D5lYrnqNqbUXykuWGUz8u8xSbb2Ea?=
 =?us-ascii?Q?f9NPfw8wGyzmugNZ7CPWJKXygQb5KnSeMG6I1VvX+UFUKq4xpE+IpkdwTznl?=
 =?us-ascii?Q?TIOgJ0zdnlBY/+oFGnYlSEZiVH7zpH647uXmzMVFI+kp6tbiSRbcw7X9JMSg?=
 =?us-ascii?Q?QFLpomYhqHNGJ7oiLlX51Wvc2HNhge+s4N+fPIRKepEnZGf4cE5TPDBAD5Th?=
 =?us-ascii?Q?NfaeRyiefV6PHCs3IYlHSs9YVdB6wTG+aoTi1YgaSmHWK2vd2Vw28mHVV3h6?=
 =?us-ascii?Q?tq5/plZGB+shszyUwpWGUokrJNjwg9zSxyAZIMfLas7yL0h70MD7uQQ80zJj?=
 =?us-ascii?Q?VP9AjXCTADDZGphfS+SeUmVDqj9y/H3EbKTo2Y/AjkxNyQ5Asqvg3GFLARsk?=
 =?us-ascii?Q?fFitZ/HIFvPCDFnv5c+0rKTOT+Fv9I0VlmScxfOe7kLqrNfNDAox9/8wYS0e?=
 =?us-ascii?Q?PmAjGdtRrzDAhXY5jGpGrCrkvJLgMjPFX8ZleLLYK1scMUhzqeC1wr2raW0R?=
 =?us-ascii?Q?jasL/Zh9g3cwHuUqTdfI5hnOnPaW0CxHY+tK29Zx0IUFCHiDs25Ycnzd1okU?=
 =?us-ascii?Q?wIwxBMS5/sZtX7dgkw5KJG9hAJFzF5bRMeUGdUpNlKbBavi4bZn5vRTa5XOQ?=
 =?us-ascii?Q?ae4Iwh2AG59eZjM6Gszj82t7nn2K6I1MRD0xgC4jHEy92JXMR59HHrjYj9B4?=
 =?us-ascii?Q?/fbIzJ7ZVRhlqPJvnh7Eu0UYjYi5NBcO1RuLuyPJeFHYdTDJl8TKi5uq3rOf?=
 =?us-ascii?Q?HqJvXQRbgCwBRJ09I979S6dq+/WOPGNTJDrd87QHl/Az1ykuJ1Cw/rBQzqI4?=
 =?us-ascii?Q?JI/yVZaadEQrnjdWO72wK6Y2RjkNl41G+IqfDyG+qHKdGeR2JvX3MoI7yYei?=
 =?us-ascii?Q?o/Z9zH3FIz+s/7fDFPt7Aw+nDUTn604JZz5FiKIh65LdV/KPSUXT1nR1RMAO?=
 =?us-ascii?Q?ng67VY4FT5gUTyXrqsr8Xc/xXlPm93E2yx+S53+VR9BYShBF0BB7xMR4HT4A?=
 =?us-ascii?Q?ufk77XKqon20JDa+LGLPc9vrt+cMncQILvGnZI1ww3r3qqfvptqPI5GGzQN1?=
 =?us-ascii?Q?OJkvlVgUhRncZJS5SkGwKLKQtf8WPU+hVbPtjqV0Y5i9YxfTcDtGYxcw/x2x?=
 =?us-ascii?Q?OHWVjBZ4ETLfU5Ht441ubUEdrc2+ZA+b/LzV4QY6/vXSD8xqdbjFUXyFo4Ra?=
 =?us-ascii?Q?lwzwayNZtTTJjg6TD6urOr0X3BUto9Y7yw3RpK2PKNIJtUPEWysfS6A0ggyO?=
 =?us-ascii?Q?BR1s8eVQmf6ksWyjZV6iArUkrHwfHw74vc5x/+tAqIftVnI579cPu3vdK9Zh?=
 =?us-ascii?Q?ggVcMwep6V2lg5DkV8ODtIuTSqqru3xZYtYMf8fCpgMICdS3GtX9UplSKM/3?=
 =?us-ascii?Q?ClDbgObe/4LzaDehK0cxSKSBTiVxnWSxTj/SLtMQbudWljZ2ksJJnKBCfQAq?=
 =?us-ascii?Q?D+BySID/h3ceXFov3fzhYfiyUe5nk/oCKzezT1rNPXAtm143bUA9DdOW3KI9?=
 =?us-ascii?Q?sGAXVSc0CbQjCJ8Z/lRv8C84ws7gAPQrrAdvSu2Xaf0jhqLXhJ4NHlLirXGw?=
 =?us-ascii?Q?fcggoV09Nm6DEXg5inrO+fA=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 cdb427dc-2a3b-459f-912e-08dc51e32478
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2024 00:31:59.2320
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 AjEUjXZL1EsBfAomzFC2549DO1WqE429hS6GMGwFm8QDOkgtcoiGuaOrQUbqhXWHrgp9CGQ1oX63+EuUwrCL0H+dlvXwgbCBnRUXZGYmYEZWFUngmOEd9CX6G0kMonYM
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB9964
Message-ID-Hash: 4Q3FAOTICWUGZRDN2EHDPBFLH6W7PRBB
X-Message-ID-Hash: 4Q3FAOTICWUGZRDN2EHDPBFLH6W7PRBB
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4Q3FAOTICWUGZRDN2EHDPBFLH6W7PRBB/>
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
index 282256d18cc6..0178f6ba1b73 100644
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
index abb87bb88fff..63c860a5b40d 100644
--- a/sound/soc/intel/avs/boards/ssm4567.c
+++ b/sound/soc/intel/avs/boards/ssm4567.c
@@ -121,8 +121,6 @@ static int avs_create_dai_link(struct device *dev, const char *platform_name, in
 	dl->be_hw_params_fixup = avs_ssm4567_be_fixup;
 	dl->nonatomic = 1;
 	dl->no_pcm = 1;
-	dl->dpcm_capture = 1;
-	dl->dpcm_playback = 1;
 	dl->ignore_pmdown_time = 1;
 
 	*dai_link = dl;
-- 
2.25.1

