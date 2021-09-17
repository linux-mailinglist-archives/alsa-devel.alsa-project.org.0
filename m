Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0018640FA93
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Sep 2021 16:42:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8151C1755;
	Fri, 17 Sep 2021 16:42:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8151C1755
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1631889771;
	bh=fclPWLiJsYbhUabC55az+uFqaJAob0f/y6pXhhwbCfs=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=apd0IBK+gjrbDu7V/dCIHwUd2kAzKJ1NBoxUM+5c0+yo044gXgiN30glTtdzc+8gd
	 X8ypsx4WLJrBdd6wLAhDVm9LgqFgaUQSBAQHcL+fk8ugyuhqBwLwJdYps7+PzN1eLD
	 Nhwf51ABWVCANTy1oKcIrdNmP8d0za/zYT2Ptd/M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C1269F8053E;
	Fri, 17 Sep 2021 16:37:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B4BA8F8051D; Fri, 17 Sep 2021 16:37:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 MSGID_FROM_MTA_HEADER, SPF_HELO_NONE, SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2055.outbound.protection.outlook.com [40.107.21.55])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8DBF1F804E6
 for <alsa-devel@alsa-project.org>; Fri, 17 Sep 2021 16:37:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8DBF1F804E6
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=NXP1.onmicrosoft.com
 header.i=@NXP1.onmicrosoft.com header.b="GxZpmTfd"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XQQwobLke80zb7/rUi95lW+/7BG5yhzdlDkG1Ubzm87TwCTVZFUcybr17W8m1v6ImXYmNSWdHQlGwbqhKvHA+/KVmINlTtN6khWgJch1UMXhfJbq1yiSUx7MAJYdmz2Uk4w/K+jsHc/SV3NzgA71CHTkO6YEpX0ByjJ4eY/ZrM7xT1u8sXNCSQTz8WcT6WyiUrwJOoBHYsK1YM9y2VSdes1xyKn0LfRNGVk+B7QpcNATaGHAH0oyysbNwGHUTYjBB4oQ1BwyOJUZTJSGGr/YiYeswmnPvk3111wxRikqBK6Ygn9I0QprzKKmKbYEWS3XwzWtt8rrKii61s6pA3+Exw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=JIKmnZ7mmvQLoGnx8A+NeJlfPdtjLcOHzyy/Qh+0oSE=;
 b=EdzBmMcNzhEoz9u0RcUBeqOYiUc0DMZgl+RbSgo/LJcreVeKj//Qraj6VtfG69OGk56Cw/p596iToUeIsBLtX+Gv/YxQDZ7q/CWyIhjxUxXRnOwZ4tLB1zRYQCR1d3gPCdnq7jQmLg8XBeruMzAUxhmzwtxNx+IfclR/rrOdNg93k29PsqDj8OV8VuZdX1LeF/jbnALpCjrI7V2ZA9tWoTL9B/MP6p2lUdHwMsBKpVlKEXbazNcDpTIrsO57MYMkMPgQqm4JO1a7LH0JJGd6+LOADMEHPPCq9JYTP7K4TXwJgeFMrVtCoJT23Hs+GmGqHSqVl0azOnV+oi0hs5LIag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JIKmnZ7mmvQLoGnx8A+NeJlfPdtjLcOHzyy/Qh+0oSE=;
 b=GxZpmTfdZJ/UzviqK94NO4J9pdLiaNzklyUDo43pwok6KgPzvEr0DGBtU0O8+7oE10spj2t5sAmpA8rDmWSwB0F+SMvaUuByFxHXb7wGKUb6tZ+fFVwYE5VHTeyEyLBuD55eCli9uSGnesBB+dIZQ+YyWWr+4AYjIpO2ZJEe6oQ=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=oss.nxp.com;
Received: from AM0PR04MB5140.eurprd04.prod.outlook.com (2603:10a6:208:ca::21)
 by AM0PR0402MB3506.eurprd04.prod.outlook.com (2603:10a6:208:17::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14; Fri, 17 Sep
 2021 14:37:31 +0000
Received: from AM0PR04MB5140.eurprd04.prod.outlook.com
 ([fe80::dd84:b996:1c8:705]) by AM0PR04MB5140.eurprd04.prod.outlook.com
 ([fe80::dd84:b996:1c8:705%6]) with mapi id 15.20.4523.016; Fri, 17 Sep 2021
 14:37:31 +0000
From: Daniel Baluta <daniel.baluta@oss.nxp.com>
To: broonie@kernel.org
Subject: [PATCH v2 11/12] ASoC: SOF: Add support for dynamic pipelines
Date: Fri, 17 Sep 2021 17:36:58 +0300
Message-Id: <20210917143659.401102-12-daniel.baluta@oss.nxp.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210917143659.401102-1-daniel.baluta@oss.nxp.com>
References: <20210917143659.401102-1-daniel.baluta@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VI1P193CA0022.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:800:bd::32) To AM0PR04MB5140.eurprd04.prod.outlook.com
 (2603:10a6:208:ca::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (2a02:2f08:5708:8600:8372:c747:541d:bbc9)
 by VI1P193CA0022.EURP193.PROD.OUTLOOK.COM (2603:10a6:800:bd::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14 via Frontend
 Transport; Fri, 17 Sep 2021 14:37:30 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bec98576-4745-4c4e-cbb7-08d979e8ae59
X-MS-TrafficTypeDiagnostic: AM0PR0402MB3506:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM0PR0402MB350679E9B78AC3AEB9AADC57B8DD9@AM0PR0402MB3506.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1824;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xgDgXHkXpWFi+pDg/VjPKS2737+eNRxNl3/COvdvSB2E//0FCU0UZ/UutqOrh1MaN5zM/WyFu0RlUOHaunXdNwgu1tlf74tmhtfrXufOjQ1Kz9WxaEgEWwpGb2PKPhE6TfhEzkLyqJxcxMFXMkfwRKRfOq0isyzhUaMo6WYrnyrIWXpDMmQrSU1Y2x0Ck0mQoj6lb7RF/+lPTEebjot94agkPwQcCc4ji2Ev6SL5bzxOFL96BARC24h1yX4RIrP49nr5MpAsUKtSaXqRD73WG+99zO5OJeN30OuQmjk5Z32oMPyQUfr12ejKd350KeRuPd70643Shh0z5iy7WeZlOCIfnFTUJuGzaLT7ymXCyvbgJ89+ctV+LA77IvdvTGNwG/8JgGJWv/vnS4OCXX2TE3YvCGy1rl6YE5p3wVG4L7IH6wH65Y/bkrWZfsiUehREq5P+JGPFzZ/s0xyy2G473t3l+VNEhSRod+53UHuu1Igx20S7V4lPDrtTq0hXRCLax7EGBLDQBMWK7AZiG2Db9fxtMcOX5RS7JS+OYfghyseZV9Yxrj2wYzAoNHo0tA8Nrb2wh/0YDRUJYJuOBU+Cm0ZZCqjNGWuSjaKfkAYYf78gC/W7XS4qlN93vh29sfx6rUqOriFNIyaK2zrwB+Eg+g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM0PR04MB5140.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(396003)(39860400002)(136003)(366004)(376002)(186003)(316002)(1076003)(66476007)(2906002)(30864003)(6486002)(5660300002)(38100700002)(2616005)(86362001)(83380400001)(44832011)(478600001)(4326008)(52116002)(6506007)(6666004)(8936002)(6512007)(66946007)(6916009)(8676002)(66556008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?s12+q606+6GOKcPJ1WomZ2tSRuuBcJRDGFgyacDjOYVoi8l/WbuP/M0sxz/D?=
 =?us-ascii?Q?Pbcx+QvFXPFC2lCuhRGk9SdJjOxJUHSpgyIY1A3bxHmbo3eKsJeHezPI4XjL?=
 =?us-ascii?Q?2g96t88TbmmnG04IzhQIqu+RxIlH2HBAeLEWE8dJru2fX4iT+SPtVRJSn0Ft?=
 =?us-ascii?Q?qRKDQoEvbB1kOPLzrz8AoNVN1PsBpS7d3dZemLaWBJ404BmwHgx3TWXJmxlx?=
 =?us-ascii?Q?V1pktC2WQ7N94QgAeep09rq1aS/U3XIQG4HxwqvSfwBUPrSS+i4FUmq2xUH1?=
 =?us-ascii?Q?rH8mXMsfZaewLxgzPSLmN4LlAzKBBuIJlgvOGYPl3defiFoNQ11ONU1kpI1z?=
 =?us-ascii?Q?Qi+RB4uakDH13Nm7Ky0HwlgadKjEBNr4mOp31PTeQD3G2I10IQloKTK3MQ20?=
 =?us-ascii?Q?91iLITv9BlJczPo4EzHRseh2tCUSGQiYicLUuecejZhe6aXzr4qEDWlgcimu?=
 =?us-ascii?Q?1+5e8o/WOoEefBqpdOsh4/Momb07f5e+HKJLYrgtKiB45TkQVz9nhavTAdTg?=
 =?us-ascii?Q?PRT1Lp71t3DGhmkQC9FdnkEgJDJ38QKKOY3kuR7uJ6CDcfq2DouD+hxQLy9A?=
 =?us-ascii?Q?whHu7f68SdGYqpRBNiwXwtww/NMo5hORfyt5EB+pP2am2J5rXwyVYOSqMfiT?=
 =?us-ascii?Q?uDlnwtJ22EKqpM7S3aJaUpXrQy+ruqeyyj9ZvUZ0/+R2WteiMSQ0xzWXtKlK?=
 =?us-ascii?Q?rK5/93SUrHaBl0qjjDwYVMVU2QFHRw2DyqJH9GtOKz3+slD6Ik56dBbUD3D2?=
 =?us-ascii?Q?drL88W1EXQe8BG/vfxiTEiuQcIlnDX9AJxXj5c7+Q7RD2nGord2Zr9hq9ey8?=
 =?us-ascii?Q?WqvRxLRkCAt0u2BO+w6z6rBfAx2kJEwXeKNaI2bwSQ2jmGJQw3FEjhRa+isM?=
 =?us-ascii?Q?/44TA9nwIuJ+PuW5knbL8DROnapZrGzLLdu4NhXe9XVAGf/J1NnfiPB3i+/i?=
 =?us-ascii?Q?iklup27l+9dLrczkKSBMXvnmtUKK58ZE6GLjvXdiGO/usEa81Up2Y54zPaKl?=
 =?us-ascii?Q?wReyw0xNxbT6qx19bfrS6r30caMVsTJY4fVamBir4pFO3RoTNGybRDjFLVZh?=
 =?us-ascii?Q?mUksoBjgMwY4OkQIFfe8tQktSD1dtxbeMYZc/yNKwVwDAjQuGCdZxXH45u1Z?=
 =?us-ascii?Q?iMLbZrm9m0I5Ei0elhmyqvGibFsOuIoXDAwMaw7vFchBMQK1u6ozfh6S+0dU?=
 =?us-ascii?Q?EJzYCiDJhtWtsp7stqD4GnK04BW7lsZG1YcyKlz3PGtiEcnCV7CSDjdA58BQ?=
 =?us-ascii?Q?jW4jxJFMJw88rXw/vBFr6ckG+cwz1Rkn2F1WkncK1GKyOYoGL3a4oLz9WjlA?=
 =?us-ascii?Q?BBSUPGlsM39j+vM34T2LgeuyXcSr70V0Sa+E/x3GJoceJCaFZDh661S+oOPu?=
 =?us-ascii?Q?vbLRD+SChZMNWUtBsKt1AdqVMopFKY2DaAnKjBoM/BBhODqT4A=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bec98576-4745-4c4e-cbb7-08d979e8ae59
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB5140.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2021 14:37:31.6918 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Mob9OVW30ZPFps8eSz4tL/ppVxbz43DXij5fvmlT+RUNlFAAUoa2OrXQwa7Ml956ethKwaJHW7rFUEI2c2l8sw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR0402MB3506
Cc: pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org,
 kai.vehmanen@linux.intel.com, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, ranjani.sridharan@linux.intel.com,
 Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 daniel.baluta@nxp.com
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

From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>

Add support for dynamic pipelines by modifying the PCM
hw_params ioctl implementation to determine the widgets
required for a PCM stream by querying the list of
connected DAPM widgets. This list is saved as part of
snd_sof_pcm_stream struct and will be used to setup the widgets.

The sof_widget_list_setup/free routines setup and free connected
DAPM widgets when a PCM is opened/closed. These routines accept
a list of connected DAPM widgets as input and determine the SOF
widgets, their corresponding pipeline widgets and connections
between them that need to be setup before the PCM is triggered.

Please note that the dynamic pipeline feature will only be enabled
for those pipelines whose dynamic_pipeline_widget flag is set in
topologies. Add a new token called SOF_TKN_SCHED_DYNAMIC_PIPELINE
that when set in topology will be applied to the
dynamic_pipeline_widget flag of the pipeline widget.

Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
---
 sound/soc/sof/intel/hda.c |  22 +--
 sound/soc/sof/pcm.c       |  58 +++++-
 sound/soc/sof/sof-audio.c | 358 +++++++++++++++++++++++++++++++++-----
 sound/soc/sof/sof-audio.h |   6 +
 4 files changed, 390 insertions(+), 54 deletions(-)

diff --git a/sound/soc/sof/intel/hda.c b/sound/soc/sof/intel/hda.c
index 93305d389ff6..c0bdc5c36043 100644
--- a/sound/soc/sof/intel/hda.c
+++ b/sound/soc/sof/intel/hda.c
@@ -41,17 +41,6 @@
 #define EXCEPT_MAX_HDR_SIZE	0x400
 #define HDA_EXT_ROM_STATUS_SIZE 8
 
-static const struct sof_intel_dsp_desc
-	*get_chip_info(struct snd_sof_pdata *pdata)
-{
-	const struct sof_dev_desc *desc = pdata->desc;
-	const struct sof_intel_dsp_desc *chip_info;
-
-	chip_info = desc->chip_info;
-
-	return chip_info;
-}
-
 int hda_ctrl_dai_widget_setup(struct snd_soc_dapm_widget *w)
 {
 	struct snd_sof_widget *swidget = w->dobj.private;
@@ -132,6 +121,17 @@ int hda_ctrl_dai_widget_free(struct snd_soc_dapm_widget *w)
 	return sof_widget_free(sdev, swidget);
 }
 
+static const struct sof_intel_dsp_desc
+	*get_chip_info(struct snd_sof_pdata *pdata)
+{
+	const struct sof_dev_desc *desc = pdata->desc;
+	const struct sof_intel_dsp_desc *chip_info;
+
+	chip_info = desc->chip_info;
+
+	return chip_info;
+}
+
 #if IS_ENABLED(CONFIG_SND_SOC_SOF_INTEL_SOUNDWIRE)
 
 /*
diff --git a/sound/soc/sof/pcm.c b/sound/soc/sof/pcm.c
index b4280459e5db..374df2dfa816 100644
--- a/sound/soc/sof/pcm.c
+++ b/sound/soc/sof/pcm.c
@@ -116,6 +116,40 @@ static int sof_pcm_dsp_pcm_free(struct snd_pcm_substream *substream,
 	return ret;
 }
 
+static int sof_pcm_setup_connected_widgets(struct snd_sof_dev *sdev,
+					   struct snd_soc_pcm_runtime *rtd,
+					   struct snd_sof_pcm *spcm, int dir)
+{
+	struct snd_soc_dai *dai;
+	int ret, j;
+
+	/* query DAPM for list of connected widgets and set them up */
+	for_each_rtd_cpu_dais(rtd, j, dai) {
+		struct snd_soc_dapm_widget_list *list;
+
+		ret = snd_soc_dapm_dai_get_connected_widgets(dai, dir, &list,
+							     dpcm_end_walk_at_be);
+		if (ret < 0) {
+			dev_err(sdev->dev, "error: dai %s has no valid %s path\n", dai->name,
+				dir == SNDRV_PCM_STREAM_PLAYBACK ? "playback" : "capture");
+			return ret;
+		}
+
+		spcm->stream[dir].list = list;
+
+		ret = sof_widget_list_setup(sdev, spcm, dir);
+		if (ret < 0) {
+			dev_err(sdev->dev, "error: failed widget list set up for pcm %d dir %d\n",
+				spcm->pcm.pcm_id, dir);
+			spcm->stream[dir].list = NULL;
+			snd_soc_dapm_dai_free_widgets(&list);
+			return ret;
+		}
+	}
+
+	return 0;
+}
+
 static int sof_pcm_hw_params(struct snd_soc_component *component,
 			     struct snd_pcm_substream *substream,
 			     struct snd_pcm_hw_params *params)
@@ -213,7 +247,14 @@ static int sof_pcm_hw_params(struct snd_soc_component *component,
 
 	dev_dbg(component->dev, "stream_tag %d", pcm.params.stream_tag);
 
-	/* send IPC to the DSP */
+	/* if this is a repeated hw_params without hw_free, skip setting up widgets */
+	if (!spcm->stream[substream->stream].list) {
+		ret = sof_pcm_setup_connected_widgets(sdev, rtd, spcm, substream->stream);
+		if (ret < 0)
+			return ret;
+	}
+
+	/* send hw_params IPC to the DSP */
 	ret = sof_ipc_tx_message(sdev->ipc, pcm.hdr.cmd, &pcm, sizeof(pcm),
 				 &ipc_params_reply, sizeof(ipc_params_reply));
 	if (ret < 0) {
@@ -259,6 +300,10 @@ static int sof_pcm_hw_free(struct snd_soc_component *component,
 			err = ret;
 	}
 
+	ret = sof_widget_list_free(sdev, spcm, substream->stream);
+	if (ret < 0)
+		err = ret;
+
 	cancel_work_sync(&spcm->stream[substream->stream].period_elapsed_work);
 
 	ret = snd_sof_pcm_platform_hw_free(sdev, substream);
@@ -316,6 +361,7 @@ static int sof_pcm_trigger(struct snd_soc_component *component,
 	struct sof_ipc_stream stream;
 	struct sof_ipc_reply reply;
 	bool reset_hw_params = false;
+	bool free_widget_list = false;
 	bool ipc_first = false;
 	int ret;
 
@@ -386,6 +432,7 @@ static int sof_pcm_trigger(struct snd_soc_component *component,
 			spcm->stream[substream->stream].suspend_ignored = true;
 			return 0;
 		}
+		free_widget_list = true;
 		fallthrough;
 	case SNDRV_PCM_TRIGGER_STOP:
 		stream.hdr.cmd |= SOF_IPC_STREAM_TRIG_STOP;
@@ -414,8 +461,15 @@ static int sof_pcm_trigger(struct snd_soc_component *component,
 		snd_sof_pcm_platform_trigger(sdev, substream, cmd);
 
 	/* free PCM if reset_hw_params is set and the STOP IPC is successful */
-	if (!ret && reset_hw_params)
+	if (!ret && reset_hw_params) {
 		ret = sof_pcm_dsp_pcm_free(substream, sdev, spcm);
+		if (ret < 0)
+			return ret;
+
+		/* free widget list only for SUSPEND trigger */
+		if (free_widget_list)
+			ret = sof_widget_list_free(sdev, spcm, substream->stream);
+	}
 
 	return ret;
 }
diff --git a/sound/soc/sof/sof-audio.c b/sound/soc/sof/sof-audio.c
index bf5e7c7019a5..7b4dd64576fa 100644
--- a/sound/soc/sof/sof-audio.c
+++ b/sound/soc/sof/sof-audio.c
@@ -83,6 +83,15 @@ static int sof_widget_kcontrol_setup(struct snd_sof_dev *sdev, struct snd_sof_wi
 	return 0;
 }
 
+static void sof_reset_route_setup_status(struct snd_sof_dev *sdev, struct snd_sof_widget *widget)
+{
+	struct snd_sof_route *sroute;
+
+	list_for_each_entry(sroute, &sdev->route_list, list)
+		if (sroute->src_widget == widget || sroute->sink_widget == widget)
+			sroute->setup = false;
+}
+
 int sof_widget_free(struct snd_sof_dev *sdev, struct snd_sof_widget *swidget)
 {
 	struct sof_ipc_free ipc_free = {
@@ -122,6 +131,8 @@ int sof_widget_free(struct snd_sof_dev *sdev, struct snd_sof_widget *swidget)
 		return ret;
 	}
 
+	/* reset route setup status for all routes that contain this widget */
+	sof_reset_route_setup_status(sdev, swidget);
 	swidget->complete = 0;
 	dev_dbg(sdev->dev, "widget %s freed\n", swidget->widget->name);
 
@@ -172,6 +183,19 @@ int sof_widget_setup(struct snd_sof_dev *sdev, struct snd_sof_widget *swidget)
 
 		ret = sof_ipc_tx_message(sdev->ipc, comp->hdr.cmd, comp, ipc_size, &r, sizeof(r));
 		kfree(comp);
+		if (ret < 0) {
+			dev_err(sdev->dev, "error: failed to load widget %s\n",
+				swidget->widget->name);
+			goto use_count_dec;
+		}
+
+		ret = sof_dai_config_setup(sdev, dai);
+		if (ret < 0) {
+			dev_err(sdev->dev, "error: failed to load dai config for DAI %s\n",
+				swidget->widget->name);
+			sof_widget_free(sdev, swidget);
+			return ret;
+		}
 		break;
 	case snd_soc_dapm_scheduler:
 		pipeline = swidget->private;
@@ -193,6 +217,7 @@ int sof_widget_setup(struct snd_sof_dev *sdev, struct snd_sof_widget *swidget)
 	if (ret < 0) {
 		dev_err(sdev->dev, "error: failed to restore kcontrols for widget %s\n",
 			swidget->widget->name);
+		sof_widget_free(sdev, swidget);
 		return ret;
 	}
 
@@ -206,6 +231,266 @@ int sof_widget_setup(struct snd_sof_dev *sdev, struct snd_sof_widget *swidget)
 }
 EXPORT_SYMBOL(sof_widget_setup);
 
+static int sof_route_setup_ipc(struct snd_sof_dev *sdev, struct snd_sof_route *sroute)
+{
+	struct sof_ipc_pipe_comp_connect *connect;
+	struct sof_ipc_reply reply;
+	int ret;
+
+	/* skip if there's no private data */
+	if (!sroute->private)
+		return 0;
+
+	/* nothing to do if route is already set up */
+	if (sroute->setup)
+		return 0;
+
+	connect = sroute->private;
+
+	dev_dbg(sdev->dev, "setting up route %s -> %s\n",
+		sroute->src_widget->widget->name,
+		sroute->sink_widget->widget->name);
+
+	/* send ipc */
+	ret = sof_ipc_tx_message(sdev->ipc,
+				 connect->hdr.cmd,
+				 connect, sizeof(*connect),
+				 &reply, sizeof(reply));
+	if (ret < 0) {
+		dev_err(sdev->dev, "%s: route setup failed %d\n", __func__, ret);
+		return ret;
+	}
+
+	sroute->setup = true;
+
+	return 0;
+}
+
+static int sof_route_setup(struct snd_sof_dev *sdev, struct snd_soc_dapm_widget *wsource,
+			   struct snd_soc_dapm_widget *wsink)
+{
+	struct snd_sof_widget *src_widget = wsource->dobj.private;
+	struct snd_sof_widget *sink_widget = wsink->dobj.private;
+	struct snd_sof_route *sroute;
+	bool route_found = false;
+
+	/* ignore routes involving virtual widgets in topology */
+	switch (src_widget->id) {
+	case snd_soc_dapm_out_drv:
+	case snd_soc_dapm_output:
+	case snd_soc_dapm_input:
+		return 0;
+	default:
+		break;
+	}
+
+	switch (sink_widget->id) {
+	case snd_soc_dapm_out_drv:
+	case snd_soc_dapm_output:
+	case snd_soc_dapm_input:
+		return 0;
+	default:
+		break;
+	}
+
+	/* find route matching source and sink widgets */
+	list_for_each_entry(sroute, &sdev->route_list, list)
+		if (sroute->src_widget == src_widget && sroute->sink_widget == sink_widget) {
+			route_found = true;
+			break;
+		}
+
+	if (!route_found) {
+		dev_err(sdev->dev, "error: cannot find SOF route for source %s -> %s sink\n",
+			wsource->name, wsink->name);
+		return -EINVAL;
+	}
+
+	return sof_route_setup_ipc(sdev, sroute);
+}
+
+static int sof_setup_pipeline_connections(struct snd_sof_dev *sdev,
+					  struct snd_soc_dapm_widget_list *list, int dir)
+{
+	struct snd_soc_dapm_widget *widget;
+	struct snd_soc_dapm_path *p;
+	int ret;
+	int i;
+
+	/*
+	 * Set up connections between widgets in the sink/source paths based on direction.
+	 * Some non-SOF widgets exist in topology either for compatibility or for the
+	 * purpose of connecting a pipeline from a host to a DAI in order to receive the DAPM
+	 * events. But they are not handled by the firmware. So ignore them.
+	 */
+	if (dir == SNDRV_PCM_STREAM_PLAYBACK) {
+		for_each_dapm_widgets(list, i, widget) {
+			if (!widget->dobj.private)
+				continue;
+
+			snd_soc_dapm_widget_for_each_sink_path(widget, p)
+				if (p->sink->dobj.private) {
+					ret = sof_route_setup(sdev, widget, p->sink);
+					if (ret < 0)
+						return ret;
+				}
+		}
+	} else {
+		for_each_dapm_widgets(list, i, widget) {
+			if (!widget->dobj.private)
+				continue;
+
+			snd_soc_dapm_widget_for_each_source_path(widget, p)
+				if (p->source->dobj.private) {
+					ret = sof_route_setup(sdev, p->source, widget);
+					if (ret < 0)
+						return ret;
+				}
+		}
+	}
+
+	return 0;
+}
+
+int sof_widget_list_setup(struct snd_sof_dev *sdev, struct snd_sof_pcm *spcm, int dir)
+{
+	struct snd_soc_dapm_widget_list *list = spcm->stream[dir].list;
+	struct snd_soc_dapm_widget *widget;
+	int i, ret, num_widgets;
+
+	/* nothing to set up */
+	if (!list)
+		return 0;
+
+	/* set up widgets in the list */
+	for_each_dapm_widgets(list, num_widgets, widget) {
+		struct snd_sof_widget *swidget = widget->dobj.private;
+		struct snd_sof_widget *pipe_widget;
+
+		if (!swidget)
+			continue;
+
+		/*
+		 * The scheduler widget for a pipeline is not part of the connected DAPM
+		 * widget list and it needs to be set up before the widgets in the pipeline
+		 * are set up. The use_count for the scheduler widget is incremented for every
+		 * widget in a given pipeline to ensure that it is freed only after the last
+		 * widget in the pipeline is freed.
+		 */
+		pipe_widget = swidget->pipe_widget;
+		if (!pipe_widget) {
+			dev_err(sdev->dev, "error: no pipeline widget found for %s\n",
+				swidget->widget->name);
+			ret = -EINVAL;
+			goto widget_free;
+		}
+
+		ret = sof_widget_setup(sdev, pipe_widget);
+		if (ret < 0)
+			goto widget_free;
+
+		/* set up the widget */
+		ret = sof_widget_setup(sdev, swidget);
+		if (ret < 0) {
+			sof_widget_free(sdev, pipe_widget);
+			goto widget_free;
+		}
+	}
+
+	/*
+	 * error in setting pipeline connections will result in route status being reset for
+	 * routes that were successfully set up when the widgets are freed.
+	 */
+	ret = sof_setup_pipeline_connections(sdev, list, dir);
+	if (ret < 0)
+		goto widget_free;
+
+	/* complete pipelines */
+	for_each_dapm_widgets(list, i, widget) {
+		struct snd_sof_widget *swidget = widget->dobj.private;
+		struct snd_sof_widget *pipe_widget;
+
+		if (!swidget)
+			continue;
+
+		pipe_widget = swidget->pipe_widget;
+		if (!pipe_widget) {
+			dev_err(sdev->dev, "error: no pipeline widget found for %s\n",
+				swidget->widget->name);
+			ret = -EINVAL;
+			goto widget_free;
+		}
+
+		if (pipe_widget->complete)
+			continue;
+
+		pipe_widget->complete = snd_sof_complete_pipeline(sdev->dev, pipe_widget);
+		if (pipe_widget->complete < 0) {
+			ret = pipe_widget->complete;
+			goto widget_free;
+		}
+	}
+
+	return 0;
+
+widget_free:
+	/* free all widgets that have been set up successfully */
+	for_each_dapm_widgets(list, i, widget) {
+		struct snd_sof_widget *swidget = widget->dobj.private;
+
+		if (!swidget)
+			continue;
+
+		if (!num_widgets--)
+			break;
+
+		sof_widget_free(sdev, swidget);
+		sof_widget_free(sdev, swidget->pipe_widget);
+	}
+
+	return ret;
+}
+
+int sof_widget_list_free(struct snd_sof_dev *sdev, struct snd_sof_pcm *spcm, int dir)
+{
+	struct snd_soc_dapm_widget_list *list = spcm->stream[dir].list;
+	struct snd_soc_dapm_widget *widget;
+	int i, ret;
+	int ret1 = 0;
+
+	/* nothing to free */
+	if (!list)
+		return 0;
+
+	/*
+	 * Free widgets in the list. This can fail but continue freeing other widgets to keep
+	 * use_counts balanced.
+	 */
+	for_each_dapm_widgets(list, i, widget) {
+		struct snd_sof_widget *swidget = widget->dobj.private;
+
+		if (!swidget)
+			continue;
+
+		/*
+		 * free widget and its pipe_widget. Either of these can fail, but free as many as
+		 * possible before freeing the list and returning the error.
+		 */
+		ret = sof_widget_free(sdev, swidget);
+		if (ret < 0)
+			ret1 = ret;
+
+		ret = sof_widget_free(sdev, swidget->pipe_widget);
+		if (ret < 0)
+			ret1 = ret;
+	}
+
+	snd_soc_dapm_dai_free_widgets(&list);
+	spcm->stream[dir].list = NULL;
+
+	return ret1;
+}
+
 /*
  * helper to determine if there are only D0i3 compatible
  * streams active
@@ -309,13 +594,32 @@ int sof_set_up_pipelines(struct device *dev)
 	struct snd_sof_dev *sdev = dev_get_drvdata(dev);
 	struct snd_sof_widget *swidget;
 	struct snd_sof_route *sroute;
-	struct snd_sof_dai *dai;
 	int ret;
 
 	/* restore pipeline components */
 	list_for_each_entry_reverse(swidget, &sdev->widget_list, list) {
-		/* reset widget use_count after resuming */
-		swidget->use_count = 0;
+		/* only set up the widgets belonging to static pipelines */
+		if (swidget->dynamic_pipeline_widget)
+			continue;
+
+		/* update DAI config. The IPC will be sent in sof_widget_setup() */
+		if (WIDGET_IS_DAI(swidget->id)) {
+			struct snd_sof_dai *dai = swidget->private;
+			struct sof_ipc_dai_config *config;
+
+			if (!dai || !dai->dai_config)
+				continue;
+
+			config = dai->dai_config;
+			/*
+			 * The link DMA channel would be invalidated for running
+			 * streams but not for streams that were in the PAUSED
+			 * state during suspend. So invalidate it here before setting
+			 * the dai config in the DSP.
+			 */
+			if (config->type == SOF_DAI_INTEL_HDA)
+				config->hda.link_dma_ch = DMA_CHAN_INVALID;
+		}
 
 		ret = sof_widget_setup(sdev, swidget);
 		if (ret < 0)
@@ -323,56 +627,28 @@ int sof_set_up_pipelines(struct device *dev)
 	}
 
 	/* restore pipeline connections */
-	list_for_each_entry_reverse(sroute, &sdev->route_list, list) {
-		struct sof_ipc_pipe_comp_connect *connect;
-		struct sof_ipc_reply reply;
+	list_for_each_entry(sroute, &sdev->route_list, list) {
 
-		/* skip if there's no private data */
-		if (!sroute->private)
+		/* only set up routes belonging to static pipelines */
+		if (sroute->src_widget->dynamic_pipeline_widget ||
+		    sroute->sink_widget->dynamic_pipeline_widget)
 			continue;
 
-		connect = sroute->private;
-
-		/* send ipc */
-		ret = sof_ipc_tx_message(sdev->ipc,
-					 connect->hdr.cmd,
-					 connect, sizeof(*connect),
-					 &reply, sizeof(reply));
+		ret = sof_route_setup_ipc(sdev, sroute);
 		if (ret < 0) {
-			dev_err(dev,
-				"error: failed to load route sink %s control %s source %s\n",
-				sroute->route->sink,
-				sroute->route->control ? sroute->route->control
-					: "none",
-				sroute->route->source);
-
+			dev_err(sdev->dev, "%s: restore pipeline connections failed\n", __func__);
 			return ret;
 		}
-		sroute->setup = true;
-	}
-
-	/* restore dai links */
-	list_for_each_entry_reverse(dai, &sdev->dai_list, list) {
-		struct sof_ipc_dai_config *config = &dai->dai_config[dai->current_config];
-
-		/*
-		 * The link DMA channel would be invalidated for running
-		 * streams but not for streams that were in the PAUSED
-		 * state during suspend. So invalidate it here before setting
-		 * the dai config in the DSP.
-		 */
-		if (config->type == SOF_DAI_INTEL_HDA)
-			config->hda.link_dma_ch = DMA_CHAN_INVALID;
-
-		ret = sof_dai_config_setup(sdev, dai);
-		if (ret < 0)
-			return ret;
 	}
 
 	/* complete pipeline */
 	list_for_each_entry(swidget, &sdev->widget_list, list) {
 		switch (swidget->id) {
 		case snd_soc_dapm_scheduler:
+			/* only complete static pipelines */
+			if (swidget->dynamic_pipeline_widget)
+				continue;
+
 			swidget->complete =
 				snd_sof_complete_pipeline(dev, swidget);
 			break;
diff --git a/sound/soc/sof/sof-audio.h b/sound/soc/sof/sof-audio.h
index d358d455da1e..8d1fc6a8d7d0 100644
--- a/sound/soc/sof/sof-audio.h
+++ b/sound/soc/sof/sof-audio.h
@@ -28,6 +28,8 @@
 
 #define DMA_CHAN_INVALID	0xFFFFFFFF
 
+#define WIDGET_IS_DAI(id) ((id) == snd_soc_dapm_dai_in || (id) == snd_soc_dapm_dai_out)
+
 /* PCM stream, mapped to FW component  */
 struct snd_sof_pcm_stream {
 	u32 comp_id;
@@ -35,6 +37,7 @@ struct snd_sof_pcm_stream {
 	struct sof_ipc_stream_posn posn;
 	struct snd_pcm_substream *substream;
 	struct work_struct period_elapsed_work;
+	struct snd_soc_dapm_widget_list *list; /* list of connected DAPM widgets */
 	bool d0i3_compatible; /* DSP can be in D0I3 when this pcm is opened */
 	/*
 	 * flag to indicate that the DSP pipelines should be kept
@@ -256,4 +259,7 @@ void sof_machine_unregister(struct snd_sof_dev *sdev, void *pdata);
 int sof_widget_setup(struct snd_sof_dev *sdev, struct snd_sof_widget *swidget);
 int sof_widget_free(struct snd_sof_dev *sdev, struct snd_sof_widget *swidget);
 
+/* PCM */
+int sof_widget_list_setup(struct snd_sof_dev *sdev, struct snd_sof_pcm *spcm, int dir);
+int sof_widget_list_free(struct snd_sof_dev *sdev, struct snd_sof_pcm *spcm, int dir);
 #endif
-- 
2.27.0

