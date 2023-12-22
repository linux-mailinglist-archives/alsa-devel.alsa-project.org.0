Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 79E2E82217A
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Jan 2024 19:56:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 825E51497;
	Tue,  2 Jan 2024 19:55:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 825E51497
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1704221763;
	bh=tueOFQBgCD2B3oRGng+uqU8LtI6YztW4wWLZC0YK9eY=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=lgrG3UTmAJWRgFYZ6suoAi6gsfQVsS9c93a9r2O+wchL90zOTZ2Xte0UugIMreYul
	 teJwZ5fFqeGwMqpcrBUsxjK2yr9PWXeaq4YxoRE22rUow2m4FzGqNu4F17StjipzOs
	 mKfo2fRH+uV5QYpAiw+XE40iDAV27yivF1EH8e5s=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 85423F8080C; Tue,  2 Jan 2024 19:51:04 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id ECF12F80C88;
	Tue,  2 Jan 2024 19:51:03 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 91D07F8016E; Fri, 22 Dec 2023 02:51:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx.dolansoft.org (s2.dolansoft.org [212.51.146.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6EA76F800D2
	for <alsa-devel@alsa-project.org>; Fri, 22 Dec 2023 02:50:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6EA76F800D2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=brun.one header.i=@brun.one header.a=rsa-sha256
 header.s=s1 header.b=SHLaK32k
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=brun.one;
	s=s1; h=MIME-Version:Message-ID:Date:Subject:Cc:To:From:In-Reply-To:
	References:From:To:Subject:Date:Message-ID:Reply-To;
	bh=zv1tp5EJGy8vjqEhUz2XKQPecD+fBNOlCqIMeS8hFok=; b=SHLaK32kHbJSEOFijM+QKWwfr4
	vvCF7413TMy6VwWc8NJ/tysH9/b1oIBUKceoxwJs0JYD1OkB/0YzNr+OyOR6k+G1CilIA9ECH9o6L
	v1/1j6z4fKXJGlArcSPEUrtbnWOen5eUJHhntYVMSU+dq9Qzem07Q2GtG4ncCnx9sjmDLgsY0nVFt
	gUFPfgWNNRex7Sapzpu0vL9rqxVpHF8lOqREpfhKTfYfYvOhiJrL2Eqt2cgk5bjukoAd4YE2tkFPn
	7wcQPuBbTCl4nt0FPKB2MtcGUZpbOSVOridCbqMLV6d0fcl17apvUXpbTTS/qmEikKI0QaSR5Vjzr
	KczlPPeQ==;
Received: from [212.51.153.89] (helo=blacklava.cluster.local)
	by mx.dolansoft.org with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <lorenz@dolansoft.org>)
	id 1rGUgc-000urd-0M;
	Fri, 22 Dec 2023 01:50:50 +0000
From: Lorenz Brun <lorenz@brun.one>
To: Stefan Binding <sbinding@opensource.cirrus.com>,
	James Schulman <james.schulman@cirrus.com>,
	David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org,
	patches@opensource.cirrus.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ALSA: hda: cs35l41: Add HP override
Date: Fri, 22 Dec 2023 02:50:39 +0100
Message-ID: <20231222015040.3024898-1-lorenz@brun.one>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: lorenz@dolansoft.org
X-MailFrom: lorenz@brun.one
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: WOUYCJVEGZFWP3CR3Y4IEYKI5ZQXULR2
X-Message-ID-Hash: WOUYCJVEGZFWP3CR3Y4IEYKI5ZQXULR2
X-Mailman-Approved-At: Mon, 01 Jan 2024 13:18:25 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WOUYCJVEGZFWP3CR3Y4IEYKI5ZQXULR2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This adds an override for a series of notebooks using a common config
taken from HP's proprietary Windows driver (csaudioext).

This has been tested on a HP 15-ey0xxxx device (subsystem 103C8A31)
together with another Realtek quirk and the calibration files from the
proprietary driver.

Signed-off-by: Lorenz Brun <lorenz@brun.one>
---
 sound/pci/hda/cs35l41_hda_property.c | 59 ++++++++++++++++++++++++++++
 1 file changed, 59 insertions(+)

diff --git a/sound/pci/hda/cs35l41_hda_property.c b/sound/pci/hda/cs35l41_hda_property.c
index c83328971728..8135ea532a94 100644
--- a/sound/pci/hda/cs35l41_hda_property.c
+++ b/sound/pci/hda/cs35l41_hda_property.c
@@ -6,6 +6,7 @@
 //
 // Author: Stefan Binding <sbinding@opensource.cirrus.com>
 
+#include <linux/acpi.h>
 #include <linux/gpio/consumer.h>
 #include <linux/string.h>
 #include "cs35l41_hda_property.h"
@@ -81,6 +82,42 @@ static int hp_vision_acpi_fix(struct cs35l41_hda *cs35l41, struct device *physde
 	return 0;
 }
 
+/*
+ * HP 2-channel I2C configuration with internal boost (4.1A inductor current) with no _DSD,
+ * reset GPIO can still be extracted from ACPI by index. Covers HP configurations 251, 252,
+ * 253, 254, 351, 352 and 353 in the proprietary driver (csaudioext).
+ */
+static int hp_i2c_2ch_vbst_ipk41(struct cs35l41_hda *cs35l41, struct device *physdev, int id,
+			      const char *hid)
+{
+	// In case a valid _DSD exists, use that instead of the override. This stops applying
+	// the override in case HP ever fixes their firmware.
+	if (device_property_count_u32(physdev, "cirrus,dev-index") > 0)
+		return -ENOENT;
+
+	struct cs35l41_hw_cfg *hw_cfg = &cs35l41->hw_cfg;
+
+	cs35l41->index = id == 0x40 ? 0 : 1;
+	cs35l41->channel_index = 0;
+	// Get reset GPIO (shared for both instances) from ACPI GpioIo at index 0.
+	cs35l41->reset_gpio = gpiod_get_index(physdev, NULL, 0, GPIOD_OUT_HIGH);
+	// Speaker ID GPIO is ACPI GpioIo index 1.
+	cs35l41->speaker_id = cs35l41_get_speaker_id(physdev, 0, 0, 1);
+
+	hw_cfg->spk_pos = cs35l41->index ? 1 : 0; // left:right
+	hw_cfg->gpio1.func = CS35L41_NOT_USED;
+	hw_cfg->gpio1.valid = true;
+	hw_cfg->gpio2.func = CS35L41_INTERRUPT;
+	hw_cfg->gpio2.valid = true;
+	hw_cfg->bst_type = CS35L41_INT_BOOST;
+	hw_cfg->bst_ind = 1000;
+	hw_cfg->bst_ipk = 4100;
+	hw_cfg->bst_cap = 10; // Exact value unknown, maps into correct range
+	hw_cfg->valid = true;
+
+	return 0;
+}
+
 struct cs35l41_prop_model {
 	const char *hid;
 	const char *ssid;
@@ -92,6 +129,28 @@ static const struct cs35l41_prop_model cs35l41_prop_model_table[] = {
 	{ "CLSA0100", NULL, lenovo_legion_no_acpi },
 	{ "CLSA0101", NULL, lenovo_legion_no_acpi },
 	{ "CSC3551", "103C89C6", hp_vision_acpi_fix },
+	{ "CSC3551", "103C8A28", hp_i2c_2ch_vbst_ipk41 },
+	{ "CSC3551", "103C8A29", hp_i2c_2ch_vbst_ipk41 },
+	{ "CSC3551", "103C8A2A", hp_i2c_2ch_vbst_ipk41 },
+	{ "CSC3551", "103C8A2B", hp_i2c_2ch_vbst_ipk41 },
+	{ "CSC3551", "103C8A2C", hp_i2c_2ch_vbst_ipk41 },
+	{ "CSC3551", "103C8A2D", hp_i2c_2ch_vbst_ipk41 },
+	{ "CSC3551", "103C8A2E", hp_i2c_2ch_vbst_ipk41 },
+	{ "CSC3551", "103C8A30", hp_i2c_2ch_vbst_ipk41 },
+	{ "CSC3551", "103C8A31", hp_i2c_2ch_vbst_ipk41 },
+	{ "CSC3551", "103C8BB3", hp_i2c_2ch_vbst_ipk41 },
+	{ "CSC3551", "103C8BB4", hp_i2c_2ch_vbst_ipk41 },
+	{ "CSC3551", "103C8BDF", hp_i2c_2ch_vbst_ipk41 },
+	{ "CSC3551", "103C8BE0", hp_i2c_2ch_vbst_ipk41 },
+	{ "CSC3551", "103C8BE1", hp_i2c_2ch_vbst_ipk41 },
+	{ "CSC3551", "103C8BE2", hp_i2c_2ch_vbst_ipk41 },
+	{ "CSC3551", "103C8BE9", hp_i2c_2ch_vbst_ipk41 },
+	{ "CSC3551", "103C8BDD", hp_i2c_2ch_vbst_ipk41 },
+	{ "CSC3551", "103C8BDE", hp_i2c_2ch_vbst_ipk41 },
+	{ "CSC3551", "103C8BE3", hp_i2c_2ch_vbst_ipk41 },
+	{ "CSC3551", "103C8BE5", hp_i2c_2ch_vbst_ipk41 },
+	{ "CSC3551", "103C8BE6", hp_i2c_2ch_vbst_ipk41 },
+	{ "CSC3551", "103C8B3A", hp_i2c_2ch_vbst_ipk41 },
 	{}
 };
 
-- 
2.42.0

