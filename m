Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 042B37CD8C6
	for <lists+alsa-devel@lfdr.de>; Wed, 18 Oct 2023 12:02:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 15EE582B;
	Wed, 18 Oct 2023 12:01:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 15EE582B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697623322;
	bh=T/MrGu/YTFWc4IjVZCg9ZMIGi8/JuKmcl4VOnAktiV4=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=KB7KKxl1ItbFW08VwdkaDz46QqVFt9kjHXhaTTaNN0M20fOsmevl3i3xhJ5ulBROX
	 u3/V9dKojfc7v4F+OLynoCwF5ojcihMMJBjsTLhSe3c7OsXZ631S1Yz+Ev61OKUl9x
	 49tF9+meLLZGYwaXEAJsuknB7tgKrE9zWavUKHxg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6228FF8027B; Wed, 18 Oct 2023 12:01:11 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C377CF8024E;
	Wed, 18 Oct 2023 12:01:10 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BD495F8025F; Wed, 18 Oct 2023 12:01:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D68D7F8019B
	for <alsa-devel@alsa-project.org>; Wed, 18 Oct 2023 12:00:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D68D7F8019B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=T8VXbCeg
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-51e28cac164so16045159a12.1
        for <alsa-devel@alsa-project.org>;
 Wed, 18 Oct 2023 03:00:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697623259; x=1698228059;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kvddIZrQnxFTAaEhVpmcGqWDKOvzXW76dSFcJDMbgGc=;
        b=T8VXbCegTEI/GAi6930tNPXdaFAS+QOaQClOwBxVUAinZZ9/z2FIqBzk3NKI9eBTae
         6RUIanmUDCWos1jleA1YofXRoYM6aybyKhtHe3WWhvoSHWOCXZrZjwZ/CjA7J+IS60gC
         LvwrVWOinRG2d3kPS8tVBYmJpKsbc1wtJSrxG2ZD+VHq0qbIZ8f9Ng9QHeEGYcsDdIOm
         fOoTeOzZAueFkAb0Rpt37K8163GEAW79O4zHfUn0DO5cmaFKM4V++IzDSEfGhXJ4g51n
         GucuCsKMfEuGoWgT1aS8THONq9JHPh5uvPKRXasij6ITbXG4/Mbh7NnDVexjy8tMqsc4
         eMiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697623259; x=1698228059;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kvddIZrQnxFTAaEhVpmcGqWDKOvzXW76dSFcJDMbgGc=;
        b=KZe4Afr8f7rr5Y8dhSgQqTQg7QN+eNrnt0udq36S3THIBZy4usHvSAJff8W5u9eybJ
         204bu+cJ5dKPjZX+WhUHAh6ZRHDiz8KGTOw+ayQoa7s7/ccsKvwIGDmFVugAAPz24zLd
         uqEogC5CxxSDcfMGXLOazOJt/5CHS8Rr46Hhefn3Eeqxy7uvscb2Oi/hvrdZDQPJpKCT
         kYTGUhTBPQIsWXhy7CI16ZyjdGpO/kmUf+6EOobCDjf9ruPR+orQYXdegjrjBISyXzo2
         chVk6AuZ0rXJ/i/Y4Uy9eWiyTBzTq01Pxst+uXIdPmaXyU+PmZQVdJu1QmCbULy6g46Y
         YhDw==
X-Gm-Message-State: AOJu0Ywe6A8sKmCmjvSCgfBa154z0jXoQAboI7QooyuKu6yl4W0SU/nD
	fiZVOxT5i+1v/0Pl5WKfmDCV3A==
X-Google-Smtp-Source: 
 AGHT+IH2vGShfrLckC4r3uYkums6iB07VTLBjoxIrR8Ioh3Mk+Ki1DtOQfKHterV7cnZBeX26EhQaQ==
X-Received: by 2002:a17:907:948d:b0:9be:85c9:43f1 with SMTP id
 dm13-20020a170907948d00b009be85c943f1mr4180282ejc.7.1697623258684;
        Wed, 18 Oct 2023 03:00:58 -0700 (PDT)
Received: from krzk-bin.. ([178.197.219.154])
        by smtp.gmail.com with ESMTPSA id
 bt10-20020a170906b14a00b0098884f86e41sm1310004ejb.123.2023.10.18.03.00.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Oct 2023 03:00:58 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] ASoC: codecs: wsa884x: allow sharing reset GPIO
Date: Wed, 18 Oct 2023 12:00:55 +0200
Message-Id: <20231018100055.140847-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: K3OCGARO6MB7RSXEOHWXWNQ7RKZ53VCC
X-Message-ID-Hash: K3OCGARO6MB7RSXEOHWXWNQ7RKZ53VCC
X-MailFrom: krzysztof.kozlowski@linaro.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/K3OCGARO6MB7RSXEOHWXWNQ7RKZ53VCC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On some boards with multiple WSA8840/WSA8845 speakers, the reset
(shutdown) GPIO is shared between two speakers.  Request it as
GPIOD_FLAGS_BIT_NONEXCLUSIVE to allow such configurations.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/codecs/wsa884x.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/wsa884x.c b/sound/soc/codecs/wsa884x.c
index 993d76b18b53..bee6e763c700 100644
--- a/sound/soc/codecs/wsa884x.c
+++ b/sound/soc/codecs/wsa884x.c
@@ -1844,7 +1844,7 @@ static int wsa884x_probe(struct sdw_slave *pdev,
 		return ret;
 
 	wsa884x->sd_n = devm_gpiod_get_optional(dev, "powerdown",
-						GPIOD_OUT_HIGH);
+						GPIOD_FLAGS_BIT_NONEXCLUSIVE | GPIOD_OUT_HIGH);
 	if (IS_ERR(wsa884x->sd_n))
 		return dev_err_probe(dev, PTR_ERR(wsa884x->sd_n),
 				     "Shutdown Control GPIO not found\n");
-- 
2.34.1

