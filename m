Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 27D868A91EE
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Apr 2024 06:16:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ADDCCE97;
	Thu, 18 Apr 2024 06:16:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ADDCCE97
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1713413800;
	bh=hRrR3ZKkq7p6nbk1CuYGX/kR887vgtP3gPJexi1sApU=;
	h=To:In-Reply-To:References:From:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=RL4GXmpz2pZx9lxpMHiE9JuI8WHMUyKv9vYH2H9YFFqKG540W1YZLEo0CqCTmdasw
	 zecCWPvkTGyBb4628DUY57g65vyi1xp0sIrR16Dd2iyxKodGNeogKB7NL7vYSjJ83D
	 DkTNv9Q3Z6XKvYY9YJlvFeXHuaFQhG78Pv4/u5L8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D0BFCF806A0; Thu, 18 Apr 2024 06:15:04 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D673DF806A3;
	Thu, 18 Apr 2024 06:15:03 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6F58CF80494; Thu, 18 Apr 2024 06:14:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20601.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:201a::601])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8B059F80124
	for <alsa-devel@alsa-project.org>; Thu, 18 Apr 2024 06:13:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8B059F80124
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=f4Tk2jkj
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cmZJYqIvDb3G9YKO5lHA8Njb9dKGX1yZ42aw+fylejkiB4czdAXjc4k6/Nh6hu5l4QgKYoKWeU2i7ZQG+wy9si5Aead4Ab3DP/GtnoRhRMrjLzS4W3p94ZEj2x+Tw7+tv57WKA5h60obKY1Bzjvirhc8Ab9WM83U7uWWkzCE6HpmEhUC7QLVQCjXdfoOZhUFGX391GZAUp4aOxn64Cjzm7+Xn2hzFZzydK9wscc6uxbdjgzAP4x9dPu9btn5yKr2AqfMW6LO2kZJda0NLRbgrbst2GplORTS2QviElUf1BaiVl2viCKquAC6z4GEQVVHb+8NKZZkxd38/++VnCmuWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dcGuKAM1ej5PkL543oeduwHuykUiZYyY2wL7rzukYRI=;
 b=LiJPcPiBg3LKtf+NtQH+JYzdj4vLDkcEYtOi9EE3imJvtJX5D2QgTmN2s1Qe3VLJiX2WLP/VC8+2agiGbbRRprXc9uecKJJ5urYAp5SPlyh97TTLVKaNcCKE8g40gjSDTXQNy/IfhUQExWzC6j4L9x6q9+M2sCv4JpJH7/qwJSGVo5Vp8MqgqIZO6Bbq7RuIUys+Scv8rkjhAD+taxj+X3LKizxsmgk6zUh5FxnCjjEyLDAPw2ZHpXMFq6q4Zn34aWWZgiLppTdgoTtBs44awXUUJMWV72nN9OOQCcXISFHrL3TddYAAoQpdTUOjgpWvsy2hkFCpXXMnNpJg8hWbOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dcGuKAM1ej5PkL543oeduwHuykUiZYyY2wL7rzukYRI=;
 b=f4Tk2jkj8BjE1n7zJd9xwdht69xAtQzsEwk6ljQDmm7Fi/SAR6/wGEGdyv0ftASdKYc7vu5FNXMb4XaZTd6KptCl0FycMneY2L7lY8/sLubsVpqrTmtnYjQKhsfLjgighdXX5xnj/zfJ6Hi3YH0e49WQqTj+GCIpjuQh8GcLxQI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSAPR01MB7397.jpnprd01.prod.outlook.com
 (2603:1096:604:142::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.39; Thu, 18 Apr
 2024 04:13:37 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::131e:55c0:a4a0:713b]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::131e:55c0:a4a0:713b%7]) with mapi id 15.20.7472.037; Thu, 18 Apr 2024
 04:13:37 +0000
Message-ID: <875xwf8g0f.wl-kuninori.morimoto.gx@renesas.com>
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
Subject: [PATCH v3 08/23] ASoC: Intel: Replace dpcm_playback/capture to
 playback/capture_assertion
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 18 Apr 2024 04:13:36 +0000
X-ClientProxiedBy: TY2PR0101CA0007.apcprd01.prod.exchangelabs.com
 (2603:1096:404:92::19) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSAPR01MB7397:EE_
X-MS-Office365-Filtering-Correlation-Id: befb6150-537c-4479-555e-08dc5f5debb0
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Us09WoGjiH9gOvPCUuFjSkIURdSSteLBzY1/By3NR7VBfsRcM/E45Wn0wgY/M+cyjER6yyw5Yj1aZaiuVDXPwkKfidqzKe23h+5gflfdoHr/D8APXL6pMdhTJ0R1Tn1hxnHDW9NPnKE3a9A2LCTgt2fJQ/d4tooHfzS0fFAAYxo8shF07yHLH6uYhb1uP9rwt0awd3xpT13KdRoWHE+F6XHRfdS9Duc/kFyPWZMnpFDcIFq2r8kmsbsktS7bvUW0s3zKx76zS5jRxjHb8tTfIpDhF35wCsQI/f85boiVzhRifVDXqOnNxF+E9pmlm+1YAnm+iHjBeI7zqIdGkfZRs+aM8UsOZw455A4ZvaBsQw2cM6PF7+5pFEQJFYWUOIhCuV9+sfZZMmOk5R/7KaWZP33949C/I5QvO04rjOOWYLfjZRnD9rCbWMUNuQu9kqYPJ3kxwaisgpGVpgvrM39O3iwPmQYLB0u4XHPXPxw6ZtXCXBnQQn2wSwHwXHnjt2BSIM1JaqiaZBpM0v4xIFb4MjdN2qhnY0Psa3FtUWo7EHsT8UAksvKlNg9VbZFAN32y1r3kTw7h5fhtjD6E69CkCcCWWRYyOEZEwQsmcq8GorRumqQqQfdPG2LR3CGNucPADmk1e0EUmU6K0a7bgX05jw7diynbuJAuKatY/iUSbsdv5u6ADYKBv9L99WxErMPY9iY7sTuSOOiktmbVltjdil+uVt3oHYqgSkO3Sf9XG0s=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(52116005)(7416005)(1800799015)(376005)(366007)(38350700005)(921011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?DMbwfGJLW65YnS52YsS0GhA63tH861PSrlGaxoPZZXflbiVmrOZV1c/Wl/qY?=
 =?us-ascii?Q?tnD00YRMXeFI7m3x5AtBkEJEzgPdsIvmhITHYinin/KTpHZcgd+jCVz+Iox/?=
 =?us-ascii?Q?gr7ABPGaciG4scs9wTJOBauJn3jfzGmWsaRrtwbR1oGSijTA157z4b+xVLAy?=
 =?us-ascii?Q?gE/R+Qly11XOTAqD0ntIR1zwMTeIu9WPWl2NJ9KGeUP+fJYX97naFW24b8/5?=
 =?us-ascii?Q?Kv5lJowOGld+RpsI1wJ5rmI9v/HNQCn6LpaiGuCxoDeGCWmyhNzhp39fYXPo?=
 =?us-ascii?Q?zwx07jqnbuaE5oGPrj4b4sc2e8H412uc4K3jL0YixQKUeK9kYtu7nhal60ax?=
 =?us-ascii?Q?mZa8+u2h8H7yioiBGSTUufWTz2fHf2iFe9Q7piScFf+StzheXI+EcuZ78kwR?=
 =?us-ascii?Q?cAtzfw0kxa5vWuQwOoXD/3yDtCfDMab8/KkPR23XjUKS/zl8oQtreLWXK6G2?=
 =?us-ascii?Q?ojflNHicC5k/tJPjj3KL3uB4wxQuC/DIVPRWOxlx2ZFBsyOuk1ZWfwApu97u?=
 =?us-ascii?Q?/JhgSRnMYzJAA3bzfXYUMgaaKwm3CXNEPHPVPfCEjJQZyrLKnnXzzo6DzL0O?=
 =?us-ascii?Q?t6lRPfAYUu33LjH/KjTkz9sbNLBiu1iRW69WmkPc/4ZFUzRGTg+QKTHUzazG?=
 =?us-ascii?Q?lujeD3ENv34wf8gP798fAnVnB/eFB1qgY4eSanIUSmPvZKZLkiYxRNb8HUNp?=
 =?us-ascii?Q?+IDFjWx47Xn9oLMLGwgO1TLjbun5ckjCR/FnXHh3Nb/AX0LUqKWN/4Q0jNds?=
 =?us-ascii?Q?sbo1CiX2U2uzuM+TcKR7SNxRVYxJq722TFnLh6lxjD1NUyC+Gp3A54gxwq4m?=
 =?us-ascii?Q?354OY1cFWzNSZIq58ZLU9PslizaJID/bgh0PQnw/hremqO0/ifAssOenxOQW?=
 =?us-ascii?Q?iHTe6Dy8O0eDhqejuqeQbGOqNBkC8QldOkDR+DmulLHfv0T/A4JfpgGYgM0e?=
 =?us-ascii?Q?a5kHSq5w6GcB8jbpTb502ki6SrlLaMCWv2QLpWD0uLbbRDeS0FJs2C887DPr?=
 =?us-ascii?Q?F6Vo1u1wYdN1bBKUTGRdmONrqKSFU+sW2xJDsmVrOGoFySN72nc6Nhg6grCk?=
 =?us-ascii?Q?N4YD78PazA+gBNNDYt8gZjw+xP7XNR7Mme9mNAIkWKjpg2rjGa+oru8TBtnL?=
 =?us-ascii?Q?0la/PZKt498lTUdabtqKUQRwoEW7p07bdiHNgxbu1DEN9a97V0M0Tm50qAiB?=
 =?us-ascii?Q?Ch7amFYkjFUyTVpqIPH14xkcSgCYF9/q07dq2kAniF2Z+q04o9NQxyJqOvd1?=
 =?us-ascii?Q?ngxroStwtbDi5cVtGpvQ0o4o9kV0qpleP2XDpzuACHFZ+PxLaYqHDvchxI0Y?=
 =?us-ascii?Q?3k8YLx+8WIFHjtaf3WVSrTfHIkWMa9TqJECdkRzTdsaJXVo3AuuzUP8EfsFH?=
 =?us-ascii?Q?pCcPdvaRdzC8hH+jsbf5Pe7mZkJjQQyd+ia6bmGMLDwCdkgMO5gK+DWmzixx?=
 =?us-ascii?Q?ccOQoUnIZdvKRJttmJwVnmASo1NDhNa/baiNUrozoTcWrCnZh3gEdT4Jmq+6?=
 =?us-ascii?Q?sVfa/nvg6pWnfH+RhjU8zAE2iwlj3Dfm5smBGAqKKv2X0pvByFFYRUR9Ig0G?=
 =?us-ascii?Q?wLnb1MrhkXUDNU29KiTNtIen5K/4egDVIMErKv1k2gSSg1HXb3y1u9KKO/N9?=
 =?us-ascii?Q?fHHPGvwjVnzlUz6Jz2pqlEk=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 befb6150-537c-4479-555e-08dc5f5debb0
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2024 04:13:37.2486
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 Nsk2xsYq1Sc9nlhM4cfexeET/ZBxc/7r/OL0WDA+yYL7d1z2ieZT/Hm8wYleLdfox3WRfF5EStSK/1Z7lzEtH7/pqDG0ryedbJT7SlitqhTqFh2LL7xfMAJ/QvarpTOv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSAPR01MB7397
Message-ID-Hash: 6T745TIH3K5BYCRGL2NPFERIQQOCF7QW
X-Message-ID-Hash: 6T745TIH3K5BYCRGL2NPFERIQQOCF7QW
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6T745TIH3K5BYCRGL2NPFERIQQOCF7QW/>
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
 sound/soc/intel/boards/bdw-rt5650.c           |  8 +--
 sound/soc/intel/boards/bdw-rt5677.c           |  8 +--
 sound/soc/intel/boards/bdw_rt286.c            | 14 ++---
 sound/soc/intel/boards/bxt_da7219_max98357a.c | 34 +++++------
 sound/soc/intel/boards/bxt_rt298.c            | 28 ++++-----
 sound/soc/intel/boards/bytcht_cx2072x.c       | 10 ++--
 sound/soc/intel/boards/bytcht_da7213.c        | 10 ++--
 sound/soc/intel/boards/bytcht_es8316.c        | 10 ++--
 sound/soc/intel/boards/bytcht_nocodec.c       | 10 ++--
 sound/soc/intel/boards/bytcr_rt5640.c         | 10 ++--
 sound/soc/intel/boards/bytcr_rt5651.c         | 10 ++--
 sound/soc/intel/boards/bytcr_wm5102.c         | 10 ++--
 sound/soc/intel/boards/cht_bsw_max98090_ti.c  | 10 ++--
 sound/soc/intel/boards/cht_bsw_nau8824.c      | 10 ++--
 sound/soc/intel/boards/cht_bsw_rt5645.c       | 10 ++--
 sound/soc/intel/boards/cht_bsw_rt5672.c       | 10 ++--
 sound/soc/intel/boards/ehl_rt5660.c           | 16 ++---
 sound/soc/intel/boards/glk_rt5682_max98357a.c | 32 +++++-----
 sound/soc/intel/boards/hsw_rt5640.c           | 14 ++---
 sound/soc/intel/boards/kbl_da7219_max98357a.c | 28 ++++-----
 sound/soc/intel/boards/kbl_da7219_max98927.c  | 60 +++++++++----------
 sound/soc/intel/boards/kbl_rt5660.c           | 20 +++----
 sound/soc/intel/boards/kbl_rt5663_max98927.c  | 48 +++++++--------
 .../intel/boards/kbl_rt5663_rt5514_max98927.c | 26 ++++----
 sound/soc/intel/boards/skl_hda_dsp_common.c   | 18 +++---
 .../soc/intel/boards/skl_nau88l25_max98357a.c | 28 ++++-----
 sound/soc/intel/boards/skl_nau88l25_ssm4567.c | 30 +++++-----
 sound/soc/intel/boards/skl_rt286.c            | 28 ++++-----
 sound/soc/intel/boards/sof_board_helpers.c    | 18 +++---
 sound/soc/intel/boards/sof_es8336.c           | 10 ++--
 sound/soc/intel/boards/sof_pcm512x.c          |  8 +--
 sound/soc/intel/boards/sof_sdw.c              |  4 +-
 sound/soc/intel/boards/sof_wm8804.c           |  4 +-
 33 files changed, 297 insertions(+), 297 deletions(-)

diff --git a/sound/soc/intel/boards/bdw-rt5650.c b/sound/soc/intel/boards/bdw-rt5650.c
index 3ae26f21458f..7f0544203c1f 100644
--- a/sound/soc/intel/boards/bdw-rt5650.c
+++ b/sound/soc/intel/boards/bdw-rt5650.c
@@ -239,8 +239,8 @@ static struct snd_soc_dai_link bdw_rt5650_dais[] = {
 			SND_SOC_DPCM_TRIGGER_POST,
 			SND_SOC_DPCM_TRIGGER_POST
 		},
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
+		.playback_assertion = 1,
+		.capture_assertion = 1,
 		SND_SOC_DAILINK_REG(fe, dummy, platform),
 	},
 
@@ -256,8 +256,8 @@ static struct snd_soc_dai_link bdw_rt5650_dais[] = {
 		.ignore_pmdown_time = 1,
 		.be_hw_params_fixup = broadwell_ssp0_fixup,
 		.ops = &bdw_rt5650_ops,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
+		.playback_assertion = 1,
+		.capture_assertion = 1,
 		.init = bdw_rt5650_init,
 		SND_SOC_DAILINK_REG(ssp0_port, be, platform),
 	},
diff --git a/sound/soc/intel/boards/bdw-rt5677.c b/sound/soc/intel/boards/bdw-rt5677.c
index 304af3d06d01..54e3c5d3c251 100644
--- a/sound/soc/intel/boards/bdw-rt5677.c
+++ b/sound/soc/intel/boards/bdw-rt5677.c
@@ -329,8 +329,8 @@ static struct snd_soc_dai_link bdw_rt5677_dais[] = {
 			SND_SOC_DPCM_TRIGGER_POST,
 			SND_SOC_DPCM_TRIGGER_POST
 		},
-		.dpcm_capture = 1,
-		.dpcm_playback = 1,
+		.capture_assertion = 1,
+		.playback_assertion = 1,
 		.ops = &bdw_rt5677_fe_ops,
 		SND_SOC_DAILINK_REG(fe, dummy, platform),
 	},
@@ -356,8 +356,8 @@ static struct snd_soc_dai_link bdw_rt5677_dais[] = {
 		.ignore_pmdown_time = 1,
 		.be_hw_params_fixup = broadwell_ssp0_fixup,
 		.ops = &bdw_rt5677_ops,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
+		.playback_assertion = 1,
+		.capture_assertion = 1,
 		.init = bdw_rt5677_init,
 		.exit = bdw_rt5677_exit,
 		SND_SOC_DAILINK_REG(ssp0_port, be, platform),
diff --git a/sound/soc/intel/boards/bdw_rt286.c b/sound/soc/intel/boards/bdw_rt286.c
index 7f20159c23e5..ca2a19fa1c19 100644
--- a/sound/soc/intel/boards/bdw_rt286.c
+++ b/sound/soc/intel/boards/bdw_rt286.c
@@ -133,8 +133,8 @@ static struct snd_soc_dai_link card_dai_links[] = {
 		.nonatomic = 1,
 		.dynamic = 1,
 		.trigger = {SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST},
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
+		.playback_assertion = 1,
+		.capture_assertion = 1,
 		SND_SOC_DAILINK_REG(system, dummy, platform),
 	},
 	{
@@ -143,7 +143,7 @@ static struct snd_soc_dai_link card_dai_links[] = {
 		.nonatomic = 1,
 		.dynamic = 1,
 		.trigger = {SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST},
-		.dpcm_playback = 1,
+		.playback_assertion = 1,
 		SND_SOC_DAILINK_REG(offload0, dummy, platform),
 	},
 	{
@@ -152,7 +152,7 @@ static struct snd_soc_dai_link card_dai_links[] = {
 		.nonatomic = 1,
 		.dynamic = 1,
 		.trigger = {SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST},
-		.dpcm_playback = 1,
+		.playback_assertion = 1,
 		SND_SOC_DAILINK_REG(offload1, dummy, platform),
 	},
 	{
@@ -161,7 +161,7 @@ static struct snd_soc_dai_link card_dai_links[] = {
 		.nonatomic = 1,
 		.dynamic = 1,
 		.trigger = {SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST},
-		.dpcm_capture = 1,
+		.capture_assertion = 1,
 		SND_SOC_DAILINK_REG(loopback, dummy, platform),
 	},
 	/* Back End DAI links */
@@ -177,8 +177,8 @@ static struct snd_soc_dai_link card_dai_links[] = {
 		.ignore_pmdown_time = 1,
 		.be_hw_params_fixup = codec_link_hw_params_fixup,
 		.ops = &codec_link_ops,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
+		.playback_assertion = 1,
+		.capture_assertion = 1,
 		SND_SOC_DAILINK_REG(ssp0_port, codec, platform),
 	},
 };
diff --git a/sound/soc/intel/boards/bxt_da7219_max98357a.c b/sound/soc/intel/boards/bxt_da7219_max98357a.c
index 3fe3f38c6cb6..0efa9d5f0fe1 100644
--- a/sound/soc/intel/boards/bxt_da7219_max98357a.c
+++ b/sound/soc/intel/boards/bxt_da7219_max98357a.c
@@ -504,7 +504,7 @@ static struct snd_soc_dai_link broxton_dais[] = {
 		.init = broxton_da7219_fe_init,
 		.trigger = {
 			SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST},
-		.dpcm_playback = 1,
+		.playback_assertion = 1,
 		.ops = &broxton_da7219_fe_ops,
 		SND_SOC_DAILINK_REG(system, dummy, platform),
 	},
@@ -516,7 +516,7 @@ static struct snd_soc_dai_link broxton_dais[] = {
 		.nonatomic = 1,
 		.trigger = {
 			SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST},
-		.dpcm_capture = 1,
+		.capture_assertion = 1,
 		.ops = &broxton_da7219_fe_ops,
 		SND_SOC_DAILINK_REG(system, dummy, platform),
 	},
@@ -527,7 +527,7 @@ static struct snd_soc_dai_link broxton_dais[] = {
 		.nonatomic = 1,
 		.trigger = {
 			SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST},
-		.dpcm_playback = 1,
+		.playback_assertion = 1,
 		.ops = &broxton_da7219_fe_ops,
 		SND_SOC_DAILINK_REG(system2, dummy, platform),
 	},
@@ -536,7 +536,7 @@ static struct snd_soc_dai_link broxton_dais[] = {
 		.name = "Bxt Audio Reference cap",
 		.stream_name = "Refcap",
 		.init = NULL,
-		.dpcm_capture = 1,
+		.capture_assertion = 1,
 		.nonatomic = 1,
 		.dynamic = 1,
 		.ops = &broxton_refcap_ops,
@@ -547,7 +547,7 @@ static struct snd_soc_dai_link broxton_dais[] = {
 		.name = "Bxt Audio DMIC cap",
 		.stream_name = "dmiccap",
 		.init = NULL,
-		.dpcm_capture = 1,
+		.capture_assertion = 1,
 		.nonatomic = 1,
 		.dynamic = 1,
 		.ops = &broxton_dmic_ops,
@@ -557,7 +557,7 @@ static struct snd_soc_dai_link broxton_dais[] = {
 	{
 		.name = "Bxt HDMI Port1",
 		.stream_name = "Hdmi1",
-		.dpcm_playback = 1,
+		.playback_assertion = 1,
 		.init = NULL,
 		.nonatomic = 1,
 		.dynamic = 1,
@@ -567,7 +567,7 @@ static struct snd_soc_dai_link broxton_dais[] = {
 	{
 		.name = "Bxt HDMI Port2",
 		.stream_name = "Hdmi2",
-		.dpcm_playback = 1,
+		.playback_assertion = 1,
 		.init = NULL,
 		.nonatomic = 1,
 		.dynamic = 1,
@@ -577,7 +577,7 @@ static struct snd_soc_dai_link broxton_dais[] = {
 	{
 		.name = "Bxt HDMI Port3",
 		.stream_name = "Hdmi3",
-		.dpcm_playback = 1,
+		.playback_assertion = 1,
 		.init = NULL,
 		.nonatomic = 1,
 		.dynamic = 1,
@@ -594,7 +594,7 @@ static struct snd_soc_dai_link broxton_dais[] = {
 			SND_SOC_DAIFMT_CBC_CFC,
 		.ignore_pmdown_time = 1,
 		.be_hw_params_fixup = broxton_ssp_fixup,
-		.dpcm_playback = 1,
+		.playback_assertion = 1,
 		SND_SOC_DAILINK_REG(ssp5_pin, ssp5_codec, platform),
 	},
 	{
@@ -607,8 +607,8 @@ static struct snd_soc_dai_link broxton_dais[] = {
 			SND_SOC_DAIFMT_CBC_CFC,
 		.ignore_pmdown_time = 1,
 		.be_hw_params_fixup = broxton_ssp_fixup,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
+		.playback_assertion = 1,
+		.capture_assertion = 1,
 		SND_SOC_DAILINK_REG(ssp1_pin, ssp1_codec, platform),
 	},
 	{
@@ -616,7 +616,7 @@ static struct snd_soc_dai_link broxton_dais[] = {
 		.id = 2,
 		.ignore_suspend = 1,
 		.be_hw_params_fixup = broxton_dmic_fixup,
-		.dpcm_capture = 1,
+		.capture_assertion = 1,
 		.no_pcm = 1,
 		SND_SOC_DAILINK_REG(dmic_pin, dmic_codec, platform),
 	},
@@ -624,7 +624,7 @@ static struct snd_soc_dai_link broxton_dais[] = {
 		.name = "iDisp1",
 		.id = 3,
 		.init = broxton_hdmi_init,
-		.dpcm_playback = 1,
+		.playback_assertion = 1,
 		.no_pcm = 1,
 		SND_SOC_DAILINK_REG(idisp1_pin, idisp1_codec, platform),
 	},
@@ -632,7 +632,7 @@ static struct snd_soc_dai_link broxton_dais[] = {
 		.name = "iDisp2",
 		.id = 4,
 		.init = broxton_hdmi_init,
-		.dpcm_playback = 1,
+		.playback_assertion = 1,
 		.no_pcm = 1,
 		SND_SOC_DAILINK_REG(idisp2_pin, idisp2_codec, platform),
 	},
@@ -640,7 +640,7 @@ static struct snd_soc_dai_link broxton_dais[] = {
 		.name = "iDisp3",
 		.id = 5,
 		.init = broxton_hdmi_init,
-		.dpcm_playback = 1,
+		.playback_assertion = 1,
 		.no_pcm = 1,
 		SND_SOC_DAILINK_REG(idisp3_pin, idisp3_codec, platform),
 	},
@@ -648,7 +648,7 @@ static struct snd_soc_dai_link broxton_dais[] = {
 		.name = "dmic16k",
 		.id = 6,
 		.be_hw_params_fixup = broxton_dmic_fixup,
-		.dpcm_capture = 1,
+		.capture_assertion = 1,
 		.no_pcm = 1,
 		SND_SOC_DAILINK_REG(dmic16k_pin, dmic_codec, platform),
 	},
@@ -838,7 +838,7 @@ static int broxton_audio_probe(struct platform_device *pdev)
 				if (ctx->spkamp == SPKAMP_MAX98390) {
 					broxton_dais[i].codecs = max98390_codec;
 					broxton_dais[i].num_codecs = ARRAY_SIZE(max98390_codec);
-					broxton_dais[i].dpcm_capture = 1;
+					broxton_dais[i].capture_assertion = 1;
 				}
 			}
 			/* DIALOG_CODEC is connected to SSP0 */
diff --git a/sound/soc/intel/boards/bxt_rt298.c b/sound/soc/intel/boards/bxt_rt298.c
index afc499be8db2..af817dd6ad78 100644
--- a/sound/soc/intel/boards/bxt_rt298.c
+++ b/sound/soc/intel/boards/bxt_rt298.c
@@ -394,7 +394,7 @@ static struct snd_soc_dai_link broxton_rt298_dais[] = {
 		.dynamic = 1,
 		.init = broxton_rt298_fe_init,
 		.trigger = {SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST},
-		.dpcm_playback = 1,
+		.playback_assertion = 1,
 		.ops = &broxton_rt286_fe_ops,
 		SND_SOC_DAILINK_REG(system, dummy, platform),
 	},
@@ -405,7 +405,7 @@ static struct snd_soc_dai_link broxton_rt298_dais[] = {
 		.nonatomic = 1,
 		.dynamic = 1,
 		.trigger = {SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST},
-		.dpcm_capture = 1,
+		.capture_assertion = 1,
 		.ops = &broxton_rt286_fe_ops,
 		SND_SOC_DAILINK_REG(system, dummy, platform),
 	},
@@ -414,7 +414,7 @@ static struct snd_soc_dai_link broxton_rt298_dais[] = {
 		.name = "Bxt Audio Reference cap",
 		.stream_name = "refcap",
 		.init = NULL,
-		.dpcm_capture = 1,
+		.capture_assertion = 1,
 		.nonatomic = 1,
 		.dynamic = 1,
 		SND_SOC_DAILINK_REG(reference, dummy, platform),
@@ -424,7 +424,7 @@ static struct snd_soc_dai_link broxton_rt298_dais[] = {
 		.name = "Bxt Audio DMIC cap",
 		.stream_name = "dmiccap",
 		.init = NULL,
-		.dpcm_capture = 1,
+		.capture_assertion = 1,
 		.nonatomic = 1,
 		.dynamic = 1,
 		.ops = &broxton_dmic_ops,
@@ -434,7 +434,7 @@ static struct snd_soc_dai_link broxton_rt298_dais[] = {
 	{
 		.name = "Bxt HDMI Port1",
 		.stream_name = "Hdmi1",
-		.dpcm_playback = 1,
+		.playback_assertion = 1,
 		.init = NULL,
 		.nonatomic = 1,
 		.dynamic = 1,
@@ -444,7 +444,7 @@ static struct snd_soc_dai_link broxton_rt298_dais[] = {
 	{
 		.name = "Bxt HDMI Port2",
 		.stream_name = "Hdmi2",
-		.dpcm_playback = 1,
+		.playback_assertion = 1,
 		.init = NULL,
 		.nonatomic = 1,
 		.dynamic = 1,
@@ -454,7 +454,7 @@ static struct snd_soc_dai_link broxton_rt298_dais[] = {
 	{
 		.name = "Bxt HDMI Port3",
 		.stream_name = "Hdmi3",
-		.dpcm_playback = 1,
+		.playback_assertion = 1,
 		.init = NULL,
 		.nonatomic = 1,
 		.dynamic = 1,
@@ -472,8 +472,8 @@ static struct snd_soc_dai_link broxton_rt298_dais[] = {
 		.ignore_pmdown_time = 1,
 		.be_hw_params_fixup = broxton_ssp5_fixup,
 		.ops = &broxton_rt298_ops,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
+		.playback_assertion = 1,
+		.capture_assertion = 1,
 		SND_SOC_DAILINK_REG(ssp5_pin, ssp5_codec, platform),
 	},
 	{
@@ -481,7 +481,7 @@ static struct snd_soc_dai_link broxton_rt298_dais[] = {
 		.id = 1,
 		.be_hw_params_fixup = broxton_dmic_fixup,
 		.ignore_suspend = 1,
-		.dpcm_capture = 1,
+		.capture_assertion = 1,
 		.no_pcm = 1,
 		SND_SOC_DAILINK_REG(dmic_pin, dmic_codec, platform),
 	},
@@ -490,7 +490,7 @@ static struct snd_soc_dai_link broxton_rt298_dais[] = {
 		.id = 2,
 		.be_hw_params_fixup = broxton_dmic_fixup,
 		.ignore_suspend = 1,
-		.dpcm_capture = 1,
+		.capture_assertion = 1,
 		.no_pcm = 1,
 		SND_SOC_DAILINK_REG(dmic16k, dmic_codec, platform),
 	},
@@ -498,7 +498,7 @@ static struct snd_soc_dai_link broxton_rt298_dais[] = {
 		.name = "iDisp1",
 		.id = 3,
 		.init = broxton_hdmi_init,
-		.dpcm_playback = 1,
+		.playback_assertion = 1,
 		.no_pcm = 1,
 		SND_SOC_DAILINK_REG(idisp1_pin, idisp1_codec, platform),
 	},
@@ -506,7 +506,7 @@ static struct snd_soc_dai_link broxton_rt298_dais[] = {
 		.name = "iDisp2",
 		.id = 4,
 		.init = broxton_hdmi_init,
-		.dpcm_playback = 1,
+		.playback_assertion = 1,
 		.no_pcm = 1,
 		SND_SOC_DAILINK_REG(idisp2_pin, idisp2_codec, platform),
 	},
@@ -514,7 +514,7 @@ static struct snd_soc_dai_link broxton_rt298_dais[] = {
 		.name = "iDisp3",
 		.id = 5,
 		.init = broxton_hdmi_init,
-		.dpcm_playback = 1,
+		.playback_assertion = 1,
 		.no_pcm = 1,
 		SND_SOC_DAILINK_REG(idisp3_pin, idisp3_codec, platform),
 	},
diff --git a/sound/soc/intel/boards/bytcht_cx2072x.c b/sound/soc/intel/boards/bytcht_cx2072x.c
index c014d85a08b2..6f4158772ed6 100644
--- a/sound/soc/intel/boards/bytcht_cx2072x.c
+++ b/sound/soc/intel/boards/bytcht_cx2072x.c
@@ -175,8 +175,8 @@ static struct snd_soc_dai_link byt_cht_cx2072x_dais[] = {
 		.stream_name = "Audio",
 		.nonatomic = true,
 		.dynamic = 1,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
+		.playback_assertion = 1,
+		.capture_assertion = 1,
 		.ops = &byt_cht_cx2072x_aif1_ops,
 		SND_SOC_DAILINK_REG(media, dummy, platform),
 	},
@@ -185,7 +185,7 @@ static struct snd_soc_dai_link byt_cht_cx2072x_dais[] = {
 		.stream_name = "Deep-Buffer Audio",
 		.nonatomic = true,
 		.dynamic = 1,
-		.dpcm_playback = 1,
+		.playback_assertion = 1,
 		.ops = &byt_cht_cx2072x_aif1_ops,
 		SND_SOC_DAILINK_REG(deepbuffer, dummy, platform),
 	},
@@ -198,8 +198,8 @@ static struct snd_soc_dai_link byt_cht_cx2072x_dais[] = {
 					      | SND_SOC_DAIFMT_CBC_CFC,
 		.init = byt_cht_cx2072x_init,
 		.be_hw_params_fixup = byt_cht_cx2072x_fixup,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
+		.playback_assertion = 1,
+		.capture_assertion = 1,
 		SND_SOC_DAILINK_REG(ssp2, cx2072x, platform),
 	},
 };
diff --git a/sound/soc/intel/boards/bytcht_da7213.c b/sound/soc/intel/boards/bytcht_da7213.c
index f4ac3ddd148b..046b191f79e1 100644
--- a/sound/soc/intel/boards/bytcht_da7213.c
+++ b/sound/soc/intel/boards/bytcht_da7213.c
@@ -174,8 +174,8 @@ static struct snd_soc_dai_link dailink[] = {
 		.stream_name = "Audio",
 		.nonatomic = true,
 		.dynamic = 1,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
+		.playback_assertion = 1,
+		.capture_assertion = 1,
 		.ops = &aif1_ops,
 		SND_SOC_DAILINK_REG(media, dummy, platform),
 	},
@@ -184,7 +184,7 @@ static struct snd_soc_dai_link dailink[] = {
 		.stream_name = "Deep-Buffer Audio",
 		.nonatomic = true,
 		.dynamic = 1,
-		.dpcm_playback = 1,
+		.playback_assertion = 1,
 		.ops = &aif1_ops,
 		SND_SOC_DAILINK_REG(deepbuffer, dummy, platform),
 	},
@@ -197,8 +197,8 @@ static struct snd_soc_dai_link dailink[] = {
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
 						| SND_SOC_DAIFMT_CBC_CFC,
 		.be_hw_params_fixup = codec_fixup,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
+		.playback_assertion = 1,
+		.capture_assertion = 1,
 		.ops = &ssp2_ops,
 		SND_SOC_DAILINK_REG(ssp2_port, ssp2_codec, platform),
 	},
diff --git a/sound/soc/intel/boards/bytcht_es8316.c b/sound/soc/intel/boards/bytcht_es8316.c
index 2fcec2e02bb5..d6f65c1a30d9 100644
--- a/sound/soc/intel/boards/bytcht_es8316.c
+++ b/sound/soc/intel/boards/bytcht_es8316.c
@@ -315,8 +315,8 @@ static struct snd_soc_dai_link byt_cht_es8316_dais[] = {
 		.stream_name = "Audio",
 		.nonatomic = true,
 		.dynamic = 1,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
+		.playback_assertion = 1,
+		.capture_assertion = 1,
 		.ops = &byt_cht_es8316_aif1_ops,
 		SND_SOC_DAILINK_REG(media, dummy, platform),
 	},
@@ -326,7 +326,7 @@ static struct snd_soc_dai_link byt_cht_es8316_dais[] = {
 		.stream_name = "Deep-Buffer Audio",
 		.nonatomic = true,
 		.dynamic = 1,
-		.dpcm_playback = 1,
+		.playback_assertion = 1,
 		.ops = &byt_cht_es8316_aif1_ops,
 		SND_SOC_DAILINK_REG(deepbuffer, dummy, platform),
 	},
@@ -339,8 +339,8 @@ static struct snd_soc_dai_link byt_cht_es8316_dais[] = {
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
 						| SND_SOC_DAIFMT_CBC_CFC,
 		.be_hw_params_fixup = byt_cht_es8316_codec_fixup,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
+		.playback_assertion = 1,
+		.capture_assertion = 1,
 		.init = byt_cht_es8316_init,
 		SND_SOC_DAILINK_REG(ssp2_port, ssp2_codec, platform),
 	},
diff --git a/sound/soc/intel/boards/bytcht_nocodec.c b/sound/soc/intel/boards/bytcht_nocodec.c
index 4a957d1cece3..d16468583b03 100644
--- a/sound/soc/intel/boards/bytcht_nocodec.c
+++ b/sound/soc/intel/boards/bytcht_nocodec.c
@@ -119,8 +119,8 @@ static struct snd_soc_dai_link dais[] = {
 		.ignore_suspend = 1,
 		.nonatomic = true,
 		.dynamic = 1,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
+		.playback_assertion = 1,
+		.capture_assertion = 1,
 		.ops = &aif1_ops,
 		SND_SOC_DAILINK_REG(media, dummy, platform),
 	},
@@ -130,7 +130,7 @@ static struct snd_soc_dai_link dais[] = {
 		.ignore_suspend = 1,
 		.nonatomic = true,
 		.dynamic = 1,
-		.dpcm_playback = 1,
+		.playback_assertion = 1,
 		.ops = &aif1_ops,
 		SND_SOC_DAILINK_REG(deepbuffer, dummy, platform),
 	},
@@ -144,8 +144,8 @@ static struct snd_soc_dai_link dais[] = {
 						| SND_SOC_DAIFMT_CBC_CFC,
 		.be_hw_params_fixup = codec_fixup,
 		.ignore_suspend = 1,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
+		.playback_assertion = 1,
+		.capture_assertion = 1,
 		SND_SOC_DAILINK_REG(ssp2_port, dummy, platform),
 	},
 };
diff --git a/sound/soc/intel/boards/bytcr_rt5640.c b/sound/soc/intel/boards/bytcr_rt5640.c
index 05f38d1f7d82..a498375bb536 100644
--- a/sound/soc/intel/boards/bytcr_rt5640.c
+++ b/sound/soc/intel/boards/bytcr_rt5640.c
@@ -1533,8 +1533,8 @@ static struct snd_soc_dai_link byt_rt5640_dais[] = {
 		.stream_name = "Baytrail Audio",
 		.nonatomic = true,
 		.dynamic = 1,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
+		.playback_assertion = 1,
+		.capture_assertion = 1,
 		.ops = &byt_rt5640_aif1_ops,
 		SND_SOC_DAILINK_REG(media, dummy, platform),
 	},
@@ -1543,7 +1543,7 @@ static struct snd_soc_dai_link byt_rt5640_dais[] = {
 		.stream_name = "Deep-Buffer Audio",
 		.nonatomic = true,
 		.dynamic = 1,
-		.dpcm_playback = 1,
+		.playback_assertion = 1,
 		.ops = &byt_rt5640_aif1_ops,
 		SND_SOC_DAILINK_REG(deepbuffer, dummy, platform),
 	},
@@ -1555,8 +1555,8 @@ static struct snd_soc_dai_link byt_rt5640_dais[] = {
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
 						| SND_SOC_DAIFMT_CBC_CFC,
 		.be_hw_params_fixup = byt_rt5640_codec_fixup,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
+		.playback_assertion = 1,
+		.capture_assertion = 1,
 		.init = byt_rt5640_init,
 		.exit = byt_rt5640_exit,
 		.ops = &byt_rt5640_be_ssp2_ops,
diff --git a/sound/soc/intel/boards/bytcr_rt5651.c b/sound/soc/intel/boards/bytcr_rt5651.c
index 80c841b000a3..dc1c0eb29277 100644
--- a/sound/soc/intel/boards/bytcr_rt5651.c
+++ b/sound/soc/intel/boards/bytcr_rt5651.c
@@ -770,8 +770,8 @@ static struct snd_soc_dai_link byt_rt5651_dais[] = {
 		.stream_name = "Audio",
 		.nonatomic = true,
 		.dynamic = 1,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
+		.playback_assertion = 1,
+		.capture_assertion = 1,
 		.ops = &byt_rt5651_aif1_ops,
 		SND_SOC_DAILINK_REG(media, dummy, platform),
 	},
@@ -780,7 +780,7 @@ static struct snd_soc_dai_link byt_rt5651_dais[] = {
 		.stream_name = "Deep-Buffer Audio",
 		.nonatomic = true,
 		.dynamic = 1,
-		.dpcm_playback = 1,
+		.playback_assertion = 1,
 		.ops = &byt_rt5651_aif1_ops,
 		SND_SOC_DAILINK_REG(deepbuffer, dummy, platform),
 	},
@@ -793,8 +793,8 @@ static struct snd_soc_dai_link byt_rt5651_dais[] = {
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
 						| SND_SOC_DAIFMT_CBC_CFC,
 		.be_hw_params_fixup = byt_rt5651_codec_fixup,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
+		.playback_assertion = 1,
+		.capture_assertion = 1,
 		.init = byt_rt5651_init,
 		.ops = &byt_rt5651_be_ssp2_ops,
 		SND_SOC_DAILINK_REG(ssp2_port, ssp2_codec, platform),
diff --git a/sound/soc/intel/boards/bytcr_wm5102.c b/sound/soc/intel/boards/bytcr_wm5102.c
index cccb5e90c0fe..22d31008642a 100644
--- a/sound/soc/intel/boards/bytcr_wm5102.c
+++ b/sound/soc/intel/boards/bytcr_wm5102.c
@@ -462,8 +462,8 @@ static struct snd_soc_dai_link byt_wm5102_dais[] = {
 		.stream_name = "Baytrail Audio",
 		.nonatomic = true,
 		.dynamic = 1,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
+		.playback_assertion = 1,
+		.capture_assertion = 1,
 		.ops = &byt_wm5102_aif1_ops,
 		SND_SOC_DAILINK_REG(media, dummy, platform),
 
@@ -473,7 +473,7 @@ static struct snd_soc_dai_link byt_wm5102_dais[] = {
 		.stream_name = "Deep-Buffer Audio",
 		.nonatomic = true,
 		.dynamic = 1,
-		.dpcm_playback = 1,
+		.playback_assertion = 1,
 		.ops = &byt_wm5102_aif1_ops,
 		SND_SOC_DAILINK_REG(deepbuffer, dummy, platform),
 	},
@@ -490,8 +490,8 @@ static struct snd_soc_dai_link byt_wm5102_dais[] = {
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
 						| SND_SOC_DAIFMT_CBC_CFC,
 		.be_hw_params_fixup = byt_wm5102_codec_fixup,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
+		.playback_assertion = 1,
+		.capture_assertion = 1,
 		.init = byt_wm5102_init,
 		SND_SOC_DAILINK_REG(ssp0_port, ssp0_codec, platform),
 	},
diff --git a/sound/soc/intel/boards/cht_bsw_max98090_ti.c b/sound/soc/intel/boards/cht_bsw_max98090_ti.c
index f43bc20d6aae..cb9b0c19192c 100644
--- a/sound/soc/intel/boards/cht_bsw_max98090_ti.c
+++ b/sound/soc/intel/boards/cht_bsw_max98090_ti.c
@@ -351,8 +351,8 @@ static struct snd_soc_dai_link cht_dailink[] = {
 		.stream_name = "Audio",
 		.nonatomic = true,
 		.dynamic = 1,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
+		.playback_assertion = 1,
+		.capture_assertion = 1,
 		.ops = &cht_aif1_ops,
 		SND_SOC_DAILINK_REG(media, dummy, platform),
 	},
@@ -361,7 +361,7 @@ static struct snd_soc_dai_link cht_dailink[] = {
 		.stream_name = "Deep-Buffer Audio",
 		.nonatomic = true,
 		.dynamic = 1,
-		.dpcm_playback = 1,
+		.playback_assertion = 1,
 		.ops = &cht_aif1_ops,
 		SND_SOC_DAILINK_REG(deepbuffer, dummy, platform),
 	},
@@ -374,8 +374,8 @@ static struct snd_soc_dai_link cht_dailink[] = {
 					| SND_SOC_DAIFMT_CBC_CFC,
 		.init = cht_codec_init,
 		.be_hw_params_fixup = cht_codec_fixup,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
+		.playback_assertion = 1,
+		.capture_assertion = 1,
 		.ops = &cht_be_ssp2_ops,
 		SND_SOC_DAILINK_REG(ssp2_port, ssp2_codec, platform),
 	},
diff --git a/sound/soc/intel/boards/cht_bsw_nau8824.c b/sound/soc/intel/boards/cht_bsw_nau8824.c
index 7651b83632fa..b6c2851afd29 100644
--- a/sound/soc/intel/boards/cht_bsw_nau8824.c
+++ b/sound/soc/intel/boards/cht_bsw_nau8824.c
@@ -193,8 +193,8 @@ static struct snd_soc_dai_link cht_dailink[] = {
 		.stream_name = "Audio",
 		.nonatomic = true,
 		.dynamic = 1,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
+		.playback_assertion = 1,
+		.capture_assertion = 1,
 		.ops = &cht_aif1_ops,
 		SND_SOC_DAILINK_REG(media, dummy, platform),
 	},
@@ -203,7 +203,7 @@ static struct snd_soc_dai_link cht_dailink[] = {
 		.stream_name = "Deep-Buffer Audio",
 		.nonatomic = true,
 		.dynamic = 1,
-		.dpcm_playback = 1,
+		.playback_assertion = 1,
 		.ops = &cht_aif1_ops,
 		SND_SOC_DAILINK_REG(deepbuffer, dummy, platform),
 	},
@@ -217,8 +217,8 @@ static struct snd_soc_dai_link cht_dailink[] = {
 			| SND_SOC_DAIFMT_CBC_CFC,
 		.init = cht_codec_init,
 		.be_hw_params_fixup = cht_codec_fixup,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
+		.playback_assertion = 1,
+		.capture_assertion = 1,
 		.ops = &cht_be_ssp2_ops,
 		SND_SOC_DAILINK_REG(ssp2_port, ssp2_codec, platform),
 	},
diff --git a/sound/soc/intel/boards/cht_bsw_rt5645.c b/sound/soc/intel/boards/cht_bsw_rt5645.c
index eb41b7115d01..d6af19e77d6f 100644
--- a/sound/soc/intel/boards/cht_bsw_rt5645.c
+++ b/sound/soc/intel/boards/cht_bsw_rt5645.c
@@ -448,8 +448,8 @@ static struct snd_soc_dai_link cht_dailink[] = {
 		.stream_name = "Audio",
 		.nonatomic = true,
 		.dynamic = 1,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
+		.playback_assertion = 1,
+		.capture_assertion = 1,
 		.ops = &cht_aif1_ops,
 		SND_SOC_DAILINK_REG(media, dummy, platform),
 	},
@@ -458,7 +458,7 @@ static struct snd_soc_dai_link cht_dailink[] = {
 		.stream_name = "Deep-Buffer Audio",
 		.nonatomic = true,
 		.dynamic = 1,
-		.dpcm_playback = 1,
+		.playback_assertion = 1,
 		.ops = &cht_aif1_ops,
 		SND_SOC_DAILINK_REG(deepbuffer, dummy, platform),
 	},
@@ -470,8 +470,8 @@ static struct snd_soc_dai_link cht_dailink[] = {
 		.no_pcm = 1,
 		.init = cht_codec_init,
 		.be_hw_params_fixup = cht_codec_fixup,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
+		.playback_assertion = 1,
+		.capture_assertion = 1,
 		.ops = &cht_be_ssp2_ops,
 		SND_SOC_DAILINK_REG(ssp2_port, ssp2_codec, platform),
 	},
diff --git a/sound/soc/intel/boards/cht_bsw_rt5672.c b/sound/soc/intel/boards/cht_bsw_rt5672.c
index be2d1a8dbca8..fd2430405f10 100644
--- a/sound/soc/intel/boards/cht_bsw_rt5672.c
+++ b/sound/soc/intel/boards/cht_bsw_rt5672.c
@@ -358,8 +358,8 @@ static struct snd_soc_dai_link cht_dailink[] = {
 		.stream_name = "Audio",
 		.nonatomic = true,
 		.dynamic = 1,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
+		.playback_assertion = 1,
+		.capture_assertion = 1,
 		.ops = &cht_aif1_ops,
 		SND_SOC_DAILINK_REG(media, dummy, platform),
 	},
@@ -368,7 +368,7 @@ static struct snd_soc_dai_link cht_dailink[] = {
 		.stream_name = "Deep-Buffer Audio",
 		.nonatomic = true,
 		.dynamic = 1,
-		.dpcm_playback = 1,
+		.playback_assertion = 1,
 		.ops = &cht_aif1_ops,
 		SND_SOC_DAILINK_REG(deepbuffer, dummy, platform),
 	},
@@ -381,8 +381,8 @@ static struct snd_soc_dai_link cht_dailink[] = {
 		.no_pcm = 1,
 		.init = cht_codec_init,
 		.be_hw_params_fixup = cht_codec_fixup,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
+		.playback_assertion = 1,
+		.capture_assertion = 1,
 		.ops = &cht_be_ssp2_ops,
 		SND_SOC_DAILINK_REG(ssp2_port, ssp2_codec, platform),
 	},
diff --git a/sound/soc/intel/boards/ehl_rt5660.c b/sound/soc/intel/boards/ehl_rt5660.c
index 686e60321224..651c7cc26f20 100644
--- a/sound/soc/intel/boards/ehl_rt5660.c
+++ b/sound/soc/intel/boards/ehl_rt5660.c
@@ -178,8 +178,8 @@ static struct snd_soc_dai_link ehl_rt5660_dailink[] = {
 		.name = "SSP0-Codec",
 		.id = 0,
 		.no_pcm = 1,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
+		.playback_assertion = 1,
+		.capture_assertion = 1,
 		.ops = &rt5660_ops,
 		SND_SOC_DAILINK_REG(ssp0_pin, rt5660_codec, platform),
 	},
@@ -187,7 +187,7 @@ static struct snd_soc_dai_link ehl_rt5660_dailink[] = {
 		.name = "dmic48k",
 		.id = 1,
 		.ignore_suspend = 1,
-		.dpcm_capture = 1,
+		.capture_assertion = 1,
 		.no_pcm = 1,
 		SND_SOC_DAILINK_REG(dmic_pin, dmic_codec, platform),
 	},
@@ -195,7 +195,7 @@ static struct snd_soc_dai_link ehl_rt5660_dailink[] = {
 		.name = "dmic16k",
 		.id = 2,
 		.ignore_suspend = 1,
-		.dpcm_capture = 1,
+		.capture_assertion = 1,
 		.no_pcm = 1,
 		SND_SOC_DAILINK_REG(dmic16k, dmic_codec, platform),
 	},
@@ -203,7 +203,7 @@ static struct snd_soc_dai_link ehl_rt5660_dailink[] = {
 		.name = "iDisp1",
 		.id = 5,
 		.init = hdmi_init,
-		.dpcm_playback = 1,
+		.playback_assertion = 1,
 		.no_pcm = 1,
 		SND_SOC_DAILINK_REG(idisp1_pin, idisp1_codec, platform),
 	},
@@ -211,7 +211,7 @@ static struct snd_soc_dai_link ehl_rt5660_dailink[] = {
 		.name = "iDisp2",
 		.id = 6,
 		.init = hdmi_init,
-		.dpcm_playback = 1,
+		.playback_assertion = 1,
 		.no_pcm = 1,
 		SND_SOC_DAILINK_REG(idisp2_pin, idisp2_codec, platform),
 	},
@@ -219,7 +219,7 @@ static struct snd_soc_dai_link ehl_rt5660_dailink[] = {
 		.name = "iDisp3",
 		.id = 7,
 		.init = hdmi_init,
-		.dpcm_playback = 1,
+		.playback_assertion = 1,
 		.no_pcm = 1,
 		SND_SOC_DAILINK_REG(idisp3_pin, idisp3_codec, platform),
 	},
@@ -227,7 +227,7 @@ static struct snd_soc_dai_link ehl_rt5660_dailink[] = {
 		.name = "iDisp4",
 		.id = 8,
 		.init = hdmi_init,
-		.dpcm_playback = 1,
+		.playback_assertion = 1,
 		.no_pcm = 1,
 		SND_SOC_DAILINK_REG(idisp4_pin, idisp4_codec, platform),
 	},
diff --git a/sound/soc/intel/boards/glk_rt5682_max98357a.c b/sound/soc/intel/boards/glk_rt5682_max98357a.c
index 4098b2d32f9b..b5b01fee719a 100644
--- a/sound/soc/intel/boards/glk_rt5682_max98357a.c
+++ b/sound/soc/intel/boards/glk_rt5682_max98357a.c
@@ -413,7 +413,7 @@ static struct snd_soc_dai_link geminilake_dais[] = {
 		.init = geminilake_rt5682_fe_init,
 		.trigger = {
 			SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST},
-		.dpcm_playback = 1,
+		.playback_assertion = 1,
 		SND_SOC_DAILINK_REG(system, dummy, platform),
 	},
 	[GLK_DPCM_AUDIO_CP] = {
@@ -423,13 +423,13 @@ static struct snd_soc_dai_link geminilake_dais[] = {
 		.nonatomic = 1,
 		.trigger = {
 			SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST},
-		.dpcm_capture = 1,
+		.capture_assertion = 1,
 		SND_SOC_DAILINK_REG(system, dummy, platform),
 	},
 	[GLK_DPCM_AUDIO_HS_PB] = {
 		.name = "Glk Audio Headset Playback",
 		.stream_name = "Headset Audio",
-		.dpcm_playback = 1,
+		.playback_assertion = 1,
 		.nonatomic = 1,
 		.dynamic = 1,
 		SND_SOC_DAILINK_REG(system2, dummy, platform),
@@ -438,7 +438,7 @@ static struct snd_soc_dai_link geminilake_dais[] = {
 		.name = "Glk Audio Echo Reference cap",
 		.stream_name = "Echoreference Capture",
 		.init = NULL,
-		.dpcm_capture = 1,
+		.capture_assertion = 1,
 		.nonatomic = 1,
 		.dynamic = 1,
 		SND_SOC_DAILINK_REG(echoref, dummy, platform),
@@ -447,7 +447,7 @@ static struct snd_soc_dai_link geminilake_dais[] = {
 		.name = "Glk Audio Reference cap",
 		.stream_name = "Refcap",
 		.init = NULL,
-		.dpcm_capture = 1,
+		.capture_assertion = 1,
 		.nonatomic = 1,
 		.dynamic = 1,
 		.ops = &geminilake_refcap_ops,
@@ -457,7 +457,7 @@ static struct snd_soc_dai_link geminilake_dais[] = {
 		.name = "Glk Audio DMIC cap",
 		.stream_name = "dmiccap",
 		.init = NULL,
-		.dpcm_capture = 1,
+		.capture_assertion = 1,
 		.nonatomic = 1,
 		.dynamic = 1,
 		.ops = &geminilake_dmic_ops,
@@ -466,7 +466,7 @@ static struct snd_soc_dai_link geminilake_dais[] = {
 	[GLK_DPCM_AUDIO_HDMI1_PB] = {
 		.name = "Glk HDMI Port1",
 		.stream_name = "Hdmi1",
-		.dpcm_playback = 1,
+		.playback_assertion = 1,
 		.init = NULL,
 		.trigger = {
 			SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST},
@@ -477,7 +477,7 @@ static struct snd_soc_dai_link geminilake_dais[] = {
 	[GLK_DPCM_AUDIO_HDMI2_PB] =	{
 		.name = "Glk HDMI Port2",
 		.stream_name = "Hdmi2",
-		.dpcm_playback = 1,
+		.playback_assertion = 1,
 		.init = NULL,
 		.trigger = {
 			SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST},
@@ -490,7 +490,7 @@ static struct snd_soc_dai_link geminilake_dais[] = {
 		.stream_name = "Hdmi3",
 		.trigger = {
 			SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST},
-		.dpcm_playback = 1,
+		.playback_assertion = 1,
 		.init = NULL,
 		.nonatomic = 1,
 		.dynamic = 1,
@@ -507,7 +507,7 @@ static struct snd_soc_dai_link geminilake_dais[] = {
 			SND_SOC_DAIFMT_CBC_CFC,
 		.ignore_pmdown_time = 1,
 		.be_hw_params_fixup = geminilake_ssp_fixup,
-		.dpcm_playback = 1,
+		.playback_assertion = 1,
 		SND_SOC_DAILINK_REG(ssp1_pin, ssp1_codec, platform),
 	},
 	{
@@ -521,8 +521,8 @@ static struct snd_soc_dai_link geminilake_dais[] = {
 		.ignore_pmdown_time = 1,
 		.be_hw_params_fixup = geminilake_ssp_fixup,
 		.ops = &geminilake_rt5682_ops,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
+		.playback_assertion = 1,
+		.capture_assertion = 1,
 		SND_SOC_DAILINK_REG(ssp2_pin, ssp2_codec_5682, platform),
 	},
 	{
@@ -530,7 +530,7 @@ static struct snd_soc_dai_link geminilake_dais[] = {
 		.id = 2,
 		.ignore_suspend = 1,
 		.be_hw_params_fixup = geminilake_dmic_fixup,
-		.dpcm_capture = 1,
+		.capture_assertion = 1,
 		.no_pcm = 1,
 		SND_SOC_DAILINK_REG(dmic_pin, dmic_codec, platform),
 	},
@@ -538,7 +538,7 @@ static struct snd_soc_dai_link geminilake_dais[] = {
 		.name = "iDisp1",
 		.id = 3,
 		.init = geminilake_hdmi_init,
-		.dpcm_playback = 1,
+		.playback_assertion = 1,
 		.no_pcm = 1,
 		SND_SOC_DAILINK_REG(idisp1_pin, idisp1_codec, platform),
 	},
@@ -546,7 +546,7 @@ static struct snd_soc_dai_link geminilake_dais[] = {
 		.name = "iDisp2",
 		.id = 4,
 		.init = geminilake_hdmi_init,
-		.dpcm_playback = 1,
+		.playback_assertion = 1,
 		.no_pcm = 1,
 		SND_SOC_DAILINK_REG(idisp2_pin, idisp2_codec, platform),
 	},
@@ -554,7 +554,7 @@ static struct snd_soc_dai_link geminilake_dais[] = {
 		.name = "iDisp3",
 		.id = 5,
 		.init = geminilake_hdmi_init,
-		.dpcm_playback = 1,
+		.playback_assertion = 1,
 		.no_pcm = 1,
 		SND_SOC_DAILINK_REG(idisp3_pin, idisp3_codec, platform),
 	},
diff --git a/sound/soc/intel/boards/hsw_rt5640.c b/sound/soc/intel/boards/hsw_rt5640.c
index 2a2fe27dff0e..930c09205516 100644
--- a/sound/soc/intel/boards/hsw_rt5640.c
+++ b/sound/soc/intel/boards/hsw_rt5640.c
@@ -85,8 +85,8 @@ static struct snd_soc_dai_link card_dai_links[] = {
 		.nonatomic = 1,
 		.dynamic = 1,
 		.trigger = {SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST},
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
+		.playback_assertion = 1,
+		.capture_assertion = 1,
 		SND_SOC_DAILINK_REG(system, dummy, platform),
 	},
 	{
@@ -95,7 +95,7 @@ static struct snd_soc_dai_link card_dai_links[] = {
 		.nonatomic = 1,
 		.dynamic = 1,
 		.trigger = {SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST},
-		.dpcm_playback = 1,
+		.playback_assertion = 1,
 		SND_SOC_DAILINK_REG(offload0, dummy, platform),
 	},
 	{
@@ -104,7 +104,7 @@ static struct snd_soc_dai_link card_dai_links[] = {
 		.nonatomic = 1,
 		.dynamic = 1,
 		.trigger = {SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST},
-		.dpcm_playback = 1,
+		.playback_assertion = 1,
 		SND_SOC_DAILINK_REG(offload1, dummy, platform),
 	},
 	{
@@ -113,7 +113,7 @@ static struct snd_soc_dai_link card_dai_links[] = {
 		.nonatomic = 1,
 		.dynamic = 1,
 		.trigger = {SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST},
-		.dpcm_capture = 1,
+		.capture_assertion = 1,
 		SND_SOC_DAILINK_REG(loopback, dummy, platform),
 	},
 	/* Back End DAI links */
@@ -127,8 +127,8 @@ static struct snd_soc_dai_link card_dai_links[] = {
 		.ignore_pmdown_time = 1,
 		.be_hw_params_fixup = codec_link_hw_params_fixup,
 		.ops = &codec_link_ops,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
+		.playback_assertion = 1,
+		.capture_assertion = 1,
 		SND_SOC_DAILINK_REG(ssp0_port, codec, platform),
 	},
 };
diff --git a/sound/soc/intel/boards/kbl_da7219_max98357a.c b/sound/soc/intel/boards/kbl_da7219_max98357a.c
index 9dbc15f9d1c9..ac5abde7f6fa 100644
--- a/sound/soc/intel/boards/kbl_da7219_max98357a.c
+++ b/sound/soc/intel/boards/kbl_da7219_max98357a.c
@@ -460,7 +460,7 @@ static struct snd_soc_dai_link kabylake_dais[] = {
 		.init = kabylake_da7219_fe_init,
 		.trigger = {
 			SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST},
-		.dpcm_playback = 1,
+		.playback_assertion = 1,
 		.ops = &kabylake_da7219_fe_ops,
 		SND_SOC_DAILINK_REG(system, dummy, platform),
 	},
@@ -471,7 +471,7 @@ static struct snd_soc_dai_link kabylake_dais[] = {
 		.nonatomic = 1,
 		.trigger = {
 			SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST},
-		.dpcm_capture = 1,
+		.capture_assertion = 1,
 		.ops = &kabylake_da7219_fe_ops,
 		SND_SOC_DAILINK_REG(system, dummy, platform),
 	},
@@ -479,7 +479,7 @@ static struct snd_soc_dai_link kabylake_dais[] = {
 		.name = "Kbl Audio Reference cap",
 		.stream_name = "Wake on Voice",
 		.init = NULL,
-		.dpcm_capture = 1,
+		.capture_assertion = 1,
 		.nonatomic = 1,
 		.dynamic = 1,
 		.ops = &skylake_refcap_ops,
@@ -489,7 +489,7 @@ static struct snd_soc_dai_link kabylake_dais[] = {
 		.name = "Kbl Audio DMIC cap",
 		.stream_name = "dmiccap",
 		.init = NULL,
-		.dpcm_capture = 1,
+		.capture_assertion = 1,
 		.nonatomic = 1,
 		.dynamic = 1,
 		.ops = &kabylake_dmic_ops,
@@ -498,7 +498,7 @@ static struct snd_soc_dai_link kabylake_dais[] = {
 	[KBL_DPCM_AUDIO_HDMI1_PB] = {
 		.name = "Kbl HDMI Port1",
 		.stream_name = "Hdmi1",
-		.dpcm_playback = 1,
+		.playback_assertion = 1,
 		.init = NULL,
 		.trigger = {
 			SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST},
@@ -509,7 +509,7 @@ static struct snd_soc_dai_link kabylake_dais[] = {
 	[KBL_DPCM_AUDIO_HDMI2_PB] = {
 		.name = "Kbl HDMI Port2",
 		.stream_name = "Hdmi2",
-		.dpcm_playback = 1,
+		.playback_assertion = 1,
 		.init = NULL,
 		.trigger = {
 			SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST},
@@ -522,7 +522,7 @@ static struct snd_soc_dai_link kabylake_dais[] = {
 		.stream_name = "Hdmi3",
 		.trigger = {
 			SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST},
-		.dpcm_playback = 1,
+		.playback_assertion = 1,
 		.init = NULL,
 		.nonatomic = 1,
 		.dynamic = 1,
@@ -540,7 +540,7 @@ static struct snd_soc_dai_link kabylake_dais[] = {
 			SND_SOC_DAIFMT_CBC_CFC,
 		.ignore_pmdown_time = 1,
 		.be_hw_params_fixup = kabylake_ssp_fixup,
-		.dpcm_playback = 1,
+		.playback_assertion = 1,
 		SND_SOC_DAILINK_REG(ssp0_pin, ssp0_codec, platform),
 	},
 	{
@@ -553,8 +553,8 @@ static struct snd_soc_dai_link kabylake_dais[] = {
 			SND_SOC_DAIFMT_CBC_CFC,
 		.ignore_pmdown_time = 1,
 		.be_hw_params_fixup = kabylake_ssp_fixup,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
+		.playback_assertion = 1,
+		.capture_assertion = 1,
 		SND_SOC_DAILINK_REG(ssp1_pin, ssp1_codec, platform),
 	},
 	{
@@ -562,14 +562,14 @@ static struct snd_soc_dai_link kabylake_dais[] = {
 		.id = 2,
 		.be_hw_params_fixup = kabylake_dmic_fixup,
 		.ignore_suspend = 1,
-		.dpcm_capture = 1,
+		.capture_assertion = 1,
 		.no_pcm = 1,
 		SND_SOC_DAILINK_REG(dmic_pin, dmic_codec, platform),
 	},
 	{
 		.name = "iDisp1",
 		.id = 3,
-		.dpcm_playback = 1,
+		.playback_assertion = 1,
 		.init = kabylake_hdmi1_init,
 		.no_pcm = 1,
 		SND_SOC_DAILINK_REG(idisp1_pin, idisp1_codec, platform),
@@ -578,7 +578,7 @@ static struct snd_soc_dai_link kabylake_dais[] = {
 		.name = "iDisp2",
 		.id = 4,
 		.init = kabylake_hdmi2_init,
-		.dpcm_playback = 1,
+		.playback_assertion = 1,
 		.no_pcm = 1,
 		SND_SOC_DAILINK_REG(idisp2_pin, idisp2_codec, platform),
 	},
@@ -586,7 +586,7 @@ static struct snd_soc_dai_link kabylake_dais[] = {
 		.name = "iDisp3",
 		.id = 5,
 		.init = kabylake_hdmi3_init,
-		.dpcm_playback = 1,
+		.playback_assertion = 1,
 		.no_pcm = 1,
 		SND_SOC_DAILINK_REG(idisp3_pin, idisp3_codec, platform),
 	},
diff --git a/sound/soc/intel/boards/kbl_da7219_max98927.c b/sound/soc/intel/boards/kbl_da7219_max98927.c
index e662da5af83b..42c4ad52d181 100644
--- a/sound/soc/intel/boards/kbl_da7219_max98927.c
+++ b/sound/soc/intel/boards/kbl_da7219_max98927.c
@@ -686,7 +686,7 @@ static struct snd_soc_dai_link kabylake_dais[] = {
 		.init = kabylake_da7219_fe_init,
 		.trigger = {
 			SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST},
-		.dpcm_playback = 1,
+		.playback_assertion = 1,
 		.ops = &kabylake_da7219_fe_ops,
 		SND_SOC_DAILINK_REG(system, dummy, platform),
 	},
@@ -694,7 +694,7 @@ static struct snd_soc_dai_link kabylake_dais[] = {
 		.name = "Kbl Audio Echo Reference cap",
 		.stream_name = "Echoreference Capture",
 		.init = NULL,
-		.dpcm_capture = 1,
+		.capture_assertion = 1,
 		.nonatomic = 1,
 		SND_SOC_DAILINK_REG(echoref, dummy, platform),
 	},
@@ -702,7 +702,7 @@ static struct snd_soc_dai_link kabylake_dais[] = {
 		.name = "Kbl Audio Reference cap",
 		.stream_name = "Wake on Voice",
 		.init = NULL,
-		.dpcm_capture = 1,
+		.capture_assertion = 1,
 		.nonatomic = 1,
 		.dynamic = 1,
 		.ops = &skylake_refcap_ops,
@@ -712,7 +712,7 @@ static struct snd_soc_dai_link kabylake_dais[] = {
 		.name = "Kbl Audio DMIC cap",
 		.stream_name = "dmiccap",
 		.init = NULL,
-		.dpcm_capture = 1,
+		.capture_assertion = 1,
 		.nonatomic = 1,
 		.dynamic = 1,
 		.ops = &kabylake_dmic_ops,
@@ -721,7 +721,7 @@ static struct snd_soc_dai_link kabylake_dais[] = {
 	[KBL_DPCM_AUDIO_HDMI1_PB] = {
 		.name = "Kbl HDMI Port1",
 		.stream_name = "Hdmi1",
-		.dpcm_playback = 1,
+		.playback_assertion = 1,
 		.init = NULL,
 		.trigger = {
 			SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST},
@@ -732,7 +732,7 @@ static struct snd_soc_dai_link kabylake_dais[] = {
 	[KBL_DPCM_AUDIO_HDMI2_PB] = {
 		.name = "Kbl HDMI Port2",
 		.stream_name = "Hdmi2",
-		.dpcm_playback = 1,
+		.playback_assertion = 1,
 		.init = NULL,
 		.trigger = {
 			SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST},
@@ -745,7 +745,7 @@ static struct snd_soc_dai_link kabylake_dais[] = {
 		.stream_name = "Hdmi3",
 		.trigger = {
 			SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST},
-		.dpcm_playback = 1,
+		.playback_assertion = 1,
 		.init = NULL,
 		.nonatomic = 1,
 		.dynamic = 1,
@@ -754,7 +754,7 @@ static struct snd_soc_dai_link kabylake_dais[] = {
 	[KBL_DPCM_AUDIO_HS_PB] = {
 		.name = "Kbl Audio Headset Playback",
 		.stream_name = "Headset Audio",
-		.dpcm_playback = 1,
+		.playback_assertion = 1,
 		.nonatomic = 1,
 		.dynamic = 1,
 		.init = kabylake_da7219_fe_init,
@@ -770,7 +770,7 @@ static struct snd_soc_dai_link kabylake_dais[] = {
 		.nonatomic = 1,
 		.trigger = {
 			SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST},
-		.dpcm_capture = 1,
+		.capture_assertion = 1,
 		.ops = &kabylake_da7219_fe_ops,
 		SND_SOC_DAILINK_REG(system, dummy, platform),
 	},
@@ -784,8 +784,8 @@ static struct snd_soc_dai_link kabylake_dais[] = {
 		.dai_fmt = SND_SOC_DAIFMT_DSP_B |
 			SND_SOC_DAIFMT_NB_NF |
 			SND_SOC_DAIFMT_CBC_CFC,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
+		.playback_assertion = 1,
+		.capture_assertion = 1,
 		.ignore_pmdown_time = 1,
 		.be_hw_params_fixup = kabylake_ssp_fixup,
 		.ops = &kabylake_ssp0_ops,
@@ -801,8 +801,8 @@ static struct snd_soc_dai_link kabylake_dais[] = {
 			SND_SOC_DAIFMT_CBC_CFC,
 		.ignore_pmdown_time = 1,
 		.be_hw_params_fixup = kabylake_ssp_fixup,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
+		.playback_assertion = 1,
+		.capture_assertion = 1,
 		SND_SOC_DAILINK_REG(ssp1_pin, ssp1_codec, platform),
 	},
 	{
@@ -811,14 +811,14 @@ static struct snd_soc_dai_link kabylake_dais[] = {
 		.init = kabylake_dmic_init,
 		.be_hw_params_fixup = kabylake_dmic_fixup,
 		.ignore_suspend = 1,
-		.dpcm_capture = 1,
+		.capture_assertion = 1,
 		.no_pcm = 1,
 		SND_SOC_DAILINK_REG(dmic_pin, dmic_codec, platform),
 	},
 	{
 		.name = "iDisp1",
 		.id = 3,
-		.dpcm_playback = 1,
+		.playback_assertion = 1,
 		.init = kabylake_hdmi1_init,
 		.no_pcm = 1,
 		SND_SOC_DAILINK_REG(idisp1_pin, idisp1_codec, platform),
@@ -827,7 +827,7 @@ static struct snd_soc_dai_link kabylake_dais[] = {
 		.name = "iDisp2",
 		.id = 4,
 		.init = kabylake_hdmi2_init,
-		.dpcm_playback = 1,
+		.playback_assertion = 1,
 		.no_pcm = 1,
 		SND_SOC_DAILINK_REG(idisp2_pin, idisp2_codec, platform),
 	},
@@ -835,7 +835,7 @@ static struct snd_soc_dai_link kabylake_dais[] = {
 		.name = "iDisp3",
 		.id = 5,
 		.init = kabylake_hdmi3_init,
-		.dpcm_playback = 1,
+		.playback_assertion = 1,
 		.no_pcm = 1,
 		SND_SOC_DAILINK_REG(idisp3_pin, idisp3_codec, platform),
 	},
@@ -852,7 +852,7 @@ static struct snd_soc_dai_link kabylake_max98_927_373_dais[] = {
 		.init = kabylake_da7219_fe_init,
 		.trigger = {
 			SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST},
-		.dpcm_playback = 1,
+		.playback_assertion = 1,
 		.ops = &kabylake_da7219_fe_ops,
 		SND_SOC_DAILINK_REG(system, dummy, platform),
 	},
@@ -860,7 +860,7 @@ static struct snd_soc_dai_link kabylake_max98_927_373_dais[] = {
 		.name = "Kbl Audio Echo Reference cap",
 		.stream_name = "Echoreference Capture",
 		.init = NULL,
-		.dpcm_capture = 1,
+		.capture_assertion = 1,
 		.nonatomic = 1,
 		SND_SOC_DAILINK_REG(echoref, dummy, platform),
 	},
@@ -868,7 +868,7 @@ static struct snd_soc_dai_link kabylake_max98_927_373_dais[] = {
 		.name = "Kbl Audio Reference cap",
 		.stream_name = "Wake on Voice",
 		.init = NULL,
-		.dpcm_capture = 1,
+		.capture_assertion = 1,
 		.nonatomic = 1,
 		.dynamic = 1,
 		.ops = &skylake_refcap_ops,
@@ -878,7 +878,7 @@ static struct snd_soc_dai_link kabylake_max98_927_373_dais[] = {
 		.name = "Kbl Audio DMIC cap",
 		.stream_name = "dmiccap",
 		.init = NULL,
-		.dpcm_capture = 1,
+		.capture_assertion = 1,
 		.nonatomic = 1,
 		.dynamic = 1,
 		.ops = &kabylake_dmic_ops,
@@ -887,7 +887,7 @@ static struct snd_soc_dai_link kabylake_max98_927_373_dais[] = {
 	[KBL_DPCM_AUDIO_HDMI1_PB] = {
 		.name = "Kbl HDMI Port1",
 		.stream_name = "Hdmi1",
-		.dpcm_playback = 1,
+		.playback_assertion = 1,
 		.init = NULL,
 		.trigger = {
 			SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST},
@@ -898,7 +898,7 @@ static struct snd_soc_dai_link kabylake_max98_927_373_dais[] = {
 	[KBL_DPCM_AUDIO_HDMI2_PB] = {
 		.name = "Kbl HDMI Port2",
 		.stream_name = "Hdmi2",
-		.dpcm_playback = 1,
+		.playback_assertion = 1,
 		.init = NULL,
 		.trigger = {
 			SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST},
@@ -911,7 +911,7 @@ static struct snd_soc_dai_link kabylake_max98_927_373_dais[] = {
 		.stream_name = "Hdmi3",
 		.trigger = {
 			SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST},
-		.dpcm_playback = 1,
+		.playback_assertion = 1,
 		.init = NULL,
 		.nonatomic = 1,
 		.dynamic = 1,
@@ -927,8 +927,8 @@ static struct snd_soc_dai_link kabylake_max98_927_373_dais[] = {
 		.dai_fmt = SND_SOC_DAIFMT_DSP_B |
 			SND_SOC_DAIFMT_NB_NF |
 			SND_SOC_DAIFMT_CBC_CFC,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
+		.playback_assertion = 1,
+		.capture_assertion = 1,
 		.ignore_pmdown_time = 1,
 		.be_hw_params_fixup = kabylake_ssp_fixup,
 		.ops = &kabylake_ssp0_ops,
@@ -940,14 +940,14 @@ static struct snd_soc_dai_link kabylake_max98_927_373_dais[] = {
 		.init = kabylake_dmic_init,
 		.be_hw_params_fixup = kabylake_dmic_fixup,
 		.ignore_suspend = 1,
-		.dpcm_capture = 1,
+		.capture_assertion = 1,
 		.no_pcm = 1,
 		SND_SOC_DAILINK_REG(dmic_pin, dmic_codec, platform),
 	},
 	{
 		.name = "iDisp1",
 		.id = 2,
-		.dpcm_playback = 1,
+		.playback_assertion = 1,
 		.init = kabylake_hdmi1_init,
 		.no_pcm = 1,
 		SND_SOC_DAILINK_REG(idisp1_pin, idisp1_codec, platform),
@@ -956,7 +956,7 @@ static struct snd_soc_dai_link kabylake_max98_927_373_dais[] = {
 		.name = "iDisp2",
 		.id = 3,
 		.init = kabylake_hdmi2_init,
-		.dpcm_playback = 1,
+		.playback_assertion = 1,
 		.no_pcm = 1,
 		SND_SOC_DAILINK_REG(idisp2_pin, idisp2_codec, platform),
 	},
@@ -964,7 +964,7 @@ static struct snd_soc_dai_link kabylake_max98_927_373_dais[] = {
 		.name = "iDisp3",
 		.id = 4,
 		.init = kabylake_hdmi3_init,
-		.dpcm_playback = 1,
+		.playback_assertion = 1,
 		.no_pcm = 1,
 		SND_SOC_DAILINK_REG(idisp3_pin, idisp3_codec, platform),
 	},
diff --git a/sound/soc/intel/boards/kbl_rt5660.c b/sound/soc/intel/boards/kbl_rt5660.c
index 894d127c482a..ae1259c0fc2c 100644
--- a/sound/soc/intel/boards/kbl_rt5660.c
+++ b/sound/soc/intel/boards/kbl_rt5660.c
@@ -377,7 +377,7 @@ static struct snd_soc_dai_link kabylake_rt5660_dais[] = {
 		.nonatomic = 1,
 		.trigger = {
 			SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST},
-		.dpcm_playback = 1,
+		.playback_assertion = 1,
 		.ops = &kabylake_rt5660_fe_ops,
 		SND_SOC_DAILINK_REG(system, dummy, platform),
 	},
@@ -388,14 +388,14 @@ static struct snd_soc_dai_link kabylake_rt5660_dais[] = {
 		.nonatomic = 1,
 		.trigger = {
 			SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST},
-		.dpcm_capture = 1,
+		.capture_assertion = 1,
 		.ops = &kabylake_rt5660_fe_ops,
 		SND_SOC_DAILINK_REG(system, dummy, platform),
 	},
 	[KBL_DPCM_AUDIO_HDMI1_PB] = {
 		.name = "Kbl HDMI Port1",
 		.stream_name = "Hdmi1",
-		.dpcm_playback = 1,
+		.playback_assertion = 1,
 		.init = NULL,
 		.trigger = {
 			SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST},
@@ -406,7 +406,7 @@ static struct snd_soc_dai_link kabylake_rt5660_dais[] = {
 	[KBL_DPCM_AUDIO_HDMI2_PB] = {
 		.name = "Kbl HDMI Port2",
 		.stream_name = "Hdmi2",
-		.dpcm_playback = 1,
+		.playback_assertion = 1,
 		.init = NULL,
 		.trigger = {
 			SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST},
@@ -419,7 +419,7 @@ static struct snd_soc_dai_link kabylake_rt5660_dais[] = {
 		.stream_name = "Hdmi3",
 		.trigger = {
 			SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST},
-		.dpcm_playback = 1,
+		.playback_assertion = 1,
 		.init = NULL,
 		.nonatomic = 1,
 		.dynamic = 1,
@@ -440,14 +440,14 @@ static struct snd_soc_dai_link kabylake_rt5660_dais[] = {
 		.ignore_pmdown_time = 1,
 		.be_hw_params_fixup = kabylake_ssp0_fixup,
 		.ops = &kabylake_rt5660_ops,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
+		.playback_assertion = 1,
+		.capture_assertion = 1,
 		SND_SOC_DAILINK_REG(ssp0_pin, ssp0_codec, platform),
 	},
 	{
 		.name = "iDisp1",
 		.id = 1,
-		.dpcm_playback = 1,
+		.playback_assertion = 1,
 		.init = kabylake_hdmi1_init,
 		.no_pcm = 1,
 		SND_SOC_DAILINK_REG(idisp1_pin, idisp1_codec, platform),
@@ -456,7 +456,7 @@ static struct snd_soc_dai_link kabylake_rt5660_dais[] = {
 		.name = "iDisp2",
 		.id = 2,
 		.init = kabylake_hdmi2_init,
-		.dpcm_playback = 1,
+		.playback_assertion = 1,
 		.no_pcm = 1,
 		SND_SOC_DAILINK_REG(idisp2_pin, idisp2_codec, platform),
 	},
@@ -464,7 +464,7 @@ static struct snd_soc_dai_link kabylake_rt5660_dais[] = {
 		.name = "iDisp3",
 		.id = 3,
 		.init = kabylake_hdmi3_init,
-		.dpcm_playback = 1,
+		.playback_assertion = 1,
 		.no_pcm = 1,
 		SND_SOC_DAILINK_REG(idisp3_pin, idisp3_codec, platform),
 	},
diff --git a/sound/soc/intel/boards/kbl_rt5663_max98927.c b/sound/soc/intel/boards/kbl_rt5663_max98927.c
index 646e8ff8e961..b59773d61127 100644
--- a/sound/soc/intel/boards/kbl_rt5663_max98927.c
+++ b/sound/soc/intel/boards/kbl_rt5663_max98927.c
@@ -687,7 +687,7 @@ static struct snd_soc_dai_link kabylake_dais[] = {
 		.init = kabylake_rt5663_fe_init,
 		.trigger = {
 			SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST},
-		.dpcm_playback = 1,
+		.playback_assertion = 1,
 		.ops = &kabylake_rt5663_fe_ops,
 		SND_SOC_DAILINK_REG(system, dummy, platform),
 	},
@@ -698,14 +698,14 @@ static struct snd_soc_dai_link kabylake_dais[] = {
 		.nonatomic = 1,
 		.trigger = {
 			SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST},
-		.dpcm_capture = 1,
+		.capture_assertion = 1,
 		.ops = &kabylake_rt5663_fe_ops,
 		SND_SOC_DAILINK_REG(system, dummy, platform),
 	},
 	[KBL_DPCM_AUDIO_HS_PB] = {
 		.name = "Kbl Audio Headset Playback",
 		.stream_name = "Headset Audio",
-		.dpcm_playback = 1,
+		.playback_assertion = 1,
 		.nonatomic = 1,
 		.dynamic = 1,
 		SND_SOC_DAILINK_REG(system2, dummy, platform),
@@ -714,7 +714,7 @@ static struct snd_soc_dai_link kabylake_dais[] = {
 		.name = "Kbl Audio Echo Reference cap",
 		.stream_name = "Echoreference Capture",
 		.init = NULL,
-		.dpcm_capture = 1,
+		.capture_assertion = 1,
 		.nonatomic = 1,
 		SND_SOC_DAILINK_REG(echoref, dummy, platform),
 	},
@@ -722,7 +722,7 @@ static struct snd_soc_dai_link kabylake_dais[] = {
 		.name = "Kbl Audio Reference cap",
 		.stream_name = "Wake on Voice",
 		.init = NULL,
-		.dpcm_capture = 1,
+		.capture_assertion = 1,
 		.nonatomic = 1,
 		.dynamic = 1,
 		.ops = &skylake_refcap_ops,
@@ -732,7 +732,7 @@ static struct snd_soc_dai_link kabylake_dais[] = {
 		.name = "Kbl Audio DMIC cap",
 		.stream_name = "dmiccap",
 		.init = NULL,
-		.dpcm_capture = 1,
+		.capture_assertion = 1,
 		.nonatomic = 1,
 		.dynamic = 1,
 		.ops = &kabylake_dmic_ops,
@@ -741,7 +741,7 @@ static struct snd_soc_dai_link kabylake_dais[] = {
 	[KBL_DPCM_AUDIO_HDMI1_PB] = {
 		.name = "Kbl HDMI Port1",
 		.stream_name = "Hdmi1",
-		.dpcm_playback = 1,
+		.playback_assertion = 1,
 		.init = NULL,
 		.trigger = {
 			SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST},
@@ -752,7 +752,7 @@ static struct snd_soc_dai_link kabylake_dais[] = {
 	[KBL_DPCM_AUDIO_HDMI2_PB] = {
 		.name = "Kbl HDMI Port2",
 		.stream_name = "Hdmi2",
-		.dpcm_playback = 1,
+		.playback_assertion = 1,
 		.init = NULL,
 		.trigger = {
 			SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST},
@@ -765,7 +765,7 @@ static struct snd_soc_dai_link kabylake_dais[] = {
 		.stream_name = "Hdmi3",
 		.trigger = {
 			SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST},
-		.dpcm_playback = 1,
+		.playback_assertion = 1,
 		.init = NULL,
 		.nonatomic = 1,
 		.dynamic = 1,
@@ -783,7 +783,7 @@ static struct snd_soc_dai_link kabylake_dais[] = {
 			SND_SOC_DAIFMT_CBC_CFC,
 		.ignore_pmdown_time = 1,
 		.be_hw_params_fixup = kabylake_ssp_fixup,
-		.dpcm_playback = 1,
+		.playback_assertion = 1,
 		.ops = &kabylake_ssp0_ops,
 		SND_SOC_DAILINK_REG(ssp0_pin, ssp0_codec, platform),
 	},
@@ -798,8 +798,8 @@ static struct snd_soc_dai_link kabylake_dais[] = {
 		.ignore_pmdown_time = 1,
 		.be_hw_params_fixup = kabylake_ssp_fixup,
 		.ops = &kabylake_rt5663_ops,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
+		.playback_assertion = 1,
+		.capture_assertion = 1,
 		SND_SOC_DAILINK_REG(ssp1_pin, ssp1_codec, platform),
 	},
 	{
@@ -807,14 +807,14 @@ static struct snd_soc_dai_link kabylake_dais[] = {
 		.id = 2,
 		.be_hw_params_fixup = kabylake_dmic_fixup,
 		.ignore_suspend = 1,
-		.dpcm_capture = 1,
+		.capture_assertion = 1,
 		.no_pcm = 1,
 		SND_SOC_DAILINK_REG(dmic01_pin, dmic_codec, platform),
 	},
 	{
 		.name = "iDisp1",
 		.id = 3,
-		.dpcm_playback = 1,
+		.playback_assertion = 1,
 		.init = kabylake_hdmi1_init,
 		.no_pcm = 1,
 		SND_SOC_DAILINK_REG(idisp1_pin, idisp1_codec, platform),
@@ -823,7 +823,7 @@ static struct snd_soc_dai_link kabylake_dais[] = {
 		.name = "iDisp2",
 		.id = 4,
 		.init = kabylake_hdmi2_init,
-		.dpcm_playback = 1,
+		.playback_assertion = 1,
 		.no_pcm = 1,
 		SND_SOC_DAILINK_REG(idisp2_pin, idisp2_codec, platform),
 	},
@@ -831,7 +831,7 @@ static struct snd_soc_dai_link kabylake_dais[] = {
 		.name = "iDisp3",
 		.id = 5,
 		.init = kabylake_hdmi3_init,
-		.dpcm_playback = 1,
+		.playback_assertion = 1,
 		.no_pcm = 1,
 		SND_SOC_DAILINK_REG(idisp3_pin, idisp3_codec, platform),
 	},
@@ -846,7 +846,7 @@ static struct snd_soc_dai_link kabylake_5663_dais[] = {
 		.nonatomic = 1,
 		.trigger = {
 			SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST},
-		.dpcm_playback = 1,
+		.playback_assertion = 1,
 		.ops = &kabylake_rt5663_fe_ops,
 		SND_SOC_DAILINK_REG(system, dummy, platform),
 	},
@@ -857,14 +857,14 @@ static struct snd_soc_dai_link kabylake_5663_dais[] = {
 		.nonatomic = 1,
 		.trigger = {
 			SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST},
-		.dpcm_capture = 1,
+		.capture_assertion = 1,
 		.ops = &kabylake_rt5663_fe_ops,
 		SND_SOC_DAILINK_REG(system, dummy, platform),
 	},
 	[KBL_DPCM_AUDIO_5663_HDMI1_PB] = {
 		.name = "Kbl HDMI Port1",
 		.stream_name = "Hdmi1",
-		.dpcm_playback = 1,
+		.playback_assertion = 1,
 		.init = NULL,
 		.trigger = {
 			SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST},
@@ -875,7 +875,7 @@ static struct snd_soc_dai_link kabylake_5663_dais[] = {
 	[KBL_DPCM_AUDIO_5663_HDMI2_PB] = {
 		.name = "Kbl HDMI Port2",
 		.stream_name = "Hdmi2",
-		.dpcm_playback = 1,
+		.playback_assertion = 1,
 		.init = NULL,
 		.trigger = {
 			SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST},
@@ -896,14 +896,14 @@ static struct snd_soc_dai_link kabylake_5663_dais[] = {
 		.ignore_pmdown_time = 1,
 		.be_hw_params_fixup = kabylake_ssp_fixup,
 		.ops = &kabylake_rt5663_ops,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
+		.playback_assertion = 1,
+		.capture_assertion = 1,
 		SND_SOC_DAILINK_REG(ssp1_pin, ssp1_codec, platform),
 	},
 	{
 		.name = "iDisp1",
 		.id = 1,
-		.dpcm_playback = 1,
+		.playback_assertion = 1,
 		.init = kabylake_5663_hdmi1_init,
 		.no_pcm = 1,
 		SND_SOC_DAILINK_REG(idisp1_pin, idisp1_codec, platform),
@@ -912,7 +912,7 @@ static struct snd_soc_dai_link kabylake_5663_dais[] = {
 		.name = "iDisp2",
 		.id = 2,
 		.init = kabylake_5663_hdmi2_init,
-		.dpcm_playback = 1,
+		.playback_assertion = 1,
 		.no_pcm = 1,
 		SND_SOC_DAILINK_REG(idisp2_pin, idisp2_codec, platform),
 	},
diff --git a/sound/soc/intel/boards/kbl_rt5663_rt5514_max98927.c b/sound/soc/intel/boards/kbl_rt5663_rt5514_max98927.c
index 924d5d1de03a..2721dfe9a579 100644
--- a/sound/soc/intel/boards/kbl_rt5663_rt5514_max98927.c
+++ b/sound/soc/intel/boards/kbl_rt5663_rt5514_max98927.c
@@ -575,7 +575,7 @@ static struct snd_soc_dai_link kabylake_dais[] = {
 		.init = kabylake_rt5663_fe_init,
 		.trigger = {
 			SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST},
-		.dpcm_playback = 1,
+		.playback_assertion = 1,
 		.ops = &kabylake_rt5663_fe_ops,
 		SND_SOC_DAILINK_REG(system, dummy, platform),
 	},
@@ -586,14 +586,14 @@ static struct snd_soc_dai_link kabylake_dais[] = {
 		.nonatomic = 1,
 		.trigger = {
 			SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST},
-		.dpcm_capture = 1,
+		.capture_assertion = 1,
 		.ops = &kabylake_rt5663_fe_ops,
 		SND_SOC_DAILINK_REG(system, dummy, platform),
 	},
 	[KBL_DPCM_AUDIO_HS_PB] = {
 		.name = "Kbl Audio Headset Playback",
 		.stream_name = "Headset Audio",
-		.dpcm_playback = 1,
+		.playback_assertion = 1,
 		.nonatomic = 1,
 		.dynamic = 1,
 		SND_SOC_DAILINK_REG(system2, dummy, platform),
@@ -602,7 +602,7 @@ static struct snd_soc_dai_link kabylake_dais[] = {
 		.name = "Kbl Audio Echo Reference cap",
 		.stream_name = "Echoreference Capture",
 		.init = NULL,
-		.dpcm_capture = 1,
+		.capture_assertion = 1,
 		.nonatomic = 1,
 		SND_SOC_DAILINK_REG(echoref, dummy, platform),
 	},
@@ -615,7 +615,7 @@ static struct snd_soc_dai_link kabylake_dais[] = {
 		.name = "Kbl Audio DMIC cap",
 		.stream_name = "dmiccap",
 		.init = NULL,
-		.dpcm_capture = 1,
+		.capture_assertion = 1,
 		.nonatomic = 1,
 		.dynamic = 1,
 		.ops = &kabylake_dmic_ops,
@@ -624,7 +624,7 @@ static struct snd_soc_dai_link kabylake_dais[] = {
 	[KBL_DPCM_AUDIO_HDMI1_PB] = {
 		.name = "Kbl HDMI Port1",
 		.stream_name = "Hdmi1",
-		.dpcm_playback = 1,
+		.playback_assertion = 1,
 		.init = NULL,
 		.trigger = {
 			SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST},
@@ -635,7 +635,7 @@ static struct snd_soc_dai_link kabylake_dais[] = {
 	[KBL_DPCM_AUDIO_HDMI2_PB] = {
 		.name = "Kbl HDMI Port2",
 		.stream_name = "Hdmi2",
-		.dpcm_playback = 1,
+		.playback_assertion = 1,
 		.init = NULL,
 		.trigger = {
 			SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST},
@@ -655,8 +655,8 @@ static struct snd_soc_dai_link kabylake_dais[] = {
 			SND_SOC_DAIFMT_CBC_CFC,
 		.ignore_pmdown_time = 1,
 		.be_hw_params_fixup = kabylake_ssp_fixup,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
+		.playback_assertion = 1,
+		.capture_assertion = 1,
 		.ops = &kabylake_ssp0_ops,
 		SND_SOC_DAILINK_REG(ssp0_pin, ssp0_codec, platform),
 	},
@@ -670,14 +670,14 @@ static struct snd_soc_dai_link kabylake_dais[] = {
 		.ignore_pmdown_time = 1,
 		.be_hw_params_fixup = kabylake_ssp_fixup,
 		.ops = &kabylake_rt5663_ops,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
+		.playback_assertion = 1,
+		.capture_assertion = 1,
 		SND_SOC_DAILINK_REG(ssp1_pin, ssp1_codec, platform),
 	},
 	{
 		.name = "iDisp1",
 		.id = 3,
-		.dpcm_playback = 1,
+		.playback_assertion = 1,
 		.init = kabylake_hdmi1_init,
 		.no_pcm = 1,
 		SND_SOC_DAILINK_REG(idisp1_pin, idisp1_codec, platform),
@@ -686,7 +686,7 @@ static struct snd_soc_dai_link kabylake_dais[] = {
 		.name = "iDisp2",
 		.id = 4,
 		.init = kabylake_hdmi2_init,
-		.dpcm_playback = 1,
+		.playback_assertion = 1,
 		.no_pcm = 1,
 		SND_SOC_DAILINK_REG(idisp2_pin, idisp2_codec, platform),
 	},
diff --git a/sound/soc/intel/boards/skl_hda_dsp_common.c b/sound/soc/intel/boards/skl_hda_dsp_common.c
index e9cefa4ae56d..7fa21bd51ecb 100644
--- a/sound/soc/intel/boards/skl_hda_dsp_common.c
+++ b/sound/soc/intel/boards/skl_hda_dsp_common.c
@@ -84,51 +84,51 @@ struct snd_soc_dai_link skl_hda_be_dai_links[HDA_DSP_MAX_BE_DAI_LINKS] = {
 	{
 		.name = "iDisp1",
 		.id = 1,
-		.dpcm_playback = 1,
+		.playback_assertion = 1,
 		.no_pcm = 1,
 		SND_SOC_DAILINK_REG(idisp1_cpu, idisp1_codec, platform),
 	},
 	{
 		.name = "iDisp2",
 		.id = 2,
-		.dpcm_playback = 1,
+		.playback_assertion = 1,
 		.no_pcm = 1,
 		SND_SOC_DAILINK_REG(idisp2_cpu, idisp2_codec, platform),
 	},
 	{
 		.name = "iDisp3",
 		.id = 3,
-		.dpcm_playback = 1,
+		.playback_assertion = 1,
 		.no_pcm = 1,
 		SND_SOC_DAILINK_REG(idisp3_cpu, idisp3_codec, platform),
 	},
 	{
 		.name = "Analog Playback and Capture",
 		.id = 4,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
+		.playback_assertion = 1,
+		.capture_assertion = 1,
 		.no_pcm = 1,
 		SND_SOC_DAILINK_REG(analog_cpu, analog_codec, platform),
 	},
 	{
 		.name = "Digital Playback and Capture",
 		.id = 5,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
+		.playback_assertion = 1,
+		.capture_assertion = 1,
 		.no_pcm = 1,
 		SND_SOC_DAILINK_REG(digital_cpu, digital_codec, platform),
 	},
 	{
 		.name = "dmic01",
 		.id = 6,
-		.dpcm_capture = 1,
+		.capture_assertion = 1,
 		.no_pcm = 1,
 		SND_SOC_DAILINK_REG(dmic_pin, dmic_codec, platform),
 	},
 	{
 		.name = "dmic16k",
 		.id = 7,
-		.dpcm_capture = 1,
+		.capture_assertion = 1,
 		.no_pcm = 1,
 		SND_SOC_DAILINK_REG(dmic16k, dmic_codec, platform),
 	},
diff --git a/sound/soc/intel/boards/skl_nau88l25_max98357a.c b/sound/soc/intel/boards/skl_nau88l25_max98357a.c
index e4630c33176e..a6dcc7a5312b 100644
--- a/sound/soc/intel/boards/skl_nau88l25_max98357a.c
+++ b/sound/soc/intel/boards/skl_nau88l25_max98357a.c
@@ -474,7 +474,7 @@ static struct snd_soc_dai_link skylake_dais[] = {
 		.init = skylake_nau8825_fe_init,
 		.trigger = {
 			SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST},
-		.dpcm_playback = 1,
+		.playback_assertion = 1,
 		.ops = &skylake_nau8825_fe_ops,
 		SND_SOC_DAILINK_REG(system, dummy, platform),
 	},
@@ -485,7 +485,7 @@ static struct snd_soc_dai_link skylake_dais[] = {
 		.nonatomic = 1,
 		.trigger = {
 			SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST},
-		.dpcm_capture = 1,
+		.capture_assertion = 1,
 		.ops = &skylake_nau8825_fe_ops,
 		SND_SOC_DAILINK_REG(system, dummy, platform),
 	},
@@ -493,7 +493,7 @@ static struct snd_soc_dai_link skylake_dais[] = {
 		.name = "Skl Audio Reference cap",
 		.stream_name = "Wake on Voice",
 		.init = NULL,
-		.dpcm_capture = 1,
+		.capture_assertion = 1,
 		.nonatomic = 1,
 		.dynamic = 1,
 		.ops = &skylake_refcap_ops,
@@ -503,7 +503,7 @@ static struct snd_soc_dai_link skylake_dais[] = {
 		.name = "Skl Audio DMIC cap",
 		.stream_name = "dmiccap",
 		.init = NULL,
-		.dpcm_capture = 1,
+		.capture_assertion = 1,
 		.nonatomic = 1,
 		.dynamic = 1,
 		.ops = &skylake_dmic_ops,
@@ -512,7 +512,7 @@ static struct snd_soc_dai_link skylake_dais[] = {
 	[SKL_DPCM_AUDIO_HDMI1_PB] = {
 		.name = "Skl HDMI Port1",
 		.stream_name = "Hdmi1",
-		.dpcm_playback = 1,
+		.playback_assertion = 1,
 		.init = NULL,
 		.trigger = {
 			SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST},
@@ -523,7 +523,7 @@ static struct snd_soc_dai_link skylake_dais[] = {
 	[SKL_DPCM_AUDIO_HDMI2_PB] = {
 		.name = "Skl HDMI Port2",
 		.stream_name = "Hdmi2",
-		.dpcm_playback = 1,
+		.playback_assertion = 1,
 		.init = NULL,
 		.trigger = {
 			SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST},
@@ -536,7 +536,7 @@ static struct snd_soc_dai_link skylake_dais[] = {
 		.stream_name = "Hdmi3",
 		.trigger = {
 			SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST},
-		.dpcm_playback = 1,
+		.playback_assertion = 1,
 		.init = NULL,
 		.nonatomic = 1,
 		.dynamic = 1,
@@ -554,7 +554,7 @@ static struct snd_soc_dai_link skylake_dais[] = {
 			SND_SOC_DAIFMT_CBC_CFC,
 		.ignore_pmdown_time = 1,
 		.be_hw_params_fixup = skylake_ssp_fixup,
-		.dpcm_playback = 1,
+		.playback_assertion = 1,
 		SND_SOC_DAILINK_REG(ssp0_pin, ssp0_codec, platform),
 	},
 	{
@@ -568,8 +568,8 @@ static struct snd_soc_dai_link skylake_dais[] = {
 		.ignore_pmdown_time = 1,
 		.be_hw_params_fixup = skylake_ssp_fixup,
 		.ops = &skylake_nau8825_ops,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
+		.playback_assertion = 1,
+		.capture_assertion = 1,
 		SND_SOC_DAILINK_REG(ssp1_pin, ssp1_codec, platform),
 	},
 	{
@@ -577,14 +577,14 @@ static struct snd_soc_dai_link skylake_dais[] = {
 		.id = 2,
 		.be_hw_params_fixup = skylake_dmic_fixup,
 		.ignore_suspend = 1,
-		.dpcm_capture = 1,
+		.capture_assertion = 1,
 		.no_pcm = 1,
 		SND_SOC_DAILINK_REG(dmic_pin, dmic_codec, platform),
 	},
 	{
 		.name = "iDisp1",
 		.id = 3,
-		.dpcm_playback = 1,
+		.playback_assertion = 1,
 		.init = skylake_hdmi1_init,
 		.no_pcm = 1,
 		SND_SOC_DAILINK_REG(idisp1_pin, idisp1_codec, platform),
@@ -593,7 +593,7 @@ static struct snd_soc_dai_link skylake_dais[] = {
 		.name = "iDisp2",
 		.id = 4,
 		.init = skylake_hdmi2_init,
-		.dpcm_playback = 1,
+		.playback_assertion = 1,
 		.no_pcm = 1,
 		SND_SOC_DAILINK_REG(idisp2_pin, idisp2_codec, platform),
 	},
@@ -601,7 +601,7 @@ static struct snd_soc_dai_link skylake_dais[] = {
 		.name = "iDisp3",
 		.id = 5,
 		.init = skylake_hdmi3_init,
-		.dpcm_playback = 1,
+		.playback_assertion = 1,
 		.no_pcm = 1,
 		SND_SOC_DAILINK_REG(idisp3_pin, idisp3_codec, platform),
 	},
diff --git a/sound/soc/intel/boards/skl_nau88l25_ssm4567.c b/sound/soc/intel/boards/skl_nau88l25_ssm4567.c
index fadc25a536b4..6a6aaf1cef11 100644
--- a/sound/soc/intel/boards/skl_nau88l25_ssm4567.c
+++ b/sound/soc/intel/boards/skl_nau88l25_ssm4567.c
@@ -513,7 +513,7 @@ static struct snd_soc_dai_link skylake_dais[] = {
 		.init = skylake_nau8825_fe_init,
 		.trigger = {
 			SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST},
-		.dpcm_playback = 1,
+		.playback_assertion = 1,
 		.ops = &skylake_nau8825_fe_ops,
 		SND_SOC_DAILINK_REG(system, dummy, platform),
 	},
@@ -524,7 +524,7 @@ static struct snd_soc_dai_link skylake_dais[] = {
 		.nonatomic = 1,
 		.trigger = {
 			SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST},
-		.dpcm_capture = 1,
+		.capture_assertion = 1,
 		.ops = &skylake_nau8825_fe_ops,
 		SND_SOC_DAILINK_REG(system, dummy, platform),
 	},
@@ -532,7 +532,7 @@ static struct snd_soc_dai_link skylake_dais[] = {
 		.name = "Skl Audio Reference cap",
 		.stream_name = "Wake on Voice",
 		.init = NULL,
-		.dpcm_capture = 1,
+		.capture_assertion = 1,
 		.nonatomic = 1,
 		.dynamic = 1,
 		.ops = &skylake_refcap_ops,
@@ -542,7 +542,7 @@ static struct snd_soc_dai_link skylake_dais[] = {
 		.name = "Skl Audio DMIC cap",
 		.stream_name = "dmiccap",
 		.init = NULL,
-		.dpcm_capture = 1,
+		.capture_assertion = 1,
 		.nonatomic = 1,
 		.dynamic = 1,
 		.ops = &skylake_dmic_ops,
@@ -551,7 +551,7 @@ static struct snd_soc_dai_link skylake_dais[] = {
 	[SKL_DPCM_AUDIO_HDMI1_PB] = {
 		.name = "Skl HDMI Port1",
 		.stream_name = "Hdmi1",
-		.dpcm_playback = 1,
+		.playback_assertion = 1,
 		.init = NULL,
 		.trigger = {
 			SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST},
@@ -562,7 +562,7 @@ static struct snd_soc_dai_link skylake_dais[] = {
 	[SKL_DPCM_AUDIO_HDMI2_PB] = {
 		.name = "Skl HDMI Port2",
 		.stream_name = "Hdmi2",
-		.dpcm_playback = 1,
+		.playback_assertion = 1,
 		.init = NULL,
 		.trigger = {
 			SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST},
@@ -575,7 +575,7 @@ static struct snd_soc_dai_link skylake_dais[] = {
 		.stream_name = "Hdmi3",
 		.trigger = {
 			SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST},
-		.dpcm_playback = 1,
+		.playback_assertion = 1,
 		.init = NULL,
 		.nonatomic = 1,
 		.dynamic = 1,
@@ -594,8 +594,8 @@ static struct snd_soc_dai_link skylake_dais[] = {
 		.init = skylake_ssm4567_codec_init,
 		.ignore_pmdown_time = 1,
 		.be_hw_params_fixup = skylake_ssp_fixup,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
+		.playback_assertion = 1,
+		.capture_assertion = 1,
 		SND_SOC_DAILINK_REG(ssp0_pin, ssp0_codec, platform),
 	},
 	{
@@ -609,8 +609,8 @@ static struct snd_soc_dai_link skylake_dais[] = {
 		.ignore_pmdown_time = 1,
 		.be_hw_params_fixup = skylake_ssp_fixup,
 		.ops = &skylake_nau8825_ops,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
+		.playback_assertion = 1,
+		.capture_assertion = 1,
 		SND_SOC_DAILINK_REG(ssp1_pin, ssp1_codec, platform),
 	},
 	{
@@ -618,14 +618,14 @@ static struct snd_soc_dai_link skylake_dais[] = {
 		.id = 2,
 		.ignore_suspend = 1,
 		.be_hw_params_fixup = skylake_dmic_fixup,
-		.dpcm_capture = 1,
+		.capture_assertion = 1,
 		.no_pcm = 1,
 		SND_SOC_DAILINK_REG(dmic01_pin, dmic_codec, platform),
 	},
 	{
 		.name = "iDisp1",
 		.id = 3,
-		.dpcm_playback = 1,
+		.playback_assertion = 1,
 		.init = skylake_hdmi1_init,
 		.no_pcm = 1,
 		SND_SOC_DAILINK_REG(idisp1_pin, idisp1_codec, platform),
@@ -634,7 +634,7 @@ static struct snd_soc_dai_link skylake_dais[] = {
 		.name = "iDisp2",
 		.id = 4,
 		.init = skylake_hdmi2_init,
-		.dpcm_playback = 1,
+		.playback_assertion = 1,
 		.no_pcm = 1,
 		SND_SOC_DAILINK_REG(idisp2_pin, idisp2_codec, platform),
 	},
@@ -642,7 +642,7 @@ static struct snd_soc_dai_link skylake_dais[] = {
 		.name = "iDisp3",
 		.id = 5,
 		.init = skylake_hdmi3_init,
-		.dpcm_playback = 1,
+		.playback_assertion = 1,
 		.no_pcm = 1,
 		SND_SOC_DAILINK_REG(idisp3_pin, idisp3_codec, platform),
 	},
diff --git a/sound/soc/intel/boards/skl_rt286.c b/sound/soc/intel/boards/skl_rt286.c
index 9a8044274908..bf20a1188b35 100644
--- a/sound/soc/intel/boards/skl_rt286.c
+++ b/sound/soc/intel/boards/skl_rt286.c
@@ -348,7 +348,7 @@ static struct snd_soc_dai_link skylake_rt286_dais[] = {
 			SND_SOC_DPCM_TRIGGER_POST,
 			SND_SOC_DPCM_TRIGGER_POST
 		},
-		.dpcm_playback = 1,
+		.playback_assertion = 1,
 		.ops = &skylake_rt286_fe_ops,
 		SND_SOC_DAILINK_REG(system, dummy, platform),
 	},
@@ -361,7 +361,7 @@ static struct snd_soc_dai_link skylake_rt286_dais[] = {
 			SND_SOC_DPCM_TRIGGER_POST,
 			SND_SOC_DPCM_TRIGGER_POST
 		},
-		.dpcm_playback = 1,
+		.playback_assertion = 1,
 		.ops = &skylake_rt286_fe_ops,
 		SND_SOC_DAILINK_REG(deepbuffer, dummy, platform),
 	},
@@ -374,7 +374,7 @@ static struct snd_soc_dai_link skylake_rt286_dais[] = {
 			SND_SOC_DPCM_TRIGGER_POST,
 			SND_SOC_DPCM_TRIGGER_POST
 		},
-		.dpcm_capture = 1,
+		.capture_assertion = 1,
 		.ops = &skylake_rt286_fe_ops,
 		SND_SOC_DAILINK_REG(system, dummy, platform),
 	},
@@ -382,7 +382,7 @@ static struct snd_soc_dai_link skylake_rt286_dais[] = {
 		.name = "Skl Audio Reference cap",
 		.stream_name = "refcap",
 		.init = NULL,
-		.dpcm_capture = 1,
+		.capture_assertion = 1,
 		.nonatomic = 1,
 		.dynamic = 1,
 		SND_SOC_DAILINK_REG(reference, dummy, platform),
@@ -391,7 +391,7 @@ static struct snd_soc_dai_link skylake_rt286_dais[] = {
 		.name = "Skl Audio DMIC cap",
 		.stream_name = "dmiccap",
 		.init = NULL,
-		.dpcm_capture = 1,
+		.capture_assertion = 1,
 		.nonatomic = 1,
 		.dynamic = 1,
 		.ops = &skylake_dmic_ops,
@@ -400,7 +400,7 @@ static struct snd_soc_dai_link skylake_rt286_dais[] = {
 	[SKL_DPCM_AUDIO_HDMI1_PB] = {
 		.name = "Skl HDMI Port1",
 		.stream_name = "Hdmi1",
-		.dpcm_playback = 1,
+		.playback_assertion = 1,
 		.init = NULL,
 		.nonatomic = 1,
 		.dynamic = 1,
@@ -409,7 +409,7 @@ static struct snd_soc_dai_link skylake_rt286_dais[] = {
 	[SKL_DPCM_AUDIO_HDMI2_PB] = {
 		.name = "Skl HDMI Port2",
 		.stream_name = "Hdmi2",
-		.dpcm_playback = 1,
+		.playback_assertion = 1,
 		.init = NULL,
 		.nonatomic = 1,
 		.dynamic = 1,
@@ -418,7 +418,7 @@ static struct snd_soc_dai_link skylake_rt286_dais[] = {
 	[SKL_DPCM_AUDIO_HDMI3_PB] = {
 		.name = "Skl HDMI Port3",
 		.stream_name = "Hdmi3",
-		.dpcm_playback = 1,
+		.playback_assertion = 1,
 		.init = NULL,
 		.nonatomic = 1,
 		.dynamic = 1,
@@ -438,8 +438,8 @@ static struct snd_soc_dai_link skylake_rt286_dais[] = {
 		.ignore_pmdown_time = 1,
 		.be_hw_params_fixup = skylake_ssp0_fixup,
 		.ops = &skylake_rt286_ops,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
+		.playback_assertion = 1,
+		.capture_assertion = 1,
 		SND_SOC_DAILINK_REG(ssp0_pin, ssp0_codec, platform),
 	},
 	{
@@ -447,7 +447,7 @@ static struct snd_soc_dai_link skylake_rt286_dais[] = {
 		.id = 1,
 		.be_hw_params_fixup = skylake_dmic_fixup,
 		.ignore_suspend = 1,
-		.dpcm_capture = 1,
+		.capture_assertion = 1,
 		.no_pcm = 1,
 		SND_SOC_DAILINK_REG(dmic01_pin, dmic_codec, platform),
 	},
@@ -455,7 +455,7 @@ static struct snd_soc_dai_link skylake_rt286_dais[] = {
 		.name = "iDisp1",
 		.id = 2,
 		.init = skylake_hdmi_init,
-		.dpcm_playback = 1,
+		.playback_assertion = 1,
 		.no_pcm = 1,
 		SND_SOC_DAILINK_REG(idisp1_pin, idisp1_codec, platform),
 	},
@@ -463,7 +463,7 @@ static struct snd_soc_dai_link skylake_rt286_dais[] = {
 		.name = "iDisp2",
 		.id = 3,
 		.init = skylake_hdmi_init,
-		.dpcm_playback = 1,
+		.playback_assertion = 1,
 		.no_pcm = 1,
 		SND_SOC_DAILINK_REG(idisp2_pin, idisp2_codec, platform),
 	},
@@ -471,7 +471,7 @@ static struct snd_soc_dai_link skylake_rt286_dais[] = {
 		.name = "iDisp3",
 		.id = 4,
 		.init = skylake_hdmi_init,
-		.dpcm_playback = 1,
+		.playback_assertion = 1,
 		.no_pcm = 1,
 		SND_SOC_DAILINK_REG(idisp3_pin, idisp3_codec, platform),
 	},
diff --git a/sound/soc/intel/boards/sof_board_helpers.c b/sound/soc/intel/boards/sof_board_helpers.c
index eb140e13153f..8cc7ca21cc57 100644
--- a/sound/soc/intel/boards/sof_board_helpers.c
+++ b/sound/soc/intel/boards/sof_board_helpers.c
@@ -144,8 +144,8 @@ static int set_ssp_codec_link(struct device *dev, struct snd_soc_dai_link *link,
 
 	link->id = be_id;
 	link->no_pcm = 1;
-	link->dpcm_capture = 1;
-	link->dpcm_playback = 1;
+	link->capture_assertion = 1;
+	link->playback_assertion = 1;
 
 	return 0;
 }
@@ -195,7 +195,7 @@ static int set_dmic_link(struct device *dev, struct snd_soc_dai_link *link,
 		link->init = dmic_init;
 	link->ignore_suspend = 1;
 	link->no_pcm = 1;
-	link->dpcm_capture = 1;
+	link->capture_assertion = 1;
 
 	return 0;
 }
@@ -253,7 +253,7 @@ static int set_idisp_hdmi_link(struct device *dev, struct snd_soc_dai_link *link
 	link->id = be_id;
 	link->init = (hdmi_id == 1) ? hdmi_init : NULL;
 	link->no_pcm = 1;
-	link->dpcm_playback = 1;
+	link->playback_assertion = 1;
 
 	return 0;
 }
@@ -293,8 +293,8 @@ static int set_ssp_amp_link(struct device *dev, struct snd_soc_dai_link *link,
 
 	link->id = be_id;
 	link->no_pcm = 1;
-	link->dpcm_capture = 1; /* feedback stream or firmware-generated echo reference */
-	link->dpcm_playback = 1;
+	link->capture_assertion = 1; /* feedback stream or firmware-generated echo reference */
+	link->playback_assertion = 1;
 
 	return 0;
 }
@@ -334,8 +334,8 @@ static int set_bt_offload_link(struct device *dev, struct snd_soc_dai_link *link
 
 	link->id = be_id;
 	link->no_pcm = 1;
-	link->dpcm_capture = 1;
-	link->dpcm_playback = 1;
+	link->capture_assertion = 1;
+	link->playback_assertion = 1;
 
 	return 0;
 }
@@ -375,7 +375,7 @@ static int set_hdmi_in_link(struct device *dev, struct snd_soc_dai_link *link,
 
 	link->id = be_id;
 	link->no_pcm = 1;
-	link->dpcm_capture = 1;
+	link->capture_assertion = 1;
 
 	return 0;
 }
diff --git a/sound/soc/intel/boards/sof_es8336.c b/sound/soc/intel/boards/sof_es8336.c
index c1fcc156a575..f713de8721e5 100644
--- a/sound/soc/intel/boards/sof_es8336.c
+++ b/sound/soc/intel/boards/sof_es8336.c
@@ -455,8 +455,8 @@ static struct snd_soc_dai_link *sof_card_dai_links_create(struct device *dev,
 	links[id].exit = sof_es8316_exit;
 	links[id].ops = &sof_es8336_ops;
 	links[id].nonatomic = true;
-	links[id].dpcm_playback = 1;
-	links[id].dpcm_capture = 1;
+	links[id].playback_assertion = 1;
+	links[id].capture_assertion = 1;
 	links[id].no_pcm = 1;
 	links[id].cpus = &cpus[id];
 	links[id].num_cpus = 1;
@@ -496,7 +496,7 @@ static struct snd_soc_dai_link *sof_card_dai_links_create(struct device *dev,
 		links[id].platforms = platform_component;
 		links[id].num_platforms = ARRAY_SIZE(platform_component);
 		links[id].ignore_suspend = 1;
-		links[id].dpcm_capture = 1;
+		links[id].capture_assertion = 1;
 		links[id].no_pcm = 1;
 
 		id++;
@@ -539,7 +539,7 @@ static struct snd_soc_dai_link *sof_card_dai_links_create(struct device *dev,
 		links[id].platforms = platform_component;
 		links[id].num_platforms = ARRAY_SIZE(platform_component);
 		links[id].init = sof_hdmi_init;
-		links[id].dpcm_playback = 1;
+		links[id].playback_assertion = 1;
 		links[id].no_pcm = 1;
 
 		id++;
@@ -569,7 +569,7 @@ static struct snd_soc_dai_link *sof_card_dai_links_create(struct device *dev,
 			links[id].num_codecs = 1;
 			links[id].platforms = platform_component;
 			links[id].num_platforms = ARRAY_SIZE(platform_component);
-			links[id].dpcm_capture = 1;
+			links[id].capture_assertion = 1;
 			links[id].no_pcm = 1;
 			links[id].num_cpus = 1;
 			id++;
diff --git a/sound/soc/intel/boards/sof_pcm512x.c b/sound/soc/intel/boards/sof_pcm512x.c
index b01cb2329542..b581fbcd9b86 100644
--- a/sound/soc/intel/boards/sof_pcm512x.c
+++ b/sound/soc/intel/boards/sof_pcm512x.c
@@ -246,12 +246,12 @@ static struct snd_soc_dai_link *sof_card_dai_links_create(struct device *dev,
 	links[id].num_platforms = ARRAY_SIZE(platform_component);
 	links[id].init = sof_pcm512x_codec_init;
 	links[id].ops = &sof_pcm512x_ops;
-	links[id].dpcm_playback = 1;
+	links[id].playback_assertion = 1;
 	/*
 	 * capture only supported with specific versions of the Hifiberry DAC+
 	 */
 	if (sof_pcm512x_quirk & SOF_PCM512X_ENABLE_SSP_CAPTURE)
-		links[id].dpcm_capture = 1;
+		links[id].capture_assertion = 1;
 	links[id].no_pcm = 1;
 	links[id].cpus = &cpus[id];
 	links[id].num_cpus = 1;
@@ -294,7 +294,7 @@ static struct snd_soc_dai_link *sof_card_dai_links_create(struct device *dev,
 		links[id].platforms = platform_component;
 		links[id].num_platforms = ARRAY_SIZE(platform_component);
 		links[id].ignore_suspend = 1;
-		links[id].dpcm_capture = 1;
+		links[id].capture_assertion = 1;
 		links[id].no_pcm = 1;
 		id++;
 	}
@@ -341,7 +341,7 @@ static struct snd_soc_dai_link *sof_card_dai_links_create(struct device *dev,
 		links[id].platforms = platform_component;
 		links[id].num_platforms = ARRAY_SIZE(platform_component);
 		links[id].init = sof_hdmi_init;
-		links[id].dpcm_playback = 1;
+		links[id].playback_assertion = 1;
 		links[id].no_pcm = 1;
 		id++;
 	}
diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index d65c5da49000..2bbffbe06156 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -1152,8 +1152,8 @@ static void init_dai_link(struct device *dev, struct snd_soc_dai_link *dai_links
 	dai_links->num_cpus = cpus_num;
 	dai_links->codecs = codecs;
 	dai_links->num_codecs = codecs_num;
-	dai_links->dpcm_playback = playback;
-	dai_links->dpcm_capture = capture;
+	dai_links->playback_assertion = playback;
+	dai_links->capture_assertion = capture;
 	dai_links->init = init;
 	dai_links->ops = ops;
 }
diff --git a/sound/soc/intel/boards/sof_wm8804.c b/sound/soc/intel/boards/sof_wm8804.c
index 4cb0d463bf40..d276690b85f9 100644
--- a/sound/soc/intel/boards/sof_wm8804.c
+++ b/sound/soc/intel/boards/sof_wm8804.c
@@ -167,8 +167,8 @@ static struct snd_soc_dai_link dailink[] = {
 		.name = "SSP5-Codec",
 		.id = 0,
 		.no_pcm = 1,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
+		.playback_assertion = 1,
+		.capture_assertion = 1,
 		.ops = &sof_wm8804_ops,
 		SND_SOC_DAILINK_REG(ssp5_pin, ssp5_codec, platform),
 	},
-- 
2.25.1

