Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C1BB249080C
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Jan 2022 13:01:37 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2BC8517B9;
	Mon, 17 Jan 2022 13:00:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2BC8517B9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1642420896;
	bh=33h2PEdJ01sNA0ETJVSY3RAO1uf2hfF7MSaDGWq7ZMc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aD3768fc69bb3rxJBXdew4Tef+GDHJjYJhS6FLQ3PWZF4SOcxYtwjDIm7rgySzyrV
	 pbnFOTzzgLmQZ3KrsWCwkj5AaJlRiDAu+UVkL5w8cVTJHE91bksoTJbAhJ1dTkEaGn
	 1NssKXTFQYB9uBsi+j7TUQiA246UCy/GqZZzx85I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 38BADF80506;
	Mon, 17 Jan 2022 13:00:21 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 60339F8025D; Mon, 17 Jan 2022 13:00:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2050.outbound.protection.outlook.com [40.107.92.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4DB9DF800EB
 for <alsa-devel@alsa-project.org>; Mon, 17 Jan 2022 13:00:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4DB9DF800EB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com
 header.b="n20tEt4S"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LB7FWlMlFPbzAe/1VLSXuB2uXv20Pou++2v6u5VRjfavd5zkR9CX8ujghQFfQOYKCDU+z642Zq360NGq0Id+zbsfGfPYW6K/Ewx2gR0Hnlk1rxLPhUTz/xdpDmljfN7HNpsrxH0pNpw/EmsANhs//hCo+pxoJba1ZWcn9b3p5o83eR6ycbJ1gO6exFmfhKjfof7OoBITHRbdoqf9eX8Bb3tB6l9/IBfydRes0QTb7FLx/5AnvoRQOZyELkMxVG2kSEKwOqC1mGzBtj8v3fyCeTySREoTdJixm04ETjBvDlCi1nev79JtJrQpcy1E/iSAMEMUeo6BHRPsZqUOHXFmkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2m1RzSnqEB7lEjWdke8awBRfdhrc7YeH/cC/s43plRo=;
 b=gQEju43+pwsnpaSRrG16VvDfAOYSCqs0nOnLMGhqY2C5d/Jn+bmKBUmkWcDsJD4Fx7SK1R0iSKkqEJGV6J6PPttWjcA5Xi7M4K/o4+ECHs1y7U3l6bB+H7VHhgwW49Iyqalm/dryRYVwvqQudGsLT7d66tccHJjkqHPimDQ6ts8eW6uqt5SlsjfpbPCpfwkE5J/LUYdFKErTmXrbF1MmhhJ0yL1A/XwhNVL1dLdE6VEvMmfjsy/eai3VsCVYPuZ64qtqQ9AdbSzc7/o+qJ8fPXBKJzTDWZ3+4stUqa3/PpyWuw5UeCz6q20UZIVR1lJ6o5rZqDs9Eugi5+w9px893g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2m1RzSnqEB7lEjWdke8awBRfdhrc7YeH/cC/s43plRo=;
 b=n20tEt4S7GNBmfB4ccOmuihrcMDo/k70xxVKjJtE+s7cAYMgTNYiUVug4qS/DtVRynCBk8jyXOW3zFDZOre2Cr+KUiyTZrl+ff2gQcVeDdZH1Zwy4cUzMwsH124fjTNV5vsp9nLvZwLw3GfOYtFt3Pv6vrDG/eAj5yczfox3Zkc=
Received: from DS7PR05CA0020.namprd05.prod.outlook.com (2603:10b6:5:3b9::25)
 by DM6PR12MB2667.namprd12.prod.outlook.com (2603:10b6:5:42::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.12; Mon, 17 Jan
 2022 12:00:09 +0000
Received: from DM6NAM11FT034.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:3b9:cafe::f8) by DS7PR05CA0020.outlook.office365.com
 (2603:10b6:5:3b9::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.7 via Frontend
 Transport; Mon, 17 Jan 2022 12:00:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT034.mail.protection.outlook.com (10.13.173.47) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4888.9 via Frontend Transport; Mon, 17 Jan 2022 12:00:09 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Mon, 17 Jan
 2022 06:00:09 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Mon, 17 Jan
 2022 04:00:08 -0800
Received: from chrome.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.18 via Frontend
 Transport; Mon, 17 Jan 2022 06:00:04 -0600
From: Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
Subject: [PATCH v3 2/6] ASoC: amd: acp: Add PDM controller based dmic dai for
 Renoir
Date: Mon, 17 Jan 2022 17:28:50 +0530
Message-ID: <20220117115854.455995-3-AjitKumar.Pandey@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220117115854.455995-1-AjitKumar.Pandey@amd.com>
References: <20220117115854.455995-1-AjitKumar.Pandey@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f50909c1-ea48-4acd-5a6d-08d9d9b0e914
X-MS-TrafficTypeDiagnostic: DM6PR12MB2667:EE_
X-Microsoft-Antispam-PRVS: <DM6PR12MB266746D80CCE9F3E82608DC582579@DM6PR12MB2667.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:901;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MIp6lc4GCYEFu5ZJ43/1LnEXdUxma3nD/acBPiMR2fBHAyExu1DRRfRGXym7VHtIMpyBx3PbRmzxdVGr76q563wm57sKr1EqlhcScHoGRWx6hgJ0u7ynrAstjuCMzvonNt7z7J+irfS3Q0LWGE1Ipr9Vm+BqDZTfBNXiGDbyZlgSUxr1XXwyPpO02cpSKarAnQCNf12CYWBQCgiakKOitVxt9X3s6b2OIzFq5/ZDa3fuF932ZiuhB2mpufB0b2RtLBcoe8N3C0Zf3B48LUgry6AoZsudBTwoQW4hWW1sNWtNrxYPEHV0Dw/TsVLEenT688P622gTldw1lQWpo9/6i+UT4hutUS/HX1VQ6EPYKz/QdV3L6nmBXBubwQ9IkDsGyuAsp+6xM8WTar5NZS2Lov3zZq+xslsjXSSA1BK9zp1WDqk0rEZgZWJyy8EyWvszbzTWg6NgT1rTl0Ge4+e3gU1BpvXiujMgyflFbq6+iSyhv6vkZWZF1oULNbivuWK9HTtKngwyU2SVJ+5TqXfc03CSNo3uKetqUzgEIdQkCxR/Z27MZCAF6n88lJNhmFsPuQNjoh2p/QbUfylwDy7x4sOTd/A4bnhxFbIfrgTP7nFxRAhyHNcEAUn0SolvC4fGEmQ+QzeNbti1/8J0+ImDCLoYccJEiRHZwlY8KQ31kSEbnJU5VslKUbVECbBbOUX5hFMBuIJcT8Pm6hBQg6KKbi+EGnV9tAd5IQ3MGmao8Rl91YPV2h3CQ7KjwWpr/9sqO0SjGW75Ltse+ZREdTO0Oqndndi63RxTMaXon+IreQs=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(46966006)(40470700002)(36840700001)(70206006)(5660300002)(336012)(186003)(426003)(26005)(1076003)(36860700001)(86362001)(2616005)(83380400001)(8936002)(508600001)(81166007)(8676002)(2906002)(36756003)(4326008)(356005)(54906003)(47076005)(110136005)(82310400004)(40460700001)(7696005)(70586007)(6666004)(316002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2022 12:00:09.6751 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f50909c1-ea48-4acd-5a6d-08d9d9b0e914
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT034.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2667
Cc: Sunil-kumar.Dommati@amd.com, Geert
 Uytterhoeven <geert+renesas@glider.be>, Ajit Kumar
 Pandey <AjitKumar.Pandey@amd.com>, open list <linux-kernel@vger.kernel.org>,
 Basavaraj.Hiregoudar@amd.com, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, V
 sujith kumar Reddy <vsujithkumar.reddy@amd.com>, Arnd Bergmann <arnd@arndb.de>,
 Vijendar.Mukunda@amd.com, Alexander.Deucher@amd.com
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

Renoir ACP IP has a PDM controller block. Add DMIC dai instance in
dai_driver struct to enable dmic capture support on Renoir platform.

Signed-off-by: Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>
---
 sound/soc/amd/acp/Kconfig      |  1 +
 sound/soc/amd/acp/acp-renoir.c | 13 +++++++++++++
 2 files changed, 14 insertions(+)

diff --git a/sound/soc/amd/acp/Kconfig b/sound/soc/amd/acp/Kconfig
index 2e6d0259f2e9..f4ca7843391b 100644
--- a/sound/soc/amd/acp/Kconfig
+++ b/sound/soc/amd/acp/Kconfig
@@ -29,6 +29,7 @@ config SND_AMD_ASOC_RENOIR
 	tristate "AMD ACP ASOC Renoir Support"
 	select SND_SOC_AMD_ACP_PCM
 	select SND_SOC_AMD_ACP_I2S
+	select SND_SOC_AMD_ACP_PDM
 	depends on X86 && PCI
 	help
 	  This option enables Renoir I2S support on AMD platform.
diff --git a/sound/soc/amd/acp/acp-renoir.c b/sound/soc/amd/acp/acp-renoir.c
index 9b321a055b52..770a57a0677b 100644
--- a/sound/soc/amd/acp/acp-renoir.c
+++ b/sound/soc/amd/acp/acp-renoir.c
@@ -97,6 +97,19 @@ static struct snd_soc_dai_driver acp_renoir_dai[] = {
 	.ops = &asoc_acp_cpu_dai_ops,
 	.probe = &asoc_acp_i2s_probe,
 },
+{
+	.name = "acp-pdm-dmic",
+	.id = DMIC_INSTANCE,
+	.capture = {
+		.rates = SNDRV_PCM_RATE_8000_48000,
+		.formats = SNDRV_PCM_FMTBIT_S32_LE,
+		.channels_min = 2,
+		.channels_max = 2,
+		.rate_min = 8000,
+		.rate_max = 48000,
+	},
+	.ops = &acp_dmic_dai_ops,
+},
 };
 
 static int renoir_audio_probe(struct platform_device *pdev)
-- 
2.25.1

