Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F3ACB490809
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Jan 2022 13:00:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9D37D1711;
	Mon, 17 Jan 2022 13:00:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9D37D1711
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1642420859;
	bh=o8Hs4cbLeYqLFf+7n8mV3nIuHxG8G5YwpLRh7qllHvw=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=C8LlAnC4EKN5BV+jTUJwNU7pQRoRKa8QGeCC8crdjSt6+GqMMV/CcW85Sr5MLIXqn
	 G71LSw/Pwj03NTPe7J7oisBWhIdpcn7xgf0o+rA46XzIQyuXEoTYGS7GxBx3J4ad3E
	 AQ/TyQ7jsjZTs1iYj21z/f8qWzYOV1jUAO2uzNB0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0FF70F80254;
	Mon, 17 Jan 2022 12:59:54 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 69099F800EB; Mon, 17 Jan 2022 12:59:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2087.outbound.protection.outlook.com [40.107.223.87])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1163DF800EB
 for <alsa-devel@alsa-project.org>; Mon, 17 Jan 2022 12:59:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1163DF800EB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com
 header.b="YFe+/HJQ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aV8eaPYkl3kCFX4v2D799DNFrh3CyZh7BCLW/ry3WMdHhq9L0ID6VJv7sp0wrv/c3N4fsy7GWUYSOB02b4vLjslORqC2DuB7yM6nGfZS4jFrIA8341kbqlSJmdUZxoD5fZlJ56uHtRs+ofPAUeMR3GkPjZhG9+oalocicBZuE8LvnhDf7wt01cc/XTrTl5Kp1Nw7k1g0N4hC+I6wsjNCqWhoxOsyANAyA2On+h+bS3eH3iGAOxDZxUObQGnsjElNV92+PrxM7rlF1eHx+hD936V3vTXtXL7gdb4L9wy0NP8hlPrJce+JqkuFfIQtkRb5HUlcEb5s+9H9YVp3Qw7gWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HSd+BjI1aq3TDyk9lWewyYdn6nTNCj378xiksprPgXs=;
 b=bY8a1fFTuErCVNH6W2VIqM3YBHGyjNKPgSYAF4QDnv2YmT3K6hOArOUqvQ2UgN/5ukg1/SsyOkPgBDdFPQSEbB1Bix2vYcFHQbePexLDz57ic0tWe2L7P6slbNkxkpmWOTakm82HeYW2HssPZfcbZ5nVSjHB7UCP0uWZclbicLcrvd67wQ1/3JiuIztsGQsItUpJkV3KnbN4bwJlbmR2+7ipWYAYTQniL8Ragt1DG//SQaGjVA++li1Gid7OgYn+4VDrvKIv4Jhm6tAd79Be/JvqkIY+KF45DsaK3QN/fVR1XViThTmCWhgGlYLhpIvgeoJqjwhjiVFxKZ7Cv7qCsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HSd+BjI1aq3TDyk9lWewyYdn6nTNCj378xiksprPgXs=;
 b=YFe+/HJQwEfOKS/+XON6/0mRHo+xUPKRd+cg7Ee8tIiWR3VXXyE8ZS1TIWIwYOl0IC6PdKgPCzRov2C1Chnv/qtjdM1q8/Qxx/3Y8jC0mdM6A2w4qRmGYkwBZwHBvm/gypzVulvvMciG4/kubHfxZ51zWsqsRNC/d8mmsstSCCw=
Received: from MWHPR14CA0054.namprd14.prod.outlook.com (2603:10b6:300:81::16)
 by MN2PR12MB3424.namprd12.prod.outlook.com (2603:10b6:208:cc::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.11; Mon, 17 Jan
 2022 11:59:40 +0000
Received: from CO1NAM11FT057.eop-nam11.prod.protection.outlook.com
 (2603:10b6:300:81:cafe::42) by MWHPR14CA0054.outlook.office365.com
 (2603:10b6:300:81::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.10 via Frontend
 Transport; Mon, 17 Jan 2022 11:59:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com;
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1NAM11FT057.mail.protection.outlook.com (10.13.174.205) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4888.9 via Frontend Transport; Mon, 17 Jan 2022 11:59:39 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Mon, 17 Jan
 2022 05:59:38 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Mon, 17 Jan
 2022 05:59:38 -0600
Received: from chrome.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.18 via Frontend
 Transport; Mon, 17 Jan 2022 05:59:36 -0600
From: Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
Subject: [PATCH v3 0/6] ASOC: amd: acp: Add generic PDM and PCI driver support
 for ACP
Date: Mon, 17 Jan 2022 17:28:48 +0530
Message-ID: <20220117115854.455995-1-AjitKumar.Pandey@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f36b578a-89f2-40ec-5ea2-08d9d9b0d74e
X-MS-TrafficTypeDiagnostic: MN2PR12MB3424:EE_
X-Microsoft-Antispam-PRVS: <MN2PR12MB3424A6DDA9B4C10BB386456482579@MN2PR12MB3424.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3631;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VYHWvNqQAAzOB7M+jT9bs3xqkBA8vHLWQ3FxZOKPoeL/g3bLpv9qry00q1M1lHkPxCldctCIWl7yuqDp6eTcUTadzlCJrAfSt91gsWDebvGDfkUKD4QIlja73yfN1QOg2Awk7JBqev+Ld7Rh6h3jTZP0pQ75mdP7aSriM+gZJlW04Kb2duuzTD53aTHqetr45FWNsubyg5RlcHoc1DMg1loDolTZbSFWoitPPA9kDhJmgWuL1IUMUAcC4X56zA0SZio8Pl/hvIXiZgCRjgfFpDXDopiIJxaXo8MqU4B14btzPyQ4UOQKykHAZXuYOuFok5Q68q2jVBO0nFnYkW6zYZRU16bZFFWHS45rUuDorKLxAHTrI/sRlkP9X5IxNPOAONP4JGpkpZeL31HmiOApK9OEjYiq0xfw4RTdETrmc0opZeg3zpiw/r/J2tK+OxBWWFe7iBQWaaiiETGAXRR+SFenI6lHkG+KE0uweAXre9KcpQW7rSkhnnDGj2Ygg/KbbNZYPnrN+FOGXfcJU9BoOa6ycD4aHSyQtEA1vzqKOUWUa8f8+reB6/eC6AZGm1wyUVF/GazNNyxRnPmLIsh6AL7LLkj+d4LRo1Eu100ePITeHIxwWAt/UomXKFakWZisBCknNF6BBfYSFD4CP/mqD0OLJOqTRVYYsRoavtd+daYI/UaJr+8WsIajQPeFExe98CJApUaixG1EwLZchXAtYPKwcXkQjoXlSlr7de3nfjH2jhCa+t1yWKKxQxjysMvjOi/qr2lenXmHAEf7O7/U0kMTvqne8OYq2/xIQGRI8mcUOSAYWdRfZrELKjy3jwZNT5i6bG5aDFPkvLLDuyGAhA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(46966006)(36840700001)(40470700002)(1076003)(86362001)(186003)(5660300002)(40460700001)(70586007)(81166007)(47076005)(36756003)(70206006)(82310400004)(4326008)(26005)(83380400001)(336012)(7696005)(6666004)(8936002)(8676002)(356005)(316002)(110136005)(2616005)(54906003)(508600001)(426003)(36860700001)(2906002)(41533002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2022 11:59:39.7626 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f36b578a-89f2-40ec-5ea2-08d9d9b0d74e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT057.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3424
Cc: Alexander.Deucher@amd.com, Basavaraj.Hiregoudar@amd.com,
 Sunil-kumar.Dommati@amd.com, Ajit Kumar
 Pandey <AjitKumar.Pandey@amd.com>, Vijendar.Mukunda@amd.com
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

changes since v2:

- add dmic prepare callback and adopted few nitpicks comments
- use read_poll_timeout in place of while loop
- added check for unused variable as pointed out
- few cleanups


Ajit Kumar Pandey (6):
  ASoC: amd: acp: Add generic support for PDM controller on ACP
  ASoC: amd: acp: Add PDM controller based dmic dai for Renoir
  ASoC: amd: acp: Add generic PCI driver module for ACP device
  ASoC: amd: acp: Add ACP init()/deinit() callback for Renoir.
  ASoC: amd: acp: acp-legacy: Add DMIC dai link support for Renoir
  ASoC: amd: renoir: Add check for acp configuration flags

 sound/soc/amd/Kconfig                |   1 +
 sound/soc/amd/acp/Kconfig            |  10 ++
 sound/soc/amd/acp/Makefile           |   4 +
 sound/soc/amd/acp/acp-legacy-mach.c  |   4 +-
 sound/soc/amd/acp/acp-mach-common.c  |  21 +++
 sound/soc/amd/acp/acp-pci.c          | 160 ++++++++++++++++++++++
 sound/soc/amd/acp/acp-pdm.c          | 193 +++++++++++++++++++++++++++
 sound/soc/amd/acp/acp-renoir.c       | 160 ++++++++++++++++++++++
 sound/soc/amd/acp/amd.h              |  23 +++-
 sound/soc/amd/acp/chip_offset_byte.h |  26 ++++
 sound/soc/amd/mach-config.h          |   1 +
 sound/soc/amd/renoir/rn-pci-acp3x.c  |   7 +-
 sound/soc/amd/renoir/rn_acp3x.h      |   3 +
 13 files changed, 609 insertions(+), 4 deletions(-)
 create mode 100644 sound/soc/amd/acp/acp-pci.c
 create mode 100644 sound/soc/amd/acp/acp-pdm.c

-- 
2.25.1

