Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CE4E456CAF
	for <lists+alsa-devel@lfdr.de>; Fri, 19 Nov 2021 10:46:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3CAED17B6;
	Fri, 19 Nov 2021 10:45:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3CAED17B6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637315163;
	bh=gDXsePIINijFcRBl0JUvbKmwenpAxv3E2uwk50Gvf3E=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Y4Xw0AgfjljhXX0nTUdIBCFRx4tjWS5FHUDGqBh/msCaoZv6QrPkj2vI1dZ8EsXrC
	 saBgC+/InGhEvw/k1p1gKuIu/+XTMsxEmJiFQdcwicJbEEVEL8jIA2nOpo70BLxCb7
	 AIleIsu2gL/lhQ3caag9BR45J8tMrQD4LmzxiYyM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 01EF1F80507;
	Fri, 19 Nov 2021 10:43:51 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 55D3EF804FE; Fri, 19 Nov 2021 10:43:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 MSGID_FROM_MTA_HEADER, SPF_HELO_NONE, SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2049.outbound.protection.outlook.com [40.107.20.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D5BA9F80272
 for <alsa-devel@alsa-project.org>; Fri, 19 Nov 2021 10:43:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D5BA9F80272
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=NXP1.onmicrosoft.com
 header.i=@NXP1.onmicrosoft.com header.b="JVw7f5Rb"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=alDLA4eBCCIbRv7zmBLtlChaVcV/rZsBss5biwlbSuwC9x8Kf5tDjY5DWoqM8c5xrysVj65K6bcGSdtLtjU+VFnDe0Sb0sUtzTVuzyrEQNWdSsqIYL5pN40+BAo+xFnJMvlz2CyiM8Qu7zxCDodAd28uG/gVj9Hnc/IlKcU8y1xRzNxJr5/2ynAI6GrZ18pXPOeobaBoJ7lHN4pmeULTshg3juFPmtRh0gp4CJJyrdPRKP5vP5BecUUXKqRc/SQlaqJsccfBxLb3oRBUzaH3cb0YPpsLW31DXqOyD96c2ozC8p1nX8ZmaHETOYW7V11gUef7gk6DkpryLieSqD7Vow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cf3aF4hGrNpyw/4Xn2+HETnOhQMqs0Pa78OKvZGJSvs=;
 b=Sy89tj39m4oHqg60eKsDrfQ1eYBrV7CX//guMX4Fu68xaPrbDMcPTY/EkXYMX8F/ndd7on9kcjJs/yuLfS1Frm2wWfeS1+ty3hIngkr284JVcdib1HCIPVg2YmvOjSYxuPp4Kwn9laHFZ5sRJM+tbXCxcHLZRopqV1Xj/yKhHG3dzYbJ14x6UsnpwW5GVvux0xmWay7k1sYjXw40YgOmOubC7BTsFk2yoUXs6c5IVYXl6oRL78gZeKq1i6QdmzZlXZph9/n8S3+zWq/pIYwJe9LAaJtTCS9hjT+qo0zaAXuSaYbBeQzIupIm3dNxn066Te8wsJIpf3crqxo6oseKUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cf3aF4hGrNpyw/4Xn2+HETnOhQMqs0Pa78OKvZGJSvs=;
 b=JVw7f5RbNocRsBhQxhn02zhkyfn6BVBqqEThXs9P1ER2h78vuEHHvMmNEHnF6VzKunpKW0hFDjef7H8XshpfFnkLlEogAI5WjwOVV1Vnws7/NvNgvD1ZTiwfstG+jmDut9cCc8RdN9WiZJdJ4rz0f55WPklz4F8u6d7EEt+KteA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from VI1PR04MB5151.eurprd04.prod.outlook.com (2603:10a6:803:61::28)
 by VE1PR04MB7358.eurprd04.prod.outlook.com (2603:10a6:800:1a5::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.15; Fri, 19 Nov
 2021 09:43:35 +0000
Received: from VI1PR04MB5151.eurprd04.prod.outlook.com
 ([fe80::85af:f8be:aa99:ba5f]) by VI1PR04MB5151.eurprd04.prod.outlook.com
 ([fe80::85af:f8be:aa99:ba5f%3]) with mapi id 15.20.4690.029; Fri, 19 Nov 2021
 09:43:35 +0000
From: Daniel Baluta <daniel.baluta@oss.nxp.com>
To: broonie@kernel.org,
	alsa-devel@alsa-project.org
Subject: [PATCH v2 3/5] ASoC: SOF: imx8m: Add runtime PM / System PM support
Date: Fri, 19 Nov 2021 11:43:17 +0200
Message-Id: <20211119094319.81674-4-daniel.baluta@oss.nxp.com>
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
 Transport; Fri, 19 Nov 2021 09:43:33 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0f1c8685-97a9-4d4e-8137-08d9ab410e0f
X-MS-TrafficTypeDiagnostic: VE1PR04MB7358:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-Microsoft-Antispam-PRVS: <VE1PR04MB735822A8A27E1ABAADA6ABF6B89C9@VE1PR04MB7358.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Npfom/nbKll3QlXapo7iEVBHNdTUfDbFieHaH5Ztr5i+dsGXRUcEKvKlU0t5+I3ZdFbicZbfrRkIWh+MZmxbMtw+k9trcRswMivKk5Kdo9Kz0uAdKx+zo6KKCQliCiWNeQn93T7z5XFY3c4vaI13iFPdh849mUyIyetQSylD74Gzi3B0WOabP4H70t1TkdUWegB0eDDwm4p/0tNFXfKCmreQNQ1Ukqw2U4u56IwMLy5v+4alX82fgpJsewiuM1KX8OCzxrHXnXxAyW+TM4/wuV1wV/gnuui+Y1XTxXK0WR+grP0Fz7M7JR6945hAuFmfqHKl6HQroe0HaN1PU7/Z10WPBamh/dk+j9d5+66lhR/3ZZzzJbqDkyPh3mr86YC9v2P/fwbBF658LOzCdQfD0gkd0xthml1dfZnF60gVfcNmfJdfepistTW4OHj1g7/hC+r3/iourkiSg0uX7wfv9wcgms6p4O5X6qhDybQ7dMGgMyjdIESwbeceNOY7nXlRCxdsqJ8rqZtZfI+s7TmSO3ML4E3y1k9DIugpUFUGyYwSR7nleNgTsd2JIHOU8QjxT70g1x5gVF7vwQHIxJMwFwX1al5t6gCLDqDjQYJ8wJ20AIQTZS0xg0MxHIfEbwcX/jbhdKHu2n6x+b3j8ieR2VuI6hxHBJhA6DRVG7fd4MAHS/02OK8ptmZ70HffOEIOxeRRrF97FXvuWXEu8ZUjCQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB5151.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(2906002)(66556008)(52116002)(186003)(6506007)(6512007)(44832011)(2616005)(8936002)(508600001)(66476007)(66946007)(1076003)(5660300002)(83380400001)(38100700002)(6666004)(4326008)(6486002)(316002)(8676002)(86362001)(32563001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?yWWdE9R+sJfEWZBhfUODMwPGXDio5JHOtxZdOmEKGGGJC2qKkWXMd8Zy/+oN?=
 =?us-ascii?Q?2J09BF5k8RzHQwhX8CPP6Tbvf2zjJL7QTLhmZmjHPZ7puE1+owuV8HgLyt3l?=
 =?us-ascii?Q?wjw1wl8duhapAP0m0lwozMR87tMlkZJ21UQ5BO9vjTrT2Y2ypguNsH5adeN6?=
 =?us-ascii?Q?RPbH4zYXmxq1trS5e2fkpJvxHZt/Pf0nMuqHumRCASpbxaGIH+5sfYkJhlXo?=
 =?us-ascii?Q?QYToKNW68mcyR65xQ5Li/dWvKw/3bC9N79p0rHBGoZOMzoBN1F9trqYc8+ie?=
 =?us-ascii?Q?f1nqvcI8VV/xlBjmbisNH1nfBm0iYlfnCgnYtM5uTbk4AMb+opI+iG50VQ4o?=
 =?us-ascii?Q?D1cNcm9XPwuL58Rgngd1+rCHLQ3rlce2dsRKMtCenDaPfiXpG+HuJoNJtyjz?=
 =?us-ascii?Q?z2f/cN1Gu0wVvzcU/KfNeqq6lYbudQGnxQ7bdbAnesd7wC6LEVlnchTUmuZM?=
 =?us-ascii?Q?XLKkPUpMp9GpsfUua/Pz/+mhwBoxh0Y60IG5k19rn5+0M1bQ7ds94NscApC1?=
 =?us-ascii?Q?RFhyTAyZ3Fya69x28xi6ZL9HU9XCfip98y+u4A+gmhQ30URtQTlety1Lk2dJ?=
 =?us-ascii?Q?WKZMW6qzyfzcoW4kTtOw1BywOGM6/2MkeOncRy+joT5DukhTyNSbO0GosPbV?=
 =?us-ascii?Q?fHQgaCk+FxB1jnpY4+eq0nSc6L+x6J2TtWb9tqai6LSx6eKMcFRy9VgJZMXB?=
 =?us-ascii?Q?Ka4ffStt8MeZXcpUjkdLbMTFgFoF4xmUTuvHZ41swq96Q5vclj+Fd6r8MhE1?=
 =?us-ascii?Q?aJF8mgiEPMSl4ySgDIqttoBT+lKguPzC1u1AsnqT7QLZaMNinA6M040fqEFU?=
 =?us-ascii?Q?drWrr39a5BADhwnsKqHh9HWknpiApqVFz0FQJwrcTH8MfOX1KZy199vtxtSO?=
 =?us-ascii?Q?yIJfq0ELDdfOg+j4AEWYtbVjVjYDRp7zWkW87/Sdezc9vqSF+MwkPEIVzPOH?=
 =?us-ascii?Q?VMe0GwiF5WuW+AUyUsQL+nBaolSUnrz2K7ejVO6mIAbmOWpVhh7QMfAxu+N2?=
 =?us-ascii?Q?tbQizJ37zAIrG+393LYrFGxjsPzkQrn5XNGpH9jN0tvLsrbVQcDHaCkiXtYP?=
 =?us-ascii?Q?rtkI2DUIhZLZALPTva6jTFOB6YYuIF+lqopEf5GBf5ecZFFLXsA0mPKE/zVZ?=
 =?us-ascii?Q?H+65r4Bd45KBr1bJPBVbYuj08KLA8YWPYccIlWX/8Sn2BgXgq4wnnXwpLa+U?=
 =?us-ascii?Q?gitMAjFS8N3rENEpdGdhfDuWJwtdOUUWDspLgbrAK/RLpeV8r43nrjo9ELOx?=
 =?us-ascii?Q?wLdSU19VXVhexndnjvOsINFDB0y24v+x1TfpZKn3uK2PU90oWPOMjikvzgb4?=
 =?us-ascii?Q?fjHyx/Zqwh1xmMK2B+jxghHmQHlHTBuk543muav5R5TS022H524Q/vAWSthp?=
 =?us-ascii?Q?+lA3j7WEMUlBR3ZA5mg3uJVZyqjuBEBaLvxyx69bfXbrLuS3RU1nrXn9Sdii?=
 =?us-ascii?Q?MSMgQkf7UIBCYmUd5GOz40Nu4SucKovJYhBodAUi/eyZk7YkAVoGdeM/fNHR?=
 =?us-ascii?Q?PHyFQZFYU3cc14XPKbe3Jy/3Sib4l8KFozt2NS2GyoOvoF9p/paH+RfL8QxG?=
 =?us-ascii?Q?jJhBZc0bD5g93xBL8dPvCLdUiv+FJHzz9ukw7wK++ogJSkzPXS36B+ClJLlN?=
 =?us-ascii?Q?XeXIdnXewBog0oCrTQEfOl1cC2xCCvKtoKzb93zhJsB7QAf4wWIiRaz9a/NP?=
 =?us-ascii?Q?oQJ7P4XLFLH5Xi6t6LtbDYkH9bd8tKhP3F3KIK/PG+OM/YjS?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f1c8685-97a9-4d4e-8137-08d9ab410e0f
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5151.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2021 09:43:34.8555 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ld6uO2JP+/phq/xGMSshPOw/t0XcShfUN2NphcEMDvM0DGn9AZXbXPVtT4vSJybk4ra6pHODSAE+D67fk5u+AQ==
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

