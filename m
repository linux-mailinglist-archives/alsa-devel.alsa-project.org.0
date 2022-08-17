Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 771DB596F45
	for <lists+alsa-devel@lfdr.de>; Wed, 17 Aug 2022 15:13:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 61C98165D;
	Wed, 17 Aug 2022 15:12:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 61C98165D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1660741983;
	bh=PQrMNQ/yvxjBTfA2wtMDXqk4o7bSOW6yITOwfe9v8m4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=L/1zq0e1RpuRzDQ5C2h7aEEh9FI3DyJmQWKppGbblI+AjTS6vbeyAUiCfklZj/HmV
	 7FD3qcfbQZgyjLI5/7LsIBKenu7p96bmlbKYE1ncwMfa9xopZkuVbmMz8TDCAxO/qn
	 ll92B6ZTEuKdqyHlJz+kbBdcZz/UU4Q7jMATXWEY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C6EF1F8053E;
	Wed, 17 Aug 2022 15:11:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 83A55F8054A; Wed, 17 Aug 2022 15:11:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F193DF80237
 for <alsa-devel@alsa-project.org>; Wed, 17 Aug 2022 15:11:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F193DF80237
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="IzvNGOFy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1660741877; x=1692277877;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=PQrMNQ/yvxjBTfA2wtMDXqk4o7bSOW6yITOwfe9v8m4=;
 b=IzvNGOFys4ctHDg78NqwXtQ95vnhY5Ccv15h1OGqIsAn1mRJ6rZCBmgz
 pYqqQVJt0YEOO4Wvu05YVnsJOkkcaFdmKZT+FQzaqK40GDrE2vrlumay7
 b2xI72zHucf5hWDhxVC675xQBXp3gWDxaczjHgtZ+N10Fe9WH759mcYho
 6HN7aR/7Fzq04g2QqYnfaF3aF7d4Z0M8W5V79zs/um7+GscnYpwi4Gfj/
 ApNUdaD8i9o1u55MkK/WvT4DtqCvIkuUVMqeCStip7jp7Sds3oxUDdChP
 1nj+sd/LveEsgenV8dnUAUu8DnIwUkWLjlX2T8WjxsHCFa0lkdCr9eV/x A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10442"; a="318496072"
X-IronPort-AV: E=Sophos;i="5.93,243,1654585200"; d="scan'208";a="318496072"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2022 06:11:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,243,1654585200"; d="scan'208";a="667609948"
Received: from dev2 (HELO DEV2.igk.intel.com) ([10.237.148.94])
 by fmsmga008.fm.intel.com with ESMTP; 17 Aug 2022 06:11:09 -0700
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
To: Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org
Subject: [PATCH 1/4] ALSA: hda: Move stream-register polling macros
Date: Wed, 17 Aug 2022 15:11:34 +0200
Message-Id: <20220817131137.3978523-2-amadeuszx.slawinski@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220817131137.3978523-1-amadeuszx.slawinski@linux.intel.com>
References: <20220817131137.3978523-1-amadeuszx.slawinski@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>, linux-kernel@vger.kernel.org,
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

Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
---
 include/sound/hdaudio.h     | 6 ++++++
 include/sound/hdaudio_ext.h | 6 ------
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/include/sound/hdaudio.h b/include/sound/hdaudio.h
index 797bf67a164d..a46708b2d8ea 100644
--- a/include/sound/hdaudio.h
+++ b/include/sound/hdaudio.h
@@ -589,6 +589,12 @@ int snd_hdac_get_stream_stripe_ctl(struct hdac_bus *bus,
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

