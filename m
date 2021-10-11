Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D3065428682
	for <lists+alsa-devel@lfdr.de>; Mon, 11 Oct 2021 07:55:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4AC961671;
	Mon, 11 Oct 2021 07:54:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4AC961671
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633931737;
	bh=sfxthqhpcowdWgkMxrYid07tqsyu1+CLjk9Gs1uyt2s=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=suY+iyZCNLz9w7k/cvCoBEI6Ob5iPeLbwPl6k/UBR3E1kAQkiHV8rTluRZ/4Hv1vk
	 ePL9C5f+rjvql0/rNZL08bWK1y1iT1cCMp1daXyUUuoIxAgkt58vid1MfBseh1OQVZ
	 StrcA+Kz34zEtiD5+L3n/r76oCnlhj5r0PIoi/vc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2D6C1F8016D;
	Mon, 11 Oct 2021 07:54:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 768A0F80269; Mon, 11 Oct 2021 07:54:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2049.outbound.protection.outlook.com [40.107.220.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 621B6F8016D
 for <alsa-devel@alsa-project.org>; Mon, 11 Oct 2021 07:54:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 621B6F8016D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com
 header.b="p38iy4ez"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n+5/wQj+fPsGvAMrtE9hWurs5XTHTVzvGsuKhGTBs65ixp7XBqgKb4w5UibIzF5J1HuibTIM4+QDn28kSEI7LkKsjv4HvZpxuTak4ydtM6mcxAK2IZ1Kj59e/A1RRFLm4rMFKPweoBsm8s4s7cpwh/alnY5bp+OqlmoadYHW8f7a1wIZnVMZOj3KJVq8eJAv7U8v0g9oIpfrxY3qdowVXQXVuFCcojtMoAh9YxPPkFnYrWmXFsbU2Ox17jbycSq/ZJcGJEQv5yM3etJUsiiqau1/B5C2txiLZgHM3TLNhU5qGLhniE3n7gkWDQN/JZm7TvNoULP9tbjFpceZwR79dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1pOy6LqmgSBBtu403W9qa+2xxpZoxTlcYPuQoiRSD+0=;
 b=NDwnqbRZzox9if3Mg0KJwe2OGh9ub1RKT9CQ6AJbRHzbAILWAG5jZEiA8l795EPxhzD3Mr4W+KHjATvRy5tmwv+po9IIE+b6e4aMkOhH/nsyHl8xQPkzCerJju/Q0mUD9c1xpSJiie2PpZfDn1vXRsnj5l5ZkiG4BVBSEIcoxvYZnGb/L69wsjyMwWuR0W+ORb7BFbgbymZWkY+xqAwsXOQjxVGmXiep2n7oMFxOy3tvk1nL5322kPSMgIAzAAet47bczWhBQyOnBu1mesyyYzN6qwP2OwM9mxVcBtS73ARPbvcIVI7njX4+jVtZabPUqfSdzuQASsMaTtU9oCkFBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1pOy6LqmgSBBtu403W9qa+2xxpZoxTlcYPuQoiRSD+0=;
 b=p38iy4ezu9JN/3zScbrqMo6OH+j8SqI18jQPmzcYdO3nURRt1E6jLToXNKexWc2+gPP27Qy6oaAVWqLZxcBD/Lk4/J+XTjYSEuPwixqVnhC4J18i7/v6XdMlPVwW4K9sBk9T53W7BBCaajztr4hzt88OQJMi7gFcJJYV4Ni5PO4=
Received: from MW4PR04CA0079.namprd04.prod.outlook.com (2603:10b6:303:6b::24)
 by MWHPR1201MB0221.namprd12.prod.outlook.com (2603:10b6:301:56::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.24; Mon, 11 Oct
 2021 05:54:08 +0000
Received: from CO1NAM11FT041.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:6b:cafe::64) by MW4PR04CA0079.outlook.office365.com
 (2603:10b6:303:6b::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.18 via Frontend
 Transport; Mon, 11 Oct 2021 05:54:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com;
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1NAM11FT041.mail.protection.outlook.com (10.13.174.217) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4587.18 via Frontend Transport; Mon, 11 Oct 2021 05:54:08 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.8; Mon, 11 Oct
 2021 00:54:07 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.8; Sun, 10 Oct
 2021 22:54:06 -0700
Received: from chrome.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2308.8 via Frontend
 Transport; Mon, 11 Oct 2021 00:53:57 -0500
From: Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
Subject: [PATCH] ASoC: amd: Kconfig: Select fch clock support with machine
 driver
Date: Mon, 11 Oct 2021 11:23:53 +0530
Message-ID: <20211011055354.67719-1-AjitKumar.Pandey@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8e03226d-b9d1-4c4d-46bd-08d98c7b8a84
X-MS-TrafficTypeDiagnostic: MWHPR1201MB0221:
X-Microsoft-Antispam-PRVS: <MWHPR1201MB0221D5749B5559E00B64631482B59@MWHPR1201MB0221.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1186;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fyFqaky8uFSWf0NGHrsTYk630u0mg1QCTRpivgBpw9VLJFvB8asL5Oo6g98fZ6f1cEw6jl+EBcinSAPlAVBftC0uLmLOTxkB84aenMR5pHi/t8W6GWIWcL1Ma+oqmsmYjvyYu6yBk9wGpOWPQqLSwBqG6MnlCBMDxNdnwSHfMq4MsfpfHotAggu7yO5/mbPEnN2sSjj8s9IZGfvBtX5RmWusb9Y0iN06q+9GjjZxickT0FKK0r7vZJHdUx4AdeH8CVPOxApJVrVYz4kI9UPL8UhWdGJ69YgVNw6F0SbBlOrIedBHlU4K4t5Zfq/pk0JL/iTkxKg3/KgrPCaf5uEfdkv85qL1tQ/4VQqDHgiV3rMBHzA+rLafniYhHTnBge4p9mp7Yka4cVQtFTUwEVpq8XT5XiTgw5QLze9Sqmbntq7dszrLMZL6wggcidKIf9jPYn8xb6vAH3IsLNJYy2iotC6WawZUnrvqQcwjygGY5HzqNcfwbmTTCR24xs8fKaeChvCY0m/JvS9S4e5b+YFjKI3wwubfa7O51vCiKmdfWq0/6ORxQvoW3n+L+qFp7aCbdH1sUABBW5qrL8unmtsDjxpkolInNetJcktUJFcS6/qjW50OnH3pVO0vjcQtGQ75RF54pjlG9ZoUYUB5sILVKQ8apVJHGdRsMl04I5nbiHEoLDvHi+u01SRtGE+xRXNueohILtmvrK/6fd2ntSwulewWSnpgTrY4YXsKPEnnzqY=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(36840700001)(46966006)(2906002)(8676002)(70206006)(2616005)(110136005)(36860700001)(70586007)(356005)(186003)(7696005)(54906003)(426003)(4326008)(26005)(5660300002)(336012)(81166007)(82310400003)(1076003)(508600001)(36756003)(6666004)(316002)(47076005)(4744005)(8936002)(86362001)(83380400001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2021 05:54:08.0977 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e03226d-b9d1-4c4d-46bd-08d98c7b8a84
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT041.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1201MB0221
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Sunil-kumar.Dommati@amd.com, Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>,
 open list <linux-kernel@vger.kernel.org>, Basavaraj.Hiregoudar@amd.com,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Vijendar Mukunda <vijendar.mukunda@amd.com>, Alexander.Deucher@amd.com
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

We are using fch clock controller as parent mclk source for rt5682
codec. Add config to enable clock framework support for 48MHz fixed
clock when machine driver config is selected.

Signed-off-by: Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>
---
 sound/soc/amd/Kconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/amd/Kconfig b/sound/soc/amd/Kconfig
index 49ff5e73e9ba..a2cb50d09980 100644
--- a/sound/soc/amd/Kconfig
+++ b/sound/soc/amd/Kconfig
@@ -6,6 +6,7 @@ config SND_SOC_AMD_ACP
 
 config SND_SOC_AMD_CZ_DA7219MX98357_MACH
 	tristate "AMD CZ support for DA7219, RT5682 and MAX9835"
+	select CLK_FIXED_FCH
 	select SND_SOC_DA7219
 	select SND_SOC_RT5682_I2C
 	select SND_SOC_MAX98357A
@@ -30,6 +31,7 @@ config SND_SOC_AMD_ACP3x
 
 config SND_SOC_AMD_RV_RT5682_MACH
 	tristate "AMD RV support for RT5682"
+	select CLK_FIXED_FCH
 	select SND_SOC_RT5682_I2C
 	select SND_SOC_MAX98357A
 	select SND_SOC_CROS_EC_CODEC
-- 
2.25.1

