Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C6C84359E
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Jun 2019 13:44:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7DB391812;
	Thu, 13 Jun 2019 13:43:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7DB391812
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560426271;
	bh=FCdAGp6ljzbkFA8ex3Fey5yndwrSfjNCVTm+0qZGChM=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=GXVdNN9xtv+Wl+Kf+TJi1QU6GWeYaMYqANUw/2J+hzaI9bLCTyIWCH2OoX6PT3oZX
	 luS6LR/zweKUIrKXX24E6XymVuWFPMaWOPZWQ5TXaOMZiCes+1Bki1419uetCDg+Yc
	 GCtTe4BH0EUPC6pwtXBmZoqEi9F3ZAWZkuOABw5w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D57B6F80794;
	Thu, 13 Jun 2019 13:42:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 72BA9F89711; Thu, 13 Jun 2019 13:42:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 20F18F80794
 for <alsa-devel@alsa-project.org>; Thu, 13 Jun 2019 13:42:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 20F18F80794
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com
 header.i=@baylibre-com.20150623.gappssmtp.com header.b="JX7JAnlp"
Received: by mail-wr1-x436.google.com with SMTP id r16so1268980wrl.11
 for <alsa-devel@alsa-project.org>; Thu, 13 Jun 2019 04:42:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=M0ZsHoiBuMTfOtADEzvR2C+3smzJtpOELu9NU33cfes=;
 b=JX7JAnlpC/5ro2x6Z+UAAbgxEG6zPqcxepO1yDEMKgXmun2iUYPZZfOtSXWXCup0J2
 zQ5Xe7sW3kEQ+83pe2ATBIcTRs1j6rTohOJedQT7LPzqQVJqqWw4cqOIqPrUC+oAYMRk
 lRLwy91wlqN1FX84m0R+znr/UC86Lr5yuqkcyi3aApJz65ybTrTPXb09MIBe+bXscuAB
 +i1cKAAKpK0cdVBUcEeMUL7sAZ0AusGK2aTVK03bSsf1eKp3xeWyvOtSra0UCKR+22Uf
 Cg/Trn/YM21oupZfSfYVEdr7taJjnDZ1a1IJQ+bQ0wAaKtLMgSdqPzI8AVk+MWDmcIsV
 t6PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=M0ZsHoiBuMTfOtADEzvR2C+3smzJtpOELu9NU33cfes=;
 b=hMFo+aGX9rnFE9KA+J3fGGgc4xMx+33gGfiidV2RJsA5GQqsYcxKw7IPvdQyXzsCOK
 rdEyIJuv/wZNr8h6jlt1Bqex8oR2BpG4lTQQRJ1JB36/lU4yxW1etgOIVTrPruPBYpfM
 6RLL0xlFM0erwP07Nc7ujwYiHKMTd6Kn4YEktCrXFUB/7xI4/kfITKFuXx3v2Jy0CbNn
 eel5gCS0i+KtgosvGwdKpUTigrtf7zpplqCcXIqIY5gl5RylzHK/bJPmQ8S3rF+b2Owi
 icQeJTLwui8GATCjqkxYuDUuwgBVuBNRBKCciitNaHgu5b3T+pHsm9cHtA20IR/ncurp
 HZxQ==
X-Gm-Message-State: APjAAAWpwFYShGXiy8KbqPwBd4eTxcGLTSjZI8NQU+1PpoASsy6GoQZe
 mi4uZVy08Qv/cJhrX+MNWecmcA==
X-Google-Smtp-Source: APXvYqxsB0lJVQCFeg50GG0zAhStyAzrsN1OVM00ronb52Gz/5ZCc1kOTBrm5qHA0vi5//v9WpyGEg==
X-Received: by 2002:a5d:624c:: with SMTP id m12mr41557303wrv.354.1560426159084; 
 Thu, 13 Jun 2019 04:42:39 -0700 (PDT)
Received: from boomer.local (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id b5sm2598490wru.69.2019.06.13.04.42.38
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 13 Jun 2019 04:42:38 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Kevin Hilman <khilman@baylibre.com>
Date: Thu, 13 Jun 2019 13:42:29 +0200
Message-Id: <20190613114233.21130-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Patchwork-Bot: notify
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 Jerome Brunet <jbrunet@baylibre.com>
Subject: [alsa-devel] [PATCH 0/4] ASoC: meson: axg-tdm: i2s format fixups
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

The patchset fixes a few mistakes regarding the format on the i2s bus
on the Amlogic axg tdm drivers.

Jerome Brunet (4):
  ASoC: meson: axg-tdmin: right_j is not supported
  ASoC: meson: axg-tdmout: right_j is not supported
  ASoC: meson: axg-tdm: fix sample clock inversion
  ASoC: meson: axg-tdm: consistently use SND_SOC_DAIFMT defines

 sound/soc/meson/axg-tdm-interface.c | 4 ++--
 sound/soc/meson/axg-tdm.h           | 2 +-
 sound/soc/meson/axg-tdmin.c         | 1 -
 sound/soc/meson/axg-tdmout.c        | 1 -
 4 files changed, 3 insertions(+), 5 deletions(-)

-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
