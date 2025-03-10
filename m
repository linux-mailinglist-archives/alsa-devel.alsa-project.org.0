Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D59CDA591B4
	for <lists+alsa-devel@lfdr.de>; Mon, 10 Mar 2025 11:49:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4EB806073A;
	Mon, 10 Mar 2025 11:49:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4EB806073A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1741603774;
	bh=in96+jdfE9SvEmCM3E3XNbeeIxmOfqymBnKCPwm+47A=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Xt7HwG5/K8AskmG1sUWlc4+E+qFKPuX7rzzSkSGHAL1XhOxWDmJUN6gthgHOFhLUH
	 vo2ei6v34SmK13+W7vHDCbnWwEWpZ6qbR6zdicJN08HNZq6ItnPLAeJU+s7JOBfLw/
	 WafUOXJxLpdFToBgU+pD55gYDudUgoMdD59usIg4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 83444F806B6; Mon, 10 Mar 2025 11:47:31 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 43190F806B1;
	Mon, 10 Mar 2025 11:47:31 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1B062F8068A; Mon, 10 Mar 2025 11:47:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2062c.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2417::62c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 421D6F805E9
	for <alsa-devel@alsa-project.org>; Mon, 10 Mar 2025 11:47:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 421D6F805E9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=t4ZxXtRM
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U2JxlsoAJR5emKugP1LrQZMEMGTkpCmSqBIgYmXyDDRM4kHQeNhKrJ4+pHq30vWzfg5iHgIzoDCvP8gxsGQBeQBWQcwjPlcx7kBpmSFzPbIxHZ+Wsxu1b+sf7/BWIJX9IXidWVLFeWRTSEHaL3Q27s9XuwVlJPL2G+nBgMSUEZPW3HuUPHl5fAdxWwsgWljK75FiLbvrEQW7ZyQh6eykbBL4B0iQz1KTJUOnk4tc2C5hc8HTgu4+WIWs/zMqgcRGQNbfUdOrkGS13CxX9wJTtJPv8r6VeEolzGcBt0it8mYfMWlnVh1s6cwLEanqYl3wsTOo66ni2Je1TCktQG9KIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qW7gUOHJw2LfE5N//FTdZ0etwlP1Vo/tPBSentUpyEM=;
 b=FAJXwoWMb6bA6F8xJ9K0eEz03XIkWSbefBWhNSKwwBCb9b/B6EDtrYrm2d5T0AtjN51h9wxVg+6R4Tl+3KXjz3/RqYJyxPhoDVc5C5l+B24EXumLKSc1WpkoxaIWTR3ZXVoZkBct0AVk2a4gG4css7XxYaM4OfinQnRmSyi01MGSnneh9kRdDtsSHMrni9X3uZoOGL7BHHQFDVCbO8sc+5GPfPDuTej+KzRjCF5CHZDPAxpfVDHoN/KPbD9FGM6o7UPumgA74K9+A78K+w+HcQ4+PBtSKyyyNEA/GwO1bm8nuCZw4IlFMcCbok3yZD+OFCxAvBzvd0JbqWWzW4oCgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qW7gUOHJw2LfE5N//FTdZ0etwlP1Vo/tPBSentUpyEM=;
 b=t4ZxXtRMn5D/QzTXi5Mi0yPd1B5C4WaGFKGUAzk9W3zgu7X+cK5s4zUI0q5HK4hb70oP1EezZ97z2hFzVwvlXm+y8JljVMyAwHruBiRushKBo/+Ks4A5SrPFKByX1GVloBxZcVp6UrM3NiRTeTpgXGtX8sWj19SsStYy80SNfLg=
Received: from CH2PR08CA0012.namprd08.prod.outlook.com (2603:10b6:610:5a::22)
 by SN7PR12MB6838.namprd12.prod.outlook.com (2603:10b6:806:266::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.26; Mon, 10 Mar
 2025 10:47:20 +0000
Received: from CH1PEPF0000AD7D.namprd04.prod.outlook.com
 (2603:10b6:610:5a:cafe::70) by CH2PR08CA0012.outlook.office365.com
 (2603:10b6:610:5a::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8511.26 via Frontend Transport; Mon,
 10 Mar 2025 10:47:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CH1PEPF0000AD7D.mail.protection.outlook.com (10.167.244.86) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8534.20 via Frontend Transport; Mon, 10 Mar 2025 10:47:20 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 10 Mar
 2025 05:47:17 -0500
Received: from prasad-lnx-mach.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 10 Mar 2025 05:47:14 -0500
From: Venkata Prasad Potturu <venkataprasad.potturu@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
CC: <Vijendar.Mukunda@amd.com>, <mario.limonciello@amd.com>,
	<Basavaraj.Hiregoudar@amd.com>, <Sunil-kumar.Dommati@amd.com>,
	<syed.sabakareem@amd.com>, Venkata Prasad Potturu
	<venkataprasad.potturu@amd.com>, Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, "Peter
 Zijlstra" <peterz@infradead.org>, Greg KH <gregkh@linuxfoundation.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>, "open
 list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
	<linux-sound@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Subject: [PATCH 09/14] ASoC: amd: acp: Remove white line
Date: Mon, 10 Mar 2025 16:15:56 +0530
Message-ID: <20250310104601.7325-10-venkataprasad.potturu@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250310104601.7325-1-venkataprasad.potturu@amd.com>
References: <20250310104601.7325-1-venkataprasad.potturu@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: venkataprasad.potturu@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD7D:EE_|SN7PR12MB6838:EE_
X-MS-Office365-Filtering-Correlation-Id: 74e643fe-57e8-4b98-bdf7-08dd5fc0eee4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|7416014|376014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?xhrwTqb/a29ESHHRCYS9LuzO0Hrw08+he9ngJ90Lm9KVCnCvo19hg9SYVwcG?=
 =?us-ascii?Q?3q92L5jG08PMndFNAXn+qu8Sa4ljH1GhhiecKOpKoQfv2KtW3zsLJ7wNOMIv?=
 =?us-ascii?Q?JcqMJvB1bFplbmV83JytByjk1YwkNcjJSjvL0rioCLIrbeg76LKETVA2BcJp?=
 =?us-ascii?Q?K6kg53rNb8xDxFyQ0yz31gnMuDdZYm48cEx6Z1vkbpzIT5pOrjvazx7JJkk5?=
 =?us-ascii?Q?N6rwmICnc0qoc6zUHg/OKNmAkyrDmfEJc3WetZ0H2IKwGcFJJg+FfMwerBt4?=
 =?us-ascii?Q?94CC0ym7F+pcnLPTBg0Zm/gEDdli/NAaIk0xTHTOkLd3t9PUVFQHfyB+0Fmh?=
 =?us-ascii?Q?JEv6uwTcx0XPu9QQXhdXmf4LBNetaanHAycttGr891cxhAMP/Knd00jPlUIx?=
 =?us-ascii?Q?FMxEVO/fbf1P0ffZ/86TzxFXv3FnpRFYjR6dmU+Uv1irfng8egSkz7VkmrNt?=
 =?us-ascii?Q?4CnAPB5nQzW+vIbY87G7nQ6BBS/tb86Nzpgy9txWKZYKkfHZ01F2LZYlweXX?=
 =?us-ascii?Q?TyFs35MGLUBdRErODAcLu3BfinVp2jgDib5GXaqwQrhCtg0KhRyYqKTY2q22?=
 =?us-ascii?Q?7sXzAl+7oqjp2FjonTSjRZ0vD9LMIesheGJoivquojBWZqrllVpUMjtTWAY7?=
 =?us-ascii?Q?5anotwDtBTsM6zhFJ5oNSGzpnbrn706GXXnCg2zu1rKQdUME5CKVSy/toc4F?=
 =?us-ascii?Q?rs8oPWhhPNeoaMV+mrff5MzxjqzdF3OiELN0zjspk3INy/+lmqyl7g8gdBWz?=
 =?us-ascii?Q?ciwGlxoxQmxRrnSDc7DrKetiFH3VL5j/fNv3Ocu5SzyimTcofxKWvh+J2Opg?=
 =?us-ascii?Q?1h7/37X2BHpCIj3i6Ey4acMbAaaWpYdS6MpKTh8mFBd4cNUMCKiiWW48j27p?=
 =?us-ascii?Q?Me/8FwRrUnWtD2JVjix3GFUn/MqHhZ73Lz6rAriy0MOGslbq3iah2dfB8bE7?=
 =?us-ascii?Q?JrqVkyqLyazULZDQfES6h0N0u/wrEsv7LLqUgTRn93qorgCMWYMw2eMUxu6x?=
 =?us-ascii?Q?xNzOffWGLh/N+kZE2fJgLQ44TubPTv/3VZvQgQogIyQHk9CAXRcI6U3G1MnP?=
 =?us-ascii?Q?Agzw8pNvktuZt+Fpp+ka1645sYjo/TAVXO77I1y7+OQ8O4CIgy/L3jLVWV4h?=
 =?us-ascii?Q?Oi+I6eXnxVfcZJHskpLM6zs96VLEokbfTxcMwSsK3NfipeyLoY9uDfQFyc7+?=
 =?us-ascii?Q?1SHsjgWsR7B0mfNUKavN7GwzYeLFznL4BFfP4/Y3AoWCG0JGZiGYeQFMcq7Y?=
 =?us-ascii?Q?Lm8ZwebBuTSn5+Pbkvnnuqpo1MLHBCs4F3qd7k6YATbS1A/ktpGQVT5I/uLe?=
 =?us-ascii?Q?OChsZUIJTBAsdHSfI2ZnjnZq+Qg1iOlN3SjsSvEJP3PHlhBvSjuesznMbEPp?=
 =?us-ascii?Q?YV2wYsjijYpCYLWw/epE1oJ5Boeo8av8+rvo1lHYbCZQorqR5GO5/WOf1Alp?=
 =?us-ascii?Q?/RLM0gly4votkmVN8G0+BpBqhDeWjWgZPvYc93wrsIYiRkKEs+wCwpplYKXf?=
 =?us-ascii?Q?HBWNXgT5Uy7BYGs=3D?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(7416014)(376014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2025 10:47:20.2181
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 74e643fe-57e8-4b98-bdf7-08dd5fc0eee4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH1PEPF0000AD7D.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6838
Message-ID-Hash: 5GFLIMC322JBRWWKMZCUZ3YKZRFRG6RL
X-Message-ID-Hash: 5GFLIMC322JBRWWKMZCUZ3YKZRFRG6RL
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5GFLIMC322JBRWWKMZCUZ3YKZRFRG6RL/>
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

