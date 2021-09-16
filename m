Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BC4CB40D863
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Sep 2021 13:20:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 51F5318A8;
	Thu, 16 Sep 2021 13:19:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 51F5318A8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1631791237;
	bh=pVr738od7nhaZorwg+55M6UXmDSAcicyoX5qwBjl8GM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=a+iVoubsVev54Y7ekyn7z5joFglzwO6hhkkGwhl+Zh7XupadRCJfAIcudYdAfm7cC
	 dzOYw3RDu/C+/oJeQgUhULpB8Wahn0TCe/vT06UWBxyOjqUrEJ271SxEUU3V44eIxP
	 BxRpvfJ/BetHJoPjtVm17S8HhR7K597rhNw/Vy/0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4A296F80517;
	Thu, 16 Sep 2021 13:17:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CA620F8050F; Thu, 16 Sep 2021 13:17:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 MSGID_FROM_MTA_HEADER, SPF_HELO_NONE, SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr50050.outbound.protection.outlook.com [40.107.5.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 706F7F80117
 for <alsa-devel@alsa-project.org>; Thu, 16 Sep 2021 13:17:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 706F7F80117
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=NXP1.onmicrosoft.com
 header.i=@NXP1.onmicrosoft.com header.b="E+Zq/Lkj"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Jp980PaTSyeATvjBHgTkcSEAMGkxk1VdNq2K+lvfzJBrf5HtZPcA0R44PpAzLusD3GR2rhSXGmcrb7XL0lH/VpSvBjbJ23s6+Yl+YnWhBK+MKJeY1WgV7hRSz0RQkq8V6eUNzWB0+QJy7YCiBcVAqkClf6FvFWRSrxy6CqwFvhPm5bHT7Z+ApU8LjuOT1+bTQGmqFFFvOJZ1eLbwGa5T2wsx+UwCFQKHYv2Rym0LcvQzLGp/etHHXvtrRotnWO6MUbl/iGKPsIWc7fKSo5uWrAUURKEMl56Rzh3X1K5fL0C2yA54ExX4cvVYDVZaAR6msPVnxl+t80YCKURJMuVKZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=5s88We5d6A32KwV7UZlK/DFf/rJ4FNd5g6SxpJZHw3o=;
 b=VhG949Aszp6M5XVEL7Utvlo/v4I0h0nifgZlgWlAeAnUXUcSz+EhnuB7XMzBzbWPAjX65iiENyyTMJ43iZUrbQggIUNKI7shfnTIUfUI+A8H8xq5pwdIijEonUQFk3InFK/EBQsC6Y6iYIADBzR5NNREwIVPVBlpgy0oG94Y4IhYbkNUhI1fcnA8UgpKRRGFFwtt88MH9AtThoWqY2tPWZhimvBTXbRP7I0N1PRQrPhHY6oafXWnBBkqJUxqSJLGKkCkpYMoCz9wQGIQb+vBcLs0eniLcco4/4Pgelz0BsHlG4CC1lJamXLJEu7UuDY3/BJdV18cS6lg7wS18IZrcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5s88We5d6A32KwV7UZlK/DFf/rJ4FNd5g6SxpJZHw3o=;
 b=E+Zq/Lkjj/Vtl9oG3Xb+k2W2Eh/gVr36XMgPX6sf4J4vPG+jbmv5/2IKrqLivK2bBJS8l5W7TH3OqDEtsk4t+LIGVYGKpI7Z/EyGexcvZE3gTU01N7C/f22rUgMrst0Wk3s/6kag+dgUHHjFN2B3bHm0n+u+AIbRsNv4XwHRYgc=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=oss.nxp.com;
Received: from VI1PR04MB5151.eurprd04.prod.outlook.com (2603:10a6:803:61::28)
 by VI1PR04MB4926.eurprd04.prod.outlook.com (2603:10a6:803:51::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.18; Thu, 16 Sep
 2021 11:17:10 +0000
Received: from VI1PR04MB5151.eurprd04.prod.outlook.com
 ([fe80::499b:ba92:db2e:3f28]) by VI1PR04MB5151.eurprd04.prod.outlook.com
 ([fe80::499b:ba92:db2e:3f28%7]) with mapi id 15.20.4500.020; Thu, 16 Sep 2021
 11:17:09 +0000
From: Daniel Baluta <daniel.baluta@oss.nxp.com>
To: broonie@kernel.org
Subject: [PATCH 04/12] ASoC: SOF: sof-audio: add helpers for widgets,
 kcontrols and dai config set up
Date: Thu, 16 Sep 2021 14:16:38 +0300
Message-Id: <20210916111646.367133-5-daniel.baluta@oss.nxp.com>
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
 Transport; Thu, 16 Sep 2021 11:17:08 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8d0493af-55ae-4d0e-3181-08d97903865d
X-MS-TrafficTypeDiagnostic: VI1PR04MB4926:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB4926A7D40C6FD7538C914257B8DC9@VI1PR04MB4926.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3383;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bY1xBlnjknyhIFWud/lvgD+HJtt2Q4UjUngZ6wnbHeHnR7aZD8zRaVaiKXoB+YLf+U602TAVAJi5p8Os7wThDuM5mhx1XjsXV4yw81LduA76DWPzi8QyN9RqcIgF+mboANAXFUo5qwni9tVPMog24ceeA87XG2PADAwDJMQuo4324wefVR72QoklEXt86J13VGOBX0nh3Ta3cnMvmAaK4qgz9JNJGWZjbhdtcl4FPfRY5OxA1PU48uay20MdcsDB7isRNp10+o6y2aRMlkGmnkF/nef4nSU588LCMvD6W5iaNUCUUnCiVTavzlsfUTF2aplZA7GmXic8hWMUPvzEXhL3HTMf94eQ6egEY9zThoITp4PFORMKOC+DwGMbPLfDtxt4v4chfNhMyOUWFFbmYsY8lN67LIZipt0MpQOJz1dud2sk+8ZIkvcLSyZGzjpNc6t3TErzU6zh7SpijvFcFsbC7rJmS13hazIicaI63GuOHqyx6KLitMYycqU0f0niCQvsfB+OlpWmWaTz0VtOhWAZ2LP6y4cuU/2Kvj3Z0H8lymz83jh/McXF4M6uK7k8/aynVI64DGZV3Vglm6hvW7+D5CeNsi2NqqcjcrKHOj9pDR4dGhdDTszxTv0teP0NHM23YPmO1wqYJpVyde+znw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB5151.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(366004)(136003)(376002)(346002)(396003)(4326008)(8936002)(6486002)(186003)(83380400001)(6916009)(2616005)(5660300002)(66946007)(52116002)(478600001)(8676002)(6512007)(6506007)(86362001)(2906002)(44832011)(66476007)(66556008)(316002)(1076003)(38100700002)(6666004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9YyFytoGIZvBB42EA+0K1uJiNcWgYLe925j4fP/Km95hCHIc68+wRKSZnAMR?=
 =?us-ascii?Q?hQeBaTRsI7b+7tdYbtOTI3HjQH7HVmJ3MZQFNqSmGofrEx0dJIvpnXvyGJ4S?=
 =?us-ascii?Q?WEXRm9umGuebDpajwB+1v79pnuYkZq//H2XEfyf7XAN2nJHaKGKa5j2Df/gg?=
 =?us-ascii?Q?dXJEmcoJQIEm81HdAZiekpejl4p7GLra/DYMPCKTkoRuRGmqnmKbk5gmgGBO?=
 =?us-ascii?Q?jlbLMsSYwuiTXA2V4krC56TZ4FLvauQq8kaJSFQbxcR6j5GxJuS5bvpXDSuN?=
 =?us-ascii?Q?LJ4U5irSA7kAulJKS6Q3Eh4CLq+fbkzRKY7ynCmHB1jVFgFPs1lkw8pb5xpW?=
 =?us-ascii?Q?nOqZ/dmRo4UQrtIOneWVk/gREm8/cCnTWOfOUYQKkz0i1eqJp/iIoXfWUQ5k?=
 =?us-ascii?Q?McRyFUscu2jCJgQa+wLXEBQX7Zvbf5dxRhfdQJWXcTDFhlyTFo/+Bjelh49J?=
 =?us-ascii?Q?QUoixMotW5IaWlNUNDYDoHzwA+OzDP8atV8FlYsG/DxzBW8dJvBberxQQ6sC?=
 =?us-ascii?Q?1RrrmZTdFcz+Y/wgnZW3xXYk+R5HIf2GGrM6/UTsj7zDaFYPegHiOAKMlvhp?=
 =?us-ascii?Q?TitcP/QVhfdt0mwGT4VKmA2mSq+GF/ths8DuRurI2erTv5N3qM7mIfAvXgMO?=
 =?us-ascii?Q?SvvUNsmld4XGhsriWR2V20QcUsrYxnHOYVjDywdc2HdJR1fyBaXKJfD5LEYF?=
 =?us-ascii?Q?BAtTCBuZWay82LclpQtvvqIaGQkG1zHujnL5SV4nxZLGFRqYyYffHZZn9iGk?=
 =?us-ascii?Q?8fu9IR6Pt29Y+roBSII8b7+CjLziyE1cSx6UKeW0O4fbJS+KlWLRwI4ggaYf?=
 =?us-ascii?Q?quERw/+WagN0bKyvgwxsnbsL9xvbtJF6nqYzY93V+8Z+k4ZKdjhahpjMtK7/?=
 =?us-ascii?Q?t5b3pka6qRkRSD9onatepZtEb7NcxgtHf55LNDzp5uhS/OLe1MPuqVC3Bt5b?=
 =?us-ascii?Q?9WtvP125cBXyxUPEb9xusESV5gFZ5c8lkN3Byy0AL6M9G7tn3dSO4bdxeJ5C?=
 =?us-ascii?Q?5czZnCr5nFNUlydfCOYxFou9DoApbDNU9oLOhFPIifhsO2ywXxJRgyYRf6Xc?=
 =?us-ascii?Q?GCCPvEXqKl3swpe49oiRA74SFUzGg3iViKDq1ATVeO0456HbrQGvvYIlDULy?=
 =?us-ascii?Q?KRzEsOLn7xGrv6uszPlY5B+NEeWeoZRQwlSS8lQVvmStOkxc2Q11NEvQMfBf?=
 =?us-ascii?Q?pFC33eCQu1Be5ZZgo26EO6/4Vfca0Gz1ZiLXCkbt/4RyQkPFYcn29o8dr66c?=
 =?us-ascii?Q?CCSFSsNBn0ellA9bZLOhwmplcBozeP8NLVd3sL44qXkAOEmsU1pwtOackiIe?=
 =?us-ascii?Q?55HlV2zh/s8MjiF2hqBB53lDKzy3bOJtxd/laO4qFJcAo5aHlLVQ5PRQL8Yg?=
 =?us-ascii?Q?BP4A5SBQzeYuKeM9tmTYfzeqQNxl?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d0493af-55ae-4d0e-3181-08d97903865d
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5151.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2021 11:17:09.8391 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i+LyBsmEgZNjs7qC2w12xZn+4IGX2YuD8Y1v/NCSbvIiigrztraI6mtaR0W7CYUzQZ2H7Sh0loD9FKpgjlWGZQ==
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

Refactor the existing code to use helper functions to
set up/free widgets, send dai config and set up kcontrols for
widgets. These will be reused later on for setting up widgets in
the connected DAPM widgets list for a particular PCM when the
dynamic pipeline feature is implemented.

Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 sound/soc/sof/sof-audio.c | 234 +++++++++++++++++++-------------------
 1 file changed, 116 insertions(+), 118 deletions(-)

diff --git a/sound/soc/sof/sof-audio.c b/sound/soc/sof/sof-audio.c
index 989912f2b739..a4b9bb99bced 100644
--- a/sound/soc/sof/sof-audio.c
+++ b/sound/soc/sof/sof-audio.c
@@ -11,6 +11,116 @@
 #include "sof-audio.h"
 #include "ops.h"
 
+static int sof_kcontrol_setup(struct snd_sof_dev *sdev, struct snd_sof_control *scontrol)
+{
+	int ipc_cmd, ctrl_type;
+	int ret;
+
+	/* reset readback offset for scontrol */
+	scontrol->readback_offset = 0;
+
+	/* notify DSP of kcontrol values */
+	switch (scontrol->cmd) {
+	case SOF_CTRL_CMD_VOLUME:
+	case SOF_CTRL_CMD_ENUM:
+	case SOF_CTRL_CMD_SWITCH:
+		ipc_cmd = SOF_IPC_COMP_SET_VALUE;
+		ctrl_type = SOF_CTRL_TYPE_VALUE_CHAN_SET;
+		break;
+	case SOF_CTRL_CMD_BINARY:
+		ipc_cmd = SOF_IPC_COMP_SET_DATA;
+		ctrl_type = SOF_CTRL_TYPE_DATA_SET;
+		break;
+	default:
+		return 0;
+	}
+
+	ret = snd_sof_ipc_set_get_comp_data(scontrol, ipc_cmd, ctrl_type, scontrol->cmd, true);
+	if (ret < 0)
+		dev_err(sdev->dev, "error: failed kcontrol value set for widget: %d\n",
+			scontrol->comp_id);
+
+	return ret;
+}
+
+static int sof_dai_config_setup(struct snd_sof_dev *sdev, struct snd_sof_dai *dai)
+{
+	struct sof_ipc_dai_config *config;
+	struct sof_ipc_reply reply;
+	int ret;
+
+	config = &dai->dai_config[dai->current_config];
+	if (!config) {
+		dev_err(sdev->dev, "error: no config for DAI %s\n", dai->name);
+		return -EINVAL;
+	}
+
+	ret = sof_ipc_tx_message(sdev->ipc, config->hdr.cmd, config, config->hdr.size,
+				 &reply, sizeof(reply));
+
+	if (ret < 0)
+		dev_err(sdev->dev, "error: failed to set dai config for %s\n", dai->name);
+
+	return ret;
+}
+
+static int sof_widget_setup(struct snd_sof_dev *sdev, struct snd_sof_widget *swidget)
+{
+	struct sof_ipc_pipe_new *pipeline;
+	struct sof_ipc_comp_reply r;
+	struct sof_ipc_cmd_hdr *hdr;
+	struct sof_ipc_comp *comp;
+	struct snd_sof_dai *dai;
+	size_t ipc_size;
+	int ret;
+
+	/* skip if there is no private data */
+	if (!swidget->private)
+		return 0;
+
+	ret = sof_pipeline_core_enable(sdev, swidget);
+	if (ret < 0) {
+		dev_err(sdev->dev, "error: failed to enable target core: %d for widget %s\n",
+			ret, swidget->widget->name);
+		return ret;
+	}
+
+	switch (swidget->id) {
+	case snd_soc_dapm_dai_in:
+	case snd_soc_dapm_dai_out:
+		ipc_size = sizeof(struct sof_ipc_comp_dai) + sizeof(struct sof_ipc_comp_ext);
+		comp = kzalloc(ipc_size, GFP_KERNEL);
+		if (!comp)
+			return -ENOMEM;
+
+		dai = swidget->private;
+		memcpy(comp, &dai->comp_dai, sizeof(struct sof_ipc_comp_dai));
+
+		/* append extended data to the end of the component */
+		memcpy((u8 *)comp + sizeof(struct sof_ipc_comp_dai), &swidget->comp_ext,
+		       sizeof(swidget->comp_ext));
+
+		ret = sof_ipc_tx_message(sdev->ipc, comp->hdr.cmd, comp, ipc_size, &r, sizeof(r));
+		kfree(comp);
+		break;
+	case snd_soc_dapm_scheduler:
+		pipeline = swidget->private;
+		ret = sof_load_pipeline_ipc(sdev->dev, pipeline, &r);
+		break;
+	default:
+		hdr = swidget->private;
+		ret = sof_ipc_tx_message(sdev->ipc, hdr->cmd, swidget->private, hdr->size,
+					 &r, sizeof(r));
+		break;
+	}
+	if (ret < 0)
+		dev_err(sdev->dev, "error: failed to load widget %s\n", swidget->widget->name);
+	else
+		dev_dbg(sdev->dev, "widget %s setup complete\n", swidget->widget->name);
+
+	return ret;
+}
+
 /*
  * helper to determine if there are only D0i3 compatible
  * streams active
@@ -97,46 +207,13 @@ static int sof_restore_kcontrols(struct device *dev)
 {
 	struct snd_sof_dev *sdev = dev_get_drvdata(dev);
 	struct snd_sof_control *scontrol;
-	int ipc_cmd, ctrl_type;
 	int ret = 0;
 
 	/* restore kcontrol values */
 	list_for_each_entry(scontrol, &sdev->kcontrol_list, list) {
-		/* reset readback offset for scontrol after resuming */
-		scontrol->readback_offset = 0;
-
-		/* notify DSP of kcontrol values */
-		switch (scontrol->cmd) {
-		case SOF_CTRL_CMD_VOLUME:
-		case SOF_CTRL_CMD_ENUM:
-		case SOF_CTRL_CMD_SWITCH:
-			ipc_cmd = SOF_IPC_COMP_SET_VALUE;
-			ctrl_type = SOF_CTRL_TYPE_VALUE_CHAN_SET;
-			ret = snd_sof_ipc_set_get_comp_data(scontrol,
-							    ipc_cmd, ctrl_type,
-							    scontrol->cmd,
-							    true);
-			break;
-		case SOF_CTRL_CMD_BINARY:
-			ipc_cmd = SOF_IPC_COMP_SET_DATA;
-			ctrl_type = SOF_CTRL_TYPE_DATA_SET;
-			ret = snd_sof_ipc_set_get_comp_data(scontrol,
-							    ipc_cmd, ctrl_type,
-							    scontrol->cmd,
-							    true);
-			break;
-
-		default:
-			break;
-		}
-
-		if (ret < 0) {
-			dev_err(dev,
-				"error: failed kcontrol value set for widget: %d\n",
-				scontrol->comp_id);
-
+		ret = sof_kcontrol_setup(sdev, scontrol);
+		if (ret < 0)
 			return ret;
-		}
 	}
 
 	return 0;
@@ -163,77 +240,14 @@ int sof_restore_pipelines(struct device *dev)
 	struct snd_sof_dev *sdev = dev_get_drvdata(dev);
 	struct snd_sof_widget *swidget;
 	struct snd_sof_route *sroute;
-	struct sof_ipc_pipe_new *pipeline;
 	struct snd_sof_dai *dai;
-	struct sof_ipc_cmd_hdr *hdr;
-	struct sof_ipc_comp *comp;
-	size_t ipc_size;
 	int ret;
 
 	/* restore pipeline components */
 	list_for_each_entry_reverse(swidget, &sdev->widget_list, list) {
-		struct sof_ipc_comp_reply r;
-
-		/* skip if there is no private data */
-		if (!swidget->private)
-			continue;
-
-		ret = sof_pipeline_core_enable(sdev, swidget);
-		if (ret < 0) {
-			dev_err(dev,
-				"error: failed to enable target core: %d\n",
-				ret);
-
-			return ret;
-		}
-
-		switch (swidget->id) {
-		case snd_soc_dapm_dai_in:
-		case snd_soc_dapm_dai_out:
-			ipc_size = sizeof(struct sof_ipc_comp_dai) +
-				   sizeof(struct sof_ipc_comp_ext);
-			comp = kzalloc(ipc_size, GFP_KERNEL);
-			if (!comp)
-				return -ENOMEM;
-
-			dai = swidget->private;
-			memcpy(comp, &dai->comp_dai,
-			       sizeof(struct sof_ipc_comp_dai));
-
-			/* append extended data to the end of the component */
-			memcpy((u8 *)comp + sizeof(struct sof_ipc_comp_dai),
-			       &swidget->comp_ext, sizeof(swidget->comp_ext));
-
-			ret = sof_ipc_tx_message(sdev->ipc, comp->hdr.cmd,
-						 comp, ipc_size,
-						 &r, sizeof(r));
-			kfree(comp);
-			break;
-		case snd_soc_dapm_scheduler:
-
-			/*
-			 * During suspend, all DSP cores are powered off.
-			 * Therefore upon resume, create the pipeline comp
-			 * and power up the core that the pipeline is
-			 * scheduled on.
-			 */
-			pipeline = swidget->private;
-			ret = sof_load_pipeline_ipc(dev, pipeline, &r);
-			break;
-		default:
-			hdr = swidget->private;
-			ret = sof_ipc_tx_message(sdev->ipc, hdr->cmd,
-						 swidget->private, hdr->size,
-						 &r, sizeof(r));
-			break;
-		}
-		if (ret < 0) {
-			dev_err(dev,
-				"error: failed to load widget type %d with ID: %d\n",
-				swidget->widget->id, swidget->comp_id);
-
+		ret = sof_widget_setup(sdev, swidget);
+		if (ret < 0)
 			return ret;
-		}
 	}
 
 	/* restore pipeline connections */
@@ -266,15 +280,8 @@ int sof_restore_pipelines(struct device *dev)
 
 	/* restore dai links */
 	list_for_each_entry_reverse(dai, &sdev->dai_list, list) {
-		struct sof_ipc_reply reply;
 		struct sof_ipc_dai_config *config = &dai->dai_config[dai->current_config];
 
-		if (!config) {
-			dev_err(dev, "error: no config for DAI %s\n",
-				dai->name);
-			continue;
-		}
-
 		/*
 		 * The link DMA channel would be invalidated for running
 		 * streams but not for streams that were in the PAUSED
@@ -284,18 +291,9 @@ int sof_restore_pipelines(struct device *dev)
 		if (config->type == SOF_DAI_INTEL_HDA)
 			config->hda.link_dma_ch = DMA_CHAN_INVALID;
 
-		ret = sof_ipc_tx_message(sdev->ipc,
-					 config->hdr.cmd, config,
-					 config->hdr.size,
-					 &reply, sizeof(reply));
-
-		if (ret < 0) {
-			dev_err(dev,
-				"error: failed to set dai config for %s\n",
-				dai->name);
-
+		ret = sof_dai_config_setup(sdev, dai);
+		if (ret < 0)
 			return ret;
-		}
 	}
 
 	/* complete pipeline */
-- 
2.27.0

