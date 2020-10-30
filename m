Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D6DDF2A059D
	for <lists+alsa-devel@lfdr.de>; Fri, 30 Oct 2020 13:41:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D00B81685;
	Fri, 30 Oct 2020 13:40:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D00B81685
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1604061666;
	bh=c6WLYg49vV2esP9nfd89JPsZ/QOfCsLDtNliwuY6/3Y=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qdm1eKX9FebZs3H9oEWrDjuDTcV5MK1ZhvbwdWXFxPk24ibKxIIqSdkGuMgQ8B0KK
	 9GUXAkskn5F8y31J5Yanj0lwiYbqKwBNi3MY1N2vk6aeqGTi0l/lfgNaSl5HWcj5im
	 ixIbKeDea5ofPi3eyKo8wTpQYPM8i74afjwd4f/I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A60F5F804E3;
	Fri, 30 Oct 2020 13:37:55 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AA913F804CC; Fri, 30 Oct 2020 13:37:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8E075F80212
 for <alsa-devel@alsa-project.org>; Fri, 30 Oct 2020 13:37:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8E075F80212
IronPort-SDR: azqECG/6l9gyBgC/vMOtBMGS4Qic71wyhc8bTdwqK6TFmsLvRp7vbsKrLWnZ6Ctxz5ZkQvHEUS
 j4ymaJp4XN9A==
X-IronPort-AV: E=McAfee;i="6000,8403,9789"; a="230234015"
X-IronPort-AV: E=Sophos;i="5.77,433,1596524400"; d="scan'208";a="230234015"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2020 05:37:43 -0700
IronPort-SDR: BpV29W/C2tvqFhD7q2ZdtQwVVMXSo5Gz8xojKWAHkFliKEJtwNy0iHESs+R7K/4LFhi+dhSUVu
 80DbddPe+TPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,433,1596524400"; d="scan'208";a="362433739"
Received: from pi-desktop.igk.intel.com ([10.237.148.102])
 by orsmga007.jf.intel.com with ESMTP; 30 Oct 2020 05:37:41 -0700
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>
Subject: [PATCH 5/6] ASoC: topology: Remove empty functions
Date: Fri, 30 Oct 2020 10:54:26 -0400
Message-Id: <20201030145427.3497990-6-amadeuszx.slawinski@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201030145427.3497990-1-amadeuszx.slawinski@linux.intel.com>
References: <20201030145427.3497990-1-amadeuszx.slawinski@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
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

From: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>

After changing memory management to resource managed one, some of the
functions became no ops, remove them as they are no longer needed.

Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
---
 sound/soc/soc-topology.c | 44 ----------------------------------------
 1 file changed, 44 deletions(-)

diff --git a/sound/soc/soc-topology.c b/sound/soc/soc-topology.c
index 6ef508f56a5f..4f632aeeeb5e 100644
--- a/sound/soc/soc-topology.c
+++ b/sound/soc/soc-topology.c
@@ -79,8 +79,6 @@ struct soc_tplg {
 
 static int soc_tplg_process_headers(struct soc_tplg *tplg);
 static void soc_tplg_complete(struct soc_tplg *tplg);
-static void soc_tplg_denum_remove_texts(struct soc_enum *se);
-static void soc_tplg_denum_remove_values(struct soc_enum *se);
 
 /* check we dont overflow the data for this control chunk */
 static int soc_tplg_check_elem_count(struct soc_tplg *tplg, size_t elem_size,
@@ -375,7 +373,6 @@ static void remove_enum(struct snd_soc_component *comp,
 	struct snd_soc_dobj *dobj, int pass)
 {
 	struct snd_card *card = comp->card->snd_card;
-	struct soc_enum *se = container_of(dobj, struct soc_enum, dobj);
 
 	if (pass != SOC_TPLG_PASS_MIXER)
 		return;
@@ -385,9 +382,6 @@ static void remove_enum(struct snd_soc_component *comp,
 
 	snd_ctl_remove(card, dobj->control.kcontrol);
 	list_del(&dobj->list);
-
-	soc_tplg_denum_remove_values(se);
-	soc_tplg_denum_remove_texts(se);
 }
 
 /* remove a byte kcontrol */
@@ -445,15 +439,9 @@ static void remove_widget(struct snd_soc_component *comp,
 		/* enumerated widget mixer */
 		for (i = 0; w->kcontrols != NULL && i < w->num_kcontrols; i++) {
 			struct snd_kcontrol *kcontrol = w->kcontrols[i];
-			struct soc_enum *se =
-				(struct soc_enum *)kcontrol->private_value;
 
 			snd_ctl_remove(card, kcontrol);
 
-			/* free enum kcontrol's dvalues and dtexts */
-			soc_tplg_denum_remove_values(se);
-			soc_tplg_denum_remove_texts(se);
-
 		}
 	} else {
 		/* volume mixer or bytes controls */
@@ -703,11 +691,6 @@ static int soc_tplg_create_tlv(struct soc_tplg *tplg,
 	return 0;
 }
 
-static inline void soc_tplg_free_tlv(struct soc_tplg *tplg,
-	struct snd_kcontrol_new *kc)
-{
-}
-
 static int soc_tplg_dbytes_create(struct soc_tplg *tplg, unsigned int count,
 	size_t size)
 {
@@ -868,7 +851,6 @@ static int soc_tplg_dmixer_create(struct soc_tplg *tplg, unsigned int count,
 		if (err < 0) {
 			dev_err(tplg->dev, "ASoC: failed to init %s\n",
 				mc->hdr.name);
-			soc_tplg_free_tlv(tplg, &kc);
 			break;
 		}
 
@@ -878,7 +860,6 @@ static int soc_tplg_dmixer_create(struct soc_tplg *tplg, unsigned int count,
 		if (err < 0) {
 			dev_err(tplg->dev, "ASoC: failed to add %s\n",
 				mc->hdr.name);
-			soc_tplg_free_tlv(tplg, &kc);
 			break;
 		}
 
@@ -918,15 +899,9 @@ static int soc_tplg_denum_create_texts(struct soc_tplg *tplg, struct soc_enum *s
 	return 0;
 
 err:
-	se->items = i;
-	soc_tplg_denum_remove_texts(se);
 	return ret;
 }
 
-static inline void soc_tplg_denum_remove_texts(struct soc_enum *se)
-{
-}
-
 static int soc_tplg_denum_create_values(struct soc_tplg *tplg, struct soc_enum *se,
 					struct snd_soc_tplg_enum_control *ec)
 {
@@ -949,10 +924,6 @@ static int soc_tplg_denum_create_values(struct soc_tplg *tplg, struct soc_enum *
 	return 0;
 }
 
-static inline void soc_tplg_denum_remove_values(struct soc_enum *se)
-{
-}
-
 static int soc_tplg_denum_create(struct soc_tplg *tplg, unsigned int count,
 	size_t size)
 {
@@ -1322,10 +1293,6 @@ static struct snd_kcontrol_new *soc_tplg_dapm_widget_dmixer_create(
 	return kc;
 
 err_sm:
-	for (; i >= 0; i--) {
-		soc_tplg_free_tlv(tplg, &kc[i]);
-	}
-
 	return NULL;
 }
 
@@ -1422,17 +1389,6 @@ static struct snd_kcontrol_new *soc_tplg_dapm_widget_denum_create(
 	return kc;
 
 err_se:
-	for (; i >= 0; i--) {
-		/* free values and texts */
-		se = (struct soc_enum *)kc[i].private_value;
-
-		if (se) {
-			soc_tplg_denum_remove_values(se);
-			soc_tplg_denum_remove_texts(se);
-		}
-
-	}
-
 	return NULL;
 }
 
-- 
2.25.1

