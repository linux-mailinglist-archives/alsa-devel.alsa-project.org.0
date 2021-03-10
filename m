Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F119333DE9
	for <lists+alsa-devel@lfdr.de>; Wed, 10 Mar 2021 14:35:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0E5D71767;
	Wed, 10 Mar 2021 14:34:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0E5D71767
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615383309;
	bh=fj5MmGfIxinbWNvrGLqZcoG8QaWhAecLiSTecn2Mof0=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=O7oX3ru//4zvfT2kUpqvWS3JUGAopBFC5BOskykdo6oACjr5fn4aWrYbkMgdz4AgT
	 tzLDCROSrN9C3UR4xqyJeyfm4SwpH4oBrT8tV9PhTm5I5M++VO+xvKGtdAI6/JtPa5
	 7vAO3auRf845dLIxnVjZbS/2lDkoIw0l0l4nqulQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0D373F80217;
	Wed, 10 Mar 2021 14:33:39 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5BFC5F8020D; Wed, 10 Mar 2021 14:33:34 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=RDNS_NONE,SPF_HELO_NONE,
 UNPARSEABLE_RELAY autolearn=disabled version=3.4.0
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by alsa1.perex.cz (Postfix) with ESMTP id CD7B4F8012F
 for <alsa-devel@alsa-project.org>; Wed, 10 Mar 2021 14:33:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CD7B4F8012F
X-UUID: 35be12979a3b4820865019ae070c219e-20210310
X-UUID: 35be12979a3b4820865019ae070c219e-20210310
Received: from mtkcas11.mediatek.inc [(172.21.101.40)] by mailgw02.mediatek.com
 (envelope-from <argus.lin@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.14 Build 0819 with TLSv1.2
 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 851875394; Wed, 10 Mar 2021 21:33:11 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 10 Mar 2021 21:33:09 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 10 Mar 2021 21:33:10 +0800
From: Argus Lin <argus.lin@mediatek.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob
 Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: [PATCH V2 0/2] Add mediatek MT6359 ASoC accdet jack driver
Date: Wed, 10 Mar 2021 21:33:04 +0800
Message-ID: <1615383186-18500-1-git-send-email-argus.lin@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
Cc: Jack Yu <jack.yu@realtek.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Lars-Peter Clausen <lars@metafoo.de>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Argus Lin <argus.lin@mediatek.com>, Arnd Bergmann <arnd@arndb.de>,
 "Shane.Chien" <shane.chien@mediatek.com>, linux-mediatek@lists.infradead.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Jiaxin Yu <jiaxin.yu@mediatek.com>, linux-kernel@vger.kernel.org,
 Chipeng Chang <chipeng.chang@mediatek.com>, Tzung-Bi Shih <tzungbi@google.com>,
 devicetree@vger.kernel.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Dan Murphy <dmurphy@ti.com>, Shuming Fan <shumingf@realtek.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>, alsa-devel@alsa-project.org,
 linux-arm-kernel@lists.infradead.org, wsd_upstream@mediatek.com
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

All of 3-pole and 4-pole jack are supported.

change since v2:
  - fixs missing blank at Kconfig.
  - fixs comment format and spelling mistake.
  - changes private structure mt6359_accdet to mt6359-accdet.h and uses this
    data as function parameter.
  - removes compatible string declaration.
  - uses regmap_read_poll_timeout as polling timer.
  - simplify jack detection and key detection report function.
  - adds mt6359_accdet_enable_jack_detect for sound card jack initialization.

change since v1:
  - adds mt6359 accdet binding document
  - adds mt6359 accdet driver

*** BLURB HERE ***

Argus Lin (2):
  dt-bindings: mediatek: mt6359: add ASoC mt6359 ASoC accdet jack
    document
  ASoC: mediatek: mt6359: add MT6359 accdet jack driver

 .../bindings/sound/mt6359-accdet.yaml         |  164 ++
 sound/soc/codecs/Kconfig                      |    8 +
 sound/soc/codecs/Makefile                     |    2 +
 sound/soc/codecs/mt6359-accdet.c              | 1080 ++++++++++
 sound/soc/codecs/mt6359-accdet.h              |  128 ++
 sound/soc/codecs/mt6359.h                     | 1864 ++++++++++++++++-
 6 files changed, 3139 insertions(+), 107 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sound/mt6359-accdet.yaml
 create mode 100644 sound/soc/codecs/mt6359-accdet.c
 create mode 100644 sound/soc/codecs/mt6359-accdet.h

--
2.18.0

