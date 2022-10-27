Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FA2368AC6B
	for <lists+alsa-devel@lfdr.de>; Sat,  4 Feb 2023 22:03:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 733F27F1;
	Sat,  4 Feb 2023 22:02:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 733F27F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675544620;
	bh=NKKmhmP/FcB4EEQwBs0jwdjU+pvAZui6Goo7Bv8cheo=;
	h=In-Reply-To:References:From:Date:Subject:To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=CWU2Xa0pgSsDzkExYzw7D5KibL1QzMCq4AOw/2GnZtDpoOWdjk6d/KketnP5Fqs/V
	 WBU75KcndPtm/WEwrTC1K1hI31eSxM12rOTrRc+R2286TUxpBoBOvlVHX5uykoEp7m
	 K33kQYZiC2E6/xDGxkjLpPOjVItR497BaROIYMmk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 96E71F804E0;
	Sat,  4 Feb 2023 22:02:40 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0EE4CF804DF; Sat,  4 Feb 2023 22:02:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.1 required=5.0 tests=DATE_IN_PAST_96_XX, DKIM_SIGNED,
 DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE shortcircuit=no
 autolearn=no autolearn_force=no version=3.4.6
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com
 [IPv6:2607:f8b0:4864:20::533])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B61C1F80162
 for <alsa-devel@alsa-project.org>; Sat,  4 Feb 2023 22:02:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B61C1F80162
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=igorinstitute-com.20210112.gappssmtp.com
 header.i=@igorinstitute-com.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=3w2YiAyN
Received: by mail-pg1-x533.google.com with SMTP id 143so5858815pgg.6
 for <alsa-devel@alsa-project.org>; Sat, 04 Feb 2023 13:02:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=igorinstitute-com.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:date:from:references:in-reply-to:message-id:from:to
 :cc:subject:date:message-id:reply-to;
 bh=Iy74VsRO4WDPI6duqo1jqOxf/w5vgZYHdL8GT2SYMKg=;
 b=3w2YiAyNJtEQDGuv+q7PteQbxAc90iPxEhXnUrO3pypsg9+j3VEF6mDjcBvK2d6wcS
 HIA47XOx8JQMCuEL9QMqJ6ePxyG6xNYxnP6Ua5JnkAMN2wiu+gUpM+ZThpofkVWVfAlj
 T7RepGAQshvpe0Q59PUc5VTkj08UpWL71psGPVyphDalykOLecEuf+dN+mkjzPgvMyT0
 dTroAiVxWHhwN+qDjQzIdL7wAyfGoI3xNZ6w6gGOesYEgD+RNS+YpVorOx1SH+fOeBVH
 vbi4W0huTNQ4wLDgJsHnjsgY+aPSfXYhBT9yWQfwmkZCNighdfNn+seKdpZvO39nN+8U
 K7Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:date:from:references:in-reply-to:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Iy74VsRO4WDPI6duqo1jqOxf/w5vgZYHdL8GT2SYMKg=;
 b=XDmGEWXTmWnVv+ftGg6SjdjEqp/LVdZpn58YZAuAlSrCaw0xh7pC/Dr0tV33A0E5M4
 eD9xLJmq00+Pce++HlwCUrryqW5qsjqTRw4Pen50W+ewN3g3d+KXQpdAxvXIQGgOPQ1U
 5emZiOJRiIFIcxPECtHwBSLf1tSr52cEV8ZDvWYb++lp1d/9ULwuXZSnv9fq2GGNs8AP
 ajeiWM5EQjwkfDhd15ar5vkpaU8k0hBqB8vKgTUpA+JA1PW1WhTV+rYSPYJxjB3oANWY
 QCWs56uI3XA1v2OGsOt+RaL2wx6Mta1i/d4luqnt7oed6FFaUgV2SR4kN6bLyZ4r1cmC
 gdiA==
X-Gm-Message-State: AO0yUKVwPm05OWphTPS+xK+dBgTMXKS5jggXbXxmuqtEG6tkprxDAhUh
 FXITrBrUpQwLVoe4cmtS6ee5RFWWJbP1ns2y
X-Google-Smtp-Source: AK7set/RHBlFpv8T3OLVL5wC59M32m9IYL76JHfQskGRevwysuhNbGGfCrdmUEkCXh5ukykwH4hIhQ==
X-Received: by 2002:a05:6a00:c87:b0:593:af2e:b872 with SMTP id
 a7-20020a056a000c8700b00593af2eb872mr17898882pfv.2.1675544530517; 
 Sat, 04 Feb 2023 13:02:10 -0800 (PST)
Received: from localhost ([121.99.145.49]) by smtp.gmail.com with ESMTPSA id
 h30-20020a056a00001e00b0058bbaa5200dsm4106116pfk.214.2023.02.04.13.02.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Feb 2023 13:02:10 -0800 (PST)
Message-Id: <1fea38a71ea6ab0225d19ab28d1fa12828d762d0.1675497326.git.daniel.beer@igorinstitute.com>
In-Reply-To: <cover.1675497326.git.daniel.beer@igorinstitute.com>
References: <cover.1675497326.git.daniel.beer@igorinstitute.com>
From: Daniel Beer <daniel.beer@igorinstitute.com>
Date: Thu, 27 Oct 2022 21:38:38 +1300
Subject: [PATCH v3 2/2] ASoC: tas5805m: add missing page switch.
To: alsa-devel@alsa-project.org
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: Andy Liu <andy-liu@ti.com>, Mark Brown <broonie@kernel.org>,
 Daniel Beer <daniel.beer@igorinstitute.com>, linux-kernel@vger.kernel.org
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

