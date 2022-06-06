Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 02CD353EE72
	for <lists+alsa-devel@lfdr.de>; Mon,  6 Jun 2022 21:20:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7D1661B0F;
	Mon,  6 Jun 2022 21:20:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7D1661B0F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654543255;
	bh=P1N4BsgZxARnYuz2PFM5gvoKvKngCq7DsoINvzTzaTU=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=m69zAyeS7tT+qXZhbWHlYHRfld14aHvJfN94VgIcZaJnr1dom3U6A67NC3tFjVVIG
	 9lakFyAzao07fDEijc/JFJLHOnsFlCJzjswaSJsuT1q8MqcYAtkxAdoHAJXEJOrOEH
	 tyn01l7KcokTcRsX9o3K0JgQvUTKq4G5UC+rdihA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CA443F804BC;
	Mon,  6 Jun 2022 21:19:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CD6E5F80109; Mon,  6 Jun 2022 21:19:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RDNS_NONE,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from hutie.ust.cz (unknown [IPv6:2a03:3b40:fe:f0::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E1CBFF80109
 for <alsa-devel@alsa-project.org>; Mon,  6 Jun 2022 21:19:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E1CBFF80109
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=cutebit.org header.i=@cutebit.org
 header.b="NTBH9HEp"
From: =?UTF-8?q?Martin=20Povi=C5=A1er?= <povik+lin@cutebit.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cutebit.org; s=mail;
 t=1654543191; bh=/hmKUt7bKZ+vS3xQgBgBubVAOQI0iUYXfBsj1iDGvNo=;
 h=From:To:Cc:Subject:Date;
 b=NTBH9HEpba5B0vY0Fb0D/5XET+BqBriweMvoXzWlV2IMrfLln9CzCQR4ds1HgKSun
 n9hBgB5grSVVoF5dVG5IoXB84nUpb6FFpU63OJD808r5gtjeNKHp7Ri68QE6uuFXMr
 16xzkpyosI07VekfptdOMf614aGaP6bxlswQ/QYU=
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: [RFC PATCH v2 0/5] Apple Macs machine/platform ASoC driver
Date: Mon,  6 Jun 2022 21:19:05 +0200
Message-Id: <20220606191910.16580-1-povik+lin@cutebit.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Sven Peter <sven@svenpeter.dev>, Hector Martin <marcan@marcan.st>,
 linux-kernel@vger.kernel.org, asahi@lists.linux.dev,
 Mark Kettenis <kettenis@openbsd.org>,
 =?UTF-8?q?Martin=20Povi=C5=A1er?= <povik+lin@cutebit.org>
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

This is again RFC with a machine-level ASoC driver for recent Apple Macs
with the M1 line of chips. This time I attached the platform driver too
for good measure. What I am interested in the most is checking the overall
approach, especially on two points (both in some ways already discussed
in previous RFC [0]):

 - The way the platform/machine driver handles the fact that multiple I2S
   ports (now backend DAIs) can be driven by/connected to the same SERDES
   unit (now in effect a frontend DAI). After previous discussion I have
   transitioned to DPCM to model this. I took the opportunity of dynamic
   backend/frontend routing to support speakers/headphones runtime
   switching. More on this in comments at top of the machine and platform
   driver.

 - The way the machine driver deactivates some of the controls where
   suitable, and limits volume on others. I added a new ASoC card method
   to that end.

Kind regards,
Martin

[0] https://lore.kernel.org/linux-devicetree/20220331000449.41062-1-povik+lin@cutebit.org/

Martin Povišer (5):
  dt-bindings: sound: Add Apple MCA I2S transceiver
  dt-bindings: sound: Add Apple Macs sound peripherals
  ASoC: apple: Add MCA platform driver for Apple SoCs
  ASoC: Introduce 'fixup_controls' card method
  ASoC: apple: Add macaudio machine driver

 .../bindings/sound/apple,macaudio.yaml        |  157 +++
 .../devicetree/bindings/sound/apple,mca.yaml  |  102 ++
 include/sound/soc-card.h                      |    1 +
 include/sound/soc.h                           |    1 +
 sound/soc/Kconfig                             |    1 +
 sound/soc/Makefile                            |    1 +
 sound/soc/apple/Kconfig                       |   25 +
 sound/soc/apple/Makefile                      |    5 +
 sound/soc/apple/macaudio.c                    | 1004 +++++++++++++++
 sound/soc/apple/mca.c                         | 1122 +++++++++++++++++
 sound/soc/soc-card.c                          |    6 +
 sound/soc/soc-core.c                          |    1 +
 12 files changed, 2426 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/apple,macaudio.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/apple,mca.yaml
 create mode 100644 sound/soc/apple/Kconfig
 create mode 100644 sound/soc/apple/Makefile
 create mode 100644 sound/soc/apple/macaudio.c
 create mode 100644 sound/soc/apple/mca.c

-- 
2.33.0

