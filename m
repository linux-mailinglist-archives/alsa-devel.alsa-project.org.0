Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 41CEB48DBE4
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Jan 2022 17:35:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E14DF1FD6;
	Thu, 13 Jan 2022 17:34:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E14DF1FD6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1642091745;
	bh=Cm2w5Ps+wmPyWXR673cDpA+Jy2mmPCJgTv3CLvR7Mew=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=SKqTM914nzjU6snSaMTrIZSOMKYof3M4u9Z0KjyJXVtLBVLDHP0CexOPOhQUQwbhc
	 RfCPJIBatZBa1sui/duX5IAiLbFjFoSJPysSxLV8SZ38DPrd3nNPSC9a49OcPdWrOs
	 TdH/KTZuChE2vg7le14oeXoQGEHfeq20ReuuWwJk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 67EEFF80054;
	Thu, 13 Jan 2022 17:34:36 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 13873F8013F; Thu, 13 Jan 2022 17:34:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2054.outbound.protection.outlook.com [40.107.92.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A3B87F80054
 for <alsa-devel@alsa-project.org>; Thu, 13 Jan 2022 17:34:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A3B87F80054
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com
 header.b="gtd8n60m"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Al4Aln1RTGKhEX1lLu0IqD63D0ab0PGKQpfs5k/RwQW8v4NufK+8iS7FudWBJBPmx0+2HKZQzl3kuv5vbhQuYMjBl0J6IQ3A7rO4evuLauNRbRxUnwjUILfPVnYdKSn3zjFK133HUU6R6rg52/kiIqWEHnCY0Qypw7YdRX2dvfOKFdMLQ8Ekd1jlTNokTYnnjRIa/e/aucwSzSyb8KMKKc6jZCdXk+TLmoN5BjwVrCchuNrlbBMaTm3T6iqk81ZrP254NK7ATnaEdaT+zCUTXVhzhBuYaoT4eDoUA6YzMLnc+ViSa7NtlZ9j2dgE7ayhXN37OAg6sED7pZaQXzQjBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AGUjxPY32V8a1/OUal+TucvjMDwPJrZTSp7DhNk1aZo=;
 b=SuIvewp6NhREqeuaunMcrW0cEloaDKtYlN9fbiUkEk/H4RjF6q50qfopphYMQryGl4W1ZN2OUDVu2cpNvmuRntuAlsJmVhl7mZLWzcNdWT2a5qaaG7K7Ifa+WE9xdW1+vaF180ermY/SOm7bpngO6fHCRNTO/WX14FZSJDjr1xr9nJ5PxT1EQOp2K042hBzRpdWpepckqIIoaDDO61oESf+IdpR81GXGzkAjGwr6FJqu0fV1BiiUWyI7vZj1z8Bkitg1OcA4qgeNtzXIKHDle/dHEIfIcE0d+YoH6e9HYAWfmiw7JZvTxLzoqt9/KTNuz67/OFOjwrnqh8yxVnEoag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AGUjxPY32V8a1/OUal+TucvjMDwPJrZTSp7DhNk1aZo=;
 b=gtd8n60mEU+aJgAot9pWXyv/rQx9KbNg/bu51dDEEQtES8GWjKJ4c75mAOcX2NnpJo+grFQh6cFSWjZE/GDsbQziPWGrwUyQVdX9jEF6dcpAgO/KCYKRuzKzUF6aJPT5vuyvkSLRIOCklpoYf9VvR6wlpkfqVLN8Eg+sWvYxW1o=
Received: from BN6PR16CA0009.namprd16.prod.outlook.com (2603:10b6:404:f5::19)
 by MN2PR12MB3949.namprd12.prod.outlook.com (2603:10b6:208:167::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.10; Thu, 13 Jan
 2022 16:34:28 +0000
Received: from BN8NAM11FT014.eop-nam11.prod.protection.outlook.com
 (2603:10b6:404:f5:cafe::e9) by BN6PR16CA0009.outlook.office365.com
 (2603:10b6:404:f5::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.10 via Frontend
 Transport; Thu, 13 Jan 2022 16:34:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT014.mail.protection.outlook.com (10.13.177.142) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4888.9 via Frontend Transport; Thu, 13 Jan 2022 16:34:28 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Thu, 13 Jan
 2022 10:34:27 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Thu, 13 Jan
 2022 10:34:27 -0600
Received: from chrome.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.17 via Frontend
 Transport; Thu, 13 Jan 2022 10:34:25 -0600
From: Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
Subject: [PATCH v2 0/6] ASOC: amd: acp: Add generic PDM and PCI driver support
 for ACP
Date: Thu, 13 Jan 2022 22:03:42 +0530
Message-ID: <20220113163348.434108-1-AjitKumar.Pandey@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 75f9cdc4-facf-441c-6c06-08d9d6b2916e
X-MS-TrafficTypeDiagnostic: MN2PR12MB3949:EE_
X-Microsoft-Antispam-PRVS: <MN2PR12MB3949D9B097705CBD003FFEFB82539@MN2PR12MB3949.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2887;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nBejDjvMRM5BXbNctSW+SG2hgzy7XdpvmxzxDJj+HJmTaR/ktVX+0j9MbtSOumZPili3s7Kdy8PEBsD+8CUhMWRlZlNn2PfrY1MkWermddAjMBEnNWohbh3OlcMnt03rJAztZbw9bj/ADkHTYV9bfSAq+smprYbuqbIbO5d2BpKc8uxSzoiLQjbQmaeoikUx/9w12+U4j0x/YHq/TXmL24dKXnQ+0xsZGNIOy/JAEQ4TZze5msUYWnDqLuTS3OObvqRGg3fnYoMGwlhK7G9CcMUyJ1btcL/vdHnvklohlpuwTzPG5oD3bsNqo9VI92lFI9KWlDCN2ixicmU3MNqCNaoNls2F0zc2N1wctaqgHjqbV+TuBf0ArJkMEjXc124vcIhEral/9dITt6+BhebQTUF5szcGBEMnWN80muVRquoaU9cF4zOLi99RywyygH2+Pfwqev1EVdw3/Dsmu9RZMp+Rz1GI3gRASzqruEhwVBgrh80BeT2tZskLj17oWmJ1O/K8VTKxGzOarILog8EM2L92hTNH+Tlg8jqVthcnY7K8+/8ze0Aif0pgysaiLU4tEr81wWHxQhn3Xa/6MJH3slz3KhNcvn/KNcSw5CLLDHVo2oXEXt1LULgq6GPJxXd8BDKzlz08vwXNnsTw+O6BLCQCuj2z5OKGX4FtY/+eQ0SPK3Bv0dnFnYg3cK5U0HmWxAaOj+tdzp7Il5bJFDa40oqDSrPqVCYsVYESgOsdNRZ3+g1L7ArAWHl85POkL8WxKE8aSkVc07q2F/drMYq0GMhgXRvU03KegfUY4O4h7sq4r/LqeuXr/N0K4AZGfMZBsducrj27fiBdY9gUcfp6vQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(40470700002)(36840700001)(46966006)(4326008)(336012)(70206006)(2906002)(26005)(426003)(36860700001)(186003)(47076005)(70586007)(2616005)(1076003)(8676002)(86362001)(508600001)(81166007)(8936002)(54906003)(83380400001)(110136005)(316002)(5660300002)(36756003)(40460700001)(356005)(7696005)(6666004)(82310400004)(41533002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2022 16:34:28.1622 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 75f9cdc4-facf-441c-6c06-08d9d6b2916e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT014.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3949
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

changes since v1:
PATCH 3/6 - Added platform_unregister() for error case

Ajit Kumar Pandey (6):
  ASoC: amd: acp: Add generic support for PDM controller on ACP
  ASoC: amd: acp: Add PDM controller based dmic dai for Renoir
  ASoC: amd: acp: Add generic PCI driver module for ACP device
  ASoC: amd: acp: Add ACP init()/deinit() callback for Renoir.
  ASoC: amd: acp: acp-legacy: Add DMIC dai link support for Renoir
  ASoC: amd: renoir: Add check for acp configuration flags.

 sound/soc/amd/acp/Kconfig            |  10 ++
 sound/soc/amd/acp/Makefile           |   4 +
 sound/soc/amd/acp/acp-legacy-mach.c  |   4 +-
 sound/soc/amd/acp/acp-mach-common.c  |  15 +++
 sound/soc/amd/acp/acp-pci.c          | 160 +++++++++++++++++++++++
 sound/soc/amd/acp/acp-pdm.c          | 181 ++++++++++++++++++++++++++
 sound/soc/amd/acp/acp-renoir.c       | 183 +++++++++++++++++++++++++++
 sound/soc/amd/acp/amd.h              |  23 +++-
 sound/soc/amd/acp/chip_offset_byte.h |  26 ++++
 sound/soc/amd/mach-config.h          |   1 +
 sound/soc/amd/renoir/rn-pci-acp3x.c  |   7 +-
 sound/soc/amd/renoir/rn_acp3x.h      |   3 +
 12 files changed, 613 insertions(+), 4 deletions(-)
 create mode 100644 sound/soc/amd/acp/acp-pci.c
 create mode 100644 sound/soc/amd/acp/acp-pdm.c

-- 
2.25.1

