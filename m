Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 445CF674DBD
	for <lists+alsa-devel@lfdr.de>; Fri, 20 Jan 2023 08:06:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A87212DED;
	Fri, 20 Jan 2023 08:05:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A87212DED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674198381;
	bh=Bg2LPm52+XPGpxmgJh3ByPosVHOefwffyTmRc6M6ISw=;
	h=From:Subject:To:In-Reply-To:References:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=RkFWCCdZjaK41+h2qm/DkKxCw23chhIHbPaYxpLWfMiYLiAeUzbQ/gepalLJqeJBI
	 x2wXUPdNpSHL61iDhboZxRoPoDWg2biBPY1AFqbM/ZGM42xlpSMhpmnA/qAPIccn31
	 MIsc2MdRCQRyjaObpQt7hx5UjAdU41NqIz52no0c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7015CF8053D;
	Fri, 20 Jan 2023 08:03:06 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4765AF805B4; Fri, 20 Jan 2023 08:03:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,
 SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on2112.outbound.protection.outlook.com [40.107.114.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 923DDF8053D
 for <alsa-devel@alsa-project.org>; Fri, 20 Jan 2023 08:03:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 923DDF8053D
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=G0PPIsnf
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ePq6VlqzfwmyfMrAtYo8rPpk0BhGb6IpD+OBDRF2c6y8tYBnSQASprszzVHKkT8zQ7fHk/H2BIzNX8JMR49Vz6kffX6WlSO7o0r27d8YtDA4rwcHtUJhiishdXHsrd5qt/73JU9Q+LNrkVTYLclhow/eQsThR34UZ2rafLRi22xYnJm5K+3UdrMwSUd+TN/REp84kEXlKRoWZr82BjEMssicynfmT+VM2lMRBR8IuvVkU6qThR+lHZOp91NvVZxil6PxaugRkFKl7VPoGLpZYAAlSXF8zWzIFx9uXj+Ej3DZXgrrKYqfSo2TB6wsoxdcq5jCt9EQK9YRjPlQzBEZsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MQx4HoPoGL52/Kny/7aFTOIX0PAowcD2ccoCXKWB1IQ=;
 b=W/2bu5n8VqKlB7oIo8IqU0eUlokGJu7w170t4jLv80bIp2GxKa5BOrSUU0noHuvgLVqEy3laEzaw4F78yP+LuWyDMclYpt+vovf5SYGaERp4YTUREAHifDsWlJRTXiva8DDoAyBd2oysDrrEAIXz16gf0BKKFDQRrbblWSBgRujgRU3GnJMYd8qLgjfQa5uSWCrJpvMEfqtsPNEnW1S4IZVmE+fzUpIPZzDDINVW2lD2fn21cAmibG48871xQetOcQuPSrD/Xmnepe9HYZ9PEXmFDL+Ij/3uOJ8HZ/3NijKFlbttIqXswLFP30YVFzuO5vi/UiQpZB1RVH8nz4hgIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MQx4HoPoGL52/Kny/7aFTOIX0PAowcD2ccoCXKWB1IQ=;
 b=G0PPIsnfh0vUKrvalWx7zrl7Z4V0d+EbR1hD6kElVBS1NqJ29SM3Z95AYCDyUsOE2MibQxUBgykm+QUc2BUmfuFEFxjHKrfMLuoDUjapsITY0KLOWqYUTCx3+/rX4fntDPhScbugGXJUzOHV0hmtSvlBOypgxqT3RRsTSjBTYTY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYCPR01MB9337.jpnprd01.prod.outlook.com (2603:1096:400:195::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.26; Fri, 20 Jan
 2023 07:02:59 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3cd7:a7b5:ea86:9ae]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3cd7:a7b5:ea86:9ae%4]) with mapi id 15.20.6002.012; Fri, 20 Jan 2023
 07:02:59 +0000
Message-ID: <87r0vpk7rx.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 13/25] ASoC: intel: use helper function
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
In-Reply-To: <87a62dlmmn.wl-kuninori.morimoto.gx@renesas.com>
References: <87a62dlmmn.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Fri, 20 Jan 2023 07:02:59 +0000
X-ClientProxiedBy: TYCP286CA0134.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b6::16) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYCPR01MB9337:EE_
X-MS-Office365-Filtering-Correlation-Id: af971900-8447-4450-e52c-08dafab45d51
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dliPZlnsvpBqWvyTguPpI2Bi+Aw/hHX+3yg0ys1yGjwv+gC1mTDgcurM1yKyTqNurA/sg74uXtAxmLwAH/xh6VmdeHVxZ33LaQAvHJD5VHLJucUAX+EJv38YHeciTVEaDLddi8aNI6QvmMvWDg93uPXg4870Xx/DHFCkqozAO6kiFnO2ZErgrj8uLJj9qC0vZ1T/ewj3SpCb71dojRt5VbfXvp9ybEYDq8zUe1vZikPnISLy1cNBWtJ8OFhhDbPk8/YjSTxA3M4NMnHYn14AtG/wndxmINYpm/iSGcY8oNo2PXRVZTIvxdnLLK0AUfaVWZ6vN/a4dAD9xT1lmTJD6P26RmDi/EA3dTKT8ZB1X0BlEXBjHEUukt9T+71E0ExWA0mcR/B8KYW4UrZsu9RfBnzkr0sBC4F7zPDxmXbtd1K+3j3xX9bwS815sxAGwEtqLJuzVgWvu/HdKv6TWaCpP1+CHJYmIBNAgOzHyFMVDlcaGZw1zcLJmmwxX7HGWh4ZCy6lzvu/yqC/39mQPwB+7iPwToGqf1k9buq+vJcGDzRchKmo6tLYonX9LrAkaWXTsPbqgT0ahEMjPtsxLoK/xJyhXbg3tzW9IOQ4Z/0YQfPYvW+oEcGE+eQMVs9GfDakQE4CKnelO6qMlk3H95zveTpqYd1BgfVxcUB0LV5v4uUtYd4cPkWZ07CzYxxCImi3HD1YgtSOFJKs3eLU1kjE3Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB8426.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(366004)(39860400002)(396003)(376002)(136003)(346002)(451199015)(2906002)(83380400001)(41300700001)(6916009)(66476007)(8676002)(66556008)(66946007)(36756003)(4326008)(7416002)(2616005)(8936002)(54906003)(5660300002)(316002)(6512007)(186003)(26005)(478600001)(38100700002)(38350700002)(52116002)(6506007)(6486002)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?99nktBZ0RyTbk9JdMdzXAjCrAOjCwBeupKCGDYcPsJqpJwZEFui6TaGz5F7I?=
 =?us-ascii?Q?Ow2IjBRGhT7CUIQpfOU6kbqTZ1WldkFciHA3NFVJ8J86HYgvxLutL/TJKnaG?=
 =?us-ascii?Q?fy/JT4VGuQPz+08/V6FI+FnxO10+Qd6c0Fsjz0SsDw+Qud28TO/LCyFfLKl7?=
 =?us-ascii?Q?G7NpJe+9S6RQ5qXeUSBE6yNafVkK/DHe0Eifrxx2mvvYD+V7Yuzd51wpSJsd?=
 =?us-ascii?Q?9xuPvgcQZ5g/JwrciOdMv9PsWQzLFWebJTcM4jl16EyqhlL0NJXQgovfGVIP?=
 =?us-ascii?Q?TNsjocSpIwiTve2OBq6/fpcUywgltOIVL760Tvgls45ACXsMxhvVX3jk69db?=
 =?us-ascii?Q?P7zvDNBqK4kivgzxFagmlBW0Sz+3LQQEUk9KqqcbR+CJE/v9DYvV1qYKN/C7?=
 =?us-ascii?Q?aOPAajlJtegXdXb/icNJA73wuTSXVxqbYKnaMplvWRnn5jNB0IyIc7JEvclB?=
 =?us-ascii?Q?ynl0t0ka725ew60IJ6/x7Pxb2tBRQXZYwXPU4MiY6cDwL8iX9tqoEHDsJQYr?=
 =?us-ascii?Q?Llac6+AFCDRJEvQ17418GDwjZ1tw37yF99z4a8jcxlWur09GPyAk7TmCjWMx?=
 =?us-ascii?Q?VYbPAi78QtnxMTYkGK/5MtPT2qJmidNnN4/s9A/Ws2BuMByRFTb72/c/+CUI?=
 =?us-ascii?Q?BeH/vP9i7yLbKDBHOlEwbL5CtGeeHNdTk2oFXJIfcFlFr0H2KKWrF9+YYJ/m?=
 =?us-ascii?Q?Z5uhLsmqUhWX/zT0l2qLB2d/AP4WopC5fAa2Ho+DPNFVymAmwBpYr+oUPXb2?=
 =?us-ascii?Q?Dse4xwHvaFQnYL6HSVbRNzAHNEXJnlir4QHOM5Mp3REcCCpvEKHHA4/ztyrt?=
 =?us-ascii?Q?WUSXpnksoWbSuy+0PhfGKWMUEQclC5advNsR6vI7VDz44TMJVtXV1ZeZzroQ?=
 =?us-ascii?Q?bwywEh2aVdZmFDaKkmt8VSvugiyYJhRRQynRrXQq5CFv/VY/VWAtc7v59Brk?=
 =?us-ascii?Q?EazZ6tqbwxEZpa5GcBS/5tDAP/2lcfyXnV6t8Mo/sb9l5W63v6xelbDw8BFy?=
 =?us-ascii?Q?58MHKaMtH2pKWHZS6TdCN7AVytJogV/waJMOX3PPujRpu1mCeW7eihs7f8I7?=
 =?us-ascii?Q?oeruQv17ovpKDTvgcLxjEeqnTvHQoWU1tzqZUrzhpphLHckRk/vkUEJBZOr3?=
 =?us-ascii?Q?0qPdEngFB0qXph/xkPwlV7kQr5RRsjzwv/DuW96hWVmdzxzK5ui+bu6kBAP/?=
 =?us-ascii?Q?B5hn+FWHRe5gigNyrkUayach4HDLdpYADYOueRdwGcR99xXEchmOY225xqNM?=
 =?us-ascii?Q?fluCKTK6/7GrRftSpn6o8t6wt0+qXKViBDWZqsAtcDC4pwTN5EVxmZVFxbnq?=
 =?us-ascii?Q?IIk3p8WFuapPOOi+fh4YMRnr/ioWCV1xDqOjApIix5b8hXSHP1IvoQZ0kYOP?=
 =?us-ascii?Q?eGgfL0lgt1kingZdcuXFZDGQOTG3weutyZGCZh04AvlIA+At6IIixBfxGagE?=
 =?us-ascii?Q?H605ZKmguwtMdt1d9OSWU1ymeswxrQ+hoTnnVTLZCvCt8Csj0BYiRRjFyT4A?=
 =?us-ascii?Q?36+nBQO4d+YGqmvQNlhjNPkavwwHljGtYmg//gm9INh92Ty+18yumJcn+lXo?=
 =?us-ascii?Q?na3ZzvYaWQHtmp2y1Lu4EK9h2dSRq60XxJO9y8SccXZ0mYua/+FxaL2Dx1YV?=
 =?us-ascii?Q?E+XXciFqBcrTcimZmuN2F5c=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: af971900-8447-4450-e52c-08dafab45d51
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2023 07:02:59.7738 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8P9hGoQHtmWBN9BBjhh0dwrcvp1nmFqaFT6mTk0TVa8VNj4A4TbFTFbcLjPY+jPrTWm7pTskYWBDWqN9yywCJSPuGUCi15AcEhqdAkz3zrMTkAkBwWQMuSz2VTWuBc5g
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB9337
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
Cc: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
 Linux-ALSA <alsa-devel@alsa-project.org>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Heiko Stuebner <heiko@sntech.de>, Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Daniel Baluta <daniel.baluta@nxp.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Colin Ian King <colin.i.king@gmail.com>
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

