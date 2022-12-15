Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C646764DC6D
	for <lists+alsa-devel@lfdr.de>; Thu, 15 Dec 2022 14:44:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5832E198D;
	Thu, 15 Dec 2022 14:43:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5832E198D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1671111885;
	bh=9gFHVVsZUVr/C0EcO6ke4YufZ0z54KR/5VcYeVtprnE=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=UUMm2x6GhyGVDvp9/hXwaH/e6j7XazxYBkXIg0+5enW7wcQTD2VITOMN87V4OP7mF
	 eM3G0MwSlcP5K9zZ5blKwIa0qhbrYhVS+i0RuzsX3/KSRTzoRWWTRzk0fJrFjzIUPU
	 Fra3NiZ/pgpjdKKEWtDdOUXcuyOJqxfrZDopPiTY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 12869F80141;
	Thu, 15 Dec 2022 14:43:48 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7D126F804ED; Thu, 15 Dec 2022 14:43:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8CCB5F804CB
 for <alsa-devel@alsa-project.org>; Thu, 15 Dec 2022 14:43:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8CCB5F804CB
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=aIuBTe8r
Received: by mail-lf1-x12c.google.com with SMTP id p8so15689786lfu.11
 for <alsa-devel@alsa-project.org>; Thu, 15 Dec 2022 05:43:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=yeSaGzMo9vtSSNNjXtnr+AVO8TROQTWJ8g1sUJShZO4=;
 b=aIuBTe8rz7xw0KbrovzoVxh17WBpMVMqERmnZVQFKxaz5P8H1OGCEWFFBzXsKz0mwu
 3VXTGdgsnD1bSUVBBe/vkXlSDPfqoZxLiOGE/dtlstvnq+8OO7UwqWFskifYCqSQJwtF
 U8OGW8fZ676WBGpLcQRU4LDzqGJmonX18qA0kU7cAvUN9GFswHoB6iEZ0Ae1cJbpYZD0
 VbhyDYoVPPkHJnRsxs+0AydHZQzIW00s8BzEHEzYfTTAXd/flW6K6sdviZh6QbxSBjaE
 kQyAkEDnEg3DlZ6px/ntdo6/2gdkf0OU36HVmxNyyWYjv+rW5gfZseLLlqIP+hrWXWoJ
 PVag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=yeSaGzMo9vtSSNNjXtnr+AVO8TROQTWJ8g1sUJShZO4=;
 b=ToQ/9oqoGFRdaAF2lwiQo4r3uUJr+NUei91/QLZpbgBhB+Aqga3yGpdkUdxEat3gFs
 XoXaN2HjkUj6cEqdmR0zQMUzDPh6JW6CfpV9nM79oVgsnZGVjXIWFO8cSdO4HHENJHvT
 uERmMs92NwJQD2PzWvoT+nt/iG4gE6IwK8hBFatZVXWgrmyl/Dvpww8NJPued/qDEZ9u
 idL9UCpiwW/6HPCRHWTwGkWuceA9Tt/MONUx2TPQHHNgOJWzo5GHx1bBHz7rF63L7DAs
 +CqizXV25VC5wUzkTmN9sQvakw4ef5Hz2MgRgka5Z/SYw2C2hTqVYlzXGpiggi8Z6SGF
 hH4A==
X-Gm-Message-State: ANoB5pkenmN42ePy82NU/FwHbbFyY4iMk1FcCz9nLlzxv5msYLghyI7e
 cyyMaznfkhDegeGO5tN31aLgUg==
X-Google-Smtp-Source: AA0mqf7XiQTneVhAoC3rYevXT3PQNA7YtPR5evRnvv6wCZaDFVihXgUcICGydnrWBXnWeLVaKoNsig==
X-Received: by 2002:a05:6512:b8e:b0:4b5:a5c7:3286 with SMTP id
 b14-20020a0565120b8e00b004b5a5c73286mr11792153lfv.9.1671111822368; 
 Thu, 15 Dec 2022 05:43:42 -0800 (PST)
Received: from krzk-bin.NAT.warszawa.vectranet.pl
 (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
 by smtp.gmail.com with ESMTPSA id
 q21-20020a056512211500b0048aee825e2esm1161826lfr.282.2022.12.15.05.43.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Dec 2022 05:43:41 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Charles Keepax <ckeepax@opensource.cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: lochnagar: Fix unused lochnagar_of_match warning
Date: Thu, 15 Dec 2022 14:43:37 +0100
Message-Id: <20221215134337.77944-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 kernel test robot <lkp@intel.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

lochnagar_of_match is used unconditionally, so COMPILE_TEST builds
without OF warn:

  sound/soc/codecs/lochnagar-sc.c:247:34: error: ‘lochnagar_of_match’ defined but not used [-Werror=unused-const-variable=]

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/codecs/lochnagar-sc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/lochnagar-sc.c b/sound/soc/codecs/lochnagar-sc.c
index 13fbd8830b09..5e0bd0d24ed3 100644
--- a/sound/soc/codecs/lochnagar-sc.c
+++ b/sound/soc/codecs/lochnagar-sc.c
@@ -253,7 +253,7 @@ MODULE_DEVICE_TABLE(of, lochnagar_of_match);
 static struct platform_driver lochnagar_sc_codec_driver = {
 	.driver = {
 		.name = "lochnagar-soundcard",
-		.of_match_table = of_match_ptr(lochnagar_of_match),
+		.of_match_table = lochnagar_of_match,
 	},
 
 	.probe = lochnagar_sc_probe,
-- 
2.34.1

