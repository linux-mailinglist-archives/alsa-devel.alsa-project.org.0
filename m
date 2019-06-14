Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E82A4685A
	for <lists+alsa-devel@lfdr.de>; Fri, 14 Jun 2019 21:52:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9365A1873;
	Fri, 14 Jun 2019 21:51:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9365A1873
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560541939;
	bh=dG1pRCCTzrhg1y89X5jOkN7OS32tDsDqKRHG5Zzh7y0=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=nfjQS1kZkIH4RXHMtOO/9W7G16z29+zvsVDwMipACzlwlKO3mZ6eRZ4bpVwGWh9Fm
	 Axpq1AYtC38We4XvXFs0EGy1ceLYNFdE4lUCLg5cS2+lqsSi2qH1Z828McMt/H77k6
	 nVbHEmM6MCKJaJmznK67ZAg95c+Cp4+VcaUDWKVE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 29F38F89733;
	Fri, 14 Jun 2019 21:49:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 14832F896CE; Fri, 14 Jun 2019 21:49:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-io1-xd44.google.com (mail-io1-xd44.google.com
 [IPv6:2607:f8b0:4864:20::d44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 23DF1F80794
 for <alsa-devel@alsa-project.org>; Fri, 14 Jun 2019 21:48:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 23DF1F80794
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="AIQG4mZQ"
Received: by mail-io1-xd44.google.com with SMTP id u19so8272668ior.9
 for <alsa-devel@alsa-project.org>; Fri, 14 Jun 2019 12:48:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5kBsnIJ7NqL+VBYhjfKTuJEIg2r/RGqZAAl6Deg+qXM=;
 b=AIQG4mZQBLBL0joUtzflM8CrmnXp77fhWpM8leg6gHb/3/vSIh0cokbNOjLKO1ltzz
 KXkyRtytvFQx+6OKl7AeLX+GopRpszVVM+t7CIQFJoPoCT98LvhtFEPwHleDbTwCp5Yd
 oc6uygi+tEOurlekSWQwt5ei9eq83eOdo5+vA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5kBsnIJ7NqL+VBYhjfKTuJEIg2r/RGqZAAl6Deg+qXM=;
 b=kYmuwmHisqzESH8FIvCgCC2KOGJ6II8VlA45l3nksAspAQ5YwhEga5SxtVPoLYxQbc
 jXLYeHA6gOYgYkA0+yXW+0/8IQXoXIWvqSnnCPiMa4+qq+ArwrwJ0BH50HLCdgUIQxMT
 qAU4b2u7Wf8uOzRVgERTxM9J9Lah7UigwnCHtp9OjZct241EssgADkavMP9CWlCfjMAu
 tzH2/x9ChLCkQ4J2tJsoF5s+I4uJ+D4qLBDBn3AEfgxzw8YHSkY3WBHe8Q96Ogoo04Pa
 Q4tBSssX330rX1PuHlaKl+S9Nmu1GJjhfC1PyBPicM0efUkhCnmgS/bFKDHNFYKs0SiH
 1B2A==
X-Gm-Message-State: APjAAAWYJAigLvfxkLxSKG2PQCuediypEOqThW2Wewar5B1gHHQypwGf
 wrGUoXdKAA7ngVoU2GPGiWDl2Q==
X-Google-Smtp-Source: APXvYqwZ0QGSQITrHvnL18bpJqSZpsG5/kxnGjtC5GEiUg1zQH3SEmE5ItsYqnIY8mPijv5NvlC42Q==
X-Received: by 2002:a5e:c705:: with SMTP id f5mr66655255iop.113.1560541738017; 
 Fri, 14 Jun 2019 12:48:58 -0700 (PDT)
Received: from localhost ([2620:15c:183:200:33ce:f5cf:f863:d3a6])
 by smtp.gmail.com with ESMTPSA id c1sm2739459ioc.43.2019.06.14.12.48.56
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 14 Jun 2019 12:48:57 -0700 (PDT)
From: Fletcher Woodruff <fletcherw@chromium.org>
To: linux-kernel@vger.kernel.org
Date: Fri, 14 Jun 2019 13:48:50 -0600
Message-Id: <20190614194854.208436-1-fletcherw@chromium.org>
X-Mailer: git-send-email 2.22.0.410.gd8fdbe21b5-goog
MIME-Version: 1.0
Cc: Oder Chiou <oder_chiou@realtek.com>, alsa-devel@alsa-project.org,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Ross Zwisler <zwisler@chromium.org>,
 Fletcher Woodruff <fletcherw@chromium.org>,
 Curtis Malainey <cujomalainey@chromium.org>
Subject: [alsa-devel] [PATCH v7 0/4] Fix jack detection for Chromebook Pixel
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

v7:
  - Rebase onto for-next branch of broonie/sound.git 

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

 sound/soc/codecs/rt5677.c | 319 ++++++++++++++++++++++++++------------
 sound/soc/codecs/rt5677.h |  13 +-
 2 files changed, 236 insertions(+), 96 deletions(-)

-- 
2.22.0.410.gd8fdbe21b5-goog

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
