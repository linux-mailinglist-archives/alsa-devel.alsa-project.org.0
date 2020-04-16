Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 82AC61ABE05
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Apr 2020 12:35:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 29DC615F2;
	Thu, 16 Apr 2020 12:34:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 29DC615F2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587033348;
	bh=yTV0HSCJPtgcrFe0J8eh/jl6vkME9u9KNZut4I1j4ac=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=d6q2vPl1TUniUyTbTClyzobMiZXZ/c27pjHNiDY14ky4yUmFcZTggEdl20aW3LZ8t
	 sHSO5ePLwZfwcLSTzoTcKOenk05EHjG3PzCLl6hsMBAPlGJWIVk1qITD+hTEtNCBLw
	 AxaCwzU6S1KC/NrmYQZSW2gV1pMjHUmVS/wLzSOU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3E798F802A7;
	Thu, 16 Apr 2020 12:31:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 23E59F8028D; Thu, 16 Apr 2020 12:31:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.6 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 PRX_BODY_135, SPF_HELO_NONE, SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be
 [IPv6:2a02:1800:120:4::f00:14])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 011E8F80240
 for <alsa-devel@alsa-project.org>; Thu, 16 Apr 2020 12:31:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 011E8F80240
Received: from ramsan ([IPv6:2a02:1810:ac12:ed60:fd83:81bb:c1d7:433d])
 by xavier.telenet-ops.be with bizsmtp
 id TNWz2200i4dKHqf01NWzxE; Thu, 16 Apr 2020 12:31:11 +0200
Received: from rox.of.borg ([192.168.97.57]) by ramsan with esmtp (Exim 4.90_1)
 (envelope-from <geert@linux-m68k.org>)
 id 1jP1nP-0001cj-Ll; Thu, 16 Apr 2020 12:30:59 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
 (envelope-from <geert@linux-m68k.org>)
 id 1jP1nP-0003z7-JX; Thu, 16 Apr 2020 12:30:59 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Rob Herring <robh+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Stefan Popa <stefan.popa@analog.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>,
 =?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jiri Kosina <trivial@kernel.org>
Subject: [PATCH trivial 0/6] Fix misspellings of "Analog Devices"
Date: Thu, 16 Apr 2020 12:30:52 +0200
Message-Id: <20200416103058.15269-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Geert Uytterhoeven <geert+renesas@glider.be>, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 dmaengine@vger.kernel.org
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

	Hi all,

In several files the company also known as ADI is spelled as "Analog
Device".  However, according to https://www.analog.com/, the company
name is spelled "Analog Devices".

Hence this patch series, one per subsystem, fixes these misspellings.

Thanks for your comments!

Geert Uytterhoeven (6):
  dt-bindings: Fix misspellings of "Analog Devices"
  dma: Fix misspelling of "Analog Devices"
  drm: Fix misspellings of "Analog Devices"
  iio: Fix misspellings of "Analog Devices"
  ALSA: Fix misspellings of "Analog Devices"
  ASoC: Fix misspellings of "Analog Devices"

 .../devicetree/bindings/display/bridge/adi,adv7123.txt        | 4 ++--
 .../devicetree/bindings/display/bridge/adi,adv7511.txt        | 4 ++--
 Documentation/devicetree/bindings/dma/adi,axi-dmac.txt        | 2 +-
 Documentation/devicetree/bindings/iio/dac/ad5755.txt          | 2 +-
 drivers/dma/Kconfig                                           | 2 +-
 drivers/gpu/drm/bridge/adv7511/Kconfig                        | 2 +-
 drivers/gpu/drm/drm_fb_cma_helper.c                           | 2 +-
 drivers/gpu/drm/tegra/fb.c                                    | 2 +-
 drivers/iio/adc/ad7791.c                                      | 2 +-
 drivers/iio/trigger/iio-trig-hrtimer.c                        | 2 +-
 drivers/staging/iio/Documentation/overview.txt                | 2 +-
 sound/isa/ad1816a/ad1816a.c                                   | 2 +-
 sound/pci/ac97/ac97_patch.c                                   | 2 +-
 sound/pci/hda/Kconfig                                         | 4 ++--
 sound/soc/codecs/ad1980.c                                     | 2 +-
 sound/soc/codecs/ad73311.c                                    | 2 +-
 sound/soc/codecs/wm8782.c                                     | 2 +-
 17 files changed, 20 insertions(+), 20 deletions(-)

-- 
2.17.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
