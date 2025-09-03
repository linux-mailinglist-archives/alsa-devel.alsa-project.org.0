Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FC00B427D2
	for <lists+alsa-devel@lfdr.de>; Wed,  3 Sep 2025 19:19:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5B316601F0;
	Wed,  3 Sep 2025 19:19:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5B316601F0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1756919981;
	bh=tbBrdWEpEgEaM8jGZKl+bWGKhXpJ2caxNMMpgHEpRYw=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=NwK2Z+VlfBeMdC08v9jHUL1wHFd5rdltaSTOCVRKCCq/MMqIs53PO6sSsMoJJVlK1
	 ukd1WwM4JuPxzM0Jp7gjwMLPzzAsLBcd6SUF8/xNzP7islevp4Svn8YVMt5vbWEte6
	 z12xinIOgJkDjaSKuwKGnFUw6rlViJIaxl5UnPqI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 69524F805C1; Wed,  3 Sep 2025 19:19:05 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9BC1EF805C1;
	Wed,  3 Sep 2025 19:19:05 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5C036F804D6; Wed,  3 Sep 2025 19:18:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_PASS,SPF_PASS shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2042.outbound.protection.outlook.com [40.107.236.42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 10455F8013D
	for <alsa-devel@alsa-project.org>; Wed,  3 Sep 2025 19:18:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 10455F8013D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=tPuSEDJZ
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VexhAvmGjypQjTPA0dQ9nZGPpEcArPYwCI6Yb5an5oPGCI2dXTh5R/B8MRpNJSq+XiM9mYW6gwyMeRXg2MjHJ55BEH5dyMwdKDBLeL6pCt+gEskEfc9xfMixUcJAHHQpkX+/m3bGEc247FV2OkkFxvYOc8OeiFDNGZSmSXTZwjbCfPjnvV+JsaJfjyrGoa/f27FZ5vO8gPZW4WiDa6nEavlenDcZqxePmkX9A5YV7Nd+ze0V+DwUdvNUw3x72OqMtDCtUlqQqpINXrZxDL8Pp3wR3xuIEPjzawI1QrNQY5q7WEKrxbDoEZvdEJ0OS0jUafG5LoTuieC2b8HiZ/Gn+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w0ho/D69fAVEgAocnfYIPQdSll+XJjX8s5K591OG6rc=;
 b=CX4Ruq+KVQrMfvkOSD0yT+mBC9K9ztuXEn8vj7W4WwfOa1chg5FPaW9AJzXmhce+C9YrtiA8ahLJSZX48/iJWbpZsQxXgg834Ade+Aazeb+Os87L+JJg9SFfvit78XecGFZeWVurZKknnM3i6hGxzaDDEojUEujQtu3gXu7MMySxvb4ozJr3QO5ReyklHU6hU2Yy5ZyBeHUIqQI9WaBxhS/St5bjGBXBdAlrlmhIIc3c3ZkHOHCmALGzBgZEHWU3Po/LAiaKrcTyGDYy3DP/XkxQx3FaOIXf7AOWwOQuuMMf7ZMAUTeJuDWsZKJWLqdcH0QBqbg+oGDaRKZBw2Frtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w0ho/D69fAVEgAocnfYIPQdSll+XJjX8s5K591OG6rc=;
 b=tPuSEDJZoDVO8lZf7+Gx5QIacuMVuulStWnxac5+dOEYNIHJf9tpIFWFJF9rD9y5RJ2C2tiDA+DBwaoKk1MkAU1kJ9XizwooRbbvuqpBiSyqRCaQa39xhR7+fIiUyiwuJi1ncGbKwsZZG1fCs84Nz3sW0KE+G9gkIdH2f/T3Z5E=
Received: from CH0PR04CA0110.namprd04.prod.outlook.com (2603:10b6:610:75::25)
 by PH7PR12MB8156.namprd12.prod.outlook.com (2603:10b6:510:2b5::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.25; Wed, 3 Sep
 2025 17:18:24 +0000
Received: from CH2PEPF0000013B.namprd02.prod.outlook.com
 (2603:10b6:610:75:cafe::60) by CH0PR04CA0110.outlook.office365.com
 (2603:10b6:610:75::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9094.17 via Frontend Transport; Wed,
 3 Sep 2025 17:18:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH2PEPF0000013B.mail.protection.outlook.com (10.167.244.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9094.14 via Frontend Transport; Wed, 3 Sep 2025 17:18:24 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 3 Sep
 2025 12:18:23 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 3 Sep
 2025 12:18:22 -0500
Received: from amd-B550M-DS3H.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 3 Sep 2025 12:18:19 -0500
From: Syed Saba Kareem <syed.sabakareem@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
CC: <Vijendar.Mukunda@amd.com>, <Sunil-kumar.Dommati@amd.com>, "Syed Saba
 Kareem" <syed.sabakareem@amd.com>, Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Bard Liao
	<yung-chuan.liao@linux.intel.com>, Charles Keepax
	<ckeepax@opensource.cirrus.com>, =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?=
	<u.kleine-koenig@baylibre.com>, Venkata Prasad Potturu
	<venkataprasad.potturu@amd.com>, Peter Zijlstra <peterz@infradead.org>, "open
 list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
	<linux-sound@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Subject: [PATCH] ASoC: amd: amd_sdw: Add quirks for some new Dell laptops
Date: Wed, 3 Sep 2025 22:47:47 +0530
Message-ID: <20250903171817.2549507-1-syed.sabakareem@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000013B:EE_|PH7PR12MB8156:EE_
X-MS-Office365-Filtering-Correlation-Id: 17090750-0f57-4116-4bbd-08ddeb0de3b3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|7416014|1800799024|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?xxszW5aGrw720uQzF7R1mKlDY1vCfqgDUiGJE3lnwjnAkfw6v2TlvXSnY+82?=
 =?us-ascii?Q?DY+EHnkEP1GiHWb+9IEIjPoRaU2P1Z7UG7G2yW2h4+fKmJM1TzLOGxUUzZS5?=
 =?us-ascii?Q?LLGjWoWcOtpRVGCBzLqwn4opTgyy3xSBO+3fSGFZU/+vG0ZAj9JKxAVuda0o?=
 =?us-ascii?Q?mpLVXxcsbv08WIJ0QiaXX38G7FH8MTCGBq9KWSdAstorc1/NcLOmJwC2l9mA?=
 =?us-ascii?Q?p5J3az5svFkVY2P61SIOrlrZP9TsnsuYhFmpe8/sT+aF86FYP0UBe7V7rQ2g?=
 =?us-ascii?Q?sh5JeJ52KpNe607Vb5FnABlp7+S0ag7dPIvVH/NlWk41AMXFh1pkbrk1agsC?=
 =?us-ascii?Q?+UhBrlcbv8WdM7fzJfJ7AVsx2l5dyy1hF9oQZw4+usDWq6koPyUojtexpLkh?=
 =?us-ascii?Q?FHWaL8WE0zf8Qp9F3nGDNGReOL9VrCb1Up4ao2AP1GoF1sLX+V6vCXK2dhL5?=
 =?us-ascii?Q?oVdTm37/MY/N5OMXDQbDjNMM8SAiL6hN7kXiLF3JbMx0uyqpauGOrPgN+Tpm?=
 =?us-ascii?Q?9Vyd1VxA/HoRdhM9QiVQuHDTIpdGLbgiSj4QBTSjdd7q5SMhyWjPp8EtSHn/?=
 =?us-ascii?Q?QVq2Fdxc3xhXUs6KdEsAEB9Wy+flWUwXD6vSwhb35/JUc6H8YXF4o6g71M3d?=
 =?us-ascii?Q?roLyV/3CFg6T4rxxOOBvOtPGZevfrbfENZI/mp6WgkqUz7ZZaLc8rrNLg0RX?=
 =?us-ascii?Q?rGMtN00vr/r/qcwBW69lef7mssXvnGEzeN4Lbq7VUWD0RY9cmuxECfn9KgD+?=
 =?us-ascii?Q?r8RP4KjGLVyMhdJFR8SMeDDPJlGO3fm0eV7A+IRrfRGMATMkTyF5beCEF/Vq?=
 =?us-ascii?Q?bHS41gLQ/tygOG2ZKTtSeM6kv8whkFjdI5kxmxJQuUJugMip3AumatwkoQFp?=
 =?us-ascii?Q?z0LeKHYsr6B49UdmPIxqAWUC8+OlDcu2Xtflar2jxKYBsdAhwiPj/MJhYy4W?=
 =?us-ascii?Q?emuNhKLqrxXWuoFnx7jLhstkM8j+tmu0V6Q+tuShZIspGfCiM6a32nD5JNlx?=
 =?us-ascii?Q?2OtsUfqFYqok16qV+J8iq6i28xqGpJriS0SUDX1BNrFeZAOtr1apNs6oqDJF?=
 =?us-ascii?Q?9vo01xDfG54TY9IzEWNS9GZMRW+Gf/T9XU/PZi2f6izM25GCs4D5czqAZL8R?=
 =?us-ascii?Q?L97QbfFE787T5NL6tmGDyPTDV8fRIha+vndORxchyfUt04NpRUibdt/8q+X7?=
 =?us-ascii?Q?8eEp/ZdZKt2Yzg8d3ZenYJShf/e08AdFRemCS9c5UMEaGt9qPEEoIDlUU7J/?=
 =?us-ascii?Q?8D53IHTbYHrCFMI+Fh+QcbNWLhgIWejdOqRN0TUKv4C8aXL5M0qe+CEGlW68?=
 =?us-ascii?Q?N16IvKK5xIhJMBFh5VIeYTWIU/qgVPaOpWnpxR+U8tUvbG4Ru1v+AmjsrEh1?=
 =?us-ascii?Q?2kVWkNQZU7gGJGTYAsk9IyExSSjG9FAmp67Kq8I+kYMBXxHdplgX8g4Au9VB?=
 =?us-ascii?Q?TO3Guoc5h/jDM9zYszUxc23UJ4jw6aKOZYR26u02xwNOAhqa58OsagmIlKfq?=
 =?us-ascii?Q?t33CN12L1PVG4N0MlQh8YuAxZMwAQkOzyWLG?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2025 17:18:24.3207
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 17090750-0f57-4116-4bbd-08ddeb0de3b3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH2PEPF0000013B.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8156
Message-ID-Hash: TTONLRRJAET3BIPQKUNKPN7FDBZQ36IW
X-Message-ID-Hash: TTONLRRJAET3BIPQKUNKPN7FDBZQ36IW
X-MailFrom: Syed.SabaKareem@amd.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TTONLRRJAET3BIPQKUNKPN7FDBZQ36IW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add a quirk to include the codec amplifier function
for Dell SKU's listed in quirk table.
Note: In these SKU's, the RT722 codec amplifier is excluded,
and an external amplifier is used instead.

Signed-off-by: Syed Saba Kareem <syed.sabakareem@amd.com>
---
 sound/soc/amd/acp/acp-sdw-legacy-mach.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/sound/soc/amd/acp/acp-sdw-legacy-mach.c b/sound/soc/amd/acp/acp-sdw-legacy-mach.c
index c2197b75a7dd..5a3cfedacbaf 100644
--- a/sound/soc/amd/acp/acp-sdw-legacy-mach.c
+++ b/sound/soc/amd/acp/acp-sdw-legacy-mach.c
@@ -79,6 +79,22 @@ static const struct dmi_system_id soc_sdw_quirk_table[] = {
 		},
 		.driver_data = (void *)(ASOC_SDW_CODEC_SPKR),
 	},
+	{
+		.callback = soc_sdw_quirk_cb,
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc"),
+			DMI_EXACT_MATCH(DMI_PRODUCT_SKU, "0DD3"),
+		},
+		.driver_data = (void *)(ASOC_SDW_CODEC_SPKR),
+	},
+	{
+		.callback = soc_sdw_quirk_cb,
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc"),
+			DMI_EXACT_MATCH(DMI_PRODUCT_SKU, "0DD4"),
+		},
+		.driver_data = (void *)(ASOC_SDW_CODEC_SPKR),
+	},
 	{}
 };
 
-- 
2.43.0

