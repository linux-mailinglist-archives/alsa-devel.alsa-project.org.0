Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D0156956383
	for <lists+alsa-devel@lfdr.de>; Mon, 19 Aug 2024 08:16:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 675EB1E93;
	Mon, 19 Aug 2024 08:15:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 675EB1E93
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1724048161;
	bh=T4ECzQLjoNm/Ww6/vGdZQyd6zCYy9Z2BVlVE0QhVi8E=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=rt99SNJnL0WYDoJHCuIz0Tws1532dvOLClvns5trntry+B1DVIVVxYESumcksfSOv
	 7eV6q4LOoqc/eE9tTOuvAs16+Rls1VZ94bBGQiTrn59d554NfDDdEgQBVcmROATiA/
	 4Lan1/CrgXdxc0hPajmAOIiCCGJROU1hbn1ERQ68=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3BAD0F805AE; Mon, 19 Aug 2024 08:15:28 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 22CD8F805AF;
	Mon, 19 Aug 2024 08:15:28 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 38022F80494; Mon, 19 Aug 2024 08:14:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20614.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2009::614])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 47532F8014C
	for <alsa-devel@alsa-project.org>; Mon, 19 Aug 2024 08:13:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 47532F8014C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=p3Z7lZRD
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pP9MsYdfbJ3emNv8oB3X5Z3SLpSM65xzwpWfQOBOjmoG6SeagcrFg0f69Nh9CemoGYfheipmgTNVx4e6dcit0ZTwlYUEp+FdVsNCzRZlY2XGBLARtIlfZbGCOLzDL4rPXVYgQEYvSsonVb2J2k4S5pmMMAJKioqMWHUZ850295uGVAHK116F9KrcHaGJsWJcNoEHmh3C1YZ2CsrUqvTGz+iavUiLheeyAw4NpmDx1Aah6Knsb3CyUc59MkfBVm/YP15xRo7PtAsK7hiplFc2MHSGj9n80NFQ5e/BEE6X3sUJDFzAGUSejIGmr2d3CIMKauIQ1wVSe0Wlmj9hjTZXSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7chqinX2UUHex5v9pq4eYenkRZTwtCWHR4zd4VbToJA=;
 b=Nu9LOrBFYlcyJNfSnNtgH27A+FmESkEtL9HXKKAuD47Hrq7qpwmkTq8o3brnxKvRW4rYwG3ujAZwYZwoxm9X/zyXIo2qxwgQkYEliHwHJ8Zdh+fDKA5MJmybLycCKCSGUO9v4kLCgYGHPwFVCr01Xeh3CR+qIEubDH3JjcCdNRtPMlqiqKGfLYf1PFdrt8sdIYR+ZG1N9umy8blRlsMdK6deQudGyb+fubgAhHptphAaLvjfj8GzH97H2s3WylL1s2j5EfPR1qaeg4ilpe2Yt0jE6nsXPHmfpZ19HcICvol0NBcf7cDiUNox/zQBb9PwpfvsZ4qCLR2xpPx+PjyZrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7chqinX2UUHex5v9pq4eYenkRZTwtCWHR4zd4VbToJA=;
 b=p3Z7lZRDiJ/sOSZY4HHmIeW5rRWh2sHXRHHAEMKo+3nU+vrTvwgalF88nkHA+RoaujBp+U7zje9hnngliEHIe7g3EXBRuYuFxR8f0B9oaILp3thKXPY7K1Jc3G7xZszcAqYhgjmnlC8rCuQYYa6mUWx851c4CVtFRkgFVz39q8E=
Received: from MW4PR04CA0131.namprd04.prod.outlook.com (2603:10b6:303:84::16)
 by CY8PR12MB7684.namprd12.prod.outlook.com (2603:10b6:930:87::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Mon, 19 Aug
 2024 06:13:48 +0000
Received: from CO1PEPF000044F8.namprd21.prod.outlook.com
 (2603:10b6:303:84:cafe::b0) by MW4PR04CA0131.outlook.office365.com
 (2603:10b6:303:84::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21 via Frontend
 Transport; Mon, 19 Aug 2024 06:13:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000044F8.mail.protection.outlook.com (10.167.241.198) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7897.4 via Frontend Transport; Mon, 19 Aug 2024 06:13:47 +0000
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 19 Aug 2024 01:13:42 -0500
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>
CC: <alsa-devel@alsa-project.org>, <pierre-louis.bossart@linux.intel.com>,
	<yung-chuan.liao@linux.intel.com>, <ranjani.sridharan@linux.intel.com>,
	<lgirdwood@gmail.com>, <perex@perex.cz>, <tiwai@suse.com>,
	<Basavaraj.Hiregoudar@amd.com>, <Sunil-kumar.Dommati@amd.com>,
	<venkataprasad.potturu@amd.com>, <cristian.ciocaltea@collabora.com>,
	<linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Vijendar
 Mukunda" <Vijendar.Mukunda@amd.com>
Subject: [PATCH] ASoC: amd: acp: replace desc->rev check with acp pci revision
 id
Date: Mon, 19 Aug 2024 11:43:29 +0530
Message-ID: <20240819061329.1025189-1-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F8:EE_|CY8PR12MB7684:EE_
X-MS-Office365-Filtering-Correlation-Id: 28fb3737-263f-480e-52f2-08dcc0161691
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|82310400026|376014|1800799024|7416014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?G417QAG8+X0ozyJjuquHve1HFzhtroWcD1f4Bk9xfkAbdLiyxlsz29641HPw?=
 =?us-ascii?Q?g8CffcPmH2GmVSBpTq/A9uqAUUebDHXe8H45WzGAAyk0snTEzXNW13leoHhu?=
 =?us-ascii?Q?1nhbSYhfNrFsLPWf/S1+K/ms3XAl2KIf026V99R54AQIuZSeWwgAsFKm1zhq?=
 =?us-ascii?Q?HMjTaclX/nIacyCRfuaqoZtKp9fxPB+s/mMgm/g60258tRhhX23aTqtsTGCo?=
 =?us-ascii?Q?PLImaDX02gof6hTZ+2U7q64plxIJWfe4sMcoUQcuWIs9D8D8x3d9EOLgkJ7Q?=
 =?us-ascii?Q?IVMj6I0yX4EUh+4659gMv88zQRiSdnb81L5ar+M+dNY9tN1wD3edUcl3XqGM?=
 =?us-ascii?Q?Wo+ZtTK3FCiUdRciHB3/VZyu9Hxh6b+YWIK8Vjf5kmia/L9r952S0R6ExMV/?=
 =?us-ascii?Q?70pwDWtaYWuQMn8ss19qfOD5GCyqsea3v1qmLmn6u5UfdOplGX2BjVR25Ksa?=
 =?us-ascii?Q?ta8EAW5uOPPc0Ney875T8RX4iikZX7yY5pd4OCIY+mow50t4f3pMueags7Fv?=
 =?us-ascii?Q?BNVPFAaEmEvySzJwUzTOb6p7KfEqy9MJ2P6PKEQMNlkiKesgcXGb02RegcFD?=
 =?us-ascii?Q?5gdvMFdIxoB9rITKoGIBmwuKkSIAIyon30KkDDRrIhmu1jrZvFolPooI4fu1?=
 =?us-ascii?Q?D6+TH9YdFjNYyPypEBBhGFDUjUJqfkz0UEHysvFoeEtXc8UgNWMLKZifBcmE?=
 =?us-ascii?Q?g/OEU03It+CQKuhcFl3QbgIdZDqirU0YdmybKjsaaBwmSM8u8YXCmHHXMS+v?=
 =?us-ascii?Q?R/v+OdVHs29rYIN7fzBsZieFI/vJMIzl9l038U/Ycpqt4CMRmPXr4pdcZ1G+?=
 =?us-ascii?Q?cMF/BLYKEk4Tk9k8cgjx7liL5VZSMA1M454DQ7YjTV4pAfrGR1jn6FQfuI1b?=
 =?us-ascii?Q?szjUaaLihpkN75XH0hJEImHx0zZo52kQUY2y9qqUPTb54TgeuvkDHP6SR8aD?=
 =?us-ascii?Q?4pmiEWJODvWb6EZeaXSVWlo4H0UdNdEXxPGsWKr5JRpCS1JCJW6NfYJmzW4S?=
 =?us-ascii?Q?Ib0kycXQx/b2wtaLospDSBbCHHU52OYmztWRrzgsNgMX24Pq148LWhthRtBS?=
 =?us-ascii?Q?SUKmVxAelSwXLD8Ev81KxmIJm5djIHCcxkROTVtZIMNFtlgVXorqmokDuRVu?=
 =?us-ascii?Q?f3j2wTxexPYWUKPFV5hkrogcq3P02zMatTmBo2KTeGDCu1h02avx5MBlfSpg?=
 =?us-ascii?Q?iExrEOVcta467qJ2vj3EX3OTAOd4yXrexaPrguYenP0m4QUCYR61BiVwSdR6?=
 =?us-ascii?Q?Nr8sMtmOG0bC5QxSkqTVIG36DMsXRatFztaftChGhYvzpggxeJpZ2Qz8zC2I?=
 =?us-ascii?Q?5VnqD/JY6OvxTb/Baa/hhwgVBziYffT2G1OFFyD1Xmg/Dk7fJMC5lft032ht?=
 =?us-ascii?Q?Xef5LI3vUboKuIjKjByTP5dkpOwNlDkyg5mDjN+jpw463ZaXmevuxu+AEbOt?=
 =?us-ascii?Q?CHz57Eb6rkP6y1naaIeqCX2n8NfkoWgd?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024)(7416014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2024 06:13:47.8641
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 28fb3737-263f-480e-52f2-08dcc0161691
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CO1PEPF000044F8.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7684
Message-ID-Hash: DP6CDJMM5ZAHETWMZQZDGMUHA6LZOVTD
X-Message-ID-Hash: DP6CDJMM5ZAHETWMZQZDGMUHA6LZOVTD
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DP6CDJMM5ZAHETWMZQZDGMUHA6LZOVTD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Replace acp descriptor structure member 'rev' check with acp pci revision
id.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 sound/soc/sof/amd/acp.c | 22 ++++++++++++----------
 1 file changed, 12 insertions(+), 10 deletions(-)

diff --git a/sound/soc/sof/amd/acp.c b/sound/soc/sof/amd/acp.c
index 0f6115c8b005..e4d46fdda88b 100644
--- a/sound/soc/sof/amd/acp.c
+++ b/sound/soc/sof/amd/acp.c
@@ -236,7 +236,6 @@ int configure_and_run_sha_dma(struct acp_dev_data *adata, void *image_addr,
 			      unsigned int image_length)
 {
 	struct snd_sof_dev *sdev = adata->dev;
-	const struct sof_amd_acp_desc *desc = get_chip_info(sdev->pdata);
 	unsigned int tx_count, fw_qualifier, val;
 	int ret;
 
@@ -265,8 +264,9 @@ int configure_and_run_sha_dma(struct acp_dev_data *adata, void *image_addr,
 	snd_sof_dsp_write(sdev, ACP_DSP_BAR, ACP_SHA_DMA_DESTINATION_ADDR, dest_addr);
 	snd_sof_dsp_write(sdev, ACP_DSP_BAR, ACP_SHA_MSG_LENGTH, image_length);
 
-	/* psp_send_cmd only required for vangogh platform (rev - 5) */
-	if (desc->rev == 5 && !(adata->quirks && adata->quirks->skip_iram_dram_size_mod)) {
+	/* psp_send_cmd only required for vangogh platform */
+	if (adata->pci_rev == ACP_VANGOGH_PCI_ID &&
+	    !(adata->quirks && adata->quirks->skip_iram_dram_size_mod)) {
 		/* Modify IRAM and DRAM size */
 		ret = psp_send_cmd(adata, MBOX_ACP_IRAM_DRAM_FENCE_COMMAND | IRAM_DRAM_FENCE_2);
 		if (ret)
@@ -285,8 +285,8 @@ int configure_and_run_sha_dma(struct acp_dev_data *adata, void *image_addr,
 		return ret;
 	}
 
-	/* psp_send_cmd only required for renoir platform (rev - 3) */
-	if (desc->rev == 3) {
+	/* psp_send_cmd only required for renoir platform*/
+	if (adata->pci_rev == ACP_RN_PCI_ID) {
 		ret = psp_send_cmd(adata, MBOX_ACP_SHA_DMA_COMMAND);
 		if (ret)
 			return ret;
@@ -405,7 +405,7 @@ static irqreturn_t acp_irq_handler(int irq, void *dev_id)
 		snd_sof_dsp_write(sdev, ACP_DSP_BAR, desc->ext_intr_stat, ACP_ERROR_IRQ_MASK);
 		snd_sof_dsp_write(sdev, ACP_DSP_BAR, desc->acp_sw0_i2s_err_reason, 0);
 		/* ACP_SW1_I2S_ERROR_REASON is newly added register from rmb platform onwards */
-		if (desc->rev >= 6)
+		if (adata->pci_rev >= ACP_RMB_PCI_ID)
 			snd_sof_dsp_write(sdev, ACP_DSP_BAR, ACP_SW1_I2S_ERROR_REASON, 0);
 		snd_sof_dsp_write(sdev, ACP_DSP_BAR, desc->acp_error_stat, 0);
 		irq_flag = 1;
@@ -431,6 +431,7 @@ static irqreturn_t acp_irq_handler(int irq, void *dev_id)
 static int acp_power_on(struct snd_sof_dev *sdev)
 {
 	const struct sof_amd_acp_desc *desc = get_chip_info(sdev->pdata);
+	struct acp_dev_data *adata = sdev->pdata->hw_pdata;
 	unsigned int base = desc->pgfsm_base;
 	unsigned int val;
 	unsigned int acp_pgfsm_status_mask, acp_pgfsm_cntl_mask;
@@ -441,13 +442,14 @@ static int acp_power_on(struct snd_sof_dev *sdev)
 	if (val == ACP_POWERED_ON)
 		return 0;
 
-	switch (desc->rev) {
-	case 3:
-	case 5:
+	switch (adata->pci_rev) {
+	case ACP_RN_PCI_ID:
+	case ACP_VANGOGH_PCI_ID:
 		acp_pgfsm_status_mask = ACP3X_PGFSM_STATUS_MASK;
 		acp_pgfsm_cntl_mask = ACP3X_PGFSM_CNTL_POWER_ON_MASK;
 		break;
-	case 6:
+	case ACP_RMB_PCI_ID:
+	case ACP63_PCI_ID:
 		acp_pgfsm_status_mask = ACP6X_PGFSM_STATUS_MASK;
 		acp_pgfsm_cntl_mask = ACP6X_PGFSM_CNTL_POWER_ON_MASK;
 		break;
-- 
2.34.1

