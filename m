Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 45C4F40FA6C
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Sep 2021 16:40:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A33FD17C5;
	Fri, 17 Sep 2021 16:39:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A33FD17C5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1631889608;
	bh=9l1bcZ/sdYj7QGvJx0aWWQuubQ3x5lQ9Ynb+e1f+B2s=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rEfN0n/MbTV41iDKA+Y6U3UGz+oI6keIw7ki52Ed4krg3pwzXZA/scaIQ+9Tpg30j
	 pPyeqOHaoCxyI6mG6T3z6rBwQVtCBSPiDl8PCmrIdnHrnDSVzZtbH73U6K1/hqLuOp
	 8G1oPQltcNAUUaJqy13JfxxQSTIxWwIaELTu9+Nw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D0F9BF804FD;
	Fri, 17 Sep 2021 16:37:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A84C8F804ED; Fri, 17 Sep 2021 16:37:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 MSGID_FROM_MTA_HEADER, SPF_HELO_NONE, SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr140047.outbound.protection.outlook.com [40.107.14.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CDFE0F802E8
 for <alsa-devel@alsa-project.org>; Fri, 17 Sep 2021 16:37:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CDFE0F802E8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=NXP1.onmicrosoft.com
 header.i=@NXP1.onmicrosoft.com header.b="ab2U6SDi"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D3WorzLomFbs/74PXeZPG/PH/RCH3Bvz8z38xE/GfCoObLg79Vd+dBuIn7fO4lv0rVv9FK2nVl0DEcGzJdBbo5YSL+ch+TcO4qDTRM45xG4r96aZICIsOKZDnyX6xBd7h/dp5jT7tlDEmKx5DTUPrRqYs2YHAZ+w3xiJkLE2kX2BR92eF8gmipa2YpT3IJN0PCnUe2k8Nr/5F4IGWrZgi8mdsDTAXXhP3F5G6NJNjf82uN9TYxK2su1Ry/iG5+CZGbeAJgAoc0hQ7DMdyrmHzWPs3rId2PX2UwjGEUYE6RbQf3joruDV1Mk6yX7Yjopfv5OsohM2k5PBOACb7G3rbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=cVahSIUErLYZC1mGuWOue0LutrhOaSwRm9hYqLrUeKw=;
 b=WbTF+PZpRSFFxmj4g7kk4h4dHDYlSwEY4cTzZDrQWIcjd5soM/M9tPA7vwBS021QxptGRAXV3zag5BD9par20Ca+JiIxuGYaoEMJlY+nbHndktpCNqwY25GYste/Fyo6K2Ip1ClP8qYaMWz3mjaA6urQbFy85zbBBGHid7KwZG8WsUZLpWH4HRtq9hzbQvPztyCa5RY2bLTYRVocTy0JU25pLqtEbGA3plOAVbJafg3BSTEWcrCKfvRGsSTBQWRoldB/ZdY+gtU6JAamO0saevA+XevYl+XRBkVhDPzJpIIY33zPqIPm4pi9Hbx9t4TIJ7MEo5LOuquFqnm1SQiplA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cVahSIUErLYZC1mGuWOue0LutrhOaSwRm9hYqLrUeKw=;
 b=ab2U6SDil9ADoh8zRHipgomUELeW9BOEGIwK0E4p/DmyZMh2Sksj4UxcXT2p48P3g4JGIBxPjzQEt91uXqVxGh0LNFoZL4A/xsWhOMqxR69f6e9IbYslNKPmOtdwt0NVXLR34+WhQT1z8OyXWHkc1IkQOo4drCNi1Ah+D+UibD8=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=oss.nxp.com;
Received: from AM0PR04MB5140.eurprd04.prod.outlook.com (2603:10a6:208:ca::21)
 by AM8PR04MB7409.eurprd04.prod.outlook.com (2603:10a6:20b:1c5::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.16; Fri, 17 Sep
 2021 14:37:23 +0000
Received: from AM0PR04MB5140.eurprd04.prod.outlook.com
 ([fe80::dd84:b996:1c8:705]) by AM0PR04MB5140.eurprd04.prod.outlook.com
 ([fe80::dd84:b996:1c8:705%6]) with mapi id 15.20.4523.016; Fri, 17 Sep 2021
 14:37:23 +0000
From: Daniel Baluta <daniel.baluta@oss.nxp.com>
To: broonie@kernel.org
Subject: [PATCH v2 04/12] ASoC: SOF: sof-audio: add helpers for widgets,
 kcontrols and dai config set up
Date: Fri, 17 Sep 2021 17:36:51 +0300
Message-Id: <20210917143659.401102-5-daniel.baluta@oss.nxp.com>
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
 Transport; Fri, 17 Sep 2021 14:37:22 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0cdfde8f-40c2-44ba-18a3-08d979e8a99f
X-MS-TrafficTypeDiagnostic: AM8PR04MB7409:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM8PR04MB74092295B6D19B599F2C5293B8DD9@AM8PR04MB7409.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3383;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dq1+Xkxu/pkHN/xTPcDUe0YgBkt2bVZCxINR4faMtTaMdjUk7nxvukepqTt+9IE2xC3pqA3y+6Wul6FpW9A2SslSSVcv2EYxy0FNbw/F1HQkfjyupgJ8C41Cv/Up9LcTLtS5YwXWXHyA9gxURc36y9YF1jNiH1jEz/nwNmU9WgJ6hv3Gs5Y1n8FCiNzeelTPGVKql8oLhJEqFmLpQFqI2Z3i2cmaKp2vNCFIrDZEZkRcYMovx6ObrpVJcqjCjGGmeVbIGKhUUTQj1De6GAC24+pdeTbCjT1U2K+4E4LoxKBo+GdV0vOXed+UvJUM0i3IhKMzTH8X2IRWatdtzEFzUd6RT/nSNsGQwPKPGtNJF5kIRx+YoVarW+125g/jC3XrbCySpWIYVG3ftuIjDS6dCeRhzvnG7UN2lPa/T3YkG+YrjIQ00UfiD8dPJyeH3gTe5ByirO1UV2NnLprTAC136iSrM278T+IQq5xMQKpCtJkGfiQgHn5HUL+GNCqx0h8Dqumb3PBrSQSUBkjXMAV6JNKwlqs0BgJm/LvvtzYRM9EsiPRb3It/ovLNRFagYYuG5PkbAmYyJQRxxWnjUn26PL0LTp33tXFFdfhjuTgPs+TegWLNwfH3o/ZI8jna+GD9EiUIlH2jyp9wtdbYJXruIA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM0PR04MB5140.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(376002)(136003)(366004)(396003)(39860400002)(5660300002)(8676002)(2906002)(4326008)(38100700002)(8936002)(66476007)(44832011)(1076003)(6666004)(86362001)(66556008)(6512007)(186003)(478600001)(316002)(6486002)(2616005)(6506007)(52116002)(6916009)(66946007)(83380400001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2HSf4Tj1xna/BVa+Ds0HvDAnUA9Fb7emwQVVyO3cyKJaZnrJVrn7LSsg6Q/o?=
 =?us-ascii?Q?7un9Rl8RQCGEX9GArBiwcHdlhtOjHv9w4pDKvRNlswVB+vXLxuWCUuh2gbdI?=
 =?us-ascii?Q?34KX8ArPl3Y2ylGzDfrMTcIrxHcTlSLL/TVl1eZsxOXntYSOGb4j5nUAL7B8?=
 =?us-ascii?Q?M5ri/FtG/vGoohOR3sPaVdpz5KL+XQnnhgCNFgkOyQczLpTOfhT9TQOhTl6z?=
 =?us-ascii?Q?evMMULV2sq9l4ls1fsNYJAwRPje59apE52lAwBeY4zkg3VUE4E7E4mfzv3DC?=
 =?us-ascii?Q?vOa+Sr8gxE4MY4yALlojEexOjxYKty6rBjgFoZp9KnJzqI2RQ0CcZlt/K8Ad?=
 =?us-ascii?Q?zjd697RKyQiJ59Lg4wbuJId0bP2jiFEw5H/PsztGxGgaxxNnBYxbjJ1Wkm8N?=
 =?us-ascii?Q?BOde7gCoN34xWpR4d51IrGX/oabASJ1It/4PdWCCxX51xjvyirypPyaO2mVX?=
 =?us-ascii?Q?170N1vrnjlx82nTGUqEloOC8nHop+u5hnDbyPSS8sRhu7NglbXKoeBLp4Vz6?=
 =?us-ascii?Q?PQX1Fnv5FGntWjUOJCq45eMTHhLWeOgi+1MEjXT7U1cl4aprH6bxhv5zADMk?=
 =?us-ascii?Q?eYPZ7lhWVDbmsWoSm133C4vZqjAPcYXeEDYREalGbTXf+iPZ6ByiWGVeA919?=
 =?us-ascii?Q?+ZGda+dcRl1mIYSLKhybpxTp9hXJ4AZaQDgC/ATB1OVZc/Q8d8sZZ8mkIP8S?=
 =?us-ascii?Q?+C0FeWbkmHDDf+ncdxb6/jBGrsINnqACcjxsm6+O2+/j6ZHk999QMtBb4M5A?=
 =?us-ascii?Q?y3rKP3ePTmGbve7eE8oVc0Gn1INR3+bed3cQAoSc1DemGFOwLPcZqum+yQei?=
 =?us-ascii?Q?kohSu6CxDDyesyZZ7rDi9gPeD5V7VRtxJWjSmgO9tjeRRl1Nm+mhoZ/xpzSx?=
 =?us-ascii?Q?88f1sJf+fwOQCqC4m2ImMnEJCFoi8gva/kgU0ckDNHiFbQxk1Ui7CLPywZDr?=
 =?us-ascii?Q?dWhwrI69baQJKEnna8Eg2An+3UIDLukw9NO1UdO1tsmi4EWKojazvUNvCTdQ?=
 =?us-ascii?Q?JXsHn3p+H6NnNaFbTdjqoR19B/el7ZMX67dDFMJQrEpCGawokhm0mPBJluEc?=
 =?us-ascii?Q?MFukn7aq42KaqnuqcO8wbGyT5ic7VC+MqItJO5AUEN7Ml1Ikb6HIXhBwgYH1?=
 =?us-ascii?Q?CZbyhZmr4WIn2BBbtRh/Erv6FaaUxdvX4cgSA2kVscHFWkqfilN4ZcQHBDKO?=
 =?us-ascii?Q?FPZFe7DB+C5ziKNT9d0qjbuhWUP8QKnn44AdYiscwUJevAIwuGPnqQtb/YjS?=
 =?us-ascii?Q?OGUK+x0MJ1A/VvdYwZFFT4Vbe4137jC2V8s85jeeFwIdUe1ySMF5jeezDXMD?=
 =?us-ascii?Q?X8mTdKq19QAss9iZF+Wv5h8NjuLc4FMc7xdSB+0d5y5KC0wO92xTlUdEVWrW?=
 =?us-ascii?Q?XnYG7ZG3ZGBJDjivh7pWc5xQ+hyZ?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0cdfde8f-40c2-44ba-18a3-08d979e8a99f
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB5140.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2021 14:37:23.7543 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 84RbkMNKzxck1bxYWKNXAGH3Lr8cwjYrsxEeWnboVps6AyTv6/AyaYfRzxietEKjBDQyaI9mAmx3fmesz97NTQ==
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

Refactor the existing code to use helper functions to
set up/free widgets, send dai config and set up kcontrols for
widgets. These will be reused later on for setting up widgets in
the connected DAPM widgets list for a particular PCM when the
dynamic pipeline feature is implemented.

Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
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

