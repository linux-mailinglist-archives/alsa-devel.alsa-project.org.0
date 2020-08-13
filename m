Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 34E3D2439A9
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Aug 2020 14:14:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B44231669;
	Thu, 13 Aug 2020 14:13:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B44231669
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597320872;
	bh=CeoVquTo/p1MU/kTkbWTt0SJWWaLvfPjJGJi0o3w9dk=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=m9MyfD3CK24fL8BnWxdPuI9N5c9vCWyTGMUoYVRhbtdMT5Pg1Rs9FqPB9FRhIo+8t
	 Gt9JUGPH6isepm7hi7Q0BdPa/+jUJt3mpEyXudgKplYqfWvqAILE8F5SzOfW/fGxTu
	 1q48NxgUO8PcDtj13MB3kKNRfiTmSqF6v4SN/b64=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EEE21F80161;
	Thu, 13 Aug 2020 14:12:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3B6DEF8015B; Thu, 13 Aug 2020 14:12:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,PRX_BODY_30,
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 546B1F80100;
 Thu, 13 Aug 2020 14:12:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 546B1F80100
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="jj89sDJ/"
Received: by mail-pl1-x644.google.com with SMTP id g7so1408294plq.1;
 Thu, 13 Aug 2020 05:12:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:from:to:cc:subject:date:mime-version
 :content-transfer-encoding;
 bh=mgkFW6jFq8Tydynstzc36k+aCHcNKOspems5hh8+6Es=;
 b=jj89sDJ/4aCwRpG9YMO3vXD5OVg+w7jV8YOCV1SEcWv8iTSXZW+++23mdoy5wdZN60
 UJAGsydMpnHbruaIFVO/NcUoET/AgZ5DVK2eQPLb4viUjlv3uH4ZP2ACxw8WrSzw5u63
 xbWNsMiQWUSzwHc4b1sOlCXd87vLbcrzT60DRMcbO+JthoLEryZVdZGBUVeReSBuuK5V
 edRZIpjigVDj9ZBuKlgT+VsSq9+FFrzDxBNsdnN1QVTEv1jbI2Ibpl6O1EhsLrNmT37H
 Pf5ZeO7N0kULHX8y8sab7euhkbMxDzWXPxGp560npV/S/piH60oJg4UX+Wo3T6EG7XTV
 OgjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:from:to:cc:subject:date:mime-version
 :content-transfer-encoding;
 bh=mgkFW6jFq8Tydynstzc36k+aCHcNKOspems5hh8+6Es=;
 b=o4VW4f9gwNRwsoUh1HkEfc4nygwWTpvlOdsmtcnVNVz6CPWtyA+VnvTzaTQJmJIKuu
 HfDvQgXkHnMEATqbuBGEkDmZWutS+0I4DdXq5vTWwpkpP7FH/p45SDmSNYHEopqN7zgk
 IRwAyUkJXZPQ07dNsUJT4+FY8cBGXWty+/4xQzVM+Im5ZnadUlv/0nxh72rF+C1zcdt8
 M/GLtn/njyYHrYSovTOj0ebO+0wNKpbN4Ea848BUFc6J4bm0qb9NYNk2ZCFiEWT7xBWO
 Gk8TOKjqhz8xBPp0o0jDnnpEHDrD3LvbgM4EZHztvv+PILsd91xj9vJb5WFQ9OH/tb4a
 Itcw==
X-Gm-Message-State: AOAM533fDlmo11Da7+8/dB+cdsBTFw5ed67kgRpTRJSYKMaxr3V8hpe6
 uhTSGinYqiTg9BC4Oq+icmD5CpvA
X-Google-Smtp-Source: ABdhPJxJv35KO/5XDOwC9pomiVsw1mH7jIEToGRKewi1ILhaN1WekA0mVvoumUznPpU2Hne31NTUsA==
X-Received: by 2002:a17:902:8ec8:: with SMTP id
 x8mr3620088plo.217.1597320753799; 
 Thu, 13 Aug 2020 05:12:33 -0700 (PDT)
Received: from localhost.localdomain ([161.81.53.21])
 by smtp.gmail.com with ESMTPSA id u191sm5070534pgu.56.2020.08.13.05.12.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Aug 2020 05:12:33 -0700 (PDT)
Message-ID: <5f352e31.1c69fb81.58613.b97d@mx.google.com>
X-Google-Original-Message-ID: <20200813121224.3312-1-me>
From: tom.ty89@gmail.com
X-Google-Original-From: me
To: patch@alsa-project.org
Subject: [PATCH] ALSA: usb-audio: ignore broken processing/extension unit
Date: Thu, 13 Aug 2020 20:12:24 +0800
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

