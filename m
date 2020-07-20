Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B4CE225863
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Jul 2020 09:24:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4B70314E;
	Mon, 20 Jul 2020 09:23:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4B70314E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595229847;
	bh=ZCVy4eMmcrqkp4hw2RV5tyiFc8tgk3ccBWvKmpePDRg=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UwQwy7VzxOnKbG9S1xDkC0kfZjvBIJNidxskXGhVjXV5+j1LFmbvQ9Ki5OUlQi7i2
	 Wso6A6ExGVL11pvuD53WUpbsGeNlpAMp69iI5Vi0xVazboXsAwMMR3IdnpHfwej6xB
	 rMQWxr6UVGb5onHk5RtIVoUmYgC+FSgq9L9+yz4c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6378EF80279;
	Mon, 20 Jul 2020 09:21:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 85F2FF8015D; Mon, 20 Jul 2020 09:21:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 MSGID_FROM_MTA_HEADER,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60061.outbound.protection.outlook.com [40.107.6.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 69BFDF800C1
 for <alsa-devel@alsa-project.org>; Mon, 20 Jul 2020 09:21:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 69BFDF800C1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=NXP1.onmicrosoft.com
 header.i=@NXP1.onmicrosoft.com header.b="YoGIvqBE"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R+MxuqmJJpf8YB+UxMm+Z5VzoofyxuHd73Q3SYV6YqfMwt5OhiUHx7GHfSJ/xQRoIwEGmRoVg3zJpILOyEdQ+YwfnwSm9CP3oyrdfeTeeBzs+d7LxFbAnmTEVK9wM0WLSdVwy2a//tNsccVEIWHO5tdy9xx7MUolvTzswf3VutLK4TS8jq77rwxx61DLaEoLvRbNHJS157roogx5/T3QIj2n4Fh68RM59RrKnJeNl9O9mIGv26f2iZ5dbxfbxa/zgTJnE2tINZrV20G6P/LKhC6auRNDMPHCsmREAczBMTZpe/jK4x/mqs7d+BVT6/8nZGWdVESzXT4OsL4HZW71Dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oPyaqWNCVdgTYlLWHRRgaYeOBek2YArBs9LBDLnpy0g=;
 b=ZE7un+ZWzuZcgu+95FhMquihVRcl2id9XE43eBGBhpeene/A7wxBn0vCTfKhoWN2hRaBwLSnsrUKgXSxqrYHnclbIogk0ut+rZuX02bPqqWdL3NlWd9S5vqge3u/2lyMIz5myY3vPZGiQzJE/2kZZBoBW25xEFC7VNA0DCxTNSyZYZTy9NyeY+sOdHbeODSTc8rfXqdhETjkREF4g8wU4zqyGsf85xVvrD1APpjS7sofYwaDyFkuw21Hc/g/ksyNFVE15hkgzuyev91irqn6EUh1stMDeu7rLlzXWzQ5N54Knwj8+YUv9/F72IwqJ8CRxn0w7g+0CKWN9Rb2RdNHGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oPyaqWNCVdgTYlLWHRRgaYeOBek2YArBs9LBDLnpy0g=;
 b=YoGIvqBEUeZFDcJbnokEZHMXxEdOSysuM9WKfss+8hQEGQsSPS1eatRVLk2PCr/4ZKATr8kFLhHVP2+bXf63PU1UXtR4AKDjBlgkGKlg/VMsue89o/Br2zXAom6XgSZPZWRZwMA9hSLJDLRSH6csCS9MGqNiJPjE0jFRok3IyiU=
Authentication-Results: alsa-project.org; dkim=none (message not signed)
 header.d=none;alsa-project.org; dmarc=none action=none
 header.from=oss.nxp.com;
Received: from VI1PR0401MB2287.eurprd04.prod.outlook.com
 (2603:10a6:800:2e::19) by VI1PR0402MB3344.eurprd04.prod.outlook.com
 (2603:10a6:803:10::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3195.25; Mon, 20 Jul
 2020 07:21:30 +0000
Received: from VI1PR0401MB2287.eurprd04.prod.outlook.com
 ([fe80::6888:5014:6c94:6711]) by VI1PR0401MB2287.eurprd04.prod.outlook.com
 ([fe80::6888:5014:6c94:6711%5]) with mapi id 15.20.3195.025; Mon, 20 Jul 2020
 07:21:30 +0000
From: Daniel Baluta <daniel.baluta@oss.nxp.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH 2/7] ASoC: SOF: imx: Use ARRAY_SIZE instead of hardcoded value
Date: Mon, 20 Jul 2020 10:20:41 +0300
Message-Id: <20200720072046.8152-3-daniel.baluta@oss.nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200720072046.8152-1-daniel.baluta@oss.nxp.com>
References: <20200720072046.8152-1-daniel.baluta@oss.nxp.com>
Content-Type: text/plain
X-ClientProxiedBy: AM0PR07CA0023.eurprd07.prod.outlook.com
 (2603:10a6:208:ac::36) To VI1PR0401MB2287.eurprd04.prod.outlook.com
 (2603:10a6:800:2e::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from fsr-ub1864-103.ro-buh02.nxp.com (83.217.231.2) by
 AM0PR07CA0023.eurprd07.prod.outlook.com (2603:10a6:208:ac::36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3216.14 via Frontend Transport; Mon, 20 Jul 2020 07:21:29 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [83.217.231.2]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 5871334e-ab67-41a5-861a-08d82c7d85ec
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3344:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR0402MB3344EF168191B9191E105C41B87B0@VI1PR0402MB3344.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1388;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SV1N/l++4U28Dsx64ghOOaBoXN6UCBbcG7XwAM4Esni6Z3PBU6X+RQ82SwhUqrMAyJ97B1IgWia5MA2e70EPo0j7RVYMKoXLCgvtvIVwHaaHKLUNEFFIXCfXepvX8xUGC+M9W89SWOFRWfXJYJOnO+1Moiu0ifCkrP3OkuVN12QoJ6jnFpImSs1NY81p1SUFTUoPz7b344cQbwPX8hKvz4lOTQkg0XDzYxIFBtOFqxFB9Wpn1eCeJVuZNb374hRbSaJhRvUhjX7xWBeQprEbNUsZi7c1n1oU7+9gQG2eqgdFPGxU9DKimbio9PON4Y3DYfXIlczh6JtxrWiow5PUFw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR0401MB2287.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(366004)(396003)(39860400002)(376002)(346002)(136003)(316002)(6512007)(66476007)(66946007)(83380400001)(4326008)(66556008)(6666004)(186003)(6486002)(2906002)(52116002)(86362001)(8936002)(44832011)(26005)(1076003)(956004)(478600001)(8676002)(16526019)(6506007)(2616005)(5660300002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: 4P9x0urSvmI7ZHGDMfhAtevFqNE5nMQmgbwhhNeX0UL0qwZRN6jTWpfLlFQzk+rJMBorsWLkxD81/RZzwnd+qSVydhnMekVzVgEXUJWxWE+vHvsvhzdOSGgZSuFDPWIuJ7QPaIKpkPlxMcLSL9/vyAj0/4UFRA5JONTSCiP6WQQU3FtrDQlRTNZk1iB83wuR9OqwzHHSArrJlrR79X21unYgCQ1JbjCC/Xe4D4uB6ODudrUy7mrUL+5kNoA+H84f07lkefLsLmZ8C4L8PHargg9gmObthXqQnMgiNLETH7oDDlvmzEAfTuUOBeU1A6vrNc+Tes5f0VLD/IZNpBBc5Sf69vapLTXc+mSEPiFEKSiOlgtlyQTSYkRzQnZM3rUQlbjJ37WXyed0ULwZkjJMnqIJaWY5HusNoW68Ilch6vNffGPRoZmyIB9+RA/FQQnaPY7yGtY7oj32ZrcYmAAjKQ9/ozaSEMy2Jfsgs6/mbQ0=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5871334e-ab67-41a5-861a-08d82c7d85ec
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0401MB2287.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2020 07:21:30.4588 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iAd1KFIa3E7R3yYKQR02hGu7a87lOAN9/dgRYZoerjTLlHlFobApV608NE0ZukFL1aYykDNSTe9+G1WsJQjcfw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3344
Cc: shengjiu.wang@nxp.com, festevam@gmail.com, linux-imx@nxp.com,
 linux-kernel@vger.kernel.org
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

With this change we no longer need to update num_drv when adding
new DAI driver.

Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
---
 sound/soc/sof/imx/imx8.c  | 4 ++--
 sound/soc/sof/imx/imx8m.c | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/sof/imx/imx8.c b/sound/soc/sof/imx/imx8.c
index b558132bb609..c7aab646cb8e 100644
--- a/sound/soc/sof/imx/imx8.c
+++ b/sound/soc/sof/imx/imx8.c
@@ -415,7 +415,7 @@ struct snd_sof_dsp_ops sof_imx8_ops = {
 
 	/* DAI drivers */
 	.drv = imx8_dai,
-	.num_drv = 1, /* we have only 1 ESAI interface on i.MX8 */
+	.num_drv = ARRAY_SIZE(imx8_dai),
 
 	/* ALSA HW info flags */
 	.hw_info =	SNDRV_PCM_INFO_MMAP |
@@ -455,7 +455,7 @@ struct snd_sof_dsp_ops sof_imx8x_ops = {
 
 	/* DAI drivers */
 	.drv = imx8_dai,
-	.num_drv = 1, /* we have only 1 ESAI interface on i.MX8 */
+	.num_drv = ARRAY_SIZE(imx8_dai),
 
 	/* ALSA HW info flags */
 	.hw_info =	SNDRV_PCM_INFO_MMAP |
diff --git a/sound/soc/sof/imx/imx8m.c b/sound/soc/sof/imx/imx8m.c
index 287114a37688..067d2424c682 100644
--- a/sound/soc/sof/imx/imx8m.c
+++ b/sound/soc/sof/imx/imx8m.c
@@ -280,7 +280,7 @@ struct snd_sof_dsp_ops sof_imx8m_ops = {
 
 	/* DAI drivers */
 	.drv = imx8m_dai,
-	.num_drv = 1, /* we have only 1 SAI interface on i.MX8M */
+	.num_drv = ARRAY_SIZE(imx8m_dai),
 
 	.hw_info = SNDRV_PCM_INFO_MMAP |
 		SNDRV_PCM_INFO_MMAP_VALID |
-- 
2.17.1

