Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 01B5353E53C
	for <lists+alsa-devel@lfdr.de>; Mon,  6 Jun 2022 17:00:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 81EB918C6;
	Mon,  6 Jun 2022 16:59:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 81EB918C6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654527621;
	bh=0IO4m/byTu/PDpOK3C4SxyhoNE7EvPHyAJWe3EnrHjc=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=TOyB4gNNuuuACExckcXDaT6uB9FOd5WV2NiHMLsWzwvlMIOrDJKvwq/5XU4OL+wXA
	 sy9idQ3B3N83K65efle2aUdPaZWK3rw2A2Wz36RaYDzKdN6M9Qhm2rpU/TYc3Xj6Fo
	 b628ARPkvLekRyY0sOfUbPnVjKazXc23vNCqgrbo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EEC03F8012A;
	Mon,  6 Jun 2022 16:59:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9AA97F801D8; Mon,  6 Jun 2022 16:59:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2062a.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eae::62a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7718EF80116
 for <alsa-devel@alsa-project.org>; Mon,  6 Jun 2022 16:59:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7718EF80116
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com
 header.b="UBovv7je"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X33FHSZwEK5QX3A5QwNvkAqC/aH724EGaKzGYSGuEOJCGATtnnEj0JFtZegzU6t3ZeZHKYApyrYu9hb8CQJsvbtkLjfDEvIKyw3HlBmUXRuhbC67lav/+ew55rijhhtUq2z4Mtf2Fj/7Hj4c1hCBy3iIbbrzM6GUzeswxxYrHD0JN2My9gAEF126pnBdor3JU254iiHoh33s6S0cPuGeOG+WhV1+CYHEijRyaX9VlF++TcKTsSJfHn6O2AXVbyWdJAaiy67IvNnezq7RQuVy16oA2c1ezW3BgvEFI9E1b9FkIMvzl77BOMfKsN1t11ORVwSSB2h2iQRTYp2qWLFm+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0IY5K9KsTAVD0lEGP+JK6MVQskw0ONT/WVMr/UP0m4E=;
 b=GODUWudSG2s+soKHz0onjP5c+jjA6a+RfHuGj/Oj4bl5WBncrGwjG02LIxX8DsgXfwS2DTtc+VFnItkg/ExgSQdlu7glgXAJ/Tgl5caOrBsTaLbAYb+AAcP8hrp9bjU6ybVLLFhYAE980Cop1qJa+crH6sONlf0oewBRQymxZ0mmUKfuDfY18fMQiA4eMTLwk00CCRWazRJ+IuFAVtgOuEQebBRjP+Y0joY4A+l+mel/9hsargY8xhxc6GMEif2Yy5WT2opL3zDAQYiwKrkocnawtwZ68g6gEtVM25bflimx+ebVraNRtlqZqEAz+mAZhlIEzN5ur4vSJ5OmJRYbDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.235) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0IY5K9KsTAVD0lEGP+JK6MVQskw0ONT/WVMr/UP0m4E=;
 b=UBovv7jeuDP6HINrfZgXI1uE9L/c3fsX7UrM6KagwTVlGq/nAmEcHndSPqotplWZT/o7ad3ZPLngKIoLYrElXsPdA77Vj8q1R7Iwxi2gPRwXv8Wh23/TGky7rMDC2s1mbh5OT+MWXPsYoEn7qaIzoOnoH9UxdArUbtS+GtGgAvzsm5s9hRZR5UPl8sVA+YLTBiD7zfWhdoehMUkyHHV9WvMWx4eoQc/23WG7zKMBn7i8Kbid7MpNagjWOFKMPEYKo1zUjfSbrm8ZkVNXWFB+UBzwmr1Ye2sZZPyh+NgMEgrn3w/OXD+YV5mVMwxYIaH1phACHG/CW2um9eWsB5fY/A==
Received: from BN0PR04CA0070.namprd04.prod.outlook.com (2603:10b6:408:ea::15)
 by CY5PR12MB6202.namprd12.prod.outlook.com (2603:10b6:930:25::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.19; Mon, 6 Jun
 2022 14:59:13 +0000
Received: from BN8NAM11FT031.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:ea:cafe::3f) by BN0PR04CA0070.outlook.office365.com
 (2603:10b6:408:ea::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.12 via Frontend
 Transport; Mon, 6 Jun 2022 14:59:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.235)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.235 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.235; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (12.22.5.235) by
 BN8NAM11FT031.mail.protection.outlook.com (10.13.177.25) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.5314.12 via Frontend Transport; Mon, 6 Jun 2022 14:59:12 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by DRHQMAIL107.nvidia.com
 (10.27.9.16) with Microsoft SMTP Server (TLS) id 15.0.1497.32;
 Mon, 6 Jun 2022 14:59:12 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Mon, 6 Jun 2022
 07:59:11 -0700
Received: from audio.nvidia.com (10.127.8.10) by mail.nvidia.com (10.129.68.6)
 with Microsoft SMTP Server id 15.2.986.22 via Frontend Transport;
 Mon, 6 Jun 2022 07:59:07 -0700
From: Sameer Pujar <spujar@nvidia.com>
To: <broonie@kernel.org>, <robh+dt@kernel.org>,
 <krzysztof.kozlowski+dt@linaro.org>, <thierry.reding@gmail.com>,
 <catalin.marinas@arm.com>, <will@kernel.org>, <perex@perex.cz>,
 <tiwai@suse.com>
Subject: [RESEND PATCH v3 0/6] OPE support on Tegra210 and later
Date: Mon, 6 Jun 2022 20:28:51 +0530
Message-ID: <1654527537-31038-1-git-send-email-spujar@nvidia.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d10a27e1-5adc-4adf-0480-08da47cd1e6b
X-MS-TrafficTypeDiagnostic: CY5PR12MB6202:EE_
X-Microsoft-Antispam-PRVS: <CY5PR12MB62020E9D7CB982BC97743492A7A29@CY5PR12MB6202.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xjJJysoOn+UsFSkWuUNWD1qgtnMSqztf8t7HTFKRcmMyID/kjvewVz467DyOOB5b5AM76vPbvZU57MlKGpGq/4SKfBklsBMIm8g3G+oXdoNqw4oZNexPC/JHHt84yP6cMH5wg0jBbIXaxVvRoOpnmphKKNVqys90NSsiD9pZDZzM9+DfmWZ+5ij/TiJQXApAKysPBmnDNba/E81lmK2gN44d7SVlr19KTi4akZ0ZMQcLFlxUiPIJpmA92YnGQ0+MdprDV0r6mnjhIVWpJiPYOHaQGtbzAYvEeFwU5/cfgeAKwfrfUCbDFsF09/n1WcfDbaWr9fay5jZ7rJQbmNCOFKMKZElQ27KEGmWCxX08FrLxA0zR83ny/zcgW3jmUhYMKPDV1m1YYYLG4zp+WDUAnAqK8e5o8WDdKyFEp7/zjzD8pcWwj3VRGvmnG+o0Yik2hOSG9fz12cUv+Vgx7REkpPwTt4XJU5WUm4HDT4MNROTZwBBXjrizf23p8hwt2V9U4x4YSRNu5RDvQmj0EXevx9KCTw7KFzIYxCYprloxaWJiV3HL5wXc7eJkWmZXRDnbGe86wY/Y2unoNh9ImMzzSknESy/oGcqXtx6H7f3io1aR5OGbjrqEz7xrRCnpnRu0K44JnGbE8PkqG9aN2hrBuJduAfNSx+Vk+3hrmwfknm6QPe1194Cx9/Pb3cW2DcmXVCWv36gmGxVmwl0BnD5Uag==
X-Forefront-Antispam-Report: CIP:12.22.5.235; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:InfoNoRecords; CAT:NONE;
 SFS:(13230001)(4636009)(40470700004)(46966006)(36840700001)(508600001)(8936002)(36860700001)(336012)(426003)(47076005)(186003)(2616005)(86362001)(7416002)(6666004)(5660300002)(107886003)(7696005)(2906002)(316002)(40460700003)(83380400001)(356005)(70586007)(70206006)(110136005)(54906003)(81166007)(36756003)(8676002)(82310400005)(4326008)(26005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2022 14:59:12.8825 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d10a27e1-5adc-4adf-0480-08da47cd1e6b
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[12.22.5.235];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT031.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6202
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

