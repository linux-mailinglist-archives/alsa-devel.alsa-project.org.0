Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C683F651B7F
	for <lists+alsa-devel@lfdr.de>; Tue, 20 Dec 2022 08:24:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CC3272ABD;
	Tue, 20 Dec 2022 08:23:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CC3272ABD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1671521045;
	bh=X5f6CgeXtMTque0g70d/VtQ/Bl9/wVUA6q4HmMZ9+yQ=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=ZPPkXaF9AIbZeCj3exJozdxIhvboxVnG0FAmGNJLxkTfHbblsW1klz+dJjP9utsxD
	 ByYlMmWOa5xi54dl2mpcV2a9JRXwuW5byBGkfg7AkHhVsm+CQD66TlGuy3uopMnbSN
	 81d38iV1YKc8Nd3UV8bVSFpCfwrEMmgAKMWKzvhU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 55A36F8045D;
	Tue, 20 Dec 2022 08:23:08 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B5999F8045D; Tue, 20 Dec 2022 08:23:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,
 SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2060.outbound.protection.outlook.com [40.107.243.60])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B5F0DF8026D
 for <alsa-devel@alsa-project.org>; Tue, 20 Dec 2022 08:22:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B5F0DF8026D
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=FlH+sSnT
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CR6Rd7c+SZV1eI2JHILI6aQVjRJkeaz51CvCrsbu3seAg7iDwL1eRvGIw1SK9qg6WB+itgkCZQK9SblzIWtOo7vcA5GTfdEGhw1yi0INAMU4CO+kgqCHi56v7bEHr/lns3e/ZnmPuI7lWt9WfPd1YUEf+El85VM7hKKpmSebEfMt34rUhU4M3YN3As3zEUjM8Mcxx0wMi7nlBM5niGpkd0bNG6zKTwbY67n0qmcxxOrVed3sLZVeib3NfBV1NviVC1u5oDcNOdXtw4BvUZxfBXxk5bGE22Yd7FQePc/EmZqxFz7VSuwEDyjeHYGHKHR7c9J7c8EjNT/EF0v2xnSCkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iw9+gyIcnPnd6JFInGZBTBk+a5mGCbma2VMzHxuxbm0=;
 b=fD9s39q8I1V/DQ8DqWqAt91wKbXkREBEpl8Yg3T/PLXNpPWMkfnx7JnqM3m3V2tBvWLG9vKu8VWemNPNXFEXQN8YsgU38DFCU580cBSq9F6QIjO5PUhDjiDqULY8YpZSRDxJylrsGyeTUDKTLcnKMjF2aq3Skpv79CxzKxsDB8cJ6jp3WChOEIUQronLJzYPTzyB33RThrRV6mRLglh5p7FhTzTMBHJMY3+Jx1vVqLqQsCADqf19ygpAfT3Vf+fAHKP62kQBJ4U/fkKMmzh8XeyGmcRqmFNr4WxjNzQzxbLsjDUQmm8/JWAC0LISoCQ952xaYiZXTJ8ATdP9Sz6HTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iw9+gyIcnPnd6JFInGZBTBk+a5mGCbma2VMzHxuxbm0=;
 b=FlH+sSnTSZbSVXqHodYB+891X8VmbkjibUURvOAkXfvPCPbnrR9jprmQvmb45WKSgQM8t47a2C+79PS/svTOxuWa1jaUdxXpEaH740iiJiKPioo1HeIfztBdFu63fdJVjmalNKg5F8E6/z84amrsDbmCiCJiiFDuc+QAKxlQSjo=
Received: from BN1PR10CA0019.namprd10.prod.outlook.com (2603:10b6:408:e0::24)
 by IA1PR12MB7616.namprd12.prod.outlook.com (2603:10b6:208:427::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.16; Tue, 20 Dec
 2022 07:22:54 +0000
Received: from BN8NAM11FT080.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:e0:cafe::3) by BN1PR10CA0019.outlook.office365.com
 (2603:10b6:408:e0::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.21 via Frontend
 Transport; Tue, 20 Dec 2022 07:22:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT080.mail.protection.outlook.com (10.13.176.82) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5924.16 via Frontend Transport; Tue, 20 Dec 2022 07:22:54 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 20 Dec
 2022 01:22:53 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 20 Dec
 2022 01:22:37 -0600
Received: from amd-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34
 via Frontend Transport; Tue, 20 Dec 2022 01:22:35 -0600
From: Venkata Prasad Potturu <venkataprasad.potturu@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
Subject: [PATCH 0/5] Add tdm support in acp machine driver
Date: Tue, 20 Dec 2022 12:57:00 +0530
Message-ID: <20221220072705.1456908-1-venkataprasad.potturu@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT080:EE_|IA1PR12MB7616:EE_
X-MS-Office365-Filtering-Correlation-Id: 9acdfce9-7ce8-4a25-49e1-08dae25b02e2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hkaEt1/D7aS5RqzPXdok9ZOHDysotcYqChYBmcihnEVsmlXS7LoS5XYP7C/CmT/w9wUKA52JE9EY6DXHDetwdm/l/2fhfHY2ba1/pB8WwRjAT8qKfPa7PcX1RAwYa8sE5fa2UMCnN1NLui8atsiNaxKHViAXCCKtu328QjqqhFWhfUKPTyIDO9qXnZOv7qPQDBLiMJlYIVBgjHNmHApojdtBODcUPGDRChzqNJU6VCA3UJrZDBGOlVFxJmRAT859bXOAQ/8ecEwWJHN3IKn1z/KU+tpCIGIwPcGhRiLo0d0vv0wsvWCoU+DBLR67Vj7kerBbvflPH60yx7338BSwEGAHDLLpaEKNNaxJMr/tvCbMMGON6KZ/M017wuDil9tIoqAwExS1Bk3zr/2tgJKsy6jAzJxE0csurLIIZPHTynEv5lcDezMYbxGV6BW1rAlg1vEVJ+Wug69TX6Rwjf92t7y+pE8kinDS+/+hr6WqpkFlScYW9BSi1OMy/+W2bDqJnvzqjBX1BWVQSNbxgBOqMZA/o7cHbZ6vz5x8DvtssT5Qj7/HUiTo55YxOcfsjl/eul7E1zjyNpiohIjIU1Lu5Z7qo4/MBfisY2fD2IKw+zN2ObvzQyAfKEJi+D2pNlYv4Ni8rN3b2M/nQJGpBp5MDBqsmyevYx6vnBqAgBspRSwMgJlTNRLiqF88JdJ1gbq0IgV7gotrLJ00lUdYZZ2Z21/xGzzOUafJzNWIsMeI2mE=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(39860400002)(376002)(136003)(346002)(451199015)(46966006)(40470700004)(36840700001)(70586007)(40460700003)(86362001)(70206006)(8676002)(4326008)(316002)(36756003)(8936002)(5660300002)(2616005)(1076003)(82310400005)(7696005)(6666004)(41300700001)(186003)(36860700001)(26005)(356005)(426003)(336012)(47076005)(83380400001)(54906003)(40480700001)(4744005)(82740400003)(478600001)(81166007)(110136005)(2906002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2022 07:22:54.4319 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9acdfce9-7ce8-4a25-49e1-08dae25b02e2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT080.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7616
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: Sunil-kumar.Dommati@amd.com, ssabakar@amd.com,
 Venkata Prasad Potturu <venkataprasad.potturu@amd.com>,
 Basavaraj.Hiregoudar@amd.com, Vijendar.Mukunda@amd.com,
 vsujithkumar.reddy@amd.com
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

This patch set is to add new cpu dai, refactor dai format
implementation and add tdm support in acp machine driver.

Venkata Prasad Potturu (5):
  ASoC: amd: acp: Refactor i2s bclk calculation
  ASoC: amd: acp: Add new cpu dai's in machine driver
  ASoC: amd: acp: Refactor dai format implementation
  ASoC: amd: acp: Add tdm support in machine driver
  ASoC: amd: acp: Enable tdm support for skyrim platforms

 sound/soc/amd/acp/acp-legacy-mach.c |  13 ++
 sound/soc/amd/acp/acp-mach-common.c | 275 +++++++++++++++++++++++-----
 sound/soc/amd/acp/acp-mach.h        |   4 +
 sound/soc/amd/acp/acp-sof-mach.c    |  14 ++
 4 files changed, 256 insertions(+), 50 deletions(-)

-- 
2.25.1

