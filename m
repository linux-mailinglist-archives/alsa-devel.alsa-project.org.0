Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5476F4535AC
	for <lists+alsa-devel@lfdr.de>; Tue, 16 Nov 2021 16:23:55 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 604CE16BB;
	Tue, 16 Nov 2021 16:23:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 604CE16BB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637076234;
	bh=Vs+N7sq0do7XwpQFHAdVtHzWPm5XXnHcF4wX/An59Rw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AD9pfNT/+add2x6Nrgs2w7kfOvc6975kSCLYZsYyfvQRigU/XZLjfylfzTZUk5OAY
	 a/loJGNjGTXdWccp+PQydaK7NqZsVbwIFb9DSrqjd6daO1BG1OzQl6Ch3A9YK2OgUs
	 S2qbv98CS8QR/pCnGfMbQVkLRqv6avla33Io81bc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 136D4F804E7;
	Tue, 16 Nov 2021 16:22:15 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 23999F804BC; Tue, 16 Nov 2021 16:22:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 MSGID_FROM_MTA_HEADER, SPF_HELO_NONE, SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur02on0613.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe07::613])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1752DF80134
 for <alsa-devel@alsa-project.org>; Tue, 16 Nov 2021 16:22:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1752DF80134
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=NXP1.onmicrosoft.com
 header.i=@NXP1.onmicrosoft.com header.b="Hf1qQgBq"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PpxqxfR8QESpGOdnNkO6aOv86apio0ul58q4rEPh0MxDWPfrCUfGDHIcHuvKKyGhgd+SigsL35BNQZ0MqW3R7ayNNJj9o77HMaVVqJGo5P1RR2qSFtrDR5VZZqnbzEwqvDB2PDqB8MIE2A5zFiI0qg/JzY03BWPdIFWM7C/6ExCr5bjujLoRF3pea//N01UayIuTpaskfR8W7wLM7rtiDuun7xmt45LpDgxNJ2Pb/sp2hG1WzQsKhI9HiqNWH2ecenLR8ULZPfyhmo11wYpGr6v6+2MTuZU0H7hhIVvxFoewK9B8a0N/edEA8pOtLHxVIOkd/pjqk7NZYyaAuTNrKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3konaJtcz55x7aht3QkCtIItCsufv6S9UWsCUk5a8T4=;
 b=ABKR/+3JzvkUGL9ChDTM/sLD7MIjr0RF78pUOIQAS41NX5OEaXc2oNlgAhTs0qhJCR3IeRgwWg1IUiSj26J8e6z/YDLGyusmdoCrxHW6UGhHMBgQI5/0dOxdYfJRnxWLFUSee12GN6mQNTntoXZ8V43brx3QeFkSvAVH2C++V0VSWdhKbvnKqeHXygiCjyBupmpBIeQ6QIMn5WA+nCLaZyiovrp+ZgOXVDiJYoP0KzM1yEPcoWCi5LdMOhjpaTw0NWXHlRYxQhLxsc3kQIRsx7TH5wqoFHTYfp6h1avdqS5sr9aVLDWJzmB3i2Cn11QgB6RlnLDhPcoZmwzdvCpQIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3konaJtcz55x7aht3QkCtIItCsufv6S9UWsCUk5a8T4=;
 b=Hf1qQgBqxvhbmiuDRu92vf5UvNbKtJqJ6+t5KJRn1ByV6S4PRdEKglTKkZ6IFE4quiz5Kfd3qj6/cIcK5CJeYnWMT6sq5b3CVKJMeOB8s9vv20duy1SPxoqYvC4EdyFCIloIH8Shmy2oB29nCpZ9hHGxFsMJoUIr/2Er2Yo4WsM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from VI1PR04MB5151.eurprd04.prod.outlook.com (2603:10a6:803:61::28)
 by VI1PR04MB6880.eurprd04.prod.outlook.com (2603:10a6:803:130::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.26; Tue, 16 Nov
 2021 15:22:00 +0000
Received: from VI1PR04MB5151.eurprd04.prod.outlook.com
 ([fe80::85af:f8be:aa99:ba5f]) by VI1PR04MB5151.eurprd04.prod.outlook.com
 ([fe80::85af:f8be:aa99:ba5f%3]) with mapi id 15.20.4690.027; Tue, 16 Nov 2021
 15:22:00 +0000
From: Daniel Baluta <daniel.baluta@oss.nxp.com>
To: broonie@kernel.org,
	peter.ujfalusi@linux.intel.com
Subject: [PATCH 1/4] ASoC: SOF: utils: Add generic function to get the reply
 for a tx message
Date: Tue, 16 Nov 2021 17:21:34 +0200
Message-Id: <20211116152137.52129-2-daniel.baluta@oss.nxp.com>
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
 Transport; Tue, 16 Nov 2021 15:21:59 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 622d9ce3-ca6c-464e-9adf-08d9a914d612
X-MS-TrafficTypeDiagnostic: VI1PR04MB6880:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB688035BE362725BA4628FF13B8999@VI1PR04MB6880.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Kfp6f+hF94wquAsB75fAKk6s/XC6eMLLycufOldsAbpDxHdFQ3oLnBayLyPQ6E45gMOgjl0dRbAQHcz5c27jPtGz1N8SRfRdsZJRrNAn3ppkRvdlAtOKZpN++c+JJvDBhDWo4ES8ITpJyyEgWbgNqjcMCmBsnbj1iEAljRqoq7/DRWUOhvVfpxI19++rDKJo4o2jaWCMFqM3CxFCVe/IYFIDb1vtyd4pDrpw1PYuVo/J6sYesd01r1YCtYfnnGHrcKVi96pP5a9UvLELXCGellRZRRcDUEHDFNLSekNeMsp7kKS+WuHlaHdZod6Ii9xWRebO49q14oi4/n1hwl0XCkk+Epfy6WrL0HK2fpLRX+p/Vylrg4r4PgMXqdv+xdQw9Tm/Ni1vFo5SDZ4kvHMnIsbCW9zrxotfp8qj3ef1VXEUL9RR+4H7G1WAsixH7crFbOGyLRQv213beV5zE+s3Qf7Bw22BwnekmsAQw2qusbA6FtzUgy7fpwlMM2gTpvsXVCk+9d0roFS6ZvX7OwevNqAcFVWg/VUygdAmKEDeiyyGbOm4+f017noZ9XjXFGJysZ60aekLzu7i2A7j6T9zQBS9MhEO/N/yIrIA39GuQtIWZO0/poFVI0mTmhxo8W2t2WSwTNHl0bY4ACiKYfIZerVRWXlevD8TFg8+N2KeFg5t+lMGR+nHHr5VW8Z3cHRJT9KNVzfzeoUF90XFIkptHXAwKl9fdhTAqwsRdsSBLj8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB5151.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(4326008)(8676002)(6666004)(38100700002)(5660300002)(8936002)(2616005)(52116002)(2906002)(86362001)(15650500001)(6512007)(316002)(66556008)(186003)(1076003)(508600001)(66476007)(54906003)(66946007)(6486002)(7416002)(44832011)(83380400001)(6506007)(41533002)(15583001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?wr1Xp2ieUOguyqAnm/9NcIE1gh4xoCmg00qtckpmC0xLpS21pHXXtofpIj6M?=
 =?us-ascii?Q?Q17l8dmnKy4lnB4P4WLegfxQcLOPTjS++evUbG+fgokpVdHvI/JlmNcPx6Oa?=
 =?us-ascii?Q?7IsIw8aKyzmHdb1NKPlQEvUE/aXKuem58aVJmpZwEDz4jVp3sMkhVyGCrpos?=
 =?us-ascii?Q?ewiHzYMQqSeP3hT/3gP3Y08p9zHmfPL2HlPAfyviUS7uFT+jPxK9LUD3dXX0?=
 =?us-ascii?Q?nvN4VeJYXhvVud7T91xExvZtyM54Z7U1BKQKiPCnXCetdiHqVqQhmaWdi8tu?=
 =?us-ascii?Q?3eWfBm//jTnLSuGhccquyIW2mCeXZ+XvqMfIOHuOyGSBIkbyF+IR0TshKMmB?=
 =?us-ascii?Q?K7y9nbFESYVxHAedCEl89zqyhx/SP5JrKJsC1cBu3z6xrOnkMsgpLzen1Qac?=
 =?us-ascii?Q?ShumjMRvoB4w8zgo2IxVlBw65lhCStvRxRit23MzOkRSRS8Gb3jlHqON327f?=
 =?us-ascii?Q?xAffcoqdJsbowG6I6FOo3ppgct+lnVKqqBdtCipRg7yRrDB98Eh3JkF/01XF?=
 =?us-ascii?Q?IQDGsQKGhLx6R0w/jD4DRcwp4Je2W1OkMKtSoElEuxOH+HQvL8hTuohnqpn8?=
 =?us-ascii?Q?chwFoYfSvp6McQZsJ2F+gN6rdwdu3qt/VsoSm3ykyxGSZ2IXPvqZi8vmGkJG?=
 =?us-ascii?Q?nIrskEJppVTKdkV0Oibn2N85zGk8bI/DaZ9oQ6Bnvf+TVQrpbAwI++fyER2W?=
 =?us-ascii?Q?a1UFyveFrJn/Dgmvj6cGTnJVqwtmNLK1TO+FY6WBDQKY7hP+rvIp5bpCYAAh?=
 =?us-ascii?Q?TApK0+g95HYbuc4NCTvD7KzAreOXiyG4s1e05Xx/Sx33ucthYTQot+G8NYXN?=
 =?us-ascii?Q?msdsuB3RLgEnIsjKNwhVeXWaPl7YYyPuA2z/AhcvWQ2qkzVFnHxpXKRPbmao?=
 =?us-ascii?Q?GJqaMOxReUxsVsD1Pju8CkaRoGRbAyF0upcPG/sEaTS5SlT8nSEI36Dun9KS?=
 =?us-ascii?Q?hKyhhaG1OTQSoVU8KhcXfOdPNCCHlaT5xYnY3qxlM8HgK59yqXdGjyguJKbO?=
 =?us-ascii?Q?7PP8KrFYXi0g6kraT5SJ/ccsMSTRomnuxHiXH+vGa7aBXMA/8G7keeOysJQJ?=
 =?us-ascii?Q?vX5e3oM5ZCe8ibvgybApAfA/hV4w8EigrLrN7dk5Pqb+hZtkSSmahFMiDjvU?=
 =?us-ascii?Q?aiPNma0noklgaFyCy5dTZBItySbSE00PHm4zeSPFLLsgAndw8dBFYGN+p96f?=
 =?us-ascii?Q?0RgkLj1W0P3LChMG/s+Z+Elt8FF8P5io5YNrmU0mY++ieBvBAAcCZa/VxP3h?=
 =?us-ascii?Q?tESqV93DrcKYHdgd7xoZgYeLXSIYDkrqlnHj+G27GxEVrcf8Crx9JPOrsIPH?=
 =?us-ascii?Q?Dhls3NEsQlKTOX0R7cx0KSmyQPJ8nULxhroeBgpGoEvNIzzjN4ZiNK48GTqb?=
 =?us-ascii?Q?7NQOnpKlRE2bIYjpD5O+Db89kV7w+Pp9gkiahutjOHCSkUEGQAX8T0nAqvmb?=
 =?us-ascii?Q?c0sWC2DV8JY0y7FLMf8zMEPUy47tCsyRfQ215tzmWh14JTWox+GJXIiCniAE?=
 =?us-ascii?Q?j0qB4E+lUCzDAwoZTHlS4NqP7EoqcBxQWs3wfVY7ayup1iWQ8q4gScW3w2CE?=
 =?us-ascii?Q?nB73XHV+NOy7KtVfhENJqaokgjDl6iEdmks0Y/QWuLx/C5KSC7tAvYXJmZQ/?=
 =?us-ascii?Q?ZT/pm53Fvw86YCBm01RJNt9gcZ0+LtP1obh7giOhIfXH1+QdrstxXnQCMv+J?=
 =?us-ascii?Q?6ua2z34F9PiD6Gbz5RFQjVqvyGI=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 622d9ce3-ca6c-464e-9adf-08d9a914d612
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5151.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2021 15:22:00.7488 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KKeTjgi7x8oEOq7SHX6vz33lwGonsDD0vWLqfXbLzOpW05r3i3dm/WdT2kKjtfTzp7FgUCyhBjf0FHrj6A0jAg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6880
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

The code to get the reply for a tx is identical in all but one place:
imx8_get_reply(), imx8m_get_reply(), atom_get_reply(), bdw_get_reply().

hda_dsp_ipc_get_reply() have additional check in place for PROBES and
special handling of PM messages.

Add a generic implementation to the core which can be used as drop in
replacement.

The reply size check is changed to be able to handle cases when the reply
size is not know beforehand (this is the case for PROBES and
DEBUG_MEM_USAGE for example).

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
---
 sound/soc/sof/ipc.c      | 61 ++++++++++++++++++++++++++++++++++++++++
 sound/soc/sof/sof-priv.h |  6 ++++
 2 files changed, 67 insertions(+)

diff --git a/sound/soc/sof/ipc.c b/sound/soc/sof/ipc.c
index a4036d0b3d3a..6771b444065d 100644
--- a/sound/soc/sof/ipc.c
+++ b/sound/soc/sof/ipc.c
@@ -394,6 +394,67 @@ int sof_ipc_tx_message_no_pm(struct snd_sof_ipc *ipc, u32 header,
 }
 EXPORT_SYMBOL(sof_ipc_tx_message_no_pm);
 
+/* Generic helper function to retrieve the reply */
+void snd_sof_ipc_get_reply(struct snd_sof_dev *sdev)
+{
+	struct snd_sof_ipc_msg *msg = sdev->msg;
+	struct sof_ipc_reply reply;
+	int ret = 0;
+
+	/*
+	 * Sometimes, there is unexpected reply ipc arriving. The reply
+	 * ipc belongs to none of the ipcs sent from driver.
+	 * In this case, the driver must ignore the ipc.
+	 */
+	if (!msg) {
+		dev_warn(sdev->dev, "unexpected ipc interrupt raised!\n");
+		return;
+	}
+
+	/* get the generic reply */
+	snd_sof_dsp_mailbox_read(sdev, sdev->host_box.offset, &reply,
+				 sizeof(reply));
+
+	if (reply.error < 0) {
+		memcpy(msg->reply_data, &reply, sizeof(reply));
+		ret = reply.error;
+	} else if (!reply.hdr.size) {
+		/* Reply should always be >= sizeof(struct sof_ipc_reply) */
+		if (msg->reply_size)
+			dev_err(sdev->dev,
+				"empty reply received, expected %zu bytes\n",
+				msg->reply_size);
+		else
+			dev_err(sdev->dev, "empty reply received\n");
+
+		ret = -EINVAL;
+	} else if (msg->reply_size > 0) {
+		if (reply.hdr.size == msg->reply_size) {
+			ret = 0;
+		} else if (reply.hdr.size < msg->reply_size) {
+			dev_dbg(sdev->dev,
+				"reply size (%u) is less than expected (%zu)\n",
+				reply.hdr.size, msg->reply_size);
+
+			msg->reply_size = reply.hdr.size;
+			ret = 0;
+		} else {
+			dev_err(sdev->dev,
+				"reply size (%u) exceeds the buffer size (%zu)\n",
+				reply.hdr.size, msg->reply_size);
+			ret = -EINVAL;
+		}
+
+		/* get the full message if reply.hdr.size <= msg->reply_size */
+		if (!ret)
+			snd_sof_dsp_mailbox_read(sdev, sdev->host_box.offset,
+						 msg->reply_data, msg->reply_size);
+	}
+
+	msg->reply_error = ret;
+}
+EXPORT_SYMBOL(snd_sof_ipc_get_reply);
+
 /* handle reply message from DSP */
 void snd_sof_ipc_reply(struct snd_sof_dev *sdev, u32 msg_id)
 {
diff --git a/sound/soc/sof/sof-priv.h b/sound/soc/sof/sof-priv.h
index ba341b1bda0c..2c97ffa98e3e 100644
--- a/sound/soc/sof/sof-priv.h
+++ b/sound/soc/sof/sof-priv.h
@@ -515,6 +515,7 @@ void snd_sof_fw_unload(struct snd_sof_dev *sdev);
  */
 struct snd_sof_ipc *snd_sof_ipc_init(struct snd_sof_dev *sdev);
 void snd_sof_ipc_free(struct snd_sof_dev *sdev);
+void snd_sof_ipc_get_reply(struct snd_sof_dev *sdev);
 void snd_sof_ipc_reply(struct snd_sof_dev *sdev, u32 msg_id);
 void snd_sof_ipc_msgs_rx(struct snd_sof_dev *sdev);
 int snd_sof_ipc_stream_pcm_params(struct snd_sof_dev *sdev,
@@ -527,6 +528,11 @@ int sof_ipc_tx_message_no_pm(struct snd_sof_ipc *ipc, u32 header,
 			     void *msg_data, size_t msg_bytes,
 			     void *reply_data, size_t reply_bytes);
 int sof_ipc_init_msg_memory(struct snd_sof_dev *sdev);
+static inline void snd_sof_ipc_process_reply(struct snd_sof_dev *sdev, u32 msg_id)
+{
+	snd_sof_ipc_get_reply(sdev);
+	snd_sof_ipc_reply(sdev, msg_id);
+}
 
 /*
  * Trace/debug
-- 
2.27.0

