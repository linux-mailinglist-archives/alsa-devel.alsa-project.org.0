Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2236D4BF849
	for <lists+alsa-devel@lfdr.de>; Tue, 22 Feb 2022 13:45:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9C3151888;
	Tue, 22 Feb 2022 13:44:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9C3151888
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645533925;
	bh=s5c69lG587Ln2iSt+RgnTzKZyJ6eIdt3Fb0X42YnrG4=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=c4HlfO7znRbf93aOsBbyT1LLeBqelQBcIr894EHNGpqGuWDbXKLX0WLdN/kl5TPUz
	 07E8+UwG/bV3KWQr/UUTd/RiBAPmQHF1jp+szVnT//BOpPYX2taHMn70diYmRfolBn
	 fNbPNZHIRPe8LH7g1nvMEq5wegREfiy1yVxG7J+Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E407BF801F5;
	Tue, 22 Feb 2022 13:44:18 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 03FD1F801EC; Tue, 22 Feb 2022 13:44:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20628.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe5a::628])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3FE71F800D1
 for <alsa-devel@alsa-project.org>; Tue, 22 Feb 2022 13:44:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3FE71F800D1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com
 header.b="T3cy4rKQ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=khonai3t3Im5So0+JPJWi5SVTu3EWlPRtSAAwXf6OlI6AvtXAyus7umEGLCnyxTAICzkutud9TZI0wXPGxtHO513m4+eP0oTIOcsurzBdLOjtziQX0X5/GsfeahufHwpkskyOcUWMx/8WQRLcQipyqMzoEx1xjgft/d62N/va+5dvC/H733MvLsBA3WZlmSvqWL3o3vdvcgjRebBC1XZk01aLUATM5G2fgSlMKKKQHhdKXgLUs3ElRcerxKD3H4LI/U6XLbgeOsuk4cPIgM4hDFvHcONTZPj7WEQu2GwlLvUBwJNmq+XKC6n80hLjRrupykcHPKNZ+Yai7g1qCcicQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FRxt24QHZd1gyYjz+V+Rioob25kCdDdnmCaRvO6j9BI=;
 b=jzflpK87LR0Xw8ISPIhoAoB2ZwDdR/1I5fQHnQ7DMqdTXQyttgE+lzXjqQKvwMedJ0ShqNW4GXxDgOTYOQBQW+R/FW/I7oHP7As6ytlKBLafrIW42brIGzHz7kMV67oJavolL4IYsdoLTCtUjwNBiJECyYrVt3HYvrHSh5ugCUJiObg2kEiZJnM7dNDQGkK7liVLv8tylA57uYda0tzf6o5FSpKjXtcZLbwcyd1CdIgF2Vi+IsZfXMILMKx5AH5eABDNNrErwDGnobPFzGj9K+G4mpBW0z9bPOd3QC+VWKiYft4pzyw0FLdlY197LwtDSUihs5GMj+a7N/sd2MJt5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FRxt24QHZd1gyYjz+V+Rioob25kCdDdnmCaRvO6j9BI=;
 b=T3cy4rKQm8ghyDDW4goHhee1kb+8p8A0+a8M5K4rj2NyJGeYSUSCGS+RD+h7md05T0+j1c4Fw8VBvNSoSAXnF9msNRhKzjZcTPSAPJEAaU4WA1v0gA3miWBM/O9TZ3fiRW0eS+R/Sw1Y4UP9VZJnrdKDNl9muehn5JG5n6TpdsE=
Received: from MWHPR20CA0012.namprd20.prod.outlook.com (2603:10b6:300:13d::22)
 by MN2PR12MB3213.namprd12.prod.outlook.com (2603:10b6:208:af::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.24; Tue, 22 Feb
 2022 12:44:05 +0000
Received: from CO1NAM11FT011.eop-nam11.prod.protection.outlook.com
 (2603:10b6:300:13d:cafe::e1) by MWHPR20CA0012.outlook.office365.com
 (2603:10b6:300:13d::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.17 via Frontend
 Transport; Tue, 22 Feb 2022 12:44:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT011.mail.protection.outlook.com (10.13.175.186) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4995.15 via Frontend Transport; Tue, 22 Feb 2022 12:44:04 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Tue, 22 Feb
 2022 06:44:03 -0600
Received: from chrome.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.18 via Frontend
 Transport; Tue, 22 Feb 2022 06:44:01 -0600
From: Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
Subject: [PATCH v2 0/3] ASoC: amd: acp: Add new machines and minor tweaks
Date: Tue, 22 Feb 2022 18:12:10 +0530
Message-ID: <20220222124213.721224-1-AjitKumar.Pandey@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e27c2d74-e65f-478b-c27f-08d9f601028a
X-MS-TrafficTypeDiagnostic: MN2PR12MB3213:EE_
X-Microsoft-Antispam-PRVS: <MN2PR12MB32132A54A8E3E7E35E76BCA2823B9@MN2PR12MB3213.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jbDYr/h6DOMIaKxRogSfmDYkBK3GF64Ha8EcG/7ezNr1fwORCHkE6uXImNyn3NK7d6DyKYfpbuqWTuyDt/S2g5Iil0qvO5qo/2X5B/MIvw3djQQBYbCJO4y2n1eRbZpXDzg5uNzf0tFwKoyriwB+6cHFVtbKUzhGmMzLHCciN571Tn+i0+l8Of13b52ed8GDXwKHoLFZobr0M6SOOlCjXlIpJmjCARjZKk04nf8TcJb/wBxHc38jd8xG4KBueJe81Q0lTAy/4nJRC+diNMqLW/zWXMe4sFvDrlrO8upgdorKVdTF88rIsbNfOuj01+bx/GbzSsObBId2WLC9OsfVZzm/c+c4bNbTAVf0ZSjDQyzvnbZRTQ8/kNhCXABTbNNbn5USTeCYbztlfnoJg2H4Jn9FdHEvo48hvDigAvvmD3upxtru3ogw4fu9X8HqY+41cA9U0xazvKulyDKUZu79kNr1x4mPBQYK/3IylYCOfyFp8M5/XGxuUVaO+L171pX2HQSD0rb4jrtPkt5PoyRHmSno7J+cYQxVVfzmmLCOJ2irpG1lj3y0s9z9IJ7TU3WnHOtF//4Sw32z7+IDTexHFWJhy0VKY0qigxzbSWsKRtY2K/JdBMN4Pdh5TcZfW3GMOBUkjM2H+AQx8Lw10Bjw8VmtQDp196ZpXe1P+7vqhA7dkdjwz8SntRQjJK+hLUBUQbAYHe/3sSTJgzh+e33Z7Q==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(36840700001)(40470700004)(46966006)(4326008)(426003)(83380400001)(336012)(82310400004)(70206006)(70586007)(110136005)(8676002)(54906003)(508600001)(316002)(4744005)(1076003)(8936002)(5660300002)(2616005)(36756003)(81166007)(2906002)(6666004)(356005)(40460700003)(86362001)(26005)(186003)(7696005)(36860700001)(47076005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2022 12:44:04.5965 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e27c2d74-e65f-478b-c27f-08d9f601028a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT011.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3213
Cc: Alexander.Deucher@amd.com, Basavaraj.Hiregoudar@amd.com,
 Sunil-kumar.Dommati@amd.com, Ajit Kumar
 Pandey <AjitKumar.Pandey@amd.com>, Vijendar.Mukunda@amd.com
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

changes since v1:
- Fixed error for undeclared variable.

Ajit Kumar Pandey (3):
  ASoC: amd: acp: Change card name for Guybrush Machine
  ASoC: amd: acp-legacy: Add legacy card support for new machines
  ASoC: amd: acp: Add DMIC machine driver ops

 sound/soc/amd/acp/acp-legacy-mach.c | 34 +++++++++++++++++++++++++++--
 sound/soc/amd/acp/acp-mach-common.c | 27 +++++++++++++++++++++++
 sound/soc/amd/acp/acp-renoir.c      | 19 +++++++++++++++-
 3 files changed, 77 insertions(+), 3 deletions(-)

-- 
2.25.1

