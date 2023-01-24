Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 97BC0678E12
	for <lists+alsa-devel@lfdr.de>; Tue, 24 Jan 2023 03:13:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B1FF8E88;
	Tue, 24 Jan 2023 03:12:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B1FF8E88
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674526388;
	bh=Bg2LPm52+XPGpxmgJh3ByPosVHOefwffyTmRc6M6ISw=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=rdoX+52pwzEgHXLwwVYYaPB4VZG/q4H/5li2Szz98NLQMvvIAUH1sJHV7Awluiqnt
	 MtaomPnO6yv2Uhris0U0ns+mVjW/6+BeKjVndBimcarrqB09miwWPjdKZI7J5VlzX0
	 JBIFlhWmNguYpsGGsx6r1WpiPxQmn8vr7FCcCV2k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 53C0EF8025D;
	Tue, 24 Jan 2023 03:12:18 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4F78FF8030F; Tue, 24 Jan 2023 03:12:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,
 SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2120.outbound.protection.outlook.com [40.107.113.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7089DF801D5
 for <alsa-devel@alsa-project.org>; Tue, 24 Jan 2023 03:12:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7089DF801D5
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=FLAEOsgw
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RhDthhe/gDM0ft4jfsA5et2liYDmaYo8QwsYF0uur2xgdmit0qSy00yGz9vgw7/fEz3XGyUJS/j5L2Wfuj9FuGVIy+pJJlBRVMyUEfxVlbj+lvGZCVxYya8YwitidZ79DIhBrahg/BbaDhhGSIeO34Ct7f9dS+G5LjiHnwTiZs22ZVVSVz2wxyZeoz1cVEwIBo6BxQbMKxC2Bu2MelCEi02LMoQ4hwuRz+GPoGm1CEqZ4wqudP1bUDyIUnVvP2c3g57fDUtZKbDPBVuYMgWZlAPaxTkzhI2wsgO/D+5ATgI/Jf94yJyKDopXPmexdEDokYErpqdoCUckqwgAuLWiWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MQx4HoPoGL52/Kny/7aFTOIX0PAowcD2ccoCXKWB1IQ=;
 b=AgfQfQ3VyICd0BK7eXz9BLFK8Q38eyI0vn0L9zetZEWNqvk3xL6wT5WmfZkUVvUjYFIGic98PR/qCBM6kK0t5DrXS9ovR9UZB8UuV2tjQWPw9aLawioy2toaPwYUxQUpOyviIbJrfB4V2F8iJzD9kT3DqsIiNHHbqIbo33Htk+np1V59CnOd7qG0ePll50aooGZAzG4e6+cj04EfgFs5hC+gpo9ig28ffmkxTgz0K0HHQ1DeLwJUKTAqAfIxdbB1D5Egt9VPoLxg5F4unMZ3O1yl5LCF8TZtKsYM0zn18k1goZxTPtcDHoWspOKIDLM/zxrV8/IX6QFBkw47pLCkpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MQx4HoPoGL52/Kny/7aFTOIX0PAowcD2ccoCXKWB1IQ=;
 b=FLAEOsgwbghOkCvtl472DDQwhcRTHhvKHPzY6LzMCf+vRsVqOlUcZECMvcJbPkPU89qmSAZEggymQMNoEnHdUQqsBT7kE/A94PoMjcJxujDVrYHGhbriRxUV7UFaLw/5F204KxlGI0CC1Y0aUGJPQbRPSvLPtryU5iu4wuAbcl8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OS7PR01MB11964.jpnprd01.prod.outlook.com (2603:1096:604:23e::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Tue, 24 Jan
 2023 02:12:09 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3cd7:a7b5:ea86:9ae]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3cd7:a7b5:ea86:9ae%6]) with mapi id 15.20.6002.033; Tue, 24 Jan 2023
 02:12:09 +0000
Message-ID: <87fsc0u1dz.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Mark Brown <broonie@kernel.org>
In-Reply-To: <87y1psu1m1.wl-kuninori.morimoto.gx@renesas.com>
References: <87y1psu1m1.wl-kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 13/25] ASoC: intel: use helper function
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 24 Jan 2023 02:12:09 +0000
X-ClientProxiedBy: TY2PR0101CA0010.apcprd01.prod.exchangelabs.com
 (2603:1096:404:92::22) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|OS7PR01MB11964:EE_
X-MS-Office365-Filtering-Correlation-Id: b647b133-f989-4199-57fd-08dafdb06617
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EqmeJqBZ7RCe1qw5klJgyQIKF9lEc0vK7rl6WN3ssdCfM5PxCUYvrtTULTd85a9wvGMZCsppvyUUme0KCWVHf2MRjivN5ToNKzhsermbIa9nRdbfW8/yCNgGFDrWcalYCLSPJkplb9Baxmfcsir8UZYDbHjGKDKBAiNCJ3RAWL+Nn/EzhiZq64zcPktjok5MAnSB5h7YwSCaN9q2inVHWXz7ulK3LB4grPW2mv64j4MkV5t1bTzgMDe+ctaRh5ZCziSM6PXpM3RIg5w39WFQuwmA2N9tvI6MSzXd9hsFAvkhkmFe+loQiCN+jCLyDRGhxmxzp/1mbssFjMOc29UUGcaZ98/YkJlS9Qfcvi24sCHhve3OLNLdYcqQ1o+UrJvYt+S+DgwQ78DnTGwsV7tsyyvrZgiGWzh1UA2/BGB9GRXTL4AvvY3XauNO8TAsqLSFayW6OkgFVXRYdB3qgNGh8TA8Spb2gTjkImD7aley3Uejna+w3vxDof7Lb+HwSCXLCHHpDXqB5dnwyNz5zYE+eM4YtJIoQU9Ih2Xvw3dPzTh3FsO6YvwzY6NowqgqMtvCTf/magwABiDzgs2xMCdMdfODIAvVHdM3gni+7SNeKNd8iLN0Tz62M0S92QzOU5RAsPuxjGuxNv3OUic8IwaPLin1nHvy86lSioBlspp7Z+sNFSdM2SiNENWne3+cafF2/TYXRyPS4qRgi2mYj6gzUw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB8426.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(39860400002)(376002)(346002)(396003)(366004)(136003)(451199015)(36756003)(2906002)(6512007)(7416002)(5660300002)(478600001)(186003)(6486002)(26005)(2616005)(8936002)(54906003)(66946007)(316002)(4326008)(66556008)(66476007)(8676002)(6916009)(83380400001)(6506007)(52116002)(86362001)(38100700002)(38350700002)(41300700001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?dHd1L/PlNFEOVJYwThKKnrSYImMaSnmES+vnjapxqkv6PDU8HBNH74hOFF/u?=
 =?us-ascii?Q?Y7oR/cdsXrUIvUWAVzecZ0jWRVKXnuNposUUV2Ag3lzWiaXyP8OY6uiWFgLZ?=
 =?us-ascii?Q?u6d7EXMh6bjFgi35+qRWE0AJCnyhDlM/Z4t8coLLGMwYHCoZ7wcehr2ugKyP?=
 =?us-ascii?Q?ytq96bWyOvyI5q2UoGaN71RKv5wRzcNxYdGl7bDAiKRfvQsVBu9T0WAXOXC9?=
 =?us-ascii?Q?hSMOKpaACHZEpFux1NCbgiorl5ae9WvbLESQac2/PXoT5RTxtxT5qmZ/KV8a?=
 =?us-ascii?Q?J76NvNwWUjnKdeHy2nZwqzdvPHwq0JOt7zEYhxltO4/HQJKKvOnEFW7ha8IJ?=
 =?us-ascii?Q?S4md7whnZWp6/yQGkpFUUS42SrgxjjIcKY1ea5SkVBQcBN2IAXt6FL32uy4S?=
 =?us-ascii?Q?Bg5SItY9kZDP/6pvFlUTt7eJLiICYu/1bp3a653XO+ebdEWBkHgFiuYrsdAC?=
 =?us-ascii?Q?zKK+A1HhwJgNcNAQy2N8lbZ4ZEut2UCx6AAPfDs4bCcGyH+z9jX0Y56F5nAN?=
 =?us-ascii?Q?1GgQU1bjydYcEA5jGy/aIC9rvnZluzkw/KZRMxEhybSx9qs982q5eRMR/ewX?=
 =?us-ascii?Q?IQ4i36gHrFWlqgxdHwYWNhdVMmwcoW7vZID53jQLEq/ibw809IdSHLUTtndD?=
 =?us-ascii?Q?v01RM1mIUgOhOtDk2T9CtOpJiVwr36M33H8lW4ciGw6ZMqDyapz7oiOGd2lh?=
 =?us-ascii?Q?Tb0CI8TWaTkFOqHpgz7wMDPzqGz0jkq94vwjxhembip5KPTluc7reEncLrll?=
 =?us-ascii?Q?AmiIaSQJdQrOgMg7ZwjnH/7PcrDWb3rvS4kvsz4ymMrxeUGc3iOh3F8U7cXI?=
 =?us-ascii?Q?JiMsTGqW0r1HamPbA5jdF8nJBIag/BAth5RxZqbAM/3NTEI4ttoRMUwQn+Ys?=
 =?us-ascii?Q?Y8QRzomUWvaDBuRrZ2oEVoAluN8Vt358dnBNxOk7u6HxUZRGeNC/V9oTR9Np?=
 =?us-ascii?Q?S2P63dwpGt52eQCDr8PlimicY7oJs6a4Bwi9pR2La9R3H3EOl/roZfY2EZIz?=
 =?us-ascii?Q?zpWSEw6URVNgiBgVX4R5AJXCJLtUnpTXf99k3dal2DNlqw8vSM23ACghHQ7I?=
 =?us-ascii?Q?mXgGarVinVImhZHFz0PIhrWWYXE0YrUKqlgnzd0YKJRYXYoX+/4egykLXfW9?=
 =?us-ascii?Q?4A4iZ5fBk+fkGxoPhiMKt2xZKR4+oQ4ziwfwrASrkOI7p/aE3B30l0eZ698n?=
 =?us-ascii?Q?eob8bJQaQmJa5RTLosmH0y7dB1nv3aq/R/BPgS+ITgW3c64ohF6xeBnHyDXp?=
 =?us-ascii?Q?SjSHsWx6RRKSJE8XpH4frNwp0yeSNGnz1Rfrgepgz12XNJ4zaoVWGSWG+S3U?=
 =?us-ascii?Q?ibldM/vrdGhH3ghpXnDjYVj2QtVD2bvYsQSh3VSGARBzv4stB9dKugRJCF6G?=
 =?us-ascii?Q?j9FVAU7kz0rGzPt579QTAmcWM5leq4P2T90C/mFnXI8Oi3dFoILaYyBtkR4E?=
 =?us-ascii?Q?Y5o4yc1/sMo2Bv4ablvQolwaP5zxse/cvZA1Gpr+NOZp38QHZTD/sCdqfuCV?=
 =?us-ascii?Q?9i9s6WqX09N0I88hjlnSNa1Pit0J9QDjjqkddud8skptWuu3OWMPauNvpiyU?=
 =?us-ascii?Q?kVoZPhvdC3bz0N+9sGDz+S1MkH4hLLSz9FeynJsD0oWFQS9vdb0giPgaH/ba?=
 =?us-ascii?Q?Pf5jY3C2ZTzDU9evWnAsU74=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b647b133-f989-4199-57fd-08dafdb06617
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2023 02:12:09.6473 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oa6fN7vfjkI6iq0NbJ6wfbgLf+ZVnVG2pJR10uZjYAWtbVh2Fiuhj42Je47/+dTKJ/F/yh5wDylCOner3sgXac4PFj0TROu1NsHxRmHyEQW1MvGS/Uel11fpQTljPF/U
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB11964
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
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Linux-ALSA <alsa-devel@alsa-project.org>, Takashi Iwai <tiwai@suse.de>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 =?UTF-8?B?IkFtYWRldXN6IFPDhYJh?= =?UTF-8?B?d2nDhYRza2ki?=
 <amadeuszx.slawinski@linux.intel.com>,
 =?ISO-8859-1?Q?=22P=C3=A9?= =?ISO-8859-1?Q?ter_Ujfalusi=22?=
 <peter.ujfalusi@linux.intel.com>, Colin Ian King <colin.i.king@gmail.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Current ASoC has many helper function.
This patch use it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/intel/atom/sst-atom-controls.c |  9 ++-------
 sound/soc/intel/avs/boards/nau8825.c     |  5 +++--
 sound/soc/intel/avs/pcm.c                | 15 ++++++++-------
 sound/soc/intel/skylake/skl-topology.c   | 19 ++++---------------
 4 files changed, 17 insertions(+), 31 deletions(-)

diff --git a/sound/soc/intel/atom/sst-atom-controls.c b/sound/soc/intel/atom/sst-atom-controls.c
index fd59b35a62ba..38116c758717 100644
--- a/sound/soc/intel/atom/sst-atom-controls.c
+++ b/sound/soc/intel/atom/sst-atom-controls.c
@@ -1327,15 +1327,13 @@ static bool is_sst_dapm_widget(struct snd_soc_dapm_widget *w)
 int sst_send_pipe_gains(struct snd_soc_dai *dai, int stream, int mute)
 {
 	struct sst_data *drv = snd_soc_dai_get_drvdata(dai);
-	struct snd_soc_dapm_widget *w;
+	struct snd_soc_dapm_widget *w = snd_soc_dai_get_widget(dai, stream);
 	struct snd_soc_dapm_path *p;
 
 	dev_dbg(dai->dev, "enter, dai-name=%s dir=%d\n", dai->name, stream);
+	dev_dbg(dai->dev, "Stream name=%s\n", w->name);
 
 	if (stream == SNDRV_PCM_STREAM_PLAYBACK) {
-		dev_dbg(dai->dev, "Stream name=%s\n",
-				dai->playback_widget->name);
-		w = dai->playback_widget;
 		snd_soc_dapm_widget_for_each_sink_path(w, p) {
 			if (p->connected && !p->connected(w, p->sink))
 				continue;
@@ -1352,9 +1350,6 @@ int sst_send_pipe_gains(struct snd_soc_dai *dai, int stream, int mute)
 			}
 		}
 	} else {
-		dev_dbg(dai->dev, "Stream name=%s\n",
-				dai->capture_widget->name);
-		w = dai->capture_widget;
 		snd_soc_dapm_widget_for_each_source_path(w, p) {
 			if (p->connected && !p->connected(w, p->source))
 				continue;
diff --git a/sound/soc/intel/avs/boards/nau8825.c b/sound/soc/intel/avs/boards/nau8825.c
index 6731d8a49076..b31fa931ba8b 100644
--- a/sound/soc/intel/avs/boards/nau8825.c
+++ b/sound/soc/intel/avs/boards/nau8825.c
@@ -258,14 +258,15 @@ static int avs_card_resume_post(struct snd_soc_card *card)
 {
 	struct snd_soc_dai *codec_dai = snd_soc_card_get_codec_dai(card, SKL_NUVOTON_CODEC_DAI);
 	struct snd_soc_jack *jack = snd_soc_card_get_drvdata(card);
+	int stream = SNDRV_PCM_STREAM_PLAYBACK;
 
 	if (!codec_dai) {
 		dev_err(card->dev, "Codec dai not found\n");
 		return -EINVAL;
 	}
 
-	if (codec_dai->stream_active[SNDRV_PCM_STREAM_PLAYBACK] &&
-	    codec_dai->playback_widget->active)
+	if (snd_soc_dai_stream_active(codec_dai, stream) &&
+	    snd_soc_dai_get_widget(codec_dai, stream)->active)
 		snd_soc_dai_set_sysclk(codec_dai, NAU8825_CLK_FLL_FS, 0, SND_SOC_CLOCK_IN);
 
 	return snd_soc_component_set_jack(codec_dai->component, jack, NULL);
diff --git a/sound/soc/intel/avs/pcm.c b/sound/soc/intel/avs/pcm.c
index c4376c9c35ef..211edd51a896 100644
--- a/sound/soc/intel/avs/pcm.c
+++ b/sound/soc/intel/avs/pcm.c
@@ -35,15 +35,13 @@ struct avs_dma_data {
 static struct avs_tplg_path_template *
 avs_dai_find_path_template(struct snd_soc_dai *dai, bool is_fe, int direction)
 {
-	struct snd_soc_dapm_widget *dw;
+	struct snd_soc_dapm_widget *dw = snd_soc_dai_get_widget(dai, direction);
 	struct snd_soc_dapm_path *dp;
 	enum snd_soc_dapm_direction dir;
 
 	if (direction == SNDRV_PCM_STREAM_CAPTURE) {
-		dw = dai->capture_widget;
 		dir = is_fe ? SND_SOC_DAPM_DIR_OUT : SND_SOC_DAPM_DIR_IN;
 	} else {
-		dw = dai->playback_widget;
 		dir = is_fe ? SND_SOC_DAPM_DIR_IN : SND_SOC_DAPM_DIR_OUT;
 	}
 
@@ -929,7 +927,7 @@ static int avs_component_pm_op(struct snd_soc_component *component, bool be,
 	int ret;
 
 	for_each_component_dais(component, dai) {
-		data = dai->playback_dma_data;
+		data = snd_soc_dai_dma_data_get_playback(dai);
 		if (data) {
 			rtd = asoc_substream_to_rtd(data->substream);
 			if (rtd->dai_link->no_pcm == be && !rtd->dai_link->ignore_suspend) {
@@ -942,7 +940,7 @@ static int avs_component_pm_op(struct snd_soc_component *component, bool be,
 			}
 		}
 
-		data = dai->capture_dma_data;
+		data = snd_soc_dai_dma_data_get_capture(dai);
 		if (data) {
 			rtd = asoc_substream_to_rtd(data->substream);
 			if (rtd->dai_link->no_pcm == be && !rtd->dai_link->ignore_suspend) {
@@ -1291,11 +1289,14 @@ static void avs_component_hda_unregister_dais(struct snd_soc_component *componen
 	sprintf(name, "%s-cpu", dev_name(&codec->core.dev));
 
 	for_each_component_dais_safe(component, dai, save) {
+		int stream;
+
 		if (!strstr(dai->driver->name, name))
 			continue;
 
-		snd_soc_dapm_free_widget(dai->playback_widget);
-		snd_soc_dapm_free_widget(dai->capture_widget);
+		for_each_pcm_streams(stream)
+			snd_soc_dapm_free_widget(snd_soc_dai_get_widget(dai, stream));
+
 		snd_soc_unregister_dai(dai);
 	}
 }
diff --git a/sound/soc/intel/skylake/skl-topology.c b/sound/soc/intel/skylake/skl-topology.c
index b20643b83401..96cfebded072 100644
--- a/sound/soc/intel/skylake/skl-topology.c
+++ b/sound/soc/intel/skylake/skl-topology.c
@@ -1663,11 +1663,10 @@ int skl_tplg_update_pipe_params(struct device *dev,
 struct skl_module_cfg *
 skl_tplg_fe_get_cpr_module(struct snd_soc_dai *dai, int stream)
 {
-	struct snd_soc_dapm_widget *w;
+	struct snd_soc_dapm_widget *w = snd_soc_dai_get_widget(dai, stream);
 	struct snd_soc_dapm_path *p = NULL;
 
 	if (stream == SNDRV_PCM_STREAM_PLAYBACK) {
-		w = dai->playback_widget;
 		snd_soc_dapm_widget_for_each_sink_path(w, p) {
 			if (p->connect && p->sink->power &&
 				!is_skl_dsp_widget_type(p->sink, dai->dev))
@@ -1680,7 +1679,6 @@ skl_tplg_fe_get_cpr_module(struct snd_soc_dai *dai, int stream)
 			}
 		}
 	} else {
-		w = dai->capture_widget;
 		snd_soc_dapm_widget_for_each_source_path(w, p) {
 			if (p->connect && p->source->power &&
 				!is_skl_dsp_widget_type(p->source, dai->dev))
@@ -1744,14 +1742,12 @@ static struct skl_module_cfg *skl_get_mconfig_cap_cpr(
 struct skl_module_cfg *
 skl_tplg_be_get_cpr_module(struct snd_soc_dai *dai, int stream)
 {
-	struct snd_soc_dapm_widget *w;
+	struct snd_soc_dapm_widget *w = snd_soc_dai_get_widget(dai, stream);
 	struct skl_module_cfg *mconfig;
 
 	if (stream == SNDRV_PCM_STREAM_PLAYBACK) {
-		w = dai->playback_widget;
 		mconfig = skl_get_mconfig_pb_cpr(dai, w);
 	} else {
-		w = dai->capture_widget;
 		mconfig = skl_get_mconfig_cap_cpr(dai, w);
 	}
 	return mconfig;
@@ -1905,20 +1901,13 @@ static int skl_tplg_be_set_sink_pipe_params(struct snd_soc_dai *dai,
 int skl_tplg_be_update_params(struct snd_soc_dai *dai,
 				struct skl_pipe_params *params)
 {
-	struct snd_soc_dapm_widget *w;
+	struct snd_soc_dapm_widget *w = snd_soc_dai_get_widget(dai, params->stream);
 
 	if (params->stream == SNDRV_PCM_STREAM_PLAYBACK) {
-		w = dai->playback_widget;
-
 		return skl_tplg_be_set_src_pipe_params(dai, w, params);
-
 	} else {
-		w = dai->capture_widget;
-
 		return skl_tplg_be_set_sink_pipe_params(dai, w, params);
 	}
-
-	return 0;
 }
 
 static const struct snd_soc_tplg_widget_events skl_tplg_widget_ops[] = {
@@ -2978,7 +2967,7 @@ void skl_cleanup_resources(struct skl_dev *skl)
 		return;
 
 	card = soc_component->card;
-	if (!card || !card->instantiated)
+	if (!snd_soc_card_is_instantiated(card))
 		return;
 
 	list_for_each_entry(w, &card->widgets, list) {
-- 
2.25.1

