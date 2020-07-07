Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 16CBB21769F
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Jul 2020 20:25:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9FFEE823;
	Tue,  7 Jul 2020 20:24:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9FFEE823
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594146317;
	bh=dpkLS/spRRHH6S+XScisrWJnoYBiHBOzGK3XVVOKKgs=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=siyI5GMPQZ+a5MMAVyOz8kdf8IaLuFFYaR/Gcb475hKohfCmZOd3OqO/K4/pmE5AW
	 k1ZljkLS537bfpyyp97GMxP2R/K5f1mr/NNhbeKo3fEAlZakfWg3gGyOqpMtEDeqrU
	 eEnUZ2D6mXnyo54j+OliAGJ9dsgADSj+cnb3EUy8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C2014F8011F;
	Tue,  7 Jul 2020 20:23:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CA358F80216; Tue,  7 Jul 2020 20:23:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 FORGED_SPF_HELO,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2050.outbound.protection.outlook.com [40.107.244.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 89292F8011F
 for <alsa-devel@alsa-project.org>; Tue,  7 Jul 2020 20:23:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 89292F8011F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amdcloud.onmicrosoft.com
 header.i=@amdcloud.onmicrosoft.com header.b="BzY6t4LZ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=es03veLVFg48Z9+iDAaDW2BOPqfipCtGj49inSKgjemh7XzBfDwinmy2pE6KdfNWZ7rzsNEOj/+FUHde5am+uFJE0kj0puHCuFq1k7WTNyT/XZ0vi2pZGleRtL3oYiUzthgLGBYg1brAp2ol/n9W8yfieqW/qKqIzl9QycqmzdP2Ba7LNbyuaN/v+1dUvO14aAaIFRBFmDVFLxjrkGBQJmSv2MtuMRLt1DeJzL1uIjBgY3BZ/CJhSTNe7rU0h+eECBL4b8X9g12cBsUW0notedU1Hq2ngQMJwj/lCqtcs+NZgL6lsZS/zQcLxzVCO+5IjMASfBGZLSRCGlBsetzLNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2F94W99POqoQSBmxK42um2mHvH+G1yyWqOlK2h/KgV8=;
 b=PEwsf+288xE45OJ6fyEXqoMZSEK1DyAvz76gXjweHMh/qwxmkoxAL6+IIxfUUhrwhS5G8EYRBpb9oNK2TyIPCLGRukxhA9emQIPkuL95NOji+DZGfET1WLiQXHPheF+xWMD24tVpDCJE5Q2RmIZjf5sIZcG8yt3SYyAaLY5w83wiq3T2t15NE9B0y7N0fHRG+7Eu3nqcD3tNTgUxJzG8I0zW3ev84n8TW17Vj/NKXBA40YmNqIPpbAhXZBG9eomiJTaSrk21TuMZ+Lt8OSMDbbZ5aLd91O+HX8tojdA3OwKaf4Bw62Xq9RZXjfudAAnIIBlDH1l05DLv782KotS2/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=alsa-project.org smtp.mailfrom=amd.com;
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2F94W99POqoQSBmxK42um2mHvH+G1yyWqOlK2h/KgV8=;
 b=BzY6t4LZA7///dCq2kH8nii9tZ96X8m5F/pGmlwetvoo0AH6eTHRfWvoP2337WYRhKuFVWWxYmvDOG8eoLBWubrxf45ATO4dD0CKniN0HlPgA3NZRlzAj10YSSBYWOaD8ON+3guEWLeHGLenqbuePUqNTuB1UqDqwCfBh52VbQs=
Received: from DM5PR22CA0022.namprd22.prod.outlook.com (2603:10b6:3:101::32)
 by MWHPR12MB1614.namprd12.prod.outlook.com (2603:10b6:301:f::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.28; Tue, 7 Jul
 2020 18:23:23 +0000
Received: from DM6NAM11FT066.eop-nam11.prod.protection.outlook.com
 (2603:10b6:3:101:cafe::b2) by DM5PR22CA0022.outlook.office365.com
 (2603:10b6:3:101::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.23 via Frontend
 Transport; Tue, 7 Jul 2020 18:23:22 +0000
X-MS-Exchange-Authentication-Results: spf=none (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; alsa-project.org; dkim=none (message not signed)
 header.d=none;alsa-project.org; dmarc=permerror action=none
 header.from=amd.com;
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB01.amd.com (165.204.84.17) by
 DM6NAM11FT066.mail.protection.outlook.com (10.13.173.179) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3153.24 via Frontend Transport; Tue, 7 Jul 2020 18:23:21 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB01.amd.com
 (10.181.40.142) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Tue, 7 Jul 2020
 13:23:19 -0500
Received: from SATLEXMB01.amd.com (10.181.40.142) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Tue, 7 Jul 2020
 13:23:19 -0500
Received: from LinuxHost.amd.com (10.180.168.240) by SATLEXMB01.amd.com
 (10.181.40.142) with Microsoft SMTP Server id 15.1.1713.5 via Frontend
 Transport; Tue, 7 Jul 2020 13:23:16 -0500
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <alsa-devel@alsa-project.org>
Subject: [PATCH] ASoC: amd: fixed kernel warnings
Date: Wed, 8 Jul 2020 00:07:11 +0530
Message-ID: <1594147044-25582-1-git-send-email-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SATLEXMB01.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFTY:;
 SFS:(4636009)(346002)(136003)(396003)(376002)(39860400002)(46966005)(5660300002)(186003)(356005)(6666004)(82310400002)(478600001)(82740400003)(81166007)(47076004)(26005)(2906002)(4326008)(6916009)(83380400001)(426003)(8676002)(8936002)(36756003)(86362001)(4744005)(70206006)(2616005)(336012)(316002)(7696005)(54906003)(70586007);
 DIR:OUT; SFP:1101; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3640dbaf-ee1a-4685-3b4f-08d822a2d49a
X-MS-TrafficTypeDiagnostic: MWHPR12MB1614:
X-Microsoft-Antispam-PRVS: <MWHPR12MB161447DED69A1552CE6B9D8997660@MWHPR12MB1614.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:346;
X-Forefront-PRVS: 0457F11EAF
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: S6F3wRXBzutg6xYg1OSf834ekw51tKIpFRYwgQxNjZB3eEyciPrNhaFFAM7hjlWpq2p4b6mtwV59+JsqYZbrYU5C1tIC1Q5ZDP6Zr2dS1EzpOJMkmj2ccbf8JpRWDVW8RSHWse7VjWnZtxvLIaWFMtqD0DsY3+zOHYc40Zpd84+oSZSF9GxwfBQIxGc6usSEjOJLKCJ3LGokZ3IsTt7RusPGn9mFkFxmTvyg+NcUCfEUVHiwiv4ADw5XX4ktiQedcEQsEfIYzDa5xsh9p8AjbNcnPcFuklM+Vogdx5b2+E5/bPPmyLtBLvoTkOaVPAqARTYEqnt1iaBPTg1wmMvMUDE0Rvmq6Qg+pH0s1bIOOwTor3YBNJFa1XCnUzLaZ3ZWHF5gO+dNhmUboxz94hCzRA==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2020 18:23:21.9019 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3640dbaf-ee1a-4685-3b4f-08d822a2d49a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB01.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT066.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1614
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 open list <linux-kernel@vger.kernel.org>, rdunlap@infradead.org,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>, Alexander.Deucher@amd.com,
 Takashi Iwai <tiwai@suse.com>
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

This patch will fix unused variables kernel warnings when
CONFIG_ACPI is disabled.

Reported-by: Randy Dunlap <rdunlap@infradead.org>
Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 sound/soc/amd/renoir/rn-pci-acp3x.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/amd/renoir/rn-pci-acp3x.c b/sound/soc/amd/renoir/rn-pci-acp3x.c
index 165c93f..b943e59 100644
--- a/sound/soc/amd/renoir/rn-pci-acp3x.c
+++ b/sound/soc/amd/renoir/rn-pci-acp3x.c
@@ -168,8 +168,10 @@ static int snd_rn_acp_probe(struct pci_dev *pci,
 {
 	struct acp_dev_data *adata;
 	struct platform_device_info pdevinfo[ACP_DEVS];
+#if defined(CONFIG_ACPI)
 	acpi_handle handle;
 	acpi_integer dmic_status;
+#endif
 	unsigned int irqflags;
 	int ret, index;
 	u32 addr;
-- 
2.7.4

