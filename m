Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B28BD7AE77A
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Sep 2023 10:08:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 58160A4B;
	Tue, 26 Sep 2023 10:07:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 58160A4B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695715724;
	bh=dW+0Xsvs1UO+t2lP9H35MKNo/FnHKTW1BoJ+80ysXyg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Yj6BcpawIOZcUmFvjQG03qt89dIn/d8euQ1T0Fsf6B9Q++izfBDBc7LrvrvzQQf2Z
	 0INUeZ3Lq5/mU+Rmh1GNuL1I6oQRsXseIm2KcyiIOmf+kLMGZOr6KX9JKYxsQziFkP
	 0swmZjryFEbfHJ1noRZUHDh7ngEV8KSdy621i7GE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0448FF80564; Tue, 26 Sep 2023 10:07:07 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 09670F8055B;
	Tue, 26 Sep 2023 10:07:07 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3F4B9F8047D; Tue, 26 Sep 2023 10:07:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 205FDF8001D
	for <alsa-devel@alsa-project.org>; Tue, 26 Sep 2023 10:06:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 205FDF8001D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=PUe4PbWI
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695715614; x=1727251614;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=dW+0Xsvs1UO+t2lP9H35MKNo/FnHKTW1BoJ+80ysXyg=;
  b=PUe4PbWI0BEMYvnO9yDoN242wqjeIwUlPlOJRKTlPdgpnikrK6Avy/9Z
   BEaEvGNw9ft4pEXWV5XFXaFxiFuYbu60o9cjMoqUiz0JySydgQA0VHUni
   QHLF724ZzeGzZspsMdWSDKgLEUe2AtrnEfvA+LhNtRjyIXTrxXasImNWl
   sL+JFBGidRd1r76jJ3x4nwhwv7nx12qwYcaAKgLo95pHk5OtPRocjNMfT
   YXe9EqpQJPoapCMSxDBpOrRyPpLpGlZgHlVVnHiQtOzdjUiA55rZaakBS
   RgOe7BsK24ISXXPTZw2Kl696PbB2WCzdqYEU5cjMr/+Zq4G8Wr7aRjwZo
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="360891404"
X-IronPort-AV: E=Sophos;i="6.03,177,1694761200";
   d="scan'208";a="360891404"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2023 01:06:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="725357971"
X-IronPort-AV: E=Sophos;i="6.03,177,1694761200";
   d="scan'208";a="725357971"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
  by orsmga006.jf.intel.com with ESMTP; 26 Sep 2023 01:06:47 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org,
	tiwai@suse.com
Cc: alsa-devel@alsa-project.org,
	perex@perex.cz,
	amadeuszx.slawinski@linux.intel.com,
	pierre-louis.bossart@linux.intel.com,
	hdegoede@redhat.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH v3 1/4] ALSA: hda: Poll SDxFIFOS after programming SDxFMT
Date: Tue, 26 Sep 2023 10:06:20 +0200
Message-Id: <20230926080623.43927-2-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230926080623.43927-1-cezary.rojewski@intel.com>
References: <20230926080623.43927-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: HJERA6MZL37IYIDAHSFHKS3YSIPFNLXX
X-Message-ID-Hash: HJERA6MZL37IYIDAHSFHKS3YSIPFNLXX
X-MailFrom: cezary.rojewski@intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HJERA6MZL37IYIDAHSFHKS3YSIPFNLXX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Software shall read SDxFIFOS calculated by the hardware and notify if
invalid value is programmed before continuing the stream preparation.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 include/sound/hda_register.h | 2 ++
 include/sound/hdaudio.h      | 3 +++
 sound/hda/hdac_stream.c      | 8 ++++++++
 3 files changed, 13 insertions(+)

diff --git a/include/sound/hda_register.h b/include/sound/hda_register.h
index 9c7872c0ca79..55958711d697 100644
--- a/include/sound/hda_register.h
+++ b/include/sound/hda_register.h
@@ -91,6 +91,8 @@ enum { SDI0, SDI1, SDI2, SDI3, SDO0, SDO1, SDO2, SDO3 };
 #define AZX_REG_SD_BDLPL		0x18
 #define AZX_REG_SD_BDLPU		0x1c
 
+#define AZX_SD_FIFOSIZE_MASK		GENMASK(15, 0)
+
 /* GTS registers */
 #define AZX_REG_LLCH			0x14
 
diff --git a/include/sound/hdaudio.h b/include/sound/hdaudio.h
index 32c59053b48e..41d725babf53 100644
--- a/include/sound/hdaudio.h
+++ b/include/sound/hdaudio.h
@@ -624,6 +624,9 @@ int snd_hdac_stream_set_lpib(struct hdac_stream *azx_dev, u32 value);
 #define snd_hdac_stream_readb_poll(dev, reg, val, cond, delay_us, timeout_us) \
 	read_poll_timeout_atomic(snd_hdac_reg_readb, val, cond, delay_us, timeout_us, \
 				 false, (dev)->bus, (dev)->sd_addr + AZX_REG_ ## reg)
+#define snd_hdac_stream_readw_poll(dev, reg, val, cond, delay_us, timeout_us) \
+	read_poll_timeout_atomic(snd_hdac_reg_readw, val, cond, delay_us, timeout_us, \
+				 false, (dev)->bus, (dev)->sd_addr + AZX_REG_ ## reg)
 #define snd_hdac_stream_readl_poll(dev, reg, val, cond, delay_us, timeout_us) \
 	read_poll_timeout_atomic(snd_hdac_reg_readl, val, cond, delay_us, timeout_us, \
 				 false, (dev)->bus, (dev)->sd_addr + AZX_REG_ ## reg)
diff --git a/sound/hda/hdac_stream.c b/sound/hda/hdac_stream.c
index 2633a4bb1d85..5382894bebab 100644
--- a/sound/hda/hdac_stream.c
+++ b/sound/hda/hdac_stream.c
@@ -258,6 +258,8 @@ int snd_hdac_stream_setup(struct hdac_stream *azx_dev)
 	struct hdac_bus *bus = azx_dev->bus;
 	struct snd_pcm_runtime *runtime;
 	unsigned int val;
+	u16 reg;
+	int ret;
 
 	if (azx_dev->substream)
 		runtime = azx_dev->substream->runtime;
@@ -300,6 +302,12 @@ int snd_hdac_stream_setup(struct hdac_stream *azx_dev)
 	/* set the interrupt enable bits in the descriptor control register */
 	snd_hdac_stream_updatel(azx_dev, SD_CTL, 0, SD_INT_MASK);
 
+	/* Once SDxFMT is set, the controller programs SDxFIFOS to non-zero value. */
+	ret = snd_hdac_stream_readw_poll(azx_dev, SD_FIFOSIZE, reg, reg & AZX_SD_FIFOSIZE_MASK,
+					 3, 300);
+	if (ret)
+		dev_dbg(bus->dev, "polling SD_FIFOSIZE 0x%04x failed: %d\n",
+			AZX_REG_SD_FIFOSIZE, ret);
 	azx_dev->fifo_size = snd_hdac_stream_readw(azx_dev, SD_FIFOSIZE) + 1;
 
 	/* when LPIB delay correction gives a small negative value,
-- 
2.25.1

