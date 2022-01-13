Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C08FA48D45B
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Jan 2022 10:32:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 629A91F29;
	Thu, 13 Jan 2022 10:31:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 629A91F29
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1642066363;
	bh=xNr9Uwot3B4ZCiOQ3YlgQ6ktffPcXuoKWFJkNUUkniE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=a6zXeseIzgGGP76nDOyFHuJT0wYrH7G9pEe7o2t+FmzGu/cS8brvvZ5QUzp/qKzsh
	 A7gyD4AwOMxFLrPnh5bMvzLdbnjauZWMcFuLEPFFGNXMKapJkSghFMQw1DWo4i4n/8
	 mgIl3zkwVi8IMhKIaGxA14oN1G4BoS1vODqEqUBk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D0C86F8051C;
	Thu, 13 Jan 2022 10:31:03 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 14E0DF80520; Thu, 13 Jan 2022 10:31:03 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2048.outbound.protection.outlook.com [40.107.93.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9B726F8051C
 for <alsa-devel@alsa-project.org>; Thu, 13 Jan 2022 10:31:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9B726F8051C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com
 header.b="UaWrwmUv"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Hh9DEqcT4uz9mUEk9snkXjzZaQ8VF18I2Xyn8/VBejT8iKBA+bzMCcC6AZj39ywKHlPkHxAu20RDGf03UzIB5ZJnYNosGAh2QCscPH3pE4pmJYnJZJvRktLpdLK+CpGUpA1u9mt/WwRRJ3uR/MpJUCAShJL0hjB4j6XOjmgaHJsiX07IQ8tP3ux2mr77KJrq0YEKm1zEcGYz01/b7mWMglZifC60Fsep6HsCxZnA2lsYTBWMtbsALWQxOEAKSSbY/VJWFMMBTo0FZcM0ZhFP5lFYKcxH1TCj/+SGVHDArzSgXX3NfwnvzhrIIQfRoHjKUo6VgyLSqCBmp7mQ93/VXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RMthq7As3IApvnsSwEpDVZShNtIoE5+Th3bp3BWlFsw=;
 b=LPQdLQnMGfgeBQbuWcEBcuoSVNPQx2J3woN9taexcOFa4QeQcYM3aFptntV5TRlLb4JR+V1pinD854U/ryChlloXtH7uMtWFQemtIM9CPPuNM6Kl7xFND6zrknT540/f6iJng3s47jVF6D++MjCwg9YhI3qO4ycfOnn+bblRF/mUIjuRUT9D1/qO1GoTYFAKYW7z3TsCr/7HSSYv7sdIsz25Q48VxC3Gg1iBiAleDOGNCDkvWYEgZTicpmLhILoaZkzFiWTYkW0emPdYeJZaw3BfZZPbORVZfnzZqE6Wxp/zwIZa0mr1VbMWO7kg8zAzGvvhx65U/OF4jzFZZdU6sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RMthq7As3IApvnsSwEpDVZShNtIoE5+Th3bp3BWlFsw=;
 b=UaWrwmUvHpkAVliVDpH5eSLrdlAshVxtk14Xt3H7JrcKzCo5nxn4PrZMT5jgh3H1549FeJJ6ksvCcgKQIyun1DJOo4G/C65zRN0W8Rk73WqEshbwMHQ2Uzj10slqY/HULnaKCU/mbzrHkFRl7Q/O6R9C6OkKOQd+JHJWo/eGMsQ=
Received: from BN6PR1701CA0022.namprd17.prod.outlook.com
 (2603:10b6:405:15::32) by MN2PR12MB4638.namprd12.prod.outlook.com
 (2603:10b6:208:ff::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.11; Thu, 13 Jan
 2022 09:30:55 +0000
Received: from BN8NAM11FT024.eop-nam11.prod.protection.outlook.com
 (2603:10b6:405:15:cafe::7c) by BN6PR1701CA0022.outlook.office365.com
 (2603:10b6:405:15::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.10 via Frontend
 Transport; Thu, 13 Jan 2022 09:30:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT024.mail.protection.outlook.com (10.13.177.38) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4888.9 via Frontend Transport; Thu, 13 Jan 2022 09:30:55 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Thu, 13 Jan
 2022 03:30:54 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Thu, 13 Jan
 2022 01:30:54 -0800
Received: from chrome.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.17 via Frontend
 Transport; Thu, 13 Jan 2022 03:30:50 -0600
From: Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
Subject: [PATCH 6/6] ASoC: amd: renoir: Add check for acp configuration flags.
Date: Thu, 13 Jan 2022 14:58:42 +0530
Message-ID: <20220113092842.432101-7-AjitKumar.Pandey@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220113092842.432101-1-AjitKumar.Pandey@amd.com>
References: <20220113092842.432101-1-AjitKumar.Pandey@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d93b2c0b-4997-4024-b085-08d9d6776646
X-MS-TrafficTypeDiagnostic: MN2PR12MB4638:EE_
X-Microsoft-Antispam-PRVS: <MN2PR12MB46381171A12FA03D3602C59582539@MN2PR12MB4638.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3383;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zEIh6G41NXMvxXn20zS0HQhvatjce6K2mWvoqT2oe+e+mMaIITBStvZvoJhMMAF4RH6NZGwQnPeoXD/zlGUyA/Mh8Al1bFvzzdoCgCZMG3zoABzlaozYv8JdRYN9HgyNKmAKSQkf/ML2ifmLhy8tFBqXhxBNds3WJ6oEWG0MqMZDk1sgBmI6qWrzMePnoAySC2gOoJxIAo7Ju4K7yo8zn1LHm9sebB+x6x4W2GqWtd4K/Bdwcu51LG5aqibJLVfOzk+lJnByctKYGz+nhuxeqA2Cy4U6jCdojUJgdjNF1+mP+relcVAatioepEVCX77ePUZvUkW1ZQ6OuPYx+ddrAG5sjhqi9rh8ifFcb3ADfSEfXcpi7zI3T/CCJv3olJbeJ4uUVCpeApYORQDgdXwpr6tKI2l+AbwyC8hDexkjD/1Hvt3uRzaCcwcZjebf3TDrUo3lKAI7S4Rfh7zt/bScYx+VLdjd+QWnHK9PCaBR9EMAu2ZZPSQPmq/R8wUYD63U0tJiQDUXUI5hep6UgKkzrgWzegfFO/alvN3PweCzyJL91P4XLoXy9zTDHhpCBxoVFQV7PKHt+gGpsKbhIkcWhGxWE2dUKi0Fp4K35YDNOGUFvhlF4gSZAgoavwzJ1yXpJxmVCDoAL92PS14kLEuEy5xRQg8QNB98aBe7VhYL0RiQquuluAGzG/WPIxfL1U2b8GncE9ssEn6Ur808JVQKGePR/OUqW94BWEAU26yyzJJFHuPx+C47H0esLgMMmR/8zT22h9yWmYbECSYilCWS/SnOGdHIordJi26NK/o0N4o=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(36840700001)(46966006)(40470700002)(426003)(508600001)(8936002)(186003)(70206006)(54906003)(2616005)(2906002)(336012)(70586007)(4326008)(40460700001)(26005)(82310400004)(110136005)(7696005)(1076003)(5660300002)(6666004)(36860700001)(47076005)(36756003)(86362001)(81166007)(83380400001)(8676002)(316002)(356005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2022 09:30:55.3903 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d93b2c0b-4997-4024-b085-08d9d6776646
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT024.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4638
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Sunil-kumar.Dommati@amd.com, Ajit Kumar
 Pandey <AjitKumar.Pandey@amd.com>, open list <linux-kernel@vger.kernel.org>,
 Basavaraj.Hiregoudar@amd.com, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Mario Limonciello <mario.limonciello@amd.com>, Vijendar.Mukunda@amd.com,
 Alexander.Deucher@amd.com, Mark Pearson <markpearson@lenovo.com>
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
 sound/soc/amd/renoir/rn-pci-acp3x.c | 7 ++++++-
 sound/soc/amd/renoir/rn_acp3x.h     | 3 +++
 2 files changed, 9 insertions(+), 1 deletion(-)

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

