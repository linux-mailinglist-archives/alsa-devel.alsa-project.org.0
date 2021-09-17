Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E358240FA96
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Sep 2021 16:43:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 887B317BB;
	Fri, 17 Sep 2021 16:42:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 887B317BB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1631889790;
	bh=qophH7I5EKq7IN+OgVFMXP3kuPPtstCwTjP4CjIXo6I=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YDOL6XNVin2Wmh1Hfdz9qnY3ASg4IF431Dgd7EB7dkD+FKAvCnxur5J0fswyhjQXm
	 QiDrIiD6FVOakyzxus1cgISSETbcCgAIMQjDozXnemqHFBCiLWVM2Pp6u6jjNrLOv7
	 XEFPBKXgBLDdcXFOKx4FrotAUzgeTlU5O8dAcvjI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6026DF8053C;
	Fri, 17 Sep 2021 16:37:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7523BF80533; Fri, 17 Sep 2021 16:37:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 MSGID_FROM_MTA_HEADER, SPF_HELO_NONE, SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2077.outbound.protection.outlook.com [40.107.21.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9FCAAF804EC
 for <alsa-devel@alsa-project.org>; Fri, 17 Sep 2021 16:37:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9FCAAF804EC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=NXP1.onmicrosoft.com
 header.i=@NXP1.onmicrosoft.com header.b="iehlx42H"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RIMW+qMl0kyTI28BarqhXxPzU5PNbBgPt3RSHvk6vfiVDym5R68ZURDTU8WmscQkCZnZfuLBbjc7FXqL6MRMPhAvhMA+KJtLbSBUzwBRbLE3kG4lCg35F3d5sDJvs+T+4VugWcPbgEXSeQ0cFP1Lwq0Uz3tatOyXGHPebSU49Hg5CP/bC+sYR2eHYupA0gKKhncIZ5jhUpyt3xjq322BwHHbg2kqxhByp3dUnp/WmTSzro1jDY6YcPFnjeKpdQ5aa572hXV9kAkPMKbAMkxYgEasFs4Gh5XMdY1pJYnbiFKaJFfP3T7NL+4uK7OMmb5IHU6Gr9gH6mfGHoyJEKekHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=BR/g9u8yznQfaAynScsAPeN/fcxxma+I3dEjKi1o3yM=;
 b=TfZ0AZuBpGTsRnZuqGXAqVX8MEr9eWFBZm8j7Y+LeKe9yepRvDx0LefELGUuy/yxZUli4J2KrbXDwHgqoHTYnkVF+hqNdVTIXRmzpHV0cLQjm2xfgk/Rw8RmHCtJ+eK/9UuKWpoyVqPLV9ymZJnKyi9aXE9qqXEyD9K+19kAC/phkCXqcIsLtzHWHSKEx31Am44WnAR7YQ+x1xZmGqW9YARhI172y4ud0u6FwA2paQQvC0Sp94UzuSNSYt2Jq6qJ3EdQBcwmyYduyB0gT+OpIITLPU+EauOKoFhWW6r+qF3RmcFdJZ/DaUhCH0MAHVH81ssSLKk7DjLN/TIPVVTviQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BR/g9u8yznQfaAynScsAPeN/fcxxma+I3dEjKi1o3yM=;
 b=iehlx42HuDrtZmJoSUzx9/kU3wwEieRFZWv7J1BjO+Td5KEULjYee7irb55DgIoXxNYvmUvSdLczaQjduGV4qqN38ZPpIWPcnYCfAFKzJaccpi2E8sYIVTZyIyf/AuHWaJJP8MeQ2Z6716ILJD0xDW8BL9pwpKx5UyMrGHkxYNo=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=oss.nxp.com;
Received: from AM0PR04MB5140.eurprd04.prod.outlook.com (2603:10a6:208:ca::21)
 by AM0PR0402MB3506.eurprd04.prod.outlook.com (2603:10a6:208:17::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14; Fri, 17 Sep
 2021 14:37:32 +0000
Received: from AM0PR04MB5140.eurprd04.prod.outlook.com
 ([fe80::dd84:b996:1c8:705]) by AM0PR04MB5140.eurprd04.prod.outlook.com
 ([fe80::dd84:b996:1c8:705%6]) with mapi id 15.20.4523.016; Fri, 17 Sep 2021
 14:37:32 +0000
From: Daniel Baluta <daniel.baluta@oss.nxp.com>
To: broonie@kernel.org
Subject: [PATCH v2 12/12] ASoC: SOF: topology: Add kernel parameter for
 topology verification
Date: Fri, 17 Sep 2021 17:36:59 +0300
Message-Id: <20210917143659.401102-13-daniel.baluta@oss.nxp.com>
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
 Transport; Fri, 17 Sep 2021 14:37:32 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1e598da2-d603-4b8a-9bd2-08d979e8af14
X-MS-TrafficTypeDiagnostic: AM0PR0402MB3506:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM0PR0402MB350692013F30D635F7B2A214B8DD9@AM0PR0402MB3506.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7lf9ro18ABkpiTatsN0zX1JzFGMst0608VIAPa6vHvRrBg6+OkstetMYGJ9g3jzGIzZqVUA2ZrGRLy7rYJEExsD1cOp8a1rtWoKfLdJnS3cs4eC53VsjMa2eN/nC9w6z50XjJgWit+8jaWx4hAaxX2RiTzuS0F2ORYL5R066txAoCZpXJ4bpFzwP+t92Lhgfn9uSPu8A2i3stEDOZqaxcq1aAXBCxPWYm4/qxJScUZQGQwKyr5KMrV+V9c/HRmx+Mg4mG4NbdTG7uLlk/axT7bsRl0P2YVfOgZ8qm75TatpXfkBMZ6Am7qeYETjBk4t4TdjxYKaad70hpS3T+QX2U4/xx88Nzt6CJst8U1LuuZ3eezDryR/fVlFc38KMexvpoU+fjf+LDTq1l2EwSkTY84JVcveA9Y7vNobNWFQKkcFItMxv3d/ljtv+EqzE4u0IyGL3+L38POjARJQwv1ZuLrh4+mPRgaOtYQ/TWzcWZo3kNQxDKbGRyG6KK4nxOCgezQsaDVJ96Z2zHx9aFFGU+zDZ0GNQDnFv8TRntJqFYaRmQDH+4cKxvAVK68pShXyZd6WFkt7S3k7AtQ5a3+9MgOctP1aIKq0e5XruGwgeH5xCcwRa+3tra0uLOdMo9xv1+ucjK/W/DWqTIWLD2TaPNQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM0PR04MB5140.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(396003)(39860400002)(136003)(366004)(376002)(186003)(316002)(1076003)(66476007)(2906002)(15650500001)(6486002)(5660300002)(38100700002)(2616005)(86362001)(83380400001)(44832011)(478600001)(4326008)(52116002)(6506007)(6666004)(8936002)(6512007)(66946007)(6916009)(8676002)(66556008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4UWpo3Y/z6qmBhl0075/IrG81AUhwgB/tS54z86eymGJGlxULrdQ5Zis0TW/?=
 =?us-ascii?Q?T900Y4+fOPsNTLmaktiRSop8unO2rmpncy3RIdbjv2zX2N4q6VKjOeEtpAmL?=
 =?us-ascii?Q?kkJ7+vMWnZzldzqwqRSBHpUCavv+9Y5hsHx3TNKRVPe2lSxHyZUXhP/4arbj?=
 =?us-ascii?Q?ZWnsx4sRIioTMc3q2tPR7cjDk67M+iji1OzzRjs+/ZEaKFxNn6Rlbtelfcs3?=
 =?us-ascii?Q?/yETJRVEaOJ2eat/X/hP83NfkV7Bo5kLhlERzZjvNnwEx65y6PrnBgmDC/D4?=
 =?us-ascii?Q?wbJDECizrsuYpXXnNJSXW7iuu7Up4GTsDAHh2oY6/ge1aW/kl5eVeFYFPSqf?=
 =?us-ascii?Q?nf5GST3w6YwnZ9h1pKaTQOW0SPF3+CGXvHnuES28D839Z0LJo9/F4FrNKy1a?=
 =?us-ascii?Q?9XPwoYXL7i/ZG2kLMZ9pZknq+z2OjXoH0wdmUkzQAuLOd8VVNyqiJuyvczMt?=
 =?us-ascii?Q?tie3erfRPlMTwrZpjn6xS/+YJXHL4VRRLdyCIw+CL5DNrQKE73Nc+UrXpdFb?=
 =?us-ascii?Q?eF5Bawr/XtzsMQqjgH/Q9xz2aDkxLygJIdLiBDscrKuMGOJOYjJTe8+BvSN3?=
 =?us-ascii?Q?xLLrzNGX92PTlK9h5K8nMsTNmTjTJwgrB5C/63cua6Dkdaha+Mn0+nha07V6?=
 =?us-ascii?Q?XvY74PWE9arLi6g5Dbh7lV1wqlv6Zkj76UufuydbzUo1FyiP8gMDgGMsgv+h?=
 =?us-ascii?Q?MWAZY9A+Z3ecxA7fu4mr0eoysI/f0PsXlzO7YAIjfGIKEsUF4dsOkpZcM625?=
 =?us-ascii?Q?ZT3+CLtDOUXhn570TcKzVS76sYChlIuUQzQfek9AEKPAFOMKMT9/vmp3gJB+?=
 =?us-ascii?Q?msPreX1WQ1m9ein/ij0HHTdWA2AaJpaFtfdwmrOOQi5Q/Ab9C9nn0AajpdMV?=
 =?us-ascii?Q?KIMlwe14rVQuMi8uiiPC+TArNFoETickMRA4vuF6OgalLpcysTpp3WE15CHM?=
 =?us-ascii?Q?gTC3VE/BqVtrNpzYdClCD24TNV3yUjAJQAziJw08SRH3Q/dfqkWI6HfioX23?=
 =?us-ascii?Q?UHLu15AQ97bjCQVw8XuHBrbfjR9NmHuSQKWQjEPe5GRjv9x6ZYJ5Q0HoY525?=
 =?us-ascii?Q?yPSHFBy1GYDR1KymKiZTzoGed7k/XyBtPnDg7HKyEmFcy06qxuwc5unwrS3v?=
 =?us-ascii?Q?BSVZkHcJpphMMgGQzwwlemgTH9f0Ytb+zxiYI1/qW6WUg7cjjtrH1+/GUjxi?=
 =?us-ascii?Q?TNUOcvF+Z1h5zUt04bgd5Jp8zyhcHq6XoHPCXwBCX0jWK9rGV6FRDr+4Y4OM?=
 =?us-ascii?Q?5adIh0f9Hdrf5JA9en3CFQnD+h3p6U7Vrw3UjXhl5EKmIWPO4n/s41mGFhMo?=
 =?us-ascii?Q?dt+7DnJe45nYWM5i9R+CVMHckBVrkP+xwn0E1DJDB+9NliqFVpFBXlgznotj?=
 =?us-ascii?Q?vVvdV2FPZybxHf8pxGTp86dIX9i05MIsxuPYr9sqM+6u8mHlog=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e598da2-d603-4b8a-9bd2-08d979e8af14
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB5140.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2021 14:37:32.7901 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZEwdgLS2b8nAr5RnyDDoVpLz0wSXzkmdBL/LZ8r2x8VeHcnUlp/o/WX2xRTNSfX/RrhsOB8B/6F4unYi/gTNvw==
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

Add a kernel debug flag to enable a one-shot topology
verification for all pipelines including the dynamic
ones. If the debug flag is set, all the topology
component loading will be verified during the complete
callback.

Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
---
 sound/soc/sof/pm.c        |  4 ++--
 sound/soc/sof/sof-audio.c | 37 +++++++++++++++++++++++++------------
 sound/soc/sof/sof-audio.h |  4 ++--
 sound/soc/sof/sof-priv.h  |  1 +
 sound/soc/sof/topology.c  | 17 ++++++++++++++++-
 5 files changed, 46 insertions(+), 17 deletions(-)

diff --git a/sound/soc/sof/pm.c b/sound/soc/sof/pm.c
index ea27567d2fe4..9ec091130323 100644
--- a/sound/soc/sof/pm.c
+++ b/sound/soc/sof/pm.c
@@ -157,7 +157,7 @@ static int sof_resume(struct device *dev, bool runtime_resume)
 	}
 
 	/* restore pipelines */
-	ret = sof_set_up_pipelines(sdev->dev);
+	ret = sof_set_up_pipelines(sdev->dev, false);
 	if (ret < 0) {
 		dev_err(sdev->dev,
 			"error: failed to restore pipeline after resume %d\n",
@@ -208,7 +208,7 @@ static int sof_suspend(struct device *dev, bool runtime_suspend)
 	if (target_state == SOF_DSP_PM_D0)
 		goto suspend;
 
-	sof_tear_down_pipelines(dev);
+	sof_tear_down_pipelines(dev, false);
 
 	/* release trace */
 	snd_sof_release_trace(sdev);
diff --git a/sound/soc/sof/sof-audio.c b/sound/soc/sof/sof-audio.c
index 7b4dd64576fa..c4cabe26b157 100644
--- a/sound/soc/sof/sof-audio.c
+++ b/sound/soc/sof/sof-audio.c
@@ -589,7 +589,7 @@ const struct sof_ipc_pipe_new *snd_sof_pipeline_find(struct snd_sof_dev *sdev,
 	return NULL;
 }
 
-int sof_set_up_pipelines(struct device *dev)
+int sof_set_up_pipelines(struct device *dev, bool verify)
 {
 	struct snd_sof_dev *sdev = dev_get_drvdata(dev);
 	struct snd_sof_widget *swidget;
@@ -599,7 +599,7 @@ int sof_set_up_pipelines(struct device *dev)
 	/* restore pipeline components */
 	list_for_each_entry_reverse(swidget, &sdev->widget_list, list) {
 		/* only set up the widgets belonging to static pipelines */
-		if (swidget->dynamic_pipeline_widget)
+		if (!verify && swidget->dynamic_pipeline_widget)
 			continue;
 
 		/* update DAI config. The IPC will be sent in sof_widget_setup() */
@@ -630,8 +630,8 @@ int sof_set_up_pipelines(struct device *dev)
 	list_for_each_entry(sroute, &sdev->route_list, list) {
 
 		/* only set up routes belonging to static pipelines */
-		if (sroute->src_widget->dynamic_pipeline_widget ||
-		    sroute->sink_widget->dynamic_pipeline_widget)
+		if (!verify && (sroute->src_widget->dynamic_pipeline_widget ||
+				sroute->sink_widget->dynamic_pipeline_widget))
 			continue;
 
 		ret = sof_route_setup_ipc(sdev, sroute);
@@ -646,7 +646,7 @@ int sof_set_up_pipelines(struct device *dev)
 		switch (swidget->id) {
 		case snd_soc_dapm_scheduler:
 			/* only complete static pipelines */
-			if (swidget->dynamic_pipeline_widget)
+			if (!verify && swidget->dynamic_pipeline_widget)
 				continue;
 
 			swidget->complete =
@@ -661,24 +661,37 @@ int sof_set_up_pipelines(struct device *dev)
 }
 
 /*
- * This function doesn't free widgets. It only resets the set up status for all routes and
- * use_count for all widgets.
+ * This function doesn't free widgets during suspend. It only resets the set up status for all
+ * routes and use_count for all widgets.
  */
-void sof_tear_down_pipelines(struct device *dev)
+int sof_tear_down_pipelines(struct device *dev, bool verify)
 {
 	struct snd_sof_dev *sdev = dev_get_drvdata(dev);
 	struct snd_sof_widget *swidget;
 	struct snd_sof_route *sroute;
+	int ret;
 
 	/*
-	 * No need to protect swidget->use_count and sroute->setup as this function is called only
-	 * during the suspend callback and all streams should be suspended by then
+	 * This function is called during suspend and for one-time topology verification during
+	 * first boot. In both cases, there is no need to protect swidget->use_count and
+	 * sroute->setup because during suspend all streams are suspended and during topology
+	 * loading the sound card unavailable to open PCMs.
 	 */
-	list_for_each_entry(swidget, &sdev->widget_list, list)
-		swidget->use_count = 0;
+	list_for_each_entry_reverse(swidget, &sdev->widget_list, list) {
+		if (!verify) {
+			swidget->use_count = 0;
+			continue;
+		}
+
+		ret = sof_widget_free(sdev, swidget);
+		if (ret < 0)
+			return ret;
+	}
 
 	list_for_each_entry(sroute, &sdev->route_list, list)
 		sroute->setup = false;
+
+	return 0;
 }
 
 /*
diff --git a/sound/soc/sof/sof-audio.h b/sound/soc/sof/sof-audio.h
index 8d1fc6a8d7d0..149b3dbcddd1 100644
--- a/sound/soc/sof/sof-audio.h
+++ b/sound/soc/sof/sof-audio.h
@@ -246,8 +246,8 @@ int snd_sof_ipc_set_get_comp_data(struct snd_sof_control *scontrol,
 int sof_pcm_dai_link_fixup(struct snd_soc_pcm_runtime *rtd, struct snd_pcm_hw_params *params);
 
 /* PM */
-int sof_set_up_pipelines(struct device *dev);
-void sof_tear_down_pipelines(struct device *dev);
+int sof_set_up_pipelines(struct device *dev, bool verify);
+int sof_tear_down_pipelines(struct device *dev, bool verify);
 int sof_set_hw_params_upon_resume(struct device *dev);
 bool snd_sof_stream_suspend_ignored(struct snd_sof_dev *sdev);
 bool snd_sof_dsp_only_d0i3_compatible_stream_active(struct snd_sof_dev *sdev);
diff --git a/sound/soc/sof/sof-priv.h b/sound/soc/sof/sof-priv.h
index 9b1bdba15c74..33610c60b57f 100644
--- a/sound/soc/sof/sof-priv.h
+++ b/sound/soc/sof/sof-priv.h
@@ -23,6 +23,7 @@
 /* debug flags */
 #define SOF_DBG_ENABLE_TRACE	BIT(0)
 #define SOF_DBG_RETAIN_CTX	BIT(1)	/* prevent DSP D3 on FW exception */
+#define SOF_DBG_VERIFY_TPLG	BIT(2) /* verify topology during load */
 
 #define SOF_DBG_DUMP_REGS		BIT(0)
 #define SOF_DBG_DUMP_MBOX		BIT(1)
diff --git a/sound/soc/sof/topology.c b/sound/soc/sof/topology.c
index d8eb238e5229..44d60081bc26 100644
--- a/sound/soc/sof/topology.c
+++ b/sound/soc/sof/topology.c
@@ -3452,8 +3452,23 @@ static int sof_complete(struct snd_soc_component *scomp)
 		}
 	}
 
+	/* verify topology components loading including dynamic pipelines */
+	if (sof_core_debug & SOF_DBG_VERIFY_TPLG) {
+		ret = sof_set_up_pipelines(scomp->dev, true);
+		if (ret < 0) {
+			dev_err(sdev->dev, "error: topology verification failed %d\n", ret);
+			return ret;
+		}
+
+		ret = sof_tear_down_pipelines(scomp->dev, true);
+		if (ret < 0) {
+			dev_err(sdev->dev, "error: topology tear down pipelines failed %d\n", ret);
+			return ret;
+		}
+	}
+
 	/* set up static pipelines */
-	return sof_set_up_pipelines(scomp->dev);
+	return sof_set_up_pipelines(scomp->dev, false);
 }
 
 /* manifest - optional to inform component of manifest */
-- 
2.27.0

