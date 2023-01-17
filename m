Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CAFD566DD8D
	for <lists+alsa-devel@lfdr.de>; Tue, 17 Jan 2023 13:28:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 41A4B675E;
	Tue, 17 Jan 2023 13:27:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 41A4B675E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673958483;
	bh=AAbnl1gaYGy2y7P/BLlmQYUv185c26p9WsNTxQEGc+o=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=AJsuHLtgAMnS+vCLczldMB52T+ifSBLs44U24xw5zuiACJMQ6rPA0THO5fdS0Hddd
	 PxAK6HZoKkdi/pn7r6JvSIsk/B4ZPkSwlYDBFzMq89s97ltKUS7lWCzd9uXc2LZcl2
	 XL2H68TRdFhVDjGAk3VVZsSuQwVBdeLLYzPzkyOU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BE02DF8055A;
	Tue, 17 Jan 2023 13:26:08 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 61BD2F804F2; Tue, 17 Jan 2023 13:26:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS
 shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2080.outbound.protection.outlook.com [40.107.21.80])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8D564F8023A
 for <alsa-devel@alsa-project.org>; Tue, 17 Jan 2023 13:26:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8D564F8023A
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-NXP1-onmicrosoft-com header.b=YuEkmi4u
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jkPTWzt1RiO8q9TwEUfIfZtIbaxcdN3TLIrdnQG1A3BwU1/yssI54DENHZFA4StAYO9x6/Aiow9qfo0ex53JEqQ5YMt/xR9xX82NExlipoaH8wHIpTM9taIaigwr2qrLi8ToLunDFlaefIwE5BsQZqVQDqHhYAGCobBJKE1INWzgqyZFBPAyEsEhOJM86sY4Zq5KRmUscFmz/AgVCSriXi4PWxzHWpwz9b/2kH5ZsvBm6HwctBBwrPt5T49k0/AWhPK2q2vvATU+Sa1UxuqncIDsKm64N1PQ04tsany2sE0l5gcJgvrm9INfmxzxWY08rem23N65/2V1FtTqvRdJeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KbHPp/rS6lumPMircyV/HG3lpj1fQNhESmcV4QqpE0A=;
 b=fxLwK91HJmQhvfRIyygN+w8+LlnxZrqOGDTHUV7vgTNNUbtUAUQsU7f8Ssa7/N+sZD3f4PDk5hOPhJ6P7uRwFIIB8VC1+QU8fBgM9Br13zb5FLvpabalwexF8RIDAZIbgcle+zjhtR1FPw7XzNntyjVqOPVTAVBUt6Nr+M349WQgwCkIk4n8jgDkv74/qrs+WFrzUW/YMcXkm54bstQNbLrXx5i5yPi1GDCtFH1Gi3ir9ioJhu0ZLl6hjumflTPgBM/tY5Yzrtep9bYLDu34r5cgKjJ7PCvBNT50uo8qrKMHj16pRN6tYNwk2H0G8f3jjlcIEoz12KCB50TtBhqAJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KbHPp/rS6lumPMircyV/HG3lpj1fQNhESmcV4QqpE0A=;
 b=YuEkmi4u4PiSaCAv4uK7myNpi8oDyG1V4o5CIuymn0VfsasqY8SUm/qnGSXO6CyU01/MAx+LEnrC/fp4rsUvN3bZWip0TvDjCp6/zplmNQI/tpQ4g+TK1VKa7m8LArO816vAQQ4N06wP2k+DKFZYlbTt4YMJTzi+pL3VVyzAFhU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from VI1PR04MB5151.eurprd04.prod.outlook.com (2603:10a6:803:61::28)
 by PAXPR04MB9595.eurprd04.prod.outlook.com (2603:10a6:102:23d::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.23; Tue, 17 Jan
 2023 12:25:59 +0000
Received: from VI1PR04MB5151.eurprd04.prod.outlook.com
 ([fe80::b6f0:fe1d:5509:c226]) by VI1PR04MB5151.eurprd04.prod.outlook.com
 ([fe80::b6f0:fe1d:5509:c226%4]) with mapi id 15.20.6002.013; Tue, 17 Jan 2023
 12:25:59 +0000
From: Daniel Baluta <daniel.baluta@oss.nxp.com>
To: broonie@kernel.org
Subject: [PATCH 3/4 v2] ASoC: SOF: Add support for compress API for stream
 data/offset
Date: Tue, 17 Jan 2023 14:25:32 +0200
Message-Id: <20230117122533.201708-4-daniel.baluta@oss.nxp.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230117122533.201708-1-daniel.baluta@oss.nxp.com>
References: <20230117122533.201708-1-daniel.baluta@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM0PR02CA0133.eurprd02.prod.outlook.com
 (2603:10a6:20b:28c::30) To VI1PR04MB5151.eurprd04.prod.outlook.com
 (2603:10a6:803:61::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB5151:EE_|PAXPR04MB9595:EE_
X-MS-Office365-Filtering-Correlation-Id: 5450cc9f-06e5-4c66-cbf3-08daf885fd3c
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HGaPfgDrKdJA9swBHB2WAPO7pB6MNzW11GxRTTtM3TWDjbVxpW/N+O09PdrrSXD+JECnKKYrCKT7K+nq2+oOfVO5rCIYzmxQeTw4TINc1puktrxsV81IdMZ1tAeWsAEgDqQkXnLCtsTrmwjh/G12N7llik6gV7AJ+/Aw5BdU/vkG1lUFnRzUysK3NU57pugFl4F01h7jp6iJwOXwSFICZzLPiI1ceei2Srk27RPIHyQYJzdIk8GjfOkEJNDvdUYc4Nk9Gzl4Us+AwnzN9Vrv3fELZcwV7OQFpuagKZs3DVMP8SjDdHkPJTzN/KQguO+1xm4PI4VqgoWkG+2+0QjuxUfTF1tqxbqzDQYRUfUXn/D4/jZyKdbh0K31XHubpEA9EjjXZnHZEozPgJfXyVZnW9NoL859oBSMGqz3vEFTrf+bhtRxadiPJ+IxJoTZRZcRF/M5hpt1BaU4WCpR7/cUmGH47xHrr61ppz5AFhtdB7TWv0qmXqDG3XIqIgelVmLXfIN3Z83Qe1In964mXQX5g4uHHpBmQbKvzX5LvxAj2JL5dH9jMmCCb+f8sGoVI9hlKiRaF+ddSruBTt4ZGk1gsGOTqU3mHwqfrmhugEFcMa+C77Tn13Yayw9uxEmzhwIE2Q6x3iOD5kZzTJrSTmOkD328WAYBXnPNZ62nTYMzGEf/CzEiv//pHJKI6iX6DeVM0sootClcSAH+5vrMEx4zgA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB5151.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(39860400002)(396003)(366004)(136003)(346002)(451199015)(66899015)(66476007)(66946007)(66556008)(41300700001)(2616005)(8676002)(6512007)(26005)(6916009)(186003)(4326008)(86362001)(5660300002)(83380400001)(38350700002)(8936002)(6666004)(478600001)(38100700002)(52116002)(316002)(1076003)(6506007)(2906002)(7416002)(6486002)(44832011);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?JyG5+TtMlDw0lFEz3bRRL3n/LGEdOIeR2yk15v/o7ATQhAz7GTGkXEHdvjcZ?=
 =?us-ascii?Q?ZKrciDzIxqRMFdS4O/tq9ExHY6BJgu1DaFBYHUH6ikswZgaOxW5lkB1lJ50Q?=
 =?us-ascii?Q?41fuFtMbl7PUdJaa3nRhIQCfVsDHpl7UNY0vI6U03zk8suAVjynSHdLergoF?=
 =?us-ascii?Q?psU6dfs7v/auIoQwWpioyWP28fi3SaXfyvPeaVHK6yvDWISEUQK1V4/wPRVL?=
 =?us-ascii?Q?zXnvN6MdcjitKgCEvqEC1qO53v2++WjK5vAo1XI80HNSJN3qWswPLlKFhPiq?=
 =?us-ascii?Q?O1ZUDF1J1d2v7RLaKHkSkZS1pagISKRmRXIAjp2mvRL09ubFqRKWEftbZbdt?=
 =?us-ascii?Q?NXoJRvsQEjW+cK0NCKsB8dfZewjN/tGsFHBF1OEqjXyLqkrufmu8Kddlq4UJ?=
 =?us-ascii?Q?dZyU6hpjz7D1CIurI2rtGdmPAIqlTGgcJBfxd+k52vH70YDg0KaNU/dWHrY1?=
 =?us-ascii?Q?VyZTHgqgwlWHwmewOUXEd1y0R1uiLbAVPm6HW0Ld+9HbYHvQNCjMKvjR0onF?=
 =?us-ascii?Q?ajM+EEUzww4OZdTFss59EgnOnPkVYF/gAy9Y+PJp4diFsWlNJNBPmiLzUTLp?=
 =?us-ascii?Q?4cfYoDt+kn0F/b0bi2NDg1t6FTEAOjnHQ7LAc3gNDI1g5JUQSdYaxVSA9e58?=
 =?us-ascii?Q?84A7j+7vNfBYefMsyNS86FSsdlgu0YC202lZSRBgr7k+4v2DObrdyTPGkUh3?=
 =?us-ascii?Q?P9fgYbn1K+jCnGCQZNVFQbJ/JNbX5EEBIurMuVO2QZWZol+j03K7nNooTYm2?=
 =?us-ascii?Q?2D8El2J3nul0+/mezKGF2D6t1xyfLefEGrFA5ZYIQubQp5Wo6Ievbh6NR2S8?=
 =?us-ascii?Q?JJI9lyBda0ji6RGm5IetxlpWwgrMjix+tdDDs26dc9AOeKhqto3Xjtb+pLZY?=
 =?us-ascii?Q?IS/h+ea/2h0E/sfwJxbJLDG53sdEzRvuAA++O/UnjohilJAkgPmdzeVhk6Lt?=
 =?us-ascii?Q?BWYgs0rEYhSEqmr7v7Tqg9HC9vYY9IDQK6b6VG1S2p6Ms3oJnHDiBjxEpoXG?=
 =?us-ascii?Q?qZ15RFJ36Ly7/MImgQxUa7W2ouDAI4RCMvZu/Cb4fadwE2DDDHtYvp/bOFYe?=
 =?us-ascii?Q?7c1dXROyeM3M83VdTUinCDgulrjcoqoIHjr7Gmor5vQ0jb0fFijXpbkpIeMX?=
 =?us-ascii?Q?GYx3zSGILzurqDdozwYM4PRmkN90E76I9K2TVoJDPC1YTa3toDMlOhjQZX19?=
 =?us-ascii?Q?iib9McAanL5Iis4asjTrqSlXLWFXAgMP2Ch/h70pyOF+KyixbpMvGE8TDr/R?=
 =?us-ascii?Q?fsSCsRKXPrAPxzF/dpBtIOPa8L102FdHg7kw4eAzzoMyG3BaonDRrHeFvdzd?=
 =?us-ascii?Q?wrhZ9ngYVTUNuUz5wYFf+4xaAFlqqKu3yFAKvlgOknZe4DmrJADXKhytxeaw?=
 =?us-ascii?Q?KhasQ4B1rZG/gXbr+Jvym3OWUDKDe0p/dI3S4mUxCz+NGaYqmgmuUvf0x0Nw?=
 =?us-ascii?Q?jpngP19na68x+e7x8eRN9Tt5dwesgNB2Ipy8l5dE2KfA6qsCpXUd7dgcsH+5?=
 =?us-ascii?Q?hCvUW6iSyJIaIFphQbeTJKmxmm+lVpYf2obwTp0nZHs8Q33rLUTlHqXPEEZm?=
 =?us-ascii?Q?6fIu7/ie5f+H54uJXjL+fHCy06w3RY3mSYY3Dx3c?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5450cc9f-06e5-4c66-cbf3-08daf885fd3c
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5151.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2023 12:25:59.1492 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3fqpaj1QtNP+wdTbcw24FjzHRnXcmI+Ki8/AN00cYxYuEChSngyJ/5fACWr5/1v3cSNnSbazX+Sb2K6oHxpyPw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9595
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: kai.vehmanen@linux.intel.com, alsa-devel@alsa-project.org,
 Allen-KH.Cheng@mediatek.com, AjitKumar.Pandey@amd.com, lgirdwood@gmail.come,
 pierre-louis.bossart@linux.intel.com, ranjani.sridharan@linux.intel.com,
 linux-imx@nxp.com, yc.hung@mediatek.com, Vsujithkumar.Reddy@amd.com,
 peter.ujfalusi@linux.intel.com, angelogioacchino.delregno@collabora.com
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Daniel Baluta <daniel.baluta@nxp.com>

snd_sof_pcm_stream keeps information about both PCM (snd_pcm_substream)
and Compress (snd_compr_stream) streams.

When PCM substream pointer is NULL this means we are dealing with a
compress stream.

Reviewed-by: Paul Olaru <paul.olaru@nxp.com>
Reviewed-by: Iuliana Prodan <iuliana.prodan@nxp.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
---
 sound/soc/sof/sof-priv.h   |  1 +
 sound/soc/sof/stream-ipc.c | 48 ++++++++++++++++++++++++++++----------
 2 files changed, 37 insertions(+), 12 deletions(-)

diff --git a/sound/soc/sof/sof-priv.h b/sound/soc/sof/sof-priv.h
index 95a6b301da49..86fc5c6a9c39 100644
--- a/sound/soc/sof/sof-priv.h
+++ b/sound/soc/sof/sof-priv.h
@@ -115,6 +115,7 @@ struct sof_compr_stream {
 	u32 sampling_rate;
 	u16 channels;
 	u16 sample_container_bytes;
+	size_t posn_offset;
 };
 
 struct snd_sof_dev;
diff --git a/sound/soc/sof/stream-ipc.c b/sound/soc/sof/stream-ipc.c
index 872a49550672..216b454f6b94 100644
--- a/sound/soc/sof/stream-ipc.c
+++ b/sound/soc/sof/stream-ipc.c
@@ -33,14 +33,27 @@ int sof_ipc_msg_data(struct snd_sof_dev *sdev,
 	if (!sps || !sdev->stream_box.size) {
 		snd_sof_dsp_mailbox_read(sdev, sdev->dsp_box.offset, p, sz);
 	} else {
-		struct snd_pcm_substream *substream = sps->substream;
-		struct sof_stream *stream = substream->runtime->private_data;
+		size_t posn_offset;
 
-		/* The stream might already be closed */
-		if (!stream)
-			return -ESTRPIPE;
+		if (sps->substream) {
+			struct sof_stream *stream = sps->substream->runtime->private_data;
 
-		snd_sof_dsp_mailbox_read(sdev, stream->posn_offset, p, sz);
+			/* The stream might already be closed */
+			if (!stream)
+				return -ESTRPIPE;
+
+			posn_offset = stream->posn_offset;
+		} else {
+
+			struct sof_compr_stream *sstream = sps->cstream->runtime->private_data;
+
+			if (!sstream)
+				return -ESTRPIPE;
+
+			posn_offset = sstream->posn_offset;
+		}
+
+		snd_sof_dsp_mailbox_read(sdev, posn_offset, p, sz);
 	}
 
 	return 0;
@@ -51,18 +64,29 @@ int sof_set_stream_data_offset(struct snd_sof_dev *sdev,
 			       struct snd_sof_pcm_stream *sps,
 			       size_t posn_offset)
 {
-	struct snd_pcm_substream *substream = sps->substream;
-	struct sof_stream *stream = substream->runtime->private_data;
-
 	/* check if offset is overflow or it is not aligned */
 	if (posn_offset > sdev->stream_box.size ||
 	    posn_offset % sizeof(struct sof_ipc_stream_posn) != 0)
 		return -EINVAL;
 
-	stream->posn_offset = sdev->stream_box.offset + posn_offset;
+	posn_offset += sdev->stream_box.offset;
+
+	if (sps->substream) {
+		struct sof_stream *stream = sps->substream->runtime->private_data;
+
+		stream->posn_offset = posn_offset;
+		dev_dbg(sdev->dev, "pcm: stream dir %d, posn mailbox offset is %zu",
+			sps->substream->stream, posn_offset);
+	} else if (sps->cstream) {
+		struct sof_compr_stream *sstream = sps->cstream->runtime->private_data;
 
-	dev_dbg(sdev->dev, "pcm: stream dir %d, posn mailbox offset is %zu",
-		substream->stream, stream->posn_offset);
+		sstream->posn_offset = posn_offset;
+		dev_dbg(sdev->dev, "compr: stream dir %d, posn mailbox offset is %zu",
+			sps->cstream->direction, posn_offset);
+	} else {
+		dev_err(sdev->dev, "No stream opened");
+		return -EINVAL;
+	}
 
 	return 0;
 }
-- 
2.25.1

