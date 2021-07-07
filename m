Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ED34D3BE2AE
	for <lists+alsa-devel@lfdr.de>; Wed,  7 Jul 2021 07:40:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 653231661;
	Wed,  7 Jul 2021 07:39:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 653231661
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1625636421;
	bh=vVTXQvYkC9peXFTJIUqIcA7hA5y3hmT/Ixqj0vXEWEw=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=rgVt7AD0DBp8TfQ0U40Bm0ERYS7ce7oe764NTUSPQpyBVreJArS2kaOAVEPUiGsKf
	 F8Qmre/Cd3LEKf37FEADjHBStiAzoyrROvRYACC1OQ88SpO5lBShccLYhOTUx93fco
	 YlJCfRlioU4VHWqQ+9hA4pNCnBN4F7buM/Cue/PI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E986FF8012A;
	Wed,  7 Jul 2021 07:38:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D3DF7F8012A; Wed,  7 Jul 2021 07:38:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2046.outbound.protection.outlook.com [40.107.220.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 30568F8012F
 for <alsa-devel@alsa-project.org>; Wed,  7 Jul 2021 07:38:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 30568F8012F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com
 header.b="Z3q/8LgC"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n1Ug5U4LylEEM5FpQJnNrQj8kU49q5vmQuoCEZzx3E7xgugk9WhK6BF9iiW1CtmH9xMHJj0vH8sqzXJIcGymqjeKTFTowJrYsy6lmH7uR+VmuoaZAK+7Y40CZ0B577lHTWlv6EhqJwgZz41Q6QrQptwKSoA7wjmjC2eNLGR7mXVDt8EIhFG/Hxa5NwsBD32g8JzajI8OlXoKkHYCF2JWsLgDeChCCsCH0so/7aB0jwB/KzTy8oJHbScG4TOHHDnvl/BKXi8aFwB8sXu+9fMyJ1g3fFk5Ilitkrby9GvpytAV2i9oylWObBlJeT92xZnuKljaRqmXdSWAp6tDpEjuYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KBB/8OwPsCk4l1LUciXC8QvB/x0tIGi28YwqF2vQZ/Y=;
 b=bXTl3i/NFXnqILODwuXpTQMou2lJH75GjwDmdEID6ilrpoCjgp2UJK8yN9eYPjUqzKyKpmlypQ31TlAmrRAR/q6HPrij2A8Z6q/8jVojrZzoCBX3R6omVUU6AHq3RfckLHRp07DucG+/dS5NAbzTCo9CHiROQcBkkDkQ3rJzSVZtQZDA/iYdeuosqZ+2P/0hMQp6uhb4kVPiCuPdlrfcHcf/MqP9+JVBBvJTkHIVOaCK3Oi9Atf29wWeyI/RRL4/o8L1tVaw0oOTYAF4mohY5MXxkj2lvdWZJU3TI5mhw6lsX3C9ruriaNucjYCDhSsF6xeZl6WaPsUvgaubqI5Ryw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KBB/8OwPsCk4l1LUciXC8QvB/x0tIGi28YwqF2vQZ/Y=;
 b=Z3q/8LgCxs9dhlxistsX6vNzqK0mhHTRIw6N/bNnYqZFENRZhar/zkxcWbpggmVg8QhRDHl/WlZKGNCdOkp8GfWg4oesx5HlWcXS7euugS0MlMgNn2C4g5kSkp2VpNpyL7Z7GxMyldUBv1MDtlcqptgi7vEqkwI0yIuXVI/ljk8=
Received: from BN6PR12CA0047.namprd12.prod.outlook.com (2603:10b6:405:70::33)
 by BY5PR12MB4308.namprd12.prod.outlook.com (2603:10b6:a03:20a::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.26; Wed, 7 Jul
 2021 05:38:40 +0000
Received: from BN8NAM11FT030.eop-nam11.prod.protection.outlook.com
 (2603:10b6:405:70:cafe::a4) by BN6PR12CA0047.outlook.office365.com
 (2603:10b6:405:70::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.20 via Frontend
 Transport; Wed, 7 Jul 2021 05:38:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT030.mail.protection.outlook.com (10.13.177.146) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4308.20 via Frontend Transport; Wed, 7 Jul 2021 05:38:40 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Wed, 7 Jul 2021
 00:38:40 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Tue, 6 Jul 2021
 22:38:40 -0700
Received: from LinuxHost.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2242.4 via Frontend
 Transport; Wed, 7 Jul 2021 00:38:37 -0500
From: Vijendar Mukunda <vijendar.mukunda@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
Subject: [PATCH 00/12] Add Vangogh ACP ASoC driver
Date: Wed, 7 Jul 2021 11:26:11 +0530
Message-ID: <20210707055623.27371-1-vijendar.mukunda@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b1ab3c47-2819-4e4f-0a53-08d941097a06
X-MS-TrafficTypeDiagnostic: BY5PR12MB4308:
X-Microsoft-Antispam-PRVS: <BY5PR12MB4308F4D360C72F942D7B91B4971A9@BY5PR12MB4308.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3044;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ygYSkMGiW75LGQxEOi7cilmVAdb3NAt7hL5aozeKx9LYdJoTnMn8KOxwmPYtZS1ykzg6c+o+US7DULBx8rbZiUvbg6dhVF+ycALy4ALSrGsIclCDKYECRuP2NIbfNknVAmOf/4V4lpn+QTuG8gDPhF7KJX3z8hmdisvYb4QqvSLxFzK+zjS+gtNGQ/GxHyxpmCJt6oBYUzq+z8NDECaxDXoixPa00Wrpj04Tvq6eT8DAFqD0fUbRUhHxSVEzY0HJZMfHvIjziPIY1GtiNJWhULLyVOwDG95IPs898l7RO70mTyPaSru7+GtukhKcY9DDwExCQhvXPjCPoiRIGCMgTNKPYRqrnGvIeEK1Wtd9V7TxlMOl6hVKCOtk0XhVWp65Xt0JfMzOH8rC7zBVdUDXET1pAxU1W7oWQfsKRxINPf0jJ84Fv72lgY4iugiHohnECn84f/NZQnadpROhUe5wW/PXeOPHFBEBn/U8GR/fWUs/A6aRKis9yNmhbvQADYReobXKiy33d93/5mBX2qBaWuul6+04fMXufSIBeaH1IuFSfbKJX9bJsrRaZkobFRpgRR//LGxRm/GHrOyp5507Jk82vmHd4Cd9+/tHBsPh0rwv2JE/gW8eBNdbTpuqHg+oADqER51zfVn2llb3SgQxzr+hklCHuwmqbYRwpWDOAY2gnDPC+LlYNGsdp/Hgr3Sqx/Ptgo835C0UZwz4W8LOyxAUbYXP3NcEA9XShP6EwUM=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(376002)(39860400002)(136003)(396003)(346002)(36840700001)(46966006)(86362001)(356005)(70206006)(7696005)(8676002)(110136005)(54906003)(2616005)(70586007)(83380400001)(426003)(478600001)(82310400003)(6666004)(316002)(36756003)(5660300002)(8936002)(1076003)(81166007)(186003)(44832011)(26005)(82740400003)(47076005)(2906002)(36860700001)(336012)(4326008)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2021 05:38:40.6833 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b1ab3c47-2819-4e4f-0a53-08d941097a06
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT030.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4308
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
  add acp5x init/de-init functions
  ASoC: amd: create acp5x platform devices
  ASoC: amd: add ACP5x PCM platform driver
  ASoC: amd: irq handler changes for ACP5x PCM dma driver
  ASoC: amd: add ACP5x pcm dma driver ops
  ASoC: amd: add vangogh i2s controller driver
  ASoC: amd: add vangogh i2s dai driver ops
  ASoC: amd: add vangogh pci driver pm ops
  ASoc: amd: add vangogh i2s dma driver pm ops
  ASoC: amd: enable vangogh acp5x driver build

 sound/soc/amd/Kconfig                       |   6 +
 sound/soc/amd/Makefile                      |   1 +
 sound/soc/amd/vangogh/Makefile              |   9 +
 sound/soc/amd/vangogh/acp5x-i2s.c           | 438 ++++++++++++++++
 sound/soc/amd/vangogh/acp5x-pcm-dma.c       | 527 ++++++++++++++++++++
 sound/soc/amd/vangogh/acp5x.h               | 188 +++++++
 sound/soc/amd/vangogh/pci-acp5x.c           | 356 +++++++++++++
 sound/soc/amd/vangogh/vg_chip_offset_byte.h | 337 +++++++++++++
 8 files changed, 1862 insertions(+)
 create mode 100644 sound/soc/amd/vangogh/Makefile
 create mode 100644 sound/soc/amd/vangogh/acp5x-i2s.c
 create mode 100644 sound/soc/amd/vangogh/acp5x-pcm-dma.c
 create mode 100644 sound/soc/amd/vangogh/acp5x.h
 create mode 100644 sound/soc/amd/vangogh/pci-acp5x.c
 create mode 100644 sound/soc/amd/vangogh/vg_chip_offset_byte.h

-- 
2.17.1

