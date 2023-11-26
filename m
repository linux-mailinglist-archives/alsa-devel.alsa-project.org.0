Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D6C47F94A6
	for <lists+alsa-devel@lfdr.de>; Sun, 26 Nov 2023 18:41:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 974EA84A;
	Sun, 26 Nov 2023 18:41:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 974EA84A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701020518;
	bh=0uSSUZ8292Qkl1XYEFzHIx13ZjLKZslDMDILb1C5hv4=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=JA//fuexR4h3Mg1uipZfN7mKNbGXukU1rgKDSxSI8s4Za5A40baszctjPR0VHEu65
	 hvdIrvMhY0U8NyK7KQSxc1ZE2bgL7GxzKQAkEPlAfTIVpj1D79GrXMtdtekMU7w5on
	 1cSGkXeDLLl7apLxNcjNus+4pVXAW3NuUih5Dwb4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 225A6F80568; Sun, 26 Nov 2023 18:41:27 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 96B52F8057A;
	Sun, 26 Nov 2023 18:41:26 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D0CA4F80310; Sat, 25 Nov 2023 10:22:13 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20627.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e8a::627])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 49A98F80249
	for <alsa-devel@alsa-project.org>; Sat, 25 Nov 2023 10:21:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 49A98F80249
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=YcPiipi0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lD69GWKku7R81ZxjkxnJi3hl5P7m53QRdob48uLFxNayvNsglUsqA8YHe3eD29pI9qHUrglrXSkfIgmz8McwU4itNJOCMoUkrVAmY63TZhd1/Cg0hPcFilhAbhZt5DNczG8P2SvKER2oTBkNsJsb85E21v631hEhccTrUkY5ulZxzfvjSbyBiaNt7B9A6vzUAF+nkOAOZNN60ycMq15794J59VLOGAuYIkqYPLGIaOvINNDemk3O5vG6jnACsu7CycXa7OIKvst0QBb3a/47FDen6f9FMCk21aqaLzC6qm9RcZEF5UoOqOPt32dUSwb6oS1CK1f2ViuV1nP/4e2K5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z1cnvVPEmwuLBAJrJb/Voh0qKQurN7FQH/OqpGRVa70=;
 b=UoNjxeIISBl9VpTUdOGM+FJ5VN9MghOprodMwdKQQmIeWjgjhYtb0m4khoqI1Xes8j6+gGVa6VasU50gDZLb7outN+MvekloEGtaPefrD+5kD3Q3bEEdlqclEZagnacYe85LfqeTvlTwSSjPlOqKv8cDghZ9VJTfm4OuKyG6THMK/iNXdHzdnbmjmBHP3TWkbogITRFKM/qPF3pt4GzC8ZDYRekefHnH1kNaszypjEE+sjhOkx8x6cyOhPZS6MZoxEg30YzZfel/x2cY9cSZRDJqyNLHQe6/N6O8UNbiO1frmubi5KZGu/8CnJctGJ7ltYe6e04t7MgM7rSYokwYfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z1cnvVPEmwuLBAJrJb/Voh0qKQurN7FQH/OqpGRVa70=;
 b=YcPiipi0rNfasx1Xa2yI1p8nAkn80KxZ6dVC+pSRpiKwCcOkqa5w9huT3qy6SjryMxcQP8xDL3Pj+XRapJ5byX7NpxvS0nefTuSOUfdFYtojWqLAKW97CERP+p5c6utEpADqiSlgzyjlJeeFc6kVu/M8byKTvZBzSgH5oqdd1vg=
Received: from DM6PR11CA0065.namprd11.prod.outlook.com (2603:10b6:5:14c::42)
 by DM4PR12MB5264.namprd12.prod.outlook.com (2603:10b6:5:39c::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.25; Sat, 25 Nov
 2023 09:21:53 +0000
Received: from DS1PEPF00017097.namprd05.prod.outlook.com
 (2603:10b6:5:14c:cafe::cc) by DM6PR11CA0065.outlook.office365.com
 (2603:10b6:5:14c::42) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.21 via Frontend
 Transport; Sat, 25 Nov 2023 09:21:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF00017097.mail.protection.outlook.com (10.167.18.101) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7046.17 via Frontend Transport; Sat, 25 Nov 2023 09:21:53 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Sat, 25 Nov
 2023 03:21:52 -0600
Received: from xhdakumarma40u.xilinx.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.34
 via Frontend Transport; Sat, 25 Nov 2023 03:21:46 -0600
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
Subject: [PATCH v11 01/10] mfd: tps6594: Use set/get APIs to access
 spi->chip_select
Date: Sat, 25 Nov 2023 14:51:28 +0530
Message-ID: <20231125092137.2948-2-amit.kumar-mahapatra@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20231125092137.2948-1-amit.kumar-mahapatra@amd.com>
References: <20231125092137.2948-1-amit.kumar-mahapatra@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017097:EE_|DM4PR12MB5264:EE_
X-MS-Office365-Filtering-Correlation-Id: 9204fb6e-da20-496c-6fa7-08dbed97f679
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	nxjFJJoqkFIIgowpoNSusSY8AvJMKr9OKheQRsX/bGsjmEWfu5RTpUtue3Yl0HLzDGord0Pq1eg3uS0lACHyjLpoJDT+W7XibI0Vc/e4RJ/kyFc84p161WlHXzeKl3t+Gz3E+YpHp/It8BAUMafAWoo2by3ixPTo63yUlH1QY9OATMYygDzG5pjysCsBBMsvMloiogWCvJIBoxaOaRNhbhhY8u8m6hYPyH1/6kp3EqVFzJrScPlkob7aZd5GdzTrxdLtbSdbWdSbYVvSQKjCvUQ7uRcn/PvY18G5zU7KW9rRD/kHMb0nUhuvf42YFt67bY9IUr8gafyAHyJ5+iVplEYB/hnIQvoYfGMrWCmmuAw9tBcAaXk9JPiHZMAEgFJNSC7bn16AB2WDkQvSJFK6CJbhk5/f0mcZbkHacFj4/ptZfuU0iZYNgKF/6gSdkIeWOp2vHmKXUE9mdDe4mEeOcCfKGVL20FPnhzufHonc0O1u9wWYto9GOy6w58co3LlHIO8KGWhhVzrN48PI/+MLZ6DGF6RE9fOakNLb+M2tfGcPSPIa/S88lJ9dY1sxXzFY1JWWlNMe3wZy5KiQyfauTNY5GeXfg9vztcJ9N2/e1E+QI93vTPjM5lOgRjOn4lEAyp/8cgS1wSaC3Yj+lIG0Ry2KHx6xxtx6pQ02NFIc53LG0YhRyOgwZh/QsaiSa6X/2q7i9C9RAyev0YbgrCi4rhq0Zmq4y+qrV95yaUUqaU0/moh+jHiC/uPAIwGjEQ3ZuBFMkOtUMjd9rSTstvyJvYeXV/lx+JDiZbt/f7EU/k0=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(136003)(346002)(39860400002)(376002)(396003)(230922051799003)(186009)(451199024)(64100799003)(82310400011)(1800799012)(46966006)(36840700001)(40470700004)(316002)(110136005)(54906003)(70206006)(70586007)(478600001)(40460700003)(6666004)(7416002)(5660300002)(921008)(41300700001)(36756003)(4744005)(2906002)(4326008)(8676002)(8936002)(86362001)(336012)(426003)(82740400003)(83380400001)(356005)(2616005)(26005)(1076003)(36860700001)(81166007)(47076005)(40480700001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2023 09:21:53.3274
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 9204fb6e-da20-496c-6fa7-08dbed97f679
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DS1PEPF00017097.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5264
X-MailFrom: amit.kumar-mahapatra@amd.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: YL4YMHCSTF7IULDVUSVNJ6WW4FOIZRFJ
X-Message-ID-Hash: YL4YMHCSTF7IULDVUSVNJ6WW4FOIZRFJ
X-Mailman-Approved-At: Sun, 26 Nov 2023 17:37:00 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YL4YMHCSTF7IULDVUSVNJ6WW4FOIZRFJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

In preparation for adding multiple CS support for a device, set/get
functions were introduces accessing spi->chip_select in
'commit 303feb3cc06a ("spi: Add APIs in spi core to set/get
spi->chip_select and spi->cs_gpiod")'.
Replace spi->chip_select with spi_get_chipselect() API.

Signed-off-by: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
---
 drivers/mfd/tps6594-spi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mfd/tps6594-spi.c b/drivers/mfd/tps6594-spi.c
index f4b4f37f957f..24b72847e3f5 100644
--- a/drivers/mfd/tps6594-spi.c
+++ b/drivers/mfd/tps6594-spi.c
@@ -98,7 +98,7 @@ static int tps6594_spi_probe(struct spi_device *spi)
 	spi_set_drvdata(spi, tps);
 
 	tps->dev = dev;
-	tps->reg = spi->chip_select;
+	tps->reg = spi_get_chipselect(spi, 0);
 	tps->irq = spi->irq;
 
 	tps->regmap = devm_regmap_init(dev, NULL, spi, &tps6594_spi_regmap_config);
-- 
2.17.1

