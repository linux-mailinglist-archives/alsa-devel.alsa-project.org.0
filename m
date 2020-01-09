Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D3CC2135515
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Jan 2020 10:03:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 66B871772;
	Thu,  9 Jan 2020 10:02:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 66B871772
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1578560607;
	bh=WAERjRAFx4Mx5nw7DGaUFNEbSWOkbipXHk6ToQHz35A=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=MhZyfh8jAo9TiBMq7DM2Rm3o3D7jtA1EC75hoRiAdFgLN3O/SvrJ3g3ibDt6BlxWk
	 egJmrEMOPcxy8Ij7BQ3fPnkuvFax6cXFO94yI+X9nzUO1T9KILlpMsckZaD+b22eBW
	 p+9REfleThcyd4aQV6UMpsqpj3cnk3tqHpi8F2+U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B0808F8015B;
	Thu,  9 Jan 2020 10:01:43 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 67C0DF8015B; Thu,  9 Jan 2020 10:01:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=PRX_BODY_30, RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 26151F80101
 for <alsa-devel@alsa-project.org>; Thu,  9 Jan 2020 10:01:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 26151F80101
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 0F88EBCC7;
 Thu,  9 Jan 2020 09:01:06 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Date: Thu,  9 Jan 2020 10:01:04 +0100
Message-Id: <20200109090104.26073-1-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
Cc: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Subject: [alsa-devel] [PATCH for-5.6] ALSA: hda: Manage concurrent reg
	access more properly
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

In the commit 8e85def5723e ("ALSA: hda: enable regmap internal
locking"), we re-enabled the regmap lock due to the reported
regression that showed the possible concurrent accesses.  It was a
temporary workaround, and there are still a few opened races even
after the revert.  In this patch, we cover those still opened windows
with a proper mutex lock and disable the regmap internal lock again.

First off, the patch introduces a new snd_hdac_device.regmap_lock
mutex that is applied for each snd_hdac_regmap_*() call, including
read, write and update helpers.  The mutex is applied carefully so
that it won't block the self-power-up procedure in the helper
function.  Also, this assures the protection for the accesses without
regmap, too.

The snd_hdac_regmap_update_raw() is refactored to use the standard
regmap_update_bits_check() function instead of the open-code.  The
non-regmap case is still open-coded but it's an easy part.  The all
read and write operations are in the single mutex protection, so it's
now race-free.

In addition, a couple of new helper functions are added:
snd_hdac_regmap_update_raw_once() and snd_hdac_regmap_sync().  Both
are called from HD-audio legacy driver.  The former is to initialize
the given verb bits but only once when it's not initialized yet.  Due
to this condition, the function invokes regcache_cache_only(), and
it's now performed inside the regmap_lock (formerly it was racy) too.
The latter function is for simply invoking regcache_sync() inside the
regmap_lock, which is called from the codec resume call path.
Along with that, the HD-audio codec driver code is slightly modified /
simplified to adapt those new functions.

And finally, snd_hdac_regmap_read_raw(), *_write_raw(), etc are
rewritten with the helper macro.  It's just for simplification because
the code logic is identical among all those functions.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 include/sound/hda_regmap.h    |   3 +
 include/sound/hdaudio.h       |   1 +
 sound/hda/hdac_device.c       |   1 +
 sound/hda/hdac_regmap.c       | 142 +++++++++++++++++++++++++++++++-----------
 sound/pci/hda/hda_codec.c     |  30 ++++-----
 sound/pci/hda/hda_generic.c   |   2 +-
 sound/pci/hda/hda_local.h     |   2 +
 sound/pci/hda/patch_hdmi.c    |   2 +-
 sound/pci/hda/patch_realtek.c |   4 +-
 sound/pci/hda/patch_via.c     |   2 +-
 10 files changed, 135 insertions(+), 54 deletions(-)

diff --git a/include/sound/hda_regmap.h b/include/sound/hda_regmap.h
index 5141f8ffbb12..4c1b9bebbd60 100644
--- a/include/sound/hda_regmap.h
+++ b/include/sound/hda_regmap.h
@@ -24,6 +24,9 @@ int snd_hdac_regmap_write_raw(struct hdac_device *codec, unsigned int reg,
 			      unsigned int val);
 int snd_hdac_regmap_update_raw(struct hdac_device *codec, unsigned int reg,
 			       unsigned int mask, unsigned int val);
+int snd_hdac_regmap_update_raw_once(struct hdac_device *codec, unsigned int reg,
+				    unsigned int mask, unsigned int val);
+void snd_hdac_regmap_sync(struct hdac_device *codec);
 
 /**
  * snd_hdac_regmap_encode_verb - encode the verb to a pseudo register
diff --git a/include/sound/hdaudio.h b/include/sound/hdaudio.h
index bc2f77a6f17b..541ca99b154b 100644
--- a/include/sound/hdaudio.h
+++ b/include/sound/hdaudio.h
@@ -86,6 +86,7 @@ struct hdac_device {
 
 	/* regmap */
 	struct regmap *regmap;
+	struct mutex regmap_lock;
 	struct snd_array vendor_verbs;
 	bool lazy_cache:1;	/* don't wake up for writes */
 	bool caps_overwriting:1; /* caps overwrite being in process */
diff --git a/sound/hda/hdac_device.c b/sound/hda/hdac_device.c
index b4f8725f5ddf..7bcdb0e454f2 100644
--- a/sound/hda/hdac_device.c
+++ b/sound/hda/hdac_device.c
@@ -57,6 +57,7 @@ int snd_hdac_device_init(struct hdac_device *codec, struct hdac_bus *bus,
 	codec->addr = addr;
 	codec->type = HDA_DEV_CORE;
 	mutex_init(&codec->widget_lock);
+	mutex_init(&codec->regmap_lock);
 	pm_runtime_set_active(&codec->dev);
 	pm_runtime_get_noresume(&codec->dev);
 	atomic_set(&codec->in_pm, 0);
diff --git a/sound/hda/hdac_regmap.c b/sound/hda/hdac_regmap.c
index 0c8188a48a00..d75f31eb9d78 100644
--- a/sound/hda/hdac_regmap.c
+++ b/sound/hda/hdac_regmap.c
@@ -363,6 +363,7 @@ static const struct regmap_config hda_regmap_cfg = {
 	.reg_write = hda_reg_write,
 	.use_single_read = true,
 	.use_single_write = true,
+	.disable_locking = true,
 };
 
 /**
@@ -425,12 +426,29 @@ EXPORT_SYMBOL_GPL(snd_hdac_regmap_add_vendor_verb);
 static int reg_raw_write(struct hdac_device *codec, unsigned int reg,
 			 unsigned int val)
 {
+	int err;
+
+	mutex_lock(&codec->regmap_lock);
 	if (!codec->regmap)
-		return hda_reg_write(codec, reg, val);
+		err = hda_reg_write(codec, reg, val);
 	else
-		return regmap_write(codec->regmap, reg, val);
+		err = regmap_write(codec->regmap, reg, val);
+	mutex_unlock(&codec->regmap_lock);
+	return err;
 }
 
+/* a helper macro to call @func_call; retry with power-up if failed */
+#define CALL_RAW_FUNC(codec, func_call)				\
+	({							\
+		int _err = func_call;				\
+		if (_err == -EAGAIN) {				\
+			_err = snd_hdac_power_up_pm(codec);	\
+			if (_err >= 0)				\
+				_err = func_call;		\
+			snd_hdac_power_down_pm(codec);		\
+		}						\
+		_err;})
+
 /**
  * snd_hdac_regmap_write_raw - write a pseudo register with power mgmt
  * @codec: the codec object
@@ -442,42 +460,29 @@ static int reg_raw_write(struct hdac_device *codec, unsigned int reg,
 int snd_hdac_regmap_write_raw(struct hdac_device *codec, unsigned int reg,
 			      unsigned int val)
 {
-	int err;
-
-	err = reg_raw_write(codec, reg, val);
-	if (err == -EAGAIN) {
-		err = snd_hdac_power_up_pm(codec);
-		if (err >= 0)
-			err = reg_raw_write(codec, reg, val);
-		snd_hdac_power_down_pm(codec);
-	}
-	return err;
+	return CALL_RAW_FUNC(codec, reg_raw_write(codec, reg, val));
 }
 EXPORT_SYMBOL_GPL(snd_hdac_regmap_write_raw);
 
 static int reg_raw_read(struct hdac_device *codec, unsigned int reg,
 			unsigned int *val, bool uncached)
 {
+	int err;
+
+	mutex_lock(&codec->regmap_lock);
 	if (uncached || !codec->regmap)
-		return hda_reg_read(codec, reg, val);
+		err = hda_reg_read(codec, reg, val);
 	else
-		return regmap_read(codec->regmap, reg, val);
+		err = regmap_read(codec->regmap, reg, val);
+	mutex_unlock(&codec->regmap_lock);
+	return err;
 }
 
 static int __snd_hdac_regmap_read_raw(struct hdac_device *codec,
 				      unsigned int reg, unsigned int *val,
 				      bool uncached)
 {
-	int err;
-
-	err = reg_raw_read(codec, reg, val, uncached);
-	if (err == -EAGAIN) {
-		err = snd_hdac_power_up_pm(codec);
-		if (err >= 0)
-			err = reg_raw_read(codec, reg, val, uncached);
-		snd_hdac_power_down_pm(codec);
-	}
-	return err;
+	return CALL_RAW_FUNC(codec, reg_raw_read(codec, reg, val, uncached));
 }
 
 /**
@@ -504,6 +509,35 @@ int snd_hdac_regmap_read_raw_uncached(struct hdac_device *codec,
 	return __snd_hdac_regmap_read_raw(codec, reg, val, true);
 }
 
+static int reg_raw_update(struct hdac_device *codec, unsigned int reg,
+			  unsigned int mask, unsigned int val)
+{
+	unsigned int orig;
+	bool change;
+	int err;
+
+	mutex_lock(&codec->regmap_lock);
+	if (codec->regmap) {
+		err = regmap_update_bits_check(codec->regmap, reg, mask, val,
+					       &change);
+		if (!err)
+			err = change ? 1 : 0;
+	} else {
+		err = hda_reg_read(codec, reg, &orig);
+		if (!err) {
+			val &= mask;
+			val |= orig & ~mask;
+			if (val != orig) {
+				err = hda_reg_write(codec, reg, val);
+				if (!err)
+					err = 1;
+			}
+		}
+	}
+	mutex_unlock(&codec->regmap_lock);
+	return err;
+}
+
 /**
  * snd_hdac_regmap_update_raw - update a pseudo register with power mgmt
  * @codec: the codec object
@@ -515,20 +549,58 @@ int snd_hdac_regmap_read_raw_uncached(struct hdac_device *codec,
  */
 int snd_hdac_regmap_update_raw(struct hdac_device *codec, unsigned int reg,
 			       unsigned int mask, unsigned int val)
+{
+	return CALL_RAW_FUNC(codec, reg_raw_update(codec, reg, mask, val));
+}
+EXPORT_SYMBOL_GPL(snd_hdac_regmap_update_raw);
+
+static int reg_raw_update_once(struct hdac_device *codec, unsigned int reg,
+			       unsigned int mask, unsigned int val)
 {
 	unsigned int orig;
 	int err;
 
-	val &= mask;
-	err = snd_hdac_regmap_read_raw(codec, reg, &orig);
-	if (err < 0)
-		return err;
-	val |= orig & ~mask;
-	if (val == orig)
-		return 0;
-	err = snd_hdac_regmap_write_raw(codec, reg, val);
+	if (!codec->regmap)
+		return reg_raw_update(codec, reg, mask, val);
+
+	mutex_lock(&codec->regmap_lock);
+	regcache_cache_only(codec->regmap, true);
+	err = regmap_read(codec->regmap, reg, &orig);
+	regcache_cache_only(codec->regmap, false);
 	if (err < 0)
-		return err;
-	return 1;
+		err = regmap_update_bits(codec->regmap, reg, mask, val);
+	mutex_unlock(&codec->regmap_lock);
+	return err;
 }
-EXPORT_SYMBOL_GPL(snd_hdac_regmap_update_raw);
+
+/**
+ * snd_hdac_regmap_update_raw_once - initialize the register value only once
+ * @codec: the codec object
+ * @reg: pseudo register
+ * @mask: bit mask to update
+ * @val: value to update
+ *
+ * Performs the update of the register bits only once when the register
+ * hasn't been initialized yet.  Used in HD-audio legacy driver.
+ * Returns zero if successful or a negative error code
+ */
+int snd_hdac_regmap_update_raw_once(struct hdac_device *codec, unsigned int reg,
+				    unsigned int mask, unsigned int val)
+{
+	return CALL_RAW_FUNC(codec, reg_raw_update_once(codec, reg, mask, val));
+}
+EXPORT_SYMBOL_GPL(snd_hdac_regmap_update_raw_once);
+
+/**
+ * snd_hdac_regmap_sync - sync out the cached values for PM resume
+ * @codec: the codec object
+ */
+void snd_hdac_regmap_sync(struct hdac_device *codec)
+{
+	if (codec->regmap) {
+		mutex_lock(&codec->regmap_lock);
+		regcache_sync(codec->regmap);
+		mutex_unlock(&codec->regmap_lock);
+	}
+}
+EXPORT_SYMBOL_GPL(snd_hdac_regmap_sync);
diff --git a/sound/pci/hda/hda_codec.c b/sound/pci/hda/hda_codec.c
index 4377b2aba835..83aa4c1015d2 100644
--- a/sound/pci/hda/hda_codec.c
+++ b/sound/pci/hda/hda_codec.c
@@ -1267,6 +1267,18 @@ int snd_hda_override_amp_caps(struct hda_codec *codec, hda_nid_t nid, int dir,
 }
 EXPORT_SYMBOL_GPL(snd_hda_override_amp_caps);
 
+static unsigned int encode_amp(struct hda_codec *codec, hda_nid_t nid,
+			       int ch, int dir, int idx)
+{
+	unsigned int cmd = snd_hdac_regmap_encode_amp(nid, ch, dir, idx);
+
+	/* enable fake mute if no h/w mute but min=mute */
+	if ((query_amp_caps(codec, nid, dir) &
+	     (AC_AMPCAP_MUTE | AC_AMPCAP_MIN_MUTE)) == AC_AMPCAP_MIN_MUTE)
+		cmd |= AC_AMP_FAKE_MUTE;
+	return cmd;
+}
+
 /**
  * snd_hda_codec_amp_update - update the AMP mono value
  * @codec: HD-audio codec
@@ -1282,12 +1294,8 @@ EXPORT_SYMBOL_GPL(snd_hda_override_amp_caps);
 int snd_hda_codec_amp_update(struct hda_codec *codec, hda_nid_t nid,
 			     int ch, int dir, int idx, int mask, int val)
 {
-	unsigned int cmd = snd_hdac_regmap_encode_amp(nid, ch, dir, idx);
+	unsigned int cmd = encode_amp(codec, nid, ch, dir, idx);
 
-	/* enable fake mute if no h/w mute but min=mute */
-	if ((query_amp_caps(codec, nid, dir) &
-	     (AC_AMPCAP_MUTE | AC_AMPCAP_MIN_MUTE)) == AC_AMPCAP_MIN_MUTE)
-		cmd |= AC_AMP_FAKE_MUTE;
 	return snd_hdac_regmap_update_raw(&codec->core, cmd, mask, val);
 }
 EXPORT_SYMBOL_GPL(snd_hda_codec_amp_update);
@@ -1335,16 +1343,11 @@ EXPORT_SYMBOL_GPL(snd_hda_codec_amp_stereo);
 int snd_hda_codec_amp_init(struct hda_codec *codec, hda_nid_t nid, int ch,
 			   int dir, int idx, int mask, int val)
 {
-	int orig;
+	unsigned int cmd = encode_amp(codec, nid, ch, dir, idx);
 
 	if (!codec->core.regmap)
 		return -EINVAL;
-	regcache_cache_only(codec->core.regmap, true);
-	orig = snd_hda_codec_amp_read(codec, nid, ch, dir, idx);
-	regcache_cache_only(codec->core.regmap, false);
-	if (orig >= 0)
-		return 0;
-	return snd_hda_codec_amp_update(codec, nid, ch, dir, idx, mask, val);
+	return snd_hdac_regmap_update_raw_once(&codec->core, cmd, mask, val);
 }
 EXPORT_SYMBOL_GPL(snd_hda_codec_amp_init);
 
@@ -2905,8 +2908,7 @@ static void hda_call_codec_resume(struct hda_codec *codec)
 	else {
 		if (codec->patch_ops.init)
 			codec->patch_ops.init(codec);
-		if (codec->core.regmap)
-			regcache_sync(codec->core.regmap);
+		snd_hda_regmap_sync(codec);
 	}
 
 	if (codec->jackpoll_interval)
diff --git a/sound/pci/hda/hda_generic.c b/sound/pci/hda/hda_generic.c
index fc001c64ef20..6815f9dc8545 100644
--- a/sound/pci/hda/hda_generic.c
+++ b/sound/pci/hda/hda_generic.c
@@ -6027,7 +6027,7 @@ int snd_hda_gen_init(struct hda_codec *codec)
 	/* call init functions of standard auto-mute helpers */
 	update_automute_all(codec);
 
-	regcache_sync(codec->core.regmap);
+	snd_hda_regmap_sync(codec);
 
 	if (spec->vmaster_mute.sw_kctl && spec->vmaster_mute.hook)
 		snd_hda_sync_vmaster_hook(&spec->vmaster_mute);
diff --git a/sound/pci/hda/hda_local.h b/sound/pci/hda/hda_local.h
index 3942e1b528d8..3dca65d79b02 100644
--- a/sound/pci/hda/hda_local.h
+++ b/sound/pci/hda/hda_local.h
@@ -138,6 +138,8 @@ int snd_hda_codec_reset(struct hda_codec *codec);
 void snd_hda_codec_register(struct hda_codec *codec);
 void snd_hda_codec_cleanup_for_unbind(struct hda_codec *codec);
 
+#define snd_hda_regmap_sync(codec)	snd_hdac_regmap_sync(&(codec)->core)
+
 enum {
 	HDA_VMUTE_OFF,
 	HDA_VMUTE_ON,
diff --git a/sound/pci/hda/patch_hdmi.c b/sound/pci/hda/patch_hdmi.c
index 3beb842817ff..3a18fa4f8c21 100644
--- a/sound/pci/hda/patch_hdmi.c
+++ b/sound/pci/hda/patch_hdmi.c
@@ -2404,7 +2404,7 @@ static int generic_hdmi_resume(struct hda_codec *codec)
 	int pin_idx;
 
 	codec->patch_ops.init(codec);
-	regcache_sync(codec->core.regmap);
+	snd_hda_regmap_sync(codec);
 
 	for (pin_idx = 0; pin_idx < spec->num_pins; pin_idx++) {
 		struct hdmi_spec_per_pin *per_pin = get_pin(spec, pin_idx);
diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 181e15072692..d88a001ba8cf 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -907,7 +907,7 @@ static int alc_resume(struct hda_codec *codec)
 	if (!spec->no_depop_delay)
 		msleep(150); /* to avoid pop noise */
 	codec->patch_ops.init(codec);
-	regcache_sync(codec->core.regmap);
+	snd_hda_regmap_sync(codec);
 	hda_call_check_power_status(codec, 0x01);
 	return 0;
 }
@@ -3638,7 +3638,7 @@ static int alc269_resume(struct hda_codec *codec)
 		msleep(200);
 	}
 
-	regcache_sync(codec->core.regmap);
+	snd_hda_regmap_sync(codec);
 	hda_call_check_power_status(codec, 0x01);
 
 	/* on some machine, the BIOS will clear the codec gpio data when enter
diff --git a/sound/pci/hda/patch_via.c b/sound/pci/hda/patch_via.c
index b40d01e01832..7ef8f3105cdb 100644
--- a/sound/pci/hda/patch_via.c
+++ b/sound/pci/hda/patch_via.c
@@ -396,7 +396,7 @@ static int via_resume(struct hda_codec *codec)
 	/* some delay here to make jack detection working (bko#98921) */
 	msleep(10);
 	codec->patch_ops.init(codec);
-	regcache_sync(codec->core.regmap);
+	snd_hda_regmap_sync(codec);
 	return 0;
 }
 #endif
-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
