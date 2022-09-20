Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 350455BDD53
	for <lists+alsa-devel@lfdr.de>; Tue, 20 Sep 2022 08:33:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C65499F6;
	Tue, 20 Sep 2022 08:32:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C65499F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663655611;
	bh=6JNLkkwb3uA0POVVcBwSHVPSOK13c4W5VxBmp/AmXSg=;
	h=From:Subject:To:In-Reply-To:References:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RaKxGXXzeK5Ti7y6rwPfW+r2eUVXNbxxIYKRihUV6ynOWNAcrReyI5A+s75SDLLPw
	 sFgVsFeqrLQb4DnZyA7Yqh/MLcUXutmwXmJEKfEfVOTxoe9uDlpLGu71Vj0wXnKZ73
	 yYAoKoCMw6R759yV0w2E0kzPwHx+ErA1iKkVcAno=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C9632F801D5;
	Tue, 20 Sep 2022 08:32:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C91DDF804D8; Tue, 20 Sep 2022 08:32:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2105.outbound.protection.outlook.com [40.107.113.105])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 988DFF80171
 for <alsa-devel@alsa-project.org>; Tue, 20 Sep 2022 08:32:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 988DFF80171
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com
 header.b="n0PYPEcP"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XanxaP7Z2F+Fx5KiIhk9+g2D5i8pViQZE0ArhFzohrZvL1TdDPuRKT7ed18H2VtZnX7dJg+T7dNophhAXQv9078dXvjY2FH3sL7g/iTwaFMYgEA2h0uyn06PpHMZr2l1b8jPr4mRc2gBfXHVZ9+OMfnCOrZ8vpPwSn0++sY1GSgmTXwL3+z62bgDEFFQxsAWtdzCOuqgSzpuzTTmZwbe92bKIyB1re3Fzd6HJB0DVUGsOjPn2Vzp7OBUGOowZX7gCFw8AK6BkigQSRpoJq0pLNkf5UsQthGDpSLglo4J/dU7hhTzKQvLQcyHnmZ6zMdaGuzv77pdWE8W07XrUH4ksA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AcLCxin2KVuSXN39CvQqhqljsI+UynKDai7Ep2MjBGw=;
 b=A/qgGI6OMUajerdlfF0l1s7gwMXQvqHmJb2391QsXBB+xbj2dEqKOS4nGbNbE+rodLOPoxePoGZr9vKEWi+MvYsbwfsCzggSNu1ptZPt5RSMqP1feIasQm9NzevqDD4L1eywfm0eUT8z8ts8ki1X34LPdHqwmm3NyWIlsY06+nyfk55TAqZ/nio4KyKgdz/YLRLvF4+r+aDhTbZ0qgVpH63eLOBbVsP+kfUkDubmSnWS+DorbBvm3QAzrL4XHyjp8/a9/LQqn/rJ7dkyPDvrItkZtvyMzKlLtezzpWbLIFrNK8scjvPqQN07cJARaK1vlQvtVRyFbQd80tdct3ZHpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AcLCxin2KVuSXN39CvQqhqljsI+UynKDai7Ep2MjBGw=;
 b=n0PYPEcPAmuHNWmYhi91dAcPWCP/bej5DEj8cmLTL66vqosfWD5u/vzyr791O6CowxQ0fPFvK0jaHZfSL9afcypsceCV3TqmzvlTUW6y1G7K7VdZ2D6N80Co+TlBOPuY9d1IsUi0D+LKcRNvzXteoy6GH0VKdiydmeNkyKJUQHQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYCPR01MB8239.jpnprd01.prod.outlook.com (2603:1096:400:104::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.21; Tue, 20 Sep
 2022 06:32:17 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::31e5:9cdb:edd5:cf96]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::31e5:9cdb:edd5:cf96%7]) with mapi id 15.20.5632.021; Tue, 20 Sep 2022
 06:32:17 +0000
Message-ID: <87sfkmv9n3.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 1/3] ASoC: soc.h: remove num_cpus/codecs
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
In-Reply-To: <87tu52v9nw.wl-kuninori.morimoto.gx@renesas.com>
References: <87tu52v9nw.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 20 Sep 2022 06:32:16 +0000
X-ClientProxiedBy: TY2PR02CA0016.apcprd02.prod.outlook.com
 (2603:1096:404:56::28) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYCPR01MB8239:EE_
X-MS-Office365-Filtering-Correlation-Id: 3983bb9d-4b1e-4547-463d-08da9ad1dcb2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9T4D3nNSR++98DVJsa30QG9+N6bnHscLuhZA/ExgInIjwYu1FYNnTtjjf8+x4NEJDA9ZKOeVppCtZ8ikpJh1lUliiMzjAnD8S24aO4KG/eE4rA2rrSDjZzszMzIRKmwxCfGFENcCuAl70D09x+eBX8GTDJHvAod6Z0oiQPXhp42nMOfAftK3NTCk8JkexQ/FcgtCfXolCfQkaoVo07YYZUolznSGDPZvMAWGi2r8A5IYxaempKA/kDKX6oezm/uoQnz+Q0FBnyxPNCeACNv4MiPSz6FZ3hIN9lNIpIIBl0fYKeI59V5oCJ7ekJGKpvwufAoXdSJnmTCm82r5WUiQTXBTUF0zYHaBfKOSgtVrEbOtHVpiUaMtUi82ydUPQvFi3qIy3Sur8DchaxhCn+zbP/vkxKBngbSgzvrCP6NzMg09INQicDQhnxYW3LhywYoOIAIIPOSuhh/v294s+Axs4SzJDmPw7juevejyqTfSmeXqaGTbWqBKGxfRjdM+V9bVWadiw36AlArILlOhDUYzkGCNE8yQbP2dWuNg909MmXJxTQKOIZQFOwu9i5GETzmU72KxchaDdFtnCSPblzr/xluN4DJtZxcwdsxwDRWqOKU+SHXQaBzen/gbufewtzodp7ggFZFVvSo8zY3nbyHsLvzQwQRoIIIcqgpkCn7tRTrGgv2RcOTYEhxblqsgC9XOQXwMMnB7ckxsL0TAl6T4Tu9x9UXd5hSVB4N0xr+7sfNBYfqyXVVSmEtfINz+RNQHvc3Vjgr10vl4qX0gBrcILQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB8426.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(366004)(396003)(376002)(346002)(39860400002)(451199015)(6916009)(83380400001)(86362001)(2906002)(316002)(36756003)(6512007)(26005)(478600001)(6486002)(52116002)(41300700001)(6506007)(2616005)(186003)(38350700002)(38100700002)(5660300002)(4326008)(8936002)(66946007)(8676002)(30864003)(66556008)(66476007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?foMrVcd1OKD+UdhDbwGs9dyeZm2Lj7unGx1v9Giw/5c2ElCmHI+KoPR5BoM3?=
 =?us-ascii?Q?Lv3GX7a4QD+QY0neRgRh+MloxVaDyJ0TkMl//tnGbH6R8jSZsQ0ZWmLyz75V?=
 =?us-ascii?Q?fdvwx8ku45fAA6VSdb/IFQYC4ZXZCVO086yx8sTZclz03/sJhR4P/AeJezn0?=
 =?us-ascii?Q?/vrca/HDgbnCQLa/giUdXzK6E7htsZq6hVdRr81OPgUo3bWVELzEixD6SJ04?=
 =?us-ascii?Q?2pM+LDI4xZbJTBi8aUFCjMcaOWKpnD3Pnr8cYieVKI92PmryPDfjrNCCP0EN?=
 =?us-ascii?Q?A5GgYYjUUC6G+L6quWA/yAGFB7LKv3hxnYor2KK8YzwgGg0H/C+tApWQtn+G?=
 =?us-ascii?Q?A1VYLJsbr1m1sHdhIZzOl5vMLzS05mm+7zknXT0r0sH2bpWGInNpGZ544Oj7?=
 =?us-ascii?Q?/T8pb4S76Y7uLGy4vWLCciY+G3MWO1dGrcefd/wo3VuOMITitDOfnPzqGXtq?=
 =?us-ascii?Q?4jXTuiFzK+sqEHXDOm1F+51I+6o5QGjhvHbgYxw+yOInRKdczfoGC2TrTmWq?=
 =?us-ascii?Q?VZvs9cP0wV+s3Go1LAhnaxpT8rE6WH/esW3tWaa413jw+gZW4vxWgVn/Vl6b?=
 =?us-ascii?Q?xkNh3Erj/NE1tt700tGQ1wknqSt4IHQxFpf+tIyhm3/64EdB5GjAt2WQu7RP?=
 =?us-ascii?Q?mx49Oh46FEZh/1pRvlDH45c60Vp/1CXTIE+CuduKYuTHx+aDSih5e1I2Wmy5?=
 =?us-ascii?Q?/dethmbaTFvn9IdKm/IO6huwd85Tz1lAwhQDWRiikJsULfBtd9npHrq8XQsK?=
 =?us-ascii?Q?XMo0IjD1Jc3OgYTEB+seVBfGDovV39dYOVXaatgczgHHwiTQL7zapDgzMYsh?=
 =?us-ascii?Q?cWlfpDP+2dFBSqLCX8+K+Nh+Cyb/QU/IZea/2yTy4a8tYFrJwEZyBNjIBLVq?=
 =?us-ascii?Q?WqDAx8R8jMe1ZYL04PBfStk/MM3+YLJ+20pTu8sdhOgm70RZXQfZ7vRMvk+w?=
 =?us-ascii?Q?phbkO/s/USmLgXT9ANIXPqAeRbP1mik3bGnKbnHZ1VhlapN1oNyC5X6Oe52u?=
 =?us-ascii?Q?S1AfwFJHuhPhV2nx6apXVdCZkW/s2Y/Ok/dYRykxu/ehq7aJ+lcAwvYDF3vP?=
 =?us-ascii?Q?KZK/TrQLjE7dEeCmuY5bFA41SeX0MuRiy73lO/s9oWLTZJvw2IxGn5JqrN/A?=
 =?us-ascii?Q?IIN8VKKHL+UE/TQWQbevM17eorciBtNaVxXIiItI+elRwzwC6leDFfGreyAy?=
 =?us-ascii?Q?GKQjR+uncJV7KyaKEQ9cLCNFqIpiDu2p75WGKlMZpQ4GJxceQx/snH1BByyv?=
 =?us-ascii?Q?dbZUltLkAs6jMv4w4ZZIQzqGrunrvhj142HWqvSB20qoisZVAhVHXzLh2Nu8?=
 =?us-ascii?Q?voETgaDr/jffE+mQWEMwW9EP/GFncIMQe5Rwrwdj/4nXwoi4ufl4dNL4VGK9?=
 =?us-ascii?Q?VPvINkh5+QY/DRUrsSgpvifL5ATE2mxWmuOXqgPMllqRPJ0dsEzX9w5gh/zZ?=
 =?us-ascii?Q?5KeSzou4cwRvF/484YqKOWjXkPl92pxNfnBQfqjUcICkc6BS9bTyZdSfDf5k?=
 =?us-ascii?Q?QtmbsDQpNUi9NVvxtpurT9bM0cKed5tEeEYgtPgzqn0RgkfTDesUSM5Nzkqc?=
 =?us-ascii?Q?uMtnNsokGtc5iCOarx6UyQW0E05iPruaUOpR7b7LjWmHZLzp69xJMlztfVwD?=
 =?us-ascii?Q?+DQtmhyMecuPi/WGhmX5cZ4=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3983bb9d-4b1e-4547-463d-08da9ad1dcb2
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2022 06:32:16.9578 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M9hsQfxDzcsMryMYIsb6c0gCJytP/EBXOIXWTSqY+t5DkT3/XWwhJ+GhNnvKllqsbrOpioigJ8G2W1dD5bd5xH3yqU7RSAHAcLKiF5e9vtLZjsZ172ODkkeywCY0fNmH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB8239
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

Current rtd has both dai_link pointer (A) and num_cpus/codecs (B).

(A)	rtd->dai_link	= dai_link;
(B)	rtd->num_cpus	= dai_link->num_cpus;
(B)	rtd->num_codecs	= dai_link->num_codecs;

But, we can get num_cpus/codecs (B) via dai_link (A).
This means we don't need to keep num_cpus/codecs on rtd.
This patch removes these.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 include/sound/soc.h                   | 10 ++++------
 sound/soc/amd/vangogh/acp5x-mach.c    |  2 +-
 sound/soc/samsung/odroid.c            |  2 +-
 sound/soc/soc-compress.c              |  4 ++--
 sound/soc/soc-core.c                  |  4 +---
 sound/soc/soc-dapm.c                  |  4 ++--
 sound/soc/soc-generic-dmaengine-pcm.c |  6 +++---
 sound/soc/soc-pcm.c                   | 20 ++++++++++----------
 sound/soc/sof/topology.c              |  4 ++--
 9 files changed, 26 insertions(+), 30 deletions(-)

diff --git a/include/sound/soc.h b/include/sound/soc.h
index 4351d86eedf6..f5e0c402acb7 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -1078,8 +1078,6 @@ struct snd_soc_pcm_runtime {
 	 *	asoc_rtd_to_codec()
 	 */
 	struct snd_soc_dai **dais;
-	unsigned int num_codecs;
-	unsigned int num_cpus;
 
 	struct snd_soc_dapm_widget *playback_widget;
 	struct snd_soc_dapm_widget *capture_widget;
@@ -1108,7 +1106,7 @@ struct snd_soc_pcm_runtime {
 };
 /* see soc_new_pcm_runtime()  */
 #define asoc_rtd_to_cpu(rtd, n)   (rtd)->dais[n]
-#define asoc_rtd_to_codec(rtd, n) (rtd)->dais[n + (rtd)->num_cpus]
+#define asoc_rtd_to_codec(rtd, n) (rtd)->dais[n + (rtd)->dai_link->num_cpus]
 #define asoc_substream_to_rtd(substream) \
 	(struct snd_soc_pcm_runtime *)snd_pcm_substream_chip(substream)
 
@@ -1118,15 +1116,15 @@ struct snd_soc_pcm_runtime {
 	     (i)++)
 #define for_each_rtd_cpu_dais(rtd, i, dai)				\
 	for ((i) = 0;							\
-	     ((i) < rtd->num_cpus) && ((dai) = asoc_rtd_to_cpu(rtd, i)); \
+	     ((i) < rtd->dai_link->num_cpus) && ((dai) = asoc_rtd_to_cpu(rtd, i)); \
 	     (i)++)
 #define for_each_rtd_codec_dais(rtd, i, dai)				\
 	for ((i) = 0;							\
-	     ((i) < rtd->num_codecs) && ((dai) = asoc_rtd_to_codec(rtd, i)); \
+	     ((i) < rtd->dai_link->num_codecs) && ((dai) = asoc_rtd_to_codec(rtd, i)); \
 	     (i)++)
 #define for_each_rtd_dais(rtd, i, dai)					\
 	for ((i) = 0;							\
-	     ((i) < (rtd)->num_cpus + (rtd)->num_codecs) &&		\
+	     ((i) < (rtd)->dai_link->num_cpus + (rtd)->dai_link->num_codecs) &&	\
 		     ((dai) = (rtd)->dais[i]);				\
 	     (i)++)
 
diff --git a/sound/soc/amd/vangogh/acp5x-mach.c b/sound/soc/amd/vangogh/acp5x-mach.c
index af3737ef9707..eebf2650ad27 100644
--- a/sound/soc/amd/vangogh/acp5x-mach.c
+++ b/sound/soc/amd/vangogh/acp5x-mach.c
@@ -172,7 +172,7 @@ static int acp5x_cs35l41_hw_params(struct snd_pcm_substream *substream,
 	struct snd_soc_card *card = rtd->card;
 	struct snd_soc_dai *codec_dai;
 	int ret, i;
-	unsigned int num_codecs = rtd->num_codecs;
+	unsigned int num_codecs = rtd->dai_link->num_codecs;
 	unsigned int bclk_val;
 
 	ret = 0;
diff --git a/sound/soc/samsung/odroid.c b/sound/soc/samsung/odroid.c
index 4ff12e2e704f..1e0fefa89ad5 100644
--- a/sound/soc/samsung/odroid.c
+++ b/sound/soc/samsung/odroid.c
@@ -97,7 +97,7 @@ static int odroid_card_be_hw_params(struct snd_pcm_substream *substream,
 	if (ret < 0)
 		return ret;
 
-	if (rtd->num_codecs > 1) {
+	if (rtd->dai_link->num_codecs > 1) {
 		struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 1);
 
 		ret = snd_soc_dai_set_sysclk(codec_dai, 0, rclk_freq,
diff --git a/sound/soc/soc-compress.c b/sound/soc/soc-compress.c
index e9dd25894dc0..870f13e1d389 100644
--- a/sound/soc/soc-compress.c
+++ b/sound/soc/soc-compress.c
@@ -560,8 +560,8 @@ int snd_soc_new_compress(struct snd_soc_pcm_runtime *rtd, int num)
 	BUILD_BUG_ON((int)SNDRV_PCM_STREAM_PLAYBACK != (int)SND_COMPRESS_PLAYBACK);
 	BUILD_BUG_ON((int)SNDRV_PCM_STREAM_CAPTURE  != (int)SND_COMPRESS_CAPTURE);
 
-	if (rtd->num_cpus > 1 ||
-	    rtd->num_codecs > 1) {
+	if (rtd->dai_link->num_cpus > 1 ||
+	    rtd->dai_link->num_codecs > 1) {
 		dev_err(rtd->card->dev,
 			"Compress ASoC: Multi CPU/Codec not supported\n");
 		return -EINVAL;
diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index df2bd8098c63..a812487b7b5f 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -107,7 +107,7 @@ static umode_t soc_dev_attr_is_visible(struct kobject *kobj,
 
 	if (attr == &dev_attr_pmdown_time.attr)
 		return attr->mode; /* always visible */
-	return rtd->num_codecs ? attr->mode : 0; /* enabled only with codec */
+	return rtd->dai_link->num_codecs ? attr->mode : 0; /* enabled only with codec */
 }
 
 static const struct attribute_group soc_dapm_dev_group = {
@@ -482,8 +482,6 @@ static struct snd_soc_pcm_runtime *soc_new_pcm_runtime(
 	 *	asoc_rtd_to_cpu()
 	 *	asoc_rtd_to_codec()
 	 */
-	rtd->num_cpus	= dai_link->num_cpus;
-	rtd->num_codecs	= dai_link->num_codecs;
 	rtd->card	= card;
 	rtd->dai_link	= dai_link;
 	rtd->num	= card->num_rtd++;
diff --git a/sound/soc/soc-dapm.c b/sound/soc/soc-dapm.c
index 2d105bfee387..f10133f35c5d 100644
--- a/sound/soc/soc-dapm.c
+++ b/sound/soc/soc-dapm.c
@@ -4459,11 +4459,11 @@ void snd_soc_dapm_connect_dai_link_widgets(struct snd_soc_card *card)
 		if (rtd->dai_link->dynamic)
 			continue;
 
-		if (rtd->num_cpus == 1) {
+		if (rtd->dai_link->num_cpus == 1) {
 			for_each_rtd_codec_dais(rtd, i, codec_dai)
 				dapm_connect_dai_pair(card, rtd, codec_dai,
 						      asoc_rtd_to_cpu(rtd, 0));
-		} else if (rtd->num_codecs == rtd->num_cpus) {
+		} else if (rtd->dai_link->num_codecs == rtd->dai_link->num_cpus) {
 			for_each_rtd_codec_dais(rtd, i, codec_dai)
 				dapm_connect_dai_pair(card, rtd, codec_dai,
 						      asoc_rtd_to_cpu(rtd, i));
diff --git a/sound/soc/soc-generic-dmaengine-pcm.c b/sound/soc/soc-generic-dmaengine-pcm.c
index 87858462bba9..3b99f619e37e 100644
--- a/sound/soc/soc-generic-dmaengine-pcm.c
+++ b/sound/soc/soc-generic-dmaengine-pcm.c
@@ -54,7 +54,7 @@ int snd_dmaengine_pcm_prepare_slave_config(struct snd_pcm_substream *substream,
 	struct snd_dmaengine_dai_dma_data *dma_data;
 	int ret;
 
-	if (rtd->num_cpus > 1) {
+	if (rtd->dai_link->num_cpus > 1) {
 		dev_err(rtd->dev,
 			"%s doesn't support Multi CPU yet\n", __func__);
 		return -EINVAL;
@@ -105,7 +105,7 @@ dmaengine_pcm_set_runtime_hwparams(struct snd_soc_component *component,
 	struct snd_dmaengine_dai_dma_data *dma_data;
 	struct snd_pcm_hardware hw;
 
-	if (rtd->num_cpus > 1) {
+	if (rtd->dai_link->num_cpus > 1) {
 		dev_err(rtd->dev,
 			"%s doesn't support Multi CPU yet\n", __func__);
 		return -EINVAL;
@@ -179,7 +179,7 @@ static struct dma_chan *dmaengine_pcm_compat_request_channel(
 	struct dmaengine_pcm *pcm = soc_component_to_pcm(component);
 	struct snd_dmaengine_dai_dma_data *dma_data;
 
-	if (rtd->num_cpus > 1) {
+	if (rtd->dai_link->num_cpus > 1) {
 		dev_err(rtd->dev,
 			"%s doesn't support Multi CPU yet\n", __func__);
 		return NULL;
diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index 1dae758bc4aa..2ce9a8188378 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -84,11 +84,11 @@ static inline void snd_soc_dpcm_stream_unlock_irq(struct snd_soc_pcm_runtime *rt
 
 static inline const char *soc_cpu_dai_name(struct snd_soc_pcm_runtime *rtd)
 {
-	return (rtd)->num_cpus == 1 ? asoc_rtd_to_cpu(rtd, 0)->name : "multicpu";
+	return (rtd)->dai_link->num_cpus == 1 ? asoc_rtd_to_cpu(rtd, 0)->name : "multicpu";
 }
 static inline const char *soc_codec_dai_name(struct snd_soc_pcm_runtime *rtd)
 {
-	return (rtd)->num_codecs == 1 ? asoc_rtd_to_codec(rtd, 0)->name : "multicodec";
+	return (rtd)->dai_link->num_codecs == 1 ? asoc_rtd_to_codec(rtd, 0)->name : "multicodec";
 }
 
 #ifdef CONFIG_DEBUG_FS
@@ -185,7 +185,7 @@ static ssize_t dpcm_state_read_file(struct file *file, char __user *user_buf,
 	int stream;
 	char *buf;
 
-	if (fe->num_cpus > 1) {
+	if (fe->dai_link->num_cpus > 1) {
 		dev_err(fe->dev,
 			"%s doesn't support Multi CPU yet\n", __func__);
 		return -EINVAL;
@@ -637,7 +637,7 @@ int snd_soc_runtime_calc_hw(struct snd_soc_pcm_runtime *rtd,
 	 * connected to CPU DAI(s), use CPU DAI's directly and let
 	 * channel allocation be fixed up later
 	 */
-	if (rtd->num_codecs > 1) {
+	if (rtd->dai_link->num_codecs > 1) {
 		hw->channels_min = cpu_chan_min;
 		hw->channels_max = cpu_chan_max;
 	}
@@ -1379,7 +1379,7 @@ int dpcm_path_get(struct snd_soc_pcm_runtime *fe,
 	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(fe, 0);
 	int paths;
 
-	if (fe->num_cpus > 1) {
+	if (fe->dai_link->num_cpus > 1) {
 		dev_err(fe->dev,
 			"%s doesn't support Multi CPU yet\n", __func__);
 		return -EINVAL;
@@ -1751,7 +1751,7 @@ static void dpcm_runtime_setup_be_chan(struct snd_pcm_substream *substream)
 		 * chan min/max cannot be enforced if there are multiple CODEC
 		 * DAIs connected to a single CPU DAI, use CPU DAI's directly
 		 */
-		if (be->num_codecs == 1) {
+		if (be->dai_link->num_codecs == 1) {
 			struct snd_soc_pcm_stream *codec_stream = snd_soc_dai_get_pcm_stream(
 				asoc_rtd_to_codec(be, 0), stream);
 
@@ -2590,7 +2590,7 @@ static int soc_dpcm_fe_runtime_update(struct snd_soc_pcm_runtime *fe, int new)
 	if (!fe->dai_link->dynamic)
 		return 0;
 
-	if (fe->num_cpus > 1) {
+	if (fe->dai_link->num_cpus > 1) {
 		dev_err(fe->dev,
 			"%s doesn't support Multi CPU yet\n", __func__);
 		return -EINVAL;
@@ -2734,7 +2734,7 @@ static int soc_get_playback_capture(struct snd_soc_pcm_runtime *rtd,
 	struct snd_soc_dai *cpu_dai;
 	int i;
 
-	if (rtd->dai_link->dynamic && rtd->num_cpus > 1) {
+	if (rtd->dai_link->dynamic && rtd->dai_link->num_cpus > 1) {
 		dev_err(rtd->dev,
 			"DPCM doesn't support Multi CPU for Front-Ends yet\n");
 		return -EINVAL;
@@ -2786,9 +2786,9 @@ static int soc_get_playback_capture(struct snd_soc_pcm_runtime *rtd,
 			SNDRV_PCM_STREAM_CAPTURE : SNDRV_PCM_STREAM_PLAYBACK;
 
 		for_each_rtd_codec_dais(rtd, i, codec_dai) {
-			if (rtd->num_cpus == 1) {
+			if (rtd->dai_link->num_cpus == 1) {
 				cpu_dai = asoc_rtd_to_cpu(rtd, 0);
-			} else if (rtd->num_cpus == rtd->num_codecs) {
+			} else if (rtd->dai_link->num_cpus == rtd->dai_link->num_codecs) {
 				cpu_dai = asoc_rtd_to_cpu(rtd, i);
 			} else {
 				dev_err(rtd->card->dev,
diff --git a/sound/soc/sof/topology.c b/sound/soc/sof/topology.c
index 9273a70fec25..b86af0263b78 100644
--- a/sound/soc/sof/topology.c
+++ b/sound/soc/sof/topology.c
@@ -1032,7 +1032,7 @@ static int sof_connect_dai_widget(struct snd_soc_component *scomp,
 					break;
 				}
 			}
-			if (i == rtd->num_cpus) {
+			if (i == rtd->dai_link->num_cpus) {
 				dev_err(scomp->dev, "error: can't find BE for DAI %s\n",
 					w->name);
 
@@ -1054,7 +1054,7 @@ static int sof_connect_dai_widget(struct snd_soc_component *scomp,
 					break;
 				}
 			}
-			if (i == rtd->num_cpus) {
+			if (i == rtd->dai_link->num_cpus) {
 				dev_err(scomp->dev, "error: can't find BE for DAI %s\n",
 					w->name);
 
-- 
2.25.1

