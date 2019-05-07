Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B5F8016D60
	for <lists+alsa-devel@lfdr.de>; Wed,  8 May 2019 00:03:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 40B4E180B;
	Wed,  8 May 2019 00:02:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 40B4E180B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557266592;
	bh=6K3KE5oZheh+xKl1+RQpyxS4Sme1wE4wEkRtLYt+pMg=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=RXXpEdPMqxW8vD4WKllv0nB0mk0cIyVg7xZKwDVAu8c8W9CwQ85zmAM9ZKFTJrObF
	 /FkpdAbRwTuO5flpyDiJHAjjvIScifFZT/GGc4lGHm/ZRyFS6xXr9cnpB2zhYa8MgK
	 4fNBS7LGU1tm2OqysxkQEXWMy14LlAYWAEYR6aFs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D5C9DF89674;
	Wed,  8 May 2019 00:01:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C694FF89674; Wed,  8 May 2019 00:01:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_PASS,T_DKIMWL_WL_HIGH autolearn=disabled version=3.4.0
Received: from mail-it1-x144.google.com (mail-it1-x144.google.com
 [IPv6:2607:f8b0:4864:20::144])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E8EF5F807B5
 for <alsa-devel@alsa-project.org>; Wed,  8 May 2019 00:01:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E8EF5F807B5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="MtLFGoue"
Received: by mail-it1-x144.google.com with SMTP id s3so767160itk.1
 for <alsa-devel@alsa-project.org>; Tue, 07 May 2019 15:01:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xYc0JESinzI2iwWzUMb1V/Hdw0SX6rpr4LLne8uyVks=;
 b=MtLFGoueRtD3/ObzBu30iA+pfZ50NmYRCiskzTCJNKhaklKx3iHSqVK0qkMPJ3jipg
 Z9VgV7dUp1+EmERR6VdzS88+gxm4TQG0p2L+lJo9HHp+yqjBLwtdRRivXgDLEoz6xDca
 bNl4jFRZCGJThqHpA6eoohDPBXxuic3g7XCvU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xYc0JESinzI2iwWzUMb1V/Hdw0SX6rpr4LLne8uyVks=;
 b=YiJA7nRMjv8tOVWJ5rcq8zxzQS5nxvi9/aQkTKHyAXxGWBHmpP2RqBChEQBKCJ4jez
 wFEm/+8y8MVc1vaFeTgagOGdZUYgOW9fonJKbV7eQxcNQs9CWsQSyFA8tf/apgQlW9MI
 2qAWLJ7/YpnA4Kz2Wmmw0CxSo4B+extIx/dfGhI7oUWfAFIylVsZbc7J75LC46aJR4u1
 ZNYTDyzTo8pX4Wk3SJN1p1AQBOJAKnoQbVfs7Bk5aHUXcCkzRTmL43fcGG2BNMl8dl3T
 y8Ncrvs+ESd7ptNqLd1FKQ2Ns1qpQGlhx8M/I9AcHfVZatfISZS6L7GYeHhx5WFIm6nM
 gcuQ==
X-Gm-Message-State: APjAAAVa3Ql6wG3G4gG4mLllXC/h6Hd3JRTbxswU38JbIEwz8qEAvSzP
 xli+hkdzMmBjw+cs6Plhn4Iiew==
X-Google-Smtp-Source: APXvYqxqxFroiAP8mWouVz4mtsAHLB+q/Lok8532r2squfRx3L112Mt9CLwW+fkwrqgO6ixxyFT8jA==
X-Received: by 2002:a24:398d:: with SMTP id l135mr624053ita.79.1557266480307; 
 Tue, 07 May 2019 15:01:20 -0700 (PDT)
Received: from localhost ([2620:15c:183:200:33ce:f5cf:f863:d3a6])
 by smtp.gmail.com with ESMTPSA id u13sm3028527iof.22.2019.05.07.15.01.18
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 07 May 2019 15:01:19 -0700 (PDT)
From: Fletcher Woodruff <fletcherw@chromium.org>
To: linux-kernel@vger.kernel.org
Date: Tue,  7 May 2019 16:01:12 -0600
Message-Id: <20190507220115.90395-1-fletcherw@chromium.org>
X-Mailer: git-send-email 2.21.0.1020.gf2820cf01a-goog
MIME-Version: 1.0
Cc: Oder Chiou <oder_chiou@realtek.com>, alsa-devel@alsa-project.org,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Fletcher Woodruff <fletcherw@chromium.org>,
 Curtis Malainey <cujomalainey@chromium.org>
Subject: [alsa-devel] [PATCH v5 0/3] Fix jack detection for Chromebook Pixel
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

Headphone/mic jack detection doesn't work on the Chromebook Pixel 2015.

This patch changes the irq implementation to support polarity flipping
and fixes the configuration code so that correct GPIO pins are read
from ACPI.

With this series, plugging and unplugging the headphone jack switches
between headphones and speakers automatically, and headset microphones 
are also detected.

v5:
  - Fix void* parameter to devm_request_threaded_irq
  - Correct authorship for patch 2/3

v4:
  - Fix incorrect void* cast in rt5677_irq() 

v3:
  - Update commit message for patch 1/3 to clarify why we implement
    our own irq_chip.

v2:
  - Split IRQ change into two patches: adding and fixing potential race
  - Change config reading code to try both DT and ACPI style names


Ben Zhang (2):
  ASoC: rt5677: allow multiple interrupt sources
  ASoC: rt5677: handle concurrent interrupts

Fletcher Woodruff (1):
  ASoC: rt5677: fall back to DT prop names on error

 sound/soc/codecs/rt5677.c | 346 ++++++++++++++++++++++++++------------
 sound/soc/codecs/rt5677.h |  14 +-
 2 files changed, 256 insertions(+), 104 deletions(-)

-- 
2.21.0.1020.gf2820cf01a-goog

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
