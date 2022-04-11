Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E5B214FBDB7
	for <lists+alsa-devel@lfdr.de>; Mon, 11 Apr 2022 15:47:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 69DC6171F;
	Mon, 11 Apr 2022 15:46:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 69DC6171F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649684849;
	bh=42408SLjbUAq+jPYbjFBMcofQr+7cHcnRvOEpuJvckc=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=LqmbmNIt07z7gUXCG2GHaVMd4BZW2CYkh76L5znAuueigVP1eeQ3WmQeWbvOaGBVo
	 JfBO6Z3CX2MA133ixLAjTfAnCnNtUokap1HUOyo2+KdAUUqcSfSEtDkyD/gv2+u58J
	 Gesm8hyll4TgDn/215SWEUNl7py+Zo7DHSq7K9mA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9AC7EF80516;
	Mon, 11 Apr 2022 15:45:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6FC1AF80526; Mon, 11 Apr 2022 15:45:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20613.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e88::613])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 517A3F80519
 for <alsa-devel@alsa-project.org>; Mon, 11 Apr 2022 15:45:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 517A3F80519
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com
 header.b="jB6e2A5I"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mpsmYnPJMcipXK1cE2FECzjKmUufFrOj3XEEPqirqqkYg/h2SUET7DqULLnzD7qU/qZGjxh/U6paxhJmxKtJndS3GzF4iRqEYoDLQsDPBg+CjAMasMqg6ga+c7TjmSniIWtmnpPd1p/8FPyk/7EIw3HuAGpvhXbI+K/XfomA7Wm3rPg1nuU3bwC0UOUK+Wre+nrlBebLGRZIIoItOwqU47bmSF1F9zzQRqvSBNVTFZq0MUNxrEk2uiRIXsvi2OSAJiMUV46S8QYLNtzVBa+L+PG6AiYMLfhXpoadaw/BAG5DPkc/Un8k08OuH/VqEsi3Yw6GvZnfeqI/k9OkdlN09g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=okp9xA5U1pR6WHvK1mRrAkptRPI1Y6gf6yo421lNJ8g=;
 b=fd2HRYkFatR1Z5szNIykMLUgH7dCjWpdRP4ErTX7K+IqoR9e6aROrSMNcn+hG6x6SzlydDLmcsnKWm8slEeuicse0+2vV2d+P4uQztyXaYNCfr21l51WK+3D1SyQV/yqqSgH/RMoma/1UNMW87Jxl2fdnxbGOCP97EzZelOYI3QN0nVC6lQOkS1juF9kfGMnv9GydGgTXRnwQpUuUOn776MfatILvfPcy96KMw3vzu0T5mME356l9q1Jh3rJ3MV1D0IOOAYTowpm6dMFGew5sdz6oz73eiHbi1pOOuRHVOpEw0UqlO2dJpX/ZOzJGTDKP9qRlYo7ZcrAXrpSewwGag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=okp9xA5U1pR6WHvK1mRrAkptRPI1Y6gf6yo421lNJ8g=;
 b=jB6e2A5IHjByv8MfCSauk6zUpQdDbVnRDiW9HfF+fvK0Yugbn0I6P6GK/sAZTKItCIkulSPfMic215vZ6ZzeAdCdDFSfZNMQvZ+9NvVRIEQ0MG3iy6MNfnksJFtAxxSfv80jrMaqwaKGZoZJsFEZsIS4G07i8w64PnbbEpep+/E=
Received: from BN8PR04CA0035.namprd04.prod.outlook.com (2603:10b6:408:70::48)
 by PH0PR12MB5436.namprd12.prod.outlook.com (2603:10b6:510:eb::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.29; Mon, 11 Apr
 2022 13:45:46 +0000
Received: from BN8NAM11FT060.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:70:cafe::2a) by BN8PR04CA0035.outlook.office365.com
 (2603:10b6:408:70::48) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.29 via Frontend
 Transport; Mon, 11 Apr 2022 13:45:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com;
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN8NAM11FT060.mail.protection.outlook.com (10.13.177.211) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5144.20 via Frontend Transport; Mon, 11 Apr 2022 13:45:46 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Mon, 11 Apr
 2022 08:45:44 -0500
Received: from vijendar-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.24
 via Frontend Transport; Mon, 11 Apr 2022 08:45:40 -0500
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
Subject: [PATCH] ASoC: amd: yc: add new YC platform varaint support
Date: Mon, 11 Apr 2022 19:11:15 +0530
Message-ID: <20220411134119.1767646-1-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4b751265-737e-4cfa-757d-08da1bc19485
X-MS-TrafficTypeDiagnostic: PH0PR12MB5436:EE_
X-Microsoft-Antispam-PRVS: <PH0PR12MB54365344EDAA680E9CF8C38297EA9@PH0PR12MB5436.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ngmr+Q5iD/iihy2TbacKIcaREkKqWpWIdYbGOhNnQqG07CxZ6eP7hiCDRwX8UslRkSkYGg72VqcJWTG3sgw9GAwq6TlKJnuhobfxTYHdu18hVp6kgpfEZtMCoNoEnNLqjFkFcqT4kZQQiq45xBq6RzEkTVMzlPzNLF09vB5tZ7d6pDzTG4AFF2htq1UZXe7h4wfRPvJXVKeKAotPF1mAHEB/jTVH5JfxLv/9l9W2EQqQRuB/cANzq4xgLeu7QVw+7QeUQLdp5/sBKKhiCp2aJd8umyU3c373StAuofVHt4oGGKJj31HJaJq4c0/8/Zs8xqieeAo5jMYA85oik0aBaAezqAHvhGnIiBiTLebg69diVwGNwOJG6QkMRN5eEFXViWtSHc3+vb3412BrzcDRaEhZH1NBTny1Sg0B816OVKxduqwxVigDBAGM0XoSuAIL6C63fdxEj0KSanXeSxgJAsQy696pixFSJwcs8wRYhsjvgFIupD/MAoBPq0Dgza6jJIfsJ3k8FabzldApPuxL0GtqeUjLDYQbYDlOGOo6wJo5v10dpRuFzB2R0KypMdXcf2kjNaoqAzdhdiHzeuJWS1Nfkw83Sq8jciM6zYxHeIIAe7LWPR+nuYTXqJaTo75qF6FnTrkX2cQolzcQHJr8/O4qQrUrqtM/kKnxCN3pk2yMOEtJS6mhxBgyoywUd7xGsZyXD25ODWXwdqG5/lk88Q==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(36840700001)(40470700004)(46966006)(36860700001)(26005)(2906002)(186003)(82310400005)(336012)(70206006)(83380400001)(86362001)(47076005)(8676002)(36756003)(40460700003)(70586007)(426003)(1076003)(81166007)(2616005)(356005)(508600001)(316002)(54906003)(110136005)(5660300002)(8936002)(7696005)(6666004)(4744005)(4326008)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2022 13:45:46.0133 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b751265-737e-4cfa-757d-08da1bc19485
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT060.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB5436
Cc: Sunil-kumar.Dommati@amd.com, open list <linux-kernel@vger.kernel.org>,
 Richard.Gong@amd.com, Basavaraj.Hiregoudar@amd.com, Takashi
 Iwai <tiwai@suse.com>, Liam
 Girdwood <lgirdwood@gmail.com>, Mario.Limonciello@amd.com,
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>, Alexander.Deucher@amd.com,
 Dan Carpenter <dan.carpenter@oracle.com>
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

Update PCI revision id check for the new YC platform varaint.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 sound/soc/amd/yc/pci-acp6x.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/sound/soc/amd/yc/pci-acp6x.c b/sound/soc/amd/yc/pci-acp6x.c
index 7e9a9a9d8ddd..20f7a99783f2 100644
--- a/sound/soc/amd/yc/pci-acp6x.c
+++ b/sound/soc/amd/yc/pci-acp6x.c
@@ -154,9 +154,14 @@ static int snd_acp6x_probe(struct pci_dev *pci,
 
 	irqflags = IRQF_SHARED;
 	/* Yellow Carp device check */
-	if (pci->revision != 0x60)
+	switch (pci->revision) {
+	case 0x60:
+	case 0x6f:
+		break;
+	default:
+		dev_err(&pci->dev, "acp6x pci device not found\n");
 		return -ENODEV;
-
+	}
 	if (pci_enable_device(pci)) {
 		dev_err(&pci->dev, "pci_enable_device failed\n");
 		return -ENODEV;
-- 
2.25.1

