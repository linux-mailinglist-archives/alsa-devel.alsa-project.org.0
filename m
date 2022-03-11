Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 074134D6494
	for <lists+alsa-devel@lfdr.de>; Fri, 11 Mar 2022 16:29:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 88E5B1898;
	Fri, 11 Mar 2022 16:28:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 88E5B1898
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1647012569;
	bh=KpsYCV7vAG4YS1bmK2oruwec5Ls5RXdjG3BZ7BFkqKc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=M3lMetJKXWK5f6KmrQQKv2vyF0EcgIaXu2+iOVy/gQ90htmwvUqN9X6iYurXulAAP
	 c7B6UH2olJYqnvRtvfniKSxLIs0N5FokW9SpUB7q9ciwKTOdhaOFLJaH22Ql36hbea
	 5TRlYxSDI+Mvgro3xdmnnQC4j6Pju4ZtKbKU6cOA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8D141F80227;
	Fri, 11 Mar 2022 16:27:50 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 87346F8012C; Fri, 11 Mar 2022 16:27:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id ED9ACF801D8
 for <alsa-devel@alsa-project.org>; Fri, 11 Mar 2022 16:27:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ED9ACF801D8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="IMNuuSqU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647012463; x=1678548463;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=KpsYCV7vAG4YS1bmK2oruwec5Ls5RXdjG3BZ7BFkqKc=;
 b=IMNuuSqU3Rhjp6EbEucYbI7LbFtK8u7UkibYV2gIlOSFG2C6UiPDxZZ6
 EpxVfNfEALzXWpWq+phlfz+u4XVwO5A8k8ESDbut/ZMz5zYPe3aQijfCT
 8ilASRmwBoAFLEayQF0p6HxWroo7b9OXok9fX88O1bHSa7Lm+B6YrPAVB
 MpuVwagqmTxxor6hMYEA25Aor4JM2nQQNp2E0yivQW1UeUjqTKYWdlXS9
 Cb2K+aOkgR/sZU5wcPhJ5NEoWM92VoE84bJ5SEZBhQ3IVu9RGhiqupkHS
 vFK8f8lgRkOQTSqlN4zhlxEc0HNGB6qoM6sZ/s8eQ97Lkc20e5q6+XetH w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10282"; a="318813292"
X-IronPort-AV: E=Sophos;i="5.90,174,1643702400"; d="scan'208";a="318813292"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2022 07:27:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,174,1643702400"; d="scan'208";a="514532703"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by orsmga006.jf.intel.com with ESMTP; 11 Mar 2022 07:27:35 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v5 01/17] ALSA: hda: Add helper macros for DSP capable devices
Date: Fri, 11 Mar 2022 16:35:28 +0100
Message-Id: <20220311153544.136854-2-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220311153544.136854-1-cezary.rojewski@intel.com>
References: <20220311153544.136854-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, rad@semihalf.com,
 upstream@semihalf.com, harshapriya.n@intel.com, tiwai@suse.com,
 pierre-louis.bossart@linux.intel.com, hdegoede@redhat.com, broonie@kernel.org,
 ranjani.sridharan@linux.intel.com, amadeuszx.slawinski@linux.intel.com,
 cujomalainey@chromium.org, lma@semihalf.com
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

HDAudio drivers make heavy use of I/O operations. Declare a range of
update, read and write helpers similar to those available for HDAudio
legacy driver. These macros are used by AVS driver to improve code
readability.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 include/sound/hdaudio.h     |  3 +++
 include/sound/hdaudio_ext.h | 50 +++++++++++++++++++++++++++++++++++++
 2 files changed, 53 insertions(+)

diff --git a/include/sound/hdaudio.h b/include/sound/hdaudio.h
index 6a90ce405e60..15f15075238d 100644
--- a/include/sound/hdaudio.h
+++ b/include/sound/hdaudio.h
@@ -9,6 +9,7 @@
 #include <linux/device.h>
 #include <linux/interrupt.h>
 #include <linux/io.h>
+#include <linux/io-64-nonatomic-lo-hi.h>
 #include <linux/pm_runtime.h>
 #include <linux/timecounter.h>
 #include <sound/core.h>
@@ -448,6 +449,8 @@ static inline u16 snd_hdac_reg_readw(struct hdac_bus *bus, void __iomem *addr)
 
 #define snd_hdac_reg_writel(bus, addr, val)	writel(val, addr)
 #define snd_hdac_reg_readl(bus, addr)	readl(addr)
+#define snd_hdac_reg_writeq(bus, addr, val)	writeq(val, addr)
+#define snd_hdac_reg_readq(bus, addr)		readq(addr)
 
 /*
  * macros for easy use
diff --git a/include/sound/hdaudio_ext.h b/include/sound/hdaudio_ext.h
index b0c8e4936168..d26234f9ee46 100644
--- a/include/sound/hdaudio_ext.h
+++ b/include/sound/hdaudio_ext.h
@@ -2,6 +2,8 @@
 #ifndef __SOUND_HDAUDIO_EXT_H
 #define __SOUND_HDAUDIO_EXT_H
 
+#include <linux/io-64-nonatomic-lo-hi.h>
+#include <linux/iopoll.h>
 #include <sound/hdaudio.h>
 
 int snd_hdac_ext_bus_init(struct hdac_bus *bus, struct device *dev,
@@ -144,6 +146,54 @@ void snd_hdac_ext_bus_link_power(struct hdac_device *codec, bool enable);
 	writew(((readw(addr + reg) & ~(mask)) | (val)), \
 		addr + reg)
 
+#define snd_hdac_adsp_writeb(chip, reg, value) \
+	snd_hdac_reg_writeb(chip, (chip)->dsp_ba + (reg), value)
+#define snd_hdac_adsp_readb(chip, reg) \
+	snd_hdac_reg_readb(chip, (chip)->dsp_ba + (reg))
+#define snd_hdac_adsp_writew(chip, reg, value) \
+	snd_hdac_reg_writew(chip, (chip)->dsp_ba + (reg), value)
+#define snd_hdac_adsp_readw(chip, reg) \
+	snd_hdac_reg_readw(chip, (chip)->dsp_ba + (reg))
+#define snd_hdac_adsp_writel(chip, reg, value) \
+	snd_hdac_reg_writel(chip, (chip)->dsp_ba + (reg), value)
+#define snd_hdac_adsp_readl(chip, reg) \
+	snd_hdac_reg_readl(chip, (chip)->dsp_ba + (reg))
+#define snd_hdac_adsp_writeq(chip, reg, value) \
+	snd_hdac_reg_writeq(chip, (chip)->dsp_ba + (reg), value)
+#define snd_hdac_adsp_readq(chip, reg) \
+	snd_hdac_reg_readq(chip, (chip)->dsp_ba + (reg))
+
+#define snd_hdac_adsp_updateb(chip, reg, mask, val) \
+	snd_hdac_adsp_writeb(chip, reg, \
+			(snd_hdac_adsp_readb(chip, reg) & ~(mask)) | (val))
+#define snd_hdac_adsp_updatew(chip, reg, mask, val) \
+	snd_hdac_adsp_writew(chip, reg, \
+			(snd_hdac_adsp_readw(chip, reg) & ~(mask)) | (val))
+#define snd_hdac_adsp_updatel(chip, reg, mask, val) \
+	snd_hdac_adsp_writel(chip, reg, \
+			(snd_hdac_adsp_readl(chip, reg) & ~(mask)) | (val))
+#define snd_hdac_adsp_updateq(chip, reg, mask, val) \
+	snd_hdac_adsp_writeq(chip, reg, \
+			(snd_hdac_adsp_readq(chip, reg) & ~(mask)) | (val))
+
+#define snd_hdac_adsp_readb_poll(chip, reg, val, cond, delay_us, timeout_us) \
+	readb_poll_timeout((chip)->dsp_ba + (reg), val, cond, \
+			   delay_us, timeout_us)
+#define snd_hdac_adsp_readw_poll(chip, reg, val, cond, delay_us, timeout_us) \
+	readw_poll_timeout((chip)->dsp_ba + (reg), val, cond, \
+			   delay_us, timeout_us)
+#define snd_hdac_adsp_readl_poll(chip, reg, val, cond, delay_us, timeout_us) \
+	readl_poll_timeout((chip)->dsp_ba + (reg), val, cond, \
+			   delay_us, timeout_us)
+#define snd_hdac_adsp_readq_poll(chip, reg, val, cond, delay_us, timeout_us) \
+	readq_poll_timeout((chip)->dsp_ba + (reg), val, cond, \
+			   delay_us, timeout_us)
+#define snd_hdac_stream_readb_poll(strm, reg, val, cond, delay_us, timeout_us) \
+	readb_poll_timeout((strm)->sd_addr + AZX_REG_ ## reg, val, cond, \
+			   delay_us, timeout_us)
+#define snd_hdac_stream_readl_poll(strm, reg, val, cond, delay_us, timeout_us) \
+	readl_poll_timeout((strm)->sd_addr + AZX_REG_ ## reg, val, cond, \
+			   delay_us, timeout_us)
 
 struct hdac_ext_device;
 
-- 
2.25.1

