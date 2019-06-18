Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 76E254AED7
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Jun 2019 01:48:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DC27516AE;
	Wed, 19 Jun 2019 01:47:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DC27516AE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560901681;
	bh=jdEt79tYfwgFtyAyWWp+eZNqmyIFa2wwjlhJmbd9TyQ=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=qi60K8WAoY7mli4ETHnOnGpaayry+MUTeK9k4DPOThmO6geak5t331ZsCnRGKTXgf
	 +ARQqfMNpEqCGXlJa5BkFBm+i2eKz8iVlG+eBXIg0yGS7tT2JGYqcOXVON5HUg3z6m
	 +obXwyUg60dw+eMRQ0H3+eCYsjuE6dOxvFJuVTYE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0A75AF8971B;
	Wed, 19 Jun 2019 01:46:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 68ADEF896F4; Wed, 19 Jun 2019 01:46:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-io1-xd44.google.com (mail-io1-xd44.google.com
 [IPv6:2607:f8b0:4864:20::d44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6ABBCF8075C
 for <alsa-devel@alsa-project.org>; Wed, 19 Jun 2019 01:46:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6ABBCF8075C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="Fw5Pyth5"
Received: by mail-io1-xd44.google.com with SMTP id u19so33871361ior.9
 for <alsa-devel@alsa-project.org>; Tue, 18 Jun 2019 16:46:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=P6OiHApPpuHFcXqpPL0yqvZnshiOzXZvGcLbs7dM2ic=;
 b=Fw5Pyth5dnuVNp0vDCXr26K5dYvEdk35TgTo4Kp3aiX5j8Icz85fstmHGai3mKRtb3
 8jR57qQM62+JFhSKNzwtWC5BN59Evz5Hr4HHXePpBZUIp7icD/N6vFwbKN96uYLhCRbu
 jcjA5hmiE3S/1RzV2Jhl0fyk5yRgUyeP26RrM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=P6OiHApPpuHFcXqpPL0yqvZnshiOzXZvGcLbs7dM2ic=;
 b=HizP8t32E4OlbZdctdcpRMjPvpBBPnvkH+fsygXyREK0w3pkVBC880z5a2BgREtnm8
 qbf3KZgBCBbkLDU387olNmIEIkpH1tmkpwpGokQ07FFphuFq041ezKtmqiTEHhLRzNpv
 XdWaHqQiGb8JbIrgs8M5CE41go/ld5TTY3onHiNETv5ClVyn5M2V77/xps2kBTUzcKRN
 k1GlnEIpiar1jMaaMuYjj3UkN18fOu+3g53tIghicjQY9o9hSbIoLO+r2vJSebx+LtYc
 pOh79h85LGmVB2MOzXqpp74kZIWwTmAiUHse7frkU/bHRql7GYKpc7tGGzMtcqfOQ3lO
 AIWg==
X-Gm-Message-State: APjAAAXPT4kMX8vHlxi2Wcxfz0CLq+4WrBliRACJab0OBmfp11mCeYT/
 gx6WkPkBRlS6fLIG0EUKfSZ4Hg==
X-Google-Smtp-Source: APXvYqx0XYE1ACE0khO5y6o8MbcH4AOi8bn5I0VI230YUYijlmFsiPNXdCuhPosL71GP7ed8k2DOgA==
X-Received: by 2002:a5d:94d7:: with SMTP id y23mr5967649ior.296.1560901569308; 
 Tue, 18 Jun 2019 16:46:09 -0700 (PDT)
Received: from localhost ([2620:15c:183:200:33ce:f5cf:f863:d3a6])
 by smtp.gmail.com with ESMTPSA id y20sm15562673iol.34.2019.06.18.16.46.07
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 18 Jun 2019 16:46:08 -0700 (PDT)
From: Fletcher Woodruff <fletcherw@chromium.org>
To: linux-kernel@vger.kernel.org
Date: Tue, 18 Jun 2019 17:45:53 -0600
Message-Id: <20190618234555.188955-1-fletcherw@chromium.org>
X-Mailer: git-send-email 2.22.0.410.gd8fdbe21b5-goog
MIME-Version: 1.0
Cc: Oder Chiou <oder_chiou@realtek.com>, alsa-devel@alsa-project.org,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Ross Zwisler <zwisler@chromium.org>,
 Fletcher Woodruff <fletcherw@chromium.org>,
 Curtis Malainey <cujomalainey@chromium.org>
Subject: [alsa-devel] [PATCH v8 0/2] Fix jack detection for Chromebook Pixel
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

These patches change the irq implementation to support polarity flipping.
With this series, plugging and unplugging the headphone jack switches
between headphones and speakers automatically, and headset microphones
are also detected.

v8:
  - Remove first two patches since they've been merged
  - Add pointer to i2c->dev in rt5677_priv for use in dev_err functions
  - Convert pr_err to dev_err in irq function

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

 sound/soc/codecs/rt5677.c | 192 +++++++++++++++++++++++++++++++-------
 sound/soc/codecs/rt5677.h |   8 +-
 2 files changed, 164 insertions(+), 36 deletions(-)

--
2.22.0.410.gd8fdbe21b5-goog

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
