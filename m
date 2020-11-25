Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CB7FD2C45F1
	for <lists+alsa-devel@lfdr.de>; Wed, 25 Nov 2020 17:52:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5F8CE17B1;
	Wed, 25 Nov 2020 17:51:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5F8CE17B1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1606323131;
	bh=0HugLJZa8zS4Le6aM6WdEG5ldLVgwL6aMNqW9XESAyY=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SJaJfYW42YJNgjcWe7bqpEL+H+i33j1kLFYZxly6SJXIg+JDBMrLNqWekFdV8xpTW
	 9eNGtZacQU+X/0Bm0GjEVmbZUJYI62Vnrj7gRNnfYX0RU+/2dB1pCTXOUD3CW5t2Px
	 25/efuupeZDJkuDAlF5RVDNQLbAdxsViBcgmW5SQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6F3B3F80536;
	Wed, 25 Nov 2020 17:46:17 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2A5B2F80528; Wed, 25 Nov 2020 17:46:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CB3BAF8015A
 for <alsa-devel@alsa-project.org>; Wed, 25 Nov 2020 17:46:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CB3BAF8015A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="rqkENPgb"
Received: from localhost.localdomain (adsl-84-226-167-205.adslplus.ch
 [84.226.167.205])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 66BE021734;
 Wed, 25 Nov 2020 16:46:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1606322772;
 bh=0HugLJZa8zS4Le6aM6WdEG5ldLVgwL6aMNqW9XESAyY=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=rqkENPgbXoOKMgot+Dm0OoYJBa0IaaBVqyoNFF42d2n4g/yiR9J+GqkJGcJ/e8HX+
 Ae6SiVtKuirhuvDUJ4ktVXErrTp4aPUUtHiRE4F+SooyywYsPX0G7qNxPlGIUZWvPf
 Mq2UAkTOpDRxkADPNrr088Md1ZQAr2DuXiFRjx/k=
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
Subject: [PATCH v2 14/39] ASoC: ak4118: skip of_device_id table when !CONFIG_OF
Date: Wed, 25 Nov 2020 17:44:27 +0100
Message-Id: <20201125164452.89239-15-krzk@kernel.org>
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

The driver can match by multiple methods.  Its of_device_id table is
referenced via of_match_ptr() so it will be unused for !CONFIG_OF
builds:

  sound/soc/codecs/ak4118.c:407:34: warning: ‘ak4118_of_match’ defined but not used [-Wunused-const-variable=]

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 sound/soc/codecs/ak4118.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/codecs/ak4118.c b/sound/soc/codecs/ak4118.c
index f44d9a4a8507..5d46ae85566c 100644
--- a/sound/soc/codecs/ak4118.c
+++ b/sound/soc/codecs/ak4118.c
@@ -404,11 +404,13 @@ static int ak4118_i2c_probe(struct i2c_client *i2c,
 				&soc_component_drv_ak4118, &ak4118_dai, 1);
 }
 
+#ifdef CONFIG_OF
 static const struct of_device_id ak4118_of_match[] = {
 	{ .compatible = "asahi-kasei,ak4118", },
 	{}
 };
 MODULE_DEVICE_TABLE(of, ak4118_of_match);
+#endif
 
 static const struct i2c_device_id ak4118_id_table[] = {
 	{ "ak4118", 0 },
-- 
2.25.1

