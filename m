Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 17AF07CFC33
	for <lists+alsa-devel@lfdr.de>; Thu, 19 Oct 2023 16:13:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 81FFDDEE;
	Thu, 19 Oct 2023 16:12:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 81FFDDEE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697724813;
	bh=VJRBQeeARhrQA3gjkNU7l+BbjQYzobkxNqVXpruzrX4=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=X7UR9FfMfyCWI4LTMbkKo4hYdo8PU6pfLncNjT5bioFtJnKPoTQKuIhnJJcLA/JMJ
	 ZxSS6B0U5HINktXOUw5sXFSVlp7d2iGSe4GYXbpVqmNt9sIjl/Of9S/RofbZ6QFaQK
	 CdfZ8Kq5haUkYb82T4+E97zoVOwyrNxzZFYRfNYo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D9C22F805EE; Thu, 19 Oct 2023 16:10:31 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 47F93F805E9;
	Thu, 19 Oct 2023 16:10:31 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CAEB6F8025F; Thu, 19 Oct 2023 02:00:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-il1-x12f.google.com (mail-il1-x12f.google.com
 [IPv6:2607:f8b0:4864:20::12f])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6E448F8019B
	for <alsa-devel@alsa-project.org>; Thu, 19 Oct 2023 02:00:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6E448F8019B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256
 header.s=google header.b=U/Y36J+b
Received: by mail-il1-x12f.google.com with SMTP id
 e9e14a558f8ab-35743e88193so30346185ab.3
        for <alsa-devel@alsa-project.org>;
 Wed, 18 Oct 2023 17:00:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1697673615; x=1698278415;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Z1HJODpBcMbzB2tUXUZxawzk68qAf00Djnx9IKBN0d8=;
        b=U/Y36J+bK3NVsF6TCiCs/B9rBfWL7ffxHNIiUOsLffpT5jM2rI8+5aaMj8vLMvqZy9
         6Vy1Yi69aFtzt1RElHEjHYhbsaajMK1QPiRJdTjJvMDaWDHm79AaqQfGtBwM9MonKB0E
         xhaZDaYHE0NAEQO8rH4sVh8auvbJ581oHD00w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697673615; x=1698278415;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z1HJODpBcMbzB2tUXUZxawzk68qAf00Djnx9IKBN0d8=;
        b=ccipFwZrxaCuOjxhQyJvRUyE7H7OVWXmjapR1FDn9VXXM8pU7SnNVeNm/IVboaOWRC
         J90xfeUKFw0pzW6zAAofMyh5rOhh8P1j6FYNxN5w67saOUu1T2FappnFokbz4ISiIB5q
         b35/7E9iU9vsiTz+caz2U0Hdp89KjlQkjqYD1ljqrpcAVZylrqUaUmwj3+QFpHAR5B4N
         h8VaUQWneF/sRl4hD7oIJ9r8G2AXdR25p+u/Nc6OrbNamHUYsQJQxNOhzbUxujn3DN4g
         HpGMCai7vnLavuLgNvaA64eoF8Px+WxUuP18dfilxEbAiiczzEHPicUMdKArQyAs/RkS
         IiIA==
X-Gm-Message-State: AOJu0YyciBzaupONwJucmOduZxhFpHk50JRJSDhL9sTSXMLg6YfSw42K
	Y9A4dTaRcst5sNKq5UBoAztP3g==
X-Google-Smtp-Source: 
 AGHT+IGb7/9XyHJU8tJSJRr+AOTGRuQiAjyMLpKpxv6aUrSVC/zA8mgpnLR6nLEsyXT+SILta4xVUA==
X-Received: by 2002:a05:6e02:2146:b0:351:e6e:7723 with SMTP id
 d6-20020a056e02214600b003510e6e7723mr1072598ilv.25.1697673614869;
        Wed, 18 Oct 2023 17:00:14 -0700 (PDT)
Received: from markhas1.lan (71-218-45-6.hlrn.qwest.net. [71.218.45.6])
        by smtp.gmail.com with ESMTPSA id
 z15-20020a92da0f000000b003512c3e8809sm1425870ilm.71.2023.10.18.17.00.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Oct 2023 17:00:08 -0700 (PDT)
From: Mark Hasemeyer <markhas@chromium.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Guenter Roeck <linux@roeck-us.net>,
	stable@vger.kernel.org,
	Mark Hasemeyer <markhas@chromium.org>,
	=?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Brady Norander <bradynorander@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Mark Brown <broonie@kernel.org>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org
Subject: [PATCH v1] ALSA: hda: intel-dsp-config: Fix JSL Chromebook quirk
 detection
Date: Wed, 18 Oct 2023 17:59:31 -0600
Message-ID: <20231018235944.1860717-1-markhas@chromium.org>
X-Mailer: git-send-email 2.42.0.655.g421f12c284-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: markhas@chromium.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: C7QK4XVFOYZGUQC242TYEWE4NM3F24AG
X-Message-ID-Hash: C7QK4XVFOYZGUQC242TYEWE4NM3F24AG
X-Mailman-Approved-At: Thu, 19 Oct 2023 14:10:16 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/C7QK4XVFOYZGUQC242TYEWE4NM3F24AG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Some Jasperlake Chromebooks overwrite the system vendor DMI value to the
name of the OEM that manufactured the device. This breaks Chromebook
quirk detection as it expects the system vendor to be "Google".

Add another quirk detection entry that looks for "Google" in the BIOS
version.

Cc: stable@vger.kernel.org
Signed-off-by: Mark Hasemeyer <markhas@chromium.org>
---

 sound/hda/intel-dsp-config.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/sound/hda/intel-dsp-config.c b/sound/hda/intel-dsp-config.c
index 24a948baf1bc..756fa0aa69bb 100644
--- a/sound/hda/intel-dsp-config.c
+++ b/sound/hda/intel-dsp-config.c
@@ -336,6 +336,12 @@ static const struct config_entry config_table[] = {
 					DMI_MATCH(DMI_SYS_VENDOR, "Google"),
 				}
 			},
+			{
+				.ident = "Google firmware",
+				.matches = {
+					DMI_MATCH(DMI_BIOS_VERSION, "Google"),
+				}
+			},
 			{}
 		}
 	},
-- 
2.42.0.655.g421f12c284-goog

