Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F121554F0F
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Jun 2022 17:24:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3342E1E74;
	Wed, 22 Jun 2022 17:23:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3342E1E74
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655911461;
	bh=s1xI/W1qmCH3kWnaX5UxkaeZujf8/DbdKiwojQawIyI=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=JkwhirXGSSY8TOwIFjteSLS9cH4oRDwP5R+EcTMT2zG0k/4jy6EQraHSU3sO2B23g
	 2JZJd0gmAZMzbnh2kgDvFMLlo/BjxOJfxUyUNQfptR0vrWZCPwCsUXvU2K4u5DuNMV
	 RRc9OzexnRxztZXWqwDWvaBQ02iJx2Ta6jptyk1k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E3068F80534;
	Wed, 22 Jun 2022 17:23:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 174A3F800E3; Mon, 20 Jun 2022 22:06:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE, 
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8D624F800CB
 for <alsa-devel@alsa-project.org>; Mon, 20 Jun 2022 22:06:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8D624F800CB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="K+4UeUWj"
Received: by mail-wm1-x32a.google.com with SMTP id
 p6-20020a05600c1d8600b0039c630b8d96so6919401wms.1
 for <alsa-devel@alsa-project.org>; Mon, 20 Jun 2022 13:06:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=oX9lN4QRIjjDytL1egq7FKfqlZ9uKSn9qlbeSJsieqg=;
 b=K+4UeUWjHq6YAI9jmYvUTMkv1gq1iw00GX/6AlYN+9b41Q3kf86nQDTqY6rD37C4HI
 kzPm2mFeTHl+1E1B1XQfdRnKW8+YaELFKaQgGAqgsXl7/q1p71QRVLhIGdeg4j5KK+cP
 3YX3ykOuY2lgJL2B7erq/iMhopV+WmK1QZ8/MAPeoCMn4tyiCnMezfoZOyzEos9QqFg2
 e5w+U0RJhQvBhZddSX2H2SbdIyiKQLQYRn4o5iDRWV3n6i8JNHC0MqRAoimLsqSlXU0f
 qGvg/aHb4Vfv5PQh5RZ68Qw5K5jk6ukus9q+UPCgwRCPHKmP1bzrm1D+okCYj+yUNj2Q
 +fUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=oX9lN4QRIjjDytL1egq7FKfqlZ9uKSn9qlbeSJsieqg=;
 b=ptH8cGFjjeTpeR58nYxfgiQVRbzpSxeA3en8FNhh1JjyNfaII8VTyZ4FjD6j7GsH6u
 mt4JrAIs+Z9Ne0v0ZQtJAP8nQQcXrtixY3dENcigUoeSwl44e/NpYNqNNXbGxrOL0i91
 lqEEUjLCcn0bU+4Ra3aKKVPeu6Xkj3kE8VpkP2794OtLPU0lj+3G1JbMornI/ViIOa2A
 ZhUh/E8hDImfPnYAraZqJQ11ND+02pU55GWtj/9iyYlP7q1ZN5ZnBPZNvhlL8DkO4jd3
 3w8cY70L6xvdlX9PEQObP4/49igTzxkPNqbZqYA04SJUEY+91mapJjImSzebahy6FUMu
 890Q==
X-Gm-Message-State: AOAM531gPjTY552ZIMGqOkUXuFJVg9t7MlmOyFbWFsoSV6txLjHWFgTs
 CUApWvMV0fFK//VnUsmf0ME=
X-Google-Smtp-Source: ABdhPJxsi6sQIkVr9H0Bu1PTh/rzJ3ELem1KRMbimP0CLQUhYJkhAnA3ChsXiGO+dNs73Bpag9foIA==
X-Received: by 2002:a05:600c:3acc:b0:39c:7427:d379 with SMTP id
 d12-20020a05600c3acc00b0039c7427d379mr36991978wms.32.1655755574785; 
 Mon, 20 Jun 2022 13:06:14 -0700 (PDT)
Received: from localhost (92.40.169.68.threembb.co.uk. [92.40.169.68])
 by smtp.gmail.com with ESMTPSA id
 eh1-20020a05600c61c100b003973d425a7fsm17910543wmb.41.2022.06.20.13.06.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jun 2022 13:06:14 -0700 (PDT)
From: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
To: broonie@kernel.org
Subject: [PATCH 00/49] regmap-irq cleanups and refactoring
Date: Mon, 20 Jun 2022 21:05:55 +0100
Message-Id: <20220620200644.1961936-1-aidanmacdonald.0x0@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 22 Jun 2022 17:23:17 +0200
Cc: alsa-devel@alsa-project.org, bgoswami@codeaurora.org, rafael@kernel.org,
 linus.walleij@linaro.org, bjorn.andersson@linaro.org,
 srinivas.kandagatla@linaro.org, myungjoo.ham@samsung.com, lee.jones@linaro.org,
 samuel@sholland.org, maz@kernel.org, brgl@bgdev.pl, mani@kernel.org,
 krzysztof.kozlowski@linaro.org, jernej.skrabec@gmail.com,
 cw00.choi@samsung.com, wens@csie.org, agross@kernel.org, orsonzhai@gmail.com,
 linux-sunxi@lists.linux.dev, b.zolnierkie@samsung.com,
 linux-arm-msm@vger.kernel.org, tharvey@gateworks.com,
 linux-actions@lists.infradead.org, linux-gpio@vger.kernel.org, tiwai@suse.com,
 tglx@linutronix.de, cristian.ciocaltea@gmail.com,
 linux-arm-kernel@lists.infradead.org, rjones@gateworks.com,
 gregkh@linuxfoundation.org, lgirdwood@gmail.com, linux-kernel@vger.kernel.org,
 michael@walle.cc, zhang.lyra@gmail.com, baolin.wang7@gmail.com,
 mazziesaccount@gmail.com
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

Hi Mark,

Here's a bunch of cleanups for regmap-irq focused on simplifying the API
and generalizing it a bit. It's broken up into three refactors, focusing
on one area at a time.

* Patches 01 and 02 are straightforward bugfixes, independent of the
  rest of the series. Neither of the bugs are triggered by in-tree
  drivers but they might be worth picking up early anyhow.

* Patches 03-13 clean up everything related to configuring IRQ types.

* Patches 14-45 deal with mask/unmask registers. First, make unmask
  registers behave more intuitively and usefully, and get rid of the
  mask_invert flag in favor of describing inverted mask registers as
  unmask registers. Second, make the mask_writeonly flag more useful
  and enable it for two chips where it makes sense.

* Patches 46-49 refactor sub_irq_reg() as a get_irq_reg() callback,
  and use that to eliminate the not_fixed_stride flag.

The approach I used when refactoring is pretty simple: (1) introduce new
functionality in regmap-irq, (2) convert the drivers, and (3) remove any
old code. Nothing should break in the middle.

The patches can be re-ordered to some extent if that's preferable, but
it's best to add get_irq_reg() last to avoid having to think about how
it interacts with features that'll be removed anyway.

I can't test most of the devices affected by this series so a lot of the
code is only build tested. I've tested on real hardware with my AXP192
patchset[1], although it only provides limited code coverage.

qcom-pm8008 in particular deserves careful testing - it used all of the
features touched by the refactors and required the most changes. Other
drivers only required trivial changes but there are three of them worth
mentioning: wcd943x, wcd9335, and wcd938x. They have suspicious looking
IRQ type definitions and I'm pretty sure aren't working properly, but
I can't fix them myself. The refactor shouldn't affect their behavior
so how / when / if they get fixed shouldn't be much of an issue.

Oh, and I added the 'mask_writeonly' flag and volatile ranges to the
stpmic1 driver based on its datasheet[2] as a small optimization. It's
probably fine but testing would be a good idea.

[1]: https://lore.kernel.org/linux-iio/20220618214009.2178567-1-aidanmacdonald.0x0@gmailcom/
[2]: https://www.st.com/resource/en/datasheet/stpmic1.pdf

Aidan MacDonald (49):
  regmap-irq: Fix a bug in regmap_irq_enable() for type_in_mask chips
  regmap-irq: Fix offset/index mismatch in read_sub_irq_data()
  regmap-irq: Remove an unnecessary restriction on type_in_mask
  regmap-irq: Introduce config registers for irq types
  mfd: qcom-pm8008: Convert irq chip to config regs
  mfd: wcd934x: Convert irq chip to config regs
  sound: soc: codecs: wcd9335: Convert irq chip to config regs
  sound: soc: codecs: wcd938x: Remove spurious type_base from irq chip
  mfd: max77650: Remove useless type_invert flag
  regmap-irq: Remove virtual registers support
  regmap-irq: Remove old type register support, refactor
  regmap-irq: Remove unused type_reg_stride field
  regmap-irq: Remove unused type_invert flag
  regmap-irq: Do not use regmap_irq_update_bits() for wake regs
  regmap-irq: Change the behavior of mask_writeonly
  regmap-irq: Rename regmap_irq_update_bits()
  regmap-irq: Add broken_mask_unmask flag
  mfd: qcom-pm8008: Add broken_mask_unmask irq chip flag
  mfd: stpmic1: Add broken_mask_unmask irq chip flag
  regmap-irq: Fix inverted handling of unmask registers
  mfd: tps65090: replace irqchip mask_invert with unmask_base
  mfd: sun4i-gpadc: replace irqchip mask_invert with unmask_base
  mfd: sprd-sc27xx-spi: replace irqchip mask_invert with unmask_base
  mfd: rt5033: replace irqchip mask_invert with unmask_base
  mfd: rohm-bd71828: replace irqchip mask_invert with unmask_base
  mfd: rn5t618: replace irqchip mask_invert with unmask_base
  mfd: gateworks-gsc: replace irqchip mask_invert with unmask_base
  mfd: axp20x: replace irqchip mask_invert with unmask_base
  mfd: atc260x: replace irqchip mask_invert with unmask_base
  mfd: 88pm800: replace irqchip mask_invert with unmask_base
  mfd: max14577: replace irqchip mask_invert with unmask_base
  mfd: max77693: replace irqchip mask_invert with unmask_base
  mfd: rohm-bd718x7: drop useless mask_invert flag on irqchip
  mfd: max77843: drop useless mask_invert flag on irqchip
  extcon: max77843: replace irqchip mask_invert with unmask_base
  extcon: sm5502: drop useless mask_invert flag on irqchip
  extcon: rt8973a: drop useless mask_invert flag on irqchip
  irqchip: sl28cpld: replace irqchip mask_invert with unmask_base
  gpio: sl28cpld: replace irqchip mask_invert with unmask_base
  mfd: stpmic1: Fix broken mask/unmask in irq chip
  mfd: stpmic1: Enable mask_writeonly flag for irq chip
  mfd: qcom-pm8008: Fix broken mask/unmask in irq chip
  mfd: qcom-pm8008: Enable mask_writeonly flag for irq chip
  regmap-irq: Remove broken_mask_unmask flag
  regmap-irq: Remove mask_invert flag
  regmap-irq: Refactor checks for status bulk read support
  regmap-irq: Add get_irq_reg() callback
  mfd: qcom-pm8008: Use get_irq_reg() for irq chip
  regmap-irq: Remove not_fixed_stride flag

 drivers/base/regmap/regmap-irq.c | 457 ++++++++++++++-----------------
 drivers/extcon/extcon-max77843.c |   3 +-
 drivers/extcon/extcon-rt8973a.c  |   1 -
 drivers/extcon/extcon-sm5502.c   |   2 -
 drivers/gpio/gpio-sl28cpld.c     |   3 +-
 drivers/irqchip/irq-sl28cpld.c   |   3 +-
 drivers/mfd/88pm800.c            |   3 +-
 drivers/mfd/atc260x-core.c       |   6 +-
 drivers/mfd/axp20x.c             |  21 +-
 drivers/mfd/gateworks-gsc.c      |   3 +-
 drivers/mfd/max14577.c           |   7 +-
 drivers/mfd/max77650.c           |   1 -
 drivers/mfd/max77693.c           |   6 +-
 drivers/mfd/max77843.c           |   1 -
 drivers/mfd/qcom-pm8008.c        | 131 ++++-----
 drivers/mfd/rn5t618.c            |   3 +-
 drivers/mfd/rohm-bd71828.c       |   6 +-
 drivers/mfd/rohm-bd718x7.c       |   1 -
 drivers/mfd/rt5033.c             |   3 +-
 drivers/mfd/sprd-sc27xx-spi.c    |   3 +-
 drivers/mfd/stpmic1.c            |   7 +-
 drivers/mfd/sun4i-gpadc.c        |   3 +-
 drivers/mfd/tps65090.c           |   3 +-
 drivers/mfd/wcd934x.c            |  11 +-
 include/linux/regmap.h           |  59 ++--
 sound/soc/codecs/wcd9335.c       |  10 +-
 sound/soc/codecs/wcd938x.c       |   1 -
 27 files changed, 332 insertions(+), 426 deletions(-)

-- 
2.35.1

