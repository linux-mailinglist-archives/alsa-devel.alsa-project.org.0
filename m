Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 883BF56A398
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Jul 2022 15:27:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0F04E84C;
	Thu,  7 Jul 2022 15:26:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0F04E84C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657200461;
	bh=UyNDd2Xy5ZQ3z1UYEdDCvysH0oLAZM4c3IewCQkMw6Q=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=eBqTZyNxuu8TYv4umdKUHU+Eur3qmUjCwj9IzyGH7nu5HlSUpZJhPt5eFJX60t2j9
	 OHeeeS1hrw9f6CVBbExGvR7vwZRHBH6QPOrTVD/pCtZzimceazrq/EqXNohDXWdbwL
	 fuuJglPobVI/JRhx2jIsM3+c1u6LIDKgmEUyLdT8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8D36EF80104;
	Thu,  7 Jul 2022 15:26:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 46AC5F80104; Thu,  7 Jul 2022 15:26:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam07on2056.outbound.protection.outlook.com [40.107.212.56])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5E2A9F80104
 for <alsa-devel@alsa-project.org>; Thu,  7 Jul 2022 15:26:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5E2A9F80104
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com
 header.b="yrHkpd8s"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V24/EtVEf7tm31+FcrX2yTejksO/H+CG4BlYtlmJ1BvrdIA2ZV+ObgKZWr+mCJ2MfYmVutxvmctIO5AhUz4CBAY18MOAWFwb88VeBjfH12Z0ajOto5moKLvNUgpnedwlz1OqgngcuGsYpQvTHxv1+BzSnhB5af7AazfttPn6e4kOYV9pVcAqVZ9OQGdqdMWPk/xOuXxneq78Orms0JGrnP6Hn6MwvgU6UuZmRE6oaXIhzKhRZSiybrzZznHEftw/i0h2fr/HVYOTg4sUXclM4iHW//aKx2ffKvtYT6JGoip44FwGBqzvb1maoxbHk03MrYmfGmrJirvTmA89nCc4Bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HfMly5rDRIY47P6XSIpWR64TGn5M3TgXr/DrSkfpN1I=;
 b=kDii3V5hJyPOQScdNcfaQoDKqIpGKGgnRtwWYffzn+DWDOrm6qpwbPcSq6A99avCQP59a83aaXQIih0FZGDOMsbXuEOdfy+/gUvzAtVSEORGsbFiK02gG/GN8fvWvdFQq99+tuuu4G9ojdXrIiSU9q5+9S/aCyCpLubldsjpwjbfXLtEyZyyRKemkGuCICFAw9NTcxQyns8mv/MyqXowtFebLGCLUUr8rXCJRlOSGKhcj2zz0SLgCdmhVFdDn5PrBiJhhMzpERhUzz3dpsISbucA3KJO56Dp8fGRAjXCi5kqWH6cxJtV9INfAOJvsJo5OqctF5302N2G7PTg5JJRKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HfMly5rDRIY47P6XSIpWR64TGn5M3TgXr/DrSkfpN1I=;
 b=yrHkpd8syZuFSSC3IQXWaCXlry5uZPFaYNAvrRUoprvtyBj+vU0vi/td9TP3BRi1HNfYF3dYQVmtrkqnKi2jTjnBkrQP7d1CyXdNbj6BJwtvfl2/r9jDuhXRioO6wJXeXlgmT7U6ahLFP4PS44d5drTnm5oYAu0/QiS4N1jrBRg=
Received: from MWHPR14CA0012.namprd14.prod.outlook.com (2603:10b6:300:ae::22)
 by CH2PR12MB4200.namprd12.prod.outlook.com (2603:10b6:610:ac::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.15; Thu, 7 Jul
 2022 13:26:27 +0000
Received: from CO1NAM11FT007.eop-nam11.prod.protection.outlook.com
 (2603:10b6:300:ae:cafe::74) by MWHPR14CA0012.outlook.office365.com
 (2603:10b6:300:ae::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.17 via Frontend
 Transport; Thu, 7 Jul 2022 13:26:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT007.mail.protection.outlook.com (10.13.174.131) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5417.15 via Frontend Transport; Thu, 7 Jul 2022 13:26:26 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Thu, 7 Jul
 2022 08:26:26 -0500
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.28
 via Frontend Transport; Thu, 7 Jul 2022 08:26:22 -0500
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
Subject: [PATCH 1/3] ASoC: amd: remove unused header file inclusion
Date: Thu, 7 Jul 2022 18:56:08 +0530
Message-ID: <20220707132613.3150931-1-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 45566763-9762-4d9c-1cea-08da601c4b6f
X-MS-TrafficTypeDiagnostic: CH2PR12MB4200:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: W8nqQr6/lPb6QPC98LFvNKhX8bsSl3EUgByW5kxotNNv32kon8cO8luVEla2CLb/LGUtoRGNPtmwXg3YVtoXGGa9+zW4FS7PaiUpx58SiqX87L7afLndLfx9CYoX3SuFqPmFXS4KvXDAbsfGh4WElXichpEjaiFtezYTcOEkGqCNxn09CaghmhlPi2YYM46gsPt7Iq8Cc9Wj8FR4Rrz/Y77gcH/uWINV65eVhsQ3o3TgwaAMRnsICVHAJa3f+FsKWeQDfvi3O3JgFZSJJkw5lHHIEL2SXDICZIfL7T05pmjnnPeIa4+0yNqEVYDsYt9xyRj/VFyAJVHBhZajYqUQy775wIavxh7eXF6wE7BPfq0aGSxdvpa1fHBFFDf63piovOvqhGJGY1AaEMDDbnORp3r12k/d+/FZnFGTQtq0clvn8simMw9hJGE7G6TSBsXghj4BIe9AMkm7rvkUe0XZRDfTy2LtUP7hFzxZAc7wntuJdbzDiMXts90xFL+IqFiqGKVH7wFUw6gqivFJGH47ZUTs3Y75L5qlQW2utVldQWQ/cK/SwqDClH8tLO9gE9/t12R26BzOyqamVn4bDBy1RPLn7Ll1JNCf3IxreOBCMX5xnm6TX+R9Nm+/vK7UVKaYXW5QILjOVjw7jM49bgurAMW7X903EqJO6/Nd9ZlX3gBQxMfzk124n76HAyjCYLt7vJ7sOhazog7Xy+VJuteuQDgXpecLOX2TQMt7XQt/kYAW67JNbsZkBdz4eGBki4JH3zE3QeQY3S5fGOeZAvclVDk9pDVzGOcTxMXIVvUJizMULEAJDNEoVyacN0Se8mJPx98MIJ5TuPaJIgEhcEOPlCcEth92IWf9jc3WSlD0NoHccj6aRfFiDhvLwoVWT7Rd
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230016)(4636009)(136003)(39860400002)(346002)(396003)(376002)(40470700004)(36840700001)(46966006)(82310400005)(426003)(5660300002)(81166007)(8936002)(54906003)(70206006)(8676002)(86362001)(36860700001)(6666004)(4326008)(4744005)(110136005)(70586007)(356005)(41300700001)(316002)(40480700001)(2906002)(40460700003)(34020700004)(47076005)(7696005)(36756003)(26005)(2616005)(336012)(1076003)(82740400003)(186003)(83380400001)(478600001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2022 13:26:26.5395 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 45566763-9762-4d9c-1cea-08da601c4b6f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT007.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4200
Cc: Sunil-kumar.Dommati@amd.com, open list <linux-kernel@vger.kernel.org>,
 Basavaraj.Hiregoudar@amd.com, amadeuszx.slawinski@linux.intel.com,
 Liam Girdwood <lgirdwood@gmail.com>,
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>, zhuning@everest-semi.com,
 Takashi Iwai <tiwai@suse.com>
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

Removed unused header file inclusion from Jadeite platform machine
driver.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 sound/soc/amd/acp-es8336.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/amd/acp-es8336.c b/sound/soc/amd/acp-es8336.c
index eec3d57092fa..8ce26c9b3ead 100644
--- a/sound/soc/amd/acp-es8336.c
+++ b/sound/soc/amd/acp-es8336.c
@@ -23,7 +23,6 @@
 #include <linux/module.h>
 #include <linux/acpi.h>
 
-#include "../codecs/es8316.h"
 #include "acp.h"
 
 #define DUAL_CHANNEL	2
-- 
2.25.1

