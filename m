Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B703A41DD2E
	for <lists+alsa-devel@lfdr.de>; Thu, 30 Sep 2021 17:17:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 195C416F7;
	Thu, 30 Sep 2021 17:16:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 195C416F7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633015054;
	bh=7YGKvRHxLfIrkaKy9M7+FjhLBnRhW/wt02GxCJF6lWM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PIORggwUJCEdt2uIBs7TKMjViKsjqTOgzfQYtSsdoc7KdSuWxoKuO5oeana0E7xQo
	 WxaLPZd+7ggoW/xaehsBB/BQuNEIofHkN8y8YCuflvLEwUxOYblejhCTLhMiBuySt0
	 RT9A3XwfoZ94deHwnlN/8hGAmRns3XdCpcrS1S3M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0AAAFF80543;
	Thu, 30 Sep 2021 17:11:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 202DDF804BC; Thu, 30 Sep 2021 15:28:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2073.outbound.protection.outlook.com [40.107.244.73])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CC88CF800F3
 for <alsa-devel@alsa-project.org>; Thu, 30 Sep 2021 15:28:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CC88CF800F3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com
 header.b="POMy67Vs"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a8AfbyCTLiMzDSoZsV/gKSy0oJko+OX5KMr1GrPRF3Xsxr2ksBwfn8NP5IDBw3WooKHC/W8tE4p/DnWDWHmva8OwhMJHSRneEQ/0ehhgL8ehj8N9YLPaXRpBVELApAGqqJYpOjYfQ74UjRXKJ1KhULKdzIGK5AhdQjEGKYUt/ZPwmDX7u0+gZwZ6yjxiKaAIyypHm4DOuHxDBrXMeaHR1OXk5Xdouqwz888tqyxbgpT2jnvKpPF/ZcfQLQtecfLCokN376FzrXz7dy+T3UWLWwrkQt4fqO7Tp/9iOJ9Z3Yp1Uqlk7+IYaQbFfsIIB6SeRWpkDf20NSSlFWxNKAiZLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=YGc/M2kPkVFVjdyBos2jQI8YoDlq5vyFMwnORr8mqbQ=;
 b=RJXObrx1swNpZWhEwqIXnA2ptioVy9zWteg8y0/v1K62Z+JOFonZIBaDEQ37qeYLal/WMoLDAsYS/AjRHpZED8gFz7UV0T5VgebDPRjSbXoE/zt7be+1rPh5rXdvQqTGF8/yNiivCXNmBO+lC08kLFE3KgcnPXIMW+ZioHdNQCGY4O2qnKGg8zKhyRtZrj/RrmTbXh639+ZsDpZRGByvE+QCA7OkLqEVIykTkP3tscdf8KLGdTw9D02TYoKWxz+OKgMwBdbTseDTtMwa8N7YuGZjZFc6iuZeXzoQoT4hRwT4dBrOwNr+Qb+bBnjCanCd1oi1d9971X0PETHFF7sXEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YGc/M2kPkVFVjdyBos2jQI8YoDlq5vyFMwnORr8mqbQ=;
 b=POMy67VsZGF5jugabsXVq6HvXtg33GrvbrURhZvnzCb/D+kZKnhb+MG8h6D5ouVdl0Hen9W1eIEnoyX1xwbgTOpAQZjaSb5fY8aa6YebQsXD8i14Obv2GdiBxNfG6jIr+Vlr24rQW3GrCk7xKHYEclxyUHXWA2ihlzvEQjH8K9M=
Received: from BN6PR1201CA0010.namprd12.prod.outlook.com
 (2603:10b6:405:4c::20) by BY5PR12MB4195.namprd12.prod.outlook.com
 (2603:10b6:a03:200::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.14; Thu, 30 Sep
 2021 13:28:32 +0000
Received: from BN8NAM11FT013.eop-nam11.prod.protection.outlook.com
 (2603:10b6:405:4c:cafe::db) by BN6PR1201CA0010.outlook.office365.com
 (2603:10b6:405:4c::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.14 via Frontend
 Transport; Thu, 30 Sep 2021 13:28:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT013.mail.protection.outlook.com (10.13.176.182) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4566.14 via Frontend Transport; Thu, 30 Sep 2021 13:28:31 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.8; Thu, 30 Sep
 2021 08:28:30 -0500
Received: from chrome.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2308.8 via Frontend
 Transport; Thu, 30 Sep 2021 08:28:26 -0500
From: Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
Subject: [PATCH 8/8] ASoC: amd: acp: Add support for RT5682-VS codec
Date: Thu, 30 Sep 2021 18:54:18 +0530
Message-ID: <20210930132418.14077-9-AjitKumar.Pandey@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210930132418.14077-1-AjitKumar.Pandey@amd.com>
References: <20210930132418.14077-1-AjitKumar.Pandey@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 75f62235-d46b-471d-53ec-08d984163254
X-MS-TrafficTypeDiagnostic: BY5PR12MB4195:
X-Microsoft-Antispam-PRVS: <BY5PR12MB419517D9010010E75E25B6D382AA9@BY5PR12MB4195.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1417;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: buzWa7mh8FUPndaSWZJCvgsCpGWjkyKv/KEazxvRHYTI7JUSw5jObX9plfSUFXrd1CpkuPoLzjz51Cvc8qezwsw3DcgBmWsX2v+fDBNb0IrXRWEJIccEsDVJyM2EGdUuo/ipEzb7aikwpVtiawfSXtAZqQDGJG88bxxBvjIUhwVYEqJOJ7iI8GD9aaETEStNGfvsy9eet6ekIAf1Hzw92ZgoE8sYuuPcoB7GIiXLbXjkIJ8oLQWLwXy1v7eq9gJR1aCldnEi1h+HCy095aCHJGsQa970Vq4KReHrGrRx1x9XZqVpNRblBZV4/LPbov+NFzZ2T5313TSJO8rHOW1ST/zsTjmf6ZyqaX0ovo+YJqsvQFKbfniw2pXLjC24vA0KaXMGyrxPIcreIUPB/ov6ixK4HWVP6P5hBX2KtWklBZmv9nDSAZ2GX/JVQur4mc5lqQp0IjTPOypaBFLhrSTweea1JkqJHW+dqPWRcJusY/qlb/jks6kCs+Zf/pRWg1Pi2h31qVrzdPQYUsBlgIY8k8w8r3m+xHQaaitqSRylGcQ+9ZvJbXgcpgO9891ypeI2j+T/vuq6LMHjenkLnExFPWDnafhjhcnIEiDoaaLB81MULBg8mGKbubualCX5qRSyO9aIb7WFIsVszbzoqEKOiUqoxt5Eq017VWvaboHQdB7HA96//XWJr+obuJzpgcleo10dc7zIt7LGK/G7yYqJp8jaF3xzV/EvRVdbIiAH1Vw=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(46966006)(36840700001)(86362001)(356005)(508600001)(47076005)(1076003)(316002)(6666004)(82310400003)(81166007)(36860700001)(26005)(7696005)(186003)(5660300002)(2906002)(8676002)(426003)(36756003)(110136005)(54906003)(8936002)(336012)(70206006)(2616005)(4326008)(70586007)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2021 13:28:31.7735 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 75f62235-d46b-471d-53ec-08d984163254
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT013.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4195
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

Add new codec endpoints and define components to support RT5682-VS
variants of codec with ACP machines.

Signed-off-by: Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>
---
 sound/soc/amd/acp/Kconfig           |  1 +
 sound/soc/amd/acp/acp-mach-common.c | 25 +++++++++++++++++++++++++
 sound/soc/amd/acp/acp-mach.h        |  1 +
 3 files changed, 27 insertions(+)

diff --git a/sound/soc/amd/acp/Kconfig b/sound/soc/amd/acp/Kconfig
index 8257b8e1e7cc..7e3c32f5b982 100644
--- a/sound/soc/amd/acp/Kconfig
+++ b/sound/soc/amd/acp/Kconfig
@@ -31,6 +31,7 @@ config SND_SOC_AMD_MACH_COMMON
 	select SND_SOC_DMIC
 	select SND_SOC_RT1019
 	select SND_SOC_MAX98357A
+	select SND_SOC_RT5682S
 	depends on X86 && PCI && I2C
 	help
 	 This option enables common Machine driver module for ACP
diff --git a/sound/soc/amd/acp/acp-mach-common.c b/sound/soc/amd/acp/acp-mach-common.c
index 80c6cd220674..5e7da4515e5e 100644
--- a/sound/soc/amd/acp/acp-mach-common.c
+++ b/sound/soc/amd/acp/acp-mach-common.c
@@ -23,6 +23,7 @@
 
 #include "../../codecs/rt5682.h"
 #include "../../codecs/rt1019.h"
+#include "../../codecs/rt5682s.h"
 #include "acp-mach.h"
 
 #define PCO_PLAT_CLK 48000000
@@ -64,6 +65,9 @@ static int acp_clk_enable(struct acp_card_drvdata *drvdata)
 SND_SOC_DAILINK_DEF(rt5682,
 	DAILINK_COMP_ARRAY(COMP_CODEC("i2c-10EC5682:00", "rt5682-aif1")));
 
+SND_SOC_DAILINK_DEF(rt5682s,
+		    DAILINK_COMP_ARRAY(COMP_CODEC("i2c-RTL5682:00", "rt5682s-aif1")));
+
 static const struct snd_soc_dapm_route rt5682_map[] = {
 	{ "Headphone Jack", NULL, "HPOL" },
 	{ "Headphone Jack", NULL, "HPOR" },
@@ -135,6 +139,19 @@ static int acp_asoc_hs_init(struct snd_soc_pcm_runtime *rtd)
 				   | SND_SOC_DAIFMT_CBP_CFP;
 		snd_soc_dapm_add_routes(&rtd->card->dapm, rt5682_map, ARRAY_SIZE(rt5682_map));
 		break;
+	case RT5682S:
+		pll_id = RT5682S_PLL2;
+		pll_src = RT5682S_PLL_S_MCLK;
+		freq_in = PCO_PLAT_CLK;
+		freq_out = RT5682_PLL_FREQ;
+		clk_id = RT5682S_SCLK_S_PLL2;
+		clk_freq = RT5682_PLL_FREQ;
+		wclk_name = "rt5682-dai-wclk";
+		bclk_name = "rt5682-dai-bclk";
+		drvdata->dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
+				   | SND_SOC_DAIFMT_CBM_CFM;
+		snd_soc_dapm_add_routes(&rtd->card->dapm, rt5682_map, ARRAY_SIZE(rt5682_map));
+		break;
 	default:
 		dev_err(rtd->dev, "Invalid codec id %d\n", drvdata->hs_codec_id);
 		return -EINVAL;
@@ -401,6 +418,10 @@ int acp_sofdsp_dai_links_create(struct snd_soc_card *card)
 			links[i].codecs = rt5682;
 			links[i].num_codecs = ARRAY_SIZE(rt5682);
 		}
+		if (drv_data->hs_codec_id == RT5682S) {
+			links[i].codecs = rt5682s;
+			links[i].num_codecs = ARRAY_SIZE(rt5682s);
+		}
 		i++;
 	}
 
@@ -492,6 +513,10 @@ int acp_legacy_dai_links_create(struct snd_soc_card *card)
 			links[i].codecs = rt5682;
 			links[i].num_codecs = ARRAY_SIZE(rt5682);
 		}
+		if (drv_data->hs_codec_id == RT5682S) {
+			links[i].codecs = rt5682s;
+			links[i].num_codecs = ARRAY_SIZE(rt5682s);
+		}
 		i++;
 	}
 
diff --git a/sound/soc/amd/acp/acp-mach.h b/sound/soc/amd/acp/acp-mach.h
index b6a43d1b9ad4..5dc47cfbff10 100644
--- a/sound/soc/amd/acp/acp-mach.h
+++ b/sound/soc/amd/acp/acp-mach.h
@@ -36,6 +36,7 @@ enum codec_endpoints {
 	RT5682,
 	RT1019,
 	MAX98360A,
+	RT5682S,
 };
 
 struct acp_card_drvdata {
-- 
2.25.1

