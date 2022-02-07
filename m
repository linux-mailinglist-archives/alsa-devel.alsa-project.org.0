Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D5E7F4ABE86
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Feb 2022 13:23:17 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6D7BA16CD;
	Mon,  7 Feb 2022 13:22:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6D7BA16CD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1644236597;
	bh=B3iuVHD/ExtqUuCka0n3IvpOkFyl+AQEuEUjValvk1g=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CTcp4iMWLlNZHAyHggdVGkJZNHj5qwIK70MI7CN4UdrLWwHS3h+1NPxQdJl+wTDuT
	 +l/butB3sdKX6qxMj4J750ajN+mOBqarrkUqZtTi6KNzONsyIRt4hHP4klgKJ2yo8V
	 dEmY1xzfqtaCP78zQEgALE7BKt8SAwQ/oOQfqfRM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CF9CEF80559;
	Mon,  7 Feb 2022 13:19:52 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F2CF6F8051F; Mon,  7 Feb 2022 13:19:40 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7EA84F8023B
 for <alsa-devel@alsa-project.org>; Mon,  7 Feb 2022 13:19:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7EA84F8023B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="TbXPXZk6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644236374; x=1675772374;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=B3iuVHD/ExtqUuCka0n3IvpOkFyl+AQEuEUjValvk1g=;
 b=TbXPXZk6paZ4yW7+5DglC+WnQ5JvepNLgOqJBtWZdF7S6P9VjChupqEO
 w4fJ4z1N5mZ1w5Rmyn5L2PxtVxA1IRgs2zl2LUJlSy773ioQrjYaymbQm
 Zn0Iwujzs6OuPpihVxi478IGp5e95Ad4KMbxU1k9L+dJGJhDPaM7U2/Nu
 a63nrDXeJCRXIkX8sGCf8u+dykvTjts+RkciJbMP48LM+yAJI7nAenpcG
 p6eAwP5FfxoSupL/SwLmh4TaK9FAIx4Qw0oojYqAQbhKTNoivDCtUYGL9
 wnyRA0G8q02sETS6N2P56zAPwZJycnOU+VFzi7EY5IdRHlpYx/4oBYhAx A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10250"; a="248914778"
X-IronPort-AV: E=Sophos;i="5.88,349,1635231600"; d="scan'208";a="248914778"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2022 04:18:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,349,1635231600"; d="scan'208";a="525112398"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by orsmga007.jf.intel.com with ESMTP; 07 Feb 2022 04:18:51 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 01/17] ALSA: hda: Add helper macros for DSP capable devices
Date: Mon,  7 Feb 2022 13:20:52 +0100
Message-Id: <20220207122108.3780926-2-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220207122108.3780926-1-cezary.rojewski@intel.com>
References: <20220207122108.3780926-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, rad@semihalf.com,
 upstream@semihalf.com, harshapriya.n@intel.com, tiwai@suse.com,
 pierre-louis.bossart@linux.intel.com, hdegoede@redhat.com, broonie@kernel.org,
 amadeuszx.slawinski@linux.intel.com, cujomalainey@chromium.org,
 lma@semihalf.com
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
 include/sound/hdaudio.h     |  2 ++
 include/sound/hdaudio_ext.h | 49 +++++++++++++++++++++++++++++++++++++
 2 files changed, 51 insertions(+)

diff --git a/include/sound/hdaudio.h b/include/sound/hdaudio.h
index 6a90ce405e60..69907260b9ce 100644
--- a/include/sound/hdaudio.h
+++ b/include/sound/hdaudio.h
@@ -448,6 +448,8 @@ static inline u16 snd_hdac_reg_readw(struct hdac_bus *bus, void __iomem *addr)
 
 #define snd_hdac_reg_writel(bus, addr, val)	writel(val, addr)
 #define snd_hdac_reg_readl(bus, addr)	readl(addr)
+#define snd_hdac_reg_writeq(bus, addr, val)	writeq(val, addr)
+#define snd_hdac_reg_readq(bus, addr)		readq(addr)
 
 /*
  * macros for easy use
diff --git a/include/sound/hdaudio_ext.h b/include/sound/hdaudio_ext.h
index b0c8e4936168..8c06c4a3bcd2 100644
--- a/include/sound/hdaudio_ext.h
+++ b/include/sound/hdaudio_ext.h
@@ -2,6 +2,7 @@
 #ifndef __SOUND_HDAUDIO_EXT_H
 #define __SOUND_HDAUDIO_EXT_H
 
+#include <linux/iopoll.h>
 #include <sound/hdaudio.h>
 
 int snd_hdac_ext_bus_init(struct hdac_bus *bus, struct device *dev,
@@ -144,6 +145,54 @@ void snd_hdac_ext_bus_link_power(struct hdac_device *codec, bool enable);
 	writew(((readw(addr + reg) & ~(mask)) | (val)), \
 		addr + reg)
 
+#define snd_hdac_adsp_writeb(chip, reg, value) \
+	snd_hdac_reg_writeb(chip, (chip)->adsp_ba + (reg), value)
+#define snd_hdac_adsp_readb(chip, reg) \
+	snd_hdac_reg_readb(chip, (chip)->adsp_ba + (reg))
+#define snd_hdac_adsp_writew(chip, reg, value) \
+	snd_hdac_reg_writew(chip, (chip)->adsp_ba + (reg), value)
+#define snd_hdac_adsp_readw(chip, reg) \
+	snd_hdac_reg_readw(chip, (chip)->adsp_ba + (reg))
+#define snd_hdac_adsp_writel(chip, reg, value) \
+	snd_hdac_reg_writel(chip, (chip)->adsp_ba + (reg), value)
+#define snd_hdac_adsp_readl(chip, reg) \
+	snd_hdac_reg_readl(chip, (chip)->adsp_ba + (reg))
+#define snd_hdac_adsp_writeq(chip, reg, value) \
+	snd_hdac_reg_writeq(chip, (chip)->adsp_ba + (reg), value)
+#define snd_hdac_adsp_readq(chip, reg) \
+	snd_hdac_reg_readq(chip, (chip)->adsp_ba + (reg))
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
+	readb_poll_timeout((chip)->adsp_ba + (reg), val, cond, \
+			   delay_us, timeout_us)
+#define snd_hdac_adsp_readw_poll(chip, reg, val, cond, delay_us, timeout_us) \
+	readw_poll_timeout((chip)->adsp_ba + (reg), val, cond, \
+			   delay_us, timeout_us)
+#define snd_hdac_adsp_readl_poll(chip, reg, val, cond, delay_us, timeout_us) \
+	readl_poll_timeout((chip)->adsp_ba + (reg), val, cond, \
+			   delay_us, timeout_us)
+#define snd_hdac_adsp_readq_poll(chip, reg, val, cond, delay_us, timeout_us) \
+	readq_poll_timeout((chip)->adsp_ba + (reg), val, cond, \
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

