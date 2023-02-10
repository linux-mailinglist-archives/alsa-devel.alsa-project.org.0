Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 094E4699849
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Feb 2023 16:04:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4DAA2F3B;
	Thu, 16 Feb 2023 16:03:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4DAA2F3B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1676559867;
	bh=qzvdIDt2ohY1Wu2a9+uUMlNbPl+eaX7VSiiEzZmNDgE=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=N6ESVAujB/5rvGn+daCsOOjbbTIPSo8uGNPPcQcW4g0CTCI4P2mqKwZZFYw6CguCa
	 2b3qHRkYiXzeWLC6WKPhA9sbceCTlRGwAhv9ouDKPA1EohGuJ2qZ+U1996wgwDVmR0
	 IkUajXhc5raipE4mqRlOvLfMX3CMwS3DLfjzmxYU=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A2DDAF80571;
	Thu, 16 Feb 2023 15:56:59 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F2550F8018A; Fri, 10 Feb 2023 05:50:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com
 [IPv6:2607:f8b0:4864:20::1035])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5219EF800E4
	for <alsa-devel@alsa-project.org>; Fri, 10 Feb 2023 05:50:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5219EF800E4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=dfjrwZCU
Received: by mail-pj1-x1035.google.com with SMTP id d2so4090972pjd.5
        for <alsa-devel@alsa-project.org>;
 Thu, 09 Feb 2023 20:50:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y8Z+rw3Lo4ZI53HBYFrES/rZyYmIcMPWeV9Tjc6GjJE=;
        b=dfjrwZCUTXg0++zE/wVkz4Z96Dke9cdiJGPWOJx+bSbwOuQzxzamUP7h08RKQKxmci
         TJuBqsc+PY+NgKeBk1dK5ehjoB56e05oCGCVdL0fCqIdQhc0VEGhFat0cmuxanHzAMg0
         PkBLd+8yttsFpd3mZCaA1SzojWL4FcQ3HiMdQp77gFhOpZsKqeYz/jeR1LyHxN4YyLTb
         3ZMp1vTJystxqoDQUey6c9p8i3s2QjUBsSsvBZ5rfq9WUIORdJzIDSR0QALHgrjXZ77j
         ScTwjw3ohujsiuZkCI2r2hTPzZp/mGapCXYydIZhMspEsgiXfPGfK8D+y5YVUcqfbqEh
         3VYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y8Z+rw3Lo4ZI53HBYFrES/rZyYmIcMPWeV9Tjc6GjJE=;
        b=aGKXKpUg3+p4VrOzgdzrlkxNZQooSddfG4TjEtQIHEBzDHegFEE7AXm5AqYwAhhas6
         H/aTyNODqrGkkeHT/FUxtHqAiyZAVqOpzASwAMr97L92QuoFutnhOJ0TBdgbmfqYCD6l
         avdx6JpiFMQP7SJTECWaY0D7Vpl3Fkfnx64jkoJTsdB/RZ//HWZSK8fQTkyx28su3bEi
         QamvjoYbQSesV9i0iZAHm5EK9wTpQkNBao6W5tpJ/yLaWJBHaIvONBBHo7nrggNBn8df
         236vvSbUXyw8sCBMr6bdQbwcBUxAQV+xINfM0b5NNqYbw7B5RgkviuMscHWon+Kv74Pz
         0Kpg==
X-Gm-Message-State: AO0yUKXtgmXD+6/pSfYnQWBX5FaPIrbjWWXThR4QwjT7zth2mG5s4WSu
	MInnEnx9qbjT9e2oAoPgcBGC85q9THsSvg==
X-Google-Smtp-Source: 
 AK7set/7KSbVgE9qkN7uNWue+wzw+pXkSmt+auWpnDKP9/ad63Y3Jn6uOO0PkG79K7jm7BGnaA7Ihg==
X-Received: by 2002:a05:6a21:339a:b0:bf:22ca:ef55 with SMTP id
 yy26-20020a056a21339a00b000bf22caef55mr17822193pzb.37.1676004618944;
        Thu, 09 Feb 2023 20:50:18 -0800 (PST)
Received: from localhost.localdomain ([202.53.32.211])
        by smtp.gmail.com with ESMTPSA id
 t13-20020a62ea0d000000b0057fec210d33sm2269218pfh.152.2023.02.09.20.50.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Feb 2023 20:50:18 -0800 (PST)
From: Orlando Chamberlain <orlandoch.dev@gmail.com>
To: platform-driver-x86@vger.kernel.org,
	amd-gfx@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org
Subject: [RFC PATCH 2/9] apple-gmux: consolidate version reading
Date: Fri, 10 Feb 2023 15:48:19 +1100
Message-Id: <20230210044826.9834-3-orlandoch.dev@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230210044826.9834-1-orlandoch.dev@gmail.com>
References: <20230210044826.9834-1-orlandoch.dev@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: orlandoch.dev@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: YHUZ7D2MAWLHLG6LPHEJ5ICKLRNKFCC5
X-Message-ID-Hash: YHUZ7D2MAWLHLG6LPHEJ5ICKLRNKFCC5
X-Mailman-Approved-At: Thu, 16 Feb 2023 14:56:51 +0000
CC: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Hans de Goede <hdegoede@redhat.com>,
 Mark Gross <markgross@kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>,
 Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
 Lijo Lazar <lijo.lazar@amd.com>, YiPeng Chai <YiPeng.Chai@amd.com>,
 Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Bokun Zhang <Bokun.Zhang@amd.com>, Jack Xiao <Jack.Xiao@amd.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Rander Wang <rander.wang@intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>, Yong Zhi <yong.zhi@intel.com>,
 Evan Quan <evan.quan@amd.com>, Kerem Karabay <kekrby@gmail.com>,
 Aditya Garg <gargaditya08@live.com>, Aun-Ali Zaidi <admin@kodeit.net>,
 Orlando Chamberlain <orlandoch.dev@gmail.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YHUZ7D2MAWLHLG6LPHEJ5ICKLRNKFCC5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Read gmux version in one go as 32 bits on both indexed and classic
gmux's.

Classic gmux's used to read the version as

major = inb(base + 0x4);
minor = inb(base + 0x5);
release = inb(base + 0x6);

but this can instead be done the same way as indexed gmux's with
gmux_read32(), so the same version reading code is used for classic
and indexed gmux's (as well as mmio gmux's that will be added to this
driver).

Signed-off-by: Orlando Chamberlain <orlandoch.dev@gmail.com>
---
 drivers/platform/x86/apple-gmux.c | 14 ++++++--------
 include/linux/apple-gmux.h        |  6 +-----
 2 files changed, 7 insertions(+), 13 deletions(-)

diff --git a/drivers/platform/x86/apple-gmux.c b/drivers/platform/x86/apple-gmux.c
index e8cb084cb81f..67628104f31a 100644
--- a/drivers/platform/x86/apple-gmux.c
+++ b/drivers/platform/x86/apple-gmux.c
@@ -580,15 +580,13 @@ static int gmux_probe(struct pnp_dev *pnp, const struct pnp_device_id *id)
 	if (indexed) {
 		mutex_init(&gmux_data->index_lock);
 		gmux_data->indexed = true;
-		version = gmux_read32(gmux_data, GMUX_PORT_VERSION_MAJOR);
-		ver_major = (version >> 24) & 0xff;
-		ver_minor = (version >> 16) & 0xff;
-		ver_release = (version >> 8) & 0xff;
-	} else {
-		ver_major = gmux_read8(gmux_data, GMUX_PORT_VERSION_MAJOR);
-		ver_minor = gmux_read8(gmux_data, GMUX_PORT_VERSION_MINOR);
-		ver_release = gmux_read8(gmux_data, GMUX_PORT_VERSION_RELEASE);
 	}
+
+	version = gmux_read32(gmux_data, GMUX_PORT_VERSION_MAJOR);
+	ver_major = (version >> 24) & 0xff;
+	ver_minor = (version >> 16) & 0xff;
+	ver_release = (version >> 8) & 0xff;
+
 	pr_info("Found gmux version %d.%d.%d [%s]\n", ver_major, ver_minor,
 		ver_release, (gmux_data->indexed ? "indexed" : "classic"));
 
diff --git a/include/linux/apple-gmux.h b/include/linux/apple-gmux.h
index 1f68b49bcd68..eb2caee04abd 100644
--- a/include/linux/apple-gmux.h
+++ b/include/linux/apple-gmux.h
@@ -67,7 +67,6 @@ static inline bool apple_gmux_is_indexed(unsigned long iostart)
  */
 static inline bool apple_gmux_detect(struct pnp_dev *pnp_dev, bool *indexed_ret)
 {
-	u8 ver_major, ver_minor, ver_release;
 	struct device *dev = NULL;
 	struct acpi_device *adev;
 	struct resource *res;
@@ -95,10 +94,7 @@ static inline bool apple_gmux_detect(struct pnp_dev *pnp_dev, bool *indexed_ret)
 	 * Invalid version information may indicate either that the gmux
 	 * device isn't present or that it's a new one that uses indexed io.
 	 */
-	ver_major = inb(res->start + GMUX_PORT_VERSION_MAJOR);
-	ver_minor = inb(res->start + GMUX_PORT_VERSION_MINOR);
-	ver_release = inb(res->start + GMUX_PORT_VERSION_RELEASE);
-	if (ver_major == 0xff && ver_minor == 0xff && ver_release == 0xff) {
+	if (!(~inl(res->start + GMUX_PORT_VERSION_MAJOR))) {
 		indexed = apple_gmux_is_indexed(res->start);
 		if (!indexed)
 			goto out;
-- 
2.39.1

