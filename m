Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EE3911985BE
	for <lists+alsa-devel@lfdr.de>; Mon, 30 Mar 2020 22:44:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6016F166D;
	Mon, 30 Mar 2020 22:43:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6016F166D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1585601083;
	bh=ldkkDuj1UdsKmuP911onmSK7Xo0QbBwP8mfte6fuVDI=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=YEXnCiu5D1G9jqo79oTQ+iHCuehYUH7bsltBqox8DlfblznwiEvxxiRH6PF3J5T3J
	 ih8geGiZ+hgZ+N3E8DtJmNGVdPW0iWrX+mhqcZfr0+z/xtLiQkOMoFcmA0B9jfB/TW
	 kbTJ/yd0s00MJ6wlkG9LsQS/usvTmmxjXCbQkPA4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6422EF800EB;
	Mon, 30 Mar 2020 22:43:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 20433F8015C; Mon, 30 Mar 2020 22:42:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 02DF6F8010C
 for <alsa-devel@alsa-project.org>; Mon, 30 Mar 2020 22:42:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 02DF6F8010C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="EWPGpeeD"
Received: by mail-lj1-x242.google.com with SMTP id n17so19648990lji.8
 for <alsa-devel@alsa-project.org>; Mon, 30 Mar 2020 13:42:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gmG6Nw2gJlFbmNF3ZrYh4WCs9X24BSpQSwGXaDwojEM=;
 b=EWPGpeeD9xPPFMNqQ6vW4zN9xym3eTWIch0s0QCJ2Cy+B1Py/5kXTZOs8CKstvZVGr
 Lzg3JkHf1lrq+CYKHi7QPBwRA4glrwK2KWK4c97VpHc/U8Y3osFvCxn6O+0If0LU0FmM
 /wcHvHhNxpY7g9jWsLg5OGhrQKREZ8ZSgGIUscqLU2yHGiQ+MYa9II4CHdnp4tOxspKh
 mg5Kz/w1Zx7HLaPBDJHf+PMYCKapObCs1GP/IfvzRlN5KViWBgGYiY1WQ9hyC2P4gmnp
 OPz6KVVReN7P6QL5g8NeYzB2YAXMvei9IE3tI2n4yWmMk0yLLM1cHql10O+bjuAJlocy
 lsZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gmG6Nw2gJlFbmNF3ZrYh4WCs9X24BSpQSwGXaDwojEM=;
 b=qDQxI8oV8xPirwnFC8M2H0bQey0t7VA6nLxCPQk85Gq3itZOXDjHCVxw2SjRjgPsqm
 Pv+5TKLwJzdJ6VkrBaGqOzFEWu8wT1mg6zZig0abEi0rjXX0eUc6CdCn/Mb/bKkZVCCM
 65jPRrHUEdMGtuZzRFXO18n+CwzGaaxGkui5IMtlfvUAutRkP4nwigTLi7HB1P/gxh4g
 xkRufl5P61ESLHtwD98TPHSVdt9VKMyPkvxxEAoZ4v7aSS6GZe1jv9qpgTjXZilH6LbZ
 M++vvNAODcxK4XFO4rkTL6kjDTiGhdExneHuVXzDy54z6W04szbFaAaFz8awJ0eAHD01
 0hsg==
X-Gm-Message-State: AGi0PuaLkMwSaKr7YsKleIRSrwZGIpzPqzIicT88fqTyXF8QchkpQpYV
 jBrDzepHtqDnAdYTYefAMMI=
X-Google-Smtp-Source: APiQypJxE6SfhjbuHfxqVIzERON0sXL7oImWTuEjhb77hQureETdjO+AJJ/LqtZPpIH8am9utoTy5A==
X-Received: by 2002:a2e:804a:: with SMTP id p10mr5966662ljg.289.1585600963256; 
 Mon, 30 Mar 2020 13:42:43 -0700 (PDT)
Received: from localhost.localdomain (ppp91-78-208-152.pppoe.mtu-net.ru.
 [91.78.208.152])
 by smtp.gmail.com with ESMTPSA id v22sm7287988ljj.67.2020.03.30.13.42.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Mar 2020 13:42:42 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Stephen Warren <swarren@wwwdotorg.org>,
 Jonathan Hunter <jonathanh@nvidia.com>
Subject: [PATCH v1 0/2] Support headset on Tegra boards that use WM8903
Date: Mon, 30 Mar 2020 23:40:09 +0300
Message-Id: <20200330204011.18465-1-digetx@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
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

Hello,

Some devices have a 4-pin jack instead of a 3-pin and currently the
WM8903 configuration is hardcoded to the case of 3-pin jack in the
Tegra's ASoC driver. A new device-tree property is required in order
to convey that hardware has a 4-pin jack, and thus, microphone's
detection needs to be done in a different way.

In particular this is needed for Acer A500 tablet device that has
a 4-pin headset jack, otherwise userspace sees headset instead of
headphones and internal microphone isn't enabled by ALSA UCM rule
when it should be. Please review and apply, thanks in advance.

Dmitry Osipenko (2):
  dt-bindings: sound: tegra-wm8903: Document new nvidia,headset property
  ASoC: tegra: tegra_wm8903: Support nvidia,headset property

 .../devicetree/bindings/sound/nvidia,tegra-audio-wm8903.txt | 1 +
 sound/soc/tegra/tegra_wm8903.c                              | 6 +++++-
 2 files changed, 6 insertions(+), 1 deletion(-)

-- 
2.25.1

