Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1317785B463
	for <lists+alsa-devel@lfdr.de>; Tue, 20 Feb 2024 09:04:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5E5921530;
	Tue, 20 Feb 2024 09:03:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5E5921530
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1708416246;
	bh=m94DFBN75h11eMjK/lxCoA7i3I1BfSskcMzW+CgEmcU=;
	h=From:Date:Subject:To:Cc:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=BqO9xDm3oXkt8EMMLFPKaWnytaWAPvLYLS2MnI5D/gjcU5NYxzDDkk0vlN+Q9P1tR
	 e5gLHkPNSveRjIEDxPXGnTuCJFMSsn9+eZoGQimCMGI/vyn6VAweDE34NiW5cgiSBU
	 NCVE40eu6oaZfVrM31PsIo5aZAjhf9nHlzwu2dmo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D5F1BF805AE; Tue, 20 Feb 2024 09:02:28 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2A605F8057E;
	Tue, 20 Feb 2024 09:02:28 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7F245F80496; Mon, 19 Feb 2024 13:14:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com
 [IPv6:2607:f8b0:4864:20::42d])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E0155F8019B
	for <alsa-devel@alsa-project.org>; Mon, 19 Feb 2024 13:13:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E0155F8019B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=marliere.net header.i=@marliere.net header.a=rsa-sha256
 header.s=2024 header.b=MC36vAxU
Received: by mail-pf1-x42d.google.com with SMTP id
 d2e1a72fcca58-6e08dd0fa0bso3616330b3a.1
        for <alsa-devel@alsa-project.org>;
 Mon, 19 Feb 2024 04:13:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708344834; x=1708949634;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:dkim-signature:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0pBesxh4+nFLzoiYgE0c+lzzUwgR3fOryJ/2gHoTxn0=;
        b=ihF8i4AqbrFhYutz2+UVKDMNTHYvTAW8kriiU5b5xAF8YqhpLO/jvQ9Y8JbNJ+bmZP
         uudPMyHOuC7+bGbX0dHWoSAR68lwEDWRKmhxxz78bEnlyouvnduT/cdP2JVUsf3npz/a
         qR4itDuWNJwPiUWOOCz3Dv1gobwZkPxskZNhbt6tNgHTV4oZ2nThnaXoEtuOzy5wFEmc
         xvkbjoRSZ/i8Z8p7f69czw/PMNCDZLn+HBjOdZJ0eCHs7Y5J1eMkGpHt8BXX7HVPL0Ob
         O5cBPhgrsru/t2TMhv6uejDzc3GsScYXQDH90jtwS0ajiTNIDVHLaBV3ofKUFcRozJXi
         uQig==
X-Gm-Message-State: AOJu0Yw+Yqt36tHZw5wRursMmHGF+JPCZ8jM7cFUE4ma5bug9G/3++q2
	SlN8KnZ4BWaBPDWvr5fyNqYqNnh+NJHf0KGwzx9595nFxmU71DteMhwJ2c3VH0+INw==
X-Google-Smtp-Source: 
 AGHT+IHKPkYDoxgDGFOj6r80fmLwRa0HCPqUzDzCpSNGKGOTn29TycmZI79HDCq6I3Am4KT+B2ZivA==
X-Received: by 2002:a05:6a00:2389:b0:6e0:377f:bece with SMTP id
 f9-20020a056a00238900b006e0377fbecemr20579977pfc.9.1708344834135;
        Mon, 19 Feb 2024 04:13:54 -0800 (PST)
Received: from mail.marliere.net ([24.199.118.162])
        by smtp.gmail.com with ESMTPSA id
 k4-20020aa790c4000000b006e04b47e17asm4659879pfk.214.2024.02.19.04.13.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Feb 2024 04:13:53 -0800 (PST)
From: "Ricardo B. Marliere" <ricardo@marliere.net>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marliere.net;
	s=2024; t=1708344832;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=0pBesxh4+nFLzoiYgE0c+lzzUwgR3fOryJ/2gHoTxn0=;
	b=MC36vAxUPSod9WRK2yLA2b3oHSWPZa55hZkREdt3rlNZqKLTgBwj9OJuDUXGnnJb7HGfag
	hJT1e1GCVGdA+Po5LbS4zIbAQNrUqqdT0Sds4JlGa/GK5hOflaEIer/RAyB9eJFPUp3aQO
	+wV26NJVccHkpyRXJ8hg4QaPHmSunhzOLi7JT432/J5XIZG2ytndBzzc/HsrScLDGoKAge
	meV7rKgs/gC/pQwMcpsRy/7jvStMF/rHqFkpgJ9tpHRzTyOJsHjSCv8emk5Zez3vJf6z07
	A119bmBBoEDk3ugBo/oBZci4YknyfdgaEeYwvwvuLX5K6rXwojKllY1KAisDlw==
Authentication-Results: ORIGINATING;
	auth=pass smtp.auth=ricardo@marliere.net smtp.mailfrom=ricardo@marliere.net
Date: Mon, 19 Feb 2024 09:14:36 -0300
Subject: [PATCH] soundwire: constify the struct device_type usage
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240219-device_cleanup-soundwire-v1-1-9edd51767611@marliere.net>
X-B4-Tracking: v=1; b=H4sIACtG02UC/x2MWwqAIBAArxL7naAmRV0lIkTXWggTpQeId0/6H
 JiZDAkjYYKpyRDxpkSnryDaBsyu/YaMbGWQXCouxchslQyu5kDtr8DSeXn7UERmeDc457QcVA8
 1DxEdvf96Xkr5AM8qEhxqAAAA
To: Vinod Koul <vkoul@kernel.org>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Sanyog Kale <sanyog.r.kale@intel.com>
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Ricardo B. Marliere" <ricardo@marliere.net>
X-Developer-Signature: v=1; a=openpgp-sha256; l=2275; i=ricardo@marliere.net;
 h=from:subject:message-id; bh=m94DFBN75h11eMjK/lxCoA7i3I1BfSskcMzW+CgEmcU=;
 b=owEBbQKS/ZANAwAKAckLinxjhlimAcsmYgBl00YuiDhOFFfnyc51bRB9ko/i9hRE2Zue44nTt
 egARFE/xROJAjMEAAEKAB0WIQQDCo6eQk7jwGVXh+HJC4p8Y4ZYpgUCZdNGLgAKCRDJC4p8Y4ZY
 po1fEACK3JjrmJbQYmxM+k3e1xXLldbMkS+i6Jb1msxHOSMpUGG4EYzzhNelkdXTBk/OUFPdbNu
 p3/YjspxqXFX8WtUQP0lphDO5ua6CCJS8JpBNr3YIvst5pNk12rFwcrEKjY7I1twqBLzssUsWS3
 Yupe6dMO5zKr6LjFMKnjKtlac0/kWjzBJM8XpfZqmJCAx3vGRDMsTaxI3UuUt7CQ57FvKsOpi1F
 iXL5ZYfvhTKKzn/wB9ubJg0UZaYtpU0zsWhrgRoGRAfajOLR82P+47wQzpkeh4t2LeC+w1oyUQb
 dPtfF8JoKUwydAVnRTTV5hQYxV8Uuvb6D4CjoOPYwdS/0UUVjC+gGBCNhmwkut47F7SdPyoyhjn
 ZVI+WT2VP06t7JvdAHZVT8sS1e221idROyzKVQto4D8/SjVxw+de2XcT5Srg+ecRb1c5ubbVdsb
 bhVuNNV5xduM4i3WYS1xlAdgyY0WMgVfmUa1xXtGNsWZslzdpt/ZGNFFfPrwkDlwAXqPqJbdSar
 kHPpZDOKfogqB/3MKEj1svrYJzyjh1aAfNz8DunTLu3GmoeyOb523HT4WAUDA/1GmUCtiYl1zyN
 zdul/F6RH9pVS0TAPeRAcHvV0J72WFW1MOrZbQUlIbJfY34un48Dp+YswAX0MxdUI+daY4OpnIp
 2s432J3Iw4Bfm3g==
X-Developer-Key: i=ricardo@marliere.net; a=openpgp;
 fpr=030A8E9E424EE3C0655787E1C90B8A7C638658A6
X-MailFrom: rbmarliere@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 25V2PJJPO4WQLXX4ZD74EYQFUOW3K5WR
X-Message-ID-Hash: 25V2PJJPO4WQLXX4ZD74EYQFUOW3K5WR
X-Mailman-Approved-At: Tue, 20 Feb 2024 08:00:49 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: <>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Since commit aed65af1cc2f ("drivers: make device_type const"), the driver
core can properly handle constant struct device_type. Move the
sdw_master_type and sdw_slave_type variables to be constant structures as
well, placing it into read-only memory which can not be modified at
runtime.

Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Ricardo B. Marliere <ricardo@marliere.net>
---
 drivers/soundwire/master.c         | 2 +-
 drivers/soundwire/slave.c          | 2 +-
 include/linux/soundwire/sdw_type.h | 4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/soundwire/master.c b/drivers/soundwire/master.c
index 51abedbbaa66..b2c64512739d 100644
--- a/drivers/soundwire/master.c
+++ b/drivers/soundwire/master.c
@@ -112,7 +112,7 @@ static const struct dev_pm_ops master_dev_pm = {
 			   pm_generic_runtime_resume, NULL)
 };
 
-struct device_type sdw_master_type = {
+const struct device_type sdw_master_type = {
 	.name =		"soundwire_master",
 	.release =	sdw_master_device_release,
 	.pm = &master_dev_pm,
diff --git a/drivers/soundwire/slave.c b/drivers/soundwire/slave.c
index 060c2982e26b..9963b92eb505 100644
--- a/drivers/soundwire/slave.c
+++ b/drivers/soundwire/slave.c
@@ -16,7 +16,7 @@ static void sdw_slave_release(struct device *dev)
 	kfree(slave);
 }
 
-struct device_type sdw_slave_type = {
+const struct device_type sdw_slave_type = {
 	.name =		"sdw_slave",
 	.release =	sdw_slave_release,
 	.uevent =	sdw_slave_uevent,
diff --git a/include/linux/soundwire/sdw_type.h b/include/linux/soundwire/sdw_type.h
index b445f7200f06..693320b4f5c2 100644
--- a/include/linux/soundwire/sdw_type.h
+++ b/include/linux/soundwire/sdw_type.h
@@ -5,8 +5,8 @@
 #define __SOUNDWIRE_TYPES_H
 
 extern const struct bus_type sdw_bus_type;
-extern struct device_type sdw_slave_type;
-extern struct device_type sdw_master_type;
+extern const struct device_type sdw_slave_type;
+extern const struct device_type sdw_master_type;
 
 static inline int is_sdw_slave(const struct device *dev)
 {

---
base-commit: 81a7d0c4d059cb5c122110acbeec7bedfb91a741
change-id: 20240219-device_cleanup-soundwire-c037fffa2746

Best regards,
-- 
Ricardo B. Marliere <ricardo@marliere.net>

