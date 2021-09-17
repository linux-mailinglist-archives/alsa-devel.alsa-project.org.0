Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 15E5B40FA84
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Sep 2021 16:41:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A22F61796;
	Fri, 17 Sep 2021 16:40:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A22F61796
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1631889709;
	bh=vqajXCFSytjLHCFxJLXUYNXQhAI/pU7JAnfdug2E7hQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tLzM39SinWNzeZt5XM1DhJc6U0+kKXFVwM9caHlA/0ZZd25h89fK72VVZgXsGbBoW
	 dSc2zfsLzvJ/ENaHGu0p7FRfuXHs5ZFcVFJuylVnoKx+EH+CHZ81WJ2tICmifyDm9C
	 pqtGNInnSdMrI8rmRXQ+HSwGuxVLLFBiQLO5DoQg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4F30EF804EC;
	Fri, 17 Sep 2021 16:37:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 44B15F80517; Fri, 17 Sep 2021 16:37:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 MSGID_FROM_MTA_HEADER, SPF_HELO_NONE, SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2077.outbound.protection.outlook.com [40.107.21.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 14E46F80152
 for <alsa-devel@alsa-project.org>; Fri, 17 Sep 2021 16:37:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 14E46F80152
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=NXP1.onmicrosoft.com
 header.i=@NXP1.onmicrosoft.com header.b="CEdpUVY1"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ji4R2+ChPSkQkAYMjHuHs0t0BFieH2LVIQMH9MQx79DqQBOvl1uOqp/ZFAB4+1gzz+H7xCFd8RdBCeOVQdOdL+CXsD19SJk7KpF6ofHm31fUsBdGYKG+2Fj6+8nXihDR/DOMiXiI/XPv8usgVv8VMgmXzP7Qwk0zI9reLzUp15mcd2IDeeefkzGfS1ShIFqTC/gTBDiHZ5uIO6q8P8Z7jZQjHfqFoz/U9Rye41Dfeg7indOV452QyAjCW0d/UCvhOi/OPCVTgSriGBzrs5mGVBn7DLSBrFsnyyMsOgdFYuusl4lzG5V8CVNYUoMxoaCwPrUHVPVqV6OAqC1PddeHrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=HJgweO+E6P8l30vwij3mdxhWvZzkkhGu6buFY+kQgTI=;
 b=OYj/DPCt0zMZM04YiEMmdztGiulgI9pecjNJCzTCXNC7TURhUjV+QRlBUYJzX9V4SAu1X+1GIbxfL1Gd+UZIlTTrThWmRS7Eyb3kOff4xoGlVZB1QFSnQjpQw4q/RnhnsNAphK7XTK+KGT+W5ZXuCIWUznoUpTGqdSsJNKkDNxBHjSt84syf6HSViJ/RQtHVNHNlBFb+CP3cxQXpXu9Vq62LM9k59KYASgRQZXMBagVGOUP1s47Nzgri/WlHtAKdDrWpZK5yHsdS1xGqqnKEppa5/9VBq6/J2f1N0mYmHcSy7cohyGQXUyeCNTf1twOyDj7Cibz/uTKi2I3lAdzE8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HJgweO+E6P8l30vwij3mdxhWvZzkkhGu6buFY+kQgTI=;
 b=CEdpUVY12Fqbh2aWTKkt9qU5KLk/F0zXT0Zc1/p0fFyEu7G/sb0e7xmcN2XxM8pbn0qUoMT1KO1+TAtZeOE5YePf2FE7aAT4wycBS88q/zixplIhPkiJy5Lo0cOBKyHs5auXTsCm3w4zwC5pvCjjaMXe4C7t9/odE5JIFTSYEE4=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=oss.nxp.com;
Received: from AM0PR04MB5140.eurprd04.prod.outlook.com (2603:10a6:208:ca::21)
 by AM0PR0402MB3506.eurprd04.prod.outlook.com (2603:10a6:208:17::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14; Fri, 17 Sep
 2021 14:37:28 +0000
Received: from AM0PR04MB5140.eurprd04.prod.outlook.com
 ([fe80::dd84:b996:1c8:705]) by AM0PR04MB5140.eurprd04.prod.outlook.com
 ([fe80::dd84:b996:1c8:705%6]) with mapi id 15.20.4523.016; Fri, 17 Sep 2021
 14:37:28 +0000
From: Daniel Baluta <daniel.baluta@oss.nxp.com>
To: broonie@kernel.org
Subject: [PATCH v2 08/12] ASoC: SOF: Don't set up widgets during topology
 parsing
Date: Fri, 17 Sep 2021 17:36:55 +0300
Message-Id: <20210917143659.401102-9-daniel.baluta@oss.nxp.com>
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
 Transport; Fri, 17 Sep 2021 14:37:27 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8ae335b3-0d93-4aad-0998-08d979e8ac5f
X-MS-TrafficTypeDiagnostic: AM0PR0402MB3506:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM0PR0402MB3506FFD2515476C2FD01D36CB8DD9@AM0PR0402MB3506.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:546;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Uq817+mJW2KlvzJy1yBzQxEUm2/e82d9yJ4hGs0J14D7TYmN1D5JnSRc/E6e4xmhr8+f2lwRqarTqU7cnvb3EJbDXI/694m4JuyWaHIItOnbeUhuIOlTbxO+Vl3iymDyL+95ApCHA0k/eKMppKMDIMaW47BGv9guTML1Fx+54srbpyqIf0CHIiTAtL4oHqluSD95gwFULmo720xQGdh3iwPOVQgYY/vH+XxTcXATzRUbHMbp4txklaXWUERJDlHPmx2I7EGFGgWm5DTxEVyM61/ZxHTZXGV4N+I7UxDOLVTkfOtNU8+1MTs7xSXWYd+7BlX6mXIKvMT0Bi+mg62whLhKqw4RdsKiOQo2g8V6NpQMeQoUfBpBK1+Hhj7U82fbB88K+kW+cEn53tHHqfaoe6Dkog9Buo2s1TELiD78zPqREvKJV/bBoCVZ5wS9SnvCtxMOLe+23RxMfttHNdroWwBWPfbTf0PzeI7IKviMcJwqJqpICPaShF9i999zG/XMGJWs9zpk7abE9psGeaJ/Z2B7cNPlgtEnSR+dQRJPcLPD7WK0ZXEWv6HfFiEuZkKTNk1xClnjaPRWT5r5/w7mGQE6DxlXlbrPLXkVOesZ94iECygG7lsZorNDQ45KRaIBSFijylHRQzy1jJSH2HCL2w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM0PR04MB5140.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(396003)(39860400002)(136003)(366004)(376002)(186003)(316002)(1076003)(66476007)(2906002)(30864003)(6486002)(5660300002)(38100700002)(2616005)(86362001)(83380400001)(44832011)(478600001)(4326008)(52116002)(6506007)(6666004)(8936002)(6512007)(66946007)(6916009)(8676002)(66556008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Re3SqUdV3z0UjTZBX2966v3LWnEmuSKvzt6O3N+J3M7rERi/vZ8lqX6SfDvX?=
 =?us-ascii?Q?HERi6RC8wQS5qi17EQwmybw4q1z6l5P5/LCLr1KVr9M6x+OY4ruUR2hd07vX?=
 =?us-ascii?Q?Uexx18MfhOun8PgIDywNGUoORt0Tf+D72Wcqci9c6VkYuWO288uMe9jxFRUF?=
 =?us-ascii?Q?z07G+IFPunzU+6BAf+QGNYi5qm1mqX/otzzlAbZ3vG4N3J9kByrkm8QFC9+k?=
 =?us-ascii?Q?XTDbj4CpLKPUkUMTSZ8xSrENaFpvgvBuvq57ZP8rdv3g9rJ7HClRObgsMhdA?=
 =?us-ascii?Q?4B/faRwuWKVSl5DA0C20kfFT8LGbS0J4mDPgwoUzr07AYLmTMjrL85qcqJBb?=
 =?us-ascii?Q?d6EnV4ZARNFm0ISJAMWk9h27RsJOg23ebnquYMwksToXU7WNFgGId+cMjUJ7?=
 =?us-ascii?Q?qCQeewVnC+NF844yKx6Xjnrg1LqPXC4g/RhYUTbo56Mhkr+N+gR9JLa7cD2x?=
 =?us-ascii?Q?0/nXjgQou/XOMbzKnW6HWEEr80f4kBhvAElzXDthMPJoYSIXcXRG1MU/USFU?=
 =?us-ascii?Q?2pcyF6UpXL0paDCCTP+dBlheSbf9n4vMRoxMhVl92qmCoXFgnZbs8KdFn5V5?=
 =?us-ascii?Q?eWIca9+VVLEluc7D54JAQt9CI1UTc0cWzXdQWLUj/6aYrGty0Qtmwp/qnBCN?=
 =?us-ascii?Q?Z/nCq8UWmb0C4f+06n0uUPaTchLQS+EBRwKT/i9r5IM9WoyccVOPh09c3xQa?=
 =?us-ascii?Q?66osJGFHAocHoKp2d/sBsd3vAD9siW9RWV5vpJNLXalmQ5WwhZD2UyItfdQ7?=
 =?us-ascii?Q?3Lhmk2cEy7eoitsuUYbDR8JOsuUoE58erRP64YidKJMbSkesnb/qCY6NzYcf?=
 =?us-ascii?Q?RCefb4V7msdAf6Pd6bQ5UoEJ5uqrGU2jXVb5JEolFl4fAxKWvMu+IMMQZNmx?=
 =?us-ascii?Q?BVGlxdgY8vNm7uFtY3Fuu/vbrVhEJKatdFJKWtfuw1PWcqCGuY4g4nlwjD8S?=
 =?us-ascii?Q?eE7nwnvHr1QsnPb7P4ncGhr5KQRzdd6Fx8bGdYKSGmU/VbM3VbTRnN/iQkgH?=
 =?us-ascii?Q?FwKYDfu+w/MmBHZTpRvGrEw121O5AZs4gV1EoFdv5U1vzz5HW9tYTuNq6lSe?=
 =?us-ascii?Q?oSuvAwqsB2dOblJb3q9ZMStiaWO6Dtjkk2E9YNGcLBi4yKYthJAWjtxPWaPH?=
 =?us-ascii?Q?0aVIVifqZWm0hSdDOcf2fe2bgo8oYBt8C0sfl2yrCPgs563/F+9IwCb92uU+?=
 =?us-ascii?Q?0GrhC/pZFgr2smf6sX5jXLO58FhP72/riCAcR4f4LMqA4MdtpzOb/jCKMzDP?=
 =?us-ascii?Q?eofqII2Qe4Lhon4pRSGfRNXMKwg81aDYZm9Sfot6yb/sbeh/7Q7ZbX3xrNIb?=
 =?us-ascii?Q?Dsmx7QlSRr0DddohX3lHdRw1+dlUyY6Vof0vBFIWfTJUQd9oDuoWwxdMkQk4?=
 =?us-ascii?Q?pTjVVydW/dw2P0SbR9+jpwhXChnOLgCkCMnb/YlY5bzRzpyUfQ=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ae335b3-0d93-4aad-0998-08d979e8ac5f
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB5140.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2021 14:37:28.2667 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CzOOpL+99YxMcAmBPFEoBr5F2wkJFdhyhKisBI6tajlh2/XJJaZQQVmuPz1lUFKV9TPom3EraKPXecXgJhdjkg==
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

In preparation for supporting dynamic pipelines, move the
widget setup, DAI config IPCs to the complete callback
during topology loading. For current topology where all
the pipelines are static, all the pipelines will be set up
during complete. For topologies with dynamic and static pipelines,
this will enable setting up only the static ones  during
topology loading. Reuse the sof_restore_pipelines() function for
this purpose and rename it to sof_set_up_pipelines().

Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
---
 sound/soc/sof/pm.c        |   2 +-
 sound/soc/sof/sof-audio.c |   2 +-
 sound/soc/sof/sof-audio.h |   2 +-
 sound/soc/sof/topology.c  | 282 ++++++--------------------------------
 4 files changed, 43 insertions(+), 245 deletions(-)

diff --git a/sound/soc/sof/pm.c b/sound/soc/sof/pm.c
index ce922227c4c6..ea27567d2fe4 100644
--- a/sound/soc/sof/pm.c
+++ b/sound/soc/sof/pm.c
@@ -157,7 +157,7 @@ static int sof_resume(struct device *dev, bool runtime_resume)
 	}
 
 	/* restore pipelines */
-	ret = sof_restore_pipelines(sdev->dev);
+	ret = sof_set_up_pipelines(sdev->dev);
 	if (ret < 0) {
 		dev_err(sdev->dev,
 			"error: failed to restore pipeline after resume %d\n",
diff --git a/sound/soc/sof/sof-audio.c b/sound/soc/sof/sof-audio.c
index b27760208a4b..4bed50847f1d 100644
--- a/sound/soc/sof/sof-audio.c
+++ b/sound/soc/sof/sof-audio.c
@@ -248,7 +248,7 @@ const struct sof_ipc_pipe_new *snd_sof_pipeline_find(struct snd_sof_dev *sdev,
 	return NULL;
 }
 
-int sof_restore_pipelines(struct device *dev)
+int sof_set_up_pipelines(struct device *dev)
 {
 	struct snd_sof_dev *sdev = dev_get_drvdata(dev);
 	struct snd_sof_widget *swidget;
diff --git a/sound/soc/sof/sof-audio.h b/sound/soc/sof/sof-audio.h
index fe997a80a847..f1f630028c21 100644
--- a/sound/soc/sof/sof-audio.h
+++ b/sound/soc/sof/sof-audio.h
@@ -242,7 +242,7 @@ int snd_sof_ipc_set_get_comp_data(struct snd_sof_control *scontrol,
 int sof_pcm_dai_link_fixup(struct snd_soc_pcm_runtime *rtd, struct snd_pcm_hw_params *params);
 
 /* PM */
-int sof_restore_pipelines(struct device *dev);
+int sof_set_up_pipelines(struct device *dev);
 void sof_tear_down_pipelines(struct device *dev);
 int sof_set_hw_params_upon_resume(struct device *dev);
 bool snd_sof_stream_suspend_ignored(struct snd_sof_dev *sdev);
diff --git a/sound/soc/sof/topology.c b/sound/soc/sof/topology.c
index 58f966ab2e81..b996b89f2920 100644
--- a/sound/soc/sof/topology.c
+++ b/sound/soc/sof/topology.c
@@ -1519,10 +1519,8 @@ static struct sof_ipc_comp *sof_comp_alloc(struct snd_sof_widget *swidget,
 static int sof_widget_load_dai(struct snd_soc_component *scomp, int index,
 			       struct snd_sof_widget *swidget,
 			       struct snd_soc_tplg_dapm_widget *tw,
-			       struct sof_ipc_comp_reply *r,
 			       struct snd_sof_dai *dai)
 {
-	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(scomp);
 	struct snd_soc_tplg_private *private = &tw->priv;
 	struct sof_ipc_comp_dai *comp_dai;
 	size_t ipc_size = sizeof(*comp_dai);
@@ -1559,10 +1557,7 @@ static int sof_widget_load_dai(struct snd_soc_component *scomp, int index,
 		swidget->widget->name, comp_dai->type, comp_dai->dai_index);
 	sof_dbg_comp_config(scomp, &comp_dai->config);
 
-	ret = sof_ipc_tx_message(sdev->ipc, comp_dai->comp.hdr.cmd,
-				 comp_dai, ipc_size, r, sizeof(*r));
-
-	if (ret == 0 && dai) {
+	if (dai) {
 		dai->scomp = scomp;
 
 		/*
@@ -1584,10 +1579,8 @@ static int sof_widget_load_dai(struct snd_soc_component *scomp, int index,
 
 static int sof_widget_load_buffer(struct snd_soc_component *scomp, int index,
 				  struct snd_sof_widget *swidget,
-				  struct snd_soc_tplg_dapm_widget *tw,
-				  struct sof_ipc_comp_reply *r)
+				  struct snd_soc_tplg_dapm_widget *tw)
 {
-	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(scomp);
 	struct snd_soc_tplg_private *private = &tw->priv;
 	struct sof_ipc_buffer *buffer;
 	int ret;
@@ -1619,15 +1612,7 @@ static int sof_widget_load_buffer(struct snd_soc_component *scomp, int index,
 
 	swidget->private = buffer;
 
-	ret = sof_ipc_tx_message(sdev->ipc, buffer->comp.hdr.cmd, buffer,
-				 sizeof(*buffer), r, sizeof(*r));
-	if (ret < 0) {
-		dev_err(scomp->dev, "error: buffer %s load failed\n",
-			swidget->widget->name);
-		kfree(buffer);
-	}
-
-	return ret;
+	return 0;
 }
 
 /* bind PCM ID to host component ID */
@@ -1656,10 +1641,8 @@ static int spcm_bind(struct snd_soc_component *scomp, struct snd_sof_pcm *spcm,
 static int sof_widget_load_pcm(struct snd_soc_component *scomp, int index,
 			       struct snd_sof_widget *swidget,
 			       enum sof_ipc_stream_direction dir,
-			       struct snd_soc_tplg_dapm_widget *tw,
-			       struct sof_ipc_comp_reply *r)
+			       struct snd_soc_tplg_dapm_widget *tw)
 {
-	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(scomp);
 	struct snd_soc_tplg_private *private = &tw->priv;
 	struct sof_ipc_comp_host *host;
 	size_t ipc_size = sizeof(*host);
@@ -1698,10 +1681,7 @@ static int sof_widget_load_pcm(struct snd_soc_component *scomp, int index,
 
 	swidget->private = host;
 
-	ret = sof_ipc_tx_message(sdev->ipc, host->comp.hdr.cmd, host,
-				 ipc_size, r, sizeof(*r));
-	if (ret >= 0)
-		return ret;
+	return 0;
 err:
 	kfree(host);
 	return ret;
@@ -1730,8 +1710,7 @@ int sof_load_pipeline_ipc(struct device *dev,
 
 static int sof_widget_load_pipeline(struct snd_soc_component *scomp, int index,
 				    struct snd_sof_widget *swidget,
-				    struct snd_soc_tplg_dapm_widget *tw,
-				    struct sof_ipc_comp_reply *r)
+				    struct snd_soc_tplg_dapm_widget *tw)
 {
 	struct snd_soc_tplg_private *private = &tw->priv;
 	struct sof_ipc_pipe_new *pipeline;
@@ -1786,10 +1765,7 @@ static int sof_widget_load_pipeline(struct snd_soc_component *scomp, int index,
 
 	swidget->private = pipeline;
 
-	/* send ipc's to create pipeline comp and power up schedule core */
-	ret = sof_load_pipeline_ipc(scomp->dev, pipeline, r);
-	if (ret >= 0)
-		return ret;
+	return 0;
 err:
 	kfree(pipeline);
 	return ret;
@@ -1801,10 +1777,8 @@ static int sof_widget_load_pipeline(struct snd_soc_component *scomp, int index,
 
 static int sof_widget_load_mixer(struct snd_soc_component *scomp, int index,
 				 struct snd_sof_widget *swidget,
-				 struct snd_soc_tplg_dapm_widget *tw,
-				 struct sof_ipc_comp_reply *r)
+				 struct snd_soc_tplg_dapm_widget *tw)
 {
-	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(scomp);
 	struct snd_soc_tplg_private *private = &tw->priv;
 	struct sof_ipc_comp_mixer *mixer;
 	size_t ipc_size = sizeof(*mixer);
@@ -1833,12 +1807,7 @@ static int sof_widget_load_mixer(struct snd_soc_component *scomp, int index,
 
 	swidget->private = mixer;
 
-	ret = sof_ipc_tx_message(sdev->ipc, mixer->comp.hdr.cmd, mixer,
-				 ipc_size, r, sizeof(*r));
-	if (ret < 0)
-		kfree(mixer);
-
-	return ret;
+	return 0;
 }
 
 /*
@@ -1846,10 +1815,8 @@ static int sof_widget_load_mixer(struct snd_soc_component *scomp, int index,
  */
 static int sof_widget_load_mux(struct snd_soc_component *scomp, int index,
 			       struct snd_sof_widget *swidget,
-			       struct snd_soc_tplg_dapm_widget *tw,
-			       struct sof_ipc_comp_reply *r)
+			       struct snd_soc_tplg_dapm_widget *tw)
 {
-	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(scomp);
 	struct snd_soc_tplg_private *private = &tw->priv;
 	struct sof_ipc_comp_mux *mux;
 	size_t ipc_size = sizeof(*mux);
@@ -1878,12 +1845,7 @@ static int sof_widget_load_mux(struct snd_soc_component *scomp, int index,
 
 	swidget->private = mux;
 
-	ret = sof_ipc_tx_message(sdev->ipc, mux->comp.hdr.cmd, mux,
-				 ipc_size, r, sizeof(*r));
-	if (ret < 0)
-		kfree(mux);
-
-	return ret;
+	return 0;
 }
 
 /*
@@ -1892,8 +1854,7 @@ static int sof_widget_load_mux(struct snd_soc_component *scomp, int index,
 
 static int sof_widget_load_pga(struct snd_soc_component *scomp, int index,
 			       struct snd_sof_widget *swidget,
-			       struct snd_soc_tplg_dapm_widget *tw,
-			       struct sof_ipc_comp_reply *r)
+			       struct snd_soc_tplg_dapm_widget *tw)
 {
 	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(scomp);
 	struct snd_soc_tplg_private *private = &tw->priv;
@@ -1953,10 +1914,7 @@ static int sof_widget_load_pga(struct snd_soc_component *scomp, int index,
 		}
 	}
 
-	ret = sof_ipc_tx_message(sdev->ipc, volume->comp.hdr.cmd, volume,
-				 ipc_size, r, sizeof(*r));
-	if (ret >= 0)
-		return ret;
+	return 0;
 err:
 	kfree(volume);
 	return ret;
@@ -1968,10 +1926,8 @@ static int sof_widget_load_pga(struct snd_soc_component *scomp, int index,
 
 static int sof_widget_load_src(struct snd_soc_component *scomp, int index,
 			       struct snd_sof_widget *swidget,
-			       struct snd_soc_tplg_dapm_widget *tw,
-			       struct sof_ipc_comp_reply *r)
+			       struct snd_soc_tplg_dapm_widget *tw)
 {
-	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(scomp);
 	struct snd_soc_tplg_private *private = &tw->priv;
 	struct sof_ipc_comp_src *src;
 	size_t ipc_size = sizeof(*src);
@@ -2010,10 +1966,7 @@ static int sof_widget_load_src(struct snd_soc_component *scomp, int index,
 
 	swidget->private = src;
 
-	ret = sof_ipc_tx_message(sdev->ipc, src->comp.hdr.cmd, src,
-				 ipc_size, r, sizeof(*r));
-	if (ret >= 0)
-		return ret;
+	return 0;
 err:
 	kfree(src);
 	return ret;
@@ -2025,10 +1978,8 @@ static int sof_widget_load_src(struct snd_soc_component *scomp, int index,
 
 static int sof_widget_load_asrc(struct snd_soc_component *scomp, int index,
 				struct snd_sof_widget *swidget,
-				struct snd_soc_tplg_dapm_widget *tw,
-				struct sof_ipc_comp_reply *r)
+				struct snd_soc_tplg_dapm_widget *tw)
 {
-	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(scomp);
 	struct snd_soc_tplg_private *private = &tw->priv;
 	struct sof_ipc_comp_asrc *asrc;
 	size_t ipc_size = sizeof(*asrc);
@@ -2069,10 +2020,7 @@ static int sof_widget_load_asrc(struct snd_soc_component *scomp, int index,
 
 	swidget->private = asrc;
 
-	ret = sof_ipc_tx_message(sdev->ipc, asrc->comp.hdr.cmd, asrc,
-				 ipc_size, r, sizeof(*r));
-	if (ret >= 0)
-		return ret;
+	return 0;
 err:
 	kfree(asrc);
 	return ret;
@@ -2084,10 +2032,8 @@ static int sof_widget_load_asrc(struct snd_soc_component *scomp, int index,
 
 static int sof_widget_load_siggen(struct snd_soc_component *scomp, int index,
 				  struct snd_sof_widget *swidget,
-				  struct snd_soc_tplg_dapm_widget *tw,
-				  struct sof_ipc_comp_reply *r)
+				  struct snd_soc_tplg_dapm_widget *tw)
 {
-	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(scomp);
 	struct snd_soc_tplg_private *private = &tw->priv;
 	struct sof_ipc_comp_tone *tone;
 	size_t ipc_size = sizeof(*tone);
@@ -2126,10 +2072,7 @@ static int sof_widget_load_siggen(struct snd_soc_component *scomp, int index,
 
 	swidget->private = tone;
 
-	ret = sof_ipc_tx_message(sdev->ipc, tone->comp.hdr.cmd, tone,
-				 ipc_size, r, sizeof(*r));
-	if (ret >= 0)
-		return ret;
+	return 0;
 err:
 	kfree(tone);
 	return ret;
@@ -2211,10 +2154,8 @@ static int sof_get_control_data(struct snd_soc_component *scomp,
 static int sof_process_load(struct snd_soc_component *scomp, int index,
 			    struct snd_sof_widget *swidget,
 			    struct snd_soc_tplg_dapm_widget *tw,
-			    struct sof_ipc_comp_reply *r,
 			    int type)
 {
-	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(scomp);
 	struct snd_soc_dapm_widget *widget = swidget->widget;
 	struct snd_soc_tplg_private *private = &tw->priv;
 	struct sof_ipc_comp_process *process;
@@ -2288,33 +2229,6 @@ static int sof_process_load(struct snd_soc_component *scomp, int index,
 
 	process->size = ipc_data_size;
 	swidget->private = process;
-
-	ret = sof_ipc_tx_message(sdev->ipc, process->comp.hdr.cmd, process,
-				 ipc_size, r, sizeof(*r));
-
-	if (ret < 0) {
-		dev_err(scomp->dev, "error: create process failed\n");
-		goto err;
-	}
-
-	/* we sent the data in single message so return */
-	if (ipc_data_size)
-		goto out;
-
-	/* send control data with large message supported method */
-	for (i = 0; i < widget->num_kcontrols; i++) {
-		wdata[i].control->readback_offset = 0;
-		ret = snd_sof_ipc_set_get_comp_data(wdata[i].control,
-						    wdata[i].ipc_cmd,
-						    wdata[i].ctrl_type,
-						    wdata[i].control->cmd,
-						    true);
-		if (ret != 0) {
-			dev_err(scomp->dev, "error: send control failed\n");
-			break;
-		}
-	}
-
 err:
 	if (ret < 0)
 		kfree(process);
@@ -2330,8 +2244,7 @@ static int sof_process_load(struct snd_soc_component *scomp, int index,
 
 static int sof_widget_load_process(struct snd_soc_component *scomp, int index,
 				   struct snd_sof_widget *swidget,
-				   struct snd_soc_tplg_dapm_widget *tw,
-				   struct sof_ipc_comp_reply *r)
+				   struct snd_soc_tplg_dapm_widget *tw)
 {
 	struct snd_soc_tplg_private *private = &tw->priv;
 	struct sof_ipc_comp_process config;
@@ -2357,8 +2270,7 @@ static int sof_widget_load_process(struct snd_soc_component *scomp, int index,
 	}
 
 	/* now load process specific data and send IPC */
-	ret = sof_process_load(scomp, index, swidget, tw, r,
-			       find_process_comp_type(config.type));
+	ret = sof_process_load(scomp, index, swidget, tw, find_process_comp_type(config.type));
 	if (ret < 0) {
 		dev_err(scomp->dev, "error: process loading failed\n");
 		return ret;
@@ -2407,8 +2319,6 @@ static int sof_widget_ready(struct snd_soc_component *scomp, int index,
 	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(scomp);
 	struct snd_sof_widget *swidget;
 	struct snd_sof_dai *dai;
-	struct sof_ipc_comp_reply reply;
-	struct snd_sof_control *scontrol;
 	struct sof_ipc_comp comp = {
 		.core = SOF_DSP_PRIMARY_CORE,
 	};
@@ -2425,7 +2335,6 @@ static int sof_widget_ready(struct snd_soc_component *scomp, int index,
 	swidget->id = w->id;
 	swidget->pipeline_id = index;
 	swidget->private = NULL;
-	memset(&reply, 0, sizeof(reply));
 
 	dev_dbg(scomp->dev, "tplg: ready widget id %d pipe %d type %d name : %s stream %s\n",
 		swidget->comp_id, index, swidget->id, tw->name,
@@ -2444,14 +2353,6 @@ static int sof_widget_ready(struct snd_soc_component *scomp, int index,
 
 	swidget->core = comp.core;
 
-	/* default is primary core, safe to call for already enabled cores */
-	ret = sof_core_enable(sdev, comp.core);
-	if (ret < 0) {
-		dev_err(scomp->dev, "error: enable core: %d\n", ret);
-		kfree(swidget);
-		return ret;
-	}
-
 	ret = sof_parse_tokens(scomp, &swidget->comp_ext, comp_ext_tokens,
 			       ARRAY_SIZE(comp_ext_tokens), tw->priv.array,
 			       le32_to_cpu(tw->priv.size));
@@ -2472,7 +2373,7 @@ static int sof_widget_ready(struct snd_soc_component *scomp, int index,
 			return -ENOMEM;
 		}
 
-		ret = sof_widget_load_dai(scomp, index, swidget, tw, &reply, dai);
+		ret = sof_widget_load_dai(scomp, index, swidget, tw, dai);
 		if (ret == 0) {
 			sof_connect_dai_widget(scomp, w, tw, dai);
 			list_add(&dai->list, &sdev->dai_list);
@@ -2482,47 +2383,40 @@ static int sof_widget_ready(struct snd_soc_component *scomp, int index,
 		}
 		break;
 	case snd_soc_dapm_mixer:
-		ret = sof_widget_load_mixer(scomp, index, swidget, tw, &reply);
+		ret = sof_widget_load_mixer(scomp, index, swidget, tw);
 		break;
 	case snd_soc_dapm_pga:
-		ret = sof_widget_load_pga(scomp, index, swidget, tw, &reply);
-		/* Find scontrol for this pga and set readback offset*/
-		list_for_each_entry(scontrol, &sdev->kcontrol_list, list) {
-			if (scontrol->comp_id == swidget->comp_id) {
-				scontrol->readback_offset = reply.offset;
-				break;
-			}
-		}
+		ret = sof_widget_load_pga(scomp, index, swidget, tw);
 		break;
 	case snd_soc_dapm_buffer:
-		ret = sof_widget_load_buffer(scomp, index, swidget, tw, &reply);
+		ret = sof_widget_load_buffer(scomp, index, swidget, tw);
 		break;
 	case snd_soc_dapm_scheduler:
-		ret = sof_widget_load_pipeline(scomp, index, swidget, tw, &reply);
+		ret = sof_widget_load_pipeline(scomp, index, swidget, tw);
 		break;
 	case snd_soc_dapm_aif_out:
 		ret = sof_widget_load_pcm(scomp, index, swidget,
-					  SOF_IPC_STREAM_CAPTURE, tw, &reply);
+					  SOF_IPC_STREAM_CAPTURE, tw);
 		break;
 	case snd_soc_dapm_aif_in:
 		ret = sof_widget_load_pcm(scomp, index, swidget,
-					  SOF_IPC_STREAM_PLAYBACK, tw, &reply);
+					  SOF_IPC_STREAM_PLAYBACK, tw);
 		break;
 	case snd_soc_dapm_src:
-		ret = sof_widget_load_src(scomp, index, swidget, tw, &reply);
+		ret = sof_widget_load_src(scomp, index, swidget, tw);
 		break;
 	case snd_soc_dapm_asrc:
-		ret = sof_widget_load_asrc(scomp, index, swidget, tw, &reply);
+		ret = sof_widget_load_asrc(scomp, index, swidget, tw);
 		break;
 	case snd_soc_dapm_siggen:
-		ret = sof_widget_load_siggen(scomp, index, swidget, tw, &reply);
+		ret = sof_widget_load_siggen(scomp, index, swidget, tw);
 		break;
 	case snd_soc_dapm_effect:
-		ret = sof_widget_load_process(scomp, index, swidget, tw, &reply);
+		ret = sof_widget_load_process(scomp, index, swidget, tw);
 		break;
 	case snd_soc_dapm_mux:
 	case snd_soc_dapm_demux:
-		ret = sof_widget_load_mux(scomp, index, swidget, tw, &reply);
+		ret = sof_widget_load_mux(scomp, index, swidget, tw);
 		break;
 	case snd_soc_dapm_switch:
 	case snd_soc_dapm_dai_link:
@@ -2533,12 +2427,12 @@ static int sof_widget_ready(struct snd_soc_component *scomp, int index,
 	}
 
 	/* check IPC reply */
-	if (ret < 0 || reply.rhdr.error < 0) {
+	if (ret < 0) {
 		dev_err(scomp->dev,
-			"error: DSP failed to add widget id %d type %d name : %s stream %s reply %d\n",
+			"error: failed to add widget id %d type %d name : %s stream %s\n",
 			tw->shift, swidget->id, tw->name,
 			strnlen(tw->sname, SNDRV_CTL_ELEM_ID_NAME_MAXLEN) > 0
-				? tw->sname : "none", reply.rhdr.error);
+				? tw->sname : "none");
 		kfree(swidget);
 		return ret;
 	}
@@ -2844,9 +2738,6 @@ static int sof_set_dai_config_multi(struct snd_sof_dev *sdev, u32 size,
 			continue;
 
 		if (strcmp(link->name, dai->name) == 0) {
-			struct sof_ipc_reply reply;
-			int ret;
-
 			/*
 			 * the same dai config will be applied to all DAIs in
 			 * the same dai link. We have to ensure that the ipc
@@ -2858,18 +2749,6 @@ static int sof_set_dai_config_multi(struct snd_sof_dev *sdev, u32 size,
 
 			dev_dbg(sdev->dev, "set DAI config for %s index %d\n",
 				dai->name, config[curr_conf].dai_index);
-			/* send message to DSP */
-			ret = sof_ipc_tx_message(sdev->ipc,
-						 config[curr_conf].hdr.cmd,
-						 &config[curr_conf], size,
-						 &reply, sizeof(reply));
-
-			if (ret < 0) {
-				dev_err(sdev->dev,
-					"error: failed to set DAI config for %s index %d\n",
-					dai->name, config[curr_conf].dai_index);
-				return ret;
-			}
 
 			dai->number_configs = num_conf;
 			dai->current_config = curr_conf;
@@ -3399,7 +3278,6 @@ static int sof_route_load(struct snd_soc_component *scomp, int index,
 	struct snd_sof_widget *source_swidget, *sink_swidget;
 	struct snd_soc_dobj *dobj = &route->dobj;
 	struct snd_sof_route *sroute;
-	struct sof_ipc_reply reply;
 	int ret = 0;
 
 	/* allocate memory for sroute and connect */
@@ -3474,36 +3352,11 @@ static int sof_route_load(struct snd_soc_component *scomp, int index,
 			route->source, route->sink);
 		goto err;
 	} else {
-		ret = sof_ipc_tx_message(sdev->ipc,
-					 connect->hdr.cmd,
-					 connect, sizeof(*connect),
-					 &reply, sizeof(reply));
-
-		/* check IPC return value */
-		if (ret < 0) {
-			dev_err(scomp->dev, "error: failed to add route sink %s control %s source %s\n",
-				route->sink,
-				route->control ? route->control : "none",
-				route->source);
-			goto err;
-		}
-
-		/* check IPC reply */
-		if (reply.error < 0) {
-			dev_err(scomp->dev, "error: DSP failed to add route sink %s control %s source %s result %d\n",
-				route->sink,
-				route->control ? route->control : "none",
-				route->source, reply.error);
-			ret = reply.error;
-			goto err;
-		}
-
 		sroute->route = route;
 		dobj->private = sroute;
 		sroute->private = connect;
 		sroute->src_widget = source_swidget;
 		sroute->sink_widget = sink_swidget;
-		sroute->setup = true;
 
 		/* add route to route list */
 		list_add(&sroute->list, &sdev->route_list);
@@ -3517,50 +3370,6 @@ static int sof_route_load(struct snd_soc_component *scomp, int index,
 	return ret;
 }
 
-/* Function to set the initial value of SOF kcontrols.
- * The value will be stored in scontrol->control_data
- */
-static int snd_sof_cache_kcontrol_val(struct snd_soc_component *scomp)
-{
-	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(scomp);
-	struct snd_sof_control *scontrol = NULL;
-	int ipc_cmd, ctrl_type;
-	int ret = 0;
-
-	list_for_each_entry(scontrol, &sdev->kcontrol_list, list) {
-
-		/* notify DSP of kcontrol values */
-		switch (scontrol->cmd) {
-		case SOF_CTRL_CMD_VOLUME:
-		case SOF_CTRL_CMD_ENUM:
-		case SOF_CTRL_CMD_SWITCH:
-			ipc_cmd = SOF_IPC_COMP_GET_VALUE;
-			ctrl_type = SOF_CTRL_TYPE_VALUE_CHAN_GET;
-			break;
-		case SOF_CTRL_CMD_BINARY:
-			ipc_cmd = SOF_IPC_COMP_GET_DATA;
-			ctrl_type = SOF_CTRL_TYPE_DATA_GET;
-			break;
-		default:
-			dev_err(scomp->dev,
-				"error: Invalid scontrol->cmd: %d\n",
-				scontrol->cmd);
-			return -EINVAL;
-		}
-		ret = snd_sof_ipc_set_get_comp_data(scontrol,
-						    ipc_cmd, ctrl_type,
-						    scontrol->cmd,
-						    false);
-		if (ret < 0) {
-			dev_warn(scomp->dev,
-				 "error: kcontrol value get for widget: %d\n",
-				 scontrol->comp_id);
-		}
-	}
-
-	return ret;
-}
-
 int snd_sof_complete_pipeline(struct device *dev,
 			      struct snd_sof_widget *swidget)
 {
@@ -3626,19 +3435,10 @@ static int sof_complete(struct snd_soc_component *scomp)
 	struct snd_sof_widget *swidget, *comp_swidget;
 	int ret;
 
-	/* some widget types require completion notificattion */
+	/* set the pipe_widget and apply the dynamic_pipeline_widget_flag */
 	list_for_each_entry(swidget, &sdev->widget_list, list) {
-		if (swidget->complete)
-			continue;
-
 		switch (swidget->id) {
 		case snd_soc_dapm_scheduler:
-			ret = snd_sof_complete_pipeline(scomp->dev, swidget);
-			if (ret < 0)
-				return ret;
-
-			swidget->complete = ret;
-
 			/*
 			 * Apply the dynamic_pipeline_widget flag and set the pipe_widget field
 			 * for all widgets that have the same pipeline ID as the scheduler widget
@@ -3654,11 +3454,9 @@ static int sof_complete(struct snd_soc_component *scomp)
 			break;
 		}
 	}
-	/*
-	 * cache initial values of SOF kcontrols by reading DSP value over
-	 * IPC. It may be overwritten by alsa-mixer after booting up
-	 */
-	return snd_sof_cache_kcontrol_val(scomp);
+
+	/* set up static pipelines */
+	return sof_set_up_pipelines(scomp->dev);
 }
 
 /* manifest - optional to inform component of manifest */
-- 
2.27.0

