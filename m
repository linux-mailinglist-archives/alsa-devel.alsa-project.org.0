Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E8C27851DB
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Aug 2023 09:43:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9E76583E;
	Wed, 23 Aug 2023 09:42:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9E76583E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692776626;
	bh=nMTtlPJ2SWB4vG5HzFhs8lWQIRa0Tt+bOIZN6DwaEXc=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=F+0Ngfk5JqfbuG2XCQMcCXKCaWIV9OG8hxeDaTOMgmof6GR1LscKsV5ROSkNd8Nd8
	 kLCLXNuHfel3jTPxnOcZ7DsbKF8MUFe7oARtupicSztzBRer17q2llHmKO6OO0AFG4
	 gpml01HAr0elXm/NxEcxJAH3bTpwHT+ykJRNWgTY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6D03CF800D1; Wed, 23 Aug 2023 09:42:55 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8A946F800F5;
	Wed, 23 Aug 2023 09:42:51 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 10F37F80158; Wed, 23 Aug 2023 09:27:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20615.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e8a::615])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 84AC8F800F5;
	Wed, 23 Aug 2023 09:27:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 84AC8F800F5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=axA1juUW
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HqScS92G7V+RjWGXv2XXV97lGB8pKhXM/mdLc9qA5Ulk0LO+heLjDL5iZ8JOXaZM37fpV4uZdAtB6Qy3lQbrT8UxPykeVKrn9/mspAk0BivjDOEI2cMXj/r8Dostbh1jTSC0HlAg4b5R6Z5ynCgRrPNmEzUT7+5CDJ8W5V5Ht00vOzgWv7B1WLYmieZEG8lI7PJObD/ljPfrApfhREzu7KyVArN3kSXH6uETQVZ3JjK7HUNM4bES72cdZF/Kban93e3R2z6unZ85AjOWdd7Kx39t8RZOBNZqeWkuTEwaqwwOmzloYv210BL64VKWlzz3tf3uPmPJUybpEybBEMvEQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cA/a8B5QHiscWxlk6kSBSn1FQkZ3Bib5mLSeCksjWzY=;
 b=oZo45VLSNtRf9QBtmLHbh3bnV7i2+D9lemtKVzzkq7t16gzGKNz3pIyTZJW0kwneiPSEBiNRim3Mz2bYjumOgjG8yiQiv9dfABaDMc2Ux3v2HE2bGMrXElkdBc9g7uic4uP0cumZteJwwpn5BUiRANRwJFItV7ww8r8sTgmrA4+QuwSa8VLsK4OSCJ0jFSixoUBtn9FOA4NOhnr0kFET2yLP8gmwd0zZ2aEO5wEf1l5eV70Rvueijdr4VIommAsaNpaVnfe+Bvwrswt6BTqLAloZCG7++4ARZc/nlTBJsUr8YSbPDKaZP4Tcne6ti6CCb2pjb1LYwoZGFd//0KNm2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cA/a8B5QHiscWxlk6kSBSn1FQkZ3Bib5mLSeCksjWzY=;
 b=axA1juUWUHXBKdDfBRJf8inVw6JxNQunjwQ7r/gqkqlTvke6LWH5aNp0KnS2gvbqJI3ImqimxC0fPVmXU3yDBHwdhXQqIGeIuIzH2airgGBCokBBnOkp4XvTvuxq4pLbsqvwxGubDdPn20O4mHGgl8aCF2Y9luqUcmfd3PIAsfw=
Received: from SA0PR11CA0100.namprd11.prod.outlook.com (2603:10b6:806:d1::15)
 by CH2PR12MB4294.namprd12.prod.outlook.com (2603:10b6:610:a9::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.26; Wed, 23 Aug
 2023 07:27:24 +0000
Received: from SN1PEPF000252A3.namprd05.prod.outlook.com
 (2603:10b6:806:d1:cafe::d0) by SA0PR11CA0100.outlook.office365.com
 (2603:10b6:806:d1::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.20 via Frontend
 Transport; Wed, 23 Aug 2023 07:27:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF000252A3.mail.protection.outlook.com (10.167.242.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6699.14 via Frontend Transport; Wed, 23 Aug 2023 07:27:24 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 23 Aug
 2023 02:27:22 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 23 Aug
 2023 02:27:22 -0500
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27
 via Frontend Transport; Wed, 23 Aug 2023 02:27:17 -0500
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
	<Vsujithkumar.Reddy@amd.com>, Venkata Prasad Potturu
	<venkataprasad.potturu@amd.com>, Mastan Katragadda
	<Mastan.Katragadda@amd.com>, Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>,
	"moderated list:SOUND - SOUND OPEN FIRMWARE (SOF) DRIVERS"
	<sound-open-firmware@alsa-project.org>, open list
	<linux-kernel@vger.kernel.org>
Subject: [PATCH 2/7] ASoC: SOF: amd: enable ACP external global interrupt
Date: Wed, 23 Aug 2023 13:03:34 +0530
Message-ID: <20230823073340.2829821-2-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230823073340.2829821-1-Vijendar.Mukunda@amd.com>
References: <20230823073340.2829821-1-Vijendar.Mukunda@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000252A3:EE_|CH2PR12MB4294:EE_
X-MS-Office365-Filtering-Correlation-Id: f8368a7c-a5a0-4fe1-6666-08dba3aa6577
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	izO9kYVQ/ljtSYm+rwpcKPTmYn/RXuwsVnE5faBKLREJn1b434LeKXhRtMKDYYHRBPWB8aqP9vqw9xfojZCj712MuIxXyd/M5dhlg0IBXsNaapx7DdcQHD0crYI82PqILXaPpijTErQfsCLueZeRzmLkPxfTxpbXxu/Xzkq0DR/zLN5CfUMVgBpIIgF/WjBNzFEusdFR4rmSjQ5NzmpO/WG5RXB+U4xPbJm61uFEabX3juY8pXtozM+3UGaW6CkHqwQsE9EMtwQ38dVgI/5pNT6l1kTDTZNFC1Va+QTlnbekYzS95RFNN7QOzVRsFGe5OTHyXBgZ/aDnDM8L/Rk6Izt+JhpQx5bWY0sN+XSERYHg4yg/YQHoPQ0YRymiE8hzk8vZKglSp9CiWTs888Px52NyOafOSBQLsl3lLp2kSoOe3yyfVlKOKP9U/5F1kHFIsSQanBS8zU8Z9t+GVkp2dv0QNosOGku+C9mUFW8/YpvgUs1DUftpdYoMHnmCZX3dgd4BCH6O6ebisBtTg8CgRBah1wrhc+tki+jETLhF0XyNCYHLgnhUSFMIkMCtq3M2lj3c6FPYThrMMudJ7s3fcsu0EjkGLKYKJ5iobeFc7RvTyTLGyGl58vCQAy1UvxhvBmhqWp8ZR/ZUFPVuCUJvl4BbNxL/KxYIp7jqcO79DIrsKvZiPqaSOGkxPBpFk3qxcYXteARIwi18nQh28lZIdAW8C0h38G2zjs2COhi/AOjZAUQlmB1yPfD7Caec3G12zQSzfBnnJAHrHStf+a6ooQ==
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(396003)(346002)(136003)(376002)(39860400002)(186009)(451199024)(1800799009)(82310400011)(40470700004)(46966006)(36840700001)(2616005)(7696005)(316002)(6916009)(4326008)(8676002)(8936002)(70206006)(54906003)(70586007)(40480700001)(41300700001)(426003)(336012)(7416002)(26005)(1076003)(5660300002)(6666004)(478600001)(83380400001)(40460700003)(47076005)(36860700001)(36756003)(86362001)(2906002)(82740400003)(356005)(81166007)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2023 07:27:24.4523
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 f8368a7c-a5a0-4fe1-6666-08dba3aa6577
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SN1PEPF000252A3.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4294
Message-ID-Hash: CZ72S7EURT24YBQ2PHIVMUTKUCLGH7B4
X-Message-ID-Hash: CZ72S7EURT24YBQ2PHIVMUTKUCLGH7B4
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CZ72S7EURT24YBQ2PHIVMUTKUCLGH7B4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Previously ACP SOF firmware used to enable the ACP external
global interrupt register.
This will restrict to report ACP host interrupts only after
firmware loading is successful.
This register needs to be set from host driver to handle
other ACP interrupts(SoundWire Interrupts) before loading
the ACP firmware.

Add field for external interrupt enable register in acp descriptor
structure and enable the external interrupt enable register.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 sound/soc/sof/amd/acp.c | 3 +++
 sound/soc/sof/amd/acp.h | 1 +
 2 files changed, 4 insertions(+)

diff --git a/sound/soc/sof/amd/acp.c b/sound/soc/sof/amd/acp.c
index 630c2c5fe4c7..651b56388cb6 100644
--- a/sound/soc/sof/amd/acp.c
+++ b/sound/soc/sof/amd/acp.c
@@ -420,6 +420,9 @@ static int acp_reset(struct snd_sof_dev *sdev)
 		dev_err(sdev->dev, "timeout in releasing reset\n");
 
 	snd_sof_dsp_write(sdev, ACP_DSP_BAR, desc->acp_clkmux_sel, ACP_CLOCK_ACLK);
+	if (desc->ext_intr_enb)
+		snd_sof_dsp_write(sdev, ACP_DSP_BAR, desc->ext_intr_enb, 0x01);
+
 	return ret;
 }
 
diff --git a/sound/soc/sof/amd/acp.h b/sound/soc/sof/amd/acp.h
index 19cad4fcf99a..97bcada822ef 100644
--- a/sound/soc/sof/amd/acp.h
+++ b/sound/soc/sof/amd/acp.h
@@ -174,6 +174,7 @@ struct sof_amd_acp_desc {
 	const char *name;
 	unsigned int host_bridge_id;
 	u32 pgfsm_base;
+	u32 ext_intr_enb;
 	u32 ext_intr_stat;
 	u32 dsp_intr_base;
 	u32 sram_pte_offset;
-- 
2.34.1

