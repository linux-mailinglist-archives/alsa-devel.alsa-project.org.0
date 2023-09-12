Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E635079D635
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Sep 2023 18:26:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D9DA89F6;
	Tue, 12 Sep 2023 18:25:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D9DA89F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694535997;
	bh=wMQ6yqTbpwJhB1+qvC1j2IVdPslOB3dReK6VWLmioLQ=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=ntkymi9bdH1/fVL9u/kaW+b0R6lv1zRvUM5GApQg5HQu50Q7fNLVjK/sL5lqt5r5E
	 rgtwHH76o2lC4X10/p5lXBxc6mqxz5hKmlhlsEDIA4B60QWaVej9F6rA1DSWjR3nZ4
	 1W1G50JX3MzUUxjJCzCN8LZDNzwAGslQlq1n6fW0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F3082F80552; Tue, 12 Sep 2023 18:25:46 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 731BBF80246;
	Tue, 12 Sep 2023 18:25:46 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BCD89F80425; Tue, 12 Sep 2023 18:25:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2F957F80246
	for <alsa-devel@alsa-project.org>; Tue, 12 Sep 2023 18:25:36 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
	by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 4A2BB11ED;
	Tue, 12 Sep 2023 18:25:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 4A2BB11ED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
	t=1694535936; bh=60L3R2rKRzEWhurci1USsUteTTzQmgW3hcQCNMEoWxU=;
	h=From:To:Cc:Subject:Date:From;
	b=FB/uv+0/w8bPGl20Z+iUHwfCm9xLEEKmlB4wVG9GFQAeYWFAg9JAUEPuw5Miw8rR3
	 DuiydwNlk1lcbCBS6hqc9iHUotJFlynqnssYqwjhax2JvbZewpx7RPeN2ROhY6HsVb
	 czdVQsVSle6J9UjcAwAQe9JD5vAEoQNuPcHMDStc=
Received: from p1gen4.perex-int.cz (unknown [192.168.100.98])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	(Authenticated sender: perex)
	by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
	Tue, 12 Sep 2023 18:25:32 +0200 (CEST)
From: Jaroslav Kysela <perex@perex.cz>
To: ALSA development <alsa-devel@alsa-project.org>
Cc: Takashi Iwai <tiwai@suse.de>,
	Jaroslav Kysela <perex@perex.cz>,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [RFC PATCH] ALSA: pcm: Introduce MSBITS subformat API extension
Date: Tue, 12 Sep 2023 18:25:26 +0200
Message-ID: <20230912162526.7138-1-perex@perex.cz>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: JCQKNGIKU2U4AODEJMOVKFYYQS7VFQOR
X-Message-ID-Hash: JCQKNGIKU2U4AODEJMOVKFYYQS7VFQOR
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JCQKNGIKU2U4AODEJMOVKFYYQS7VFQOR/>
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

Cc: Cezary Rojewski <cezary.rojewski@intel.com>
Signed-off-by: Jaroslav Kysela <perex@perex.cz>
---
 include/sound/pcm.h               | 17 +++++++++
 include/uapi/sound/asound.h       |  7 ++--
 sound/core/pcm_lib.c              | 59 +++++++++++++++++++++++++++++++
 sound/core/pcm_native.c           | 18 +++++++---
 tools/include/uapi/sound/asound.h |  7 ++--
 5 files changed, 100 insertions(+), 8 deletions(-)

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
index a11cd7d6295f..f414f8fd217b 100644
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
+	snd_mask_none(&m);
+	snd_mask_set(&m, (__force unsigned)SNDRV_PCM_SUBFORMAT_STD);
+	bool found;
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
+ * @nmemd: size of array with struct snd_pcm_subformat elements
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
index bd9ddf412b46..69609e6aa507 100644
--- a/sound/core/pcm_native.c
+++ b/sound/core/pcm_native.c
@@ -479,6 +479,7 @@ static int fixup_unreferenced_params(struct snd_pcm_substream *substream,
 {
 	const struct snd_interval *i;
 	const struct snd_mask *m;
+	struct snd_mask *m_rw;
 	int err;
 
 	if (!params->msbits) {
@@ -487,6 +488,14 @@ static int fixup_unreferenced_params(struct snd_pcm_substream *substream,
 			params->msbits = snd_interval_value(i);
 	}
 
+	if (params->msbits) {
+		m = hw_param_mask_c(params, SNDRV_PCM_HW_PARAM_FORMAT);
+		if (snd_mask_single(m) && snd_pcm_format_width(snd_mask_min(m)) != params->msbits) {
+			m_rw = hw_param_mask(params, SNDRV_PCM_HW_PARAM_SUBFORMAT);
+			snd_mask_reset(m_rw, (__force unsigned)SNDRV_PCM_SUBFORMAT_MSBITS_MAX);
+		}
+	}
+
 	if (!params->rate_den) {
 		i = hw_param_interval_c(params, SNDRV_PCM_HW_PARAM_RATE);
 		if (snd_interval_single(i)) {
@@ -2634,10 +2643,11 @@ static int snd_pcm_hw_constraints_complete(struct snd_pcm_substream *substream)
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

