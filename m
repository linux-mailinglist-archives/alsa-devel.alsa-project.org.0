Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C574C4752B
	for <lists+alsa-devel@lfdr.de>; Mon, 10 Nov 2025 15:48:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4732F60301;
	Mon, 10 Nov 2025 15:47:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4732F60301
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1762786089;
	bh=82f5b3jc2d6xTGduYFGzZ9HorCu6Iuk8EHCcTMAa3yY=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=IJGSj27rK8t5EEU/uqeOvdjh/qZCf5u5vmwbs31MNOK60YPStd1kwJbKHfGsDnQT+
	 NW7/cJywklnvQUXXrj1uMxj1rbKin9pp3315U02MbZBhO0d8oH4iQNOI9cykGB7F+r
	 9K/FHJTkOsc+YKYrYlI+OgvsNyFiwStlZMapW50g=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 135B7F89765; Mon, 10 Nov 2025 15:41:56 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 31F0EF8977C;
	Mon, 10 Nov 2025 15:41:56 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 851CAF80240; Thu, 30 Oct 2025 16:17:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.3 required=5.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,KHOP_HELO_FCRDNS,T_SPF_HELO_TEMPERROR,T_SPF_TEMPERROR
	shortcircuit=no autolearn=no autolearn_force=no version=3.4.6
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azhn15010018.outbound.protection.outlook.com [52.102.138.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 795E4F8003C
	for <alsa-devel@alsa-project.org>; Thu, 30 Oct 2025 16:17:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 795E4F8003C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=selector1 header.b=fk0G4/Nq
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OiLxYVFmbN7iwgtAyR68bPvJg/K522oAnSPk3s7arXftrsb10drwqifSPfpwXAYS0YCpWFAPq8qwygMtctme+E6Bu3vcx7OlzhbA2bkA00nTh9xXbcQghYH+O92PwnXCCTvec2HTFIUfwMCy8ow8N3JAiosc+zEnVyVVSw6xtNpREu55NObl3IEcpZ2Gtp8wPxfL9FafBhPdneTrqCORdMjTTex+Yc2Gf8s6D/6KU71MchSn2rY5guh7u0/FRiI0hzeF++7P5+LrIuYxng32dkQ2iof25QjC/wbftFFSIEuz8ZH7ADaVmQXtgm0lC7Ii8LZxwDSItNWEt6ivFaPVng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TAL87wtFKqdeosQ+pSDP6+eHaqVPOgzuipLYwRp2PFw=;
 b=OuqKFKyBilHl9unkrxpHVq6jvT5528tk79qHf36lCJ4BPWwk76tUauqWCh7uyWkfDZi5M6nYx0/fxSehhPy0G1V/39GqImM8CmXDSBdFlSain/OfGQ7rz1jv57/ULTdZN0IVmQ5PQ05yZ8EfDU0WKuaK3WB4Cxhs+OkYjXjr24HMKClxDbQ5RYjmAqn4Zift8ws3WvPkIoEfPPblf+zhmhzgw+nk1ky9rrJ8ONkDgu+0dmHavYFFMe85zTSzw54k1EA0BE4/SNs4zCvkDzuXKzUPp8FPhmf1yIJ7rvxx16LUQPDpe5jtBcyAd3Tzx1qAqydP3o0SN3nkODXJ7g4Dpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=gmail.com smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TAL87wtFKqdeosQ+pSDP6+eHaqVPOgzuipLYwRp2PFw=;
 b=fk0G4/NqlBTVNsZ88qw3tKfcCjAPenmuYbKO81jqhobAEZyoak5FtHDSU8nEk9hKHZZHj/spiqkRXSyoIQ2T7HfWoxSuRsIuutvG8ciwpdzzbhxQDpcbIqkcwpRYHFrsFRYb45uaP+J8roq45wMQ7K7bwJLAE9WZwyVTKpHD1K8=
Received: from SA0PR11CA0096.namprd11.prod.outlook.com (2603:10b6:806:d1::11)
 by SA0PR10MB6426.namprd10.prod.outlook.com (2603:10b6:806:2c0::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.19; Thu, 30 Oct
 2025 15:17:01 +0000
Received: from SA2PEPF00003F63.namprd04.prod.outlook.com
 (2603:10b6:806:d1:cafe::84) by SA0PR11CA0096.outlook.office365.com
 (2603:10b6:806:d1::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9275.13 via Frontend Transport; Thu,
 30 Oct 2025 15:17:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SA2PEPF00003F63.mail.protection.outlook.com (10.167.248.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.10 via Frontend Transport; Thu, 30 Oct 2025 15:17:00 +0000
Received: from DLEE203.ent.ti.com (157.170.170.78) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 30 Oct
 2025 10:16:55 -0500
Received: from DLEE214.ent.ti.com (157.170.170.117) by DLEE203.ent.ti.com
 (157.170.170.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 30 Oct
 2025 10:16:55 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 30 Oct 2025 10:16:55 -0500
Received: from LTPW0EX92E.dhcp.ti.com (ltpw0ex92e.dhcp.ti.com [10.82.30.14])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 59UFGo152392003;
	Thu, 30 Oct 2025 10:16:50 -0500
From: Niranjan H Y <niranjan.hy@ti.com>
To: <alsa-devel@alsa-project.org>
CC: <linux-sound@vger.kernel.org>, <lgirdwood@gmail.com>,
	<broonie@kernel.org>, <perex@perex.cz>, <tiwai@suse.com>,
	<yung-chuan.liao@linux.intel.com>, <cezary.rojewski@intel.com>,
	<peter.ujfalusi@linux.intel.com>, <ranjani.sridharan@linux.intel.com>,
	<kai.vehmanen@linux.intel.com>, <pierre-louis.bossart@linux.dev>,
	<navada@ti.com>, <shenghao-ding@ti.com>, <v-hampiholi@ti.com>,
	<baojun.xu@ti.com>, <dan.carpenter@linaro.org>, Niranjan H Y
	<niranjan.hy@ti.com>, kernel test robot <lkp@intel.com>, Dan Carpenter
	<error27@gmail.com>
Subject: [PATCH v1] ASoc: tas2783A: Fix issues in firmware parsing
Date: Thu, 30 Oct 2025 20:46:37 +0530
Message-ID: <20251030151637.566-1-niranjan.hy@ti.com>
X-Mailer: git-send-email 2.33.0.windows.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003F63:EE_|SA0PR10MB6426:EE_
X-MS-Office365-Filtering-Correlation-Id: 0bca4ac4-c47f-4875-c168-08de17c76001
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|7416014|376014|1800799024|34020700016|36860700013|7053199007|12100799066;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?dN+t7SR7ryS8koFVl69/y1OtiwCQK52+VDdNclpyRwGm41jggQ16fy/J+3ix?=
 =?us-ascii?Q?VjVf+gfAj3uVYMygH8rpYdo6QdX1VzWSWC8+y19dffWoUOeB2Ur/TJgACTCW?=
 =?us-ascii?Q?9m/j0agaTN9o0nx/6NkusPgWN5/4MhAISzxDb0YjeUB4V8nZSvRZK03vgd+E?=
 =?us-ascii?Q?2h6bNV9uOxFFT77ZVwHkHXplONT0Lh8Kx+LqR0EuTvOrGnmINRn+SKiWYTQC?=
 =?us-ascii?Q?1WIMe3rnyGCxNgfveHbmIdnd57gZJhxrLQbxS2yoYuw9S4OMkxXOP/TX7fAc?=
 =?us-ascii?Q?kx0QXylp9LuoLUmYzWxs5dGYGn1nEhZ7IvHWrIq9o4aQKsJ9inCK3EdIoJEW?=
 =?us-ascii?Q?lkysoZxfhnSVHAF54n+8HHCbMS2wf+sZbIu5YTKWTFBnNQNu45+JnDMI9zQ8?=
 =?us-ascii?Q?6TyShZSmdvc3KC3FB7bHyq7KdtQ50hG14Il85OEYcABToRbihwllrQZ6qBnd?=
 =?us-ascii?Q?xWwlWluUdxuWx8r5DcLKPuPeK5EohgXoGMg7t0rOh4DH+5Kj0eWVnaotD/F9?=
 =?us-ascii?Q?/HvQOLAbnbnD0inSJmlHkWbCkoXs7AUTAjoo+ibZNpUPyIl+Ud1sM327cYao?=
 =?us-ascii?Q?zF46kp0Jx8Ga672mXqAYM4tvsIQnIRQ2iH9fXItYyfnW3fiDl+MSdKE7Ny2J?=
 =?us-ascii?Q?Se/h4uQLLpa3Kwt/7MXR62Pfs3ETEYJ7MLcn7s0TCaL+qa2Flif4wGJ1UvU1?=
 =?us-ascii?Q?NDkU07cK1DbGAJb6P/HJ1K2i/6zd3s069wYfLBRGI0dSridOLepmgwkI/g3i?=
 =?us-ascii?Q?kkiXMpUEOEz/Sx1f6obfqbKNcelBP8uu1ke2xVY/T/eawu2R2/RFpGx7NCch?=
 =?us-ascii?Q?7PyXYAI6UpMySIUC8d+MR4yVoOQUBFbrjYkEe7ZahbkaLLhNOrYDr658I02g?=
 =?us-ascii?Q?TsZbJi2pTDs10z0paSyS70KR4EnQXZMPhI/uHgJfMCDQE/QL++qAzknJSX4F?=
 =?us-ascii?Q?7oo2B1OqEh10owmsXYjTeMjjGwafA8xOyURrMLw1IuBNeN+i+w/PSSfg/THJ?=
 =?us-ascii?Q?iirBz743efYw/gLuGNBvcVwPBWOKSX7YQ0vT8XzeKhps3HoI3SbEyXyCDmdQ?=
 =?us-ascii?Q?0WFJNCkPKcrRCVDmbgLKj0GOprY9susO5DX9KP5a6PVGJrJDg8gVWPef67IN?=
 =?us-ascii?Q?RDyQClELgDD+9skWib6K9jUyOoKFqzXfJLgCHDn4LQ2wcpYRvFbRvhplj/Bk?=
 =?us-ascii?Q?UUlIAOH9lmBDeqgNP6yBIpoPhugkcYj1mdXDAJKz61iQ3dA8OtgiBwWsoia4?=
 =?us-ascii?Q?XqJgacCXURgOIQvQuI6TJaXhjlC/kBwCTgKZgxxlJtrLM0XXHVd/oCULpaf9?=
 =?us-ascii?Q?7pw/a23Fm4kclecRRZNpt6sTgW+phPqIsEyO/xflq5NCAPiFfveJP4Ir+p9C?=
 =?us-ascii?Q?d9VzV9hscquL+B3fWEwsvi2P2IjA4ThqM6Vc2V9w/r8bxFTmrgiuBX7oqCsm?=
 =?us-ascii?Q?O6ChCv4AAuOd6evxsw6+cnZ9QNLhzuQumX5T4dm3zTnOvgMVz6CtR/ZGKasY?=
 =?us-ascii?Q?VZDJdriraOQJJ7c=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(7416014)(376014)(1800799024)(34020700016)(36860700013)(7053199007)(12100799066);DIR:OUT;SFP:1501;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2025 15:17:00.9513
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 0bca4ac4-c47f-4875-c168-08de17c76001
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SA2PEPF00003F63.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR10MB6426
X-MailFrom: niranjan.hy@ti.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 65IXI3P55L2KUCPGVHSUMQ55QX2F5YJH
X-Message-ID-Hash: 65IXI3P55L2KUCPGVHSUMQ55QX2F5YJH
X-Mailman-Approved-At: Mon, 10 Nov 2025 14:39:59 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/65IXI3P55L2KUCPGVHSUMQ55QX2F5YJH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

During firmware download, if the size of the firmware is too small,
it wrongly assumes the firmware download is successful. If there is
size mismatch with chunk's header, invalid memory is accessed.
Fix these issues by throwing error during these cases.

Fixes: 4cc9bd8d7b32 (ASoc: tas2783A: Add soundwire based codec driver)
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <error27@gmail.com>
Closes: https://lore.kernel.org/r/202510291226.2R3fbYNh-lkp@intel.com/
Signed-off-by: Niranjan H Y <niranjan.hy@ti.com>
---
 sound/soc/codecs/tas2783-sdw.c | 20 ++++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/tas2783-sdw.c b/sound/soc/codecs/tas2783-sdw.c
index c8f925e5473d..43b779873b93 100644
--- a/sound/soc/codecs/tas2783-sdw.c
+++ b/sound/soc/codecs/tas2783-sdw.c
@@ -761,10 +761,17 @@ static void tas2783_fw_ready(const struct firmware *fmw, void *context)
 		goto out;
 	}
 
-	mutex_lock(&tas_dev->pde_lock);
 	img_sz = fmw->size;
 	buf = fmw->data;
 	offset += FW_DL_OFFSET;
+	if (offset >= (img_sz - FW_FL_HDR)) {
+		dev_err(tas_dev->dev,
+			"firmware is too small");
+		ret = -EINVAL;
+		goto out;
+	}
+
+	mutex_lock(&tas_dev->pde_lock);
 	while (offset < (img_sz - FW_FL_HDR)) {
 		memset(&hdr, 0, sizeof(hdr));
 		offset += read_header(&buf[offset], &hdr);
@@ -775,6 +782,14 @@ static void tas2783_fw_ready(const struct firmware *fmw, void *context)
 		/* size also includes the header */
 		file_blk_size = hdr.length - FW_FL_HDR;
 
+		/* make sure that enough data is there */
+		if (offset + file_blk_size > img_sz) {
+			ret = -EINVAL;
+			dev_err(tas_dev->dev,
+				"corrupt firmware file");
+			break;
+		}
+
 		switch (hdr.file_id) {
 		case 0:
 			ret = sdw_nwrite_no_pm(tas_dev->sdw_peripheral,
@@ -807,7 +822,8 @@ static void tas2783_fw_ready(const struct firmware *fmw, void *context)
 			break;
 	}
 	mutex_unlock(&tas_dev->pde_lock);
-	tas2783_update_calibdata(tas_dev);
+	if (!ret)
+		tas2783_update_calibdata(tas_dev);
 
 out:
 	if (!ret)
-- 
2.25.1

