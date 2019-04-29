Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 58316DFC5
	for <lists+alsa-devel@lfdr.de>; Mon, 29 Apr 2019 11:49:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BC8DC1654;
	Mon, 29 Apr 2019 11:49:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BC8DC1654
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1556531390;
	bh=h8Id4QPbbz7VhdtXUDqETrCX7Zg0xBzJl3lpGynUir8=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=C8SGFkeoASpQBDBcP0O62xjOOQ+WsGGhrnWoXDBxFMGAmWt5CVAlIWdhT63mJ7YxO
	 TaxUNxrYWutJap3vuE0eD/ZSU6nd3k5X53EgNNgeFUxlgIz2qToU4cImV3zKIZoI5Z
	 NJ9HFjZTqVt6IXgaOoVJ1WQy7uctmw9JAVVf/FLE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ADB9CF806E7;
	Mon, 29 Apr 2019 11:48:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9ECF9F8962A; Mon, 29 Apr 2019 11:48:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7C7CFF806E7
 for <alsa-devel@alsa-project.org>; Mon, 29 Apr 2019 11:47:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7C7CFF806E7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com
 header.i=@baylibre-com.20150623.gappssmtp.com header.b="ukqWmx3w"
Received: by mail-wr1-x434.google.com with SMTP id c5so15008998wrs.11
 for <alsa-devel@alsa-project.org>; Mon, 29 Apr 2019 02:47:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LrkVzYO8i3GpLatsXL6FS/oqta3++wMs7+5LeRy4XK4=;
 b=ukqWmx3wk3bwzUUQ1iO/jvjVvsc23IEqfUxqjqDjOfpR0kUF144ve+vgR3s5aGxeh3
 k6uyPmHOLatnda/+LtcyvQ8Pr6jtdFGok9hsz9Y+OvxzTt4UejcZWTdPFr6e7/h085Ey
 Ob5UOdSyjGF2QlfDxl4ZOBTzxz6cwKw8GkH7j8JI7VIy7ZJhycPoMMMkgpM//FPZfnHv
 vx96uYQOwuO2dLziGjZJGTp3W3dxTeJIb1hiEmF0lPrJmLV9T3ofbq2Wc25CWmyvXoG/
 SXBHID4/4JQSFL7qMQU9xOh9b9SmLNWtP/AInD0CHc8QWjJ9G+CtkMq43SPy1PHfNrSd
 ROfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LrkVzYO8i3GpLatsXL6FS/oqta3++wMs7+5LeRy4XK4=;
 b=P1dI1PDV/SbTPjr6/2NNe4VWdDF57irKXR1YSQZW4ljkld2pjTkrDJ2OSTXbzseVKK
 oMPedXz6+BYwWuixA2ccIImn0c65qARAuYlWEFe1xEs9J3hXszTN0ixUl6ENjOif2nwu
 g2ve3X7LNQVDDrejnoRIsYY+ZCwQ++hB+/+lddn4b3twkGLzLyn+P070H/Zt99ugQTmE
 aKcTRxlTtJQa4vck5m15qiXU7b/fMwYQDwNghxTNMd26/KV7/FeLoF8NDmOTMLjQ9aLF
 UuW8PrOdWxHK168LnEqXGWZXdG5ZueiOltXuY8jEiV9XIY+BSXHwwjMPundcAZXedeoo
 J0oA==
X-Gm-Message-State: APjAAAUSI22BJsUpxTpaaxvUoHTofhm9JTdVDyPliJmJ5KI1KoxwUC0A
 IDf0R9fAhdqBJel3ZE2xhi/Xng==
X-Google-Smtp-Source: APXvYqw1Y82RfJ3jpeXI3QjGSBtoRy2moIA/+T+GLROcNG/x6qQpL1g5WWqaNo2iN13u4PoSisRA8Q==
X-Received: by 2002:adf:afd1:: with SMTP id y17mr7767686wrd.125.1556531278695; 
 Mon, 29 Apr 2019 02:47:58 -0700 (PDT)
Received: from boomer.local (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id 192sm47987465wme.13.2019.04.29.02.47.57
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 29 Apr 2019 02:47:57 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Date: Mon, 29 Apr 2019 11:47:48 +0200
Message-Id: <20190429094750.1857-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: patchwork-bot+notify@kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>
Subject: [alsa-devel] [PATCH 0/2] ASoC: fix hw_params/hw_free validity checks
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

While working on a codec, I have found an odd situation. The hw_params
callback which was provided by the codec dai was not called as expected.
However, the hw_free callback was called, even if hw_params was skipped.

After debugging, I found out that the dai was considered invalid because
it did not specify any rates, only rate_min and rate_max. That's a first
problem.

If a codec dai is considered invalid, hw_free should probably not be
called either, that's a 2nd issue.

This patchset is meant to solve both issues.

Jerome Brunet (2):
  ASoC: fix valid stream condition
  ASoC: skip hw_free on codec dai for which the stream is invalid

 sound/soc/soc-pcm.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
