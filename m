Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 60A8D642819
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Dec 2022 13:09:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0F3B817B4;
	Mon,  5 Dec 2022 13:08:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0F3B817B4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1670242142;
	bh=QMujAJRp7gp/okf3gkAMUtscZOlCHEvkB10F6byk3SI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gIskt6yCMv9b5MxDyTN5onoqtM5QKmimwML1/+wZ+VlCi3oGDc4LSzYstEFDz6pIE
	 yfOx7mg3t0X0rmunxGfqnJc5788qKPaWObVn3CbzaUeNKx9k7OmZ+o7gube+F5vVl6
	 k/Acfs/kdYyrwClBbRtLX9Iy5xaGrs3PwmlPP0H4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 558F9F80571;
	Mon,  5 Dec 2022 13:07:43 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D8F54F80570; Mon,  5 Dec 2022 13:07:39 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on20628.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e83::628])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DDEDAF8052E;
 Mon,  5 Dec 2022 13:07:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DDEDAF8052E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com
 header.b="pYSHnmga"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XXsYNVvgEPrK6vUIYwIbIIwzQHYujUCtC0nakGCKW+u/qTZ/31+tr/iG412CartbXIOdbiAJgunGY0YhH/aQZbN7wcKflhjfS6Ro3civKIndfXSDOOaRkDKpi36DSxTBZil9TClRMYa51qXH+XV7NRaurj0L1GFWJx6XGUjw4u6T4t9HXNPIGmQJk2BcMsvMvMx+hzDFLPrGJicJBMZhWwv1q/u1PMMshs2h4SqqvIapFQq+7gfOraxsj+VTCVIsHGosi67XsEvLdIiP4T09CK114w8ukPUUn3C9+4zfDpoWREcgcioek++T/INeFj1woQEsYnPOZQ7Gc8B5CfVh8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=liFTeoUSiUzJ1URWWGiG14HklEeoRxETuB059seuN4c=;
 b=ROCDxFYSwa+yLYzIjXlJx/3Rea5X4zdxAbk/iSOkm0HFBd5wIFz+m6kp9t1t7KV3IhKXgfz04szRdy9OodV5cXcVFU9ialbFIEmiivXYM+fjH96dXy5d8fsjGOer7qrnHkl0jylemvv3TdGyXacanOIHPLwcWWT3sfbdYsSt5d/Zwb9LtgN4UWE6k/N/H7oM0RGELyanNDKV3Z94CuDVjBJry5jZuKMFC84hTqwB6An19WJv4vUy7hzWJ2GV18TVofMFD73uJn8jP0APIrNg8RO6P1Ks5oqlnUuoTDTAMg/uXtaJvyR7jexYqn8piNPT4fnylda6NtQOX0vnOH1R2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=liFTeoUSiUzJ1URWWGiG14HklEeoRxETuB059seuN4c=;
 b=pYSHnmga8zGtIguG/Ch+5AfALwxAd11WrXsIpI+Mxlf6a1r8l8HbpdRIAWvRlqxFawR/m5WPtmwAq0bBKvDc7w693bgDSjlza/xE9/dp2ZB91rI/Gz7+9BVJ/YH09WHimeE6qKqZYVgl/PsiS79H9XfK0vOc1Ln73+tWLapzpd4=
Received: from BN9PR03CA0612.namprd03.prod.outlook.com (2603:10b6:408:106::17)
 by CY5PR12MB6084.namprd12.prod.outlook.com (2603:10b6:930:28::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.13; Mon, 5 Dec
 2022 12:07:26 +0000
Received: from BN8NAM11FT010.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:106:cafe::1) by BN9PR03CA0612.outlook.office365.com
 (2603:10b6:408:106::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.14 via Frontend
 Transport; Mon, 5 Dec 2022 12:07:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT010.mail.protection.outlook.com (10.13.177.53) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5880.14 via Frontend Transport; Mon, 5 Dec 2022 12:07:26 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 5 Dec
 2022 06:07:25 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 5 Dec
 2022 04:07:04 -0800
Received: from sof-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34
 via Frontend Transport; Mon, 5 Dec 2022 06:06:58 -0600
From: V sujith kumar Reddy <Vsujithkumar.Reddy@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
Subject: [PATCH 2/2] ASoC : SOF: amd: Add support for IPC and DSP dumps
Date: Mon, 5 Dec 2022 17:36:49 +0530
Message-ID: <20221205120649.1950576-3-Vsujithkumar.Reddy@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221205120649.1950576-1-Vsujithkumar.Reddy@amd.com>
References: <20221205120649.1950576-1-Vsujithkumar.Reddy@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT010:EE_|CY5PR12MB6084:EE_
X-MS-Office365-Filtering-Correlation-Id: a54f13a7-ccf8-41f2-7d1b-08dad6b9462d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MxozlJ7BHgBFggJXUnI4mNi1E++U7qIYcUvidcqdAXGvsFg5Z76cmutZr+ndDI5Y1XwgFH8DFoPqTtIzNO6dCI3x2OUjvlKrBz1nGJPtxtajZoXR5+Wr4MHJCJSXCgQyTHjBcI2DwGeTZroa93IDcMVzUUTSsBAVlkb0sxv+vfaLdchEOU3fNdCO/iBmlBssGGs4V/S7rS53xDkA1vpQ2YJn1HT6G9gtu7O8/jUWTqyhdjDOHZ1oGnfUuyiVr5NWBBAKlIOx8aCsorgTFc46HA2wRVXhRgi3Ugdtu/28vlVuHUKEgqVvLrF4SpbSPxxkbt9e4bqp3Rtv1QtMGANzyMThQRDihvSNS7KfmSRxsB9QKU+OVzitFt2ii8Rje8uaOx0XjKe6qH0mMuU5Z0mE8K4k7JvSTytBS6vsWFTfUIlF1NChzDrYrWXGEgJYGCDK50IDDOYzaQdVJMpIyvm5quQ1fRACvXRGF49oSyDtpPix+mqRPtGGKhMPPjWtWUj6Q7wUXM+/dAbqPG2s/GxSXs2dg9hX/c/n5gPnNpDLbZrGSZ7bN8+5/KlUn0sHjTjF4zeYMWuWillJYyGjL9PGgF/ggnp0vONYBgOd6kIsbaE+Sdkjr3B6g8++HH7CKcJkmQD7imNl/pdVnsePA9D3Kd3E8c5ZoPurkIothK/pADaOU0BjvyVnDCbgugeCJPrAUESWMoOiz3oNcjFveOtc9RNIMS3Dzj0R920djO8EQTI=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(346002)(39860400002)(376002)(396003)(451199015)(40470700004)(46966006)(36840700001)(40480700001)(36756003)(40460700003)(86362001)(478600001)(26005)(6666004)(4326008)(5660300002)(7696005)(7416002)(186003)(8676002)(54906003)(316002)(8936002)(41300700001)(70206006)(70586007)(2906002)(110136005)(356005)(81166007)(82740400003)(1076003)(82310400005)(2616005)(36860700001)(83380400001)(426003)(47076005)(336012)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2022 12:07:26.0557 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a54f13a7-ccf8-41f2-7d1b-08dad6b9462d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT010.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6084
Cc: Daniel Baluta <daniel.baluta@nxp.com>,
 Jiapeng Chong <jiapeng.chong@linux.alibaba.com>, Sunil-kumar.Dommati@amd.com,
 ssabakar@amd.com, Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 venkataprasad.potturu@amd.com, Bard
 Liao <yung-chuan.liao@linux.intel.com>, Basavaraj.Hiregoudar@amd.com,
 Takashi Iwai <tiwai@suse.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Vijendar.Mukunda@amd.com, V sujith kumar Reddy <Vsujithkumar.Reddy@amd.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, Ajit Kumar
 Pandey <AjitKumar.Pandey@amd.com>, open list <linux-kernel@vger.kernel.org>,
 "moderated list:SOUND - SOUND OPEN
 FIRMWARE \(SOF\) DRIVERS" <sound-open-firmware@alsa-project.org>
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

Add support for IPC and DSP dumps for AMD platforms.

Signed-off-by: V sujith kumar Reddy <Vsujithkumar.Reddy@amd.com>
---
 sound/soc/sof/amd/Kconfig      |   1 +
 sound/soc/sof/amd/acp-common.c | 108 +++++++++++++++++++++++++++++++++
 sound/soc/sof/amd/acp-ipc.c    |  13 ++++
 sound/soc/sof/amd/acp.h        |   6 ++
 4 files changed, 128 insertions(+)

diff --git a/sound/soc/sof/amd/Kconfig b/sound/soc/sof/amd/Kconfig
index a305ea6efea9..1cb92d6030e3 100644
--- a/sound/soc/sof/amd/Kconfig
+++ b/sound/soc/sof/amd/Kconfig
@@ -20,6 +20,7 @@ config SND_SOC_SOF_AMD_COMMON
 	select SND_SOC_SOF_IPC3
 	select SND_SOC_SOF_PCI_DEV
 	select SND_AMD_ACP_CONFIG
+	select SND_SOC_SOF_XTENSA
 	select SND_SOC_ACPI if ACPI
 	help
 	  This option is not user-selectable but automatically handled by
diff --git a/sound/soc/sof/amd/acp-common.c b/sound/soc/sof/amd/acp-common.c
index 150e042e4039..bd6c1b198736 100644
--- a/sound/soc/sof/amd/acp-common.c
+++ b/sound/soc/sof/amd/acp-common.c
@@ -16,6 +16,7 @@
 #include "../sof-audio.h"
 #include "acp.h"
 #include "acp-dsp-offset.h"
+#include <sound/sof/xtensa.h>
 
 int acp_dai_probe(struct snd_soc_dai *dai)
 {
@@ -33,6 +34,107 @@ int acp_dai_probe(struct snd_soc_dai *dai)
 }
 EXPORT_SYMBOL_NS(acp_dai_probe, SND_SOC_SOF_AMD_COMMON);
 
+/**
+ * amd_sof_ipc_dump() - This function is called when IPC tx times out.
+ * @sdev: SOF device.
+ */
+void amd_sof_ipc_dump(struct snd_sof_dev *sdev)
+{
+	const struct sof_amd_acp_desc *desc = get_chip_info(sdev->pdata);
+	u32 base = desc->dsp_intr_base;
+	u32 dsp_msg_write = sdev->debug_box.offset +
+			    offsetof(struct scratch_ipc_conf, sof_dsp_msg_write);
+	u32 dsp_ack_write = sdev->debug_box.offset +
+			    offsetof(struct scratch_ipc_conf, sof_dsp_ack_write);
+	u32 host_msg_write = sdev->debug_box.offset +
+			     offsetof(struct scratch_ipc_conf, sof_host_msg_write);
+	u32 host_ack_write = sdev->debug_box.offset +
+			     offsetof(struct scratch_ipc_conf, sof_host_ack_write);
+	u32 dsp_msg, dsp_ack, host_msg, host_ack, irq_stat;
+
+	dsp_msg = snd_sof_dsp_read(sdev, ACP_DSP_BAR, ACP_SCRATCH_REG_0 + dsp_msg_write);
+	dsp_ack = snd_sof_dsp_read(sdev, ACP_DSP_BAR, ACP_SCRATCH_REG_0 + dsp_ack_write);
+	host_msg = snd_sof_dsp_read(sdev, ACP_DSP_BAR, ACP_SCRATCH_REG_0 + host_msg_write);
+	host_ack = snd_sof_dsp_read(sdev, ACP_DSP_BAR, ACP_SCRATCH_REG_0 + host_ack_write);
+	irq_stat = snd_sof_dsp_read(sdev, ACP_DSP_BAR, base + DSP_SW_INTR_STAT_OFFSET);
+
+	dev_err(sdev->dev,
+		"dsp_msg = %#x dsp_ack = %#x host_msg = %#x host_ack = %#x irq_stat = %#x\n",
+		dsp_msg, dsp_ack, host_msg, host_ack, irq_stat);
+}
+
+/**
+ * amd_get_registers() - This function is called in case of DSP oops
+ * in order to gather information about the registers, filename and
+ * linenumber and stack.
+ * @sdev: SOF device.
+ * @xoops: Stores information about registers.
+ * @panic_info: Stores information about filename and line number.
+ * @stack: Stores the stack dump.
+ * @stack_words: Size of the stack dump.
+ */
+static void amd_get_registers(struct snd_sof_dev *sdev,
+			      struct sof_ipc_dsp_oops_xtensa *xoops,
+			      struct sof_ipc_panic_info *panic_info,
+			      u32 *stack, size_t stack_words)
+{
+	u32 offset = sdev->dsp_oops_offset;
+
+	/* first read registers */
+	acp_mailbox_read(sdev, offset, xoops, sizeof(*xoops));
+
+	/* then get panic info */
+	if (xoops->arch_hdr.totalsize > EXCEPT_MAX_HDR_SIZE) {
+		dev_err(sdev->dev, "invalid header size 0x%x. FW oops is bogus\n",
+			xoops->arch_hdr.totalsize);
+		return;
+	}
+
+	offset += xoops->arch_hdr.totalsize;
+	acp_mailbox_read(sdev, offset, panic_info, sizeof(*panic_info));
+
+	/* then get the stack */
+	offset += sizeof(*panic_info);
+	acp_mailbox_read(sdev, offset, stack, stack_words * sizeof(u32));
+}
+
+/**
+ * amd_sof_dump() - This function is called when a panic message is
+ * received from the firmware.
+ * @sdev: SOF device.
+ * @flags: parameter not used but required by ops prototype
+ */
+void amd_sof_dump(struct snd_sof_dev *sdev, u32 flags)
+{
+	struct sof_ipc_dsp_oops_xtensa xoops;
+	struct sof_ipc_panic_info panic_info;
+	u32 stack[AMD_STACK_DUMP_SIZE];
+	u32 status;
+
+	/* Get information about the panic status from the debug box area.
+	 * Compute the trace point based on the status.
+	 */
+	if (sdev->dsp_oops_offset > sdev->debug_box.offset) {
+		acp_mailbox_read(sdev, sdev->debug_box.offset, &status, sizeof(u32));
+	} else {
+		/* Read DSP Panic status from dsp_box.
+		 * As window information for exception box offset and size is not available
+		 * before FW_READY
+		 */
+		acp_mailbox_read(sdev, sdev->dsp_box.offset, &status, sizeof(u32));
+		sdev->dsp_oops_offset = sdev->dsp_box.offset + sizeof(status);
+	}
+
+	/* Get information about the registers, the filename and line
+	 * number and the stack.
+	 */
+	amd_get_registers(sdev, &xoops, &panic_info, stack, AMD_STACK_DUMP_SIZE);
+
+	/* Print the information to the console */
+	sof_print_oops_and_stack(sdev, KERN_ERR, status, status, &xoops,
+				 &panic_info, stack, AMD_STACK_DUMP_SIZE);
+}
+
 struct snd_soc_acpi_mach *amd_sof_machine_select(struct snd_sof_dev *sdev)
 {
 	struct snd_sof_pdata *sof_pdata = sdev->pdata;
@@ -104,9 +206,15 @@ struct snd_sof_dsp_ops sof_acp_common_ops = {
 	/* PM */
 	.suspend                = amd_sof_acp_suspend,
 	.resume                 = amd_sof_acp_resume,
+
+	.ipc_dump		= amd_sof_ipc_dump,
+	.dbg_dump		= amd_sof_dump,
+	.debugfs_add_region_item = snd_sof_debugfs_add_region_item_iomem,
+	.dsp_arch_ops = &sof_xtensa_arch_ops,
 };
 EXPORT_SYMBOL_NS(sof_acp_common_ops, SND_SOC_SOF_AMD_COMMON);
 
 MODULE_IMPORT_NS(SND_SOC_SOF_AMD_COMMON);
+MODULE_IMPORT_NS(SND_SOC_SOF_XTENSA);
 MODULE_DESCRIPTION("ACP SOF COMMON Driver");
 MODULE_LICENSE("Dual BSD/GPL");
diff --git a/sound/soc/sof/amd/acp-ipc.c b/sound/soc/sof/amd/acp-ipc.c
index dd6e53c63407..5a02753c4610 100644
--- a/sound/soc/sof/amd/acp-ipc.c
+++ b/sound/soc/sof/amd/acp-ipc.c
@@ -154,8 +154,15 @@ irqreturn_t acp_sof_ipc_irq_thread(int irq, void *context)
 				     offsetof(struct scratch_ipc_conf, sof_dsp_ack_write);
 	bool ipc_irq = false;
 	int dsp_msg, dsp_ack;
+	unsigned int status;
 
 	if (sdev->first_boot && sdev->fw_state != SOF_FW_BOOT_COMPLETE) {
+		acp_mailbox_read(sdev, sdev->dsp_box.offset, &status, sizeof(status));
+		if ((status & SOF_IPC_PANIC_MAGIC_MASK) == SOF_IPC_PANIC_MAGIC) {
+			snd_sof_dsp_panic(sdev, sdev->dsp_box.offset + sizeof(status),
+					  true);
+			return IRQ_HANDLED;
+		}
 		snd_sof_ipc_msgs_rx(sdev);
 		acp_dsp_ipc_host_done(sdev);
 		return IRQ_HANDLED;
@@ -180,6 +187,12 @@ irqreturn_t acp_sof_ipc_irq_thread(int irq, void *context)
 		ipc_irq = true;
 	}
 
+	acp_mailbox_read(sdev, sdev->debug_box.offset, &status, sizeof(u32));
+	if ((status & SOF_IPC_PANIC_MAGIC_MASK) == SOF_IPC_PANIC_MAGIC) {
+		snd_sof_dsp_panic(sdev, sdev->dsp_oops_offset, true);
+		return IRQ_HANDLED;
+	}
+
 	if (!ipc_irq)
 		dev_dbg_ratelimited(sdev->dev, "nothing to do in IPC IRQ thread\n");
 
diff --git a/sound/soc/sof/amd/acp.h b/sound/soc/sof/amd/acp.h
index 76ad963faec1..09e16ef8afa0 100644
--- a/sound/soc/sof/amd/acp.h
+++ b/sound/soc/sof/amd/acp.h
@@ -69,6 +69,9 @@
 #define BOX_SIZE_512				0x200
 #define BOX_SIZE_1024				0x400
 
+#define EXCEPT_MAX_HDR_SIZE			0x400
+#define AMD_STACK_DUMP_SIZE			32
+
 enum clock_source {
 	ACP_CLOCK_96M = 0,
 	ACP_CLOCK_48M,
@@ -254,6 +257,9 @@ int acp_sof_trace_release(struct snd_sof_dev *sdev);
 int amd_sof_acp_suspend(struct snd_sof_dev *sdev, u32 target_state);
 int amd_sof_acp_resume(struct snd_sof_dev *sdev);
 
+void amd_sof_ipc_dump(struct snd_sof_dev *sdev);
+void amd_sof_dump(struct snd_sof_dev *sdev, u32 flags);
+
 static inline const struct sof_amd_acp_desc *get_chip_info(struct snd_sof_pdata *pdata)
 {
 	const struct sof_dev_desc *desc = pdata->desc;
-- 
2.25.1

