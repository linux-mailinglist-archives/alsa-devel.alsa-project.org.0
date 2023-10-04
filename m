Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CDF57B79C7
	for <lists+alsa-devel@lfdr.de>; Wed,  4 Oct 2023 10:11:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E413E84A;
	Wed,  4 Oct 2023 10:11:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E413E84A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696407112;
	bh=Zf2+cFkFXOgbFZUU7AwBoT4wHfy0KT1p6gfOvGSwnoY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=mA1B1vbYCxlO+2153rwe0pphVKxNWGJYDMlAI8Ra7lnHLWW9imfmSacGduAkNfoKG
	 mNTjwtmUnIRwH+51H3Tu0M4E0bmme2zb5aAxYD42NEe8sBk3KtEebJVO7Umdeh+uWD
	 nCf4dkOK/qXhOLdADNxQvVBtfkfrLcgVMIxYpCPs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B929EF80567; Wed,  4 Oct 2023 10:11:02 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7CF75F80552;
	Wed,  4 Oct 2023 10:11:02 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B6316F8047D; Wed,  4 Oct 2023 10:08:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on20706.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:7010::706])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1291CF80166
	for <alsa-devel@alsa-project.org>; Wed,  4 Oct 2023 10:07:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1291CF80166
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=b0VtfihV
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mth0ytlGMoK4sI4NBeKM36KVgO94cce0Dx7VGNbq1B91CQA8dlxgavsRQFZOAxuzBp0BKzqkKy3ZE6D76ih4DgXWzkSIyMTxROh/GWrNZf7Bz5jQlS5XfKg+/uvbC3D2+iRmDOwCUgmz7oINOXnJxJYeQA/xCMHySf4lEYgMhzrvOQCspT2jVm+KjZ+nila4AuEf8cVI29fRzJti2FBcococoK1mRDXlaiHDxm4f0teJ9cvPzLlQpACNrc0wFyfI+zROdGOeXWrwt87XuiGJVCBNZoqz4bv8EbUCkeRRk2/D5GRXn4095NB0T4PhaUV+syLZNJurKfUo/BjBovdGfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2qQj+kLX/PTfQn/+FswTVapAvIm1/Ezze7b79gKjnp4=;
 b=nkcdBpAqhqEO24ZEEQouWu/z9yFQP90fJQf3aDeqHr9z38+T6atyFibKWpL4ju7/+fQUgbsILYRxNje6xnnLP6ykF6JEAjom2ExCYip8y/CHCu69TPTqOHp4LdYdVXCvb+dKc81JVxrSiDKqCngZxXC/g28dmIsfWwMKAGpRrPj3W2k/rlsdEawgSmfJqahvUpMAP3V7qhl7JdkE1AKwvvqZeIZAWNRIHHZ66vHZj4zMg3yAOsml1AhjKIONQc0TJMKh9Zzw/+ttxlearVwnZD9gFae+oWOA0qHyJGEbTXbUt563B6M07gtiJQ59RSL1wYfqBd/YhNR5ETG/+DcGew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2qQj+kLX/PTfQn/+FswTVapAvIm1/Ezze7b79gKjnp4=;
 b=b0VtfihVsm6WJKkQr+JaEJhRB3TWMvWX65hM+PMm7O+j/c2Om/YjTF/GlJdBuW13inR7xGZ4yhn+29n37u6vQeOEDs1AMuC6ro6KNeZ6Qui95EmlKbI4gW2nLDoo2c8qCmDkQtf5YrNi+gUgOhceO2QlmxefTE8nxGN4dPluwso=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TY3PR01MB11572.jpnprd01.prod.outlook.com (2603:1096:400:371::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.35; Wed, 4 Oct
 2023 08:07:48 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::d2a3:45df:a180:595c]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::d2a3:45df:a180:595c%6]) with mapi id 15.20.6838.033; Wed, 4 Oct 2023
 08:07:48 +0000
Message-ID: <87fs2qg698.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 2/2] ASoC: soc-pcm.c: factorize CPU/Codec validation check on
 soc_get_playback_capture()
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <87il7mg69z.wl-kuninori.morimoto.gx@renesas.com>
References: <87il7mg69z.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 4 Oct 2023 08:07:48 +0000
X-ClientProxiedBy: TYCPR01CA0096.jpnprd01.prod.outlook.com
 (2603:1096:405:3::36) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TY3PR01MB11572:EE_
X-MS-Office365-Filtering-Correlation-Id: 410bb1c7-1677-4c68-30f2-08dbc4b0ff81
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	XcK4DFVvTi6WpmChKe0mxurJIrBLqiU4k55Y0TmbxxmtkyYDUAiLn4D3Sb8MvTw8HUrBEURVxUKZ3yVXTJD41yAbYYhDFsV/4KHhtB0cfa6C8+ibFykMFI2bcpPRh75Ph3F4Oa2wvO7lVpZqTAhLeKHdjmhCYuU30ngT8usyjQFghlTbEO4eeZesgZKiFLPhD3o7Ua/L0wX14z8T6oVDqhtO+WkYXmrycZCKhpi0ixNGL5OREK/eWWYmBbb0+niV5kANo/MvLsjrF9YiDt2fV/PCzZ6IN5SRsDwFP8elSqD7XRs4wvCzXnaT10wEstm4t/yo5q1MVnQkd1MN6V2gByeqg33C8MGESqJ125cFBV5Ickf8iL7RKJYUWPLVBxzN5ip3DmIYR1vxfWJzojC00ZoJQ6HS8faHnM1bAxX7wdXqZF4UIyFhzJgWD0YehmiUejgu1vddGZRy8FuObrPoByKIH/j0oVohKrkMj0lrEzy9vUkYJl37dXcIT04mmxjM4P/nYyT6dqlcg8CNNCLkASoHEbC2sy7oEIXG7O7XHHoSFf4k5xfMFkf+QXbnVO1OX62apdGW87kx4mP55fCWtNa35AKt7ohMunBZBO2lEkKl+f0p97K3+W4BhTbpV+u2
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(136003)(376002)(366004)(396003)(346002)(230922051799003)(186009)(1800799009)(64100799003)(451199024)(26005)(83380400001)(8936002)(8676002)(4326008)(52116002)(66946007)(66476007)(54906003)(6916009)(41300700001)(316002)(478600001)(6486002)(2616005)(6512007)(2906002)(66556008)(5660300002)(6506007)(36756003)(86362001)(38350700002)(38100700002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?i8OV5QV7IeVhzuqDyAYVoaEL6mcVXuB4GQrqvE5fGCuTUjw9BvCaIctek0D4?=
 =?us-ascii?Q?RV5d2iRXFuJxYSGRXwHlvIXd4vOjCADVwRNCzDUdyn8yqPpYXKZn+cgP1wRy?=
 =?us-ascii?Q?D+K/r3tvyfwhiVxHUu/Yok8i11PS22Kzbodpy+4n7/yEyoABt8HD0vldqULq?=
 =?us-ascii?Q?bTz4gdLBa21/+OF3l7anNQBQoPJLkGnQ7agqNkWF4e4yFqMWEsE59unUyDPw?=
 =?us-ascii?Q?mMTng4OJRqmy7Rx13EbV/96Rfo5bFCr4uRbJFqOH+5EhdQPG3V5nF7M7Tio+?=
 =?us-ascii?Q?7CByEfke4sMyyRXJAS/mLtzK5NJsWQpDmIcQKjM/NC/71a/uGone7to3NmuL?=
 =?us-ascii?Q?Mw2lBdL0ygFZlx6sC6R6PyaReoSxMhm2FHgYmiTZT3AaQ6Aaq/7Em553m7XM?=
 =?us-ascii?Q?CG4td2JC9/ALZd76vMlTEllpTiw8tcQKw3O0grSBDwSc6PVo1DTkCuiW1uVz?=
 =?us-ascii?Q?6PUM4prkITooXU/0/pw+jh8kOy4ZXgBNyT1d5VJCfTjsVkEV82QrsftFE+VU?=
 =?us-ascii?Q?f8yQP8n/HY+k2Iu8ws2cJhn3VQfucX/NR8EZ+P2cJ2invgMcOQ9bRDTErkRI?=
 =?us-ascii?Q?RWbf00uuHXlHcp9ZuwbKMSVMXxU/bmadwW553uUGVxLi2cz41VVqpSjhP+Vl?=
 =?us-ascii?Q?dSBzyzoyZ5yMbvUR5yFFEEYeGLZrwJhKwKkEiuoWJ4pIvdBeNtgjj+nvsITF?=
 =?us-ascii?Q?uFIakI6maxpZbd9vxubcNw87cst9jiXevVp9QXuVarrJKFW/JazX2wbl+HB7?=
 =?us-ascii?Q?5ihDZInlRYvSb23Yg9wINmkHBUhL0V4ZYL5aFx2ek4I4YoR09ksmWVM6/OjT?=
 =?us-ascii?Q?icf5SI6IK43v69QNQOqJU9neY0LbmROF6JEGdiUbIzJa2ajwqlbVSOVh2JIw?=
 =?us-ascii?Q?VB9vhB5nUKwQEaAxazNXJUO7ylYAlGssMM2t/yTg7CinYW1s5IREm7NDHRmB?=
 =?us-ascii?Q?cYDs40bydfdxAl5szjE3DSZifNPeWeBzwxRZJLa6wYsFHTaxf3ec87PpGHx+?=
 =?us-ascii?Q?/buX0AZ7NNw2VUjHPtAK4iQTHYASmyKZGZaI/Mz0O9aW6c/qH26aU7Yu8KrK?=
 =?us-ascii?Q?c2hPVPUdHmjFfK7oOmac7NfvNc/MY1/KhN0WV9KodXZKdx8MMBspUdhAjgMM?=
 =?us-ascii?Q?IBkkCbaxz74S2XGPXCqZal9AnOkB8QMFbRFkp3mxBlPENVuKYBPJYbTeoRX3?=
 =?us-ascii?Q?ymE3iSVpw13yecvZTirfs/+Xf2QVYws5HZcZH4BkzjWTXTCYbBX8w03JqVHP?=
 =?us-ascii?Q?jC6TeyrcU7vKT86G8oerDv7V0iQCyoepab6nk8ECF/VzSwltnz66Ead+d84x?=
 =?us-ascii?Q?+hDHjK2DE85pYQeoMDi5Q+FSbI5NwtaDZ89CUvpKCtT+XQRKLanrsRA9geNF?=
 =?us-ascii?Q?fcrkPnYY1HcMvSoo0fnEM5/oTXPMk3hR6qyU0Hz0vyKmeDjWhny6+2KEyvUr?=
 =?us-ascii?Q?Cgm+b9dsJPFLWMesNfYtR6zUSKrda3MuDMevQUy8K2/KbBQlBMelrpGh2BPH?=
 =?us-ascii?Q?8RGGLDG4u0d4p+l2zgvfwz2RmfLmlUj5o+1hmS1KWEqbDlX7obSgwxSVQ9K8?=
 =?us-ascii?Q?aZOlIFgg6J77YAtnFcTbBB83TM3PvSo33S5h4EqgaEWkOrrLTgQZciwY7S8B?=
 =?us-ascii?Q?ulDopxKdjILzZgaBmAzQDDI=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 410bb1c7-1677-4c68-30f2-08dbc4b0ff81
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2023 08:07:48.4006
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 lVmrsv78iA67hEUYXDjiGmeAOFA6AHnoaYvvt+SUMW99qTvb8VHMSh2o2KFYAUldLZzI377G19O7ronEDWMIb2ZSNY1QLI6nXZ+PnCFDRvf1IwyuqYYoXEw+65aTdxHT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB11572
Message-ID-Hash: MSHPAW7S4CJSVQCX4GUHRZ3YY5RXMCMZ
X-Message-ID-Hash: MSHPAW7S4CJSVQCX4GUHRZ3YY5RXMCMZ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MSHPAW7S4CJSVQCX4GUHRZ3YY5RXMCMZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Current soc_get_playback_capture() is checking CPU/Codec validation.
But it is using different operation for each 1:N, N:N, N:M connections,
thus it is very complex.

Therefore, there was omission of check at 1:N, N:N, N:M connections.
It was handles as "valid" eventhough it was just "at least one of
CPU/Codec pair was valid", and off course it was wrong.
It is fixed and handled as "valid" when "all CPUs and Codecs were valid"
today.

Because it checks all CPUs/Codecs today, we no longer need to think
about CPU/Codec connection pair style.
This patch cleanup CPU/Codec validation check.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/soc-pcm.c | 43 ++++++++++++++-----------------------------
 1 file changed, 14 insertions(+), 29 deletions(-)

diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index a45c0cf0fa14..1e7925b93689 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -2820,43 +2820,28 @@ static int soc_get_playback_capture(struct snd_soc_pcm_runtime *rtd,
 			}
 		}
 	} else {
-		struct snd_soc_dai *codec_dai;
+		struct snd_soc_dai *dai;
 
 		/* Adapt stream for codec2codec links */
 		int cpu_capture  = snd_soc_get_stream_cpu(dai_link, SNDRV_PCM_STREAM_CAPTURE);
 		int cpu_playback = snd_soc_get_stream_cpu(dai_link, SNDRV_PCM_STREAM_PLAYBACK);
 
-		has_playback = (dai_link->num_codecs > 0);
-		has_capture  = (dai_link->num_codecs > 0);
-		for_each_rtd_codec_dais(rtd, i, codec_dai) {
-			if (dai_link->num_cpus == 1) {
-				cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
-			} else if (dai_link->num_cpus == dai_link->num_codecs) {
-				cpu_dai = snd_soc_rtd_to_cpu(rtd, i);
-			} else if (rtd->dai_link->num_codecs > rtd->dai_link->num_cpus) {
-				int cpu_id;
-
-				if (!rtd->dai_link->codec_ch_maps) {
-					dev_err(rtd->card->dev, "%s: no codec channel mapping table provided\n",
-						__func__);
-					return -EINVAL;
-				}
+		has_playback =
+		has_capture  = (dai_link->num_cpus > 0 && dai_link->num_codecs > 0);
 
-				cpu_id = rtd->dai_link->codec_ch_maps[i].connected_cpu_id;
-				cpu_dai = snd_soc_rtd_to_cpu(rtd, cpu_id);
-			} else {
-				dev_err(rtd->card->dev,
-					"%s codec number %d < cpu number %d is not supported\n",
-					__func__, rtd->dai_link->num_codecs,
-					rtd->dai_link->num_cpus);
-				return -EINVAL;
-			}
+		/* CPU validation check */
+		for_each_rtd_cpu_dais(rtd, i, dai) {
+			if (!snd_soc_dai_stream_valid(dai, cpu_playback))
+				has_playback = 0;
+			if (!snd_soc_dai_stream_valid(dai, cpu_capture))
+				has_capture = 0;
+		}
 
-			if (!(snd_soc_dai_stream_valid(codec_dai, SNDRV_PCM_STREAM_PLAYBACK) &&
-			      snd_soc_dai_stream_valid(cpu_dai,   cpu_playback)))
+		/* Codec validation check */
+		for_each_rtd_codec_dais(rtd, i, dai) {
+			if (!snd_soc_dai_stream_valid(dai, SNDRV_PCM_STREAM_PLAYBACK))
 				has_playback = 0;
-			if (!(snd_soc_dai_stream_valid(codec_dai, SNDRV_PCM_STREAM_CAPTURE) &&
-			      snd_soc_dai_stream_valid(cpu_dai,   cpu_capture)))
+			if (!snd_soc_dai_stream_valid(dai, SNDRV_PCM_STREAM_CAPTURE))
 				has_capture = 0;
 		}
 	}
-- 
2.25.1

