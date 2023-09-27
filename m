Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DD19D7AFBC8
	for <lists+alsa-devel@lfdr.de>; Wed, 27 Sep 2023 09:17:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4E2EDA4A;
	Wed, 27 Sep 2023 09:16:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4E2EDA4A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695799040;
	bh=ojq55Twh+Qp1LZZrTBHvRODD+qvSZCXTbxoEWCAjsqk=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=EfBuSBEVt80KvpQqq7Qe5JuP678Y9KjaGA2U92HgoFGIxXRRRGs56EKIj3fTfJmej
	 kqijHnFDwErRkOyWBQHw3TyonX0LyNGMivxrLdkFZB8V7VJErJD7pd+buXVHL9hwuB
	 GVlR6RE6492nOMvuoQj3WuqTkk4lztkkRUWuvOXw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D204BF8016A; Wed, 27 Sep 2023 09:16:09 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 55755F80166;
	Wed, 27 Sep 2023 09:16:09 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5D9E9F8016A; Wed, 27 Sep 2023 09:14:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2060f.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e89::60f])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4C72BF80130;
	Wed, 27 Sep 2023 09:14:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4C72BF80130
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=vjXLMRkz
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PaWdpuVQrvKTtgK3fBLfjdyzOpA9sBfIbRngU4MA/aRU/GX41Vo8Cy1qc+22LbCQh/lRbJ4OTDzudFjEZLxNgTbZg/AIxckgNE8WuJHTg9R5nj7SEa+7FC1iJVnXDK5iQBKyxhjv5Fn2LWojRSKZeSi+SKZJHzJr9ny6GoOQ83dhfVGk7vpdOxh28kHphpeloZY8wKgoQHqH11soMWTETTwXJ4wStYHtolSsO0Gs5oNqdiLWazNmW2u8I0WqLFk94h+z5D8+BeAbPU7FAR1oJpn5iOV01irKlr2bu0DA3hR+7ey6hZsMrI5rKImG0WXLSV/O6SmLT/xbXipnpxVeMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z39ULwv4yN57iwvVJrZDwb4432FUB3Jy1sTe9Rv9xgU=;
 b=gzNdKYOPsLUKZ2d0XqCoVR5sUmu2gwiP+j+ndUcDnPomAZocjkR5fWpA9ODH0Pk3BjdLcyxMHrq6yvbD9M3KF9q84lDA733rkUl5YWoegZtIfUYhsVi0TsWSlRcGM8Spjh6qf3LKRRmwA3MeozeUjfTqNjUMgdP1RLKCkdY211x8nDIi7GcwRGBbAQ09eOBcoyYeQUex8ncsJOJpby8Dl4CjDngUj6LqCbJr5oqCygu8DCDsSPqC/wWnZ5KKMbt/p4F3N4BasNtZJOmNCyTDlq1JL6sS+7WfOsjQmbGE6LBsXevoIafZ82mcCvHXzu1kPY9/ajGyZLG/hARK3nsoIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z39ULwv4yN57iwvVJrZDwb4432FUB3Jy1sTe9Rv9xgU=;
 b=vjXLMRkzUsJ1KtjT4t3YcNgEHSLFVQYbqPRHJpKEvsETX1BCMaxKmnHHAY32YHrK/C1ASc87dfQPqbt2IsbbWwNuI3n4JiBVACCe+GAZMMR7RXyOdTUAN4WPozWVwwu6FwoXMbrq6/1+zffjrTRLRodo+P8q5y+qZwL6VG/apOU=
Received: from MN2PR10CA0017.namprd10.prod.outlook.com (2603:10b6:208:120::30)
 by MW4PR12MB6753.namprd12.prod.outlook.com (2603:10b6:303:1ec::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.20; Wed, 27 Sep
 2023 07:14:24 +0000
Received: from MN1PEPF0000F0E2.namprd04.prod.outlook.com
 (2603:10b6:208:120:cafe::c0) by MN2PR10CA0017.outlook.office365.com
 (2603:10b6:208:120::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.35 via Frontend
 Transport; Wed, 27 Sep 2023 07:14:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MN1PEPF0000F0E2.mail.protection.outlook.com (10.167.242.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6838.14 via Frontend Transport; Wed, 27 Sep 2023 07:14:24 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 27 Sep
 2023 02:14:24 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 27 Sep
 2023 02:14:18 -0500
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27
 via Frontend Transport; Wed, 27 Sep 2023 02:14:13 -0500
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>
CC: <alsa-devel@alsa-project.org>, <Basavaraj.Hiregoudar@amd.com>,
	<Sunil-kumar.Dommati@amd.com>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
	coolstar <coolstarorganization@gmail.com>, Pierre-Louis Bossart
	<pierre-louis.bossart@linux.intel.com>, Liam Girdwood <lgirdwood@gmail.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, Bard Liao
	<yung-chuan.liao@linux.intel.com>, Ranjani Sridharan
	<ranjani.sridharan@linux.intel.com>, Daniel Baluta <daniel.baluta@nxp.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>, Jaroslav Kysela
	<perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Rander Wang
	<rander.wang@intel.com>, V sujith kumar Reddy <Vsujithkumar.Reddy@amd.com>,
	Venkata Prasad Potturu <venkataprasad.potturu@amd.com>, Ajit Kumar Pandey
	<AjitKumar.Pandey@amd.com>, "moderated list:SOUND - SOUND OPEN FIRMWARE (SOF)
 DRIVERS" <sound-open-firmware@alsa-project.org>, open list
	<linux-kernel@vger.kernel.org>
Subject: [PATCH] ASoC: SOF: amd: fix for firmware reload failure after
 playback
Date: Wed, 27 Sep 2023 12:44:10 +0530
Message-ID: <20230927071412.2416250-1-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0E2:EE_|MW4PR12MB6753:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e2c0bda-7fb4-452c-4107-08dbbf296101
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	dvOLNAI5WiW2LH/V2pbZw0byTRfa30GWcwSItVVcVuDGPt6Lq95xBHkCnjfSbYPAgHvdfMmpjK8JhkkqOUHe/XkFnKzY47wAf3ZcDyBm8Sgg0nsQFv3/Z7sgdkGeKc+YoOZdif5ZxxjFRb9BT7X4lkd3p+SW0FcL28Y0T/J9JHujZdZQ4Vc8sWZjF6wVt0/bGLXcoG+NsHyy2cYG5lkW23+rggA0z+/SVGZlHQumq/C4qdvYfPojUuh0CdAiAxdePXkrCHkwdy2wHooLbgyuPA7IqQIok41A538AAN+YXG5qVHxXDGgUfKrA6TukcA0VF4SLeMdoqR4ioBkgT+WZi3jndLrXkoWeCn2pXO+FuR3bbypWYqyPvl/+X+ChgW8URXCUnis2ZdnWrDxtMgUZWiGY6L913ozrgkcaCdDQ6vPaMl53yZifolMAYUwXJV6DDQtMyTJUHWB267yGbBpucGbAFAPUD8FsokuaF4ZHG+5u0pf6FzbOPMeVANFqt/mhb9/AgEKO1zAwsgfD2Hoo8LzCvfiWCxU0CD1y+8aAi1mxZGxYMc3RwH1lpmQH/sEkULDSTgLkrVHLsHvHpD/725W5QIEfGW8RO+LqgH30NezKTsY6+D1FYUwM4dna0/06idHzm7gmNxCyIVKrgfO2/yyp55VZcW6X950HaYq03LpR1t2LkUpxNvrowpK4IrGt7JATQ5M57ts6HM+tPrK5IZXVhPIeKFE/Fogc1RnuT0vK2Y+xO89iRRlYBZ8wTU6L7rld+xcJabpVu4ngzmcIuQ==
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(376002)(136003)(346002)(39860400002)(396003)(230922051799003)(82310400011)(186009)(451199024)(1800799009)(36840700001)(46966006)(40470700004)(40460700003)(82740400003)(966005)(336012)(2616005)(1076003)(426003)(40480700001)(478600001)(26005)(7696005)(356005)(81166007)(5660300002)(4326008)(8676002)(8936002)(54906003)(36756003)(36860700001)(47076005)(316002)(6916009)(41300700001)(86362001)(7416002)(2906002)(70206006)(70586007)(83380400001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2023 07:14:24.4624
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 1e2c0bda-7fb4-452c-4107-08dbbf296101
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	MN1PEPF0000F0E2.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6753
Message-ID-Hash: AK2WNHFMAPZEET6BS3K2CPY236K3KYKF
X-Message-ID-Hash: AK2WNHFMAPZEET6BS3K2CPY236K3KYKF
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/AK2WNHFMAPZEET6BS3K2CPY236K3KYKF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Setting ACP ACLK as clock source when ACP enters D0 state causing
firmware load failure as mentioned in below scenario.

- Load snd_sof_amd_rembrandt
- Play or Record audio
- Stop audio
- Unload snd_sof_amd_rembrandt
- Reload snd_sof_amd_rembrandt

If acp_clkmux_sel register field is set, then clock source will be
set to ACP ACLK when ACP enters D0 state.

During stream stop, if there is no active stream is running then
acp firmware will set the ACP ACLK value to zero.

When driver is reloaded and clock source is selected as ACP ACLK,
as ACP ACLK is programmed to zero, firmware loading will fail.

For RMB platform, remove the clock mux selection field so that
ACP will use internal clock source when ACP enters D0 state.

Fixes: 41cb85bc4b52 ("ASoC: SOF: amd: Add support for Rembrandt plaform.")
Reported-by: coolstar <coolstarorganization@gmail.com>
Closes: https://github.com/thesofproject/sof/issues/8137
Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 sound/soc/sof/amd/pci-rmb.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/sof/amd/pci-rmb.c b/sound/soc/sof/amd/pci-rmb.c
index 72e211b5f7a4..2f288545c426 100644
--- a/sound/soc/sof/amd/pci-rmb.c
+++ b/sound/soc/sof/amd/pci-rmb.c
@@ -35,7 +35,6 @@ static const struct sof_amd_acp_desc rembrandt_chip_info = {
 	.dsp_intr_base	= ACP6X_DSP_SW_INTR_BASE,
 	.sram_pte_offset = ACP6X_SRAM_PTE_OFFSET,
 	.hw_semaphore_offset = ACP6X_AXI2DAGB_SEM_0,
-	.acp_clkmux_sel = ACP6X_CLKMUX_SEL,
 	.fusion_dsp_offset = ACP6X_DSP_FUSION_RUNSTALL,
 	.probe_reg_offset = ACP6X_FUTURE_REG_ACLK_0,
 };
-- 
2.34.1

