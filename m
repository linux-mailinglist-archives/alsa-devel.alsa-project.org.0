Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 29FCF22CEEE
	for <lists+alsa-devel@lfdr.de>; Fri, 24 Jul 2020 21:57:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C10421694;
	Fri, 24 Jul 2020 21:56:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C10421694
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595620663;
	bh=20+h57pRPSWF+LESqTs/sDks+UrF1iSeRnHvY3K6uM4=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Hv34wmg7xxbGYVGuFzFbkFapOnuUaggVp72S1GLOB5wEHiUEocPtlnjDhaYaLT6k1
	 P1mCXsZG/M0DJtCH4jKgT+wTQwpd/cr3aNnwb5wAG+CzLDKe0rh17NBrUWphMSdQhf
	 okzrbCEJ5iCG+/pC/lrVs//C8psZF52Rq7jgSdlM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 86683F80150;
	Fri, 24 Jul 2020 21:56:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 24A41F8015A; Fri, 24 Jul 2020 21:56:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 FORGED_SPF_HELO,MSGID_FROM_MTA_HEADER,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2053.outbound.protection.outlook.com [40.107.237.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 49DA2F800CE
 for <alsa-devel@alsa-project.org>; Fri, 24 Jul 2020 21:56:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 49DA2F800CE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amdcloud.onmicrosoft.com
 header.i=@amdcloud.onmicrosoft.com header.b="KXljTslu"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n5uJU6KqO/dzqE+Mn7riBxERhWMQOjK3xyi+JkOYIfTNV1TnYd7xdOkfAws6c8GAvraLRnfJuC7qQ2zF0a3RbnxnVkudBGuhr4ACgsNA5X5pM8qmqK8YUvSqz7ORpeqs3IEQDsA4tD4W7jGs3YNwCDcHomJKSAzTAiRoSqftNxJDFaskAcxGguk7cjoft5p5MC6PrnR8+aUt2gFMrecQG4Lz2p7P2wn5F+Cetnv4W0VAxlqNL+gisa/obhNiAHxzcIfyVEfx1k9sYs31xPtrvLATi75meb3RdVBWEv4i9fpUTxAxpSsc4DyzCArUv30d8u4i1UfjTBDsd+O3rQhL4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NU/ius8UgfVJqWHtc7jqG+RWPsgHOQPKR/nQgqb0bM0=;
 b=Zl/ZctQst10Kd5H24AjxXLZI+7XkS8/3uYUFGK1nKuyHpayflPuP88iUIjkJCq7Fu1dDkvNEKCChqEo9a/NwM2Sldo8CUdseO/SyOKll4iHmUtW+1cthU+sPjmF4e1z1DFlx/ltk/sW8tOeyWg/CnETGUoNVwVmqKay6DQTEKq9q0CDWqUbkPVBkNFEu5FYRdSzwoK88Au3awt+38fLGzeySdCvWXp8vy5zaPcYpnN8Bdhqd/10EUGAGGAcTvw1FrsN48kw4o+KLwQoaTw8/iiI3mTty5wZELuTuTTj4f7bjGdMNoOcezTY+UE/wsTeqY/YUPJqwyHsKQKCe7/QfWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NU/ius8UgfVJqWHtc7jqG+RWPsgHOQPKR/nQgqb0bM0=;
 b=KXljTsluJScIBMxc/V+rEx9xG4Iyltndup8XJSNIhIN0gHVKEHSOEY46wWmhCy5Yz09YZp04t/IwhyItXh1zXzPrAMybEWrc+Nml78n0WiSIAERzdgVK/zefYdxLJFUW+D/bsCwcWfgHXZkfZL/5M+0qQ2CojD2YzuAOqhRrmok=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from MWHPR12MB1599.namprd12.prod.outlook.com (2603:10b6:301:10::12)
 by MWHPR12MB1599.namprd12.prod.outlook.com (2603:10b6:301:10::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.20; Fri, 24 Jul
 2020 19:56:26 +0000
Received: from MWHPR12MB1599.namprd12.prod.outlook.com
 ([fe80::bd05:e7bf:ce39:6f32]) by MWHPR12MB1599.namprd12.prod.outlook.com
 ([fe80::bd05:e7bf:ce39:6f32%3]) with mapi id 15.20.3216.026; Fri, 24 Jul 2020
 19:56:26 +0000
From: Akshu Agrawal <akshu.agrawal@amd.com>
To: 
Subject: [PATCH] ASoC: AMD: Restore PME_EN state at Power On
Date: Sat, 25 Jul 2020 01:25:52 +0530
Message-Id: <20200724195600.11798-1-akshu.agrawal@amd.com>
X-Mailer: git-send-email 2.20.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA1PR0101CA0043.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:22::29) To MWHPR12MB1599.namprd12.prod.outlook.com
 (2603:10b6:301:10::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from local.mshome.net (122.171.179.172) by
 MA1PR0101CA0043.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:22::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.22 via Frontend
 Transport; Fri, 24 Jul 2020 19:56:23 +0000
X-Mailer: git-send-email 2.20.1
X-Originating-IP: [122.171.179.172]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: e40922fd-46a6-4972-ef6a-08d8300ba5b4
X-MS-TrafficTypeDiagnostic: MWHPR12MB1599:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MWHPR12MB1599781B3DD109ADD56A25AFF8770@MWHPR12MB1599.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GO1Wxa7H2pS2rztiNr5JiAIlgnYE6s9LqGrRwXrPm13UUisPA0n+jIeNH7fXjJmkAni45TvNkljqTS57uGQ/F2+zZ6Xwn/Tzo0IHBHfzXvMoPAzuqJtlKJX+a4nUV4IgcHyIGnOZUWUYwydaOypqrThnaV7uFzgIZcdPtqHzgyJvpJDmxr0dtRQ3uqAAzzww/01m9v9qFAT6MtaakW/nF+9KxAvGK3VnoG7kb9sRq3SkmAAeYiem4afY8B1fUwQqkk30YrC4R17okrsdEu5G1aqeium2m751Wel7fBnGF5MpGAcmrpEeY0TxyVNtyaWFmCmBWElQ1aIb8ywgHyS/eO77JEDIzcTH+TXZSf5qEkBNJljj1z1LJRKNFx1Y2Bo4
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR12MB1599.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(376002)(346002)(136003)(366004)(396003)(39860400002)(5660300002)(44832011)(2616005)(956004)(6512007)(86362001)(2906002)(66476007)(66946007)(66556008)(316002)(6506007)(4326008)(16526019)(186003)(26005)(8676002)(54906003)(478600001)(8936002)(6666004)(52116002)(6486002)(83380400001)(109986005)(1076003)(36756003)(266003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: CFkGkaVVpcRIOMTrUDkTWvuvCNpGsqi6uvVFkDMDkhLigULTXvKGyq+hccm4PvLXH8ncsGZHqa8EVQhCeKz29mIL3vrOk4y8r0VSRbzhXnkpqEXTW6KnTEMSkxQu4N46JPpzC3s0a7a1d/Aww71CHx2D+jkysb1FxvWZ+J9+QpFtU0MtcUbb6o59jUk1CkWIUk6rVKn0Nu11NpkgpH5xMcaDl1uSjQtnFQBDcwSb8nBzTj/8mJgz9pY/4/mFYwWOSmMYmSq4LIqT9jmL/yU0jCBeUdwW1P5CvH5PuGu6l1q9df9Sy7Dcur/P5/OIkg2zF1M7qEfl1yzFhsdLA60ph8Bh2NFjiplZ/gmMRas1CXOzMEQKJGpKPV4+BgMb9s0vhVnvfdPwdPHZLheJ1nFXmtBWFbM4xEs8ycTVnczBnzeQLVdZDxYbrRkLxvVEdgvL4bdbsgQhqm9JFkkCasTShcDDPUvn58opl/OpdwJXTls=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e40922fd-46a6-4972-ef6a-08d8300ba5b4
X-MS-Exchange-CrossTenant-AuthSource: MWHPR12MB1599.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2020 19:56:25.8281 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9cnF7Ww4bx/U8CDsYA3tcJl7as4VJKK1+QbCN7Nt1Zq/XdjwFOGQ1NV7lYkWv2JzfLPw58v2lfpZuvlvu5jA2A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1599
Cc: "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>, Liam Girdwood <lgirdwood@gmail.com>,
 open list <linux-kernel@vger.kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Mark Brown <broonie@kernel.org>,
 Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>,
 akshu.agrawal@amd.com, Dan Carpenter <dan.carpenter@oracle.com>
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

PME_EN state needs to restored to the value set by fmw.
For the devices which are not using I2S wake event which gets
enabled by PME_EN bit, keeping PME_EN enabled burns considerable amount
of power as it blocks low power state.
For the devices using I2S wake event, PME_EN gets enabled in fmw and the
state should be maintained after ACP Power On.

Signed-off-by: Akshu Agrawal <akshu.agrawal@amd.com>
---
 sound/soc/amd/raven/pci-acp3x.c | 21 +++++++++++++--------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/sound/soc/amd/raven/pci-acp3x.c b/sound/soc/amd/raven/pci-acp3x.c
index ebf4388b6262..31b797c8bfe6 100644
--- a/sound/soc/amd/raven/pci-acp3x.c
+++ b/sound/soc/amd/raven/pci-acp3x.c
@@ -19,10 +19,12 @@ struct acp3x_dev_data {
 	bool acp3x_audio_mode;
 	struct resource *res;
 	struct platform_device *pdev[ACP3x_DEVS];
+	u32 pme_en;
 };
 
-static int acp3x_power_on(void __iomem *acp3x_base)
+static int acp3x_power_on(struct acp3x_dev_data *adata)
 {
+	void __iomem *acp3x_base = adata->acp3x_base;
 	u32 val;
 	int timeout;
 
@@ -39,10 +41,10 @@ static int acp3x_power_on(void __iomem *acp3x_base)
 	while (++timeout < 500) {
 		val = rv_readl(acp3x_base + mmACP_PGFSM_STATUS);
 		if (!val) {
-			/* Set PME_EN as after ACP power On,
-			 * PME_EN gets cleared
+			/* ACP power On clears PME_EN.
+			 * Restore the value to its prior state
 			 */
-			rv_writel(0x1, acp3x_base + mmACP_PME_EN);
+			rv_writel(adata->pme_en, acp3x_base + mmACP_PME_EN);
 			return 0;
 		}
 		udelay(1);
@@ -74,12 +76,13 @@ static int acp3x_reset(void __iomem *acp3x_base)
 	return -ETIMEDOUT;
 }
 
-static int acp3x_init(void __iomem *acp3x_base)
+static int acp3x_init(struct acp3x_dev_data *adata)
 {
+	void __iomem *acp3x_base = adata->acp3x_base;
 	int ret;
 
 	/* power on */
-	ret = acp3x_power_on(acp3x_base);
+	ret = acp3x_power_on(adata);
 	if (ret) {
 		pr_err("ACP3x power on failed\n");
 		return ret;
@@ -151,7 +154,9 @@ static int snd_acp3x_probe(struct pci_dev *pci,
 	}
 	pci_set_master(pci);
 	pci_set_drvdata(pci, adata);
-	ret = acp3x_init(adata->acp3x_base);
+	/* Save ACP_PME_EN state */
+	adata->pme_en = rv_readl(adata->acp3x_base + mmACP_PME_EN);
+	ret = acp3x_init(adata);
 	if (ret)
 		goto disable_msi;
 
@@ -274,7 +279,7 @@ static int snd_acp3x_resume(struct device *dev)
 	struct acp3x_dev_data *adata;
 
 	adata = dev_get_drvdata(dev);
-	ret = acp3x_init(adata->acp3x_base);
+	ret = acp3x_init(adata);
 	if (ret) {
 		dev_err(dev, "ACP init failed\n");
 		return ret;
-- 
2.20.1

