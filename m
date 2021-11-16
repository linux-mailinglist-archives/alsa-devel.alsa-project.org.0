Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FFF14535B8
	for <lists+alsa-devel@lfdr.de>; Tue, 16 Nov 2021 16:24:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7CA1A16BC;
	Tue, 16 Nov 2021 16:23:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7CA1A16BC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637076254;
	bh=ZWUgoaBGfAxBCDa5uGD/+zQx9uQq5wHONW6X/9HvXDg=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bM3wopNbNaJIfT8lu4gnnSE0IH+sh1hFEepynwVGM8YCDTMIeXkSw3jxZtBLaPv5W
	 63Xwcbw8Gj8QnC/3dgOjXSd/qmiBU4AvUVarU1ZlDvbMstn4sngVhc/YTxmSm+x3tP
	 xCCtFj+h7arf6g3lhCvLN5F1VBDm11CDsJnfqEMA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B6417F80423;
	Tue, 16 Nov 2021 16:22:24 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0BD44F804F1; Tue, 16 Nov 2021 16:22:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 MSGID_FROM_MTA_HEADER, SPF_HELO_NONE, SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80073.outbound.protection.outlook.com [40.107.8.73])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 30827F8026D
 for <alsa-devel@alsa-project.org>; Tue, 16 Nov 2021 16:22:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 30827F8026D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=NXP1.onmicrosoft.com
 header.i=@NXP1.onmicrosoft.com header.b="Js3I3KhA"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ATEuHU2BCUJn0MdlfT+DOU1OlQZasWwGXh6UJL6lnq8fV+Hla77THVJZ5sN2Mf/tGbn+uPjuNPVE6i0exx0jGFh6rAN6OfPQRFq3NSlOAHfEWBinIZ9V33Cj4eFV3A+809LDi2hF7geXwk76wVIBPzPmgCxgaVD914DuDboSElUqDH2aVaezDZRnQV8Ah0WcLW3YV7rBuiXQtt+gmmxNRHMRGdYLkYm3lePdNszipA5dxPgKc9kfJaY0wfSwHHLXECkbXCUJnlkXg5Fyl9wi6YzhohfvVcW2zTGT7jufh2cblvbZz+PtX27vcArzVXI5jr4dZIFz2EAimE+GWW3CjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+8EdpM2FkAotA9cnSb7oIgkVptpvsQJimq0z3jigbx0=;
 b=avFcWnDoCwPGXFXL00zQG6vaJtvtvwUU714Y3BSGetQxf4epz87kn8HbkkVmKZMlu/sj5PulkIsLcOk6lWSwHlysLny0O4vqo/024o9MbfNxq5XV7Lr3c91wy2eHyt70IS3uPF6lsxKImJ8zsNusI57lYGhR3VfeMA6GWGs8gG48ABZvJU1N1bBmecCvU4CmxEAXXcGHYMblA7T2SOBY4oyvAVtmGmi8b/Bcdjmd+3vPI1s+aEMs+xLsYryN1cH7oU5uHum6RlFqfKMsOiicg7bcWA3K9Ho7iOAkN0NwpKwXD3t5dFqb8EjdsDO1oeeRUUfm7MB7Yu8FJ/i96pCEXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+8EdpM2FkAotA9cnSb7oIgkVptpvsQJimq0z3jigbx0=;
 b=Js3I3KhAzl0HmYCphiLBwt7uxwxhckUdbEXYhlSW8TCcj7+eqORdQHfoNrrLBXHzsl7Dcno2YhTMadoBbg41hOE4bxsuKnlEQH8/QLy2zqNeGsdurTgzZToGbIrWIvpcdCFIGvwzE7g3JGQcb0sHPriyFAD2jDgkVkokTkwaHhQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from VI1PR04MB5151.eurprd04.prod.outlook.com (2603:10a6:803:61::28)
 by VE1PR04MB7213.eurprd04.prod.outlook.com (2603:10a6:800:1b3::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.26; Tue, 16 Nov
 2021 15:22:03 +0000
Received: from VI1PR04MB5151.eurprd04.prod.outlook.com
 ([fe80::85af:f8be:aa99:ba5f]) by VI1PR04MB5151.eurprd04.prod.outlook.com
 ([fe80::85af:f8be:aa99:ba5f%3]) with mapi id 15.20.4690.027; Tue, 16 Nov 2021
 15:22:03 +0000
From: Daniel Baluta <daniel.baluta@oss.nxp.com>
To: broonie@kernel.org,
	peter.ujfalusi@linux.intel.com
Subject: [PATCH 3/4] ASoC: SOF: intel: Use the generic helper to get the reply
Date: Tue, 16 Nov 2021 17:21:36 +0200
Message-Id: <20211116152137.52129-4-daniel.baluta@oss.nxp.com>
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
 Transport; Tue, 16 Nov 2021 15:22:02 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 016eb0bf-0719-4e4f-9819-08d9a914d7ad
X-MS-TrafficTypeDiagnostic: VE1PR04MB7213:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-Microsoft-Antispam-PRVS: <VE1PR04MB7213A376335DBB0F7AFEEC30B8999@VE1PR04MB7213.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 39wUnKqRYR/zbM+WICSdGelFeZLJ84uFg26Bwf7U3Zm3gltXIpXzmo5Dgt2Z14TRQkRwtGiRS4ERlneXSX9sK9IhNghVFPDHvjHZvNZknMgGIgzup5QJ4LAClboE9f/hNgrlK6SepSuOsEGZpYkoUVK2IlgclhQuwMeLLHk48psQtrhNxTHJBDlr47LePCTSX3j7GAo1HPVFybHyuo69vkgOuHWAib+vZ8Jn29qFhRp+SwLui8LKI8dtBMjTFbQYyRQ5rMAFIT663OZcg+ztflY3/mGgyNwlDBRBg6vLB9j885aUkTBX6q3yGjmdRcMy0nAUEVAVufim+6lm5JzlCccfefzjpC6gkdhQrwAtf5xkrEK7/CtDgRci9M+fhP4kcd/ubm2Ena8uCSTcNUqjP9YjpPswswyyR0haDRLLI4AhVIGsgbJy2QtfBVQP8x3ECNJO1ozt0+9BMOK/NKLRlIfuw2TVLHnnkCxJGta8bkd97yCiLzXz1yupKX6oh1jNObfJSrkyJOhDQmGnLxhbsyO/iNZ+1gDarJhe5/1Ui+noTpsv8Ui4c6ArQLiWppsTR0m3vNacDPLrl16feh7VpwX0wRxZZgdhnL0m9lRt7aDR/Xk2Mzykxl3hibeqf2Tl+bs6SDFTKzQP3BnCHbrzP8OafbRcpLzwZE/Bv3oA3s32FJmO70EcCxz0Jvv3wB//V7iZLQGoCnLQzs9SOFECg0S5T9X2wZcFWZiYg3sBY7k=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB5151.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(86362001)(54906003)(6666004)(44832011)(2616005)(66476007)(66556008)(66946007)(8676002)(8936002)(38100700002)(186003)(316002)(83380400001)(1076003)(508600001)(6486002)(5660300002)(52116002)(4326008)(2906002)(6512007)(7416002)(6506007)(41533002)(15583001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?yWObRaPbjRzqudGS89SLd+Ak9KUgAmgaRYqJi866S5mfIudUgiOTbCXIisu/?=
 =?us-ascii?Q?w5eEsHWZi9yyG6GaCGC1UWQRO9QdkzFmO7ZaoJJOApRMHJBkgL8+m9bkYT0q?=
 =?us-ascii?Q?UGxDt26swfysHZHMm1Cos5w58Gjsk45Xx6PKI17i8JF53ZCv0cJmkCsSjIOd?=
 =?us-ascii?Q?vjxEbqsRDiNwX8G2vqBFqJROS4kmSs3fkOYTst/7RiOySPcDeq8ugARxbRMX?=
 =?us-ascii?Q?fzygfFVyTPXCDohhpVCNsOHd0Gkkv5FN1cGDXXQfeKu/L49nJiSuDGsMQ++H?=
 =?us-ascii?Q?pkg3HNdheGKt0KVfi/yQpR3dxFJdCMcGz2xakqC1A17yp4am9y+SVsA2rVK8?=
 =?us-ascii?Q?p1a53yNEn9vj5E+P271k/7pfEWtzA1GhEUCtF66PXAd02KMYOmzYhSy5+kBu?=
 =?us-ascii?Q?2BnkgR5JQwmfuz0qwUar4jARBUmN0P9m7wXvA5P2KuIePwogHiUuhYLpU833?=
 =?us-ascii?Q?TpnTalyTf9+2t/cu4eb+J9hewQBhIHvBPqGgMWtEo2B1AvQruNADaQ0YSleu?=
 =?us-ascii?Q?6YzCRphGrs0s8ThHWVVpn+n+cxEMHW4Wd3IKZBrb5Bn8Y5ckwACpbLUi3oMP?=
 =?us-ascii?Q?cElbu/ZmXIGJIFIfVVk8BSB2/OX4YxjH5IZNFXb5KpurybCuczsYQ/h7+nOo?=
 =?us-ascii?Q?lY6xoJEMHHxU2Gs8dTId0pModQvkfVkiF3gCMnRf+wf12zPEN0UvY3SOiRTD?=
 =?us-ascii?Q?IZf3VOij9IItL1j6PTSRns84BH9tR6m8Ub1kZiCsp121z1sdlSO+/lISRNJV?=
 =?us-ascii?Q?DJa/JaeskjEmRjVxKiPRHChnhyZBfScBa3EJzVPqwqsjWwLy1+bll7Rya2Sk?=
 =?us-ascii?Q?wUXtASdwLPG/7EAhhgXkePz2jcJdeoyQBZ6HRE98lJN0Pq7Nskpff24oeq2x?=
 =?us-ascii?Q?+S5nQOzwNPM+2dTKCT1jchZKToNcYDNa2nl1a2sarJ1FwfOdQO7r2VdX0tX3?=
 =?us-ascii?Q?bFHYN4SgtBGr+fvQCtQ2PLr+f1xjprdYeubNrxBRlppfzHj27YTInRrJxnE+?=
 =?us-ascii?Q?BqpbO8zJfCe5Xy5kNFbbUgGz9/TleCGUnXpANmB11O5jgbqIX6wdZEfYkdTf?=
 =?us-ascii?Q?/yvyZ41grzVERHajfYwzY8kIT8D6HRehuG3XuljXg2Ig2RVUu+WGez1JvIuh?=
 =?us-ascii?Q?Lb1FmCJclFgExGw8NLc/JdMhMu+iTHtGGkTceMkEKVc9gkEjgUg4WKIB/NbZ?=
 =?us-ascii?Q?3xAiEaGfQN2P4AM/PiWh3YReEHFJ7/L0WykRa+I3SVCnDOJfOO1qBMpsgzYj?=
 =?us-ascii?Q?IferqchsiUFu6OsOcRxGD3FFN4hc2eJJ69jPTJsSoiEh+qkyT07FzW9hMjHF?=
 =?us-ascii?Q?1TX5gNdlEEv1BHTWpYNhosCuwvEonXn0wTUIuOo+rwH87qAfl7f51mOnwmW7?=
 =?us-ascii?Q?wfrll65RketzmwyIgwElTX15KC0/nzs17pTTB1Ox6AWUPTOb1mRLtX3EpxC6?=
 =?us-ascii?Q?eSSVvNACKsRf0A9q/CMAEuyx4Yg1iO0QulgImEvHBZeBmRT5yVsAxCqZ1WTa?=
 =?us-ascii?Q?N9r3uMK5OpHQw29UyLJk+0uMsYlZv2f1B6HJzHEA/iDSyNChoAK5Jli2u2hm?=
 =?us-ascii?Q?9lnfPXGYJwKi/4BDCl4rm7HqBgf4utciewSS34WnAZ2MvABjoIyYgDyYG+9T?=
 =?us-ascii?Q?0fpXU8d5nryuW6gftZzRu+dbEUAtzQjLOIHkH/eoIdic2VTTQBddUSCB3ceI?=
 =?us-ascii?Q?NL0lE38RuDgX1sMgQJJ8B6sk/85xQD8rGitzk1fNaoKkQiNz?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 016eb0bf-0719-4e4f-9819-08d9a914d7ad
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5151.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2021 15:22:03.4153 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a4kTggUeN0cASJMWKLRDQKa6dUAKmCuSGAL8jXjyZfWUhYDpT2gje2ZWGR0eiy9mRKBaToSBqWF6ULBQ+ynlBQ==
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

Make use of the generic snd_sof_ipc_process_reply() from the core instead
the local implementation.
snd_sof_ipc_process_reply() handles the reply retrieving and the ipc reply

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
---
 sound/soc/sof/intel/atom.c    | 43 +----------------------------------
 sound/soc/sof/intel/bdw.c     | 43 +----------------------------------
 sound/soc/sof/intel/hda-ipc.c | 29 ++---------------------
 3 files changed, 4 insertions(+), 111 deletions(-)

diff --git a/sound/soc/sof/intel/atom.c b/sound/soc/sof/intel/atom.c
index 74c630bb9847..cdc96a7df493 100644
--- a/sound/soc/sof/intel/atom.c
+++ b/sound/soc/sof/intel/atom.c
@@ -27,7 +27,6 @@
 
 static void atom_host_done(struct snd_sof_dev *sdev);
 static void atom_dsp_done(struct snd_sof_dev *sdev);
-static void atom_get_reply(struct snd_sof_dev *sdev);
 
 /*
  * Debug
@@ -154,8 +153,7 @@ irqreturn_t atom_irq_thread(int irq, void *context)
 		 * because the done bit can't be set in cmd_done function
 		 * which is triggered by msg
 		 */
-		atom_get_reply(sdev);
-		snd_sof_ipc_reply(sdev, ipcx);
+		snd_sof_ipc_process_reply(sdev, ipcx);
 
 		atom_dsp_done(sdev);
 
@@ -195,45 +193,6 @@ int atom_send_msg(struct snd_sof_dev *sdev, struct snd_sof_ipc_msg *msg)
 }
 EXPORT_SYMBOL_NS(atom_send_msg, SND_SOC_SOF_INTEL_ATOM_HIFI_EP);
 
-static void atom_get_reply(struct snd_sof_dev *sdev)
-{
-	struct snd_sof_ipc_msg *msg = sdev->msg;
-	struct sof_ipc_reply reply;
-	int ret = 0;
-
-	/*
-	 * Sometimes, there is unexpected reply ipc arriving. The reply
-	 * ipc belongs to none of the ipcs sent from driver.
-	 * In this case, the driver must ignore the ipc.
-	 */
-	if (!msg) {
-		dev_warn(sdev->dev, "unexpected ipc interrupt raised!\n");
-		return;
-	}
-
-	/* get reply */
-	sof_mailbox_read(sdev, sdev->host_box.offset, &reply, sizeof(reply));
-
-	if (reply.error < 0) {
-		memcpy(msg->reply_data, &reply, sizeof(reply));
-		ret = reply.error;
-	} else {
-		/* reply correct size ? */
-		if (reply.hdr.size != msg->reply_size) {
-			dev_err(sdev->dev, "error: reply expected %zu got %u bytes\n",
-				msg->reply_size, reply.hdr.size);
-			ret = -EINVAL;
-		}
-
-		/* read the message */
-		if (msg->reply_size > 0)
-			sof_mailbox_read(sdev, sdev->host_box.offset,
-					 msg->reply_data, msg->reply_size);
-	}
-
-	msg->reply_error = ret;
-}
-
 int atom_get_mailbox_offset(struct snd_sof_dev *sdev)
 {
 	return MBOX_OFFSET;
diff --git a/sound/soc/sof/intel/bdw.c b/sound/soc/sof/intel/bdw.c
index 2c09a523288e..156006bed017 100644
--- a/sound/soc/sof/intel/bdw.c
+++ b/sound/soc/sof/intel/bdw.c
@@ -75,7 +75,6 @@ static const struct snd_sof_debugfs_map bdw_debugfs[] = {
 
 static void bdw_host_done(struct snd_sof_dev *sdev);
 static void bdw_dsp_done(struct snd_sof_dev *sdev);
-static void bdw_get_reply(struct snd_sof_dev *sdev);
 
 /*
  * DSP Control.
@@ -326,8 +325,7 @@ static irqreturn_t bdw_irq_thread(int irq, void *context)
 		 * because the done bit can't be set in cmd_done function
 		 * which is triggered by msg
 		 */
-		bdw_get_reply(sdev);
-		snd_sof_ipc_reply(sdev, ipcx);
+		snd_sof_ipc_process_reply(sdev, ipcx);
 
 		bdw_dsp_done(sdev);
 
@@ -372,45 +370,6 @@ static int bdw_send_msg(struct snd_sof_dev *sdev, struct snd_sof_ipc_msg *msg)
 	return 0;
 }
 
-static void bdw_get_reply(struct snd_sof_dev *sdev)
-{
-	struct snd_sof_ipc_msg *msg = sdev->msg;
-	struct sof_ipc_reply reply;
-	int ret = 0;
-
-	/*
-	 * Sometimes, there is unexpected reply ipc arriving. The reply
-	 * ipc belongs to none of the ipcs sent from driver.
-	 * In this case, the driver must ignore the ipc.
-	 */
-	if (!msg) {
-		dev_warn(sdev->dev, "unexpected ipc interrupt raised!\n");
-		return;
-	}
-
-	/* get reply */
-	sof_mailbox_read(sdev, sdev->host_box.offset, &reply, sizeof(reply));
-
-	if (reply.error < 0) {
-		memcpy(msg->reply_data, &reply, sizeof(reply));
-		ret = reply.error;
-	} else {
-		/* reply correct size ? */
-		if (reply.hdr.size != msg->reply_size) {
-			dev_err(sdev->dev, "error: reply expected %zu got %u bytes\n",
-				msg->reply_size, reply.hdr.size);
-			ret = -EINVAL;
-		}
-
-		/* read the message */
-		if (msg->reply_size > 0)
-			sof_mailbox_read(sdev, sdev->host_box.offset,
-					 msg->reply_data, msg->reply_size);
-	}
-
-	msg->reply_error = ret;
-}
-
 static int bdw_get_mailbox_offset(struct snd_sof_dev *sdev)
 {
 	return MBOX_OFFSET;
diff --git a/sound/soc/sof/intel/hda-ipc.c b/sound/soc/sof/intel/hda-ipc.c
index 11f20a5a62df..2019087a84ce 100644
--- a/sound/soc/sof/intel/hda-ipc.c
+++ b/sound/soc/sof/intel/hda-ipc.c
@@ -70,7 +70,6 @@ void hda_dsp_ipc_get_reply(struct snd_sof_dev *sdev)
 	struct snd_sof_ipc_msg *msg = sdev->msg;
 	struct sof_ipc_reply reply;
 	struct sof_ipc_cmd_hdr *hdr;
-	int ret = 0;
 
 	/*
 	 * Sometimes, there is unexpected reply ipc arriving. The reply
@@ -94,35 +93,11 @@ void hda_dsp_ipc_get_reply(struct snd_sof_dev *sdev)
 		reply.hdr.cmd = SOF_IPC_GLB_REPLY;
 		reply.hdr.size = sizeof(reply);
 		memcpy(msg->reply_data, &reply, sizeof(reply));
-		goto out;
-	}
-
-	/* get IPC reply from DSP in the mailbox */
-	sof_mailbox_read(sdev, sdev->host_box.offset, &reply,
-			 sizeof(reply));
 
-	if (reply.error < 0) {
-		memcpy(msg->reply_data, &reply, sizeof(reply));
-		ret = reply.error;
+		msg->reply_error = 0;
 	} else {
-		/* reply correct size ? */
-		if (reply.hdr.size != msg->reply_size &&
-		    /* getter payload is never known upfront */
-		    ((reply.hdr.cmd & SOF_GLB_TYPE_MASK) != SOF_IPC_GLB_PROBE)) {
-			dev_err(sdev->dev, "error: reply expected %zu got %u bytes\n",
-				msg->reply_size, reply.hdr.size);
-			ret = -EINVAL;
-		}
-
-		/* read the message */
-		if (msg->reply_size > 0)
-			sof_mailbox_read(sdev, sdev->host_box.offset,
-					 msg->reply_data, msg->reply_size);
+		snd_sof_ipc_get_reply(sdev);
 	}
-
-out:
-	msg->reply_error = ret;
-
 }
 
 /* IPC handler thread */
-- 
2.27.0

