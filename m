Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D6F3DCFD1
	for <lists+alsa-devel@lfdr.de>; Fri, 18 Oct 2019 22:12:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0094E1698;
	Fri, 18 Oct 2019 22:12:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0094E1698
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571429571;
	bh=/B2Umet/sA3OQiqmrcPRG6Tts7y/90vVMNr3N7ZnHs0=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=C0vVWIS3d1VF+8VCYBSXS+NcEMjASaVEw/OqdjTSvnYeRcCX7J4XwT7Kl1VjjFJ/b
	 qql7VKI4zudq4RDk4Q1M7QCM9lHYxqaCbqckaUrgAhN56IkWr6Qdg5Z6FmTe0++n1H
	 WE9vGliPhr+ul/K9GZ1vnWmoIDeb/T12z8Yb1mzU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2A241F8070D;
	Fri, 18 Oct 2019 22:05:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B4294F8063B; Fri, 18 Oct 2019 22:05:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 643D4F8063B
 for <alsa-devel@alsa-project.org>; Fri, 18 Oct 2019 22:05:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 643D4F8063B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="L98082bS"
Received: by mail-pf1-x444.google.com with SMTP id y5so4514805pfo.4
 for <alsa-devel@alsa-project.org>; Fri, 18 Oct 2019 13:05:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xCDEIYeVL0ViWUqtSb2mx1G78rAZ+hJgFnePlVqEzxU=;
 b=L98082bS/r/rfmjwfQe+0dfHd7BDY7gVaA/O9WUb2flhUuvBU4u0vMx+UCR7CgTK9Q
 hp6/TqjZfxDT9H8LpVx9gWWMYCpQTCN9nOjnaPlihOZ7YNkeEIEVwLsQkQzJdhpHKMSM
 DBFdYjlSeK49nsYgrOLvJ5yrNIIg4FzJID35E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xCDEIYeVL0ViWUqtSb2mx1G78rAZ+hJgFnePlVqEzxU=;
 b=kBhSF38XLaJzU47PsqRjpbyjrVFosPMhSR4GwNxkUBtlttkiHuOoeyLxZRaQmuSvr/
 zd5XSsjicC3zRiHqjI7zpRuAp76XSGORdnYFGoI64OAW655qh0WPqTJN7SRiO+MYt0NP
 KJ45oSCWjHmSwEm8fAAJiOWzxPXO6HcwVmPk2Y5mE4gJl/6eWz+eD5VKfJhspJpYdptg
 CkjAyJLAviv3NnGfNHBiPhSPI+BtZrqKLj1gi3KlsouQbn4RW/i3JAPS+TGONf+1kboD
 Y2LT+OJUdLfUJxJcYgD5aw2fcEhECp1Af2IEhMh8MyaC7EO5cvk7eavX8u2olUbkUidu
 Hi1A==
X-Gm-Message-State: APjAAAVER3bXwmEMJe6Mr2dlqlN+yMtMlP4nm82uzOiiaRWqQkSV/BgK
 NjT7R6n6OsBBB/tWNMUcvPuwFcv4wj5P
X-Google-Smtp-Source: APXvYqw6h/15EHvcLY+zcx48MMlTD0ywdEYQrwo2e5j+oYUGWvXDDSTX62/CXli7iMKovBMH4E2eKQ==
X-Received: by 2002:a65:5cc8:: with SMTP id b8mr11589262pgt.38.1571429116712; 
 Fri, 18 Oct 2019 13:05:16 -0700 (PDT)
Received: from localhost ([2620:15c:202:201:c87a:31ae:9107:f63d])
 by smtp.gmail.com with ESMTPSA id y22sm5968309pjn.12.2019.10.18.13.05.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Oct 2019 13:05:16 -0700 (PDT)
From: Curtis Malainey <cujomalainey@chromium.org>
To: alsa-devel@alsa-project.org
Date: Fri, 18 Oct 2019 13:04:46 -0700
Message-Id: <20191018200449.141123-10-cujomalainey@chromium.org>
X-Mailer: git-send-email 2.23.0.866.gb869b98d4c-goog
In-Reply-To: <20191018200449.141123-1-cujomalainey@chromium.org>
References: <20191018200449.141123-1-cujomalainey@chromium.org>
MIME-Version: 1.0
Cc: Oder Chiou <oder_chiou@realtek.com>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Bard Liao <bardliao@realtek.com>, Curtis Malainey <cujomalainey@chromium.org>
Subject: [alsa-devel] [PATCH v2 09/12] ASoC: rt5677: Allow VAD to be shut
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
index 712d3cbba9035..6e8d11060bbab 100644
--- a/sound/soc/codecs/rt5677.c
+++ b/sound/soc/codecs/rt5677.c
@@ -981,13 +981,8 @@ static int rt5677_dsp_vad_put(struct snd_kcontrol *kcontrol,
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
2.23.0.866.gb869b98d4c-goog

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
