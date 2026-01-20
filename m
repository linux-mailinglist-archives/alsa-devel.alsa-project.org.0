Return-Path: <alsa-devel-bounces@alsa-project.org>
Delivered-To: lists+alsa-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OD43DBpdqGmQtwAAu9opvQ
	(envelope-from <alsa-devel-bounces@alsa-project.org>)
	for <lists+alsa-devel@lfdr.de>; Wed, 04 Mar 2026 17:26:02 +0100
X-Original-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 74E9920433E
	for <lists+alsa-devel@lfdr.de>; Wed, 04 Mar 2026 17:26:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ECC0B602A6;
	Wed,  4 Mar 2026 17:25:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ECC0B602A6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1772641561;
	bh=RjjIHiJiv9531F94wOoV+dhTPSHhM/Jqw6zMwV4Qfx8=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=RBAbvcDwu3g7qq+W+TnpY3ZjrvDgtJts759PSU1yCFC+xlz1ko9zQ1D26xlGet/lN
	 7M2LPjBkzhbYeI9GIIstdDYUse0WipQT4Z7QeQTSnrzocaugAiPydgXu7GPsuwwfLg
	 81mosiOTS4KUwYeiIrte4WKruGYdgX7YsO7+IKh4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E2792F80632; Wed,  4 Mar 2026 17:25:03 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A4D62F8060F;
	Wed,  4 Mar 2026 17:25:03 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 755E0F804D6; Tue, 20 Jan 2026 05:09:02 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,
	T_SPF_PERMERROR,URIBL_DBL_BLOCKED_OPENDNS shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazon11010035.outbound.protection.outlook.com
 [52.101.193.35])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 79AADF8007E
	for <alsa-devel@alsa-project.org>; Tue, 20 Jan 2026 05:08:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 79AADF8007E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=selector1 header.b=GNm+DUwQ
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WRpd9QUkJAjY6ECqWLgtqBgSs0LPa3a4R+qnH/AhF8m6N3g46cHGacQ5NHdAL5G8gvbpkUuguYw+roHilKeujG8X0nj4bMEs4sOTVLDdf1SgIlpZGjjmcF9CVNNep88DcsMECqlMn2xkxSk+S+95GDentumZqd6bNw4VbV0lOM6rshZZoLNrPjaIRhyu1wEArhlHKemLurQhN4FELDkw0ophvj54OsKu9XlshiBE/4Q6LP8WZMTPIi5u10z+sG+l/YvrssxUkmZ9fKAxEHsV+F6MhZARxEwlUO4h7Deq7hHu2ue9u91+luYMxAvz7H+U63QOQY0BVx4wsKIqYKzojQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d6o0SXukjM95sHW+vmem62SUoopxUUuaVTfthBen24o=;
 b=fzrx1wVELjCNKbBEM9pF9kN26pDmhOS4AVQ12SVA5Emx1A++34uBUs81ZXnCdbCMXMre+41CocHiSqWfqsodV+yU87Ym8grnR8Lw0vvlIDG5qnvOnPF9wOB2U+6ojimVH3Wj10rCMEXvWc1f3NlAvlLFKgjVBYVg/CN/sqi2bYgCa2XlRr8kfVryh0vq2Rr8UXFIK2l0FZ+Mj4UPoN9FW1Q3ANtGDXf5EQBtLjlspyG5AJXCQ9FGNDUk7a/ta8U+xjlH8iQ0CY73wJ44fRewa3NOr/TA2oVE0ojaSFj67SrupKCkC3xqULpo2uX2srDYFjBpgEeE+cLjDXjNlhebWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=intel.com smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d6o0SXukjM95sHW+vmem62SUoopxUUuaVTfthBen24o=;
 b=GNm+DUwQBM4TFeum4Hrl9JOWYA7DlEoPwtXu8Gsil1C+4tDuk//0Wa4n21vmjhbuu5uLKObyEtp2eZ7056CFpQ3CEcI/GX4BlwmtJ7pwki2CDj/mo3hZr/ddmcK7o3BPjk/9xEZoL/Tm8R7m0IaGwq/HanXzP4u582g84xLHN90=
Received: from BL1PR13CA0185.namprd13.prod.outlook.com (2603:10b6:208:2be::10)
 by CH4PR10MB8098.namprd10.prod.outlook.com (2603:10b6:610:238::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Tue, 20 Jan
 2026 04:08:47 +0000
Received: from BL6PEPF0001AB52.namprd02.prod.outlook.com
 (2603:10b6:208:2be:cafe::d) by BL1PR13CA0185.outlook.office365.com
 (2603:10b6:208:2be::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.8 via Frontend Transport; Tue,
 20 Jan 2026 04:08:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BL6PEPF0001AB52.mail.protection.outlook.com (10.167.241.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.4 via Frontend Transport; Tue, 20 Jan 2026 04:08:45 +0000
Received: from DFLE207.ent.ti.com (10.64.6.65) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 19 Jan
 2026 22:08:44 -0600
Received: from DFLE215.ent.ti.com (10.64.6.73) by DFLE207.ent.ti.com
 (10.64.6.65) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 19 Jan
 2026 22:08:44 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 19 Jan 2026 22:08:44 -0600
Received: from LTPW0EX92E.dhcp.ti.com (ltpw0ex92e.dhcp.ti.com [10.82.30.14])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 60K48bIw416239;
	Mon, 19 Jan 2026 22:08:38 -0600
From: Niranjan H Y <niranjan.hy@ti.com>
To: <alsa-devel@alsa-project.org>
CC: <linux-sound@vger.kernel.org>, <broonie@kernel.org>,
	<ckeepax@opensource.cirrus.com>, <lgirdwood@gmail.com>,
	<yung-chuan.liao@linux.intel.com>, <ranjani.sridharan@linux.intel.com>,
	<perex@perex.cz>, <tiwai@suse.com>, <cezary.rojewski@intel.com>,
	<peter.ujfalusi@linux.intel.com>, <kai.vehmanen@linux.intel.com>,
	<pierre-louis.bossart@linux.dev>, <shenghao-ding@ti.com>,
	<v-hampiholi@ti.com>, <baojun.xu@ti.com>, <dan.carpenter@linaro.org>,
	<sandeepk@ti.com>, Niranjan H Y <niranjan.hy@ti.com>, kernel test robot
	<lkp@intel.com>
Subject: [PATCH v1] ASoC: tas2783A: fw loading for devices without pci bus
Date: Tue, 20 Jan 2026 09:38:25 +0530
Message-ID: <20260120040825.1460-1-niranjan.hy@ti.com>
X-Mailer: git-send-email 2.33.0.windows.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB52:EE_|CH4PR10MB8098:EE_
X-MS-Office365-Filtering-Correlation-Id: d48dd34b-35f4-4e72-d53b-08de57d99b42
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|82310400026|7416014|376014|36860700013|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?78RsW0kRQUbrqlVedFp0NtDElwG7f/wTolgWmcvRBCa91pbvX1CK5ywaSJB/?=
 =?us-ascii?Q?G4ymOvYbEeBZt6e9CL9zG7biTqk3RZR8mDlNZedTj/XoJCN5RcqnsvzXhY6N?=
 =?us-ascii?Q?3ovjZ1urCJq1PmxJzohjHwLSvULyI11mGlSwhmHobLdiyG7N4FBm/YpgX9U8?=
 =?us-ascii?Q?qr0nAZ4PWkDFlZLFMaw9AwPIqaVr3fX1YIvq2vtXuphVsya9SFG0rLIfnNI1?=
 =?us-ascii?Q?zJyo+9fr/6YMg2qVJGqGFlJshjB8MB1fh7SpvifxCDwZZ0f5k0hQ1IrJl0AQ?=
 =?us-ascii?Q?BQHFUGBrGW17dKBnDrSq5d/e9YHfLB4ZTpehDZoWKeZ/AOzvqCLmZfDbf/cZ?=
 =?us-ascii?Q?UKXS94fW4P53wIeyTKJgmUa45amakoDXoVb14eA3P1GGumtZBuixjnkiZoZd?=
 =?us-ascii?Q?Ppagbexd6Uf6eFZfhf4jvkF3AsLfEql5w6FMmvAEUCex87vfpn9xrHNLBoxB?=
 =?us-ascii?Q?472bD/aHrmGkYjLX274hWPqAg8pIzo0t9x5LNsIHqsrzm1BHq1nn86u6SFQ+?=
 =?us-ascii?Q?xbm10dx89rKxO26OE0m8vVY9O6U6G7GuOh2KViClWO5AL/m9lBSuHQpqAAwQ?=
 =?us-ascii?Q?uNSywvhyqnJO7EUiQhFx31jh0HJVoTEgIcA/WsM/1Wp/W/6HKPMfyaTjHJOw?=
 =?us-ascii?Q?55ngU2lALfFZF8t+QjrwUa25Ypt5oZ43kk3H58ll1eYT371ysyWd1gQodcWM?=
 =?us-ascii?Q?njQU37ckEgvPWLwrvRb/w9SJrHAssxZBXte4d5eJMlha4WBLKuBj1p4FaDB/?=
 =?us-ascii?Q?9H8qZgpiPK2AXCKiU3dZgLc/WH+Nd0WSGaQIj7HRjctPP+G6t0/P19tVKzrg?=
 =?us-ascii?Q?IZvTd/Pf8X/YxX7S9Du4VIzvoBqwvOIWKWntJwmverD1fxe5SMJ9TC0cis5N?=
 =?us-ascii?Q?3rXf8kpPon/E9RUg+4D2B7TK0BPdsj9jXnel5By2fVOGclNxQZxkleW39gh2?=
 =?us-ascii?Q?d+xZAia427+hjcn/AlZDblBWjLE9jAu5R/nUijGT8LRsqRbINa86f3LabWmt?=
 =?us-ascii?Q?1yGXRpITqoOTfWD+CUMkZXOrzxJpTPCR1g8810/93M9kZyEkgiVUKKVXGHLX?=
 =?us-ascii?Q?v4RaxqsM9Z7cJF34NX4V2ulblA8UhSMqK2dZ8qtLshWUzLFj4qdY/jDiY9qc?=
 =?us-ascii?Q?g6pm5sHg8KOiFBuQbqBoWarnDYPNeqy/MQFW27am0o3hT+eJlR8ZDkw+od0J?=
 =?us-ascii?Q?5qutcDbbLQ1iHyT1/qW4oCKd4vk6qrTh3cYe9ZovWla6Fr7JLOZp2kXNyd+n?=
 =?us-ascii?Q?JXAIUvyxXc3eWaaVc/u8STkvhloz3NYAPnHobvoZTRVF3cZh8jjP5iokwIHJ?=
 =?us-ascii?Q?5hp/4ykNm629Fnpr/fVRa+MR0VWQJhcXCIJgQSgbRBXd/71Q0VA7djl7NXvV?=
 =?us-ascii?Q?AYJUius4chPvx8SimVj88hfJmYXpuPGd/LhmRrKulLNIG47nTJEB7gXkeZZu?=
 =?us-ascii?Q?k7XWldAO9/+eJBOWZYt5jCVzwlKeBH/KLBXiUXTFMah9/olyQc4QO0qp16j7?=
 =?us-ascii?Q?TGLUCzmDu6pjbXU37E0YtGeuUhT0LANyfJw9S98YvKodkv6U0spoChTNqEqD?=
 =?us-ascii?Q?rsDVJZJGfMedLSwPF045+szjAwdUxVvJKw2EWAU9y3SiirgDAxFHP7yCQ6yH?=
 =?us-ascii?Q?N4wLqyHaY0B+/CMUfysy0MIzeaq1qUgujRVaATvTyRuPN/YAn6V/yr/2RSPI?=
 =?us-ascii?Q?2CrVgQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(7416014)(376014)(36860700013)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 04:08:45.6331
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 d48dd34b-35f4-4e72-d53b-08de57d99b42
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL6PEPF0001AB52.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH4PR10MB8098
X-MailFrom: niranjan.hy@ti.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: PODMIXCTEPWRKQT5V2QS7R77B62XZ5ZK
X-Message-ID-Hash: PODMIXCTEPWRKQT5V2QS7R77B62XZ5ZK
X-Mailman-Approved-At: Wed, 04 Mar 2026 16:24:48 +0000
X-Mailman-Version: 3.3.10
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PODMIXCTEPWRKQT5V2QS7R77B62XZ5ZK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>
X-Rspamd-Queue-Id: 74E9920433E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.29 / 15.00];
	DATE_IN_PAST(1.00)[1044];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[ti.com,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[alsa-project.org:s=default,ti.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+mx:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,opensource.cirrus.com,gmail.com,linux.intel.com,perex.cz,suse.com,intel.com,linux.dev,ti.com,linaro.org];
	ASN(0.00)[asn:16019, ipnet:77.48.128.0/17, country:CZ];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[12];
	FROM_NEQ_ENVFROM(0.00)[niranjan.hy@ti.com,alsa-devel-bounces@alsa-project.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[alsa-project.org:+,ti.com:+];
	PREVIOUSLY_DELIVERED(0.00)[alsa-devel@alsa-project.org];
	TAGGED_RCPT(0.00)[alsa-devel];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[alsa0.perex.cz:rdns,alsa0.perex.cz:helo,intel.com:email,ti.com:dkim,ti.com:email,ti.com:mid,alsa-project.org:dkim]
X-Rspamd-Action: no action

Currently, there is compilation error when the
CONFIG_PCI is not enabled which is used for creating
firmware name. This commit address this issue by adding
fallback mechanism to construct unqiue name by using
SounWire slave's link and unique ids alone when the
CONFIG_PCI is not available.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202601190756.IpoMY5AJ-lkp@intel.com/
Signed-off-by: Niranjan H Y <niranjan.hy@ti.com>
---
 sound/soc/codecs/tas2783-sdw.c | 45 +++++++++++++++++++---------------
 1 file changed, 25 insertions(+), 20 deletions(-)

diff --git a/sound/soc/codecs/tas2783-sdw.c b/sound/soc/codecs/tas2783-sdw.c
index 2851ce19f..193aee865 100644
--- a/sound/soc/codecs/tas2783-sdw.c
+++ b/sound/soc/codecs/tas2783-sdw.c
@@ -27,7 +27,9 @@
 #include <linux/soundwire/sdw.h>
 #include <linux/soundwire/sdw_registers.h>
 #include <linux/soundwire/sdw_type.h>
+#if IS_ENABLED(CONFIG_PCI)
 #include <linux/pci.h>
+#endif
 #include <sound/sdw.h>
 #include <sound/soc.h>
 #include <sound/tlv.h>
@@ -1106,21 +1108,33 @@ static const struct dev_pm_ops tas2783_sdca_pm = {
 	RUNTIME_PM_OPS(tas2783_sdca_dev_suspend, tas2783_sdca_dev_resume, NULL)
 };
 
-static struct pci_dev *tas_get_pci_dev(struct sdw_slave *peripheral)
+static void tas_generate_fw_name(struct sdw_slave *slave, char *name, size_t size)
 {
-	struct device *dev = &peripheral->dev;
-
-	for (; dev; dev = dev->parent)
-		if (dev->bus == &pci_bus_type)
-			return to_pci_dev(dev);
+	struct sdw_bus *bus = slave->bus;
+	u8 unique_id = slave->id.unique_id;
+	bool pci_found = false;
+#if IS_ENABLED(CONFIG_PCI)
+	struct device *dev = &slave->dev;
+	struct pci_dev *pci = NULL;
+
+	for (; dev; dev = dev->parent) {
+		if (dev->bus == &pci_bus_type) {
+			pci = to_pci_dev(dev);
+			scnprintf(name, size, "%04X-%1X-%1X.bin",
+				  pci->subsystem_device, bus->link_id, unique_id);
+			pci_found = true;
+			break;
+		}
+	}
+#endif
 
-	return NULL;
+	if (!pci_found)
+		scnprintf(name, size, "tas2783-%1X-%1X.bin",
+			  bus->link_id, unique_id);
 }
 
 static s32 tas_io_init(struct device *dev, struct sdw_slave *slave)
 {
-	struct pci_dev *pci;
-	struct sdw_bus *bus;
 	struct tas2783_prv *tas_dev = dev_get_drvdata(dev);
 	s32 ret;
 	u8 unique_id = tas_dev->sdw_peripheral->id.unique_id;
@@ -1128,13 +1142,6 @@ static s32 tas_io_init(struct device *dev, struct sdw_slave *slave)
 	if (tas_dev->hw_init)
 		return 0;
 
-	pci = tas_get_pci_dev(slave);
-	if (!pci) {
-		dev_err(dev, "pci device id can't be read");
-		return -EINVAL;
-	}
-
-	bus = slave->bus;
 	tas_dev->fw_dl_task_done = false;
 	tas_dev->fw_dl_success = false;
 
@@ -1145,10 +1152,8 @@ static s32 tas_io_init(struct device *dev, struct sdw_slave *slave)
 	}
 	usleep_range(2000, 2200);
 
-	/* subsystem_id-link_id-unique_id */
-	scnprintf(tas_dev->rca_binaryname, sizeof(tas_dev->rca_binaryname),
-		  "%04X-%1X-%1X.bin", pci->subsystem_device, bus->link_id,
-		  unique_id);
+	tas_generate_fw_name(slave, tas_dev->rca_binaryname,
+			     sizeof(tas_dev->rca_binaryname));
 
 	ret = request_firmware_nowait(THIS_MODULE, FW_ACTION_UEVENT,
 				      tas_dev->rca_binaryname, tas_dev->dev,
-- 
2.43.0

