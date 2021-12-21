Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 028F147C3A3
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Dec 2021 17:20:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 90BB716EB;
	Tue, 21 Dec 2021 17:19:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 90BB716EB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1640103601;
	bh=utTvJ3o4izp4ncLUwVrSoz04CD72QRjWMbQHet3bhPI=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=dN0vLpdnNJWLc/nujns01bR4M2LefP9Kv8pXd3YbA3prn1GQCn6parYLBiPc4/BMy
	 01qzvAt4wsbYQ8o8VZCZsSdKTmz/UctLBVS0ht21Dlfo73p6h6WRRInj5UDRTWHhpZ
	 WmmkErvUYXx2RbySFUOPKmPKPd3Re/qDe4S5Vwrc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D8D0EF80125;
	Tue, 21 Dec 2021 17:18:55 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 30220F80118; Tue, 21 Dec 2021 17:18:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2045.outbound.protection.outlook.com [40.107.93.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 291CCF800B5;
 Tue, 21 Dec 2021 17:18:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 291CCF800B5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com
 header.b="I6zy5kTk"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O3WlC9nRJDT1HTrsxu9kgqCXtm3IUSnB32URbxRGy4o1oe5CIdl19b4wWImlpe+SUmGY/2/yGYlWdrmR0SVseoVkaMBUOWNk6lprdhyCykrDQK9y5VrefQqx+xm/6FMyKDmxeDunDx+qVWDTepEy/nygblAMc8rgsk54my1tb2IoKBjPxI6SRYL6Cw3uKUCOWGzbwWDymDEU1Tnl6uDTdVa50FWeDoiBja9ZH6AEezRAAPV3U43OjCRaCm1hFLrjhl6sp9lJjWC3UiCO4sqZKJ3FqgswUKaBELpWfrlIR1Gzjckxgz8BQ92i7vbCYElYZamQvSpnsmSMj6DOEghe+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C0JhfL/tWlEZs/2BnC5c+vVm4l5UDvIAgDih3fuPBcY=;
 b=cKMNuo0yBzJIq/UjELknHr17qEcmK52v27XwZo0MdwSp1fGtPeVjkqg/beT4ynz4asd60VvIs4NJx8sJT3wkLQi0Q1oFPpwPwxDwOlJZd0LvT/6JFgcsQZBO+x2QKQwjDdoYh99CTf+1dQAl2nGPIwHb0lfHed6TvZYPgHKllc8dCGKuGuYVB5xWcfnROlkQKhieppChhb4lsfGPGubr4rpzf/sNFW7PlSAa0MlIDE+y8SL4N2gfIZqxd98ks3ezPG+FNCmzS1ESI3SKSgYFFF0IpWhphqib3B8a6eJXPgrypjulVn+joATxZXTo+dqPz2lyScHL8/hnrQjhA0SvXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C0JhfL/tWlEZs/2BnC5c+vVm4l5UDvIAgDih3fuPBcY=;
 b=I6zy5kTkEkvgEKRGDDmwZC6GilUMBqz1dldbhRq4pTbJhJPV3SBkzoBK1flz3kyyAghiNh7AugWlYRCBt08oKXBILiYkfs9I0LOBXDgdR95Fzd2VET6IyPgBd/wuQR4xY4TE+Jh5nSaHK6mVQP933s9GzIqamOSIBJuUSdUpqDE=
Received: from DM6PR05CA0050.namprd05.prod.outlook.com (2603:10b6:5:335::19)
 by BYAPR12MB2599.namprd12.prod.outlook.com (2603:10b6:a03:6b::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.14; Tue, 21 Dec
 2021 16:18:36 +0000
Received: from DM6NAM11FT018.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:335:cafe::99) by DM6PR05CA0050.outlook.office365.com
 (2603:10b6:5:335::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.14 via Frontend
 Transport; Tue, 21 Dec 2021 16:18:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT018.mail.protection.outlook.com (10.13.172.110) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4801.14 via Frontend Transport; Tue, 21 Dec 2021 16:18:36 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Tue, 21 Dec
 2021 10:18:34 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Tue, 21 Dec
 2021 10:18:33 -0600
Received: from chrome.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.17 via Frontend
 Transport; Tue, 21 Dec 2021 10:18:29 -0600
From: Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
Subject: [PATCH 1/3] ASoC: SOF: AMD: simplify return status handling
Date: Tue, 21 Dec 2021 21:48:07 +0530
Message-ID: <20211221161814.236318-1-AjitKumar.Pandey@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cd2e92c1-9e70-4153-5e33-08d9c49d8a78
X-MS-TrafficTypeDiagnostic: BYAPR12MB2599:EE_
X-Microsoft-Antispam-PRVS: <BYAPR12MB259965079AA07FEA050F6DF1827C9@BYAPR12MB2599.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:923;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: s0DUIgs1AIkZbEmIfIVkgxjJ/lKcOBwwI2dyDlcmeFTckD4AZs7wCr+tbMqke/YdP1fRtFWbswr6wuOpH5wVoSpNVPJO3cfXhcEmK/vX8/tlZzIibx5ZM2HfI72Mg8GZzhWCTenHRagqUAk3TI+sPNlwlcFgef8t8DH5CnVDbh+pg9Qr6D5gzCwc8omdz3fCIK1ARUjdbsyEwfzuAk17eNc1s+drWWRiUamuZi1yFP9xuaKalWjc8cBxBGrvJehtfOiUwUBYoC5GIJ9cqYYDrUCXdilW3BBX+vgfGbi3jO1UzjeGa8I7KKCkZrdU5TxKeipNA80bNhM1iO9gehbe+Vb3abX+KV3QLeweo26sIt7UaGCCLWmWdJmRCpzdez3l/iWJDEmlBswCL2uDR0O8zvJmR8dbQgT5wMMzbUsf4i5zJY2+tLnMKbitBKWXiYAC9D6TwaSebiFdfS85I6fqDbf1p7CP6AiJlRH1QQtp8Mv6Rf1WGhlBGUU7hhI91he6I0Y+t/tqbeQvNlaSkH3XRa6ntjqDXO4ZgzebOhkxmMCu0RvhebIFcj5zpiZJ/NXiT7CnL7q8sPPAN+ZRaOS1PqEeE5dwNg0waX0vF1yf9dxvdAKLCwPri5oeQ6NCZ4U+Po4zt85tfiTCC4RWNvdiaDppjwJRyTQXQ1Esnsa+6TD2sd544nIaLmHo4QdgqH8Vy5VrKh+9XA0EnjOXWM/B9SoIp01tt1VN9/d+ZYtwBoIQAEGjBrzW8GnFBvsSj6acJ/rK1avnRC5TPnkrP58ssZzwqOw0D6IDx9QFYHYFtSQ=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(46966006)(36840700001)(40470700002)(8936002)(336012)(40460700001)(426003)(70586007)(82310400004)(47076005)(70206006)(26005)(508600001)(1076003)(110136005)(8676002)(83380400001)(4326008)(316002)(54906003)(66574015)(6666004)(2616005)(186003)(2906002)(356005)(81166007)(7416002)(86362001)(5660300002)(36860700001)(36756003)(7696005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Dec 2021 16:18:36.0752 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cd2e92c1-9e70-4153-5e33-08d9c49d8a78
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT018.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2599
Cc: Sunil-kumar.Dommati@amd.com, open list <linux-kernel@vger.kernel.org>,
 Ajit Kumar
 Pandey <AjitKumar.Pandey@amd.com>, Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Daniel Baluta <daniel.baluta@nxp.com>, Basavaraj.Hiregoudar@amd.com,
 Ranjani Sridharan <ranjani.sridharan@intel.com>, Pierre-Louis
 Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Vijendar.Mukunda@amd.com, Alexander.Deucher@amd.com,
 Takashi Iwai <tiwai@suse.com>,
 =?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
 Bard Liao <bard.liao@intel.com>,
 "moderated list:SOUND - SOUND OPEN FIRMWARE \(SOF\) DRIVERS"
 <sound-open-firmware@alsa-project.org>
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

From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

cppcheck warning:

sound/soc/sof/amd/acp.c:222:9: warning: Identical condition and return
expression 'ret', return value is always 0
[identicalConditionAfterEarlyExit]
 return ret;
        ^
sound/soc/sof/amd/acp.c:213:6: note: If condition 'ret' is true, the
function will return/exit
 if (ret)
     ^
sound/soc/sof/amd/acp.c:222:9: note: Returning identical expression 'ret'
 return ret;
        ^

Just return 0; on success.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/amd/acp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/sof/amd/acp.c b/sound/soc/sof/amd/acp.c
index 4c5550e8d364..fe9b7dc5bc86 100644
--- a/sound/soc/sof/amd/acp.c
+++ b/sound/soc/sof/amd/acp.c
@@ -219,7 +219,7 @@ int configure_and_run_sha_dma(struct acp_dev_data *adata, void *image_addr,
 		return -EINVAL;
 	}
 
-	return ret;
+	return 0;
 }
 
 int acp_dma_status(struct acp_dev_data *adata, unsigned char ch)
-- 
2.25.1

