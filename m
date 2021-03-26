Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BC4BF34AC7F
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Mar 2021 17:28:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3AE4E166D;
	Fri, 26 Mar 2021 17:28:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3AE4E166D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616776139;
	bh=ZSDpa3PzhSOPIn1WhsMVuxKbHP9D87nC93LuqZWwYbo=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=QtTExxyVNIN/7lyTXS4lQ2ZhDza3YQ7osRrmDi95TtaJwKvTzJCE/RV53JbbeBMR8
	 MFrJw5/yufew6Oy45R8dGlWz4LZEiIGDpdHVDl+XPEneRfxKzWxjMXypJGv2QKtDQq
	 sNsbk687at7+TevANmNAmF77PIbYbT+by7nSgCe8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F240AF801D5;
	Fri, 26 Mar 2021 17:27:33 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BE368F8016B; Fri, 26 Mar 2021 17:27:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_64,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2069.outbound.protection.outlook.com [40.107.236.69])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 94B30F80103
 for <alsa-devel@alsa-project.org>; Fri, 26 Mar 2021 17:27:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 94B30F80103
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com
 header.b="ib+/X6sT"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G0+v5q8GT8daoQBty+vCMiROXrOdyfI8ZRMiyflqGHxPl1rJcAQxd9x0eFccAi38hkFVV2c1+XeGbnakmnBtrZCCIr8SLgmSCMvpvQJMU46wVRB2yo6Qnb3di89G/SpIW80p4sok4RuexG8kv+GbT9t9Os86n3kWHr5zhuTn1ryFaHVxed+2KiS8AM2n3ZJY0PqhE8e9mtbZEpi2wjYaBGCtj8S+1mt+JTjXKvllsmhH8XZFA1aQHfCR+6SgXBRX1YBSsXQpIn8KcCE/5mXUFKX5DFBjGujj39EoqqS9jXANLTgbShin7l2xfOJCsHhL8e0WerTUAfqBigK6mo+YlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OUPOVDzeOM1lnX3E6O81aEglFvA7amf6FgUqTfe5F0o=;
 b=YGxJ/Pvpb4CYcRZMl6p2DmAnod+y7mOT5aTr9lT9KLjW9L7+IO07xbZ7pUTa+sxY8GR7DU+dr5x427tZM66ExqSMzk+ezQq4dlz4NaTULNNdvpLdIC2DmW6ZNk7Go6fW7MKVm8CvkD6rwBd1Xe152ehnB3sGFx4QuyIZspkyGbk8qccGJqqehUd/hnXtc18cJIDN+nJn1z18pZ5Of32cT4yR3GneJ3N9/vbGR54b4FoIotxDSfRPLOG2/R3eMjApQN6BE/jx++jLyJmvYfSq/NqoV+TcUQSt3gaVZ/+8PDbLzOSvX1LYDmqLYoFSKrEpRF8Zfr936jTTowMAJxPpwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=amd.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OUPOVDzeOM1lnX3E6O81aEglFvA7amf6FgUqTfe5F0o=;
 b=ib+/X6sTvi1e4WIxozFRCMxODfRHlmTGe/QEI55MtuXFj+d22tvDOoUA9uwxX8BkvGBu7HaswrmzoacO+X1di+asBAVnQWdgSfPPoRsiNl3eRHEKlaBuFfT7XSaGLosLRuRdqzazz8kd8pCDGZrcR0ByBWIGBZt17aPd74eAe18=
Received: from BN6PR20CA0055.namprd20.prod.outlook.com (2603:10b6:404:151::17)
 by DM6PR12MB4435.namprd12.prod.outlook.com (2603:10b6:5:2a6::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.25; Fri, 26 Mar
 2021 16:27:17 +0000
Received: from BN8NAM11FT012.eop-nam11.prod.protection.outlook.com
 (2603:10b6:404:151:cafe::ea) by BN6PR20CA0055.outlook.office365.com
 (2603:10b6:404:151::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.24 via Frontend
 Transport; Fri, 26 Mar 2021 16:27:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT012.mail.protection.outlook.com (10.13.177.55) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3955.18 via Frontend Transport; Fri, 26 Mar 2021 16:27:17 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2; Fri, 26 Mar
 2021 11:27:16 -0500
Received: from LinuxHost.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2106.2 via Frontend
 Transport; Fri, 26 Mar 2021 11:27:12 -0500
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
Subject: [PATCH RESEND 1/2] ASoC: amd: update spdx license for acp machine
 driver
Date: Fri, 26 Mar 2021 22:14:30 +0530
Message-ID: <1616777074-5151-1-git-send-email-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 351bd0a9-05e4-4bc5-8bc1-08d8f0740589
X-MS-TrafficTypeDiagnostic: DM6PR12MB4435:
X-Microsoft-Antispam-PRVS: <DM6PR12MB4435A165FE926C18DF3B8CB597619@DM6PR12MB4435.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5uLMib+6UwL38BikGyjQsqNYE7Mp4vW4VfgZPAIIA4f2JoE44KNQ05RHZYZWfDHybE/IJY0r8QgjGVQGxnuhFvAiTwIlXJsJA3sLI+i/82F7VcUY6b3TeZe17iOfRlKwRAwGtUdr/IY4fq3R/UqoJGZaEz9O4bmTV0X806G++7nxbRgE0uKP17pTmg9lJrzATiSc8Sn6uuiiL5P/OPeEBsQqwiK5atwibvD9rO2pMQiLt4g2AkLpPwQGI9arYa8uvPs1FslwGHQSS0TSOXsN6GoMG3nF7K+Tjn+d+XZ9L60fwKSq2s6zaheLufI4MfZV3UNYqNFY7WvzhINQnKaxLxSL63xGjKpr4j4M8R+gLnl6mQt29Lg+cbCq+Ssq2m680GL1rxO4QMeYlOnS5xsUMUcF3HSqbFPPPPg3Qyb7sYCmUIR0Tbdh5zHoPohzFG9jc7TTQloOVnomA8mWjkVjgg0p4C/FFs3qjIyxX2l8obQw2HaOJ7q46AHhD4tAJLJhnRjGPmIu9RzSzXpvcnwhakXpQ9dJ/zPBW538+gt1c9T7B0QvIqSuhrjYMOZgaZjKQV5lm7hHFeUI9Fxv2BNiXwuuf1fD4XV/37GZZCyL15JqL0bFzArIC51jznHrAVe6HSa9amEKc/0EqJSIZCutYj5ExzweigQbcNpw5dzO5E4XPn6TqTfPy5oqGom1h1Ms
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(376002)(346002)(136003)(396003)(39860400002)(36840700001)(46966006)(15650500001)(83380400001)(2906002)(81166007)(8936002)(5660300002)(356005)(426003)(8676002)(4326008)(70586007)(336012)(70206006)(2616005)(6666004)(82740400003)(26005)(316002)(186003)(82310400003)(110136005)(86362001)(36756003)(478600001)(47076005)(36860700001)(7696005)(54906003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2021 16:27:17.2258 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 351bd0a9-05e4-4bc5-8bc1-08d8f0740589
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT012.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4435
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Sunil-kumar.Dommati@amd.com,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 open list <linux-kernel@vger.kernel.org>, Basavaraj.Hiregoudar@amd.com,
 Takashi Iwai <tiwai@suse.com>, Chuhong Yuan <hslester96@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>, Alexander.Deucher@amd.com
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

update SPDX license for acp machine driver.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 sound/soc/amd/acp-da7219-max98357a.c | 29 +++++------------------------
 1 file changed, 5 insertions(+), 24 deletions(-)

diff --git a/sound/soc/amd/acp-da7219-max98357a.c b/sound/soc/amd/acp-da7219-max98357a.c
index e65e007..84e3906 100644
--- a/sound/soc/amd/acp-da7219-max98357a.c
+++ b/sound/soc/amd/acp-da7219-max98357a.c
@@ -1,27 +1,8 @@
-/*
- * Machine driver for AMD ACP Audio engine using DA7219 & MAX98357 codec
- *
- * Copyright 2017 Advanced Micro Devices, Inc.
- *
- * Permission is hereby granted, free of charge, to any person obtaining a
- * copy of this software and associated documentation files (the "Software"),
- * to deal in the Software without restriction, including without limitation
- * the rights to use, copy, modify, merge, publish, distribute, sublicense,
- * and/or sell copies of the Software, and to permit persons to whom the
- * Software is furnished to do so, subject to the following conditions:
- *
- * The above copyright notice and this permission notice shall be included in
- * all copies or substantial portions of the Software.
- *
- * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
- * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
- * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
- * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
- * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
- * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
- * OTHER DEALINGS IN THE SOFTWARE.
- *
- */
+// SPDX-License-Identifier: MIT
+//
+// Machine driver for AMD ACP Audio engine using DA7219, RT5682 & MAX98357 codec
+//
+//Copyright 2017-2021 Advanced Micro Devices, Inc.
 
 #include <sound/core.h>
 #include <sound/soc.h>
-- 
2.7.4

