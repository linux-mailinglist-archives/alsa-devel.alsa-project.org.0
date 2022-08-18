Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 888C359858D
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Aug 2022 16:16:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2AFB2167E;
	Thu, 18 Aug 2022 16:15:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2AFB2167E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1660832182;
	bh=kzzNDnHHoacYqckwuIDXKHWBTJTer+bxj1MMqeY0Ku8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KGzByXTtXWsg9JwxQQPB9SRZO4Qrv8v/cZymEan3yLKBQ/8bsthHxjkm7VE27wmrZ
	 iDk4CHo675W8wPbGyBD6Ysi/VQvj/nzbw68K0i/aPNnGyJGiE1qN29uvMKBz1+wBSj
	 0X8in9TGmUUxpLEqZcYDN3TvbTwAMgsLcb2SIZRc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9C461F800EE;
	Thu, 18 Aug 2022 16:14:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9C23EF80495; Thu, 18 Aug 2022 16:14:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1C21FF800E9
 for <alsa-devel@alsa-project.org>; Thu, 18 Aug 2022 16:14:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1C21FF800E9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="J4WxeJJA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1660832092; x=1692368092;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=kzzNDnHHoacYqckwuIDXKHWBTJTer+bxj1MMqeY0Ku8=;
 b=J4WxeJJA/oJ5ATcdrgGHV4XUINN3qmj5pnByGxDDnT6dI5gCmBgwq28z
 N4YEhOveIdtR24C9qXF0m4aKPsOBS8aUUCDtIKSjHMSEYdRVhMfaD/2dv
 ohWmnEW+sZRGImWqlH5XJVrnbtB7plKjqAJ9K6WZ99Exbl9ggAO9U8tL6
 YTvdhRiE5CeZNs3fBz1nDzWJEeyIo3ToMHxjVfzIaWdeU86B0WuEmRm7+
 0EbSu+kAomZc02If8dhpk+HJOl0jSmk2h+d5dvyzGLbTzvRlWksfE7h7Y
 Uw7Zz2EWfM/LOF2tzKKLH32nGJ/OE2PN7yCDPiWYqOwl1LwEm9VG0bzIn w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10443"; a="292764744"
X-IronPort-AV: E=Sophos;i="5.93,246,1654585200"; d="scan'208";a="292764744"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2022 07:14:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,246,1654585200"; d="scan'208";a="584222226"
Received: from dev2.igk.intel.com ([10.237.148.94])
 by orsmga006.jf.intel.com with ESMTP; 18 Aug 2022 07:14:43 -0700
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
To: Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org
Subject: [PATCH v2 1/4] ALSA: hda: Move stream-register polling macros
Date: Thu, 18 Aug 2022 16:15:14 +0200
Message-Id: <20220818141517.109280-2-amadeuszx.slawinski@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220818141517.109280-1-amadeuszx.slawinski@linux.intel.com>
References: <20220818141517.109280-1-amadeuszx.slawinski@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, linux-kernel@vger.kernel.org,
 =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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

Polling stream registers doesn't really have anything to do with
extended HDA registers, so move it to basic HDA header. This will allow
for use in HDA framework.

Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
---
 include/sound/hdaudio.h     | 7 +++++++
 include/sound/hdaudio_ext.h | 6 ------
 2 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/include/sound/hdaudio.h b/include/sound/hdaudio.h
index 797bf67a164d..6e74aeafeda4 100644
--- a/include/sound/hdaudio.h
+++ b/include/sound/hdaudio.h
@@ -10,6 +10,7 @@
 #include <linux/interrupt.h>
 #include <linux/io.h>
 #include <linux/io-64-nonatomic-lo-hi.h>
+#include <linux/iopoll.h>
 #include <linux/pm_runtime.h>
 #include <linux/timecounter.h>
 #include <sound/core.h>
@@ -589,6 +590,12 @@ int snd_hdac_get_stream_stripe_ctl(struct hdac_bus *bus,
 	snd_hdac_reg_readw((dev)->bus, (dev)->sd_addr + AZX_REG_ ## reg)
 #define snd_hdac_stream_readb(dev, reg) \
 	snd_hdac_reg_readb((dev)->bus, (dev)->sd_addr + AZX_REG_ ## reg)
+#define snd_hdac_stream_readb_poll(dev, reg, val, cond, delay_us, timeout_us) \
+	readb_poll_timeout((dev)->sd_addr + AZX_REG_ ## reg, val, cond, \
+			   delay_us, timeout_us)
+#define snd_hdac_stream_readl_poll(dev, reg, val, cond, delay_us, timeout_us) \
+	readl_poll_timeout((dev)->sd_addr + AZX_REG_ ## reg, val, cond, \
+			   delay_us, timeout_us)
 
 /* update a register, pass without AZX_REG_ prefix */
 #define snd_hdac_stream_updatel(dev, reg, mask, val) \
diff --git a/include/sound/hdaudio_ext.h b/include/sound/hdaudio_ext.h
index d26234f9ee46..03634ea198d0 100644
--- a/include/sound/hdaudio_ext.h
+++ b/include/sound/hdaudio_ext.h
@@ -188,12 +188,6 @@ void snd_hdac_ext_bus_link_power(struct hdac_device *codec, bool enable);
 #define snd_hdac_adsp_readq_poll(chip, reg, val, cond, delay_us, timeout_us) \
 	readq_poll_timeout((chip)->dsp_ba + (reg), val, cond, \
 			   delay_us, timeout_us)
-#define snd_hdac_stream_readb_poll(strm, reg, val, cond, delay_us, timeout_us) \
-	readb_poll_timeout((strm)->sd_addr + AZX_REG_ ## reg, val, cond, \
-			   delay_us, timeout_us)
-#define snd_hdac_stream_readl_poll(strm, reg, val, cond, delay_us, timeout_us) \
-	readl_poll_timeout((strm)->sd_addr + AZX_REG_ ## reg, val, cond, \
-			   delay_us, timeout_us)
 
 struct hdac_ext_device;
 
-- 
2.25.1

