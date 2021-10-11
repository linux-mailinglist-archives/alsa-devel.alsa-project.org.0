Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B5D2B428AC0
	for <lists+alsa-devel@lfdr.de>; Mon, 11 Oct 2021 12:28:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 454831673;
	Mon, 11 Oct 2021 12:27:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 454831673
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633948106;
	bh=w/9oXhJOV28tZGw3S36/od88ufFqMs/WDZpFT5H/t8g=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SxmX7rPN11e1rerxKYl+WzYN/cuzGVDw6cK934J7yQH7E3Y2zaMjVGGjMOzlgcmu0
	 RcwuZc0PekZJmYuo0g+t6Rn1usfeCP2ZAwY4DSHHgp7DjIaNlr7qYMD55e3ajORRLr
	 d9jl51rRNLtFLywnQhyInX+/k0yv1zp31yIBYQSw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B7DC3F80430;
	Mon, 11 Oct 2021 12:26:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6F4E2F804E3; Mon, 11 Oct 2021 12:26:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DATE_IN_FUTURE_06_12,
 DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam08on2087.outbound.protection.outlook.com [40.107.101.87])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D0A54F80430
 for <alsa-devel@alsa-project.org>; Mon, 11 Oct 2021 12:26:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D0A54F80430
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com
 header.b="Btau13ME"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W/hLfMtnFjrcm7tZTbVXyZ4kmJ8+1U+jo9Uu7IUDTBE7tEhWwUohE8G9TbKCkE7aS853uM728BtoQV2uAnJMWnO1/FNY1ZThCY2W1BldM/DmQEz3elZipH5jKf9+18ak7pr8xQ4HpMewpn//jK6c1D2R9BJz7W7Q16pFP+k9X0hOmM9mtpvwuC6B3gHwlPe7fMfR8k0SgfF4jaY6xD1OU7USBmsoIcmfluorQgRegzY+nQj8yeu3WS9FRmX7uQFAZNFiFyd4/SE4O/Xl9veCAdwP/LTh5Bxr26F85XL+z0/ScOCIjhCCrfgPPs6tD2zWweDMK/VT9SCR8uzTrtybZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h3d7GJM2B7fttw5/M/4zsqgJeqiniU3ZWqbHXnW4QbA=;
 b=NiM/w2B6Sjhd6FuNMrcgJFTn0H7e3PVnjNPQOA2wq66xplJ4TNbuF3RMGymVWxeCbxMGH9mLnbf4vlYSFLk50I0quX3iMNzv4o3qw1WiA0BxdyVe05Qkfm9KYQuR/7v6/A7XCEmJlUkX4QLC1mIFcexYfQ3MVg05+HoVLXDGnqAMOO9MGom0pOc0E4A3rgOAmWkhSkYk9KLrym473u/KxtU6L2IkTWZpj71r+hLXK3EtD6vXlmujShOUww5EvGF07k9XVLjho0D5MshSC79x6i600v/DNCIpHwpxYnWi9+TKXHcGwFXWB4MFG61Jm84NSTUgRh28zN3C58hddSeA8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h3d7GJM2B7fttw5/M/4zsqgJeqiniU3ZWqbHXnW4QbA=;
 b=Btau13MEzZW4LDNn+/IrbEcugm6A73MnyDhmBFh6TdFiiKGU27T0kSJrM9YO/H+39TdhJt52cew5np5trJpNQf+0sRluZZWmssK/fAnERwSMOytDZe3WQTECoiOLspJ6wnvUKdJfepXy/t00hFn9YLovt6qbhEU3kEZvdMNvuOI=
Received: from MW4PR03CA0075.namprd03.prod.outlook.com (2603:10b6:303:b6::20)
 by BY5PR12MB4934.namprd12.prod.outlook.com (2603:10b6:a03:1db::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.25; Mon, 11 Oct
 2021 10:26:21 +0000
Received: from CO1NAM11FT060.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:b6:cafe::49) by MW4PR03CA0075.outlook.office365.com
 (2603:10b6:303:b6::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.25 via Frontend
 Transport; Mon, 11 Oct 2021 10:26:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com;
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1NAM11FT060.mail.protection.outlook.com (10.13.175.132) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4587.18 via Frontend Transport; Mon, 11 Oct 2021 10:26:20 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.8; Mon, 11 Oct
 2021 05:26:18 -0500
Received: from vijendar-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2308.8
 via Frontend Transport; Mon, 11 Oct 2021 05:26:15 -0500
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
Subject: [PATCH 3/3] ASoC: amd: enable Vangogh platform machine driver build
Date: Tue, 12 Oct 2021 00:17:03 +0530
Message-ID: <20211011184715.61573-3-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211011184715.61573-1-Vijendar.Mukunda@amd.com>
References: <20211011184715.61573-1-Vijendar.Mukunda@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1830a930-981c-49e4-35bf-08d98ca191a3
X-MS-TrafficTypeDiagnostic: BY5PR12MB4934:
X-Microsoft-Antispam-PRVS: <BY5PR12MB4934B7EA5E03AFA2D4822B9F97B59@BY5PR12MB4934.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1388;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: az1TRUmFEmv2vtthOG02CAE7Mxj9pXV2iXMLHDMNsAB0Oj2FBHAMi7VpD5UHN941j+UIpSJVo/99EvNvWdooZh/Z6EjQ5n618wsunKlOUGXVrzkdWnwtfrdR7qQIHlejBR6Grt5WU/6alMHKQsTczBtukFXRH6yQ1TESyIY4khOqKciBQ1eK6vG6w6N4jgVJd6+dPFk3FHG/HM8DrJ0PmzGgs1xR/djSjtz1sY8R5oOLzlYWXi6/GDSDseK0sL+YuUfVvqdWKPuhvNtTeCWkybv+pT1kWqY4PrdAqUuRUz91/kG72UCf6lwe5bN0ecakbOc6LCqX2lvTWyHkmj2EMhDymiLfVm7RS+DAKjY5gmWvb4T/4tfcv78kZnZ46iHEqhnJoRtUK0YuSGkLf3O5aFY3c5rw0QGy4jMwn0gY3i4qmvytddO+YnA/gmeYdT13otuqsT/vFOU6Aivg4r9sC1+02nHwZIMCoT4f5Sc2cv80N/jGkxCJlQ+fb6/rh4vSUEfRfx7h+BOT50SrTqTBL43V94mayJWerZhQcjQb07cokTALlg8CxH3i6PHiYEbAM70mZF7RV0BCsML1SFFnlE4PWAvYc5/RS1oVLw4eBYBNQ2Ir+xMj/lchhvQIxz98wz3n44z7WdU3qDzsWVx1ttpKKsTHSkXe3pTpUoxUp+nE4ByMEyOXWOcxxMeIuY9K2THcfhVNbev5Tg0sWk1LSkv2snRZU9vTK5+1xn5frX4=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(36840700001)(46966006)(2906002)(316002)(36860700001)(356005)(81166007)(426003)(4326008)(82310400003)(1076003)(86362001)(70206006)(47076005)(2616005)(70586007)(336012)(7696005)(110136005)(6666004)(36756003)(54906003)(8936002)(186003)(26005)(5660300002)(508600001)(8676002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2021 10:26:20.9032 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1830a930-981c-49e4-35bf-08d98ca191a3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT060.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4934
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Sunil-kumar.Dommati@amd.com, wtli@nuvoton.com,
 open list <linux-kernel@vger.kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, David.Rhodes@cirrus.com,
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

Enable Vangogh platform machine driver build.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 sound/soc/amd/Kconfig          | 8 ++++++++
 sound/soc/amd/vangogh/Makefile | 2 ++
 2 files changed, 10 insertions(+)

diff --git a/sound/soc/amd/Kconfig b/sound/soc/amd/Kconfig
index 49ff5e73e9ba..bab6d6fb3165 100644
--- a/sound/soc/amd/Kconfig
+++ b/sound/soc/amd/Kconfig
@@ -61,3 +61,11 @@ config SND_SOC_AMD_ACP5x
 
 	 By enabling this flag build will trigger for ACP PCI driver,
 	 ACP DMA driver, CPU DAI driver.
+
+config SND_SOC_AMD_VANGOGH_MACH
+	tristate "AMD Vangogh support for NAU8821 CS35L41"
+	select SND_SOC_NAU8821
+	select SND_SOC_CS35L41_SPI
+	depends on SND_SOC_AMD_ACP5x && I2C
+	help
+	  This option enables machine driver for Vangogh platform.
diff --git a/sound/soc/amd/vangogh/Makefile b/sound/soc/amd/vangogh/Makefile
index 3353f93dc610..ae2cda804e2f 100644
--- a/sound/soc/amd/vangogh/Makefile
+++ b/sound/soc/amd/vangogh/Makefile
@@ -3,7 +3,9 @@
 snd-pci-acp5x-objs	:= pci-acp5x.o
 snd-acp5x-i2s-objs	:= acp5x-i2s.o
 snd-acp5x-pcm-dma-objs	:= acp5x-pcm-dma.o
+snd-soc-acp5x-mach-objs := acp5x-nu8821-cs35l41.o
 
 obj-$(CONFIG_SND_SOC_AMD_ACP5x) += snd-pci-acp5x.o
 obj-$(CONFIG_SND_SOC_AMD_ACP5x)	+= snd-acp5x-i2s.o
 obj-$(CONFIG_SND_SOC_AMD_ACP5x) += snd-acp5x-pcm-dma.o
+obj-$(CONFIG_SND_SOC_AMD_VANGOGH_MACH)   += snd-soc-acp5x-mach.o
-- 
2.25.1

