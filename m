Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DDC8A591B1
	for <lists+alsa-devel@lfdr.de>; Mon, 10 Mar 2025 11:49:16 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E575360738;
	Mon, 10 Mar 2025 11:49:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E575360738
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1741603755;
	bh=t661xpz0psPhm1HBFqyIVFWiRHo+OYAblfstEUMjzbw=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=IZikOC2djaC1Q17BIZzOxzKT1+1lEjysC/WV1JayboMX1s6JvRvgW9AX7nfwAMbcw
	 PnWPROQaY5Whn+/sb4J+rsiFpe8Jth6A2g3Vmd1PiVaOvH6ciLcv5ncRcsLzPe4oNH
	 QfT9MpH1vtcugEAMUqIVlf3LBw9e4zDxvx5iMQoU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 58AADF80698; Mon, 10 Mar 2025 11:47:29 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3B821F805F6;
	Mon, 10 Mar 2025 11:47:29 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CA356F805FF; Mon, 10 Mar 2025 11:47:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on20617.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2407::617])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BDAD8F80683
	for <alsa-devel@alsa-project.org>; Mon, 10 Mar 2025 11:47:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BDAD8F80683
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=Ccq4ANA9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZV70bano5TN5vAEr/cn86OGDqhtn+CYJYs47JBP1M/zOtIdCnyEbdL0XV4WHEgVZ1lwAp4yZSNLZc1KM64E95XFB5PUCSkN7jCRFNEnwN4ziU5aV8Ed2lflCowl/50cJvH0ORMJxqp46fS6w/9VqzR6w2t5bB4E2QSYRNp/goX4Qnd09BjXC5NNgwpeMMc/WbeyzjVVWuZXIJpBThlSzHnyw8fEMHbsm0NPfyNoCfemXwxc2zbgvPmUlTMlIMQ11gmRVxxoQ3k4uEdDvfU0yQ+m4QomkCBDpeH+VCs+CkVBw8IjFSXxDgNO3CYurazv5PQPTe7RM5OcRrVYQSyeJ8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g5NhkVKbsZ50z1DaXBL29hyG6g17nvFphx4rIeaCPjc=;
 b=mk1JEuThyH9jTGic0GA2x2DFAej01q0Sh5aT8uSCgc/rcbRDBQHjIyKzMPn1Mp1xKxDqTgrWHNqD0CuaF710erc2LJ2Aj1ASabBoJ6i1MJS1UdEfqVzoedOYy+JHw0yRHa6jz3nA1pSMESGLzAEyYCzGgcek4HRZU+NG9KQJdWFRjt2JRS24IoFMlgNbtnUqineCpCmdUZHz1qSVNzNYApAFtKnHtzikepADXEX7knV5IOtOb0ynrR81ykAN746AxqhT8UWgQvih0uO0ZXag71eS8LS9BJXpdcnY2Tsnvz/gA88uB0E6PECOa2EHLVNiFoDT5iRUORh3xZxjHYNNow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g5NhkVKbsZ50z1DaXBL29hyG6g17nvFphx4rIeaCPjc=;
 b=Ccq4ANA99ii00HioAZDeJDN+pBss15dbAJf+BBt41Ad0J+qQhkzuumSQLWtbzaRpgXrx/1gO/Vbg6OqXR1qm1jeUijFbcqTaY14hvuLy6eV4aBTvWvYZZ8jeht2FYHLvqMyU1J+mOZ5r+nmFc0LCKLhjOqYR2sBHUj2zNyUgu8g=
Received: from PH7P223CA0006.NAMP223.PROD.OUTLOOK.COM (2603:10b6:510:338::27)
 by BL3PR12MB6473.namprd12.prod.outlook.com (2603:10b6:208:3b9::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Mon, 10 Mar
 2025 10:47:18 +0000
Received: from SJ1PEPF000026C3.namprd04.prod.outlook.com
 (2603:10b6:510:338:cafe::8a) by PH7P223CA0006.outlook.office365.com
 (2603:10b6:510:338::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8511.26 via Frontend Transport; Mon,
 10 Mar 2025 10:47:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF000026C3.mail.protection.outlook.com (10.167.244.100) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8534.20 via Frontend Transport; Mon, 10 Mar 2025 10:47:18 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 10 Mar
 2025 05:47:12 -0500
Received: from prasad-lnx-mach.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 10 Mar 2025 05:47:08 -0500
From: Venkata Prasad Potturu <venkataprasad.potturu@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
CC: <Vijendar.Mukunda@amd.com>, <mario.limonciello@amd.com>,
	<Basavaraj.Hiregoudar@amd.com>, <Sunil-kumar.Dommati@amd.com>,
	<syed.sabakareem@amd.com>, Venkata Prasad Potturu
	<venkataprasad.potturu@amd.com>, Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Jeff Johnson
	<quic_jjohnson@quicinc.com>, Greg KH <gregkh@linuxfoundation.org>, "Peter
 Zijlstra" <peterz@infradead.org>, Murad Masimov <m.masimov@maxima.ru>,
	Muhammad Usama Anjum <usama.anjum@collabora.com>, "open list:SOUND - SOC
 LAYER / DYNAMIC AUDIO POWER MANAGEM..." <linux-sound@vger.kernel.org>, "open
 list" <linux-kernel@vger.kernel.org>
Subject: [PATCH 08/14] ASoC: amd: acp: Move spin_lock and list initialization
 to acp-pci driver
Date: Mon, 10 Mar 2025 16:15:55 +0530
Message-ID: <20250310104601.7325-9-venkataprasad.potturu@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250310104601.7325-1-venkataprasad.potturu@amd.com>
References: <20250310104601.7325-1-venkataprasad.potturu@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: venkataprasad.potturu@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000026C3:EE_|BL3PR12MB6473:EE_
X-MS-Office365-Filtering-Correlation-Id: f91d68d3-91a8-451a-7830-08dd5fc0edb1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014|7416014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?MamCW/QdJ53r+URfbw5r0R8+odltODSslqP+0+Q6asztIXyv544bbRJs9n8B?=
 =?us-ascii?Q?NaJU/LiuIZFQqDXIp6TBLZUyqK8LiaGRIheJ7+ZXQX4vuBJix/EwSQ4NjL/Y?=
 =?us-ascii?Q?0Tqco9hd79YH2d8/rDZcfRXYq72oE2D+fr32ixWZ2aRI1pKMf5EAaPflL36Z?=
 =?us-ascii?Q?uKoVH0gEmwenqfkrEsgAlj7jWVUOk2gAn6Jl0ETKgniU8ItG7ZwmV1gmD2r6?=
 =?us-ascii?Q?6NaACxwnuCveTTQShG8hJ+kefptuBKTYlp1kGMDt1rI3f9BEydchYDjeWh+r?=
 =?us-ascii?Q?RCLbmNsNNK6r7i7DlZBYo2RHN635oSGSrvFL5PzR83GMV4M+01FaZLfULt5d?=
 =?us-ascii?Q?kcjAXN3N2lEvvA88oTrEf+6uIXPwgjefnsdhnOucXygT+eodcYsO/xNns0xQ?=
 =?us-ascii?Q?GhzAwdPpR9C6bKBERA9HtWU6sZyNR+xWRhb86wE2A/3H9gXHKjfdivMzmJsT?=
 =?us-ascii?Q?xJ1FfKsvNKUKvlxkUTBrbCoGKaJ7STjEV786R47f9KD+ajNGxa3LC3o7nrHE?=
 =?us-ascii?Q?KJM2CpgwnQFoOG7mv5O0DvPJYFPcqVlqobDsV816BBRTYJTNyyonRhCmxW+W?=
 =?us-ascii?Q?+j0lId4EhYZ1TobOPFOAYPdvHbQ38gx/aDHR7L3+RqBmA40QBiHfZM+VMR1h?=
 =?us-ascii?Q?9RMKIZ3AFOBVJy4yZUAPkcEcS+zVBaMqAfeffEZfsSMTPSfhBuO0g2ItwV/k?=
 =?us-ascii?Q?wNVUWNEda4mBSFdQuW07oDrb+yJM+gYRGUhxhyrGUgcgkgPSp/O7kRWa+Xv4?=
 =?us-ascii?Q?DCEJ1fA7EOjz+dkwWU1FT03UuJTzT6tO6MjCD+nDfWQ/+JtUXB+b/vDjhXwA?=
 =?us-ascii?Q?MtqikBh9V/H+sEtxpY6UQetjqFD/hzm+DX8a085bHPvrEeM1wq4yKiTTWxQJ?=
 =?us-ascii?Q?O9LGyNmdporOOHMQ82jzCreu1ytFdxX48CIcOObG/nunTPX+Zzq14eStGd8q?=
 =?us-ascii?Q?4CngFnfyKSn2I1X2QTP3sHlalKQdud0ADtStgHKTjMZmvY+JsyeFogsKNVtn?=
 =?us-ascii?Q?25tdNz+HIdLreFiG8Y2unixCyeYKrLZvhmdHiVt3u39a2LLqf5xekkA6/g2h?=
 =?us-ascii?Q?KWEglMdH0d0kGgoRPQgKhUyb4WppZtYxBDMJi2YDjBGZQdeV+hKmTN4OeJ98?=
 =?us-ascii?Q?MArxtq6yFdWW4vpT4KEb14vJZ4jBf+eODijVd7n/r1qSC7s14YRYeFdt1YcY?=
 =?us-ascii?Q?dQVIsD1YXq0qVocWGfW8U6gKP4/yXTT1vHG9eUYIZYxjFEJ2RD9IZNZhmdNk?=
 =?us-ascii?Q?k49WDzK7ryQX4jDPRQ4vXf530FSGjacS+qCHGCd48osHny6kvZz1cWSKZZIs?=
 =?us-ascii?Q?nPJ2DmN/R9vB2To96WteCKZ6RugRxGqe0NKMq7YqIgvlXIpjUXxA0RG29poQ?=
 =?us-ascii?Q?9Jl8qLqcIugla9uGavn3/HplV1/XdogHn9z/hx8ZcSnL9KtiGIZoHfdL08/h?=
 =?us-ascii?Q?0xGwek7e8q8JuEXtKsEDS+FWr7LuPWCR+F3n4H1j/d+L3jvjs5heKVuqnN9B?=
 =?us-ascii?Q?jxcBZc/xdnWfYEk=3D?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014)(7416014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2025 10:47:18.0949
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 f91d68d3-91a8-451a-7830-08dd5fc0edb1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ1PEPF000026C3.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6473
Message-ID-Hash: FYBDWKRPX67TICVKOXCAE4EMN4BX2URB
X-Message-ID-Hash: FYBDWKRPX67TICVKOXCAE4EMN4BX2URB
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FYBDWKRPX67TICVKOXCAE4EMN4BX2URB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Move spin_lock and linked list initialization from platform driver to
acp-pci driver.

Signed-off-by: Venkata Prasad Potturu <venkataprasad.potturu@amd.com>
---
 sound/soc/amd/acp/acp-pci.c      | 3 +++
 sound/soc/amd/acp/acp-platform.c | 3 ---
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/amd/acp/acp-pci.c b/sound/soc/amd/acp/acp-pci.c
index 8c47a5e1bb0a..e89b39190200 100644
--- a/sound/soc/amd/acp/acp-pci.c
+++ b/sound/soc/amd/acp/acp-pci.c
@@ -196,6 +196,9 @@ static int acp_pci_probe(struct pci_dev *pci, const struct pci_device_id *pci_id
 	chip->dev = &chip->acp_plat_dev->dev;
 
 	acp_machine_select(chip);
+
+	INIT_LIST_HEAD(&chip->stream_list);
+	spin_lock_init(&chip->acp_lock);
 skip_pdev_creation:
 	dev_set_drvdata(&pci->dev, chip);
 	pm_runtime_set_autosuspend_delay(&pci->dev, 2000);
diff --git a/sound/soc/amd/acp/acp-platform.c b/sound/soc/amd/acp/acp-platform.c
index 8d61e1991e4f..b3eddf76aaa4 100644
--- a/sound/soc/amd/acp/acp-platform.c
+++ b/sound/soc/amd/acp/acp-platform.c
@@ -343,9 +343,6 @@ int acp_platform_register(struct device *dev)
 		return status;
 	}
 
-	INIT_LIST_HEAD(&chip->stream_list);
-	spin_lock_init(&chip->acp_lock);
-
 	return 0;
 }
 EXPORT_SYMBOL_NS_GPL(acp_platform_register, "SND_SOC_ACP_COMMON");
-- 
2.39.2

