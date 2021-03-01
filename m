Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3738C328279
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Mar 2021 16:30:21 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4F36D16B2;
	Mon,  1 Mar 2021 16:29:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4F36D16B2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614612620;
	bh=1Ax2DhKkqjsMgUps1VuRPo/jNSkRd+eUR4D0moFT/F0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ru5om+jEzwC1cBXcgWcqg1IWzkT2io8fc2HBOO8LuRA5fAVgfixmr0kKmSHHmUm+u
	 jbbXDWVgM6lenIhD9v6kqig7jIRO+QsyOTuBDiekBRLHnivYCJ82YdrH6hThqO266u
	 SbtcifCG/UhNm/yKtm/fhaPkyDGDtGWTvCuEi+qQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D3768F802DF;
	Mon,  1 Mar 2021 16:28:38 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AF709F8026A; Mon,  1 Mar 2021 16:28:25 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DF81AF80257
 for <alsa-devel@alsa-project.org>; Mon,  1 Mar 2021 16:28:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DF81AF80257
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="cL+4HLYF"
Received: by mail-wr1-x42a.google.com with SMTP id b18so10102063wrn.6
 for <alsa-devel@alsa-project.org>; Mon, 01 Mar 2021 07:28:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WUqDR4v5OPuW6t4yKKokSERzll2nl96gEFjWU1KNhkc=;
 b=cL+4HLYF+r1aG9SmfNjP+FPrppERbBi7PW9mS7jt8i8jErHUjdudaFX6IUODH/lz6P
 UuX2oUw6HDN1GlFkD5RXSVHsBUG12xaSBHqvyx//juTk4udh6yvfIfB/EK/7zo3A7v7B
 MUp/FBLrvRrG2fv3HYCUGXXwPwlaX5dJn8HYsol6s+42Ntt4DNwe4Vyl6plCc9mPUs4i
 +aLiLZcCiith8Jy9Ze9NEhBW+LALjIUKsxJhcj6zKoxDm9BMhmgKL1ZCUhbTOpYJEIsk
 JbgztMHu39I9n6P1I/FEc9bHLkMsvn1BnKLcPL0B01pEvNFXqrq4DtqHNVCqj6eBqa4Z
 Ec0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WUqDR4v5OPuW6t4yKKokSERzll2nl96gEFjWU1KNhkc=;
 b=JOYMwYa3/HXQB1fJHZLEm7rP3H9oF7h81ff30Bdz245hMv9Diu93D00h3c+DMt9sRA
 W7er4CzRjpSIHQMD4tApRnLiv98i8LMHXZrWFhvmeHyHXQgKAp73SuUmN4XjKRta063D
 dZmKr/v40JRzcdd4DbNJ8+DejGdltuYrU9fnw4zCP/fWPHM+uYWktSQ4VkPqpSf4DyiB
 06BgQWQVNnpZ/5KGxNqDTzE0BhbslB3jWa3hcfWHC0f7qKJQ3fVEiyN2O8QcbTmjosYe
 kC7kv3Lgsbs5OveUBNoSsasSs+I8hDsb65sHByVKoqhizRsHIy/6FlHNym4refiU/SHt
 i5WA==
X-Gm-Message-State: AOAM532CQrfrkGSNmXoataCodaV6e75nH4BgZJNM30fFsO0nptHkVUD7
 tBlIHIb7vmNfqlWFb+Hwu5w=
X-Google-Smtp-Source: ABdhPJyna+xjIqBOKjN8/BeUAymVLYWyDdMR4DePfwxweG+6xp+763sPgCDAN6PqWIAUhYtOWZmrww==
X-Received: by 2002:a5d:5149:: with SMTP id u9mr17885769wrt.348.1614612500892; 
 Mon, 01 Mar 2021 07:28:20 -0800 (PST)
Received: from localhost.localdomain (176-171-138-112.abo.bbox.fr.
 [176.171.138.112])
 by smtp.googlemail.com with ESMTPSA id c128sm201771wme.3.2021.03.01.07.28.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Mar 2021 07:28:20 -0800 (PST)
From: Nicolas MURE <nicolas.mure2019@gmail.com>
To: tiwai@suse.de
Subject: [PATCH v2 2/4] ASLA: usb-audio: Declare Pioneer DJM-850 mixer controls
Date: Mon,  1 Mar 2021 16:27:27 +0100
Message-Id: <20210301152729.18094-3-nicolas.mure2019@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210301152729.18094-1-nicolas.mure2019@gmail.com>
References: <s5hv9abht6w.wl-tiwai@suse.de>
 <20210301152729.18094-1-nicolas.mure2019@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Nicolas MURE <nicolas.mure2019@gmail.com>, alsa-devel@alsa-project.org,
 livvy@base.nu
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

Declare audio capture controls to choose the audio source, and also to
set the capture level (in dB).

See https://github.com/nm2107/Pioneer-DJM-850-driver-reverse-engineering/blob/172fb9a61055960c88c67b7c416fe5bf3609807b/doc/windows-djm-850-setting-utility/mixer-output-tab/README.md

Signed-off-by: Nicolas MURE <nicolas.mure2019@gmail.com>
---
 sound/usb/mixer_quirks.c | 32 +++++++++++++++++++++++++++++---
 1 file changed, 29 insertions(+), 3 deletions(-)

diff --git a/sound/usb/mixer_quirks.c b/sound/usb/mixer_quirks.c
index 08873d2afe4d..b325b6597d91 100644
--- a/sound/usb/mixer_quirks.c
+++ b/sound/usb/mixer_quirks.c
@@ -2649,9 +2649,11 @@ static int snd_bbfpro_controls_create(struct usb_mixer_interface *mixer)
 #define SND_DJM_DEVICE_SHIFT	24
 
 // device table index
+// used for the snd_djm_devices table, so please update accordingly
 #define SND_DJM_250MK2_IDX	0x0
 #define SND_DJM_750_IDX		0x1
-#define SND_DJM_900NXS2_IDX	0x2
+#define SND_DJM_850_IDX		0x2
+#define SND_DJM_900NXS2_IDX	0x3
 
 
 #define SND_DJM_CTL(_name, suffix, _default_value, _windex) { \
@@ -2733,11 +2735,12 @@ static const char *snd_djm_get_label(u16 wvalue, u16 windex)
 	}
 };
 
-
-// DJM-250MK2
+// common DJM capture level option values
 static const u16 snd_djm_opts_cap_level[] = {
 	0x0000, 0x0100, 0x0200, 0x0300 };
 
+
+// DJM-250MK2
 static const u16 snd_djm_opts_250mk2_cap1[] = {
 	0x0103, 0x0100, 0x0106, 0x0107, 0x0108, 0x0109, 0x010d, 0x010a };
 
@@ -2781,6 +2784,25 @@ static const struct snd_djm_ctl snd_djm_ctls_750[] = {
 };
 
 
+// DJM-850
+static const u16 snd_djm_opts_850_cap1[] = {
+	0x0100, 0x0103, 0x0106, 0x0107, 0x0108, 0x0109, 0x010a, 0x010f };
+static const u16 snd_djm_opts_850_cap2[] = {
+	0x0200, 0x0201, 0x0206, 0x0207, 0x0208, 0x0209, 0x020a, 0x020f };
+static const u16 snd_djm_opts_850_cap3[] = {
+	0x0300, 0x0301, 0x0306, 0x0307, 0x0308, 0x0309, 0x030a, 0x030f };
+static const u16 snd_djm_opts_850_cap4[] = {
+	0x0400, 0x0403, 0x0406, 0x0407, 0x0408, 0x0409, 0x040a, 0x040f };
+
+static const struct snd_djm_ctl snd_djm_ctls_850[] = {
+	SND_DJM_CTL("Capture Level", cap_level, 0, SND_DJM_WINDEX_CAPLVL),
+	SND_DJM_CTL("Ch1 Input",   850_cap1, 1, SND_DJM_WINDEX_CAP),
+	SND_DJM_CTL("Ch2 Input",   850_cap2, 0, SND_DJM_WINDEX_CAP),
+	SND_DJM_CTL("Ch3 Input",   850_cap3, 0, SND_DJM_WINDEX_CAP),
+	SND_DJM_CTL("Ch4 Input",   850_cap4, 1, SND_DJM_WINDEX_CAP)
+};
+
+
 // DJM-900NXS2
 static const u16 snd_djm_opts_900nxs2_cap1[] = {
 	0x0100, 0x0102, 0x0103, 0x0106, 0x0107, 0x0108, 0x0109, 0x010a };
@@ -2806,6 +2828,7 @@ static const struct snd_djm_ctl snd_djm_ctls_900nxs2[] = {
 static const struct snd_djm_device snd_djm_devices[] = {
 	SND_DJM_DEVICE(250mk2),
 	SND_DJM_DEVICE(750),
+	SND_DJM_DEVICE(850),
 	SND_DJM_DEVICE(900nxs2)
 };
 
@@ -3045,6 +3068,9 @@ int snd_usb_mixer_apply_create_quirk(struct usb_mixer_interface *mixer)
 	case USB_ID(0x08e4, 0x017f): /* Pioneer DJ DJM-750 */
 		err = snd_djm_controls_create(mixer, SND_DJM_750_IDX);
 		break;
+	case USB_ID(0x08e4, 0x0163): /* Pioneer DJ DJM-850 */
+		err = snd_djm_controls_create(mixer, SND_DJM_850_IDX);
+		break;
 	case USB_ID(0x2b73, 0x000a): /* Pioneer DJ DJM-900NXS2 */
 		err = snd_djm_controls_create(mixer, SND_DJM_900NXS2_IDX);
 		break;
-- 
2.29.2

