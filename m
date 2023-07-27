Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F6C67648FF
	for <lists+alsa-devel@lfdr.de>; Thu, 27 Jul 2023 09:40:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C9D33850;
	Thu, 27 Jul 2023 09:39:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C9D33850
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690443647;
	bh=i4FtvcnHP1eZuNAHRmk+vFCHET61dT7uoic7/rel1NI=;
	h=Date:From:To:Cc:Subject:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=hitlOaCTX0yYSqDjB57gCsFVzT7kegTO/BNDMEmou8Kek76LQhWUYEIjKtfzAvXC7
	 JgTUQZ+8Zsv0ir2j/fkfqcbHw0DLkgjKUoCIjH08DCSTLLrVkOiSI0HNXUnFqcNRBm
	 I9bOfc2tB6NyWaCK/bzcVn+6HzP6VH2p+3s36q1c=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D396AF805C0; Thu, 27 Jul 2023 09:38:23 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 423F7F805C0;
	Thu, 27 Jul 2023 09:38:23 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2ED4BF8019B; Thu, 27 Jul 2023 09:16:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 41F91F80149
	for <alsa-devel@alsa-project.org>; Thu, 27 Jul 2023 09:16:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 41F91F80149
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=vOhAluSi
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-3fbea14706eso6525775e9.2
        for <alsa-devel@alsa-project.org>;
 Thu, 27 Jul 2023 00:16:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690442197; x=1691046997;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hkADfI1IITAtEX5v+S8j3Mm4PQmUqoleV9IfpFo9m5w=;
        b=vOhAluSiGvZlYqXw23vgq1DpLCehDHSf1+Kos+7coPZq2YLiiaurcBlSc5Qc+vh4yj
         TYnvNcOq4Tzy1eQlXmS63lYMSvTaeuuJeXunzCt6E4GAS0MXpFpMBcRmx7p+NO5irLPN
         Tn1URsTkC4QCjnSmBMHVSjKg4wQx2NRD5FpK2w+BdUkPJzeaQ2eVPPd9d0+sXYffbKhQ
         yLYbBA8PCVNx+45x8aWVRl9mg+srViwkfskslQ25DIQM+Y25BOEg9YP/+56skGWMa8c8
         8GMhtd4ZTyWjkgQdNggXiI+CFdYFYISynoq5P7HixW3M8bZtAlXeWadIvGtxlz1b2HoH
         LloQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690442197; x=1691046997;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hkADfI1IITAtEX5v+S8j3Mm4PQmUqoleV9IfpFo9m5w=;
        b=g6VKvI8P6HSxvoXmlVVMoqmaXi3+fq8JA/sZKkYJ74/wALYrr72/jMdjwm4o8kSazx
         ftnUKRWTbKLdkMkiLk75+k2v/81vRDeC5SyyFfNKFXAvHQxTJ/RHq9dYHyvJO7rfILTg
         pH+7QLeK2U9/jpxyUgskHioL+v7O9QxQl3jFd9nCqmaXZxpqzAOP7DgWkkQUiQcp0uOk
         7kf13b4GIXaZJUzrlHnNoDVJPfkC5/bV3PtpuZFcQPblr15xag/zu6xdsxvxOSG0CUom
         Dpu5Pv4rmNm8TK1UZDANZMNdIW/665ho/5VKXU1jmaAWVQ6QUSJhcNsTvMLH3faR5PMB
         oWuQ==
X-Gm-Message-State: ABy/qLZSf1K9UuF2FN0joHsu57dPJZ709TkzlMgdEXqmNFJEctqjF+qI
	MzauBqbEAPY/KBbqxijf5yGH4w==
X-Google-Smtp-Source: 
 APBJJlGX8E9P4/I5JQDGiC2JpjRcVDZJdtV/ZWZICj5PRQB90Ll5/+I0L2gBa5R0jGBYo/1MSo0sKQ==
X-Received: by 2002:a5d:4942:0:b0:317:6fff:c32b with SMTP id
 r2-20020a5d4942000000b003176fffc32bmr977308wrs.53.1690442197192;
        Thu, 27 Jul 2023 00:16:37 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id
 z1-20020adfd0c1000000b0031424f4ef1dsm1165692wrh.19.2023.07.27.00.16.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jul 2023 00:16:36 -0700 (PDT)
Date: Thu, 27 Jul 2023 10:16:33 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Simon Trimmer <simont@opensource.cirrus.com>
Cc: James Schulman <james.schulman@cirrus.com>,
	David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Mark Brown <broonie@kernel.org>, alsa-devel@alsa-project.org,
	patches@opensource.cirrus.com, kernel-janitors@vger.kernel.org
Subject: [PATCH] ALSA: hda/cs35l56: Do some clean up on probe error
Message-ID: <465160f4-b7cf-41d5-931e-d6c9e68fa3c7@moroto.mountain>
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
Message-ID-Hash: G3PCZK5ZKJNCDRBG7ROSUWN4GP3Q4ADH
X-Message-ID-Hash: G3PCZK5ZKJNCDRBG7ROSUWN4GP3Q4ADH
X-Mailman-Approved-At: Thu, 27 Jul 2023 07:37:00 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/G3PCZK5ZKJNCDRBG7ROSUWN4GP3Q4ADH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Smatch complains that this return should be a goto:

    sound/pci/hda/cs35l56_hda.c:910 cs35l56_hda_common_probe()
    warn: missing unwind goto?

The goto error disables cansleep so that seems reasonable.

Fixes: 73cfbfa9caea ("ALSA: hda/cs35l56: Add driver for Cirrus Logic CS35L56 amplifier")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 sound/pci/hda/cs35l56_hda.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/pci/hda/cs35l56_hda.c b/sound/pci/hda/cs35l56_hda.c
index 71e95e64f8a4..4c3279f61b94 100644
--- a/sound/pci/hda/cs35l56_hda.c
+++ b/sound/pci/hda/cs35l56_hda.c
@@ -907,7 +907,7 @@ int cs35l56_hda_common_probe(struct cs35l56_hda *cs35l56, int id)
 
 	ret = cs35l56_set_patch(&cs35l56->base);
 	if (ret)
-		return ret;
+		goto err;
 
 	regcache_mark_dirty(cs35l56->base.regmap);
 	regcache_sync(cs35l56->base.regmap);
-- 
2.39.2

