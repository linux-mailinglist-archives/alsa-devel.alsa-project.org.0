Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CF834535BA
	for <lists+alsa-devel@lfdr.de>; Tue, 16 Nov 2021 16:24:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7ADF316CD;
	Tue, 16 Nov 2021 16:24:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7ADF316CD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637076293;
	bh=R3TCTJ/XHELNVQADjItewi3qgAfiuoilhf1wJ+la7qo=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=I+ABX9vz3zPmsIEzk6OAGzexBNWiZtUlJGdvuSNuONPaqUm/iES9d6K28a9Qh6lJl
	 toe12HlVt/9wVNC5i2J7ydKEgwhM5pSrG6JtJHGBZWdMVcGwVcD+LoPyGThUAmWWFu
	 l5rw5wAnw4JhZ3B4E5jMnezQI8V0SkzclNWgLoUg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 041DDF80508;
	Tue, 16 Nov 2021 16:22:26 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E577DF804F3; Tue, 16 Nov 2021 16:22:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 MSGID_FROM_MTA_HEADER,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80073.outbound.protection.outlook.com [40.107.8.73])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6C7D5F80423
 for <alsa-devel@alsa-project.org>; Tue, 16 Nov 2021 16:22:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6C7D5F80423
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=NXP1.onmicrosoft.com
 header.i=@NXP1.onmicrosoft.com header.b="RU7WhU0s"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YTWCBxVeuN0Blez+5F65mQaBAh92UIw+qhuVKm9HZHYpHPYkCaYE+73zeaOif5KsiP/DZLx02yShg46WHUQ7p5LiCe3oahEJvDMosiquopzImb6XzYUxS6u00wMQx4qYLfpb9YPxS0OBxIVlS4ws46nvritpb1AOBXy2bmNGKc6GsYIP6aeVrx5nsMwXJKu52+l+bZNTuWJ8375l8D4poNf0370oLnn/RobOQcGtUBajBCF4oZWXrFEos7AcwrNb2F+KBdr8/81Oz6JLA0Og5+nS/aMcdXWSR2M966+bBVnPfoWDDrB6C/GA27GayQBPZLrlj6VMY9vwa/jDdqqJuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tvv/0YJKWYkflLH+1wJtCCao9SKMDhETORHXs0z0yfI=;
 b=Xu/qsl/RQBbCW8HaA0CJFKYr0ITG8dyUwo14SVk+QOUIag/2S2y8jG/9wEZYwzjIS3xY6rqApmjIVYjlX0P6xZeKp4BuaWPHZmj3moEfUbUEDouwwVlwchfMNpRUq261Jyt8jI/4k28WH8R3BJdEVKRtnpAI7F1cw5RSnwdCFeOfO9fm0dPZFZUzoJcPRqdWbj7V2bBQhVScJJikCx21SKkLDS2ahSDVgp5C8rK7v8J02QwEeRSj0HKeTA2VWkLpDeJo38k18TljeNfftUbpGorvHm5Q9MtpBwDB6ZyTfdkyhgM1FzWbU1OEVIGI1lj6F4nx2bLhmLUXkUZqDKRY2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tvv/0YJKWYkflLH+1wJtCCao9SKMDhETORHXs0z0yfI=;
 b=RU7WhU0sCylX985BARuiNBxsxhgmFFqktt5kipr6WvBrY+j78gY5BEJYG6Izbr0Z44OFyKkGOeGp5rBPZ1+Lu8tD9YOkVhbDOK8eeJeyHGttB9dIlIB7jKh+J22TBSp7kJVZwnhhe4Ke4yaaRMAnSp9SJ7WzPoUrRj9j3GxAT8Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from VI1PR04MB5151.eurprd04.prod.outlook.com (2603:10a6:803:61::28)
 by VE1PR04MB7213.eurprd04.prod.outlook.com (2603:10a6:800:1b3::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.26; Tue, 16 Nov
 2021 15:22:05 +0000
Received: from VI1PR04MB5151.eurprd04.prod.outlook.com
 ([fe80::85af:f8be:aa99:ba5f]) by VI1PR04MB5151.eurprd04.prod.outlook.com
 ([fe80::85af:f8be:aa99:ba5f%3]) with mapi id 15.20.4690.027; Tue, 16 Nov 2021
 15:22:05 +0000
From: Daniel Baluta <daniel.baluta@oss.nxp.com>
To: broonie@kernel.org,
	peter.ujfalusi@linux.intel.com
Subject: [PATCH 4/4] ASoC: SOF: debug: Add support for IPC message injection
Date: Tue, 16 Nov 2021 17:21:37 +0200
Message-Id: <20211116152137.52129-5-daniel.baluta@oss.nxp.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20211116152137.52129-1-daniel.baluta@oss.nxp.com>
References: <20211116152137.52129-1-daniel.baluta@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM4PR0302CA0013.eurprd03.prod.outlook.com
 (2603:10a6:205:2::26) To VI1PR04MB5151.eurprd04.prod.outlook.com
 (2603:10a6:803:61::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (2a02:2f08:5706:b700:1e69:ee6:2dad:c9e7)
 by AM4PR0302CA0013.eurprd03.prod.outlook.com (2603:10a6:205:2::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.16 via Frontend
 Transport; Tue, 16 Nov 2021 15:22:03 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fb3c13db-7e3b-4023-fd73-08d9a914d88e
X-MS-TrafficTypeDiagnostic: VE1PR04MB7213:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-Microsoft-Antispam-PRVS: <VE1PR04MB7213B8350BDB9FD240DCBD05B8999@VE1PR04MB7213.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:576;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qioCDHpL2+UMpyH5C8nC0SvIMt9pWqcxZ87AFnSpX1QuzHIitpZwp/W3Lq2RW3/3Z/uox70iZKrj0hiYnOVfTSjrq+XBt2At5bndGNCKCoEJroG/wP70WEHVPwTEzDZpz7qL1t3UbrnXn7oRTIudbLi4aQn6kp9QrEV07vpj5xCC6fRRyfoi1x47RpnhwSJDkB7LRzVifk08RerfBDnEnFKwqHx8u0mSVNP5nL/BXl6a6cLroEFw9i8GbBOdMnyR9q9ZbYwRw3OvHs5r7mmQV2abMrm06mHHkjfGowoduilqWGCOSV3wHui4gvyHAb4EFTXsrBxx1IG55XnTCainBmWE1H2PdsFFYyOQh1nEwavUzr8wQRCQ/jQHPYshuKjUALHyF+PIisOD3yuy38SW2xNvH06f/DOa2lbStG8SrU1qX/hKBDGGQPpPJTw+M8jNrowsjVJP8az9Ag6gsuYV1A+5Sph103KOGFKG5q8BQDPfi9KoyYNY+QwiA9Y4QgY7WpeFTcAjyfloqLGUxP0ig5mAUt/VsclOMysoPfi6Nzgz4vLHyO1muoVnB1i31fieirgrtzn8DsCTV7PeiJo+aurlYF/7FiKpMrbGDUdmpwQ9Mg7+sJ6hQl823RC7CxhakM9Vv1N4a3+fnsoGlpTBpQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB5151.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(86362001)(54906003)(15650500001)(6666004)(44832011)(2616005)(66476007)(66556008)(66946007)(8676002)(8936002)(38100700002)(186003)(316002)(83380400001)(1076003)(508600001)(6486002)(5660300002)(52116002)(4326008)(2906002)(6512007)(7416002)(6506007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?3GzETrlWWQ/x+j5OgVWdXdoo1UtQ64PDsHPE0N9qjShUN7vS8T3t24nBTWPB?=
 =?us-ascii?Q?QBtgkaZ693zDsdYiDHz6uCYoVuvDVmLUI1K0ecsmbSbYyyIa3FguyAfrmjFD?=
 =?us-ascii?Q?3ibQnFYk0AdkhU1TeR8HLnVfBre9qbp1F1st6w7/QjQfKO12AMLgtG9UIaiG?=
 =?us-ascii?Q?VEteZ0jgbyVkYcbPX5z5XfjwiYUlrdsUKX3MP6YhVYdHsXobvaifnXVfCZPv?=
 =?us-ascii?Q?nGilTLk1oHycmsE5jpUCbb0iSoa1275In/g5kb/3kMlowGNwG57nw1PYe//y?=
 =?us-ascii?Q?pd4Hb7b/lBvKmsd6Q/b4a3ebBDmgVpEFAQ2cVnnoqcalSMnspmt9L/0Ms7UV?=
 =?us-ascii?Q?FcbBbLxuJpJRrDk+G+ygvEYBCHFiQZSnZbTaItn/ZB67Tx18EtPr5a5NtD7U?=
 =?us-ascii?Q?PN+RP0cw6mf3HOeeqPP+I7sztz2QOK0kOV1lbkHF9NU1biud41iVl+Je75OS?=
 =?us-ascii?Q?IdciwojiQ8pvY9k1uVFvnyGsyJ8HwGNtEzjeMw5FHkJxRrOwPrfUOEXEKzhz?=
 =?us-ascii?Q?69SLA7ZbdEBShL2udNmee46hD6hOvAGwQQAwtzF59MVTU29e3mhC9xLWK0l/?=
 =?us-ascii?Q?y/TmjM97ALWQaa0/mquCJ6c+PlZuxe/p+UG532Q2IhVptKdzoiLwFVFqKnHl?=
 =?us-ascii?Q?4FOCq4lyCIeM2BP+A0vTaW44640aJy6UqxfgW4tpf0XAdi7A5DmLv7Lomn8I?=
 =?us-ascii?Q?xe6gwgScm3b6kn3ctFYhMSRyY61lC9UazrAyugZgYBFy3y21/wp1gz5XF0ul?=
 =?us-ascii?Q?z6o876Y0Bybtd05mFlT7h5CrpSMgnSTFu+S8pN0Q/vrRzYmxl09l7vIdDfch?=
 =?us-ascii?Q?Nz/C3iFRLZixDJ4s2yt+fepfFCV3z675DtgGeVRkXg5D7UB3vgNfd5/M9++F?=
 =?us-ascii?Q?MDWItE0ySNu7gvn3M6iB4wfw8ybu2EC4yzKLABa+BTE0TucovPuUs2GDyBT/?=
 =?us-ascii?Q?Fl0cSuse0QCZzlKT7hJvjc+TmDrzlSdbN+det28QAk7ckNWCz/xhk7fV95bU?=
 =?us-ascii?Q?2S+EUW0dGET6wdUgMijaBj9OEQymdHlWnlUWB9k5cSoLEfQQ7aNu7WQd9mVM?=
 =?us-ascii?Q?ZKjs4A8Hzb63Vx22RUvtz9j4Hat3+uvIGLN63fWgubhb6aLy98wI7D606tMV?=
 =?us-ascii?Q?Vmgg6+NbUCgmA8Z/iNsDeXWmA6+MZXZOIijYmEPPA3BDkQE5E/Ku58aRChmM?=
 =?us-ascii?Q?WxzB0+cMhlBa3M9WMGXeUL3VefJDyccUONFHaSP1MTAssJNN8F5jLB7swpVN?=
 =?us-ascii?Q?dUrHmeZ7jX6sDE8GuufOLYOgyHqTI/Qz64e8c4h7HVB5Iz+UfMAGxbidwthZ?=
 =?us-ascii?Q?oc4r9WfEqM7BUZgyquBZjxcLBuLsCbqXzpYol6hRGd8KbmRqD26FhGhTiEQw?=
 =?us-ascii?Q?5HivdEc7yLCQrgKmt5fhHQaw6p0qWaFx18+QBKUQ3L+9rZDanx08kdueIeth?=
 =?us-ascii?Q?C5dEgR+nGXluQJKYUmSnIsgpWyxRR2ia+1/wXuY7xZLrB1Er8TmRqvpl5IZs?=
 =?us-ascii?Q?ERLL3D5wSSebANo6iiwq7OHGCzErq0aYRJ/TLmoA6HLO81CMjmAoUfApn+gu?=
 =?us-ascii?Q?+bh9lWMR1ReHuF+hwPoS5Owb8oiKgh40Fbjb26uO1M8woARCcSJP/bZMt9Qr?=
 =?us-ascii?Q?4MA8QN1uwEHqkSZ0RX8qVcZYMDcRRz55St64bQMZLFySfSEnVIMC/5JGdqIJ?=
 =?us-ascii?Q?yviXwAAmCosqI10dMMar6Uj2DL2IsYpri8CLZhncQ8YVi3GM?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb3c13db-7e3b-4023-fd73-08d9a914d88e
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5151.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2021 15:22:04.9164 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lSCCyrA3xlAfyoiwvV3hEFUaicMOBgkAEyNEh7De8FPOAr2hTfffLmCHrVbG7ZyuEtg7kAKBBI0iBwUVYz+NhQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7213
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 daniel.baluta@gmail.com, kai.vehmanen@linux.intel.com, lgirdwood@gmail.com,
 Rander Wang <rander.wang@intel.com>, linux-kernel@vger.kernel.org,
 ranjani.sridharan@linux.intel.com, pierre-louis.bossart@linux.intel.com,
 alsa-devel@alsa-project.org, daniel.baluta@nxp.com
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

From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>

In order to stress test the firmware's ability to handle (mis)crafted
IPC messages this patch adds a debugfs interface where a binary file
(message) can be written and the message is sent to the firmware as it is.

Read on the same file will return the reply from the firmware if it is
available as a binary.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
---
 sound/soc/sof/Kconfig    |   8 +++
 sound/soc/sof/debug.c    | 107 +++++++++++++++++++++++++++++++++++++++
 sound/soc/sof/sof-priv.h |   4 ++
 3 files changed, 119 insertions(+)

diff --git a/sound/soc/sof/Kconfig b/sound/soc/sof/Kconfig
index b6fa659179b6..89eea5558190 100644
--- a/sound/soc/sof/Kconfig
+++ b/sound/soc/sof/Kconfig
@@ -194,6 +194,14 @@ config SND_SOC_SOF_DEBUG_IPC_FLOOD_TEST
 	  Say Y if you want to enable IPC flood test.
 	  If unsure, select "N".
 
+config SND_SOC_SOF_DEBUG_IPC_MSG_INJECTOR
+	bool "SOF enable IPC message injector"
+	help
+	  This option enables the IPC message injector which can be used to send
+	  crafted IPC messages to the DSP to test its robustness.
+	  Say Y if you want to enable the IPC message injector.
+	  If unsure, select "N".
+
 config SND_SOC_SOF_DEBUG_RETAIN_DSP_CONTEXT
 	bool "SOF retain DSP context on any FW exceptions"
 	help
diff --git a/sound/soc/sof/debug.c b/sound/soc/sof/debug.c
index dc1df5fb7b4c..2f8b5ac9b78a 100644
--- a/sound/soc/sof/debug.c
+++ b/sound/soc/sof/debug.c
@@ -336,6 +336,104 @@ static int sof_debug_ipc_flood_test(struct snd_sof_dev *sdev,
 }
 #endif
 
+#if IS_ENABLED(CONFIG_SND_SOC_SOF_DEBUG_IPC_MSG_INJECTOR)
+static ssize_t msg_inject_read(struct file *file, char __user *buffer,
+			       size_t count, loff_t *ppos)
+{
+	struct snd_sof_dfsentry *dfse = file->private_data;
+	struct sof_ipc_reply *rhdr = dfse->msg_inject_rx;
+
+	if (!rhdr->hdr.size || !count || *ppos)
+		return 0;
+
+	if (count > rhdr->hdr.size)
+		count = rhdr->hdr.size;
+
+	if (copy_to_user(buffer, dfse->msg_inject_rx, count))
+		return -EFAULT;
+
+	*ppos += count;
+	return count;
+}
+
+static ssize_t msg_inject_write(struct file *file, const char __user *buffer,
+				size_t count, loff_t *ppos)
+{
+	struct snd_sof_dfsentry *dfse = file->private_data;
+	struct snd_sof_dev *sdev = dfse->sdev;
+	struct sof_ipc_cmd_hdr *hdr = dfse->msg_inject_tx;
+	size_t size;
+	int ret, err;
+
+	if (*ppos)
+		return 0;
+
+	size = simple_write_to_buffer(dfse->msg_inject_tx, SOF_IPC_MSG_MAX_SIZE,
+				      ppos, buffer, count);
+	if (size != count)
+		return size > 0 ? -EFAULT : size;
+
+	ret = pm_runtime_get_sync(sdev->dev);
+	if (ret < 0 && ret != -EACCES) {
+		dev_err_ratelimited(sdev->dev, "%s: DSP resume failed: %d\n",
+				    __func__, ret);
+		pm_runtime_put_noidle(sdev->dev);
+		goto out;
+	}
+
+	/* send the message */
+	memset(dfse->msg_inject_rx, 0, SOF_IPC_MSG_MAX_SIZE);
+	ret = sof_ipc_tx_message(sdev->ipc, hdr->cmd, dfse->msg_inject_tx, count,
+				 dfse->msg_inject_rx, SOF_IPC_MSG_MAX_SIZE);
+
+	pm_runtime_mark_last_busy(sdev->dev);
+	err = pm_runtime_put_autosuspend(sdev->dev);
+	if (err < 0)
+		dev_err_ratelimited(sdev->dev, "%s: DSP idle failed: %d\n",
+				    __func__, err);
+
+	/* return size if test is successful */
+	if (ret >= 0)
+		ret = size;
+
+out:
+	return ret;
+}
+
+static const struct file_operations msg_inject_fops = {
+	.open = simple_open,
+	.read = msg_inject_read,
+	.write = msg_inject_write,
+	.llseek = default_llseek,
+};
+
+static int snd_sof_debugfs_msg_inject_item(struct snd_sof_dev *sdev,
+					   const char *name, mode_t mode,
+					   const struct file_operations *fops)
+{
+	struct snd_sof_dfsentry *dfse;
+
+	dfse = devm_kzalloc(sdev->dev, sizeof(*dfse), GFP_KERNEL);
+	if (!dfse)
+		return -ENOMEM;
+
+	/* pre allocate the tx and rx buffers */
+	dfse->msg_inject_tx = devm_kzalloc(sdev->dev, SOF_IPC_MSG_MAX_SIZE, GFP_KERNEL);
+	dfse->msg_inject_rx = devm_kzalloc(sdev->dev, SOF_IPC_MSG_MAX_SIZE, GFP_KERNEL);
+	if (!dfse->msg_inject_tx || !dfse->msg_inject_rx)
+		return -ENOMEM;
+
+	dfse->type = SOF_DFSENTRY_TYPE_BUF;
+	dfse->sdev = sdev;
+
+	debugfs_create_file(name, mode, sdev->debugfs_root, dfse, fops);
+	/* add to dfsentry list */
+	list_add(&dfse->list, &sdev->dfsentry_list);
+
+	return 0;
+}
+#endif
+
 static ssize_t sof_dfsentry_write(struct file *file, const char __user *buffer,
 				  size_t count, loff_t *ppos)
 {
@@ -812,6 +910,15 @@ int snd_sof_dbg_init(struct snd_sof_dev *sdev)
 		return err;
 #endif
 
+#if IS_ENABLED(CONFIG_SND_SOC_SOF_DEBUG_IPC_MSG_INJECTOR)
+	err = snd_sof_debugfs_msg_inject_item(sdev, "ipc_msg_inject", 0644,
+					      &msg_inject_fops);
+
+	/* errors are only due to memory allocation, not debugfs */
+	if (err < 0)
+		return err;
+#endif
+
 	return 0;
 }
 EXPORT_SYMBOL_GPL(snd_sof_dbg_init);
diff --git a/sound/soc/sof/sof-priv.h b/sound/soc/sof/sof-priv.h
index 2c97ffa98e3e..9a8af76b2f8b 100644
--- a/sound/soc/sof/sof-priv.h
+++ b/sound/soc/sof/sof-priv.h
@@ -325,6 +325,10 @@ struct snd_sof_dfsentry {
 	enum sof_debugfs_access_type access_type;
 #if ENABLE_DEBUGFS_CACHEBUF
 	char *cache_buf; /* buffer to cache the contents of debugfs memory */
+#endif
+#if IS_ENABLED(CONFIG_SND_SOC_SOF_DEBUG_IPC_MSG_INJECTOR)
+	void *msg_inject_tx;
+	void *msg_inject_rx;
 #endif
 	struct snd_sof_dev *sdev;
 	struct list_head list;  /* list in sdev dfsentry list */
-- 
2.27.0

