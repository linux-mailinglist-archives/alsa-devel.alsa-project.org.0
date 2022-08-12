Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DE135910A0
	for <lists+alsa-devel@lfdr.de>; Fri, 12 Aug 2022 14:13:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A740D15E2;
	Fri, 12 Aug 2022 14:12:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A740D15E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1660306423;
	bh=vjhvIoqB1AxxN1hmgXaafG4g63LzI2RwKGkKciinSNw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MBx9zfKPjAQOSOOYx//m8WqQwbtRb2oxQJNk3uNEETvWqhqNu4Qg34Kr1gJDLy5+D
	 OlvsZ68iuh6gXYACLVM0VES4F2Qm/ytms1/ANntwXrvONgEFB5Vs+KfU591WCBCXVV
	 eOM0dvHoOIR6iLEmVROwOrgLVBdnW0Au4ezK1IEY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 61244F8058C;
	Fri, 12 Aug 2022 14:11:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E70B6F8058C; Fri, 12 Aug 2022 14:11:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2043.outbound.protection.outlook.com [40.107.223.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 59C6DF80588
 for <alsa-devel@alsa-project.org>; Fri, 12 Aug 2022 14:11:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 59C6DF80588
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com
 header.b="hwMBbqiW"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=loij+VH+l4dE/j61jPgB76mmbimkHQH+qHkqBb9A0oq2mTFPBcD4jCBhZH2+b78LtZEL/J5zUS3wIKuZmqYsneQzbwTamt9h4z5NX0hIPaGChBvAaVyyhalBJQT0QuFz74m0BedaKd5ICwZkNDcvCmEaxa4vvJc/XW/7ft2KnDFdmxFIe7jpuK9wdhHWKyWaHXCG4cv8OBmlGPS9XHlAt2dZxbNib+NrvR/h2a7XkfaDQ63NhCTdBkvTAqtYG8AVBR8QkO7digVsC76hhznJZmutpcFAHXV5LPKW/dfoDJWcCuUrFtufURLbj4Ga4/dSmZAi6Bv8+l5CwQ7YBClwmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CbGO7tM/xl3wFOB8TKkoqPAIyhxiWcGIRHFXCTy8avs=;
 b=XVVhTe/KrZDpkcF/3dim88IPiXrA8PF3QN8HHq8SXs2Pd2b+sNmsfkIjOGZ3LJaLMxz6fEOTRASLT8QQ88zozpjFSHqeJUN+fQR4FRH3CLLnpa2jMQuupalR28BzkCWLdtfzZduzxWbQ6CCZYgmKpUOYcCgeHhtvB92ZL3xMoGIKO4KqFV5b/FG8sundVv/Fs6RKzxHl68NjeKYOR6dnNi5WtdJ+cB0e7QUNanCifjhXqA1gprDxxLF0Vp3l87+VJ/7wLlkhdP+JMcbGdzL2F/jovJmrkaBh0a6UHN/lidNlrqjfX50eGWx8q6F+3wMmqeUCDQsAI1god3LmR0kP8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CbGO7tM/xl3wFOB8TKkoqPAIyhxiWcGIRHFXCTy8avs=;
 b=hwMBbqiWY5YR8Q2Vcv/JidPI89eMmR6SQjbIdO0uK+B7jsPIDX5yZ2kCQ8ZrV9DNovM7qx3Ei2V8ofPiPYIFH87I09ZH+X4VgLWGo2+iXxMJJ/+VBdyUp6sZehBswOWB9iAgrRDoSSezLFcTdiDTQHzQpoJJb2MgLYm8oxwH+4c=
Received: from BN1PR13CA0026.namprd13.prod.outlook.com (2603:10b6:408:e2::31)
 by MWHPR12MB1165.namprd12.prod.outlook.com (2603:10b6:300:d::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.16; Fri, 12 Aug
 2022 12:11:34 +0000
Received: from BN8NAM11FT093.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:e2:cafe::20) by BN1PR13CA0026.outlook.office365.com
 (2603:10b6:408:e2::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.16 via Frontend
 Transport; Fri, 12 Aug 2022 12:11:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN8NAM11FT093.mail.protection.outlook.com (10.13.177.22) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5546.7 via Frontend Transport; Fri, 12 Aug 2022 12:11:34 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Fri, 12 Aug
 2022 07:11:33 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Fri, 12 Aug
 2022 05:11:32 -0700
Received: from amd-B450M-DS3H.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.28 via Frontend
 Transport; Fri, 12 Aug 2022 07:11:29 -0500
From: Syed Saba kareem <Syed.SabaKareem@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
Subject: [PATCH 11/13] ASoC: amd: create platform device for acp6.2 machine
 driver
Date: Fri, 12 Aug 2022 17:37:29 +0530
Message-ID: <20220812120731.788052-12-Syed.SabaKareem@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220812120731.788052-1-Syed.SabaKareem@amd.com>
References: <20220812120731.788052-1-Syed.SabaKareem@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 281a38d9-1481-4de2-861b-08da7c5bcc8b
X-MS-TrafficTypeDiagnostic: MWHPR12MB1165:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kv5V2ei/a1x5o+IYZBLs9k9uEaGT2J8zirnlhhB6P/aSTqQgXLD1PioCpbnQ3KjobbIRbrMP6naF9b3ucUx04GqjtmlYGnuw9/Nbsg4sc+RdjmxK9MpSOOxp8M8F8yjOiRs76KC+N7lYUrtwEz267Kfm3a1Nf7eQraOzp0TYQR3dAwzkLcDjFgRgf/MbEi9mI1DEAHFPtanUW54ZisANtPcyS7AkqY4weOU1VNTBLzd3IydeUzzXaUMYlg/gKZyPPUwUkFMHfjqVpWcweF/lL+eA/DSynvbUQutIJKCh0s06AxT2IxIlasqpCvHdWIG8+re4Wyjysbn8xmqvmPJ+zeHv908/GosJh357qoXFHeeH8XV87OA+S7ItsXM02OdNCCJwIwpT5oNc3P5xy2+CPVupDJ/8LOmg36W1nIVXAQIdO8K4jx7mfZhIOerx9HmyVkRyWkcfkLp3QOPPdTw3ouQEytRgPpd4rCRRPwu8ij+7Ph0XH7kflGX2gV+XcSdny4ChAi6YMhMZ86ry4m4xhJRVjYjIL86kXMnXWrBb8cvqTb95v68bVTujCpa3yrBpj47IwYO/wTKg4CNT1fo2T71H96MMnt4vC7pLB7VVNt+1iF9gTr0ePNXT/h8vYmEF7bVHrYQpZ18QOMIyG7eCOqcu/uoXPR/5ovLKkBH8yO+B0tb+XmW2cFy7oA3GiTMN/0tI/oRxAuv4VbCIRciGfNPlrWznCySubXEK8ySpQRSz4SSHNxlzARS43MOEx6yVwdnzfNcE3O7MVbzdMmvq2cfPOYreGCYGxYBQ3jQUQl1+pfgOD7SaGMjIRIXT9rEteLgnol7L7JXLBSUT/n2VKg==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230016)(4636009)(39860400002)(396003)(346002)(376002)(136003)(40470700004)(46966006)(36840700001)(336012)(8936002)(83380400001)(426003)(81166007)(70206006)(4326008)(356005)(1076003)(70586007)(2616005)(186003)(478600001)(41300700001)(86362001)(26005)(8676002)(110136005)(82310400005)(54906003)(316002)(7696005)(36756003)(82740400003)(40460700003)(36860700001)(47076005)(40480700001)(5660300002)(2906002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2022 12:11:34.1129 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 281a38d9-1481-4de2-861b-08da7c5bcc8b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT093.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1165
Cc: Sunil-kumar.Dommati@amd.com, open list <linux-kernel@vger.kernel.org>,
 Basavaraj.Hiregoudar@amd.com, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, mario.limonciello@amd.com,
 Vijendar.Mukunda@amd.com, Syed Saba kareem <Syed.SabaKareem@amd.com>
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

Create platform device for acp6.2 machine driver.

Signed-off-by: Syed Saba Kareem <Syed.SabaKareem@amd.com>
Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 sound/soc/amd/ps/acp62.h  | 2 +-
 sound/soc/amd/ps/pci-ps.c | 4 ++++
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/sound/soc/amd/ps/acp62.h b/sound/soc/amd/ps/acp62.h
index c5b99e0b81fc..d6ac5781acf9 100644
--- a/sound/soc/amd/ps/acp62.h
+++ b/sound/soc/amd/ps/acp62.h
@@ -11,7 +11,7 @@
 #define ACP62_PHY_BASE_ADDRESS 0x1240000
 #define ACP6x_REG_START		0x1240000
 #define ACP6x_REG_END		0x1250200
-#define ACP6x_DEVS		2
+#define ACP6x_DEVS		3
 #define ACP6x_PDM_MODE		1
 
 #define ACP_SOFT_RESET_SOFTRESET_AUDDONE_MASK	0x00010001
diff --git a/sound/soc/amd/ps/pci-ps.c b/sound/soc/amd/ps/pci-ps.c
index 7e2f68d9fc2c..3172db1b728b 100644
--- a/sound/soc/amd/ps/pci-ps.c
+++ b/sound/soc/amd/ps/pci-ps.c
@@ -237,6 +237,10 @@ static int snd_acp62_probe(struct pci_dev *pci,
 				pdevinfo[1].id = 0;
 				pdevinfo[1].parent = &pci->dev;
 
+				pdevinfo[2].name = "acp_ps_mach";
+				pdevinfo[2].id = 0;
+				pdevinfo[2].parent = &pci->dev;
+
 				for (index = 0; index < ACP6x_DEVS; index++) {
 					adata->pdev[index] =
 						platform_device_register_full(&pdevinfo[index]);
-- 
2.25.1

