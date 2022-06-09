Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 85088544B40
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Jun 2022 14:04:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E14DA1E76;
	Thu,  9 Jun 2022 14:04:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E14DA1E76
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654776293;
	bh=HRQupDTNPz745cMlmwkntrSZwButwijYw9NTo8gTjT8=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZivViT5cCNMKx/uNiOMQuLVH3S2BOiT32dKKbIJVo6pWFCNvGREbDnppFZHA2k/Vz
	 qU+BXDIffQM4dW6HjHjtszbv3dUtOnhEzlvRG/gGpBZzzClCWJ/rnMzPnbjyaZfipD
	 pY58DbPZrtmsfeQJuGMZg4sN7rJ/mP4RE7Bb02RY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0047FF80537;
	Thu,  9 Jun 2022 14:02:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 027A5F80520; Thu,  9 Jun 2022 14:02:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B7435F8012F
 for <alsa-devel@alsa-project.org>; Thu,  9 Jun 2022 14:02:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B7435F8012F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="AYSLwlre"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="56f79OUm"
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 707171FE32;
 Thu,  9 Jun 2022 12:02:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1654776143; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=W2NePM+nF30nM/n+MK0SudoqQgDRL+Il7brK5N3UnzY=;
 b=AYSLwlre4Lrkcia5pb/Qk9JdNEBUG7MXrZHW4q25WE7fmPBIMPv1DNd7uVaMvAXyi1saAi
 2kVz3efXadBfbZoSgXUbpMOGq243Z/vFktJ3NrjLwe04zUJyPwmAhmq9asezN9d6jbzEq+
 lwV1L/i9PQul5+sqQVd/uwFvaPkmfxM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1654776143;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=W2NePM+nF30nM/n+MK0SudoqQgDRL+Il7brK5N3UnzY=;
 b=56f79OUm0UkT/qOr5kojG5mr6tpxtvj1OKFGrwIbNLXxih5P2jAyquP0RSBIJ/fi2SkIIw
 CwCfHI+yi7lND8Dg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 3B9F513A8C;
 Thu,  9 Jun 2022 12:02:23 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id OK5IDU/hoWL1MAAAMHmgww
 (envelope-from <tiwai@suse.de>); Thu, 09 Jun 2022 12:02:23 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 4/4] ALSA: control: Add input validation
Date: Thu,  9 Jun 2022 14:02:19 +0200
Message-Id: <20220609120219.3937-5-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220609120219.3937-1-tiwai@suse.de>
References: <20220609120219.3937-1-tiwai@suse.de>
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

This patch adds a new feature to enable the validation of input data
to control elements in the ALSA core side.  When
CONFIG_SND_CTL_INPUT_VALIDATION is set, ALSA core verifies whether the
each input value via control API is in the defined ranges, also checks
whether it's aligned to the defined steps.  If an invalid value is
detected, ALSA core returns -EINVAL error immediately without passing
further to the driver's callback.  So this is a kind of hardening for
(badly written) drivers that have no proper error checks, at the cost
of a slight performance overhead.

Technically seen, this reuses a part of the existing validation code
for CONFIG_SND_CTL_DEBUG case with a slight modification to suppress
error prints for the input validation.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/Kconfig   | 10 +++++++
 sound/core/control.c | 69 +++++++++++++++++++++++++++++++-------------
 2 files changed, 59 insertions(+), 20 deletions(-)

diff --git a/sound/core/Kconfig b/sound/core/Kconfig
index 5bd8c93931b2..11d44dfda7ce 100644
--- a/sound/core/Kconfig
+++ b/sound/core/Kconfig
@@ -178,6 +178,16 @@ config SND_PCM_XRUN_DEBUG
 	  sound clicking when system is loaded, it may help to determine
 	  the process or driver which causes the scheduling gaps.
 
+config SND_CTL_INPUT_VALIDATION
+	bool "Validate input data to control API"
+	help
+	  Say Y to enable the additional validation for the input data to
+	  each control element, including the value range checks.
+	  An error is returned from ALSA core for invalid inputs without
+	  passing to the driver.  This is a kind of hardening for drivers
+	  that have no proper error checks, at the cost of a slight
+	  performance overhead.
+
 config SND_CTL_DEBUG
 	bool "Enable debugging feature for control API"
 	depends on SND_DEBUG
diff --git a/sound/core/control.c b/sound/core/control.c
index 339d420fb9f7..b5bbdabca353 100644
--- a/sound/core/control.c
+++ b/sound/core/control.c
@@ -871,7 +871,7 @@ static void fill_remaining_elem_value(struct snd_ctl_elem_value *control,
 static int sanity_check_int_value(struct snd_card *card,
 				  const struct snd_ctl_elem_value *control,
 				  const struct snd_ctl_elem_info *info,
-				  int i)
+				  int i, bool print_error)
 {
 	long long lval, lmin, lmax, lstep;
 	u64 rem;
@@ -905,21 +905,23 @@ static int sanity_check_int_value(struct snd_card *card,
 	}
 
 	if (lval < lmin || lval > lmax) {
-		dev_err(card->dev,
-			"control %i:%i:%i:%s:%i: value out of range %lld (%lld/%lld) at count %i\n",
-			control->id.iface, control->id.device,
-			control->id.subdevice, control->id.name,
-			control->id.index, lval, lmin, lmax, i);
+		if (print_error)
+			dev_err(card->dev,
+				"control %i:%i:%i:%s:%i: value out of range %lld (%lld/%lld) at count %i\n",
+				control->id.iface, control->id.device,
+				control->id.subdevice, control->id.name,
+				control->id.index, lval, lmin, lmax, i);
 		return -EINVAL;
 	}
 	if (lstep) {
 		div64_u64_rem(lval, lstep, &rem);
 		if (rem) {
-			dev_err(card->dev,
-				"control %i:%i:%i:%s:%i: unaligned value %lld (step %lld) at count %i\n",
-				control->id.iface, control->id.device,
-				control->id.subdevice, control->id.name,
-				control->id.index, lval, lstep, i);
+			if (print_error)
+				dev_err(card->dev,
+					"control %i:%i:%i:%s:%i: unaligned value %lld (step %lld) at count %i\n",
+					control->id.iface, control->id.device,
+					control->id.subdevice, control->id.name,
+					control->id.index, lval, lstep, i);
 			return -EINVAL;
 		}
 	}
@@ -927,15 +929,13 @@ static int sanity_check_int_value(struct snd_card *card,
 	return 0;
 }
 
-/* perform sanity checks to the given snd_ctl_elem_value object */
-static int sanity_check_elem_value(struct snd_card *card,
-				   const struct snd_ctl_elem_value *control,
-				   const struct snd_ctl_elem_info *info,
-				   u32 pattern)
+/* check whether the all input values are valid for the given elem value */
+static int sanity_check_input_values(struct snd_card *card,
+				     const struct snd_ctl_elem_value *control,
+				     const struct snd_ctl_elem_info *info,
+				     bool print_error)
 {
-	size_t offset;
-	int i, ret = 0;
-	u32 *p;
+	int i, ret;
 
 	switch (info->type) {
 	case SNDRV_CTL_ELEM_TYPE_BOOLEAN:
@@ -943,7 +943,8 @@ static int sanity_check_elem_value(struct snd_card *card,
 	case SNDRV_CTL_ELEM_TYPE_INTEGER64:
 	case SNDRV_CTL_ELEM_TYPE_ENUMERATED:
 		for (i = 0; i < info->count; i++) {
-			ret = sanity_check_int_value(card, control, info, i);
+			ret = sanity_check_int_value(card, control, info, i,
+						     print_error);
 			if (ret < 0)
 				return ret;
 		}
@@ -952,6 +953,23 @@ static int sanity_check_elem_value(struct snd_card *card,
 		break;
 	}
 
+	return 0;
+}
+
+/* perform sanity checks to the given snd_ctl_elem_value object */
+static int sanity_check_elem_value(struct snd_card *card,
+				   const struct snd_ctl_elem_value *control,
+				   const struct snd_ctl_elem_info *info,
+				   u32 pattern)
+{
+	size_t offset;
+	int ret;
+	u32 *p;
+
+	ret = sanity_check_input_values(card, control, info, true);
+	if (ret < 0)
+		return ret;
+
 	/* check whether the remaining area kept untouched */
 	offset = value_sizes[info->type] * info->count;
 	offset = DIV_ROUND_UP(offset, sizeof(u32));
@@ -1138,6 +1156,17 @@ static int snd_ctl_elem_write(struct snd_card *card, struct snd_ctl_file *file,
 
 	snd_ctl_build_ioff(&control->id, kctl, index_offset);
 	result = snd_power_ref_and_wait(card);
+	/* validate input values */
+	if (IS_ENABLED(CONFIG_SND_CTL_INPUT_VALIDATION) && !result) {
+		struct snd_ctl_elem_info info;
+
+		memset(&info, 0, sizeof(info));
+		info.id = control->id;
+		result = __snd_ctl_elem_info(card, kctl, &info, NULL);
+		if (!result)
+			result = sanity_check_input_values(card, control, &info,
+							   false);
+	}
 	if (!result)
 		result = kctl->put(kctl, control);
 	snd_power_unref(card);
-- 
2.35.3

