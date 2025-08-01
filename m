Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 17ADCB17CEE
	for <lists+alsa-devel@lfdr.de>; Fri,  1 Aug 2025 08:30:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9955860256;
	Fri,  1 Aug 2025 08:29:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9955860256
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1754029800;
	bh=A7U+4IyJ/MC1DHsH3tOwDVh047gb02+E/fyQYpwBSXk=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=SD6SywW406ialNYjX62CmeEWHAbx942e4fCRAYq+oOdG/0+m2RJmN+ce1n/JBBHJJ
	 G1/8soevVXa9SJ9qdydSfrEDsiux9eawZ5MtCjegTyrMGXPB8bYQaZIqKBsAlB8tsp
	 8jcXklKtAFQIVJMSzMT+mhoKwAkIHngx870trZAU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B316BF805C3; Fri,  1 Aug 2025 08:29:24 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8520CF805C6;
	Fri,  1 Aug 2025 08:29:24 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0884EF80518; Fri,  1 Aug 2025 08:22:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_PASS,SPF_PASS shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2088.outbound.protection.outlook.com [40.107.96.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3ED9CF8012A
	for <alsa-devel@alsa-project.org>; Fri,  1 Aug 2025 08:22:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3ED9CF8012A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=nysIcWDY
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ryLpeQeBkyp7uQjxVOEncsjNLV9T8j1eegXH0ZsfFjtsKBbts9czFKoFUJFqltG3HO6xI/Oq9V6H8bY8BfEHqv6JpCd5qheLlQ6eh14S/4bazWzlL3KQoopaWgqeDfC6XUE8n5w0b3fKIx+cTxc4E/dKb+xqtd7vC5CbR40jZLq+DsVBqIzOU3DaCT4F19MxsNoBN7yFBrn1AEdC5A9BwR5CsWTSCmsi/nmn25wmBEFF5Y6vlGb5Dmnb2T3m5sT3POKwD0z5XKH2dVGdUqN2SrvitoaOyCwCrZKxFw5y+fi8WTiAhP8dkOV52xsMjxo/4HCEYwgMzyHgtsMFkcp9Vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2QqpTK6r/xM7SR4QPdFyz4qFol9C9BT+PkuHGmI5nMQ=;
 b=vk3gG+EeGCZ9wQQevF3rayNbJWBJ2pW+8UM/a/Opx4EfxNibaobINhRh5zbWUnIZVG9JTJTNrwXFPG0L6t9f0jCsxqRCONUWZmuR7dmAwxVfK9YKGIe93iEo6Ne7PYyTLPEhm2wGXJWzKJjZiFkCA3L9/S9QcUiIIXGFwB3HPgMy7Dh8N8k2iyVu8v52r4s9nlsJmmwcEbouaO7OQkG7busXHoe9Mxr0sx385inUEEBtii3gnszFB188UgFMkHJyCaCM2s4SlGJWduGP7U643AxxVO4fMUTZoSmdOON5dqkk5Q2plucqhW2jmV7WOb1Y9N+JwLxvKs3IXthcAzzfXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2QqpTK6r/xM7SR4QPdFyz4qFol9C9BT+PkuHGmI5nMQ=;
 b=nysIcWDYBLjnxwZZJD9cguk+Y7snxolW49x7U+i9ckLu/TAgmZmAhFAmwsL/GZbQfiFp4xE9GDbBP2r+7pxxGfiyfrZMWHlqq4NbZyxo/9Fr+IpOyZKDXd5Gd7y0rQENUUt6/GvrpBSvnP3XJsNBYEqpxy7h0XGEhsLFmq3lNpI=
Received: from CH5PR02CA0003.namprd02.prod.outlook.com (2603:10b6:610:1ed::23)
 by DS0PR12MB9057.namprd12.prod.outlook.com (2603:10b6:8:c7::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Fri, 1 Aug
 2025 06:22:27 +0000
Received: from DS2PEPF00003445.namprd04.prod.outlook.com
 (2603:10b6:610:1ed:cafe::ff) by CH5PR02CA0003.outlook.office365.com
 (2603:10b6:610:1ed::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8989.16 via Frontend Transport; Fri,
 1 Aug 2025 06:22:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS2PEPF00003445.mail.protection.outlook.com (10.167.17.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9009.8 via Frontend Transport; Fri, 1 Aug 2025 06:22:26 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 1 Aug
 2025 01:22:26 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 1 Aug
 2025 01:22:26 -0500
Received: from r9-mach.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 1 Aug 2025 01:22:22 -0500
From: Venkata Prasad Potturu <venkataprasad.potturu@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
CC: <Vijendar.Mukunda@amd.com>, <Basavaraj.Hiregoudar@amd.com>,
	<Sunil-kumar.Dommati@amd.com>, <syed.sabakareem@amd.com>, "Venkata Prasad
 Potturu" <venkataprasad.potturu@amd.com>, Liam Girdwood
	<lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai
	<tiwai@suse.com>, Vinod Koul <vkoul@kernel.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>, "Charles
 Keepax" <ckeepax@opensource.cirrus.com>, "open list:SOUND - SOC LAYER /
 DYNAMIC AUDIO POWER MANAGEM..." <linux-sound@vger.kernel.org>, open list
	<linux-kernel@vger.kernel.org>
Subject: [PATCH 2/4] ASoC: amd: ps: Add SoundWire pci and dma driver support
 for acp7.2 platform
Date: Fri, 1 Aug 2025 11:51:36 +0530
Message-ID: <20250801062207.579388-3-venkataprasad.potturu@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250801062207.579388-1-venkataprasad.potturu@amd.com>
References: <20250801062207.579388-1-venkataprasad.potturu@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: venkataprasad.potturu@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00003445:EE_|DS0PR12MB9057:EE_
X-MS-Office365-Filtering-Correlation-Id: f6f03ed9-bcba-473b-1368-08ddd0c3c937
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|7416014|82310400026|376014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?JtKasXu4ne6tmd2QUKpF1c2yZwYzaE3mLabRafQomSXQVWrgdicFetRpwPGR?=
 =?us-ascii?Q?GE5qsSkQI0Zqwj7jgoqR2zW9MECuDR3Lm4P58lRNK/6URbXQJIHUoBT7bTsq?=
 =?us-ascii?Q?IJbmM4sgzTDvQ56Vyg1TBZ3P4SZmGe0FLHkVOEzhSn8dS6kdjjD1kWGaaFdV?=
 =?us-ascii?Q?6HXg0eydC8AGzWwPw7uLHDwdxROYqM3ebKluYHepnnXnDhYTvZVzI6SV4Emh?=
 =?us-ascii?Q?gz9vshKFkcWlD4o80AOPBIiV+E7/+S+qM+3vh0Tx1ssF52bpC1vLusnq+YfA?=
 =?us-ascii?Q?Id9sJMLXX0wwAmnafXnpIcVJbBDBrvMNVPXRHbRzfaomn0vHFLC0n2o1pC0i?=
 =?us-ascii?Q?RmcYEG08rA4CotGLE86m4HIUkX/G9V5JOreenQnE2sP42cCK2yPoXgjmfsSL?=
 =?us-ascii?Q?bCV5DWrocPt943mLH/ZL3KyZRrRp5KxBGkwOyNCnIDnAk39HPTXtZU0ans0E?=
 =?us-ascii?Q?SZaI8bghDPDhBUCurjtaNJQ60ax2rE5aA95CNvtKd2l5PZiuZulfXjMnUzoi?=
 =?us-ascii?Q?rGEO9t+vqwPkBa4GPIIn6t0GTTYVm6jVMObLcTWHXDQlCU7PIuMOF9Nr/AeI?=
 =?us-ascii?Q?QfIRCL9TXGeWIsNMhBgod8Oo9sPcENNUaIaCUZhRhjNmyQY+oLc1npuduaTG?=
 =?us-ascii?Q?4CRuQClj164+8xdJ6AHnNZTCQVqsVzfPp3/l2+WfyYphGpbpW6IGPi1bdv/M?=
 =?us-ascii?Q?+YsEzay1KE0t7Lpe8tU2Ikhlf89J1TSAMdAUWuxHKm/VckQfLSWUY2oFrtTZ?=
 =?us-ascii?Q?GMreZshZNEyyitI540Tw1U9ZaoAVu+tiJZtobsEMcrIj37nAgF79h3U57Fnf?=
 =?us-ascii?Q?lcumqcCwvUJgb1IT8/2hSvTgN55RTIdFCWWZQiywqBCrP/HquQ4Fj4PI6O1p?=
 =?us-ascii?Q?h01GRdxuxjrH8IFc689RLhE9Zk6qxkGLcZ+iNPNB/g9SFuebRBi34Y+8vRQz?=
 =?us-ascii?Q?xvY7wBJeDRb938tmeH7vUWJSTXVVi/B4682RLLCwXivmN926mZM5pUcKWCGK?=
 =?us-ascii?Q?0+/ycjm9T4bKyO6Eob4MDscpeWQKM9vJFJwtCyqPb0xvuRBvjbT/Xe2XHOyD?=
 =?us-ascii?Q?Y2OobnITUBbCbff86Fm+Gk5g2B7ygXWaj3uBUmNMYBIKAiusz6ogtdl6YgYt?=
 =?us-ascii?Q?8oVLcaxrhLJPgIcDmB9/OGf/T+YM2vI2Ot8GDlSxHIwx+++DLOx/Zm2Y1rhd?=
 =?us-ascii?Q?svdHy0Q+sZK1VUfQA7R/HJ/mrWW+EsubgRNNn5DR5u/JDPAve+cJyhaxMVJg?=
 =?us-ascii?Q?aXp5POTHh8eX2uT32hNFpD8I6sx8zaGEUPORb5CNg1Uo5MqmvmyeL2i5rfNp?=
 =?us-ascii?Q?VfpzOVkQHzjQcMpFwUWjDG19Cw2rgf06n53I1ZXWArUswArsq5UVpJH4lIQZ?=
 =?us-ascii?Q?5Lf3yO7Hwrw+EBKPD2WhxMlwYSUgj51VvkQjEdUXFN1e10/WrPAoPTDqq6TO?=
 =?us-ascii?Q?waaZvxFmAqdrHBR67FcEgKnAVTppYbhaEH+NEx4/mwIbJfbuSXAaBucs341h?=
 =?us-ascii?Q?S628ezNs3MDN1oLt/WPyVHRaTthMTj4z8OW6?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(82310400026)(376014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2025 06:22:26.8701
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 f6f03ed9-bcba-473b-1368-08ddd0c3c937
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DS2PEPF00003445.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB9057
Message-ID-Hash: 642MY7NVU2VPWNAAWII7ACWINLKFODCM
X-Message-ID-Hash: 642MY7NVU2VPWNAAWII7ACWINLKFODCM
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/642MY7NVU2VPWNAAWII7ACWINLKFODCM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add SoundWire pci and dma driver support for acp7.2 platform.

Signed-off-by: Venkata Prasad Potturu <venkataprasad.potturu@amd.com>
---
 sound/soc/amd/ps/acp63.h      | 1 +
 sound/soc/amd/ps/pci-ps.c     | 4 ++++
 sound/soc/amd/ps/ps-sdw-dma.c | 5 +++++
 3 files changed, 10 insertions(+)

diff --git a/sound/soc/amd/ps/acp63.h b/sound/soc/amd/ps/acp63.h
index d7c994e26e4d..90fc016dac0b 100644
--- a/sound/soc/amd/ps/acp63.h
+++ b/sound/soc/amd/ps/acp63.h
@@ -14,6 +14,7 @@
 #define ACP63_PCI_REV		0x63
 #define ACP70_PCI_REV		0x70
 #define ACP71_PCI_REV		0x71
+#define ACP72_PCI_REV		0x72
 
 #define ACP_SOFT_RESET_SOFTRESET_AUDDONE_MASK	0x00010001
 #define ACP63_PGFSM_CNTL_POWER_ON_MASK	1
diff --git a/sound/soc/amd/ps/pci-ps.c b/sound/soc/amd/ps/pci-ps.c
index 7936b3173632..c62299b29204 100644
--- a/sound/soc/amd/ps/pci-ps.c
+++ b/sound/soc/amd/ps/pci-ps.c
@@ -117,6 +117,7 @@ static short int check_and_handle_sdw_dma_irq(struct acp63_dev_data *adata, u32
 					break;
 				case ACP70_PCI_REV:
 				case ACP71_PCI_REV:
+				case ACP72_PCI_REV:
 					adata->acp70_sdw0_dma_intr_stat[stream_id] = 1;
 					break;
 				}
@@ -141,6 +142,7 @@ static short int check_and_handle_sdw_dma_irq(struct acp63_dev_data *adata, u32
 		break;
 	case ACP70_PCI_REV:
 	case ACP71_PCI_REV:
+	case ACP72_PCI_REV:
 		if (ext_intr_stat1 & ACP70_P1_SDW_DMA_IRQ_MASK) {
 			for (index = ACP70_P1_AUDIO2_RX_THRESHOLD;
 			     index <= ACP70_P1_AUDIO0_TX_THRESHOLD; index++) {
@@ -552,6 +554,7 @@ static int acp_hw_init_ops(struct acp63_dev_data *adata, struct pci_dev *pci)
 		break;
 	case ACP70_PCI_REV:
 	case ACP71_PCI_REV:
+	case ACP72_PCI_REV:
 		acp70_hw_init_ops(adata->hw_ops);
 		break;
 	default:
@@ -581,6 +584,7 @@ static int snd_acp63_probe(struct pci_dev *pci,
 	case ACP63_PCI_REV:
 	case ACP70_PCI_REV:
 	case ACP71_PCI_REV:
+	case ACP72_PCI_REV:
 		break;
 	default:
 		dev_dbg(&pci->dev, "acp63/acp70/acp71 pci device not found\n");
diff --git a/sound/soc/amd/ps/ps-sdw-dma.c b/sound/soc/amd/ps/ps-sdw-dma.c
index 1b933a017c06..5449323e2728 100644
--- a/sound/soc/amd/ps/ps-sdw-dma.c
+++ b/sound/soc/amd/ps/ps-sdw-dma.c
@@ -269,6 +269,7 @@ static int acp63_configure_sdw_ringbuffer(void __iomem *acp_base, u32 stream_id,
 		break;
 	case ACP70_PCI_REV:
 	case ACP71_PCI_REV:
+	case ACP72_PCI_REV:
 		switch (manager_instance) {
 		case ACP_SDW0:
 			reg_dma_size = acp70_sdw0_dma_reg[stream_id].reg_dma_size;
@@ -382,6 +383,7 @@ static int acp63_sdw_dma_hw_params(struct snd_soc_component *component,
 		break;
 	case ACP70_PCI_REV:
 	case ACP71_PCI_REV:
+	case ACP72_PCI_REV:
 		switch (stream->instance) {
 		case ACP_SDW0:
 			sdw_data->acp70_sdw0_dma_stream[stream_id] = substream;
@@ -451,6 +453,7 @@ static u64 acp63_sdw_get_byte_count(struct acp_sdw_dma_stream *stream, void __io
 		break;
 	case ACP70_PCI_REV:
 	case ACP71_PCI_REV:
+	case ACP72_PCI_REV:
 		switch (stream->instance) {
 		case ACP_SDW0:
 			pos_low_reg = acp70_sdw0_dma_reg[stream->stream_id].pos_low_reg;
@@ -529,6 +532,7 @@ static int acp63_sdw_dma_close(struct snd_soc_component *component,
 		break;
 	case ACP70_PCI_REV:
 	case ACP71_PCI_REV:
+	case ACP72_PCI_REV:
 		switch (stream->instance) {
 		case ACP_SDW0:
 			sdw_data->acp70_sdw0_dma_stream[stream->stream_id] = NULL;
@@ -574,6 +578,7 @@ static int acp63_sdw_dma_enable(struct snd_pcm_substream *substream,
 		break;
 	case ACP70_PCI_REV:
 	case ACP71_PCI_REV:
+	case ACP72_PCI_REV:
 		switch (stream->instance) {
 		case ACP_SDW0:
 			sdw_dma_en_reg = acp70_sdw0_dma_enable_reg[stream_id];
-- 
2.43.0

