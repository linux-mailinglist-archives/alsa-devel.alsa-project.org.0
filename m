Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C5076821D8
	for <lists+alsa-devel@lfdr.de>; Tue, 31 Jan 2023 03:05:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 32CD2EC9;
	Tue, 31 Jan 2023 03:04:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 32CD2EC9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675130719;
	bh=hZ4qmIsNr1IYsGbCqfC71T9AvkAFMeaLktbP8HlCfzk=;
	h=From:Subject:To:In-Reply-To:References:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=i7XULHtnaEmDDbgyiFzOsw0dxaYYarEewvzqWuUJXEKh13UDbhmx+w1PEYt+5sK/r
	 SI3w/TNVvMEc3jJSLQPZ0sgBPTaN0rLm9NnZooqR3aFK+TaUaP27hCEyKw4KToDmGY
	 rmR0BMI1VPzAgYURK5EOGP+ij90k8V0BwuhwBo9A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2CFC7F805C9;
	Tue, 31 Jan 2023 03:01:29 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A5EB0F80578; Tue, 31 Jan 2023 03:01:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from APC01-PSA-obe.outbound.protection.outlook.com
 (mail-psaapc01on2071e.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:feae::71e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5D648F8055B
 for <alsa-devel@alsa-project.org>; Tue, 31 Jan 2023 03:01:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5D648F8055B
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=pkmCJec7
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XJ0Ec9WbvfoGHbS5PIb/P5TcGWixnHLDRpuds5MxAQEsM5BBnrwwx9MLg0UcHcXs4nv1WyyRW8B9EkIm08f71MvsGlpJ6oQgRx1K/pjoef95qqYGcdlc787/Y1IJKgFBa/o4wojEaQmZJTUh9dqL/rZ29Cjdqy9/yVoFuDabN+djk0QAhAXjnGJXRyW3DveWZ+tr3PiH1/d/E6IRZRaWd0D+s5UE6Ycb27t7DGlWIUI7lJSieNeDUws+blm11rcO6rL1OzBtaKXQB7lXQLkWBi9izvljjNUViDEc7wxWvvBmsVNAS0haKwmoSiG370JMJiZcBhQeg/ejUKZVbuOFgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BrHPqV5fcL32FYcfzRLgfjorM6eh7YfLrn6q4GN93jo=;
 b=RaajP2PxFSLjklWxWspurnzEFGLHxZurKsGMnsIdBZENoz5V8UiO1M+beeHe/C1myYXaPPFIVhr5HGB/WtOXaGfV/0zYpkExUh0F5pJGrB4ICzeXjg3p6qYkGijjW5WhrfcxQbOnmBfg0FtGQzTztPYYwX6xSS2TT7zRk+1wFtJeM4I9Df/r0HBhwyULPvForYX+D7i/O+ZV6LJ09QjEjBtHbPeqjmZC5/K1v+wMYrSNC8tdVJ2qX8ah7RweZSTYsvUt8NvO0KPpDBT3XoHaDp49xveI8qJSsV6r7wl6uw2LJQ3DqtGkdK/jnfcXtA/dUKq1B0iKVktE4YLGenlkKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BrHPqV5fcL32FYcfzRLgfjorM6eh7YfLrn6q4GN93jo=;
 b=pkmCJec7ddiSdpMUAR8kbj34lubVMTaLGgajsV7KiAIh+cI6dHDXa1cHmPmU0hXCl6uppv/jeWGzZoPL4MS4Ig2RvWDdb19As1dJOP/OvrB3H43Qu/xAzLGwLdo0UlhOr6oEaDyAkQORi+wWcW0XhOCk20FO53AnRg2bR06kpDY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYWPR01MB8464.jpnprd01.prod.outlook.com (2603:1096:400:173::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.38; Tue, 31 Jan
 2023 02:01:19 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::4b75:8d8e:d89a:7860]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::4b75:8d8e:d89a:7860%8]) with mapi id 15.20.6043.036; Tue, 31 Jan 2023
 02:01:19 +0000
Message-ID: <87leljea35.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v3 19/25] ASoC: ti: use helper function
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
In-Reply-To: <87cz6vfosc.wl-kuninori.morimoto.gx@renesas.com>
References: <87cz6vfosc.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 31 Jan 2023 02:01:18 +0000
X-ClientProxiedBy: TYAPR01CA0226.jpnprd01.prod.outlook.com
 (2603:1096:404:11e::22) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYWPR01MB8464:EE_
X-MS-Office365-Filtering-Correlation-Id: f8ce84d7-d081-4406-b122-08db032f0b3d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NXpDtZkTIg+CJ1DT0/KCrjICKdiBlbVEh7oyl3H/36M7ifMF+JLRrD+I0Ds2f8IGII32a68i9tOXft2Ib2t8V+B/VHdN0c21nY33QXgW7+BzlU8AD+HTCqWmP/Lqavx6hZbmHfTnB0c+4Hn10cQc6PMFsf1sZkRfaBrA84rAR7HJxtwUOHwfeeKYfa8tscl6okywnQ2O0hLjjB5dVAE1+FosOMU7SeNKjQiZQ5cCjgAwSr/JBZpo8a1KObvKadOTcXrGRTSUeiSe+PY07kM671ymXzd1pnWaJA0F/4WNpLv70dtMgN5AmbVTfqn4QUqrn30vy4JPjYUduRGTYo3nhruRa+plCRMLrhcfUW5aBA+AmYWPkSX6IvUj37wZ4k5/6JXfBMYV50yi8aldDREyYlW0jANoKOnGmmrqo21i75EqgFTWJrpwlbMBhvj1X7rzLXb6Q5yvCAMq0+XyA2wMHv+s6yoKazogGPcWjRtO171kHAot0vGRhNKUMq/GBUNgmXGBGi3MYSe70vq2tAnc7xM2qs503P1EsAZiw6PjKTHV0qSpRHt7hNR2UA+/k85JuAVv4DUW0wATU3zxC+VMh+4AbXXACPkyyR8NP9A5aBLMGGmWQ1KLxOYJAs3rVmBzgyfnOv+mpGmlt4HFKT91ndgvYuhQKHqkBVuriDT4orxAoGfg/c4FuGxgBPr3l5vUecN/v7pma4r9hYmsz1fJRw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB8426.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(376002)(136003)(39860400002)(346002)(396003)(366004)(451199018)(36756003)(2906002)(83380400001)(316002)(2616005)(8676002)(478600001)(52116002)(6486002)(6506007)(6512007)(26005)(186003)(6916009)(86362001)(66556008)(66476007)(5660300002)(8936002)(41300700001)(4326008)(66946007)(38100700002)(38350700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?jVq+EObXLdrQYF+z4m0odQHsX7A+QZuoROH1i54FRGs/W1na9kNGonKe6ucx?=
 =?us-ascii?Q?nxfvEbDOmqNUP3XaNq37ijp8FvtGSe3/U0AbDEKd5L6H3u1RSvG0FeloJzXQ?=
 =?us-ascii?Q?EMUT7+K5jdhcuDj3OTmruv3O7vPqkMcIWdkPCrmFBNxC3EqH7K0aFxePzzEC?=
 =?us-ascii?Q?+4ontUDTgM/3Zg9VRnYt9J4/XokXcnLD3VfYctknho0YUn2YVA7/TUOTKBkw?=
 =?us-ascii?Q?Pt1CU6FvvA4Av2EYl+4Nqc5ux1YWLUihaPv0QL/6h05swq0hmyKb0VLTuWfR?=
 =?us-ascii?Q?vhwpvsAN0DBB1RZZhwyPH8YLfFqQiKs+oUenMgV/DKYlhZepYtWzJzwX4pS2?=
 =?us-ascii?Q?HAIKK89+1RHz6EWlhdEWpLn18jQLbZDdJcaFDMMdAuSEr0W1Rvoz2n8f2ePz?=
 =?us-ascii?Q?0335k0XDqjeCP9Rf64as7cFnCtlQZh6zsREB/2wYMnO7OwCP2jW7PEkHl1zi?=
 =?us-ascii?Q?4MhWzysUDOqgrhDEQnZa9dZiUYccv3nggbbEkhpjOs9M4KI8lcL/qzaeDbtH?=
 =?us-ascii?Q?ILLThQqUaieSKMa7kfatY5xRxLBg8LakUEdE/f66QvqXWyzylEIq7mlbZKTb?=
 =?us-ascii?Q?j3+2hZZKW6sWnWbRJ0q4uvDd9GZn+gjxNKAwg6LItXCPBQ6vvKAMFuAbyvV/?=
 =?us-ascii?Q?adv0pdVoYpv/bGn58ChnPJ5EluPM6+N5t7andA82Iq7UPDQB3VyN/pS1mn9c?=
 =?us-ascii?Q?iP712BnpVv/BP8U4TS0Omt6WKZB9gE/8XEniuzVcjDQxpV+QadP4SuBfizXL?=
 =?us-ascii?Q?T16+d6BMKix56TfXT/3/xMH+Sn/LhNmzbkgO6avbtp/x2AM/dKA20zotbwN+?=
 =?us-ascii?Q?lrd0HHdpQxyzQKvCerR1sSnkuAXLaCfHToePvAgvf561q18OAXgjKfKMQiqT?=
 =?us-ascii?Q?GEMtId6jmuejTRib36QFtqteRAl0vfCacBK8oXXh+yyfo9nUzSxYchgn61CD?=
 =?us-ascii?Q?M1h4/GxCjitJG2rFM6WaVwcQV/F/ggf6gpPwBV2aU/Wao2vSWcrCgh5I5BeB?=
 =?us-ascii?Q?Uq7xxx1L3oN5bHgRk4p+RLLwz3SSaJZVV2wiXbPXqRoabkQQ6vrDiL5hq993?=
 =?us-ascii?Q?hnbKor9l+OjOkf1EdSw6bIafpQCEkNzaiMdNi3zV3K/Z5Q1UtsAcO4gHai9M?=
 =?us-ascii?Q?RiWQgE1aVQe83EaKud+B2/cM77Mh1Ob1K1wrefNLTwobRrVQz5/Bqk7j9Hyv?=
 =?us-ascii?Q?5IculZ33Ea2z6sNkDx8ny5SwsZUvTA3nSf3zndEBFZ183Tsmw4K3OU4qp2J1?=
 =?us-ascii?Q?1KWb56yNtlYYZiLa+TDwZbt8IwOZwhMYkzHOtcTNcZDqKasCaqyAkZHGJE79?=
 =?us-ascii?Q?gW0LowI/cAQ8WEdMBpNLv5WU8CATUT+I0RC79kUwbXfdmxcP1vUe+7Pult5S?=
 =?us-ascii?Q?lHhJjtRkL0or6G1ETFArLzEEQ+zGoUL8ZdAtf77zLxCM71YA9yFaFPOoavYz?=
 =?us-ascii?Q?1eEoYzW3jjtxTpbemqgZkN4PHmt+txuaU6OdBAEUOctgXyVOaIt/gjepyqbM?=
 =?us-ascii?Q?P7XoVLSeMcKEDIbbIhhSaD1fB6UADL3oQQtphfL2H6W4n1eq5MVKOKKCIJVq?=
 =?us-ascii?Q?7HXVYk6klG7vcRSa0Ytuc8Du+wajg0oK1J8Cl5X5E61Xd4+Mg1ln2WUudO1q?=
 =?us-ascii?Q?ZuXKxWf18o5VATMq05A1I0g=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f8ce84d7-d081-4406-b122-08db032f0b3d
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2023 02:01:19.0933 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3ov9gvirBuagVfIygB50alhabXmQE1xXyxtEMH/j8Yb+WI9ImVlYXsVzlGMf/38smA8byQWmf9vt/7imp/5eQUlir9PHfUMiCBzM0viSMhPqvBKia8kRJfd43EKdx3IJ
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
---
 sound/soc/ti/davinci-i2s.c   | 5 +++--
 sound/soc/ti/davinci-mcasp.c | 5 +++--
 sound/soc/ti/davinci-vcif.c  | 5 +++--
 3 files changed, 9 insertions(+), 6 deletions(-)

diff --git a/sound/soc/ti/davinci-i2s.c b/sound/soc/ti/davinci-i2s.c
index e6e77a5f3c1e..3ccd0cfca008 100644
--- a/sound/soc/ti/davinci-i2s.c
+++ b/sound/soc/ti/davinci-i2s.c
@@ -614,9 +614,10 @@ static const struct snd_soc_dai_ops davinci_i2s_dai_ops = {
 static int davinci_i2s_dai_probe(struct snd_soc_dai *dai)
 {
 	struct davinci_mcbsp_dev *dev = snd_soc_dai_get_drvdata(dai);
+	int stream;
 
-	dai->playback_dma_data = &dev->dma_data[SNDRV_PCM_STREAM_PLAYBACK];
-	dai->capture_dma_data = &dev->dma_data[SNDRV_PCM_STREAM_CAPTURE];
+	for_each_pcm_streams(stream)
+		snd_soc_dai_dma_data_set(dai, stream, &dev->dma_data[stream]);
 
 	return 0;
 }
diff --git a/sound/soc/ti/davinci-mcasp.c b/sound/soc/ti/davinci-mcasp.c
index f5ac2ab77f5b..578254549d2d 100644
--- a/sound/soc/ti/davinci-mcasp.c
+++ b/sound/soc/ti/davinci-mcasp.c
@@ -1699,9 +1699,10 @@ static void davinci_mcasp_init_iec958_status(struct davinci_mcasp *mcasp)
 static int davinci_mcasp_dai_probe(struct snd_soc_dai *dai)
 {
 	struct davinci_mcasp *mcasp = snd_soc_dai_get_drvdata(dai);
+	int stream;
 
-	dai->playback_dma_data = &mcasp->dma_data[SNDRV_PCM_STREAM_PLAYBACK];
-	dai->capture_dma_data = &mcasp->dma_data[SNDRV_PCM_STREAM_CAPTURE];
+	for_each_pcm_streams(stream)
+		snd_soc_dai_dma_data_set(dai, stream, &mcasp->dma_data[stream]);
 
 	if (mcasp->op_mode == DAVINCI_MCASP_DIT_MODE) {
 		davinci_mcasp_init_iec958_status(mcasp);
diff --git a/sound/soc/ti/davinci-vcif.c b/sound/soc/ti/davinci-vcif.c
index 36fa97e2b9e2..fc16b3b8f71a 100644
--- a/sound/soc/ti/davinci-vcif.c
+++ b/sound/soc/ti/davinci-vcif.c
@@ -161,9 +161,10 @@ static const struct snd_soc_dai_ops davinci_vcif_dai_ops = {
 static int davinci_vcif_dai_probe(struct snd_soc_dai *dai)
 {
 	struct davinci_vcif_dev *dev = snd_soc_dai_get_drvdata(dai);
+	int stream;
 
-	dai->playback_dma_data = &dev->dma_data[SNDRV_PCM_STREAM_PLAYBACK];
-	dai->capture_dma_data = &dev->dma_data[SNDRV_PCM_STREAM_CAPTURE];
+	for_each_pcm_streams(stream)
+		snd_soc_dai_dma_data_set(dai, stream, &dev->dma_data[stream]);
 
 	return 0;
 }
-- 
2.25.1

