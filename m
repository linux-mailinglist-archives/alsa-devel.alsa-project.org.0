Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7572563945D
	for <lists+alsa-devel@lfdr.de>; Sat, 26 Nov 2022 09:07:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1E4611777;
	Sat, 26 Nov 2022 09:06:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1E4611777
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669450049;
	bh=CxeMxe3aoPiTcdjWZxO4/l4XRyQP787Qod91ZUenZfo=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=E8KL1FxV33KGpt5wjr7eBpJ0/4RSRRwrtXDVissrJJn09ufJurnndOaWEfCaEbg+0
	 QDB81IahXnOXSORoxaKFgFOLSgbnBqOowcE/I7nHYcgQYIT27icC1wcccPtSKm8k5T
	 nalH+7FQsf4Epy3HPKe/Nfch8NFtZvn/i0ylCyCg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5FB29F80607;
	Sat, 26 Nov 2022 08:59:12 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 26E8BF8030F; Wed, 23 Nov 2022 13:20:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20614.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e88::614])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9FE9CF80249;
 Wed, 23 Nov 2022 13:20:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9FE9CF80249
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=amdcloud.onmicrosoft.com
 header.i=@amdcloud.onmicrosoft.com header.b="DJACHXff"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e4ODTzMwT/RfrRPJnqZP1ABZdf8Y12aVkhkByVA5FhvOR3KZtwHEsBKZbS7G+pnwRlQwcMGLx4v2atbTiR7r8EI9ritblVa/9Ju/RmW0S3yMo3mAP+N+pOuze+A92nHUkreA24ED92tDvznjGW/ZZydMBvlk8RAr1iPvXTR7eKdArfjhYRN8WTAAMGCvIoRVNG9hAlGXl5MSLt57xN9xGoMnvCIB8M70/fRL90Y1MJRtKkrvAUql1y6d11RlcpZyZWpCsJV5R74yz7LznKIGPVCnfPVNgoqkdgcOZdD+ZzAgHzcSJFLZGzagw+XFuXQ5VCZ/xJ57uH9fQB/f8mp9zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MYRKPH/S1XOqokAaSfdQoVH+BcxfQ5FO55P+rPeA9Dg=;
 b=V157ThACpYqekY9AZkO0xSrHZfaqGQoiMoM7AZQIOcRh7Pc57/2iU88hId2jDx4E6QBpMD3Qq/9meE1geCXDROethnyDd2BiadN4LgJogEezK0Zo21qXUsFr3wp2AIk1v4gMCKueK6dExsfvWdSWyF7ulFq4rN/8YEjUE3FmPdOdu2yqs6TSIewb5bVWzNwxnfk268RRS9UHHAgGp5j9IsnB/5PhJrzBrLAtQWw3Jf3FqhVi7EdeWeafRzfBh7i1sA9uiVOqeEHbXs/DpwdaoaR50k76c4IeD2XvUKTJ6lUNLbHroSlk0DeLOezsbOoMrC41Y7ISnM9xbAX3mOUt+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 165.204.84.17) smtp.rcpttodomain=kernel.org
 smtp.mailfrom=amd.corp-partner.google.com; dmarc=fail (p=reject sp=reject
 pct=100) action=oreject header.from=amd.corp-partner.google.com; dkim=none
 (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MYRKPH/S1XOqokAaSfdQoVH+BcxfQ5FO55P+rPeA9Dg=;
 b=DJACHXffOtGiY4/fgyRzReOgW4aDqf7x+WcM+s/feQ0c9+dS89asRnon2s8k3TlxuTCzcSjePkblRp7T6RcDb1Dcag/cX7iQSlEBDzTVWeNglxu/cUF56A28cITXfhHmkky4Ec2O/qQv1o4qqGfFhAqF6bKq60cfhSWBg88O0eiDsSgBB1H5QbFZTphMih2KCC4QNdRqtpe/KvhlsBbMKRWvyCYGCEegpWRhtIn7+mpmKVVGJVB88nvDY7U/dqfj3gGAAD/JiBcVS4nmHQHoLzz8njA7Dvb4mPnKtxeQeGkclnSrkrUvqdLy3s+dPZzsvGNZS0oPbirBvszgGSljnA==
Received: from MW2PR2101CA0015.namprd21.prod.outlook.com (2603:10b6:302:1::28)
 by IA0PR12MB7776.namprd12.prod.outlook.com (2603:10b6:208:430::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.15; Wed, 23 Nov
 2022 12:20:07 +0000
Received: from CO1NAM11FT078.eop-nam11.prod.protection.outlook.com
 (2603:10b6:302:1:cafe::fd) by MW2PR2101CA0015.outlook.office365.com
 (2603:10b6:302:1::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.3 via Frontend
 Transport; Wed, 23 Nov 2022 12:20:07 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 165.204.84.17) smtp.mailfrom=amd.corp-partner.google.com; dkim=none (message
 not signed) header.d=none;dmarc=fail action=oreject
 header.from=amd.corp-partner.google.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 amd.corp-partner.google.com discourages use of 165.204.84.17 as permitted
 sender)
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT078.mail.protection.outlook.com (10.13.175.177) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5834.8 via Frontend Transport; Wed, 23 Nov 2022 12:20:07 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 23 Nov
 2022 06:19:28 -0600
Received: from sof-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34
 via Frontend Transport; Wed, 23 Nov 2022 06:19:22 -0600
From: V sujith kumar Reddy <vsujithkumar.reddy@amd.corp-partner.google.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
Subject: [PATCH v1 3/4] ASoC: SOF: amd: ADD HS and SP virtual DAI.
Date: Wed, 23 Nov 2022 17:49:10 +0530
Message-ID: <20221123121911.3446224-4-vsujithkumar.reddy@amd.corp-partner.google.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221123121911.3446224-1-vsujithkumar.reddy@amd.corp-partner.google.com>
References: <20221123121911.3446224-1-vsujithkumar.reddy@amd.corp-partner.google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT078:EE_|IA0PR12MB7776:EE_
X-MS-Office365-Filtering-Correlation-Id: 5be7c558-97f9-4383-7579-08dacd4d0f08
X-MS-Exchange-SenderADCheck: 2
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: V1/sG1BxTeADR9fO6WzJR4sWD5SKG7sBg/JYrv9kBk+LmoAx3JY3nRWQ89XRmPHLGL1VFHdn61aistrasrNlo9IPQeZYRtldsVYAGZr/q7EUBlw5E6tqVKhlzqXYwVUE/h/adI19TF2FN0PQDQrRii75XUsEQO5TRZ9x41MuNOGT3YwO7gIVBQ29IuFpnELK46fmN08WyogUPkH9DEFFQnO8vhlT9yU9oD2rUI4OwEyc2ofdMoZhDTvLfeUQrdayK5yS8Aou0FAU08Lsdk5KGYdxyc+dc4UPE+NP69AMDrVhH21LzRyaeGU+Kfc+Glt8CixJ3oee830zFNCvpYms9UgX8kFI7fhnpZpIzXX42vf9VMOJuyaHAArXJZHt+PqEanX8rG7yvMBwD9gbCC7RIRpqsswcJeBJMcCDW9OkwshdtXLj5jFZ1+kvl8H0kVvOiXakbK3epdOFfNsKD8az7lVLhkph2yTuIEJzoUByGUYilYcmCiiv9RwlX+0YKw4CfFgs0fiaqPpWoMxmzMudLmxZtXPLA1lBguFSAcRK2h/DZ+xBLX03mF10LJPDcuoYcR3jLB9rG4uxNCp3ZMH9p3So13yDmyMOaSFmrDglRX5F4PrxcLcyfaTEhK9PK2YIoFi3yiTx4Noy3Lcf6qkjANJ5dTwJLENM3dheaiz6TWQhoPHFMwsEGYTplyTYRbG6j4kHEHBkFbEYVvSfbev2ww==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(39860400002)(136003)(376002)(346002)(396003)(451199015)(46966006)(40470700004)(86362001)(81166007)(26005)(356005)(82740400003)(82310400005)(2616005)(2906002)(336012)(1076003)(110136005)(54906003)(40460700003)(35950700001)(47076005)(8936002)(5660300002)(40480700001)(7416002)(498600001)(6666004)(41300700001)(8676002)(316002)(70206006)(76482006)(70586007)(4326008);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amdcloud.onmicrosoft.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2022 12:20:07.3172 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5be7c558-97f9-4383-7579-08dacd4d0f08
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT078.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7776
X-Mailman-Approved-At: Sat, 26 Nov 2022 08:58:52 +0100
Cc: Daniel Baluta <daniel.baluta@nxp.com>,
 Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 Sunil-kumar.Dommati@amd.com, ssabakar@amd.com,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, venkataprasad.potturu@amd.com,
 Bard Liao <yung-chuan.liao@linux.intel.com>, Basavaraj.Hiregoudar@amd.com,
 Takashi Iwai <tiwai@suse.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 "moderated list:SOUND - SOUND OPEN FIRMWARE \(SOF\) DRIVERS"
 <sound-open-firmware@alsa-project.org>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Vijendar.Mukunda@amd.com, V sujith kumar Reddy <Vsujithkumar.Reddy@amd.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, Ajit Kumar
 Pandey <AjitKumar.Pandey@amd.com>, open list <linux-kernel@vger.kernel.org>,
 Rander Wang <rander.wang@intel.com>
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

From: V sujith kumar Reddy <Vsujithkumar.Reddy@amd.com>

ADD HS and SP virtual DAI driver to support AMD platforms.

Signed-off-by: V sujith kumar Reddy <Vsujithkumar.Reddy@amd.com>
---
 sound/soc/sof/amd/rembrandt.c | 16 ++++++++++++++++
 sound/soc/sof/amd/renoir.c    | 16 ++++++++++++++++
 2 files changed, 32 insertions(+)

diff --git a/sound/soc/sof/amd/rembrandt.c b/sound/soc/sof/amd/rembrandt.c
index dcb64a23e121..5288ab882fc9 100644
--- a/sound/soc/sof/amd/rembrandt.c
+++ b/sound/soc/sof/amd/rembrandt.c
@@ -23,6 +23,7 @@
 #define I2S_BT_INSTANCE		1
 #define I2S_SP_INSTANCE		2
 #define PDM_DMIC_INSTANCE	3
+#define I2S_HS_VIRTUAL_INSTANCE	4
 
 static struct snd_soc_dai_driver rembrandt_sof_dai[] = {
 	[I2S_HS_INSTANCE] = {
@@ -112,6 +113,21 @@ static struct snd_soc_dai_driver rembrandt_sof_dai[] = {
 			.rate_max = 48000,
 		},
 	},
+
+	[I2S_HS_VIRTUAL_INSTANCE] = {
+		.id = I2S_HS_VIRTUAL_INSTANCE,
+		.name = "acp-sof-hs-virtual",
+		.playback = {
+			.rates = SNDRV_PCM_RATE_8000_96000,
+			.formats = SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S8 |
+				   SNDRV_PCM_FMTBIT_U8 | SNDRV_PCM_FMTBIT_S32_LE,
+			.channels_min = 2,
+			.channels_max = 8,
+			.rate_min = 8000,
+			.rate_max = 96000,
+		},
+		.probe = &acp_dai_probe,
+	},
 };
 
 /* Rembrandt ops */
diff --git a/sound/soc/sof/amd/renoir.c b/sound/soc/sof/amd/renoir.c
index 6ea8727f977e..adade2e3d3be 100644
--- a/sound/soc/sof/amd/renoir.c
+++ b/sound/soc/sof/amd/renoir.c
@@ -22,6 +22,7 @@
 #define I2S_BT_INSTANCE		0
 #define I2S_SP_INSTANCE		1
 #define PDM_DMIC_INSTANCE	2
+#define I2S_SP_VIRTUAL_INSTANCE	3
 
 static struct snd_soc_dai_driver renoir_sof_dai[] = {
 	[I2S_BT_INSTANCE] = {
@@ -86,6 +87,21 @@ static struct snd_soc_dai_driver renoir_sof_dai[] = {
 			.rate_max = 48000,
 		},
 	},
+
+	[I2S_SP_VIRTUAL_INSTANCE] = {
+		.id = I2S_SP_VIRTUAL_INSTANCE,
+		.name = "acp-sof-sp-virtual",
+		.playback = {
+			.rates = SNDRV_PCM_RATE_8000_96000,
+			.formats = SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S8 |
+				   SNDRV_PCM_FMTBIT_U8 | SNDRV_PCM_FMTBIT_S32_LE,
+			.channels_min = 2,
+			.channels_max = 8,
+			.rate_min = 8000,
+			.rate_max = 96000,
+		},
+		.probe = &acp_dai_probe,
+	},
 };
 
 /* Renoir ops */
-- 
2.25.1

