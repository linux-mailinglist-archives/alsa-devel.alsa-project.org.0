Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E49E6821E2
	for <lists+alsa-devel@lfdr.de>; Tue, 31 Jan 2023 03:06:23 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A2C60EDF;
	Tue, 31 Jan 2023 03:05:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A2C60EDF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675130782;
	bh=8dGF3GMgNr61Fl7efCpBF4/p9Pxcwb4U3pOGvprWyJk=;
	h=From:Subject:To:In-Reply-To:References:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=KVZn1P/Q1Zj5UWcJG0kfo6L4ATtrlRQS6PUl1Qq8mOYKzxaQ1DX1GV3v4bj5H3KKT
	 GgCCsyb4V1UOLQsTkZl8WYNdmtF99kPXMbaXLLj3IcD7kGCEL9GblCJKRX76fc3voK
	 EuqAil6M+wD5KoZxdHdV5lEAXbvDSP46bUO0eiDI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7CAFBF80558;
	Tue, 31 Jan 2023 03:02:04 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1FBC4F805D8; Tue, 31 Jan 2023 03:02:02 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,
 SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-sgaapc01on2112.outbound.protection.outlook.com [40.107.215.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B704BF805D9
 for <alsa-devel@alsa-project.org>; Tue, 31 Jan 2023 03:01:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B704BF805D9
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=CqNndia+
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jgfzctD/DOF/GRq+t17L4gGRMB8eINGYWGS6aIabWdVPsQAZYJHkk3sx33QoilJ46cDrbUmkItPIqIqQyOe4QNbQfeVNCtHZZjJhxmsGm2mKwyY1UO6Qx1orDFLYq21cnd6DVtOkzklhAaQXuKczUApoQYk6bnQwVWi+IiPhFm+A5rlEFKO9kIanIetcEj8szzU5D+FSo0mEnkwZNjGMtEY/K28fT01+peqjy+U0kKDqtMKT3q4cTF2AVqf0zWinJYNlg091wGnCw1CXOxhwIoSYKxKWS1SCIBfTYHNIUMMe0J4HArUaFoQ8cqnQY2uL16mX+/ei50vMZCiGTAhCGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6meeSM2vDTTYQn4gPe8z2vz4atq+tUQQpHtT6CscFVU=;
 b=P91Ndy1+FR0SD+zDTvzPMwQ11SWwoRqvFjN8y79VrbolsfDeXEZlnbTubrM5Ve8JnDuu8DtYjtRTdVSpJEe5wLG0jr/AKJ4rJGg5K3pfqK1PcMqozijwf7tydmbWLh1IxOS669XC4dorjdO6+djxQGfX8sd5uG982Sx5zVoZCUmAqIPYY25+EFDr+cefacWNy3wfjEA0U63mgk0c1q7tlUppNswvVeNOFitnajmCByghd6sAciB1O4pisz/04Hf69Ztlj5spD6jNg1wQW2r2hi0JITfj+SXfqyETZv/Jr0vPIznFsfdnHJDphWUYFIog1BnD4B7i/wdqeIZ5j+kcqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6meeSM2vDTTYQn4gPe8z2vz4atq+tUQQpHtT6CscFVU=;
 b=CqNndia+e9f0M/h5lovyiuBBw+tMc5zLEdIx3nueFywFG3CHwuO5qz8uD8yeq6SFAonGMudjMpXkdoP6Gj7Vry64BkkxIDUOUXqYU8reuDKCLINNfNeumZ/YVg7FsMQoOHNLsfhJRPeQVNkQ1EvdWpl2q3oU1ixcUCLaFgSradg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYWPR01MB8464.jpnprd01.prod.outlook.com (2603:1096:400:173::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.38; Tue, 31 Jan
 2023 02:01:54 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::4b75:8d8e:d89a:7860]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::4b75:8d8e:d89a:7860%8]) with mapi id 15.20.6043.036; Tue, 31 Jan 2023
 02:01:54 +0000
Message-ID: <87fsbrea25.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v3 23/25] ASoC: soc-pcm.c: use helper function
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
In-Reply-To: <87cz6vfosc.wl-kuninori.morimoto.gx@renesas.com>
References: <87cz6vfosc.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 31 Jan 2023 02:01:54 +0000
X-ClientProxiedBy: TYXPR01CA0052.jpnprd01.prod.outlook.com
 (2603:1096:403:a::22) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYWPR01MB8464:EE_
X-MS-Office365-Filtering-Correlation-Id: 51fb96ba-dd98-4f91-907f-08db032f208a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7drj5hwJOOHDkA5X66zCl1Zp2LFLVQRW1FRTtdPgnadVq1i7nGcsV5Q2ssMDb5nreTWr/7uybk8ei5q8u4uyqjDXQIXYnGmWzw2814/AdhfCUjJJr4ND4bjO9dZXxak0OzGNleKE57IXq7XT/YwwHcR5Qvl4dps4wwz4Q6Oel7IKmIrQJDeUrqLVkzrHe2sV2D1mqUAeAuW3koDZLRJKb93BUBU9i687qqdL1gBfSRuMse+xs5zdrI7ddYIPW7QQQ1e++ff0VhVJmjb9SovZ597sRYGgY8BU1bZ+iqIhgZ/asj5vFigoct3iAA8Owt2cJ9XDuhUmaVRf4bb6+nnFWsVpZU7VWJVtLSL5NTa9yW+cK1dS6Dk2zcmw3Ag9dwY6IKgJ829FxSy8F5UEokKmYYGa8w3i+kHd4mH7Ami+gyKCGc2ixFQ23/f1SDp7Aiy6YJMbvRPexpefLOIryRjLlI2bjYWaY4NP5HTHbRyCiJgPAp+itD17dEKrUJL+Xz8kkHlBf/EYmzqyxkF1fQUBoviLTvHutnARWp/4s4fkD7BROtH/ISqC3Pe8roBBHylcG0Xw6T6qwSSt0jCSBkrxWEj+B8sHYiaUq5bFnapYfEoO8wZaA0yAIF+GahKSZLdiPOVhLbnjO5ghTBwQoAYHcpKxAKzdTm6TohjZ4P2xE/FyK6Qa0j+nRXY2eGe9jtzD6KR2HxbPwPj5SFzdE7ynXw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB8426.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(376002)(136003)(39860400002)(346002)(396003)(366004)(451199018)(36756003)(2906002)(83380400001)(316002)(2616005)(8676002)(478600001)(52116002)(6486002)(6506007)(6512007)(26005)(186003)(6916009)(86362001)(66556008)(66476007)(5660300002)(8936002)(41300700001)(4326008)(66946007)(38100700002)(38350700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?fSXg4rcQJvTjLI4cV0gJMD29EZnvkTdivt5WNLfG49Non8+ZJnULgLt3NQ2H?=
 =?us-ascii?Q?J0GX6UsZdHnDtuUV+Rkgb4JsZ45eb9Hn/4wL51BsmtPeeSfRMu059C7Jw2qP?=
 =?us-ascii?Q?D7vI+KJKeTiiGdll4UVG8TLF7NsZZdDEc7cjeFI0hjWQnISVHm0cvI1MmPW4?=
 =?us-ascii?Q?ONuZm49kvhj2J1J0eGXNhpC9+2+WWqcXuVLmz2OpCJakx8d4sbjC73SCxRws?=
 =?us-ascii?Q?Kff2dg9R4RngRBwoOH00G3O56ARste3sh9mTNvhYesv8u+xQgRKHLo6uMJUB?=
 =?us-ascii?Q?+ZG0kVfJdXI0+qwsC9ADLzxA+BYKGnBS+hFzFM5KSX66R+iLCGQu74PBRsTU?=
 =?us-ascii?Q?P5Ixn3o0I6LIesAIarro2t3DjsEhz/s3WqD2XJvkoRv8ctUfvM9RrBg+kAq4?=
 =?us-ascii?Q?tDmuxEZIIC9w8jtVUmI1HUaMaI+jIbx5RTDciiOL+eZL/rIFy9hpNRgFAaEQ?=
 =?us-ascii?Q?4FVfmGxK8NccVSU5jAvwZzKUNyoaua6f2MDm55/h+CoNePuvS4KzhTQ+m46k?=
 =?us-ascii?Q?MhC5sbzI+oUQGegkS0FsQnN26h59erEY+8XAHBCRtiSZ95AjkiLDGVVbc9rS?=
 =?us-ascii?Q?lJsYbbErS3q3GQyVJbnp0qguNlhJpAPZdCvJOyrqNlkG3FaCcGuG7aVBnSga?=
 =?us-ascii?Q?RnECc08nzbbLUn23Ldgr34/WXju8KuISsraDxcxDn1zNLDZvc2ztMNdXhek6?=
 =?us-ascii?Q?AuqmQaVn0WV6ERsnLw7LqVml5b4v9ZBniWoMEWq1JNYzmk3J5nvuGmLVK+kW?=
 =?us-ascii?Q?/anlZkZVE9ctdpznHiJabumg8MEHVY5/mH1VblT+NCYtHmF8WlUcL/T+35tm?=
 =?us-ascii?Q?LxlzwPFRzJEkdNCtOHAi/9LVUpOKTiBTO1AviWD/BimciNOTIKWcC/kjA0oQ?=
 =?us-ascii?Q?59FnG12hFoAN5qyZ+Znyk67fHGA8d548/fT++rg4enKf66NE6AdpeK3vtmCC?=
 =?us-ascii?Q?Fo8mVhCa3+cEXT+611O1c/pYvplha154Ii/tSPZjTu5gh+7koudH7WmFTxcJ?=
 =?us-ascii?Q?3ndJl5xK1zV5/tNDbdyAUk+Na7sDEjZ0GQ90nyMpEMpOYVwN4FkKTjLyMEAd?=
 =?us-ascii?Q?XIz/bsDVZ1UyIeY4EWgpI+cVgCRN1FqFcQqWNjbLMBsqmpFoFAJwq+ds7bvV?=
 =?us-ascii?Q?nV4LXFCUhqzMGQ6+oXdpdIiFZlC5z/CRaHR6ubbwDj4SLYxIS9c1QWQWJShI?=
 =?us-ascii?Q?z5dMlDc5akJGHHJd9x8i8Zw8oISqXpyxLNqPIEgZaX9pXdBL5yq7MaEGrd8t?=
 =?us-ascii?Q?3/X3wvaSLTJFXiGtoIGtOMDYS65I50dU1uIcw9IXhioZcSqJDCoSQ0z9Ihu5?=
 =?us-ascii?Q?lcT6VzcSQhpT+qyzR1osRUTzuCQyqxIC08VNN62Gfa9j/w704FaIGqbCdTX3?=
 =?us-ascii?Q?xW9GBwA9eyjWIWw5MluVso3u5Gfx8ZRbEOLMhD3+9fYix3+/yR+XsTXQiIr+?=
 =?us-ascii?Q?2ZGPR3pzhkk1UkPp4TiBqVJBfg5I5KgyLujihWg0aguCaMvPov9o5oFe/cX0?=
 =?us-ascii?Q?cxYKO7Jjm6kBVc6DH4s/jzE+qeX2jE3goTieXEKe8q9XFEFGJ7Ae3N/Nu8+/?=
 =?us-ascii?Q?LhnCOUgu6vyWHEzKzvsDNFuMsousAmHsaOPlaDfo9DAqRf2ksbzLmgFMweUA?=
 =?us-ascii?Q?bhBSsw2YFAphv3kZSMYtdFM=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 51fb96ba-dd98-4f91-907f-08db032f208a
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2023 02:01:54.8917 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sUNiXRr9f0IY/A/WfVKMsWq7oGalYRX/j6V7u0srMRTlstsFlCraETQR3sSfrW0zA++x9pDsa4z8jDuQN/hoI1EPahHNo0hPu2plZ/oU/lhXBPi07vg8i1Tm873X+C8t
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB8464
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

