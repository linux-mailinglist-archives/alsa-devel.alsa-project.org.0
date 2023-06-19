Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D7AD73501A
	for <lists+alsa-devel@lfdr.de>; Mon, 19 Jun 2023 11:29:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3F5F283E;
	Mon, 19 Jun 2023 11:28:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3F5F283E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687166968;
	bh=3yby7asSa1bmg8/TCPBWA9yB0Auogb07bRActmah47c=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=pRTs9DbTtqRO9gX/kFStchTCBeipTO5MOGXDvGx2epTlx1guQozn4BMg9EMqZIgA5
	 nuQkONEVY8kkHtJ5CsGsPLSILxVfikFKRXkGlQCqySCDZ732UDGtxKQ2QzxElbRQIL
	 a1NPRmxmG1JT4wP7JXxbmGysmLRMIXQL3JHHfNko=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A025CF8052E; Mon, 19 Jun 2023 11:28:31 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B71BEF80132;
	Mon, 19 Jun 2023 11:28:30 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 80663F80217; Mon, 19 Jun 2023 11:28:26 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 8CE99F800E5
	for <alsa-devel@alsa-project.org>; Mon, 19 Jun 2023 11:28:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8CE99F800E5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=w1lMpVnz
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-3f900cd3f69so17043455e9.0
        for <alsa-devel@alsa-project.org>;
 Mon, 19 Jun 2023 02:28:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687166892; x=1689758892;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MA34cT4O/DXGv9/GJqnDQidBqlMmaRaNZTidmNryGbQ=;
        b=w1lMpVnzGPEeaVoIe3PsoD5fTjDDyaHreFR7Forr8A4oYjlT1wyEkhpK++erSgJmsD
         YwutxvLhitQEhSImbwzmKqIsux+0pLklHXfw3XNftBpEd+rbwb9MR26+tyEi9fFprn6v
         Bwl0YL/nZIsYHPK5TzjhhoE98dYebqQ/s2pGujy5EjS1yFntMKKjonm/L8TOcdsdvNub
         C77gCrjY4W9Gz/J/hVOK7JafXsgCaXImpSlW5SHGh8EmWsKEgnPR6gZd1ZKjGjU585e8
         9udrPVPdIpwzslq8TPpDRh9c97VMMghUBVlezwYricz7zfG2u0sKoC9q5bQT3I5FCC2A
         ggLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687166892; x=1689758892;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MA34cT4O/DXGv9/GJqnDQidBqlMmaRaNZTidmNryGbQ=;
        b=g+LMAvIHZTZugy2YNoIbIRndRvyX5tmZy3jenR6T8cIYQzINvAuwngUf4REjMarfT9
         80JIXeHtApymGDs4k7/rWzTd7UcJhppDKA7IgxnNyQ26KcHVsd55/36j9MgLq+9YZ0AE
         /TIY1jGGZhl8Qt4CSMIUn26sqloaXDlQVmL2QS2VoxuzJ8GmyqxZR+YanPsQAv0Bh6RU
         nj2NeWcTQ/clqWYmUxZq3lByKMd35CG4VmmQYO6MRqbF1YS4n22QGSlZbDZRF8VvNOqV
         uCBe2JHuDuMFBaqBJ403KUOitpTJFGnzIXE0ev5uhaFvqYhNv208rhRfYjLzhVrZpnqS
         bcoQ==
X-Gm-Message-State: AC+VfDxVHTXni3X0H2kAwBzQSuSnPKQmJYtjkJdoH620WSdVpc6+JYkR
	lg/zpNW0rBLEIZkfNb1JVcWhUg==
X-Google-Smtp-Source: 
 ACHHUZ5PIbm8h7cKrZMFoFsbGK9F8BONiHNOCufZZkdH5bY/DzzunLcti36p+dvVlrUIB6I+pn8RAw==
X-Received: by 2002:a7b:c449:0:b0:3f4:a09f:1877 with SMTP id
 l9-20020a7bc449000000b003f4a09f1877mr5725214wmi.23.1687166892067;
        Mon, 19 Jun 2023 02:28:12 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id
 n22-20020a7bcbd6000000b003f908ee3091sm5453846wmi.3.2023.06.19.02.28.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jun 2023 02:28:11 -0700 (PDT)
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
Subject: [PATCH v3] ALSA: compress: allow setting codec params after next
 track
Date: Mon, 19 Jun 2023 10:28:05 +0100
Message-Id: <20230619092805.21649-1-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: IDSEYDGAT47T7QPWE2FWDUKL6TZPCIEM
X-Message-ID-Hash: IDSEYDGAT47T7QPWE2FWDUKL6TZPCIEM
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IDSEYDGAT47T7QPWE2FWDUKL6TZPCIEM/>
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
Changes since v2:
 simplified the logic to allow set_params and udated the documentation accordingly

 Documentation/sound/designs/compress-offload.rst | 11 ++++++-----
 sound/core/compress_offload.c                    |  5 ++++-
 2 files changed, 10 insertions(+), 6 deletions(-)

diff --git a/Documentation/sound/designs/compress-offload.rst b/Documentation/sound/designs/compress-offload.rst
index 935f325dbc77..655624f77092 100644
--- a/Documentation/sound/designs/compress-offload.rst
+++ b/Documentation/sound/designs/compress-offload.rst
@@ -268,11 +268,12 @@ with setting of meta_data and signalling for next track ::
               |                              |
               |                              V
               |                         +----------+
-              |                         |          |
-              |                         |NEXT_TRACK|
-              |                         |          |
-              |                         +----------+
-              |                              |
+              |    compr_set_params()   |          |
+              |             +-----------|NEXT_TRACK|
+              |             |           |          |
+              |             |           +--+-------+
+              |             |              | |
+              |             +--------------+ |
               |                              |
               |                              | compr_partial_drain()
               |                              |
diff --git a/sound/core/compress_offload.c b/sound/core/compress_offload.c
index 243acad89fd3..30f73097447b 100644
--- a/sound/core/compress_offload.c
+++ b/sound/core/compress_offload.c
@@ -589,7 +589,7 @@ snd_compr_set_params(struct snd_compr_stream *stream, unsigned long arg)
 	struct snd_compr_params *params;
 	int retval;
 
-	if (stream->runtime->state == SNDRV_PCM_STATE_OPEN) {
+	if (stream->runtime->state == SNDRV_PCM_STATE_OPEN || stream->next_track) {
 		/*
 		 * we should allow parameter change only when stream has been
 		 * opened not in other cases
@@ -612,6 +612,9 @@ snd_compr_set_params(struct snd_compr_stream *stream, unsigned long arg)
 		if (retval)
 			goto out;
 
+		if (stream->next_track)
+			goto out;
+
 		stream->metadata_set = false;
 		stream->next_track = false;
 
-- 
2.21.0

