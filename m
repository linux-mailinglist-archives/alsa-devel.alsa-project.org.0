Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 751AC5910A4
	for <lists+alsa-devel@lfdr.de>; Fri, 12 Aug 2022 14:14:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1764A15C1;
	Fri, 12 Aug 2022 14:13:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1764A15C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1660306474;
	bh=oPu6PUHE3BpAuIH4k6mDMGDDt8THxtauaxb8NQzlO/8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=miLBbTOp9YnXfaF2HbBp1eVHJsecH/AWO+58KmKGS+VcZc2gySaIBwvQucKP0T+cP
	 KV62eO6VHwzX01WSMT+ptlLu+gBlDJqLq77VVJ5evqeuj5Eeisqmv3QUPdBFqPH6Bx
	 ViYNchFquW8vBDmlzOxJyt+MKtpMUCKo5k3fJE5U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D0709F80564;
	Fri, 12 Aug 2022 14:12:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4C7EFF80564; Fri, 12 Aug 2022 14:12:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2044.outbound.protection.outlook.com [40.107.244.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1F88AF80054
 for <alsa-devel@alsa-project.org>; Fri, 12 Aug 2022 14:12:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1F88AF80054
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com
 header.b="gNqNt9Li"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P+JtBmSY/Rez9NhncvsXgU1e0IZY1Sc+88IbZ/mRvQer+gvCxuE4WayGXOYYAE0/VUegLEOIFcyBpuuCHdUtvAouzf+H86l1baT/rKlcsxlRwPVOUVQquQrtsfRDM0Vz9kRfmn4ILJOQ7EwGCuoEr+1quOJJ0u5zipV3QToSviaCbB3Cwq9tvpn5LHBQf+xkuCgvkQwRLaq+oScMuQBnmbrRCVIy3HOCMY2TNcj/OQzSM+CPkETsBzXxQeu3NyacdRXTZ7k9QEj/7kvcG0vril+j7CMC5NLpDnKBA4SHhasBUDuhVITHnFs2MkYYvjYLqrr6u23+V+rC2OatPcwl4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GMY39Rqve2SBMryFwjGvCgB0MNPBLYUXYhJ7fU/hv04=;
 b=MMdaRUSDy33AuqUETYSvWlfVCwafyFKQ6yC6IRvNhUpXbIwjxyt3hiIV/1giRFzqDLpOgra2K1xJldZU9dQQoOSiP9++NWrbeFKZTDIigej2hw+kLDxd028b4zPb8c3iOdbTApVtxKKpv87dEzYD2RB1nQa/MASR8lO2bB5J9jojBZ4rFWdBLwXxBezZ1OdpfI0U6nQ865PcxCYo/zfJ8hGSn5wpPEbFu99vrWAC5nhW6XcvgnSBF9rSfabfcO8fo47iLlzt9F4SAU5Kc0hjB9nxz6YvHiYo8yY8P4RfE9ll4c6GWGXQW3G+TACmO3XBC3Xu0sGoepu0k4w6QF2MMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GMY39Rqve2SBMryFwjGvCgB0MNPBLYUXYhJ7fU/hv04=;
 b=gNqNt9LicMft1rq3YxFfuL6DB4DNL2sTqlVVgJ49A/zEZVKYw/vBHbmc9ymoUoFPQud3l7q2OGs0/FOSN802MjFwbKWrMj7zd9QBQ9OAIMBHplXoSOQUNuCSL9KvWe5eTAXRWzP0V+yJfC6vLwEfHacYlKoVuoqvVlzw/iC+z7A=
Received: from BN8PR04CA0054.namprd04.prod.outlook.com (2603:10b6:408:d4::28)
 by BN8PR12MB3395.namprd12.prod.outlook.com (2603:10b6:408:43::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.17; Fri, 12 Aug
 2022 12:12:30 +0000
Received: from BN8NAM11FT059.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:d4:cafe::fa) by BN8PR04CA0054.outlook.office365.com
 (2603:10b6:408:d4::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.16 via Frontend
 Transport; Fri, 12 Aug 2022 12:12:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT059.mail.protection.outlook.com (10.13.177.120) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5525.11 via Frontend Transport; Fri, 12 Aug 2022 12:12:30 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Fri, 12 Aug
 2022 07:12:07 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Fri, 12 Aug
 2022 05:11:46 -0700
Received: from amd-B450M-DS3H.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.28 via Frontend
 Transport; Fri, 12 Aug 2022 07:11:41 -0500
From: Syed Saba kareem <Syed.SabaKareem@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
Subject: [PATCH 13/13] ASoC: amd: enable Pink sardine platform machine driver
 build.
Date: Fri, 12 Aug 2022 17:37:31 +0530
Message-ID: <20220812120731.788052-14-Syed.SabaKareem@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220812120731.788052-1-Syed.SabaKareem@amd.com>
References: <20220812120731.788052-1-Syed.SabaKareem@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ad27d460-8ec1-4ceb-febf-08da7c5bede7
X-MS-TrafficTypeDiagnostic: BN8PR12MB3395:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: l/hF5UY7p8Ff3TnD382yaxQAzecZwYwkZEr/e3cl5L+GlOL5aVBQ224FAFhV0su3CB6WW/esrR3vuL2UWTSkzMYyNbzGJ0Y0hEHJ3+z4pS0lMZ5xzB9uU7dP4LkxIO1j5tVDF2+pv/FWNcKAZ9M3CPyiJ9syh4Af+YXaTck8i8d381D51Rq7S7ZXzMux/yD7gDk7aejYla/FrZpv0Ah2WFsXLRcXuwdfwa5E9XDthpkAvg7M+T814mVdia+5DsMoNcQJeevqApy40F32BSDRuxmr6QkAYVVx17PDLZkRAmnMY7+RjJJkv+wCWERpUdjObu/NDJjHOHUGNOfl8XXuDWIliHCG6gN5STC2KDcy4Y9bHA2JCtmqUfUjsFyxnFbL8FamV1jCMD5dDgXxxRZv521QFjkjITFOF0E/MTdImd9DrIJx+vwgCmYdXntzytJELqlZujiBFNyVKrbv/TvFCXR9vKYPsnhmnOYZEYeNrNyhxoOe4WTatWOrKE5dDOJFjN0dxfZ2Z6ux71XH+ChWeWzyLXPflcV3xCP6p03JShyVDxpyfeLw06XsWazc3eA0AMIHH6BWB/AU/98ldt+yDj2icDjLhTY7E0CPrQuM+sNpnzCXdOtVnO769eqDmorcB7/QtpMwHHhD9fs/BWV/WIoMR7FbctlEwEBNOHj3kZOd1OA5zr+PKUIujuQASVgLtZ3+4ty0wBdQXltfhLp1F21YedtSxjwjcAHsAOB/WZqKlc75001aihIbLJYrwL/6qVWYvG5kTzB1UReKvvyIiktmRivJHH8Ixb/AjMaq2Sil+d/L9F+hBu/z4ducfYwKBbxIMuAxsTmOYkrZQP/8Lg==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230016)(4636009)(396003)(39860400002)(136003)(376002)(346002)(46966006)(36840700001)(40470700004)(70206006)(316002)(5660300002)(4326008)(478600001)(40460700003)(54906003)(110136005)(82310400005)(8676002)(86362001)(40480700001)(36756003)(70586007)(2906002)(7416002)(8936002)(36860700001)(83380400001)(82740400003)(81166007)(47076005)(356005)(6666004)(41300700001)(7696005)(426003)(336012)(1076003)(186003)(26005)(2616005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2022 12:12:30.0056 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ad27d460-8ec1-4ceb-febf-08da7c5bede7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT059.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB3395
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Sunil-kumar.Dommati@amd.com, Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>,
 open list <linux-kernel@vger.kernel.org>, Basavaraj.Hiregoudar@amd.com,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Randy Dunlap <rdunlap@infradead.org>, mario.limonciello@amd.com,
 Vijendar.Mukunda@amd.com, Julian Braha <julianbraha@gmail.com>,
 Lucas Tanure <tanureal@opensource.cirrus.com>,
 Syed Saba kareem <Syed.SabaKareem@amd.com>
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

This patch enables Pink Sardine platform machine driver build.

Signed-off-by: Syed Saba Kareem <Syed.SabaKareem@amd.com>
---
 sound/soc/amd/Kconfig     | 11 +++++++++++
 sound/soc/amd/ps/Makefile |  2 ++
 2 files changed, 13 insertions(+)

diff --git a/sound/soc/amd/Kconfig b/sound/soc/amd/Kconfig
index 0f461beca274..883b132a87e5 100644
--- a/sound/soc/amd/Kconfig
+++ b/sound/soc/amd/Kconfig
@@ -137,3 +137,14 @@ config SND_SOC_AMD_PS
           triggered for ACP PCI driver, ACP PDM DMA driver.
           Say m if you have such a device.
           If unsure select "N".
+
+config SND_SOC_AMD_PS_MACH
+        tristate "AMD PINK SARDINE support for DMIC"
+        select SND_SOC_DMIC
+        depends on SND_SOC_AMD_PS
+        help
+          This option enables machine driver for Pink Sardine platform
+          using dmic. ACP IP has PDM Decoder block with DMA controller.
+          DMIC can be connected directly to ACP IP.
+          Say m if you have such a device.
+          If unsure select "N".
diff --git a/sound/soc/amd/ps/Makefile b/sound/soc/amd/ps/Makefile
index 23afa5e32ffa..383973a12f6a 100644
--- a/sound/soc/amd/ps/Makefile
+++ b/sound/soc/amd/ps/Makefile
@@ -2,6 +2,8 @@
 # Pink Sardine platform Support
 snd-pci-ps-objs := pci-ps.o
 snd-ps-pdm-dma-objs := ps-pdm-dma.o
+snd-soc-ps-mach-objs := ps-mach.o
 
 obj-$(CONFIG_SND_SOC_AMD_PS) += snd-pci-ps.o
 obj-$(CONFIG_SND_SOC_AMD_PS) += snd-ps-pdm-dma.o
+obj-$(CONFIG_SND_SOC_AMD_PS_MACH)   += snd-soc-ps-mach.o
-- 
2.25.1

