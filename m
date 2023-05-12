Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A386700E97
	for <lists+alsa-devel@lfdr.de>; Fri, 12 May 2023 20:20:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 90662EA1;
	Fri, 12 May 2023 20:19:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 90662EA1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683915635;
	bh=SWaT+KWK+gJznrJ1pm6i8Ht5XwCojfVtHHqDXSfbHj4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=T2sgQzdCNJMszvRlfqRTcQyxQnVnJ6RGNzvxXaM2sMsIO839a/jNVF8O57aq+T6cp
	 11Bis6paiK9noqYVIauIwIEtnNFJUANJ0zpYqTddRkh/5F6gw49Iw7RvDmzD9OP1MB
	 kTTvqcLVNXqKAdjWtiVOt6CPByn71l6O44M6PMXU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8DF47F805C6; Fri, 12 May 2023 20:18:02 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 25439F805C0;
	Fri, 12 May 2023 20:18:02 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 27871F80570; Fri, 12 May 2023 20:17:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 00614F80087
	for <alsa-devel@alsa-project.org>; Fri, 12 May 2023 20:17:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 00614F80087
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=I7wy0ymt
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683915461; x=1715451461;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=SWaT+KWK+gJznrJ1pm6i8Ht5XwCojfVtHHqDXSfbHj4=;
  b=I7wy0ymtZvS+Jc10FkTeme9PdCeDx111NcC19HzxDQ95DscHzYrmLe2x
   RM3PazwMsTwNxqcDfIY9TCZBdCWaXGfniFFt1jdphlYbVVfLA85pf4xNw
   wZUOtxwX8U0AcovnGNyGNroIV9K6IXg/a12rMZw+ZQPMS660C/p87tPHq
   maGN0TspMJ+fTD/Xq3TZVp4wIOJYettnBR8COr2C++pJ60I5rshBPPHtm
   cKxiFw7oC2r9AOiYDMdVMfRtCL0N7TKA/6VI2VdWR/89mPKhsAor7c+9Q
   T2uPJNgkXnS/ne+ScerPpBr7p/5VZpSjxhZbi+vBV+eE5mfzyI1I6coYo
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10708"; a="331223210"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200";
   d="scan'208";a="331223210"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2023 11:17:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10708"; a="769895076"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200";
   d="scan'208";a="769895076"
Received: from winkelru-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.144.249])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2023 11:17:17 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Cc: tiwai@suse.de,
	broonie@kernel.org,
	vkoul@kernel.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	=?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
	Rander Wang <rander.wang@intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>
Subject: [PATCH 4/9] ASoC: SOF: Intel: clarify initialization when
 HDA_AUDIO_CODEC is not used
Date: Fri, 12 May 2023 13:16:57 -0500
Message-Id: <20230512181702.117483-5-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230512181702.117483-1-pierre-louis.bossart@linux.intel.com>
References: <20230512181702.117483-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: OGM5TIPIHKATTVQEHYKYICACR54ZNNIA
X-Message-ID-Hash: OGM5TIPIHKATTVQEHYKYICACR54ZNNIA
X-MailFrom: pierre-louis.bossart@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OGM5TIPIHKATTVQEHYKYICACR54ZNNIA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

For LunarLake support, we need to enable HDA_LINK but we also want the
ability to remove HDaudio codec support, e.g. for 'nocodec'
tests. This requires a small change in the bus initialization without
any codec-specific callbacks provided.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/sof/intel/hda-bus.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/sound/soc/sof/intel/hda-bus.c b/sound/soc/sof/intel/hda-bus.c
index acb4b85868d0..fc63085d2d74 100644
--- a/sound/soc/sof/intel/hda-bus.c
+++ b/sound/soc/sof/intel/hda-bus.c
@@ -70,9 +70,14 @@ void sof_hda_bus_init(struct snd_sof_dev *sdev, struct device *dev)
 {
 	struct hdac_bus *bus = sof_to_bus(sdev);
 
+#if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA_LINK)
 #if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA_AUDIO_CODEC)
 	snd_hdac_ext_bus_init(bus, dev, &bus_core_ops, sof_hda_ext_ops);
-#else /* CONFIG_SND_SOC_SOF_HDA_AUDIO_CODEC */
+#else
+	snd_hdac_ext_bus_init(bus, dev, NULL, NULL);
+#endif
+#else
+
 	memset(bus, 0, sizeof(*bus));
 	bus->dev = dev;
 
@@ -87,12 +92,12 @@ void sof_hda_bus_init(struct snd_sof_dev *sdev, struct device *dev)
 	bus->idx = 0;
 
 	spin_lock_init(&bus->reg_lock);
-#endif /* CONFIG_SND_SOC_SOF_HDA_AUDIO_CODEC */
+#endif /* CONFIG_SND_SOC_SOF_HDA_LINK */
 }
 
 void sof_hda_bus_exit(struct snd_sof_dev *sdev)
 {
-#if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA_AUDIO_CODEC)
+#if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA_LINK)
 	struct hdac_bus *bus = sof_to_bus(sdev);
 
 	snd_hdac_ext_bus_exit(bus);
-- 
2.37.2

