Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A9307BF2CB
	for <lists+alsa-devel@lfdr.de>; Thu, 26 Sep 2019 14:18:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 434E01732;
	Thu, 26 Sep 2019 14:18:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 434E01732
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1569500335;
	bh=L14estPOAj3sFWKjVBQPqZj74J7sqFj47aqTYQ0+C6c=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gx1w67MP9JZDqoNX1wHG9DtatgRzw4HmDr4mp9p6Z3TXt6nMn3YpGwq9eAkhpPI6+
	 eC5hG3yym+IReFbsGOxlQDsG6J/HIvzQKJ0Jtn3FT9aKUQda1k15+QjH4/F8HGhYIU
	 MQhOPEhPMQ/fRqs6Ayg0DsJd62mkLRENDL/wdjIk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 787D0F80638;
	Thu, 26 Sep 2019 14:16:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AC728F80636; Thu, 26 Sep 2019 14:15:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=DATE_IN_FUTURE_06_12,
 DKIM_SIGNED,DKIM_VALID,FORGED_SPF_HELO,SPF_HELO_PASS,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680085.outbound.protection.outlook.com [40.107.68.85])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9F821F80611
 for <alsa-devel@alsa-project.org>; Thu, 26 Sep 2019 14:15:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9F821F80611
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amdcloud.onmicrosoft.com
 header.i=@amdcloud.onmicrosoft.com header.b="NOugtNzt"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nPaGrH0bmaFZthsBBMJ9PkLlzh2bRW0ScjvviHCSozCc/1VuHRSpvEX9XWMlI7ZJr+ZWfDt6wu+tqHZlnR+VW6tYaMmpLFMVpgnOXiwJBOzhg8+oXYojBLOasQqPY5O3phTZ0pBYeW0wRzQJelk1IZh95WxOhj2sbSRZYiZAXqHR73evFnwmxze6P25dBQavW9k/8TZAzXSLcY7yWHCdG5Z2pgBlIISUj52cAwJO1JGsqMXeNetSYTIHih7AiayI+93eYCqVc5Aeh9JPVfZDdM+jLt71EYxLpxZvt3W+oYVnrfqyosUWgu+ADuqQ8gGnDuLg/homY9K9tVYN0dTUcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bmLMx+RJ2FmXEgKtHWLa8RaNbbU5BREok+jUONGdbMI=;
 b=IgTdnowpl6IKvyOqAt0wWex/d6MkjZbCEQrR4Q179lNDqN+hXdNN5OGxDwNtfbGQ0CmdOEvCjkUpMW7Qxr1ubwYXM5VaSlOWJW0hdJRtpSzsKQFvdfFleWixr6Vf2bd9SIB8bFaiLYj1Nh17ObRHnC3pnlJlgi200p4AKHLOrUy/rGnXZ4uS4Nb2hxJQTxLclIl+NuwxRiWffa0Pia8PPdAHOvHpANv1imxQ7xpzdBWrFgny+zRpjjciIvGgNr0rs+OuchBU49F2TY3BRCZlI5HHb6ZCKHIQV07zSfawqnBeePn4Gu54yRaUH2HCa4FaIX06jwVD8Nf9ZTgd6r8SPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=oracle.com smtp.mailfrom=amd.com;
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bmLMx+RJ2FmXEgKtHWLa8RaNbbU5BREok+jUONGdbMI=;
 b=NOugtNztORCwtL9jMvjHalgoNrrHw5LEnkmRtuY8HDzWhjQVxMU8XmWqbA4aQyodfc4GboBeEuH7TPLIMC3j3fsVNPuWtQ46gZPAOL1QE/SXV041vLWuz+LwslfsRYcGgGzanBfc+uLNy7sN34goaFQnO4joFNzl53TjhAztYMc=
Received: from MWHPR12CA0049.namprd12.prod.outlook.com (2603:10b6:300:103::11)
 by CY4PR12MB1192.namprd12.prod.outlook.com (2603:10b6:903:40::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2284.18; Thu, 26 Sep
 2019 12:15:47 +0000
Received: from CO1NAM03FT048.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::202) by MWHPR12CA0049.outlook.office365.com
 (2603:10b6:300:103::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2305.17 via Frontend
 Transport; Thu, 26 Sep 2019 12:15:47 +0000
Authentication-Results: spf=none (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; oracle.com; dkim=none (message not signed)
 header.d=none;oracle.com; dmarc=permerror action=none header.from=amd.com;
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 CO1NAM03FT048.mail.protection.outlook.com (10.152.81.49) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2305.15 via Frontend Transport; Thu, 26 Sep 2019 12:15:47 +0000
Received: from vishnu-All-Series.amd.com (10.180.168.240) by
 SATLEXCHOV01.amd.com (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1; 
 Thu, 26 Sep 2019 07:15:46 -0500
From: Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>
To: 
Date: Fri, 27 Sep 2019 04:37:38 +0530
Message-ID: <1569539290-756-4-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1569539290-756-1-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
References: <1569539290-756-1-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(376002)(136003)(396003)(346002)(428003)(199004)(189003)(14444005)(109986005)(316002)(16586007)(478600001)(54906003)(50466002)(486006)(186003)(70206006)(70586007)(48376002)(426003)(76176011)(126002)(1671002)(476003)(51416003)(7696005)(4326008)(11346002)(2616005)(336012)(305945005)(446003)(47776003)(2906002)(53416004)(26005)(36756003)(6666004)(8676002)(5660300002)(86362001)(356004)(8936002)(50226002)(81166006)(81156014)(266003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR12MB1192; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b940d308-489d-4faf-93db-08d7427b435b
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328);
 SRVR:CY4PR12MB1192; 
X-MS-TrafficTypeDiagnostic: CY4PR12MB1192:
X-Microsoft-Antispam-PRVS: <CY4PR12MB119266201C6F4EB9085BB244E7860@CY4PR12MB1192.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1850;
X-Forefront-PRVS: 0172F0EF77
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: h+iyQI9B83hStkJYaTvJM/nbAm+lHUGZ/Kg8W1pcTHu4lHju0qLYFFz3X65htQ9rvhOlxZVgyGJVMWjn5eYHmuyAwp1boDUm27G/5CnXXyGQ//M6q93zneVV9MP7/9wThFEKJ13pahKcA2Ly8SYlZvJKFPNE6AKRb8NaiWHnSg4/ACJacUWzPyOf8fejvy8WW+acgF6ezZNJEfNOEvshN22uJY2zoT0cnFa3tBf3kBwcms3TLmzEsW3cTP13mvJa1Pxs7879xGFuWw+Q3mULU7nhfloszrfgjmye7Hby6B57n8LepqDE30ZutPfbHNsTa8NhZShnz5p4qyoGcnFFdd4TE3USust9VpzKwPaeSttyUTiqfpCHnQd58PgHvvMM0VcvROYxiy1thQDYktEH/k7OdKi060DmqdoYJzftIXk=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2019 12:15:47.2728 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b940d308-489d-4faf-93db-08d7427b435b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1192
Cc: "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>,
 Maruthi Srinivas Bayyavarapu <Maruthi.Bayyavarapu@amd.com>,
 open list <linux-kernel@vger.kernel.org>, Takashi
 Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>,
 Mark Brown <broonie@kernel.org>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
 Alexander.Deucher@amd.com, Colin Ian King <colin.king@canonical.com>,
 Dan Carpenter <dan.carpenter@oracle.com>
Subject: [alsa-devel] [PATCH 4/5] ASoC: amd: added pmops for pci driver
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

Runtime powermanagement is added for PCI driver.
When there is no activity for at least 10 secs driver
suspends automatically.Runtime- Suspend and resume Stub functions
are added.

Signed-off-by: Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>
Reviewed-by: Vijendar Mukunda <vijendar.mukunda@amd.com>
---
 sound/soc/amd/raven/pci-acp3x.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/sound/soc/amd/raven/pci-acp3x.c b/sound/soc/amd/raven/pci-acp3x.c
index c0b8fad..6fbb720 100644
--- a/sound/soc/amd/raven/pci-acp3x.c
+++ b/sound/soc/amd/raven/pci-acp3x.c
@@ -170,6 +170,11 @@ static int snd_acp3x_probe(struct pci_dev *pci,
 		ret = -ENODEV;
 		goto unmap_mmio;
 	}
+	pm_runtime_set_autosuspend_delay(&pci->dev, 10000);
+	pm_runtime_use_autosuspend(&pci->dev);
+	pm_runtime_set_active(&pci->dev);
+	pm_runtime_put_noidle(&pci->dev);
+	pm_runtime_enable(&pci->dev);
 	return 0;
 
 unmap_mmio:
@@ -189,6 +194,23 @@ static int snd_acp3x_probe(struct pci_dev *pci,
 	return -ENODEV;
 }
 
+static int  snd_acp3x_suspend(struct device *dev)
+{
+	return 0;
+}
+
+static int  snd_acp3x_resume(struct device *dev)
+{
+	return 0;
+}
+
+static const struct dev_pm_ops acp3x_pm = {
+	.runtime_suspend = snd_acp3x_suspend,
+	.runtime_resume =  snd_acp3x_resume,
+	.resume	=	snd_acp3x_resume,
+
+};
+
 static void snd_acp3x_remove(struct pci_dev *pci)
 {
 	struct acp3x_dev_data *adata = pci_get_drvdata(pci);
@@ -196,6 +218,8 @@ static void snd_acp3x_remove(struct pci_dev *pci)
 	kfree(adata->res);
 	kfree(adata->cell);
 	iounmap(adata->acp3x_base);
+	pm_runtime_disable(&pci->dev);
+	pm_runtime_get_noresume(&pci->dev);
 	pci_disable_msi(pci);
 	pci_release_regions(pci);
 	pci_disable_device(pci);
@@ -214,6 +238,9 @@ static struct pci_driver acp3x_driver  = {
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
