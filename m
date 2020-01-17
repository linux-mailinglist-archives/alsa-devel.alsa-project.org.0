Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 30F3A14093F
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Jan 2020 12:48:53 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B0E8E17B1;
	Fri, 17 Jan 2020 12:48:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B0E8E17B1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1579261732;
	bh=WRNN7VAEEr+EyCjlLikcZClwSKMTRH7N1ktQxRIkluo=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Er2NPishm9o5EXz49ed4xcHht8QSZGd+rNhiHJbcJrX+5ZBn54B4A+row03FYVhem
	 zDKAS9SaHFknQmA8Lm/YHZZhw8WXEQ6EKwk62wb4k6PLNBTPHp8RjMrKED0GdnSF5L
	 cluh6S88kF8MiOL/t1EeqshBrMjWVxn4AskUEfmM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7889EF801F8;
	Fri, 17 Jan 2020 12:47:09 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9345FF801EB; Fri, 17 Jan 2020 12:47:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 FORGED_SPF_HELO,SPF_HELO_PASS,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2089.outbound.protection.outlook.com [40.107.236.89])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 62A08F80086
 for <alsa-devel@alsa-project.org>; Fri, 17 Jan 2020 12:46:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 62A08F80086
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amdcloud.onmicrosoft.com
 header.i=@amdcloud.onmicrosoft.com header.b="HNwHeQb0"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l/Ch4hyEb1sBNtPYJmLbMWo8yjay+SjvLFV9lg1AL9DK5bceAlMjWQ3SweWJ1XnbfzfkGx5tv0eWGxCnMSBJk/DzI8t3ZBTn8AOlypF7XNkKQ5d4nLuZqR+zSql9cno9tBUGsCgiuSTiOKg4aIHqVoW8MpvivW0DIq1+jlMrsnSn7JwYTkY4cpOKLqbcjORNzUlTzt8wjV4y5xLxodTDdwEpu/2Q89NpybkVI0uJPXA3dolx+BXR/uQcLU5Bf2xA3rAC0P3wkXT6UcvR2nxRK6+I5NYtrdB6Xbwoz+6bBvGGylkRTYUHxJ5VUniDDUR6ZiqRMrohnXv5sHrxhuyKHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5iqQ/4Q6bwrhoWYt/b5Ze+Roqw0ehTq7QeeoYd+GnyA=;
 b=CPbc42z0+R3ih8wL5JkWu3FMVSCDU5ZyVpClfTVcU9kJ43ZBqXL8cjqRTPH5Jq83lt6y9vD3J11Hq/MHUcKC6M/jFa0uHQzGYMPwNXh2c6SKKFHUhcgSKNGxUoKWDQ2brdk7Rd7kjcibgTqJSi/ieYERndvRMaomyVyGEAhYNaRcAmMPF8nmYpJM5O/AnBJXa1M96fnYahdcSO+hnuxGpJvag4HJb944+X20e82aEVeDnhEY4Axgo1ieUAr7gGPta21SftIHsAPdLJCYO4kWYDUS2ECZKLXLkWByfgomDX8rT0y6Fs2JIPFt+/5SVGaOMCmXiBGwQchab5tAcqOZZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com;
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5iqQ/4Q6bwrhoWYt/b5Ze+Roqw0ehTq7QeeoYd+GnyA=;
 b=HNwHeQb0czp16R6cyZfrCi/Jt2mxPL7LnOMKkB+RKuLdboPdtBEQQZRIYJ7JRsEycBQ+gltgkeZhQ84HSjOFLZ9AKTsFVeioK8BBiUCza9rFnFQQQ7u/eQ8r8HcV6TH8nn+klOIdnQTXlQvUja3QzVifAkpVyDMz2HOGUfmUNwM=
Received: from MN2PR12CA0028.namprd12.prod.outlook.com (2603:10b6:208:a8::41)
 by MN2PR12MB3294.namprd12.prod.outlook.com (2603:10b6:208:af::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2644.23; Fri, 17 Jan
 2020 11:46:56 +0000
Received: from BN8NAM11FT005.eop-nam11.prod.protection.outlook.com
 (2a01:111:f400:7eae::202) by MN2PR12CA0028.outlook.office365.com
 (2603:10b6:208:a8::41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2644.20 via Frontend
 Transport; Fri, 17 Jan 2020 11:46:56 +0000
Authentication-Results: spf=none (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=permerror action=none header.from=amd.com;
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB01.amd.com (165.204.84.17) by
 BN8NAM11FT005.mail.protection.outlook.com (10.13.176.69) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.2644.19 via Frontend Transport; Fri, 17 Jan 2020 11:46:55 +0000
Received: from SATLEXMB01.amd.com (10.181.40.142) by SATLEXMB01.amd.com
 (10.181.40.142) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Fri, 17 Jan
 2020 05:46:54 -0600
Received: from vishnu-All-Series.amd.com (10.180.168.240) by
 SATLEXMB01.amd.com (10.181.40.142) with Microsoft SMTP Server id 15.1.1713.5
 via Frontend Transport; Fri, 17 Jan 2020 05:46:51 -0600
From: Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>
To: 
Date: Fri, 17 Jan 2020 17:15:09 +0530
Message-ID: <1579261510-12580-1-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(346002)(376002)(396003)(136003)(428003)(199004)(189003)(5660300002)(36756003)(4326008)(186003)(86362001)(8936002)(8676002)(336012)(81156014)(316002)(478600001)(81166006)(2616005)(109986005)(426003)(70586007)(7696005)(54906003)(356004)(70206006)(6666004)(2906002)(26005)(266003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3294; H:SATLEXMB01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 45466748-0537-46e9-ea21-08d79b42f3c7
X-MS-TrafficTypeDiagnostic: MN2PR12MB3294:
X-Microsoft-Antispam-PRVS: <MN2PR12MB32948A0C64549136C66454D7E7310@MN2PR12MB3294.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:843;
X-Forefront-PRVS: 0285201563
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VRMwaUqs1Vx0KQ7v77RMEeiMy3OAZv/RBZv2vjFdIx3zMjjrFtmviywMkpaV4ehdVjfiUDl6BEYHFTcehKaVrgbGXK7PzUhsoSDPGRXIr+JF5ZsIca+/d5mDr6mwMc+w3xK9HX7GtlVwbee8FR+4XHLtfYP39haHkTGQErylYMnTMIOqbEuJ2kklH0k79KJ2NxCfMI1vIYUDT6Bstsp8hsLavrSJf4nUBzU0Q7nQIeiFUCYquBRhnq8gpsfQucOLwUtyV7zno8ynTuAqkGKM4IbAKNLPGJIB5JF3M7tqIJQRs0Np8HYNN6meqMK7dz0GNoMfNb/wtsQ3w7Iy+CaRTZiLjHZ/RxjCiZwINXUjB1de/cCGPl44SVaaubQBSY/HlfPwznDTgtN3YdsuHowuTuZgk33a3aW9bWkLaawU9dXzDzoz0Iqknw05nLlel10kiwct+nn7S6kS3Ncj0iNnAhacEjsifqjwhL6Sq297HWQ=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2020 11:46:55.5896 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 45466748-0537-46e9-ea21-08d79b42f3c7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3294
Cc: "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>, open list <linux-kernel@vger.kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Ravulapati Vishnu
 vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>, broonie@kernel.org,
 Alexander.Deucher@amd.com, Dan Carpenter <dan.carpenter@oracle.com>
Subject: [alsa-devel] [PATCH] ASoC: amd: Additional DAI for I2S SP instance.
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

I2S SP instance has separate BCLK and LRCLK for Tx and Rx.
Creating additional DAI for Rx.

Signed-off-by: Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>
---
 sound/soc/amd/raven/acp3x.h     | 2 +-
 sound/soc/amd/raven/pci-acp3x.c | 8 +++++++-
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/sound/soc/amd/raven/acp3x.h b/sound/soc/amd/raven/acp3x.h
index b6a80dc..21e7ac0 100644
--- a/sound/soc/amd/raven/acp3x.h
+++ b/sound/soc/amd/raven/acp3x.h
@@ -13,7 +13,7 @@
 #define TDM_ENABLE 1
 #define TDM_DISABLE 0
 
-#define ACP3x_DEVS		3
+#define ACP3x_DEVS		4
 #define ACP3x_PHY_BASE_ADDRESS 0x1240000
 #define	ACP3x_I2S_MODE	0
 #define	ACP3x_REG_START	0x1240000
diff --git a/sound/soc/amd/raven/pci-acp3x.c b/sound/soc/amd/raven/pci-acp3x.c
index 2f9f5290..65330bb 100644
--- a/sound/soc/amd/raven/pci-acp3x.c
+++ b/sound/soc/amd/raven/pci-acp3x.c
@@ -225,7 +225,13 @@ static int snd_acp3x_probe(struct pci_dev *pci,
 		pdevinfo[2].id = 1;
 		pdevinfo[2].parent = &pci->dev;
 		pdevinfo[2].num_res = 1;
-		pdevinfo[2].res = &adata->res[2];
+		pdevinfo[2].res = &adata->res[1];
+
+		pdevinfo[3].name = "acp3x_i2s_playcap";
+		pdevinfo[3].id = 2;
+		pdevinfo[3].parent = &pci->dev;
+		pdevinfo[3].num_res = 1;
+		pdevinfo[3].res = &adata->res[2];
 		for (i = 0; i < ACP3x_DEVS; i++) {
 			adata->pdev[i] =
 				platform_device_register_full(&pdevinfo[i]);
-- 
2.7.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
