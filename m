Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 26480A5A2F2
	for <lists+alsa-devel@lfdr.de>; Mon, 10 Mar 2025 19:32:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3910A6068F;
	Mon, 10 Mar 2025 19:32:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3910A6068F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1741631577;
	bh=d9rL1tgVU+v5qETpcj/pcOwIbtyEWqbqavPJikse+do=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=GL0llZVH/fqw44HZAqmVmCw6Cq3TtP5A8MwKl1cxEE7qz81LrZRqBaH8YS/sUg2Rj
	 oJGXEYPe6GAffBWfnrZlUGPwCBuc1GdnA+4Q8WsgCNH3ahRk0upyQgYRVol5tfjoom
	 PqhU0T7SmM2I/ok5wiPGfjcWUExPbmDEQ4Ew4UAM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 51648F8051D; Mon, 10 Mar 2025 19:32:22 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3CBA7F80533;
	Mon, 10 Mar 2025 19:32:22 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 18443F800ED; Mon, 10 Mar 2025 19:32:17 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2060b.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2414::60b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E8741F800BD
	for <alsa-devel@alsa-project.org>; Mon, 10 Mar 2025 19:32:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E8741F800BD
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=bVqR7i0+
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dL6CPX7yT1TRZmYDKBbjT6GmHLnlW0AOmGJCjEyZKGpcvojY4rJcawAt9lQY5nchLXa5zfwhr9m05Um21IOTgNqQEPxmLvxh+hLDdqLXvOSiR9uhXsxDG9bGW4eFCtHm6Wn9ijMS+oCINeLKV7ERKwSdfXFhMg8Pou69I4uh+hhQK/hMu11Lk29m9UQcDwxSjaNEuAxGASI7CPT+whfTMcoINwzFJDgMSMR9XKQ6mUrtMlfOzJ2dApwQsq3nYZsBcFMPdMiuqURfkWMHOApuBMLA4afzfkl9hfSvGGSXakp6k0pFEi99/1gClorKBmj8Of8d22OhLI7SllUdfEK43A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AFKhqa4KcpkhHlSSpojhQHNlU6cdHaD+FtaTRK5GURg=;
 b=KrKANpQHG7pRsE+tJws5q1wqSURrLDpRIn1KC1ODJSULb0VNv69bt7B8VDy7mIA9z6aTffg14T3Kgll22/b9Y7bjy/c6rk8SjvVppNUbUs44CbaWzA4l8flc3o9My302XPQfsB3+4ZeehkDNVFbn7ChZMJr33euDDzOfdAZ+nynhwcJnRGpvJ3FO2WqEljwnDeNlue9sasQ9zjcrFi18tqsrnEY1ayRVyIB8eFl7ZZ8xroF06crgEehTLkJTR63clDgaziWjvduZbHuqSmdIMvbNeqW1ykTXRgbGyX5JscSbom32LZ8BKK9y0lBoFfs27q+ZA2HW4UOKhltncBkrMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AFKhqa4KcpkhHlSSpojhQHNlU6cdHaD+FtaTRK5GURg=;
 b=bVqR7i0+Dp8s7fRr0gPLd6MWIQyEWTxdpnaxt2zri0RKIInInKhPLOpztymVVoFyCQxPP5em+BYRrEKht6bafO8lobWimUaYWUM4qXQCoBPwyXmo30ieAbLHGCnZ5LnDvcj6xmAJOzfptnBwJQkfJfZUM/2606DF6xgc5/N8gTw=
Received: from BN0PR04CA0065.namprd04.prod.outlook.com (2603:10b6:408:ea::10)
 by IA0PR12MB8205.namprd12.prod.outlook.com (2603:10b6:208:400::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.26; Mon, 10 Mar
 2025 18:32:05 +0000
Received: from BL02EPF00021F68.namprd02.prod.outlook.com
 (2603:10b6:408:ea:cafe::27) by BN0PR04CA0065.outlook.office365.com
 (2603:10b6:408:ea::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8511.26 via Frontend Transport; Mon,
 10 Mar 2025 18:32:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL02EPF00021F68.mail.protection.outlook.com (10.167.249.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8534.20 via Frontend Transport; Mon, 10 Mar 2025 18:32:05 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 10 Mar
 2025 13:32:04 -0500
Received: from prasad-lnx-mach.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 10 Mar 2025 13:32:02 -0500
From: Venkata Prasad Potturu <venkataprasad.potturu@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
CC: <Mario.Limonciello@amd.com>, <Vijendar.Mukunda@amd.com>,
	<Basavaraj.Hiregoudar@amd.com>, <Sunil-kumar.Dommati@amd.com>,
	<ssabakar@amd.com>, Venkata Prasad Potturu <venkataprasad.potturu@amd.com>
Subject: [PATCH v2 00/14] Implement acp_common_hw_ops support for all acp
 platforms
Date: Tue, 11 Mar 2025 00:01:47 +0530
Message-ID: <20250310183201.11979-1-venkataprasad.potturu@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: venkataprasad.potturu@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00021F68:EE_|IA0PR12MB8205:EE_
X-MS-Office365-Filtering-Correlation-Id: 69eff607-38a0-4af5-ab76-08dd6001dbb1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?/Pp1plpc4Zc8Ep9F1Av8/gRRIqhLiV+exiATEBE+j0wZLM3iVJfuTZtBVUdo?=
 =?us-ascii?Q?BqyK/1nrXg1xRPpcGU7qSYqDkLhDzKyxwADDVqJfUCvzHIBsrz8M3x9iUruU?=
 =?us-ascii?Q?KdblDLQTyxiDMNabTz2R4Pz+1SnrOYs1FW2vZYARLTh+rk599pd54+jkNjqZ?=
 =?us-ascii?Q?SgBmsus85OR619n8xWbprUWFZd/xqoQi2Sdy/HFWbLM9RKTkyF09wG9wMvO6?=
 =?us-ascii?Q?cEPPxNwiU0nAsxhn8Z6f0h7bKQukoZ15bCwlkdV4wWyXDPuuExsP5TRISifY?=
 =?us-ascii?Q?9HN7Zcfyu/Dkmf/gYazeMy02ajvl/Q1UIJ+fnd2iOM0RKyzWZ+dcKuWv5Etg?=
 =?us-ascii?Q?gjhLjtXXbhITj3pzAnLZf5wkr2/htCFkqe48dRiROdgbaVKF8hLWyiF5FVRp?=
 =?us-ascii?Q?4Lr+IumXLKDB8cgVZhRpgSDPbJP+jcia0bW6jTgVXrqimUVXSqLfVSLhysEP?=
 =?us-ascii?Q?oQaDM8X8KagqpRGFvqL4eeuC+f/N2yQawD9BRIKJ6UbXDYtVcSrDZu/0JC9Q?=
 =?us-ascii?Q?JIiiMF0Iw9DR57jZLVnXCB77cvR9gsYOwcc6V7GVHSg0mXwwWdCpe65jfob9?=
 =?us-ascii?Q?4KCY+ovIWcMwFhErkFtcttl2c/pL9jmzjYKeXaPgInVYnR/RVKDPrUoZf4PT?=
 =?us-ascii?Q?rqVx6tDBWnNaa9Q9YNG14/F1zClkDausUncdTV2P4Ql0HJs9Kc9ck+Rqbs4b?=
 =?us-ascii?Q?6XUfuAp80jHLPBEnjFVL1xJ3VD0dIYiqZK2w7mioOxQTWRSlBqaWheAWsdJ9?=
 =?us-ascii?Q?zuGFBrMziYlDPX6BcA750uc1VToXGpg2XH3bXButza3JUqqhd2c9UZcF3JzY?=
 =?us-ascii?Q?wUhJxSo+8p4tzHBRRr+3KXrUSUoD6wSsG/Iy6vInK9D2/61zZzkCedu5DP0F?=
 =?us-ascii?Q?DKTi01kZkTOvs+Dc06e0GLgepb25iE7kDZiMxZTs4GfOL0HXKKd3JnzS2hog?=
 =?us-ascii?Q?XFpIgFMqysjYb+F8UT0FPzZ8sBXJPAjBra0TineUDxzuhZsoIoU1rf1bNia8?=
 =?us-ascii?Q?37pLcJMnbzmVoUFyZNZoHRovOCJ2nAndoGFGPEjGuxBkbFlUVUlPoxIbpA7C?=
 =?us-ascii?Q?PIoZGpmEtB39jSOjznSODAyjkw42zZ4nqE5gjUR6d6WE1X7xxT1ds1RKawX7?=
 =?us-ascii?Q?+w+f9Qfz49JpCrFFxm+/KdBd9HCjd6GExIuTMYTAOY585Je9TxTtvRShtIOK?=
 =?us-ascii?Q?9cYgnoPf2v6Uj38eja1gaAe1UlBX1dGMam5ewIVqvqOcOSAD3hSc/j2daCKp?=
 =?us-ascii?Q?nbf5DRC1lTDa0wnLWB1rn4pgeLw+Gs60kzgrwphuuk/g2nBv6lCmzZGfxJV8?=
 =?us-ascii?Q?nZ91eItgFUVCuZaNt/IRNcNtx4aETcE8TLAruvDWRZhaxGpq181LwuLQ31+b?=
 =?us-ascii?Q?EQZVE6AR3gtj2LSrgc0tYPG3gjf9ZwAZL5pAGxBEnwWDPbrgqRt6DKOZwdW+?=
 =?us-ascii?Q?ydRX9b04jAdkM9EGldyPijXd8IZkhr6ERrwqU8zTKPRkOCITh6ipaA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2025 18:32:05.3253
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 69eff607-38a0-4af5-ab76-08dd6001dbb1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL02EPF00021F68.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8205
Message-ID-Hash: GNBMD2YW3VBVSAPMF22VVQJWRW3WRTBI
X-Message-ID-Hash: GNBMD2YW3VBVSAPMF22VVQJWRW3WRTBI
X-MailFrom: venkataprasad.potturu@amd.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GNBMD2YW3VBVSAPMF22VVQJWRW3WRTBI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This patch series is to implement acp_common_hw_ops support and
refactor interrupt handler registration and interrupt handling.

Venkata Prasad Potturu (14):
  ASoC: amd: acp: Remove redundant acp70 chip->name
  ASoC: amd: acp: Implement acp_common_hw_ops support for acp platforms
  ASoC: amd: acp: Refactor dmic-codec platform device creation
  ASoC: amd: acp: Refactor acp platform device creation
  ASoC: amd: acp: Refactor acp machine select
  ASoC: amd: acp: Add new interrupt handle callbacks in
    acp_common_hw_ops
  ASoC: amd: acp: Remove redundant acp_dev_data structure
  ASoC: amd: acp: Move spin_lock and list initialization to acp-pci
    driver
  ASoC: amd: acp: Remove white line
  ASoC: amd: acp: Refactor acp70 platform resource structure
  ASoC: amd: acp: Refactor acp63 platform resource structure
  ASoC: amd: acp: Refactor rembrant platform resource structure
  ASoC: amd: acp: Refactor renoir platform resource structure
  ASoC: amd: acp: Fix for enabling DMIC on acp platforms via _DSD entry

 sound/soc/amd/acp/acp-i2s.c           | 185 +++++++++---------
 sound/soc/amd/acp/acp-legacy-common.c | 254 ++++++++++++++++++------
 sound/soc/amd/acp/acp-pci.c           | 210 ++++++++++++--------
 sound/soc/amd/acp/acp-pdm.c           |  53 +++--
 sound/soc/amd/acp/acp-platform.c      | 145 ++++----------
 sound/soc/amd/acp/acp-rembrandt.c     | 111 +++--------
 sound/soc/amd/acp/acp-renoir.c        | 110 ++---------
 sound/soc/amd/acp/acp63.c             |  94 +++------
 sound/soc/amd/acp/acp70.c             |  84 +++-----
 sound/soc/amd/acp/amd.h               | 270 +++++++++++++++++++++-----
 sound/soc/amd/acp/chip_offset_byte.h  |  12 +-
 11 files changed, 792 insertions(+), 736 deletions(-)

-- 
2.39.2

