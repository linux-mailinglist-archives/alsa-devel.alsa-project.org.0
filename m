Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DC2C322F35E
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Jul 2020 17:05:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 844F0169B;
	Mon, 27 Jul 2020 17:04:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 844F0169B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595862317;
	bh=qhl1cyDLt5ilDwyY+19/3kR1qwHIuxQzuLJ5+lLQq8o=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PQv/O5RV71HlFDw2e715EhmDmS6m1PVET7rTZBIBlY0Wo0X+WHRD/OfalAH3BzCg/
	 fLAJDNos+hMRaC/+WrjicKx00K27hOCX44FjQrFujRgsdrIu4apj45vboP2XHZODiG
	 F0K3BFrIZPtxxtY97sJdv+yXc113t3+ejG/sE5J0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E85B3F802C2;
	Mon, 27 Jul 2020 17:02:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BCA9CF802BE; Mon, 27 Jul 2020 17:02:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 FORGED_SPF_HELO,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2088.outbound.protection.outlook.com [40.107.92.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 27FBFF80171
 for <alsa-devel@alsa-project.org>; Mon, 27 Jul 2020 17:02:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 27FBFF80171
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amdcloud.onmicrosoft.com
 header.i=@amdcloud.onmicrosoft.com header.b="kfjHsFhu"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ODzNot2By2FWB81EDI0VXvuNtDZTEeMb5s5leyoPiWF4mpSxUVG6z2Ejz6JJlCJ8pR236Qwr/P09PVOywQQA2swwTchohixgt5UmLiCGZoQiA/YJobSCFo7jrYiMtwk1ggBDwTKizUKd/nqvuejm8Ep2tccf1QlEOt5cv8WF+/cif24Amll9MYucsEweQqQsKfSAnTS1bKtiDdszb149f5dgEEpILL0McnfyYOlasx97GGw1Svu/SgiR2/kgQCISgXE0MtmDuq3Q7DlGnZ9BMNQzCoijI/EylAZmFoByycPS3RZkJz9BbY2FMaBqHZkEKqhSaLUa7SWn0AgIVfg3bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b837BxrxehIucfYdqYaIUEsqCmkPkJnOzVY5zH8jEj4=;
 b=OiIUyEPcfycF503HOiaFIhzOfDrXPmynZx4Ti/752AuSvo2eZmoZkYPMMo5qgOocs7PfIOEkYo8PGx3gCnCWTou3ACCYIaotUCB3asQP/g0mBSDt9nUflCaadU7cJSyF2L89d3exbX2cKVLMSPtVEyzdLDkNk17THEiJs/s8tRFMGdEFOKc0roGiCKAvsOJcIvufFFYU52xzVmZ84uWXWZpi4CiZZNQO1SmM5cqcDlCQdM00+mvfBtH9zQcrl6CpwYT6Qgp6jy7CbDi+uEtL2LMD4pL4BXcCijyn4rDNEoCimwWyZ5wNpf9pEuUl2XGsbYTEInvwaunjJp/5pFWzuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com;
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b837BxrxehIucfYdqYaIUEsqCmkPkJnOzVY5zH8jEj4=;
 b=kfjHsFhuhL+dPFnU1qWKdF2FJePegvTT9lk16PcyO15IXdL/NmEpdO7g/xsMFgB5r153EBr1/2RizrLmvZc0VNQh41bAZbPqcYZsOCAlYMn3x5lfBVWCoiKcNizaLPGEPher4qN95mWIaBBtJTBMRwfG5Jt0+9cClgsq9SpUEe0=
Received: from BN6PR13CA0026.namprd13.prod.outlook.com (2603:10b6:404:13e::12)
 by BYAPR12MB2791.namprd12.prod.outlook.com (2603:10b6:a03:61::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.25; Mon, 27 Jul
 2020 15:02:01 +0000
Received: from BN8NAM11FT016.eop-nam11.prod.protection.outlook.com
 (2603:10b6:404:13e:cafe::a9) by BN6PR13CA0026.outlook.office365.com
 (2603:10b6:404:13e::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.10 via Frontend
 Transport; Mon, 27 Jul 2020 15:02:01 +0000
X-MS-Exchange-Authentication-Results: spf=none (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=permerror action=none header.from=amd.com;
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB02.amd.com (165.204.84.17) by
 BN8NAM11FT016.mail.protection.outlook.com (10.13.176.97) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3216.10 via Frontend Transport; Mon, 27 Jul 2020 15:02:00 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Mon, 27 Jul
 2020 10:02:00 -0500
Received: from SATLEXMB02.amd.com (10.181.40.143) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Mon, 27 Jul
 2020 10:02:00 -0500
Received: from vishnu-All-Series.amd.com (10.180.168.240) by
 SATLEXMB02.amd.com (10.181.40.143) with Microsoft SMTP Server id 15.1.1713.5
 via Frontend Transport; Mon, 27 Jul 2020 10:01:55 -0500
From: Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>
To: 
Subject: [PATCH 3/6] ASoC: amd: SND_SOC_RT5682_I2C does not build rt5682
Date: Mon, 27 Jul 2020 20:28:28 +0530
Message-ID: <20200727145840.25142-3-Vishnuvardhanrao.Ravulapati@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200727145840.25142-1-Vishnuvardhanrao.Ravulapati@amd.com>
References: <20200727145840.25142-1-Vishnuvardhanrao.Ravulapati@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c1b7f4a6-2327-426d-dd9e-08d8323e040d
X-MS-TrafficTypeDiagnostic: BYAPR12MB2791:
X-Microsoft-Antispam-PRVS: <BYAPR12MB2791ACE49EE34FF44D8962D9E7720@BYAPR12MB2791.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aLh+83Qyb+LDXyxIujSu2MLB/4fGHv4EWwKFrFHTi8xjeCzOm4epce3j02AJoxW1Gule+KXevPOLqJI9dbNgASEEUYTF2HtcUlSiFgJwl9e64HV9jql/10rnoBdBz2qpyNOqIQTqOLoRlKHrhKvw44QHw/74RTBaxSjXQUkP6fchmMHVe/KLNqtEajnSNqPaIiWVtvd2hRvi+Gwv0q8YZcVz8rszT4UTM0vAd8Yb1iwyiUeYcbYOBaD8XgXAhRqSYZamPF6Pv4qrJHz1EUq7qJpV8nvQpP3S2ppyXGJoLIYFu1or45RZSsqxmioIv4BzUu/JYQEgg8sP3MjbGeOZumn0BxB9RWqDqVS5ae5g5OZRv4h9+jnWnaRklPVMElLTbIV/z2tOQZoRiIQuqRnJ9KJwVce63C09IbsmGxiYqT8=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SATLEXMB02.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFTY:;
 SFS:(4636009)(39860400002)(376002)(346002)(136003)(396003)(46966005)(2616005)(47076004)(109986005)(7416002)(8936002)(81166007)(5660300002)(4744005)(36756003)(82740400003)(316002)(336012)(426003)(54906003)(6666004)(70206006)(478600001)(70586007)(26005)(86362001)(8676002)(186003)(82310400002)(2906002)(356005)(7696005)(4326008)(83380400001)(1076003)(266003);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2020 15:02:00.9854 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c1b7f4a6-2327-426d-dd9e-08d8323e040d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB02.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT016.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2791
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 "moderated list:SOUND - SOC LAYER /
 DYNAMIC AUDIO POWER MANAGEM..." <alsa-devel@alsa-project.org>,
 Arnd Bergmann <arnd@arndb.de>, open list <linux-kernel@vger.kernel.org>,
 YueHaibing <yuehaibing@huawei.com>, Takashi
 Iwai <tiwai@suse.com>, Enric Balletbo i
 Serra <enric.balletbo@collabora.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>,
 Mark Brown <broonie@kernel.org>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
 Alexander.Deucher@amd.com, Akshu Agrawal <akshu.agrawal@amd.com>
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

changing SND_SOC_RT5682_I2C to SND_SOC_RT5682 because,
This flag which was previously set as SND_SOC_RT5682
used to build rt5682 codec driver but by changing into
SND_SOC_RT5682_I2C is preventing to build rt5682 codec
driver and machine driver fails to probe.So Reverting the changes.

Signed-off-by: Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>
---
 sound/soc/amd/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/amd/Kconfig b/sound/soc/amd/Kconfig
index e37cf72f2bab..77ffdb41bee5 100644
--- a/sound/soc/amd/Kconfig
+++ b/sound/soc/amd/Kconfig
@@ -29,7 +29,7 @@ config SND_SOC_AMD_ACP3x
 
 config SND_SOC_AMD_RV_RT5682_MACH
 	tristate "AMD RV support for RT5682"
-	select SND_SOC_RT5682_I2C
+	select SND_SOC_RT5682
 	select SND_SOC_MAX98357A
 	select SND_SOC_CROS_EC_CODEC
 	select I2C_CROS_EC_TUNNEL
-- 
2.17.1

