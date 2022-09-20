Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 691765BEE52
	for <lists+alsa-devel@lfdr.de>; Tue, 20 Sep 2022 22:15:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1A775827;
	Tue, 20 Sep 2022 22:15:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1A775827
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663704957;
	bh=MGIKVyD19J6QZA85UzO66OFN08nSMpI2HQwEj1QM6xY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=M8+5UhigSS07ZrhjgYXcXmYuV5TarAJGcP3s+bAkxlPs+RyoCxm507TG4a1RM8OFa
	 lovpYvBmLdUmzwrbU5S2g4X6A3taEPwOgw5DXG4iI8VaUNHl3rm04k3OXTbHPJS6ef
	 oEPPDzSSwPIrhIVR/Z5p7oM9+mJd8uKAxxkeK6aE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9808CF801D5;
	Tue, 20 Sep 2022 22:14:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2956DF801D5; Tue, 20 Sep 2022 22:14:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2055.outbound.protection.outlook.com [40.107.102.55])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id ECBA5F800C9
 for <alsa-devel@alsa-project.org>; Tue, 20 Sep 2022 22:14:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ECBA5F800C9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com
 header.b="bamBG9pf"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e36uZD32vZSxKZOrqHYcPIpNLBIYZTq3vZikU8tpVht2ZNDxLMQEj02h8E80MmzUikpK4YyC9VdU6C28ZBjwnZa37kAbnhk7ySCYPc0BLcq4BR26HiODbS+gYTKIPp4z0PrbRUKth3FA/oQJS5Rj+Kej8kWvYtXD8xZ1FdslBV3G6b6xXFCkkfLP69Z8TsY9Zy3h5VfAZfJTfh/K3VWe2Dx3QA1K7aCngRIrlQZkaRoXqijJ85o+0GzwyUEvXi2gvwfNwChccqbWt+Oten8N380sRzCg07SeUSDdmeWL4/ju6/KVyZ0ggou763sXqzviIr5a3Jp9w+a4QEr/z4nZEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VC/6FRyawRSJWRMRvlJXiwUD6N8p7I4/lfMmvkDdtM0=;
 b=FYgdD8pi6dXPwIOOb10KpQe7pFJbiSvjA8fhXPIxfFEuqEvf8bnZdMNtkUbRDw8E1oDo7z/NRaSCh42TfRrsEBHINt7xE8jSaAbt3qIJ37Mi3SzpIZ8CW6jkTvhaNBA0dvl4hO61cxXv2TjFkL+P8kPcRZQXWn0Vj/P3E+5U4FeMACYAx3JlF2SPOzWtsU/hVcRTbZuaIN+q1peShOrLwQwB18qBSHHVCwlXzI2AiVl1p6yo0myQYR3S53/fX7EycmLLRfpiEVOpTE/IfcvZoUmJRo1ydYt8S85zmkcbXgsSLSQFdcjwYM95nXKjzFcduSh+6N7GppfPS+jtqMLjAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VC/6FRyawRSJWRMRvlJXiwUD6N8p7I4/lfMmvkDdtM0=;
 b=bamBG9pfCcNhF/dKdYEm7R3HKBTmSbBR4L+pB3w1p+gWOYkvixok/xHOg1Ivjvooayr34K8anc0SZ3ohSN79n+yaG75/6L9DSRsjRxwJnJqDvj+91MLS0mcZzZvFfCdLOSey+1A1ijMK6/snJc/AeKfCXYIdBdJW58zFd3x++Wk=
Received: from BN8PR03CA0022.namprd03.prod.outlook.com (2603:10b6:408:94::35)
 by DM4PR12MB5327.namprd12.prod.outlook.com (2603:10b6:5:39e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.14; Tue, 20 Sep
 2022 20:14:47 +0000
Received: from BN8NAM11FT081.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:94:cafe::a5) by BN8PR03CA0022.outlook.office365.com
 (2603:10b6:408:94::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.21 via Frontend
 Transport; Tue, 20 Sep 2022 20:14:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT081.mail.protection.outlook.com (10.13.177.233) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5654.14 via Frontend Transport; Tue, 20 Sep 2022 20:14:47 +0000
Received: from AUS-LX-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Tue, 20 Sep
 2022 15:14:46 -0500
From: Mario Limonciello <mario.limonciello@amd.com>
To: Mark Brown <broonie@kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 1/2] ASoC: amd: yc: Add ASUS UM5302TA into DMI table
Date: Tue, 20 Sep 2022 15:14:34 -0500
Message-ID: <20220920201436.19734-2-mario.limonciello@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220920201436.19734-1-mario.limonciello@amd.com>
References: <20220920201436.19734-1-mario.limonciello@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT081:EE_|DM4PR12MB5327:EE_
X-MS-Office365-Filtering-Correlation-Id: 09c78327-86b1-4b4b-6693-08da9b44c3d0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4mMUIvwopZHrGpnA6NhMr8hEWMFo2nOzK16zq2/fVOE6ls2BmMYfgsp/5chmnglBIyXGoSTHQqBFvVkihwyslZGNawd2bjDKXYdr+iFFgloIMAk+xB318DSYj9qHSa6vIkkV2UmOQ0/I0Jmxl1H+iI5VaxHWODIofUNeK7zuwtZGvRBtBCNk1o8vBKjwWV8HrwHL58x6aVaVwiZBu9t7AIz6wVC61hPsKCPu7QKZoelqfvV9yJoDaBqJ/g/54rbiXoPjaAJnHlveGhpIf0FSKj5i+28ZrpNEeHdyL2Nco5aaLXjxU+hwTcZHi0xTiPJcdJ3gGQoSW+M9t1o3UM/pBZUd/WOkMjmi7WF1oQBmwAUaNa5UGSsWKDGJMuCDvyWHRSOOLwSA7wjCG/XLC99tsAaH+rqaBcTtKFJO+MNHfTu5QH7FnaJGR3Ni5KQdJq1VLSCn0FWpYmCOjhOKLkuGBiOs5mchE64J/P4RZOmxh1o3+p5KxfdYB3wlpY1GWDbZp9hDaYQ4I+DIBrNbLLR9ry1CPmAEL6QtVVLIMrzsAU3nJmCs58mmRVm42UbThS21H8yeKUpbwtlaQkPBaA/dpUfJ81rO2Q3uIaFwMD3Xttvi2pH/+bME7KfHSaP9vVvIXmcV4lEGgtU2jAEQAiVDBrgFw0qJt4ZmSRnyaBD93hYo2IZF4d0TGXV4w5MiszXLKmTceBEMEMl1pdBrf3hivSSR619ZFlLl/xbptRBQMfwAYlNHRZ8lzLIu70hVcPe7tG462yihp7ks8ECsx0sOQgE3/5yE9+fCZVgNftfoZ1X12zzCkb6lAi8pKIMUiVgTudpSxW9WYM08zZpVquqsLw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(376002)(396003)(39860400002)(136003)(451199015)(36840700001)(40470700004)(46966006)(81166007)(86362001)(356005)(316002)(2906002)(54906003)(110136005)(336012)(82310400005)(26005)(426003)(1076003)(2616005)(47076005)(186003)(16526019)(82740400003)(40460700003)(36860700001)(6666004)(7696005)(40480700001)(41300700001)(478600001)(966005)(36756003)(8676002)(5660300002)(4326008)(70206006)(44832011)(8936002)(4744005)(70586007)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2022 20:14:47.1017 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 09c78327-86b1-4b4b-6693-08da9b44c3d0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT081.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5327
Cc: Travis Glenn Hansen <travisghansen@yahoo.com>, alsa-devel@alsa-project.org,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Xiaoyan Li <lxy.lixiaoyan@gmail.com>,
 Mario Limonciello <mario.limonciello@amd.com>, Sebastian S <iam@decentr.al>,
 Saba Kareem Syed <Syed.SabaKareem@amd.com>
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

From: Xiaoyan Li <lxy.lixiaoyan@gmail.com>

ASUS Zenbook S 13 OLED (UM5302TA) needs this quirk to get the built-in
microphone working properly.

Link: https://bugzilla.kernel.org/show_bug.cgi?id=216270
Signed-off-by: Xiaoyan Li <lxy.lixiaoyan@gmail.com>
Suggested-by: Mario Limonciello <mario.limonciello@amd.com>
Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
 sound/soc/amd/yc/acp6x-mach.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/sound/soc/amd/yc/acp6x-mach.c b/sound/soc/amd/yc/acp6x-mach.c
index e0b24e1daef3..5eab3baf3573 100644
--- a/sound/soc/amd/yc/acp6x-mach.c
+++ b/sound/soc/amd/yc/acp6x-mach.c
@@ -171,6 +171,13 @@ static const struct dmi_system_id yc_acp_quirk_table[] = {
 			DMI_MATCH(DMI_PRODUCT_NAME, "21J6"),
 		}
 	},
+	{
+		.driver_data = &acp6x_card,
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "ASUSTeK COMPUTER INC."),
+			DMI_MATCH(DMI_PRODUCT_NAME, "UM5302TA"),
+		}
+	},
 	{}
 };
 
-- 
2.34.1

