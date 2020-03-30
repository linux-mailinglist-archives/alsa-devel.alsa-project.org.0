Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C85B1975C7
	for <lists+alsa-devel@lfdr.de>; Mon, 30 Mar 2020 09:34:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 254B91612;
	Mon, 30 Mar 2020 09:33:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 254B91612
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1585553660;
	bh=vNhoGYVnKuisCDVz0bKuroPgac3V2xsV4KBn5pZErMQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SlQZ7oXqWlKz9OqBciUnnGtYqQUNibvxdtsFON01kpXLlchlvmTji+8Mm1Y0ctLIX
	 me9UvP939uI1HbPWp02KbOI5kBgaR3YMRl6uYhzvjacy2KZInHi0usKrI5MXhfHB8U
	 dGq/ObZ5k1k5rAoJa3DTUbuIhYXYMaYO+D6Pk5ck=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2BD07F802BC;
	Mon, 30 Mar 2020 09:31:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C344FF80299; Mon, 30 Mar 2020 09:30:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-qv1-xf41.google.com (mail-qv1-xf41.google.com
 [IPv6:2607:f8b0:4864:20::f41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BA985F8028C
 for <alsa-devel@alsa-project.org>; Mon, 30 Mar 2020 09:30:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BA985F8028C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="LncIDrPv"
Received: by mail-qv1-xf41.google.com with SMTP id bu9so2406145qvb.13
 for <alsa-devel@alsa-project.org>; Mon, 30 Mar 2020 00:30:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YSCR8aNaMptUVJblHXzimEhpdjR3BXiCbmHpK02W3lk=;
 b=LncIDrPvKfAaA0dhcA1CA6xSu37hTu7qLw8XmXxotN2+at1XgNjhyFv4Y4I7H4/w0W
 DAWchdINvtcWP8flC+eMYf6hCKTriOhJgVZYvRomEiET7v2tXpQaYI8hiIaCT9BAYkjm
 y7AaQcqmNHSoL5o3zCMd5He3nETzjhpQMyoi9L3oc+EqyuYRQupNNGTcOnnG06WfolPA
 +9cpmsf56FAWCiwrkrr7yeD2N1k1dV3ZFestnmeVy08IF22w8zrTD2/BNwb/2vDBqo3J
 KnbcuxptAesv8x2caZvZy32Jaia2ZCLtDj+TP2gM1PQgnmptCWo19XIPSadg4j/3+6m2
 gR9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YSCR8aNaMptUVJblHXzimEhpdjR3BXiCbmHpK02W3lk=;
 b=H8ok8PovH797/HoPj8l1cUtRAjN/ZzL8yC5SdMT8esWQdQtFtMkwatCa98vvLjSYr0
 4fdnSeSXGTnmma+sBGFY4erXxo4antAvnVm9XkKs0KNLtQlUMX9jfn3VznV/x1fKp5Bd
 bnl9msYgrtzba3rhg1bmUHmPCoJKKLoxN7ZSbX/KKl0NkHcOK9+4yUX0AU8N+T/BJwFG
 pzmWJqvUnor5Nb/Hr6g/F6JyLrufT3Qgj6PU8EGmEMnlrq3jNNL5e3VoJHsMovIOEh31
 Xz7GsPJ27YlMOAEepe/mRq/xKRmPRmVWkehOGZAiZpW3ybvyUPKzti7rsJKG1NaGOK4c
 ZW6g==
X-Gm-Message-State: ANhLgQ1Qz8onzZII4Ml2LZrs8OUmEibQu8M857XQjkDcEV8nFxQCX7JR
 MgLBL6UivnsU7lba+XBHSkVELJp+NBik4A==
X-Google-Smtp-Source: ADFU+vslCt+RBP2jHzxrwlc3lOO1Rt8opKMEjAVebM0NpBBzZdmUI5QhM+bbgTpwxrVgYbGYdpiuXA==
X-Received: by 2002:a05:6214:118d:: with SMTP id
 t13mr10076777qvv.192.1585553440691; 
 Mon, 30 Mar 2020 00:30:40 -0700 (PDT)
Received: from stingray.lan (pool-173-76-255-234.bstnma.fios.verizon.net.
 [173.76.255.234])
 by smtp.gmail.com with ESMTPSA id n63sm10078499qka.80.2020.03.30.00.30.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Mar 2020 00:30:40 -0700 (PDT)
From: Thomas Hebb <tommyhebb@gmail.com>
To: alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.or
Subject: [PATCH 2/3] ALSA: hda/realtek - Set principled PC Beep configuration
 for ALC256
Date: Mon, 30 Mar 2020 03:30:31 -0400
Message-Id: <d631643464d38603f6d672d9340a331f6a016a1c.1585553414.git.tommyhebb@gmail.com>
X-Mailer: git-send-email 2.25.2
In-Reply-To: <cover.1585553414.git.tommyhebb@gmail.com>
References: <cover.1585553414.git.tommyhebb@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Kailang Yang <kailang@realtek.com>,
 Tomas Espeleta <tomas.espeleta@gmail.com>,
 Sergey Bostandzhyan <jin@mediatomb.cc>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Takashi Iwai <tiwai@suse.com>,
 stable@vger.kernel.org, Hui Wang <hui.wang@canonical.com>,
 Thomas Hebb <tommyhebb@gmail.com>, Jian-Hong Pan <jian-hong@endlessm.com>,
 =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
 linux-kernel@vger.kernel.org
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

The Realtek PC Beep Hidden Register[1] is currently set by
patch_realtek.c in two different places:

In alc_fill_eapd_coef(), it's set to the value 0x5757, corresponding to
non-beep input on 1Ah and no 1Ah loopback to either headphones or
speakers. (Although, curiously, the loopback amp is still enabled.) This
write was added fairly recently by commit e3743f431143 ("ALSA:
hda/realtek - Dell headphone has noise on unmute for ALC236") and is a
safe default. However, it happens in the wrong place:
alc_fill_eapd_coef() runs on module load and cold boot but not on S3
resume, meaning the register loses its value after suspend.

Conversely, in alc256_init(), the register is updated to unset bit 13
(disable speaker loopback) and set bit 5 (set non-beep input on 1Ah).
Although this write does run on S3 resume, it's not quite enough to fix
up the register's default value of 0x3717. What's missing is a set of
bit 14 to disable headphone loopback. Without that, we end up with a
feedback loop where the headphone jack is being driven by amplified
samples of itself[2].

This change eliminates the write in alc_fill_eapd_coef() and replaces
the update in alc256_init() with a write of the fixed value 0x4727. This
value ought to have the same behavior as 0x5757--disabling all PC Beep
routing that isn't part of the HDA node graph--but it has two
differences:

 1. To enable non-beep input on 1Ah, the `b` field is set to 1, like the
    previous code in alc256_init() used, instead of 2, like the value
    written by alc_fill_eapd_coef() used. My testing shows these two
    values to behave identically, but, in case there is a difference,
    a bitwise update of the register seems like a more reliable source
    of truth than a magic number written without explanation.

 2. Loopback amplification is disabled (unset L and R bits) because no
    loopback path is in use.

Affects the ALC255, ALC256, ALC257, ALC235, and ALC236 codecs.

[1] Newly documented in Documentation/sound/hd-audio/realtek-pc-beep.rst

[2] Setting the "Headphone Mic Boost" control from userspace changes
this feedback loop and has been a widely-shared workaround for headphone
noise on laptops like the Dell XPS 13 9350. This commit eliminates the
feedback loop and makes the workaround unnecessary.

Fixes: e3743f431143 ("ALSA: hda/realtek - Dell headphone has noise on unmute for ALC236")
Cc: stable@vger.kernel.org
Signed-off-by: Thomas Hebb <tommyhebb@gmail.com>
---

 sound/pci/hda/patch_realtek.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 63e1a56f705b..024dd61a788b 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -367,7 +367,9 @@ static void alc_fill_eapd_coef(struct hda_codec *codec)
 	case 0x10ec0215:
 	case 0x10ec0233:
 	case 0x10ec0235:
+	case 0x10ec0236:
 	case 0x10ec0255:
+	case 0x10ec0256:
 	case 0x10ec0257:
 	case 0x10ec0282:
 	case 0x10ec0283:
@@ -379,11 +381,6 @@ static void alc_fill_eapd_coef(struct hda_codec *codec)
 	case 0x10ec0300:
 		alc_update_coef_idx(codec, 0x10, 1<<9, 0);
 		break;
-	case 0x10ec0236:
-	case 0x10ec0256:
-		alc_write_coef_idx(codec, 0x36, 0x5757);
-		alc_update_coef_idx(codec, 0x10, 1<<9, 0);
-		break;
 	case 0x10ec0275:
 		alc_update_coef_idx(codec, 0xe, 0, 1<<0);
 		break;
@@ -3269,7 +3266,13 @@ static void alc256_init(struct hda_codec *codec)
 	alc_update_coefex_idx(codec, 0x57, 0x04, 0x0007, 0x4); /* Hight power */
 	alc_update_coefex_idx(codec, 0x53, 0x02, 0x8000, 1 << 15); /* Clear bit */
 	alc_update_coefex_idx(codec, 0x53, 0x02, 0x8000, 0 << 15);
-	alc_update_coef_idx(codec, 0x36, 1 << 13, 1 << 5); /* Switch pcbeep path to Line in path*/
+	/*
+	 * Expose headphone mic (or possibly Line In on some machines) instead
+	 * of PC Beep on 1Ah, and disable 1Ah loopback for all outputs. See
+	 * Documentation/sound/hd-audio/realtek-pc-beep.rst for details of
+	 * this register.
+	 */
+	alc_write_coef_idx(codec, 0x36, 0x4727);
 }
 
 static void alc256_shutup(struct hda_codec *codec)
-- 
2.25.2

