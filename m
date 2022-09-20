Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B9095BEE55
	for <lists+alsa-devel@lfdr.de>; Tue, 20 Sep 2022 22:16:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8C57215C1;
	Tue, 20 Sep 2022 22:15:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8C57215C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663705001;
	bh=rFAY7xwh5KQpgJQLWpqFQ7dhccyYmzMLvmc4R10MbjU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=C/vh5ltewJ+j+V3zOpbsXzoPRvgQC1am0Rt3ouL7/MeLYaTmy9Cjm7Yr5Tyqwc2tY
	 /waVi0dhWE8ku1MFi/Z3XsfuKu4nS0AT1eZVkuZhch3AqWlOI5mAzn5tymOPQRMcLe
	 E3vXhdVX1L7poZqeVrBold/3sTO4LDWoKyNw+0bI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 468DEF8053A;
	Tue, 20 Sep 2022 22:15:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3C9A6F804D8; Tue, 20 Sep 2022 22:15:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2076.outbound.protection.outlook.com [40.107.220.76])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 09878F800F2
 for <alsa-devel@alsa-project.org>; Tue, 20 Sep 2022 22:14:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 09878F800F2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com
 header.b="rbT431Fq"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nJxDtrBq8k/Q+UmtxdhgybnaLArH0W/sOAIjFZ/g3rJzj/synsiTenJymRc+NcuzghUtSnMknFowYzeM41q/HsfvZ9O+REILVdWz3PNzfxw3PAgMmAKz/ai7gisDEOL/t5u9lhCFpntJzUp4NMXY56gjh869n4dkV2U2usD757YdaqBxCXnh9N9ol9AGiufT2ZjRQ0e8GmZrQjq/Jenjqh5+J796TpG2nccVCsakv7tuAsjTyL/ionKuYdkBeM7rrCr/5CnfXwpz53rtgH7Dvt8nQ+GaD3xw1TlE7n/cvxbHcCH1r5sIw6/jIlhFik40NGRDCCjL6eb244y7g2/CtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3rJ3sNGeSi2CiODjEOTLym8GZM3kHeZ7oqJNIfNhJhQ=;
 b=fmzQeNGWmWkdAhDErnA5Zz+2kh/CNqB5+46PpVhgSVkM3cF6MKY0MVUIvlRfGxq8UsHkhFWWFz+Ak/JpVY+HMBKa3myYsF67X5qp6Gy0coyHLzcV2CgETi8ZvdKE2iISmd3KXcQbAD5iDv0B1mVFFBFOLOtJrJHxeSMzBPxwiXlzcJNEnfZZCseTlYRH7SFC5bZHG7d5m5VjTLJu+19A2WmVJB556UTpKZXl7DYXa3vEGeIFuIwEwxeEiGrVAk2l3eye2V42Zo2rvequmD4xlAh5U52sxbY60F2znUS+LwnMoy9APY/RY5JcgAJT33fe7H4RSk5mF2G2qFRhcAlJEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3rJ3sNGeSi2CiODjEOTLym8GZM3kHeZ7oqJNIfNhJhQ=;
 b=rbT431FqpdDJUvzXHycuMfKurP05jq061UkY7kgijNVHM2l7qb4Saf0/fyg9jaEOp/1xMQ31tB3TGrCGmoSY4q/jz0JHdqz8D9qPw60D8f3x/nfGwSf9NzVrskBXWNy6tTcF+tfJZpNvzUL85+64OJZBdxL7u/vegJC7J5P67bc=
Received: from BN9PR03CA0250.namprd03.prod.outlook.com (2603:10b6:408:ff::15)
 by PH0PR12MB5467.namprd12.prod.outlook.com (2603:10b6:510:e6::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.14; Tue, 20 Sep
 2022 20:14:48 +0000
Received: from BN8NAM11FT091.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:ff:cafe::ca) by BN9PR03CA0250.outlook.office365.com
 (2603:10b6:408:ff::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.14 via Frontend
 Transport; Tue, 20 Sep 2022 20:14:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT091.mail.protection.outlook.com (10.13.176.134) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5632.12 via Frontend Transport; Tue, 20 Sep 2022 20:14:48 +0000
Received: from AUS-LX-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Tue, 20 Sep
 2022 15:14:47 -0500
From: Mario Limonciello <mario.limonciello@amd.com>
To: Mark Brown <broonie@kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 2/2] ASoC: amd: yc: Add Lenovo Yoga Slim 7 Pro X to quirks
 table
Date: Tue, 20 Sep 2022 15:14:35 -0500
Message-ID: <20220920201436.19734-3-mario.limonciello@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN8NAM11FT091:EE_|PH0PR12MB5467:EE_
X-MS-Office365-Filtering-Correlation-Id: fcc26b77-2972-4f66-a1e2-08da9b44c477
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bih4WG6ty3ZpJzedDIoigegADBtTG+spQEN0D3UBSfFlf4BqhXmAGbj+l4Kgf9mV83bi699FprsLqPRwwoVusp31wQwPfERFXSozcaKhYiQnEHOu94Hu6L9/xxTLYt49K4FPlPib/U5Z2NOc+34NQ7wKSZGktzVEuo0x5KxLYzbppubrnliNq6TtdmhRs8O4wHHz2KvAhzyReydbQmC+dstBOyzOfo2NrFwojIV3jSugcarGI8Hf8H1IVrSLdoGK/XqLP3JDFB5K86YUOjvW/hrGWXv5BE4J1qGmUF0k80S2jLodct9MmeyBL9ySj6xXMoXlO67PxF70s996tKlG/0ayhpnRI0AvXV0vSZUcXrpR1cxTH91uUOF3UAlBeWh6ieUKxlky9xAQfUi0Ki+ytHZpOpqtnPKLphbQ6jYcIyxPLHSzdJzX6/tpGyCDoCRQGhS07lE5vETX7yN+w1Qa7WJXBWsCdz8iXMRuPUuTKDt2QjkQ5vHQXqqKD27T30LO2hLG4tBZUhINoHEraf4YO7BAtBgJFtgJ7VA7mfJQeeMSHPlYPHc8oEGRdyHSd5g3PeG1x/Yh2PK3/ibXhADcDabU8AsaCD3qXIfuUlAW26/qgfPZib1PS835g2kWITaBOHhfUA6MxXqwktpLhCEMMWYaPIOhGCuSlqmGz/kicZee5VGft+5MnTeovfO+zv2Y6apYI1FO87wUvgwlQFeAYrrs9gcz3cS+BNgZe2pavO7U+BpoOVfErZMj1marX1WM9enJTI20BD1NiUCvv7qoKFU+EHT8cAoSC09/sRDr4c1GxDU9cIXpGOlH+j51ZwD5ZM0XgrBJGHRuSoNAktW54A==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(39860400002)(376002)(396003)(346002)(136003)(451199015)(40470700004)(36840700001)(46966006)(966005)(6666004)(86362001)(478600001)(82310400005)(8936002)(41300700001)(316002)(5660300002)(4744005)(44832011)(8676002)(110136005)(54906003)(40480700001)(4326008)(70586007)(70206006)(36860700001)(356005)(40460700003)(81166007)(82740400003)(16526019)(186003)(1076003)(2616005)(7696005)(26005)(336012)(426003)(47076005)(36756003)(2906002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2022 20:14:48.1821 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fcc26b77-2972-4f66-a1e2-08da9b44c477
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT091.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB5467
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

Lenovo Yoga Slim 7 Pro X has an ACP DMIC that isn't specified in the
ASL or existing quirk list.  Add it to the quirk table to let DMIC
work on these systems.

Link: https://bugzilla.kernel.org/show_bug.cgi?id=216299
Tested-by: Sebastian S <iam@decentr.al>
Reported-and-tested-by: Travis Glenn Hansen <travisghansen@yahoo.com>
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
 sound/soc/amd/yc/acp6x-mach.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/sound/soc/amd/yc/acp6x-mach.c b/sound/soc/amd/yc/acp6x-mach.c
index 5eab3baf3573..2cb50d5cf1a9 100644
--- a/sound/soc/amd/yc/acp6x-mach.c
+++ b/sound/soc/amd/yc/acp6x-mach.c
@@ -171,6 +171,13 @@ static const struct dmi_system_id yc_acp_quirk_table[] = {
 			DMI_MATCH(DMI_PRODUCT_NAME, "21J6"),
 		}
 	},
+	{
+		.driver_data = &acp6x_card,
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "82"),
+		}
+	},
 	{
 		.driver_data = &acp6x_card,
 		.matches = {
-- 
2.34.1

