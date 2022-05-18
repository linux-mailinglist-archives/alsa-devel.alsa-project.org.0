Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B9F352C104
	for <lists+alsa-devel@lfdr.de>; Wed, 18 May 2022 19:39:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DB21EE0F;
	Wed, 18 May 2022 19:38:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DB21EE0F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652895560;
	bh=Lwi+Jmrvbp316nMjkL62hOM8LwLj8CUYKhPh/NnGvis=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=rfdMm1iKgYQULNaLCVX1b5Xm0ER8e1KRaI5VKVDOptsZVaEbCfNjEifRbUW5a//gR
	 8bq3NvCkbaxkjicyNY1Mnt+QH2i16Z7nWLtB4sV0adqBacbvf4XPfOQg6u2p5CYsxy
	 fcgH9Xud8sXU1CFXUqE17Kp31GInS8he2KwxYCoM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4797DF80279;
	Wed, 18 May 2022 19:38:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 23D88F8023B; Wed, 18 May 2022 19:38:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20603.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe5b::603])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 11F12F80109
 for <alsa-devel@alsa-project.org>; Wed, 18 May 2022 19:38:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 11F12F80109
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com
 header.b="I8eQ9w9X"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EV3o6abbYWD7CwcPoOdyiItBpxRhQ2ButSo9TJ95Ug1gHEzPR8K2Yu3p9xyjMfu/M9qiolGXYec0eT4c/6RduUkJV/CFDB/mtFHy+DIYvP9xM7W+DBDHW5c6w1R21h/A811/XYOPkh7Si7HTCSk1DaY0fWjwN3pH/ETwHcMVZleBJ+7IdzKThJjcYlW64mlCdhBRqUI9OrNVGQFsHOOOo7t9nxcoV7yKxLixOJo3onQZS9xfYKNcjiOfAO75CsfskTL7QCSWChqtq8Zt6MTQfH2AKNbWrOrIFLTcarY8/wZ0H9TmDgVESKXNxVKDeRd05qRqkaZF5IJwTY046Q4QQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e1A2hNy9E98SvlA6Wzsr37Lzh6ZVajuFic7X+cU6E4M=;
 b=Wmt06Iqx+WEIB3jhh0WwWx5I/m9w9Acv+XS+0J7Lulw2ij5Lq1RF8CpP3PrC753xo5M4hPFUawnY6S/dM8L8+s+b08DFq0AzJEImz1aUsKV792hIrnKk1pdFdsd9NdRKf0ODAjARAgtQkCOYgLhB9FhT6lSY4FTSaN16YuHk/sfUZ6pTnNIv62v7QB8s6nroyNE62PU4rvvzv/UJD0fM+WILbY/rOQ1GqKSpurHxlVe/9Di7Ux2ITEE9NmTvKh5ptR8Kbeo5EJrHCT4WI5Nxha33klq8DCM6QYzpEuCO3NCu5sYGni4J/6amz0p72X2kTsQ2HRUVpE4S0WgQBF867w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.236) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e1A2hNy9E98SvlA6Wzsr37Lzh6ZVajuFic7X+cU6E4M=;
 b=I8eQ9w9X3Hs5Z+J3JP384sZ6+gnqmUJCuHVS5FPMxWR3DILaELk+JW9K/n7lpUQgSs98eo+dILI4WT1wAYEv9WjfDXo4pPL3mS9lfEI+02Y4vuJaaUasM5LP9UTwHbwNPaFwx25p9RMd/rOLoqpW+Sm578BfC079cugRfjzT473hzgEL1ZNS7hqwnNDRBpO4rKGh2c8zObgkS3+B0VH+CSrrAWUy7E1ecOS/DFAFL8oIpAhm9s7BnNXLgi9ee2Uquri9+pX+Ut10KE+z5wWRRsyONx6f1kT7HIoKw2ScqBKN4G6BoxkzMTaNEzGMqP/vBzcj4FY3N7uwk2OLUm3XFA==
Received: from DM6PR03CA0025.namprd03.prod.outlook.com (2603:10b6:5:40::38) by
 BYAPR12MB3462.namprd12.prod.outlook.com (2603:10b6:a03:ad::16) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5273.14; Wed, 18 May 2022 17:38:11 +0000
Received: from DM6NAM11FT041.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:40:cafe::d2) by DM6PR03CA0025.outlook.office365.com
 (2603:10b6:5:40::38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.15 via Frontend
 Transport; Wed, 18 May 2022 17:38:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.236)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.236 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.236; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (12.22.5.236) by
 DM6NAM11FT041.mail.protection.outlook.com (10.13.172.98) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.5273.14 via Frontend Transport; Wed, 18 May 2022 17:38:11 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by DRHQMAIL109.nvidia.com
 (10.27.9.19) with Microsoft SMTP Server (TLS) id 15.0.1497.32;
 Wed, 18 May 2022 17:38:10 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Wed, 18 May
 2022 10:38:09 -0700
Received: from audio.nvidia.com (10.127.8.10) by mail.nvidia.com (10.129.68.9)
 with Microsoft SMTP Server id 15.2.986.22 via Frontend Transport;
 Wed, 18 May 2022 10:38:06 -0700
From: Sameer Pujar <spujar@nvidia.com>
To: <broonie@kernel.org>, <robh+dt@kernel.org>,
 <krzysztof.kozlowski+dt@linaro.org>, <thierry.reding@gmail.com>,
 <catalin.marinas@arm.com>, <will@kernel.org>, <perex@perex.cz>,
 <tiwai@suse.com>
Subject: [PATCH 0/6] OPE support on Tegra210 and later
Date: Wed, 18 May 2022 23:06:06 +0530
Message-ID: <1652895372-29885-1-git-send-email-spujar@nvidia.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a37d564a-5be1-4908-5258-08da38f52dd5
X-MS-TrafficTypeDiagnostic: BYAPR12MB3462:EE_
X-Microsoft-Antispam-PRVS: <BYAPR12MB3462C1A7866BC9FAEB906FD0A7D19@BYAPR12MB3462.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tSJ7mkmed8ReRJoJBCvWn0HrNBdujDvffrLNKpFId4DdrT8mkLDrF+xUeL0/Y8MuDKzeczHwANPPo/1I1hmw4LuGiGG6mO+AnlFCP870Wp9jqiWbTikaIeamWYkBWSSRsj3pKsLPf6INeUnj1O4zuk5gNtfbcKQQF3KoUxOEEbWwybxVda/FbTdZ7qfJohRjGix+JcYwNOwmoW4ToWzlZUfBAt44C9+0glaMsUp+yivKrXfAmQloqROe/tI3pqcdP4dHhVryh92lLne1u+m2UF23qSlcVUxOAhRJ5oo473TaNOIDCFo3Top0rfnZlNkN/Us2C7MLhA6Q7uYCIdyTWsnY2qU0gP1c/DRoMDJHqHRkIi8pahDd32U7cek6x91/KNRWGYB++D5rD4oSDRHz1aGr7l6ta65MS+SLKDG44rwFclqCfI0dsjdhbskO2n+OCmiU6/pTjOFf6cTerJBL8yTkRVJAv1cl6TkbPTx7Of7PM5dwtmREQnBBBzgrjT9YOK6tY12sM8ddGYbCbluIx2rtmBN3Q9aG+xWnvsfJUcA7dCNhFvTiz3M1LBV9S5GFdTX1kBqHsAkDw+tmAZDB4umFgPf0DfsPPoSz84+jS95WDXmX9viqTBEDOo0hAa2LX0rbxucbxoZC5f+pGa8qnOYvK7tTbLl86R6AussFdkkPZwUrAJtucFmwh0dqUBFbSX2DtlXXUZtHDQkoGnA9Jg==
X-Forefront-Antispam-Report: CIP:12.22.5.236; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:InfoNoRecords; CAT:NONE;
 SFS:(13230001)(4636009)(36840700001)(40470700004)(46966006)(82310400005)(7416002)(316002)(8676002)(70586007)(70206006)(4326008)(40460700003)(5660300002)(110136005)(54906003)(7696005)(508600001)(81166007)(2906002)(26005)(356005)(336012)(83380400001)(86362001)(36756003)(186003)(426003)(47076005)(8936002)(36860700001)(107886003)(2616005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2022 17:38:11.1725 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a37d564a-5be1-4908-5258-08da38f52dd5
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[12.22.5.236];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT041.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3462
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
Tegra210 and later generations of SoCs. OPE is a client of AHUB and it
has sub blocks of PEQ (Parametric Equalizer) and MBDRC (Multi Band
Dynamic Range Compressor) for data processing.

An ASoC component is registered for OPE, which includes PEQ and MBDRC
functions as well. This can be plugged in audio path using ALSA mixer
controls. The series adds necessary binding documentaion, driver and
DT binding patches to enable OPE module on Jetson platforms.

Sameer Pujar (6):
  ASoC: tegra: Add binding doc for OPE module
  ASoC: tegra: Add Tegra210 based OPE driver
  ASoC: tegra: AHUB routes for OPE module
  arm64: defconfig: Build Tegra OPE module
  arm64: tegra: Add OPE device on Tegra210 and later
  arm64: tegra: Enable OPE on various platforms

 .../bindings/sound/nvidia,tegra210-ahub.yaml       |    4 +
 .../bindings/sound/nvidia,tegra210-mbdrc.yaml      |   51 +
 .../bindings/sound/nvidia,tegra210-ope.yaml        |   91 ++
 .../bindings/sound/nvidia,tegra210-peq.yaml        |   52 +
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
 24 files changed, 2920 insertions(+), 4 deletions(-)
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

