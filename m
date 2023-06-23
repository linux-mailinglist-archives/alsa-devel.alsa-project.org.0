Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D22F73DD2B
	for <lists+alsa-devel@lfdr.de>; Mon, 26 Jun 2023 13:19:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7F7A783A;
	Mon, 26 Jun 2023 13:19:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7F7A783A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687778396;
	bh=3F0YGWmEJR+koz33zk7i9HyXhcV62C9+JzFcWkX/n7A=;
	h=Date:From:To:Cc:Subject:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=mSTxQ+RSqVdEmwauUarhWNKEakWEwHEAHAn83/V5V4ckr8JkSH0mVDLAa1+8VFVlA
	 HtFrWYSgyHuN54NQdxalUeKMGV5oDgVQcSM9MyEjYyaaA5iab8QFdQpZajOCFthhrm
	 4jkkhisycL4+PzcBJ2jJYHZ1yuySA0WrZfNwkPnk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 11B58F8027B; Mon, 26 Jun 2023 13:18:21 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5B050F80535;
	Mon, 26 Jun 2023 13:18:21 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9A078F80141; Fri, 23 Jun 2023 14:10:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A7159F80130
	for <alsa-devel@alsa-project.org>; Fri, 23 Jun 2023 14:09:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A7159F80130
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=SVRBa7pJ
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-3112c11fdc9so543667f8f.3
        for <alsa-devel@alsa-project.org>;
 Fri, 23 Jun 2023 05:09:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687522193; x=1690114193;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jwcTA8wrnkUB5oKuM0EHXCbz62y5Uq5RpVKOIFS0yUc=;
        b=SVRBa7pJFL+rAVwXlqDHwhAIxMKJcSWM18ZW5rUOe1HPbUIfEovOnx4vaXqyHrqs92
         DoR4F2HLzXcLTnDJSc2FVAjKZUJhRQcgfyTWa1U3CXhYvyTQ2QhjxtoGaMB5kchu8AfJ
         f2eRit+9jtyVz6/v06GE0ywTfXMKj4SYemEcDxEsz1o2AIz6DRxjYlgDY7q2kuXzXsk0
         /9JBtTfe/NA/YI5t+OeosQb5vk274/kUlW8cCjxlt8ZmnWY3qJQYKAHPCi9BdH0KWkiH
         Y3dTFCznye2pFPvg9aTIhH1iPNixbYBdZEYTH6m6jcMzXKp1p4uPg2Wrm6NMbv53NOxQ
         +Faw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687522193; x=1690114193;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jwcTA8wrnkUB5oKuM0EHXCbz62y5Uq5RpVKOIFS0yUc=;
        b=gIA01nZuEyffe2uVFk0/rw7GrF2t0brI4nTushsXKtMA2lQJvuuxXR/jcJ95WRm61B
         A6vtxfC618hZo3tAzz8H9tXBTQmlUd3x2/0nw2jHwOVLWKCGm+5HWGY+5tgNco8/S27l
         Te1iH7cXbRXqqEcCtvske7QNOJjwWG/mrm0eP6feCZDoMWHozzdsLjMcC8eRCfDL38nt
         dDhlWzDZ+2sgVkdDFG3kZ0KW20IYM4Um7fZafiQPIovoTWr5ynb+Ze91gKpPHqpaQKrF
         UThAnqa4tNolbhoBw1vsZL/eiDxZVbeKTWr7nrkQ3dBJ6vMeqG1N1HuGlpyOlxoqp6dj
         7YSQ==
X-Gm-Message-State: AC+VfDzxlWgI7AsKRfIWgC2PGSECxBTg4BZNYswWRKzjTHJYEbaIjKCN
	7TYMTKJFUlKTNCdHiUSyZ9shPg==
X-Google-Smtp-Source: 
 ACHHUZ6aHzHysbbGQDIPKppLrrjLdadCJ+DdUYs9OMKQXDlIKhuyvhKIL7ttjNAAUrJCkHrfcbJHNw==
X-Received: by 2002:a05:6000:1a42:b0:30f:c94e:88f6 with SMTP id
 t2-20020a0560001a4200b0030fc94e88f6mr4045205wry.0.1687522193191;
        Fri, 23 Jun 2023 05:09:53 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id
 p16-20020a5d6390000000b003113943bb66sm9298909wru.110.2023.06.23.05.09.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jun 2023 05:09:51 -0700 (PDT)
Date: Fri, 23 Jun 2023 15:09:48 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Shenghao Ding <13916275206@139.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] ASoC: tas2781: Fix error code in tas2781_load_calibration()
Message-ID: <729bb6b3-bc1d-4b3d-8b65-077a492c753c@moroto.mountain>
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
Message-ID-Hash: YKNUFK7NYF7IKOANPRAQR7ZXUKXPNQXA
X-Message-ID-Hash: YKNUFK7NYF7IKOANPRAQR7ZXUKXPNQXA
X-Mailman-Approved-At: Mon, 26 Jun 2023 11:18:16 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YKNUFK7NYF7IKOANPRAQR7ZXUKXPNQXA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Return -EINVAL instead of success on this error path.

Fixes: 915f5eadebd2 ("ASoC: tas2781: firmware lib")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 sound/soc/codecs/tas2781-fmwlib.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/codecs/tas2781-fmwlib.c b/sound/soc/codecs/tas2781-fmwlib.c
index cbf0aef2c001..eb55abae0d7b 100644
--- a/sound/soc/codecs/tas2781-fmwlib.c
+++ b/sound/soc/codecs/tas2781-fmwlib.c
@@ -1924,6 +1924,7 @@ int tas2781_load_calibration(void *context, char *file_name,
 	if (!fw_entry->size) {
 		dev_err(tas_priv->dev, "%s: file read error: size = %lu\n",
 			__func__, (unsigned long)fw_entry->size);
+		ret = -EINVAL;
 		goto out;
 	}
 	fmw.size = fw_entry->size;
-- 
2.39.2

