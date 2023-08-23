Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E21B7785216
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Aug 2023 09:56:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6A45A84A;
	Wed, 23 Aug 2023 09:55:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6A45A84A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692777389;
	bh=W1S9kIWC4lPbNEHicVckaPJ4D33uFF0C65zsWAlCVNM=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=NfWpTaHbjzqSxTs7kP0sDoIXi2a1ll3FtU827JGcJW1z2qJMLv5J0MpcP1lyYFQ/D
	 hHU+aHCTNLKPafL+KWFAhnlq1MTSrZKxqof90sNQvCVO9/z9LcdYnRLkWUoZJFUq4/
	 YOXmuzimV+XJeJbda9KaFq1qWzBofI6QMMe4s+fU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D4630F8023B; Wed, 23 Aug 2023 09:55:21 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BB0F7F8023B;
	Wed, 23 Aug 2023 09:55:20 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 75E4CF80158; Wed, 23 Aug 2023 09:28:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20630.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e88::630])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0AC24F800F5;
	Wed, 23 Aug 2023 09:28:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0AC24F800F5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=MyPlsjSe
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z3KbV3/V4ULEX/kYRDl5HZjqwELpai+/rWkhAewAjxaT5LV1NW9NjvjZF4vAa8hF6DtF2zW6Ed5klO6AZwnuBAWjNCQa2DHlbeLgj3uxkXvHhDUNHd2ExNAwsix9DnZeg1ZnHLriRJ5gRFLocJ3kFrWBvMu7Mh1JKwG56nUwCDhR1Y+pfcf9rJ6He4kEWU4vN+0E8d4HcL3LKtrQl8keu/PnMciNsc2qobvm9cDrqLtXbepBkRikXBr+YUwenmCGBKAGDfBUAbg5JsTXeCf7ddVGPlbaV2UJB3iZGZt64o77dD7/wJR7OmxyRqaknYicdYMI1cJ9d5+ZTi7GlqSoLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yDo9M4ul4W+hTzjpD/UJbL0UIwNiL853glISzJ+SZW8=;
 b=J4FGY5iP5Kd8wLDkpA9VVvami+5h1fQ4xWZ55EX0wWLYKo+cXN3NIdq00ZQDMp3R78LxKcvSOY8yTfvtnl1aN5C+F9Db0Lxtx2zEZmSjeZ5BMT+yofN8kejWmFbk08z7tanl2JF55rluYnbV2w22VWzoqxXJpZTe7jwVqppRHd9wkrim/I6b9Gkz5cju1ZFJPJqJuXgacjDPEJMGWl5jORxetDQpA6ftfjHLSqHeUWphNuizPggiWcLabR85MBEc9Sz/2SkjTh0+jAVTuTTI2tNFfP2NM31UStcxNhA3zJIi4gy9bUxCXBaxbOTRB4Dl6u2EB8gQdwlHq6h/6SMbKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yDo9M4ul4W+hTzjpD/UJbL0UIwNiL853glISzJ+SZW8=;
 b=MyPlsjSe/1LtgOiNhya58ZRenCAVx+K7i/Us80rHECIAyOAJPY9H11ujhyQ4YUN3I/WgXJjyOpKRDJWeomt7exJKTsxUm03WrFei8dDwnbEODWrW4pIknJFvHkRCKjiTf9LFgh8e/5SWYmBC77PeQq6nj2XEIsaoAU42jctj9xc=
Received: from SA9PR13CA0128.namprd13.prod.outlook.com (2603:10b6:806:27::13)
 by DM4PR12MB5391.namprd12.prod.outlook.com (2603:10b6:5:39a::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.26; Wed, 23 Aug
 2023 07:28:17 +0000
Received: from SN1PEPF000252A1.namprd05.prod.outlook.com
 (2603:10b6:806:27:cafe::30) by SA9PR13CA0128.outlook.office365.com
 (2603:10b6:806:27::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6723.15 via Frontend
 Transport; Wed, 23 Aug 2023 07:28:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF000252A1.mail.protection.outlook.com (10.167.242.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6699.14 via Frontend Transport; Wed, 23 Aug 2023 07:28:16 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 23 Aug
 2023 02:28:16 -0500
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27
 via Frontend Transport; Wed, 23 Aug 2023 02:28:10 -0500
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>
CC: <alsa-devel@alsa-project.org>, <Basavaraj.Hiregoudar@amd.com>,
	<Sunil-kumar.Dommati@amd.com>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, Liam Girdwood
	<lgirdwood@gmail.com>, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, "Bard
 Liao" <yung-chuan.liao@linux.intel.com>, Ranjani Sridharan
	<ranjani.sridharan@linux.intel.com>, Daniel Baluta <daniel.baluta@nxp.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>, Jaroslav Kysela
	<perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, V sujith kumar Reddy
	<Vsujithkumar.Reddy@amd.com>, Iuliana Prodan <iuliana.prodan@nxp.com>, "Ajit
 Kumar Pandey" <AjitKumar.Pandey@amd.com>, Venkata Prasad Potturu
	<venkataprasad.potturu@amd.com>, "moderated list:SOUND - SOUND OPEN FIRMWARE
 (SOF) DRIVERS" <sound-open-firmware@alsa-project.org>, open list
	<linux-kernel@vger.kernel.org>
Subject: [PATCH 6/7] ASoC: SOF: amd: clear panic mask status when panic occurs
Date: Wed, 23 Aug 2023 13:03:38 +0530
Message-ID: <20230823073340.2829821-6-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230823073340.2829821-1-Vijendar.Mukunda@amd.com>
References: <20230823073340.2829821-1-Vijendar.Mukunda@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000252A1:EE_|DM4PR12MB5391:EE_
X-MS-Office365-Filtering-Correlation-Id: 1bd486e4-65e3-46d2-9192-08dba3aa84a9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	KqF6Z416FtkWnHkl7aPtxjXaC1bTG1DmO0NHX+sY0INbb+/53JQSTiqY2I2tmmMFxAr5KF0h3TDLRJSVDNRNa4+5mzOYFNeT0tWNyE/7+08SUfyRkL01+bkz89oRR9cKIgXJiDaq3S3swwbew/D3hmo9HdzMhXfkjRPdFeQmBZr6e+Kq07vFqA6Xepb3/V2oZYMORvlvzjn/cPe9z9UCDCDwZKidrot3VTZFhJNuU2DWMTmjCj7+a6oCy2bpuazLfUpb6aDsXURuPmo/mMCcRo3/IoNsNJe/YgmUO48urf/fdWYu0LArJLK79vbyrN6+hV1BVUdVrmAN2nhsCCAajBO6SHfZgQP4VbNdda3KaX6ssJjCnnxuMx9LM/OuhlXFyuGmgnJ6q2ZDz30J2wPDi7OhCSINmXjS/FinG7DIZUCTyBFYK5vSp/J8P5wWPaDXKB0yd6qpXEdjI+GPy3oT3GQFYU6hDsd32Y8mCgXPzruSBdTmeS6P+oW5AG3bQjrTDKWHTmVaeliHHEQMPuYax6uCr5ejFy4qo9OOITcFiZ0ANPBuHe0d/IZNX0GHX4yjmzUXNVJClJnvgZz2e9YLbJ312nM294vl1tQE85prnv0G63OoAO6fl7XngQXcy+AQUFES4Uu9HUrQ2LfNuskiZ+se1H+nKnsiNT3j6IQciwV2LfyfMi/e6kO0Mt/4aaDMC1HA16aaGXRSmNUbe307etqAKME5z2TAk6nRAZ01LV6JBZpo6LNG/pVggQd2LjJkmbtzaneIXdpHNiqow2SpCQ==
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(346002)(136003)(396003)(376002)(39860400002)(1800799009)(82310400011)(186009)(451199024)(40470700004)(46966006)(36840700001)(47076005)(40460700003)(36860700001)(83380400001)(2906002)(356005)(81166007)(82740400003)(36756003)(86362001)(40480700001)(41300700001)(54906003)(70206006)(70586007)(7696005)(316002)(6916009)(2616005)(4326008)(8676002)(8936002)(478600001)(6666004)(26005)(1076003)(7416002)(5660300002)(426003)(336012)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2023 07:28:16.7749
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 1bd486e4-65e3-46d2-9192-08dba3aa84a9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SN1PEPF000252A1.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5391
Message-ID-Hash: ZYW5BY55MNHC2MPI2UWH6UE2TKL3ZLCU
X-Message-ID-Hash: ZYW5BY55MNHC2MPI2UWH6UE2TKL3ZLCU
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZYW5BY55MNHC2MPI2UWH6UE2TKL3ZLCU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Due to scratch memory persistence, Once the DSP panic is reported, need to
clear the panic mask after handling DSP panic. Otherwise, It results in DSP
panic on next reboot.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 sound/soc/sof/amd/acp-ipc.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/soc/sof/amd/acp-ipc.c b/sound/soc/sof/amd/acp-ipc.c
index 81a2c096a185..fcb54f545fea 100644
--- a/sound/soc/sof/amd/acp-ipc.c
+++ b/sound/soc/sof/amd/acp-ipc.c
@@ -170,6 +170,8 @@ irqreturn_t acp_sof_ipc_irq_thread(int irq, void *context)
 		if ((status & SOF_IPC_PANIC_MAGIC_MASK) == SOF_IPC_PANIC_MAGIC) {
 			snd_sof_dsp_panic(sdev, sdev->dsp_box.offset + sizeof(status),
 					  true);
+			status = 0;
+			acp_mailbox_write(sdev, sdev->dsp_box.offset, &status, sizeof(status));
 			return IRQ_HANDLED;
 		}
 		snd_sof_ipc_msgs_rx(sdev);
@@ -199,6 +201,8 @@ irqreturn_t acp_sof_ipc_irq_thread(int irq, void *context)
 	acp_mailbox_read(sdev, sdev->debug_box.offset, &status, sizeof(u32));
 	if ((status & SOF_IPC_PANIC_MAGIC_MASK) == SOF_IPC_PANIC_MAGIC) {
 		snd_sof_dsp_panic(sdev, sdev->dsp_oops_offset, true);
+		status = 0;
+		acp_mailbox_write(sdev, sdev->debug_box.offset, &status, sizeof(status));
 		return IRQ_HANDLED;
 	}
 
-- 
2.34.1

