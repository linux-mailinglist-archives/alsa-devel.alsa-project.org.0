Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 120CD3CFF26
	for <lists+alsa-devel@lfdr.de>; Tue, 20 Jul 2021 18:21:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 942731669;
	Tue, 20 Jul 2021 18:20:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 942731669
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626798086;
	bh=e9E7DyViIHNjDlwAg55Yy6zEXwK7dXGOvLDShpQ0QVc=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=UYy64Aw/8ARcozbELD7MSsLDs0A9WPR6QlryuylCqXZsmSg10VzLtbw41u7Ogla9L
	 kzRVGu0qWWPNElnTjcbx5zOomT1L0MUGfvoZfJgISCgPpJUUinOTuh/sraIF728m6+
	 /e6cJ+bjEzOBefUu8NaBIPCHgZQi6PzLeBATKTbA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4923EF800DA;
	Tue, 20 Jul 2021 18:20:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F1621F8020D; Tue, 20 Jul 2021 18:19:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2060b.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe5a::60b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 12244F80104
 for <alsa-devel@alsa-project.org>; Tue, 20 Jul 2021 18:19:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 12244F80104
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com
 header.b="qQpbut2T"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gpjf4vl250u0qZ14/X5irgge0a+285K0foqpfAP3YVFt6vCw9yOw5mW4R5vMBmB3geEsRdqrxYG6FJ3Api45sWTFDljw42Kd2MHL+cmfPEiZPNyWXv1ip1HWxbqONeVdZMiQo25e1na6NKQmGUmxBr+BguaOCyiTc99Sqphkfm/x0puqeHFVqMaAOO/aSGmlTFAlkjqk12/n9FDJiVWKfUUdft+w2q3BgoeHlR3+ro2JgBWCTH0PemWyMdKqlU6usQI15l6ERaAjh0XSRdTRv+N0Yf8eUhCDpGpqFXY/Sv4TeVtNiIglEjz7f1pzttTxl9cvSxF/v5GoirMk88Fbdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G3qrkTQ+9U/4A8CgwZnz/5vbaOz8KIEBYNKqOtCuhBQ=;
 b=Hhpgr8W+2uZldOOxSBcPqOZj0E2gFulAGLjVqL9jQ9AMO8YpyhgX71D8R4g8lgc8HLsfR1NuQ5vLv+RbMn3sIbB9ie2Gr3WMghNF1VDHHA3XgCsGO25wOheemxRLyzTIRGebU/awekdWYfdrvIpfU6CIWgH11yWXOfpEYDPxTX8D5Uckpk8L5nYu5FebqEb3xzpf6CX9M3WSZ8+tRe1lhlUu1ow6QuzEm5WRFZu79w0DN8xyvCDQE2eE9WxyQMb5/hIHAL4FjzVHwm2PQYx3YYYN7g8g3HAwe/iz2m6vtz2ZgAHRYfbO3vofIpk5N5wn+sd1shqXgFvRqwV6OZGYPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G3qrkTQ+9U/4A8CgwZnz/5vbaOz8KIEBYNKqOtCuhBQ=;
 b=qQpbut2TnGw5+hf0D9vElBlfPYQ4F3cMwQxJrkqc8LeJg6rqF+Zhvc5mnKSEWClvY911gCVeCLpLCD6YJNWPDNojCPF4PrZkPooIkiDHgVj8alToShF1mZ/vlXsRMa8DitXTHeyfP3+wQt+OYI1sZSOHwswjBECp6hVo+QWQKo8=
Received: from MW4PR04CA0194.namprd04.prod.outlook.com (2603:10b6:303:86::19)
 by CH2PR12MB4006.namprd12.prod.outlook.com (2603:10b6:610:25::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21; Tue, 20 Jul
 2021 16:19:45 +0000
Received: from CO1NAM11FT029.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:86:cafe::63) by MW4PR04CA0194.outlook.office365.com
 (2603:10b6:303:86::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.24 via Frontend
 Transport; Tue, 20 Jul 2021 16:19:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT029.mail.protection.outlook.com (10.13.174.214) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4331.21 via Frontend Transport; Tue, 20 Jul 2021 16:19:44 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Tue, 20 Jul
 2021 11:19:43 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Tue, 20 Jul
 2021 11:19:43 -0500
Received: from LinuxHost.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2242.4 via Frontend
 Transport; Tue, 20 Jul 2021 11:19:41 -0500
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
Subject: [PATCH v4 00/12] Add Vangogh ACP ASoC driver
Date: Tue, 20 Jul 2021 22:07:20 +0530
Message-ID: <20210720163732.23003-1-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a5b910f1-1a27-4967-d070-08d94b9a2fe4
X-MS-TrafficTypeDiagnostic: CH2PR12MB4006:
X-Microsoft-Antispam-PRVS: <CH2PR12MB4006D93357C46E1AB264151997E29@CH2PR12MB4006.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:489;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MFtZoJNbHcPSCYFO+1WkWTsrVyvPYDk2QQa0Xp5zH3qRXLi6TPN7Yb4gtpIwzzkP+6JV0vqzUX2NX1WWGWrPKxKJFZv385nJq4xQCt5fFZqyZb7XUyQKdEYtds5yraO8QmSSnv54H8knwwt9noVnh5nypaJ02QWIGSSdPPfIKxDYPxELlEohglnd0vP9kJH8FDVEX+FCcTfkre8OHBE8HRfPl4XGbO66qS8Kce9aX8XSRx57NMLLVphyghfEZRifK88/q0wV8eaZ+YLxlRmu20KX63qpuERNqRqXPZ46HM2/F13s1B5E0k/FLgf3KsdAK8Bui+kl6E1sbRXoTozcEUMGKEcTXt5lEA59os4AyDNBiJBlAj9Nst4nw2C3t8sJKZ3cE7ualEVyuwfB2DniMpED5EKBVihYka8QGLsh5qqZti18FXYUWDlOJbmFJH+vS8SMvFfMu7rvpohCVrC9Ze/GygO8Py0fyBuSMcPVUz3FdJvYplurNduAvNmVANgG5vo8vUTLU6EI5ZwWwzhnlE0pJ7ziX5j2B7fbkjGzGTIiUUZigu9uyQfZzAEEOb2g7tFAmieyHADk0xfJ/HgbAF50VoMntZiHft/FPQSysHQ4e9r87OxG/31nqUddrP+F1e9ecZOzRjuU7Uefh/dr6hVoDkvdTmueHHIY8XBKLz8ujV88VN/JrIzz3ChRnXBNwhwepVit10CpPw6jcpKuoxeYVf+dyf/RbZNyV1OL0sA=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(136003)(396003)(376002)(39860400002)(346002)(46966006)(36840700001)(426003)(86362001)(336012)(36756003)(83380400001)(186003)(2616005)(36860700001)(82740400003)(6666004)(356005)(26005)(81166007)(82310400003)(47076005)(2906002)(478600001)(8936002)(316002)(54906003)(110136005)(4326008)(1076003)(5660300002)(7696005)(8676002)(70586007)(70206006)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2021 16:19:44.8418 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a5b910f1-1a27-4967-d070-08d94b9a2fe4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT029.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4006
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

