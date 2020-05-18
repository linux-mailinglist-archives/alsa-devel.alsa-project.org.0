Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C47571D7FEB
	for <lists+alsa-devel@lfdr.de>; Mon, 18 May 2020 19:19:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 45200172E;
	Mon, 18 May 2020 19:18:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 45200172E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589822340;
	bh=8f8ENu3Poej3Ky5fLjR1xLZfPhB1dxgQJ8AHBNa0CTw=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=LlUQr5RtWQcW7xGLGFI5NaH1jJiV2DM6u/QlIaQTd1CPaFW7H14yuRoB/RzLpPYd1
	 Jhl2G1NWVf/R7nO6Mz7PldtXK6+Au6xPYFjf7opKJrG9WYeaqLzXdrIapzA1coDL7l
	 BmpQke8cvK1CndhYGpcD++QXFfzXf2o+iz7g4r24=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 65905F80216;
	Mon, 18 May 2020 19:17:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A707BF801F9; Mon, 18 May 2020 19:17:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 FORGED_SPF_HELO,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr700085.outbound.protection.outlook.com [40.107.70.85])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 80C82F80086
 for <alsa-devel@alsa-project.org>; Mon, 18 May 2020 19:17:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 80C82F80086
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amdcloud.onmicrosoft.com
 header.i=@amdcloud.onmicrosoft.com header.b="KQz0dbHC"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=crLeCw9jQuIDbRTjxD/Dd+vHtcsJOhA+O1bj3D5chW5AnPbFi8A/kKJOZk4TG7p7Ll/I2K+3TJx2/nHLqrG5UU7C0OlSW23PPKrokPtY4fiziAayZKIWcoNdqNFZyW7dH4dWf2S38Dz4O5tAgRX023WwQ6kHNab0qBYgY8p/0aqounEgxGvF852amIdFAMu3RDxIPkeg94JFpP3VJTTSuPL87KHcMjdgun2A79p32tCqnzuU4vAJ1IFZ9pVrDiyr/TMVCE0niPqjiddLzcZdZBwnjTIQVqPZZBsgIlGszCnggH+VmBjFYJ1FXnKvRfOsM/+P2eB1hD9e/BHVRyretg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hgq/btRYAmk74lhFQDzgj0l3vjYUotToxUNkdSISL7M=;
 b=ZtGtfl8WxVXcuSMyO1l7iorXO7eQGQBPk5ZfS0dtkEijMfzYUM0/e2uv3tqQog3qun7SOJRWeSU+aGUahvWz/Hx2Fho49v3v4M0jhjSzLbt01Lqt/mIY0YRb8BoSCDlIAIx4aN7uv7ywgekHwLZ/+aSq3Ja3+Ctc/DV/2oyxFq9jqNORj6zyJNVaiFxkRLaFRNqylzxGege0if0Ljuem/1Qv+b32Q0k25cRxqy/cNX0ks5aJqlmRTqlwAocwQywJ+cPCJ+AdHtD6L6Xwh4VO53HfEoDna239CH2nt4Xtv6dS7Bc0QjCkQG0gyVbkUkFhYsAD1jgjhXgC3vv3XPyOoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=alsa-project.org smtp.mailfrom=amd.com;
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hgq/btRYAmk74lhFQDzgj0l3vjYUotToxUNkdSISL7M=;
 b=KQz0dbHCXCI9YFYJ7E/3CFALSL5AXvRAoxni0YrWmCXgPZB/ZbA+w4XOSLLv6+539up7TFstYG9j5ha0uF2ZFSfiW/9GC1G32lEoGEFA+De2V7qVtmy+farpoNHOAzHn9ecaHIHtTXZkI+6/QHaMHwV+oqzzsSEknlYG843INy4=
Received: from DM5PR07CA0088.namprd07.prod.outlook.com (2603:10b6:4:ae::17) by
 BN6PR1201MB0243.namprd12.prod.outlook.com (2603:10b6:405:50::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3000.26; Mon, 18 May
 2020 17:17:09 +0000
Received: from DM6NAM11FT038.eop-nam11.prod.protection.outlook.com
 (2603:10b6:4:ae:cafe::5) by DM5PR07CA0088.outlook.office365.com
 (2603:10b6:4:ae::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3000.20 via Frontend
 Transport; Mon, 18 May 2020 17:17:09 +0000
Authentication-Results: spf=none (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; alsa-project.org; dkim=none (message not signed)
 header.d=none;alsa-project.org; dmarc=permerror action=none
 header.from=amd.com;
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB01.amd.com (165.204.84.17) by
 DM6NAM11FT038.mail.protection.outlook.com (10.13.173.137) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3000.19 via Frontend Transport; Mon, 18 May 2020 17:17:07 +0000
Received: from SATLEXMB02.amd.com (10.181.40.143) by SATLEXMB01.amd.com
 (10.181.40.142) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Mon, 18 May
 2020 12:17:07 -0500
Received: from atgasia02.amd.com (10.180.168.240) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server id 15.1.1713.5 via Frontend
 Transport; Mon, 18 May 2020 12:17:05 -0500
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <alsa-devel@alsa-project.org>, <broonie@kernel.org>, <tiwai@suse.de>
Subject: [PATCH v3 00/14] Add Renoir ACP driver
Date: Tue, 19 May 2020 01:16:50 +0800
Message-ID: <20200518171704.24999-1-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SATLEXMB01.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFTY:;
 SFS:(4636009)(396003)(39860400002)(136003)(346002)(376002)(46966005)(478600001)(36756003)(110136005)(336012)(316002)(47076004)(70206006)(6666004)(4326008)(8936002)(426003)(2616005)(70586007)(2906002)(186003)(26005)(7696005)(8676002)(86362001)(81166007)(356005)(1076003)(82310400002)(82740400003)(54906003)(5660300002);
 DIR:OUT; SFP:1101; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2de917d5-73d5-429d-2dda-08d7fb4f4b40
X-MS-TrafficTypeDiagnostic: BN6PR1201MB0243:
X-Microsoft-Antispam-PRVS: <BN6PR1201MB02434E8E741CDC961A8324A597B80@BN6PR1201MB0243.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-Forefront-PRVS: 04073E895A
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gpIdQ5P/yINOW/M/OLm5G9qgiKme5YIrLieROWPSkew6BvsarXZSUffhKT849/kRfYhNbXr1+58szYOadYaPUi7d5oyvPljfzTRCsGHqE9376N0qWg2K4sDHubbuOMcc7SVrud+Qy+TOoQQ5d4VBkTKtwDhJVZ7FWjMo1XnY5LeSqd77Hoy7hB5gNGeZKGHrRa9bRUetgZ3UGjMKI6D5V3EPnXurZl3QmGQeRlZggHRXpRABcaDDrw6rF1foEzUB04lANbdh4BzhrEcJEAlfaxkE7krSOZHyrFuwI3SoCM5QWpTJJ8jbS8CPSOxnhrT5euu1UXXSdZ0KTyAIHCleHEm9k9oh1l06VoBW9X/D2LTAqc3Zs3ywIHefeJX+po92Ii00Ffi0KmyFaesjDpQDjfEjI/Q21vOav4D+I7/uMNP+HztwQjqWA56X3BRRbUJPOXrrsXyeDGES8J8Uqz00wTJhNKTh4URgxMLqvg3b+MhvR0SmAO053Q+Zj6TkNGtD482tY9jQikvSe39XDkoRlg==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2020 17:17:07.8790 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2de917d5-73d5-429d-2dda-08d7fb4f4b40
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR1201MB0243
Cc: Alexander.Deucher@amd.com, Vijendar Mukunda <Vijendar.Mukunda@amd.com>
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
block on AMD Renoir APUs.

V3:
- Changed PCI driver PM runtime sequence
- Removed redundant code in Renoir machine driver

V2:
- Removed empty declaration of dai_ops
- Removed SNDRV_PCM_INFO_BATCH flag
- Defined Macros for delay and counter and corrected dma stop sequence.
- Changed PCI driver pm runtime sequence
- Removed redundant code


Vijendar Mukunda (14):
  ASoC: amd: add Renoir ACP3x IP register header
  ASoC: amd: add Renoir ACP PCI driver
  ASoC: amd: add acp init/de-init functions
  ASoC: amd: create acp3x pdm platform device
  ASoC: amd: add ACP3x PDM platform driver
  ASoC: amd: irq handler changes for ACP3x PDM dma driver
  ASoC: amd: add acp3x pdm driver dma ops
  ASoC: amd: add ACP PDM DMA driver dai ops
  ASoC: amd: add Renoir ACP PCI driver PM ops
  ASoC: amd: add ACP PDM DMA driver pm ops
  ASoC: amd: enable Renoir acp3x drivers build
  ASoC: amd: create platform devices for Renoir
  ASoC: amd: RN machine driver using dmic
  ASoC: amd: enable build for RN machine driver

 sound/soc/amd/Kconfig                      |  13 +
 sound/soc/amd/Makefile                     |   1 +
 sound/soc/amd/renoir/Makefile              |   7 +
 sound/soc/amd/renoir/acp3x-pdm-dma.c       | 530 +++++++++++++++++++++
 sound/soc/amd/renoir/acp3x-rn.c            |  77 +++
 sound/soc/amd/renoir/rn-pci-acp3x.c        | 344 +++++++++++++
 sound/soc/amd/renoir/rn_acp3x.h            |  88 ++++
 sound/soc/amd/renoir/rn_chip_offset_byte.h | 349 ++++++++++++++
 8 files changed, 1409 insertions(+)
 create mode 100644 sound/soc/amd/renoir/Makefile
 create mode 100644 sound/soc/amd/renoir/acp3x-pdm-dma.c
 create mode 100644 sound/soc/amd/renoir/acp3x-rn.c
 create mode 100644 sound/soc/amd/renoir/rn-pci-acp3x.c
 create mode 100644 sound/soc/amd/renoir/rn_acp3x.h
 create mode 100644 sound/soc/amd/renoir/rn_chip_offset_byte.h

-- 
2.26.2

