Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 386E285D7FA
	for <lists+alsa-devel@lfdr.de>; Wed, 21 Feb 2024 13:38:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 323674E;
	Wed, 21 Feb 2024 13:37:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 323674E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1708519086;
	bh=UDRJNcMfS4oSPBnggypHTrgPtHb2+3yc/hHC3eHVNRA=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=hq0KlGkT4kUAuGaeqCTfAN4MLF7UzT9ggcTuEy6GRwarZ63ZinHo7jypvPvpp7RUT
	 O7Wsykba/iGjVrjZqiJPx7ikflE/qezGMyjwhBLLlJqwEteYvxRwx/I7a+uaWg9xxt
	 qJvpxXxtN20ONK7v3ETErXUiC+HXVlQpeEPQvpko=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E350BF804B0; Wed, 21 Feb 2024 13:37:34 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 40457F804B0;
	Wed, 21 Feb 2024 13:37:34 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2669FF80496; Wed, 21 Feb 2024 13:37:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D139BF80104
	for <alsa-devel@alsa-project.org>; Wed, 21 Feb 2024 13:37:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D139BF80104
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=mzF8kEVj
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 41LCULT3002539;
	Wed, 21 Feb 2024 06:37:12 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PODMain02222019; bh=p
	8gAJKbo8NE3otTnGNSU2ViudpzVeoRdpYMa/IBxcXg=; b=mzF8kEVjFlYchlsvH
	CWdHSP3rY9tb2NBYpXekcYSQzzzT1wjqvT92iQnjDby8TCsZ/T2Jd5294DZdcr6S
	NM32Xi9OLYRHeGQY+L2Xx8JCS/g5+JhqUxuFtfrE0UqTXYriDMhDS7+kMVvmHq44
	FDantb/WLmTqrjRgofwM6oK+Jokztr7008E7OxKxHm3lLhp4txhBa+rlYuDGES4l
	1ozSA/FFUlrFKOMS9wqMoiw4XtFnwC4REBNbK3uoDQd/wPZX3PaB5oHb7dN+dJxi
	UhlOuOk1nDEbYbbMsmC41iNoUQr1QZvHGcrWGHQ8yJdkZV8S8Eqsem5HDlUc3AiK
	Ke+Bg==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3wd207gxtx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 Feb 2024 06:37:12 -0600 (CST)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Wed, 21 Feb
 2024 12:37:10 +0000
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 ediex01.ad.cirrus.com (198.61.84.80) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40 via Frontend Transport; Wed, 21 Feb 2024 12:37:10 +0000
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com
 [198.90.208.18])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 24720820241;
	Wed, 21 Feb 2024 12:37:10 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <broonie@kernel.org>, <shengjiu.wang@gmail.com>, <Xiubo.Lee@gmail.com>
CC: <linux-sound@vger.kernel.org>, <alsa-devel@alsa-project.org>,
        <linux-kernel@vger.kernel.org>, <linuxppc-dev@lists.ozlabs.org>,
        <patches@opensource.cirrus.com>,
        Richard Fitzgerald
	<rf@opensource.cirrus.com>
Subject: [PATCH] ASoC: soc-card: Fix missing locking in
 snd_soc_card_get_kcontrol()
Date: Wed, 21 Feb 2024 12:37:10 +0000
Message-ID: <20240221123710.690224-1-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: i7brLjb8Ucmc36s854s1B2eW7kb5tHjW
X-Proofpoint-ORIG-GUID: i7brLjb8Ucmc36s854s1B2eW7kb5tHjW
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: DUH4ICYHRSFCZHTLQOIIULOKQMJWRG3Z
X-Message-ID-Hash: DUH4ICYHRSFCZHTLQOIIULOKQMJWRG3Z
X-MailFrom: prvs=97814b2c7f=rf@opensource.cirrus.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DUH4ICYHRSFCZHTLQOIIULOKQMJWRG3Z/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

snd_soc_card_get_kcontrol() must be holding a read lock on
card->controls_rwsem while walking the controls list.

Compare with snd_ctl_find_numid().

The existing function is renamed snd_soc_card_get_kcontrol_locked()
so that it can be called from contexts that are already holding
card->controls_rwsem (for example, control get/put functions).

There are few direct or indirect callers of
snd_soc_card_get_kcontrol(), and most are safe. Three require
changes, which have been included in this patch:

codecs/cs35l45.c:
  cs35l45_activate_ctl() is called from a control put() function so
  is changed to call snd_soc_card_get_kcontrol_locked().

codecs/cs35l56.c:
  cs35l56_sync_asp1_mixer_widgets_with_firmware() is called from
  control get()/put() functions so is changed to call
  snd_soc_card_get_kcontrol_locked().

fsl/fsl_xcvr.c:
  fsl_xcvr_activate_ctl() is called from three places, one of which
  already holds card->controls_rwsem:
  1. fsl_xcvr_mode_put(), a control put function, which will
     already be holding card->controls_rwsem.
  2. fsl_xcvr_startup(), a DAI startup function.
  3. fsl_xcvr_shutdown(), a DAI shutdown function.

  To fix this, fsl_xcvr_activate_ctl() has been changed to call
  snd_soc_card_get_kcontrol_locked() so that it is safe to call
  directly from fsl_xcvr_mode_put().
  The fsl_xcvr_startup() and fsl_xcvr_shutdown() functions have been
  changed to take a read lock on card->controls_rsem() around calls
  to fsl_xcvr_activate_ctl(). While this is not very elegant, it
  keeps the change small, to avoid this patch creating a large
  collateral churn in fsl/fsl_xcvr.c.

Analysis of other callers of snd_soc_card_get_kcontrol() is that
they do not need any changes, they are not holding card->controls_rwsem
when they call snd_soc_card_get_kcontrol().

Direct callers of snd_soc_card_get_kcontrol():
  fsl/fsl_spdif.c: fsl_spdif_dai_probe() - DAI probe function
  fsl/fsl_micfil.c: voice_detected_fn() - IRQ handler

Indirect callers via soc_component_notify_control():
  codecs/cs42l43: cs42l43_mic_shutter() - IRQ handler
  codecs/cs42l43: cs42l43_spk_shutter() - IRQ handler
  codecs/ak4118.c: ak4118_irq_handler() - IRQ handler
  codecs/wm_adsp.c: wm_adsp_write_ctl() - not currently used

Indirect callers via snd_soc_limit_volume():
  qcom/sc8280xp.c: sc8280xp_snd_init() - DAIlink init function
  ti/rx51.c: rx51_aic34_init() - DAI init function

I don't have hardware to test the fsl/*, qcom/sc828xp.c, ti/rx51.c
and ak4118.c changes.

Backport note:
The fsl/, qcom/, cs35l45, cs35l56 and cs42l43 callers were added
since the Fixes commit so won't all be present on older kernels.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
Fixes: 209c6cdfd283 ("ASoC: soc-card: move snd_soc_card_get_kcontrol() to soc-card")
---
It would be great if people could test the fsl/, qcom/, ti/rx51 and ak4418
drivers.
---
 include/sound/soc-card.h   |  2 ++
 sound/soc/codecs/cs35l45.c |  2 +-
 sound/soc/codecs/cs35l56.c |  2 +-
 sound/soc/fsl/fsl_xcvr.c   | 12 +++++++++++-
 sound/soc/soc-card.c       | 24 ++++++++++++++++++++++--
 5 files changed, 37 insertions(+), 5 deletions(-)

diff --git a/include/sound/soc-card.h b/include/sound/soc-card.h
index ecc02e955279..1f4c39922d82 100644
--- a/include/sound/soc-card.h
+++ b/include/sound/soc-card.h
@@ -30,6 +30,8 @@ static inline void snd_soc_card_mutex_unlock(struct snd_soc_card *card)
 
 struct snd_kcontrol *snd_soc_card_get_kcontrol(struct snd_soc_card *soc_card,
 					       const char *name);
+struct snd_kcontrol *snd_soc_card_get_kcontrol_locked(struct snd_soc_card *soc_card,
+						      const char *name);
 int snd_soc_card_jack_new(struct snd_soc_card *card, const char *id, int type,
 			  struct snd_soc_jack *jack);
 int snd_soc_card_jack_new_pins(struct snd_soc_card *card, const char *id,
diff --git a/sound/soc/codecs/cs35l45.c b/sound/soc/codecs/cs35l45.c
index 44c221745c3b..2392c6effed8 100644
--- a/sound/soc/codecs/cs35l45.c
+++ b/sound/soc/codecs/cs35l45.c
@@ -184,7 +184,7 @@ static int cs35l45_activate_ctl(struct snd_soc_component *component,
 	else
 		snprintf(name, SNDRV_CTL_ELEM_ID_NAME_MAXLEN, "%s", ctl_name);
 
-	kcontrol = snd_soc_card_get_kcontrol(component->card, name);
+	kcontrol = snd_soc_card_get_kcontrol_locked(component->card, name);
 	if (!kcontrol) {
 		dev_err(component->dev, "Can't find kcontrol %s\n", name);
 		return -EINVAL;
diff --git a/sound/soc/codecs/cs35l56.c b/sound/soc/codecs/cs35l56.c
index 2c1313e34cce..6dd0319bc843 100644
--- a/sound/soc/codecs/cs35l56.c
+++ b/sound/soc/codecs/cs35l56.c
@@ -114,7 +114,7 @@ static int cs35l56_sync_asp1_mixer_widgets_with_firmware(struct cs35l56_private
 			name = full_name;
 		}
 
-		kcontrol = snd_soc_card_get_kcontrol(dapm->card, name);
+		kcontrol = snd_soc_card_get_kcontrol_locked(dapm->card, name);
 		if (!kcontrol) {
 			dev_warn(cs35l56->base.dev, "Could not find control %s\n", name);
 			continue;
diff --git a/sound/soc/fsl/fsl_xcvr.c b/sound/soc/fsl/fsl_xcvr.c
index f0fb33d719c2..c46f64557a7f 100644
--- a/sound/soc/fsl/fsl_xcvr.c
+++ b/sound/soc/fsl/fsl_xcvr.c
@@ -174,7 +174,9 @@ static int fsl_xcvr_activate_ctl(struct snd_soc_dai *dai, const char *name,
 	struct snd_kcontrol *kctl;
 	bool enabled;
 
-	kctl = snd_soc_card_get_kcontrol(card, name);
+	lockdep_assert_held(&card->snd_card->controls_rwsem);
+
+	kctl = snd_soc_card_get_kcontrol_locked(card, name);
 	if (kctl == NULL)
 		return -ENOENT;
 
@@ -576,10 +578,14 @@ static int fsl_xcvr_startup(struct snd_pcm_substream *substream,
 	xcvr->streams |= BIT(substream->stream);
 
 	if (!xcvr->soc_data->spdif_only) {
+		struct snd_soc_card *card = dai->component->card;
+
 		/* Disable XCVR controls if there is stream started */
+		down_read(&card->snd_card->controls_rwsem);
 		fsl_xcvr_activate_ctl(dai, fsl_xcvr_mode_kctl.name, false);
 		fsl_xcvr_activate_ctl(dai, fsl_xcvr_arc_mode_kctl.name, false);
 		fsl_xcvr_activate_ctl(dai, fsl_xcvr_earc_capds_kctl.name, false);
+		up_read(&card->snd_card->controls_rwsem);
 	}
 
 	return 0;
@@ -598,11 +604,15 @@ static void fsl_xcvr_shutdown(struct snd_pcm_substream *substream,
 	/* Enable XCVR controls if there is no stream started */
 	if (!xcvr->streams) {
 		if (!xcvr->soc_data->spdif_only) {
+			struct snd_soc_card *card = dai->component->card;
+
+			down_read(&card->snd_card->controls_rwsem);
 			fsl_xcvr_activate_ctl(dai, fsl_xcvr_mode_kctl.name, true);
 			fsl_xcvr_activate_ctl(dai, fsl_xcvr_arc_mode_kctl.name,
 						(xcvr->mode == FSL_XCVR_MODE_ARC));
 			fsl_xcvr_activate_ctl(dai, fsl_xcvr_earc_capds_kctl.name,
 						(xcvr->mode == FSL_XCVR_MODE_EARC));
+			up_read(&card->snd_card->controls_rwsem);
 		}
 		ret = regmap_update_bits(xcvr->regmap, FSL_XCVR_EXT_IER0,
 					 FSL_XCVR_IRQ_EARC_ALL, 0);
diff --git a/sound/soc/soc-card.c b/sound/soc/soc-card.c
index 285ab4c9c716..8a2f163da6bc 100644
--- a/sound/soc/soc-card.c
+++ b/sound/soc/soc-card.c
@@ -5,6 +5,9 @@
 // Copyright (C) 2019 Renesas Electronics Corp.
 // Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
 //
+
+#include <linux/lockdep.h>
+#include <linux/rwsem.h>
 #include <sound/soc.h>
 #include <sound/jack.h>
 
@@ -26,12 +29,15 @@ static inline int _soc_card_ret(struct snd_soc_card *card,
 	return ret;
 }
 
-struct snd_kcontrol *snd_soc_card_get_kcontrol(struct snd_soc_card *soc_card,
-					       const char *name)
+struct snd_kcontrol *snd_soc_card_get_kcontrol_locked(struct snd_soc_card *soc_card,
+						      const char *name)
 {
 	struct snd_card *card = soc_card->snd_card;
 	struct snd_kcontrol *kctl;
 
+	/* must be held read or write */
+	lockdep_assert_held(&card->controls_rwsem);
+
 	if (unlikely(!name))
 		return NULL;
 
@@ -40,6 +46,20 @@ struct snd_kcontrol *snd_soc_card_get_kcontrol(struct snd_soc_card *soc_card,
 			return kctl;
 	return NULL;
 }
+EXPORT_SYMBOL_GPL(snd_soc_card_get_kcontrol_locked);
+
+struct snd_kcontrol *snd_soc_card_get_kcontrol(struct snd_soc_card *soc_card,
+					       const char *name)
+{
+	struct snd_card *card = soc_card->snd_card;
+	struct snd_kcontrol *kctl;
+
+	down_read(&card->controls_rwsem);
+	kctl = snd_soc_card_get_kcontrol_locked(soc_card, name);
+	up_read(&card->controls_rwsem);
+
+	return kctl;
+}
 EXPORT_SYMBOL_GPL(snd_soc_card_get_kcontrol);
 
 static int jack_new(struct snd_soc_card *card, const char *id, int type,
-- 
2.30.2

