Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 612F4984048
	for <lists+alsa-devel@lfdr.de>; Tue, 24 Sep 2024 10:20:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 70A2B852;
	Tue, 24 Sep 2024 10:20:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 70A2B852
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1727166010;
	bh=WoZ//LzD46lBX3xVBeZv41BR5SClA/vu0RttF9yZ5aU=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=pVBk3Zwexb91oPVCnHib0VfnSXZZhfaW1ykk3NAWUEPQfjcMs8nLyQpzCUbDZLasY
	 pJFFbwMuJz9Xj7Sg/2LWqiWYxBnMylfzBIbkX0t3DvW0VnrYzcL6muhJnJsKzfGpfh
	 a3jiTmGG4GL/1UFCJfWuglM2RZ9tFAK2G+JyLKp8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CF4DDF805D7; Tue, 24 Sep 2024 10:19:35 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DC688F805DF;
	Tue, 24 Sep 2024 10:19:34 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0FD0EF802DB; Tue, 24 Sep 2024 10:19:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20624.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2414::624])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 075D4F80007
	for <alsa-devel@alsa-project.org>; Tue, 24 Sep 2024 10:19:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 075D4F80007
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=qODOc5xl
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LXLoD5UJYOAPztcX8Hjs6rzQvHdsK6nCEKWmvKM7cv+6/26EiaUJXRSfComZljuXkDmSz/kImhgYr6AfeaZJ2eIgobDU+Q4UAFtGYb1D2IP03hSeNIkkWb4Zpz33j6yF5Gu4VoL8xCETh58+OC7WBhDPCR1OQvgtgYfVE95xWOWG8yTzmWoBUy/DcgQNB6WE5QwobMxG48mpAArn8oN1emlTYUVzevUkKpijc5DS7toQ2kF3UfGyavl+zcwAgavnJAY8J1QwPZjoRZl5VgTrS6JDh1icIelZObgE7jJfTY5g7zmh+lzD4Jp28GFTt45CPNs06XgHg1J74kWTz8Cgig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rlc2NjQQqOMC3aLklOLfI9mL89LPUBnyQN4K0Y0Hiug=;
 b=RH9jSS/R01ziTiUbc7YBZYsUFmpNAj4lToladmSthNNwBmcB3039YeTjCv6tXuOFB7W15BjwG02X9MFJhpBbtgmTGauEVGWeIcrPqCF6M7XYqAxy98XqBsFUPWKJXZcQerXI2KchiGrTrAOzSsDrYbDMWz8yAAOE650+F4kQsyPg0IogO63dHCGDLoGWO4zXuU7MwJYZw1X7eGb1X8PCV/Rg/Uh4UDtaoRVHrXItdVcaCfLOp4kjXhJfh/te5bPk1iN90XPbVWuOk9Zw8lM96mmHALDXc/Edpw0A6cecykhi9LuKEGLFzze1pwgB/qbZyoAcasc5PGv4Bzw6S+SM9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rlc2NjQQqOMC3aLklOLfI9mL89LPUBnyQN4K0Y0Hiug=;
 b=qODOc5xlouy6ugyn81/7DiqteRpRzn9p9XuWsLxaTic8eK3Qg3GEPnJNSQrc+v6rEuOrTFLWZZ41JsGAMQxqi1TdB4ZWa3Hi/w991b8dDXGkd1gDYHYUgcmkZBmJzgn5i1elSDnz/wDtMdY+GbEE28JlscBjvfWwuhug5iT205o=
Received: from CH0P221CA0026.NAMP221.PROD.OUTLOOK.COM (2603:10b6:610:11d::6)
 by MW4PR12MB7016.namprd12.prod.outlook.com (2603:10b6:303:218::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.27; Tue, 24 Sep
 2024 08:19:05 +0000
Received: from DS3PEPF000099D6.namprd04.prod.outlook.com
 (2603:10b6:610:11d:cafe::3b) by CH0P221CA0026.outlook.office365.com
 (2603:10b6:610:11d::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.28 via Frontend
 Transport; Tue, 24 Sep 2024 08:19:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS3PEPF000099D6.mail.protection.outlook.com (10.167.17.7) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8005.15 via Frontend Transport; Tue, 24 Sep 2024 08:19:04 +0000
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 24 Sep 2024 03:18:58 -0500
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>, <vkoul@kernel.org>
CC: <alsa-devel@alsa-project.org>, <pierre-louis.bossart@linux.dev>,
	<yung-chuan.liao@linux.intel.com>, <lgirdwood@gmail.com>, <perex@perex.cz>,
	<tiwai@suse.com>, <Basavaraj.Hiregoudar@amd.com>,
	<Sunil-kumar.Dommati@amd.com>, <venkataprasad.potturu@amd.com>,
	<linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Vijendar
 Mukunda" <Vijendar.Mukunda@amd.com>
Subject: [PATCH 0/4] refactor amd soundwire manager driver for acp 6.3
 platform
Date: Tue, 24 Sep 2024 13:48:42 +0530
Message-ID: <20240924081846.1834612-1-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099D6:EE_|MW4PR12MB7016:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f90df97-7c27-4edc-a9f7-08dcdc718de2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|7416014|1800799024|376014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?jsmKdKdq6J4HFo38hLI1AZ27AJ11DYN1kuwmfCY4TpFwUgaUk/Y9qq53iWf4?=
 =?us-ascii?Q?Cj3EM0G3a8Avtw5oGNOeKmVaDe4G3wPdSWby4TBJxOz+ZD1rfL1orJ++ij5c?=
 =?us-ascii?Q?tYqV4C0eE1A6YwztzQm5rLn9zWL1cTySL5cQi4PMaEA2+1Kv6O5P/I8IvkgB?=
 =?us-ascii?Q?icLTr3MBy3cimLxCtSaVW9pPqJA+NEU7/+7iSwBwvOiQ1a0EiQHvRA03L+Rb?=
 =?us-ascii?Q?+riTAQJJRbTo7WGirSP5RcL3OEkUQPx2WWmC+3qHhesm6ZEv8Qn4pZ/akqnc?=
 =?us-ascii?Q?vqbxSv94ByQl/Vu2T8dz/WcZfg65Wg4TCJk69kjiBoAJ+dyn+DB1dBU2ebqW?=
 =?us-ascii?Q?SHH+PzyI5/ziD7FgwdteS8DjlLSPbxk7KXwagrffAA7vzWs2WMzF+qDmb9MT?=
 =?us-ascii?Q?YpjyIa3djQA/jlcIqSodvvvNsc4hrS31aLkiMpQIv6Vx9Qfjw0DX/LQsIOoE?=
 =?us-ascii?Q?ftGdn7z+bee+0o170sq+iDYNMyuhpwt4eAa1NKXKbib+M0r6q4Y07YFCLmbk?=
 =?us-ascii?Q?uT42pCrN4pJep7OgDnj0nN9rhN3VfM7LsFPGLWYwp79yC5Lr4QCnOPxOw9s+?=
 =?us-ascii?Q?Kb97uhwhpbqLDLAlDgRoDZI+cvdiKtUhRqZO2yFL00+OfD084UBMUjNlv0ir?=
 =?us-ascii?Q?SFOd3Y9ebjYABzCx5I62WI0+E8eyN0BTcf3fSOuytk5Xz/ONUB2mVjEC6+pn?=
 =?us-ascii?Q?B1lt7DDMoqtJEWY+i2JfLFLPt40Qc7Z+upW+joSpu8vGWbgGzDZwAdZF4ZvH?=
 =?us-ascii?Q?68miVyEV+4nwgY31A+/8Q8qSq8cUOQD9O96ghiGLgL3iEPy3f1kohukGPv48?=
 =?us-ascii?Q?VVMWsCdenUucqjFUC+/58Hbom6T2pp1X4OD81G7DWrxD1TxGWPFaLPOM5cEs?=
 =?us-ascii?Q?Gmus7j0soJpTYfvKs+Lz2Bl7hwvzPtjqfLQCS69tQ4Sq/90nEQNo+0j+QFI8?=
 =?us-ascii?Q?snESl7nqvl82QibAjKHoCc57lJLnC15l2adJYqPCwZUA1ufb/VXxSAgkEClD?=
 =?us-ascii?Q?q6NRYznW/pz8qyDd+i58Wl8KeBS97d8vmzLlPEobb3wL9dT7hQg0wU0d0KpS?=
 =?us-ascii?Q?yM7SSgPb8SlQ5AiHkAogP8WZxgoYUJfCJrPp0l0JFPbyiq6zftySJPbkFHc7?=
 =?us-ascii?Q?WHWMO1/lL30pBfVXA6/Rn3rVO9z0R9eeGxNiV1r9QjCoBGcRAaoYf4to22Cx?=
 =?us-ascii?Q?BULqjBdVoFa52WysMrKf8LwBh4DYVNhqwP8RjKD7t560CKoW27LKAwmptjS3?=
 =?us-ascii?Q?3IZvpCTMgJ5PwnD37/jOP9Rj9Oms57RclUjXfvUp/VW53euGPo2t7iYpJpHA?=
 =?us-ascii?Q?yqpaN6cf+lbkPB2HsFbnkLH6EI0eLDm9J7X3yArW+Zax+tQBSfoZbQ05S7D2?=
 =?us-ascii?Q?+9641Vg=3D?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(376014)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2024 08:19:04.8531
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 5f90df97-7c27-4edc-a9f7-08dcdc718de2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DS3PEPF000099D6.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7016
Message-ID-Hash: IYXF3GFBZM5GX7CZIBZTJUXRXYQU3LEZ
X-Message-ID-Hash: IYXF3GFBZM5GX7CZIBZTJUXRXYQU3LEZ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IYXF3GFBZM5GX7CZIBZTJUXRXYQU3LEZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This patch series refactors the amd soundwire manager driver to support
acp 6.3 platform based on acp pci revision id.
This patch series prepared on top of asoc tree for-next branch.
This patch series should be applied at one go.

@Vinod: Please help to review soundwire patches and provide ack-by for
this patch series.

Vijendar Mukunda (4):
  soundwire: amd: pass acp pci revision id as resource data
  soundwire: amd: refactor existing code for acp 6.3 platform
  ASoC: SOF: amd: pass acp_rev as soundwire resource data
  ASoC: amd: ps: pass acp pci revision id as soundwire resource data

 drivers/soundwire/amd_init.c      |  1 +
 drivers/soundwire/amd_manager.c   | 99 ++++++++++++++++++++-----------
 drivers/soundwire/amd_manager.h   | 16 ++---
 include/linux/soundwire/sdw_amd.h |  6 ++
 sound/soc/amd/ps/acp63.h          |  2 +
 sound/soc/amd/ps/pci-ps.c         |  2 +
 sound/soc/sof/amd/acp.c           |  1 +
 7 files changed, 84 insertions(+), 43 deletions(-)

-- 
2.34.1

