Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BE20977BD5
	for <lists+alsa-devel@lfdr.de>; Fri, 13 Sep 2024 11:07:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 70079851;
	Fri, 13 Sep 2024 11:07:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 70079851
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1726218459;
	bh=s+VhX4Y+V+2fgGsKjB4s9ozjvyX13QLU7T5XxdXhOSs=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=gX4ScPw9kWLMZBpxvQtUPIf/EXBX1sVrYte9etk50YJPA5sihMnBP8e3Cv+U+djAk
	 TZV7ErZ7ZRnWod9Stsrey7/sZO9EFhcKJSdRUNacbm5vyNAjBReSPN4ifXoMf5tgI7
	 uMtGm5hH1WaafSa0XJ7sMocBSQ83BG3MFQQpR514=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 13967F80527; Fri, 13 Sep 2024 11:07:08 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EE8CCF80301;
	Fri, 13 Sep 2024 11:07:07 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 23D66F801F5; Fri, 13 Sep 2024 11:07:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20629.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2414::629])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id EEB61F800E9
	for <alsa-devel@alsa-project.org>; Fri, 13 Sep 2024 11:06:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EEB61F800E9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=Tcua7b/I
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KmVpGe2uMorBZVr2ptphWEsUHWQM0c4vSzHh3R1PMdvReYz7hL8FXKMZcoWSpxVOyz0h369Ndao3psjGPqgCZKTHi5GWffSpB8WV++39LjwBBXW87SkKH2H7VlQulflBML8XEJ84xmEb2UJRt7mlthlaIaTyWR5nUS/RgIR8n009HhdCEJqzYXImYElf2Q4tYTGyoo7szYDTVBNPCgMiWeTb12XnvhTvY+pGK3XpubBJbe7skzxx6jZV70SPweRu6XOMmrAsuJPp2IE0RtBMGWKRBULsb8015mRoIOiIrCINUNgTKCrWlPgUsTPmFyfm96nxBDm8zz1UvokdT2SgoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZLTUZRjT5uMw5UviRA/8kmrACc/K4fmleBLLYEYwNgw=;
 b=K5H3ak83p/gakxNg8pRh0tJJeXSCBiu3lMPb9REtRpOWgLQq0I5dWXz7E4tELLf//ReJkaA1pJSKu+TrAQ++btXknbBGoc+cxOAbYXHKiCnD5zPWPgN9x+55HLak94zuzQHRIR9nenHqqdXUWlPgYencuzZ2KO2lk49wTGefEUPLN4494n3a7rACy64a2G689xsj69q/Vck6NOlqXyBSxK6b16oXKyPrMxz9vd4blFFnCzG4ABk2iQDvOg5a3nH2ggXvthCRwJuXl9XJaM/Myxf1xeki37OrNYdZpdmh1dRWiM2In17Hm9FjKEFqCLp04tFVszBWuqShVchMFhkUXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZLTUZRjT5uMw5UviRA/8kmrACc/K4fmleBLLYEYwNgw=;
 b=Tcua7b/IooZtRhhhY1s3Ydp5YXloBYWaIVcbY0pip90NWyImmAntC7QjLuzr9o5FMKXjGv9kUceNegmC6rq0RBswfimIMHDjhgvTGzFYKhIPNFhivsbjad/7pfpNrNMsO8dGYbDOnUaUB/NXktcojUcv/3knEJ2Mh6rVCDAKl4Y=
Received: from CY5PR16CA0012.namprd16.prod.outlook.com (2603:10b6:930:10::20)
 by DS7PR12MB8289.namprd12.prod.outlook.com (2603:10b6:8:d8::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7962.18; Fri, 13 Sep 2024 09:06:54 +0000
Received: from CY4PEPF0000EE32.namprd05.prod.outlook.com
 (2603:10b6:930:10:cafe::28) by CY5PR16CA0012.outlook.office365.com
 (2603:10b6:930:10::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.24 via Frontend
 Transport; Fri, 13 Sep 2024 09:06:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EE32.mail.protection.outlook.com (10.167.242.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7918.13 via Frontend Transport; Fri, 13 Sep 2024 09:06:54 +0000
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 13 Sep 2024 04:06:48 -0500
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>
CC: <alsa-devel@alsa-project.org>, <pierre-louis.bossart@linux.intel.com>,
	<yung-chuan.liao@linux.intel.com>, <ranjani.sridharan@linux.intel.com>,
	<lgirdwood@gmail.com>, <perex@perex.cz>, <tiwai@suse.com>,
	<Basavaraj.Hiregoudar@amd.com>, <Sunil-kumar.Dommati@amd.com>,
	<venkataprasad.potturu@amd.com>, <kai.vehmanen@linux.intel.com>,
	<ckeepax@opensource.cirrus.com>, <linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Subject: [PATCH 0/5] AMD SoundWire machine driver code refactor
Date: Fri, 13 Sep 2024 14:36:26 +0530
Message-ID: <20240913090631.1834543-1-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE32:EE_|DS7PR12MB8289:EE_
X-MS-Office365-Filtering-Correlation-Id: 0cff6f72-66e8-46ac-9c1b-08dcd3d369ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|7416014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?ZGODSzpwY//Fz4bFyHc2G49BHcKm3eZJQYcjHUJuUVmUCdAaoTcTf3dKD0w3?=
 =?us-ascii?Q?cBraINg0U88BUtd+r1BYTvZtRcrcrlDCRS5l3VjWDlFWrLzaCjtn8FYY43Q2?=
 =?us-ascii?Q?ualyDQicpD6g2FvT6s/Ggt5Dei1dS0u4wNp893bnXFREC3F4ls6s1CDvTjbH?=
 =?us-ascii?Q?14raeJzM2BIFMCuVk2WqfS5X3bmzwH3A/TaxbHSLo9ysF4f8mgDRfJD7984P?=
 =?us-ascii?Q?5KsPg/RgENiJpN871JSnJM2BCDUXRof70DpM+AgSRUkcFIbomnQMsQA/ztH6?=
 =?us-ascii?Q?B9fRWvEQG9K3zV+2UqicjnV916q9amTauvrnvtgivbQ+QouzJqb3LbsXtHg4?=
 =?us-ascii?Q?olQ6HKGvo48rbUqilyzW2vLkwK65h3WbBgk0ixHUnQHo8HZtaYzkmpfq6U8L?=
 =?us-ascii?Q?CHyy9ch7QhZ2+mYkxqLbQwT7NSukuXbXEwVgj3vsntOyCpDHhgnZnKaoazFS?=
 =?us-ascii?Q?/pLJovDoFY1gCkj6+bLpM0NNrZG+z1s23jeS5hmM6Mb8NG6nCxoa0QWUDF8s?=
 =?us-ascii?Q?GfGkvl6iCaFwVtOCxp8RmxrrflJkj59G1Jh0ubzJOa342cBaxw3qVwn+xcMZ?=
 =?us-ascii?Q?M/Gyx80pIjMzI3NHi5BBbxJMZU6MAm+LzoBAMgaYnTRc1Yq8duwrc6eyOXIN?=
 =?us-ascii?Q?QhS6rERSgMr4Xp/5LK1KJoOZPWvHidfdxp+IPJuzLSID9JdW8x/9wFm/Q4bP?=
 =?us-ascii?Q?hoLfgIsFM3S658Gxp4vNk/4OjeIQxMpjBkoJieadtY2rnAsauR31YLCQiGRS?=
 =?us-ascii?Q?l+c8OddIAXxpiZ6VdvJkn74VAS7MzsyNvAYcUmnNq2NbbpcyRRfzkHCzqD0V?=
 =?us-ascii?Q?8BQLC+gJdyQupAeHCL0P3CL044hcEMrQebq8+wQfOburqDErIgMZj6BBuSaj?=
 =?us-ascii?Q?3IVES/Zx1awREnTHIG9SkFHDWAn0p+SashIEpCsyHf8B00Nde9RUCCWq2dpq?=
 =?us-ascii?Q?Ug/G8JqP/2VqpWhDeXR0Fldin80MBCOIAEeD7/xq8NHbBRXg+/k+hkwJpQWd?=
 =?us-ascii?Q?nbioZZbMMptZBGVs/NKJPMYxKPoX/vsdizgIWLbuTVJNwctwTYrC1bS0kMPe?=
 =?us-ascii?Q?rPQ83YTQDS04UOR9ikPXnPsUAG1fgECE1Z8fhsJ14UKTpUPgPLJrSE47bh2M?=
 =?us-ascii?Q?tVkC33i6aHJY/1eWsr1VmSDV/Gb2ORU9LQOkr8VDNLRIaVWgXCwHgBQKBTSG?=
 =?us-ascii?Q?Xv+hblxkvS3PJMd5mogqLctQSfE7Zf0Qh585WwpmGJl4ajD+Xe5ttu2zLJkw?=
 =?us-ascii?Q?lsZNO6FE63ktXLUaloBU1Lze7W7gxgrvJWFIh8vJE5e3sI6stHXrsaiv/+GQ?=
 =?us-ascii?Q?tocMSK0VS56+YOySjUwllmhIWtRejXrVQmk7vZLD03ivgTKeYRB5X9ir91lz?=
 =?us-ascii?Q?N0pZkjSVakhggzUfpq9+pRsg0DoKjbBgklYk7ZItz9F9j+WW5bo9qKP2P8fS?=
 =?us-ascii?Q?xZnEvBFo+O94FRwMfoM1XPAkQ4zU5eH2?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2024 09:06:54.2372
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 0cff6f72-66e8-46ac-9c1b-08dcd3d369ac
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CY4PEPF0000EE32.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8289
Message-ID-Hash: QMGJWDK6DAAR3TGHSLX5A3M5IWZMPYIC
X-Message-ID-Hash: QMGJWDK6DAAR3TGHSLX5A3M5IWZMPYIC
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QMGJWDK6DAAR3TGHSLX5A3M5IWZMPYIC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This patch series moves common Soundwire endpoint parsing and dai
creation logic to common placeholder from Intel generic SoundWire
machine driver code to make it generic. AMD SoundWire machine driver
code is refactored to use these functions for SoundWire endpoint
parsing and dai creation logic.

Link: https://github.com/thesofproject/linux/pull/5171
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>

Vijendar Mukunda (5):
  ASoC: intel: sof_sdw: rename soundwire endpoint and dailink structures
  ASoC: intel: sof_sdw: rename soundwire parsing helper functions
  ASoC: sdw_util/intel: move soundwire endpoint and dai link structures
  ASoC: sdw_utils/intel: move soundwire endpoint parsing helper
    functions
  ASoC: amd: acp: refactor SoundWire machine driver code

 include/sound/soc_sdw_utils.h        |  31 ++
 sound/soc/amd/acp/acp-sdw-sof-mach.c | 540 ++++++++-------------------
 sound/soc/intel/boards/sof_sdw.c     | 195 +---------
 sound/soc/sdw_utils/soc_sdw_utils.c  | 161 ++++++++
 4 files changed, 354 insertions(+), 573 deletions(-)

-- 
2.34.1

