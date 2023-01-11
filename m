Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D267B6656E4
	for <lists+alsa-devel@lfdr.de>; Wed, 11 Jan 2023 10:06:18 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 74E0E3CA8;
	Wed, 11 Jan 2023 10:05:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 74E0E3CA8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673427978;
	bh=GbplTMTX0DVbgVGT6y95fxro380uNUc3UatQqvskn9k=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=VKfczAhsTfMtyoPG+ib6rt1dGGA+UMbe3yLCfe4T3qSCA6dzup1jNxZkQjPyUwXWm
	 uKYey6m8kOgnMjGixM5xPNjIKNtbZUdbprkVWvAPM+rvtIBDrqf4033EIQl2ox/RMK
	 NtuF8x0k+RB80ddiFJSbaGPeD/MzyEz59jp0Ca0I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 01BDCF805A9;
	Wed, 11 Jan 2023 10:04:04 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 01E82F80580; Wed, 11 Jan 2023 10:04:01 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,
 SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2045.outbound.protection.outlook.com [40.107.243.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A2D6AF80571
 for <alsa-devel@alsa-project.org>; Wed, 11 Jan 2023 10:03:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A2D6AF80571
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=dK04mPLo
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lx7qbffImFmxOGuBRA42/FwHTCmHg+fOkARMqyhWUFwME4Icvm9CAAr92DDCWO4Eeg7aheFeWJ7sqtggGmRoAi+72VBk1IxHEhu/vU8yA5+D6+T8m1WqLWKSls/EHdpTT3/aeteUwvKTzJccgPRw/xKGvieOzP6i7bUX03+1i+5o3ziAmMMCBt+i5lDMu0CF5X5VaJkIKXCOCnqqbL/8XfWl+1596r388enKSMmXE1Rf2GUwcFBfOMHCvXBHOJf1tk09vaPn+aAfFqLrdriDem/j1tMbgRvzCa9HSaAwm89txYv7YQ+xQJWEjfBvFq1Zr4XDqaWwZAR/Pl2Sjan4HA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cZMXt8C6+nAkybTbBz/l5hTmmGkMItamXiYVLJmt7ZU=;
 b=Oqbfg0euoCUCnMsDxwC4UvJwIf2mP9qVgOsr6ZUYmO12MEWpcuAJBXdDhIeZ1Dx9E9NNaCBFH9zdM4hCDqXKLl6nE5b5Oi7qytIUsu8NHdGAdzFE+Pxo21qQzUQ43lyqX8qwjgbwUU1FIpfn5eOVgFKn390xjWp2EmPGblhTSz6dM+pIgjzN2WYViG2qqsPuBjHGV3QZ9g/6QuRU5pCv6+sEHlfXKPDb9WrlNHeTG3nURdZjxjHx6c8OZM31FD89O3LtIsNTgnJtLRofusLpj9Vp+lj2oRykmn4wBphWoYU+uAFUPDvEZt+39fC6IMvx3iK7i4R24KiKyibk1+IOaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cZMXt8C6+nAkybTbBz/l5hTmmGkMItamXiYVLJmt7ZU=;
 b=dK04mPLoNqgZW8yxmm86TmDAT8HJuR+JS51/ew64U9pF+nf6dPUZsp1U0zrrgV13F1+ugX7nlr8nOYnjSUCoYvEZ/5rJKCLnFDizqai27C0DcoAwyqosKg/aUKLPQVnVKTMubqSjlcN8/13eYlV9/99ovL6no960mW4aiZHwCYQ=
Received: from BN8PR07CA0007.namprd07.prod.outlook.com (2603:10b6:408:ac::20)
 by DM4PR12MB6232.namprd12.prod.outlook.com (2603:10b6:8:a5::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5986.18; Wed, 11 Jan 2023 09:03:55 +0000
Received: from BN8NAM11FT023.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:ac:cafe::1) by BN8PR07CA0007.outlook.office365.com
 (2603:10b6:408:ac::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.12 via Frontend
 Transport; Wed, 11 Jan 2023 09:03:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT023.mail.protection.outlook.com (10.13.177.103) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6002.13 via Frontend Transport; Wed, 11 Jan 2023 09:03:55 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 11 Jan
 2023 03:03:50 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 11 Jan
 2023 03:03:48 -0600
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34
 via Frontend Transport; Wed, 11 Jan 2023 03:03:45 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>, <vkoul@kernel.org>, <alsa-devel@alsa-project.org>
Subject: [PATCH 19/19] ASoC: amd: ps: increase runtime suspend delay
Date: Wed, 11 Jan 2023 14:32:22 +0530
Message-ID: <20230111090222.2016499-20-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230111090222.2016499-1-Vijendar.Mukunda@amd.com>
References: <20230111090222.2016499-1-Vijendar.Mukunda@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT023:EE_|DM4PR12MB6232:EE_
X-MS-Office365-Filtering-Correlation-Id: 2fc2d00c-73b1-47fb-0e1f-08daf3b2c49e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +JE+zrpCwIFZXQG/zlc1muZL2nPIsHrdIP3+t0PzTX+Fn53RZ7IDDYJmVkuy41xeGYb9c5NxP0unDL7GSR1q6fka42vXWzgeTVAZxpbDiC+5XO7r+rVSio/hugnSWqsWtxZblEtipQX/vBlp1N+3BiKjtvT2d2hYs6v1eN8bkvPbgAOiwo3hRBYvQdwW6ZoBAr99TqscoMa7CHWV8kkWVPsHZTg5JBYWzcw8dMucJdwXG35VHjTPYiNCuV6CjVw+id3aKGFw+R705ArrMzQX/iVCR2LdTFeked/Aud0gSfgWMECmhbTPG3/8IaERsSYcptm6J0YOcMISGJ5DXQIuK4P2zRVHgbXC7X0h8rdS/q+MDiTCHsygn5nKX/wC/AdWZK45zfYV++IIg2ih+2OZf4U6zIxg7Oc86VJWxxwBuWYi5cjTagPKwGLBmqsGU9+kXQ3quhBMSCQL7g7aj7iaxsRPHfNzcHjbtyRgUzGc55xW8rB9VH7+76FzHBYaAQ4B5dwGs1w01dgK8etnjfOcIROmk022jvS/TDz7fFDxgCMaC+4HrZieDIACrbb1acvmr5V7MlE692GmZS3AUOwdqsYZGrvMAVEQP7MZouAQQAPNbq5dIN54f4srJ4eofFKOXEpLCJc9q0tfhSBjfMGYWAWByNgy1gkRiYBQkUp80FfAlflRePYNOXoqqkvfqh0grzsx4ELYebL4gKcHwmiwhjhtW1Yb8E01eRXBiDMl1kg=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(346002)(39860400002)(376002)(396003)(451199015)(36840700001)(40470700004)(46966006)(82310400005)(2906002)(15650500001)(36756003)(4744005)(5660300002)(8936002)(70206006)(6666004)(8676002)(41300700001)(2616005)(70586007)(316002)(7696005)(4326008)(54906003)(110136005)(478600001)(40480700001)(26005)(186003)(336012)(1076003)(426003)(86362001)(47076005)(83380400001)(36860700001)(40460700003)(356005)(81166007)(82740400003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jan 2023 09:03:55.3361 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2fc2d00c-73b1-47fb-0e1f-08daf3b2c49e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT023.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6232
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: Mastan.Katragadda@amd.com, Sunil-kumar.Dommati@amd.com,
 open list <linux-kernel@vger.kernel.org>, Basavaraj.Hiregoudar@amd.com,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mario.Limonciello@amd.com, Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
 arungopal.kondaveeti@amd.com, Syed Saba Kareem <Syed.SabaKareem@amd.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

To avoid ACP entering into D3 state during slave enumeration and
initialization on two soundwire controller instances for multiple codecs,
increase the runtime suspend delay to 3 seconds.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 sound/soc/amd/ps/acp63.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/amd/ps/acp63.h b/sound/soc/amd/ps/acp63.h
index 833d0b5aa73d..6c8849f2bcec 100644
--- a/sound/soc/amd/ps/acp63.h
+++ b/sound/soc/amd/ps/acp63.h
@@ -51,7 +51,7 @@
 #define MIN_BUFFER MAX_BUFFER
 
 /* time in ms for runtime suspend delay */
-#define ACP_SUSPEND_DELAY_MS	2000
+#define ACP_SUSPEND_DELAY_MS	3000
 
 #define ACP63_DMIC_ADDR		2
 #define ACP63_PDM_MODE_DEVS		3
-- 
2.34.1

