Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C5BF77BB99
	for <lists+alsa-devel@lfdr.de>; Mon, 14 Aug 2023 16:29:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7F5E43E8;
	Mon, 14 Aug 2023 16:28:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7F5E43E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692023346;
	bh=3BgLbvRtoCY0AiEVmAlROH8iK5bSaAlR9hV1dS4uTig=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=cDNO91gEiZgYB0+h43NE/nJpV2XP+kkTKo5gQvVK0HBr4MoEAZcVBwriANZnViWUU
	 4XXa8DCYVpThSVoIjPOX3RpzgFxadRO0GEj6UNaXyTvWnVlfoQspPieAIRHqwok900
	 dkGKXWi8vCRRvIwKFX9UwHSb4MzRy1/Lz6yYpo5w=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CBF69F805B3; Mon, 14 Aug 2023 16:26:49 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2A67CF805AC;
	Mon, 14 Aug 2023 16:26:49 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 61670F8025F; Mon, 14 Aug 2023 03:28:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-qv1-xf2a.google.com (mail-qv1-xf2a.google.com
 [IPv6:2607:f8b0:4864:20::f2a])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A49F9F800EE
	for <alsa-devel@alsa-project.org>; Mon, 14 Aug 2023 03:28:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A49F9F800EE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=CVcw/zE6
Received: by mail-qv1-xf2a.google.com with SMTP id
 6a1803df08f44-64714a15a90so2563156d6.0
        for <alsa-devel@alsa-project.org>;
 Sun, 13 Aug 2023 18:28:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691976502; x=1692581302;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QsnzevOOmrHosrB1ePcsuVb4m2pWZVjb5JA4Lfc+Iu0=;
        b=CVcw/zE6HquCF+JFit791BKo0JtuZiYL2GBCQOasGOlQ/hfOltfsVdew+HzYnhlJzw
         O7v9h+ti70xL1wdOz0vQbuqctRb84iCutDNTuCLVWaYTzAdeKS5mqidjKCfvGyv066no
         t0pokwkTiD8A4uMdYj0wNFJjuUZlscijGGXq5zAvU4VGiykUtRNwY9KjGmCS5aIsvcsG
         lMeJe2mclsYDpaYYpk/nszEiqLOhCnxOaRG1X5ApNdgE5xSU+GEtjyxLNz/mHgB3qJA/
         7IcIfHQxwvOC06jaDh7uUHzpKjq2UCdXQZMOE1YaJgSOWLVW5tC7zWPiqE47+AXwXhWC
         WwZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691976502; x=1692581302;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QsnzevOOmrHosrB1ePcsuVb4m2pWZVjb5JA4Lfc+Iu0=;
        b=EoJMTfobEzu0FVtURCiWHQEX9b4rgH8xMkhYFYayLdvIh0OCdD1wbk/a8OPRWKptWS
         MVJIuUGRfKHFiWxLy8tDIvmc/EGIkqBp25yiVg+IVmzwlphSfQ0ZaxMouMk3uCcBWx1t
         TxjoBxABQtWZUZBLJGy/RjB7wp5rkpIIylK8nx79306OIUPk1r+ojdMRB2BEKHCT99OJ
         41Hks8jNV3NU+00GLk1MIdadnPrEepnWmP+NeOwUnicGcvshCG+7F+58T9jCBB27bk03
         PaivsvcF+VKCS8Sm2WRRQdymjxqAwZfu9R7uWnABQbAh3/700UAcKwHvTa1b+5Atfzpl
         uxyA==
X-Gm-Message-State: AOJu0Yw5a8W++dL17VPuscyS1AaAT6MbcZlT3TRfoVverue5p/QO6H1w
	m175YLHtR1tfDJnhZDVpTPxDHIvjjLdGqA==
X-Google-Smtp-Source: 
 AGHT+IFx1Qt4p9EjoOUsWkp5gdH7HtHxQBrZYbE/od/BQa4P0rKvS+SA+QJTGWeBZcM3rIFclMy0Yg==
X-Received: by 2002:a05:6214:5286:b0:63d:2d7e:39f1 with SMTP id
 kj6-20020a056214528600b0063d2d7e39f1mr12060331qvb.2.1691976502231;
        Sun, 13 Aug 2023 18:28:22 -0700 (PDT)
Received: from localhost.localdomain (c-68-32-9-74.hsd1.mi.comcast.net.
 [68.32.9.74])
        by smtp.gmail.com with ESMTPSA id
 s14-20020a0cdc0e000000b0063f822dae2csm758466qvk.54.2023.08.13.18.28.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Aug 2023 18:28:21 -0700 (PDT)
From: Brady Norander <bradynorander@gmail.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Cc: pierre-louis.bossart@linux.intel.com,
	cezary.rojewski@intel.com,
	amadeuszx.slawinski@linux.intel.com,
	perex@perex.cz,
	tiwai@suse.de,
	Brady Norander <bradynorander@gmail.com>
Subject: [PATCH] ALSA: hda: intel-dsp-cfg: Add Chromebook quirk to ADL/RPL
Date: Sun, 13 Aug 2023 21:26:37 -0400
Message-ID: <20230814012637.487602-1-bradynorander@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: bradynorander@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: KNI37ICJZDNKNHU6SGMSJ5Y4RAHOE6S2
X-Message-ID-Hash: KNI37ICJZDNKNHU6SGMSJ5Y4RAHOE6S2
X-Mailman-Approved-At: Mon, 14 Aug 2023 14:26:35 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KNI37ICJZDNKNHU6SGMSJ5Y4RAHOE6S2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

AlderLake and RaptorLake Chromebooks currently use the HDA driver by
default. Add a quirk to use the SOF driver on these platforms, which is
needed for functional internal audio.

Signed-off-by: Brady Norander <bradynorander@gmail.com>
---
 sound/hda/intel-dsp-config.c | 151 ++++++++++++++++++++++++++++++++++-
 1 file changed, 147 insertions(+), 4 deletions(-)

diff --git a/sound/hda/intel-dsp-config.c b/sound/hda/intel-dsp-config.c
index dcf2453138a5..5fb5abb76679 100644
--- a/sound/hda/intel-dsp-config.c
+++ b/sound/hda/intel-dsp-config.c
@@ -167,10 +167,10 @@ static const struct config_entry config_table[] = {
 #endif
 
 /*
- * CoffeeLake, CannonLake, CometLake, IceLake, TigerLake use legacy
- * HDAudio driver except for Google Chromebooks and when DMICs are
- * present. Two cases are required since Coreboot does not expose NHLT
- * tables.
+ * CoffeeLake, CannonLake, CometLake, IceLake, TigerLake, AlderLake,
+ * RaptorLake use legacy HDAudio driver except for Google Chromebooks
+ * and when DMICs are present. Two cases are required since Coreboot
+ * does not expose NHLT tables.
  *
  * When the Chromebook quirk is not present, it's based on information
  * that no such device exists. When the quirk is present, it could be
@@ -400,14 +400,53 @@ static const struct config_entry config_table[] = {
 
 /* Alder Lake / Raptor Lake */
 #if IS_ENABLED(CONFIG_SND_SOC_SOF_ALDERLAKE)
+	{
+		.flags = FLAG_SOF,
+		.device = PCI_DEVICE_ID_INTEL_HDA_ADL_S,
+		.dmi_table = (const struct dmi_system_id []) {
+			{
+				.ident = "Google Chromebooks",
+				.matches = {
+					DMI_MATCH(DMI_SYS_VENDOR, "Google"),
+				}
+			},
+			{}
+		}
+	},
 	{
 		.flags = FLAG_SOF | FLAG_SOF_ONLY_IF_DMIC_OR_SOUNDWIRE,
 		.device = PCI_DEVICE_ID_INTEL_HDA_ADL_S,
 	},
+	{
+		.flags = FLAG_SOF,
+		.device = PCI_DEVICE_ID_INTEL_HDA_RPL_S,
+		.dmi_table = (const struct dmi_system_id []) {
+			{
+				.ident = "Google Chromebooks",
+				.matches = {
+					DMI_MATCH(DMI_SYS_VENDOR, "Google"),
+				}
+			},
+			{}
+		}
+	},
 	{
 		.flags = FLAG_SOF | FLAG_SOF_ONLY_IF_DMIC_OR_SOUNDWIRE,
 		.device = PCI_DEVICE_ID_INTEL_HDA_RPL_S,
 	},
+	{
+		.flags = FLAG_SOF,
+		.device = PCI_DEVICE_ID_INTEL_HDA_ADL_P,
+		.dmi_table = (const struct dmi_system_id []) {
+			{
+				.ident = "Google Chromebooks",
+				.matches = {
+					DMI_MATCH(DMI_SYS_VENDOR, "Google"),
+				}
+			},
+			{}
+		}
+	},
 	{
 		.flags = FLAG_SOF,
 		.device = PCI_DEVICE_ID_INTEL_HDA_ADL_P,
@@ -417,10 +456,36 @@ static const struct config_entry config_table[] = {
 		.flags = FLAG_SOF | FLAG_SOF_ONLY_IF_DMIC_OR_SOUNDWIRE,
 		.device = PCI_DEVICE_ID_INTEL_HDA_ADL_P,
 	},
+	{
+		.flags = FLAG_SOF,
+		.device = PCI_DEVICE_ID_INTEL_HDA_ADL_PX,
+		.dmi_table = (const struct dmi_system_id []) {
+			{
+				.ident = "Google Chromebooks",
+				.matches = {
+					DMI_MATCH(DMI_SYS_VENDOR, "Google"),
+				}
+			},
+			{}
+		}
+	},
 	{
 		.flags = FLAG_SOF | FLAG_SOF_ONLY_IF_DMIC_OR_SOUNDWIRE,
 		.device = PCI_DEVICE_ID_INTEL_HDA_ADL_PX,
 	},
+	{
+		.flags = FLAG_SOF,
+		.device = PCI_DEVICE_ID_INTEL_HDA_ADL_PS,
+		.dmi_table = (const struct dmi_system_id []) {
+			{
+				.ident = "Google Chromebooks",
+				.matches = {
+					DMI_MATCH(DMI_SYS_VENDOR, "Google"),
+				}
+			},
+			{}
+		}
+	},
 	{
 		.flags = FLAG_SOF,
 		.device = PCI_DEVICE_ID_INTEL_HDA_ADL_PS,
@@ -430,26 +495,104 @@ static const struct config_entry config_table[] = {
 		.flags = FLAG_SOF | FLAG_SOF_ONLY_IF_DMIC_OR_SOUNDWIRE,
 		.device = PCI_DEVICE_ID_INTEL_HDA_ADL_PS,
 	},
+	{
+		.flags = FLAG_SOF,
+		.device = PCI_DEVICE_ID_INTEL_HDA_ADL_M,
+		.dmi_table = (const struct dmi_system_id []) {
+			{
+				.ident = "Google Chromebooks",
+				.matches = {
+					DMI_MATCH(DMI_SYS_VENDOR, "Google"),
+				}
+			},
+			{}
+		}
+	},
 	{
 		.flags = FLAG_SOF | FLAG_SOF_ONLY_IF_DMIC_OR_SOUNDWIRE,
 		.device = PCI_DEVICE_ID_INTEL_HDA_ADL_M,
 	},
+	{
+		.flags = FLAG_SOF,
+		.device = PCI_DEVICE_ID_INTEL_HDA_ADL_N,
+		.dmi_table = (const struct dmi_system_id []) {
+			{
+				.ident = "Google Chromebooks",
+				.matches = {
+					DMI_MATCH(DMI_SYS_VENDOR, "Google"),
+				}
+			},
+			{}
+		}
+	},
 	{
 		.flags = FLAG_SOF | FLAG_SOF_ONLY_IF_DMIC_OR_SOUNDWIRE,
 		.device = PCI_DEVICE_ID_INTEL_HDA_ADL_N,
 	},
+	{
+		.flags = FLAG_SOF,
+		.device = PCI_DEVICE_ID_INTEL_HDA_RPL_P_0,
+		.dmi_table = (const struct dmi_system_id []) {
+			{
+				.ident = "Google Chromebooks",
+				.matches = {
+					DMI_MATCH(DMI_SYS_VENDOR, "Google"),
+				}
+			},
+			{}
+		}
+	},
 	{
 		.flags = FLAG_SOF | FLAG_SOF_ONLY_IF_DMIC_OR_SOUNDWIRE,
 		.device = PCI_DEVICE_ID_INTEL_HDA_RPL_P_0,
 	},
+	{
+		.flags = FLAG_SOF,
+		.device = PCI_DEVICE_ID_INTEL_HDA_RPL_P_1,
+		.dmi_table = (const struct dmi_system_id []) {
+			{
+				.ident = "Google Chromebooks",
+				.matches = {
+					DMI_MATCH(DMI_SYS_VENDOR, "Google"),
+				}
+			},
+			{}
+		}
+	},
 	{
 		.flags = FLAG_SOF | FLAG_SOF_ONLY_IF_DMIC_OR_SOUNDWIRE,
 		.device = PCI_DEVICE_ID_INTEL_HDA_RPL_P_1,
 	},
+	{
+		.flags = FLAG_SOF,
+		.device = PCI_DEVICE_ID_INTEL_HDA_RPL_M,
+		.dmi_table = (const struct dmi_system_id []) {
+			{
+				.ident = "Google Chromebooks",
+				.matches = {
+					DMI_MATCH(DMI_SYS_VENDOR, "Google"),
+				}
+			},
+			{}
+		}
+	},
 	{
 		.flags = FLAG_SOF | FLAG_SOF_ONLY_IF_DMIC_OR_SOUNDWIRE,
 		.device = PCI_DEVICE_ID_INTEL_HDA_RPL_M,
 	},
+	{
+		.flags = FLAG_SOF,
+		.device = PCI_DEVICE_ID_INTEL_HDA_RPL_PX,
+		.dmi_table = (const struct dmi_system_id []) {
+			{
+				.ident = "Google Chromebooks",
+				.matches = {
+					DMI_MATCH(DMI_SYS_VENDOR, "Google"),
+				}
+			},
+			{}
+		}
+	},
 	{
 		.flags = FLAG_SOF | FLAG_SOF_ONLY_IF_DMIC_OR_SOUNDWIRE,
 		.device = PCI_DEVICE_ID_INTEL_HDA_RPL_PX,
-- 
2.41.0

