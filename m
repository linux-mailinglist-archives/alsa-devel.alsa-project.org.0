Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A49A77A875
	for <lists+alsa-devel@lfdr.de>; Sun, 13 Aug 2023 18:03:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1FE1F847;
	Sun, 13 Aug 2023 18:02:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1FE1F847
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691942589;
	bh=JZJ+UqTM6R1+teKsqGoVzT1N/KYEEqj8HjinAxqBI70=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=NCyrx7hYgZYZtEuFJhcn7RiGdu8a2ma88IVpUfm2PPedlXrgGlM5cZTrYshfaSI/Z
	 DwScZvfx9CMLBtXnkBH3+WBavsJ5bZu+KGP+XtJfo7JQBqwmcsr7PaudSZFFzrfkjk
	 Nl11qOHMmmXBpV9eo4RZ1Qy4KZG7n2b6uClOj5c8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C1CCEF80570; Sun, 13 Aug 2023 18:01:35 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 970C8F80568;
	Sun, 13 Aug 2023 18:01:35 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 337C0F8056F; Sun, 13 Aug 2023 18:01:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DBB7BF80564
	for <alsa-devel@alsa-project.org>; Sun, 13 Aug 2023 18:01:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DBB7BF80564
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=k/0fXpZD
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 9FE60634F9;
	Sun, 13 Aug 2023 16:01:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 931B6C433C8;
	Sun, 13 Aug 2023 16:01:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691942489;
	bh=JZJ+UqTM6R1+teKsqGoVzT1N/KYEEqj8HjinAxqBI70=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=k/0fXpZDB6ROwdpDjrkh7QZ8tDO/FTIRGp5wl+uTjZxpLH7uXCI8OEa83uVWj4nXS
	 6MtfteC6DtJIm4TyMTsWadjMWnPGgG5y0txnRsOyPaFgIGrW4MZBXB7+ItfMh4k2Oh
	 ih7AdCu+PpRcqV479YWaQip9aqkFhXAxJd8fTu5F3U8YXoxV6B63+9O7OYDvbFfWU6
	 65pBTMLATILEiPDqV8oonYw2d9PfljljbCtJf7FUrNIFCsvmsIzqPyPNtctLkrFf4w
	 L0jsrviUi6NaRtV2Ss205CZftAJa/nsDkTtWNq1/BEXbgd11FTsG0z3hHFQm7v6mws
	 tT6dIxVsy7pDg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Edson Juliano Drosdeck <edson.drosdeck@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	lgirdwood@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	wtli@nuvoton.com,
	u.kleine-koenig@pengutronix.de,
	alsa-devel@alsa-project.org
Subject: [PATCH AUTOSEL 6.1 15/47] ASoC: nau8821: Add DMI quirk mechanism for
 active-high jack-detect
Date: Sun, 13 Aug 2023 11:59:10 -0400
Message-Id: <20230813160006.1073695-15-sashal@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230813160006.1073695-1-sashal@kernel.org>
References: <20230813160006.1073695-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.1.45
Content-Transfer-Encoding: 8bit
Message-ID-Hash: GRCLNSVU57FHPEMCZTHMYP4CDTANXQA7
X-Message-ID-Hash: GRCLNSVU57FHPEMCZTHMYP4CDTANXQA7
X-MailFrom: sashal@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GRCLNSVU57FHPEMCZTHMYP4CDTANXQA7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Edson Juliano Drosdeck <edson.drosdeck@gmail.com>

[ Upstream commit 1bc40efdaf4a0ccfdb10a1c8e4b458f4764e8e5f ]

Add a quirk mechanism to allow specifying that active-high jack-detection
should be used on platforms where this info is not available in devicetree.

And add an entry for the Positivo CW14Q01P-V2 to the DMI table, so that
jack-detection will work properly on this laptop.

Signed-off-by: Edson Juliano Drosdeck <edson.drosdeck@gmail.com>
Link: https://lore.kernel.org/r/20230719200241.4865-1-edson.drosdeck@gmail.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/codecs/nau8821.c | 41 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/sound/soc/codecs/nau8821.c b/sound/soc/codecs/nau8821.c
index 4a72b94e84104..efd92656a060d 100644
--- a/sound/soc/codecs/nau8821.c
+++ b/sound/soc/codecs/nau8821.c
@@ -10,6 +10,7 @@
 #include <linux/acpi.h>
 #include <linux/clk.h>
 #include <linux/delay.h>
+#include <linux/dmi.h>
 #include <linux/init.h>
 #include <linux/i2c.h>
 #include <linux/module.h>
@@ -25,6 +26,13 @@
 #include <sound/tlv.h>
 #include "nau8821.h"
 
+#define NAU8821_JD_ACTIVE_HIGH			BIT(0)
+
+static int nau8821_quirk;
+static int quirk_override = -1;
+module_param_named(quirk, quirk_override, uint, 0444);
+MODULE_PARM_DESC(quirk, "Board-specific quirk override");
+
 #define NAU_FREF_MAX 13500000
 #define NAU_FVCO_MAX 100000000
 #define NAU_FVCO_MIN 90000000
@@ -1696,6 +1704,33 @@ static int nau8821_setup_irq(struct nau8821 *nau8821)
 	return 0;
 }
 
+/* Please keep this list alphabetically sorted */
+static const struct dmi_system_id nau8821_quirk_table[] = {
+	{
+		/* Positivo CW14Q01P-V2 */
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Positivo Tecnologia SA"),
+			DMI_MATCH(DMI_BOARD_NAME, "CW14Q01P-V2"),
+		},
+		.driver_data = (void *)(NAU8821_JD_ACTIVE_HIGH),
+	},
+	{}
+};
+
+static void nau8821_check_quirks(void)
+{
+	const struct dmi_system_id *dmi_id;
+
+	if (quirk_override != -1) {
+		nau8821_quirk = quirk_override;
+		return;
+	}
+
+	dmi_id = dmi_first_match(nau8821_quirk_table);
+	if (dmi_id)
+		nau8821_quirk = (unsigned long)dmi_id->driver_data;
+}
+
 static int nau8821_i2c_probe(struct i2c_client *i2c)
 {
 	struct device *dev = &i2c->dev;
@@ -1716,6 +1751,12 @@ static int nau8821_i2c_probe(struct i2c_client *i2c)
 
 	nau8821->dev = dev;
 	nau8821->irq = i2c->irq;
+
+	nau8821_check_quirks();
+
+	if (nau8821_quirk & NAU8821_JD_ACTIVE_HIGH)
+		nau8821->jkdet_polarity = 0;
+
 	nau8821_print_device_properties(nau8821);
 
 	nau8821_reset_chip(nau8821->regmap);
-- 
2.40.1

