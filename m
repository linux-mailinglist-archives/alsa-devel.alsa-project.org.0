Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 598B85A3913
	for <lists+alsa-devel@lfdr.de>; Sat, 27 Aug 2022 19:03:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F3EE71620;
	Sat, 27 Aug 2022 19:02:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F3EE71620
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1661619819;
	bh=OvCM8+jHAKicG03G1CLNLj2GHS0oYNFl4k+OMvwPuGQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OX1MC3UVemcQn8JMUiSFz9I/vgYpbWmMAfDbZLYVWl3/8/GbkMOeSauF5X0Gz13YS
	 TRVuTnrWZHvGUk+AD2FivG8g3cLetH8+Bvi870QxE8h7mvrGzgIEm2Lf0z1sFNOQp+
	 d5UgyVV3PikJ42Wm1ZTO7g6if7SFRXYs9BYcgSSQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 15B1EF80563;
	Sat, 27 Aug 2022 19:01:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B7FB8F80563; Sat, 27 Aug 2022 19:01:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2047.outbound.protection.outlook.com [40.107.94.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9C501F8057B
 for <alsa-devel@alsa-project.org>; Sat, 27 Aug 2022 19:01:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9C501F8057B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com
 header.b="wdwASXuQ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eL9+mNzyMA6uUwhV6Z1Fq/AYuEQGyx077PwaFNEziZM226+r9e++UgSZXjIACM72mxb2Ld/FneoQqhRmDN5MD6UIkJRe266I51Ubqm5ETvH16RcVGppuLbLgK/DQ5L171lL/pGruvS7m++peiBAaPIs8lT6p/9jposd0YFQL0wfX7lnZPJzduurWX+363Z3DBAP/5IKIeszg8Rr98H+cVxEpQfZhlii978pqcX3c5JTiIBx6woNuQS/cL3HaLA/7XqwkGXsQL1xNKOLKi/hapDFP9MGj78Jwb4fronsIKz/hikKIb/HHvHBZBQptfBXECz2cQAXYkMElim3RaVFagg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uPdOrEjLaJBYDsM63g08H5HJ8KJyoqYWsQZx4mpXhG0=;
 b=RbrUE1C5omVxuuPrZajhQSEEMNS33yDAF3p7H2V+zalRmzWpLIN4Dv3lQIIMxjk85U0kAF1vThAevJ2AVwIKWAPXNnm0+1/EDJqMa+gHFIxh07AnESw937g2DPqzRWDGTL5yrEc1yzxWP1u3SuFtKfC69VT1WzNHdn+CXH3+a3+GSWfnwfhICqUQGCQzdx6YhajQHxiCiHDnUSbPi8X91E68dpPqDMu44UNWfal9v+UtCsy0zcXcNW9rbJvSWzO7KThK06qfGtbn7yeeCJue/9juZfKH3Ts7hZovxSnBZBmJrFIgJQdC154FMJjocqPFXAxC44Alu6YjANSsGMPLLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uPdOrEjLaJBYDsM63g08H5HJ8KJyoqYWsQZx4mpXhG0=;
 b=wdwASXuQ1kjqTy+uiXntdbHDyyC7Wt2F1Apd3UUdTY8YOsoAKb7LYQ4rIPQjf10BmJnplbJ4Ziq6PH7h0oQziAwf0J55tJhyXkE8Z3RPvu8NXetTITwHEY0+gqjjCjeenVvnjDklqIqUwq9qFvlgFjl0e03WGXJXJ0Tcn6AoVLU=
Received: from BN9PR03CA0656.namprd03.prod.outlook.com (2603:10b6:408:13b::31)
 by PH8PR12MB7351.namprd12.prod.outlook.com (2603:10b6:510:215::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.19; Sat, 27 Aug
 2022 17:00:50 +0000
Received: from BN8NAM11FT070.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:13b:cafe::b8) by BN9PR03CA0656.outlook.office365.com
 (2603:10b6:408:13b::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.14 via Frontend
 Transport; Sat, 27 Aug 2022 17:00:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT070.mail.protection.outlook.com (10.13.177.50) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5566.15 via Frontend Transport; Sat, 27 Aug 2022 17:00:48 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Sat, 27 Aug
 2022 12:00:47 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Sat, 27 Aug
 2022 10:00:47 -0700
Received: from amd-B450M-DS3H.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.28 via Frontend
 Transport; Sat, 27 Aug 2022 12:00:44 -0500
From: Syed Saba Kareem <Syed.SabaKareem@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
Subject: [PATCH v2 11/13] ASoC: amd: create platform device for acp6.2 machine
 driver
Date: Sat, 27 Aug 2022 22:26:55 +0530
Message-ID: <20220827165657.2343818-12-Syed.SabaKareem@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220827165657.2343818-1-Syed.SabaKareem@amd.com>
References: <20220827165657.2343818-1-Syed.SabaKareem@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9e475aaa-04e3-4493-b635-08da884db09a
X-MS-TrafficTypeDiagnostic: PH8PR12MB7351:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LEybCL12TcXbIANlm7qlx8tiXJewdNcrDJbrbzCdaRraQuXyPSFkeOsERTNe0UWwekpB3GGcIj8qKiHWhS5Z5EF0YEHyQPuIFqps/Jcy+W2m6jT/AP/nKDwMR5xHz4J4fZZa05ZnhpPC/v7kaKTq19hfoMoRo56Oe4TYuZzbpvatLPoUoH8ROcXoQHvynhPx49PSJsn43/sBFTqRChdWR6u7Vixz5sKjv3uFLAz7n1BDMQaLnUzGzdB0AiWb7PV+IsjhbV37qipjYH/I7og/TsoVw2/OcRHqXi4PDsnX84sP4odjW6fbZ8R0uFdA4CnPmGyGiysMBpQLaJ+uzPsTeYbmaoyDJ4dVYbx+H0m6+Sn9O5baaEdRBsXFqkWBeXEk07Kta/lKkAZugEiuSs1CINVx9DDhxu1YzuewOU8RUvyiMHyzaf2R1BWV/918BQ3IfAOW2lL96010hvzYgYQENJJo9olmAC8ElQVvGti50DkvEM1Fzj25EvWuPjE76UEuIxT4Vwkh/4GPxNpt5+bELzCxqjXZHkgNwP0kJAvxD48SpPh3DsSGrnafJImsKF1nIU4gWmshzCnT+4jBfIiHi4tvGHwO4MOC5UCB4i8Y9xrCOdkVjUKhlgrdVB5JkukqLAh+18sdIy09O4+rzrn+IxnvOxEY060N90IHPl+m2lKL2dAMxXOh2Z8og7B979VWy6lAoI8kzKSyLK0mZIN1UY927Ab7rxcDDPaTmicG8svcYrjVOwA7Gxt7dv5vAoSouW6rU57/JRX7v5YKJspPKt9FRIxqKtMyRM1i+OePMUnbiqqMx8YYXYlHqcSjhXhX
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230016)(4636009)(39860400002)(376002)(396003)(136003)(346002)(46966006)(36840700001)(40470700004)(356005)(478600001)(82740400003)(81166007)(4326008)(8676002)(70206006)(70586007)(36860700001)(86362001)(316002)(36756003)(83380400001)(47076005)(426003)(336012)(186003)(1076003)(26005)(6666004)(7696005)(41300700001)(40460700003)(82310400005)(110136005)(54906003)(40480700001)(2616005)(2906002)(5660300002)(8936002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2022 17:00:48.2353 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e475aaa-04e3-4493-b635-08da884db09a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT070.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7351
Cc: Sunil-kumar.Dommati@amd.com, open list <linux-kernel@vger.kernel.org>,
 Basavaraj.Hiregoudar@amd.com, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, mario.limonciello@amd.com,
 Vijendar.Mukunda@amd.com, alexander.deucher@amd.com,
 Syed Saba Kareem <Syed.SabaKareem@amd.com>
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
index 89ff14007e5c..75a07445e44b 100644
--- a/sound/soc/amd/ps/acp62.h
+++ b/sound/soc/amd/ps/acp62.h
@@ -10,7 +10,7 @@
 #define ACP_DEVICE_ID 0x15E2
 #define ACP6x_REG_START		0x1240000
 #define ACP6x_REG_END		0x1250200
-#define ACP6x_DEVS		2
+#define ACP6x_DEVS		3
 #define ACP6x_PDM_MODE		1
 
 #define ACP_SOFT_RESET_SOFTRESET_AUDDONE_MASK	0x00010001
diff --git a/sound/soc/amd/ps/pci-ps.c b/sound/soc/amd/ps/pci-ps.c
index 075d9a23205d..dff2e2376bbf 100644
--- a/sound/soc/amd/ps/pci-ps.c
+++ b/sound/soc/amd/ps/pci-ps.c
@@ -233,6 +233,10 @@ static int snd_acp62_probe(struct pci_dev *pci,
 			pdevinfo[1].id = 0;
 			pdevinfo[1].parent = &pci->dev;
 
+			pdevinfo[2].name = "acp_ps_mach";
+			pdevinfo[2].id = 0;
+			pdevinfo[2].parent = &pci->dev;
+
 			for (index = 0; index < ACP6x_DEVS; index++) {
 				adata->pdev[index] =
 					platform_device_register_full(&pdevinfo[index]);
-- 
2.25.1

