Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 276B035ACDA
	for <lists+alsa-devel@lfdr.de>; Sat, 10 Apr 2021 13:15:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A33111607;
	Sat, 10 Apr 2021 13:14:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A33111607
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1618053338;
	bh=sN8Tx3kXRjCcmF8MzCg5CSkqePUZ4fXmJyYijpL98aU=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=bS4XfVfXDLjsfdb8kVlpkvWBzvLSwnZ87YT1wSCShE6lJ0vRzUHq0DzDlMKTn0QjO
	 gWoti0iGrJus5ABS0anDOFQ3WN+BmURUv1iVnc5mW4pdsDaSWiEgSIMHDBf026dE/J
	 b3MVY+fnnbOcLFmoE9s+eYD/gREkrsaGc0nTYkPc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0CB8EF80259;
	Sat, 10 Apr 2021 13:14:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E73EFF8020B; Sat, 10 Apr 2021 13:14:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1B7C2F800EE
 for <alsa-devel@alsa-project.org>; Sat, 10 Apr 2021 13:14:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1B7C2F800EE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com
 header.i=@baylibre-com.20150623.gappssmtp.com header.b="mVZHBg21"
Received: by mail-wm1-x333.google.com with SMTP id y204so2781743wmg.2
 for <alsa-devel@alsa-project.org>; Sat, 10 Apr 2021 04:14:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wVfLNGwq4Y38Oo6/3eTyuo9TqavVMKjShNNhMd2XCcM=;
 b=mVZHBg2124wRfyiC4uft4HMy/RKEVvF0bqoTYK0qL/LTVrHUs7xyJoaN570NvvNCh1
 mOnj8eim20WQ3YBLpNb08m0SrUAcV0SFaa4eJNNPa3tTh+KnFPPrVa1XBZvnDA6uhR4H
 OrejnliC0WDLA4vMKzMx3OglPMumXbkLBuQ/gP74qsncYAYK8oSxwvcLDRSdFhWN9Se7
 myPl9InbdxGNYf0GYLEUukrmW940Ziu2yGEb2DDHbkju6knJNZmap2Vsi95VU7OZM1EI
 5sFR6j/xM3Fy+kQZVKZ57Ib2Rg5BtQ9jyqUcoFHTR8UNWwokClvajsd4wah2aYZz5vRE
 LJoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wVfLNGwq4Y38Oo6/3eTyuo9TqavVMKjShNNhMd2XCcM=;
 b=XUZwIzB4o26pgD24GWovS5T23/ZDU+woY3UMcql/lyAeRlFk9wcpMGm9xglXRMQTsJ
 BI3M5EEP+Uwb+JdeuTxYmSZviT9K7C7c9ocXSvqALFxcPF50rDHghUBx3Rd0+PfVG44N
 ok7UY7jE7BGTZ3hb6ujkrmg82/1XbohDOpyBzpe1tpMRvgJiZah4Agh181bpQo8XbMFc
 HwGHD2v3EDBaXf2ZyflSsvA6sUXOvN0bdkNFaFTE1aN03929JcrTbnblIznJc/Qb0OQ2
 TOR7E/ejRFCnCoAK4DJIYd9zeJ3A40QTPhZl/pkRObjIUNQpKYb3SeopCbDtHD+n6+XB
 eYdw==
X-Gm-Message-State: AOAM531Hr676FaaG4hlvtpGboE+kL2Ac+WxC6DhaOASvE2Cc0vwwHdxN
 76qxkSFPhEw16Niajs5fNp09oA==
X-Google-Smtp-Source: ABdhPJzNqvuGbJt/3Dgix3d7sN0jEOCKmD6hp0FcnKi+oBdbyeLb0E/Ks2dP3/zZnFfs7dMH1Dtb9w==
X-Received: by 2002:a1c:6a03:: with SMTP id f3mr17735443wmc.179.1618053242564; 
 Sat, 10 Apr 2021 04:14:02 -0700 (PDT)
Received: from starbuck.lan (82-65-169-74.subs.proxad.net. [82.65.169.74])
 by smtp.googlemail.com with ESMTPSA id s8sm8370117wrn.97.2021.04.10.04.14.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Apr 2021 04:14:02 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH 0/5] ASoC: clock provider clean-up
Date: Sat, 10 Apr 2021 13:13:51 +0200
Message-Id: <20210410111356.467340-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-Patchwork-Bot: notify
Content-Transfer-Encoding: 8bit
Cc: Stephen Boyd <sboyd@kernel.org>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>
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

The purpose of this patchset it remove the use the clk member of
'struct clk_hw' in ASoC. 'struct clk' is a per-user reference to an actual
clock. In the future, the clk member in 'struct clk_hw' may go away.

The usage of this member by a clock provider usually falls into either of
following categories:
* Mis-usage of the clock consumer API by a clock provider.
* Clock provider also being a user of its own clocks. In this case the
  provider should request a 'struct clk' through the appropriate API
  instead of poking in 'struct clk_hw' internals.

Jerome Brunet (5):
  ASoC: stm32: properly get clk from the provider
  ASoC: wcd934x: use the clock provider API
  ASoC: rt5682: clock driver must use the clock provider API
  ASoC: lpass: use the clock provider API
  ASoC: da7219: properly get clk from the provider

 sound/soc/codecs/da7219.c          | 5 ++++-
 sound/soc/codecs/lpass-va-macro.c  | 2 +-
 sound/soc/codecs/lpass-wsa-macro.c | 9 +++------
 sound/soc/codecs/rt5682.c          | 6 +++---
 sound/soc/codecs/wcd934x.c         | 6 ++++--
 sound/soc/stm/stm32_sai_sub.c      | 5 ++++-
 6 files changed, 19 insertions(+), 14 deletions(-)

-- 
2.30.2

