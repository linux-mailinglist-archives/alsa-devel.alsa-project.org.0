Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AAEAE729DC3
	for <lists+alsa-devel@lfdr.de>; Fri,  9 Jun 2023 17:05:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BE43185D;
	Fri,  9 Jun 2023 17:04:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BE43185D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686323124;
	bh=OyghqCqu7iAY1dQNZkVS0doUzQHuwH/M533DHpFW00E=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=ash/nwRRKyw+g2xSLNqZ8txm2bTJtfX7cTfVMACC3s5OqshONdyly2dvED2qM8HAl
	 aNSKQ7g0C42ZIv4yjbhtIIlPwPKkNnmmI0WfBT8mEu8sNqjQr2sAfrKKmznJSoO/0l
	 EMgtNdwR8p4ZphLggf4Sxyww+dr/IRoBTcTxJeEc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3B4C8F80290; Fri,  9 Jun 2023 17:04:33 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 769B0F8016C;
	Fri,  9 Jun 2023 17:04:33 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 85288F80199; Fri,  9 Jun 2023 17:04:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4A47FF800ED
	for <alsa-devel@alsa-project.org>; Fri,  9 Jun 2023 17:04:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4A47FF800ED
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=mgm79aK5
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-3f7f4819256so14501205e9.1
        for <alsa-devel@alsa-project.org>;
 Fri, 09 Jun 2023 08:04:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686323065; x=1688915065;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2WGZ/ed2vrJ5KRXftei7L+b/a8JlbJSLWIRO6uJ+BPA=;
        b=mgm79aK5ZEyzsjL4fshBGIDqime5sfPSyhoXjr89GPPJML5PZXLCSy2RCsJHtbQVoc
         joZsRl99ZwtTpryeLpdTql1KIdb+cwSF7FLYE8E1ut+OeiHO0XFgsLoco3dSKa/guzRq
         +wSB5yi8UNqipIlEeUxnBtX2vpoUqwzYukPP9U2CA/OJFz8PoJ83g6D6hAk48fdjjn7W
         uPw8t8MMAsNb0OInvMc3lssBS93yN+0IwT06zsZALOCy3cbFC9l4zDMIQnKSb65UvTtN
         wq1TCSzd09ftW4qrg7rGlqfc37FNB0gWeTIsCq3Oz+t1ke8Uat1SrJevfsMmUA1fnAPh
         6NXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686323065; x=1688915065;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2WGZ/ed2vrJ5KRXftei7L+b/a8JlbJSLWIRO6uJ+BPA=;
        b=N6kdlwmyWu6Xxnpgxn+EOPzvdRamShwMS+0muIDgomY1JA3OgvRZttFOEAYrWwzpcY
         Y8WIVDDu/pdgkB4j8L9W7ampEIK8vYZWRuRhudngTS/rAJgiasZh2mqWARdVwcdD47OR
         3maAi2/ibF9RGYIzD3lzhgMks/IR7P3uvzj59FOUDmzqzE0CqEZK45b3Ld+k+alu/q3C
         A72VrSJHSGgKxmFZLrXFXJKhP1etdrkeM9+f2CQMRZH3me+iZ9UrJuAaPrIYhCMdzjfJ
         ud3Sd+XqA7g1uGnKW8kXLZx8qKWSIxY7i588rD58hUGAnvXc4ejEP03oBCzYg/dAxX1z
         EBYg==
X-Gm-Message-State: AC+VfDyq4Zd6ELNa1oyg/RVbCXiNb4igF530dC3qI8c8mlXBnYFq+64P
	qHG7Zk2OI6w3AGTDtM6UIUb8Zw==
X-Google-Smtp-Source: 
 ACHHUZ7eaW16qzdTf8udY5wHHza5lq/L2Y9Nr39LRq/YBL3Qd2LXZ9BnBUzkteeXGvdPFEbRzMo11A==
X-Received: by 2002:a05:600c:2212:b0:3f4:23b9:eed2 with SMTP id
 z18-20020a05600c221200b003f423b9eed2mr1198999wml.38.1686323064766;
        Fri, 09 Jun 2023 08:04:24 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id
 m14-20020a7bce0e000000b003f602e2b653sm2905098wmc.28.2023.06.09.08.04.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jun 2023 08:04:23 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: vkoul@kernel.org,
	broonie@kernel.org,
	tiwai@suse.com
Cc: corbet@lwn.net,
	alsa-devel@alsa-project.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	quic_plai@quicinc.com,
	quic_mohs@quicinc.com,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH v2] ALSA: compress: allow setting codec params after next
 track
Date: Fri,  9 Jun 2023 16:04:16 +0100
Message-Id: <20230609150416.24525-1-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 4I25MHOBJ2C4O6FJBQGVVZCFYUNGCBCV
X-Message-ID-Hash: 4I25MHOBJ2C4O6FJBQGVVZCFYUNGCBCV
X-MailFrom: srinivas.kandagatla@linaro.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4I25MHOBJ2C4O6FJBQGVVZCFYUNGCBCV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

For gapless playback it is possible that each track can have different
codec profile with same decoder, for example we have WMA album,
we may have different tracks as WMA v9, WMA v10 and so on

Or if DSP's like QDSP have abililty to switch decoders on single stream
for each track, then this call could be used to set new codec parameters.

Existing code does not allow to change this profile while doing gapless
playback.

Reuse existing SNDRV_COMPRESS_SET_PARAMS to set this new track params along
some additional checks to enforce proper state machine.

With this new changes now the user can call SNDRV_COMPRESS_SET_PARAMS
anytime after setting next track and additional check in write should
also ensure that params are set before writing new data.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
Changes since v1/RFC:
	- removed introduction of new IOCTL, as suggested.
	- update the state-machine doc.

 .../sound/designs/compress-offload.rst        | 52 +++++++++----------
 sound/core/compress_offload.c                 | 10 ++--
 2 files changed, 33 insertions(+), 29 deletions(-)

diff --git a/Documentation/sound/designs/compress-offload.rst b/Documentation/sound/designs/compress-offload.rst
index 935f325dbc77..205cadcabe70 100644
--- a/Documentation/sound/designs/compress-offload.rst
+++ b/Documentation/sound/designs/compress-offload.rst
@@ -256,32 +256,32 @@ Gapless Playback SM
 For Gapless, we move from running state to partial drain and back, along
 with setting of meta_data and signalling for next track ::
 
-
-                                        +----------+
-                compr_drain_notify()    |          |
-              +------------------------>|  RUNNING |
-              |                         |          |
-              |                         +----------+
-              |                              |
-              |                              |
-              |                              | compr_next_track()
-              |                              |
-              |                              V
-              |                         +----------+
-              |                         |          |
-              |                         |NEXT_TRACK|
-              |                         |          |
-              |                         +----------+
-              |                              |
-              |                              |
-              |                              | compr_partial_drain()
-              |                              |
-              |                              V
-              |                         +----------+
-              |                         |          |
-              +------------------------ | PARTIAL_ |
-                                        |  DRAIN   |
-                                        +----------+
+                            +----------+
+     compr_drain_notify()   |          | compr_set_params() iff next-track set.
+  +------------------------>|  RUNNING |----------------------+
+  |                         |          |                      |
+  |                         +----------+                      |
+  |                              |                            |
+  |                              |                            |
+  |                              | compr_next_track()         |
+  |                              |                            V
+  |                              V                            |
+  |                         +----------+                      |
+  |                         |          |                      |
+  |                         |NEXT_TRACK|                      |
+  |                         |          |                      |
+  |                         +----------+                      |
+  |                              |                            |
+  |                              +----------------------------+
+  |                              |
+  |                              | compr_partial_drain()
+  |                              |
+  |                              V
+  |                         +----------+
+  |                         |          |
+  +------------------------ | PARTIAL_ |
+                            |  DRAIN   |
+                            +----------+
 
 Not supported
 =============
diff --git a/sound/core/compress_offload.c b/sound/core/compress_offload.c
index 243acad89fd3..fe67228e74b3 100644
--- a/sound/core/compress_offload.c
+++ b/sound/core/compress_offload.c
@@ -294,6 +294,9 @@ static ssize_t snd_compr_write(struct file *f, const char __user *buf,
 	case SNDRV_PCM_STATE_SETUP:
 	case SNDRV_PCM_STATE_PREPARED:
 	case SNDRV_PCM_STATE_RUNNING:
+		/* Make sure next track params are set before writing new data */
+		if (stream->next_track)
+			return -EPERM;
 		break;
 	default:
 		mutex_unlock(&stream->device->lock);
@@ -589,7 +592,8 @@ snd_compr_set_params(struct snd_compr_stream *stream, unsigned long arg)
 	struct snd_compr_params *params;
 	int retval;
 
-	if (stream->runtime->state == SNDRV_PCM_STATE_OPEN) {
+	if (stream->runtime->state == SNDRV_PCM_STATE_OPEN ||
+	    (stream->runtime->state == SNDRV_PCM_STATE_RUNNING && stream->next_track)) {
 		/*
 		 * we should allow parameter change only when stream has been
 		 * opened not in other cases
@@ -615,7 +619,8 @@ snd_compr_set_params(struct snd_compr_stream *stream, unsigned long arg)
 		stream->metadata_set = false;
 		stream->next_track = false;
 
-		stream->runtime->state = SNDRV_PCM_STATE_SETUP;
+		if (stream->runtime->state == SNDRV_PCM_STATE_OPEN)
+			stream->runtime->state = SNDRV_PCM_STATE_SETUP;
 	} else {
 		return -EPERM;
 	}
@@ -956,7 +961,6 @@ static int snd_compr_partial_drain(struct snd_compr_stream *stream)
 		return retval;
 	}
 
-	stream->next_track = false;
 	return snd_compress_wait_for_drain(stream);
 }
 
-- 
2.21.0

