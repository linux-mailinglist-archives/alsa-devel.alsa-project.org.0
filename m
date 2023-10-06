Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DE747BB544
	for <lists+alsa-devel@lfdr.de>; Fri,  6 Oct 2023 12:31:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7FFBA1DD;
	Fri,  6 Oct 2023 12:30:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7FFBA1DD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696588287;
	bh=9SrVGk6g1nbfT6wsUN27B2JivsI7Z4eq1gqv6H3cCeA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=fwgcHNKilI8DYyy5tWwhUtkdyRgi9qrMu14+vbvxAIwp2L0iWMI+9NDmIcnlGy6CU
	 WnO7IRhyKPt5fkoAqqztwgjXK8XnI4ARh4FIx5cmVAKBsL8qv0YR7Og/Ye7xecHyix
	 +PBbuyt9xkCXVFVLHKJko+BwVf+0xT6p9K+rGo1I=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 574FBF80568; Fri,  6 Oct 2023 12:29:47 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CCDFEF80552;
	Fri,  6 Oct 2023 12:29:46 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6329EF8047D; Fri,  6 Oct 2023 12:29:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2FB50F80310
	for <alsa-devel@alsa-project.org>; Fri,  6 Oct 2023 12:29:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2FB50F80310
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=c/5j+qlq
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696588180; x=1728124180;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=9SrVGk6g1nbfT6wsUN27B2JivsI7Z4eq1gqv6H3cCeA=;
  b=c/5j+qlqx2mbxfzpJPr6dqHHp6hIoQCcCmOt2ZQ7gWGG41KTnCwpGol0
   tHAPAIGXnVZv15rbz1vQsIWnaN/o+kEoZw0+YCnts3hphiwKTT+m4FCN2
   p22W4MBgmQKr+NNn5wnpwJvL/o+jxkytcv4spEPTq/W/t7uLF87imr5z1
   CzNDPtN1tl18flVND0WUy8hXpMoMLHDGPDtr/+a7fY6qrFz4dPXfcTRII
   za8cO6oMidJ5s4DWC1YtfVOSNJoownj049tPjskO5DC2restNHMDhdwaE
   yVsoTS093gDC10UiTbT0atmYRM9tpm8F4TgUqGO3yz4JkajtUT1T0UfrH
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="364002767"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200";
   d="scan'208";a="364002767"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2023 03:29:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="925928928"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200";
   d="scan'208";a="925928928"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
  by orsmga005.jf.intel.com with ESMTP; 06 Oct 2023 03:29:33 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: tiwai@suse.com
Cc: alsa-devel@alsa-project.org,
	broonie@kernel.org,
	perex@perex.cz,
	amadeuszx.slawinski@linux.intel.com,
	pierre-louis.bossart@linux.intel.com,
	hdegoede@redhat.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 2/3] ALSA: hda: Fix stream fifo_size initialization
Date: Fri,  6 Oct 2023 12:28:56 +0200
Message-Id: <20231006102857.749143-3-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231006102857.749143-1-cezary.rojewski@intel.com>
References: <20231006102857.749143-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: ZFOZ5SKYCYZME4AKJAATLK54FCC3HZIH
X-Message-ID-Hash: ZFOZ5SKYCYZME4AKJAATLK54FCC3HZIH
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZFOZ5SKYCYZME4AKJAATLK54FCC3HZIH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

SDxFIFOS register indicates the fifo size directly. There is no need to
modify the value after reading the register.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/hda/hdac_stream.c   | 2 +-
 sound/pci/hda/hda_intel.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/hda/hdac_stream.c b/sound/hda/hdac_stream.c
index a132108fba40..a784fd77cd4b 100644
--- a/sound/hda/hdac_stream.c
+++ b/sound/hda/hdac_stream.c
@@ -308,7 +308,7 @@ int snd_hdac_stream_setup(struct hdac_stream *azx_dev)
 	if (ret)
 		dev_dbg(bus->dev, "polling SD_FIFOSIZE 0x%04x failed: %d\n",
 			AZX_REG_SD_FIFOSIZE, ret);
-	azx_dev->fifo_size = snd_hdac_stream_readw(azx_dev, SD_FIFOSIZE) + 1;
+	azx_dev->fifo_size = snd_hdac_stream_readw(azx_dev, SD_FIFOSIZE);
 
 	/* when LPIB delay correction gives a small negative value,
 	 * we ignore it; currently set the threshold statically to
diff --git a/sound/pci/hda/hda_intel.c b/sound/pci/hda/hda_intel.c
index ca765ac4765f..e19274fd990d 100644
--- a/sound/pci/hda/hda_intel.c
+++ b/sound/pci/hda/hda_intel.c
@@ -806,7 +806,7 @@ static unsigned int azx_via_get_position(struct azx *chip,
 	mod_dma_pos = le32_to_cpu(*azx_dev->core.posbuf);
 	mod_dma_pos %= azx_dev->core.period_bytes;
 
-	fifo_size = azx_stream(azx_dev)->fifo_size - 1;
+	fifo_size = azx_stream(azx_dev)->fifo_size;
 
 	if (azx_dev->insufficient) {
 		/* Link position never gather than FIFO size */
-- 
2.25.1

