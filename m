Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 67E8645A499
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Nov 2021 15:09:37 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DD1611679;
	Tue, 23 Nov 2021 15:08:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DD1611679
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637676576;
	bh=iris50O4t4fktKMtyC9fnY22LVX/sVeivA1l+ZhRRwo=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=KWqTz3knLmIUuT+7H+zRQRrnfSWhyfeJ44+SsGIMhDywUvgRgc3mift250XYy0m+3
	 7x/YJyFBTKDTITTvge4Ms11PbowoTRtsnexVw6ALWFx+FP+8QTHyWR6ypVnAHTEI8W
	 fTA4Xtaa86QPUhZflLK5QDxd3eT/3OsSwzLrnPkk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4BE7DF800E7;
	Tue, 23 Nov 2021 15:08:18 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 820BDF804AB; Tue, 23 Nov 2021 15:08:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1anam02on2054.outbound.protection.outlook.com [40.107.96.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A7CC1F80430
 for <alsa-devel@alsa-project.org>; Tue, 23 Nov 2021 15:08:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A7CC1F80430
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com
 header.b="jeVq91+2"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e8M9uilgkOtTg9cUpPKHKuPc8KDTMl0hP1EYJtPoPS85vuYVVSYzgQrNVdKDW6GKkDDKXVPcNKkxYqOWzJ8H/e3pVJ5fzvuCFfG1rR94Kr0n5VIIb+MR/cvuei9aS/NWBXdbAzN2BwW1igG8uMosdza+CTLG2HNkr4r0ePbXoXWKDbFtKIy82nZRniTvQ8wvdDxfVTPUAnzu8auDpvxrKHBZsTcJ91A+cUzPbWhH95cKqlzwhibX/MN9NYExk+P74PBmFtoeq5c1tCh0/9E7yJSExGkUdaXsBBXUROPZGS7Zk3WfxZVanYCuvIUGDxDliR9XqKDtUsBJABYVQVgnaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3MpoRJ84As/I/N/Y6pGiFXefJbAU8u6V/tyoSmsdpZk=;
 b=ehsXMqVLJxb9OFsOLb5aBD3ZdQwMcFSSOm9bsL10rSgWDfcWT2TkRItap4tXmrrmN4GZKyhlj3cIGma1pJrs3L6N0kVKZo8zsgbE5KKCg0mtrFt3NCcb1xsd9OnW8gmiAQvtti0mbwIArVvx1pGrCQmD8XPyS/mKbNRpi+omai3ZiMavfbghweLzzmZeHSgr8pepZeF65xN0IGLpkZG9xoloP6bmKYF5zKIYGlMd6X5wncf7xeWmwjuFq8UcCFGhyzT/BsFyY9v7EkS5x2HflpMID6rBYCy7qve7/YlVR9BcBjWxA2JTU17b4diO9CclZ0cY1DjHwpLh/b8sBfcXzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.32) smtp.rcpttodomain=alsa-project.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3MpoRJ84As/I/N/Y6pGiFXefJbAU8u6V/tyoSmsdpZk=;
 b=jeVq91+2siVhTNgctDnpYazw1tXR+iiznrXNNzbnHz9MyUPyKnPU5PseH99RG3Gql9zYHV5i5aDnNEMPCNjzfZdZhswQxjRtSlcr7+tKsz9eh+J7TXfaUoYJ4D8lgvA4hjWpnECYx68dsraCQG7yOirfgduUONGWsfnHcQ7XeRv2Z4CRi9sRcv1KPOs0aPB2zeDRG/Tg6f24vLHBtm7N0rkJdd8M9zRQhrUyR+jvHUYTtJLI7xn6xFiqLxjwSIFHOMUAEN1SW+TMrCfE1jlsca0d4b+9MNoEfzqQrAZNrcs1WzlQ13Tv88laO+hpi9WP31Tmy/RtD80ntcHS76AGDA==
Received: from MW4P221CA0012.NAMP221.PROD.OUTLOOK.COM (2603:10b6:303:8b::17)
 by BYAPR12MB2663.namprd12.prod.outlook.com (2603:10b6:a03:72::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.22; Tue, 23 Nov
 2021 14:08:02 +0000
Received: from CO1NAM11FT057.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:8b:cafe::7) by MW4P221CA0012.outlook.office365.com
 (2603:10b6:303:8b::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.22 via Frontend
 Transport; Tue, 23 Nov 2021 14:08:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.32)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.32 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.32; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.32) by
 CO1NAM11FT057.mail.protection.outlook.com (10.13.174.205) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4713.20 via Frontend Transport; Tue, 23 Nov 2021 14:08:01 +0000
Received: from HQMAIL109.nvidia.com (172.20.187.15) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Tue, 23 Nov
 2021 06:07:59 -0800
Received: from audio.nvidia.com (172.20.187.6) by mail.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server id 15.0.1497.18 via Frontend
 Transport; Tue, 23 Nov 2021 06:07:57 -0800
From: Sameer Pujar <spujar@nvidia.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>, <perex@perex.cz>,
 <tiwai@suse.com>
Subject: [PATCH 0/6] Suspend related fixes on Tegra
Date: Tue, 23 Nov 2021 19:37:33 +0530
Message-ID: <1637676459-31191-1-git-send-email-spujar@nvidia.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e2054fef-8e9f-4534-9086-08d9ae8aa945
X-MS-TrafficTypeDiagnostic: BYAPR12MB2663:
X-Microsoft-Antispam-PRVS: <BYAPR12MB26638D63B8A1812FBF35E41EA7609@BYAPR12MB2663.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QA4i6xAlGcB9nN5uFnxlpwfsYptmogYKzcWKNB3VSmCYeCD4V5QeNQoprLfNze1UJHwfJSYL9xctB7uAWtgn9IeAql6D7CP9Ar+tU95ub2f7UwTHcI4uPUlivY6U800FtIvh/due210alwAtzETYXvKq8NvykCkvR/wrpLBPQpbB/9es3MCQKG7tM9PrOxINbZwxaL/skY+KyZVGIPXU3iZMoj8ndtMtrqH5m/FrZHgEKEzpVZ2D7ekbHu92tbMZ1kBsx1TOH8R41y92/Co5Kork5XIxMgHEMQW8jcGabWTKQ6TodRjaxRiHm2uJKquZsJa+m7b2nwun2CzzMZbfnVRqvQhsr7npBHGyK5KpR6kLQEoc/++XGzWwPfKRUOEfhV6/t7/qsrNpEL4S2QfIYgBFIoVqpOHLF4gKvGsPT2a5BPrJp5gFRe0IdTOfQkea5swWZhRcampIdqThkC7v8oSrb4imEGaczSMkLN5MRkRR6kXFXP9ZuMr0YU6wnU91EYSsOLIsaZ7cXhPBRF8JBgbJYIqDcWZpFTddXHfV+VgM4zQqo/r9IF4hG1hYH20ijyxxyytrH01zU9utX0QtDmAEAwP0LTweNw9yztrLfg2BpHyhaMLFKJytxv1vGJhXfD+D3TeaqpJn4ti269WusBpGy8YlHc7fADqxrlMgucgC14fdNGTQp3hQ77z0aHR8vyOpeeV1wVEABoSgwP+Z9g==
X-Forefront-Antispam-Report: CIP:216.228.112.32; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:schybrid01.nvidia.com; CAT:NONE;
 SFS:(4636009)(36840700001)(46966006)(2616005)(5660300002)(15650500001)(47076005)(36860700001)(2906002)(8936002)(186003)(70206006)(7696005)(107886003)(316002)(110136005)(54906003)(8676002)(36756003)(336012)(426003)(7636003)(4326008)(6666004)(26005)(356005)(508600001)(4744005)(86362001)(83380400001)(82310400004)(70586007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2021 14:08:01.7054 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e2054fef-8e9f-4534-9086-08d9ae8aa945
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.112.32];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT057.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2663
Cc: alsa-devel@alsa-project.org, Sameer Pujar <spujar@nvidia.com>,
 linux-kernel@vger.kernel.org, jonathanh@nvidia.com, thierry.reding@gmail.com,
 linux-tegra@vger.kernel.org
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

This series addresses following problems:
 * The runtime PM is not balanced in MVC driver, whenever
   mute or volume mixer controls are set.
 * Some of the AHUB devices (SFC, MVC, Mixer, AMX and ADX)
   use late system sleep. Suspend failure is seen on Jetson
   TX2 platform.

Sameer Pujar (6):
  ASoC: tegra: Balance runtime PM count
  ASoC: tegra: Use normal system sleep for SFC
  ASoC: tegra: Use normal system sleep for MVC
  ASoC: tegra: Use normal system sleep for Mixer
  ASoC: tegra: Use normal system sleep for AMX
  ASoC: tegra: Use normal system sleep for ADX

 sound/soc/tegra/tegra210_adx.c   | 4 ++--
 sound/soc/tegra/tegra210_amx.c   | 4 ++--
 sound/soc/tegra/tegra210_mixer.c | 4 ++--
 sound/soc/tegra/tegra210_mvc.c   | 8 ++++----
 sound/soc/tegra/tegra210_sfc.c   | 4 ++--
 5 files changed, 12 insertions(+), 12 deletions(-)

-- 
2.7.4

