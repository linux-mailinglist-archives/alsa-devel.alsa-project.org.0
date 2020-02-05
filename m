Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 96E241534F5
	for <lists+alsa-devel@lfdr.de>; Wed,  5 Feb 2020 17:06:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 09BFB1682;
	Wed,  5 Feb 2020 17:05:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 09BFB1682
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1580918805;
	bh=kSjdQjXdseRygLN7FQQ9chluzdpJiqVgqPX7lRe5Jkc=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Xj41IFb1i0p/Aqbw8WqbLGPv6qcARdVX3tY2qp61UnIgUpbGb/5KImXJaGdw0Vu8u
	 6tj68UUj/xFlu1o5Ho6ai9Ash1xRnc5kIJ4dPSJ7UJ9h1omKJbgefM0/SG2JGOx1Hs
	 CkdgSWV5/JbvBIc/J8xx+bUDOVEPcXjLfgnU7Xwg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C12C3F8014C;
	Wed,  5 Feb 2020 17:05:03 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EE09FF80148; Wed,  5 Feb 2020 17:05:00 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,MSGID_FROM_MTA_HEADER,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05hn20327.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7d00::327])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5848AF80051
 for <alsa-devel@alsa-project.org>; Wed,  5 Feb 2020 17:04:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5848AF80051
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=toradex.com header.i=@toradex.com
 header.b="KxLjUhCm"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IZC1FHSO3kZ3QI1sbnGRdH/F7I2Uw5rxqhYHs6WYUnFlgDQAg2ocP9ILQg4dFAMsuxmCpZ5gJfR5P8iA6wmH90REiDCDeNxdlgOQshQMeV23wH79AjSbjuNFldyojgsiWy9n2dULVKKK78jhoMoWlk1ku8T2iuZxxxwdPN6G0/4eEYQT8xBxX7N0moxnrhoSLQyAI9Gz12z3WhP4oJdFr82OY6cqqPo3Q8pz3zuVFqcb0+k+iFcDK4Jl9s1UTQy//9EVHZS85p03XzshKeo7ZJuy6AKdKBfEm5NXFgRRevuVnhuf/KZVuwuV3q8sJ7tu1/hwbYYf+txi1hVXcv3X/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=itU0ED0w/Hmd36ELD5ckm1ecQ5jx70sKj6AhR/rNJO4=;
 b=A1+8EMfI2mYCWYacb7StJFvkcXZy+9cp1ugQWqRLIFcTS9/RWiVl5NwxJEelTjzAYECCtRON0zzoPQraIWMsL60AN2Jek1bfEdqcF9QtQMPYnbIer5MtxIpjZ8v5X5g3MzgprPoRpO4NQUlo/Wi0HvCH1Ssk1efOIxf5Lz3fz044qGdJxxrj5acQPv+hrQnbQ145HAmraIiR4OnxhDwwNkbTjBHippKbSAk2IO0jYCUUltLgR5k/yaevolOVGHIZNAqlqkYhDNlzYZhdaAqk7MxfNO8OT2MmhHxATPuGEfciSlLTyvCVpZ2aLEyfL4G+lyjICE+cZ6p9HhWV6HH5YQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=toradex.com; dmarc=pass action=none header.from=toradex.com;
 dkim=pass header.d=toradex.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=toradex.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=itU0ED0w/Hmd36ELD5ckm1ecQ5jx70sKj6AhR/rNJO4=;
 b=KxLjUhCmBrsxDjBLFUQH0NtbbjopsKx0MYZV6hfBktchcd/SShE+0OVgtvd7Axberk05+wwIDrjPsnWX+QCOrhfVcjDcRsjuXuylg275sLBpyCa4FAJk2R9uWmzcTiK92HAxRVPqVl9NWaVclUF9paA70JXFHmgn0pM1bMe4qC0=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=oleksandr.suvorov@toradex.com; 
Received: from VI1PR05MB3279.eurprd05.prod.outlook.com (10.170.238.24) by
 VI1PR05MB5197.eurprd05.prod.outlook.com (20.178.11.151) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2686.33; Wed, 5 Feb 2020 16:04:41 +0000
Received: from VI1PR05MB3279.eurprd05.prod.outlook.com
 ([fe80::c14f:4592:515f:6e52]) by VI1PR05MB3279.eurprd05.prod.outlook.com
 ([fe80::c14f:4592:515f:6e52%7]) with mapi id 15.20.2686.035; Wed, 5 Feb 2020
 16:04:41 +0000
From: Oleksandr Suvorov <oleksandr.suvorov@toradex.com>
To: alsa-devel@alsa-project.org
Date: Wed,  5 Feb 2020 18:04:36 +0200
Message-Id: <20200205160436.3813642-1-oleksandr.suvorov@toradex.com>
X-Mailer: git-send-email 2.24.1
X-ClientProxiedBy: GV0P278CA0030.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:710:28::17) To VI1PR05MB3279.eurprd05.prod.outlook.com
 (2603:10a6:802:1c::24)
MIME-Version: 1.0
Received: from localhost (194.105.145.90) by
 GV0P278CA0030.CHEP278.PROD.OUTLOOK.COM (2603:10a6:710:28::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2707.21 via Frontend Transport; Wed, 5 Feb 2020 16:04:40 +0000
X-Mailer: git-send-email 2.24.1
X-Originating-IP: [194.105.145.90]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1544a42a-6a1e-4d4a-0b73-08d7aa551bc4
X-MS-TrafficTypeDiagnostic: VI1PR05MB5197:|VI1PR05MB5197:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR05MB5197C785940398ECBB568757F9020@VI1PR05MB5197.eurprd05.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-Forefront-PRVS: 0304E36CA3
X-Forefront-Antispam-Report: SFV:SPM;
 SFS:(10019020)(4636009)(346002)(366004)(136003)(39850400004)(376002)(396003)(199004)(189003)(316002)(16526019)(81156014)(8676002)(186003)(81166006)(956004)(8936002)(66946007)(6666004)(7416002)(66556008)(66476007)(478600001)(6916009)(6496006)(36756003)(52116002)(26005)(86362001)(1076003)(2906002)(6486002)(44832011)(4326008)(2616005)(54906003)(5660300002)(23200700001);
 DIR:OUT; SFP:1501; SCL:5; SRVR:VI1PR05MB5197;
 H:VI1PR05MB3279.eurprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; CAT:OSPM; 
Received-SPF: None (protection.outlook.com: toradex.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Sw0vJi4XEAvc11+yt9IK+E2rAzJi47VDLVXns3uw2GZVgLf5kjN59NQG0FK/wxnPNUkdkMoLN0sno7pqP+M2kqJeztgiOhR3vmwXuuurZRePT2R3ChiS5JrrUVQAQyrCpggz6ZyqnO00bKfvIBhRoKWoo7NHZuP7N/cjL6mhIq6KI2rk18FjzxAVc5J8SDPoRhK163H+39pMoqM6I8PiLsXZxGkVG1WfAZd6vH5rf+rDaPaceB9c8ZHq3Coi4FjJYW/dK29RImKF7Y6PvGuWAKHScr/pFbfe+fHo2txlU4HoxzNg6/8CWXDR2FSe7j40c/DAVlV5X8sm48CDvSc+uulMZQpL4XaB+LEWf4kffM4HWtHBoVwxAkcV00Sony07YX919QZK5B/zDLIGpj++Hdd7OVEXW2dwtj8PseR4qh0Mq8rXhyUGr3tiYD0qYT3ARyhdb07llH4UGf+hFAdVTuUh3pjDN4QFQ2vjkuacHXAzPEiw+/twtWQIZJuDfeReESRsmPjUGGbdisftcCAeFkX36XQSm7q+vfzBhfQg3V3PL8FMYjBa0aCxiVGPrU/6ujUVNoqw5MjBpULvlIlTeiCzp2cuRyfF2sbF8/At9CJw4dfoMWejU28NnUnT8FQd/BzZcZ6QczvuRFQN4RsFVAfq4BNfbbDoEnBzoIP8g9FWm9TgzlUlGHIc01/HeUb1DkscTXFJwu5rpuT5QyONl3xvxK1A1Cxcyx585J6v4ghjwDg+J07HQcebYBwiNoqLtwVxwadFQqAUvNFJa+Jr/w==
X-MS-Exchange-AntiSpam-MessageData: Mz2GOcg9jXO8x4f4wfofIOvEJSlpXjescALvGGIQ6gdROHOSs9GWCRi+xwk6a565B1JqZXim7M2kJesMJIQMv1wdvDdvNNHlN+p70wTXSIVebwF2Ea+z5IvpOsB/3MOIAd+ghx3PVjpHRhxZoqGZmQ==
X-OriginatorOrg: toradex.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1544a42a-6a1e-4d4a-0b73-08d7aa551bc4
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2020 16:04:41.2908 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d9995866-0d9b-4251-8315-093f062abab4
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2xEopcBa3erDQ2vMSJK4aW7H4B2pFPiqyx7PY6qZSwWhafhplRl5lxd1iX4Ow30M7wWXwnMvsCscOPgovzZ0Fu6C0ikVHQJkCATMF80+hRA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR05MB5197
Cc: Nicolin Chen <nicoleotsuka@gmail.com>,
 Igor Opaniuk <igor.opaniuk@toradex.com>, linuxppc-dev@lists.ozlabs.org,
 Timur Tabi <timur@kernel.org>, Xiubo Li <Xiubo.Lee@gmail.com>,
 Marcel Ziswiler <marcel.ziswiler@toradex.com>,
 Fabio Estevam <festevam@gmail.com>, Shengjiu Wang <shengjiu.wang@nxp.com>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Oleksandr Suvorov <oleksandr.suvorov@toradex.com>,
 Philippe Schenker <philippe.schenker@toradex.com>,
 Mark Brown <broonie@kernel.org>, Daniel Baluta <daniel.baluta@nxp.com>,
 linux-kernel@vger.kernel.org
Subject: [alsa-devel] [PATCH] ASoC: fsl_sai: Fix exiting path on probing
	failure
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

If the imx-sdma driver is built as a module, the fsl-sai device doesn't
disable on probing failure, which causes the warning in the next probing:

==================================================================
fsl-sai 308a0000.sai: Unbalanced pm_runtime_enable!
fsl-sai 308a0000.sai: Unbalanced pm_runtime_enable!
fsl-sai 308a0000.sai: Unbalanced pm_runtime_enable!
fsl-sai 308a0000.sai: Unbalanced pm_runtime_enable!
fsl-sai 308a0000.sai: Unbalanced pm_runtime_enable!
fsl-sai 308a0000.sai: Unbalanced pm_runtime_enable!
==================================================================

Disabling the device properly fixes the issue.

Fixes: 812ad463e089 ("ASoC: fsl_sai: Add support for runtime pm")
Signed-off-by: Oleksandr Suvorov <oleksandr.suvorov@toradex.com>
---

 sound/soc/fsl/fsl_sai.c | 22 +++++++++++++++++-----
 1 file changed, 17 insertions(+), 5 deletions(-)

diff --git a/sound/soc/fsl/fsl_sai.c b/sound/soc/fsl/fsl_sai.c
index 8c3ea7300972..9d436b0c5718 100644
--- a/sound/soc/fsl/fsl_sai.c
+++ b/sound/soc/fsl/fsl_sai.c
@@ -1020,12 +1020,24 @@ static int fsl_sai_probe(struct platform_device *pdev)
 	ret = devm_snd_soc_register_component(&pdev->dev, &fsl_component,
 			&fsl_sai_dai, 1);
 	if (ret)
-		return ret;
+		goto err_pm_disable;
 
-	if (sai->soc_data->use_imx_pcm)
-		return imx_pcm_dma_init(pdev, IMX_SAI_DMABUF_SIZE);
-	else
-		return devm_snd_dmaengine_pcm_register(&pdev->dev, NULL, 0);
+	if (sai->soc_data->use_imx_pcm) {
+		ret = imx_pcm_dma_init(pdev, IMX_SAI_DMABUF_SIZE);
+		if (ret)
+			goto err_pm_disable;
+	} else {
+		ret = devm_snd_dmaengine_pcm_register(&pdev->dev, NULL, 0);
+		if (ret)
+			goto err_pm_disable;
+	}
+
+	return ret;
+
+err_pm_disable:
+	pm_runtime_disable(&pdev->dev);
+
+	return ret;
 }
 
 static int fsl_sai_remove(struct platform_device *pdev)
-- 
2.24.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
