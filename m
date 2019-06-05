Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C95B23676F
	for <lists+alsa-devel@lfdr.de>; Thu,  6 Jun 2019 00:26:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5057F15E4;
	Thu,  6 Jun 2019 00:25:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5057F15E4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559773590;
	bh=stmadraBd6UETBnhlkSF8DdoS9h04GoXpauyPyo/W10=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=eD72wGmlERiYuK6DYE0x4anDvLAY8cC7TWI9fuXFcWW4W1jHFdzRkjDafnG+lq4JC
	 qQp7z+SVPF/fVofwrEvwTpA59Z/3JRGzzFnhRyllrGslzqyVQGFCWhVnLL2cCqN3fw
	 xXQ3MD+ycSsPvgy9222LowV/6/9GqRIiSpfKGyvI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 93468F896CE;
	Thu,  6 Jun 2019 00:24:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7D159F896DD; Thu,  6 Jun 2019 00:24:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,T_DKIMWL_WL_HIGH autolearn=disabled
 version=3.4.0
Received: from mail-it1-x144.google.com (mail-it1-x144.google.com
 [IPv6:2607:f8b0:4864:20::144])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1F736F808E7
 for <alsa-devel@alsa-project.org>; Thu,  6 Jun 2019 00:24:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1F736F808E7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="fwuqB6Ok"
Received: by mail-it1-x144.google.com with SMTP id n189so116291itd.0
 for <alsa-devel@alsa-project.org>; Wed, 05 Jun 2019 15:24:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eg/tHqhTtymCWtVp4klUI5heciNe2OPuOOg9xhW9fd4=;
 b=fwuqB6OkAcQAzt2t1vqjNOoHH8r9rtwoZ/9qB2UzqNTmkPrfoxGvdHxCOd9fLWR5ee
 jgBvK6Stp9bY+Fv8DAzdhvJIy2kYURn+aFJj7t9Xhx+uFGkQIpz1xS9ADd2GTLyWMrac
 RxoRhHsXHEmSYQ3t5vbDQp9UwP8c1gq07g1ok=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eg/tHqhTtymCWtVp4klUI5heciNe2OPuOOg9xhW9fd4=;
 b=JrHbU3Y+cT7+nu87yq46a7UeveEJcjrJzpOh70GGPldWbQmeWRgnOxbNAoY2OxJ4UJ
 8p01t1ZYXqwD8eQJJlKlnK/uqoEBbbXmBD1ovOH4Ekm6M383z2ryJHqFl1/vIJGj3ezI
 rdUwHTGID2g2v3/yC0Agum2i3SeBF2zimAJ8WI1+w/RXpEaJyQsmmSgl9gISgeay45rs
 oJ6VZObWScQbMwUfPSld4B7iihwIXdf56Ys+tlUL7FPBvq7OSW8f27qn0D3o8pD6OugG
 N36bUTV6Ev8zBkP2xYeMn0a6nNX9pNZ3O1iaqlck9WiZfN1Nfj14f9M0YHXseDMXf35c
 4QyQ==
X-Gm-Message-State: APjAAAXPfqlI6LKOjgtZCU8JdJ9sL8UL3G+wogMmcuC3jPelv/Mmt3Mz
 MKDzM96zKDezUQdwkKETr7HvKg==
X-Google-Smtp-Source: APXvYqwCuMjfRwW0T7+YoLiD23jxJzgzcbIrrBRdF0nXe44r2Q3l+hqztUJKPTWw6dKjNh8lIRKXsw==
X-Received: by 2002:a24:7f0d:: with SMTP id r13mr26288230itc.28.1559773479042; 
 Wed, 05 Jun 2019 15:24:39 -0700 (PDT)
Received: from localhost ([2620:15c:183:200:33ce:f5cf:f863:d3a6])
 by smtp.gmail.com with ESMTPSA id n13sm17120ioa.28.2019.06.05.15.24.37
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 05 Jun 2019 15:24:38 -0700 (PDT)
From: Fletcher Woodruff <fletcherw@chromium.org>
To: linux-kernel@vger.kernel.org
Date: Wed,  5 Jun 2019 16:24:15 -0600
Message-Id: <20190605222419.54479-1-fletcherw@chromium.org>
X-Mailer: git-send-email 2.22.0.rc1.311.g5d7573a151-goog
In-Reply-To: <20190507220115.90395-1-fletcherw@chromium.org>
References: <20190507220115.90395-1-fletcherw@chromium.org>
MIME-Version: 1.0
Cc: Oder Chiou <oder_chiou@realtek.com>, alsa-devel@alsa-project.org,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Ross Zwisler <zwisler@chromium.org>,
 Fletcher Woodruff <fletcherw@chromium.org>,
 Curtis Malainey <cujomalainey@chromium.org>
Subject: [alsa-devel] [PATCH v6 0/4] Fix jack detection for Chromebook Pixel
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

v6:
  - Move refactoring into its own patch
  - Reorder patches so that DT property names patch is first
  - Clarify commit message for patch which implements irq handler
  - Remove unused work struct 
  - Make IRQ function return IRQ_HANDLED only if IRQs actually fire

v5:
  - Fix void* parameter to devm_request_threaded_irq

v4:
  - Fix incorrect void* cast in rt5677_irq() 

v3:
  - Update commit message for patch 1/3 to clarify why we implement
    our own irq_chip.

v2:
  - Split IRQ change into two patches: adding and fixing potential race
  - Change config reading code to try both DT and ACPI style names

Ben Zhang (2):
  ASoC: rt5677: clear interrupts by polarity flip
  ASoC: rt5677: handle concurrent interrupts

Fletcher Woodruff (2):
  ASoC: rt5677: fall back to DT prop names on error
  ASoC: rt5677: move jack-detect init to i2c probe

 sound/soc/codecs/rt5677.c | 317 ++++++++++++++++++++++++++------------
 sound/soc/codecs/rt5677.h |  13 +-
 2 files changed, 234 insertions(+), 96 deletions(-)

-- 
2.22.0.rc1.311.g5d7573a151-goog

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
