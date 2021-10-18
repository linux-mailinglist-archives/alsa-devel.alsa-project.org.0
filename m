Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 83F1443173B
	for <lists+alsa-devel@lfdr.de>; Mon, 18 Oct 2021 13:26:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0BC8B1901;
	Mon, 18 Oct 2021 13:25:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0BC8B1901
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1634556398;
	bh=Q2Pe0JY6Esn1BY791OCpQhkx4vDG+AGlmfFxgCRh8oQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=uFTA2l9qBVwF6KiQ1wQjVyqPlrE+pXyqFPLEdAu9lOHiYcKhhuwI+jmXM5oz14Ep3
	 1uuL5opbNL0+TsIAFCLlm7PNn5GGWjh43rJIgntIVSa+/glMFMHkDrhZW84ys8ZWmx
	 S3AfaKh8phKozmDF0MByknr7xrlwkTJNPwngcMDw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E4754F80537;
	Mon, 18 Oct 2021 13:23:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C2C6AF80529; Mon, 18 Oct 2021 13:23:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2043.outbound.protection.outlook.com [40.107.223.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1BF33F80536
 for <alsa-devel@alsa-project.org>; Mon, 18 Oct 2021 13:23:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1BF33F80536
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com
 header.b="f7+W321q"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PVlXxkxnQO6cKw8mFJqgaMndMdwTn2X9tNpzE7P9kwR/Vd4CcIlmL7xJ6je1B2dGPytvaoMcMIiwvcqbTa8Zj7UiMK4xfn6un7OQpZ9bGWUZpJCaOfewf/9VWfp+tJsbR26jcHThFoVfDGwpvEH3710uSN0o3NlE97S3oEsvWIeL/HFjn2n4Vila11J8Tq/iLkVCHZEm6kmsZHrD4Jou/0HteAn8+gL/n2LJJLWi5OjOdbx1J98nldmRLn1xbIIb2DcpcjCf+wnJRvm3imnSWIfR/EZS35kk3mVzvOQgymUOTd2up3I6BC6nGgmjuxUEmxeRAkdKOixTOUsPyxmT1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z9KV1R0SSWrrQE6r6LK5OsRaRmBJFi9O7h3KLi5VPBc=;
 b=hdkcB0RzNLG0mriDgcma41/B1wLGPi/g7LkARs5GhhL3/2K5p3qXDXEAtqxMihJGwlvreh7DOkb5/JcxFGbDR6hhp51scu2r78HikNBl6Qba9IoEPD8rxztvZFfRSU22XLOTL5lrE8KeByBC9XMYEb3Rv8RoVN+wFWxm9aBW8OxZvfthbCcaovAuR2rvns6WO9QY9MHaPu+OvU5BsLopY9FvWkm2D6L/6GpN3eB+GksS8fZVZOGTpgE4Y+P9tUAfzB5g/tRqjBr9uFOfBPi5lhFf/43pmBqTjZ77dFLP+n9q6ylGVlhQv1h0dNfztWCiIF+4lN2InQEXxVG5yRAiVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z9KV1R0SSWrrQE6r6LK5OsRaRmBJFi9O7h3KLi5VPBc=;
 b=f7+W321qWqXwU0QH5vgWtkek8Ao5cZDc4d4U1lc9Z09hMb8aSt9NWcr1nlvCJlwiYoGykK0cKhKOAUOHDilsKdaLWfxfizN7iVOHlncZLdHxFaYr/45GlfKsLy2Z/JnOVNZ4n31IfNhQm+bXQ9HIoKwXHZtfKZaMFhkaonozc5Q=
Received: from DM5PR15CA0041.namprd15.prod.outlook.com (2603:10b6:4:4b::27) by
 MN2PR12MB4605.namprd12.prod.outlook.com (2603:10b6:208:3d::20) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4608.16; Mon, 18 Oct 2021 11:22:53 +0000
Received: from DM6NAM11FT036.eop-nam11.prod.protection.outlook.com
 (2603:10b6:4:4b:cafe::2f) by DM5PR15CA0041.outlook.office365.com
 (2603:10b6:4:4b::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.15 via Frontend
 Transport; Mon, 18 Oct 2021 11:22:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT036.mail.protection.outlook.com (10.13.172.64) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4608.15 via Frontend Transport; Mon, 18 Oct 2021 11:22:53 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.15; Mon, 18 Oct
 2021 06:22:52 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.15; Mon, 18 Oct
 2021 04:22:51 -0700
Received: from vijendar-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2308.15
 via Frontend Transport; Mon, 18 Oct 2021 06:22:47 -0500
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
Subject: [PATCH V2 10/13] ASoC: amd: enable Yellow carp acp6x drivers build
Date: Mon, 18 Oct 2021 16:50:41 +0530
Message-ID: <20211018112044.1705805-11-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211018112044.1705805-1-Vijendar.Mukunda@amd.com>
References: <20211018112044.1705805-1-Vijendar.Mukunda@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 186e39a9-e073-4a37-28c9-08d99229a05b
X-MS-TrafficTypeDiagnostic: MN2PR12MB4605:
X-Microsoft-Antispam-PRVS: <MN2PR12MB4605C880C934EC49722D3FDA97BC9@MN2PR12MB4605.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3631;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: K1xlyrPNYOs7iOxw60f3wVdG4NJKiL0LjMMgCEAKekFLDRwl2SstVuRfy6v0itb9v7yVrUvq/pOXTP9OfohyRCcOCZmKkAZFIjgjg9A5Yot0H1aM4cFVEtN5AFAqbXTLn4Qc9CTnqMznTS+Fi5p7QGDpAWW8zP3E8e04eyWmxGNc2Qksn6q7wi6uUUuLHx11edQEQLvmBzNHIng4OulZnpRwSBDfKj7e7dFquXkfDQGG5VeN7rQTOEEjGZ0pLdH8WvepQtsrlJoUcWqCiBPR7xab6uou47t25NQxdpS09rps4wf5qfKFk6e3r5F6Iig/xuRzxYlzUax/oN3ZoQLszkxb1DYuLqX4Npp3c0srlcteS4BlhCdjMz3wo1cqj0eazNilo48OdKuu+jfYpP77X+APjwwH0huNZPdRiRe/dHap0tQz11H/lEiXpH3ZMdjApWrkLcXD2q4vhSrXfN1uhsPw8SzmKfQ2AITYVbT7ZCkfwF44j24/wd+Za9mgpaRY57TbzTmR4O8GliZp5nxi8ZMPX31v8XGjuPlijK5utcHv1HfqEEdv11nZaaA4Htjt5m21UqR9ajOy/sdEkyOpUdGFXuPhvd5LwUWKbWag4cC9trwmcVnvBoFzWdeKp3SmhclzDIrdiT98YMpz/bkLJsJ0CLWIVcTl+53xaMdrQD9NCHmuDetJxt1I6LwHpx+FOFPgMssX8An0MgGfP0hfWLQ8euRRU3ufJfTSH/wHynhTDwZVlnMy3rxbvvVT0gD3MKlKT8B2qgB+emLh6fHQ9w==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(46966006)(36840700001)(7696005)(82310400003)(316002)(8676002)(70586007)(70206006)(36756003)(356005)(2616005)(508600001)(47076005)(86362001)(426003)(8936002)(81166007)(36860700001)(54906003)(5660300002)(110136005)(4326008)(186003)(26005)(83380400001)(2906002)(1076003)(336012)(6666004)(32563001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2021 11:22:53.0550 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 186e39a9-e073-4a37-28c9-08d99229a05b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT036.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4605
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Sunil-kumar.Dommati@amd.com, Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>,
 mlimonci@amd.com, richgong@amd.com, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>, Alexander.Deucher@amd.com,
 Basavaraj.Hiregoudar@amd.com, open list <linux-kernel@vger.kernel.org>
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

Yellow Carp ACP6x drivers can be built by selecting necessary
kernel config option.
The patch enables build support of the same.

Signed-off-by: Vijendar Mukunda<Vijendar.Mukunda@amd.com>
---
 sound/soc/amd/Kconfig     | 10 ++++++++++
 sound/soc/amd/Makefile    |  1 +
 sound/soc/amd/yc/Makefile |  7 +++++++
 3 files changed, 18 insertions(+)
 create mode 100644 sound/soc/amd/yc/Makefile

diff --git a/sound/soc/amd/Kconfig b/sound/soc/amd/Kconfig
index d91a9399777c..0d0ca61bd8c1 100644
--- a/sound/soc/amd/Kconfig
+++ b/sound/soc/amd/Kconfig
@@ -74,3 +74,13 @@ config SND_SOC_AMD_VANGOGH_MACH
 	  using NAU8821 and CS35L41 codecs.
 	  Say m if you have such a device.
 	  If unsure select "N".
+
+config SND_SOC_AMD_ACP6x
+	tristate "AMD Audio Coprocessor-v6.x Yellow Carp support"
+	depends on X86 && PCI
+	help
+	  This option enables Audio Coprocessor i.e ACP v6.x support on
+	  AMD Yellow Carp platform. By enabling this flag build will be
+	  triggered for ACP PCI driver, ACP PDM DMA driver.
+	  Say m if you have such a device.
+	  If unsure select "N".
diff --git a/sound/soc/amd/Makefile b/sound/soc/amd/Makefile
index 07150d26f315..c5b900d3df0b 100644
--- a/sound/soc/amd/Makefile
+++ b/sound/soc/amd/Makefile
@@ -11,3 +11,4 @@ obj-$(CONFIG_SND_SOC_AMD_ACP3x) += raven/
 obj-$(CONFIG_SND_SOC_AMD_RV_RT5682_MACH) += snd-soc-acp-rt5682-mach.o
 obj-$(CONFIG_SND_SOC_AMD_RENOIR) += renoir/
 obj-$(CONFIG_SND_SOC_AMD_ACP5x) += vangogh/
+obj-$(CONFIG_SND_SOC_AMD_ACP6x) += yc/
diff --git a/sound/soc/amd/yc/Makefile b/sound/soc/amd/yc/Makefile
new file mode 100644
index 000000000000..20f8dfe6abb4
--- /dev/null
+++ b/sound/soc/amd/yc/Makefile
@@ -0,0 +1,7 @@
+# SPDX-License-Identifier: GPL-2.0+
+# Yellow Carp platform Support
+snd-pci-acp6x-objs	:= pci-acp6x.o
+snd-acp6x-pdm-dma-objs	:= acp6x-pdm-dma.o
+
+obj-$(CONFIG_SND_SOC_AMD_ACP6x) += snd-pci-acp6x.o
+obj-$(CONFIG_SND_SOC_AMD_ACP6x) += snd-acp6x-pdm-dma.o
-- 
2.25.1

