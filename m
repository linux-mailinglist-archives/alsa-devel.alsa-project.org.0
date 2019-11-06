Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 06637F0B97
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Nov 2019 02:21:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8AF9316EA;
	Wed,  6 Nov 2019 02:20:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8AF9316EA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573003269;
	bh=tZgofN8E7F/0bD5ARcdJH6FeYIt+3ZQBAg2xdKG9l+g=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mbiFcHJs39bctyM6e6RVLYrHxSBaAWjUVmiJ9Oi3Led7ymD8BKHa239DsW+FxOKBN
	 Zq8OeMvCd/3pgKk2FRyz92Wh0Pe72w03L8BE08V8CAP5j5kGniqrPVuNE8t2YzWFAd
	 wGNPAlOblU4meWFAbbPl/eCwUrPRLy1hlunjEg0M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CCA8DF8070D;
	Wed,  6 Nov 2019 02:14:17 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E344BF806FA; Wed,  6 Nov 2019 02:14:14 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E7C75F80672
 for <alsa-devel@alsa-project.org>; Wed,  6 Nov 2019 02:14:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E7C75F80672
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="chyq7K9k"
Received: by mail-pg1-x543.google.com with SMTP id k13so4613983pgh.3
 for <alsa-devel@alsa-project.org>; Tue, 05 Nov 2019 17:14:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9WdLCldc77VWUyd4bY1EvCcTHcJ3PO0rD29IKMNgjhw=;
 b=chyq7K9k84vD/+klznCLYk35ZA4imUzewnOLz7hWD72CIvHxwQ/WS9R5t9L20iCR/x
 JsYeJ/ACeutrE0DplPOirnefdtaWFmSnKbTMDwQIwz+KZ7iabwC+SOdNek3se4j+MPDx
 BVQu6hZtspJxYnPZbtpeyn64A0sifCTij1kF8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9WdLCldc77VWUyd4bY1EvCcTHcJ3PO0rD29IKMNgjhw=;
 b=XNVt1/jHLIBZ4//fYSkCC2Ok9a0sFT9uZQEjMgngsNzVBNII/FmLQpLv/SM05XB7Fa
 nSMx4dYzsuJ50srih9rSgcrPKHOQ2VotEV7YXBWk7PPzgFupf/H27xT0xB5I9qUW0er+
 PJViF9Ag1wwrYsRB5d3IKRMzBoF7o7s9U+KTvKR9Fbu6nvrk/j/tU6J56zu0fIMjvWhI
 hCicfCaM2PYM5AV+u7pNeAf0Oz+k6HjmdHuz5ToyldoSTgqVWTlHvdkTSXhrbt082SYD
 FD/1DVTI9fUWXWMatPTyDtpaQvpVoxUnd2YIdyIVyQdjSvflLXbphQKq0gFvMb2Kdh6e
 12sw==
X-Gm-Message-State: APjAAAU0mM7hgb5vFZhPCctznPIX4lHN6TF/fQQCYesi1XXppUXCQZuO
 k1zVDdQqmMfeWT2UjdSLze9EPqMyRRiP
X-Google-Smtp-Source: APXvYqy7GjzAjB/ouBz3zagl4UiHXBRj81efPFj27d3lyx/GpnYD8sOHjK6G3aWTRBiLno9IA3w+oA==
X-Received: by 2002:a17:90a:3be4:: with SMTP id e91mr83333pjc.56.1573002846864; 
 Tue, 05 Nov 2019 17:14:06 -0800 (PST)
Received: from localhost ([2620:15c:202:201:c87a:31ae:9107:f63d])
 by smtp.gmail.com with ESMTPSA id p3sm2027228pfb.163.2019.11.05.17.14.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Nov 2019 17:14:06 -0800 (PST)
From: Curtis Malainey <cujomalainey@chromium.org>
To: alsa-devel@alsa-project.org
Date: Tue,  5 Nov 2019 17:13:33 -0800
Message-Id: <20191106011335.223061-9-cujomalainey@chromium.org>
X-Mailer: git-send-email 2.24.0.rc1.363.gb1bccd3e3d-goog
In-Reply-To: <20191106011335.223061-1-cujomalainey@chromium.org>
References: <20191106011335.223061-1-cujomalainey@chromium.org>
MIME-Version: 1.0
Cc: Oder Chiou <oder_chiou@realtek.com>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Bard Liao <bardliao@realtek.com>, Curtis Malainey <cujomalainey@chromium.org>
Subject: [alsa-devel] [PATCH v3 08/11] ASoC: rt5677: Allow VAD to be shut
	on/off at all times
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
index 14f04db8e5e7..a65d1554366d 100644
--- a/sound/soc/codecs/rt5677.c
+++ b/sound/soc/codecs/rt5677.c
@@ -979,13 +979,8 @@ static int rt5677_dsp_vad_put(struct snd_kcontrol *kcontrol,
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
2.24.0.rc1.363.gb1bccd3e3d-goog

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
