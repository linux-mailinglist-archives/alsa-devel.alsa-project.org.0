Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A7E35BDD57
	for <lists+alsa-devel@lfdr.de>; Tue, 20 Sep 2022 08:34:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D911884C;
	Tue, 20 Sep 2022 08:33:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D911884C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663655641;
	bh=Y6Wi8BJEDthzDCFq1VmMIXeqryCzq4ZzXtzygFcC9cg=;
	h=From:Subject:To:In-Reply-To:References:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mh6pyLNQvE3qpqjpm3Z8CLXgOYL2y7XHiESE8Ytpcd9zMeDw6QZetqVFm6yKOsYFs
	 iIsOLw8u9CGVEjp47X2QYOTxESQ5RZgaJ0ZrKSe7ULhW7g24ZXPwVS9eGWszteujpq
	 23gwXpkTpOCg60C3pdtEzLgkd7bNxxIGhWokwBGQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8AEBEF8053B;
	Tue, 20 Sep 2022 08:32:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 13AD9F80549; Tue, 20 Sep 2022 08:32:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on2138.outbound.protection.outlook.com [40.107.114.138])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 42C4CF80543
 for <alsa-devel@alsa-project.org>; Tue, 20 Sep 2022 08:32:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 42C4CF80543
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com
 header.b="GELDXiyv"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UcK1sY//GNET2eeW2A5el/AlO1/JtEYAxQAjxYR+9Zx9MDb4yUufLnNJQDTUxwP+W5PEa8UckjOcfxx7RIgVMkUReCTslc0kFz94Sp+Vh3VwOH9OhkYf5MrwxNxv2bw1i4cxorOgehzTSwgeJzDa+V0u/B1rlvUiW/o4HKzCcFPD+OS0aV5kN69k3cM3H2NYLPdJccZG8BsJRCZDPhPLAxKj2dotDxYcknXRbvO+VuRxfckvz8ffd440c0geYfONVThAOart9AyAk9lm+ap1Ugeus2HnROKy3w6SLnAGAvs/qL8qKd6qJIX7f0zcMgtYFm4mmmcc2M+p9UyQAw+6SA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VnAr7oyMHMlt3s9AO+66MWn2EGBsXlAU7VqwfAUM7/s=;
 b=CmDMfGTKCq4O7QDbru1hWnKbkxq5ERXqfvamTTpEcWVd9zlTO7DXYhQ6ni1Z5v20P79fiLTlm37wkmHhX2LN23ITozobDUGeBVnPYDYsxS6xdEkfmk/9OYLO+Vh4blL26Fri/yZUJXzNKAA/QzRjp3YbpEofDi+PUlsifGB7+nZ6rc5YdYvNKv4xn9Nt8W8lfZswdiT6ol+gqnM4YnWoay6XDgXz2Z1LahLgTcW54KXu3dCfGv1WFIHntkg4yfSRVQ45NycXO/wZsgvkRRSd7ehJLrSsmPos1zYhnCXlyF6rF569Y32wKF5L9Bzi18PBZlHQpMQke3U4RUA/sOaDvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VnAr7oyMHMlt3s9AO+66MWn2EGBsXlAU7VqwfAUM7/s=;
 b=GELDXiyvQ2nqx0mwszIyA7wpKK5I4b5n5K862BIp/I4Tn2mk6q2ponbdiG+/ik43sI5k7yxwYLDUicMLpxaKp60hKjs70YRsml36MMUHIcO0ZPdrETZAX3HsyrBdQYsqCjPk2Gw81D9JEUHyspjWdXy3ETcj2Qaoz1CeJmRTXTM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYCPR01MB9522.jpnprd01.prod.outlook.com (2603:1096:400:192::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.17; Tue, 20 Sep
 2022 06:32:36 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::31e5:9cdb:edd5:cf96]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::31e5:9cdb:edd5:cf96%7]) with mapi id 15.20.5632.021; Tue, 20 Sep 2022
 06:32:36 +0000
Message-ID: <87pmfqv9mk.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 3/3] ASoC: soc.h: use array instead of playback/capture_widget
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
In-Reply-To: <87tu52v9nw.wl-kuninori.morimoto.gx@renesas.com>
References: <87tu52v9nw.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 20 Sep 2022 06:32:36 +0000
X-ClientProxiedBy: TYAPR01CA0122.jpnprd01.prod.outlook.com
 (2603:1096:404:2d::14) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYCPR01MB9522:EE_
X-MS-Office365-Filtering-Correlation-Id: 36da9ee0-6f7a-4f7e-8fb5-08da9ad1e840
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GyVCHgcQjrOxvjZ/SSZVcSKuyKwIUI8dvrA3on6XyhCWqyKXJR1QxaIRyM78bFbafRV5DghbFOWUK77noo/+C45C9HUfccimz2s9GawjbtoGuP7nDkURj07g7/9Ph45Is1+Nsx7AvERD88RKqMFy7tVoscWuNH5BCA+2QDYKZcDffDy+ZEk2AUUbaNSs5tYovxy1Vhy//zoCVZaiK6jm0s53SbJi7lXlTIGnYUU1foCg5RaS2RqOsLewpflnArFkVEjnGptGAxm77YFi7kl4Ni3gjzhMaq4J4nN7Sxws228eXL5xnp2IQoxe7mEISEoSsEqQLPclt3EZE1Ix66ESo4GGgs/aAZFt6d7U2if7ra3r2UUUZBZk/1QXPoJOjx8npLIvSKtk0kAEPRga9bkFfVsmoc4Xuv1dY/Y4SjEUcEPgEbD84KoEuOkri8+viqaof6WG+aDKPIthW06MdHAD0N2JLaV0H8wGKiJRj13yjzfLKFrYWphnNgi2ToLyWiAODA+FPr364x7CxTPZsl0UcGifJiboGVBlLQkEaSOVHnqztdkQJD6ZXqfzugrLw6rPPeh5p6dUd2P5uzhT5LwGfWVmirCOoXNUzSvUEcEyDcJcu7rLNIi1FtD9hdarXJQhvFzkv5jGNU/9MQ9DU4OKNjM52LDK1CosqgKxXZ2qivnRNPiHIBPzuEvf2OMQlYyGy34qhQO7fP+fWOHT4MjBAEMStMDIcMk5Xba/iPzwlqNOxMUjNeAUhWdh3m+0ugLWk94nL0CqQ1A8v1zLKDYsHA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB8426.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(39860400002)(376002)(396003)(366004)(136003)(346002)(451199015)(83380400001)(38100700002)(38350700002)(186003)(2906002)(5660300002)(8936002)(66946007)(478600001)(41300700001)(6506007)(6486002)(6512007)(26005)(52116002)(8676002)(66556008)(66476007)(316002)(6916009)(2616005)(36756003)(4326008)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?TOS0mo6q7OMqGq83tjHxWaAXvbB+aI9UFx0p3ntD2SZV17BTzY9O3Tc/4qji?=
 =?us-ascii?Q?NPmtEvpNBgLexYXnzLsFbt8492cpMHDjxBVSHVFSoWocv+T7IHqf7bMvRxIp?=
 =?us-ascii?Q?eoYKCsMubdzaGt9hDD7J8tpUUGmzJd6DNma4kqEjw85QGT4HZLiuJHoqw87J?=
 =?us-ascii?Q?8a34jDej0HPZVCBq6gSJLdNPxbhGoGdLdkb1TJ5h8cUU//xJ/bcjVKEtVv+1?=
 =?us-ascii?Q?x+JBraweEE/HOSULq1H6i5wTiG3pL2ecgPTN/pjdp+ADRpsTzFgYqOnhzV4E?=
 =?us-ascii?Q?SoLET+0TmBuxw2oRjgAWZznDstbESdySsTSR9ld0vr+6ZbWMImiKUX/hzT8m?=
 =?us-ascii?Q?9RxY019upkOaquGEXO3wQCZ9fwiBoHL3UVoEEFdkf0iNKy5E/Qpv6y4IgKf/?=
 =?us-ascii?Q?XmjyZaTINd29jKOJ42ogiC5C8ZuvTFUowwm0rT12mXUNa8VFypqi8ecQyThn?=
 =?us-ascii?Q?1YAjevVr3v//EmMWY5cd06QkN75n61Ss2Dd9WcJ8RO5vxEM3lNsLzCzYOGpE?=
 =?us-ascii?Q?04WPNsTDlMuS/GeAzWj3KXsXV6s8WJRS1VegutRRU3UzvVgZEW+KMyZcH6YN?=
 =?us-ascii?Q?CyBK4JIIB+a1Tdl5ZPkv2zM04ASPh3Wzo1zCpeek+XUiwHJYr9IHsxcw4y1d?=
 =?us-ascii?Q?D9UhNeh5Ohp8TQhyIa2CuTyVPK6icDduTkzWuHQJcm2e/7jo17IREFHfPOhQ?=
 =?us-ascii?Q?ADcfgJ93XxVDwuMHgn3lL9ZzFPj4Mbz/8IuEC0ZQ2vzAhjIBKlAKWN4NX0qi?=
 =?us-ascii?Q?cLqpOJ+bV9bJ474K40lkHS5XycFi9v0vjwtog0ni6H41xjRsvGWIttgEf9eT?=
 =?us-ascii?Q?FXULwdNAW7f47gKCSSfBOFbrngsJtgfdjhiiCN63x9AX338Oj3iUJxiyTMRC?=
 =?us-ascii?Q?KR+hxBBv8r81zOwWnmHXKxjP/eGqK6GvzBHCUfqCCgzKTgm1PXLM9LBljU0J?=
 =?us-ascii?Q?VE3L7bgBhq3dL8b9rZGMUVk5NAX1TZ171oXD5VzXqyFFNMbgWakvwCF+FsIp?=
 =?us-ascii?Q?TQD30HIaNeiEqETqFaAIJ+AIPlfk95fsXhiBkI9kCh94q1OQHQVe+r4vOOiY?=
 =?us-ascii?Q?BjSidpSDBN7d85lI5yekqipojPzQaTG5gEkLBntkpes+rsqG+5LmByGWN8QP?=
 =?us-ascii?Q?u/HCFR3taOhn7oGszz/0qTKS3oQoIEsU2j5ta0Bx2STTGOpyhFMRHvmjMmlG?=
 =?us-ascii?Q?xrKweJzprPbrqEpihGvVoHiL6w049JIpGEnly8M8u563JwwsJB2LIq8hcOCk?=
 =?us-ascii?Q?HJULbY6kxRW3V48DbP30mYvKluADDccxbo5RFvlIU6ZXqA1Tdco6dP6+RdHA?=
 =?us-ascii?Q?TJFITN3P0A9h+TNGXT3Ru0eqT9/cFh9o9dsfP4+EIXKVcJPSCLaNM+wMkiXs?=
 =?us-ascii?Q?q21FEg60HKG645e+wUx8naJxHAoC8SFTqRUvtZYZnWo5wHuO++CzIx3fIlA0?=
 =?us-ascii?Q?Gx9lBWgCSTJLWRCJ5OpWjlZfaikoECFuxYu7tePQxTdRVi1mEXSd22hYXNQr?=
 =?us-ascii?Q?kK+6jFjpSJ5akipJjPLl2tzw7YSuQN26k8un8kjXvxN1hAEvF6nlAhSBP/N1?=
 =?us-ascii?Q?lotxwmPV6LRvQT+P5zPnKBrjmU1JCh+BzcxeDUodVxX36dZzKOeC4Y3tz8Nq?=
 =?us-ascii?Q?e+VX/MLxHqoPSg8217RgzPY=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 36da9ee0-6f7a-4f7e-8fb5-08da9ad1e840
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2022 06:32:36.2827 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4H0K8qI/OdaUxXv2EF5W4BsKdYZmykz8rfYW/0BSUEXHvqStnvNLWcMblRKiQFnylFzmRN0Ejfxe8w5WXSKUS9VsZZa1iFxi4upKLypVvl0guSclNJrfkiCFhOBnqQWB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB9522
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

snd_soc_pcm_runtime has playback/capture_widget for Codec2Coddec.
The naming is unclear.
This patch names it as c2c_widget and uses array.

	struct snd_soc_pcm_runtime {
		...
=>		struct snd_soc_dapm_widget *playback_widget;
=>		struct snd_soc_dapm_widget *capture_widget;
		...
	}

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 include/sound/soc.h  |  4 +---
 sound/soc/soc-dapm.c | 19 +++++++++++--------
 2 files changed, 12 insertions(+), 11 deletions(-)

diff --git a/include/sound/soc.h b/include/sound/soc.h
index 4adb6236860c..37bbfc8b45cb 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -1063,6 +1063,7 @@ struct snd_soc_pcm_runtime {
 
 	/* Dynamic PCM BE runtime data */
 	struct snd_soc_dpcm_runtime dpcm[SNDRV_PCM_STREAM_LAST + 1];
+	struct snd_soc_dapm_widget *c2c_widget[SNDRV_PCM_STREAM_LAST + 1];
 
 	long pmdown_time;
 
@@ -1079,9 +1080,6 @@ struct snd_soc_pcm_runtime {
 	 */
 	struct snd_soc_dai **dais;
 
-	struct snd_soc_dapm_widget *playback_widget;
-	struct snd_soc_dapm_widget *capture_widget;
-
 	struct delayed_work delayed_work;
 	void (*close_delayed_work_func)(struct snd_soc_pcm_runtime *rtd);
 #ifdef CONFIG_DEBUG_FS
diff --git a/sound/soc/soc-dapm.c b/sound/soc/soc-dapm.c
index f10133f35c5d..d515e7a78ea8 100644
--- a/sound/soc/soc-dapm.c
+++ b/sound/soc/soc-dapm.c
@@ -4361,6 +4361,7 @@ static void dapm_connect_dai_pair(struct snd_soc_card *card,
 	struct snd_soc_dapm_widget *dai, *codec, *playback_cpu, *capture_cpu;
 	struct snd_pcm_substream *substream;
 	struct snd_pcm_str *streams = rtd->pcm->streams;
+	int stream;
 
 	if (dai_link->params) {
 		playback_cpu = cpu_dai->capture_widget;
@@ -4371,37 +4372,39 @@ static void dapm_connect_dai_pair(struct snd_soc_card *card,
 	}
 
 	/* connect BE DAI playback if widgets are valid */
+	stream = SNDRV_PCM_STREAM_PLAYBACK;
 	codec = codec_dai->playback_widget;
 
 	if (playback_cpu && codec) {
-		if (dai_link->params && !rtd->playback_widget) {
-			substream = streams[SNDRV_PCM_STREAM_PLAYBACK].substream;
+		if (dai_link->params && !rtd->c2c_widget[stream]) {
+			substream = streams[stream].substream;
 			dai = snd_soc_dapm_new_dai(card, substream, "playback");
 			if (IS_ERR(dai))
 				goto capture;
-			rtd->playback_widget = dai;
+			rtd->c2c_widget[stream] = dai;
 		}
 
 		dapm_connect_dai_routes(&card->dapm, cpu_dai, playback_cpu,
-					rtd->playback_widget,
+					rtd->c2c_widget[stream],
 					codec_dai, codec);
 	}
 
 capture:
 	/* connect BE DAI capture if widgets are valid */
+	stream = SNDRV_PCM_STREAM_CAPTURE;
 	codec = codec_dai->capture_widget;
 
 	if (codec && capture_cpu) {
-		if (dai_link->params && !rtd->capture_widget) {
-			substream = streams[SNDRV_PCM_STREAM_CAPTURE].substream;
+		if (dai_link->params && !rtd->c2c_widget[stream]) {
+			substream = streams[stream].substream;
 			dai = snd_soc_dapm_new_dai(card, substream, "capture");
 			if (IS_ERR(dai))
 				return;
-			rtd->capture_widget = dai;
+			rtd->c2c_widget[stream] = dai;
 		}
 
 		dapm_connect_dai_routes(&card->dapm, codec_dai, codec,
-					rtd->capture_widget,
+					rtd->c2c_widget[stream],
 					cpu_dai, capture_cpu);
 	}
 }
-- 
2.25.1

