Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C0D414D3AFB
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Mar 2022 21:24:23 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4ABE616F7;
	Wed,  9 Mar 2022 21:23:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4ABE616F7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646857463;
	bh=HrSd8fh84PrFVz9CCbJR4xWn6vhNqj/rfUd2F4NEXFA=;
	h=Date:Subject:From:To:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KZSXnRboSGlEAlG2nDpKncaS4fIG4v11J8HDTI6A9rbRN6PDW8nL+9tapaPnKKz8B
	 6+vP37RHnci0S34vSaymKyE7Sou2YRmbPjKEzIjMNofLbF8yKUUako7C1UH5BQ6Pib
	 UpoyuYKi0XuMPRFIyR1+jx4DvbPR55vRsviP3Dj4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6357EF8016C;
	Wed,  9 Mar 2022 21:23:16 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C9517F800D2; Wed,  9 Mar 2022 21:23:14 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE, T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8D46DF800D2
 for <alsa-devel@alsa-project.org>; Wed,  9 Mar 2022 21:23:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8D46DF800D2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="DTW0Cg0X"
Received: by mail-ej1-x635.google.com with SMTP id a8so7611909ejc.8
 for <alsa-devel@alsa-project.org>; Wed, 09 Mar 2022 12:23:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language
 :from:to:cc:references:in-reply-to:content-transfer-encoding;
 bh=58V2fCGzsfqcmE2/CejONEbjJLKwqBAus/Kg3pGGFn0=;
 b=DTW0Cg0XQbj7eZyB2vytYdHgXI76DV0YL6Kw7gXv82AfcZibZ+Kd3ekPi3rwu/5gkP
 D1jhDgNU/KSarFjqcu9BKFzQzltE1BzWAO0hpo7RpBl0eCyN+nG/HdbSinB2a132d4iM
 7bKiQjYltwuw8IkqT2Rzfk/xKS7qsn+W9vJHSo22Z+3Nk5fB7rX90TM1iORek7K1VZMq
 zfjlpwZ0LdGfonW4bf1mdP08XaFfopD8IpAQiclNelX5cDzyQ8RKaaUeZeCQ+qIcKoFL
 yBrjmFnBpBZ3x1d2ro2woTt4hVjIfe9fTr68m1CCnvyinsGPaWsf2jd4V6d1yzqr+lfO
 iU/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=58V2fCGzsfqcmE2/CejONEbjJLKwqBAus/Kg3pGGFn0=;
 b=QCpY38FG1Vtj8uHqLfh7blkcM1jcbbvxMVFD/Qf01UytNKo2Qn284qLCVgEIkIFLnS
 pEO8bTZOHsqqdwrS3PE2153ohd1O5qoDTZVg1Lnjgpo6XUWEBHE7sMQBOyIRJnzY2gRN
 rdrtA/HEqapZbLdoAz1SCGJXdobT3OAyxAczUIaRqfr+SOtRuWuZ0sRdTwJDh85c917k
 ZTtESAFCYbnMPUOEjuwBvRw9QuYWxh+G7gLkhJeBzFl/+leJxHErW6M7JzO0Due/2MXd
 vuc7pFvyMByLUYaHLKpExTKGjBbTv+9oilUzBWcOgKLKDxQfrvfJfcOMmppPWxd9+8oh
 eDeQ==
X-Gm-Message-State: AOAM530o7FMIXUA9Wt49n3yILaczNgjYrRDFGRN4PhYIW9aWPU/ZOa+A
 FRtFd0xiSByU7YBX5OjDWEk=
X-Google-Smtp-Source: ABdhPJw9W6C1dtgKkVtzTNA2p/OxN3Hn/V9XQcdDnA9AWe1lpB4wWU73n1t2Zni0youpz82qb78esQ==
X-Received: by 2002:a17:907:2a53:b0:6ce:e4fe:3f92 with SMTP id
 fe19-20020a1709072a5300b006cee4fe3f92mr1353881ejc.389.1646857391435; 
 Wed, 09 Mar 2022 12:23:11 -0800 (PST)
Received: from ?IPV6:2a01:c22:7793:600:9d6a:7788:3389:da6c?
 (dynamic-2a01-0c22-7793-0600-9d6a-7788-3389-da6c.c22.pool.telefonica.de.
 [2a01:c22:7793:600:9d6a:7788:3389:da6c])
 by smtp.googlemail.com with ESMTPSA id
 qb30-20020a1709077e9e00b006d6f8c77695sm1101748ejc.101.2022.03.09.12.23.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Mar 2022 12:23:11 -0800 (PST)
Message-ID: <d18bff6a-1df1-5f95-0cf8-10dbaa62d7be@gmail.com>
Date: Wed, 9 Mar 2022 21:21:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: [PATCH v2 1/2] ASoC: soc-core: add debugfs_prefix member to
 snd_soc_component_driver
Content-Language: en-US
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Jerome Brunet <jbrunet@baylibre.com>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Kevin Hilman
 <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
References: <51953618-79b6-0df7-2d28-d5dce4dc86c7@gmail.com>
In-Reply-To: <51953618-79b6-0df7-2d28-d5dce4dc86c7@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 alsa-devel@alsa-project.org,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
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

Allow the component debugfs_prefix to be set from
snd_soc_component_driver. First use case is avoiding a duplicate
debugfs entry error in case a device has multiple components
which have the same name therefore.

Note that we don't set component->debugfs_prefix if it's set already.
That's needed because partially component->debugfs_prefix is set
before calling snd_soc_component_initialize().

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 include/sound/soc-component.h | 4 ++++
 sound/soc/soc-core.c          | 5 +++++
 2 files changed, 9 insertions(+)

diff --git a/include/sound/soc-component.h b/include/sound/soc-component.h
index a52080407..766dc6f00 100644
--- a/include/sound/soc-component.h
+++ b/include/sound/soc-component.h
@@ -179,6 +179,10 @@ struct snd_soc_component_driver {
 				  struct snd_pcm_hw_params *params);
 	bool use_dai_pcm_id;	/* use DAI link PCM ID as PCM device number */
 	int be_pcm_base;	/* base device ID for all BE PCMs */
+
+#ifdef CONFIG_DEBUG_FS
+	const char *debugfs_prefix;
+#endif
 };
 
 struct snd_soc_component {
diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index a088bc9f7..11cb15319 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -2586,6 +2586,11 @@ int snd_soc_component_initialize(struct snd_soc_component *component,
 	component->dev		= dev;
 	component->driver	= driver;
 
+#ifdef CONFIG_DEBUG_FS
+	if (!component->debugfs_prefix)
+		component->debugfs_prefix = driver->debugfs_prefix;
+#endif
+
 	return 0;
 }
 EXPORT_SYMBOL_GPL(snd_soc_component_initialize);
-- 
2.35.1


