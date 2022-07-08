Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C46DA56BD21
	for <lists+alsa-devel@lfdr.de>; Fri,  8 Jul 2022 18:03:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5C68A844;
	Fri,  8 Jul 2022 18:02:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5C68A844
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657296192;
	bh=A2dAKVrDbhdxdISEo+1eGgVE1CVDaMSpOg5I4oNZ3so=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=XpW2y2Yixut2cCGHMFdsSa9cZLGms7hySSSy+yx0IVf+XRgqprWDYKHJe+FwGAyfn
	 A2TjAnbmp1JwfqbTUjG3EFO13LFwHfvjdxb49Tm3OigdbmJz5KceM0vRjxnsBhE+Sl
	 9ZcY3Sj/F0n+5w39xkJiSLkWfQPH4X1e7y2MxTJQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C7FF7F8049E;
	Fri,  8 Jul 2022 18:02:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E328DF804CF; Fri,  8 Jul 2022 18:02:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE, T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3F8AFF8028B
 for <alsa-devel@alsa-project.org>; Fri,  8 Jul 2022 18:02:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3F8AFF8028B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="DdALFxmX"
Received: by mail-wr1-x434.google.com with SMTP id s1so31151921wra.9
 for <alsa-devel@alsa-project.org>; Fri, 08 Jul 2022 09:02:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Pro0cyE0Jn+rZnK315lxKLlhsCvoJbHZNzW9Cc6PhUM=;
 b=DdALFxmXrrrET3rMR34tN44U4tdHIi66lU8JJgJj1T+SoKhoWIuZ47YnYx+bWP5dtT
 cs/CICnTVgvS1+SkZUajmRDjZrJ5R/RW6WTpBSpbMk6iPxvPhcZfBonyBcskW+wwVZbe
 mu1lyy0jcDbzhNGPVrMfL5d5yi8nb+7apnV2Z1M9R6TxH1OjkQBVLvlW7eAfHMxNvyOf
 +BygGQmUPY2z7O6TUeO4f+5YMnMUqLq1zvNRXH5MPDfOl90Gg5BoDc0C1r3BeyxpRlTY
 ghYCg5nwEBFB/1n0iy2HoPyxR2IIWY363ohyY1ZA2JB9+N7V41sp66Da85ibY1DIVUEE
 cu1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Pro0cyE0Jn+rZnK315lxKLlhsCvoJbHZNzW9Cc6PhUM=;
 b=mGxXWM0xOvJ5XuJBv2qGaqE5SxKwlPGYR1755X1OCRcI68NFao7YLCOEDQhIK/0Fr9
 PxExzHf5WmEOnk9AkPFCkyQFpz+9Bzf1Ow/ADhMOWYxJ0Li+wsq1xDLGwDiyqajwpodc
 FRS5Dzs0tiOVnbZ8rOsrrF9TYSNAp3fA9b1QCfOAFFIHqD/j95wKsRQvagBc98qDA+F6
 JtI+jvRd51MSGy2R9D15RYX0w8Zp/FbFLO/2NNEWzkb0e4OeMfVe1oSYskOxuLOXnvro
 9nQEp/Kad2j9h4LSJjgImYZaYwtFD4Kr5iTAgd8ieIFsBSxwy82mYu6ZmalLuowFb3VS
 Gelw==
X-Gm-Message-State: AJIora/LLFXyKIDZcsFvv/x8fumsulPLMQT1Q2lA5SETpmM2TPU/F8xj
 PYohPo1rLGPY/e30sfJnLVg=
X-Google-Smtp-Source: AGRyM1sa1uwt7GX0FBbOcHiYKkmpTtcghJDD6LEDkMeWFUrD+Gsb5I/JS8R0WTKA5jwMbEcyVxHehw==
X-Received: by 2002:a5d:59a6:0:b0:21b:a234:8314 with SMTP id
 p6-20020a5d59a6000000b0021ba2348314mr4026407wrr.316.1657296125630; 
 Fri, 08 Jul 2022 09:02:05 -0700 (PDT)
Received: from localhost (92.40.203.144.threembb.co.uk. [92.40.203.144])
 by smtp.gmail.com with ESMTPSA id
 u18-20020adfdd52000000b002185d79dc7fsm18237827wrm.75.2022.07.08.09.02.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Jul 2022 09:02:04 -0700 (PDT)
From: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
To: paul@crapouillou.net, lgirdwood@gmail.com, broonie@kernel.org,
 perex@perex.cz, tiwai@suse.com
Subject: [PATCH v4 00/11] ASoC: cleanups and improvements for jz4740-i2s
Date: Fri,  8 Jul 2022 17:02:33 +0100
Message-Id: <20220708160244.21933-1-aidanmacdonald.0x0@gmail.com>
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
adding support for a new SoC. The two improvements are lifting
unnecessary restrictions on sample rates and formats -- the existing
ones appear to be derived from the limitations of the JZ4740's internal
codec and don't reflect the actual capabilities of the I2S controller.

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

Changes in v4:

* Refactor FIFO flush bits fix so it doesn't depend on regmap conversion.

Aidan MacDonald (11):
  ASoC: jz4740-i2s: Handle independent FIFO flush bits
  ASoC: jz4740-i2s: Remove unused 'mem' resource
  ASoC: jz4740-i2s: Convert to regmap API
  ASoC: jz4740-i2s: Simplify using regmap fields
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

