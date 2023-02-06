Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B68A068C07D
	for <lists+alsa-devel@lfdr.de>; Mon,  6 Feb 2023 15:50:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 52E6BDF;
	Mon,  6 Feb 2023 15:49:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 52E6BDF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675695020;
	bh=2QjzqA2nkdqdBnbpf6MqTrwdfZbbjxFnlPT2tL8LnYk=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=HmFNtz4tEheCwAyJHD+Kz+NpHNmiwnzbrvTVrvmGcUZ9mb2qg40brtToSEJ/FNS8E
	 6sQOhsQ513Om8P70loj+tmXmT5tQJp4YDhqJkUKeoPzltZSRs4wPzNnczzNPdauwvK
	 4ulfsI67T9G8M/n+HRE7NCIiMpCfuwCN7vi+xl7g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D4777F804FB;
	Mon,  6 Feb 2023 15:49:21 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 06C52F804F1; Mon,  6 Feb 2023 15:49:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no
 autolearn=ham autolearn_force=no version=3.4.6
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DC9EDF800E3
 for <alsa-devel@alsa-project.org>; Mon,  6 Feb 2023 15:49:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DC9EDF800E3
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=COQcQzPd
Received: (Authenticated sender: herve.codina@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPA id 1998A60008;
 Mon,  6 Feb 2023 14:49:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1675694956;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=jssNCiN7d9s4FVYSLSQNiyVO3Ef91kZOrafXDxLBvCU=;
 b=COQcQzPd++3+6kKr86fsnQKxAAOXJW0JTXfd8ACn3wA00LkZxrNz1Kn7mpHSDeIAA+FzP6
 4leRgqa2DKiybYvDlArlGTc0dc7bvn6zgIdD+n22GPxMCm0hLeLNqL9KyvhyWtL6GMeVYM
 u/p8VmGw9k650IasMSMs6PHscy2j8mkzlgdPD0d8c8OUXb1ij0r4LAvmcfvs1kVld330CJ
 nZToQi9xBPezbHbOn5iUdeIBu5Z7Z2JDERNeNMs4sL4KfjLAEPuUg2r+nUHJTP6vDszJWR
 qIvMgrFa3/WPw+6MaalIuHFzC/SHl9bcRGTDnKlP6zIbDVm5a0pwyW04X34TrA==
From: Herve Codina <herve.codina@bootlin.com>
To: Herve Codina <herve.codina@bootlin.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Subject: [PATCH 0/3] Add the Infineon PEB2466 codec support
Date: Mon,  6 Feb 2023 15:49:01 +0100
Message-Id: <20230206144904.91078-1-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.39.1
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

The Infineon PEB2466 codec is a programmable DSP-based four channels
codec with filters capabilities.
It also provides signals as GPIOs.

Best regards,
Herve Codina

Herve Codina (3):
  dt-bindings: sound: Add the Infineon PEB2466 codec
  ASoC: codecs: Add support for the Infineon PEB2466 codec
  MAINTAINERS: add the Infineon PEB2466 codec entry

 .../bindings/sound/infineon,peb2466.yaml      |   91 +
 MAINTAINERS                                   |    7 +
 sound/soc/codecs/Kconfig                      |   12 +
 sound/soc/codecs/Makefile                     |    2 +
 sound/soc/codecs/peb2466.c                    | 2071 +++++++++++++++++
 5 files changed, 2183 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/infineon,peb2466.yaml
 create mode 100644 sound/soc/codecs/peb2466.c

-- 
2.39.1

