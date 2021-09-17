Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 82B4B40FA7B
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Sep 2021 16:41:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1C2C81786;
	Fri, 17 Sep 2021 16:40:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1C2C81786
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1631889669;
	bh=p0fyzhAS9UDqB8CmV8rZsnf/XSWb8WVr6oGaPEKkRdE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gZTu/RTsGknspZAakVcQsGaWJ5SxYQx+/wwomUaOcqktcnS3zLryy0KzttYv+PUdE
	 V/o6i2OTzYM7TgbyAwxW1RXeW+SUfVM67Ly0VTu3BjdDsqKQmzVaWIHZJ0j01Qe03P
	 7IM8RMlwdqJojpR+GWceibCKRSySFrTFtQMhldCI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A7788F804E7;
	Fri, 17 Sep 2021 16:37:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 79886F804FB; Fri, 17 Sep 2021 16:37:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 MSGID_FROM_MTA_HEADER, SPF_HELO_NONE, SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2077.outbound.protection.outlook.com [40.107.21.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CFD8CF804E1
 for <alsa-devel@alsa-project.org>; Fri, 17 Sep 2021 16:37:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CFD8CF804E1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=NXP1.onmicrosoft.com
 header.i=@NXP1.onmicrosoft.com header.b="iA1jga7D"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=edDvYCixkswOXqYnfnOeI+dn86GNZprgd2yEwwfjDJ3gii94t9eQDk3x3eofZIirN3xpkvyrOBwrZbimsO7qrsA+lJKfMBAnCgHq0DfJC2BEwTfHMmzALVHn12t+VLSoz2l3PiidBtYgZIB8P2txdHwHn/dg1u2z99DpiMLVJNs5xlq7DhtY4kOlRm72KbHtJQBSeDIncO11jGLNy9hnzhhuwnS8lgvU9Pjv7U7Z3d08g2HiZBbzzhhMbXGH/N95G+VrlvtWAEbNP2+M04JrXfIim9vADX6Y5esFLKpTV2EUtItGfT+hQzJ5xnKwlIlt8ro8i4UcF/e/p3DM4LDzig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=/WQF2bPasBjmZtKnQOGWqlmnVQAyJI9j48QoiDMqmL4=;
 b=GvQszmZ1XbZqD/Fng0w4C9plZ3TbQtU3F/MsS4I5uRbQrIgKkbSbW3boCrkIwsLOJLi0gYIjZEKLhSYMozfh8vsZqQOnC/ybnOKNBjJjQjspHjaFYh1tV+m80T1iPClWAtYQe534M9VgW7h611dDSPDSKdbdfGMf0vMnQQD6N7oUPyJiDat6Ip2ETRU8oyeqPs6ojElj2gKL2aBWOe117GGh7tEGCiKxWbQUVzD3/lit6WS9kUqqadxNGG+ykjoReDQt5pVPsQNiOQO+Ez+h6wzBhW6uNC7Yv2+3pG7SwmekQolaik+jIsIBaAtyfPAXZqqA+Dsp7BlVGPTWqPjjJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/WQF2bPasBjmZtKnQOGWqlmnVQAyJI9j48QoiDMqmL4=;
 b=iA1jga7D2bdSMwXtxyznqMioZCOTEYAODUaCx1hSMpEgAZeLivD1fWEj7+ZstMZUis88zeOhkqS8fJD/dDBEBPDru82vhmRDkm1iXiWKveleTeELY3q+taAs16Lul1BXH4mibBhpkz/7fKegBKw5E0Z9wOS5yzJd9oeIET/vmTw=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=oss.nxp.com;
Received: from AM0PR04MB5140.eurprd04.prod.outlook.com (2603:10a6:208:ca::21)
 by AM0PR0402MB3506.eurprd04.prod.outlook.com (2603:10a6:208:17::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14; Fri, 17 Sep
 2021 14:37:26 +0000
Received: from AM0PR04MB5140.eurprd04.prod.outlook.com
 ([fe80::dd84:b996:1c8:705]) by AM0PR04MB5140.eurprd04.prod.outlook.com
 ([fe80::dd84:b996:1c8:705%6]) with mapi id 15.20.4523.016; Fri, 17 Sep 2021
 14:37:26 +0000
From: Daniel Baluta <daniel.baluta@oss.nxp.com>
To: broonie@kernel.org
Subject: [PATCH v2 06/12] ASoC: SOF: Add new fields to snd_sof_route
Date: Fri, 17 Sep 2021 17:36:53 +0300
Message-Id: <20210917143659.401102-7-daniel.baluta@oss.nxp.com>
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
 Transport; Fri, 17 Sep 2021 14:37:25 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bdec497e-7d66-4b27-e5af-08d979e8ab00
X-MS-TrafficTypeDiagnostic: AM0PR0402MB3506:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM0PR0402MB3506E14EC5288A2456A7CB15B8DD9@AM0PR0402MB3506.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cuejlCgO5LLgcg8aCBDObKG/YEuWEAguqJq7hNjwKQgJK+bhc38xNpy3eQBRgbPLdRbr65ycYW0R7/ilbrayQZALrhFkJIoodcyp7rDt6eczapyVIzzo/1J3tJT4SkbFQKuAH0PBuBxl/uGhW7E/Gle7W6zaAfE1aTOeuUlMCQgEQ7olMg1BtqOiYYrj7gw244LhOwsyJXsuvGiP1BAmaYvvzu6YiEu4NYvTLp61+74onQJm5hGV8jRvqe+rBaH8Ab/JF846svhtdE+5PfxVWGHBW3m1MYZO82bdo9bQwFs+qm0YbtEa1Hsrd3RqvyVhHmhpHNZQXpzdMyqTLONrpyMidbzHeCokYX3myCi4oO/CB/jWK0FcU09SGWyURGSrSVCIqp4G7NtwpLRRqXHLC5HSBgjNWvbOZNaBKGa4LSL7uYd48TF2jpkODPwY5c+BpHmG1JADTcm23ersgboTwbVJwk5Vjn1Azd1VYlh9OPyCvjuFfMLqbT1Y6ftEtQ7uHmrLenQaGlnzXOFQ7eea9ETxG7Vst3c+i8goikovH8OiMljGfORXiXmchdMSz+eEpPm3Cbx2S9/hbFRS+65/g1vX7OXvVKWbeZS3hnEE9qlOCbik+Yq0E+GtHieabuuQE1EQqEXGEFli4DtUjia3Sw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM0PR04MB5140.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(396003)(39860400002)(136003)(366004)(376002)(186003)(316002)(1076003)(66476007)(2906002)(6486002)(5660300002)(38100700002)(2616005)(86362001)(83380400001)(44832011)(478600001)(4326008)(52116002)(6506007)(6666004)(8936002)(6512007)(66946007)(6916009)(8676002)(66556008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?d+zd+WvhStVe01M83JJpnV2atmwf0MIzkcktxwtq746QY/HoJwLAZdylp2IA?=
 =?us-ascii?Q?NRFcCcOZRwvJARnZbATTsSddD+QBaJ+q03Y4HgZwqpEN3n2kuVT8c0iFyI4J?=
 =?us-ascii?Q?rt/8eTd0cdJJWicQsVKvAQ9Xh5WCWsm4ISKk645lRXtRBOPC9NQ84HldAtFy?=
 =?us-ascii?Q?ZQHoMq5UKXs1C+EWGfyw25+EOOIwlcF8alKv5lOyfZei4w4uIi08VKi3GscC?=
 =?us-ascii?Q?xoCs6ilWkkC9JoV6IUPWXLGY1iXwW0/JcF7Ns55f4OHYa2kPqsqWR2tduu/Y?=
 =?us-ascii?Q?1WgYIYhF4kErseHvB29EJMHL2+V8L/18FxyxtfopGAzN+uUirOsH9TJBUXFY?=
 =?us-ascii?Q?RQplj14CUmMSz4j5MhvUtCVXBqX698PowWndpV9g93UGeD3nGuMaV5g/QfhJ?=
 =?us-ascii?Q?7TYBS6iWaQVZeXoZeuk5dUxddCimoh6BFLmDtpVko55HrilOFh3krJkxIWNN?=
 =?us-ascii?Q?s3j+7tvp/LhTlEFoDZmy7hqayyAFsJDYwRQAEDbFBeMgm/GWf5bmKv5rc3HQ?=
 =?us-ascii?Q?9qdDKYYC2fvwsrVfHNZFPDKUC6mebG9ejuyUy2WPips5iQIg5D2M1/Sly5ND?=
 =?us-ascii?Q?cA8e+lOCFMrbFNWKrjiAGCljXMZ4Qw8u+qtJcTgabyND4RSfiEzWcvxLEpSX?=
 =?us-ascii?Q?StMsda9Lb3zk03YrW1qmpbvtQVhfnFnAX6FKZi42GI4ngGw0NoIZTG0i2vYo?=
 =?us-ascii?Q?bnpZMZ3bgMQ0asjmRBts4cr+ffgOnVfkJsef54PT2aXdkGIy2z4s255FtCzS?=
 =?us-ascii?Q?xyFM+iR6GH4RCiKF1yPMdbKN2DYkSuZMWlg7rRbGgiCFqbXqra0nQStYWboz?=
 =?us-ascii?Q?HQaUeCpzDVV7R5Tfalc7NKXOvgFbCRPqxTWPnTiKj3ROj9VFt9ELuBtkbvqk?=
 =?us-ascii?Q?sGF+LF8gR7G5NljylH3o994Qm0Yx6kuJTHfxHLm8kcq1C0a5GxYZooXAOYJK?=
 =?us-ascii?Q?aQUQrd+Pycxq6pxkvwOYbyBP9uRY8572H/fkP5V/oCljfJYD5zqb4mbaBOFE?=
 =?us-ascii?Q?aqObghbN8QsQYBB+zfMFULW+pNIqzfnzbkrdVxKiFFGxjr6+VHHU9SlMTqdw?=
 =?us-ascii?Q?YAhQU0QdIjdDz2tC+Em0YJwfwaI3VCweT/G3/YHAXWJsN/wm6guU3Pre/IRx?=
 =?us-ascii?Q?yHThIQg3R7eXPk7qGHyaLDEOXg+WzfGJYYoGZZ1ndGbsrDSA1C9SeFkhpEG0?=
 =?us-ascii?Q?loWm5sIjf3RS4+SVCm5Oz35xblDFxPuhHsJDdIiyiCtmKvgEogSM44UhfKzd?=
 =?us-ascii?Q?InEQx2rDA8XAZDemZyRX+NCu/YIw7aZQYNj6Qfp70OpDWJFAlEUIoSyyA/ug?=
 =?us-ascii?Q?3ibsWlXSxQaRV9KHaogxJRzMdqIFGRP4ogAXGPomuCPqG9MUVz0dgRLKDI4x?=
 =?us-ascii?Q?OMLPDc/rnyHrwGPjFrElDj1RGDES?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bdec497e-7d66-4b27-e5af-08d979e8ab00
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB5140.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2021 14:37:26.0270 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pyYLBYpAVwJv4VKd7wkbOzpx0/xAEvZOy7i4osNZKxajjtZUsC7WMNM4UBXi5DkwKU7wJ+7JjZ8tyIXi+nzdwQ==
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

Add two new fields to save the source widget and sink widget
pointers in struct snd_sof_route to make it easier to look up
routes by source/sink widget. Also, add a flag to indicate
if the route has been set up in the DSP. These will be used
when the dynamic pipeline feature is implemented and routes
will have to be set up at run time.

Also, add a new sof_tear_down_pipelines() callback, that will
used to reset the set up status for all routes during suspend.

Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
---
 sound/soc/sof/pm.c        |  2 ++
 sound/soc/sof/sof-audio.c | 15 +++++++++++++++
 sound/soc/sof/sof-audio.h |  4 ++++
 sound/soc/sof/topology.c  |  3 +++
 4 files changed, 24 insertions(+)

diff --git a/sound/soc/sof/pm.c b/sound/soc/sof/pm.c
index c83fb6255961..ce922227c4c6 100644
--- a/sound/soc/sof/pm.c
+++ b/sound/soc/sof/pm.c
@@ -208,6 +208,8 @@ static int sof_suspend(struct device *dev, bool runtime_suspend)
 	if (target_state == SOF_DSP_PM_D0)
 		goto suspend;
 
+	sof_tear_down_pipelines(dev);
+
 	/* release trace */
 	snd_sof_release_trace(sdev);
 
diff --git a/sound/soc/sof/sof-audio.c b/sound/soc/sof/sof-audio.c
index a4b9bb99bced..b52a453ae9d7 100644
--- a/sound/soc/sof/sof-audio.c
+++ b/sound/soc/sof/sof-audio.c
@@ -276,6 +276,7 @@ int sof_restore_pipelines(struct device *dev)
 
 			return ret;
 		}
+		sroute->setup = true;
 	}
 
 	/* restore dai links */
@@ -317,6 +318,20 @@ int sof_restore_pipelines(struct device *dev)
 	return ret;
 }
 
+/* This function doesn't free widgets. It only resets the set up status for all routes */
+void sof_tear_down_pipelines(struct device *dev)
+{
+	struct snd_sof_dev *sdev = dev_get_drvdata(dev);
+	struct snd_sof_route *sroute;
+
+	/*
+	 * No need to protect sroute->setup as this function is called only during the suspend
+	 * callback and all streams should be suspended by then
+	 */
+	list_for_each_entry(sroute, &sdev->route_list, list)
+		sroute->setup = false;
+}
+
 /*
  * Generic object lookup APIs.
  */
diff --git a/sound/soc/sof/sof-audio.h b/sound/soc/sof/sof-audio.h
index 4a1c38c5618d..fe997a80a847 100644
--- a/sound/soc/sof/sof-audio.h
+++ b/sound/soc/sof/sof-audio.h
@@ -118,6 +118,9 @@ struct snd_sof_route {
 
 	struct snd_soc_dapm_route *route;
 	struct list_head list;	/* list in sdev route list */
+	struct snd_sof_widget *src_widget;
+	struct snd_sof_widget *sink_widget;
+	bool setup;
 
 	void *private;
 };
@@ -240,6 +243,7 @@ int sof_pcm_dai_link_fixup(struct snd_soc_pcm_runtime *rtd, struct snd_pcm_hw_pa
 
 /* PM */
 int sof_restore_pipelines(struct device *dev);
+void sof_tear_down_pipelines(struct device *dev);
 int sof_set_hw_params_upon_resume(struct device *dev);
 bool snd_sof_stream_suspend_ignored(struct snd_sof_dev *sdev);
 bool snd_sof_dsp_only_d0i3_compatible_stream_active(struct snd_sof_dev *sdev);
diff --git a/sound/soc/sof/topology.c b/sound/soc/sof/topology.c
index 60d1db6a9193..58f966ab2e81 100644
--- a/sound/soc/sof/topology.c
+++ b/sound/soc/sof/topology.c
@@ -3501,6 +3501,9 @@ static int sof_route_load(struct snd_soc_component *scomp, int index,
 		sroute->route = route;
 		dobj->private = sroute;
 		sroute->private = connect;
+		sroute->src_widget = source_swidget;
+		sroute->sink_widget = sink_swidget;
+		sroute->setup = true;
 
 		/* add route to route list */
 		list_add(&sroute->list, &sdev->route_list);
-- 
2.27.0

