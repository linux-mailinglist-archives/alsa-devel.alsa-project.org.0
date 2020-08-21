Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 20DC524E074
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Aug 2020 21:06:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C324D1671;
	Fri, 21 Aug 2020 21:05:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C324D1671
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598036771;
	bh=eXISs/GcJTpxpOGs3a3RWPrYXjg0UmUsXpRhUnhf27o=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JSfNiTC8EX933MozO89DOh6GPNgsUPP4ZxPQ6oMcUWtSr3GyVCsBmwPul7gQESJmy
	 An6ZInpYkyKporg7DpvYYhsduyQRQ1K9IO5BgbaGzRpzCEf76AOWtlar/IMgBSLRlY
	 B4Fawh38WhL3r7ePMu5jcZV4nMHndSduKQm690kk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3073FF8036A;
	Fri, 21 Aug 2020 20:54:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 23497F80322; Fri, 21 Aug 2020 20:54:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AF0F6F80304
 for <alsa-devel@alsa-project.org>; Fri, 21 Aug 2020 20:54:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AF0F6F80304
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="E+m4RFJ5"
Received: by mail-qt1-x842.google.com with SMTP id h21so1920729qtp.11
 for <alsa-devel@alsa-project.org>; Fri, 21 Aug 2020 11:54:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4j2Ooeu2ISog/lD6w0WCQQfInoe31/wDtwY8WRaL+vA=;
 b=E+m4RFJ5QjMLgUBBbjCVHqOjHdtW7gV5D4XIJMrylgMlbQpr8JfjFy6bxdse0YqabM
 tBC8Jt/qH66/L2shnWcXhgpbk/pl6i6gRf87g6BA/EjIM17qN+uHg708iewH45k5prGH
 Go7ZpC/GpVQuZLtEq2XyFa59AMk8c36MbYG1VzdMqCTb5j2bi9LwZcS5nT4LrzMTOXSZ
 0WyNWH5DpSihpawOmNY8ZUIKEemKAQoVac+Pl75A3QBZR4jGN2F9BTPH3ZIj21C6nlBN
 RC02BsHtAzjtVPe+0c5cbTEkhx6H9xObvmK7GopRqt7sxPvptuXq6cpwD8slOkI1i8CH
 K/wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4j2Ooeu2ISog/lD6w0WCQQfInoe31/wDtwY8WRaL+vA=;
 b=b9Wwe83+XHbHriphS84rvn6LLE+HO9DyaNJqZPAJsCUshkaToLhSk+gRdVc0jNs38m
 cD9RwF769kn7TjZpcQsVa1DvB7dBJYOJPPQDQj2/t8OTRx6y7c5eCUbLPbncnVlhJ25t
 S1kJSywgL/jE8HVljbESTZH4+zj1A2PJqjxWfplse97t8Dk9e1hPl26sWehsXr2zzVg5
 4lgssRtI1VQ5uLl1Rq8L9sDXPjq2WqYQJNKRofuQnj+Xm3uDMYleakgCJx9jyMq0uVut
 DMglM8JaVXu3AWdzDzze3X+m0Ks4kDu6xSitCua/nJsTJSrZJV4DfLgofrcpJnrZ7H2W
 Jr0A==
X-Gm-Message-State: AOAM531NecA5RTWFJuYnrgRwJFq4WL0Zs6QJXFDERUHDkCsPXJbLQEQX
 DW5YqXDdmQVucBMKVpHJXJA=
X-Google-Smtp-Source: ABdhPJwr6TUAy9j3Vami64pyga/LqLY2P0SXRXQyBHOMFag3xf3VX1zyuPurLP+i660UUSJjECDduQ==
X-Received: by 2002:aed:3b57:: with SMTP id q23mr4031882qte.150.1598036056850; 
 Fri, 21 Aug 2020 11:54:16 -0700 (PDT)
Received: from localhost.localdomain (cpe-71-65-111-223.cinci.res.rr.com.
 [71.65.111.223])
 by smtp.googlemail.com with ESMTPSA id o72sm2468426qka.113.2020.08.21.11.54.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Aug 2020 11:54:16 -0700 (PDT)
From: Connor McAdams <conmanx360@gmail.com>
To: 
Subject: [PATCH 19/20] ALSA: hda/ca0132 - Add AE-7 custom controls.
Date: Fri, 21 Aug 2020 14:52:36 -0400
Message-Id: <20200821185239.26133-20-conmanx360@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200821185239.26133-1-conmanx360@gmail.com>
References: <20200821185239.26133-1-conmanx360@gmail.com>
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

Add headphone gain and DAC filter controls, which use the same commands
as the AE-5. Also, change input source enumerated control item count to
exclude front microphone.

Signed-off-by: Connor McAdams <conmanx360@gmail.com>
---
 sound/pci/hda/patch_ca0132.c | 20 ++++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/sound/pci/hda/patch_ca0132.c b/sound/pci/hda/patch_ca0132.c
index 933f3b0be63e..9c70d85b21e0 100644
--- a/sound/pci/hda/patch_ca0132.c
+++ b/sound/pci/hda/patch_ca0132.c
@@ -5839,6 +5839,13 @@ static int ca0132_alt_input_source_put(struct snd_kcontrol *kcontrol,
 	int sel = ucontrol->value.enumerated.item[0];
 	unsigned int items = IN_SRC_NUM_OF_INPUTS;
 
+	/*
+	 * The AE-7 has no front microphone, so limit items to 2: rear mic and
+	 * line-in.
+	 */
+	if (ca0132_quirk(spec) == QUIRK_AE7)
+		items = 2;
+
 	if (sel >= items)
 		return 0;
 
@@ -7029,20 +7036,25 @@ static int ca0132_build_controls(struct hda_codec *codec)
 		}
 	}
 
-	if (ca0132_quirk(spec) == QUIRK_AE5) {
+	switch (ca0132_quirk(spec)) {
+	case QUIRK_AE5:
+	case QUIRK_AE7:
 		err = ae5_add_headphone_gain_enum(codec);
 		if (err < 0)
 			return err;
 		err = ae5_add_sound_filter_enum(codec);
 		if (err < 0)
 			return err;
-	}
-
-	if (ca0132_quirk(spec) == QUIRK_ZXR) {
+		break;
+	case QUIRK_ZXR:
 		err = zxr_add_headphone_gain_switch(codec);
 		if (err < 0)
 			return err;
+		break;
+	default:
+		break;
 	}
+
 #ifdef ENABLE_TUNING_CONTROLS
 	add_tuning_ctls(codec);
 #endif
-- 
2.20.1

