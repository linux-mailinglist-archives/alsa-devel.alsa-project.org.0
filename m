Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AF5841DD29
	for <lists+alsa-devel@lfdr.de>; Thu, 30 Sep 2021 17:17:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DDAE016F5;
	Thu, 30 Sep 2021 17:16:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DDAE016F5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633015030;
	bh=JNFl1rrmW8VkbrosU7DjirbsUBlzSHBLfNF5D3Evwcw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=t1bMENX/bH3gUOywBLG3NBwkvv3ZgSNZRmYv6Svg4LHHykIqVp38rG9AVgE8t96Pl
	 rSoZImp+O3Sz016f4IaQ7Wz5EsSiC05BwDiTeIJcDmBEp5c/eQzbEp3RXagmQ6PpU0
	 3d9TBsYbqTyd7O684oj08jZTIDsSjmwyj8QheHbU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ED2A9F8053A;
	Thu, 30 Sep 2021 17:11:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E78C3F804AD; Thu, 30 Sep 2021 15:28:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam07on2075.outbound.protection.outlook.com [40.107.212.75])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E3F6BF80218
 for <alsa-devel@alsa-project.org>; Thu, 30 Sep 2021 15:28:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E3F6BF80218
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com
 header.b="hMZShMl2"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gWXBYxbw4c69D5PUbL3bQF41suF/xNaYRtqd/TnGCZeqbNCZvfs1/9ey6GMITYQonTqCarsdNa1VIXJlRqf8x0RcxIpxtJdJNjVR4pHN30122KYNIBo2cZKdRegsmFP7J252J1l/420s+h1QGHoy7hFYlPlSb+O3zodW/Wx+/+LOuXCgxQ+NBk/9EXFhci4PbHti3j4hGQbjyxZ3hV3RbnHbehFqUsv5IjLMOQHiRUBeojOQxRlK3Su1uE8gt+SR+Xjb43/iHubVSCvNmDkKG/hURssrhwPtbN10Vl1WvI4gm8Zv34AcOlqcuNDB/UItwb8AgXIOE0ItwxdvMi1RZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=q1HCDkNERSbSY9nu3mO6h0iyX7gg3D9ookWe3s+HogI=;
 b=CalERg/gJa+MHSRLO+j5IMN5ZoryaJPhHwpCd884W6yUr13pXKDYHg8eYUzUGR8UjLrw/kzx2QdwimH3WMSYPEiG3QxB+05ss5wBOcjQqHxM8oC36ha1rUjkqBNimkVkEwf7X4mSPUaFhxqR3kr0lKkKKDopbg4gZztT7CL9YmTWcy3V3H/WyxCsL74h0QV3fteBra+TnEJYcIQnATPIidmYUZPOe6aGsQgxE9twEiFkWYg2tOjUflRQ1OzZclESWuQA/gfHGJxmakBqwLuPW3mohcMnAlj1w34zsVfqIjkqI3xj8Md9LtyQKtKks5lPlvy0e/tGrOltU2bc3bOYag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q1HCDkNERSbSY9nu3mO6h0iyX7gg3D9ookWe3s+HogI=;
 b=hMZShMl2euSWpkr4QYTWwvgQZMr1OSjgI5DDkemEwg0lDSpK110q/SZ9NUzNUkhKgLMLvxVc6PTku5a6QRZoh6b8gN5W3WVxyrpYISUUki7MZdT3d9Soy7WxuTWTJTE0ykcqflQQgZjugeDuwCao5XRe9hq3mbUebHR+Eo9EkMU=
Received: from MW4PR04CA0203.namprd04.prod.outlook.com (2603:10b6:303:86::28)
 by MN2PR12MB3901.namprd12.prod.outlook.com (2603:10b6:208:16c::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.18; Thu, 30 Sep
 2021 13:28:16 +0000
Received: from CO1NAM11FT011.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:86:cafe::35) by MW4PR04CA0203.outlook.office365.com
 (2603:10b6:303:86::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.15 via Frontend
 Transport; Thu, 30 Sep 2021 13:28:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com;
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1NAM11FT011.mail.protection.outlook.com (10.13.175.186) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4566.14 via Frontend Transport; Thu, 30 Sep 2021 13:28:13 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.8; Thu, 30 Sep
 2021 08:28:12 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.8; Thu, 30 Sep
 2021 08:28:12 -0500
Received: from chrome.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2308.8 via Frontend
 Transport; Thu, 30 Sep 2021 08:28:08 -0500
From: Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
Subject: [PATCH 7/8] ASoC: amd: acp: Add support for Maxim amplifier codec
Date: Thu, 30 Sep 2021 18:54:17 +0530
Message-ID: <20210930132418.14077-8-AjitKumar.Pandey@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210930132418.14077-1-AjitKumar.Pandey@amd.com>
References: <20210930132418.14077-1-AjitKumar.Pandey@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c12b7799-c551-4f50-3879-08d9841627a8
X-MS-TrafficTypeDiagnostic: MN2PR12MB3901:
X-Microsoft-Antispam-PRVS: <MN2PR12MB3901613C9FCFC626A2FAE59882AA9@MN2PR12MB3901.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1388;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: upUhhFLx4a8tkSvX62V4tLjzYjQdM0Keacx2WiAl8yZlkOB+cozAT+RqGneygMJcY8hzQI1k1QMDJhK6zGgI6Vyj366WZTBWodEuy9gEm9ZpONxQrP6Cypq5BLWMbdIOji5OCagVSzXjmT4sS++tGDdORNLkFcFctuCIZFwyp0rS3Huyvz85jkCqpCNNmLCcmmL0wPNGHCDj/HXlUPnTHL+uBOlrkz3IXhTNFAxQ1TDMTgkTdN8kgbPwl0UmnlOPSXkqnCVXmcGVpobV3oqusYCcghV0ZmqilNlhZdOaCo7RfuBwCKSOCCq+41IB+/VYR3FhK3QaoWrVZDpnyf095BE+B+dxIvX8gTVQvNBo4st45xTRVHhYj2mBFdxZ82JH10DIhkRuEYiOo6xQaep09S27i06jYpwiiNmlxxsjrD/p+bppMOCJRXEhx4ggQRFMfNBlIhq3PfvIyJnjylXtWYgI3TpSAaadI4ymGegqOJrYu3f1ftsgbXYXuWpcmZBJI3aRwInl2ObP/MO4S/nsKJbWg76UAKVFNUh0uvSurH5c8jXgmrgMwJvvoLB3VsrfOLGGYxoDy5gBLpzm9PEqgLC/op7iVLHvn71Drslbc6RUcGcxf2AMWVW63vMnaTree3EzOroRFKaaKQxDt9r2Axn9E/3uEOikr9sqSrnfsKUrcSuqTPOi2X7gx55eJz5dmNzN5SilXdMuQ3x/ycFyIwMfstEWpOJjdfcD5SspFbQ=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(36840700001)(46966006)(2906002)(86362001)(54906003)(70206006)(110136005)(7696005)(36756003)(316002)(8936002)(186003)(6666004)(508600001)(26005)(8676002)(5660300002)(336012)(47076005)(426003)(81166007)(1076003)(82310400003)(70586007)(36860700001)(2616005)(4326008)(356005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2021 13:28:13.7496 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c12b7799-c551-4f50-3879-08d9841627a8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT011.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3901
X-Mailman-Approved-At: Thu, 30 Sep 2021 17:11:01 +0200
Cc: Sunil-kumar.Dommati@amd.com, Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>,
 open list <linux-kernel@vger.kernel.org>, Basavaraj.Hiregoudar@amd.com,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Vijendar.Mukunda@amd.com, Alexander.Deucher@amd.com
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

Add a new codec id for MAX98360A amplifier in codec list and define
maxim components and audio route in common machine driver code.

Signed-off-by: Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>
---
 sound/soc/amd/acp/Kconfig           |  1 +
 sound/soc/amd/acp/acp-mach-common.c | 21 +++++++++++++++++++++
 sound/soc/amd/acp/acp-mach.h        |  1 +
 3 files changed, 23 insertions(+)

diff --git a/sound/soc/amd/acp/Kconfig b/sound/soc/amd/acp/Kconfig
index 55dda516a0d0..8257b8e1e7cc 100644
--- a/sound/soc/amd/acp/Kconfig
+++ b/sound/soc/amd/acp/Kconfig
@@ -30,6 +30,7 @@ config SND_SOC_AMD_MACH_COMMON
 	select SND_SOC_RT5682_I2C
 	select SND_SOC_DMIC
 	select SND_SOC_RT1019
+	select SND_SOC_MAX98357A
 	depends on X86 && PCI && I2C
 	help
 	 This option enables common Machine driver module for ACP
diff --git a/sound/soc/amd/acp/acp-mach-common.c b/sound/soc/amd/acp/acp-mach-common.c
index cc507c520317..80c6cd220674 100644
--- a/sound/soc/amd/acp/acp-mach-common.c
+++ b/sound/soc/amd/acp/acp-mach-common.c
@@ -91,6 +91,14 @@ static struct snd_soc_codec_conf rt1019_conf[] = {
 	},
 };
 
+/* Declare Maxim codec components */
+SND_SOC_DAILINK_DEF(max98360a,
+	DAILINK_COMP_ARRAY(COMP_CODEC("MX98360A:00", "HiFi")));
+
+static const struct snd_soc_dapm_route max98360a_map[] = {
+	{"Spk", NULL, "Speaker"},
+};
+
 /* Declare DMIC codec components */
 SND_SOC_DAILINK_DEF(dmic_codec,
 		DAILINK_COMP_ARRAY(COMP_CODEC("dmic-codec", "dmic-hifi")));
@@ -248,6 +256,9 @@ static int acp_asoc_amp_init(struct snd_soc_pcm_runtime *rtd)
 	case RT1019:
 		return snd_soc_dapm_add_routes(&rtd->card->dapm, rt1019_map_lr,
 					       ARRAY_SIZE(rt1019_map_lr));
+	case MAX98360A:
+		return snd_soc_dapm_add_routes(&rtd->card->dapm, max98360a_map,
+					       ARRAY_SIZE(max98360a_map));
 	default:
 		dev_err(card->dev, "Invalid AMP id: %d\n", drvdata->amp_codec_id);
 		return -EINVAL;
@@ -286,6 +297,8 @@ static int acp_card_amp_hw_params(struct snd_pcm_substream *substream,
 				return ret;
 			}
 		break;
+	case MAX98360A:
+		break;
 	default:
 		dev_err(card->dev, "Invalid AMP id: %d\n", drvdata->amp_codec_id);
 		return -EINVAL;
@@ -414,6 +427,10 @@ int acp_sofdsp_dai_links_create(struct snd_soc_card *card)
 			card->codec_conf = rt1019_conf;
 			card->num_configs = ARRAY_SIZE(rt1019_conf);
 		}
+		if (drv_data->amp_codec_id == MAX98360A) {
+			links[i].codecs = max98360a;
+			links[i].num_codecs = ARRAY_SIZE(max98360a);
+		}
 		i++;
 	}
 
@@ -499,6 +516,10 @@ int acp_legacy_dai_links_create(struct snd_soc_card *card)
 			card->codec_conf = rt1019_conf;
 			card->num_configs = ARRAY_SIZE(rt1019_conf);
 		}
+		if (drv_data->amp_codec_id == MAX98360A) {
+			links[i].codecs = max98360a;
+			links[i].num_codecs = ARRAY_SIZE(max98360a);
+		}
 	}
 
 	card->dai_link = links;
diff --git a/sound/soc/amd/acp/acp-mach.h b/sound/soc/amd/acp/acp-mach.h
index 464fb7eb802d..b6a43d1b9ad4 100644
--- a/sound/soc/amd/acp/acp-mach.h
+++ b/sound/soc/amd/acp/acp-mach.h
@@ -35,6 +35,7 @@ enum codec_endpoints {
 	DUMMY = 0,
 	RT5682,
 	RT1019,
+	MAX98360A,
 };
 
 struct acp_card_drvdata {
-- 
2.25.1

