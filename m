Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 38A3B678E22
	for <lists+alsa-devel@lfdr.de>; Tue, 24 Jan 2023 03:17:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 86836EAC;
	Tue, 24 Jan 2023 03:17:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 86836EAC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674526673;
	bh=8dGF3GMgNr61Fl7efCpBF4/p9Pxcwb4U3pOGvprWyJk=;
	h=From:Subject:To:In-Reply-To:References:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=AIPVTPg2POHgGChhmMw1EpzXlv2PLgEkv1KGO/GxIZhcLJUNCoQtZ3zemTTVL7lUI
	 aychlg5l78hK8M557LTOzNpmcyTY9en01FgQfUXxDdrynCXPv1+4PDP5P/1733vuGD
	 Q5OAM4/IKkQM5V+pqfrWa+BXRHO6j9+vxezX7gsQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B68BAF80543;
	Tue, 24 Jan 2023 03:17:01 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8276EF80542; Tue, 24 Jan 2023 03:17:00 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,
 SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on2107.outbound.protection.outlook.com [40.107.114.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9D28EF8030F
 for <alsa-devel@alsa-project.org>; Tue, 24 Jan 2023 03:16:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9D28EF8030F
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=J3wFk0PJ
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CMlGkGk22jUO46xS4FPkW+mX1kXgSgxOiy4kkr9bc6tgZTsCE8OeNOi9Cz4ohn6wYNBRSvrl7puRkhACEHBBl5CmRehNphJJA2RSj3B1z8dCmHiylMJpJvDo84frv/YExFO3RN6hRk2j8orI85c5U71wxCaYcBe10gR/AzbCaIE80T3POPc8NzlVtSuRNR485bAIhCpKM0lQplFy1xWZ9+OH9CUcTSmXpVMojeUkAY0rXKymDxjgtIovL78I7H6ySoCUUAsyaK8WdwcCFLwVz9ziMUhVvtzvKLueDSCtOQDDPbzEAcESKrw/WedERxFT4odlZ3BenBajLLUHUrFxow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6meeSM2vDTTYQn4gPe8z2vz4atq+tUQQpHtT6CscFVU=;
 b=Oa6CBZndJPaWVEe0IYjKjBZtqGZnmLd+F0RBrPfj5hi+t+dYCWTjBXQJo6xFdM14RV4Rgv29JfGsDn94dSO30QZz/DVN3JTIk1t6LaW+laT3w7cTo4a/b8+i45ZiZ7ovWeXAhcsXs2bz43Bw1eZw6nWrlUAxDmeE7g98Bnxz/COxS3DfbqZy+OgRiZ0ThI5E2bL8B5UF+9tCkmAOTrXxEyGIbM+oDXCQR2p6KRIzMC1hIPJ6d8gOrWhTZxidt27l5+nseOdIptK4RLFNLfzsCpafLjbGMJxYFG+F7UOXLsQBJwqeEE2DnGONpYgV2jVIESBSHKcOT62TK7rovpZr2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6meeSM2vDTTYQn4gPe8z2vz4atq+tUQQpHtT6CscFVU=;
 b=J3wFk0PJcT7Y3DNA55r5gkn3l+Ygl1ie6n8ROpDN8QDlbCVa61Lshw11wvdiQGkXe6JoA0oqQOwFoiMsMY0fJ2EWS3i8g7pNVGyBIVR3bj5N7lAadb7fiwtHsr4qfAtg6fPNdV6FtDhZ/In71vYvUyUSefn/KpWmKlIKCgmuyTs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OS3PR01MB8812.jpnprd01.prod.outlook.com (2603:1096:604:17d::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Tue, 24 Jan
 2023 02:16:53 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3cd7:a7b5:ea86:9ae]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3cd7:a7b5:ea86:9ae%6]) with mapi id 15.20.6002.033; Tue, 24 Jan 2023
 02:16:53 +0000
Message-ID: <871qnku162.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 23/25] ASoC: soc-pcm.c: use helper function
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
In-Reply-To: <87y1psu1m1.wl-kuninori.morimoto.gx@renesas.com>
References: <87y1psu1m1.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 24 Jan 2023 02:16:53 +0000
X-ClientProxiedBy: TYCPR01CA0081.jpnprd01.prod.outlook.com
 (2603:1096:405:3::21) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|OS3PR01MB8812:EE_
X-MS-Office365-Filtering-Correlation-Id: 2be75254-388e-4856-f8a5-08dafdb10f66
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4IUjSVC7cJTMBEShH6nrHUDcxWwVtfnUpSz0nrWowzK5+cTRtlAbSw09jBCuRJ8rPM1pazGqZSTZ7m52cZXkH27Kpf679dE6S3An5TMkqKR1xGPQJ/8xqRbcwdOncwQhZ7wjj3MYr8Z53+J+Eo57i+Y1ytYca6LP7ZXVgDZ0Ej36vPhnNbGhLNERbtGLedSULH04ACqqKsrvvq9+d13EvMR6v+Q27908xhbmrbl8spTIXYZb9xD1Y/3NRaa9UcZCNdpeb/eNBdNTr/dc6rKfSFerhcyMx9hmrVOd5SbzpLzM79NrQtfkAp3ipP4I58Tukhn4xoN3MMiwfwJkpShNCk8pIuQns7bkwlxzWD+xGoh6hU3lAKnjRG9N3ODzPkjuF1j5CMr/3ONqMTzAVpX8YOg4aaPftfSeKrGyG/5JnPF50LbM1yCoevYPq/YB44IeAUJ/PbIS4L0kbgrStfcTyeYcVJo6sTHnzJpvK2CwAxiF0bbIP8XMwIO4lGD6STHw7yX5yXOYXR5IhMgbqqrstpxgpCPjVyRxEJWihiooqKiojRTVqXfQBsgkH7JyXi1MMKHpRtHkAI8EJ84XwkareOu0rnrM4k8XN7A6n4ZTHtk3ExinM/16Qn1soK0FUkO/J4QkLYhAHu2J3R+M+OvpcdTg5KIO+Fepp89ppWYgQdIiKeT+VhxBT16eYffT/SVmJMdfwr2LrKXkcaYcTVyklA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB8426.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(39860400002)(366004)(376002)(136003)(346002)(451199015)(38350700002)(38100700002)(83380400001)(41300700001)(86362001)(2906002)(8936002)(5660300002)(4326008)(26005)(6512007)(6916009)(6506007)(8676002)(186003)(66556008)(66476007)(316002)(2616005)(66946007)(478600001)(52116002)(6486002)(36756003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?uPFKiBq7ZdG1ZWS/4vrI3ymrbUCttkJCpcALI3PrEzRkgZoTMjR7T0w6jGiL?=
 =?us-ascii?Q?jlwDyrZW2678FSiSOG31VXLJUazOt28Vt5CJtBW/5ybQQ0HxmV+rptl/aaWG?=
 =?us-ascii?Q?dq+a8eKhOrdS/+15LsSlwZE4tyl0oDbsL46/xxZxUiyC0Apsfvpmbo+d9G5E?=
 =?us-ascii?Q?2Fxjs5uagLfufH72YgzZW7TQ+N4XF9Fz9HmSzXUdTXv2yVrqjAYrKXOaLE1T?=
 =?us-ascii?Q?QGyOQxZxtGZ7luuEs3Vl7UZdRWzF7TJ56/Mbs4lc/vpGJpgYBBk7iXMgMGHh?=
 =?us-ascii?Q?RRJIqAmYFONSrDgrcPSq1OtU3mQkPaLTmoPRGO2SAVk81UZEe2ddXQVax9Jw?=
 =?us-ascii?Q?OMrklXUtqOUTqr0Pxjx4/w/w/4E4gREbH5vLtEFvMzpyqCRBcVP29OwI/Sng?=
 =?us-ascii?Q?6MaCn9a7VrVqZp8Cy8aU6cJQLY5fOa4NYkxjiO3RTQmhwPlh1Xp5jpTKvlH1?=
 =?us-ascii?Q?Th1wUaa0Oy89JwNGLJ+QaftQvywOPtT/p/FmAx0iAxmJwr/uqZct+ipjll3u?=
 =?us-ascii?Q?54svw7iJReTlLL74bPYJGarfbBbTsq/rW5Pq8f8sy3nTJBoytUU0rpywL0KA?=
 =?us-ascii?Q?SzE/3WPBdh1HqVzrbO/8E+dlXmyonGz7gR7vjRlnl678/ia00yJQ7XENbQPC?=
 =?us-ascii?Q?sSyx0+XjtesNgFvBDgSOiNcum6reNnfoKAyTaWbb4/Q0ZAXbUU+n7i8pQluu?=
 =?us-ascii?Q?x5bNXXCxXv7HYyERh5U8Aon710Md0d5+vvIRf7oIFeuIrcTc/acctovFzhmh?=
 =?us-ascii?Q?+46OO3wsHXCtMjBiFLIOuVJ2MsumRhEm7rQgVOLQX5V74hLtk6O329wUyDSS?=
 =?us-ascii?Q?v4jCm6eUnrtY0KE3Kz/xCT3zAPlhJbdzozx/dc+BbjnGG48bPjsIDuHD4c2G?=
 =?us-ascii?Q?FhiT4TSDFGilBwU+EbpmhX9y5dJoZc3xrWFH4vGCzDBNLFx99AdJvRMZl0sF?=
 =?us-ascii?Q?xRfv7b2ZLFNljHjWWwFQQDshmZ1xnAOhm7tXvndx4R5rI0T5y6oP0lSm5Z2C?=
 =?us-ascii?Q?B94ccxQ1T616mDctHeiUDiosjnGJZ3mEIKzN9N8UzcR5lvhhuAxbuN6OSObZ?=
 =?us-ascii?Q?e8SeI2aC0PvmRKAWcbpp3wGA+CB0C8A6ThxyXnSmCfWSpOe+s11ON0S4q2pC?=
 =?us-ascii?Q?ZapTITUe5lLuv6Qoz6zu2u3yV/LDKbvST1W+YUKBuYsSBoJF8CuwXEvH0wn4?=
 =?us-ascii?Q?lov3tuwjiAAZNcJ8kRVdpph0cUBAToEWsM1TH97Ljilv3CSQz9nL8QdK9sYE?=
 =?us-ascii?Q?VjPzuTKSUZGC0Xjwb3u4Mo61YNHscvkgxlh+MDtr707ptBf8BHpvvoylf5/f?=
 =?us-ascii?Q?ItwAfzgobcIETaQ4ok/dDPH5lhAP9NLfTUrlZTZfDqthm1IGqQBL0imcODlm?=
 =?us-ascii?Q?w9RsQke/UiPsJLR9kGB+CtbOIBAqF988+GfTt6PMZi8Mq0CkYG3dtfhkHxqg?=
 =?us-ascii?Q?rHQeZIjZC50Oeyu+udqaJ3thU8Yyn5KXzzKwtY3VLKi9erMhwGUoqfti0Qi7?=
 =?us-ascii?Q?+FqA9nnEPmwBKrLvBdHsZPVvE+3i1p84KVdtQK48yF7Y7P1pRvbM05pQj/6h?=
 =?us-ascii?Q?f7iMycSGBIqZRie8Lcdl5dg9qIHVQ1256z+wUR/Nab/67Ku2Z6m9DMr9Ot2L?=
 =?us-ascii?Q?wf+kx18IuCFOImxKcYTtowM=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2be75254-388e-4856-f8a5-08dafdb10f66
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2023 02:16:53.6729 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JPCfAiEv0mZ3KMFKiB5uWmIjfLOWQ6DK4vFh0MZfhhYstubjlQ1yT9pWXs1BrAmKA1syWTwRgvko+V8yru+T02pemuER+6MkUNtxFiUEWBQLx0YS1pAka/i5Hng9zEQp
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB8812
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Current ASoC has many helper function.
This patch use it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/soc-pcm.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index 82bb46c7f5cc..8023cc1fe066 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -1012,6 +1012,7 @@ static int __soc_pcm_hw_params(struct snd_soc_pcm_runtime *rtd,
 
 	for_each_rtd_codec_dais(rtd, i, codec_dai) {
 		struct snd_pcm_hw_params codec_params;
+		unsigned int tdm_mask = snd_soc_dai_tdm_mask_get(codec_dai, substream->stream);
 
 		/*
 		 * Skip CODECs which don't support the current stream type,
@@ -1034,15 +1035,8 @@ static int __soc_pcm_hw_params(struct snd_soc_pcm_runtime *rtd,
 		codec_params = *params;
 
 		/* fixup params based on TDM slot masks */
-		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK &&
-		    codec_dai->tx_mask)
-			soc_pcm_codec_params_fixup(&codec_params,
-						   codec_dai->tx_mask);
-
-		if (substream->stream == SNDRV_PCM_STREAM_CAPTURE &&
-		    codec_dai->rx_mask)
-			soc_pcm_codec_params_fixup(&codec_params,
-						   codec_dai->rx_mask);
+		if (tdm_mask)
+			soc_pcm_codec_params_fixup(&codec_params, tdm_mask);
 
 		ret = snd_soc_dai_hw_params(codec_dai, substream,
 					    &codec_params);
-- 
2.25.1

