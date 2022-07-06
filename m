Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E7F9D568760
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Jul 2022 13:55:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 89E5316F7;
	Wed,  6 Jul 2022 13:54:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 89E5316F7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657108504;
	bh=V/NEJiSKyl2dZbJEEGzCFIniY3CIOqOoa980IyjNtQc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rvqnZ+z5kTcbuKU3JKAKetyDWD3jz9Sa8FTTorYQTG4GAb9ZOZrdh9fgsK0uRaZDV
	 ejoaO4+zzaIL2gK9HUsZxre+wLtqPDeIDM5CejlvipBWBg1j6MdS2T4rnXKdi6WjXu
	 /XLV1zJC7+e0rIPXw0JATK/DLxI+e3sYsMqxsP+o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 56372F80558;
	Wed,  6 Jul 2022 13:52:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3811CF80558; Wed,  6 Jul 2022 13:52:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5B6A2F80104
 for <alsa-devel@alsa-project.org>; Wed,  6 Jul 2022 13:52:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5B6A2F80104
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="DaISjZa0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657108365; x=1688644365;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=V/NEJiSKyl2dZbJEEGzCFIniY3CIOqOoa980IyjNtQc=;
 b=DaISjZa01sqoEMqUyeZpee+ka05Io4L2VP/HP3pww3OtKGs9Dzroa4fc
 a2QWNq/DO777OjOv4kq3B+PbX0Albp6cSHV6EoVKM/PNy4jgpmGTL1pkR
 vwKitA6u6BGNoR4RYinXsRK2wRR9pNYU1qpcrXoumimeRQjD3MxsfgDq3
 uvOEFVnH+FzOjfONyqwOkNbfQj3eXfHaAwRPagbaDXZJlRZWOJwzNY8Xc
 xDtEPKZTf6TKM6pAyCKCTNjSag2qqJpSe2OvE8hdJxx2I3wVdrYEY0KHV
 KtdOuR37owu1uskLZOkqSQ5waBjEBZwSJaCwJnxmu7MqqB0r3ixhBXj5C A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10399"; a="370042630"
X-IronPort-AV: E=Sophos;i="5.92,249,1650956400"; d="scan'208";a="370042630"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2022 04:52:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,249,1650956400"; d="scan'208";a="920136284"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by fmsmga005.fm.intel.com with ESMTP; 06 Jul 2022 04:52:41 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org,
	tiwai@suse.com
Subject: [PATCH 5/9] ALSA: hda: Skip event processing for unregistered codecs
Date: Wed,  6 Jul 2022 14:02:26 +0200
Message-Id: <20220706120230.427296-6-cezary.rojewski@intel.com>
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

When codec is unbound but not yet removed, in the eyes of
snd_hdac_bus_process_unsol_events() it is still a valid target to
delegate work to. Such behaviour may lead to use-after-free errors.
Address by verifying if codec is actually registered.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 include/sound/hda_codec.h |  1 -
 include/sound/hdaudio.h   |  1 +
 sound/hda/hdac_bus.c      |  2 +-
 sound/pci/hda/hda_codec.c | 10 +++++-----
 sound/soc/codecs/hda.c    |  4 ++--
 5 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/include/sound/hda_codec.h b/include/sound/hda_codec.h
index b7be300b6b18..6d3c82c4b6ac 100644
--- a/include/sound/hda_codec.h
+++ b/include/sound/hda_codec.h
@@ -231,7 +231,6 @@ struct hda_codec {
 	/* misc flags */
 	unsigned int configured:1; /* codec was configured */
 	unsigned int in_freeing:1; /* being released */
-	unsigned int registered:1; /* codec was registered */
 	unsigned int display_power_control:1; /* needs display power */
 	unsigned int spdif_status_reset :1; /* needs to toggle SPDIF for each
 					     * status change
diff --git a/include/sound/hdaudio.h b/include/sound/hdaudio.h
index 15f15075238d..797bf67a164d 100644
--- a/include/sound/hdaudio.h
+++ b/include/sound/hdaudio.h
@@ -93,6 +93,7 @@ struct hdac_device {
 	bool lazy_cache:1;	/* don't wake up for writes */
 	bool caps_overwriting:1; /* caps overwrite being in process */
 	bool cache_coef:1;	/* cache COEF read/write too */
+	unsigned int registered:1; /* codec was registered */
 };
 
 /* device/driver type used for matching */
diff --git a/sound/hda/hdac_bus.c b/sound/hda/hdac_bus.c
index 71db8592b33d..d497414a5538 100644
--- a/sound/hda/hdac_bus.c
+++ b/sound/hda/hdac_bus.c
@@ -183,7 +183,7 @@ static void snd_hdac_bus_process_unsol_events(struct work_struct *work)
 		if (!(caddr & (1 << 4))) /* no unsolicited event? */
 			continue;
 		codec = bus->caddr_tbl[caddr & 0x0f];
-		if (!codec || !codec->dev.driver)
+		if (!codec || !codec->registered)
 			continue;
 		spin_unlock_irq(&bus->reg_lock);
 		drv = drv_to_hdac_driver(codec->dev.driver);
diff --git a/sound/pci/hda/hda_codec.c b/sound/pci/hda/hda_codec.c
index 2381aced492f..75e85bf58681 100644
--- a/sound/pci/hda/hda_codec.c
+++ b/sound/pci/hda/hda_codec.c
@@ -772,11 +772,11 @@ static void codec_release_pcms(struct hda_codec *codec)
  */
 void snd_hda_codec_cleanup_for_unbind(struct hda_codec *codec)
 {
-	if (codec->registered) {
+	if (codec->core.registered) {
 		/* pm_runtime_put() is called in snd_hdac_device_exit() */
 		pm_runtime_get_noresume(hda_codec_dev(codec));
 		pm_runtime_disable(hda_codec_dev(codec));
-		codec->registered = 0;
+		codec->core.registered = 0;
 	}
 
 	snd_hda_codec_disconnect_pcms(codec);
@@ -824,14 +824,14 @@ void snd_hda_codec_display_power(struct hda_codec *codec, bool enable)
  */
 void snd_hda_codec_register(struct hda_codec *codec)
 {
-	if (codec->registered)
+	if (codec->core.registered)
 		return;
 	if (device_is_registered(hda_codec_dev(codec))) {
 		snd_hda_codec_display_power(codec, true);
 		pm_runtime_enable(hda_codec_dev(codec));
 		/* it was powered up in snd_hda_codec_new(), now all done */
 		snd_hda_power_down(codec);
-		codec->registered = 1;
+		codec->core.registered = 1;
 	}
 }
 EXPORT_SYMBOL_GPL(snd_hda_codec_register);
@@ -3047,7 +3047,7 @@ void snd_hda_codec_shutdown(struct hda_codec *codec)
 	struct hda_pcm *cpcm;
 
 	/* Skip the shutdown if codec is not registered */
-	if (!codec->registered)
+	if (!codec->core.registered)
 		return;
 
 	cancel_delayed_work_sync(&codec->jackpoll_work);
diff --git a/sound/soc/codecs/hda.c b/sound/soc/codecs/hda.c
index edcb8bc6806b..ad20a3dff9b7 100644
--- a/sound/soc/codecs/hda.c
+++ b/sound/soc/codecs/hda.c
@@ -274,7 +274,7 @@ static void hda_codec_remove(struct snd_soc_component *component)
 	struct hdac_device *hdev = &codec->core;
 	struct hdac_bus *bus = hdev->bus;
 	struct hdac_ext_link *hlink;
-	bool was_registered = codec->registered;
+	bool was_registered = codec->core.registered;
 
 	/* Don't allow any more runtime suspends */
 	pm_runtime_forbid(&hdev->dev);
@@ -376,7 +376,7 @@ static int hda_hdev_detach(struct hdac_device *hdev)
 {
 	struct hda_codec *codec = dev_to_hda_codec(&hdev->dev);
 
-	if (codec->registered)
+	if (codec->core.registered)
 		cancel_delayed_work_sync(&codec->jackpoll_work);
 
 	snd_soc_unregister_component(&hdev->dev);
-- 
2.25.1

