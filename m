Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F5F088DB85
	for <lists+alsa-devel@lfdr.de>; Wed, 27 Mar 2024 11:48:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 671A32BE5;
	Wed, 27 Mar 2024 11:47:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 671A32BE5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1711536489;
	bh=i95u17899A8wT0fMxsIx12gK2zpFb5H1+xSB3vV5L8c=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=tSnCbhuG9Qc3uz4xsi5jSVOUT2e7rAvs4wEbA/hkXHmT/ineDck1edjy76T+cravW
	 id8KYTXsYZywWV3+bn5STOZhxwekaPX9P4aAnDDrtre44veOGJ5AzQnezokfsUzADt
	 DliCi0vJaGaoBl6qxzFiEzfCHJvA0LZpW6Il5eH8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 20DC4F8057E; Wed, 27 Mar 2024 11:47:37 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9A4CAF8057C;
	Wed, 27 Mar 2024 11:47:37 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E6E0FF802DB; Wed, 27 Mar 2024 11:47:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on20601.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2409::601])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 49338F80093
	for <alsa-devel@alsa-project.org>; Wed, 27 Mar 2024 11:47:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 49338F80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=lf6jOXsC
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Df2DpoPNs8V6VsqCvOTcANTLU/Dj6kFCagLa1BjbLKX3axSFFIWcQhI+z4CmvxQIjZZTR8qTTAuF/ob7npc9IDl2zt0WCuIdtN+MXbthfHAZXKP1eLWw1HcQncml0ztmfYj7CPWOL5qZSbm8mGRHjNglijLrUHVE9SYd4//FbtA8H0S8xrV1cAiOdl0Bzc2OVRpVmOQo+mda0l6VmAxsrCZEHpMecVAS0t7D5K0tx634RopHqPUzROGKmn5qgiEtfgU9CmrMR6O28WlCe6UMJ4OSOGgkoXoL9yJTnTYE/RtBfFzQmg9ZhHMNWOqFT7fOUD14752AZnh9Up/9CfCgUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d5smLNZkQqJKveisiGZZQI4MfldQKbnc/49OGn0revQ=;
 b=oCANT8tvkbUPdHJTdhnS8KkcJnBPzH8Od0f8V0bXajDrKg0zQ7ZZYpvIx4xuF3bFqPn/tYe3MPpXZzC5VboHKS3aUDNtstxwPSmoTdm4nfx2I0FAfuJUJXZ62XlyuzoIcTsXeo1SV8+JipEucPENyk73uNT+5fuV58r9IISN4b4vRAG/HgHpUyDDZ6gkjAP/PgdWQfGDz/f6oTAKqeXkJ8X8zJD94qqP6ehRVHHcSWIywY2TyHHQQ4QSMoyR32mCVuxWjefl37ptr6heWrLDULiAvIJ4CG/LTWxNHxekmeE0qH0L5UqLnn6JYKb+Ahe30TAPA4SPibparGELDrTMWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d5smLNZkQqJKveisiGZZQI4MfldQKbnc/49OGn0revQ=;
 b=lf6jOXsCgd/fneaDO4NxiOFiKntI1lpQXMInwJwkXIGCyFu/Ppm+Bgq7Uy/DAVmJROy9vtz1WL+M5wW9FjhKTH5m9+iP83aLj5+tx/w5VEELjXcrUNzAL6Xe6Q+muqGbVFN6HBE1Y8HyrI8p8MrZZSXVv2Ln0sTQKFV4DWq0E80=
Received: from MN2PR14CA0014.namprd14.prod.outlook.com (2603:10b6:208:23e::19)
 by DM4PR12MB7549.namprd12.prod.outlook.com (2603:10b6:8:10f::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.33; Wed, 27 Mar
 2024 10:47:07 +0000
Received: from MN1PEPF0000F0E0.namprd04.prod.outlook.com
 (2603:10b6:208:23e:cafe::25) by MN2PR14CA0014.outlook.office365.com
 (2603:10b6:208:23e::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.13 via Frontend
 Transport; Wed, 27 Mar 2024 10:47:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 MN1PEPF0000F0E0.mail.protection.outlook.com (10.167.242.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7409.10 via Frontend Transport; Wed, 27 Mar 2024 10:47:07 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 27 Mar
 2024 05:47:06 -0500
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35
 via Frontend Transport; Wed, 27 Mar 2024 05:47:03 -0500
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>
CC: <alsa-devel@alsa-project.org>, <venkataprasad.potturu@amd.com>,
	<Basavaraj.Hiregoudar@amd.com>, <Sunil-kumar.Dommati@amd.com>, "Vijendar
 Mukunda" <Vijendar.Mukunda@amd.com>, Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, "Syed Saba
 Kareem" <Syed.SabaKareem@amd.com>, Jarkko Nikula <jarkko.nikula@bitmer.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>, "open list:SOUND - SOC LAYER /
 DYNAMIC AUDIO POWER MANAGEM..." <linux-sound@vger.kernel.org>, open list
	<linux-kernel@vger.kernel.org>
Subject: [PATCH 1/2] ASoC: amd: acp: fix for acp_init function error handling
Date: Wed, 27 Mar 2024 16:16:52 +0530
Message-ID: <20240327104657.3537664-1-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: Vijendar.Mukunda@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0E0:EE_|DM4PR12MB7549:EE_
X-MS-Office365-Filtering-Correlation-Id: 10c85059-f079-494f-bb00-08dc4e4b3f43
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	WNcgTA9p30QBN0pCc4Pl5QDBi6YfRqxbozOpcJWxh0akK6a3m7to4Ypm4opqBttKvHsgfbvqF25B9RH49QtRYh+3ljSt+MM+qe4TaaUsm5N3K7TTDNxotVU/VPjNQvvl4n6aTgP+gj/DIoMcqZtVoShMOBkoXOqNUVipO0Z2l9IZMphd2nqHV8/MUC4YH4fwfXF75O4xomg8vyUdrfBe2VR/+1AiNPs3TrCdWiM/TRJ8Nz90JyjOJVVSlEVfQAUA9iJoFBHO53pxgbyU+ZqxUf52oUqsAYYhyHTQxyJIjVjje+RK3O/UPK09fdanvqoo67sh5xto8O2b10hx2lWft5YoO+A8Y4P50dqkuBaWYenwr6tQ5NVWPqKPM6Qu60EK116W1NcOprDEmrYjZRiaZ5wu8BQNs/gip3pE4IpqvozhlmHd4smuQQcOReWoT2vyNGcJ7DmsdZXZV4VFXqpQBK5OWt9gykpSDF+Uw9Ik8fNQoK0fDsM14Bnzo+WS1tC7FTke7yVc8cDB/5zr653e+z+GSTwQNVPRX3oyWWxkQGQ0cQXMePkFnSB+vHmoYUrabCEVpVr+1JosrYL0aYiojHXGuT3FC7kSExe6fBIbOP9xu0xh+dzppH/v04zorECF92TAlwiMJqzsmOOWvi5vhSTpr5rKUrJPt5Y/15P9LytMepKV7/ccPISoe79o25m10Zmy98+tMz/iplT/SgWfch4TFc3RWHIcjIYP7yyzMLQ5yHxku4G2HZ4m/0m5sND9
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(36860700004)(82310400014)(376005)(1800799015);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2024 10:47:07.0216
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 10c85059-f079-494f-bb00-08dc4e4b3f43
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	MN1PEPF0000F0E0.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7549
Message-ID-Hash: KZ3VI5KIAUSD73QVN2CICFADA4YOYHEC
X-Message-ID-Hash: KZ3VI5KIAUSD73QVN2CICFADA4YOYHEC
X-MailFrom: Vijendar.Mukunda@amd.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KZ3VI5KIAUSD73QVN2CICFADA4YOYHEC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

If acp_init() fails, acp pci driver probe should return error.
Add acp_init() function return value check logic.

Fixes: e61b415515d3 ("ASoC: amd: acp: refactor the acp init and de-init sequence")

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 sound/soc/amd/acp/acp-pci.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/sound/soc/amd/acp/acp-pci.c b/sound/soc/amd/acp/acp-pci.c
index 8c8b1dcac628..c1d4140f0746 100644
--- a/sound/soc/amd/acp/acp-pci.c
+++ b/sound/soc/amd/acp/acp-pci.c
@@ -115,7 +115,10 @@ static int acp_pci_probe(struct pci_dev *pci, const struct pci_device_id *pci_id
 		goto unregister_dmic_dev;
 	}
 
-	acp_init(chip);
+	ret = acp_init(chip);
+	if (ret)
+		return ret;
+
 	res = devm_kcalloc(&pci->dev, num_res, sizeof(struct resource), GFP_KERNEL);
 	if (!res) {
 		ret = -ENOMEM;
-- 
2.34.1

