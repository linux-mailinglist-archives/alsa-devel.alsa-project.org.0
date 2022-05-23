Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BFDF4533ED6
	for <lists+alsa-devel@lfdr.de>; Wed, 25 May 2022 16:10:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7084B16E1;
	Wed, 25 May 2022 16:09:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7084B16E1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1653487823;
	bh=m7FfRsKkGgH9eX6AOQTZsS6XIFEA2yt14Zv7zZwZ+Do=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=JjcRM+vbZtF+8KdutM0w1kfC00556kACs3keoMTQb8VWQB/5/FfI1HaOuO7cnwxoo
	 AYPW9XZV30At6O6/omOJj9BWagBfBkSPe1kDSqHm16yJ7ClS4P648lDQMBlRYwIN28
	 jtxo0SWUdTpisXL9MktJfvssphwgWvTFL6Z0dCXM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9F5CDF8051D;
	Wed, 25 May 2022 16:08:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 72B29F80236; Mon, 23 May 2022 13:30:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20607.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe5b::607])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1447FF800CB
 for <alsa-devel@alsa-project.org>; Mon, 23 May 2022 13:30:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1447FF800CB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com
 header.b="1iW6Smha"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E08PxoH98zZWNcsQTml9UIBnY5vPvwwBlSrdXHIS1o/mascHnGtpHmWwESt+TwGg724wgdl8/K7BMRU0G234P65ULBg3Q+TG0zE5MafCEBLi/JBG5vIp3kRuUl+ebrHMeRZ+2kbWQfFHWjIsfbBJtK3mSIfDNNyVVcW1cvnIdlGZo7a0w5tPbbkuPv683QTlxGWp2t+8Vpdtc+V5de6sL8LwDwHyGA+DVbCvq64A0pfI/8GsfHGhlOAoKTy8vVMImzDijhGqVOL6JxryKw4pBaOMY2J+Vc0pxgmFodO0AOoMbEiDUkiwbQUPpOCGkm27uPy3jdePLBJsl6ZnPw6zeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bMTYoLt11ZaYE1U1BYzrGqbPnmLeIEx2aYALfI6mm3c=;
 b=aC25XajS0uqa6eDsSTi8y5HLa2BphosTC1fTklRs+pOCsio0JejtpKJc0Xv7RCT4Loe/C5sDCDcw1a20olOLTUgCk784InMEWXF6/7FjZboMvHDUP7YGXMOKPVlk69XvK1Jwt6Q63v5xvdkFuicxDYXXNExP4SFNeZnq59siMitNAVstyLgltlfuOC/S9sAPrq6YqkKyvYSsQwYpsfwBAQJJaFjfzY8LVkxSkSfEthln+tAD9zrNpy3VX5+761FiuhOwDOLa1DUTJrGChvN28GrGRsHP5IAeHSHGtt97Rn/1e7HpO2Z0kU9PVZLAEVj1LG32JRF0HqddFTOWLWbvYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bMTYoLt11ZaYE1U1BYzrGqbPnmLeIEx2aYALfI6mm3c=;
 b=1iW6Smha3SjxHmx4wWK+Jb1aLPi0WyUx7sUUpSwGNABEypzTcgvo04fIAdP3/t9kFQcxhPufTQqVPRO+DcXslzcmW0VyRi23or1lH5VdiCd0CzYAyiOFjQNu/ODnMry6g9dP2mGU6CFVRsO2Wt9qF9O4v6WrtxNNybasfZgMz8A=
Received: from MWHPR14CA0016.namprd14.prod.outlook.com (2603:10b6:300:ae::26)
 by MWHPR12MB1741.namprd12.prod.outlook.com (2603:10b6:300:10f::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.16; Mon, 23 May
 2022 11:30:44 +0000
Received: from CO1NAM11FT055.eop-nam11.prod.protection.outlook.com
 (2603:10b6:300:ae:cafe::7) by MWHPR14CA0016.outlook.office365.com
 (2603:10b6:300:ae::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.17 via Frontend
 Transport; Mon, 23 May 2022 11:30:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1NAM11FT055.mail.protection.outlook.com (10.13.175.129) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5273.14 via Frontend Transport; Mon, 23 May 2022 11:30:43 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Mon, 23 May
 2022 06:30:42 -0500
Received: from amd-B450M-DS3H.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.24 via Frontend
 Transport; Mon, 23 May 2022 06:30:33 -0500
From: Syed Saba kareem <ssabakar@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
Subject: [PATCH] ASoC: SOF: amd: Fixed Build error
Date: Mon, 23 May 2022 16:59:53 +0530
Message-ID: <20220523112956.3087604-1-ssabakar@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 473b6918-063a-4e42-e74c-08da3cafac87
X-MS-TrafficTypeDiagnostic: MWHPR12MB1741:EE_
X-Microsoft-Antispam-PRVS: <MWHPR12MB17418B1844CE394131CCAE77FCD49@MWHPR12MB1741.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9VyrolCUyTupML8s61CX2FedS2aQ69OiOQUERtUNcje5sHdH6BdCSI7o72kXcvhaMfWUrxKx061RPKMgJiKrROaYWyT6A3UnUKc1Us6rd//iPVEu+6jENsWUmcsXw/Fwby0SVQR6xDDDuodunwTaSzrapwiQCxmKlGNzeb4w99f75fRUqso/amBO0qHoJrqM8EuaqooLuDyYSMMNfiJK06ti8jBi+/06ZsuA+mFq1xOJ8MKy3/EIqYGN4C6lCXfm403cbRQFzGfRNdoERs/eWBogzxBd29lYSZ3zNoi2KwAWkDWL+WBwCFuoZXMxQD+hbMY9GCL2zMfKLcio8Qa3gCf0QGxXkpzEE+3gFgr+rnNDWg040cUW6YLq/j3Vnq+aYCnfTU3Kny5++DFbwGKdYMzsFDFqyv0Z79kfqQaABCCXs7O/FZnN3TSRhhv7Cyd2ZehiWMnrtALg8XbI3vjrum1fuDOtIqyEscS2d6tFZ24SC+qgaUIi89pKBFJRHaEPrksNQW9DG5ZVOi+N1C9fnd0LTmhSBrP9K5F3MystrY/cPML32BLdYBeUPMRYrBHwHpsp0jW7yd5MpFX72ZeQj7igF/NaS3/ywkO4rDNpH97fL657kAR8EiHr22aT3zfDE6gC7G1tLdVp6a8Sf1QMKwJeb7lIAwLWdcB8iIMOvuAzjpakc2U23nMaOL0HZVdc/63IBjntBrnhwaY8SKK2iA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(46966006)(40470700004)(36840700001)(82310400005)(2616005)(70206006)(70586007)(8676002)(4326008)(356005)(7696005)(508600001)(54906003)(110136005)(316002)(40460700003)(26005)(81166007)(186003)(6666004)(8936002)(5660300002)(1076003)(4744005)(47076005)(336012)(426003)(2906002)(36860700001)(36756003)(83380400001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2022 11:30:43.5846 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 473b6918-063a-4e42-e74c-08da3cafac87
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT055.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1741
X-Mailman-Approved-At: Wed, 25 May 2022 16:08:39 +0200
Cc: Sunil-kumar.Dommati@amd.com, kernel test robot <lkp@intel.com>,
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
Signed-off-by: Syed Saba Kareem<ssabakar@amd.com>
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

