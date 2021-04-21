Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8384D366A6E
	for <lists+alsa-devel@lfdr.de>; Wed, 21 Apr 2021 14:07:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 06B9C1687;
	Wed, 21 Apr 2021 14:06:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 06B9C1687
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1619006838;
	bh=fvh0pxaN294apkXvhIXyppd9U5z6fuhFp1jHrtb2cjM=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=PPNL3frZjoOliP7HkPERXjdHcIGist2kRIh7zfAVVA+bXM92Z4bsaI0dPYTETuQPp
	 A9ohwd/5LAT17kJxsttkFNFaspAipga3SK73Qj5eQT0AtJ/QVWSVVmUi5QF1+CYV2K
	 +9D/ZopsjwPBWZX9c6GbhPnu+Yzhl1xqsq7po6Ng=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7D280F80276;
	Wed, 21 Apr 2021 14:05:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3F0F4F800E8; Wed, 21 Apr 2021 14:05:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 11F81F800E8
 for <alsa-devel@alsa-project.org>; Wed, 21 Apr 2021 14:05:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 11F81F800E8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com
 header.i=@baylibre-com.20150623.gappssmtp.com header.b="TxH7oAz9"
Received: by mail-ej1-x631.google.com with SMTP id mh2so41586954ejb.8
 for <alsa-devel@alsa-project.org>; Wed, 21 Apr 2021 05:05:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MRPJS1ijITk2FOQ9jFOtPrHo+61HYV+8yTL1dDNYHhg=;
 b=TxH7oAz9J7xB9yjMFVUrNyASbL0yCLVBFWU+m3D5imK63lIlt6ybraK7fS7gQfeC2h
 mNJBEL8Q3lTukmpnbCfm6CA5jUVr+hXjvjcDJAzGoY6lmwxpXIQLWzPpPkuBEne3ijpL
 /iDO8YrxA3JL4OqM+959s1NY+tJVo8FR8Pb9XdqTNV/H+7Tg39Utlwu7bgU1C1y7XcpR
 +P1rXy9ruqD/X01ib84GAlIfbNHIAix/00CnoHSDsZpPTbI8cdY0rA/+w2OAAPfjmJ5E
 2rtojgTPMnRdzsOcNB070nPsOCbZpWIe9g3yDhLyerM16NBgnPqfmwACnM4lnfFB+Mbz
 n6uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MRPJS1ijITk2FOQ9jFOtPrHo+61HYV+8yTL1dDNYHhg=;
 b=Dy9EpPXsLFTOzSxRGQD8BNHZtsqedr2PtPkXXGzOB+WU8Dmj+Y8kEEQ8uI20YJ4Yzi
 YMKMnULg7JTDDNu9YFqdJwSmWT2teDzmBcAhEmTBoE9CM9ZMJIiXGmiOj/iMlxDvxBIY
 hNTbe/M0ZgU27mAk4N5UBds7JWPZpa1TvrLR4ArTY/fDT0yCT18txar8sdTeqpDFYxFq
 Ad+N37spJdcwPaOUJ1gW11fcSaEpfgF/MLeTJbS8Nlv2wYq7HYqiN0OBZF6IL+UTGQ9q
 B1e1gjt9eg1bo4JR06uTYETkNtB6E6uO6mqVfAspezVkkhM6yPESQI0O+NKLyYaNE4oF
 qvcA==
X-Gm-Message-State: AOAM531O7oU1/JK4lQmZXTY4B5Go4EZNEWObdly4AtQUFiS0oUvtqnRZ
 oX0sAsSNZmWXtDIhhJjCG3vA0g==
X-Google-Smtp-Source: ABdhPJx6FaYPXOraxyEEDHilMPM6iOAQV4mxrX/r/fiUVlv7V6Q8gic6ywfauVgc5c1nhG1hfBFUvQ==
X-Received: by 2002:a17:907:294f:: with SMTP id
 et15mr32179306ejc.14.1619006737133; 
 Wed, 21 Apr 2021 05:05:37 -0700 (PDT)
Received: from localhost.localdomain (82-65-169-74.subs.proxad.net.
 [82.65.169.74])
 by smtp.googlemail.com with ESMTPSA id n2sm3151431edi.32.2021.04.21.05.05.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Apr 2021 05:05:36 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>
Subject: [PATCH v2 0/5] ASoC: clock provider clean-up
Date: Wed, 21 Apr 2021 14:05:07 +0200
Message-Id: <20210421120512.413057-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.31.1
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

v1 [0] -> v2:
 * finalize lpass provider move to devm

[0]: https://lore.kernel.org/r/20210410111356.467340-1-jbrunet@baylibre.com

Jerome Brunet (5):
  ASoC: stm32: properly get clk from the provider
  ASoC: wcd934x: use the clock provider API
  ASoC: rt5682: clock driver must use the clock provider API
  ASoC: lpass: use the clock provider API
  ASoC: da7219: properly get clk from the provider

 sound/soc/codecs/da7219.c          |  5 ++++-
 sound/soc/codecs/lpass-va-macro.c  |  7 ++-----
 sound/soc/codecs/lpass-wsa-macro.c | 11 +++--------
 sound/soc/codecs/rt5682.c          |  6 +++---
 sound/soc/codecs/wcd934x.c         |  6 ++++--
 sound/soc/stm/stm32_sai_sub.c      |  5 ++++-
 6 files changed, 20 insertions(+), 20 deletions(-)

-- 
2.31.1

