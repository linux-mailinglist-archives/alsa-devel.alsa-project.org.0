Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ED7B431744
	for <lists+alsa-devel@lfdr.de>; Mon, 18 Oct 2021 13:27:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 949821A9B;
	Mon, 18 Oct 2021 13:26:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 949821A9B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1634556462;
	bh=HFaQ2xbsi3WUzmMT9BhFv2lerqIj2cvkyJvCkUvSYJQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WP4liSsf9cqs03d8JfTyYkKdss2WQUrBXZ8Z61kqX9PprYnOov0TnQxhleIZoXXby
	 QfScznstseVeGp67qTgP8HrmcMx+xOnTXOmkR/auqCnvF7H84sWpOiB5mU6Jr5dWY+
	 pLxqTJCSST1HfMk2wxvIx223Eva+VYAfmzMITPvs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4D89EF8054A;
	Mon, 18 Oct 2021 13:23:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 380D1F80548; Mon, 18 Oct 2021 13:23:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20609.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e89::609])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5FF70F80544
 for <alsa-devel@alsa-project.org>; Mon, 18 Oct 2021 13:23:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5FF70F80544
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com
 header.b="5dAX+JRZ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T+83yMlNQeKDetAJHl1Scw6M2jU6ZKSE6e4BDwKQecHOkTTOBj0o6nOsy8l+ucYyl3re1CeqGSk1VEWs4oNn2y0V1OS7XGUrSnVvO0ZKyXlIW2BePDZjKjxzxFfwiLkEWgBcvO7KEnBBt/FNGIJL8vZBTjyKLdg6xofUzlXyOBKC9XOwy3Ax3XBXgzwmZJ6P3k30aUTKGcl5WM8p8IRMceWqunZF5V5IeIxpqiRt3i3Pa0ARqBqQ3wBCRxXFMra4eJcV7aXXmcN7AKXQ65XY/QflRFVm0fo13Oci9kHWDCPRMOlGJ9Pe3IcE+78Ppzj5d/OfXyC7gv2zgd6cUfUdxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5mGBjG1vdxDysR7F6KoRCDrOfXDeD/z4+S+sDIs3nck=;
 b=MQoRurRV4NkaMIeHgqKWCR9f7Y5/QWPPKB7qiGc8ry5Uj87E7k8IPwqQZdQ0qPWSFLmFOjPtWYBGZmFMMR706KxDlN7BvFxybwaIpG4FJG6vW9GBA0OgZMAYx7WUgSrE7X9SThs6tN8/K000s0Q6/OODxnDhFHK5hKWwelafOlEDg77yWjl1ybrTfqzbjfcAw/sT4ozghCPxNGJBHGhyFujwDF5wcADLb3FlBnqeJK+FCIbqWKftrvMFCm3JTrgrpa8vED2fRXAypBkGXmv55pNbgqnxPxMaRX5CASK1IhdiyaouEnTYwgsbsSpKBhmbdIhiKnbdrdkBI3gx6TJ9aQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5mGBjG1vdxDysR7F6KoRCDrOfXDeD/z4+S+sDIs3nck=;
 b=5dAX+JRZABkBnl5Y0WMrROwxoAxSTSnZulcvwf2Ieib5aXTxMPXwiySgkrOB2D/B09lXnv6YiizwuK7dR7dBS2WB1Ot3oZT08jhguSB7uNjrt2XF0bX0GptJGCbMJkjjIhnGzbitsCed3Xvi+vLPWwMlssKsNCZeolPe5SRP0to=
Received: from DS7PR03CA0348.namprd03.prod.outlook.com (2603:10b6:8:55::8) by
 BYAPR12MB2757.namprd12.prod.outlook.com (2603:10b6:a03:69::18) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4608.18; Mon, 18 Oct 2021 11:23:17 +0000
Received: from DM6NAM11FT017.eop-nam11.prod.protection.outlook.com
 (2603:10b6:8:55:cafe::3) by DS7PR03CA0348.outlook.office365.com
 (2603:10b6:8:55::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.14 via Frontend
 Transport; Mon, 18 Oct 2021 11:23:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT017.mail.protection.outlook.com (10.13.172.145) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4608.15 via Frontend Transport; Mon, 18 Oct 2021 11:23:17 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.15; Mon, 18 Oct
 2021 06:23:16 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.15; Mon, 18 Oct
 2021 06:23:16 -0500
Received: from vijendar-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2308.15
 via Frontend Transport; Mon, 18 Oct 2021 06:23:12 -0500
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
Subject: [PATCH V2 13/13] ASoC: amd: enable Yellow Carp platform machine
 driver build
Date: Mon, 18 Oct 2021 16:50:44 +0530
Message-ID: <20211018112044.1705805-14-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211018112044.1705805-1-Vijendar.Mukunda@amd.com>
References: <20211018112044.1705805-1-Vijendar.Mukunda@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ec985cd0-d424-47cd-c144-08d99229aed2
X-MS-TrafficTypeDiagnostic: BYAPR12MB2757:
X-Microsoft-Antispam-PRVS: <BYAPR12MB27573293A04FFDBFDB462FC797BC9@BYAPR12MB2757.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1775;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: I6/EqxFyVYoMzODRUPyhiv78RVsK9B68tD2hBLT+0JU15dH7UUMjrUOy5yHcF40JbKlyfLLIVjD3URsTB5cGQMDHiAF6nZcWRFt5Jbdx/KBPpaDN6sPvIKixD5PEFWI/wYIhYWBjYzbl6a9f077BKEVTZsHfHZ4apbQPH6a/S8YVsbeOOwR/5zKfoXK5oGHPorvwgmv9+RB1ubCtxJKkOvmBozjlpEV82yjrprXAacnx62RxRLFn9ESNUelbYzhUmQbF2ml3BaD9eOdU3u5Azf7ErtVEOVMSB+Iih3f1xh/ZiKoBBl/S/ppmd4Yaw+DR5hDKRBf/eBYO1X9ZJMpoF2P/rfr/eNvd1CwmDTcVUXmNxnoDjUuW5cVH1H3ascXL+Dft/vYn+LobwD6i8wYqLF+UyTBEZ/ppLWh++l3Bhf0uz9DLqoA356X/TXYDlYzWrYes22SIbtjaoAApnU1AwV4kqJm/P84RvpFygYwI3TFFajh4fsEJVRDlkMentRS8zHz1J0IntGfWy9owCY68YFrKYfRfy6ASq2/3SP4mr9XERseBoE5Ydc/6GEiLljsp4Ed+f2Pzw1uSVC7vercOclJ9wR1Z+vRGyVB22zmANUthOwKiAUjTtwzu9qH+2Cqvt5UdTB6HpcYgfg/1wUeM60Jr1W24DBSQ/zIN2SB1AHqQZvydJ0g2JkXrrwcaDJqR2KnmRgm3lPZP7LIZnzn3N34Rp1QIz2s1f0U6Ar8zkPM=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(46966006)(36840700001)(26005)(36860700001)(54906003)(186003)(110136005)(2616005)(47076005)(356005)(6666004)(81166007)(8676002)(70586007)(1076003)(4326008)(70206006)(83380400001)(5660300002)(2906002)(86362001)(7696005)(8936002)(82310400003)(508600001)(426003)(336012)(36756003)(316002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2021 11:23:17.3198 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ec985cd0-d424-47cd-c144-08d99229aed2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT017.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2757
Cc: Pierre-Louis
 Bossart <pierre-louis.bossart@linux.intel.com>, Sunil-kumar.Dommati@amd.com,
 Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>, mlimonci@amd.com,
 richgong@amd.com, Takashi Iwai <tiwai@suse.com>,
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

This patch enables Yellow Carp platform machine driver build.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 sound/soc/amd/Kconfig     | 11 +++++++++++
 sound/soc/amd/yc/Makefile |  2 ++
 2 files changed, 13 insertions(+)

diff --git a/sound/soc/amd/Kconfig b/sound/soc/amd/Kconfig
index 0d0ca61bd8c1..a01ade38554e 100644
--- a/sound/soc/amd/Kconfig
+++ b/sound/soc/amd/Kconfig
@@ -84,3 +84,14 @@ config SND_SOC_AMD_ACP6x
 	  triggered for ACP PCI driver, ACP PDM DMA driver.
 	  Say m if you have such a device.
 	  If unsure select "N".
+
+config SND_SOC_AMD_YC_MACH
+	tristate "AMD YC support for DMIC"
+	select SND_SOC_DMIC
+	depends on SND_SOC_AMD_ACP6x
+	help
+	  This option enables machine driver for Yellow Carp platform
+	  using dmic. ACP IP has PDM Decoder block with DMA controller.
+	  DMIC can be connected directly to ACP IP.
+	  Say m if you have such a device.
+	  If unsure select "N".
diff --git a/sound/soc/amd/yc/Makefile b/sound/soc/amd/yc/Makefile
index 20f8dfe6abb4..dc2974440388 100644
--- a/sound/soc/amd/yc/Makefile
+++ b/sound/soc/amd/yc/Makefile
@@ -2,6 +2,8 @@
 # Yellow Carp platform Support
 snd-pci-acp6x-objs	:= pci-acp6x.o
 snd-acp6x-pdm-dma-objs	:= acp6x-pdm-dma.o
+snd-soc-acp6x-mach-objs := acp6x-mach.o
 
 obj-$(CONFIG_SND_SOC_AMD_ACP6x) += snd-pci-acp6x.o
 obj-$(CONFIG_SND_SOC_AMD_ACP6x) += snd-acp6x-pdm-dma.o
+obj-$(CONFIG_SND_SOC_AMD_YC_MACH)   += snd-soc-acp6x-mach.o
-- 
2.25.1

