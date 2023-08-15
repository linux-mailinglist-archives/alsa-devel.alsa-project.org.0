Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 745DD77DFBC
	for <lists+alsa-devel@lfdr.de>; Wed, 16 Aug 2023 12:56:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9A1C0204;
	Wed, 16 Aug 2023 12:56:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9A1C0204
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692183414;
	bh=dm/3oqeCCKtP2aawYB3IEL1tCj5gab9IUDusFkOOqsY=;
	h=Date:From:To:Cc:Subject:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=uZIi8AItc+2sT8MPUi5NsReSp7oY1yK+ZhBtyTmmz1dL0FW8eNhp/sqL/kKEb/nNw
	 8O6d6rhg/sYMwHK2ywsj4kvrNy6fIqhRv4D1DfGjoCjU+aqZ73VnNXDAOFx7b7YUQ1
	 GZ9OMrkKvbVT5C5LYsCKjpvTO1kfjACHgtqtCPXU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B0742F80570; Wed, 16 Aug 2023 12:55:13 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1FDD6F80563;
	Wed, 16 Aug 2023 12:55:13 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 99826F80254; Tue, 15 Aug 2023 15:52:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-qk1-x733.google.com (mail-qk1-x733.google.com
 [IPv6:2607:f8b0:4864:20::733])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 68991F80074
	for <alsa-devel@alsa-project.org>; Tue, 15 Aug 2023 15:52:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 68991F80074
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=XzM4uEfQ
Received: by mail-qk1-x733.google.com with SMTP id
 af79cd13be357-76d56e98fabso17918985a.1
        for <alsa-devel@alsa-project.org>;
 Tue, 15 Aug 2023 06:52:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692107569; x=1692712369;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZD/9A8wzAJqEj7CNY1Mu6+CXd+X6uyqwZFSEccQn0Jg=;
        b=XzM4uEfQxXjV5ejFwP+PLxpy47UaG79MpaQdjOMbGG64gNAJosqWz1G8fAP+H05PMF
         yS0lq+QddjB3iDr09u5TD8MTZEwMOTH/32o3+WoAyVtBkkrF9mlEKwlW5DVSn4MlKDOv
         GDVk6fv02S4pza1gNJJfte4qr+wcNfi1YqWqixwWNu4g8vkFDUdeTODfFy85XfKKLxt0
         GTqB8lGVzmjmIBUZexRDs85t9OgxYcUgUUiAQhlKCqKZJKmTVkRCAaiMcA5UDDw2Z2B2
         +2ZvnN7ikYPF8X4AMrSlpAiefcYZYYN1PiZTyeVBG5gxwI2pCe9gJe8kEiG17P9fTD0j
         5vew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692107569; x=1692712369;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZD/9A8wzAJqEj7CNY1Mu6+CXd+X6uyqwZFSEccQn0Jg=;
        b=JvUCd4mFZ8DdYAzBhrVqyldTGQT/5oOnkV7sXNkctuPtz7gna/JHCOPPEpjoVq3z3i
         npngE9F7T3mdEwl/jUIlJ4eeZRD3taIXNOWNSGjnxIMyNlEKs8qLwSFkPskKy87vBK7Y
         5TLokJEh1zjNararK0RblSsSXbeT8nRX5Ia6w8bXiJTsICV7FPLwpDgJdlaua79Y37ZM
         ptSWCEym3ZycCbMPtN484H3eAOMQDzWAYDMw+qDNkIoLd2TJdaMyqmM/wweaVYQZb9s+
         Flfvj86AIRcLsioDgTHGrpfbWnvoWvGdNb7Yxv0QlPIkw3cukxdLk8sSUAcYMY69/HPN
         AsDA==
X-Gm-Message-State: AOJu0Yw+1PM/77eepuYJmedQ4TWXaw3GMMn/ydFK47sGeFZwFOJfes9l
	iMO/6utSPWn6uyW+naIw2Z3MkLfEf/jEfw==
X-Google-Smtp-Source: 
 AGHT+IGFRyWncQF7ozXNm9w8lnkhplXfxmWlJRtwQ5Y6ytF+XB/E3h/BKyKPLxNhuFv4aSNL5uT27g==
X-Received: by 2002:a05:620a:3952:b0:76c:cd9d:5edf with SMTP id
 qs18-20020a05620a395200b0076ccd9d5edfmr15721485qkn.6.1692107568888;
        Tue, 15 Aug 2023 06:52:48 -0700 (PDT)
Received: from arch (c-68-32-9-74.hsd1.mi.comcast.net. [68.32.9.74])
        by smtp.gmail.com with ESMTPSA id
 pa40-20020a05620a832800b0076c97ae43b9sm3739003qkn.66.2023.08.15.06.52.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Aug 2023 06:52:48 -0700 (PDT)
Date: Tue, 15 Aug 2023 09:52:46 -0400
From: Brady Norander <bradynorander@gmail.com>
To: alsa-devel@alsa-project.org, broonie@kernel.org
Cc: pierre-louis.bossart@linux.intel.com, cezary.rojewski@intel.com,
	amadeuszx.slawinski@linux.intel.com, perex@perex.cz, tiwai@suse.de,
	cujomalainey@chromium.org
Subject: [PATCH v2] ALSA: hda: intel-dsp-cfg: Add Chromebook quirk to ADL/RPL
Message-ID: <ZNuDLk5hgmfKrZg6@arch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-MailFrom: bradynorander@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: BX2LMHRQRIMPW2662BJSMZ3FXV57PKAY
X-Message-ID-Hash: BX2LMHRQRIMPW2662BJSMZ3FXV57PKAY
X-Mailman-Approved-At: Wed, 16 Aug 2023 10:55:08 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BX2LMHRQRIMPW2662BJSMZ3FXV57PKAY/>
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

v2: Removed quirk from SKUs not used in Chrome platforms

 sound/hda/intel-dsp-config.c | 60 +++++++++++++++++++++++++++++++++---
 1 file changed, 56 insertions(+), 4 deletions(-)

diff --git a/sound/hda/intel-dsp-config.c b/sound/hda/intel-dsp-config.c
index dcf2453138a5..24a948baf1bc 100644
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
@@ -408,6 +408,19 @@ static const struct config_entry config_table[] = {
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
@@ -434,14 +447,53 @@ static const struct config_entry config_table[] = {
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
-- 
2.41.0

