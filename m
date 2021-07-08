Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C6A033C1883
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Jul 2021 19:39:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4CF44827;
	Thu,  8 Jul 2021 19:38:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4CF44827
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1625765973;
	bh=xBZMVQ3e798YpDLo+Y8NLGHrI7+0ThxT82PO8jMhPaM=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Jh++iSi00RU2h+KHAKBt1LYd8zudSFHzMw5qELvKNwWq9KqA11mjuCufM/KEVYQSc
	 iSuLQ0hCzOp1Wde1kn0d13UFg+TA4dKrWcn6iiHEPqFrMyvKseN/paBN5umqfrWX64
	 6l6iI5w3mRfrK3lmVDbbo7nYLtN1BivWWleK3pok=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A768DF8012A;
	Thu,  8 Jul 2021 19:38:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5082EF80249; Thu,  8 Jul 2021 19:38:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam07on2069.outbound.protection.outlook.com [40.107.212.69])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3478AF8012A
 for <alsa-devel@alsa-project.org>; Thu,  8 Jul 2021 19:37:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3478AF8012A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com
 header.b="kFrYOiR+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dTTOKOKfSyD1xjpjG282slR0JT7ZWncjiY0534R/l8/K3QSMgdNLRZsEbdSbj5/ZYe9boq21Xwm2gr7GE/793jW2i0KiswmAtfRcFynXILfCbfFzGK8F+QznMiBhrGhHBzB8EZFc1WLBYpEPUlB+9/ipJaeIP0CCiK4i/ChVNGp+iSsgP7x2HYlzNvxwYtTbdOBokTyCwRiGpNWofcqPq97+cOUB0zkPoDi+KoWcsAhVffc4pFhPaBJ9qef0mHSv5mWK1dau22Q6z46JJqgdO6V7ginta1iF0B5lrq+4WwqMQWhSrmZLEUOpx0ccYyuc+VntsDl5cTBSMsuuZnBHEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7oYXhM05LAoWghsr5jFSWLjZnWf6fILe8p6v1ZpVlL0=;
 b=fOZt01fyRLzhxYB6mU6WvNlbwShzy4Kl1B8DeuNQUBS6tj/6y5O6DVrWa0ujLFYDNsXd5V9o6tDtVPOe5kaebedVASc5lfkyQrfbjEqHwrV6UVljlgf6JWBMKvOR/v+eqePzwrwt0UFk3CAXkrJW+7WPNJyaqMo4q+n/8xW05Y3eew7Jo4jdPtuS6e5N9Yb5wp2AE45+YcP8AgGSQr9qaSqmPkqIvVM09oD/wtGmzcZ/L8qobuWPJKNogzMqky6F1Nye78P5rrlAlFwT7E/htJ319SIAqE+oWnyo+qE/R7zNXEdN8v4/JoHFLMoQeIb9SVw8T07AuzEgaEeXzzUSlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7oYXhM05LAoWghsr5jFSWLjZnWf6fILe8p6v1ZpVlL0=;
 b=kFrYOiR+BnVl8tNOdPxUAybv/KJuFTWJp9w1krA1k5fNV8uMztWIeanAsoUSjuy+z9c55eWQOHcAYQMA+k5VzdV2bM6L8+iwOAr79mZEVBRmsw4hbadu/j7O05fBabp14fO8dXqtFgwALfbaToitLiccbQUDVPd/dbXfTDX8ZUo=
Received: from DM6PR11CA0016.namprd11.prod.outlook.com (2603:10b6:5:190::29)
 by MWHPR12MB1392.namprd12.prod.outlook.com (2603:10b6:300:14::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.20; Thu, 8 Jul
 2021 17:37:53 +0000
Received: from DM6NAM11FT027.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:190:cafe::32) by DM6PR11CA0016.outlook.office365.com
 (2603:10b6:5:190::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.20 via Frontend
 Transport; Thu, 8 Jul 2021 17:37:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com;
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DM6NAM11FT027.mail.protection.outlook.com (10.13.172.205) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4308.20 via Frontend Transport; Thu, 8 Jul 2021 17:37:52 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Thu, 8 Jul 2021
 12:37:51 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Thu, 8 Jul 2021
 12:37:45 -0500
Received: from LinuxHost.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2242.4 via Frontend
 Transport; Thu, 8 Jul 2021 12:37:40 -0500
From: Vijendar Mukunda <vijendar.mukunda@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
Subject: [PATCH V3] ASoC: add a flag to reverse the stop sequence
Date: Thu, 8 Jul 2021 23:25:27 +0530
Message-ID: <20210708175529.13313-1-vijendar.mukunda@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 385271e9-803e-4ad1-5c96-08d942371d1e
X-MS-TrafficTypeDiagnostic: MWHPR12MB1392:
X-Microsoft-Antispam-PRVS: <MWHPR12MB13922AB94A760EDF879F698597199@MWHPR12MB1392.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ROoPgh8C00TJW2b9h8W4PgDeDVGet7WaVOsK3pMuvMnW/WXt04rB3ctJ6qEf+IUKEuQzrerJeChP8vPCXi3A6+pOurBAnHd+pAGgmQDQFiZgsLtcqQDJj7RPfkDLiu8+YXwMSCkct9XRwtNaTapGLmOHsD7TZtaSGi5aWtDtKktk6dTQ7c8Q75+u2hg8hFzhSXDESIEHUXlHd1bvol9n9rM8FX3lTGseF3074G5/1bsParFeohp0NrEW2s24gS3z/Zsla7zs3EdqbZ+pIPCGlgiq8dNXLkylyTMN7rSSsRgPIkJxYEK5AbbmqWloTxqIvSZmGjPVO+RvZ5HTeAfRvMJ4c7JPmBEDKrzOsl5pHOwbWnTNEkiPNzzilFzPzTatki7xSMLCctxbmAOKGyVmH/YFhwWSkPqCt7y6YVTc9DmXh5qdFk92+f+5TYxzLGFFZ+N1YotaIxFkSD5yN12ZWO26WCEUWOXJieKyd9TMkIytxUHQJz/CTB412gKKl5h1j/u7rQCqUmiZfJvSia7wJ8oWC+9Q8esiF1cr/cLdlbGddQKgqWKrwS9wQ9E6cPGBTvXzEuJIAMnHDN1aAiM3Bi1asusB17bsynqpgHNPOZ6B0+GFRMjDt0GwwCcDGow8c/Hximoi5kq20iebj5hhfeiXfW9WGlaer752Wt+/J2glA2KJFkD/8fx91xJ8LII/fonetGfMtAwQWjtjGV/gHTBmR8kyVDgIwrpylb9GGWU=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(346002)(396003)(376002)(39860400002)(136003)(46966006)(36840700001)(7416002)(81166007)(82740400003)(356005)(316002)(478600001)(70586007)(86362001)(36860700001)(5660300002)(26005)(70206006)(426003)(36756003)(336012)(186003)(2616005)(2906002)(47076005)(8936002)(82310400003)(44832011)(4326008)(110136005)(83380400001)(8676002)(1076003)(54906003)(6666004)(7696005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2021 17:37:52.7809 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 385271e9-803e-4ad1-5c96-08d942371d1e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT027.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1392
Cc: Sunil-kumar.Dommati@amd.com, amistry@google.com,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 open list <linux-kernel@vger.kernel.org>, Basavaraj.Hiregoudar@amd.com,
 Takashi Iwai <tiwai@suse.com>, Chuhong Yuan <hslester96@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Vijendar
 Mukunda <Vijendar.Mukunda@amd.com>, Alexander.Deucher@amd.com,
 nartemiev@google.com
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

From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>

On stream stop, currently CPU DAI stop sequence invoked first
followed by DMA. For Few platforms, it is required to stop the
DMA first before stopping CPU DAI.

For Stoneyridge platform, it is required to invoke DMA driver stop
first rather than invoking DWC I2S controller stop.
Introduced new flag in dai_link structure for reordering stop sequence.
Based on flag check, ASoC core will re-order the stop sequence.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
v2 -> v3: moved "stop_dma_first" flag from card structure
	  to dai_link structure and modified code to use
          "stop_dma_first" flag.
v1 -> v2: renamed flag as "stop_dma_fist"
          fixed build error by removing extra + symbol 
          sound/soc/soc-pcm.c:1019:3: error: expected expression before 'struct'
          1019 | + struct snd_soc_card *card = rtd->card; 

 include/sound/soc.h                  |  6 ++++++
 sound/soc/amd/acp-da7219-max98357a.c |  5 +++++
 sound/soc/soc-pcm.c                  | 22 ++++++++++++++++------
 3 files changed, 27 insertions(+), 6 deletions(-)

diff --git a/include/sound/soc.h b/include/sound/soc.h
index 675849d07284..8e6dd8a257c5 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -712,6 +712,12 @@ struct snd_soc_dai_link {
 	/* Do not create a PCM for this DAI link (Backend link) */
 	unsigned int ignore:1;
 
+	/* This flag will reorder stop sequence. By enabling this flag
+	 * DMA controller stop sequence will be invoked first followed by
+	 * CPU DAI driver stop sequence
+	 */
+	unsigned int stop_dma_first:1;
+
 #ifdef CONFIG_SND_SOC_TOPOLOGY
 	struct snd_soc_dobj dobj; /* For topology */
 #endif
diff --git a/sound/soc/amd/acp-da7219-max98357a.c b/sound/soc/amd/acp-da7219-max98357a.c
index 84e3906abd4f..9449fb40a956 100644
--- a/sound/soc/amd/acp-da7219-max98357a.c
+++ b/sound/soc/amd/acp-da7219-max98357a.c
@@ -576,6 +576,7 @@ static struct snd_soc_dai_link cz_dai_5682_98357[] = {
 				| SND_SOC_DAIFMT_CBM_CFM,
 		.init = cz_rt5682_init,
 		.dpcm_playback = 1,
+		.stop_dma_first = 1,
 		.ops = &cz_rt5682_play_ops,
 		SND_SOC_DAILINK_REG(designware1, rt5682, platform),
 	},
@@ -585,6 +586,7 @@ static struct snd_soc_dai_link cz_dai_5682_98357[] = {
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
 				| SND_SOC_DAIFMT_CBM_CFM,
 		.dpcm_capture = 1,
+		.stop_dma_first = 1,
 		.ops = &cz_rt5682_cap_ops,
 		SND_SOC_DAILINK_REG(designware2, rt5682, platform),
 	},
@@ -594,6 +596,7 @@ static struct snd_soc_dai_link cz_dai_5682_98357[] = {
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
 				| SND_SOC_DAIFMT_CBM_CFM,
 		.dpcm_playback = 1,
+		.stop_dma_first = 1,
 		.ops = &cz_rt5682_max_play_ops,
 		SND_SOC_DAILINK_REG(designware3, mx, platform),
 	},
@@ -604,6 +607,7 @@ static struct snd_soc_dai_link cz_dai_5682_98357[] = {
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
 				| SND_SOC_DAIFMT_CBM_CFM,
 		.dpcm_capture = 1,
+		.stop_dma_first = 1,
 		.ops = &cz_rt5682_dmic0_cap_ops,
 		SND_SOC_DAILINK_REG(designware3, adau, platform),
 	},
@@ -614,6 +618,7 @@ static struct snd_soc_dai_link cz_dai_5682_98357[] = {
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
 				| SND_SOC_DAIFMT_CBM_CFM,
 		.dpcm_capture = 1,
+		.stop_dma_first = 1,
 		.ops = &cz_rt5682_dmic1_cap_ops,
 		SND_SOC_DAILINK_REG(designware2, adau, platform),
 	},
diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index 46513bb97904..d1c570ca21ea 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -1015,6 +1015,7 @@ static int soc_pcm_hw_params(struct snd_pcm_substream *substream,
 
 static int soc_pcm_trigger(struct snd_pcm_substream *substream, int cmd)
 {
+	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
 	int ret = -EINVAL, _ret = 0;
 	int rollback = 0;
 
@@ -1055,14 +1056,23 @@ static int soc_pcm_trigger(struct snd_pcm_substream *substream, int cmd)
 	case SNDRV_PCM_TRIGGER_STOP:
 	case SNDRV_PCM_TRIGGER_SUSPEND:
 	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
-		ret = snd_soc_pcm_dai_trigger(substream, cmd, rollback);
-		if (ret < 0)
-			break;
+		if (rtd->dai_link->stop_dma_first) {
+			ret = snd_soc_pcm_component_trigger(substream, cmd, rollback);
+			if (ret < 0)
+				break;
 
-		ret = snd_soc_pcm_component_trigger(substream, cmd, rollback);
-		if (ret < 0)
-			break;
+			ret = snd_soc_pcm_dai_trigger(substream, cmd, rollback);
+			if (ret < 0)
+				break;
+		} else {
+			ret = snd_soc_pcm_dai_trigger(substream, cmd, rollback);
+			if (ret < 0)
+				break;
 
+			ret = snd_soc_pcm_component_trigger(substream, cmd, rollback);
+			if (ret < 0)
+				break;
+		}
 		ret = snd_soc_link_trigger(substream, cmd, rollback);
 		break;
 	}
-- 
2.17.1

