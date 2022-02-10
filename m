Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E93664B06AE
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Feb 2022 07:52:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5B57617C1;
	Thu, 10 Feb 2022 07:51:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5B57617C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1644475944;
	bh=0VTzn7sGQ21RZmuce4gxVoNUO7Q8Ort0N4WJ7faOrws=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=FaouMXXtIUEDtuzkiaTD1uuYnb6PWL7NhwO6/KZ//UK652mtaJU++ILxkHKyFhd6z
	 da/rKGkMwphn1/2NtCA6cPjOTvGApTxpsl1mn3oUCY2tX3Wop1vyyGMrz44WU9vtu6
	 2tNDILlcWkJLjKrLuERAJzIA706V+JpeD3l7jM98=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DA303F80302;
	Thu, 10 Feb 2022 07:51:18 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B9410F8028B; Thu, 10 Feb 2022 07:51:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20615.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eae::615])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 173E9F8013D
 for <alsa-devel@alsa-project.org>; Thu, 10 Feb 2022 07:51:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 173E9F8013D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com
 header.b="l2omKSgk"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dL6Th4Fjj7oqwCr4sqOnljJJSxSp2J7cpoJ7+H6p5Jft8sLcEobBVmXy9kzIGhCK4zhOvvP9Qjw+Jph2+HMkG1qF8pi5LfGz7VXo58JKB3wUi2uBXUNWuMxefj0rXB6spdXxVX1OSb2GXSNlSrjldizelwVtcLnC826vfTdrK2O1+f/2WZOFsWNGjeN5IpIO8AlY9iJhfMYZ8jYzRLk2JTvwyEQt+wdu1e6VY1/J9Zb2oWph8Opb7IoaNbC3Z1qs5JaqjrWvg83jMLhBDVTYLztPTdnnG8Egn1suCTXjRsopIHXQmtG8ii3rRyScu7omLCG69EmJm1BEUIamU5M/ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oth4zHlmn8/i6IFuqYGar0qxlfg0OX/Apl8IGmIQ/6A=;
 b=k7Jq+NFW7k9w8D+8gjm2IyTUC9xIx5e1vz2QDTr4dDijpn2SPqj/XadzychPRnQlZpzfPHrAZ2LLJDIKAXn30/9gGlLVWpGhq9tyYZFhQ1gNgdkFsKqB1BPj+wP8Si9OYBgTh6OS5+1K8nAiOCtSZH0gyYUjeEFGUbQ+Z+jK9azSyk7qDIGyuqB0ndoKrfiDvGTExE5tWlzD5EWA4o3hQT0ybzcO3J4TTfKDfL+xTQFcvVdr6Lmbl170Sp5n7IktdQWdktfBvP/dZwuHneGfj9my663NU/CCxSTg7BrkTJNYH6p2svypkSsLVB2U09Kh52GUVznfDtneqCZVZrl6iQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.238) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oth4zHlmn8/i6IFuqYGar0qxlfg0OX/Apl8IGmIQ/6A=;
 b=l2omKSgkPATORscZHIdz560B30lISiz1l7Ry011BRcw2MGqQiwaqIExRgDxxF3ULJ1XAm1xb8a3IcBEYUsAnYSo/8WDfoqoRI1AhpRlqjlFWcrJef2x1SXByRF+SriEmLB1UlGe99iW6rVi832hs0kNoAwVKCw0rNHPyGVU4BlsZmZRTpXA6cXyURz9lgsxTFzi8YO1LhXR4YknON26jeJKcPzp8h1kW+8F22zyOv82gT6eRn2RoBwAwt7macCW8rAdHls406aqBQeMKo9ZkQ+PF21KZiS+iAdjhbuQdmBEJU22phswesakNtMTQQpDaxbKV3yNhYe2RcpS9FvP8bg==
Received: from MWHPR08CA0058.namprd08.prod.outlook.com (2603:10b6:300:c0::32)
 by DM6PR12MB4927.namprd12.prod.outlook.com (2603:10b6:5:20a::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12; Thu, 10 Feb
 2022 06:51:06 +0000
Received: from CO1NAM11FT030.eop-nam11.prod.protection.outlook.com
 (2603:10b6:300:c0:cafe::77) by MWHPR08CA0058.outlook.office365.com
 (2603:10b6:300:c0::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.12 via Frontend
 Transport; Thu, 10 Feb 2022 06:51:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.238)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.238 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.238; helo=mail.nvidia.com;
Received: from mail.nvidia.com (12.22.5.238) by
 CO1NAM11FT030.mail.protection.outlook.com (10.13.174.125) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4975.11 via Frontend Transport; Thu, 10 Feb 2022 06:51:06 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by DRHQMAIL105.nvidia.com
 (10.27.9.14) with Microsoft SMTP Server (TLS) id 15.0.1497.18;
 Thu, 10 Feb 2022 06:51:04 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.9; Wed, 9 Feb 2022
 22:51:03 -0800
Received: from mkumard.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server id 15.2.986.9 via Frontend
 Transport; Wed, 9 Feb 2022 22:51:00 -0800
From: Mohan Kumar <mkumard@nvidia.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>, <robh+dt@kernel.org>,
 <thierry.reding@gmail.com>, <tiwai@suse.com>, <jonathanh@nvidia.com>,
 <spujar@nvidia.com>
Subject: [PATCH v2 0/6] Add Tegra234 HDA support
Date: Thu, 10 Feb 2022 12:20:51 +0530
Message-ID: <20220210065057.13555-1-mkumard@nvidia.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9a690448-03c8-4b38-cdff-08d9ec61b623
X-MS-TrafficTypeDiagnostic: DM6PR12MB4927:EE_
X-Microsoft-Antispam-PRVS: <DM6PR12MB49278C44EF1C6C4AA762E839C12F9@DM6PR12MB4927.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4125;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: duy1AqUecKJYwznyVPJRen4wDy7i7qV3ntnQHfgGoE/dQTa94ga2z9S1NVjVZ3e/5Tbd4st8UTHthw089tyNxBSRIHJ4Jxof/IubrE3TncGVBYB4YvrSHape4GMakGTTSx3L5ELu/udo5ohtaNCWp2dl9uOqg049DpG5n6GgunC6AY9BZV/2iHxOlO4ghE+PwTMcpLmyYPyoJV48WIhZ2H4V77GYSUFKNfcLTOM0Wz+oT7SmIM0ehBdiGRa8b9yIQBWLlcBlOA9oCZL0eAvjjxorLLloq8AKUJK35Teepep0xK+PMmZEroeYNpNeXfQgECYDBe0CGXX8fMVlDLl9ft/XMGRFqDHvXiwneVprMr4I0DvyUL5ATAv9ldifcs2oalM09T8NYH5MjYMx3KqaPR1KbhWxRKOpjuMkHtSkllZbdGlPQfcG/ofAzHzHP2oLjJMkXfB7NngHSoZyfdRSY+E3BPZapxxzEkUD1zvnDspXh3rCcGXnBgHz4RtMLqT2lsG5t4wt1d2huOD4HZvcs3jiMmLvNlQjrY9JA3uS7RPJP28w7Im9NyaFzQT18K+e8lF6NZzGwFC2zjgOmEKJ0/JGFTi1yv4NkcLRPqz1nbWkEDnqUL8Y36vCEp5Ue1DhpOZ5TPXJjIL6nZi44MEzcWzJBIqPddbYkA7PljrE+GceYHxTU8JRLUiOc6CFVMDG7RxAxI9oPMDpjbB5grfO6eBULMCPy4S1v2+9PfQfLWs=
X-Forefront-Antispam-Report: CIP:12.22.5.238; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:mail.nvidia.com; PTR:InfoNoRecords; CAT:NONE;
 SFS:(13230001)(4636009)(36840700001)(40470700004)(46966006)(5660300002)(316002)(6636002)(4326008)(8676002)(8936002)(110136005)(508600001)(6666004)(7696005)(70206006)(70586007)(54906003)(86362001)(2906002)(186003)(426003)(40460700003)(47076005)(2616005)(1076003)(36860700001)(26005)(4744005)(336012)(82310400004)(36756003)(81166007)(107886003)(356005)(83380400001)(36900700001)(2101003);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2022 06:51:06.0168 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a690448-03c8-4b38-cdff-08d9ec61b623
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[12.22.5.238];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT030.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4927
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Mohan Kumar <mkumard@nvidia.com>
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

This series add the support for TEGRA234 HDA driver support

Mohan Kumar (6):
  ALSA: hda/tegra: Add Tegra234 hda driver support
  ALSA: hda/tegra: Hardcode GCAP ISS value on T234
  ALSA: hda/tegra: Update scratch reg. communication
  dt-bindings: Add HDA support for Tegra234
  dt-bindings: Document Tegra234 HDA support
  arm64: tegra: Add hda dts node for Tegra234

 .../bindings/sound/nvidia,tegra30-hda.yaml    |   3 +
 .../nvidia/tegra234-p3737-0000+p3701-0000.dts |   6 +
 arch/arm64/boot/dts/nvidia/tegra234.dtsi      |  18 +++
 include/dt-bindings/clock/tegra234-clock.h    |   4 +
 include/dt-bindings/memory/tegra234-mc.h      |   6 +
 .../dt-bindings/power/tegra234-powergate.h    |   9 ++
 include/dt-bindings/reset/tegra234-reset.h    |   2 +
 sound/pci/hda/hda_tegra.c                     |  33 ++++-
 sound/pci/hda/patch_hdmi.c                    | 118 ++++++++++++++----
 9 files changed, 175 insertions(+), 24 deletions(-)
 create mode 100644 include/dt-bindings/power/tegra234-powergate.h

-- 
2.17.1

