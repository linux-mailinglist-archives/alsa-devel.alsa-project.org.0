Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CEDBAA2BBE8
	for <lists+alsa-devel@lfdr.de>; Fri,  7 Feb 2025 07:59:46 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 568066028C;
	Fri,  7 Feb 2025 07:59:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 568066028C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1738911586;
	bh=uf9/Q66aywUUVLAkd9aQnPL0fmFXUeUHqCsl67EjP+o=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=lipx1SyBKQ6FPj+1ULAWIjslj6e6u8r0qS6cfVzxL/VEh0CcmjB8A4W2YJVe0y/5H
	 2Co8AGiS30ckZcjjYYZgbr1pR7rJNX2ADEo/yaFVQgOYyjAJVr5YhfeFd7mJMv2SVp
	 1NKt06Wq/ZPvWIgV5qKMc43DjNLfFxU+Hkd13crA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 17965F80538; Fri,  7 Feb 2025 07:59:11 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D3163F80246;
	Fri,  7 Feb 2025 07:59:11 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 62102F80246; Fri,  7 Feb 2025 07:59:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20614.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2416::614])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 37D88F8013D
	for <alsa-devel@alsa-project.org>; Fri,  7 Feb 2025 07:59:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 37D88F8013D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=zNgHyVHa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ckVRiDBMjIK92Z0ApXiv/JjFkuXcPXZ1Ztu+fHAddIGsS0mdn4r/GpVIi1SC5IQvKfsTN55rz2Rko5Ts4iq7VAkNsVVFInKaxGi66xYHl04kflAcGhrYQSPZZq7lN5wSJZRXsiPQpBdRjm5fIQ1I0qbBQYhh4oTDMm7O72IA3CQyli+D10ZFU/XO7iUdduk656CwsbCaTqUW4gihf1nwE6Y+5eMlt7bBH1xnNoqOS0W1SbeZvVXz4oshdb6kLjEkossJ9S6mwhHCx6Kux04l0XkFwTAsTxnE8Rb34hV2DRKOnjh/DS3SwQRuCx/rpimVZVcJY3O9vyU8RBHvT8RwkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cvkg6cy3l9FqkDe5IPByyUTW6OCeXeW10z+UJ2em9lY=;
 b=MBNR+FHIOFGzRw0biiLgySBEiLUHs+7DYfPgwbJoAFT2Oa2O7ddWhfI9+WkCn5G1Yx82pwObRs12fnCfQveTx5yOAvCHJeStey2MtalB1PM7Da5kyya118w7am9VptLdKz2/7EGKQpgHwH+YWZumo/yOAvuXjjcNjT77uKk8JmXUvXVCZo/syW92IH4a0egU792S3CRb0c3kAKp7gXF7xNLHoKklHNFxBlFUDD5DlZgROQ3ZjZ8B1VZG8vUV61HzMCGIK9To4gJGNsuCGWXENjiOF3bK/tau1Z+Zai/Mj8uvcNR1RUq+j7YSPQ2GURSzo8ANSpflDyFjVVlLF79YPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cvkg6cy3l9FqkDe5IPByyUTW6OCeXeW10z+UJ2em9lY=;
 b=zNgHyVHaGAvJEYjPRR2sYQHUMQoFIIod4+QpZDGxpfOAHymugdQy2hHxQ+ou1ZQIjLRWxlFpgPr5op6iKfqQTBD9cztRppXEVHhA0q6mJJXM86m+euqFz5jd6qyn5Q7nLIdGpAjMI6W8wBQDJm437AyUSfoWplVwYNmasGVEc8g=
Received: from MW4PR04CA0168.namprd04.prod.outlook.com (2603:10b6:303:85::23)
 by DM4PR12MB7501.namprd12.prod.outlook.com (2603:10b6:8:113::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.25; Fri, 7 Feb
 2025 06:58:59 +0000
Received: from CO1PEPF000042AD.namprd03.prod.outlook.com
 (2603:10b6:303:85:cafe::68) by MW4PR04CA0168.outlook.office365.com
 (2603:10b6:303:85::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8398.25 via Frontend Transport; Fri,
 7 Feb 2025 06:58:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000042AD.mail.protection.outlook.com (10.167.243.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8398.14 via Frontend Transport; Fri, 7 Feb 2025 06:58:59 +0000
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 7 Feb 2025 00:58:54 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <vkoul@kernel.org>
CC: <alsa-devel@alsa-project.org>, <yung-chuan.liao@linux.intel.com>,
	<pierre-louis.bossart@linux.dev>, <sanyog.r.kale@intel.com>,
	<Basavaraj.Hiregoudar@amd.com>, <Sunil-kumar.Dommati@amd.com>,
	<venkataprasad.potturu@amd.com>, <Mario.Limonciello@amd.com>,
	<linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Vijendar
 Mukunda" <Vijendar.Mukunda@amd.com>
Subject: [PATCH V4 0/6] soundwire: amd: code improvements and new platform
 support
Date: Fri, 7 Feb 2025 12:28:35 +0530
Message-ID: <20250207065841.4718-1-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000042AD:EE_|DM4PR12MB7501:EE_
X-MS-Office365-Filtering-Correlation-Id: 049635e9-32ec-4a61-a5b6-08dd4744e59a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|376014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?1YjST1ykcrO2D4JRMwpHSaRSJ3kO/9HlKwLzndn8n3UZbq9bZW8khIwjA4tz?=
 =?us-ascii?Q?/hv1i0mBGv2sMA2qaMz/IB0M/3tWJNJMQwpgfIkbRc0S3LnaN0/XNZJU5z2Y?=
 =?us-ascii?Q?wGZSzzwqWd/R0m90iIfNIVk7YAkn3xEIxvHc+/DMNgVoGKUwbnSBp/1rDCSR?=
 =?us-ascii?Q?c6EcxctrW1LujcxLzvNX1Bn8A/riXPvkeK5pgszatu71e46q9G5OdW+s+CKC?=
 =?us-ascii?Q?eC5Q3yFQYmvdYUOufXlF4f0ViHK81SzPqcns+pcUaIYScgOyf42jr0s0C6rH?=
 =?us-ascii?Q?byQ7lX0aacH8lPbwAxdxMiGd/tFUXMdrUJkZ0Pp3hi5BGN0W0rirLvCgoeNR?=
 =?us-ascii?Q?l8q0Xxqcqt+C8PXnqPxffZ94b7U4Z3vweGf3rybCWQLoJu7qG5DdWE2ZSX1V?=
 =?us-ascii?Q?Wns64NcLqFcH0qSb89QNYct4bUaQ8Rjml6cN5V2c0KBkEeWm1EPm/30CAwYG?=
 =?us-ascii?Q?59ePUTlbBdiYAz0rrJmU9hr7O5kO/PBmM64YdBzZLDlRO8zXdwb02SbX1b+p?=
 =?us-ascii?Q?Qs+aIEGyDhSrcFmVXM30naoxIl68uI+sroZvzFum9LiQAW+LtkGIkOIrsEBc?=
 =?us-ascii?Q?9McSbtw4HHjBTHi8+kFM8vSCm24o8iJiYhm1jJ7Lv+FwdueGME2dGdEPEAd0?=
 =?us-ascii?Q?bzVVTygj+kYX1YOJMEJ1+CWiJNEWBlLDLy0fCQBzhA/P/UkjOj43VeL7tDqn?=
 =?us-ascii?Q?kK6OyLaDtiS5Sd7jpvL238VMORFedypDmA0Yjeo6lxqQ9SRLmow4rKvVsTYZ?=
 =?us-ascii?Q?ivk2NTeCFkzRcv/vA5IcZTyN/5C8MLWkBr5CzDlzytMkxDUzqCXTRtibIkEa?=
 =?us-ascii?Q?QXrsq6YkDXfwqZB/yYzEJkPWSwCg4y6buttMRLDG7zTxDMIDKu4dnQUF17Mf?=
 =?us-ascii?Q?kqqIcuIRlFvUW+0mv3edhKks2kzZR9B6RGmTfAXaHmK5tLcRgizip6EVrE8n?=
 =?us-ascii?Q?3i/A3jkgK97JYNRaMV9q1peugqU0bg6Dv1l9NhQXKXeiNVCEhk/MWAN7TpNr?=
 =?us-ascii?Q?BR6vMp6GD/5IcnSgMZdw9vkL/lnRj0Qj8lLOrKddQFys59zHA0AJKkBLFAkm?=
 =?us-ascii?Q?CwGfmcL/f3u3Dk4bdllpz43u/XyCnJPb0AAZ6pO17um4TPmX7BPHscD1dsiA?=
 =?us-ascii?Q?BJVSi6n4g0Nr8OtNWJQ0AIT+x+Vqu345soym/Rwcs/xCeifi/NmVJcRg7sl+?=
 =?us-ascii?Q?EFCcVa/NUcnSXXfril3+Z4dwU9kxLKn6rFInB8kvVSH6msgHjMLggYOP/1G4?=
 =?us-ascii?Q?mTC7OcShnyR2F/udPXm9pbQDNJac4cQ/z4jJO50g9CvdttjuKlaoIUspKwNJ?=
 =?us-ascii?Q?wOU60ySvXAD5Q6hKQNimA1Zdi7YF56H/GtR8GrD+upEvmBWg42ZIczcmcrZC?=
 =?us-ascii?Q?xXQvBfldXnhGjcXKssluBs6cy3tPWh3E50OQ0Ty/kAV8mss04L/C/l2N6AMn?=
 =?us-ascii?Q?pPd0vHjIsgEqJg/+eDboAK9mzIBABC94AybBnGsy6xqoXDaC4JfPVWmd1k+p?=
 =?us-ascii?Q?vqzzUx4ExZi+AFU=3D?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2025 06:58:59.0537
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 049635e9-32ec-4a61-a5b6-08dd4744e59a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CO1PEPF000042AD.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7501
Message-ID-Hash: OTQSYKBTMAOSUBE2ALOKYCBRWV2TXOHJ
X-Message-ID-Hash: OTQSYKBTMAOSUBE2ALOKYCBRWV2TXOHJ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OTQSYKBTMAOSUBE2ALOKYCBRWV2TXOHJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This patch series consists of code improvements and new platform support
for ACP7.0 & ACP7.1 platforms.

Changes since v3:
- Remove extra white line in amd_sdw_manager_start() function.

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

 drivers/soundwire/amd_manager.c   | 149 +++++++++++++++++++++++++++++-
 drivers/soundwire/amd_manager.h   |  26 ++++++
 include/linux/soundwire/sdw_amd.h |   2 +
 3 files changed, 172 insertions(+), 5 deletions(-)

-- 
2.34.1

