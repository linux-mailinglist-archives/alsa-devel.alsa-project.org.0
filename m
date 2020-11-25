Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BAF8E2C4629
	for <lists+alsa-devel@lfdr.de>; Wed, 25 Nov 2020 18:00:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 485641874;
	Wed, 25 Nov 2020 17:59:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 485641874
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1606323631;
	bh=aJ5DCE3a/F2CE/pLLWpj1Y5grILcoc2Inrrstm95hBM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OvsjKG/nXSWvDvpribWSQd23NRjPdWH9fEpsQUq/5lFf2KyY48V/lCBnpdOtOZl4E
	 V5hD1Ss7LTlLzrVp7XS9pX0Ep9RzLPXs+AgimR6vPXVFNthUqe13duBDeQUgs4kbQ/
	 qn3mF4qBAjAh/dgssvn+3AGqwyKfq5fV6kOHuYhk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 545CEF805E9;
	Wed, 25 Nov 2020 17:47:50 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9ED5FF805EC; Wed, 25 Nov 2020 17:47:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2525FF80128
 for <alsa-devel@alsa-project.org>; Wed, 25 Nov 2020 17:47:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2525FF80128
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="oYlX/Paf"
Received: from localhost.localdomain (adsl-84-226-167-205.adslplus.ch
 [84.226.167.205])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 526542158C;
 Wed, 25 Nov 2020 16:47:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1606322864;
 bh=aJ5DCE3a/F2CE/pLLWpj1Y5grILcoc2Inrrstm95hBM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=oYlX/PafMEt3VgLEVAFz0P25RrNHjUgEdABl3WtA2Ds496EJJKB3dD7DyxCDHHivm
 cQJR7pkxx3aOLjdfFrEsJPzjTPBybQTT1iNp9yMcypN6apYRhdYsBtq+P+cKavLXCz
 MZQ5doBRyK7VOanmEOzyikpc8z81Osji/4Uk87Vc=
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Support Opensource <support.opensource@diasemi.com>,
 Oder Chiou <oder_chiou@realtek.com>,
 Kevin Cernekee <cernekee@chromium.org>,
 Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Patrick Lai <plai@codeaurora.org>,
 Banajit Goswami <bgoswami@codeaurora.org>,
 Heiko Stuebner <heiko@sntech.de>, Krzysztof Kozlowski <krzk@kernel.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Peter Ujfalusi <peter.ujfalusi@ti.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-rockchip@lists.infradead.org
Subject: [PATCH v2 35/39] ASoC: samsung: i2s: mark OF related data as maybe
 unused
Date: Wed, 25 Nov 2020 17:44:48 +0100
Message-Id: <20201125164452.89239-36-krzk@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201125164452.89239-1-krzk@kernel.org>
References: <20201125164452.89239-1-krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Sylwester Nawrocki <snawrocki@kernel.org>
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

The driver can be compile tested with !CONFIG_OF making certain data
unused:

  sound/soc/samsung/i2s.c:1646:42: warning: ‘i2sv5_dai_type_i2s1’ defined but not used [-Wunused-const-variable=]
  sound/soc/samsung/i2s.c:1639:42: warning: ‘i2sv7_dai_type’ defined but not used [-Wunused-const-variable=]

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
Reviewed-by: Sylwester Nawrocki <snawrocki@kernel.org>
---
 sound/soc/samsung/i2s.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/samsung/i2s.c b/sound/soc/samsung/i2s.c
index df53d4ea808f..1e89f2a285a9 100644
--- a/sound/soc/samsung/i2s.c
+++ b/sound/soc/samsung/i2s.c
@@ -1622,28 +1622,28 @@ static const struct samsung_i2s_dai_data i2sv3_dai_type = {
 	.i2s_variant_regs = &i2sv3_regs,
 };
 
-static const struct samsung_i2s_dai_data i2sv5_dai_type = {
+static const struct samsung_i2s_dai_data i2sv5_dai_type __maybe_unused = {
 	.quirks = QUIRK_PRI_6CHAN | QUIRK_SEC_DAI | QUIRK_NEED_RSTCLR |
 			QUIRK_SUPPORTS_IDMA,
 	.pcm_rates = SNDRV_PCM_RATE_8000_96000,
 	.i2s_variant_regs = &i2sv3_regs,
 };
 
-static const struct samsung_i2s_dai_data i2sv6_dai_type = {
+static const struct samsung_i2s_dai_data i2sv6_dai_type __maybe_unused = {
 	.quirks = QUIRK_PRI_6CHAN | QUIRK_SEC_DAI | QUIRK_NEED_RSTCLR |
 			QUIRK_SUPPORTS_TDM | QUIRK_SUPPORTS_IDMA,
 	.pcm_rates = SNDRV_PCM_RATE_8000_96000,
 	.i2s_variant_regs = &i2sv6_regs,
 };
 
-static const struct samsung_i2s_dai_data i2sv7_dai_type = {
+static const struct samsung_i2s_dai_data i2sv7_dai_type __maybe_unused = {
 	.quirks = QUIRK_PRI_6CHAN | QUIRK_SEC_DAI | QUIRK_NEED_RSTCLR |
 			QUIRK_SUPPORTS_TDM,
 	.pcm_rates = SNDRV_PCM_RATE_8000_192000,
 	.i2s_variant_regs = &i2sv7_regs,
 };
 
-static const struct samsung_i2s_dai_data i2sv5_dai_type_i2s1 = {
+static const struct samsung_i2s_dai_data i2sv5_dai_type_i2s1 __maybe_unused = {
 	.quirks = QUIRK_PRI_6CHAN | QUIRK_NEED_RSTCLR,
 	.pcm_rates = SNDRV_PCM_RATE_8000_96000,
 	.i2s_variant_regs = &i2sv5_i2s1_regs,
-- 
2.25.1

