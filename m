Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 656804D3AF3
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Mar 2022 21:21:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E49A416EF;
	Wed,  9 Mar 2022 21:20:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E49A416EF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646857282;
	bh=AGSOQAaSUWdePTdzn7t9Pup5GHwyC4vjZA/iPq1mvs8=;
	h=Date:From:To:Subject:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=mmGBwsfxy2dT61T5dHK7PTMHRz4uLp98wbw1Nzfx146muECUqX7cxGi3lIkBMvzLF
	 Msx8mQqIxeoEX9SZ56dnb/eqJ2gZ7JfmEYWu/YEhec+vnIVhKnFXNEiY50z0PAMOC/
	 VdBNs1Jm+IB2R6vlvxh4KpSxZIhYCjbLvCvUbMNo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 78527F80155;
	Wed,  9 Mar 2022 21:20:15 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F133CF8016C; Wed,  9 Mar 2022 21:20:13 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE, 
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E6496F8012F
 for <alsa-devel@alsa-project.org>; Wed,  9 Mar 2022 21:20:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E6496F8012F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="MI5qZBza"
Received: by mail-ej1-x62c.google.com with SMTP id gb39so7603685ejc.1
 for <alsa-devel@alsa-project.org>; Wed, 09 Mar 2022 12:20:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:from:to:cc:content-language
 :subject:content-transfer-encoding;
 bh=RcTddA3HB76ItcVFPeiGto64Ir7EMxqM0hxFlC7rmpw=;
 b=MI5qZBzailiAhneHd4+OjDfYDa5Nt50+tH+00MSA3GrfwXhJL28OMJ6j3814I2/1qp
 u8fwt39gjpQfwXpb9EQsfrzMobuGx5/D22cJC/9tBOX4TgRQRs3yOnQA8WaPl49ZQ1NG
 TIy1JO+wnUGm/bFIAk3Kh/ZDeJ7OsA5jviuL0IRhunFjXowExptQk1VskTMWPmuhd3Ir
 Clpv+pkA2NEyziBcup6nV+eHIdp8iRg1CkgH6VHG9bh2czKY4NRxXJscFuF9iwJ2EzAz
 XYIWyhuVJ5PAnNUQaAI/OcByyw5WdD75kp9OE0mN7agz0qtEgOpMNa01gZSTcieu3wr4
 kXNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:from:to
 :cc:content-language:subject:content-transfer-encoding;
 bh=RcTddA3HB76ItcVFPeiGto64Ir7EMxqM0hxFlC7rmpw=;
 b=5sX4q/OVp8AbPNLseFJahdRjkj8an+x6Ft7/MZQLnylFWb7U4cPAbV5PPF9YM8s5Lk
 qTKD+7BkW+360G63rGL9wF2luhQa8AiwdqGzTOG9I4ox2KcnN5Ixy+wlNw9dLLCne7/w
 QBokDOI8EceiDX2YOXbHswYlze/MhKvRUHrg8RuIq1hTm5OlvDcJn9FtGRVzQOa/91LN
 +sZZi5i9oTDC7BMrXs8wdf/MmNcWgQExp9tLlTsV9UzsKL5nguFAsN50ceKtM0jvlcoI
 yoryJC/i//SIBUsc6nwV9s0yW2k2XeP3GWmW/zgfXe+hzrHCXG+wupQsqA6kNAMLY7lH
 6IHQ==
X-Gm-Message-State: AOAM533auwGz+LjrU95zpBLu/sJS2yiw2rAEpYtRySKWqivjfH5D5JEL
 vOXEfvB/iN5oHjXv35bxkXU=
X-Google-Smtp-Source: ABdhPJyyc4PFdseh+km03ErxkxgbvmAZ4sg5mReDbXoDuGBg9vDmkzkHCT6h3sZa4enqFieD0HBfKw==
X-Received: by 2002:a17:906:b6c7:b0:6db:2e14:875 with SMTP id
 ec7-20020a170906b6c700b006db2e140875mr1333017ejb.737.1646857206984; 
 Wed, 09 Mar 2022 12:20:06 -0800 (PST)
Received: from ?IPV6:2a01:c22:7793:600:9d6a:7788:3389:da6c?
 (dynamic-2a01-0c22-7793-0600-9d6a-7788-3389-da6c.c22.pool.telefonica.de.
 [2a01:c22:7793:600:9d6a:7788:3389:da6c])
 by smtp.googlemail.com with ESMTPSA id
 w15-20020a1709062f8f00b006cd545d4af6sm1115989eji.45.2022.03.09.12.20.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Mar 2022 12:20:06 -0800 (PST)
Message-ID: <51953618-79b6-0df7-2d28-d5dce4dc86c7@gmail.com>
Date: Wed, 9 Mar 2022 21:20:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Jerome Brunet <jbrunet@baylibre.com>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Kevin Hilman
 <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Content-Language: en-US
Subject: [PATCH v2 0/2] ASoC: meson: aiu: fix duplicate debugfs directory error
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 alsa-devel@alsa-project.org,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
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

On a S905W-based system I get the following error:
debugfs: Directory 'c1105400.audio-controller' with parent 'P230-Q200' already present!

Turned out that multiple components having the same name triggers this
error in soc_init_component_debugfs(). The proposed solution allows
other drivers to adopt the same approach with minimal effort.
With the patch the error is gone and that's the debugfs entries.

/sys/kernel/debug/asoc/P230-Q200/acodec:c1105400.audio-controller
/sys/kernel/debug/asoc/P230-Q200/hdmi:c1105400.audio-controller
/sys/kernel/debug/asoc/P230-Q200/cpu:c1105400.audio-controller

v2:
- Reworked approach based on [0]

[0] https://www.spinics.net/lists/arm-kernel/msg960881.html

Heiner Kallweit (2):
  ASoC: soc-core: add debugfs_prefix member to snd_soc_component_driver
  ASoC: meson: aiu: fix duplicate debugfs directory error

 include/sound/soc-component.h     | 4 ++++
 sound/soc/meson/aiu-acodec-ctrl.c | 3 +++
 sound/soc/meson/aiu-codec-ctrl.c  | 3 +++
 sound/soc/meson/aiu.c             | 3 +++
 sound/soc/soc-core.c              | 5 +++++
 5 files changed, 18 insertions(+)

-- 
2.35.1

