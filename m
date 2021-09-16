Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FCD940D864
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Sep 2021 13:20:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B154018C2;
	Thu, 16 Sep 2021 13:20:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B154018C2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1631791253;
	bh=p0eQnZFTrLARXBAjbtsO+KJY25qNLRMvLKylKhIhSoE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oiwFDMMFVFGu/Ge5rye5CFrq+DSuVONOp4kENdsi3AZh4mRLa13Oa/M55U4q58OG2
	 VaT1VyLixIl231yYAEkq4cBK34crEusy6sFTHRm7PHrD23mRf8WD+pY84CZRQtURH+
	 kua5hue/FRRWFIYslbDIvm9VusTvG7kZpVLwtEoc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 52640F8051A;
	Thu, 16 Sep 2021 13:17:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2B34EF80510; Thu, 16 Sep 2021 13:17:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 MSGID_FROM_MTA_HEADER, SPF_HELO_NONE, SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr50050.outbound.protection.outlook.com [40.107.5.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D05ECF804CA
 for <alsa-devel@alsa-project.org>; Thu, 16 Sep 2021 13:17:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D05ECF804CA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=NXP1.onmicrosoft.com
 header.i=@NXP1.onmicrosoft.com header.b="lfM6eHzn"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Tf3ANdliIJGoHmoNpuhD2tQ0eyAGbPEPNT8nbB/zv2v5ZQKK5+V3y6YHz7YsOSzzd4lYmbf/9S/r5+H39D41U+M/98l4rDFki2/N3iw5C6qQKptNY3rAFISeJUQZeJhHn79QivnNJMWF8T5N1Y0vwqATfYDvP/IT7XAK0z4mpP+Ewfipt7H+1G8bOj3NxvSrx030JzZox0kF1+cMiMxELmRmEY1Oee0gOdfWcYUxUClZltgmzw4/T75SW3CAvKxbCeUcDYW4pJ8fJmUVY/tccDEkQuB2u4t9xlPCIdPX+7GyiDxTxVjmuQ6Wi8WaYGpZO4qJ07Q4CP5gg0u4/pqm3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=qtCBUgXbw0Jm/D+hAyrYpV07ZReay7t/+4NPNz5XDgA=;
 b=Oj2VDHXgxTIsbU1ElWGZ4z+z/EXOqOaI6TMaCHBbzbs0jK209UV46l8IITPZ3iiLiFVLyAk1LnOgxLPUozs+tAJoBtPDYbDQnr8ATebwoT4Ij91cmHyBB8yASrFoohabjeJ+tXmYJWP3mb4rLZhUJUd5v1VPjlIxky5pRKr15Px6iZzHad65a0vgOe15UYVUgU1vkkZdE3SS31DRmRPSVMExar52GKzsU4QpirlIrk8yIHy75zQHTb5onwXZEfR3ag0yKxfN8tiliMHAttiEWhYRKS1JIRFStNglsNI5mI7xi8QRD4BuZHuO14Z5wiDrqY6zvopcWUPkeHGDGmSH3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qtCBUgXbw0Jm/D+hAyrYpV07ZReay7t/+4NPNz5XDgA=;
 b=lfM6eHznp2F2Y/jKlQFe86Aeh4ZTggjKe6O2XrE1bgTZw5/NoAkEMhgJ/5WEFyH4+9cZJVnEgv8s6+i3k0Wqz/wt5T+DY90Vh2w3E71JUEyHLm2vCLS94laD+tYc3t3gotK5Oo90b2j1FYNMSjVIu3W2h435e2uSmgl/N0J3K8k=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=oss.nxp.com;
Received: from VI1PR04MB5151.eurprd04.prod.outlook.com (2603:10a6:803:61::28)
 by VI1PR04MB4926.eurprd04.prod.outlook.com (2603:10a6:803:51::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.18; Thu, 16 Sep
 2021 11:17:14 +0000
Received: from VI1PR04MB5151.eurprd04.prod.outlook.com
 ([fe80::499b:ba92:db2e:3f28]) by VI1PR04MB5151.eurprd04.prod.outlook.com
 ([fe80::499b:ba92:db2e:3f28%7]) with mapi id 15.20.4500.020; Thu, 16 Sep 2021
 11:17:14 +0000
From: Daniel Baluta <daniel.baluta@oss.nxp.com>
To: broonie@kernel.org
Subject: [PATCH 07/12] ASoC: SOF: restore kcontrols for widget during set up
Date: Thu, 16 Sep 2021 14:16:41 +0300
Message-Id: <20210916111646.367133-8-daniel.baluta@oss.nxp.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210916111646.367133-1-daniel.baluta@oss.nxp.com>
References: <20210916111646.367133-1-daniel.baluta@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM0PR04CA0037.eurprd04.prod.outlook.com
 (2603:10a6:208:1::14) To VI1PR04MB5151.eurprd04.prod.outlook.com
 (2603:10a6:803:61::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (2a02:2f08:5708:8600:b29c:ccfa:a961:8ebd)
 by AM0PR04CA0037.eurprd04.prod.outlook.com (2603:10a6:208:1::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14 via Frontend
 Transport; Thu, 16 Sep 2021 11:17:12 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 64e140bc-1185-45da-a63e-08d9790388d1
X-MS-TrafficTypeDiagnostic: VI1PR04MB4926:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB49264A2AD62809C5DC72AAB6B8DC9@VI1PR04MB4926.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:669;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1a8uFkoRfN6aiPGn5ArN6x3TBtYQnVfb7HhlqZfz+XvOVf/+CedljUUF/Ivr1Ya5pksoXXpdO8cMVOJOkT+/sYp8lcFsH4qPyFitMNHq+kUeEy1d64fO0thGf7ITHMEZqiyX+76yaofXCTmW84t4LDNh6iyKhoEbhVFKoMDziSITodEBIO+7i1LzmnIqbpYmbvCBD/CjBZ7k7H+sKRpOjUTz0D2d0OUW/ERyeNzPe7nPDycIMvTWHxsgVK/fbxkRXDyLuj5F5tQQrsbBmjRxkjMI+MwYnYVOA+o8HtOckBvfqS8uFgedRAMaaEYs5TC6qUeG7DDT3qM4j4kJRnObajUu72GvQibtB+473ep9u6+1vjdL5KCxQqfG1ET/vWzOuWnE7QJdQuzEIrYpg6EG3Ytvgd1ABIEZnZGPl4T7rQBijwwGz8+h+sSZYtEKxh0oU2DT1zr6vgcWyvMNtRZ4v47x4l+yXfQCKKjAibc1ksCnGoL+DjP56vwrcSLhbwvQ3C/YuMXqX5zI6IzkP+UCP6IwKaiAJqHIo30+TcjxiFkwPVYfmYBmf2eNwAJvBYrRy9yT81DWjgzDzpZYAW3xkq5K9D2JjzzK8/9UgEsWaxZwlIIs5pTqje02Ij9ON7B3/Q7qtyanchnbmvcJXGEemQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB5151.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(366004)(136003)(376002)(346002)(396003)(4326008)(8936002)(7416002)(6486002)(186003)(83380400001)(6916009)(2616005)(5660300002)(66946007)(52116002)(478600001)(8676002)(6512007)(6506007)(54906003)(86362001)(2906002)(66574015)(44832011)(66476007)(66556008)(316002)(1076003)(38100700002)(6666004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NUl4R2JrMTVZTFQvKzNDazNVSDRSUmlvUndNeEFuRTBtaS9HYVR4WnhlbWdM?=
 =?utf-8?B?T1BIdTM4bHpUYlhSVGgyUlpBc2F3WmxRdUJYQUd0eXM4R0krYmx0b0xZVzdn?=
 =?utf-8?B?dEFzVVZhYm51eHJaTWtlYWlQajVMWnJvSGRkMzNWYmNDb3JvK2lOTHo1QVQ5?=
 =?utf-8?B?WVBscGgyb0R2MEdBb1ZiYnZnckxQS29SMUZtOUMxbVBLZE81MjRTV2g2dG9S?=
 =?utf-8?B?OWd1UkNOZDVBQWNLQVp5cklBemxhZUJlMWQ2RytlSitobFJkbjNBblQyS01j?=
 =?utf-8?B?cStjSHRPZTc0RVBGWlJJYUpGaUtGV1JxMWlXcFpiZjVwNzhiL3RSL0E4dnh1?=
 =?utf-8?B?azFCNHhacjAvVmhLcmFlSW5kZHEwYjVVcURBbXArbDZpM20yQmlQbS93UmxK?=
 =?utf-8?B?WmJjOXBmUmtvRlhYMzJKZDJva0NWZ0RqUnhFUUpUTSt6ejZzNHlVempUbkNt?=
 =?utf-8?B?enNXMG5BbCs4QS9xY0tYczlQcFZEOXBMcForVkZBc1FaSmtiQkZPNlhyZURx?=
 =?utf-8?B?RXZtTm5PMGphaDJlcS9ERE5FWWpsUjN1N2tnSnN4cC8rYXc5MTlLd1A3aVp4?=
 =?utf-8?B?bjlCWTNDNkljbzAxcUdSdHM5cUpCQkVRVkNoM1NqZGJDZFZFbjlDNjB5QjFp?=
 =?utf-8?B?SXY5b1R3bUFRTEU3SWJoZyt1NFdrVlVHQUhPQ0FrRFM3cUthbTdrVnJrUjVG?=
 =?utf-8?B?L3Bmb21zN3F3TUR2bGsrMXNQN3k5WENwRVFyZnduY0hHVVhYRnpsZGN4LzMz?=
 =?utf-8?B?N2FtOU1lTlBXNnZTQU5rdmQ5dXJNUnM1OFNuUTlQUGdIVTJjQ0hDelkrdHNH?=
 =?utf-8?B?Vjl3S3pSYmNoTlo4dGk2MldTdFcrajlCTUdGcmhJY0dzOWMybURldXB5SU5m?=
 =?utf-8?B?Z1h6MjVQOU1YRk5LODhIYko3OW1QMWd2RDR5L1ltU2hoQVliMVgzZzlrb1dC?=
 =?utf-8?B?cGxRVzB0d3VWT1FCR3c4Y2ovdlgzUUtRYXJUa21iU1JISnJrNmhWVmR4anZW?=
 =?utf-8?B?NmVscWhnRHhMdENVVDlPeUd2MHF0azhCaHlEZHo4d2ZJTk8vTDdLNTRFSWJE?=
 =?utf-8?B?MHVjNXkxL283MXRoby84ckRKMTE1eU5YN3RWZGxjMVpockhXaDJYR3Frc21R?=
 =?utf-8?B?NzN1QXRUTXprOUt1MFgvUklDeDVWWk1Mb2xoZ0NjZ3Vqa1dMRW94MWhrODdM?=
 =?utf-8?B?bk5RdWhwZFYxdUFTNWtvN0JjZEY4by9pNlRDS2szNit3Ui9SZHphNHV5UGlW?=
 =?utf-8?B?b0pmcnYxdVBpRmcxRS8zM3FrbTdBUS9YTkFFR0VyK2pqclR3YzZxSDJ4QTRN?=
 =?utf-8?B?OTF2YytyTkJVeFcxZW1iV0oyNFRBM3ZPelpqcURlWlBKWUJWanJkMVhibktO?=
 =?utf-8?B?NkNRRFBDU2VhZnRGS1FLWlozWkpueGpZendOOEcvSTE2QXF1amhlK29Gd3ZO?=
 =?utf-8?B?cHBmQnN5NEdJb2lURnFwd2JzcWF1L0E4cEJNVCtDU1RYcU1SNHFDWkNSQzcx?=
 =?utf-8?B?Z21pb3Fqak9keTd3MERDQXc5WDU2M2pzbXRSMEdodGxYZnRpdDRwbGJzSWNo?=
 =?utf-8?B?dWlSQi9sTkx2aGh0d2FKK3RTN29hVHd6YUlXN3ZUWXFINTcreXltWGFIWUl6?=
 =?utf-8?B?WHRWMGNIVFJYdVhOc3NISFlIeXpVVVRUcUZTdk9Tamk5c2pvTmsyV0tCZ1ho?=
 =?utf-8?B?eDJJdXJnUXEwdm5JSTNiRk4va241T2RqWCsvbGpkVG1tUmdyQ0pnaVJ0S1FD?=
 =?utf-8?B?bjZUaHBZcVp4ZExPV0ZzMkJ1NnBSV2Y2UitZc05HY0JESVcwWm4rcnB3eTIy?=
 =?utf-8?B?cDMxcWloVUR5KzM4VXlPRjBKa1BzR2dhOTZXVnZkbjAzNmlYZmtRS2RHcXhl?=
 =?utf-8?B?U0NCc3laNXloVGRxRnkyNGRYZkx0Vkt6TWxxdmlCR0pkUWc9PQ==?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 64e140bc-1185-45da-a63e-08d9790388d1
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5151.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2021 11:17:13.9907 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KN4m427d8OCaSOgH9mmaiFlFh/LEYYMV2CbxA9Eh/xJy2O72sHSQkHjVvv6HVZocOlXJGbvhHdR4ctzCVHe3OA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4926
Cc: pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org,
 Seppo Ingalsuo <seppo.ingalsuo@intel.com>, kai.vehmanen@linux.intel.com,
 lgirdwood@gmail.com, daniel.baluta@nxp.com, linux-kernel@vger.kernel.org,
 =?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@intel.com>,
 ranjani.sridharan@linux.intel.com,
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

Restore kcontrols for each widget after it has been set up
successfully.

Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@intel.com>
Reviewed-by: Seppo Ingalsuo <seppo.ingalsuo@intel.com>
---
 sound/soc/sof/sof-audio.c | 59 ++++++++++++++++++++++-----------------
 1 file changed, 33 insertions(+), 26 deletions(-)

diff --git a/sound/soc/sof/sof-audio.c b/sound/soc/sof/sof-audio.c
index b52a453ae9d7..b27760208a4b 100644
--- a/sound/soc/sof/sof-audio.c
+++ b/sound/soc/sof/sof-audio.c
@@ -64,6 +64,25 @@ static int sof_dai_config_setup(struct snd_sof_dev *sdev, struct snd_sof_dai *da
 	return ret;
 }
 
+static int sof_widget_kcontrol_setup(struct snd_sof_dev *sdev, struct snd_sof_widget *swidget)
+{
+	struct snd_sof_control *scontrol;
+	int ret;
+
+	/* set up all controls for the widget */
+	list_for_each_entry(scontrol, &sdev->kcontrol_list, list)
+		if (scontrol->comp_id == swidget->comp_id) {
+			ret = sof_kcontrol_setup(sdev, scontrol);
+			if (ret < 0) {
+				dev_err(sdev->dev, "error: fail to set up kcontrols for widget %s\n",
+					swidget->widget->name);
+				return ret;
+			}
+		}
+
+	return 0;
+}
+
 static int sof_widget_setup(struct snd_sof_dev *sdev, struct snd_sof_widget *swidget)
 {
 	struct sof_ipc_pipe_new *pipeline;
@@ -113,10 +132,20 @@ static int sof_widget_setup(struct snd_sof_dev *sdev, struct snd_sof_widget *swi
 					 &r, sizeof(r));
 		break;
 	}
-	if (ret < 0)
+	if (ret < 0) {
 		dev_err(sdev->dev, "error: failed to load widget %s\n", swidget->widget->name);
-	else
-		dev_dbg(sdev->dev, "widget %s setup complete\n", swidget->widget->name);
+		return ret;
+	}
+
+	/* restore kcontrols for widget */
+	ret = sof_widget_kcontrol_setup(sdev, swidget);
+	if (ret < 0) {
+		dev_err(sdev->dev, "error: failed to restore kcontrols for widget %s\n",
+			swidget->widget->name);
+		return ret;
+	}
+
+	dev_dbg(sdev->dev, "widget %s setup complete\n", swidget->widget->name);
 
 	return ret;
 }
@@ -203,22 +232,6 @@ int sof_set_hw_params_upon_resume(struct device *dev)
 	return snd_sof_dsp_hw_params_upon_resume(sdev);
 }
 
-static int sof_restore_kcontrols(struct device *dev)
-{
-	struct snd_sof_dev *sdev = dev_get_drvdata(dev);
-	struct snd_sof_control *scontrol;
-	int ret = 0;
-
-	/* restore kcontrol values */
-	list_for_each_entry(scontrol, &sdev->kcontrol_list, list) {
-		ret = sof_kcontrol_setup(sdev, scontrol);
-		if (ret < 0)
-			return ret;
-	}
-
-	return 0;
-}
-
 const struct sof_ipc_pipe_new *snd_sof_pipeline_find(struct snd_sof_dev *sdev,
 						     int pipeline_id)
 {
@@ -309,13 +322,7 @@ int sof_restore_pipelines(struct device *dev)
 		}
 	}
 
-	/* restore pipeline kcontrols */
-	ret = sof_restore_kcontrols(dev);
-	if (ret < 0)
-		dev_err(dev,
-			"error: restoring kcontrols after resume\n");
-
-	return ret;
+	return 0;
 }
 
 /* This function doesn't free widgets. It only resets the set up status for all routes */
-- 
2.27.0

