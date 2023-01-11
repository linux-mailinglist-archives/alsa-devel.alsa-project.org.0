Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 12C066656BD
	for <lists+alsa-devel@lfdr.de>; Wed, 11 Jan 2023 10:02:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8966477E4;
	Wed, 11 Jan 2023 10:01:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8966477E4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673427722;
	bh=BlfGxmodh7PX7Cvucyo3i+8+LA/zHhWJM+NJnDzlhL0=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=p2vQM7uJuOl9UaoVwc+TTl9nwwT1HTOtAIJNs82sr+e+pHYZ+a7J4q0JdIF70Wfoc
	 2SPO5JUzveQu/djqwvbJuMjSthxwZHNp2wIwoj7u7UbrT3JtvnpbcPC/XuApn6jvcq
	 oggpXxDcIkb1+SIDbmVcaVzYkPJ5LRfSHYDRXBdE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1A183F804BC;
	Wed, 11 Jan 2023 10:00:19 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 41BE7F80570; Wed, 11 Jan 2023 10:00:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
 SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9D9BEF80563
 for <alsa-devel@alsa-project.org>; Wed, 11 Jan 2023 10:00:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9D9BEF80563
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=uLOSvlpp
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nufXLdf6onwtr323GpjZp9iyC5rpPsE9s4lBfEg+vUcdv/GlKG/LfFLGKMXV3qn1vCciAIgtvDyI37PuXcjfLOIwQtqQm8ZYhmWwNwSS5ecseP/j27FRhA5tk2RS5q8qGA7LVGFiXI2U+mFlwyZoeXIOOSFlEROu45jbU72+b2hykuMf8QbYJtvdME61OClJXRFw6YCeXHkRW4bCsFuFJ1MiFAOHJvxGlIGZ72UZlo2zDFEI9y8p/j1mroQbiR49EXeTLQRlV0ok8RmtdbQEjEk1vwVoQmWnhzGO31yHOQAmkZrUi41ssihKRJrGtwCEI3cLWoEaE3W2m6YXmdRHDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GJ6jKY+ZT0N+3V7Zxn6rKxKflxkG+I4ICqoEYGVo7Cg=;
 b=ZhWD0v8Jml0QwwUECfuyljFB8UtimMZstr+8m6CKw+6O3jSsQlzHs+bG1iumAc9CPSITI90dKt2wlvEiHZIWZu0Pa8S9DdU+EvqvWQPA1fyEdHtiX4JcN9dXMwDSTMTe7hTks7ZdMyF/1yuOLtiqtd1pjZQJldSeWUBbPtjo1ySV/6zxXNGkUMMyBRY8cpGu/VGzWiUsc+tNuhyRDPEerHOYJ5dM1n9M3Jht7HwupNoZIPenVe7aB9c1m5p8IhdwBNlYos36xjXx+yPq39EWDmjT+tp5HswR8z9o0enrJyToZmvosEwARk18nrFXM6yisTtStjt8SGjTG9lsuvQdrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GJ6jKY+ZT0N+3V7Zxn6rKxKflxkG+I4ICqoEYGVo7Cg=;
 b=uLOSvlppc2Qr3XWZ4bhgoFFjl4KoBs5nKsXgUOWnywGjoO+zimE2tNwHCVoaDAogprRjLhK+dskbjuhvz0vE/kPqXXXDf5U6sTobIjBKsfqI0XvhA91jg0Nu5gJnaOfZF4ktnUtruqtKzp1hyxvQupttPSw32Pu3wW+V0+oaKaI=
Received: from DM5PR07CA0107.namprd07.prod.outlook.com (2603:10b6:4:ae::36) by
 PH0PR12MB5418.namprd12.prod.outlook.com (2603:10b6:510:e5::19) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5986.18; Wed, 11 Jan 2023 09:00:08 +0000
Received: from DM6NAM11FT016.eop-nam11.prod.protection.outlook.com
 (2603:10b6:4:ae:cafe::52) by DM5PR07CA0107.outlook.office365.com
 (2603:10b6:4:ae::36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.13 via Frontend
 Transport; Wed, 11 Jan 2023 09:00:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DM6NAM11FT016.mail.protection.outlook.com (10.13.173.139) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5986.18 via Frontend Transport; Wed, 11 Jan 2023 09:00:08 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 11 Jan
 2023 03:00:05 -0600
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34
 via Frontend Transport; Wed, 11 Jan 2023 03:00:01 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>, <vkoul@kernel.org>, <alsa-devel@alsa-project.org>
Subject: [PATCH 04/19] soundwire: amd: enable build for AMD soundwire master
 driver
Date: Wed, 11 Jan 2023 14:32:07 +0530
Message-ID: <20230111090222.2016499-5-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230111090222.2016499-1-Vijendar.Mukunda@amd.com>
References: <20230111090222.2016499-1-Vijendar.Mukunda@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT016:EE_|PH0PR12MB5418:EE_
X-MS-Office365-Filtering-Correlation-Id: 7cf94da2-f35a-480a-79d0-08daf3b23d29
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EDo13yJka0ouuud4eDhnMcbFN6OiYt2yVPeVfSGLUGsSxUJoM7liKL/cLGwH228CP9VoT4AoxN+HNGabUZlGoxAGoulIBeNbBGbDPfoY1vJkxj5NGAHXQo53xa45VyG8P6LJNvGqb5lcwcfx/BqZowj7HvTFce9aaq5yurXy3aZ8W6cGMsSV/ezXK386jDNDeHlBRMRcDy/rFNJijDp5orNn2KXdvIw2dbl2r8/igU3ecXVXYHlKwEVkj1z2kuVvlYpiQwFllro+8x//+LAkI9g+6Oke9iRA6VJu7gchR6ridY8A8UdGqy+/fhLeH/MPzggfWZpEZr/9ea8qjuA0t2zlkzXZayokA2ue3urKrnO3EP9xDDrUb4HlUpiDCJCU/hlv8fgTeNfDGRsvI1zrVeh+OgN/hMV/cIGiRwTBE7GJeVfrGxjL0poom7oxe9uoh/2klUYvm+wu/AbqznNBAbqxxfQaKbm5yT+CgkznmtBgrbkITNz5FdqdSB/kk3Vf5pSOM95G6jo4xpGpAH0HljX6xQHUo/uC2unEu1IbiiDRIGOcM23mHUO2wavjzr19UpR5ASSCzMCoY/o+ioHsylQ1VLAUfGAqh0GW1/9JqhsYdCV8cK7ApaaLnysaKWQ1fNg7bS8sqGr42+91E16da69CMuktzD/1s/5WTz0iYK0uXCloAmdZ4IaU0ZDbCMA7nZKIlg+pBKTYSRQb24DEiFSADSNnBkrmIRbgIlw9WA8=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(39860400002)(346002)(136003)(376002)(451199015)(46966006)(40470700004)(36840700001)(82740400003)(5660300002)(186003)(26005)(7696005)(8936002)(8676002)(478600001)(83380400001)(82310400005)(2906002)(2616005)(40460700003)(54906003)(316002)(110136005)(1076003)(40480700001)(70206006)(336012)(81166007)(70586007)(356005)(4326008)(426003)(41300700001)(47076005)(36756003)(86362001)(36860700001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jan 2023 09:00:08.1421 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7cf94da2-f35a-480a-79d0-08daf3b23d29
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT016.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB5418
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Cc: Mastan.Katragadda@amd.com, Sunil-kumar.Dommati@amd.com,
 Basavaraj.Hiregoudar@amd.com,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 open list <linux-kernel@vger.kernel.org>, Mario.Limonciello@amd.com,
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>, arungopal.kondaveeti@amd.com,
 Sanyog Kale <sanyog.r.kale@intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Enable build for AMD soundwire master driver for AMD platforms.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 drivers/soundwire/Kconfig  | 9 +++++++++
 drivers/soundwire/Makefile | 4 ++++
 2 files changed, 13 insertions(+)

diff --git a/drivers/soundwire/Kconfig b/drivers/soundwire/Kconfig
index 2b7795233282..a597bb6c42fd 100644
--- a/drivers/soundwire/Kconfig
+++ b/drivers/soundwire/Kconfig
@@ -46,4 +46,13 @@ config SOUNDWIRE_QCOM
 config SOUNDWIRE_GENERIC_ALLOCATION
 	tristate
 
+config SOUNDWIRE_AMD
+	tristate "AMD Soundwire Master driver"
+	depends on ACPI && SND_SOC
+	help
+	  Soundwire AMD Master driver.
+	  If you have an AMD platform which has a Soundwire Master then
+	  enable this config option to get the Soundwire support for that
+	  device.
+
 endif
diff --git a/drivers/soundwire/Makefile b/drivers/soundwire/Makefile
index ca97414ada70..86ecae19eacd 100644
--- a/drivers/soundwire/Makefile
+++ b/drivers/soundwire/Makefile
@@ -26,3 +26,7 @@ obj-$(CONFIG_SOUNDWIRE_INTEL) += soundwire-intel.o
 #Qualcomm driver
 soundwire-qcom-y :=	qcom.o
 obj-$(CONFIG_SOUNDWIRE_QCOM) += soundwire-qcom.o
+
+#AMD driver
+soundwire-amd-y :=	amd_master.o
+obj-$(CONFIG_SOUNDWIRE_AMD) += soundwire-amd.o
-- 
2.34.1

