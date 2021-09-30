Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A299D41DD17
	for <lists+alsa-devel@lfdr.de>; Thu, 30 Sep 2021 17:15:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3CAB116E7;
	Thu, 30 Sep 2021 17:14:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3CAB116E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633014901;
	bh=OivjY9xt6+Jae7EsKtnSK8PPzZbKAA+P+Z6I5kg73hQ=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=NJU48qU5QiYALxhgAqnOT6HVJVngs5okAp+dFkUU8YHXy5T6tGbLQdiJHEXqgCddY
	 T6tY9ipQ5Rh/kxfSBmwlEe3qd5If9SQV3bOGjeiZT1GIyOKWufzWAZbmWxR5Yv5Rs0
	 VvV7BKbbOyPXTMl6oSzZkWGiYt16mAX7dYJl62p8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9C75CF80516;
	Thu, 30 Sep 2021 17:11:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2331BF804AD; Thu, 30 Sep 2021 15:24:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2079.outbound.protection.outlook.com [40.107.94.79])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CCB7FF80218
 for <alsa-devel@alsa-project.org>; Thu, 30 Sep 2021 15:24:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CCB7FF80218
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com
 header.b="SfuzCRqK"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M9lAhCCrJfv71eRYw7aND2i00aAbZ39qcU5Tx1fi3Ukqhw0tedPgz1zxGXcPra6e1gTtwoLBassZqf2vplsSoWKi0wfdeCdOJSzP9tcJvwbB4CRcP+h0QFkeISLkna/1lpSrbdn8GXP+XUie1Ro8UHkxEI2gkXUIYDWEN8KamRAG0c0MojDcAepo9mkjzyubJwUZ5dH6aInaPX0mvnDJrzc4WZYrX62uMcXs83HOHuP1Xblc+pBezTfMlo7qQHb8dDJfiWKbKFz07b6VQowhpbHVN8KE7/7+3jwO9OFqCGbSMDT85HywFP5RxtV/HK1kZ7sl0CcwLvsjjoduB9Lysw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=v+Dxxc4xBuAQq1zfiX5X8GXyLOPQHAOG3FuXjGuB3mU=;
 b=WwTscBBi+xoFq4To6kBc+hlxOFbZMosmaXqH5zuY21WNu71uDeQttRcnKcmeM+kfjv0/j53O5ViNmpIqZAufFPx/8/6gerVAjvpbooM8K7A19pnzjoW45LaEpZT3eVuqA3tzp05bQ6fT8QoUarmuKmZ7hi86aX5m7zqX6nqmSBASKzhIXLawzDAYMEgQVcDZIPN/cjgnYOCkEczWV5J+lk/WkAEjSS/qIMIf05FqsdCXq1pU7vij1vqCcJNTaR6EeIGm2pjvonk+FxiQubs4IenOIXp4p14h/ixGY9AByhRPFZMzTrRKm+YzUiOJGZzxwjqIepIQzzGmNc6d++0X5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v+Dxxc4xBuAQq1zfiX5X8GXyLOPQHAOG3FuXjGuB3mU=;
 b=SfuzCRqKuNTVsBSwutfhpune4TIpZqgqO0vB4T2DcYJeQDqQN19ApqS5HTvwDFCghd2yf7LDq9YAq4ZCfhT+caxLKYrNSJIO0awWySbyx5BCCCUX7m/KaNQ1QaodxBLn/Hl/ZuKzz6gfdZ2NVq+2Caau1bmBnAKwfWdCWsbXktA=
Received: from DM5PR07CA0036.namprd07.prod.outlook.com (2603:10b6:3:16::22) by
 BY5PR12MB4003.namprd12.prod.outlook.com (2603:10b6:a03:196::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.14; Thu, 30 Sep
 2021 13:24:26 +0000
Received: from DM6NAM11FT041.eop-nam11.prod.protection.outlook.com
 (2603:10b6:3:16:cafe::e4) by DM5PR07CA0036.outlook.office365.com
 (2603:10b6:3:16::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.14 via Frontend
 Transport; Thu, 30 Sep 2021 13:24:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com;
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DM6NAM11FT041.mail.protection.outlook.com (10.13.172.98) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4566.14 via Frontend Transport; Thu, 30 Sep 2021 13:24:25 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.8; Thu, 30 Sep
 2021 08:24:24 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.8; Thu, 30 Sep
 2021 06:24:24 -0700
Received: from chrome.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2308.8 via Frontend
 Transport; Thu, 30 Sep 2021 08:24:21 -0500
From: Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
Subject: [PATCH 0/8] ASoC: Add common modules support for ACP hw block
Date: Thu, 30 Sep 2021 18:54:10 +0530
Message-ID: <20210930132418.14077-1-AjitKumar.Pandey@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: eec700ae-d2ba-450e-f921-08d984159f9b
X-MS-TrafficTypeDiagnostic: BY5PR12MB4003:
X-Microsoft-Antispam-PRVS: <BY5PR12MB4003B69516362D2C4113F76982AA9@BY5PR12MB4003.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0Tx0HVUGSJxwSi+jkhrXMndPOiE1qPEcen0rki+6ARv5lf5mj1vdE+Hi/FcSP1vWjaWzBDvXAVFTt0DJYU2atvTSZeKor6rQB/vDj05/cVelyk/kmBJmDYmk01WP/CNirQ2PWao8bm2hdjJX4/hwCpWctitEYbnjS6v15K8DM3C69Dzyp64tmkrkgD4gTZ3mqrrqKxtYIkEycQZB/j1Xi6x2EasK+pGGB+Kfc0HzfqIo7s5EjP+Vac+ClXNatlcui8yrnewmmDvh5UlSq712Lddw1goZkD8GleHeh4xT5YwtbxML4kFvRkARbTpcewLTmUDJIG0FqNMXIv0vYs0rhpBd8+lqPpRGhh3s6I14uSt63vIlnLRxBj510F3Rl5ZR5f92eeqB54FA0FdMMNY2s94Q5Uh4DgtpOxLsOQWpu9XvH505s+hJKzhwzT7Sv24UDzE9YxSa/hvJ7f9n6yAEIXyZfe1TwUtRz07hnp/sbDMvQKsUE46CT4YsEFQcC5RX/NL3jRcLlM/IKoQ6cu5cU/QBwTw/nql0VAGk7itLv2R0BJXloKA5soOw2d8GC9kHza+OmCgBty6Aq/uBJ3c5DQShIfBOB18H8AUHEycrq4lve23Nbxd5A261aqcWkjkLJ2+rr7vhX/xh4l6PNrYhGRN62NQN2rCyWVL1M9mnt8skYNLFV/fqn/bp3RaS762wC5ispNs4/mvKbIGfKtGfNlfp5vhTHLs+zCx4mnzN1gw=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(36840700001)(46966006)(1076003)(6666004)(70206006)(70586007)(508600001)(83380400001)(47076005)(82310400003)(2906002)(316002)(36756003)(110136005)(54906003)(8676002)(36860700001)(81166007)(336012)(4326008)(86362001)(8936002)(5660300002)(2616005)(356005)(426003)(7696005)(186003)(26005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2021 13:24:25.5435 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: eec700ae-d2ba-450e-f921-08d984159f9b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT041.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4003
X-Mailman-Approved-At: Thu, 30 Sep 2021 17:11:01 +0200
Cc: Alexander.Deucher@amd.com, Basavaraj.Hiregoudar@amd.com,
 Sunil-kumar.Dommati@amd.com, Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>,
 Vijendar.Mukunda@amd.com
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

We need to support I2S audio on various different platforms SOC in near
future. At present we are creating new folder under soc/amd/ for each
platforms support with separate I2S and DMA device modules across each
SOC. Actually AMD's audio coprocessor block commonly known as ACP hw IP
block consist of I2S controllers registers configuration and registers
specs are common across all SOC. This patch series add common folder
named acp in soc/amd/ that exposes common driver modules to configure
I2S and DMA registers across different platforms. Any platforms specific
configurations and dai's will be exposed in separate platform modules. We
will use SOF based PCI driver or common PCI driver to register and probe
platform device modules.

We also add common and more generic machine driver support within this
patch chain. This machine driver can be used across different machines
on AMD SOC with just some minor tweaks related to codecs connections. 

Ajit Kumar Pandey (8):
  ASoC: amd: Add common framework to support I2S on ACP SOC
  ASoC: amd: acp: Add I2S support on Renoir platform
  ASoC: amd: acp: Add callback for machine driver on ACP
  ASoC: amd: acp: Add generic machine driver support for ACP cards
  ASoC: amd: acp: Add legacy sound card support for Guybrush board
  ASoC: amd: acp: Add SOF sound card support on Guybrush board
  ASoC: amd: acp: Add support for Maxim amplifier codec
  ASoC: amd: acp: Add support for RT5682-VS codec

 sound/soc/amd/Kconfig                |   2 +
 sound/soc/amd/Makefile               |   1 +
 sound/soc/amd/acp/Kconfig            |  49 +++
 sound/soc/amd/acp/Makefile           |  26 ++
 sound/soc/amd/acp/acp-i2s.c          | 353 +++++++++++++++++
 sound/soc/amd/acp/acp-legacy-mach.c  | 104 +++++
 sound/soc/amd/acp/acp-mach-common.c  | 557 +++++++++++++++++++++++++++
 sound/soc/amd/acp/acp-mach.h         |  57 +++
 sound/soc/amd/acp/acp-platform.c     | 325 ++++++++++++++++
 sound/soc/amd/acp/acp-renoir.c       | 144 +++++++
 sound/soc/amd/acp/acp-sof-mach.c     | 103 +++++
 sound/soc/amd/acp/amd.h              | 146 +++++++
 sound/soc/amd/acp/chip_offset_byte.h |  76 ++++
 13 files changed, 1943 insertions(+)
 create mode 100644 sound/soc/amd/acp/Kconfig
 create mode 100644 sound/soc/amd/acp/Makefile
 create mode 100644 sound/soc/amd/acp/acp-i2s.c
 create mode 100644 sound/soc/amd/acp/acp-legacy-mach.c
 create mode 100644 sound/soc/amd/acp/acp-mach-common.c
 create mode 100644 sound/soc/amd/acp/acp-mach.h
 create mode 100644 sound/soc/amd/acp/acp-platform.c
 create mode 100644 sound/soc/amd/acp/acp-renoir.c
 create mode 100644 sound/soc/amd/acp/acp-sof-mach.c
 create mode 100644 sound/soc/amd/acp/amd.h
 create mode 100644 sound/soc/amd/acp/chip_offset_byte.h

-- 
2.25.1

