Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 33D2F456CAE
	for <lists+alsa-devel@lfdr.de>; Fri, 19 Nov 2021 10:45:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CE54917CD;
	Fri, 19 Nov 2021 10:44:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CE54917CD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637315144;
	bh=qmzWD08Kfa8VlD+nxKsplmD7jlP0ovWLFkY4Le3ntNk=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=E+lJzDbzl/xn3k1zITWXL6/U4BSHG2UgeHcTDKSdHzKBWtcIszg/X5SrVU/DwJjhE
	 07eiwoCxjEM9x8SKhgKFWn7ZL4C1oL6Kj9VHx7cKvqUKZFH5x9LQXxwAp9CHgnbw1c
	 nyB78WG8nh7BdsWXGf3c9GLwy4iRLkNGDbASJ2eo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6EAC5F80506;
	Fri, 19 Nov 2021 10:43:50 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E0D7DF804D2; Fri, 19 Nov 2021 10:43:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 MSGID_FROM_MTA_HEADER, SPF_HELO_NONE, SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2049.outbound.protection.outlook.com [40.107.20.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8E0B4F8027D
 for <alsa-devel@alsa-project.org>; Fri, 19 Nov 2021 10:43:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8E0B4F8027D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=NXP1.onmicrosoft.com
 header.i=@NXP1.onmicrosoft.com header.b="fS305YoI"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PliBtMN8OrfXGNdMaNoghrOquiZ8c5j1N027Xrsop/moFJtddfn3jtKO07CdsSI33j7kBbzmn6VMrp7Z339c3SA2YsGC3p0Qm9FBQqON4kljn2LXfNsEfnzqd91Wq/IPXI6j7++dvQWZZ+6djij2k0mb2U3wskas4OsjzHTsaWFAP5J02drf5VFDlE+GZQoNAtCtZKTJ5nYf+IKYf8PSyIVDIczf0le7zJN3nxcSUz1GPrvJDKJ1XEevSXlmJcI2B4IAhaoDLYL7bFwmSG3TqwXNPcPykPVXSZ1PgI1El/3GlDR3cgwIHZmWI32XU42vtBn0Q3j+6wD/YffOzswahg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hxh10uJCvH4bSN1kqJK3p+nh3xdYf0fnlgTDIY2+/gk=;
 b=bn5HJ/L10GryVr3lUQEbaHbQOmghr9geEiKr/jx7rn4zprRL+nT9nm7kYjvAS9cXehDomljSKY8AsiVjsddueJx8f91TptlffgopqynNd86r7ojS8I6yAcQxsgZ/2kFRVu6yrQ9g/AOOEwpVFJxrrVirDNDWMuTLxLdYY2WdTdWmxoc5u9dx4Fu1OetHudYoj5vdVQGT1AfNZCwPsf4Eun7yVofQne8FRUU08Q41o7Ic1O7nFO+Fkfrc3WpV/CcQ1wr3PQnFWAhZ0XCq/0zcqwG2MiD7TfyTFrT3+9zLRvVjWccubMVrg6i26Nhvpq7Vqw4r7H5oWgpLaNKNTqCktg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hxh10uJCvH4bSN1kqJK3p+nh3xdYf0fnlgTDIY2+/gk=;
 b=fS305YoIRgiVhoQ/Txw978NBy886z+QLV3gbZIR/Rm9xNYzjiYCOoWdV3kd5GskuxNbMvrXaUhHdiT6oPcPzeSRpJz6VqWv6WWpnt3rLvibDodYmtCzSOJsFgZXYS5zZrv6T4ZTGGP6aIbhyjjFtx7NWJmYoF7jAqfqZJLRKq8s=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from VI1PR04MB5151.eurprd04.prod.outlook.com (2603:10a6:803:61::28)
 by VE1PR04MB7358.eurprd04.prod.outlook.com (2603:10a6:800:1a5::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.15; Fri, 19 Nov
 2021 09:43:33 +0000
Received: from VI1PR04MB5151.eurprd04.prod.outlook.com
 ([fe80::85af:f8be:aa99:ba5f]) by VI1PR04MB5151.eurprd04.prod.outlook.com
 ([fe80::85af:f8be:aa99:ba5f%3]) with mapi id 15.20.4690.029; Fri, 19 Nov 2021
 09:43:33 +0000
From: Daniel Baluta <daniel.baluta@oss.nxp.com>
To: broonie@kernel.org,
	alsa-devel@alsa-project.org
Subject: [PATCH v2 2/5] ASoC: SOF: imx8: Add runtime PM / System PM support
Date: Fri, 19 Nov 2021 11:43:16 +0200
Message-Id: <20211119094319.81674-3-daniel.baluta@oss.nxp.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20211119094319.81674-1-daniel.baluta@oss.nxp.com>
References: <20211119094319.81674-1-daniel.baluta@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM0PR02CA0099.eurprd02.prod.outlook.com
 (2603:10a6:208:154::40) To VI1PR04MB5151.eurprd04.prod.outlook.com
 (2603:10a6:803:61::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (2a02:2f08:5706:b700:187d:3f5e:91e7:280d)
 by AM0PR02CA0099.eurprd02.prod.outlook.com (2603:10a6:208:154::40) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.19 via Frontend
 Transport; Fri, 19 Nov 2021 09:43:32 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: af825f02-2e29-46cb-dfbc-08d9ab410d62
X-MS-TrafficTypeDiagnostic: VE1PR04MB7358:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-Microsoft-Antispam-PRVS: <VE1PR04MB735887BC4E72BF56038AA529B89C9@VE1PR04MB7358.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2+llvFKhw4kIzC983IPRTFY7McTJVsSHpTy65+LxMbaoGsXsZt3gJicQDrqumxfj+EUaW9X7GO3BfSpn8cM7pHnjZ+OjEd0uYFvcDlyJXEnZ1MFRgcgBZK1we7M027kApP+4ftqhc81h0rUDJOcSVVdPj/CFkUveD4gl4djlgIECkvagVYjEQTNI/neqkp0OIFlmn592mS5TqDYBobOtChOGFqVoGglYoggZQWQlUR+y/x8nmrxv37c9cwCWg1w86OMUlXBodHpbSG+lWyvm4me/W6Yj/Vc45nekTu3yIbLYU907csuAx0c6KHGbD0ZmD7xCMqtW0FNo9PUhsyb3zsznzaP/A8OZDoU9DKxHvdh/Xe2KHEhqOYtEXETnwaJMQjuduvLLhzrEtT/7G2FW/e5m474H9sO9POL28cWlYTCFRFD+wB2co9vdNMnc7hUL3Djy88DV5epnQh4+f6ZAwwYr0o/jTEp+cu/1ZOTcRXMcSFoj6UgRk9Yvy4chf0OCbYVrFHsFk7xBf1BAZ7AJJaOjTQl7DlUaWnPQpuEYdDH1kkySqX7kiStdM231yHxyP8MN5zbwLl0hfkd/p+2MPxRGF2O6b2KngBgGXqjRxniOwWFCrBRP6C4F2a2766Cy6MielNaaPQS7E7SnIMPN6w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB5151.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(2906002)(66556008)(52116002)(186003)(6506007)(6512007)(44832011)(2616005)(8936002)(508600001)(66476007)(66946007)(1076003)(5660300002)(83380400001)(38100700002)(6666004)(4326008)(6486002)(316002)(8676002)(86362001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?J8M3CkOxyZ1zSOqvzoWD1+J1fBhOiKWqY+gs1lKMOiMQ6Xoym5IoIhsaEcT8?=
 =?us-ascii?Q?B1m1zo1MIGmKRHMaONAR7E1jtyemE7JhcMenAzeoGrXVDW8SKzTab4KMaDWv?=
 =?us-ascii?Q?kMUpxC90OJICAYKKPmPzmz+HvoM4kaMH/ibKDsSF/nC2cmI1qGzC3xG/lZfT?=
 =?us-ascii?Q?sP9alsGRL6Fo6cNG60e/q5j2Z5D+V1sioEv073Qu+BXglSxlFL8cUdwOWnmb?=
 =?us-ascii?Q?coPzGSpjmAQBKypreRTVcB47/wOx9+bEBWgq/Qw1TzR+Qj8RSlcmMTTvaSJO?=
 =?us-ascii?Q?xZrN719ji8PxpsZqi/K6WYLcX3Pgp3BlVBNMf66R4B4DM666nb2Q7WG7EkLg?=
 =?us-ascii?Q?OVY08xInkTrROVkcd/AaZcX9dsb78hoBkA/3y1VVLDU1LQaM30gwtrjO1pZy?=
 =?us-ascii?Q?T+Os8GuSlsqQsm2kFaoDYUH0COpTfVxbTCx9peWiuOwtV1qqhR+JZIc+1INO?=
 =?us-ascii?Q?7cv4lIbw6RIAwS9ca/WfXsPuPmpf6mtRbRLPOJj0EWkaky4GfhsCB3rSM+ig?=
 =?us-ascii?Q?WCMhkZRDGpe2yZrQUQtmK5xzXNsMvZvbZ6/6nfBNzOBMla1YQtsqQIG9OIgc?=
 =?us-ascii?Q?UrzLw2pne395BE0jTYr3L3MKWBZw2z8n+lBWFtKDAVkKwRkY4u0w740pFd3E?=
 =?us-ascii?Q?ckjYneyxpteWv2sNppoFmX57qt2/JNCx9GeTq12teE87fvVbbY+MA8kHnab0?=
 =?us-ascii?Q?qXOWy32PzTPo+yN3XL/1m+aPMk8KKFxIh2xdtHamSTlY5aTAFgvuSq6bZirq?=
 =?us-ascii?Q?p6jHmvrWOInqiq1E/yUE4NgQpgDbHgqzXPDwneqz/awk5HnJNOnBfkuz8e8U?=
 =?us-ascii?Q?qqXKyPofebEod8SM9uYsgCpiqYllC5Mt5cPHW+c9Y+6J2+/FB0XbY0wPpnzc?=
 =?us-ascii?Q?9DU+5TiQ6g98m71eBjDW/0EyT6wVmElatmnYf/MxnUlDwIHcnbL1d8dNAm19?=
 =?us-ascii?Q?txh4QPZ822FjSj10co96ZndcD/P161Qesg4NyvL1gxXxUbAaqeEBzv9f7LNB?=
 =?us-ascii?Q?Q772TKieH6Fw9FHjgdy7GncyS8H1HLa4mDWS6v7izqZbGkem7KYm2WeLIJm2?=
 =?us-ascii?Q?TR7lBo2gN1oCWOoSoDWsIyosCkpWQM/8V+GMCyNaCOnzvdA3NCGXnjBOpcE1?=
 =?us-ascii?Q?/EYMkD1gCQfzy2LOQ6QLOv+5WuPl+EX7/bcuJk2LPGxUdfYRfxIJCDe7EEu0?=
 =?us-ascii?Q?Wn/6y76cxGmFCfNP6HHyYgnCpNzzYGNeY4O+03ie+C2SY7Yc2NxMzRXsShpM?=
 =?us-ascii?Q?CgD+iBurrjawjLUQY4jPxUKKQz5T6ak87Pt+UZC8Xl5ER8w2S0OAi7WvjZGg?=
 =?us-ascii?Q?r+zm6+0om/R3Ayf/NwuV+WV9h6txvK4F/T2fratEPTN0MwOwK65amLrrZCH8?=
 =?us-ascii?Q?cBi8yUMkbQeUnpH/86tVwBJi76waoTOG1C9ZVu/Q5yx+PUKq8kOxP0SLL31r?=
 =?us-ascii?Q?dUatNgrWhNVts4KL1cPjRoXxzJzS/Wt8eHF0GDsKDo8dssPwd85n4QVxGO9s?=
 =?us-ascii?Q?gLR0xAUDM/6FKfdF/0sPtInMZJtyonIoexKpCXR3NsDvZCXyOBMwU0T/nr6c?=
 =?us-ascii?Q?vH9/CHa5ije4im0RVRnB7K4/OqrDzAuUFpdROyrP9cSAIGjeMYBJo4GJdNX3?=
 =?us-ascii?Q?VSNdB3sFgQtiq0OAiFXcXDGE+7WTb+elU4ms3Qg5/IKfJJe87+pTg/2syVYa?=
 =?us-ascii?Q?lgPg1M6i9LJpBrdBO80udNLAjAGHZXAdmKJZgVSVm0l+jvsl?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: af825f02-2e29-46cb-dfbc-08d9ab410d62
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5151.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2021 09:43:33.6902 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KT/DaHZyphvMUEJ+/JNji7O+/pSd0zkywnAjnVgGsl4ZPM/2v4tEnuxc7AXDQyFxQSnduKK1ho6o2fb5PFRt0Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7358
Cc: daniel.baluta@gmail.com, lgirdwood@gmail.com,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 linux-kernel@vger.kernel.org, pierre-louis.bossart@linux.intel.com,
 linux-imx@nxp.com, daniel.baluta@nxp.com
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

From: Daniel Baluta <daniel.baluta@nxp.com>

Handle clocks and mailbox channels at runtime suspend/resume
in order to save power.

DSP runtime PM uses a timeout of 2s. If device
is idle for 2s system will enter runtime suspend.

Because SOF state machine assumes that even if the DSP wasn't previously
active at a System resume, will re-load the firmware we need to make sure
that all needed resources are active.

Kernel core will take care of enabling the PD, we need to make sure that
we request the MU channels.

Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/imx/imx8.c | 116 ++++++++++++++++++++++++++++++++++++++-
 1 file changed, 115 insertions(+), 1 deletion(-)

diff --git a/sound/soc/sof/imx/imx8.c b/sound/soc/sof/imx/imx8.c
index 32f852cbba30..c4755c88d492 100644
--- a/sound/soc/sof/imx/imx8.c
+++ b/sound/soc/sof/imx/imx8.c
@@ -320,7 +320,9 @@ static int imx8_probe(struct snd_sof_dev *sdev)
 	if (ret < 0)
 		goto exit_pdev_unregister;
 
-	imx8_enable_clocks(sdev, priv->clks);
+	ret = imx8_enable_clocks(sdev, priv->clks);
+	if (ret < 0)
+		goto exit_pdev_unregister;
 
 	return 0;
 
@@ -364,6 +366,92 @@ static int imx8_get_bar_index(struct snd_sof_dev *sdev, u32 type)
 	}
 }
 
+static void imx8_suspend(struct snd_sof_dev *sdev)
+{
+	int i;
+	struct imx8_priv *priv = (struct imx8_priv *)sdev->pdata->hw_pdata;
+
+	for (i = 0; i < DSP_MU_CHAN_NUM; i++)
+		imx_dsp_free_channel(priv->dsp_ipc, i);
+
+	imx8_disable_clocks(sdev, priv->clks);
+}
+
+static int imx8_resume(struct snd_sof_dev *sdev)
+{
+	struct imx8_priv *priv = (struct imx8_priv *)sdev->pdata->hw_pdata;
+	int ret;
+	int i;
+
+	ret = imx8_enable_clocks(sdev, priv->clks);
+	if (ret < 0)
+		return ret;
+
+	for (i = 0; i < DSP_MU_CHAN_NUM; i++)
+		imx_dsp_request_channel(priv->dsp_ipc, i);
+
+	return 0;
+}
+
+static int imx8_dsp_runtime_resume(struct snd_sof_dev *sdev)
+{
+	int ret;
+	const struct sof_dsp_power_state target_dsp_state = {
+		.state = SOF_DSP_PM_D0,
+	};
+
+	ret = imx8_resume(sdev);
+	if (ret < 0)
+		return ret;
+
+	return snd_sof_dsp_set_power_state(sdev, &target_dsp_state);
+}
+
+static int imx8_dsp_runtime_suspend(struct snd_sof_dev *sdev)
+{
+	const struct sof_dsp_power_state target_dsp_state = {
+		.state = SOF_DSP_PM_D3,
+	};
+
+	imx8_suspend(sdev);
+
+	return snd_sof_dsp_set_power_state(sdev, &target_dsp_state);
+}
+
+static int imx8_dsp_suspend(struct snd_sof_dev *sdev, unsigned int target_state)
+{
+	const struct sof_dsp_power_state target_dsp_state = {
+		.state = target_state,
+	};
+
+	if (!pm_runtime_suspended(sdev->dev))
+		imx8_suspend(sdev);
+
+	return snd_sof_dsp_set_power_state(sdev, &target_dsp_state);
+}
+
+static int imx8_dsp_resume(struct snd_sof_dev *sdev)
+{
+	int ret;
+	const struct sof_dsp_power_state target_dsp_state = {
+		.state = SOF_DSP_PM_D0,
+	};
+
+	ret = imx8_resume(sdev);
+	if (ret < 0)
+		return ret;
+
+	if (pm_runtime_suspended(sdev->dev)) {
+		pm_runtime_disable(sdev->dev);
+		pm_runtime_set_active(sdev->dev);
+		pm_runtime_mark_last_busy(sdev->dev);
+		pm_runtime_enable(sdev->dev);
+		pm_runtime_idle(sdev->dev);
+	}
+
+	return snd_sof_dsp_set_power_state(sdev, &target_dsp_state);
+}
+
 static struct snd_soc_dai_driver imx8_dai[] = {
 {
 	.name = "esai0",
@@ -389,6 +477,14 @@ static struct snd_soc_dai_driver imx8_dai[] = {
 },
 };
 
+static int imx8_dsp_set_power_state(struct snd_sof_dev *sdev,
+				    const struct sof_dsp_power_state *target_state)
+{
+	sdev->dsp_power_state = *target_state;
+
+	return 0;
+}
+
 /* i.MX8 ops */
 struct snd_sof_dsp_ops sof_imx8_ops = {
 	/* probe and remove */
@@ -441,6 +537,15 @@ struct snd_sof_dsp_ops sof_imx8_ops = {
 			SNDRV_PCM_INFO_INTERLEAVED |
 			SNDRV_PCM_INFO_PAUSE |
 			SNDRV_PCM_INFO_NO_PERIOD_WAKEUP,
+
+	/* PM */
+	.runtime_suspend	= imx8_dsp_runtime_suspend,
+	.runtime_resume		= imx8_dsp_runtime_resume,
+
+	.suspend	= imx8_dsp_suspend,
+	.resume		= imx8_dsp_resume,
+
+	.set_power_state	= imx8_dsp_set_power_state,
 };
 EXPORT_SYMBOL(sof_imx8_ops);
 
@@ -490,6 +595,15 @@ struct snd_sof_dsp_ops sof_imx8x_ops = {
 	.drv = imx8_dai,
 	.num_drv = ARRAY_SIZE(imx8_dai),
 
+	/* PM */
+	.runtime_suspend	= imx8_dsp_runtime_suspend,
+	.runtime_resume		= imx8_dsp_runtime_resume,
+
+	.suspend	= imx8_dsp_suspend,
+	.resume		= imx8_dsp_resume,
+
+	.set_power_state	= imx8_dsp_set_power_state,
+
 	/* ALSA HW info flags */
 	.hw_info =	SNDRV_PCM_INFO_MMAP |
 			SNDRV_PCM_INFO_MMAP_VALID |
-- 
2.27.0

