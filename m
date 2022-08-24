Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E16F059FF18
	for <lists+alsa-devel@lfdr.de>; Wed, 24 Aug 2022 18:08:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 78B45836;
	Wed, 24 Aug 2022 18:07:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 78B45836
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1661357304;
	bh=+EMxaI7QQbnp6VscJ/jjdFMCzU8B67jNLHJxVnF0ipU=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=UiWGHGh+T0eSm1CYWp2YMr2Pwb+JzAbWMy0rSsz7AJjjo6p3SBqlK6L9XSV557fqA
	 OnyQd95Jxys6/zRossYUiudOduGXtff/9bWpLlUA7B+Z6/fjP3nd/fjr5i53tAS6lp
	 OC36pEfQvdM7IVsB2/VLHf1wrp1jTQnQoFf2C8UA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D0A18F804C1;
	Wed, 24 Aug 2022 18:07:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0F8AFF800C8; Wed, 24 Aug 2022 18:07:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RDNS_NONE,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from hutie.ust.cz (unknown [IPv6:2a03:3b40:fe:f0::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 30409F800C8
 for <alsa-devel@alsa-project.org>; Wed, 24 Aug 2022 18:07:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 30409F800C8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=cutebit.org header.i=@cutebit.org
 header.b="a77t2Wm0"
From: =?UTF-8?q?Martin=20Povi=C5=A1er?= <povik+lin@cutebit.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cutebit.org; s=mail;
 t=1661357238; bh=vfSK7fJtUtZF7v3UQoemHYG11mAecyxCaxX8PYPRpzQ=;
 h=From:To:Cc:Subject:Date;
 b=a77t2Wm0ZCHFkidB88rzre6aeLIfhkq/9gl2n2ez05Cq3dJgUvznsbu/fv5l4gT4i
 yhhwM/fbFcx2NT7IxLSbNKRPbGc629r4k0zKZAJGqbYhXg8GVrYuOrvq7Su6zGzCXO
 GZERaZwHCqUxk0M1stlco3+9HLwh/DykEvT3LLno=
To: =?UTF-8?q?Martin=20Povi=C5=A1er?= <povik+lin@cutebit.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>,
 Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH v3 0/4] ASoC platform driver for Apple MCA
Date: Wed, 24 Aug 2022 18:07:11 +0200
Message-Id: <20220824160715.95779-1-povik+lin@cutebit.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 asahi@lists.linux.dev, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 linux-kernel@vger.kernel.org
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

sending what should be the final touches on Apple MCA driver. It most
likely goes without saying but please do not merge the DT additions
into the ASoC tree.

Martin

Changes since v2:
 - fix Mark's style nit
 - order compatibles in schema
 - redo the DT additions for t8103
 - remove stray unlock in mca_be_prepare (and rename the locking patch)
Link: https://lore.kernel.org/asahi/20220819125430.4920-1-povik+lin@cutebit.org/T/#t

Changes since v1:
 - reflect the set_fmt provider/consumer change in 6.0-rc1
 - fix the probe function requesting optional reset
 - unroll 'dma-names' in schema
 - fix binding schema/code discrepancy in register ranges
 - minor things
Link: https://lore.kernel.org/asahi/20220808224153.3634-1-povik+lin@cutebit.org/T/#t

Changes since 'macaudio RFC v2' [0]:
 - addition of locking (extra commit)
 - transition to set_bclk_ratio (instead of getting the bclk ratio from set_sysclk)
 - using shared reset control and documenting the reset in binding
 - formatting, comments, and a minor fix to hw driving
Link: https://lore.kernel.org/asahi/20220606191910.16580-1-povik+lin@cutebit.org/T/#t

Martin Povišer (4):
  dt-bindings: sound: Add Apple MCA I2S transceiver
  arm64: dts: apple: t8103: Add MCA and its support
  ASoC: apple: mca: Start new platform driver
  ASoC: apple: mca: Add locking

 .../devicetree/bindings/sound/apple,mca.yaml  |  131 ++
 MAINTAINERS                                   |    8 +
 arch/arm64/boot/dts/apple/t8103-jxxx.dtsi     |    4 +
 arch/arm64/boot/dts/apple/t8103.dtsi          |   73 ++
 sound/soc/Kconfig                             |    1 +
 sound/soc/Makefile                            |    1 +
 sound/soc/apple/Kconfig                       |    9 +
 sound/soc/apple/Makefile                      |    3 +
 sound/soc/apple/mca.c                         | 1167 +++++++++++++++++
 9 files changed, 1397 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/apple,mca.yaml
 create mode 100644 sound/soc/apple/Kconfig
 create mode 100644 sound/soc/apple/Makefile
 create mode 100644 sound/soc/apple/mca.c

-- 
2.33.0

