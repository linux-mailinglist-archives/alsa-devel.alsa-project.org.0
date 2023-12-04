Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 780F8803357
	for <lists+alsa-devel@lfdr.de>; Mon,  4 Dec 2023 13:48:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 96E5D86E;
	Mon,  4 Dec 2023 13:48:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 96E5D86E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701694107;
	bh=gwEACH/aMrwkoIBjPUrdeotQmFvpJYGpN56GuamW+G8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=j11bsj5lsQbv0rehqMNSKEK1/mbwC1jtJx9/adbHVSRpE3AnxpYJHzpGlJhf7t+QQ
	 ss9hO2yKexqz2rIDvr+7zklMaI0hy/08hthptdd/DOdu1W4aRqeXqybZc1DWhqqu0K
	 5xYjQaylYp+owmv4zTRrDZGLMpoGBtu9r3mN3PAA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 317CAF8057F; Mon,  4 Dec 2023 13:47:55 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7AF5CF80578;
	Mon,  4 Dec 2023 13:47:55 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 777B5F8024E; Mon,  4 Dec 2023 13:47:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 45456F800AC
	for <alsa-devel@alsa-project.org>; Mon,  4 Dec 2023 13:47:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 45456F800AC
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=sXBNAyvc
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-54c846da5e9so1632561a12.3
        for <alsa-devel@alsa-project.org>;
 Mon, 04 Dec 2023 04:47:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701694062; x=1702298862;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+ziVbN5ZTP69p6FxRTQ/DrNWjlcr9menHHHhzgnVhU0=;
        b=sXBNAyvcuy07ld7Y3n6jAF0Fk1SdoKw9SLUhZ/pzUsXSEgHxFDvV4pbOtBgRafDILS
         9aebF0n0R5n652ASkFrvUniVfhIs8TdWsCm1zAqGc0jMqw/YcgPFoRaO0lY6j8uH04oI
         UYDHycZZ4Onv3eKg0S6Bd2NTqeuaeNE3TM/bbqlqgVBy6IY/44x6Fqrk+qM1158bD0EW
         M+/QfFGVmu9Wc/F6cRKWZoGtN76q0VMrd/e+4Lf90LFyltAy3/n18pzRr3YxPYEpvqv2
         vY9L20aUohrsCzaG829pWeUhJkbBsZ1jctkVxJZc6uYO+NHAvQ9IHpiXbzcoCY0RNl8X
         6FpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701694062; x=1702298862;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+ziVbN5ZTP69p6FxRTQ/DrNWjlcr9menHHHhzgnVhU0=;
        b=TPlz2TECq8jGtTKgizYmSaMp3K9ncX8yRTZtcE+L1caNy17B4IjNzM4RpBi+UYrH4E
         Zfbo3vasTGH8lEMk3QHykVdtjFxmsK6x+dZpo8pkyGSl/3kpMrkxRZuuARiYb8wmXXgz
         NjZ2/UQRWmcjUBEzcCGdCF6V4E466U8bivPpwQE9AFwieoM7aCRnoa5nyvb49RfmmRix
         dddex/U8sGdRbL6kzSfC0pcptbCxqevO4GVfK7pKLxZZLo2uVBR2pPTnwmCOrAwrAJDy
         03+dAn4IHpEz/Osvpa1Gwh5gsx+0Z0HGNP9METvG0hRpr1gCJgKnSXJTwpbdw1LmK+Bs
         lqQw==
X-Gm-Message-State: AOJu0YyX58UGrI7x5S2vNpqz5AGycWhLBVYFVMzrD7Lu+EsO2WHrGIOX
	fyzDrDvRTM82/aDVMB+Ng+DkBQ==
X-Google-Smtp-Source: 
 AGHT+IHApXDdpr226FRyb9j61M1tzyPuEc1Ds/nq5f9VgF00NIL9sLCBQAy4dDG6sIZWA3NbhrjkNA==
X-Received: by 2002:a50:d59a:0:b0:54c:4837:903c with SMTP id
 v26-20020a50d59a000000b0054c4837903cmr3836618edi.52.1701694062023;
        Mon, 04 Dec 2023 04:47:42 -0800 (PST)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id
 dc15-20020a056402310f00b0054ced65bd26sm457017edb.41.2023.12.04.04.47.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Dec 2023 04:47:41 -0800 (PST)
From: srinivas.kandagatla@linaro.org
To: broonie@kernel.org,
	alsa-devel@alsa-project.org
Cc: perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	johan+linaro@kernel.org,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH 1/2] ASoC: ops: add correct range check for limiting volume
Date: Mon,  4 Dec 2023 12:47:35 +0000
Message-Id: <20231204124736.132185-2-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231204124736.132185-1-srinivas.kandagatla@linaro.org>
References: <20231204124736.132185-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: VYRGQV63PEOPVL5LSHNLJ4RK6CLD3OLF
X-Message-ID-Hash: VYRGQV63PEOPVL5LSHNLJ4RK6CLD3OLF
X-MailFrom: srinivas.kandagatla@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VYRGQV63PEOPVL5LSHNLJ4RK6CLD3OLF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

Volume can have ranges that start with negative values, ex: -84dB to
+40dB. Apply correct range check in snd_soc_limit_volume before setting
the platform_max. Without this patch, for example setting a 0dB limit on
a volume range of -84dB to +40dB would fail.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/soc-ops.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/soc-ops.c b/sound/soc/soc-ops.c
index 55b009d3c681..2d25748ca706 100644
--- a/sound/soc/soc-ops.c
+++ b/sound/soc/soc-ops.c
@@ -661,7 +661,7 @@ int snd_soc_limit_volume(struct snd_soc_card *card,
 	kctl = snd_soc_card_get_kcontrol(card, name);
 	if (kctl) {
 		struct soc_mixer_control *mc = (struct soc_mixer_control *)kctl->private_value;
-		if (max <= mc->max) {
+		if (max <= mc->max - mc->min) {
 			mc->platform_max = max;
 			ret = 0;
 		}
-- 
2.25.1

