Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EDAE348D455
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Jan 2022 10:30:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 741771EEB;
	Thu, 13 Jan 2022 10:30:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 741771EEB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1642066250;
	bh=qlf8r79WKDhUROk3fqlX21TLhPXjKRD0WIQMwcKTqZQ=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=n8VtcP5HmK0Gkh7HGLINzBZDCpnvIekz3uG+UD7z3egg3bVvlIKTddZ16BPNnqR+l
	 v8TUjvFnwgqc2r+Li2ZeqSJVD2bXfeCrNq+rU6IayvuCvSBWPh340fc9kEsCmG2C0d
	 ohJ9zTjXnN9mrAbui0fhXQl3FI/N7rGuIsUTs+XE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EEEAAF80141;
	Thu, 13 Jan 2022 10:29:41 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 54C23F8013F; Thu, 13 Jan 2022 10:29:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam08on2057.outbound.protection.outlook.com [40.107.100.57])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4BBEDF80088
 for <alsa-devel@alsa-project.org>; Thu, 13 Jan 2022 10:29:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4BBEDF80088
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com
 header.b="lv3hQgu7"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UnO5HjXvyIE5RzkXOk/LbIHmNffkgEzrMvpTO147Jg5xY38ueUyQMt60L5QH7dejbHklN7Kz3VZaIiwOBOQ9eZeRHhp2plygNUO8SaoA+0gLzn3LvvdmtlrQtVwUse6GZk53cfoUtIUGgVLsBQwZ0VsLZ9yPX3grNGiuzeAuYRgcoIhNxrfbaVKA8KbDTRMwG6urS50vDFiRz9dzDOug2I0HDjnBCRvYgUbYmNn1S41m+I2m1MpQFnKLA8Rxlw6khL3kRW+dBSUGcH77K2pW+Mkc0kcGZan++oVep4xzDW7Q6mW0RRZ1dWf1P6/KXSUxgOLRCXgES25+NBmv2ZZdVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WhvOGxyzLo9ES0j2W36kM97bc0vIZF4YyJWKiy3oaaU=;
 b=FMdba3aRmwmpA2ut+uy9KdoQTqe+K9T2v9mf7ATNJ/dkGWtyRY2SmeWDblFye7j4upvP4frhcsBnsrMUBjQSjsQxiGTHnmnVZZkueh97sfMmIkSu6QxHTlWS+1JaNNOj59metc4C1y9+clPXR36Eu19F+v1r5IoZVwcke4jwKD1EVZPkoDtnvBTBxTFWhQqqIxRE1fK2/FJymOnBCrL66JEW5H2Ih5Ah2wptmlww2CsdEh4rOX9onIKeG4qBLoGsuJHgUmZu9lJZj4ir6FJEfsfxjExv9NgCcgBp93kBWVB1E8UzMu3Mbc17IK8P9Ai/CvlF8yK7iau1SMWNhQG9XA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WhvOGxyzLo9ES0j2W36kM97bc0vIZF4YyJWKiy3oaaU=;
 b=lv3hQgu7u1qaJLIDDodrvdkBnwf0+txPaibzz17FO3EgCOj+Szf8sb4ta9oDIs0SOvs4wDURZEoXCfjWHO6y9JObiQ1RfvWpRk57IERfVpWOvy4y+5JQfq7rSi1YoAXZo8tkF22AY8DZc4mjSlw6Iuz4j3pNEVCvW8KqQeUpExg=
Received: from BN9PR03CA0293.namprd03.prod.outlook.com (2603:10b6:408:f5::28)
 by MWHPR1201MB0270.namprd12.prod.outlook.com (2603:10b6:301:4f::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.11; Thu, 13 Jan
 2022 09:29:25 +0000
Received: from BN8NAM11FT037.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:f5:cafe::95) by BN9PR03CA0293.outlook.office365.com
 (2603:10b6:408:f5::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.10 via Frontend
 Transport; Thu, 13 Jan 2022 09:29:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT037.mail.protection.outlook.com (10.13.177.182) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4888.9 via Frontend Transport; Thu, 13 Jan 2022 09:29:24 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Thu, 13 Jan
 2022 03:29:23 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Thu, 13 Jan
 2022 03:29:23 -0600
Received: from chrome.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.17 via Frontend
 Transport; Thu, 13 Jan 2022 03:29:21 -0600
From: Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
Subject: [PATCH 0/6] ASOC: amd: acp: Add generic PDM and PCI driver support
 for ACP 
Date: Thu, 13 Jan 2022 14:58:36 +0530
Message-ID: <20220113092842.432101-1-AjitKumar.Pandey@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d1bd8996-facc-4cf6-437a-08d9d6773018
X-MS-TrafficTypeDiagnostic: MWHPR1201MB0270:EE_
X-Microsoft-Antispam-PRVS: <MWHPR1201MB02709C84E4B1F6E1909C893D82539@MWHPR1201MB0270.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3513;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uwwEzUycu/E7Zbt+xGYPMVtv04D+deESAwrYpz6/Z/tNfBp3FC3EriXLDXqiUeCOHX/PBruu+78kdNBI8PVPIag/7Z09Lut2dTgQPFQMy7l8opBVFGfhK21espa2tpFDBjnNhKQxpqxpQGc3DGiT6uHf8er2b22f553HhOa2/QTSHL2RVKoQpDar1TyEF7GuE+SPqfmemCnAHHsb5JHG1QqtACKgJPdQZ02Y/bDwo6BHJHVYI6GCOMvFP3la4GpvtFqyt/y8cuTViepuMytSNNzFovvB8PrNrtDfSxTdZhgwcFi7eMnFmv4QIyWptG8JA6KfvH8HKtrg/yJ/7ssyofbHmtbKvuPKsqKWpkCRm2gTjf25smmzsCvC60SEtzrdd2qr/F4JtdeyzOELiNlQnkheDIqS6BH8eYhHDHCF/HEnQ3WTq4dI/Vs9LXGEu5l9rtaHaMXjh/EyMURZ/ZSByXPRo+r74p03QIUk2Qtxg5HXRRvE1eslyqirkOlGijoBMAyagXYP3wMSaXrj1tWEj2ur1EBoU9kKqdlpmLlVjtFR9+aHzyp7GB8kRET3U5Rrk+0KxA1j9iJ9xSeV9g4ghEK87uI9N58U1wtcBBrEFJfCflY2rxIt164dtELr1oifQMHQykgkDCy2nJZnmBvLYN2gi9/3nKmCfIr6iEZagguczF1hywDe/3MtOVKlgqODBkZeWX4Hk0dQhQrSkI9XVMUtEjDzIHjvcrvVEfpd4C8Ltxt9auqBum7jaCL5peeFiiMlmiDI5ss7D0HA/RF+N1IcB37p597ujTDNr/L82/vTVnE2UKj5FgAZ/M7qJUgi2CwYE5H/DKtdN3DCJwRYqw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(40470700002)(46966006)(36840700001)(316002)(2616005)(70206006)(7696005)(336012)(86362001)(8936002)(4326008)(54906003)(356005)(110136005)(4743002)(36860700001)(6666004)(508600001)(81166007)(47076005)(5660300002)(1076003)(8676002)(426003)(36756003)(2906002)(40460700001)(186003)(70586007)(82310400004)(83380400001)(26005)(41533002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2022 09:29:24.5047 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d1bd8996-facc-4cf6-437a-08d9d6773018
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT037.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1201MB0270
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

This patch series add a generic PDM controller driver module and
PCI driver module for non dsp based audio support on ACP devices.
Initial support is added for acp3x devices or Renoir platform but
we will use such driver module to support upcoming platform and
other acp architectures in near future.

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
 sound/soc/amd/acp/acp-pci.c          | 158 +++++++++++++++++++++++
 sound/soc/amd/acp/acp-pdm.c          | 181 ++++++++++++++++++++++++++
 sound/soc/amd/acp/acp-renoir.c       | 183 +++++++++++++++++++++++++++
 sound/soc/amd/acp/amd.h              |  23 +++-
 sound/soc/amd/acp/chip_offset_byte.h |  26 ++++
 sound/soc/amd/mach-config.h          |   1 +
 sound/soc/amd/renoir/rn-pci-acp3x.c  |   7 +-
 sound/soc/amd/renoir/rn_acp3x.h      |   3 +
 12 files changed, 611 insertions(+), 4 deletions(-)
 create mode 100644 sound/soc/amd/acp/acp-pci.c
 create mode 100644 sound/soc/amd/acp/acp-pdm.c

-- 
2.25.1

