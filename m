Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CAD2F681DB9
	for <lists+alsa-devel@lfdr.de>; Mon, 30 Jan 2023 23:09:46 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4EEE6DEE;
	Mon, 30 Jan 2023 23:08:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4EEE6DEE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675116586;
	bh=fvNWEnI1/adIYH8WRcvgklnkoj5XjpF2MRedYckCo7Y=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=jKlbaLiucF8UU68HWuhWu+3G868dv3lnhljfDY6lepx6jFIEyi8oUrvyRKXKyNkX6
	 eCDN1qhYANWzKzAnNjtxL4cO50A5uHBqbgM0dMEpBseEtvI2OCvT7JsIz0YzlEfkRt
	 g9WFM8fYiXGczZ+Lv0rOkZ2I3MOW4UzYEsLVhlTA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8B15FF804EB;
	Mon, 30 Jan 2023 23:08:23 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1555CF804C2; Mon, 30 Jan 2023 23:08:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2060a.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e88::60a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A9402F80155
 for <alsa-devel@alsa-project.org>; Mon, 30 Jan 2023 23:08:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A9402F80155
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=llAszdgg
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CceslceGnInLKqt5973zqf3wAzuhgGQWVXxMar64KmP2IpUMZYtGahUO4DEdmz7Vt6hPHhTGCMzvAalljTzmCuWNoSBZmrwst/hCKyeqPo2FXekLxsssW/NPDkz2X3M4RX9lSFwbiYUHL/IYgdV1YN7FH5cpZfUvCe8v/BK20RnGg6wxqepXd+ucxxy5dIZxVKOW+t9PXa3h67IZGVfH8cJR9+Sgdnu1a/BisCrSLeJyO0EfPmZXo026P/Ljw19dwYBAQFf6BemyaVpt01lRFp7JoNZu6SUFN9iExjTc/hWAWRHv01k47w5SZh8Gn1ssFq65lc9R2Zn40U5kc7W1jQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gk5VuF/tUECiPO0M/J21GeVdnS5OIatNM7/v3BXfRfs=;
 b=J5z9zcT5nBUXa6snGrPA0ukzIF7XKDEmOHc/znhc7JVBKUSmojSuCRWCmcfwNgjQFsEPUvyHxjiqpa0uLzpOW/0cuOHgssFVd1m6yfSKPCQ2SjPiAPzm1bOiuFipKO6QczVgAafZpuAmdp0MTSfFOkoah8Ed6/2mt86ZozZnwG+qLsNYKpNPCd0ZHgoR3jUHUDWBjA1Ws5GBxKTkv61lKHRO0kK1TgxfRD0MBQBSvB9PMKCBdnVWiJzU6bVMfJ5gkfdNoYTCM2h9MxB9HbxyBqzYp43/5cs6rM33TsmzVSia0zdXV/WJeAq/EQpgTGquApwyMmUybwGJ1Wgi0Ohx5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gk5VuF/tUECiPO0M/J21GeVdnS5OIatNM7/v3BXfRfs=;
 b=llAszdggqCRgxJh774UFhKfG3GLAYoITLZjxax/7WlV8lGT7QJR2suEQeGyl1rxvSLKClNsp34Bnp4fLvLOyZg8wxmSzih+hnqcxTx2K8YYSeOkZwlbBlPpQ272q4e+HEzen+PTwo8IXk52gXRn3Q1u2xfu3whRcM+2rltfJE+I=
Received: from DM6PR07CA0039.namprd07.prod.outlook.com (2603:10b6:5:74::16) by
 BL1PR12MB5996.namprd12.prod.outlook.com (2603:10b6:208:39c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.33; Mon, 30 Jan
 2023 22:08:06 +0000
Received: from DM6NAM11FT093.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:74:cafe::2c) by DM6PR07CA0039.outlook.office365.com
 (2603:10b6:5:74::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.36 via Frontend
 Transport; Mon, 30 Jan 2023 22:08:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT093.mail.protection.outlook.com (10.13.172.235) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6043.33 via Frontend Transport; Mon, 30 Jan 2023 22:08:06 +0000
Received: from AUS-LX-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 30 Jan
 2023 16:08:05 -0600
From: Mario Limonciello <mario.limonciello@amd.com>
To: Jaroslav Kysela <jkysela@redhat.com>, Mukunda Vijendar
 <Vijendar.Mukunda@amd.com>, Saba Kareem Syed <Syed.SabaKareem@amd.com>
Subject: [PATCH v2 0/6] Fix default DMIC gain on AMD PDM drivers
Date: Mon, 30 Jan 2023 16:07:48 -0600
Message-ID: <20230130220754.8379-1-mario.limonciello@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT093:EE_|BL1PR12MB5996:EE_
X-MS-Office365-Filtering-Correlation-Id: 34661cb8-f3e7-4584-d414-08db030e76db
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ev2QQ4z6uwwb57YSISASyZWH+CuUTy4F2ctvTx3kTvaIw9zTcCQhzOA7xUEIKGvcse+l5vF1o/HrhE0yz3jKq0/eTprRmNnId9Ktk7/QYkWbesBqly2izJ9zg4ZEsqWUTd9P8b71bc1e+R2HUJiInQ6mSOxlcgUcab5A6TdECpX7+VxOKrKyqN0mc4SV8s12Wp6Uiox9hgTITmLEuyoyg13Q0dTgBmssEKRRLzJspOUIcNFvpu39gOzwKUP6gBtCRU8boAA8wkrHNc/k5wI0lpXGZsqcPbo9H830o1T8V+IK2EGCcXld3X/FGlypuhpOBuvt/LP1bTEtao8RV6DdM7VaVsy7q4Hl8nHQWWtINFu7BW/8XtDd8+y6cIZHFjQ6Iy4AbFZQ0M0rppyHVFx8NF/AvevklyuRqBk0LXT76MjYKMm8A490UxonwtpApuY0/E2031Vs5QTuH50UCiIDV7yHgeyGXTAOBayntHkUg+x9Vy+ld0eN9g/zfsL9h5GJt2DBS952i9tiIYziTJhSX4KsqCkzcDGlqqqAoP4Z3wcRUyJMs1fDNNLeKC2dLQN9rTGIs/cegNtdRHzgsyhDJthtKExMgJIxQr5asdp/3IOvCFknjx4ZDWJ1iVAPc9c9WifD4K10Q3xK3nkIjD/2MO16ZUg7SOb8vG6svfPFH+6R28JsqAxZeZSNziB4uL8DNI0+4pKoVbG2pJQTkocSlFcC8vIHiNwfuLj7wNkii6s=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230025)(4636009)(346002)(39860400002)(136003)(396003)(376002)(451199018)(46966006)(40470700004)(36840700001)(70586007)(336012)(70206006)(2616005)(4326008)(82740400003)(40460700003)(36756003)(54906003)(36860700001)(6636002)(86362001)(356005)(110136005)(5660300002)(81166007)(40480700001)(316002)(2906002)(44832011)(426003)(83380400001)(82310400005)(8936002)(41300700001)(47076005)(16526019)(26005)(478600001)(8676002)(66899018)(186003)(6666004)(1076003)(7696005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2023 22:08:06.0819 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 34661cb8-f3e7-4584-d414-08db030e76db
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT093.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5996
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
Cc: linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
 Mark Pearson <mpearson@lenovo.com>,
 Pananchikkal Renjith <Renjith.Pananchikkal@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

It's been reported that a number of laptops have a low volume
level from the digital microphone compared to Windows.

AMD offers a register that can adjust the gain for PDM which is not
configured at maximum gain by default.

To fix this change the default for all 3 drivers to raise the gain
but also offer a module parameter. The module parameter can be used
for debugging if the gain is too high on a given laptop.

This is intentionally split into multiple patches for default and
parameter so that if the default really does behave better universally
we can bring it back to stable too later.

v1->v2:
 * Add guards for parameter usage
 * More comments in commit messages

Mario Limonciello (6):
  ASoC: amd: yc: Adjust the gain for PDM DMIC
  ASoC: amd: yc: Add a module parameter to influence pdm_gain
  ASoC: amd: renoir: Adjust the gain for PDM DMIC
  ASoC: amd: renoir: Add a module parameter to influence pdm_gain
  ASoC: amd: ps: Adjust the gain for PDM DMIC
  ASoC: amd: ps: Add a module parameter to influence pdm_gain

 sound/soc/amd/ps/acp63.h             |  2 +-
 sound/soc/amd/ps/ps-pdm-dma.c        | 10 +++++++++-
 sound/soc/amd/renoir/acp3x-pdm-dma.c | 10 +++++++++-
 sound/soc/amd/renoir/rn_acp3x.h      |  2 +-
 sound/soc/amd/yc/acp6x-pdm-dma.c     | 10 +++++++++-
 sound/soc/amd/yc/acp6x.h             |  2 +-
 6 files changed, 30 insertions(+), 6 deletions(-)

-- 
2.34.1

