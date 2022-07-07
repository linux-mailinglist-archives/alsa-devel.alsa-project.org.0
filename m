Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DAE4156A78D
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Jul 2022 18:11:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 81C0183A;
	Thu,  7 Jul 2022 18:10:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 81C0183A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657210297;
	bh=Vr++4Yp+MVN2f5AwwMKdSjI04EbSb4gdBlIaQME0kpw=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=XqRbixOytv0gOw6rp+87arIcII0uksfFYalsAxroIJcXhTckUXf+AA318OtcvNFec
	 DIRI5QBk67hUfFJMfFuTROp8YK9Ht9IhcITuC3dXQtz84nS7Dxv38oSGPo/eBHBjn3
	 UjOgRqIKU7kzNcZeNd7ovBkLRB34WV2GPmVoemH4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 063C9F8028D;
	Thu,  7 Jul 2022 18:10:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 60114F8016A; Thu,  7 Jul 2022 18:10:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2082.outbound.protection.outlook.com [40.107.243.82])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AF168F800DF
 for <alsa-devel@alsa-project.org>; Thu,  7 Jul 2022 18:10:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AF168F800DF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com
 header.b="Zjnj0Ovr"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SFkE50PM5R50kpRYKNUXrd21UGJweD1puTnK+yYIrhrGXtMJr7NLO40sN62boqPQUsfGae4TIoKBbDD8OQ0dCgaiyvfyq5/UHB0uqCla5Mqvv3U6D9TX5az5hACg/jPznZY8kFo51MAHmQqeXwCLUJ1sT3n7M0HNpgYt0WP0ARYqzfbcFnGU1/HnowglCu6WcZ8UXQ+cn7gYmHFgFlYPXucUGYRW78YsXgXLaCAc72M0ZXqw29Br9cADh3y0tZZJ/eazC0zFAE/WdgHQfUHDmN03+RK2nhw9i76jzWIHzE+z4SswTTe4C5Y9oVFNZGScWqr7KbRikvKNdKPdiLdEMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r4M97UsQT12ORzBdY9ZSLqbWX1JCEYWMiuInX42ZWZ4=;
 b=lAKGXcKD6GyZh4FP42YCfYkvLa+BE0ZvvFAkYP79k6oo1QP+1Kc6OYMZQLsKdevnE0/wwwUyHx6Wj1NhUu8SPJMqaEVhXnfb2Ckzmwx3edddwh4SKA1jPcc/nf4rO/ZJbB6T00UWittxohhcSwFIh1Oc2g1UEUfvZBaFYGcBoV9a752ZgJBlk7ujFMUuEQizWcSJroV5F0k174PrUSdnUoX33F2/YqT+yNfxCFH7S2VKn1/b4acSk/QwyzqKGWJc/Px7BMfeoXb2yMHaFy4aUauLT6se9H98QPAJAtRQEXEUuZyxVzzCx66e4XwT932EJtiAqtHWMosjvUU1osTt+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r4M97UsQT12ORzBdY9ZSLqbWX1JCEYWMiuInX42ZWZ4=;
 b=Zjnj0Ovr0TdTg774L3KKdl4H/1BDiPHRUeCeHmfjKJg+REUMvCAikFlDMRv8t6aXP2CEqOOy8NxE8FNQQedctK4vx91rmvXHrMk6H3/Q9sl61n1SzPq1/cghgPwpLlDHFzRdnpgGX74Pqr+l2exjlUpFZmAS3TSK4l/hLK1GTfU=
Received: from BN8PR04CA0022.namprd04.prod.outlook.com (2603:10b6:408:70::35)
 by MN2PR12MB3357.namprd12.prod.outlook.com (2603:10b6:208:d1::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.16; Thu, 7 Jul
 2022 16:10:24 +0000
Received: from BN8NAM11FT009.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:70:cafe::91) by BN8PR04CA0022.outlook.office365.com
 (2603:10b6:408:70::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.18 via Frontend
 Transport; Thu, 7 Jul 2022 16:10:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN8NAM11FT009.mail.protection.outlook.com (10.13.176.65) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5417.15 via Frontend Transport; Thu, 7 Jul 2022 16:10:23 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Thu, 7 Jul
 2022 11:10:22 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Thu, 7 Jul
 2022 09:10:22 -0700
Received: from sof-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.28
 via Frontend Transport; Thu, 7 Jul 2022 11:10:19 -0500
From: V sujith kumar Reddy <Vsujithkumar.Reddy@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
Subject: [PATCH v1 0/3]  ADD  legacy audio driver support for rembrandt
Date: Thu, 7 Jul 2022 21:41:39 +0530
Message-ID: <20220707161142.491034-1-Vsujithkumar.Reddy@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9bd8ad2d-1047-4318-4e73-08da603332df
X-MS-TrafficTypeDiagnostic: MN2PR12MB3357:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mTMJJJhsE8eZgDhPOzA3tyzneby5X0eO9DjqVDDydEYFUyvfPALEJG+OKs4TzWgdx8DGOMiEnk71Qi0HrdKB0PegYtTo214/m6PNcpQEb5Gv+0AMbIOHxJJ93/QTVJzxOcIibQDvZC9OtIeEeOYZNBCtV3SJ7cBbYV2E/yJp8FS4JJ5wq1BG2oYzT4Bxj/xJT1ln60fGEDLIhw6xyFHVmfF25nk60IULNL/XpfjiqxD82/BJgTTPceKfCxCQcg5BrEZ04x9MrGVh4viHXRgR//jyzmVkvOkDz9BC/HnsHxw8n8v1eF5n2ZmGGWiPWO3dyB0aRCnBcZ+EQ/mnofbTtOf+QnAiX6E+arzFZM3F1AaABo5GS7xVppaRch77Q+uNgJCwMkmGVEridjf0l2RMhJOBDzRcFpVE38sMG5eIFSenT/tjrQ4sNMX63e8fKv9xaAb7qIP8AKM1Qp8zknjZI6gNmdu29grhdJ05/pyTuF30y3EK5nTLrGzdLGoqVQlcNzX033ltZEKUBzTXf/H+SDAt3LvurV4sq/NOkb+QH7su5nFJv3XF4UsyMHTs0mD48pQ+ILKqKzEo1CRcIfTqGHvdQKGCr77ip0a4X1zGyWEzqqTIbQuCAviV6qA2B/w4GucQ8qggLLUWdiLj6wjRzeISBCZtK17rhirNYCRYf+3tYoe8KGzfDDzVX5SLudaWJ1cZ6aXQWuyEij0A1ylSBGGxV8bReK5FsvJfmOegyUDlZAQOfkGqASvdVLPHB6bAEDzwZlG+5SxnJ2zoyMqj91SfyKPTMJpO/qnmFhjuk86nHwjjJsVOtugL/VZwZ0meBGm1lZQaE5i1MXk1+a1cCnxQTqyQk0s2Rhz6sE1jQGetMuOTQua/XIV/ytfYS573
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230016)(4636009)(376002)(39860400002)(346002)(136003)(396003)(46966006)(36840700001)(40470700004)(82310400005)(6666004)(2906002)(186003)(1076003)(7696005)(47076005)(2616005)(110136005)(54906003)(86362001)(316002)(5660300002)(36756003)(36860700001)(81166007)(82740400003)(478600001)(34020700004)(83380400001)(26005)(4326008)(336012)(41300700001)(426003)(8936002)(40480700001)(70206006)(356005)(40460700003)(70586007)(8676002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2022 16:10:23.8815 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9bd8ad2d-1047-4318-4e73-08da603332df
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT009.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3357
Cc: Sunil-kumar.Dommati@amd.com, ssabakar@amd.com,
 venkataprasad.potturu@amd.com, Basavaraj.Hiregoudar@amd.com,
 Vijendar.Mukunda@amd.com, V sujith kumar Reddy <Vsujithkumar.Reddy@amd.com>
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

Add Generic driver to support multiple platform,
ADD HS control instance for Rembrandt platform.
Add nau8825,max98560 and rt5682s,rt1019 combination support for legacy
platform.

v0--->v1
-- Kconfig syntax changes done
-- robot errors done 
sound/soc/amd/acp/acp-rembrandt.c:264:5: warning: no previous prototype for 'rmb_acp_init' [-Wmissing-prototypes]
sound/soc/amd/acp/acp-rembrandt.c:264:5: warning: no previous prototype for 'rmb_acp_init' [-Wmissing-prototypes]



V sujith kumar Reddy (3):
  ASoC: amd: acp: Remove rt1019_1 codec conf from machine driver
  ASoC: amd: acp: ACP code generic to support newer platforms
  ASoC: amd: acp: Add legacy audio driver support for Rembrandt platform

 sound/soc/amd/acp/Kconfig            |  11 +
 sound/soc/amd/acp/Makefile           |   2 +
 sound/soc/amd/acp/acp-i2s.c          | 169 +++++++++++-
 sound/soc/amd/acp/acp-legacy-mach.c  |  32 +++
 sound/soc/amd/acp/acp-mach-common.c  | 104 +++++--
 sound/soc/amd/acp/acp-mach.h         |   6 +
 sound/soc/amd/acp/acp-pci.c          |   6 +
 sound/soc/amd/acp/acp-pdm.c          |   8 +-
 sound/soc/amd/acp/acp-platform.c     |  32 ++-
 sound/soc/amd/acp/acp-rembrandt.c    | 397 +++++++++++++++++++++++++++
 sound/soc/amd/acp/acp-renoir.c       |  38 ++-
 sound/soc/amd/acp/amd.h              |  86 +++++-
 sound/soc/amd/acp/chip_offset_byte.h |  40 ++-
 13 files changed, 862 insertions(+), 69 deletions(-)
 create mode 100644 sound/soc/amd/acp/acp-rembrandt.c

-- 
2.25.1

