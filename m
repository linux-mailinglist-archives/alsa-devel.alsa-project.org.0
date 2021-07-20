Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 645273CFF4B
	for <lists+alsa-devel@lfdr.de>; Tue, 20 Jul 2021 18:26:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D54461669;
	Tue, 20 Jul 2021 18:25:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D54461669
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626798365;
	bh=V/RSoCvqUueHuWEhw1RIZGXUiphHpHJPkI81LKTyrz4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Ytff1TZtqlUX3m1HqZ4c+LnRhBfbi9hSi2te2IwTnHCYAM6F+7l4/WwAB9JgOm7YW
	 eLLSHX5564q1cb3ocXdL8fKjDLUzT0fyQ/DJZPQ4FiBBAwytwXtPZW/CUWZe+QWrlT
	 McrLXOXaQK7PFvhKbZcZVgkMZdR4P/enpHNBuqK8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A0EE7F804E2;
	Tue, 20 Jul 2021 18:22:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 56A97F804FC; Tue, 20 Jul 2021 18:22:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20606.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e8a::606])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E15EBF804CF
 for <alsa-devel@alsa-project.org>; Tue, 20 Jul 2021 18:22:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E15EBF804CF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com
 header.b="N3G+CEzP"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mPPXv3S/N4eq21+WKvhWg0D+qNFcYpY5SjNMRpGjQ+221g4UlmrkGfcH763NIbdxpeCOcXlgwGXopLAdpg+n28yJMO8vBofD7vy8gIbFGp+4MQpUT/pMsuB8pOnK+n13gEqyFVgX2cvU6P9WJaigvbi+vW3Mr4vinmVaeFY8fZhDgVLKV2SfaaQPdkv3kNBPqyzaRo87KXYMTrZCs8TcYVYOq/SkUPVU9ITuldw8cFtTgzmKPOesXzC6RgmKnwDdnn1P8M336OxezjG6/4BIWss3/5x6tzwCW9hDqH8RYMs82ZGJFITDSynOKa9DURGWAkUM6TxPcFrgSqOsPUv0gA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1i0+9gPb94UsQr3Sp0gKBRXkObFv558cCC3DKJKN7Wk=;
 b=gvznEpi4q2a4xqzWjIYD15fhVKdH9IgB7mISGzSXJVXqpjuxw69TbdoTBYiC2rUj6bv24rhI7hDhTV4TLY27HnJV3f6IudBHU53RewYhsCFyzxxvzHdLBbYgp8MvILNAiG6RMGoLvRt7CcdsJPnrUr+EE8Rd86vnwDyH/jac5XhZoaQ/OUNCTkrEjIHCbIomz9MgvGb0cyn7CI2WDu0WdUYsGS4JCvND4YpDAl2da1ql5NRn3+fhRpZ9meHDray/V89HbkiKqSudSxnbAW5yx+PonViRusEdsjI9RArq00FC0gd2xYoA6Ug6CNLdF5SNXBPEZc4DrT1OeE/4KG/QdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1i0+9gPb94UsQr3Sp0gKBRXkObFv558cCC3DKJKN7Wk=;
 b=N3G+CEzPwSl85s0zNM/nD4SkwChgLTd/6emcHx0pnaQtRRw4bZRL5cBueSe8YJ3S1HsjXkGhvNDBtzIteOxGyd1hmZfy1cP6YMmpCCVp1pWhnKeVuQUxGvzRfSefUBOBjuZBcaJQe4QRKTx+n3HX9w4OP7pdLe6KIO9dH25Q15s=
Received: from MW4PR03CA0360.namprd03.prod.outlook.com (2603:10b6:303:dc::35)
 by DM4PR12MB5149.namprd12.prod.outlook.com (2603:10b6:5:390::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.23; Tue, 20 Jul
 2021 16:22:13 +0000
Received: from CO1NAM11FT013.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:dc:cafe::ec) by MW4PR03CA0360.outlook.office365.com
 (2603:10b6:303:dc::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21 via Frontend
 Transport; Tue, 20 Jul 2021 16:22:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT013.mail.protection.outlook.com (10.13.174.227) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4331.21 via Frontend Transport; Tue, 20 Jul 2021 16:22:12 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Tue, 20 Jul
 2021 11:22:11 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Tue, 20 Jul
 2021 11:22:11 -0500
Received: from LinuxHost.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2242.4 via Frontend
 Transport; Tue, 20 Jul 2021 11:22:02 -0500
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
Subject: [PATCH v4 12/12] ASoC: amd: enable vangogh acp5x driver build
Date: Tue, 20 Jul 2021 22:07:32 +0530
Message-ID: <20210720163732.23003-13-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210720163732.23003-1-Vijendar.Mukunda@amd.com>
References: <20210720163732.23003-1-Vijendar.Mukunda@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 33fe1a99-2684-49cb-c9db-08d94b9a880c
X-MS-TrafficTypeDiagnostic: DM4PR12MB5149:
X-Microsoft-Antispam-PRVS: <DM4PR12MB5149899C818B880291B0B15297E29@DM4PR12MB5149.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: A3D1g9zymY6wCMMFyo4Q6XaAkWVlBAWLbRazs7v8t4+wBGbx7ohH/VkRdej4GiZ6Zruv/lA8BzLYOdFhfb5Iihayey9fAL67/4V5sTwYyxWJlUpXqQD2rHcw4trdt1Gi9NkKY5aVow2yTcWQDRAi6zgq+mwG/SEvV3bzOPmYAgggRcqzU7Hjgb25IzJAFcpUiuGIWIZO0ZCc964SctGubx7Vf8qKhPmXdev3hrzni3ZbGjUtMojQ3aD6Pit/qo9FRX3UVzcczYn6etrWhfkRDwxUfuiB62qn5oBofjy/V44UlLNG19/OpX8xT0KxXcXIg2FolP+Xr/TUK85c1C7mi+5Xmom5nbl93HIAv2bfxBjisURwH4qNo3I1VLuSaerbwycIpCmkfqdeONwkTBJQFwOOulgDSSwXDJsTcBLqY0uMARuP55I6Thr5qlaBSx3EDs1rHSpS2nRzJr5848XQvPBCSoQ4i2k3E68537xAmRBeOG7Xq67NHLRonwQbyKbQE9KG0LLQoBJOWeAXPv5FZRaeIOmkY3TOXFYB+14Ld+a1HnpIJ8b//oyXHRZuLQleYKQIZhmaYC2Yr+AKb2eLc3QAwNKYME5n5/w+k1YfLE2cZRKq1fszKjx0bMIG6A3NF2bbV0GLBicPrx7YckAtbXJHB9rBsjiv1tLRZlUy2PEt1i97YLek0M7CQ/w8AQ0IkQyLelYub/3Pha9BU8lUqqeaXc6AOTG7HdZNTE/5vDPLE68tsD6z15bKWMNIfhhtlScJAFlxoXbb+KFUM4OShi6E6cNWjkAlIsL7V7JRSw0=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(346002)(376002)(396003)(136003)(39860400002)(46966006)(36840700001)(82310400003)(81166007)(5660300002)(82740400003)(356005)(36860700001)(86362001)(478600001)(36756003)(47076005)(316002)(7696005)(336012)(426003)(2906002)(8676002)(110136005)(54906003)(6666004)(2616005)(8936002)(70586007)(70206006)(1076003)(26005)(186003)(4326008)(42413003)(32563001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2021 16:22:12.7433 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 33fe1a99-2684-49cb-c9db-08d94b9a880c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT013.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5149
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
2.17.1

