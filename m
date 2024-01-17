Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 60973830955
	for <lists+alsa-devel@lfdr.de>; Wed, 17 Jan 2024 16:13:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BC1763E8;
	Wed, 17 Jan 2024 16:13:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BC1763E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1705504422;
	bh=GCZrQDHaMa0VPIX4o4j8+CDBJ3xXXLP0Tb/HGEhCxls=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=a/U+QmtLSD5+OZcXm1C4AxpKOa+5KJ8ic/FOYewA86aVuBQOFEPGdj9FX/oI9fyvr
	 0VsgTeOw2W5D7j8cj4z46TfoZC64Thvi8A8O3SVDFKvwqBRrJJp6dTl7YJ68npHV8f
	 ldVUKi8dmj8rSs0D1mJm+LSHUj6qcDJigS0YK6Yk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D49E5F805F6; Wed, 17 Jan 2024 16:12:38 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 41582F805F5;
	Wed, 17 Jan 2024 16:12:38 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B4079F805D8; Wed, 17 Jan 2024 16:12:34 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-qt1-x82e.google.com (mail-qt1-x82e.google.com
 [IPv6:2607:f8b0:4864:20::82e])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7ACD2F80548
	for <alsa-devel@alsa-project.org>; Wed, 17 Jan 2024 16:12:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7ACD2F80548
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=ZQTwJ3/I
Received: by mail-qt1-x82e.google.com with SMTP id
 d75a77b69052e-42993124fa1so67766491cf.3
        for <alsa-devel@alsa-project.org>;
 Wed, 17 Jan 2024 07:12:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705504344; x=1706109144;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ixH1kcICmlswgGdL4OCIid5fgK6X+yz0saxJFyTHsOI=;
        b=ZQTwJ3/I6gwmfkXFV/LEt8F7Qn1suUCQw1rw6GHr3mg+8bQXxSWQ2PN/sfOWjvbSdr
         OvP3r4P2gbuxo0MeR3YQMKiyGFqYLfCC/HKE2qIaCxSdpmLjQmfBR0EOZOSb0FNc9jkq
         5ZaHSUM7IpdgWxlXev70eojoMVg/c/ViCxlNyFfBM0oC/AWcMshM+nR4KEmeshlj3h3Z
         hNEDRDXnOWNmAb7XnqCTopI7dDSIMbbuvO17ImpG84vn6+j+Q3PlIHea/0VfolPVbG1A
         uiqHyph9vvuen57efzhjHyLMnU1ta7TO24FPFI+cCxEDdtv3I7tjlrS9GYSTLev4ke1E
         7biQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705504344; x=1706109144;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ixH1kcICmlswgGdL4OCIid5fgK6X+yz0saxJFyTHsOI=;
        b=gY5621ZPLCgfYqtLDYdwX55s8zgc62UoHrnoeD8oXGz3NxbzRjy6a7Sqogx65wD/Ky
         5+MKdxlvavBUKuBzXJk4Qiv/PrlUaraylm6giax/gkIFTAsngb+46ZWzK3Agzs9/6VxJ
         /Ej/k0UR01kBOov+Q/4k1QmO+bobCAaBw51qkd2MG/d56ahsbD65U/+Wo3lsezx3cBNi
         EDp7Zihrdf3q3lxoAkC0V/BsZ99NtNztyxVxnXgvDzu8dpHh1t8bo2WDC+jSByLVQaGb
         fkMx6b/GKLHWN0nCP1if5k42w0IC5wRvHhErNWNKTbtyW9DAgF2Az646MUSjVCWWs8YP
         IGrw==
X-Gm-Message-State: AOJu0YwC1OkfaXTO/aw0EEzEJTWuAHIR4sh6Eyq39AEla6VqcUkP1X1S
	ispQ+HvK52lKN0RtBoVSk85gjjHJFI2bWg==
X-Google-Smtp-Source: 
 AGHT+IGKpZZkvxd3eMsUpIls7FJA2Nl5Ug6PcJy3m/KUNJ109oGm7KrlaXZDhPDpTPidr1LTLydhHA==
X-Received: by 2002:ac8:578a:0:b0:42a:733:c26b with SMTP id
 v10-20020ac8578a000000b0042a0733c26bmr3066083qta.54.1705504342921;
        Wed, 17 Jan 2024 07:12:22 -0800 (PST)
Received: from krzk-bin.. ([178.197.215.66])
        by smtp.gmail.com with ESMTPSA id
 m7-20020a05620a24c700b007816cf21f7asm4519337qkn.76.2024.01.17.07.12.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jan 2024 07:12:22 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 3/3] ASoC: codecs: wcd934x: drop unneeded regulator include
Date: Wed, 17 Jan 2024 16:12:08 +0100
Message-Id: <20240117151208.1219755-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240117151208.1219755-1-krzysztof.kozlowski@linaro.org>
References: <20240117151208.1219755-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: OSSV4VM7UB4MQP4ITAI7ECZSJVAUBJJB
X-Message-ID-Hash: OSSV4VM7UB4MQP4ITAI7ECZSJVAUBJJB
X-MailFrom: krzysztof.kozlowski@linaro.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OSSV4VM7UB4MQP4ITAI7ECZSJVAUBJJB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Driver does not use any regulator code, so drop redundant include of
regulator/consumer.h header.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/codecs/wcd934x.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/codecs/wcd934x.c b/sound/soc/codecs/wcd934x.c
index 1b6e376f3833..6813268e6a19 100644
--- a/sound/soc/codecs/wcd934x.c
+++ b/sound/soc/codecs/wcd934x.c
@@ -13,7 +13,6 @@
 #include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
-#include <linux/regulator/consumer.h>
 #include <linux/slab.h>
 #include <linux/slimbus.h>
 #include <sound/pcm_params.h>
-- 
2.34.1

