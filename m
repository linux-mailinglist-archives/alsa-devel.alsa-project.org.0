Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D806E7F94B6
	for <lists+alsa-devel@lfdr.de>; Sun, 26 Nov 2023 18:48:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 89A7F7F4;
	Sun, 26 Nov 2023 18:48:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 89A7F7F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701020939;
	bh=7IFovi8UBbhxzs3+2zADr9iu/wAwgI3ZrxgeQ9Va0to=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=qtIZoT65eSzHVUNVJidGJvryohcX+H4bOob/KRXKQ+ChXxw6Nx9QcRKZcoWQ/nDSq
	 Ead2jKqHrH75Zb2+qfpD0L2pY/EldRTpTZRgSggjStkpBcaKTx3kL0L9G3rnZ8Vxs9
	 mt7wHYUY2tl7py8zo7aydbnjosy+vvqzU9i8t+ok=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D2770F806D2; Sun, 26 Nov 2023 18:46:19 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6C04EF806D6;
	Sun, 26 Nov 2023 18:46:16 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A2CCAF80549; Sat, 25 Nov 2023 10:23:17 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20614.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eaa::614])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 17A3DF8055B
	for <alsa-devel@alsa-project.org>; Sat, 25 Nov 2023 10:22:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 17A3DF8055B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=MY8wx1us
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k+Kjjr1H5gTuiIYOVBv5n/4VIiIy94M04F9QjJyr9nV5YeqVobkawabHXXb2MQVoo2M1n+0GzRL1XZjUGocevGo5PBhtPRCxBNawgKrW+tSaEDcUYVl+XkSh33RdGW6ulAIA27NcNUpFmUF/Ruf5VnaJBjgp8j6tAQlCXuvFDdCL3S09WoURfSiESOLVg0mCnepudChe1Y/5ugSaKjnPAxUJsI2MSxvuueR9KwefpqJC/sMIErB/c6i+I/pKFNsyE1m2s5QDb2h+Wwh1h7lOdUmECf+ez6BUBa5FK6VbAH6Gb6VquuTAcTpk4a+n4EKYxbLdoWeBMV6LL2ucyySuag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xSD9XjMXnqfZVtPlC/UyYP9MYfZ2ELc1yJgiHn85INk=;
 b=DT7Mub4bYFzTR1z29Dvr8thn1pLzlqt/5aoPvnZmS+Eh4ZBTGB3EAdq8tI/b8mReWKCcsg7+cCHKcIinvZTHnI4lNGOZwkyL0zmEEf0gRTR7jg1hvBRLKeYn934U8vzg72/13nokNo7QNpmc//ctlKed1lsGNPTo7DDW4UNRt4c7OXDT6/ZckqMpg0kkFEgnn/cdiiQQIpMJ9OE3iu1NSqo4v6yB05a94yKgMPrZN23wUrZjl4ppPzK03zNenLHAOCtFn3Jk0EGn0mcer4FPrKPu7OaVSn3Dcyq6jrYIPXsifPmNeALV/lOQbrCDK+rLuEPzQUu1kZa9FuD03mt06A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xSD9XjMXnqfZVtPlC/UyYP9MYfZ2ELc1yJgiHn85INk=;
 b=MY8wx1us8K9sEu0RElkPtmA+uCrlh6FZL3oTv4rq4JH5XS+7oTMwbn2voMws0TO28EhvAT7+rDNkN3d/OcLlSmUUYEVv8sL0ZH73AAfX3F0hyHzCDgAfBq4mj/lpEgWOgw/gxqtNNpniUF8WFlWMcTXDVQV1gl1uqNO8vbUcM8M=
Received: from BYAPR05CA0036.namprd05.prod.outlook.com (2603:10b6:a03:c0::49)
 by MW4PR12MB7014.namprd12.prod.outlook.com (2603:10b6:303:218::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.25; Sat, 25 Nov
 2023 09:22:52 +0000
Received: from DS1PEPF00017098.namprd05.prod.outlook.com
 (2603:10b6:a03:c0:cafe::f5) by BYAPR05CA0036.outlook.office365.com
 (2603:10b6:a03:c0::49) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.15 via Frontend
 Transport; Sat, 25 Nov 2023 09:22:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF00017098.mail.protection.outlook.com (10.167.18.102) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7046.17 via Frontend Transport; Sat, 25 Nov 2023 09:22:51 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Sat, 25 Nov
 2023 03:22:33 -0600
Received: from xhdakumarma40u.xilinx.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.34
 via Frontend Transport; Sat, 25 Nov 2023 03:22:27 -0600
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
Subject: [PATCH v11 07/10] mtd: spi-nor: Add stacked memories support in
 spi-nor
Date: Sat, 25 Nov 2023 14:51:34 +0530
Message-ID: <20231125092137.2948-8-amit.kumar-mahapatra@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20231125092137.2948-1-amit.kumar-mahapatra@amd.com>
References: <20231125092137.2948-1-amit.kumar-mahapatra@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017098:EE_|MW4PR12MB7014:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d060ebe-065d-4c65-4693-08dbed98196c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	7W17UDEb3PongV+r+wrBVZeND6Z7HK6499pAm9l9x1JzakXbG3GcyRuYr0m+oJiBokymfizPvq6BXFgsBQt2wLIq3phGvw7xVGjZUb+lcM5LzJpWwASOwcQlWlLknFx0xzi1C7wW283e467xS1xt29SUfOJLlqQXB5JRIKNZFcJDO8mpyYiJHOYYI05ArPoURwicFkzAyWNUPf6wE7TVuMK1uwZ42V3Pacp01CebaKIEG3JA25zlJegsuclt/SD+/Yo800oHrKkvUJazCTU4O5veny5H72L3D9o9gRPUKw/NgYdxlx3ophl7fqMoz0dTAV3g8eq5/mJQv+vWZ3w+cre5LTKwqTSF+C1Sx+fAhyRxB3tAQI9KMLUlFzVg2t5B/qP2RdahVGN8cLnkCtRxZVHTiRgNtTT+fgy5jT84dBXGkP6glCpGfAp+VPtjqx+flIrhScMHX7lyWs/px0GmlBOmIXY+ytBaLjZt+v1S5lcBhtwJSQMRmU6m5AEh4YkcfebgT9V0UGg1vc98o+tHgCkuIwdJmZ6jEJ8Nr4calLWjMrxUNoAIntKROaAHqBbsIzaN2XA/ZPhYO9mc6YnICXy1vUm2FPH7t8DlG7TL79gm9e9b18Q5g+ybeAW5Oiz/T6bDeGTlrX1SM4ycQiQVU1OZRiICmztrNdp0vmfn1ehEP+lWXF+y1rOb7Y67MPKetgIHR6e/eYWaugVpHoWYnky7LOru+kLknuCCnCVXIsFAB15LbY/pGIA0H3vP8FgPIwS5epB2GGLVMLn1Iy6pkws9P/NSP3nCCYmahglysBY=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(136003)(396003)(39860400002)(346002)(376002)(230922051799003)(1800799012)(82310400011)(186009)(451199024)(64100799003)(40470700004)(36840700001)(46966006)(7416002)(4326008)(2906002)(30864003)(8676002)(8936002)(41300700001)(110136005)(26005)(426003)(1076003)(70206006)(316002)(54906003)(70586007)(36860700001)(5660300002)(336012)(2616005)(6666004)(40480700001)(83380400001)(47076005)(81166007)(82740400003)(86362001)(921008)(478600001)(356005)(36756003)(40460700003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2023 09:22:51.9614
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 6d060ebe-065d-4c65-4693-08dbed98196c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DS1PEPF00017098.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7014
X-MailFrom: amit.kumar-mahapatra@amd.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: BV3OIRZFLP4GFEUNJ3CBR3KIGWPJT2TI
X-Message-ID-Hash: BV3OIRZFLP4GFEUNJ3CBR3KIGWPJT2TI
X-Mailman-Approved-At: Sun, 26 Nov 2023 17:37:51 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BV3OIRZFLP4GFEUNJ3CBR3KIGWPJT2TI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Each flash that is connected in stacked mode should have a separate
parameter structure. So, the flash parameter member(*params) of the spi_nor
structure is changed to an array (*params[2]). The array is used to store
the parameters of each flash connected in stacked configuration.

The current implementation assumes that a maximum of two flashes are
connected in stacked mode and both the flashes are of same make but can
differ in sizes. So, except the sizes all other flash parameters of both
the flashes are identical.

SPI-NOR is not aware of the chip_select values, for any incoming request
SPI-NOR will decide the flash index with the help of individual flash size
and the configuration type (single/stacked). SPI-NOR will pass on the flash
index information to the SPI core & SPI driver by setting the appropriate
bit in nor->spimem->spi->cs_index_mask. For example, if nth bit of
nor->spimem->spi->cs_index_mask is set then the driver would
assert/de-assert spi->chip_slect[n].

Signed-off-by: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
---
 drivers/mtd/spi-nor/core.c  | 272 +++++++++++++++++++++++++++++-------
 drivers/mtd/spi-nor/core.h  |   4 +
 include/linux/mtd/spi-nor.h |  15 +-
 3 files changed, 240 insertions(+), 51 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 93ae69b7ff83..e990be7c7eb6 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -1821,13 +1821,18 @@ static int spi_nor_erase_multi_sectors(struct spi_nor *nor, u64 addr, u32 len)
 static int spi_nor_erase(struct mtd_info *mtd, struct erase_info *instr)
 {
 	struct spi_nor *nor = mtd_to_spi_nor(mtd);
-	u32 addr, len;
+	struct spi_nor_flash_parameter *params;
+	u32 addr, len, offset, cur_cs_num = 0;
 	uint32_t rem;
 	int ret;
+	u64 sz;
 
 	dev_dbg(nor->dev, "at 0x%llx, len %lld\n", (long long)instr->addr,
 			(long long)instr->len);
 
+	params = spi_nor_get_params(nor, 0);
+	sz = params->size;
+
 	if (spi_nor_has_uniform_erase(nor)) {
 		div_u64_rem(instr->len, mtd->erasesize, &rem);
 		if (rem)
@@ -1849,23 +1854,27 @@ static int spi_nor_erase(struct mtd_info *mtd, struct erase_info *instr)
 		if (ret)
 			goto erase_err;
 
-		ret = spi_nor_erase_chip(nor);
-		spi_nor_unlock_device(nor);
-		if (ret)
-			goto erase_err;
+		while (cur_cs_num < nor->num_flash) {
+			nor->spimem->spi->cs_index_mask = 0x01 << cur_cs_num;
+			ret = spi_nor_erase_chip(nor);
+			spi_nor_unlock_device(nor);
+			if (ret)
+				goto erase_err;
 
-		/*
-		 * Scale the timeout linearly with the size of the flash, with
-		 * a minimum calibrated to an old 2MB flash. We could try to
-		 * pull these from CFI/SFDP, but these values should be good
-		 * enough for now.
-		 */
-		timeout = max(CHIP_ERASE_2MB_READY_WAIT_JIFFIES,
-			      CHIP_ERASE_2MB_READY_WAIT_JIFFIES *
-			      (unsigned long)(mtd->size / SZ_2M));
-		ret = spi_nor_wait_till_ready_with_timeout(nor, timeout);
-		if (ret)
-			goto erase_err;
+			/*
+			 * Scale the timeout linearly with the size of the flash, with
+			 * a minimum calibrated to an old 2MB flash. We could try to
+			 * pull these from CFI/SFDP, but these values should be good
+			 * enough for now.
+			 */
+			timeout = max(CHIP_ERASE_2MB_READY_WAIT_JIFFIES,
+				      CHIP_ERASE_2MB_READY_WAIT_JIFFIES *
+				      (unsigned long)(params->size / SZ_2M));
+			ret = spi_nor_wait_till_ready_with_timeout(nor, timeout);
+			if (ret)
+				goto erase_err;
+			cur_cs_num++;
+		}
 
 	/* REVISIT in some cases we could speed up erasing large regions
 	 * by using SPINOR_OP_SE instead of SPINOR_OP_BE_4K.  We may have set up
@@ -1874,12 +1883,26 @@ static int spi_nor_erase(struct mtd_info *mtd, struct erase_info *instr)
 
 	/* "sector"-at-a-time erase */
 	} else if (spi_nor_has_uniform_erase(nor)) {
+		/* Determine the flash from which the operation need to start */
+		while ((cur_cs_num < nor->num_flash) && (addr > sz - 1)) {
+			cur_cs_num++;
+			params = spi_nor_get_params(nor, cur_cs_num);
+			sz += params->size;
+		}
+
 		while (len) {
 			ret = spi_nor_lock_device(nor);
 			if (ret)
 				goto erase_err;
 
-			ret = spi_nor_erase_sector(nor, addr);
+			nor->spimem->spi->cs_index_mask = 0x01 << cur_cs_num;
+			offset = addr;
+			if (nor->flags & SNOR_F_HAS_STACKED) {
+				params = spi_nor_get_params(nor, cur_cs_num);
+				offset -= (sz - params->size);
+			}
+
+			ret = spi_nor_erase_sector(nor, offset);
 			spi_nor_unlock_device(nor);
 			if (ret)
 				goto erase_err;
@@ -1890,13 +1913,45 @@ static int spi_nor_erase(struct mtd_info *mtd, struct erase_info *instr)
 
 			addr += mtd->erasesize;
 			len -= mtd->erasesize;
+
+			/*
+			 * Flash cross over condition in stacked mode.
+			 */
+			if ((nor->flags & SNOR_F_HAS_STACKED) && (addr > sz - 1)) {
+				cur_cs_num++;
+				params = spi_nor_get_params(nor, cur_cs_num);
+				sz += params->size;
+			}
 		}
 
 	/* erase multiple sectors */
 	} else {
-		ret = spi_nor_erase_multi_sectors(nor, addr, len);
-		if (ret)
-			goto erase_err;
+		u64 erase_len = 0;
+
+		/* Determine the flash from which the operation need to start */
+		while ((cur_cs_num < nor->num_flash) && (addr > sz - 1)) {
+			cur_cs_num++;
+			params = spi_nor_get_params(nor, cur_cs_num);
+			sz += params->size;
+		}
+		/* perform multi sector erase onec per Flash*/
+		while (len) {
+			erase_len = (len > (sz - addr)) ? (sz - addr) : len;
+			offset = addr;
+			nor->spimem->spi->cs_index_mask = 0x01 << cur_cs_num;
+			if (nor->flags & SNOR_F_HAS_STACKED) {
+				params = spi_nor_get_params(nor, cur_cs_num);
+				offset -= (sz - params->size);
+			}
+			ret = spi_nor_erase_multi_sectors(nor, offset, erase_len);
+			if (ret)
+				goto erase_err;
+			len -= erase_len;
+			addr += erase_len;
+			cur_cs_num++;
+			params = spi_nor_get_params(nor, cur_cs_num);
+			sz += params->size;
+		}
 	}
 
 	ret = spi_nor_write_disable(nor);
@@ -2087,9 +2142,11 @@ static int spi_nor_read(struct mtd_info *mtd, loff_t from, size_t len,
 			size_t *retlen, u_char *buf)
 {
 	struct spi_nor *nor = mtd_to_spi_nor(mtd);
+	struct spi_nor_flash_parameter *params;
+	ssize_t ret, read_len, len_lock =  len;
 	loff_t from_lock = from;
-	size_t len_lock = len;
-	ssize_t ret;
+	u32 cur_cs_num = 0;
+	u64 sz;
 
 	dev_dbg(nor->dev, "from 0x%08x, len %zd\n", (u32)from, len);
 
@@ -2097,9 +2154,23 @@ static int spi_nor_read(struct mtd_info *mtd, loff_t from, size_t len,
 	if (ret)
 		return ret;
 
+	params = spi_nor_get_params(nor, 0);
+	sz = params->size;
+
+	/* Determine the flash from which the operation need to start */
+	while ((cur_cs_num < nor->num_flash) && (from > sz - 1)) {
+		cur_cs_num++;
+		params = spi_nor_get_params(nor, cur_cs_num);
+		sz += params->size;
+	}
 	while (len) {
 		loff_t addr = from;
 
+		nor->spimem->spi->cs_index_mask = 0x01 << cur_cs_num;
+		read_len = (len > (sz - addr)) ? (sz - addr) : len;
+		params = spi_nor_get_params(nor, cur_cs_num);
+		addr -= (sz - params->size);
+
 		addr = spi_nor_convert_addr(nor, addr);
 
 		ret = spi_nor_read_data(nor, addr, len, buf);
@@ -2111,11 +2182,22 @@ static int spi_nor_read(struct mtd_info *mtd, loff_t from, size_t len,
 		if (ret < 0)
 			goto read_err;
 
-		WARN_ON(ret > len);
+		WARN_ON(ret > read_len);
 		*retlen += ret;
 		buf += ret;
 		from += ret;
 		len -= ret;
+
+		/*
+		 * Flash cross over condition in stacked mode.
+		 *
+		 */
+		if ((nor->flags & SNOR_F_HAS_STACKED) && (from > sz - 1)) {
+			cur_cs_num++;
+			params = spi_nor_get_params(nor, cur_cs_num);
+			sz += params->size;
+		}
+
 	}
 	ret = 0;
 
@@ -2136,8 +2218,9 @@ static int spi_nor_write(struct mtd_info *mtd, loff_t to, size_t len,
 	struct spi_nor *nor = mtd_to_spi_nor(mtd);
 	struct spi_nor_flash_parameter *params;
 	size_t page_offset, page_remain, i;
+	u32 page_size, cur_cs_num = 0;
 	ssize_t ret;
-	u32 page_size;
+	u64 sz;
 
 	dev_dbg(nor->dev, "to 0x%08x, len %zd\n", (u32)to, len);
 
@@ -2147,6 +2230,14 @@ static int spi_nor_write(struct mtd_info *mtd, loff_t to, size_t len,
 
 	params = spi_nor_get_params(nor, 0);
 	page_size = params->page_size;
+	sz = params->size;
+
+	/* Determine the flash from which the operation need to start */
+	while ((cur_cs_num < nor->num_flash) && (to > sz - 1)) {
+		cur_cs_num++;
+		params = spi_nor_get_params(nor, cur_cs_num);
+		sz += params->size;
+	}
 
 	for (i = 0; i < len; ) {
 		ssize_t written;
@@ -2167,6 +2258,10 @@ static int spi_nor_write(struct mtd_info *mtd, loff_t to, size_t len,
 		/* the size of data remaining on the first page */
 		page_remain = min_t(size_t, page_size - page_offset, len - i);
 
+		nor->spimem->spi->cs_index_mask = 0x01 << cur_cs_num;
+		params = spi_nor_get_params(nor, cur_cs_num);
+		addr -= (sz - params->size);
+
 		addr = spi_nor_convert_addr(nor, addr);
 
 		ret = spi_nor_lock_device(nor);
@@ -2184,6 +2279,15 @@ static int spi_nor_write(struct mtd_info *mtd, loff_t to, size_t len,
 			goto write_err;
 		*retlen += written;
 		i += written;
+
+		/*
+		 * Flash cross over condition in stacked mode.
+		 */
+		if ((nor->flags & SNOR_F_HAS_STACKED) && ((to + i) > sz - 1)) {
+			cur_cs_num++;
+			params = spi_nor_get_params(nor, cur_cs_num);
+			sz += params->size;
+		}
 	}
 
 write_err:
@@ -2297,8 +2401,6 @@ int spi_nor_hwcaps_pp2cmd(u32 hwcaps)
 static int spi_nor_spimem_check_op(struct spi_nor *nor,
 				   struct spi_mem_op *op)
 {
-	struct spi_nor_flash_parameter *params = spi_nor_get_params(nor, 0);
-
 	/*
 	 * First test with 4 address bytes. The opcode itself might
 	 * be a 3B addressing opcode but we don't care, because
@@ -2307,7 +2409,7 @@ static int spi_nor_spimem_check_op(struct spi_nor *nor,
 	 */
 	op->addr.nbytes = 4;
 	if (!spi_mem_supports_op(nor->spimem, op)) {
-		if (params->size > SZ_16M)
+		if (nor->mtd.size > SZ_16M)
 			return -EOPNOTSUPP;
 
 		/* If flash size <= 16MB, 3 address bytes are sufficient */
@@ -2905,7 +3007,10 @@ static void spi_nor_init_fixup_flags(struct spi_nor *nor)
 static int spi_nor_late_init_params(struct spi_nor *nor)
 {
 	struct spi_nor_flash_parameter *params = spi_nor_get_params(nor, 0);
-	int ret;
+	struct device_node *np = spi_nor_get_flash_node(nor);
+	u64 flash_size[SNOR_FLASH_CNT_MAX];
+	u32 idx = 0;
+	int rc, ret;
 
 	if (nor->manufacturer && nor->manufacturer->fixups &&
 	    nor->manufacturer->fixups->late_init) {
@@ -2937,6 +3042,44 @@ static int spi_nor_late_init_params(struct spi_nor *nor)
 	if (params->n_banks > 1)
 		params->bank_size = div64_u64(params->size, params->n_banks);
 
+	nor->num_flash = 0;
+
+	/*
+	 * The flashes that are connected in stacked mode should be of same make.
+	 * Except the flash size all other properties are identical for all the
+	 * flashes connected in stacked mode.
+	 * The flashes that are connected in parallel mode should be identical.
+	 */
+	while (idx < SNOR_FLASH_CNT_MAX) {
+		rc = of_property_read_u64_index(np, "stacked-memories", idx, &flash_size[idx]);
+		if (rc)
+			break;
+		idx++;
+		if (!(nor->flags & SNOR_F_HAS_STACKED))
+			nor->flags |= SNOR_F_HAS_STACKED;
+
+		nor->num_flash++;
+	}
+
+	/*
+	 * By default one flash device should be connected
+	 * so, nor->num_flash is 1.
+	 */
+	if (!nor->num_flash)
+		nor->num_flash = 1;
+
+	if (nor->flags & SNOR_F_HAS_STACKED) {
+		for (idx = 1; idx < nor->num_flash; idx++) {
+			params = spi_nor_get_params(nor, idx);
+			params = devm_kzalloc(nor->dev, sizeof(*params), GFP_KERNEL);
+			if (params) {
+				memcpy(params, spi_nor_get_params(nor, 0), sizeof(*params));
+				params->size = flash_size[idx];
+				spi_nor_set_params(nor, idx, params);
+			}
+		}
+	}
+
 	return 0;
 }
 
@@ -3145,16 +3288,28 @@ static int spi_nor_set_octal_dtr(struct spi_nor *nor, bool enable)
  */
 static int spi_nor_quad_enable(struct spi_nor *nor)
 {
-	struct spi_nor_flash_parameter *params = spi_nor_get_params(nor, 0);
+	struct spi_nor_flash_parameter *params;
+	int err, idx;
 
-	if (!params->quad_enable)
-		return 0;
+	for (idx = 0; idx < nor->num_flash; idx++) {
+		params = spi_nor_get_params(nor, idx);
+		if (!params->quad_enable)
+			return 0;
 
-	if (!(spi_nor_get_protocol_width(nor->read_proto) == 4 ||
-	      spi_nor_get_protocol_width(nor->write_proto) == 4))
-		return 0;
+		if (!(spi_nor_get_protocol_width(nor->read_proto) == 4 ||
+		      spi_nor_get_protocol_width(nor->write_proto) == 4))
+			return 0;
+		/*
+		 * Set the appropriate CS index before
+		 * issuing the command.
+		 */
+		nor->spimem->spi->cs_index_mask = 0x01 << idx;
 
-	return params->quad_enable(nor);
+		err = params->quad_enable(nor);
+		if (err)
+			return err;
+	}
+	return err;
 }
 
 /**
@@ -3186,7 +3341,7 @@ int spi_nor_set_4byte_addr_mode(struct spi_nor *nor, bool enable)
 
 static int spi_nor_init(struct spi_nor *nor)
 {
-	int err;
+	int err, idx;
 
 	err = spi_nor_set_octal_dtr(nor, true);
 	if (err) {
@@ -3227,9 +3382,16 @@ static int spi_nor_init(struct spi_nor *nor)
 		 */
 		WARN_ONCE(nor->flags & SNOR_F_BROKEN_RESET,
 			  "enabling reset hack; may not recover from unexpected reboots\n");
-		err = spi_nor_set_4byte_addr_mode(nor, true);
-		if (err)
-			return err;
+		for (idx = 0; idx < nor->num_flash; idx++) {
+			/*
+			 * Select the appropriate CS index before
+			 * issuing the command.
+			 */
+			nor->spimem->spi->cs_index_mask = 0x01 << idx;
+			err = spi_nor_set_4byte_addr_mode(nor, true);
+			if (err)
+				return err;
+		}
 	}
 
 	return 0;
@@ -3344,18 +3506,28 @@ static void spi_nor_put_device(struct mtd_info *mtd)
 static void spi_nor_restore(struct spi_nor *nor)
 {
 	int ret;
+	int idx;
 
 	/* restore the addressing mode */
 	if (nor->addr_nbytes == 4 && !(nor->flags & SNOR_F_4B_OPCODES) &&
 	    nor->flags & SNOR_F_BROKEN_RESET) {
-		ret = spi_nor_set_4byte_addr_mode(nor, false);
-		if (ret)
+		for (idx = 0; idx < nor->num_flash; idx++) {
 			/*
-			 * Do not stop the execution in the hope that the flash
-			 * will default to the 3-byte address mode after the
-			 * software reset.
+			 * Select the appropriate CS index before
+			 * issuing the command.
 			 */
-			dev_err(nor->dev, "Failed to exit 4-byte address mode, err = %d\n", ret);
+			nor->spimem->spi->cs_index_mask = 1 << idx;
+			ret = spi_nor_set_4byte_addr_mode(nor, false);
+			if (ret)
+				/*
+				 * Do not stop the execution in the hope that the flash
+				 * will default to the 3-byte address mode after the
+				 * software reset.
+				 */
+				dev_err(nor->dev,
+					"Failed to exit 4-byte address mode, err = %d\n",
+					ret);
+		}
 	}
 
 	if (nor->flags & SNOR_F_SOFT_RESET)
@@ -3422,6 +3594,8 @@ static void spi_nor_set_mtd_info(struct spi_nor *nor)
 	struct spi_nor_flash_parameter *params = spi_nor_get_params(nor, 0);
 	struct mtd_info *mtd = &nor->mtd;
 	struct device *dev = nor->dev;
+	u64 total_sz = 0;
+	int idx;
 
 	spi_nor_set_mtd_locking_ops(nor);
 	spi_nor_set_mtd_otp_ops(nor);
@@ -3440,7 +3614,11 @@ static void spi_nor_set_mtd_info(struct spi_nor *nor)
 		mtd->_erase = spi_nor_erase;
 	mtd->writesize = params->writesize;
 	mtd->writebufsize = params->page_size;
-	mtd->size = params->size;
+	for (idx = 0; idx < nor->num_flash; idx++) {
+		params = spi_nor_get_params(nor, idx);
+		total_sz += params->size;
+	}
+	mtd->size = total_sz;
 	mtd->_read = spi_nor_read;
 	/* Might be already set by some SST flashes. */
 	if (!mtd->_write)
diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
index 93cd2fc3606d..b2997eca7551 100644
--- a/drivers/mtd/spi-nor/core.h
+++ b/drivers/mtd/spi-nor/core.h
@@ -18,6 +18,9 @@
 #define SPI_NOR_DEFAULT_N_BANKS 1
 #define SPI_NOR_DEFAULT_SECTOR_SIZE SZ_64K
 
+/* In single configuration enable CS0 */
+#define SPI_NOR_ENABLE_CS0     BIT(0)
+
 /* Standard SPI NOR flash operations. */
 #define SPI_NOR_READID_OP(naddr, ndummy, buf, len)			\
 	SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_RDID, 0),			\
@@ -140,6 +143,7 @@ enum spi_nor_option_flags {
 	SNOR_F_RWW		= BIT(14),
 	SNOR_F_ECC		= BIT(15),
 	SNOR_F_NO_WP		= BIT(16),
+	SNOR_F_HAS_STACKED      = BIT(17),
 };
 
 struct spi_nor_read_command {
diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
index 59909e7d6f53..9d72b0bbab94 100644
--- a/include/linux/mtd/spi-nor.h
+++ b/include/linux/mtd/spi-nor.h
@@ -127,6 +127,12 @@
 #define SR2_LB3			BIT(5)	/* Security Register Lock Bit 3 */
 #define SR2_QUAD_EN_BIT7	BIT(7)
 
+/*
+ * Maximum number of flashes that can be connected
+ * in stacked/parallel configuration
+ */
+#define	SNOR_FLASH_CNT_MAX	4
+
 /* Supported SPI protocols */
 #define SNOR_PROTO_INST_MASK	GENMASK(23, 16)
 #define SNOR_PROTO_INST_SHIFT	16
@@ -378,6 +384,7 @@ struct spi_nor_flash_parameter;
  *                      hooks, or dynamically when parsing the SFDP tables.
  * @dirmap:		pointers to struct spi_mem_dirmap_desc for reads/writes.
  * @priv:		pointer to the private data
+ * @num_flash		number of flashes connected in parallel or stacked mode
  */
 struct spi_nor {
 	struct mtd_info		mtd;
@@ -412,13 +419,13 @@ struct spi_nor {
 
 	const struct spi_nor_controller_ops *controller_ops;
 
-	struct spi_nor_flash_parameter *params;
+	struct spi_nor_flash_parameter *params[SNOR_FLASH_CNT_MAX];
 
 	struct {
 		struct spi_mem_dirmap_desc *rdesc;
 		struct spi_mem_dirmap_desc *wdesc;
 	} dirmap;
-
+	u32			num_flash;
 	void *priv;
 };
 
@@ -435,13 +442,13 @@ static inline struct device_node *spi_nor_get_flash_node(struct spi_nor *nor)
 
 static inline struct spi_nor_flash_parameter *spi_nor_get_params(const struct spi_nor *nor, u8 idx)
 {
-	return nor->params;
+	return nor->params[idx];
 }
 
 static inline void spi_nor_set_params(struct spi_nor *nor, u8 idx,
 				      struct spi_nor_flash_parameter *params)
 {
-	nor->params = params;
+	nor->params[idx] = params;
 }
 /**
  * spi_nor_scan() - scan the SPI NOR
-- 
2.17.1

