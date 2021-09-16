Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3305B40D86B
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Sep 2021 13:21:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C800318C0;
	Thu, 16 Sep 2021 13:20:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C800318C0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1631791291;
	bh=vGAgxNWqrfK4/j0MTVECMPwvHW43ZfhnaYd9QZrOkg4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=q0H+pae/40fhIyH9RW/DbWv6/2yaHVaswjZgc91YmmnitTqV+mYBT0g8hDMmEqgkX
	 7eF7oygZuBdWqgbECZF04ZwdpXHcDyF0XdYwZCHCYTgQsM9jQrWK31Slq8SeWa5f2w
	 OPnkr8HbLIYSx8/8HG4Dcxik5pnLNrhGZQcByEjo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CF975F80526;
	Thu, 16 Sep 2021 13:17:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5B19FF80518; Thu, 16 Sep 2021 13:17:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 MSGID_FROM_MTA_HEADER, SPF_HELO_NONE, SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr50050.outbound.protection.outlook.com [40.107.5.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F05B5F804E3
 for <alsa-devel@alsa-project.org>; Thu, 16 Sep 2021 13:17:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F05B5F804E3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=NXP1.onmicrosoft.com
 header.i=@NXP1.onmicrosoft.com header.b="BGw6/Lu1"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gmornN+6ieDGm5Og1A3qx/lzukNT7tIA6TJdYRHaEk7bSaoNkv6lncxR66r8bpw1LfQ2H9nOozv6Pf6IXRAAqXii71le8/zJLOWzB1ufPMw47ewBeR4j9OZ6K47d5xbtyqkRaQwXLXwyk21Rp2pxmsjsQrbYQW8Le+OV8BZxGbvkDDgHk9tWSwUf3E4vwc9K1Px/oFzXCsSsxNwr2C14z5CQPQFomqMjaaP2c5Uakk5Itc45Ty6trnOlDAWUe8UmdEQJRbMzcnJ8g3QKPjByO4FiPFMPaZyZZE9EjUasJ1AuSFSimmnxNJHLyxQImxGxkO40yefuQ5dUP+qHqMzU8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=zKidOw5pr7Z2gD9CecNVZHqnBlv8Y0SLirBrQmqtvag=;
 b=NYvpNNQgEBfshotsolBXVDEI+ADsg7X5Ze0zQWNKvnza2XhgywE3FdSKaai3iHeYgVtogLiuOAJ389wek1s/X9dmCCrnWLJOo+ey7qwtUh37gW8It8fGnVwX73eleAFaW2eArxcdrX7fzQQEgOvbfHqksABE1RGoNkIzYc2sNwGhTzhrBIGsMdWGVIeJmKxFsTguUclzPN2bYAeIFYzHZ2JL1NtrEyZ34EKn4EwNjy0C/zBeA1f81IoqL6fcg7jcVdCzBJ06JL/jyIaFCkfcvofuhcYoAkQeaLIgLImk0WkxspJUvECZiizgjAYbtSaXBaRKwnre2P5vPj5OmzIg8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zKidOw5pr7Z2gD9CecNVZHqnBlv8Y0SLirBrQmqtvag=;
 b=BGw6/Lu1lYtZnxwkfYrHm7/eYrFfunDvJFqPC7Dp8wdSPHUlqQ5rqbeHrGLv59qAoTO5yzvc95euzd8d6VUxbDV2KkMqf2Nqns18mTTcafeJvztoMLdPPm0I7lkfN4p2yNCigCu61rDdjIlCcgICC9p/RhNqOxv7m7sYQ9xPGk8=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=oss.nxp.com;
Received: from VI1PR04MB5151.eurprd04.prod.outlook.com (2603:10a6:803:61::28)
 by VI1PR04MB4926.eurprd04.prod.outlook.com (2603:10a6:803:51::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.18; Thu, 16 Sep
 2021 11:17:17 +0000
Received: from VI1PR04MB5151.eurprd04.prod.outlook.com
 ([fe80::499b:ba92:db2e:3f28]) by VI1PR04MB5151.eurprd04.prod.outlook.com
 ([fe80::499b:ba92:db2e:3f28%7]) with mapi id 15.20.4500.020; Thu, 16 Sep 2021
 11:17:17 +0000
From: Daniel Baluta <daniel.baluta@oss.nxp.com>
To: broonie@kernel.org
Subject: [PATCH 09/12] ASoC: SOF: Introduce widget use_count
Date: Thu, 16 Sep 2021 14:16:43 +0300
Message-Id: <20210916111646.367133-10-daniel.baluta@oss.nxp.com>
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
 Transport; Thu, 16 Sep 2021 11:17:15 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 08bf1355-7789-4a9f-5f36-08d979038a9c
X-MS-TrafficTypeDiagnostic: VI1PR04MB4926:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB49267E65F0A5761D054876D9B8DC9@VI1PR04MB4926.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3173;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ku+e7NSe+CwFyS17lLvcLgE+z6opwUi4EZH91vEboislFFIwhbGE2refDi7Vvj99AtKl6qJQwOROT3ZfG2gGyLpmHtQEqtDZHlwnFk5QkFmstaZEVZXnH2mLPEAK/WxfTsLnF4ADOcjDtNbrHbDPFgTnOEqXcfVT1jV8t7S7IZ0G9zIVPi2QPvumhwI3JJ5rBc68kVkniS7Iq5jJR48in6OeGj7POnZ86b/XvcU7Q4G4KtOyp4ZkJVh0Kj8iDSGamfzFOGr8SZzuLK5dd/SBUJlURJHpbg7SNk40F/MEw5GjvpYCaZ9OmAeFFuPInVm/CAgpjEn3sRln2K/J3YCEf/d9iz/f9Wojw1w9/HA1em4+WRKjEQCRGFgGhTYfJh3ZAT42t1KykDXVldjFczkiYT/Un3ricusuxaHhfV9PCAEIJfOw5jDN7MvxPEbf86KadtCzzInF6qSlV8O2HclMUJk/aM1PaZcDZgP7wTbYoDY5JnJraIYS/mBoJatcZggIvx0ZmOFJJyEkhSm1tQCtLIWkzHkM6o3fB29oPEvX4w3GFDDZ3YphaUZvQAk9I4pQz0N1aiZl5bb+FWW2Wd59HFEKgChgDq/Sys8fbWWRm098fWrxeIXtpU175osV1KJvWNrXKCYaH8B5UtNw+BppJg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB5151.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(366004)(136003)(376002)(346002)(396003)(4326008)(8936002)(6486002)(186003)(83380400001)(6916009)(2616005)(5660300002)(66946007)(52116002)(478600001)(8676002)(6512007)(6506007)(86362001)(2906002)(44832011)(66476007)(66556008)(316002)(1076003)(38100700002)(6666004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?CkH5K2EJ1bWt0tBKxTdS7pe79h8+dNEn5is21Q4z+kaRzEh3xApjGiUb7/n4?=
 =?us-ascii?Q?TgfsKbW9dvtbbwl8acpSJLQ587SHTxk535XXNN5BFDa0VFOSJZD7JY67TJKC?=
 =?us-ascii?Q?j4AWJc3nsXCwAYOHxUZ/k8JfH9dEjTjUl7MuFP66ezTlHF0kQ646rT1syAPQ?=
 =?us-ascii?Q?uU0BLPsbI8O55IAonJ4LLpqDdtNPvfASx7fNer7evkdQwtmQR7SPGIEtL5QO?=
 =?us-ascii?Q?Ndwhlk+TmBWla4l13NNfCsHvaXTHl6xZBVbfvz6plEUgoEPwl2sdhcJESG9i?=
 =?us-ascii?Q?4pej9lwM5UfjFtm3UCcpY2FVRuVSdqhWuVD4+xWfFd4R8LrSb3qkSMv8n02v?=
 =?us-ascii?Q?wqzU9OAtobxLvOID1FzY828FWoprY51dIacXpvTAcpLkpRUkshddwfBCNUal?=
 =?us-ascii?Q?fZuja4W3XnRokJFgMCIdyPIHR7pxwXXXAisX77dmxJDbfUPGDEzWtCIz5CTj?=
 =?us-ascii?Q?tK37D6C/SYL6xv/CwWjAFUanRI3wGMZZMX542mjfMTNteOkVXYXulXjZuR3X?=
 =?us-ascii?Q?mTBVKP6F0MqOcryehD/WnNrAkooZbMT70PYEuRZjRcQbfcLBHi81MpYOgADL?=
 =?us-ascii?Q?5W7DhXJt1VHMDwUkiA8h5l5rPqMkxFoMCPiSbFeKfHR6frdk6bm9txK5W+2P?=
 =?us-ascii?Q?fDy9WWDOQw2oGM8SGJa6hyu07EZSkAzQoYJ2IhdlSWBtp/GsgF1lzQSnb1/U?=
 =?us-ascii?Q?BoVydDc+5BdzZmdjtaFONymT2u1uPiTtFbJHyABiPv1caTI41Gv4/uiQtMRs?=
 =?us-ascii?Q?fpS/DJ1tt3qR8UcqCyghR9UOkYUzIjH2+UoPLwdHOi597Dsi932mMv9d+nBV?=
 =?us-ascii?Q?7ceVMJ/y2MNXDG65Z54H/VZRMFzO0igeS9Xuft2asuoFnVPpVJsqQ8yKflIe?=
 =?us-ascii?Q?Xr7HxtmhC6q4oEgAVhKl/WdtzmF1QTAqjj6fHSQUCg3BlE++U+SSq60Ya3WV?=
 =?us-ascii?Q?R7B1ROqkr1ZHyVQnfHY+RIC2+FPF0sM3bFrDzlw2e//KNjFs1Ih0AxCcHbEo?=
 =?us-ascii?Q?XmRKHNQwxcRKYVwJ8uku1AElfB6bK8nrOJk4BtiTb7Z+/Wavyq1HXX4W7l4i?=
 =?us-ascii?Q?lrj39A+OwPvZPoMDxr6hjaIYf6xLwoxZWcmem3I8DvVjb2VpLRFPkeh8Hcq6?=
 =?us-ascii?Q?K0k6agCHp0wUG19e3ejR+SFa4rC0aFfFoBdfmQBIISQx4deIJfIZXAnk8TGU?=
 =?us-ascii?Q?XZQY1toj8a9QV8v/XlCQrgQlPIC8R7dMBh8eXMVZ46T9NoUxvmlRbDTfCNaz?=
 =?us-ascii?Q?GJw2RuzWOk8f4V45L/fBmgUC8WT1MfXF95Ft+RBuwEMkKgTz2fXMyEFCXQgI?=
 =?us-ascii?Q?tV3zPTvVGvB7Grq3ZoJCZj9CKf4fXqAXYsDjNwMmOkaF9JBjN2BC++Um+/P2?=
 =?us-ascii?Q?KesSJt/pX0BwlepICuk3b0Ib/pPB/lTI6HdhMj1gaoUOt0bzhg=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 08bf1355-7789-4a9f-5f36-08d979038a9c
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5151.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2021 11:17:16.8551 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4M33SwcJYp8OxiUIpLTh/dGXJ9gG5ge9vR3yfmdCZy0+EDfGnyD3h4i0Lrr+3rskJay5Mn614VEsCxDusSnkSA==
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
---
 sound/soc/sof/ipc.c       | 22 +++++++++++
 sound/soc/sof/sof-audio.c | 77 ++++++++++++++++++++++++++++++++++++---
 sound/soc/sof/sof-audio.h |  4 ++
 3 files changed, 97 insertions(+), 6 deletions(-)

diff --git a/sound/soc/sof/ipc.c b/sound/soc/sof/ipc.c
index 18e0bfc1d8a9..33c94c7a5913 100644
--- a/sound/soc/sof/ipc.c
+++ b/sound/soc/sof/ipc.c
@@ -700,9 +700,31 @@ int snd_sof_ipc_set_get_comp_data(struct snd_sof_control *scontrol,
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

