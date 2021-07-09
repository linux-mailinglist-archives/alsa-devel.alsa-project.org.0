Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7865A3C1EAF
	for <lists+alsa-devel@lfdr.de>; Fri,  9 Jul 2021 06:56:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7A8CE1660;
	Fri,  9 Jul 2021 06:55:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7A8CE1660
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1625806594;
	bh=zKQkJZ+rFOVoBxFBFtvaZWLg+xN2GH6lypeb2dxPprY=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=pJzHt2XmE9eSJANJ6w+FDiVXgQkmnZIK3yQjwNTAB/Tkrt47TCsEGjbxuKP5kOvF0
	 K0riDPO1I8msdU8NMgvFQD5XIxXV46CpNCFkw+n270Qo1ZX+MkyzGNNB0c7xQnJHuK
	 2SaqoTWwJ/Ulkx/vHr5gqgUIS2CN/akfpnWuJfQ4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 01162F80224;
	Fri,  9 Jul 2021 06:55:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6668CF802E3; Fri,  9 Jul 2021 06:55:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2049.outbound.protection.outlook.com [40.107.220.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4C08CF80171
 for <alsa-devel@alsa-project.org>; Fri,  9 Jul 2021 06:55:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4C08CF80171
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com
 header.b="OH/73Dmk"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f2BwB+gcoc5fnCly6VNhxOQ6lBAyYE7QdYhZoR26o8hC45XckB9mINbfYtT3RItfztofph56V5HeCYH73v/ZNVfkK5X25YsDHghJ/RSEvf3D3StZthJZ4iFlT1+qyBmLzV2IV1AhFHIu+YKn5Pqq5ZP6vLQR1VquCo8nciaeA5WNhaFSCyERyg+Hmtwf83x83zMBuavuZ7aMc4O1MetVJWXPlsFU1qq10Kv1BL2spNcRQU0u35W3jY2rYyVR+aNlY1O/UXYvok/VoJ/Db8iA3rilLawliC3xABMM73/Y1MV5bI30m+n7HGOJkGtPdk0DGZ5yA6tEdCgxG+KmWgSHBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vGbtMRFspTrF/tQHFvcAvgi8cQ+KTsb0dWZYjYtK+HI=;
 b=SN/hdhK1POzWiARpzDQwqdRcSDcSIm80eDsmAfq8qNCFKF0jFm9aN6eWRtCBl9zLqJqBDNz+MJVC7HeiBqAk8kh8Hp+/E08fMyjv8VpjvgDbY3olM7YcejmI4CpEdm61EidkuJ9iQyP/1QqPsmlnFzHGJvox10ZbnToNZ5Ud80ikpX8UhYpAimZu1SISEM1rXE6WtWb6u1jQF8IQ0URGs6/7y8pwRUFDtShtLz8efrkvgeY0mGrFuRlIl00xYaij0gJbVZ5G3cYaZ1vZF3VAiYF6D5oY8q0lPGUGv/ISRYgASXOo8ESv+r3jrr919WO2gXFeV1BEiOqM5+7Yk5Zyag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vGbtMRFspTrF/tQHFvcAvgi8cQ+KTsb0dWZYjYtK+HI=;
 b=OH/73Dmk1fqGb9ZVLAdGiy0KnUf4IVXV5pyRfcOb9spLIPyE1ULjrK0BWLvGhSfTB7lxRJ5i+ELnhZsYKhBAWpeILcacEhWNJN2gkZttcx0LoJw4HHFYvANbrCoWvgvDnCdPU0hGu+VnmrIqwtlZLsoOrM+SmBV2Ce+tN6bBDB4=
Received: from DM5PR15CA0067.namprd15.prod.outlook.com (2603:10b6:3:ae::29) by
 CH2PR12MB5562.namprd12.prod.outlook.com (2603:10b6:610:67::17) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4287.23; Fri, 9 Jul 2021 04:55:29 +0000
Received: from DM6NAM11FT033.eop-nam11.prod.protection.outlook.com
 (2603:10b6:3:ae:cafe::a) by DM5PR15CA0067.outlook.office365.com
 (2603:10b6:3:ae::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.20 via Frontend
 Transport; Fri, 9 Jul 2021 04:55:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com;
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DM6NAM11FT033.mail.protection.outlook.com (10.13.172.221) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4308.20 via Frontend Transport; Fri, 9 Jul 2021 04:55:29 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Thu, 8 Jul 2021
 23:55:28 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Thu, 8 Jul 2021
 21:55:28 -0700
Received: from LinuxHost.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2242.4 via Frontend
 Transport; Thu, 8 Jul 2021 23:55:23 -0500
From: Vijendar Mukunda <vijendar.mukunda@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
Subject: [PATCH v4] ASoC: soc-pcm: add a flag to reverse the stop sequence
Date: Fri, 9 Jul 2021 10:43:08 +0530
Message-ID: <20210709051311.22664-1-vijendar.mukunda@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c91d020e-9dba-44c1-5907-08d94295c65d
X-MS-TrafficTypeDiagnostic: CH2PR12MB5562:
X-Microsoft-Antispam-PRVS: <CH2PR12MB5562E474B10A5AB8B896E9AD97189@CH2PR12MB5562.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:561;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZCjUrhMfQ5SIhfvJWjkMaCBsAKU2taaWF0ZO+m1llo+z+yEZ/tLJZ7yHQrQI5H3Do3NnIAliD6C0/ua3V13Uz8MsiAMcfFP8zdHY4IEBitdbCibx9tiWmQsZhlfjEXbQOYgqXfcdICUWnkY+tHDyJBxQXtc4yVUCy3srYHRfkAKsBWGbYPydH92hgO8YvbcmPWir7b6KtYDyQI4O88xD0zaQkMQAKd/wRsOFYmV2r7Xx5CBXth6Fl0aJu3R0ngMEvtNOsWWfVwBaFZDSMgOmUq+eC55lZ1xkLImiaGxcdDybWvBROBgZMGVBOS47Ho8SmpHIPJgCaED4gOno2QWf81wSnMJFaBmcROUG98YOO7bSulVXCgx+x93B+2Xo/Fjrw+hyeO8iekIESq4jpWP0wzO/ibKm7FBjhHDXyZ5xbEx5x7wcSQON3hZ21TJzZSgGvBh+pEczIeuseRXTJaH/hCHqG/m+b9xZbuTsYWAsE2nNzwG7uJ3ik5rX2LWaJQ9A4HQ7t3fp8as5UMpcLpFa5YQcP9/ppKcCYXsLKTqY1pW5gFJqDUnlqK7kY1y6GjSmq5sCfjiIq15968mUDpYlmpplPum4pwM5Y15UcyoM15EuHrEFMm3m36yI2BCLm2eTrXxCGMZeDfoXy6pHes5vnr+vI22POOkYzrNTV20hET2W7XsXGVG0EwPnLv/9Z19y/bckWowDDnAkGezDu09Qh1KSAVgZW7n6b3+GjwD8rDc=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(376002)(136003)(39860400002)(396003)(346002)(36840700001)(46966006)(5660300002)(110136005)(81166007)(36756003)(36860700001)(83380400001)(4326008)(426003)(8676002)(54906003)(7416002)(8936002)(82740400003)(1076003)(82310400003)(44832011)(2906002)(26005)(70206006)(478600001)(70586007)(6666004)(7696005)(186003)(47076005)(2616005)(336012)(356005)(316002)(86362001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2021 04:55:29.4183 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c91d020e-9dba-44c1-5907-08d94295c65d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT033.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB5562
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Sunil-kumar.Dommati@amd.com, amistry@google.com, Kuninori
 Morimoto <kuninori.morimoto.gx@renesas.com>,
 open list <linux-kernel@vger.kernel.org>, Basavaraj.Hiregoudar@amd.com,
 Takashi Iwai <tiwai@suse.com>, Chuhong Yuan <hslester96@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Peter Ujfalusi <peter.ujfalusi@ti.com>,
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>, Alexander.Deucher@amd.com,
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

Fixes: 4378f1fbe92405 ("ASoC: soc-pcm: Use different sequence for start/stop trigger")
Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---

v3 -> v4: Updated Fixes tag in commit message

v2 -> v3: moved "stop_dma_first" flag from card structure
	  to dai_link structure and modified code to use.
	  "stop_dma_first" flag in acp machine driver and
	  soc pcm trigger api

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

