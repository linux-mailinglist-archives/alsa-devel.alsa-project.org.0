Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EF5DA219FF6
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Jul 2020 14:26:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9909E1658;
	Thu,  9 Jul 2020 14:25:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9909E1658
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594297595;
	bh=YJYh9tLFkk55SX08Dj43zKD+WUQpTLSBJ26hqloYmnQ=;
	h=Date:Subject:From:To:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=huN8DA4OAgjuYqnrI+eUpz/D+SQodpmfyakGi9lCYNUk3yY6Wgsmi+SFeW7u5Vzz6
	 3v+SOBA4Xd23pwjC86CUnk44wMd6i85H5f4obFWT2VeBuRA4ih0t+ggHZZOdQynoQv
	 Wwtr2KDYhGsFpo5bd2YWOx/QZEux5jmIE4ohtCyc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 864DCF8025A;
	Thu,  9 Jul 2020 14:25:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2D375F80264; Thu,  9 Jul 2020 14:25:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL
 autolearn=disabled version=3.4.0
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com
 [IPv6:2607:f8b0:4864:20::b49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AD3B7F801F9
 for <alsa-devel@alsa-project.org>; Thu,  9 Jul 2020 14:24:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AD3B7F801F9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="Mu1oRJrK"
Received: by mail-yb1-xb49.google.com with SMTP id i62so982728ybc.15
 for <alsa-devel@alsa-project.org>; Thu, 09 Jul 2020 05:24:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=xyAU3GDVzu8RcppSWU9t3YDGsji+GWn4JmoHL1gXP/M=;
 b=Mu1oRJrK80SYqyPJrek1H17gVqae653cSXkozAMpbz7C/BnOYsgSC/m1k5rwC06X98
 3buGe12td5KuIUO/GeaA2GjQ6MKAAq/Yw/+D/RUf4xrq1+5KX23azU67k/6oYwLlRTxF
 qI885xNfmxo2KR9SUE+ptQv/hjHkPFseO0sLP+M1Is9TvGFOB+dWLgYqOiCwVYD6cvks
 uOr8UtPPD9rFJ9NtxBmfiduQsd54a4MZJdcVlzx1QQ5wwQQLGUr48s7wma2oeX8JUx/B
 /Nuum0CRvS0FC5zYzkE7USjLGo/mE3Y7oYi6UpRwrLgWeVeunYyUKO9o9tqG5rDiNgNI
 rGtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=xyAU3GDVzu8RcppSWU9t3YDGsji+GWn4JmoHL1gXP/M=;
 b=hqhi2nsvpWBZN24IqBRJQrLhMOlVKIyxj7Xiq7hTLd0GBMismovNyRjEteA9ZFUQQu
 tHELMc++9ku0hMM3k/eKB+WvE3R1+O9iReHUhK67ii5sbVJl+H+GBGjXN9MV4TmCS1aN
 DI7glORmoxw4u2QP5NC9OpdiFpM3aQshCkwaujwcHk0KnDd+ha6X3OEHdI7ylSY6Fujx
 dH0tZPggcVhe7nTqmUsT8fZXvsdVBpFnmA5BGSEpmouQHwclBcLjiqbPmMYuqHVBNbgo
 eCQy1lRVQRTCpGnEr0pN9M2VmxZf1PXmKcC29TlgwyaeA7FbxahTD+BZQlvt6TuEtZ/k
 MtMA==
X-Gm-Message-State: AOAM530KvfLDl2DKRhHmiYgkAoCNvWtxfo70m/lQRa22qV3fznYq51ym
 TwBQ9Qm3q81R601GidgyaBqrxLPFMVdu
X-Google-Smtp-Source: ABdhPJz7+yoQm3gbMtjMVxAZRZrlWR8xFxRxqE4ji/xPrDNVjHNHYG25F29MtCXP50VVXUPHsVyJ38BsCDI5
X-Received: by 2002:a25:146:: with SMTP id 67mr34545740ybb.416.1594297492679; 
 Thu, 09 Jul 2020 05:24:52 -0700 (PDT)
Date: Thu,  9 Jul 2020 20:24:40 +0800
Message-Id: <20200709122445.1584497-1-tzungbi@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.27.0.383.g050319c2ae-goog
Subject: [PATCH 0/5] ASoC: mediatek: mt8183-da7219: support machine driver for
 rt1015
From: Tzung-Bi Shih <tzungbi@google.com>
To: broonie@kernel.org
Content-Type: text/plain; charset="UTF-8"
Cc: tzungbi@google.com, alsa-devel@alsa-project.org
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

This series tries to reuse mt8183-da7219-max98357.c for supporting machine
driver with rt1015 speaker amplifier.

The first 3 patches refactor the code for easier to change for subsequent
patches.

The 4th patch adds document for the new proposed compatible string.

The 5th patch changes the machine driver to support either "MAX98357A" or
"RT1015" codecs.

Tzung-Bi Shih (5):
  ASoC: mediatek: mt8183-da7219: sort header inclusions in alphabetical
  ASoC: mediatek: mt8183-da7219: remove forward declaration of
    headset_init
  ASoC: mediatek: mt8183-da7219: extract codec and DAI names
  ASoC: mediatek: mt8183-da7219: add compatible string for using rt1015
  ASoC: mediatek: mt8183-da7219: support machine driver with rt1015

 .../bindings/sound/mt8183-da7219-max98357.txt |   5 +-
 sound/soc/mediatek/Kconfig                    |   5 +-
 .../mediatek/mt8183/mt8183-da7219-max98357.c  | 244 ++++++++++++++----
 3 files changed, 197 insertions(+), 57 deletions(-)

-- 
2.27.0.383.g050319c2ae-goog

