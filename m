Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C60A762316C
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Nov 2022 18:26:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5CFC616BF;
	Wed,  9 Nov 2022 18:25:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5CFC616BF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668014767;
	bh=7Q14+BCto8tV2ZMBIypC33bgELhtNI5IFCFp2fEA2vc=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=HmLJZNmhz0xRUKGeU4rhsE6QqQemR5yay1gkClB24BX+ftAKlF3mIvnuNuxGB5SlK
	 qIjZGdO7G63HQaii64SOgk3j+REe6dwjlZzQuCn7ishZJyRa/VtF98vQ6db7GB1qwc
	 u4nHv62YMaNAKCDKGa+k+UloO3/4Uu8926SQzDj8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B9A1BF80621;
	Wed,  9 Nov 2022 18:16:23 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 309DBF801D8; Tue,  8 Nov 2022 09:49:02 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2051.outbound.protection.outlook.com [40.107.243.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2B199F800EC
 for <alsa-devel@alsa-project.org>; Tue,  8 Nov 2022 09:48:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2B199F800EC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com
 header.b="viSwTWvZ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZNPcQjNjKDpQ6wnYTs7KXRswn2vS2R1r9Wr+QBkJsbXXc/XVJ53SgODh8jhurC0NDiTkiN+GRpY13e7zlyQSF4x2KUy9SkpJ8OAy6KiWLE4bcf08XlmzEAVwIJjLhtxspXzGIDOqSxj325t/B27RYrHfeVvPBBPi1stu/aFdQjYBF+mUgtZCpsZiNfeVbCyH71XNgS/hWm/O55aDUC1Hz9gig75Lwj8z1DvImbwHYf4ItQoANdt6JAQmH7s3+6FnId1LtmPPhDurpDDZTXD2lCCrZevtyTL6H8uumpmVnt8dOgi/wHr/V5f9BWBSkZDrS4qgHiTR251x5f8LtMQaLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Iz5eH5HNjy0kglVuxEI5svNoEeZXGQWh8iWr8Rb5naE=;
 b=BMg8khsh1lfLeYRCxGqu4mlrRq6yPhhWU3IJcwsz+1pFVGR+sPFmpjAEj4i/Wz/TkCanDq8z6wSDeE3aHZD/nYBTSMrHZ5fhIVYvbVtNo8bft0+cHa7L6XfnirRVoB7u6T89+J4R0mzHZvuDFdfT9v+tDjykBSH4TRTurXFSv+8eEvbOItcTw7PqfEnUV8zNfzYC9Oe6cKAGCvTMtFM+r+mKgmphkIQJ16sXPj+iP4Jxql64g7OvlbfYE2Ru7BhlhlzwdMb0f6Uv94m3cuRRbytCaGY5UuoUaKXjy/rNttV+ZXvLJkX/sHUYltSjR8kj/vBSNvZKxS+j5+OKEOiBFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=alsa-project.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Iz5eH5HNjy0kglVuxEI5svNoEeZXGQWh8iWr8Rb5naE=;
 b=viSwTWvZLob2lKz3oqJAn/RwgNWZuEoA/zQdJUtscxOzco9sf5egnk+c0zgapQ6nFVIqPiV9dpKpux4fG1G/3svFaPMi3OpH5LTk1JVNOn88S5/TLYh9vKJApKkRHqnhE3Sh34/v38RPJlZB6yFu8KTxepUoe0cPPQn+8G6tQes=
Received: from MW4PR04CA0275.namprd04.prod.outlook.com (2603:10b6:303:89::10)
 by SA1PR12MB6947.namprd12.prod.outlook.com (2603:10b6:806:24e::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.25; Tue, 8 Nov
 2022 08:48:52 +0000
Received: from CO1NAM11FT036.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:89:cafe::54) by MW4PR04CA0275.outlook.office365.com
 (2603:10b6:303:89::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.27 via Frontend
 Transport; Tue, 8 Nov 2022 08:48:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT036.mail.protection.outlook.com (10.13.174.124) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5791.20 via Frontend Transport; Tue, 8 Nov 2022 08:48:50 +0000
Received: from equan-buildpc.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Tue, 8 Nov
 2022 02:48:48 -0600
From: Evan Quan <evan.quan@amd.com>
To: <alsa-devel@alsa-project.org>, <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] ALSA: hda/hdmi - enable runtime pm for more AMD display audio
Date: Tue, 8 Nov 2022 16:47:46 +0800
Message-ID: <20221108084746.583058-1-evan.quan@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT036:EE_|SA1PR12MB6947:EE_
X-MS-Office365-Filtering-Correlation-Id: bf489694-d8f7-4ffc-72e0-08dac1660f05
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TnlNzBLb9nPlIYohbZLFELKXXcm8EKPz1miqSYrQXJgQIrEPFNC4Sxq5KFPCQrAnwOP7LaCRWJix3tVSaL0ZUutgs3La8v4miqyNu8cM4SxspbdNc22zY6j+JfFSEdmjmbeIEV+JWsOGs1j1EKcmHqmt8bmx3zDMgjxeCxt64x4+0GhMmgTU18cGCGxoptAlJp2gb5LCMTs5IfmLnMTxA0roao07OvOmTrMnIpL7oR1nfnSOwjqTqxV01tyqwQ1WKeAxBgfPKdMiByyBA39tWu+xGClJrjeXhICtzihx9/opioG9qG3XPM6Gem3fEvk+1leVJZcVxnzd/7wmWPGg7NfJU3Dgs3tmah2eQe47/H5RrLRL+QkdKV1OCchpcQnG0z+I1/MesnSGQaNydV0l8XDadgvrb2+edO+8IaYm9V07WTY9FyqF+xngpte9cihhorBF/5EugkKCJac7pXfxl/YE/Fzf3Id3t7q5WdUvakpu46v967qbvP6mAABxHBy2GpuIX3MtOnc7p6M2lzll/keSKw5uGHMdzQCjapvPHSw49Wov7kgO7hcvu+45shwDppakvunCx4YbhEdV9qoWNVcfrZXqQz5AN5tRfzx8kIj5ceVt+yDEv/tpHtYlehQLAt/f7GUVdI+fFEZy3y7EDba5GNa8m5YZmyEE0g3QfhcMkW24Lk+R37NHvhIZLxqSn4+ZPnTPLRsXAQ2Ne0WBWs1e3F1IC55Tu45h0haa8euN93tmvUIqTEWjjCPsKeATs1+WyMWiCIdsDTxOMlkZzcfZN6lzeTm8YNGpkxaczEenFbCT59J4osYucr8dKua2d2hcnqKJ/pUAjCMqI6Q0+A==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(376002)(136003)(39860400002)(396003)(451199015)(36840700001)(46966006)(40470700004)(1076003)(16526019)(336012)(186003)(44832011)(7696005)(316002)(41300700001)(8936002)(2906002)(82310400005)(36756003)(478600001)(47076005)(26005)(86362001)(40480700001)(4744005)(2616005)(426003)(54906003)(5660300002)(36860700001)(70586007)(356005)(40460700003)(81166007)(8676002)(70206006)(4326008)(82740400003)(110136005)(36900700001)(2101003);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2022 08:48:50.7624 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bf489694-d8f7-4ffc-72e0-08dac1660f05
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT036.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6947
X-Mailman-Approved-At: Wed, 09 Nov 2022 18:15:50 +0100
Cc: alexander.deucher@amd.com, Evan Quan <evan.quan@amd.com>, tiwai@suse.com
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

We are able to power down the GPU and audio via the GPU driver
so flag these asics as supporting runtime pm.

Signed-off-by: Evan Quan <evan.quan@amd.com>
Change-Id: Ib7ea9bfe7b62b98afd63f96a2d98795504e7ae04
---
 sound/pci/hda/hda_intel.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/pci/hda/hda_intel.c b/sound/pci/hda/hda_intel.c
index 0a83eb6b88b1..e6a33e34efb9 100644
--- a/sound/pci/hda/hda_intel.c
+++ b/sound/pci/hda/hda_intel.c
@@ -2712,6 +2712,9 @@ static const struct pci_device_id azx_ids[] = {
 	{ PCI_DEVICE(0x1002, 0xab28),
 	  .driver_data = AZX_DRIVER_ATIHDMI_NS | AZX_DCAPS_PRESET_ATI_HDMI_NS |
 	  AZX_DCAPS_PM_RUNTIME },
+	{ PCI_DEVICE(0x1002, 0xab30),
+	  .driver_data = AZX_DRIVER_ATIHDMI_NS | AZX_DCAPS_PRESET_ATI_HDMI_NS |
+	  AZX_DCAPS_PM_RUNTIME },
 	{ PCI_DEVICE(0x1002, 0xab38),
 	  .driver_data = AZX_DRIVER_ATIHDMI_NS | AZX_DCAPS_PRESET_ATI_HDMI_NS |
 	  AZX_DCAPS_PM_RUNTIME },
-- 
2.34.1

