Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EC51858D046
	for <lists+alsa-devel@lfdr.de>; Tue,  9 Aug 2022 00:44:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 320F683B;
	Tue,  9 Aug 2022 00:43:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 320F683B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1659998641;
	bh=MuJa+4mYCx1+97+82FhOQ7c7TU7qVzdMPI8P0/I2zaE=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=sX+/GuE2MUs0bCPavrRxTl+mfznHDsEjl5ouNkTcKUw0LMEF4+WBcskwvzCTMnCOF
	 CcCVfP6+7KUr49QZLrIAZxtoc4Y5dnCHf7BPEAdp/4UzSmt8zoQ5vknqOhiuUPQ1xS
	 hJrLTnON3yKMcJEnCSBE8Q30baTOw1uhVZqKhYW4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8643DF80507;
	Tue,  9 Aug 2022 00:43:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 26086F804E5; Tue,  9 Aug 2022 00:43:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from hutie.ust.cz (hutie.ust.cz [185.8.165.127])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 05319F800E8
 for <alsa-devel@alsa-project.org>; Tue,  9 Aug 2022 00:42:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 05319F800E8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=cutebit.org header.i=@cutebit.org
 header.b="RO6aXwxv"
From: =?UTF-8?q?Martin=20Povi=C5=A1er?= <povik+lin@cutebit.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cutebit.org; s=mail;
 t=1659998575; bh=vjy29MfdWk4pjl+jCL2RUCMpSKsefiHnDonIy4ZlDc4=;
 h=From:To:Cc:Subject:Date;
 b=RO6aXwxvIpL7I8JWWGKeuh6Uwmh0daPxXAgOQYy+dXsUyTL7Q5k/X5Tl6CxD64QiM
 ft/aRd9SeyW7X51J0DvvNljvX8YmA6/nQgq3IrmpNWubDYGiV3PLNQk/KbUsiUVPsH
 z+p4J67ohnjRgtbQMY9PQyO+sEfcoWU/BzTsnC2I=
To: =?UTF-8?q?Martin=20Povi=C5=A1er?= <povik+lin@cutebit.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH 0/3] ASoC platform driver for Apple MCA
Date: Tue,  9 Aug 2022 00:41:50 +0200
Message-Id: <20220808224153.3634-1-povik+lin@cutebit.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 asahi@lists.linux.dev, linux-kernel@vger.kernel.org
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

for review I am posting another version of the ASoC platform driver to be
used on Apple M1/M2 platforms (some previous version was attached to the
macaudio RFC v2 [0]).

Martin

Changes since [0]:
 - addition of locking (extra commit)
 - transition to set_bclk_ratio (instead of getting the bclk ratio from set_sysclk)
 - using shared reset control and documenting the reset in binding
 - formatting, comments, and a minor fix to hw driving

[0] https://lore.kernel.org/asahi/20220606191910.16580-1-povik+lin@cutebit.org/

Martin Povišer (3):
  dt-bindings: sound: Add Apple MCA I2S transceiver
  ASoC: apple: mca: Start new platform driver
  ASoC: apple: mca: Add locks on foreign cluster access

 .../devicetree/bindings/sound/apple,mca.yaml  |  109 ++
 MAINTAINERS                                   |    8 +
 sound/soc/Kconfig                             |    1 +
 sound/soc/Makefile                            |    1 +
 sound/soc/apple/Kconfig                       |    9 +
 sound/soc/apple/Makefile                      |    3 +
 sound/soc/apple/mca.c                         | 1173 +++++++++++++++++
 7 files changed, 1304 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/apple,mca.yaml
 create mode 100644 sound/soc/apple/Kconfig
 create mode 100644 sound/soc/apple/Makefile
 create mode 100644 sound/soc/apple/mca.c

-- 
2.33.0

