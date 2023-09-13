Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 66C5679F29A
	for <lists+alsa-devel@lfdr.de>; Wed, 13 Sep 2023 22:10:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 927FF852;
	Wed, 13 Sep 2023 22:09:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 927FF852
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694635817;
	bh=7CsrycQCo+izQk1aeLr+jVMQtYiNL14zBnqgk5MMCi8=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=u3aX2VqfbZSDHfyG9fbH9Y7F584/AAVeYUHZgWgA05Cx0WXlYyKxDr0VPlvphXq/+
	 wgf5QiZCZUzvvCrBSg230YKN/QBWQjfv2d/LjWxNcGdq3IcUl3XpyHHO60uDhcXpJS
	 mKvXs9i+nropetgRUiGJySbJvy44vhQq7MPuIoe0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 236E3F80246; Wed, 13 Sep 2023 22:09:26 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A005EF80246;
	Wed, 13 Sep 2023 22:09:26 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0A7B6F80246; Wed, 13 Sep 2023 22:09:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com
 [IPv6:2607:f8b0:4864:20::62f])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8B67DF8007C
	for <alsa-devel@alsa-project.org>; Wed, 13 Sep 2023 22:09:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8B67DF8007C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256
 header.s=google header.b=BDuz78Kb
Received: by mail-pl1-x62f.google.com with SMTP id
 d9443c01a7336-1c3d6d88231so1653395ad.0
        for <alsa-devel@alsa-project.org>;
 Wed, 13 Sep 2023 13:09:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1694635747; x=1695240547;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ssLwR83eKKn7bLWXsf/SFAPjAl3l+ME4EQDX8KF3MhE=;
        b=BDuz78KbBdx7Aj+v+jTVdB5If6YymbD6vUONvyq/FGySxwWJGRF1kZabc4wt4Kl8I4
         SejjMUUHJMnHqFzwd4fjKckRytff4YKdb5FTz8gUNN3OMD+25nnncpYcuezIqvULCVGo
         Ct3Pp415b1pdv5HXJOou6BW1/9Vcnxkoekuh4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694635747; x=1695240547;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ssLwR83eKKn7bLWXsf/SFAPjAl3l+ME4EQDX8KF3MhE=;
        b=N+6T2nK4DPCnT0pn2PfwTtjT5xxqmKYORGAGctpQRldwxjESET+zgpzrrR13ZA8tm+
         u0HHPhGOiWVmrHHefw38ZRIB1JNSBRxz9Y9v5scN6RPe1p3X6QJ8uiT6CJyqIMC6XvoE
         glSYWsWRyv5Wcz0ZwYdEVjjlRf6OEeM30AWF+3JMNM/y/Ld3RF5luJWU9ZZsGYhrXwMV
         h7thuD+oPFZZp9cY9AbRoGNarrKjtRdIrf68t6JoEN8Uszu4ZWGswfHeg14CehC5EfCM
         beXtnj1wFoWtL4f+jlxMC6uRMWCm1ZogsDqy3LIRRfAYdmIFwtsyYv9BxNjQeBvoXzVY
         ygpg==
X-Gm-Message-State: AOJu0YwfMj3fpzsx+XbtdPMME5psjER5Tc8zBMJqfuNfV2OaXOk7bWfP
	i4RO8/tWvTTcSu439mtbjg053ue8+M0MiYqsqw==
X-Google-Smtp-Source: 
 AGHT+IGq21mIkLro2IywwowuflgM+JiqzI3b8i7fYHNMp0aj3iHGNM/KYz40Eph785DbBoooiZYyNA==
X-Received: by 2002:a17:902:7c0a:b0:1c3:2ee6:3802 with SMTP id
 x10-20020a1709027c0a00b001c32ee63802mr2807963pll.47.1694635745742;
        Wed, 13 Sep 2023 13:09:05 -0700 (PDT)
Received: from localhost ([2620:15c:9d:4:a3c9:d58:99ff:86e9])
        by smtp.gmail.com with UTF8SMTPSA id
 e4-20020a170902b78400b001b8b73da7b1sm12262pls.227.2023.09.13.13.09.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Sep 2023 13:09:05 -0700 (PDT)
From: cujomalainey@chromium.org
To: alsa-devel@alsa-project.org
Cc: Curtis Malainey <cujomalainey@chromium.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Geoff Levand <geoff@infradead.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Ivan Orlov <ivan.orlov0322@gmail.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Subject: [RFC PATCH v2 1/2] ALSA: core: add snd_device_init
Date: Wed, 13 Sep 2023 13:07:42 -0700
Message-ID: <20230913200846.1894258-1-cujomalainey@chromium.org>
X-Mailer: git-send-email 2.42.0.283.g2d96d420d3-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: EK43APCY2EV4T3M7SW4KWAGQVPDAPUO3
X-Message-ID-Hash: EK43APCY2EV4T3M7SW4KWAGQVPDAPUO3
X-MailFrom: cujomalainey@chromium.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EK43APCY2EV4T3M7SW4KWAGQVPDAPUO3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Curtis Malainey <cujomalainey@chromium.org>

Begin allowing refactored modules to allocate their own device but use a
common initialization procedure for their devices.

Signed-off-by: Curtis Malainey <cujomalainey@chromium.org>
---
 include/sound/core.h |  1 +
 sound/core/init.c    | 19 ++++++++++++++++---
 2 files changed, 17 insertions(+), 3 deletions(-)

diff --git a/include/sound/core.h b/include/sound/core.h
index dfef0c9d4b9f7..a4744e142c7e3 100644
--- a/include/sound/core.h
+++ b/include/sound/core.h
@@ -240,6 +240,7 @@ extern struct dentry *sound_debugfs_root;
 void snd_request_card(int card);
 
 int snd_device_alloc(struct device **dev_p, struct snd_card *card);
+void snd_device_init(struct device *dev, struct snd_card *card);
 
 int snd_register_device(int type, struct snd_card *card, int dev,
 			const struct file_operations *f_ops,
diff --git a/sound/core/init.c b/sound/core/init.c
index 22c0d217b8608..87b5368d20350 100644
--- a/sound/core/init.c
+++ b/sound/core/init.c
@@ -132,15 +132,28 @@ int snd_device_alloc(struct device **dev_p, struct snd_card *card)
 	dev = kzalloc(sizeof(*dev), GFP_KERNEL);
 	if (!dev)
 		return -ENOMEM;
+	snd_device_init(dev, card);
+	*dev_p = dev;
+	return 0;
+}
+EXPORT_SYMBOL_GPL(snd_device_alloc);
+
+/**
+ * snd_device_init - Initialize struct device for sound devices
+ * @dev_p: pointer to store the allocated device
+ * @card: card to assign, optional
+ *
+ * For releasing the allocated device, call put_device().
+ */
+void snd_device_init(struct device *dev, struct snd_card *card)
+{
 	device_initialize(dev);
 	if (card)
 		dev->parent = &card->card_dev;
 	dev->class = &sound_class;
 	dev->release = default_release_alloc;
-	*dev_p = dev;
-	return 0;
 }
-EXPORT_SYMBOL_GPL(snd_device_alloc);
+EXPORT_SYMBOL_GPL(snd_device_init);
 
 static int snd_card_init(struct snd_card *card, struct device *parent,
 			 int idx, const char *xid, struct module *module,
-- 
2.42.0.283.g2d96d420d3-goog

