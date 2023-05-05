Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 90B9A6F8725
	for <lists+alsa-devel@lfdr.de>; Fri,  5 May 2023 18:57:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 51C0B2D5E;
	Fri,  5 May 2023 18:56:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 51C0B2D5E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683305864;
	bh=eG9vcpv4Bz5yalcqqmuJcXKkkF8smslBdM0h9TmfPrM=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=JAov1vqu7vvxLWZXwQ05rW5nSgrWAxWrOVf387ypqdPLotS9m/gvV1WtHPzY6QqK+
	 xvONjh9NcYqi/zW9sZ43YTGqXqnZ4geX4WgGBRrOcB7uQzGHKrGLYgt7AbGfHamn3F
	 Ydmt4E/zm3VfK5gyFG9sSL5CZyytJAF0yG4wzQEc=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AD792F80551;
	Fri,  5 May 2023 18:55:43 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 762DCF80548; Fri,  5 May 2023 18:55:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8521AF8052E
	for <alsa-devel@alsa-project.org>; Fri,  5 May 2023 18:55:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8521AF8052E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=h2kiVF0I
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-3f192c23fffso14046585e9.3
        for <alsa-devel@alsa-project.org>;
 Fri, 05 May 2023 09:55:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683305729; x=1685897729;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t5FjLfR0dXo5At1Nv29Yy33iCFfTFuwOYzh/k0tPY30=;
        b=h2kiVF0IAYWJVzk/aTOE5lG4mTWGCGqOzz7oqa1cEibfLFqfpXftD8+mXnGJ3ooHWS
         IwiU2xbAuSOG3BBfRsosNxzd4xmRAxRlZnnj7z66A4FlImtmpVtzl+qhgP/a0TD+xOuc
         gzHQOwfxqt7hnrRj/4968rJ4XQInsT/bGviRbiJxa6lp6iaAdaZ8mJ+Xc10i/71jTNxw
         iyisfDrfM94Dy5OW+1LNsZcF/d25rSUTrEdMMQgbqG88q+wtQywmWXOHlqspJuzDXXuw
         qqVm0we6aasVZV9JEcU00Wy5O5IMDJyTVGI8+ENgD0q5Nlwi3MfJBiUkBan3NJwXnfxO
         quww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683305729; x=1685897729;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t5FjLfR0dXo5At1Nv29Yy33iCFfTFuwOYzh/k0tPY30=;
        b=h8ufzQmbLsvOSYcGDTXR5N5eXnOZP/H5Ta1R5wLg+ji+C7UHC2+TTWaFOmwgbnqEFb
         ttujydKHN3Qw2EWSmpVETkYYj9wKQChAlYSRAqH4dtleohZC6ti8H2DP7QReTIdv8tS0
         imZEUNIQao9XPsF8+qmdmssIz++zMuiMVJWaW9fbL/f5py+9oMQcAVBAlJGw2v9J2UN3
         NRwcuLqCqXAjSn37Xch3VCJpZ0f8DgXwviyZc/QP32TlVAMxhJlZskyv09C6vhhkSLqV
         DV+D4XOTH38M1jPLgkAnxFTVwM7wVSfAMED8RRzHUQ8DZjPJm288K74UmAzx+qtZ0Rjx
         UJdQ==
X-Gm-Message-State: AC+VfDzvV/7ygifx95vAwI9OMf8Jlv1rPqLbpr2LlQCjWkoRR3UK4mXp
	JSrzpXUP76BLXivF2Hb7O3M83Q==
X-Google-Smtp-Source: 
 ACHHUZ60mo9CYfuAJyu07wBUOWWLk7kW4NKYDEp4m79W50XgNcx+2nLVG5HKWdgdYDrfhhambBQ6rg==
X-Received: by 2002:a7b:c7d3:0:b0:3f0:683d:224d with SMTP id
 z19-20020a7bc7d3000000b003f0683d224dmr1768579wmk.9.1683305728751;
        Fri, 05 May 2023 09:55:28 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id
 x7-20020adfffc7000000b002c7066a6f77sm2923551wrs.31.2023.05.05.09.55.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 May 2023 09:55:28 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org,
	tiwai@suse.com
Subject: [PATCH 3/3] ASoC: hdmi-codec: use snd_soc_cnew to add controls
Date: Fri,  5 May 2023 17:55:14 +0100
Message-Id: <20230505165514.4666-4-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20230505165514.4666-1-srinivas.kandagatla@linaro.org>
References: <20230505165514.4666-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: ZLTXYQXCLXPTINL7ZEIKNJIYCYUDTHX6
X-Message-ID-Hash: ZLTXYQXCLXPTINL7ZEIKNJIYCYUDTHX6
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZLTXYQXCLXPTINL7ZEIKNJIYCYUDTHX6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

If there are multiple instances of this codec in a sound card using snd_ctl_new1
will fail with below error because of duplicate control names.

snd-sc8280xp sound: control 3:16:0:IEC958 Playback Mask:0 is already present
hdmi-audio-codec hdmi-audio-codec.4.auto: ASoC: error at snd_soc_pcm_dai_new on i2s-hifi: -16

Fix this by using snd_soc_cnew along with component name prefix to avoid
this duplication.

This issue is noticed on x13s laptop which has multiple instances of Displayport.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/codecs/hdmi-codec.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/hdmi-codec.c b/sound/soc/codecs/hdmi-codec.c
index 8c54cddf86b6..48d1eef9c806 100644
--- a/sound/soc/codecs/hdmi-codec.c
+++ b/sound/soc/codecs/hdmi-codec.c
@@ -801,7 +801,8 @@ static int hdmi_codec_pcm_new(struct snd_soc_pcm_runtime *rtd,
 		struct snd_kcontrol *kctl;
 
 		/* add ELD ctl with the device number corresponding to the PCM stream */
-		kctl = snd_ctl_new1(&hdmi_codec_controls[i], dai->component);
+		kctl = snd_soc_cnew(&hdmi_codec_controls[i], dai->component, NULL,
+				    dai->component->name_prefix);
 		if (!kctl)
 			return -ENOMEM;
 
-- 
2.21.0

