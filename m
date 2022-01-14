Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1860C48F0D9
	for <lists+alsa-devel@lfdr.de>; Fri, 14 Jan 2022 21:18:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9A4D01EE6;
	Fri, 14 Jan 2022 21:17:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9A4D01EE6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1642191504;
	bh=YUsST3iReYZOt4V6On1r5vumXPxAVm+QVxBQ9itK/2o=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=PhdnBBqPQ0QBNzYptbJiu1HVFZiPar1jOdsNKG0k1PYdh203N25EhSlxDduBgVVPA
	 R8kxtuoyaRgvcbJUAs4FQu6Wv+3rIS4uVFRUuHB5KHQtA46jAOii7KRGjv+IcL/1Ny
	 lRdMpIdKfdljnhlE58N2K79FiFSOFrozcWew2cjc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 168CCF80310;
	Fri, 14 Jan 2022 21:17:17 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A03C2F8030F; Fri, 14 Jan 2022 21:17:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com
 [IPv6:2607:f8b0:4864:20::62f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DE789F800CE
 for <alsa-devel@alsa-project.org>; Fri, 14 Jan 2022 21:17:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DE789F800CE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="hPBL7+Gz"
Received: by mail-pl1-x62f.google.com with SMTP id a7so11271062plh.1
 for <alsa-devel@alsa-project.org>; Fri, 14 Jan 2022 12:17:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1KlPp5hV7fm0qq5cqvD5aoj0BfkxebgR6vlczP+kuR0=;
 b=hPBL7+GzXtx7Xy9BNRGobBHcJh3in4NXqnnYC06hntRlpfp/vjmD9i9XpuCMkppYe0
 KTPskbaS26eaCBp9BJJSJSoDjVC7Re+360GTMca2engSbymUQqzvGV7YvvxDdrJ6Auu1
 1qigxd68D5GnHmbXdB/NPhH0nNGBQ1nZC2LHQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1KlPp5hV7fm0qq5cqvD5aoj0BfkxebgR6vlczP+kuR0=;
 b=OEISutcpw/3OxG7imij46r/hZeWqAeX/FKc1dNBMCvJmhj2KUW9o+QoHoZSzlK+uh6
 LDnkGGBYrdz+Ag2wPPbZifWCqN+36Rc2rBffNSEqqA/ykL7VQzpI9MhcwwSzoRkxNQcU
 XH4KF2sKsOetwAOreebz3rUfs4Mwr3S7YSO/u24LoHWu9N6cZrrbdt8I8FYLu0RRHI5z
 8a990jnrREe1oalBBwu2kKFXYV3+ySx55ebST02nyka7JCpG16cgfLY9FMMfJaZeXcyE
 LvFlFruwG12uFcA/2mEs6D83Aju4WBkPZpzI0DusMpcPssmOR8kH1AkLyak57LW6/Ek6
 wMbQ==
X-Gm-Message-State: AOAM530MDokylC+tLBePD6tEgZXCNh6r4xBI0BL6yUk5G5JTb+R31Dwu
 CQoDngIQsIYoPmb42/nr1WcDUg==
X-Google-Smtp-Source: ABdhPJyYDhYmzb1m8B5ltHSl6+g7+4DhFkP602unTzHjzxK1IseRAPUhU48jZq5jKbANYv16P6nwIQ==
X-Received: by 2002:a17:902:ea07:b0:14a:45c0:78a7 with SMTP id
 s7-20020a170902ea0700b0014a45c078a7mr11123208plg.92.1642191430200; 
 Fri, 14 Jan 2022 12:17:10 -0800 (PST)
Received: from localhost ([2620:15c:202:201:76ab:ede1:503d:1c39])
 by smtp.gmail.com with UTF8SMTPSA id q12sm6599881pfk.136.2022.01.14.12.17.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Jan 2022 12:17:09 -0800 (PST)
From: Brian Norris <briannorris@chromium.org>
To: Heiko Stuebner <heiko@sntech.de>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 0/3] (Re)enable DP/HDMI audio for RK3399 Gru
Date: Fri, 14 Jan 2022 12:16:49 -0800
Message-Id: <20220114201652.3875838-1-briannorris@chromium.org>
X-Mailer: git-send-email 2.34.1.703.g22d0c6ccf7-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Lin Huang <hl@rock-chips.com>, Brian Norris <briannorris@chromium.org>,
 Sandy Huang <hjc@rock-chips.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
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

This series fixes DP/HDMI audio for RK3399 Gru systems.

First, there was a regression with the switch to SPDIF. Patch 1 can be
taken separately as a regression fix if desired. But it's not quite so
useful (at least on Chrome OS systems) without the second part.

Second, jack detection was never upstreamed, because the hdmi-codec
dependencies were still being worked out when this platform was first
supported.

Patches cover a few subsystems. Perhaps this is something for arm-soc?


Brian Norris (3):
  arm64: dts: rockchip: Switch RK3399-Gru DP to SPDIF output
  drm/rockchip: cdn-dp: Support HDMI codec plug-change callback
  ASoC: rk3399_gru_sound: Wire up DP jack detection

 arch/arm64/boot/dts/rockchip/rk3399-gru.dtsi | 10 +++----
 drivers/gpu/drm/rockchip/cdn-dp-core.c       | 28 ++++++++++++++++++++
 drivers/gpu/drm/rockchip/cdn-dp-core.h       |  4 +++
 sound/soc/rockchip/rk3399_gru_sound.c        | 20 ++++++++++++++
 4 files changed, 57 insertions(+), 5 deletions(-)

-- 
2.34.1.703.g22d0c6ccf7-goog

