Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D45288CBAC
	for <lists+alsa-devel@lfdr.de>; Wed, 14 Aug 2019 08:12:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5CEFF1665;
	Wed, 14 Aug 2019 08:11:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5CEFF1665
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565763142;
	bh=5in9Iaan8AH/27HgmFW+pnD0ZbeNg8jvb4YLhNhHUf4=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=eddx7fyilta6KWFQ+4BNqZj5KmQS7/SOVemvwjfFvGA6zmRZTWNLhIPrLMAwmkzFC
	 PQtIyFtqt2WZDFQ+G/OYGqxF6CLwofEUeD7JIOxGhNlqtkcfuFY+OLJGmoCsqH6XWg
	 rQz5yA3outEK/hZUPcgb+kSQf1cLIWyvftXgLQrs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DF418F801DF;
	Wed, 14 Aug 2019 08:09:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 883ECF80600; Wed, 14 Aug 2019 08:09:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,PRX_BODY_26,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com
 [IPv6:2a00:1450:4864:20::142])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 13450F801DF
 for <alsa-devel@alsa-project.org>; Wed, 14 Aug 2019 08:08:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 13450F801DF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="Of6jkP71"
Received: by mail-lf1-x142.google.com with SMTP id x3so78574035lfc.0
 for <alsa-devel@alsa-project.org>; Tue, 13 Aug 2019 23:08:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vSksoEM6AOP7H4nx5slyJOwVx6G+Lfd4yTDhKXFI4kw=;
 b=Of6jkP71r4l9hIWGhjXEn6k3ZQXEbpaIaO3H210UOh4VYtJCUbtF5QhSlMuKHIEWiF
 PPxk4tArZlRxJ4MWvamV/A6gUDEmTLgaMLTAeX+/oeNbUnGIeHxfJcr8CZg2y3Kjad0q
 t9VO5xOqidl9/XWlGmNmmLWvK2UO+1wDsI6BK4jRzJdgbDMFGaGkqmXNF8Ah0De7S8Hk
 tCujzldHtTcr4Se4O1SKV61TCZG7M71GzDoXhDMgIej8v5mywFfBi+LTACNiVPh+3bQh
 OEBwfx0fzGE6wsRVJlcTUy1/fBTbe/L53aY/QPzWikBip14hwF3Eugg4Ng7LW+kA6OCm
 Ebig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vSksoEM6AOP7H4nx5slyJOwVx6G+Lfd4yTDhKXFI4kw=;
 b=oDHrHq5mi5C940+e5nUnWbukQz68Qu/5l3WYFv5RpEU7P4Dr131B2XZoVW8/zzUWza
 vnRcKPX2Q7jrg1pJuYp8IR1YqB3StK+nlf3b0V3Bu0xMBdaWgjT2Ai0NXn51Unbrg62v
 Zir9neu8otLMQwfehj507pGODMQkU7y0RO/0T+cFweXH6zaO/aFOFYIWcY6+GUFyzoZp
 h40fmQC2DitzDjCwqjV1015ch8Sd+1PkE00e+QMaDIM9ug/cUah/xPfZ7w5XKWI4Feyl
 E3fSBSY0yjr2AhT53PcsFkgMZsBkgrHVB45Cb+WYIuxODggo8C7MSh97tgfCSTD35PMc
 MPsg==
X-Gm-Message-State: APjAAAWfwcB2AiTWQ95nrlbyEPm42vh9iW2HY0SnzqPQt9T+AMnzid+H
 dOg9opnaIy0N6o4kC66mx8g=
X-Google-Smtp-Source: APXvYqzDEhoiObAivBRlNhvLf+Jr5rb2KVMNEytoFIqeDJzvNkvCX+VS8HpTMDqFXbrqfHV7pZRBgg==
X-Received: by 2002:a19:c1cc:: with SMTP id r195mr24200422lff.95.1565762936954; 
 Tue, 13 Aug 2019 23:08:56 -0700 (PDT)
Received: from localhost.localdomain (c213-102-74-69.bredband.comhem.se.
 [213.102.74.69])
 by smtp.gmail.com with ESMTPSA id s10sm3124235ljm.35.2019.08.13.23.08.54
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 13 Aug 2019 23:08:55 -0700 (PDT)
From: codekipper@gmail.com
To: maxime.ripard@free-electrons.com, wens@csie.org,
 linux-sunxi@googlegroups.com
Date: Wed, 14 Aug 2019 08:08:39 +0200
Message-Id: <20190814060854.26345-1-codekipper@gmail.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org, Marcus Cooper <codekipper@gmail.com>,
 lgirdwood@gmail.com, linux-kernel@vger.kernel.org, be17068@iperbole.bo.it,
 broonie@kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [alsa-devel] [PATCH v5 00/15] ASoC: sun4i-i2s: Updates to the driver
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

From: Marcus Cooper <codekipper@gmail.com>

Hi All,

here is a patch series to add some improvements to the sun4i-i2s driver
found whilst getting slave clocking and hdmi audio working on the newer
SoCs. As the LibreELEC project is progressing extremely well then there
has been some activity getting H6 SoC support with surround sound
working and these changes are also included.

The functionality included with the new patch set has been extended to
cover more sample resolutions, multi-lane data output for HDMI audio
and some bug fixes that have been discovered along the way. I have
changed some of the original reg fields into function calls as this made
it easier to setup for multi-channel audio especially across different
SoCs.

I can see more usage of the tdm property since I last attempted to push
these patches and the examples currently in mainline sort of the opposite
to what I'm trying to achieve. When we first started looking at the i2s
driver, the codecs that we were using allowed for the frame width to be
determined based on the sampling resolution but in most use cases it
seems that a fixed width is required(my highest priority should be to get
HDMI audio support in). We're using the tdm property to override the old
way to calculate the frame width. What I've seen in what has already been
mainlined is that the i2s driver has a frame width that is fixed to 32
bits and this can be overridden using the tdm property.

My test branch for this can be found at
https://github.com/codekipper/linux-sunxi/commits/upstream-i2s , I've been
using a Pine64 to test with; validating the new SoC block with HDMI audio
and ensuring that I've not broken the old block by making sure that the audio
codec still works. If we able to get the first three patches delivered then
that is enough for HDMI audio support on the newer SoCs(H3, A64 etc).

I still need to investigate the FIFO syncing issues which i've not had a
chance to change or address the concerns that broonie and wens brought up.
This change has been moved to the top of the patch stack. I would also like
to make the multi-channel audio and audio mapping more configurable via the
device tree. Currently what is implemented suites our current needs.

BR,
CK

---
v5 changes compared to v4 are:
- removed delivered patches.
- Added more details to commit messages.
- replaced some reg fields with function calls.
- Added DSP_A and DSP_B support for H3 and later SoCs.
- Added support for the Allwinner H6.

v4 changes compared to v3 are:
- Moved patches around so that the more controversial of patches are
  at the top of the stack.
- Added more details to commit messages.
- Fixed 20bit audio PCM format to use 4 bytes.
- Reduced number of flags used to indicate a new SoC.

v3 changes compared to v2 are:
 - added back slave mode changes
 - added back the use of tdm properties
 - changes to regmap and caching
 - removed loopback functionality
 - fixes to the channel offset mask

v2 changes compared to v1 are:
 - removed slave mode changes which didn't set mclk and bclk div.
 - removed use of tdm and now use a dedicated property.
 - fix commit message to better explain reason for sign extending
 - add divider calculations for newer SoCs.
 - add support for multi-lane i2s data output.
 - add support for 20, 24 and 32 bit samples.
 - add loopback property so blocks can be tested without a codec.


---
Jernej Skrabec (3):
  clk: sunxi-ng: h6: Allow I2S to change parent rate
  dt-bindings: ASoC: sun4i-i2s: Add H6 compatible
  ASoC: sun4i-i2s: Add support for H6 I2S

Marcus Cooper (12):
  ASoC: sun4i-i2s: Add regmap field to sign extend sample
  ASoC: sun4i-i2s: Add set_tdm_slot functionality
  ASoC: sun4i-i2s: Correct divider calculations
  ASoC: sun4i-i2s: Support more formats on newer SoCs
  ASoC: sun4i-i2s: Add functions for RX and TX channel offsets
  ASoC: sun4i-i2s: Add functions for RX and TX channel enables
  ASoC: sun4i-i2s: Add functions for RX and TX channel selects
  ASoC: sun4i-i2s: Add functions for channel mapping
  ASoC: sun4i-i2s: Add multi-lane functionality
  ASoC: sun4i-i2s: Add multichannel functionality
  ASoc: sun4i-i2s: Add 20, 24 and 32 bit support
  ASoC: sun4i-i2s: Adjust regmap settings

 .../sound/allwinner,sun4i-a10-i2s.yaml        |   2 +
 drivers/clk/sunxi-ng/ccu-sun50i-h6.c          |   8 +-
 sound/soc/sunxi/sun4i-i2s.c                   | 690 ++++++++++++++----
 3 files changed, 542 insertions(+), 158 deletions(-)

-- 
2.22.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
