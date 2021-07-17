Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A2C1C3CBCDD
	for <lists+alsa-devel@lfdr.de>; Fri, 16 Jul 2021 21:43:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 21319166B;
	Fri, 16 Jul 2021 21:42:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 21319166B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626464603;
	bh=Iumf391xdk2s4e2iyLdtODpW7YE81tLx3PHThK5gLQo=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=u8RdnFkkBvKP2TDGOgKYz+MY+S9qRaLF9Y16nX+qqD0jKESRjwAPxjaHysejgun7Z
	 DY7kR/qjHXCIxhxYVhaya+rfnkcV9N9mkZs9oo1HrpND6DLwNx/pItXOlw8SSssXwV
	 zZr1+shhZaE/XLygOXp3w5I978sCkWBZOMbJ3xuc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 919C1F80253;
	Fri, 16 Jul 2021 21:41:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8B0F4F80254; Fri, 16 Jul 2021 21:41:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DATE_IN_FUTURE_06_12,
 DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2063.outbound.protection.outlook.com [40.107.223.63])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3B660F800FE
 for <alsa-devel@alsa-project.org>; Fri, 16 Jul 2021 21:41:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3B660F800FE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com
 header.b="fWWpv/G6"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PhLG6LEm31kE2rC1Ntcg1ZphaM4N5dq2x+/5m7KJjrRIjWsuURK0Il9uGrHl83gc70XOLDhELYYsvRmunq75bPlljYtDa5iFWzhfgDhUUbtlJ9yv3PyrfP7hcrA99l1xxzWyVsJ6zLsUFkPxkClW1FRUvsYoJZftFrY6ADA1E/pMOeUHvL+caumF+uuixQPXw2tKKguyneafrvWfSbfRC2o4GfhgE8R4Zbhjb5eg1wfqIDIYXQDsPpaVsqylrPhPjFR83+1W4Dp/2X/uM5kho674s+kJ7UktK+iu8WzyumvTZ2hpUpYSZ5I7VAkN6kg2DMIar9ZNI10rhHQj5wOaEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aI+uJkanHPtkg9SpKY/5Wmg2l7DCetNtlcm+ud5x7wQ=;
 b=Z/l6yhRAvyGSB59fEl7efKjsf7cAx5h2gTLAPSpS9T3QOfJTGh86bdw3Em14n7lvBgdJGINwiKRd1b2xpBtziyUbhOLDLyNQgg2N+xRm5eB5NtHS6/9qFkFh36JyBBrJit13YVDx+7rTRcghpQBokHPiiWB4iddBxcMwsUtrp4huA7dpwudNS6jH13GKea2XxUqe/7zwrgavHoDlh2H4jGOl/gL5TotZ/eG8iXypkBX8qjWP0XTSVM6DEcyNPJeh6GMbLiK/MiNJAtrJoO2Qn2pYTA7F2HgcsxFZJ2TO8fvBw3fw8+/ae5LdNEgA2zf6dvX/rSI2cEGiZ6lj5B/SJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aI+uJkanHPtkg9SpKY/5Wmg2l7DCetNtlcm+ud5x7wQ=;
 b=fWWpv/G6VcSldMkX94r2idiKCeaaIxB+UhsdNblRVXPE7kTB4hAk3JC0FZxF4nHHSlTirMIhevwXblCmJDiezp7DDIXSUc2ClMuayxG5mlxjrpwE9EVBWgnWi5wnNhuiGIV4d0lSmWiQ5YiT/5epSUYFrJOcQlZagWcb92fFEy8=
Received: from CO2PR18CA0057.namprd18.prod.outlook.com (2603:10b6:104:2::25)
 by BY5PR12MB4853.namprd12.prod.outlook.com (2603:10b6:a03:1da::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.21; Fri, 16 Jul
 2021 19:41:45 +0000
Received: from CO1NAM11FT051.eop-nam11.prod.protection.outlook.com
 (2603:10b6:104:2:cafe::d5) by CO2PR18CA0057.outlook.office365.com
 (2603:10b6:104:2::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21 via Frontend
 Transport; Fri, 16 Jul 2021 19:41:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com;
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1NAM11FT051.mail.protection.outlook.com (10.13.174.114) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4331.21 via Frontend Transport; Fri, 16 Jul 2021 19:41:45 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Fri, 16 Jul
 2021 14:41:44 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Fri, 16 Jul
 2021 14:41:44 -0500
Received: from vijendar-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2242.4
 via Frontend Transport; Fri, 16 Jul 2021 14:41:42 -0500
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
Subject: [PATCH RESEND V2 00/12] Add Vangogh ACP ASoC driver
Date: Sat, 17 Jul 2021 09:30:47 +0530
Message-ID: <20210717040059.310410-1-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 848372cc-2248-45d0-02c0-08d94891be92
X-MS-TrafficTypeDiagnostic: BY5PR12MB4853:
X-Microsoft-Antispam-PRVS: <BY5PR12MB4853969AE719958FE68CF4B197119@BY5PR12MB4853.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3044;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: L2FhvyKpPkdxOpKEkfL9mTzR/nj4czKVU5C4a4ZHudnDqW6KPW8sRlmIeAxD2tfFHacna7KUlTR7r/zjqAXDbsv8HXnsMBePa25yOlJ+w2beCa0iSOZ82ILkCbufX75A79WI+ysgLp0VnuMLPIMbnIHLi5/lRrNoyUKGg4aOwn9QKzRJtWMyscFxI+rEjAJ66zcJaPzy0rSwq8awXfYXWcz7c2PrxgV1T2j1X83Kp7phbb/gYHLWp6bcfJn5R8gnVoty5P11Wy8YWA6t3C58BngjpLPJJ/WyDC0zffV//gShf/jQua3bLulgq/zv/tBa2wOCHWoB2uD1j13fEL/IeUzi//cVPxY451lN2EEON4n6E4VMteitXjv2CoQh7S3n0WfpF/zWYKgkE3F/5d8gOKo2/u+g6YuLg6RQihhJCmCHU2aNC640Es21VN4b1pIZDMWenC/jHfuWmk8LlW3QXGMSCsbT0EaEDat2UEyUTY9sP73+OgPKLm//xvV2KtrtiD+fPXfVTYeRAjwrenuDE1oqsS6beNaGnp2x3bGS1G8vxpxp/k1V632pQfpjWhblGaAJDyzUgjBAfeEXlj7RJNqyRXlUzhsw2sE2I2n9DBFLkRtRB/emUah9Cgx7k/t8vXbBsqQl9KqMK+3LZIetR4DJM/aGzTQDrtH21whviYKvcZ9/VNGQYbIMnBhlwlpi4pa1+U2mUSA9A8Mqbuqdv0HYj+ae1xsRBSC+dFVN1yc=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(136003)(39860400002)(346002)(396003)(376002)(46966006)(36840700001)(4326008)(316002)(82740400003)(70206006)(70586007)(36756003)(26005)(2906002)(2616005)(478600001)(54906003)(186003)(8936002)(426003)(83380400001)(110136005)(36860700001)(82310400003)(47076005)(86362001)(356005)(1076003)(81166007)(8676002)(336012)(5660300002)(7696005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2021 19:41:45.2654 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 848372cc-2248-45d0-02c0-08d94891be92
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT051.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4853
Cc: Alexander.Deucher@amd.com, Sunil-kumar.Dommati@amd.com,
 krisman@collabora.com, Vijendar Mukunda <Vijendar.Mukunda@amd.com>
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

This adds an ASoC driver for the ACP (Audio CoProcessor)
block on AMD Vangogh APU.

Vijendar Mukunda (12):
  ASoC: amd: add Vangogh ACP5x IP register header
  ASoC: amd: add Vangogh ACP PCI driver
  ASoc: amd: add acp5x init/de-init functions
  ASoC: amd: create acp5x platform devices
  ASoC: amd: add ACP5x PCM platform driver
  ASoC: amd: irq handler changes for ACP5x PCM dma driver
  ASoC: amd: add ACP5x pcm dma driver ops
  ASoC: amd: add vangogh i2s controller driver
  ASoC: amd: add vangogh i2s dai driver ops
  ASoC: amd: add vangogh pci driver pm ops
  ASoC: amd: add vangogh i2s dma driver pm ops
  ASoC: amd: enable vangogh acp5x driver build
---
v1 -> v2: fixed review comments
---
 sound/soc/amd/Kconfig                       |   9 +
 sound/soc/amd/Makefile                      |   1 +
 sound/soc/amd/vangogh/Makefile              |   9 +
 sound/soc/amd/vangogh/acp5x-i2s.c           | 429 ++++++++++++++++
 sound/soc/amd/vangogh/acp5x-pcm-dma.c       | 525 ++++++++++++++++++++
 sound/soc/amd/vangogh/acp5x.h               | 192 +++++++
 sound/soc/amd/vangogh/pci-acp5x.c           | 327 ++++++++++++
 sound/soc/amd/vangogh/vg_chip_offset_byte.h | 337 +++++++++++++
 8 files changed, 1829 insertions(+)
 create mode 100644 sound/soc/amd/vangogh/Makefile
 create mode 100644 sound/soc/amd/vangogh/acp5x-i2s.c
 create mode 100644 sound/soc/amd/vangogh/acp5x-pcm-dma.c
 create mode 100644 sound/soc/amd/vangogh/acp5x.h
 create mode 100644 sound/soc/amd/vangogh/pci-acp5x.c
 create mode 100644 sound/soc/amd/vangogh/vg_chip_offset_byte.h

-- 
2.25.1

