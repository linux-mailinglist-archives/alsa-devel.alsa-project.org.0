Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 797DD685CEE
	for <lists+alsa-devel@lfdr.de>; Wed,  1 Feb 2023 03:01:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D909A823;
	Wed,  1 Feb 2023 03:00:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D909A823
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675216870;
	bh=yl7shQUkZMV8bsx7rXG/CwXlCYxzB98OtMrEcTK0N4o=;
	h=From:Subject:To:In-Reply-To:References:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=i764InhIVgk19SqUlAr1g+v/L1hbrRl88IPgOrxrWAjvur2QRNQ5xCuTszOLJBHd7
	 LWxiWxzAQXd5OYXwfX468UHmppcawhRL8VdD0T4fZY3+J/HiIxjqZNSJxhkqnc/2Kf
	 lv9x69Zyw5Qjm5jRYy+5r9f+1mwBHRaeNuVPKMC0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0AAD9F80548;
	Wed,  1 Feb 2023 03:00:02 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0C4CFF80544; Wed,  1 Feb 2023 03:00:00 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,
 SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from APC01-PSA-obe.outbound.protection.outlook.com
 (mail-psaapc01on2130.outbound.protection.outlook.com [40.107.255.130])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 60078F804E2
 for <alsa-devel@alsa-project.org>; Wed,  1 Feb 2023 02:59:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 60078F804E2
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=lbJZ4w6Y
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LxWMpw4pI/TTYPduPu9Kj6WYVGtuxzfCylgtJoBN6ZytcbbpGfiogdBc88kBEJaIS/boRRnKUZrad08dpPfhj5Gj9EGzRGbWRdkRGoHw7TKhY0Y5o+hyn74CgxRk7XjPEKmYbmDMak9CB4picFovUKAI6wWxIOF5EWfSjTKJ3AZSIXNRcf2To2aWN0L8HiiaYjFkXtjV6FwoyQtsgyayg0oFmWYO78xAbnXBhHc/L8sDgDGBiXs7j8ot1RRKmZhELzVRORotU53vPlU2hkG5lJD1NiayO97AoVV6OQSe+F/cd34uWEdbe4m7YOXID96eua6AZdByDapdlfdRiEOukw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ao1OGLJED45OxwgUvjiKqW+CYWBiPGFXRnUmNfBthCc=;
 b=MU2k33ay2JB4SaMXjbYgzWDwebYGNs7dg3HuTkP1fnee+CWdNlHJnd9udsNeg0VBp42J1OkHKIPmXfDPYN+I3LK8vea71lel9iZ7OZPFuBQ8pbLxeEiHDWT7FDJvzP2RQnRvrh4/L6h9aiMqgDlHJT+d7jg+/xj7GoIsBK312+hoEogKEgw2zAsphTjR/2O8gBxpPdg8BLByYHBKpHW8LvDKsLBuDx273BYQ7jc3Qw5JfNcTuk/Qq5mjhjhDx5ys4nb2ctM9cXCYDSV5R3KgteaVdJU+LLuqDfdTkvrQVAQUQ20cNkrkhMhrMSOEjx/jx9yHanDHzfwBJm3Z0Vx4KA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ao1OGLJED45OxwgUvjiKqW+CYWBiPGFXRnUmNfBthCc=;
 b=lbJZ4w6Y3oapRvNat4Ykn/5S+RohMZgoi2g8k4XlmDMFyLkIRUexMwbefH5AvV9yNoSBxlv4F7sdgdhQhMfR4PwiWfvxuN0UxLdmOu4/tGNNPlPx0pFF3bOht2QfbjSMUPtwUCakNfOLcF3o1JeOtgiXhbohQAfEvqUfB7zPlC0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OS3PR01MB10342.jpnprd01.prod.outlook.com (2603:1096:604:1fa::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.22; Wed, 1 Feb
 2023 01:59:46 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::4b75:8d8e:d89a:7860]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::4b75:8d8e:d89a:7860%8]) with mapi id 15.20.6043.036; Wed, 1 Feb 2023
 01:59:46 +0000
Message-ID: <878rhi6t7x.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 01/15] ASoC: rsnd: check whether playback/capture property
 exists
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
In-Reply-To: <87a61y6t8e.wl-kuninori.morimoto.gx@renesas.com>
References: <87a61y6t8e.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 1 Feb 2023 01:59:46 +0000
X-ClientProxiedBy: TYCP286CA0100.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b4::7) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|OS3PR01MB10342:EE_
X-MS-Office365-Filtering-Correlation-Id: d347e08a-11d9-4155-05ac-08db03f7fe91
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ElnmwAzUWz8PO4L8qhQnFJvk0ffWkJyWj8tu/J2QDxc7wCe7t3lj+WVLuL4HYb9tsBqX0sG28sDvi3FWKBmpNKPjJS0a7uki96uererRZlrJHaWWVbqrZZb3gwYf5FJW1T336cXNNpA47XuzyVYHS9zINFTQ6YemX1ucdNICQ78R5ffnQcw2bN0aQmejOJEN4/XtkhkcDtLxVK5Jt5mEMEEQwgcCs4E3Gco/54Mhvs3zSa2zMoc3B0vExGQmvVPJQVzkcJnfh5JGM4BgNs/qWm+ugJbMkTsIXdLPFAtpuIfxvNxgOXmYlOZEJ4NV6VDGS/a5Q61kZqSgFenPFfmYmRbuyPybTz8OEAxBRAzAL7KSO5Wg4ROF/TSIWm6LsAU32RJxt1kolw7w5CUaZJRkFe2k9lnrxjo1ghm95yogo5wZWaJ4uUzjfmnsHKCVWse6H9ITyIOqlj/kFCozjiYBCbj4Fb2YNm4AazIK44D4RS3nbPP8e0Ca/iW2aU7CEHykH/90xJ8F7EJMpRJH53HSkk7M5N1yOk01ONlS9NAohmTvWRYcX/wNloMcX3s08IpUlHmX71uEA4qm7nTdUTstYtOYANO6OsKtjKNAui1tlPd9Z7gOcbSdIJf0daKFHLijFZcmP9VGAVc5Y1NbeDckSCgSK3s5gButNooiXQMfDUSSHJxaHOh/X/JPi//+7UUFIjBiOhGLnCDUwxuvD2sfjQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB8426.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(376002)(39860400002)(366004)(396003)(346002)(136003)(451199018)(86362001)(36756003)(38350700002)(38100700002)(83380400001)(6506007)(6512007)(186003)(26005)(2616005)(2906002)(316002)(66476007)(52116002)(8676002)(6486002)(478600001)(66556008)(6916009)(66946007)(4326008)(5660300002)(41300700001)(8936002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?CBFGTrIW0UtljccIfGqKbiqLvdReTsfOCGrbZddhZLMbtK+LNXm8sGChZ4zk?=
 =?us-ascii?Q?wCjObLe6wg6JND1KJ60qO5RXnefjI1suXLyGzNgeYhd3nGzB+r3D2NGLzjWG?=
 =?us-ascii?Q?auzJRb9yGjKj8EybuWT8Pf1vPJ5G33VGQvinBzKAASN6dewgmXy6uhGgDL7T?=
 =?us-ascii?Q?v7DcnAz4dNR7CyE0OeHFAp0n2DuO2RziU7ngYejzZKxHP2MsVUuD6M569eyi?=
 =?us-ascii?Q?SogeJWnWZjaeiMKsULfX9HEpH4/g4NF5BMyfc0jTzozelFsT1GH8yzXCCV10?=
 =?us-ascii?Q?7rWi67J21YmF2AcVckMpUatRdHJfp8eNeYmfb6q8Cypm2/iXsEKtxkVTqTaY?=
 =?us-ascii?Q?QyAXwfSfWhjuzVB/DjndzpKFyzo+21RsJq4U/QHzejPD8CE3ximafkF0fuvY?=
 =?us-ascii?Q?0kFWgy7YmbLJGsg4hEFcRfejSi7vj23yU66PJBqyTGQ5oSDCFzl+hNE7ZisC?=
 =?us-ascii?Q?mFZ1XFnqw3b260yusHfOrTsrv7w+X4rEsaiAkRx2bUrmwxQdF8GS9A5Vllbw?=
 =?us-ascii?Q?BASey/xvH32PcOtRrSd5npaCJHQ+G4hB49L/w1sqcHD/Mm9hlsT5pOtXZUe9?=
 =?us-ascii?Q?02ZZSwiA/LlRlZmVqgUVPIAUB2Hvvyo54grF4YGFMO3fAGiSSiQ1IKIG4WI1?=
 =?us-ascii?Q?fCs5zse1SykQ/ijLWroMKQrUxpVdZqsmXUzvXjyYzot4t/dmZiA6Av3KxYb5?=
 =?us-ascii?Q?jUQOkD6JGuhWM5GBEdN+94192s7nQPEGd/oBe72qGTHOHPNgGiDSWI5vJX8I?=
 =?us-ascii?Q?OQOOPCdH6fX+ccMgtfr4q4cSmz/TVsbSlgF9W1xXWZihiIKMQ/+yZrpz85he?=
 =?us-ascii?Q?HAJP8PQUhmSI5Htxoc9SaYpIYUW2U3bN5nNDhS5rCzIlEFWkdK4PZMTjvnYq?=
 =?us-ascii?Q?V0iepwmVxqtJLQhVHI7GMee05vCtF8mIeA5p3tsR38y6SdMMzBhUyqq+FpzH?=
 =?us-ascii?Q?l5yp3ew3/ZlaGkCBGuPWxK1sQ+dra1LKz9j255pEl1GW+4cuOUcijPy+eA4g?=
 =?us-ascii?Q?BH8fQP1+GwdLrJ0Z01Fzo+6+41L0OdjyF2/5CoS6zZJ5CzID4b/NM+dZssn5?=
 =?us-ascii?Q?889JhoGACmipJDwQUyjLP9ILn14xa4VdPL/80aXguszO0Urit6ycHwrmHEdX?=
 =?us-ascii?Q?/2eilXsiWwo/SeVWvOjmzR9QXfh6Najg/Xq3GVBSBt9SoxTYqncubO9d7tpT?=
 =?us-ascii?Q?IWZLoM0DdiUpKijRr/HALT+axB3OVpp+NqO9TWy1IwMvH0C6nHmmJ+sxE5zI?=
 =?us-ascii?Q?YXWxKjUc9Eif9w+E5LCUrR4bNU8AkRCpw9HLjcl409NVK9yawcFDvlc/zag+?=
 =?us-ascii?Q?Rmia++UJTV2/32/Mf9T3kSTZ2xB2q0yiOO1RyTWbjGACWHFfV1qfrZKqzZzf?=
 =?us-ascii?Q?dXbQ+h0uCblZZQvrsne3c96gAm1OIWg1coQ/mpGAh7OyCY1Ga/Q4FGZy6LGj?=
 =?us-ascii?Q?h6hmiT2ox6tOvaqNfYxLuWe7f80FUIUecahMJ1NC9kYe0zFuvyBLk9C1dhVs?=
 =?us-ascii?Q?1+b7SdCi82LPcZA84/A4eIfeIWyxlS+0WGzzJgLNnuzUw8JFRY6xul9d1R3l?=
 =?us-ascii?Q?JnCUx0L0OpUm1Rmv0Q+aT5NyS3dtolEkrHfIbH7CZWRPYh0D8eU1JMURu/Nv?=
 =?us-ascii?Q?mRBBKPWRFTCJdTXzG9hor1I=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d347e08a-11d9-4155-05ac-08db03f7fe91
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Feb 2023 01:59:46.6873 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2NRN1rD1ZQEutSIq+fmsvUzHlF3FEw6Pc1E4t9aL9alpmYJsbOriU8h/Is+WSKDpzpv+6dx1a8b7vVGFb4+X2PyNHmg+nqFCpqPJt+CGn/K42ir06UVWQ8XTcuYXh3BR
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB10342
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

Current rsnd sets "channels_min" which is used from
snd_soc_dai_stream_valid() without checking DT playback/capture property.
Thus, "aplay -l" or "arecord -l" will indicate un-exising device.
This patch checks DT proerty and do nothing playback/capture settings if
not exist.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/sh/rcar/core.c | 42 +++++++++++++++++++++++++---------------
 1 file changed, 26 insertions(+), 16 deletions(-)

diff --git a/sound/soc/sh/rcar/core.c b/sound/soc/sh/rcar/core.c
index 2d269ac8c137..ca3a0f285092 100644
--- a/sound/soc/sh/rcar/core.c
+++ b/sound/soc/sh/rcar/core.c
@@ -1343,6 +1343,7 @@ static void __rsnd_dai_probe(struct rsnd_priv *priv,
 	struct snd_soc_dai_driver *drv;
 	struct rsnd_dai *rdai;
 	struct device *dev = rsnd_priv_to_dev(priv);
+	int playback_exist = 0, capture_exist = 0;
 	int io_i;
 
 	rdai		= rsnd_rdai_get(priv, dai_i);
@@ -1357,22 +1358,6 @@ static void __rsnd_dai_probe(struct rsnd_priv *priv,
 	drv->ops	= &rsnd_soc_dai_ops;
 	drv->pcm_new	= rsnd_pcm_new;
 
-	snprintf(io_playback->name, RSND_DAI_NAME_SIZE,
-		 "DAI%d Playback", dai_i);
-	drv->playback.rates		= RSND_RATES;
-	drv->playback.formats		= RSND_FMTS;
-	drv->playback.channels_min	= 2;
-	drv->playback.channels_max	= 8;
-	drv->playback.stream_name	= io_playback->name;
-
-	snprintf(io_capture->name, RSND_DAI_NAME_SIZE,
-		 "DAI%d Capture", dai_i);
-	drv->capture.rates		= RSND_RATES;
-	drv->capture.formats		= RSND_FMTS;
-	drv->capture.channels_min	= 2;
-	drv->capture.channels_max	= 8;
-	drv->capture.stream_name	= io_capture->name;
-
 	io_playback->rdai		= rdai;
 	io_capture->rdai		= rdai;
 	rsnd_rdai_channels_set(rdai, 2); /* default 2ch */
@@ -1386,6 +1371,14 @@ static void __rsnd_dai_probe(struct rsnd_priv *priv,
 		if (!playback && !capture)
 			break;
 
+		if (io_i == 0) {
+			/* check whether playback/capture property exists */
+			if (playback)
+				playback_exist = 1;
+			if (capture)
+				capture_exist = 1;
+		}
+
 		rsnd_parse_connect_ssi(rdai, playback, capture);
 		rsnd_parse_connect_ssiu(rdai, playback, capture);
 		rsnd_parse_connect_src(rdai, playback, capture);
@@ -1397,6 +1390,23 @@ static void __rsnd_dai_probe(struct rsnd_priv *priv,
 		of_node_put(capture);
 	}
 
+	if (playback_exist) {
+		snprintf(io_playback->name, RSND_DAI_NAME_SIZE, "DAI%d Playback", dai_i);
+		drv->playback.rates		= RSND_RATES;
+		drv->playback.formats		= RSND_FMTS;
+		drv->playback.channels_min	= 2;
+		drv->playback.channels_max	= 8;
+		drv->playback.stream_name	= io_playback->name;
+	}
+	if (capture_exist) {
+		snprintf(io_capture->name, RSND_DAI_NAME_SIZE, "DAI%d Capture", dai_i);
+		drv->capture.rates		= RSND_RATES;
+		drv->capture.formats		= RSND_FMTS;
+		drv->capture.channels_min	= 2;
+		drv->capture.channels_max	= 8;
+		drv->capture.stream_name	= io_capture->name;
+	}
+
 	if (rsnd_ssi_is_pin_sharing(io_capture) ||
 	    rsnd_ssi_is_pin_sharing(io_playback)) {
 		/* should have symmetric_rate if pin sharing */
-- 
2.25.1

