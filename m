Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BA9DA3CA08E
	for <lists+alsa-devel@lfdr.de>; Thu, 15 Jul 2021 16:20:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 30AE71693;
	Thu, 15 Jul 2021 16:19:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 30AE71693
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626358849;
	bh=Sz2rTqYNfmldNP+wRePHTzuwPTlStK4uI3iwAPuR+2w=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fVCnXbEwCOaP0CLVZbFauycUC3gDKrkStZE0gblSJ0xLdBfGigSb4FyStM8en9ylx
	 DCoogaVWgpiv2XOr2jU5xbLDphNEvpgGD53oAIeBZuxxChgKJrBbtC81jSPs5BmGzj
	 kvyAd5J75vherjFnKkflR6UbuzGCdp6VuODQ1RUU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B1E1FF804E0;
	Thu, 15 Jul 2021 16:18:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ECD35F804E0; Thu, 15 Jul 2021 16:18:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 MSGID_FROM_MTA_HEADER, SPF_HELO_NONE, SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2050.outbound.protection.outlook.com [40.107.20.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F0F35F8013C
 for <alsa-devel@alsa-project.org>; Thu, 15 Jul 2021 16:18:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F0F35F8013C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=NXP1.onmicrosoft.com
 header.i=@NXP1.onmicrosoft.com header.b="GqFMAHPp"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JWtnlN8Bho8eayiuV8dFjfMwygACz+RzzSEbC3VZHagHu9EnkUZoS6wGEKAKj108LFO8XRLSt0wcixtoUdJGZY0cdiyo/rJhm4jqaKh301ZQup0ZFKeKtZsqOEL9e/FFKVLPiQrU8namZu0N061zc5UGCQ3417Ocg7uEkhUcGT2qafB8ZTznghYsn602Y6/rv/JfiwMoDsDF/Obx+TA0xhNG9uYUcQk1x2lqrJFPBGWgFqUgdZInTDC8kT9n9eZ8sy60WZn5yt2pKlunbNEov64xvTIIGLfHBYdC2HpAES9nMNG4uFpql5SEFavhsHLo9uJ/y7r7jKB0zfOHM+ekmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=odbGdYbxHjSAK3R5MowOr11nHN07ijMrAcuXq0bH9Lg=;
 b=bs/3LsRCeawLXpW9ZBbh7Jmk4II66u47rYvRAp1eseuhPjW2Z7wqxdMqeda1nUTGGpOb/B9+V2vmLFguisy5dvAHy54s4/99hBMTmGT62ebLQUBz+nouhx/nuZcwbXDGa6VWEjWWBeCkHfz2rBwTveaCARnus/VDWVub/jIt/O9wEeQJVjRiImDMMo1huCkxQs4VETvgNGHAYYhI+nHm2Wz0JO1++FoM7GJp6PpocpU6wUimxNDpThcU+xSaaE9M4kAaMKpVE0Js2VdOrUP5iGxJ8DYRGqCXr/iMk0kEyGJkV2Ap8g+Ijk1ojM0eSl9Ho1pkpfnrKPLK8zTYEGAOpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=odbGdYbxHjSAK3R5MowOr11nHN07ijMrAcuXq0bH9Lg=;
 b=GqFMAHPppsY6VyvuoNg7clPcwEX8/ykOTctN3TdJoifLe9oyulud1osvgkpaqw2SXYLOJQDItbq1uiCZY6tBbXvLHT5oGUYXXDICxD9dO7UPyCntdfUqUSSx0Qymiox4JZ46f++9QxFtEDn9P9+B0Uw4fQt72z1MLyj0zxmDdkY=
Authentication-Results: alsa-project.org; dkim=none (message not signed)
 header.d=none;alsa-project.org; dmarc=none action=none
 header.from=oss.nxp.com;
Received: from AM0PR04MB5140.eurprd04.prod.outlook.com (2603:10a6:208:ca::21)
 by AM0PR04MB6835.eurprd04.prod.outlook.com (2603:10a6:208:180::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.26; Thu, 15 Jul
 2021 14:18:37 +0000
Received: from AM0PR04MB5140.eurprd04.prod.outlook.com
 ([fe80::1105:2d9f:b790:4ec3]) by AM0PR04MB5140.eurprd04.prod.outlook.com
 ([fe80::1105:2d9f:b790:4ec3%6]) with mapi id 15.20.4331.023; Thu, 15 Jul 2021
 14:18:37 +0000
From: Daniel Baluta <daniel.baluta@oss.nxp.com>
To: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 broonie@kernel.org, robh+dt@kernel.org, devicetree@vger.kernel.org
Subject: [PATCH 1/3] ASoC: SOF: Parse fw/tplg filename from DT
Date: Thu, 15 Jul 2021 17:18:00 +0300
Message-Id: <20210715141802.880911-2-daniel.baluta@oss.nxp.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210715141802.880911-1-daniel.baluta@oss.nxp.com>
References: <20210715141802.880911-1-daniel.baluta@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VI1P195CA0085.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:802:59::38) To AM0PR04MB5140.eurprd04.prod.outlook.com
 (2603:10a6:208:ca::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (2a02:2f08:5503:9f00:58f1:af0b:2fd9:e70)
 by VI1P195CA0085.EURP195.PROD.OUTLOOK.COM (2603:10a6:802:59::38) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21 via Frontend
 Transport; Thu, 15 Jul 2021 14:18:36 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: da6da1a0-91f1-459c-005e-08d9479b6fda
X-MS-TrafficTypeDiagnostic: AM0PR04MB6835:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM0PR04MB68354E47C84EF39D3188CAA2B8129@AM0PR04MB6835.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cSbtLhxGcfkkIekgx3os8j0B3hAKDlWGARXFXqT5lAb5ltTGJeC3wh4EITS7qvOkSnbxZCjlHSthe7cUlltFQpAnlKsFcz+31+JrweQi+5AnZAZw1pPV2un2ufdV6KZhpg0LMB2dgnmxZadyj7DuJJ5yCmfoJZIoksKWxzrJwMM3MhmMptTpZetWBu7FwDE7c7mzd+UJvYzx8EKjCNfaGtUmY5j9Z+k+Gr/UMloTwOGujfCvdaS9M7+zjcWTNfKPC4D0JKItvJycO2vvq6MOw2v+Rt2blMz6GbUSaN1H1xcGR6DQNHEiIUD/VazCxGgloY8NXiJnc+C+OOihyZLiCv/202fLipFC1/vaoY6YlwGyYUzdvzhq2R+CX76QHwRTUWc4h8uvLXybC8hKBQ87zgxh51wA6XnNsDLSN3Mvr9zN8hRBeLd/jyVgBbJ75gSofXiZs1Azo9n4VRdV2Z/T5YOneoRzliXucft4A04Q3L3hnBABnEvAQz5QEGZNA9BdlCuDDyKD/HtuTKpNjGIq7Imd/kkJUUA+4Iyyo2Gt/IbjpISemn68iqpKkH6JXGWS2aGb0lwmzeV8mEf/vo2f3KXWDr7/aRjVZDogwUTlDc+gGkcUt05vkTu/TgruzTf2UXPTaHUywqa2+5R/Y9Kb8g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM0PR04MB5140.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(136003)(346002)(39860400002)(396003)(376002)(52116002)(4326008)(66556008)(44832011)(66946007)(8936002)(2616005)(6512007)(6486002)(86362001)(8676002)(7416002)(66476007)(316002)(5660300002)(6506007)(186003)(478600001)(83380400001)(6666004)(1076003)(38100700002)(2906002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?dPTeJ8BuOP5DVZfwbi1SvR7ASd8pSw4BYlnnJ4ukXsaHoVktJ+FoOf3XGAC+?=
 =?us-ascii?Q?hJntOI7gEXRdoItWnRVTmBrzmAPS4lPXw3yWMafhNSe/XIcznXhevPROfZGY?=
 =?us-ascii?Q?Lb9n8ioRh8FRHgIgL7KILD3NbVCRBKCV0CNH9TbhU6zC9toB4qVr/8j2evE9?=
 =?us-ascii?Q?Ds5vP3reIULmCVssxwU9je9GbufUNmtIM3xvAlGjNddHuruHRSe+m+mKI6Wq?=
 =?us-ascii?Q?rBgPQOlaifT1zO5MolKUWsRpgbU6m1KTpaAdW5dYrgNET7BPRyPpVjJQdpMT?=
 =?us-ascii?Q?52NVRCjJnLHIQMTV0hKGlbSww7ap/9xW0B2XMjV15ZnsmPENMXnAwJYmxqAw?=
 =?us-ascii?Q?c6wbtbgHeLLQnbZaBA2atbJsRB6SdytnQf1onv6LI2S9SOzQRSYVWtIUIwmB?=
 =?us-ascii?Q?Uheh0CxLasghX1P17rX8Q/Le11Gt7GZxcUexEZS/Rk89GrlyouovJeatoHZg?=
 =?us-ascii?Q?AbFFayaSypt0k6Ie+vSguWKCTuwhsu8bxeQVV+Yz4l8LOOIm0Vzd8uCRhNaK?=
 =?us-ascii?Q?af8xtpaMOerw6mD7Agi3mnoB6R2c6C4mKIITXfSn5xQ+Nglk8Vf6fpDKnIHX?=
 =?us-ascii?Q?D9AhJ9ffQFXrIeq8M54BS1IFbKeIqBKmU0jZvmaZeq5PPD6SAoF02D1seUy7?=
 =?us-ascii?Q?rtDqK1dOGWXacC2i0uIIzDWiwfpBrv08fIDhmdokzX835gB8Ge7DmQoum+H3?=
 =?us-ascii?Q?ItWivPFyuAZttyLqs9Ovx6NMdXVaJJtvubxfYfPtXCah6ivWbe/gVypmIf8x?=
 =?us-ascii?Q?dNoYJYFmmaG8Ri0kbt6UURk4oZI1eU0m5FQyu+lzefkXsIeNrJvPDKv/gu2+?=
 =?us-ascii?Q?pFz9ZpGrc8LJWskzk3yR5B/V4XL3O+m56BgUz2aKNJLWc+QSAU+ptAyfyi48?=
 =?us-ascii?Q?ajjK9jIQvei7paK/CLQQ9QwpZC++WwJRG4qw82kquJrtsxvQUMlFt6JcWlxl?=
 =?us-ascii?Q?224cZ9AJq8Uq4sJsdLyv3Jw4UZJiGZ/iEMA+m2+F8jxZnHPwD2vycYsXv+3I?=
 =?us-ascii?Q?L3fOQ38gFhlaUfHmUZIPOy5CMZnjPNH+Q/JmcFzE6piFLew7a5U2z9i0egYj?=
 =?us-ascii?Q?uCMXz9FnbU9x0rat0D06fgR+AgbbAmg8n3E70iDIyG6HyuFLRUkL/m+RhlbS?=
 =?us-ascii?Q?4sFvWuIkh/xTTdcnb5wW2Bpu71IQFstWPSzV6l2M669iOuNFJRivO+4rJjSq?=
 =?us-ascii?Q?GvJcEGLTSoT5828Ddmz883Yy56C9eFkk9OeD9ANSwWmOQYgWkrPS6MsboLMN?=
 =?us-ascii?Q?FUBDVqc/roXa02SSSmWOpFnTF39a8PRLEGN5G66zx9+Y4y/OvhoyKwLqtn4V?=
 =?us-ascii?Q?ANgwA2XkrG9twXW1TsFx7vH1My1kJZsZ3qkhGUK3HdOrWWZBKm20tShObb0C?=
 =?us-ascii?Q?XZMTHbHAhreOFcfMSdwKGRpxsosa?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: da6da1a0-91f1-459c-005e-08d9479b6fda
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB5140.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2021 14:18:37.3465 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rCKsafeBExdCtXcVH7y9qzXbJ56/26/L66HqEhxoA4AQ+d8/5SwCq8o2OdAZXf/upnkuuZorHKvb1sl0jJeZTw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6835
Cc: daniel.baluta@gmail.com, kai.vehmanen@linux.intel.com, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, tiwai@suse.com,
 ranjani.sridharan@linux.intel.com, Daniel Baluta <daniel.baluta@nxp.com>
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

Introduce two DT properties in dsp node:
	* fw-filename, optional property giving the firmware filename
	(if this is missing fw filename is read from board description)
	* tplg-filename, mandatory giving the topology filename.

Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
---
 sound/soc/sof/sof-of-dev.c | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/sound/soc/sof/sof-of-dev.c b/sound/soc/sof/sof-of-dev.c
index d1a21edfa05d..770935191823 100644
--- a/sound/soc/sof/sof-of-dev.c
+++ b/sound/soc/sof/sof-of-dev.c
@@ -65,11 +65,28 @@ static void sof_of_probe_complete(struct device *dev)
 	pm_runtime_put_autosuspend(dev);
 }
 
+int sof_of_parse(struct platform_device *pdev)
+{
+	struct snd_sof_pdata *sof_pdata = platform_get_drvdata(pdev);
+	struct device_node *np = pdev->dev.of_node;
+	int ret;
+
+	/* firmware-name is optional in DT */
+	of_property_read_string(np, "firmware-name", &sof_pdata->fw_filename);
+
+	ret = of_property_read_string(np, "tplg-name", &sof_pdata->tplg_filename);
+	if (ret < 0)
+		return ret;
+
+	return 0;
+}
+
 static int sof_of_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	const struct sof_dev_desc *desc;
 	struct snd_sof_pdata *sof_pdata;
+	int ret;
 
 	dev_info(&pdev->dev, "DT DSP detected");
 
@@ -77,6 +94,8 @@ static int sof_of_probe(struct platform_device *pdev)
 	if (!sof_pdata)
 		return -ENOMEM;
 
+	platform_set_drvdata(pdev, sof_pdata);
+
 	desc = device_get_match_data(dev);
 	if (!desc)
 		return -ENODEV;
@@ -94,6 +113,16 @@ static int sof_of_probe(struct platform_device *pdev)
 	sof_pdata->fw_filename_prefix = sof_pdata->desc->default_fw_path;
 	sof_pdata->tplg_filename_prefix = sof_pdata->desc->default_tplg_path;
 
+	ret = sof_of_parse(pdev);
+	if (ret < 0) {
+		dev_err(dev, "Could not parse SOF OF DSP node\n");
+		return ret;
+	}
+
+	/* use default fw filename if none provided in DT */
+	if (!sof_pdata->fw_filename)
+		sof_pdata->fw_filename = desc->default_fw_filename;
+
 	/* set callback to be called on successful device probe to enable runtime_pm */
 	sof_pdata->sof_probe_complete = sof_of_probe_complete;
 
-- 
2.27.0

