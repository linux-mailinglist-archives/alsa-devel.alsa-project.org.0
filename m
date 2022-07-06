Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A909A568770
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Jul 2022 13:56:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4573216F0;
	Wed,  6 Jul 2022 13:55:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4573216F0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657108565;
	bh=0QRNt+1qf6ahxvwm4IA9D0yF6GEVpZjS+dnXOeTslDg=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XIzO9BPXCq8wgRu/SAdd1e6dtyO/9iyL7SqUz/cyUYk2qmiK8TzI61POOD1MlQJ+T
	 Blt+4QAoEQawFJ9e1VuizEE/mc/znZMg3QHFXO1VkklOwFeUnjAu6rPA1fKjnWa4zz
	 6waq4J8o55Yl6qMiesNxx2uAfNfTUJcclSE/rNTs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 92C3BF80578;
	Wed,  6 Jul 2022 13:52:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 60F8CF80557; Wed,  6 Jul 2022 13:52:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 86381F8053A
 for <alsa-devel@alsa-project.org>; Wed,  6 Jul 2022 13:52:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 86381F8053A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="mFP/GQDk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657108369; x=1688644369;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0QRNt+1qf6ahxvwm4IA9D0yF6GEVpZjS+dnXOeTslDg=;
 b=mFP/GQDk5ArrATTH9YRwmAffOi/kRGn+wum9ygVnLILdQG45JeqfdGGN
 WEacB/tct7cFXneLtSjf1EG2cw6df48q7+2MCf6sElxaN9450Kw+i/op7
 oS71ryPaoFZz36GZDRpwPxQkny6LJZi7ilzHMXj+xqLT27HH5x4HUX6zb
 +eOkj2qZKP8jG+37S0Cq2lL7FbsItcUPSpRQrjmi8dXRYHe+r5K4UlcTS
 VyWmIMKFBpvWjh8CA/zQbR8MYfrRYR5HlxwAGUJXwjEAGKiX73nO8q0WB
 Hqnhcdo/DZYFmLMLkbUVhWudCItYXbrixgoUpnRlB1O3dOFPlCHOjSiCy A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10399"; a="370042626"
X-IronPort-AV: E=Sophos;i="5.92,249,1650956400"; d="scan'208";a="370042626"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2022 04:52:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,249,1650956400"; d="scan'208";a="920136275"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by fmsmga005.fm.intel.com with ESMTP; 06 Jul 2022 04:52:39 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org,
	tiwai@suse.com
Subject: [PATCH 4/9] ALSA: hda: Fix put_device() inconsistency in error path
Date: Wed,  6 Jul 2022 14:02:25 +0200
Message-Id: <20220706120230.427296-5-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220706120230.427296-1-cezary.rojewski@intel.com>
References: <20220706120230.427296-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 pierre-louis.bossart@linux.intel.com, hdegoede@redhat.com, broonie@kernel.org,
 amadeuszx.slawinski@linux.intel.com
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

AVS HDAudio bus driver does not tie with codec drivers tighly. Codec
device and its respective driver cleanup procedures are split and may
not occur one after the other. Device cleanup is performed only on
snd_hdac_ext_bus_device_remove() i.e. it's the bus driver's
responsibility. If codec component probing fails, put_device() found in
snd_hda_codec_device_new() may lead to page fault. Relocate it to
snd_hda_codec_new() to address the problem on ASoC side while keeping
status quo for snd_hda_intel.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/pci/hda/hda_codec.c | 23 +++++++++++------------
 1 file changed, 11 insertions(+), 12 deletions(-)

diff --git a/sound/pci/hda/hda_codec.c b/sound/pci/hda/hda_codec.c
index 83d954ab056f..2381aced492f 100644
--- a/sound/pci/hda/hda_codec.c
+++ b/sound/pci/hda/hda_codec.c
@@ -949,6 +949,7 @@ int snd_hda_codec_new(struct hda_bus *bus, struct snd_card *card,
 		      unsigned int codec_addr, struct hda_codec **codecp)
 {
 	struct hda_codec *codec;
+	int ret;
 
 	codec = snd_hda_codec_device_init(bus, codec_addr, "hdaudioC%dD%d",
 					  card->number, codec_addr);
@@ -956,7 +957,11 @@ int snd_hda_codec_new(struct hda_bus *bus, struct snd_card *card,
 		return PTR_ERR(codec);
 	*codecp = codec;
 
-	return snd_hda_codec_device_new(bus, card, codec_addr, *codecp, true);
+	ret = snd_hda_codec_device_new(bus, card, codec_addr, *codecp, true);
+	if (ret)
+		put_device(hda_codec_dev(*codecp));
+
+	return ret;
 }
 EXPORT_SYMBOL_GPL(snd_hda_codec_new);
 
@@ -1011,19 +1016,17 @@ int snd_hda_codec_device_new(struct hda_bus *bus, struct snd_card *card,
 
 	if (codec->bus->modelname) {
 		codec->modelname = kstrdup(codec->bus->modelname, GFP_KERNEL);
-		if (!codec->modelname) {
-			err = -ENOMEM;
-			goto error;
-		}
+		if (!codec->modelname)
+			return -ENOMEM;
 	}
 
 	fg = codec->core.afg ? codec->core.afg : codec->core.mfg;
 	err = read_widget_caps(codec, fg);
 	if (err < 0)
-		goto error;
+		return err;
 	err = read_pin_defaults(codec);
 	if (err < 0)
-		goto error;
+		return err;
 
 	/* power-up all before initialization */
 	hda_set_power_state(codec, AC_PWRST_D0);
@@ -1041,7 +1044,7 @@ int snd_hda_codec_device_new(struct hda_bus *bus, struct snd_card *card,
 		/* ASoC features component management instead */
 		err = snd_device_new(card, SNDRV_DEV_CODEC, codec, &dev_ops);
 		if (err < 0)
-			goto error;
+			return err;
 	}
 
 #ifdef CONFIG_PM
@@ -1054,10 +1057,6 @@ int snd_hda_codec_device_new(struct hda_bus *bus, struct snd_card *card,
 #endif
 
 	return 0;
-
- error:
-	put_device(hda_codec_dev(codec));
-	return err;
 }
 EXPORT_SYMBOL_GPL(snd_hda_codec_device_new);
 
-- 
2.25.1

