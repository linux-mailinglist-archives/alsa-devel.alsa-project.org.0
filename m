Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B55E857D09E
	for <lists+alsa-devel@lfdr.de>; Thu, 21 Jul 2022 18:03:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0FBA718AF;
	Thu, 21 Jul 2022 18:02:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0FBA718AF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1658419416;
	bh=xLgX+dFkZuTbaFjtHR515YWNWFlsaeYsVdUtRfv4mwU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=J/EBM/4D0uHwmeC8/0/XeDfl2ILE8NznRRar/fngbw4Hr3KftsJ35CNqFM9UxowLZ
	 QFMjjFhAGWwPE2nWs+7ZAXdf15tM5IyNa4Z1Ky/f2OSrMyPE2O/xHKHg/ri4/JxkmA
	 pi0gPoJH1SqyRwlprM3pkYB1Wv1ACU9MPOBodO3I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D3933F805C4;
	Thu, 21 Jul 2022 17:58:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DE5C6F8016D; Thu, 21 Jul 2022 08:13:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DC802F80166
 for <alsa-devel@alsa-project.org>; Thu, 21 Jul 2022 08:13:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DC802F80166
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com
 header.b="KSKl4Nni"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M2t0jHNNFAz0K8eUjX2fuw2dZ5+RM64n+CrytLeZStxEqdssm4SGTt8Qcrg4f1zA0d+xSrkaTn0eilgNX4Au86lXFQlCubxHpNiQJkQyqvXI64t8RX5akAQ2+qFRPLAfTandog/mMaW5+/7lfBGsy5hbYAX16EqoS1l2t5XKIwyqdtgqlppRTzzGW0q34TJAyF1YgVBjObH6eoVzb2geWiuYa6OlpTtyfFzudF5OugcmZNkFBuU9DxW0co8ghr1+mvVfRJF/VkibzvYk52aQ9sBpYmypg7jCyRPgFqPWgYsnod6X1X/rMWjuPIym7THXKYnYF6MBCNSi6PNiKoU+0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I0D4igSH7BZLvBKhq9qPOhpohSGkdXgBNNRu0eLmGCQ=;
 b=O0A8OzxxOb08GNzCALQR5P126JUGGH2iU+5dQDB53Qn7K1+XCr38DsxvBnp1XJxRStbmPVgIW1zaIa8zURZmVGwIB+KdbRVOsbiS/QdYh2E4/edIoJJ5wMsr+Gdrudtlg2XXTQMdMYLd8shnFFjaf3kzTFsnXfH3xHEmFfrEzLYP1x/SzgUZZHgMs7oJLPwI+Fg10WN/O8YftmPUhyLh3LhE+qThOL0Vuu9u5CFt0uJ7yRZ6lkYAdNiBwkKXNninOdvCWUhCrUqV/4oE5nHUGE3aJ+/CgA5b6O4n9v37UJmxCbRkXABUg//IeWBxTFuO/gMLHnEuPzjM1h+gJsSLzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I0D4igSH7BZLvBKhq9qPOhpohSGkdXgBNNRu0eLmGCQ=;
 b=KSKl4Nni6Ye9Be6Td3zfQCuTbWgkmbefc7CKdIDSTnxirTP6jjDeRPkmJAPIrBA0KdIRghN06ynlSalScBsC6jKbbmHiZFndpWmTFOS6SeRJjLdwcvKXGfMLVkSgSrlapAbu+5fH4t2IEdGmWzidVOzQeLF11EdY/nohI0OrM9Q=
Received: from BN9P222CA0012.NAMP222.PROD.OUTLOOK.COM (2603:10b6:408:10c::17)
 by SA0PR12MB4384.namprd12.prod.outlook.com (2603:10b6:806:9f::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.18; Thu, 21 Jul
 2022 06:13:11 +0000
Received: from BN8NAM11FT021.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:10c:cafe::63) by BN9P222CA0012.outlook.office365.com
 (2603:10b6:408:10c::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.18 via Frontend
 Transport; Thu, 21 Jul 2022 06:13:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT021.mail.protection.outlook.com (10.13.177.114) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5458.17 via Frontend Transport; Thu, 21 Jul 2022 06:13:11 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Thu, 21 Jul
 2022 01:13:08 -0500
Received: from amd-Z97X-UD7-TH.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.28 via
 Frontend Transport; Thu, 21 Jul 2022 01:12:58 -0500
From: syed sabakareem <Syed.SabaKareem@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
Subject: [PATCH 5/5] ASoC: amd: enable RPL Platform acp drivers build
Date: Thu, 21 Jul 2022 11:40:02 +0530
Message-ID: <20220721061035.91139-5-Syed.SabaKareem@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220721061035.91139-1-Syed.SabaKareem@amd.com>
References: <20220721061035.91139-1-Syed.SabaKareem@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f000a1d5-e8f1-4d5b-ad38-08da6ae016f5
X-MS-TrafficTypeDiagnostic: SA0PR12MB4384:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: S1EOC2ZAnEpkfZMNsWp1nBKpK7OBmdsltmHW8YFwyAyQLDrT4sOXPl804nvgcFBchcLXGZ1B5Yw5XRQ82QlvmLP6bNgi60fPRBb7KqPDhzLSugPG5N/5u6udTriB6mYUBo/nrQ1vl9naqtmE099XVUQ6iNfv7gW+9DsxTDYV0D24d/4qfeFYFeVNfQC3imhgV4Nsqw13CUQM8DJNhgIkRqHHQLZqZHksGWutnrqt5iVNyOmptKAPvxUpR5Rb5XoFWbwE0XXv+6nN8FaNGophl2bL0+M9Vf5vBNDGL3Qu8PawWzJDOeWU2BwL70ub/JjtOUmJzZXL+45CYS3G+AdgKuXOVjRAeQRdN7L0W3PbMUsxB7jceb58/G1Uj5LsCyoIlpl83bZ+7QMowNGviJeViVG+x9X8YohPSv3VQmZT7zdccbYJ4kMWMTiDW3y7bGiTdVZEi1PtJhTLG8RyErNXGXDE98PABUkCkqiqGlrQPnNKk8+Z+iC+daxpVa1nAB91Gy2nL51irO8Cmr/7rzJ5IXRkPF8oglICk6DW8len/Y3PK/M3XdQ5by1tXeS+9o1RNlDYgZFdCT9H1gfSCakKXq7RFgHamcWzeRF86Hk7jy7i0it6tr86Zrxm9AaQl/gYDAzVMdy0wVqaoCIMcdNhULrEhZEwmDDW53i6UJpeVtUgcWCyv2GnpFYPv7E0USaLgQ1wWeJE2cKgffLSW3+MiNyLsU968H0ksbNEg+UhyvVINdsR48K7qNrGn7rzhMSJCbUPIX8bpoE80pBRbwFrDIEvna08/4QsjPWBQtmBWsbp9i73w7aM565OTgnEBuicesDBcLJKWoapdFdLzDKr7A==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230016)(4636009)(136003)(376002)(39860400002)(346002)(396003)(36840700001)(40470700004)(46966006)(8676002)(4326008)(70586007)(70206006)(82310400005)(110136005)(478600001)(316002)(54906003)(8936002)(40480700001)(2906002)(5660300002)(7416002)(40460700003)(36860700001)(86362001)(36756003)(336012)(426003)(82740400003)(186003)(81166007)(41300700001)(1076003)(26005)(83380400001)(2616005)(356005)(6666004)(47076005)(7696005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2022 06:13:11.5983 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f000a1d5-e8f1-4d5b-ad38-08da6ae016f5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT021.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4384
X-Mailman-Approved-At: Thu, 21 Jul 2022 17:58:03 +0200
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Sunil-kumar.Dommati@amd.com, Lucas Tanure <tanureal@opensource.cirrus.com>,
 Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>,
 open list <linux-kernel@vger.kernel.org>, Basavaraj.Hiregoudar@amd.com,
 Takashi Iwai <tiwai@suse.com>, Liam
 Girdwood <lgirdwood@gmail.com>, Randy Dunlap <rdunlap@infradead.org>,
 Syed Saba Kareem <Syed.SabaKareem@amd.com>,
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>, Alexander.Deucher@amd.com,
 Julian Braha <julianbraha@gmail.com>, Daniel Baluta <daniel.baluta@nxp.com>,
 Bard Liao <bard.liao@intel.com>
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

From: Syed Saba Kareem <Syed.SabaKareem@amd.com>

RPL Platform drivers can be built by selecting necessary
kernel config option.
The patch enables build support of the same.

Signed-off-by: Syed Saba Kareem <Syed.SabaKareem@amd.com>
Reviewed-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 sound/soc/amd/Kconfig      | 10 ++++++++++
 sound/soc/amd/Makefile     |  1 +
 sound/soc/amd/rpl/Makefile |  5 +++++
 3 files changed, 16 insertions(+)
 create mode 100644 sound/soc/amd/rpl/Makefile

diff --git a/sound/soc/amd/Kconfig b/sound/soc/amd/Kconfig
index 9c2fef2ce89f..08f5289dac54 100644
--- a/sound/soc/amd/Kconfig
+++ b/sound/soc/amd/Kconfig
@@ -117,3 +117,13 @@ config SND_AMD_ACP_CONFIG
 	 driver modules to use
 
 source "sound/soc/amd/acp/Kconfig"
+
+config SND_SOC_AMD_RPL_ACP6x
+        tristate "AMD Audio Coprocessor-v6.2 RPL support"
+        depends on X86 && PCI
+        help
+          This option enables Audio Coprocessor i.e ACP v6.2 support on
+          AMD RPL platform. By enabling this flag build will be
+          triggered for ACP PCI driver.
+          Say m if you have such a device.
+          If unsure select "N".
diff --git a/sound/soc/amd/Makefile b/sound/soc/amd/Makefile
index 8823f6f28611..0592e7c5c407 100644
--- a/sound/soc/amd/Makefile
+++ b/sound/soc/amd/Makefile
@@ -17,3 +17,4 @@ obj-$(CONFIG_SND_SOC_AMD_ACP5x) += vangogh/
 obj-$(CONFIG_SND_SOC_AMD_ACP6x) += yc/
 obj-$(CONFIG_SND_SOC_AMD_ACP_COMMON) += acp/
 obj-$(CONFIG_SND_AMD_ACP_CONFIG) += snd-acp-config.o
+obj-$(CONFIG_SND_SOC_AMD_RPL_ACP6x) += rpl/
diff --git a/sound/soc/amd/rpl/Makefile b/sound/soc/amd/rpl/Makefile
new file mode 100644
index 000000000000..11a33a05e94b
--- /dev/null
+++ b/sound/soc/amd/rpl/Makefile
@@ -0,0 +1,5 @@
+# SPDX-License-Identifier: GPL-2.0+
+# RPL platform Support
+snd-rpl-pci-acp6x-objs	:= rpl-pci-acp6x.o
+
+obj-$(CONFIG_SND_SOC_AMD_RPL_ACP6x) += snd-rpl-pci-acp6x.o
-- 
2.25.1

