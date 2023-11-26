Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AFBE57F94AF
	for <lists+alsa-devel@lfdr.de>; Sun, 26 Nov 2023 18:48:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DA314DEB;
	Sun, 26 Nov 2023 18:48:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DA314DEB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701020894;
	bh=mm75yY3VierQ4Sg0K9wvbWUaTL5SWCZe5zDnFPs0vL8=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=lMBeb60CYbXfOkcG6Ih96np9Xf/utSY2PzxkLF6jHldpC79ftTpnp+R1PtVUP7GkO
	 htzsh8txKXsgaaNbkKcPoqjvxMWYq5c8z5785zts57YJJEmPQYBAQqWduaHpvvpX36
	 dG5uOKY7+P63Z4JsrD0ukNBwBC8CXg4SPB1BxH+c=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3AAE6F8068E; Sun, 26 Nov 2023 18:46:12 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E43C9F80607;
	Sun, 26 Nov 2023 18:46:09 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5831FF8055A; Sat, 25 Nov 2023 10:22:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=unavailable autolearn_force=no version=3.4.6
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2061f.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e8d::61f])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A17DCF80549
	for <alsa-devel@alsa-project.org>; Sat, 25 Nov 2023 10:22:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A17DCF80549
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=pnmAOaJI
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n363r2YKQ6dlKRkV30uXZR6Ivd2Kl3kTshcRBpQMGKjRpDDIBzR9XPRc4/9ArYuxisBafnjkEksnZCeHzADNrgwwi1esKisoREZRCEa2hc5s5HnO/fyX7OQpl8tOKTTx7Jt0H6uAynxGDRiB4yL2sP9Jz+l11b+YsJ30qUuFhpp7BwpbLQ0tG5QbXQg/kwxXvZ6/fFQRrXevZ+q30QckwDo+bucVL68jjrSDARpegZHcd//CIycLJIeHur8er+Xzz2IcLwO1dlrGUiezO6lFbzZ+1taoPxnPMqyvbFppzLbv69z4gNlA9HkoUYgMclNwYdxF5FVdMqM6QpF3Uss9Cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PR5pBhrvTa4x88c0miORhGBaiP2C9i0FoWa79d3bN7M=;
 b=kUzz7v7hZdcLUqN1EiIhk5nUebCash8Sryxk1+oBvi9+c8GPyt1nHbRJYVWstf310aRso6gc/c9PwvIfmAdL/VS1ORwviLfUkdGKD6Dmu/athVgzTNsDR9EW1tSo76ZGr2siF/NTOCKKsC4NcSwh8HmLZ3U5LqFEQB+xXb4psH3RHURVyB3cgMWhpp53qKmvMRGKTMY4jkrM984G2twOpyqmWr1RA06fVVLg/gngyYcptOXI6g8M9l5vBcdckn+lbrqhKhCDBhKX8QbBuOiRJJps5CkEc99hQlzdRqn2riqSou6FfnFPCLYrm49kZqMLvFnfW9Q6xtuysccRt31mLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PR5pBhrvTa4x88c0miORhGBaiP2C9i0FoWa79d3bN7M=;
 b=pnmAOaJIf2t03eXbRmlBXA4oQQQCPMgxh8LPOIsUq1TC3AIOpqXhS5MPPcqsdW3CnHnlksCiUiweGRA/s0GXvtOGanRhlQywZTbJ6tmZpxlHPLxW+if8ZjQlvzTBGZ16aT7IpUW9nQqucpoD0/kLp5CJRTtO0UWl6QKTjkoN4BM=
Received: from BYAPR05CA0027.namprd05.prod.outlook.com (2603:10b6:a03:c0::40)
 by CH3PR12MB8404.namprd12.prod.outlook.com (2603:10b6:610:12d::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.24; Sat, 25 Nov
 2023 09:22:32 +0000
Received: from DS1PEPF00017098.namprd05.prod.outlook.com
 (2603:10b6:a03:c0:cafe::9e) by BYAPR05CA0027.outlook.office365.com
 (2603:10b6:a03:c0::40) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.17 via Frontend
 Transport; Sat, 25 Nov 2023 09:22:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF00017098.mail.protection.outlook.com (10.167.18.102) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7046.17 via Frontend Transport; Sat, 25 Nov 2023 09:22:31 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Sat, 25 Nov
 2023 03:22:27 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Sat, 25 Nov
 2023 01:22:26 -0800
Received: from xhdakumarma40u.xilinx.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.34
 via Frontend Transport; Sat, 25 Nov 2023 03:22:20 -0600
From: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
To: <broonie@kernel.org>, <tudor.ambarus@linaro.org>, <pratyush@kernel.org>,
	<miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
	<sbinding@opensource.cirrus.com>, <lee@kernel.org>,
	<james.schulman@cirrus.com>, <david.rhodes@cirrus.com>,
	<rf@opensource.cirrus.com>, <perex@perex.cz>, <tiwai@suse.com>
CC: <linux-spi@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<michael@walle.cc>, <linux-mtd@lists.infradead.org>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>, <michal.simek@amd.com>,
	<linux-arm-kernel@lists.infradead.org>, <alsa-devel@alsa-project.org>,
	<patches@opensource.cirrus.com>, <linux-sound@vger.kernel.org>,
	<git@amd.com>, <amitrkcian2002@gmail.com>, Amit Kumar Mahapatra
	<amit.kumar-mahapatra@amd.com>
Subject: [PATCH v11 06/10] mtd: spi-nor: Move write enable inside specific
 write & erase APIs
Date: Sat, 25 Nov 2023 14:51:33 +0530
Message-ID: <20231125092137.2948-7-amit.kumar-mahapatra@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20231125092137.2948-1-amit.kumar-mahapatra@amd.com>
References: <20231125092137.2948-1-amit.kumar-mahapatra@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017098:EE_|CH3PR12MB8404:EE_
X-MS-Office365-Filtering-Correlation-Id: 35963d56-772b-493b-c5f1-08dbed980d3d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ekob9I+GwVxLa3o9BqUwVdGksMiJacoSZoBVVAHUmuIDmoufSnN3E64BN6x7nokgiw/x/ByRbO4C6KN8mFFKBVvlFK8Gz8ZRYaeSOYcp1l/zQQpe2m2gaeRGfE1WZCx0SCZy4EsjBJxaDLjOao2OuWr7Isv9Av8Ab0LfzkEKQWX+mIB+FTvbPgpFSOsYhr+vWoOtxlkFs2kxdqA4xYacIUHQcqF3tujihr9nUJtvNw+og60FhvQiQh4Xf2Mxjv98f56uMfqBeh2wXCpnAgRVqaj8CSv30AMgwfBKZ1QwOxIsx+TpWRY8SXybC4bZknKTtuYfypplVCL1DowQijABvcUCIWHgPrkxPJ8xRgbtAxDjWSdd2wbt7tV9LVOgb87md6qaWOK8vtMIB6HVfSAUM9TyGdds2K1ROb7zNpVEeyiB2XE/88TTTEIbdN/c7GIEQTAbjyh5256fmNK+b1Mlw3NxCJZHyRvv3u5G3GnE9e4zdYtHENRfWNpQGtDeCT4Jt9XAioQe376/Tnkj3wDoSUf1c4PiUNWn8hQp58jTck93s0cPDeMmPiYXVLMU9LGa4y7/4AckXZZ62IGzFKAoJKRfqIFfpziASGePvMvK/9PKn7/46+ZoJoxDs7fSPxl2a8E/cnuHiZRPyAukw4jQhoM0/Fh2vZ5UGhSehmbqF1qg05tExUPb4pMSJGxYDpMw7XL2QHQ82gjU/hTJkHl5uxQsDhAxQytRs9jXCsAWTrMu7wLSTzsqoIw0zXPlX42eFsmlIxe8e90zh+I579OjOExfkqCFoMmjR1ZbqHXZgE8=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(396003)(346002)(136003)(376002)(39860400002)(230922051799003)(451199024)(64100799003)(186009)(1800799012)(82310400011)(46966006)(40470700004)(36840700001)(40480700001)(36860700001)(81166007)(83380400001)(2616005)(1076003)(47076005)(356005)(4326008)(8936002)(8676002)(86362001)(426003)(336012)(26005)(82740400003)(40460700003)(478600001)(6666004)(110136005)(70206006)(70586007)(54906003)(316002)(2906002)(921008)(41300700001)(36756003)(7416002)(5660300002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2023 09:22:31.5239
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 35963d56-772b-493b-c5f1-08dbed980d3d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DS1PEPF00017098.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8404
X-MailFrom: amit.kumar-mahapatra@amd.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: TZLMAQAD2QGCVA6SJ7ICQGWKONONCVE3
X-Message-ID-Hash: TZLMAQAD2QGCVA6SJ7ICQGWKONONCVE3
X-Mailman-Approved-At: Sun, 26 Nov 2023 17:37:50 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TZLMAQAD2QGCVA6SJ7ICQGWKONONCVE3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

In most of the register write operations the spi_nor_write_enable is called
from within that API from where spi_mem APIs are called. Follwoing the same
trend move the write enable API from spi_nor_write & spi_nor_erase APIs to
the respective write & erase APIs.

Signed-off-by: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
---
 drivers/mtd/spi-nor/core.c | 40 ++++++++++++++------------------------
 1 file changed, 15 insertions(+), 25 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 72c80d8b5858..93ae69b7ff83 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -301,6 +301,12 @@ static ssize_t spi_nor_spimem_write_data(struct spi_nor *nor, loff_t to,
 ssize_t spi_nor_write_data(struct spi_nor *nor, loff_t to, size_t len,
 			   const u8 *buf)
 {
+	int ret;
+
+	ret = spi_nor_write_enable(nor);
+	if (ret)
+		return ret;
+
 	if (nor->spimem)
 		return spi_nor_spimem_write_data(nor, to, len, buf);
 
@@ -1074,6 +1080,10 @@ static int spi_nor_erase_chip(struct spi_nor *nor)
 
 	dev_dbg(nor->dev, " %lldKiB\n", (long long)(nor->mtd.size >> 10));
 
+	ret = spi_nor_write_enable(nor);
+	if (ret)
+		return ret;
+
 	if (nor->spimem) {
 		struct spi_mem_op op = SPI_NOR_CHIP_ERASE_OP;
 
@@ -1481,10 +1491,14 @@ static u32 spi_nor_convert_addr(struct spi_nor *nor, loff_t addr)
  */
 int spi_nor_erase_sector(struct spi_nor *nor, u32 addr)
 {
-	int i;
+	int i, ret;
 
 	addr = spi_nor_convert_addr(nor, addr);
 
+	ret = spi_nor_write_enable(nor);
+	if (ret)
+		return ret;
+
 	if (nor->spimem) {
 		struct spi_mem_op op =
 			SPI_NOR_SECTOR_ERASE_OP(nor->erase_opcode,
@@ -1777,12 +1791,6 @@ static int spi_nor_erase_multi_sectors(struct spi_nor *nor, u64 addr, u32 len)
 			if (ret)
 				goto destroy_erase_cmd_list;
 
-			ret = spi_nor_write_enable(nor);
-			if (ret) {
-				spi_nor_unlock_device(nor);
-				goto destroy_erase_cmd_list;
-			}
-
 			ret = spi_nor_erase_sector(nor, addr);
 			spi_nor_unlock_device(nor);
 			if (ret)
@@ -1841,12 +1849,6 @@ static int spi_nor_erase(struct mtd_info *mtd, struct erase_info *instr)
 		if (ret)
 			goto erase_err;
 
-		ret = spi_nor_write_enable(nor);
-		if (ret) {
-			spi_nor_unlock_device(nor);
-			goto erase_err;
-		}
-
 		ret = spi_nor_erase_chip(nor);
 		spi_nor_unlock_device(nor);
 		if (ret)
@@ -1877,12 +1879,6 @@ static int spi_nor_erase(struct mtd_info *mtd, struct erase_info *instr)
 			if (ret)
 				goto erase_err;
 
-			ret = spi_nor_write_enable(nor);
-			if (ret) {
-				spi_nor_unlock_device(nor);
-				goto erase_err;
-			}
-
 			ret = spi_nor_erase_sector(nor, addr);
 			spi_nor_unlock_device(nor);
 			if (ret)
@@ -2177,12 +2173,6 @@ static int spi_nor_write(struct mtd_info *mtd, loff_t to, size_t len,
 		if (ret)
 			goto write_err;
 
-		ret = spi_nor_write_enable(nor);
-		if (ret) {
-			spi_nor_unlock_device(nor);
-			goto write_err;
-		}
-
 		ret = spi_nor_write_data(nor, addr, page_remain, buf + i);
 		spi_nor_unlock_device(nor);
 		if (ret < 0)
-- 
2.17.1

