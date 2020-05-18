Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A1971D8005
	for <lists+alsa-devel@lfdr.de>; Mon, 18 May 2020 19:24:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1E9AA1771;
	Mon, 18 May 2020 19:24:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1E9AA1771
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589822694;
	bh=DPvZrGBTB6IAT9WKoSAMy5aoWDHpozchXWb09jbxzfw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RRx1JGXYzbkjFu3AvqSQwp7a1w5rLgM60Vwh6v9iejIyZcCISgJpoYevz2O08zYWC
	 2mlLQyYOnMZf/1/a9dE81sMxxnN8do0PNdeLatpTk75V5QyjftvsvmrOZGV32Kh2S9
	 ym/UZx/fPy+fu/wk/BqzVuKaran0fZNNy8aj2ors=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6C02FF80321;
	Mon, 18 May 2020 19:17:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DE649F802E0; Mon, 18 May 2020 19:17:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 FORGED_SPF_HELO,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2089.outbound.protection.outlook.com [40.107.92.89])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9F764F8027D
 for <alsa-devel@alsa-project.org>; Mon, 18 May 2020 19:17:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9F764F8027D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amdcloud.onmicrosoft.com
 header.i=@amdcloud.onmicrosoft.com header.b="RLVhUgeH"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Mj/HCNby7Hq8VUBOmTcu019HOGksp7UxTH/FuKLJU0ZxGlgBRnWOzbMptHF/7musS8YJwBcAgeb6M7Wpqs2xYqbQ92zbM+6McUFnPO5aBdsW0eHZwBt0uQSPoyEV/0e598lM4R9Jc40cDuajDFc1v/+Fh2aHYVATbjDFfF8oicBjT9YQsva5NEDI0vYVbb6VUZ7W8STs8PxV13EEegUaM8CWIS6Y6djdWHsdz+DMyl4gOOsrq8U9OYNtkQsZEebSE5dG2GMY4Et37dtS99DmUyS//Dl9tqKwnk1iORF0KkV36ZS/audEYSYxFnX3oVKNvA8Lvyn15XBUDgbGVOrRag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=22QX6ldWD2jma9fdVRfyTiExDnNEo8zKwEyMrX3O/64=;
 b=ggIf2zFaopKf6eP2ZEffd532smQbFpXZB2Z6HlQnCeKAXcFC34bULh828ruJZWM1AgAMrANjSJNkYgFoItAd9W5h5InAohVjpBB8TCG2s/X+QooaTl7b2cq84b0MLNLKgmMsJ/Ydm6yayjLKWIs+A1KEfmxu4GiWsXhCjh59VtkUAPlp8HBdfYwoHvw3OSi5PLyZlRRS9NZfaXwiToDqIarts9icVHVptI4x8HBC3xgHXggqT4rpa44AGn5XL/y9bvWCkSuokgj1vnXX+BcbDY2ln7ythMTmKgcZJ6s/HOMgKWmHG6rLKEQ7EPoFiCTwiNyMihQJBL1FP8YSp2iqdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=alsa-project.org smtp.mailfrom=amd.com;
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=22QX6ldWD2jma9fdVRfyTiExDnNEo8zKwEyMrX3O/64=;
 b=RLVhUgeHvE5pWMkTCcugK4VrixSMOr2meDTI4GUoDOMJKlBgL1i4eRjlf4cfJBYUf/YvLWY9gm66QLIfttIUXW6fhrFhaec2JHEVIWdt8tn3j/XtzAMgF5b4vofN3gK5w9d6by764iMp/5bgeLNuy3ofVFCUpP+AYIi9JDWpL38=
Received: from DM5PR20CA0023.namprd20.prod.outlook.com (2603:10b6:3:93::33) by
 DM6PR12MB3644.namprd12.prod.outlook.com (2603:10b6:5:118::12) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3000.20; Mon, 18 May 2020 17:17:29 +0000
Received: from DM6NAM11FT058.eop-nam11.prod.protection.outlook.com
 (2603:10b6:3:93:cafe::1f) by DM5PR20CA0023.outlook.office365.com
 (2603:10b6:3:93::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3000.24 via Frontend
 Transport; Mon, 18 May 2020 17:17:28 +0000
Authentication-Results: spf=none (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; alsa-project.org; dkim=none (message not signed)
 header.d=none;alsa-project.org; dmarc=permerror action=none
 header.from=amd.com;
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB01.amd.com (165.204.84.17) by
 DM6NAM11FT058.mail.protection.outlook.com (10.13.172.216) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3000.19 via Frontend Transport; Mon, 18 May 2020 17:17:28 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB01.amd.com
 (10.181.40.142) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Mon, 18 May
 2020 12:17:27 -0500
Received: from SATLEXMB02.amd.com (10.181.40.143) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Mon, 18 May
 2020 12:17:27 -0500
Received: from atgasia02.amd.com (10.180.168.240) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server id 15.1.1713.5 via Frontend
 Transport; Mon, 18 May 2020 12:17:26 -0500
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <alsa-devel@alsa-project.org>, <broonie@kernel.org>, <tiwai@suse.de>
Subject: [PATCH v3 11/14] ASoC: amd: enable Renoir acp3x drivers build
Date: Tue, 19 May 2020 01:17:01 +0800
Message-ID: <20200518171704.24999-12-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200518171704.24999-1-Vijendar.Mukunda@amd.com>
References: <20200518171704.24999-1-Vijendar.Mukunda@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SATLEXMB01.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFTY:;
 SFS:(4636009)(39860400002)(376002)(396003)(136003)(346002)(46966005)(4326008)(26005)(86362001)(186003)(54906003)(110136005)(336012)(316002)(7696005)(6666004)(5660300002)(2616005)(70586007)(70206006)(8676002)(8936002)(356005)(82740400003)(47076004)(2906002)(36756003)(478600001)(426003)(81166007)(82310400002)(1076003)(42413003)(32563001);
 DIR:OUT; SFP:1101; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1e22d13b-5544-4b3e-fd8f-08d7fb4f576a
X-MS-TrafficTypeDiagnostic: DM6PR12MB3644:
X-Microsoft-Antispam-PRVS: <DM6PR12MB36446214E16662B22AE40FEC97B80@DM6PR12MB3644.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-Forefront-PRVS: 04073E895A
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8rITekX7SxBBzosjWnwyV1wlDzHRQEYvm4qbl32GK+da2s5tx/uJitySKaF4C0uBq4Tt9Z1zRmveWSLe8VRpvwG8XtxHpxCm+9D9bjGRAlbzslA1OpN5gQWUCfKQvSVFdHX9XoTUQTVXDz5TYNiS/9wSoED0Bh57ShiX4xkB9w7yruNX0wRiE3bYS/hGxESXjteYWexiLyJuFVnYc9nofeyiJG6HHZgFbfltpzLiylojn/VS0fkqxIL5j/vDmGBSUnUF9pu5OvG+ueI/9ENT8m/xc1a18o1sINb/Q8jWEqCdGv/7NEzIhBROM1Mh38wkwovDSt3Qu3CjyasMcNv3aVjz8o3btlwWfbo8RnQLqQYI3YrFc+DTgVWdGhmIjMhso1Shbdg5kVENlkvC1m2FDppwpeJJxnpT9rmnnjZlduAFWCeXyfIc3dnHIRjlfoUSMBNUJ0dotLseDSDDNNKDu8j42nZuZ19yyJt1FbVHxskafzOhQdz/1dhxnTn6CyudJ0/uMX8bGAca+c0JUu1OyH4oi0UcPD31DWRjuglGb/w600vU0pWHJB0/O6OBnvdB
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2020 17:17:28.2912 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e22d13b-5544-4b3e-fd8f-08d7fb4f576a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3644
Cc: Alexander.Deucher@amd.com, Vijendar Mukunda <Vijendar.Mukunda@amd.com>
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

Renoir ACP3x drivers can be built by selecting necessary
kernel config option.
The patch enables build support of the same.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 sound/soc/amd/Kconfig         | 6 ++++++
 sound/soc/amd/Makefile        | 1 +
 sound/soc/amd/renoir/Makefile | 6 ++++++
 3 files changed, 13 insertions(+)
 create mode 100644 sound/soc/amd/renoir/Makefile

diff --git a/sound/soc/amd/Kconfig b/sound/soc/amd/Kconfig
index bce4cee5cb54..5f57a47382b4 100644
--- a/sound/soc/amd/Kconfig
+++ b/sound/soc/amd/Kconfig
@@ -36,3 +36,9 @@ config SND_SOC_AMD_RV_RT5682_MACH
 	depends on SND_SOC_AMD_ACP3x && I2C && CROS_EC
 	help
 	 This option enables machine driver for RT5682 and MAX9835.
+
+config SND_SOC_AMD_RENOIR
+	tristate "AMD Audio Coprocessor - Renoir support"
+	depends on X86 && PCI
+	help
+	 This option enables ACP support for Renoir platform
diff --git a/sound/soc/amd/Makefile b/sound/soc/amd/Makefile
index e6f3d9b469f3..e6df2f72a2a1 100644
--- a/sound/soc/amd/Makefile
+++ b/sound/soc/amd/Makefile
@@ -9,3 +9,4 @@ obj-$(CONFIG_SND_SOC_AMD_CZ_DA7219MX98357_MACH) += snd-soc-acp-da7219mx98357-mac
 obj-$(CONFIG_SND_SOC_AMD_CZ_RT5645_MACH) += snd-soc-acp-rt5645-mach.o
 obj-$(CONFIG_SND_SOC_AMD_ACP3x) += raven/
 obj-$(CONFIG_SND_SOC_AMD_RV_RT5682_MACH) += snd-soc-acp-rt5682-mach.o
+obj-$(CONFIG_SND_SOC_AMD_RENOIR) += renoir/
diff --git a/sound/soc/amd/renoir/Makefile b/sound/soc/amd/renoir/Makefile
new file mode 100644
index 000000000000..43100515c7db
--- /dev/null
+++ b/sound/soc/amd/renoir/Makefile
@@ -0,0 +1,6 @@
+# SPDX-License-Identifier: GPL-2.0+
+# Renoir platform Support
+snd-rn-pci-acp3x-objs	:= rn-pci-acp3x.o
+snd-acp3x-pdm-dma-objs	:= acp3x-pdm-dma.o
+obj-$(CONFIG_SND_SOC_AMD_RENOIR)	 += snd-rn-pci-acp3x.o
+obj-$(CONFIG_SND_SOC_AMD_RENOIR)	 += snd-acp3x-pdm-dma.o
-- 
2.26.2

