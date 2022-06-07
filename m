Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D29653C503
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Jun 2022 08:37:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A75BD17EB;
	Fri,  3 Jun 2022 08:36:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A75BD17EB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654238253;
	bh=BkuUi2UsOymjiAS0xxwh7LjG0z0PsydvSFZE6qQfgBY=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Qafy2VVkPdRtSemBZM3QNvW9Wr2GOgaTeNoT+UytdIGNiud/dI3lfufFUzYqAEsUT
	 K0sL8H6CajQF5kO41XzoIXNSqymUeRMZPkW8pFWBShgXyew/9uNxRInUlYAJHFFb/I
	 BeW3qc0h4lj6SP7aZXEqVSZKhrVsrlLGU6Zpkhu8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DC996F804D6;
	Fri,  3 Jun 2022 08:36:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 59C9DF804CC; Fri,  3 Jun 2022 08:36:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam07on20628.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eb2::628])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1A9F4F80089
 for <alsa-devel@alsa-project.org>; Fri,  3 Jun 2022 08:36:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1A9F4F80089
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com
 header.b="fse6oGDE"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G8tBuoSYWG9sf7eEW2qbdQz0q3Uhx8CkJyWxGy6/y7H+W5yYSJE2plLuCf+sNak3Qsll76hXhzttkoiVaQcT41pWGcP8/Pt7rKHqfWo87SPlhLDvmPIG7bjioocEEzXQsX7OK7+CKxbKkeNTqdiu+xdEIDB2Acz4sfRfH5q1OudazI/U1XOuav7DCUknOowKfFE4rq+wya3uqve4vjQ9h7oT7jSv3UWZ+F7GLHsosM0GzB3TrNDmmdKAICR3+SXxGrVNnVHsTyaA/fAHWG41g4Af8ifEXzZq6qRy3xePk0DHwXHv/Vw5TnyM+s2PAycKYTHcFbcQ/2zeR3p619TRwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zhv/mg6gpAKljkgOKz37nASLa3uwHUFhz6gRCtTCt78=;
 b=DZGaosTf4QsfWUwfkuixXVoEe8iOwxkJO3jauByuIPFvtAZdjkHxf7Nrb63YeAAjamtSBaOYwGdDapKR4LbN2U5T0UO4vDXydk0X1D+IBVjfPxIeSfPmHGdZl3E/bCxtNx+D5e68Qx/Qf7mLkbv49lkOqGKWGmlYkwVx5k2mncW3SPo+0U4zlFwkADhtYtn//eV8lGpfOuDhcS028ZKLsatkVFthuJw4CGHCQ3KHb0qizSVKW53jFW6bJmxk5/LsfKp4vlgZfBZbBESmbLL1ItBgezpgkEEF/XqYJ3v/3wVytkNx3DPZG37QNSucMwyQEdni9QVSJdouWNsTqUZyug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.235) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zhv/mg6gpAKljkgOKz37nASLa3uwHUFhz6gRCtTCt78=;
 b=fse6oGDEQZisQ73D04u7/GCVyekDhpuVtoFSk/cyPS1bdhYPc3xm2Uuse8g0FunGE2qvp7LnBp2NVavvODlPAHCenUf5GaCtrDIaFYd0hzFpx68Z6W40ETniNH/UO15oUHqdaasDGOgcQXjr00RGI4PHIamQ08v9zSBsX1/2FmkiQ5WePJXErSNDVVWUhZEj+7BqBX4PBInG/hEjJ2nL0rcRY4iZyTmVjip1j5GhSU0aAgcZ3FwNsArwhTSZP9ptxRna5qPhyEhRIlLKEraCxrYMw1YA69Gf2HuvVIonFdcOtgC+fZa8JLporzl/1qTNrL7ysD/3a9i+LSMRITtF+g==
Received: from DM6PR08CA0061.namprd08.prod.outlook.com (2603:10b6:5:1e0::35)
 by BYAPR12MB3527.namprd12.prod.outlook.com (2603:10b6:a03:13c::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.13; Fri, 3 Jun
 2022 06:36:24 +0000
Received: from DM6NAM11FT036.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:1e0:cafe::ef) by DM6PR08CA0061.outlook.office365.com
 (2603:10b6:5:1e0::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.13 via Frontend
 Transport; Fri, 3 Jun 2022 06:36:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.235)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.235 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.235; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (12.22.5.235) by
 DM6NAM11FT036.mail.protection.outlook.com (10.13.172.64) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.5314.12 via Frontend Transport; Fri, 3 Jun 2022 06:36:24 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by DRHQMAIL107.nvidia.com
 (10.27.9.16) with Microsoft SMTP Server (TLS) id 15.0.1497.32;
 Fri, 3 Jun 2022 06:36:23 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Thu, 2 Jun 2022
 23:36:23 -0700
Received: from audio.nvidia.com (10.127.8.10) by mail.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server id 15.2.986.22 via Frontend
 Transport; Thu, 2 Jun 2022 23:36:19 -0700
From: Sameer Pujar <spujar@nvidia.com>
To: <broonie@kernel.org>, <robh+dt@kernel.org>,
 <krzysztof.kozlowski+dt@linaro.org>, <thierry.reding@gmail.com>,
 <catalin.marinas@arm.com>, <will@kernel.org>, <perex@perex.cz>,
 <tiwai@suse.com>
Subject: [PATCH v3 0/6] OPE support on Tegra210 and later
Date: Fri, 3 Jun 2022 12:06:06 +0530
Message-ID: <1654238172-16293-1-git-send-email-spujar@nvidia.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 17161fe9-88f5-469a-3155-08da452b6147
X-MS-TrafficTypeDiagnostic: BYAPR12MB3527:EE_
X-Microsoft-Antispam-PRVS: <BYAPR12MB352726CC55BF75DA97F050F3A7A19@BYAPR12MB3527.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oU9qz0yBGN3xfFcNti36JW8JDLppCKKVaQIPGWNTVe6p7yMnl8uMiv/SLIP1qBvKjAdMiikfncnQMDOVL37XppzFdrX8zUv3vioowSMFTYUtS5z0FvSQNifHpBfiuiwUxCkBaNrw4BeXEGD0EFqOTFBSwigYm/YiqTGJrcbPtyWwhT0LvLjYXz9KaH5RdPABVYCT1tEKckUC/0HvSpxCozZz+ZFfYKc6LnzBh3EpOjLdyp5pfBo1cJRgCglP0GhgiFRtvwzsV3RMLj4CcyeLOy9SVxW1vRVBgAvEffxy/Md8GZFYglcG49h11MEi6PvJU3MorGWSYn545pst9liuXE5sBCvT/Giql7t1X2dVgKXi5Z2MbtDxYRR+3+7wnrZtT8EIYoo0fiHnCfSwy71qYoyMFVlEBHTDD1vF40Wgecqk0sRwj235UOZAHDYRcDHUqprX3VMP4qDJS9Pi21tALngfM/kot+LFeQGGiy4GR3bL7IfrwNH9Xp/6OsDTgFy6jC6Yqn2DvI3QXDhClvxGbsJ7hdyWI3Wg/nigTOK+S9o6Jd66lGVHfMagrKR4SnKgKbrpUVA3PMx22ctut196pFq/99PD8RCoeJeuHlUwMf/uoOPVsUhtFdU3eD7WvL7t2YOwdVEZvETX7G7qPgpREc8RmN2tmaaVZi7w1wSf8+OoT8AicKEdx82eqyGPimjxtDlTjUAMTuXFkDjFkbCMFg==
X-Forefront-Antispam-Report: CIP:12.22.5.235; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:InfoNoRecords; CAT:NONE;
 SFS:(13230001)(4636009)(36840700001)(40470700004)(46966006)(26005)(8936002)(2906002)(83380400001)(36756003)(5660300002)(82310400005)(7416002)(8676002)(4326008)(81166007)(70586007)(70206006)(316002)(336012)(86362001)(110136005)(426003)(107886003)(54906003)(36860700001)(356005)(47076005)(2616005)(508600001)(6666004)(186003)(7696005)(40460700003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2022 06:36:24.3218 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 17161fe9-88f5-469a-3155-08da452b6147
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[12.22.5.235];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT036.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3527
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Sameer Pujar <spujar@nvidia.com>, linux-kernel@vger.kernel.org,
 jonathanh@nvidia.com, linux-tegra@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
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

This series adds support for Output Prcoessing Module (OPE) module on
Tegra210 and later generations of SoCs. OPE is a client of AHUB and
it has sub blocks of PEQ (Parametric Equalizer) and MBDRC (Multi Band
Dynamic Range Compressor) for data processing.

An ASoC component is registered for OPE, which includes PEQ and MBDRC
functions as well. This can be plugged in audio path using ALSA mixer
controls. The series adds necessary binding documentaion, driver and
DT binding patches to enable OPE module on Jetson platforms.


Changelog
=========

  v2 -> v3:
  ---------
    * Drop "Device Tree Bindings" string from bindind doc titles for
      OPE, PEQ and MBDRC.

  v1 -> v2:
  ---------
    * Use generic node names for OPE, PEQ and MBDRC devices. Update
      binding doc and DT patches for this.
    * Remove redundant nodename rule enforcement from
      OPE, PEQ and MBDRC nodes. Update binding doc patch for this.
    * Fix spaces before binding doc examples and remove '|'
      from binding doc descriptions.


Sameer Pujar (6):
  ASoC: tegra: Add binding doc for OPE module
  ASoC: tegra: Add Tegra210 based OPE driver
  ASoC: tegra: AHUB routes for OPE module
  arm64: defconfig: Build Tegra OPE module
  arm64: tegra: Add OPE device on Tegra210 and later
  arm64: tegra: Enable OPE on various platforms

 .../bindings/sound/nvidia,tegra210-ahub.yaml       |    4 +
 .../bindings/sound/nvidia,tegra210-mbdrc.yaml      |   47 +
 .../bindings/sound/nvidia,tegra210-ope.yaml        |   87 ++
 .../bindings/sound/nvidia,tegra210-peq.yaml        |   48 +
 arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts |   43 +
 arch/arm64/boot/dts/nvidia/tegra186.dtsi           |   23 +
 arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts |   43 +
 .../arm64/boot/dts/nvidia/tegra194-p3509-0000.dtsi |   43 +
 arch/arm64/boot/dts/nvidia/tegra194.dtsi           |   23 +
 arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dts |   84 ++
 arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts |   84 ++
 arch/arm64/boot/dts/nvidia/tegra210.dtsi           |   40 +
 .../dts/nvidia/tegra234-p3737-0000+p3701-0000.dts  |   43 +
 arch/arm64/boot/dts/nvidia/tegra234.dtsi           |   23 +
 arch/arm64/configs/defconfig                       |    1 +
 sound/soc/tegra/Kconfig                            |    9 +
 sound/soc/tegra/Makefile                           |    2 +
 sound/soc/tegra/tegra210_ahub.c                    |   39 +-
 sound/soc/tegra/tegra210_mbdrc.c                   | 1012 ++++++++++++++++++++
 sound/soc/tegra/tegra210_mbdrc.h                   |  215 +++++
 sound/soc/tegra/tegra210_ope.c                     |  419 ++++++++
 sound/soc/tegra/tegra210_ope.h                     |   90 ++
 sound/soc/tegra/tegra210_peq.c                     |  434 +++++++++
 sound/soc/tegra/tegra210_peq.h                     |   56 ++
 24 files changed, 2908 insertions(+), 4 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra210-mbdrc.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra210-ope.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra210-peq.yaml
 create mode 100644 sound/soc/tegra/tegra210_mbdrc.c
 create mode 100644 sound/soc/tegra/tegra210_mbdrc.h
 create mode 100644 sound/soc/tegra/tegra210_ope.c
 create mode 100644 sound/soc/tegra/tegra210_ope.h
 create mode 100644 sound/soc/tegra/tegra210_peq.c
 create mode 100644 sound/soc/tegra/tegra210_peq.h

-- 
2.7.4

