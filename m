Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B609652CBAA
	for <lists+alsa-devel@lfdr.de>; Thu, 19 May 2022 07:56:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4B6F0E0E;
	Thu, 19 May 2022 07:55:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4B6F0E0E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652939778;
	bh=bpMbww1ws6n2T2p4NmieuxV5mIChcx70EGdRoL2bnyY=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=p3JlVzN7kQOOhvwyOhFnkGglmxC6577Jf5yfxAGgwynUsh6/uTUgAruCpblTviYfm
	 V/X7uWKtnIbahgnNXkxZ2vJ+NH3FNyCG46eGCxacFgQD33RGNe6vkwBUw9tHntJ6CX
	 YHTc0/xGT5NQn3RRfGreTYE4egK76jnESAm0bgK4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A2CD5F80269;
	Thu, 19 May 2022 07:55:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E3A9BF8025D; Thu, 19 May 2022 07:55:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20628.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eab::628])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 370C8F80109
 for <alsa-devel@alsa-project.org>; Thu, 19 May 2022 07:55:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 370C8F80109
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com
 header.b="YDIXyt/D"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Rap1EjOy4iWzmFgs95uAZc4oputobMtvuQX7omOYV9lSdteBrfcQSlHP1tTCGlZ76b2jgZvup43CoXHfnb6pagjtYMXZ/BHdv3f2x88i5XstdnRVvmaihis7XVdVup5iq/5fs2fb/nKRvgf7yKJoirsT56j1+jaUFW6t0Tj0zmmbk1fWeExj07k33f7wMVqvJeBSgYRkSsJ8wlmdviNfRzQgpTAoQHg8RIvAwP9XQ39CxxyR2Z6H/NuJp5sh/PoSZY6xzfd4D1rHTViX+Yl9UuyIEUzABtzbsWFfbC8sWLdbapmTVhjCpg5iJYGl3+CendGvRxDaCR0gMFgBhkVmEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yOk2aClvPoESMMijNKXCKrrHIEULeq1MIK3+ZXeTjh0=;
 b=TpTtjUmEOAEwXoYldijZ9DMFFCWznlgaR1DhPLzsIzIDS9slLJRIwuiLu6zkklQL2mhnOsQxU4kBSoL+9OostWpWs6cr0SOLYMdR6rl55zGekS9VC9OWlCwPEPdozWBsrtIlqy7n3uZEwW4P8ZC09bu3jaUj+Fmx6SwTbShf4MAZzOwnhtVCe53ssTC+grfFBe9czzFhvcd9nswTg0MSdWFXweTblI6EzueS0p5dkGYw29+gpFS8hY3oYW928gqM8sb7H7wN5T2u6vewqr+spdYM+UPUHcCQ6tbmp90m6MHC/e7O0saNni8xWxwxJqMhJ/uXw4R0SvcAxpE96+gibQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yOk2aClvPoESMMijNKXCKrrHIEULeq1MIK3+ZXeTjh0=;
 b=YDIXyt/Dgygxium/gCD0w/18yAVKsw0+mHc1AO6DWUzjgf7wXr+5AdCU38/8GdqQ2HB7JeWANZHTyQ7WtcxNYM0lp6xwkDb2h6YbAjnZz1xFBubbmqlwSkFL//Z+eUzOCHxzmP2ETPjXrTGGNtL1F5wBQSKEaw6sGmRRCEl4aRU=
Received: from BN0PR04CA0015.namprd04.prod.outlook.com (2603:10b6:408:ee::20)
 by CY4PR1201MB2487.namprd12.prod.outlook.com (2603:10b6:903:d0::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.13; Thu, 19 May
 2022 05:55:03 +0000
Received: from BN8NAM11FT014.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:ee:cafe::ad) by BN0PR04CA0015.outlook.office365.com
 (2603:10b6:408:ee::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.15 via Frontend
 Transport; Thu, 19 May 2022 05:55:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT014.mail.protection.outlook.com (10.13.177.142) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5273.14 via Frontend Transport; Thu, 19 May 2022 05:55:03 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Thu, 19 May
 2022 00:55:02 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Thu, 19 May
 2022 00:55:02 -0500
Received: from sof-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.24
 via Frontend Transport; Thu, 19 May 2022 00:55:00 -0500
From: V sujith kumar Reddy <Vsujithkumar.Reddy@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
Subject: [PATCH v2 0/2] ASOC: amd: acp: Add Machine driver changes for
Date: Thu, 19 May 2022 11:25:20 +0530
Message-ID: <20220519055522.1613813-1-Vsujithkumar.Reddy@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 86efe512-8a36-4788-794e-08da395c1e2d
X-MS-TrafficTypeDiagnostic: CY4PR1201MB2487:EE_
X-Microsoft-Antispam-PRVS: <CY4PR1201MB248777BAFC99543013744D8F92D09@CY4PR1201MB2487.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: elD7xNHYRfjgBfBYeVSHsaUT0xCNOt8XQTwMNB50ZiWZgHJlzE9VjF/bHELpsh2qmEXszP6rKcVnDFTLz43Z+0hT04dAd1fo41DEEwG6UDBvlWcLkaKwfj77NZYMvDMLDZ+zrMQ8bToosQK/CavfBNHaTXyxoi/F8Eqd7whBQuC3871c/cnpiD+HDM8lAIv2/L9Zv+E6kBpS0xIE0pZqL6FNTHJEkMas/znsiGuxzLuWTn4iV/OXcr/5UlrP4QA/MTWgPqvxFMmTzvIn9b7RRcFMU17cAvEsIlZE7sYgfa+w/zGjKRv3CSKYLlOYmXCqZgIWB+dcpAQM10d864VeGDH8ckID0jBEItqGWYg54lHswLID8RcIPIVhHEuQXK5GuHHYY8hZ5/3i/ZksnruQ4nqq5MGg/JU1KEMG5aTlGMBTS9vGhB1GWsaNrdZ4HunFDMFco6LyjbBPb/ZDd+JASyVHPFsFCqDfhIkh0xy/m3jL584zTbCjRV4h2OyGsVG4XB6ZI7PhkenxDBoRygYDGf5Pbf3+QQkglz38Q+C5OYsE1k/LfQONRd5S3u9waBnm2/cnIcXUG5mq5gClPEUkEbGnOShDJqQfbBfcHJTqQ8wlV6gZheTPbDGylpz4WpHeUFDvJ3eDLcUMvINIiEpSC0aEvHHHxZmB2NqseCDGDynUY+WeuRlqBNXE7Etr2kfoko1elzeH1j+dwosUPOrn1pV8zS1fARC5fipOzR/b2hc4gqA3Y3RXMvN3kkkr+e3Dq/+m1SLHctR9mHtfLj8WHTfYj/e+JFJXejf0jz2OrNo=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(40470700004)(46966006)(36840700001)(5660300002)(36860700001)(336012)(426003)(47076005)(8936002)(186003)(70586007)(83380400001)(1076003)(82310400005)(2616005)(36756003)(4744005)(2906002)(110136005)(54906003)(7696005)(26005)(316002)(86362001)(356005)(8676002)(70206006)(81166007)(4326008)(508600001)(6666004)(40460700003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2022 05:55:03.1792 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 86efe512-8a36-4788-794e-08da395c1e2d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT014.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB2487
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

V sujith kumar Reddy (2):
  ASoC: amd: acp: Add support for nau8825 and max98360 card
  ASoC: amd: acp: Add support for rt5682s and rt1019 card with hs
    instance

 sound/soc/amd/acp-config.c          |  30 ++++
 sound/soc/amd/acp/Kconfig           |   1 +
 sound/soc/amd/acp/acp-mach-common.c | 228 +++++++++++++++++++++++++---
 sound/soc/amd/acp/acp-mach.h        |   3 +
 sound/soc/amd/acp/acp-sof-mach.c    |  30 ++++
 sound/soc/amd/mach-config.h         |   1 +
 6 files changed, 276 insertions(+), 17 deletions(-)

-- 
2.25.1

