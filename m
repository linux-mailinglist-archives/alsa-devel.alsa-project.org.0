Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1368789369B
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Apr 2024 02:33:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4693A210C;
	Mon,  1 Apr 2024 02:33:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4693A210C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1711931596;
	bh=EC58Pgnwd+VEFGbWuvwH46Mg6zwKDnOHHae8JMV5/BI=;
	h=To:In-Reply-To:References:From:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=D/Yx4ADehTg+4uiHyy9msDGHV5GGbB+rERPWPJ6DL1WJHaULCT1N2TKtIZS74Q856
	 NeIXJGyWsAAz9WPesC67IhqR6MS/ERkjaDKLwzYUmMu4338FvvfODVF3I9YN1Lnuqz
	 mRIZfMwyVGeHlHmdTzjbgM3cr7cQwuL7gyejnVUY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 41128F80632; Mon,  1 Apr 2024 02:31:56 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CFC00F8064F;
	Mon,  1 Apr 2024 02:31:54 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 066D8F8057D; Mon,  1 Apr 2024 02:31:46 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id D8BE2F8061C
	for <alsa-devel@alsa-project.org>; Mon,  1 Apr 2024 02:31:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D8BE2F8061C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=fk3B29lr
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XU+6tq36Btj0jzxi3S2HJBiDfDlzxPVPJB9ASx1D9bDNBFz05F4hWtjNJwGvujsyfdADLa139EE17LNY8PlFl8tJklaQFyu+ShxpoReO3IgV/mHkjIe+opLcZLieANlBRimVeAmoU/VcHewtu1izacc7uZi0aeQx6O2iuto2BXb688sQFEH7whGiiQuVMVr4UH2BWLykh68Kpj6xeZdie6LXbkMCKNvx9dD93kt6ChlMhmuK1x3jhcmxw5L5q6ezS+0eTeDVZAqFw5o6mGXm0E2XAU1y4682i3hjVPkXykiso673twc6203pqz8AAe4ALCyRW5ZFB7lM58/RtAWOcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fUGgWgkGAmv98FPIpJdbHsepoDW43v5AJX+4FBow/JA=;
 b=dN5RuBGHECiNHfMNMqT1+zjM6Y7c/2WNsV7V0fcky1AQV/d+zCan/6ebHlconBScrHTMxL7UATtwRPzh36dg0w/IZH7SxbfXDkB0ipyM/Av4loJdKbgYQ0cdWgg+J0hqbGFeI6SYQFCOqJ68jF7ncv466A4qgidZ9WFPprk738aAi49yFakN7l+QYVQi/SaA1Jor4nI1XfMPL6ALrVVMZLR2ia35398X383mu0qQxav/QpOrbAD+6saHzDWmWsQzPIwbCpdSuuFerFaGAjwjKkpjHLDREonV1IQvPFKudrCw6cHVzqOyzZ9+6VIvBzeto28U6e81q93jj+zz4wEcvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fUGgWgkGAmv98FPIpJdbHsepoDW43v5AJX+4FBow/JA=;
 b=fk3B29lrqpAsORBA/q77qWmbr9jR637YOLTlkGz0PsBpUqggCj3ywLjYAgtLxD6aFoWrPRwTS74wswz2xAHpok9CzIGUgAsCLSBCI43QPpC15wmGkKDdYD3kNInJlOeK+l6hxlpcTscgNm0zvJNc4TML0Cln1pjF2+Uo+ZEFphA=
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS3PR01MB8258.jpnprd01.prod.outlook.com
 (2603:1096:604:175::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Mon, 1 Apr
 2024 00:31:22 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::131e:55c0:a4a0:713b]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::131e:55c0:a4a0:713b%7]) with mapi id 15.20.7386.025; Mon, 1 Apr 2024
 00:31:22 +0000
Message-ID: <87r0fpudnq.wl-kuninori.morimoto.gx@renesas.com>
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
Subject: [PATCH v2 06/16] ASoC: Intel: Replace dpcm_playback/capture to
 playback/capture_only
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 1 Apr 2024 00:31:21 +0000
X-ClientProxiedBy: TYWP286CA0022.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:262::8) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS3PR01MB8258:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Mph7sgjWjtvPuK3Q/2xW8aQGTh0wR78Lvmi6AZHimp1kwNgLhlAfKaINWs2pl3txpWYxQR29wVWhHAry9yH6Un3IT5bCyOyINCkYqnPZHVAs3C+BWLpCClYbdbqfpUsu7+6CxOwVC0O6Rgx9Rq86QXZ0Mgz+8F6sDOZ6fqNnLn2ywQt6ukJaSdVKx8Cn2iG76GykyOL/4bmsFos/YzMCmfrwcy67IlSLJtybUvzIpMlFTCIiDHU2hQQ0zaDvEYLP7az+cdNeejW98CRioIiP549PzapuiLS7CmujrichkbMun3iwNJj9kUDE/iQiZBGHQ1WVeWOIa4P52z7Ponsy0puDBUpBr+Y9DtZGPd5q+ETVDaWO8d29QEcbXIXI8o46q8T3NAezysaLXN6pw9W9nJTy5VnnNjx61TMSP9BaqMF9juxTg65uln/5pBmlnQiKhSV0Lck2pvl8QgxOZ14EWk/obFLMum14Iyffo2uMwevQx2XFEi53yvfWdcWP5ddLMXbDBw8z/JTia3j2fPS1uVzG/98SdR1qc5Z65CXSX+CjsOWTuKVpL4aYVSBLSpQ1GW4ZOp6NxuJFmUV2nBN7eOk2CAG2pCeDGqB86ua3YCzYufrz7v8NYt+JfK7Vf/gB0t6h+UiTvNSIKUwrlQve4cPC21vfHE2pzY1sb8ciJacQAvfZK/0fFfbKd2oZgZfCHbK/y2ZN8KMp4TLw95ekaovetSDTTPmVzkzFz8eSYf0=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7416005)(376005)(52116005)(1800799015)(366007)(921011)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?qZHBjkMrkM0DsaywSAxb9tjkMVe3QQDxAQ2jwWUvAfGhWGADzM/MoyR6J55P?=
 =?us-ascii?Q?uhkKYNkeFHghuaPBcHxnKzM4idiSUrEBUFOTuZqKMtpOAKke6yk1kxl6ASTX?=
 =?us-ascii?Q?Z7/UI8jgZKG9DbhGHAz2B66Vp2SdepuT68V4DNNI0KzrBfYDB7ZeGoIUdra5?=
 =?us-ascii?Q?059togxNYuNAoPvy4atxeQU15035fScO+vc7N6ota21qeTTsPu1VzfUEeELc?=
 =?us-ascii?Q?6hqJ4Be4nd2IW4eORSH0SOz09tfGZO4cN80GRuqkGl5wsKuefYmJVsQ9Vltu?=
 =?us-ascii?Q?620GiHXEhsL/QyOiKus4NAgcH3iyeKaa4KUEtbs1KxGUjzPFpJR0cYDP1gU0?=
 =?us-ascii?Q?3ghc4O8uVK5faplgbrvB0rNvMwArayfBWQx3f3qGNaCUHJHyyCcuOmGAYJG1?=
 =?us-ascii?Q?IWIpAzmPtWM1MseiwTk2iMgBjnAraU6Lac37mnOD11zCuOTwJombgsVx457I?=
 =?us-ascii?Q?sn2yMXg+MColQchoRs+Cu2TC68hfGhovgUHb97BTGkFkhgBxodLnQYWevhCu?=
 =?us-ascii?Q?91nCTXdWXWebR/S8N6zTQRFS6O/ka/gIhWJsHdniHCrur+FfbpmFymMm6aBM?=
 =?us-ascii?Q?2tA2Gd7NM57E9eb3EyypqasYbOH1oJBjMRWeCeHOLpLFi5tH+aiYx08bmHYO?=
 =?us-ascii?Q?CYbIedEJXwFot35QG9EcNhORju4yQ2e7pvggt6p8ugnPDsVx1t2+cU0OFE3I?=
 =?us-ascii?Q?jmxfFJih5c+o9GpzoFoemErFkwdNDJMLno4YiLpEo8ntrUQl6dfHVLrZpS7c?=
 =?us-ascii?Q?yViLqzYaeaicLNU+5vAZXWTmZd+81TEAVQNTxb6rUAa7qGMMp51JTiwLQIml?=
 =?us-ascii?Q?zg+WRqUHriQ8jzJINPYN7JHN4uuMVALHmHGgUIQ0VF9ZKnEH3hjz1z0M2CIU?=
 =?us-ascii?Q?93FyCfv95esRbvv+eUGcYSKX/9pNKtiPp+brkBR/JsAwkXOHTl1ZXkRfGVch?=
 =?us-ascii?Q?10hzVDdpG38PTRlbxX9KNr868mISRfslMErWCl7g25rV/FP6x+mY2tsTCR8G?=
 =?us-ascii?Q?xiCeLO/kiFX7RHIIdWD1yNnjBujxDBENYm704aJPD8sAjV0I2Rwu30FFbyFl?=
 =?us-ascii?Q?YIg0B6TARHHNSa4d9f/X10J9q925Icd6m6YwfjLRG953wVmtUbCzo1i+ljJC?=
 =?us-ascii?Q?T9c8NUjqBSEGv5qPgpwETopaeZXhCuDe42lWRpvnt07Did6g/aTYj9Bfg7fe?=
 =?us-ascii?Q?7c76Jm8wx6x6oam9J/G5UT11Pj3Y+ChMR7VKNpi5h2XcYTvuGY6rE7ltAhQA?=
 =?us-ascii?Q?MN6+lpNfRh4aDzALojVKtO0q6XgsDtwizP3lCibfsH06t/8n5svt7X+b0CUb?=
 =?us-ascii?Q?IuqgsghSnRMo85oI6UmY9567nyBA1N8vxb+7HBlArtidjdaBft0ZdyHQPunK?=
 =?us-ascii?Q?u7o6n1u6jx8iRYUPP65CmIfEFrPl8Auy8ScbzYZ5zUXGe/sokLplku3LeZxA?=
 =?us-ascii?Q?q1PvsCjlcohMZpz/jG/b14Fl0Mu29ryRFtYHj8NI+cNW+cjBvhGc5cpGKELq?=
 =?us-ascii?Q?dnVV6ThqZx6qRaPhEJka3RN/bkSBpzzVjL9VG4IRHu9B0n58/ux0YUWiHQhy?=
 =?us-ascii?Q?3mqNGT7xGe/0Q8D1xUaO2bmok8BQ6iKh0gRc8bR7JLjrMqLltIsz2HISOOpj?=
 =?us-ascii?Q?h5bfdS9PzfwuJk7Yqyc52BE=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 01813293-b52a-4b6f-6154-08dc51e30e35
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2024 00:31:21.9895
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 dHhqIifkkjJVSLJNW9I9+gIg1aWhxu7x1Cmz5NUYW1cswx06b06wpeCyIrIY/HyB8kKTHNdkBgndIji1hPLrPisl8e816HBLdwBfkoOWe129Sak6RdII6Am1EOqQqYHh
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB8258
Message-ID-Hash: VX6KNHOQ6IZU5ZVRWQRRM2BJJAXR4APS
X-Message-ID-Hash: VX6KNHOQ6IZU5ZVRWQRRM2BJJAXR4APS
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VX6KNHOQ6IZU5ZVRWQRRM2BJJAXR4APS/>
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
 sound/soc/intel/boards/bdw-rt5650.c           |  4 --
 sound/soc/intel/boards/bdw-rt5677.c           |  4 --
 sound/soc/intel/boards/bdw_rt286.c            | 10 ++--
 sound/soc/intel/boards/bxt_da7219_max98357a.c | 32 ++++++-----
 sound/soc/intel/boards/bxt_rt298.c            | 26 +++++----
 sound/soc/intel/boards/bytcht_cx2072x.c       |  6 +--
 sound/soc/intel/boards/bytcht_da7213.c        |  6 +--
 sound/soc/intel/boards/bytcht_es8316.c        |  6 +--
 sound/soc/intel/boards/bytcht_nocodec.c       |  6 +--
 sound/soc/intel/boards/bytcr_rt5640.c         |  6 +--
 sound/soc/intel/boards/bytcr_rt5651.c         |  6 +--
 sound/soc/intel/boards/bytcr_wm5102.c         |  6 +--
 sound/soc/intel/boards/cht_bsw_max98090_ti.c  |  6 +--
 sound/soc/intel/boards/cht_bsw_nau8824.c      |  6 +--
 sound/soc/intel/boards/cht_bsw_rt5645.c       |  6 +--
 sound/soc/intel/boards/cht_bsw_rt5672.c       |  6 +--
 sound/soc/intel/boards/cml_rt1011_rt5682.c    | 15 +++---
 sound/soc/intel/boards/ehl_rt5660.c           | 14 +++--
 sound/soc/intel/boards/glk_rt5682_max98357a.c | 30 +++++------
 sound/soc/intel/boards/hsw_rt5640.c           | 10 ++--
 sound/soc/intel/boards/kbl_da7219_max98357a.c | 26 +++++----
 sound/soc/intel/boards/kbl_da7219_max98927.c  | 54 +++++++++----------
 sound/soc/intel/boards/kbl_rt5660.c           | 18 +++----
 sound/soc/intel/boards/kbl_rt5663_max98927.c  | 44 +++++++--------
 .../intel/boards/kbl_rt5663_rt5514_max98927.c | 22 ++++----
 sound/soc/intel/boards/skl_hda_dsp_common.c   | 14 ++---
 .../soc/intel/boards/skl_nau88l25_max98357a.c | 26 +++++----
 sound/soc/intel/boards/skl_nau88l25_ssm4567.c | 26 ++++-----
 sound/soc/intel/boards/skl_rt286.c            | 26 +++++----
 sound/soc/intel/boards/sof_board_helpers.c    | 13 ++---
 sound/soc/intel/boards/sof_es8336.c           |  8 ++-
 sound/soc/intel/boards/sof_pcm512x.c          |  8 +--
 sound/soc/intel/boards/sof_sdw.c              |  4 +-
 sound/soc/intel/boards/sof_wm8804.c           |  2 -
 34 files changed, 196 insertions(+), 306 deletions(-)

diff --git a/sound/soc/intel/boards/bdw-rt5650.c b/sound/soc/intel/boards/bdw-rt5650.c
index 3ae26f21458f..d9ae8e60dae0 100644
--- a/sound/soc/intel/boards/bdw-rt5650.c
+++ b/sound/soc/intel/boards/bdw-rt5650.c
@@ -239,8 +239,6 @@ static struct snd_soc_dai_link bdw_rt5650_dais[] = {
 			SND_SOC_DPCM_TRIGGER_POST,
 			SND_SOC_DPCM_TRIGGER_POST
 		},
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
 		SND_SOC_DAILINK_REG(fe, dummy, platform),
 	},
 
@@ -256,8 +254,6 @@ static struct snd_soc_dai_link bdw_rt5650_dais[] = {
 		.ignore_pmdown_time = 1,
 		.be_hw_params_fixup = broadwell_ssp0_fixup,
 		.ops = &bdw_rt5650_ops,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
 		.init = bdw_rt5650_init,
 		SND_SOC_DAILINK_REG(ssp0_port, be, platform),
 	},
diff --git a/sound/soc/intel/boards/bdw-rt5677.c b/sound/soc/intel/boards/bdw-rt5677.c
index 304af3d06d01..9484f3410787 100644
--- a/sound/soc/intel/boards/bdw-rt5677.c
+++ b/sound/soc/intel/boards/bdw-rt5677.c
@@ -329,8 +329,6 @@ static struct snd_soc_dai_link bdw_rt5677_dais[] = {
 			SND_SOC_DPCM_TRIGGER_POST,
 			SND_SOC_DPCM_TRIGGER_POST
 		},
-		.dpcm_capture = 1,
-		.dpcm_playback = 1,
 		.ops = &bdw_rt5677_fe_ops,
 		SND_SOC_DAILINK_REG(fe, dummy, platform),
 	},
@@ -356,8 +354,6 @@ static struct snd_soc_dai_link bdw_rt5677_dais[] = {
 		.ignore_pmdown_time = 1,
 		.be_hw_params_fixup = broadwell_ssp0_fixup,
 		.ops = &bdw_rt5677_ops,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
 		.init = bdw_rt5677_init,
 		.exit = bdw_rt5677_exit,
 		SND_SOC_DAILINK_REG(ssp0_port, be, platform),
diff --git a/sound/soc/intel/boards/bdw_rt286.c b/sound/soc/intel/boards/bdw_rt286.c
index 7f20159c23e5..af2ca5fa1b8e 100644
--- a/sound/soc/intel/boards/bdw_rt286.c
+++ b/sound/soc/intel/boards/bdw_rt286.c
@@ -133,8 +133,6 @@ static struct snd_soc_dai_link card_dai_links[] = {
 		.nonatomic = 1,
 		.dynamic = 1,
 		.trigger = {SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST},
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
 		SND_SOC_DAILINK_REG(system, dummy, platform),
 	},
 	{
@@ -143,7 +141,7 @@ static struct snd_soc_dai_link card_dai_links[] = {
 		.nonatomic = 1,
 		.dynamic = 1,
 		.trigger = {SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST},
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		SND_SOC_DAILINK_REG(offload0, dummy, platform),
 	},
 	{
@@ -152,7 +150,7 @@ static struct snd_soc_dai_link card_dai_links[] = {
 		.nonatomic = 1,
 		.dynamic = 1,
 		.trigger = {SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST},
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		SND_SOC_DAILINK_REG(offload1, dummy, platform),
 	},
 	{
@@ -161,7 +159,7 @@ static struct snd_soc_dai_link card_dai_links[] = {
 		.nonatomic = 1,
 		.dynamic = 1,
 		.trigger = {SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST},
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		SND_SOC_DAILINK_REG(loopback, dummy, platform),
 	},
 	/* Back End DAI links */
@@ -177,8 +175,6 @@ static struct snd_soc_dai_link card_dai_links[] = {
 		.ignore_pmdown_time = 1,
 		.be_hw_params_fixup = codec_link_hw_params_fixup,
 		.ops = &codec_link_ops,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
 		SND_SOC_DAILINK_REG(ssp0_port, codec, platform),
 	},
 };
diff --git a/sound/soc/intel/boards/bxt_da7219_max98357a.c b/sound/soc/intel/boards/bxt_da7219_max98357a.c
index 3fe3f38c6cb6..391cf73577a5 100644
--- a/sound/soc/intel/boards/bxt_da7219_max98357a.c
+++ b/sound/soc/intel/boards/bxt_da7219_max98357a.c
@@ -504,7 +504,7 @@ static struct snd_soc_dai_link broxton_dais[] = {
 		.init = broxton_da7219_fe_init,
 		.trigger = {
 			SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST},
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.ops = &broxton_da7219_fe_ops,
 		SND_SOC_DAILINK_REG(system, dummy, platform),
 	},
@@ -516,7 +516,7 @@ static struct snd_soc_dai_link broxton_dais[] = {
 		.nonatomic = 1,
 		.trigger = {
 			SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST},
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		.ops = &broxton_da7219_fe_ops,
 		SND_SOC_DAILINK_REG(system, dummy, platform),
 	},
@@ -527,7 +527,7 @@ static struct snd_soc_dai_link broxton_dais[] = {
 		.nonatomic = 1,
 		.trigger = {
 			SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST},
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.ops = &broxton_da7219_fe_ops,
 		SND_SOC_DAILINK_REG(system2, dummy, platform),
 	},
@@ -536,7 +536,7 @@ static struct snd_soc_dai_link broxton_dais[] = {
 		.name = "Bxt Audio Reference cap",
 		.stream_name = "Refcap",
 		.init = NULL,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		.nonatomic = 1,
 		.dynamic = 1,
 		.ops = &broxton_refcap_ops,
@@ -547,7 +547,7 @@ static struct snd_soc_dai_link broxton_dais[] = {
 		.name = "Bxt Audio DMIC cap",
 		.stream_name = "dmiccap",
 		.init = NULL,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		.nonatomic = 1,
 		.dynamic = 1,
 		.ops = &broxton_dmic_ops,
@@ -557,7 +557,7 @@ static struct snd_soc_dai_link broxton_dais[] = {
 	{
 		.name = "Bxt HDMI Port1",
 		.stream_name = "Hdmi1",
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.init = NULL,
 		.nonatomic = 1,
 		.dynamic = 1,
@@ -567,7 +567,7 @@ static struct snd_soc_dai_link broxton_dais[] = {
 	{
 		.name = "Bxt HDMI Port2",
 		.stream_name = "Hdmi2",
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.init = NULL,
 		.nonatomic = 1,
 		.dynamic = 1,
@@ -577,7 +577,7 @@ static struct snd_soc_dai_link broxton_dais[] = {
 	{
 		.name = "Bxt HDMI Port3",
 		.stream_name = "Hdmi3",
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.init = NULL,
 		.nonatomic = 1,
 		.dynamic = 1,
@@ -594,7 +594,7 @@ static struct snd_soc_dai_link broxton_dais[] = {
 			SND_SOC_DAIFMT_CBC_CFC,
 		.ignore_pmdown_time = 1,
 		.be_hw_params_fixup = broxton_ssp_fixup,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		SND_SOC_DAILINK_REG(ssp5_pin, ssp5_codec, platform),
 	},
 	{
@@ -607,8 +607,6 @@ static struct snd_soc_dai_link broxton_dais[] = {
 			SND_SOC_DAIFMT_CBC_CFC,
 		.ignore_pmdown_time = 1,
 		.be_hw_params_fixup = broxton_ssp_fixup,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
 		SND_SOC_DAILINK_REG(ssp1_pin, ssp1_codec, platform),
 	},
 	{
@@ -616,7 +614,7 @@ static struct snd_soc_dai_link broxton_dais[] = {
 		.id = 2,
 		.ignore_suspend = 1,
 		.be_hw_params_fixup = broxton_dmic_fixup,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		.no_pcm = 1,
 		SND_SOC_DAILINK_REG(dmic_pin, dmic_codec, platform),
 	},
@@ -624,7 +622,7 @@ static struct snd_soc_dai_link broxton_dais[] = {
 		.name = "iDisp1",
 		.id = 3,
 		.init = broxton_hdmi_init,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.no_pcm = 1,
 		SND_SOC_DAILINK_REG(idisp1_pin, idisp1_codec, platform),
 	},
@@ -632,7 +630,7 @@ static struct snd_soc_dai_link broxton_dais[] = {
 		.name = "iDisp2",
 		.id = 4,
 		.init = broxton_hdmi_init,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.no_pcm = 1,
 		SND_SOC_DAILINK_REG(idisp2_pin, idisp2_codec, platform),
 	},
@@ -640,7 +638,7 @@ static struct snd_soc_dai_link broxton_dais[] = {
 		.name = "iDisp3",
 		.id = 5,
 		.init = broxton_hdmi_init,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.no_pcm = 1,
 		SND_SOC_DAILINK_REG(idisp3_pin, idisp3_codec, platform),
 	},
@@ -648,7 +646,7 @@ static struct snd_soc_dai_link broxton_dais[] = {
 		.name = "dmic16k",
 		.id = 6,
 		.be_hw_params_fixup = broxton_dmic_fixup,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		.no_pcm = 1,
 		SND_SOC_DAILINK_REG(dmic16k_pin, dmic_codec, platform),
 	},
@@ -838,7 +836,7 @@ static int broxton_audio_probe(struct platform_device *pdev)
 				if (ctx->spkamp == SPKAMP_MAX98390) {
 					broxton_dais[i].codecs = max98390_codec;
 					broxton_dais[i].num_codecs = ARRAY_SIZE(max98390_codec);
-					broxton_dais[i].dpcm_capture = 1;
+					broxton_dais[i].playback_only = 0;
 				}
 			}
 			/* DIALOG_CODEC is connected to SSP0 */
diff --git a/sound/soc/intel/boards/bxt_rt298.c b/sound/soc/intel/boards/bxt_rt298.c
index afc499be8db2..8ed881454cc1 100644
--- a/sound/soc/intel/boards/bxt_rt298.c
+++ b/sound/soc/intel/boards/bxt_rt298.c
@@ -394,7 +394,7 @@ static struct snd_soc_dai_link broxton_rt298_dais[] = {
 		.dynamic = 1,
 		.init = broxton_rt298_fe_init,
 		.trigger = {SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST},
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.ops = &broxton_rt286_fe_ops,
 		SND_SOC_DAILINK_REG(system, dummy, platform),
 	},
@@ -405,7 +405,7 @@ static struct snd_soc_dai_link broxton_rt298_dais[] = {
 		.nonatomic = 1,
 		.dynamic = 1,
 		.trigger = {SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST},
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		.ops = &broxton_rt286_fe_ops,
 		SND_SOC_DAILINK_REG(system, dummy, platform),
 	},
@@ -414,7 +414,7 @@ static struct snd_soc_dai_link broxton_rt298_dais[] = {
 		.name = "Bxt Audio Reference cap",
 		.stream_name = "refcap",
 		.init = NULL,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		.nonatomic = 1,
 		.dynamic = 1,
 		SND_SOC_DAILINK_REG(reference, dummy, platform),
@@ -424,7 +424,7 @@ static struct snd_soc_dai_link broxton_rt298_dais[] = {
 		.name = "Bxt Audio DMIC cap",
 		.stream_name = "dmiccap",
 		.init = NULL,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		.nonatomic = 1,
 		.dynamic = 1,
 		.ops = &broxton_dmic_ops,
@@ -434,7 +434,7 @@ static struct snd_soc_dai_link broxton_rt298_dais[] = {
 	{
 		.name = "Bxt HDMI Port1",
 		.stream_name = "Hdmi1",
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.init = NULL,
 		.nonatomic = 1,
 		.dynamic = 1,
@@ -444,7 +444,7 @@ static struct snd_soc_dai_link broxton_rt298_dais[] = {
 	{
 		.name = "Bxt HDMI Port2",
 		.stream_name = "Hdmi2",
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.init = NULL,
 		.nonatomic = 1,
 		.dynamic = 1,
@@ -454,7 +454,7 @@ static struct snd_soc_dai_link broxton_rt298_dais[] = {
 	{
 		.name = "Bxt HDMI Port3",
 		.stream_name = "Hdmi3",
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.init = NULL,
 		.nonatomic = 1,
 		.dynamic = 1,
@@ -472,8 +472,6 @@ static struct snd_soc_dai_link broxton_rt298_dais[] = {
 		.ignore_pmdown_time = 1,
 		.be_hw_params_fixup = broxton_ssp5_fixup,
 		.ops = &broxton_rt298_ops,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
 		SND_SOC_DAILINK_REG(ssp5_pin, ssp5_codec, platform),
 	},
 	{
@@ -481,7 +479,7 @@ static struct snd_soc_dai_link broxton_rt298_dais[] = {
 		.id = 1,
 		.be_hw_params_fixup = broxton_dmic_fixup,
 		.ignore_suspend = 1,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		.no_pcm = 1,
 		SND_SOC_DAILINK_REG(dmic_pin, dmic_codec, platform),
 	},
@@ -490,7 +488,7 @@ static struct snd_soc_dai_link broxton_rt298_dais[] = {
 		.id = 2,
 		.be_hw_params_fixup = broxton_dmic_fixup,
 		.ignore_suspend = 1,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		.no_pcm = 1,
 		SND_SOC_DAILINK_REG(dmic16k, dmic_codec, platform),
 	},
@@ -498,7 +496,7 @@ static struct snd_soc_dai_link broxton_rt298_dais[] = {
 		.name = "iDisp1",
 		.id = 3,
 		.init = broxton_hdmi_init,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.no_pcm = 1,
 		SND_SOC_DAILINK_REG(idisp1_pin, idisp1_codec, platform),
 	},
@@ -506,7 +504,7 @@ static struct snd_soc_dai_link broxton_rt298_dais[] = {
 		.name = "iDisp2",
 		.id = 4,
 		.init = broxton_hdmi_init,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.no_pcm = 1,
 		SND_SOC_DAILINK_REG(idisp2_pin, idisp2_codec, platform),
 	},
@@ -514,7 +512,7 @@ static struct snd_soc_dai_link broxton_rt298_dais[] = {
 		.name = "iDisp3",
 		.id = 5,
 		.init = broxton_hdmi_init,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.no_pcm = 1,
 		SND_SOC_DAILINK_REG(idisp3_pin, idisp3_codec, platform),
 	},
diff --git a/sound/soc/intel/boards/bytcht_cx2072x.c b/sound/soc/intel/boards/bytcht_cx2072x.c
index c014d85a08b2..d64e665c731f 100644
--- a/sound/soc/intel/boards/bytcht_cx2072x.c
+++ b/sound/soc/intel/boards/bytcht_cx2072x.c
@@ -175,8 +175,6 @@ static struct snd_soc_dai_link byt_cht_cx2072x_dais[] = {
 		.stream_name = "Audio",
 		.nonatomic = true,
 		.dynamic = 1,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
 		.ops = &byt_cht_cx2072x_aif1_ops,
 		SND_SOC_DAILINK_REG(media, dummy, platform),
 	},
@@ -185,7 +183,7 @@ static struct snd_soc_dai_link byt_cht_cx2072x_dais[] = {
 		.stream_name = "Deep-Buffer Audio",
 		.nonatomic = true,
 		.dynamic = 1,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.ops = &byt_cht_cx2072x_aif1_ops,
 		SND_SOC_DAILINK_REG(deepbuffer, dummy, platform),
 	},
@@ -198,8 +196,6 @@ static struct snd_soc_dai_link byt_cht_cx2072x_dais[] = {
 					      | SND_SOC_DAIFMT_CBC_CFC,
 		.init = byt_cht_cx2072x_init,
 		.be_hw_params_fixup = byt_cht_cx2072x_fixup,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
 		SND_SOC_DAILINK_REG(ssp2, cx2072x, platform),
 	},
 };
diff --git a/sound/soc/intel/boards/bytcht_da7213.c b/sound/soc/intel/boards/bytcht_da7213.c
index f4ac3ddd148b..f209e5ec8731 100644
--- a/sound/soc/intel/boards/bytcht_da7213.c
+++ b/sound/soc/intel/boards/bytcht_da7213.c
@@ -174,8 +174,6 @@ static struct snd_soc_dai_link dailink[] = {
 		.stream_name = "Audio",
 		.nonatomic = true,
 		.dynamic = 1,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
 		.ops = &aif1_ops,
 		SND_SOC_DAILINK_REG(media, dummy, platform),
 	},
@@ -184,7 +182,7 @@ static struct snd_soc_dai_link dailink[] = {
 		.stream_name = "Deep-Buffer Audio",
 		.nonatomic = true,
 		.dynamic = 1,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.ops = &aif1_ops,
 		SND_SOC_DAILINK_REG(deepbuffer, dummy, platform),
 	},
@@ -197,8 +195,6 @@ static struct snd_soc_dai_link dailink[] = {
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
 						| SND_SOC_DAIFMT_CBC_CFC,
 		.be_hw_params_fixup = codec_fixup,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
 		.ops = &ssp2_ops,
 		SND_SOC_DAILINK_REG(ssp2_port, ssp2_codec, platform),
 	},
diff --git a/sound/soc/intel/boards/bytcht_es8316.c b/sound/soc/intel/boards/bytcht_es8316.c
index 2fcec2e02bb5..736b3475bc56 100644
--- a/sound/soc/intel/boards/bytcht_es8316.c
+++ b/sound/soc/intel/boards/bytcht_es8316.c
@@ -315,8 +315,6 @@ static struct snd_soc_dai_link byt_cht_es8316_dais[] = {
 		.stream_name = "Audio",
 		.nonatomic = true,
 		.dynamic = 1,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
 		.ops = &byt_cht_es8316_aif1_ops,
 		SND_SOC_DAILINK_REG(media, dummy, platform),
 	},
@@ -326,7 +324,7 @@ static struct snd_soc_dai_link byt_cht_es8316_dais[] = {
 		.stream_name = "Deep-Buffer Audio",
 		.nonatomic = true,
 		.dynamic = 1,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.ops = &byt_cht_es8316_aif1_ops,
 		SND_SOC_DAILINK_REG(deepbuffer, dummy, platform),
 	},
@@ -339,8 +337,6 @@ static struct snd_soc_dai_link byt_cht_es8316_dais[] = {
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
 						| SND_SOC_DAIFMT_CBC_CFC,
 		.be_hw_params_fixup = byt_cht_es8316_codec_fixup,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
 		.init = byt_cht_es8316_init,
 		SND_SOC_DAILINK_REG(ssp2_port, ssp2_codec, platform),
 	},
diff --git a/sound/soc/intel/boards/bytcht_nocodec.c b/sound/soc/intel/boards/bytcht_nocodec.c
index 4a957d1cece3..fec23bda9e64 100644
--- a/sound/soc/intel/boards/bytcht_nocodec.c
+++ b/sound/soc/intel/boards/bytcht_nocodec.c
@@ -119,8 +119,6 @@ static struct snd_soc_dai_link dais[] = {
 		.ignore_suspend = 1,
 		.nonatomic = true,
 		.dynamic = 1,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
 		.ops = &aif1_ops,
 		SND_SOC_DAILINK_REG(media, dummy, platform),
 	},
@@ -130,7 +128,7 @@ static struct snd_soc_dai_link dais[] = {
 		.ignore_suspend = 1,
 		.nonatomic = true,
 		.dynamic = 1,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.ops = &aif1_ops,
 		SND_SOC_DAILINK_REG(deepbuffer, dummy, platform),
 	},
@@ -144,8 +142,6 @@ static struct snd_soc_dai_link dais[] = {
 						| SND_SOC_DAIFMT_CBC_CFC,
 		.be_hw_params_fixup = codec_fixup,
 		.ignore_suspend = 1,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
 		SND_SOC_DAILINK_REG(ssp2_port, dummy, platform),
 	},
 };
diff --git a/sound/soc/intel/boards/bytcr_rt5640.c b/sound/soc/intel/boards/bytcr_rt5640.c
index 05f38d1f7d82..d68232cbc3a3 100644
--- a/sound/soc/intel/boards/bytcr_rt5640.c
+++ b/sound/soc/intel/boards/bytcr_rt5640.c
@@ -1533,8 +1533,6 @@ static struct snd_soc_dai_link byt_rt5640_dais[] = {
 		.stream_name = "Baytrail Audio",
 		.nonatomic = true,
 		.dynamic = 1,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
 		.ops = &byt_rt5640_aif1_ops,
 		SND_SOC_DAILINK_REG(media, dummy, platform),
 	},
@@ -1543,7 +1541,7 @@ static struct snd_soc_dai_link byt_rt5640_dais[] = {
 		.stream_name = "Deep-Buffer Audio",
 		.nonatomic = true,
 		.dynamic = 1,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.ops = &byt_rt5640_aif1_ops,
 		SND_SOC_DAILINK_REG(deepbuffer, dummy, platform),
 	},
@@ -1555,8 +1553,6 @@ static struct snd_soc_dai_link byt_rt5640_dais[] = {
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
 						| SND_SOC_DAIFMT_CBC_CFC,
 		.be_hw_params_fixup = byt_rt5640_codec_fixup,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
 		.init = byt_rt5640_init,
 		.exit = byt_rt5640_exit,
 		.ops = &byt_rt5640_be_ssp2_ops,
diff --git a/sound/soc/intel/boards/bytcr_rt5651.c b/sound/soc/intel/boards/bytcr_rt5651.c
index 80c841b000a3..8a4d73f3254d 100644
--- a/sound/soc/intel/boards/bytcr_rt5651.c
+++ b/sound/soc/intel/boards/bytcr_rt5651.c
@@ -770,8 +770,6 @@ static struct snd_soc_dai_link byt_rt5651_dais[] = {
 		.stream_name = "Audio",
 		.nonatomic = true,
 		.dynamic = 1,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
 		.ops = &byt_rt5651_aif1_ops,
 		SND_SOC_DAILINK_REG(media, dummy, platform),
 	},
@@ -780,7 +778,7 @@ static struct snd_soc_dai_link byt_rt5651_dais[] = {
 		.stream_name = "Deep-Buffer Audio",
 		.nonatomic = true,
 		.dynamic = 1,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.ops = &byt_rt5651_aif1_ops,
 		SND_SOC_DAILINK_REG(deepbuffer, dummy, platform),
 	},
@@ -793,8 +791,6 @@ static struct snd_soc_dai_link byt_rt5651_dais[] = {
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
 						| SND_SOC_DAIFMT_CBC_CFC,
 		.be_hw_params_fixup = byt_rt5651_codec_fixup,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
 		.init = byt_rt5651_init,
 		.ops = &byt_rt5651_be_ssp2_ops,
 		SND_SOC_DAILINK_REG(ssp2_port, ssp2_codec, platform),
diff --git a/sound/soc/intel/boards/bytcr_wm5102.c b/sound/soc/intel/boards/bytcr_wm5102.c
index cccb5e90c0fe..d3826892b29c 100644
--- a/sound/soc/intel/boards/bytcr_wm5102.c
+++ b/sound/soc/intel/boards/bytcr_wm5102.c
@@ -462,8 +462,6 @@ static struct snd_soc_dai_link byt_wm5102_dais[] = {
 		.stream_name = "Baytrail Audio",
 		.nonatomic = true,
 		.dynamic = 1,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
 		.ops = &byt_wm5102_aif1_ops,
 		SND_SOC_DAILINK_REG(media, dummy, platform),
 
@@ -473,7 +471,7 @@ static struct snd_soc_dai_link byt_wm5102_dais[] = {
 		.stream_name = "Deep-Buffer Audio",
 		.nonatomic = true,
 		.dynamic = 1,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.ops = &byt_wm5102_aif1_ops,
 		SND_SOC_DAILINK_REG(deepbuffer, dummy, platform),
 	},
@@ -490,8 +488,6 @@ static struct snd_soc_dai_link byt_wm5102_dais[] = {
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
 						| SND_SOC_DAIFMT_CBC_CFC,
 		.be_hw_params_fixup = byt_wm5102_codec_fixup,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
 		.init = byt_wm5102_init,
 		SND_SOC_DAILINK_REG(ssp0_port, ssp0_codec, platform),
 	},
diff --git a/sound/soc/intel/boards/cht_bsw_max98090_ti.c b/sound/soc/intel/boards/cht_bsw_max98090_ti.c
index f43bc20d6aae..44e07b5c3e36 100644
--- a/sound/soc/intel/boards/cht_bsw_max98090_ti.c
+++ b/sound/soc/intel/boards/cht_bsw_max98090_ti.c
@@ -351,8 +351,6 @@ static struct snd_soc_dai_link cht_dailink[] = {
 		.stream_name = "Audio",
 		.nonatomic = true,
 		.dynamic = 1,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
 		.ops = &cht_aif1_ops,
 		SND_SOC_DAILINK_REG(media, dummy, platform),
 	},
@@ -361,7 +359,7 @@ static struct snd_soc_dai_link cht_dailink[] = {
 		.stream_name = "Deep-Buffer Audio",
 		.nonatomic = true,
 		.dynamic = 1,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.ops = &cht_aif1_ops,
 		SND_SOC_DAILINK_REG(deepbuffer, dummy, platform),
 	},
@@ -374,8 +372,6 @@ static struct snd_soc_dai_link cht_dailink[] = {
 					| SND_SOC_DAIFMT_CBC_CFC,
 		.init = cht_codec_init,
 		.be_hw_params_fixup = cht_codec_fixup,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
 		.ops = &cht_be_ssp2_ops,
 		SND_SOC_DAILINK_REG(ssp2_port, ssp2_codec, platform),
 	},
diff --git a/sound/soc/intel/boards/cht_bsw_nau8824.c b/sound/soc/intel/boards/cht_bsw_nau8824.c
index 7651b83632fa..4afb292d4f13 100644
--- a/sound/soc/intel/boards/cht_bsw_nau8824.c
+++ b/sound/soc/intel/boards/cht_bsw_nau8824.c
@@ -193,8 +193,6 @@ static struct snd_soc_dai_link cht_dailink[] = {
 		.stream_name = "Audio",
 		.nonatomic = true,
 		.dynamic = 1,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
 		.ops = &cht_aif1_ops,
 		SND_SOC_DAILINK_REG(media, dummy, platform),
 	},
@@ -203,7 +201,7 @@ static struct snd_soc_dai_link cht_dailink[] = {
 		.stream_name = "Deep-Buffer Audio",
 		.nonatomic = true,
 		.dynamic = 1,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.ops = &cht_aif1_ops,
 		SND_SOC_DAILINK_REG(deepbuffer, dummy, platform),
 	},
@@ -217,8 +215,6 @@ static struct snd_soc_dai_link cht_dailink[] = {
 			| SND_SOC_DAIFMT_CBC_CFC,
 		.init = cht_codec_init,
 		.be_hw_params_fixup = cht_codec_fixup,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
 		.ops = &cht_be_ssp2_ops,
 		SND_SOC_DAILINK_REG(ssp2_port, ssp2_codec, platform),
 	},
diff --git a/sound/soc/intel/boards/cht_bsw_rt5645.c b/sound/soc/intel/boards/cht_bsw_rt5645.c
index eb41b7115d01..bc0d06579814 100644
--- a/sound/soc/intel/boards/cht_bsw_rt5645.c
+++ b/sound/soc/intel/boards/cht_bsw_rt5645.c
@@ -448,8 +448,6 @@ static struct snd_soc_dai_link cht_dailink[] = {
 		.stream_name = "Audio",
 		.nonatomic = true,
 		.dynamic = 1,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
 		.ops = &cht_aif1_ops,
 		SND_SOC_DAILINK_REG(media, dummy, platform),
 	},
@@ -458,7 +456,7 @@ static struct snd_soc_dai_link cht_dailink[] = {
 		.stream_name = "Deep-Buffer Audio",
 		.nonatomic = true,
 		.dynamic = 1,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.ops = &cht_aif1_ops,
 		SND_SOC_DAILINK_REG(deepbuffer, dummy, platform),
 	},
@@ -470,8 +468,6 @@ static struct snd_soc_dai_link cht_dailink[] = {
 		.no_pcm = 1,
 		.init = cht_codec_init,
 		.be_hw_params_fixup = cht_codec_fixup,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
 		.ops = &cht_be_ssp2_ops,
 		SND_SOC_DAILINK_REG(ssp2_port, ssp2_codec, platform),
 	},
diff --git a/sound/soc/intel/boards/cht_bsw_rt5672.c b/sound/soc/intel/boards/cht_bsw_rt5672.c
index be2d1a8dbca8..aa96b54d0bc1 100644
--- a/sound/soc/intel/boards/cht_bsw_rt5672.c
+++ b/sound/soc/intel/boards/cht_bsw_rt5672.c
@@ -358,8 +358,6 @@ static struct snd_soc_dai_link cht_dailink[] = {
 		.stream_name = "Audio",
 		.nonatomic = true,
 		.dynamic = 1,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
 		.ops = &cht_aif1_ops,
 		SND_SOC_DAILINK_REG(media, dummy, platform),
 	},
@@ -368,7 +366,7 @@ static struct snd_soc_dai_link cht_dailink[] = {
 		.stream_name = "Deep-Buffer Audio",
 		.nonatomic = true,
 		.dynamic = 1,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.ops = &cht_aif1_ops,
 		SND_SOC_DAILINK_REG(deepbuffer, dummy, platform),
 	},
@@ -381,8 +379,6 @@ static struct snd_soc_dai_link cht_dailink[] = {
 		.no_pcm = 1,
 		.init = cht_codec_init,
 		.be_hw_params_fixup = cht_codec_fixup,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
 		.ops = &cht_be_ssp2_ops,
 		SND_SOC_DAILINK_REG(ssp2_port, ssp2_codec, platform),
 	},
diff --git a/sound/soc/intel/boards/cml_rt1011_rt5682.c b/sound/soc/intel/boards/cml_rt1011_rt5682.c
index 679a09b63ea5..5601656d9b4c 100644
--- a/sound/soc/intel/boards/cml_rt1011_rt5682.c
+++ b/sound/soc/intel/boards/cml_rt1011_rt5682.c
@@ -443,8 +443,6 @@ static struct snd_soc_dai_link cml_rt1011_rt5682_dailink[] = {
 		.exit = cml_rt5682_codec_exit,
 		.ignore_pmdown_time = 1,
 		.ops = &cml_rt5682_ops,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
 		.no_pcm = 1,
 		SND_SOC_DAILINK_REG(ssp0_pin, ssp0_codec, platform),
 	},
@@ -452,7 +450,7 @@ static struct snd_soc_dai_link cml_rt1011_rt5682_dailink[] = {
 		.name = "dmic01",
 		.id = 1,
 		.ignore_suspend = 1,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		.no_pcm = 1,
 		SND_SOC_DAILINK_REG(dmic_pin, dmic_codec, platform),
 	},
@@ -460,7 +458,7 @@ static struct snd_soc_dai_link cml_rt1011_rt5682_dailink[] = {
 		.name = "dmic16k",
 		.id = 2,
 		.ignore_suspend = 1,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		.no_pcm = 1,
 		SND_SOC_DAILINK_REG(dmic16k_pin, dmic_codec, platform),
 	},
@@ -468,7 +466,7 @@ static struct snd_soc_dai_link cml_rt1011_rt5682_dailink[] = {
 		.name = "iDisp1",
 		.id = 3,
 		.init = hdmi_init,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.no_pcm = 1,
 		SND_SOC_DAILINK_REG(idisp1_pin, idisp1_codec, platform),
 	},
@@ -476,7 +474,7 @@ static struct snd_soc_dai_link cml_rt1011_rt5682_dailink[] = {
 		.name = "iDisp2",
 		.id = 4,
 		.init = hdmi_init,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.no_pcm = 1,
 		SND_SOC_DAILINK_REG(idisp2_pin, idisp2_codec, platform),
 	},
@@ -484,7 +482,7 @@ static struct snd_soc_dai_link cml_rt1011_rt5682_dailink[] = {
 		.name = "iDisp3",
 		.id = 5,
 		.init = hdmi_init,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.no_pcm = 1,
 		SND_SOC_DAILINK_REG(idisp3_pin, idisp3_codec, platform),
 	},
@@ -494,10 +492,9 @@ static struct snd_soc_dai_link cml_rt1011_rt5682_dailink[] = {
 		 * reuse of common topologies for other end points
 		 * and changing only SSP1's codec
 		 */
+		/* Capture stream provides Feedback */
 		.name = "SSP1-Codec",
 		.id = 6,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1, /* Capture stream provides Feedback */
 		.no_pcm = 1,
 		.init = cml_rt1011_spk_init,
 		.ops = &cml_rt1011_ops,
diff --git a/sound/soc/intel/boards/ehl_rt5660.c b/sound/soc/intel/boards/ehl_rt5660.c
index 686e60321224..6f700249f825 100644
--- a/sound/soc/intel/boards/ehl_rt5660.c
+++ b/sound/soc/intel/boards/ehl_rt5660.c
@@ -178,8 +178,6 @@ static struct snd_soc_dai_link ehl_rt5660_dailink[] = {
 		.name = "SSP0-Codec",
 		.id = 0,
 		.no_pcm = 1,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
 		.ops = &rt5660_ops,
 		SND_SOC_DAILINK_REG(ssp0_pin, rt5660_codec, platform),
 	},
@@ -187,7 +185,7 @@ static struct snd_soc_dai_link ehl_rt5660_dailink[] = {
 		.name = "dmic48k",
 		.id = 1,
 		.ignore_suspend = 1,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		.no_pcm = 1,
 		SND_SOC_DAILINK_REG(dmic_pin, dmic_codec, platform),
 	},
@@ -195,7 +193,7 @@ static struct snd_soc_dai_link ehl_rt5660_dailink[] = {
 		.name = "dmic16k",
 		.id = 2,
 		.ignore_suspend = 1,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		.no_pcm = 1,
 		SND_SOC_DAILINK_REG(dmic16k, dmic_codec, platform),
 	},
@@ -203,7 +201,7 @@ static struct snd_soc_dai_link ehl_rt5660_dailink[] = {
 		.name = "iDisp1",
 		.id = 5,
 		.init = hdmi_init,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.no_pcm = 1,
 		SND_SOC_DAILINK_REG(idisp1_pin, idisp1_codec, platform),
 	},
@@ -211,7 +209,7 @@ static struct snd_soc_dai_link ehl_rt5660_dailink[] = {
 		.name = "iDisp2",
 		.id = 6,
 		.init = hdmi_init,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.no_pcm = 1,
 		SND_SOC_DAILINK_REG(idisp2_pin, idisp2_codec, platform),
 	},
@@ -219,7 +217,7 @@ static struct snd_soc_dai_link ehl_rt5660_dailink[] = {
 		.name = "iDisp3",
 		.id = 7,
 		.init = hdmi_init,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.no_pcm = 1,
 		SND_SOC_DAILINK_REG(idisp3_pin, idisp3_codec, platform),
 	},
@@ -227,7 +225,7 @@ static struct snd_soc_dai_link ehl_rt5660_dailink[] = {
 		.name = "iDisp4",
 		.id = 8,
 		.init = hdmi_init,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.no_pcm = 1,
 		SND_SOC_DAILINK_REG(idisp4_pin, idisp4_codec, platform),
 	},
diff --git a/sound/soc/intel/boards/glk_rt5682_max98357a.c b/sound/soc/intel/boards/glk_rt5682_max98357a.c
index 4098b2d32f9b..35d59400bb1c 100644
--- a/sound/soc/intel/boards/glk_rt5682_max98357a.c
+++ b/sound/soc/intel/boards/glk_rt5682_max98357a.c
@@ -413,7 +413,7 @@ static struct snd_soc_dai_link geminilake_dais[] = {
 		.init = geminilake_rt5682_fe_init,
 		.trigger = {
 			SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST},
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		SND_SOC_DAILINK_REG(system, dummy, platform),
 	},
 	[GLK_DPCM_AUDIO_CP] = {
@@ -423,13 +423,13 @@ static struct snd_soc_dai_link geminilake_dais[] = {
 		.nonatomic = 1,
 		.trigger = {
 			SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST},
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		SND_SOC_DAILINK_REG(system, dummy, platform),
 	},
 	[GLK_DPCM_AUDIO_HS_PB] = {
 		.name = "Glk Audio Headset Playback",
 		.stream_name = "Headset Audio",
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.nonatomic = 1,
 		.dynamic = 1,
 		SND_SOC_DAILINK_REG(system2, dummy, platform),
@@ -438,7 +438,7 @@ static struct snd_soc_dai_link geminilake_dais[] = {
 		.name = "Glk Audio Echo Reference cap",
 		.stream_name = "Echoreference Capture",
 		.init = NULL,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		.nonatomic = 1,
 		.dynamic = 1,
 		SND_SOC_DAILINK_REG(echoref, dummy, platform),
@@ -447,7 +447,7 @@ static struct snd_soc_dai_link geminilake_dais[] = {
 		.name = "Glk Audio Reference cap",
 		.stream_name = "Refcap",
 		.init = NULL,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		.nonatomic = 1,
 		.dynamic = 1,
 		.ops = &geminilake_refcap_ops,
@@ -457,7 +457,7 @@ static struct snd_soc_dai_link geminilake_dais[] = {
 		.name = "Glk Audio DMIC cap",
 		.stream_name = "dmiccap",
 		.init = NULL,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		.nonatomic = 1,
 		.dynamic = 1,
 		.ops = &geminilake_dmic_ops,
@@ -466,7 +466,7 @@ static struct snd_soc_dai_link geminilake_dais[] = {
 	[GLK_DPCM_AUDIO_HDMI1_PB] = {
 		.name = "Glk HDMI Port1",
 		.stream_name = "Hdmi1",
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.init = NULL,
 		.trigger = {
 			SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST},
@@ -477,7 +477,7 @@ static struct snd_soc_dai_link geminilake_dais[] = {
 	[GLK_DPCM_AUDIO_HDMI2_PB] =	{
 		.name = "Glk HDMI Port2",
 		.stream_name = "Hdmi2",
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.init = NULL,
 		.trigger = {
 			SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST},
@@ -490,7 +490,7 @@ static struct snd_soc_dai_link geminilake_dais[] = {
 		.stream_name = "Hdmi3",
 		.trigger = {
 			SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST},
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.init = NULL,
 		.nonatomic = 1,
 		.dynamic = 1,
@@ -507,7 +507,7 @@ static struct snd_soc_dai_link geminilake_dais[] = {
 			SND_SOC_DAIFMT_CBC_CFC,
 		.ignore_pmdown_time = 1,
 		.be_hw_params_fixup = geminilake_ssp_fixup,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		SND_SOC_DAILINK_REG(ssp1_pin, ssp1_codec, platform),
 	},
 	{
@@ -521,8 +521,6 @@ static struct snd_soc_dai_link geminilake_dais[] = {
 		.ignore_pmdown_time = 1,
 		.be_hw_params_fixup = geminilake_ssp_fixup,
 		.ops = &geminilake_rt5682_ops,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
 		SND_SOC_DAILINK_REG(ssp2_pin, ssp2_codec_5682, platform),
 	},
 	{
@@ -530,7 +528,7 @@ static struct snd_soc_dai_link geminilake_dais[] = {
 		.id = 2,
 		.ignore_suspend = 1,
 		.be_hw_params_fixup = geminilake_dmic_fixup,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		.no_pcm = 1,
 		SND_SOC_DAILINK_REG(dmic_pin, dmic_codec, platform),
 	},
@@ -538,7 +536,7 @@ static struct snd_soc_dai_link geminilake_dais[] = {
 		.name = "iDisp1",
 		.id = 3,
 		.init = geminilake_hdmi_init,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.no_pcm = 1,
 		SND_SOC_DAILINK_REG(idisp1_pin, idisp1_codec, platform),
 	},
@@ -546,7 +544,7 @@ static struct snd_soc_dai_link geminilake_dais[] = {
 		.name = "iDisp2",
 		.id = 4,
 		.init = geminilake_hdmi_init,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.no_pcm = 1,
 		SND_SOC_DAILINK_REG(idisp2_pin, idisp2_codec, platform),
 	},
@@ -554,7 +552,7 @@ static struct snd_soc_dai_link geminilake_dais[] = {
 		.name = "iDisp3",
 		.id = 5,
 		.init = geminilake_hdmi_init,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.no_pcm = 1,
 		SND_SOC_DAILINK_REG(idisp3_pin, idisp3_codec, platform),
 	},
diff --git a/sound/soc/intel/boards/hsw_rt5640.c b/sound/soc/intel/boards/hsw_rt5640.c
index 2a2fe27dff0e..a1260b87f4f9 100644
--- a/sound/soc/intel/boards/hsw_rt5640.c
+++ b/sound/soc/intel/boards/hsw_rt5640.c
@@ -85,8 +85,6 @@ static struct snd_soc_dai_link card_dai_links[] = {
 		.nonatomic = 1,
 		.dynamic = 1,
 		.trigger = {SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST},
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
 		SND_SOC_DAILINK_REG(system, dummy, platform),
 	},
 	{
@@ -95,7 +93,7 @@ static struct snd_soc_dai_link card_dai_links[] = {
 		.nonatomic = 1,
 		.dynamic = 1,
 		.trigger = {SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST},
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		SND_SOC_DAILINK_REG(offload0, dummy, platform),
 	},
 	{
@@ -104,7 +102,7 @@ static struct snd_soc_dai_link card_dai_links[] = {
 		.nonatomic = 1,
 		.dynamic = 1,
 		.trigger = {SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST},
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		SND_SOC_DAILINK_REG(offload1, dummy, platform),
 	},
 	{
@@ -113,7 +111,7 @@ static struct snd_soc_dai_link card_dai_links[] = {
 		.nonatomic = 1,
 		.dynamic = 1,
 		.trigger = {SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST},
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		SND_SOC_DAILINK_REG(loopback, dummy, platform),
 	},
 	/* Back End DAI links */
@@ -127,8 +125,6 @@ static struct snd_soc_dai_link card_dai_links[] = {
 		.ignore_pmdown_time = 1,
 		.be_hw_params_fixup = codec_link_hw_params_fixup,
 		.ops = &codec_link_ops,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
 		SND_SOC_DAILINK_REG(ssp0_port, codec, platform),
 	},
 };
diff --git a/sound/soc/intel/boards/kbl_da7219_max98357a.c b/sound/soc/intel/boards/kbl_da7219_max98357a.c
index 9dbc15f9d1c9..528b0562dd79 100644
--- a/sound/soc/intel/boards/kbl_da7219_max98357a.c
+++ b/sound/soc/intel/boards/kbl_da7219_max98357a.c
@@ -460,7 +460,7 @@ static struct snd_soc_dai_link kabylake_dais[] = {
 		.init = kabylake_da7219_fe_init,
 		.trigger = {
 			SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST},
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.ops = &kabylake_da7219_fe_ops,
 		SND_SOC_DAILINK_REG(system, dummy, platform),
 	},
@@ -471,7 +471,7 @@ static struct snd_soc_dai_link kabylake_dais[] = {
 		.nonatomic = 1,
 		.trigger = {
 			SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST},
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		.ops = &kabylake_da7219_fe_ops,
 		SND_SOC_DAILINK_REG(system, dummy, platform),
 	},
@@ -479,7 +479,7 @@ static struct snd_soc_dai_link kabylake_dais[] = {
 		.name = "Kbl Audio Reference cap",
 		.stream_name = "Wake on Voice",
 		.init = NULL,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		.nonatomic = 1,
 		.dynamic = 1,
 		.ops = &skylake_refcap_ops,
@@ -489,7 +489,7 @@ static struct snd_soc_dai_link kabylake_dais[] = {
 		.name = "Kbl Audio DMIC cap",
 		.stream_name = "dmiccap",
 		.init = NULL,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		.nonatomic = 1,
 		.dynamic = 1,
 		.ops = &kabylake_dmic_ops,
@@ -498,7 +498,7 @@ static struct snd_soc_dai_link kabylake_dais[] = {
 	[KBL_DPCM_AUDIO_HDMI1_PB] = {
 		.name = "Kbl HDMI Port1",
 		.stream_name = "Hdmi1",
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.init = NULL,
 		.trigger = {
 			SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST},
@@ -509,7 +509,7 @@ static struct snd_soc_dai_link kabylake_dais[] = {
 	[KBL_DPCM_AUDIO_HDMI2_PB] = {
 		.name = "Kbl HDMI Port2",
 		.stream_name = "Hdmi2",
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.init = NULL,
 		.trigger = {
 			SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST},
@@ -522,7 +522,7 @@ static struct snd_soc_dai_link kabylake_dais[] = {
 		.stream_name = "Hdmi3",
 		.trigger = {
 			SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST},
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.init = NULL,
 		.nonatomic = 1,
 		.dynamic = 1,
@@ -540,7 +540,7 @@ static struct snd_soc_dai_link kabylake_dais[] = {
 			SND_SOC_DAIFMT_CBC_CFC,
 		.ignore_pmdown_time = 1,
 		.be_hw_params_fixup = kabylake_ssp_fixup,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		SND_SOC_DAILINK_REG(ssp0_pin, ssp0_codec, platform),
 	},
 	{
@@ -553,8 +553,6 @@ static struct snd_soc_dai_link kabylake_dais[] = {
 			SND_SOC_DAIFMT_CBC_CFC,
 		.ignore_pmdown_time = 1,
 		.be_hw_params_fixup = kabylake_ssp_fixup,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
 		SND_SOC_DAILINK_REG(ssp1_pin, ssp1_codec, platform),
 	},
 	{
@@ -562,14 +560,14 @@ static struct snd_soc_dai_link kabylake_dais[] = {
 		.id = 2,
 		.be_hw_params_fixup = kabylake_dmic_fixup,
 		.ignore_suspend = 1,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		.no_pcm = 1,
 		SND_SOC_DAILINK_REG(dmic_pin, dmic_codec, platform),
 	},
 	{
 		.name = "iDisp1",
 		.id = 3,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.init = kabylake_hdmi1_init,
 		.no_pcm = 1,
 		SND_SOC_DAILINK_REG(idisp1_pin, idisp1_codec, platform),
@@ -578,7 +576,7 @@ static struct snd_soc_dai_link kabylake_dais[] = {
 		.name = "iDisp2",
 		.id = 4,
 		.init = kabylake_hdmi2_init,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.no_pcm = 1,
 		SND_SOC_DAILINK_REG(idisp2_pin, idisp2_codec, platform),
 	},
@@ -586,7 +584,7 @@ static struct snd_soc_dai_link kabylake_dais[] = {
 		.name = "iDisp3",
 		.id = 5,
 		.init = kabylake_hdmi3_init,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.no_pcm = 1,
 		SND_SOC_DAILINK_REG(idisp3_pin, idisp3_codec, platform),
 	},
diff --git a/sound/soc/intel/boards/kbl_da7219_max98927.c b/sound/soc/intel/boards/kbl_da7219_max98927.c
index e662da5af83b..7507cf212ee1 100644
--- a/sound/soc/intel/boards/kbl_da7219_max98927.c
+++ b/sound/soc/intel/boards/kbl_da7219_max98927.c
@@ -686,7 +686,7 @@ static struct snd_soc_dai_link kabylake_dais[] = {
 		.init = kabylake_da7219_fe_init,
 		.trigger = {
 			SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST},
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.ops = &kabylake_da7219_fe_ops,
 		SND_SOC_DAILINK_REG(system, dummy, platform),
 	},
@@ -694,7 +694,7 @@ static struct snd_soc_dai_link kabylake_dais[] = {
 		.name = "Kbl Audio Echo Reference cap",
 		.stream_name = "Echoreference Capture",
 		.init = NULL,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		.nonatomic = 1,
 		SND_SOC_DAILINK_REG(echoref, dummy, platform),
 	},
@@ -702,7 +702,7 @@ static struct snd_soc_dai_link kabylake_dais[] = {
 		.name = "Kbl Audio Reference cap",
 		.stream_name = "Wake on Voice",
 		.init = NULL,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		.nonatomic = 1,
 		.dynamic = 1,
 		.ops = &skylake_refcap_ops,
@@ -712,7 +712,7 @@ static struct snd_soc_dai_link kabylake_dais[] = {
 		.name = "Kbl Audio DMIC cap",
 		.stream_name = "dmiccap",
 		.init = NULL,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		.nonatomic = 1,
 		.dynamic = 1,
 		.ops = &kabylake_dmic_ops,
@@ -721,7 +721,7 @@ static struct snd_soc_dai_link kabylake_dais[] = {
 	[KBL_DPCM_AUDIO_HDMI1_PB] = {
 		.name = "Kbl HDMI Port1",
 		.stream_name = "Hdmi1",
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.init = NULL,
 		.trigger = {
 			SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST},
@@ -732,7 +732,7 @@ static struct snd_soc_dai_link kabylake_dais[] = {
 	[KBL_DPCM_AUDIO_HDMI2_PB] = {
 		.name = "Kbl HDMI Port2",
 		.stream_name = "Hdmi2",
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.init = NULL,
 		.trigger = {
 			SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST},
@@ -745,7 +745,7 @@ static struct snd_soc_dai_link kabylake_dais[] = {
 		.stream_name = "Hdmi3",
 		.trigger = {
 			SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST},
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.init = NULL,
 		.nonatomic = 1,
 		.dynamic = 1,
@@ -754,7 +754,7 @@ static struct snd_soc_dai_link kabylake_dais[] = {
 	[KBL_DPCM_AUDIO_HS_PB] = {
 		.name = "Kbl Audio Headset Playback",
 		.stream_name = "Headset Audio",
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.nonatomic = 1,
 		.dynamic = 1,
 		.init = kabylake_da7219_fe_init,
@@ -770,7 +770,7 @@ static struct snd_soc_dai_link kabylake_dais[] = {
 		.nonatomic = 1,
 		.trigger = {
 			SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST},
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		.ops = &kabylake_da7219_fe_ops,
 		SND_SOC_DAILINK_REG(system, dummy, platform),
 	},
@@ -784,8 +784,6 @@ static struct snd_soc_dai_link kabylake_dais[] = {
 		.dai_fmt = SND_SOC_DAIFMT_DSP_B |
 			SND_SOC_DAIFMT_NB_NF |
 			SND_SOC_DAIFMT_CBC_CFC,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
 		.ignore_pmdown_time = 1,
 		.be_hw_params_fixup = kabylake_ssp_fixup,
 		.ops = &kabylake_ssp0_ops,
@@ -801,8 +799,6 @@ static struct snd_soc_dai_link kabylake_dais[] = {
 			SND_SOC_DAIFMT_CBC_CFC,
 		.ignore_pmdown_time = 1,
 		.be_hw_params_fixup = kabylake_ssp_fixup,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
 		SND_SOC_DAILINK_REG(ssp1_pin, ssp1_codec, platform),
 	},
 	{
@@ -811,14 +807,14 @@ static struct snd_soc_dai_link kabylake_dais[] = {
 		.init = kabylake_dmic_init,
 		.be_hw_params_fixup = kabylake_dmic_fixup,
 		.ignore_suspend = 1,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		.no_pcm = 1,
 		SND_SOC_DAILINK_REG(dmic_pin, dmic_codec, platform),
 	},
 	{
 		.name = "iDisp1",
 		.id = 3,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.init = kabylake_hdmi1_init,
 		.no_pcm = 1,
 		SND_SOC_DAILINK_REG(idisp1_pin, idisp1_codec, platform),
@@ -827,7 +823,7 @@ static struct snd_soc_dai_link kabylake_dais[] = {
 		.name = "iDisp2",
 		.id = 4,
 		.init = kabylake_hdmi2_init,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.no_pcm = 1,
 		SND_SOC_DAILINK_REG(idisp2_pin, idisp2_codec, platform),
 	},
@@ -835,7 +831,7 @@ static struct snd_soc_dai_link kabylake_dais[] = {
 		.name = "iDisp3",
 		.id = 5,
 		.init = kabylake_hdmi3_init,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.no_pcm = 1,
 		SND_SOC_DAILINK_REG(idisp3_pin, idisp3_codec, platform),
 	},
@@ -852,7 +848,7 @@ static struct snd_soc_dai_link kabylake_max98_927_373_dais[] = {
 		.init = kabylake_da7219_fe_init,
 		.trigger = {
 			SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST},
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.ops = &kabylake_da7219_fe_ops,
 		SND_SOC_DAILINK_REG(system, dummy, platform),
 	},
@@ -860,7 +856,7 @@ static struct snd_soc_dai_link kabylake_max98_927_373_dais[] = {
 		.name = "Kbl Audio Echo Reference cap",
 		.stream_name = "Echoreference Capture",
 		.init = NULL,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		.nonatomic = 1,
 		SND_SOC_DAILINK_REG(echoref, dummy, platform),
 	},
@@ -868,7 +864,7 @@ static struct snd_soc_dai_link kabylake_max98_927_373_dais[] = {
 		.name = "Kbl Audio Reference cap",
 		.stream_name = "Wake on Voice",
 		.init = NULL,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		.nonatomic = 1,
 		.dynamic = 1,
 		.ops = &skylake_refcap_ops,
@@ -878,7 +874,7 @@ static struct snd_soc_dai_link kabylake_max98_927_373_dais[] = {
 		.name = "Kbl Audio DMIC cap",
 		.stream_name = "dmiccap",
 		.init = NULL,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		.nonatomic = 1,
 		.dynamic = 1,
 		.ops = &kabylake_dmic_ops,
@@ -887,7 +883,7 @@ static struct snd_soc_dai_link kabylake_max98_927_373_dais[] = {
 	[KBL_DPCM_AUDIO_HDMI1_PB] = {
 		.name = "Kbl HDMI Port1",
 		.stream_name = "Hdmi1",
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.init = NULL,
 		.trigger = {
 			SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST},
@@ -898,7 +894,7 @@ static struct snd_soc_dai_link kabylake_max98_927_373_dais[] = {
 	[KBL_DPCM_AUDIO_HDMI2_PB] = {
 		.name = "Kbl HDMI Port2",
 		.stream_name = "Hdmi2",
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.init = NULL,
 		.trigger = {
 			SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST},
@@ -911,7 +907,7 @@ static struct snd_soc_dai_link kabylake_max98_927_373_dais[] = {
 		.stream_name = "Hdmi3",
 		.trigger = {
 			SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST},
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.init = NULL,
 		.nonatomic = 1,
 		.dynamic = 1,
@@ -927,8 +923,6 @@ static struct snd_soc_dai_link kabylake_max98_927_373_dais[] = {
 		.dai_fmt = SND_SOC_DAIFMT_DSP_B |
 			SND_SOC_DAIFMT_NB_NF |
 			SND_SOC_DAIFMT_CBC_CFC,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
 		.ignore_pmdown_time = 1,
 		.be_hw_params_fixup = kabylake_ssp_fixup,
 		.ops = &kabylake_ssp0_ops,
@@ -940,14 +934,14 @@ static struct snd_soc_dai_link kabylake_max98_927_373_dais[] = {
 		.init = kabylake_dmic_init,
 		.be_hw_params_fixup = kabylake_dmic_fixup,
 		.ignore_suspend = 1,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		.no_pcm = 1,
 		SND_SOC_DAILINK_REG(dmic_pin, dmic_codec, platform),
 	},
 	{
 		.name = "iDisp1",
 		.id = 2,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.init = kabylake_hdmi1_init,
 		.no_pcm = 1,
 		SND_SOC_DAILINK_REG(idisp1_pin, idisp1_codec, platform),
@@ -956,7 +950,7 @@ static struct snd_soc_dai_link kabylake_max98_927_373_dais[] = {
 		.name = "iDisp2",
 		.id = 3,
 		.init = kabylake_hdmi2_init,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.no_pcm = 1,
 		SND_SOC_DAILINK_REG(idisp2_pin, idisp2_codec, platform),
 	},
@@ -964,7 +958,7 @@ static struct snd_soc_dai_link kabylake_max98_927_373_dais[] = {
 		.name = "iDisp3",
 		.id = 4,
 		.init = kabylake_hdmi3_init,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.no_pcm = 1,
 		SND_SOC_DAILINK_REG(idisp3_pin, idisp3_codec, platform),
 	},
diff --git a/sound/soc/intel/boards/kbl_rt5660.c b/sound/soc/intel/boards/kbl_rt5660.c
index 894d127c482a..6f6e7ff6b325 100644
--- a/sound/soc/intel/boards/kbl_rt5660.c
+++ b/sound/soc/intel/boards/kbl_rt5660.c
@@ -377,7 +377,7 @@ static struct snd_soc_dai_link kabylake_rt5660_dais[] = {
 		.nonatomic = 1,
 		.trigger = {
 			SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST},
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.ops = &kabylake_rt5660_fe_ops,
 		SND_SOC_DAILINK_REG(system, dummy, platform),
 	},
@@ -388,14 +388,14 @@ static struct snd_soc_dai_link kabylake_rt5660_dais[] = {
 		.nonatomic = 1,
 		.trigger = {
 			SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST},
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		.ops = &kabylake_rt5660_fe_ops,
 		SND_SOC_DAILINK_REG(system, dummy, platform),
 	},
 	[KBL_DPCM_AUDIO_HDMI1_PB] = {
 		.name = "Kbl HDMI Port1",
 		.stream_name = "Hdmi1",
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.init = NULL,
 		.trigger = {
 			SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST},
@@ -406,7 +406,7 @@ static struct snd_soc_dai_link kabylake_rt5660_dais[] = {
 	[KBL_DPCM_AUDIO_HDMI2_PB] = {
 		.name = "Kbl HDMI Port2",
 		.stream_name = "Hdmi2",
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.init = NULL,
 		.trigger = {
 			SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST},
@@ -419,7 +419,7 @@ static struct snd_soc_dai_link kabylake_rt5660_dais[] = {
 		.stream_name = "Hdmi3",
 		.trigger = {
 			SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST},
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.init = NULL,
 		.nonatomic = 1,
 		.dynamic = 1,
@@ -440,14 +440,12 @@ static struct snd_soc_dai_link kabylake_rt5660_dais[] = {
 		.ignore_pmdown_time = 1,
 		.be_hw_params_fixup = kabylake_ssp0_fixup,
 		.ops = &kabylake_rt5660_ops,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
 		SND_SOC_DAILINK_REG(ssp0_pin, ssp0_codec, platform),
 	},
 	{
 		.name = "iDisp1",
 		.id = 1,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.init = kabylake_hdmi1_init,
 		.no_pcm = 1,
 		SND_SOC_DAILINK_REG(idisp1_pin, idisp1_codec, platform),
@@ -456,7 +454,7 @@ static struct snd_soc_dai_link kabylake_rt5660_dais[] = {
 		.name = "iDisp2",
 		.id = 2,
 		.init = kabylake_hdmi2_init,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.no_pcm = 1,
 		SND_SOC_DAILINK_REG(idisp2_pin, idisp2_codec, platform),
 	},
@@ -464,7 +462,7 @@ static struct snd_soc_dai_link kabylake_rt5660_dais[] = {
 		.name = "iDisp3",
 		.id = 3,
 		.init = kabylake_hdmi3_init,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.no_pcm = 1,
 		SND_SOC_DAILINK_REG(idisp3_pin, idisp3_codec, platform),
 	},
diff --git a/sound/soc/intel/boards/kbl_rt5663_max98927.c b/sound/soc/intel/boards/kbl_rt5663_max98927.c
index 646e8ff8e961..41795bbdb1f1 100644
--- a/sound/soc/intel/boards/kbl_rt5663_max98927.c
+++ b/sound/soc/intel/boards/kbl_rt5663_max98927.c
@@ -687,7 +687,7 @@ static struct snd_soc_dai_link kabylake_dais[] = {
 		.init = kabylake_rt5663_fe_init,
 		.trigger = {
 			SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST},
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.ops = &kabylake_rt5663_fe_ops,
 		SND_SOC_DAILINK_REG(system, dummy, platform),
 	},
@@ -698,14 +698,14 @@ static struct snd_soc_dai_link kabylake_dais[] = {
 		.nonatomic = 1,
 		.trigger = {
 			SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST},
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		.ops = &kabylake_rt5663_fe_ops,
 		SND_SOC_DAILINK_REG(system, dummy, platform),
 	},
 	[KBL_DPCM_AUDIO_HS_PB] = {
 		.name = "Kbl Audio Headset Playback",
 		.stream_name = "Headset Audio",
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.nonatomic = 1,
 		.dynamic = 1,
 		SND_SOC_DAILINK_REG(system2, dummy, platform),
@@ -714,7 +714,7 @@ static struct snd_soc_dai_link kabylake_dais[] = {
 		.name = "Kbl Audio Echo Reference cap",
 		.stream_name = "Echoreference Capture",
 		.init = NULL,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		.nonatomic = 1,
 		SND_SOC_DAILINK_REG(echoref, dummy, platform),
 	},
@@ -722,7 +722,7 @@ static struct snd_soc_dai_link kabylake_dais[] = {
 		.name = "Kbl Audio Reference cap",
 		.stream_name = "Wake on Voice",
 		.init = NULL,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		.nonatomic = 1,
 		.dynamic = 1,
 		.ops = &skylake_refcap_ops,
@@ -732,7 +732,7 @@ static struct snd_soc_dai_link kabylake_dais[] = {
 		.name = "Kbl Audio DMIC cap",
 		.stream_name = "dmiccap",
 		.init = NULL,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		.nonatomic = 1,
 		.dynamic = 1,
 		.ops = &kabylake_dmic_ops,
@@ -741,7 +741,7 @@ static struct snd_soc_dai_link kabylake_dais[] = {
 	[KBL_DPCM_AUDIO_HDMI1_PB] = {
 		.name = "Kbl HDMI Port1",
 		.stream_name = "Hdmi1",
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.init = NULL,
 		.trigger = {
 			SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST},
@@ -752,7 +752,7 @@ static struct snd_soc_dai_link kabylake_dais[] = {
 	[KBL_DPCM_AUDIO_HDMI2_PB] = {
 		.name = "Kbl HDMI Port2",
 		.stream_name = "Hdmi2",
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.init = NULL,
 		.trigger = {
 			SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST},
@@ -765,7 +765,7 @@ static struct snd_soc_dai_link kabylake_dais[] = {
 		.stream_name = "Hdmi3",
 		.trigger = {
 			SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST},
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.init = NULL,
 		.nonatomic = 1,
 		.dynamic = 1,
@@ -783,7 +783,7 @@ static struct snd_soc_dai_link kabylake_dais[] = {
 			SND_SOC_DAIFMT_CBC_CFC,
 		.ignore_pmdown_time = 1,
 		.be_hw_params_fixup = kabylake_ssp_fixup,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.ops = &kabylake_ssp0_ops,
 		SND_SOC_DAILINK_REG(ssp0_pin, ssp0_codec, platform),
 	},
@@ -798,8 +798,6 @@ static struct snd_soc_dai_link kabylake_dais[] = {
 		.ignore_pmdown_time = 1,
 		.be_hw_params_fixup = kabylake_ssp_fixup,
 		.ops = &kabylake_rt5663_ops,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
 		SND_SOC_DAILINK_REG(ssp1_pin, ssp1_codec, platform),
 	},
 	{
@@ -807,14 +805,14 @@ static struct snd_soc_dai_link kabylake_dais[] = {
 		.id = 2,
 		.be_hw_params_fixup = kabylake_dmic_fixup,
 		.ignore_suspend = 1,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		.no_pcm = 1,
 		SND_SOC_DAILINK_REG(dmic01_pin, dmic_codec, platform),
 	},
 	{
 		.name = "iDisp1",
 		.id = 3,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.init = kabylake_hdmi1_init,
 		.no_pcm = 1,
 		SND_SOC_DAILINK_REG(idisp1_pin, idisp1_codec, platform),
@@ -823,7 +821,7 @@ static struct snd_soc_dai_link kabylake_dais[] = {
 		.name = "iDisp2",
 		.id = 4,
 		.init = kabylake_hdmi2_init,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.no_pcm = 1,
 		SND_SOC_DAILINK_REG(idisp2_pin, idisp2_codec, platform),
 	},
@@ -831,7 +829,7 @@ static struct snd_soc_dai_link kabylake_dais[] = {
 		.name = "iDisp3",
 		.id = 5,
 		.init = kabylake_hdmi3_init,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.no_pcm = 1,
 		SND_SOC_DAILINK_REG(idisp3_pin, idisp3_codec, platform),
 	},
@@ -846,7 +844,7 @@ static struct snd_soc_dai_link kabylake_5663_dais[] = {
 		.nonatomic = 1,
 		.trigger = {
 			SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST},
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.ops = &kabylake_rt5663_fe_ops,
 		SND_SOC_DAILINK_REG(system, dummy, platform),
 	},
@@ -857,14 +855,14 @@ static struct snd_soc_dai_link kabylake_5663_dais[] = {
 		.nonatomic = 1,
 		.trigger = {
 			SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST},
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		.ops = &kabylake_rt5663_fe_ops,
 		SND_SOC_DAILINK_REG(system, dummy, platform),
 	},
 	[KBL_DPCM_AUDIO_5663_HDMI1_PB] = {
 		.name = "Kbl HDMI Port1",
 		.stream_name = "Hdmi1",
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.init = NULL,
 		.trigger = {
 			SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST},
@@ -875,7 +873,7 @@ static struct snd_soc_dai_link kabylake_5663_dais[] = {
 	[KBL_DPCM_AUDIO_5663_HDMI2_PB] = {
 		.name = "Kbl HDMI Port2",
 		.stream_name = "Hdmi2",
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.init = NULL,
 		.trigger = {
 			SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST},
@@ -896,14 +894,12 @@ static struct snd_soc_dai_link kabylake_5663_dais[] = {
 		.ignore_pmdown_time = 1,
 		.be_hw_params_fixup = kabylake_ssp_fixup,
 		.ops = &kabylake_rt5663_ops,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
 		SND_SOC_DAILINK_REG(ssp1_pin, ssp1_codec, platform),
 	},
 	{
 		.name = "iDisp1",
 		.id = 1,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.init = kabylake_5663_hdmi1_init,
 		.no_pcm = 1,
 		SND_SOC_DAILINK_REG(idisp1_pin, idisp1_codec, platform),
@@ -912,7 +908,7 @@ static struct snd_soc_dai_link kabylake_5663_dais[] = {
 		.name = "iDisp2",
 		.id = 2,
 		.init = kabylake_5663_hdmi2_init,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.no_pcm = 1,
 		SND_SOC_DAILINK_REG(idisp2_pin, idisp2_codec, platform),
 	},
diff --git a/sound/soc/intel/boards/kbl_rt5663_rt5514_max98927.c b/sound/soc/intel/boards/kbl_rt5663_rt5514_max98927.c
index 924d5d1de03a..31cc7be45020 100644
--- a/sound/soc/intel/boards/kbl_rt5663_rt5514_max98927.c
+++ b/sound/soc/intel/boards/kbl_rt5663_rt5514_max98927.c
@@ -575,7 +575,7 @@ static struct snd_soc_dai_link kabylake_dais[] = {
 		.init = kabylake_rt5663_fe_init,
 		.trigger = {
 			SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST},
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.ops = &kabylake_rt5663_fe_ops,
 		SND_SOC_DAILINK_REG(system, dummy, platform),
 	},
@@ -586,14 +586,14 @@ static struct snd_soc_dai_link kabylake_dais[] = {
 		.nonatomic = 1,
 		.trigger = {
 			SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST},
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		.ops = &kabylake_rt5663_fe_ops,
 		SND_SOC_DAILINK_REG(system, dummy, platform),
 	},
 	[KBL_DPCM_AUDIO_HS_PB] = {
 		.name = "Kbl Audio Headset Playback",
 		.stream_name = "Headset Audio",
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.nonatomic = 1,
 		.dynamic = 1,
 		SND_SOC_DAILINK_REG(system2, dummy, platform),
@@ -602,7 +602,7 @@ static struct snd_soc_dai_link kabylake_dais[] = {
 		.name = "Kbl Audio Echo Reference cap",
 		.stream_name = "Echoreference Capture",
 		.init = NULL,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		.nonatomic = 1,
 		SND_SOC_DAILINK_REG(echoref, dummy, platform),
 	},
@@ -615,7 +615,7 @@ static struct snd_soc_dai_link kabylake_dais[] = {
 		.name = "Kbl Audio DMIC cap",
 		.stream_name = "dmiccap",
 		.init = NULL,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		.nonatomic = 1,
 		.dynamic = 1,
 		.ops = &kabylake_dmic_ops,
@@ -624,7 +624,7 @@ static struct snd_soc_dai_link kabylake_dais[] = {
 	[KBL_DPCM_AUDIO_HDMI1_PB] = {
 		.name = "Kbl HDMI Port1",
 		.stream_name = "Hdmi1",
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.init = NULL,
 		.trigger = {
 			SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST},
@@ -635,7 +635,7 @@ static struct snd_soc_dai_link kabylake_dais[] = {
 	[KBL_DPCM_AUDIO_HDMI2_PB] = {
 		.name = "Kbl HDMI Port2",
 		.stream_name = "Hdmi2",
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.init = NULL,
 		.trigger = {
 			SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST},
@@ -655,8 +655,6 @@ static struct snd_soc_dai_link kabylake_dais[] = {
 			SND_SOC_DAIFMT_CBC_CFC,
 		.ignore_pmdown_time = 1,
 		.be_hw_params_fixup = kabylake_ssp_fixup,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
 		.ops = &kabylake_ssp0_ops,
 		SND_SOC_DAILINK_REG(ssp0_pin, ssp0_codec, platform),
 	},
@@ -670,14 +668,12 @@ static struct snd_soc_dai_link kabylake_dais[] = {
 		.ignore_pmdown_time = 1,
 		.be_hw_params_fixup = kabylake_ssp_fixup,
 		.ops = &kabylake_rt5663_ops,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
 		SND_SOC_DAILINK_REG(ssp1_pin, ssp1_codec, platform),
 	},
 	{
 		.name = "iDisp1",
 		.id = 3,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.init = kabylake_hdmi1_init,
 		.no_pcm = 1,
 		SND_SOC_DAILINK_REG(idisp1_pin, idisp1_codec, platform),
@@ -686,7 +682,7 @@ static struct snd_soc_dai_link kabylake_dais[] = {
 		.name = "iDisp2",
 		.id = 4,
 		.init = kabylake_hdmi2_init,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.no_pcm = 1,
 		SND_SOC_DAILINK_REG(idisp2_pin, idisp2_codec, platform),
 	},
diff --git a/sound/soc/intel/boards/skl_hda_dsp_common.c b/sound/soc/intel/boards/skl_hda_dsp_common.c
index e9cefa4ae56d..8e13216e16c8 100644
--- a/sound/soc/intel/boards/skl_hda_dsp_common.c
+++ b/sound/soc/intel/boards/skl_hda_dsp_common.c
@@ -84,51 +84,47 @@ struct snd_soc_dai_link skl_hda_be_dai_links[HDA_DSP_MAX_BE_DAI_LINKS] = {
 	{
 		.name = "iDisp1",
 		.id = 1,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.no_pcm = 1,
 		SND_SOC_DAILINK_REG(idisp1_cpu, idisp1_codec, platform),
 	},
 	{
 		.name = "iDisp2",
 		.id = 2,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.no_pcm = 1,
 		SND_SOC_DAILINK_REG(idisp2_cpu, idisp2_codec, platform),
 	},
 	{
 		.name = "iDisp3",
 		.id = 3,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.no_pcm = 1,
 		SND_SOC_DAILINK_REG(idisp3_cpu, idisp3_codec, platform),
 	},
 	{
 		.name = "Analog Playback and Capture",
 		.id = 4,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
 		.no_pcm = 1,
 		SND_SOC_DAILINK_REG(analog_cpu, analog_codec, platform),
 	},
 	{
 		.name = "Digital Playback and Capture",
 		.id = 5,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
 		.no_pcm = 1,
 		SND_SOC_DAILINK_REG(digital_cpu, digital_codec, platform),
 	},
 	{
 		.name = "dmic01",
 		.id = 6,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		.no_pcm = 1,
 		SND_SOC_DAILINK_REG(dmic_pin, dmic_codec, platform),
 	},
 	{
 		.name = "dmic16k",
 		.id = 7,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		.no_pcm = 1,
 		SND_SOC_DAILINK_REG(dmic16k, dmic_codec, platform),
 	},
diff --git a/sound/soc/intel/boards/skl_nau88l25_max98357a.c b/sound/soc/intel/boards/skl_nau88l25_max98357a.c
index e4630c33176e..cc0fc9bde616 100644
--- a/sound/soc/intel/boards/skl_nau88l25_max98357a.c
+++ b/sound/soc/intel/boards/skl_nau88l25_max98357a.c
@@ -474,7 +474,7 @@ static struct snd_soc_dai_link skylake_dais[] = {
 		.init = skylake_nau8825_fe_init,
 		.trigger = {
 			SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST},
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.ops = &skylake_nau8825_fe_ops,
 		SND_SOC_DAILINK_REG(system, dummy, platform),
 	},
@@ -485,7 +485,7 @@ static struct snd_soc_dai_link skylake_dais[] = {
 		.nonatomic = 1,
 		.trigger = {
 			SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST},
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		.ops = &skylake_nau8825_fe_ops,
 		SND_SOC_DAILINK_REG(system, dummy, platform),
 	},
@@ -493,7 +493,7 @@ static struct snd_soc_dai_link skylake_dais[] = {
 		.name = "Skl Audio Reference cap",
 		.stream_name = "Wake on Voice",
 		.init = NULL,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		.nonatomic = 1,
 		.dynamic = 1,
 		.ops = &skylake_refcap_ops,
@@ -503,7 +503,7 @@ static struct snd_soc_dai_link skylake_dais[] = {
 		.name = "Skl Audio DMIC cap",
 		.stream_name = "dmiccap",
 		.init = NULL,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		.nonatomic = 1,
 		.dynamic = 1,
 		.ops = &skylake_dmic_ops,
@@ -512,7 +512,7 @@ static struct snd_soc_dai_link skylake_dais[] = {
 	[SKL_DPCM_AUDIO_HDMI1_PB] = {
 		.name = "Skl HDMI Port1",
 		.stream_name = "Hdmi1",
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.init = NULL,
 		.trigger = {
 			SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST},
@@ -523,7 +523,7 @@ static struct snd_soc_dai_link skylake_dais[] = {
 	[SKL_DPCM_AUDIO_HDMI2_PB] = {
 		.name = "Skl HDMI Port2",
 		.stream_name = "Hdmi2",
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.init = NULL,
 		.trigger = {
 			SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST},
@@ -536,7 +536,7 @@ static struct snd_soc_dai_link skylake_dais[] = {
 		.stream_name = "Hdmi3",
 		.trigger = {
 			SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST},
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.init = NULL,
 		.nonatomic = 1,
 		.dynamic = 1,
@@ -554,7 +554,7 @@ static struct snd_soc_dai_link skylake_dais[] = {
 			SND_SOC_DAIFMT_CBC_CFC,
 		.ignore_pmdown_time = 1,
 		.be_hw_params_fixup = skylake_ssp_fixup,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		SND_SOC_DAILINK_REG(ssp0_pin, ssp0_codec, platform),
 	},
 	{
@@ -568,8 +568,6 @@ static struct snd_soc_dai_link skylake_dais[] = {
 		.ignore_pmdown_time = 1,
 		.be_hw_params_fixup = skylake_ssp_fixup,
 		.ops = &skylake_nau8825_ops,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
 		SND_SOC_DAILINK_REG(ssp1_pin, ssp1_codec, platform),
 	},
 	{
@@ -577,14 +575,14 @@ static struct snd_soc_dai_link skylake_dais[] = {
 		.id = 2,
 		.be_hw_params_fixup = skylake_dmic_fixup,
 		.ignore_suspend = 1,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		.no_pcm = 1,
 		SND_SOC_DAILINK_REG(dmic_pin, dmic_codec, platform),
 	},
 	{
 		.name = "iDisp1",
 		.id = 3,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.init = skylake_hdmi1_init,
 		.no_pcm = 1,
 		SND_SOC_DAILINK_REG(idisp1_pin, idisp1_codec, platform),
@@ -593,7 +591,7 @@ static struct snd_soc_dai_link skylake_dais[] = {
 		.name = "iDisp2",
 		.id = 4,
 		.init = skylake_hdmi2_init,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.no_pcm = 1,
 		SND_SOC_DAILINK_REG(idisp2_pin, idisp2_codec, platform),
 	},
@@ -601,7 +599,7 @@ static struct snd_soc_dai_link skylake_dais[] = {
 		.name = "iDisp3",
 		.id = 5,
 		.init = skylake_hdmi3_init,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.no_pcm = 1,
 		SND_SOC_DAILINK_REG(idisp3_pin, idisp3_codec, platform),
 	},
diff --git a/sound/soc/intel/boards/skl_nau88l25_ssm4567.c b/sound/soc/intel/boards/skl_nau88l25_ssm4567.c
index fadc25a536b4..c5e12a2b3fbf 100644
--- a/sound/soc/intel/boards/skl_nau88l25_ssm4567.c
+++ b/sound/soc/intel/boards/skl_nau88l25_ssm4567.c
@@ -513,7 +513,7 @@ static struct snd_soc_dai_link skylake_dais[] = {
 		.init = skylake_nau8825_fe_init,
 		.trigger = {
 			SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST},
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.ops = &skylake_nau8825_fe_ops,
 		SND_SOC_DAILINK_REG(system, dummy, platform),
 	},
@@ -524,7 +524,7 @@ static struct snd_soc_dai_link skylake_dais[] = {
 		.nonatomic = 1,
 		.trigger = {
 			SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST},
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		.ops = &skylake_nau8825_fe_ops,
 		SND_SOC_DAILINK_REG(system, dummy, platform),
 	},
@@ -532,7 +532,7 @@ static struct snd_soc_dai_link skylake_dais[] = {
 		.name = "Skl Audio Reference cap",
 		.stream_name = "Wake on Voice",
 		.init = NULL,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		.nonatomic = 1,
 		.dynamic = 1,
 		.ops = &skylake_refcap_ops,
@@ -542,7 +542,7 @@ static struct snd_soc_dai_link skylake_dais[] = {
 		.name = "Skl Audio DMIC cap",
 		.stream_name = "dmiccap",
 		.init = NULL,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		.nonatomic = 1,
 		.dynamic = 1,
 		.ops = &skylake_dmic_ops,
@@ -551,7 +551,7 @@ static struct snd_soc_dai_link skylake_dais[] = {
 	[SKL_DPCM_AUDIO_HDMI1_PB] = {
 		.name = "Skl HDMI Port1",
 		.stream_name = "Hdmi1",
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.init = NULL,
 		.trigger = {
 			SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST},
@@ -562,7 +562,7 @@ static struct snd_soc_dai_link skylake_dais[] = {
 	[SKL_DPCM_AUDIO_HDMI2_PB] = {
 		.name = "Skl HDMI Port2",
 		.stream_name = "Hdmi2",
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.init = NULL,
 		.trigger = {
 			SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST},
@@ -575,7 +575,7 @@ static struct snd_soc_dai_link skylake_dais[] = {
 		.stream_name = "Hdmi3",
 		.trigger = {
 			SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST},
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.init = NULL,
 		.nonatomic = 1,
 		.dynamic = 1,
@@ -594,8 +594,6 @@ static struct snd_soc_dai_link skylake_dais[] = {
 		.init = skylake_ssm4567_codec_init,
 		.ignore_pmdown_time = 1,
 		.be_hw_params_fixup = skylake_ssp_fixup,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
 		SND_SOC_DAILINK_REG(ssp0_pin, ssp0_codec, platform),
 	},
 	{
@@ -609,8 +607,6 @@ static struct snd_soc_dai_link skylake_dais[] = {
 		.ignore_pmdown_time = 1,
 		.be_hw_params_fixup = skylake_ssp_fixup,
 		.ops = &skylake_nau8825_ops,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
 		SND_SOC_DAILINK_REG(ssp1_pin, ssp1_codec, platform),
 	},
 	{
@@ -618,14 +614,14 @@ static struct snd_soc_dai_link skylake_dais[] = {
 		.id = 2,
 		.ignore_suspend = 1,
 		.be_hw_params_fixup = skylake_dmic_fixup,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		.no_pcm = 1,
 		SND_SOC_DAILINK_REG(dmic01_pin, dmic_codec, platform),
 	},
 	{
 		.name = "iDisp1",
 		.id = 3,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.init = skylake_hdmi1_init,
 		.no_pcm = 1,
 		SND_SOC_DAILINK_REG(idisp1_pin, idisp1_codec, platform),
@@ -634,7 +630,7 @@ static struct snd_soc_dai_link skylake_dais[] = {
 		.name = "iDisp2",
 		.id = 4,
 		.init = skylake_hdmi2_init,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.no_pcm = 1,
 		SND_SOC_DAILINK_REG(idisp2_pin, idisp2_codec, platform),
 	},
@@ -642,7 +638,7 @@ static struct snd_soc_dai_link skylake_dais[] = {
 		.name = "iDisp3",
 		.id = 5,
 		.init = skylake_hdmi3_init,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.no_pcm = 1,
 		SND_SOC_DAILINK_REG(idisp3_pin, idisp3_codec, platform),
 	},
diff --git a/sound/soc/intel/boards/skl_rt286.c b/sound/soc/intel/boards/skl_rt286.c
index 9a8044274908..6525e14815ab 100644
--- a/sound/soc/intel/boards/skl_rt286.c
+++ b/sound/soc/intel/boards/skl_rt286.c
@@ -348,7 +348,7 @@ static struct snd_soc_dai_link skylake_rt286_dais[] = {
 			SND_SOC_DPCM_TRIGGER_POST,
 			SND_SOC_DPCM_TRIGGER_POST
 		},
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.ops = &skylake_rt286_fe_ops,
 		SND_SOC_DAILINK_REG(system, dummy, platform),
 	},
@@ -361,7 +361,7 @@ static struct snd_soc_dai_link skylake_rt286_dais[] = {
 			SND_SOC_DPCM_TRIGGER_POST,
 			SND_SOC_DPCM_TRIGGER_POST
 		},
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.ops = &skylake_rt286_fe_ops,
 		SND_SOC_DAILINK_REG(deepbuffer, dummy, platform),
 	},
@@ -374,7 +374,7 @@ static struct snd_soc_dai_link skylake_rt286_dais[] = {
 			SND_SOC_DPCM_TRIGGER_POST,
 			SND_SOC_DPCM_TRIGGER_POST
 		},
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		.ops = &skylake_rt286_fe_ops,
 		SND_SOC_DAILINK_REG(system, dummy, platform),
 	},
@@ -382,7 +382,7 @@ static struct snd_soc_dai_link skylake_rt286_dais[] = {
 		.name = "Skl Audio Reference cap",
 		.stream_name = "refcap",
 		.init = NULL,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		.nonatomic = 1,
 		.dynamic = 1,
 		SND_SOC_DAILINK_REG(reference, dummy, platform),
@@ -391,7 +391,7 @@ static struct snd_soc_dai_link skylake_rt286_dais[] = {
 		.name = "Skl Audio DMIC cap",
 		.stream_name = "dmiccap",
 		.init = NULL,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		.nonatomic = 1,
 		.dynamic = 1,
 		.ops = &skylake_dmic_ops,
@@ -400,7 +400,7 @@ static struct snd_soc_dai_link skylake_rt286_dais[] = {
 	[SKL_DPCM_AUDIO_HDMI1_PB] = {
 		.name = "Skl HDMI Port1",
 		.stream_name = "Hdmi1",
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.init = NULL,
 		.nonatomic = 1,
 		.dynamic = 1,
@@ -409,7 +409,7 @@ static struct snd_soc_dai_link skylake_rt286_dais[] = {
 	[SKL_DPCM_AUDIO_HDMI2_PB] = {
 		.name = "Skl HDMI Port2",
 		.stream_name = "Hdmi2",
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.init = NULL,
 		.nonatomic = 1,
 		.dynamic = 1,
@@ -418,7 +418,7 @@ static struct snd_soc_dai_link skylake_rt286_dais[] = {
 	[SKL_DPCM_AUDIO_HDMI3_PB] = {
 		.name = "Skl HDMI Port3",
 		.stream_name = "Hdmi3",
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.init = NULL,
 		.nonatomic = 1,
 		.dynamic = 1,
@@ -438,8 +438,6 @@ static struct snd_soc_dai_link skylake_rt286_dais[] = {
 		.ignore_pmdown_time = 1,
 		.be_hw_params_fixup = skylake_ssp0_fixup,
 		.ops = &skylake_rt286_ops,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
 		SND_SOC_DAILINK_REG(ssp0_pin, ssp0_codec, platform),
 	},
 	{
@@ -447,7 +445,7 @@ static struct snd_soc_dai_link skylake_rt286_dais[] = {
 		.id = 1,
 		.be_hw_params_fixup = skylake_dmic_fixup,
 		.ignore_suspend = 1,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		.no_pcm = 1,
 		SND_SOC_DAILINK_REG(dmic01_pin, dmic_codec, platform),
 	},
@@ -455,7 +453,7 @@ static struct snd_soc_dai_link skylake_rt286_dais[] = {
 		.name = "iDisp1",
 		.id = 2,
 		.init = skylake_hdmi_init,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.no_pcm = 1,
 		SND_SOC_DAILINK_REG(idisp1_pin, idisp1_codec, platform),
 	},
@@ -463,7 +461,7 @@ static struct snd_soc_dai_link skylake_rt286_dais[] = {
 		.name = "iDisp2",
 		.id = 3,
 		.init = skylake_hdmi_init,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.no_pcm = 1,
 		SND_SOC_DAILINK_REG(idisp2_pin, idisp2_codec, platform),
 	},
@@ -471,7 +469,7 @@ static struct snd_soc_dai_link skylake_rt286_dais[] = {
 		.name = "iDisp3",
 		.id = 4,
 		.init = skylake_hdmi_init,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.no_pcm = 1,
 		SND_SOC_DAILINK_REG(idisp3_pin, idisp3_codec, platform),
 	},
diff --git a/sound/soc/intel/boards/sof_board_helpers.c b/sound/soc/intel/boards/sof_board_helpers.c
index eb140e13153f..1312acc62aea 100644
--- a/sound/soc/intel/boards/sof_board_helpers.c
+++ b/sound/soc/intel/boards/sof_board_helpers.c
@@ -144,8 +144,6 @@ static int set_ssp_codec_link(struct device *dev, struct snd_soc_dai_link *link,
 
 	link->id = be_id;
 	link->no_pcm = 1;
-	link->dpcm_capture = 1;
-	link->dpcm_playback = 1;
 
 	return 0;
 }
@@ -195,7 +193,7 @@ static int set_dmic_link(struct device *dev, struct snd_soc_dai_link *link,
 		link->init = dmic_init;
 	link->ignore_suspend = 1;
 	link->no_pcm = 1;
-	link->dpcm_capture = 1;
+	link->capture_only = 1;
 
 	return 0;
 }
@@ -253,7 +251,7 @@ static int set_idisp_hdmi_link(struct device *dev, struct snd_soc_dai_link *link
 	link->id = be_id;
 	link->init = (hdmi_id == 1) ? hdmi_init : NULL;
 	link->no_pcm = 1;
-	link->dpcm_playback = 1;
+	link->playback_only = 1;
 
 	return 0;
 }
@@ -288,13 +286,12 @@ static int set_ssp_amp_link(struct device *dev, struct snd_soc_dai_link *link,
 	/* codecs - caller to handle */
 
 	/* platforms */
+	/* Capture stream: feedback stream or firmware-generated echo reference */
 	link->platforms = platform_component;
 	link->num_platforms = ARRAY_SIZE(platform_component);
 
 	link->id = be_id;
 	link->no_pcm = 1;
-	link->dpcm_capture = 1; /* feedback stream or firmware-generated echo reference */
-	link->dpcm_playback = 1;
 
 	return 0;
 }
@@ -334,8 +331,6 @@ static int set_bt_offload_link(struct device *dev, struct snd_soc_dai_link *link
 
 	link->id = be_id;
 	link->no_pcm = 1;
-	link->dpcm_capture = 1;
-	link->dpcm_playback = 1;
 
 	return 0;
 }
@@ -375,7 +370,7 @@ static int set_hdmi_in_link(struct device *dev, struct snd_soc_dai_link *link,
 
 	link->id = be_id;
 	link->no_pcm = 1;
-	link->dpcm_capture = 1;
+	link->capture_only = 1;
 
 	return 0;
 }
diff --git a/sound/soc/intel/boards/sof_es8336.c b/sound/soc/intel/boards/sof_es8336.c
index c1fcc156a575..858a20e2e9b3 100644
--- a/sound/soc/intel/boards/sof_es8336.c
+++ b/sound/soc/intel/boards/sof_es8336.c
@@ -455,8 +455,6 @@ static struct snd_soc_dai_link *sof_card_dai_links_create(struct device *dev,
 	links[id].exit = sof_es8316_exit;
 	links[id].ops = &sof_es8336_ops;
 	links[id].nonatomic = true;
-	links[id].dpcm_playback = 1;
-	links[id].dpcm_capture = 1;
 	links[id].no_pcm = 1;
 	links[id].cpus = &cpus[id];
 	links[id].num_cpus = 1;
@@ -496,7 +494,7 @@ static struct snd_soc_dai_link *sof_card_dai_links_create(struct device *dev,
 		links[id].platforms = platform_component;
 		links[id].num_platforms = ARRAY_SIZE(platform_component);
 		links[id].ignore_suspend = 1;
-		links[id].dpcm_capture = 1;
+		links[id].capture_only = 1;
 		links[id].no_pcm = 1;
 
 		id++;
@@ -539,7 +537,7 @@ static struct snd_soc_dai_link *sof_card_dai_links_create(struct device *dev,
 		links[id].platforms = platform_component;
 		links[id].num_platforms = ARRAY_SIZE(platform_component);
 		links[id].init = sof_hdmi_init;
-		links[id].dpcm_playback = 1;
+		links[id].playback_only = 1;
 		links[id].no_pcm = 1;
 
 		id++;
@@ -569,7 +567,7 @@ static struct snd_soc_dai_link *sof_card_dai_links_create(struct device *dev,
 			links[id].num_codecs = 1;
 			links[id].platforms = platform_component;
 			links[id].num_platforms = ARRAY_SIZE(platform_component);
-			links[id].dpcm_capture = 1;
+			links[id].capture_only = 1;
 			links[id].no_pcm = 1;
 			links[id].num_cpus = 1;
 			id++;
diff --git a/sound/soc/intel/boards/sof_pcm512x.c b/sound/soc/intel/boards/sof_pcm512x.c
index b01cb2329542..9f26938f2f13 100644
--- a/sound/soc/intel/boards/sof_pcm512x.c
+++ b/sound/soc/intel/boards/sof_pcm512x.c
@@ -246,12 +246,12 @@ static struct snd_soc_dai_link *sof_card_dai_links_create(struct device *dev,
 	links[id].num_platforms = ARRAY_SIZE(platform_component);
 	links[id].init = sof_pcm512x_codec_init;
 	links[id].ops = &sof_pcm512x_ops;
-	links[id].dpcm_playback = 1;
+	links[id].playback_only = 1;
 	/*
 	 * capture only supported with specific versions of the Hifiberry DAC+
 	 */
 	if (sof_pcm512x_quirk & SOF_PCM512X_ENABLE_SSP_CAPTURE)
-		links[id].dpcm_capture = 1;
+		links[id].playback_only = 0;
 	links[id].no_pcm = 1;
 	links[id].cpus = &cpus[id];
 	links[id].num_cpus = 1;
@@ -294,7 +294,7 @@ static struct snd_soc_dai_link *sof_card_dai_links_create(struct device *dev,
 		links[id].platforms = platform_component;
 		links[id].num_platforms = ARRAY_SIZE(platform_component);
 		links[id].ignore_suspend = 1;
-		links[id].dpcm_capture = 1;
+		links[id].capture_only = 1;
 		links[id].no_pcm = 1;
 		id++;
 	}
@@ -341,7 +341,7 @@ static struct snd_soc_dai_link *sof_card_dai_links_create(struct device *dev,
 		links[id].platforms = platform_component;
 		links[id].num_platforms = ARRAY_SIZE(platform_component);
 		links[id].init = sof_hdmi_init;
-		links[id].dpcm_playback = 1;
+		links[id].playback_only = 1;
 		links[id].no_pcm = 1;
 		id++;
 	}
diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index b94835448b1b..34a9b2e52451 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -1151,8 +1151,8 @@ static void init_dai_link(struct device *dev, struct snd_soc_dai_link *dai_links
 	dai_links->num_cpus = cpus_num;
 	dai_links->codecs = codecs;
 	dai_links->num_codecs = codecs_num;
-	dai_links->dpcm_playback = playback;
-	dai_links->dpcm_capture = capture;
+	dai_links->playback_only = !playback;
+	dai_links->capture_only = !capture;
 	dai_links->init = init;
 	dai_links->ops = ops;
 }
diff --git a/sound/soc/intel/boards/sof_wm8804.c b/sound/soc/intel/boards/sof_wm8804.c
index 4cb0d463bf40..ab7385940ae4 100644
--- a/sound/soc/intel/boards/sof_wm8804.c
+++ b/sound/soc/intel/boards/sof_wm8804.c
@@ -167,8 +167,6 @@ static struct snd_soc_dai_link dailink[] = {
 		.name = "SSP5-Codec",
 		.id = 0,
 		.no_pcm = 1,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
 		.ops = &sof_wm8804_ops,
 		SND_SOC_DAILINK_REG(ssp5_pin, ssp5_codec, platform),
 	},
-- 
2.25.1

