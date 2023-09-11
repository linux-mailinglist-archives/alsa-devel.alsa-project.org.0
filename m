Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 419D879B17F
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Sep 2023 01:56:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 99C82E8B;
	Tue, 12 Sep 2023 01:55:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 99C82E8B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694476604;
	bh=Jo3AP3c0eLTDvH+rTvw0aYhvMIkNw/4WPVqtBUCBKIk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Q1P8DQw0cNTHN3+2tfKvx4ygHglbXayXlYaAZmkkct8hWGFush5eVigf2/BjFCiJH
	 y15rg/2i0QO5k6Dw6ifp4RidPFayhkadZxUuhkTYV6dWhsCWctWpGk/Yj8zRwuBQBU
	 dKAFfDywQHpDFtSZzYlfnRjomvIv/ca1LeYLPCpE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 78271F805C0; Tue, 12 Sep 2023 01:51:51 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 64EC3F805AD;
	Tue, 12 Sep 2023 01:51:50 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8DB07F80609; Tue, 12 Sep 2023 01:51:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=unavailable autolearn_force=no
	version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2070a.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::70a])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3655EF8061D
	for <alsa-devel@alsa-project.org>; Tue, 12 Sep 2023 01:50:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3655EF8061D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=d85AOUTA
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ALX5gO5f5Kbo2B/S3WiP7CMLn5/2S/BdKM4E2fOrZxDHlCUk357MEJ4OvhZTeiPkFdZVRWoPvg3QYoussKK7hITVf+ZJKFO6lRi69ybMTjtEGW9HUFhF19pJb+Kxw5z2XEfX2R5uUsZr5RcRU3m/oLcAGi64XKDQUvfZS0C2sv0RS8jCAL5ZTLLPW/ffN9BOwHAJQltda6v5uUbX8YrS3sUBJbal29amelspWLl/hqgI42vM2Uo53/HlKKPILXZApApWxU/2Tw/JBfXCRLvO/4yevSuJ1KKw7WwlRgMVNL31Q3c31LDH8zExhKUiEIJSvsX/89+d7FK8+W9jdHoeCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q5E4/5k3P+ays91DCjK2PM78xEM7NdViM7zFYBxwURc=;
 b=j/6n9EiNQVzmaJ7zt94tK2t4YhBMR+ZnhgLVJlyBQxlUxaZvZW5xBhgMx1jtGZcku4kTMVrOh4iDErR+ZH58dQDBWufpvCfqWQryDDi6elHrRv/sIK4Q2OyyCLJwDyeEAv/eIHdqgzzUGc8t6msE03rtT7JGb9mS/Rg8LGUQKmtXpwB/Z1B5oAKQt/k3TugnW2ShLmByi1/ku4+r1VMi1h2ebz0iq/iRU++owdfcudsMVjJNdizmDhta8G1NHh36oUxaQRxvS2lc0I3497KcGmha/7XCORvqb5PObIeqwi9EiDGBzu0XYDpGXBTaqTa3F+tJfpmKL/TvbiPgB7M7WQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q5E4/5k3P+ays91DCjK2PM78xEM7NdViM7zFYBxwURc=;
 b=d85AOUTAbxFXJJdyJydFDiEEjuOuncyDiOM/U00+3zIHbb7O0cbH3U86J9H+T5AZ4SifVmYaB2WDYFpamtwCqQkq3dRcCtN99hvKEnNoRty56uAVyfInJV+LjsJBPW6c/OzhHLYuT5tk3SuXsCn5KqA2/QsosHEsOaeIaEo5Dbg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OS3PR01MB9445.jpnprd01.prod.outlook.com (2603:1096:604:1ce::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.37; Mon, 11 Sep
 2023 23:50:07 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::8c08:d94c:8e54:9b5d]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::8c08:d94c:8e54:9b5d%6]) with mapi id 15.20.6768.036; Mon, 11 Sep 2023
 23:50:07 +0000
Message-ID: <87a5tsqngx.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: =?ISO-8859-1?Q?=22N=C3=ADcolas_F=2E_R=2E_A=2E_Prado=22?=
 <nfraprado@collabora.com>, Alper Nebi Yasak <alpernebiyasak@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>, Mark
 Brown <broonie@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Ricardo Ribalda Delgado <ribalda@chromium.org>, Takashi Iwai
 <tiwai@suse.com>, Trevor Wu <trevor.wu@mediatek.com>
Cc: alsa-devel@alsa-project.org
Subject: [PATCH 30/54] ASoC: mediatek: convert not to use asoc_xxx()
In-Reply-To: <87h6o0s275.wl-kuninori.morimoto.gx@renesas.com>
References: <87h6o0s275.wl-kuninori.morimoto.gx@renesas.com>
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 11 Sep 2023 23:50:07 +0000
X-ClientProxiedBy: TYCP286CA0244.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:456::19) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|OS3PR01MB9445:EE_
X-MS-Office365-Filtering-Correlation-Id: 28eb342f-5ff2-44b3-72cc-08dbb321d402
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Okd7i3c1K6nZ3SzWpHkMp3hsyNgM/uw2WgmiLvO5rFGBcYEAwQfpxkJjEp4R9eap7eDZ5D5ldQFFR4g762fIg20fUEZDNMcs27qLreSRxgVR9i12nXxQFaE3Ie84cf8m0O3GxAmJMndsQ+5L0gWkmD2QttUYZ22qE9seWDHkAE8r5HfVDznIbFrzUIU/l8kvwZ9CdBNH5lo6MIpcvTj5c+tekElKSPdd/k8MTJQFdn3xDv0mTXyo69KiZ0NRcS67sqCt9VooA9eIXnBDTF0JY4IouB1YjeGk00gwDp63m+wV9nR7uD3X6ln1wXSdxAu4KHzI7YZR4e2hXPBlKynaopOYh+Vjcsr3XgKFLea/nS7kZvGPfCEDUH0gVtGPFQ4BhhI7eyQ/HGIpYTd9s5amxGCRjLT5koq5Qa8QGUNSOmMrRUPwj6UnpETVQQV1G13/AZSVRfl8wFo7fBDS/6GAEvEDhu3CvGYNpacw4rZz5wsqXuM/4s8xFit+v5JlB1sHkBq1EXRbgJFs2rKp8/zcroN9euWshSjBTguAtEnObP/SMXWkeTIVBOfi90qeWVo4aaTB/HAlBkYCcsUe/cf9zCvN7ChqGDJKLs5KcIFggQlm56wBRgGo2dLas6thTZ4Ewd9dMYWzGzoH4IXEOjyOEzeg2ZvaewI7X4b+BnK57aw=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(366004)(376002)(136003)(39860400002)(396003)(1800799009)(186009)(451199024)(83380400001)(66556008)(110136005)(38100700002)(36756003)(38350700002)(86362001)(316002)(66476007)(66946007)(8936002)(4326008)(8676002)(921005)(41300700001)(5660300002)(6506007)(6486002)(52116002)(6512007)(7416002)(2906002)(478600001)(30864003)(2616005)(26005)(21314003)(559001)(579004);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?OBUf2z3muVVbj2iFq1hc3w8gAJFC55VQTj0p7NiXwXrX/Py2BQujEujVarKx?=
 =?us-ascii?Q?5Qvhy8Oh/35edo0RcNGDcHeIm44o40Dm/zujPqQQizmlR/wTYkqiuT1P9SKk?=
 =?us-ascii?Q?UbbFPUkrliUVHuCKG0NP9Nrz7R5Ew3FHnqp4rFz6I5Dxt5WnrJkquPm05vwd?=
 =?us-ascii?Q?kMD1M5RblQGbBkxXtf7RjtgkLI3HDFj8RWn+vA590bh8+xDVyB4MFYgpXRpC?=
 =?us-ascii?Q?Cuw7szDr9sSR2mmDGC0bU/H/IWc/VPd+p1XvU5J5fwOjKZz1aa96GN+aHqh0?=
 =?us-ascii?Q?ZwXgLkdyTvR5ZleReHWAFPige+Cf/Tz6JYCqJQn7h36f68ft47vNxtQbxs03?=
 =?us-ascii?Q?GwjzTPAe2IcU01XNNFkt/zUal2u9ugc6BjuMEiONE0RRxcFrJwReOQvybFwe?=
 =?us-ascii?Q?6ZrLxPOdawH1eGo+xql3aM8KB9RSndPDpo1OVyELUUCdBi2ABWAyg0J/0Mir?=
 =?us-ascii?Q?5/5nGiA6h1AU3/NGwiHZZQdqfbMblpgz7r0Jys209vAz68twP8s/TeVMYGAS?=
 =?us-ascii?Q?OceeDhptRBvxdaR9/HNr75UpCNseCMTnYP4j3P0eVV3n9TtnLvqmlud7xHZc?=
 =?us-ascii?Q?DhbFJJDI2CrB9lLrjljWFj9KfwYgHfOP44ILGFym4zHjhcWHyH2WZwGksYft?=
 =?us-ascii?Q?/OfQYScj8ZaRABVU7Z++ZfRsU6CsAAyN1lQ8TiEZ/bvuAl7Iqo77Gfg3q5lL?=
 =?us-ascii?Q?VDmMGBuRaYcOnY5k7qSXKDbLWV8otxHZ1MA4rVm5O+mV3uo00B1Gy39yJTVE?=
 =?us-ascii?Q?UPaVm3TEC4vsxDaZF6bDkJbQ7B8OoVRQanogFpVDJtBy7+FZJLB6oq0KOJRt?=
 =?us-ascii?Q?o9N5yV1Oz3HoFi4ndB4Kh2iRqJwyGsYPqm9v9M+Dg8FzR10QGly69n6m+6i1?=
 =?us-ascii?Q?vB4qKz7owy89yt5BdMc4+adsV2yMKkE2EH1GUSnlUkgoULtuxeK6wTeKgahz?=
 =?us-ascii?Q?Ilk/M1rR3HDludSf9ykxMgyH8n3MbJa82gFLkMC21mw/LXg5oowWDTOlF1MU?=
 =?us-ascii?Q?EWniKatENuat7D4lHrLIBTIVYeFNrx8RTaEWfqGJgqHpQ1kmxpzT4CehpCln?=
 =?us-ascii?Q?UZ1rzmfmrY7ZR4sOoC7a4RJpY4uSMzUKlCYs8sqMRuiDMBIO249+v6iRW4Ae?=
 =?us-ascii?Q?PG64qE9gP2eVX9nAAdGfZlbMQNFGUf7g4sMrKZJZ4oIdFWGhmdop5awsByst?=
 =?us-ascii?Q?UOMhFeBMXkkHi7fu5Ki1L6yfNVpRehQlKsIU/I0IksHsO7nwmFQ+JGEEdaGh?=
 =?us-ascii?Q?PtphM8MIFiRRK9ClAJ/30dgD4AwOQGkDUjKX34SXIdkyOu5af+9RtyaNUF5R?=
 =?us-ascii?Q?B0u2WPbc5Clog1iLuJUtQ8ktCe0avocmf5KXCfUzzWWGuZb88DaAc1dnnSUs?=
 =?us-ascii?Q?ECAhPdwkx4d02NghEtVLdd0RJkpaqz06JB4UxvcSq/Yta4vdR2y0P/4T9QB9?=
 =?us-ascii?Q?LsUsET7Pm6+iUGWDcNZPAprnWLVUcd5a844lAuoDN+Dc10wM1kcMPCytnUNl?=
 =?us-ascii?Q?V1+WB1QVamH/EnZa9KBz+KmUioMo3GRO2aHvvOtzutosdIAACGO2zTt1VSw7?=
 =?us-ascii?Q?VPZVOnekSteY9OjlQBO9+bPj10YsetcXs8p5dmtXC8FwkPqL+g28lfcsWwVo?=
 =?us-ascii?Q?CJPxYlby1hnBTNXL6p+zZRE=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 28eb342f-5ff2-44b3-72cc-08dbb321d402
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2023 23:50:07.6828
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 TAX6mz4WeZmHj74kijq7OGy/XHXi1DBbNi1EZ/S3pHBy0D8vzhmimOx7q6/8chJ7X4GqY7+L+kwsSLm30GlsNHu4tSLfaLSRoon770CtUjT0c8Qf+K6/pTQdttXFLHuB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB9445
Message-ID-Hash: I7X27YE4IFCSCPHTS7FRVL6BSRUXTZID
X-Message-ID-Hash: I7X27YE4IFCSCPHTS7FRVL6BSRUXTZID
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/I7X27YE4IFCSCPHTS7FRVL6BSRUXTZID/>
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
 sound/soc/mediatek/common/mtk-afe-fe-dai.c    | 22 ++++++++--------
 .../mediatek/common/mtk-afe-platform-driver.c |  4 +--
 sound/soc/mediatek/mt2701/mt2701-afe-pcm.c    |  4 +--
 sound/soc/mediatek/mt2701/mt2701-cs42448.c    |  6 ++---
 sound/soc/mediatek/mt2701/mt2701-wm8960.c     |  6 ++---
 sound/soc/mediatek/mt6797/mt6797-afe-pcm.c    |  6 ++---
 sound/soc/mediatek/mt8173/mt8173-afe-pcm.c    |  4 +--
 sound/soc/mediatek/mt8173/mt8173-max98090.c   |  6 ++---
 .../mediatek/mt8173/mt8173-rt5650-rt5514.c    |  4 +--
 .../mediatek/mt8173/mt8173-rt5650-rt5676.c    |  6 ++---
 sound/soc/mediatek/mt8173/mt8173-rt5650.c     |  8 +++---
 sound/soc/mediatek/mt8183/mt8183-afe-pcm.c    |  6 ++---
 .../mediatek/mt8183/mt8183-da7219-max98357.c  | 14 +++++-----
 .../mt8183/mt8183-mt6358-ts3a227-max98357.c   | 18 ++++++-------
 sound/soc/mediatek/mt8186/mt8186-afe-pcm.c    | 12 ++++-----
 .../mediatek/mt8186/mt8186-mt6366-common.c    |  2 +-
 .../mt8186/mt8186-mt6366-da7219-max98357.c    | 14 +++++-----
 .../mt8186/mt8186-mt6366-rt1019-rt5682s.c     | 12 ++++-----
 sound/soc/mediatek/mt8188/mt8188-afe-pcm.c    |  8 +++---
 sound/soc/mediatek/mt8188/mt8188-mt6359.c     | 20 +++++++-------
 sound/soc/mediatek/mt8192/mt8192-afe-pcm.c    |  6 ++---
 .../mt8192/mt8192-mt6359-rt1015-rt5682.c      | 22 ++++++++--------
 sound/soc/mediatek/mt8195/mt8195-afe-pcm.c    | 10 +++----
 sound/soc/mediatek/mt8195/mt8195-mt6359.c     | 26 +++++++++----------
 24 files changed, 123 insertions(+), 123 deletions(-)

diff --git a/sound/soc/mediatek/common/mtk-afe-fe-dai.c b/sound/soc/mediatek/common/mtk-afe-fe-dai.c
index 395be97f13ae0..3044d9ab3d4d9 100644
--- a/sound/soc/mediatek/common/mtk-afe-fe-dai.c
+++ b/sound/soc/mediatek/common/mtk-afe-fe-dai.c
@@ -37,10 +37,10 @@ static int mtk_regmap_write(struct regmap *map, int reg, unsigned int val)
 int mtk_afe_fe_startup(struct snd_pcm_substream *substream,
 		       struct snd_soc_dai *dai)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
 	struct snd_pcm_runtime *runtime = substream->runtime;
-	int memif_num = asoc_rtd_to_cpu(rtd, 0)->id;
+	int memif_num = snd_soc_rtd_to_cpu(rtd, 0)->id;
 	struct mtk_base_afe_memif *memif = &afe->memif[memif_num];
 	const struct snd_pcm_hardware *mtk_afe_hardware = afe->mtk_afe_hardware;
 	int ret;
@@ -98,9 +98,9 @@ EXPORT_SYMBOL_GPL(mtk_afe_fe_startup);
 void mtk_afe_fe_shutdown(struct snd_pcm_substream *substream,
 			 struct snd_soc_dai *dai)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
-	struct mtk_base_afe_memif *memif = &afe->memif[asoc_rtd_to_cpu(rtd, 0)->id];
+	struct mtk_base_afe_memif *memif = &afe->memif[snd_soc_rtd_to_cpu(rtd, 0)->id];
 	int irq_id;
 
 	irq_id = memif->irq_usage;
@@ -120,9 +120,9 @@ int mtk_afe_fe_hw_params(struct snd_pcm_substream *substream,
 			 struct snd_pcm_hw_params *params,
 			 struct snd_soc_dai *dai)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
-	int id = asoc_rtd_to_cpu(rtd, 0)->id;
+	int id = snd_soc_rtd_to_cpu(rtd, 0)->id;
 	struct mtk_base_afe_memif *memif = &afe->memif[id];
 	int ret;
 	unsigned int channels = params_channels(params);
@@ -196,10 +196,10 @@ EXPORT_SYMBOL_GPL(mtk_afe_fe_hw_free);
 int mtk_afe_fe_trigger(struct snd_pcm_substream *substream, int cmd,
 		       struct snd_soc_dai *dai)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_pcm_runtime * const runtime = substream->runtime;
 	struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
-	int id = asoc_rtd_to_cpu(rtd, 0)->id;
+	int id = snd_soc_rtd_to_cpu(rtd, 0)->id;
 	struct mtk_base_afe_memif *memif = &afe->memif[id];
 	struct mtk_base_afe_irq *irqs = &afe->irqs[memif->irq_usage];
 	const struct mtk_base_irq_data *irq_data = irqs->irq_data;
@@ -263,9 +263,9 @@ EXPORT_SYMBOL_GPL(mtk_afe_fe_trigger);
 int mtk_afe_fe_prepare(struct snd_pcm_substream *substream,
 		       struct snd_soc_dai *dai)
 {
-	struct snd_soc_pcm_runtime *rtd  = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd  = snd_soc_substream_to_rtd(substream);
 	struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
-	int id = asoc_rtd_to_cpu(rtd, 0)->id;
+	int id = snd_soc_rtd_to_cpu(rtd, 0)->id;
 	int pbuf_size;
 
 	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
@@ -523,7 +523,7 @@ EXPORT_SYMBOL_GPL(mtk_memif_set_rate);
 int mtk_memif_set_rate_substream(struct snd_pcm_substream *substream,
 				 int id, unsigned int rate)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_component *component =
 		snd_soc_rtdcom_lookup(rtd, AFE_PCM_NAME);
 	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(component);
diff --git a/sound/soc/mediatek/common/mtk-afe-platform-driver.c b/sound/soc/mediatek/common/mtk-afe-platform-driver.c
index 01501d5747a7c..32edcb6d52198 100644
--- a/sound/soc/mediatek/common/mtk-afe-platform-driver.c
+++ b/sound/soc/mediatek/common/mtk-afe-platform-driver.c
@@ -80,9 +80,9 @@ EXPORT_SYMBOL_GPL(mtk_afe_add_sub_dai_control);
 snd_pcm_uframes_t mtk_afe_pcm_pointer(struct snd_soc_component *component,
 				      struct snd_pcm_substream *substream)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(component);
-	struct mtk_base_afe_memif *memif = &afe->memif[asoc_rtd_to_cpu(rtd, 0)->id];
+	struct mtk_base_afe_memif *memif = &afe->memif[snd_soc_rtd_to_cpu(rtd, 0)->id];
 	const struct mtk_base_memif_data *memif_data = memif->data;
 	struct regmap *regmap = afe->regmap;
 	struct device *dev = afe->dev;
diff --git a/sound/soc/mediatek/mt2701/mt2701-afe-pcm.c b/sound/soc/mediatek/mt2701/mt2701-afe-pcm.c
index c9d4420e9b4c1..86885117f7f75 100644
--- a/sound/soc/mediatek/mt2701/mt2701-afe-pcm.c
+++ b/sound/soc/mediatek/mt2701/mt2701-afe-pcm.c
@@ -494,10 +494,10 @@ static int mt2701_dlm_fe_trigger(struct snd_pcm_substream *substream,
 static int mt2701_memif_fs(struct snd_pcm_substream *substream,
 			   unsigned int rate)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	int fs;
 
-	if (asoc_rtd_to_cpu(rtd, 0)->id != MT2701_MEMIF_ULBT)
+	if (snd_soc_rtd_to_cpu(rtd, 0)->id != MT2701_MEMIF_ULBT)
 		fs = mt2701_afe_i2s_fs(rate);
 	else
 		fs = (rate == 16000 ? 1 : 0);
diff --git a/sound/soc/mediatek/mt2701/mt2701-cs42448.c b/sound/soc/mediatek/mt2701/mt2701-cs42448.c
index 08ef109744c7c..fc80e2cfb5b9b 100644
--- a/sound/soc/mediatek/mt2701/mt2701-cs42448.c
+++ b/sound/soc/mediatek/mt2701/mt2701-cs42448.c
@@ -127,9 +127,9 @@ static const struct snd_soc_ops mt2701_cs42448_48k_fe_ops = {
 static int mt2701_cs42448_be_ops_hw_params(struct snd_pcm_substream *substream,
 					   struct snd_pcm_hw_params *params)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
-	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
-	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
+	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
 	unsigned int mclk_rate;
 	unsigned int rate = params_rate(params);
 	unsigned int div_mclk_over_bck = rate > 192000 ? 2 : 4;
diff --git a/sound/soc/mediatek/mt2701/mt2701-wm8960.c b/sound/soc/mediatek/mt2701/mt2701-wm8960.c
index a184032c15b6b..8a6643bfe830e 100644
--- a/sound/soc/mediatek/mt2701/mt2701-wm8960.c
+++ b/sound/soc/mediatek/mt2701/mt2701-wm8960.c
@@ -24,9 +24,9 @@ static const struct snd_kcontrol_new mt2701_wm8960_controls[] = {
 static int mt2701_wm8960_be_ops_hw_params(struct snd_pcm_substream *substream,
 					  struct snd_pcm_hw_params *params)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
-	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
-	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
 	unsigned int mclk_rate;
 	unsigned int rate = params_rate(params);
 	unsigned int div_mclk_over_bck = rate > 192000 ? 2 : 4;
diff --git a/sound/soc/mediatek/mt6797/mt6797-afe-pcm.c b/sound/soc/mediatek/mt6797/mt6797-afe-pcm.c
index 43038444c43dc..da7267c684b17 100644
--- a/sound/soc/mediatek/mt6797/mt6797-afe-pcm.c
+++ b/sound/soc/mediatek/mt6797/mt6797-afe-pcm.c
@@ -139,18 +139,18 @@ static const struct snd_pcm_hardware mt6797_afe_hardware = {
 static int mt6797_memif_fs(struct snd_pcm_substream *substream,
 			   unsigned int rate)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_component *component =
 		snd_soc_rtdcom_lookup(rtd, AFE_PCM_NAME);
 	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(component);
-	int id = asoc_rtd_to_cpu(rtd, 0)->id;
+	int id = snd_soc_rtd_to_cpu(rtd, 0)->id;
 
 	return mt6797_rate_transform(afe->dev, rate, id);
 }
 
 static int mt6797_irq_fs(struct snd_pcm_substream *substream, unsigned int rate)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_component *component =
 		snd_soc_rtdcom_lookup(rtd, AFE_PCM_NAME);
 	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(component);
diff --git a/sound/soc/mediatek/mt8173/mt8173-afe-pcm.c b/sound/soc/mediatek/mt8173/mt8173-afe-pcm.c
index 06269f7e37566..b6291b7c811e5 100644
--- a/sound/soc/mediatek/mt8173/mt8173-afe-pcm.c
+++ b/sound/soc/mediatek/mt8173/mt8173-afe-pcm.c
@@ -480,10 +480,10 @@ static int mt8173_afe_hdmi_trigger(struct snd_pcm_substream *substream, int cmd,
 static int mt8173_memif_fs(struct snd_pcm_substream *substream,
 			   unsigned int rate)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_component *component = snd_soc_rtdcom_lookup(rtd, AFE_PCM_NAME);
 	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(component);
-	struct mtk_base_afe_memif *memif = &afe->memif[asoc_rtd_to_cpu(rtd, 0)->id];
+	struct mtk_base_afe_memif *memif = &afe->memif[snd_soc_rtd_to_cpu(rtd, 0)->id];
 	int fs;
 
 	if (memif->data->id == MT8173_AFE_MEMIF_DAI ||
diff --git a/sound/soc/mediatek/mt8173/mt8173-max98090.c b/sound/soc/mediatek/mt8173/mt8173-max98090.c
index bfb2094758ff2..3c5c22132c927 100644
--- a/sound/soc/mediatek/mt8173/mt8173-max98090.c
+++ b/sound/soc/mediatek/mt8173/mt8173-max98090.c
@@ -52,8 +52,8 @@ static const struct snd_kcontrol_new mt8173_max98090_controls[] = {
 static int mt8173_max98090_hw_params(struct snd_pcm_substream *substream,
 				     struct snd_pcm_hw_params *params)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
-	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
 
 	return snd_soc_dai_set_sysclk(codec_dai, 0, params_rate(params) * 256,
 				      SND_SOC_CLOCK_IN);
@@ -67,7 +67,7 @@ static int mt8173_max98090_init(struct snd_soc_pcm_runtime *runtime)
 {
 	int ret;
 	struct snd_soc_card *card = runtime->card;
-	struct snd_soc_component *component = asoc_rtd_to_codec(runtime, 0)->component;
+	struct snd_soc_component *component = snd_soc_rtd_to_codec(runtime, 0)->component;
 
 	/* enable jack detection */
 	ret = snd_soc_card_jack_new_pins(card, "Headphone", SND_JACK_HEADSET,
diff --git a/sound/soc/mediatek/mt8173/mt8173-rt5650-rt5514.c b/sound/soc/mediatek/mt8173/mt8173-rt5650-rt5514.c
index e502cd1670ba1..fe1235d3de645 100644
--- a/sound/soc/mediatek/mt8173/mt8173-rt5650-rt5514.c
+++ b/sound/soc/mediatek/mt8173/mt8173-rt5650-rt5514.c
@@ -54,7 +54,7 @@ static struct snd_soc_jack_pin mt8173_rt5650_rt5514_jack_pins[] = {
 static int mt8173_rt5650_rt5514_hw_params(struct snd_pcm_substream *substream,
 					  struct snd_pcm_hw_params *params)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_dai *codec_dai;
 	int i, ret;
 
@@ -84,7 +84,7 @@ static struct snd_soc_jack mt8173_rt5650_rt5514_jack;
 static int mt8173_rt5650_rt5514_init(struct snd_soc_pcm_runtime *runtime)
 {
 	struct snd_soc_card *card = runtime->card;
-	struct snd_soc_component *component = asoc_rtd_to_codec(runtime, 0)->component;
+	struct snd_soc_component *component = snd_soc_rtd_to_codec(runtime, 0)->component;
 	int ret;
 
 	rt5645_sel_asrc_clk_src(component,
diff --git a/sound/soc/mediatek/mt8173/mt8173-rt5650-rt5676.c b/sound/soc/mediatek/mt8173/mt8173-rt5650-rt5676.c
index ffb094284bfb1..892387c4dd186 100644
--- a/sound/soc/mediatek/mt8173/mt8173-rt5650-rt5676.c
+++ b/sound/soc/mediatek/mt8173/mt8173-rt5650-rt5676.c
@@ -58,7 +58,7 @@ static struct snd_soc_jack_pin mt8173_rt5650_rt5676_jack_pins[] = {
 static int mt8173_rt5650_rt5676_hw_params(struct snd_pcm_substream *substream,
 					  struct snd_pcm_hw_params *params)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_dai *codec_dai;
 	int i, ret;
 
@@ -88,8 +88,8 @@ static struct snd_soc_jack mt8173_rt5650_rt5676_jack;
 static int mt8173_rt5650_rt5676_init(struct snd_soc_pcm_runtime *runtime)
 {
 	struct snd_soc_card *card = runtime->card;
-	struct snd_soc_component *component = asoc_rtd_to_codec(runtime, 0)->component;
-	struct snd_soc_component *component_sub = asoc_rtd_to_codec(runtime, 1)->component;
+	struct snd_soc_component *component = snd_soc_rtd_to_codec(runtime, 0)->component;
+	struct snd_soc_component *component_sub = snd_soc_rtd_to_codec(runtime, 1)->component;
 	int ret;
 
 	rt5645_sel_asrc_clk_src(component,
diff --git a/sound/soc/mediatek/mt8173/mt8173-rt5650.c b/sound/soc/mediatek/mt8173/mt8173-rt5650.c
index 18cf84bb25c76..0be737a11701c 100644
--- a/sound/soc/mediatek/mt8173/mt8173-rt5650.c
+++ b/sound/soc/mediatek/mt8173/mt8173-rt5650.c
@@ -68,7 +68,7 @@ static struct snd_soc_jack_pin mt8173_rt5650_jack_pins[] = {
 static int mt8173_rt5650_hw_params(struct snd_pcm_substream *substream,
 				   struct snd_pcm_hw_params *params)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	unsigned int mclk_clock;
 	struct snd_soc_dai *codec_dai;
 	int i, ret;
@@ -114,8 +114,8 @@ static struct snd_soc_jack mt8173_rt5650_jack, mt8173_rt5650_hdmi_jack;
 static int mt8173_rt5650_init(struct snd_soc_pcm_runtime *runtime)
 {
 	struct snd_soc_card *card = runtime->card;
-	struct snd_soc_component *component = asoc_rtd_to_codec(runtime, 0)->component;
-	const char *codec_capture_dai = asoc_rtd_to_codec(runtime, 1)->name;
+	struct snd_soc_component *component = snd_soc_rtd_to_codec(runtime, 0)->component;
+	const char *codec_capture_dai = snd_soc_rtd_to_codec(runtime, 1)->name;
 	int ret;
 
 	rt5645_sel_asrc_clk_src(component,
@@ -166,7 +166,7 @@ static int mt8173_rt5650_hdmi_init(struct snd_soc_pcm_runtime *rtd)
 	if (ret)
 		return ret;
 
-	return snd_soc_component_set_jack(asoc_rtd_to_codec(rtd, 0)->component,
+	return snd_soc_component_set_jack(snd_soc_rtd_to_codec(rtd, 0)->component,
 					  &mt8173_rt5650_hdmi_jack, NULL);
 }
 
diff --git a/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c b/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c
index 90422ed2bbcc2..9e432ed9124b9 100644
--- a/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c
+++ b/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c
@@ -142,18 +142,18 @@ static const struct snd_pcm_hardware mt8183_afe_hardware = {
 static int mt8183_memif_fs(struct snd_pcm_substream *substream,
 			   unsigned int rate)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_component *component =
 		snd_soc_rtdcom_lookup(rtd, AFE_PCM_NAME);
 	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(component);
-	int id = asoc_rtd_to_cpu(rtd, 0)->id;
+	int id = snd_soc_rtd_to_cpu(rtd, 0)->id;
 
 	return mt8183_rate_transform(afe->dev, rate, id);
 }
 
 static int mt8183_irq_fs(struct snd_pcm_substream *substream, unsigned int rate)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_component *component =
 		snd_soc_rtdcom_lookup(rtd, AFE_PCM_NAME);
 	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(component);
diff --git a/sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c b/sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c
index 701fbcc0f2c9c..a0b4eeece9b73 100644
--- a/sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c
+++ b/sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c
@@ -47,12 +47,12 @@ static struct snd_soc_jack_pin mt8183_da7219_max98357_jack_pins[] = {
 static int mt8183_mt6358_i2s_hw_params(struct snd_pcm_substream *substream,
 				       struct snd_pcm_hw_params *params)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	unsigned int rate = params_rate(params);
 	unsigned int mclk_fs_ratio = 128;
 	unsigned int mclk_fs = rate * mclk_fs_ratio;
 
-	return snd_soc_dai_set_sysclk(asoc_rtd_to_cpu(rtd, 0),
+	return snd_soc_dai_set_sysclk(snd_soc_rtd_to_cpu(rtd, 0),
 				      0, mclk_fs, SND_SOC_CLOCK_OUT);
 }
 
@@ -63,7 +63,7 @@ static const struct snd_soc_ops mt8183_mt6358_i2s_ops = {
 static int mt8183_da7219_i2s_hw_params(struct snd_pcm_substream *substream,
 				       struct snd_pcm_hw_params *params)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_dai *codec_dai;
 	unsigned int rate = params_rate(params);
 	unsigned int mclk_fs_ratio = 256;
@@ -71,7 +71,7 @@ static int mt8183_da7219_i2s_hw_params(struct snd_pcm_substream *substream,
 	unsigned int freq;
 	int ret = 0, j;
 
-	ret = snd_soc_dai_set_sysclk(asoc_rtd_to_cpu(rtd, 0), 0,
+	ret = snd_soc_dai_set_sysclk(snd_soc_rtd_to_cpu(rtd, 0), 0,
 				     mclk_fs, SND_SOC_CLOCK_OUT);
 	if (ret < 0)
 		dev_err(rtd->dev, "failed to set cpu dai sysclk\n");
@@ -104,7 +104,7 @@ static int mt8183_da7219_i2s_hw_params(struct snd_pcm_substream *substream,
 
 static int mt8183_da7219_hw_free(struct snd_pcm_substream *substream)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_dai *codec_dai;
 	int ret = 0, j;
 
@@ -132,7 +132,7 @@ static int
 mt8183_da7219_rt1015_i2s_hw_params(struct snd_pcm_substream *substream,
 				   struct snd_pcm_hw_params *params)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	unsigned int rate = params_rate(params);
 	struct snd_soc_dai *codec_dai;
 	int ret = 0, i;
@@ -383,7 +383,7 @@ static int mt8183_da7219_max98357_hdmi_init(struct snd_soc_pcm_runtime *rtd)
 	if (ret)
 		return ret;
 
-	return snd_soc_component_set_jack(asoc_rtd_to_codec(rtd, 0)->component,
+	return snd_soc_component_set_jack(snd_soc_rtd_to_codec(rtd, 0)->component,
 					  &priv->hdmi_jack, NULL);
 }
 
diff --git a/sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c b/sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c
index 850f4d949d978..1771c26b04454 100644
--- a/sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c
+++ b/sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c
@@ -43,12 +43,12 @@ struct mt8183_mt6358_ts3a227_max98357_priv {
 static int mt8183_mt6358_i2s_hw_params(struct snd_pcm_substream *substream,
 				       struct snd_pcm_hw_params *params)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	unsigned int rate = params_rate(params);
 	unsigned int mclk_fs_ratio = 128;
 	unsigned int mclk_fs = rate * mclk_fs_ratio;
 
-	return snd_soc_dai_set_sysclk(asoc_rtd_to_cpu(rtd, 0),
+	return snd_soc_dai_set_sysclk(snd_soc_rtd_to_cpu(rtd, 0),
 				      0, mclk_fs, SND_SOC_CLOCK_OUT);
 }
 
@@ -60,7 +60,7 @@ static int
 mt8183_mt6358_rt1015_i2s_hw_params(struct snd_pcm_substream *substream,
 				   struct snd_pcm_hw_params *params)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	unsigned int rate = params_rate(params);
 	unsigned int mclk_fs_ratio = 128;
 	unsigned int mclk_fs = rate * mclk_fs_ratio;
@@ -84,7 +84,7 @@ mt8183_mt6358_rt1015_i2s_hw_params(struct snd_pcm_substream *substream,
 		}
 	}
 
-	return snd_soc_dai_set_sysclk(asoc_rtd_to_cpu(rtd, 0),
+	return snd_soc_dai_set_sysclk(snd_soc_rtd_to_cpu(rtd, 0),
 				      0, mclk_fs, SND_SOC_CLOCK_OUT);
 }
 
@@ -302,7 +302,7 @@ SND_SOC_DAILINK_DEFS(tdm,
 
 static int mt8183_mt6358_tdm_startup(struct snd_pcm_substream *substream)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct mt8183_mt6358_ts3a227_max98357_priv *priv =
 		snd_soc_card_get_drvdata(rtd->card);
 	int ret;
@@ -321,7 +321,7 @@ static int mt8183_mt6358_tdm_startup(struct snd_pcm_substream *substream)
 
 static void mt8183_mt6358_tdm_shutdown(struct snd_pcm_substream *substream)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct mt8183_mt6358_ts3a227_max98357_priv *priv =
 		snd_soc_card_get_drvdata(rtd->card);
 	int ret;
@@ -345,7 +345,7 @@ static int
 mt8183_mt6358_ts3a227_max98357_wov_startup(
 	struct snd_pcm_substream *substream)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_card *card = rtd->card;
 	struct mt8183_mt6358_ts3a227_max98357_priv *priv =
 			snd_soc_card_get_drvdata(card);
@@ -358,7 +358,7 @@ static void
 mt8183_mt6358_ts3a227_max98357_wov_shutdown(
 	struct snd_pcm_substream *substream)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_card *card = rtd->card;
 	struct mt8183_mt6358_ts3a227_max98357_priv *priv =
 			snd_soc_card_get_drvdata(card);
@@ -388,7 +388,7 @@ mt8183_mt6358_ts3a227_max98357_hdmi_init(struct snd_soc_pcm_runtime *rtd)
 	if (ret)
 		return ret;
 
-	return snd_soc_component_set_jack(asoc_rtd_to_codec(rtd, 0)->component,
+	return snd_soc_component_set_jack(snd_soc_rtd_to_codec(rtd, 0)->component,
 					  &priv->hdmi_jack, NULL);
 }
 
diff --git a/sound/soc/mediatek/mt8186/mt8186-afe-pcm.c b/sound/soc/mediatek/mt8186/mt8186-afe-pcm.c
index b86159f70a33a..bfcfc68ac64d9 100644
--- a/sound/soc/mediatek/mt8186/mt8186-afe-pcm.c
+++ b/sound/soc/mediatek/mt8186/mt8186-afe-pcm.c
@@ -43,7 +43,7 @@ static int mt8186_fe_startup(struct snd_pcm_substream *substream,
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
 	struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
 	struct snd_pcm_runtime *runtime = substream->runtime;
-	int id = asoc_rtd_to_cpu(rtd, 0)->id;
+	int id = snd_soc_rtd_to_cpu(rtd, 0)->id;
 	struct mtk_base_afe_memif *memif = &afe->memif[id];
 	const struct snd_pcm_hardware *mtk_afe_hardware = afe->mtk_afe_hardware;
 	int ret;
@@ -85,7 +85,7 @@ static void mt8186_fe_shutdown(struct snd_pcm_substream *substream,
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
 	struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
 	struct mt8186_afe_private *afe_priv = afe->platform_priv;
-	int id = asoc_rtd_to_cpu(rtd, 0)->id;
+	int id = snd_soc_rtd_to_cpu(rtd, 0)->id;
 	struct mtk_base_afe_memif *memif = &afe->memif[id];
 	int irq_id = memif->irq_usage;
 
@@ -106,7 +106,7 @@ static int mt8186_fe_hw_params(struct snd_pcm_substream *substream,
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
 	struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
-	int id = asoc_rtd_to_cpu(rtd, 0)->id;
+	int id = snd_soc_rtd_to_cpu(rtd, 0)->id;
 	unsigned int channels = params_channels(params);
 	unsigned int rate = params_rate(params);
 	int ret;
@@ -157,7 +157,7 @@ static int mt8186_fe_trigger(struct snd_pcm_substream *substream, int cmd,
 	struct snd_pcm_runtime * const runtime = substream->runtime;
 	struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
 	struct mt8186_afe_private *afe_priv = afe->platform_priv;
-	int id = asoc_rtd_to_cpu(rtd, 0)->id;
+	int id = snd_soc_rtd_to_cpu(rtd, 0)->id;
 	struct mtk_base_afe_memif *memif = &afe->memif[id];
 	int irq_id = memif->irq_usage;
 	struct mtk_base_afe_irq *irqs = &afe->irqs[irq_id];
@@ -256,7 +256,7 @@ static int mt8186_memif_fs(struct snd_pcm_substream *substream,
 	struct snd_soc_component *component =
 		snd_soc_rtdcom_lookup(rtd, AFE_PCM_NAME);
 	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(component);
-	int id = asoc_rtd_to_cpu(rtd, 0)->id;
+	int id = snd_soc_rtd_to_cpu(rtd, 0)->id;
 
 	return mt8186_rate_transform(afe->dev, rate, id);
 }
@@ -293,7 +293,7 @@ static int mt8186_fe_prepare(struct snd_pcm_substream *substream,
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
 	struct snd_pcm_runtime * const runtime = substream->runtime;
 	struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
-	int id = asoc_rtd_to_cpu(rtd, 0)->id;
+	int id = snd_soc_rtd_to_cpu(rtd, 0)->id;
 	struct mtk_base_afe_memif *memif = &afe->memif[id];
 	int irq_id = memif->irq_usage;
 	struct mtk_base_afe_irq *irqs = &afe->irqs[irq_id];
diff --git a/sound/soc/mediatek/mt8186/mt8186-mt6366-common.c b/sound/soc/mediatek/mt8186/mt8186-mt6366-common.c
index 4e66603d4cdbd..fa08eb0654d88 100644
--- a/sound/soc/mediatek/mt8186/mt8186-mt6366-common.c
+++ b/sound/soc/mediatek/mt8186/mt8186-mt6366-common.c
@@ -18,7 +18,7 @@ int mt8186_mt6366_init(struct snd_soc_pcm_runtime *rtd)
 	struct snd_soc_component *cmpnt_afe =
 		snd_soc_rtdcom_lookup(rtd, AFE_PCM_NAME);
 	struct snd_soc_component *cmpnt_codec =
-		asoc_rtd_to_codec(rtd, 0)->component;
+		snd_soc_rtd_to_codec(rtd, 0)->component;
 	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(cmpnt_afe);
 	struct mt8186_afe_private *afe_priv = afe->platform_priv;
 	struct snd_soc_dapm_context *dapm = &rtd->card->dapm;
diff --git a/sound/soc/mediatek/mt8186/mt8186-mt6366-da7219-max98357.c b/sound/soc/mediatek/mt8186/mt8186-mt6366-da7219-max98357.c
index aa8e00bba19b2..f795190f92a28 100644
--- a/sound/soc/mediatek/mt8186/mt8186-mt6366-da7219-max98357.c
+++ b/sound/soc/mediatek/mt8186/mt8186-mt6366-da7219-max98357.c
@@ -77,7 +77,7 @@ static int mt8186_da7219_init(struct snd_soc_pcm_runtime *rtd)
 	struct mt8186_mt6366_da7219_max98357_priv *priv = soc_card_data->mach_priv;
 	struct snd_soc_jack *jack = &priv->headset_jack;
 	struct snd_soc_component *cmpnt_codec =
-		asoc_rtd_to_codec(rtd, 0)->component;
+		snd_soc_rtd_to_codec(rtd, 0)->component;
 	int ret;
 
 	ret = mt8186_dai_i2s_set_share(afe, "I2S1", "I2S0");
@@ -111,7 +111,7 @@ static int mt8186_da7219_init(struct snd_soc_pcm_runtime *rtd)
 static int mt8186_da7219_i2s_hw_params(struct snd_pcm_substream *substream,
 				       struct snd_pcm_hw_params *params)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_dai *codec_dai;
 	unsigned int rate = params_rate(params);
 	unsigned int mclk_fs_ratio = 256;
@@ -119,7 +119,7 @@ static int mt8186_da7219_i2s_hw_params(struct snd_pcm_substream *substream,
 	unsigned int freq;
 	int ret, j;
 
-	ret = snd_soc_dai_set_sysclk(asoc_rtd_to_cpu(rtd, 0), 0,
+	ret = snd_soc_dai_set_sysclk(snd_soc_rtd_to_cpu(rtd, 0), 0,
 				     mclk_fs, SND_SOC_CLOCK_OUT);
 	if (ret < 0) {
 		dev_err(rtd->dev, "failed to set cpu dai sysclk: %d\n", ret);
@@ -159,7 +159,7 @@ static int mt8186_da7219_i2s_hw_params(struct snd_pcm_substream *substream,
 
 static int mt8186_da7219_i2s_hw_free(struct snd_pcm_substream *substream)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_dai *codec_dai;
 	int ret = 0, j;
 
@@ -189,7 +189,7 @@ static int mt8186_mt6366_da7219_max98357_hdmi_init(struct snd_soc_pcm_runtime *r
 		snd_soc_rtdcom_lookup(rtd, AFE_PCM_NAME);
 	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(cmpnt_afe);
 	struct snd_soc_component *cmpnt_codec =
-		asoc_rtd_to_codec(rtd, 0)->component;
+		snd_soc_rtd_to_codec(rtd, 0)->component;
 	struct mtk_soc_card_data *soc_card_data =
 		snd_soc_card_get_drvdata(rtd->card);
 	struct mt8186_mt6366_da7219_max98357_priv *priv = soc_card_data->mach_priv;
@@ -281,7 +281,7 @@ static int mt8186_mt6366_da7219_max98357_playback_startup(struct snd_pcm_substre
 		.mask = 0,
 	};
 
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	int ret;
 
@@ -327,7 +327,7 @@ static int mt8186_mt6366_da7219_max98357_capture_startup(struct snd_pcm_substrea
 		.mask = 0,
 	};
 
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	int ret;
 
diff --git a/sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c b/sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c
index 9c11016f032c2..6be33892be0a7 100644
--- a/sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c
+++ b/sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c
@@ -169,7 +169,7 @@ static int mt8186_rt5682s_init(struct snd_soc_pcm_runtime *rtd)
 	struct mt8186_mt6366_rt1019_rt5682s_priv *priv = soc_card_data->mach_priv;
 	struct snd_soc_jack *jack = &priv->headset_jack;
 	struct snd_soc_component *cmpnt_codec =
-		asoc_rtd_to_codec(rtd, 0)->component;
+		snd_soc_rtd_to_codec(rtd, 0)->component;
 	int ret;
 
 	ret = mt8186_dai_i2s_set_share(afe, "I2S1", "I2S0");
@@ -202,8 +202,8 @@ static int mt8186_rt5682s_i2s_hw_params(struct snd_pcm_substream *substream,
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
 	struct snd_soc_card *card = rtd->card;
-	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
-	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
+	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
 	unsigned int rate = params_rate(params);
 	unsigned int mclk_fs_ratio = 128;
 	unsigned int mclk_fs = rate * mclk_fs_ratio;
@@ -253,7 +253,7 @@ static int mt8186_mt6366_rt1019_rt5682s_hdmi_init(struct snd_soc_pcm_runtime *rt
 		snd_soc_rtdcom_lookup(rtd, AFE_PCM_NAME);
 	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(cmpnt_afe);
 	struct snd_soc_component *cmpnt_codec =
-		asoc_rtd_to_codec(rtd, 0)->component;
+		snd_soc_rtd_to_codec(rtd, 0)->component;
 	struct mtk_soc_card_data *soc_card_data =
 		snd_soc_card_get_drvdata(rtd->card);
 	struct mt8186_mt6366_rt1019_rt5682s_priv *priv = soc_card_data->mach_priv;
@@ -345,7 +345,7 @@ static int mt8186_mt6366_rt1019_rt5682s_playback_startup(struct snd_pcm_substrea
 		.mask = 0,
 	};
 
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	int ret;
 
@@ -391,7 +391,7 @@ static int mt8186_mt6366_rt1019_rt5682s_capture_startup(struct snd_pcm_substream
 		.mask = 0,
 	};
 
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	int ret;
 
diff --git a/sound/soc/mediatek/mt8188/mt8188-afe-pcm.c b/sound/soc/mediatek/mt8188/mt8188-afe-pcm.c
index 5e14655c5617e..46d6a55404037 100644
--- a/sound/soc/mediatek/mt8188/mt8188-afe-pcm.c
+++ b/sound/soc/mediatek/mt8188/mt8188-afe-pcm.c
@@ -98,7 +98,7 @@ static int mt8188_memif_fs(struct snd_pcm_substream *substream,
 	struct mtk_base_afe_memif *memif = NULL;
 	struct mtk_dai_memif_priv *memif_priv = NULL;
 	int fs = mt8188_afe_fs_timing(rate);
-	int id = asoc_rtd_to_cpu(rtd, 0)->id;
+	int id = snd_soc_rtd_to_cpu(rtd, 0)->id;
 
 	if (id < 0)
 		return -EINVAL;
@@ -303,7 +303,7 @@ static int mt8188_afe_fe_startup(struct snd_pcm_substream *substream,
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
-	int id = asoc_rtd_to_cpu(rtd, 0)->id;
+	int id = snd_soc_rtd_to_cpu(rtd, 0)->id;
 	int ret;
 
 	ret = mtk_afe_fe_startup(substream, dai);
@@ -336,7 +336,7 @@ static int mt8188_afe_fe_hw_params(struct snd_pcm_substream *substream,
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
 	struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
-	int id = asoc_rtd_to_cpu(rtd, 0)->id;
+	int id = snd_soc_rtd_to_cpu(rtd, 0)->id;
 	struct mtk_base_afe_memif *memif = &afe->memif[id];
 	const struct mtk_base_memif_data *data = memif->data;
 	const struct mt8188_afe_channel_merge *cm = mt8188_afe_found_cm(dai);
@@ -360,7 +360,7 @@ static int mt8188_afe_fe_trigger(struct snd_pcm_substream *substream, int cmd,
 	const struct mt8188_afe_channel_merge *cm = mt8188_afe_found_cm(dai);
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
 	struct snd_pcm_runtime * const runtime = substream->runtime;
-	int id = asoc_rtd_to_cpu(rtd, 0)->id;
+	int id = snd_soc_rtd_to_cpu(rtd, 0)->id;
 	struct mtk_base_afe_memif *memif = &afe->memif[id];
 	struct mtk_base_afe_irq *irqs = &afe->irqs[memif->irq_usage];
 	const struct mtk_base_irq_data *irq_data = irqs->irq_data;
diff --git a/sound/soc/mediatek/mt8188/mt8188-mt6359.c b/sound/soc/mediatek/mt8188/mt8188-mt6359.c
index 9017f48b6272b..bd736c5fa15c0 100644
--- a/sound/soc/mediatek/mt8188/mt8188-mt6359.c
+++ b/sound/soc/mediatek/mt8188/mt8188-mt6359.c
@@ -266,7 +266,7 @@ static int mt8188_mt6359_mtkaif_calibration(struct snd_soc_pcm_runtime *rtd)
 	struct snd_soc_component *cmpnt_afe =
 		snd_soc_rtdcom_lookup(rtd, AFE_PCM_NAME);
 	struct snd_soc_component *cmpnt_codec =
-		asoc_rtd_to_codec(rtd, 0)->component;
+		snd_soc_rtd_to_codec(rtd, 0)->component;
 	struct mtk_base_afe *afe;
 	struct mt8188_afe_private *afe_priv;
 	struct mtkaif_param *param;
@@ -412,7 +412,7 @@ static int mt8188_mt6359_mtkaif_calibration(struct snd_soc_pcm_runtime *rtd)
 static int mt8188_mt6359_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct snd_soc_component *cmpnt_codec =
-		asoc_rtd_to_codec(rtd, 0)->component;
+		snd_soc_rtd_to_codec(rtd, 0)->component;
 
 	/* set mtkaif protocol */
 	mt6359_set_mtkaif_protocol(cmpnt_codec,
@@ -459,7 +459,7 @@ static int mt8188_dptx_hw_params(struct snd_pcm_substream *substream,
 	unsigned int rate = params_rate(params);
 	unsigned int mclk_fs_ratio = 256;
 	unsigned int mclk_fs = rate * mclk_fs_ratio;
-	struct snd_soc_dai *dai = asoc_rtd_to_cpu(rtd, 0);
+	struct snd_soc_dai *dai = snd_soc_rtd_to_cpu(rtd, 0);
 
 	return snd_soc_dai_set_sysclk(dai, 0, mclk_fs, SND_SOC_CLOCK_OUT);
 }
@@ -483,7 +483,7 @@ static int mt8188_dptx_hw_params_fixup(struct snd_soc_pcm_runtime *rtd,
 static int mt8188_hdmi_codec_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct mt8188_mt6359_priv *priv = snd_soc_card_get_drvdata(rtd->card);
-	struct snd_soc_component *component = asoc_rtd_to_codec(rtd, 0)->component;
+	struct snd_soc_component *component = snd_soc_rtd_to_codec(rtd, 0)->component;
 	int ret = 0;
 
 	ret = snd_soc_card_jack_new_pins(rtd->card, "HDMI Jack",
@@ -508,7 +508,7 @@ static int mt8188_hdmi_codec_init(struct snd_soc_pcm_runtime *rtd)
 static int mt8188_dptx_codec_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct mt8188_mt6359_priv *priv = snd_soc_card_get_drvdata(rtd->card);
-	struct snd_soc_component *component = asoc_rtd_to_codec(rtd, 0)->component;
+	struct snd_soc_component *component = snd_soc_rtd_to_codec(rtd, 0)->component;
 	int ret = 0;
 
 	ret = snd_soc_card_jack_new_pins(rtd->card, "DP Jack", SND_JACK_LINEOUT,
@@ -556,7 +556,7 @@ static int mt8188_max98390_hw_params(struct snd_pcm_substream *substream,
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
 	unsigned int bit_width = params_width(params);
-	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
 	struct snd_soc_dai *codec_dai;
 	int i;
 
@@ -628,7 +628,7 @@ static int mt8188_nau8825_codec_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct snd_soc_card *card = rtd->card;
 	struct mt8188_mt6359_priv *priv = snd_soc_card_get_drvdata(card);
-	struct snd_soc_component *component = asoc_rtd_to_codec(rtd, 0)->component;
+	struct snd_soc_component *component = snd_soc_rtd_to_codec(rtd, 0)->component;
 	struct snd_soc_jack *jack = &priv->headset_jack;
 	int ret;
 
@@ -674,7 +674,7 @@ static int mt8188_nau8825_codec_init(struct snd_soc_pcm_runtime *rtd)
 
 static void mt8188_nau8825_codec_exit(struct snd_soc_pcm_runtime *rtd)
 {
-	struct snd_soc_component *component = asoc_rtd_to_codec(rtd, 0)->component;
+	struct snd_soc_component *component = snd_soc_rtd_to_codec(rtd, 0)->component;
 
 	snd_soc_component_set_jack(component, NULL, NULL);
 }
@@ -682,8 +682,8 @@ static void mt8188_nau8825_codec_exit(struct snd_soc_pcm_runtime *rtd)
 static int mt8188_nau8825_hw_params(struct snd_pcm_substream *substream,
 				    struct snd_pcm_hw_params *params)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
-	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
 	unsigned int rate = params_rate(params);
 	unsigned int bit_width = params_width(params);
 	int clk_freq, ret;
diff --git a/sound/soc/mediatek/mt8192/mt8192-afe-pcm.c b/sound/soc/mediatek/mt8192/mt8192-afe-pcm.c
index d0520e7e1d79a..bdd1e91824d9c 100644
--- a/sound/soc/mediatek/mt8192/mt8192-afe-pcm.c
+++ b/sound/soc/mediatek/mt8192/mt8192-afe-pcm.c
@@ -42,11 +42,11 @@ static const struct snd_pcm_hardware mt8192_afe_hardware = {
 static int mt8192_memif_fs(struct snd_pcm_substream *substream,
 			   unsigned int rate)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_component *component =
 		snd_soc_rtdcom_lookup(rtd, AFE_PCM_NAME);
 	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(component);
-	int id = asoc_rtd_to_cpu(rtd, 0)->id;
+	int id = snd_soc_rtd_to_cpu(rtd, 0)->id;
 
 	return mt8192_rate_transform(afe->dev, rate, id);
 }
@@ -59,7 +59,7 @@ static int mt8192_get_dai_fs(struct mtk_base_afe *afe,
 
 static int mt8192_irq_fs(struct snd_pcm_substream *substream, unsigned int rate)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_component *component =
 		snd_soc_rtdcom_lookup(rtd, AFE_PCM_NAME);
 	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(component);
diff --git a/sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c b/sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c
index 5e163e23a2076..fe3562ea83ce9 100644
--- a/sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c
+++ b/sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c
@@ -58,9 +58,9 @@ static struct snd_soc_jack_pin mt8192_jack_pins[] = {
 static int mt8192_rt1015_i2s_hw_params(struct snd_pcm_substream *substream,
 				       struct snd_pcm_hw_params *params)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_card *card = rtd->card;
-	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
 	struct snd_soc_dai *codec_dai;
 	unsigned int rate = params_rate(params);
 	unsigned int mclk_fs_ratio = 128;
@@ -93,10 +93,10 @@ static int mt8192_rt1015_i2s_hw_params(struct snd_pcm_substream *substream,
 static int mt8192_rt5682x_i2s_hw_params(struct snd_pcm_substream *substream,
 					struct snd_pcm_hw_params *params)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_card *card = rtd->card;
-	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
-	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
+	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
 	unsigned int rate = params_rate(params);
 	unsigned int mclk_fs_ratio = 128;
 	unsigned int mclk_fs = rate * mclk_fs_ratio;
@@ -149,7 +149,7 @@ static int mt8192_mt6359_mtkaif_calibration(struct snd_soc_pcm_runtime *rtd)
 	struct snd_soc_component *cmpnt_afe =
 		snd_soc_rtdcom_lookup(rtd, AFE_PCM_NAME);
 	struct snd_soc_component *cmpnt_codec =
-		asoc_rtd_to_codec(rtd, 0)->component;
+		snd_soc_rtd_to_codec(rtd, 0)->component;
 	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(cmpnt_afe);
 	struct mt8192_afe_private *afe_priv = afe->platform_priv;
 	int phase;
@@ -306,7 +306,7 @@ static int mt8192_mt6359_init(struct snd_soc_pcm_runtime *rtd)
 	struct snd_soc_component *cmpnt_afe =
 		snd_soc_rtdcom_lookup(rtd, AFE_PCM_NAME);
 	struct snd_soc_component *cmpnt_codec =
-		asoc_rtd_to_codec(rtd, 0)->component;
+		snd_soc_rtd_to_codec(rtd, 0)->component;
 	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(cmpnt_afe);
 	struct mt8192_afe_private *afe_priv = afe->platform_priv;
 
@@ -327,7 +327,7 @@ static int mt8192_rt5682_init(struct snd_soc_pcm_runtime *rtd)
 		snd_soc_rtdcom_lookup(rtd, AFE_PCM_NAME);
 	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(cmpnt_afe);
 	struct snd_soc_component *cmpnt_codec =
-		asoc_rtd_to_codec(rtd, 0)->component;
+		snd_soc_rtd_to_codec(rtd, 0)->component;
 	struct mt8192_mt6359_priv *priv = snd_soc_card_get_drvdata(rtd->card);
 	struct snd_soc_jack *jack = &priv->headset_jack;
 	int ret;
@@ -360,7 +360,7 @@ static int mt8192_rt5682_init(struct snd_soc_pcm_runtime *rtd)
 static int mt8192_mt6359_hdmi_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct snd_soc_component *cmpnt_codec =
-		asoc_rtd_to_codec(rtd, 0)->component;
+		snd_soc_rtd_to_codec(rtd, 0)->component;
 	struct mt8192_mt6359_priv *priv = snd_soc_card_get_drvdata(rtd->card);
 	int ret;
 
@@ -406,7 +406,7 @@ mt8192_mt6359_cap1_startup(struct snd_pcm_substream *substream)
 		.mask = 0,
 	};
 
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	int ret;
 
@@ -453,7 +453,7 @@ mt8192_mt6359_rt5682_startup(struct snd_pcm_substream *substream)
 		.mask = 0,
 	};
 
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	int ret;
 
diff --git a/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c b/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
index a0f2012211fb3..1e33863c85ca0 100644
--- a/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
+++ b/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
@@ -88,7 +88,7 @@ static int mt8195_memif_fs(struct snd_pcm_substream *substream,
 	struct snd_soc_component *component =
 			snd_soc_rtdcom_lookup(rtd, AFE_PCM_NAME);
 	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(component);
-	int id = asoc_rtd_to_cpu(rtd, 0)->id;
+	int id = snd_soc_rtd_to_cpu(rtd, 0)->id;
 	struct mtk_base_afe_memif *memif = &afe->memif[id];
 	int fs = mt8195_afe_fs_timing(rate);
 
@@ -284,7 +284,7 @@ mt8195_afe_paired_memif_clk_prepare(struct snd_pcm_substream *substream,
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
 	struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
 	struct mt8195_afe_private *afe_priv = afe->platform_priv;
-	int id = asoc_rtd_to_cpu(rtd, 0)->id;
+	int id = snd_soc_rtd_to_cpu(rtd, 0)->id;
 	int clk_id;
 
 	if (id != MT8195_AFE_MEMIF_DL8 && id != MT8195_AFE_MEMIF_DL10)
@@ -313,7 +313,7 @@ mt8195_afe_paired_memif_clk_enable(struct snd_pcm_substream *substream,
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
 	struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
 	struct mt8195_afe_private *afe_priv = afe->platform_priv;
-	int id = asoc_rtd_to_cpu(rtd, 0)->id;
+	int id = snd_soc_rtd_to_cpu(rtd, 0)->id;
 	int clk_id;
 
 	if (id != MT8195_AFE_MEMIF_DL8 && id != MT8195_AFE_MEMIF_DL10)
@@ -345,7 +345,7 @@ static int mt8195_afe_fe_startup(struct snd_pcm_substream *substream,
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
-	int id = asoc_rtd_to_cpu(rtd, 0)->id;
+	int id = snd_soc_rtd_to_cpu(rtd, 0)->id;
 	int ret = 0;
 
 	mt8195_afe_paired_memif_clk_prepare(substream, dai, 1);
@@ -382,7 +382,7 @@ static int mt8195_afe_fe_hw_params(struct snd_pcm_substream *substream,
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
 	struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
-	int id = asoc_rtd_to_cpu(rtd, 0)->id;
+	int id = snd_soc_rtd_to_cpu(rtd, 0)->id;
 	struct mtk_base_afe_memif *memif = &afe->memif[id];
 	const struct mtk_base_memif_data *data = memif->data;
 	const struct mt8195_afe_channel_merge *cm = mt8195_afe_found_cm(dai);
diff --git a/sound/soc/mediatek/mt8195/mt8195-mt6359.c b/sound/soc/mediatek/mt8195/mt8195-mt6359.c
index ceca882ecff7b..9138f38861ffd 100644
--- a/sound/soc/mediatek/mt8195/mt8195-mt6359.c
+++ b/sound/soc/mediatek/mt8195/mt8195-mt6359.c
@@ -146,7 +146,7 @@ static int mt8195_mt6359_mtkaif_calibration(struct snd_soc_pcm_runtime *rtd)
 	struct snd_soc_component *cmpnt_afe =
 		snd_soc_rtdcom_lookup(rtd, AFE_PCM_NAME);
 	struct snd_soc_component *cmpnt_codec =
-		asoc_rtd_to_codec(rtd, 0)->component;
+		snd_soc_rtd_to_codec(rtd, 0)->component;
 	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(cmpnt_afe);
 	struct mt8195_afe_private *afe_priv = afe->platform_priv;
 	struct mtkaif_param *param = &afe_priv->mtkaif_params;
@@ -307,7 +307,7 @@ static int mt8195_mt6359_mtkaif_calibration(struct snd_soc_pcm_runtime *rtd)
 static int mt8195_mt6359_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct snd_soc_component *cmpnt_codec =
-		asoc_rtd_to_codec(rtd, 0)->component;
+		snd_soc_rtd_to_codec(rtd, 0)->component;
 
 	/* set mtkaif protocol */
 	mt6359_set_mtkaif_protocol(cmpnt_codec,
@@ -338,7 +338,7 @@ static int mt8195_hdmitx_dptx_startup(struct snd_pcm_substream *substream)
 		.mask = 0,
 	};
 
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	int ret;
 
@@ -369,7 +369,7 @@ static int mt8195_dptx_hw_params(struct snd_pcm_substream *substream,
 				 struct snd_pcm_hw_params *params)
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
-	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
 
 	return snd_soc_dai_set_sysclk(cpu_dai, 0, params_rate(params) * 256,
 				      SND_SOC_CLOCK_OUT);
@@ -384,7 +384,7 @@ static int mt8195_dptx_codec_init(struct snd_soc_pcm_runtime *rtd)
 	struct mtk_soc_card_data *soc_card_data = snd_soc_card_get_drvdata(rtd->card);
 	struct mt8195_mt6359_priv *priv = soc_card_data->mach_priv;
 	struct snd_soc_component *cmpnt_codec =
-		asoc_rtd_to_codec(rtd, 0)->component;
+		snd_soc_rtd_to_codec(rtd, 0)->component;
 	int ret;
 
 	ret = snd_soc_card_jack_new(rtd->card, "DP Jack", SND_JACK_LINEOUT,
@@ -400,7 +400,7 @@ static int mt8195_hdmi_codec_init(struct snd_soc_pcm_runtime *rtd)
 	struct mtk_soc_card_data *soc_card_data = snd_soc_card_get_drvdata(rtd->card);
 	struct mt8195_mt6359_priv *priv = soc_card_data->mach_priv;
 	struct snd_soc_component *cmpnt_codec =
-		asoc_rtd_to_codec(rtd, 0)->component;
+		snd_soc_rtd_to_codec(rtd, 0)->component;
 	int ret;
 
 	ret = snd_soc_card_jack_new(rtd->card, "HDMI Jack", SND_JACK_LINEOUT,
@@ -442,7 +442,7 @@ static int mt8195_playback_startup(struct snd_pcm_substream *substream)
 		.mask = 0,
 	};
 
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	int ret;
 
@@ -488,7 +488,7 @@ static int mt8195_capture_startup(struct snd_pcm_substream *substream)
 		.mask = 0,
 	};
 
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	int ret;
 
@@ -520,8 +520,8 @@ static int mt8195_rt5682_etdm_hw_params(struct snd_pcm_substream *substream,
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
 	struct snd_soc_card *card = rtd->card;
-	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
-	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
+	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
 	unsigned int rate = params_rate(params);
 	int bitwidth;
 	int ret;
@@ -563,7 +563,7 @@ static const struct snd_soc_ops mt8195_rt5682_etdm_ops = {
 static int mt8195_rt5682_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct snd_soc_component *cmpnt_codec =
-		asoc_rtd_to_codec(rtd, 0)->component;
+		snd_soc_rtd_to_codec(rtd, 0)->component;
 	struct mtk_soc_card_data *soc_card_data = snd_soc_card_get_drvdata(rtd->card);
 	struct mt8195_mt6359_priv *priv = soc_card_data->mach_priv;
 	struct snd_soc_jack *jack = &priv->headset_jack;
@@ -603,7 +603,7 @@ static int mt8195_rt5682_init(struct snd_soc_pcm_runtime *rtd)
 static int mt8195_rt1011_etdm_hw_params(struct snd_pcm_substream *substream,
 					struct snd_pcm_hw_params *params)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_dai *codec_dai;
 	struct snd_soc_card *card = rtd->card;
 	int srate, i, ret;
@@ -636,7 +636,7 @@ static const struct snd_soc_ops mt8195_rt1011_etdm_ops = {
 static int mt8195_sof_be_hw_params(struct snd_pcm_substream *substream,
 				   struct snd_pcm_hw_params *params)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_component *cmpnt_afe = NULL;
 	struct snd_soc_pcm_runtime *runtime;
 
-- 
2.25.1

