Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B42A652C99C
	for <lists+alsa-devel@lfdr.de>; Thu, 19 May 2022 04:09:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4CC3715C2;
	Thu, 19 May 2022 04:08:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4CC3715C2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652926181;
	bh=nC1FEmtJ41Nkdb8sUkA0XlqpK9CD1KukL1mX4DlPlxA=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Rk/YXV9HTeExPXRtjUaEc0jpL7r49ALBDizoNfbpSZpZP3jOG6uY4oUIvIpx7mmPR
	 TxtQxljyxOfIat8lQgiFbnia/uZ0XZHVhsM3wO7GFw2u8/2SaDHweZ67k2gd2k2N+/
	 Y0wOnQWdN/ngYTQqrneIR5LwFjo0XRBPX5wwqGsE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C2C75F80269;
	Thu, 19 May 2022 04:08:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9E885F8025D; Thu, 19 May 2022 04:08:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20600.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eab::600])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1DA0EF80109
 for <alsa-devel@alsa-project.org>; Thu, 19 May 2022 04:08:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1DA0EF80109
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com
 header.b="nnRr83dc"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Whl2I8BfuPPSU4HDpH32DxNUtZmmI2rW9ut2aGlGBE5Z8X3qciiD2xfN3jba2UEKSmfJ86PhuNQgMdosVuFakAsifxfBQ/CH5VPG2TOiLOz9NrpfW+njspmnSIUnNMn4R6qtolp5JYx7EmVwUSloyPQWp0b/CqkT7Iw0kvZzSZzIvxuOBQPOF1hpoaUXNBzR8rP0b/ktP0sg+R8umln+UAN5OnPFsOlSTFGj1hvui3yDVCX35H0fwR7NTpSVMlFtttlhr063ExpZ3u5ZxsMKjQxQyfHbfShZr/3K9MCVyhOFHpOd9/nBg8JowSmj5J/aHyspJ7PHdNynfxkf5YqhYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UfILI2WSV/Px5rVniM/Byjw+oMLy85/plgW2cdjiQ4s=;
 b=LlEvowGlbSINWGQcEhnJEjVCnsxAZ6gxvdSAXDX1jT/w2J8INnV/+iI2MEiqQsPkJnlLneWvm1EZFKiGRp1dR/asvdAVGXtz663AdmNtziRen/YCZSHBqejtbAfomZ5mSTmzYL7a7qJ4N/39Q665TsHaSvcHwL1gKKf8f/3oFQMokR+agZ+RCJwn72xpHE7y3DkMbcsyrI2XhEgFfsrnOj9qka3qkqQSueXXQAUyA0jZJ3S/utrim/5YxuXJQZxrxt0Bo+bjZlWgYFVa4xfWDrNWmUBbC8iDsSH0bLt3Jtakya4CG1joNpg94HV/jnJ0ZIZcWQ0SP51GQMedta+2cA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UfILI2WSV/Px5rVniM/Byjw+oMLy85/plgW2cdjiQ4s=;
 b=nnRr83dck53zC5l+nDpHgs1PFVpCADoOx7JVmS56LBnbwkPLkVjiHw67QPvCUCc+RW9DrKmhfv0R7VzmL1rVtPb7LY5Ac/YeEdibfewigzFfyAbkwULMa3RAdWwQsKY1rm3RXoRoZzReYk97n0n9DyDNI77qT2xUotWBfZOq0O0=
Received: from DM6PR01CA0028.prod.exchangelabs.com (2603:10b6:5:296::33) by
 BYAPR12MB3128.namprd12.prod.outlook.com (2603:10b6:a03:dd::29) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5250.18; Thu, 19 May 2022 02:08:22 +0000
Received: from DM6NAM11FT020.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:296:cafe::fd) by DM6PR01CA0028.outlook.office365.com
 (2603:10b6:5:296::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.16 via Frontend
 Transport; Thu, 19 May 2022 02:08:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DM6NAM11FT020.mail.protection.outlook.com (10.13.172.224) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5273.14 via Frontend Transport; Thu, 19 May 2022 02:08:22 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Wed, 18 May
 2022 21:08:21 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Wed, 18 May
 2022 21:08:21 -0500
Received: from sof-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.24
 via Frontend Transport; Wed, 18 May 2022 21:08:19 -0500
From: V sujith kumar Reddy <Vsujithkumar.Reddy@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
Subject: [PATCH v1 0/2] ASOC : amd: acp :Add Machine driver changes for
Date: Thu, 19 May 2022 07:38:39 +0530
Message-ID: <20220519020841.1607723-1-Vsujithkumar.Reddy@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a627b3c5-bbd6-4f54-f5d0-08da393c7376
X-MS-TrafficTypeDiagnostic: BYAPR12MB3128:EE_
X-Microsoft-Antispam-PRVS: <BYAPR12MB3128E9BEB5306FE2AEAB918D92D09@BYAPR12MB3128.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SA70lXNTVVX7THm1Du3CMYuH4FW/MlcI/fWEHd4YMwGPvLDt6fx8Z+eto5mHy6JjN5nJ+lkfdSSnB8bnapD+c1hgkWPyhk93Iu9xX06aA2Bi7O4IdqezGcx5LAQGGEDB9UdxP32m7/b7wKCz5AdnymR9gqlzn459Y6R4TtIG0q37jkLUPnUF6Bbb+o/nGckaeYVeWSTptR/Xiw6th/WCs7bkjj8u8gxJRNS+aroCmnE4sPFMXBDRnMo5bvF8+EAKNxhCE+Zjh/pf69J+eb2T6GYmC+5xD8FUI0YbeMhEfQUl/9dbQUwkrca43IzCHdYS32Bi7yjfYyYsCVTD5UMMbdfEODtB1FfpbMjnrgOuYAUxmHRDs+JqN1h+9r+P+P10uBCU7WDqBLnbb3BgyWhjFAWgtZO+rlrEAaVMWZeIEgR0wme1Sq+AWCpqNk5gPcDFVO6DHkSKCvKLFerMEhhIfbz9kA7Xb/SSg/QOn7nsz1AnaSFfld8Z8BWobdw8C5jE7E9IDrqd/MgGLKvXy8KpXQhMKuSzISsN/7YGv7cOFiehIY23owcRg8RddNcYlb4OVb5Cr+I7F0nPSWx4CD3YS+Q0T9Uq40YqpYrOLR/vK2KxTQa3KAbnwwPbmc8OHQn6Tnibd3P1aLtezIoHOIwFimUaPKaLt8Ns/Xi2Vyv8lWSEV9T6dJlEgBgEgJM9kAjdOQzZDRqIEiSkI4b04p540dIonaJ6M5d7cV9pxJ8xV4qPimWRp5sM7kOx24NdKHXJXvTNb6BDAbk+2h1UcZuMSEbq93QgVghRfuC6Nrzhljs=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(36840700001)(40470700004)(46966006)(47076005)(316002)(86362001)(2616005)(7696005)(82310400005)(26005)(40460700003)(54906003)(4326008)(83380400001)(70206006)(8676002)(356005)(6666004)(81166007)(5660300002)(36756003)(426003)(336012)(110136005)(8936002)(186003)(1076003)(4744005)(36860700001)(2906002)(508600001)(70586007)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2022 02:08:22.3249 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a627b3c5-bbd6-4f54-f5d0-08da393c7376
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT020.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3128
Cc: V sujith kumar
 Reddy <Vsujithkumar.Reddy@amd.com>, Basavaraj.Hiregoudar@amd.com,
 Sunil-kumar.Dommati@amd.com, ajitkumar.pandey@amd.com,
 Vijendar.Mukunda@amd.com
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

Add Machine driver support for nau8825, max98560 and rt5682s,rt1019 
combination

This patch set depends on:
	--gpio patch
	--https://patchwork.kernel.org/project/alsa-devel/patch/20220516160619.17832-1-Vsujithkumar.Reddy@amd.com/
	--https://patchwork.kernel.org/project/alsa-devel/patch/20220516160619.17832-2-Vsujithkumar.Reddy@amd.com/


Signed-off-by: V sujith kumar Reddy <Vsujithkumar.Reddy@amd.com>
V sujith kumar Reddy (2):
  ASoC: amd: acp: Add support for nau8825 and max98360 card
  ASoC: amd: acp: Add support for rt5682s and rt1019 card with hs
    instance

 sound/soc/amd/acp-config.c          |  18 +++
 sound/soc/amd/acp/Kconfig           |   1 +
 sound/soc/amd/acp/acp-mach-common.c | 228 +++++++++++++++++++++++++---
 sound/soc/amd/acp/acp-mach.h        |   3 +
 sound/soc/amd/acp/acp-sof-mach.c    |  30 ++++
 5 files changed, 263 insertions(+), 17 deletions(-)

-- 
2.25.1

