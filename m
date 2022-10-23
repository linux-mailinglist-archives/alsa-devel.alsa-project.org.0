Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C1CF26093F7
	for <lists+alsa-devel@lfdr.de>; Sun, 23 Oct 2022 16:34:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 54F6687DA;
	Sun, 23 Oct 2022 16:33:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 54F6687DA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666535672;
	bh=F9GXkZqRhKkaXxBmhVwVO5BMIHb637gQyxTImB0eA5U=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=vgU02GGKfYi0TsUli6/JPHXqC7haCKqvouyFK6I1xdvkqD4AL7fnEbUcq4E+/58zg
	 irnDhgMaWN5EvdjDouRayASKkzBeLwqpEsuIxRSD0AGuKC8pOnT0f5k21ht79idU/7
	 9HsngdnaA9Plfr6YGaUQt9epIXbtX4HcsCYvGW2w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BA60AF8026D;
	Sun, 23 Oct 2022 16:33:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B14DFF803DB; Sun, 23 Oct 2022 16:33:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE, T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 21887F8012A
 for <alsa-devel@alsa-project.org>; Sun, 23 Oct 2022 16:33:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 21887F8012A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="NMxA7YjY"
Received: by mail-wm1-x330.google.com with SMTP id
 l14-20020a05600c1d0e00b003c6ecc94285so5723142wms.1
 for <alsa-devel@alsa-project.org>; Sun, 23 Oct 2022 07:33:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=WUGeajMYAerRFQcOqcSIJ1LvScQ/5lPSyQp1+APgyBg=;
 b=NMxA7YjYwmFC7EMaBdm1k/rg1Sg6SL3DNDYSF9piNDMB26oEYDSuJPr9RZz2LI+IbX
 gzZBC/iDZIao94YxfWesLLKDqIQ2BOIoTfJFPBc8YDp3L+KYy4s+pjdpPIkBFLMGVbvP
 S8e4wGlNA1rKkMcCda7DtQsSmiy1dw0JjJEKiYuKdXualkP4PHSxhiNtEXVANHw1glo+
 pGIN6PhZyYAQkHwcHhDLO4RcRJMsOjjte5Z0Qsb2ehlJZkXM9mCsoPprItJkHWoplWTt
 h/AX24iKZ07DA33piY+5fHwqSxsoNnM4ExuXUgqejEX195YRO3faoVTSWANwFhpda/Us
 Au4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=WUGeajMYAerRFQcOqcSIJ1LvScQ/5lPSyQp1+APgyBg=;
 b=IcTh8wHjkYmiy2wg/iYl0F1C0/V4ZlAcNNaMfRc8GUsOx839ggpf1AqaeyH8jBR4KK
 McXVMH1Waw3mL1Hd85SB7YQVk/Ccdy7Z7sxbhaWxaKdCxE/zTrtOdCm57bCK5HUVppI2
 QhC/ssP8oBrF6tMzrm73eaCkanv0BuyXPkcdW/oMdnjDerPTFjfBTdZcoHFwoBs+zfiD
 7wzWBrZ2NnD6Ki/Qhvui0fbhRv2ecqtOLGu9FKX3YN9YSFMUfBaNHmBOc1gL65SXAPQv
 6bkDSN4gxwV8FPQWPEzxSmfFKW+npndeaFtODxi5H7OzQJHH8T9XgXhZnpsSBIBtVodf
 yDaA==
X-Gm-Message-State: ACrzQf1IvOpwmgFQ6DqaJ97l20ci9GFiGXo1gnIo9tWdzkRcv5eclipK
 ZBb+OYHNTNNCjeOhyMNgYmA=
X-Google-Smtp-Source: AMsMyM4lrHZdx1GnN4wpUqJBRPblfE99mI/Nrpbo9kMAbrO2up/+wV+u6FaSpxhHSqPJA3Pme44kxA==
X-Received: by 2002:a1c:770f:0:b0:3c8:33ba:150f with SMTP id
 t15-20020a1c770f000000b003c833ba150fmr7553451wmi.194.1666535611447; 
 Sun, 23 Oct 2022 07:33:31 -0700 (PDT)
Received: from localhost (94.197.10.75.threembb.co.uk. [94.197.10.75])
 by smtp.gmail.com with ESMTPSA id
 bu18-20020a056000079200b002302dc43d77sm10406023wrb.115.2022.10.23.07.33.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Oct 2022 07:33:30 -0700 (PDT)
From: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
To: paul@crapouillou.net, lgirdwood@gmail.com, broonie@kernel.org,
 perex@perex.cz, tiwai@suse.com
Subject: [PATCH v6 0/9] ASoC: cleanups and improvements for jz4740-i2s
Date: Sun, 23 Oct 2022 15:33:19 +0100
Message-Id: <20221023143328.160866-1-aidanmacdonald.0x0@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
 zhouyu@wanyeetech.com, linux-mips@vger.kernel.org
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

Changes in v6:

* Added Cc: stable for flush bits fix.

Changes in v5:

* Drop 'mem' resource removal patch already upstream.
* Update FIFO flush bits fix to address Paul's review comments.
* Drop PLL clock name patch, that needs a different approach.

Link for v4: https://lore.kernel.org/alsa-devel/20220708160244.21933-1-aidanmacdonald.0x0@gmail.com/

Aidan MacDonald (9):
  ASoC: jz4740-i2s: Handle independent FIFO flush bits
  ASoC: jz4740-i2s: Convert to regmap API
  ASoC: jz4740-i2s: Simplify using regmap fields
  ASoC: jz4740-i2s: Use FIELD_PREP() macros in hw_params callback
  ASoC: jz4740-i2s: Align macro values and sort includes
  ASoC: jz4740-i2s: Support S20_LE and S24_LE sample formats
  ASoC: jz4740-i2s: Support continuous sample rate
  ASoC: jz4740-i2s: Move component functions near the component driver
  ASoC: jz4740-i2s: Refactor DAI probe/remove ops as component ops

 sound/soc/jz4740/Kconfig      |   1 +
 sound/soc/jz4740/jz4740-i2s.c | 455 ++++++++++++++++++----------------
 2 files changed, 243 insertions(+), 213 deletions(-)

-- 
2.38.1

