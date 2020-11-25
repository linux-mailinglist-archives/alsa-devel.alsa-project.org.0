Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C552D2C461C
	for <lists+alsa-devel@lfdr.de>; Wed, 25 Nov 2020 17:59:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5EE971852;
	Wed, 25 Nov 2020 17:58:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5EE971852
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1606323541;
	bh=WHszfzaet9THpQ07YzL3T8dCwt/v5KzLv3SE9+AV0Kc=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cTi65IXT8Gh4EdvS7sPRlK3+yn+m8ZRMB9LC5MGicfwNzT4vWD2wRCIWnt+upow1i
	 zHT337tlWe3WeB3w/LzVtXcHVccwO56vW3B5nsy50K/rdD2yNDKpvdz9ERKBZ5tt60
	 k15qZyM3MjM55nuI1y0Fxz7WM2Jcuz18B5Y9bPb0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 29B00F805D8;
	Wed, 25 Nov 2020 17:47:32 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DE015F805DA; Wed, 25 Nov 2020 17:47:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6816BF805D8
 for <alsa-devel@alsa-project.org>; Wed, 25 Nov 2020 17:47:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6816BF805D8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="chhnwZ13"
Received: from localhost.localdomain (adsl-84-226-167-205.adslplus.ch
 [84.226.167.205])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id CE4F52173E;
 Wed, 25 Nov 2020 16:47:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1606322846;
 bh=WHszfzaet9THpQ07YzL3T8dCwt/v5KzLv3SE9+AV0Kc=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=chhnwZ13LmhWF8rezbDeVIf/5F8dK/D/VCTGuEeNy2Ged+P/6IhYEoBJekx1EYGWN
 MfxNP0qMdBOz00S3GbuxrSBs/Tbsg84wO4hM/do8IJUWWMBzZxZmZ4vxNFgLkpV2wL
 /FsAkptCZeSktYPmDQcNNfKPXDsHfxxDza77HLVA=
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
Subject: [PATCH v2 31/39] ASoC: tlv320: skip of_device_id table when !CONFIG_OF
Date: Wed, 25 Nov 2020 17:44:44 +0100
Message-Id: <20201125164452.89239-32-krzk@kernel.org>
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

  sound/soc/codecs/tlv320aic23-i2c.c:38:34: warning: ‘tlv320aic23_of_match’ defined but not used [-Wunused-const-variable=]
  sound/soc/codecs/tlv320adcx140.c:1076:34: warning: ‘tlv320adcx140_of_match’ defined but not used [-Wunused-const-variable=]

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 sound/soc/codecs/tlv320adcx140.c   | 2 ++
 sound/soc/codecs/tlv320aic23-i2c.c | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/sound/soc/codecs/tlv320adcx140.c b/sound/soc/codecs/tlv320adcx140.c
index 53a80246aee1..3f027c8234a6 100644
--- a/sound/soc/codecs/tlv320adcx140.c
+++ b/sound/soc/codecs/tlv320adcx140.c
@@ -1073,6 +1073,7 @@ static struct snd_soc_dai_driver adcx140_dai_driver[] = {
 	}
 };
 
+#ifdef CONFIG_OF
 static const struct of_device_id tlv320adcx140_of_match[] = {
 	{ .compatible = "ti,tlv320adc3140" },
 	{ .compatible = "ti,tlv320adc5140" },
@@ -1080,6 +1081,7 @@ static const struct of_device_id tlv320adcx140_of_match[] = {
 	{},
 };
 MODULE_DEVICE_TABLE(of, tlv320adcx140_of_match);
+#endif
 
 static int adcx140_i2c_probe(struct i2c_client *i2c,
 			     const struct i2c_device_id *id)
diff --git a/sound/soc/codecs/tlv320aic23-i2c.c b/sound/soc/codecs/tlv320aic23-i2c.c
index 5025e5c43783..dbb8f969274c 100644
--- a/sound/soc/codecs/tlv320aic23-i2c.c
+++ b/sound/soc/codecs/tlv320aic23-i2c.c
@@ -35,11 +35,13 @@ static const struct i2c_device_id tlv320aic23_id[] = {
 
 MODULE_DEVICE_TABLE(i2c, tlv320aic23_id);
 
+#ifdef CONFIG_OF
 static const struct of_device_id tlv320aic23_of_match[] = {
 	{ .compatible = "ti,tlv320aic23", },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, tlv320aic23_of_match);
+#endif
 
 static struct i2c_driver tlv320aic23_i2c_driver = {
 	.driver = {
-- 
2.25.1

