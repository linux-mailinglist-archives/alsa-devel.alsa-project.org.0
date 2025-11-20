Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 69AE2C7579C
	for <lists+alsa-devel@lfdr.de>; Thu, 20 Nov 2025 17:53:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C34B560280;
	Thu, 20 Nov 2025 17:53:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C34B560280
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1763657603;
	bh=J6M+4f0bBJkIAeYTzp7kwbd06dRY6N3Hd+7yY2ac/Oc=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=f8fUJ916HWvq7NyD5xsAJscdINL2WRUGswDlg6Ezz7mloRXvmtvk5S6cYMgSjlILc
	 iR5pxfEjRhyNrtLcONvx5bQpQdcvAyFZ9o0/H591br/+FvCcLM3bztnvKS7Kdms0by
	 3QdEQKeGM/agENaGJB+Rz8N/vrSBREdwsSQrIZfM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 166D3F806A8; Thu, 20 Nov 2025 17:51:29 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 831D5F806A6;
	Thu, 20 Nov 2025 17:51:29 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8F30FF8021D; Thu, 20 Nov 2025 10:21:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.3 required=5.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,KHOP_HELO_FCRDNS,T_SPF_HELO_TEMPERROR,T_SPF_TEMPERROR
	shortcircuit=no autolearn=no autolearn_force=no version=3.4.6
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazon11011004.outbound.protection.outlook.com
 [40.93.194.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 56B80F80072
	for <alsa-devel@alsa-project.org>; Thu, 20 Nov 2025 10:21:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 56B80F80072
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=selector1 header.b=VsEzCZQN
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hxv32T3Rlw27DRbDt6f6sHhZFo2BkKCVb/VAAY1oR5raTsPBpDetsQBqUPND3F3QOfeqncg7crZ1VulyPN1JjS1XVn4b8+XBMISs9iMsLoQqDqKTtW1yNOGLiHYXBGsNLz90BAz6Dnc8XWpjt3ES8cZpGR0sghKYNypuPXl9MEHSqSrbox2Ofg1ME/QYwuDa7O1B5deQJw9Z7e/iOl83E8niV9Y4zwuN1bdNeLhCBxaVL1E0zTzPEd7ppqy1t5jBlRKVui6GpungNf7w7gT+WB1xHvo4JODhJSYG7TYovnrtQtmlOi5iXD7JUGiSAydIrGlufEhLHCBzQ9a/GBEMZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fhLGWXvm5Y/3GTwIPrR7afwzm2CgZBtPkC2OEacCEpc=;
 b=tZeYNkgDoUGchL22zuLHvlKToTta+jKr4vlewkrMifDC9zpjJQ78Ob4qfs70EyvrdlbDpDWhRLnDbP+qwBiJ1twHXo506lax3oNoQCMIwJRfmlTwVVlj1pRZpTDLiOoWYL8InhAzF2W4iNNH2TcTtrbE7dx1ZeqPihj/76clZZlpyMMsycU7hkUobAy4Nol58KBgbmbIzVu1mh+Esmjld31cxERiWTgUEByETG9BvUVkkfgv88h3aWJwBYzw8k2xWBaqx1ke3CEC91WXV7lWMZDWUKzy5DSMgAhS4XC0ETRlApG9uvWNa8YpH2r29JYX276S9tzWTwwxjBRfLkilxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=linaro.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fhLGWXvm5Y/3GTwIPrR7afwzm2CgZBtPkC2OEacCEpc=;
 b=VsEzCZQNwQCCHKF4XzTX5mHkdgJ9SPQ2q7K3CiOUA7vdhcrZiAPQgEgdYAJL39NwVwYBlOBX5re/6uWLxiK5zBi9bVa1OhQhcy1ocqS8ipZGLc1xnUncqBPPHCHNyF/qGrWra5z7cj9eyxXem0endXuwGQC5Oi34dAvUR/nfnGg=
Received: from SJ0PR05CA0141.namprd05.prod.outlook.com (2603:10b6:a03:33d::26)
 by CO6PR10MB5789.namprd10.prod.outlook.com (2603:10b6:303:140::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Thu, 20 Nov
 2025 09:21:53 +0000
Received: from SJ1PEPF000023D6.namprd21.prod.outlook.com
 (2603:10b6:a03:33d:cafe::9f) by SJ0PR05CA0141.outlook.office365.com
 (2603:10b6:a03:33d::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.10 via Frontend Transport; Thu,
 20 Nov 2025 09:21:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 SJ1PEPF000023D6.mail.protection.outlook.com (10.167.244.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9366.1 via Frontend Transport; Thu, 20 Nov 2025 09:21:51 +0000
Received: from DFLE211.ent.ti.com (10.64.6.69) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 20 Nov
 2025 03:21:50 -0600
Received: from DFLE206.ent.ti.com (10.64.6.64) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 20 Nov
 2025 03:21:50 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE206.ent.ti.com
 (10.64.6.64) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 20 Nov 2025 03:21:50 -0600
Received: from LTPW0EX92E.dhcp.ti.com ([10.249.133.122])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5AK9L1c63383883;
	Thu, 20 Nov 2025 03:21:44 -0600
From: Niranjan H Y <niranjan.hy@ti.com>
To: <alsa-devel@alsa-project.org>
CC: <linux-sound@vger.kernel.org>, <lgirdwood@gmail.com>,
	<broonie@kernel.org>, <ckeepax@opensource.cirrus.com>,
	<yung-chuan.liao@linux.intel.com>, <ranjani.sridharan@linux.intel.com>,
	<perex@perex.cz>, <tiwai@suse.com>, <cezary.rojewski@intel.com>,
	<peter.ujfalusi@linux.intel.com>, <kai.vehmanen@linux.intel.com>,
	<pierre-louis.bossart@linux.dev>, <navada@ti.com>, <shenghao-ding@ti.com>,
	<v-hampiholi@ti.com>, <baojun.xu@ti.com>, <dan.carpenter@linaro.org>,
	Niranjan H Y <niranjan.hy@ti.com>
Subject: [PATCH v1 6/8] ASoc: tas2783A: acpi match for 4 channel for mtl
Date: Thu, 20 Nov 2025 14:50:48 +0530
Message-ID: <20251120092050.1218-6-niranjan.hy@ti.com>
X-Mailer: git-send-email 2.33.0.windows.2
In-Reply-To: <20251120092050.1218-1-niranjan.hy@ti.com>
References: <20251120092050.1218-1-niranjan.hy@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023D6:EE_|CO6PR10MB5789:EE_
X-MS-Office365-Filtering-Correlation-Id: 28d877e9-487f-4fd2-1f88-08de28163d93
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|7416014|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?keTUWWLhf/L6BrA2YllHiiWjtcPk/CunELs4ZGlzZLIqTjKLWVLnAsHmKuBw?=
 =?us-ascii?Q?WN3m4COZV328evFFwOy+Iu0ItHTLTcXhHakvO6+QD/71trsHKWPuPexTZHNe?=
 =?us-ascii?Q?4S3wSG+1L7GE16q04Zhngy8EXida5iPbYcm3W9yuE6Kx4PJc4ATKb2B3R7xh?=
 =?us-ascii?Q?ogAvD7x2sEOXKo+ngFoekw9ASx/2I28UeMVBqb1kjCjMYrO89ZaBEkD3X51r?=
 =?us-ascii?Q?cCwSHX4SKvT1jjQnlKhLOZiNyBAshDeGk487neI1Ne0ixbU8+pvnEhTU/RXJ?=
 =?us-ascii?Q?DxvfYze/YehivzpVzW3/xzp/OxPe1F7j7zFsrPJi3t/t7kgC9cPq5ZADodLh?=
 =?us-ascii?Q?WG7B35b3zKpa731BKyfoVbk9eWJC7no/fnJ9gZZRFp3unBVDi3/nqqMh99Fh?=
 =?us-ascii?Q?CUX8Bf7r98STRKS1Swvwp0DYTjsuRQYDiZ1pR0rD48HTsruCEzjaXNuoauf1?=
 =?us-ascii?Q?G8mNLIWfx5Fz8G3xV08NqeMmKxI50cr1gquETQj27fsiY3KBu+0OTew/X7eO?=
 =?us-ascii?Q?1N7AnSmeJu4n5cyQ3bqzrIBlVFCbZogrXRjVsulAecFLPILgPiacptD1anlL?=
 =?us-ascii?Q?qynphP6glK2wFeTgxRtJBirEzECqc7b2M+yvpCkilwjJVgCgLAi7mSyabYsv?=
 =?us-ascii?Q?ZLjWu/xtayI7/ITfApjZzyThyGnn99pPkKiHCvJKalXjLQPAZvetBiEUSg/P?=
 =?us-ascii?Q?QLNsJqm9SqUSfcXOMzvOT4fR0ND6MCdg9D0ui+yVlOXiUX1GBlNZdCZuojqS?=
 =?us-ascii?Q?D7EVn9E/B3OKSbMTGx2Ni1BpjABRX0t2P7tTheGQ6ZBcTNjaB9YRsCb0AWK4?=
 =?us-ascii?Q?jtIEvFhT1tin95jr5lsLubAodrUHZYCgmvKtdWXiWEeg0J2I1VX9WoC20QTd?=
 =?us-ascii?Q?xQ2cFttwSesq3NQaezLRokUbOoVlPc0JuhZBgtasiI5wkD0AY5DndMFyB44A?=
 =?us-ascii?Q?/whDLAIKCM5Ar3pYJew9Kzc3ynMcsjfv/lISza3t27Cyk7WQS5GxfGQPmqnG?=
 =?us-ascii?Q?LnhHGKiumJxjdMmIFpYwF7/+vEK9CcewbAaGVGgn4FIdQNMRLNy2BRU5N4j3?=
 =?us-ascii?Q?Kbw1pszMY9C6UFIQbRaDH0iH3E4xYDtEUADHRM1WbizzsXABcvzCkU1lSL/n?=
 =?us-ascii?Q?zLnbyziZOZl+m3rBKeoKNFnv9YKIOQTidWvoqo8vg5ttLTlCdV8coEu0o+A4?=
 =?us-ascii?Q?bfuogmcTX+mzGZVUx/JnWclGJ6LwQ2N2BLyEMk4lfZheNW5+S9jUXmOXZ4Sl?=
 =?us-ascii?Q?AHTrm6UgIpJpf64xAdcyc+uPjjqcJ5v6V3a5yl7r8+PAEiMBmymSAZ9ZI4lD?=
 =?us-ascii?Q?klfolXJkVx01+lNItueWKl5F3JwZPfHZW5aLDWfsCHxmfoU/mX7rx4Upxnc/?=
 =?us-ascii?Q?uiOi6tGjpJVs+12iTjSc9taLX0SaXHB6WiA96iXUIOObh6jVsjNVieqsEDPJ?=
 =?us-ascii?Q?Nh0bSJRND4CSG5N7cOXqWVF3Hx/SABfFELypF983dyROtu/tDfzSiSQjVJD7?=
 =?us-ascii?Q?7o2hcRU127JgmInnCTgZFOdm/b965sSunabcf5mnpBasnslY6BkIWs5e81wh?=
 =?us-ascii?Q?aKP6zEMs2yizEhDJDAg=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(7416014)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2025 09:21:51.9928
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 28d877e9-487f-4fd2-1f88-08de28163d93
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ1PEPF000023D6.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR10MB5789
X-MailFrom: niranjan.hy@ti.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 6IF7JLNFE3EPKFMU62TANCEU32LQ4QKR
X-Message-ID-Hash: 6IF7JLNFE3EPKFMU62TANCEU32LQ4QKR
X-Mailman-Approved-At: Thu, 20 Nov 2025 16:51:12 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6IF7JLNFE3EPKFMU62TANCEU32LQ4QKR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

  Add changes to support 4 tas2783A devices on mtl platform.
The supported unique IDs are updated to 9, a, c, d, where
c and d are configured to play left channels and 9 and a
are configured to play right channel.

Signed-off-by: Niranjan H Y <niranjan.hy@ti.com>
---
 sound/soc/intel/common/soc-acpi-intel-mtl-match.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/sound/soc/intel/common/soc-acpi-intel-mtl-match.c b/sound/soc/intel/common/soc-acpi-intel-mtl-match.c
index ec9fd8486..f12d42986 100644
--- a/sound/soc/intel/common/soc-acpi-intel-mtl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-mtl-match.c
@@ -950,7 +950,7 @@ static const struct snd_soc_acpi_adr_device cs42l42_0_adr[] = {
 
 static const struct snd_soc_acpi_adr_device tas2783_0_adr[] = {
 	{
-		.adr = 0x0000380102000001ull,
+		.adr = 0x00003c0102000001ull,
 		.num_endpoints = 1,
 		.endpoints = &spk_l_endpoint,
 		.name_prefix = "tas2783-1"
@@ -960,6 +960,18 @@ static const struct snd_soc_acpi_adr_device tas2783_0_adr[] = {
 		.num_endpoints = 1,
 		.endpoints = &spk_r_endpoint,
 		.name_prefix = "tas2783-2"
+	},
+	{
+		.adr = 0x00003d0102000001ull,
+		.num_endpoints = 1,
+		.endpoints = &spk_l_endpoint,
+		.name_prefix = "tas2783-3"
+	},
+	{
+		.adr = 0x00003a0102000001ull,
+		.num_endpoints = 1,
+		.endpoints = &spk_r_endpoint,
+		.name_prefix = "tas2783-4"
 	}
 };
 
-- 
2.25.1

