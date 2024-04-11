Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C67838A0B69
	for <lists+alsa-devel@lfdr.de>; Thu, 11 Apr 2024 10:37:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CE91021E2;
	Thu, 11 Apr 2024 10:37:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CE91021E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712824637;
	bh=jDijeIxWJ3u2OJneyrANQzTSRpC1Gztlo97PwAJrQv4=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=k534U7xzEs012JTXi4KpdISznKZFAXJk/ANMUFHbt21u2W7Vp/U9R5IS4+PHFOqTx
	 QgqbC13iskluaj50dss5NDuRENGildf/DPDHd5rUufMqJ9xwr3Rl4iTeWGSGRFk6rw
	 r1IbWiWi+I3YCecsiOxXyMgCXfqWO8P+ORo6dXHw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AA3B9F8059F; Thu, 11 Apr 2024 10:36:45 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 69EABF8059F;
	Thu, 11 Apr 2024 10:36:44 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 75672F8026D; Thu, 11 Apr 2024 10:33:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B9E4FF80236
	for <alsa-devel@alsa-project.org>; Thu, 11 Apr 2024 10:33:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B9E4FF80236
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=aaKtr1F2
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-417d02ab780so4635815e9.3
        for <alsa-devel@alsa-project.org>;
 Thu, 11 Apr 2024 01:33:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712824414; x=1713429214;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vkHTK4ESqX/TNOQes5BFEePnKxCub16nXuCyISi2cPE=;
        b=aaKtr1F2ndVW7RkJn2mTU0w5Z87ChTm2YvvJKkI/8QPmGYm5z9/YfZWIxNHhdTVgup
         KQrJOvwUuAnQTwnIN3QytVEhuqXVljs0KmuGd6d3ZUos5LY5OPzXjcOhlQFcUYOV0Dk/
         0pA7Geqpa0EcghlwTck6Hvt9EN+LJsOn++7RC9cXw3EFPB3YnYFZrVMPSxd481hTXc+o
         w6aKwOc7fi5Hdd8FkQlk4rXuVHyZalyicdsJXMmOqsS7JbINOQEiBT9IZnvJrXfnghYR
         hfV201PGccABbJMPnxJWnG6WlY1FbNmumy4kvL4Mo2IEVFuW5b9+5hOUUBHjoMH6NRqH
         7w9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712824414; x=1713429214;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vkHTK4ESqX/TNOQes5BFEePnKxCub16nXuCyISi2cPE=;
        b=CLp1N9tZeN6hAk5BcpQqklrYVMSVAbm5HuW7KqggIwHwjsQjWdstc0sZesBC8N5EKT
         HJJ0wo6bSeg6cbrheoD5BLozXKMRfwRPSYacThQBtm8GiZ85ubSxEbNJ/A1VonrJMuqM
         Shnb91nf4rl19oJWDs66B3BZ0Z4j3WCvfo1nufbnTFmpWhKc0RpVABOpcRdajIVg1nuu
         tPwERYwbmQSM/eODKzdj5Xc00YKy0dG3XcAFg20GdtuMCrBS+UwrIAwX7l42tQVSFbAT
         5gC+TM9ae2ZhfWXK7ZEjQPpC09n8LHa8ue7LtCYD1FheNKpWq4wesDjhhbgg3z9UWeek
         g7mw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX/UWIMCMh3SZac7qMVgwzPDC/TjYHoDGvKxm52bkfRC0PBoPe2KzLIkf3Q7GTOPABMD09XzuAip4o9Rv12yHYP9aLTiYSRa3mECTc=
X-Gm-Message-State: AOJu0Yzcp4rkrVWkp5kIju9mia2oPx7IktyeRa5PIqHMt+wr5hU/u3NN
	xgfhg9ijQoJRInS/lPkFbBXTUT50qc7Ahjrtl02K4dGddRo8xgpc
X-Google-Smtp-Source: 
 AGHT+IFtp0DWfwST7nMWZ2qCwJgGiOsf+Npw3G6Qc3gK3g7PsMXoDvpLhJgs+HsHbc8zzfeOrRU/+w==
X-Received: by 2002:a05:600c:3148:b0:417:e541:978b with SMTP id
 h8-20020a05600c314800b00417e541978bmr159850wmo.31.1712824414086;
        Thu, 11 Apr 2024 01:33:34 -0700 (PDT)
Received: from localhost
 (craw-09-b2-v4wan-169726-cust2117.vm24.cable.virginm.net. [92.238.24.70])
        by smtp.gmail.com with ESMTPSA id
 l35-20020a05600c1d2300b004161af729f4sm1629871wms.31.2024.04.11.01.33.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Apr 2024 01:33:33 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] ASoC: codecs: tas2780: remove redundant assignments to
 variable ret
Date: Thu, 11 Apr 2024 09:33:32 +0100
Message-Id: <20240411083332.304887-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 4BWVPNXYP3YMO6TDMK6WQ4VEVPZACYUS
X-Message-ID-Hash: 4BWVPNXYP3YMO6TDMK6WQ4VEVPZACYUS
X-MailFrom: colin.i.king@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: <>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Variable ret is being assigned a value that is never read in a couple
of places. The variable is being re-assigned later on. The assignments
are redundant and can be removed.

Cleans up clang scan build warning:
sound/soc/codecs/tas2780.c:84:2: warning: Value stored to 'ret' is
never read [deadcode.DeadStores]

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 sound/soc/codecs/tas2780.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/sound/soc/codecs/tas2780.c b/sound/soc/codecs/tas2780.c
index 41076be23854..972e8ea5ebde 100644
--- a/sound/soc/codecs/tas2780.c
+++ b/sound/soc/codecs/tas2780.c
@@ -71,7 +71,7 @@ static int tas2780_codec_resume(struct snd_soc_component *component)
 {
 	struct tas2780_priv *tas2780 =
 		snd_soc_component_get_drvdata(component);
-	int ret = 0;
+	int ret;
 
 	ret = snd_soc_component_update_bits(component, TAS2780_PWR_CTRL,
 		TAS2780_PWR_CTRL_MASK, TAS2780_PWR_CTRL_ACTIVE);
@@ -81,7 +81,6 @@ static int tas2780_codec_resume(struct snd_soc_component *component)
 			__func__, ret);
 		goto err;
 	}
-	ret = 0;
 	regcache_cache_only(tas2780->regmap, false);
 	ret = regcache_sync(tas2780->regmap);
 err:
-- 
2.39.2

