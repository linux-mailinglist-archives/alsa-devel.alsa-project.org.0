Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 676FA4293B8
	for <lists+alsa-devel@lfdr.de>; Mon, 11 Oct 2021 17:46:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BC6E01693;
	Mon, 11 Oct 2021 17:45:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BC6E01693
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633967188;
	bh=XU2YOGIAEtf/8ZbPoHDQD+cd/6yoejdCi8Xc8UaTnHA=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=dohX/tKTSne7V7FAHvmcvI80G5tQL9LNfR2wMtpxPRxMepfyi1OWxEM8d1GwiDUFD
	 FwY10wTsAA4NYTurVMabpZt4Tc49mwctZiqNGS06sFed8ZS2l7fOlArjAKt9+mjEPk
	 cMQqfulmUVx+k36UAoK0pkj9Q5qUedz2ufjBWnWQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2C2C5F8028D;
	Mon, 11 Oct 2021 17:45:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 84C65F80269; Mon, 11 Oct 2021 17:45:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2061d.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe5b::61d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C4FC1F800C0
 for <alsa-devel@alsa-project.org>; Mon, 11 Oct 2021 17:45:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C4FC1F800C0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com
 header.b="MNNhfE2X"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ymlu7kSnA9znC8/wsRzNvXxP5MyPbuknDOwUmsREXw1wk2nxzjn543HA+gsDNhaCcJlVwJXdzWaHmw8QldT4AzuSKDBXM1R4I33q0dpJdxwwl1aewkATZxz78wumbaF/N+xGYXpLM7psjqrUbXpEG9Y9dnz+1gEdKWhJGNjEV7V6AnYCe+VDhGHkZoO19roktzpxuLZbXttGP6H+k7ubNiTQJ+vzjV2biqumHF58SQyM9I2xPa00mijqrhPIW2XKC/Jycj1351uFl24meT54zoGgBvmVGwuJAUJ2wRQ2igsPjRDJEn0M9PnI4B3ZwGiAtwF+Zf/tIdyf1ERWM5/+oA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k8DVK1H+Uf79q941UtNVjuVfXqkj9LZTpTBWYiahKk4=;
 b=XR+6sl4pyDcxPEquXhmgmyCqBK+G3DDlU+B16UaNs/enSrsSBV8QiOPBXc/rF3fwmYxBPbusFQUGlOUNrgTT5MSfwVyTwbtAK7jn1wW3Vf37HtvAiL7dTlmYpACeznDmaWEipvYCT3FwKMWcW0qkIOhobFRcvejtLkkqExDFknS6n47hLmVPzlqb4Ej3Lu8/VopBdXkxKIXVsJ6Dl+MzsHwbmBhqKZwYCcFYCCGXi0u8weVBjdDhMw4Oz2XWj5dsUn7efk3HBNA1g8Mt3Djp6vA95GVWlwwAzVvG+i085GE3E+6ztjFYac27xXi3uzfn438AwsN9wUIECFRNceKfhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k8DVK1H+Uf79q941UtNVjuVfXqkj9LZTpTBWYiahKk4=;
 b=MNNhfE2Xq0H+VHgaSunrT7k7vwpEUBVlYsIqHOCAQ9/tfY5s4rxX66wthDzlAVJ6I64gW6Nu5mvCW+wlFjiAFpZKySy8ZkDa8GBdwjqzJGhF+ZRu3scPgCYS8f4Zsrm0A5eDpk3q+ubhJZHP2CyyVaRTF/7d60SJ8aeIuyrPDMw=
Received: from BN6PR16CA0045.namprd16.prod.outlook.com (2603:10b6:405:14::31)
 by BL0PR12MB2529.namprd12.prod.outlook.com (2603:10b6:207:4e::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.18; Mon, 11 Oct
 2021 15:45:01 +0000
Received: from BN8NAM11FT043.eop-nam11.prod.protection.outlook.com
 (2603:10b6:405:14:cafe::79) by BN6PR16CA0045.outlook.office365.com
 (2603:10b6:405:14::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.18 via Frontend
 Transport; Mon, 11 Oct 2021 15:45:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT043.mail.protection.outlook.com (10.13.177.218) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4587.18 via Frontend Transport; Mon, 11 Oct 2021 15:44:59 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.8; Mon, 11 Oct
 2021 10:44:58 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.8; Mon, 11 Oct
 2021 10:44:58 -0500
Received: from chrome.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2308.8 via Frontend
 Transport; Mon, 11 Oct 2021 10:44:55 -0500
From: Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
Subject: [PATCH v2 0/8] ASoC: Add common modules support for ACP hw block 
Date: Mon, 11 Oct 2021 21:14:44 +0530
Message-ID: <20211011154452.76849-1-AjitKumar.Pandey@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c7e5a5f9-fb57-48eb-f9de-08d98cce1542
X-MS-TrafficTypeDiagnostic: BL0PR12MB2529:
X-Microsoft-Antispam-PRVS: <BL0PR12MB2529012AA473EBA29B6FE82C82B59@BL0PR12MB2529.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4125;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kWw94ZPY1V8YWq9k48tD4r4igfQzQ5nxkVk7zLRJSrIxr/eRfOjy5NLmn5gsPVKygWWIfmoO1o6Ni7FvjotTzfsOqrCYpzBSPw7Qj/fgUp1UlpANILVau8ZAEWdUuXcN7x/rm512D22ITZHkXTqd8tEP2gw3T+YWi9APezXiEH3mRRKiIvvgqbNQ09/ivEqwONT85HZr8F4ggitG9xN0iRY6CjouuuE1+o7k8hj2mTB7p8lwiDmZwgDqhz/RZZZGXY+VVKdHYZgY3z0D3f2NZwKn1zqdXmp5lgh7rvm9HmE6lNa3siC+hJvz8yW/neoM/3ft49AK9lLZxRWqBshFnMRWYqE4aelK7CYmFsZa+vSU0Mnygwu+9v8m4LPwqFzMdNHW1hZADrD6/HrbxS5zaAETCDzib7GIr3hNPfBoOwiead5InHSRq4x+T5UwbNAcLz8N8J6W3ipCTKp9lQiSt7F7twTKdJhDZJJM78NMGqlxjW96VveA3QN65vk/lpy2oMSlnuKFeR7KSxC5TDlH7lAKwnxKdvnleuLOoqgDICf7d52t75w7NPsfdCBHZxbTVBOl5Mg9kYqiOD5wnPhl4mOF02cakU4OdHo0cdcX3UjIBXgMNvojkgTjo9WeHNUj02Ac6dp98cVKTjNckR4hDW/wxyIj3FuTZKVWCVnyK64FbrNHa7ovkyOSsYHePveJcFYx/R/XFS/gZi0XbIpjXLJ+8RtjRhz3LpAD9S0JUgk=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(46966006)(36840700001)(336012)(2906002)(2616005)(426003)(47076005)(83380400001)(86362001)(82310400003)(36860700001)(110136005)(5660300002)(54906003)(4326008)(356005)(81166007)(36756003)(508600001)(1076003)(186003)(26005)(8936002)(8676002)(7696005)(6666004)(316002)(4743002)(70206006)(70586007)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2021 15:44:59.6678 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c7e5a5f9-fb57-48eb-f9de-08d98cce1542
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT043.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2529
Cc: Alexander.Deucher@amd.com, Basavaraj.Hiregoudar@amd.com,
 Sunil-kumar.Dommati@amd.com, Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>,
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

Changes since v1:
- Fixes Kconfig indent as per kernel coding style guidelines.
- Updated _GPL suffix for all exported symbol.
- As suggested added separate machine ops for each codecs in machine driver
- Add sound card support for newer codecs

Ajit Kumar Pandey (8):
  ASoC: amd: Add common framework to support I2S on ACP SOC
  ASoC: amd: acp: Add I2S support on Renoir platform
  ASoC: amd: acp: Add callback for machine driver on ACP
  ASoC: amd: acp: Add generic machine driver support for ACP cards
  ASoC: amd: acp: Add legacy sound card support for Chrome audio
  ASoC: amd: acp: Add SOF audio support on Chrome board
  ASoC: amd: acp: Add support for Maxim amplifier codec
  ASoC: amd: acp: Add support for RT5682-VS codec

 sound/soc/amd/Kconfig                |   2 +
 sound/soc/amd/Makefile               |   1 +
 sound/soc/amd/acp/Kconfig            |  50 +++
 sound/soc/amd/acp/Makefile           |  26 ++
 sound/soc/amd/acp/acp-i2s.c          | 340 +++++++++++++++
 sound/soc/amd/acp/acp-legacy-mach.c  | 104 +++++
 sound/soc/amd/acp/acp-mach-common.c  | 596 +++++++++++++++++++++++++++
 sound/soc/amd/acp/acp-mach.h         |  57 +++
 sound/soc/amd/acp/acp-platform.c     | 315 ++++++++++++++
 sound/soc/amd/acp/acp-renoir.c       | 144 +++++++
 sound/soc/amd/acp/acp-sof-mach.c     | 131 ++++++
 sound/soc/amd/acp/amd.h              | 146 +++++++
 sound/soc/amd/acp/chip_offset_byte.h |  76 ++++
 13 files changed, 1988 insertions(+)
 create mode 100644 sound/soc/amd/acp/Kconfig
 create mode 100644 sound/soc/amd/acp/Makefile
 create mode 100644 sound/soc/amd/acp/acp-i2s.c
 create mode 100644 sound/soc/amd/acp/acp-legacy-mach.c
 create mode 100644 sound/soc/amd/acp/acp-mach-common.c
 create mode 100644 sound/soc/amd/acp/acp-mach.h
 create mode 100644 sound/soc/amd/acp/acp-platform.c
 create mode 100644 sound/soc/amd/acp/acp-renoir.c
 create mode 100644 sound/soc/amd/acp/acp-sof-mach.c
 create mode 100644 sound/soc/amd/acp/amd.h
 create mode 100644 sound/soc/amd/acp/chip_offset_byte.h

-- 
2.25.1

