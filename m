Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EB034938F93
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Jul 2024 15:02:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 62652F52;
	Mon, 22 Jul 2024 15:01:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 62652F52
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1721653327;
	bh=RDZn9nceSKHWHAEJxopugD/XqHyZGSXq4lGQoM/TFAQ=;
	h=Date:From:To:Cc:Subject:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=Wwo0gACmAPnbPjIWEZsnog+eKbKNtm7m/ApOFXvIukQdLjY338Ud7Px/NLz9VF7R3
	 A/OxSq50qyTluvuQMFRoaCge8yOPbfRboWCm1aKXrw1oHSjzjdEdaoD9JsF97uzQLS
	 2O5p0kOK6sgFDguJjOqlrDhMIQDVmG3ObgxfhDlk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D20F7F8069E; Mon, 22 Jul 2024 15:00:22 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EBB2FF805E5;
	Mon, 22 Jul 2024 15:00:21 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CCD04F804FC; Sat, 20 Jul 2024 01:53:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com
 [IPv6:2607:f8b0:4864:20::22f])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B0D85F8007E
	for <alsa-devel@alsa-project.org>; Sat, 20 Jul 2024 01:53:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B0D85F8007E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=s3Wd4w8f
Received: by mail-oi1-x22f.google.com with SMTP id
 5614622812f47-3d9dbbaa731so1331010b6e.3
        for <alsa-devel@alsa-project.org>;
 Fri, 19 Jul 2024 16:53:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721433231; x=1722038031;
 darn=alsa-project.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ldzFiam0mujMuq28ca76nisFGKp3WDY0EGEFzIWMbRk=;
        b=s3Wd4w8f9jfYlmn9QMCbYAxhYlb9S0JG/U+9lmlPtn9S0bElTPaLneGiaOutdptNM2
         qh8dAALLgCRMGdhEMOaQFWBWJOq6PquF+IA95CTXUi8Cpb/p9h218IP/Xaw/QSd0zZuE
         3pD5j090OpoaG03kx/E7FabsYluQ7geJEVF9v4hlkuGXkX77o+MB+B1LJh7ZHsvpRaVx
         vKa0SBdxK/0B0qXaEkvgftqnkYdDMm0dt/3XXK8Oh1C8t9seP44bgaKYf3eVerMj8Ied
         NIVQIHAKJYMSlF8crZeTUvvCf+k4MK+cxb6lhBzJw8Y1FrzB/a4E1cHYm8ncH0/iCx4L
         y+qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721433231; x=1722038031;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ldzFiam0mujMuq28ca76nisFGKp3WDY0EGEFzIWMbRk=;
        b=HywXVLv/iK1QCdHQG/lWFhQqzD289oo1MCUfbtneh7PUzJ9EAMuNWIyUwRFD8308+O
         9mD4lhunthd04GBHV+IC9tJ4b5HbYl0zCEGMNqexFXg2jC28Vm5LJ7byulJHKiWNrBUM
         NUxQW+9nKMkNLhYoNswhwyJ9Ze1z0XAhwsOeLVXKVYb6gW8RaWrJK/EsFaifFjbVFMrB
         sEiW1UkxnTfr2twCyCJv3jpq6kEfPxBlIF058adcf1cG7v/pXF8Zk0AM3sBjB2wp1GRC
         VcKECjcQlO8qLDv+NkEQV/zFbROovXxUxFQIoAor9wZZhDt5R4PiDlT3zAVoO3CU5yJV
         MRyg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUgQLfVzT+0NledzOVMBFVXzQ7x71n/sbTFM3I1M8rhfjcaowZ6TKo+EPS5/eEUJxNmgE6nwcku160Z/I6nESLwpocgui7iTYpWr1s=
X-Gm-Message-State: AOJu0YxatSr2foG1O660tLRVoZSkkvQOGDbNZzvvaXom2sPug0n4qwe4
	qiiXDL6w8/N6NZFgsUKw97LOhaX9HaH3VjwJDsw9GkcgA6LMOo8beVQPAt/EmvU=
X-Google-Smtp-Source: 
 AGHT+IHqte/qz54f4SL0d75xLOAyVvOPIAw+LbKlNbbM1Lp827319iwrSa6rBuKjQZrpHBI/U5i0og==
X-Received: by 2002:a05:6808:159b:b0:3d6:40fe:d537 with SMTP id
 5614622812f47-3dae97c592emr95855b6e.13.1721433231314;
        Fri, 19 Jul 2024 16:53:51 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:739a:b665:7f57:d340])
        by smtp.gmail.com with ESMTPSA id
 5614622812f47-3dae09ce8d7sm487021b6e.46.2024.07.19.16.53.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jul 2024 16:53:50 -0700 (PDT)
Date: Fri, 19 Jul 2024 18:53:48 -0500
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Shenghao Ding <shenghao-ding@ti.com>
Cc: Kevin Lu <kevin-lu@ti.com>, Baojun Xu <baojun.xu@ti.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] ASoc: TAS2781: Fix tasdev_load_calibrated_data()
Message-ID: <18a29b68-cc85-4139-b7c7-2514e8409a42@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-MailFrom: dan.carpenter@linaro.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: SKTXIGCSPINK6U4HRY22FALRFGBIMOZQ
X-Message-ID-Hash: SKTXIGCSPINK6U4HRY22FALRFGBIMOZQ
X-Mailman-Approved-At: Mon, 22 Jul 2024 13:00:12 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SKTXIGCSPINK6U4HRY22FALRFGBIMOZQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This function has a reversed if statement so it's either a no-op or it
leads to a NULL dereference.

Fixes: b195acf5266d ("ASoC: tas2781: Fix wrong loading calibrated data sequence")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 sound/soc/codecs/tas2781-fmwlib.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/tas2781-fmwlib.c b/sound/soc/codecs/tas2781-fmwlib.c
index 63626b982d04..8f9a3ae7153e 100644
--- a/sound/soc/codecs/tas2781-fmwlib.c
+++ b/sound/soc/codecs/tas2781-fmwlib.c
@@ -2162,7 +2162,7 @@ static void tasdev_load_calibrated_data(struct tasdevice_priv *priv, int i)
 		return;
 
 	cal = cal_fmw->calibrations;
-	if (cal)
+	if (!cal)
 		return;
 
 	load_calib_data(priv, &cal->dev_data);
-- 
2.43.0

