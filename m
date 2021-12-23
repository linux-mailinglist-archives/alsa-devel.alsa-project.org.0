Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2478D47E2BA
	for <lists+alsa-devel@lfdr.de>; Thu, 23 Dec 2021 12:55:55 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A988918FB;
	Thu, 23 Dec 2021 12:55:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A988918FB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1640260554;
	bh=cIZLBWrWiklUdsg3iqj0FvqzDmIkNcyO/nLbOmbMOuI=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=MulbmIxEQoAAVKVC19K6R670x9c/3HDHn9Xz6WbD56EupzQqzX+XwBR5PaGDlpwTQ
	 VfLlMfDYdfXskGstpll2HbvbcYCfA6Q/YezMSqEj64qp8z8hYyyTgyOA14ne7XsKJY
	 CC35lnmjFcsdfszU1RbsqTUNA08spVUSBdNMbBE8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D0CF4F80084;
	Thu, 23 Dec 2021 12:54:15 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2CB38F80153; Thu, 23 Dec 2021 12:54:14 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2082.outbound.protection.outlook.com [40.107.244.82])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E24C8F80084
 for <alsa-devel@alsa-project.org>; Thu, 23 Dec 2021 12:54:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E24C8F80084
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com
 header.b="AZcET4Vm"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H31/MfaovhuCehngHV1CQyZPLKYnL5yhw35B4L1hSFcem6nWYJJ9B5glbOqSKP3cUMOjVm7uIMRzj9DsTvb2x/PxKIcKFBfu4ggIb89qkupFYURNwPSlKu8tfGV23zg21vxI8d8+dHCbT6etSvUAGRc7sGp4n5+Jjc/I5lW9LRWRIRFVWg5Wjogt2NhK3I1zGzgOoSwX1EX8SSHXPFOlK0xj21jkeKMSlCqjhWLkvXjAGGf/ZqFoO7n9hYbLOnZCFJdxw1cMGJIrw+mK4MdfVKBNhRcqUFcx9M6B0ClR+VpniOFu2xT9iYeUeS437ik8lqlXDH0L92SUWTLMtfY30w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iJPyLUU8SP5A8yPIAj67nps/ttGW0BBWBsz4tCqzN8k=;
 b=oaMvYE3Uwk+1p/xbpYcDtExms0V+H2dv0eowUpzWoOyxbGOi0TN//hxSl8bcNzWAXvJQTsoeUI1pIobsyarWXmezhLlkMenMxJYJOp/oFF9iNALE3Nl7LOCUNtWXUGOEILRZBlCQb2Yv8rk+cz7EkonBf5l4GjfXgRf/2Z1HGN4X4XXW01PJvAb2PRZlXx0WlT6SOrouougo/1jQ5EQJzSk3NW5jATc/YyZx+/xgSq+bmAihLnErE8CLSvjx1Cd3AckipNwN9qtzdAiQPHV0c4fPzJldzUWjli93XA0MU1/OwomKWsewcXLG0tRlzjitnV3FC6Njv9Yk13bMx99ZbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.238) smtp.rcpttodomain=suse.com smtp.mailfrom=nvidia.com; dmarc=pass
 (p=reject sp=reject pct=100) action=none header.from=nvidia.com; dkim=none
 (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iJPyLUU8SP5A8yPIAj67nps/ttGW0BBWBsz4tCqzN8k=;
 b=AZcET4Vmvj8boltbagwgVOTSA82fMeG7R80w8j741RcAfbQ+Lf4/OPXbnkj+8O2P2D0GaIfi9RE63H8w6QN9SVZLBZzM4flx+q0fRKxpDg6ak5Kms93jvmdXphCjQXEHuGteEXYe5I8cPWFoahT58V2iA95mCZ2mo1RdmeiGLp6++3lqXYyU5RTuwcqhn++mp/mZXEjzO5vBUxP9pjQDCZttfWSnELNWWoIS35T74RKxpz45ujkqK0cO+h0HfQLIGzxmsflbhBtTUqvlHL1WS9yO5mPqPGUVWhrxAQX8oJyWTfWW5jDmv2Hv7rOyjRP33QxcbhFB06CK/jimpCg7ew==
Received: from MWHPR1701CA0024.namprd17.prod.outlook.com
 (2603:10b6:301:14::34) by CY4PR12MB1526.namprd12.prod.outlook.com
 (2603:10b6:910:4::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.17; Thu, 23 Dec
 2021 11:53:58 +0000
Received: from CO1NAM11FT029.eop-nam11.prod.protection.outlook.com
 (2603:10b6:301:14:cafe::e4) by MWHPR1701CA0024.outlook.office365.com
 (2603:10b6:301:14::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.18 via Frontend
 Transport; Thu, 23 Dec 2021 11:53:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.238)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.238 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.238; helo=mail.nvidia.com;
Received: from mail.nvidia.com (12.22.5.238) by
 CO1NAM11FT029.mail.protection.outlook.com (10.13.174.214) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4823.18 via Frontend Transport; Thu, 23 Dec 2021 11:53:58 +0000
Received: from HQMAIL105.nvidia.com (172.20.187.12) by DRHQMAIL105.nvidia.com
 (10.27.9.14) with Microsoft SMTP Server (TLS) id 15.0.1497.18;
 Thu, 23 Dec 2021 11:53:57 +0000
Received: from HQMAIL101.nvidia.com (172.20.187.10) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Thu, 23 Dec
 2021 11:53:57 +0000
Received: from audio.nvidia.com (172.20.187.6) by mail.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server id 15.0.1497.18 via Frontend
 Transport; Thu, 23 Dec 2021 11:53:54 +0000
From: Sameer Pujar <spujar@nvidia.com>
To: <tiwai@suse.com>, <broonie@kernel.org>, <lgirdwood@gmail.com>,
 <robh+dt@kernel.org>, <thierry.reding@gmail.com>, <perex@perex.cz>
Subject: [PATCH v4 0/3] Fix Tegra194 HDA regression
Date: Thu, 23 Dec 2021 17:23:48 +0530
Message-ID: <1640260431-11613-1-git-send-email-spujar@nvidia.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 48c37ca0-cea1-4dd7-5fd8-08d9c60ae769
X-MS-TrafficTypeDiagnostic: CY4PR12MB1526:EE_
X-Microsoft-Antispam-PRVS: <CY4PR12MB1526502079E9240B2D29F562A77E9@CY4PR12MB1526.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1265;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nO02WWS+qO1f81Pqb3KgrX2vcSO8F2VXOVKVpmYe49L0FhoGMXWyKkL3RySCDeFa5+IUK/ToTvoCSuj2wLCaBOAHtRWI3g7l7eLu+4IBcCaMCg+rKdSgUj2IiLzCqxLe1ejBM64bPFeDhKi9A5+hRMDA5fOx9JxtjFsdt9Y8DJH0VZl8Pr+fGpNtIbSU/1P/cW33w1b0HpJXPoIBiaTq7EQsQlVsFO33QdG8FNAl3lZrjfNfd9nyzIdTabAI6UyjNuQ9SicHf4/vagXyunoEge7HhUym4RN/mrCSRUpAFV8kMYKFqdAG0kdyVQfCrPiPJhlYUQFFv8ejHRpsVJskxX6scvGw9XlihDGtye7OrmE40wDh/A3AHAAsyL8zyR6+bDbMOir0BttEvnkf7uqIAcfDB4mPRCuQgWE4MRULRHV2wa8DJvspVXPMYCURfY7/s40pkYaE6Z+tQ0TwBFGorB/75LfnM0IniB27EiEB4K4FQ4VDK/ym6//51UVQzTbtMfaL3TJnsMmDwDBTSRX9h2TGi93C5repCk9AMUhDknTz9Ev3Y7qDWKXS/gsr9zbuF4ki3wfWVoHvD1lQTnjfzxpuA4Rum+E8Hh7K2O1YFsJG3HivrBT03Z6bG6xXDEFl3mCROx9TVb8PjVtVoEkHWNiOkD7/Ds2wj0xr2SBwQpuOh2Jvy2k/csD8nYKMUjTWRrHxcANn8a4fC8VG2qDbuFyj2uRq6YxGJRpkshtjuHCMU0Vu8lzdIgNuLo/NccNZ0ZpF8SCUo+KSZA9I5xPw6RuZIP8czUJF7csXzRXPPBU=
X-Forefront-Antispam-Report: CIP:12.22.5.238; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:mail.nvidia.com; PTR:InfoNoRecords; CAT:NONE;
 SFS:(4636009)(36840700001)(40470700002)(46966006)(86362001)(508600001)(54906003)(7416002)(4326008)(36860700001)(36756003)(186003)(83380400001)(26005)(107886003)(8936002)(7696005)(336012)(82310400004)(40460700001)(356005)(6666004)(110136005)(2906002)(47076005)(2616005)(8676002)(70586007)(81166007)(70206006)(316002)(5660300002)(426003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Dec 2021 11:53:58.2957 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 48c37ca0-cea1-4dd7-5fd8-08d9c60ae769
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[12.22.5.238];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT029.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1526
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Sameer Pujar <spujar@nvidia.com>, linux-kernel@vger.kernel.org,
 jonathanh@nvidia.com, linux-tegra@vger.kernel.org, digetx@gmail.com,
 mkumard@nvidia.com
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

HDA probe failure is observed on Tegra194 based platforms and this
happens due to reset failure. This series fixes the problem by
skipping the failing reset and DT bindings are updated accordingly.


Changelog
=========
 v3 -> v4:
 ---------
   * Rename SoC data variable in HDA driver patch.
   * Remove NULL check for compatible match data in HDA driver patch.
   * Drop "Depends-on" tag from commit message and add "Reviewed-by"
     tag from Dmitry.
   * Update binding doc patch as per comment from Rob.

 
 v2 -> v3:
 ---------
   * Use reset bulk APIs in HDA driver as suggested by Dmitry.


 v1 -> v2:
 ---------
   * Updated HDA driver patch to skip the failing reset instead of
     skipping resets in general for BPMP devices as per comment from
     Dmitry.
   * Used a better strucure name for SoC data as per comment from
     Thierry.
   * Dropped 'Fixes' tag in binding doc patch as per comment from
     Dmitry.

Sameer Pujar (3):
  ALSA: hda/tegra: Fix Tegra194 HDA reset failure
  dt-bindings: sound: tegra: Add minItems for resets
  arm64: tegra: Remove non existent Tegra194 reset

 .../bindings/sound/nvidia,tegra30-hda.yaml         |  2 +
 arch/arm64/boot/dts/nvidia/tegra194.dtsi           |  5 +--
 sound/pci/hda/hda_tegra.c                          | 43 +++++++++++++++++-----
 3 files changed, 38 insertions(+), 12 deletions(-)

-- 
2.7.4

