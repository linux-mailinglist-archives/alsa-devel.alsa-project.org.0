Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BE93F3CFF02
	for <lists+alsa-devel@lfdr.de>; Tue, 20 Jul 2021 18:14:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 476CB823;
	Tue, 20 Jul 2021 18:14:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 476CB823
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626797693;
	bh=e9E7DyViIHNjDlwAg55Yy6zEXwK7dXGOvLDShpQ0QVc=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=egaLoV+qhMZlKBdKZu9J8UBg/pg6gS7aSM46e0naBqRvTTJ09hNImd9O+ou6Kw+or
	 sZFd3j3s5H3JVWLoaXW/6Pyt0tXzfn3mXx3f+ipnd5O2ITpfhUApefjN0LYsrJf898
	 XICsQIVT0VwWKJ1SuWgQ+ED9215A89pVOPOYeifw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BE5FAF80218;
	Tue, 20 Jul 2021 18:13:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C534CF8020D; Tue, 20 Jul 2021 18:13:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2052.outbound.protection.outlook.com [40.107.243.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 367E7F800DA
 for <alsa-devel@alsa-project.org>; Tue, 20 Jul 2021 18:13:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 367E7F800DA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com
 header.b="BD1rtfTk"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SH8G/wPtRteBwCO4gmMRABOdDvxxJNgTOaYr5flOJLHc/9TpBk8yuogmXHghv9SlO4VxK3kMVuQUYx7FgH6YMCHksQ7ePORaXch2kWV8xQmgQMlcyfrmWBS5IwjOuVoljUuJ8l/uGkVi7qCtjSgE8+lihx8cQ98bjnng3F1/me2VvoVknGikpOnkDnPotVIkuKUAC2QrJeOvRUcz4jS4NN084N0lBBUV5A9Xskee/d563sQ2SBlj98s4UrbDPDWwpW1e6kLm0wbYUEEKFXHYbBjR3Ixr3XyHEHvKh5vdjPlnWRud3PgsojDSZ74T/xxWbnMwZWlv4TSDmdTAqT/Abg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G3qrkTQ+9U/4A8CgwZnz/5vbaOz8KIEBYNKqOtCuhBQ=;
 b=U1VbbFCOriZUDf8ZvFVzQ8i/ud4gi/88PXurd6gjmzu89Cov8sxwuptmu1ZoJXbfSJb/H7D5LsfWxQkyUIw/vvr7q8JGCnMGvHaK9a6Z+Z6eTtjYmoBGgfwJTmLEOCuQd8986gpXuFc4UlrrkEszM+HW6NPGcM3xfmuG5PN/UHoj1pZd0D4nkfJdD67LmznhdLVt5eCx5fh+bnnE6e8wXJ8H9ke4sJeiSvXj6tTM/T8aoHJ8niHdOEtH8gcjc7f/kYSZE+KUXm3lJWFzjh30aftJMZxn46/NJo6ygr+OsyJhw68rSmD26N1IfEweuUi0XUwILWTXa/+WGFr9dM0TdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G3qrkTQ+9U/4A8CgwZnz/5vbaOz8KIEBYNKqOtCuhBQ=;
 b=BD1rtfTkwgFCc+1MU9njcpkrUGk1j4ognHs+d55p9jG4vMNKCmaBj4e6lOpZebrsouPXLGjDuS93m4BGeNgHBlsBs4gV7TCMk5IJ313TWoX8e3S9lDGBFKCUi9rHL4r1HXe8y0At9LoDoNOWcCfVOLWsY3Es3d1vzfdm3lGkmkU=
Received: from MWHPR22CA0018.namprd22.prod.outlook.com (2603:10b6:300:ef::28)
 by DM4PR12MB5198.namprd12.prod.outlook.com (2603:10b6:5:395::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21; Tue, 20 Jul
 2021 16:13:16 +0000
Received: from CO1NAM11FT046.eop-nam11.prod.protection.outlook.com
 (2603:10b6:300:ef:cafe::68) by MWHPR22CA0018.outlook.office365.com
 (2603:10b6:300:ef::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21 via Frontend
 Transport; Tue, 20 Jul 2021 16:13:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com;
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1NAM11FT046.mail.protection.outlook.com (10.13.174.203) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4331.21 via Frontend Transport; Tue, 20 Jul 2021 16:13:15 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Tue, 20 Jul
 2021 11:13:15 -0500
Received: from LinuxHost.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2242.4 via Frontend
 Transport; Tue, 20 Jul 2021 11:13:12 -0500
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
Subject: [PATCH v4 00/12] Add Vangogh ACP ASoC driver
Date: Tue, 20 Jul 2021 22:00:52 +0530
Message-ID: <20210720163104.21462-1-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: eb57a4ac-f07e-489c-afcd-08d94b9947ef
X-MS-TrafficTypeDiagnostic: DM4PR12MB5198:
X-Microsoft-Antispam-PRVS: <DM4PR12MB5198FED6D64E44FAA07D3BEB97E29@DM4PR12MB5198.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:489;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7EACrzWaXtgTYaMMNP3S+3zI3pCLN9P++hF2BvYcNty0w7u40t3kLGKIlPJcrnkgHgrKWCwrg0s5rLo3dHol4vADVySXJOxd5c3oyAulDIdiTO57rSRxfUj6/aDdlUMvOmB8yT12j5Cqwzql/c7BLvrjtEEa/vrKGk/P2y8mrsH/k59YC68kx8hQggkmUvORRF5wrG43KdQdFoYN6VFEBQe18RySkBGxe4Lq8Wioa6+Y4QGYOLBAythknCtC7NMKffUr/DUv4EgvI0q06X1SRYNx6LxfDCzs4WSkLuxAxF/yfvrrKUz1LYHSv7+Eo1CUWOKKRPAnWW9xf43MhQ4pA4IOJg9l3oiiLgl/kqVlV8p4WBX/7VeEnrBPmkrsS7Xs13MW82dIFPZV08q88ewayPNO1TTVmWGn1GH6wsTjYB1ylLuyXnhM8Y9uIsOhGZ78rbrUbdpO5bqZ80AOVuVrtCj2I47UXsiskRe0zQEoTnZP+ioPGHrDxLMsH5cWu269iszM6c0O+F2nqICY3830Scl2fGScfCFzHFUOPCUD02CrPgZ79G6+kQn8GQdejsxSOcd665ErViHeSmrlc0XzSsz9DAUt/gxp0xCeW+LBlRWkIZhnI4id8i+O83wedOQ/HhZ9JH4vvLUMJDTrLrtOX9NtU2TjY6PIs+Vcai8xKp4nRJxJohaZP5OMD4HEgRBOuwupTzA5e/ed7Qdar1A1Yk/8qVw/9d8x2OO0dpDKoDY=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(136003)(396003)(346002)(376002)(39860400002)(46966006)(36840700001)(82740400003)(47076005)(81166007)(356005)(83380400001)(186003)(26005)(36756003)(478600001)(36860700001)(82310400003)(1076003)(8676002)(8936002)(426003)(7696005)(4326008)(6666004)(5660300002)(336012)(70586007)(2906002)(2616005)(86362001)(54906003)(110136005)(70206006)(316002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2021 16:13:15.6826 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: eb57a4ac-f07e-489c-afcd-08d94b9947ef
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT046.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5198
Cc: Alexander.Deucher@amd.com, Sunil-kumar.Dommati@amd.com,
 krisman@collabora.com, Vijendar Mukunda <Vijendar.Mukunda@amd.com>
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
 sound/soc/amd/vangogh/acp5x-pcm-dma.c       | 524 ++++++++++++++++++++
 sound/soc/amd/vangogh/acp5x.h               | 193 +++++++
 sound/soc/amd/vangogh/pci-acp5x.c           | 326 ++++++++++++
 sound/soc/amd/vangogh/vg_chip_offset_byte.h | 337 +++++++++++++
 8 files changed, 1826 insertions(+)
 create mode 100644 sound/soc/amd/vangogh/Makefile
 create mode 100644 sound/soc/amd/vangogh/acp5x-i2s.c
 create mode 100644 sound/soc/amd/vangogh/acp5x-pcm-dma.c
 create mode 100644 sound/soc/amd/vangogh/acp5x.h
 create mode 100644 sound/soc/amd/vangogh/pci-acp5x.c
 create mode 100644 sound/soc/amd/vangogh/vg_chip_offset_byte.h

-- 
2.17.1

