Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C649AA5A30C
	for <lists+alsa-devel@lfdr.de>; Mon, 10 Mar 2025 19:35:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 50C6E60785;
	Mon, 10 Mar 2025 19:35:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 50C6E60785
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1741631734;
	bh=in96+jdfE9SvEmCM3E3XNbeeIxmOfqymBnKCPwm+47A=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=BOZwKNqLIr32PTM5SRwtkzPqGa9EhwpE8IxgD7wnNHLimX/Cyhqe7QqgCFFGWR5Gg
	 Q0j5ylPsylgWrLaqcbsJEcGbRPsllk2Ebp9oF5M8Q5N9Upml5yITsVhXqpyWlBIdP5
	 fNLDXQNNC8K9w6Qbg3HCfi6j5RSbUB2vhXX99zVc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7B654F806C1; Mon, 10 Mar 2025 19:33:32 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 52F6FF806BC;
	Mon, 10 Mar 2025 19:33:32 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8F304F805F4; Mon, 10 Mar 2025 19:33:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20616.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2412::616])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A3631F806BC
	for <alsa-devel@alsa-project.org>; Mon, 10 Mar 2025 19:33:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A3631F806BC
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=ce2mioS4
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SOq0FvyMpDGRlyJsw+twusHoL9XQLVf9060Mldv4arEiFnkdO3XrefTYU5RNzmjGCk1Fj/QkotEPSGoWuJ1juHtcNjZUaFS1rS5GqPWVGt94xQOYLrixhLGWLYKycmKcNtpZMtkXM9o6r7xdmg3y86L+QqtvAn9mkEtGBZ/kx08fO5BaurifMzVk2vOV/gxJ/mGVuwvoP40gDypDuw2nrD4NPa4Ld3MAphu48bAvYGIhRRN//A4sKuqCmhMwObvdLBF43SJx3xgt55EB+6ymvSRPmB9k9dpcR4qaVBk6jllYG3oi+Q+hdG3fTvjsaZ/PLyrFEmCG2bgqLNE9Y2uXBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qW7gUOHJw2LfE5N//FTdZ0etwlP1Vo/tPBSentUpyEM=;
 b=cotmePmW98ZHk8169TZUK4EB4Lnxrd0dai5OAiPr0F2/pBskNuThscvCVAFA1QGNiDdNAI6TQZaBQS5EU6AEgx/xIrbuL7VMJ0KEosT5NY9U2AlOLpFipTedr454Fc0wZZsM5NsenccIvRBZ0VEqgZyAz18e7iiBFWhvmyRg17+DOEGb+2V0SL172cqLcIlZ6YoewWRTRwzm9n52n6Qr5ITFK6/N+mYSsUckAjBFp7UvGNf4+wmpDagWdPQ9AfE90m6L2LSm/BXPuoE1p8C3huiE8hUcQ1gsvgKNVAIcsCwmbAhotjdw8mTzA1uyPXhSylr2+nYdz8wDEu+60YM6dg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qW7gUOHJw2LfE5N//FTdZ0etwlP1Vo/tPBSentUpyEM=;
 b=ce2mioS47zl1NZmM9O1KlqTDkpZYAI0NfcnSMWOBVBPzKbp4k9JI1zAXJ8YBRGPyH+b6ItakBkoJ0wy70L9jgAiSuUEaakbqNmkMcemUUwf9t6EAwxKQNHBFH7SoaQC0Q3btitH9TyItL79zgbrNTqA+Ui6Dr13V5czmmN0KaGE=
Received: from MN2PR14CA0013.namprd14.prod.outlook.com (2603:10b6:208:23e::18)
 by DS2PR12MB9640.namprd12.prod.outlook.com (2603:10b6:8:27d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Mon, 10 Mar
 2025 18:33:16 +0000
Received: from MN1PEPF0000F0DE.namprd04.prod.outlook.com
 (2603:10b6:208:23e:cafe::5c) by MN2PR14CA0013.outlook.office365.com
 (2603:10b6:208:23e::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8511.27 via Frontend Transport; Mon,
 10 Mar 2025 18:33:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MN1PEPF0000F0DE.mail.protection.outlook.com (10.167.242.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8534.20 via Frontend Transport; Mon, 10 Mar 2025 18:33:16 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 10 Mar
 2025 13:33:15 -0500
Received: from prasad-lnx-mach.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 10 Mar 2025 13:33:12 -0500
From: Venkata Prasad Potturu <venkataprasad.potturu@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
CC: <Mario.Limonciello@amd.com>, <Vijendar.Mukunda@amd.com>,
	<Basavaraj.Hiregoudar@amd.com>, <Sunil-kumar.Dommati@amd.com>,
	<ssabakar@amd.com>, Venkata Prasad Potturu <venkataprasad.potturu@amd.com>,
	Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, Greg KH <gregkh@linuxfoundation.org>, "Peter
 Zijlstra" <peterz@infradead.org>, =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?=
	<u.kleine-koenig@baylibre.com>, "open list:SOUND - SOC LAYER / DYNAMIC AUDIO
 POWER MANAGEM..." <linux-sound@vger.kernel.org>, open list
	<linux-kernel@vger.kernel.org>
Subject: [PATCH v2 09/14] ASoC: amd: acp: Remove white line
Date: Tue, 11 Mar 2025 00:01:56 +0530
Message-ID: <20250310183201.11979-10-venkataprasad.potturu@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250310183201.11979-1-venkataprasad.potturu@amd.com>
References: <20250310183201.11979-1-venkataprasad.potturu@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: venkataprasad.potturu@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0DE:EE_|DS2PR12MB9640:EE_
X-MS-Office365-Filtering-Correlation-Id: 7f216947-abf0-4322-5726-08dd6002060d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|7416014|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?10tSINYRS6WsUZYp6+Zq8xVEfYH4GpGv2FtQKgOHANWHJ4bA/a1F41QV24kq?=
 =?us-ascii?Q?LFB18FQMfrAw6Wx+ejdIbhGJf3gmny6UBWY0jfU8i+Sz86ajajIYmhqG2xsN?=
 =?us-ascii?Q?90bXaZ7JRbfnpbse1av+T8y06H6l9xwpo6Pr9B5TOadW7yRv9ggeM3nB0l56?=
 =?us-ascii?Q?cHuvc8bDchYFHLqUtr9ekEo214bTys4hhATTboOCqu1duDnvtd0sJAB3Bf1r?=
 =?us-ascii?Q?4SBopsU0p9idAUV6t5idPArDSqAQ7v2fL9FMryIBSi0PYkp7b8cWdcJOeTO9?=
 =?us-ascii?Q?W0X+Upeh+VOJIqibO85gU8jSyf9sFHRWTOb3I2VdtY6poq4XUSOWGmZ5E08e?=
 =?us-ascii?Q?6uJybEJVaueZXUkEB/4x1ZkeIidjrjjDsgL6yYjGhOext7Rmw4d9NjhjMn0W?=
 =?us-ascii?Q?rf8jHnN4y8pwVDNbXsMq4MIDvvyU9gU1+9WyLFb5K3h4JSip6wIy/jhUJpuv?=
 =?us-ascii?Q?Ff0CLB/3lC9A85bMTXNbV96yHLr43BEYAkvf9HMaBbCr7VCtihK1WWN2ufnV?=
 =?us-ascii?Q?AvF3n6L1nvwEzCg6vO/mE3D5RhvwqCxKHKp7GEXJgWvE0vpJbEhIp7ypv25l?=
 =?us-ascii?Q?9PbX8tHK8PjTc8KDY4bGREJNhFFhWbSWNv3RfSQ5bRqIHXJQweP3C7FMxJQR?=
 =?us-ascii?Q?ccBhXvFmDwtP0HsgLAp93UeLM/St9BjmuK7M3gahydm7KU2w+Elfyken4lZ8?=
 =?us-ascii?Q?l0JMI7MiLaIQyWUYJqoWLZGrgpD7CQ7OXZ4+GNGqoJ/ytQisGJtVPhdM5lt9?=
 =?us-ascii?Q?bzLCX0RbNERphbOMUiz+818n9ojyhdJJJWhSq0B7MHO28wNgOd6QXsIGUdEk?=
 =?us-ascii?Q?II7F+fdjdAjh5IzKLJ+XCQXkFrs1anYHWomNf/EOi4QkWi4n3UMLqFG4nH5N?=
 =?us-ascii?Q?csqBw2L07yre0j6miJ8bn++njlvGHVu3iybmlU2HN6ydt9iwlL4v+eHxP+XV?=
 =?us-ascii?Q?eEObMVfloOogH/g0ZbxHlUI5IzrFF4Enx/OoFPM39msgslSnDDOkdqc6DaUh?=
 =?us-ascii?Q?CiW1Rc+dGgX5BYjN4uWKNw1qWcHkzm/uaexxkRV4ie2+bSwBw3Kl9pxlueFI?=
 =?us-ascii?Q?ulAfocqbW5XyYREso5LnlgKD6d9UFL9sMSyx4/hiT5y94euJeUeQnypTK4HR?=
 =?us-ascii?Q?X7apbmekkVrWqQhaVLG8ywz2hxIx839pNXTM+JXM4AhAdPjkjbJJNE00BM+9?=
 =?us-ascii?Q?MwDQ7hg0NePTgZ/mvCssakQc4JzOEAruUPFf8mwhPdJjSvdhQcZSJQQdirhZ?=
 =?us-ascii?Q?/SpHprOJCUkRAFhf638YRLA3J42kR1tMn7VZi7KWV7LVs3UdiMPLWs3ylL/w?=
 =?us-ascii?Q?s4FN5wC2VzQLl9EZUCPPt/aUTwoRDNJOrz1ZLAUjeCJglAbKLhMd4anGEzaY?=
 =?us-ascii?Q?nFjMYt2k2T6nzve3NfCfCfw3yQPEjGbh4IRilNsZX8AcIzOrnTUvs5JEIeMM?=
 =?us-ascii?Q?S+D/IRzflF6khXjNkzOvEjirm3CYFMjgEXnRXGqVWufYsbx53A1Ut+g2Our1?=
 =?us-ascii?Q?JSLBzl132R4TuIk=3D?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(7416014)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2025 18:33:16.3748
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 7f216947-abf0-4322-5726-08dd6002060d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	MN1PEPF0000F0DE.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS2PR12MB9640
Message-ID-Hash: ELXBWBOL7DIGPNQ4U2UIQOA6TZ2O5TXK
X-Message-ID-Hash: ELXBWBOL7DIGPNQ4U2UIQOA6TZ2O5TXK
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ELXBWBOL7DIGPNQ4U2UIQOA6TZ2O5TXK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Remove white line in renoir platform driver.

Signed-off-by: Venkata Prasad Potturu <venkataprasad.potturu@amd.com>
---
 sound/soc/amd/acp/acp-renoir.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/amd/acp/acp-renoir.c b/sound/soc/amd/acp/acp-renoir.c
index 2037af67509a..970ca613a439 100644
--- a/sound/soc/amd/acp/acp-renoir.c
+++ b/sound/soc/amd/acp/acp-renoir.c
@@ -36,7 +36,6 @@ static struct acp_resource rsrc = {
 	.sram_pte_offset = 0x02052800,
 };
 
-
 static struct snd_soc_dai_driver acp_renoir_dai[] = {
 {
 	.name = "acp-i2s-sp",
-- 
2.39.2

