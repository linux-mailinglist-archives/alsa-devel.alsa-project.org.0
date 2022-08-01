Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DBE3C586F1D
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Aug 2022 18:59:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 86B40163E;
	Mon,  1 Aug 2022 18:58:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 86B40163E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1659373170;
	bh=CRe5UFDdf5fOT4jlogk6falVoNa5rtyFYA3hlqbio0Y=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jqXC0Xv9ID+PMVfTTywsqJbmw5u04EHBZiLWc0WrfAYPTma5IHnQKDS7qqoraqDDz
	 Q6uZoJtOmfGIGTAiTBgcNXO26voGT8/geS3zJRGXFicJNb/V+A2tdPUKY7gUU7i7zg
	 mrUugjyzkCnzahIJ0fqr6H1/cOPz2YdNm17TDg1E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 61CE2F80579;
	Mon,  1 Aug 2022 18:57:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F0C35F8023B; Mon,  1 Aug 2022 18:56:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NO_DNS_FOR_FROM,PRX_BODYSUB_1,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 24020F80544
 for <alsa-devel@alsa-project.org>; Mon,  1 Aug 2022 18:56:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 24020F80544
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="qN+3W+ZE"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="8u56CoYa"
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id A70164D861;
 Mon,  1 Aug 2022 16:56:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1659373003; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eMOjodtbiTbrR19TsN4XkTkRKuEJ2fYirxstuXC06Cg=;
 b=qN+3W+ZELZ5mZKzXiIgbFNeHWDulchuMHtznGpEiF/hqAKTLEPbB+FqgDKiyHKRFy/gZQf
 6yxxD1zuiTE45Kb7/gE1c5u11V+Y6tOQcVwdM6FodZP0wyA7hziZBJjfRGg2T1xKO3Og63
 fIwYo4Cuf3LJE4nAQA/8vBj4hiQ3lc4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1659373003;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eMOjodtbiTbrR19TsN4XkTkRKuEJ2fYirxstuXC06Cg=;
 b=8u56CoYa5HhhDuQMszjVZPwgjvuOBQYcMkdtZCxVlbU66W4BYOVjIudfK4MmrnCZpu0ui7
 sy3vKVOrjKJUKqCQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 8223D13AAE;
 Mon,  1 Aug 2022 16:56:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id MJz7HssF6GLXGgAAMHmgww
 (envelope-from <tiwai@suse.de>); Mon, 01 Aug 2022 16:56:43 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 6/7] ALSA: hda: Replace sprintf() with sysfs_emit()
Date: Mon,  1 Aug 2022 18:56:38 +0200
Message-Id: <20220801165639.26030-7-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220801165639.26030-1-tiwai@suse.de>
References: <20220801165639.26030-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

For sysfs outputs, it's safer to use a new helper, sysfs_emit(),
instead of the raw sprintf() & co.  This patch replaces those usages
straightforwardly with new helpers, sysfs_emit() and sysfs_emit_at().

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/hda/hdac_sysfs.c    | 42 +++++++++++++++++++--------------------
 sound/pci/hda/hda_sysfs.c | 23 ++++++++++-----------
 2 files changed, 32 insertions(+), 33 deletions(-)

diff --git a/sound/hda/hdac_sysfs.c b/sound/hda/hdac_sysfs.c
index 0d7771fca9f0..e47de49a32e3 100644
--- a/sound/hda/hdac_sysfs.c
+++ b/sound/hda/hdac_sysfs.c
@@ -22,7 +22,7 @@ static ssize_t type##_show(struct device *dev,			\
 			   char *buf)				\
 {								\
 	struct hdac_device *codec = dev_to_hdac_dev(dev);	\
-	return sprintf(buf, "0x%x\n", codec->type);		\
+	return sysfs_emit(buf, "0x%x\n", codec->type);		\
 } \
 static DEVICE_ATTR_RO(type)
 
@@ -32,8 +32,8 @@ static ssize_t type##_show(struct device *dev,			\
 					char *buf)		\
 {								\
 	struct hdac_device *codec = dev_to_hdac_dev(dev);	\
-	return sprintf(buf, "%s\n",				\
-		       codec->type ? codec->type : "");		\
+	return sysfs_emit(buf, "%s\n",				\
+			  codec->type ? codec->type : "");	\
 } \
 static DEVICE_ATTR_RO(type)
 
@@ -161,7 +161,7 @@ static struct kobj_type widget_ktype = {
 static ssize_t caps_show(struct hdac_device *codec, hda_nid_t nid,
 			struct widget_attribute *attr, char *buf)
 {
-	return sprintf(buf, "0x%08x\n", get_wcaps(codec, nid));
+	return sysfs_emit(buf, "0x%08x\n", get_wcaps(codec, nid));
 }
 
 static ssize_t pin_caps_show(struct hdac_device *codec, hda_nid_t nid,
@@ -169,8 +169,8 @@ static ssize_t pin_caps_show(struct hdac_device *codec, hda_nid_t nid,
 {
 	if (get_wcaps_type(get_wcaps(codec, nid)) != AC_WID_PIN)
 		return 0;
-	return sprintf(buf, "0x%08x\n",
-		       snd_hdac_read_parm(codec, nid, AC_PAR_PIN_CAP));
+	return sysfs_emit(buf, "0x%08x\n",
+			  snd_hdac_read_parm(codec, nid, AC_PAR_PIN_CAP));
 }
 
 static ssize_t pin_cfg_show(struct hdac_device *codec, hda_nid_t nid,
@@ -182,7 +182,7 @@ static ssize_t pin_cfg_show(struct hdac_device *codec, hda_nid_t nid,
 		return 0;
 	if (snd_hdac_read(codec, nid, AC_VERB_GET_CONFIG_DEFAULT, 0, &val))
 		return 0;
-	return sprintf(buf, "0x%08x\n", val);
+	return sysfs_emit(buf, "0x%08x\n", val);
 }
 
 static bool has_pcm_cap(struct hdac_device *codec, hda_nid_t nid)
@@ -203,8 +203,8 @@ static ssize_t pcm_caps_show(struct hdac_device *codec, hda_nid_t nid,
 {
 	if (!has_pcm_cap(codec, nid))
 		return 0;
-	return sprintf(buf, "0x%08x\n",
-		       snd_hdac_read_parm(codec, nid, AC_PAR_PCM));
+	return sysfs_emit(buf, "0x%08x\n",
+			  snd_hdac_read_parm(codec, nid, AC_PAR_PCM));
 }
 
 static ssize_t pcm_formats_show(struct hdac_device *codec, hda_nid_t nid,
@@ -212,8 +212,8 @@ static ssize_t pcm_formats_show(struct hdac_device *codec, hda_nid_t nid,
 {
 	if (!has_pcm_cap(codec, nid))
 		return 0;
-	return sprintf(buf, "0x%08x\n",
-		       snd_hdac_read_parm(codec, nid, AC_PAR_STREAM));
+	return sysfs_emit(buf, "0x%08x\n",
+			  snd_hdac_read_parm(codec, nid, AC_PAR_STREAM));
 }
 
 static ssize_t amp_in_caps_show(struct hdac_device *codec, hda_nid_t nid,
@@ -221,8 +221,8 @@ static ssize_t amp_in_caps_show(struct hdac_device *codec, hda_nid_t nid,
 {
 	if (nid != codec->afg && !(get_wcaps(codec, nid) & AC_WCAP_IN_AMP))
 		return 0;
-	return sprintf(buf, "0x%08x\n",
-		       snd_hdac_read_parm(codec, nid, AC_PAR_AMP_IN_CAP));
+	return sysfs_emit(buf, "0x%08x\n",
+			  snd_hdac_read_parm(codec, nid, AC_PAR_AMP_IN_CAP));
 }
 
 static ssize_t amp_out_caps_show(struct hdac_device *codec, hda_nid_t nid,
@@ -230,8 +230,8 @@ static ssize_t amp_out_caps_show(struct hdac_device *codec, hda_nid_t nid,
 {
 	if (nid != codec->afg && !(get_wcaps(codec, nid) & AC_WCAP_OUT_AMP))
 		return 0;
-	return sprintf(buf, "0x%08x\n",
-		       snd_hdac_read_parm(codec, nid, AC_PAR_AMP_OUT_CAP));
+	return sysfs_emit(buf, "0x%08x\n",
+			  snd_hdac_read_parm(codec, nid, AC_PAR_AMP_OUT_CAP));
 }
 
 static ssize_t power_caps_show(struct hdac_device *codec, hda_nid_t nid,
@@ -239,15 +239,15 @@ static ssize_t power_caps_show(struct hdac_device *codec, hda_nid_t nid,
 {
 	if (nid != codec->afg && !(get_wcaps(codec, nid) & AC_WCAP_POWER))
 		return 0;
-	return sprintf(buf, "0x%08x\n",
-		       snd_hdac_read_parm(codec, nid, AC_PAR_POWER_STATE));
+	return sysfs_emit(buf, "0x%08x\n",
+			  snd_hdac_read_parm(codec, nid, AC_PAR_POWER_STATE));
 }
 
 static ssize_t gpio_caps_show(struct hdac_device *codec, hda_nid_t nid,
 			      struct widget_attribute *attr, char *buf)
 {
-	return sprintf(buf, "0x%08x\n",
-		       snd_hdac_read_parm(codec, nid, AC_PAR_GPIO_CAP));
+	return sysfs_emit(buf, "0x%08x\n",
+			  snd_hdac_read_parm(codec, nid, AC_PAR_GPIO_CAP));
 }
 
 static ssize_t connections_show(struct hdac_device *codec, hda_nid_t nid,
@@ -261,8 +261,8 @@ static ssize_t connections_show(struct hdac_device *codec, hda_nid_t nid,
 	if (nconns <= 0)
 		return nconns;
 	for (i = 0; i < nconns; i++)
-		ret += sprintf(buf + ret, "%s0x%02x", i ? " " : "", list[i]);
-	ret += sprintf(buf + ret, "\n");
+		ret += sysfs_emit_at(buf,  ret, "%s0x%02x", i ? " " : "", list[i]);
+	ret += sysfs_emit_at(buf, ret, "\n");
 	return ret;
 }
 
diff --git a/sound/pci/hda/hda_sysfs.c b/sound/pci/hda/hda_sysfs.c
index d5ffcba794e5..bf951c10ae61 100644
--- a/sound/pci/hda/hda_sysfs.c
+++ b/sound/pci/hda/hda_sysfs.c
@@ -33,7 +33,7 @@ static ssize_t power_on_acct_show(struct device *dev,
 {
 	struct hda_codec *codec = dev_get_drvdata(dev);
 	snd_hda_update_power_acct(codec);
-	return sprintf(buf, "%u\n", jiffies_to_msecs(codec->power_on_acct));
+	return sysfs_emit(buf, "%u\n", jiffies_to_msecs(codec->power_on_acct));
 }
 
 static ssize_t power_off_acct_show(struct device *dev,
@@ -42,7 +42,7 @@ static ssize_t power_off_acct_show(struct device *dev,
 {
 	struct hda_codec *codec = dev_get_drvdata(dev);
 	snd_hda_update_power_acct(codec);
-	return sprintf(buf, "%u\n", jiffies_to_msecs(codec->power_off_acct));
+	return sysfs_emit(buf, "%u\n", jiffies_to_msecs(codec->power_off_acct));
 }
 
 static DEVICE_ATTR_RO(power_on_acct);
@@ -55,7 +55,7 @@ static ssize_t type##_show(struct device *dev,			\
 			   char *buf)				\
 {								\
 	struct hda_codec *codec = dev_get_drvdata(dev);		\
-	return sprintf(buf, "0x%x\n", codec->field);		\
+	return sysfs_emit(buf, "0x%x\n", codec->field);		\
 }
 
 #define CODEC_INFO_STR_SHOW(type, field)			\
@@ -64,8 +64,8 @@ static ssize_t type##_show(struct device *dev,			\
 					char *buf)		\
 {								\
 	struct hda_codec *codec = dev_get_drvdata(dev);		\
-	return sprintf(buf, "%s\n",				\
-		       codec->field ? codec->field : "");	\
+	return sysfs_emit(buf, "%s\n",				\
+			  codec->field ? codec->field : "");	\
 }
 
 CODEC_INFO_SHOW(vendor_id, core.vendor_id);
@@ -85,8 +85,8 @@ static ssize_t pin_configs_show(struct hda_codec *codec,
 	int i, len = 0;
 	mutex_lock(&codec->user_mutex);
 	snd_array_for_each(list, i, pin) {
-		len += sprintf(buf + len, "0x%02x 0x%08x\n",
-			       pin->nid, pin->cfg);
+		len += sysfs_emit_at(buf, len, "0x%02x 0x%08x\n",
+				     pin->nid, pin->cfg);
 	}
 	mutex_unlock(&codec->user_mutex);
 	return len;
@@ -222,9 +222,8 @@ static ssize_t init_verbs_show(struct device *dev,
 	int i, len = 0;
 	mutex_lock(&codec->user_mutex);
 	snd_array_for_each(&codec->init_verbs, i, v) {
-		len += scnprintf(buf + len, PAGE_SIZE - len,
-				"0x%02x 0x%03x 0x%04x\n",
-				v->nid, v->verb, v->param);
+		len += sysfs_emit_at(buf, len, "0x%02x 0x%03x 0x%04x\n",
+				     v->nid, v->verb, v->param);
 	}
 	mutex_unlock(&codec->user_mutex);
 	return len;
@@ -272,8 +271,8 @@ static ssize_t hints_show(struct device *dev,
 	int i, len = 0;
 	mutex_lock(&codec->user_mutex);
 	snd_array_for_each(&codec->hints, i, hint) {
-		len += scnprintf(buf + len, PAGE_SIZE - len,
-				"%s = %s\n", hint->key, hint->val);
+		len += sysfs_emit_at(buf, len, "%s = %s\n",
+				     hint->key, hint->val);
 	}
 	mutex_unlock(&codec->user_mutex);
 	return len;
-- 
2.35.3

