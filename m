Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 146805E37E
	for <lists+alsa-devel@lfdr.de>; Wed,  3 Jul 2019 14:09:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7858D1680;
	Wed,  3 Jul 2019 14:08:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7858D1680
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1562155743;
	bh=ePwKp0jRXgUxZFHdncTJT4dR0vQK2EyODUXwshXMHls=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=sC8gpAVBrM27jMsMk+6SfP4WFLaKxq7fSULRh+HIOz+kTNJcnLKsykHC/t8oPqFKD
	 7C0vGiLXTwKToFmx+rhH7nhMqsSZxgtGDIV28L4moAsHHG8Gr6lZQNQ4ENaRraeY3A
	 qCta092VsH1vZtCdW+zBMNVt+uAKVti/OSJWu3OA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 26EE4F800F4;
	Wed,  3 Jul 2019 14:07:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 11E77F800F3; Wed,  3 Jul 2019 14:07:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BDC44F800E8
 for <alsa-devel@alsa-project.org>; Wed,  3 Jul 2019 14:07:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BDC44F800E8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com
 header.i=@baylibre-com.20150623.gappssmtp.com header.b="tSLd8Mxk"
Received: by mail-wm1-x343.google.com with SMTP id a15so1937639wmj.5
 for <alsa-devel@alsa-project.org>; Wed, 03 Jul 2019 05:07:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=58+wQHNFY1FZ9kJxcysuLiIfPy4FWwdFF39AnxV0wiw=;
 b=tSLd8MxkTDIPty1ZVy45elawWaFPNF6Jg+TYasAX7ii2/0G5N+lecXsA1agJGG7Bzj
 jTwgdSonkOIGaHbx6jnquaosIGpfBZ8Y3e//zVbY0zxRQiJJgwt8IITWTL5c88nVfC79
 WBDfT9KGTVQa8fGWOmd4MBKFx6l+VbHJ2IGT5pmP3PjoObMo2ZTeVYFCIn0nc1Q4CqIl
 UsF+Gy+vE4kEyuI/oIs+GSQKgJzE1O/YBWZx91bBoZJFigDpLfKgZDYFgVLdI4ukLrAP
 cV2AyhrXuRbrYceJ473DrvMJmtIXCxj26Fqgt9cqpd9yZpFmRa7NWLlAz9XNF/2pPL7M
 ejdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=58+wQHNFY1FZ9kJxcysuLiIfPy4FWwdFF39AnxV0wiw=;
 b=HnmpKEnxaDW8kt/UY3epC9szJXwcinGd+MemH0kpWrCFYC8tXbBZa4pPvy55SHRSWR
 V29zf0WwfIp/eP38y/GfnTpQiR681Hj0t0xrGSEUA7zFzVhFOi8E5jRWXxMXNPsbD0aI
 K+FHpfrjtgFPPFXuoHwsAu9HoeOHNSy+aSTKepM4WBBiedMu7aixhq1GNZGphICqCVHr
 OlDq8Gbk9oF4N2lARe+OyD3YVd8eOfPOKEx99ewMx2yTMNLI4hQD6lcD9EbPTrbOG9NF
 b2BusbNHrwqsxXDYkiMylB2bkOMPMKy1dY0Su6gg8gEZKy86Hh/QJ5Gq8xehxOXLS/m0
 Zucw==
X-Gm-Message-State: APjAAAV/f6Sp3z7jjKijrq9ahsinK3+Eyal075orTZYVkhcyN8Hnz/Eg
 wmRImE5MNiasKII7wiMSyvUIGA==
X-Google-Smtp-Source: APXvYqyBMzzq4idwjAjHjTuoGLGjP+FyAOgZQbzeVCROJZPeqmJuXI+iq9gE/QUUnzONCZaeN9B1FQ==
X-Received: by 2002:a1c:96c7:: with SMTP id y190mr7250688wmd.87.1562155673832; 
 Wed, 03 Jul 2019 05:07:53 -0700 (PDT)
Received: from starbuck.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id z126sm2767638wmb.32.2019.07.03.05.07.52
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 03 Jul 2019 05:07:53 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Kevin Hilman <khilman@baylibre.com>
Date: Wed,  3 Jul 2019 14:07:47 +0200
Message-Id: <20190703120749.32341-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-Patchwork-Bot: notify
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 Jerome Brunet <jbrunet@baylibre.com>
Subject: [alsa-devel] [PATCH 0/2] ASoC: meson: axg-tdm-formatter: add g12a
	reset
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

This patchset add the possibility to provide a reset to the tdm formatter.
Such reset is available on the g12a SoC family and helps solve a random
channel output shift when using more than one output lane.

Jerome Brunet (2):
  ASoC: meson: axg-tdm-formatter: add reset to the bindings
    documentation
  ASoC: meson: axg-tdm-formatter: add reset

 .../sound/amlogic,axg-tdm-formatters.txt      |  6 +++-
 sound/soc/meson/axg-tdm-formatter.c           | 29 +++++++++++++++++++
 2 files changed, 34 insertions(+), 1 deletion(-)

-- 
2.21.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
