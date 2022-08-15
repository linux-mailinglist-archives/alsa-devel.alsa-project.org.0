Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 50A48593415
	for <lists+alsa-devel@lfdr.de>; Mon, 15 Aug 2022 19:35:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D49EF1632;
	Mon, 15 Aug 2022 19:34:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D49EF1632
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1660584926;
	bh=d3d+nlhKuxZMjpExiSQXOJQRXtJy+TDAuRNRN5fT154=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OOmIVZkxRYFfusY9X8IEyMuD7YcaWNWgxItCL9r3ZE6Nc3pbYibRM+YI4HhE2yIoA
	 pKcrQlrdgM2sOdJNbBvve2lNcTDx7o/u60rHE8jBbDxvLj5Uc75fo3dnyQF8QbxYv9
	 OCTw2/pBffBMl9NYWzCNEZnoZSIO71T4hqYxlYJ0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4D5A9F80557;
	Mon, 15 Aug 2022 19:33:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7E097F80557; Mon, 15 Aug 2022 19:33:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DC37AF804FD
 for <alsa-devel@alsa-project.org>; Mon, 15 Aug 2022 19:33:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DC37AF804FD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="PogTtYG2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1660584810; x=1692120810;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=d3d+nlhKuxZMjpExiSQXOJQRXtJy+TDAuRNRN5fT154=;
 b=PogTtYG2SFIfCzYMXhg0ePG6mbIuNycOzXm1zIOGeGiT2ZGa4d3BFXw1
 7TYXMN43Xc/xjyh1Ls+zkhIK4tFCwZX/qM7rZpiPhRyCw7STS3PpoAcDF
 A3M/i6dqcq7EDjvTWYlVW38BoskNGpbHAWHJraQilfuOdiFobEpiP7cj7
 q4Yc8DZpUtAUAUZp6XXt3Xf0KJoBfOU27i5T0Onv6g4MlEYtdZcXaVnAs
 HoJZ5/7kKe7MFnvCGTHr6KTWCev4EJ24155Ta7+mPhd5rPrhBV4sk10J9
 v62PbJK9pfrNvUc0BtM87txgzPXCIX5x21pMAEVyus1DAfHBnbm1++oLA A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10440"; a="356024297"
X-IronPort-AV: E=Sophos;i="5.93,238,1654585200"; d="scan'208";a="356024297"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Aug 2022 10:33:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,238,1654585200"; d="scan'208";a="696049388"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by FMSMGA003.fm.intel.com with ESMTP; 15 Aug 2022 10:33:26 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org,
	tiwai@suse.com
Subject: [PATCH v2 5/6] ALSA: hda: Remove codec init and exit routines
Date: Mon, 15 Aug 2022 19:42:26 +0200
Message-Id: <20220815174227.3071323-6-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220815174227.3071323-1-cezary.rojewski@intel.com>
References: <20220815174227.3071323-1-cezary.rojewski@intel.com>
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

