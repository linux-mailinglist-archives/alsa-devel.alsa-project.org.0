Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F1951429E7E
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Oct 2021 09:22:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8B98E168C;
	Tue, 12 Oct 2021 09:21:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8B98E168C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1634023323;
	bh=CRMg2lit3Uv9TbisULQUEiaq4/eGGVPAW1eeoH/wlLk=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=QngsYtINXNLPfXdlk87t3LtXhsotSxX6DSJr4yqk3fIgXHlYy07pQtM/f2HvvqywY
	 aiB2XU0Rr+ViWLsAxU2pmQtEtYUZX788ZFio56f5/F89GL1KDEZ/1KFtEflNhkvVZ9
	 dyigGW4tw3sexKKQ2GaHsbOfRXJf6kisdgCoH2TI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0BE69F800C0;
	Tue, 12 Oct 2021 09:20:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 35E1DF80212; Tue, 12 Oct 2021 09:20:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2088.outbound.protection.outlook.com [40.107.237.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A18D6F800C0
 for <alsa-devel@alsa-project.org>; Tue, 12 Oct 2021 09:20:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A18D6F800C0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com
 header.b="oq4StUsn"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Jtp1AwHmpyR9PvA7W0DJcAXql1gHCxaz332YV6PLCbwMs/qLSCcTqBTTxCHGQ9Bt4REi6eJNscjiOQ3Lixg09FdgAu0omX1CvbOAt5VQO2M7+CwlmIcdZj2BsLVQnzDJ1tYgA701UteO/aot94ZJt9JySqTViIZirHWfw9UW6h4IsW2pXJvKDpSdEszbybs5H3pA5ZSIRD43Ydw2YqYMhIJ5aJObDAhE34TBc/1uuVKVbo6Y1y6ub9poQ/tA8Uc8NF/d7/l2jb3IJOrOCAEXur+i2W7v6ohC6Kwy5n+Et7nCBus8sZ52mPVr0Ftf7A9bVoecIJYjDzNTGYEu04Kipg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/5NZ0993kG4N4otHK8gnokWX7SY6tTCdsbz0iBqWdDM=;
 b=ih+2uhehAxqUyM9+mO+RBQtez/EdHifXim4KEoUUe5Ds5GM0/R8yacNtPuw1MuDc0mqeYcC+NhQW4v4tmvlDM1q/OuMZ/0vTt6L3M2tJwOBk5C+rc0dgHB75I6L0llmAncOpajad88d1eOm2xRMa2TKTuGpBSRi4nhzhuHvqw53O49C45T44topq0OqfShIOYhrTOvZXkkXSeOhn3nKXYbRk+lZ2WOrfcfqzJPPegHu1yLUYXr0PcrqMGtEVymj06LQQX6vVm5/TtmSN9UDLq2j8QBgrkvVJINbbEC0htfMRAt5JkbaJnFbmm9CeT5qgLvXLcnIEcZvhkSDmU2GYHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/5NZ0993kG4N4otHK8gnokWX7SY6tTCdsbz0iBqWdDM=;
 b=oq4StUsn1Iac1cPro3FXQ3Ql+qMC3Dppa7y0ob6ScOo5Kd59+1M7O/dCSrdv3b0eBMHF/QvD8YQ3YdaJWRnEBkvQIFhxN+G7rJIoJsDylYrBa77jCbxGWQhKqpuKjRAlgMvCnXE2Lyzq64W9HdGVgdVdTvnWaBPXsh3XJPqZw1Y=
Received: from MWHPR11CA0027.namprd11.prod.outlook.com (2603:10b6:300:115::13)
 by SN6PR12MB2815.namprd12.prod.outlook.com (2603:10b6:805:78::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.22; Tue, 12 Oct
 2021 07:20:36 +0000
Received: from CO1NAM11FT037.eop-nam11.prod.protection.outlook.com
 (2603:10b6:300:115:cafe::f) by MWHPR11CA0027.outlook.office365.com
 (2603:10b6:300:115::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.18 via Frontend
 Transport; Tue, 12 Oct 2021 07:20:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com;
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1NAM11FT037.mail.protection.outlook.com (10.13.174.91) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4587.18 via Frontend Transport; Tue, 12 Oct 2021 07:20:36 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.8; Tue, 12 Oct
 2021 02:20:34 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.8; Tue, 12 Oct
 2021 02:20:34 -0500
Received: from chrome.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2308.8 via Frontend
 Transport; Tue, 12 Oct 2021 02:20:31 -0500
From: Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
Subject: [PATCH v3 0/8] ASoC: Add common modules support for ACP hw block
Date: Tue, 12 Oct 2021 12:49:31 +0530
Message-ID: <20211012071939.97002-1-AjitKumar.Pandey@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a5cefe04-b715-4878-b2d2-08d98d50c92a
X-MS-TrafficTypeDiagnostic: SN6PR12MB2815:
X-Microsoft-Antispam-PRVS: <SN6PR12MB2815E2DD08BF373194433DE382B69@SN6PR12MB2815.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3513;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JXcWdXJW94I8PmTBcxD7vt6NcaGRPck6Fd1agi0KoOzlgFJPkozodVMQ95OMEMr2EnOZcZynLiM3BV4OiIrrhf0+enYThM0mVYg8j8T1itqNn8qRfe6xn37XBWTlcaUvnXSxp8FsdEM0Fty1jxT7xdqkf5kCm9OZhweNPIqSSqVPmh8k02QZH/gFUgH8FVsKJnmDgxVtpzweeKVR6l0X88C+zqYxS1LIbkqepirFQVuDJFjmRoJqzp5p11ujwSDhIeOnqAm0hSRd+k8rboJ8LLCdnLjazBDFWAdVChlmhJqLHuKbWqeU1Gqc7gQikSsWaZvuAtPDph8LSJR2GTlV6G3E/uUaaFuI8SCyH8fvpCQHwo808l6nMrt6PClWShgzLRWQyIQLQOyHUM8noY7KebsVlRS3u+IU4SNgalYLX+BuJUCKYaWuHOQmos8e4wSUvlYE3A98nBMq2MUoV+v/8BcYQgVA13uAtn2F/7YQeCFsX7Q8YpWOt24jDzXOPqaY5YST7J5kXAEuQukDq340qKrk5+1ZipeJiNDBiZRmaKvdVLJd4VnRYOdI7bAsYDlHzbAOyYottvQt1O29YKwSTrNcE3pN+6pLvOPK9XS0OIv2QLjfFywOWwJf6XT6AbsQTpebjhb/5y8OdFxETeiyP1RNKEzNo23nopvQh833hXXlrzIT4cyQt+6/i0u3mbIH/lUd+nHcdeq2+75qSIqoaHuauyDa/QYmWzbiZZQXorE=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(46966006)(36840700001)(426003)(86362001)(1076003)(7696005)(5660300002)(8936002)(316002)(2616005)(70206006)(336012)(82310400003)(26005)(2906002)(54906003)(81166007)(186003)(36860700001)(8676002)(356005)(508600001)(4326008)(110136005)(36756003)(70586007)(47076005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2021 07:20:36.0085 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a5cefe04-b715-4878-b2d2-08d98d50c92a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT037.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB2815
Cc: Alexander.Deucher@amd.com, Basavaraj.Hiregoudar@amd.com,
 Sunil-kumar.Dommati@amd.com, Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>,
 Vijendar.Mukunda@amd.com
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

changes since v2:
- Fixes Kconfig description and indent.

Ajit Kumar Pandey (8):
  ASoC: amd: Add common framework to support I2S on ACP SOC
  ASoC: amd: acp: Add I2S support on Renoir platform
  ASoC: amd: acp: Add callback for machine driver on ACP
  ASoC: amd: acp: Add generic machine driver support for ACP cards
  ASoC: amd: acp: Add legacy sound card support for Chrome audio
  ASoC: amd: acp: Add SOF audio support on Chrome board
  ASoC: amd: acp: Add support for Maxim amplifier codec
  ASoC: amd: acp: Add support for RT5682-VS codec

 sound/soc/amd/Kconfig                |   2 +
 sound/soc/amd/Makefile               |   1 +
 sound/soc/amd/acp/Kconfig            |  51 +++
 sound/soc/amd/acp/Makefile           |  26 ++
 sound/soc/amd/acp/acp-i2s.c          | 340 +++++++++++++++
 sound/soc/amd/acp/acp-legacy-mach.c  | 104 +++++
 sound/soc/amd/acp/acp-mach-common.c  | 600 +++++++++++++++++++++++++++
 sound/soc/amd/acp/acp-mach.h         |  57 +++
 sound/soc/amd/acp/acp-platform.c     | 315 ++++++++++++++
 sound/soc/amd/acp/acp-renoir.c       | 144 +++++++
 sound/soc/amd/acp/acp-sof-mach.c     | 131 ++++++
 sound/soc/amd/acp/amd.h              | 146 +++++++
 sound/soc/amd/acp/chip_offset_byte.h |  76 ++++
 13 files changed, 1993 insertions(+)
 create mode 100644 sound/soc/amd/acp/Kconfig
 create mode 100644 sound/soc/amd/acp/Makefile
 create mode 100644 sound/soc/amd/acp/acp-i2s.c
 create mode 100644 sound/soc/amd/acp/acp-legacy-mach.c
 create mode 100644 sound/soc/amd/acp/acp-mach-common.c
 create mode 100644 sound/soc/amd/acp/acp-mach.h
 create mode 100644 sound/soc/amd/acp/acp-platform.c
 create mode 100644 sound/soc/amd/acp/acp-renoir.c
 create mode 100644 sound/soc/amd/acp/acp-sof-mach.c
 create mode 100644 sound/soc/amd/acp/amd.h
 create mode 100644 sound/soc/amd/acp/chip_offset_byte.h

-- 
2.25.1

