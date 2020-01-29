Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D8E2014C797
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Jan 2020 09:39:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 107E81664;
	Wed, 29 Jan 2020 09:38:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 107E81664
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1580287185;
	bh=fhMyK1Iex3CIc4RzGyecCHofafcEoa+VravoZdImUvU=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=q4h1iP5dm9OtJewpGl8ONQ/BFCXW6pgc/XA+0sndu99mWELO5fB8EmO++STCdPnFs
	 /Nv8CYR3g5L0bxY4oA3/aH31IP1X17LQMpB6jNFQLGmwPwa0EdWxYSuxWKTXuVmc39
	 homaPrd8KlQtjfbER2Rg4DT66HNe8PoYLW8OqKyU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1C563F80122;
	Wed, 29 Jan 2020 09:38:04 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 15D61F8021E; Wed, 29 Jan 2020 09:38:01 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 FORGED_SPF_HELO,MSGID_FROM_MTA_HEADER,SPF_HELO_PASS,SPF_NONE,SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2064.outbound.protection.outlook.com [40.107.92.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 634D6F80123
 for <alsa-devel@alsa-project.org>; Wed, 29 Jan 2020 09:37:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 634D6F80123
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amdcloud.onmicrosoft.com
 header.i=@amdcloud.onmicrosoft.com header.b="Wero8S33"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FLZmrkyzwwkPQUOsy0l9MQsOD8GE7lJkeNmoIvuvXk8AVnr6QOPiXxUR6LJ9Q5btc8OQSXIQvCiVMz5t2uxNFEaWnd+/5ybF4wqq9vV0di3taXYYekOA3+d7tK1ZhvxaocJ0X6zybeKuTCCeEoUyKeJchCiEgSu1owOVwzgmAJv1cCxLkuh6qToFjyF9011Lgvjrj1oO8A8VP6pGBxeQEmkwO3Xh4xpUAo+wM3OPmE02SFyRtMU9jIERvVszAKZZoAysWx4kP1YMjPONvoCRF5Mna71Lr9tqU8XqAv7S/CI6TezCP3Hjtj22I5um/Z1fN1XvBP6TYcJlCxMTrUpcpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=64pEEJpN0uTgZXsX2mJFpFcKsARmJbSjCM6bE/FMmlM=;
 b=NwJAYEoOkXdUp2Ib76Cck5x/DjgaBnBhF1N/zcqtxwqqQED17huePpX4yCSRERAqugtJ1lIA2sZvhcPq43Oavpg6Y8M+4sqhJ7jEUEUkx4l58H3k+TCbpszcn7kPJyCCEvb7nfyLRIxRAcv3BwB8Ejz/Truj8mq5WCLEAAr/c/fLEDIRfFu4jiSI+lKfit5w8epRVfpuGykVA2iGc3e+EzeiG9oUsH1FT/N1TOpaItyzRfDEwi33iiVi7AC5ZF6mPGK3P1GS5XzrWpBTtwWO3vPsDbYQ++UeMGjZQqD/t8dO8iM65vawOtaLWQQGsYh1JUSt1MyhfwC6ew6Ql/aD1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=64pEEJpN0uTgZXsX2mJFpFcKsARmJbSjCM6bE/FMmlM=;
 b=Wero8S33NuLnfjbzrvWBkwzAzCcpy7jIWrTyS9uW9XqjtRuhcNigLQb0z11c5cEg9JpJg7eVN84q3nfIFrkDrBsgNDd37DGlE9u+daF5h45Ryh/lXM06+QtxlP79nJHs8twckYcvV+SN5AwFXUVrU89j4ugT757czPXa5cGYwdY=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Akshu.Agrawal@amd.com; 
Received: from MN2PR12MB2878.namprd12.prod.outlook.com (20.179.80.143) by
 MN2PR12MB3552.namprd12.prod.outlook.com (20.179.80.209) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2665.20; Wed, 29 Jan 2020 08:37:53 +0000
Received: from MN2PR12MB2878.namprd12.prod.outlook.com
 ([fe80::11fb:70af:b3dd:203d]) by MN2PR12MB2878.namprd12.prod.outlook.com
 ([fe80::11fb:70af:b3dd:203d%6]) with mapi id 15.20.2665.026; Wed, 29 Jan 2020
 08:37:52 +0000
From: Akshu Agrawal <akshu.agrawal@amd.com>
To: 
Date: Wed, 29 Jan 2020 14:07:15 +0530
Message-Id: <20200129083725.208166-1-akshu.agrawal@amd.com>
X-Mailer: git-send-email 2.17.1
X-ClientProxiedBy: MAXPR01CA0077.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:49::19) To MN2PR12MB2878.namprd12.prod.outlook.com
 (2603:10b6:208:aa::15)
MIME-Version: 1.0
Received: from ETHANOL2.amd.com (165.204.156.251) by
 MAXPR01CA0077.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:49::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2665.20 via Frontend Transport; Wed, 29 Jan 2020 08:37:49 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [165.204.156.251]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: e8f717c6-aa4a-42e8-2f6a-08d7a4968793
X-MS-TrafficTypeDiagnostic: MN2PR12MB3552:|MN2PR12MB3552:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB355241AB81BC9FB636506984F8050@MN2PR12MB3552.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3044;
X-Forefront-PRVS: 02973C87BC
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(136003)(39860400002)(346002)(366004)(396003)(199004)(189003)(109986005)(44832011)(66946007)(4326008)(2616005)(6666004)(956004)(81156014)(66476007)(8936002)(1076003)(66556008)(81166006)(36756003)(186003)(16526019)(52116002)(7696005)(2906002)(8676002)(86362001)(26005)(5660300002)(54906003)(6486002)(478600001)(316002)(266003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3552;
 H:MN2PR12MB2878.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zJHAQnF2ylDacybORhp+l1CunLlZfVmuYLMKRjwcz/gNrw9QciMJEVey5o57YEaFQwdKkdWCXPOwPkWG9eHR6Si00nPJg1dOt7VkEcYU+Zm8pZYT/xrGMntz3gUCD2wAF45G/vyG6xqASI9QGYatE8pLpYv8iPjbML3LHRIXP/sUOOm0NgyKI9TaZQQcIuIaAGj1oRk1NcF6EM1iOjFasnjxd3Hu+2p5q+LYRm4iApXXRgdmyPPROYdbMf7jaKlBMI04Jkx+B3AEcrEzPqM2cjZeTxZdmW8LKv6sF8QAiTeiK1sd6mzPLi12D/pefvoA4DVs5dc6P1HqW7REXbnemgfRDfyOEySKPvSf09idXTD5YIiRTaY2NiHDuIXSNGN2uIXoetPkWdmpb9BWbc1wcVXMdqqKVluWxmKEbMNy37V4gvMiUEa4sZiyeD9RBPI4otMnjBmfbqw68Xr0FQG+icen6bt8I1q39wyCVQBm3Tc=
X-MS-Exchange-AntiSpam-MessageData: 3KTNphqlJYoMMflYvvSbcpZTIAlsJ0Igzerk40hg3AWtViiyZo7KUpXfdSesOgIlBfaUX47HdI9KzvrilJ8Vmt5IdF4QWUcY1zygIgZrzd10lVHpxPFIDTSHuIgvsEjRE59BimIOsBRFi5a65rjPFQ==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e8f717c6-aa4a-42e8-2f6a-08d7a4968793
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2020 08:37:52.4923 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W4/NarWDKEcfzQxURzwIkpIP6iuh1QaIFdAcq9OgC+ZpixdTA+0VtrMLawLJ8Mxs3/y2chqm8VrqTPXh4BvDvw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3552
Cc: "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Liam Girdwood <lgirdwood@gmail.com>, open list <linux-kernel@vger.kernel.org>,
 YueHaibing <yuehaibing@huawei.com>, Takashi Iwai <tiwai@suse.com>,
 Mark Brown <broonie@kernel.org>, Wei Yongjun <weiyongjun1@huawei.com>,
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
 Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>,
 akshu.agrawal@amd.com
Subject: [alsa-devel] [PATCH] ASoC: amd: raven: Make the driver name
	consistent across files
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

This fixes the issue of driver not getting auto loaded with
MODULE_ALIAS.

With this patch:
find /sys/devices -name modalias -print0 | xargs -0 grep -i acp3x
/sys/devices/pci0000:00/0000:00:08.1/0000:03:00.5/acp3x_i2s_playcap.2/modalias:platform:acp3x_i2s_playcap
/sys/devices/pci0000:00/0000:00:08.1/0000:03:00.5/acp3x_i2s_playcap.0/modalias:platform:acp3x_i2s_playcap
/sys/devices/pci0000:00/0000:00:08.1/0000:03:00.5/acp3x_rv_i2s_dma.0/modalias:platform:acp3x_rv_i2s_dma
/sys/devices/pci0000:00/0000:00:08.1/0000:03:00.5/acp3x_i2s_playcap.1/modalias:platform:acp3x_i2s_playcap

Signed-off-by: Akshu Agrawal <akshu.agrawal@amd.com>
---
 sound/soc/amd/raven/acp3x-i2s.c     | 6 +++---
 sound/soc/amd/raven/acp3x-pcm-dma.c | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/sound/soc/amd/raven/acp3x-i2s.c b/sound/soc/amd/raven/acp3x-i2s.c
index bf51cadf8682..8619ed5f08ef 100644
--- a/sound/soc/amd/raven/acp3x-i2s.c
+++ b/sound/soc/amd/raven/acp3x-i2s.c
@@ -15,7 +15,7 @@
 
 #include "acp3x.h"
 
-#define DRV_NAME "acp3x-i2s"
+#define DRV_NAME "acp3x_i2s_playcap"
 
 static int acp3x_i2s_set_fmt(struct snd_soc_dai *cpu_dai,
 					unsigned int fmt)
@@ -276,7 +276,7 @@ static struct snd_soc_dai_ops acp3x_i2s_dai_ops = {
 };
 
 static const struct snd_soc_component_driver acp3x_dai_component = {
-	.name           = "acp3x-i2s",
+	.name           = DRV_NAME,
 };
 
 static struct snd_soc_dai_driver acp3x_i2s_dai = {
@@ -355,4 +355,4 @@ module_platform_driver(acp3x_dai_driver);
 MODULE_AUTHOR("Vishnuvardhanrao.Ravulapati@amd.com");
 MODULE_DESCRIPTION("AMD ACP 3.x PCM Driver");
 MODULE_LICENSE("GPL v2");
-MODULE_ALIAS("platform:" DRV_NAME);
+MODULE_ALIAS("platform:"DRV_NAME);
diff --git a/sound/soc/amd/raven/acp3x-pcm-dma.c b/sound/soc/amd/raven/acp3x-pcm-dma.c
index aecc3c061679..c865aeca6907 100644
--- a/sound/soc/amd/raven/acp3x-pcm-dma.c
+++ b/sound/soc/amd/raven/acp3x-pcm-dma.c
@@ -15,7 +15,7 @@
 
 #include "acp3x.h"
 
-#define DRV_NAME "acp3x-i2s-audio"
+#define DRV_NAME "acp3x_rv_i2s_dma"
 
 static const struct snd_pcm_hardware acp3x_pcm_hardware_playback = {
 	.info = SNDRV_PCM_INFO_INTERLEAVED |
@@ -534,4 +534,4 @@ MODULE_AUTHOR("Maruthi.Bayyavarapu@amd.com");
 MODULE_AUTHOR("Vijendar.Mukunda@amd.com");
 MODULE_DESCRIPTION("AMD ACP 3.x PCM Driver");
 MODULE_LICENSE("GPL v2");
-MODULE_ALIAS("platform:" DRV_NAME);
+MODULE_ALIAS("platform:"DRV_NAME);
-- 
2.17.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
