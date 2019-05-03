Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CD75D13600
	for <lists+alsa-devel@lfdr.de>; Sat,  4 May 2019 01:10:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4CB2E1829;
	Sat,  4 May 2019 01:09:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4CB2E1829
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1556925015;
	bh=Ly8ubOmVB0XK31U9CVbrYvKrANsn/iKr8xXnJ8T3J4M=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=n9FRrvprPPUynQrqXzddKnyqssUr67KLhdb2YDTG9VoMe2NkwyK0UiM3v5s7r3rHq
	 DNZjQzspb4kT/MTCucef8ECjOfH0I5uX+ttN8yIhM48d912F915pRtWTs05AJDBPDV
	 7Fo2RA5FcQRqr8QQjm/DN88DH4BXA76v0iH7TCGM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A3F9DF896CB;
	Sat,  4 May 2019 01:08:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1B375F896B7; Sat,  4 May 2019 01:08:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_PASS,T_DKIMWL_WL_HIGH autolearn=disabled version=3.4.0
Received: from mail-io1-xd43.google.com (mail-io1-xd43.google.com
 [IPv6:2607:f8b0:4864:20::d43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5234CF80722
 for <alsa-devel@alsa-project.org>; Sat,  4 May 2019 01:08:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5234CF80722
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="OZYMgYiB"
Received: by mail-io1-xd43.google.com with SMTP id u2so3070714ioc.4
 for <alsa-devel@alsa-project.org>; Fri, 03 May 2019 16:08:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vfwVmU13mIPCIYdpxEtGI/5zAfnwuEVr+axgRwt2aOs=;
 b=OZYMgYiBy48UTf9kHTJiQosCJNjGq0fvWxH/7gnknxnJFiiXIJ5gONsdgKuPxkAVSq
 xPreisZwcJu4rWUvqJJOTmZ5VPIKJInSKeHDuTXYSUKKjN9LJBmR4sCXvHdldSsXYPpN
 QzRNFHl43M7h9J0OkjNTqOjt/LgXyKK/Po1UU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vfwVmU13mIPCIYdpxEtGI/5zAfnwuEVr+axgRwt2aOs=;
 b=J3tRzaJAvOlIplDF40bmCoHk6FqYcWK6CGCaPeVW2i7Xchf4f8M1hETGIHxD5KtMlV
 hSmyI9j42KtuRhqUxNGGA72DmT7WPll7XPuO1MQx8WyikLhkvP0/6PD9PvZHH6VuWxVd
 sYNxFADRGeo4Dhf5PfpTB6/HojYF4UuhszwxMmAKIZYVo7KooiNo1lGGtiyoRbCZH6Xx
 F+mASbdtl/kxqNa0TYZsQzhRURp8AtI0u4drQY/5gj/yb0rb/O1h8xe1czdlzHTpsoNb
 NZ7vhk2oeY6+c8YboD3C361vwUH1aBbjv5+g41DoCd95eLJSGgbNPCeV6zvbUJo8/BYn
 uxFw==
X-Gm-Message-State: APjAAAW3EW1tA3vs0RTv+W3QlQI+ICv0ask/4xBJitDVONtIVfArbXz9
 Ogxua0suwSp+uyLuT8elWqehcQ==
X-Google-Smtp-Source: APXvYqx/gKRjRgj/rjW5FvDEYCIc+405bRHLorCdRdA0W/wjK5lkgiA44Z81EaN2VdwfcRuEpx3FEQ==
X-Received: by 2002:a5d:8cd1:: with SMTP id k17mr8580865iot.287.1556924903390; 
 Fri, 03 May 2019 16:08:23 -0700 (PDT)
Received: from localhost ([2620:15c:183:200:33ce:f5cf:f863:d3a6])
 by smtp.gmail.com with ESMTPSA id 19sm1651503itm.6.2019.05.03.16.08.21
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 03 May 2019 16:08:22 -0700 (PDT)
From: Fletcher Woodruff <fletcherw@chromium.org>
To: linux-kernel@vger.kernel.org
Date: Fri,  3 May 2019 17:07:48 -0600
Message-Id: <20190503230751.168403-1-fletcherw@chromium.org>
X-Mailer: git-send-email 2.21.0.1020.gf2820cf01a-goog
MIME-Version: 1.0
Cc: Oder Chiou <oder_chiou@realtek.com>, alsa-devel@alsa-project.org,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Fletcher Woodruff <fletcherw@chromium.org>
Subject: [alsa-devel] [PATCH v4 0/3] Fix jack detection for Chromebook Pixel
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Headphone/mic jack detection doesn't work on the Chromebook Pixel 2015.

This patch changes the irq implementation to support polarity flipping
and fixes the configuration code so that correct GPIO pins are read
from ACPI.

With this series, plugging and unplugging the headphone jack switches
between headphones and speakers automatically, and headset microphones 
are also detected.

v4:
  - Fix incorrect void* cast in rt5677_irq() 

v3:
  - Update commit message for patch 1/3 to clarify why we implement
    our own irq_chip.

v2:
  - Split IRQ change into two patches: adding and fixing potential race
  - Change config reading code to try both DT and ACPI style names

Ben Zhang (1):
  ASoC: rt5677: allow multiple interrupt sources

Fletcher Woodruff (2):
  ASoC: rt5677: handle concurrent interrupts
  ASoC: rt5677: fall back to DT prop names on error

 sound/soc/codecs/rt5677.c | 346 ++++++++++++++++++++++++++------------
 sound/soc/codecs/rt5677.h |  14 +-
 2 files changed, 256 insertions(+), 104 deletions(-)

-- 
2.21.0.1020.gf2820cf01a-goog

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
