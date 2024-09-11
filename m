Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DD74974EB4
	for <lists+alsa-devel@lfdr.de>; Wed, 11 Sep 2024 11:37:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 94888B65;
	Wed, 11 Sep 2024 11:37:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 94888B65
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1726047431;
	bh=XoV3hvmU3MMvmPP4xaZBnx+9HU9YyCBlA8giPWeEuNc=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=mdgiuQk9PMBUEmurn+Z66NoHLECpj6kD4iqzzgGAd4T1QRnhFLvdy91QG+ZuY906D
	 urymZGY3DBKPobdr9xHwNi4ZuD/f/aFFrENqSZqyeiCbXF8mMVg2RRWlThUYkaeALH
	 51Kikg/BmyTExuxvOeWfhunEwPgROR3NGkJ8FcOU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DE4B7F805C7; Wed, 11 Sep 2024 11:36:37 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 04EE0F805D2;
	Wed, 11 Sep 2024 11:36:37 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2CE76F805BE; Wed, 11 Sep 2024 11:36:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2060c.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2405::60c])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1B913F8010B
	for <alsa-devel@alsa-project.org>; Wed, 11 Sep 2024 11:36:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1B913F8010B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=taU80Sj5
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l4mx8ZV6SXAdUsXPOlnOjD5xiiaZOhTX4zWfwHGELU8hDB0ZRT/lsYr4fSEMtRciMEgdj6e2bpbGdwoQgMID4EQ2AYeqNfkO5HehSzxppw86CmTzUlGdJuHeoq/YHRgdo796ZtDwRBg1WPWytVy0XhKf7MbIK2x8yXjVkL4Fv7FMR2J+vLvgTqxkIh0wurLlEb3bORT9N3b9cuszy/xuSKP9W8Q7WpWOLz+8VzmSzdMufJIepNCKUlJtdIBcIf+Eu3TNQUBTXvHC6v8+KJcsHu0B85V6E94JL0dWEVD7jOOwhUHH6FjV2hkNstSacl3BC6emEPnhJZNIQGFX7BZu5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x9U2YKvOzD19WpIg+57H46GIytg+CoFrDPpCK7za4N4=;
 b=Q6l2HxTlYkafat5BcxLS730L/pZr72kWkNTcQfTlK3hiM4iy84AYh26SEkbOm3rmEEEcCg4RV/9WgnIzUuIr/UxNgzV22aiT/8LJYo96fmrAs77eA0HPfjgiTcrbRlvsi50+FdclD+EiBPBvy4LqOFEG5HLvyOEqNa9csuaSYXl2Ny5ug85CZdzLqdt/NZ2RNmwA8V7XGpAejFTIZkGcKoHA4PiUqDY/G/Sqhy6CNYJecVkr7sQqj0UIE6/ICkFnMXoLlBjqKEEhjJkDJ42z0kT8sk5VSfeZjqJcoeO9eZgL0jfoMA1MmOx/mgQQDhj/aSzQT6mQy7duDgYTDfoSdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x9U2YKvOzD19WpIg+57H46GIytg+CoFrDPpCK7za4N4=;
 b=taU80Sj5uKfZI7y/gmmoQOrvReVWoaKgSm/v+emXCFe17de/sW9eYc6lgN7lAliMejtbU6381/+T9vACiG7zcVpq1asYfW6lDS6tuE0BYgPgzFGaXSd+vthDu/hIjbVKr4sekCtRrRd2mSYSUZbDUP8Nqa2taxjymE+iEh/hX+4=
Received: from CH5P223CA0017.NAMP223.PROD.OUTLOOK.COM (2603:10b6:610:1f3::13)
 by SJ1PR12MB6097.namprd12.prod.outlook.com (2603:10b6:a03:488::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.20; Wed, 11 Sep
 2024 09:36:19 +0000
Received: from CH2PEPF00000148.namprd02.prod.outlook.com
 (2603:10b6:610:1f3:cafe::f9) by CH5P223CA0017.outlook.office365.com
 (2603:10b6:610:1f3::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.24 via Frontend
 Transport; Wed, 11 Sep 2024 09:36:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH2PEPF00000148.mail.protection.outlook.com (10.167.244.105) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7918.13 via Frontend Transport; Wed, 11 Sep 2024 09:36:18 +0000
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 11 Sep 2024 04:36:14 -0500
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>
CC: <alsa-devel@alsa-project.org>, <lgirdwood@gmail.com>, <perex@perex.cz>,
	<tiwai@suse.com>, <Basavaraj.Hiregoudar@amd.com>,
	<Sunil-kumar.Dommati@amd.com>, <venkataprasad.potturu@amd.com>,
	<cristian.ciocaltea@collabora.com>, <Syed.SabaKareem@amd.com>,
	<linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Vijendar
 Mukunda" <Vijendar.Mukunda@amd.com>
Subject: [PATCH 2/2] ASoC: amd: acp: remove MODULE_ALIAS for sof based generic
 machine driver
Date: Wed, 11 Sep 2024 15:05:54 +0530
Message-ID: <20240911093554.2076872-2-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240911093554.2076872-1-Vijendar.Mukunda@amd.com>
References: <20240911093554.2076872-1-Vijendar.Mukunda@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000148:EE_|SJ1PR12MB6097:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c05840a-e2a3-4c1b-8432-08dcd245308d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?X/oqMXOusGVkD8Mwi2FDbpH9wmvZZkalAuTkuPcviBSqTKR8sOuBQcEOFSne?=
 =?us-ascii?Q?ad0danRunS/nP0ArribdiJchKnR2b+6ki8Z5Bq+l7GHqSL4AvDCS/x5HWDOu?=
 =?us-ascii?Q?rAvlsHQNjFNmc7JDMvi7rn6yplK5r16AYsM6b+/tn9W7o3g+aJCYLl30G2uF?=
 =?us-ascii?Q?3jrzWQgASWWGL58FW2LJdpza0gNIjJGANtiRIeRW6pmJGU4s+WJ4evmb8H/D?=
 =?us-ascii?Q?BoywYkHmr/kEMLHE6pLSV/JkLKl/k5IkZiehDyFFzCtR0PqDPXWUVI9NpQp1?=
 =?us-ascii?Q?dUc6hrwP1zDmqslWiygHNGgD9HeBwgj99yFB8iS2mPvzNwsefh5N0fY8okjq?=
 =?us-ascii?Q?rTJO32EfhRZ49m7dMNOEuiRTHQsb/qEEyiJTlncJVKybien5WYJccp6NT6Rl?=
 =?us-ascii?Q?Znl7Tow8mcR+rvcm2zyvDodB97PP3yEd7cQkUlaPODrnDgQUOCbmMDTfP2i3?=
 =?us-ascii?Q?6dt1GuBg/PKUQmf1ahEV2IqboJtfF3f8wg0i/3905hU3EutyOQn9MYlVM+8L?=
 =?us-ascii?Q?br5fnKljIldj1k6dRg/PQCzsFuD9aOomnxF0ydupVXhoQRje7XUSgMzWw6D0?=
 =?us-ascii?Q?mn5I7qI8SshQU7nFw7OvuDTw7ndZsaD8pQ9nsBliHxF5oWpAaEC/PSZesJsK?=
 =?us-ascii?Q?1LjUcESbd7oMdibe5hWiUYyerpk5iloFkNtULbDhXXuCSBSN3hG4upwAf3T+?=
 =?us-ascii?Q?pvD/5cMcu40wAjf8QK6r/9R53QQecGbbKvDcDIrmAcFw86EzoIw7S9WWcJKy?=
 =?us-ascii?Q?jrTtk8Ic0vxj0O7xT+ipPP9rdD+v407FvyzSp0sJ73lhxgoCdOmc6cFBTCCd?=
 =?us-ascii?Q?R1+2FO9VK/emeuiZVuRfq//VHu0T713/rtYzEGatl5SpOBYh1oBSBS5O3zT2?=
 =?us-ascii?Q?UrmWLP9m7vtytyqFM+5Amr7Xt2Ch3CtdEQIr+DlRrtrif8+I3MAmQmoQLbXc?=
 =?us-ascii?Q?Zrt9cENFvhEOT6TlMQ6HXFO7SKniM3/hebPFx8bnbjcmqTDkfAI69KqxUBRO?=
 =?us-ascii?Q?K5BX3eWCHnsv1/VuVbrUWUN3j2duzyqvEePPL6BqB54iTbWdTk2PhRuIj8m7?=
 =?us-ascii?Q?AHKM3+vQQiu+Su5wg8MXp8a71/LDYgrvCgc7sT8UYi3w1xYZvu4u/b1AES3B?=
 =?us-ascii?Q?eYTPGbjSOQ9Cmd9W44M1IX2bxUryDriWjxMCjTkP2qXVk4xbWJ/7zJ9c2ICQ?=
 =?us-ascii?Q?svHvsPMgARQQNvhJcSWyi+vEb3t5r+Mnh7gv6SoSOpSo8QoDQ0D/2CxOtME+?=
 =?us-ascii?Q?8Q6xo3fU6wRMWh2iq7OYaPSv7unMgU7bcpte6F062vE1+sMe9QYtaO1hBEA9?=
 =?us-ascii?Q?eKALt/CpLHrYJy84/fIWmeOjMHXB5sAY4r+CS1EdZZx6c8H3/MI2X4OemQBO?=
 =?us-ascii?Q?NNiA17ZV0QQwH0+eS/eHRR6RP7FBdyzyL5vSDWqEQ73IvtHUjS1PTr91eCsY?=
 =?us-ascii?Q?JJrOsSdgGyC/qaEao0OPRfgN3LRqs6VO?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2024 09:36:18.7518
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 8c05840a-e2a3-4c1b-8432-08dcd245308d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH2PEPF00000148.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6097
Message-ID-Hash: FPRJ34WDDIFFR3IMAS4BNUGLXNSEWD7M
X-Message-ID-Hash: FPRJ34WDDIFFR3IMAS4BNUGLXNSEWD7M
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FPRJ34WDDIFFR3IMAS4BNUGLXNSEWD7M/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

As module device table added for AMD sof based generic machine driver,
MODULE_ALIAS is not required. Remove MODULE_ALIAS for AMD sof based
generic machine driver.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 sound/soc/amd/acp/acp-sof-mach.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/sound/soc/amd/acp/acp-sof-mach.c b/sound/soc/amd/acp/acp-sof-mach.c
index b3a702dcd991..f36750167fa2 100644
--- a/sound/soc/amd/acp/acp-sof-mach.c
+++ b/sound/soc/amd/acp/acp-sof-mach.c
@@ -173,11 +173,4 @@ module_platform_driver(acp_asoc_audio);
 
 MODULE_IMPORT_NS(SND_SOC_AMD_MACH);
 MODULE_DESCRIPTION("ACP SOF Machine Driver");
-MODULE_ALIAS("platform:rt5682-rt1019");
-MODULE_ALIAS("platform:rt5682-max");
-MODULE_ALIAS("platform:rt5682s-max");
-MODULE_ALIAS("platform:rt5682s-rt1019");
-MODULE_ALIAS("platform:nau8825-max");
-MODULE_ALIAS("platform:rt5682s-hs-rt1019");
-MODULE_ALIAS("platform:nau8821-max");
 MODULE_LICENSE("GPL v2");
-- 
2.34.1

