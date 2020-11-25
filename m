Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3152E2C45A9
	for <lists+alsa-devel@lfdr.de>; Wed, 25 Nov 2020 17:46:55 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B61D6174B;
	Wed, 25 Nov 2020 17:46:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B61D6174B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1606322814;
	bh=8cjjclaA/vmhEiJGhNCIaK/0/JAKMBfJ3d0qzrpX5zs=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=VZN4BIRJRUEYVynu2RN6Gi7lxY/pgzu6knRhax5QTQWi8lpiKI4VpRlDfRzetnd59
	 SLpt0g35Ehm6RXdJtsXVjGUOe/FvMRz1XjCBujgLVmPbRHEvcL04B2wUGKuLU2KyrF
	 5++mIGfgDbqageD9qLb7FiqSJ2xIDQpsk8Nzaodg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5220AF80218;
	Wed, 25 Nov 2020 17:45:20 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 65CA9F8019D; Wed, 25 Nov 2020 17:45:17 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2E665F80128
 for <alsa-devel@alsa-project.org>; Wed, 25 Nov 2020 17:45:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2E665F80128
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="YZS4E7BK"
Received: from localhost.localdomain (adsl-84-226-167-205.adslplus.ch
 [84.226.167.205])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 529FA20857;
 Wed, 25 Nov 2020 16:45:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1606322710;
 bh=8cjjclaA/vmhEiJGhNCIaK/0/JAKMBfJ3d0qzrpX5zs=;
 h=From:To:Subject:Date:From;
 b=YZS4E7BK3srGsuTh+q5EIDvKyRDccEGJGdUWte/QLVxbzLZakwqVxEgFQlOXWP+xG
 fWDx1WLNQPpQdTRZHnuLiHmWsaCUebiy3xjULAaVOtb9bsPQU378aXYKo0cUdO2p4j
 fgZQ+f0QU20kcGBdEosXCT+mUFjQiotrV2Td0MCo=
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Support Opensource <support.opensource@diasemi.com>,
 Oder Chiou <oder_chiou@realtek.com>,
 Kevin Cernekee <cernekee@chromium.org>,
 Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Patrick Lai <plai@codeaurora.org>,
 Banajit Goswami <bgoswami@codeaurora.org>,
 Heiko Stuebner <heiko@sntech.de>, Krzysztof Kozlowski <krzk@kernel.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Peter Ujfalusi <peter.ujfalusi@ti.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-rockchip@lists.infradead.org
Subject: [PATCH v2 00/39] ASoC: fix !OF compile test warnings
Date: Wed, 25 Nov 2020 17:44:13 +0100
Message-Id: <20201125164452.89239-1-krzk@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

Hi,

Changes since v1:
1. New patch 2/39: ASoC: bd28623: mark OF related data as maybe unused,
2. Patches 1-13: add maybe_unused after discussions with Mark,
3. Add Sylwester's review to two patches (one changed so please review
   one more time).

Best regards,
Krzysztof


Krzysztof Kozlowski (39):
  ASoC: ak5558: mark OF related data as maybe unused
  ASoC: bd28623: mark OF related data as maybe unused
  ASoC: gtm601: mark OF related data as maybe unused
  ASoC: inno_rk3036: mark OF related data as maybe unused
  ASoC: rk3328: mark OF related data as maybe unused
  ASoC: tas571x: mark OF related data as maybe unused
  ASoC: kirkwood: armada-370-db: mark OF related data as maybe unused
  ASoC: meson: t9015: mark OF related data as maybe unused
  ASoC: qcom: mark OF related data as maybe unused
  ASoC: samsung: smdk_wm8994: mark OF related data as maybe unused
  ASoC: rockchip: mark OF related data as maybe unused
  ASoC: ti: davinci: mark OF related data as maybe unused
  ASoC: uniphier: mark OF related data as maybe unused
  ASoC: ak4118: skip of_device_id table when !CONFIG_OF
  ASoC: alc5623: skip of_device_id table when !CONFIG_OF
  ASoC: alc5632: skip of_device_id table when !CONFIG_OF
  ASoC: da7218: skip of_device_id table when !CONFIG_OF
  ASoC: da7219: skip of_device_id table when !CONFIG_OF
  ASoC: da9055: skip of_device_id table when !CONFIG_OF
  ASoC: es8316: skip of_device_id table when !CONFIG_OF
  ASoC: max98090: skip of_device_id table when !CONFIG_OF
  ASoC: max98095: skip of_device_id table when !CONFIG_OF
  ASoC: max98371: skip of_device_id table when !CONFIG_OF
  ASoC: max9867: skip of_device_id table when !CONFIG_OF
  ASoC: max98925: skip of_device_id table when !CONFIG_OF
  ASoC: max98926: skip of_device_id table when !CONFIG_OF
  ASoC: pcm1789: skip of_device_id table when !CONFIG_OF
  ASoC: pcm179x: skip of_device_id table when !CONFIG_OF
  ASoC: rt5660: skip of_device_id table when !CONFIG_OF
  ASoC: tas2562: skip of_device_id table when !CONFIG_OF
  ASoC: tlv320: skip of_device_id table when !CONFIG_OF
  ASoC: ts3a227e: skip of_device_id table when !CONFIG_OF
  ASoC: es7134: mark OF related data as maybe unused
  ASoC: es7241: mark OF related data as maybe unused
  ASoC: samsung: i2s: mark OF related data as maybe unused
  ASoC: max98371: drop driver pm=NULL assignment
  ASoC: max98925: drop driver pm=NULL assignment
  ASoC: max98926: drop driver pm=NULL assignment
  ASoC: samsung: smdk_wm8994: remove redundant of_match_ptr()

 sound/soc/codecs/ak4118.c           | 2 ++
 sound/soc/codecs/ak5558.c           | 2 +-
 sound/soc/codecs/alc5623.c          | 2 ++
 sound/soc/codecs/alc5632.c          | 2 ++
 sound/soc/codecs/bd28623.c          | 2 +-
 sound/soc/codecs/da7218.c           | 2 ++
 sound/soc/codecs/da7219.c           | 2 ++
 sound/soc/codecs/da9055.c           | 2 ++
 sound/soc/codecs/es7134.c           | 4 ++--
 sound/soc/codecs/es7241.c           | 2 +-
 sound/soc/codecs/es8316.c           | 2 ++
 sound/soc/codecs/gtm601.c           | 2 +-
 sound/soc/codecs/inno_rk3036.c      | 2 +-
 sound/soc/codecs/max98090.c         | 2 ++
 sound/soc/codecs/max98095.c         | 2 ++
 sound/soc/codecs/max98371.c         | 3 ++-
 sound/soc/codecs/max9867.c          | 2 ++
 sound/soc/codecs/max98925.c         | 3 ++-
 sound/soc/codecs/max98926.c         | 3 ++-
 sound/soc/codecs/pcm1789-i2c.c      | 2 ++
 sound/soc/codecs/pcm179x-i2c.c      | 2 ++
 sound/soc/codecs/rk3328_codec.c     | 2 +-
 sound/soc/codecs/rt5660.c           | 2 ++
 sound/soc/codecs/tas2562.c          | 2 ++
 sound/soc/codecs/tas571x.c          | 4 ++--
 sound/soc/codecs/tlv320adcx140.c    | 2 ++
 sound/soc/codecs/tlv320aic23-i2c.c  | 2 ++
 sound/soc/codecs/ts3a227e.c         | 2 ++
 sound/soc/kirkwood/armada-370-db.c  | 2 +-
 sound/soc/meson/t9015.c             | 2 +-
 sound/soc/qcom/apq8016_sbc.c        | 2 +-
 sound/soc/qcom/lpass-apq8016.c      | 2 +-
 sound/soc/qcom/lpass-ipq806x.c      | 2 +-
 sound/soc/qcom/lpass-sc7180.c       | 2 +-
 sound/soc/rockchip/rockchip_i2s.c   | 2 +-
 sound/soc/rockchip/rockchip_pdm.c   | 2 +-
 sound/soc/rockchip/rockchip_spdif.c | 2 +-
 sound/soc/samsung/i2s.c             | 8 ++++----
 sound/soc/samsung/smdk_wm8994.c     | 4 ++--
 sound/soc/ti/davinci-i2s.c          | 2 +-
 sound/soc/uniphier/aio-ld11.c       | 2 +-
 sound/soc/uniphier/aio-pxs2.c       | 2 +-
 sound/soc/uniphier/evea.c           | 2 +-
 43 files changed, 69 insertions(+), 32 deletions(-)

-- 
2.25.1

