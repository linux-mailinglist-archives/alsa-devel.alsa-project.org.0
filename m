Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 336C45B70F7
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Sep 2022 16:41:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8C2F5175A;
	Tue, 13 Sep 2022 16:41:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8C2F5175A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663080113;
	bh=/PWYo7JYeYzTqb4wqfGVVBy/LsQqhqdXPiXPRVBJ4is=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=U4ERYiI12ZXTbG3rP49CbmPfj71E3FTwMFrspLvhBJgM1mPzt4EkbWLGsLYW8Lg7L
	 DtoROoEpsw9Epu7QnZXt+5V7CJHPK23uzwGw9NFv15SeENvSrYMBtJcNxSYiOioHAJ
	 VnThgEP7R4FyTDisoDHNgQBrefON90R4GKy57tsE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 104C9F8008E;
	Tue, 13 Sep 2022 16:40:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 034C2F80224; Tue, 13 Sep 2022 16:40:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2056.outbound.protection.outlook.com [40.107.244.56])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 210A0F8008E
 for <alsa-devel@alsa-project.org>; Tue, 13 Sep 2022 16:40:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 210A0F8008E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com
 header.b="cenf44Vw"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KEDtbBKWT5ALIBMbyhaETVLRRBen5ul3BwfBhQHBikIWSrY7i1fCoW8qJwxQDfcyTc6RS02Xh/lMLGR+IL6AEDI1L+MPe8SNF/1vZMf4Ypip7mYQ6WuGlgjesLEze8W1Y7HxbMpKdUw26hWYvAeH2tIBqCCDkXld7Qw7i8s80vzH+uEv3Zw2X3ydCfPZnHeK/fOMfxvxLD4Rv2Kke48S0scxSQwZDTa4oxgBFIf0c7rKv/qnyXInrW3aSuzW6dp4XTktb5hEUv0WcOug9Gc/tJXPGDpVYh/siJbVCjmjDlea6YvcOMhh51D0v7bQZAfr3r/bXreUUZnFJO3uMpg8CQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vcOOamtwcYqkZvlk1wU10aYrQJve7qmcGOVxCGRyNI4=;
 b=Qd4/NSifUzKDF/8+Urlqbx/INwze6M50I7S4uCB58VuoYl+PBPk2k1rd7jxbvV/T0EuCGn5v8bSlIMRNqPGk7/vPUuUcuRcGaNtJ4j8G7/v9bmUIs8cqpdVgkpGXIzXNi2PZL6LAOxyBbws8uQLjaUyF69rTZomwDmcgiUOCBunC/V5EIv2zRb1Zs1YfYIH5+i5OJIa72Op1WYqRFGkdcMqK7Fp0nuyUvze/Iln8D0IMeSQeO9uT4Wa444dhiKZjoI4hcKqrSkZK65dFPeDqms3flxLz/51W1smVxqtVn5YzHLsOA22iW3jUwM0fJ23Oab4zFbDEDRp+nLcdrgCYMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vcOOamtwcYqkZvlk1wU10aYrQJve7qmcGOVxCGRyNI4=;
 b=cenf44VwtVREmPnB8PpvS2aBz7Wc/uBz/GBfdF4uYSRu5FUAGdbHcDa7/CwjsEL3SVE9WMc+ENmCx+gJyCBPuqTjOgT17odqR8SBHYrv1hMUTwxDnwimaMyPo2sm2LKLuDvW0451JsGHtu6uhLi3rYDce+FozbwC3GOmiXQHiXo=
Received: from BN9PR03CA0432.namprd03.prod.outlook.com (2603:10b6:408:113::17)
 by PH7PR12MB5619.namprd12.prod.outlook.com (2603:10b6:510:136::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.22; Tue, 13 Sep
 2022 14:40:43 +0000
Received: from BN8NAM11FT090.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:113:cafe::57) by BN9PR03CA0432.outlook.office365.com
 (2603:10b6:408:113::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.14 via Frontend
 Transport; Tue, 13 Sep 2022 14:40:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN8NAM11FT090.mail.protection.outlook.com (10.13.177.105) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5612.13 via Frontend Transport; Tue, 13 Sep 2022 14:40:43 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Tue, 13 Sep
 2022 09:40:42 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Tue, 13 Sep
 2022 07:40:42 -0700
Received: from sof-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.28
 via Frontend Transport; Tue, 13 Sep 2022 09:40:40 -0500
From: V sujith kumar Reddy <Vsujithkumar.Reddy@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
Subject: [PATCH 0/4] ADD SOF support for rembrandt platform
Date: Tue, 13 Sep 2022 20:13:14 +0530
Message-ID: <20220913144319.1055302-1-Vsujithkumar.Reddy@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT090:EE_|PH7PR12MB5619:EE_
X-MS-Office365-Filtering-Correlation-Id: e3ad367b-26b9-4359-eacc-08da9595efe1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HllU8X+btPymXvWfdjW4EBhPhf77iDfAwth+DFYCatQlnjFcfuMZ7nEuBlCcBcWn1mGFI7RCsXOhSe+bhBC5+mqiB3Z42gCygx9pFSdmv7oEwq0EA2Aj0M7OyUAx2Iwx6YnwGieOyh2HIMCVHklzkk1SOJRCT0L8IOXx9IJshrTpcNJcpc7j0aPZHq4LrKjcqhGdZ5Ax1k+mG67Vc+gqtyU83mmgsI6BPGYs2y2wkZL9Kgm89/jI5R2mzWT7fmQRebBsx9Xm6D/yjFfvnvWtdoHfm3fGLr59sIXF3rq1XrHscTy83YPHAx9Cee2fq9/36zGpjx8bDBPosIwiRO7bcJhm5F3nJEwWCS5M3TfqjTy44wxsM2aP87Q7LnoJpzkgwithhynk+E0669h3lFVB3XV9rhEQ4OvPttAsRsu3Mw5lEYe7MUzbGK9j/Kh+/3q9U6o0EKuDOusTuP4u87FCJdoGDG+e8lMRjVmcbGg0uEjo1Ys3TG199zm4+r3PqGCVvRQPIH1jYqFXJfu56om/dpLlc7vf/dEhdZXWNcDdXYblJ8XGirAJJO5znFWdVVJT6blTTLoxVHEJblW2zjentnPF/N+OThT8KXF+2ylw+jp3Jc48x8+v0SFjoosf6Bq67/pn3m1iMYcQg/hiJwTL87flZ1Fgqvt9S8da7rCzcpfltYMqVpvWDuS+yHYBD3Njg0GJAtbykxHml374ZRbH+ze4/n+kecuibXtZrbw42BVwCncPNygAKCF9Tiu8y/Z0V9HoiABOGbTx6kreRq8saThzkKVkmjzUFgm9kQ0RVlg=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(376002)(346002)(39860400002)(396003)(451199015)(36840700001)(40470700004)(46966006)(2906002)(426003)(5660300002)(86362001)(8676002)(6666004)(478600001)(316002)(81166007)(26005)(4326008)(356005)(40460700003)(110136005)(54906003)(40480700001)(186003)(82740400003)(1076003)(41300700001)(70206006)(8936002)(83380400001)(47076005)(70586007)(36756003)(82310400005)(336012)(7696005)(2616005)(36860700001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2022 14:40:43.2947 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e3ad367b-26b9-4359-eacc-08da9595efe1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT090.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5619
Cc: Sunil-kumar.Dommati@amd.com, ssabakar@amd.com,
 venkataprasad.potturu@amd.com, Basavaraj.Hiregoudar@amd.com,
 Vijendar.Mukunda@amd.com, V sujith kumar Reddy <Vsujithkumar.Reddy@amd.com>
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

1.Make ACP core code generic for newer SOC transition
2.Add support for Rembrandt plaform
3.Adding amd HS functionality to the sof core 
4.increase SRAM inbox and outbox size to 1024


Ajit Kumar Pandey (1):
  ASoC: SOF: amd: Make ACP core code generic for newer SOC transition

V sujith kumar Reddy (3):
  ASoC: SOF: amd: Add support for Rembrandt plaform.
  ASoC: SOF: Adding amd HS functionality to the sof core
  ASoC: SOF: amd: increase SRAM inbox and outbox size to 1024

 include/sound/sof/dai.h            |   2 +
 sound/soc/sof/amd/Kconfig          |  10 ++
 sound/soc/sof/amd/Makefile         |   4 +-
 sound/soc/sof/amd/acp-common.c     | 111 +++++++++++++++++
 sound/soc/sof/amd/acp-dsp-offset.h |  33 +++--
 sound/soc/sof/amd/acp-ipc.c        |  49 ++++++--
 sound/soc/sof/amd/acp-loader.c     |  20 +++-
 sound/soc/sof/amd/acp-pcm.c        |   3 +-
 sound/soc/sof/amd/acp-stream.c     |   7 +-
 sound/soc/sof/amd/acp.c            |  52 +++++---
 sound/soc/sof/amd/acp.h            |  38 ++++--
 sound/soc/sof/amd/pci-rmb.c        | 186 +++++++++++++++++++++++++++++
 sound/soc/sof/amd/pci-rn.c         |  11 ++
 sound/soc/sof/amd/rembrandt.c      | 134 +++++++++++++++++++++
 sound/soc/sof/amd/renoir.c         | 101 ++--------------
 sound/soc/sof/ipc3-pcm.c           |   9 ++
 sound/soc/sof/ipc3-topology.c      |  33 +++++
 sound/soc/sof/topology.c           |   1 +
 18 files changed, 653 insertions(+), 151 deletions(-)
 create mode 100644 sound/soc/sof/amd/acp-common.c
 create mode 100644 sound/soc/sof/amd/pci-rmb.c
 create mode 100644 sound/soc/sof/amd/rembrandt.c

-- 
2.25.1

