Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CCDB34D3B1A
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Mar 2022 21:31:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5C754173A;
	Wed,  9 Mar 2022 21:31:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5C754173A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646857912;
	bh=X4E26zBkroNegIzEIjaPSfcHUNmeq2dapb2aZCcX6lA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=V+9xztUUf6TiSfOyApwW4MSoA5OY05KZqMqt/Um2XbZtQ/m1N+Ujm8iZB5vpmZBDL
	 BH8uxZJlyNxMJ8N2rPbTriOXvbjcYEwItjVOdWHLaFpZY/p8WGc6y3Zl092xDvXzG/
	 ys8uZxy5HpM7crcOMrn19SNrsPL71YZKwwPOmpq8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 77031F80516;
	Wed,  9 Mar 2022 21:30:12 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 61B6BF8012F; Wed,  9 Mar 2022 21:30:09 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 43236F80155
 for <alsa-devel@alsa-project.org>; Wed,  9 Mar 2022 21:30:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 43236F80155
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="lB5fPVPl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646857802; x=1678393802;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=X4E26zBkroNegIzEIjaPSfcHUNmeq2dapb2aZCcX6lA=;
 b=lB5fPVPlm5/UOW1ylHmedztJluND9tiU9wYZvTO6TfIyBMQg0pWXGRHQ
 Dn4jg4CU66KC8RN4yDP3oQe6h1pFp/cTLWKlS7g8KqGXTNgGxef5PFl6S
 q9hsi3AO/K5TKHZCRbXDbsv+CIlFofsjUDwuw5Adzp+grzIS6frU75G6X
 s+n4W4Z8gdf700mqz3BxDA0sT8MU6PQTfHpH+6uZ1kcOmmpfZeT+K8OEM
 bi7YzDEwXGQEx7SmrNiGlB3kFZdnIq3b1J3l08cK4jFxcz0WSnqge4N2x
 II2NFzR5/OtLmouG1KaUkkEVba8J1Sakya4EQptzWd49jv725YzeVstaf Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10281"; a="255028659"
X-IronPort-AV: E=Sophos;i="5.90,168,1643702400"; d="scan'208";a="255028659"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2022 12:29:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,168,1643702400"; d="scan'208";a="578526920"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by orsmga001.jf.intel.com with ESMTP; 09 Mar 2022 12:29:55 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v4 01/17] ALSA: hda: Add helper macros for DSP capable devices
Date: Wed,  9 Mar 2022 21:40:13 +0100
Message-Id: <20220309204029.89040-2-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220309204029.89040-1-cezary.rojewski@intel.com>
References: <20220309204029.89040-1-cezary.rojewski@intel.com>
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
 include/sound/hdaudio.h     |  2 ++
 include/sound/hdaudio_ext.h | 50 +++++++++++++++++++++++++++++++++++++
 2 files changed, 52 insertions(+)

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

