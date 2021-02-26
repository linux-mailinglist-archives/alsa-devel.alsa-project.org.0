Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E064327FD9
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Mar 2021 14:46:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 641C916B8;
	Mon,  1 Mar 2021 14:45:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 641C916B8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614606392;
	bh=wJPsAnNSTfJFx0YveVJ94nbbzvANCU6bdbKmpeSCoQE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=thZh1g3E7pq3TGigW/SkZvdng6rB9zk50QCJMkxvqPplqaWhisC6NXGiCgCRMw8k4
	 VgyYpT4CVTOdJIMvZ9+wNZ3L/mfQJXhF9Tg3r3agSgc8jacCHu7uyEQTziMC6JSw/g
	 8fUSFvH+GZlWuLwkn1wdObjnvw6kU8Bu9sjZXNwY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9D978F80510;
	Mon,  1 Mar 2021 14:43:47 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 576F7F8022D; Fri, 26 Feb 2021 14:35:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D843FF8022B
 for <alsa-devel@alsa-project.org>; Fri, 26 Feb 2021 14:35:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D843FF8022B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="bvr1S2Xc"
Received: by mail-wm1-x329.google.com with SMTP id k66so7829755wmf.1
 for <alsa-devel@alsa-project.org>; Fri, 26 Feb 2021 05:35:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tWMapBAvwS/onVXYHA6yVWqlynyNSsmib9BAxoMbLy4=;
 b=bvr1S2XcuNEEklXtyZST729YSdZS8xoqkYHTrcNMFnx6Zh7fAF4jP7LiOYO9q/5aI/
 2uBtGwTKsFkAkdf+w6Y/glXDCgTGLWCwx4f+Htyv+5/5RRdM0sk/9PZJLoqbYAZKK0zG
 WB5pPHtmCUs1NdNKkkt29HaxnzyTOjsX0eq6/OyPWfP0Emk47rYj2iFcaOOqfhPuYQlp
 J740kBCr3Lm7MJePA1AspQgRNAXOniB37XH1rbu+Effd+rsf/+ptHRFQs1ng51hyorrY
 pWnOr0wOaNWqROlMTVwa7G2g4FaoChFZbs/Gm+qJao6jkw/mUq1Am/ozEqbJqP6TuvdX
 4yuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tWMapBAvwS/onVXYHA6yVWqlynyNSsmib9BAxoMbLy4=;
 b=GtKyfy6eKY6OdxjL0pcygcYPqTx2rz9/rrZFlxXDBo3JJHsl7sYKxPl7OZ0iE1UDYI
 P8WR7UrcgGfs/46m4GiNjUltryeAuWJgb92ISZcYfWAGy2bDTciNsxcHwkDt9fQ/Xv9t
 6JmnaF+Q9u68Q5e9dBGZh1fQ1CtHI3K3J893gF4QTxxwOHMs4/t8QBKDsqVihFb+5gNG
 BEZxPHhywqy9tlX0xLWrpp3UZOWHXRIbFmt+cwsqjB5/fYpiy7WLUJVH0rIdaXd44xeX
 nwfz2MtVL3BhOrXbZGKMZwEsf7cNS1cu5VM1qy0Gvw2n7QJSDLdzPvLdCh4aZ4Qf/yWI
 yfIQ==
X-Gm-Message-State: AOAM530GrtZrhpKPuddFVTjz0Xk0pUNE7Mmi68J0z6sSw39OKLdkrUHt
 nwL3TU4Gayu6pzDTk9MSvMjSgSE/n6BWqoCB
X-Google-Smtp-Source: ABdhPJzAUho8i1xd8Gshp0xP9rh01Hm6s9Eu2Md3lYNp8WiJXASqFZ011f+eAfqOzy43UilTqF/mjg==
X-Received: by 2002:a05:600c:1149:: with SMTP id
 z9mr3040398wmz.28.1614346520974; 
 Fri, 26 Feb 2021 05:35:20 -0800 (PST)
Received: from localhost.localdomain (176-171-138-112.abo.bbox.fr.
 [176.171.138.112])
 by smtp.googlemail.com with ESMTPSA id c26sm13175547wrb.87.2021.02.26.05.35.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Feb 2021 05:35:20 -0800 (PST)
From: Nicolas MURE <nicolas.mure2019@gmail.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 4/4] ASLA: usb-audio: fix Pioneer DJM-850 control label info
Date: Fri, 26 Feb 2021 14:34:29 +0100
Message-Id: <20210226133429.20081-5-nicolas.mure2019@gmail.com>
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

