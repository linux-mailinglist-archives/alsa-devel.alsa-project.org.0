Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B7CFD7879E3
	for <lists+alsa-devel@lfdr.de>; Thu, 24 Aug 2023 23:06:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1BE7184C;
	Thu, 24 Aug 2023 23:05:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1BE7184C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692911197;
	bh=F+LE19iXdKX/DKyMZkZfMSGwIEiZBzzunQNBopthQ8E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=RZtQpAfA4NgqDTul9RWnErohL81aWdv7ZdbNpUSvdZXXCnwJHGVA7Na1SY4PRnUhk
	 bGyVcAGujS2TRelaLSP94jepyAE5qPqIuoNr8zRGXkwwkQ1wemaNX6zRfoOvCUZWmz
	 gEsgq36xMuCJjLpeQ8+gduf4BN49fQKFrtHwZC8U=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E1828F80563; Thu, 24 Aug 2023 23:04:59 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 34B71F80536;
	Thu, 24 Aug 2023 23:04:59 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D3281F8022B; Thu, 24 Aug 2023 23:04:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-oo1-xc2a.google.com (mail-oo1-xc2a.google.com
 [IPv6:2607:f8b0:4864:20::c2a])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 508DCF80074
	for <alsa-devel@alsa-project.org>; Thu, 24 Aug 2023 23:04:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 508DCF80074
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256
 header.s=google header.b=JCs67MlE
Received: by mail-oo1-xc2a.google.com with SMTP id
 006d021491bc7-5720f3ce5afso218235eaf.0
        for <alsa-devel@alsa-project.org>;
 Thu, 24 Aug 2023 14:04:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1692911082; x=1693515882;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NmO/U6IMzbl2UIaHDn9OaenL1P9NwNj9czrGh7RDNVY=;
        b=JCs67MlEOo0AHQmjzFRqlYaagHP8f4Q7mOrtU1Ve35ghOU7ECO5AXWAtylopsemQfv
         TBJjq/cYXiOzQ0TuX5peefH3PVOgS/qB3v+B0ynGIXZ2SzKCdDLxG/fQLa3IGmLQb9fY
         jApOHulpiKrQn+Rw+FtfVjfpezNH/XO86U9Hs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692911082; x=1693515882;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NmO/U6IMzbl2UIaHDn9OaenL1P9NwNj9czrGh7RDNVY=;
        b=ekrxhDt6fhBR6HrLB9JbMc4QssNn/b0K1v8BO7ISxztcfGgQWnNN2wJ30/hV9B5pmk
         2xiopZsDGZVakhm7I4tpuNVIEDdg80K/SUV30KWWGgnevbZ2SFu1mbX//j9+tmW0pj63
         WlXzrkOaXZOvRkjJi1VhxT4x9d6iw7N/5aqjZecJ6nQg8cDGNMvNzGwKKsfLpTFeHNbA
         8lAawDpmcNkubPT/XQbVfGqNdpXKrwREUAcxED69J8yEoxUMDo21lUAluXdKjRCc+NhW
         B3B+wgZCO4EcHZW3OixYpJJP8ZSDHJGWsRE+hxUkPqC1TGEUCOjM3KIRlUT7I9NIHMrT
         hhXw==
X-Gm-Message-State: AOJu0YwK2ahyXvBR/8BC1SPFhJmSXsGYPudb+3qWtssFV2Su8ptLsfy/
	u6FU2SOU0DUpyvhOr1/I/EuXr0EDI/x5D0PRqg==
X-Google-Smtp-Source: 
 AGHT+IG2SJXeoQodTa0fYPJBwVVasbOIheM7yyK7l+uUlYfq+BHhXTHu4mZeXrr0DtzurION6n1kDQ==
X-Received: by 2002:a05:6358:5284:b0:135:4003:784c with SMTP id
 g4-20020a056358528400b001354003784cmr15236062rwa.17.1692911082634;
        Thu, 24 Aug 2023 14:04:42 -0700 (PDT)
Received: from localhost ([2620:15c:9d:4:133d:5d74:91c4:bbb1])
        by smtp.gmail.com with UTF8SMTPSA id
 z11-20020a63b04b000000b00565ec002d14sm50787pgo.33.2023.08.24.14.04.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Aug 2023 14:04:41 -0700 (PDT)
From: cujomalainey@chromium.org
To: alsa-devel@alsa-project.org
Cc: Curtis Malainey <cujomalainey@chromium.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Thierry Reding <treding@nvidia.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Ivan Orlov <ivan.orlov0322@gmail.com>
Subject: [PATCH 1/2] ALSA: core: add snd_device_init
Date: Thu, 24 Aug 2023 14:02:52 -0700
Message-ID: <20230824210339.1126993-2-cujomalainey@chromium.org>
X-Mailer: git-send-email 2.42.0.rc1.204.g551eb34607-goog
In-Reply-To: <20230824210339.1126993-1-cujomalainey@chromium.org>
References: <20230824210339.1126993-1-cujomalainey@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 5577LOHUTZ2CIGI7H7JLUAO435JIBPOF
X-Message-ID-Hash: 5577LOHUTZ2CIGI7H7JLUAO435JIBPOF
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5577LOHUTZ2CIGI7H7JLUAO435JIBPOF/>
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
index d61bde1225f23..37a8e4791f781 100644
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
2.42.0.rc1.204.g551eb34607-goog

