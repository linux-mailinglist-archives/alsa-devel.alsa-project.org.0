Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 97BF0432F01
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Oct 2021 09:11:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 40BC116AA;
	Tue, 19 Oct 2021 09:10:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 40BC116AA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1634627481;
	bh=4sFrbpkBTykc3pAwGgP8DM2OTW40cNh5MaTLABIxq4Q=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=oj0gqGVQ/zU0RYlICTGj/485+04R6rL4M+xG/bjrw4+CAkq/Ty+Eh9FXJeshZJhxW
	 3fcixzanGp5stCWLHg22UAWALhBl85IBKp8xIU9F3HOb6RLT1F6z5UzXSAUx1wVwEv
	 ixULyAur5k9mPlx06oQ48bJRu9cADZD5VWLMLYas=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A2DEAF80082;
	Tue, 19 Oct 2021 09:10:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E0927F80256; Tue, 19 Oct 2021 09:10:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2040.outbound.protection.outlook.com [40.107.244.40])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1061CF80082
 for <alsa-devel@alsa-project.org>; Tue, 19 Oct 2021 09:09:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1061CF80082
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com
 header.b="EhN9YtLw"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YHXnJ4EZZL03rKGLbdEJ1tp0zLBf9o7zWHyTDKjgWYgRPOZYcqpKkPYkA4+VjvfdizlHDbzwgf9Gwwp1/IYhSrHMaUFm30ggQduYW83gVtYbd9/+RLd7QcbmfJezFs2j5ZVl8QNPQz/lTyiU6JSwV+KwaggIFj5JE60spLtE3BGPVUcPOoS8kP28ETv4c8HbcZLE2z6ZO8DLWhDtp/ixOVEuQu0qqCesq/jC0CRsCAHtKOW76u0JNK43ZYkuzPVfk1KxY9FKGl2Y7R7Gy5efIz3/+pUBbV+1jnKfSrooeDTyC34b4Ke5suhtidt53bh67+ChPuEBoDMneMrr71treA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YgQgc2X8aBzmTjQ4wbg+1/oyt67BIYZBEkpvaEhhINM=;
 b=KwWw6kR0uBECIitayHAgiWwsQF18xxGx/q5yjTJ7VbMJ9f8TL/92Y7VvTeKBUu/eFrjTHCSeA00Zbnhx+IfoK/7Kr4sBJy5oPOkvV2+UK0yY8Td5TUonkenbhENXAPdgeB7HsD5nlYQgmPBtyBMdKElxzq7t0fSdNygR8v7OriUY9s5ukcwgs4njKlsmN48HOJM9fzHAAZQY7v+ALGpmAeSwDtpw3oUZSCtuxLdu24rPjAT1ORGcYlX2IMXvJbCG9Swah1wj3ML3M4idI2HSgy7zn78odVmA+QHuZILWt4qtuMimU/kqQZlGlZ0jPOMyZke5A54BNPKldUlf7+RIHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YgQgc2X8aBzmTjQ4wbg+1/oyt67BIYZBEkpvaEhhINM=;
 b=EhN9YtLw6oxPUQUV9g/MwwfP3ZHSdfCxhkmrU2bpZ8zyAD2NbrTmBOljOlq5405rGMLQ9G0Dc9rrFh151eDM4N9M6qVWxSD71AqujTknSwRFbjgFcARi6Sh/3ig4kGAS6WwdmEGofsWPxuz5nrVORkRiisXg5hlAE+Hmg035Fj0=
Received: from MW2PR2101CA0018.namprd21.prod.outlook.com (2603:10b6:302:1::31)
 by DM6PR12MB3579.namprd12.prod.outlook.com (2603:10b6:5:11f::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.18; Tue, 19 Oct
 2021 07:09:48 +0000
Received: from CO1NAM11FT059.eop-nam11.prod.protection.outlook.com
 (2603:10b6:302:1:cafe::3d) by MW2PR2101CA0018.outlook.office365.com
 (2603:10b6:302:1::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.1 via Frontend
 Transport; Tue, 19 Oct 2021 07:09:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com;
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1NAM11FT059.mail.protection.outlook.com (10.13.174.160) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4608.15 via Frontend Transport; Tue, 19 Oct 2021 07:09:47 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.15; Tue, 19 Oct
 2021 02:09:44 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.15; Tue, 19 Oct
 2021 02:09:43 -0500
Received: from chrome.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2308.15 via Frontend
 Transport; Tue, 19 Oct 2021 02:09:41 -0500
From: Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
Subject: [PATCH v4 0/8] ASoC: Add common modules support for ACP hw block
Date: Tue, 19 Oct 2021 12:39:30 +0530
Message-ID: <20211019070938.5076-1-AjitKumar.Pandey@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ea2821a3-ba91-49ca-cbdd-08d992cf6fc7
X-MS-TrafficTypeDiagnostic: DM6PR12MB3579:
X-Microsoft-Antispam-PRVS: <DM6PR12MB3579697D9397CD831597A8AB82BD9@DM6PR12MB3579.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3513;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Y/QI/FkibjbdtQs7Ylg17KapWBQRTNzuV1WINQ7ABgOKjOWy9Qk84pqRoOXcRnkQ4tbKY+djgf0dEe7zF+zpnApd5LcdcIhHGYxUqvrQC7TUXcM79RdriAW7SFmml86D+LHYS5I4k2pTnzXEj6NxT80iB4XyqlIMY3NvPLAGznhS3i93R7JxyDez5W/ffLHDUxmmS8cHHPpBLYFJvRkytgFu48Zf44AjIJaWgRHp2tdgp6JUre+Uu347Orvnht+uqeVGSDwoV8Bj6PbDIWm0iyA2UfMJK5FGffgInxM/YuUDy+6hDNq8fnm2mibd1hH74c2pgRNTK0krZ5R5a9IiMDNq5Rfk8R3PkMtjKkzlvc0KWJ3SvaToYfTDPtePfCj6veMJrQE9QcYzvh/IqurnJqHYE6Z50qCuYKzRy/oBVeQ0HF1658OG6go/oVYTGe9IM2vK7gFNQ4PxP7Gw0kaiKobOisoFzo/g9jALSuPazv1bboODOybulmvtqq65fcJsYeWbx7Rb1fIKrHtEz7SxZdLSU3rlX6muIVSaQRLRmCG6ELLG9N5/Kn3qV5qAZ7zyaW8jTpgPOvTJW6Zv9k0QhMguoT2wo3BL7Ri5akvkHHJuvMrx58Smj6Zzr62ThzUslPKVcmwZLq0hKCdWI4JoG5cUEyIo38U+gNFur+A2O6XvOU2tM3NDenDg+ARszr4E5VweqkJ/Gh7W2vN4v4sMkIiQXUDcLSkRo+kJQO0TbvQ=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(36840700001)(46966006)(356005)(81166007)(508600001)(316002)(336012)(26005)(2906002)(4326008)(8936002)(82310400003)(70206006)(5660300002)(8676002)(7696005)(54906003)(110136005)(36860700001)(86362001)(70586007)(47076005)(426003)(186003)(83380400001)(6666004)(1076003)(36756003)(2616005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2021 07:09:47.9337 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ea2821a3-ba91-49ca-cbdd-08d992cf6fc7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT059.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3579
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

changes since v3:
- rebase and fixes merge conflict.
- Fixed kernel autobot warning.


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

