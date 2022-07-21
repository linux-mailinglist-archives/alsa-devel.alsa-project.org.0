Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CEAB357C8E3
	for <lists+alsa-devel@lfdr.de>; Thu, 21 Jul 2022 12:26:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6034A17A8;
	Thu, 21 Jul 2022 12:25:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6034A17A8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1658399160;
	bh=5GvDiRQ9PJmabEvjahc7mIztl6dLDC9dxph2RaGiiDo=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=lOr0CjCqNApAmWy8cd0yEBkatBTnATtAnMDeKoD3nwQHOh1FJIHyzMhcs+VUprKwk
	 nUA+ao7yk2sR87gioFOtHS5cMNdWBA/S/OH8jhZ0mgXYwpYIysRPeKzoPlZYL5CcxA
	 MIyl5IbhdPV08KZOBOW8HVof+3SDro6Xrs0Wn1eE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BD8FFF80256;
	Thu, 21 Jul 2022 12:24:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 03182F8047C; Thu, 21 Jul 2022 12:24:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE, T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6B52DF800BA
 for <alsa-devel@alsa-project.org>; Thu, 21 Jul 2022 12:24:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6B52DF800BA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="pWH3L3Yd"
Received: by mail-ej1-x62a.google.com with SMTP id va17so2429968ejb.0
 for <alsa-devel@alsa-project.org>; Thu, 21 Jul 2022 03:24:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=js2Eh3haubuIRskNzXp6VshzHcfnwwSq/J4hZwGa8l0=;
 b=pWH3L3YdrnLoQ0HNw6c8F8JSC0WIcwKfvAYAvRTvAT74zSHYLr1ppVDZP8FqZ9Pw1l
 fcKkU5OHG44EouQ0AKVRaXvR2VuJ7f+glaXIkU3gX9B5qjx9sZPMKn3WYFZ9QlgFl3Ok
 BmZRghKqPyrqxKo0p5JNilCuUV/VAQFBfOjUZZPTNT+W9jPWXeaCsUH6jBzRUZD+h8og
 0mBmEqKlZMq2O/pvlPt//VLczJVdqUMinaucnnPQL7FyNkCJcvkHzGrPdayYIll/5kA6
 sIloPUOznZkGPsiQ7hvy2T3BPLVSPHA2uqlWgiLsNOEgCG6UAxMOU+/H3toK2vFyQncZ
 Qgkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=js2Eh3haubuIRskNzXp6VshzHcfnwwSq/J4hZwGa8l0=;
 b=3I5tUba3fWKFsGXHLT5ZvxgIU6mUw3papzBdqj2YKRY1CsKCIWF2OwLHSxWT8QT4os
 8I08m69JDq7AWrEc1rdW4Nh3ymW/aY20YPMCZQQPlReC9mqo6bvEbQ+usfwV3/6M2wqg
 yCzzLdPSegxMOyvErYIwFfj1IPpSkia064RZ/tY2ZYQ7gxc23Tbp3+pp/1lY7JDWbleD
 JomElTjFz1zqpSnP8um5/Z/zCu2/WSLTrWIlWHt3931C6OLY64tEXguPQk/QCI9jGSk+
 MlQ7hQyi17rwV0C4JaqPxNOkUKVoPu+5aBAaM93p0kRVAVOtjifuqCQitkljT+HYRtUK
 LwCw==
X-Gm-Message-State: AJIora+3bsw6WAS4oRMZTZL1CUdqzqAugngwxSyAfov5ppq2lyPdeD9K
 mJKEOTL3wNWi9oUvd2kKgXg=
X-Google-Smtp-Source: AGRyM1tKJwVoGz2W4igzRFa8hiAZg6uksdGJy65ol3fYIbo2Eg2E0HyiNn+2TXrKwtPhHsYzOna3bg==
X-Received: by 2002:a17:906:a402:b0:72b:8e6e:64ea with SMTP id
 l2-20020a170906a40200b0072b8e6e64eamr40419195ejz.469.1658399090943; 
 Thu, 21 Jul 2022 03:24:50 -0700 (PDT)
Received: from localhost (92.40.202.7.threembb.co.uk. [92.40.202.7])
 by smtp.gmail.com with ESMTPSA id
 j9-20020a17090623e900b006fed93bf71fsm699981ejg.18.2022.07.21.03.24.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Jul 2022 03:24:50 -0700 (PDT)
From: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
To: lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 srinivas.kandagatla@linaro.org, bgoswami@quicinc.com
Subject: [PATCH -next 0/2] ASoC: Cleanup deprecated regmap-irq functionality
Date: Thu, 21 Jul 2022 11:25:56 +0100
Message-Id: <20220721102558.25457-1-aidanmacdonald.0x0@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
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

Update two ASoC codec drivers to remove uses of regmap-irq type
registers, which have recently been deprecated by the "regmap-irq
cleanups and refactoring" series in linux-next.

Link: https://lore.kernel.org/lkml/20220623211420.918875-1-aidanmacdonald.0x0@gmail.com/

Aidan MacDonald (2):
  sound: soc: codecs: wcd9335: Convert irq chip to config regs
  sound: soc: codecs: wcd938x: Remove spurious type_base from irq chip

 sound/soc/codecs/wcd9335.c | 10 ++++++++--
 sound/soc/codecs/wcd938x.c |  1 -
 2 files changed, 8 insertions(+), 3 deletions(-)


base-commit: 353f7988dd8413c47718f7ca79c030b6fb62cfe5
prerequisite-patch-id: a45db1cac7537769dc10087fc61f977dc150744c
prerequisite-patch-id: cb8aa009c7bb7a6575eb05e3af65342dc8d0efa3
prerequisite-patch-id: 8d32557e53b894d1fb17250d2d0eb3673f068d37
prerequisite-patch-id: 5b293867ef81e3697892ac51b941bb53680a70dc
prerequisite-patch-id: 8138d39a4817e804141bfe8c2ad37d9c55456a40
prerequisite-patch-id: b01216129e887519d441cf556bbc75c397871773
prerequisite-patch-id: b5dcf0c0609113c2d81bc557c1fc95ef23f40811
prerequisite-patch-id: 622ca1c10e851b1889aaa567c1d2a0adf43cca44
prerequisite-patch-id: d28c5187f9bf0e43f27b2f4aa8dcf7fd91842a03
prerequisite-patch-id: d29d54b756be73304f844abeeaf9b46a5c0119d5
prerequisite-patch-id: 5d405790ae89c0831b46a359f86e94bac5a67470
prerequisite-patch-id: c90120e79acbb52ffa148bfedee1df9d35b5eced
prerequisite-patch-id: 2e35247a5cfe5a28565c9272b85fc6835011b032
-- 
2.35.1

