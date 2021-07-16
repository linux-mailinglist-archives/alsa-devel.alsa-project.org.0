Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 20FD43CB936
	for <lists+alsa-devel@lfdr.de>; Fri, 16 Jul 2021 16:56:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9D50C16B2;
	Fri, 16 Jul 2021 16:55:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9D50C16B2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626447407;
	bh=JGqNLgzh1lfmv/yB9t9XRR1AvKLOzIKUg1iqw+o0sM0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TIbYGsrtvAR8jSiSm9xB/2sKPjGZAQUpzKXcevRXOl/jquPjfOg18CKHqUQF4eVco
	 ukbQcmuiJ+G2xUMi4fbrYGib9ZIvEzuXg7odDkwdrFMBoZNALsl0crdqRA9NDrORaa
	 F2VE3KmqNRDCVCmFYyhzraGOFWjsHvrbBTTRwVO8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 06EE2F804DF;
	Fri, 16 Jul 2021 16:54:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B6391F8026D; Fri, 16 Jul 2021 16:54:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2043.outbound.protection.outlook.com [40.107.220.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E6E0FF800FB
 for <alsa-devel@alsa-project.org>; Fri, 16 Jul 2021 16:54:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E6E0FF800FB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com
 header.b="iI6xUC1/"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=byiNHzjnIxqzR12z5weUI/uUFhz227sOIcG2bwhE00bpiqueZPvw2vtuYNyCo18SXCSTRCQPi7VSM/KirroWYPNeuxbcuESv1PkoSVUByaBmGFPbR4mQJ5w/qhk75McxIXxfbK88uRRa7On1YmQXiyryZHbHLaQgfw1DksYvQEqX9zEh6tYYRd4rjqFPh25YLsU1y1L4YAmNfQa06h+msqvoODslUjrT3w8x3ea+twdvN8/OyUqaNGSqRt8loDKAd5tTLwOyUKe67FXLX+NctCphcg3LD1nDoh44osfCZytdy/im9r0bjPfPK2n1//RQ7KZ9ZM9kKGgi5u8pChZO3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YMhlOygYfN2Vg4FZdMnIR6V/W83TTPkeBZCmN301FvY=;
 b=jowwzVuaE7mMgJH8eMuSy3j7MMVrhe89XvnPty7K1uGn/P/UrtUhewYRXwtvHpOHLHU8Yne65BBKia8ETqpPZq4w4+ZA3Vp0BKmI4S6bHvDyQmnMwrblz6lfhce4Yd7bzbxhfYDdFUWURjjNmkZCjVeIF+9Qwpk2bPxpKfobXtaC7g1ZiJXsFFE8tPp5/uNvNLDjY4myZ9wBcWM8YRGgdNCrPdyBJS4zWjW7j9dV3Wbr+YXEWMmOtQOvw5AEPXACIs+uwGHNg1OnbcGcF980/xp9UKSqQ1jdQc79BhotE8juu3luAsbm6IkvyM7QnZ2xqdf7Sty0jPmOI7chbDnUJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YMhlOygYfN2Vg4FZdMnIR6V/W83TTPkeBZCmN301FvY=;
 b=iI6xUC1/0lNq+etDO4BjoMpjxGpSwrlAYpy1QtgIQ41uzmaMF5Um3KcHNHJQCG17fSBFwoOj1EsZz9/9cSJhP1gVqNH8QbNguVYChziObihByymgDMVoNexZK6jQlnwHFFFRPduwokaVG5JOxnTUjq64kwL2xKCs1urKzc43CWg=
Received: from DM6PR11CA0045.namprd11.prod.outlook.com (2603:10b6:5:14c::22)
 by MN2PR12MB3134.namprd12.prod.outlook.com (2603:10b6:208:c5::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.23; Fri, 16 Jul
 2021 14:54:04 +0000
Received: from DM6NAM11FT053.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:14c::4) by DM6PR11CA0045.outlook.office365.com
 (2603:10b6:5:14c::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21 via Frontend
 Transport; Fri, 16 Jul 2021 14:54:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT053.mail.protection.outlook.com (10.13.173.74) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4331.21 via Frontend Transport; Fri, 16 Jul 2021 14:54:04 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Fri, 16 Jul
 2021 09:54:03 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Fri, 16 Jul
 2021 07:54:03 -0700
Received: from LinuxHost.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2242.4 via Frontend
 Transport; Fri, 16 Jul 2021 09:53:54 -0500
From: Vijendar Mukunda <vijendar.mukunda@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
Subject: [PATCH V2 12/12] ASoC: amd: enable vangogh acp5x driver build
Date: Fri, 16 Jul 2021 20:38:09 +0530
Message-ID: <20210716150809.21450-13-vijendar.mukunda@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210716150809.21450-1-vijendar.mukunda@amd.com>
References: <20210716150809.21450-1-vijendar.mukunda@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 14c98721-b657-421c-1b28-08d948698e32
X-MS-TrafficTypeDiagnostic: MN2PR12MB3134:
X-Microsoft-Antispam-PRVS: <MN2PR12MB313481FC673FA1DD949D57B797119@MN2PR12MB3134.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kAqUDmSn4iPz+p21/0Q4Q1cQ0ocG/0Avhfqrm17yYFE59WurUtZg6AaaZSNF8npitUe2x6CZAbqfh1R7p/1uR1YSrEgaOiByVz/yv/3Sy23tgPR8wjXk3rzp8oMvI/KqoeIFG8tsvxMp63EgRYUZV6zcAhiDMg69U/Ds3z6X7cSwvu3ylzyPxidYWA7J6DfVVFavrJdlAuL9pvzStHV9NmhPZ2mIO1YPNul8sihhCGbezhKpqjGBZ/Xh3hnczwQTJMOYpuwJro4UXR527O7eAPJRUlDhEkR6FduC/oSWdpyClwFY3Y1nLbvsPXxj3PmsltajSucKtSAwpPh2KdyXOSMxI6I8b2uJcOQnWhJznmHyDjwzCfW67AgiiPMELOYqsNpZ3o5WRjeqzt3lelhQg3ZCgHRoRiVD16SdQOnKr3m4elnyKjYoKZKXPeg7jAf8uWeEcqhLUHaKXWsgbNvR99VfShSgN2jtfrEBBwudKtS2I/MaNmSN2+KLtthCi4qRrdIW19uYIDblydCm1zlv8TyNkB+nJD2VUCOLH58rFLUzf85tRAAm/KYNaJtiIqKZued0dL2tgxrF//OqgGr2dshBkOHzTfwvKYTl6HcUZJkQGDMPahXy8P52ziAvehuxV07fGfAZuxjygx/SE96vSH8K6V0kBUDRp2kRo4dYHzrMEvuWZs33Hqgv2wmPOgvDl1h5bM8n0WH6ygmTEr1UZZnHgudqDbA6irgPBGt8L+nY1Sbkyolm2/pYTotzPR4gaUw7P9quyMe7ofGr57GwazeTfT1IB4Ljs25SxDC92P8=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(376002)(39860400002)(396003)(346002)(136003)(46966006)(36840700001)(336012)(110136005)(54906003)(2616005)(2906002)(44832011)(426003)(316002)(8936002)(4326008)(70206006)(5660300002)(1076003)(6666004)(186003)(70586007)(8676002)(26005)(7696005)(82740400003)(82310400003)(86362001)(356005)(36756003)(81166007)(478600001)(36860700001)(47076005)(42413003)(32563001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2021 14:54:04.3010 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 14c98721-b657-421c-1b28-08d948698e32
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT053.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3134
Cc: Sunil-kumar.Dommati@amd.com, Liam Girdwood <lgirdwood@gmail.com>,
 open list <linux-kernel@vger.kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>,
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>, Alexander.Deucher@amd.com
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

Vangogh ACP5x drivers can be built by selecting necessary
kernel config option.
The patch enables build support of the same.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
v1 -> v2: remove extra line in Make file
---
 sound/soc/amd/Kconfig          |  9 +++++++++
 sound/soc/amd/Makefile         |  1 +
 sound/soc/amd/vangogh/Makefile | 11 +++++++++++
 3 files changed, 21 insertions(+)
 create mode 100644 sound/soc/amd/vangogh/Makefile

diff --git a/sound/soc/amd/Kconfig b/sound/soc/amd/Kconfig
index ba5a85bf7412..cc48d4e5b080 100644
--- a/sound/soc/amd/Kconfig
+++ b/sound/soc/amd/Kconfig
@@ -52,3 +52,12 @@ config SND_SOC_AMD_RENOIR_MACH
 	depends on SND_SOC_AMD_RENOIR
 	help
 	 This option enables machine driver for DMIC
+
+config SND_SOC_AMD_ACP5x
+	tristate "AMD Audio Coprocessor-v5.x I2S support"
+	depends on X86 && PCI
+	help
+	 This option enables ACP v5.x support on AMD platform
+
+	 By enabling this flag build will trigger for ACP PCI driver,
+	 ACP DMA drvier, CPU DAI driver.
diff --git a/sound/soc/amd/Makefile b/sound/soc/amd/Makefile
index e6df2f72a2a1..07150d26f315 100644
--- a/sound/soc/amd/Makefile
+++ b/sound/soc/amd/Makefile
@@ -10,3 +10,4 @@ obj-$(CONFIG_SND_SOC_AMD_CZ_RT5645_MACH) += snd-soc-acp-rt5645-mach.o
 obj-$(CONFIG_SND_SOC_AMD_ACP3x) += raven/
 obj-$(CONFIG_SND_SOC_AMD_RV_RT5682_MACH) += snd-soc-acp-rt5682-mach.o
 obj-$(CONFIG_SND_SOC_AMD_RENOIR) += renoir/
+obj-$(CONFIG_SND_SOC_AMD_ACP5x) += vangogh/
diff --git a/sound/soc/amd/vangogh/Makefile b/sound/soc/amd/vangogh/Makefile
new file mode 100644
index 000000000000..ae2cda804e2f
--- /dev/null
+++ b/sound/soc/amd/vangogh/Makefile
@@ -0,0 +1,11 @@
+# SPDX-License-Identifier: GPL-2.0+
+# Vangogh platform Support
+snd-pci-acp5x-objs	:= pci-acp5x.o
+snd-acp5x-i2s-objs	:= acp5x-i2s.o
+snd-acp5x-pcm-dma-objs	:= acp5x-pcm-dma.o
+snd-soc-acp5x-mach-objs := acp5x-nu8821-cs35l41.o
+
+obj-$(CONFIG_SND_SOC_AMD_ACP5x) += snd-pci-acp5x.o
+obj-$(CONFIG_SND_SOC_AMD_ACP5x)	+= snd-acp5x-i2s.o
+obj-$(CONFIG_SND_SOC_AMD_ACP5x) += snd-acp5x-pcm-dma.o
+obj-$(CONFIG_SND_SOC_AMD_VANGOGH_MACH)   += snd-soc-acp5x-mach.o
-- 
2.17.1

