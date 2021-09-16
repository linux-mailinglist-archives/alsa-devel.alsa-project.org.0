Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A8F3740D867
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Sep 2021 13:21:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3BFAB18C6;
	Thu, 16 Sep 2021 13:20:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3BFAB18C6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1631791275;
	bh=uE/1IXllWFgdbLRJVDWsBejUGX7lbISyGxqfDzHUw7U=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IYKfdiRMpYDNgFYWE46VYDA/4mcuSKAp7UYEQDkyCC1qAriAEKZRhkgn2nuOGw7gX
	 0OriYK/mv0/1VDNz3nnXcks6Nn3mG5PTFcInrr10XG7P/vjbdmm3diB8SI+9REx3zx
	 wQxUyhwkaBj0st9A4DTX/2uqzH6Qy5nb4jYLJuQU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 18364F8051F;
	Thu, 16 Sep 2021 13:17:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AB288F80271; Thu, 16 Sep 2021 13:17:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 MSGID_FROM_MTA_HEADER, SPF_HELO_NONE, SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr50058.outbound.protection.outlook.com [40.107.5.58])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5EA0BF80271
 for <alsa-devel@alsa-project.org>; Thu, 16 Sep 2021 13:17:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5EA0BF80271
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=NXP1.onmicrosoft.com
 header.i=@NXP1.onmicrosoft.com header.b="OmH5190D"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GPhu6ZGpTTCiUpDN7cbPOPynRZASwoimo2BdjnH1qw3jwtu0BoyOf3M8NADyjSDx4PRudQn6iJVGhR9nmuAjLIf0lNDHzjJOfLs9MPi9VZddQ3EC2lmSW8gyNPAcGqoCNinGDtrIJMVcQXflp7lC8xba6F4OmOgzJZP36eW6/VHTJsoGFFy8bF3hjbe6Szj55ksj2AykN6zMW9nYdihaDURD2JmAfXNPRwadhmz5FcZbpMSVYHH/SYT0Qm8acrWyLydxhcWAgza6QRnstGZnAx2MfXZ047LTcV0WwVMVZ+v+ChFDq9cQQxdy8yywREmOq9hsD1bB9NkHlflHKlyFJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=s15B+547NrBh751FmvBNcnKJalu3MwH1IF1VIixTN7U=;
 b=Ip3yrYnZsZkYqtqoMY2o/eblhyjH4spjAbUCVR9L/FqtVqWxlo3R7D1MtpfOg+2ILbtujy2GIjEEjn5AJHP6XsHRWO5nUTQeeYaPjvrXTeF1Fh8C4ZhqWgCPHl+JQb0VO1axTncPeEsBGAinwypKVtxGPNQxfALl5lecnMj7OM8bLoABn4+0MkI0tM9akAnq93GuCJkZizAbuYtvKJef6wsVrOPdAozqoEgP4durfnQWEKRjYMhlljkClu5rWEZpHO5Xj+jmR79GHjNrIcweKPjysAMkH/hhJelhVIeRfoTz5tUI7ooUtRk2EqUhVENTFxVwPSL6S1rsJgOm3BA5wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s15B+547NrBh751FmvBNcnKJalu3MwH1IF1VIixTN7U=;
 b=OmH5190DKeat9rGSs9t/U0/iCxMiFv+R7luyV8DOTcb+bQOYoqhKdb5KBs56sJZ2kDR9lOKnqMIqQhmLX5XnE2VYbmssIIZQGpF4V0Afqt+/aJshjmusSJ21kYWuXq0iXOXTyyWADd1at9fFo3N56eXDpERub4D2iGVuliLH1eM=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=oss.nxp.com;
Received: from VI1PR04MB5151.eurprd04.prod.outlook.com (2603:10a6:803:61::28)
 by VI1PR04MB4926.eurprd04.prod.outlook.com (2603:10a6:803:51::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.18; Thu, 16 Sep
 2021 11:17:15 +0000
Received: from VI1PR04MB5151.eurprd04.prod.outlook.com
 ([fe80::499b:ba92:db2e:3f28]) by VI1PR04MB5151.eurprd04.prod.outlook.com
 ([fe80::499b:ba92:db2e:3f28%7]) with mapi id 15.20.4500.020; Thu, 16 Sep 2021
 11:17:15 +0000
From: Daniel Baluta <daniel.baluta@oss.nxp.com>
To: broonie@kernel.org
Subject: [PATCH 08/12] ASoC: SOF: Don't set up widgets during topology parsing
Date: Thu, 16 Sep 2021 14:16:42 +0300
Message-Id: <20210916111646.367133-9-daniel.baluta@oss.nxp.com>
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
 Transport; Thu, 16 Sep 2021 11:17:14 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0f246453-70dc-415b-c692-08d9790389ae
X-MS-TrafficTypeDiagnostic: VI1PR04MB4926:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB4926CBAD9C26C2A119193D94B8DC9@VI1PR04MB4926.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:546;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JVpKoXQFlpIHIbluxqNdfgR8TaI96I3gWzPpXIL+xOz2Ur/qvUQbCwTA7aUbwO+S2D/2rUjKtgPg0n33FsEJqvtLvfmgFiInHwt0xoEwoFLUoKR5vgj93xdPqd31jsWPQIbqdvrEl0lV1glrVzsTuwIHuECY2TLndyMAiA7TwkH0c+XA5JXbF5FZUcOaP/j6sK8Uv+qBFGNtNdCsXs5fyGeTIez5K18qAeZ9Q2LScl3TsqvBKqYgUuWAdlNdKhg+5Qmgg7Uxr4GGXBNB4mmM9c/thMpsblbMYrLYKOaiiP9khVjm7KBERr3i8Qvyr5UbbR0cuYYk9/9j5Dc9nNGAUPkTQmiv9SF5uv0qTPopcn/9C8a9HsGnPEdF45pddgqKSXrfQooHgivq9ijDNNQjvlvryzm7jRDUXqOjuji/DePKKZ6tihF/NRSHEhwdXkNTqkZ4K5732wNc9eSIkBGof34QWZ3wJi42i02YGlgX/R1RgGkX5vAi7tuhlOjJnOtX57IIw/ThdlJ13/yFnZ9UKVM9EUiT5wuC0n5imrMfldXitNV1TuCN8GHQYjkI3Y5XYsuZoJdCsu3L4JOHV8+APcZB8eVUiNIAIjv3Iw3LIXVWjpR2uBIvSXoUh2Z10g0taVSBrPzmpEt+3MXaXbkg/g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB5151.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(366004)(136003)(376002)(346002)(396003)(4326008)(8936002)(30864003)(6486002)(186003)(83380400001)(6916009)(2616005)(5660300002)(66946007)(52116002)(478600001)(8676002)(6512007)(6506007)(86362001)(2906002)(44832011)(66476007)(66556008)(316002)(1076003)(38100700002)(6666004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?az5BqDKRCA/Hlaofftp1qcQtyuVPyC7LapEIFULpz7ZjaNreuFvwNNXeEgzh?=
 =?us-ascii?Q?lDmqwCDsipymXK/nV2y2AbSLSiIAlAtW2eWudG336vL1QNAMs9Rwb6Bf2Eo6?=
 =?us-ascii?Q?1ZrmT0vAIV+/FGZTRICOx81NRyRKiUPembfjW1rcIiI22tsbEDY/nc3bK4Rg?=
 =?us-ascii?Q?DGA/IXoOIOqkhtPPPChVxflnGAEBQmIoN/cO7a98xqLYBub8fHgddtfvbG3q?=
 =?us-ascii?Q?dKSLYr0oV7Y9uB+UwMXF9uwDt98QjDE58SK+2kZe09FYsKswuXneRXOJLAYn?=
 =?us-ascii?Q?7LNK+kNEpDzoFcxMattmm84uTkV+1+TN24u6Z+LNMeao/fGB/InrpvP/hsSi?=
 =?us-ascii?Q?1oBp5bq3Mbs+tgE99EHwhAkQc4oQZl7xVWlQ5j6Vr2NOgiFWD3Fmpny7TokE?=
 =?us-ascii?Q?j4U0q5Fmns+U2RkmmGfkoDDRUU0/2xI/6MAYOw9VuQ9I9zOByf2/9wvI0LGZ?=
 =?us-ascii?Q?RAK6BlkwdemZd2sHGZbxQGJ1pl5CwDO4wtU9IqPds7enSz1PAEVAqyx3jbwD?=
 =?us-ascii?Q?b5YJ1mhUJKB4p7ivS08pjhSTQquF4SyPMRgvbjNWbA2bZmzUvTAeRCE46iqy?=
 =?us-ascii?Q?Ek2xQRMtGUOqiGfp0Wj584cUlNrtjtPi/BDDtaOwpz3fo3lFuwruTfLVoR2v?=
 =?us-ascii?Q?H3ofFu9iVXr4hudg2Qx6RHgK3kou75RHo61hXSP0Vbxav/gj4w+SCh1y9VTu?=
 =?us-ascii?Q?mNcB4JKJXcNwhQ2lTnWwqjazj2s7ZD4yLEy1heljntFlW6yWhXgRkCf/2R+N?=
 =?us-ascii?Q?8vkwh3lcOHbqvqTV2W+U1wcU40rMVRo7AVcx4bydLNYLNuhze+2b+f9cOZ8X?=
 =?us-ascii?Q?doRD1Tp/PgnCgHTtb4mBQz/PvJDDsJMvUjZAppuah+6AtXitDhGgrslk4+TY?=
 =?us-ascii?Q?/No/ZEX77BgPnut0PKaVQ4+UxfHN0gCDSbm/HHJ/tuAD8G/PRx95xazCxk8Q?=
 =?us-ascii?Q?9cN6rizXUC1zvo8EW65tYpAHO7DBYzmKymVoe0FYsvwSgVr/vFqPG83xtfn2?=
 =?us-ascii?Q?tlMIjrUdy/8tjmXdk2+H6hPF77UOVSiPBhWtdFf/PfBwDpfZujYrurp+8wqf?=
 =?us-ascii?Q?E31wISgpqdK0VCMC2SK8uzHDbMn1aYFQPE3QKM6e2Ry7ZBO8tvVQvAZKhFhw?=
 =?us-ascii?Q?GPe5a3+t98WJT0S+rEJQ9pxUEkJCVciqhsLYLl9nPnAnDAB8mBLW0HpdpDNJ?=
 =?us-ascii?Q?rOcy+afosSyB5kZxXmaPkDdo3ns/Rel6uT1RwqbE2e+Hr4PCqltMl82SEMXr?=
 =?us-ascii?Q?2sjbj3rhWMzi+pwvNjgSpiQu3GCxkYwVedRWBfahH7Uq5d6mbrO3JBy7RQGu?=
 =?us-ascii?Q?wAKwl99hN5Jsiu1lnv7RqHMsEt8pHwY4OHlh5pjf30d77QRXQuFV2F63d2t7?=
 =?us-ascii?Q?XpV7inrtilSsSpRKPL68WDCyczetAbHJLuNxODA7gq8NADkxlA=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f246453-70dc-415b-c692-08d9790389ae
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5151.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2021 11:17:15.4079 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1UO9sHDcW3DCbf5XZu/wcdegeW0izSHzWFkl+aF6Ji6Pdwpi7xTRrHGczzGATqdWw/fqemDu1GARCzjFiiHmQA==
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

