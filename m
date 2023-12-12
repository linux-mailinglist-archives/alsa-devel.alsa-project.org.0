Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E9518132F0
	for <lists+alsa-devel@lfdr.de>; Thu, 14 Dec 2023 15:23:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0572B843;
	Thu, 14 Dec 2023 15:23:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0572B843
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1702563806;
	bh=l5RhzxAetz9bFnk1vZ+yC41mfjjOw0R4OE+AZd2rEcM=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=ZlrXo/5aXsrB9oFerFEOr5M/SM89JR3/MYDwKAju6tlu92FXQQATNGf+P/o8AevHA
	 l748a6+84+3HyooNYj307RywZ9nkNyuXQmk2woZdKrcerC99bapFK1QE3HLL40AP7/
	 Z/VBXHASieoi+pJSGi0nKHd8YZpvYUNQJq2kKu8w=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 648C3F8057D; Thu, 14 Dec 2023 15:22:55 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2BF0CF80571;
	Thu, 14 Dec 2023 15:22:55 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B145AF8016A; Tue, 12 Dec 2023 20:52:57 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6A721F8001F
	for <alsa-devel@alsa-project.org>; Tue, 12 Dec 2023 20:52:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6A721F8001F
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=ayv2Ysnz
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-40c3fe6c1b5so32053655e9.2
        for <alsa-devel@alsa-project.org>;
 Tue, 12 Dec 2023 11:52:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702410765; x=1703015565;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=99wiKlmvZ0yOuhSozih/oH4sju55TXVCbZzwWmMlsn4=;
        b=ayv2Ysnzp/PYhgTDq9fSFYZPiLXxvoqQU/nF2UkkFBw6HBtuiZfC4AiTARsHwL0V/N
         LUQQTljGA83ejtyJ7G8wPTT8n0aBHOw+0l9mli7yOKeILNprRV3V1EqGb36vdlwqhmQn
         DcdzX3xguTxbtZ5KXpsQJLHL9QuLKo3KKc/ZyFPt2xSCp7pPcyPEInfhbN+862W2kGJW
         aD7ObgPT8yWFU2HSCiIC/3BFdRXpjokZ3hxfN3L0fF3q7DUpPvl1WSp8z70qvSLy6FwV
         N3bY+N8SOD9jmlgSnDZQcIradw2OGJaYbnWHMvk6JkULE2weFEjjrRY2IklX5wgSNcTq
         arpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702410765; x=1703015565;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=99wiKlmvZ0yOuhSozih/oH4sju55TXVCbZzwWmMlsn4=;
        b=RA560jnPicG8JWopykVayr7odVz/ymMoRp9pEDKL2BuQ7b9ploc0lgpj5UVMBfGAeh
         nd3Ym5uaIYmU0i0NurIELIo21RJL8oxeJQOhm1i5HPOK3fgKZJKIbMl3V7S+5idqXqpx
         7Dq9H3I+97JmG9s3E7pr28L85Jv2tVrOsK+KnlQTQTJ958mkWGPlm1S3GQdn9Q+JYYUW
         Ts+Xy9TrlgYe/7TjTTYX5R7ByVm+OntOOcwtdIqp14WF5/vLaQm/zg+PMelw/O1WHcPk
         RDhwzfC6R1JHAIctbPi0mYuLnx+Epz4s70gBfnFpZROsNrEbNQNbdfIdEXcCREQGw7Up
         GZUA==
X-Gm-Message-State: AOJu0YxnsKTv54tKiVOFF7rO6O8qpWQj26xpQzC7pvoBFZc3w4CIx6ZD
	dpSWOYTmQNlaR09oiQXASg==
X-Google-Smtp-Source: 
 AGHT+IFOwj3THLrh+pxCdwE4NuSW8VVqSrjWAbsSdvG6RxQkyYixxBUkZ22EmkKXaDkJNOkQowBuOw==
X-Received: by 2002:a7b:cd87:0:b0:40c:2b4c:623b with SMTP id
 y7-20020a7bcd87000000b0040c2b4c623bmr3150026wmj.52.1702410764505;
        Tue, 12 Dec 2023 11:52:44 -0800 (PST)
Received: from alex-pc-ubuntu.lan (31-10-153-16.cgn.dynamic.upc.ch.
 [31.10.153.16])
        by smtp.gmail.com with ESMTPSA id
 z4-20020adff1c4000000b003333af25cb2sm11488138wro.66.2023.12.12.11.52.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Dec 2023 11:52:44 -0800 (PST)
From: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
To: perex@perex.cz,
	tiwai@suse.com,
	sbinding@opensource.cirrus.com
Cc: james.schulman@cirrus.com,
	david.rhodes@cirrus.com,
	alsa-devel@alsa-project.org,
	patches@opensource.cirrus.com,
	linux-kernel@vger.kernel.org,
	Jasper Smet <josbeir@gmail.com>
Subject: [PATCH 1/1] ALSA: hda: cs35l41: Dell Fiorano add missing _DSD
 properties
Date: Tue, 12 Dec 2023 20:52:43 +0100
Message-Id: <20231212195243.10666-1-alex.vinarskis@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: alex.vinarskis@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: JUES2WRID4BEORZZRHB6KI7F2E7LG6K2
X-Message-ID-Hash: JUES2WRID4BEORZZRHB6KI7F2E7LG6K2
X-Mailman-Approved-At: Thu, 14 Dec 2023 14:22:49 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JUES2WRID4BEORZZRHB6KI7F2E7LG6K2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Dell XPS 9530 (2023) has two SPI connected CS35L41 amplifiers, however
is missing _DSD properties, cs-gpios and has a firmware bug which caps SPI
controller's speed to unusable 3051Hz. This patch adds _DSD properties and
sets second cs-gpio. In case SPI speed bug is detected, it will not
initialize the device to avoid hangs on wake up.

Resolution of SPI speed bug requires either a patch to `intel-lpss.c` or an
UEFI update with corrected values from Dell. Tested with locally applied
patch to `intel-lpss` on multiple XPS 9530 devices.

Co-developed-by: Jasper Smet <josbeir@gmail.com>
Signed-off-by: Jasper Smet <josbeir@gmail.com>
Signed-off-by: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
---
 sound/pci/hda/cs35l41_hda_property.c | 47 ++++++++++++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/sound/pci/hda/cs35l41_hda_property.c b/sound/pci/hda/cs35l41_hda_property.c
index c83328971728..69446a794397 100644
--- a/sound/pci/hda/cs35l41_hda_property.c
+++ b/sound/pci/hda/cs35l41_hda_property.c
@@ -7,9 +7,55 @@
 // Author: Stefan Binding <sbinding@opensource.cirrus.com>
 
 #include <linux/gpio/consumer.h>
+#include <linux/spi/spi.h>
 #include <linux/string.h>
 #include "cs35l41_hda_property.h"
 
+/*
+ * Device 10280BEB (Dell XPS 9530) doesn't have _DSD at all. Moreover, pin that is typically
+ * used for `speaker_id` is missing. SPI's cs-gpios definitions are also missing.
+ */
+static int dell_fiorano_no_acpi(struct cs35l41_hda *cs35l41, struct device *physdev, int id,
+				const char *hid)
+{
+	struct cs35l41_hw_cfg *hw_cfg = &cs35l41->hw_cfg;
+	struct spi_device *spi = to_spi_device(cs35l41->dev);
+
+	/*
+	 * 10280BEB has a firmware bug, which wrongly enables clock divider for intel-lpss
+	 * Resultant SPI clock is 100Mhz/32767=3051Hz, which leads to ~3 minute hang on boot/wake up
+	 * Avoid initializing device if lpss was not patched/fixed UEFI was not installed
+	 */
+	if (spi->max_speed_hz < CS35L41_SPI_MAX_FREQ) {
+		dev_err(cs35l41->dev, "SPI's max_speed_hz is capped at %u Hz, will not continue to avoid hanging\n",
+			spi->max_speed_hz);
+		return -EINVAL;
+	}
+
+	dev_info(cs35l41->dev, "Adding DSD properties for %s\n", cs35l41->acpi_subsystem_id);
+
+	/* check SPI address to assign the index */
+	cs35l41->index = id;
+	cs35l41->channel_index = 0;
+	/* 10280BEB is missing pin which is typically assigned to `spk-id-gpios` */
+	cs35l41->speaker_id = cs35l41_get_speaker_id(physdev, cs35l41->index, 2, -1);
+	cs35l41->reset_gpio = gpiod_get_index(physdev, NULL, 1, GPIOD_OUT_LOW);
+
+	hw_cfg->spk_pos = cs35l41->index  ? 1 : 0;	// 0th L, 1st R
+	hw_cfg->bst_type = CS35L41_EXT_BOOST;
+	hw_cfg->gpio1.func = CS35l41_VSPK_SWITCH;
+	hw_cfg->gpio1.valid = true;
+	hw_cfg->gpio2.func = CS35L41_INTERRUPT;
+	hw_cfg->gpio2.valid = true;
+	hw_cfg->valid = true;
+
+	/* Add second cs-gpio here */
+	if (cs35l41->index)
+		spi->cs_gpiod = gpiod_get_index(physdev, NULL, 0, GPIOD_OUT_HIGH);
+
+	return 0;
+}
+
 /*
  * Device CLSA010(0/1) doesn't have _DSD so a gpiod_get by the label reset won't work.
  * And devices created by serial-multi-instantiate don't have their device struct
@@ -92,6 +138,7 @@ static const struct cs35l41_prop_model cs35l41_prop_model_table[] = {
 	{ "CLSA0100", NULL, lenovo_legion_no_acpi },
 	{ "CLSA0101", NULL, lenovo_legion_no_acpi },
 	{ "CSC3551", "103C89C6", hp_vision_acpi_fix },
+	{ "CSC3551", "10280BEB", dell_fiorano_no_acpi },
 	{}
 };
 
-- 
2.40.1

