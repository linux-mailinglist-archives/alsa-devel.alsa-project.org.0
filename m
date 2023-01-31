Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EF10A6821BB
	for <lists+alsa-devel@lfdr.de>; Tue, 31 Jan 2023 03:00:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BF1BBE87;
	Tue, 31 Jan 2023 02:59:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BF1BBE87
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675130429;
	bh=CyzRx2bD1So0VkJzfv7bi9HUGyT90m5ggpvn/z95xGg=;
	h=From:Subject:To:In-Reply-To:References:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=mkUxrclUfRtuYuPwsw2hLT+V/iAYEHznC4himhh4o4Y9o+M3X5vkcAmkHROpwE0Eb
	 cPnLm5y3zBnzgYetiT261zbEPDf7lsHZySqQGzB/5oXWzhsJigCoEvFzHSnzkfM9jp
	 cyN7uj10xfhd9odS8tJ8YMbwMks66wloFDzZ3VyU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 44505F8047D;
	Tue, 31 Jan 2023 02:59:08 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DB653F804C2; Tue, 31 Jan 2023 02:59:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,
 SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from APC01-TYZ-obe.outbound.protection.outlook.com
 (mail-tyzapc01on2107.outbound.protection.outlook.com [40.107.117.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5A13CF8047D
 for <alsa-devel@alsa-project.org>; Tue, 31 Jan 2023 02:59:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5A13CF8047D
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=abwOtCx3
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RLpdsBa1sfP79zmMFjVKzRda/bpCj31qVgA1mssEjh/+236d2Biz4MUMoao7eHldif48IgjNCIL5RfaHUWvsAb3lY8QGZK/BhksskcRIL6LBd3r7ZsUtPzKl2PnJTBRm8W+9sX5q1n0ZtggqcQtf3/5T0p2/1PpHtQFfL3Zlu2ugVWWLr1t2V9qnHess8384fmMlUeGHn11W9XAO9r54wbcCMKs+81JxjZ65hwVyyigM2fxwg6B6p5vWuDaqSNthFERvs2e0k+3Uz+ntC9OhsTlPqf/G3bTqBNOFmX9iit9fvY9rKTDUPHCOcP/YmBERWKOesR7aNCeRKkbs6CLvEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DCBBiVpXXVVV/WdixsKJwRGj8NlkbWf+jRkxdl8LC/Y=;
 b=RSV261h8yx8zYocU++JltM3t+CI5XpxvSwvK1r7tN40ScIXDZA3E5QUFU22l+E9lvW60aZWzRD+AibiQ5uDpL2hoSl1HTMe1ja5+GrWKtzDPlckxdkObO1Th+KGMy1I+x9jw9lcmDH3V0bjGv4GGU/90+Np+bD0sr/KDz7ibG/78zXXNToO5IeTdn436gWIpWomnfCeUNUmNpxPWqb1uXwPSNoyhBUKeAU746y+iKgGO/VZgqEGW7NT7ssQdGNHz+ngFfqYtbiUXd+zcDfmNd2Z8qxHvyd9C9I1SplH82/0KsQt6VijVsTpzmoqVwuNZw86srmD8HIrYhXWrHfF1KQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DCBBiVpXXVVV/WdixsKJwRGj8NlkbWf+jRkxdl8LC/Y=;
 b=abwOtCx37oOy0sFB//bpHHd3v5eVIEjV06SQCsfKzSWXMPYJaOCSdI9NBswCrS/vaD6AGXrc6QD3Y97zsjUJ50o5h2x11E83yt+AaHf3UoCv43HPzM2tXDOmiNCME40paz76a6gxpRMRJ14Ll6mqyteAc0K6dJriZfe0D8xZ4+k=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TY3PR01MB9980.jpnprd01.prod.outlook.com (2603:1096:400:1aa::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.36; Tue, 31 Jan
 2023 01:58:58 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::4b75:8d8e:d89a:7860]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::4b75:8d8e:d89a:7860%8]) with mapi id 15.20.6043.036; Tue, 31 Jan 2023
 01:58:58 +0000
Message-ID: <87a61zfori.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v3 02/25] ASoC: soc-dai.h: add snd_soc_dai_dma_data_set/get()
 for low level
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
In-Reply-To: <87cz6vfosc.wl-kuninori.morimoto.gx@renesas.com>
References: <87cz6vfosc.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 31 Jan 2023 01:58:58 +0000
X-ClientProxiedBy: TYCPR01CA0006.jpnprd01.prod.outlook.com (2603:1096:405::18)
 To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TY3PR01MB9980:EE_
X-MS-Office365-Filtering-Correlation-Id: 4160a3c3-d360-4aaa-530b-08db032eb78b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XvjihAZxV74K9nJT6eCqklbLfQHlN74fw3CpSlZzAD6PLrug4UuSUMC3rgrmXcIF6WZZtPY/zB/dymTkDmcZuaHzDTE1VMYn2Z6eXFw0nuf3Dix4Vt2SGWQipsb6+V+jSb3f5gYj6BAjjRrX8Eqtd1CJ+SXR9UNWHMlknCRaOkzfwBUscM/qnmjby7NV8501vZ68UPUR6ElbqfE4t4xM5Hhb6zkLXNMnY+XXgT6GmLWizrl1rTKwhSiiJUr8oLOd1JUKbIu+iSLPWaQVrHkhuq+/WxpXDYGJdb863oEVV/X23tM7MO7Q3Nl7SMqUQdkcSSGcBgzA1UqmKLm4jh+GA3saqUmZeuXuNF/vy4As6mULx5qrAK76AQiduTi+BFESdHIOIrFEuzy17x4CL3Gv8IAXLeaLdBM8g3kAHlhru0Vpk7etgCm+UJc5BeK6hJ57O8tVxubx+c2xcv5St3FLaJAQ4QBX6tuXjXmrvWvu4FQSSFBxgUaG+njrYBz4/HECMRgK5Y1IgmqxvZyIBvfT3KbPNXNcS7zMvqwYgSWIZR+NKJu9i952ceAbdSL5gks0XtYMXrgKSlAcBlT5lnanQkqGumkMsR/dVQuO2crGo2MMclmz7oSw7qAQwmMGXa5GCVmilFtmltoYwXFPu/WdlzSUwQfbN809S2pgYluUozSXg4bpQcUwuzWoXxxW8gvEXXM7+gk6El+pDzuMZAKUuw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB8426.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(136003)(376002)(366004)(396003)(346002)(39860400002)(451199018)(66476007)(8676002)(66946007)(66556008)(4326008)(41300700001)(6916009)(8936002)(316002)(2906002)(5660300002)(6486002)(478600001)(52116002)(186003)(6506007)(26005)(6512007)(2616005)(83380400001)(36756003)(38100700002)(38350700002)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?YEeLr/3wz/89p74wNzOI13gXWhbwk0UtvvDTdQ66JwxiZwzacqjXqzuF1bu3?=
 =?us-ascii?Q?K7F5Mh3rg789FBtBjPyLee3PakflqeXsmctaA6uKJb5Yy5LjB9vNMBIsZjul?=
 =?us-ascii?Q?kW2Lonn7QlxlxM3H5Ev+wpk0o4D4MXBdBIFnarDd9NEDCN3GGCuR+Onhv063?=
 =?us-ascii?Q?a4FzF24OJM8y1HRXaOx9iUW8SnGbYVDBonfzIpNlLZhKWGyCq/vJZ4li490p?=
 =?us-ascii?Q?OB8O5E1S8pO9yssBRTDl0uuMzYzgkP7iLyCzTNSkUlgx8qszWLYNOLMq28Iw?=
 =?us-ascii?Q?J658XmdyTq9QtbgvJe1KolY0zJO1KjoPcFp/4EwXoBa/o6vzcTROX8iToVgr?=
 =?us-ascii?Q?yQiUDdvZ97JXrRUgYiB9n8z/TMRXaQXCj6C9xzwMotQhtaBQPvitSxZVcHN+?=
 =?us-ascii?Q?/Nor6/SgG0dxpONhu3VcsxubINVXj6WIr454tLmin1gkr4heLl48Wmu8zRKr?=
 =?us-ascii?Q?xV7KkxKw2t4f1GL/9p64Rth34DPmvQh0dHY1u3cve1zfYEW4FRetAdzR87WH?=
 =?us-ascii?Q?fOAkaRG9EQVaVKjLyhALw8u/OuhAimauEDDT1424gekBRD+s/wU6bW1d/ekZ?=
 =?us-ascii?Q?2QLV/abRRwbre5gOdljjhxfoK5ZDFmEv94I1oqRZo2YZJZVkrt/tjG2XK8MJ?=
 =?us-ascii?Q?e9O56g9wHI7kQQptfZ0JjOJEGuxtGXJkLX3b79ILZfKKEYJX7mIzOPWJ7XzH?=
 =?us-ascii?Q?BKP0dTG3U9Z9BUIUTHxTnIIDWSadOZzdk61N6mbpOMYcybQYjO6HxY4XtrKl?=
 =?us-ascii?Q?BqS0EgNENx57R9ESh+oAu7n6NEBnGXipGuaSurZg2Pn5d43ZCekp01hFqUx/?=
 =?us-ascii?Q?7F5ORxXUufMN9imDNXuLuc0ipTQrX6hZMehcdC3/jfKoaDYs1I1mAipJRSqs?=
 =?us-ascii?Q?BLgKM4Hs1CGCb+RgYTH7zQ0LJV3A2wdsoMS5GKVN5EotRbBpCpu64PxbZ08r?=
 =?us-ascii?Q?1jDiJ1LQD/i61J1zWxlKTeZ9vNQcXrMGyG9sl6IUhNjITUidwGkZHIB1TzO/?=
 =?us-ascii?Q?Xi4vFQciyUzH2//xG6ri95oHmLANcIdettHepTprJps3slhCmPnOym/p0yFW?=
 =?us-ascii?Q?Z4YOM849ZqOpqBk936+Dle+zveV69NM2efdWNcALSxx/Aal22zYsk5YwPukU?=
 =?us-ascii?Q?MerUIpRDfseYZXdytqx+iAbxOw3darXzCIp5DBtaTZE0HzRvtqwl/p+AkVSR?=
 =?us-ascii?Q?VN2XtrRIUYWsyb2QrMfI8uIu6KrEqUFRngP9PN0UaqkCxsTLPAel87ubyZfw?=
 =?us-ascii?Q?wlzVAm1v6D+femkPxB9GopGBPNhsOOR9r8Pkvyb+l9OTJUilQq21S9uF5Jtd?=
 =?us-ascii?Q?QkMGr/zZcp4ZIH46HmBeGBMtfQbr/VcUNV0TYUrKjoh+umidydDOnaNCQkaS?=
 =?us-ascii?Q?eGuiYnFR8sQ6P4Lim8wBIfPXL6qthxjsfvn0MlbTPjB4snPV7w93I7wuXH6c?=
 =?us-ascii?Q?tbZ3MZSeKdj8YSeywxhpoUOdnkpvUEl7N+h9RCpEikANe6vGW/brY3A3eOhZ?=
 =?us-ascii?Q?s4Ynmh1FZIQ+NZ25Frs2rgcptzSOAt/TZsv9SLjB8FQjbpDBX+3EVDncu88k?=
 =?us-ascii?Q?eZp/gA4qpVvS+h02vpaPTp7+SngZrHWH9tZd2r6sfoMhjn3hCLzmWzbhPhF/?=
 =?us-ascii?Q?rO8ajDQQGCTUCcU0XjqTgkc=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4160a3c3-d360-4aaa-530b-08db032eb78b
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2023 01:58:58.6890 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jM80iqSOptd3JJ5ZjrP7RmcBEeCrjbAgAoJgHQNayo5fiL9DQuQX2asaqOl87Lxa+9mv3LHEnv0dpgfhBycpE0ZC6no50UqrabwL+y0eXnsZKWPF8qvzRFW+QJcpPqm2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB9980
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

Current ASoC has snd_soc_dai_set/get_dma_data() which is assuming
struct snd_pcm_substream to get Playback/Capture direction.

But, many drivers want to use it not through snd_pcm_substream.
This patch adds more low level snd_soc_dai_dma_data_set/get() for it,
and previous functions will be macro for it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 include/sound/soc-dai.h | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/include/sound/soc-dai.h b/include/sound/soc-dai.h
index ea704d92deaa..f27b33dd97bd 100644
--- a/include/sound/soc-dai.h
+++ b/include/sound/soc-dai.h
@@ -493,18 +493,21 @@ void snd_soc_dai_set_widget(struct snd_soc_dai *dai, int stream, struct snd_soc_
 		dai->capture_widget  = widget;
 }
 
-static inline void *snd_soc_dai_get_dma_data(const struct snd_soc_dai *dai,
-					     const struct snd_pcm_substream *ss)
+#define snd_soc_dai_dma_data_get_playback(dai)	snd_soc_dai_dma_data_get(dai, SNDRV_PCM_STREAM_PLAYBACK)
+#define snd_soc_dai_dma_data_get_capture(dai)	snd_soc_dai_dma_data_get(dai, SNDRV_PCM_STREAM_CAPTURE)
+#define snd_soc_dai_get_dma_data(dai, ss)	snd_soc_dai_dma_data_get(dai, ss->stream)
+static inline void *snd_soc_dai_dma_data_get(const struct snd_soc_dai *dai, int stream)
 {
-	return (ss->stream == SNDRV_PCM_STREAM_PLAYBACK) ?
+	return (stream == SNDRV_PCM_STREAM_PLAYBACK) ?
 		dai->playback_dma_data : dai->capture_dma_data;
 }
 
-static inline void snd_soc_dai_set_dma_data(struct snd_soc_dai *dai,
-					    const struct snd_pcm_substream *ss,
-					    void *data)
+#define snd_soc_dai_dma_data_set_playback(dai, data)	snd_soc_dai_dma_data_set(dai, SNDRV_PCM_STREAM_PLAYBACK, data)
+#define snd_soc_dai_dma_data_set_capture(dai,  data)	snd_soc_dai_dma_data_set(dai, SNDRV_PCM_STREAM_CAPTURE,  data)
+#define snd_soc_dai_set_dma_data(dai, ss, data)		snd_soc_dai_dma_data_set(dai, ss->stream, data)
+static inline void snd_soc_dai_dma_data_set(struct snd_soc_dai *dai, int stream, void *data)
 {
-	if (ss->stream == SNDRV_PCM_STREAM_PLAYBACK)
+	if (stream == SNDRV_PCM_STREAM_PLAYBACK)
 		dai->playback_dma_data = data;
 	else
 		dai->capture_dma_data = data;
-- 
2.25.1

