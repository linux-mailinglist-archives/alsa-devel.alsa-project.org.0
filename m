Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D97132321D9
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Jul 2020 17:47:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 284D91707;
	Wed, 29 Jul 2020 17:46:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 284D91707
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1596037621;
	bh=5gmYp4HFQbg6xemHt3uq+mqQjq/KTsafBZ7oraSMs+4=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=OjdCBzvNju1/ASsCXJWbsGWY582jMy+Ni5mmg7IdIL4H+emPjbchDBMFwrcsoWLta
	 2uF9se06qK+g+5nooYqNYDPif4dQNbp+GfxARudqwgoGRlQK+Luu5mXrLBCpQIzwHj
	 awrN49xZWxX0Vj/0Wz8fpBPejqcdJ5eBB+IZXpaA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3DDBEF801D9;
	Wed, 29 Jul 2020 17:45:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A5660F801A3; Wed, 29 Jul 2020 17:45:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0E110F8012F
 for <alsa-devel@alsa-project.org>; Wed, 29 Jul 2020 17:45:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0E110F8012F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com
 header.i=@baylibre-com.20150623.gappssmtp.com header.b="b+VLFMtt"
Received: by mail-wm1-x344.google.com with SMTP id d190so3140083wmd.4
 for <alsa-devel@alsa-project.org>; Wed, 29 Jul 2020 08:45:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tZyrzrT0Nf0x/gyHGp8Cs5MnYb93JhfVD87ZJN1UfIU=;
 b=b+VLFMttcd/AFDxmAsi8VtfuqKDOuaZmXWDAIR/zZ4938MhI4865tTZFGExVfPlBhL
 xLVpSRa6XIhOa+/LP36WaI+2tTZ47GBE9T7gjF+py7giHDrzvkqNyJDvY8382KJNGuVp
 cCjiAw4lVH6uHGR/w6SHFGvU6rIoHbjXgKk2sNWkwv1KGUqiz/nlCfhOix6wC66nQHMS
 t4h1iSP+MVInoN7KMc6D+Rq2vTPy96OMNY9jGhFGRg/JYdivPqc9sGz2XMoh3oR4jqFs
 rnquzA/xfhfueM7cuqjDDJNQuZZUwW2IjIgGWZhDbk0px+wYgok0PiRTq86MuaEBiuo5
 GnIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tZyrzrT0Nf0x/gyHGp8Cs5MnYb93JhfVD87ZJN1UfIU=;
 b=mQeIH63G1+DZT0h/oMGsI6ACph4FUmHJt18BECKTVdGoukL+5f0Zy+WGK7ER72IeJa
 K55sClA7AVkiwQZn7mm7rM9UL90IRHTkecZ0vilA2lATwmd6m/HYutPbl0u8p/LIqbc/
 6nm8H5pq34p4QeTrnLcEb0TB+RoiT188N+dORTYA8khta9Cn0Cw6MxtBYusP5Sowg3HF
 hBFHWOoTs37AXTV1/vd07lt/37UXPER4aG51x3Jzu8Y8dQ9cGrNeEJZLOX6QDeA1Y/f5
 Z+4cZ6DXSA4w8Koc7dDQj6DuyFkUR+hut78fkTBcycJnNrMctbhFQl3btEhUVFqXwIyi
 QvEg==
X-Gm-Message-State: AOAM532ISh4UjLy1z1kTCFqzvnQd1G+TCYpskq0cnKskIgCbZuoySFMw
 inHjtpBoAy5K5HbFY8i13howTQ==
X-Google-Smtp-Source: ABdhPJw5uFTrnEpbYb0n1UKwvaYWnjt8taRop48MzCBBqK0z4sbTETQUcnZx4nGuZE6MZ/Ja7pWWdw==
X-Received: by 2002:a05:600c:284:: with SMTP id 4mr9474888wmk.48.1596037512993; 
 Wed, 29 Jul 2020 08:45:12 -0700 (PDT)
Received: from starbuck.baylibre.local
 (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id k10sm5950967wrm.74.2020.07.29.08.45.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Jul 2020 08:45:12 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH 0/4] ASoC: meson: tdm fixes
Date: Wed, 29 Jul 2020 17:44:52 +0200
Message-Id: <20200729154456.1983396-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
X-Patchwork-Bot: notify
Content-Transfer-Encoding: 8bit
Cc: linux-amlogic@lists.infradead.org, alsa-devel@alsa-project.org,
 Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org,
 Jerome Brunet <jbrunet@baylibre.com>
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

This patcheset is collection of fixes for the TDM input and output the
axg audio architecture. Its fixes:
 - slave mode format setting
 - g12 and sm1 skew offset
 - tdm clock inversion
 - standard daifmt props names which don't require a specific prefix

Jerome Brunet (4):
  ASoC: meson: axg-tdm-interface: fix link fmt setup
  ASoC: meson: axg-tdmin: fix g12a skew
  ASoC: meson: axg-tdm-formatters: fix sclk inversion
  ASoC: meson: cards: remove DT_PREFIX for standard daifmt properties

 sound/soc/meson/axg-tdm-formatter.c | 11 ++++++-----
 sound/soc/meson/axg-tdm-formatter.h |  1 -
 sound/soc/meson/axg-tdm-interface.c | 26 +++++++++++++++++---------
 sound/soc/meson/axg-tdmin.c         | 16 +++++++++++++++-
 sound/soc/meson/axg-tdmout.c        |  3 ---
 sound/soc/meson/meson-card-utils.c  |  2 +-
 6 files changed, 39 insertions(+), 20 deletions(-)

-- 
2.25.4

