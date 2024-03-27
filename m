Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FEE488DB86
	for <lists+alsa-devel@lfdr.de>; Wed, 27 Mar 2024 11:48:23 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 861B82C1E;
	Wed, 27 Mar 2024 11:48:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 861B82C1E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1711536502;
	bh=kcDtUXGx/vvG8BTczu+tXo8vEF1TtyaYITSj4nK4DoU=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=OfEFJ7sG9ojluEpCRVNoOvcvxinCjUzLLF2X41Ad7grii7Xqi+113TpAcrW+jeyde
	 ZA/2eLUBVpEu6cEC52KfH8le2h/nVZI4l16lZHeZSrX2eJnVh7XbLp3OVil6NQrcb0
	 Br0MxPvLxC33N5XVLoMMmwlE92Jd03y6GeZEe8PE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4D25FF805A9; Wed, 27 Mar 2024 11:47:39 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A298DF805A1;
	Wed, 27 Mar 2024 11:47:38 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9613AF8025F; Wed, 27 Mar 2024 11:47:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20601.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2416::601])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7A636F801EB
	for <alsa-devel@alsa-project.org>; Wed, 27 Mar 2024 11:47:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7A636F801EB
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=cR94cfvH
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OXEFYJt1iVjfdb7Qlzb5ItAYqEPLIDckcLlKPxAR9YNKs+7paUagZixx/qJRBCGBRe2SG/BOPs71383X2j1qEz82KptoQ76S48PQMrqPq9k1R/ulj4Gn35Ec0oUGstXMD58HHrZeKC4itTkSC8buvPVlTtqXAg2LAp8SAN3NTZ2vuzoZL+waMSh1ZC72bPzfFkx+BpLFzqxeGSsSjdFhmYhh7OJr/Ql2K7/5Fr2r7U/mTDmNkLk3kIkl3RAx1BadHRNthbC6gqUw922RP9OYxt6poUsZ+KIPqMu3OdeL7Z3v1JAjGAdWXSAWOzYPxWI/09CCT04lLbpiuZa3XznMwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ARXyt6CQVAqAqbC7vnIrk0sXfPRuGtY+EkgiIgVNxEM=;
 b=ZWwF4elVE7f8lMV/EdNI6eoMl5HXNU/hUhHSD2qbw3x4zzNMvw3i7i0FCPbhj8Viv7Iy0EvbZNzrSe6MWHDVgSQ9RIAFe5/kL8Sqp6pEiTp5pVoSKTPu8rneL1Dq2T2t9hi3zRUi/phDPIzdZrH6SvlJZDq8FtCCQYqDnZSAaXrmhHZZg8gBUBhiWz1QVe5vTH8Ttm4vx9tafXYeJGo0E+MKuyRyWqJN89bnWthd159o8aBZ2L42NM+2sTPzC16gxk4ZbmVtjjx7bufwYwziZztosNuKj8I2gZs/fmFrlMZ+OxuFdBFHN+GUOLzw9wNT2sN8XU3ujxkEg3NpKyxVsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ARXyt6CQVAqAqbC7vnIrk0sXfPRuGtY+EkgiIgVNxEM=;
 b=cR94cfvH5FB0K5NFHS519h8lmbXsPJEJi7E/M+eDRp1ni12IsIiqTNkizY+OXKLt34HOPzSNMDe6lG8OVc7iUa9ieWtYyMI/xz5zIY+w/Dsl1U+y5tSxih1eNUh/dLbN0n0GMZQaH4TCYNeIuvud2smDnzPPfD+ZhmctUt/XSDQ=
Received: from BLAPR05CA0036.namprd05.prod.outlook.com (2603:10b6:208:335::17)
 by DS7PR12MB8370.namprd12.prod.outlook.com (2603:10b6:8:eb::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.31; Wed, 27 Mar
 2024 10:47:14 +0000
Received: from MN1PEPF0000F0E5.namprd04.prod.outlook.com
 (2603:10b6:208:335:cafe::dc) by BLAPR05CA0036.outlook.office365.com
 (2603:10b6:208:335::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.12 via Frontend
 Transport; Wed, 27 Mar 2024 10:47:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 MN1PEPF0000F0E5.mail.protection.outlook.com (10.167.242.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7409.10 via Frontend Transport; Wed, 27 Mar 2024 10:47:14 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 27 Mar
 2024 05:47:13 -0500
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35
 via Frontend Transport; Wed, 27 Mar 2024 05:47:10 -0500
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>
CC: <alsa-devel@alsa-project.org>, <venkataprasad.potturu@amd.com>,
	<Basavaraj.Hiregoudar@amd.com>, <Sunil-kumar.Dommati@amd.com>, "Vijendar
 Mukunda" <Vijendar.Mukunda@amd.com>, Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, "Syed Saba
 Kareem" <Syed.SabaKareem@amd.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Jarkko Nikula <jarkko.nikula@bitmer.com>, "open list:SOUND - SOC LAYER /
 DYNAMIC AUDIO POWER MANAGEM..." <linux-sound@vger.kernel.org>, open list
	<linux-kernel@vger.kernel.org>
Subject: [PATCH 2/2] ASoC: amd: acp: fix for acp pdm configuration check
Date: Wed, 27 Mar 2024 16:16:53 +0530
Message-ID: <20240327104657.3537664-2-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240327104657.3537664-1-Vijendar.Mukunda@amd.com>
References: <20240327104657.3537664-1-Vijendar.Mukunda@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: Vijendar.Mukunda@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0E5:EE_|DS7PR12MB8370:EE_
X-MS-Office365-Filtering-Correlation-Id: c4d7adf3-c516-472e-83a3-08dc4e4b43a3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	gkL8QZIY0tAuvqgeHE27MkClNrzEn9PARuJ+lyN2NAYRRK190I2BSVGyth1DbykzRZDllQFno84lZYd6zWqHS5CowJOXcjaWGJb+P0RrDSnxOG21QbtsaG1CXg6RQkE8MHtzeSht4O4aTSTY2m41Poiudiwzlmaz561HIVxXVc2AzP4UY628OZbqXEul/f8c1Qv2OFukLnIBJdijUMAEZX4n1GyYCCfOtuNL7UDkrSlBGHe2LyWNCUjpsLK0LLJedOCLppXyv5S9yD10rO9cQKS/Wn7PZKjAtWNoXTjy4490ytzNPuckjrYiYE+PhBr70qBJ2JBfNy5M3xG90+LslTf6uULgl7HMwzBswLCzOxr6WAemGP49THtmTrwI5mkm3epuloo4TuDouyWKcqJf9Ns1021EA4+Mx6WwPopqHOcy6vg2bjp91y1XUHy+hsoGC5AVBeoSVWYz714H1cKAtCvHoRKvZfEiZ/PVecbEdqAJzyPXiJgdAHbJ+wHUl9mMctQC0el8jt6ycvUsSjZrlgGQXzkp/kFhdkaz6wSNHBd04X6QU2Ku72AJ7VJGsSs7lGLb4RZRzhAKFdhXxCqbxqcR7kXbFy5+dYrQfrdBb9FrQBVU8n83+t8SBeYrpi4Z6nS3Lz2sGAE+YUudF2FauQZ1CnoEfgsViaEkMduiy8WMciyajCg4NIvTXwHRxCLw0vyFACuTjxM8BJZ06u4/vjnzvpEQeXKsPdjZTtXGIB455D0E9zas/ek6w8UFaO3I
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(1800799015)(36860700004)(376005)(82310400014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2024 10:47:14.3602
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 c4d7adf3-c516-472e-83a3-08dc4e4b43a3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	MN1PEPF0000F0E5.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8370
Message-ID-Hash: OHYDLULU2HACTFFKG2VBZUH7KX2E3XJ6
X-Message-ID-Hash: OHYDLULU2HACTFFKG2VBZUH7KX2E3XJ6
X-MailFrom: Vijendar.Mukunda@amd.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OHYDLULU2HACTFFKG2VBZUH7KX2E3XJ6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

ACP PDM configuration has to be verified for all combinations.
Remove FLAG_AMD_LEGACY_ONLY_DMIC check.

Fixes: 3a94c8ad0aae ("ASoC: amd: acp: add code for scanning acp pdm controller")

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 sound/soc/amd/acp/acp-pci.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/sound/soc/amd/acp/acp-pci.c b/sound/soc/amd/acp/acp-pci.c
index c1d4140f0746..21574cfaa136 100644
--- a/sound/soc/amd/acp/acp-pci.c
+++ b/sound/soc/amd/acp/acp-pci.c
@@ -136,11 +136,9 @@ static int acp_pci_probe(struct pci_dev *pci, const struct pci_device_id *pci_id
 		}
 	}
 
-	if (flag == FLAG_AMD_LEGACY_ONLY_DMIC) {
-		ret = check_acp_pdm(pci, chip);
-		if (ret < 0)
-			goto skip_pdev_creation;
-	}
+	ret = check_acp_pdm(pci, chip);
+	if (ret < 0)
+		goto skip_pdev_creation;
 
 	chip->flag = flag;
 	memset(&pdevinfo, 0, sizeof(pdevinfo));
-- 
2.34.1

