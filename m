Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DB17846D1C5
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Dec 2021 12:13:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9BF14232C;
	Wed,  8 Dec 2021 12:12:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9BF14232C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638962015;
	bh=NFynsp0qFdEoVcSPQUB1vC1EDjskbXJF8VuPYmcq+BY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rxfTmHeq3byOl30tLAa29AlBH8rR3SAMab7cZMsQNeYFiUEMhA7Ar70DfZKfD45bO
	 vg5VxQn6cgeRFedpRMaAN5cFNsmivxZsX7LodGN8f1vNmmBNWIMNcyqrd7nHTOWzM7
	 rtwrE6OuKhvrdl7BB3I/H9Q2HtZYVxPObWAkGQe4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EFA6AF80508;
	Wed,  8 Dec 2021 12:11:12 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3111CF80506; Wed,  8 Dec 2021 12:11:09 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 22F1DF804F3
 for <alsa-devel@alsa-project.org>; Wed,  8 Dec 2021 12:11:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 22F1DF804F3
X-IronPort-AV: E=McAfee;i="6200,9189,10191"; a="301192816"
X-IronPort-AV: E=Sophos;i="5.87,297,1631602800"; d="scan'208";a="301192816"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2021 03:11:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,297,1631602800"; d="scan'208";a="600600086"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by FMSMGA003.fm.intel.com with ESMTP; 08 Dec 2021 03:10:59 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org
Subject: [RFC 04/37] ALSA: hda: Expose codec cleanup and power-save functions
Date: Wed,  8 Dec 2021 12:12:28 +0100
Message-Id: <20211208111301.1817725-5-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211208111301.1817725-1-cezary.rojewski@intel.com>
References: <20211208111301.1817725-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, upstream@semihalf.com,
 harshapriya.n@intel.com, yung-chuan.liao@linux.intel.com, rad@semihalf.com,
 pierre-louis.bossart@linux.intel.com, tiwai@suse.com, hdegoede@redhat.com,
 broonie@kernel.org, ranjani.sridharan@linux.intel.com,
 amadeuszx.slawinski@linux.intel.com, cujomalainey@chromium.org,
 peter.ujfalusi@linux.intel.com, lma@semihalf.com
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

With few changes, snd_hda_codec_set_power_save() and
snd_hda_codec_cleanup_for_unbind() can be re-used by ASoC drivers.
While at it, provide kernel doc for the exposed functions.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 include/sound/hda_codec.h |  3 +++
 sound/pci/hda/hda_codec.c | 14 ++++++++++++--
 sound/pci/hda/hda_local.h |  1 -
 3 files changed, 15 insertions(+), 3 deletions(-)

diff --git a/include/sound/hda_codec.h b/include/sound/hda_codec.h
index e1a65d529e00..d70af1a809b2 100644
--- a/include/sound/hda_codec.h
+++ b/include/sound/hda_codec.h
@@ -316,6 +316,7 @@ int snd_hda_codec_configure(struct hda_codec *codec);
 int snd_hda_codec_update_widgets(struct hda_codec *codec);
 void snd_hda_codec_register(struct hda_codec *codec);
 void snd_hda_codec_unregister(struct hda_codec *codec);
+void snd_hda_codec_cleanup_for_unbind(struct hda_codec *codec);
 
 /*
  * low level functions
@@ -494,9 +495,11 @@ int hda_call_check_power_status(struct hda_codec *codec, hda_nid_t nid)
 #define snd_hda_power_down(codec)	snd_hdac_power_down(&(codec)->core)
 #define snd_hda_power_down_pm(codec)	snd_hdac_power_down_pm(&(codec)->core)
 #ifdef CONFIG_PM
+void snd_hda_codec_set_power_save(struct hda_codec *codec, int delay);
 void snd_hda_set_power_save(struct hda_bus *bus, int delay);
 void snd_hda_update_power_acct(struct hda_codec *codec);
 #else
+static inline void snd_hda_codec_set_power_save(struct hda_codec *codec, int delay) {}
 static inline void snd_hda_set_power_save(struct hda_bus *bus, int delay) {}
 #endif
 
diff --git a/sound/pci/hda/hda_codec.c b/sound/pci/hda/hda_codec.c
index f89ac0aece97..2e69f570f9ee 100644
--- a/sound/pci/hda/hda_codec.c
+++ b/sound/pci/hda/hda_codec.c
@@ -760,6 +760,10 @@ static void codec_release_pcms(struct hda_codec *codec)
 	}
 }
 
+/**
+ * snd_hda_codec_cleanup_for_unbind - Prepare codec for removal
+ * @codec: codec device to cleanup
+ */
 void snd_hda_codec_cleanup_for_unbind(struct hda_codec *codec)
 {
 	if (codec->registered) {
@@ -3385,7 +3389,12 @@ int snd_hda_add_new_ctls(struct hda_codec *codec,
 EXPORT_SYMBOL_GPL(snd_hda_add_new_ctls);
 
 #ifdef CONFIG_PM
-static void codec_set_power_save(struct hda_codec *codec, int delay)
+/**
+ * snd_hda_codec_set_power_save - Configure codec's runtime PM
+ * @codec: codec device to configure
+ * @delay: autosuspend delay
+ */
+void snd_hda_codec_set_power_save(struct hda_codec *codec, int delay)
 {
 	struct device *dev = hda_codec_dev(codec);
 
@@ -3403,6 +3412,7 @@ static void codec_set_power_save(struct hda_codec *codec, int delay)
 		pm_runtime_forbid(dev);
 	}
 }
+EXPORT_SYMBOL_GPL(snd_hda_codec_set_power_save);
 
 /**
  * snd_hda_set_power_save - reprogram autosuspend for the given delay
@@ -3416,7 +3426,7 @@ void snd_hda_set_power_save(struct hda_bus *bus, int delay)
 	struct hda_codec *c;
 
 	list_for_each_codec(c, bus)
-		codec_set_power_save(c, delay);
+		snd_hda_codec_set_power_save(c, delay);
 }
 EXPORT_SYMBOL_GPL(snd_hda_set_power_save);
 
diff --git a/sound/pci/hda/hda_local.h b/sound/pci/hda/hda_local.h
index 8d47d3679c10..541ee8a3d9dd 100644
--- a/sound/pci/hda/hda_local.h
+++ b/sound/pci/hda/hda_local.h
@@ -135,7 +135,6 @@ int __snd_hda_add_vmaster(struct hda_codec *codec, char *name,
 #define snd_hda_add_vmaster(codec, name, tlv, followers, suffix, access) \
 	__snd_hda_add_vmaster(codec, name, tlv, followers, suffix, true, access, NULL)
 int snd_hda_codec_reset(struct hda_codec *codec);
-void snd_hda_codec_cleanup_for_unbind(struct hda_codec *codec);
 
 #define snd_hda_regmap_sync(codec)	snd_hdac_regmap_sync(&(codec)->core)
 
-- 
2.25.1

