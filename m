Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5348D328284
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Mar 2021 16:31:44 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C7EBC16A6;
	Mon,  1 Mar 2021 16:30:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C7EBC16A6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614612703;
	bh=wJPsAnNSTfJFx0YveVJ94nbbzvANCU6bdbKmpeSCoQE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cUkDmfpb8ghfZkBx8IaXn+h5Wla6dxWcNdtD9qAAvw7tvaf8oplnjZpKItQ1Y32mK
	 d+vjSvbdSGYP7mmJiqjd2axsE7raB5VGRRNWtd8/0UBEt60O/LkjIzmT6kSRFIavzJ
	 olBAqpYNDRW4du1knM2LgFcTEALD6v1BfOC972zE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4947CF8042F;
	Mon,  1 Mar 2021 16:28:41 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6C8C7F8027D; Mon,  1 Mar 2021 16:28:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0514DF80150
 for <alsa-devel@alsa-project.org>; Mon,  1 Mar 2021 16:28:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0514DF80150
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="L5xxJGQr"
Received: by mail-wm1-x331.google.com with SMTP id k66so14935617wmf.1
 for <alsa-devel@alsa-project.org>; Mon, 01 Mar 2021 07:28:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tWMapBAvwS/onVXYHA6yVWqlynyNSsmib9BAxoMbLy4=;
 b=L5xxJGQr+EhL+7OieumjAUGKuxCzrXf7ykwfxFETSbeOyg0bBLJJik3gmQhq13ysX4
 Fcd2lT+mbwepokW9VJS2a53QWl0kGKv0Bb8w2UW78SyfIwnIS8fUjoDhwncAF/P+sTke
 UV3agPJOhP/Y0eaDwxm1gVxRyaMm/5HnGEOJ7VstpJeH6XPAiGaU4Leph8Zaxwjv4YOq
 6EO3L3q1xLhDw6YgSLLArw/A33Jr2OalLvu1oywAcL3D/GrJ9CH9oPE2n53Fu/9hbNmW
 DrzwMvvzgDLtAMgvcSkHlBDqfi+hRIuJoBMAP7ZXmRHvK/ZBdEG90qnSo3rfo4iFXd+K
 PXPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tWMapBAvwS/onVXYHA6yVWqlynyNSsmib9BAxoMbLy4=;
 b=XX8OGVN+7c/xhjlxX9A5CIh/AwzIwXMp47i7sWowtJIgTNQxzo64JQSSS1TEh6hPjq
 oo/fFMJeb7mP29Rrwzozjaz8iNcKrpwxfmww02g/xTaN+kchTAwkBXLqigN0l/tFfWQE
 eH08IWrjtYP0X7rBTTB6EetxQV+UQgiEGsrVb2J0gRsJZXeuAc2vfmfC9q+YAj+TCOxH
 IHfTEqGm6+F0QW4aFyxgBWmg1tqIdaUjdvQeLzc1aOa0ajD/nS1VUHltI7OlzRaxtnsS
 vJXNiW9Kg9St6mjBKRaS+lOzidLxkj8V3jCvSO9xbSxm3EAx4lAh2oeJdFqAZ7cZct6h
 GzVw==
X-Gm-Message-State: AOAM53181Q0jaUOjjzAHOS0ImMHK59mq0twpDv48XUcYT3YRC4lhcaLC
 yinOrjWgcDbi5XDwMQBy0no=
X-Google-Smtp-Source: ABdhPJxCJan5i2p1C0l50sI7PTD6qaFVPbqXWpQBQo+eGRWgq3cdMzwegifHsSb9mAKqGOYj4VmABA==
X-Received: by 2002:a7b:c353:: with SMTP id l19mr16462537wmj.147.1614612503018; 
 Mon, 01 Mar 2021 07:28:23 -0800 (PST)
Received: from localhost.localdomain (176-171-138-112.abo.bbox.fr.
 [176.171.138.112])
 by smtp.googlemail.com with ESMTPSA id c128sm201771wme.3.2021.03.01.07.28.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Mar 2021 07:28:22 -0800 (PST)
From: Nicolas MURE <nicolas.mure2019@gmail.com>
To: tiwai@suse.de
Subject: [PATCH v2 4/4] ASLA: usb-audio: fix Pioneer DJM-850 control label info
Date: Mon,  1 Mar 2021 16:27:29 +0100
Message-Id: <20210301152729.18094-5-nicolas.mure2019@gmail.com>
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

Unlike the other DJM, the value to set the "CD/LINE" and "LINE" capture
control options are inverted. This fix makes sure that the displayed
info label while using `alsamixer` matches the input switches label
on the DJM-850 mixer.

Signed-off-by: Nicolas MURE <nicolas.mure2019@gmail.com>
---
 sound/usb/mixer_quirks.c | 28 ++++++++++++++++++++++++----
 1 file changed, 24 insertions(+), 4 deletions(-)

diff --git a/sound/usb/mixer_quirks.c b/sound/usb/mixer_quirks.c
index b325b6597d91..5b77e8140ba6 100644
--- a/sound/usb/mixer_quirks.c
+++ b/sound/usb/mixer_quirks.c
@@ -2693,7 +2693,7 @@ static const char *snd_djm_get_label_caplevel(u16 wvalue)
 	}
 };
 
-static const char *snd_djm_get_label_cap(u16 wvalue)
+static const char *snd_djm_get_label_cap_common(u16 wvalue)
 {
 	switch (wvalue & 0x00ff) {
 	case SND_DJM_CAP_LINE:		return "Control Tone LINE";
@@ -2715,6 +2715,25 @@ static const char *snd_djm_get_label_cap(u16 wvalue)
 	}
 };
 
+// The DJM-850 has different values for CD/LINE and LINE capture
+// control options than the other DJM declared in this file.
+static const char *snd_djm_get_label_cap_850(u16 wvalue)
+{
+	switch (wvalue & 0x00ff) {
+	case 0x00:		return "Control Tone CD/LINE";
+	case 0x01:		return "Control Tone LINE";
+	default:		return snd_djm_get_label_cap_common(wvalue);
+	}
+};
+
+static const char *snd_djm_get_label_cap(u8 device_idx, u16 wvalue)
+{
+	switch (device_idx) {
+	case SND_DJM_850_IDX:		return snd_djm_get_label_cap_850(wvalue);
+	default:			return snd_djm_get_label_cap_common(wvalue);
+	}
+};
+
 static const char *snd_djm_get_label_pb(u16 wvalue)
 {
 	switch (wvalue & 0x00ff) {
@@ -2725,11 +2744,11 @@ static const char *snd_djm_get_label_pb(u16 wvalue)
 	}
 };
 
-static const char *snd_djm_get_label(u16 wvalue, u16 windex)
+static const char *snd_djm_get_label(u8 device_idx, u16 wvalue, u16 windex)
 {
 	switch (windex) {
 	case SND_DJM_WINDEX_CAPLVL:	return snd_djm_get_label_caplevel(wvalue);
-	case SND_DJM_WINDEX_CAP:	return snd_djm_get_label_cap(wvalue);
+	case SND_DJM_WINDEX_CAP:	return snd_djm_get_label_cap(device_idx, wvalue);
 	case SND_DJM_WINDEX_PB:		return snd_djm_get_label_pb(wvalue);
 	default:			return NULL;
 	}
@@ -2852,7 +2871,8 @@ static int snd_djm_controls_info(struct snd_kcontrol *kctl,
 	if (info->value.enumerated.item >= noptions)
 		info->value.enumerated.item = noptions - 1;
 
-	name = snd_djm_get_label(ctl->options[info->value.enumerated.item],
+	name = snd_djm_get_label(device_idx,
+				ctl->options[info->value.enumerated.item],
 				ctl->wIndex);
 	if (!name)
 		return -EINVAL;
-- 
2.29.2

