Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D35AF40FA6A
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Sep 2021 16:39:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7A39417AB;
	Fri, 17 Sep 2021 16:39:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7A39417AB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1631889598;
	bh=JEqOQqsJxITVg5K9XGI6Yxc+Sf4rke8nuAsyB3zt/0M=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IcqKQx3a//DOounNf8tG1gWmijfjzAMAzjQp5MaEf9KDNBhGn5jOreXYSM9TwG1jQ
	 BzSZqwhPLjqr31xS9WxGNU1UN5WnppAoMk08YorLGl0BKAYDlqbpzTHsrNV7UHJdWp
	 E4dn23X77IGZo+V1Db2FJcW2sYJu2cbhyaUW56ys=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 82B51F804ED;
	Fri, 17 Sep 2021 16:37:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E5B2BF804F1; Fri, 17 Sep 2021 16:37:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 FORGED_SPF_HELO,MSGID_FROM_MTA_HEADER,SPF_HELO_PASS,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr140047.outbound.protection.outlook.com [40.107.14.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A0CB6F80113
 for <alsa-devel@alsa-project.org>; Fri, 17 Sep 2021 16:37:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A0CB6F80113
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=NXP1.onmicrosoft.com
 header.i=@NXP1.onmicrosoft.com header.b="ItQcOOou"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PCSAQydAdr/jC9pemAVdqr0uL2y8Z+5YkQNZAMgjpjTMnjJaawRr2NCyuJ908s8nGjHyfRaKBVkfGPqTTeDNf/jmu/u1q9h5xRFgi9eX5GyllH0F0YApvl+VREWwxxf/QpC3w02h+svSMXxs3RcmOjelFJpGpR8zjI4/Bu74LK+9Ieqe9vrytrMG6gMpPhSxTllxbskZ7kpISLnqIHlb1RLDL0/4nHNyhwo0/nQeYkqGX2CU+q+EQOC24pDsiD9H+vw+vhFZBPHV6Q5U/v1c5EPk6Is6iUGrueIsADRT3s+MBjZTV8nA57TFJCCJTSG+RAE1+ciYwqhShRjRjQwfgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=/8ZRI26j7frB2LCq91TGHoknL7MYtbwe3z9xQJFgv9c=;
 b=DB1A1NBkS4Xk/mOMxP3/iICsGNMtoAC/IQufeAAoqahp+Bo/68Fst/shJLc0ehzID+vepUGgdVFozQyMl9AjbYT2HWYlAttkmxiLfaDMZF1Qgco+I8Qv0swyP8D7jkxvHGGIBp7HLhJk3sfv4NHj9Q90x0gtQO1bgyWxa1H3tGr3vZDBPY3kd94ys0D/oLWALEQbEwPAaIarST4pliG/YbRxH9GuCr7GTgfpLJc0d2bpPviPGXvRsTyUntiyxF+Jpi04l4bPgWzNyICtxpghD7X7krStiJRS/f6VUvSwK2O8OZoWEm+gAAO+x8pOn+PdLZljzu/Tvi0YSAA4edDdQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/8ZRI26j7frB2LCq91TGHoknL7MYtbwe3z9xQJFgv9c=;
 b=ItQcOOoujCUZbNtkqkhQNg3Pb31sKwVDRiUVtD2g1G/se9Hh2xAIYwH3OG4HdeEHw0dCciajHz61ga1Awj2ILN+KPRtfQSk2ahbwWyz3XcW+/5Uc3IiXIuI5XCG7OGLjsqkxvC21pxYAW4oa2Npo5r1Z6G22xpUJHZUgGtgRPGE=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=oss.nxp.com;
Received: from AM0PR04MB5140.eurprd04.prod.outlook.com (2603:10a6:208:ca::21)
 by AM8PR04MB7409.eurprd04.prod.outlook.com (2603:10a6:20b:1c5::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.16; Fri, 17 Sep
 2021 14:37:22 +0000
Received: from AM0PR04MB5140.eurprd04.prod.outlook.com
 ([fe80::dd84:b996:1c8:705]) by AM0PR04MB5140.eurprd04.prod.outlook.com
 ([fe80::dd84:b996:1c8:705%6]) with mapi id 15.20.4523.016; Fri, 17 Sep 2021
 14:37:22 +0000
From: Daniel Baluta <daniel.baluta@oss.nxp.com>
To: broonie@kernel.org
Subject: [PATCH v2 03/12] ASoC: SOF: topology: Add new token for dynamic
 pipeline
Date: Fri, 17 Sep 2021 17:36:50 +0300
Message-Id: <20210917143659.401102-4-daniel.baluta@oss.nxp.com>
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
 Transport; Fri, 17 Sep 2021 14:37:21 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4b422785-96e1-4d17-ca76-08d979e8a8e7
X-MS-TrafficTypeDiagnostic: AM8PR04MB7409:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM8PR04MB74095904DBBF1BD7D2853FEDB8DD9@AM8PR04MB7409.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:826;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DtPjOsGHDOAqu2fxvW/7qtT64XiZJjank9ZyxHqPGYyy4YyCSAZLyndZty2+ZyKmqAuRu62Q9HaNY4QnfcGKw2S/Jf8/5havW5EpXa7DQgG9SFYM+lRxV+x9qtZwwI8HOthFBRC97AwTaVByy0Vpvj9sNFZmFqii4QtuL75VrDK4pqcTqAI6TB5jTZN4Ko182lDWgam5Kj36LIb340fSr1+Qdd+ilOhdZRAzGzGC8M7Vftd/VMwVEJS9t1cn75KCX7OopjnEigO2eCSANshRrObte+qrIT8r0zfTCWpLsr7nden/Cw8CLP2p05PWjC6ZNCOJLXUZn8HTYMa3Q3bH3QBvHEWDEcwKj2f2iPnhzycR33jT9jz/btR/zN5js/btRI6WjUHluO3xmKgxs+H/s2rUpPOKKVjKU6Hz79q6mF4VCKjq7tuer7MlIXKh5wIPbRV0okQOSS3iAYpi9EQYAGbQraBTBEqESlrnDfOMJCahonUyFiPbzpuK6q7NEmWNSoVVqgDuDYGB7POAqBX5BhWWXSHA6eHeRiAXQY2Lico0NQZTkP6xp8XBfvP5kiYx6Qslt+UYqX+Bjhlyc5ru4+XdfhXqL5GuVRdq+GHGea8o+2UKZEHngIUc4TmUDS29oh0DsxREob0ycCsoTwIRow==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM0PR04MB5140.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(376002)(136003)(366004)(396003)(39860400002)(5660300002)(8676002)(2906002)(4326008)(38100700002)(8936002)(66476007)(44832011)(1076003)(6666004)(86362001)(66556008)(6512007)(186003)(478600001)(316002)(6486002)(2616005)(6506007)(52116002)(6916009)(66946007)(83380400001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?DgeX41P9yR2DSe/FsfyUec6vSg13Bq1Ny7mucsHgNxOtUEvNSNiY4Au5Eu3B?=
 =?us-ascii?Q?/YzyiV2nQRjw0utKhiRnMTaEW65BSljxX0ZvyDyKVnOY+NLkUPVAEN0F0/7s?=
 =?us-ascii?Q?IlMHNO77ufE7XunMsSdSnAcWQDUUZV6JTIkIJl6yvpKPYxa5RR3rI2H3/FZS?=
 =?us-ascii?Q?ItNqEDn/5z00L2GXBIBS4iBZxE5wt8NeF/1eNligIqMYg/prCbTrqTR4akRj?=
 =?us-ascii?Q?UUemw8zvn6tq7F2ElzmUz+LgUoZFU997pM6DF86wmujPTNrFPdTouZCt9ado?=
 =?us-ascii?Q?V2Dzp+hXNxKdCK53b/netbtGgvYHpjQRqnbledF9uiVa+tl17Z3iDXaNP/b1?=
 =?us-ascii?Q?klWjyPTtW8UR0jNkoKOK60/sRrg68KUeHcaxQ4371gR/KkGgJYbUauXe2h2g?=
 =?us-ascii?Q?vkO/XTcrJHg3U8O5dtnJWwfOm9kG0XDRT9Yukj4hCXmPs5IalHauB5AwVATJ?=
 =?us-ascii?Q?2I33iviG89V/FdmCYjUz0igDosrqaCIj6tEueIHx5Rc5Fp5CFFyyI+Igxuew?=
 =?us-ascii?Q?RU51jjYIeFJUlaJTfhFRzOl7k0VSTaHtIfdocHcn7Dytn6PiLN4n49x7//a8?=
 =?us-ascii?Q?1NJG5YJpzUtZMUCN9XbEpdj+uGaaHSnhVQpDFq4ygVs0joyCu6rQqB8tnuHm?=
 =?us-ascii?Q?TeANUumczun2QAE1Z0rG7C70btHq24FFcN3KD3jHiHEsZtGUg2HW9OaWunzn?=
 =?us-ascii?Q?dx0EuB2y2K+sYhgUe6Rt7sfIh6uMYajCQAJCi9XQgl9oEjBdAuoPaWpkaAqf?=
 =?us-ascii?Q?fMsSkG4hoT+PAuxBVhUWnV9j8acOMUitz1Yed0o5MLGbnUB4iNHVhJEg1RiA?=
 =?us-ascii?Q?yHDpjuAN0/L1F9Smo22hofIS6OQVYxmSWxKghmJ8ztfIVe6EFiljarc7aZjm?=
 =?us-ascii?Q?RLSIFcKyHaGmenBtzlitNgK8ykmL1fNBMWzKY9hqUSZGcVDGNvUWpN10i2Iw?=
 =?us-ascii?Q?Fb5HP/eJsrSsK36PLFOPeGgwnTK52UWjJ4GiCXZNYB5/qZuyJXLIs61P70od?=
 =?us-ascii?Q?y2KKmMppWEFtdZ6t/zxSOs7d0eppQutd3uRG/rsVC7R1uT51gbq+hzojwLxY?=
 =?us-ascii?Q?VwVqG08BW6xjrMj2BmAHQMh65vXJY2r/MbFZZx4DBF/0S9wl+OzEwzwGrBwe?=
 =?us-ascii?Q?cOvZMhStnl7g+5VCLrm9xwEcfvZ9Uio1ucmrNDKKN4M5AaaKFLqlDBPxQduy?=
 =?us-ascii?Q?EMGXDt1HtuM2a60iNq4Lz5hrC9bPoxvWTAtUR+bjV4B/tiuTgL/DrmhRpD08?=
 =?us-ascii?Q?vfiXzH3MWjAK8/p6in97jlxTSv+ZxuEj7Zg9ToAcU0kc15A4LOEkkQ9P9/EY?=
 =?us-ascii?Q?VSsT0GL6TO9tjoGFAqFkm6snGDwpOcb5CIrShYQ9BO4VZxLivVWDGViMKnsK?=
 =?us-ascii?Q?407+JQSCC73ahy5iBOdBdykl3+V5?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b422785-96e1-4d17-ca76-08d979e8a8e7
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB5140.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2021 14:37:22.5091 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lqLc77hGz4Z1TvRmZxJUM73v6lR4w99oPXac5NhhWfUapuBMMzyYPxDXCgnwscrVP6FRDVFpso4AqbNWzhSTzw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7409
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

Today, we set up all widgets required for all PCM streams
at the time of topology parsing even if they are not
used. An optimization would be to only set up the widgets
required for currently active PCM streams. This would give
the FW the opportunity to power gate unused memory blocks,
thereby saving power.

For dynamic pipelines, the widgets in the connected DAPM path
for each PCM will need to be set up at runtime. This patch
introduces a new token, DYNAMIC_PIPELINE, for scheduler type
widgets that indicate whether a pipeline should be set up
statically during topology load or at runtime when the PCM is
opened. Introduce a new field called dynamic_pipeline_widget
in struct snd_sof_widget to save the value of the parsed token.

The token is set only for the pipeline (scheduler type)
widget and must be propagated to all widgets in the same
pipeline during topology load. Introduce another field called
pipe_widget in struct snd_sof_widget that saves the pointer to
the scheduler widget with the same pipeline ID as that of the
widget. This field is populated when the pipeline completion
callback is invoked during topology loading.

Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
---
 include/uapi/sound/sof/tokens.h |  1 +
 sound/soc/sof/sof-audio.h       | 13 +++++++
 sound/soc/sof/topology.c        | 62 ++++++++++++++++++++++++++++++++-
 3 files changed, 75 insertions(+), 1 deletion(-)

diff --git a/include/uapi/sound/sof/tokens.h b/include/uapi/sound/sof/tokens.h
index a642bf30c027..02b71a8deea4 100644
--- a/include/uapi/sound/sof/tokens.h
+++ b/include/uapi/sound/sof/tokens.h
@@ -51,6 +51,7 @@
 #define SOF_TKN_SCHED_CORE			203
 #define SOF_TKN_SCHED_FRAMES			204
 #define SOF_TKN_SCHED_TIME_DOMAIN		205
+#define SOF_TKN_SCHED_DYNAMIC_PIPELINE		206
 
 /* volume */
 #define SOF_TKN_VOLUME_RAMP_STEP_TYPE		250
diff --git a/sound/soc/sof/sof-audio.h b/sound/soc/sof/sof-audio.h
index 78a4a0c90a29..4a1c38c5618d 100644
--- a/sound/soc/sof/sof-audio.h
+++ b/sound/soc/sof/sof-audio.h
@@ -81,6 +81,8 @@ struct snd_sof_control {
 	bool comp_data_dirty;
 };
 
+struct snd_sof_widget;
+
 /* ASoC SOF DAPM widget */
 struct snd_sof_widget {
 	struct snd_soc_component *scomp;
@@ -90,8 +92,19 @@ struct snd_sof_widget {
 	int core;
 	int id;
 
+	/*
+	 * Flag indicating if the widget should be set up dynamically when a PCM is opened.
+	 * This flag is only set for the scheduler type widget in topology. During topology
+	 * loading, this flag is propagated to all the widgets belonging to the same pipeline.
+	 * When this flag is not set, a widget is set up at the time of topology loading
+	 * and retained until the DSP enters D3. It will need to be set up again when resuming
+	 * from D3.
+	 */
+	bool dynamic_pipeline_widget;
+
 	struct snd_soc_dapm_widget *widget;
 	struct list_head list;	/* list in sdev widget list */
+	struct snd_sof_widget *pipe_widget;
 
 	/* extended data for UUID components */
 	struct sof_ipc_comp_ext comp_ext;
diff --git a/sound/soc/sof/topology.c b/sound/soc/sof/topology.c
index d8f7b1edefc3..60d1db6a9193 100644
--- a/sound/soc/sof/topology.c
+++ b/sound/soc/sof/topology.c
@@ -572,6 +572,12 @@ static const struct sof_topology_token sched_tokens[] = {
 		offsetof(struct sof_ipc_pipe_new, time_domain), 0},
 };
 
+static const struct sof_topology_token pipeline_tokens[] = {
+	{SOF_TKN_SCHED_DYNAMIC_PIPELINE, SND_SOC_TPLG_TUPLE_TYPE_BOOL, get_token_u16,
+		offsetof(struct snd_sof_widget, dynamic_pipeline_widget), 0},
+
+};
+
 /* volume */
 static const struct sof_topology_token volume_tokens[] = {
 	{SOF_TKN_VOLUME_RAMP_STEP_TYPE, SND_SOC_TPLG_TUPLE_TYPE_WORD,
@@ -1765,6 +1771,15 @@ static int sof_widget_load_pipeline(struct snd_soc_component *scomp, int index,
 		goto err;
 	}
 
+	ret = sof_parse_tokens(scomp, swidget, pipeline_tokens,
+			       ARRAY_SIZE(pipeline_tokens), private->array,
+			       le32_to_cpu(private->size));
+	if (ret != 0) {
+		dev_err(scomp->dev, "error: parse dynamic pipeline token failed %d\n",
+			private->size);
+		goto err;
+	}
+
 	dev_dbg(scomp->dev, "pipeline %s: period %d pri %d mips %d core %d frames %d\n",
 		swidget->widget->name, pipeline->period, pipeline->priority,
 		pipeline->period_mips, pipeline->core, pipeline->frames_per_sched);
@@ -3567,11 +3582,45 @@ int snd_sof_complete_pipeline(struct device *dev,
 	return 1;
 }
 
+/**
+ * sof_set_pipe_widget - Set pipe_widget for a component
+ * @sdev: pointer to struct snd_sof_dev
+ * @pipe_widget: pointer to struct snd_sof_widget of type snd_soc_dapm_scheduler
+ * @swidget: pointer to struct snd_sof_widget that has the same pipeline ID as @pipe_widget
+ *
+ * Return: 0 if successful, -EINVAL on error.
+ * The function checks if @swidget is associated with any volatile controls. If so, setting
+ * the dynamic_pipeline_widget is disallowed.
+ */
+static int sof_set_pipe_widget(struct snd_sof_dev *sdev, struct snd_sof_widget *pipe_widget,
+			       struct snd_sof_widget *swidget)
+{
+	struct snd_sof_control *scontrol;
+
+	if (pipe_widget->dynamic_pipeline_widget) {
+		/* dynamic widgets cannot have volatile kcontrols */
+		list_for_each_entry(scontrol, &sdev->kcontrol_list, list)
+			if (scontrol->comp_id == swidget->comp_id &&
+			    (scontrol->access & SNDRV_CTL_ELEM_ACCESS_VOLATILE)) {
+				dev_err(sdev->dev,
+					"error: volatile control found for dynamic widget %s\n",
+					swidget->widget->name);
+				return -EINVAL;
+			}
+	}
+
+	/* set the pipe_widget and apply the dynamic_pipeline_widget_flag */
+	swidget->pipe_widget = pipe_widget;
+	swidget->dynamic_pipeline_widget = pipe_widget->dynamic_pipeline_widget;
+
+	return 0;
+}
+
 /* completion - called at completion of firmware loading */
 static int sof_complete(struct snd_soc_component *scomp)
 {
 	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(scomp);
-	struct snd_sof_widget *swidget;
+	struct snd_sof_widget *swidget, *comp_swidget;
 	int ret;
 
 	/* some widget types require completion notificattion */
@@ -3586,6 +3635,17 @@ static int sof_complete(struct snd_soc_component *scomp)
 				return ret;
 
 			swidget->complete = ret;
+
+			/*
+			 * Apply the dynamic_pipeline_widget flag and set the pipe_widget field
+			 * for all widgets that have the same pipeline ID as the scheduler widget
+			 */
+			list_for_each_entry_reverse(comp_swidget, &sdev->widget_list, list)
+				if (comp_swidget->pipeline_id == swidget->pipeline_id) {
+					ret = sof_set_pipe_widget(sdev, swidget, comp_swidget);
+					if (ret < 0)
+						return ret;
+				}
 			break;
 		default:
 			break;
-- 
2.27.0

