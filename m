Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 06358704A95
	for <lists+alsa-devel@lfdr.de>; Tue, 16 May 2023 12:31:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DC8F210E;
	Tue, 16 May 2023 12:30:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DC8F210E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684233100;
	bh=uDkiqEiqy4g2HEMH3em1mNL5lqTkfZtjO23Ym4HJDJ4=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=nDQpQjKcXfdALlLDwzV3Txr/EU80+UIELJM7Y7fxX0OTJjU6oWR/LIzhTeKUu4m6N
	 UG5dzOQvl+C/r8pao24vL49wDdQLex7vJwwnQ9zppaHX5N31/Ikaen0/+OXXkJ9Y/r
	 3VuzhMdMsF4Zrz0eGjYQbcXUOAUz54MI7ZJ/mMvE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2E33BF80544; Tue, 16 May 2023 12:30:50 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6A36EF8025A;
	Tue, 16 May 2023 12:30:49 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 19B1AF80272; Tue, 16 May 2023 12:30:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2060f.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7ea9::60f])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 01D01F80087
	for <alsa-devel@alsa-project.org>; Tue, 16 May 2023 12:30:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 01D01F80087
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=fLyu1O7a
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YRoUuxRI7Eob9x8ZhNIKX6Uzn+yDRBEiP07wsMsto5sh8UrsHDTP5Z6jUbanPkr9BljtFDJMO1Q7a+MZE0ZMLorbGYssq0oO0kx8VN13Fq0K1+HXd+ez/8RxgzSFSriVwOiSy/D3/2bHGSGxwFczU5PjvvidlTQBsF1qZw2/epb8QgSIfNexyD8yEqoustmzHnoBx0nc5bsanHgxIByY4W2Y9DC4GhDT1KNcDovHetkD7WGl5m8ep6cyg8PWF8QstXan26EourQoHkxtZkY57wJZaOlo/KL1qBGI0i51YAtJLvEtKtfzCG9TEBtSopg4DyEu5XpQ/2wfxMDJwkBlMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xHBHPmR/j3EYspsRQnM4IoP40fWXMiJiYhLUzeiY5lc=;
 b=k0+gDAM4vcxIcyy3CDrQaBC+xCQGri7igRYT/kPRAwwVyOJhlJi8I1y2i3H9Ne2TRng0jSD6PJ1Eq5lAUC9yEetUF4WMj5Na0zZRZfZ5ckRhH2mC+h8xb7bv01CI6Q5lGLc/UuwDP6FB2xsOIHfB3HkOfUHaQK2xS/+I9CMH02l7KB5cXkZFuV8M17y9KRixgdfZpz96StfU9bPORiAH2XU3WJBpaz+aEzmc/lBEYaHfc4KIjHAcOgVxrZbY5RVrKEhTXm2OTdtRVMZVXz4QGcfbNYJrdzk+9RAdX9VNH80PCK6q1+RrOQ51+cGPG00EN3OFaHTbiIjyTmV8DZfZNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xHBHPmR/j3EYspsRQnM4IoP40fWXMiJiYhLUzeiY5lc=;
 b=fLyu1O7aQWwuayg/0ST71Hpsa1225aI4QKd2GeDzGi4JbsVy87/Yr3mMx+TN6wm5ITtLC/qU/UbbsGoO0jHyNv86hZw/etw+DwIRWEWrBuKc+DHyM/8s2XirBfHVmkgOKNo+QCjHgluewrZOID6iipTJjPYhwUoZ4TLMNAGvlkw=
Received: from DS7PR05CA0065.namprd05.prod.outlook.com (2603:10b6:8:57::10) by
 SN7PR12MB7347.namprd12.prod.outlook.com (2603:10b6:806:29a::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.29; Tue, 16 May
 2023 10:30:31 +0000
Received: from DM6NAM11FT010.eop-nam11.prod.protection.outlook.com
 (2603:10b6:8:57:cafe::43) by DS7PR05CA0065.outlook.office365.com
 (2603:10b6:8:57::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.15 via Frontend
 Transport; Tue, 16 May 2023 10:30:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DM6NAM11FT010.mail.protection.outlook.com (10.13.172.222) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6411.15 via Frontend Transport; Tue, 16 May 2023 10:30:31 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 16 May
 2023 05:30:30 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 16 May
 2023 05:30:30 -0500
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34
 via Frontend Transport; Tue, 16 May 2023 05:30:28 -0500
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <--to=broonie@kernel.org>
CC: <alsa-devel@alsa-project.org>, <Basavaraj.Hiregoudar@amd.com>,
	<Sunil-kumar.Dommati@amd.com>, <Mastan.Katragadda@amd.com>,
	<Arungopal.kondaveeti@amd.com>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Subject: [PATCH 0/9] ASoC: amd: ps: add soundwire support
Date: Tue, 16 May 2023 16:05:34 +0530
Message-ID: <20230516103543.2515097-1-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT010:EE_|SN7PR12MB7347:EE_
X-MS-Office365-Filtering-Correlation-Id: ddc604e5-c62c-4d0d-3430-08db55f89334
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	FDxR0tmt/F+XOhLRwUX7j/fl1xnas7+sDWCWefN5ve4rOnH/v9uDv8SDIoyAWqsyfJdW5lCsNZuqfGuEfDPLsficTCubLnQPZZU7IPXchTtGpODp35y/Pb0cRGPrOCgbOwmOmYjgy9/aoPltXn6B/HF1RLwUDK0Gb1O+trN801SOpp/pNkt4LErVKyeUuDObXf8R4UvSwFXuq3ia6X/sPSCAWqyxwoWpD8Yi6HzXPIie9KYgg5uukStFGHNliMiwipCiZXyDXtQwzDqNbUpA/cBd4rWNhHUgOcuJu5iO1+fZ8AlvxhT1xG2wMlaSGD4J2a56S/M1zxY30/+N2EH8YWG2atYTBStKWTs0LeQMsk3IiTIgzDlW/DPAVhOE6g6O5GRDNGvEb/Hy3VFNpSZCB65vhqqo92YWEESdfNkUf4xypslrfh6K4H1BNIUvvUgz8ZaZxl/rGCnDA556KMyzNeyI8wxwP9Kme6adKoTzg26W8RUD+lmle3PjC/hAwXPI8yqHVBOFOGp2bQqHAtrMQhXqgBcK1m2BlllHE/oADoyZK+x1UN8YVOpUgrezoIhDGsD6P71U2CYoRosy8DQAzbwP+Yby3+dL8/W4f2wl0LiimOVgfDwpFfsQg/xBpXoAmyJK6bIXMJhG9PsYNbFIqRyABSoCgNFfME8QZ7BHqedCZrkAGF3qLcKAyipoOiqxRJUEyRWk33o7amzL/BmOKVwDEsXREJ/+G7+unoif+fV0SfWSAb9HgkjnIHwq1Q/owUvvnUJnefpWzgskYHNx1A==
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(136003)(39860400002)(346002)(376002)(396003)(451199021)(46966006)(40470700004)(36840700001)(2906002)(36756003)(316002)(54906003)(4326008)(86362001)(70206006)(70586007)(7696005)(478600001)(40480700001)(8936002)(5660300002)(6666004)(82310400005)(8676002)(41300700001)(356005)(81166007)(82740400003)(2616005)(1076003)(36860700001)(26005)(186003)(47076005)(336012)(83380400001)(426003)(40460700003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2023 10:30:31.2198
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 ddc604e5-c62c-4d0d-3430-08db55f89334
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DM6NAM11FT010.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7347
Message-ID-Hash: ULNKBVVKSSDK6AZFESUWZYDDKMI6VBZH
X-Message-ID-Hash: ULNKBVVKSSDK6AZFESUWZYDDKMI6VBZH
X-MailFrom: Vijendar.Mukunda@amd.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ULNKBVVKSSDK6AZFESUWZYDDKMI6VBZH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This patch series add support for
	- Platform device creation for Soundwire Manager instances and
	  PDM controller.
	- Soundwire DMA driver.
	- Interrupt handling for Soundwire manager related interrupts,
	  Soundwire DMA interrupts and ACP error interrupts.
	- ACP PCI driver PM ops modification with respect to Soundwire
	  Power modes.

Vijendar Mukunda (9):
  ASoC: amd: ps: create platform devices based on acp config
  ASoC: amd: ps: handle soundwire interrupts in acp pci driver
  ASoC: amd: ps: add soundwire dma driver for ps platform
  ASoC: amd: ps: add soundwire dma driver dma ops
  ASoC: amd: ps: add support for Soundwire DMA interrupts
  ASoC: amd: ps: add pm ops support for soundwire dma driver
  ASoC: amd: ps: enable Soundwire DMA driver build
  ASoC: amd: update comments in Kconfig file
  ASoC: amd: ps: Add soundwire specific checks in pci driver in pm ops.

 sound/soc/amd/Kconfig         |   3 +-
 sound/soc/amd/ps/Makefile     |   2 +
 sound/soc/amd/ps/acp63.h      | 145 ++++++++-
 sound/soc/amd/ps/pci-ps.c     | 393 +++++++++++++++++++++--
 sound/soc/amd/ps/ps-sdw-dma.c | 574 ++++++++++++++++++++++++++++++++++
 5 files changed, 1095 insertions(+), 22 deletions(-)
 create mode 100644 sound/soc/amd/ps/ps-sdw-dma.c

-- 
2.34.1

