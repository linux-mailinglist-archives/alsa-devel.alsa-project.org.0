Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C2E6457D07D
	for <lists+alsa-devel@lfdr.de>; Thu, 21 Jul 2022 18:00:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 34C01187A;
	Thu, 21 Jul 2022 18:00:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 34C01187A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1658419252;
	bh=UEcHR1TCSKxAfSxDZHtU8y4mo4hYD/kojzGnY7O2wME=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lfa4Yg8164I7Eqmu1+kI8KAcAm45wDIsoWmvhLv4eGD6pdyHgJ1XM0vFzz+rWaeWk
	 aeBp/2eN1tB/CV3fhqPdCHmt0cNAXvP1kcwqhuBZxzwVGw2nxFbZFx0oS87AH6DwAJ
	 Gtk0JiATksJ5hJVi0BPbtC+Lm0WVPotXCwPSk7RM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 063A6F80566;
	Thu, 21 Jul 2022 17:58:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D1216F8016D; Thu, 21 Jul 2022 08:18:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2060.outbound.protection.outlook.com [40.107.101.60])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DBDBDF800BA
 for <alsa-devel@alsa-project.org>; Thu, 21 Jul 2022 08:18:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DBDBDF800BA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com
 header.b="tLRoFjKV"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YNthUB9QLiWTF590gnacxO970rBq1fwQ0dhO0iZ5itcQExTm//mcI+ItyIG++CVkrxz1qkNiP6VJ9M6G3QbXakC6C24wTR9xrcJKH/dStrKFc1ihiiNWRkixn3GIE+v/8IRW2B01AIX7HNdvfw2Xgs6HlGgBgN9CL+kOENYZEmMAVdHDt/NqT66chdcD40xzJlyb2kg4S2v8ab4Nx5P0y5Y+KbTwWlSdFBRZnJaFdDI7YWk99yMBhmAkyfclA6kTihpT2E/z+Hyl5PO+Y7jVlblTeTkQ/s/a+tyaEHCe50mx3mYlmOIuH+QIDU3S6rsRH+I/kvcWGXyXCVFddJ+b3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/p+rk0BGYC0DgF53jOHSj9wrk5wufS85RPVfdOhWV7k=;
 b=EbssZ/WUIUzvmdn1qAHDEoomRDY+bp5wzhiTK6Fme5PiJBFx1/MEvtpgTCTW1DkOUrmUNt4jDKXmFjuQcvNYcgCH6kcrjIPymSr7N5texUtfKZH6+2rX2i+4RRK5sYyYjpdVRZgQRq5Np4l2l5qpan3dJhmrDFRscNLk7g14B8jggxtP4cEn4ssCTh1OgPZ/GaAB4tJtQfu0ITf7GW8BcFw+sEXbfGl8Pk6Z5sFQUjE3swp+n383xBA+wLZXQYJa5cY4ZmjavWMcMRjDwpK5DE88MeAVBkAiqoU3Fwv/EP7YJc5Z61tam3X1Naw+hwqNGdXbN85IVFWB/idlUWX73g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/p+rk0BGYC0DgF53jOHSj9wrk5wufS85RPVfdOhWV7k=;
 b=tLRoFjKVwgtXzTxGFIQkoW7Zn/0nSukWhHKlwi5WTDFyIMHjdx2xGyWINHx2gOjT+ueVuU2d/yC5rH0gDWpNp/u1OxoKgwJJv3jK/h0YePWN+rp2sq82kLsbaVVShVE96p43XZklVPvVpDe6lr6ke9EWgtVCuXtwUjMxJXuEbg8=
Received: from BN0PR08CA0029.namprd08.prod.outlook.com (2603:10b6:408:142::15)
 by MN0PR12MB6174.namprd12.prod.outlook.com (2603:10b6:208:3c5::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.18; Thu, 21 Jul
 2022 06:18:40 +0000
Received: from BN8NAM11FT013.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:142:cafe::ce) by BN0PR08CA0029.outlook.office365.com
 (2603:10b6:408:142::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.18 via Frontend
 Transport; Thu, 21 Jul 2022 06:18:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN8NAM11FT013.mail.protection.outlook.com (10.13.176.182) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5458.17 via Frontend Transport; Thu, 21 Jul 2022 06:18:39 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Thu, 21 Jul
 2022 01:18:39 -0500
Received: from amd-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.28
 via Frontend Transport; Thu, 21 Jul 2022 01:18:30 -0500
From: Venkata Prasad Potturu <venkataprasad.potturu@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
Subject: [PATCH 5/5] ASoC: amd: acp: Add error handling cases
Date: Thu, 21 Jul 2022 11:50:37 +0530
Message-ID: <20220721062043.3016985-5-venkataprasad.potturu@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220721062043.3016985-1-venkataprasad.potturu@amd.com>
References: <20220721062043.3016985-1-venkataprasad.potturu@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: db7fa325-035d-4875-a34c-08da6ae0da94
X-MS-TrafficTypeDiagnostic: MN0PR12MB6174:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ygj2I0UUC6Ok80adDwG2nUytn8nFBVJwiwJHlM+0xx5QiBbUU0moQpzizM91ehiXjdm8xpAHza72pPTvaE59llRJXFlNlVz5zabxKJINCIN2Bih9wQvlYVDgKqzt7MCo7wtioWXr8Y8VJVprRmQYPZRXAJ+mS0T4Ymuxn66ZDv/WB6RS7aduFVTSYT1PN5DyDV6SviJJGU2kvepL/auqPMMTeCpQOHuskBnmrdskpuHDJuFdF8N7IBiqkZ9LJeffHJwCAnVphbVBwq8M7+Qb2LCPKhQQ/1BI9qASVJjLRmk+l1qg1Ddd/LGfWK2NykJ57Jza0Q5rofRhoEOwmI4pvyuqIBRAUUNO6of4qRdsrHM701a+ZmrvBnyMb9Oo0Dzph6k03dKWbSr0fsk8NScsbstHJxOy6DfmKUfGj6QYheTrbaBR1YZ4KNZ1DsJlelp9UmTkzyzRv1PQxQMw20AN6W6UoZyUQgGOaVZjtez6O06yQ52yV2zrYnmFlitqung+8up7qO+gRqphonahY1OK28Hfyg8GUT6eA/XUkzar/vfBQqrdAeZLZPf8SdDL42aZbsewRKu6k9o9TDnuQCq366lzGeRjoQk7lFjYdTTjwGyqmXkmJ5ca0NRHlKlc0JVMRtpC35QxJxiCgD5om8uuh/mz1jiMJqoA/euVZOlirfaOksYAJa7J6Sgh+rx7RuOcPgJU2CJjiPPPGkv1w4vYQJ2dLb68D4r9EMBnv2kEa7VXkBmrHqiKybqEl7FLCLFLcIXQuLYoMFKORN3N9GIgon6cEMHup+NdqSYkEHd19UQQp5EzpyEYtyqu3yRqG5f6QNS33/Z0X3sqG9ukYdQXuA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230016)(4636009)(396003)(136003)(39860400002)(346002)(376002)(46966006)(36840700001)(40470700004)(54906003)(110136005)(40460700003)(26005)(316002)(83380400001)(70206006)(70586007)(47076005)(336012)(8676002)(36860700001)(426003)(36756003)(86362001)(2906002)(82310400005)(40480700001)(186003)(2616005)(41300700001)(8936002)(7696005)(81166007)(4326008)(1076003)(5660300002)(356005)(82740400003)(478600001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2022 06:18:39.8114 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: db7fa325-035d-4875-a34c-08da6ae0da94
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT013.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6174
X-Mailman-Approved-At: Thu, 21 Jul 2022 17:58:02 +0200
Cc: Sunil-kumar.Dommati@amd.com, ssabakar@amd.com,
 Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>,
 Venkata Prasad Potturu <venkataprasad.potturu@amd.com>,
 open list <linux-kernel@vger.kernel.org>, Basavaraj.Hiregoudar@amd.com,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Vijendar.Mukunda@amd.com, V sujith kumar Reddy <Vsujithkumar.Reddy@amd.com>
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

Add error handling in acp pci driver probe function.

Signed-off-by: Venkata Prasad Potturu <venkataprasad.potturu@amd.com>
Reviewed-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 sound/soc/amd/acp/acp-pci.c | 24 ++++++++++++++++++++----
 1 file changed, 20 insertions(+), 4 deletions(-)

diff --git a/sound/soc/amd/acp/acp-pci.c b/sound/soc/amd/acp/acp-pci.c
index 34d75603eea1..2c8e960cc9a6 100644
--- a/sound/soc/amd/acp/acp-pci.c
+++ b/sound/soc/amd/acp/acp-pci.c
@@ -70,7 +70,8 @@ static int acp_pci_probe(struct pci_dev *pci, const struct pci_device_id *pci_id
 	ret = pci_request_regions(pci, "AMD ACP3x audio");
 	if (ret < 0) {
 		dev_err(&pci->dev, "pci_request_regions failed\n");
-		return -ENOMEM;
+		ret = -ENOMEM;
+		goto disable_pci;
 	}
 
 	pci_set_master(pci);
@@ -89,22 +90,29 @@ static int acp_pci_probe(struct pci_dev *pci, const struct pci_device_id *pci_id
 		break;
 	default:
 		dev_err(dev, "Unsupported device revision:0x%x\n", pci->revision);
-		return -EINVAL;
+		ret = -EINVAL;
+		goto release_regions;
 	}
 
 	dmic_dev = platform_device_register_data(dev, "dmic-codec", PLATFORM_DEVID_NONE, NULL, 0);
 	if (IS_ERR(dmic_dev)) {
 		dev_err(dev, "failed to create DMIC device\n");
-		return PTR_ERR(dmic_dev);
+		ret = PTR_ERR(dmic_dev);
+		goto release_regions;
 	}
 
 	addr = pci_resource_start(pci, 0);
 	chip->base = devm_ioremap(&pci->dev, addr, pci_resource_len(pci, 0));
+	if (!chip->base) {
+		ret = -ENOMEM;
+		goto release_regions;
+	}
 
 	res = devm_kzalloc(&pci->dev, sizeof(struct resource) * num_res, GFP_KERNEL);
 	if (!res) {
 		platform_device_unregister(dmic_dev);
-		return -ENOMEM;
+		ret = -ENOMEM;
+		goto release_regions;
 	}
 
 	for (i = 0; i < num_res; i++, res_acp++) {
@@ -133,8 +141,16 @@ static int acp_pci_probe(struct pci_dev *pci, const struct pci_device_id *pci_id
 		dev_err(&pci->dev, "cannot register %s device\n", pdevinfo.name);
 		platform_device_unregister(dmic_dev);
 		ret = PTR_ERR(pdev);
+		goto release_regions;
 	}
 
+	return ret;
+
+release_regions:
+	pci_release_regions(pci);
+disable_pci:
+	pci_disable_device(pci);
+
 	return ret;
 };
 
-- 
2.25.1

