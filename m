Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A5BC4E0358
	for <lists+alsa-devel@lfdr.de>; Tue, 22 Oct 2019 13:48:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3B75A166F;
	Tue, 22 Oct 2019 13:47:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3B75A166F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571744917;
	bh=l2GNF7HcfjPf15BFbA9kxz/zSspUd5VECHwwg/8zFLE=;
	h=Date:From:To:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=aw6czRKUmfbeFxR/R+45In4h7UJANqhiQbLUS8DKwCTuGWmDYNE8HDI872EzRCJk9
	 pSHL2lcH4DKaDtggUD0sGaj18uAQshBfYgDEltH7Ebwm348bE8Kx31ubu9wOTbbZJy
	 ZcR6N4P1xgwB2wXRwKPPGc9xn02L6/kM4H/5pvsI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 816AAF80322;
	Tue, 22 Oct 2019 13:46:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E77E9F8031A; Tue, 22 Oct 2019 13:46:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
 USER_IN_DEF_DKIM_WL autolearn=disabled version=3.4.0
Received: from mail-pg1-x54a.google.com (mail-pg1-x54a.google.com
 [IPv6:2607:f8b0:4864:20::54a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 608F4F8026A
 for <alsa-devel@alsa-project.org>; Tue, 22 Oct 2019 13:46:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 608F4F8026A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="spSSgg67"
Received: by mail-pg1-x54a.google.com with SMTP id 186so12346920pgd.14
 for <alsa-devel@alsa-project.org>; Tue, 22 Oct 2019 04:46:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=+WgkN+jFywmJXVgKU05Ya5YyFfdneuxiMlHIArCBK5c=;
 b=spSSgg67SiV5zrSWNM7crPZfxyUeNONQ5ZefWzhiBj0HxsRoKAiVIj19ZUUeQ6gfsT
 p+4Vx3dMtOzHcYor+2y11h4PSstY+dErlPoSK4VwkFChu2pMI6IlE4ajoQs/dHLWdMNI
 KqExQndtAmV3SvQUgvYYsUgqjBIpMHH7N1SWBPaU3e4ZX2knnBIgyjUmmn3mU88wGa/7
 UNLtAgnl6E1XT8FDLbZOvvXCXoLG5Rm389sBg1+HX3AmafYXJ8qcPdbZm8yQ2dAhQ0xB
 5f16NXoRuTKjugNcj1Gi8Mo7mKo8ikqrtIeHvhyoy6DMBBkzaDYvBgqKqWkFBU0jE/hl
 JskQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=+WgkN+jFywmJXVgKU05Ya5YyFfdneuxiMlHIArCBK5c=;
 b=mK6Q2sx2RGoWrPOznidPBCFLEr0ZXwl4j7xMdqGC9Xyl8EPx3qJJ91GWHASiq2X0PD
 kO3Ge86ht/t04PiTZUhaQmDwdRpSrnWaO/9ms5YvD6n9yPTdS4+7J7ZC9zrFrDf7g0q8
 gB8M3w1jBFcsNmhSNrJDhxq0P0imzm9XY1yzvz3rqeXIDLOstAR3yZPDcpuoXuVhv+4f
 ypgPeDokPlFpa000VJvdNXlXuHewZj+CItm3Njeb/3y2xcEcqSNJ6oRYwfguSpyTpkxl
 D7E5SjzDR9rL5UDDU3wk4GZxitqG1aLKd5LmZXG/nDonE2PqX4bCkgnye72HOeU6nRbD
 ysYQ==
X-Gm-Message-State: APjAAAWDaU83bAlWn1402Mv8+qiOWBpCeN/esc7gKBv4mQ7JMP+uPKdb
 lq2JH5HBbVMepkgeezHeTfJdXdV92Lj9
X-Google-Smtp-Source: APXvYqy/ziqoEer4WzV0Nf0anG6/SXW8LGXGMhUoQ0nDrgt9a/HYV7SzXWbn1s5tu4qK4rUZHL44Bfeti+4c
X-Received: by 2002:a63:9751:: with SMTP id d17mr3414778pgo.427.1571744804770; 
 Tue, 22 Oct 2019 04:46:44 -0700 (PDT)
Date: Tue, 22 Oct 2019 19:44:59 +0800
Message-Id: <20191022114505.196852-1-tzungbi@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.23.0.866.gb869b98d4c-goog
From: Tzung-Bi Shih <tzungbi@google.com>
To: broonie@kernel.org, robh+dt@kernel.org, narmstrong@baylibre.com
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 cychiang@google.com, jonas@kwiboo.se, allen.chen@ite.com.tw,
 jernej.skrabec@siol.net, dri-devel@lists.freedesktop.org, a.hajda@samsung.com,
 Laurent.pinchart@ideasonboard.com, tzungbi@google.com, dgreid@google.com
Subject: [alsa-devel] [PATCH 0/6] ASoC: mediatek: mt8183: support DP audio
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

(This series depends on https://lore.kernel.org/patchwork/patch/1126819/
 which has not applied to the maintainer's tree yet.)

This series makes mt8183-mt6358-ts3a227-max98357 support DP (display port)
audio output.

ASoC: hdmi-codec: add PCM trigger operator
- add a PCM trigger callback if codec driver is interested in PCM events.

drm: bridge: it6505: bridge to hdmi-codec
- add audio feature support of it6505.
- bridge to hdmi-codec so that ASoC can use the audio feature. 
- defer the "enabling" after receiving PCM START or RESUME event.

ASoC: dt-bindings: mt8183: add a property "mediatek,hdmi-codec"
ASoC: mediatek: mt8183: use hdmi-codec
- bind to hdmi-codec in mt8183-mt6358-ts3a227-max98357.

drm: bridge: it6505: report connector status
ASoC: mediatek: mt8183: support HDMI jack reporting
- use the mechanism from the following patch
https://mailman.alsa-project.org/pipermail/alsa-devel/2019-September/155302.html
  to report jack status (from DRM to ASoC).

Allen Chen (1):
  drm: bridge: it6505: bridge to hdmi-codec

Tzung-Bi Shih (5):
  ASoC: hdmi-codec: add PCM trigger operator
  ASoC: dt-bindings: mt8183: add a property "mediatek,hdmi-codec"
  ASoC: mediatek: mt8183: use hdmi-codec
  drm: bridge: it6505: report connector status
  ASoC: mediatek: mt8183: support HDMI jack reporting

 .../sound/mt8183-mt6358-ts3a227-max98357.txt  |   2 +
 drivers/gpu/drm/bridge/ite-it6505.c           | 191 +++++++++++++++++-
 include/sound/hdmi-codec.h                    |  13 ++
 sound/soc/codecs/hdmi-codec.c                 |  31 +++
 sound/soc/mediatek/Kconfig                    |   3 +-
 .../mt8183/mt8183-mt6358-ts3a227-max98357.c   |  36 +++-
 6 files changed, 266 insertions(+), 10 deletions(-)

-- 
2.23.0.866.gb869b98d4c-goog

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
