Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D8D635A390F
	for <lists+alsa-devel@lfdr.de>; Sat, 27 Aug 2022 19:03:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 85DB1163D;
	Sat, 27 Aug 2022 19:02:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 85DB1163D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1661619805;
	bh=i+mAwXJow1pzaEGFP2dbEBahvDTAlOh2He3rXMCU4jA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ld0oDWXxRdAch1JKSLPWEggKjGU+4xpqC07xLct9jr4XOhVlXaKYk6N2j4+DRivKF
	 8UBj5q5kd6tZ8SUky1NfqIht6pBuiP6I5/NfXH/L3KJ85Uj7a5t8UCCD7bHVNSMiCd
	 hF7LsC5GB6g2XdasnAHx4hlwM5FXZRvfPjzVrMGo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8ABC4F802E8;
	Sat, 27 Aug 2022 19:01:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 00267F802E8; Sat, 27 Aug 2022 19:00:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam07on2046.outbound.protection.outlook.com [40.107.212.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D65B2F802E8
 for <alsa-devel@alsa-project.org>; Sat, 27 Aug 2022 19:00:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D65B2F802E8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com
 header.b="41jwp1/h"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c0VkAMu4Ar2Q75qGc4V9jzeRauePHEw4AWOHXQ3FZ6d1iu5eZm5N4MpAY6fqqnYX6evbFKjA+S401Z0vxqOIfIeXzsYaYq00miQQKz73Oh7+V31J74TwfioUIEU5J9nfifCmiKDXOcYGcCt8/tsc5eQtkZfSi/iZ1glchClT238N5QFfaVoS8qIXgwDYsUTEsOW1Uov/GpKwsKmfiuewxaMkq7uAhUjIeUixzsSrGy3AQZI+Pmac0IU+zWtUzeCVoDULXMcAIBoSYSB6BxL9orXHlB9tl9h1FQ6VgRh7tdaetEeYm4rWtl9vs5hBLadKRG/TcbNu9Z8NmV/lI7gzBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GUVqbegoaAbedst9IwEttr4om4QfKduQQCj3uRVe758=;
 b=EG5+t77Tj6b8IS3Zv+951k12HzoxfeV3JgreMSNl4Kyv+/rFB+GMg2MigI0YTwNu+grzq02J2LnFRmwcnUgXS3gxGY1nRd4MORCn/1OOo1+TZBVGDM1IEMEdjDS6zKgW0tkjGGGPKU02x3JhSJbmQMY1aFXfoAOoepssx42zwU41PNU5XqNrfRa1n7uyLT0/85O9+2RejShnFFmYoaX/UL7WIXnmY/wNWDHs1GhY2ihqMdlyy3w7XMCY7bDoCnRtY3qASbUGUckSseUifL5yybOseDkwfwhDuFYnITOaknJZbF5O4AD2LybY8j0MKLrl20NFM3W0j77K4wWjtVtsLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GUVqbegoaAbedst9IwEttr4om4QfKduQQCj3uRVe758=;
 b=41jwp1/h3QCD9gtt9rkHdu11OW9SYwYZe6FDyyt05GXujSj3VTEINSeF3m+QyFDDGpFugCH4OM+6X0tj26OFunNgwOfFTnBtwZHc+sa9r3NJlFQCKs9BofbU3lfOR/vwaff2xTfUtrA9yB1ShA1MczXaY9NpGf74TrUJHht8V10=
Received: from DM6PR08CA0030.namprd08.prod.outlook.com (2603:10b6:5:80::43) by
 BN9PR12MB5242.namprd12.prod.outlook.com (2603:10b6:408:11f::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15; Sat, 27 Aug
 2022 17:00:40 +0000
Received: from DM6NAM11FT101.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:80:cafe::18) by DM6PR08CA0030.outlook.office365.com
 (2603:10b6:5:80::43) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.19 via Frontend
 Transport; Sat, 27 Aug 2022 17:00:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DM6NAM11FT101.mail.protection.outlook.com (10.13.172.208) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5566.15 via Frontend Transport; Sat, 27 Aug 2022 17:00:40 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Sat, 27 Aug
 2022 12:00:39 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Sat, 27 Aug
 2022 10:00:39 -0700
Received: from amd-B450M-DS3H.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.28 via Frontend
 Transport; Sat, 27 Aug 2022 12:00:33 -0500
From: Syed Saba Kareem <Syed.SabaKareem@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
Subject: [PATCH v2 10/13] ASoC: amd: enable Pink Sardine acp6.2 drivers build
Date: Sat, 27 Aug 2022 22:26:54 +0530
Message-ID: <20220827165657.2343818-11-Syed.SabaKareem@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220827165657.2343818-1-Syed.SabaKareem@amd.com>
References: <20220827165657.2343818-1-Syed.SabaKareem@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4acafe1b-eee6-47ab-4617-08da884dabbb
X-MS-TrafficTypeDiagnostic: BN9PR12MB5242:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FTEXyRE74hAslhxAbroZHVd2V6/fxj+eRmjR7/wXUysah0Fv/rHB9ygUw/u0euZhO77IPK4dGc3A7BDe4EiLOHYgpeSaqRYnQ3BS340QXwDfo/J4R1x9RG++H7EOf/vpfByPcq4ed7fGbJAGvczuNRtFZ52fEzIzzJHy73DJNAhhDmX9Ncxv/XiSJwFzz3tNfUV3/r88ALMuqrX60oH5wwKEgOLRuDvRxJY4QUjPViHx50/GPj+TjNKnAuxI/4VSUjWAijLEl1Z2o3iRk+qWd/+bHh84HyRaUwWwcIGA9NanWF/e7qeSCrofHiJ4TLnV5sFzmEmnodS7A8B1No8f3fGeh+JZJeHqhpZXPWnh6KYrA7gpJLMOvWa4btWt0LGGR95cRTdRhs3a+hJI8/I9JjEwXVcQXI6akAbz6T0HvnROuc2dIh+ORM9XisKdKeVpbXq041Hg1ZElU2dTR/gdqEo8K0gT8eOLBurjS2DnS1MQPReYo9D49m1tBTnTFFFtG3UdKiFPdBdQ260TepfPr729cei2tgWDw8zsd+SLv3qJbsWigaHJVp7dyi4csICU4lU8XfJKWEkCbh0yo2zitHntYE9lqR0UZAjwuQ4Gg0w1X3PYF+sgdBINFkOrlLUQOCwR89A/kC18Ks/u4x8VygpCYr1Pub2lN2RWQbLtuTTd/zM9tBY4ZrvcySPcXb46CGCMeYywsSmXWhBO5qvJq/oM8wd2Ag8DVDvWDS1pV9jAoSCZagB+kGxmJ2Pnb5BX9m931HlXNgSQdGAMUtmFxpZlbrhA1muX1a9T+e7EDEI/nx0Ey/mS/SW8bNjjMBVc
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230016)(4636009)(376002)(136003)(396003)(39860400002)(346002)(46966006)(36840700001)(40470700004)(336012)(110136005)(54906003)(4326008)(70586007)(70206006)(8676002)(86362001)(36756003)(356005)(82740400003)(478600001)(81166007)(7416002)(41300700001)(5660300002)(8936002)(6666004)(82310400005)(2906002)(83380400001)(36860700001)(40460700003)(316002)(7696005)(186003)(1076003)(26005)(40480700001)(47076005)(2616005)(426003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2022 17:00:40.0445 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4acafe1b-eee6-47ab-4617-08da884dabbb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT101.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5242
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Sunil-kumar.Dommati@amd.com, Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>,
 open list <linux-kernel@vger.kernel.org>, Basavaraj.Hiregoudar@amd.com,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Bard Liao <bard.liao@intel.com>, Randy Dunlap <rdunlap@infradead.org>,
 mario.limonciello@amd.com, Vijendar.Mukunda@amd.com, alexander.deucher@amd.com,
 Julian Braha <julianbraha@gmail.com>,
 Lucas Tanure <tanureal@opensource.cirrus.com>,
 Syed Saba Kareem <Syed.SabaKareem@amd.com>
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

Pink Sardine ACP6.2 drivers can be built by selecting necessary
kernel config option.
The patch enables build support of the same.

Signed-off-by: Syed Saba Kareem <Syed.SabaKareem@amd.com>
Reviewed-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 sound/soc/amd/Kconfig     | 10 ++++++++++
 sound/soc/amd/Makefile    |  1 +
 sound/soc/amd/ps/Makefile |  7 +++++++
 3 files changed, 18 insertions(+)
 create mode 100644 sound/soc/amd/ps/Makefile

diff --git a/sound/soc/amd/Kconfig b/sound/soc/amd/Kconfig
index 08f5289dac54..bd785a0efb67 100644
--- a/sound/soc/amd/Kconfig
+++ b/sound/soc/amd/Kconfig
@@ -127,3 +127,13 @@ config SND_SOC_AMD_RPL_ACP6x
           triggered for ACP PCI driver.
           Say m if you have such a device.
           If unsure select "N".
+
+config SND_SOC_AMD_PS
+        tristate "AMD Audio Coprocessor-v6.2 Pink Sardine support"
+        depends on X86 && PCI && ACPI
+        help
+          This option enables Audio Coprocessor i.e ACP v6.2 support on
+          AMD Pink sardine platform. By enabling this flag build will be
+          triggered for ACP PCI driver, ACP PDM DMA driver.
+          Say m if you have such a device.
+          If unsure select "N".
diff --git a/sound/soc/amd/Makefile b/sound/soc/amd/Makefile
index 0592e7c5c407..82e1cf864a40 100644
--- a/sound/soc/amd/Makefile
+++ b/sound/soc/amd/Makefile
@@ -18,3 +18,4 @@ obj-$(CONFIG_SND_SOC_AMD_ACP6x) += yc/
 obj-$(CONFIG_SND_SOC_AMD_ACP_COMMON) += acp/
 obj-$(CONFIG_SND_AMD_ACP_CONFIG) += snd-acp-config.o
 obj-$(CONFIG_SND_SOC_AMD_RPL_ACP6x) += rpl/
+obj-$(CONFIG_SND_SOC_AMD_PS) += ps/
diff --git a/sound/soc/amd/ps/Makefile b/sound/soc/amd/ps/Makefile
new file mode 100644
index 000000000000..23afa5e32ffa
--- /dev/null
+++ b/sound/soc/amd/ps/Makefile
@@ -0,0 +1,7 @@
+# SPDX-License-Identifier: GPL-2.0+
+# Pink Sardine platform Support
+snd-pci-ps-objs := pci-ps.o
+snd-ps-pdm-dma-objs := ps-pdm-dma.o
+
+obj-$(CONFIG_SND_SOC_AMD_PS) += snd-pci-ps.o
+obj-$(CONFIG_SND_SOC_AMD_PS) += snd-ps-pdm-dma.o
-- 
2.25.1

