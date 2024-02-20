Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A78385BCDE
	for <lists+alsa-devel@lfdr.de>; Tue, 20 Feb 2024 14:09:17 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E81D9E68;
	Tue, 20 Feb 2024 14:09:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E81D9E68
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1708434557;
	bh=8J/HgzHneeq6wvYbjnE3J4qr3M2TYb2gypXj8kDuq9A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=SzWIPCa2/NEpT92B4LlGOLQnifAOsfmF2ygYXRLFwTjRwBE0bUB1d5sdbgQb6MNRQ
	 NPv2T200ZBgY/vX9/9/GZz+/7S0Css+ZmbxfDNxNpaC72PSoCBcxgKI5CYTKH/JtOq
	 1A6UYtUzAlDOZWZN+lW1j/i97jixJImqW0d5B+EM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DA5FBF80642; Tue, 20 Feb 2024 14:07:25 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2391DF8060B;
	Tue, 20 Feb 2024 14:07:20 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DCA42F80567; Tue, 20 Feb 2024 14:04:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,PDS_OTHER_BAD_TLD,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 561D0F80570
	for <alsa-devel@alsa-project.org>; Tue, 20 Feb 2024 14:03:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 561D0F80570
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=DMtwjCE3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708434227; x=1739970227;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=8J/HgzHneeq6wvYbjnE3J4qr3M2TYb2gypXj8kDuq9A=;
  b=DMtwjCE3yeTN4VFM/ZpsSYC7JCCSbfKUuXUEWbTezX3ttP6mXt86pnrg
   GwqfRVokAXLSxqJboUjVhqVGQDyQF8Hew2kmx40HfdGymWE3NqfZ4LVtW
   Df8SeqDH4dxjkLhi/C/aGA3MrYJXZk/LXGxG+jSnYYVuBePwn1x0BRl5t
   pSghVBPeeA2F1Ioffv6Sk4aHnSZwW1nae/2DvVjncim7TGyLKOemsW9mu
   wbo/87iOsc72RpJLOf81I0mDx9Nq0SAful/EPEmG2vTsBGe7QESEOh/K2
   /Iu+kGoTa1F89WMo/V4QBAajBBbfhuJOWEGP3WTaCgZbi/cAANXfHlDlZ
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10989"; a="2989013"
X-IronPort-AV: E=Sophos;i="6.06,172,1705392000";
   d="scan'208";a="2989013"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2024 03:49:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,172,1705392000";
   d="scan'208";a="4751051"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
  by fmviesa010.fm.intel.com with ESMTP; 20 Feb 2024 03:49:34 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	tiwai@suse.com,
	perex@perex.cz,
	amadeuszx.slawinski@linux.intel.com,
	pierre-louis.bossart@linux.intel.com,
	hdegoede@redhat.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 09/10] ASoC: Intel: avs: ICCMAX recommendations for ICL+
 platforms
Date: Tue, 20 Feb 2024 12:50:34 +0100
Message-Id: <20240220115035.770402-10-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240220115035.770402-1-cezary.rojewski@intel.com>
References: <20240220115035.770402-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: VGE37EJTDKJWRTTP7WG366CI76FIWCSU
X-Message-ID-Hash: VGE37EJTDKJWRTTP7WG366CI76FIWCSU
X-MailFrom: cezary.rojewski@intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VGE37EJTDKJWRTTP7WG366CI76FIWCSU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

For ICL+ platforms to avoid DMI/OPIO L1 entry during the base firmware
load procedure, HW recommends to set LTRP_GB to 95us and start an
additional CAPTURE stream in the background.

Once the load completes, original LTRP_GB value is restored and the
additional stream is released.

Reviewed-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 include/sound/hda_register.h |  2 ++
 sound/soc/intel/avs/avs.h    |  2 ++
 sound/soc/intel/avs/icl.c    | 62 +++++++++++++++++++++++++++++++++++-
 sound/soc/intel/avs/tgl.c    |  2 +-
 4 files changed, 66 insertions(+), 2 deletions(-)

diff --git a/include/sound/hda_register.h b/include/sound/hda_register.h
index 55958711d697..5ff31e6d41c1 100644
--- a/include/sound/hda_register.h
+++ b/include/sound/hda_register.h
@@ -131,6 +131,8 @@ enum { SDI0, SDI1, SDI2, SDI3, SDO0, SDO1, SDO2, SDO3 };
 #define AZX_REG_VS_SDXEFIFOS_XBASE	0x1094
 #define AZX_REG_VS_SDXEFIFOS_XINTERVAL	0x20
 
+#define AZX_REG_VS_LTRP_GB_MASK		GENMASK(6, 0)
+
 /* PCI space */
 #define AZX_PCIREG_TCSEL		0x44
 
diff --git a/sound/soc/intel/avs/avs.h b/sound/soc/intel/avs/avs.h
index 22bdb562dbc7..f80f79415344 100644
--- a/sound/soc/intel/avs/avs.h
+++ b/sound/soc/intel/avs/avs.h
@@ -325,6 +325,8 @@ int avs_hda_load_library(struct avs_dev *adev, struct firmware *lib, u32 id);
 int avs_hda_transfer_modules(struct avs_dev *adev, bool load,
 			     struct avs_module_entry *mods, u32 num_mods);
 
+int avs_icl_load_basefw(struct avs_dev *adev, struct firmware *fw);
+
 /* Soc component members */
 
 struct avs_soc_component {
diff --git a/sound/soc/intel/avs/icl.c b/sound/soc/intel/avs/icl.c
index 83ebee6f87ac..9d9921e1cd4d 100644
--- a/sound/soc/intel/avs/icl.c
+++ b/sound/soc/intel/avs/icl.c
@@ -7,9 +7,13 @@
 //
 
 #include <linux/slab.h>
+#include <sound/hdaudio.h>
+#include <sound/hdaudio_ext.h>
 #include "avs.h"
 #include "messages.h"
 
+#define ICL_VS_LTRP_GB_ICCMAX	95
+
 #ifdef CONFIG_DEBUG_FS
 int avs_icl_enable_logs(struct avs_dev *adev, enum avs_log_enable enable, u32 aging_period,
 			u32 fifo_full_period, unsigned long resource_mask, u32 *priorities)
@@ -118,6 +122,62 @@ int avs_icl_set_d0ix(struct avs_dev *adev, bool enable)
 	return AVS_IPC_RET(ret);
 }
 
+int avs_icl_load_basefw(struct avs_dev *adev, struct firmware *fw)
+{
+	struct hdac_bus *bus = &adev->base.core;
+	struct hdac_ext_stream *host_stream;
+	struct snd_pcm_substream substream;
+	struct snd_dma_buffer dmab;
+	unsigned int sd_fmt;
+	u8 ltrp_gb;
+	int ret;
+
+	/*
+	 * ICCMAX:
+	 *
+	 * For ICL+ platforms, as per HW recommendation LTRP_GB is set to 95us
+	 * during FW load. Its original value shall be restored once load completes.
+	 *
+	 * To avoid DMI/OPIO L1 entry during the load procedure, additional CAPTURE
+	 * stream is allocated and set to run.
+	 */
+
+	memset(&substream, 0, sizeof(substream));
+	substream.stream = SNDRV_PCM_STREAM_CAPTURE;
+
+	host_stream = snd_hdac_ext_stream_assign(bus, &substream, HDAC_EXT_STREAM_TYPE_HOST);
+	if (!host_stream)
+		return -EBUSY;
+
+	ltrp_gb = snd_hdac_chip_readb(bus, VS_LTRP) & AZX_REG_VS_LTRP_GB_MASK;
+	/* Carries no real data, use default format. */
+	sd_fmt = snd_hdac_stream_format(1, 32, 48000);
+
+	ret = snd_hdac_dsp_prepare(hdac_stream(host_stream), sd_fmt, fw->size, &dmab);
+	if (ret < 0)
+		goto release_stream;
+
+	snd_hdac_chip_updateb(bus, VS_LTRP, AZX_REG_VS_LTRP_GB_MASK, ICL_VS_LTRP_GB_ICCMAX);
+
+	spin_lock(&bus->reg_lock);
+	snd_hdac_stream_start(hdac_stream(host_stream));
+	spin_unlock(&bus->reg_lock);
+
+	ret = avs_hda_load_basefw(adev, fw);
+
+	spin_lock(&bus->reg_lock);
+	snd_hdac_stream_stop(hdac_stream(host_stream));
+	spin_unlock(&bus->reg_lock);
+
+	snd_hdac_dsp_cleanup(hdac_stream(host_stream), &dmab);
+
+release_stream:
+	snd_hdac_ext_stream_release(host_stream, HDAC_EXT_STREAM_TYPE_HOST);
+	snd_hdac_chip_updateb(bus, VS_LTRP, AZX_REG_VS_LTRP_GB_MASK, ltrp_gb);
+
+	return ret;
+}
+
 const struct avs_dsp_ops avs_icl_dsp_ops = {
 	.power = avs_dsp_core_power,
 	.reset = avs_dsp_core_reset,
@@ -125,7 +185,7 @@ const struct avs_dsp_ops avs_icl_dsp_ops = {
 	.irq_handler = avs_irq_handler,
 	.irq_thread = avs_cnl_irq_thread,
 	.int_control = avs_dsp_interrupt_control,
-	.load_basefw = avs_hda_load_basefw,
+	.load_basefw = avs_icl_load_basefw,
 	.load_lib = avs_hda_load_library,
 	.transfer_mods = avs_hda_transfer_modules,
 	.log_buffer_offset = avs_icl_log_buffer_offset,
diff --git a/sound/soc/intel/avs/tgl.c b/sound/soc/intel/avs/tgl.c
index 8abdff4fbb87..0e052e7f6bac 100644
--- a/sound/soc/intel/avs/tgl.c
+++ b/sound/soc/intel/avs/tgl.c
@@ -42,7 +42,7 @@ const struct avs_dsp_ops avs_tgl_dsp_ops = {
 	.irq_handler = avs_irq_handler,
 	.irq_thread = avs_cnl_irq_thread,
 	.int_control = avs_dsp_interrupt_control,
-	.load_basefw = avs_hda_load_basefw,
+	.load_basefw = avs_icl_load_basefw,
 	.load_lib = avs_hda_load_library,
 	.transfer_mods = avs_hda_transfer_modules,
 	.log_buffer_offset = avs_icl_log_buffer_offset,
-- 
2.25.1

