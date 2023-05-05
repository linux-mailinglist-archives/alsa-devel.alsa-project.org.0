Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 414E26F8721
	for <lists+alsa-devel@lfdr.de>; Fri,  5 May 2023 18:57:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5574E2D59;
	Fri,  5 May 2023 18:56:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5574E2D59
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683305837;
	bh=XtGUJPva7M5hIyyYvX7Ft242YfpcVEJV0H+8AslpSu8=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=GSWvSUfMZSIGCXzWyiSUJjM8+ZLpHmKH/2DWnLCtmoffC5F8fbnvPGD3VJWdtUnHN
	 9c8GrHBDaQoXAaAvmv7OEP0vbEg9IDwnWhcetcvv1MuzPyEqYcZgqPP1BCiBWT3jVa
	 +tcAmVHEMbVE/uSPefK4UerNHj3WiSFIv6zxGC1g=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5F5AFF8053D;
	Fri,  5 May 2023 18:55:37 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B6104F80533; Fri,  5 May 2023 18:55:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 81259F8052D
	for <alsa-devel@alsa-project.org>; Fri,  5 May 2023 18:55:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 81259F8052D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=c7fc4Z+R
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-3f415a90215so512145e9.0
        for <alsa-devel@alsa-project.org>;
 Fri, 05 May 2023 09:55:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683305727; x=1685897727;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BWd518ZVELbkPHYlOpmIJ7g/bmO3wYl7PpJavDJwK68=;
        b=c7fc4Z+RIAPUqsAFPp2G67pOYWK2PNIVlPcMURVWulSHwlGlmDQWWy0GUszI9vSQTf
         QhmlUVo9atPB+0/8hRcNFa+61TSG1KufgBpDfcRaQEwNBN13JRfCqcuhKWOliVO8wTMA
         nfaSDwNkKDXqGGCcI0qtz5ub3c7pGgudH2DAlirxI9mtkN81mD61o1IuiNzs1mvS9B2H
         l0E++3fyliRVDdn+P+ldd4IgGL6kGUYSry1U75OwRrCZiwTedjUdoe5DTME+tIIqJlEd
         n/RivTlWxyTDV3TFwQUalnUIA8lcqAylU2E2uAKhaBNGNelN80diIUsq3Drzcp4mXxiW
         Hwkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683305727; x=1685897727;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BWd518ZVELbkPHYlOpmIJ7g/bmO3wYl7PpJavDJwK68=;
        b=k8F2midnE9DPI7bBnU4JgwfZmAvqetDySj2O0dR+CS7hgaCfsXPHk8IToRi1hp1ZpV
         lYDr0tRiWk8qQOPy460ulX2uNWeVS0mAuszCjVPhuXTqq8mogWi28cfC7f8DSN75d+Aw
         8+Rd4p88UhlnEGzyzkY3eKmXSnGUNk1AaorJ4qywSkSl213/Pckls8m2n7gwGcHbYTpo
         YVVvVjPGb9NSnpvD6hssBwll+YAWgsjWQxBb319vFDcNbGTRim0nnbwK+6nbj3IAbHR4
         59lR7Gosg5qUusDa3Ggc3n/iPPmOu8RABJ4h0l61w52jASrgPRVjeqvGBrLCLRV9510F
         9/3w==
X-Gm-Message-State: AC+VfDx+npCcrWmIZDy3pGF4CLPaqZjAqm5rNFAZo8w6bBVUoDSNtHYI
	wtOKH/aZ0gog5hYKoZA4I6Eql9U2A3uCCALhLb8=
X-Google-Smtp-Source: 
 ACHHUZ4fK6zbNXMaQt+c/2yHsoyXsoSqwsYxy1PcYMyflrt5ETa+uP3MLXHfFWP0GrIrSYDQ3NK05A==
X-Received: by 2002:a05:600c:21cf:b0:3f1:6757:6245 with SMTP id
 x15-20020a05600c21cf00b003f167576245mr1688995wmj.7.1683305727569;
        Fri, 05 May 2023 09:55:27 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id
 x7-20020adfffc7000000b002c7066a6f77sm2923551wrs.31.2023.05.05.09.55.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 May 2023 09:55:26 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org,
	tiwai@suse.com
Subject: [PATCH 2/3] ASoC: hdmi-codec: use snd_pcm_add_chmap_ctls_with_prefix
 to add controls
Date: Fri,  5 May 2023 17:55:13 +0100
Message-Id: <20230505165514.4666-3-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20230505165514.4666-1-srinivas.kandagatla@linaro.org>
References: <20230505165514.4666-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: MKSRWXWGRQMVUMXAY3TTGMC5TMLVPLNV
X-Message-ID-Hash: MKSRWXWGRQMVUMXAY3TTGMC5TMLVPLNV
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MKSRWXWGRQMVUMXAY3TTGMC5TMLVPLNV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

If there are multiple instances of this codec in a sound card
snd_pcm_add_chmap_ctls() will fail with below error because of
duplicate control names.

snd-sc8280xp sound: control 3:16:0:Playback Channel Map:0 is already present
hdmi-audio-codec hdmi-audio-codec.4.auto: ASoC: error at snd_soc_pcm_dai_new on i2s-hifi: -16

Fix this by using snd_pcm_add_chmap_ctls_with_prefix along wth component
name prefix.

This issue is noticed on x13s laptop which has multiple instances of Displayport.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/codecs/hdmi-codec.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/hdmi-codec.c b/sound/soc/codecs/hdmi-codec.c
index 6d980fbc4207..8c54cddf86b6 100644
--- a/sound/soc/codecs/hdmi-codec.c
+++ b/sound/soc/codecs/hdmi-codec.c
@@ -782,9 +782,10 @@ static int hdmi_codec_pcm_new(struct snd_soc_pcm_runtime *rtd,
 	unsigned int i;
 	int ret;
 
-	ret =  snd_pcm_add_chmap_ctls(rtd->pcm, SNDRV_PCM_STREAM_PLAYBACK,
-				      NULL, drv->playback.channels_max, 0,
-				      &hcp->chmap_info);
+	ret =  snd_pcm_add_chmap_ctls_with_prefix(rtd->pcm, SNDRV_PCM_STREAM_PLAYBACK,
+						  NULL, drv->playback.channels_max, 0,
+						  &hcp->chmap_info,
+						  dai->component->name_prefix);
 	if (ret < 0)
 		return ret;
 
-- 
2.21.0

