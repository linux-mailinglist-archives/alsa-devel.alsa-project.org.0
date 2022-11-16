Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BD45C62AFEB
	for <lists+alsa-devel@lfdr.de>; Wed, 16 Nov 2022 01:13:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4F9CD167B;
	Wed, 16 Nov 2022 01:13:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4F9CD167B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668557634;
	bh=wkmW77pnw6WANaWm/cuMe2WhpPPAgGn++K9my+h0fVY=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=DCMGYdtwdrwBkRuw3kGgCuQRHPzGlnam+l94/+c2Mpzqps9xDXT7bWbtyvIU1UWKu
	 Xk8DHqvDYQHgW+OqFj2HYa65pf6d5N+fz4zmoQQitSYUst76GPo9NzHvVoh2CZAHfa
	 YXgk8qELtzfz5qkA0mqy+YDtXd1SgjU3JSZSUQa8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DC1A3F800AA;
	Wed, 16 Nov 2022 01:12:59 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 22A02F80171; Wed, 16 Nov 2022 01:12:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.9 required=5.0 tests=AC_FROM_MANY_DOTS, DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on20708.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:7010::708])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 121A1F8016D
 for <alsa-devel@alsa-project.org>; Wed, 16 Nov 2022 01:12:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 121A1F8016D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com
 header.b="aDGoL/VR"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gDnzku7FTEXQOypYLUNuN6HczmUCjYANnlkkHZVZP58AFkWfsaW6NbibjGuFmBnq1273uKfHvKnV2Lf7T3q7x8x/TIAZm4CWmv4rGbbWYceyPMb4zCycut6x3+BQ+uFIMN5RSne5gTu9NSR0PVdCPpUXIuxhMQvW82mBA/KtLXdms9gMZQxF4iIy7H7tGMcDOvjA7adETMFPbULj+SZMDVn7vlWcakEiKd9HK6hIUI46rTT7UnyViPeSqQsyFGXNWGmSUjn+juiVTYNx7VPcJTOkt5GyTmTgmIpiJJSrW+8xug4znZBHEgxuYAQlQK6RUUyI33JEdC0dT3YWY2nvYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2KrhyWXFpkI7A+dxvmEJwBKmwfpcKcZRvr+K0jtrSuY=;
 b=mWrZhvVUKsY3VAl522daFdlx3mq5Y8NmB57VCG+w3ylLd0TSktW/tNfjLBoZTFi6CONMoa65kKmq2rHwWnthjN1rwRd7vE5qaPBDeqCy/Ho8mWSCTS9ThwVOhHwDYfE4jyP2IDpbTnoEWLqHe3TryWC/FX26j6ExEk572nk1bHjzoQwsZqpXHCzQ9uOZ6qP4RwH6aGH4ertDEExH49i7uu9sv96gLp/DRWl+Gr/LmcwCADFMduxC97L2vrV6sU2LetMRf6FhmreRlyVmScjOPjLwiuzQfRnpF+sG6n5WymNdyWN4Cx4Zv0k+vK+XA2f9gZyaKqImjYHAwwodPx6O2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2KrhyWXFpkI7A+dxvmEJwBKmwfpcKcZRvr+K0jtrSuY=;
 b=aDGoL/VR27VS/X12Zovw1SqxFffrcKXjCBRjpYGPkdd86I0CX3qYi8g2vHGQmzpgmAI1hMhr1DmM4c8WS09JQ9VqILJsYzZj7Q9r6RCsimsOhjbEP+vri/1I45HlmCSaGm4HGmeMjFlmftN3Q6pM1+8+j0qMk8Cas9R34HfjYcE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OSYPR01MB5413.jpnprd01.prod.outlook.com (2603:1096:604:90::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.18; Wed, 16 Nov
 2022 00:12:40 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::a5a6:2344:db9:431]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::a5a6:2344:db9:431%8]) with mapi id 15.20.5813.018; Wed, 16 Nov 2022
 00:12:40 +0000
Message-ID: <874juzg3kd.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Takashi Iwai <tiwai@suse.com>
Subject: [PATCH] ALSA: pcm: avoid nused-but-set-variable warning
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 16 Nov 2022 00:12:39 +0000
X-ClientProxiedBy: TYCPR01CA0043.jpnprd01.prod.outlook.com
 (2603:1096:405:1::31) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|OSYPR01MB5413:EE_
X-MS-Office365-Filtering-Correlation-Id: 71b9c83b-9870-4aad-50bf-08dac767463f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TJYowiq7Hklp6Wsn2Tm23H24Sfn16GkdaK4J4COTz5D+XduHHkvvwLJKIW7NErOF8B8v2pKHHPbyzATWZ80iKLQzNYjTMSDMKdLzh5VU5TvWAdTIWeaL3xk8uDrs6KdoiBgn/2NIAzOPzbqv1dnnVZVJmsS3C/lKOCfHqlQP6GMDWczHt+IPk18pbed1CcsT3VzGDKWhe0sN0XAIrsRoZRwZX7P/DxCdmndn4egfO7SNmgIyyRLGoUL/h7vTDshy2NRNwmd/sFVUr6XWdzQxaD1gWzeWDNxcUXjJ2uTCbb4mkxn+yGxkCfmWIDVHlFfLZLcsDKBoPa31UNR8HmCjEOohvVQihTgTadH3n7njSztPtZ19gWEDOXOCNnMuGnBGFvUljq5L0mFutlEt6tvklbBRjnV04dc/zK8QJ6q0/B4Pn+WjongCLx7dpaEUGUTrEqqr8blesvMXGvuGGVqi02ULUAela0oFt3gJGVAmfbrA1vfVGiFZ06Rr5gTcJGW8lg5hXo0DBHwzt8JdEH1ALJOmPr+56Eryr04gk86ETtNo6z5W+Jbld015hFjvVBKOYVkpF6G3DSQNT/kT3Px5z6ALPVCo4wlrR0lAvzk3fOd2t79lO4h5JB76JbYxzQVDZ75qRIkq29KIOvoBzQBd6HHpgZS4DvTk8LrS6/1aNFWjEI0m14t1bc2yWLQgQWiZd9f1qGkPVx+LUye8CThMvrGszN4TGcB/lOb6semVtbCncEZwqyQPJCqB/V9EfkuE
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB8426.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(376002)(136003)(366004)(39860400002)(396003)(451199015)(86362001)(8936002)(5660300002)(36756003)(66556008)(66946007)(66476007)(41300700001)(2616005)(8676002)(4326008)(186003)(6512007)(478600001)(316002)(6486002)(26005)(38350700002)(38100700002)(52116002)(6916009)(6506007)(83380400001)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zharePUKU0K3Z+f/JBXXEthJzDPKpITDT/gHGNgsl5e5U9dDafu5L33rYBFZ?=
 =?us-ascii?Q?ZW34RGjSDo0vePCFu/1N8/7hX8ztwEU7udDrKBuSdcOhbtVeOVzl0wAcKyqV?=
 =?us-ascii?Q?EU6gbq7JXW8GAprx8ryKdTJ2q6R7RP2RuCWQ2+0uTyXEbEsLjnkdo8NqNqZ2?=
 =?us-ascii?Q?/dYQgSDIBRTMvGlMscahzrKErh1/yGxfCBADZmOOrl9XoKz0odlWf0zrOGif?=
 =?us-ascii?Q?BXs2NC8DPCS/8i17ezmYMhgXRhEfsYjsp8u9ODJdhMmQ4c7Ql3JnOD5Kkpfs?=
 =?us-ascii?Q?FkNSTTog7kAGCTTaj8RkOqKOHvDdqNAz2moImID6/a7JwSiDVN1ydGgy17mW?=
 =?us-ascii?Q?vswHyWQtIVnQtH6OnIdwVdhAr2Nr8FcC3d+zxGG/UBS483teIq6Cum6XA7Vl?=
 =?us-ascii?Q?Ftmws7UKmVawKjAndsJt1xiIWdncIawXxW1xoYTvDXwNnzfzo7g+NuZPclvc?=
 =?us-ascii?Q?SXfGc2RKIh3Cjf5RYKzgcGR/MvCfHJ7ZbLcpqqbX2tkuisM9XSmSJ4Bms/YI?=
 =?us-ascii?Q?ENCNYMJoG0nt8vhIalMg3qw1IMUGbf7i2iB1ruO99PHUDo0bATGeEg0Ik05i?=
 =?us-ascii?Q?ZT4Y8wGGq8RBWgKh2VrPMBlagJ5HIPloW3J/fH9ylx7NxFdf4RAB+pS76zn/?=
 =?us-ascii?Q?uFDm1BwuCEwl3PLCpdCMdG2ZhFGrSvtEpoRzFFPhaTU9Gc2OgUjTHUybMAhZ?=
 =?us-ascii?Q?Y7zKjZ2m1ZyMGGPahb8qpMp9AetzhaHbcp+p6Hd/5i3vgrD+Brow+4WCRYew?=
 =?us-ascii?Q?aTBpwLQpkdI5rqs03tgebTTtCZMqQoE6UqRIzl+sulrDHjQ5dtn4cnZkFToE?=
 =?us-ascii?Q?/6DAi8aaiBrq0X3ur+xxRyKeVOo2z63OJu3akbcQNndgpVmYyZo5HKiWDnZN?=
 =?us-ascii?Q?ZFokkNEPfGfXw7vIZlUyzP3aeYA8UvPPm4XmFAnATzvMk8B2/K9MzGmDitcC?=
 =?us-ascii?Q?eL+cCXzp7VDUZG6xgTxvLuucQMzY+z0NsVyoZ09jtSXktiwOzUgg0yeqz1R8?=
 =?us-ascii?Q?av3j3/Jcv6fHkYHRW0UBJUpkAvOxqXQjS+9CrjCA3VPl9J0k/oWT3Eqev/2F?=
 =?us-ascii?Q?YRNd7s3Gg9nLmLRCEH21vlSdUFGOoD888OVqEdd6/1vFzB6TY1chcHIPsuME?=
 =?us-ascii?Q?JiMKSmdUCVtfLdhTFfuj9iErtbwC5BDbhge0tXnLR+veCc9O5vvTyAsjLZFu?=
 =?us-ascii?Q?0Q/JoVfw+ET0XxdyfF7zGvHvr1VCW0RTJ64vHBc/CNtahX6njkLhGNn/hzDc?=
 =?us-ascii?Q?IxwFfITHDhLGbv5VXwAujCIdtIcj6I1GCMIhDWzzr4CBG0iFF0VxNSp5afiA?=
 =?us-ascii?Q?pWswEdKucq1xyVAXKsRlmVkmpZIsO9iWtbm8eUjwo7JZxKDsb1xuklr0QUBA?=
 =?us-ascii?Q?XeqSCSHIj97JAKqkmmgRXeqLeGCj1JmA8giL9qXzivwpaniY+C+81VC3BAYW?=
 =?us-ascii?Q?Xa9LBxCUlezn6vlKQ2Kz45KMvdBFXuQ5TsUAIEwpqp8p+7nbcOhLMcocRUsB?=
 =?us-ascii?Q?GN66YCGcMyO56cu/v9YQg/wudHsEA/4gGtH2ca7fBE9371R4prEs2i+di5wA?=
 =?us-ascii?Q?vUAKYSaLRb5wl84prN/NtWrvCKJjeQi1iZBgB+FrSJ3uhT289Bw4rVD/2wSU?=
 =?us-ascii?Q?SjquE4r62oO5Za7Eer9i104=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 71b9c83b-9870-4aad-50bf-08dac767463f
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2022 00:12:40.1865 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pudtBAZj8pwhgGH/yw0yMCob7KIBN4s0J+iPd+DXTYCZps22KFY9tty3JwPX9UxpX94bjm+pwrxgMvXX2ce3ofAnhiJTVWm7ocuOxGDqGQp+b2erW9ysZs9vOEtCG2Gg
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSYPR01MB5413
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>
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

It will indicate below warning if W=1 was added and CONFIG_SND_DEBUG
was not set. This patch adds __maybe_unused and avoid it.

	${LINUX}/sound/core/pcm_native.c: In function 'constrain_mask_params':
	${LINUX}/sound/core/pcm_native.c:291:25: error: variable 'old_mask' set but not used [-Werror=unused-but-set-variable]
	  291 |         struct snd_mask old_mask;
	      |                         ^~~~~~~~
	${LINUX}/sound/core/pcm_native.c: In function 'constrain_interval_params':
	${LINUX}/sound/core/pcm_native.c:327:29: error: variable 'old_interval' set but not used [-Werror=unused-but-set-variable]
	  327 |         struct snd_interval old_interval;
	      |                             ^~~~~~~~~~~~
	${LINUX}/sound/core/pcm_native.c: In function 'constrain_params_by_rules':
	${LINUX}/sound/core/pcm_native.c:368:29: error: variable 'old_interval' set but not used [-Werror=unused-but-set-variable]
	  368 |         struct snd_interval old_interval;
	      |                             ^~~~~~~~~~~~
	${LINUX}/sound/core/pcm_native.c:367:25: error: variable 'old_mask' set but not used [-Werror=unused-but-set-variable]
	  367 |         struct snd_mask old_mask;
	      |                         ^~~~~~~~
	${LINUX}/sound/core/pcm_native.c: In function 'snd_pcm_hw_params_choose':
	${LINUX}/sound/core/pcm_native.c:652:29: error: variable 'old_interval' set but not used [-Werror=unused-but-set-variable]
	  652 |         struct snd_interval old_interval;
	      |                             ^~~~~~~~~~~~
	${LINUX}/sound/core/pcm_native.c:651:25: error: variable 'old_mask' set but not used [-Werror=unused-but-set-variable]
	  651 |         struct snd_mask old_mask;
	      |                         ^~~~~~~~
	cc1: all warnings being treated as errors
	make[3]: *** [${LINUX}/scripts/Makefile.build:250: sound/core/pcm_native.o] error 1

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/core/pcm_native.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/sound/core/pcm_native.c b/sound/core/pcm_native.c
index 33769ca78cc8..ba6e44d02faa 100644
--- a/sound/core/pcm_native.c
+++ b/sound/core/pcm_native.c
@@ -288,7 +288,7 @@ static int constrain_mask_params(struct snd_pcm_substream *substream,
 					&substream->runtime->hw_constraints;
 	struct snd_mask *m;
 	unsigned int k;
-	struct snd_mask old_mask;
+	struct snd_mask old_mask __maybe_unused;
 	int changed;
 
 	for (k = SNDRV_PCM_HW_PARAM_FIRST_MASK; k <= SNDRV_PCM_HW_PARAM_LAST_MASK; k++) {
@@ -324,7 +324,7 @@ static int constrain_interval_params(struct snd_pcm_substream *substream,
 					&substream->runtime->hw_constraints;
 	struct snd_interval *i;
 	unsigned int k;
-	struct snd_interval old_interval;
+	struct snd_interval old_interval __maybe_unused;
 	int changed;
 
 	for (k = SNDRV_PCM_HW_PARAM_FIRST_INTERVAL; k <= SNDRV_PCM_HW_PARAM_LAST_INTERVAL; k++) {
@@ -364,8 +364,8 @@ static int constrain_params_by_rules(struct snd_pcm_substream *substream,
 	unsigned int stamp;
 	struct snd_pcm_hw_rule *r;
 	unsigned int d;
-	struct snd_mask old_mask;
-	struct snd_interval old_interval;
+	struct snd_mask old_mask __maybe_unused;
+	struct snd_interval old_interval __maybe_unused;
 	bool again;
 	int changed, err = 0;
 
@@ -648,8 +648,8 @@ static int snd_pcm_hw_params_choose(struct snd_pcm_substream *pcm,
 		-1
 	};
 	const int *v;
-	struct snd_mask old_mask;
-	struct snd_interval old_interval;
+	struct snd_mask old_mask __maybe_unused;
+	struct snd_interval old_interval __maybe_unused;
 	int changed;
 
 	for (v = vars; *v != -1; v++) {
-- 
2.25.1

