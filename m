Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 559F8C3E8CD
	for <lists+alsa-devel@lfdr.de>; Fri, 07 Nov 2025 06:51:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AFB16601F7;
	Fri,  7 Nov 2025 06:51:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AFB16601F7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1762494686;
	bh=ipZPgOWSdkqQ6cxAl3GSW55ocw0daPVBnL2m7eF3yl8=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=YFPWRJp/kHtQLS9SF//xBsVSsjNHwquX3rOVtOL7nrW+qWyEnFe+ru7XiXRO6HEIG
	 N+lx0zVtr3sYVYocFQ5ZSWjMZJDkqcVJ7mRM2yBP/SuEeQthMERm8ktmG5rEcypwxo
	 Uy/1SFhwsoAC9wjAfQqvjzrZpx3Vv4N1jarLbOBE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8BA36F805C7; Fri,  7 Nov 2025 06:50:54 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 58114F805C6;
	Fri,  7 Nov 2025 06:50:54 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 56870F8055B; Fri,  7 Nov 2025 06:50:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.3 required=5.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,KHOP_HELO_FCRDNS,T_SPF_HELO_TEMPERROR,T_SPF_TEMPERROR
	shortcircuit=no autolearn=no autolearn_force=no version=3.4.6
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazon11012024.outbound.protection.outlook.com [52.101.53.24])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6CA74F80100
	for <alsa-devel@alsa-project.org>; Fri,  7 Nov 2025 06:50:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6CA74F80100
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=selector1 header.b=pRxxMnDj
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=krRDifuppHcoUDTencFchiNSYJASPKsGVYw2T4sD3CggxiCiUZa9j5pD+QkW0brd4SXLyqtDo08MS/wHWsppvPKsQiIsu86QIHO00i7OOB6NrUk6YlZDIMErZVVJt3ATlRA/+0rPne3EWsLV34S8+t+T2BRCNbf7KIxsUWPX0HOX2JLGmQj3+B52ABTGBCZBMo5nB/O+osr59kU4VReVXX09WKF3EsXYMl7GswLXQBkZVLrOA/j2yUfX52iAabp0oreE9b8o7GwQAyS1qHRpNVQaRklcd0aCjauGV6rVBo7lmWikrpuPhaknMm82HHrm6BaSHc135VxOEBVmGKJXxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e+/Is7mFZbhgZyF+guI/ybv/tD2Xyhmc1zQghhvSFck=;
 b=SNvMhoDxQL2DGNlryb82Oq0JZGsjam19VvWYhicUH55ER9rwN0KzCgjt4k1vgDp0vX2UljNp8HPHUxKMuQwGj1hjr9BIwjRIfL7OpIq695YSCFqAoj3uDcoFZfP+YmdaWnvg1vrZdPDflR//gHp97pTOAlu3ZTYdFiSbS0vf8Hodxx5WEGTNWkPMEBxopX80zSaTQkMHzrPK1p79b/7GgrEKZg5FkD7H6tSIHVcIozXvBh9XixlLkRd9dc87ftP0p4b21DgkCwDH7JRxd2/Fa2nTDWT0gxgD3U/hCTf7dw0KWFXB5rCHXtZ4GimZ9Nzf7OhdlqknJK3yI+EKyNL76A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=alsa-project.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e+/Is7mFZbhgZyF+guI/ybv/tD2Xyhmc1zQghhvSFck=;
 b=pRxxMnDjjRs3eVvzploUa/VW3wrDDMhIgYkg8a4fPAvC4mLwGmpvdHX9uN+nPOi8bXajbZdprwjFj8911lV7k8DWPdSMmQKdW2jyMrnR0fZHcbH9BrJ1cMvSt5QG1ShVdrw9tr3AG6JyIeKQo5urVBcvp2J728DcpfpQgRYMNuo=
Received: from BY1P220CA0025.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:5c3::12)
 by SN7PR10MB6977.namprd10.prod.outlook.com (2603:10b6:806:344::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.15; Fri, 7 Nov
 2025 05:50:13 +0000
Received: from MWH0EPF000971E6.namprd02.prod.outlook.com
 (2603:10b6:a03:5c3:cafe::3a) by BY1P220CA0025.outlook.office365.com
 (2603:10b6:a03:5c3::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.12 via Frontend Transport; Fri,
 7 Nov 2025 05:50:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 MWH0EPF000971E6.mail.protection.outlook.com (10.167.243.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.10 via Frontend Transport; Fri, 7 Nov 2025 05:50:11 +0000
Received: from DLEE214.ent.ti.com (157.170.170.117) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 6 Nov
 2025 23:50:05 -0600
Received: from DLEE209.ent.ti.com (157.170.170.98) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 6 Nov
 2025 23:50:05 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 6 Nov 2025 23:50:05 -0600
Received: from LT5CG31242FY.dhcp.ti.com (lt5cg31242fy.dhcp.ti.com
 [10.85.14.52])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5A75o1d92462005;
	Thu, 6 Nov 2025 23:50:02 -0600
From: Shenghao Ding <shenghao-ding@ti.com>
To: <broonie@kernel.org>
CC: <andriy.shevchenko@linux.intel.com>, <tiwai@suse.de>,
	<13916275206@139.com>, <13564923607@139.com>, <alsa-devel@alsa-project.org>,
	<baojun.xu@ti.com>, Shenghao Ding <shenghao-ding@ti.com>
Subject: [PATCH v1] ASoC: tas2781: fix getting the wrong device number
Date: Fri, 7 Nov 2025 13:49:59 +0800
Message-ID: <20251107054959.950-1-shenghao-ding@ti.com>
X-Mailer: git-send-email 2.33.0.windows.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000971E6:EE_|SN7PR10MB6977:EE_
X-MS-Office365-Filtering-Correlation-Id: 9eb629c6-e0b1-431b-836a-08de1dc183e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?Z95iv3pYLPmm+rxe6+ojwlG1+/d8XD9+ufoTz1fqP5kk0C1vsYylXrUyT4RJ?=
 =?us-ascii?Q?WzbxxEj68YoMWvAvOhCq2BfSzh6+/a+mXK2Jm2dtJzONnsSXTI4K1mCprarZ?=
 =?us-ascii?Q?z7Xy+4uag72euF9E6j75bQy8wLRsMZsRe5vP15tTS51UfWqBds2pMERvJU1L?=
 =?us-ascii?Q?vHKpuLd14sWOgTQ6Bg+OdJDTnJgJkQe4YJpYLRBpXO0Wsa6V+VhA9X+usZu0?=
 =?us-ascii?Q?frMRGX26SKtDWi8waKdDeZAeBWFSY8gaDT/MwXExzF3TTXUytQl+TysP+Pro?=
 =?us-ascii?Q?XNK+aDph9Ill2iPsHZis/cQu9GZgNF9wjuhDwSvsjDzWG1kloN2ToT44Wz+b?=
 =?us-ascii?Q?QRvyLGsI9ylVQ1oteat8T4StnqOgxAiVdLJn/wkIvokG4FgPL0h0dLVc3LVS?=
 =?us-ascii?Q?GShaWpusg99NrvDHuwK4HREyaX5l2WstcEi42dKaiqdHLIagh4i4qlMQi6aT?=
 =?us-ascii?Q?RlGvkhoNmSaOWMLuUiMBNvTUgPS6Z24Q1hZbX6nsLMLucH3j4hroXYxK49NO?=
 =?us-ascii?Q?FXqwDG+BtGOOGAF8ulEv7wE0mGDY9MMj0LS97WieYzEgRs1lRXt4KbBbTc4X?=
 =?us-ascii?Q?ik4PjmVuEEK3sogY7Sy9iVk8y00BgYlALcdbM7bT5uvyLXUWzxhy4sDC0sHt?=
 =?us-ascii?Q?detb5hQYCd9ER//n5rn7oJvj4eHlFNnS7fx/ZbVcbcG1Q4TMGLWDQ53ACE1G?=
 =?us-ascii?Q?stSks64OWXnjF7KyNAjmqbujHVnCGqJrXyvJ2H1UbVwnEZdfzN6AdQE6O1CN?=
 =?us-ascii?Q?KTO1ObYVl6RV479wM/hPdIUvkRJhFjj9zxCNdGrFxhhYX0KxXiLopbyLFL9l?=
 =?us-ascii?Q?ZNjsfNF0a41b7Qb0SBFCZAUE8KPFh0NP8S0qjEXhgjNVzYMRUmQ8nNmHevaR?=
 =?us-ascii?Q?TMV8o2Pahz1KoUADM/xg4lwr7UsvF7pgLCZ3SZvDnXIfIW8RsFJcBSp/pCUb?=
 =?us-ascii?Q?aVCAWmhoVxDCDZ2PVi+R8mW3Y6uus5XyzuBoPysjYo5am6xDfcz37SpI43un?=
 =?us-ascii?Q?84uDhILVOKzwVUjuwVStxBMBpRmv2eE8i49hCmIBKDIXyFrnR3qqFkr21s5O?=
 =?us-ascii?Q?RyIeIsPsVQp/NVghRkfZsXits730bwQUtHNCm2iKqLyyS3efyi9XaxbdwUsg?=
 =?us-ascii?Q?tw/JoR3BnsnhJQbePWTAzKypXJ2PTG8++gn0A8lWFLct1sNPCOngn1Ag3EfI?=
 =?us-ascii?Q?pVyB4IyBWBX2C/0vgBnl+sgHA4q8vdp/ZfBVav+6PGKOfAg4IcbsHt9e68rw?=
 =?us-ascii?Q?70Cm0OW00dMbO0cDxau6e9VJeum+wYo88jGls2Rn8P2WvOtPa+U6ZNoBRN8d?=
 =?us-ascii?Q?xQx0myhJ5ZX9KUHJpAkVOmunKdikugcXYX1FvcBt6UVx5J9lxYqXzdtn0j0w?=
 =?us-ascii?Q?NkK4GXXR303fR4PooX8aw5HVHMaDu1aaMcMMH2r0XQlI6KkFR5TTjJpv309M?=
 =?us-ascii?Q?etcPvISBC69UePKlm+J0Zr30Zr+0FTWGXupPMyE37KaLVPSUAEv6xRCzaXuU?=
 =?us-ascii?Q?273fardVz7EKv5kSBRLWDgvZz5v78+3LEOwIEEkP2lVNZ3+ydXY3S60ErHe5?=
 =?us-ascii?Q?tHDx7g3UiDEs/Mf7vJg=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2025 05:50:11.1469
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 9eb629c6-e0b1-431b-836a-08de1dc183e9
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	MWH0EPF000971E6.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR10MB6977
Message-ID-Hash: MYUZQPO533U7ARGONGL3U7CQETHXLN2L
X-Message-ID-Hash: MYUZQPO533U7ARGONGL3U7CQETHXLN2L
X-MailFrom: shenghao-ding@ti.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MYUZQPO533U7ARGONGL3U7CQETHXLN2L/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The return value of device_property_read_u32_array used for getting the
property is the status instead of the number of the property.

Fixes: ef3bcde75d06 ("ASoC: tas2781: Add tas2781 driver")
Signed-off-by: Shenghao Ding <shenghao-ding@ti.com>
---
 sound/soc/codecs/tas2781-i2c.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/tas2781-i2c.c b/sound/soc/codecs/tas2781-i2c.c
index 8f853310649c..7bd98ff5a250 100644
--- a/sound/soc/codecs/tas2781-i2c.c
+++ b/sound/soc/codecs/tas2781-i2c.c
@@ -1958,7 +1958,8 @@ static void tasdevice_parse_dt(struct tasdevice_priv *tas_priv)
 {
 	struct i2c_client *client = (struct i2c_client *)tas_priv->client;
 	unsigned int dev_addrs[TASDEVICE_MAX_CHANNELS];
-	int i, ndev = 0;
+	int ndev = 0;
+	int i, rc;
 
 	if (tas_priv->isacpi) {
 		ndev = device_property_read_u32_array(&client->dev,
@@ -1969,8 +1970,12 @@ static void tasdevice_parse_dt(struct tasdevice_priv *tas_priv)
 		} else {
 			ndev = (ndev < ARRAY_SIZE(dev_addrs))
 				? ndev : ARRAY_SIZE(dev_addrs);
-			ndev = device_property_read_u32_array(&client->dev,
+			rc = device_property_read_u32_array(&client->dev,
 				"ti,audio-slots", dev_addrs, ndev);
+			if (rc != 0) {
+				ndev = 1;
+				dev_addrs[0] = client->addr;
+			}
 		}
 
 		tas_priv->irq =
-- 
2.43.0

