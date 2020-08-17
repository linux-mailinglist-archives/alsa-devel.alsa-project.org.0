Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AAE1246E14
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Aug 2020 19:22:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A5F4816DB;
	Mon, 17 Aug 2020 19:21:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A5F4816DB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597684938;
	bh=QfjH7CK1j5dkyPWpFAMOxQG6t4bkH3mbAUS/pBBMtCg=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=f4fZvt/6BcBKoxXKAVgVK9T3wcZUo0/6iMxRlBb2CJOu6x59eJ11molHNed4qhzHP
	 DL0+DaCFU+ewm8eWTPAMV5IJ58OKXSMKk1uxOEng7l80H2vpiUXsgWgIrqCHNN+ZuB
	 xEOpMS0NmVnVKURXzmyGgg5K06lUxG9HO/ED43lA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 55B4FF80255;
	Mon, 17 Aug 2020 19:20:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 37D20F80218; Mon, 17 Aug 2020 19:20:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,PRX_BODY_30,
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4A121F800D3;
 Mon, 17 Aug 2020 19:20:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4A121F800D3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="fpUZA4bf"
Received: by mail-pg1-x542.google.com with SMTP id 189so7778181pgg.13;
 Mon, 17 Aug 2020 10:20:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:from:to:cc:subject:date:mime-version
 :content-transfer-encoding;
 bh=RbY6tGPTrkcG98Af+Dxzxvljy/pjO7cq1UUK0Qa+75E=;
 b=fpUZA4bflgL5uVDjuNuakcvMqzu/C+VckkYBzailg2SKBvAhin8ad/Xh/+jlmDSR1n
 Hh1PuxtWl7RU1dkB7FMaFjRdBJ2XZ10wTShvzZsoRkZZ1aoGlu81UEgxZXzNsZJZ+jGq
 KzD/VLDqje+HlBcpNY7LlOeA8d12//DdSoruUkl2iPNr7AkLeF1YiP5oT3lRCrVENzN0
 2Glp4C147rgNhCyJ+Jd/X2vCt7oh8qbuOqi9/d+punKXmZoTl+6zexDeh5TOF2KxlICV
 AS8NwRvlpGpseUf32TnQ46KPFBOyMirXXMFz4g3vAhlM5I2nBzg2GhOhdD0XLpq4ejiX
 R3rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:from:to:cc:subject:date:mime-version
 :content-transfer-encoding;
 bh=RbY6tGPTrkcG98Af+Dxzxvljy/pjO7cq1UUK0Qa+75E=;
 b=dRAtkTZ+nJgBIR+Ae6AKzhW/fI4dohQFC2NbFUjTqyXz9za7mW/ip/JSwiYZFa96Ur
 ssIiNwbVOaMt1dBG/3PZVK4rmNTkOlltho6yx2csrERwRKIhdbWnpdgrMM41MA8AER0s
 shpIdRJb+mGm2tonj8eI7LPDNZjf3U+tsM9TOxxNLagGSbtZcl7fQB81PZ+dccsOWOFR
 0k4jVQzSOkAcnro3OfNfMh/N7u6gqhpj4CZ27j0lcMZTtuazt36aFSI8PyP/6F1wcZvI
 G9rkKl0qvs1zD9Qqf7J5YnzYJEPUsb3T8bnwqNTY4I3fX7x9daBfpYoHcYDR4aFVxh6L
 V3ng==
X-Gm-Message-State: AOAM5325zGVo6MrL9P3LcFQHFw5mSAiKyCDRVcQDpNdK6WRb75bB/7ck
 Uii5Jk6oE1QBrs4Yf+ReU2kiZutI9iY=
X-Google-Smtp-Source: ABdhPJwG9wGSCfgCv96oYWg23BN4tTFD2aqgDkAbv2L1KiYtJjm7RDEGpS8X6r4jW4j8HC/A1kbVnQ==
X-Received: by 2002:a63:143:: with SMTP id 64mr10369908pgb.343.1597684819076; 
 Mon, 17 Aug 2020 10:20:19 -0700 (PDT)
Received: from localhost.localdomain ([161.81.62.213])
 by smtp.gmail.com with ESMTPSA id t11sm19774006pfe.165.2020.08.17.10.20.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Aug 2020 10:20:18 -0700 (PDT)
Message-ID: <5f3abc52.1c69fb81.9cf2.fe91@mx.google.com>
X-Google-Original-Message-ID: <20200817172011.3717-1-me>
From: tom.ty89@gmail.com
X-Google-Original-From: me
To: patch@alsa-project.org
Subject: [PATCH] ALSA: usb-audio: ignore broken processing/extension unit
Date: Tue, 18 Aug 2020 01:20:11 +0800
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Tom Yan <tom.ty89@gmail.com>
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

From: Tom Yan <tom.ty89@gmail.com>

Some devices have broken extension unit where getting current value doesn't work. Attempt that once when creating mixer control for it. If it fails, just ignore it, so that it won't cripple the device entirely (and/or make the error floods).

Signed-off-by: Tom Yan <tom.ty89@gmail.com>
---
 sound/usb/mixer.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/sound/usb/mixer.c b/sound/usb/mixer.c
index eab0fd4fd7c3..e0b7174c1043 100644
--- a/sound/usb/mixer.c
+++ b/sound/usb/mixer.c
@@ -2367,7 +2367,7 @@ static int build_audio_procunit(struct mixer_build *state, int unitid,
 	int num_ins;
 	struct usb_mixer_elem_info *cval;
 	struct snd_kcontrol *kctl;
-	int i, err, nameid, type, len;
+	int i, err, nameid, type, len, val;
 	const struct procunit_info *info;
 	const struct procunit_value_info *valinfo;
 	const struct usbmix_name_map *map;
@@ -2470,6 +2470,12 @@ static int build_audio_procunit(struct mixer_build *state, int unitid,
 			break;
 		}
 
+		err = get_cur_ctl_value(cval, cval->control << 8, &val);
+		if (err < 0) {
+			usb_mixer_elem_info_free(cval);
+			return -EINVAL;
+		}
+
 		kctl = snd_ctl_new1(&mixer_procunit_ctl, cval);
 		if (!kctl) {
 			usb_mixer_elem_info_free(cval);
-- 
2.28.0

