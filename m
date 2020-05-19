Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 95ABE1D99F2
	for <lists+alsa-devel@lfdr.de>; Tue, 19 May 2020 16:36:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 142321771;
	Tue, 19 May 2020 16:35:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 142321771
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589898969;
	bh=2H2gOvr+YamZU6rtRCJE3v1l1sQPUZyZqFDThELZEMk=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=NKQB0hHqlP8T5rj5SdNpImLcl1EXRjNyALFlmHufBCGZGzS4FzZu1UkQ/wakDzFwv
	 NXRn1miYg15rA85FhMDUAMichN6+3g5EhlI8QiHDAP+lSPDiRZXsO7abSeDovmsJc0
	 Q1swdT5qeNvnpMuvT6h7hmcFidCK8umAnilqKsGI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2C045F80161;
	Tue, 19 May 2020 16:34:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B8866F80256; Tue, 19 May 2020 16:34:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 FORGED_SPF_HELO,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750077.outbound.protection.outlook.com [40.107.75.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 30915F80161
 for <alsa-devel@alsa-project.org>; Tue, 19 May 2020 16:34:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 30915F80161
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amdcloud.onmicrosoft.com
 header.i=@amdcloud.onmicrosoft.com header.b="na9T+Zvz"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mY+kdYU6rq9M4lakR4NcaK9ACy81McMLLjr5GKpfdkCuBFuIzWjkN+n7SWhiJOlu8rOK5FrwqxeMbZgi2dU0sAcejnZ9TYvW/EW4bcY+ChsdYQVnTudYgaWTi7RU8afrKSWrCLSPD89CzZXnuHnXgNQhj3YFSr0DhuNacrusV1ln6F6kG4N4ZlOBz7ySSJIXAnnBj1rkTqKMuHiv21R9d1UFf0RXxm8oVvnAjcKfjv9X//1YsQYmp637IIbA8txFTuVFcXdWXNDIC3ur5IYRrfhBJkh1opZNCWJEAmykK/T9A2Y8JYcGVk1O4JsgMF2WHyhnNoGQsn348DkrlSvjLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bhaz8gayckoLhVCuSSb2fd/ZvTYXq/lpCUbMx6i+kDA=;
 b=TZm+Gj1uLq/a3HJHqc7nJjsRTXDqJPQSNQcwnjptvMa86J/CioY+EyWB1rmRzZ4EzmbRLjf4o7XLgIbefU61F3IuKGnvUl02xzYeAQG0nI01QHhKuyJp0QG3Bt0gyjgeTesLHifFScj6p5HH+YBHzXSRhlOwA0mGCEr6tIPIJ3NvwMkDOG1RmYccvyAnOYiv4IhR/Wnmk5abZ5XK505AdxpEtbvod2J7L0Gjm800HoPfuUFo2CWh1kcYcao2HiLtvGrRjnPvkCHAnFd7wfRVRSWZMU+3BBwxOcifIXuMEWl1C6TcD2XlDLMp4erYhzygIvjHoE72zUSlgf9l9DJibw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=alsa-project.org smtp.mailfrom=amd.com;
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bhaz8gayckoLhVCuSSb2fd/ZvTYXq/lpCUbMx6i+kDA=;
 b=na9T+Zvz2EluLVMNsa5UlxJ3bUGkH7kZVPYbqrc9coelaFhazVrOa3FRa64gVUwhPGXToBs4q+gUDLFpZtat0AOdGAaEUCvNGUg+eN/bv5ebZuMKPwuzMmHjJs7HF0a8j/5Zjk8hCty56Jd2t7V9BAgKm92qcMAT13Drz+IVBow=
Received: from DM3PR14CA0136.namprd14.prod.outlook.com (2603:10b6:0:53::20) by
 DM5SPR00MB254.namprd12.prod.outlook.com (2603:10b6:3:7a::23) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3021.23; Tue, 19 May 2020 14:34:13 +0000
Received: from DM6NAM11FT023.eop-nam11.prod.protection.outlook.com
 (2603:10b6:0:53:cafe::33) by DM3PR14CA0136.outlook.office365.com
 (2603:10b6:0:53::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3000.20 via Frontend
 Transport; Tue, 19 May 2020 14:34:13 +0000
X-MS-Exchange-Authentication-Results: spf=none (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; alsa-project.org; dkim=none (message not signed)
 header.d=none;alsa-project.org; dmarc=permerror action=none
 header.from=amd.com;
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB02.amd.com (165.204.84.17) by
 DM6NAM11FT023.mail.protection.outlook.com (10.13.173.96) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3000.19 via Frontend Transport; Tue, 19 May 2020 14:34:12 +0000
Received: from SATLEXMB02.amd.com (10.181.40.143) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Tue, 19 May
 2020 09:34:11 -0500
Received: from atgasia02.amd.com (10.180.168.240) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server id 15.1.1713.5 via Frontend
 Transport; Tue, 19 May 2020 09:34:10 -0500
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <alsa-devel@alsa-project.org>, <broonie@kernel.org>, <tiwai@suse.de>
Subject: [PATCH 1/3] ASoC: amd: fix kernel warning
Date: Tue, 19 May 2020 22:34:20 +0800
Message-ID: <20200519143422.18255-1-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SATLEXMB02.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFTY:;
 SFS:(4636009)(346002)(396003)(39860400002)(136003)(376002)(46966005)(86362001)(8936002)(186003)(110136005)(26005)(336012)(54906003)(8676002)(316002)(426003)(82740400003)(82310400002)(4326008)(356005)(81166007)(7696005)(47076004)(70206006)(5660300002)(70586007)(1076003)(4744005)(2906002)(2616005)(36756003)(478600001)(6666004);
 DIR:OUT; SFP:1101; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 22cf9c82-9679-4616-68fa-08d7fc01b300
X-MS-TrafficTypeDiagnostic: DM5SPR00MB254:
X-Microsoft-Antispam-PRVS: <DM5SPR00MB254B273A5D4AAF02B2A771D97B90@DM5SPR00MB254.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:741;
X-Forefront-PRVS: 040866B734
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lAGgC/hIk1AY99CaAK97wIbdBNJnMUmOHom2+alObBKD8APGXuxSpeSQEfBH4hOkkZzINQOlPgWTHdvdGg5vVPVTsBR0ppHL6i8G5Z0YtE2MOMcUd7BawQNRAi74sIHU3bCZ1aCcO0YtyND9XhE8X6fgXFo/epao20YnvHAZ1cvy7YWrJDcr8iydovRn5hQ2AStjHvReArims8nTi+HMvIJCOsuDbllxa18b40HbNh7lDYsha990jeJDnZlxEwkVqnp/m/tC3kherZAcsZW+vebEToANNQmF5Batl3R1/Ul/ng1UQAVLBRmWca5u8dW+NDXo88qogvpeluptejgrkIeBX+1a2g07N4h43NuWH2RKa8V+9DoEWslg4fT8wTStcom/26WmvhWlT8cKMHFR4Q==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2020 14:34:12.3630 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 22cf9c82-9679-4616-68fa-08d7fc01b300
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5SPR00MB254
Cc: Alexander.Deucher@amd.com, kbuild test robot <lkp@intel.com>,
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>
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

Removed unused variable from code to fix the kernel warning.

Reported-by: kbuild test robot <lkp@intel.com>
Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 sound/soc/amd/renoir/acp3x-pdm-dma.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/sound/soc/amd/renoir/acp3x-pdm-dma.c b/sound/soc/amd/renoir/acp3x-pdm-dma.c
index 942010021319..b33c7aec7481 100644
--- a/sound/soc/amd/renoir/acp3x-pdm-dma.c
+++ b/sound/soc/amd/renoir/acp3x-pdm-dma.c
@@ -150,12 +150,11 @@ static int start_pdm_dma(void __iomem *acp_base)
 
 static int stop_pdm_dma(void __iomem *acp_base)
 {
-	u32 pdm_enable, pdm_dma_enable, pdm_fifo_flush;
+	u32 pdm_enable, pdm_dma_enable;
 	int timeout;
 
 	pdm_enable = 0x00;
 	pdm_dma_enable  = 0x00;
-	pdm_fifo_flush = 0x00;
 
 	pdm_enable = rn_readl(acp_base + ACP_WOV_PDM_ENABLE);
 	pdm_dma_enable = rn_readl(acp_base + ACP_WOV_PDM_DMA_ENABLE);
-- 
2.26.2

