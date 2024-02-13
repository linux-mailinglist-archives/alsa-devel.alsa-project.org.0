Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CEEBD852D95
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Feb 2024 11:13:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D3A97B60;
	Tue, 13 Feb 2024 11:13:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D3A97B60
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1707819201;
	bh=ywd10UsSv5X9PzwqZG/+YKBc+M0eD2jqf72bCCzxHWk=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=aMBN1LhwdwoUgcGT9fSQGyNVfFugiWukYWJdn13JX0OpFtymX+BNZ47FFbe7d8SDw
	 Ij5ceMs5vRbDtREoDY7JIbkYDOVECdTKIQCx1+s7C64nfAYWWPFjffRen48kThWJPj
	 RZGqCfkF0uhqX7efABm0sGT5zFAMwkoD8O2qaObI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EF5FEF8015B; Tue, 13 Feb 2024 11:12:47 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9C57AF8059F;
	Tue, 13 Feb 2024 11:12:46 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A814EF80238; Tue, 13 Feb 2024 11:12:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id ED8A6F8016E
	for <alsa-devel@alsa-project.org>; Tue, 13 Feb 2024 11:12:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ED8A6F8016E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=K5QajlV1
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id ECC8D61336;
	Tue, 13 Feb 2024 10:12:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE8CCC433F1;
	Tue, 13 Feb 2024 10:12:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707819148;
	bh=ywd10UsSv5X9PzwqZG/+YKBc+M0eD2jqf72bCCzxHWk=;
	h=From:To:Cc:Subject:Date:From;
	b=K5QajlV1GWq4RfRrLAujUEthGfd1J4/FV2WEAhnBYNNYS83VXXKZZVK9zlpZSWVP4
	 spDptzhPgge/ohUOgNZJCavEXt2CVrTDosHIWs6o2LgQfPp/Dfgd9fHRelSs0EMT7s
	 6EG+p3qHVJil9fOuZfFcQEMAGTw/cjPSFaoom6UKV+8L/i4JFgdEXzT3KXo+IRAJuW
	 c+2Fge13nZ26rX96sAbnQVXoYyGo3hsbktzqCf1NoeN15BOqRNA3GqhNnIHZQ87IjE
	 JKC9YYTujQWktn83sCyNQNvoaRDQr0xmrgrJTsUkKvjn+lgz24AOT5beYT4fVQQZbX
	 rkmuRxgmeY7Lw==
From: Arnd Bergmann <arnd@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH] ASoC: meson: add helpers for clk_disable_unprepare
Date: Tue, 13 Feb 2024 11:11:38 +0100
Message-Id: <20240213101220.459641-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: VNN5UAZRV2SQEG67FXD7R6HVF2VAQZ7T
X-Message-ID-Hash: VNN5UAZRV2SQEG67FXD7R6HVF2VAQZ7T
X-MailFrom: arnd@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VNN5UAZRV2SQEG67FXD7R6HVF2VAQZ7T/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Arnd Bergmann <arnd@arndb.de>

Casting between incompatible function types causes a warning with clang-16
because it breaks control flow integrity (KCFI) rules:

sound/soc/meson/aiu.c:243:12: error: cast from 'void (*)(struct clk *)' to 'void (*)(void *)' converts to incompatible function type [-Werror,-Wcast-function-type-strict]
  243 |                                        (void(*)(void *))clk_disable_unprepare,
      |                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
include/linux/device.h:406:34: note: expanded from macro 'devm_add_action_or_reset'
  406 |         __devm_add_action_or_reset(dev, action, data, #action)
      |                                         ^~~~~~
sound/soc/meson/t9015.c:274:4: error: cast from 'void (*)(struct clk *)' to 'void (*)(void *)' converts to incompatible function type [-Werror,-Wcast-function-type-strict]
  274 |                         (void(*)(void *))clk_disable_unprepare,
      |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
include/linux/device.h:406:34: note: expanded from macro 'devm_add_action_or_reset'
  406 |         __devm_add_action_or_reset(dev, action, data, #action)
      |                                         ^~~~~~

These two meson drivers cast clk_disable_unprepare() into a different type
in order to have it automatically called from the driver relase. Add
trivial helpers to do the same using correct types.

Fixes: 33901f5b9b16 ("ASoC: meson: add t9015 internal DAC driver")
Fixes: 6ae9ca9ce986 ("ASoC: meson: aiu: add i2s and spdif support")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 sound/soc/meson/aiu.c   | 9 ++++++---
 sound/soc/meson/t9015.c | 9 ++++++---
 2 files changed, 12 insertions(+), 6 deletions(-)

diff --git a/sound/soc/meson/aiu.c b/sound/soc/meson/aiu.c
index 7109b81cc3d0..211f360df284 100644
--- a/sound/soc/meson/aiu.c
+++ b/sound/soc/meson/aiu.c
@@ -209,6 +209,11 @@ static const char * const aiu_spdif_ids[] = {
 	[MCLK]	= "spdif_mclk_sel"
 };
 
+static void aiu_clk_disable(void *clk)
+{
+	clk_disable_unprepare(clk);
+}
+
 static int aiu_clk_get(struct device *dev)
 {
 	struct aiu *aiu = dev_get_drvdata(dev);
@@ -239,9 +244,7 @@ static int aiu_clk_get(struct device *dev)
 		return ret;
 	}
 
-	ret = devm_add_action_or_reset(dev,
-				       (void(*)(void *))clk_disable_unprepare,
-				       aiu->pclk);
+	ret = devm_add_action_or_reset(dev, aiu_clk_disable, aiu->pclk);
 	if (ret)
 		dev_err(dev, "failed to add reset action on pclk");
 
diff --git a/sound/soc/meson/t9015.c b/sound/soc/meson/t9015.c
index 9c6b4dac6893..e0f9a603a5e9 100644
--- a/sound/soc/meson/t9015.c
+++ b/sound/soc/meson/t9015.c
@@ -243,6 +243,11 @@ static const struct regmap_config t9015_regmap_config = {
 	.max_register		= POWER_CFG,
 };
 
+static void t9015_clk_disable(void *clk)
+{
+	clk_disable_unprepare(clk);
+}
+
 static int t9015_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -270,9 +275,7 @@ static int t9015_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	ret = devm_add_action_or_reset(dev,
-			(void(*)(void *))clk_disable_unprepare,
-			priv->pclk);
+	ret = devm_add_action_or_reset(dev, t9015_clk_disable, priv->pclk);
 	if (ret)
 		return ret;
 
-- 
2.39.2

