Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AA3955155AD
	for <lists+alsa-devel@lfdr.de>; Fri, 29 Apr 2022 22:31:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 55DFF15C3;
	Fri, 29 Apr 2022 22:31:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 55DFF15C3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1651264314;
	bh=kAsfuPsvXs/HN4ujTEF3xFYlYjDqLSK6UGr16SYdfgE=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=WAfd4n4mtHu7qQDuXeFMd09EaWEQqlmu6YpaAt+atmkShJjNGIL7cYJTO7JOOCCkR
	 W+VGhXW6ohAHLQEKvDQXULOIYJAIHdyJAd5yT+1Lygk9QqX7Zz+zQDnmDuHq64kE76
	 sMuE70ZiHSuO3yHSu7GO3g2A9++5UYsXvYfRmWuk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C0568F80237;
	Fri, 29 Apr 2022 22:30:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 76F83F80269; Fri, 29 Apr 2022 22:30:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY
 autolearn=disabled version=3.4.0
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 666D1F8012B
 for <alsa-devel@alsa-project.org>; Fri, 29 Apr 2022 22:30:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 666D1F8012B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com
 header.b="SzxGQcTx"
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: nfraprado) with ESMTPSA id F0F751F469D0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1651264248;
 bh=kAsfuPsvXs/HN4ujTEF3xFYlYjDqLSK6UGr16SYdfgE=;
 h=From:To:Cc:Subject:Date:From;
 b=SzxGQcTxE6k2qTzzReHyLAe7jlJlmUGpQNWY3a7V6pXaK2tuz1vZS/4RJOREQKhu+
 vvIaaf9iFOYFCa51RkzPCWdRokKr27OFqStuzo7CCpSIGCLleJb3CGdUKnqoJMeNWH
 7inbr2ODyd+mR2fHnmYrohMxSdY5Q4TX5mFOgOZsZakXkuwQjLq7chiwpa3XimSxRU
 75RZ6J3mY0bnIY/RnYFT/getYOg+WDq2hTDd6i7MnJ0nV+g9xkZqc0oa98FQKQJ2H3
 YW6t3q8FTaV520N6M3TwEEmoviL/E1fKeRGkZJ6dGJukNSy/1WIezg8llGzqGMn7Ks
 9EKwLw8K1XAgw==
From: =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?=
 <nfraprado@collabora.com>
To: Mark Brown <broonie@kernel.org>
Subject: [PATCH 0/3] Add missing dt-binding properties for audio components on
 mt8192-asurada
Date: Fri, 29 Apr 2022 16:30:36 -0400
Message-Id: <20220429203039.2207848-1-nfraprado@collabora.com>
X-Mailer: git-send-email 2.36.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?=
 <nfraprado@collabora.com>, Tzung-Bi Shih <tzungbi@google.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Jiaxin Yu <jiaxin.yu@mediatek.com>,
 linux-kernel@vger.kernel.org, Shane Chien <shane.chien@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, kernel@collabora.com,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
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


These patches add properties that were missing on the dt-bindings of the
audio components used by mt8192-asurada. Namely the i2s-share
properties for the sound platform and the #sound-dai-cells on the
rt1015p and rt5682 codecs when they're referenced by the machine sound
node.


Nícolas F. R. A. Prado (3):
  ASoC: dt-bindings: mediatek: mt8192: Add i2s-share properties
  ASoC: dt-bindings: rt1015p: Add #sound-dai-cells
  ASoC: dt-bindings: rt5682: Add #sound-dai-cells

 Documentation/devicetree/bindings/sound/mt8192-afe-pcm.yaml  | 5 +++++
 Documentation/devicetree/bindings/sound/realtek,rt1015p.yaml | 3 +++
 Documentation/devicetree/bindings/sound/rt5682.txt           | 2 ++
 3 files changed, 10 insertions(+)

-- 
2.36.0

