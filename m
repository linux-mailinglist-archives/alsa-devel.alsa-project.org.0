Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F05965A38FD
	for <lists+alsa-devel@lfdr.de>; Sat, 27 Aug 2022 19:00:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9CD5782C;
	Sat, 27 Aug 2022 18:59:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9CD5782C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1661619622;
	bh=dK6VMEsgrrHoZOvq9MQ7GcP2bbZFB87h8KVX1Sm1pGs=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=c7tyrB70giVUUZM9u+2lRuyGhYds8VK1/YtU1ISP1QqqBB6h9/BedcoJrck6ywu3o
	 n6y843RzAZkackY6k7JXg1mIOXOHESYsiCMcCTbOtaG0Pf0ADLdloiLXC2/P5zRspQ
	 vE6mY9ms7Ob8Z+n2dG4CL0Za3pKoMTjmeLiC3JtM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1AD40F8021D;
	Sat, 27 Aug 2022 18:59:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 303A1F80132; Sat, 27 Aug 2022 18:59:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2057.outbound.protection.outlook.com [40.107.244.57])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A4C75F800AA
 for <alsa-devel@alsa-project.org>; Sat, 27 Aug 2022 18:59:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A4C75F800AA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com
 header.b="mshFSNOz"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ER1JddzTVxGRpRzg7CaZOO8MPgp+6aRigvaFTNDHDBFwZ91ctld+bhUPUdiY58ETbGeZXsr8hk1EXewhQJwihc2TS/lnWRCToLH7wDEoD6JyQiV/qNZAM8pqpIKgJXUDSIJ/QE5cdOX/6wKjm9uoBNE2/DikhlQrEkDKxVW/vW/ZINZTm9tqE7brGHt5baTPeWCk6hBYvXzSgoJnNLAgZf04qsL1hC/ejjO/F0clmd+rYr/Cdn1zJUTx30SJR4KoCFlzDQ+Yr3k1IARhWVKlKRA+rDTErZhgiJ9CxJU2LS9tdf4PBFFUcxCkji9HmEDOoYU6CmRqSh6eXM024n9DcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7cht7G3GxRi+3xpF/S6GSNwTNxGMRMHD6P90m1IBszU=;
 b=Y7QxF02VjIgbLeBzRoDPHTEdEDkVzAIEGgpAztY5TvVJJfS/dHKChF3tUl47+2Sc3gYSW8ABOP40D+O9CMPpd4pNY7wbiFxN3+dMBfDUddOnf9Z9sIcc90J4mpClN0KcnoJcXmhPGonfMlKDa2dZqi/ubZxVwTij+zoWjYWc8XYdn2cWXx0IaNS6S/yqE6JkivLuiaslyjg1bHZ2AMGuzN2mQpqsaTT4tUDkkuczxVmQMC/C9+du1Kn1S3BbBN8r7tv4eL1cZ6qh/Rg2LcWSxneUYCNzE65z7A1HxfyBTJ3aScyP2yxCJDwrU/uoJy2Aq/EBDDWY3m5G4d0AH92Iow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7cht7G3GxRi+3xpF/S6GSNwTNxGMRMHD6P90m1IBszU=;
 b=mshFSNOzm/eaBSPAGo5D/aQgr3JIb7vemfWAn4gqHbdgBUhyb7cc8pB4ic6csX243GocdsoMQRdPiKdLABQrFQ/Put4Eeu83K+aAhI+X9WAKx6gbse67zMkCAILc2f+Oq/m2QFDvgMntJrYvwE/P7hRXBdR4G/1/AuAbe55CDuk=
Received: from BN9PR03CA0528.namprd03.prod.outlook.com (2603:10b6:408:131::23)
 by DM8PR12MB5413.namprd12.prod.outlook.com (2603:10b6:8:3b::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5566.15; Sat, 27 Aug 2022 16:59:12 +0000
Received: from BN8NAM11FT060.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:131:cafe::1b) by BN9PR03CA0528.outlook.office365.com
 (2603:10b6:408:131::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.14 via Frontend
 Transport; Sat, 27 Aug 2022 16:59:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT060.mail.protection.outlook.com (10.13.177.211) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5566.15 via Frontend Transport; Sat, 27 Aug 2022 16:59:12 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Sat, 27 Aug
 2022 11:59:11 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Sat, 27 Aug
 2022 11:59:11 -0500
Received: from amd-B450M-DS3H.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.28 via Frontend
 Transport; Sat, 27 Aug 2022 11:59:08 -0500
From: Syed Saba Kareem <Syed.SabaKareem@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
Subject: [PATCH v2 00/13] Add Pink Sardine platform ASoC driver
Date: Sat, 27 Aug 2022 22:26:44 +0530
Message-ID: <20220827165657.2343818-1-Syed.SabaKareem@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2de1cd95-ab0f-43df-d88e-08da884d774d
X-MS-TrafficTypeDiagnostic: DM8PR12MB5413:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YX1dPKH7igcEbAcRZqvltk6WlYlVTujXin5F8d6Yt0c9gKGlIlQ/V01Ax/TCZ9L/Tp8Q35iLc6KBPt8uFySxBhZiQkTwwTWqZ3TEn21P1w6ZGt0djxbeWM6n1xShC9FJQjyIILr9tDOAl/D6yRLIA58xzpcy8EGpWWdEPseYf3cpDJEVxEUMPpoBCPXECcq/DtKlUBDnSaXd+5bUTfcRihJ/I1UhiR5k5+4a1h282+P7DsMcJqSxe5qxvKJdfURGJtfiRazr36qHiMNMk3z7kbBIh+VyQ8nHimV6MbCLm87vtqCwsG8LHnCXvB1hpGy7AtXNj1AhE4INoJ4//a/5t3utDI9PwfjEJhcnPz72zNS4uzRAjut4zIEwdn4Gl53QaXnW1ZXIBvV1zvAy3S96/ZssQiaAMcrqOM7BPQ9omkpXH/ecCXg5RRF/CYGIpkLSVJnY+KkvpRzqOnxtNv2PXHdGQ8+4wUFjdgDEOI+040qiKD8lXvCmO7k4wH+NBbUryySyEJBYvzVFY0bhHS0/DUiCg4QRhnB2cd7kZWnTtgFsQzYU8gEvqWgA2W/5LUuUfgK2Te7yDuN9tP+b9yNPaqlcVvOYIrZKM6ZQMPFBlRS8Qd33NJ6CSleNPpHKrMqoud2Y8PvjI2XhXvl7hCR4FgOuUOKzRYLbkFSzUvU2c5yqOJ54AqpPumIc8wIzxKF+ZoxqgEdpSyziSQsNBo3wcyRofWqvaFU7efw/ACHYiRfwXf4YUo6Yprd3e6d1y8+gR+WXASbQti8zj4h1OuA/vE0jpfsOaiSPS9c7qjDT/1KUUJeEbk0g1fAmtn/UirHv
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230016)(4636009)(376002)(39860400002)(136003)(346002)(396003)(46966006)(36840700001)(40470700004)(356005)(478600001)(81166007)(8676002)(82740400003)(4326008)(70586007)(70206006)(36860700001)(86362001)(36756003)(316002)(83380400001)(47076005)(426003)(186003)(336012)(1076003)(7696005)(26005)(6666004)(8936002)(41300700001)(40460700003)(82310400005)(110136005)(54906003)(40480700001)(2906002)(2616005)(5660300002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2022 16:59:12.1015 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2de1cd95-ab0f-43df-d88e-08da884d774d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT060.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR12MB5413
Cc: Sunil-kumar.Dommati@amd.com, Basavaraj.Hiregoudar@amd.com,
 mario.limonciello@amd.com, Vijendar.Mukunda@amd.com, alexander.deucher@amd.com,
 Syed Saba Kareem <Syed.SabaKareem@amd.com>
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

Pink Sardine platform is new APU series based on acp6.2 design.
This patch set adds an ASoC driver for the ACP (Audio CoProcessor) block 
on AMD Pink Sardine APU with DMIC endpoint support.

changes since v1:
        -Removed subraction logic in acp62.h header file and changed 
	the address in acp62_chip_offset_byte.h file.
        -Fixed indentation in pci driver file.
        -Removed comments which states function names in pci driver file.
        -Replaced some hex values with decimals in pci driver file.
        -Corrected MODULE_DESCRIPTION in pdm driver file.
        -Removed structure variable which is used for byte count in header
	file and added new local variable for denoting the byte count.
        -Added Kfree for freeing the runtime->private data.
        -Replaced X86 && PCI with X86 && PCI && ACPI in Kconfig file.
Syed Saba Kareem (13):
  ASoC: amd: add Pink Sardine platform ACP IP register header
  ASoC: amd: add Pink Sardine ACP PCI driver
  ASoC: amd: add acp6.2 init/de-init functions
  ASoC: amd: add platform devices for acp6.2 pdm driver and dmic driver
  ASoC: amd: add acp6.2 pdm platform driver
  ASoC: amd: add acp6.2 irq handler
  ASoC: amd: add acp6.2 pdm driver dma ops
  ASoC: amd: add acp6.2 pci driver pm ops
  ASoC: amd: add acp6.2 pdm driver pm ops
  ASoC: amd: enable Pink Sardine acp6.2 drivers build
  ASoC: amd: create platform device for acp6.2 machine driver
  ASoC: amd: add Pink Sardine machine driver using dmic
  ASoC: amd: enable Pink sardine platform machine driver build.

 include/sound/acp62_chip_offset_byte.h | 444 ++++++++++++++++++++++++
 sound/soc/amd/Kconfig                  |  21 ++
 sound/soc/amd/Makefile                 |   1 +
 sound/soc/amd/ps/Makefile              |   9 +
 sound/soc/amd/ps/acp62.h               |  98 ++++++
 sound/soc/amd/ps/pci-ps.c              | 351 +++++++++++++++++++
 sound/soc/amd/ps/ps-mach.c             |  79 +++++
 sound/soc/amd/ps/ps-pdm-dma.c          | 452 +++++++++++++++++++++++++
 8 files changed, 1455 insertions(+)
 create mode 100644 include/sound/acp62_chip_offset_byte.h
 create mode 100644 sound/soc/amd/ps/Makefile
 create mode 100644 sound/soc/amd/ps/acp62.h
 create mode 100644 sound/soc/amd/ps/pci-ps.c
 create mode 100644 sound/soc/amd/ps/ps-mach.c
 create mode 100644 sound/soc/amd/ps/ps-pdm-dma.c

-- 
2.25.1

