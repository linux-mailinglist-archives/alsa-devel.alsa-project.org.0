Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 90F2D7AE5C3
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Sep 2023 08:24:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6E6F2E11;
	Tue, 26 Sep 2023 08:23:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6E6F2E11
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695709465;
	bh=wbqiXJe5oy5XqNaX8YhwRU25YrkdshuXYkeC4tHIs6E=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=eP4uxk2AZOSe+RCARcOpxn3L0vBXaXt6qxidejtfjUGpf99tEme69wFZNDXGA7Nsn
	 9CPXQydflr8sDczfx3Jyf0NX7IJ+Cd1sbOIR246R7a5emFpnPZVTuwSc9i9JhUdsIa
	 C7XUAeOaR3Cn8gfpoygQOVkycLu8nKpJczak1cDw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E3F7CF805DF; Tue, 26 Sep 2023 08:21:47 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 17617F805D9;
	Tue, 26 Sep 2023 08:21:47 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7E446F805C5; Tue, 26 Sep 2023 08:21:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2071d.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::71d])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 71EACF8058C
	for <alsa-devel@alsa-project.org>; Tue, 26 Sep 2023 08:21:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 71EACF8058C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=SZvGRKx7
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X7JQcXjI1f4u5iNt1iqlwsGCX4nVupmQMY9Jv2kA9351OSD8KzlbFYOTL30yLAQa8O7MFcg7jC2NOkfrJhGyI6oPIS4PujnREb8vdfVMrfZYS8hiiR1GJNPd8myfr3Q9Q0AOE0CvxuXAhy+U8eSZBB8Wlet/aPAwSt7A4X1HxDA6VF7RzXfyaJ77sJYtwZu6rzxX0kB+kvjUIvzSTvkM7K/5cApalxzkZ74m871oplctNrsMS+/WzfDYeZD8Xk9ODIGbL1PMD/R0EnrA1Mf9wsf8ScmaI5lKxAOt+dXSNCTDLP3FdXAvogGTSEYr021MRE1cVjqey9mXKYoRNeHuXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZwaRIT34r+XO0h8KTchyZf5IJ8mKLjSng6a71Y5nrJA=;
 b=DV74CiE+8T7QtTgZ64/k3j3BNPMKrseDw5v+VGlH1enp5BCZtGHeyYUw3PupJrRYzG7xRgJXKs33VFskHSSZVgKpY2bYNTkDDlZYs1Eex8/J5wznp1JJMSGFjrLkPKaxDXW59iKTzMJ+/8TUpwjGNfZLrtMkODUxQsXYB2FYLhNa2Z5VKaYvNKCNHHRkgWS4PHeiGgiVhj0iEf/KUCy9dXeqEIvTU7x0e1lTSe3kvJkox81aC2cD2mdz+8y+XiLXtbKfxC6YmyhmTg6/OymKZGxJPk3nQmzm3MKcOMcPK6gkYc6tuzn0eubLQemvrrPW0Tty4cNGcZQvqF9zjaQOuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZwaRIT34r+XO0h8KTchyZf5IJ8mKLjSng6a71Y5nrJA=;
 b=SZvGRKx7AUQSzj9bq1S3Ne0oY5jHL5RBSlMFsC3uLRUnNtsgsv8+ub8vf2yktbyOt6ntHzTbUXLLAh1p0v3ypvOpaOOybfFkDU22A+sezPKag00+caHc5HkZ9L4R62UhjGX8Qr7ERmHI9eyKaeTgu2iXJHiRnpdaQ+/17XqTM64=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYWPR01MB10426.jpnprd01.prod.outlook.com (2603:1096:400:24e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Tue, 26 Sep
 2023 06:21:34 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::d2a3:45df:a180:595c]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::d2a3:45df:a180:595c%6]) with mapi id 15.20.6813.027; Tue, 26 Sep 2023
 06:21:34 +0000
Message-ID: <87y1gth2tu.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>, Takashi Iwai <tiwai@suse.com>
Cc: Fabio Estevam <festevam@gmail.com>, alsa-devel@alsa-project.org
Subject: [PATCH v2 11/54] ASoC: mxs: convert not to use asoc_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
In-Reply-To: <87edilihhg.wl-kuninori.morimoto.gx@renesas.com>
References: <87edilihhg.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 26 Sep 2023 06:21:34 +0000
X-ClientProxiedBy: TYCPR01CA0184.jpnprd01.prod.outlook.com
 (2603:1096:400:2b0::13) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYWPR01MB10426:EE_
X-MS-Office365-Filtering-Correlation-Id: 50de8ce7-79e0-41c6-a153-08dbbe58d51c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	sJT85UOuquuIkLg0GPQMjHi+Vhi7LTFOHhGBiH99To38F6WPoMq9Zk1GOpw1L/dHg4KcZhm2RGvtnu7nlct3jd0meUNdZSH92fsb7T31i2Vk0tRMIUDHtGvMvzs3hOqtQm0kIkk8FIZ4IGZR6nJXCoLLOAWPwzTFsttONwNTM8oU7itHtwMF0HVWJ11d6f8+3HGQ2WJNwGRiuidfi2QYIIrxo9j9Aqd1iE3I/r5dgvvkEYDs2nxZnJ4AT1aVDjDmk/BRinNq5i2TvYD2XOmnEhfYNvx8ubE40d3xqIvjtWx7a/4xqXoRS6ZR+BLcQZBqGUqADNnRuTLPE2oiEN9PvsgmFNXALSl+ZL+UloDgaJcVNIOFghy3TM/rsVQJwWeaBEtDpfZrvFn9byaCgI4E2BPq4ftzTmtEkiP1B+KzWyEQiFKX9vrciKoVOWPj7icgId8Vv61URuZEzh0pI+kQ8WuPC/Vu2o7kGIGmhh5P9+5dYc2uf3yfViBXsQw7bThHZBiBeTTJ39wKaPkyVptJQ+oEZxbYlf6IfRWenlYnENO4v4/o3AukRgxshRbgSl3J5FuDzTsiwcXXfuG+MhK/Zl4RRqHj3dnvuA/1gucw12Tf4ZKHaIzh6q63ukIfNrf054PLFR4yVnBrmMI5HpkXMw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(39860400002)(366004)(376002)(396003)(346002)(230922051799003)(1800799009)(186009)(451199024)(6506007)(6512007)(52116002)(26005)(478600001)(66476007)(66556008)(66946007)(86362001)(2616005)(110136005)(6486002)(38100700002)(38350700002)(83380400001)(2906002)(8936002)(8676002)(36756003)(4326008)(5660300002)(316002)(41300700001)(21314003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?sMIlv8hXqa/XhhcIHru+Qi2LXzyDJu0emp0fRtwDOYNohrw/58I2yTTAqklF?=
 =?us-ascii?Q?HRRGVCPAEFiJaJ6o85y6n5F/zuF2cVduQhW6NWaoPlHOyzgVpjrJ/VeizrOl?=
 =?us-ascii?Q?DgSR3AQAk9KpIeDFNYv6Gfo4YeS3OZetH+tOa+kt0XSoNX+BRE9GdpWThzJJ?=
 =?us-ascii?Q?i9lDOv9zElxklVotc6n7MCHLdzA7YdBN7rM1R2z4woASOYv3V9h11qnrI3uY?=
 =?us-ascii?Q?DfGEx6U54rIschSu/0qxZfqZDi3iaBwPNAFGwd/Fg1Aln5za4N1e6AGMc823?=
 =?us-ascii?Q?ICBokX9+oBsiHG3OBrvrBlz15a9IxU2c4EsSjaUCYFrCqYBk/hs3j9vJ4n7G?=
 =?us-ascii?Q?YTWe3NeJOIbaqo+tnzyGyCQ+DBPRg8hlBXOfS3JFPKoroON9ijBQCvot5dGD?=
 =?us-ascii?Q?vOI1piCjbnRMP7IfG0BhqUAlQP9WI+qbD52h1mV7cYcGAhsZHLrL7pcZoOjm?=
 =?us-ascii?Q?S6u4ChVnnqVnR3zwGgz12NX8FQhpLcpRv/KUf8Dj/rKKxTOuClDSlkqzhq16?=
 =?us-ascii?Q?WxvFXWnKClwUcMF53c0M9W2FjvbtQAxS//kTyu7Y8u9BZJZjs05FlC2b85d7?=
 =?us-ascii?Q?kVxUIFrnGUuPmD3ASAVSsUvjI+Mn/Z2GG+9mxzbHSj+VOzfS2cbpF7203vB5?=
 =?us-ascii?Q?SDrLJ8AL7x2vSZuJsBhvQc+clPjBY0y1TbYy+nLOnHt9C/wm2ckZVGdDXgpR?=
 =?us-ascii?Q?TZ9qjK4dIMyH79PNH58//ht2YZq5rlyBybBbHX3Rz2OsoMQGGc0spVsWGzlT?=
 =?us-ascii?Q?mRTEa85nGxsWuIzcvi2YLrskGy+k1cDWZe7CdrxmipLNAofrb6PnthfAjpVO?=
 =?us-ascii?Q?IovKJ7vPZfAi4o2lYHX5LoZ4y/B6H3Pl8i4LBhIExo3JfnwsTMmD9ibmNNVu?=
 =?us-ascii?Q?2GmmknL6/dW6+Nzw3KmVEVAeoG3dq09I1i7/0W9u1HeSY9UM7g3vixCYPOXN?=
 =?us-ascii?Q?KtRtB1IJUbiDAM/Fp3rJhMUOJs0QWCXWMoHiPzQyqvEyFoOug1jYC+sJweiI?=
 =?us-ascii?Q?OABDSKu+eoPGsbk862Jm2GRODWI3sD0lGTni0eoMNa93c4lzlUQdkfM2I4PY?=
 =?us-ascii?Q?5gsv/VfbcZwivEE00bpEo1Q2CGwLfsnu44QPcqJoUAKLH+PgRVgHle51na57?=
 =?us-ascii?Q?scbTlTAelu7IBgRciK38ZUSD0K/ANRSBVa7I2xdSxjPZv5kzGx9McJeOIQfz?=
 =?us-ascii?Q?MnqGKq4lSTjrH1MrW+9ikQfZ3fTqF91m4ieaDn8eKyVHoaqJDmjo7a+cn0Vg?=
 =?us-ascii?Q?kwDBXpIxHELPgywRD5s6faFZJipBmkWqKLoKIDp1fkTEOlWqAln80wi90Llv?=
 =?us-ascii?Q?uQ4fhWpDO9HF2ZrsMyjLCUigmWma8VdcUFMHHZRtR7nyP22YoqleQbH6KBl4?=
 =?us-ascii?Q?oBMyX7y+4SfzupoYKDmhb1GV20cJhbTNGlhddlXFWKTAKY/BtuGy1W5xX991?=
 =?us-ascii?Q?zNLHUZvsHKkPgaZQk9Voz5A4qO1Ka8r97GbEOFyvPZIbCQ5uow6ypAKvJopZ?=
 =?us-ascii?Q?Ja+fG1v084YLt7VSZBgIFdesLU1d58AzYa8uKn8vFN/7Zd7EDOJk0zQifOPa?=
 =?us-ascii?Q?bT7uwjMf/AP8C6dMY/GGE1YOw7qXXzBf2Hk3faDjG/JTgh22VYgsXrweyZNu?=
 =?us-ascii?Q?9+lvYzQ73LnS53c5albuLJM=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 50de8ce7-79e0-41c6-a153-08dbbe58d51c
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2023 06:21:34.6284
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 iiL3vye+Tt1ps+lDUrmbkAT/EES5L5Lv58acfeqc0a3c5Mi+3M0n9WB5sImbRYHZY+P49XR1/Uu9XCyewHUgbFoV23UFvgBf98GcX3y6Ex8kzZDWd2rEZO5Q6vIlzroT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB10426
Message-ID-Hash: XMYK3PMIJDYFND5TMCC2RG7RWPHBFBC5
X-Message-ID-Hash: XMYK3PMIJDYFND5TMCC2RG7RWPHBFBC5
X-MailFrom: kuninori.morimoto.gx@renesas.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XMYK3PMIJDYFND5TMCC2RG7RWPHBFBC5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

ASoC is now unified asoc_xxx() into snd_soc_xxx().
This patch convert asoc_xxx() to snd_soc_xxx().

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/mxs/mxs-sgtl5000.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/mxs/mxs-sgtl5000.c b/sound/soc/mxs/mxs-sgtl5000.c
index 457c3a72a414..01cb5c5e72fe 100644
--- a/sound/soc/mxs/mxs-sgtl5000.c
+++ b/sound/soc/mxs/mxs-sgtl5000.c
@@ -19,9 +19,9 @@
 static int mxs_sgtl5000_hw_params(struct snd_pcm_substream *substream,
 	struct snd_pcm_hw_params *params)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
-	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
-	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
 	unsigned int rate = params_rate(params);
 	u32 mclk;
 	int ret;
-- 
2.25.1

