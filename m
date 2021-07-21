Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 379313D156D
	for <lists+alsa-devel@lfdr.de>; Wed, 21 Jul 2021 19:48:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AFEA116ED;
	Wed, 21 Jul 2021 19:47:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AFEA116ED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626889697;
	bh=zX+ww6/s53Rga/gtrHsq1rwk7sChZ/qovl7Xy2ytrCk=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=cjhhQDwPCNjbG+0EvH8STqJJQfYP0DMii2loB8UWrR5D6hwZQMudRdnd2hgw882jH
	 WYbVdi7TX2H6sT4xSJkypLj3RiMV3rDWNdhNTOkrtCdrF8sibQlvPtupGnR8lSHw1E
	 9E34hIy4djg3hQXy30SdqCtHYL0KdQymkWva2BdE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 12803F804AD;
	Wed, 21 Jul 2021 19:46:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A3201F80143; Wed, 21 Jul 2021 19:46:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2078.outbound.protection.outlook.com [40.107.94.78])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D07CEF80143
 for <alsa-devel@alsa-project.org>; Wed, 21 Jul 2021 19:46:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D07CEF80143
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com
 header.b="LxHBZtYf"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DdtAKRjXOVgbTs72qUbf8LwkvFWwO34SMwg84gkDU+buKntkqNSLm+KXj2nZoqcS0Us21OVxLNsj9WMmV4hSLWu/5njmA1TxMHOLvQPUXWCk6lQp1BAJk899d3Cr1RmHwBzwf8O+26K2Zm99gWibTnDcM/IfRLty48yK3F4+dw9kpQ0zbQFl1SPDmXjtMcinXtl3kGy9eaSLO/noFYoAg5CwcKKAKQ0z9pify7EcrSxeOe1gcqZ9hT5q06n0mV6MxRh9EMxno8sbgEpKpf2IGP/RVLd9/sogE7iCS4GWyd/L+OAAUg4mCKb+68H0pVhc6PaY9NnbWLTjlIGkMxvk3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E9l7jHW7zjQ3ydWRSE662IQFRiKpjpyvK1EGlYw11+g=;
 b=gKYP4sxD+x1S/4qC8lSPpgFGpVkpdC8iuucjAtKF7YTFAd9g4Vncvv/ozZf/Eoe0YUIS06wg7nFBNhOgduE0cBcjZjneVBVg1EfTMbkSSJD8x/Yhtc8jTDnysT4ofu/RAmcMImnk4epwwdXb6BwFlb7dHOLlFVCyNLJX4zdQwnFfxj78e9my0TOV+dcOMzZf5uIM07Yg8M9aceXrpMr0EHi/IL6WVuqr/VXi3T2gAUofGXy9CwYU/Ja/+A9SMS+p0pr0q+i1phlTE6UGqsFCdpCzxDGinloTmKdeau60cv3Q/HMxN6f+DKbU0jHVq239wEvvlPLS/WIcYjOA5kaKxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E9l7jHW7zjQ3ydWRSE662IQFRiKpjpyvK1EGlYw11+g=;
 b=LxHBZtYfRZiq6NQJmYOCrZiktsHcYaXJ/gwqPZ8rD9hlggQ2PXoCOJM0+bfgg8EIQBBZx3pPf9Cov0Bq1jh8QmnL5HGMqEyJY2xoMVjA+/LW/NJeD7D5sXT7n0Y5z+EoVofFydiPqasxp0x4nbgdrbePbuRI9yL7U1zhkDbTpl4=
Received: from BN9PR03CA0149.namprd03.prod.outlook.com (2603:10b6:408:fe::34)
 by DM6PR12MB3209.namprd12.prod.outlook.com (2603:10b6:5:184::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.29; Wed, 21 Jul
 2021 17:46:39 +0000
Received: from BN8NAM11FT049.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:fe:cafe::77) by BN9PR03CA0149.outlook.office365.com
 (2603:10b6:408:fe::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.24 via Frontend
 Transport; Wed, 21 Jul 2021 17:46:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com;
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN8NAM11FT049.mail.protection.outlook.com (10.13.177.157) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4352.24 via Frontend Transport; Wed, 21 Jul 2021 17:46:39 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Wed, 21 Jul
 2021 12:46:38 -0500
Received: from LinuxHost.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2242.4 via Frontend
 Transport; Wed, 21 Jul 2021 12:46:35 -0500
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
Subject: [PATCH v5 00/12] Add Vangogh ACP ASoC driver
Date: Wed, 21 Jul 2021 23:34:16 +0530
Message-ID: <20210721180430.11571-1-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8d68e0d3-1ab2-4407-a5f1-08d94c6f7e25
X-MS-TrafficTypeDiagnostic: DM6PR12MB3209:
X-Microsoft-Antispam-PRVS: <DM6PR12MB320998B69A8B03A7158D112597E39@DM6PR12MB3209.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:489;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XAKd+6dsahuWtjdg/4fWY9wKfK+b1eKkurDulBB/qL0C7Vo62JILENU/92LpOXlxgLhvWQT4swUp7eDWXRh61pgfN7RKN0Q+9MLopH4V6UZBHLJur5Tk7oBkxBm3LKJJvVOEyDLwchvC/Ig34KPHNcJJcgK/3x2jIePAL3qPjGXcvsZuWla2agg/pIaDK6dQiwEDtBCbB1WRkxNQ5ssCH2DEBQ98mK3ggsKVUXLivibKIgF0WQh2nJ/jLvc5oUuPDwnYfIHGolEztH2TNBAlmCrq46fwvZfBHhzMBcbRoge33GJG1AUs2qvLR5Lx4ce1F4C6vBdnyTZI/3xbpaPbq7IndXZ2RAW1SjFwubWfq49zjcru+hcZMkILNVvWxsxF6EG+xRbYwHOaR02YjetgySp7IH/75Dc14ZMYej5f/ZJ7Oy8WBXRx9OyOcLdnfbKVKGLW14BwcsBr+eXevl29NRc5M5c1nGpcAZQTvADrAh89vq+6HafzdAxSfVTR96udSt+f6+08WpSZmoZbx5tss0Ee1h4RgUBkG/gVt5BzzngPE93mg9rSI6LcszK+EN7l3UcEBl6Sos26Qn/n/nzkvFxs8E3JmTx1R3O/q8dMnmLK+1Wgnqc6uibfvBXgLx1swe9cvd9Tqh81dbRvFxdl8Nn8wfB+vT7oTJY3wWx7H1J80UWrdgbP/j1XNpq1ad/xZPsetthE8d+tVFLAFMaBhFuN0Owwf6geipKSJO87qtk=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(376002)(346002)(396003)(39860400002)(136003)(46966006)(36840700001)(2616005)(426003)(6666004)(86362001)(82740400003)(83380400001)(8676002)(36756003)(110136005)(8936002)(478600001)(316002)(1076003)(4326008)(54906003)(336012)(36860700001)(2906002)(82310400003)(70586007)(47076005)(5660300002)(356005)(7696005)(81166007)(70206006)(26005)(186003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2021 17:46:39.0583 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d68e0d3-1ab2-4407-a5f1-08d94c6f7e25
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT049.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3209
Cc: Alexander.Deucher@amd.com, Sunil-kumar.Dommati@amd.com,
 krisman@collabora.com, pierre-louis.bossart@linux.intel.com,
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>
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

Changes since v4:
         - Fixed indentaion issue
         - Fixed error handling
         - reverted hex notation for macros
         - Fixed typo error in Kconfig file
  
Changes since v3:
         - Fixed typo errors
         - Fixed platform devices unregister logic
         - Updated acp resources count with macro value
         - updated ACP5x_I2S_MODE macro value to avoid
           unregistering platform devices for other ACP
           audio configurations in driver remove callback
         - Fixed error handling 
         - Fixed indentation issues in irq handler
         - Add __maybe_unused for PM functions

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
 sound/soc/amd/vangogh/acp5x-i2s.c           | 427 ++++++++++++++++
 sound/soc/amd/vangogh/acp5x-pcm-dma.c       | 525 ++++++++++++++++++++
 sound/soc/amd/vangogh/acp5x.h               | 193 +++++++
 sound/soc/amd/vangogh/pci-acp5x.c           | 326 ++++++++++++
 sound/soc/amd/vangogh/vg_chip_offset_byte.h | 337 +++++++++++++
 8 files changed, 1827 insertions(+)
 create mode 100644 sound/soc/amd/vangogh/Makefile
 create mode 100644 sound/soc/amd/vangogh/acp5x-i2s.c
 create mode 100644 sound/soc/amd/vangogh/acp5x-pcm-dma.c
 create mode 100644 sound/soc/amd/vangogh/acp5x.h
 create mode 100644 sound/soc/amd/vangogh/pci-acp5x.c
 create mode 100644 sound/soc/amd/vangogh/vg_chip_offset_byte.h

-- 
2.17.1

