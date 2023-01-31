Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 364206821CE
	for <lists+alsa-devel@lfdr.de>; Tue, 31 Jan 2023 03:03:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 41177EC7;
	Tue, 31 Jan 2023 03:02:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 41177EC7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675130613;
	bh=Bg2LPm52+XPGpxmgJh3ByPosVHOefwffyTmRc6M6ISw=;
	h=From:Subject:To:In-Reply-To:References:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=cHEa9VLAWupIg4SMGjXX25GIsZVZIySSE/tPkYblknZHk9cCZBDLQB627CiEjifZ3
	 kcO4z/fNv/h2ofnF3Yv1uUF9sVy7iOYANKMMa4zsCcJRgvzjWUbocGge2rwPivU0ns
	 Zyb8alzNkNdps5Z+EkQ1tjbdwnvbxj6scgWc+o4w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8B815F805A8;
	Tue, 31 Jan 2023 03:00:53 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C51BEF80557; Tue, 31 Jan 2023 03:00:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,
 SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-sgaapc01on2110.outbound.protection.outlook.com [40.107.215.110])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B4B08F80155
 for <alsa-devel@alsa-project.org>; Tue, 31 Jan 2023 03:00:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B4B08F80155
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=BVWizprp
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Czb0vERhWWS5G1d7n5G1M7G2tj6KiwKZTvLg+hLm+hlaFXP/05wGwsvHrEvYQSCNekQ/NaoGFgO7claSoD/2UaZjm0rUZZRz4GMUkoALaJQ2MBvi9hwV49XMiU6pj6V+MSYTC6ROIzM2CHEfNPjzQ4R0J+4pZfeQAcA2VjMOxyvmV2D6NPzHmVBVV+OArDDi5L0lfHa1DECVXzu3QWttaFSRtn7Wwd4GLWX+mCza3l/vhn11AlE5CQfBv0oqB93VbkFs2/X58QC+UKo7aiEbFOGKsh9UfAyAsFMkvJqKICVgFib0PuW4nHxEtdF8Ijw4BJ/Hh0sEbXvVW6tf+ChEiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MQx4HoPoGL52/Kny/7aFTOIX0PAowcD2ccoCXKWB1IQ=;
 b=U9jKM5xM8Cdr7iudFqZ+4fnQ4BBsTQSe+294nEaspPQXt1sKfyfN3TIcu6eDL2eLXu/Wvrj6+dzAWeX/zKf8gxdFLcGK0AbOLbAqlXABBaykzoYc6pD2i+gIIw52UvXEtBKdX4GjqkTnfNT6c5CfjXXAWUfbIIgxrvkND/CgtnBIc/4qFfk3ZQbNckwmd3tCB3ectvFd/kTgr2fsWFvQ02dkTOeYr8UiQ+KcsyV6hxu5bNcXG0fPOCQetCgl+iaxUL7acSGGZRZE5ebEwwCGgm/jjwBEvs5/967VlJ5ZwRvRijZ2uafxzqG6syJOjusCr4s3tzxwqVoSVTNz5Hd/yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MQx4HoPoGL52/Kny/7aFTOIX0PAowcD2ccoCXKWB1IQ=;
 b=BVWizprpbl3O2MmFgj5h5OFcYogUqfeOIPoSBivJBN9KZrxiR1zig36Xf15cjHA61kvTQlwg7hFBx0cucqY3UBTuQCIoIDxHGRBPTtz64IWjnKg5V8b3Z8BOWIadWKVoxIVU1gJV0tIweEpTY8G9G6yXdlykeOz8H2rBbhhK6Yo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OS3PR01MB8196.jpnprd01.prod.outlook.com (2603:1096:604:176::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.38; Tue, 31 Jan
 2023 02:00:42 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::4b75:8d8e:d89a:7860]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::4b75:8d8e:d89a:7860%8]) with mapi id 15.20.6043.036; Tue, 31 Jan 2023
 02:00:42 +0000
Message-ID: <87tu07ea45.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v3 13/25] ASoC: intel: use helper function
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
In-Reply-To: <87cz6vfosc.wl-kuninori.morimoto.gx@renesas.com>
References: <87cz6vfosc.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 31 Jan 2023 02:00:42 +0000
X-ClientProxiedBy: TYAPR01CA0024.jpnprd01.prod.outlook.com (2603:1096:404::36)
 To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|OS3PR01MB8196:EE_
X-MS-Office365-Filtering-Correlation-Id: b5b10f5f-f1d5-4c14-667f-08db032ef57a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: epOT4kRYTn2MTTdzZwEP85Wo1SXpP/EzJ1/BtU0cEelykyd58hD30r0Darg40gP4Wqc2P4LA6dK/pA1uVLXRJWgr6cjTPEyKgGMHdlrCD2VkkxGN2wOP9nmqIlaB6N5LkrHBbiKKziH03SbAICUZeo1loQ86Qr0AiFz8Ay9qWmaq2tCLCFejAsqCeIbmu8KoTYKcvFgnVnTdsUyQNzvRlFVsFDAqxJm4VJl499Qwc73oGfwuRfnESIhnUFEwY5lgix2zItHyj1MTuLF9TOxE/HYiLHd+n1/yR8OzJ7bJRvYVx7u126+WlODaa7J4YT3Lq213ldzt3j1bpoUHUhJ5qBEq/+CDFD7A6L5k70NWQ+hSSVRPXmGw4r1l6BnBxAO29xifXQr7ZcR1Y7man7zFasTFEOfwC6RJIaxH4WwRfhPn8v5l1KjUuLyWrmiCPJ//kOsxhBw1RNlraipyBQTVXUjsRvv//whoXxiiEkvd9k+8t5YZk6phHzdcG5Jh3WR7pLyRCspag3u6FcCU7esce82FoNgHuI8v57biWztP7ZqeeqR9izhEo72tGhVq1WccOGrw7qIz3j1peHmtD4NYHlxOJB2FtKU144l3Yr6hMXW9ipt4++13LstL+NgETHZRGMCLs7hBAgD9STNHvhWUI+C+R6Q1r3OVsPAQ6evjSjmfjEjzfOtmTsAcGdQBs50s3zvZ7oyO2LXuo3laUCEBbw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB8426.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(346002)(136003)(366004)(39860400002)(376002)(396003)(451199018)(8936002)(2906002)(6916009)(38100700002)(4326008)(38350700002)(36756003)(478600001)(5660300002)(186003)(6486002)(6506007)(52116002)(26005)(6512007)(2616005)(86362001)(41300700001)(83380400001)(66556008)(8676002)(66946007)(66476007)(316002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?m2Rnb/+vk6Qfrvg0IP0HyI27OF3gcknskQ4fTGsIL9+f8l0IC5niLXC2KGfw?=
 =?us-ascii?Q?u2Mr9IwQKVnyqBzjuUk0hwnf3q4zJVOnXOHRbhoIUT3m/xgTLwrces5ArIPK?=
 =?us-ascii?Q?bwa+XBxnNglr4TyCmKObW66lSpQXegq3evvzfEeHEmGa25uYlUhSa8MwdHAA?=
 =?us-ascii?Q?2qlCcJ/4q9CWf04c+gkJiwtJ+/qkEVn/OF4+sw9Uo+1S922zkn8lpB8Tdf2O?=
 =?us-ascii?Q?g25hehH/XCbWQvR/eyWIu/gFxGPtAHYiTOR7x0ORdnSdnPfQsa9crOhOHARh?=
 =?us-ascii?Q?j9dAREKkuXbHp2fTdFKt+sx1tQCUGB+3GWg/9M2a13qfNqR8jqpZROmniVMU?=
 =?us-ascii?Q?ycyrAMIo6HI+iLOw308K5ZP4Mghgsp4CLzq/RvdVs2FqUyFXJ5d6cGi5blQT?=
 =?us-ascii?Q?caG0EFaJ/E/qWR3zeJgNQp3VrQ3YXGmuuKen7rkxfF5sHX1pSSb2bVrU4hrC?=
 =?us-ascii?Q?DPooBBliXFFqJO/d6npnH9xlyqG1RbVCFsgBf2QxFncTLQxVBLWpfiSPL7LY?=
 =?us-ascii?Q?+/BULP6ZpSv6qNawyMxp3anFT49GS+HaVs5R5QOVsYCNWzAKgw7hGInJTBq9?=
 =?us-ascii?Q?xPETurPVFIzJBeOEJv9Q8T7xi9IOLTYIn3EgG7jh7GlXl5ThFm0Z3sIETxpM?=
 =?us-ascii?Q?Ftfwh0h2plBv8+QOtwz4qU4vVfXOp+47FvzxUHAJMfvaSGwfz5O3VZtvdUp9?=
 =?us-ascii?Q?HEiUg4EymyPckkLS16t/ue51fXv1Cj6ZUvSdYxRlvbtFeUKdbrpJR5dEPSP7?=
 =?us-ascii?Q?831qR6IjQWqp5APszQFbCDJALJLzTZ0qYZvGXjrsgQYYC7ZNo4w1qPK7MFPm?=
 =?us-ascii?Q?fCkmXTDfAYCXORbLsBkZgvxyKruKCPVzbSmr3s04DYs1p3KkGtYbrVYASImt?=
 =?us-ascii?Q?wVU+l0h1SkXZlFuSvIVhZRNUu5GZ8680owVqPS5g3twtOJQaAEfOLMI9M90a?=
 =?us-ascii?Q?44CG/bnMdM/+GzRIRdj89IqV9Yi+WDLdN89QiSvF4UeW0i14nKkO1vwv++86?=
 =?us-ascii?Q?jQ/aymDpgKLOvpBMZwslE/38f2lesIKkIUwB4GZ/IKGkyXe1b4i2GN0vcr4x?=
 =?us-ascii?Q?2uZVNCHNPXSz88mPEsXAcTP/HZE4v6v4wsPUTUc/p4+zt2MZIU34UOMbNXCn?=
 =?us-ascii?Q?kK6FpFWbfCn6BNSXd+FwBG/51ad73JJe/LmkhRD4i/7kJVfy9tYqKwqSyhm/?=
 =?us-ascii?Q?O1EVHJSx4iRMRg1R2K6Zmvscw39muUPAda5qDSHs0I5ziwewbmMIS856JINA?=
 =?us-ascii?Q?ytM71o4MBgPXcA5jUSzd0jst5+DyqelYuxYDVCmr/lfmO4dmlt2uovQyM1y7?=
 =?us-ascii?Q?iEbtr9DziZaOd0l+5RrF48hlPLMdGnqHC9Py86Ktw05p2CMkmiKIZOEnYkIA?=
 =?us-ascii?Q?cJTRxGXjn8bg/mCrzhNUelv0bOTP0U5c/YEUJr1qJkDuNhfoH/Tox9PNTfgp?=
 =?us-ascii?Q?nxBsgUbVaXYrxk2P8O6fSr/oCrrmFBwNLXDX+Di7m10VNaI1Dlw9W0tb0Ow9?=
 =?us-ascii?Q?e4601czdmX1/kjzJjUgkrBQhTobKFhI12lS/cC05+mhOASlV3EHaR4DivyFw?=
 =?us-ascii?Q?xcPZjIIVu+oRNvrEgZ/Vxdju/QJZHdzQUDHOOEsPZ2MskZOXggkwuc1jHcrM?=
 =?us-ascii?Q?Y6at932rjcMsP8XH3AYBr9c=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b5b10f5f-f1d5-4c14-667f-08db032ef57a
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2023 02:00:42.5812 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kQb9jwKtGOt02Eavw1E/XYLNw0ixFZtoxAD9UvfBKd4YO+88r8ec//uhatWKk/S5TT4592ptpjxVWh20MZ3yTwHkCY6fzoyTpBzQt71BvjwPQVdWqc4VENT6PLnGqwO8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB8196
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

