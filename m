Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 85EE36A4652
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Feb 2023 16:45:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 97A4F207;
	Mon, 27 Feb 2023 16:44:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 97A4F207
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1677512704;
	bh=2GGd6/SUyQMSy/mTm415Ujb6Rpxbrqwqh1C7TivwYXk=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=K33stbdPH7YPK8xbJG709rrAFtlmNg14os9jfHgorsXefN01nYJBm06gf0OcfQ3zL
	 N0XOJdrrC5ReXHJu9wPTDzt5Db6z/DCH/k0qSR0+rN+Koe/vZkYYF7jAz4VIX4u/i5
	 8+qkvbectavi1sFtaoF7oe8ktlQlo74od4c7FjRc=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B7BD5F8049C;
	Mon, 27 Feb 2023 16:44:11 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 61323F8049C; Mon, 27 Feb 2023 16:44:08 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2062f.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe59::62f])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D68AFF800BA
	for <alsa-devel@alsa-project.org>; Mon, 27 Feb 2023 16:44:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D68AFF800BA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=r9GI3D7k
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J870jXw3KH8rpAnzJ+3XvfKj3Cp9y6OKnfNFtOpGYWRdLgl5FHSPnvdtDS6nTcv0kEWVywKFcH92sj7/WNTjnLBFLbt74CJvyJLI881YQCTErFZlgty/8Lw5TlPsNW4G/dAUFulG75yVBTCi8RsZMjotB1WI9hBB7XQNCO7BAvh3KZ0xN9urbXIqW6AufnsdONad7wSIRYsAKaSNVQ70aamiSgCLH7gRyYxuDSdFV+3v42SSbOVVmy5K4s86WY9ayS7IfQ6ayj/jCKrhn2zhGnaULXWr4dOgjxCW3+oCBiEWW3PbXIbC11ZwZIOel5Pf6OT+k67f8p5jIGid78x1KA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aLs86Nu4IA6Vmn/0/CltTvZ6gz0c9pxaRHtYUwwtJ9U=;
 b=HYXoxrowUHIe77ZZr0EdqCCKPz2OiFI5n4pBQisKi06fypEFG/WLjJis8Xjx2eW5QqrYp36t688jW36gaj5wUIGJ5jbrH3IPx7qGOHos71nPj27iIpOUZyhYgLMtf401uO5Lo+SVCOzKUFCh1p2tTXWo7yg0B68MUX9RJCpch/Y9ZOt06MyPnwrW5ukBibm7LCKxxd68/lGNmm9P3ajmc7BCuQv+sBAfwRnEcbtnuLKos+S1jij1bPvxhjkErmHWn1HKFmwsBaQfLFM384fobWKCxBeMYWfMxtQnhcpzU+xwX0NwfqSnqrcqJ05V0Oqn2YXSko/k65q/Gl5h9mYqgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aLs86Nu4IA6Vmn/0/CltTvZ6gz0c9pxaRHtYUwwtJ9U=;
 b=r9GI3D7k/tzXjUaGZeRUMErsly3RX+K3Pd1LO/1inQZ3sXdxpUV6SR7axkeG49mOrNVgyleJDIeEaF9DtsUkc3yWUYTLNdV1xsAbDM0FN32k1uW3gYDHFsYZhk9VLDw6Qpysi50hHa7ObDFVGPYi0ViYw4G6qr0Y2/C0YlADrrc=
Received: from BN7PR06CA0048.namprd06.prod.outlook.com (2603:10b6:408:34::25)
 by PH7PR12MB5853.namprd12.prod.outlook.com (2603:10b6:510:1d4::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.29; Mon, 27 Feb
 2023 15:43:58 +0000
Received: from BN8NAM11FT022.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:34:cafe::58) by BN7PR06CA0048.outlook.office365.com
 (2603:10b6:408:34::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.29 via Frontend
 Transport; Mon, 27 Feb 2023 15:43:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT022.mail.protection.outlook.com (10.13.176.112) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6156.16 via Frontend Transport; Mon, 27 Feb 2023 15:43:58 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 27 Feb
 2023 09:43:57 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 27 Feb
 2023 07:43:57 -0800
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34
 via Frontend Transport; Mon, 27 Feb 2023 09:43:54 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <vkoul@kernel.org>
Subject: [PATCH V4 0/8] Add SoundWire support for AMD platforms
Date: Mon, 27 Feb 2023 21:17:53 +0530
Message-ID: <20230227154801.50319-1-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT022:EE_|PH7PR12MB5853:EE_
X-MS-Office365-Filtering-Correlation-Id: ec053240-2182-4312-729d-08db18d970ce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	HJDIcWXcaUeSodbAQdnZl0CDaoE8unwMURVMWteLN2eDiGPrfnuj/eDXog1pYUGWgCy0n5T3PT4PqtO9VQsy7RJ9f2pAiNOZpe7bh6xj8e7tCC3e0Cf6wPT0Xl6oOWA1A5vHLJforzczL8WpvavSqgYsveoRxCCNrR4p3bvfFsgJ7wrpUHiNgVZ9tExlxPxJs861fyBH47aRnr0sbTjc19iFej+4ZSZ9K+ruTQTw/0Je6c5LcWppQpJ+BOez3WvWE1eWC11CpXSXGd96Dged5BgcAuR6iC4lNqNLcuki9ALEZ+Ao7LaCXYIYSwJKCRKKj1zlRFv2C1wXA4lk5KliRXD3YEsp/7t667qI66jTfLA7E7lFIuUKaTGjs+RVwsXFf1Ery0NKUkGAwc4ARUHSNo5aYt6GDlonOfdorsbjdMLv+G36ynH/99bnev+jvFE49ehHf1P+d6WgQzlc1K/xLm6G5LtBIL3bSBQf5UDwnl4WoDrc5o2UsB0fQZNyyI/M+LdTi8pAJlj3HppQ79e+m/UdK2kgzZMX8y/MHDRZrRyT7FPQD8uOYpn7noAFWRGobkutrOziJWQQBpKDSeCeVlGjK9MTmcIqW5I6PIlFS7jDBYcVt7w5HpSdqt5imHD7V8BM0UwIScvJixUGz/RdgtXIpDDLfd9v+DBcNozVSM0w0XQSrSIIU5gfRUjIiz1fJg5i8/m12Sk+NYxPD5bjUraTJmSHcEpYg3HlNXO0uKg=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230025)(4636009)(346002)(376002)(396003)(136003)(39860400002)(451199018)(36840700001)(46966006)(40470700004)(2616005)(36756003)(86362001)(54906003)(316002)(82310400005)(40460700003)(186003)(36860700001)(5660300002)(4326008)(8936002)(6916009)(70586007)(70206006)(8676002)(2906002)(41300700001)(1076003)(47076005)(478600001)(426003)(26005)(40480700001)(7696005)(336012)(81166007)(82740400003)(356005)(83380400001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2023 15:43:58.2136
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 ec053240-2182-4312-729d-08db18d970ce
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN8NAM11FT022.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5853
Message-ID-Hash: UWEBIDUDD6QPJKCN255SW4FXTIMFK4OO
X-Message-ID-Hash: UWEBIDUDD6QPJKCN255SW4FXTIMFK4OO
X-MailFrom: Vijendar.Mukunda@amd.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 Basavaraj.Hiregoudar@amd.com, Sunil-kumar.Dommati@amd.com,
 Mario.Limonciello@amd.com, amadeuszx.slawinski@linux.intel.com,
 Mastan.Katragadda@amd.com, Arungopal.kondaveeti@amd.com,
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UWEBIDUDD6QPJKCN255SW4FXTIMFK4OO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

ACP IP(v6.x) block has two SoundWire manager instance support.
This patchset adds support for AMD SoundWire manager driver.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>

changes since v3:
	- add usleep_range() in command/response implementation.
	- add usleep_range() in clock stop sequence.
	- modify usleep_range() values throughout the code.
	- remove unncessary debug statement from code.
	- update comment in probe() call.
	- fix timeout condition checks in the code.
	- drop "ret" variable in amd_disable_sdw_manager().

Changes since v2:
	- Remove useless variable initializations.
	- Add helper function to interpret peripheral status.
	- Move runtime pm sequence to probe_work workqueue.
	- Use string "SoundWire" instead of "soundwire" in code.
	- Update comments in interrupt handler and probe sequence.
	- Rename "sdw_lock" as "acp_sdw_lock".
	- Remove __func__ from dev_dbg statements.

Changes since v1:
	- Drop asoc tree based patches. will send asoc patches as a separate series.
	- Fixed double space errors.
	- Use dev instead of pci->dev.
	- Use SoundWire manager terminology.
	- Remove amd_sdw_compute_slave_ports() function and use exported
	  sdw_compute_slave_ports() function.
	- Remove unused variable "num_ports" from amd_manager structure.
	- Drop startup and shutdown dai callbacks.
	- Drop reset_page_addr callback. - Use relative address offset to program SoundWire manager
	  registers throughout the code.
	- Separate wake enable interrupt handling from slave status handling logic.
	- Use acp_mmio to program ACP common registers.
	- Use dai_runtime_array implementation in dai_ops.
	- Refactor port_ops callbacks.
	- Add comments in port_ops callbacks.
	- Add retry count logic in irq thread to address faulty case.
	- Add helper function to interpret command response.
	- Add generic bandwidth allocation dependency in Kconfig options.
	- Add comments for AMD SoundWire power modes.
	- Add missing timeout check in amd_init_sdw_manager callback.
	- Declare frameshape parameters in probe call.
	- Handle error case in clock stop sequence.
	- Add comments in pm_prepare and pm_ops callbacks.

Vijendar Mukunda (8):
  soundwire: export sdw_compute_slave_ports() function
  soundwire: amd: Add support for AMD Manager driver
  soundwire: amd: register SoundWire manager dai ops
  soundwire: amd: enable build for AMD SoundWire manager driver
  soundwire: amd: add SoundWire manager interrupt handling
  soundwire: amd: add runtime pm ops for AMD SoundWire manager driver
  soundwire: amd: handle SoundWire wake enable interrupt
  soundwire: amd: add pm_prepare callback and pm ops support

 drivers/soundwire/Kconfig                     |   10 +
 drivers/soundwire/Makefile                    |    4 +
 drivers/soundwire/amd_manager.c               | 1321 +++++++++++++++++
 drivers/soundwire/amd_manager.h               |  275 ++++
 drivers/soundwire/bus.h                       |    9 +
 .../soundwire/generic_bandwidth_allocation.c  |   12 +-
 include/linux/soundwire/sdw_amd.h             |  109 ++
 7 files changed, 1731 insertions(+), 9 deletions(-)
 create mode 100644 drivers/soundwire/amd_manager.c
 create mode 100644 drivers/soundwire/amd_manager.h
 create mode 100644 include/linux/soundwire/sdw_amd.h

-- 
2.34.1

