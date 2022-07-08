Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EAFE256B762
	for <lists+alsa-devel@lfdr.de>; Fri,  8 Jul 2022 12:43:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 84A1A83A;
	Fri,  8 Jul 2022 12:42:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 84A1A83A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657277006;
	bh=7ZNBXW1+Qm22Ql4DmjtqIsAKYiUS2sn0o4zjg7Xn4QI=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=UhCZGqIq/AfDhwt2GkqIwnQ2nccaedQWtFE4nnCsTN49yKrvMQ2cFajDIwLYV8MsC
	 xx6t6WTMAyMX/6sKm66GGdZO3SQPjZEZNwcpy3kHIXeMR0wYqKO+6uIRD0Zd5HhWqq
	 PQRg92JemXsnDm2fCwToj3e82xsIcFLD4ytdna+w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F2DB8F8028B;
	Fri,  8 Jul 2022 12:42:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3919CF80167; Fri,  8 Jul 2022 12:42:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE, T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A9B50F800C5
 for <alsa-devel@alsa-project.org>; Fri,  8 Jul 2022 12:42:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A9B50F800C5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="TdvZUrAZ"
Received: by mail-wm1-x32a.google.com with SMTP id
 m6-20020a05600c3b0600b003a0489f412cso717408wms.1
 for <alsa-devel@alsa-project.org>; Fri, 08 Jul 2022 03:42:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fKAr7Zhr30ZOTzRFaGydt4W45eJqo7Xj+adqxcVbPC8=;
 b=TdvZUrAZ7iPBcbcGl10EzviS/QbPAoSltWfw7avU6ocFQxj3bQRPln/oObuz4CSClv
 Z40GxaaFI8/bAE75b8zxFJEitqRv6GmkBlBRkbrK18XU1o6SUeUTF+Fbd6v3X7OyQYVc
 a19Ac+946JUMIwfHpM8zxagrr1qcQGVR+s2/cudGClSAvBVtG2i6eFRhsF+9nPdMVchp
 fFgORJlPXO5wLtWV5KK4KiFReGVx7jajzCYbUN6+oFl/xZ4Ev3e/pd2sdsTByEEiqAMb
 V4LPY87V92z3VgQjA4xtMJqzFitgQZpEJedGoLjF9HyqvUlwDvC4M0lbWhkc3JhVWJiG
 tiMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fKAr7Zhr30ZOTzRFaGydt4W45eJqo7Xj+adqxcVbPC8=;
 b=CsJt6pcYynAddgEMQQZfAfnWKq1ZZq7mvEnanyH+AecEEO9F28DF4ak+GXbED1O0SD
 y1kbDACe0pOvDuXeUWPBnMcsE5ZXzvlXusPOxw6Suj67/EfTnluZMpQKxTitifPXbxS9
 8Z1K2kX4GDO9gxkU1+iXV9Cd7XPrIaqsWdOsJfUw4Ul2iagcWE6W6RGXvREylm4eSOcc
 UfJiQw2b/jbX79DSPrez3cTCll2PyxRlAav/jhotTWmOHWwb3LlD4rh6Bpr0z/3/0SZy
 WMsfHSbUlk4L9Yvy5NU8MCLsgCg1kazxb1G3j2jr0A1xwILn/nVhbrxlgSX/iHdstvc0
 iYkw==
X-Gm-Message-State: AJIora+ZAK/UYzVXSphsHtFjF9C6wtXgpgv3QYL7xA11HUZmti+mEs/u
 c3J6TFJA0lnJoK7iJkyRsG4=
X-Google-Smtp-Source: AGRyM1v19ynb891XDScV5Yri3l9rOzv1q/V8+qPM6QsBC6z8ho+o/Wp44msIrUBV582kJASdErSiYA==
X-Received: by 2002:a05:600c:40d5:b0:3a1:8d0f:db47 with SMTP id
 m21-20020a05600c40d500b003a18d0fdb47mr2964822wmh.138.1657276939110; 
 Fri, 08 Jul 2022 03:42:19 -0700 (PDT)
Received: from localhost (92.40.203.220.threembb.co.uk. [92.40.203.220])
 by smtp.gmail.com with ESMTPSA id
 q5-20020adff945000000b0021b9585276dsm39952053wrr.101.2022.07.08.03.42.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Jul 2022 03:42:18 -0700 (PDT)
From: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
To: paul@crapouillou.net, lgirdwood@gmail.com, broonie@kernel.org,
 perex@perex.cz, tiwai@suse.com
Subject: [PATCH v3 00/11] ASoC: cleanups and improvements for jz4740-i2s
Date: Fri,  8 Jul 2022 11:42:53 +0100
Message-Id: <20220708104304.51415-1-aidanmacdonald.0x0@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, linux-mips@vger.kernel.org,
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

This series is a preparatory cleanup of the jz4740-i2s driver before
adding support for a new SoC. The last two patches lift unnecessary
restrictions on sample rates and formats -- the existing ones appear
to be derived from the limitations of the JZ4740's internal codec and
don't reflect the actual capabilities of the I2S controller.

I'm unable to test the series on any JZ47xx SoCs, but I have tested
on an X1000 (which is the SoC I'll be adding in a followup series).

Changes in v2:

* Drop two patches already in sound for-next.
* Squash two removal patches into the regmap fields patch.
* Remove the unused 'mem' resource in the driver private struct.
* Use regmap_set_bits() and regmap_clear_bits() to improve readability.
* Add fix for SoCs with independent FIFO flush bits (ie. most of them).
* Update sample formats patch with a more informative commit message.
* Add two new patches to refactor DAI/component probing.

Changes in v3:

* Fix missing 'ret' in patch 11 (yes, that was pretty silly of me)

Aidan MacDonald (11):
  ASoC: jz4740-i2s: Remove unused 'mem' resource
  ASoC: jz4740-i2s: Convert to regmap API
  ASoC: jz4740-i2s: Simplify using regmap fields
  ASoC: jz4740-i2s: Handle independent FIFO flush bits
  ASoC: jz4740-i2s: Use FIELD_PREP() macros in hw_params callback
  ASoC: jz4740-i2s: Align macro values and sort includes
  ASoC: jz4740-i2s: Make the PLL clock name SoC-specific
  ASoC: jz4740-i2s: Support S20_LE and S24_LE sample formats
  ASoC: jz4740-i2s: Support continuous sample rate
  ASoC: jz4740-i2s: Move component functions near the component driver
  ASoC: jz4740-i2s: Refactor DAI probe/remove ops as component ops

 sound/soc/jz4740/Kconfig      |   1 +
 sound/soc/jz4740/jz4740-i2s.c | 461 ++++++++++++++++++----------------
 2 files changed, 248 insertions(+), 214 deletions(-)

-- 
2.35.1

