Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C4053D1586
	for <lists+alsa-devel@lfdr.de>; Wed, 21 Jul 2021 19:52:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A8282172C;
	Wed, 21 Jul 2021 19:51:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A8282172C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626889935;
	bh=2/jYP/VwaGQur/IsZf0GNSzhD7rbO0Xz2ph2fMu6ufI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bqCYD1c5gZkZa7pf6dgTE2ATIP1EaD4F9MMyXus0xu3M2YifRPs3CA/XeOnANicBJ
	 tR6PYF1wk5nXXduq2sqxngmV2Kp4GGU6JDI8IKXLIsDFZ11JAjzJJBFNZcSRN+uE55
	 dz2WatV/96gK7N4fe33EwXM46D7B2Ln7l1tY3Ru8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 32632F80516;
	Wed, 21 Jul 2021 19:49:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DF3E1F804CF; Wed, 21 Jul 2021 19:49:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2061.outbound.protection.outlook.com [40.107.220.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 364E8F804F2
 for <alsa-devel@alsa-project.org>; Wed, 21 Jul 2021 19:49:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 364E8F804F2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com
 header.b="LWcXveUY"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Zmo2DuWYiyc8GfHPT77PfubEAtCwUZtFkAirQ5K/1O3bnFjkpYA6slnh+mf+mNsNFNsPGRuNhKgFnSrSXXj9GmruwiPdsH28zJNqHEmdbcxu0iVJZtDhcUOtul0p2OjSBYA6ZseSW5wykToD0+FA31Di3RYhjmrnFzvlwa++fbeC3yLKJ+aZUDQJjq72eL33i4/ryBzNx05ft+GhUa+v+TzHhzYBaf9XoXB2Y8FYGnNmmvvz0Wg6mtF2FIRenBXeGSYPjToRpDKEacMbW6a4l/NI9j7t4dP7xvHNDpkc9IYF+AAKjgz6kKtMYUPV73/J2oZj1KvO+0+dAZVlA4J2Lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NNJCR6HTaZ0bU3oTKBP+eXA3vps0kfto7iXPjo55Qb4=;
 b=VDq+E7w+OOvJf/NcRgFX8nm61dZVwDA0N15TY4uFS3VPRUj/sFVZ0h9prj4JMGk4rs9VGppHtfUcYQnPm+aTIvaxqViceY9dTG2TR1j+5aeWQ2MQyX/QTiqSy4mWUcjBpACAlD1HNNACAeFanPEerpE3HScoNG+2/k1IUU3axP0ngZ1+eyyfN1N3+3Y34nocWKdPqmoREsbwB/apQFNZmcTcFvT1QvBr0dBuv00V8bEc6ykthKL/8AzOCrFVZ0tfo+hNHivPSGj2JrD55y4Cm8dQ8xxqBLlKJCp69vEpIa94dQ1wYWhoKva8LYZQx4tA+itAA+Ol01akx37tmLFC8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NNJCR6HTaZ0bU3oTKBP+eXA3vps0kfto7iXPjo55Qb4=;
 b=LWcXveUYgO163PEgQJfd+dFu6VMH9zaJOWe6/cSnYkXRWTVxBdSGtE7TNy/DlGMG29GX+oU5T943O6EQrYeB6DUVbv02alpqBa3o1Dmi5JVyEkO5GWYQ8VBJa8uxpNByaZVo0YgKqmMWpu52yyZerv1VUmR+FnMmtY3Ddyxem0c=
Received: from BN6PR20CA0058.namprd20.prod.outlook.com (2603:10b6:404:151::20)
 by CO6PR12MB5457.namprd12.prod.outlook.com (2603:10b6:5:355::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.22; Wed, 21 Jul
 2021 17:49:16 +0000
Received: from BN8NAM11FT016.eop-nam11.prod.protection.outlook.com
 (2603:10b6:404:151:cafe::7f) by BN6PR20CA0058.outlook.office365.com
 (2603:10b6:404:151::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.25 via Frontend
 Transport; Wed, 21 Jul 2021 17:49:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT016.mail.protection.outlook.com (10.13.176.97) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4352.24 via Frontend Transport; Wed, 21 Jul 2021 17:49:16 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Wed, 21 Jul
 2021 12:49:15 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Wed, 21 Jul
 2021 12:49:15 -0500
Received: from LinuxHost.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2242.4 via Frontend
 Transport; Wed, 21 Jul 2021 12:49:11 -0500
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
Subject: [PATCH v5 10/12] ASoC: amd: add vangogh pci driver pm ops
Date: Wed, 21 Jul 2021 23:34:26 +0530
Message-ID: <20210721180430.11571-11-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210721180430.11571-1-Vijendar.Mukunda@amd.com>
References: <20210721180430.11571-1-Vijendar.Mukunda@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ff8d7d91-2575-4c36-9d41-08d94c6fdbd6
X-MS-TrafficTypeDiagnostic: CO6PR12MB5457:
X-Microsoft-Antispam-PRVS: <CO6PR12MB54578BED675FEE68CD55259697E39@CO6PR12MB5457.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:346;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: z5UXqAovm+TIEtJb25L6uJlWKfHAIx3U8AZyi3xh4nV0umaUZShJdlSTvJOZn8A1yakp3bzkSoWsbssI0lPRtUTngWAmEISbtqrL/0zhPr2faNkTfjivs8bkz1YLK5ERIRln/kGQGVZoqYEahPCvY8L4NDkjhIF4HU3B23MyGTWJwZ1RZnquQBjs5H0G/RxIEr3Y3aApYs4s3qzB2IqQqMsSQb6CbFX6FDhtkf0GafI5dBzUpXZU3/HfJwP5UVa47U7spcnVEqtccMrQzvPXjwsnbSlsDtmplMz1lRp0OPINHwPiIFnIrNxON79kirw4HE6ug1O+12I9B4cEUNQIvSgkPyTPJh87szcx4FNLuM51mh75Da2EqsB3WyDhYjFE5r/fJ/y5prKy9CiKespZZfX5BdrFfJJ4tcpMdTb9AlF6Aj+5fSPvFamrTjbZev37W8h1w6R/fop86AvOxtlZspmGQ46XwXfaJSi+MnGox+EozUa6gW/Wy5Ot3yevoQYWp0VUkVKbkY4gs/fsOD7FmUNz73U27yQlackZDVvZANTywo0w2PxTE2ovbJrl/OFRfmp99XD2cSwFj6Hud7Py6h1BVHcmzGzeB5BL5ZDR91wbLtwbkhzmM2gGx7bD7BVkUmqPGqoIyt7CY0LpFcuFSZ8urFhnOB2R/opG2KweL1FIIh0WxjSVwWRleOrlirnTpH6L2mVcmc5aGbuhqN8x8dYJmUQqjADu0ZHhWtPzVFg=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(346002)(376002)(39860400002)(396003)(136003)(46966006)(36840700001)(356005)(83380400001)(86362001)(8936002)(70586007)(70206006)(82310400003)(82740400003)(81166007)(8676002)(2906002)(4326008)(36860700001)(6666004)(110136005)(36756003)(1076003)(2616005)(54906003)(47076005)(478600001)(426003)(336012)(7696005)(26005)(5660300002)(186003)(316002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2021 17:49:16.2462 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ff8d7d91-2575-4c36-9d41-08d94c6fdbd6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT016.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR12MB5457
Cc: Sunil-kumar.Dommati@amd.com, open list <linux-kernel@vger.kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 pierre-louis.bossart@linux.intel.com,
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

Add Vangogh acp pci driver pm ops.

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 sound/soc/amd/vangogh/pci-acp5x.c | 45 +++++++++++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/sound/soc/amd/vangogh/pci-acp5x.c b/sound/soc/amd/vangogh/pci-acp5x.c
index 25b42a37ad3a..a57b762d9f2e 100644
--- a/sound/soc/amd/vangogh/pci-acp5x.c
+++ b/sound/soc/amd/vangogh/pci-acp5x.c
@@ -10,6 +10,7 @@
 #include <linux/delay.h>
 #include <linux/platform_device.h>
 #include <linux/interrupt.h>
+#include <linux/pm_runtime.h>
 
 #include "acp5x.h"
 
@@ -226,6 +227,10 @@ static int snd_acp5x_probe(struct pci_dev *pci,
 	default:
 		dev_info(&pci->dev, "ACP audio mode : %d\n", val);
 	}
+	pm_runtime_set_autosuspend_delay(&pci->dev, 2000);
+	pm_runtime_use_autosuspend(&pci->dev);
+	pm_runtime_put_noidle(&pci->dev);
+	pm_runtime_allow(&pci->dev);
 	return 0;
 
 unregister_devs:
@@ -242,6 +247,41 @@ static int snd_acp5x_probe(struct pci_dev *pci,
 	return ret;
 }
 
+static int __maybe_unused snd_acp5x_suspend(struct device *dev)
+{
+	int ret;
+	struct acp5x_dev_data *adata;
+
+	adata = dev_get_drvdata(dev);
+	ret = acp5x_deinit(adata->acp5x_base);
+	if (ret)
+		dev_err(dev, "ACP de-init failed\n");
+	else
+		dev_dbg(dev, "ACP de-initialized\n");
+
+	return ret;
+}
+
+static int __maybe_unused snd_acp5x_resume(struct device *dev)
+{
+	int ret;
+	struct acp5x_dev_data *adata;
+
+	adata = dev_get_drvdata(dev);
+	ret = acp5x_init(adata->acp5x_base);
+	if (ret) {
+		dev_err(dev, "ACP init failed\n");
+		return ret;
+	}
+	return 0;
+}
+
+static const struct dev_pm_ops acp5x_pm = {
+	SET_RUNTIME_PM_OPS(snd_acp5x_suspend,
+			   snd_acp5x_resume, NULL)
+	SET_SYSTEM_SLEEP_PM_OPS(snd_acp5x_suspend, snd_acp5x_resume)
+};
+
 static void snd_acp5x_remove(struct pci_dev *pci)
 {
 	struct acp5x_dev_data *adata;
@@ -255,6 +295,8 @@ static void snd_acp5x_remove(struct pci_dev *pci)
 	ret = acp5x_deinit(adata->acp5x_base);
 	if (ret)
 		dev_err(&pci->dev, "ACP de-init failed\n");
+	pm_runtime_forbid(&pci->dev);
+	pm_runtime_get_noresume(&pci->dev);
 	pci_release_regions(pci);
 	pci_disable_device(pci);
 }
@@ -272,6 +314,9 @@ static struct pci_driver acp5x_driver  = {
 	.id_table = snd_acp5x_ids,
 	.probe = snd_acp5x_probe,
 	.remove = snd_acp5x_remove,
+	.driver = {
+		.pm = &acp5x_pm,
+	}
 };
 
 module_pci_driver(acp5x_driver);
-- 
2.17.1

