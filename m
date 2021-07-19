Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1057F3CE4BE
	for <lists+alsa-devel@lfdr.de>; Mon, 19 Jul 2021 18:35:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 83E7F1662;
	Mon, 19 Jul 2021 18:34:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 83E7F1662
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626712534;
	bh=33T07eO3BHvZOXGyKX+awl7oy6WAsjj5wWbU8JZiuww=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=cskvrDLZmb8LfhnCbSVx7LkBM2unogAm+A66hNnXV7kEmNN9nVDiIks6oFqLkHNZl
	 2PBqGimUKxPQ3xfGTBKJmQy6OnnSur3xypqH3xAebDky8um0H7MYXQPWEK1jcn3NF1
	 UcC4mbXQZDZTyFLTaPjwqNKJEZ1qZY+ITHPwST5M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ED3A8F80256;
	Mon, 19 Jul 2021 18:34:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3F56FF80227; Mon, 19 Jul 2021 18:34:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2068.outbound.protection.outlook.com [40.107.223.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7CBBAF800C5
 for <alsa-devel@alsa-project.org>; Mon, 19 Jul 2021 18:33:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7CBBAF800C5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com
 header.b="hRTMQUNJ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IvYZNEdhdgQ3j1GDGaBlwbYXF11QlhbzKXdR5OYNkB6r3kr8vBVbrwg5HsFHYIAgjf0oZ9KbybF0cvHI1I54/Gs6ePAc9/+20/Ba6KO/zwC1trPd1gwj89ThLtonsD9FURLsjYBp5mndTcHqfz9ei8pfr4zX9AN5uPN0al8cHiVwBHmlV/X1ei+ZQb0P1svhmPWkZgywIj8Caw1iLQPXJRc1q7Sp8RftldyovrB0caxxD9qtYR2hl2JXvChqDAJMegJjlr9Gw7a7pQSsc6Tzan6AQoMZUNwXtAN4lMMG7S+F4VQ1F2rxEx65NlsVWQI7kiOt4J5rPx/6Dbc3Krg/zA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C6fIYDp+acR6O8es/MgfWUH3pD5GpMcSDPmS7TuCVVU=;
 b=CN2USjm1GvAF0U+9yFWf6o2AYiImWYdnwv/pJd0s4xU6DDvvJIz/v6ew8PCrrYPPXBmuR2SNXJ+JkKeyCrQ6CXL42QUnsQ1eRwVUVk3wl60OO2RyENg/EJXWqfd1AZNVGevRy+3xe1kTZlk2fYdnGvg2KxVFEkLvklGsyeBQF9knxoLfEqlAQKyS7mCRah8ANo4BaIpbpaXyD2j4LBX2ws+oTIZGFQ+gkI7j7nFhVBTmaN9RLmK4ccVYIK2bQXFTPNJ+VB3KwvcARjhiSX1NNV5P9FMc7tIzyuEYopsmPUOlrbH6KApwztyXD3f2e0wwWWAQHz33Rjl8EpBt8xVY1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C6fIYDp+acR6O8es/MgfWUH3pD5GpMcSDPmS7TuCVVU=;
 b=hRTMQUNJQgO/2Lme3gZEjl+jNEfHo5S4/SM1sCsscskT6NQlcsaMq0KSzEvmCDsMgVG8TaMDU595h5rykPyNH5/d+15XP7e50LODnhGrNZ1N9rdbW4S3E+P7DYiydDq3z4QARWQQDKfEAVZ5XM7l9GJ7OZLvv9GTsbSeAPG90cw=
Received: from DM5PR06CA0057.namprd06.prod.outlook.com (2603:10b6:3:37::19) by
 MN2PR12MB3727.namprd12.prod.outlook.com (2603:10b6:208:15a::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21; Mon, 19 Jul
 2021 16:33:50 +0000
Received: from DM6NAM11FT019.eop-nam11.prod.protection.outlook.com
 (2603:10b6:3:37:cafe::12) by DM5PR06CA0057.outlook.office365.com
 (2603:10b6:3:37::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21 via Frontend
 Transport; Mon, 19 Jul 2021 16:33:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com;
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DM6NAM11FT019.mail.protection.outlook.com (10.13.172.172) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4331.21 via Frontend Transport; Mon, 19 Jul 2021 16:33:50 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Mon, 19 Jul
 2021 11:33:49 -0500
Received: from LinuxHost.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2242.4 via Frontend
 Transport; Mon, 19 Jul 2021 11:33:47 -0500
From: Vijendar Mukunda <vijendar.mukunda@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
Subject: [PATCH V3 00/12] Add Vangogh ACP ASoC driver 
Date: Mon, 19 Jul 2021 22:21:28 +0530
Message-ID: <20210719165140.16143-1-vijendar.mukunda@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 50f26f97-625e-4bcf-1908-08d94ad2fd7e
X-MS-TrafficTypeDiagnostic: MN2PR12MB3727:
X-Microsoft-Antispam-PRVS: <MN2PR12MB3727445B853EE93F6CD2586397E19@MN2PR12MB3727.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:390;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: spyAmH+V6b0r9ArnKe2ZOMFLwSz/5qokEiIEjBNcG9oHGad0SeVThjRrxxofVruDoDW1XsoKjLHhRfGdZrMIGlH8lAs3o5HnbPJCcazyYNWyxCCgg/wwNQlbOuIwQjreM1oPN+kxiUsOo2si2tx1nW3eH6gPKD5oIRxpMz/A7UTa7/nZeBefPtAxZg4jTvgjaAFcw6kPYnltrzBSuTd2/nqqvpHdO8pedxu4ApgBWA8lfgrK+fgTfFq4z69lGJr7dRPhMqW0FbOpqB9FTwhXrNvqkttZl9gM0/CFhd1XIXMzfzliYBMHAF41bvmWp+FhK+kyA10Q7ddsZic4U9f7Et0yXVofr3x6qgHfedZWO+CuPWl3+ULvaEIoiU004srGxkkES9l++KLpeWTKBXcduB0GwHa6kMoxLjh+rmTN3vHDV2NJwwGsmfMscyqcx9nSclfOguRJhRuZ4oP0p5bl32yxva9Qh3a8JJZoNOp3OwMQdl4B0DtqnYRB3cZd7V9xHTAX1uvG6KaQ7gFO9iFgGKBNB9/iyPDkfUXH2JFzs40U5SE80s4KdTagoZ/5cQSn+mKnv943PShSFS1t+k+awRz8HjwwS+WEeYE4z7c6h2vpjjTtvho80GYcnk0RRAjBYNPcL9SEeherkCNfc1YV6MfPtfQOexU+n9gnMHxnENIgs/QskL2b8ZKfcd5LAWkzfeNpkTVRaDrMj4DD6qoFi1B32p57cTFFp2DFxZdtKRs=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(376002)(136003)(39860400002)(396003)(346002)(46966006)(36840700001)(1076003)(4743002)(26005)(82310400003)(82740400003)(356005)(186003)(5660300002)(6666004)(47076005)(36860700001)(83380400001)(7696005)(2906002)(36756003)(336012)(70206006)(70586007)(316002)(44832011)(8676002)(110136005)(54906003)(8936002)(426003)(86362001)(2616005)(478600001)(4326008)(81166007)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2021 16:33:50.5043 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 50f26f97-625e-4bcf-1908-08d94ad2fd7e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT019.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3727
Cc: Alexander.Deucher@amd.com, Sunil-kumar.Dommati@amd.com,
 krisman@collabora.com, Vijendar Mukunda <vijendar.mukunda@amd.com>
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

This adds an ASoC driver for the ACP (Audio CoProcessor)
block on AMD Vangogh APU.

Changes since v2:
          - remove extra stuff from Make file

Changes since v1:
          - add comment for acp_readl() & acp_writel() API's in
            common header file.
          - add amd: tag in commit message
          - modify condition check in acp5x_power_on()
          - removed acp_power_gating flag related code
          - drop acp5x_audio_remove() API
          - use single flag for handling irq status
          - fixed indetation issue and used dev_err instead of pr_err
          - drop acp5x_dai_remove() API
          - use SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK
          - use PM related Macros in ACP PCI driver
          - use PM related Macros in ACP DMA driver
          - remove extra line in Make file

Vijendar Mukunda (12):
  ASoC: amd: add Vangogh ACP5x IP register header
  ASoC: amd: add Vangogh ACP PCI driver
  ASoc: amd: add acp5x init/de-init functions
  ASoC: amd: create acp5x platform devices
  ASoC: amd: add ACP5x PCM platform driver
  ASoC: amd: irq handler changes for ACP5x PCM dma driver
  ASoC: amd: add ACP5x pcm dma driver ops
  ASoC: amd: add vangogh i2s controller driver
  ASoC: amd: add vangogh i2s dai driver ops
  ASoC: amd: add vangogh pci driver pm ops
  ASoC: amd: add vangogh i2s dma driver pm ops
  ASoC: amd: enable vangogh acp5x driver build

 sound/soc/amd/Kconfig                       |   9 +
 sound/soc/amd/Makefile                      |   1 +
 sound/soc/amd/vangogh/Makefile              |   9 +
 sound/soc/amd/vangogh/acp5x-i2s.c           | 429 ++++++++++++++++
 sound/soc/amd/vangogh/acp5x-pcm-dma.c       | 525 ++++++++++++++++++++
 sound/soc/amd/vangogh/acp5x.h               | 192 +++++++
 sound/soc/amd/vangogh/pci-acp5x.c           | 327 ++++++++++++
 sound/soc/amd/vangogh/vg_chip_offset_byte.h | 337 +++++++++++++
 8 files changed, 1829 insertions(+)
 create mode 100644 sound/soc/amd/vangogh/Makefile
 create mode 100644 sound/soc/amd/vangogh/acp5x-i2s.c
 create mode 100644 sound/soc/amd/vangogh/acp5x-pcm-dma.c
 create mode 100644 sound/soc/amd/vangogh/acp5x.h
 create mode 100644 sound/soc/amd/vangogh/pci-acp5x.c
 create mode 100644 sound/soc/amd/vangogh/vg_chip_offset_byte.h

-- 
2.17.1

