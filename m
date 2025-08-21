Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 02363B4C239
	for <lists+alsa-devel@lfdr.de>; Tue,  9 Sep 2025 14:08:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 466D1601F9;
	Tue,  9 Sep 2025 14:07:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 466D1601F9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1757419687;
	bh=FwlXjDOvoPhU3ws3aopxzlxmseKwaQiXbFytY4DUmJs=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=i5xxyRORmJxpnMpagN+l91GYFFKifijuR5E96EX5tu+2L2X5aoBeHXXaKT5+Z7J8t
	 zf9rkK8ctB18/y1ybxxv5qFq3AAwuNly+BoHlZiNz7qLmM4CQ+LEPyAMTgFerJSJu3
	 PZ+/KEBLStVBHZe2W/irkL0VFyvLLOTuTcYHwWIA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C3114F805C1; Tue,  9 Sep 2025 14:07:33 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EFFA5F805C1;
	Tue,  9 Sep 2025 14:07:32 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 93EF4F80518; Thu, 21 Aug 2025 03:47:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-il1-f182.google.com (mail-il1-f182.google.com
 [209.85.166.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5F7E2F80152
	for <alsa-devel@alsa-project.org>; Thu, 21 Aug 2025 03:47:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5F7E2F80152
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=e+Kk+5n8
Received: by mail-il1-f182.google.com with SMTP id
 e9e14a558f8ab-3e570042988so4287505ab.2
        for <alsa-devel@alsa-project.org>;
 Wed, 20 Aug 2025 18:47:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755740860; x=1756345660;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=epz/iAe61wK5d2iPWv/y8Ta3anyLI9CMIK3ZJbjFUR0=;
        b=e+Kk+5n8oLQlgq5pvf2GF0kXIp1aeRvLOXVs6O6JJThPhzXJGGPd9hZLChULdNXDLC
         JqzArMyEJ3W7BqrYB5SgnRPc/B1sg2mcn2+VgJm+Bc1y6yVKr+v0MrNzsTP9GqdOljTr
         X7frfMJzC2IjvasfpdojVXwAWLWWYYbO7s1TMBzbttFU8yRBvbw6yx1ME2YSs2vO2JEV
         c8/SD/A98XVmiKKDF0wpL+PTWFiE/5KSB+FB6V+f0w+diTFL9e2b4i3bYx/zDjm7pEtL
         01yex+t29ee9mo5b+nivm32qUZWOynvkrRk2bFSmJSTPEBXrp99PaEo6BmyFyfo2Owjj
         2UuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755740860; x=1756345660;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=epz/iAe61wK5d2iPWv/y8Ta3anyLI9CMIK3ZJbjFUR0=;
        b=iN1F//oW2nGQ6a8WGCBZj68r54hMxiuliUmnkbqDLuE9UbrZyZJLcLWdQTYw0/ekAY
         N6BIyjOX/o67Zha8oDau9W8uiCSTUEQiIBBQVcvnUgt/94zxKoW5bvKci8nlJp7Ou0qj
         ari2oHu/W4tiPp7IXb+OYrSPV4eZuvnlLT9MXGrVARCC3Gd5qmugh9GHtV5KO2CdeHfO
         +0SIoJU6MVK7cZ5yYeksDaiFntdu1OYf7cquUs83hAQRWLSNmmlkRUQ9J2tJKKtu9kut
         TUJK4zzc62KGFCVZLWqVD0bE4QgDJdLuJrIbXBHRLe5clhb8Cd0B2C0xkfauES+WtkDw
         agvw==
X-Gm-Message-State: AOJu0Yw/ZtIgv6iLp/UG6YLxTW6T1VXo6bUcwi51NDF38Tdnc+0OUyQv
	wmrSXHKedJ3k36DR0HW8u6zu8d43EislTxH0ERsN+Qf2wT5IpKqHW1j8GEJyH5s/3Po=
X-Gm-Gg: ASbGncs7PZUin+Yb/o/OjeZtRnN8rx9YufaT2mumBJq/RfiJHzHk7cIgv/gUqsLkZLp
	xX1g9uFsklB0TRxCU7dx0KC16BAK1URnG6dBehCsRXh24hW5AZUjNqUJQOfvO1ma0qZORQ4EKZS
	/YSS7os8LjHCOp71z/613n/IBCOWrTpgpl74EdgZ9uFQv9lYbG8IRUyQHjk0F+o6CSpj4A/BSvX
	W6NXKoyXEVZcEhZrpcTFFv7Py8pckz3KRta7TWH3d+rMG6rgOYkYrWUmCFAnqB72HD2nFNryOel
	/FYGHQol/Yw1gH2+rNkZP4RnH9hv5EouunBRKOZ7RrtKAzlAQsH4yLKCG/BFrcMCTji+HS0qvkF
	77m8u1DZpaRXMBTMqzlG+sNk=
X-Google-Smtp-Source: 
 AGHT+IHZYK/ax1hgY4iz6VhBp4wSokshN6ZQFy/MFAt46+tVGOtms3R7YW/2E72HwIFvuBCTIlaxiQ==
X-Received: by 2002:a05:6e02:228b:b0:3e5:67a6:d417 with SMTP id
 e9e14a558f8ab-3e6d444027bmr13182265ab.8.1755740860024;
        Wed, 20 Aug 2025 18:47:40 -0700 (PDT)
Received: from aperture.lan ([2601:40a:8000:28d9::f29])
        by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3e67e6abec0sm12430875ab.48.2025.08.20.18.47.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Aug 2025 18:47:39 -0700 (PDT)
From: Brady Norander <bradynorander@gmail.com>
To: alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org
Cc: Mark Brown <broonie@kernel.org>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	amadeuszx.slawinski@linux.intel.com,
	tiwai@suse.de,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	pierre-louis.bossart@linux.intel.com,
	Brady Norander <bradynorander@gmail.com>
Subject: [PATCH] ALSA: hda: intel-dsp-config: Select SOF driver on MTL
 Chromebooks
Date: Wed, 20 Aug 2025 21:47:30 -0400
Message-ID: <20250821014730.8843-1-bradynorander@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: bradynorander@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: H23PQYMXXPVEU5RRX45FMS3BHBLCUVQG
X-Message-ID-Hash: H23PQYMXXPVEU5RRX45FMS3BHBLCUVQG
X-Mailman-Approved-At: Tue, 09 Sep 2025 12:07:22 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/H23PQYMXXPVEU5RRX45FMS3BHBLCUVQG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The SOF driver is required for functional audio on MTL Chromebooks

Signed-off-by: Brady Norander <bradynorander@gmail.com>
---
 sound/hda/core/intel-dsp-config.c | 19 ++++++++++++++++---
 1 file changed, 16 insertions(+), 3 deletions(-)

diff --git a/sound/hda/core/intel-dsp-config.c b/sound/hda/core/intel-dsp-config.c
index 3cb1e7fc3b3b..00f184917623 100644
--- a/sound/hda/core/intel-dsp-config.c
+++ b/sound/hda/core/intel-dsp-config.c
@@ -167,9 +167,9 @@ static const struct config_entry config_table[] = {
 
 /*
  * CoffeeLake, CannonLake, CometLake, IceLake, TigerLake, AlderLake,
- * RaptorLake use legacy HDAudio driver except for Google Chromebooks
- * and when DMICs are present. Two cases are required since Coreboot
- * does not expose NHLT tables.
+ * RaptorLake, MeteorLake use legacy HDAudio driver except for Google
+ * Chromebooks and when DMICs are present. Two cases are required since
+ * Coreboot does not expose NHLT tables.
  *
  * When the Chromebook quirk is not present, it's based on information
  * that no such device exists. When the quirk is present, it could be
@@ -516,6 +516,19 @@ static const struct config_entry config_table[] = {
 /* Meteor Lake */
 #if IS_ENABLED(CONFIG_SND_SOC_SOF_METEORLAKE)
 	/* Meteorlake-P */
+	{
+		.flags = FLAG_SOF,
+		.device = PCI_DEVICE_ID_INTEL_HDA_MTL,
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
 		.device = PCI_DEVICE_ID_INTEL_HDA_MTL,
-- 
2.50.1

