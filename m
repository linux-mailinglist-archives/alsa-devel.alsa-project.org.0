Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DA6642459B1
	for <lists+alsa-devel@lfdr.de>; Sun, 16 Aug 2020 23:30:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7B152166D;
	Sun, 16 Aug 2020 23:29:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7B152166D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597613431;
	bh=CeoVquTo/p1MU/kTkbWTt0SJWWaLvfPjJGJi0o3w9dk=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=H4FAhllVvOD6ft9qW+iwpngPxYlfRwwuasJyran+TudNEbwj1dL0hHNrMd6nLVhoX
	 l8ATrS1/5KiZfP25GThgiCU+n1HvcXrv2DXXBNiMrHF6FcmWIn+2MsUYiKSz/02fIZ
	 e9zS6T+i61qdBkgd5qPEA4JIUj880Ki3AtygJVfQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A9687F8023F;
	Sun, 16 Aug 2020 23:28:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 726A2F8023F; Sun, 16 Aug 2020 23:28:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,PRX_BODY_30,
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com
 [IPv6:2607:f8b0:4864:20::1043])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6E208F800C8;
 Sun, 16 Aug 2020 23:28:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6E208F800C8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="JiLMERer"
Received: by mail-pj1-x1043.google.com with SMTP id d4so6709140pjx.5;
 Sun, 16 Aug 2020 14:28:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:from:to:cc:subject:date:mime-version
 :content-transfer-encoding;
 bh=mgkFW6jFq8Tydynstzc36k+aCHcNKOspems5hh8+6Es=;
 b=JiLMERerST8V0uflWRE1pabnKZ0Slqr2iey1nGKXaXSApSlWx0mJNT2S9mQDsPC6WI
 tL8EIUtd8fZu/v7Kqhd3DN2UGaP5LJ3QjcT6rTA/O9PYQW/h4Lec/gQ6y2RPZ6i9zgqT
 okssmu1+w0g3Lxjuvwf5uQjSglTTEY0sYxTu5VlmCwtkkQa5QHXLlAIwxuOCg/iAB4n6
 Bbne/6TeBvaCYf8lip7qzJdrLLnhoCwkRCK4IW3Wg4r/SHLgtHUoP4e1AUJYwcTuvZ8R
 Ul+gqhLxTB9GXRclACdarKiCR4mx/mmx7TXxZKaO3Q1zyTMp8ijdnJ173ubpHWaU25Wg
 IUAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:from:to:cc:subject:date:mime-version
 :content-transfer-encoding;
 bh=mgkFW6jFq8Tydynstzc36k+aCHcNKOspems5hh8+6Es=;
 b=M4uTkFPbVhYOXzmp++mIamUA1E+B/dK17wwsOfp88OcFdcSO7LlnBRlsTCiUkTw5Nk
 EfpOVAQpCRp9ACZAbyUGw2VBlbm6ltD0HYja+2VVDAOrLZrXcqczoRGmyjIa3yGxOO65
 7LbcBpuMXwejTrg4leG9blidrXFt2S4vL7xPSP+vkQtb5lL6jdyXyjp19M8zwB/BAu8F
 DBXgbAgg0shxJYS3aJrLb5yZJs1EkYWhafnEPqyzJf6QtFpgJX4pA7gGEZBZjFibU30l
 Af8VnpUyov+uosmUaW/gFN+qHeC2gsusOmLdw0k7F7ycoBX5MMHcVqWUMghJbSpzoS0q
 V0Gw==
X-Gm-Message-State: AOAM531RZvgnZql+saJsDotcp202i81RJWLuqmIkjS3hGWcXXAp1O2Tm
 IYAkG2a2U6dXuHXyehAmtg7vzL6Dbao=
X-Google-Smtp-Source: ABdhPJxVMoxVBCrnU7Bwrr+zVXI6303FlGIrfU4YI87WijU63skUUFiUAddzQ7guEBG+SO3KtPdFJw==
X-Received: by 2002:a17:90a:c291:: with SMTP id
 f17mr10290935pjt.92.1597613314882; 
 Sun, 16 Aug 2020 14:28:34 -0700 (PDT)
Received: from localhost.localdomain ([161.81.62.213])
 by smtp.gmail.com with ESMTPSA id x6sm16569278pfd.53.2020.08.16.14.28.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 Aug 2020 14:28:34 -0700 (PDT)
Message-ID: <5f39a502.1c69fb81.e7174.8615@mx.google.com>
X-Google-Original-Message-ID: <20200816212811.6446-1-me>
From: tom.ty89@gmail.com
X-Google-Original-From: me
To: patch@alsa-project.org
Subject: [PATCH] ALSA: usb-audio: ignore broken processing/extension unit
Date: Mon, 17 Aug 2020 05:28:11 +0800
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

