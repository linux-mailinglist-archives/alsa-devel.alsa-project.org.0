Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ED6269F053
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Feb 2023 09:35:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6480BEAC;
	Wed, 22 Feb 2023 09:34:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6480BEAC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1677054905;
	bh=lMVKlOfDkk0mYYMw0oD9ZK9Wh8l6hTuHMAI9sUz17Vs=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=EIaAscWfUZenfJG9RDEo4qbhP3kYyjacXAOjRYxHQAMUn2jETxBhhyRCpZYzY4TH7
	 GU/2HxaAqCdGXjsKD2y7rtsHuqULUyUp0c18o/I9MeYtymnNgql5CYasGhE92fqMWw
	 q45jicqs2DS8US4K5WbbJ2NaDWjlA3jwkJs/1ams=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A5913F80525;
	Wed, 22 Feb 2023 09:33:24 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3F81FF80526; Wed, 22 Feb 2023 09:33:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6A23FF80266
	for <alsa-devel@alsa-project.org>; Wed, 22 Feb 2023 09:33:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6A23FF80266
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=odrhX/rw
Received: (Authenticated sender: kamel.bouhara@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id D91C81BF20B;
	Wed, 22 Feb 2023 08:33:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1677054789;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1qvG7uT+bYylpQqr8tYFzGZu06/xIT+ZSuYxbWKYKlc=;
	b=odrhX/rwYXXfvgN6lbMS3e3MhmDwAzB8WOQBjOvIRTYXM3WpLjWZfojMzDV/0td5BHtcJi
	zA+/2BG7s6teXPd5rPaBNouV3wlWwB/cREjT3VLNVB4huyuysI04hZo56DFll/XiFADQ9M
	wGRPESHvl81EvqZMktwlQVTwSvUMf7b8ppfYzbvqL+4rtE3evM2EHz+xZShTG/MVGCq6T/
	xLlm1DGrcgfZctM2pyD5WU3xRoUHDX+kQwX5tEj7UQvwbAGYqKAkkV4tnyqH5JyW1J9CcK
	h0KVi++8g4FSOPsXY5ywk3tUSP+hLOFi+8uoPLcc92/6Udbq/Hw4AnSH6EGsDA==
From: Kamel Bouhara <kamel.bouhara@bootlin.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Kevin Cernekee <cernekee@chromium.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Crt Mori <cmo@melexis.com>,
	alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] ASoC: tas571x: add support for TAS5733
Date: Wed, 22 Feb 2023 09:33:00 +0100
Message-Id: <20230222083300.218523-3-kamel.bouhara@bootlin.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20230222083300.218523-1-kamel.bouhara@bootlin.com>
References: <20230222083300.218523-1-kamel.bouhara@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: TBYOW3DSCGEP46SOC7TEH4CMZBQT2NWO
X-Message-ID-Hash: TBYOW3DSCGEP46SOC7TEH4CMZBQT2NWO
X-MailFrom: kamel.bouhara@bootlin.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Kamel Bouhara <kamel.bouhara@bootlin.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TBYOW3DSCGEP46SOC7TEH4CMZBQT2NWO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This adds support for TAS5733.

Signed-off-by: Kamel Bouhara <kamel.bouhara@bootlin.com>
---
 sound/soc/codecs/tas571x.c | 59 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 59 insertions(+)

diff --git a/sound/soc/codecs/tas571x.c b/sound/soc/codecs/tas571x.c
index 84ec1b527646..f39c3273b2fd 100644
--- a/sound/soc/codecs/tas571x.c
+++ b/sound/soc/codecs/tas571x.c
@@ -718,6 +718,63 @@ static const struct regmap_config tas5721_regmap_config = {
 	.volatile_table			= &tas571x_volatile_regs,
 };
 
+static const char *const tas5733_supply_names[] = {
+	"AVDD",
+	"DVDD",
+	"PVDD",
+};
+
+static const struct reg_default tas5733_reg_defaults[] = {
+	{TAS571X_CLK_CTRL_REG,          0x6c},
+	{TAS571X_DEV_ID_REG,            0x00},
+	{TAS571X_ERR_STATUS_REG,        0x00},
+	{TAS571X_SYS_CTRL_1_REG,        0xa0},
+	{TAS571X_SDI_REG,               0x05},
+	{TAS571X_SYS_CTRL_2_REG,        0x40},
+	{TAS571X_SOFT_MUTE_REG,         0x07},
+	{TAS571X_MVOL_REG,              0x03ff},
+	{TAS571X_CH1_VOL_REG,           0x00c0},
+	{TAS571X_CH2_VOL_REG,           0x00c0},
+	{TAS571X_CH3_VOL_REG,           0x00c0},
+	{TAS571X_VOL_CFG_REG,           0xf0},
+	{TAS571X_MODULATION_LIMIT_REG,  0x07},
+	{TAS571X_IC_DELAY_CH1_REG,      0xb8},
+	{TAS571X_IC_DELAY_CH2_REG,      0x60},
+	{TAS571X_IC_DELAY_CH3_REG,      0xa0},
+	{TAS571X_IC_DELAY_CH4_REG,      0x48},
+	{TAS571X_PWM_CH_SDN_GROUP_REG,  0x30},
+	{TAS571X_START_STOP_PERIOD_REG, 0x68},
+	{TAS571X_OSC_TRIM_REG,          0x82},
+	{TAS571X_BKND_ERR_REG,          0x02},
+	{TAS571X_INPUT_MUX_REG,         0x00897772},
+	{TAS571X_PWM_MUX_REG,           0x01021345},
+	{TAS5717_CH1_RIGHT_CH_MIX_REG,  0x00},
+	{TAS5717_CH1_LEFT_CH_MIX_REG,   0x800000},
+	{TAS5717_CH2_LEFT_CH_MIX_REG,   0x00},
+	{TAS5717_CH2_RIGHT_CH_MIX_REG,  0x800000},
+};
+
+static const struct regmap_config tas5733_regmap_config = {
+	.reg_bits                       = 8,
+	.val_bits                       = 32,
+	.max_register                   = 0xff,
+	.reg_read                       = tas571x_reg_read,
+	.reg_write                      = tas571x_reg_write,
+	.reg_defaults                   = tas5733_reg_defaults,
+	.num_reg_defaults               = ARRAY_SIZE(tas5733_reg_defaults),
+	.cache_type                     = REGCACHE_RBTREE,
+	.wr_table                       = &tas571x_write_regs,
+	.volatile_table                 = &tas571x_volatile_regs,
+};
+
+static const struct tas571x_chip tas5733_chip = {
+	.supply_names                   = tas5733_supply_names,
+	.num_supply_names               = ARRAY_SIZE(tas5733_supply_names),
+	.controls                       = tas5717_controls,
+	.num_controls                   = ARRAY_SIZE(tas5717_controls),
+	.regmap_config                  = &tas5733_regmap_config,
+	.vol_reg_size                   = 2,
+};
 
 static const struct tas571x_chip tas5721_chip = {
 	.supply_names			= tas5721_supply_names,
@@ -897,6 +954,7 @@ static const struct of_device_id tas571x_of_match[] __maybe_unused = {
 	{ .compatible = "ti,tas5717", .data = &tas5717_chip, },
 	{ .compatible = "ti,tas5719", .data = &tas5717_chip, },
 	{ .compatible = "ti,tas5721", .data = &tas5721_chip, },
+	{ .compatible = "ti,tas5733", .data = &tas5733_chip, },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, tas571x_of_match);
@@ -907,6 +965,7 @@ static const struct i2c_device_id tas571x_i2c_id[] = {
 	{ "tas5717", (kernel_ulong_t) &tas5717_chip },
 	{ "tas5719", (kernel_ulong_t) &tas5717_chip },
 	{ "tas5721", (kernel_ulong_t) &tas5721_chip },
+	{ "tas5733", (kernel_ulong_t) &tas5733_chip },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, tas571x_i2c_id);
-- 
2.35.1

