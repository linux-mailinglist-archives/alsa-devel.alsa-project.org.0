Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 21C9BCC6BA8
	for <lists+alsa-devel@lfdr.de>; Wed, 17 Dec 2025 10:12:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4C12C60260;
	Wed, 17 Dec 2025 10:11:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4C12C60260
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1765962720;
	bh=ZHMfImcMkoQ3qw9pks/IWM4uZUMW69szKXc2nql1Asc=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=vUe6j1Uu7lyfcEJpNLFGc/NDzNXvVWvODE9jpq78K3aUb8WKFhBxokwFcqdCCw8rV
	 iuxuAcdsZWbaxZlvPROyGroLY+GfdUs/c6KjUICIl+ZLazHDh0wh/tihdL3fDJSS4P
	 8prvCWPE67p+kzf54f3ph6eGXyP19uN8qK5KWl5w=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 47B85F806AF; Wed, 17 Dec 2025 10:10:19 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 56912F80696;
	Wed, 17 Dec 2025 10:10:19 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 99A89F800BA; Mon, 15 Dec 2025 16:33:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.3 required=5.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,KHOP_HELO_FCRDNS,T_SPF_HELO_TEMPERROR,T_SPF_TEMPERROR
	shortcircuit=no autolearn=no autolearn_force=no version=3.4.6
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11013009.outbound.protection.outlook.com
 [40.93.201.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B7F1BF800BA
	for <alsa-devel@alsa-project.org>; Mon, 15 Dec 2025 16:33:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B7F1BF800BA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=selector1 header.b=nGTUbOOL
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n7w/fDpqTXqAd7qLz7tHqzDd9/GmdfCWfXgtF1hk80GBGofKDCQrv1Y/nOaAzoHcB48JL2S/MANL/2FB4yoKUmtJ9tfBYuNZZg5RLCo0QyM3eE17+VauXc7XC7hloVE3MQrBQg7LoiPyRcW/AVhGhNwZYuV+klcdvGSzdiSGJPaVH1updqYnZhwPN17jGHACaGEQ2TeSAgISHGO5psNf6MUSE2Q2jKbowZFuXGehCnEAbZqhbBAqQPFO4zlxvDuxphN53BWpFMuIzXOjvsPPj7Ue+9LOzSoZzaRGlEwEi61kAPmWWCmE3+8SpANayOUUqJs67r5cqRTcUojZUueMIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mzy/NEOIRu9EYeXvSjar+iFIYO+AfDCKmksy7eMfgCQ=;
 b=mOf/fKLhOQ3ZjyhHArbuu9XT9+PI8/P//GEzu+afeYbLxEPZkQDHAF47MUoK9k79RXvrf3pIfsz5s4rG138C9FBRHoeVsWKUOhnKxnpEh8fH6BbHF1RSZLoGtjAD5mzx5lF2J1ssvmpngLPFMlv0yjdjgys8pDWuNs5ECjJcZrIx4OedHKKgWhSLKPNRVlSH7u4cC+aeKbeRr62YYQUAEkvNvDRgvAahOjb+zV8GdBtoNBvklb5ve7L5sCTpfwE0yZxftiSrtbeXTN5i+ut+sPPjLaVFGP0BTUb4xASgH0g8u7glpeeQvsx/9MPcmyVUSI2L2TQgB0h0fwSHCGqb3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=linaro.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mzy/NEOIRu9EYeXvSjar+iFIYO+AfDCKmksy7eMfgCQ=;
 b=nGTUbOOL29HMQ3tnwSzC4en/5Jv+bA8L/0o4pDw2fl57rC6DiXLrOvl0fJPu+lGjboxDuR3graDYvSXleVJX0j3avWUXEzfoYxsAEg9inmUGYkj2o3eedJ2uHagGdFkZG1twOkrfQSWbVKwL/n3FsH2hFrHFUtlgyUP7R53cCSA=
Received: from BN0PR04CA0095.namprd04.prod.outlook.com (2603:10b6:408:ec::10)
 by IA4PR10MB8755.namprd10.prod.outlook.com (2603:10b6:208:566::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Mon, 15 Dec
 2025 15:33:06 +0000
Received: from BN1PEPF00005FFE.namprd05.prod.outlook.com
 (2603:10b6:408:ec:cafe::3b) by BN0PR04CA0095.outlook.office365.com
 (2603:10b6:408:ec::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9412.13 via Frontend Transport; Mon,
 15 Dec 2025 15:33:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BN1PEPF00005FFE.mail.protection.outlook.com (10.167.243.230) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9434.6 via Frontend Transport; Mon, 15 Dec 2025 15:33:04 +0000
Received: from DFLE215.ent.ti.com (10.64.6.73) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 15 Dec
 2025 09:32:54 -0600
Received: from DFLE208.ent.ti.com (10.64.6.66) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 15 Dec
 2025 09:32:54 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 15 Dec 2025 09:32:54 -0600
Received: from LTPW0EX92E.dhcp.ti.com (ltpw0ex92e.dhcp.ti.com [10.82.30.14])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5BFFWTtX2639809;
	Mon, 15 Dec 2025 09:32:49 -0600
From: Niranjan H Y <niranjan.hy@ti.com>
To: <alsa-devel@alsa-project.org>
CC: <linux-sound@vger.kernel.org>, <broonie@kernel.org>,
	<ckeepax@opensource.cirrus.com>, <lgirdwood@gmail.com>,
	<yung-chuan.liao@linux.intel.com>, <ranjani.sridharan@linux.intel.com>,
	<perex@perex.cz>, <tiwai@suse.com>, <cezary.rojewski@intel.com>,
	<peter.ujfalusi@linux.intel.com>, <kai.vehmanen@linux.intel.com>,
	<pierre-louis.bossart@linux.dev>, <shenghao-ding@ti.com>,
	<v-hampiholi@ti.com>, <baojun.xu@ti.com>, <dan.carpenter@linaro.org>,
	<sandeepk@ti.com>, Niranjan H Y <niranjan.hy@ti.com>
Subject: [PATCH v2 4/8] ASoC: tas2783A: fix error log for calibration data
Date: Mon, 15 Dec 2025 21:02:15 +0530
Message-ID: <20251215153219.810-4-niranjan.hy@ti.com>
X-Mailer: git-send-email 2.33.0.windows.2
In-Reply-To: <20251215153219.810-1-niranjan.hy@ti.com>
References: <20251215153219.810-1-niranjan.hy@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00005FFE:EE_|IA4PR10MB8755:EE_
X-MS-Office365-Filtering-Correlation-Id: 457d7e0c-fde9-4319-1128-08de3bef3da7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|7416014|376014|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?jmLNqTcLW1MadD5+Nr8252j1skG5KpIjBYC30c9aoPp07PSdY1+H47X3afW4?=
 =?us-ascii?Q?nSk0/HGpXW2QzlmOrs5Hq1BUunhaHBFn7tUL4a7kU13uF3hpzXxw8uDm6DQl?=
 =?us-ascii?Q?XQff3JN3q+fZonXlgUPOxYTSrAYE3qVxm5OTw0BX56oB/PSKtpO1LfmgnNGf?=
 =?us-ascii?Q?oJCibXDHKsBVXq4u98QPWHIx0YypkqF/skFUnRhc3LSTL56oIwNiqTTcV9Hl?=
 =?us-ascii?Q?jM4lInw/q9Fx5qitI9B8f3Tqprkzd5CUOjPCWwmczFGKZn6UbCTn3RYnyG2X?=
 =?us-ascii?Q?daw8WBKRNaXjmkKTP8YeMzmXKxE1a19WhY4HulOEjENGN8qKztNZTliESNSS?=
 =?us-ascii?Q?jdjOWJzrq8spvLoqsJtX4pLPsThdy+0U0WAfUrOoyeXO5Q6NFphkua36fu1e?=
 =?us-ascii?Q?QJjhXSk0vzRu4z8OG3VgSe0tf9PdNmourBkxQQDY7IF58IHn9h1KpZJV4z3B?=
 =?us-ascii?Q?HroD+K0EDpZkc9wxEYRo5ob+2ZVqJGyJ/X3l0Qvs66Hvqrwuh7Gs2ndZa/Qd?=
 =?us-ascii?Q?ApQ9VFi73gb97GwOAjDk4ocOmEah8Paw8yRdgApCqJuyc9+DmIcfXy/SF4DX?=
 =?us-ascii?Q?lm5LErQaUe9rXkn5RdDttcZoUaIZml4Ejx7LhcU0PBSTssAvY/8uwoVfMEeo?=
 =?us-ascii?Q?rP/Q+Mdaw1Fj+zkK9dD2DiZhYz3tG+T/q2mmH9MIv/QLt57HpGpbJ1ReZGDC?=
 =?us-ascii?Q?JO5x90qpPHVViJJ0CnSeNsDhn4xXSaMVTG6yU1JM6xJCbg3HwPp0wwae/ms8?=
 =?us-ascii?Q?fhMfSAjKFYBsEcpiTWv4AiqtmHAbRLLmZYaVp+GHFRibTvKjLdeAXAcgDg8S?=
 =?us-ascii?Q?vZMoespQNEEKygLExWVnLXKXSLEwuNLh4m27rnl1INzK00yGDOSelXOButq/?=
 =?us-ascii?Q?XmZfKXck6KTTch6R5XKrKquhzDvjjXCdvuaaUlAeBsZfy9Z9Pl0qmqAyqhsn?=
 =?us-ascii?Q?nBvzsHv498NWx8owGCeB/QuZWYx7lPMtlY2GtvzHKE57UFX7+f82q6ojN6g+?=
 =?us-ascii?Q?dmI0SnQQR5rUyOG+ppjxsVTIBemCQ6wSdBWaVwny/827lT/DKzaKZSrIMTum?=
 =?us-ascii?Q?AT+AZEHCDVL1JHXr/9/s7V/OKN0xFK8zveSoFARNJAPunVDsHmWsXhHkPChK?=
 =?us-ascii?Q?1JJJJYEItp7DsLlYLrjJfhqjY7YsNFrIrUfy8YzsH/L0UJjuzdZgWTksVUeH?=
 =?us-ascii?Q?XxgBEK5MJJ4TUbLO9QpW+xSwZLCf1fqT0RLWL8stsjRT4qENZpoTwHK2EUPE?=
 =?us-ascii?Q?5l2g4229xA0iHRd5ExjAR5RVALEjn+4x5/WAlVZx9Kmym76/TXgp7Wf0CRTV?=
 =?us-ascii?Q?2t9i4HG5139pl4DqipIK0PMb9HgNjbdan9ZgwL4JlmYIuTn6UhUYuYpKPyyh?=
 =?us-ascii?Q?Y3dgK+8exAZ6q9wvv603n0/o9l3rIEu/g+qvwuo7maTs3It53jssgqYxvqWF?=
 =?us-ascii?Q?X9OfZy42quqsc9gUc1Ec2ZyIyqyMX6bbD8g24JzzNRW7x5qJdHq4qe6orr9m?=
 =?us-ascii?Q?jEPodzFtAmOAi1Y0gUYUjKtbrbIBOZ8AodmGzNH6XAn0nn7EFo7dyHArf4LD?=
 =?us-ascii?Q?aICw/8eFACsivUXsHY8=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700013)(7416014)(376014)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2025 15:33:04.9509
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 457d7e0c-fde9-4319-1128-08de3bef3da7
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN1PEPF00005FFE.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR10MB8755
X-MailFrom: niranjan.hy@ti.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: FFDHWXHNB53YIE6LCR5QBUDV6D3SSPUV
X-Message-ID-Hash: FFDHWXHNB53YIE6LCR5QBUDV6D3SSPUV
X-Mailman-Approved-At: Wed, 17 Dec 2025 09:09:57 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FFDHWXHNB53YIE6LCR5QBUDV6D3SSPUV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Currently when the calibration is not found, it is wrongly
logged as device is not found. Fix this error message to
indicate that calibration data is not valid instead.

Signed-off-by: Niranjan H Y <niranjan.hy@ti.com>
---
v2:
- fix a typo in the commit message
---
 sound/soc/codecs/tas2783-sdw.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/tas2783-sdw.c b/sound/soc/codecs/tas2783-sdw.c
index bfa925dd6..397442cd6 100644
--- a/sound/soc/codecs/tas2783-sdw.c
+++ b/sound/soc/codecs/tas2783-sdw.c
@@ -635,7 +635,8 @@ static void tas2783_set_calib_params_to_device(struct tas2783_prv *tas_dev, u32
 	}
 
 	if (device_num == dev_count)
-		dev_err(tas_dev->dev, "device not found\n");
+		dev_err(tas_dev->dev,
+			"unique id not found in the calib data\n");
 	else
 		dev_dbg(tas_dev->dev, "calib data update done\n");
 }
-- 
2.43.0

