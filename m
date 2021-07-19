Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 52ED83CE518
	for <lists+alsa-devel@lfdr.de>; Mon, 19 Jul 2021 18:40:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CAEEB1681;
	Mon, 19 Jul 2021 18:39:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CAEEB1681
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626712815;
	bh=iy4xRVXga84oImz9jVdHrtkFLcRK5j9sgu/e92x2gbA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mO2R4+T6cPLZPBT+U+lnx0O1iM8fUZNsBHC6HVcFR3t/vROyKFGjAVmNhfrEEZizt
	 3DoKlAaflz32sct1iai6r1oUBOTsMRmxHBsfqZwVkSSlaafL0LS56HvzETPygBlCuE
	 rrpRsY1VJuP+GA6hf/W4Y6uvn5UDhu24jsK33J/Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D3991F804F3;
	Mon, 19 Jul 2021 18:37:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F3140F804F1; Mon, 19 Jul 2021 18:37:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2063.outbound.protection.outlook.com [40.107.236.63])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 08991F80227
 for <alsa-devel@alsa-project.org>; Mon, 19 Jul 2021 18:37:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 08991F80227
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com
 header.b="5OH0hhO3"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mCEi9WBwo4YR+8QTUOgHFDHKKfl3FtWbzi+mJl34HdtUCbM84LhtoF3dOer61xN1B3MU38YjpFW7icjdsGHiiLayWPlbO7Z2xcwSkHXBy2gAJPOwkaDp/jpabi/iv0Fvv6qukEIITc6ZmUl5aWNrCve2PsRtRrlK7JaP/dagmJUbVoHA9Od7ZhrntX/zaU1Ju+02+//Ll0EXcZgeZPZjCOAQ3bl5vHB5cTVgCl1sn1H0DW2C+M/BSRPOsVocT94IErDTDKKtGrXxqa8oe9a61SE1qD1AncPLBMjtpkywLSNOU1FTL4DEwfGv+XDtWtDpe/39nWwf+jiaiFzjKkpOTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=itoC+dU7JqRwv4JQILTVtQf6KRWj2ygEKdHZk2k/eoY=;
 b=REEBaP6yd/vbVL/nkml5r0IkliCI1TO9SkeZJZnic6ebvhOmTtRj2K04QZPAc1GEYj2xmaIM0X5nk8nwGbES1b0wESMQfmRE3Rn9a/ga5eNPG7BSeEqUZvNNPhSserMrigsxy4zo8qu8a/HG/l2UJJmK1qRucMrd9m0bl4OANpO00bXHxMohmg2L6fSk23KWieozFIvwAfzbiTbEGB99pkFPGUF1K4B0TscEoUp+Esw3OkdIU/07wOdjLzjV9ww3be6qwGs7l8en0SDgSoHXD6Ql+vNfThm7C5TkRa2p5RGsv0wjS3dIzNB6ufWYsvgAXVbSjC0zInscH0N+fC4JmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=itoC+dU7JqRwv4JQILTVtQf6KRWj2ygEKdHZk2k/eoY=;
 b=5OH0hhO3NAftOjqJzYOV4Xcpm3HoC4CC/ylXjkWIFMUJNGnX6TOtyvRSsrHhXetFy68iilA3uV1t4ZBloQWEGwQx29yNINYnFoXUtJ0Jd4m7b+aSaKEXTChXwdeYwuGQHrDIP1gSy89UlcrwF8vZEsegdSEy3appiyiBvEqWMjM=
Received: from DM5PR16CA0005.namprd16.prod.outlook.com (2603:10b6:3:c0::15) by
 DM6PR12MB3178.namprd12.prod.outlook.com (2603:10b6:5:18d::11) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4331.29; Mon, 19 Jul 2021 16:37:25 +0000
Received: from DM6NAM11FT037.eop-nam11.prod.protection.outlook.com
 (2603:10b6:3:c0:cafe::1c) by DM5PR16CA0005.outlook.office365.com
 (2603:10b6:3:c0::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21 via Frontend
 Transport; Mon, 19 Jul 2021 16:37:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT037.mail.protection.outlook.com (10.13.172.122) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4331.21 via Frontend Transport; Mon, 19 Jul 2021 16:37:25 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Mon, 19 Jul
 2021 11:37:24 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Mon, 19 Jul
 2021 11:37:24 -0500
Received: from LinuxHost.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2242.4 via Frontend
 Transport; Mon, 19 Jul 2021 11:37:15 -0500
From: Vijendar Mukunda <vijendar.mukunda@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
Subject: [PATCH V3 12/12] ASoC: amd: enable vangogh acp5x driver build
Date: Mon, 19 Jul 2021 22:21:40 +0530
Message-ID: <20210719165140.16143-13-vijendar.mukunda@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210719165140.16143-1-vijendar.mukunda@amd.com>
References: <20210719165140.16143-1-vijendar.mukunda@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fc8681c0-2373-4ad9-2e33-08d94ad37d80
X-MS-TrafficTypeDiagnostic: DM6PR12MB3178:
X-Microsoft-Antispam-PRVS: <DM6PR12MB31789A45BBB2126A79E55D7397E19@DM6PR12MB3178.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: j6vrcZ68Tv3xz24aNPCZnEYTiNuIej5sW9Z1pXeMX57gBOX3JG2k0sWI2X/qt+nSWWXBlGiUfJgUb+mSW3/LMMrFIsoIAiJyi+qpTiZkIDv/5dA1eCs8yBHFtos5HMygZxR5bYU9Db5oNU44dUcKAjFrgSN4krkBpMqLLN7yg2WpkgPBNWa9sL/HjjvP/8tbEuH+VVOiZlY9Dvolngbw/56l0f+GxzPy1BD/uc+wKeT71/AHzkDqP/Ln3w+8TwM2xiC7rVYoEqfPnGu/MLJzIfIJYD1Fkk/NUFbrt0PgLR+d4DXbUIcnP2UP3DSxqWUU3ytwJ4oCw0CVv36Ji/eTk5TEIW1H0yJyUDTaMOZRjIwIEKfP3Ovwk3MRLFzrNM9YfkTiROqY6luaWz9eBv4frK4XMCIbuzE1GWQCwsoi8rYoWWRx3YA1cbjyG6ar5bA2A0ObOusjg3g0efhiBGe2WxP3lKNa0dE81LxGmZVegr2KGsOnwZWD3gM67FIN0PRAqVUB+rTkX0C/qRp+Na0E7L7oquJqubnXLLeZ1dI/Aw4B2QXNNaqG9F5Pp5uNDVo5+4YcXx6jMmK+Y+09pTAm7/E6n8kVwt9vsLgiOt9UIbMJ0uGmwkGXKTB0GWAJ8miTu9eljihebJI3dCnBOHXdIXfq7JFMUN45yH5fgQaNqn4fLjNk6nJl+ik5JHz1mvZD7sx24peSNzyBq3wGu81RNcT9xatrlHLSbrJK+i5QX/wSmgfNQUyYE8Mp7LEV7TDCNPvXR3MIwhqszdB+F9wPjQtPUA9SMCSmNAxGHKq133Q=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(136003)(346002)(39860400002)(396003)(376002)(36840700001)(46966006)(336012)(70206006)(186003)(70586007)(6666004)(86362001)(478600001)(7696005)(81166007)(356005)(54906003)(47076005)(26005)(110136005)(2616005)(36860700001)(5660300002)(36756003)(426003)(316002)(2906002)(1076003)(82740400003)(82310400003)(4326008)(8936002)(8676002)(44832011)(42413003)(32563001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2021 16:37:25.2493 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fc8681c0-2373-4ad9-2e33-08d94ad37d80
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT037.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3178
Cc: Sunil-kumar.Dommati@amd.com, open list <linux-kernel@vger.kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>,
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>, Alexander.Deucher@amd.com,
 krisman@collabora.com
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Vangogh ACP5x drivers can be built by selecting necessary
kernel config option.
The patch enables build support of the same.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 sound/soc/amd/Kconfig          | 9 +++++++++
 sound/soc/amd/Makefile         | 1 +
 sound/soc/amd/vangogh/Makefile | 9 +++++++++
 3 files changed, 19 insertions(+)
 create mode 100644 sound/soc/amd/vangogh/Makefile

diff --git a/sound/soc/amd/Kconfig b/sound/soc/amd/Kconfig
index ba5a85bf7412..cc48d4e5b080 100644
--- a/sound/soc/amd/Kconfig
+++ b/sound/soc/amd/Kconfig
@@ -52,3 +52,12 @@ config SND_SOC_AMD_RENOIR_MACH
 	depends on SND_SOC_AMD_RENOIR
 	help
 	 This option enables machine driver for DMIC
+
+config SND_SOC_AMD_ACP5x
+	tristate "AMD Audio Coprocessor-v5.x I2S support"
+	depends on X86 && PCI
+	help
+	 This option enables ACP v5.x support on AMD platform
+
+	 By enabling this flag build will trigger for ACP PCI driver,
+	 ACP DMA drvier, CPU DAI driver.
diff --git a/sound/soc/amd/Makefile b/sound/soc/amd/Makefile
index e6df2f72a2a1..07150d26f315 100644
--- a/sound/soc/amd/Makefile
+++ b/sound/soc/amd/Makefile
@@ -10,3 +10,4 @@ obj-$(CONFIG_SND_SOC_AMD_CZ_RT5645_MACH) += snd-soc-acp-rt5645-mach.o
 obj-$(CONFIG_SND_SOC_AMD_ACP3x) += raven/
 obj-$(CONFIG_SND_SOC_AMD_RV_RT5682_MACH) += snd-soc-acp-rt5682-mach.o
 obj-$(CONFIG_SND_SOC_AMD_RENOIR) += renoir/
+obj-$(CONFIG_SND_SOC_AMD_ACP5x) += vangogh/
diff --git a/sound/soc/amd/vangogh/Makefile b/sound/soc/amd/vangogh/Makefile
new file mode 100644
index 000000000000..3353f93dc610
--- /dev/null
+++ b/sound/soc/amd/vangogh/Makefile
@@ -0,0 +1,9 @@
+# SPDX-License-Identifier: GPL-2.0+
+# Vangogh platform Support
+snd-pci-acp5x-objs	:= pci-acp5x.o
+snd-acp5x-i2s-objs	:= acp5x-i2s.o
+snd-acp5x-pcm-dma-objs	:= acp5x-pcm-dma.o
+
+obj-$(CONFIG_SND_SOC_AMD_ACP5x) += snd-pci-acp5x.o
+obj-$(CONFIG_SND_SOC_AMD_ACP5x)	+= snd-acp5x-i2s.o
+obj-$(CONFIG_SND_SOC_AMD_ACP5x) += snd-acp5x-pcm-dma.o
-- 
2.17.1

