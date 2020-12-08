Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 03D5B2D353B
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Dec 2020 22:28:12 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 20CD616E0;
	Tue,  8 Dec 2020 22:27:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 20CD616E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1607462891;
	bh=5/qpW5deatbGyXGaAyxV0A+Yk9tFF3iiHc/q+6O90Cs=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Oy3DGiA2uWxd6rt0DQiK3D2YlZceNiC8qValD/8k6jjWbjiJNIJBZJhlFT89WS/oE
	 Orm7Q6goUIk/iWCSKMUgMpfpxdYmi4+fVRZxHjDSzCIbzMmY0xhFL62ajwqa6r9xN7
	 THvlBdpK07jgaaB9VHeNTwptSeoKE4ZFeTb6golI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 896CFF8026A;
	Tue,  8 Dec 2020 22:26:29 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3860DF80130; Tue,  8 Dec 2020 22:26:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D2742F80130
 for <alsa-devel@alsa-project.org>; Tue,  8 Dec 2020 22:26:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D2742F80130
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="lwl8B0bv"
Received: by mail-qt1-x843.google.com with SMTP id f14so4513029qto.12
 for <alsa-devel@alsa-project.org>; Tue, 08 Dec 2020 13:26:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TekqjgSsdWTRJUqcm3lBG19qprznIlJibNa9BIZ8520=;
 b=lwl8B0bvflCaiP9+PZSNj3AqNQK7cGYKAQg2JWnnvbzy6NXBhn45+8CtanCzmgz6q8
 Rk8fd4LySvXbvYKm0oHWkpW/kt3GOMe5O1lpZvxYMKgHZmUXzZSJL2sr/73PQcxgn6U3
 NZr7/d/oKDT2SOulNog3GdaH4unxs/tMQTEJUqROr/fK/CzxY+plvWlKXqtM/PgGAEfj
 EieJCci//nxViPUIcBYqoTw2LKP6tcCBc0/sRKKtSE/W8lYY+Kje30MnWfWwsQWsslNO
 EWS/icQaVCbExyj2/J725suZNOvTJjDGXZgYBsnDjplJw8KylPAwU1VSqfb/4LkVzScF
 fHSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TekqjgSsdWTRJUqcm3lBG19qprznIlJibNa9BIZ8520=;
 b=TUqU8UeKgh0Gpp+/yitKwF7GwvzuoklrFjhf2Ggp5TO+Pz/u1s3KpO7w3ueOXwTz0Z
 vifUYlSTb8JUFwvWD14HWm4vSn1SjZZMhBSNa8fR4k7dxs0C6i19TBf8xc54lcA8k8mu
 xIi72Mp29brcAgvag9NtpylA8A9D0Q+apjRNOBfMeL5nq8Bq0oROCPNeXwnNNQqA/BKP
 ACOp3In13K6rqrqaH+6f9kw2C5TZL6UwZsbdkGVuBtYycl9N5BwMJ+9xOvkdSrtDDDxx
 Z3KMFMn/vWPUr0AQxRRy1GVqWk3z6ooM1yXj1//J3Cy/NtC6ZepOv3mBIfzpXoRVb+T5
 GnJA==
X-Gm-Message-State: AOAM5319kfs3Jfs6ckgstBJE7NPVrDhUfmLSN9eQFFM5eXGbI4p+3qjd
 zP3cFCvenoDLfSmBkPJ+9kw=
X-Google-Smtp-Source: ABdhPJzGjv4tMTGgPbFeKpWWjYQoYNBsAo5cAtcyK8NsnwzCDbyjGdGmRJgjvOj/PyFNv9Qr4f5vQA==
X-Received: by 2002:ac8:6f04:: with SMTP id g4mr26375008qtv.122.1607462781299; 
 Tue, 08 Dec 2020 13:26:21 -0800 (PST)
Received: from localhost.localdomain (cpe-71-65-111-223.cinci.res.rr.com.
 [71.65.111.223])
 by smtp.googlemail.com with ESMTPSA id l1sm16018572qkj.101.2020.12.08.13.26.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Dec 2020 13:26:20 -0800 (PST)
From: Connor McAdams <conmanx360@gmail.com>
To: 
Subject: [PATCH 1/5] ALSA: hda/ca0132 - Reset codec upon initialization.
Date: Tue,  8 Dec 2020 16:25:41 -0500
Message-Id: <20201208212546.428392-2-conmanx360@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201208212546.428392-1-conmanx360@gmail.com>
References: <20201208212546.428392-1-conmanx360@gmail.com>
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
index 4fbec4258f58..05945f021e74 100644
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

