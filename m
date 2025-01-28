Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 58000A2047C
	for <lists+alsa-devel@lfdr.de>; Tue, 28 Jan 2025 07:37:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BCD41601B3;
	Tue, 28 Jan 2025 07:37:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BCD41601B3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1738046245;
	bh=QdwHLDInjnYKeJfhl3HyVPmfKkyA7yYSBi0zGc5g5dw=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=r4L+933CdcimCH/tMljuv1TrYQs0w5j1oaqFqOO1zSp5ZEdRcdqODB7LGV9TYFy7T
	 H9RMcGRNCzmkUxvW97hsMHAZg1yKg+gOuFnikalM4h67VHyKf4uoVbjJRr3sVq+3ui
	 CFcn1a6DXExvR9TvRjfFAYJfLGIwALFU4xtQdXpc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 28CDFF805AD; Tue, 28 Jan 2025 07:36:51 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DAF6FF805BA;
	Tue, 28 Jan 2025 07:36:51 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 75221F8025A; Tue, 28 Jan 2025 07:36:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20623.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2414::623])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 72D0BF800C8
	for <alsa-devel@alsa-project.org>; Tue, 28 Jan 2025 07:36:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 72D0BF800C8
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=NO2330/S
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jZxPQvt/aJJNDelWJUN55Lrzy5OeVsdd3U1JjgDy24vuZIS+I3hsIKCTSTytr6+rv6xfDhKd0lJ5JrsevYz41BDZ2bpC1j+oRIEYbOz6k9gAMliNlIetqoy+q/caKZeoKK5kiO+8i3Tt8GF6AKKkEddK9NF6eDijJ4xLDBfiqcV6Q/l3ULvlOeH0MqrjG9SzURwufvOD7GTuqPEBEnFC6bwITCp4+LXXOR6S7U86jjuR5YosshFYGCD05+ELY02JBt3Iq8nhpNZeB9WHwKp5vjS8poFy26JjhhZ4MG2+qVd3cvM7h537eA/PTGZs8Xc02wUOECKZI9vBW4Xf8vQXqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gryCGFVJ/63O3+D2eN4RzcgIqzqmzaTCTDijhKkpxVI=;
 b=ql2FAIp3yk9nyOamxvirPglx4zfJ3WP11ex8i8VBRikwHHhfTA/ntYF4IikFnxbh3ZHlGbEDb01jfmaLc5XTK1U44AykpBUdYwZzosHcSIf8X1C1dqYP/614W5vRQhgXidyTcalwRHgozgWRYfW2OVt/qeOGqlsIxmzNapgCtVoZERyzL2XB+dlk/wWCD7Lj5gEa9XWVN7g05Tv9tku3es+gN0mKdUmTFw/Emy04WtBD+m2swuPWwJ8cBk5O78BYhfiQiK6BwWLjUeJWCs+TSDbGSplf+qKw8/79pyENKVL33tTJ1yG0576mDXZzix+p/TNg/bjalRUC1CdSWXa/zA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gryCGFVJ/63O3+D2eN4RzcgIqzqmzaTCTDijhKkpxVI=;
 b=NO2330/SAuaFmIntBw0LFp7XCE1YGhcWGVynquTdIYarmXm+DFyIh7QQPQ/TAv6ZUyj/dxYFeQ0h9mrGrlljdvnV+Am4OK2waHuVj7i9W1/4pqD7GPF/zK5ByNWLoKWqK7Y5MfPWz5LfIYGmgOjsUMLrxZehwuOpc5i6z/HklPM=
Received: from BYAPR04CA0031.namprd04.prod.outlook.com (2603:10b6:a03:40::44)
 by SN7PR12MB6838.namprd12.prod.outlook.com (2603:10b6:806:266::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.22; Tue, 28 Jan
 2025 06:36:40 +0000
Received: from SJ1PEPF00001CDC.namprd05.prod.outlook.com
 (2603:10b6:a03:40:cafe::ab) by BYAPR04CA0031.outlook.office365.com
 (2603:10b6:a03:40::44) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8356.21 via Frontend Transport; Tue,
 28 Jan 2025 06:36:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF00001CDC.mail.protection.outlook.com (10.167.242.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8398.14 via Frontend Transport; Tue, 28 Jan 2025 06:36:40 +0000
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 28 Jan 2025 00:36:36 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <vkoul@kernel.org>
CC: <alsa-devel@alsa-project.org>, <yung-chuan.liao@linux.intel.com>,
	<pierre-louis.bossart@linux.dev>, <sanyog.r.kale@intel.com>,
	<Basavaraj.Hiregoudar@amd.com>, <Sunil-kumar.Dommati@amd.com>,
	<venkataprasad.potturu@amd.com>, <Mario.Limonciello@amd.com>,
	<linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Vijendar
 Mukunda" <Vijendar.Mukunda@amd.com>
Subject: [PATCH V3 0/6] soundwire: amd: code improvements and new platform
 support
Date: Tue, 28 Jan 2025 12:06:18 +0530
Message-ID: <20250128063624.1922470-1-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CDC:EE_|SN7PR12MB6838:EE_
X-MS-Office365-Filtering-Correlation-Id: e3e021d0-9f0e-47cf-fbbd-08dd3f661f98
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|36860700013|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?Zs1nrePTt+0OmoxgE9QDas+TuGxMX4LL9MFiG8xoeM7pGMoqCb1FD6vEW5/Z?=
 =?us-ascii?Q?KOL5P7DbpO3s/ALAIQ7lzTlji/5G1qv7DvcTlnJ20rSozRE+zJSqwbW3Ikxd?=
 =?us-ascii?Q?2mCstUlZ1QAtmiAPBc6/YGz1dmGGEV7TH3ESQSdFSWJnwD6kMIkSiR6xmQ+S?=
 =?us-ascii?Q?5TYlRzhd5/QXqIB0eOyOGSySl/STs0blOwLGyBlLdft896qJ4NG8ipb99ICf?=
 =?us-ascii?Q?id2basK5xJC2EFjnyUrppCwsNqplE4ur2MXpAE8iWhSxbGc4XQSYXsaI/2om?=
 =?us-ascii?Q?FvpHwTi8ptDnXpXPOm8fC0yI51rlQs1kUrGHshuQS0/qQCihB4pBvcqSmOPP?=
 =?us-ascii?Q?ryvBJDouzhiu6BQ7FhLoCUTxjK9rnX2obg6uEtRaisSEtKoFfZh5W8JdmYe1?=
 =?us-ascii?Q?2fJXfGnBCpRxWgDPhDBaPwf3ZvI2X4k50Wd7N3mGFv9Rep22jMvRofq0ISHM?=
 =?us-ascii?Q?pTn0erNdbBSc3dSmdDBZxsMMHf0JyHolUumJKURgWYJhhsFraN/Qmc9rcgGb?=
 =?us-ascii?Q?ggqdtEkpmX7ZeTCKzT6PX/hMdwKj7qqnG9d7miBjpkS1x1VSwukSDJ8tfAbm?=
 =?us-ascii?Q?C3j/ktUw5ehh3jI7jN1130tezSApqPC8U8baFdzCAo2NQq7k6Kp3Benj9Mjj?=
 =?us-ascii?Q?S1kAA0Gn5IRE092qqgWRxddb8Wz22L7MWeKy4ZuQKMWb9lfcPL/8Obpaq2i9?=
 =?us-ascii?Q?jmMPl5CMuIRffAxyJQOfWynhifP6qJQjK8g69RgxQ2HWYSirRcWIymBF4dQz?=
 =?us-ascii?Q?nyoaO5DmGXyyB0eikQkMSOGXl8RnCIJyDtnPjmTfzlV/yZoc63uB7GoopCR3?=
 =?us-ascii?Q?dOtBCBfTYuizKF5tcrGr5eCms+uvPtci6+RZhFegYENhwLMezQucrwp+2XBq?=
 =?us-ascii?Q?0A2fxpx9/vIYIh2k2tG6Io0lQT3YwJoSBPEt0r0nervQyqncclkRxyFz4KJA?=
 =?us-ascii?Q?tYhrOxTRHgBSe3s86URZX+2iU3ZQu7evVypPqGgkE4QBp7yC8Ncxbj18cuWp?=
 =?us-ascii?Q?Oh2wwEi9BgEv6Sa4+k4mp0ILAQ/twuFzQ/SIrq4PD3f5vj97ICUeYMkPm353?=
 =?us-ascii?Q?F+lER8BFLqHs+MLeuf0vCIFZ8zTleqYPYhqXqeshO66K8H4N9je6vAJhMNYD?=
 =?us-ascii?Q?TQO/pvEUT029Var75Zmvpfzoyy/7IHfPArN/YyDStYL7gIKgKJisjQ/Jg11O?=
 =?us-ascii?Q?/ol6sgRZwBLf62SvqCnjf+QAsPrN0grgJ1fbSl3QavyehCL+/jtblJy0ePjP?=
 =?us-ascii?Q?/kR7chXmvUtU2LvzojhKcK+f5fVEXWto6oDtNW4zeIIbbbNZ1lgEeINlq2Zi?=
 =?us-ascii?Q?lkYoFK3/uQ0RmDAXNOyGz70JL+buQBOmHwZNzmo0bsE97v5f3z2paWEZ7F0n?=
 =?us-ascii?Q?pSo5Kk/VcUCzLLrFfFyQ0Pq6gnBa4/IctrvFZNR+n/Vw4o14Vm1hjxe7x6x8?=
 =?us-ascii?Q?2LslKOMHaHj1gDU15tjIR5FS60Gv0vlXc9b/ftDoCbaNxWzoFfTlS6SFQuRv?=
 =?us-ascii?Q?KxSL742apsXC+FY=3D?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2025 06:36:40.4249
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 e3e021d0-9f0e-47cf-fbbd-08dd3f661f98
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ1PEPF00001CDC.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6838
Message-ID-Hash: 7WAH6OQXS2W263UKLIJFS5BYCOY3XFED
X-Message-ID-Hash: 7WAH6OQXS2W263UKLIJFS5BYCOY3XFED
X-MailFrom: Vijendar.Mukunda@amd.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7WAH6OQXS2W263UKLIJFS5BYCOY3XFED/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This patch series consists of code improvements and new platform support
for ACP7.0 & ACP7.1 platforms.

Changes since v2:
- Rebase the patch series after dropping the patch which adds conditional
  check for SoundWire manager device resume when wake event is asserted.

Changes since v1:
- Drop white line insertion in the code.
- Add a conditional check for SoundWire manager device resume when wake
  event is asserted.
- Add new patch to set ACP_PME_EN during runtime suspend sequence
- Split the existing implementation of host wake interrupt mask
  enablement and setting device power state in to two separate patches
  and refactor set device power state logic.
- Drop PME status clear logic.

Vijendar Mukunda (6):
  soundwire: amd: change the soundwire wake enable/disable sequence
  soundwire: amd: add debug log for soundwire wake event
  soundwire: amd: add support for ACP7.0 & ACP7.1 platforms
  soundwire: amd: set device power state during suspend/resume sequence
  soundwire: amd: set ACP_PME_EN during runtime suspend sequence
  soundwire: amd: add soundwire host wake interrupt enable/disable
    sequence

 drivers/soundwire/amd_manager.c   | 150 +++++++++++++++++++++++++++++-
 drivers/soundwire/amd_manager.h   |  26 ++++++
 include/linux/soundwire/sdw_amd.h |   2 +
 3 files changed, 173 insertions(+), 5 deletions(-)

-- 
2.34.1

