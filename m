Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 436CB72BDC8
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Jun 2023 11:57:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2EE44847;
	Mon, 12 Jun 2023 11:56:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2EE44847
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686563864;
	bh=0rv1Y1zXeWwWc0yYkL9UadtjSomkDZm2Gt4MQdIMc9c=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=TC3eMHZuhmO4xlV1mhcNUMi+//8vbi2gPD/pDt//ksEIDBtP+BFUYxttYmPFvP/Vp
	 AZe8RHZAYTjYRJKLsDBCJnOmVypqrloomOoblZEsXhvRNWk/y6MDTmJKIWMSLuXTnK
	 yNQUAcRnL5eckdC1oKnCrKBlYQy//g5jMjfhIzgs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8B849F805BA; Mon, 12 Jun 2023 11:55:55 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4567CF805B4;
	Mon, 12 Jun 2023 11:55:55 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 556D9F805A1; Mon, 12 Jun 2023 11:55:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20604.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe5a::604])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DA071F80587
	for <alsa-devel@alsa-project.org>; Mon, 12 Jun 2023 11:55:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DA071F80587
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=SgGwjFpP
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mgYS4c8NFQmoAnhZ3LnEuyDnpkIDphMjdgfvdwoO6RY3Wr2gw3CxnfzxL9ev9X2YCphPaUZpny3OiPe7qOG9fcDOcGkFR08m21HSeD5ipkhZVKutV/WCj+q5N8C9VtZRAaPGHIbSWeFL951LmSAN3vodtpMb8ohH9pI3BlLCrn+/WeL6zI46QPh2X+iTYXdIVkGZXstZY9j4wj4TI06vHbiYg/I4v3tYwQZ9fwBLXMsaNYEB+3GTzafg8WL7MxlQ2t+B216y/X7VbysFS0rvixWQq5HtGs7zo0bnQrcie/RRQgV1q0y5fUnRqtQfPCFE7nplNk7w3+A2mibBdvVFfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lJPO76LeVbRLT6xdNfAEfol9vXoNWf/MqxjxFnE4yls=;
 b=gbEgbbwcqvEkTnk2/sRA3kAubLWuQBJDxFZwrYfPb/f/8DtPnT3aUn6IyGziSYeEwc7ur+5D4ndcemtQjxWlTE+9LaIRegybvJqHjvOCvcyaATHzme5h/dI4wgrlYyqQ8nH7axMo/CzNS/fUMxHhp5boZwwFsRv6bPCrURcOsUmU0+9NEnxV1XqJ420n/5Qhzj4zv9AUxd1c7cGGbjIfdkXz+c7IpjzCv23rW/+x+iA6FaqCMUMzdfWcWC35sUyrDYv4XBCWdpwtNvfLwBPIz4Y06e0BsUKhB/ZiKIC2Ci8XBg3qhd8C3cUN8zBwbpyPDdSDMNci3caxkCheA1jLBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lJPO76LeVbRLT6xdNfAEfol9vXoNWf/MqxjxFnE4yls=;
 b=SgGwjFpPR+Il4uQ8hiC9EF1v8DjPH9pGcOVCdCuqeSudgcGd88oSM9hnTax+X+FfFozv+t/daBTSvBVc80gb2nfui2ITdWcIycM6xR5/k2v8CacyOpZBjBsXmQBHjnnmJNQbRVvBUqVY8cMjRJv8ytJyyIL1CinBJA7TXLbBIgM=
Received: from MW4PR03CA0011.namprd03.prod.outlook.com (2603:10b6:303:8f::16)
 by SN7PR12MB6864.namprd12.prod.outlook.com (2603:10b6:806:263::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.32; Mon, 12 Jun
 2023 09:55:39 +0000
Received: from CO1NAM11FT076.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:8f:cafe::ed) by MW4PR03CA0011.outlook.office365.com
 (2603:10b6:303:8f::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.33 via Frontend
 Transport; Mon, 12 Jun 2023 09:55:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT076.mail.protection.outlook.com (10.13.174.152) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6455.23 via Frontend Transport; Mon, 12 Jun 2023 09:55:38 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Mon, 12 Jun
 2023 04:55:36 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.6; Mon, 12 Jun
 2023 02:55:36 -0700
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.23
 via Frontend Transport; Mon, 12 Jun 2023 04:55:32 -0500
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>
CC: <alsa-devel@alsa-project.org>, <pierre-louis.bossart@linux.intel.com>,
	<Basavaraj.Hiregoudar@amd.com>, <Sunil-kumar.Dommati@amd.com>,
	<Mastan.Katragadda@amd.com>, <Arungopal.kondaveeti@amd.com>,
	<mario.limonciello@amd.com>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
	Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, Syed Saba Kareem <Syed.SabaKareem@amd.com>,
	open list <linux-kernel@vger.kernel.org>
Subject: [PATCH V4 7/9] ASoC: amd: ps: enable SoundWire dma driver build
Date: Mon, 12 Jun 2023 15:29:01 +0530
Message-ID: <20230612095903.2113464-8-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230612095903.2113464-1-Vijendar.Mukunda@amd.com>
References: <20230612095903.2113464-1-Vijendar.Mukunda@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT076:EE_|SN7PR12MB6864:EE_
X-MS-Office365-Filtering-Correlation-Id: 63964890-a0a2-4fb6-bc3c-08db6b2b2ced
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	RWS0uzeXJfnXa/IDLvgidO2Doczv9YaJHZpvL1CUwl9TH1VfGwekbpR587Ibaqyb/nJMHpm5MnAp6F3aZ8dkQ+e0V/KM+8mtL1AhOMEwFjHKRlZBn1i6QwoSUXx+4yAx8QhgcDEEcFpudHUEwVp3ksyXgOterHiuRyxj0HPX9TPPCQHnDaMhMK2PmWVTRAtIachafCqi+vOjqceY12QRSd/OZubf/eFzZBCDI+ZZCFGPMviFOa5axcZ7ZvgFKqd4g1DRoy84tkrwLUANvVmTccypzBe3pKlXyd4MlR7TA8khR4w+SKjcfokvjybj1eLbxsFs5EzngP4COpWYkO1rFB7u9VULkLwg5lOauHa3chIJEZBg+M2LYa+ZL9nBYaliE9ag2t3cCYNMmkuL2ocxWZpzPG2ajMWCVMhDEicOxNz1GLVcVQ+2819gWFmOCFu6XtWrTLOGIeB2JrLojd3oRJPhty0v/n5eN8RfjJ1QryJlPFnUNC7mWNTF5Q4yXKUcybhzaay8MR3pGQxFdvsMpJMys/cq9YmYfDkdcMie65YdiZS/95rinoMOyjT0cF4gmIpqsewV+Y2K5ykblrESvsw1ALCOXkA3XkPrqE/8EcUkwRF35KP1ASr5cUn1Dh90teCcLdNNmdqxGYSq5EwYxbdBufAEpiuX5uEaelp+7yTYZe8juYOZlxe/PyiymaeuRw7ER45d9dy1M25UHwTM78UwxjIVRSXRA0cjim5L/A4zn8NglryCMZQo4acwSOYXZ9iS5GMhYv4S4IMNMs41Gg==
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(396003)(376002)(136003)(39860400002)(346002)(451199021)(40470700004)(36840700001)(46966006)(86362001)(5660300002)(4326008)(2906002)(4744005)(8936002)(6916009)(70586007)(70206006)(41300700001)(82310400005)(82740400003)(54906003)(8676002)(356005)(81166007)(316002)(478600001)(7696005)(40460700003)(6666004)(426003)(36860700001)(26005)(186003)(2616005)(36756003)(336012)(1076003)(40480700001)(47076005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2023 09:55:38.3038
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 63964890-a0a2-4fb6-bc3c-08db6b2b2ced
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CO1NAM11FT076.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6864
Message-ID-Hash: S7LGZHZ77QFQXN47GCP34XWRIBNU5LZA
X-Message-ID-Hash: S7LGZHZ77QFQXN47GCP34XWRIBNU5LZA
X-MailFrom: Vijendar.Mukunda@amd.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/S7LGZHZ77QFQXN47GCP34XWRIBNU5LZA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Enable SoundWire dma driver build for PS platform.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 sound/soc/amd/ps/Makefile | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/amd/ps/Makefile b/sound/soc/amd/ps/Makefile
index 383973a12f6a..f2a5eaf2fa4d 100644
--- a/sound/soc/amd/ps/Makefile
+++ b/sound/soc/amd/ps/Makefile
@@ -3,7 +3,9 @@
 snd-pci-ps-objs := pci-ps.o
 snd-ps-pdm-dma-objs := ps-pdm-dma.o
 snd-soc-ps-mach-objs := ps-mach.o
+snd-ps-sdw-dma-objs := ps-sdw-dma.o
 
 obj-$(CONFIG_SND_SOC_AMD_PS) += snd-pci-ps.o
 obj-$(CONFIG_SND_SOC_AMD_PS) += snd-ps-pdm-dma.o
+obj-$(CONFIG_SND_SOC_AMD_PS) += snd-ps-sdw-dma.o
 obj-$(CONFIG_SND_SOC_AMD_PS_MACH)   += snd-soc-ps-mach.o
-- 
2.34.1

