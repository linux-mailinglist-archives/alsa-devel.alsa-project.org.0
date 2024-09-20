Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EB55C98BC2C
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Oct 2024 14:35:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7E75293A;
	Tue,  1 Oct 2024 14:35:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7E75293A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1727786129;
	bh=UMPI6dbr3vZF/IEea0Gxx5qCUzLzf9e2xNJR+bN0i6E=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=Sbq+x4JFPMUPMl48bSOiTDCFQiBUYrzaSF13hmdzm/JhXY7rnoLFjFry83CJB7RTO
	 RBNw+XQuCjb0vr6I1IcaLaG6U+tv7Ey3LxjYikk7HysXbz2i09KvbzKMz2Q2M5JcrQ
	 EtFiKZ20OF/pYszdXyZyk7uC9JPWG2TAliU4YO64=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E994DF805BB; Tue,  1 Oct 2024 14:34:58 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7B730F805B1;
	Tue,  1 Oct 2024 14:34:57 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4419AF8020D; Fri, 20 Sep 2024 17:10:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1D996F8010B
	for <alsa-devel@alsa-project.org>; Fri, 20 Sep 2024 17:10:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1D996F8010B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=baylibre-com.20230601.gappssmtp.com
 header.i=@baylibre-com.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=MbdjlgFF
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-42cb0f28bfbso18409995e9.1
        for <alsa-devel@alsa-project.org>;
 Fri, 20 Sep 2024 08:10:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1726845018;
 x=1727449818; darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dqxB4KzGedlZDzswgDTRSffnag1Yh8CdsgK618Kt3iI=;
        b=MbdjlgFFjHenEoNvZj3zAcvDaiffGv+aXOG/fAJ+UgwqY8rYS+a2psCp9iM4KsvPXQ
         LLWVI3+R24s3zxQrOr52q0f8pYNEPi3XWqPif2IcFERigznICHfPbWL2bZMsK5mwsebR
         9vRZgh8xDAmAuBvD/4fMdTDxEJ2nrWBeSnTqZyqakj0M0v/yksk5XXXbLYZNm4lfffbp
         JaTURUdnVAT3DOxygXIiA9DWTYzPUrsy3gb2myXdQR8M4Lp3QolJ6bwPcIsYrK+/enyv
         /fmI/Kbg1m6lZyorv+fLc+coUULxVRpyd5iSe7tQZCan8mOczVHpphXaZ/aTjwQCs6Hs
         m0HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726845018; x=1727449818;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dqxB4KzGedlZDzswgDTRSffnag1Yh8CdsgK618Kt3iI=;
        b=xCvZ3FARkJBqS2Ri+2aGZg2tMaFacl710KczaAMaU9VmlDkGiNoeM0QnXscGlkk6id
         NVCrU7PjF4vcjpG6U4x29OqoMpaZ32bqOPuT5VhYIc7t2wp0ZMwbSK+5b1h/uoP6A9iT
         B3LJl/MEU5IGR0xIgD+Kf2fI/Fnc1hnW+yMVdCICrrOZEBUqpI/dmqYRQSmReWD4dRtS
         TC60QNnnXgBw0ye6anHTK+BTT96EUgZKDwJCCmQ0CEUGxke/PVQYSdS7aNg8Xow3hUZ6
         uIeSL3Zy0km5KSPl72WJFlPe4djtpvI8hsedSSrldM8W8YgvF0lPee/MEgLNW5Yj3i8l
         nRUQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXKxKBmMbfa3uDRbRAWkW9I+v/UzppMrbozBSXlMYWVtm6dCvnt2vQLcuYxiou6QizrOP1xFEI34BsX@alsa-project.org
X-Gm-Message-State: AOJu0Ywai4y2FaVxVwkYlRq6r6qUqyiejyhiq0pM42NnBd/7FGBiuNPP
	0KzcnMVAUQoUvMkuixOMaceA9zwftso9yiZk8Kv+KSo55nLWLfU8OlGOqcVnue4=
X-Google-Smtp-Source: 
 AGHT+IG4ybmvfCPFK7GpLPZJ9S6gMbOoQX6B/i66eB46HTLEMiy8K/MDelU5eMphLtP74FLdVw9wMw==
X-Received: by 2002:a05:600c:1d85:b0:42c:c401:6d67 with SMTP id
 5b1f17b1804b1-42e7abe12c9mr21430965e9.6.1726845017829;
        Fri, 20 Sep 2024 08:10:17 -0700 (PDT)
Received: from localhost (p5dc68d3d.dip0.t-ipconnect.de. [93.198.141.61])
        by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42e75389c88sm54088995e9.0.2024.09.20.08.10.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Sep 2024 08:10:17 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: Johannes Berg <johannes@sipsolutions.net>,
	David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>,
	linuxppc-dev@lists.ozlabs.org,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com
Subject: [PATCH] ALSA: Drop explicit initialization of struct
 i2c_device_id::driver_data to 0
Date: Fri, 20 Sep 2024 17:10:08 +0200
Message-ID: <20240920151009.499188-2-u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2252;
 i=u.kleine-koenig@baylibre.com; h=from:subject;
 bh=UMPI6dbr3vZF/IEea0Gxx5qCUzLzf9e2xNJR+bN0i6E=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBm7ZBR/8GCUV4aeWj8Lb2TYNLJVkJrXibxwUuPQ
 5Sqo3ZScMyJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZu2QUQAKCRCPgPtYfRL+
 Th38B/wPssqPeUx8jeBlsp1PHwKwqwZKv0klqLgfgERAspSV9HlI9RhbIl5FNCUL+XdJvUV62A+
 Jy0sEEPwbrSUxzs5FY2CGHw1mLFG38sJVTWAcAQvGAiNQQmpZWeUAmE9ypN2EN4oGnyA+OxmR1W
 p7uFRCfonXSQay49ptoU+YwMGcVz2sfBfYOOEcaXufzilvyMVasjLMnvG2o5TME6VJQE3FVYVxj
 XgIuqy6O9iFMl5KHMxWyoGPHtSHoWly2reMtLnsvHUtRZjyUZhy0uJV2GAeYeev3xwORxOoGBQM
 Pt3kHzQc/wQNGfPt/6j6t/pU32qov0X5Z/ManUH30q8z9FQw
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-MailFrom: ukleinek@baylibre.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: JHDYQTTF7I7BOH4K5CFY74AOHUFK3DXB
X-Message-ID-Hash: JHDYQTTF7I7BOH4K5CFY74AOHUFK3DXB
X-Mailman-Approved-At: Tue, 01 Oct 2024 12:34:50 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JHDYQTTF7I7BOH4K5CFY74AOHUFK3DXB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

These drivers don't use the driver_data member of struct i2c_device_id,
so don't explicitly initialize this member.

This prepares putting driver_data in an anonymous union which requires
either no initialization or named designators. But it's also a nice
cleanup on its own.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
 sound/aoa/codecs/onyx.c         | 2 +-
 sound/aoa/codecs/tas.c          | 2 +-
 sound/pci/hda/cs35l41_hda_i2c.c | 2 +-
 sound/pci/hda/tas2781_hda_i2c.c | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/aoa/codecs/onyx.c b/sound/aoa/codecs/onyx.c
index e90e03bb0dc0..ac347a14f282 100644
--- a/sound/aoa/codecs/onyx.c
+++ b/sound/aoa/codecs/onyx.c
@@ -1040,7 +1040,7 @@ static void onyx_i2c_remove(struct i2c_client *client)
 }
 
 static const struct i2c_device_id onyx_i2c_id[] = {
-	{ "MAC,pcm3052", 0 },
+	{ "MAC,pcm3052" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c,onyx_i2c_id);
diff --git a/sound/aoa/codecs/tas.c b/sound/aoa/codecs/tas.c
index be9822ebf9f8..804b2ebbe28f 100644
--- a/sound/aoa/codecs/tas.c
+++ b/sound/aoa/codecs/tas.c
@@ -927,7 +927,7 @@ static void tas_i2c_remove(struct i2c_client *client)
 }
 
 static const struct i2c_device_id tas_i2c_id[] = {
-	{ "MAC,tas3004", 0 },
+	{ "MAC,tas3004" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c,tas_i2c_id);
diff --git a/sound/pci/hda/cs35l41_hda_i2c.c b/sound/pci/hda/cs35l41_hda_i2c.c
index 603e9bff3a71..bb84740c8520 100644
--- a/sound/pci/hda/cs35l41_hda_i2c.c
+++ b/sound/pci/hda/cs35l41_hda_i2c.c
@@ -39,7 +39,7 @@ static void cs35l41_hda_i2c_remove(struct i2c_client *clt)
 }
 
 static const struct i2c_device_id cs35l41_hda_i2c_id[] = {
-	{ "cs35l41-hda", 0 },
+	{ "cs35l41-hda" },
 	{}
 };
 
diff --git a/sound/pci/hda/tas2781_hda_i2c.c b/sound/pci/hda/tas2781_hda_i2c.c
index f58f434e7110..4b9dc84ce6bb 100644
--- a/sound/pci/hda/tas2781_hda_i2c.c
+++ b/sound/pci/hda/tas2781_hda_i2c.c
@@ -951,7 +951,7 @@ static const struct dev_pm_ops tas2781_hda_pm_ops = {
 };
 
 static const struct i2c_device_id tas2781_hda_i2c_id[] = {
-	{ "tas2781-hda", 0 },
+	{ "tas2781-hda" },
 	{}
 };
 

base-commit: 62f92d634458a1e308bb699986b9147a6d670457
-- 
2.45.2

