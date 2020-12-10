Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EC4062D6134
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Dec 2020 17:09:18 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 09A97167C;
	Thu, 10 Dec 2020 17:08:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 09A97167C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1607616558;
	bh=xHUCVA+a/yapyoMiehOtQSP0h7Vl5Q661IqQZw/giSs=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SujqZ04XbYNswWRlYsDAuLo+Bp5OYcfPhHp5RDBNDouHvEGMVIIoaEPDzLOQ/bux9
	 XDysAiNlIGrC1BpbDjlgHQngkIMPEnV7FKr/8e3BgUn3RLD9sN9LtXOKIFhi/8yz06
	 opDS92AXQ96C8gukCuDYxwb/5cEwR3i90gflndYc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 75E3EF8019D;
	Thu, 10 Dec 2020 17:07:37 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C72F0F80255; Thu, 10 Dec 2020 17:07:34 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 13836F800EF
 for <alsa-devel@alsa-project.org>; Thu, 10 Dec 2020 17:07:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 13836F800EF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="g+mxm6co"
Received: by mail-qt1-x841.google.com with SMTP id b9so4016471qtr.2
 for <alsa-devel@alsa-project.org>; Thu, 10 Dec 2020 08:07:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IaJnWNUybnDRToq59E44bnvu+Jic0mLbhcwyhGMTzRg=;
 b=g+mxm6coxLYmTo9xcwa8YCqTf/r9WRXpwm6Kb9H8g1fxJKcJ+6wVd6LcC1oLcPdWnI
 +qcmDfv8DiB7ePiicz6BLJknwjPytnPnm2coOvXjjnawdOi1wyGON0jUX9MvyKW0dFAl
 ziPlFGzz82SC4HA8wvHPWFltP23SbL0PO3CM3XmgbLPnq8Yo8J7UAEJdAWgViMgkDawX
 wlrRIzLZZeHfdFgGDy1Dq3LloFvc8nV8WyO8XsalHLPj+9olE+Hi8gSpWJ5Nqi3hmbHl
 UTEbfjNQIVcYYevJIZ9m6EV4a2Uym+Fsnm7ICg2WkCDm0iE91xVIxBcziQPIVgEOhNrA
 1rZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IaJnWNUybnDRToq59E44bnvu+Jic0mLbhcwyhGMTzRg=;
 b=YE5BdHskuxFOzF1IlooNPHg2GRRTf+eL0r2TZSeVQUAzku+IeZQdqnj/3msOWIXp3A
 02unpYoAgRgxDrLMgR7IabArA+0KQrt8TUXuBK1BlgpF+KcMGCEtxwExy3ZfmPMqxh5F
 UFDEbxR9QxziV1FCb8ZdELrdn7G1+XVj3WXmE8yd+X3bmpgJ7Yu4kyAToA8va0bnr4C/
 OYRAVNq+jrQQaoG5XMlarfaE+IyeVbjQlIe0q+0I6DamKNgiPabTYex6Pg7JYJ2BNsiG
 ayMSf+fu8/hAWFKUUG9QO+JLcaULJKWGVWQY0aiNBYHiOnWr/FMCx/rxB+xF0Xxi3InE
 PbGg==
X-Gm-Message-State: AOAM533L0rPIX8HS5CWZgOLz3O3eD2d2YE8jOuFQVL6y9eihlfaAlg+h
 peRq7X4XaBJQeGE0CkTMbNk=
X-Google-Smtp-Source: ABdhPJy9R5XGjJibBGGyFMY5hnkxdoG/RC/758l2eEMy+43kGHS2+NHDuMYDV/BPfzWhOFMlkRvFcQ==
X-Received: by 2002:ac8:6bc9:: with SMTP id b9mr10135474qtt.51.1607616444591; 
 Thu, 10 Dec 2020 08:07:24 -0800 (PST)
Received: from localhost.localdomain (cpe-71-65-111-223.cinci.res.rr.com.
 [71.65.111.223]) by smtp.googlemail.com with ESMTPSA id
 d190sm3852290qkf.112.2020.12.10.08.07.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Dec 2020 08:07:24 -0800 (PST)
From: Connor McAdams <conmanx360@gmail.com>
To: 
Subject: [PATCH v2 1/5] ALSA: hda/ca0132 - Reset codec upon initialization.
Date: Thu, 10 Dec 2020 11:06:53 -0500
Message-Id: <20201210160658.461739-2-conmanx360@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201210160658.461739-1-conmanx360@gmail.com>
References: <20201210160658.461739-1-conmanx360@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-kernel@vger.kernel.org, conmanx360@gmail.com,
 Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org
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

Reset the codec upon initialization to clear out anything that may have
been setup on a previous boot into Windows, or in case of an improper
shutdown.

Signed-off-by: Connor McAdams <conmanx360@gmail.com>
---
 sound/pci/hda/patch_ca0132.c | 21 ++++++++++++++++-----
 1 file changed, 16 insertions(+), 5 deletions(-)

diff --git a/sound/pci/hda/patch_ca0132.c b/sound/pci/hda/patch_ca0132.c
index 6d647d461eab..7ce4a966b733 100644
--- a/sound/pci/hda/patch_ca0132.c
+++ b/sound/pci/hda/patch_ca0132.c
@@ -8642,6 +8642,22 @@ static void ca0132_init_chip(struct hda_codec *codec)
 
 	mutex_init(&spec->chipio_mutex);
 
+	/*
+	 * The Windows driver always does this upon startup, which seems to
+	 * clear out any previous configuration. This should help issues where
+	 * a boot into Windows prior to a boot into Linux breaks things. Also,
+	 * Windows always sends the reset twice.
+	 */
+	if (ca0132_use_alt_functions(spec)) {
+		chipio_set_control_flag(codec, CONTROL_FLAG_IDLE_ENABLE, 0);
+		chipio_write_no_mutex(codec, 0x18b0a4, 0x000000c2);
+
+		snd_hda_codec_write(codec, codec->core.afg, 0,
+			    AC_VERB_SET_CODEC_RESET, 0);
+		snd_hda_codec_write(codec, codec->core.afg, 0,
+			    AC_VERB_SET_CODEC_RESET, 0);
+	}
+
 	spec->cur_out_type = SPEAKER_OUT;
 	if (!ca0132_use_alt_functions(spec))
 		spec->cur_mic_type = DIGITAL_MIC;
@@ -9262,11 +9278,6 @@ static void ae5_register_set(struct hda_codec *codec)
 
 	if (ca0132_quirk(spec) == QUIRK_AE5)
 		ca0113_mmio_command_set(codec, 0x48, 0x07, 0x83);
-
-	chipio_write(codec, 0x18b0a4, 0x000000c2);
-
-	snd_hda_codec_write(codec, 0x01, 0, 0x7ff, 0x00);
-	snd_hda_codec_write(codec, 0x01, 0, 0x7ff, 0x00);
 }
 
 /*
-- 
2.25.1

