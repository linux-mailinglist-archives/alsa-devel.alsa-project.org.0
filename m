Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D3203CBCF5
	for <lists+alsa-devel@lfdr.de>; Fri, 16 Jul 2021 21:48:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E87B31709;
	Fri, 16 Jul 2021 21:47:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E87B31709
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626464885;
	bh=JZqnQJnFny3cme5p+N+AqncnRs1FHvdWW8TeFvObE1s=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CEy0LQzn1P8yXcXikqAmXtV0uMRXnW2FYJAy+Ta1LXB16YHi9wew6+kXMMsgtROAW
	 RE7vRq77BxDn7dv9lt+43u/pmo3kybra/BdnujhB9hqA3gZ85+Z7z8wJ2iHOmqrPNu
	 3jOi52graPdUypgiW5JzKja6tHihxBUePdoZiXwQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 59466F804E7;
	Fri, 16 Jul 2021 21:44:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D6CE9F804E4; Fri, 16 Jul 2021 21:44:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DATE_IN_FUTURE_06_12,
 DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20621.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe5a::621])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DF305F8025B
 for <alsa-devel@alsa-project.org>; Fri, 16 Jul 2021 21:44:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DF305F8025B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com
 header.b="22YGzioV"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PTTzJzwDJ9nzaff3Mm9LtBkuSq/DO/ArSCKmDXHdr4iQMjQrpYTOW2bofHHov8myxeIT7Gla5Ynrn1TX8Jq4ZK1EM12nBeuVhk4q81Dv3DeEa0dJR8mLe2UP0Uhrc7Kxm11JYq/HRpzvSP1dhuh0GB/ztPSLq95gedmxfV8yzPt6eXiONn1qW0au4sEYbh8w6qZcdJF+pg0hwQWV/I9pnFTkKvAXuUzc6Vkk/7j63SkXdHSv7Adaf2ekqB783BgZ/7whPcocGmLlivH7bkU8d65t0b2PrxqPOOB+IJqaR5SmNDX8uyAvT2EctX/GyFsz9kvnTTCmD6rFXLDYU6WDPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LT5CScKnxWvfIsqJHay7adkjaawUbK0PJbA7l91V5OM=;
 b=TCaunC4KroRWFtSufmGHlDqq6WasCI5Vw3m9JvZfUiLrncDfxvZPmQmFmm4JrRH3eHI6hE5eZeQXpW8X8pYsf7UN3j/irFigDhTb9Z8oOmJs9uvhtpAvZqyovg2/mlagXTCnmk8bqry1xkhzEt2NojAE7X3xLHSnYxjryK907GUjyOUxTGnwdgH0QpYZMaLER/rG07RSJCRCdt6rAyAr0XScvbxBAliSouyOwIIj2yBC2f1g9Au9xTRYpXKNBmEggf9yWkYpOKpmELVy4QKpcmZEfm9Fz37Q5AH6aAAwabxVpKOLYtq/Fukb6/eR4AbdCkKqLrYfgR+9DKSzoocfqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LT5CScKnxWvfIsqJHay7adkjaawUbK0PJbA7l91V5OM=;
 b=22YGzioVbDozL+RxKY3eUK42TBjifDcvqHpWOd2sFGJQhVQD8M+JEsQ8rrxGC0m+F7tdaVdVit7KN8kyX6Sbpi1XTUPYPqOxSvbtajBZSRVdXM0opDy7icdhpSWuV2OkIQcCagtzRwls9iMeaqrxHKyse77uEs1ttDC2Z6zBDls=
Received: from MW3PR05CA0021.namprd05.prod.outlook.com (2603:10b6:303:2b::26)
 by BYAPR12MB3127.namprd12.prod.outlook.com (2603:10b6:a03:d8::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.23; Fri, 16 Jul
 2021 19:44:27 +0000
Received: from CO1NAM11FT019.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:2b:cafe::d6) by MW3PR05CA0021.outlook.office365.com
 (2603:10b6:303:2b::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.9 via Frontend
 Transport; Fri, 16 Jul 2021 19:44:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com;
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1NAM11FT019.mail.protection.outlook.com (10.13.175.57) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4331.21 via Frontend Transport; Fri, 16 Jul 2021 19:44:27 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Fri, 16 Jul
 2021 14:44:26 -0500
Received: from vijendar-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2242.4
 via Frontend Transport; Fri, 16 Jul 2021 14:44:17 -0500
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
Subject: [PATCH V3 12/12] ASoC: amd: enable vangogh acp5x driver build
Date: Sat, 17 Jul 2021 09:30:59 +0530
Message-ID: <20210717040059.310410-13-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210717040059.310410-1-Vijendar.Mukunda@amd.com>
References: <20210717040059.310410-1-Vijendar.Mukunda@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e64a5399-1048-4aad-31e4-08d948921f16
X-MS-TrafficTypeDiagnostic: BYAPR12MB3127:
X-Microsoft-Antispam-PRVS: <BYAPR12MB31270EDECD658104287CF6AC97119@BYAPR12MB3127.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JXpo2QznNdqrqWogSx1fkdQGO15bEnpaHwIPCx5VOcnaS9pv+kI4nc89GwQHHMp1oiynMjxAQzo6NVWknYKAEnZt2cWN/3Hi0yXpkKNacKs1sAiOjc5cG8udzW1IPrWviPuLpd8lYH+nLy0uIHtTq+qIHZ4vVtRIMA+nKhZqeVjz8vjXhgeQBuk9l/gjzS5MIDi9luHrylnUYxBDHG/a50t/rXuBN8JTpyIC+l0Rmf0fZwKHl+6mudz0qzj78TEzXQIE6beZoVEb9yO2MbEFVh4e7hrl1+AuFE1f09YKhldHvzFQ1CzFlJQOvKdXfSjNKK+BLT8XuiRT5rRCcwulU6f56pX81JS6g1VsJLwRAQ+uc0Qbd7q7VjJLUDBNMoeV3f1XjOC/Fuo1g9KqUOnX3KhY1Oe5FUyCo0n4vnV2WhaCO748xH0ADflqOeIBLgfRmwBXmdCMDOCJv4aTyJ3kXIWMLMgMRi+zrioqz7Vhi8zydZ7P4inOq0MNmdfxxc87B/x1FGocT37Ly0iNKR8CBzdqsFDZSBACLa+/sVPdrZdShFqswbP5x0QE4ZDutR3oDY3dHKXDEgWLbWlLdjqVZ1kdEfCMi0SR/Mvwe6cXSW7STdE8xkf8e6aSfmNTOom11KiS1oGSAM5f3fzHNLRF8sfmc1gYPlyPVhIULrXCucn1IIvbwV06stxQkMXlgiC+shNV/DDEeWZ2Hzh1sOIpvEi/JpvFuoEu+CVd/3cn5gUhRm2SoCld38mu65aRTpYOyeCAOpqdxPgCb8qtfgDBHWx7zvtmA+PJEYIQfXruErU=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(376002)(396003)(39860400002)(136003)(346002)(46966006)(36840700001)(8936002)(81166007)(356005)(2616005)(4326008)(336012)(86362001)(478600001)(36860700001)(1076003)(426003)(8676002)(6666004)(47076005)(70206006)(70586007)(54906003)(82310400003)(316002)(5660300002)(186003)(26005)(7696005)(110136005)(36756003)(82740400003)(2906002)(42413003)(32563001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2021 19:44:27.1880 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e64a5399-1048-4aad-31e4-08d948921f16
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT019.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3127
Cc: Sunil-kumar.Dommati@amd.com, open list <linux-kernel@vger.kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>,
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>, Alexander.Deucher@amd.com,
 krisman@collabora.com
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

From: Vijendar Mukunda <vijendar.mukunda@amd.com>

Vangogh ACP5x drivers can be built by selecting necessary
kernel config option.
The patch enables build support of the same.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
v1 -> v2: remove extra line
v2 ->v3: remove extra stuff from Make file
---
 sound/soc/amd/Kconfig          | 9 +++++++++
 sound/soc/amd/Makefile         | 1 +
 sound/soc/amd/vangogh/Makefile | 9 +++++++++
 3 files changed, 19 insertions(+)
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
index 000000000000..3353f93dc610
--- /dev/null
+++ b/sound/soc/amd/vangogh/Makefile
@@ -0,0 +1,9 @@
+# SPDX-License-Identifier: GPL-2.0+
+# Vangogh platform Support
+snd-pci-acp5x-objs	:= pci-acp5x.o
+snd-acp5x-i2s-objs	:= acp5x-i2s.o
+snd-acp5x-pcm-dma-objs	:= acp5x-pcm-dma.o
+
+obj-$(CONFIG_SND_SOC_AMD_ACP5x) += snd-pci-acp5x.o
+obj-$(CONFIG_SND_SOC_AMD_ACP5x)	+= snd-acp5x-i2s.o
+obj-$(CONFIG_SND_SOC_AMD_ACP5x) += snd-acp5x-pcm-dma.o
-- 
2.25.1

