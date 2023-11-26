Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BFEA77F94A9
	for <lists+alsa-devel@lfdr.de>; Sun, 26 Nov 2023 18:46:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 182067F8;
	Sun, 26 Nov 2023 18:46:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 182067F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701020800;
	bh=pdHonYLusTRGZEOfzFAp2afE6FK+l8F2xdjNx4sdXiE=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=gWQggKO3uSfSyXdZ45bTDiJxoGvXuaX+6oFqWPi1O+VlxbTnBw4/HnXgH3H8dAByX
	 pLpSswooC2X2clEagrFWIa6DbBYnZyO7fH5qTSvEGax6JCeVCNRThRqVr/D8G8LwmQ
	 IzmUwWrDqHhrXqZcnvwuVLaQgUfGfPoQLkrGz+Og=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0EB28F8057C; Sun, 26 Nov 2023 18:46:07 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5DB3AF8055B;
	Sun, 26 Nov 2023 18:46:07 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 42A24F80254; Sat, 25 Nov 2023 10:22:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on20608.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eb2::608])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 51A75F802E8
	for <alsa-devel@alsa-project.org>; Sat, 25 Nov 2023 10:22:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 51A75F802E8
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=HKHoXOCa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RrrhuV+FHHSSsUKxlUla2b5d5XiBVkW3PrQjBNaNdMHJMou5UnpmHu6ArL5SoKVclBs2uMQWGqnjxcLwNPQ2PzGm7stWVqH82SZJ6SFOIVVWAtPxde2wTqV+yRJTG289evCpgU/9bBw2Jk5xJ6ZWscjMdB0z2NxBlcpcp6scpbTimyeaydVwLvkGO9MQw9/tdeuDKhlaqpSgeTkr2h4a8JFtziqqNDj0W9fcl+K7+Tv8yNfHQTxhJ9UZjtdzwJQxoQF3PIuYLweJF0YJGaghMnouEwuqcnx2wPLK/0c9SQ6BysyH/CqL3MfsBE5moQ3PXQ5Uk2dPJ9Erxfw5QHawig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zdhmBIv20tzFedbudL60rKhNQSi9GXwtyqdd+i/jiJQ=;
 b=NFHdawyb+AaNzxjG/vahJFotUHGK/zvV8hI70pfF897M938f7de9smqGVgDqEPMYt4FPVt0FOCR1LIdYvGWCaN1BhxythMPkyZMQnz71iaDnsYdeALYZH2zYk4ZcyS7NVbn2KBrkMT7PY0pkLeRybPCYgW5hwFhs0pe81geCy26sleGqJmZzEUrM4zd6lQXj/zZ2Hjm8AROj1wkEmiZ5SKIW5arzA3Ii9Jm6w6aMfEy2D79o4rVe3YmuXBbpcTWL9lTaz8rwRx0iwWeROLEGBPvXtfx6uRwTNv3Vli7AsBvlfV0mEvGvXLAgBa8bjVaavDmdr3XECc2cPBdPsjJJ0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zdhmBIv20tzFedbudL60rKhNQSi9GXwtyqdd+i/jiJQ=;
 b=HKHoXOCaLcyWQ9K5RWi/3f5Lhisc/fxWe+K7w0dvBplnRdoA5YgZt4PWxn6ur9JbsXWHlonUekDvvpKLeJlx+ctDSsK8Nxw+rEL0R673SCtxeDyos/XISTkYDArneCV4TxBBbp3LtYbqnd2ModT3eE/Wk/gM4c5kbyyUwsV5LbA=
Received: from DM6PR11CA0065.namprd11.prod.outlook.com (2603:10b6:5:14c::42)
 by SA3PR12MB7806.namprd12.prod.outlook.com (2603:10b6:806:31d::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.21; Sat, 25 Nov
 2023 09:22:00 +0000
Received: from DS1PEPF00017097.namprd05.prod.outlook.com
 (2603:10b6:5:14c:cafe::cc) by DM6PR11CA0065.outlook.office365.com
 (2603:10b6:5:14c::42) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.21 via Frontend
 Transport; Sat, 25 Nov 2023 09:22:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF00017097.mail.protection.outlook.com (10.167.18.101) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7046.17 via Frontend Transport; Sat, 25 Nov 2023 09:22:00 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Sat, 25 Nov
 2023 03:21:59 -0600
Received: from xhdakumarma40u.xilinx.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.34
 via Frontend Transport; Sat, 25 Nov 2023 03:21:53 -0600
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
Subject: [PATCH v11 02/10] ALSA: hda/cs35l56: Use set/get APIs to access
 spi->chip_select
Date: Sat, 25 Nov 2023 14:51:29 +0530
Message-ID: <20231125092137.2948-3-amit.kumar-mahapatra@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20231125092137.2948-1-amit.kumar-mahapatra@amd.com>
References: <20231125092137.2948-1-amit.kumar-mahapatra@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017097:EE_|SA3PR12MB7806:EE_
X-MS-Office365-Filtering-Correlation-Id: 9656d20e-dd54-47a7-dcd0-08dbed97fa75
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	4WxtTJ0A2Ar/SWsYOW106lL1o33LtkJkVPzGXxUo94RNoTU1OQwFhX5Uwth4cBfYScuMqNH/ff+/3juoN7jP6izjee2YsQRm36/Ukj8tPomG1xhJLEyP1dg+HXcpV2dFir7HzmmCYoWofOxbTZ18/d5mXv83n17QPfMk0qF3QbU6p5eLqLVHQsCnIouQYOmqBmZFnUEyLwu+4SIEkXO1nOF70He9Eq4I3irLk8CBMRQEMWzkTmAkSQvoG4nxjTa/rKfNWWvGIUMJrjLAY1Aj23h4GTX28y8+zxWqhn0gmTj0uSBRMr1FfRWnmWDAtdIT+aXi8b4q5IULTGw5cpV05kpdtHLmXes+UaIrlkHQIVJiqxKsNXMgLRpYK+k3LT0VIiIpUCsfiuBIdag8/PZerKvxSoW18SNpkf/d8TxOtKX0XWiBc62xSes/q1m7IGUARjU3H67MS2Gh2uvSPAvdRMm019OtrKQRpZqM22MNBd6RjMNB9TyxpVVxiKlTh4GOnzqCqGnjQUIaQ1DhM81U0yr4GsltfcxKEn7c9EKWhjSSPTeM36R8YSuUVzcw/L3AOdh1exRdJV5nV586GOlZNH5HosO1uiNZdQnpW5AznHY2L4N99P4ao10ecWhBdYVaqJkApmCqzIDWcMq9GcuGooq03JbPgpir7bH/mBZ1HuL5wZoxOYPa7JidDijoFwsiFfl0CJX42YgKfG7U/ZfwP/t4VG15Fm5pczfenb+k9ktr/eFoldMFLPvnVAbW7wPAgvPNPFnurFbey9N2B9NIovSoN1am/xCS0Ms5WtzZWEg=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(396003)(376002)(136003)(346002)(230922051799003)(186009)(451199024)(64100799003)(82310400011)(1800799012)(40470700004)(36840700001)(46966006)(316002)(70206006)(54906003)(70586007)(110136005)(40460700003)(82740400003)(921008)(4744005)(2906002)(5660300002)(7416002)(36756003)(356005)(81166007)(8676002)(8936002)(4326008)(26005)(86362001)(36860700001)(6666004)(336012)(426003)(1076003)(41300700001)(2616005)(40480700001)(478600001)(47076005)(83380400001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2023 09:22:00.0148
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 9656d20e-dd54-47a7-dcd0-08dbed97fa75
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DS1PEPF00017097.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7806
X-MailFrom: amit.kumar-mahapatra@amd.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: QI5FAPGRTNUFMUGR6FNFJ27TIVGFH4GL
X-Message-ID-Hash: QI5FAPGRTNUFMUGR6FNFJ27TIVGFH4GL
X-Mailman-Approved-At: Sun, 26 Nov 2023 17:37:49 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: <>
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
 sound/pci/hda/cs35l56_hda_spi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/pci/hda/cs35l56_hda_spi.c b/sound/pci/hda/cs35l56_hda_spi.c
index 756aec342eab..1c5cb3b1e2c3 100644
--- a/sound/pci/hda/cs35l56_hda_spi.c
+++ b/sound/pci/hda/cs35l56_hda_spi.c
@@ -29,7 +29,7 @@ static int cs35l56_hda_spi_probe(struct spi_device *spi)
 		return ret;
 	}
 
-	ret = cs35l56_hda_common_probe(cs35l56, spi->chip_select);
+	ret = cs35l56_hda_common_probe(cs35l56, spi_get_chipselect(spi, 0));
 	if (ret)
 		return ret;
 	ret = cs35l56_irq_request(&cs35l56->base, spi->irq);
-- 
2.17.1

