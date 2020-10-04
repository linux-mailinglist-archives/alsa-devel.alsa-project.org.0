Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 345E1282A24
	for <lists+alsa-devel@lfdr.de>; Sun,  4 Oct 2020 12:08:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BB4F418B2;
	Sun,  4 Oct 2020 12:07:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BB4F418B2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601806126;
	bh=EQY8P632ciwWmlVUFBqXys0Mg21ZYL/30ryK34t+2Rs=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dV4ZF5I9cM9W7egtxLpg/f9IjzdksrNaYKiZrdmj4xVrXVGAWSo7DBCSab4GUeTv+
	 0KBZcRYbx/H4n/q4pdRYEnnowNexyRsgkicSsSaiOLfmd5e8l+HrtWg1eiQHCZnb2N
	 5jUtz5SZe/PNsDyBkxjh7t/TEFcrI6TG0bD0Ih5o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7B9F9F80344;
	Sun,  4 Oct 2020 12:02:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 93A60F80329; Sun,  4 Oct 2020 12:02:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=PRX_BODY_65,SPF_HELO_NONE,
 SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F2D66F80303
 for <alsa-devel@alsa-project.org>; Sun,  4 Oct 2020 12:02:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F2D66F80303
IronPort-SDR: 6cYWdEt8yoDImB+X57+oLdjqxjEjxGOUspsCXC46vVesa0gp6U6Gkg1xAPT1j4k9ZwS3IJECt6
 +sR7upum+u3g==
X-IronPort-AV: E=McAfee;i="6000,8403,9763"; a="163384010"
X-IronPort-AV: E=Sophos;i="5.77,335,1596524400"; d="scan'208";a="163384010"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2020 03:02:18 -0700
IronPort-SDR: LI9wtLOCszPQVLIsTqPSSKJx4tgCixtxhiR3YRKFPLXD49MCNvHiahJdSqy7xqXz9HaK/YfxBx
 jrUpkU1JWRVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,335,1596524400"; d="scan'208";a="340527949"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by fmsmga004.fm.intel.com with ESMTP; 04 Oct 2020 03:02:14 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 10/13] ASoC: Intel: Remove SST-legacy specific constants
Date: Sun,  4 Oct 2020 12:01:25 +0200
Message-Id: <20201004100128.5842-11-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201004100128.5842-1-cezary.rojewski@intel.com>
References: <20201004100128.5842-1-cezary.rojewski@intel.com>
Cc: pierre-louis.bossart@linux.intel.com,
 Cezary Rojewski <cezary.rojewski@intel.com>, andriy.shevchenko@linux.intel.com,
 filip.kaczmarski@intel.com, harshapriya.n@intel.com, marcin.barlik@intel.com,
 zwisler@google.com, lgirdwood@gmail.com, tiwai@suse.com,
 filip.proborszcz@intel.com, broonie@kernel.org,
 amadeuszx.slawinski@linux.intel.com, michal.wasko@intel.com,
 cujomalainey@chromium.org, krzysztof.hejmowski@intel.com,
 ppapierkowski@habana.ai, vamshi.krishna.gopal@intel.com
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

As sound/soc/intel/haswell and /baytrail are no more, all SST-legacy
specific constants and registers are redundant so remove them.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/common/sst-dsp-priv.h |   3 -
 sound/soc/intel/common/sst-dsp.h      | 143 --------------------------
 sound/soc/intel/common/sst-ipc.h      |   2 -
 3 files changed, 148 deletions(-)

diff --git a/sound/soc/intel/common/sst-dsp-priv.h b/sound/soc/intel/common/sst-dsp-priv.h
index 994698ff581e..7d9834509f4a 100644
--- a/sound/soc/intel/common/sst-dsp-priv.h
+++ b/sound/soc/intel/common/sst-dsp-priv.h
@@ -15,9 +15,6 @@
 
 #include "../skylake/skl-sst-dsp.h"
 
-/* do we need to remove or keep */
-#define DSP_DRAM_ADDR_OFFSET		0x400000
-
 /*
  * DSP Operations exported by platform Audio DSP driver.
  */
diff --git a/sound/soc/intel/common/sst-dsp.h b/sound/soc/intel/common/sst-dsp.h
index 427970add9c7..f580e718b183 100644
--- a/sound/soc/intel/common/sst-dsp.h
+++ b/sound/soc/intel/common/sst-dsp.h
@@ -12,158 +12,15 @@
 #include <linux/types.h>
 #include <linux/interrupt.h>
 
-/* SST Device IDs  */
-#define SST_DEV_ID_LYNX_POINT		0x33C8
-#define SST_DEV_ID_WILDCAT_POINT	0x3438
-#define SST_DEV_ID_BYT			0x0F28
-
-/* Supported SST DMA Devices */
-#define SST_DMA_TYPE_DW		1
-
-/* autosuspend delay 5s*/
-#define SST_RUNTIME_SUSPEND_DELAY	(5 * 1000)
-
 /* SST Shim register map
  * The register naming can differ between products. Some products also
  * contain extra functionality.
  */
 #define SST_CSR			0x00
-#define SST_PISR		0x08
-#define SST_PIMR		0x10
 #define SST_ISRX		0x18
-#define SST_ISRD		0x20
 #define SST_IMRX		0x28
-#define SST_IMRD		0x30
 #define SST_IPCX		0x38 /* IPC IA -> SST */
 #define SST_IPCD		0x40 /* IPC SST -> IA */
-#define SST_ISRSC		0x48
-#define SST_ISRLPESC		0x50
-#define SST_IMRSC		0x58
-#define SST_IMRLPESC		0x60
-#define SST_IPCSC		0x68
-#define SST_IPCLPESC		0x70
-#define SST_CLKCTL		0x78
-#define SST_CSR2		0x80
-#define SST_LTRC		0xE0
-#define SST_HMDC		0xE8
-
-#define SST_SHIM_BEGIN		SST_CSR
-#define SST_SHIM_END		SST_HDMC
-
-#define SST_DBGO		0xF0
-
-#define SST_SHIM_SIZE		0x100
-#define SST_PWMCTRL             0x1000
-
-/* SST Shim Register bits
- * The register bit naming can differ between products. Some products also
- * contain extra functionality.
- */
-
-/* CSR / CS */
-#define SST_CSR_RST		(0x1 << 1)
-#define SST_CSR_SBCS0		(0x1 << 2)
-#define SST_CSR_SBCS1		(0x1 << 3)
-#define SST_CSR_DCS(x)		(x << 4)
-#define SST_CSR_DCS_MASK	(0x7 << 4)
-#define SST_CSR_STALL		(0x1 << 10)
-#define SST_CSR_S0IOCS		(0x1 << 21)
-#define SST_CSR_S1IOCS		(0x1 << 23)
-#define SST_CSR_LPCS		(0x1 << 31)
-#define SST_CSR_24MHZ_LPCS	(SST_CSR_SBCS0 | SST_CSR_SBCS1 | SST_CSR_LPCS)
-#define SST_CSR_24MHZ_NO_LPCS	(SST_CSR_SBCS0 | SST_CSR_SBCS1)
-#define SST_BYT_CSR_RST		(0x1 << 0)
-#define SST_BYT_CSR_VECTOR_SEL	(0x1 << 1)
-#define SST_BYT_CSR_STALL	(0x1 << 2)
-#define SST_BYT_CSR_PWAITMODE	(0x1 << 3)
-
-/*  ISRX / ISC */
-#define SST_ISRX_BUSY		(0x1 << 1)
-#define SST_ISRX_DONE		(0x1 << 0)
-#define SST_BYT_ISRX_REQUEST	(0x1 << 1)
-
-/*  ISRD / ISD */
-#define SST_ISRD_BUSY		(0x1 << 1)
-#define SST_ISRD_DONE		(0x1 << 0)
-
-/* IMRX / IMC */
-#define SST_IMRX_BUSY		(0x1 << 1)
-#define SST_IMRX_DONE		(0x1 << 0)
-#define SST_BYT_IMRX_REQUEST	(0x1 << 1)
-
-/* IMRD / IMD */
-#define SST_IMRD_DONE		(0x1 << 0)
-#define SST_IMRD_BUSY		(0x1 << 1)
-#define SST_IMRD_SSP0		(0x1 << 16)
-#define SST_IMRD_DMAC0		(0x1 << 21)
-#define SST_IMRD_DMAC1		(0x1 << 22)
-#define SST_IMRD_DMAC		(SST_IMRD_DMAC0 | SST_IMRD_DMAC1)
-
-/*  IPCX / IPCC */
-#define	SST_IPCX_DONE		(0x1 << 30)
-#define	SST_IPCX_BUSY		(0x1 << 31)
-#define SST_BYT_IPCX_DONE	((u64)0x1 << 62)
-#define SST_BYT_IPCX_BUSY	((u64)0x1 << 63)
-
-/*  IPCD */
-#define	SST_IPCD_DONE		(0x1 << 30)
-#define	SST_IPCD_BUSY		(0x1 << 31)
-#define SST_BYT_IPCD_DONE	((u64)0x1 << 62)
-#define SST_BYT_IPCD_BUSY	((u64)0x1 << 63)
-
-/* CLKCTL */
-#define SST_CLKCTL_SMOS(x)	(x << 24)
-#define SST_CLKCTL_MASK		(3 << 24)
-#define SST_CLKCTL_DCPLCG	(1 << 18)
-#define SST_CLKCTL_SCOE1	(1 << 17)
-#define SST_CLKCTL_SCOE0	(1 << 16)
-
-/* CSR2 / CS2 */
-#define SST_CSR2_SDFD_SSP0	(1 << 1)
-#define SST_CSR2_SDFD_SSP1	(1 << 2)
-
-/* LTRC */
-#define SST_LTRC_VAL(x)		(x << 0)
-
-/* HMDC */
-#define SST_HMDC_HDDA0(x)	(x << 0)
-#define SST_HMDC_HDDA1(x)	(x << 7)
-#define SST_HMDC_HDDA_E0_CH0	1
-#define SST_HMDC_HDDA_E0_CH1	2
-#define SST_HMDC_HDDA_E0_CH2	4
-#define SST_HMDC_HDDA_E0_CH3	8
-#define SST_HMDC_HDDA_E1_CH0	SST_HMDC_HDDA1(SST_HMDC_HDDA_E0_CH0)
-#define SST_HMDC_HDDA_E1_CH1	SST_HMDC_HDDA1(SST_HMDC_HDDA_E0_CH1)
-#define SST_HMDC_HDDA_E1_CH2	SST_HMDC_HDDA1(SST_HMDC_HDDA_E0_CH2)
-#define SST_HMDC_HDDA_E1_CH3	SST_HMDC_HDDA1(SST_HMDC_HDDA_E0_CH3)
-#define SST_HMDC_HDDA_E0_ALLCH	(SST_HMDC_HDDA_E0_CH0 | SST_HMDC_HDDA_E0_CH1 | \
-				 SST_HMDC_HDDA_E0_CH2 | SST_HMDC_HDDA_E0_CH3)
-#define SST_HMDC_HDDA_E1_ALLCH	(SST_HMDC_HDDA_E1_CH0 | SST_HMDC_HDDA_E1_CH1 | \
-				 SST_HMDC_HDDA_E1_CH2 | SST_HMDC_HDDA_E1_CH3)
-
-
-/* SST Vendor Defined Registers and bits */
-#define SST_VDRTCTL0		0xa0
-#define SST_VDRTCTL1		0xa4
-#define SST_VDRTCTL2		0xa8
-#define SST_VDRTCTL3		0xaC
-
-/* VDRTCTL0 */
-#define SST_VDRTCL0_D3PGD		(1 << 0)
-#define SST_VDRTCL0_D3SRAMPGD		(1 << 1)
-#define SST_VDRTCL0_DSRAMPGE_SHIFT	12
-#define SST_VDRTCL0_DSRAMPGE_MASK	(0xfffff << SST_VDRTCL0_DSRAMPGE_SHIFT)
-#define SST_VDRTCL0_ISRAMPGE_SHIFT	2
-#define SST_VDRTCL0_ISRAMPGE_MASK	(0x3ff << SST_VDRTCL0_ISRAMPGE_SHIFT)
-
-/* VDRTCTL2 */
-#define SST_VDRTCL2_DCLCGE		(1 << 1)
-#define SST_VDRTCL2_DTCGE		(1 << 10)
-#define SST_VDRTCL2_APLLSE_MASK		(1 << 31)
-
-/* PMCS */
-#define SST_PMCS		0x84
-#define SST_PMCS_PS_MASK	0x3
 
 struct sst_dsp;
 
diff --git a/sound/soc/intel/common/sst-ipc.h b/sound/soc/intel/common/sst-ipc.h
index 9c1f59d88636..77d651e888f9 100644
--- a/sound/soc/intel/common/sst-ipc.h
+++ b/sound/soc/intel/common/sst-ipc.h
@@ -15,8 +15,6 @@
 #include <linux/workqueue.h>
 #include <linux/sched.h>
 
-#define IPC_MAX_MAILBOX_BYTES	256
-
 struct sst_ipc_message {
 	u64 header;
 	void *data;
-- 
2.17.1

