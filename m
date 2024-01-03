Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E882822B4C
	for <lists+alsa-devel@lfdr.de>; Wed,  3 Jan 2024 11:27:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9B8E3E7D;
	Wed,  3 Jan 2024 11:26:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9B8E3E7D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1704277622;
	bh=B8LTWZaAeIbbuTZxZBAE3c2hb3WyYLM2mLYP5O3fdx8=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=s9npLdTue8hQuY7W2NcpUwzVe9/sIWAdgH+c8m3J4yNo4XEhhMqeJT56/VFvaTJ2U
	 MEGPT8yuVzGE2WuBb+X0XBFriAX3IzpJ3ggQj0nGsrTYiWvYO3ooa41AhJRrrvmTLI
	 7IOho54uxyxdSGLizLahSU/8Mfse7SOqnnnePmbM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1C905F80563; Wed,  3 Jan 2024 11:26:25 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6ED9AF80557;
	Wed,  3 Jan 2024 11:26:25 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1F3F1F80424; Wed,  3 Jan 2024 11:26:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1F175F80051
	for <alsa-devel@alsa-project.org>; Wed,  3 Jan 2024 11:26:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1F175F80051
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=tQOV+NMa
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9F6B461312;
	Wed,  3 Jan 2024 10:26:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 941E3C433C7;
	Wed,  3 Jan 2024 10:26:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704277572;
	bh=B8LTWZaAeIbbuTZxZBAE3c2hb3WyYLM2mLYP5O3fdx8=;
	h=From:To:Cc:Subject:Date:From;
	b=tQOV+NMa5Ds7GmQ+XgOeCZs6na9Bdhl9C3je6Bs7yPrxzvv4ZV5TUxxowGlhJK8RT
	 t8KqMQJsjx4+SkkH96llUoB1cBIDcZItBB4hS4FrZPTzcDEcN4zFOQLTXS2e+TE8h9
	 zNCUnzpqtDMtri1Tw3fp02p5OoDhbJ2S8d5dbA6Gf36LXYMybaCcZFYdMpP24VECjE
	 HzPC0gbIW8FWuDn3CzkuMlRwxodvIqNw9aL57Gv+so14losMmhF21cx63o2vx48/Xo
	 zgN6fALvX6vg4jkGlbrSl1NQX9XSCnU4gSMci4hI5HtDUpgsNENm5/v7JkXZ+PG8Um
	 y244+T7nMQ2Zg==
From: Arnd Bergmann <arnd@kernel.org>
To: James Schulman <james.schulman@cirrus.com>,
	David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Stefan Binding <sbinding@opensource.cirrus.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Dorian Cruveiller <doriancruveiller@gmail.com>,
	Yang Yingliang <yangyingliang@huawei.com>,
	alsa-devel@alsa-project.org,
	patches@opensource.cirrus.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ALSA: hda: cs35l41: fix building without CONFIG_SPI
Date: Wed,  3 Jan 2024 11:25:59 +0100
Message-Id: <20240103102606.3742476-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: QH5IGO5VK47WENMD4TOBVTPYVGTUXPKC
X-Message-ID-Hash: QH5IGO5VK47WENMD4TOBVTPYVGTUXPKC
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QH5IGO5VK47WENMD4TOBVTPYVGTUXPKC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Arnd Bergmann <arnd@arndb.de>

When CONFIG_SPI is disabled, the driver produces unused-variable warning:

sound/pci/hda/cs35l41_hda_property.c: In function 'generic_dsd_config':
sound/pci/hda/cs35l41_hda_property.c:181:28: error: unused variable 'spi' [-Werror=unused-variable]
  181 |         struct spi_device *spi;
      |                            ^~~
sound/pci/hda/cs35l41_hda_property.c:180:27: error: unused variable 'cs_gpiod' [-Werror=unused-variable]
  180 |         struct gpio_desc *cs_gpiod;
      |                           ^~~~~~~~

Avoid these by turning the preprocessor contionals into equivalent C code,
which also helps readability.

Fixes: 916d051730ae ("ALSA: hda: cs35l41: Only add SPI CS GPIO if SPI is enabled in kernel")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 sound/pci/hda/cs35l41_hda_property.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/sound/pci/hda/cs35l41_hda_property.c b/sound/pci/hda/cs35l41_hda_property.c
index 52820ca9c603..a51fb6b0f56d 100644
--- a/sound/pci/hda/cs35l41_hda_property.c
+++ b/sound/pci/hda/cs35l41_hda_property.c
@@ -215,7 +215,6 @@ static int generic_dsd_config(struct cs35l41_hda *cs35l41, struct device *physde
 	if (cs35l41->control_bus == SPI) {
 		cs35l41->index = id;
 
-#if IS_ENABLED(CONFIG_SPI)
 		/*
 		 * Manually set the Chip Select for the second amp <cs_gpio_index> in the node.
 		 * This is only supported for systems with 2 amps, since we cannot expand the
@@ -224,7 +223,7 @@ static int generic_dsd_config(struct cs35l41_hda *cs35l41, struct device *physde
 		 * uses a native chip select), to ensure the second amp does not clash with the
 		 * first.
 		 */
-		if (cfg->cs_gpio_index >= 0) {
+		if (IS_ENABLED(CONFIG_SPI) && cfg->cs_gpio_index >= 0) {
 			spi = to_spi_device(cs35l41->dev);
 
 			if (cfg->num_amps != 2) {
@@ -255,7 +254,6 @@ static int generic_dsd_config(struct cs35l41_hda *cs35l41, struct device *physde
 				spi_setup(spi);
 			}
 		}
-#endif
 	} else {
 		if (cfg->num_amps > 2)
 			/*
-- 
2.39.2

