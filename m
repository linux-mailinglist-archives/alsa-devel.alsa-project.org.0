Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E6566641B64
	for <lists+alsa-devel@lfdr.de>; Sun,  4 Dec 2022 08:53:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 858BA1746;
	Sun,  4 Dec 2022 08:52:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 858BA1746
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1670140423;
	bh=NKKmhmP/FcB4EEQwBs0jwdjU+pvAZui6Goo7Bv8cheo=;
	h=From:Date:Subject:To:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=bBXsRLMQhUuLiCmGihPGNuiQb1RoeFtsza9ycNOUBp74upuKcCku0zDsEDLi1hl+e
	 xmGXG5LueLzLaCoSFa1fpp73ASOiYktZ9n890AXFLj7FfRXOjkHoxyJjt/YOUlSXuB
	 V1xS2QgyKX5wwxMkKW1DhyAZFyqPREbsfjFtNn0E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8A530F8055B;
	Sun,  4 Dec 2022 08:52:29 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A40CFF80155; Sun,  4 Dec 2022 08:52:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=DATE_IN_PAST_96_XX,
 DKIM_SIGNED,DKIM_VALID,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS
 autolearn=disabled version=3.4.0
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [IPv6:2607:f8b0:4864:20::1029])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5C45DF80155
 for <alsa-devel@alsa-project.org>; Sun,  4 Dec 2022 08:52:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5C45DF80155
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=igorinstitute-com.20210112.gappssmtp.com
 header.i=@igorinstitute-com.20210112.gappssmtp.com header.b="Jw4FnLuJ"
Received: by mail-pj1-x1029.google.com with SMTP id
 t11-20020a17090a024b00b0021932afece4so12064659pje.5
 for <alsa-devel@alsa-project.org>; Sat, 03 Dec 2022 23:52:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=igorinstitute-com.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:date:from:message-id:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Iy74VsRO4WDPI6duqo1jqOxf/w5vgZYHdL8GT2SYMKg=;
 b=Jw4FnLuJ+jHl0BSAyl3TtY86/dftI5rnmt/qMEW1qO5gY8ZDQk3b57YXQQRFj5oUCz
 eAgTSCgK4/tmZfi5MGIHXtTlWKXF2GaH/Oxg2FUUm2dAMhP1nvrZ6QP9F/QA2ZaeuvWT
 pJu/mnQ3o/JPwRqtovDvZXGkSEIIRHlHFVT+p+8skpKD+5tvNAwX+IN4aNU407LjJh4B
 t7phY5mX+5UIcKWzxtuUUVDMQ1T0dsOouuihhxjqvET5Ecp/4186JcNWijIxk87kyWiv
 oaLo+RZ2grrBm0K8JibwpwX4TflORxUCM+w/O7s66w3qNDEZhawqTSWypR4dhLdMQzck
 5VKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:date:from:message-id:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Iy74VsRO4WDPI6duqo1jqOxf/w5vgZYHdL8GT2SYMKg=;
 b=kIlqZT9oeF8ld84rsjzJE30N3VukisBu8bao+P1Ad2kHudkfL/G0ptdslbBj7W6wBe
 QnysybJdPWPcyMTzl/4EhyhQ1ctYJ6vZ06gks7g9zcBhrQ3DR6cdcmmfya2R3F1UtRkH
 BLs0BHcE+XKtnQii5RTW7tXy0BXcTPwgXcY3fgCONOs2nCuVDbBj1ftn36A1anKqD61K
 YBbp5akCTwuhZZ1tHSz62ATI5nHyX8rnGBNzOm3uR02+5f8PcVgx17LFgwB/C6JAyoYp
 8Rawpk1UcmP+OH/vH+8V9rv3wQn8a5iS630+5u2kLL+msUPBH8C3UcVQiou8ECzNgT4Y
 2grw==
X-Gm-Message-State: ANoB5pl4jl29cXRr88cB9FsPbLs3ybs8OoRqS4Zuo2Eu2JNXokyhivOt
 vs5HXSEvwrWOcbBWM3tQGdM9Nw7fReHU6juK6as=
X-Google-Smtp-Source: AA0mqf4zSRaazgQAKjeUr6basv8jmHb6EMNYytiMvHs1gkkIZuSqDhopNiFXwoNfP1YQ/VQOsZt1Tg==
X-Received: by 2002:a17:902:9889:b0:186:5f82:3812 with SMTP id
 s9-20020a170902988900b001865f823812mr67403855plp.51.1670140339513; 
 Sat, 03 Dec 2022 23:52:19 -0800 (PST)
Received: from localhost ([121.99.145.49]) by smtp.gmail.com with ESMTPSA id
 fa13-20020a17090af0cd00b00218abadb6a8sm7160900pjb.49.2022.12.03.23.52.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 Dec 2022 23:52:18 -0800 (PST)
Message-ID: <638c51b2.170a0220.49853.d549@mx.google.com>
From: Daniel Beer <daniel.beer@igorinstitute.com>
Date: Thu, 27 Oct 2022 21:38:38 +1300
Subject: [PATCH v2 2/2] ASoC: tas5805m: add missing page switch.
To: alsa-devel@alsa-project.org
Cc: Andy Liu <andy-liu@ti.com>,
 Derek Simkowiak <derek.simkowiak@igorinstitute.com>,
 Mark Brown <broonie@kernel.org>, Daniel Beer <daniel.beer@igorinstitute.com>,
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

In tas5805m_refresh, we switch pages to update the DSP volume control,
but we need to switch back to page 0 before trying to alter the
soft-mute control. This latter page-switch was missing.

Fixes: ec45268467f4 ("ASoC: add support for TAS5805M digital amplifier")
Signed-off-by: Daniel Beer <daniel.beer@igorinstitute.com>
---
 sound/soc/codecs/tas5805m.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/soc/codecs/tas5805m.c b/sound/soc/codecs/tas5805m.c
index 6e2edf045446..4e38eb7acea1 100644
--- a/sound/soc/codecs/tas5805m.c
+++ b/sound/soc/codecs/tas5805m.c
@@ -203,6 +203,9 @@ static void tas5805m_refresh(struct tas5805m_priv *tas5805m)
 	set_dsp_scale(rm, 0x24, tas5805m->vol[0]);
 	set_dsp_scale(rm, 0x28, tas5805m->vol[1]);
 
+	regmap_write(rm, REG_PAGE, 0x00);
+	regmap_write(rm, REG_BOOK, 0x00);
+
 	/* Set/clear digital soft-mute */
 	regmap_write(rm, REG_DEVICE_CTRL_2,
 		(tas5805m->is_muted ? DCTRL2_MUTE : 0) |
-- 
2.38.1

