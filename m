Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DD7CC7F94AE
	for <lists+alsa-devel@lfdr.de>; Sun, 26 Nov 2023 18:47:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 61E2211C;
	Sun, 26 Nov 2023 18:47:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 61E2211C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701020879;
	bh=PStvcc9ih6tbh6tLfnILyhRuouO6rgtTHtt+weBZOOo=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=LaeKwwmAr03oQbyjMPcHaA7RYtUEl+5N0zLgAsAgN1yZAjlNXAmT35IHf8BkuXE7o
	 zivomJs8tqxrGU83IdoWvahGq4ngE7KTxOJxHdP6A3/XINuK3xY4EJZzTkBGjtB2hp
	 84XnehHfV7omw4wf7aOvTsy5JtEdOGuZrJaTAzCU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 28D4DF8067F; Sun, 26 Nov 2023 18:46:13 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AB682F80637;
	Sun, 26 Nov 2023 18:46:12 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F275CF80551; Sat, 25 Nov 2023 10:22:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20607.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eaa::607])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6AB17F802E8
	for <alsa-devel@alsa-project.org>; Sat, 25 Nov 2023 10:22:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6AB17F802E8
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=d/drc8IS
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZPVgfn4+Si05bbUSa+B57zlIac3Khz8ej19eqsIQgTLMtpxwmxMto0OpvJwZbaBRcEgKkKb0SDnS/l3XcHZYQApsL//lQkNOsQe/efy4ksqMV2Fl14aBVd1euy0PXAv4lLlapBWoJiAcaxM2CQt7szoiBVMYMUoOzkb6SPt8u2PgqLy7eNOe4Jm44i5JYcO39rsmrMZziPLauEIVuhBwd96DsE3Ytq3eMdmECasbdXjGvw0k3LE89yAqymyQmVb2j9eJtsSuXEuujnwztDwvCNaVdUaDipP3IqrXiHjrMbwpFk3FF9O+bIpry50Glwm9dLN8mPOqvIJU8sHAzPrtWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=avRFVWAA8AQw2+ZzD3UxJK9Py9r6TyHuWV04vA+WN1c=;
 b=kBPdmrlkLAzDPJ3P0kGU+RSzPLBp/gw6r4qm0f6hd21qXtQkGQ7atu7LCkYTx4eVwxPK2UlljmbMKgTWnkNrUORq9fiAJMxSSmj/FBInq/XCQ7LEBJ00hX7Ao24jgfY4iK+WVH0aHXMJDaBMvR4vKKnUtCsGaPIuauMI3uIiOF+sjge8k5vLTFk20qRbq3hTyn3Pq0Iqzbu9m4av1u0nAzkR7EfgD3ZfvRMD9zeLrr8vMK6dE/pE6ieRTAghj39oexX3sUVWV7V1YUn7g8EBKYNWbnn02KNyqVsEKzd6fMRiLpgWpNILIsS7oUJwkHkha6PZskzv+KdVQ+35ZsFaTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=avRFVWAA8AQw2+ZzD3UxJK9Py9r6TyHuWV04vA+WN1c=;
 b=d/drc8IS3AeV8tHCci9gfpK1fexybbZTY6Hu4Ghy+/eIB3Egg3jGaw0GpDy/5OcGPv29KeP1mhtr3EdX+m7pP0bgZIJM3hI1nd9D7h7ZmALU1OQWg7oz5GzLkeR5lylAuYMUwccFL7i87zg5OveavycwuZA5PN7dpQWWIxG0IVY=
Received: from BYAPR05CA0020.namprd05.prod.outlook.com (2603:10b6:a03:c0::33)
 by SN7PR12MB7909.namprd12.prod.outlook.com (2603:10b6:806:340::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.25; Sat, 25 Nov
 2023 09:22:26 +0000
Received: from DS1PEPF00017098.namprd05.prod.outlook.com
 (2603:10b6:a03:c0:cafe::f2) by BYAPR05CA0020.outlook.office365.com
 (2603:10b6:a03:c0::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.14 via Frontend
 Transport; Sat, 25 Nov 2023 09:22:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF00017098.mail.protection.outlook.com (10.167.18.102) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7046.17 via Frontend Transport; Sat, 25 Nov 2023 09:22:26 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Sat, 25 Nov
 2023 03:22:21 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Sat, 25 Nov
 2023 03:22:19 -0600
Received: from xhdakumarma40u.xilinx.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.34
 via Frontend Transport; Sat, 25 Nov 2023 03:22:13 -0600
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
Subject: [PATCH v11 05/10] mtd: spi-nor: Add APIs to set/get nor->params
Date: Sat, 25 Nov 2023 14:51:32 +0530
Message-ID: <20231125092137.2948-6-amit.kumar-mahapatra@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20231125092137.2948-1-amit.kumar-mahapatra@amd.com>
References: <20231125092137.2948-1-amit.kumar-mahapatra@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017098:EE_|SN7PR12MB7909:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f37c188-c5f5-445a-d964-08dbed980a04
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	HtOQHGScuJ++lO41bYJrjN7dzoHBwavkLlZQMgY8/jCeV/4Gvzd6bBzN09y6vYH2sJgTGAc0zhY7+15jZMWR4DST347Y4UnmqUwS+rJZeqYQH2uw4+DR/kWG+X1yyJSL1cs1YJBr7yu5KC9JdS37/kTWqU0n29ZgkYTp66od8XyFDCg0ABbjXUXEnbSacMesZRv8rS9j014Bgqkr3DHB4gM0G2+gyA+fVJWbEY9AgIqv8pkCYMLZRNFTRvsUvoS0vR16YYL3m1EXvXUVkaAGx4lDS+eaer+1o5cU3x467Dz+gtr+OXlc3BMiuk7pqWy9NXWfX2zOOEHa3oQ5UyQJLMx0+uq0O8zB0DG/u+oeF51mImsKagRVpRf26z3pRSH3ndHlNREt+Zo3S52S1hqLDpKluk91fJ2VLk7iL4NIH+cVJ9dU4F2Oh3lC1Iw1eIISue29yx7+JVHY+fpLfYX1J8D2avykvNNh1k0uG+qO7xPSYBj7MpOL8mDOS57OQqxPHoLZiVrNiJ76yzxfnv97NNwc2e2hhrqCyNo5ffP3xKQwPcBZBCc7SjlZWJVIsaG78npTV7l9BauQFQMwkVNZ5/dyL93LR4g5gxLDRhUYdGr62N7RY3WwsCZ3hvWAlzP5L9z0zTkR74zogSWBCtFRu7BNULDnupIZaG7ep4T3ctpYG9GixX+G1Q6RptKsRoSPA4FOY7wGpWR+Ybnu2DjNpPa0M5dwLSwCtNnHcGBNM5nStGpPt6boi7Rq/Uly6TFGRKpkbZdyRMiVchF31mOcgjkDOUYAc5DA6Sl3fckV+lH+Ub34j9WyRM0Kp+6jY0lB
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(376002)(346002)(39860400002)(136003)(396003)(230922051799003)(186009)(82310400011)(451199024)(1800799012)(64100799003)(36840700001)(40470700004)(46966006)(316002)(110136005)(70586007)(70206006)(54906003)(478600001)(40460700003)(6666004)(7416002)(5660300002)(921008)(41300700001)(36756003)(2906002)(30864003)(4326008)(8936002)(8676002)(86362001)(40480700001)(81166007)(83380400001)(2616005)(356005)(47076005)(36860700001)(336012)(426003)(1076003)(82740400003)(26005)(36900700001)(559001)(579004)(309714004);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2023 09:22:26.1177
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 6f37c188-c5f5-445a-d964-08dbed980a04
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DS1PEPF00017098.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7909
X-MailFrom: amit.kumar-mahapatra@amd.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: JT6LIVVDGMEHYIQALTYXJCTN43ENKRF4
X-Message-ID-Hash: JT6LIVVDGMEHYIQALTYXJCTN43ENKRF4
X-Mailman-Approved-At: Sun, 26 Nov 2023 17:37:50 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JT6LIVVDGMEHYIQALTYXJCTN43ENKRF4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Supporting multi-cs in spi-nor would require the *params member of
struct spi_nor to be an array. To make the transition smoother introduced
spi_nor_get_params() & spi_nor_set_params() APIs to get & set nor->params,
added a new local variable (struct spi_nor_flash_parameter *params) to hold
the return value of the spi_nor_get_params() function call and replaced all
nor->params references with the "params".
While adding multi-cs support in further patches the *params member of the
spi_nor structure would be converted to arrays & the "idx" parameter of
the APIs would be used as array index i.e., nor->params[idx].

Signed-off-by: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
---
 drivers/mtd/spi-nor/atmel.c      |  17 ++--
 drivers/mtd/spi-nor/core.c       | 136 ++++++++++++++++++++-----------
 drivers/mtd/spi-nor/debugfs.c    |   4 +-
 drivers/mtd/spi-nor/gigadevice.c |   4 +-
 drivers/mtd/spi-nor/issi.c       |  11 ++-
 drivers/mtd/spi-nor/macronix.c   |  10 ++-
 drivers/mtd/spi-nor/micron-st.c  |  30 ++++---
 drivers/mtd/spi-nor/otp.c        |  29 +++++--
 drivers/mtd/spi-nor/sfdp.c       |  33 ++++----
 drivers/mtd/spi-nor/spansion.c   |  57 +++++++------
 drivers/mtd/spi-nor/sst.c        |   7 +-
 drivers/mtd/spi-nor/swp.c        |  25 ++++--
 drivers/mtd/spi-nor/winbond.c    |   2 +-
 drivers/mtd/spi-nor/xilinx.c     |  18 ++--
 include/linux/mtd/spi-nor.h      |  10 +++
 15 files changed, 257 insertions(+), 136 deletions(-)

diff --git a/drivers/mtd/spi-nor/atmel.c b/drivers/mtd/spi-nor/atmel.c
index e13b8d2dd50a..b63cbe18162c 100644
--- a/drivers/mtd/spi-nor/atmel.c
+++ b/drivers/mtd/spi-nor/atmel.c
@@ -23,10 +23,11 @@ static int at25fs_nor_lock(struct spi_nor *nor, loff_t ofs, uint64_t len)
 
 static int at25fs_nor_unlock(struct spi_nor *nor, loff_t ofs, uint64_t len)
 {
+	struct spi_nor_flash_parameter *params = spi_nor_get_params(nor, 0);
 	int ret;
 
 	/* We only support unlocking the whole flash array */
-	if (ofs || len != nor->params->size)
+	if (ofs || len != params->size)
 		return -EINVAL;
 
 	/* Write 0x00 to the status register to disable write protection */
@@ -50,7 +51,9 @@ static const struct spi_nor_locking_ops at25fs_nor_locking_ops = {
 
 static int at25fs_nor_late_init(struct spi_nor *nor)
 {
-	nor->params->locking_ops = &at25fs_nor_locking_ops;
+	struct spi_nor_flash_parameter *params = spi_nor_get_params(nor, 0);
+
+	params->locking_ops = &at25fs_nor_locking_ops;
 
 	return 0;
 }
@@ -71,11 +74,12 @@ static const struct spi_nor_fixups at25fs_nor_fixups = {
 static int atmel_nor_set_global_protection(struct spi_nor *nor, loff_t ofs,
 					   uint64_t len, bool is_protect)
 {
+	struct spi_nor_flash_parameter *params = spi_nor_get_params(nor, 0);
 	int ret;
 	u8 sr;
 
 	/* We only support locking the whole flash array */
-	if (ofs || len != nor->params->size)
+	if (ofs || len != params->size)
 		return -EINVAL;
 
 	ret = spi_nor_read_sr(nor, nor->bouncebuf);
@@ -133,9 +137,10 @@ static int atmel_nor_global_unprotect(struct spi_nor *nor, loff_t ofs,
 static int atmel_nor_is_global_protected(struct spi_nor *nor, loff_t ofs,
 					 uint64_t len)
 {
+	struct spi_nor_flash_parameter *params = spi_nor_get_params(nor, 0);
 	int ret;
 
-	if (ofs >= nor->params->size || (ofs + len) > nor->params->size)
+	if (ofs >= params->size || (ofs + len) > params->size)
 		return -EINVAL;
 
 	ret = spi_nor_read_sr(nor, nor->bouncebuf);
@@ -153,7 +158,9 @@ static const struct spi_nor_locking_ops atmel_nor_global_protection_ops = {
 
 static int atmel_nor_global_protection_late_init(struct spi_nor *nor)
 {
-	nor->params->locking_ops = &atmel_nor_global_protection_ops;
+	struct spi_nor_flash_parameter *params = spi_nor_get_params(nor, 0);
+
+	params->locking_ops = &atmel_nor_global_protection_ops;
 
 	return 0;
 }
diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 1c443fe568cf..72c80d8b5858 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -448,14 +448,15 @@ int spi_nor_read_id(struct spi_nor *nor, u8 naddr, u8 ndummy, u8 *id,
  */
 int spi_nor_read_sr(struct spi_nor *nor, u8 *sr)
 {
+	struct spi_nor_flash_parameter *params = spi_nor_get_params(nor, 0);
 	int ret;
 
 	if (nor->spimem) {
 		struct spi_mem_op op = SPI_NOR_RDSR_OP(sr);
 
 		if (nor->reg_proto == SNOR_PROTO_8_8_8_DTR) {
-			op.addr.nbytes = nor->params->rdsr_addr_nbytes;
-			op.dummy.nbytes = nor->params->rdsr_dummy;
+			op.addr.nbytes = params->rdsr_addr_nbytes;
+			op.dummy.nbytes = params->rdsr_dummy;
 			/*
 			 * We don't want to read only one byte in DTR mode. So,
 			 * read 2 and then discard the second byte.
@@ -688,14 +689,15 @@ static void spi_nor_unlock_rdst(struct spi_nor *nor)
 static int spi_nor_ready(struct spi_nor *nor)
 {
 	int ret;
+	struct spi_nor_flash_parameter *params = spi_nor_get_params(nor, 0);
 
 	ret = spi_nor_lock_rdst(nor);
 	if (ret)
 		return 0;
 
 	/* Flashes might override the standard routine. */
-	if (nor->params->ready)
-		ret = nor->params->ready(nor);
+	if (params->ready)
+		ret = params->ready(nor);
 	else
 		ret = spi_nor_sr_ready(nor);
 
@@ -861,6 +863,7 @@ static int spi_nor_write_sr1_and_check(struct spi_nor *nor, u8 sr1)
  */
 static int spi_nor_write_16bit_sr_and_check(struct spi_nor *nor, u8 sr1)
 {
+	struct spi_nor_flash_parameter *params = spi_nor_get_params(nor, 0);
 	int ret;
 	u8 *sr_cr = nor->bouncebuf;
 	u8 cr_written;
@@ -872,7 +875,7 @@ static int spi_nor_write_16bit_sr_and_check(struct spi_nor *nor, u8 sr1)
 			return ret;
 	} else if (spi_nor_get_protocol_width(nor->read_proto) == 4 &&
 		   spi_nor_get_protocol_width(nor->write_proto) == 4 &&
-		   nor->params->quad_enable) {
+		   params->quad_enable) {
 		/*
 		 * If the Status Register 2 Read command (35h) is not
 		 * supported, we should at least be sure we don't
@@ -1150,17 +1153,21 @@ static u8 spi_nor_convert_3to4_erase(u8 opcode)
 
 static bool spi_nor_has_uniform_erase(const struct spi_nor *nor)
 {
-	return !!nor->params->erase_map.uniform_erase_type;
+	struct spi_nor_flash_parameter *params = spi_nor_get_params(nor, 0);
+
+	return !!params->erase_map.uniform_erase_type;
 }
 
 static void spi_nor_set_4byte_opcodes(struct spi_nor *nor)
 {
+	struct spi_nor_flash_parameter *params = spi_nor_get_params(nor, 0);
+
 	nor->read_opcode = spi_nor_convert_3to4_read(nor->read_opcode);
 	nor->program_opcode = spi_nor_convert_3to4_program(nor->program_opcode);
 	nor->erase_opcode = spi_nor_convert_3to4_erase(nor->erase_opcode);
 
 	if (!spi_nor_has_uniform_erase(nor)) {
-		struct spi_nor_erase_map *map = &nor->params->erase_map;
+		struct spi_nor_erase_map *map = &params->erase_map;
 		struct spi_nor_erase_type *erase;
 		int i;
 
@@ -1302,6 +1309,7 @@ void spi_nor_unlock_and_unprep(struct spi_nor *nor)
 /* Internal locking helpers for program and erase operations */
 static bool spi_nor_rww_start_pe(struct spi_nor *nor, loff_t start, size_t len)
 {
+	struct spi_nor_flash_parameter *params = spi_nor_get_params(nor, 0);
 	struct spi_nor_rww *rww = &nor->rww;
 	unsigned int used_banks = 0;
 	bool started = false;
@@ -1313,7 +1321,7 @@ static bool spi_nor_rww_start_pe(struct spi_nor *nor, loff_t start, size_t len)
 	if (rww->ongoing_io || rww->ongoing_rd || rww->ongoing_pe)
 		goto busy;
 
-	spi_nor_offset_to_banks(nor->params->bank_size, start, len, &first, &last);
+	spi_nor_offset_to_banks(params->bank_size, start, len, &first, &last);
 	for (bank = first; bank <= last; bank++) {
 		if (rww->used_banks & BIT(bank))
 			goto busy;
@@ -1332,13 +1340,14 @@ static bool spi_nor_rww_start_pe(struct spi_nor *nor, loff_t start, size_t len)
 
 static void spi_nor_rww_end_pe(struct spi_nor *nor, loff_t start, size_t len)
 {
+	struct spi_nor_flash_parameter *params = spi_nor_get_params(nor, 0);
 	struct spi_nor_rww *rww = &nor->rww;
 	u8 first, last;
 	int bank;
 
 	mutex_lock(&nor->lock);
 
-	spi_nor_offset_to_banks(nor->params->bank_size, start, len, &first, &last);
+	spi_nor_offset_to_banks(params->bank_size, start, len, &first, &last);
 	for (bank = first; bank <= last; bank++)
 		rww->used_banks &= ~BIT(bank);
 
@@ -1379,6 +1388,7 @@ static void spi_nor_unlock_and_unprep_pe(struct spi_nor *nor, loff_t start, size
 /* Internal locking helpers for read operations */
 static bool spi_nor_rww_start_rd(struct spi_nor *nor, loff_t start, size_t len)
 {
+	struct spi_nor_flash_parameter *params = spi_nor_get_params(nor, 0);
 	struct spi_nor_rww *rww = &nor->rww;
 	unsigned int used_banks = 0;
 	bool started = false;
@@ -1390,7 +1400,7 @@ static bool spi_nor_rww_start_rd(struct spi_nor *nor, loff_t start, size_t len)
 	if (rww->ongoing_io || rww->ongoing_rd)
 		goto busy;
 
-	spi_nor_offset_to_banks(nor->params->bank_size, start, len, &first, &last);
+	spi_nor_offset_to_banks(params->bank_size, start, len, &first, &last);
 	for (bank = first; bank <= last; bank++) {
 		if (rww->used_banks & BIT(bank))
 			goto busy;
@@ -1410,13 +1420,14 @@ static bool spi_nor_rww_start_rd(struct spi_nor *nor, loff_t start, size_t len)
 
 static void spi_nor_rww_end_rd(struct spi_nor *nor, loff_t start, size_t len)
 {
+	struct spi_nor_flash_parameter *params = spi_nor_get_params(nor, 0);
 	struct spi_nor_rww *rww = &nor->rww;
 	u8 first, last;
 	int bank;
 
 	mutex_lock(&nor->lock);
 
-	spi_nor_offset_to_banks(nor->params->bank_size, start, len, &first, &last);
+	spi_nor_offset_to_banks(params->bank_size, start, len, &first, &last);
 	for (bank = first; bank <= last; bank++)
 		nor->rww.used_banks &= ~BIT(bank);
 
@@ -1457,10 +1468,12 @@ static void spi_nor_unlock_and_unprep_rd(struct spi_nor *nor, loff_t start, size
 
 static u32 spi_nor_convert_addr(struct spi_nor *nor, loff_t addr)
 {
-	if (!nor->params->convert_addr)
+	struct spi_nor_flash_parameter *params = spi_nor_get_params(nor, 0);
+
+	if (!params->convert_addr)
 		return addr;
 
-	return nor->params->convert_addr(nor, addr);
+	return params->convert_addr(nor, addr);
 }
 
 /*
@@ -1680,7 +1693,8 @@ static int spi_nor_init_erase_cmd_list(struct spi_nor *nor,
 				       struct list_head *erase_list,
 				       u64 addr, u32 len)
 {
-	const struct spi_nor_erase_map *map = &nor->params->erase_map;
+	struct spi_nor_flash_parameter *params = spi_nor_get_params(nor, 0);
+	const struct spi_nor_erase_map *map = &params->erase_map;
 	const struct spi_nor_erase_type *erase, *prev_erase = NULL;
 	struct spi_nor_erase_region *region;
 	struct spi_nor_erase_command *cmd = NULL;
@@ -2124,9 +2138,10 @@ static int spi_nor_write(struct mtd_info *mtd, loff_t to, size_t len,
 	size_t *retlen, const u_char *buf)
 {
 	struct spi_nor *nor = mtd_to_spi_nor(mtd);
+	struct spi_nor_flash_parameter *params;
 	size_t page_offset, page_remain, i;
 	ssize_t ret;
-	u32 page_size = nor->params->page_size;
+	u32 page_size;
 
 	dev_dbg(nor->dev, "to 0x%08x, len %zd\n", (u32)to, len);
 
@@ -2134,6 +2149,9 @@ static int spi_nor_write(struct mtd_info *mtd, loff_t to, size_t len,
 	if (ret)
 		return ret;
 
+	params = spi_nor_get_params(nor, 0);
+	page_size = params->page_size;
+
 	for (i = 0; i < len; ) {
 		ssize_t written;
 		loff_t addr = to + i;
@@ -2289,6 +2307,8 @@ int spi_nor_hwcaps_pp2cmd(u32 hwcaps)
 static int spi_nor_spimem_check_op(struct spi_nor *nor,
 				   struct spi_mem_op *op)
 {
+	struct spi_nor_flash_parameter *params = spi_nor_get_params(nor, 0);
+
 	/*
 	 * First test with 4 address bytes. The opcode itself might
 	 * be a 3B addressing opcode but we don't care, because
@@ -2297,7 +2317,7 @@ static int spi_nor_spimem_check_op(struct spi_nor *nor,
 	 */
 	op->addr.nbytes = 4;
 	if (!spi_mem_supports_op(nor->spimem, op)) {
-		if (nor->params->size > SZ_16M)
+		if (params->size > SZ_16M)
 			return -EOPNOTSUPP;
 
 		/* If flash size <= 16MB, 3 address bytes are sufficient */
@@ -2361,7 +2381,7 @@ static int spi_nor_spimem_check_pp(struct spi_nor *nor,
 static void
 spi_nor_spimem_adjust_hwcaps(struct spi_nor *nor, u32 *hwcaps)
 {
-	struct spi_nor_flash_parameter *params = nor->params;
+	struct spi_nor_flash_parameter *params = spi_nor_get_params(nor, 0);
 	unsigned int cap;
 
 	/* X-X-X modes are not supported yet, mask them all. */
@@ -2462,6 +2482,7 @@ static int spi_nor_select_read(struct spi_nor *nor,
 			       u32 shared_hwcaps)
 {
 	int cmd, best_match = fls(shared_hwcaps & SNOR_HWCAPS_READ_MASK) - 1;
+	struct spi_nor_flash_parameter *params = spi_nor_get_params(nor, 0);
 	const struct spi_nor_read_command *read;
 
 	if (best_match < 0)
@@ -2471,7 +2492,7 @@ static int spi_nor_select_read(struct spi_nor *nor,
 	if (cmd < 0)
 		return -EINVAL;
 
-	read = &nor->params->reads[cmd];
+	read = &params->reads[cmd];
 	nor->read_opcode = read->opcode;
 	nor->read_proto = read->proto;
 
@@ -2492,6 +2513,7 @@ static int spi_nor_select_read(struct spi_nor *nor,
 static int spi_nor_select_pp(struct spi_nor *nor,
 			     u32 shared_hwcaps)
 {
+	struct spi_nor_flash_parameter *params = spi_nor_get_params(nor, 0);
 	int cmd, best_match = fls(shared_hwcaps & SNOR_HWCAPS_PP_MASK) - 1;
 	const struct spi_nor_pp_command *pp;
 
@@ -2502,7 +2524,7 @@ static int spi_nor_select_pp(struct spi_nor *nor,
 	if (cmd < 0)
 		return -EINVAL;
 
-	pp = &nor->params->page_programs[cmd];
+	pp = &params->page_programs[cmd];
 	nor->program_opcode = pp->opcode;
 	nor->write_proto = pp->proto;
 	return 0;
@@ -2568,7 +2590,8 @@ spi_nor_select_uniform_erase(struct spi_nor_erase_map *map)
 
 static int spi_nor_select_erase(struct spi_nor *nor)
 {
-	struct spi_nor_erase_map *map = &nor->params->erase_map;
+	struct spi_nor_flash_parameter *params = spi_nor_get_params(nor, 0);
+	struct spi_nor_erase_map *map = &params->erase_map;
 	const struct spi_nor_erase_type *erase = NULL;
 	struct mtd_info *mtd = &nor->mtd;
 	int i;
@@ -2611,7 +2634,7 @@ static int spi_nor_select_erase(struct spi_nor *nor)
 static int spi_nor_default_setup(struct spi_nor *nor,
 				 const struct spi_nor_hwcaps *hwcaps)
 {
-	struct spi_nor_flash_parameter *params = nor->params;
+	struct spi_nor_flash_parameter *params = spi_nor_get_params(nor, 0);
 	u32 ignored_mask, shared_mask;
 	int err;
 
@@ -2671,8 +2694,10 @@ static int spi_nor_default_setup(struct spi_nor *nor,
 
 static int spi_nor_set_addr_nbytes(struct spi_nor *nor)
 {
-	if (nor->params->addr_nbytes) {
-		nor->addr_nbytes = nor->params->addr_nbytes;
+	struct spi_nor_flash_parameter *params = spi_nor_get_params(nor, 0);
+
+	if (params->addr_nbytes) {
+		nor->addr_nbytes = params->addr_nbytes;
 	} else if (nor->read_proto == SNOR_PROTO_8_8_8_DTR) {
 		/*
 		 * In 8D-8D-8D mode, one byte takes half a cycle to transfer. So
@@ -2693,7 +2718,7 @@ static int spi_nor_set_addr_nbytes(struct spi_nor *nor)
 		nor->addr_nbytes = 3;
 	}
 
-	if (nor->addr_nbytes == 3 && nor->params->size > 0x1000000) {
+	if (nor->addr_nbytes == 3 && params->size > 0x1000000) {
 		/* enable 4-byte addressing if the device exceeds 16MiB */
 		nor->addr_nbytes = 4;
 	}
@@ -2715,10 +2740,11 @@ static int spi_nor_set_addr_nbytes(struct spi_nor *nor)
 static int spi_nor_setup(struct spi_nor *nor,
 			 const struct spi_nor_hwcaps *hwcaps)
 {
+	struct spi_nor_flash_parameter *params = spi_nor_get_params(nor, 0);
 	int ret;
 
-	if (nor->params->setup)
-		ret = nor->params->setup(nor, hwcaps);
+	if (params->setup)
+		ret = params->setup(nor, hwcaps);
 	else
 		ret = spi_nor_default_setup(nor, hwcaps);
 	if (ret)
@@ -2753,7 +2779,7 @@ static void spi_nor_manufacturer_init_params(struct spi_nor *nor)
  */
 static void spi_nor_no_sfdp_init_params(struct spi_nor *nor)
 {
-	struct spi_nor_flash_parameter *params = nor->params;
+	struct spi_nor_flash_parameter *params = spi_nor_get_params(nor, 0);
 	struct spi_nor_erase_map *map = &params->erase_map;
 	const struct flash_info *info = nor->info;
 	const u8 no_sfdp_flags = info->no_sfdp_flags;
@@ -2823,6 +2849,7 @@ static void spi_nor_no_sfdp_init_params(struct spi_nor *nor)
  */
 static void spi_nor_init_flags(struct spi_nor *nor)
 {
+	struct spi_nor_flash_parameter *params = spi_nor_get_params(nor, 0);
 	struct device_node *np = spi_nor_get_flash_node(nor);
 	const u16 flags = nor->info->flags;
 
@@ -2853,7 +2880,7 @@ static void spi_nor_init_flags(struct spi_nor *nor)
 	if (flags & NO_CHIP_ERASE)
 		nor->flags |= SNOR_F_NO_OP_CHIP_ERASE;
 
-	if (flags & SPI_NOR_RWW && nor->params->n_banks > 1 &&
+	if (flags & SPI_NOR_RWW && params->n_banks > 1 &&
 	    !nor->controller_ops)
 		nor->flags |= SNOR_F_RWW;
 }
@@ -2887,7 +2914,7 @@ static void spi_nor_init_fixup_flags(struct spi_nor *nor)
  */
 static int spi_nor_late_init_params(struct spi_nor *nor)
 {
-	struct spi_nor_flash_parameter *params = nor->params;
+	struct spi_nor_flash_parameter *params = spi_nor_get_params(nor, 0);
 	int ret;
 
 	if (nor->manufacturer && nor->manufacturer->fixups &&
@@ -2914,7 +2941,7 @@ static int spi_nor_late_init_params(struct spi_nor *nor)
 	 * NOR protection support. When locking_ops are not provided, we pick
 	 * the default ones.
 	 */
-	if (nor->flags & SNOR_F_HAS_LOCK && !nor->params->locking_ops)
+	if (nor->flags & SNOR_F_HAS_LOCK && !params->locking_ops)
 		spi_nor_init_default_locking_ops(nor);
 
 	if (params->n_banks > 1)
@@ -2933,12 +2960,13 @@ static int spi_nor_late_init_params(struct spi_nor *nor)
  */
 static void spi_nor_sfdp_init_params_deprecated(struct spi_nor *nor)
 {
+	struct spi_nor_flash_parameter *params = spi_nor_get_params(nor, 0);
 	struct spi_nor_flash_parameter sfdp_params;
 
-	memcpy(&sfdp_params, nor->params, sizeof(sfdp_params));
+	memcpy(&sfdp_params, params, sizeof(sfdp_params));
 
 	if (spi_nor_parse_sfdp(nor)) {
-		memcpy(nor->params, &sfdp_params, sizeof(*nor->params));
+		memcpy(params, &sfdp_params, sizeof(*params));
 		nor->flags &= ~SNOR_F_4B_OPCODES;
 	}
 }
@@ -2973,7 +3001,7 @@ static void spi_nor_init_params_deprecated(struct spi_nor *nor)
  */
 static void spi_nor_init_default_params(struct spi_nor *nor)
 {
-	struct spi_nor_flash_parameter *params = nor->params;
+	struct spi_nor_flash_parameter *params = spi_nor_get_params(nor, 0);
 	const struct flash_info *info = nor->info;
 	struct device_node *np = spi_nor_get_flash_node(nor);
 
@@ -3060,12 +3088,15 @@ static void spi_nor_init_default_params(struct spi_nor *nor)
  */
 static int spi_nor_init_params(struct spi_nor *nor)
 {
+	struct spi_nor_flash_parameter *params = spi_nor_get_params(nor, 0);
 	int ret;
 
-	nor->params = devm_kzalloc(nor->dev, sizeof(*nor->params), GFP_KERNEL);
-	if (!nor->params)
+	params = devm_kzalloc(nor->dev, sizeof(*params), GFP_KERNEL);
+	if (!params)
 		return -ENOMEM;
 
+	spi_nor_set_params(nor, 0, params);
+
 	spi_nor_init_default_params(nor);
 
 	if (spi_nor_needs_sfdp(nor)) {
@@ -3091,9 +3122,10 @@ static int spi_nor_init_params(struct spi_nor *nor)
  */
 static int spi_nor_set_octal_dtr(struct spi_nor *nor, bool enable)
 {
+	struct spi_nor_flash_parameter *params = spi_nor_get_params(nor, 0);
 	int ret;
 
-	if (!nor->params->set_octal_dtr)
+	if (!params->set_octal_dtr)
 		return 0;
 
 	if (!(nor->read_proto == SNOR_PROTO_8_8_8_DTR &&
@@ -3103,7 +3135,7 @@ static int spi_nor_set_octal_dtr(struct spi_nor *nor, bool enable)
 	if (!(nor->flags & SNOR_F_IO_MODE_EN_VOLATILE))
 		return 0;
 
-	ret = nor->params->set_octal_dtr(nor, enable);
+	ret = params->set_octal_dtr(nor, enable);
 	if (ret)
 		return ret;
 
@@ -3123,14 +3155,16 @@ static int spi_nor_set_octal_dtr(struct spi_nor *nor, bool enable)
  */
 static int spi_nor_quad_enable(struct spi_nor *nor)
 {
-	if (!nor->params->quad_enable)
+	struct spi_nor_flash_parameter *params = spi_nor_get_params(nor, 0);
+
+	if (!params->quad_enable)
 		return 0;
 
 	if (!(spi_nor_get_protocol_width(nor->read_proto) == 4 ||
 	      spi_nor_get_protocol_width(nor->write_proto) == 4))
 		return 0;
 
-	return nor->params->quad_enable(nor);
+	return params->quad_enable(nor);
 }
 
 /**
@@ -3142,7 +3176,7 @@ static int spi_nor_quad_enable(struct spi_nor *nor)
  */
 int spi_nor_set_4byte_addr_mode(struct spi_nor *nor, bool enable)
 {
-	struct spi_nor_flash_parameter *params = nor->params;
+	struct spi_nor_flash_parameter *params = spi_nor_get_params(nor, 0);
 	int ret;
 
 	ret = params->set_4byte_addr_mode(nor, enable);
@@ -3395,6 +3429,7 @@ static const struct flash_info *spi_nor_get_flash_info(struct spi_nor *nor,
 
 static void spi_nor_set_mtd_info(struct spi_nor *nor)
 {
+	struct spi_nor_flash_parameter *params = spi_nor_get_params(nor, 0);
 	struct mtd_info *mtd = &nor->mtd;
 	struct device *dev = nor->dev;
 
@@ -3413,9 +3448,9 @@ static void spi_nor_set_mtd_info(struct spi_nor *nor)
 		mtd->flags |= MTD_NO_ERASE;
 	else
 		mtd->_erase = spi_nor_erase;
-	mtd->writesize = nor->params->writesize;
-	mtd->writebufsize = nor->params->page_size;
-	mtd->size = nor->params->size;
+	mtd->writesize = params->writesize;
+	mtd->writebufsize = params->page_size;
+	mtd->size = params->size;
 	mtd->_read = spi_nor_read;
 	/* Might be already set by some SST flashes. */
 	if (!mtd->_write)
@@ -3469,7 +3504,7 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
 	 * We need the bounce buffer early to read/write registers when going
 	 * through the spi-mem layer (buffers have to be DMA-able).
 	 * For spi-mem drivers, we'll reallocate a new buffer if
-	 * nor->params->page_size turns out to be greater than PAGE_SIZE (which
+	 * params->page_size turns out to be greater than PAGE_SIZE (which
 	 * shouldn't happen before long since NOR pages are usually less
 	 * than 1KB) after spi_nor_scan() returns.
 	 */
@@ -3543,13 +3578,14 @@ EXPORT_SYMBOL_GPL(spi_nor_scan);
 
 static int spi_nor_create_read_dirmap(struct spi_nor *nor)
 {
+	struct spi_nor_flash_parameter *params = spi_nor_get_params(nor, 0);
 	struct spi_mem_dirmap_info info = {
 		.op_tmpl = SPI_MEM_OP(SPI_MEM_OP_CMD(nor->read_opcode, 0),
 				      SPI_MEM_OP_ADDR(nor->addr_nbytes, 0, 0),
 				      SPI_MEM_OP_DUMMY(nor->read_dummy, 0),
 				      SPI_MEM_OP_DATA_IN(0, NULL, 0)),
 		.offset = 0,
-		.length = nor->params->size,
+		.length = params->size,
 	};
 	struct spi_mem_op *op = &info.op_tmpl;
 
@@ -3574,13 +3610,14 @@ static int spi_nor_create_read_dirmap(struct spi_nor *nor)
 
 static int spi_nor_create_write_dirmap(struct spi_nor *nor)
 {
+	struct spi_nor_flash_parameter *params = spi_nor_get_params(nor, 0);
 	struct spi_mem_dirmap_info info = {
 		.op_tmpl = SPI_MEM_OP(SPI_MEM_OP_CMD(nor->program_opcode, 0),
 				      SPI_MEM_OP_ADDR(nor->addr_nbytes, 0, 0),
 				      SPI_MEM_OP_NO_DUMMY,
 				      SPI_MEM_OP_DATA_OUT(0, NULL, 0)),
 		.offset = 0,
-		.length = nor->params->size,
+		.length = params->size,
 	};
 	struct spi_mem_op *op = &info.op_tmpl;
 
@@ -3603,6 +3640,7 @@ static int spi_nor_create_write_dirmap(struct spi_nor *nor)
 
 static int spi_nor_probe(struct spi_mem *spimem)
 {
+	struct spi_nor_flash_parameter *params;
 	struct spi_device *spi = spimem->spi;
 	struct flash_platform_data *data = dev_get_platdata(&spi->dev);
 	struct spi_nor *nor;
@@ -3649,13 +3687,15 @@ static int spi_nor_probe(struct spi_mem *spimem)
 
 	spi_nor_debugfs_register(nor);
 
+	params = spi_nor_get_params(nor, 0);
+
 	/*
 	 * None of the existing parts have > 512B pages, but let's play safe
 	 * and add this logic so that if anyone ever adds support for such
 	 * a NOR we don't end up with buffer overflows.
 	 */
-	if (nor->params->page_size > PAGE_SIZE) {
-		nor->bouncebuf_size = nor->params->page_size;
+	if (params->page_size > PAGE_SIZE) {
+		nor->bouncebuf_size = params->page_size;
 		devm_kfree(nor->dev, nor->bouncebuf);
 		nor->bouncebuf = devm_kmalloc(nor->dev,
 					      nor->bouncebuf_size,
diff --git a/drivers/mtd/spi-nor/debugfs.c b/drivers/mtd/spi-nor/debugfs.c
index 6e163cb5b478..72a901b88ea9 100644
--- a/drivers/mtd/spi-nor/debugfs.c
+++ b/drivers/mtd/spi-nor/debugfs.c
@@ -76,7 +76,7 @@ static void spi_nor_print_flags(struct seq_file *s, unsigned long flags,
 static int spi_nor_params_show(struct seq_file *s, void *data)
 {
 	struct spi_nor *nor = s->private;
-	struct spi_nor_flash_parameter *params = nor->params;
+	struct spi_nor_flash_parameter *params = spi_nor_get_params(nor, 0);
 	struct spi_nor_erase_map *erase_map = &params->erase_map;
 	struct spi_nor_erase_region *region;
 	const struct flash_info *info = nor->info;
@@ -184,7 +184,7 @@ static void spi_nor_print_pp_cmd(struct seq_file *s,
 static int spi_nor_capabilities_show(struct seq_file *s, void *data)
 {
 	struct spi_nor *nor = s->private;
-	struct spi_nor_flash_parameter *params = nor->params;
+	struct spi_nor_flash_parameter *params = spi_nor_get_params(nor, 0);
 	u32 hwcaps = params->hwcaps.mask;
 	int i, cmd;
 
diff --git a/drivers/mtd/spi-nor/gigadevice.c b/drivers/mtd/spi-nor/gigadevice.c
index ef1edd0add70..338ce989df22 100644
--- a/drivers/mtd/spi-nor/gigadevice.c
+++ b/drivers/mtd/spi-nor/gigadevice.c
@@ -13,6 +13,8 @@ gd25q256_post_bfpt(struct spi_nor *nor,
 		   const struct sfdp_parameter_header *bfpt_header,
 		   const struct sfdp_bfpt *bfpt)
 {
+	struct spi_nor_flash_parameter *params = spi_nor_get_params(nor, 0);
+
 	/*
 	 * GD25Q256C supports the first version of JESD216 which does not define
 	 * the Quad Enable methods. Overwrite the default Quad Enable method.
@@ -24,7 +26,7 @@ gd25q256_post_bfpt(struct spi_nor *nor,
 	 */
 	if (bfpt_header->major == SFDP_JESD216_MAJOR &&
 	    bfpt_header->minor == SFDP_JESD216_MINOR)
-		nor->params->quad_enable = spi_nor_sr1_bit6_quad_enable;
+		params->quad_enable = spi_nor_sr1_bit6_quad_enable;
 
 	return 0;
 }
diff --git a/drivers/mtd/spi-nor/issi.c b/drivers/mtd/spi-nor/issi.c
index 18d9a00aa22e..ea148a3a5e1f 100644
--- a/drivers/mtd/spi-nor/issi.c
+++ b/drivers/mtd/spi-nor/issi.c
@@ -13,6 +13,8 @@ is25lp256_post_bfpt_fixups(struct spi_nor *nor,
 			   const struct sfdp_parameter_header *bfpt_header,
 			   const struct sfdp_bfpt *bfpt)
 {
+	struct spi_nor_flash_parameter *params = spi_nor_get_params(nor, 0);
+
 	/*
 	 * IS25LP256 supports 4B opcodes, but the BFPT advertises
 	 * BFPT_DWORD1_ADDRESS_BYTES_3_ONLY.
@@ -20,7 +22,7 @@ is25lp256_post_bfpt_fixups(struct spi_nor *nor,
 	 */
 	if ((bfpt->dwords[SFDP_DWORD(1)] & BFPT_DWORD1_ADDRESS_BYTES_MASK) ==
 		BFPT_DWORD1_ADDRESS_BYTES_3_ONLY)
-		nor->params->addr_nbytes = 4;
+		params->addr_nbytes = 4;
 
 	return 0;
 }
@@ -31,7 +33,8 @@ static const struct spi_nor_fixups is25lp256_fixups = {
 
 static int pm25lv_nor_late_init(struct spi_nor *nor)
 {
-	struct spi_nor_erase_map *map = &nor->params->erase_map;
+	struct spi_nor_flash_parameter *params = spi_nor_get_params(nor, 0);
+	struct spi_nor_erase_map *map = &params->erase_map;
 	int i;
 
 	/* The PM25LV series has a different 4k sector erase opcode */
@@ -131,7 +134,9 @@ static const struct flash_info issi_nor_parts[] = {
 
 static void issi_nor_default_init(struct spi_nor *nor)
 {
-	nor->params->quad_enable = spi_nor_sr1_bit6_quad_enable;
+	struct spi_nor_flash_parameter *params = spi_nor_get_params(nor, 0);
+
+	params->quad_enable = spi_nor_sr1_bit6_quad_enable;
 }
 
 static const struct spi_nor_fixups issi_fixups = {
diff --git a/drivers/mtd/spi-nor/macronix.c b/drivers/mtd/spi-nor/macronix.c
index ea6be95e75a5..be1f273e3ce2 100644
--- a/drivers/mtd/spi-nor/macronix.c
+++ b/drivers/mtd/spi-nor/macronix.c
@@ -187,13 +187,17 @@ static const struct flash_info macronix_nor_parts[] = {
 
 static void macronix_nor_default_init(struct spi_nor *nor)
 {
-	nor->params->quad_enable = spi_nor_sr1_bit6_quad_enable;
+	struct spi_nor_flash_parameter *params = spi_nor_get_params(nor, 0);
+
+	params->quad_enable = spi_nor_sr1_bit6_quad_enable;
 }
 
 static int macronix_nor_late_init(struct spi_nor *nor)
 {
-	if (!nor->params->set_4byte_addr_mode)
-		nor->params->set_4byte_addr_mode = spi_nor_set_4byte_addr_mode_en4b_ex4b;
+	struct spi_nor_flash_parameter *params = spi_nor_get_params(nor, 0);
+
+	if (!params->set_4byte_addr_mode)
+		params->set_4byte_addr_mode = spi_nor_set_4byte_addr_mode_en4b_ex4b;
 
 	return 0;
 }
diff --git a/drivers/mtd/spi-nor/micron-st.c b/drivers/mtd/spi-nor/micron-st.c
index 8920547c12bf..813a5b1a269b 100644
--- a/drivers/mtd/spi-nor/micron-st.c
+++ b/drivers/mtd/spi-nor/micron-st.c
@@ -49,10 +49,11 @@
 
 static int micron_st_nor_octal_dtr_en(struct spi_nor *nor)
 {
+	struct spi_nor_flash_parameter *params = spi_nor_get_params(nor, 0);
 	struct spi_mem_op op;
 	u8 *buf = nor->bouncebuf;
 	int ret;
-	u8 addr_mode_nbytes = nor->params->addr_mode_nbytes;
+	u8 addr_mode_nbytes = params->addr_mode_nbytes;
 
 	/* Use 20 dummy cycles for memory array reads. */
 	*buf = 20;
@@ -128,27 +129,31 @@ static int micron_st_nor_set_octal_dtr(struct spi_nor *nor, bool enable)
 
 static void mt35xu512aba_default_init(struct spi_nor *nor)
 {
-	nor->params->set_octal_dtr = micron_st_nor_set_octal_dtr;
+	struct spi_nor_flash_parameter *params = spi_nor_get_params(nor, 0);
+
+	params->set_octal_dtr = micron_st_nor_set_octal_dtr;
 }
 
 static int mt35xu512aba_post_sfdp_fixup(struct spi_nor *nor)
 {
+	struct spi_nor_flash_parameter *params = spi_nor_get_params(nor, 0);
+
 	/* Set the Fast Read settings. */
-	nor->params->hwcaps.mask |= SNOR_HWCAPS_READ_8_8_8_DTR;
-	spi_nor_set_read_settings(&nor->params->reads[SNOR_CMD_READ_8_8_8_DTR],
+	params->hwcaps.mask |= SNOR_HWCAPS_READ_8_8_8_DTR;
+	spi_nor_set_read_settings(&params->reads[SNOR_CMD_READ_8_8_8_DTR],
 				  0, 20, SPINOR_OP_MT_DTR_RD,
 				  SNOR_PROTO_8_8_8_DTR);
 
 	nor->cmd_ext_type = SPI_NOR_EXT_REPEAT;
-	nor->params->rdsr_dummy = 8;
-	nor->params->rdsr_addr_nbytes = 0;
+	params->rdsr_dummy = 8;
+	params->rdsr_addr_nbytes = 0;
 
 	/*
 	 * The BFPT quad enable field is set to a reserved value so the quad
 	 * enable function is ignored by spi_nor_parse_bfpt(). Make sure we
 	 * disable it.
 	 */
-	nor->params->quad_enable = NULL;
+	params->quad_enable = NULL;
 
 	return 0;
 }
@@ -457,14 +462,15 @@ static const struct flash_info st_nor_parts[] = {
  */
 static int micron_st_nor_read_fsr(struct spi_nor *nor, u8 *fsr)
 {
+	struct spi_nor_flash_parameter *params = spi_nor_get_params(nor, 0);
 	int ret;
 
 	if (nor->spimem) {
 		struct spi_mem_op op = MICRON_ST_RDFSR_OP(fsr);
 
 		if (nor->reg_proto == SNOR_PROTO_8_8_8_DTR) {
-			op.addr.nbytes = nor->params->rdsr_addr_nbytes;
-			op.dummy.nbytes = nor->params->rdsr_dummy;
+			op.addr.nbytes = params->rdsr_addr_nbytes;
+			op.dummy.nbytes = params->rdsr_dummy;
 			/*
 			 * We don't want to read only one byte in DTR mode. So,
 			 * read 2 and then discard the second byte.
@@ -567,14 +573,16 @@ static int micron_st_nor_ready(struct spi_nor *nor)
 
 static void micron_st_nor_default_init(struct spi_nor *nor)
 {
+	struct spi_nor_flash_parameter *params = spi_nor_get_params(nor, 0);
+
 	nor->flags |= SNOR_F_HAS_LOCK;
 	nor->flags &= ~SNOR_F_HAS_16BIT_SR;
-	nor->params->quad_enable = NULL;
+	params->quad_enable = NULL;
 }
 
 static int micron_st_nor_late_init(struct spi_nor *nor)
 {
-	struct spi_nor_flash_parameter *params = nor->params;
+	struct spi_nor_flash_parameter *params = spi_nor_get_params(nor, 0);
 
 	if (nor->info->mfr_flags & USE_FSR)
 		params->ready = micron_st_nor_ready;
diff --git a/drivers/mtd/spi-nor/otp.c b/drivers/mtd/spi-nor/otp.c
index 23fe75ddc9cf..16a9a0375aeb 100644
--- a/drivers/mtd/spi-nor/otp.c
+++ b/drivers/mtd/spi-nor/otp.c
@@ -19,7 +19,9 @@
  */
 static inline unsigned int spi_nor_otp_region_len(struct spi_nor *nor)
 {
-	return nor->params->otp.org->len;
+	struct spi_nor_flash_parameter *params = spi_nor_get_params(nor, 0);
+
+	return params->otp.org->len;
 }
 
 /**
@@ -30,7 +32,9 @@ static inline unsigned int spi_nor_otp_region_len(struct spi_nor *nor)
  */
 static inline unsigned int spi_nor_otp_n_regions(struct spi_nor *nor)
 {
-	return nor->params->otp.org->n_regions;
+	struct spi_nor_flash_parameter *params = spi_nor_get_params(nor, 0);
+
+	return params->otp.org->n_regions;
 }
 
 /**
@@ -241,7 +245,8 @@ int spi_nor_otp_is_locked_sr2(struct spi_nor *nor, unsigned int region)
 
 static loff_t spi_nor_otp_region_start(const struct spi_nor *nor, unsigned int region)
 {
-	const struct spi_nor_otp_organization *org = nor->params->otp.org;
+	struct spi_nor_flash_parameter *params = spi_nor_get_params(nor, 0);
+	const struct spi_nor_otp_organization *org = params->otp.org;
 
 	return org->base + region * org->offset;
 }
@@ -266,7 +271,8 @@ static int spi_nor_mtd_otp_info(struct mtd_info *mtd, size_t len,
 				size_t *retlen, struct otp_info *buf)
 {
 	struct spi_nor *nor = mtd_to_spi_nor(mtd);
-	const struct spi_nor_otp_ops *ops = nor->params->otp.ops;
+	struct spi_nor_flash_parameter *params = spi_nor_get_params(nor, 0);
+	const struct spi_nor_otp_ops *ops = params->otp.ops;
 	unsigned int n_regions = spi_nor_otp_n_regions(nor);
 	unsigned int i;
 	int ret, locked;
@@ -303,7 +309,8 @@ static int spi_nor_mtd_otp_info(struct mtd_info *mtd, size_t len,
 static int spi_nor_mtd_otp_range_is_locked(struct spi_nor *nor, loff_t ofs,
 					   size_t len)
 {
-	const struct spi_nor_otp_ops *ops = nor->params->otp.ops;
+	struct spi_nor_flash_parameter *params = spi_nor_get_params(nor, 0);
+	const struct spi_nor_otp_ops *ops = params->otp.ops;
 	unsigned int region;
 	int locked;
 
@@ -328,7 +335,8 @@ static int spi_nor_mtd_otp_read_write(struct mtd_info *mtd, loff_t ofs,
 				      const u8 *buf, bool is_write)
 {
 	struct spi_nor *nor = mtd_to_spi_nor(mtd);
-	const struct spi_nor_otp_ops *ops = nor->params->otp.ops;
+	struct spi_nor_flash_parameter *params = spi_nor_get_params(nor, 0);
+	const struct spi_nor_otp_ops *ops = params->otp.ops;
 	const size_t rlen = spi_nor_otp_region_len(nor);
 	loff_t rstart, rofs;
 	unsigned int region;
@@ -414,7 +422,8 @@ static int spi_nor_mtd_otp_write(struct mtd_info *mtd, loff_t to, size_t len,
 static int spi_nor_mtd_otp_erase(struct mtd_info *mtd, loff_t from, size_t len)
 {
 	struct spi_nor *nor = mtd_to_spi_nor(mtd);
-	const struct spi_nor_otp_ops *ops = nor->params->otp.ops;
+	struct spi_nor_flash_parameter *params = spi_nor_get_params(nor, 0);
+	const struct spi_nor_otp_ops *ops = params->otp.ops;
 	const size_t rlen = spi_nor_otp_region_len(nor);
 	unsigned int region;
 	loff_t rstart;
@@ -467,7 +476,8 @@ static int spi_nor_mtd_otp_erase(struct mtd_info *mtd, loff_t from, size_t len)
 static int spi_nor_mtd_otp_lock(struct mtd_info *mtd, loff_t from, size_t len)
 {
 	struct spi_nor *nor = mtd_to_spi_nor(mtd);
-	const struct spi_nor_otp_ops *ops = nor->params->otp.ops;
+	struct spi_nor_flash_parameter *params = spi_nor_get_params(nor, 0);
+	const struct spi_nor_otp_ops *ops = params->otp.ops;
 	const size_t rlen = spi_nor_otp_region_len(nor);
 	unsigned int region;
 	int ret;
@@ -501,9 +511,10 @@ static int spi_nor_mtd_otp_lock(struct mtd_info *mtd, loff_t from, size_t len)
 
 void spi_nor_set_mtd_otp_ops(struct spi_nor *nor)
 {
+	struct spi_nor_flash_parameter *params = spi_nor_get_params(nor, 0);
 	struct mtd_info *mtd = &nor->mtd;
 
-	if (!nor->params->otp.ops)
+	if (!params->otp.ops)
 		return;
 
 	if (WARN_ON(!is_power_of_2(spi_nor_otp_region_len(nor))))
diff --git a/drivers/mtd/spi-nor/sfdp.c b/drivers/mtd/spi-nor/sfdp.c
index b3b11dfed789..f7137c100569 100644
--- a/drivers/mtd/spi-nor/sfdp.c
+++ b/drivers/mtd/spi-nor/sfdp.c
@@ -436,7 +436,7 @@ static void spi_nor_regions_sort_erase_types(struct spi_nor_erase_map *map)
 static int spi_nor_parse_bfpt(struct spi_nor *nor,
 			      const struct sfdp_parameter_header *bfpt_header)
 {
-	struct spi_nor_flash_parameter *params = nor->params;
+	struct spi_nor_flash_parameter *params = spi_nor_get_params(nor, 0);
 	struct spi_nor_erase_map *map = &params->erase_map;
 	struct spi_nor_erase_type *erase_type = map->erase_type;
 	struct sfdp_bfpt bfpt;
@@ -661,6 +661,8 @@ static int spi_nor_parse_bfpt(struct spi_nor *nor,
  */
 static u8 spi_nor_smpt_addr_nbytes(const struct spi_nor *nor, const u32 settings)
 {
+	struct spi_nor_flash_parameter *params = spi_nor_get_params(nor, 0);
+
 	switch (settings & SMPT_CMD_ADDRESS_LEN_MASK) {
 	case SMPT_CMD_ADDRESS_LEN_0:
 		return 0;
@@ -670,7 +672,7 @@ static u8 spi_nor_smpt_addr_nbytes(const struct spi_nor *nor, const u32 settings
 		return 4;
 	case SMPT_CMD_ADDRESS_LEN_USE_CURRENT:
 	default:
-		return nor->params->addr_mode_nbytes;
+		return params->addr_mode_nbytes;
 	}
 }
 
@@ -822,7 +824,8 @@ spi_nor_region_check_overlay(struct spi_nor_erase_region *region,
 static int spi_nor_init_non_uniform_erase_map(struct spi_nor *nor,
 					      const u32 *smpt)
 {
-	struct spi_nor_erase_map *map = &nor->params->erase_map;
+	struct spi_nor_flash_parameter *params = spi_nor_get_params(nor, 0);
+	struct spi_nor_erase_map *map = &params->erase_map;
 	struct spi_nor_erase_type *erase = map->erase_type;
 	struct spi_nor_erase_region *region;
 	u64 offset;
@@ -910,6 +913,7 @@ static int spi_nor_init_non_uniform_erase_map(struct spi_nor *nor,
 static int spi_nor_parse_smpt(struct spi_nor *nor,
 			      const struct sfdp_parameter_header *smpt_header)
 {
+	struct spi_nor_flash_parameter *params = spi_nor_get_params(nor, 0);
 	const u32 *sector_map;
 	u32 *smpt;
 	size_t len;
@@ -940,7 +944,7 @@ static int spi_nor_parse_smpt(struct spi_nor *nor,
 	if (ret)
 		goto out;
 
-	spi_nor_regions_sort_erase_types(&nor->params->erase_map);
+	spi_nor_regions_sort_erase_types(&params->erase_map);
 	/* fall through */
 out:
 	kfree(smpt);
@@ -980,7 +984,7 @@ static int spi_nor_parse_4bait(struct spi_nor *nor,
 		{ 0u /* not used */,		BIT(11) },
 		{ 0u /* not used */,		BIT(12) },
 	};
-	struct spi_nor_flash_parameter *params = nor->params;
+	struct spi_nor_flash_parameter *params = spi_nor_get_params(nor, 0);
 	struct spi_nor_pp_command *params_pp = params->page_programs;
 	struct spi_nor_erase_map *map = &params->erase_map;
 	struct spi_nor_erase_type *erase_type = map->erase_type;
@@ -1143,6 +1147,7 @@ static int spi_nor_parse_4bait(struct spi_nor *nor,
 static int spi_nor_parse_profile1(struct spi_nor *nor,
 				  const struct sfdp_parameter_header *profile1_header)
 {
+	struct spi_nor_flash_parameter *params = spi_nor_get_params(nor, 0);
 	u32 *dwords, addr;
 	size_t len;
 	int ret;
@@ -1165,14 +1170,14 @@ static int spi_nor_parse_profile1(struct spi_nor *nor,
 
 	 /* Set the Read Status Register dummy cycles and dummy address bytes. */
 	if (dwords[SFDP_DWORD(1)] & PROFILE1_DWORD1_RDSR_DUMMY)
-		nor->params->rdsr_dummy = 8;
+		params->rdsr_dummy = 8;
 	else
-		nor->params->rdsr_dummy = 4;
+		params->rdsr_dummy = 4;
 
 	if (dwords[SFDP_DWORD(1)] & PROFILE1_DWORD1_RDSR_ADDR_BYTES)
-		nor->params->rdsr_addr_nbytes = 4;
+		params->rdsr_addr_nbytes = 4;
 	else
-		nor->params->rdsr_addr_nbytes = 0;
+		params->rdsr_addr_nbytes = 0;
 
 	/*
 	 * We don't know what speed the controller is running at. Find the
@@ -1201,8 +1206,8 @@ static int spi_nor_parse_profile1(struct spi_nor *nor,
 	dummy = round_up(dummy, 2);
 
 	/* Update the fast read settings. */
-	nor->params->hwcaps.mask |= SNOR_HWCAPS_READ_8_8_8_DTR;
-	spi_nor_set_read_settings(&nor->params->reads[SNOR_CMD_READ_8_8_8_DTR],
+	params->hwcaps.mask |= SNOR_HWCAPS_READ_8_8_8_DTR;
+	spi_nor_set_read_settings(&params->reads[SNOR_CMD_READ_8_8_8_DTR],
 				  0, dummy, opcode,
 				  SNOR_PROTO_8_8_8_DTR);
 
@@ -1210,7 +1215,7 @@ static int spi_nor_parse_profile1(struct spi_nor *nor,
 	 * Page Program is "Required Command" in the xSPI Profile 1.0. Update
 	 * the params->hwcaps.mask here.
 	 */
-	nor->params->hwcaps.mask |= SNOR_HWCAPS_PP_8_8_8_DTR;
+	params->hwcaps.mask |= SNOR_HWCAPS_PP_8_8_8_DTR;
 
 out:
 	kfree(dwords);
@@ -1231,7 +1236,7 @@ static int spi_nor_parse_profile1(struct spi_nor *nor,
 static int spi_nor_parse_sccr(struct spi_nor *nor,
 			      const struct sfdp_parameter_header *sccr_header)
 {
-	struct spi_nor_flash_parameter *params = nor->params;
+	struct spi_nor_flash_parameter *params = spi_nor_get_params(nor, 0);
 	u32 *dwords, addr;
 	size_t len;
 	int ret;
@@ -1282,7 +1287,7 @@ static int spi_nor_parse_sccr(struct spi_nor *nor,
 static int spi_nor_parse_sccr_mc(struct spi_nor *nor,
 				 const struct sfdp_parameter_header *sccr_mc_header)
 {
-	struct spi_nor_flash_parameter *params = nor->params;
+	struct spi_nor_flash_parameter *params = spi_nor_get_params(nor, 0);
 	u32 *dwords, addr;
 	u8 i, n_dice;
 	size_t len;
diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
index 12921344373d..63f46e443b29 100644
--- a/drivers/mtd/spi-nor/spansion.c
+++ b/drivers/mtd/spi-nor/spansion.c
@@ -78,7 +78,8 @@ struct spansion_nor_params {
  */
 static void spansion_nor_clear_sr(struct spi_nor *nor)
 {
-	const struct spansion_nor_params *priv_params = nor->params->priv;
+	struct spi_nor_flash_parameter *params = spi_nor_get_params(nor, 0);
+	const struct spansion_nor_params *priv_params = params->priv;
 	int ret;
 
 	if (nor->spimem) {
@@ -98,7 +99,7 @@ static void spansion_nor_clear_sr(struct spi_nor *nor)
 
 static int cypress_nor_sr_ready_and_clear_reg(struct spi_nor *nor, u64 addr)
 {
-	struct spi_nor_flash_parameter *params = nor->params;
+	struct spi_nor_flash_parameter *params = spi_nor_get_params(nor, 0);
 	struct spi_mem_op op =
 		CYPRESS_NOR_RD_ANY_REG_OP(params->addr_mode_nbytes, addr,
 					  0, nor->bouncebuf);
@@ -140,7 +141,7 @@ static int cypress_nor_sr_ready_and_clear_reg(struct spi_nor *nor, u64 addr)
  */
 static int cypress_nor_sr_ready_and_clear(struct spi_nor *nor)
 {
-	struct spi_nor_flash_parameter *params = nor->params;
+	struct spi_nor_flash_parameter *params = spi_nor_get_params(nor, 0);
 	u64 addr;
 	int ret;
 	u8 i;
@@ -159,10 +160,11 @@ static int cypress_nor_sr_ready_and_clear(struct spi_nor *nor)
 
 static int cypress_nor_set_memlat(struct spi_nor *nor, u64 addr)
 {
+	struct spi_nor_flash_parameter *params = spi_nor_get_params(nor, 0);
 	struct spi_mem_op op;
 	u8 *buf = nor->bouncebuf;
 	int ret;
-	u8 addr_mode_nbytes = nor->params->addr_mode_nbytes;
+	u8 addr_mode_nbytes = params->addr_mode_nbytes;
 
 	op = (struct spi_mem_op)
 		CYPRESS_NOR_RD_ANY_REG_OP(addr_mode_nbytes, addr, 0, buf);
@@ -189,13 +191,14 @@ static int cypress_nor_set_memlat(struct spi_nor *nor, u64 addr)
 
 static int cypress_nor_set_octal_dtr_bits(struct spi_nor *nor, u64 addr)
 {
+	struct spi_nor_flash_parameter *params = spi_nor_get_params(nor, 0);
 	struct spi_mem_op op;
 	u8 *buf = nor->bouncebuf;
 
 	/* Set the octal and DTR enable bits. */
 	buf[0] = SPINOR_REG_CYPRESS_CFR5_OCT_DTR_EN;
 	op = (struct spi_mem_op)
-		CYPRESS_NOR_WR_ANY_REG_OP(nor->params->addr_mode_nbytes,
+		CYPRESS_NOR_WR_ANY_REG_OP(params->addr_mode_nbytes,
 					  addr, 1, buf);
 
 	return spi_nor_write_any_volatile_reg(nor, &op, nor->reg_proto);
@@ -203,7 +206,7 @@ static int cypress_nor_set_octal_dtr_bits(struct spi_nor *nor, u64 addr)
 
 static int cypress_nor_octal_dtr_en(struct spi_nor *nor)
 {
-	const struct spi_nor_flash_parameter *params = nor->params;
+	const struct spi_nor_flash_parameter *params = spi_nor_get_params(nor, 0);
 	u8 *buf = nor->bouncebuf;
 	u64 addr;
 	int i, ret;
@@ -253,7 +256,7 @@ static int cypress_nor_set_single_spi_bits(struct spi_nor *nor, u64 addr)
 
 static int cypress_nor_octal_dtr_dis(struct spi_nor *nor)
 {
-	const struct spi_nor_flash_parameter *params = nor->params;
+	const struct spi_nor_flash_parameter *params = spi_nor_get_params(nor, 0);
 	u8 *buf = nor->bouncebuf;
 	u64 addr;
 	int i, ret;
@@ -280,8 +283,9 @@ static int cypress_nor_octal_dtr_dis(struct spi_nor *nor)
 
 static int cypress_nor_quad_enable_volatile_reg(struct spi_nor *nor, u64 addr)
 {
+	struct spi_nor_flash_parameter *params = spi_nor_get_params(nor, 0);
 	struct spi_mem_op op;
-	u8 addr_mode_nbytes = nor->params->addr_mode_nbytes;
+	u8 addr_mode_nbytes = params->addr_mode_nbytes;
 	u8 cfr1v_written;
 	int ret;
 
@@ -339,7 +343,7 @@ static int cypress_nor_quad_enable_volatile_reg(struct spi_nor *nor, u64 addr)
  */
 static int cypress_nor_quad_enable_volatile(struct spi_nor *nor)
 {
-	struct spi_nor_flash_parameter *params = nor->params;
+	struct spi_nor_flash_parameter *params = spi_nor_get_params(nor, 0);
 	u64 addr;
 	u8 i;
 	int ret;
@@ -418,6 +422,7 @@ static int cypress_nor_determine_addr_mode_by_sr1(struct spi_nor *nor,
  */
 static int cypress_nor_set_addr_mode_nbytes(struct spi_nor *nor)
 {
+	struct spi_nor_flash_parameter *params = spi_nor_get_params(nor, 0);
 	struct spi_mem_op op;
 	u8 addr_mode;
 	int ret;
@@ -459,8 +464,8 @@ static int cypress_nor_set_addr_mode_nbytes(struct spi_nor *nor)
 			return spi_nor_set_4byte_addr_mode(nor, true);
 	}
 
-	nor->params->addr_nbytes = addr_mode;
-	nor->params->addr_mode_nbytes = addr_mode;
+	params->addr_nbytes = addr_mode;
+	params->addr_mode_nbytes = addr_mode;
 
 	return 0;
 }
@@ -477,10 +482,10 @@ static int cypress_nor_set_addr_mode_nbytes(struct spi_nor *nor)
  */
 static int cypress_nor_get_page_size(struct spi_nor *nor)
 {
+	struct spi_nor_flash_parameter *params = spi_nor_get_params(nor, 0);
 	struct spi_mem_op op =
-		CYPRESS_NOR_RD_ANY_REG_OP(nor->params->addr_mode_nbytes,
+		CYPRESS_NOR_RD_ANY_REG_OP(params->addr_mode_nbytes,
 					  0, 0, nor->bouncebuf);
-	struct spi_nor_flash_parameter *params = nor->params;
 	int ret;
 	u8 i;
 
@@ -507,12 +512,14 @@ static int cypress_nor_get_page_size(struct spi_nor *nor)
 
 static void cypress_nor_ecc_init(struct spi_nor *nor)
 {
+	struct spi_nor_flash_parameter *params = spi_nor_get_params(nor, 0);
+
 	/*
 	 * Programming is supported only in 16-byte ECC data unit granularity.
 	 * Byte-programming, bit-walking, or multiple program operations to the
 	 * same ECC data unit without an erase are not allowed.
 	 */
-	nor->params->writesize = 16;
+	params->writesize = 16;
 	nor->flags |= SNOR_F_ECC;
 }
 
@@ -521,6 +528,7 @@ s25fs256t_post_bfpt_fixup(struct spi_nor *nor,
 			  const struct sfdp_parameter_header *bfpt_header,
 			  const struct sfdp_bfpt *bfpt)
 {
+	struct spi_nor_flash_parameter *params = spi_nor_get_params(nor, 0);
 	struct spi_mem_op op;
 	int ret;
 
@@ -530,7 +538,7 @@ s25fs256t_post_bfpt_fixup(struct spi_nor *nor,
 
 	/* Read Architecture Configuration Register (ARCFN) */
 	op = (struct spi_mem_op)
-		CYPRESS_NOR_RD_ANY_REG_OP(nor->params->addr_mode_nbytes,
+		CYPRESS_NOR_RD_ANY_REG_OP(params->addr_mode_nbytes,
 					  SPINOR_REG_CYPRESS_ARCFN, 1,
 					  nor->bouncebuf);
 	ret = spi_nor_read_any_reg(nor, &op, nor->reg_proto);
@@ -546,7 +554,7 @@ s25fs256t_post_bfpt_fixup(struct spi_nor *nor,
 
 static int s25fs256t_post_sfdp_fixup(struct spi_nor *nor)
 {
-	struct spi_nor_flash_parameter *params = nor->params;
+	struct spi_nor_flash_parameter *params = spi_nor_get_params(nor, 0);
 
 	/*
 	 * S25FS256T does not define the SCCR map, but we would like to use the
@@ -588,20 +596,21 @@ s25hx_t_post_bfpt_fixup(struct spi_nor *nor,
 			const struct sfdp_bfpt *bfpt)
 {
 	int ret;
+	struct spi_nor_flash_parameter *params = spi_nor_get_params(nor, 0);
 
 	ret = cypress_nor_set_addr_mode_nbytes(nor);
 	if (ret)
 		return ret;
 
 	/* Replace Quad Enable with volatile version */
-	nor->params->quad_enable = cypress_nor_quad_enable_volatile;
+	params->quad_enable = cypress_nor_quad_enable_volatile;
 
 	return 0;
 }
 
 static int s25hx_t_post_sfdp_fixup(struct spi_nor *nor)
 {
-	struct spi_nor_flash_parameter *params = nor->params;
+	struct spi_nor_flash_parameter *params = spi_nor_get_params(nor, 0);
 	struct spi_nor_erase_type *erase_type = params->erase_map.erase_type;
 	unsigned int i;
 
@@ -637,7 +646,7 @@ static int s25hx_t_post_sfdp_fixup(struct spi_nor *nor)
 
 static int s25hx_t_late_init(struct spi_nor *nor)
 {
-	struct spi_nor_flash_parameter *params = nor->params;
+	struct spi_nor_flash_parameter *params = spi_nor_get_params(nor, 0);
 
 	/* Fast Read 4B requires mode cycles */
 	params->reads[SNOR_CMD_READ_FAST].num_mode_clocks = 8;
@@ -671,7 +680,7 @@ static int cypress_nor_set_octal_dtr(struct spi_nor *nor, bool enable)
 
 static int s28hx_t_post_sfdp_fixup(struct spi_nor *nor)
 {
-	struct spi_nor_flash_parameter *params = nor->params;
+	struct spi_nor_flash_parameter *params = spi_nor_get_params(nor, 0);
 
 	if (!params->n_dice || !params->vreg_offset) {
 		dev_err(nor->dev, "%s failed. The volatile register offset could not be retrieved from SFDP.\n",
@@ -720,7 +729,7 @@ static int s28hx_t_post_bfpt_fixup(struct spi_nor *nor,
 
 static int s28hx_t_late_init(struct spi_nor *nor)
 {
-	struct spi_nor_flash_parameter *params = nor->params;
+	struct spi_nor_flash_parameter *params = spi_nor_get_params(nor, 0);
 
 	params->set_octal_dtr = cypress_nor_set_octal_dtr;
 	params->ready = cypress_nor_sr_ready_and_clear;
@@ -740,13 +749,15 @@ s25fs_s_nor_post_bfpt_fixups(struct spi_nor *nor,
 			     const struct sfdp_parameter_header *bfpt_header,
 			     const struct sfdp_bfpt *bfpt)
 {
+	struct spi_nor_flash_parameter *params = spi_nor_get_params(nor, 0);
+
 	/*
 	 * The S25FS-S chip family reports 512-byte pages in BFPT but
 	 * in reality the write buffer still wraps at the safe default
 	 * of 256 bytes.  Overwrite the page size advertised by BFPT
 	 * to get the writes working.
 	 */
-	nor->params->page_size = 256;
+	params->page_size = 256;
 
 	return 0;
 }
@@ -1045,7 +1056,7 @@ static int spansion_nor_sr_ready_and_clear(struct spi_nor *nor)
 
 static int spansion_nor_late_init(struct spi_nor *nor)
 {
-	struct spi_nor_flash_parameter *params = nor->params;
+	struct spi_nor_flash_parameter *params = spi_nor_get_params(nor, 0);
 	struct spansion_nor_params *priv_params;
 	u8 mfr_flags = nor->info->mfr_flags;
 
diff --git a/drivers/mtd/spi-nor/sst.c b/drivers/mtd/spi-nor/sst.c
index 44d2a546bf17..8d6e50cfef62 100644
--- a/drivers/mtd/spi-nor/sst.c
+++ b/drivers/mtd/spi-nor/sst.c
@@ -20,10 +20,11 @@ static int sst26vf_nor_lock(struct spi_nor *nor, loff_t ofs, uint64_t len)
 
 static int sst26vf_nor_unlock(struct spi_nor *nor, loff_t ofs, uint64_t len)
 {
+	struct spi_nor_flash_parameter *params = spi_nor_get_params(nor, 0);
 	int ret;
 
 	/* We only support unlocking the entire flash array. */
-	if (ofs != 0 || len != nor->params->size)
+	if (ofs != 0 || len != params->size)
 		return -EINVAL;
 
 	ret = spi_nor_read_cr(nor, nor->bouncebuf);
@@ -51,7 +52,9 @@ static const struct spi_nor_locking_ops sst26vf_nor_locking_ops = {
 
 static int sst26vf_nor_late_init(struct spi_nor *nor)
 {
-	nor->params->locking_ops = &sst26vf_nor_locking_ops;
+	struct spi_nor_flash_parameter *params = spi_nor_get_params(nor, 0);
+
+	params->locking_ops = &sst26vf_nor_locking_ops;
 
 	return 0;
 }
diff --git a/drivers/mtd/spi-nor/swp.c b/drivers/mtd/spi-nor/swp.c
index 585813310ee1..78febd6e1a00 100644
--- a/drivers/mtd/spi-nor/swp.c
+++ b/drivers/mtd/spi-nor/swp.c
@@ -39,7 +39,8 @@ static u64 spi_nor_get_min_prot_length_sr(struct spi_nor *nor)
 	 * the flash. For now, we need to have that ugly default.
 	 */
 	unsigned int sector_size = nor->info->sector_size ?: SPI_NOR_DEFAULT_SECTOR_SIZE;
-	u64 n_sectors = div_u64(nor->params->size, sector_size);
+	struct spi_nor_flash_parameter *params = spi_nor_get_params(nor, 0);
+	u64 n_sectors = div_u64(params->size, sector_size);
 	u8 mask = spi_nor_get_sr_bp_mask(nor);
 
 	/* Reserved one for "protect none" and one for "protect all". */
@@ -350,11 +351,14 @@ static const struct spi_nor_locking_ops spi_nor_sr_locking_ops = {
 
 void spi_nor_init_default_locking_ops(struct spi_nor *nor)
 {
-	nor->params->locking_ops = &spi_nor_sr_locking_ops;
+	struct spi_nor_flash_parameter *params = spi_nor_get_params(nor, 0);
+
+	params->locking_ops = &spi_nor_sr_locking_ops;
 }
 
 static int spi_nor_lock(struct mtd_info *mtd, loff_t ofs, uint64_t len)
 {
+	struct spi_nor_flash_parameter *params;
 	struct spi_nor *nor = mtd_to_spi_nor(mtd);
 	int ret;
 
@@ -362,7 +366,8 @@ static int spi_nor_lock(struct mtd_info *mtd, loff_t ofs, uint64_t len)
 	if (ret)
 		return ret;
 
-	ret = nor->params->locking_ops->lock(nor, ofs, len);
+	params = spi_nor_get_params(nor, 0);
+	ret = params->locking_ops->lock(nor, ofs, len);
 
 	spi_nor_unlock_and_unprep(nor);
 	return ret;
@@ -370,6 +375,7 @@ static int spi_nor_lock(struct mtd_info *mtd, loff_t ofs, uint64_t len)
 
 static int spi_nor_unlock(struct mtd_info *mtd, loff_t ofs, uint64_t len)
 {
+	struct spi_nor_flash_parameter *params;
 	struct spi_nor *nor = mtd_to_spi_nor(mtd);
 	int ret;
 
@@ -377,7 +383,8 @@ static int spi_nor_unlock(struct mtd_info *mtd, loff_t ofs, uint64_t len)
 	if (ret)
 		return ret;
 
-	ret = nor->params->locking_ops->unlock(nor, ofs, len);
+	params = spi_nor_get_params(nor, 0);
+	ret = params->locking_ops->unlock(nor, ofs, len);
 
 	spi_nor_unlock_and_unprep(nor);
 	return ret;
@@ -385,6 +392,7 @@ static int spi_nor_unlock(struct mtd_info *mtd, loff_t ofs, uint64_t len)
 
 static int spi_nor_is_locked(struct mtd_info *mtd, loff_t ofs, uint64_t len)
 {
+	struct spi_nor_flash_parameter *params;
 	struct spi_nor *nor = mtd_to_spi_nor(mtd);
 	int ret;
 
@@ -392,7 +400,8 @@ static int spi_nor_is_locked(struct mtd_info *mtd, loff_t ofs, uint64_t len)
 	if (ret)
 		return ret;
 
-	ret = nor->params->locking_ops->is_locked(nor, ofs, len);
+	params = spi_nor_get_params(nor, 0);
+	ret = params->locking_ops->is_locked(nor, ofs, len);
 
 	spi_nor_unlock_and_unprep(nor);
 	return ret;
@@ -412,6 +421,7 @@ static int spi_nor_is_locked(struct mtd_info *mtd, loff_t ofs, uint64_t len)
  */
 void spi_nor_try_unlock_all(struct spi_nor *nor)
 {
+	struct spi_nor_flash_parameter *params = spi_nor_get_params(nor, 0);
 	int ret;
 
 	if (!(nor->flags & SNOR_F_HAS_LOCK))
@@ -419,16 +429,17 @@ void spi_nor_try_unlock_all(struct spi_nor *nor)
 
 	dev_dbg(nor->dev, "Unprotecting entire flash array\n");
 
-	ret = spi_nor_unlock(&nor->mtd, 0, nor->params->size);
+	ret = spi_nor_unlock(&nor->mtd, 0, params->size);
 	if (ret)
 		dev_dbg(nor->dev, "Failed to unlock the entire flash memory array\n");
 }
 
 void spi_nor_set_mtd_locking_ops(struct spi_nor *nor)
 {
+	struct spi_nor_flash_parameter *params = spi_nor_get_params(nor, 0);
 	struct mtd_info *mtd = &nor->mtd;
 
-	if (!nor->params->locking_ops)
+	if (!params->locking_ops)
 		return;
 
 	mtd->_lock = spi_nor_lock;
diff --git a/drivers/mtd/spi-nor/winbond.c b/drivers/mtd/spi-nor/winbond.c
index 142fb27b2ea9..cdbec66aed91 100644
--- a/drivers/mtd/spi-nor/winbond.c
+++ b/drivers/mtd/spi-nor/winbond.c
@@ -303,7 +303,7 @@ static const struct spi_nor_otp_ops winbond_nor_otp_ops = {
 
 static int winbond_nor_late_init(struct spi_nor *nor)
 {
-	struct spi_nor_flash_parameter *params = nor->params;
+	struct spi_nor_flash_parameter *params = spi_nor_get_params(nor, 0);
 
 	if (params->otp.org)
 		params->otp.ops = &winbond_nor_otp_ops;
diff --git a/drivers/mtd/spi-nor/xilinx.c b/drivers/mtd/spi-nor/xilinx.c
index f99118c691b0..046dfba6b166 100644
--- a/drivers/mtd/spi-nor/xilinx.c
+++ b/drivers/mtd/spi-nor/xilinx.c
@@ -50,7 +50,8 @@ static const struct flash_info xilinx_nor_parts[] = {
  */
 static u32 s3an_nor_convert_addr(struct spi_nor *nor, u32 addr)
 {
-	u32 page_size = nor->params->page_size;
+	struct spi_nor_flash_parameter *params = spi_nor_get_params(nor, 0);
+	u32 page_size = params->page_size;
 	u32 offset, page;
 
 	offset = addr % page_size;
@@ -110,6 +111,7 @@ static int xilinx_nor_sr_ready(struct spi_nor *nor)
 static int xilinx_nor_setup(struct spi_nor *nor,
 			    const struct spi_nor_hwcaps *hwcaps)
 {
+	struct spi_nor_flash_parameter *params = spi_nor_get_params(nor, 0);
 	u32 page_size;
 	int ret;
 
@@ -135,14 +137,14 @@ static int xilinx_nor_setup(struct spi_nor *nor,
 	 */
 	if (nor->bouncebuf[0] & XSR_PAGESIZE) {
 		/* Flash in Power of 2 mode */
-		page_size = (nor->params->page_size == 264) ? 256 : 512;
-		nor->params->page_size = page_size;
+		page_size = (params->page_size == 264) ? 256 : 512;
+		params->page_size = page_size;
 		nor->mtd.writebufsize = page_size;
-		nor->params->size = nor->info->size;
+		params->size = nor->info->size;
 		nor->mtd.erasesize = 8 * page_size;
 	} else {
 		/* Flash in Default addressing mode */
-		nor->params->convert_addr = s3an_nor_convert_addr;
+		params->convert_addr = s3an_nor_convert_addr;
 		nor->mtd.erasesize = nor->info->sector_size;
 	}
 
@@ -151,8 +153,10 @@ static int xilinx_nor_setup(struct spi_nor *nor,
 
 static int xilinx_nor_late_init(struct spi_nor *nor)
 {
-	nor->params->setup = xilinx_nor_setup;
-	nor->params->ready = xilinx_nor_sr_ready;
+	struct spi_nor_flash_parameter *params = spi_nor_get_params(nor, 0);
+
+	params->setup = xilinx_nor_setup;
+	params->ready = xilinx_nor_sr_ready;
 
 	return 0;
 }
diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
index cdcfe0fd2e7d..59909e7d6f53 100644
--- a/include/linux/mtd/spi-nor.h
+++ b/include/linux/mtd/spi-nor.h
@@ -433,6 +433,16 @@ static inline struct device_node *spi_nor_get_flash_node(struct spi_nor *nor)
 	return mtd_get_of_node(&nor->mtd);
 }
 
+static inline struct spi_nor_flash_parameter *spi_nor_get_params(const struct spi_nor *nor, u8 idx)
+{
+	return nor->params;
+}
+
+static inline void spi_nor_set_params(struct spi_nor *nor, u8 idx,
+				      struct spi_nor_flash_parameter *params)
+{
+	nor->params = params;
+}
 /**
  * spi_nor_scan() - scan the SPI NOR
  * @nor:	the spi_nor structure
-- 
2.17.1

