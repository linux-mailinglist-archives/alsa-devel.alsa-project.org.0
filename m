Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 31384F18FA
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Nov 2019 15:43:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CD5AF844;
	Wed,  6 Nov 2019 15:42:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CD5AF844
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573051415;
	bh=pvw0dD4b/5ESHRtESYiSSSnOzkWrBFsLptLqzx+EGsE=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Q3+4YX6Jbg/bGmSCt1BxkLxxnMsBeHau/70KrhVo4Bo4VgQRjqGLg+VWsW1ZuBueb
	 SxjSaOZ4sCEZbplIFNhvgTknC+7EHwm6QE0wlffGiIIib6R+VtPxz1zybHHR1MZO3t
	 OJk8mOJ9xKEhDjRb6Ng5BZQoMOW81Jg7nq5QEEUE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A0033F80678;
	Wed,  6 Nov 2019 15:39:04 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1064CF80677; Wed,  6 Nov 2019 15:39:02 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: ***
X-Spam-Status: No, score=3.5 required=5.0 tests=DATE_IN_FUTURE_12_24,
 DKIM_SIGNED,DKIM_VALID,FORGED_SPF_HELO,SPF_HELO_PASS,SPF_NONE,SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-eopbgr760081.outbound.protection.outlook.com [40.107.76.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A4272F8045F
 for <alsa-devel@alsa-project.org>; Wed,  6 Nov 2019 15:38:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A4272F8045F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amdcloud.onmicrosoft.com
 header.i=@amdcloud.onmicrosoft.com header.b="vqnF6Rji"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RdRY872VFb+0RfmVD0r1HHzi/m0jT/woCgo+2pj7VpBgkfIDOcC0Q8T54+r/E6xml2vCJEi6JELlg24EvjUr7OpJlxm8HOQSmIn3BOzj89RgcxG0lIvKWKmSQ86AdrrL368QrdDW9Xksj1iikzM3MIWKmw5WR1my5g0i6Yzv1WEbv2ke10IOkNI8nhWo+mT6b+SW+HwrZIJDEs8KamAXF6FlP/vdDeOglEuOEY6vTuTAY89fy3pEsP7je2DFAzfzSCzynTA7nNw8wWNZDLo+u/ioksTavrTKQ0nevid+/dIoNhCywgp/ktRA5lpO01Gz1RBFis13T/Bi4JwfJpC1fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0B/t1v2Z1NWhdEa0GLPIRGJsFm50+cqhiczf9o7Kvo4=;
 b=h2ydmLeuQFCs2b1AKLxxKV/5s9923MlXyTnC1MpJ5ivkk1ck5Yh0ZePyoCpbKjjDMdVgeu3L2GLHu2vnKs6nRdeenSRRRFpDMbsAnRImx1IWc4eJ6gZ/AkYLJn/B55uLYtNLQs+vT3SNTsGYFKkqZYr5+RfVKeyV2mnFVtixAmY7TaAArmd32KffN35NXI0vpUKkSN2gu76dXetK7f66kcoqxbph2mPDuZEsLkNmAwq3+ERvcV0S6q9T2NoEFFIKXe2C1pjG+VuF/gOYtEiKW6O+qwYKjhqRILf2B3WdFrMh0AOaTK5IaadADXY9oN+UI7vApgAuhObLamr0Sglceg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=google.com smtp.mailfrom=amd.com;
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0B/t1v2Z1NWhdEa0GLPIRGJsFm50+cqhiczf9o7Kvo4=;
 b=vqnF6Rji/1UDDMvmV8qWffOieyTAvs/YY7kOcIUbtFiu+iz4xZr8/nNtQHo573WuXa0BGM75Jrd4Gt8Cdn/Iu8q7LEAZMhhNQvffNc73e8yRoekTW/3c3VBecWAtQi97as0xKvwsqUYYrvzbiFgo5Qg894Q19FFI2/DatmNJYbk=
Received: from MWHPR12CA0047.namprd12.prod.outlook.com (2603:10b6:301:2::33)
 by CY4PR1201MB2486.namprd12.prod.outlook.com (2603:10b6:903:d6::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2430.20; Wed, 6 Nov
 2019 14:38:52 +0000
Received: from DM3NAM03FT024.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::206) by MWHPR12CA0047.outlook.office365.com
 (2603:10b6:301:2::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2430.22 via Frontend
 Transport; Wed, 6 Nov 2019 14:38:52 +0000
Authentication-Results: spf=none (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; google.com; dkim=none (message not signed)
 header.d=none;google.com; dmarc=permerror action=none header.from=amd.com;
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB01.amd.com (165.204.84.17) by
 DM3NAM03FT024.mail.protection.outlook.com (10.152.82.182) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.2430.20 via Frontend Transport; Wed, 6 Nov 2019 14:38:51 +0000
Received: from SATLEXMB02.amd.com (10.181.40.143) by SATLEXMB01.amd.com
 (10.181.40.142) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Wed, 6 Nov 2019
 08:38:51 -0600
Received: from vishnu-All-Series.amd.com (10.180.168.240) by
 SATLEXMB02.amd.com (10.181.40.143) with Microsoft SMTP Server id 15.1.1713.5
 via Frontend Transport; Wed, 6 Nov 2019 08:38:40 -0600
From: Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>
To: 
Date: Thu, 7 Nov 2019 20:06:04 +0530
Message-ID: <1573137364-5592-8-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1573137364-5592-1-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
References: <1573137364-5592-1-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(346002)(396003)(39860400002)(136003)(428003)(199004)(189003)(6666004)(4326008)(1671002)(76176011)(51416003)(7696005)(86362001)(14444005)(305945005)(26005)(48376002)(109986005)(356004)(50466002)(47776003)(186003)(36756003)(70586007)(70206006)(11346002)(446003)(8936002)(478600001)(316002)(126002)(476003)(2616005)(2906002)(50226002)(426003)(53416004)(81156014)(336012)(16586007)(81166006)(5660300002)(54906003)(486006)(8676002)(266003)(32563001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR1201MB2486; H:SATLEXMB01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6db894fe-0b41-4b1d-1ec8-08d762c70b16
X-MS-TrafficTypeDiagnostic: CY4PR1201MB2486:
X-Microsoft-Antispam-PRVS: <CY4PR1201MB2486C1688583DFC87AF4A6C5E7790@CY4PR1201MB2486.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3173;
X-Forefront-PRVS: 02135EB356
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qq0udayBe7hoAj94WJYufJOSLp9cKtHQY9AhovbqUpf7Zua3xZ1ldtxw2TCJfdBI7UUzvsXJ+exJpNEdhkWTh0PvuAF4VrNeCRKeWdNSx6qjeXOFoorby5X0iOySB/IlKtqbRzr29FETpW2cejfuDHNUez9p9jm+T6Ul9Xrmzv2NpXIV2UVpEICgWRC1wyUGJZ8jHX7saSzbVt1ePkiKw0TuYNQV3B6v6MY2zKTzqbcE2E2fncUc1LBLB+r/CW6RRgevbd8WdrWuu5ket3fwcCvbqofFuNSfukUbs9k8kPSonqY9KBh66+0nYnUKh2Z747KjLGyCZbwC1HulwWtNgZjRNAMYRi3wFtyMCxjE/ydCR8p1hXqBrICrsZqp/owwmCSa6dDAcyoXkuFaGMty7WkpIizQQxi6Ue6/PGnAg56zkLjAkQkLFY7WkHLQznww
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2019 14:38:51.9366 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6db894fe-0b41-4b1d-1ec8-08d762c70b16
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB2486
Cc: "moderated list:SOUND - SOC LAYER /
 DYNAMIC AUDIO POWER MANAGEM..." <alsa-devel@alsa-project.org>, Maruthi
 Srinivas Bayyavarapu <Maruthi.Bayyavarapu@amd.com>,
 open list <linux-kernel@vger.kernel.org>, Takashi
 Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Akshu.Agrawal@amd.com,
 Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>,
 Mark Brown <broonie@kernel.org>, djkurtz@google.com,
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Colin Ian King <colin.king@canonical.com>, Dan
 Carpenter <dan.carpenter@oracle.com>
Subject: [alsa-devel] [RESEND PATCH v2 7/7] ASoC: amd: Added ACP3x system
	resume and runtime pm ops
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

When system wide suspend happens, ACP will be powered off
and when system resumes,for audio usecase to continue,
all the runtime configuration data needs to be programmed again.
Added resume pm call back to ACP pm ops and
also Added runtime PM operations for ACP3x PCM platform device.
Device will enter into D3 state when there is no activity
on audio I2S lines.

Signed-off-by: Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>
---
 sound/soc/amd/raven/pci-acp3x.c | 47 ++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 46 insertions(+), 1 deletion(-)

diff --git a/sound/soc/amd/raven/pci-acp3x.c b/sound/soc/amd/raven/pci-acp3x.c
index 7727c9d..d567585 100644
--- a/sound/soc/amd/raven/pci-acp3x.c
+++ b/sound/soc/amd/raven/pci-acp3x.c
@@ -9,6 +9,9 @@
 #include <linux/io.h>
 #include <linux/platform_device.h>
 #include <linux/interrupt.h>
+#include <linux/pm_runtime.h>
+#include <linux/delay.h>
+#include <sound/pcm.h>
 
 #include "acp3x.h"
 
@@ -247,6 +250,11 @@ static int snd_acp3x_probe(struct pci_dev *pci,
 		}
 		break;
 	}
+	pm_runtime_set_autosuspend_delay(&pci->dev, 10000);
+	pm_runtime_use_autosuspend(&pci->dev);
+	pm_runtime_set_active(&pci->dev);
+	pm_runtime_put_noidle(&pci->dev);
+	pm_runtime_enable(&pci->dev);
 	return 0;
 
 unmap_mmio:
@@ -268,6 +276,39 @@ static int snd_acp3x_probe(struct pci_dev *pci,
 	return ret;
 }
 
+static int  snd_acp3x_suspend(struct device *dev)
+{
+	int status;
+	struct acp3x_dev_data *adata = dev_get_drvdata(dev);
+
+	status = acp3x_deinit(adata->acp3x_base);
+	if (status)
+		dev_err(dev, "ACP de-init failed\n");
+	else
+		dev_info(dev, "ACP de-initialized\n");
+
+	return 0;
+}
+static int  snd_acp3x_resume(struct device *dev)
+{
+	int status;
+	struct acp3x_dev_data *adata = dev_get_drvdata(dev);
+
+	status = acp3x_init(adata->acp3x_base);
+	if (status) {
+		dev_err(dev, "ACP init failed\n");
+		return status;
+	}
+
+	return 0;
+}
+
+static const struct dev_pm_ops acp3x_pm = {
+	.runtime_suspend = snd_acp3x_suspend,
+	.runtime_resume =  snd_acp3x_resume,
+	.resume =       snd_acp3x_resume,
+};
+
 static void snd_acp3x_remove(struct pci_dev *pci)
 {
 	int i, ret;
@@ -283,7 +324,8 @@ static void snd_acp3x_remove(struct pci_dev *pci)
 	else
 		dev_info(&pci->dev, "ACP de-initialized\n");
 	iounmap(adata->acp3x_base);
-
+	pm_runtime_disable(&pci->dev);
+	pm_runtime_get_noresume(&pci->dev);
 	pci_disable_msi(pci);
 	pci_release_regions(pci);
 	pci_disable_device(pci);
@@ -302,6 +344,9 @@ static struct pci_driver acp3x_driver  = {
 	.id_table = snd_acp3x_ids,
 	.probe = snd_acp3x_probe,
 	.remove = snd_acp3x_remove,
+	.driver = {
+		.pm = &acp3x_pm,
+	}
 };
 
 module_pci_driver(acp3x_driver);
-- 
2.7.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
