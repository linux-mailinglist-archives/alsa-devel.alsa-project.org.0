Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B2BF7079ED
	for <lists+alsa-devel@lfdr.de>; Thu, 18 May 2023 07:53:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C6998823;
	Thu, 18 May 2023 07:52:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C6998823
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684389216;
	bh=GK8MOCNCRQr+OcRBqULmPxbY4OTyqSJVjp5AuQ/Z0MM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=vs3b61LZ2gWMofxMEk0mtwWFV6X5vi/euo59gxrP4Fg7TTYX+YU0JZLVEdRgeimHV
	 0hnQI9YFVaiL0BTK/KrF0y6AjkrAFf9gyE7E7H/sQC4BQAfdoDtJxVhkJZsIZ7TzVy
	 /WKv9w+mWUnldCjRw3IS/P5sSI+6nYvHqj6LPTp0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 52A3DF8061C; Thu, 18 May 2023 07:50:01 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 16E85F80616;
	Thu, 18 May 2023 07:50:01 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1C3E7F80609; Thu, 18 May 2023 07:49:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on2070e.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:7010::70e])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5B865F8060F
	for <alsa-devel@alsa-project.org>; Thu, 18 May 2023 07:49:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5B865F8060F
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=VfPwUiWB
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dcN5Ft1IOQ2AhRwszzzIlnXePGInJPvKaJH5AFOIWxjvp+1VtiUDr5VEFDiixkCo5s1Jh21BIvfF+8ZBrP44kZPIkguxSAZoatU9JbNQTVc6zrwylSjY8pjYnG9wS9+j7nPfG2NU98ndSCtAn4+34bGvGEhojZ7wqncMpTwWyumZp41cmX88nxfqPUVBS5D0dCZAEbL3DeA8JCoT98+TXk/oD3dS7HeUwb0BXKlehPFZLmUnQoOAfjJPuHjnvIL4yfXZlN26/eNA8xna1vDqJDVQXQIwYsfwqtoEOt5p16/Y/O1hBpls6cCfm6qh7gE/GuPR1PyE+gj+k/M8t4Wzhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UxL44Y4kZz8o6Sl7OUwPSTlFIlXSayBnN9Wzfjj9+O8=;
 b=FTydE0NiTPI2XHxIf9jF+sSQNSHDJ8tGT7cbs7D+wHi4HA7yVkoDeryvg9gnLYa4Pr/Jn/MA5yasjHQ4l0TXYd0251VHDnEhsjpdeZK/it0QbbL+MrJTrpNJgehv1SfRzwzgJnpOcm4S/M7AkaY1cN+gNziZ9r9C/LmMVIqx4II5jtUx1rTT5G83Hp4DsfO1f73lkS8eZUfioSxrTAZ0Fx20Y9krRav4LDvDy0MGvi+hwGLe86atHJQMSr8jVnKOg37C1OG2RqodHOwwS+qcJYlNIDcpKlmt5mVeGLer3CF+lhhhV97ZTx7VyF2SArGzqn0xz7ExYxmdFGtQNQAZww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UxL44Y4kZz8o6Sl7OUwPSTlFIlXSayBnN9Wzfjj9+O8=;
 b=VfPwUiWBzsSSje94B2Rjt0SfBszc93GhTf/hGya4CsJwpxbjEylF3xMRuQnYxvQ/NBOykruK2klaShpH8j55Db0IoLM3Oo9BBs8RuuRnMtBlkNRunUH2tpVkH6O7o1lVhOsd0NA2m5jVrgDAH7+oFeHCe5qKves6KlOJs0xIIG4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYCPR01MB5984.jpnprd01.prod.outlook.com (2603:1096:400:4d::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.19; Thu, 18 May
 2023 05:49:53 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::91e7:a94f:9f75:d840]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::91e7:a94f:9f75:d840%6]) with mapi id 15.20.6411.018; Thu, 18 May 2023
 05:49:53 +0000
Message-ID: <87a5y2p4se.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org
In-Reply-To: <87353uqjiu.wl-kuninori.morimoto.gx@renesas.com>
References: <87353uqjiu.wl-kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 20/20] ASoC: soc-pcm.c: remove dpcm_playback/capture
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 18 May 2023 05:49:53 +0000
X-ClientProxiedBy: TY2PR01CA0001.jpnprd01.prod.outlook.com
 (2603:1096:404:a::13) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYCPR01MB5984:EE_
X-MS-Office365-Filtering-Correlation-Id: 356f9776-80fe-4727-12f0-08db5763b401
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	I4uAtqZmn7v7C5XjM0MiOPKW3KJsG22wi2lZilidJna+Aas2l7qDZx/MOtOgUA67cXyS4AoV6O+E5eeb6XhLG9ezYU0S0qWYt0UrIHEjgvE2kQwmGhn1CioRP8q0bm6McPrjvlZ0HaqM6NrtPAVzhDHOVyVpbF2dOYBy1EhW0ND9kupcdoHK3hvfBvltgXy7a+IWp9ZXYB+tSTYnOAWqlEcF+Ley+GyOvAu+IzF2BPP4KS66AZEH7ZeiuRURHNpyqcLcOCPJt1kBUHCJen4IJ9NT8kG5PFk6L+EiKyapOYGilteqN7yMgV35Bc1rwUvpNFv+yW2UoyCRG+owfZzUfKbwrCQ/HKDJObZXJVI9jDxLrMm+YPXCkNUuucqkzXb45JCB5IcqmO3P7pkY4Jwp7r7IDNlJFQSzUWscnEpcyL8JWXuonS/POKjrsQQZmn+gG7lk8+i2ev42nzfZSRczwsbY3oHADShmoMbuTCvztE0+4Gvrto2sCTuW+xAFM2lJ/m9sL7b4zUNKu3ToXo0/+eC/9J6WPDU+Ea5Wdnp4LnG50mqYTiNxZu2jFDdj4CJkzZvCCRE92pStnssDXXACXBME3JxKPTQ/yIWKA5RWWP3M+epyzoARDpI2VcQm9G/9
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(136003)(39860400002)(376002)(396003)(366004)(451199021)(6506007)(26005)(6512007)(186003)(2616005)(83380400001)(66476007)(5660300002)(66556008)(4326008)(316002)(66946007)(41300700001)(8676002)(8936002)(52116002)(6486002)(110136005)(2906002)(86362001)(36756003)(478600001)(38350700002)(38100700002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?HkbbmpzMciX2/Vo/cLoz12GJToEqYKXfl1wx23ALY90VaR4yfA4BPLvTCT0Y?=
 =?us-ascii?Q?2DKEI79CK305KcN4Zfk4EkS+sptiJp2dPWMnx7DmVN1nQ7qkmSOttKw3jiVb?=
 =?us-ascii?Q?pNI/pFIVW039rD2+TwEkLKtyUNYO8VGG9Wfs5uCHhyZrU6gfE8N1PTfGcL4Y?=
 =?us-ascii?Q?r4bvFdNtb+i6tViAZm5VsmpTi7gWBf+/1m7YuNePi3mISzfgd+xiN5Ba+L05?=
 =?us-ascii?Q?WUTtpeGPDjveW+qQwRLJbovufGpN0B11zmAAi06ejVczXFyinKvk0cv+dOX7?=
 =?us-ascii?Q?fKz6pneG5zDEwZZhDgDQcvBJd3DWnPR+OowcgM9fRovoZ6fSBXMaliE/PAne?=
 =?us-ascii?Q?kzljuH+WMrAR3cYMeYKRITkfzxAs3Xr/oSEp+AKcXHc6Ca3PKeNW/xqHt2ms?=
 =?us-ascii?Q?3DII4iW2D4Hp/kUMbOv8KjhFl97GUQtbXfDZcqZSpm/GNnrG7meYhuLNW7f6?=
 =?us-ascii?Q?b0gxelFTJYGCfwVDJZ2haHCGkV4YKqy3ROTAM+sfxzTNJrW/FRwE9T7Q61/c?=
 =?us-ascii?Q?6p548YeiNEOz7wRp4Cyy+ivhmYeXMN90O4wbqxKRL62cPITM7W+1/AYunX/v?=
 =?us-ascii?Q?oReqDeVAvvockKGit58qUGx+ew2R8Ej0gcjOlU5ytY9kLCLRDKL+Wwyya5Ul?=
 =?us-ascii?Q?+WxKm4ZsnMNT+yeYTTh5fQNid16/58fX2uYwir9mscNWYWZ+k2iaS7VPIBqp?=
 =?us-ascii?Q?TDJ1YtG1t3xyb7hbSmmSBkgVp5VG5+5104D/bNw5IL9cK9t1DxkMqdfxwPwI?=
 =?us-ascii?Q?zrCNZfKA6BAbaIMqEoQmDUimCgjJLvf5PnUjr3Vd5Iu3Qfi7sBz48FXLM6lS?=
 =?us-ascii?Q?RZ47YWvRO0vtygst3gBEq2u6Xy7eM7ZV/5tlXAYQ/T+c2eXxqmH6djLIB2IB?=
 =?us-ascii?Q?Abd1gyBnSoM2HIU1+atNzyzIMxXJEuIjrDt3qIS+UlEUXwoy+xmgiyCZOjHy?=
 =?us-ascii?Q?tPTFlqEqBl9Ktn++6mlh0h3n8qM6VKBjuQMl76uYuOKIe0uF6E6M6peYzptC?=
 =?us-ascii?Q?GmYYZg2cUDCimtUfX6ftWxiLZoR+cGrmRqceSeMUTtnqFaQEIwUI1YgUHUvL?=
 =?us-ascii?Q?GFHZriurdhmWYnqXPrP49RhaZYQNarz0SYfJnkBNqX0xsCYNM7Iqch8oyigK?=
 =?us-ascii?Q?DhsdJ1QOislcXgi9ylzBny+R7nL0QEK3xGLpDWAvNtlD+3nWnXmdtxeghbLI?=
 =?us-ascii?Q?9NzPh9OdJFdzoq41I+3sjqabiBgIx41fcd3vXW2cqjxbl+9jpET+7tmMSrKS?=
 =?us-ascii?Q?zOqLq85g4uELdamEoNrYnETJ7xia20g+vfD/7glEFzH5oxUx0t7DlTTT79Y0?=
 =?us-ascii?Q?dTwxm47dbmUqdkDK5JvjZy3AezvZepvQQTnX+xauQLY2fG5Bu9Z4rYqX6i6B?=
 =?us-ascii?Q?ZH2HmMFbl1sGzwrgVC5k6pSkUTYeR9wTtgILyJS3ItoPklKRsdKxsnYtic1j?=
 =?us-ascii?Q?4Lq0KVPuqdILnP3hjN6mkYpEInBIzZdlh2zA3zM3P8aRcw9vJ7rd3hgltcvO?=
 =?us-ascii?Q?XIwAZHTkT4gzJpMMee+xk2Amd3bwOUcLMi/QjU/V1RUzUY4Q1rXPi20ZH0Zp?=
 =?us-ascii?Q?fKlmwns3i4SarSxLHQ23d7vVZ3joPdXb79mNanl5Cmh4l2cVLF1iTMsGpYio?=
 =?us-ascii?Q?rKU11sFLhr047hXfjzgNtoY=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 356f9776-80fe-4727-12f0-08db5763b401
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2023 05:49:53.7685
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 0OMaZkyalyfBZeK5sZB7sjYpJzO5UCq2m9HEwHXaAgLFWE3Gn173XtPX69sTW4WbKUVdD80QiJdcosOHC+hkZ90NaV9ALflSz9d56Zy90l37abNl2sJ8g/+Wu+MHL78y
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB5984
Message-ID-Hash: QTIPZKCVCPKFVGCX2W2HQD5XB62FXVJ3
X-Message-ID-Hash: QTIPZKCVCPKFVGCX2W2HQD5XB62FXVJ3
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QTIPZKCVCPKFVGCX2W2HQD5XB62FXVJ3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

No driver is using dpcm_playback/capture, let's remove these.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 include/sound/soc.h | 4 ----
 sound/soc/soc-pcm.c | 6 ------
 2 files changed, 10 deletions(-)

diff --git a/include/sound/soc.h b/include/sound/soc.h
index 533e553a343f..b98f49037d71 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -729,10 +729,6 @@ struct snd_soc_dai_link {
 	/* This DAI link can route to other DAI links at runtime (Frontend)*/
 	unsigned int dynamic:1;
 
-	/* DPCM capture and Playback support */
-	unsigned int dpcm_capture:1;
-	unsigned int dpcm_playback:1;
-
 	/* DPCM used FE & BE merged format */
 	unsigned int dpcm_merged_format:1;
 	/* DPCM used FE & BE merged channel */
diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index f47ddf660c57..910780ca5565 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -2757,12 +2757,6 @@ static int soc_get_playback_capture(struct snd_soc_pcm_runtime *rtd,
 		cpu_playback = SNDRV_PCM_STREAM_CAPTURE;
 	}
 
-	/* REMOVE ME */
-	if (dai_link->dpcm_playback && !dai_link->dpcm_capture)
-		dai_link->playback_only = 1;
-	if (!dai_link->dpcm_playback && dai_link->dpcm_capture)
-		dai_link->capture_only = 1;
-
 	for_each_rtd_cpu_dais(rtd, i, cpu_dai) {
 		codec_dai = asoc_rtd_to_codec(rtd, i); /* get paired codec */
 
-- 
2.25.1

