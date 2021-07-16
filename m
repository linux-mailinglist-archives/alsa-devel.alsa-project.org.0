Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A8993CB912
	for <lists+alsa-devel@lfdr.de>; Fri, 16 Jul 2021 16:52:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8FEB21693;
	Fri, 16 Jul 2021 16:51:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8FEB21693
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626447125;
	bh=kIrRg7wbgsXfIecjuEkKSeOdh1EDI6Jlh1fScJ+XEQA=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=OfQN7DLi0v4/LRzWU+sbTjdulHdkyUNjtbLJLgP/EPRi7Xu3uTk63wGC2ebMfHqhm
	 l4TQRYVnwzMI7+hLPqfBYVdD03B3VLagB74P1FB1/HqXZ4bU2weu82b/CN5jpcE/IP
	 glEubC+mvw6cdR9dL2ewDM9tn9xyfnoKEGDboDqU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F015BF8025B;
	Fri, 16 Jul 2021 16:50:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 19490F80254; Fri, 16 Jul 2021 16:50:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam07on2084.outbound.protection.outlook.com [40.107.95.84])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D6756F800FB
 for <alsa-devel@alsa-project.org>; Fri, 16 Jul 2021 16:50:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D6756F800FB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com
 header.b="VgMo+9TB"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YgjFKcjllncGLTJT1H76kbzUfepk9StQ3ivMaabQQGxQGoWGL6CT60Ta5cHA+ZsjpZc8pyZIpCv1FlBBILTHjoLJHEtCTwtOxsFoRGU/+UI4lXxYT5Qv/vFiSKJuFk4maor87at6QgQZrufcjVFsAMeBx0NpFNFLEHk3D95dFqlso3eB5VFvGNsSkl/nw1ZYcE1txofhfAEfjjZ7gwE4aVFbw/nzpLkIoAkZs8h0umK9sa/23Frlu5kHs9o+eDmEnoglO6Y9/Bs7tp/fCoSCFr7nlPxA4iNAyPjLlBZtatyI9RPOve6Em/Zy+KlPPtbJ5oms1dWp0m3cZdLV36jKgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gEUqRKjxON9b8EojYyYvgjTApdyc9eds8eK9rr5xkWw=;
 b=OnWIKUeRaqcW7ILwC3EuBY7hn8CwboLZMWzCITqLJZI1Fk9gAmaiYDTyH/iOZwEvL204WVGpAe7awGd16VemqTxn1/oQTmRHvCWzicn5pficJ2ixGPtxlWnz3tNwIX78YBfl2Biu3iIkwqzuc0veT6k2zOFZb1f1dAu2dL8p6Ipnfa+CJuquLD62ZlNyBMgV2ceIeW2FpSZvtKRGlAcaXvfQEnlnnbxHUJK3SRcbhTSoCtXhz4pLAzjg3PFrzu/nWpsrvHzIQGUovWNUqrwQcL5oxGR2nvexKsvGWa51UxO7goCd2gVZD3SZnzJQZeifZNwSeLF0c3X9/AqlITfHZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gEUqRKjxON9b8EojYyYvgjTApdyc9eds8eK9rr5xkWw=;
 b=VgMo+9TBPKNdKY4qs6sXDJbbIyOjX9A1YMPbWpWfZMogAw7ejSvCLI5Lj9IG0r8aH9D3sL8ePA+lkRFOmcQpncY2IkNnX005ewQ0iDezOCe8mMtZ6CT/FhwsqP//uyKfaoewotNnUbDuyGBB+BTH1zipBq4kKtqayMpgftvYNV0=
Received: from MWHPR18CA0029.namprd18.prod.outlook.com (2603:10b6:320:31::15)
 by CH2PR12MB3942.namprd12.prod.outlook.com (2603:10b6:610:23::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21; Fri, 16 Jul
 2021 14:50:23 +0000
Received: from CO1NAM11FT059.eop-nam11.prod.protection.outlook.com
 (2603:10b6:320:31:cafe::d) by MWHPR18CA0029.outlook.office365.com
 (2603:10b6:320:31::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21 via Frontend
 Transport; Fri, 16 Jul 2021 14:50:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT059.mail.protection.outlook.com (10.13.174.160) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4331.21 via Frontend Transport; Fri, 16 Jul 2021 14:50:23 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Fri, 16 Jul
 2021 09:50:22 -0500
Received: from LinuxHost.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2242.4 via Frontend
 Transport; Fri, 16 Jul 2021 09:50:20 -0500
From: Vijendar Mukunda <vijendar.mukunda@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
Subject: [PATCH V2 00/12] Add Vangogh ACP ASoC driver
Date: Fri, 16 Jul 2021 20:37:57 +0530
Message-ID: <20210716150809.21450-1-vijendar.mukunda@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 28f1582b-27c3-4c50-9f01-08d948690a7c
X-MS-TrafficTypeDiagnostic: CH2PR12MB3942:
X-Microsoft-Antispam-PRVS: <CH2PR12MB39428E191EF5F7FC3A85481297119@CH2PR12MB3942.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3826;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WB8j+9fpaWsy6me5P2IKRpd7sbRBToQvaQI6EhuqVEDTyz8+s4JoXP0aaD/JNetBR4cz0dPYu+CxPAQJoUniktUTK4LHH6YQaD7yvum8kl6YUsLabeirw+mnJolhvP9rIoRj10tQAsAp3Myauj7KcIqAMUJI4sCg40hZ7Z1BUUH6X7SK5mKqT8rxEWwtWic85qQno1q/A9ezUl8mX5Wjco9sCrP9q+JmSrZbVG/7ULa3cV4bRV9tVDLJvwqHcYTTPlC0hZaCjzgbv5riwhVqR1Jwc9j5pyeFQw8rbodVOgbP7YSJKzM84vRO6ffJdYPlbo3aPKzYRqiK33lT80aCqvt3UsJ1Ct0rE83LUQPZO7dtrLscmM+klueymtjuZpdPPrjm1hApuCrmmAGf3DDBjRB5RgCkInzSs7gaHntMBwxHkYW7dDqf2GZoRTL0s+k6zhkriz1e3a/UcBXIq4XHTvK7Gyy4qx5fsBm6KnLHEeqFvePEk1ykeFxl7YSJJ67jsLn5SpsLGoeLgcI7BIRFc+CLdWuGonTnQUiaoEKW0wCXibWcxc1+gkLuTLhxjzKiv3S/1QxyOFxJuAbDrhGMUpPXTAM1hfhdXuz6M9xa5khiQhaUZkAkQ/bbbqCPelqGsjIza1bHVWStduHq/LLKmjipUMGv1xiZytvuTAM+AukzL49XeNc5+Wn9EBBHVy3NgFCtubQJKgWuu+AyClQnMdizj6SDcG6XClHGqQEfeJo=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(39860400002)(396003)(376002)(346002)(136003)(46966006)(36840700001)(82310400003)(356005)(8936002)(47076005)(8676002)(110136005)(70586007)(36860700001)(316002)(82740400003)(4326008)(2616005)(44832011)(86362001)(54906003)(426003)(5660300002)(336012)(81166007)(36756003)(1076003)(6666004)(70206006)(83380400001)(478600001)(2906002)(26005)(7696005)(186003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2021 14:50:23.2672 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 28f1582b-27c3-4c50-9f01-08d948690a7c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT059.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB3942
Cc: Alexander.Deucher@amd.com, Sunil-kumar.Dommati@amd.com, Vijendar
 Mukunda <vijendar.mukunda@amd.com>
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
---
 v2: fixed review comments and respin the patch set
---
 sound/soc/amd/Kconfig                       |   9 +
 sound/soc/amd/Makefile                      |   1 +
 sound/soc/amd/vangogh/Makefile              |  11 +
 sound/soc/amd/vangogh/acp5x-i2s.c           | 429 ++++++++++++++++
 sound/soc/amd/vangogh/acp5x-pcm-dma.c       | 525 ++++++++++++++++++++
 sound/soc/amd/vangogh/acp5x.h               | 192 +++++++
 sound/soc/amd/vangogh/pci-acp5x.c           | 327 ++++++++++++
 sound/soc/amd/vangogh/vg_chip_offset_byte.h | 337 +++++++++++++
 8 files changed, 1831 insertions(+)
 create mode 100644 sound/soc/amd/vangogh/Makefile
 create mode 100644 sound/soc/amd/vangogh/acp5x-i2s.c
 create mode 100644 sound/soc/amd/vangogh/acp5x-pcm-dma.c
 create mode 100644 sound/soc/amd/vangogh/acp5x.h
 create mode 100644 sound/soc/amd/vangogh/pci-acp5x.c
 create mode 100644 sound/soc/amd/vangogh/vg_chip_offset_byte.h

-- 
2.17.1

