Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 257917B3F02
	for <lists+alsa-devel@lfdr.de>; Sat, 30 Sep 2023 10:09:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8B273EBD;
	Sat, 30 Sep 2023 10:08:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8B273EBD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696061389;
	bh=lPyOq2/iefkMVgmIuceyqd1lbS45mr3+hgRWL8/gzZU=;
	h=Date:From:To:Cc:Subject:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=fXliDJMUyaLkZsR6HfTbHpI+saLKftM8zNhy0X094UcWZwgYHYZsTVmYG9ijXgIIq
	 tdba5cgJq5aDMXr4LsGjjNDDu3kRN1itnZPwdlA/996hYFAOFhwzFnJPEbeO/jdpit
	 sJ0orv/sHFU70+3+hdFTNHOLyFjFUQeORYFLfXSU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8F843F8065B; Sat, 30 Sep 2023 10:07:03 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DEA3DF8064C;
	Sat, 30 Sep 2023 10:07:02 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3B3D6F8016A; Wed, 27 Sep 2023 14:44:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id AB7ABF80130
	for <alsa-devel@alsa-project.org>; Wed, 27 Sep 2023 14:44:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AB7ABF80130
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=IRvVRQd5
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-405524e6740so90000445e9.1
        for <alsa-devel@alsa-project.org>;
 Wed, 27 Sep 2023 05:44:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695818645; x=1696423445;
 darn=alsa-project.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eV/iObVOjNdpAvz3lG/ln1pocXCMm2I9lf4wBt2iVFs=;
        b=IRvVRQd5r7Mz4ftgAE2hJL3+TTIqDtVsIffYSvQ4yx4819t9Cw1ifZaqpy0wFNyFEA
         2QdKJ9Jxnw5Nebl9JiXeyXDPBcr3Mg5WvnNBBnCUV9HjtmLfs0FexAf3Zx2s9MTqNXa/
         KRPQeEXR+Jp6NDppZ4PmstsMwvwVzu5eAFmQB/kQiFXDXsmJVG+60dQnjRSTktyjrf7Q
         GL3M2izsz9SphVfxHXrSAbILXadwrQmGfSIqY7vlo/OpS/Vkx5lsZZRnh4JQeLBliFAU
         H/dkfLnkiUZ7Kthgl2bwuAwOykHr+A+WQJ5Oxj9WPr2OC+Go0aVQq4GNUhNlGEEqUfsE
         cFaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695818645; x=1696423445;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eV/iObVOjNdpAvz3lG/ln1pocXCMm2I9lf4wBt2iVFs=;
        b=jkfukljJ5odySAk8lhG/z6oYT7XfLUZFA6e7hts98JcaMOeqTYqpKNeZs9HfEmIKUw
         PcGgIyst46fBJRnEJFLihE4qcxNyx8JNT65tP/pANL5GYMpJYsOlLGDNYJ7tjTT2PuCL
         P3nyCSgc90nzOzKigcJS1pdILDYGwSKUo3KJiIfTBZgzJ79psDX2Ly/Ivhv6Sbaz8U9z
         ti95Wd1VuX+c5Zm/uIWsPXQBCvDeDmuyQP9GxGvdmJ1mJXVs5QA1EOhHFRuzWpu1uhYv
         k8ze+6erLz0BRgFc8KMUa1nLD0kMInn3qtD/MOQfycRCf8BUrieK24YbpWjzSkKtb9Nf
         Xyzw==
X-Gm-Message-State: AOJu0YxaNAiiOl7eUHDn/I4YLqxF1n2zvY2R0ffcZuExeXsS9mKN0Zrx
	cHoICVmEYnFmbBukNvBoojGa7A==
X-Google-Smtp-Source: 
 AGHT+IFn+P/SI2/I2/gsxtiwld1WN2Rq/yE5OgOfu5Z2qxoxqkMq9FCOAA4ZlPaluoR2JWkiB2382w==
X-Received: by 2002:a1c:7418:0:b0:401:1b58:72f7 with SMTP id
 p24-20020a1c7418000000b004011b5872f7mr1911931wmc.38.1695818645544;
        Wed, 27 Sep 2023 05:44:05 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id
 9-20020a05600c234900b00405959bbf4fsm6752008wmq.19.2023.09.27.05.44.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Sep 2023 05:44:05 -0700 (PDT)
Date: Wed, 27 Sep 2023 15:44:01 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: James Schulman <james.schulman@cirrus.com>
Cc: David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] ALSA: hda: cirrus_scodec: fix an error code
Message-ID: <5eea7fd5-67c8-4ed4-b5b3-b85dfb7572cc@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-MailFrom: dan.carpenter@linaro.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 5IRE36GOIMYDR7BGU34UOKKCY3G5KLUM
X-Message-ID-Hash: 5IRE36GOIMYDR7BGU34UOKKCY3G5KLUM
X-Mailman-Approved-At: Sat, 30 Sep 2023 08:06:38 +0000
X-Mailman-Version: 3.3.8
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

The "ret" variable is zero but we should return -EINVAL.

Fixes: 2144833e7b41 ("ALSA: hda: cirrus_scodec: Add KUnit test")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 sound/pci/hda/cirrus_scodec_test.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/pci/hda/cirrus_scodec_test.c b/sound/pci/hda/cirrus_scodec_test.c
index 5eb590cd4fe2..8ae373676bd1 100644
--- a/sound/pci/hda/cirrus_scodec_test.c
+++ b/sound/pci/hda/cirrus_scodec_test.c
@@ -137,8 +137,8 @@ static int cirrus_scodec_test_create_gpio(struct kunit *test)
 	priv->gpio_priv = dev_get_drvdata(&priv->gpio_pdev->dev);
 	if (!priv->gpio_priv) {
 		platform_device_put(priv->gpio_pdev);
-		KUNIT_FAIL(test, "Failed to get gpio private data: %d\n", ret);
-		return ret;
+		KUNIT_FAIL(test, "Failed to get gpio private data\n");
+		return -EINVAL;
 	}
 
 	return 0;
-- 
2.39.2

