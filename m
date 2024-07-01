Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 64E4F91D87C
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Jul 2024 09:03:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D3BBF22AE;
	Mon,  1 Jul 2024 09:03:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D3BBF22AE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1719817405;
	bh=cBYvlD+uGm4bJQ4B0yh+wG+da72WDtr4bU+1bwuff10=;
	h=From:Subject:Date:To:Cc:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=sjFp2bFt5jc6KJnw/fki0bRtUgtapnewdeU/C/LHqd2X55yfECtMa2fAIQRLlzX0N
	 fbEElPAl8dBB9SAsUWmItd0ZOUeThYzIEyP9q7xNlPNx2pYAutjpyTJwp6UPvjYl9M
	 Zj8dcIVbidGMYnM1xBxdAjPIqFjptf1klnJtngvY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 86D48F805AE; Mon,  1 Jul 2024 09:02:53 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0ABF5F80587;
	Mon,  1 Jul 2024 09:02:53 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 66697F804D6; Mon,  1 Jul 2024 09:02:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E3CF7F8003A
	for <alsa-devel@alsa-project.org>; Mon,  1 Jul 2024 09:02:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E3CF7F8003A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=cjm7kaYF
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-57d106e69a2so2809182a12.0
        for <alsa-devel@alsa-project.org>;
 Mon, 01 Jul 2024 00:02:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719817356; x=1720422156;
 darn=alsa-project.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BNxRkokndQgS6PANhpBf3Erk5CI3oT2TsBCHeOpBCbw=;
        b=cjm7kaYFYKwL3sY26vbJ9jqTWsiWCBpDpwGcTPKmiBtYVVzh7dOA+3Hwoyf/DBoxE+
         55ogo3KallMO2HBnK5FPA0DVOTAfKx0v9FNPnR+y1CH86+Nlr0tuSfLNAKAMc/FPWfEm
         4Z8yWfWpEe4pBab7z6V2KHa+0NdwKuMpNWzqTUYPTkS5Bbu7tf4/iId5fBP0IBmhcdNq
         f3zs0ajTEdG8IjS4+0m3CbZzeL1Ws1UknV4akAjNFkNcIhnT9Xb1U5WoKiMWn73NAirv
         nZLubeWFuQz2a03U/a4Jba7O0bp7v27CU93sDn0Vi2BZ/XuDwGnouMG8r4nIjC4SDBDT
         ezgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719817356; x=1720422156;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BNxRkokndQgS6PANhpBf3Erk5CI3oT2TsBCHeOpBCbw=;
        b=Nh2+xRXx0Kb5CtCgj+jBaSKrxIUJCwHBgKiNlk2KKF3PKo1IB6+waqewIoheTwHGU2
         3PXsT5tT0+kQDeO11Z2hhfbR0dQqDHjbwcMUHbwCbbAcpvULuXnSnOkZ/XcUlGhIxyT/
         tjTtIjtVaEOuuohlaPztvLilwbXc/EF/MyVQdg6JLlrjPNVUWWD5RqW8fP+p4fZuiT36
         ZApVjGExpN+VOykj6XEwU6xItwTfPUHfEpKt5SwPgX9arTXVI6t2Uh4iBj4Ajv8Gw3lV
         fOivJ8I2m/ZnNsAtiCyfg4mfutpARfjFfAaOS7OqziiEv0Y8rCpIzdU+zzL54Saqws3+
         lRnQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXww/6h9sizubYE6dl+5hTC/R50kfBM62RGa1QGZi8QOe6Q5/9KoVUqkrWh0PFjcBWw6K/IWzAIT3MqdlSWhr/HL+0VuSIagUT2j/A=
X-Gm-Message-State: AOJu0YzHYcsn5qi/L+TGrBd287SebXwUjAGCEGCeQItFYhj2p4T/SfWp
	4OEKaVs1tGCxFmp+MtPKDPJ/Fomarqac0oumuCGUZJEbXjKw9ZM4p7GLGoWDRxs=
X-Google-Smtp-Source: 
 AGHT+IFNhztsKQspA93PM83poO4cdAZw8JWQkG10BqzhYODnEj8VuZNhOj6/m2oKwI+kNWX5P2Ac9w==
X-Received: by 2002:a05:6402:26c8:b0:584:21eb:7688 with SMTP id
 4fb4d7f45d1cf-5865d47375fmr7232268a12.14.1719817334068;
        Mon, 01 Jul 2024 00:02:14 -0700 (PDT)
Received: from lino.lan ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5861324f036sm4034383a12.34.2024.07.01.00.02.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jul 2024 00:02:13 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 0/4] ASoC: tas*: Fix up GPIO usage
Date: Mon, 01 Jul 2024 09:02:11 +0200
Message-Id: <20240701-asoc-tas-gpios-v1-0-d69ec5d79939@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHNUgmYC/x3MPQqAMAxA4auUzAZS8Q+vIg6ljZrFlkZEkN7d4
 vgN772gnIUVZvNC5ltU4llhGwP+cOfOKKEaWmo7Gsmi0+jxcop7kqjYe+ptmCiMwwQ1Spk3ef7
 hspbyAUdqO69gAAAA
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
 Baojun Xu <baojun.xu@ti.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 Shenghao Ding <13916275206@139.com>, alsa-devel@alsa-project.org,
 Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.14.0
Message-ID-Hash: FZFFSAOW2CNNGQQRIBVEUSVVIK4T43HR
X-Message-ID-Hash: FZFFSAOW2CNNGQQRIBVEUSVVIK4T43HR
X-MailFrom: linus.walleij@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FZFFSAOW2CNNGQQRIBVEUSVVIK4T43HR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The TI TAS drivers use some legacy GPIO code and headers,
this series fixes it up.

The TAS2781 is a special case since it adds a handful of
lines of deviating code to reconfigure a GPIO line for
IRQ mode and then never actually use the IRQ obtained in
the code. Is the line used by autonomous hardware? I'm
puzzled by this.

Anyways the patch suggest how to solve this properly by
fixing the parent irqchip and I'm happy to help.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
Linus Walleij (4):
      ASoC: tas5086: Convert to GPIO descriptors
      ASoC: tas2781-i2c: Drop weird GPIO code
      ASoC: tas2781-i2c: Get the right GPIO line
      ASoC: tas*: Drop unused GPIO includes

 include/sound/tas2781.h           |  7 +------
 sound/pci/hda/tas2781_hda_i2c.c   |  2 +-
 sound/soc/codecs/tas2552.c        |  2 --
 sound/soc/codecs/tas2764.c        |  2 --
 sound/soc/codecs/tas2770.c        |  2 --
 sound/soc/codecs/tas2780.c        |  2 --
 sound/soc/codecs/tas2781-comlib.c |  3 ---
 sound/soc/codecs/tas2781-fmwlib.c |  1 -
 sound/soc/codecs/tas2781-i2c.c    | 26 ++++----------------------
 sound/soc/codecs/tas5086.c        | 27 ++++++++++++---------------
 10 files changed, 18 insertions(+), 56 deletions(-)
---
base-commit: 1613e604df0cd359cf2a7fbd9be7a0bcfacfabd0
change-id: 20240701-asoc-tas-gpios-5c051d80d768

Best regards,
-- 
Linus Walleij <linus.walleij@linaro.org>

