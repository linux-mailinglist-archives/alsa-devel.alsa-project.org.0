Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 05C431B07F8
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Apr 2020 13:47:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 59940167F;
	Mon, 20 Apr 2020 13:46:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 59940167F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587383225;
	bh=X/PFYFBlPn/LrjkTIoqhllpJZLpWxFI3gRRdobdTGyM=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=DPGuHvOXanQSAwEarO6K3l+diW6abZGJgwEENQfU8060CzRCEPFyA4fC0QY42FvpX
	 i05x/C4TT3SZKdcMpac4/m5DQ/SdS8Hdw2nGoPV83XIF1y7Wt/lfWehbpo8Ko5bGUY
	 lzK7GVY04u43s7MwvGij75znwHFVFGcpyrsAcmuo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 74FEBF8023F;
	Mon, 20 Apr 2020 13:45:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6BF67F8012F; Mon, 20 Apr 2020 13:45:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EF227F8012F
 for <alsa-devel@alsa-project.org>; Mon, 20 Apr 2020 13:45:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EF227F8012F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com
 header.i=@baylibre-com.20150623.gappssmtp.com header.b="toP4RMhU"
Received: by mail-wr1-x443.google.com with SMTP id k1so11753229wrx.4
 for <alsa-devel@alsa-project.org>; Mon, 20 Apr 2020 04:45:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Js3BwZvrnmv59gBsa8L+RXAHWUzXe67eM8n2qWb5Mz8=;
 b=toP4RMhURcT2XtJ5IfaNiVVMaFbXgEXTIWryVnnOFRVg4W/3f6KveFzVXcfoRSd5tE
 tjtgT3qVz9O3YuNnumTHRASWh6a2tMStFb8/5gCqfCdviE8Z92aaKzbQpS3Sb4WiZY5j
 C1KhJp5Uc9oXuf1TGfX5IgjKJexw5kJo+0AXQTmVhZXj7CR9DxqqrkJksDCLz9B/gw1P
 uEUguP8XlxstZnBCY5q8YKX2pH2jUsDWz7/J6ynIhVzrRwI57CgiQ0hIkx5PCDhFhdfb
 eyy26zW5jTJqloK1P0aW4HEnvaPrqCPA/FsGry4AsYG+X02Qb4H0ArRuZN0CYSm0Iace
 L0PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Js3BwZvrnmv59gBsa8L+RXAHWUzXe67eM8n2qWb5Mz8=;
 b=Mg280xI2p5tokt0fbrjlzC5AOGqi3op/MbmXTiL2VsS98Cn3PP7r1JiqJRnZ5oZzN7
 d/uHKT1Iz5D6mo9nacBX2bxLpJWdlXIr/iP6sUPX42kWM9fq3O/vuQN6Wfj/b3uUdQgE
 +L7mXxQit/JyU0F7qPXUNyDIn6aiTiNYKuEPrCRClLcL3+U2kA4rTus0F65pZOVFEJun
 GDORCSDPZlwmQCIy/qBZwhQUDcMxV5zALL3jFZQ0mRSJjptkLWbTiKm0GU6NELTlttrF
 T44qBxiFGpZYXuHMGVyvKQVTgqNLBGFrHiKeqCDd0XVTQlqQgy96E4XyZghr9cslg6Qb
 FLuw==
X-Gm-Message-State: AGi0PuYA0u6kYHNI+1X0WX/o5TYAUNxUWYayAJigWvvu38LTmWrQHiiQ
 qWHEPhmePEeTaiEQLCZZe6wSwg==
X-Google-Smtp-Source: APiQypKI1KRjPuhgF6AbUXwJ9ryl2ikHEYgGv5Bk7mnI4calt5WkvXgxuOL8mEH2qlqfsPZCsMLQFg==
X-Received: by 2002:a5d:574b:: with SMTP id q11mr18765094wrw.324.1587383115925; 
 Mon, 20 Apr 2020 04:45:15 -0700 (PDT)
Received: from starbuck.lan (cag06-3-82-243-161-21.fbx.proxad.net.
 [82.243.161.21])
 by smtp.googlemail.com with ESMTPSA id k6sm1079182wma.19.2020.04.20.04.45.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Apr 2020 04:45:14 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH 0/2] ASoC: meson: fix codec-to-codec link setup
Date: Mon, 20 Apr 2020 13:45:09 +0200
Message-Id: <20200420114511.450560-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.25.2
MIME-Version: 1.0
X-Patchwork-Bot: notify
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
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

This patchset fixes the problem reported by Marc in this thread [0]
The problem was due to an error in the meson card drivers which had
the "no_pcm" dai_link property set on codec-to-codec links

[0]: https://lore.kernel.org/r/20200417122732.GC5315@sirena.org.uk

Jerome Brunet (2):
  ASoC: meson: axg-card: fix codec-to-codec link setup
  ASoC: meson: gx-card: fix codec-to-codec link setup

 sound/soc/meson/axg-card.c | 4 +++-
 sound/soc/meson/gx-card.c  | 4 +++-
 2 files changed, 6 insertions(+), 2 deletions(-)

-- 
2.25.2

