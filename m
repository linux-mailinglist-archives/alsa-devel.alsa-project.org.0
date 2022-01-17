Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 67A4849081E
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Jan 2022 13:02:57 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0959917C1;
	Mon, 17 Jan 2022 13:02:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0959917C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1642420977;
	bh=6tWRe2vdR0RnVjupHgL96fCMoT6p0ScGlqEa1H7IEz0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tRwdndpFjWaUrE/AeOl9WGTHQ4oVzNRL7krSJ0mccyhyOKNVuMq5bmb+bIK1UOiU/
	 JV6egpcAwSY6rkstYicCByR9xaOvlJ80rdRi0SSBbkNBrvbKKMEo3JnQcIk0nSeRKR
	 5OeXJQsOPAZIzHcZqaJkZDomhzOiSBe0lTlnMp+U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C76F3F80520;
	Mon, 17 Jan 2022 13:01:10 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 59CD3F80525; Mon, 17 Jan 2022 13:01:09 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2048.outbound.protection.outlook.com [40.107.223.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C5695F80520
 for <alsa-devel@alsa-project.org>; Mon, 17 Jan 2022 13:01:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C5695F80520
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com
 header.b="pUStLqZL"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LD+dQGOmeTda+osJoySqDZY4dxlqxvZdqIyEHzViIlluzU1PgNOgur1/UBK9m7ZuvqFj2JsNN7KZVjt2zNO5ARErwUsnRL6H8HitVckWxntk92sne4s/rHM2nmIRl8IGDN5nxaX6QAhtjRDQ/ASSi9wGNsE+ROYvQZfyNRcjuBr8ly9WmsHX7QEKNy3mhHGRqW5i2aw9rcQA0d0Pq28pLY8V+RF8JKlhVwnYansxUFOgy/GXYpFEUef2f0pu9rwKjM+Fxitv5AC8xhBATptb3KuZ10mIAEdJS+1ZwsY0v0JcxQAglxSNwBCx/O9XVUjjqcmhMiioIw9Lv2DIxB8YAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9URmZK4WDlDfGl56FMDRzO0wB/peXbORuTdb2xPX0hg=;
 b=n5xaTLIKaNQ2M21KbsPrR57JWzAkk1KuaUSZBTBIMLyu+8OwAN/Dx857Wj71gYcktRrzXQzzRsqcRph9pJpfKtnRDsZLk2sDljfb/pdUBAamlHOyRYmO2kt4dibZAVu5cAiqmeZZ41lHoJlRHcXPAPzKPUAli70Q69YWLOjcaNEW/j5aDedZPes1wD+XVL+sLXNu4vMLRRNEsOu+DDeGU4OpTWO6yAuXpc9ciTfgH5dIFLkk3SCUFPCebo7FEU2U8ScC2wzKbPrral8y1dKIvF0p0IIMCXM/NBKSPCWWd0n/lxZ1l2EAwRgr/tU5K+m2SvVrdBgfgyZMlJDxV6x+5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9URmZK4WDlDfGl56FMDRzO0wB/peXbORuTdb2xPX0hg=;
 b=pUStLqZLX7lUtEEiNP2FeqJDzZlJmhVIbQJZgbhOHlf7xAWV6JHdI1J3nwDwHUIsNrAe/wvLmWfTr1F5J2faWTUpRfdV2C2X1uNdUWV4mIXv8bKM3uR3BVHzWL9iNjY2vwmnpgLYZkLzfPSUOvlUozUqISLG/1/0rFct4q35HS0=
Received: from MW4PR03CA0312.namprd03.prod.outlook.com (2603:10b6:303:dd::17)
 by BYAPR12MB2901.namprd12.prod.outlook.com (2603:10b6:a03:138::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.11; Mon, 17 Jan
 2022 12:01:01 +0000
Received: from CO1NAM11FT023.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:dd:cafe::60) by MW4PR03CA0312.outlook.office365.com
 (2603:10b6:303:dd::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.12 via Frontend
 Transport; Mon, 17 Jan 2022 12:01:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com;
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1NAM11FT023.mail.protection.outlook.com (10.13.175.35) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4888.9 via Frontend Transport; Mon, 17 Jan 2022 12:01:00 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Mon, 17 Jan
 2022 06:01:00 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Mon, 17 Jan
 2022 04:00:59 -0800
Received: from chrome.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.18 via Frontend
 Transport; Mon, 17 Jan 2022 06:00:55 -0600
From: Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
Subject: [PATCH v3 6/6] ASoC: amd: renoir: Add check for acp configuration
 flags
Date: Mon, 17 Jan 2022 17:28:54 +0530
Message-ID: <20220117115854.455995-7-AjitKumar.Pandey@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220117115854.455995-1-AjitKumar.Pandey@amd.com>
References: <20220117115854.455995-1-AjitKumar.Pandey@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: aabc68ad-2fd8-4160-5244-08d9d9b107b4
X-MS-TrafficTypeDiagnostic: BYAPR12MB2901:EE_
X-Microsoft-Antispam-PRVS: <BYAPR12MB290186CCB5C0290D5C921E4282579@BYAPR12MB2901.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3383;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dCv+P9dxWCEoIZ2+Shhb8Y8RYqWdlBSwxdlfkp2kgUhkPVypo1Dt3Uvk3LgbYfB8A4MwYBJfHtGQ3k+OYflUtHyPZgYbNfkBBC0Hrn1ngt4uHY03TKEPaXwMUNEIEjhnwVxeITrGf7q0HalSXFf1wVBdtO/ZObXFboNLuQtV3Br5QvQl0Ibd/quORnxeSnjS8dRhKMUsipJZy/lKu++bhoEMdqYIKjUcCslCEj8DX0CNwlq5z3AYXA0iw3xMZwsu5kMIBnfq7ql/zK+K23Vu+JPfsBYlQngPB+/iohkx7YPhumyAuOuxuk8911fTZCIrly79MfMYL3yHuyajnLBdoH+0QQuDH9Vz9WOx2bvKVAQCU9FtHgw/CpZnxaqYIMSchampbkP9Nrfwp+aiHzWGWLuVO1PbWcb35hVkaJxDu/wlu6PTbC06jFa7lMdLaNNO2WEnlP3RHQB+WlMwO5XV4Q6ZXTZK0zCg6pNppVcp9b+PRymrzKs/oXBtfwZ9pG4/09QTwKwBQRfQoZ9lZIBH/8UOMFyMpSh1S71l/bXXKH4tNv7+JQ7oTGFXFd1jTQLJNILfbU9mMHG8ndktfwoc6V6tw1mlqb41D5BxFYxLd4sPbSg0G95wsnw+YZQVteS2jXbFifUH0WQA+VbDJfjss1QtjFo7+8vLw7xdPyjbD2896iu91zNsLwq/jNcgTeplVda9zrDz8sroGnLqE10z4H1tAuzvJarn5ftJmu6rkcfevDfhKTcorD1cn18/wqYL093/AvGhMSNA2mqWleQ2EWeRkPGMaMTDVZGQdg9ur+U=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(40470700002)(46966006)(36840700001)(81166007)(316002)(7696005)(5660300002)(110136005)(47076005)(2616005)(426003)(83380400001)(40460700001)(4326008)(70206006)(70586007)(336012)(1076003)(86362001)(26005)(36860700001)(2906002)(8936002)(82310400004)(54906003)(36756003)(508600001)(7416002)(356005)(186003)(8676002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2022 12:01:00.9614 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: aabc68ad-2fd8-4160-5244-08d9d9b107b4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT023.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2901
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Sunil-kumar.Dommati@amd.com, Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Ajit Kumar
 Pandey <AjitKumar.Pandey@amd.com>, open list <linux-kernel@vger.kernel.org>,
 Basavaraj.Hiregoudar@amd.com, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Mario Limonciello <mario.limonciello@amd.com>, Vijendar.Mukunda@amd.com,
 Alexander.Deucher@amd.com, Mark Pearson <markpearson@lenovo.com>,
 Julian Braha <julianbraha@gmail.com>, Lucas
 Tanure <tanureal@opensource.cirrus.com>
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

We have SOF and generic ACP support enabled for Renoir platforms
on some machines. Since we have same PCI id used for probing, add
check for machine configuration flag to avoid conflict with newer
pci drivers. Such machine flag has been initialized via dmi match
on few Chrome machines. If no flag is specified probe and register
older platform device.

Signed-off-by: Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>
---
 sound/soc/amd/Kconfig               | 1 +
 sound/soc/amd/renoir/rn-pci-acp3x.c | 7 ++++++-
 sound/soc/amd/renoir/rn_acp3x.h     | 3 +++
 3 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/sound/soc/amd/Kconfig b/sound/soc/amd/Kconfig
index 7a9e45094f37..1381aec23048 100644
--- a/sound/soc/amd/Kconfig
+++ b/sound/soc/amd/Kconfig
@@ -44,6 +44,7 @@ config SND_SOC_AMD_RV_RT5682_MACH
 
 config SND_SOC_AMD_RENOIR
 	tristate "AMD Audio Coprocessor - Renoir support"
+	select SND_AMD_ACP_CONFIG
 	depends on X86 && PCI
 	help
 	 This option enables ACP support for Renoir platform
diff --git a/sound/soc/amd/renoir/rn-pci-acp3x.c b/sound/soc/amd/renoir/rn-pci-acp3x.c
index 7b8040e812a1..b3812b70f5f9 100644
--- a/sound/soc/amd/renoir/rn-pci-acp3x.c
+++ b/sound/soc/amd/renoir/rn-pci-acp3x.c
@@ -212,10 +212,15 @@ static int snd_rn_acp_probe(struct pci_dev *pci,
 	acpi_integer dmic_status;
 #endif
 	const struct dmi_system_id *dmi_id;
-	unsigned int irqflags;
+	unsigned int irqflags, flag;
 	int ret, index;
 	u32 addr;
 
+	/* Return if acp config flag is defined */
+	flag = snd_amd_acp_find_config(pci);
+	if (flag)
+		return -ENODEV;
+
 	/* Renoir device check */
 	if (pci->revision != 0x01)
 		return -ENODEV;
diff --git a/sound/soc/amd/renoir/rn_acp3x.h b/sound/soc/amd/renoir/rn_acp3x.h
index 14620399d766..ca586603d720 100644
--- a/sound/soc/amd/renoir/rn_acp3x.h
+++ b/sound/soc/amd/renoir/rn_acp3x.h
@@ -88,3 +88,6 @@ static inline void rn_writel(u32 val, void __iomem *base_addr)
 {
 	writel(val, base_addr - ACP_PHY_BASE_ADDRESS);
 }
+
+/* Machine configuration */
+int snd_amd_acp_find_config(struct pci_dev *pci);
-- 
2.25.1

