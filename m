Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B26343171D
	for <lists+alsa-devel@lfdr.de>; Mon, 18 Oct 2021 13:22:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 965DF18FE;
	Mon, 18 Oct 2021 13:22:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 965DF18FE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1634556174;
	bh=hPngk3jC4V90lDAsnkPMMwzUWDtCTiIUJqvEXLYN2po=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=K2ZTXkWsv4olOOaFlIhxmrUdFsU0pPRWJ1TEo8d4aopGOQuCVL4S2DUiOUhrImsQi
	 shLVNwHn1nbN+dtoT6MdtOHL/V6bVYrKPvkGjxAemMbM6YnFr3DtgRqJI555VzMVrZ
	 SqxiMCrllYjapsGGccFgWVJ+kkJ8JAou68Xyw4jo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F0CB5F80224;
	Mon, 18 Oct 2021 13:21:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3F880F80111; Mon, 18 Oct 2021 13:21:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2053.outbound.protection.outlook.com [40.107.243.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 570E0F80111
 for <alsa-devel@alsa-project.org>; Mon, 18 Oct 2021 13:21:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 570E0F80111
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com
 header.b="zh4LUSbv"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iICEkfcTJd8gffNYPSg/XBSW9Opc0BMWVcE+HLjcdSlr9bSa27itdMRL23qXp4Gr3nqwShkhHASzP9c7AC1F1vvFf4gYtG1GtcrId1iT2mtnKns9O1PqR6NNP5zFVR62LWJqaPjnBXzg4jibiaZHjR8kV2o1+4UYs7sf4BUYwnrEBOGBsqlMld3ehQjMcwTyPTkRTFssUH3YAnvdfGKALokPYQ7+CFi2ym/cQrTm6r2/DbBjhHn/AdbKy9Im5+JkNbB3abqWJX1vVYvWZZP4f668kRw1QnL//YO9qKEdoaajHqNl8++QIXXdRx3zLhN7ERaHPdBP7bQu08s39CJMlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qRn6cQKPayE8DMPdKYtrIsyK9HvyU4o63bDQ+FhxMTA=;
 b=kZ26C51Dvk/KtkgwIUI0CUTyZOs/RhEDU9YrbzUPGgv3Wo3wfWGJHNFZLPPR4/Dw4YXdhsLImlMN36e87vFQxfbmQbra195JS4ZVGr8NLusYYgNg9WGWm3DRNdBpW9jjfq7B6W+L5ccLZlJzQJCWfaelcKy99Q9RlLVvhPAAq8SHwGZXrA0WLPjD/YQON32JxJyFNY138xSRO4HwY8OQUEAQYnxYWTS5kmiEdgeB2gfLw7eDBx9QwZ0yx/pxze+uPl9AjZ59d9m1H1WBsFOLNeN4QlZUZE3zC9TrsuebHKnNCwsRWv0zyJIN4K10K0mVzdic8RrZehH7vzjzfJnsmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qRn6cQKPayE8DMPdKYtrIsyK9HvyU4o63bDQ+FhxMTA=;
 b=zh4LUSbv0axBv0T5c2QJezKmo+cL4a9luKcc18uozjn8OiM9ZjlPVQ39GchjAIagyQ3bXSjtsTfDN+9g41uU5eNpzv2g7JjEXMkOhuIIQqgTevnr1TDRqTxGbu33uTJCz5X6nnASEryao81fTOGFn5R3Dnidxr8CeGBQi1QdveA=
Received: from DM6PR13CA0001.namprd13.prod.outlook.com (2603:10b6:5:bc::14) by
 SN6PR12MB2848.namprd12.prod.outlook.com (2603:10b6:805:77::30) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4608.16; Mon, 18 Oct 2021 11:21:25 +0000
Received: from DM6NAM11FT030.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:bc:cafe::26) by DM6PR13CA0001.outlook.office365.com
 (2603:10b6:5:bc::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.10 via Frontend
 Transport; Mon, 18 Oct 2021 11:21:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT030.mail.protection.outlook.com (10.13.172.146) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4608.15 via Frontend Transport; Mon, 18 Oct 2021 11:21:24 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.15; Mon, 18 Oct
 2021 06:21:24 -0500
Received: from vijendar-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2308.15
 via Frontend Transport; Mon, 18 Oct 2021 06:21:21 -0500
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
Subject: [PATCH V2 00/13] Add Yellow Carp platform ASoC driver
Date: Mon, 18 Oct 2021 16:50:31 +0530
Message-ID: <20211018112044.1705805-1-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 97ac6d06-ee87-4a78-d2a8-08d992296bdc
X-MS-TrafficTypeDiagnostic: SN6PR12MB2848:
X-Microsoft-Antispam-PRVS: <SN6PR12MB28486ED06B310DF2EB31ABE597BC9@SN6PR12MB2848.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3513;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SDHA1PiU/Gse8KFESl+bDBcVh8c7FUG5weQHi/TIVCr+LUG/FIIjOV66JFvScSU+O2QJtkCJ4cLvZZzZByhlYPRke+xtOlXgKCkzXxOLpbYEFH4V9vsdtoNEHBusI+BHvJPKJm/wPbyFN78K15YKfRtoxHUmI2UwQhqWZ4kPBe1x5nm7sfVh2mnn05a4YyUawecGU46uKp46vwjx2xDwrZ/y6XE8W3Umd55Rt6uI8UQAWKcNckpHkTdIwL4TfkI4K2ZVojsAW3AaqzbfwcoGCKV+BZqZnuxex0ebbCGvGNZz8HYW4EOlR/cx25XumetdTUq0yPwulOfj6JE2H+U91H2iNnr+E4Srd+RWscKp6U9qmBF1R5E6I0jGdaXQwHx6Ya6hblwIOlHwckG5erWwmzFX/RPY0OSsyNLRv6wMNwqNvkEXlkorYn5RmLnNjepCy7VyBLlaPupq+VYRJ5rvB3tbUMxLNDhJlwYZwR7QRJjBsmtLK9p7mq4EYHrYKi+So0OFD+sbTAMeK2bo7Y4KcOqDniDL7Aw0aWKyX9T89EaDs4+vFzU5SZ7eSjasf0dS+0Idu6hrtuO8tSQnDYeRSAY5HDpgGKdnaLn6DpBdY1Est9UyPH/Z3Z3uDyPuEw9nhGqU4rrwcX0sh0x+LTry9EDAC4293gWGV36aq4CkFjcyKk++vLOw+mOuLkVby/ZWFwu/Fkc0BLxzejZIqq3+bpw3zO+Rai/XoQ3QnKOZR4U=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(36840700001)(46966006)(47076005)(8676002)(8936002)(110136005)(4326008)(316002)(81166007)(26005)(7696005)(356005)(5660300002)(83380400001)(86362001)(336012)(186003)(70206006)(54906003)(508600001)(82310400003)(2616005)(1076003)(36860700001)(70586007)(2906002)(6666004)(36756003)(426003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2021 11:21:24.9744 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 97ac6d06-ee87-4a78-d2a8-08d992296bdc
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT030.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB2848
Cc: Sunil-kumar.Dommati@amd.com, mlimonci@amd.com, richgong@amd.com,
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>, Alexander.Deucher@amd.com,
 Basavaraj.Hiregoudar@amd.com
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

Yellow Carp platform is new APU series based on acp6.x design.
This patch set adds an ASoC driver for the ACP (Audio CoProcessor)
block on AMD Yellow Carp APU with DMIC endpoint support.

changes since v1:
  - fixed SPDX commenting style in acp6x pci driver.
  - fixed Copyright commenting style in acp6x pci driver,
    pdm dma driver and machine driver files.
  - fixed local variable check logic in acp6x_power_on() function.
  - fixed Kconfig indentation issue
  - removed irq_flag local variable in irq handler. 
  - add dmi info check in machine driver probe

Vijendar Mukunda (13):
  ASoC: amd: add Yellow Carp ACP6x IP register header
  ASoC: amd: add Yellow Carp ACP PCI driver
  ASoC: amd: add acp6x init/de-init functions
  ASoC: amd: add platform devices for acp6x pdm driver and dmic driver
  ASoC: amd: add acp6x pdm platform driver
  ASoC: amd: add acp6x irq handler
  ASoC: amd: add acp6x pdm driver dma ops
  ASoC: amd: add acp6x pci driver pm ops
  ASoC: amd: add acp6x pdm driver pm ops
  ASoC: amd: enable Yellow carp acp6x drivers build
  ASoC: amd: create platform device for acp6x machine driver
  ASoC: amd: add YC machine driver using dmic
  ASoC: amd: enable Yellow Carp platform machine driver build

 sound/soc/amd/Kconfig                     |  21 +
 sound/soc/amd/Makefile                    |   1 +
 sound/soc/amd/yc/Makefile                 |   9 +
 sound/soc/amd/yc/acp6x-mach.c             | 194 ++++++++++
 sound/soc/amd/yc/acp6x-pdm-dma.c          | 448 ++++++++++++++++++++++
 sound/soc/amd/yc/acp6x.h                  | 107 ++++++
 sound/soc/amd/yc/acp6x_chip_offset_byte.h | 444 +++++++++++++++++++++
 sound/soc/amd/yc/pci-acp6x.c              | 338 ++++++++++++++++
 8 files changed, 1562 insertions(+)
 create mode 100644 sound/soc/amd/yc/Makefile
 create mode 100644 sound/soc/amd/yc/acp6x-mach.c
 create mode 100644 sound/soc/amd/yc/acp6x-pdm-dma.c
 create mode 100644 sound/soc/amd/yc/acp6x.h
 create mode 100644 sound/soc/amd/yc/acp6x_chip_offset_byte.h
 create mode 100644 sound/soc/amd/yc/pci-acp6x.c

-- 
2.25.1

