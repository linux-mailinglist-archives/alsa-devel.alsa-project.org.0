Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 93DD540D850
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Sep 2021 13:19:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3006D189A;
	Thu, 16 Sep 2021 13:18:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3006D189A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1631791155;
	bh=p0bmxiDjoLX+FFsnMPt6ZhPkbosmWKqugGFN2Yfmtfw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Yt3ejwWTID6YT2zv3adrZGefP7KbMhRsWunMZwHPjEVYK+IxtxO1EHGsBNqgJDVuj
	 3/6wLXepVRnvE68ZCO7t2cOOakRhxO5Bq24IcHP80wcIKZ5eBRbk22Z8z8uaOdENcx
	 oK7dZfUfHiG89ainkmb2brzyN7MWY359aVnFg9Qs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7A61BF804FF;
	Thu, 16 Sep 2021 13:17:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 36D82F804E5; Thu, 16 Sep 2021 13:17:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 MSGID_FROM_MTA_HEADER, SPF_HELO_NONE, SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr50050.outbound.protection.outlook.com [40.107.5.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 42B89F8025E
 for <alsa-devel@alsa-project.org>; Thu, 16 Sep 2021 13:17:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 42B89F8025E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=NXP1.onmicrosoft.com
 header.i=@NXP1.onmicrosoft.com header.b="A0Evo2wt"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WfmJ87fOyMAazo/rvrGl5oEkC4T5AirECQirGXq+AqJvuHuC7ak2p0qoqGMpBhFvSAb4blfAtspvCoMRUzcmlu3bnSyvFsXvK88wgvp6qDQkEpvd0TDQV3wV+xe9tW0bpyY6XVS7Q29PbKyEeN/ntkSVazneQT6gU7iEY35RUvc498UhcZQpG4UiILqTKkKOOPDnIC7cez0kdbGNFoiB6aN1SWcseQKbKQM7H7JucsScle3/k19APsXIGQKuyW3EVs7Be0T3Ji9NCzGBuTtrr0A/HvEH6r7TqXYwY2D7f0wFH/bBAR+DrUjY8+NDUhp0nBFqP0c5G6hLypxOOTd9Ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=gyQXmCoYlPRtflYEvYyHscr0QIizGnIzCCCDHf3TuTo=;
 b=n5tgDoC0K+gkGln3O4nQBTtvroORqnvw2CWf6G+PyBDK+mF+kUZ+UjPvgHBKeWL0mzlqB61oiXSxMLrrZnyEnWlbAW7Zq59z1bFeDPvYrQLwE2TE1BhZ4xLtpHUVkYUiKz+0YNsXSVnxrGkglz0ORTcpWjNS3OxOa7GBybcdH4r6F9YGDKgtrJD6sDPXpZyVLw7O5LmjAgsq2O1q3gUhr/yXBomQM97g0zdoKed53QmbyNIs+rCI2100w3efAPNLDG9TQqlctosj70VKQ0JnaGRt/eMHOi1RBHlN3Ze4wSLJiM2d1fV1wUHq6W0Ew9PNk3bMifivhdrbNskCQnTWUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gyQXmCoYlPRtflYEvYyHscr0QIizGnIzCCCDHf3TuTo=;
 b=A0Evo2wttVaGbukPTVm/mUtYN4zchQknHuFg7mPnbyeVQ//2HfpaqgmJaxjdU6x++PbcuHSBP2gc2UGHHq/ltDoK6WkjiIGQ1ziIXcMggZlrofskB46BRRJUMcydRhhktP969ZasinfEFn8UFYZ4T+TcdqfEc+pS19VxP/oKaAU=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=oss.nxp.com;
Received: from VI1PR04MB5151.eurprd04.prod.outlook.com (2603:10a6:803:61::28)
 by VI1PR04MB4926.eurprd04.prod.outlook.com (2603:10a6:803:51::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.18; Thu, 16 Sep
 2021 11:17:08 +0000
Received: from VI1PR04MB5151.eurprd04.prod.outlook.com
 ([fe80::499b:ba92:db2e:3f28]) by VI1PR04MB5151.eurprd04.prod.outlook.com
 ([fe80::499b:ba92:db2e:3f28%7]) with mapi id 15.20.4500.020; Thu, 16 Sep 2021
 11:17:08 +0000
From: Daniel Baluta <daniel.baluta@oss.nxp.com>
To: broonie@kernel.org
Subject: [PATCH 03/12] ASoC: SOF: topology: Add new token for dynamic pipeline
Date: Thu, 16 Sep 2021 14:16:37 +0300
Message-Id: <20210916111646.367133-4-daniel.baluta@oss.nxp.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210916111646.367133-1-daniel.baluta@oss.nxp.com>
References: <20210916111646.367133-1-daniel.baluta@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM0PR04CA0037.eurprd04.prod.outlook.com
 (2603:10a6:208:1::14) To VI1PR04MB5151.eurprd04.prod.outlook.com
 (2603:10a6:803:61::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (2a02:2f08:5708:8600:b29c:ccfa:a961:8ebd)
 by AM0PR04CA0037.eurprd04.prod.outlook.com (2603:10a6:208:1::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14 via Frontend
 Transport; Thu, 16 Sep 2021 11:17:07 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b07b3132-e285-4d6d-5091-08d979038598
X-MS-TrafficTypeDiagnostic: VI1PR04MB4926:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB49264365AF7185FBCC238349B8DC9@VI1PR04MB4926.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:826;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QifbsPsf3t6YlUC13VobwEaLOjq8dKzphsG2uO/vm/qGWk+Ri90YHcfRgTK/Qh6KKhlItrgiXTd+k5LUMJjG6fzSIAelUmPu9QAb5lOiwBnK/hnqTfNvHnTLyRtG1PodSVLcLCVKnC5LxF+vaI8rfqAdLtpJJv7D8yUqNCL0eL8Wid5L/co4RGgagLnPQ41YMLsM+r/iTTAT5b6dGBzdSLzluqKpq9Pj3OpUXZeNtTOs9ZdgdLcoGyFawOEV+jY7dVHINMnSZrdfq4fsE7kNujvGXfdwWifN6f4lYeI9iEQTMdlrBmNYWw7BBOIVwykJykZUvz66c0MpltH9weGS+KIoCvN/W7b9uUiXY1D0TUPmePv7rdmZONlvsE7fTu8u2wubrVCuC/sp7d8lcNHqBR4bJ6XRIhgNtCLkfN/NCUhbjSS0G51XfaEF6ZsytLd0mGST9n80VqFgGaP4kCoUy6gYOMFqPKkLg4M0vdM7AaPsT8vddEDHYqpj1fc+rzo66CBrbFOUhjJ+9zlJgu6rmEIIVhmHGBMKCp9QmenPbOReAnX9ByVTxBU30vHnPcgbnKzJ1cgzgaQSSl0QjwLn5ZHJPumY+kYWspJeDqLqmYjZS8kZNbDTE0evnQ/oWZOrmq3DDrUmXv1kqT0QqcTBpA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB5151.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(366004)(136003)(376002)(346002)(396003)(4326008)(8936002)(6486002)(186003)(83380400001)(6916009)(2616005)(5660300002)(66946007)(52116002)(478600001)(8676002)(6512007)(6506007)(86362001)(2906002)(44832011)(66476007)(66556008)(316002)(1076003)(38100700002)(6666004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?FFMiHrruEi3nbuY/oK3hvGVK8kj/nJmTnqdL8CHwPchRSmJIIkdc/X43EsPz?=
 =?us-ascii?Q?qk03KFRbXD/d7xBHUxCm9zXq8RGeCK4WxNJjsSt7uuBVApRzg/BaLxU+Ciek?=
 =?us-ascii?Q?OoHH/fgsrNAb41o8tlkDGi2mV5mZ+KlCFkPh0fvhA6lfQXLqPv4R9Vrf77PF?=
 =?us-ascii?Q?86/COwmE7d9ugkKNS+GAPbsbjKWnGsvJe2OObnCgDj+LW/O3M3Mj9FSIEVAc?=
 =?us-ascii?Q?q/CBegpPWKWDCfGCnia34MxMaKqRlW2gB46Fv4+OpErZsjMeQX6d/EooTpv7?=
 =?us-ascii?Q?HeHgOZqQ6y0H93mvq55tnFy8ci22LRF5UQTMlXs4uzRMYGPvwVfZMZMdVF5a?=
 =?us-ascii?Q?Y7rxWIvQ/pFqRsv17g7bU7mrYX2zAclsFlkVm73arc+g0kTA/Nx+NMTTf3Hu?=
 =?us-ascii?Q?s3nIcHigA/UfhGYf0vmlSQXvL+7557jWL+ZDjB+nssCypu4/hEgfbP1Cis6g?=
 =?us-ascii?Q?b93PUqao1yL8tDeJO8RC9gpU0IuW1f6BilsISRMprBqiMEJPJy5JmFGgokHU?=
 =?us-ascii?Q?xHUelkcmh6NEL+P4gy1ko5vLAY3MM6Ehc23xasuckNiwXoGbbPyUKPqkNcwR?=
 =?us-ascii?Q?rzxuJCyYz1ECfr0K7/sv5aA7D6mPrK5biC9eQeSzLtKyTRM6WW7+Oz+UzfVv?=
 =?us-ascii?Q?MAITkQqBWQArkjFvOkSWF2rpEUSJXX96QK0ZRJEgYOLXf/EgxiCHyDuVRNyz?=
 =?us-ascii?Q?ZBFHWsHondefRzTSEfvnRNE+QgiFaIKm5+Vq1D4qrgZC13YXa+DRDgcEATK+?=
 =?us-ascii?Q?XL6ISWxJK9IJ12twWOoAwr7/LndxuBIIIGtIzyyaOjk0to4rqe2EHxKxby4A?=
 =?us-ascii?Q?y/EvLpe5YMy29pKZ6s6AHiTbHvBaj2ZUoeHM0286U75vvj2zlQ5umtyi+0i9?=
 =?us-ascii?Q?Km2bAbEgyy0VBe7DpYrD/9XIz7UK8wjuz5yQgFZEpxfGtDVApvNUOHcHl4En?=
 =?us-ascii?Q?CcG36cVz/SBUVaykTVP4Ofb+FCwgrLf7HdC+Wp3/ESdznQFQgUQxQu4kcuRJ?=
 =?us-ascii?Q?rVDEiE6DNxke2IJeznNV/WFFF4f1qgBqit7P3D3NlnLzWnw/CMhHVgVVqtKo?=
 =?us-ascii?Q?i9crxqnt59UWeOlfH5ga0mJ0sIgCpjf5pMn3wBuLcKxq7Jc276Haw5UBFKLs?=
 =?us-ascii?Q?WxNqDlIyYT12KJn2bQ9cWbQM/2ZpcpFizrAiTWl2ZEVRljpkhYIiCGV07mxP?=
 =?us-ascii?Q?zro5l483g+swrFusnC9e0kZwANQ9ZpkuMD2yyUPqYH0auwM7F9J/bzm8whMa?=
 =?us-ascii?Q?c+t7FhuXscyFPkpLAakqZh8dM49T3yqxXQ9Uf3EXeMwrDAtRpZDAO2didwz4?=
 =?us-ascii?Q?gn68SwYlbSLwcIjHDYjaqspuiMaUl91/onulgMsQJdHFR5kIQ36EWPwKN6AW?=
 =?us-ascii?Q?yLmvzeI97Uh0Uqzgd0xQmKWuDR5J?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b07b3132-e285-4d6d-5091-08d979038598
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5151.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2021 11:17:08.4579 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nwsQtZaEPOkYCWgLcHhp64vtmYwRgxDsD6TdspUNmY5IoEfPzmbrfKpiEzkEHirEptkBKjJU0WGdO70/iVnhag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4926
Cc: pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org,
 kai.vehmanen@linux.intel.com, lgirdwood@gmail.com, daniel.baluta@nxp.com,
 linux-kernel@vger.kernel.org, ranjani.sridharan@linux.intel.com,
 Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 peter.ujfalusi@linux.intel.com
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

