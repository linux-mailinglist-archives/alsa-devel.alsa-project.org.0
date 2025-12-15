Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F8FFCC6B93
	for <lists+alsa-devel@lfdr.de>; Wed, 17 Dec 2025 10:11:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0045E60234;
	Wed, 17 Dec 2025 10:11:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0045E60234
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1765962683;
	bh=V2ZU2BCaaAOsV6ugSXEjN+pF9KMAuxyKRo+PToOXas0=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=GoyGkoZ+pvDylnIxWM6JyiXv4Vb+iCPQ/gJrr/EUB8YR9tJCvjbMMT59ZPTik8Rz1
	 vbPa0lSqhDE16LXkOM1PWhk8Vj6PGAoSH6Bpy+DtAXKxuWnayKIZBGUxg5NUk0kwMe
	 XgsLtvO/8DlECAaPrC02UpeuQqGI9ABZH6UhhAcs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E8D6DF8063B; Wed, 17 Dec 2025 10:10:13 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BACA6F8063C;
	Wed, 17 Dec 2025 10:10:13 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C443BF80169; Mon, 15 Dec 2025 16:32:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.3 required=5.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,KHOP_HELO_FCRDNS,T_SPF_HELO_TEMPERROR,T_SPF_TEMPERROR
	shortcircuit=no autolearn=no autolearn_force=no version=3.4.6
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azon11012046.outbound.protection.outlook.com [52.101.48.46])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 89B95F80107
	for <alsa-devel@alsa-project.org>; Mon, 15 Dec 2025 16:32:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 89B95F80107
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=selector1 header.b=na55RkzU
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UHi5YftGeX5sar0wFApfwkGxLKWKDIc2xP3dYIgXhyqXph01gQmMVDPIPLO0vBjt06u5w5K/kHAKVGNzGBd5hUROlYdfaqw1yblxmoGJMo4gSWz1lFDFDznQGdWWFox2z0n0Twmw8MTcfMCtWmEWawiLwJcaIWLqoMgPUcFzC3XtR6GyXN+ISIvlX0w1JsoXPyK3eLIc/7rQPnj9xk/FxQsGRoz8cQTT8xwR3oP6fFzt6LQlBxXAyJ8IIqHDOkrxx+uTNxcYgP/jPoKC1m61x7kdwwwuNoPIHjKu21bK8tvMmB9YYgSGIkeuQqjgkHzGwiXR4EQoTa9mT5ue+FCiMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LlFPl8qVACDoBLx7rSOovMX2GKKtsLvnJChExcSFcEA=;
 b=bAuDWeh+VgKYVqguL10hsSHmIFdD8vyFZOJ9Nm0p/Ktk0j8ftVEu6jUhpR/In5kWExr5vdBDZJVOv0EX/GnorUFDZwlF8+ByRUBhFtcdBYBL9HqVxgOcL6ovdf4AFWYeAQjFZ3We18bnhS9VpNxYjRxfa/1+JzoM88v1zzWCSdKbmmbCVGop2PaySNN13fS5DEki9+YjP0ULEn8qScEsHeig3z//QZy8Q+HwRAnKuoR7Hq5mShBm5WBwA6GIaXSuOnvOBqt7z6ooZ9EHOhAH/zli+AKGpa1ac+8G03ATdh75SwSMEWYu9TNPPHj/1xgnrxZZPfTfbEnqkt1c8O2GBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=linaro.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LlFPl8qVACDoBLx7rSOovMX2GKKtsLvnJChExcSFcEA=;
 b=na55RkzUYwQHOMj+n62gCS4GpKnOsXUUR+qsgNprE1lXGSQ83YvBoaB9Zs96yR4pOZcS7plQSkSBA6CpVJ6aLZn2oBr79lsilaqMINZz7y2z31M3Pq2r2Kqzdm4Jv7qT6MfOsoE3XLXeVgxbR03fzlubNmxskbdFf/cX5z5VZf8=
Received: from CH2PR20CA0004.namprd20.prod.outlook.com (2603:10b6:610:58::14)
 by PH3PPFF0D9ABED1.namprd10.prod.outlook.com (2603:10b6:518:1::7d8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Mon, 15 Dec
 2025 15:32:49 +0000
Received: from CH1PEPF0000AD7C.namprd04.prod.outlook.com
 (2603:10b6:610:58:cafe::c) by CH2PR20CA0004.outlook.office365.com
 (2603:10b6:610:58::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9412.13 via Frontend Transport; Mon,
 15 Dec 2025 15:32:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 CH1PEPF0000AD7C.mail.protection.outlook.com (10.167.244.84) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9434.6 via Frontend Transport; Mon, 15 Dec 2025 15:32:48 +0000
Received: from DLEE206.ent.ti.com (157.170.170.90) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 15 Dec
 2025 09:32:48 -0600
Received: from DLEE202.ent.ti.com (157.170.170.77) by DLEE206.ent.ti.com
 (157.170.170.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 15 Dec
 2025 09:32:47 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE202.ent.ti.com
 (157.170.170.77) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 15 Dec 2025 09:32:47 -0600
Received: from LTPW0EX92E.dhcp.ti.com (ltpw0ex92e.dhcp.ti.com [10.82.30.14])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5BFFWTtW2639809;
	Mon, 15 Dec 2025 09:32:43 -0600
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
Subject: [PATCH v2 3/8] ASoC: tas2783A: update default init writes
Date: Mon, 15 Dec 2025 21:02:14 +0530
Message-ID: <20251215153219.810-3-niranjan.hy@ti.com>
X-Mailer: git-send-email 2.33.0.windows.2
In-Reply-To: <20251215153219.810-1-niranjan.hy@ti.com>
References: <20251215153219.810-1-niranjan.hy@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD7C:EE_|PH3PPFF0D9ABED1:EE_
X-MS-Office365-Filtering-Correlation-Id: 4fedd1dd-88ec-4f03-3610-08de3bef33fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|7416014|376014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?wct2BKCJf9T34/gGOdd3EqO3sNH7v7wA+oS8yBxktDfeOwUHhU4T+q6Rv6be?=
 =?us-ascii?Q?MAVvp87AjL3Aah3Eg2w5QthO85EPC9V8tf9NOKguoXwpOdtoVyW44p23XQxV?=
 =?us-ascii?Q?msqmuEApN7qHM0KTiqeCMC+7hmacGNVPDn3vstRonYed3tpeCZIAJsa6cNmL?=
 =?us-ascii?Q?cSVEVfA7Q14PsYYjSWaTEMfVyBQAqrn2blU9bTitL3gAjkcOLls8TMi5E9Mk?=
 =?us-ascii?Q?x4HJJOmLsgwjUwaYEGMBpCAOEMWbuw/V7jnBaFc4eguilelCob30p4Hy/AYi?=
 =?us-ascii?Q?nWpaggbS9owGenHifIjwsuhoaedzLqegLOg034UEf1jPSwEZ6MYNdHjRp6XN?=
 =?us-ascii?Q?y5n+7mguH9vfIYlaLVa+92qUiwl6oJwyDlnTW5jVe+LKXOLVoTZF1ndjyEuW?=
 =?us-ascii?Q?DTLjMhYbX2dQWGndgGXbUAdJXXa1F8Ze/0iwWVEh2LF1C9716/SnP7G6S8s7?=
 =?us-ascii?Q?hLEj2s7uDM3ee8JWzhVdLioegKRzS7NixXIcK3QLJRvLui4sXHGvYFeufDfu?=
 =?us-ascii?Q?guI5NRIR46D22MdCyNyh7yVU51BC2E2SdYPTx9lk8MgmQwlM9PSjFH18fnp4?=
 =?us-ascii?Q?t6TjATI5vtqamaO26i4Un82Li/H077+8PHIlYOMhIk/1rK0vyCNm5eh11KaP?=
 =?us-ascii?Q?hZvKLx2b5FF5EmFv6uXz2YfMq5NBmiVv6Na6KmA2xpghwABgIBZprDB3heXl?=
 =?us-ascii?Q?GFc7kCfJXCDMQcf0+FL64ymtnRJGUY+0WMCqsV2bbA/zukE11ebp7LhoCHVK?=
 =?us-ascii?Q?bH/3p/7NgziOF2gxjSoh/XBgJu7jNf4lyMK4cgSe3leXtJG9PcnMMbj6QpYQ?=
 =?us-ascii?Q?53pSw8nMIASnwrBStF3zvOCBybXGiZV7V05e2/p+x/12UMRaOqcbCZAmQoQG?=
 =?us-ascii?Q?fd/addGeeQJwNMxZxFGGdGM33yI4jGc9/NU/StK83V1oLYEuMGlxLL2717+x?=
 =?us-ascii?Q?JtwcU8s84B8IJIAA8HTALjaNboI+0GW9vqsp7ST39lR9moyJ8Ys1v1c9klcL?=
 =?us-ascii?Q?a1YQAH1W0Di4OJwusXyoXHD2p3kuKD4jhZLoU6etl8o8y1adYy6lNF8S1xB9?=
 =?us-ascii?Q?QGG3UT0Ls53pmqRuHe8WCYYrp02xJyTkMeZrn0JRxiDwLuo9NMik64Js+m8g?=
 =?us-ascii?Q?X38cSsk+5Pq/WKtffcm2yPHt8333MFOG9TaidiBgIumxiCncoA7/Di7oTUYa?=
 =?us-ascii?Q?YBvU41hwPhY6oklCMAASKXgpiTeweRhhPZMRAfBNt3iTOJi9IEXZFBtaTn9H?=
 =?us-ascii?Q?dG0K0e5LYNwpb1qk/QrcJakOo/l+6n6OueNMTmPCIsT6g8MRffkDYrVwN5Ci?=
 =?us-ascii?Q?OU1LODXHs9xOOUvMD68ibKqiNgzytqskzateuFT1niXB+2QwU4BQ3rREpIQk?=
 =?us-ascii?Q?afPKM1XW033oq6yJu9dIfdY6tCCKAxIHCk4A9/wux2I5yFQeAPRKrZOqYyN2?=
 =?us-ascii?Q?7lxQrpvnMySRGU1OaUbPqS8SvRa8RXgdRbO68vEGDgrkocNxP5V0lK12MD8X?=
 =?us-ascii?Q?YwPve1WeTOahbFw9oVPE2LmeqPbGm9F4jzZ5SFLd20sbLcAYtd+laqjtk8Xb?=
 =?us-ascii?Q?3tKTurGmEAxyCZNzCdw=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2025 15:32:48.8085
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 4fedd1dd-88ec-4f03-3610-08de3bef33fd
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH1PEPF0000AD7C.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPFF0D9ABED1
X-MailFrom: niranjan.hy@ti.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: AEGY422QUE3D7ZBGBDR46FBQ2NS52P74
X-Message-ID-Hash: AEGY422QUE3D7ZBGBDR46FBQ2NS52P74
X-Mailman-Approved-At: Wed, 17 Dec 2025 09:09:57 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/AEGY422QUE3D7ZBGBDR46FBQ2NS52P74/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

  Remove unwanted initialistaion writes to the
device which will now be part of the either firmware
or acpi table.

Signed-off-by: Niranjan H Y <niranjan.hy@ti.com>
---
v2:
- no change
---
 sound/soc/codecs/tas2783-sdw.c | 54 +---------------------------------
 1 file changed, 1 insertion(+), 53 deletions(-)

diff --git a/sound/soc/codecs/tas2783-sdw.c b/sound/soc/codecs/tas2783-sdw.c
index 6a0644670..bfa925dd6 100644
--- a/sound/soc/codecs/tas2783-sdw.c
+++ b/sound/soc/codecs/tas2783-sdw.c
@@ -297,7 +297,7 @@ static const struct reg_default tas2783_reg_default[] = {
 };
 
 static const struct reg_sequence tas2783_init_seq[] = {
-	REG_SEQ0(SDW_SDCA_CTL(1, TAS2783_SDCA_ENT_PPU21, 0x10, 0x00), 0x04),
+	REG_SEQ0(SDW_SDCA_CTL(1, TAS2783_SDCA_ENT_PPU21, 0x10, 0x00), 0x01),
 	REG_SEQ0(0x00800418, 0x00),
 	REG_SEQ0(0x00800419, 0x00),
 	REG_SEQ0(0x0080041a, 0x00),
@@ -307,60 +307,19 @@ static const struct reg_sequence tas2783_init_seq[] = {
 	REG_SEQ0(0x0080042a, 0x00),
 	REG_SEQ0(0x0080042b, 0x00),
 	REG_SEQ0(SDW_SDCA_CTL(1, TAS2783_SDCA_ENT_FU23, 0x1, 0x00), 0x00),
-	REG_SEQ0(0x0080005c, 0xD9),
-	REG_SEQ0(0x00800082, 0x20),
-	REG_SEQ0(0x008000a1, 0x00),
-	REG_SEQ0(0x00800097, 0xc8),
-	REG_SEQ0(0x00800099, 0x20),
-	REG_SEQ0(0x008000c7, 0xaa),
-	REG_SEQ0(0x008000b5, 0x74),
-	REG_SEQ0(0x00800082, 0x20),
-	REG_SEQ0(0x00807e8d, 0x0d),
-	REG_SEQ0(0x00807eb9, 0x53),
-	REG_SEQ0(0x00807ebe, 0x42),
-	REG_SEQ0(0x00807ec5, 0x37),
-	REG_SEQ0(0x00800066, 0x92),
-	REG_SEQ0(0x00800003, 0x28),
 	REG_SEQ0(0x00800004, 0x21),
 	REG_SEQ0(0x00800005, 0x41),
 	REG_SEQ0(0x00800006, 0x00),
 	REG_SEQ0(0x00800007, 0x20),
-	REG_SEQ0(0x0080000c, 0x10),
-	REG_SEQ0(0x00800013, 0x08),
 	REG_SEQ0(0x00800015, 0x00),
-	REG_SEQ0(0x00800017, 0x80),
-	REG_SEQ0(0x0080001a, 0x00),
-	REG_SEQ0(0x0080001b, 0x22),
-	REG_SEQ0(0x0080001c, 0x36),
-	REG_SEQ0(0x0080001d, 0x01),
-	REG_SEQ0(0x0080001f, 0x00),
-	REG_SEQ0(0x00800020, 0x2e),
-	REG_SEQ0(0x00800034, 0x06),
-	REG_SEQ0(0x00800035, 0xb9),
 	REG_SEQ0(0x00800036, 0xad),
 	REG_SEQ0(0x00800037, 0xa8),
-	REG_SEQ0(0x00800038, 0x00),
-	REG_SEQ0(0x0080003b, 0xfc),
-	REG_SEQ0(0x0080003d, 0xdd),
-	REG_SEQ0(0x00800040, 0xf6),
-	REG_SEQ0(0x00800041, 0x14),
-	REG_SEQ0(0x0080005c, 0x19),
-	REG_SEQ0(0x0080005d, 0x80),
-	REG_SEQ0(0x00800063, 0x48),
-	REG_SEQ0(0x00800065, 0x08),
-	REG_SEQ0(0x00800067, 0x00),
-	REG_SEQ0(0x0080006a, 0x12),
 	REG_SEQ0(0x0080006b, 0x7b),
 	REG_SEQ0(0x0080006c, 0x00),
 	REG_SEQ0(0x0080006d, 0x00),
 	REG_SEQ0(0x0080006e, 0x1a),
 	REG_SEQ0(0x0080006f, 0x00),
-	REG_SEQ0(0x00800070, 0x96),
 	REG_SEQ0(0x00800071, 0x02),
-	REG_SEQ0(0x00800073, 0x08),
-	REG_SEQ0(0x00800075, 0xe0),
-	REG_SEQ0(0x0080007a, 0x60),
-	REG_SEQ0(0x008000bd, 0x00),
 	REG_SEQ0(0x008000be, 0x00),
 	REG_SEQ0(0x008000bf, 0x00),
 	REG_SEQ0(0x008000c0, 0x00),
@@ -368,17 +327,6 @@ static const struct reg_sequence tas2783_init_seq[] = {
 	REG_SEQ0(0x008000c2, 0x00),
 	REG_SEQ0(0x008000c3, 0x00),
 	REG_SEQ0(0x008000c4, 0x00),
-	REG_SEQ0(0x008000c5, 0x00),
-	REG_SEQ0(0x00800008, 0x49),
-	REG_SEQ0(0x00800009, 0x02),
-	REG_SEQ0(0x0080000a, 0x1a),
-	REG_SEQ0(0x0080000d, 0x93),
-	REG_SEQ0(0x0080000e, 0x82),
-	REG_SEQ0(0x0080000f, 0x42),
-	REG_SEQ0(0x00800010, 0x84),
-	REG_SEQ0(0x00800014, 0x0a),
-	REG_SEQ0(0x00800016, 0x00),
-	REG_SEQ0(0x00800060, 0x21),
 };
 
 static int tas2783_sdca_mbq_size(struct device *dev, u32 reg)
-- 
2.43.0

