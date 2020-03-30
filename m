Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 34FE21980AE
	for <lists+alsa-devel@lfdr.de>; Mon, 30 Mar 2020 18:13:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D0F6615F2;
	Mon, 30 Mar 2020 18:13:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D0F6615F2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1585584836;
	bh=YdkOv0U9DOdm/8Iou37Qkw0uxT+OqwHY/sAFDF/O69M=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lIrGnZoN6wLdNC0PN7yCFyp+YgBKF6VAXrQv9l4PoXOhWb8EiJATnrY1AZcGb+oGR
	 k0rAxT0YTeOkntK/DVpGwwQ/NNWtjncJAY3fuXJiPkRspnYuUu1tJK+al3G3BGeuiS
	 RB7Bxuv/vrGPNqfQbw8ljkaU9MdEstMBqY7igTtI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 05FC0F8028C;
	Mon, 30 Mar 2020 18:11:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BFBCEF80145; Mon, 30 Mar 2020 18:10:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8F4B7F800EB
 for <alsa-devel@alsa-project.org>; Mon, 30 Mar 2020 18:09:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8F4B7F800EB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="dTRP83aF"
Received: by mail-qt1-x843.google.com with SMTP id i3so15497066qtv.8
 for <alsa-devel@alsa-project.org>; Mon, 30 Mar 2020 09:09:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8az6hDKY7FHJFo4TlScJiI//xvWvp101VJi61sHgWdg=;
 b=dTRP83aFcRU4vEXJxSAzvSa5sPU/M09cTwacAA1KR6B9DY6ey0WJXcMe3LQ83VVWq4
 HWwZ4/QMUffdrVEDBTnNMP0p5aN0KjuTj8juP92mtl2ZbKZ5fYWpiSZMvMhgLB6M0dyx
 lPEdURknnTujUsxilQCQOp90T/2Le7yxPnwq5+XszHQPv0ldKtJQWyX1J3LaY5d+gW5B
 J2/aHhO0jO+3p6PaF1BHq6XlrxcveJCentnxvUHxbkk+7JuMNd+9REXb8uoIV2I11VXG
 JC4/iTdjj1q1C6EpSQNQXzf6gdnW21vLkait+hM5bnn28GdPeh7XHpW99jhuW2kZJT4o
 m0Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8az6hDKY7FHJFo4TlScJiI//xvWvp101VJi61sHgWdg=;
 b=QtfXlxv9TPDrFlZxywDYcjPZGV0y47he3DNF0sPWh5wnwacjtfc6n/d5jcauucwTAl
 h1WFwHDFaPIrmClmPhiIx3y8vXlrslfY37Q2I3I58DvjurvfwB3HVLwIQxlIZh5SPNkd
 WIVbohQL4x6AMipLTs3eNrXdnhu6pK/HxHUaPM1gXP43KxawR34WIGNCNVHLcUakZVPz
 +/35AoBkvZCTWXRz6C3vM7ZS6zgN7BpdLrnwkj/IQQTUh/fZ6GslPI6ac3irgyzwbMAu
 KNTXccJytmbGa+o62pqPJCfwb0jH931yW8nQyz7xUd+jv2SCTEKls8NfWvWGOsuidgE8
 sjXw==
X-Gm-Message-State: ANhLgQ3ehzx+xVaKfOfPKjAQomXEYc1WH/kaCJL79D+ipFT1o+FzGYUM
 TGx3VPHqNdQkcdCRN9nYW4dA3wTvFrkogA==
X-Google-Smtp-Source: ADFU+vsiUQM589r3oUJoHwSoYDrP4Gt6tMo4znqgcFYYE3Y0zumUCKoUa5W0aXTe7hbAJwKnxal6jA==
X-Received: by 2002:aed:3e50:: with SMTP id m16mr677800qtf.75.1585584594983;
 Mon, 30 Mar 2020 09:09:54 -0700 (PDT)
Received: from stingray.lan (pool-173-76-255-234.bstnma.fios.verizon.net.
 [173.76.255.234])
 by smtp.gmail.com with ESMTPSA id z18sm11789091qtz.77.2020.03.30.09.09.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Mar 2020 09:09:54 -0700 (PDT)
From: Thomas Hebb <tommyhebb@gmail.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2 2/3] ALSA: hda/realtek - Set principled PC Beep
 configuration for ALC256
Date: Mon, 30 Mar 2020 12:09:38 -0400
Message-Id: <bf22b417d1f2474b12011c2a39ed6cf8b06d3bf5.1585584498.git.tommyhebb@gmail.com>
X-Mailer: git-send-email 2.25.2
In-Reply-To: <cover.1585584498.git.tommyhebb@gmail.com>
References: <cover.1585584498.git.tommyhebb@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Kailang Yang <kailang@realtek.com>,
 Tomas Espeleta <tomas.espeleta@gmail.com>,
 Sergey Bostandzhyan <jin@mediatomb.cc>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Takashi Iwai <tiwai@suse.com>,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Hui Wang <hui.wang@canonical.com>, Thomas Hebb <tommyhebb@gmail.com>,
 Jian-Hong Pan <jian-hong@endlessm.com>,
 =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>
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

This change eliminates the update in alc256_init() and replaces it with
the 0x5757 write from alc_fill_eapd_coef(). Kailang says that 0x5757 is
supposed to be the codec's default value, so using it will make
debugging easier for Realtek.

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

Changes in v2:
- Change fixed value from 0x4727 to 0x5757, which should behave
  identically, on advice from Kailang.

 sound/pci/hda/patch_realtek.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 63e1a56f705b..9efb0a858c64 100644
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
+	alc_write_coef_idx(codec, 0x36, 0x5757);
 }
 
 static void alc256_shutup(struct hda_codec *codec)
-- 
2.25.2

