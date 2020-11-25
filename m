Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 30EB02C45BA
	for <lists+alsa-devel@lfdr.de>; Wed, 25 Nov 2020 17:49:32 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C82B7177E;
	Wed, 25 Nov 2020 17:48:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C82B7177E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1606322971;
	bh=1EoeOU1HdN3bYTNow0bWtkQGItTZBUyVz0dyrz8aCbY=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YP1T8SWQ/Ezhls9JW1o9QIvVNpqITQOLgblaoDOfOl+ZDCIapqLWDOBn3XM1v9Psm
	 XrUDXZ3XbIFFdEnCG2ovvG1xInPPdVrCKbF4zXJg1NEI5h8J9uUHeQ8JG3ZVk6syje
	 PE/ARTzGYjYMOyeoOiTsRDSUKeqgfhoclhSS6RXY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2A277F804F1;
	Wed, 25 Nov 2020 17:45:47 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 83E98F804F3; Wed, 25 Nov 2020 17:45:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 57EF4F804F1
 for <alsa-devel@alsa-project.org>; Wed, 25 Nov 2020 17:45:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 57EF4F804F1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="dBUnr1cA"
Received: from localhost.localdomain (adsl-84-226-167-205.adslplus.ch
 [84.226.167.205])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0A70221973;
 Wed, 25 Nov 2020 16:45:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1606322741;
 bh=1EoeOU1HdN3bYTNow0bWtkQGItTZBUyVz0dyrz8aCbY=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=dBUnr1cADQ7AtUpsu8Sixmgan9lv5nsS3af2svJgeQ/q4XlrIQ9TCNndwGMAbn5II
 iltp+YDRQQKKQnul+GxBknQRNQWSm88TJWGCYa3XdFjz5OsyHQxlbmN5fe23aGbjQ0
 WtL3FsYIjgvHZWLRKI6u0HzjgQQlPu1Whqr7IPQU=
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
Subject: [PATCH v2 07/39] ASoC: kirkwood: armada-370-db: mark OF related data
 as maybe unused
Date: Wed, 25 Nov 2020 17:44:20 +0100
Message-Id: <20201125164452.89239-8-krzk@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201125164452.89239-1-krzk@kernel.org>
References: <20201125164452.89239-1-krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

  sound/soc/kirkwood/armada-370-db.c:137:34: warning: ‘a370db_dt_ids’ defined but not used [-Wunused-const-variable=]

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 sound/soc/kirkwood/armada-370-db.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/kirkwood/armada-370-db.c b/sound/soc/kirkwood/armada-370-db.c
index 8e44ae37ad1e..81326426da33 100644
--- a/sound/soc/kirkwood/armada-370-db.c
+++ b/sound/soc/kirkwood/armada-370-db.c
@@ -134,7 +134,7 @@ static int a370db_probe(struct platform_device *pdev)
 	return devm_snd_soc_register_card(card->dev, card);
 }
 
-static const struct of_device_id a370db_dt_ids[] = {
+static const struct of_device_id a370db_dt_ids[] __maybe_unused = {
 	{ .compatible = "marvell,a370db-audio" },
 	{ },
 };
-- 
2.25.1

