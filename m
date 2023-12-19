Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B99F81866C
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Dec 2023 12:33:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5A04BE87;
	Tue, 19 Dec 2023 12:32:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5A04BE87
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1702985581;
	bh=27fVlWFbYgPMdjQKxIYIiTd8FTiAVF1r8gL0y4HbOFc=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=H4iG/gdt6lpunVl2Vhi6Sfo1fxcHZ1c7TamclX5z04vjMO3nuHgTh4k9MOQRiZZGN
	 6C3U463np1adxo2COLlZw73vMKDyzbbDwUy+DAiRqJ3j/u5o9hDy72UI9DhdK/D7Zz
	 Smo4rI6uEVjh18UcWkrBmBnaITgDxeGm32J2CzJQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id ABDA8F805B2; Tue, 19 Dec 2023 12:32:20 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CD62FF8057E;
	Tue, 19 Dec 2023 12:32:18 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1CDB5F804DA; Tue, 19 Dec 2023 12:24:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2062b.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e88::62b])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A2315F800D2;
	Tue, 19 Dec 2023 12:24:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A2315F800D2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=eAb7MjKy
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MdvAQ2s2hvRlc9CDc/VX1pCCQVE7il+cIruEdUNyphq/ZeGVHgDdeBBzSfWzN6elCyt1v/0s57iqKre9UsAIc8qicURI/7YdTuGWAcicuvwUu2qWHmqWR1VookQOnGdtHGEmp8ndGAfaZSZJ0wGiTnKASouJPLLAJuOK8xdjWMsltDG70ndV4pXayzWGjLjF2p+qgTZIqZS5qCm3VbbDhL9HqD+nXmMYk4eV3DXfPe7ztjz1TMmkzO/Mqrj3L8pbhhDx5BfG+38CPE+okMQ0/Jwn3OXAtVHJd+TocLsQTErQZvaK6wtrhA4mujF4K/KzoW4gtHyBUwqNUgQ4r2nt0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C2FbWCdmt5+iDcoEXvI56ETEQOMnzw8gw1R8//Oy1Ik=;
 b=kWZQbzXKIbtpScvhyIdZaxds0skUWa/n621ZyIV4NpDKlrXI+MSdc5i5ZthU0RAXzUEZw/KpMxk82noZtO60WE0o09hAfwErgbWu5RUQqSiynh28xOFlCeldkvyQ2BH6HRSC0hx26s38Nw4b4kfwerSYrO1ycOGWDMdWIQ+HGat9oGj5n0mVd4FWFMkFewD0imOIWKTnNhbuubBdZdLrHj7kR8how8F9MfMwcG8pxOmRvNjQxt16Ldjunu1n3QLfPUn92S266z1XjapDEprVGK3kjrN83r4FV9kB6303ri/bP3YZTqIjHcW+EMx7Em4/DqPYrSJM4/fZ9c7GtpF+uQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C2FbWCdmt5+iDcoEXvI56ETEQOMnzw8gw1R8//Oy1Ik=;
 b=eAb7MjKyNBu0tEd6w9HoSteak863DpoJisjuVEGVOUI+Z99kzuA1+aTtsZR+Vk0w3KOd+UL+eyNUA7w9a09qiKAqAZau3v49Jb6x7xE5ceu3NxBD8YQ1xE0vxjAU7EqcFRO+jz+bQHz2BkM8svRYHYv7IN7wi7Nho41UUK7/usw=
Received: from DM6PR02CA0075.namprd02.prod.outlook.com (2603:10b6:5:1f4::16)
 by MN2PR12MB4503.namprd12.prod.outlook.com (2603:10b6:208:264::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.18; Tue, 19 Dec
 2023 11:24:41 +0000
Received: from DS1PEPF0001708E.namprd03.prod.outlook.com
 (2603:10b6:5:1f4:cafe::cb) by DM6PR02CA0075.outlook.office365.com
 (2603:10b6:5:1f4::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.38 via Frontend
 Transport; Tue, 19 Dec 2023 11:24:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DS1PEPF0001708E.mail.protection.outlook.com (10.167.17.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7113.14 via Frontend Transport; Tue, 19 Dec 2023 11:24:41 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Tue, 19 Dec
 2023 05:24:40 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Tue, 19 Dec
 2023 05:24:40 -0600
Received: from prasad-lnx-mach.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.34 via Frontend
 Transport; Tue, 19 Dec 2023 05:24:35 -0600
From: Venkata Prasad Potturu <venkataprasad.potturu@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
CC: <Vijendar.Mukunda@amd.com>, <Basavaraj.Hiregoudar@amd.com>,
	<Sunil-kumar.Dommati@amd.com>, <syed.sabakareem@amd.com>,
	<cristian.ciocaltea@collabora.com>, <emil.velikov@collabora.com>, "Venkata
 Prasad Potturu" <venkataprasad.potturu@amd.com>, Pierre-Louis Bossart
	<pierre-louis.bossart@linux.intel.com>, Liam Girdwood <lgirdwood@gmail.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, Bard Liao
	<yung-chuan.liao@linux.intel.com>, Ranjani Sridharan
	<ranjani.sridharan@linux.intel.com>, Daniel Baluta <daniel.baluta@nxp.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>, Jaroslav Kysela
	<perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, "moderated list:SOUND -
 SOUND OPEN FIRMWARE (SOF) DRIVERS" <sound-open-firmware@alsa-project.org>,
	"open list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
	<linux-sound@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Subject: [PATCH 4/5] ASoC: SOF: Rename amd_bt sof_dai_type
Date: Tue, 19 Dec 2023 16:54:12 +0530
Message-ID: <20231219112416.3334928-4-venkataprasad.potturu@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231219112416.3334928-1-venkataprasad.potturu@amd.com>
References: <20231219112416.3334928-1-venkataprasad.potturu@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0001708E:EE_|MN2PR12MB4503:EE_
X-MS-Office365-Filtering-Correlation-Id: 553ed143-afb6-4def-ff2f-08dc0085180e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	y9jOzOqI+CxfscJG7Qa0E4r9QlZhxi9yidSKx4Lrzs6YQH7RQiIoIFdmdUHH8efmG4Qmh+dtEYyOnQ8V3qV16qdcrOI0WnGb5wwb2i2mZ9sNruL3qIffIaW3fWbo8lNhoTT+eA75YHiKYLJMOCJU4lEhUGL7uV/AMyxtQGBeiD2VGUqAwsVbWNeLjiKcZBhqG4kUSK8vVcooAyMOh9NU9vvTKgnDefNUREwTmYMeq2mhnv9N7Wfg8snNFrosOyLbSE8k1yp+S3MoULV9UitdanbMUv054ViNkVjt79d5PR2r9fSbnXAitfphvonyPuHFgCPO6cxUco9Mh6d/yoQ/PvpQuZKfnREu2N9lkfXEXOOO0A51Dh2FVYvvuQIpqwNZ3zD+s8GjclGUwvktT3i8s7QjamchQvvCptiyNeeAPNEVx3fm8XcdAR1kDEbPIeYnZe4dR5A6c30lZH1a5tlHY5B/mFKw8+vQnmITL/mwtInENATKz3i3iCtBQqh9GHFPWnwvHPmw9bn/3RBf7bWdfeTh4ts+j7xhyOxERdmH+pCVHkAxo7xN6AFnkyubTLGqEzYPTb2dPdrBxLFhbmfANeKgtddVzC0lXbOkXXqCwlqivYLyWmNxKYWSanIwdJ5yc2deH1JDpZIfLW4sxkJfyFLIl3dCWGhAgeczD9Un8Po39UdbCTwTf+l+ISkVwM3tkR2gzSUaMx0P1c1nFHE2pjRkyL3haKFMDPusdjPgRUQvIj46+CSw+8r411yHyKs22/nVfUd28HX1Fiqsoijitg==
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(136003)(346002)(39860400002)(376002)(396003)(230922051799003)(1800799012)(451199024)(82310400011)(64100799003)(186009)(46966006)(40470700004)(36840700001)(4326008)(8936002)(8676002)(5660300002)(4744005)(2906002)(7416002)(6666004)(7696005)(478600001)(110136005)(70586007)(70206006)(54906003)(316002)(41300700001)(356005)(36860700001)(40480700001)(47076005)(86362001)(36756003)(81166007)(82740400003)(40460700003)(426003)(336012)(26005)(1076003)(2616005)(83380400001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2023 11:24:41.3272
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 553ed143-afb6-4def-ff2f-08dc0085180e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DS1PEPF0001708E.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4503
Message-ID-Hash: 2XJ7V7GTG4TXGO2W5JEBPJNSLUI4GVCU
X-Message-ID-Hash: 2XJ7V7GTG4TXGO2W5JEBPJNSLUI4GVCU
X-MailFrom: venkataprasad.potturu@amd.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2XJ7V7GTG4TXGO2W5JEBPJNSLUI4GVCU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Rename amd_bt sof_dai_type from ACP to ACP_BT.

Signed-off-by: Venkata Prasad Potturu <venkataprasad.potturu@amd.com>
---
 sound/soc/sof/topology.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/sof/topology.c b/sound/soc/sof/topology.c
index 66b271ca6910..617a225fff24 100644
--- a/sound/soc/sof/topology.c
+++ b/sound/soc/sof/topology.c
@@ -289,7 +289,7 @@ static const struct sof_dai_types sof_dais[] = {
 	{"ALH", SOF_DAI_INTEL_ALH},
 	{"SAI", SOF_DAI_IMX_SAI},
 	{"ESAI", SOF_DAI_IMX_ESAI},
-	{"ACP", SOF_DAI_AMD_BT},
+	{"ACPBT", SOF_DAI_AMD_BT},
 	{"ACPSP", SOF_DAI_AMD_SP},
 	{"ACPDMIC", SOF_DAI_AMD_DMIC},
 	{"ACPHS", SOF_DAI_AMD_HS},
-- 
2.25.1

