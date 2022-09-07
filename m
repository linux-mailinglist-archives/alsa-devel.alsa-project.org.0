Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D82BB5B065F
	for <lists+alsa-devel@lfdr.de>; Wed,  7 Sep 2022 16:22:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0D09E15C2;
	Wed,  7 Sep 2022 16:21:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0D09E15C2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662560563;
	bh=4zvZxW7fDMyRPjDJGHo8l9V7YRDUkj0a02UbHWNK/6Y=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ZKnVmT5YKAd/dmfaDI9roLn5GajON88VXGHV3quDRNrplQbnjb/awzVPidE++eA5G
	 ISztaOK946gasj5+uAg2Oo3DK0yRkVJPFlHOx9JsLfPC7fCwxLvZ78SHZr+I6wA4LJ
	 GrDxG8Z+6adszNjXQYxIQaWoYuXH15FDLWAMz9sI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 68F76F8011C;
	Wed,  7 Sep 2022 16:21:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B7BB2F8028D; Wed,  7 Sep 2022 16:21:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::232])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A3394F80118
 for <alsa-devel@alsa-project.org>; Wed,  7 Sep 2022 16:21:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A3394F80118
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.b="e71aa7Ze"
Received: from booty.fritz.box (unknown [77.244.183.192])
 (Authenticated sender: luca.ceresoli@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPA id 20F56200002;
 Wed,  7 Sep 2022 14:21:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1662560494;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=7RATQ1JbATm9X+Wc/5gqBHh5cXHWLcY7/Zz0xbFDNbo=;
 b=e71aa7ZeQb+9niVLutMjhbHbiGoOVQXyA8/LYnJf6HK/XgDE2v/9cdl/QMBMw0CBJA83wA
 xQMwsyTWB1jngIHRUMyqlxrTakDtZsGdB2iEE3oFTOlOcONVb5V6RwXiV+Sz9uENIZBgb0
 tkcriO403wd1xDp0mW+Ju7ShSvsJiJhVdIMkf5hCNe6c58QDR/sukT7fefkIofgjXft5UA
 ZxnZ3K7/6l8ACrICnNUQOh0ZKVvt4vBja9CLE5I2G1tTPSWs9rs0Gr1xvyYsIzqc6m3ZHi
 xiQdInb+cbNKXyPL0Vj/5Per31+MIKNsHcGRhKBOg8Z79DH3E2rFmDxYPYnclA==
From: luca.ceresoli@bootlin.com
To: alsa-devel@alsa-project.org,
	linux-rockchip@lists.infradead.org
Subject: [PATCH 0/8] Add support for the internal RK3308 audio codec
Date: Wed,  7 Sep 2022 16:21:16 +0200
Message-Id: <20220907142124.2532620-1-luca.ceresoli@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, Heiko Stuebner <heiko@sntech.de>,
 Takashi Iwai <tiwai@suse.com>, Chris Morgan <macromorgan@hotmail.com>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
 Mark Brown <broonie@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Johan Jonker <jbx6244@gmail.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 linux-arm-kernel@lists.infradead.org
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

From: Luca Ceresoli <luca.ceresoli@bootlin.com>

This series of patches adds support to use the internal audio codec of the
Rockchip RK3308 SoC. This codec is internally connected to the I2S
peripherals on the same chip, and it has some peculiarities arising from
that interconnection.

For proper bidirectional operation with the internal codec, the I2S
peripheral needs two clock sources (tx and rx), while connection with an
external codec commonly needs only one. Since v5.16 there is a driver for
the I2S in sound/soc/rockchip/rockchip_i2s_tdm.c, but it does not correctly
handle receiving those two clocks via the .set_sysclk op. Patch 5 fixes
that.

However the simple-audio-card and audio-graph-card sound card drivers do
not support calling .set_sysclk twice, thus patch 6 makes the .init op of
struct asoc_simple_priv overridable by a driver in order to be able to call
.set_sysclk twice and thus configure both clocks.

Patch 7 adds the codec driver and patch 8 builds on top of all the above by
implementing a simple RK3308-specific audio card, based on
audio-graph-card. This card sets all the I2S input clocks.

Patches 1-2 add DT bindings for the codec and the card. Patches 3-4 add to
the SoC DT file two I2S controllers (those which are internally connected
to the internal codec) and the codec itself.

Luca

Luca Ceresoli (8):
  ASoC: rockchip: rk3308: add internal audio codec bindings
  ASoC: rockchip: rk3308: add audio card bindings
  arm64: dts: rockchip: add i2s_8ch_2 and i2s_8ch_3
  arm64: dts: rockchip: add the internal audio codec
  ASoC: rockchip: i2s-tdm: Fix clk_id usage in .set_sysclk()
  ASoC: audio-graph: let dai_link->init be overridable
  ASoC: codecs: Add RK3308 internal audio codec driver
  ASoC: rockchip: add new RK3308 sound card

 .../rockchip,rk3308-audio-graph-card.yaml     |   50 +
 .../bindings/sound/rockchip,rk3308-codec.yaml |  102 +
 MAINTAINERS                                   |   14 +
 arch/arm64/boot/dts/rockchip/rk3308.dtsi      |   68 +
 .../dt-bindings/sound/rockchip,rk3308-codec.h |   15 +
 include/sound/simple_card_utils.h             |    1 +
 sound/soc/codecs/Kconfig                      |   11 +
 sound/soc/codecs/Makefile                     |    2 +
 sound/soc/codecs/rk3308_codec.c               | 2122 +++++++++++++++++
 sound/soc/codecs/rk3308_codec.h               |  648 +++++
 sound/soc/generic/audio-graph-card.c          |    2 +
 sound/soc/rockchip/Kconfig                    |   14 +
 sound/soc/rockchip/Makefile                   |    1 +
 sound/soc/rockchip/rockchip_i2s_tdm.c         |   18 +-
 sound/soc/rockchip/rockchip_rk3308_card.c     |   97 +
 15 files changed, 3159 insertions(+), 6 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sound/rockchip,rk3308-audio-graph-card.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/rockchip,rk3308-codec.yaml
 create mode 100644 include/dt-bindings/sound/rockchip,rk3308-codec.h
 create mode 100644 sound/soc/codecs/rk3308_codec.c
 create mode 100644 sound/soc/codecs/rk3308_codec.h
 create mode 100644 sound/soc/rockchip/rockchip_rk3308_card.c

-- 
2.34.1

