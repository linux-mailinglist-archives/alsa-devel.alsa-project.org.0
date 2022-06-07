Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4938E533ED5
	for <lists+alsa-devel@lfdr.de>; Wed, 25 May 2022 16:10:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E50C016C8;
	Wed, 25 May 2022 16:09:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E50C016C8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1653487813;
	bh=edIEAjQ2KYmM9aV+tmy+6KMSv2TEBUBy/QSNqR+YuGo=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=u/JuDtTQ91QZOMTKBrnZp7by+n7BLe2nKxKWK8ftQZyav2vQYufTyk2qlBxwDUfoD
	 dhLpkcL3ucE1P3PsgYM6dplKCuySaMoaPRTzWD1DcL0bTEDZG7kt8GnT9QSXHLUvZW
	 /mbPoqStvO49JoJ277Lc5w1adRDvyHXqH9cD0wXY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 081C0F804CF;
	Wed, 25 May 2022 16:08:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4E0FCF80236; Mon, 23 May 2022 13:24:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20603.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eab::603])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 73A2AF800CB
 for <alsa-devel@alsa-project.org>; Mon, 23 May 2022 13:24:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 73A2AF800CB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com
 header.b="YM5Ao3Ck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y+RtbdKRSOa0EpxkMShDFWWglES8PzUCh4TYJopP2ZgwAw842LzynqIV524O+Tn4Hdp8V/SFXi2QFpeCk6frCH4Z/sXFvPNapnsQeVapFVJIt5GRs4bWbz+QjtxF73SIY4c4dyTVdPGAZ7RnhQl/cP9J6bMAnz8IoBMaht3UT+aj56XnjbEnLg+Kmuh/A7DiGXU/nFiQqFMyvPyrkyUDSDwf4DXGBWEI2x1s/gvg3MnJkqLCOv14/uTZgCv/UdRqUt69bNHUhVMdwUqoT0DWeOUZTDLtPCgJsv85Rn5tV0+y8fTF5LwKrW6lZW3zHLkQBT0WJuauI0f2ZDVGaJQ4Qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=higz6ZAS7M6qi/IPX06VS2uYoWJbsXQ50yA2ijYcUwo=;
 b=CU6RC7QwUSjO9lhwhQWRtGg6r3JZ5c46Ej3ig6+8pbQ9FeNmguT95s93bpfj/tCMKLaJ6P6GVU/wEMwnaTxSMFSKi8r6yK0uq1zXft0CWcab0r6eHCb81QWLe8EF5+nLd5zMJW8KPZk0HbEaP/lMXxINLlDJVLUBwvl6yp9fgoKy9ZLcRhCFGVz4Rwt+4+CXUWg8P0HWDdLtK0faIS4XOI7awCdCkD+QEPHOv89A+cX5Ns53dXxYgVPwFrH8VyRqxQTWw2mzpCOzuUw5ZZiBCjOFfekDhu1+iGEwLz5cA3XV6qTCGNBzw5V4fPaEEHyQiNevIgE5H/9COzptkjS6vQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=higz6ZAS7M6qi/IPX06VS2uYoWJbsXQ50yA2ijYcUwo=;
 b=YM5Ao3Ck4srcAqnBsdJU50bcJBW7tPx7dFaKE7Umw0Eo6TOvJc9OU0zPAhGJ5t/TtmsA2KNzV6FbfcCb8KMhZ/VEu59t9ANa4BNFoyDg511NDEF+gFZCPrZYQfjgGw32Mp2VBaQpmSEFYraRAMvGbEeHWJDwaACbAKkJWFeeLEo=
Received: from BN6PR11CA0065.namprd11.prod.outlook.com (2603:10b6:404:f7::27)
 by MW3PR12MB4571.namprd12.prod.outlook.com (2603:10b6:303:5c::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.14; Mon, 23 May
 2022 11:23:59 +0000
Received: from BN8NAM11FT053.eop-nam11.prod.protection.outlook.com
 (2603:10b6:404:f7:cafe::f2) by BN6PR11CA0065.outlook.office365.com
 (2603:10b6:404:f7::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.18 via Frontend
 Transport; Mon, 23 May 2022 11:23:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN8NAM11FT053.mail.protection.outlook.com (10.13.177.209) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5273.14 via Frontend Transport; Mon, 23 May 2022 11:23:58 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Mon, 23 May
 2022 06:23:58 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Mon, 23 May
 2022 04:23:58 -0700
Received: from amd-B450M-DS3H.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.24 via Frontend
 Transport; Mon, 23 May 2022 06:23:49 -0500
From: Syed Saba kareem <ssabakar@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
Subject: [PATCH] ASoC: SOF: amd: Fixed Build error
Date: Mon, 23 May 2022 16:53:08 +0530
Message-ID: <20220523112311.3087070-1-ssabakar@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1faec6cd-abb3-4041-9f09-08da3caebb33
X-MS-TrafficTypeDiagnostic: MW3PR12MB4571:EE_
X-Microsoft-Antispam-PRVS: <MW3PR12MB45711433B55A666A8F95D899FCD49@MW3PR12MB4571.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hRTyYzYvWgrb8eYVeaitFtYPzyo2z1GW/CFUtrVGpQ+ggelCbEdEBq15deKYPMDMKRTF5IEoWEMNvig0tW5FzdGrM2CfqZ2Hj7w9q8G0yW3/AX7atG2i+tu0Wt+odBxkcXyU8wB7rdNrrV3I0PUCIlkY2MozTv5FDYn0036621amP9NmrkajS8+l3opK3KKeKfivFfGVmPUl27F4u2YalNEIwlN+1/04WKzCC7VuDO+q2hBhXxnkjYNQsh7F15Ub5L4RyGVoaC3h6FHzIxxnlSbXfdAOXNsO4uIJcCfWUOV5CPT2POjmXlyBzgQLW4Yu8nyJSKbQ97UmDk7uBJKrRgQqFeV/lNufxGI1jsjYHOh+AyKn82ei9HPbzUwz3IYINK0FWA8eaXJCCDbe3ENvOInrky2AfhSHc7gLyKzu9TmVPJrmCEB7OKFOElA1kjW9yFP8WEZxPiMMIj5cFJDRgrT1MhktQQMNc55BKJC/UsO4reLH/UhwmluGKqMYHd3Dc5kM0GXsIVTRSayqSb3GFW5ue3MHIk5uf6Qmz7YZ/LZbXQJ71btBY+lV977Okf0FlfKmUPlJQ9sxzDzOn/RtZLPXTqo7Gb2vo0MGZcvvhMs3akIltQWSz7inLnVaGk5LitjJ3pCxRWTwwrFp/ja0hFARZBAl9r+mdnoYyPQOcH7KKHRAeqIvQDIImn5M4SewhdznAaCkZXlukBLag1pEUw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(46966006)(36840700001)(40470700004)(1076003)(4326008)(8936002)(82310400005)(356005)(81166007)(8676002)(7696005)(26005)(508600001)(70206006)(6666004)(40460700003)(2616005)(70586007)(4744005)(47076005)(36860700001)(2906002)(5660300002)(316002)(186003)(336012)(110136005)(54906003)(426003)(36756003)(83380400001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2022 11:23:58.8420 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1faec6cd-abb3-4041-9f09-08da3caebb33
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT053.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4571
X-Mailman-Approved-At: Wed, 25 May 2022 16:08:39 +0200
Cc: Syed Saba Kareem <ssbakar@amd.com>, Sunil-kumar.Dommati@amd.com,
 kernel test robot <lkp@intel.com>,
 Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>,
 open list <linux-kernel@vger.kernel.org>, Basavaraj.Hiregoudar@amd.com,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Vijendar.Mukunda@amd.com, Syed Saba kareem <ssabakar@amd.com>
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

Add linux/module.h in acp-pci.c to solve the below dependency

All error/warnings (new ones prefixed by >>):

>> sound/soc/amd/acp/acp-pci.c:148:1: warning: data definition has no type or storage class
148 | MODULE_DEVICE_TABLE(pci, acp_pci_ids);
| ^~~~~~~~~~~~~~~~~~~
>> sound/soc/amd/acp/acp-pci.c:148:1: error: type defaults to 'int' in declaration of 'MODULE_DEVICE_TABLE' [-Werror=implicit-int]
...

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Syed Saba Kareem<ssbakar@amd.com>
---
 sound/soc/amd/acp/acp-pci.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/amd/acp/acp-pci.c b/sound/soc/amd/acp/acp-pci.c
index 340e39d7f420..c893963ee2d0 100644
--- a/sound/soc/amd/acp/acp-pci.c
+++ b/sound/soc/amd/acp/acp-pci.c
@@ -16,6 +16,7 @@
 #include <linux/pci.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
+#include <linux/module.h>
 
 #include "amd.h"
 #include "../mach-config.h"
-- 
2.25.1

