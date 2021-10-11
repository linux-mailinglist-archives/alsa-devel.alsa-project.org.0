Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1148A428648
	for <lists+alsa-devel@lfdr.de>; Mon, 11 Oct 2021 07:38:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 84CF81687;
	Mon, 11 Oct 2021 07:38:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 84CF81687
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633930737;
	bh=L4GkKp8ZzsmSoQIMHK0x3pRyvn6yLkIK0q+jUEs+mCs=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=DVNlyqsf1oUkTqmM3MMX22dnCGlPHd2UQFbDGG8NGMqf96hJYaAO6ZJhJ0BfwCzos
	 q5jA9ZE1YVIz0CU7iDjYX8eCglc9lbVpUUFQO0HRVOK8/2W8RBYW4a8OceuTj0UKY0
	 VoaP2zLl9cPjUeWVFhpYdHMzYkw0gOJuahv+aTXU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EEA86F8028D;
	Mon, 11 Oct 2021 07:37:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CB8AEF80269; Mon, 11 Oct 2021 07:37:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2048.outbound.protection.outlook.com [40.107.243.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D49CEF8016D
 for <alsa-devel@alsa-project.org>; Mon, 11 Oct 2021 07:37:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D49CEF8016D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com
 header.b="JEaR3Z61"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lTs1odZ0uyxZbX7mdOyJ8vMvmvntl2Hdo7z7zpvQkglMJEveCE5l3z6fSerTMFUU/CCIL9EFHVd/X2mnD0Uyg6pivYLBgF01bAI4TzDCfbVPjKX2/fZPwWidCbIOSvoqsCXDzTK/C0wInrsyqdiuPjjL0t4rbaI+4eRUZ+6PqFfvBbW8FKlBzFTgeWG8Q+o+0hYWcnTu+CHu5IgIwaTqsFIVNtp7doID+GhEz0eYyadCQ68JHGsgU532PbBV/gShZCOQ6wSJiHz8pEfBWgycU4zn84BONzc2SFBqORcLRM/6cETGbtNMtFRdygxAl+UMUYabjUgHorLAXH6vkMDhxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vu9RHRy+0COJ9OP7dJS2IcscpRd88bxZRHnNJFCB0zE=;
 b=TafkDTRlQ+xHf1uVW78ImwcHclUZSwPpZjda+rAc8BwEXIFk+2O2LzieNGDKyZGaXA6CmCS5PQbgZf5JbZEliOqDwCiEF5GeVjD0CSo644jFzvkteeAgYW1ZRB+2Z3PXTgw5mzn2ARGp/HR6Kz0biA28x7fs9FXGU1ZbK3A0P1NOHmW5zRJPysIe/1H9pb89Edq2awPDZBpF4qsQcUP2M9G6YLtjbRrkkwQl/bg2dD+pIvQp22Dtpg6gvFrTjmoZKXi3ZjD/B6LmhSd81Q7eZPfQKhG7Z2vXqEUhQ41+9KTrH+1FerEV/IgqPDUkAWPXJYfGtfcXqmGn8fcGKKnOtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vu9RHRy+0COJ9OP7dJS2IcscpRd88bxZRHnNJFCB0zE=;
 b=JEaR3Z61HWPEBEN1bCPS6zOcuCQjk7cMyUeOEPPeXODOceYFJo9DSxzhou9bnPwmqYNKhm1zC6UjHBUjkfQdcOhz2jvhKPRjboyBc9WCflzTz3Av2NnAvJ4gNpNgthRS7PSLDgt7h6NcopaOFLpxQxPSU4p4AdNLia+d/e4gBNw=
Received: from MWHPR07CA0001.namprd07.prod.outlook.com (2603:10b6:300:116::11)
 by CO6PR12MB5460.namprd12.prod.outlook.com (2603:10b6:5:357::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.19; Mon, 11 Oct
 2021 05:37:29 +0000
Received: from CO1NAM11FT041.eop-nam11.prod.protection.outlook.com
 (2603:10b6:300:116:cafe::b7) by MWHPR07CA0001.outlook.office365.com
 (2603:10b6:300:116::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.18 via Frontend
 Transport; Mon, 11 Oct 2021 05:37:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT041.mail.protection.outlook.com (10.13.174.217) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4587.18 via Frontend Transport; Mon, 11 Oct 2021 05:37:28 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.8; Mon, 11 Oct
 2021 00:37:28 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.8; Sun, 10 Oct
 2021 22:37:26 -0700
Received: from LinuxHost.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2308.8 via Frontend
 Transport; Mon, 11 Oct 2021 00:37:24 -0500
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
Subject: [PATCH 00/13] Add Yellow Carp platform ASoC driver
Date: Mon, 11 Oct 2021 11:26:08 +0530
Message-ID: <20211011055621.13240-1-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9b9c1fb7-77c2-4bfe-794a-08d98c7936f1
X-MS-TrafficTypeDiagnostic: CO6PR12MB5460:
X-Microsoft-Antispam-PRVS: <CO6PR12MB5460A92F1214A910FEE2568A97B59@CO6PR12MB5460.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3044;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KFyB8aa8zgInzoJ4klCBodJ062g+60weENn8jo4SG/H76O+BvvbSNroDm5CheOZZ/2ziBEYELW1jeof3wlzV/uF8ppESqlSdWuCaR4bBob87E3EBYMnEI/qj4sW21yQorwqyXmZSEKawT7nsHq4egMU58PmrCidk4GxKwF4786YX+r9fEDtDz/GtWV97J9veqU/H2BvOlr8N+ToBG5wWA4YXoBE34XQYjZq1UBqpoBJnsSNl6dOB/wZLRVgzmn+GF8NSwQTKLcKKKwEQaUqL+La0QGRHt/ay9GBwXo9qRq3K9FzysFPrRHYGwpRdyRqLwfsAWQk79ginv/ZlcRqdEbRZu0VY78UrcIjuM0svdxPY0E/xz/0l0IBoEzLJaPIj4l40hHbFwQJYe+tfdzQ8cvJIKL9gsCPrz+Slce7c533ZaZaLWUcH05cBDD8CSQWGvBf7ghHlS7sFYL/GfUYzqu+rnNez9Ok/Rx8uPPngNR5cclsDRZZkgEpEqGiwiayb0A9OGxMXkRwitH7hv6sA2+GFz7xeu1iTJx9rSV1/Mtvf6BxWLUL3xTBoA1BpjxB1M47hqMoHDq//8P5F5USTLRCLGCJ0fyPyMSskBBTn3MLjS9ctWAoROE/4Npaza3o1GzgUvJWIRQOL49F0gVpKEJxr4pxU99yEPU3WBEvXhlHnsuTkAVKpwqR2H7ViXLn8gYtSa9Q99p3Z8wdNlWe56O+ZHNlp5KkULvVjM0yzfGY=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(46966006)(36840700001)(7696005)(5660300002)(2616005)(186003)(508600001)(81166007)(82310400003)(4326008)(426003)(356005)(8676002)(70206006)(70586007)(336012)(110136005)(316002)(54906003)(36756003)(1076003)(47076005)(36860700001)(6666004)(26005)(83380400001)(8936002)(2906002)(86362001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2021 05:37:28.8813 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b9c1fb7-77c2-4bfe-794a-08d98c7936f1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT041.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR12MB5460
Cc: Sunil-kumar.Dommati@amd.com, Richard.Gong@amd.com,
 Basavaraj.Hiregoudar@amd.com, Mario.Limonciello@amd.com,
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

Yellow Carp platform is new APU series based on acp6.x design.
This patch set adds an ASoC driver for the ACP (Audio CoProcessor)
block on AMD Yellow Carp APU with DMIC endpoint support.

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
  ASoC: amd: enable yc machine driver build

 sound/soc/amd/Kconfig                     |  13 +
 sound/soc/amd/Makefile                    |   1 +
 sound/soc/amd/yc/Makefile                 |   9 +
 sound/soc/amd/yc/acp6x-mach.c             |  76 ++++
 sound/soc/amd/yc/acp6x-pdm-dma.c          | 447 ++++++++++++++++++++++
 sound/soc/amd/yc/acp6x.h                  | 107 ++++++
 sound/soc/amd/yc/acp6x_chip_offset_byte.h | 444 +++++++++++++++++++++
 sound/soc/amd/yc/pci-acp6x.c              | 343 +++++++++++++++++
 8 files changed, 1440 insertions(+)
 create mode 100644 sound/soc/amd/yc/Makefile
 create mode 100644 sound/soc/amd/yc/acp6x-mach.c
 create mode 100644 sound/soc/amd/yc/acp6x-pdm-dma.c
 create mode 100644 sound/soc/amd/yc/acp6x.h
 create mode 100644 sound/soc/amd/yc/acp6x_chip_offset_byte.h
 create mode 100644 sound/soc/amd/yc/pci-acp6x.c

-- 
2.25.1

