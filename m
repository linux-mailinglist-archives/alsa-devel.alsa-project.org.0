Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 00F593BE2C9
	for <lists+alsa-devel@lfdr.de>; Wed,  7 Jul 2021 07:45:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7FEBF82B;
	Wed,  7 Jul 2021 07:44:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7FEBF82B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1625636709;
	bh=VpGPpnuacKCr1hLfNbuhgaZO88v6bs+wQ7Xuj0/WGdw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=J3Tb7pmScwzenDipEzTSoVyxgl6rrVT0ZY07xAWeoeQsR4PgE5baGUUXgPr5/Y83c
	 TLYiZP0RxDdF1r93CniqjinHDpo1hsoo3lWMnGtMCQRLJ/bke8VZb6Ke2wJBlhiSp3
	 2DwGCKwZp+c5t9kd7i4ong/ge4abR74eeqIVFiXw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 08B37F80508;
	Wed,  7 Jul 2021 07:42:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 55C6AF80508; Wed,  7 Jul 2021 07:42:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam07on2067.outbound.protection.outlook.com [40.107.212.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B76A5F804FB
 for <alsa-devel@alsa-project.org>; Wed,  7 Jul 2021 07:42:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B76A5F804FB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com
 header.b="bb2SBWpo"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a45F0aGExuThyEoHeYI8kMohlEtDfLUx+Z6t4omz4o/fFqP9eBU+2PhdDDYg3mAC8+NiqcZK1g0pK4DT3W/llOX26jOcXY2Zv8biFaGjkLKLxoutORK+ZMbBedoNWQgCzHLgYNgbwFwN5+aacKkX12CLOeOEzQiUSBQ2/Xg/iN5O9o9h94PvRzFUh17UiPI+cpidbX8DTZhjEKZ0tTLY598hLRr2P8juxPO4CMOUEl4dZw+wHiikAQtfOSxBKZL2OOsgvTrx+u1lc8slsInr1qwouQm0sdGms1OYMt4DEZwGVrXobQVBbYNxcTNCWbmTbr1wujux4yifevmeZO7How==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QFc8wBbXWocNxxvHN7YPAWLQaZs0NVdU97+DP50Br9k=;
 b=EKmJCHYuEU8ODMl16hxvTd1oKCUlw8WLZNjX8jUT3do6hvYQrlvtprZ0UYSPycIHl2RGLMUFVIF9aOwLT+U2eVDr/PgBHnVCObJ9cCBR2XKKFvoheiz2tblvejwco1ZXt9wPwE7RlGSP0yX+dNwSoHamK6p36I9LZqhUVyejLntejc5FMKIIQT2ZWEDVXppYeTqAp4W3lwHIiPsQCBPbuLBDK2dk3h5y3jner0NN37iJMqWoic/ohzd0UEKtFZhIQvDjM0fzQUHby+pMQ4ZasxkTkZNNiVcrcvy+/5bYbBmOSa0+OMpdLujL+3AqmjBgqLwwYz3xnSyyALkyRkeirQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QFc8wBbXWocNxxvHN7YPAWLQaZs0NVdU97+DP50Br9k=;
 b=bb2SBWpoS1x9nTVJghR7lEXzsvit3LCVWGGjPPgT0+tTPsZ4gP+f7DiU5pNCos72nZKujhXoD2fund0agg25ZnPAFZvYkbJW76fDJuqlZc1fYA7m3czB6lhi/gFZ8j5sj3kQSWLpp1Jq/c+1JDxLIlc7k4JwtTVT2f+RgGQrECo=
Received: from CO2PR18CA0049.namprd18.prod.outlook.com (2603:10b6:104:2::17)
 by DM4PR12MB5344.namprd12.prod.outlook.com (2603:10b6:5:39f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.29; Wed, 7 Jul
 2021 05:42:39 +0000
Received: from CO1NAM11FT032.eop-nam11.prod.protection.outlook.com
 (2603:10b6:104:2:cafe::54) by CO2PR18CA0049.outlook.office365.com
 (2603:10b6:104:2::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.20 via Frontend
 Transport; Wed, 7 Jul 2021 05:42:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com;
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1NAM11FT032.mail.protection.outlook.com (10.13.174.218) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4287.22 via Frontend Transport; Wed, 7 Jul 2021 05:42:39 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Wed, 7 Jul 2021
 00:42:38 -0500
Received: from LinuxHost.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2242.4 via Frontend
 Transport; Wed, 7 Jul 2021 00:42:28 -0500
From: Vijendar Mukunda <vijendar.mukunda@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
Subject: [PATCH 12/12] ASoC: amd: enable vangogh acp5x driver build
Date: Wed, 7 Jul 2021 11:26:23 +0530
Message-ID: <20210707055623.27371-13-vijendar.mukunda@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210707055623.27371-1-vijendar.mukunda@amd.com>
References: <20210707055623.27371-1-vijendar.mukunda@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2bf1a329-1cac-4bd5-5aa1-08d9410a0872
X-MS-TrafficTypeDiagnostic: DM4PR12MB5344:
X-Microsoft-Antispam-PRVS: <DM4PR12MB5344D620E7600D14AD47086B971A9@DM4PR12MB5344.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iUO91EVd2GKg7/Al5n9qn0+dKe61Jx/IszgdxueiejcTuD5d+P1fOhK0/n/nxtyqB2NYFYDFq+Qg9A2kXgy0ng1JCF2TMxtRlJRP1nPDaS48S8bvrIppnfK9VfuE+pXyL+TVBb18J0TZG/Uz71OAGI0TGGBVf+vdIXG0RNoXDWlgEaB4Nr26yyKXfRwp2iyW+qtNlPZsFVM6x8A0U8caBLqitByzV7yi4YK9OXCCGCERD1mcK4QQewJTbI2Et5jx3L/u4HnDzFshgRYY/PR6fHVlJCcVPRUHvCCE6zqGUEgiXoxi04qYkBn1P6lL1h82KiYOYyKX394c8GS8aPwMLRJjWVcvauzvdCsG7yLL0354ZNdBjYbTET8njSZJanwUFKf+AJ0cjRpFpi/Yb1seIn6gTN1GGfulGbaqyJ03D0f7SLkbzV0z8stMNrlYM1HPW+W+f01lLlFx+IWNZc4NExNn3j1HazCe+E9dhySrhyiT4un0/Ng09zDgcBYv4IF8bNdS+U6CXz4gv/E6bwv6v3feyByCAInrwuPYEmcz8LKpTVkUDmtx0wCUrzUdXarOFKIXljM3MqL8T9dbVJjAJd3iUltKOgr7z39NDpI3i7O9IIsbiq4LmppT9QNoxJr1dopp9ED7sC42J5fJBu7C1fPVLHeDnBxyzcJqV4I5iAGuXWhB9y4d3SzKMwSR43p7qrF4DpdpZSWj6UYn1+SIcMuFL21osfK9U1mPSP0uPVpqhizy2z6Pl+nUOovDKWD9+xnyDaZ090Xy1wjxDQUgz17hIMgp6VtuywOvEmPX6EM=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(346002)(396003)(39860400002)(376002)(136003)(36840700001)(46966006)(8676002)(82310400003)(26005)(44832011)(7696005)(36756003)(426003)(186003)(8936002)(36860700001)(2616005)(86362001)(1076003)(356005)(478600001)(316002)(47076005)(81166007)(4326008)(70586007)(336012)(54906003)(70206006)(82740400003)(6666004)(2906002)(5660300002)(110136005)(42413003)(32563001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2021 05:42:39.5197 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2bf1a329-1cac-4bd5-5aa1-08d9410a0872
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT032.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5344
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
 sound/soc/amd/Kconfig          | 6 ++++++
 sound/soc/amd/Makefile         | 1 +
 sound/soc/amd/vangogh/Makefile | 9 +++++++++
 3 files changed, 16 insertions(+)
 create mode 100644 sound/soc/amd/vangogh/Makefile

diff --git a/sound/soc/amd/Kconfig b/sound/soc/amd/Kconfig
index ba5a85bf7412..63e5b7549fb5 100644
--- a/sound/soc/amd/Kconfig
+++ b/sound/soc/amd/Kconfig
@@ -52,3 +52,9 @@ config SND_SOC_AMD_RENOIR_MACH
 	depends on SND_SOC_AMD_RENOIR
 	help
 	 This option enables machine driver for DMIC
+
+config SND_SOC_AMD_ACP5x
+	tristate "AMD Audio Coprocessor-v5.x I2S support"
+	depends on X86 && PCI
+	help
+	 This option enables ACP v5.x I2S support on AMD platform
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
2.17.1

