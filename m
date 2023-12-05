Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 05845805012
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Dec 2023 11:18:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 182D0843;
	Tue,  5 Dec 2023 11:18:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 182D0843
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701771508;
	bh=tS5XXtj/PSXjt5pVWUU80OoVDpksaXPKZikeynJoEZo=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=I1I+c9vFMzgFWxEgbCywXaibt9D2PBY++GqWZzdeE/y1enmZ3T2O/lCHZZc1+pTBR
	 btjbiLZ161ehlZvJ/WjlyoD7rjgl8HlMOhNso+YQgxx/yI0bpkeWbA0yT7WyvWthjU
	 BfoVAqywWkqEQOvIWea7/6QXZjCwnZMh1p/6j8YM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1D2CFF8028D; Tue,  5 Dec 2023 11:17:55 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5482BF80571;
	Tue,  5 Dec 2023 11:17:55 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 70919F8024E; Tue,  5 Dec 2023 11:17:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 20457F800AC
	for <alsa-devel@alsa-project.org>; Tue,  5 Dec 2023 11:17:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 20457F800AC
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=LpiDOQK/
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-40b399a6529so40353535e9.1
        for <alsa-devel@alsa-project.org>;
 Tue, 05 Dec 2023 02:17:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701771462; x=1702376262;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uJBKssIQGKxkPqlelIJU0W9JViZCvTkkSVAhWadYU4Q=;
        b=LpiDOQK//V1ugOZ/QHQa36mhcaxivj2FTDZCa0IP6PoqjicZW7PJYm5GoRfvR3RNpE
         Xdw7FnLU8c32zZ+CRi0s3roFeOlug4oK/FZSMjpv9gtjPq/Mr26L+VG8Zw9jyeykZH+i
         wWmYMTaFCDphFxPTc5Z7+P78eoswUk03Cuyw3IUPzd7xn0DVyYC1gyAW2nKNk/iYtd1p
         CxPSCTPzYACE80PuzxGQeqY6LUJLLAHDJf0ojiYybgucKgOrrtyGP5PCL2fKpT/NN4vy
         RXCf4REud7QORhQMTUQfyBHaavpLQasQ/HGHNmUs2Ry3KTWhPYgcOBXQZOJmppeSJ9+E
         5DKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701771462; x=1702376262;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uJBKssIQGKxkPqlelIJU0W9JViZCvTkkSVAhWadYU4Q=;
        b=tVw+uesbEELH9EhF6XSg12OZYvveSUDIqStGYTykdjF+8ExfUDTIB2aaOcZdfPdfPG
         q4ySuo3WQxw3B7Wusmo4VvZCfvgXWcjAZzDvSIxGRXyir4AOq3fgTEuyqpSaG6t/IgC8
         qqkhQjblYL28h9Qr/cn6N/6n6b1cuACSNWX0K44MEv/N31xXB+/2u6UyaIwmvmPxmeoA
         wuU5WNrTz4hwCu1FudnuibkQfktDatmvsfXLcN37Q8E4Rf2b23ayTwdYiAUXEmiiVoWo
         bW0RdVZYOzcbYWEiXLkRhbqcmrRYyKAwwXVY3DJ/ON6rzypGOcpISge3pR/IzxgThHL0
         AN2g==
X-Gm-Message-State: AOJu0YwMTkubrl4ydHcb56QZH6vJ9EsUMZRwFAWTte/P9DcxKOrUqzzC
	aY2Mnftusoura+XBAK69qUI=
X-Google-Smtp-Source: 
 AGHT+IGcYkj9vHpGOjdhpw/Nc/NNNK79W6EablJZAbbv5BwQsKA+3A9C2gHnonbbWzWmSFvF7mnhYQ==
X-Received: by 2002:a05:600c:a45:b0:40b:5e26:237b with SMTP id
 c5-20020a05600c0a4500b0040b5e26237bmr375938wmq.44.1701771462047;
        Tue, 05 Dec 2023 02:17:42 -0800 (PST)
Received: from localhost (cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net.
 [80.193.200.194])
        by smtp.gmail.com with ESMTPSA id
 w12-20020a5d680c000000b003333e09990dsm8139840wru.8.2023.12.05.02.17.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Dec 2023 02:17:41 -0800 (PST)
From: Colin Ian King <colin.i.king@gmail.com>
To: James Schulman <james.schulman@cirrus.com>,
	David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org,
	patches@opensource.cirrus.com,
	linux-sound@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] ASoC: cs4271: Fix spelling mistake "retrieveing" ->
 "retrieving"
Date: Tue,  5 Dec 2023 10:17:40 +0000
Message-Id: <20231205101740.2820813-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-ID-Hash: IQCWTBDONXYFDOQ2WSBLV7GECL2F3GY6
X-Message-ID-Hash: IQCWTBDONXYFDOQ2WSBLV7GECL2F3GY6
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
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IQCWTBDONXYFDOQ2WSBLV7GECL2F3GY6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

There is a spelling mistake in a dev_err_probe error message. Fix it.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 sound/soc/codecs/cs4271.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/cs4271.c b/sound/soc/codecs/cs4271.c
index 74a84832d958..e864188ae5eb 100644
--- a/sound/soc/codecs/cs4271.c
+++ b/sound/soc/codecs/cs4271.c
@@ -643,7 +643,7 @@ static int cs4271_common_probe(struct device *dev,
 	cs4271->reset = devm_gpiod_get_optional(dev, "reset", GPIOD_ASIS);
 	if (IS_ERR(cs4271->reset))
 		return dev_err_probe(dev, PTR_ERR(cs4271->reset),
-				     "error retrieveing RESET GPIO\n");
+				     "error retrieving RESET GPIO\n");
 	gpiod_set_consumer_name(cs4271->reset, "CS4271 Reset");
 
 	for (i = 0; i < ARRAY_SIZE(supply_names); i++)
-- 
2.39.2

