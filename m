Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A011DC22AE
	for <lists+alsa-devel@lfdr.de>; Mon, 30 Sep 2019 16:07:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 275481668;
	Mon, 30 Sep 2019 16:06:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 275481668
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1569852460;
	bh=vcB4eCxK2KB+r75KdoUnXKzwp/ZlgMKknQJkBec2bm4=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=OliIDeozxzg55Kh4Fpfh6xHhKgnCortcXnoIr5V3wK3O1W29n7mUVjdT9Pk1FoebV
	 l16L21GokmaosPblTVK63VdW/FlorlQr1WIYkuvE4aOq/7jHiSTtIzWIVkQ0sY4HZi
	 vcm5y5h0moXBj8A3MXa7VSCpaEtlYv1LV35cukzU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 39627F8036E;
	Mon, 30 Sep 2019 16:05:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 83EEBF8036E; Mon, 30 Sep 2019 16:05:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=DATE_IN_FUTURE_06_12,
 DKIM_SIGNED,DKIM_VALID,FORGED_SPF_HELO,SPF_HELO_PASS,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from NAM03-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr800078.outbound.protection.outlook.com [40.107.80.78])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3B60AF801A4
 for <alsa-devel@alsa-project.org>; Mon, 30 Sep 2019 16:05:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3B60AF801A4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amdcloud.onmicrosoft.com
 header.i=@amdcloud.onmicrosoft.com header.b="TsZVYuIQ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DYW76Bz222ZSXVcTPLRrhphM2lF6GtlNKVD4jRCjBhlAZpAxvzcn0B6bXEIp5MwA4NFA/S+RGVwV37l+6IHnDqREOLCa8pRp0fqdGryU0LssmahBMLLtrU1uzSzABKyxNML54JpMK4UnojHD1bO0EMX+Qx+Taru0n6mPwo2NCvmaJof2teg8k6ehyBTSREwPVRSqNeTYSHdyjgW4OcTPYIEXqJ65W8vQKb5jWVTmJdQJ2tONDwk6HVrVfATpf4Yge3stQrJlGz05Dabw/d51/5DPW1esMPebzfa5jLFx9HFXT2QllYNKT97J6bZ6X1ypttHd+SDHV6wUP+JYoMjYPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nQz4KewW0jjJaHgm/tkT+fG1prUhUjrgh0AAmeiBq5I=;
 b=d2Ou03VpBuZS65i5x7dvNXeM2+J3rHqs2hrJmZqcfcMCWr9ufh5TxMTUiz9E8VeExkHgpwLoHq4vNW/tMHhDiJ7JTNodinTTevctRQk5vCfKuvek1o02vEVRg0QzU7SFVv32X3LoLO1/+li1LalEywbwlBdJVoK8lH1rHE3//zaYJoL3Mc6nPRkj939vwUDE2HKMzH5IXdOE67xeH2Zj6ZfEOCtwiJCRwmc+rMqtr9U4B1H5yWTiYZfwA1zT9GDBTsToy6QcJFIyAcYHq+pvd1czqRo6xHOvMvIqwnXLOpJvCFTPJFxrvmFC9yqon/IPWSAY2vAWB7PPYGXrapJg4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=oracle.com smtp.mailfrom=amd.com;
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nQz4KewW0jjJaHgm/tkT+fG1prUhUjrgh0AAmeiBq5I=;
 b=TsZVYuIQZEiHse0grgVU3psNJNbco/K8almMVtTCp5Blx/3ZYPNpR80D30F8gLMsLmVPzutr1hw163cVMEyQDTZVGW0TyVST97oZDDqoi3RywRsXQsoFZdAKhcigLTeTi4oyMkSSeMwjKIjRlb36SBmW54OemcmQEnhfeNQgfPg=
Received: from DM3PR12CA0110.namprd12.prod.outlook.com (2603:10b6:0:55::30) by
 CY4PR12MB1223.namprd12.prod.outlook.com (2603:10b6:903:38::15) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.20; Mon, 30 Sep 2019 14:05:44 +0000
Received: from CO1NAM03FT023.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::203) by DM3PR12CA0110.outlook.office365.com
 (2603:10b6:0:55::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2305.17 via Frontend
 Transport; Mon, 30 Sep 2019 14:05:44 +0000
Authentication-Results: spf=none (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; oracle.com; dkim=none (message not signed)
 header.d=none;oracle.com; dmarc=permerror action=none header.from=amd.com;
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 CO1NAM03FT023.mail.protection.outlook.com (10.152.80.157) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2305.15 via Frontend Transport; Mon, 30 Sep 2019 14:05:43 +0000
Received: from vishnu-All-Series.amd.com (10.180.168.240) by
 SATLEXCHOV01.amd.com (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1; 
 Mon, 30 Sep 2019 09:05:41 -0500
From: Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>
To: 
Date: Tue, 1 Oct 2019 06:28:09 +0530
Message-ID: <1569891524-18875-1-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(346002)(396003)(39860400002)(136003)(428003)(199004)(189003)(109986005)(336012)(476003)(126002)(426003)(47776003)(53416004)(2616005)(81156014)(8676002)(4326008)(486006)(478600001)(7696005)(51416003)(36756003)(8936002)(86362001)(50226002)(2906002)(316002)(50466002)(54906003)(5660300002)(70206006)(70586007)(186003)(305945005)(81166006)(16586007)(6666004)(1671002)(48376002)(356004)(26005)(266003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR12MB1223; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c3143d3c-bcea-44f8-5a03-08d745af48f7
X-MS-TrafficTypeDiagnostic: CY4PR12MB1223:
X-Microsoft-Antispam-PRVS: <CY4PR12MB1223F701F600C91DBF9A2955E7820@CY4PR12MB1223.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3383;
X-Forefront-PRVS: 01762B0D64
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UxzZGzEHl6Htj2m7qKN3g3Q3ecx130oPX7/AUvFbERuu7FUi7yhECwDD7TuK9TJEU5yXYFiw9m1hBCTqNAhbx39Qm5TTDp35F+kVKZXBrcskQ9z/cfPe5ouw6wohCyROYV+bSXE+l0D9mA5Kx/HA55JkfyNTD0a8HHJiqFFx2Of7FcOPTy9xg0PujwV/nFUG5LSpxzPiAC57Ba3K3KXGw33BXlbBmFq0mwU0GRd2c/U/DUOGIeV01AyQ5C2JLjmQMiS1/M5rdvRMNW+WMPvR+1/auM0sE6Dv02RIvtyr0E5rrevRTQYiqnsDN1/T1RQdvcXFomrxc3VJ/ewTcLWBifj3ADNiFKg0w7bMRnOine5Ndv4NGaCHoF7tEchpErYQc9MYanCpQvIbo0VfxBgpoG/+GsaeA0cqf0NXabnpQ3Q=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2019 14:05:43.8214 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c3143d3c-bcea-44f8-5a03-08d745af48f7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1223
Cc: "moderated list:SOUND - SOC LAYER /
 DYNAMIC AUDIO POWER MANAGEM..." <alsa-devel@alsa-project.org>,
 Maruthi Srinivas Bayyavarapu <Maruthi.Bayyavarapu@amd.com>,
 open list <linux-kernel@vger.kernel.org>, Takashi
 Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>,
 Mark Brown <broonie@kernel.org>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Colin Ian King <colin.king@canonical.com>, Dan
 Carpenter <dan.carpenter@oracle.com>
Subject: [alsa-devel] [PATCH 1/7] ASoC: amd: No need PCI-MSI interrupts
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

ACP-PCI controller driver does not depends msi interrupts.
So removed msi related pci functions which have no
use and does not impact on existing functionality.

Signed-off-by: Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>
---
 sound/soc/amd/raven/pci-acp3x.c | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/sound/soc/amd/raven/pci-acp3x.c b/sound/soc/amd/raven/pci-acp3x.c
index facec24..8f6bf00 100644
--- a/sound/soc/amd/raven/pci-acp3x.c
+++ b/sound/soc/amd/raven/pci-acp3x.c
@@ -46,14 +46,7 @@ static int snd_acp3x_probe(struct pci_dev *pci,
 		goto release_regions;
 	}
 
-	/* check for msi interrupt support */
-	ret = pci_enable_msi(pci);
-	if (ret)
-		/* msi is not enabled */
-		irqflags = IRQF_SHARED;
-	else
-		/* msi is enabled */
-		irqflags = 0;
+	irqflags = 0;
 
 	addr = pci_resource_start(pci, 0);
 	adata->acp3x_base = ioremap(addr, pci_resource_len(pci, 0));
@@ -112,7 +105,6 @@ static int snd_acp3x_probe(struct pci_dev *pci,
 	return 0;
 
 unmap_mmio:
-	pci_disable_msi(pci);
 	iounmap(adata->acp3x_base);
 release_regions:
 	pci_release_regions(pci);
@@ -129,7 +121,6 @@ static void snd_acp3x_remove(struct pci_dev *pci)
 	platform_device_unregister(adata->pdev);
 	iounmap(adata->acp3x_base);
 
-	pci_disable_msi(pci);
 	pci_release_regions(pci);
 	pci_disable_device(pci);
 }
-- 
2.7.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
