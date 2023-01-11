Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 22532665CF6
	for <lists+alsa-devel@lfdr.de>; Wed, 11 Jan 2023 14:50:18 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3F1A1E5F9;
	Wed, 11 Jan 2023 14:49:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3F1A1E5F9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673445017;
	bh=aNx5Q6K9Lx8YNm2d8ag0QMfKvOW0AfhYXR5k2agq+4Q=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=TDLwHN5gWNwNqUTKMfNQKHJfoQyWxvAbQ11UTFjirZI7v58Ym9S3PcIVSfBw+3scN
	 6vqNGNyUjNa4zAyiW0wkMcQVnvPERPsXbT8nJOidlJPIWirCYP0F8t5Y5t6d2W/9Jg
	 szqSZW0cm+nmKh3tWIlcPowO2yMdn6y6I+bw63/Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F3A57F8016E;
	Wed, 11 Jan 2023 14:49:18 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 35027F8016E; Wed, 11 Jan 2023 14:49:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 88B5FF8016E
 for <alsa-devel@alsa-project.org>; Wed, 11 Jan 2023 14:49:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 88B5FF8016E
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=olT+Jqya
Received: (Authenticated sender: herve.codina@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPA id AA53DFF805;
 Wed, 11 Jan 2023 13:49:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1673444956;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=Pdzxj+WuY057sZ95mrcpv8a0CMR2UrZnAp8NXQR+XeE=;
 b=olT+JqyaFSAi9vB+Q2ko+Lcm28jX1cujIriRuUsfGWXvg/hphmA0GbXFdr4Rs624Fn7Gti
 S9xyb0Q8MSmj18LbyyARyOF1zlp77g6PzXcTBU0gWa3Gedm4Cl/lNE1mIsaEzE+tYjHJLf
 H3MwTBmjtmtxomKDuZtdGkS/nitlisTy36BnVklm0fpLvpW6LPzyT5FWYE3m/DVhRjnrBk
 HZ4sIAtbQzwcqgG1ske4Ep+y6nv275xEpGdkDs7OHPKqX2q8OxUXaAltpPdSKfn0X6Q1yR
 6EglAH81B//R1gkUFJxe5hAZvvl/rmKch+7+iGqQdbxJdEtbO3vAoEZD1Uiiag==
From: Herve Codina <herve.codina@bootlin.com>
To: Herve Codina <herve.codina@bootlin.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Subject: [PATCH 0/3] Add the Renesas IDT821034 codec support
Date: Wed, 11 Jan 2023 14:49:02 +0100
Message-Id: <20230111134905.248305-1-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Christophe Leroy <christophe.leroy@csgroup.eu>,
 linux-gpio@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hi,

The Renesas IDT821034 codec is four channel PCM codec with
on-chip filters and programmable gain setting.
It also provides SLIC (Subscriber Line Interface Circuit)
signals as GPIOs.

Best regards,
Herve Codina

Herve Codina (3):
  dt-bindings: sound: Add Renesas IDT821034 codec
  ASoC: codecs: Add support for the Renesas IDT821034 codec
  MAINTAINERS: add the Renesas IDT821034 codec entry

 .../bindings/sound/renesas,idt821034.yaml     |   97 ++
 MAINTAINERS                                   |    7 +
 sound/soc/codecs/Kconfig                      |   12 +
 sound/soc/codecs/Makefile                     |    2 +
 sound/soc/codecs/idt821034.c                  | 1234 +++++++++++++++++
 5 files changed, 1352 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/renesas,idt821034.yaml
 create mode 100644 sound/soc/codecs/idt821034.c

-- 
2.38.1

