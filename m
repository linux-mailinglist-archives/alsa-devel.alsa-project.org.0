Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FC725A64A8
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Aug 2022 15:26:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8E9531669;
	Tue, 30 Aug 2022 15:26:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8E9531669
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1661866014;
	bh=G55d8IGYPndo7ADLhL1R8GN6xLmQWhZwWg2omriVzrU=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=DQY4i1K7qUo95dJpDVwa8z0DsqgJ5D1rfMwqg+WUZTglpv8OR4nVg9sX8on/qQ8jp
	 kPXKjmwITCLdBsOUnjHzV3k5Oi7SG+AsddJAntwR1D6K7bJ5GRgDzbdH6mcB21VMyI
	 EN6TLFZgY2oqv/pO5XwEwekTihOOPqr3QU7iMCiE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E9051F8032B;
	Tue, 30 Aug 2022 15:25:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 94DCDF8023A; Tue, 30 Aug 2022 15:25:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2089.outbound.protection.outlook.com [40.107.93.89])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 73AA2F800F2
 for <alsa-devel@alsa-project.org>; Tue, 30 Aug 2022 15:25:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 73AA2F800F2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com
 header.b="lhAYSudI"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fPLfeWvTpHaECE/l6DBmEkVJAYZ8rA4KkxYgdJAoP0+MxPY/aAdZwPFaYzcEIiICo8rdF1orQ3fgWMTCzold2I59nMwi5T2EwHYJyXszb/YECVVb8/BhwPaThqvHrsBA9wsTmO4hXefVXtt2Fup8TbNuAuRDwajZjOEJMjRzOeznmzaM+Pj5viOVVKS+YhjFMR0Z+u/UX+39FY20BrGqqai3Hb66vFnbrjlhJjr/euGCHfQOSnuR9AEQhMICOKHyH8f7z1/AJJ8/qtEhvKenVNCB/QWmHKzJLDNJ2Q6F1G10RLcEitYecCp86u5I59aDZJXbHcslJkWiyi30ejNfPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X2C7+RtJtziVHc1LvzI9mLBG01+NrRz69zEr20VqeJI=;
 b=Y1lxzWFWyufYiIndAOqt5mZ1PY7x7bvVCc2L4EhCUhKhaafNW6tKBoz0u7rqCJAyDVyqjSXCmBJDv2QZh79lgdDhEnSGKw5p7Wi2JXa/qf3gOgJfGXzdPR2o4nv7dY2gc0DKcwtJtSDCbhjhkP5oYMJkBNzp0odv8IyC0Z1PWmJSnDec3wINIUGYKMZKziQBzcoD2dbQpgdQ7DFIuov0GzpV+csof+KwPV1eRHXgrij4UUQpEZirRiRBGOACG9W+dxR070Yt82HQs6u/RY0AMGHtsGR3jfjXaPZBfF7za2dClHpQ5rVHZkmZ77o08itOOnnX0h+HDtYJY43qr2jckg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X2C7+RtJtziVHc1LvzI9mLBG01+NrRz69zEr20VqeJI=;
 b=lhAYSudInbQGsQ7Hoiv+X1g275XTJ4N7n+Zsdymn5NhLerObgwCaRi7vpjbSwi3euSKNDlLpmU2n6Qb5snopkPqfQCi9ODxho0amGcacNmsvhnYMdqnbhdF6h5D6wcHxIkN9Vt/8/C5BSeT7ifTbAh2QRmUD/+Qh6U42Bf8gKH4=
Received: from DS7PR03CA0010.namprd03.prod.outlook.com (2603:10b6:5:3b8::15)
 by SA1PR12MB7038.namprd12.prod.outlook.com (2603:10b6:806:24d::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.14; Tue, 30 Aug
 2022 13:25:40 +0000
Received: from DM6NAM11FT036.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:3b8:cafe::d0) by DS7PR03CA0010.outlook.office365.com
 (2603:10b6:5:3b8::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15 via Frontend
 Transport; Tue, 30 Aug 2022 13:25:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT036.mail.protection.outlook.com (10.13.172.64) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5566.15 via Frontend Transport; Tue, 30 Aug 2022 13:25:40 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Tue, 30 Aug
 2022 08:25:38 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Tue, 30 Aug
 2022 06:25:17 -0700
Received: from amd-B450M-DS3H.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.28 via Frontend
 Transport; Tue, 30 Aug 2022 08:25:13 -0500
From: Syed Saba Kareem <Syed.SabaKareem@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
Subject: [PATCH] ASoC: amd: fix spelling mistake: "i.e" -> "i.e."
Date: Tue, 30 Aug 2022 18:52:55 +0530
Message-ID: <20220830132259.7759-1-Syed.SabaKareem@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d7b96930-c3a8-4ca1-5aa1-08da8a8b2247
X-MS-TrafficTypeDiagnostic: SA1PR12MB7038:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qIMa/tSgSx5KEqjcPkSurgTRt6cC7A5rv5cisbkuWrku0xRB5NBrqF3TovQVyvJjhqZeiHL2xEhTFs0zvkK9OitWtys7FIRZAw1qwCkHZt4z2kZrR8amuM4wG1vOY4b9ojmMxqIG/dmvRbUYPfKw6Tn5/l5dfOZMiAZhTKffYLUn2M95ipfNS/7i0F6rkw1F9jfwXLgPFY4L9lGjfLicSbBe0Cxe4pi02JMWsgMFFfe9cJAUrgHrzoEbZn/03Hj4MpLsbqbGsk+NYWLz0V+rYCg9dfOcPQucklbST+bB3A0ZPkcXq3vVxaFZytt+mbhPKycriqx3CaWgplgNCBZgsGa5QYEI/KvudTpB4bzIDk78cF0TcRS3zao1iEgiwXO8HQxSAEu7hQvIO71YMfHVoxYvckFEH1Vy1K8vqemX9mvih5uqwFrL002OQG4T4TiZvLYycBG7rzhOn5VKVRiaZ33XydFY/xu2ji4l7Atp58fxhLKFu3fhTKSVVnN3/NbWsl9Ghxzl3iGs7NEYV9T0KHdHh2XfyncoUuKTh2v8o0iy8er5TH+XR/yYR69bjXavuq/Cw5Yd9RE690aXgao1E6fFgiaQfLF9Q/wqHMkhBoGtYLhM5mGfAnjdXkISaOiXwnw1JhjZb3ujFCsYckm+7NKmNMNjqYzJ+Qm+KYsL46h8JUsHotxzIrF49nBa9FAKnrLf5WPMx0tvPsiUZAB3QdmnZeX2iQB/AgQBZRlZLwTzpvHV4KExwqIrReTToBntIUD5+kh5YOgU14TzcfWbJy7wy/sUXxvMVUWL0+xfcIbdVHLQ2wNXpLXQlEP5O7+6
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230016)(4636009)(39860400002)(136003)(346002)(396003)(376002)(46966006)(40470700004)(36840700001)(1076003)(110136005)(54906003)(356005)(82310400005)(86362001)(186003)(36756003)(40460700003)(82740400003)(316002)(81166007)(47076005)(2616005)(426003)(478600001)(26005)(4744005)(5660300002)(70586007)(70206006)(8936002)(41300700001)(4326008)(8676002)(40480700001)(36860700001)(6666004)(7696005)(336012)(7416002)(83380400001)(2906002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2022 13:25:40.5441 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d7b96930-c3a8-4ca1-5aa1-08da8a8b2247
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT036.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7038
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Sunil-kumar.Dommati@amd.com, Lucas Tanure <tanureal@opensource.cirrus.com>,
 Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>,
 open list <linux-kernel@vger.kernel.org>, Basavaraj.Hiregoudar@amd.com,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Randy Dunlap <rdunlap@infradead.org>,
 Syed Saba kareem <Syed.SabaKareem@amd.com>, Vijendar.Mukunda@amd.com,
 Julian Braha <julianbraha@gmail.com>, Daniel Baluta <daniel.baluta@nxp.com>
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

From: Syed Saba kareem <Syed.SabaKareem@amd.com>

trivial fix to spelling mistake in Kconfig File.

Reported by : Randy Dunlap <rdunlap@infradead.org>
Signed-off-by: Syed Saba Kareem <Syed.SabaKareem@amd.com>
---
 sound/soc/amd/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/amd/Kconfig b/sound/soc/amd/Kconfig
index 68837d42736d..150786279257 100644
--- a/sound/soc/amd/Kconfig
+++ b/sound/soc/amd/Kconfig
@@ -122,7 +122,7 @@ config SND_SOC_AMD_RPL_ACP6x
         tristate "AMD Audio Coprocessor-v6.2 RPL support"
         depends on X86 && PCI
         help
-          This option enables Audio Coprocessor i.e ACP v6.2 support on
+          This option enables Audio Coprocessor i.e. ACP v6.2 support on
           AMD RPL platform. By enabling this flag build will be
           triggered for ACP PCI driver.
           Say m if you have such a device.
-- 
2.25.1

