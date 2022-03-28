Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A8AC04E8DC4
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Mar 2022 08:07:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2800A167C;
	Mon, 28 Mar 2022 08:07:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2800A167C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1648447675;
	bh=lEYTeL8gHVtRiQ7k+ZYp/xITaM7vbo06JX2aOGJB9qQ=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=JTcxag20hMlCZ3a2KWEyl6y23PG/eL5dsflzxjeuWakis5OmXJARfZHhb1iLZ72WL
	 I7g+fPYj3UtD5Y6pRHnLtQyuJ4gebHdDZbCByuKn0DKKLVTlkWNm5fpEg7Y7fRDyfD
	 7Vf5JhGlU+PZcLeqlV0tLxPTjglM3ykR1u+BqYeA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B6E00F8026D;
	Mon, 28 Mar 2022 08:06:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ABABDF8024C; Mon, 28 Mar 2022 08:06:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2060f.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e88::60f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AF934F800FA
 for <alsa-devel@alsa-project.org>; Mon, 28 Mar 2022 08:06:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AF934F800FA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com
 header.b="ReJpCIP4"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nT+msugee54xuit38T1qQKuMSJp52fzxduShXmxyG92F4usjmCTEQ9rX1Pf7sttbo8eYhwaM2QuIvIYeIMSXL8G+qh+5vT91vTusF/fSgIOddyK/meVGlG6iOBfC5t44d2jbaVlf2k7kJlSli5QjTpdRd7PN7Ud5sJWiVBhgGpZKM01lvAm3C/5CuoOr4MH24GJ3JV5R29fgNPWJw6YZvvrQJqZINEFGHxcLIbuE/n9GhuqjIgaCTGalkUFvpj0cSOO3kgRby71m2dJBLRjXKr3tLFHSFI5LHIlYJpKYjycneP1ven7gKVLVphh7/xdJJQNJIiuBXKe5aHXSWOWMxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P3Qk2dcmIUic+9bI5CbWKCknomCIIayBzyGqF4eG4pU=;
 b=AI7QftPIUXerBeVwTdXEYmXAgIEfgIj7CTGSuPtsf4ulimzoG9XRBE7NYhxlNlGIBXW7MxBfF/GKsUzF0zzwFiv3M1zG1+kgBTL2je29Ppe3URQKtHAz+qXFpZE6589+4hjED/DblZMo83mhxMYsfeiwSQ033cK6+sK1qL4LC26+dmkh1WFxZdM83OQNvUiWqBanXFKXCCjNMCZyl0Vr/ea/ka143QunAPJL/ZnbIPQC78+Juebnl1PtfYIq7T1+OuZyZ59iO53Kw2+dPMgngIpaJLmEjMidCba8CWEj+pLrqbVEIs34mbv9AJ9BzEfW5FSgl7kjhLe5S20vJfyapw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.236) smtp.rcpttodomain=alsa-project.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P3Qk2dcmIUic+9bI5CbWKCknomCIIayBzyGqF4eG4pU=;
 b=ReJpCIP44VvTJ1Kfwd/C/EE94af0D2jWzjrpPuor3SORPXGJYetjryH2LnuLJvGQwgMBGPAWJX95iDMs/AqqmeFyB0FAbK7vMO9J/QOazvC6p7tN6g3OVO/3XIBi1WF6qGqgUZ9zNibcra+5dUlNky0L19X01vsSXhdbbtkiV3ded38AAD7tVGWP1bbebcPP9wYxbGRO7URZA5VJo9jLp/TQcRTk0cXzzSI/60RnpMOnCC6Cc+eFiUGa7GEpi+zn7+BOdSmAjuVeiKnhJ545qxBUcJYL3GZ3rkkvLqgwk3UW6TEhLsYYSD2bniLXrfeDlKDfS8GYZjLqFLquc34PXg==
Received: from DM6PR03CA0097.namprd03.prod.outlook.com (2603:10b6:5:333::30)
 by MW3PR12MB4540.namprd12.prod.outlook.com (2603:10b6:303:52::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.18; Mon, 28 Mar
 2022 06:06:38 +0000
Received: from DM6NAM11FT051.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:333:cafe::78) by DM6PR03CA0097.outlook.office365.com
 (2603:10b6:5:333::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.18 via Frontend
 Transport; Mon, 28 Mar 2022 06:06:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.236)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.236 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.236; helo=mail.nvidia.com;
Received: from mail.nvidia.com (12.22.5.236) by
 DM6NAM11FT051.mail.protection.outlook.com (10.13.172.243) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.5102.17 via Frontend Transport; Mon, 28 Mar 2022 06:06:36 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by DRHQMAIL109.nvidia.com
 (10.27.9.19) with Microsoft SMTP Server (TLS) id 15.0.1497.32;
 Mon, 28 Mar 2022 06:06:33 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Sun, 27 Mar
 2022 23:06:32 -0700
Received: from audio.nvidia.com (10.127.8.10) by mail.nvidia.com (10.129.68.7)
 with Microsoft SMTP Server id 15.2.986.22 via Frontend Transport;
 Sun, 27 Mar 2022 23:06:28 -0700
From: Sameer Pujar <spujar@nvidia.com>
To: <broonie@kernel.org>, <robh+dt@kernel.org>, <krzk+dt@kernel.org>,
 <thierry.reding@gmail.com>, <lgirdwood@gmail.com>, <perex@perex.cz>,
 <tiwai@suse.com>
Subject: [PATCH 0/6] ASRC support on Tegra186 and later
Date: Mon, 28 Mar 2022 11:35:20 +0530
Message-ID: <1648447526-14523-1-git-send-email-spujar@nvidia.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 922110df-9993-4f40-8625-08da10811e3b
X-MS-TrafficTypeDiagnostic: MW3PR12MB4540:EE_
X-Microsoft-Antispam-PRVS: <MW3PR12MB45400808FFFA53C13D66B9E4A71D9@MW3PR12MB4540.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wckt9ZGOWSq1s0QIpCAaKB+/gCfoiHEANc7s7VkxL8WXmQmKDq67ayoUVhRD1koFT7silH6jxHTaiZ6ZSAj0vd7trZPqDqykiPjdxNhqAtT63wg75+EfYV9maPY224q84rq5nViBwvmcOgMQ6nZr1KGghIqv9qnd/UKOMJFrGhJfj9o6OKShUZ41t+xOYWd60OYB2K/e2Lavu6Jvq80DKX2XOvPAAIDFHhO8SC3kr5Z7LmWJoRFNhiw7he26LXJBkS7PS77vrdAah+P0Jpq3YeMWO7L2vKA06F52oVUl46NssNMbGgG91gejyDqJeQ+zkgacgjxUDyZ/4snRkqXOukT6Jj0iqKiSUZ1JwdF8mTB2NfROjd1jxs+dOdSO1j8cOdOlckGkfuiHRiDbGS+03G7mGldJvwlzFqRo9ZzGf1zJliuuIgFUg6CrDcJSd00Xo8/Nz//p2uuX0Ir2hywS+Wl2UpcJgF0wil3B330cLkhGn/XHDN0kfcwUh3SWE/2jpDo91eJTIURtdnaJ/e2rZt55MruR9bmFqW95AGPU4qlYKPHjaiDbWSbn//yo199MpwYkarYuDymKt5M5P8DQinoxOegToza6j1PtJaCnkgOHW0f4OqksfnDvmfG/xW/Oj7z8jrfhboYlOQU/LAh4/wLbpEIGmzbYGLsWq4B4Fj2BFA8dO+7sT9goswyBybQe1C9VtQyinbF+8MD30aYm2g==
X-Forefront-Antispam-Report: CIP:12.22.5.236; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:mail.nvidia.com; PTR:InfoNoRecords; CAT:NONE;
 SFS:(13230001)(4636009)(36840700001)(46966006)(40470700004)(2906002)(8936002)(40460700003)(36756003)(36860700001)(7416002)(107886003)(70586007)(70206006)(8676002)(5660300002)(81166007)(356005)(4326008)(82310400004)(110136005)(7696005)(316002)(336012)(6666004)(426003)(47076005)(83380400001)(54906003)(508600001)(86362001)(186003)(26005)(2616005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2022 06:06:36.9139 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 922110df-9993-4f40-8625-08da10811e3b
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[12.22.5.236];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT051.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4540
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 catalin.marinas@arm.com, Sameer Pujar <spujar@nvidia.com>,
 linux-kernel@vger.kernel.org, jonathanh@nvidia.com,
 linux-tegra@vger.kernel.org, will@kernel.org,
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

This series adds support for Asynchronous Sample Rate Converter (ASRC)
module on Tegra186 and later generations of SoCs. ASRC is a client of
AHUB. The driver and DT support is added to make it work with Tegra
audio graph card. The module can be plugged into audio path using ALSA
mixer controls.

ASRC supports two modes of operation, where it gets the ratio info
from SW and ratio detector module. Presently the support is added for
SW mode.

Sameer Pujar (6):
  ASoC: tegra: Add binding doc for ASRC module
  ASoC: tegra: Add Tegra186 based ASRC driver
  ASoC: tegra: AHUB routes for ASRC module
  arm64: defconfig: Build Tegra ASRC module
  arm64: tegra: Add ASRC device on Tegra186 and later
  arm64: tegra: Enable ASRC on various platforms

 .../bindings/sound/nvidia,tegra186-asrc.yaml       |   81 ++
 .../bindings/sound/nvidia,tegra210-ahub.yaml       |    4 +
 arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts |  223 +++++
 arch/arm64/boot/dts/nvidia/tegra186.dtsi           |    7 +
 arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts |  223 +++++
 .../arm64/boot/dts/nvidia/tegra194-p3509-0000.dtsi |  223 +++++
 arch/arm64/boot/dts/nvidia/tegra194.dtsi           |    8 +
 .../dts/nvidia/tegra234-p3737-0000+p3701-0000.dts  |  223 +++++
 arch/arm64/boot/dts/nvidia/tegra234.dtsi           |    8 +
 arch/arm64/configs/defconfig                       |    1 +
 sound/soc/tegra/Kconfig                            |   12 +
 sound/soc/tegra/Makefile                           |    2 +
 sound/soc/tegra/tegra186_asrc.c                    | 1045 ++++++++++++++++++++
 sound/soc/tegra/tegra186_asrc.h                    |  113 +++
 sound/soc/tegra/tegra210_ahub.c                    |   82 +-
 15 files changed, 2254 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra186-asrc.yaml
 create mode 100644 sound/soc/tegra/tegra186_asrc.c
 create mode 100644 sound/soc/tegra/tegra186_asrc.h

-- 
2.7.4

