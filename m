Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 23836595980
	for <lists+alsa-devel@lfdr.de>; Tue, 16 Aug 2022 13:09:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B6E331674;
	Tue, 16 Aug 2022 13:08:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B6E331674
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1660648181;
	bh=d3d+nlhKuxZMjpExiSQXOJQRXtJy+TDAuRNRN5fT154=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oKazSW7jZBvftwby/ihlVbl0NZbFR1jneGNZaHCSpl13AnmxOsFXxwKzif0WcBHsF
	 kLR9wOgwNxWiE529D5sQr4Vuh2wobIe8ateWmVJNKpjyTF9PisoMPeXdw/mUICvB6a
	 2/dWlf8rcqOuFOJu9UfSAvj8pwJg3TekBGydQEV4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BBBAEF80563;
	Tue, 16 Aug 2022 13:07:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 72A2AF8055C; Tue, 16 Aug 2022 13:07:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 58979F80238
 for <alsa-devel@alsa-project.org>; Tue, 16 Aug 2022 13:07:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 58979F80238
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="AiosSXyg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1660648067; x=1692184067;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=d3d+nlhKuxZMjpExiSQXOJQRXtJy+TDAuRNRN5fT154=;
 b=AiosSXygk9oB0QcBD1ehYpHNc5x0bzaPh7DnSlIORdV02SjoFizzi4RU
 BcY++wmOMXEMFq3kekh/jzpkbTcng/SIB0JxZaTAcqd1R0Xkv+WEFr69J
 57hcBhGC6kP55eWUh8hRsVJ7nxOVg59a9JZ3E0BJUhyw2Xevn/piW8RJ0
 a7GrJEEO8XoIzRPgSftMZcQGpog3mVjThMEjq2Ptq/OJBsfvEmbP2eb1p
 fAWWh9QHqfCrR3ccQ4K2fvsp2tirgwd2SLa+VjOozRRjGmBWleZQi5bbp
 E0LnQO6ozgO06mEmIdSsDCTC2K0gmaIUMT95VFZCVmtp6eftGWrxH2e4f Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10440"; a="271960472"
X-IronPort-AV: E=Sophos;i="5.93,240,1654585200"; d="scan'208";a="271960472"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Aug 2022 04:07:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,240,1654585200"; d="scan'208";a="782986194"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by orsmga005.jf.intel.com with ESMTP; 16 Aug 2022 04:07:41 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org,
	tiwai@suse.com
Subject: [RESEND PATCH v2 5/6] ALSA: hda: Remove codec init and exit routines
Date: Tue, 16 Aug 2022 13:17:26 +0200
Message-Id: <20220816111727.3218543-6-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220816111727.3218543-1-cezary.rojewski@intel.com>
References: <20220816111727.3218543-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, kai.vehmanen@linux.intel.com,
 pierre-louis.bossart@linux.intel.com, hdegoede@redhat.com,
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

There are no users for snd_hdac_ext_bus_device_init() and
snd_hdac_ext_bus_device_exit().

While at it, remove hdac_to_hda_priv() too for the exact same reason.

Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 include/sound/hda_codec.h    |  2 --
 include/sound/hdaudio_ext.h  |  3 --
 sound/hda/ext/hdac_ext_bus.c | 53 ------------------------------------
 3 files changed, 58 deletions(-)

diff --git a/include/sound/hda_codec.h b/include/sound/hda_codec.h
index 6d3c82c4b6ac..2a8fe7240f10 100644
--- a/include/sound/hda_codec.h
+++ b/include/sound/hda_codec.h
@@ -293,8 +293,6 @@ struct hda_codec {
 #define dev_to_hda_codec(_dev)	container_of(_dev, struct hda_codec, core.dev)
 #define hda_codec_dev(_dev)	(&(_dev)->core.dev)
 
-#define hdac_to_hda_priv(_hdac) \
-			container_of(_hdac, struct hdac_hda_priv, codec.core)
 #define hdac_to_hda_codec(_hdac) container_of(_hdac, struct hda_codec, core)
 
 #define list_for_each_codec(c, bus) \
diff --git a/include/sound/hdaudio_ext.h b/include/sound/hdaudio_ext.h
index d26234f9ee46..88ebb64fd8a5 100644
--- a/include/sound/hdaudio_ext.h
+++ b/include/sound/hdaudio_ext.h
@@ -11,9 +11,6 @@ int snd_hdac_ext_bus_init(struct hdac_bus *bus, struct device *dev,
 		      const struct hdac_ext_bus_ops *ext_ops);
 
 void snd_hdac_ext_bus_exit(struct hdac_bus *bus);
-int snd_hdac_ext_bus_device_init(struct hdac_bus *bus, int addr,
-				struct hdac_device *hdev, int type);
-void snd_hdac_ext_bus_device_exit(struct hdac_device *hdev);
 void snd_hdac_ext_bus_device_remove(struct hdac_bus *bus);
 
 #define HDA_CODEC_REV_EXT_ENTRY(_vid, _rev, _name, drv_data) \
diff --git a/sound/hda/ext/hdac_ext_bus.c b/sound/hda/ext/hdac_ext_bus.c
index 765c40a6ccba..6004ea1c373e 100644
--- a/sound/hda/ext/hdac_ext_bus.c
+++ b/sound/hda/ext/hdac_ext_bus.c
@@ -60,59 +60,6 @@ void snd_hdac_ext_bus_exit(struct hdac_bus *bus)
 }
 EXPORT_SYMBOL_GPL(snd_hdac_ext_bus_exit);
 
-static void default_release(struct device *dev)
-{
-	snd_hdac_ext_bus_device_exit(dev_to_hdac_dev(dev));
-}
-
-/**
- * snd_hdac_ext_bus_device_init - initialize the HDA extended codec base device
- * @bus: hdac bus to attach to
- * @addr: codec address
- * @hdev: hdac device to init
- * @type: codec type (HDAC_DEV_*) to use for this device
- *
- * Returns zero for success or a negative error code.
- */
-int snd_hdac_ext_bus_device_init(struct hdac_bus *bus, int addr,
-				 struct hdac_device *hdev, int type)
-{
-	char name[15];
-	int ret;
-
-	hdev->bus = bus;
-
-	snprintf(name, sizeof(name), "ehdaudio%dD%d", bus->idx, addr);
-
-	ret  = snd_hdac_device_init(hdev, bus, name, addr);
-	if (ret < 0) {
-		dev_err(bus->dev, "device init failed for hdac device\n");
-		return ret;
-	}
-	hdev->type = type;
-	hdev->dev.release = default_release;
-
-	ret = snd_hdac_device_register(hdev);
-	if (ret) {
-		dev_err(bus->dev, "failed to register hdac device\n");
-		snd_hdac_ext_bus_device_exit(hdev);
-		return ret;
-	}
-
-	return 0;
-}
-EXPORT_SYMBOL_GPL(snd_hdac_ext_bus_device_init);
-
-/**
- * snd_hdac_ext_bus_device_exit - clean up a HD-audio extended codec base device
- * @hdev: hdac device to clean up
- */
-void snd_hdac_ext_bus_device_exit(struct hdac_device *hdev)
-{
-	snd_hdac_device_exit(hdev);
-}
-EXPORT_SYMBOL_GPL(snd_hdac_ext_bus_device_exit);
-
 /**
  * snd_hdac_ext_bus_device_remove - remove HD-audio extended codec base devices
  *
-- 
2.25.1

