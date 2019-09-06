Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CCE0AC0DF
	for <lists+alsa-devel@lfdr.de>; Fri,  6 Sep 2019 21:49:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B32D6886;
	Fri,  6 Sep 2019 21:48:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B32D6886
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1567799363;
	bh=ROVKSNeZOX/OhES5lnQcCkQJYKUitaSZIzEb/ASsZF0=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=LeWzkagNLYEcLygE2SuuZN8TSKEdodZEbpRV/PPs/dOaCu1z2VPfSUvkOu/Y799as
	 A9XrZiPpR/yr3FR9O2mHX+GTBlmWrtW+apk6PLQHBgkqfINsgezPKkKvasAkvyzUKm
	 Ws01XVAHGRAC5JT8TV6xJlEefEs63u/d7p07kg6A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 99B6FF80447;
	Fri,  6 Sep 2019 21:47:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 91EA8F80394; Fri,  6 Sep 2019 21:47:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com
 [IPv6:2607:f8b0:4864:20::52b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CA066F80214
 for <alsa-devel@alsa-project.org>; Fri,  6 Sep 2019 21:47:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CA066F80214
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="U9pIQxmJ"
Received: by mail-pg1-x52b.google.com with SMTP id u17so4068286pgi.6
 for <alsa-devel@alsa-project.org>; Fri, 06 Sep 2019 12:47:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/+pBw1BDQDdt9yLSBkNpPuyhjNRM/eCkSYvkf+42s+g=;
 b=U9pIQxmJdlZVIFnt+kWQiy/JMFHeF+dh8aYQxrVimMHcnLgfaKvLL75Rdr8BeJRiVK
 k1ecL+vaD81pckhDiAWMvVyhiZ+EBK8otDaOut7PHS9++nFwhdvAC2vTz3pTLyrgzyb7
 WFYo4BDKMS5O4gfxuu4y4+bkVyi+snD9+asQc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/+pBw1BDQDdt9yLSBkNpPuyhjNRM/eCkSYvkf+42s+g=;
 b=lRJSDbMfAllO9o7OlL2uDk0QkPW0ZLBcV2XpEyYTrYHGJGN05sE0AIriBL+13ERF8T
 Jj1r7EbKUgdZ9eFhbnhfY+BKBozh/rNQE5qQsWjvS5/RREjQJjZi3KA4V6kXPvOlF7cY
 sxLICiMgRda6sjrNMSnlewFoiW05ituQpUy4mX/GPGB+ttACyfhYqGMNcap8ZdGQijKa
 Rg5JGrNsgv06mopL8wlHmg352TORPUtH1TiUBY97wbSO9Hu/uBxArBGrwG72sxlztNYH
 YY4LBqyrwIvsWp4J4T+mK8y97leByYL2TxOxOoQtMYnSuw2/ZKNhcmVGvYn9AP7Jsm/k
 WubA==
X-Gm-Message-State: APjAAAUvA4PX4RVF3hbGXDfny7xNjHZknEPwyWu5H9vPTSZUEMCM+WZM
 bhAAbCl/HU/MDNAaYlLqHQ4NvC6MLg==
X-Google-Smtp-Source: APXvYqxnW5WkM4GgnqjRgjnq1suZfD5li8y0YG24mAVudbYw3X//41SuvD+OVUCDsIX6xKUXImnAMQ==
X-Received: by 2002:aa7:8c01:: with SMTP id c1mr12886375pfd.224.1567799248801; 
 Fri, 06 Sep 2019 12:47:28 -0700 (PDT)
Received: from localhost ([2620:15c:202:201:c87a:31ae:9107:f63d])
 by smtp.gmail.com with ESMTPSA id 69sm9538060pfb.145.2019.09.06.12.47.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Sep 2019 12:47:28 -0700 (PDT)
From: Curtis Malainey <cujomalainey@chromium.org>
To: alsa-devel@alsa-project.org
Date: Fri,  6 Sep 2019 12:46:22 -0700
Message-Id: <20190906194636.217881-1-cujomalainey@chromium.org>
X-Mailer: git-send-email 2.23.0.187.g17f5b7556c-goog
MIME-Version: 1.0
Cc: Curtis Malainey <cujomalainey@chromium.org>
Subject: [alsa-devel] [RFC 00/15] Add Samus Hotwording for RT5677
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

This patch series adds the hotwording implementation used in the
Pixelbook on the RT5677 driver.

Known Issues:
There is a known issue where the system will fail to detect a hotword if
suspended while the stream is open. This is due to the fact that the
haswell-dsp suspends its I2S MCLK before the RT5677 suspends which
causes the writes and reads to become corrupted as a result. Any
recommendations to correct this behaviour would be appreciated.

Ben Zhang (12):
  ASoC: rt5677: keep analog power register at SND_SOC_BIAS_OFF
  ASoC: rt5677: Add a PCM device for streaming hotword via SPI
  ASoC: rt5677: Load firmware via SPI
  ASoC: rt5677: Auto enable/disable DSP for hotwording
  ASoC: bdw-rt5677: Add a DAI link for rt5677 SPI PCM device
  ASoC: rt5677: Enable jack detect while DSP is running
  ASoC: rt5677: Use delayed work for DSP firmware load
  ASoC: rt5677: Add DAPM audio path for hotword stream
  ASoC: rt5677: Mark reg RT5677_PWR_ANLG2 as volatile
  ASoC: rt5677: Stop and restart DSP over suspend/resume
  ASoC: rt5677: Transfer one period at a time over SPI
  ASoC: rt5677: Disable irq at suspend

Curtis Malainey (3):
  ASoC: rt5677: Remove magic number register writes
  ASoC: rt5677: Allow VAD to be shut on/off at all times
  ASoC: rt5677: Turn on MCLK1 for DSP via DAPM

 sound/soc/codecs/rt5677-spi.c       | 401 ++++++++++++++++++++++
 sound/soc/codecs/rt5677-spi.h       |   1 +
 sound/soc/codecs/rt5677.c           | 496 +++++++++++++++++++++++-----
 sound/soc/codecs/rt5677.h           |   9 +-
 sound/soc/intel/boards/bdw-rt5677.c |  18 +
 5 files changed, 843 insertions(+), 82 deletions(-)

-- 
2.23.0.187.g17f5b7556c-goog

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
