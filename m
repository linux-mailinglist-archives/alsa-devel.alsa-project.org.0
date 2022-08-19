Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C165C599C5C
	for <lists+alsa-devel@lfdr.de>; Fri, 19 Aug 2022 14:57:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 71A40166C;
	Fri, 19 Aug 2022 14:56:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 71A40166C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1660913849;
	bh=CIs6R3j3wJSBbTqFzlH24xX51AZqopU33lU3PuI3Ljs=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=VYYUdEjfsKxJgIw5HO64PTyr4XVe0ojJ85ARVR0TcFi3PbaRYpfVuNWa05Ymn8qDh
	 e7yfFw5GPWqYqDB+t0aU08M5d8S+EHrEDK98sy9ilDS1Ng7yijcnpXybiqXjFR3kSh
	 pCu79N4IIdavUhMwPcMA7wZzCEVGfOa18OLcEl/g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ADC46F80217;
	Fri, 19 Aug 2022 14:54:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6F5E6F8051D; Fri, 19 Aug 2022 14:54:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from hutie.ust.cz (hutie.ust.cz [185.8.165.127])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 93EB0F804AA
 for <alsa-devel@alsa-project.org>; Fri, 19 Aug 2022 14:54:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 93EB0F804AA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=cutebit.org header.i=@cutebit.org
 header.b="g3bbBbdF"
From: =?UTF-8?q?Martin=20Povi=C5=A1er?= <povik+lin@cutebit.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cutebit.org; s=mail;
 t=1660913678; bh=tTprV1n7p44voEK5W8FVLH7SdnHe3gxie4vMBDCp63o=;
 h=From:To:Cc:Subject:Date;
 b=g3bbBbdFZKKhaFxMxs/5P6L1fMZgLmBIiA6e/vR1YREkdFAj0+ECIAR8LnylytQ1Z
 rFgsJ1ol7nBDkBgiqpiQZJJr+YE5jZAjtpq676mE/9HJLijT9x1LMReFuaJKeai+ZY
 YO4SV+cn+8FC1j/K+W6StvK74GrHtD/EpM8LP3zA=
To: =?UTF-8?q?Martin=20Povi=C5=A1er?= <povik+lin@cutebit.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>,
 Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH v2 0/4] ASoC platform driver for Apple MCA
Date: Fri, 19 Aug 2022 14:54:26 +0200
Message-Id: <20220819125430.4920-1-povik+lin@cutebit.org>
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

this is v2 of the ASoC platform driver for MCA peripheral on Apple M1,
to be followed by a machine driver later for sound support on the new
Apple devices. This time I attached a DTS patch for t8103 (M1), which
I guess should go through Marcan's (in CC) tree.

Martin

Changes since v1:
 - reflect the set_fmt provider/consumer change in 6.0-rc1
 - fix the probe function requesting optional reset
 - unroll 'dma-names' in schema
 - fix binding schema/code discrepancy in register ranges
 - minor things

Changes since 'macaudio RFC v2' [0]:
 - addition of locking (extra commit)
 - transition to set_bclk_ratio (instead of getting the bclk ratio from set_sysclk)
 - using shared reset control and documenting the reset in binding
 - formatting, comments, and a minor fix to hw driving

[0] https://lore.kernel.org/asahi/20220606191910.16580-1-povik+lin@cutebit.org/

Martin Povišer (4):
  dt-bindings: sound: Add Apple MCA I2S transceiver
  arm64: dts: apple: t8103: Add MCA and its support
  ASoC: apple: mca: Start new platform driver
  ASoC: apple: mca: Add locks on foreign cluster access

 .../devicetree/bindings/sound/apple,mca.yaml  |  131 ++
 MAINTAINERS                                   |    8 +
 arch/arm64/boot/dts/apple/t8103.dtsi          |   70 +
 sound/soc/Kconfig                             |    1 +
 sound/soc/Makefile                            |    1 +
 sound/soc/apple/Kconfig                       |    9 +
 sound/soc/apple/Makefile                      |    3 +
 sound/soc/apple/mca.c                         | 1170 +++++++++++++++++
 8 files changed, 1393 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/apple,mca.yaml
 create mode 100644 sound/soc/apple/Kconfig
 create mode 100644 sound/soc/apple/Makefile
 create mode 100644 sound/soc/apple/mca.c

-- 
2.33.0

