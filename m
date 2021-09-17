Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D12AF40FA89
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Sep 2021 16:42:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 72A8A176A;
	Fri, 17 Sep 2021 16:41:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 72A8A176A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1631889733;
	bh=ScX4xCpGBqBIeLCegMfnbuZ5pBdq7whTSBCYmTwho0o=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=It7/wAlhnMYBr5LeBkkb/4bJ8QbAURt9bfgTBR6k6/XgujhusqW4cKKU1XQqp/I0y
	 KgbDXWKMYgMH65OuZNLvMPVIho5z2qqKpajA1Bo5qfG/Wb4icFTgQcZOClpVRmoY3E
	 bTiPxmvGkdD+RQKPMHzyLPGV1MDBxawW/v8V084E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4EBA4F80536;
	Fri, 17 Sep 2021 16:37:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4DFCAF80516; Fri, 17 Sep 2021 16:37:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 MSGID_FROM_MTA_HEADER, SPF_HELO_NONE, SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2055.outbound.protection.outlook.com [40.107.21.55])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 61567F804E3
 for <alsa-devel@alsa-project.org>; Fri, 17 Sep 2021 16:37:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 61567F804E3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=NXP1.onmicrosoft.com
 header.i=@NXP1.onmicrosoft.com header.b="QvECo/Nd"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Sf9gIQ4SCV7t/XA/zHUPIBF5bUMc4pW2o+Jeaax+NPQthmIQIuNNkSMoma1678CEfbgQI6nE7PmzG7qKLKQ28RLeUunN9dM6CnyUsKRT9COY7TlDaAwNgo0zN5A4z8Pb9m98y/xboJ6JNJghraQQu2TqtN8rN3D/fdEPIGYnf0XEdVbNyS49Gmq0AzJrJMCP+BzSMFtic6LSO25DW8qDbe3QWkMKYFCaLQrr8fqlLgWP9f2VMJY2B99nYq31dKuNOHjiKwJgp0Eo1YmbP/I4ISiqz3kJmmGVUNJsGASW6HJpvgVFbnBU4ep6spEXBkJczI1Z+1pT1SAbgiLo1e6TYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=VMwkP4aXGxaLC1Drq1sUR0WsLmjziS7Hrag0QbZaLgM=;
 b=Eq+FuM6jTJVCHkFUXculOs1zlYGs5rfUAekbe1vldVKHFutSC3juSaxf5CfHLp5Dq/iyWrSIXzea9l4th5OgPY6uyWBpqnL88GPXSuFAKoUwhPnyOX3NPe4WzCG0JH7BLj12AfiBxFdI8cXbsNDkbAybxDVhIIupxJFHSF9R1tpT7uUp5y389EgZwO/+pBc9CXRf3uQd3AK85BEmBjXJMNZfqpVJ67hSMKUALb6y7SKSQ8xQyEQ+vNvfTFaXcmRxWuWnhsQokUsxpT/WSAo+YG1rblx87R90P2WF/flr4rUXQi5QV07W3/BNPdtevfh2ClGYk4ebvR96fXu9KTRrmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VMwkP4aXGxaLC1Drq1sUR0WsLmjziS7Hrag0QbZaLgM=;
 b=QvECo/NdM7mNSpcXuVDD+EMjcgkyUqXjC9BhMPWmrVC5yNVWODFaaL1qjDNP4V4mprS80EHqoLcnGer73Y4a+Z1eNV2suOKIaXMVu+D1HPfuNrWd1+w6Q1qP8GAr2ABlGBokJCt/12KwAyBflIlOrP1Vbmw+cE2SH6niEugz4x4=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=oss.nxp.com;
Received: from AM0PR04MB5140.eurprd04.prod.outlook.com (2603:10a6:208:ca::21)
 by AM0PR0402MB3506.eurprd04.prod.outlook.com (2603:10a6:208:17::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14; Fri, 17 Sep
 2021 14:37:29 +0000
Received: from AM0PR04MB5140.eurprd04.prod.outlook.com
 ([fe80::dd84:b996:1c8:705]) by AM0PR04MB5140.eurprd04.prod.outlook.com
 ([fe80::dd84:b996:1c8:705%6]) with mapi id 15.20.4523.016; Fri, 17 Sep 2021
 14:37:29 +0000
From: Daniel Baluta <daniel.baluta@oss.nxp.com>
To: broonie@kernel.org
Subject: [PATCH v2 09/12] ASoC: SOF: Introduce widget use_count
Date: Fri, 17 Sep 2021 17:36:56 +0300
Message-Id: <20210917143659.401102-10-daniel.baluta@oss.nxp.com>
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
 Transport; Fri, 17 Sep 2021 14:37:28 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 29942ba7-39b7-4e15-5491-08d979e8ad06
X-MS-TrafficTypeDiagnostic: AM0PR0402MB3506:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM0PR0402MB350672DFC3687F58F903352DB8DD9@AM0PR0402MB3506.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3173;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PiXPeIu4ejo0RtAOILgDpeHgZIJGC0Pk0q+HJyt4CTDKSmFDSLVx30/dMTjZrlYABa37dRwjaOr/GkelImlsH05Z8vPeMIU9ahYjcVnaKJGD8A8lSjlJVuxxrBxncKnKIAuITRKdh63FC6GhQe2QRz9w8cPfTQlZP9A2ddcQLIHegzr9MgwfjhpiLsDJaMr+q3gGzl46PUqlyMvZ7FGJ68DLux8EO8Y3bbMQxsKY4gVQX4q+Ahmnj71cG6hxe07dkhNJcxr192fjNxGRpQRF/lg7WrkI9fc6HvH2XRLyCrFm/rdVYNC/6QzbvySvp7Jw0JMQyOy3PBsyihUxUHREuu7qW+uc88qR7mCWfd9AxR3Xuit+lGr3jkhGhpoL21m3UbVnN6X8VqgcwKSSrTdmdzZZuYE/YTyqykqssjhoVAb/eaCoPunAo/qODMd52IBHZN/jgBhp1RwFMOct1x7Q3llAUrYTjW0plPgbGxmL7jGLmHjR8cMeUCvanp5WngOnkX/4VQmJkgSvKjssn8bHdlXDGErWI3HwdTebPfmREHAsv8jt1JrA8PpP5BMh7DvU4WJBV+aFiKfXrrKx5gmXbyQ7eufze0QAeKmERNXLuakvBX7ewtPRmBcZhHyj/DE8STVc35NZ6Ff1B3j5WH8eKg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM0PR04MB5140.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(396003)(39860400002)(136003)(366004)(376002)(186003)(316002)(1076003)(66476007)(2906002)(6486002)(5660300002)(38100700002)(2616005)(86362001)(83380400001)(44832011)(478600001)(4326008)(52116002)(6506007)(6666004)(8936002)(6512007)(66946007)(6916009)(8676002)(66556008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?bl8E1WwFr62qK2nnqFvejYj4A6oiSHSm+Y/HCmXRmODm933EypU5xczU05IA?=
 =?us-ascii?Q?ikKGxUama7673D8F2whyrcjrWpopFU0esu2fKbmjStjfGEPLuZgPfvUqVXBl?=
 =?us-ascii?Q?K+Ht3a19sPW/f1jfOHeM7q5YqFT6LXBhmgjeQ0os4J0fsGGqnyMokUH8fciQ?=
 =?us-ascii?Q?XXgQ2SFqFYAeaGmtKS8v2Xu5wPwNviFh/K4KMVByg79aXw+o+jjDwEuTgak7?=
 =?us-ascii?Q?aIWqisksQzOmiS/FILKvsujr9Xy+v7kiZ7F5HhxKTvXG4N6XGiRuTWDbsnSN?=
 =?us-ascii?Q?XGe5QxWQHFEyJn2wuuvxAlwBMOqT3rsBPyQPWulEVBwMvSU6fFytOLSkBdyn?=
 =?us-ascii?Q?m5JSjh6EoXmV4e/d5hOwFX2KjW3q15yI7Pb+qHLAvfhmuMTf2gkaVNgvKEJY?=
 =?us-ascii?Q?QqtnM67nrC6c2oteH0PT96OOvYExQMf7klfTUXz7lCbQnoBOcmsnflMMZ4LR?=
 =?us-ascii?Q?ruMwfT584XYXomKFyXmC0B7djr+i/AKRHDO+dkMHtZB9cR3PBeYbYtIPp81s?=
 =?us-ascii?Q?O9muoMygor8F45LEDmluUOg3vpvNygi169PbbKpRBD9txCgWL53bmuuH2vZF?=
 =?us-ascii?Q?DfrtTzmtOsIlXmG9U9I0DUyA/f+6NRgv1CW0/N64TmzHfndGxYeUVHsDFiE5?=
 =?us-ascii?Q?hyvnEYnv/SGu5Q2NdFmWAloex0JyQ88/OFP/elWoojv+4jo7AUcBgrgCC2Q3?=
 =?us-ascii?Q?tP0LxTe0qJMnC9J+VnBQR/Zm0UxVWoIdWabSYI+dSiUMh5ZIN72edPt0NsuS?=
 =?us-ascii?Q?lPqstezi+MkZT7F8PECtnGdy3IOV2mABemU3650n59aRQx/n19calve6gkht?=
 =?us-ascii?Q?h9sFapgNcWPGVjXO7rPUzD8EKqRsfssoy8yI8szHmdBiwBt8EIsK8zOf6v1W?=
 =?us-ascii?Q?Jjd6n1sADY479ScYSIWpS/ZEkrjRCJqPKkAkj9dd6JZ5zQg0yBR+H8WeBq83?=
 =?us-ascii?Q?sHkE4hUlXkxGpzasH42F1TQgjB08Xcg3FKHrzd2+7stTqm37g45ihfkQhkh8?=
 =?us-ascii?Q?gqxSCKdBIgTMqiMWs+A2WnTNxysqi6mEtrhwT+sWYI6Af+4L1ejXxtqjc0wA?=
 =?us-ascii?Q?xwZAr+CZPbaa1d6rctzf620YC3NiRuRBcUqxyP3YDb4XPL4mAErulbnNcmsR?=
 =?us-ascii?Q?T2aYc8PL2GQx028fpJUmSp2ETwF2mGz2FMH9jIUDFIqQojeY7Makmt6N9fQu?=
 =?us-ascii?Q?wRWgh6465lMlu6fjf8VNxSZpRzaAG30vqrX+j+y3iLwSmI+WOpG+tl8ywRsA?=
 =?us-ascii?Q?MxuuslQ5bjCB27z9U6e8jN1yJ5SCWiMr8tc0goNUx5uQO9L879Z/4MuvqBje?=
 =?us-ascii?Q?fKG/yxiviVWD0KbX2ZvZYVYBrP4SmtbQ/L/0yz1P+6yjNqL3zBa9pLIgpz8/?=
 =?us-ascii?Q?Qqp+a4Dp4X1oKK3tfQGvJjL5tSnOJclgEe4u6sCZqqrHLZWwOw=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 29942ba7-39b7-4e15-5491-08d979e8ad06
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB5140.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2021 14:37:29.4071 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Vz8ihlHKlsZ+Vx0KQoR/+g6dL0FovCmEW5lDkjaDGE9rl3r14Gz35jUrzYSZQycGw3GC4s8c+8Bmfu3ezvJyJw==
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

Add a new field, use_count to struct snd_sof_widget to keep track
of the usage count for each widget. Since widgets can belong to
multiple pipelines, this field will ensure that the widget
is setup only when the first pipeline that needs it is started
and freed when the last pipeline that needs it is stopped. There is
no need to protect the widget use_count access as the core already
handles mutual exclusion at the PCM level.
Add a new helper sof_widget_free() to handle freeing the SOF
widgets and export the sof_widget_setup/free() functions.

Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
---
 sound/soc/sof/ipc.c       | 22 +++++++++++
 sound/soc/sof/sof-audio.c | 77 ++++++++++++++++++++++++++++++++++++---
 sound/soc/sof/sof-audio.h |  4 ++
 3 files changed, 97 insertions(+), 6 deletions(-)

diff --git a/sound/soc/sof/ipc.c b/sound/soc/sof/ipc.c
index 5d41924f37a6..ecb424161e80 100644
--- a/sound/soc/sof/ipc.c
+++ b/sound/soc/sof/ipc.c
@@ -719,9 +719,31 @@ int snd_sof_ipc_set_get_comp_data(struct snd_sof_control *scontrol,
 	struct sof_ipc_fw_ready *ready = &sdev->fw_ready;
 	struct sof_ipc_fw_version *v = &ready->version;
 	struct sof_ipc_ctrl_data_params sparams;
+	struct snd_sof_widget *swidget;
+	bool widget_found = false;
 	size_t send_bytes;
 	int err;
 
+	list_for_each_entry(swidget, &sdev->widget_list, list) {
+		if (swidget->comp_id == scontrol->comp_id) {
+			widget_found = true;
+			break;
+		}
+	}
+
+	if (!widget_found) {
+		dev_err(sdev->dev, "error: can't find widget with id %d\n", scontrol->comp_id);
+		return -EINVAL;
+	}
+
+	/*
+	 * Volatile controls should always be part of static pipelines and the widget use_count
+	 * would always be > 0 in this case. For the others, just return the cached value if the
+	 * widget is not set up.
+	 */
+	if (!swidget->use_count)
+		return 0;
+
 	/* read or write firmware volume */
 	if (scontrol->readback_offset != 0) {
 		/* write/read value header via mmaped region */
diff --git a/sound/soc/sof/sof-audio.c b/sound/soc/sof/sof-audio.c
index 4bed50847f1d..7a4aaabf091e 100644
--- a/sound/soc/sof/sof-audio.c
+++ b/sound/soc/sof/sof-audio.c
@@ -83,7 +83,53 @@ static int sof_widget_kcontrol_setup(struct snd_sof_dev *sdev, struct snd_sof_wi
 	return 0;
 }
 
-static int sof_widget_setup(struct snd_sof_dev *sdev, struct snd_sof_widget *swidget)
+int sof_widget_free(struct snd_sof_dev *sdev, struct snd_sof_widget *swidget)
+{
+	struct sof_ipc_free ipc_free = {
+		.hdr = {
+			.size = sizeof(ipc_free),
+			.cmd = SOF_IPC_GLB_TPLG_MSG,
+		},
+		.id = swidget->comp_id,
+	};
+	struct sof_ipc_reply reply;
+	int ret;
+
+	if (!swidget->private)
+		return 0;
+
+	/* only free when use_count is 0 */
+	if (--swidget->use_count)
+		return 0;
+
+	switch (swidget->id) {
+	case snd_soc_dapm_scheduler:
+		ipc_free.hdr.cmd |= SOF_IPC_TPLG_PIPE_FREE;
+		break;
+	case snd_soc_dapm_buffer:
+		ipc_free.hdr.cmd |= SOF_IPC_TPLG_BUFFER_FREE;
+		break;
+	default:
+		ipc_free.hdr.cmd |= SOF_IPC_TPLG_COMP_FREE;
+		break;
+	}
+
+	ret = sof_ipc_tx_message(sdev->ipc, ipc_free.hdr.cmd, &ipc_free, sizeof(ipc_free),
+				 &reply, sizeof(reply));
+	if (ret < 0) {
+		dev_err(sdev->dev, "error: failed to free widget %s\n", swidget->widget->name);
+		swidget->use_count++;
+		return ret;
+	}
+
+	swidget->complete = 0;
+	dev_dbg(sdev->dev, "widget %s freed\n", swidget->widget->name);
+
+	return 0;
+}
+EXPORT_SYMBOL(sof_widget_free);
+
+int sof_widget_setup(struct snd_sof_dev *sdev, struct snd_sof_widget *swidget)
 {
 	struct sof_ipc_pipe_new *pipeline;
 	struct sof_ipc_comp_reply r;
@@ -97,11 +143,15 @@ static int sof_widget_setup(struct snd_sof_dev *sdev, struct snd_sof_widget *swi
 	if (!swidget->private)
 		return 0;
 
+	/* widget already set up */
+	if (++swidget->use_count > 1)
+		return 0;
+
 	ret = sof_pipeline_core_enable(sdev, swidget);
 	if (ret < 0) {
 		dev_err(sdev->dev, "error: failed to enable target core: %d for widget %s\n",
 			ret, swidget->widget->name);
-		return ret;
+		goto use_count_dec;
 	}
 
 	switch (swidget->id) {
@@ -134,7 +184,7 @@ static int sof_widget_setup(struct snd_sof_dev *sdev, struct snd_sof_widget *swi
 	}
 	if (ret < 0) {
 		dev_err(sdev->dev, "error: failed to load widget %s\n", swidget->widget->name);
-		return ret;
+		goto use_count_dec;
 	}
 
 	/* restore kcontrols for widget */
@@ -147,8 +197,13 @@ static int sof_widget_setup(struct snd_sof_dev *sdev, struct snd_sof_widget *swi
 
 	dev_dbg(sdev->dev, "widget %s setup complete\n", swidget->widget->name);
 
+	return 0;
+
+use_count_dec:
+	swidget->use_count--;
 	return ret;
 }
+EXPORT_SYMBOL(sof_widget_setup);
 
 /*
  * helper to determine if there are only D0i3 compatible
@@ -258,6 +313,9 @@ int sof_set_up_pipelines(struct device *dev)
 
 	/* restore pipeline components */
 	list_for_each_entry_reverse(swidget, &sdev->widget_list, list) {
+		/* reset widget use_count after resuming */
+		swidget->use_count = 0;
+
 		ret = sof_widget_setup(sdev, swidget);
 		if (ret < 0)
 			return ret;
@@ -325,16 +383,23 @@ int sof_set_up_pipelines(struct device *dev)
 	return 0;
 }
 
-/* This function doesn't free widgets. It only resets the set up status for all routes */
+/*
+ * This function doesn't free widgets. It only resets the set up status for all routes and
+ * use_count for all widgets.
+ */
 void sof_tear_down_pipelines(struct device *dev)
 {
 	struct snd_sof_dev *sdev = dev_get_drvdata(dev);
+	struct snd_sof_widget *swidget;
 	struct snd_sof_route *sroute;
 
 	/*
-	 * No need to protect sroute->setup as this function is called only during the suspend
-	 * callback and all streams should be suspended by then
+	 * No need to protect swidget->use_count and sroute->setup as this function is called only
+	 * during the suspend callback and all streams should be suspended by then
 	 */
+	list_for_each_entry(swidget, &sdev->widget_list, list)
+		swidget->use_count = 0;
+
 	list_for_each_entry(sroute, &sdev->route_list, list)
 		sroute->setup = false;
 }
diff --git a/sound/soc/sof/sof-audio.h b/sound/soc/sof/sof-audio.h
index f1f630028c21..6ac623137026 100644
--- a/sound/soc/sof/sof-audio.h
+++ b/sound/soc/sof/sof-audio.h
@@ -89,6 +89,7 @@ struct snd_sof_widget {
 	int comp_id;
 	int pipeline_id;
 	int complete;
+	int use_count; /* use_count will be protected by the PCM mutex held by the core */
 	int core;
 	int id;
 
@@ -252,4 +253,7 @@ bool snd_sof_dsp_only_d0i3_compatible_stream_active(struct snd_sof_dev *sdev);
 int sof_machine_register(struct snd_sof_dev *sdev, void *pdata);
 void sof_machine_unregister(struct snd_sof_dev *sdev, void *pdata);
 
+int sof_widget_setup(struct snd_sof_dev *sdev, struct snd_sof_widget *swidget);
+int sof_widget_free(struct snd_sof_dev *sdev, struct snd_sof_widget *swidget);
+
 #endif
-- 
2.27.0

