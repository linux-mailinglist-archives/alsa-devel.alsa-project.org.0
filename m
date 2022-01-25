Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A1E4849AE70
	for <lists+alsa-devel@lfdr.de>; Tue, 25 Jan 2022 09:50:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 20409208B;
	Tue, 25 Jan 2022 09:49:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 20409208B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1643100641;
	bh=31oZMxbtp0/ohGZw/P/sLInUwR5Alo/8OsUyhV/8S+Y=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=L5KhH8wC3q22NJ4e5y1XyESCnkHMd9xamQmegVoe8VZPu938NXU3GFYcLZHYFUF2R
	 F7axq5M8aJ6wPNL/z2Ik4ZaIbH7eZPhe3BSLT5qYbW1rgmEWkJUPNFg5kaDhvJUH6v
	 x44YcOSqs0e0H3P0KKHMy5pZ6VDMzJf5/AYAbpxI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DA737F80508;
	Tue, 25 Jan 2022 09:49:10 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 07F03F80508; Tue, 25 Jan 2022 09:49:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2053.outbound.protection.outlook.com [40.107.237.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5835CF80169
 for <alsa-devel@alsa-project.org>; Tue, 25 Jan 2022 09:49:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5835CF80169
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com
 header.b="dLvtwG/9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Hj1M+KuVetgbcE2FpMzHsZClLC/qaIOlGOKb30v5Di2SvTAGGT0FOc9itdIDZ97a3QH50Eprcoz32C32VZizrdoH0YoX0z81yor2k2yWsRW5MWLi2ddOWWYD2FgwYEGN0uI56tjZyWkT6Or8pvfkJemnqlPX3RUJkVbPOPk4+wUa71bBS7kS+oN3tocxyZF4pldZvLiiHgxEOTPXQZ1o/TIFK6G18QFAi4coOu16hSCtxfqFOnM/vkhD87Iot3yfG/D0n/1WFrcwgnsjanrDzJJVDpSEtViOcbbiSRQEsvKOu2Otu9SsFgWBsiuM4rziNAKZ8MWmv8EsOzpFFF7FgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=edcE27k9p4OvfH65KZxeDvdF152RedEvx26MfrE/VJ0=;
 b=FnRihnLtZtYTsPnhzh07HSWuMRxn5SzZGsZQ60e6fKnfGv0FWzf4cezXh3MjMcuYpS2jduuqp1xtVaYtlWUBcwqQUcfnKRWpKVpyQsvgiXztsjXKVj7ebgf3YcbKORFQ4b7PMl3wYkfxztTAvVtrunBPnuKEZfjGsJY1uHZypqLmW4wWKm7nF7qRh97p95aBLodn+857xDWHcbsvPytEeZCbGZTWUXrbCpZ5i0l728ggl/Koqz9bU45G87JNIlKeywNOE6n0DNCEH3tL8J5AjGoNwQEbpAiK3wbLbCREWFZgbF/E92QNpwz5kVEr0blcfmRhLtWuZraepTEpWIPefw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.235) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=edcE27k9p4OvfH65KZxeDvdF152RedEvx26MfrE/VJ0=;
 b=dLvtwG/9X7fhgdJQH5SThCok7VNhzFity3JsHLYUFvBdSYe99qERNt2ensNbw/L2iL9P2f0igQgwSZZtjRC8d5OLRnucwdD8/e1FPHsOAhWVmcS/wgotJQ514JnvT93bpwvI6BGhdgm1HdVXxqlzEED7vHB/Gh0PEclW+SKlLyiyTWfOnC3g4BbnyIpf8y5dsYK8feykVMurg2tBdd0LIYLA4O0H2H6hr6X6O9pnovNe0XSOmLfMsXZiZxt1+amdj81XQI/5atrvcJAqsV79PqxTJBCfsRFcPsvEXJuReBocJIf/+85T7aQbtp8aBN7ZfUK0MgVnNQW1M+VskeOUdA==
Received: from MW4PR04CA0360.namprd04.prod.outlook.com (2603:10b6:303:8a::35)
 by DM6PR12MB3547.namprd12.prod.outlook.com (2603:10b6:5:18a::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.12; Tue, 25 Jan
 2022 08:48:58 +0000
Received: from CO1NAM11FT068.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:8a:cafe::2b) by MW4PR04CA0360.outlook.office365.com
 (2603:10b6:303:8a::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.8 via Frontend
 Transport; Tue, 25 Jan 2022 08:48:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.235)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.235 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.235; helo=mail.nvidia.com;
Received: from mail.nvidia.com (12.22.5.235) by
 CO1NAM11FT068.mail.protection.outlook.com (10.13.175.142) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4909.7 via Frontend Transport; Tue, 25 Jan 2022 08:48:58 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 DRHQMAIL107.nvidia.com (10.27.9.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.18; Tue, 25 Jan 2022 08:48:47 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.9; 
 Tue, 25 Jan 2022 00:48:46 -0800
Received: from audio.nvidia.com (10.127.8.10) by mail.nvidia.com
 (10.126.190.182) with Microsoft SMTP Server id 15.2.986.9 via Frontend
 Transport; Tue, 25 Jan 2022 00:48:43 -0800
From: Sameer Pujar <spujar@nvidia.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>, <tiwai@suse.com>,
 <perex@perex.cz>, <robh+dt@kernel.org>, <thierry.reding@gmail.com>
Subject: [PATCH 0/5] Tegra234 APE support
Date: Tue, 25 Jan 2022 14:18:06 +0530
Message-ID: <1643100491-5398-1-git-send-email-spujar@nvidia.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3b50c76a-2bf0-4701-1146-08d9dfdf86c3
X-MS-TrafficTypeDiagnostic: DM6PR12MB3547:EE_
X-Microsoft-Antispam-PRVS: <DM6PR12MB35473D353113DE335174B059A75F9@DM6PR12MB3547.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2887;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lwOLuwbQBuLAl8soVCmHmIaFvNtHpNRZo1yPJET67n+4rXn2QDutAthPGKZwpZBsWDZXB3V4a17xwBcDJXWFKqQ6vQMlbEcirQrbpxL2BtL+cZq6muLsRXG1evs95wNKpoNhmatmib+Ym2gyJP0JeNCX27x4k3wB72kppzQAV3qBDCL2o5+ZLyxYIM6WeQ8s7E4FZ8xjiWgWkhPlGyHDDYz3e0KTZaa0M7WvEQAOZCfahSUPcl8jhTDIl3+PFj1IlTUExUqBZ8nID8Eg4AjfACDpRWYmxnnRv/GoIPxGDFpNewohg++r8jXRzQTBD2OVw2asuE0gEZh3jjU92mmHeh+XyqLFu/Crn3KE4D1xSLfnbzWomJhbhvlICsP6mOlOHf04QjunaQsFSdM7NNfTDzQMyUCCu7ryzZhPUBw3ofSOTfG6IaI1D69pRDinVH//obOdQ3jjs6UGbMQ/S0lYMiVt9nJQthnqF+hnopVcr06tfPlmBFQV1UDtkLigOlBGFAM9CICBRYhwqz6kCldGLhEqFN0HEBs3CZ2u4tyCG0aQfYSEzNUzFaLyZrFGE74HoSutWYTtOdI5XeKgbGpeUtCkC2KET07WqzjKruM19M/fPZ63pmHuri1qtldc6Wk84BihkXkh2nHif2hA5aBkiyYBduNjKGt/hSqT9eK0ruOqDD5u8eY9leMe1XqWfg76/2SnQun4Zkw8zGYs7WGRnfgBJ4Eonnkm3IjrN1Xx6GU6plvMoIpHUSLBFWFG4npnnoV/0yXQyEQ8oi+S3uFJ2Wn9zK6K3fksiBNRjgsCRIs=
X-Forefront-Antispam-Report: CIP:12.22.5.235; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:mail.nvidia.com; PTR:InfoNoRecords; CAT:NONE;
 SFS:(4636009)(46966006)(36840700001)(40470700004)(86362001)(54906003)(7416002)(316002)(2616005)(186003)(7696005)(5660300002)(8936002)(70586007)(107886003)(36756003)(110136005)(8676002)(508600001)(36860700001)(83380400001)(2906002)(40460700003)(47076005)(336012)(81166007)(426003)(356005)(82310400004)(6666004)(4326008)(70206006)(26005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2022 08:48:58.0174 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b50c76a-2bf0-4701-1146-08d9dfdf86c3
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[12.22.5.235];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT068.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3547
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Sameer Pujar <spujar@nvidia.com>, linux-kernel@vger.kernel.org,
 jonathanh@nvidia.com, linux-tegra@vger.kernel.org, mkumard@nvidia.com
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

This adds APE support on Tegra234 and enables sound card on
Jetson AGX Orin platform.

Mohan Kumar (1):
  ASoC: tegra: Update AHUB driver for Tegra234

Sameer Pujar (4):
  dt-bindings: Add Tegra234 APE support
  dt-bindings: Document Tegra234 APE support
  arm64: tegra: Add audio devices on Tegra234
  arm64: tegra: APE sound card for Jetson AGX Orin

 .../bindings/bus/nvidia,tegra210-aconnect.yaml     |    1 +
 .../bindings/dma/nvidia,tegra210-adma.yaml         |    4 +-
 .../bindings/interrupt-controller/arm,gic.yaml     |    1 +
 .../bindings/sound/nvidia,tegra186-dspk.yaml       |    4 +-
 .../bindings/sound/nvidia,tegra210-admaif.yaml     |    4 +-
 .../bindings/sound/nvidia,tegra210-adx.yaml        |    1 +
 .../bindings/sound/nvidia,tegra210-ahub.yaml       |    1 +
 .../bindings/sound/nvidia,tegra210-amx.yaml        |    3 +
 .../bindings/sound/nvidia,tegra210-dmic.yaml       |    1 +
 .../bindings/sound/nvidia,tegra210-i2s.yaml        |    1 +
 .../bindings/sound/nvidia,tegra210-mixer.yaml      |    1 +
 .../bindings/sound/nvidia,tegra210-mvc.yaml        |    1 +
 .../bindings/sound/nvidia,tegra210-sfc.yaml        |    1 +
 .../dts/nvidia/tegra234-p3737-0000+p3701-0000.dts  | 1781 ++++++++++++++++++++
 arch/arm64/boot/dts/nvidia/tegra234.dtsi           |  432 +++++
 include/dt-bindings/clock/tegra234-clock.h         |   72 +
 include/dt-bindings/memory/tegra234-mc.h           |    5 +
 include/dt-bindings/power/tegra234-powergate.h     |    1 +
 sound/soc/tegra/tegra210_ahub.c                    |  147 +-
 sound/soc/tegra/tegra210_ahub.h                    |    4 +-
 20 files changed, 2461 insertions(+), 5 deletions(-)

-- 
2.7.4

