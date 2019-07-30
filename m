Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D7C307A7DB
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Jul 2019 14:12:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4A1F617ED;
	Tue, 30 Jul 2019 14:11:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4A1F617ED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564488762;
	bh=47FVroqExWB4GbPWIYUwNrKQ+064c61S2wnUNSTqXws=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=EGDbnbVGfyw9AIJW+jX10nhYEeXiLjxHTs6tTtPS1qNoyzyfb9K1I4vpoVGfacs3E
	 rZif/5SfHmJT5LnsgZRasTBGZ5SH7Tnn87uRpR36+iilSGeTIjPTHZtR+JNE5mPuKM
	 yKEP3wF+gRAY3EwIHjzfIFEyuJToqo/X5jdaT6FY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8ABCCF80507;
	Tue, 30 Jul 2019 14:10:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 46293F804CC; Tue, 30 Jul 2019 14:10:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from imap1.codethink.co.uk (imap1.codethink.co.uk [176.9.8.82])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6D777F80214
 for <alsa-devel@alsa-project.org>; Tue, 30 Jul 2019 14:10:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6D777F80214
Received: from [167.98.27.226] (helo=ct-lt-1124.office.codethink.co.uk)
 by imap1.codethink.co.uk with esmtpsa (Exim 4.84_2 #1 (Debian))
 id 1hsQwp-0003E4-GQ; Tue, 30 Jul 2019 13:09:43 +0100
From: Thomas Preston <thomas.preston@codethink.co.uk>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Marco Felsch <m.felsch@pengutronix.de>,
 Paul Cercueil <paul@crapouillou.net>,
 Kirill Marinushkin <kmarinushkin@birdec.tech>,
 Cheng-Yi Chiang <cychiang@chromium.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Vinod Koul <vkoul@kernel.org>, Annaliese McDermond <nh6z@nh6z.net>,
 Thomas Preston <thomas.preston@codethink.co.uk>,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Date: Tue, 30 Jul 2019 13:09:34 +0100
Message-Id: <20190730120937.16271-1-thomas.preston@codethink.co.uk>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [alsa-devel] [PATCH v2 0/3] ASoC: Codecs: Add TDA7802 codec
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hi,
This patch series adds a driver for the ST TDA7802 amplifier.

Thank you Mark Brown, Charles Keepax, Cezary Rojewski and Kirill
Marinushkin for your time and useful feedback (on IRC too). Sorry for
taking so long in getting back to you, there were quite a lot of
changes!

Please let me know if there's anything else which needs changing.

Many thanks,
Thomas

Thomas Preston (3):
  dt-bindings: ASoC: Add TDA7802 amplifier
  ASoC: Add codec driver for ST TDA7802
  ASoC: TDA7802: Add turn-on diagnostic routine

 .../devicetree/bindings/sound/tda7802.txt     |  26 +
 sound/soc/codecs/Kconfig                      |   6 +
 sound/soc/codecs/Makefile                     |   2 +
 sound/soc/codecs/tda7802.c                    | 693 ++++++++++++++++++
 4 files changed, 727 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/tda7802.txt
 create mode 100644 sound/soc/codecs/tda7802.c

-- 
2.21.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
