Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 66C18345D3C
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Mar 2021 12:45:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 08B0D167B;
	Tue, 23 Mar 2021 12:44:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 08B0D167B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616499940;
	bh=p0Lsho18kMBpcX9oZF0RqtRkyIQ/xH0OxlLo0/Y+yR0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=M0lC+qI6VLICuzJojqI68OUDIXlC0F6dd3uEMyMV46AYVQ/0WYfZNZ3wK+5YBUhK3
	 +kJADrPy3U9ni9aBaWTJUsrhLB4s3JgDXh+5yc73fRl4l9QK8HQKKJLi3NQDdTVV40
	 5xMJ/KnutLg5CMKoTzXWuUbXQxVfDenFLQgFpjk0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 281B5F80268;
	Tue, 23 Mar 2021 12:44:07 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 98770F80290; Tue, 23 Mar 2021 12:44:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.154.123])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A2FC0F80268
 for <alsa-devel@alsa-project.org>; Tue, 23 Mar 2021 12:43:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A2FC0F80268
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com
 header.b="XZx70d2b"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1616499838; x=1648035838;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=p0Lsho18kMBpcX9oZF0RqtRkyIQ/xH0OxlLo0/Y+yR0=;
 b=XZx70d2b1OIpf+QTBmbSbXeHlL3gFOoCpEt3bIinn3aR5rAo3OURdXK2
 ba7y3kdZLK2c9JjK52ZEiHC/12a5BcYxo+x9AIO6O9eJSLQTXSuJnWWUt
 YJplr1QoRBcTbdbKr+/u6OYMEi92AnaKSb3VxNAGq+aattVmoX5ZJexTd
 qV74ykl8UWkNOYFUtTlD7HgwsjF7UqNKm7+NlviJso25tetRRv1C8ShbS
 MkyArmXemqWLQW1O03JqX71AykY6MIvM3jaG4pDILNZl3q86aOyg0O5gi
 X7GBcSfC3zapw1iyD86XQ1zZWVWYaUOGNnrQ22ZkInKffWHhTah1ZjrHt Q==;
IronPort-SDR: KxRF0h99fh2Si9JhkhH+j+XEhVuCCInGNxke41ZqEE9GgtpT0pHYK3/YaZ6+S62Pv/Y9W8EN/Z
 qmjXXRlymSYzIUkwsQnbJXG3TbmLxCjrN2hfAhog9w17PGUZSjth791SJH2SBUAVYcdK4Ko1zW
 omSAFw30TAVuhbrwnxB94eoID1D9F0ijqJHpQPZob0AiF35dbBnDcjLarXG+NH9FxVAFkADtPY
 j7i1hHe9AG7SWnjbdbUxg9+89HrdMov67H28bZePT+n7J+StNZVc5q6BuKzD+B70HLDXd4LI6U
 AiA=
X-IronPort-AV: E=Sophos;i="5.81,271,1610434800"; d="scan'208";a="108205968"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 23 Mar 2021 04:43:54 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Tue, 23 Mar 2021 04:43:55 -0700
Received: from rob-ult-m19940.amer.actel.com (10.10.115.15) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Tue, 23 Mar 2021 04:43:51 -0700
From: Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
To: <alsa-devel@alsa-project.org>, <linux-kernel@vger.kernel.org>
Subject: [RFC PATCH 2/3] ASoC: soc-pcm: add hw_constraints for BE DAI links
Date: Tue, 23 Mar 2021 13:43:26 +0200
Message-ID: <20210323114327.3969072-3-codrin.ciubotariu@microchip.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210323114327.3969072-1-codrin.ciubotariu@microchip.com>
References: <20210323114327.3969072-1-codrin.ciubotariu@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Cc: gustavoars@kernel.org, tiwai@suse.com, lgirdwood@gmail.com,
 mirq-linux@rere.qmqm.pl, broonie@kernel.org,
 Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
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

Add a new struct snd_pcm_hw_constraints under struct snd_soc_dpcm_runtime.
The BE DAIs can use the new structure to add constraints that will not
affect the FE of the PCM and will only apply to BE HW parameters.

Signed-off-by: Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
---
 include/sound/pcm.h      |  9 ++++++++
 include/sound/soc-dpcm.h |  1 +
 sound/core/pcm_lib.c     | 12 +++++++++--
 sound/core/pcm_native.c  | 20 ++++++++++--------
 sound/soc/soc-pcm.c      | 44 ++++++++++++++++++++++++++++++++++++++++
 5 files changed, 76 insertions(+), 10 deletions(-)

diff --git a/include/sound/pcm.h b/include/sound/pcm.h
index af7fce2b574d..198d37d04d78 100644
--- a/include/sound/pcm.h
+++ b/include/sound/pcm.h
@@ -977,6 +977,15 @@ int snd_interval_ratnum(struct snd_interval *i,
 void _snd_pcm_hw_params_any(struct snd_pcm_hw_params *params);
 void _snd_pcm_hw_param_setempty(struct snd_pcm_hw_params *params, snd_pcm_hw_param_t var);
 
+int snd_pcm_hw_rule_sample_bits(struct snd_pcm_hw_params *params,
+				struct snd_pcm_hw_rule *rule);
+int snd_pcm_hw_rule_format(struct snd_pcm_hw_params *params,
+			   struct snd_pcm_hw_rule *rule);
+int snd_pcm_hw_rule_mul(struct snd_pcm_hw_params *params,
+			struct snd_pcm_hw_rule *rule);
+int snd_pcm_hw_rule_div(struct snd_pcm_hw_params *params,
+			struct snd_pcm_hw_rule *rule);
+
 int snd_pcm_hw_refine(struct snd_pcm_substream *substream, struct snd_pcm_hw_params *params);
 
 int snd_pcm_hw_constraint_mask64(struct snd_pcm_runtime *runtime, snd_pcm_hw_param_t var,
diff --git a/include/sound/soc-dpcm.h b/include/sound/soc-dpcm.h
index e296a3949b18..c5825876824a 100644
--- a/include/sound/soc-dpcm.h
+++ b/include/sound/soc-dpcm.h
@@ -95,6 +95,7 @@ struct snd_soc_dpcm_runtime {
 	int users;
 	struct snd_pcm_runtime *runtime;
 	struct snd_pcm_hw_params hw_params;
+	struct snd_pcm_hw_constraints hw_constraints;
 
 	/* state and update */
 	enum snd_soc_dpcm_update runtime_update;
diff --git a/sound/core/pcm_lib.c b/sound/core/pcm_lib.c
index 582144f99045..125fafdf7517 100644
--- a/sound/core/pcm_lib.c
+++ b/sound/core/pcm_lib.c
@@ -16,6 +16,7 @@
 #include <sound/info.h>
 #include <sound/pcm.h>
 #include <sound/pcm_params.h>
+#include <sound/soc.h>
 #include <sound/timer.h>
 
 #include "pcm_local.h"
@@ -1121,12 +1122,19 @@ int snd_pcm_hw_rule_add(struct snd_pcm_substream *substream, unsigned int cond,
 			snd_pcm_hw_rule_func_t func, void *private,
 			int dep, ...)
 {
-	struct snd_pcm_hw_constraints *constrs =
-					&substream->runtime->hw_constraints;
+	struct snd_pcm_hw_constraints *constrs;
 	struct snd_pcm_hw_rule *c;
 	unsigned int k;
 	va_list args;
 
+	if (substream->pcm->internal) {
+		struct snd_soc_pcm_runtime *rtd = substream->private_data;
+		struct snd_soc_dpcm_runtime *dpcm = &rtd->dpcm[substream->stream];
+
+		constrs = &dpcm->hw_constraints;
+	} else {
+		constrs = &substream->runtime->hw_constraints;
+	}
 	va_start(args, dep);
 	if (constrs->rules_num >= constrs->rules_all) {
 		struct snd_pcm_hw_rule *new;
diff --git a/sound/core/pcm_native.c b/sound/core/pcm_native.c
index 5feeef1b43f1..d6f14162bce5 100644
--- a/sound/core/pcm_native.c
+++ b/sound/core/pcm_native.c
@@ -2278,23 +2278,25 @@ static int snd_pcm_unlink(struct snd_pcm_substream *substream)
 /*
  * hw configurator
  */
-static int snd_pcm_hw_rule_mul(struct snd_pcm_hw_params *params,
-			       struct snd_pcm_hw_rule *rule)
+int snd_pcm_hw_rule_mul(struct snd_pcm_hw_params *params,
+			struct snd_pcm_hw_rule *rule)
 {
 	struct snd_interval t;
 	snd_interval_mul(hw_param_interval_c(params, rule->deps[0]),
 		     hw_param_interval_c(params, rule->deps[1]), &t);
 	return snd_interval_refine(hw_param_interval(params, rule->var), &t);
 }
+EXPORT_SYMBOL(snd_pcm_hw_rule_mul);
 
-static int snd_pcm_hw_rule_div(struct snd_pcm_hw_params *params,
-			       struct snd_pcm_hw_rule *rule)
+int snd_pcm_hw_rule_div(struct snd_pcm_hw_params *params,
+			struct snd_pcm_hw_rule *rule)
 {
 	struct snd_interval t;
 	snd_interval_div(hw_param_interval_c(params, rule->deps[0]),
 		     hw_param_interval_c(params, rule->deps[1]), &t);
 	return snd_interval_refine(hw_param_interval(params, rule->var), &t);
 }
+EXPORT_SYMBOL(snd_pcm_hw_rule_div);
 
 static int snd_pcm_hw_rule_muldivk(struct snd_pcm_hw_params *params,
 				   struct snd_pcm_hw_rule *rule)
@@ -2316,8 +2318,8 @@ static int snd_pcm_hw_rule_mulkdiv(struct snd_pcm_hw_params *params,
 	return snd_interval_refine(hw_param_interval(params, rule->var), &t);
 }
 
-static int snd_pcm_hw_rule_format(struct snd_pcm_hw_params *params,
-				  struct snd_pcm_hw_rule *rule)
+int snd_pcm_hw_rule_format(struct snd_pcm_hw_params *params,
+			   struct snd_pcm_hw_rule *rule)
 {
 	snd_pcm_format_t k;
 	const struct snd_interval *i =
@@ -2337,9 +2339,10 @@ static int snd_pcm_hw_rule_format(struct snd_pcm_hw_params *params,
 	}
 	return snd_mask_refine(mask, &m);
 }
+EXPORT_SYMBOL(snd_pcm_hw_rule_format);
 
-static int snd_pcm_hw_rule_sample_bits(struct snd_pcm_hw_params *params,
-				       struct snd_pcm_hw_rule *rule)
+int snd_pcm_hw_rule_sample_bits(struct snd_pcm_hw_params *params,
+				struct snd_pcm_hw_rule *rule)
 {
 	struct snd_interval t;
 	snd_pcm_format_t k;
@@ -2363,6 +2366,7 @@ static int snd_pcm_hw_rule_sample_bits(struct snd_pcm_hw_params *params,
 	t.integer = 1;
 	return snd_interval_refine(hw_param_interval(params, rule->var), &t);
 }
+EXPORT_SYMBOL(snd_pcm_hw_rule_sample_bits);
 
 #if SNDRV_PCM_RATE_5512 != 1 << 0 || SNDRV_PCM_RATE_192000 != 1 << 12
 #error "Change this table"
diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index 65f8ea73bae7..dae246918e0d 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -1471,6 +1471,43 @@ void dpcm_be_dai_stop(struct snd_soc_pcm_runtime *fe, int stream,
 	}
 }
 
+static int dpcm_hw_constraints_init(struct snd_pcm_substream *substream)
+{
+	int err;
+
+	if (!substream->pcm->internal)
+		return 0;
+
+	err = snd_pcm_hw_rule_add(substream, 0, SNDRV_PCM_HW_PARAM_FORMAT,
+				  snd_pcm_hw_rule_format, NULL,
+				  SNDRV_PCM_HW_PARAM_SAMPLE_BITS, -1);
+	if (err < 0)
+		return err;
+	err = snd_pcm_hw_rule_add(substream, 0, SNDRV_PCM_HW_PARAM_SAMPLE_BITS,
+				  snd_pcm_hw_rule_sample_bits, NULL,
+				  SNDRV_PCM_HW_PARAM_FORMAT,
+				  SNDRV_PCM_HW_PARAM_SAMPLE_BITS, -1);
+	if (err < 0)
+		return err;
+	err = snd_pcm_hw_rule_add(substream, 0, SNDRV_PCM_HW_PARAM_SAMPLE_BITS,
+				  snd_pcm_hw_rule_div, NULL,
+				  SNDRV_PCM_HW_PARAM_FRAME_BITS, SNDRV_PCM_HW_PARAM_CHANNELS, -1);
+	if (err < 0)
+		return err;
+	err = snd_pcm_hw_rule_add(substream, 0, SNDRV_PCM_HW_PARAM_FRAME_BITS,
+				  snd_pcm_hw_rule_mul, NULL,
+				  SNDRV_PCM_HW_PARAM_SAMPLE_BITS, SNDRV_PCM_HW_PARAM_CHANNELS, -1);
+	if (err < 0)
+		return err;
+	err = snd_pcm_hw_rule_add(substream, 0, SNDRV_PCM_HW_PARAM_CHANNELS,
+				  snd_pcm_hw_rule_div, NULL,
+				  SNDRV_PCM_HW_PARAM_FRAME_BITS, SNDRV_PCM_HW_PARAM_SAMPLE_BITS,
+				  -1);
+	if (err < 0)
+		return err;
+	return 0;
+}
+
 int dpcm_be_dai_startup(struct snd_soc_pcm_runtime *fe, int stream)
 {
 	struct snd_soc_pcm_runtime *be;
@@ -1513,6 +1550,13 @@ int dpcm_be_dai_startup(struct snd_soc_pcm_runtime *fe, int stream)
 			stream ? "capture" : "playback", be->dai_link->name);
 
 		be_substream->runtime = be->dpcm[stream].runtime;
+
+		/* initialize the BE constraints */
+		err = dpcm_hw_constraints_init(be_substream);
+		if (err < 0) {
+			dev_dbg(be->dev, "dpcm_hw_constraints_init failed\n");
+			goto unwind;
+		}
 		err = soc_pcm_open(be_substream);
 		if (err < 0) {
 			be->dpcm[stream].users--;
-- 
2.27.0

