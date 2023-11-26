Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C6DB7F94AA
	for <lists+alsa-devel@lfdr.de>; Sun, 26 Nov 2023 18:47:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B0FE6DF5;
	Sun, 26 Nov 2023 18:46:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B0FE6DF5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701020821;
	bh=FzUyZDYypnCx9t4290reUgAK0D/yL0bm3I7QVD5ngV0=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=j4T/1ZQghsIXqv2/8UjGkwTcwmqOTpFpJ1CCpRdiu0umbXYb7jttPQf1A2W5ImqFn
	 3UzemZerSC4YfB8V4m3xNfZSuox6Bzxmt8jQiUG3Wd2PqEZrIF6udcL2NZrv5C6jkx
	 jTRbDT2tJ7rxHq2b11ZuY30waNlnCH1wnSxIc1wQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A4C33F805DA; Sun, 26 Nov 2023 18:46:08 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6372EF805BD;
	Sun, 26 Nov 2023 18:46:08 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B280DF80558; Sat, 25 Nov 2023 10:22:37 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20605.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eab::605])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id EEEFCF80166
	for <alsa-devel@alsa-project.org>; Sat, 25 Nov 2023 10:22:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EEEFCF80166
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=sG8dTcek
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j+b6G+xcQXumMr+LI9C7pEyzf1YBoUmzWIyqjh4Ti9pfA+Gxc71//eJAj90z08LEa6mOXxSJJh0vbsjs2NBEupOK/UBLe+8JuZPANCbVZp8hAenixpoph2tCIRp0VjkujAHdTTGuB3MtGxINQtz6XMnIpyIkgyk6tnUHsGRK0t/t6Y3kNI8OkXyc+rjIOoOV8MuMawSI9thGT3Fu3hL20fKpnuCkso/dZKB4I1RMurjfCIkNbaYhfHYkB0Pn+nGPhZnQ/8kW8rTcJ9HKD0Ota6u3rNY1jmwAuCtGI9gQLDujCdPh7qQq2IFRJYqL7aU3gDSyIU3VKPNCZmhBkFnyeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D5mqpHnfYMEPp/K3f3bZgmug97OgZD/HN9a0e4dtXkU=;
 b=d1fo1tEZvZlqCISXqY4EASnXJNZqHVimNF67TDaPIf3+cKXhadwBzJwpf6bYGUIwtQE49hf/Genv3L+/QJsryidrEEraOiH9obdssRV/sKw+2tP+AVuflMoRv80N2YCdMLKwlf9bHsenxm46cM+i292m6/FikowC7W6TVsBVTIKIus0h7dmyg0HoC0+fHWPvCi8DdcKmCW1obNFTQA9ksrmKnZdTOTo9wUhFTkd9+UM0+2yQBfj8lL9WuvPvIP1eV9HuV3/dDXIPtc5uMZxLi21hEd/F0TkUNOEAnyzsDuiK2YBvVVB9nIokUNvZrucpbJ0Mx2MlTKwN3Jjl4AlrnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D5mqpHnfYMEPp/K3f3bZgmug97OgZD/HN9a0e4dtXkU=;
 b=sG8dTceksll5QzgL6ce/Yg35TH8lTe8t5IzL0CVZHIIyadAJoR2DPGzxm3xhBy6wLz9NKPrPb5FJtREYut3nD+zIXl+NL4ENo5ynKLlMKL3XMUfbfba0F/i1oRK6qb+Czs+aND8GpN0h3jvoAhkCMU+yjHpFre5k4BYItsMdJi8=
Received: from DM6PR11CA0016.namprd11.prod.outlook.com (2603:10b6:5:190::29)
 by BL0PR12MB4945.namprd12.prod.outlook.com (2603:10b6:208:1c4::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.21; Sat, 25 Nov
 2023 09:22:16 +0000
Received: from DS1PEPF0001709D.namprd05.prod.outlook.com
 (2603:10b6:5:190:cafe::bd) by DM6PR11CA0016.outlook.office365.com
 (2603:10b6:5:190::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.24 via Frontend
 Transport; Sat, 25 Nov 2023 09:22:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF0001709D.mail.protection.outlook.com (10.167.18.107) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7046.17 via Frontend Transport; Sat, 25 Nov 2023 09:22:15 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Sat, 25 Nov
 2023 03:22:13 -0600
Received: from xhdakumarma40u.xilinx.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.34
 via Frontend Transport; Sat, 25 Nov 2023 03:22:06 -0600
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
Subject: [PATCH v11 04/10] mtd: spi-nor: Convert macros with inline functions
Date: Sat, 25 Nov 2023 14:51:31 +0530
Message-ID: <20231125092137.2948-5-amit.kumar-mahapatra@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20231125092137.2948-1-amit.kumar-mahapatra@amd.com>
References: <20231125092137.2948-1-amit.kumar-mahapatra@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0001709D:EE_|BL0PR12MB4945:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b613399-6860-4f1e-8fc9-08dbed9803d1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	hQ/+ErS8FAeV6k2Imx4p4txgGXDDGPMqQND8LdWAec25A7n5ya9/0zK67dFJ+tp31pz/YdENr9QbUHWrsILL/Gz+c13drKZUjWjvLrcCYEB1IT01epUMu/b/X7i7mNUCsexX99yHJW+1U+uMX9/SxvjCv/ZQo52Qul5+3v+meXsYmINiXdRV56rg0yn07QWy8b+PQ2QT9yensHwU7KqK8rLN0tS+4leAW2O+3md/1IXOTcZXqPTov01Dtu3yCJAB+zEVTrjWlovNOtdIlUKAUXAaSJCWEWqfMoFWR+P26Vl9noU0dyM4/vK9jmDzGHpsBNBDQ46AB5VLBRuH2pV11waMVZLvVK1doVG4mv6PAXm2zVP/c95E25bj2GyY0Voacc7tgzGYqdXtdkg8ybh7b3tW8mA3XOnCitQ0ny5lglLcf5oGnxwrVEfSSNmbUmsuVNYwt8aN2Lv9vqhyK7kNbzT28AywdBBIa9/zKKy7TvvL/RdSKwVFwwOzQwmlfoPm+rVgexzpWnOuDPWE4v/5sS4DgCsxZFvSGJKbGRaGiIvsSDEWVFKaKQWrlz4unkIeC/3qgVBKHGbs++gbb4/gOuFxXib1r2RixsAKB2gcXvzV0V181PRQU52ZMB5W3czUYXlXBEF6SpxWrzhEH2nG6oI76Rig8aI0+z/yvX4aJ7MvfrfEI2m8YwpTNHbnBwQaQJsDIwKHBIocyJrFB2hwtv+XuTOf85tLfECv1Ry5Dyc0PJq2HB6ZEyzsTuLJ5om2pMb3b4HxILf+KUJcDwMeADCphlxn3XA08uCoJub6RoQ=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(136003)(39850400004)(346002)(396003)(376002)(230922051799003)(451199024)(64100799003)(82310400011)(1800799012)(186009)(40470700004)(46966006)(36840700001)(40460700003)(921008)(478600001)(356005)(36860700001)(6666004)(81166007)(8676002)(8936002)(4326008)(82740400003)(316002)(70586007)(54906003)(70206006)(40480700001)(336012)(426003)(110136005)(26005)(83380400001)(7416002)(1076003)(2616005)(47076005)(41300700001)(86362001)(5660300002)(36756003)(2906002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2023 09:22:15.7153
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 0b613399-6860-4f1e-8fc9-08dbed9803d1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DS1PEPF0001709D.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4945
X-MailFrom: amit.kumar-mahapatra@amd.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: GORYJCKDQ6UZDKAGZRY6ZXWNUOCOLY7H
X-Message-ID-Hash: GORYJCKDQ6UZDKAGZRY6ZXWNUOCOLY7H
X-Mailman-Approved-At: Sun, 26 Nov 2023 17:37:50 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GORYJCKDQ6UZDKAGZRY6ZXWNUOCOLY7H/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

In further patches the nor->params references in
spi_nor_otp_region_len(nor) & spi_nor_otp_n_regions(nor) macros will be
replaced with spi_nor_get_params() API. To make the transition smoother,
first converting the macros into static inline functions.

Suggested-by: Michal Simek <michal.simek@amd.com>
Signed-off-by: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
---
 drivers/mtd/spi-nor/otp.c | 23 +++++++++++++++++++++--
 1 file changed, 21 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/spi-nor/otp.c b/drivers/mtd/spi-nor/otp.c
index 9a729aa3452d..23fe75ddc9cf 100644
--- a/drivers/mtd/spi-nor/otp.c
+++ b/drivers/mtd/spi-nor/otp.c
@@ -11,8 +11,27 @@
 
 #include "core.h"
 
-#define spi_nor_otp_region_len(nor) ((nor)->params->otp.org->len)
-#define spi_nor_otp_n_regions(nor) ((nor)->params->otp.org->n_regions)
+/**
+ * spi_nor_otp_region_len() - get size of one OTP region in bytes
+ * @nor:        pointer to 'struct spi_nor'
+ *
+ * Return: size of one OTP region in bytes
+ */
+static inline unsigned int spi_nor_otp_region_len(struct spi_nor *nor)
+{
+	return nor->params->otp.org->len;
+}
+
+/**
+ * spi_nor_otp_n_regions() - get number of individual OTP regions
+ * @nor:        pointer to 'struct spi_nor'
+ *
+ * Return: number of individual OTP regions
+ */
+static inline unsigned int spi_nor_otp_n_regions(struct spi_nor *nor)
+{
+	return nor->params->otp.org->n_regions;
+}
 
 /**
  * spi_nor_otp_read_secr() - read security register
-- 
2.17.1

