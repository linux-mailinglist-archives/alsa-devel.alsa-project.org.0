Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ED49B40FA8A
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Sep 2021 16:42:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 93C4416B1;
	Fri, 17 Sep 2021 16:41:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 93C4416B1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1631889753;
	bh=PZ2T+rBZT7AnFDzrnievbwX8PoJLiYXoBvH99ALl728=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=E3U6l/VGCvgOpVWDpepZ4z1A+j6mYK+HqcSISEfUcs7E2KLQBXd0z7iq93zB42Uph
	 1tdoprLucTf8VFuwFgPI4uCNqNOIjln2FW8xIVrchZGSlANP013qAbkSeUY/TD4Mw5
	 f2yxLCTLBe8cfH/jRpDlPqlP0kgJO9l3jA3FZ+4Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1B3D2F8053A;
	Fri, 17 Sep 2021 16:37:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4704CF8051E; Fri, 17 Sep 2021 16:37:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 MSGID_FROM_MTA_HEADER, SPF_HELO_NONE, SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2077.outbound.protection.outlook.com [40.107.21.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4A492F804E7
 for <alsa-devel@alsa-project.org>; Fri, 17 Sep 2021 16:37:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4A492F804E7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=NXP1.onmicrosoft.com
 header.i=@NXP1.onmicrosoft.com header.b="iCqAib40"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S2kilXRUWXfea7Fk0QxmPZtqzaYTPwi84XOi5psGdPmIN8dH98aZtrjRI05ikd+YMItf0+a4fmdMbBb+sKrHK02jc5qI8X8Arbp7Xhoi4J7YK8sd9ufmfKuCoiXFgopsmlA/lGGuduFLw5wkmV2k4SaTUYIShlp+dW2rwoG9HaZM+n/Lues8i6zMjMPUo9OR1ADsSURys2mF9nnupwe4olmSHkFZfHC2+W0aG+wyV/gsP+FEtI4rAOaWjwN6b0FyNlRx8AFUmhGVPUXf5Ymw+gnYjNcWYxznYrR6F61zbKoAy8DS7/EhjOJE04V3d4F6DlVGVLgg2Qz5YI9ZcESO/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=ksNcVA02KATYGGBxMlEBAHh4AAZmoZmEtRc90ZiMx3I=;
 b=M30FE3AL0/aHFKYNP9OdXfxIqDXWpQa+UeOGYXdj1ZKzPsT60/ZaUoV5gM2hHWYpHw4DoNaabV3a+wDsGdvmJKMe0oVyh6/MVPoQtWYVMGSkg7H0g42sRXscJoWBHol3qAZZtsNoHhi6BqNesCslAnHYd5rfD6BWeXzCPDun4k7UegcEfj5XwiCAzmjX1DE7rO20dNCzTWmS/z+yWAu6/Qxx9NjQ+wJhFNA9zqzvccD36veqJ5Av9PY0idInIywIbNxLYamgD5uVTPdfuIFZevEljrNlPy4CD2se4wpLeDoB/qbrFOueqAxFir7KWNnWUXhPq/7YpBhMp7vO0hjBgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ksNcVA02KATYGGBxMlEBAHh4AAZmoZmEtRc90ZiMx3I=;
 b=iCqAib40ftuYP7iv0NStDNbEKdrC33YmnsHY0KK89p5mROzkb3uq6FKXYoQEDCKyLWYaQAwrAgQMvueVGidAfccus0S3OUMJ3oQp9Ug8Hk7qIvgp3pxk5ORulsRkdkzsvDG+QqNFcq/FWUGL+pyvTEoQlZNi/OMX6TAAE6dC/jA=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=oss.nxp.com;
Received: from AM0PR04MB5140.eurprd04.prod.outlook.com (2603:10a6:208:ca::21)
 by AM0PR0402MB3506.eurprd04.prod.outlook.com (2603:10a6:208:17::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14; Fri, 17 Sep
 2021 14:37:30 +0000
Received: from AM0PR04MB5140.eurprd04.prod.outlook.com
 ([fe80::dd84:b996:1c8:705]) by AM0PR04MB5140.eurprd04.prod.outlook.com
 ([fe80::dd84:b996:1c8:705%6]) with mapi id 15.20.4523.016; Fri, 17 Sep 2021
 14:37:30 +0000
From: Daniel Baluta <daniel.baluta@oss.nxp.com>
To: broonie@kernel.org
Subject: [PATCH v2 10/12] ASoC: SOF: Intel: hda: make sure DAI widget is set
 up before IPC
Date: Fri, 17 Sep 2021 17:36:57 +0300
Message-Id: <20210917143659.401102-11-daniel.baluta@oss.nxp.com>
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
 Transport; Fri, 17 Sep 2021 14:37:29 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 92e855f5-8ab0-450d-a745-08d979e8adbb
X-MS-TrafficTypeDiagnostic: AM0PR0402MB3506:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM0PR0402MB35066C1C7ADBF3753CC2382CB8DD9@AM0PR0402MB3506.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:208;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hrFDMa09IKc+IKLFuXAsBS/d7OvpvLhDLjormxAcAfu5ozDvg+EpPgkUqYgg484wDGZZHnSVe/sPndyrrdJuIk2IhzS8vdeWC4fNQJVKaENJLUxd8Cjsm6q8fSEwfo51bquITOODG7C+Ck8N7dB7IhPWHc2YAwgePgyzffN416U6gIj5V3DWzi2gImNTd3XYia1Wy37X6h/HmE9GubRNshVu8ThCpt++wYtkmD/1V39q7Vz+GqN5PrB2n7rNErEuN3jGW+Zup4bgqELbQyovY5yhkrO1QSf06NIECybTpPtiJsfxOHImQGW+f0IF+eqfy08Ky2I64mY0RcMe+ucRDIbv+JH2zjkAkpAq3mZAGNDYl1suHih0XsTAB/M2Pp5EE2nDdGmWcuHbQqI4B0e1OlhRnarWMMMB9yI9XfE4vHHdf/zyQ0yxwKD/bUz12gLH1QnBpaV2QyBlHuj5Gu+bEiKfzzIr5P9r68qu3y0rFQwr9l4zkM2o/t1v1DReflgUVGamFGduDFQxxajhHXmDwOsiD+CO14I9GyDIHyPPskIsUSsg1WKcFfVPrSHm9sEd14xUo2WYromZs+cRIksbMw1lwGASF+VhJbViDmubEu+9jRvgrOnfD3njdPpSqjx0Vzoy6C+iyfQx2f06ZBHuVA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM0PR04MB5140.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(396003)(39860400002)(136003)(366004)(376002)(186003)(316002)(1076003)(66476007)(2906002)(30864003)(6486002)(5660300002)(38100700002)(2616005)(86362001)(83380400001)(44832011)(478600001)(4326008)(52116002)(6506007)(6666004)(8936002)(6512007)(66946007)(6916009)(8676002)(66556008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qZjg/AcOkkdW7k58vJTb/k9XFpumBR7f3FKj0zJjk0LbKZqG1qDQIXj+DCXq?=
 =?us-ascii?Q?ProuiBiQ5Cx/6uTcW+f4a3dVKjEEqO2sfMePc1EUm+FQVQPnoOe9T8CQcBwY?=
 =?us-ascii?Q?7jpmGtZ4hKu/qrST4z29gm1Lvx5haaW0RVJp5FjF9NXbn5HAHQ26wfVp8XuP?=
 =?us-ascii?Q?CbDKSeNxMNknarUFNbu2xwmpYMiXXIu6SZ1eWb1CLwCEIowNa3uM+X3vyUxO?=
 =?us-ascii?Q?uY9MTnf+Dtuve6zJKYrvG/Di9KCVTnLeSErP4ZT8PUs4tfeydzwEb5+kZIC1?=
 =?us-ascii?Q?FaZdciSPnS/cOmH8Rxl1e71Q9SbIUz9hICrOsZ2vsJ9VULzmZDU3ruOqJEoP?=
 =?us-ascii?Q?x3ldoRi7lWxfjbmnviE31xK5XK/86qiGCUnzmn8lxBiO1J27h/WuQFFE2+3x?=
 =?us-ascii?Q?9hUokwbTL3sSWYiBI4dJzXLEIujr3ZJ4RAy2qdGaaGke9pH1Dq05pK+NhvCh?=
 =?us-ascii?Q?izRrFiRpGLjwPq4b5/LEPyTfk66olOpMHGM2Pw/ng7IVBV2yOg+lHDF2ImLj?=
 =?us-ascii?Q?8BU23rRYWnXjQKurt6Qg/VDztUkg/PpSCBFwqgcpD6ZFMDxWnmFbE6uKcpi+?=
 =?us-ascii?Q?EHTj8AACpAf3DIcTKEEMT/SHvmyFEkm0XO8kWYZfHMRQNLNlzDW9cHvCRpFN?=
 =?us-ascii?Q?gxTWZome40JduV0FBAlZH0IBWgSV37iQoF65+VQt4accl5djkhUSUan9zwDy?=
 =?us-ascii?Q?I5FUpDaCfaKgk7Wa+wUZUGqOPY9boRT4QZWNbi60hmHerhKwmL/HPggunJhg?=
 =?us-ascii?Q?7TJ7YDmqGXIhWRgJ5A8wb++3M20igQoKIZnE9/zoTE0xvBO3GhCQZbMFeRuV?=
 =?us-ascii?Q?wgQQWqPAxDbqezYa5UGFER7KooQALRASlFsWDz6EzhKLbOorlZpgBQ1bVnI2?=
 =?us-ascii?Q?IMhNvvJLsCln7ZpM9AfLg8LccsQqHXf2K4SE4vDQCpZHB8C933fmRJyQkftf?=
 =?us-ascii?Q?XVHQeVZ0vyp+x461rtRpB8KI1SXwagmBTCQJZ9h/SE/BEsursGrgtLr/VpIJ?=
 =?us-ascii?Q?AJM0ocrg9YPzPWfVbjzTft3l5JEm7InW2IKtp7ajnaG4dsMZZ+AxDchvC9ts?=
 =?us-ascii?Q?sZrgckeLIOOo2tNfIM61gx0PbF9b3sKrb7eBoOs4RRLmp9QB6quBZQGCsZOG?=
 =?us-ascii?Q?KdJmbqnXdTMcxX7zqhZ5fB+Fhc3QFuuhE3CMR3ZgbxgP1Igj2XAcDPwPTomF?=
 =?us-ascii?Q?EgxAT5HjvpPgfZdHS3sIcx3QrcrhkJCOTpvYlzxYEkIdzSLmsOTY5EfTwIM9?=
 =?us-ascii?Q?zWpo6MH0zR+mZkKo/2H1yK76S/02H8IrJklA/D4qO8l/QakSoy8YmKgE70Mr?=
 =?us-ascii?Q?GgNHvUABSjkz7F6XKZz7fiXG0asDbfvclF7RZ4B6ft4zFeieMtamfXvN4MtR?=
 =?us-ascii?Q?3gWR7SQgkI8BDLiUHJ6rzKBGMy7ZRTRO5elKqMyRBVfnD1VkkQ=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 92e855f5-8ab0-450d-a745-08d979e8adbb
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB5140.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2021 14:37:30.5015 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eqIwQR4A8XqdK6y9QKClBlA08H+4gLzFLwu2YXalf0Sb5SydZtpyH9tLuwrXdHOayUrP6dGEftSMaRZ5vVupyA==
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

With the implementation of the dynamic pipeline feature, widgets
will only be setup when a PCM is opened during the
hw_params ioctl. The BE hw_params callback is responsible for
sending the DAI_CONFIG for the DAI widgets in the DSP.
With dynamic pipelines, the DAI widgets will need to set up
first before sending the DAI_CONFIG IPC in the BE hw_params.

Update the BE hw_params/hw_free callbacks for all ALH, HDA and SSP
DAIs to set up/free the DAI widget before/after DAI_CONFIG IPC.

Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
---
 sound/soc/sof/intel/hda-dai.c | 176 ++++++++++++++++++++-------------
 sound/soc/sof/intel/hda.c     | 177 +++++++++++++++++++++++++---------
 sound/soc/sof/intel/hda.h     |   5 +
 sound/soc/sof/sof-audio.c     |   1 +
 sound/soc/sof/sof-audio.h     |   2 +-
 sound/soc/sof/topology.c      |   3 -
 6 files changed, 245 insertions(+), 119 deletions(-)

diff --git a/sound/soc/sof/intel/hda-dai.c b/sound/soc/sof/intel/hda-dai.c
index 2f54a659b78a..d1ec8bfb6002 100644
--- a/sound/soc/sof/intel/hda-dai.c
+++ b/sound/soc/sof/intel/hda-dai.c
@@ -155,49 +155,70 @@ static int hda_link_dma_params(struct hdac_ext_stream *stream,
 	return 0;
 }
 
-/* Send DAI_CONFIG IPC to the DAI that matches the dai_name and direction */
-static int hda_link_config_ipc(struct sof_intel_hda_stream *hda_stream,
-			       const char *dai_name, int channel, int dir)
+/* Update config for the DAI widget */
+static struct sof_ipc_dai_config *hda_dai_update_config(struct snd_soc_dapm_widget *w,
+							int channel)
 {
+	struct snd_sof_widget *swidget = w->dobj.private;
 	struct sof_ipc_dai_config *config;
 	struct snd_sof_dai *sof_dai;
-	struct sof_ipc_reply reply;
-	int ret = 0;
 
-	list_for_each_entry(sof_dai, &hda_stream->sdev->dai_list, list) {
-		if (!sof_dai->cpu_dai_name)
-			continue;
+	if (!swidget) {
+		dev_err(swidget->scomp->dev, "error: No private data for widget %s\n", w->name);
+		return NULL;
+	}
 
-		if (!strcmp(dai_name, sof_dai->cpu_dai_name) &&
-		    dir == sof_dai->comp_dai.direction) {
-			config = sof_dai->dai_config;
+	sof_dai = swidget->private;
 
-			if (!config) {
-				dev_err(hda_stream->sdev->dev,
-					"error: no config for DAI %s\n",
-					sof_dai->name);
-				return -EINVAL;
-			}
+	if (!sof_dai || !sof_dai->dai_config) {
+		dev_err(swidget->scomp->dev, "error: No config for DAI %s\n", w->name);
+		return NULL;
+	}
 
-			/* update config with stream tag */
-			config->hda.link_dma_ch = channel;
+	config = &sof_dai->dai_config[sof_dai->current_config];
 
-			/* send IPC */
-			ret = sof_ipc_tx_message(hda_stream->sdev->ipc,
-						 config->hdr.cmd,
-						 config,
-						 config->hdr.size,
-						 &reply, sizeof(reply));
+	/* update config with stream tag */
+	config->hda.link_dma_ch = channel;
 
-			if (ret < 0)
-				dev_err(hda_stream->sdev->dev,
-					"error: failed to set dai config for %s\n",
-					sof_dai->name);
-			return ret;
-		}
+	return config;
+}
+
+static int hda_link_config_ipc(struct sof_intel_hda_stream *hda_stream,
+			      struct snd_soc_dapm_widget *w, int channel)
+{
+	struct snd_sof_dev *sdev = hda_stream->sdev;
+	struct sof_ipc_dai_config *config;
+	struct sof_ipc_reply reply;
+
+	config = hda_dai_update_config(w, channel);
+	if (!config) {
+		dev_err(sdev->dev, "error: no config for DAI %s\n", w->name);
+		return -ENOENT;
+	}
+
+	/* send DAI_CONFIG IPC */
+	return sof_ipc_tx_message(sdev->ipc, config->hdr.cmd, config, config->hdr.size,
+				  &reply, sizeof(reply));
+}
+
+static int hda_link_dai_widget_update(struct sof_intel_hda_stream *hda_stream,
+				      struct snd_soc_dapm_widget *w,
+				      int channel, bool widget_setup)
+{
+	struct snd_sof_dev *sdev = hda_stream->sdev;
+	struct sof_ipc_dai_config *config;
+
+	config = hda_dai_update_config(w, channel);
+	if (!config) {
+		dev_err(sdev->dev, "error: no config for DAI %s\n", w->name);
+		return -ENOENT;
 	}
 
-	return -EINVAL;
+	/* set up/free DAI widget and send DAI_CONFIG IPC */
+	if (widget_setup)
+		return hda_ctrl_dai_widget_setup(w);
+
+	return hda_ctrl_dai_widget_free(w);
 }
 
 static int hda_link_hw_params(struct snd_pcm_substream *substream,
@@ -211,6 +232,7 @@ static int hda_link_hw_params(struct snd_pcm_substream *substream,
 	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
 	struct sof_intel_hda_stream *hda_stream;
 	struct hda_pipe_params p_params = {0};
+	struct snd_soc_dapm_widget *w;
 	struct hdac_ext_link *link;
 	int stream_tag;
 	int ret;
@@ -229,9 +251,13 @@ static int hda_link_hw_params(struct snd_pcm_substream *substream,
 
 	hda_stream = hstream_to_sof_hda_stream(link_dev);
 
-	/* update the DSP with the new tag */
-	ret = hda_link_config_ipc(hda_stream, dai->name, stream_tag - 1,
-				  substream->stream);
+	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+		w = dai->playback_widget;
+	else
+		w = dai->capture_widget;
+
+	/* set up the DAI widget and send the DAI_CONFIG with the new tag */
+	ret = hda_link_dai_widget_update(hda_stream, w, stream_tag - 1, true);
 	if (ret < 0)
 		return ret;
 
@@ -287,6 +313,7 @@ static int hda_link_pcm_trigger(struct snd_pcm_substream *substream,
 				snd_soc_dai_get_dma_data(dai, substream);
 	struct sof_intel_hda_stream *hda_stream;
 	struct snd_soc_pcm_runtime *rtd;
+	struct snd_soc_dapm_widget *w;
 	struct hdac_ext_link *link;
 	struct hdac_stream *hstream;
 	struct hdac_bus *bus;
@@ -321,12 +348,16 @@ static int hda_link_pcm_trigger(struct snd_pcm_substream *substream,
 		break;
 	case SNDRV_PCM_TRIGGER_SUSPEND:
 	case SNDRV_PCM_TRIGGER_STOP:
+		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+			w = dai->playback_widget;
+		else
+			w = dai->capture_widget;
+
 		/*
 		 * clear link DMA channel. It will be assigned when
 		 * hw_params is set up again after resume.
 		 */
-		ret = hda_link_config_ipc(hda_stream, dai->name,
-					  DMA_CHAN_INVALID, substream->stream);
+		ret = hda_link_config_ipc(hda_stream, w, DMA_CHAN_INVALID);
 		if (ret < 0)
 			return ret;
 
@@ -357,6 +388,7 @@ static int hda_link_hw_free(struct snd_pcm_substream *substream,
 	struct hdac_stream *hstream;
 	struct snd_soc_pcm_runtime *rtd;
 	struct hdac_ext_stream *link_dev;
+	struct snd_soc_dapm_widget *w;
 	int ret;
 
 	hstream = substream->runtime->private_data;
@@ -372,9 +404,13 @@ static int hda_link_hw_free(struct snd_pcm_substream *substream,
 
 	hda_stream = hstream_to_sof_hda_stream(link_dev);
 
-	/* free the link DMA channel in the FW */
-	ret = hda_link_config_ipc(hda_stream, dai->name, DMA_CHAN_INVALID,
-				  substream->stream);
+	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+		w = dai->playback_widget;
+	else
+		w = dai->capture_widget;
+
+	/* free the link DMA channel in the FW and the DAI widget */
+	ret = hda_link_dai_widget_update(hda_stream, w, DMA_CHAN_INVALID, false);
 	if (ret < 0)
 		return ret;
 
@@ -406,47 +442,51 @@ static const struct snd_soc_dai_ops hda_link_dai_ops = {
 
 #endif
 
-static int ssp_dai_hw_params(struct snd_pcm_substream *substream,
-			     struct snd_pcm_hw_params *params,
-			     struct snd_soc_dai *dai)
+static int ssp_dai_setup_or_free(struct snd_pcm_substream *substream, struct snd_soc_dai *dai,
+				 bool setup)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
-	struct snd_soc_component *component = snd_soc_rtdcom_lookup(rtd, SOF_AUDIO_PCM_DRV_NAME);
-	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(component);
-	struct sof_ipc_fw_version *v = &sdev->fw_ready.version;
-	struct sof_ipc_dai_config *config;
-	struct snd_sof_dai *sof_dai;
-	struct sof_ipc_reply reply;
-	int ret;
+	struct snd_soc_component *component;
+	struct snd_sof_widget *swidget;
+	struct snd_soc_dapm_widget *w;
+	struct sof_ipc_fw_version *v;
+	struct snd_sof_dev *sdev;
+
+	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+		w = dai->playback_widget;
+	else
+		w = dai->capture_widget;
+
+	swidget = w->dobj.private;
+	component = swidget->scomp;
+	sdev = snd_soc_component_get_drvdata(component);
+	v = &sdev->fw_ready.version;
 
 	/* DAI_CONFIG IPC during hw_params is not supported in older firmware */
 	if (v->abi_version < SOF_ABI_VER(3, 18, 0))
 		return 0;
 
-	list_for_each_entry(sof_dai, &sdev->dai_list, list) {
-		if (!sof_dai->cpu_dai_name || !sof_dai->dai_config)
-			continue;
-
-		if (!strcmp(dai->name, sof_dai->cpu_dai_name) &&
-		    substream->stream == sof_dai->comp_dai.direction) {
-			config = &sof_dai->dai_config[sof_dai->current_config];
+	if (setup)
+		return hda_ctrl_dai_widget_setup(w);
 
-			/* send IPC */
-			ret = sof_ipc_tx_message(sdev->ipc, config->hdr.cmd, config,
-						 config->hdr.size, &reply, sizeof(reply));
+	return hda_ctrl_dai_widget_free(w);
+}
 
-			if (ret < 0)
-				dev_err(sdev->dev, "error: failed to set DAI config for %s\n",
-					sof_dai->name);
-			return ret;
-		}
-	}
+static int ssp_dai_hw_params(struct snd_pcm_substream *substream,
+			     struct snd_pcm_hw_params *params,
+			     struct snd_soc_dai *dai)
+{
+	return ssp_dai_setup_or_free(substream, dai, true);
+}
 
-	return 0;
+static int ssp_dai_hw_free(struct snd_pcm_substream *substream,
+			   struct snd_soc_dai *dai)
+{
+	return ssp_dai_setup_or_free(substream, dai, false);
 }
 
 static const struct snd_soc_dai_ops ssp_dai_ops = {
 	.hw_params = ssp_dai_hw_params,
+	.hw_free = ssp_dai_hw_free,
 };
 
 /*
diff --git a/sound/soc/sof/intel/hda.c b/sound/soc/sof/intel/hda.c
index c11e4c14d875..93305d389ff6 100644
--- a/sound/soc/sof/intel/hda.c
+++ b/sound/soc/sof/intel/hda.c
@@ -52,6 +52,86 @@ static const struct sof_intel_dsp_desc
 	return chip_info;
 }
 
+int hda_ctrl_dai_widget_setup(struct snd_soc_dapm_widget *w)
+{
+	struct snd_sof_widget *swidget = w->dobj.private;
+	struct snd_soc_component *component = swidget->scomp;
+	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(component);
+	struct sof_ipc_dai_config *config;
+	struct snd_sof_dai *sof_dai;
+	struct sof_ipc_reply reply;
+	int ret;
+
+	sof_dai = swidget->private;
+
+	if (!sof_dai || !sof_dai->dai_config) {
+		dev_err(sdev->dev, "No config for DAI %s\n", w->name);
+		return -EINVAL;
+	}
+
+	config = &sof_dai->dai_config[sof_dai->current_config];
+
+	/*
+	 * For static pipelines, the DAI widget would already be set up and calling
+	 * sof_widget_setup() simply returns without doing anything.
+	 * For dynamic pipelines, the DAI widget will be set up now.
+	 */
+	ret = sof_widget_setup(sdev, swidget);
+	if (ret < 0) {
+		dev_err(sdev->dev, "error: failed setting up DAI widget %s\n", w->name);
+		return ret;
+	}
+
+	/* send DAI_CONFIG IPC */
+	ret = sof_ipc_tx_message(sdev->ipc, config->hdr.cmd, config, config->hdr.size,
+				  &reply, sizeof(reply));
+	if (ret < 0) {
+		dev_err(sdev->dev, "error: failed setting DAI config for %s\n", w->name);
+		return ret;
+	}
+
+	sof_dai->configured = true;
+
+	return 0;
+}
+
+int hda_ctrl_dai_widget_free(struct snd_soc_dapm_widget *w)
+{
+	struct snd_sof_widget *swidget = w->dobj.private;
+	struct snd_soc_component *component = swidget->scomp;
+	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(component);
+	struct sof_ipc_dai_config *config;
+	struct snd_sof_dai *sof_dai;
+	struct sof_ipc_reply reply;
+	int ret;
+
+	sof_dai = swidget->private;
+
+	if (!sof_dai || !sof_dai->dai_config) {
+		dev_err(sdev->dev, "error: No config to free DAI %s\n", w->name);
+		return -EINVAL;
+	}
+
+	/* nothing to do if hw_free() is called without restarting the stream after resume. */
+	if (!sof_dai->configured)
+		return 0;
+
+	config = &sof_dai->dai_config[sof_dai->current_config];
+
+	ret = sof_ipc_tx_message(sdev->ipc, config->hdr.cmd, config, config->hdr.size,
+				  &reply, sizeof(reply));
+	if (ret < 0)
+		dev_err(sdev->dev, "error: failed resetting DAI config for %s\n", w->name);
+
+	/*
+	 * Reset the configured_flag and free the widget even if the IPC fails to keep
+	 * the widget use_count balanced
+	 */
+	sof_dai->configured = false;
+
+	return sof_widget_free(sdev, swidget);
+}
+
 #if IS_ENABLED(CONFIG_SND_SOC_SOF_INTEL_SOUNDWIRE)
 
 /*
@@ -64,67 +144,70 @@ static int sdw_clock_stop_quirks = SDW_INTEL_CLK_STOP_BUS_RESET;
 module_param(sdw_clock_stop_quirks, int, 0444);
 MODULE_PARM_DESC(sdw_clock_stop_quirks, "SOF SoundWire clock stop quirks");
 
+static int sdw_dai_config_ipc(struct snd_sof_dev *sdev,
+			      struct snd_soc_dapm_widget *w,
+			      int link_id, int alh_stream_id, int dai_id, bool setup)
+{
+	struct snd_sof_widget *swidget = w->dobj.private;
+	struct sof_ipc_dai_config *config;
+	struct snd_sof_dai *sof_dai;
+
+	if (!swidget) {
+		dev_err(sdev->dev, "error: No private data for widget %s\n", w->name);
+		return -EINVAL;
+	}
+
+	sof_dai = swidget->private;
+
+	if (!sof_dai || !sof_dai->dai_config) {
+		dev_err(sdev->dev, "error: No config for DAI %s\n", w->name);
+		return -EINVAL;
+	}
+
+	config = &sof_dai->dai_config[sof_dai->current_config];
+
+	/* update config with link and stream ID */
+	config->dai_index = (link_id << 8) | dai_id;
+	config->alh.stream_id = alh_stream_id;
+
+	if (setup)
+		return hda_ctrl_dai_widget_setup(w);
+
+	return hda_ctrl_dai_widget_free(w);
+}
+
 static int sdw_params_stream(struct device *dev,
 			     struct sdw_intel_stream_params_data *params_data)
 {
+	struct snd_pcm_substream *substream = params_data->substream;
 	struct snd_sof_dev *sdev = dev_get_drvdata(dev);
 	struct snd_soc_dai *d = params_data->dai;
-	struct sof_ipc_dai_config config;
-	struct sof_ipc_reply reply;
-	int link_id = params_data->link_id;
-	int alh_stream_id = params_data->alh_stream_id;
-	int ret;
-	u32 size = sizeof(config);
-
-	memset(&config, 0, size);
-	config.hdr.size = size;
-	config.hdr.cmd = SOF_IPC_GLB_DAI_MSG | SOF_IPC_DAI_CONFIG;
-	config.type = SOF_DAI_INTEL_ALH;
-	config.dai_index = (link_id << 8) | (d->id);
-	config.alh.stream_id = alh_stream_id;
-
-	/* send message to DSP */
-	ret = sof_ipc_tx_message(sdev->ipc,
-				 config.hdr.cmd, &config, size, &reply,
-				 sizeof(reply));
-	if (ret < 0) {
-		dev_err(sdev->dev,
-			"error: failed to set DAI hw_params for link %d dai->id %d ALH %d\n",
-			link_id, d->id, alh_stream_id);
-	}
+	struct snd_soc_dapm_widget *w;
 
-	return ret;
+	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+		w = d->playback_widget;
+	else
+		w = d->capture_widget;
+
+	return sdw_dai_config_ipc(sdev, w, params_data->link_id, params_data->alh_stream_id,
+				  d->id, true);
 }
 
 static int sdw_free_stream(struct device *dev,
 			   struct sdw_intel_stream_free_data *free_data)
 {
+	struct snd_pcm_substream *substream = free_data->substream;
 	struct snd_sof_dev *sdev = dev_get_drvdata(dev);
 	struct snd_soc_dai *d = free_data->dai;
-	struct sof_ipc_dai_config config;
-	struct sof_ipc_reply reply;
-	int link_id = free_data->link_id;
-	int ret;
-	u32 size = sizeof(config);
-
-	memset(&config, 0, size);
-	config.hdr.size = size;
-	config.hdr.cmd = SOF_IPC_GLB_DAI_MSG | SOF_IPC_DAI_CONFIG;
-	config.type = SOF_DAI_INTEL_ALH;
-	config.dai_index = (link_id << 8) | d->id;
-	config.alh.stream_id = 0xFFFF; /* invalid value on purpose */
-
-	/* send message to DSP */
-	ret = sof_ipc_tx_message(sdev->ipc,
-				 config.hdr.cmd, &config, size, &reply,
-				 sizeof(reply));
-	if (ret < 0) {
-		dev_err(sdev->dev,
-			"error: failed to free stream for link %d dai->id %d\n",
-			link_id, d->id);
-	}
+	struct snd_soc_dapm_widget *w;
 
-	return ret;
+	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+		w = d->playback_widget;
+	else
+		w = d->capture_widget;
+
+	/* send invalid stream_id */
+	return sdw_dai_config_ipc(sdev, w, free_data->link_id, 0xFFFF, d->id, false);
 }
 
 static const struct sdw_intel_ops sdw_callback = {
diff --git a/sound/soc/sof/intel/hda.h b/sound/soc/sof/intel/hda.h
index 087fa06d5210..9da8ba0ed38d 100644
--- a/sound/soc/sof/intel/hda.h
+++ b/sound/soc/sof/intel/hda.h
@@ -733,4 +733,9 @@ void hda_set_mach_params(const struct snd_soc_acpi_mach *mach,
 /* PCI driver selection and probe */
 int hda_pci_intel_probe(struct pci_dev *pci, const struct pci_device_id *pci_id);
 
+struct snd_sof_dai;
+struct sof_ipc_dai_config;
+int hda_ctrl_dai_widget_setup(struct snd_soc_dapm_widget *w);
+int hda_ctrl_dai_widget_free(struct snd_soc_dapm_widget *w);
+
 #endif
diff --git a/sound/soc/sof/sof-audio.c b/sound/soc/sof/sof-audio.c
index 7a4aaabf091e..bf5e7c7019a5 100644
--- a/sound/soc/sof/sof-audio.c
+++ b/sound/soc/sof/sof-audio.c
@@ -163,6 +163,7 @@ int sof_widget_setup(struct snd_sof_dev *sdev, struct snd_sof_widget *swidget)
 			return -ENOMEM;
 
 		dai = swidget->private;
+		dai->configured = false;
 		memcpy(comp, &dai->comp_dai, sizeof(struct sof_ipc_comp_dai));
 
 		/* append extended data to the end of the component */
diff --git a/sound/soc/sof/sof-audio.h b/sound/soc/sof/sof-audio.h
index 6ac623137026..d358d455da1e 100644
--- a/sound/soc/sof/sof-audio.h
+++ b/sound/soc/sof/sof-audio.h
@@ -130,11 +130,11 @@ struct snd_sof_route {
 struct snd_sof_dai {
 	struct snd_soc_component *scomp;
 	const char *name;
-	const char *cpu_dai_name;
 
 	struct sof_ipc_comp_dai comp_dai;
 	int number_configs;
 	int current_config;
+	bool configured; /* DAI configured during BE hw_params */
 	struct sof_ipc_dai_config *dai_config;
 	struct list_head list;	/* list in sdev dai list */
 };
diff --git a/sound/soc/sof/topology.c b/sound/soc/sof/topology.c
index b996b89f2920..d8eb238e5229 100644
--- a/sound/soc/sof/topology.c
+++ b/sound/soc/sof/topology.c
@@ -2756,9 +2756,6 @@ static int sof_set_dai_config_multi(struct snd_sof_dev *sdev, u32 size,
 			if (!dai->dai_config)
 				return -ENOMEM;
 
-			/* set cpu_dai_name */
-			dai->cpu_dai_name = link->cpus->dai_name;
-
 			found = 1;
 		}
 	}
-- 
2.27.0

