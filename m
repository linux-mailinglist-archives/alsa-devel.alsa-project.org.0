Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CB447AD9ED
	for <lists+alsa-devel@lfdr.de>; Mon, 25 Sep 2023 16:18:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9438EDF8;
	Mon, 25 Sep 2023 16:17:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9438EDF8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695651480;
	bh=dW+0Xsvs1UO+t2lP9H35MKNo/FnHKTW1BoJ+80ysXyg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=UtQE2zCzNpKa8Jlb0F0hY/StiRQsq8DbuVVxiODnt4vOvCHqUaRkYs2Rgc3qAGwvX
	 oUM8c8OKb8G5DQa2EK2yfA99XNuJ2plYAgM9W/xJnqXGx/2IIPtbu5JO5kcemrVRam
	 UQFQ3eS3jmR5lKCMS7XfltUIxrNd+Bg/rXXDDaNI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9C33CF80551; Mon, 25 Sep 2023 16:16:31 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 721C9F8055C;
	Mon, 25 Sep 2023 16:16:31 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1B866F80551; Mon, 25 Sep 2023 16:16:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5B9CCF800AE
	for <alsa-devel@alsa-project.org>; Mon, 25 Sep 2023 16:16:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5B9CCF800AE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=b+YxcCpb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695651381; x=1727187381;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=dW+0Xsvs1UO+t2lP9H35MKNo/FnHKTW1BoJ+80ysXyg=;
  b=b+YxcCpbf02WBt16ShV40xuw4x0uDVKSh1k5k9I4LAHudI3cBU8iyiqJ
   pu8aQ8gbuK3PjI/KkXvVZ6CjGP8kHNCTcpg5NzCiXEPSAXP+c9oPOeBKt
   iRi/SJWO6OvVuwRBDxLc1yJGCb1T6n2xF5k+MTl38eY7G4p0NUbeAbpU8
   ZKtAtrJ2DkLQTQf7QPqtb4/H6FSjMH5tdOq6JIEqeFHXxvtnjDEgXtib7
   GgjRY4UfQjrp11Diqb7zLpQmXE2xCII54wsZH063OeJMvrvU4fLeEGO13
   3yo5sGhVUmZSThSrTSVLAdDRU3nEWRZwGErc3B6oEOIWgHm2qlWRgECoC
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="361514120"
X-IronPort-AV: E=Sophos;i="6.03,175,1694761200";
   d="scan'208";a="361514120"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2023 07:07:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="783508154"
X-IronPort-AV: E=Sophos;i="6.03,175,1694761200";
   d="scan'208";a="783508154"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
  by orsmga001.jf.intel.com with ESMTP; 25 Sep 2023 07:07:25 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org,
	tiwai@suse.com
Cc: alsa-devel@alsa-project.org,
	perex@perex.cz,
	amadeuszx.slawinski@linux.intel.com,
	pierre-louis.bossart@linux.intel.com,
	hdegoede@redhat.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH v2 1/4] ALSA: hda: Poll SDxFIFOS after programming SDxFMT
Date: Mon, 25 Sep 2023 16:06:13 +0200
Message-Id: <20230925140616.26892-2-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230925140616.26892-1-cezary.rojewski@intel.com>
References: <20230925140616.26892-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: GYSLMAV37HBCPUEAVNGGKR4GMKOVDSLG
X-Message-ID-Hash: GYSLMAV37HBCPUEAVNGGKR4GMKOVDSLG
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GYSLMAV37HBCPUEAVNGGKR4GMKOVDSLG/>
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

