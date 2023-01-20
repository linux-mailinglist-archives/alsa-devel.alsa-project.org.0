Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B2A06751A1
	for <lists+alsa-devel@lfdr.de>; Fri, 20 Jan 2023 10:51:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 36BA32FEF;
	Fri, 20 Jan 2023 10:50:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 36BA32FEF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674208302;
	bh=X81Q/bt3eC/BuNr9iHLnfRHrufHa/iKLRfKSNSW98yc=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=XBs5nUbFd9j82OX8SpfP9tpwUIPDXMjZX3eggf3hru/f9l7LXW41TZvFaaxNnIXRw
	 XGcJbcSmzOs/IPCL5vJGojJicDohQ7oSV+FVP7Ob4cIdF72p+bAbfHKV23cJgI8cG+
	 6Kta6kUpOoPG84/X1BKE/J+Es3XsuJPPo2TcHY5I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B01C4F804A9;
	Fri, 20 Jan 2023 10:50:50 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9DAF6F8026D; Fri, 20 Jan 2023 10:50:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2513FF80246
 for <alsa-devel@alsa-project.org>; Fri, 20 Jan 2023 10:50:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2513FF80246
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=cV+FiBTW
Received: (Authenticated sender: herve.codina@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPA id BF483FF810;
 Fri, 20 Jan 2023 09:50:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1674208243;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=lhmoz3o5whEWeMQjpRNQYi4NdVypuHsB2pUQfSBp09A=;
 b=cV+FiBTWA5HBwpddXDbEkqJt1WcV6bG6R1zMmPTLcBKYWDOp/IY5jF6dl2tlqf+guLHUhA
 ymJlJIAbqVlnZp8N5BBTNfMfwagzJjQ3iFAvXLfe5bAuYUTBPk1oQJqKj4trCYL64b5TUa
 gZKpI5UO3nHyi1fL+jg7o6CZYjkzsdqZvFG8wEAvgqy113s2lMKZQ2DKyTeq7TfN9Vh4uU
 N4P87OdGkme28/3mgoYkjjkX7Wqm7IlFa+GyvKDxBQMlYUnDBRxNNW5qtFyAg8R+unKmpu
 4yvLSt5HuLWCiAwdsj/+LDG8BS6w0kBskS64+FJ//i5azLpKZhyJ5iPCsHVzeg==
From: Herve Codina <herve.codina@bootlin.com>
To: Herve Codina <herve.codina@bootlin.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Subject: [PATCH v2 0/3] Add the Renesas IDT821034 codec support
Date: Fri, 20 Jan 2023 10:50:33 +0100
Message-Id: <20230120095036.514639-1-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.39.0
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

The Renesas IDT821034 codec is four channel PCM codec with on-chip
filters and programmable gain setting.
It also provides SLIC (Subscriber Line Interface Circuit) signals as
GPIOs.

Based on previous iteration:
  https://lore.kernel.org/all/20230111134905.248305-1-herve.codina@bootlin.com/
the bigger change is the codec driver rework in order to remove the
regmap virtual registers layer.

Best regards,
Herve Codina

Changes v1 -> v2:
  - All patches
    Reformat commit log

  - Patch 1
    Remove '$ref: /schemas/gpio/gpio.yaml#'
    Use 'unevaluatedProperties: false'
    Update the node name and remove the sound node in the example

  - Patch 2
    Change the file header comment format
    Rework in order to remove the regmap virtual registers

Herve Codina (3):
  dt-bindings: sound: Add Renesas IDT821034 codec
  ASoC: codecs: Add support for the Renesas IDT821034 codec
  MAINTAINERS: add the Renesas IDT821034 codec entry

 .../bindings/sound/renesas,idt821034.yaml     |   75 ++
 MAINTAINERS                                   |    7 +
 sound/soc/codecs/Kconfig                      |   12 +
 sound/soc/codecs/Makefile                     |    2 +
 sound/soc/codecs/idt821034.c                  | 1200 +++++++++++++++++
 5 files changed, 1296 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/renesas,idt821034.yaml
 create mode 100644 sound/soc/codecs/idt821034.c

-- 
2.39.0

