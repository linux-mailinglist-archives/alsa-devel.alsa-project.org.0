Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E4B71D9A15
	for <lists+alsa-devel@lfdr.de>; Tue, 19 May 2020 16:37:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DC5FF1771;
	Tue, 19 May 2020 16:36:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DC5FF1771
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589899058;
	bh=+rtQIVXJK+v3Q1TbGc09SWAwI2gF9as/sfKN1D3TrBA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Diw2Z74Kj0KV6UVO5dCFRHpsM6HJywSiGMgro9jmdkSrYiS0qraRL3tWsc/AXsz6s
	 Nt3EqsWfcL2s5fbv//RkkQrjkUcTswfusHw3X/xmuYTiuY7s6GBgWWzWZ3sQN0HTYy
	 jy12ZYBpbXZrc4M+pmnSZ3Lx/Jzqo6nXsn8zjHjQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5B99CF8029B;
	Tue, 19 May 2020 16:34:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7B185F80259; Tue, 19 May 2020 16:34:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 FORGED_SPF_HELO,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2059.outbound.protection.outlook.com [40.107.237.59])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4186FF801A3
 for <alsa-devel@alsa-project.org>; Tue, 19 May 2020 16:34:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4186FF801A3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amdcloud.onmicrosoft.com
 header.i=@amdcloud.onmicrosoft.com header.b="mu8LsIaq"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DowwdH4nqhv5pvR/aG4KGtZfVa/DoN4OrVwK1egeF7w+xndkmGeXsOdapEEoGOmZAE5OaJmsVL3S+MpYDvyK7On4rM43iuvA5NvwBdLgtKf/jPdpmQBNPODKBjwjIzYRFQ39MGLyHRiMxRwvWDbcABxgsLPQ3Tsqd1KsZf9YaEW5kBQa1ovlyJtJs2Rj7Gm3rpZO29WOXz/DCqz8hxBJMbIIo89yCd3ajiMgzkw5f0LgVYBWwYqtya6UPPCziRKLQhQP/5zJI/in+jwutQl3USICBY278uMjD0PdUFuPe1hoC5TwKs4mrlbK7V/aFpzo3swf9TYIJ1r/Kw2Sao/QEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wEyqXWM9Epe0m/NPV0N8dBhNrc6Qd2arc8Ntt6CN1wE=;
 b=eIq8G+dFq36OqVCHL3eA5s+hPK1wqdE/w89C0XoZzQ9VXgBfg0kB8WOcGOHPyWqo0NcZlgROGkuLt1ZxizMoTOvUVFMJdlARDwAsqHzpBvbON3GhFwzVYJcZD/YBaZvEQPLO/5f6nqIlksXc/iVb2+b2XM14yi5hhmWh31vPR9oc2XLCfxWkqkAi2TYqoznsCcwVo819KtDqtFxhZu333zAQi5EL35cyA9VNX2KLc+eu5R3XDlD/T/RuJvdipHLq6Bw2H81TmVuXjrrclyZrxi/vI2+rzBPCovOL0mALPMTMcOTbUYoh9L7hhcGa69DYDRZVe2iOIbgg+Wo3WqtXHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=alsa-project.org smtp.mailfrom=amd.com;
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wEyqXWM9Epe0m/NPV0N8dBhNrc6Qd2arc8Ntt6CN1wE=;
 b=mu8LsIaqu5mZq7DJ30YrhK2yh26KxNfJanLz+M3SHIntWi2IogDdsSjaksEqk0X2g+WygMtdke3s0Ye3SKqQZzKEHiJpSCCECVSf3xyTSzJsKhjS8pbYnyqDym4g5LhzW9laTHzl09YIvGeV6pF9uGeU/bvfYqlscu2ZKHP3VqM=
Received: from DM3PR14CA0146.namprd14.prod.outlook.com (2603:10b6:0:53::30) by
 BY5PR12MB4019.namprd12.prod.outlook.com (2603:10b6:a03:1a8::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3000.20; Tue, 19 May
 2020 14:34:16 +0000
Received: from DM6NAM11FT023.eop-nam11.prod.protection.outlook.com
 (2603:10b6:0:53:cafe::75) by DM3PR14CA0146.outlook.office365.com
 (2603:10b6:0:53::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3000.25 via Frontend
 Transport; Tue, 19 May 2020 14:34:16 +0000
X-MS-Exchange-Authentication-Results: spf=none (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; alsa-project.org; dkim=none (message not signed)
 header.d=none;alsa-project.org; dmarc=permerror action=none
 header.from=amd.com;
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB02.amd.com (165.204.84.17) by
 DM6NAM11FT023.mail.protection.outlook.com (10.13.173.96) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3000.19 via Frontend Transport; Tue, 19 May 2020 14:34:16 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Tue, 19 May
 2020 09:34:15 -0500
Received: from SATLEXMB02.amd.com (10.181.40.143) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Tue, 19 May
 2020 09:34:15 -0500
Received: from atgasia02.amd.com (10.180.168.240) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server id 15.1.1713.5 via Frontend
 Transport; Tue, 19 May 2020 09:34:13 -0500
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <alsa-devel@alsa-project.org>, <broonie@kernel.org>, <tiwai@suse.de>
Subject: [PATCH 3/3] ASoC: amd: return error when acp de-init fails
Date: Tue, 19 May 2020 22:34:22 +0800
Message-ID: <20200519143422.18255-3-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200519143422.18255-1-Vijendar.Mukunda@amd.com>
References: <20200519143422.18255-1-Vijendar.Mukunda@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SATLEXMB02.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFTY:;
 SFS:(4636009)(396003)(376002)(136003)(346002)(39860400002)(46966005)(186003)(86362001)(4744005)(2906002)(26005)(336012)(70206006)(2616005)(70586007)(426003)(82740400003)(6666004)(47076004)(316002)(81166007)(356005)(1076003)(5660300002)(110136005)(8676002)(54906003)(4326008)(478600001)(8936002)(7696005)(36756003)(82310400002);
 DIR:OUT; SFP:1101; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 380754cc-ec32-40e1-ee24-08d7fc01b53a
X-MS-TrafficTypeDiagnostic: BY5PR12MB4019:
X-Microsoft-Antispam-PRVS: <BY5PR12MB40191FD225CC351426B9F3F397B90@BY5PR12MB4019.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:296;
X-Forefront-PRVS: 040866B734
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7Y8omCgu56/96ly2TT8IqYHCPjOSInATkYkSgMgCvN4TkXrVZLWt3muKPUuOyBUAirifXS93vjth7ZkCo2xwaNan0qPLeI42Zv6LO2DE/gyXfPd9QIR3sTRJ16xzCl3ScIl3vbc4qWCRa+DcGVaSb5UzLQQ1BsiOQHIn9Iz40EuInVHNQcF8QUaAgAQvhNngBSXemZ7rCyrtrbWOHrMZHN8atTPVRadlEXH55aJttyRfshkmeXDhGDSWfgeHAf6/ge6hawTYV5phSQGNHM/cohy6SHJsJzPM3XdNioasYVAqWlgUHnhW7v+j62aax37ijbpKDeW4BjfRHv0vMtAQhDDzambRdgiC9Vosv2IyQv4Zl/r2wdDNtd7QUozphpJDQ+pGWlOcPkwJ8XYg4zmp6u030XW+2rLXu43mvuIq5VbyTX+kBcDnTIOg0relkAktk3f7gmK3/aBoFCSjCYHT0OvC4/BLSXBa0/6wNlQlCNjzCoQmNtOxKzcnUz5EfiFmdoF88qK9nfOwkadJxJHnmw==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2020 14:34:16.1010 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 380754cc-ec32-40e1-ee24-08d7fc01b53a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4019
Cc: Alexander.Deucher@amd.com, Vijendar Mukunda <Vijendar.Mukunda@amd.com>
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

Return error when acp de-init fails during suspend.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 sound/soc/amd/renoir/rn-pci-acp3x.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/amd/renoir/rn-pci-acp3x.c b/sound/soc/amd/renoir/rn-pci-acp3x.c
index 502c3f794ba0..859ed67b93cf 100644
--- a/sound/soc/amd/renoir/rn-pci-acp3x.c
+++ b/sound/soc/amd/renoir/rn-pci-acp3x.c
@@ -277,7 +277,7 @@ static int snd_rn_acp_suspend(struct device *dev)
 	else
 		dev_dbg(dev, "ACP de-initialized\n");
 
-	return 0;
+	return ret;
 }
 
 static int snd_rn_acp_resume(struct device *dev)
-- 
2.26.2

