Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BA86A6F8722
	for <lists+alsa-devel@lfdr.de>; Fri,  5 May 2023 18:57:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EC67F2D64;
	Fri,  5 May 2023 18:56:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EC67F2D64
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683305840;
	bh=5k2EEJbKh9lvF3Khnjqqy1PqsOydvu2y7CYBKzNMLl4=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ddwBZ+hJ3y8peFPfHMwB9VIhwHcvz95S7Xu64wiGzCmcDC7H+S8OMRg4oBfampL7i
	 uDBFVyttYpERhtzIOxLvOm8U23NTBq7ES1bKNTaeveg5Yd6ty5mzOsE4UVg01oVTN7
	 8giQ5V8nh69DZFKGuT9qzTAFPW0SjGihsfMZFjO4=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 25F8BF80544;
	Fri,  5 May 2023 18:55:41 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 83366F80520; Fri,  5 May 2023 18:55:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 79FD3F80520
	for <alsa-devel@alsa-project.org>; Fri,  5 May 2023 18:55:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 79FD3F80520
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=euW9BAvF
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-3f195b164c4so14338945e9.1
        for <alsa-devel@alsa-project.org>;
 Fri, 05 May 2023 09:55:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683305726; x=1685897726;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aF6c8vCGTR2QK7g+acfgalvT960Ey/zX9u4pUO/YPk4=;
        b=euW9BAvFE3t8iXyBsk24WqybtXMz1hn3/8p/p/SMWqG4ZV999cMBeAtF0afO96udkc
         hVHkCRO060nJyTif0EyCHr/FIioeqMhH15kXHq6m9gg/aW9nHWW+JjBgx/n/irJFyeNN
         RKrZaFDs+/5AbGQr6mKXRT0Z5OMw4Zr1jNERuUMH1OPOR9ojXB1+Sm6mzCi+bUyatuRs
         EPf0tthaARk1SxWI8TGPler1LKwustDq+QSfiN1fttlsMvqNMb6tzxQji395ttDYRqr9
         5XOHQmWffE/Z8qnOCD/wNOawcOR1jJexdSnHTd0UGMxsPjZ4ZMa0r0bj0Ahbt5Nd836w
         G4Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683305726; x=1685897726;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aF6c8vCGTR2QK7g+acfgalvT960Ey/zX9u4pUO/YPk4=;
        b=HTN/Ad1nYyv488OdyLtpCG4CKh+sQh/gsddipaODPPOBTIX2JlZrL83wvtPfxWYQIH
         Z2+ER4y7PgQ/svNoZdvJgu7yjQ0unMfK4os0+vVxPCiazxaDXz9dhukZQWmRTJrvUb4g
         Q3VuK21KSWQZCtrwjp70Ww4CM0elsCARuJ4aRk/EUZVQfp2KY/pja4Ac/5ebuBQnY1Rq
         4jORplwQiUy2t02D3zORgn4lqGU2zuKP0J8fTZ70zIojVQuTEJhIwOcmcd41AETx/p+S
         v1WFrjG4DVQNoR4u6nGxqbVGoxarjvu+vpbsBk+VgqT2aMMRQMA8rnQnm4+KQqnn+RYP
         XQSw==
X-Gm-Message-State: AC+VfDynvQecfKiA9ni5SGwplo1WF4HQ+bQFvteVa4HK3Rp7rQQL7NMr
	VbJ3TC5qg02skrl3ZLayuavfLw==
X-Google-Smtp-Source: 
 ACHHUZ4ZlBcgwrnBXnaGvQz3fDW5M2lcW+c3h6TrPi1wm2tp5F2+pVpr65y2y9ab/41UtPIf0A16/Q==
X-Received: by 2002:a5d:48cc:0:b0:304:adbe:ea9d with SMTP id
 p12-20020a5d48cc000000b00304adbeea9dmr2018714wrs.30.1683305726481;
        Fri, 05 May 2023 09:55:26 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id
 x7-20020adfffc7000000b002c7066a6f77sm2923551wrs.31.2023.05.05.09.55.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 May 2023 09:55:25 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org,
	tiwai@suse.com
Subject: [PATCH 1/3] ALSA: pcm: add snd_pcm_add_chmap_ctls_with_prefix
Date: Fri,  5 May 2023 17:55:12 +0100
Message-Id: <20230505165514.4666-2-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20230505165514.4666-1-srinivas.kandagatla@linaro.org>
References: <20230505165514.4666-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 3L3AV5CHGCQ3M3OZ3Y7UGQ6BUCDDEVFS
X-Message-ID-Hash: 3L3AV5CHGCQ3M3OZ3Y7UGQ6BUCDDEVFS
X-MailFrom: srinivas.kandagatla@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: lgirdwood@gmail.com, ckeepax@opensource.cirrus.com,
 kuninori.morimoto.gx@renesas.com, linux-kernel@vger.kernel.org,
 pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3L3AV5CHGCQ3M3OZ3Y7UGQ6BUCDDEVFS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Qualcomm SoC which has multiple Display Port controllers, using
snd_pcm_add_chmap_ctls() to add chmap controls from every ASoC hdmi codec
instance for a give card fails while adding second instance as the control
with same name "Playback Channel Map" already exists from the first instance.

Fix this by adding a new api wrapper to pass ASoC component name prefix to
avoid such duplicate control naming.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
We can also make snd_pcm_add_chmap_ctls to take prefix argument and avoid adding
this new api, but that would touch lots of drivers.


 include/sound/pcm.h  |  7 +++++++
 sound/core/pcm_lib.c | 30 ++++++++++++++++++++++++++++--
 2 files changed, 35 insertions(+), 2 deletions(-)

diff --git a/include/sound/pcm.h b/include/sound/pcm.h
index 27040b472a4f..39efd25b53e3 100644
--- a/include/sound/pcm.h
+++ b/include/sound/pcm.h
@@ -1528,6 +1528,13 @@ int snd_pcm_add_chmap_ctls(struct snd_pcm *pcm, int stream,
 			   unsigned long private_value,
 			   struct snd_pcm_chmap **info_ret);
 
+int snd_pcm_add_chmap_ctls_with_prefix(struct snd_pcm *pcm, int stream,
+				       const struct snd_pcm_chmap_elem *chmap,
+				       int max_channels,
+				       unsigned long private_value,
+				       struct snd_pcm_chmap **info_ret,
+				       const char *prefix);
+
 /**
  * pcm_format_to_bits - Strong-typed conversion of pcm_format to bitwise
  * @pcm_format: PCM format
diff --git a/sound/core/pcm_lib.c b/sound/core/pcm_lib.c
index 8b6aeb8a78f7..ed75dd007425 100644
--- a/sound/core/pcm_lib.c
+++ b/sound/core/pcm_lib.c
@@ -2483,11 +2483,12 @@ static void pcm_chmap_ctl_private_free(struct snd_kcontrol *kcontrol)
  * Create channel-mapping control elements assigned to the given PCM stream(s).
  * Return: Zero if successful, or a negative error value.
  */
-int snd_pcm_add_chmap_ctls(struct snd_pcm *pcm, int stream,
+int snd_pcm_add_chmap_ctls_with_prefix(struct snd_pcm *pcm, int stream,
 			   const struct snd_pcm_chmap_elem *chmap,
 			   int max_channels,
 			   unsigned long private_value,
-			   struct snd_pcm_chmap **info_ret)
+			   struct snd_pcm_chmap **info_ret,
+			   const char *prefix)
 {
 	struct snd_pcm_chmap *info;
 	struct snd_kcontrol_new knew = {
@@ -2499,6 +2500,7 @@ int snd_pcm_add_chmap_ctls(struct snd_pcm *pcm, int stream,
 		.get = pcm_chmap_ctl_get,
 		.tlv.c = pcm_chmap_ctl_tlv,
 	};
+	char *name = NULL;
 	int err;
 
 	if (WARN_ON(pcm->streams[stream].chmap_kctl))
@@ -2514,10 +2516,21 @@ int snd_pcm_add_chmap_ctls(struct snd_pcm *pcm, int stream,
 		knew.name = "Playback Channel Map";
 	else
 		knew.name = "Capture Channel Map";
+
+	if (prefix) {
+		name = kasprintf(GFP_KERNEL, "%s %s", prefix, knew.name);
+		if (!name) {
+			kfree(info);
+			return -ENOMEM;
+		}
+		knew.name = name;
+	}
+
 	knew.device = pcm->device;
 	knew.count = pcm->streams[stream].substream_count;
 	knew.private_value = private_value;
 	info->kctl = snd_ctl_new1(&knew, info);
+	kfree(name);
 	if (!info->kctl) {
 		kfree(info);
 		return -ENOMEM;
@@ -2530,5 +2543,18 @@ int snd_pcm_add_chmap_ctls(struct snd_pcm *pcm, int stream,
 	if (info_ret)
 		*info_ret = info;
 	return 0;
+
+}
+EXPORT_SYMBOL_GPL(snd_pcm_add_chmap_ctls_with_prefix);
+
+int snd_pcm_add_chmap_ctls(struct snd_pcm *pcm, int stream,
+			   const struct snd_pcm_chmap_elem *chmap,
+			   int max_channels,
+			   unsigned long private_value,
+			   struct snd_pcm_chmap **info_ret)
+{
+	return snd_pcm_add_chmap_ctls_with_prefix(pcm, stream, chmap,
+						  max_channels, private_value,
+						  info_ret, NULL);
 }
 EXPORT_SYMBOL_GPL(snd_pcm_add_chmap_ctls);
-- 
2.21.0

