Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EE0C8A91F1
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Apr 2024 06:17:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F3679A4B;
	Thu, 18 Apr 2024 06:17:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F3679A4B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1713413844;
	bh=LyhYdDQi2Lh3dQNaIeUZ7JjWYp4mA6SCRaG2g3WQvTA=;
	h=To:In-Reply-To:References:From:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=VmCEXG0d4D7tLbopx0C12UYmkYjpZVq75G4us2Oo7SOtcJTLgUpxizJBrk8lzb7Nm
	 fL2ePSWB4yijBioX/Pp8XLySHiucMTXsxVjuf3ipCYM0dFWE9Zy03dyI6JcVs0YgLa
	 QQLV2xkV8FRslFe6UAGzC+fzIioQ7Pe57oZH8KL4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6D867F806BC; Thu, 18 Apr 2024 06:15:12 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B5149F806E3;
	Thu, 18 Apr 2024 06:15:11 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6896EF8057B; Thu, 18 Apr 2024 06:14:36 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 77364F805E6
	for <alsa-devel@alsa-project.org>; Thu, 18 Apr 2024 06:14:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 77364F805E6
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=SLHpdcAH
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mAg2LapxCUKCJZxqOyZHs6YanK7y6gBV6F0fHhrh2VMwzVe9IBW1CzgdzaMvRSqqh9cLAsUyaSyqGqvI/sOhlqjQo7wO5kulq1JkwcTrptrkEbdxTDSvf0wydkHVIp/nFA2/A5edaAphbSJENBcorJI6+cmVJmpZb5+1DcGUAocqMR4QJ9pwdQL2iInQ2lNJgQ32NZ3DCBxahMGNKofH9HF/2Bx92tFQFx6mKz1Aqz1Y/awR00MM06kGPKOStbki7HUcoMQ+cL1VS00c7oFv5HIstfQvjP/B5qTL3C5dbzfnWrexLu4S5uheqfQYNV40P0ByuUFlwa5mqeKUjRUjtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YTcJDyoKEVyp1Q+5yiZ2usCzHFZkG2TZD7VLZgBJ2fo=;
 b=kNeVwQi4VjHnecqgLYru1roI5v/ucIRFMFxTgXKS3HfiKg0GaElnUFsiEgHos9AxADAJN4/LSGQiza2L53DfJdpEBg/3N6gJvOj1xUN43Le1UkPjJ6QatkqaaRORuiikN3dW3d4ASZtM2LcsVVg1DujFd8jgw4ggyYI+1+svpYPFeQcGre3xUfefLo+RUR7M1o8SXhuABctFSg5dgI5Z4WbR4StBzbos8cFfAz+y7yUcezoWTLn6+3IwbqzewF0V7ukJjXkmE9+bPNOhrapHM0Gxtw4ZZTq1d4fxZc8yfpf2BmtFrzoO2hXOUAjPqzr++i2TlbRKy4bU1AkGLUaEMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YTcJDyoKEVyp1Q+5yiZ2usCzHFZkG2TZD7VLZgBJ2fo=;
 b=SLHpdcAHuO2Bzfm0H1CdIptxlEgTu7/kSLWNBxdd7rM3MxcZjFWsfM+/vSEioqlJ8d58UI0V4RUBzg3oYBYCQMYX/Rg0MT8n6Ts6r8oU0XJFps9Ag2hUxW2V9WITl9YO+YICGtExi5b/EEU4B/xkSWkWN0p7zhyoucCHJdJxdLU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSAPR01MB7397.jpnprd01.prod.outlook.com
 (2603:1096:604:142::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.39; Thu, 18 Apr
 2024 04:14:22 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::131e:55c0:a4a0:713b]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::131e:55c0:a4a0:713b%7]) with mapi id 15.20.7472.037; Thu, 18 Apr 2024
 04:14:22 +0000
Message-ID: <87y19b71eq.wl-kuninori.morimoto.gx@renesas.com>
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
Subject: [PATCH v3 13/23] ASoC: Intel: avs: boards: Replace
 dpcm_playback/capture to playback/capture_assertion
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 18 Apr 2024 04:14:21 +0000
X-ClientProxiedBy: TYAPR01CA0220.jpnprd01.prod.outlook.com
 (2603:1096:404:11e::16) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSAPR01MB7397:EE_
X-MS-Office365-Filtering-Correlation-Id: 3196ce8b-c6fc-4695-2d21-08dc5f5e0652
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	NflNqLVBMznfhP6YXN/MRTMMuFjfbiPDloylZcpx6WEXFMwS546UjXY9qEoEFAys1XcpgMP8IPr7514CIH7J2tl5GDXmlwcXkFemX5r6UVql4BH9RPBKP88bOQHI4ov+FYpTAnA4OTE5m8+7p8votuTu61nu1iTb7nDDhlj8lD/t7NzzElnosRJxiqw4sg6kjtTg/C5noGCjmfu2jGia6xYF88aDUTtErqWwGoVi0LzV7GfCsjkkyXQ/DJ52pX3Drq9y3PCl+fFuwF+kGZVDMXFXc+UFWpbJnDCEWtFydPGWcFujTriOZGr0/sSu501m3xhA97d/H0wE7HygvUBDFo6NPdqVlClZkPqr/tDvGMCP2jiMlcXJ/AVSKpJV9Xc/RTV/9HRkFPwYO1MYxfAOWrbE8uI3MP6cQDf5NzgtOWJiKX+WYXFE7Fcu/xjpGAk1mT79rDsP3MU5P2nYaBvqzXRseTicp5h5VAfF4H6cO60heakfDcNm3Le/o3j/3sRnn6TU7AzUvY8skXaxDChncLzmnSUfcnWxEm8/dcV+GRKSNiRw8VTPHZF26mxMniHPioUebsy3yT2H3TXs084F3QMb971F/VnFvhA/6ikk7rTMqmsfJY47Sg9/BQ+W9ItixrNm+V/yawf5n+6s3FYNBr8umn9ppLMpEPg0swLm2nN4vnSFk6YZlomlJqYZ0LDSMYSkKQ5awz1tDUdIapijARpun2+5MESckJ10WfmhzWA=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(52116005)(7416005)(1800799015)(376005)(366007)(38350700005)(921011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?qkPKozcO76eOaniuVMmgePdZQQipJIMuhBXm+z2+DEgWllJamCR3xMKEebtD?=
 =?us-ascii?Q?wFa1R1gFnVdQmCH4pI8g73jw7g9DIdSjR3AtD8nJn6WWHfLaVN6EV7j9g9ie?=
 =?us-ascii?Q?PiimcID9QvNe8pq9CAUW/OSizrRkPBqDgDEN1jPM3cZf+4MqHxDXZNEhCc1i?=
 =?us-ascii?Q?Zid2Cjfa/ORaFnlwh1PLOdQ6WGlBpzxqLnumCGpZu3J3NgtX22iSaqWzQMvf?=
 =?us-ascii?Q?/iTuJvn3aZnGocHOoxDT8jgsc/zTW5ojEfudBkYJEWKo0o5797XpD+bo/FB/?=
 =?us-ascii?Q?O1T0cinQ3sx/hSItSejZ1+nWwP3g1QI6xKzupoM3fVHgwH5L/Vo54BpsV87B?=
 =?us-ascii?Q?zEzbeRMehcly98skfozHNQGepaNqYFjvbc8CBP6fx/ho3KZdywuYU3bREz+y?=
 =?us-ascii?Q?hlHU4wk3fx+bC64g4UHCOJlz3nKg1RXluNi6ZvN/zzrlYJBiW49q2oFIJRfE?=
 =?us-ascii?Q?8w5OoUm7OZJ6xVRWUAklRLvfUclW0y9xovSue7gztHseRTBkgSQZHJF15JiO?=
 =?us-ascii?Q?2lE+BGMyeafBLI3TzNNVQZVZl9Vw0FkAWoWwn7jszysmOlZivyKusG87GYz1?=
 =?us-ascii?Q?YYaRTkVOPbm9x47R1stL9RaR8DI+r3thok7C81k20MhG/8ucm4bDxYPBSqjE?=
 =?us-ascii?Q?KeurLendZyt6Kl/feuXDPv+c4S7YRJ1Yc4zEgr1fFgo5ezXhdoTNjBW5bc6U?=
 =?us-ascii?Q?Vf98g1h5eJHmyWn+G8jpLWZxS1sL0Hmjw57+2KZcw9D7Dl2/sdziqOYF7GMu?=
 =?us-ascii?Q?NXQ38uPHtJ14UNguIkeAvKcCmbxnzPSDKs+KXI4vysn08FbiehMy2OTCeiPH?=
 =?us-ascii?Q?Iz2shjg/rskksCGCbMhsN3SgqHcQRvHXLgNS+Cg+LrsS1ib6b3B42hvRgJMY?=
 =?us-ascii?Q?l9oit8i53cBLCMP2ESF5BM7YI2gEhVXkRnuizG2vvti23cVgb9zkTRFttBKL?=
 =?us-ascii?Q?RG/VebymKdXJCbYcEOQ/8Ak1QRSXbcrjlrAuh6HLy3dLjaVOKYOV8tLgYmY8?=
 =?us-ascii?Q?GD/MqQGfSJz1DvN69mXosuAJtSZ3odInYPI9iiPgAtfAVQJ17qmgnb5ZmKgl?=
 =?us-ascii?Q?M7INxY2G1GZbxW9tRfa00Ujy46BSTKZiv/Ypm2kJskGeD2kFRqtYOgMuC5FK?=
 =?us-ascii?Q?xE2gytWeGxgzHQWtxR8r2ELYh/F8/SQcUURmU4lHIANFcRi7QK7LYN6ywpYK?=
 =?us-ascii?Q?dvZGRh07RcVDgqDrb+1ZsNacQSuuaC3aJIzu3gt0NyeM4xUFDoUt/CXz1ATN?=
 =?us-ascii?Q?COB4wzNlTkEvjbZPwGZAQCXBHXVA5GZlzrUoCdQINMIM9ls3eF4lvHUBdLnW?=
 =?us-ascii?Q?iB7QXP0vZfZeZTek0U/6dufboYOBH+Pe2Cd24lpwcsLGlgp3O9p453l6TX/p?=
 =?us-ascii?Q?uHE5QrTvk+WamfJyJi/6Q6UDO1oHZIj2wKW1ToWdgBbPivtpcAP8X99hWaU+?=
 =?us-ascii?Q?wCgYaOJPpCnRT+W2xxOS+kq/Tmfe53Z9se1e1dsrQ4xWSeJSIrv94hx2zapo?=
 =?us-ascii?Q?H3tT4ptfxadx+gYKBUOBW0g7E0xf6VYupQYkjh6ueFc2bbdiVAIDiVjGIOON?=
 =?us-ascii?Q?wHrdwpxS553TDoniqUnu7vYd7MEucggGi1hDYOG24DPAyQtf7Zu1GsCmaSpi?=
 =?us-ascii?Q?vYKdo/y1iEutFhs6lFlYgL0=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 3196ce8b-c6fc-4695-2d21-08dc5f5e0652
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2024 04:14:22.5271
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 CI1ZvkB7zOEBf4IMu3r0BZGWz8IKQy3B72j/P9jU5Z2N3phf8mHrxKNIXfj6wcKLESpCp1G3a+dSrpYDx4KeUn0uFkWVLh6b6CoCfvtXUwYDhYNKDuDuAUnGc0FpkZYe
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSAPR01MB7397
Message-ID-Hash: LW4B4UXS2NOTHZ2GVV26MPBUBMERWDSY
X-Message-ID-Hash: LW4B4UXS2NOTHZ2GVV26MPBUBMERWDSY
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
Archived-At: <>
List-Archive: <>
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
 sound/soc/intel/avs/boards/da7219.c    | 4 ++--
 sound/soc/intel/avs/boards/dmic.c      | 4 ++--
 sound/soc/intel/avs/boards/es8336.c    | 4 ++--
 sound/soc/intel/avs/boards/hdaudio.c   | 8 ++++----
 sound/soc/intel/avs/boards/i2s_test.c  | 4 ++--
 sound/soc/intel/avs/boards/max98357a.c | 2 +-
 sound/soc/intel/avs/boards/max98373.c  | 4 ++--
 sound/soc/intel/avs/boards/max98927.c  | 4 ++--
 sound/soc/intel/avs/boards/nau8825.c   | 4 ++--
 sound/soc/intel/avs/boards/rt274.c     | 4 ++--
 sound/soc/intel/avs/boards/rt286.c     | 4 ++--
 sound/soc/intel/avs/boards/rt298.c     | 4 ++--
 sound/soc/intel/avs/boards/rt5514.c    | 2 +-
 sound/soc/intel/avs/boards/rt5663.c    | 4 ++--
 sound/soc/intel/avs/boards/rt5682.c    | 4 ++--
 sound/soc/intel/avs/boards/ssm4567.c   | 4 ++--
 16 files changed, 32 insertions(+), 32 deletions(-)

diff --git a/sound/soc/intel/avs/boards/da7219.c b/sound/soc/intel/avs/boards/da7219.c
index fc072dc58968..1137fc490369 100644
--- a/sound/soc/intel/avs/boards/da7219.c
+++ b/sound/soc/intel/avs/boards/da7219.c
@@ -203,8 +203,8 @@ static int avs_create_dai_link(struct device *dev, const char *platform_name, in
 	dl->exit = avs_da7219_codec_exit;
 	dl->nonatomic = 1;
 	dl->no_pcm = 1;
-	dl->dpcm_capture = 1;
-	dl->dpcm_playback = 1;
+	dl->capture_assertion = 1;
+	dl->playback_assertion = 1;
 
 	*dai_link = dl;
 
diff --git a/sound/soc/intel/avs/boards/dmic.c b/sound/soc/intel/avs/boards/dmic.c
index d9e5e85f5233..0035900c5237 100644
--- a/sound/soc/intel/avs/boards/dmic.c
+++ b/sound/soc/intel/avs/boards/dmic.c
@@ -22,7 +22,7 @@ static struct snd_soc_dai_link card_dai_links[] = {
 	{
 		.name = "DMIC",
 		.id = 0,
-		.dpcm_capture = 1,
+		.capture_assertion = 1,
 		.nonatomic = 1,
 		.no_pcm = 1,
 		SND_SOC_DAILINK_REG(dmic_pin, dmic_codec, platform),
@@ -30,7 +30,7 @@ static struct snd_soc_dai_link card_dai_links[] = {
 	{
 		.name = "DMIC WoV",
 		.id = 1,
-		.dpcm_capture = 1,
+		.capture_assertion = 1,
 		.nonatomic = 1,
 		.no_pcm = 1,
 		.ignore_suspend = 1,
diff --git a/sound/soc/intel/avs/boards/es8336.c b/sound/soc/intel/avs/boards/es8336.c
index ff3bd1513269..120fe60242dc 100644
--- a/sound/soc/intel/avs/boards/es8336.c
+++ b/sound/soc/intel/avs/boards/es8336.c
@@ -233,8 +233,8 @@ static int avs_create_dai_link(struct device *dev, const char *platform_name, in
 	dl->ops = &avs_es8336_ops;
 	dl->nonatomic = 1;
 	dl->no_pcm = 1;
-	dl->dpcm_capture = 1;
-	dl->dpcm_playback = 1;
+	dl->capture_assertion = 1;
+	dl->playback_assertion = 1;
 
 	*dai_link = dl;
 
diff --git a/sound/soc/intel/avs/boards/hdaudio.c b/sound/soc/intel/avs/boards/hdaudio.c
index 4433175814f8..b91fe6390894 100644
--- a/sound/soc/intel/avs/boards/hdaudio.c
+++ b/sound/soc/intel/avs/boards/hdaudio.c
@@ -39,8 +39,8 @@ static int avs_create_dai_links(struct device *dev, struct hda_codec *codec, int
 		dl[i].id = i;
 		dl[i].nonatomic = 1;
 		dl[i].no_pcm = 1;
-		dl[i].dpcm_playback = 1;
-		dl[i].dpcm_capture = 1;
+		dl[i].playback_assertion = 1;
+		dl[i].capture_assertion = 1;
 		dl[i].platforms = platform;
 		dl[i].num_platforms = 1;
 		dl[i].ignore_pmdown_time = 1;
@@ -160,8 +160,8 @@ static const struct snd_soc_dai_link probing_link = {
 	.id = -1,
 	.nonatomic = 1,
 	.no_pcm = 1,
-	.dpcm_playback = 1,
-	.dpcm_capture = 1,
+	.playback_assertion = 1,
+	.capture_assertion = 1,
 	.cpus = &snd_soc_dummy_dlc,
 	.num_cpus = 1,
 	.init = avs_probing_link_init,
diff --git a/sound/soc/intel/avs/boards/i2s_test.c b/sound/soc/intel/avs/boards/i2s_test.c
index d41955685664..b1087aaa5348 100644
--- a/sound/soc/intel/avs/boards/i2s_test.c
+++ b/sound/soc/intel/avs/boards/i2s_test.c
@@ -46,8 +46,8 @@ static int avs_create_dai_link(struct device *dev, const char *platform_name, in
 	dl->id = 0;
 	dl->nonatomic = 1;
 	dl->no_pcm = 1;
-	dl->dpcm_capture = 1;
-	dl->dpcm_playback = 1;
+	dl->capture_assertion = 1;
+	dl->playback_assertion = 1;
 
 	*dai_link = dl;
 
diff --git a/sound/soc/intel/avs/boards/max98357a.c b/sound/soc/intel/avs/boards/max98357a.c
index 1ff85e4d8e16..eeafdc3c4364 100644
--- a/sound/soc/intel/avs/boards/max98357a.c
+++ b/sound/soc/intel/avs/boards/max98357a.c
@@ -82,7 +82,7 @@ static int avs_create_dai_link(struct device *dev, const char *platform_name, in
 	dl->be_hw_params_fixup = avs_max98357a_be_fixup;
 	dl->nonatomic = 1;
 	dl->no_pcm = 1;
-	dl->dpcm_playback = 1;
+	dl->playback_assertion = 1;
 
 	*dai_link = dl;
 
diff --git a/sound/soc/intel/avs/boards/max98373.c b/sound/soc/intel/avs/boards/max98373.c
index 8d31586b73ea..1b561a0c6ec5 100644
--- a/sound/soc/intel/avs/boards/max98373.c
+++ b/sound/soc/intel/avs/boards/max98373.c
@@ -134,8 +134,8 @@ static int avs_create_dai_link(struct device *dev, const char *platform_name, in
 	dl->be_hw_params_fixup = avs_max98373_be_fixup;
 	dl->nonatomic = 1;
 	dl->no_pcm = 1;
-	dl->dpcm_capture = 1;
-	dl->dpcm_playback = 1;
+	dl->capture_assertion = 1;
+	dl->playback_assertion = 1;
 	dl->ignore_pmdown_time = 1;
 	dl->ops = &avs_max98373_ops;
 
diff --git a/sound/soc/intel/avs/boards/max98927.c b/sound/soc/intel/avs/boards/max98927.c
index 572ec58073d0..38188887b631 100644
--- a/sound/soc/intel/avs/boards/max98927.c
+++ b/sound/soc/intel/avs/boards/max98927.c
@@ -131,8 +131,8 @@ static int avs_create_dai_link(struct device *dev, const char *platform_name, in
 	dl->be_hw_params_fixup = avs_max98927_be_fixup;
 	dl->nonatomic = 1;
 	dl->no_pcm = 1;
-	dl->dpcm_capture = 1;
-	dl->dpcm_playback = 1;
+	dl->capture_assertion = 1;
+	dl->playback_assertion = 1;
 	dl->ignore_pmdown_time = 1;
 	dl->ops = &avs_max98927_ops;
 
diff --git a/sound/soc/intel/avs/boards/nau8825.c b/sound/soc/intel/avs/boards/nau8825.c
index 3164745b1516..0dce214bbe49 100644
--- a/sound/soc/intel/avs/boards/nau8825.c
+++ b/sound/soc/intel/avs/boards/nau8825.c
@@ -210,8 +210,8 @@ static int avs_create_dai_link(struct device *dev, const char *platform_name, in
 	dl->ops = &avs_nau8825_ops;
 	dl->nonatomic = 1;
 	dl->no_pcm = 1;
-	dl->dpcm_capture = 1;
-	dl->dpcm_playback = 1;
+	dl->capture_assertion = 1;
+	dl->playback_assertion = 1;
 
 	*dai_link = dl;
 
diff --git a/sound/soc/intel/avs/boards/rt274.c b/sound/soc/intel/avs/boards/rt274.c
index e3aa28780df5..849583182c8c 100644
--- a/sound/soc/intel/avs/boards/rt274.c
+++ b/sound/soc/intel/avs/boards/rt274.c
@@ -183,8 +183,8 @@ static int avs_create_dai_link(struct device *dev, const char *platform_name, in
 	dl->be_hw_params_fixup = avs_rt274_be_fixup;
 	dl->nonatomic = 1;
 	dl->no_pcm = 1;
-	dl->dpcm_capture = 1;
-	dl->dpcm_playback = 1;
+	dl->capture_assertion = 1;
+	dl->playback_assertion = 1;
 
 	*dai_link = dl;
 
diff --git a/sound/soc/intel/avs/boards/rt286.c b/sound/soc/intel/avs/boards/rt286.c
index d24316fc4db9..881ac2139215 100644
--- a/sound/soc/intel/avs/boards/rt286.c
+++ b/sound/soc/intel/avs/boards/rt286.c
@@ -153,8 +153,8 @@ static int avs_create_dai_link(struct device *dev, const char *platform_name, in
 	dl->ops = &avs_rt286_ops;
 	dl->nonatomic = 1;
 	dl->no_pcm = 1;
-	dl->dpcm_capture = 1;
-	dl->dpcm_playback = 1;
+	dl->capture_assertion = 1;
+	dl->playback_assertion = 1;
 
 	*dai_link = dl;
 
diff --git a/sound/soc/intel/avs/boards/rt298.c b/sound/soc/intel/avs/boards/rt298.c
index 7fd28544f786..7df1b7711323 100644
--- a/sound/soc/intel/avs/boards/rt298.c
+++ b/sound/soc/intel/avs/boards/rt298.c
@@ -173,8 +173,8 @@ static int avs_create_dai_link(struct device *dev, const char *platform_name, in
 	dl->ops = &avs_rt298_ops;
 	dl->nonatomic = 1;
 	dl->no_pcm = 1;
-	dl->dpcm_capture = 1;
-	dl->dpcm_playback = 1;
+	dl->capture_assertion = 1;
+	dl->playback_assertion = 1;
 
 	*dai_link = dl;
 
diff --git a/sound/soc/intel/avs/boards/rt5514.c b/sound/soc/intel/avs/boards/rt5514.c
index 097ae5f73241..8daf3a28c561 100644
--- a/sound/soc/intel/avs/boards/rt5514.c
+++ b/sound/soc/intel/avs/boards/rt5514.c
@@ -121,7 +121,7 @@ static int avs_create_dai_link(struct device *dev, const char *platform_name, in
 	dl->be_hw_params_fixup = avs_rt5514_be_fixup;
 	dl->nonatomic = 1;
 	dl->no_pcm = 1;
-	dl->dpcm_capture = 1;
+	dl->capture_assertion = 1;
 	dl->ops = &avs_rt5514_ops;
 
 	*dai_link = dl;
diff --git a/sound/soc/intel/avs/boards/rt5663.c b/sound/soc/intel/avs/boards/rt5663.c
index ba8c42d026da..89d476368791 100644
--- a/sound/soc/intel/avs/boards/rt5663.c
+++ b/sound/soc/intel/avs/boards/rt5663.c
@@ -171,8 +171,8 @@ static int avs_create_dai_link(struct device *dev, const char *platform_name, in
 	dl->be_hw_params_fixup = avs_rt5663_be_fixup;
 	dl->nonatomic = 1;
 	dl->no_pcm = 1;
-	dl->dpcm_capture = 1;
-	dl->dpcm_playback = 1;
+	dl->capture_assertion = 1;
+	dl->playback_assertion = 1;
 	dl->ops = &avs_rt5663_ops;
 
 	*dai_link = dl;
diff --git a/sound/soc/intel/avs/boards/rt5682.c b/sound/soc/intel/avs/boards/rt5682.c
index 823f04dba2f7..2f236e4661db 100644
--- a/sound/soc/intel/avs/boards/rt5682.c
+++ b/sound/soc/intel/avs/boards/rt5682.c
@@ -242,8 +242,8 @@ static int avs_create_dai_link(struct device *dev, const char *platform_name, in
 	dl->ops = &avs_rt5682_ops;
 	dl->nonatomic = 1;
 	dl->no_pcm = 1;
-	dl->dpcm_capture = 1;
-	dl->dpcm_playback = 1;
+	dl->capture_assertion = 1;
+	dl->playback_assertion = 1;
 
 	*dai_link = dl;
 
diff --git a/sound/soc/intel/avs/boards/ssm4567.c b/sound/soc/intel/avs/boards/ssm4567.c
index 9e78a3b91208..4c1864fb1c0a 100644
--- a/sound/soc/intel/avs/boards/ssm4567.c
+++ b/sound/soc/intel/avs/boards/ssm4567.c
@@ -121,8 +121,8 @@ static int avs_create_dai_link(struct device *dev, const char *platform_name, in
 	dl->be_hw_params_fixup = avs_ssm4567_be_fixup;
 	dl->nonatomic = 1;
 	dl->no_pcm = 1;
-	dl->dpcm_capture = 1;
-	dl->dpcm_playback = 1;
+	dl->capture_assertion = 1;
+	dl->playback_assertion = 1;
 	dl->ignore_pmdown_time = 1;
 
 	*dai_link = dl;
-- 
2.25.1

