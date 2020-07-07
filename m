Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E0FC2216A57
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Jul 2020 12:33:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 847281682;
	Tue,  7 Jul 2020 12:32:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 847281682
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594118019;
	bh=n3zWAvEiKs24KPS3ygF4mWRc5qP7nr5XK3QBPFEFg+Y=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sd7jDT8HHRmwzQ+xIyYmYf480D+lTGHskgrmFBik/3acK38kg31djxt+uKo9M0hY6
	 ZkN8IR778J4x5txQFpKhGyXMk3CJysNrYVPl1hTd1eFislrD2fxHpgdSQ6yei9qcRB
	 Tf8mw+pL2XCwO0Z2D0zgCXCfNvY3o6dqeSeh5VUc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E505BF803CF;
	Tue,  7 Jul 2020 12:18:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2F04CF80344; Tue,  7 Jul 2020 12:17:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B794EF80323
 for <alsa-devel@alsa-project.org>; Tue,  7 Jul 2020 12:17:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B794EF80323
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="QoVnhhkn"
Received: by mail-wr1-x443.google.com with SMTP id k6so44564616wrn.3
 for <alsa-devel@alsa-project.org>; Tue, 07 Jul 2020 03:17:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=c4/atXJGhj1n0uTQI5cYV/gQNs+sjaOZMgJsAAMgfWA=;
 b=QoVnhhknZYVxWfl9mcL1Hgta3/3Af8FucpK51zcYOzuI1LPngqjVM8rBVmQqjLgh7E
 1Uw5NQ/B6U3SUgvxl1hiVmj1hwCKO9EaY5U/DRBIuNUsVN/pN8KwuthGGhnUKBnKlSQB
 a4d7SMY6AFyJbq8ZR4ADQrnNHzUMD5ziAGLPIcECCntkWmbzjXnZofBCZFbWuKIPcqcC
 wAZxm9Rtksb3/dunSciAduuH/UVb0HHOL8I3Rsr26SmQn3plTAqH/gh7J1xC4qLizdp6
 nnU60q8xCFLFZxL4M3qkB9cNqUBR/rnNppyXEvYp/IwKxkobwyQx6HJWu9+ptWGyT82Y
 JKlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=c4/atXJGhj1n0uTQI5cYV/gQNs+sjaOZMgJsAAMgfWA=;
 b=M7MdYuJrJnQcfMekZ/EoFobD93z0g1JG/7k9ZWqdba9a/t/tJ/XM0MMZD537NKpUOA
 UUDkoHWRj6MiDd94xvSeEOUYEMBn2s9U7SuDgwPKPOEP2wlwyamMGtfXmStLtkkjF6eE
 xb7i7hDarpOHnxhs3AG7YQY6wJI9UB+epM/33zXwMy4UNekGwixS0arHu0j10XOafLYS
 Tu+HMdqZDD3GToxtKckZFJUPqLyWGDp09tRaWTkpN2bq790+5uUvNgormhcPszJCnU1S
 9dnT5Sjyn+7xy34Ku0E34edP2PwvK/NZEag7x3jA3CjAckcfn9ehdS087cgBS1ysagIo
 GkWA==
X-Gm-Message-State: AOAM533j5isYTi8fCKS5m+wgTLSYY5DSysW1UXgrOqdG9AD7OBbrxmVx
 BFtpaAklrnOY+ubR39yXynO8KA==
X-Google-Smtp-Source: ABdhPJw9oo8pfsuehCGY22+GnK13HnMCljfQRckQGf4lIiSb36XKwJQOyruMnCDQuGqbsropcrAgFw==
X-Received: by 2002:adf:e60e:: with SMTP id p14mr51698572wrm.31.1594117037406; 
 Tue, 07 Jul 2020 03:17:17 -0700 (PDT)
Received: from localhost.localdomain ([2.27.35.206])
 by smtp.gmail.com with ESMTPSA id z8sm469409wmg.39.2020.07.07.03.17.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jul 2020 03:17:16 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: broonie@kernel.org, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com
Subject: [PATCH 24/28] ASoC: codecs: jz4770: Remove defined but never used
 variable 'mic_boost_tlv'
Date: Tue,  7 Jul 2020 11:16:38 +0100
Message-Id: <20200707101642.1747944-25-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200707101642.1747944-1-lee.jones@linaro.org>
References: <20200707101642.1747944-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Paul Cercueil <paul@crapouillou.net>, ter Huurne <maarten@treewalker.org>,
 Lee Jones <lee.jones@linaro.org>, linux-arm-kernel@lists.infradead.org
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

Fixes the following W=1 kernel build warning(s):

 In file included from include/sound/tlv.h:10,
 from sound/soc/codecs/jz4770.c:19:
 sound/soc/codecs/jz4770.c:306:35: warning: ‘mic_boost_tlv’ defined but not used [-Wunused-const-variable=]
 306 | static const DECLARE_TLV_DB_SCALE(mic_boost_tlv, 0, 400, 0);
 | ^~~~~~~~~~~~~
 include/uapi/sound/tlv.h:64:15: note: in definition of macro ‘SNDRV_CTL_TLVD_DECLARE_DB_SCALE’
 64 | unsigned int name[] = { | ^~~~
 sound/soc/codecs/jz4770.c:306:14: note: in expansion of macro ‘DECLARE_TLV_DB_SCALE’
 306 | static const DECLARE_TLV_DB_SCALE(mic_boost_tlv, 0, 400, 0);
 | ^~~~~~~~~~~~~~~~~~~~

Cc: Paul Cercueil <paul@crapouillou.net>
Cc: ter Huurne <maarten@treewalker.org>
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 sound/soc/codecs/jz4770.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/codecs/jz4770.c b/sound/soc/codecs/jz4770.c
index 34775aa624024..4dee585761c24 100644
--- a/sound/soc/codecs/jz4770.c
+++ b/sound/soc/codecs/jz4770.c
@@ -303,7 +303,6 @@ static int jz4770_codec_digital_mute(struct snd_soc_dai *dai, int mute)
 static const DECLARE_TLV_DB_MINMAX_MUTE(dac_tlv, -3100, 0);
 static const DECLARE_TLV_DB_SCALE(adc_tlv, 0, 100, 0);
 static const DECLARE_TLV_DB_MINMAX(out_tlv, -2500, 600);
-static const DECLARE_TLV_DB_SCALE(mic_boost_tlv, 0, 400, 0);
 static const DECLARE_TLV_DB_SCALE(linein_tlv, -2500, 100, 0);
 
 /* Unconditional controls. */
-- 
2.25.1

