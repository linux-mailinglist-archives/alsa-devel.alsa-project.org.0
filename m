Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FB36853424
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Feb 2024 16:05:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2F798A4B;
	Tue, 13 Feb 2024 16:04:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2F798A4B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1707836705;
	bh=By8R5Yo81SvmGRAazgxdA8dka+BIIwO8Hj3OoAVL7iI=;
	h=From:Date:Subject:To:Cc:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=U2pRT0CRCp4wc/35qA+Z42jNq9LfvM/I83Nz8jh2JID7esXeLhVu60M0J5BZTtBth
	 2eKBQ93N6G3fdeCzk1L1jOkJj7E5Aeazb0IWIGLsHa/B39Pu+0sZL1JnzSepg9flwU
	 NK5aL+ruu0G/T5Kcuh+HRJq4+6Gu1VHP9Hz8C0g4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 214BFF806E3; Tue, 13 Feb 2024 16:02:35 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8FF18F806DD;
	Tue, 13 Feb 2024 16:02:35 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 93A70F80238; Tue, 13 Feb 2024 15:40:09 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com
 [IPv6:2607:f8b0:4864:20::52f])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 91F3CF80104
	for <alsa-devel@alsa-project.org>; Tue, 13 Feb 2024 15:40:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 91F3CF80104
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=marliere.net header.i=@marliere.net header.a=rsa-sha256
 header.s=2024 header.b=FbKgLYhf
Received: by mail-pg1-x52f.google.com with SMTP id
 41be03b00d2f7-517ab9a4a13so3434847a12.1
        for <alsa-devel@alsa-project.org>;
 Tue, 13 Feb 2024 06:40:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707835199; x=1708439999;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:dkim-signature:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zPFk5u19QOItiNka/L08vE774FgQgmKj4OELxHFSgiU=;
        b=hfgs4+kGG/fvi+yjIXoP2w7zYwoyp2p9iXDaCVNeXudDMP1edhbyJKe0PBsWLMGepg
         6rq7GCNuqWG6ayzNvXmqq1VbRy69IRKNQrmOpZDI5a1pW7Nvgbsmk/bdzLszsntHhwp7
         ikTk3JKAsce8cLh7KCCQo82ArJ8Zzf6aRlJRxsJJ1LLkrvw2QPV1rJ2IQjRmvKBVdcKm
         Jdh0H1FE/wt1KEktJU//OigFSk8uOnGypB3ggN6fFcDtxb2P9nPoQ+3akPFJwQ5nshQ9
         xtwQeGNvRTZ5ElFI/9lC2j811cIewGCiJifR224doD3h35mXvkrsIsy+hbus54siPZAN
         +msA==
X-Gm-Message-State: AOJu0Yw6GpokI24RM6slyQ83WV+owytn/gVSoNbJaBNbbV58YCK1olg0
	RDMcdGoK1tKlhAw+mg0BfebXQNfUoKU+4rkC5pY/Ym9u9nVWEQxMkwPKBIMT+42HqA==
X-Google-Smtp-Source: 
 AGHT+IHCRZaoaPugACk7Dl521flHhhqvx3GUaNO5emNBoR6fTcT2LYDmpSyHLLNJ0QNQ8GY++OZFuQ==
X-Received: by 2002:a17:90a:cf13:b0:295:d722:a420 with SMTP id
 h19-20020a17090acf1300b00295d722a420mr6877720pju.6.1707835198959;
        Tue, 13 Feb 2024 06:39:58 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCW2iAkRxkB8aNc6GjeuAEjVOJq/qTB5N7Ck5EVx/L45I9W4vlnhK82zF5kL6Q/HjFEHXBRXO+ToBcLIlSGQMVVMI4k9cQ46TLqxczeLvFaQ/a+Pf9ZqLgYosx2HbmaXiWcTFKj3OM216w==
Received: from mail.marliere.net ([24.199.118.162])
        by smtp.gmail.com with ESMTPSA id
 ok5-20020a17090b1d4500b0029703476e9bsm2607984pjb.44.2024.02.13.06.39.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Feb 2024 06:39:58 -0800 (PST)
From: "Ricardo B. Marliere" <ricardo@marliere.net>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marliere.net;
	s=2024; t=1707835196;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=zPFk5u19QOItiNka/L08vE774FgQgmKj4OELxHFSgiU=;
	b=FbKgLYhf68mOpmyvH6kn6WKa6aVFFpIBTSP97GS3nGCLBqnKu72smK2I8YxR6ClfT//4rS
	1RjuuyUZlHFXHCDoOo5YJN6fXfl6DcD8f0i8iFkwKgE8QXHSdEZsm9jpyHr8u5G+fF0iaI
	z9kbuLuOc14ZEIOg93zOiictBCC/5abxowF2nTDN6YNhjVY+Pge6LxpRXCFMTEFthEEvAI
	CvcKCZWqXlZBhR2/6Y9A7BpC8QeezSFp+PF+JF5s6/NlKcI9VxRvkz07fifQg5y8eJozNU
	GXm/rSpZuex4J16AkQuyY8HdRxfTPAoz/06D9ho9cbNb4p0FE5xqvxosqEyzCA==
Authentication-Results: ORIGINATING;
	auth=pass smtp.auth=ricardo@marliere.net smtp.mailfrom=ricardo@marliere.net
Date: Tue, 13 Feb 2024 11:40:35 -0300
Subject: [PATCH] slimbus: core: make slimbus_bus const
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240213-bus_cleanup-slimbus-v1-1-34f06d82de6e@marliere.net>
X-B4-Tracking: v=1; b=H4sIAGJ/y2UC/x3MSwqAMAwA0atI1hZqFKVeRUT8RA3UKg0VoXh3i
 8u3mIkg5JkE2iyCp5uFT5dQ5BnM++g2UrwkA2qsNBalmoIMs6XRhUuJ5SNZEZaTIdPU64KQysv
 Tys9/7fr3/QBI14F+ZQAAAA==
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Ricardo B. Marliere" <ricardo@marliere.net>
X-Developer-Signature: v=1; a=openpgp-sha256; l=1902; i=ricardo@marliere.net;
 h=from:subject:message-id; bh=By8R5Yo81SvmGRAazgxdA8dka+BIIwO8Hj3OoAVL7iI=;
 b=owEBbQKS/ZANAwAKAckLinxjhlimAcsmYgBly39kVYKVfpnOCQ/hAmX0x+ePSNPlhKNmnr2OE
 Od9rtMT0BSJAjMEAAEKAB0WIQQDCo6eQk7jwGVXh+HJC4p8Y4ZYpgUCZct/ZAAKCRDJC4p8Y4ZY
 pv65D/4295SRRNKk58I65nHpvAHJryb0Po4ksZxilmB8ksI5/V9eWW67BXeSms0+TddcICx/Epk
 SXidM6Oz8XXWFSOMkiVH6Z9M56hvAc4tfWa3h7Rb5sfb4SCMjpVywm3kWQgdyb4Sg/gP6MzSuhg
 8tbWowR+wVWhFufmzmwosGxOMJ0VRkg+b2SpZXNmg0fm6H4G+WbSt/9IInrvAuGb37slg1M1pRo
 FebGVkfEddhYVKeX2bVNryECxWKfzMVHrmcSEiPdZsbqG+TQuiG0US1QQVXZbdj4W7mdYSaqObO
 jmf4tkM2LM2+slgT08gYlXD1YOzkXy8UVS6SMcd9uyk/bVctcvYMiUEVVtE192Fja3Pe6OjrEdF
 /ZCAbYbpahaiia177NnxTNgcKyx0kRssnpZItO9qdtC4/ToaZ/cOZU0S/k8lXRKaH+JoibG1vSO
 AcZOx1muU0QEOaEhYmTwUauvUg8kAwRqu71nSaHtHg6LicilIWt5nusvdHpwqP0IFDOzV67Mv01
 rVQajKjAgZrbT8kIfMyfNzqnuQXuGEiqaQyNOwj4NxFS0WZ9l7etxGZbm+PGLEzoTSsrSOvGPHE
 9QxDkx2VAI60pM+OAvzVP64rJxFrf74JVKJIFOZtRwtgIs8IBtLuhWgMQ5Tgq4DN+dFLmyMAqHw
 aagAuCC2hLz88Xg==
X-Developer-Key: i=ricardo@marliere.net; a=openpgp;
 fpr=030A8E9E424EE3C0655787E1C90B8A7C638658A6
X-MailFrom: rbmarliere@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 2CRHQJ4JADN6QVOVYBPPRO2OGFCHGZOX
X-Message-ID-Hash: 2CRHQJ4JADN6QVOVYBPPRO2OGFCHGZOX
X-Mailman-Approved-At: Tue, 13 Feb 2024 15:02:23 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2CRHQJ4JADN6QVOVYBPPRO2OGFCHGZOX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Since commit d492cc2573a0 ("driver core: device.h: make struct
bus_type a const *"), the driver core can properly handle constant
struct bus_type, move the slimbus_bus variable to be a constant
structure as well, placing it into read-only memory which can not be
modified at runtime.

Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Suggested-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Ricardo B. Marliere <ricardo@marliere.net>
---
This patch is based on
https://git.kernel.org/pub/scm/linux/kernel/git/srini/slimbus.git/,
should this tree be listed under "SERIAL LOW-POWER INTER-CHIP MEDIA BUS
(SLIMbus)" in the MAINTAINERS file?
---
 drivers/slimbus/core.c  | 2 +-
 include/linux/slimbus.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/slimbus/core.c b/drivers/slimbus/core.c
index d43873bb5fe6..375218e02e28 100644
--- a/drivers/slimbus/core.c
+++ b/drivers/slimbus/core.c
@@ -100,7 +100,7 @@ static int slim_device_uevent(const struct device *dev, struct kobj_uevent_env *
 	return add_uevent_var(env, "MODALIAS=slim:%s", dev_name(&sbdev->dev));
 }
 
-struct bus_type slimbus_bus = {
+const struct bus_type slimbus_bus = {
 	.name		= "slimbus",
 	.match		= slim_device_match,
 	.probe		= slim_device_probe,
diff --git a/include/linux/slimbus.h b/include/linux/slimbus.h
index 12c9719b2a55..3042385b7b40 100644
--- a/include/linux/slimbus.h
+++ b/include/linux/slimbus.h
@@ -10,7 +10,7 @@
 #include <linux/completion.h>
 #include <linux/mod_devicetable.h>
 
-extern struct bus_type slimbus_bus;
+extern const struct bus_type slimbus_bus;
 
 /**
  * struct slim_eaddr - Enumeration address for a SLIMbus device

---
base-commit: 04b945e4cf81a12365f8207a4d34dbc81ba17413
change-id: 20240213-bus_cleanup-slimbus-e23b9e976fd2

Best regards,
-- 
Ricardo B. Marliere <ricardo@marliere.net>

