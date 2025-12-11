Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D5D5DCB95CD
	for <lists+alsa-devel@lfdr.de>; Fri, 12 Dec 2025 17:53:21 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B965C6023D;
	Fri, 12 Dec 2025 17:53:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B965C6023D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1765558397;
	bh=v3Zl5QS7F29UwT2sPJFw5g/7aKouBjLvi8+vHZe2K+8=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=RKOkOMF4LAvcsicYz1TzxJ3HMDE0nxpqF/GZuii+uIfRlkaJZmN/xxY3mgOUvVALz
	 fPr1xXj2DWGk0Q6psYZiV2f9PVF1MAhl+4mVyMcJWOyy8EZMnWaNqhv2H/nJxuwaEe
	 1hUKwTwiaFnBa44ZHHjFsdWRk5WC7urZ2l+yMWms=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EC8D0F805D2; Fri, 12 Dec 2025 17:52:38 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9051FF805F6;
	Fri, 12 Dec 2025 17:52:38 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EFA6FF804CC; Thu, 11 Dec 2025 10:25:08 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.3 required=5.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,KHOP_HELO_FCRDNS,T_SPF_HELO_TEMPERROR,T_SPF_TEMPERROR
	shortcircuit=no autolearn=no autolearn_force=no version=3.4.6
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azon11010054.outbound.protection.outlook.com [52.101.46.54])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9159EF80093
	for <alsa-devel@alsa-project.org>; Thu, 11 Dec 2025 10:25:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9159EF80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=selector1 header.b=J8DcNM/R
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P7kIxRZD9O9FU6+0WOwii1U/QDx7vOu01ndGYFmfllPdimWLD9j5dlWu1nZyk4FDh0EBLOI4BYiTCQM13bYVw0sFqVaZlfQ/0DzE4WRBz6K+XftFSkEQV+OFknuWF7XzGojp2id2ubaK5EntIZQrRwgqN5MvdvhVvBRHoff3rXzooa0XzL6cSjrjaqOBdoYA/iL2kg06xIqtgNGRopVmoVranrWDyEBXHyR64YdeavVjWtpYwZuN3QdQZSTYuA3QLplfQPcJ3boBob9Z7vyQwCJYNWJmZEVe2wqPiN15vnEw5hIdw2RPfU+rsdI6cX8ZtZI18tfQcNP5oxJjOQmqfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BJ9ZGCFiJ8/3fufb4jNa5wTzJYrZWJNYmKx5sKqv27k=;
 b=KjvZW08r3J9tvTR7ngmiwUpnHAB+jubnYQ+Aa5+zu91UEdCRsTDb67JyTt7qrOyaOEl+sl7hv6Xp8uuem8VZZ9x3unDbTDYuCAvcNIoQzQ2ou8maQ2OdSIezql24+NRuK8LABV40RjtmdweylQ+GyfTeUEZ/Sby3qjDBWjXYI32W8NcR3B57JimPLotn0t0rwf3rty4dh4ch3iGGZe27K8hWqZDZqUgurElfhtZhMnMFzBnsWixzR8LFHT7dJ1pDKzw2CXIsWnoKwANa+qRI4i/dXXj5sQCa4s/c1IBjCHwcoO2P4Q4QIO0htIejGIGwuZKrJTpdqajQU5m2EIKe0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=canonical.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BJ9ZGCFiJ8/3fufb4jNa5wTzJYrZWJNYmKx5sKqv27k=;
 b=J8DcNM/RJVN4isQZ085R1yIYfc9vckL8AT+stsKeCp79IkjJQtGHaZzHP6J1RknU4mdaLZhdfvndjtpI6MyRsEf7Bw0fBBnS3eLKb+s55naClXiBPw9AnW54VS+FgPvxbzE2D6SgxA76RCpfNUzPg2RCU00OnzceMq6iTkVIjQU=
Received: from SA9PR13CA0111.namprd13.prod.outlook.com (2603:10b6:806:24::26)
 by LV3PR10MB7916.namprd10.prod.outlook.com (2603:10b6:408:218::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.9; Thu, 11 Dec
 2025 09:24:57 +0000
Received: from SN1PEPF000397B4.namprd05.prod.outlook.com
 (2603:10b6:806:24:cafe::fd) by SA9PR13CA0111.outlook.office365.com
 (2603:10b6:806:24::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.5 via Frontend Transport; Thu,
 11 Dec 2025 09:24:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 SN1PEPF000397B4.mail.protection.outlook.com (10.167.248.58) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9412.4 via Frontend Transport; Thu, 11 Dec 2025 09:24:55 +0000
Received: from DFLE208.ent.ti.com (10.64.6.66) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 11 Dec
 2025 03:24:52 -0600
Received: from DFLE206.ent.ti.com (10.64.6.64) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 11 Dec
 2025 03:24:52 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE206.ent.ti.com
 (10.64.6.64) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 11 Dec 2025 03:24:52 -0600
Received: from lelvem-mr05.itg.ti.com ([10.250.165.138])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5BB9Okn4235351;
	Thu, 11 Dec 2025 03:24:47 -0600
From: Baojun Xu <baojun.xu@ti.com>
To: <tiwai@suse.de>, <hansg@kernel.org>
CC: <ilpo.jarvinen@linux.intel.com>, <broonie@kernel.org>,
	<andriy.shevchenko@linux.intel.com>, <alsa-devel@alsa-project.org>,
	<shenghao-ding@ti.com>, <13916275206@139.com>,
	<platform-driver-x86@vger.kernel.org>, <linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <baojun.xu@ti.com>, <letitia.tsai@hp.com>,
	<bill.yu@canonical.com>
Subject: [PATCH v1] ALSA: hda/tas2781: Add new quirk for HP new project
Date: Thu, 11 Dec 2025 17:24:26 +0800
Message-ID: <20251211092427.1648-1-baojun.xu@ti.com>
X-Mailer: git-send-email 2.43.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000397B4:EE_|LV3PR10MB7916:EE_
X-MS-Office365-Filtering-Correlation-Id: d0f354d7-76d3-4a5f-8b2f-08de389725a8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014|7416014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?oHO6tQEL3AtxHB9BwwQCf7vvPcaudFbspj/KGzywFNf26xQbSZc0x4OqatF8?=
 =?us-ascii?Q?0FPb+I7G5d9E7adWlDhadwnZThodzEy3tOEYEemU8YxeZRm/gKvoqOFem0Ik?=
 =?us-ascii?Q?zieusMEN/15zbjH7Hc815KZIAF5xwPCQSHoAQvhn6gETE1HZVA4Yz5ygwGHi?=
 =?us-ascii?Q?c659oYoU/bWuNhMW8PebhG9zTOBq50MHaINbCGeMMakhv65jYw6mIMDE71As?=
 =?us-ascii?Q?zpqQ8op3sosFCPdAivil6eGjKChacczAplmy6If5+RB/J1Lz6prgVaVBSD4e?=
 =?us-ascii?Q?NgVTFsnDZHoXmojUPp2AmzHl+mfD6DQ/f1WsOq8Bj2HubHv9m74aSR50E/Fa?=
 =?us-ascii?Q?hDXL/53VguAFfzb2/We3l80U+3Q516peY+QG+2+Kmu+xdZuzusir8cbp6r+V?=
 =?us-ascii?Q?x4+AAHHHFXe+w4TXG6kKXeYitSxtcsNWCvMfkb0DD6IfuCWy7MMDIk0dEjHE?=
 =?us-ascii?Q?8+AE73GqthsqhTXxEaytUmS2xPEUmNKV7OxWCtIdhhx/4WQ2506zzfWgkWkl?=
 =?us-ascii?Q?7bfD4XGCDFxZFOjDU1xP5XUKCuTPZME49bokroKuHP+c5Mh5flSYrB1ga55l?=
 =?us-ascii?Q?DkPIyOCHKwcMUbgm4YbZ19MyxqhdFviz6iTnOe+hGRGIy4/8pBzn/NEk+GrA?=
 =?us-ascii?Q?LQ0B6LAMPT5Zg19wKrjzON5bsbWmH1+dYN/VgfPYfo8yyYlzzwToWOfJnT7D?=
 =?us-ascii?Q?SCw8nfrVvGS/JFkjhYvwN8WjsZsgzLzqO6hrIntTU47Og2v/maZnT6lunJT/?=
 =?us-ascii?Q?1VfQ5R+hM6zviZx5iIqofjXth+vMXEbZQHofYq2X9XaIV8+f+38iR5H7p5IB?=
 =?us-ascii?Q?Lwrd7d3I3iws3kw8HSxC53nqDS1LBgZoTyq9YDV1j4jW7/cfoty+kfZP6F2D?=
 =?us-ascii?Q?2SiWQl+alqCZmRtHUSQR34HPxbDg8mmMWtPOlRLPG52uyrMRvQHFZ7HA1j9/?=
 =?us-ascii?Q?5FuvYQG9oQ5N1aqrfE/WsKtfKkwo4kZG+0+NUJx83e3VVXajvvlajlN81IHe?=
 =?us-ascii?Q?ZVOOzoFgpiDg1hQym/SgAosVBKrNHJ5IbjXq+OYsbTBYInzLufQIfQnuBGHV?=
 =?us-ascii?Q?gAiT0M2/oRmBho2TlBHGifIte9EjUUQ8Kv5xTd/NDvWLhqmKAM0lrmqnD6HQ?=
 =?us-ascii?Q?T1ozdh3ympEf91My/PHQPjR+w6zuVfvp0xjCuocBtdlbNTtTTfJvJoVw1YdZ?=
 =?us-ascii?Q?A1fc+lRUuqJLMUEnDWimHZ/OwHqreGH3+AI6gBGB97Jbi9MljdC5aJ2r+gJe?=
 =?us-ascii?Q?TmXqXk4Cxv07+p4wSR+x8wSyzJ/SAIOr2KhmcCefJUN0cOW48Z6ZQEw/ho90?=
 =?us-ascii?Q?HyPbyRzMJCvp1d+K7XTeUdk1hZg1Nyk2tzuoMd+sIN0FilD4054RVh1CbYZu?=
 =?us-ascii?Q?gSu5kHnOajSjo8nqOzmzBPj8G2G5oQNcRmoB8xb4SX6AuR6QpbUMzhNMHJLt?=
 =?us-ascii?Q?BCnVLERENZ81N9R10k37e///Rh8jr8gOjet96MYH1TsYjzB+px3FbgpQ93lT?=
 =?us-ascii?Q?JDWRdLg2xR03pPk5Tvbc9tuu+4QoOsqJSxusPHKH+A4HkWzGTcxaGnmqlrvz?=
 =?us-ascii?Q?eVMkCUlrT1i0wyjDG8w=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014)(7416014);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2025 09:24:55.5936
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 d0f354d7-76d3-4a5f-8b2f-08de389725a8
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SN1PEPF000397B4.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR10MB7916
X-MailFrom: baojun.xu@ti.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: PTU75P556MPHKOQLNAGJEZ3AWBX6WN4C
X-Message-ID-Hash: PTU75P556MPHKOQLNAGJEZ3AWBX6WN4C
X-Mailman-Approved-At: Fri, 12 Dec 2025 16:52:14 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PTU75P556MPHKOQLNAGJEZ3AWBX6WN4C/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add new vendor_id and subsystem_id in quirk for HP new project (NexusX).

Signed-off-by: Baojun Xu <baojun.xu@ti.com>
---
 sound/hda/codecs/realtek/alc269.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index 9510aa2f1bda..171a71457ec3 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -6770,6 +6770,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x103c, 0x8e60, "HP Trekker ", ALC287_FIXUP_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x103c, 0x8e61, "HP Trekker ", ALC287_FIXUP_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x103c, 0x8e62, "HP Trekker ", ALC287_FIXUP_CS35L41_I2C_2),
+	SND_PCI_QUIRK(0x103c, 0x8e8a, "HP NexusX", ALC245_FIXUP_HP_TAS2781_I2C_MUTE_LED),
 	SND_PCI_QUIRK(0x103c, 0x8e9d, "HP 17 Turbine OmniBook X UMA", ALC287_FIXUP_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x103c, 0x8e9e, "HP 17 Turbine OmniBook X UMA", ALC287_FIXUP_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x103c, 0x8eb6, "HP Abe A6U", ALC236_FIXUP_HP_MUTE_LED_MICMUTE_GPIO),
-- 
2.25.1

