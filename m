Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9594F639453
	for <lists+alsa-devel@lfdr.de>; Sat, 26 Nov 2022 09:06:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3569217E9;
	Sat, 26 Nov 2022 09:05:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3569217E9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669449988;
	bh=N0ulBJ5SUX/IojvkIeCTNczA4CYrQrDhO8Ju2ESwOKU=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=mnqt6xby5Ceu+GHPhH/7BPMsOQwtiBx+JVfxwM8rYqYQxBG5Mvo2pYgbcH7I7nrLM
	 BR2ilCL62GW8lQHQOVXn+5JYHPJAHCu/lfashbmhuEG4EposD4tWJnfuAwMr+o1yrU
	 JaWw1VlQXaZjn9BkVdFObeAMuYZ2hO10iXx8njpE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6359CF805F7;
	Sat, 26 Nov 2022 08:59:09 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A45ACF8025D; Wed, 23 Nov 2022 13:19:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_ZEN_BLOCKED_OPENDNS,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20626.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eaa::626])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 81834F800BB
 for <alsa-devel@alsa-project.org>; Wed, 23 Nov 2022 13:19:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 81834F800BB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=amdcloud.onmicrosoft.com
 header.i=@amdcloud.onmicrosoft.com header.b="zTiFekqg"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SbmWGB55uLtrHLWPGVMEGJJRe02Mn5+bKaGNQx5nX3T4mAFtdIyJag1X5vQjEkdSDjOnIMrmDq4LB03AR13DcqSF3cV0TFHUl1oOLHVbu0utUrNJAzV2wTwLwG0C0Yc96s30C8U8wPlGOzqc9FvHv5ruRhWfsQWFpvphT99PM5OpcVU2U57jyn4HTvarU91AWoLeMXpSjf9MXgMB2UBWcPb/oEbCh1/8smo+OPuymn2Ore4j4XyS2dijrGNSmyL6s7VGmVEUZp4tbxoxL+nRCw7Vxy5KV9qlhpX4z1riUSJyDllXvLsGV3drLh5Fc9kh+Yc2XTlTs2x4chhzOQjXBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d3kaNhR19UL8Wu7QTcumuCSDt0gZt+M0az6UTSFnrdQ=;
 b=Ep0vrNAKAXvYuH+x5a6oLtCx8Y3kI4+PZAfFcPMF6LmvyLeLD9Pojz2puXNuhMFdT/fXs0dumBhuPijNLMCEHNYfHU9dtGY9KSatjUQLiFiOw1Xn5zpcVaWQc45wgHCj+S6eXgVqP6dUVtq6YLMdXiAiRNXeU8g7mLh1ScEaQ5Kh4cPif6JL5Sp/k2naqx1KZup/TavSffE6UhXV11mrAizpMb+yoLVLV/wkw0EjsHnvxYROdrBhzeX0qJyHMsmscxt3BuR0ZnUhlCRBCfnLJ4B5NmoXqPljtI7tiwWfZT+n85p6tQKSwcB35O4WAuJbKo3pAx1zdGfTuvYFWM102w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 165.204.84.17) smtp.rcpttodomain=kernel.org
 smtp.mailfrom=amd.corp-partner.google.com; dmarc=fail (p=reject sp=reject
 pct=100) action=oreject header.from=amd.corp-partner.google.com; dkim=none
 (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d3kaNhR19UL8Wu7QTcumuCSDt0gZt+M0az6UTSFnrdQ=;
 b=zTiFekqg02MQx1eJL2a5wq9TD2/JmrgpxRzjqZLLpCPLAREEfAwodJy1k0s8btQC9NyrtTJ2Th24PqPu6aVGRSyfGBCe5ibZ2LNLR8afUQesFAI69ceVbGrP/nC1Y9QxZGtKiLuDc4xtrnjxKl+38Ns4/FrqAfc81BQtCpM2t8U24tz7WJwE5Ab6u/gOJzh4jMaA7Pkj84J2Cd9qf4TvB3t57LYWvBAhBoyCgtm8DkpKsZSTsfmod7IzsB3yXtQFA6QgKHb04EW6iFgSJw8Xk4SGXgZgQb1humZe0y3LcxEYIKACiyBomXwnTvHRFT021fSLzehu5VQbILc6z2Zs8w==
Received: from MW4PR03CA0077.namprd03.prod.outlook.com (2603:10b6:303:b6::22)
 by SA1PR12MB7411.namprd12.prod.outlook.com (2603:10b6:806:2b1::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.15; Wed, 23 Nov
 2022 12:18:59 +0000
Received: from CO1NAM11FT055.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:b6:cafe::4f) by MW4PR03CA0077.outlook.office365.com
 (2603:10b6:303:b6::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.15 via Frontend
 Transport; Wed, 23 Nov 2022 12:18:59 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 165.204.84.17) smtp.mailfrom=amd.corp-partner.google.com; dkim=none (message
 not signed) header.d=none;dmarc=fail action=oreject
 header.from=amd.corp-partner.google.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 amd.corp-partner.google.com discourages use of 165.204.84.17 as permitted
 sender)
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1NAM11FT055.mail.protection.outlook.com (10.13.175.129) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5857.17 via Frontend Transport; Wed, 23 Nov 2022 12:18:59 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 23 Nov
 2022 06:18:58 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 23 Nov
 2022 04:18:58 -0800
Received: from sof-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34
 via Frontend Transport; Wed, 23 Nov 2022 06:18:55 -0600
From: V sujith kumar Reddy <vsujithkumar.reddy@amd.corp-partner.google.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
Subject: [PATCH v1 0/4] ADD support for reading position updates from
Date: Wed, 23 Nov 2022 17:49:07 +0530
Message-ID: <20221123121911.3446224-1-vsujithkumar.reddy@amd.corp-partner.google.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT055:EE_|SA1PR12MB7411:EE_
X-MS-Office365-Filtering-Correlation-Id: f09b3777-4b34-4d5a-9919-08dacd4ce67c
X-MS-Exchange-SenderADCheck: 2
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fvAQ8KsGHW53Eu1gstqew9Vke12kaHURX+z/+WbdqUlbsJeojTvPKQSBvpLqk40ySORkHgTshiAOIVpUCVWZZ5qF6KrJNHPK+D25lkg35MofDno7QgOM3ivXhhnqenZQM++lHZGEhWtnIM3GrOobqPKwtukBB/fiuVVFgYYIfCku46Eu36GNHfA/mLMVmtAOfaTJTo+uVsxquy9m2mWcuCEaj7sUfm0XkAGg80GQA5XqEnCq0FsPxc0Vhw90V5lPr1cst34zPoXh1i96q9XRrzu+sdVd7I5dF/PnM8BjXKQ+HaOnzb20xxSpKH7dfdKwU4HT4220M6jLC/NdQrNR0621480+jlLWHsFZDf96tcHxqf1mNfo6ngRd1T/WqayJYiHgOF2qz6u9XPx+DO0rxtf/dwkDI8LpNUANzaNrbd8PQ1mErGneeMUpjxfdqhR1DtDkkOKWBYF+uxeE81fUB2zV0BwfjyVHs5NsE0Rc52e/IIA+62StoEQ5LQhx6tPdEt5yIf70iYQgJDRK8OO7icen1SVqEkeS8FTgN3FCA414TKYtB2UKX5c1e+BEIt+/cWLmyO3iNwmlzfT6zQjk9pMEgJzz3yLeBFDxpWEUn7Gd2rVwe7C/sBk76MoIlp2SyvHasYVoWNKGhLq+Nd1nZJ7arKDKKlbJT8LPS9JVhMynP7rWGpw6TPZw9A9tmQ+ezTSz1oHikglARbiBLVnptw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(39860400002)(396003)(346002)(376002)(136003)(451199015)(46966006)(40470700004)(2906002)(83380400001)(15650500001)(47076005)(4326008)(8936002)(5660300002)(1076003)(336012)(35950700001)(41300700001)(2616005)(86362001)(40480700001)(356005)(82310400005)(82740400003)(40460700003)(81166007)(8676002)(110136005)(76482006)(316002)(26005)(54906003)(6666004)(498600001)(70586007)(70206006);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amdcloud.onmicrosoft.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2022 12:18:59.2918 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f09b3777-4b34-4d5a-9919-08dacd4ce67c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT055.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7411
X-Mailman-Approved-At: Sat, 26 Nov 2022 08:58:52 +0100
Cc: Sunil-kumar.Dommati@amd.com, ssabakar@amd.com,
 venkataprasad.potturu@amd.com, Basavaraj.Hiregoudar@amd.com,
 Vijendar.Mukunda@amd.com,
 V sujith kumar Reddy <vsujithkumar.reddy@amd.corp-partner.google.com>
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

This series consists of 
1.Reading postion update from stream box
2.selecting clock source as external ACLK clock
3.ADD virtual HS and SP DAI
4.Add AMD virtual DAI configuration support in sof core.


V sujith kumar Reddy (4):
  ASoC: SOF: amd: Fix for reading position updates from stream box.
  ASoC: SOF: amd: Fix for selecting clock source as external clock.
  ASoC: SOF: amd: ADD HS and SP virtual DAI.
  ASoC: SOF: Add DAI configuration support for AMD platforms.

 include/sound/sof/dai-amd.h     |  1 +
 include/sound/sof/dai.h         |  2 ++
 include/uapi/sound/sof/tokens.h |  5 +++++
 sound/soc/sof/amd/acp-common.c  |  1 +
 sound/soc/sof/amd/acp-ipc.c     | 30 ++++++++++++++++++++++++++-
 sound/soc/sof/amd/acp.c         |  4 +++-
 sound/soc/sof/amd/acp.h         | 12 +++++++++++
 sound/soc/sof/amd/rembrandt.c   | 16 +++++++++++++++
 sound/soc/sof/amd/renoir.c      | 16 +++++++++++++++
 sound/soc/sof/ipc3-pcm.c        |  2 ++
 sound/soc/sof/ipc3-topology.c   | 36 +++++++++++++++++++++++++--------
 sound/soc/sof/sof-audio.h       |  1 +
 sound/soc/sof/topology.c        | 10 +++++++++
 13 files changed, 126 insertions(+), 10 deletions(-)

-- 
2.25.1

