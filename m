Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A96ED327FE4
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Mar 2021 14:47:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3B94D16A4;
	Mon,  1 Mar 2021 14:47:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3B94D16A4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614606474;
	bh=gro99E0owKf/xGuQ6O64WikhWUc5+Lw72LCTwxpAwec=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=uwcwfl5RA8g84QPb37tn66fo2A2EYg3gMN6WmVd9sCZCL1Qq+XR7NafI3IgN0FGmI
	 mT6G8Ern0c7aj+Q21Q3131dDJr/p87FD/bDVJvplP5Bntd8S46BzZaqip2UUBq3mTe
	 zzKAoKiTy/JhUhppulkJbXPwUbreJBPWnuVKokAc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 43BFBF80524;
	Mon,  1 Mar 2021 14:43:49 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A9FCFF80161; Fri, 26 Feb 2021 14:35:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE, URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 367B4F8016C
 for <alsa-devel@alsa-project.org>; Fri, 26 Feb 2021 14:35:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 367B4F8016C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="LjzPFPiI"
Received: by mail-wr1-x434.google.com with SMTP id f12so4802906wrx.8
 for <alsa-devel@alsa-project.org>; Fri, 26 Feb 2021 05:35:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rk6bLCh8nc+NuZmX5ZCcY8DZ9W3U1ZFuulXl6O69h10=;
 b=LjzPFPiIZWsZKQqAL1Aqo/xGItIsf3caNfurvyRlHSyfVIt0E9Vwim/Z6LAaUROjJW
 1rY7YhAYHrf2FuiPnTpjrldmidkjZyfVr9zlkLRgaqY8XUPE/waLrBby3zuiIn2Sfr1F
 FsZm4XLeVHCZGYQuOw+eDDwHBgmD0Sj6NAwLMr8lOSLSTIOIFROJEKhp+q6Q2fGT9XDr
 MNuMVCS544tyiKTV1DyTnBrgul7smQN5khwbsqz1bt9lRa5mdl8ZOJ/Gk6w4EZV9QtY2
 edRKYavDPRLeZFluJFlABfZKmBKxBXI6uzIltLbFCsT965wKrs+PKR/4lnByjFlMtYoi
 ISmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rk6bLCh8nc+NuZmX5ZCcY8DZ9W3U1ZFuulXl6O69h10=;
 b=Y0Ow9TKsrdWM+RYsAJVxaiPewLRgi6MeTuUQTjIGYwB31pH8AhweHXbGkHTjJEoLX+
 HTKStwozVCTjCwKOYHlSmqD/49G7bEXGhw9KEdQMorL8VnJan9HxNa9/1tnMMztOMmfW
 sQruUifRgraj7JIk2Bg1arTrFmZZAr411W/M4WhqqpJxD7lMsW2bikiFe4EgsxzBWf5n
 Ykq6e75S9hT73iYibYBV8/oYJ6X7j6zOoAVx9p6VOHu3Rl1zB+xRNP8P/y80hZIn6Toi
 hSxV0PHHLb/2gaIHcbVu0dilMkeCOg7SeG1zz1FUmkLUb1/23ZIWeIUeFMjUOwPTGfCA
 53mA==
X-Gm-Message-State: AOAM533fUn11vivU4HciZNQxmy4U0O10z5G9geYGOPMcZXEN6MqRQJtG
 0Y3jq12CqmI/Fdc8SVzVKMsY0lxLoo0fmq22
X-Google-Smtp-Source: ABdhPJzLjYEjfYfE2R4rt8LAT6lafeN0e6eaNXl3faey3kXeD8u2OGAVeQY7DIFwnpzwfIPM2kfMew==
X-Received: by 2002:adf:9b82:: with SMTP id d2mr3305521wrc.193.1614346519729; 
 Fri, 26 Feb 2021 05:35:19 -0800 (PST)
Received: from localhost.localdomain (176-171-138-112.abo.bbox.fr.
 [176.171.138.112])
 by smtp.googlemail.com with ESMTPSA id c26sm13175547wrb.87.2021.02.26.05.35.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Feb 2021 05:35:19 -0800 (PST)
From: Nicolas MURE <nicolas.mure2019@gmail.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 2/4] ASLA: usb-audio: Declare Pioneer DJM-850 mixer controls
Date: Fri, 26 Feb 2021 14:34:27 +0100
Message-Id: <20210226133429.20081-3-nicolas.mure2019@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210226133429.20081-1-nicolas.mure2019@gmail.com>
References: <20210226133429.20081-1-nicolas.mure2019@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 01 Mar 2021 14:43:22 +0100
Cc: Nicolas MURE <nicolas.mure2019@gmail.com>, livvy@base.nu
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

See https://github.com/nm2107/Pioneer-DJM-850-driver-reverse-engineering
    /blob/172fb9a61055960c88c67b7c416fe5bf3609807b
    /doc/windows-djm-850-setting-utility/mixer-output-tab/README.md

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

