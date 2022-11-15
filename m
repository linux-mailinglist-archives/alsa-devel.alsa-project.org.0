Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 89934629263
	for <lists+alsa-devel@lfdr.de>; Tue, 15 Nov 2022 08:21:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D91551678;
	Tue, 15 Nov 2022 08:20:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D91551678
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668496890;
	bh=nnYBkn27+b738KucElNB8N6K172p9xIeGEno43BJm70=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Q6rArWVHlKVop1nW5ZELuxQoegGG5nAmdtEhd+1RptktPNbmrQLyTeYITdejQUapd
	 ez6g85XhPz7lPHLsQHVIgt7znBHvcUEcDDv8vI9DTXW7C0Ja7aFbutxnWkS5zzo0QM
	 H4xfMANH+01cAi0ZpEdVk8dFD4HRSWS+Hdi83mMo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 24040F80558;
	Tue, 15 Nov 2022 08:20:25 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 06EB3F80557; Tue, 15 Nov 2022 08:20:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2061a.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe5a::61a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 12627F80538;
 Tue, 15 Nov 2022 08:20:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 12627F80538
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com
 header.b="dEsVzRRZ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VgL+XM8ZsCDaczX0XTL4spiRVkMZA7L1dGHMFMxueDi56TJQqVt6sbfcoIU27IiazvVgVdWYNJEMeotajaw6JZ7NoH/n63Lw+LPfnN3RvVZa5q9hFXDuKvoQM5y48PzQRSCFOu26UDDgkMnwU/5cklQxSAagBw6WQBb1AEfuNAPiNF1PHUz5ssVvvmaQYUEEXw+03a3aZ3FHvvHV+nEsDuXpe24qGlcKsmUWlniWjP2OS8kLYAnHpGmxyB7oB14ck86CNhgyHdC8uXeXyfgWa+uMBoRjzqYTPINx2ZMB7Uou/958aBh80K2hktjBmcqbr2413++qc77P31ddJnbrGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cko9owEkAFRf80SlZ7NAXX75SMbmM3Abj8wmAJNUYFs=;
 b=MsyjzL7DZ8OBWCfIB+AShEiDY3Jes9e8SK9EZDa11nTONBzI4XDgxl7r7hmjio8SG5+JlJKvDvLjYOgw9S67kO0IM+KsOmcuZb8YjPi1JQbDt+QpRJzQWjoErbXm3f2Hzke2JoXIvhCwpySV5W3bMuSNg+7xZJidhEwaU1LMJVOKffxDhKrm03qsEbLdtWGs35fH8jc1YLBRdK3CeUbXd/xQhigrHwinmHlHJd+AOTDdW4Afo6tHfFDw5TO3UVwN0WHw1V2X5CBg/w47B2GD3mS+dQLSaVwZL/Uju9qqZQMLEC5LX9VNlyxRbMqeJXHu+sjBMHtyJrVhtRdrC9SGJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cko9owEkAFRf80SlZ7NAXX75SMbmM3Abj8wmAJNUYFs=;
 b=dEsVzRRZJZZIwAcaORjGiqvXDaOTDpV8sOr11ss09Wf1nCMT+mGnNEN6J0Ni6nb+9BVIzReDXo2+e5HVIa06VVT+8l1PiJG3gx4UannsLWVl4dbAefDamcEQum6Yr0CuOJLgR6SgFmmy+/o33edWRNoSJk0l0BSxNiByKPX/aFM=
Received: from MW4PR03CA0297.namprd03.prod.outlook.com (2603:10b6:303:b5::32)
 by CY5PR12MB6477.namprd12.prod.outlook.com (2603:10b6:930:36::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.16; Tue, 15 Nov
 2022 07:20:11 +0000
Received: from CO1NAM11FT080.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:b5:cafe::dc) by MW4PR03CA0297.outlook.office365.com
 (2603:10b6:303:b5::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.17 via Frontend
 Transport; Tue, 15 Nov 2022 07:20:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1NAM11FT080.mail.protection.outlook.com (10.13.174.99) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5813.12 via Frontend Transport; Tue, 15 Nov 2022 07:20:11 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 15 Nov
 2022 01:20:10 -0600
Received: from sof-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34
 via Frontend Transport; Tue, 15 Nov 2022 01:20:04 -0600
From: V sujith kumar Reddy <Vsujithkumar.Reddy@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
Subject: [PATCH 3/4] ASoC: SOF: amd: ADD HS and SP virtual DAI.
Date: Tue, 15 Nov 2022 12:49:55 +0530
Message-ID: <20221115072001.1931617-3-Vsujithkumar.Reddy@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221115072001.1931617-1-Vsujithkumar.Reddy@amd.com>
References: <20221115072001.1931617-1-Vsujithkumar.Reddy@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT080:EE_|CY5PR12MB6477:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c71a070-5b13-45a7-872b-08dac6d9d54d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lHRQmLtro3RLw7LnOE2QaJHg5zz6znwclGIvPNqSaFOoF2eHHbM0vlyxzbKC/xtaILB8xqK0b6osYzXBLR5nza1pmVjr+D6cTKUaA7eHdlwIHl7lRFdwxA1Ng8dQWP0DcbhC/AqE30wvyDiRH3+kHMGo+TSZYXui4lqlfHphmyUG6GWfG0vHP/FPTDqDoF2lLuxbj52GfiaGLonSbsJJikGZX+vn0sMX5TluC8ab9SSX4hZwQbYMYfkJcC/NKQbrAYZGVRIc/J/K9NYvSYTV9Dj0Z67ddx0l2XnWYOU1TaeMAYIKwWyqai20hkEU5htQvx0YuN00EelS8EODrHbA9EaKyWAtkCIRwixjAf1G9l2T7QivuZSPZSQWg9Upgy5iYejR5YSGofWmjWNBhIgRKpA+LQX6oC743t/kbss1ZgQwcmUo7OK7st9MkyqnhEXSq+9iM9DAPb73dphmq/lnclNjN5vHkrbPtX5Q02KWMK+ohp7A/wgc57TKLJpwcyNfOR8rrOKkw8yxF9UWDK6PXxSdsO13bhkfLNkjsQ9JdEWE81ftBFzXZRucwSWv2rftQwmJvBQdOMZdHZAMCGEV6QlJ1e44TPyuSuCrW2jH0nGZXOCacROO25OloaGjYoGZavgw33+ZQX/cVIE/XBPEi3DtT+LgH/wEUGlzDcnJQtVcAkU43i/X09o1imgbKMjcXEz+asHYE3oJlGYcnrrBeXtXF3uk1FLY8atC/onR2jYBp8RjXnEbm8eHaK5xIk4CaTHffYvv60zXFXkZMaNhNu1feqkwk7lKa35KBE4Z73A460XwfFGIf2vXpKhEuwHj
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(39860400002)(396003)(376002)(346002)(136003)(451199015)(46966006)(40470700004)(36840700001)(2906002)(36860700001)(70586007)(7416002)(4326008)(41300700001)(8936002)(70206006)(40460700003)(8676002)(82310400005)(5660300002)(40480700001)(86362001)(82740400003)(36756003)(81166007)(356005)(54906003)(478600001)(110136005)(26005)(316002)(6666004)(7696005)(47076005)(336012)(2616005)(426003)(1076003)(186003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2022 07:20:11.3614 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c71a070-5b13-45a7-872b-08dac6d9d54d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT080.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6477
Cc: Daniel Baluta <daniel.baluta@nxp.com>,
 Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 Sunil-kumar.Dommati@amd.com, ssabakar@amd.com,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, venkataprasad.potturu@amd.com,
 Bard Liao <yung-chuan.liao@linux.intel.com>, Basavaraj.Hiregoudar@amd.com,
 Takashi Iwai <tiwai@suse.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Vijendar.Mukunda@amd.com, V sujith kumar Reddy <Vsujithkumar.Reddy@amd.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, Ajit Kumar
 Pandey <AjitKumar.Pandey@amd.com>, open list <linux-kernel@vger.kernel.org>,
 "moderated list:SOUND - SOUND OPEN
 FIRMWARE \(SOF\) DRIVERS" <sound-open-firmware@alsa-project.org>
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

