Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BB1EA79E516
	for <lists+alsa-devel@lfdr.de>; Wed, 13 Sep 2023 12:38:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2B3C9A4B;
	Wed, 13 Sep 2023 12:37:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2B3C9A4B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694601520;
	bh=etBJWDoqlj5WnvYC09TbS89X/Yc3eus9l32Uhba0pSg=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=ilWdSo8yzVRBbVwibviVGluaAnv84x5vC+jVMkzqEEzxm+P2cyHL3B3O7wROm5IGM
	 1oLoeeNzMto6UgT0XEMJAWuTTq4KjBM35pEPKuoIeKUbpT0pHMy9AJFU6EcrQvEtsj
	 eyhOKvQmkrv7zJVWoPwvmAaIh5DAmGpSmPu7F05M=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9C127F80558; Wed, 13 Sep 2023 12:37:49 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 56FBDF80246;
	Wed, 13 Sep 2023 12:37:49 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AE036F80425; Wed, 13 Sep 2023 12:37:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 878F0F8007C
	for <alsa-devel@alsa-project.org>; Wed, 13 Sep 2023 12:37:39 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
	by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 130F611CB;
	Wed, 13 Sep 2023 12:37:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 130F611CB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
	t=1694601459; bh=EE5lF1i3XxnQOCYicS8HxoiR9OhpN1lSVuXGqttTucE=;
	h=From:To:Cc:Subject:Date:From;
	b=OqTbcgLZmLyxLVWP5R8Lxek/YpI/FEa9exTqal9/iRIDva/QcOQBYRqIvJDok6TJ0
	 l9CifO20os9GIWFP3F22Zi1NmFZYn5lu8RN7GTDt59DNhl6LFZpkefcnRRqJ7799Oe
	 Xv1XRFZOITKW3vfa9X+WSaezw4A0/K+D2pR71JvQ=
Received: from p1gen4.perex-int.cz (unknown [192.168.100.98])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	(Authenticated sender: perex)
	by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
	Wed, 13 Sep 2023 12:37:35 +0200 (CEST)
From: Jaroslav Kysela <perex@perex.cz>
To: ALSA development <alsa-devel@alsa-project.org>
Cc: Takashi Iwai <tiwai@suse.de>,
	Jaroslav Kysela <perex@perex.cz>,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [RFC PATCH v2] ALSA: pcm: Introduce MSBITS subformat API extension
Date: Wed, 13 Sep 2023 12:37:16 +0200
Message-ID: <20230913103716.67315-1-perex@perex.cz>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: M5GOWBJHVIHHMB6DV6MW6XTBNSILRHI6
X-Message-ID-Hash: M5GOWBJHVIHHMB6DV6MW6XTBNSILRHI6
X-MailFrom: perex@perex.cz
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/M5GOWBJHVIHHMB6DV6MW6XTBNSILRHI6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Improve granularity of format selection for linear formats by adding
constants representing MAX, 20, 24 most significant bits.

The MAX means the maximum number of significant bits which can
the physical format hold. For 32-bit formats, MAX is related
to 32 bits. For 8-bit formats, MAX is related to 8 bits etc.

The drivers may use snd_pcm_hw_constraint_subformats with
a simple format -> subformats table.

Original proposal - https://lore.kernel.org/alsa-devel/20230811164853.1797547-1-cezary.rojewski@intel.com/

Cc: Cezary Rojewski <cezary.rojewski@intel.com>
Signed-off-by: Jaroslav Kysela <perex@perex.cz>

---

v2:
  - added link to the original proposal (RFC)
  - reshuffle declarations in snd_pcm_hw_rule_subformats
  - remove nmemd from description - snd_pcm_hw_constraint_subformats
  - more strict handling for SNDRV_PCM_SUBFORMAT_MSBITS_MAX in
    fixup_unreferenced_params
  - fixed sparse warning (unsigned int -> snd_pcm_format_t)
---
 include/sound/pcm.h               | 17 +++++++++
 include/uapi/sound/asound.h       |  7 ++--
 sound/core/pcm_lib.c              | 59 +++++++++++++++++++++++++++++++
 sound/core/pcm_native.c           | 25 ++++++++++---
 tools/include/uapi/sound/asound.h |  7 ++--
 5 files changed, 107 insertions(+), 8 deletions(-)

diff --git a/include/sound/pcm.h b/include/sound/pcm.h
index 2a815373dac1..59ad45b42e03 100644
--- a/include/sound/pcm.h
+++ b/include/sound/pcm.h
@@ -217,6 +217,12 @@ struct snd_pcm_ops {
 #define SNDRV_PCM_FMTBIT_U20		SNDRV_PCM_FMTBIT_U20_BE
 #endif
 
+#define _SNDRV_PCM_SUBFMTBIT(fmt)	BIT((__force int)SNDRV_PCM_SUBFORMAT_##fmt)
+#define SNDRV_PCM_SUBFMTBIT_STD		_SNDRV_PCM_SUBFMTBIT(STD)
+#define SNDRV_PCM_SUBFMTBIT_MSBITS_MAX	_SNDRV_PCM_SUBFMTBIT(MSBITS_MAX)
+#define SNDRV_PCM_SUBFMTBIT_MSBITS_20	_SNDRV_PCM_SUBFMTBIT(MSBITS_20)
+#define SNDRV_PCM_SUBFMTBIT_MSBITS_24	_SNDRV_PCM_SUBFMTBIT(MSBITS_24)
+
 struct snd_pcm_file {
 	struct snd_pcm_substream *substream;
 	int no_compat_mmap;
@@ -290,6 +296,13 @@ struct snd_pcm_hw_constraint_ranges {
 	unsigned int mask;
 };
 
+#define SNDRV_PCM_FORMAT_CONSTRAINT_END (~0)
+
+struct snd_pcm_hw_constraint_subformat {
+	snd_pcm_format_t format;	/* SNDRV_PCM_FORMAT_* */
+	u32 subformats;			/* SNDRV_PCM_SUBFMTBIT_* */
+};
+
 /*
  * userspace-provided audio timestamp config to kernel,
  * structure is for internal use only and filled with dedicated unpack routine
@@ -375,6 +388,7 @@ struct snd_pcm_runtime {
 	unsigned int rate_num;
 	unsigned int rate_den;
 	unsigned int no_period_wakeup: 1;
+	unsigned int subformat_constraint: 1;
 
 	/* -- SW params; see struct snd_pcm_sw_params for comments -- */
 	int tstamp_mode;
@@ -1068,6 +1082,9 @@ int snd_pcm_hw_constraint_ratdens(struct snd_pcm_runtime *runtime,
 				  unsigned int cond,
 				  snd_pcm_hw_param_t var,
 				  const struct snd_pcm_hw_constraint_ratdens *r);
+int snd_pcm_hw_constraint_subformats(struct snd_pcm_runtime *runtime,
+				     unsigned int cond,
+				     struct snd_pcm_hw_constraint_subformat *subformats);
 int snd_pcm_hw_constraint_msbits(struct snd_pcm_runtime *runtime, 
 				 unsigned int cond,
 				 unsigned int width,
diff --git a/include/uapi/sound/asound.h b/include/uapi/sound/asound.h
index f9939da41122..d5b9cfbd9cea 100644
--- a/include/uapi/sound/asound.h
+++ b/include/uapi/sound/asound.h
@@ -142,7 +142,7 @@ struct snd_hwdep_dsp_image {
  *                                                                           *
  *****************************************************************************/
 
-#define SNDRV_PCM_VERSION		SNDRV_PROTOCOL_VERSION(2, 0, 15)
+#define SNDRV_PCM_VERSION		SNDRV_PROTOCOL_VERSION(2, 0, 16)
 
 typedef unsigned long snd_pcm_uframes_t;
 typedef signed long snd_pcm_sframes_t;
@@ -267,7 +267,10 @@ typedef int __bitwise snd_pcm_format_t;
 
 typedef int __bitwise snd_pcm_subformat_t;
 #define	SNDRV_PCM_SUBFORMAT_STD		((__force snd_pcm_subformat_t) 0)
-#define	SNDRV_PCM_SUBFORMAT_LAST	SNDRV_PCM_SUBFORMAT_STD
+#define	SNDRV_PCM_SUBFORMAT_MSBITS_MAX	((__force snd_pcm_subformat_t) 1)
+#define	SNDRV_PCM_SUBFORMAT_MSBITS_20	((__force snd_pcm_subformat_t) 2)
+#define	SNDRV_PCM_SUBFORMAT_MSBITS_24	((__force snd_pcm_subformat_t) 3)
+#define	SNDRV_PCM_SUBFORMAT_LAST	SNDRV_PCM_SUBFORMAT_MSBITS_24
 
 #define SNDRV_PCM_INFO_MMAP		0x00000001	/* hardware supports mmap */
 #define SNDRV_PCM_INFO_MMAP_VALID	0x00000002	/* period data are valid during transfer */
diff --git a/sound/core/pcm_lib.c b/sound/core/pcm_lib.c
index a11cd7d6295f..cb376e428f59 100644
--- a/sound/core/pcm_lib.c
+++ b/sound/core/pcm_lib.c
@@ -1404,6 +1404,65 @@ int snd_pcm_hw_constraint_ratdens(struct snd_pcm_runtime *runtime,
 }
 EXPORT_SYMBOL(snd_pcm_hw_constraint_ratdens);
 
+static int snd_pcm_hw_rule_subformats(struct snd_pcm_hw_params *params,
+				      struct snd_pcm_hw_rule *rule)
+{
+	const struct snd_pcm_hw_constraint_subformat *sf;
+	snd_pcm_format_t k;
+	struct snd_mask m;
+	struct snd_mask *fmask = hw_param_mask(params, SNDRV_PCM_HW_PARAM_FORMAT);
+	struct snd_mask *mask = hw_param_mask(params, SNDRV_PCM_HW_PARAM_SUBFORMAT);
+	bool found;
+
+	snd_mask_none(&m);
+	snd_mask_set(&m, (__force unsigned)SNDRV_PCM_SUBFORMAT_STD);
+	pcm_for_each_format(k) {
+		if (!snd_mask_test(fmask, k))
+			continue;
+		found = false;
+		for (sf = rule->private; sf && sf->format != SNDRV_PCM_FORMAT_CONSTRAINT_END; sf++) {
+			if (sf->format != k)
+				continue;
+			found = true;
+			m.bits[0] |= sf->subformats;
+			break;
+		}
+		if (!found && snd_pcm_format_linear(k))
+			snd_mask_set(&m, (__force unsigned)SNDRV_PCM_SUBFORMAT_MSBITS_MAX);
+	}
+	return snd_mask_refine(mask, &m);
+}
+
+/**
+ * snd_pcm_hw_constraint_subformats - add a hw constraint subformats rule
+ * @runtime: PCM runtime instance
+ * @cond: condition bits
+ * @subformats: array with struct snd_pcm_subformat elements
+ *
+ * This constraint will set relation between format and subformats.
+ * The STD and MAX subformats are handled automatically. If the driver
+ * does not set this constraint, only STD and MAX subformats are handled.
+ *
+ * Return: Zero if successful, or a negative error code on failure.
+ */
+int snd_pcm_hw_constraint_subformats(struct snd_pcm_runtime *runtime,
+				     unsigned int cond,
+				     struct snd_pcm_hw_constraint_subformat *subformats)
+{
+	int ret;
+
+	ret = snd_pcm_hw_rule_add(runtime, cond, -1,
+				  snd_pcm_hw_rule_subformats,
+				  (void*) subformats,
+				  SNDRV_PCM_HW_PARAM_SUBFORMAT,
+				  SNDRV_PCM_HW_PARAM_FORMAT, -1);
+	if (ret < 0)
+		return ret;
+	runtime->subformat_constraint = 1;
+	return 0;
+}
+EXPORT_SYMBOL(snd_pcm_hw_constraint_subformats);
+
 static int snd_pcm_hw_rule_msbits(struct snd_pcm_hw_params *params,
 				  struct snd_pcm_hw_rule *rule)
 {
diff --git a/sound/core/pcm_native.c b/sound/core/pcm_native.c
index bd9ddf412b46..d4442b458c3c 100644
--- a/sound/core/pcm_native.c
+++ b/sound/core/pcm_native.c
@@ -479,6 +479,7 @@ static int fixup_unreferenced_params(struct snd_pcm_substream *substream,
 {
 	const struct snd_interval *i;
 	const struct snd_mask *m;
+	struct snd_mask *m_rw;
 	int err;
 
 	if (!params->msbits) {
@@ -487,6 +488,21 @@ static int fixup_unreferenced_params(struct snd_pcm_substream *substream,
 			params->msbits = snd_interval_value(i);
 	}
 
+	if (params->msbits) {
+		m = hw_param_mask_c(params, SNDRV_PCM_HW_PARAM_FORMAT);
+		if (snd_mask_single(m)) {
+			snd_pcm_format_t format = (__force snd_pcm_format_t)snd_mask_min(m);
+			if (snd_pcm_format_linear(format) &&
+			    snd_pcm_format_width(format) != params->msbits) {
+				m_rw = hw_param_mask(params, SNDRV_PCM_HW_PARAM_SUBFORMAT);
+				snd_mask_reset(m_rw,
+					       (__force unsigned)SNDRV_PCM_SUBFORMAT_MSBITS_MAX);
+				if (snd_mask_empty(m_rw))
+					return -EINVAL;
+			}
+		}
+	}
+
 	if (!params->rate_den) {
 		i = hw_param_interval_c(params, SNDRV_PCM_HW_PARAM_RATE);
 		if (snd_interval_single(i)) {
@@ -2634,10 +2650,11 @@ static int snd_pcm_hw_constraints_complete(struct snd_pcm_substream *substream)
 	if (err < 0)
 		return err;
 
-	err = snd_pcm_hw_constraint_mask(runtime, SNDRV_PCM_HW_PARAM_SUBFORMAT,
-					 PARAM_MASK_BIT(SNDRV_PCM_SUBFORMAT_STD));
-	if (err < 0)
-		return err;
+	if (!runtime->subformat_constraint) {
+		err = snd_pcm_hw_constraint_subformats(runtime, 0, NULL);
+		if (err < 0)
+			return err;
+	}
 
 	err = snd_pcm_hw_constraint_minmax(runtime, SNDRV_PCM_HW_PARAM_CHANNELS,
 					   hw->channels_min, hw->channels_max);
diff --git a/tools/include/uapi/sound/asound.h b/tools/include/uapi/sound/asound.h
index f9939da41122..d5b9cfbd9cea 100644
--- a/tools/include/uapi/sound/asound.h
+++ b/tools/include/uapi/sound/asound.h
@@ -142,7 +142,7 @@ struct snd_hwdep_dsp_image {
  *                                                                           *
  *****************************************************************************/
 
-#define SNDRV_PCM_VERSION		SNDRV_PROTOCOL_VERSION(2, 0, 15)
+#define SNDRV_PCM_VERSION		SNDRV_PROTOCOL_VERSION(2, 0, 16)
 
 typedef unsigned long snd_pcm_uframes_t;
 typedef signed long snd_pcm_sframes_t;
@@ -267,7 +267,10 @@ typedef int __bitwise snd_pcm_format_t;
 
 typedef int __bitwise snd_pcm_subformat_t;
 #define	SNDRV_PCM_SUBFORMAT_STD		((__force snd_pcm_subformat_t) 0)
-#define	SNDRV_PCM_SUBFORMAT_LAST	SNDRV_PCM_SUBFORMAT_STD
+#define	SNDRV_PCM_SUBFORMAT_MSBITS_MAX	((__force snd_pcm_subformat_t) 1)
+#define	SNDRV_PCM_SUBFORMAT_MSBITS_20	((__force snd_pcm_subformat_t) 2)
+#define	SNDRV_PCM_SUBFORMAT_MSBITS_24	((__force snd_pcm_subformat_t) 3)
+#define	SNDRV_PCM_SUBFORMAT_LAST	SNDRV_PCM_SUBFORMAT_MSBITS_24
 
 #define SNDRV_PCM_INFO_MMAP		0x00000001	/* hardware supports mmap */
 #define SNDRV_PCM_INFO_MMAP_VALID	0x00000002	/* period data are valid during transfer */
-- 
2.41.0

