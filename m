Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E3BC42D369
	for <lists+alsa-devel@lfdr.de>; Thu, 14 Oct 2021 09:19:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2461B1664;
	Thu, 14 Oct 2021 09:18:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2461B1664
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1634195968;
	bh=xVj04O43UUv0yj8rQU1r7EeUCENpDK+9NUBWeAQmTt8=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=P6RdubjOqpDyd6x7bdW0QSf3SwdiVRe41IVXLcDcMmtAecGVDTQZ8yTIwuBRNulFK
	 IdjVZ9m0pvpXob0SdTLzEV+6ECY5eMpo9aDoQqjRhDVvtwxb6Js6rRUEaKnLRuklDq
	 d4gQrcSZ/RJR9nJxNi3D+dEYrQIdZEw7fElhRgzk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 67E3AF801F7;
	Thu, 14 Oct 2021 09:18:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7AEDDF80245; Thu, 14 Oct 2021 09:18:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2073.outbound.protection.outlook.com [40.107.220.73])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 51CCDF801D5
 for <alsa-devel@alsa-project.org>; Thu, 14 Oct 2021 09:17:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 51CCDF801D5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com
 header.b="XhU5XTdy"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jGkmpISn83/mu0+pw3UkrO4xPx0A32KjwfGjxSzPG0SXVuNy+vjo7AgXID8+IIxTNgIeUQifYxvOpLV3cgdtzkU6NOtprPegEG8VUe2KpuCpllumCjG+sydL7f63y77jDY2FMNFUpsS1QCXiACx5rsCSi2kNapqvMLPiwYc/nS5B0I9ZJ98XOdOuzm72zewYFpOUlNZVECP8tdIFIkRKg3Tl88PyoshE6lGN7aKQHhgNhrcpP2zZRl3t53/c+MjY5Fz4NkdHDBBj9QVOvL3+bpGQjBXj1gM8mjdBvS5IbgaiP+UIa2hcm0AX4Y8cV4yRPOJsajmoJKf81RTc7DNm1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xsxc3ZmGFyI6adXcbcAw39bXBuF/LB9n7dxuiEdKFyw=;
 b=N+fxzsQBrdEFj5JoG8OweLSE+3cHWjlhUtXHYMdNl1DesJkiLP4f2K2V31WwtMSJHlhOirnY6T659ggckybiTRPCEzqrb2PRPpGPF4KgWI5fpSsRS3vo0dz5nObVej+pP8bn90LSVDuqdsIyLGvFF5bBq/Aj4QZehLtt8NrT5leAOl/G1IYsahFQ0HKhIF4/U1xZFAKMNkNpgzH2TO3AyarWfFd8kqJq0BOAO/gHyEEvCjF2W4NgmD/5WxDGrUC5PB3+tBQZ13IFawfwRYee7nQv2eYfmRYh1bMDK3OitMYxkRWvkkxz3/6clvGOAXiOTT4ErR8Hf29K2N9G5lw1+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xsxc3ZmGFyI6adXcbcAw39bXBuF/LB9n7dxuiEdKFyw=;
 b=XhU5XTdyNtwhl2P84jA+3eYTr0rMdhplA8noj8I0qVE2AcCXUCiGDn6fPHAjteYLWvOexSBbWL9B0hGZtcjtH8lxT6hRFUU1KuGnpKZtDP8zFUhoEsyo7aEYHc48ErDFkSgHWbZg7zW8KYqPvAKzXC3htgUC9iqfjcm4J2zI9m0=
Received: from MW4P222CA0024.NAMP222.PROD.OUTLOOK.COM (2603:10b6:303:114::29)
 by DM6PR12MB4601.namprd12.prod.outlook.com (2603:10b6:5:163::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.22; Thu, 14 Oct
 2021 07:17:51 +0000
Received: from CO1NAM11FT052.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:114:cafe::75) by MW4P222CA0024.outlook.office365.com
 (2603:10b6:303:114::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.16 via Frontend
 Transport; Thu, 14 Oct 2021 07:17:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT052.mail.protection.outlook.com (10.13.174.225) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4608.15 via Frontend Transport; Thu, 14 Oct 2021 07:17:51 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.8; Thu, 14 Oct
 2021 02:17:50 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.8; Thu, 14 Oct
 2021 00:17:49 -0700
Received: from vijendar-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2308.8
 via Frontend Transport; Thu, 14 Oct 2021 02:17:46 -0500
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
Subject: [PATCH V2 1/3] ASoc: amd: create platform device for VG machine driver
Date: Thu, 14 Oct 2021 12:47:08 +0530
Message-ID: <20211014071714.836410-1-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 666bd596-b78a-4e35-07fb-08d98ee2bbb3
X-MS-TrafficTypeDiagnostic: DM6PR12MB4601:
X-Microsoft-Antispam-PRVS: <DM6PR12MB46018D344D24DBDCE88E138097B89@DM6PR12MB4601.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1002;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wGhbkPlyiNkpFg4SPPD9Ux3ppJIO/mfe9amrZV7XSU41HKzTle4AwdXNrsLASM8YCUFxHpPRDb2DqE5QFX9Pv494szjq0fB1NtQLMCHqVem2rb1a8WsdyYVpUKJ3wL3WXSUqQ1F3b9l2kj5//8PWINGxJIOw3SxUyeBdLD4QeLDI+lTT8HWj2HgOXv4MJ7uEpHzOBI2/OmoAR0iKbdWIx61CCOYyNKG9Jq8nR6xVxJ/LojQ+cceAyc2fkLluM1j5hHdvR8JJyBp/gJgIaj8MmneY7IJrr8xFDOPHOF1dp+iPLAyTKlFetpzJ/twQIH/I2a4ai6Fdzqp7g6jtKdi95CWyGuMMUar7Rwej5LnHCdYVMO51thvdkxIl29j0p6R5u90xnbfkEChh8JXAujW4uD3Ctum+6lOdGTF0gF7f5eZSBQ3fIh6xefH1peXSA4044FfIE7wFT70I88zHhh2U4BOMH662DxyZa3F3b5c68A88rRks/b5+R8x0IO9clJIYcwr3tR5RyxDGpIuhAN0/agQXOuzF+hPdMVL9znExv/aCLJJ30t2ZtGbneQuCWmpY0fIZT8LEg7Mk6jSGrhuhfYx3zF4aWTvRYShV/PDByME6anbvhTNb+xr0cnpxLi81WO+RgZZW+n24TzDBuCiJuIjz74PJN4+CsBprFSvvgsW6eKGphmERSccWBgFsMkH5/en8x6PwRcyG7z/i84BqEcSg4O8rsV3ONyrEO2EoNtk=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(46966006)(36840700001)(70206006)(2616005)(86362001)(110136005)(82310400003)(426003)(4326008)(54906003)(7696005)(81166007)(336012)(316002)(1076003)(2906002)(26005)(70586007)(47076005)(5660300002)(186003)(36756003)(8936002)(508600001)(356005)(8676002)(83380400001)(6666004)(36860700001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2021 07:17:51.0912 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 666bd596-b78a-4e35-07fb-08d98ee2bbb3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT052.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4601
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Sunil-kumar.Dommati@amd.com, wtli@nuvoton.com,
 open list <linux-kernel@vger.kernel.org>, Takashi
 Iwai <tiwai@suse.com>, Liam
 Girdwood <lgirdwood@gmail.com>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
 Alexander.Deucher@amd.com
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

Create platform device for Vangogh machine driver.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
Changes since v1:
     - changed machine driver platform device name as "acp5x_mach"

 sound/soc/amd/vangogh/acp5x.h     | 2 +-
 sound/soc/amd/vangogh/pci-acp5x.c | 3 +++
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/sound/soc/amd/vangogh/acp5x.h b/sound/soc/amd/vangogh/acp5x.h
index a808635f9740..fe5e1fa98974 100644
--- a/sound/soc/amd/vangogh/acp5x.h
+++ b/sound/soc/amd/vangogh/acp5x.h
@@ -23,7 +23,7 @@
 #define ACP_ERR_INTR_MASK	0x20000000
 #define ACP_EXT_INTR_STAT_CLEAR_MASK 0xFFFFFFFF
 
-#define ACP5x_DEVS 3
+#define ACP5x_DEVS 4
 #define	ACP5x_REG_START	0x1240000
 #define	ACP5x_REG_END	0x1250200
 #define ACP5x_I2STDM_REG_START	0x1242400
diff --git a/sound/soc/amd/vangogh/pci-acp5x.c b/sound/soc/amd/vangogh/pci-acp5x.c
index a57b762d9f2e..2b6b9edc36e2 100644
--- a/sound/soc/amd/vangogh/pci-acp5x.c
+++ b/sound/soc/amd/vangogh/pci-acp5x.c
@@ -213,6 +213,9 @@ static int snd_acp5x_probe(struct pci_dev *pci,
 		pdevinfo[2].num_res = 1;
 		pdevinfo[2].res = &adata->res[2];
 
+		pdevinfo[3].name = "acp5x_mach";
+		pdevinfo[3].id = 0;
+		pdevinfo[3].parent = &pci->dev;
 		for (i = 0; i < ACP5x_DEVS; i++) {
 			adata->pdev[i] =
 				platform_device_register_full(&pdevinfo[i]);
-- 
2.25.1

