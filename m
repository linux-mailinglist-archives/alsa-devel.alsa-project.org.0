Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 67866BF3D2
	for <lists+alsa-devel@lfdr.de>; Thu, 26 Sep 2019 15:13:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DC5A91749;
	Thu, 26 Sep 2019 15:12:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DC5A91749
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1569503615;
	bh=0S60MhbV/13JGaFFMwtjSPNzWsVUvr8KCkJPtonJUYA=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AWcPoozFJcE+s1X5j/ZNzFBWDfKK8cQRbvcBuAShjS++V67keMV6TG03no6oQXi87
	 kCrE1jrwgjW1GuulN1j8LJ4lX9SymEzJ9m+jkZexkHLI9Nz4LXfZPWBd237Llh0jXP
	 p6AURuwcBlECwgkfgkBfcBoxjhrPmxqGrQt162MI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7C0FFF802BD;
	Thu, 26 Sep 2019 15:11:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1E3E4F80213; Thu, 26 Sep 2019 15:11:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=DATE_IN_FUTURE_06_12,
 DKIM_SIGNED,DKIM_VALID,FORGED_SPF_HELO,SPF_HELO_PASS,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750043.outbound.protection.outlook.com [40.107.75.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 785E6F80213
 for <alsa-devel@alsa-project.org>; Thu, 26 Sep 2019 15:11:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 785E6F80213
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amdcloud.onmicrosoft.com
 header.i=@amdcloud.onmicrosoft.com header.b="bW4IARLL"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jpr6xvFXFO1aV+ILyMcwaZL4w6dP7pWGA741KILg9XhuXXWKmZ4OR00wMco3kkF8XwWP8SAHgfkp89VCkpmJj5rbETsuQYzyWjvlyNtzq3qyRCWzZh3Ni5SnxJ55PZt8TcXg/kmqjzIlqcKb2EfY0OfSZU2PxM750Pa4zu9gMslzJG0I/5VOO+02AUwGwROjIs1rWLDNzj14pKInDNNphCHdlKlfk5Me80JTy7/r6t66BtCaJbXboMG6a6LNlaSui9er1J9d76GJX5kr6Xxw5CedOx/yXeDcS0rHZ+KS0o/Mj40eoebUcpMJlUWzDZhBj6zkcCquOiLnIyRog2OGFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+Pavt5LsdTFAkBN7Y81A+07Fyi+wAmHWIGN74pCm9dM=;
 b=fMqlseDfgBdgQIIToCNp6dm7Jn/prnXQYL4LpbByPPKAxI/hyzLIIEscDQMqZK3H11uePxH0sVFXunM71CRD9FPVwDcpaK8BcPFYZO3d7WnOgCeb+CDk0P9p1mBqwmndCQlFrN8LOtfjkA9x19/4g1SetIeGRILfP4/Cq5cVwKzeI/38sWzB7fhz/aUmTFGek+EATL9Ks5HWhT1QMfAnFya5d9G5977ADMP9cKkxxS1uC7L+iSPT9m7jgHYadwgZPc/numIYS7FD6l6BYdkhalz9VV9BDEu8EIxfj+Fn0jNzH5FelfyOleIQPaYi2wU/MrPpGL7R/adsRt6nLYY0lQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=oracle.com smtp.mailfrom=amd.com;
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+Pavt5LsdTFAkBN7Y81A+07Fyi+wAmHWIGN74pCm9dM=;
 b=bW4IARLL2UdOiKtpvd+yV0+HiCLJ9G7l5wCF/Tfipu62p/uGTnwIuFIGEPcffWS2lP9ylYrCRTcgxPIDMUAdX7PmwQ8KdxUmk1AkLOdm16wmWA9U8imzJzj8aaXZvL/nN476egi5p8Kw0hg76NXcSfatkAJaGfQktjOfx1pIRzI=
Received: from SN1PR12CA0078.namprd12.prod.outlook.com (2603:10b6:802:20::49)
 by MWHPR1201MB0014.namprd12.prod.outlook.com (2603:10b6:300:e7::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2284.25; Thu, 26 Sep
 2019 13:11:41 +0000
Received: from BY2NAM03FT026.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::208) by SN1PR12CA0078.outlook.office365.com
 (2603:10b6:802:20::49) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2178.16 via Frontend
 Transport; Thu, 26 Sep 2019 13:11:41 +0000
Authentication-Results: spf=none (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; oracle.com; dkim=none (message not signed)
 header.d=none;oracle.com; dmarc=permerror action=none header.from=amd.com;
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 BY2NAM03FT026.mail.protection.outlook.com (10.152.84.210) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2305.15 via Frontend Transport; Thu, 26 Sep 2019 13:11:40 +0000
Received: from vishnu-All-Series.amd.com (10.180.168.240) by
 SATLEXCHOV01.amd.com (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1; 
 Thu, 26 Sep 2019 08:11:39 -0500
From: Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>
To: 
Date: Fri, 27 Sep 2019 05:34:47 +0530
Message-ID: <1569542689-25512-1-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <Fix for missing initialization of IRQFLAGS.>
References: <Fix for missing initialization of IRQFLAGS.>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(376002)(346002)(39860400002)(136003)(428003)(199004)(189003)(86362001)(186003)(5660300002)(36756003)(50466002)(356004)(6666004)(316002)(81156014)(54906003)(109986005)(305945005)(8676002)(2906002)(16586007)(81166006)(53416004)(4326008)(486006)(2616005)(11346002)(50226002)(48376002)(8936002)(76176011)(7696005)(1671002)(51416003)(126002)(11926002)(476003)(70206006)(336012)(70586007)(426003)(446003)(47776003)(26005)(478600001)(266003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR1201MB0014; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ed66ccfd-dab3-4e17-7d34-08d742831210
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600167)(711020)(4605104)(1401327)(4618075)(2017052603328);
 SRVR:MWHPR1201MB0014; 
X-MS-TrafficTypeDiagnostic: MWHPR1201MB0014:
X-Microsoft-Antispam-PRVS: <MWHPR1201MB0014BFBA1F46FCE9ABE804DAE7860@MWHPR1201MB0014.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1247;
X-Forefront-PRVS: 0172F0EF77
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: t1Ayqpw61EwaD3Rs8547A5SMQZSO93ki3Q0KiyIgfXZg/HQOUhc8OR9YzDufLMaKKyLOg5lo2eU7ttsZXe5DNl+wJMWyjn7HpxwQ/DYlIzODcJvBWcrCS8hNHr2RCIYhS4OUomLc7PSmzPmx7bGGJ8QKF7rNwWNoraTkurldrdBNaIkv3clzEdlgMgeCH6ZnUPP8ImtuVX+QKsOW/8R6yszYOTRipPuR71mw+Yr1uSV3MzQvA/BFoUdLKRlwn7uUhDkSpOp4ceh2n5AZFJozSxrcWkn4QPY3F05Z2wqY0YRWH/CoQwR9UwwbGDNVEFcXb52xnvJ27t2BotXCZWO4vK62/YavpUFNeWDer2hVh/im1H8xSXiBgnhxvEKokNZKNzG8KA0vKZKKIuitELPqm1wB6/nscFmdkT2JGRZZ5uo=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2019 13:11:40.5842 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ed66ccfd-dab3-4e17-7d34-08d742831210
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1201MB0014
Cc: "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>,
 Maruthi Srinivas Bayyavarapu <Maruthi.Bayyavarapu@amd.com>,
 open list <linux-kernel@vger.kernel.org>, Takashi
 Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>,
 Mark Brown <broonie@kernel.org>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
 Alexander.Deucher@amd.com, Colin Ian King <colin.king@canonical.com>,
 Dan Carpenter <dan.carpenter@oracle.com>
Subject: [alsa-devel] [PATCH] ASoC: amd: Missing Initialization of IRQFLAGS
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

Fix for missing initialization of IRQFLAGS in
ACP-PCI driver and Missing Macro of ACP3x_DEVS.

Follow up to IDb33df346

Signed-off-by: Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>
---
 sound/soc/amd/raven/pci-acp3x.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/sound/soc/amd/raven/pci-acp3x.c b/sound/soc/amd/raven/pci-acp3x.c
index 627798a..3887ea0 100644
--- a/sound/soc/amd/raven/pci-acp3x.c
+++ b/sound/soc/amd/raven/pci-acp3x.c
@@ -219,7 +219,7 @@ static int snd_acp3x_probe(struct pci_dev *pci,
 				sizeof(struct resource) * 4,
 						GFP_KERNEL);
 		adata->cell = devm_kzalloc(&pci->dev,
-				sizeof(struct mfd_cell) * 3,
+				sizeof(struct mfd_cell) * ACP3x_DEVS,
 						GFP_KERNEL);
 		if (!adata->cell) {
 			ret = -ENOMEM;
@@ -260,6 +260,7 @@ static int snd_acp3x_probe(struct pci_dev *pci,
 		adata->res[3].flags	= IORESOURCE_IRQ;
 		adata->res[3].start	= pci->irq;
 		adata->res[3].end	= adata->res[3].start;
+		irqflags		= 0;
 
 		adata->acp3x_audio_mode	= ACP3x_I2S_MODE;
 
@@ -282,8 +283,9 @@ static int snd_acp3x_probe(struct pci_dev *pci,
 		adata->cell[2].platform_data	= &i2s_pdata[1];
 		adata->cell[2].pdata_size	=
 				sizeof(struct i2s_platform_data);
-		r = mfd_add_hotplug_devices(adata->parent, adata->cell,	3);
-		for (i = 0; i < 3 ; i++)
+		r = mfd_add_hotplug_devices(adata->parent, adata->cell,
+								ACP3x_DEVS);
+		for (i = 0; i < ACP3x_DEVS ; i++)
 			dev = get_mfd_cell_dev(adata->cell[i].name, i);
 		break;
 
-- 
2.7.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
