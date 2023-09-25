Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DBA8B7AD9F4
	for <lists+alsa-devel@lfdr.de>; Mon, 25 Sep 2023 16:18:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A3379DF9;
	Mon, 25 Sep 2023 16:17:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A3379DF9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695651529;
	bh=CulHCpIqq+8SqFZI6n0jd1wWfF3PVrQrXjcgxK1RioY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=qSgNj8NvT61ILlvSoCMuux7qXnM/kwUzg0/OLUS4PFZuUIwQU20Od3eiKN8jTet94
	 nYM5oIU38XXe0LcEStHdmQRkONHA8LykdOsjMFkqxVkXIlt+arYZdcst0Tkn1x0Fbd
	 WjvWFv3YpjfZQ67Dvy3R2wie4Ryt50PagBvoDaJo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A3F49F805BB; Mon, 25 Sep 2023 16:16:57 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1BF9AF805AD;
	Mon, 25 Sep 2023 16:16:57 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BE2C4F80587; Mon, 25 Sep 2023 16:16:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 659CDF8047D
	for <alsa-devel@alsa-project.org>; Mon, 25 Sep 2023 16:16:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 659CDF8047D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=VlMEGa4S
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695651383; x=1727187383;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=CulHCpIqq+8SqFZI6n0jd1wWfF3PVrQrXjcgxK1RioY=;
  b=VlMEGa4Svlne6t5PiF91Y6SEzFQtfcBgKAULTGkUsvHN0RIrn51Thi95
   qlM9H3ZAFqW/BVslzlkhV8WuzK5qGAvkeAhFqJo6/lgttKylpDkzzhqak
   FTAjfex1wNLxkfQNUmqnaatdoK/v7BE0DP7CmA3O6FsBKafcTstML9VYY
   EYH5m/Gkcoh1X5H3W/3/K6GtGORYZuedadn7Zp2EDQcm7IZvFRyW8rrYQ
   cZ18B9Ymh8ZYmjiQ11RbBZF1KFR6C3NWaPGUEmgVagLUlI9xvsWG+c3XH
   NAgKSENv4maEK6qwYyaTyWj9lGDMNHN4UcYtncz5XHL9qVBtb1jZzGs5v
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="361514156"
X-IronPort-AV: E=Sophos;i="6.03,175,1694761200";
   d="scan'208";a="361514156"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2023 07:07:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="783508185"
X-IronPort-AV: E=Sophos;i="6.03,175,1694761200";
   d="scan'208";a="783508185"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
  by orsmga001.jf.intel.com with ESMTP; 25 Sep 2023 07:07:33 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org,
	tiwai@suse.com
Cc: alsa-devel@alsa-project.org,
	perex@perex.cz,
	amadeuszx.slawinski@linux.intel.com,
	pierre-louis.bossart@linux.intel.com,
	hdegoede@redhat.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH v2 4/4] ASoC: Intel: Skylake: Use helper to setup HOST stream
Date: Mon, 25 Sep 2023 16:06:16 +0200
Message-Id: <20230925140616.26892-5-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230925140616.26892-1-cezary.rojewski@intel.com>
References: <20230925140616.26892-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: F6CBEC7ARZDJVKAFDVVER7XUCWPD6325
X-Message-ID-Hash: F6CBEC7ARZDJVKAFDVVER7XUCWPD6325
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/F6CBEC7ARZDJVKAFDVVER7XUCWPD6325/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

snd_hdac_ext_host_stream_setup() abstracts the procedure details away.
Simplify the code by using it.

Acked-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/skylake/skl-pcm.c | 14 +-------------
 1 file changed, 1 insertion(+), 13 deletions(-)

diff --git a/sound/soc/intel/skylake/skl-pcm.c b/sound/soc/intel/skylake/skl-pcm.c
index ac3dc8c63c26..7502b2e70e46 100644
--- a/sound/soc/intel/skylake/skl-pcm.c
+++ b/sound/soc/intel/skylake/skl-pcm.c
@@ -124,7 +124,6 @@ static void skl_set_suspend_active(struct snd_pcm_substream *substream,
 int skl_pcm_host_dma_prepare(struct device *dev, struct skl_pipe_params *params)
 {
 	struct hdac_bus *bus = dev_get_drvdata(dev);
-	struct skl_dev *skl = bus_to_skl(bus);
 	unsigned int format_val;
 	struct hdac_stream *hstream;
 	struct hdac_ext_stream *stream;
@@ -149,18 +148,7 @@ int skl_pcm_host_dma_prepare(struct device *dev, struct skl_pipe_params *params)
 	if (err < 0)
 		return err;
 
-	/*
-	 * The recommended SDxFMT programming sequence for BXT
-	 * platforms is to couple the stream before writing the format
-	 */
-	if (HDA_CONTROLLER_IS_APL(skl->pci)) {
-		snd_hdac_ext_stream_decouple(bus, stream, false);
-		err = snd_hdac_stream_setup(hdac_stream(stream));
-		snd_hdac_ext_stream_decouple(bus, stream, true);
-	} else {
-		err = snd_hdac_stream_setup(hdac_stream(stream));
-	}
-
+	err = snd_hdac_ext_host_stream_setup(stream);
 	if (err < 0)
 		return err;
 
-- 
2.25.1

