Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6655B5A59D3
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Aug 2022 05:18:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1212F1662;
	Tue, 30 Aug 2022 05:17:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1212F1662
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1661829502;
	bh=IgdkOTWjmt8eMlncqoxGcF61PNfM8S8TqpO0gLVQ1W4=;
	h=From:Subject:To:In-Reply-To:References:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Gg8Znfy6PERATUKpv1IErXDXsvlDIjDq66vJHH//gk1secohK8SM7jNsIhtslPGzL
	 AbP79WsK+TntqRjNVDRvyS/m4CXQmsv10QvOXKRQCDybRgRB5Z7bXKT4QzmUbPOHIU
	 OzkMn806/T4H2c8bWdB03ss3EM89IP0lzyGBtVdU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EFC80F804CB;
	Tue, 30 Aug 2022 05:17:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 67AF9F800AA; Tue, 30 Aug 2022 05:17:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on2133.outbound.protection.outlook.com [40.107.114.133])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7B368F8032B
 for <alsa-devel@alsa-project.org>; Tue, 30 Aug 2022 05:17:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7B368F8032B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com
 header.b="ZDu5FvdT"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=evVJgzUe583/7PFnMfZtcoKF69N8VMY6mD8VqcwVJrJXYj3Bc8K/AMNcBm22YZ5A4J6HrlMbkiaRMb39e4XhFJZVrH0FfpFmOpFbH9zPcz3RXP9FkUEOFiYlhpqN2guoX54Jb7LETUwfssVZOuW0hKxsyncZv710Llf9WubNq42WcqJ/Xh3D0T8U+Iee7yV+Pk8zx5Ra04tIhGN1yhKSem1kLNJKb+ht++uPQORRInU42bz7Jaz7ungYnEF0SPv6GfpV+l1VqX+QRNed7ORFKIJxWvQVQx382PFRggN64aLeVdgIbpEWI1Ei16uTcwcdhPBxU5+vi+l8+eK0UtDa7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P7FBUzzdeICfAgLQvTHD1/45ag8L1V4jBam/fbVczM0=;
 b=XNkdFVo6QPFUcALffm1rDf10qbNNS5y7g/BxTKolF/Gv9Q6irSWAPrjAQlDiFdbOO3IZuc5lJf/W3retsXg4Jn8Vgf8aJyuov34BPFZf7QZ3Fd3vETvrFI/hEr3OsWovQOX4zmLAmTF19eZs/5Tb5jU7DtxXL4y00FGICmoTUEbCxdcuTJYcAM21AVm1AXiR7+Kr0HNOOV+wN9zInPexILYtNLf0ka9QROvFokkErVSWT2X2FtLB83Hr4fbLpX/VnO2mtpFxdDJmkD1nobXg1EqgH/L42AQw3+zAdN+VGKrcEMX0mCAoNCqaZxy/cKpbm8pTkzn5t3ZRRCgpDDCGSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P7FBUzzdeICfAgLQvTHD1/45ag8L1V4jBam/fbVczM0=;
 b=ZDu5FvdTiPI3Qfrhvuc/UWrNwlzJow20ezDSqUFw5XiGvvj7KZY2FVb4dFx6N6Q6TC94cAoNuF7GIAXAtTxYMkVzINHDWrdWnMY5Ath74HIC1PMBwOXNwKn/gogLss/Gqw/b+Ui+TzzF2eZCBwnz4p2+dcbXNk/lg5FzwAfOCGg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OSAPR01MB2675.jpnprd01.prod.outlook.com (2603:1096:604:8::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15; Tue, 30 Aug
 2022 03:17:04 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::bdab:be26:6e36:88c6]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::bdab:be26:6e36:88c6%3]) with mapi id 15.20.5566.021; Tue, 30 Aug 2022
 03:17:04 +0000
Message-ID: <87sfle4dzk.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 1/3] ASoC: soc-pcm.c: remove unnecessary
 codec2codec_close_delayed_work()
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
In-Reply-To: <87tu5u4e0c.wl-kuninori.morimoto.gx@renesas.com>
References: <87tu5u4e0c.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 30 Aug 2022 03:17:03 +0000
X-ClientProxiedBy: TYAPR04CA0017.apcprd04.prod.outlook.com
 (2603:1096:404:15::29) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1b2a909f-9148-49fb-8d7d-08da8a361cab
X-MS-TrafficTypeDiagnostic: OSAPR01MB2675:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tRccPHizpkeBgQa98HD7csMVxvaIytupbuGiUlIk3JcDr8NXcgkCt2NZgNBMSdfHQyDPCbbKgJ9aZ7xG9rXPMb0X5Bo8BZxBwFwDeAT3zSJcrc80GxBSWcZRl43h7CSsW05K/14SkVHlz4jStKJnqBk4zBqlCucFFrhnL0y0v9zwRuMbskGkP/HNtgSfcwwZdHQao6Ohyk+blzkNkjA3Es/U8LIJlIMlySrmBZi6UwoscAh6d6BsDR6DlDRdUg/uqOQOhyHL7OUbVkSq8q/+7FRiW2WEuL8X8h0J5ZA9ZpPu2RExI560nTGx/MpFNkvDFZhfw3mw8rOI1aV7AlR9WrY3hwgdJB4Fk8XW08w7NTlb8aOGH8KWkdlKyOlTFlZ19J2JAN48i5ttQ4IYp676zsor3Wn1pabWKaECrEY2OaFIkf8qAZx4AB9Olbi8ZVl/W07EqUx+bif07mFiAzpTWfB35gEA/1p8j3FcV3hdx8QL3g6jSf9p0pvRfyzpzZ7/mJzpwiUsX2NBDPubW7i+L2YcN/1U8xV/XfT5Z24IqowlcWmGr3Z0O42vAVNHmOgYTwKvp0Oezf1AXeZkp3F/7lm4A0A8wonw1cOE2Ri41ez82fgltvvLZQ09Xog6ILGDijnRsQ7l8WnBLjSmkvCoLF2djhoSv9lKq09Vj6+qX2pyqlVrNRipSVPUpxZBtnkuXmJj4Efrl97JzIneSZkW/5fl8JeIDNlAv6qCbEXrTHre6pP+we2zEFjYzD2/Fpb3Tb6oYpOr0yDpCb9yN3Bb2A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB8426.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(136003)(39860400002)(346002)(376002)(396003)(366004)(316002)(38100700002)(38350700002)(6512007)(26005)(8936002)(41300700001)(5660300002)(478600001)(86362001)(4326008)(8676002)(2906002)(66946007)(52116002)(6486002)(6506007)(66556008)(66476007)(2616005)(83380400001)(186003)(36756003)(6916009);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ZXrzjq0+drtm6EGEz6Lqga0D/KZYGSQlkijIj1qx+7ogSZQco+7RXpsryvOc?=
 =?us-ascii?Q?WtOkDzojrbjtNSla8DGloISbFkoVJEhWLi4ZPAblF3rOoyCaxKD4ovt5zifX?=
 =?us-ascii?Q?m3vjdqtYeyipKdhpniskokZCtJHoD9EbfRG6h1g8txWUjJdso61l80XLyMba?=
 =?us-ascii?Q?kXXIpOa6bXnDOz1JpsQhAu1LCBBW//TMvtibJnm5RV0Qkyfzg2aXFlD4L8UI?=
 =?us-ascii?Q?Zh6G6+WUmNPFNQEf2tZt90AVp8Qgoc7Cb7C3uUsSalJvMdx7O8n5Ejvg0sSI?=
 =?us-ascii?Q?scTO1imDsPW1hrtnE3hEbEKi2jRLP4/V1wJJYfaYSJZOqQxtlRDmLUW0WuDk?=
 =?us-ascii?Q?RIQt+qB4sX1N9TvsBrCwe5abIglvIePsyor8ZQC3r9NC0SoSOMDM4Pc6p8xB?=
 =?us-ascii?Q?M83vSjVjOjfZcJCuvw9kdZXaHLDbh+JPWOwk56KEaKJIy1B7zPe0sDPmk+h9?=
 =?us-ascii?Q?v0gDKotlmJEJLccjzJCu+lMG86Bx+7kQJ+OCd/8gHHM5QG4q6ap8OlrGb0wu?=
 =?us-ascii?Q?0Jd28PKfv8Ph6F7hBeoK0t9jcXRcNWddM5Ljl62oztdlbcqOxqvQos7el4wH?=
 =?us-ascii?Q?sDjaHYVqdcQPoPrqZP7W1F/+0Ks/guQxHw1Fcg1AV72OpqEe+MJ+/a1KYEIm?=
 =?us-ascii?Q?6FS/sf0/kSwm2ijn27M9N7lc2Wr+7CqWvS5wfW9/vQQ0+CCT8qXby07Rf7cF?=
 =?us-ascii?Q?oeP0LK63mg6uxINIViIjmFyYPD1C6G+lRXwaa+2iJgk7HDaag8ITtXYRJIHS?=
 =?us-ascii?Q?FePbbwDs6YhLXfH/SV9ksitTeU/diJlK6icjZWlWqACyW70iI3c4Dzy9R/q6?=
 =?us-ascii?Q?KyaSQnAzBJ9wuiVeW/W5uVWYWOPJm/kwgUM2eNvrADo3FiKhDkunExcDmPH3?=
 =?us-ascii?Q?aUrmTf5U+w3HfyeLvb8DHz+uadvQtIb607N0de+yV0lEXIaKE7GMA7SWSGJy?=
 =?us-ascii?Q?Bx6+m3hw+sJ2LLO5vCxKn89RQ9X7hXJWTwLwTNJ4Kp04xRU16RLN3mSh8RFJ?=
 =?us-ascii?Q?qeTFu56Q7d6yDW+DYwTmFm5Kf9y8XPheZjPAQMMzr8C6AyrCuV/uIwTX2lPn?=
 =?us-ascii?Q?7G4AKS5qGu4Oek7hv7Bxh2N889sDyhf+US/zz+r9zLAD4xPynrtXPF9FdIXk?=
 =?us-ascii?Q?jWNvJwbYX+7fMLwUjtXayukXr/ONlr1AqUDUY5OU9bOPSyGrYVtT9SZy2KEq?=
 =?us-ascii?Q?tOIjlbSioS+xh1WlxVYdLrxtV0cQ3pbZ7fYYdEUv+qIIKTaqRC6VtAjWw1Um?=
 =?us-ascii?Q?iC40TxwGZSMr4mxVIQK6g1xHcmps1/Lh6L1+2WgpnmeVkMzKwRfThgfmCb2E?=
 =?us-ascii?Q?Thg8oNya3D29tPGaK2hcKXdX9hYVi0Ub72NBb2+5eKulwpkT3M4kyx2I4/D6?=
 =?us-ascii?Q?dqCmtO2Q4pzXbAYnQu/4RORLq7t1ZawAcCBT5kEFEMeZROD4nxHqyHooyAUV?=
 =?us-ascii?Q?gQn9oZz7N14QHF95SlC6c/vpL5kYSDqJeYh60Swf0mF4TteHl74LjOtGbKlI?=
 =?us-ascii?Q?i2XI4LUY9m2mw4uOSoZU24tgRgR2pZ4/EMzeSW6tTN2vyKNZmdF/U9/Xg6t4?=
 =?us-ascii?Q?H0FowqJj416ovoF729enuerTsQsDepuBWYh1iPNCqcprQUoXSXauQNKqwpp9?=
 =?us-ascii?Q?MS0aNpOzzXYvCTComASZPus=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b2a909f-9148-49fb-8d7d-08da8a361cab
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2022 03:17:04.0999 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ECU2ZMT9+E8Y973wiBQEA5xF/7YQnytaJ9KFx82v6SMt6DxWdMYk6j8AXwF3PtjVW9+gJAzY9TskygpaPu5cTTBAx1WdadixulhRh4p5DDefTP8gHnaJXzFUFd3w3jG5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSAPR01MB2675
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

commit 4bf2e385aa59c2fae ("ASoC: core: Init pcm runtime work early to
avoid warnings") has added generic close_delayed_work() which checks
close_delayed_work_func

	static void close_delayed_work(...) {
		...
=>		if (rtd->close_delayed_work_func)
			rtd->close_delayed_work_func(rtd);
	}

So, we don't need to have NULL function for Codec2Codec.

=>	static void codec2codec_close_delayed_work()
	{
		/*
		 * Currently nothing to do for c2c links
		 * Since c2c links are internal nodes in the DAPM graph and
		 * don't interface with the outside world or application layer
		 * we don't have to do any special handling on close.
		 */
	}

	int soc_new_pcm(...)
	{
		...
		if (rtd->dai_link->params)
=>			rtd->close_delayed_work_func = codec2codec_close_delayed_work;
		else
			rtd->close_delayed_work_func = snd_soc_close_delayed_work;
		...
	}

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/soc-pcm.c | 20 +++++++-------------
 1 file changed, 7 insertions(+), 13 deletions(-)

diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index 7c4fbf992d90..cbb3db53321d 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -852,16 +852,6 @@ static int soc_pcm_open(struct snd_pcm_substream *substream)
 	return ret;
 }
 
-static void codec2codec_close_delayed_work(struct snd_soc_pcm_runtime *rtd)
-{
-	/*
-	 * Currently nothing to do for c2c links
-	 * Since c2c links are internal nodes in the DAPM graph and
-	 * don't interface with the outside world or application layer
-	 * we don't have to do any special handling on close.
-	 */
-}
-
 /*
  * Called by ALSA when the PCM substream is prepared, can set format, sample
  * rate, etc.  This function is non atomic and can be called multiple times,
@@ -2899,9 +2889,13 @@ int soc_new_pcm(struct snd_soc_pcm_runtime *rtd, int num)
 		return ret;
 
 	/* DAPM dai link stream work */
-	if (rtd->dai_link->params)
-		rtd->close_delayed_work_func = codec2codec_close_delayed_work;
-	else
+	/*
+	 * Currently nothing to do for c2c links
+	 * Since c2c links are internal nodes in the DAPM graph and
+	 * don't interface with the outside world or application layer
+	 * we don't have to do any special handling on close.
+	 */
+	if (!rtd->dai_link->params)
 		rtd->close_delayed_work_func = snd_soc_close_delayed_work;
 
 	rtd->pcm = pcm;
-- 
2.25.1

