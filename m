Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BCCBD673C8A
	for <lists+alsa-devel@lfdr.de>; Thu, 19 Jan 2023 15:42:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 55F6980E5;
	Thu, 19 Jan 2023 15:41:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 55F6980E5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674139328;
	bh=yMS/v64YPCmiomY0+XdqIHOqN3HNABwIF6lwZwlDszc=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=AF/2EFPG8IprwAVWEiOfI/Qk64Af5QFarDqSR5JEKQf6/i799RSFFaeuUyqYHXZoN
	 HPRo//TQD0dsznILKFxhidBTtAwWbebIHAajy2jnFrqQhYT1RHPRsnYSvO3kHNcdHl
	 cxQC/vS5n3oFM4d8+U9rfU192y+AlIZnQyfhcQE8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9F9C9F80083;
	Thu, 19 Jan 2023 15:41:10 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B2BD3F8047B; Thu, 19 Jan 2023 15:41:09 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id ABE06F80083
 for <alsa-devel@alsa-project.org>; Thu, 19 Jan 2023 15:41:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ABE06F80083
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=Pjb+d7xC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674139261; x=1705675261;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=yMS/v64YPCmiomY0+XdqIHOqN3HNABwIF6lwZwlDszc=;
 b=Pjb+d7xCpjqqnzUwsrtf5HoWYt1GnEMFI6p31yy1rvpI1XkwqFCXnPvG
 6eJpciBVuWo3cHGLodOVapDIjHuyg5v5vwmXk6OzFVIsE30A5kbrYg1V3
 2Ap54fgWRN7kdLiZ/9nZYq7E2wqwBQV76jPjKBtnaNFcojmXikxe/LTxE
 S2badRrAu07w1wQt7+JFqnu0+5to1562Ih6GC8cnrZNBaOH2HIX+liOxw
 Z6yzcSUnL3k05LKfR5JKOmddYWBlTPteOmXvijDB0oOPehha6n8+h9DUv
 FLDOTAxRZAaMfRnZ9C4GQTe2Ezwt69DjtB7RrEQjOs36Vn13I2TzB7e8Z A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="327383548"
X-IronPort-AV: E=Sophos;i="5.97,229,1669104000"; d="scan'208";a="327383548"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2023 06:15:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="802643711"
X-IronPort-AV: E=Sophos;i="5.97,229,1669104000"; d="scan'208";a="802643711"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by fmsmga001.fm.intel.com with ESMTP; 19 Jan 2023 06:15:07 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org,
	tiwai@suse.com
Subject: [PATCH v2] ALSA: hda: Do not unset preset when cleaning up codec
Date: Thu, 19 Jan 2023 15:32:35 +0100
Message-Id: <20230119143235.1159814-1-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 pierre-louis.bossart@linux.intel.com, hdegoede@redhat.com, broonie@kernel.org,
 amadeuszx.slawinski@linux.intel.com
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Several functions that take part in codec's initialization and removal
are re-used by ASoC codec drivers implementations. Drivers mimic the
behavior of hda_codec_driver_probe/remove() found in
sound/pci/hda/hda_bind.c with their component->probe/remove() instead.

One of the reasons for that is the expectation of
snd_hda_codec_device_new() to receive a valid pointer to an instance of
struct snd_card. This expectation can be met only once sound card
components probing commences.

As ASoC sound card may be unbound without codec device being actually
removed from the system, unsetting ->preset in
snd_hda_codec_cleanup_for_unbind() interferes with module unload -> load
scenario causing null-ptr-deref. Preset is assigned only once, during
device/driver matching whereas ASoC codec driver's module reloading may
occur several times throughout the lifetime of an audio stack.

Suggested-by: Takashi Iwai <tiwai@suse.com>
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---

Changes in v2:
- relocated the operation to routines found in hda_bind.c rather than
  just removing it from the cleanup function


This is a continuation of a discussion that begun in the middle of 2022
[1] and was part of a larger series addressing several HDAudio topics.

Single rmmod on ASoC's codec driver module is enough to cause a panic.
Given our results, no regression shows up with modprobe/rmmod on
snd_hda_intel side with this patch applied.

[1]: https://lore.kernel.org/alsa-devel/20220706120230.427296-2-cezary.rojewski@intel.com/

 sound/pci/hda/hda_bind.c  | 2 ++
 sound/pci/hda/hda_codec.c | 1 -
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/pci/hda/hda_bind.c b/sound/pci/hda/hda_bind.c
index 1a868dd9dc4b..890c2f7c33fc 100644
--- a/sound/pci/hda/hda_bind.c
+++ b/sound/pci/hda/hda_bind.c
@@ -144,6 +144,7 @@ static int hda_codec_driver_probe(struct device *dev)
 
  error:
 	snd_hda_codec_cleanup_for_unbind(codec);
+	codec->preset = NULL;
 	return err;
 }
 
@@ -166,6 +167,7 @@ static int hda_codec_driver_remove(struct device *dev)
 	if (codec->patch_ops.free)
 		codec->patch_ops.free(codec);
 	snd_hda_codec_cleanup_for_unbind(codec);
+	codec->preset = NULL;
 	module_put(dev->driver->owner);
 	return 0;
 }
diff --git a/sound/pci/hda/hda_codec.c b/sound/pci/hda/hda_codec.c
index edd653ece70d..ac1cc7c5290e 100644
--- a/sound/pci/hda/hda_codec.c
+++ b/sound/pci/hda/hda_codec.c
@@ -795,7 +795,6 @@ void snd_hda_codec_cleanup_for_unbind(struct hda_codec *codec)
 	snd_array_free(&codec->cvt_setups);
 	snd_array_free(&codec->spdif_out);
 	snd_array_free(&codec->verbs);
-	codec->preset = NULL;
 	codec->follower_dig_outs = NULL;
 	codec->spdif_status_reset = 0;
 	snd_array_free(&codec->mixers);
-- 
2.25.1

