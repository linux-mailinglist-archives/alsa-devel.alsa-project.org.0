Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 103DF949F14
	for <lists+alsa-devel@lfdr.de>; Wed,  7 Aug 2024 07:22:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A22EE14E3;
	Wed,  7 Aug 2024 07:22:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A22EE14E3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1723008160;
	bh=IbvEYfxUpu8uJp6sM8KoJiMvrQ3grjF0UH/yg6pUjIk=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=QEzqeRJroDsUMv9lG3l54h+VEo9ljZeKE4lFOFf+MdgpGwOmQEZrICWKGGHMRvbOy
	 FSUBKiBMxtI7D9MJJ25ZzojctZmtxKnhCOKffsjRtPz2iTzg9SGSfRus9fE2Yo0qyj
	 hGVpyR6rLIKY1qvCZCT35zPwYYsnNUMRGfpsxS2g=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 85544F805A9; Wed,  7 Aug 2024 07:22:12 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CC041F805AF;
	Wed,  7 Aug 2024 07:22:11 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 05261F80448; Wed,  7 Aug 2024 07:14:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20621.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e88::621])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CF749F8023A;
	Wed,  7 Aug 2024 07:14:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CF749F8023A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=r4jxOMKm
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ogeY3tOrA0AY0LOT5qWK6T/viudwUz4r49M+doSsEBpK1DTm8hEPttDoH7AbBzPI/+PtyEPsO0Adc84546z0KAMZDL61xcgbHXcuUv/mfSY7sI+7lgfehxDJ9yKiwlzbEwsnz9BULipDZxSrDRahxzX9RoqqqPjGb4g0M60ymk3+64XbhFiRStTgleDKb5vsVQ3rq5ASWaCGKcAgsAVz9aGeZpkmov1gsI7YTG/DhltICIEy1YceTCxiRoY1CnkddjEC16G8mrpn4UoxsVPMlIQkn/kiGrJV4+Zxp8g7pg1/V0lcYfq5Dpj9WvZKr4tLXOj7/NXfV0gyZIPz9IKi6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RTVy/S40reH6dPiVHmQp8KHQmxDvKLVFHwzi2x1SwAE=;
 b=MV0o4z8KC0uF14CbXphXYBCcJeL0SkVfu3WpHTGIpZopJsyx5UpGwMpoxikQ61AniIarRf1W+pt4ysldqskjrops2792WDjAtV7n4OFao/bVSY2Wierjh68KioBy5ANMSVSe44XksS2qPBX3M+PPp53GxqcjoJNhDNzGXAzmblBu5Zz0SqITI5veVghEZHbowL/n7ifuQjxHXDMVl0fHGJjs5z9YKYAhIGt/bikS1zQzWffAy9Is1pv9O3qe74bXRMROzPmFSqKWY8ThDuCAbw8doAPQX1ujLINppDlw1u5HRyage2Mz21PtB+3ScgwyS8ghV+7Q66VIR/EgeSJ2eA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RTVy/S40reH6dPiVHmQp8KHQmxDvKLVFHwzi2x1SwAE=;
 b=r4jxOMKmS44aCjgXjlanbnbAZcpQRn7WccUw8RZ0lRbmzLT6H2LFnV1S6UuMh55wAQWPQslQgnMYAoxiizklLdr1YrsHP1K+yi5je36hIqCEwiQcNQ4m6Gn3KeSscR/WOWP5pLH9Zd8spUo4Ra1oRBllEU+6pjpHS7Q8wDZuDYc=
Received: from SJ0PR03CA0168.namprd03.prod.outlook.com (2603:10b6:a03:338::23)
 by MW6PR12MB8736.namprd12.prod.outlook.com (2603:10b6:303:244::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.29; Wed, 7 Aug
 2024 05:14:48 +0000
Received: from SJ5PEPF000001EA.namprd05.prod.outlook.com
 (2603:10b6:a03:338:cafe::49) by SJ0PR03CA0168.outlook.office365.com
 (2603:10b6:a03:338::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.34 via Frontend
 Transport; Wed, 7 Aug 2024 05:14:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF000001EA.mail.protection.outlook.com (10.167.242.198) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7849.8 via Frontend Transport; Wed, 7 Aug 2024 05:14:47 +0000
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 7 Aug 2024 00:14:41 -0500
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>
CC: <alsa-devel@alsa-project.org>, <Basavaraj.Hiregoudar@amd.com>,
	<Sunil-kumar.Dommati@amd.com>, <venkataprasad.potturu@amd.com>, "Vijendar
 Mukunda" <Vijendar.Mukunda@amd.com>, Ranjani Sridharan
	<ranjani.sridharan@linux.intel.com>, Pierre-Louis Bossart
	<pierre-louis.bossart@linux.intel.com>, Liam Girdwood <lgirdwood@gmail.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, Bard Liao
	<yung-chuan.liao@linux.intel.com>, Daniel Baluta <daniel.baluta@nxp.com>,
	"Kai Vehmanen" <kai.vehmanen@linux.intel.com>, Jaroslav Kysela
	<perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Cristian Ciocaltea
	<cristian.ciocaltea@collabora.com>, Emil Velikov
	<emil.velikov@collabora.com>, Krzysztof Kozlowski <krzk@kernel.org>, "Ajit
 Kumar Pandey" <AjitKumar.Pandey@amd.com>, "moderated list:SOUND - SOUND OPEN
 FIRMWARE (SOF) DRIVERS" <sound-open-firmware@alsa-project.org>, "open
 list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
	<linux-sound@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Subject: [PATCH 4/8] ASoC: SOF: amd: fix for acp init sequence
Date: Wed, 7 Aug 2024 10:43:16 +0530
Message-ID: <20240807051341.1616925-4-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240807051341.1616925-1-Vijendar.Mukunda@amd.com>
References: <20240807051341.1616925-1-Vijendar.Mukunda@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001EA:EE_|MW6PR12MB8736:EE_
X-MS-Office365-Filtering-Correlation-Id: ad08b38c-c3e0-4d04-0ca7-08dcb69fdba5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|7416014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?WaBr7zXNEun1y+BCI25f9ke+Vg6DMLKCb16zwVcI235cbSwG1byh7Lv3lpDc?=
 =?us-ascii?Q?mqeAeGXsiI6lYLmHzS4DqBEQ912I7soIXQXKeBLIUGlv5sDnY9FaH9spKLUh?=
 =?us-ascii?Q?TGKpn06cAHkZ/T1bals3DBCLhOLo2k7rnnl1Y6AU0Gfe6JSz8LQ+eEWNCrtz?=
 =?us-ascii?Q?9VsM7KmaeZ2WAkNfi7hNnduEtW1NlMo6cDKxJ/uk/+K7PZX0gQ27v3eaEG9n?=
 =?us-ascii?Q?r8vY0lTsDEmkr2aJvj+VGAe72NwMCkCIgO5ZtWfvRhFJBrnwcmQUOuI7kT0k?=
 =?us-ascii?Q?xxeJycmfVYa9lU1uww9DsPZsWhH54EKTODI27maCYnXixXEvG+WOdLzcFzO3?=
 =?us-ascii?Q?ktnKXleDeZAIzcPvFCbIHejyVjTMMcZxxkHfxxM93nwB23GTccAsVh/N9cOc?=
 =?us-ascii?Q?9ZZ9FHBp7ZPBdf27RONyCflOXRv3qCh+SYklGZe4ZqaXwhN2Q6ERG2CZ3UC/?=
 =?us-ascii?Q?XgMePqsbj3yD0PaczPeldQAWPuS2GCV4PXaXHbWsmh5q1NICYstYSjx9R9dt?=
 =?us-ascii?Q?mdxJBRqNmAO25Ah6OMU5tOB2BwE5mBquLEP3pG6jYa9PPpio9XH7QcrbWAtc?=
 =?us-ascii?Q?kyDPqSgqFFh+9CSSXAUS5egQQPvKlR1mhnGaHVIQ6KOp4RdLVQF2Id1JGEPj?=
 =?us-ascii?Q?/qnOemKblCmr9F2DZ4Gp+ifAqZrgboXJwemcl0y8jHb7/KyhEzAnT1RyurY2?=
 =?us-ascii?Q?zgwyaNUbFTUOkdXxPaSTHnVmFGYmdYQBc8P5b1w1rkwvew/WyzDyN0t47Acx?=
 =?us-ascii?Q?Xdcy9vkqdhvCwYQzTuMg4VEM7p/e1QjE/xmHc7VPdvjrbCQeqtEnLku2VAFR?=
 =?us-ascii?Q?2v2F3E7kUxIeh1Y+84VwDhrpiU8aOkGwg+IVK7WRhW2ALy6YMhTA4bAbNSLj?=
 =?us-ascii?Q?ZP64yBTTzfngAb2Tz/oPabc3xNitk/lvo/YwW33i8E+SD+7/ivCi69joU5w9?=
 =?us-ascii?Q?C9aZMAvFilssOnydqsMDmGugj532ULW384Cbv1wcmHMp7QaarfHcSw0eN9si?=
 =?us-ascii?Q?ZRTFuPiNiSkowCtXlIaXfhJc9t3QWJCzasUKopjKm/eL3k3/X5ZjX+nQOxml?=
 =?us-ascii?Q?Yw/+3Q9TV7Ko88Z9XisU3REpURgWwI1osPrtL9wyp1wkRZ1niy/O2XeAILXD?=
 =?us-ascii?Q?SCQjO5/634JoscRAU3E2hhDmf4c2EpUIdoCnhV0Bln3xtANa1Z4mLXLNsXXc?=
 =?us-ascii?Q?x7yGuiH/2qbk19Q0GoDyCcY27S1ayQgCAoTKoe1AcrEZ93iQOnnIH/7JSY8H?=
 =?us-ascii?Q?nuKdeoQmI2QfhFRlLr00RJT2+G4dqTaS/fx4F8iVY4karcBSrm1L+NA4Yx03?=
 =?us-ascii?Q?1c28iwHrXJnVZfpS3eUcwVfeVaDyi4Hu1fjj5VhRyYh9JBFvBAzZJWG21q3p?=
 =?us-ascii?Q?SvfC2AKskfPPLZqgR+fbXsVCc4TdJ53NSznnNEYkUa3pjO9outaHO4kN3T4P?=
 =?us-ascii?Q?te+Kn69MZ4pqRr4afXIdG/pcpOrNLiXs?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2024 05:14:47.9443
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 ad08b38c-c3e0-4d04-0ca7-08dcb69fdba5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ5PEPF000001EA.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8736
Message-ID-Hash: R7DXG2JRFHC3JFQY3JI62BREMM2P22GV
X-Message-ID-Hash: R7DXG2JRFHC3JFQY3JI62BREMM2P22GV
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/R7DXG2JRFHC3JFQY3JI62BREMM2P22GV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

When ACP is not powered on by default, acp power on sequence explicitly
invoked by programming pgfsm control mask. Update ACP pgfsm control mask
and status mask based on ACP variant.

Fixes: 846aef1d7cc0 ("ASoC: SOF: amd: Add Renoir ACP HW support")
Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/amd/acp.c | 21 +++++++++++++++++++--
 sound/soc/sof/amd/acp.h |  7 +++++--
 2 files changed, 24 insertions(+), 4 deletions(-)

diff --git a/sound/soc/sof/amd/acp.c b/sound/soc/sof/amd/acp.c
index d0ba641ba28c..a9f32983b3af 100644
--- a/sound/soc/sof/amd/acp.c
+++ b/sound/soc/sof/amd/acp.c
@@ -430,8 +430,10 @@ static irqreturn_t acp_irq_handler(int irq, void *dev_id)
 static int acp_power_on(struct snd_sof_dev *sdev)
 {
 	const struct sof_amd_acp_desc *desc = get_chip_info(sdev->pdata);
+	struct acp_dev_data *adata = sdev->pdata->hw_pdata;
 	unsigned int base = desc->pgfsm_base;
 	unsigned int val;
+	unsigned int acp_pgfsm_status_mask, acp_pgfsm_cntl_mask;
 	int ret;
 
 	val = snd_sof_dsp_read(sdev, ACP_DSP_BAR, base + PGFSM_STATUS_OFFSET);
@@ -439,9 +441,24 @@ static int acp_power_on(struct snd_sof_dev *sdev)
 	if (val == ACP_POWERED_ON)
 		return 0;
 
-	if (val & ACP_PGFSM_STATUS_MASK)
+	switch (adata->pci_rev) {
+	case ACP_RN_PCI_ID:
+	case ACP_VANGOGH_PCI_ID:
+		acp_pgfsm_status_mask = ACP3X_PGFSM_STATUS_MASK;
+		acp_pgfsm_cntl_mask = ACP3X_PGFSM_CNTL_POWER_ON_MASK;
+		break;
+	case ACP_RMB_PCI_ID:
+	case ACP63_PCI_ID:
+		acp_pgfsm_status_mask = ACP6X_PGFSM_STATUS_MASK;
+		acp_pgfsm_cntl_mask = ACP6X_PGFSM_CNTL_POWER_ON_MASK;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	if (val & acp_pgfsm_status_mask)
 		snd_sof_dsp_write(sdev, ACP_DSP_BAR, base + PGFSM_CONTROL_OFFSET,
-				  ACP_PGFSM_CNTL_POWER_ON_MASK);
+				  acp_pgfsm_cntl_mask);
 
 	ret = snd_sof_dsp_read_poll_timeout(sdev, ACP_DSP_BAR, base + PGFSM_STATUS_OFFSET, val,
 					    !val, ACP_REG_POLL_INTERVAL, ACP_REG_POLL_TIMEOUT_US);
diff --git a/sound/soc/sof/amd/acp.h b/sound/soc/sof/amd/acp.h
index f6f0fcfeb691..321c40cc6d50 100644
--- a/sound/soc/sof/amd/acp.h
+++ b/sound/soc/sof/amd/acp.h
@@ -25,8 +25,11 @@
 #define ACP_REG_POLL_TIMEOUT_US                 2000
 #define ACP_DMA_COMPLETE_TIMEOUT_US		5000
 
-#define ACP_PGFSM_CNTL_POWER_ON_MASK		0x01
-#define ACP_PGFSM_STATUS_MASK			0x03
+#define ACP3X_PGFSM_CNTL_POWER_ON_MASK		0x01
+#define ACP3X_PGFSM_STATUS_MASK			0x03
+#define ACP6X_PGFSM_CNTL_POWER_ON_MASK		0x07
+#define ACP6X_PGFSM_STATUS_MASK			0x0F
+
 #define ACP_POWERED_ON				0x00
 #define ACP_ASSERT_RESET			0x01
 #define ACP_RELEASE_RESET			0x00
-- 
2.34.1

