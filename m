Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 37650AC11C
	for <lists+alsa-devel@lfdr.de>; Fri,  6 Sep 2019 21:59:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A1DCF1664;
	Fri,  6 Sep 2019 21:58:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A1DCF1664
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1567799939;
	bh=6oYnvu04bM0Wqax5NjyWhvMigAqwn6OVRQZTeKEp974=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=B6d9aIVSQQtlY3elw/kxdNn0cufbJhiAy8RA0pzc2Sfpc5/+NrurKnVjmGlfTVyjE
	 ou+QXo7ebV4P+lKfWF1VxVGZsYDjV6U/r1KTLSOjkkze9i21ug2d6H/OOXcq/QJtFj
	 cWZCRdrqCxit+UpewsJh4fhOtLUo0cxpqm/O2fX4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C695DF80759;
	Fri,  6 Sep 2019 21:48:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1EEE3F80716; Fri,  6 Sep 2019 21:48:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D092FF8070D
 for <alsa-devel@alsa-project.org>; Fri,  6 Sep 2019 21:48:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D092FF8070D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="RrvCXvFM"
Received: by mail-pf1-x441.google.com with SMTP id q5so5197728pfg.13
 for <alsa-devel@alsa-project.org>; Fri, 06 Sep 2019 12:48:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=b15e9a8jnXI2D/g2HPNMQHRyWy1Aa/vLPeajdGxCjYA=;
 b=RrvCXvFMIZeiP0Wg3jy20nWHjV47aWviTjqXvsPTiBEHRACYBSHZy9VIm0JJzvtr8e
 4e1ajbE/OSKWILwKx0WVTbkHiTme/h17/guuTzIC3mytmvT2DQZ2BvqXHF7gRnb0gROu
 0bOparTqUFSNpmJJL9uW6bd7yXdBDqBuzNRcI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=b15e9a8jnXI2D/g2HPNMQHRyWy1Aa/vLPeajdGxCjYA=;
 b=pcQF0ugT7cNBZHGv6TYgdn5onk16qhvypb4XqqiFdSCpUWwccLbjJxp/xEG7WLsfJv
 gUv5KydeWzFfAKrc3W/54xsEBO8zRvUia9Q378ONeJwl46kdsWSBhrB9LPKhrRRrJY7C
 mGCTU2y6JU4KuDCIIoLA9L5NgmTT/QuqWcmH1m2vv0Yvle7SDi83YY1IXDaW5nY69PHD
 bmDq4E+Sa0gMlzPxq2v4SXu9pO6Y8/JF3G5e+kSkaQB7NxxrYQlkfL3aoER83MIafEsZ
 ZfhaptwQ5qZV5D4ZsZmGcza+8vKg7UaCH9G1mfCkqCalrgdRK/UuVq1Upp5nRSWWQ4ZV
 KuUA==
X-Gm-Message-State: APjAAAVpMkayf7IM4//5d3bl/c9nglTDTzvD5MUv1oM4ACHNuicpjNso
 dxfEnD+RA4kNbcMUqXptIwXVNteWfA==
X-Google-Smtp-Source: APXvYqxh/83IBx2QJe/ME09ZV3uJvpQhC/UBbJovMQ4ikVHDJRomq50OJGC/dNIe29O76YiqHZBKTg==
X-Received: by 2002:a63:e44b:: with SMTP id i11mr9212094pgk.297.1567799309199; 
 Fri, 06 Sep 2019 12:48:29 -0700 (PDT)
Received: from localhost ([2620:15c:202:201:c87a:31ae:9107:f63d])
 by smtp.gmail.com with ESMTPSA id q204sm5660149pfq.176.2019.09.06.12.48.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Sep 2019 12:48:28 -0700 (PDT)
From: Curtis Malainey <cujomalainey@chromium.org>
To: alsa-devel@alsa-project.org
Date: Fri,  6 Sep 2019 12:46:36 -0700
Message-Id: <20190906194636.217881-15-cujomalainey@chromium.org>
X-Mailer: git-send-email 2.23.0.187.g17f5b7556c-goog
In-Reply-To: <20190906194636.217881-1-cujomalainey@chromium.org>
References: <20190906194636.217881-1-cujomalainey@chromium.org>
MIME-Version: 1.0
Cc: Oder Chiou <oder_chiou@realtek.com>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Bard Liao <bardliao@realtek.com>, Curtis Malainey <cujomalainey@chromium.org>
Subject: [alsa-devel] [RFC 14/15] ASoC: rt5677: Allow VAD to be shut on/off
	at all times
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Due to limitations of the clocking configuration, we have no way of
scheduling our hibernation before the bdw dsp hibernates. This causes
issues when the system suspends with an open stream. We need userspace
to toggle the kcontrol before we are suspended so that any writes on
suspend are not lost and we don't corrupt the regmap.

Signed-off-by: Curtis Malainey <cujomalainey@chromium.org>
---
 sound/soc/codecs/rt5677.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/sound/soc/codecs/rt5677.c b/sound/soc/codecs/rt5677.c
index a262a3dfbe2b..29233ec8906e 100644
--- a/sound/soc/codecs/rt5677.c
+++ b/sound/soc/codecs/rt5677.c
@@ -1023,13 +1023,8 @@ static int rt5677_dsp_vad_put(struct snd_kcontrol *kcontrol,
 		struct snd_ctl_elem_value *ucontrol)
 {
 	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
-	struct rt5677_priv *rt5677 = snd_soc_component_get_drvdata(component);
-
-	rt5677->dsp_vad_en = !!ucontrol->value.integer.value[0];
 
-	if (snd_soc_component_get_bias_level(component) == SND_SOC_BIAS_OFF)
-		rt5677_set_dsp_vad(component,
-				!!ucontrol->value.integer.value[0]);
+	rt5677_set_dsp_vad(component, !!ucontrol->value.integer.value[0]);
 
 	return 0;
 }
-- 
2.23.0.187.g17f5b7556c-goog

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
