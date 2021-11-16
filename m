Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B9873453658
	for <lists+alsa-devel@lfdr.de>; Tue, 16 Nov 2021 16:49:16 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DAA6E168A;
	Tue, 16 Nov 2021 16:48:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DAA6E168A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637077755;
	bh=gDXsePIINijFcRBl0JUvbKmwenpAxv3E2uwk50Gvf3E=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BiI2+h9vp5IVn1s6dPUqU1Bz2kOyXjTBDCdPQUxjxUtgpjFlrech4we1UWfPOL6Jg
	 zQLP/0zPlI8a51fozEHmdBNdps5jiSAJM9Mi8KU5A9vtOEkbMnmvV6u0t0Ux5M2M4y
	 c7mLxiRoGkwrhNAMaIgV2U1a5Zg3MHhssCk/SNG4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 008EAF804F3;
	Tue, 16 Nov 2021 16:46:50 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0ED90F804E7; Tue, 16 Nov 2021 16:46:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 MSGID_FROM_MTA_HEADER, SPF_HELO_NONE, SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60073.outbound.protection.outlook.com [40.107.6.73])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1852DF8026D
 for <alsa-devel@alsa-project.org>; Tue, 16 Nov 2021 16:46:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1852DF8026D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=NXP1.onmicrosoft.com
 header.i=@NXP1.onmicrosoft.com header.b="J4xcqoTf"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XcSw3anQNSQxXpPkt/RINmWOaULLaUPhpnXpAK2B5d3iCDFdClMA27dfDIwebZ+gpzadQdzMUi05yyQmofYqB4STpce94qo4luwJFxxbWamhGCiuEzqr+Kwdy6dANX2cnVQPvD45UvyOWylfEd+N7lLbARKIyTgV7y9o4Avv3RwQz3q8AZ3ybizLs2zsGyIJpeLtxELBIeicl9jHvSoSHrsbQtU7XTvgoikbyOaIDYNlyO0B5yv7+ynncY3KaghQ565Gmcpw18kF0PVNneTquwQAkjd1PllYw2Rnz9oSmT9wHpYWvjaAQG/voU1E8YS2aIP4l7WKZPnKFs204KgKxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cf3aF4hGrNpyw/4Xn2+HETnOhQMqs0Pa78OKvZGJSvs=;
 b=mf+aawfy52ygXsofuW537SVdz/4M2V/+2T52HzJpvo+SgVR2OwqVXQu0Q85HeFBu9RXszOcMTwnLhp/DDJBOLbftCkawmwsDuKOshqARfQmW034cU7PjBjjAmBYsDbBjVvoXczMkwrV2aqmFftlk7eEYc907POMZhwn6ymqbqBEqV4fgU/DXgLta92C2V8LNuAztm3Oakp86Elbos+jXJnPRMTcxUnhbqxKkhezoOdN6gBjJB0m6AH1bU6eb3IbkM0CLxDn9MVoYgOV00EkcLS3IVksEJXp6kLIF4G+bLAIAx0Ax9bErGCHrl8S02SytEJTVMX5lf7lKjQpoZuj78w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cf3aF4hGrNpyw/4Xn2+HETnOhQMqs0Pa78OKvZGJSvs=;
 b=J4xcqoTfRqCthmKjc2FPjkoXo0RVmxcT0h3e8nM28IBk00Ty7GCKDr4XxzuW8vs8cy5fzkwgQGADZ+TEOFbaJqbr8VNVgr0ZicSnS8VgccAx9H86DfKdvZaJngQ66BfXPkulhAMcyI8elQTzfMAqJNsiZrgBwlIhF5PmsldYhFM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from VI1PR04MB5151.eurprd04.prod.outlook.com (2603:10a6:803:61::28)
 by VI1PR0402MB3824.eurprd04.prod.outlook.com (2603:10a6:803:22::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.16; Tue, 16 Nov
 2021 15:46:34 +0000
Received: from VI1PR04MB5151.eurprd04.prod.outlook.com
 ([fe80::85af:f8be:aa99:ba5f]) by VI1PR04MB5151.eurprd04.prod.outlook.com
 ([fe80::85af:f8be:aa99:ba5f%3]) with mapi id 15.20.4690.027; Tue, 16 Nov 2021
 15:46:34 +0000
From: Daniel Baluta <daniel.baluta@oss.nxp.com>
To: broonie@kernel.org,
	alsa-devel@alsa-project.org
Subject: [PATCH 3/5] ASoC: SOF: imx8m: Add runtime PM / System PM support
Date: Tue, 16 Nov 2021 17:46:11 +0200
Message-Id: <20211116154613.57122-4-daniel.baluta@oss.nxp.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20211116154613.57122-1-daniel.baluta@oss.nxp.com>
References: <20211116154613.57122-1-daniel.baluta@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM0PR06CA0076.eurprd06.prod.outlook.com
 (2603:10a6:208:fa::17) To VI1PR04MB5151.eurprd04.prod.outlook.com
 (2603:10a6:803:61::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (2a02:2f08:5706:b700:1e69:ee6:2dad:c9e7)
 by AM0PR06CA0076.eurprd06.prod.outlook.com (2603:10a6:208:fa::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.16 via Frontend
 Transport; Tue, 16 Nov 2021 15:46:33 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 66ec6055-ac40-48c7-868f-08d9a9184468
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3824:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-Microsoft-Antispam-PRVS: <VI1PR0402MB38247430FCE8AA6477406019B8999@VI1PR0402MB3824.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: z80Ml5TjsYjrOWR9pLDdVGDNTZ3CQxnoc3po2ZxCM1Xg80RGJcALF2uVU7Csn01PuVNHtA51D6iTTzB7efisRLehj2/tAPYJzeXkr6orUEdEWA5u3ObJDM5hoHMJURGTCiHbuXcQLCqW09kjbQx5aMyQULcInl5YC0LQP6uDkpo+WeEFpCqyULnHIKkC7zuSySU71sLIVXuyKND9khj+RnvdQoPgm+MUTWVarZeLClEg7BOCZxDD4ngNCES9mhYKDylLGcwqRF0eK+VKwVqqTCwfdtumX5QAhjmc5EXcpG4w1XHpKTGdJY2DnYJjB384uWyzTNBV3VDL73gZsb2hF6fOBChAgMxqhUP04bX32JPiML03ODXffBOxUdlJqpaJvsmbVs0N7pZEGWjPPMAF3DpIeJK0Q93SZgJ0DT7vBhBvI3nnTw3evoarOLlOUEwc0XkorOFBmMkl9T8Cn485FCrU9XVSTA7jGgr7afbMI/SZ7f+RX5kQVUeOeTygckSqmpHEt4nJ0YuhSouARqH/Arne++plYylCdvwC4ixHJYal3XOixx3ydspFomIFDft0menAe7l/3ubiVnsrgSVwcl4TGaltI+FfSHQaINPfdpt2GuZqhunKK6Oh1zQ+iSOMmt0LsNFFEj+s79kenX1r0ba2xYjvnbMAx5NjizoXymTlexzFSzJRPS4RceB69kdBML7kzRTNfewkwSPv0XoBFg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB5151.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(6486002)(186003)(5660300002)(1076003)(8936002)(38100700002)(66946007)(66556008)(66476007)(7416002)(86362001)(44832011)(6506007)(316002)(2906002)(83380400001)(6512007)(6666004)(4326008)(508600001)(8676002)(2616005)(52116002)(32563001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?FMVREtEtNmTAzP9qZ/POTzg4HKpefBhaVum5AGtz7CU00ey/yf2yz5+sXoBZ?=
 =?us-ascii?Q?j3qtMpMep8BjGc9eRsf/+s8sRCbXsh/zmzX8duUilOh+lQJN9HchMSS09/n6?=
 =?us-ascii?Q?25nXFj6pDFeM7wtr2QeGF5pvnZVXai0t9f911RvqaL3RZ+vPBcnNtWcJen6k?=
 =?us-ascii?Q?nqgzzpTe1dUi6Aw0voUDTwH7b698F4AAd6C2Jg7cVc6pAeYp+VW4ZBh3NhDU?=
 =?us-ascii?Q?mSXtAe1HZnxSFncJVrVcRjImD3HFH8dQiTk1DkDY9x2AR0TnczsQDqDrVWN7?=
 =?us-ascii?Q?0m/y0gYfEJBFOlfuXrs08b/6bvG4zKzKqlO9U794gEEI07YFd9hn/FK8wq+u?=
 =?us-ascii?Q?osayppqjjwQbKOFlv4PIERUFuQZ9FCoZi/TmZ8dgAqAKijm7nW9w0jNexJgx?=
 =?us-ascii?Q?ecpmpWYGDlINhp0lb4qzn45J2VEpH5o/wjtf316Vbl+yD0VCj5UU7/UIrX9N?=
 =?us-ascii?Q?+nfywpDyGvyh27dL5xv4LxQo5Zd/wIO4b7tWx74oUAln9hNgJYn98AjCHCYm?=
 =?us-ascii?Q?SpCIbHAPiZIq044wYuAf0e/4KDcGtLlJN5bgyBF6eTFPRDa94u7OZrFCXnFj?=
 =?us-ascii?Q?qZ9Sua2GiLmjGIs8WLH9VCHS1aIPKYn1A92oBHd+m/Z+BWwEAYw2jRxOwFtw?=
 =?us-ascii?Q?+Hsmr8gtzkJUeUARa4JnJx/AWk63yDYipM+R8nM/1ZOnGTA6FpsuFMoG+z/6?=
 =?us-ascii?Q?63cXFbqjTzD+1UveoG1tmCZVUkKVgObaFeH+voORBssPkq9qmdk6dfHyDvev?=
 =?us-ascii?Q?l5CVLSNWheqrJkIueHIZyiIBUAKnoYVhTrpQOG091eLnJGedhWHSLOZ190uC?=
 =?us-ascii?Q?Q/kKb13b1ng/9wOV8c8VtGHyj5mb9+XYuq85H52PFIKBSF+4cltnpQcnqXTg?=
 =?us-ascii?Q?6VlvuJu73/SYg9Q6c6lZ0p3n96VJGK9/GkcezvnUPkshYfVTie9xRKM5kZ0M?=
 =?us-ascii?Q?ileZwFjnvV/3YK4cMVPKTmI58CY08R9C0V/ULrBnnxoakEPUo9s+SA64Mj3u?=
 =?us-ascii?Q?E4MmTgMD9NBga/kvnFmQujGDZrb2p8Fxa+mqTJ2z/simE/KS3F+t4z73nvKR?=
 =?us-ascii?Q?VqbDN15Kz4JEQ2Z1EeGSkufTyyTnsk5js+2NRqxhY5DKinhjf9J84YjktSsQ?=
 =?us-ascii?Q?dUHwZMMVMj/p0Mpx8qcx9tcGXUWKVvHzzJQSAfS8K5LiK1lQUG6B/2AE/TCw?=
 =?us-ascii?Q?SVa5rLEvHHVDSQJf7+XaWMbAJ8Hn5/ZIDEJzucZyAahi6nHDZwEUUsVpxMq/?=
 =?us-ascii?Q?UPLVylpGOurtnS77Wp37sH1juLzUOC2TDvPj6G/xnvRW/Pipv1hN7L/eVC8J?=
 =?us-ascii?Q?JqLLjUhzAKg5a1JdIxMRGQhw2FN1J7YMV727gxVRODuYSKXGtFjm1o3FXLQU?=
 =?us-ascii?Q?6i8eDraVUlAXY/9+n9CmUd3U+LwnN/fjoz6W2G0i0ypbzhVsjVdKaFRxihju?=
 =?us-ascii?Q?uumNwaDBiVRXsdjqpbguuMUz5IaJgRzvYvNvHJdBdcDs2AaZvwsD2Six0qQ2?=
 =?us-ascii?Q?wrG41UASteRip/rrNURtdkWY/T6BQWaeFuc36A6xSyLTOHgPW/54PjJQRbfZ?=
 =?us-ascii?Q?+TJS5G0JDmf4YT0XeMxi2jgN3ktsQbPuQTnL+jecen3hKwR2HGFH/QFj2+gG?=
 =?us-ascii?Q?a3TTZJkw0mLYGtgvautH6gkc5W8/G+ikir/pKnONz1IXEgfW15DfAABrFulT?=
 =?us-ascii?Q?0RcTnJiCfy/pMdC7HWSAfPiJVvg=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 66ec6055-ac40-48c7-868f-08d9a9184468
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5151.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2021 15:46:34.3534 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HrR96o/yDycpv/nucS8cR6zFyZn0cOYH8bbkNnMCr6t8JtrgSmSJjupFbLYl1EWbkWDaJbnaHQmATeEiMpp2kQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3824
Cc: Daniel Baluta <daniel.baluta@nxp.com>,
 guennadi.liakhovetski@linux.intel.com, daniel.baluta@gmail.com,
 kai.vehmanen@linux.intel.com, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, ranjani.sridharan@linux.intel.com,
 pierre-louis.bossart@linux.intel.com, linux-imx@nxp.com,
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

From: Daniel Baluta <daniel.baluta@nxp.com>

We make use of common imx8m_suspend / imx8m_resume functions
for both system PM and runtime PM.

imx8m_suspend:
	- frees the MU channels
	- disables the clocks

imx8m_resume
	- enables the clocks
	- requests the MU channels

On i.MX8MP there is no dedicated functionality to put the DSP in reset.
The only way of doing this is to POWER DOWN the Audiomix domain.

We are able to do this because turning off the clocks and freeing the
channels makes the Audiomix to have no users thus PM kernel core turns
it down.

SOF core will not call system PM suspend handler if the DSP is already
down, but at resume it will call the system PM resume. So, we need to
keep track of the state via snd_sof_dsp_set_power_state

Few insights on how SOF core handles the PM:
 - SOF core uses PM runtime autosuspend (with a timeout of 2 secs)
 - at probe, SOF core boots the DSP and lets the PM runtime suspend to
   turn it off, if there is no activity
 - when someone opens the ALSA sound card (aplay/arecord, etc) ALSA core
   calls PM runtime resume to turn on the DSP
 - when the ALSA sound card is closed SOF core make use of PM subsystem
  to call PM runtime suspend and thus turning off the DSP.

Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/imx/imx8m.c | 106 +++++++++++++++++++++++++++++++++++++-
 1 file changed, 105 insertions(+), 1 deletion(-)

diff --git a/sound/soc/sof/imx/imx8m.c b/sound/soc/sof/imx/imx8m.c
index ab40c0bdf796..b050d4cf9cd5 100644
--- a/sound/soc/sof/imx/imx8m.c
+++ b/sound/soc/sof/imx/imx8m.c
@@ -195,7 +195,9 @@ static int imx8m_probe(struct snd_sof_dev *sdev)
 	if (ret < 0)
 		goto exit_pdev_unregister;
 
-	imx8_enable_clocks(sdev, priv->clks);
+	ret = imx8_enable_clocks(sdev, priv->clks);
+	if (ret < 0)
+		goto exit_pdev_unregister;
 
 	return 0;
 
@@ -252,6 +254,100 @@ static struct snd_soc_dai_driver imx8m_dai[] = {
 },
 };
 
+static int imx8m_dsp_set_power_state(struct snd_sof_dev *sdev,
+				     const struct sof_dsp_power_state *target_state)
+{
+	sdev->dsp_power_state = *target_state;
+
+	return 0;
+}
+
+static int imx8m_resume(struct snd_sof_dev *sdev)
+{
+	struct imx8m_priv *priv = (struct imx8m_priv *)sdev->pdata->hw_pdata;
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
+static void imx8m_suspend(struct snd_sof_dev *sdev)
+{
+	struct imx8m_priv *priv = (struct imx8m_priv *)sdev->pdata->hw_pdata;
+	int i;
+
+	for (i = 0; i < DSP_MU_CHAN_NUM; i++)
+		imx_dsp_free_channel(priv->dsp_ipc, i);
+
+	imx8_disable_clocks(sdev, priv->clks);
+}
+
+static int imx8m_dsp_runtime_resume(struct snd_sof_dev *sdev)
+{
+	int ret;
+	const struct sof_dsp_power_state target_dsp_state = {
+		.state = SOF_DSP_PM_D0,
+	};
+
+	ret = imx8m_resume(sdev);
+	if (ret < 0)
+		return ret;
+
+	return snd_sof_dsp_set_power_state(sdev, &target_dsp_state);
+}
+
+static int imx8m_dsp_runtime_suspend(struct snd_sof_dev *sdev)
+{
+	const struct sof_dsp_power_state target_dsp_state = {
+		.state = SOF_DSP_PM_D3,
+	};
+
+	imx8m_suspend(sdev);
+
+	return snd_sof_dsp_set_power_state(sdev, &target_dsp_state);
+}
+
+static int imx8m_dsp_resume(struct snd_sof_dev *sdev)
+{
+	int ret;
+	const struct sof_dsp_power_state target_dsp_state = {
+		.state = SOF_DSP_PM_D0,
+	};
+
+	ret = imx8m_resume(sdev);
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
+static int imx8m_dsp_suspend(struct snd_sof_dev *sdev, unsigned int target_state)
+{
+	const struct sof_dsp_power_state target_dsp_state = {
+		.state = target_state,
+	};
+
+	if (!pm_runtime_suspended(sdev->dev))
+		imx8m_suspend(sdev);
+
+	return snd_sof_dsp_set_power_state(sdev, &target_dsp_state);
+}
+
 /* i.MX8 ops */
 struct snd_sof_dsp_ops sof_imx8m_ops = {
 	/* probe and remove */
@@ -297,6 +393,14 @@ struct snd_sof_dsp_ops sof_imx8m_ops = {
 	.drv = imx8m_dai,
 	.num_drv = ARRAY_SIZE(imx8m_dai),
 
+	.suspend	= imx8m_dsp_suspend,
+	.resume		= imx8m_dsp_resume,
+
+	.runtime_suspend = imx8m_dsp_runtime_suspend,
+	.runtime_resume = imx8m_dsp_runtime_resume,
+
+	.set_power_state = imx8m_dsp_set_power_state,
+
 	.hw_info = SNDRV_PCM_INFO_MMAP |
 		SNDRV_PCM_INFO_MMAP_VALID |
 		SNDRV_PCM_INFO_INTERLEAVED |
-- 
2.27.0

