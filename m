Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B89B4ABC94
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Feb 2022 12:49:21 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DB50C1663;
	Mon,  7 Feb 2022 12:48:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DB50C1663
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1644234560;
	bh=0r0xNEzSkirXFSBY7vrc6wveTYbRqbTjdzDULMG6hns=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=X4dw7s1mRs23+8IDWTpxm1jgxd9Dvm+Ap1eW25Joi37tSJGUqOqCM3aMorEd8uh3V
	 G8z3VYUNtxop+KBpoDpHKo7aVG27Zuvr+jKvbVkWujXbjBunpUzrDgnlsMFh0kR1Z4
	 WTrid2Bioyw0PyEz3X8r5TlrdMc7NGhRKsfA261w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D6BD6F80518;
	Mon,  7 Feb 2022 12:47:18 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 134EAF80240; Mon,  7 Feb 2022 12:47:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 27D92F80482
 for <alsa-devel@alsa-project.org>; Mon,  7 Feb 2022 12:47:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 27D92F80482
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="afGR6ylo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644234433; x=1675770433;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0r0xNEzSkirXFSBY7vrc6wveTYbRqbTjdzDULMG6hns=;
 b=afGR6yloRUTwedrbhHZZUv3DA7TPCbWEs7gda1X87HSEK+0nmnzERHxm
 2cb80zwFdX9AOlBP0FqN8ruQFT+LtWrhffz/u9Ky/TB6Sumb/0WQN01FQ
 QUlxBGXOMQyKfkIsapVwH0V3G+ky0Q4cwiXxeUqfd+ohqT5T3eyoSPpMC
 QlE68UFyUgaR+IxBYfPhNJlZfgBT7mB+ool3gbJYD+NZUwd8Ke4dN8HvN
 tJGjlgalzmLYKZ6YKdkXQA1N9nc4qEKRM4VUgnXvJfUqE6eV0FXzCsPr8
 gi3OyXvpflQ8j7FiXE2bmvwvd6hTd+rzzU4DXdPDomDRiUP/e/bNi3jqS A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10250"; a="273217770"
X-IronPort-AV: E=Sophos;i="5.88,349,1635231600"; d="scan'208";a="273217770"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2022 03:47:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,349,1635231600"; d="scan'208";a="484394971"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by orsmga006.jf.intel.com with ESMTP; 07 Feb 2022 03:47:08 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 4/4] ALSA: hda: Expose codec cleanup and power-save functions
Date: Mon,  7 Feb 2022 12:49:06 +0100
Message-Id: <20220207114906.3759800-5-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220207114906.3759800-1-cezary.rojewski@intel.com>
References: <20220207114906.3759800-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: pierre-louis.bossart@linux.intel.com,
 Cezary Rojewski <cezary.rojewski@intel.com>, upstream@semihalf.com,
 harshapriya.n@intel.com, rad@semihalf.com, tiwai@suse.com, hdegoede@redhat.com,
 broonie@kernel.org, cujomalainey@chromium.org, lma@semihalf.com
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
index f74abc13414f..77426ff58338 100644
--- a/include/sound/hda_codec.h
+++ b/include/sound/hda_codec.h
@@ -318,6 +318,7 @@ int snd_hda_codec_configure(struct hda_codec *codec);
 int snd_hda_codec_update_widgets(struct hda_codec *codec);
 void snd_hda_codec_register(struct hda_codec *codec);
 void snd_hda_codec_unregister(struct hda_codec *codec);
+void snd_hda_codec_cleanup_for_unbind(struct hda_codec *codec);
 
 /*
  * low level functions
@@ -496,9 +497,11 @@ int hda_call_check_power_status(struct hda_codec *codec, hda_nid_t nid)
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
index 4406b7983c07..34db37ce8847 100644
--- a/sound/pci/hda/hda_codec.c
+++ b/sound/pci/hda/hda_codec.c
@@ -766,6 +766,10 @@ static void codec_release_pcms(struct hda_codec *codec)
 	}
 }
 
+/**
+ * snd_hda_codec_cleanup_for_unbind - Prepare codec for removal
+ * @codec: codec device to cleanup
+ */
 void snd_hda_codec_cleanup_for_unbind(struct hda_codec *codec)
 {
 	if (codec->registered) {
@@ -3397,7 +3401,12 @@ int snd_hda_add_new_ctls(struct hda_codec *codec,
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
 
@@ -3415,6 +3424,7 @@ static void codec_set_power_save(struct hda_codec *codec, int delay)
 		pm_runtime_forbid(dev);
 	}
 }
+EXPORT_SYMBOL_GPL(snd_hda_codec_set_power_save);
 
 /**
  * snd_hda_set_power_save - reprogram autosuspend for the given delay
@@ -3428,7 +3438,7 @@ void snd_hda_set_power_save(struct hda_bus *bus, int delay)
 	struct hda_codec *c;
 
 	list_for_each_codec(c, bus)
-		codec_set_power_save(c, delay);
+		snd_hda_codec_set_power_save(c, delay);
 }
 EXPORT_SYMBOL_GPL(snd_hda_set_power_save);
 
diff --git a/sound/pci/hda/hda_local.h b/sound/pci/hda/hda_local.h
index 4c52dfb615bc..aca592651870 100644
--- a/sound/pci/hda/hda_local.h
+++ b/sound/pci/hda/hda_local.h
@@ -135,7 +135,6 @@ int __snd_hda_add_vmaster(struct hda_codec *codec, char *name,
 #define snd_hda_add_vmaster(codec, name, tlv, followers, suffix, access) \
 	__snd_hda_add_vmaster(codec, name, tlv, followers, suffix, true, access, NULL)
 int snd_hda_codec_reset(struct hda_codec *codec);
-void snd_hda_codec_cleanup_for_unbind(struct hda_codec *codec);
 void snd_hda_codec_disconnect_pcms(struct hda_codec *codec);
 
 #define snd_hda_regmap_sync(codec)	snd_hdac_regmap_sync(&(codec)->core)
-- 
2.25.1

