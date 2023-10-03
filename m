Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E7FC7B6D9D
	for <lists+alsa-devel@lfdr.de>; Tue,  3 Oct 2023 17:58:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5BFE2868;
	Tue,  3 Oct 2023 17:58:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5BFE2868
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696348734;
	bh=WlhpXA3KDD0/FgpskiX15zwM8aTAJe0rZMpdmLJeseI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=HnY/1UCNOKAcMRifewtsA/FK3H/lWwteTuPsyJJFejvQ54b66zWuXpwfJ3PdpI7gH
	 HKlqtCYXH+8Yl4/90qBQ2TlrvWHICESB43jTKFERHySGB5dhIiilUasCCgMcRCztaI
	 SwVslTReI7WbxgFnxeJtjPYvIxQ1aG/eGeAYrgCw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1BE26F80564; Tue,  3 Oct 2023 17:57:34 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CCEB0F8055B;
	Tue,  3 Oct 2023 17:57:33 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C71DCF80549; Tue,  3 Oct 2023 17:57:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BB8EDF80166
	for <alsa-devel@alsa-project.org>; Tue,  3 Oct 2023 17:57:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BB8EDF80166
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=QgxgE4Mv
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-9ad8a822508so201169366b.0
        for <alsa-devel@alsa-project.org>;
 Tue, 03 Oct 2023 08:57:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696348637; x=1696953437;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GTMTkkvOrFaQjz0yOJaB7Q7/cPC8x6m+P9hBCS11kOw=;
        b=QgxgE4Mvk6FKB3tVPs/jZifWhZNiP/M7jXmMqPzkS2n3cg2SBblFtzhPmudZTRnibm
         oP2CzCzcx74OQVFKAUu9dXLXFLT5ywHRikRS4PqDw7bex1If76UeBqhWvi24r+rjfYTM
         3iDOC1cZAYYJN/fKXx+Bo8WphpCMxNT6lRb6S6ziqZALgAsMJqKnrhX3WAwPazGwA4EK
         rg+rM4lBzyQPd7EL9HgYkvRZVQkW2KteDmKE0z994ukB7XU7SFVeQZfRpGha19u8Ly7V
         MWgBxBJTWSA2jtSBOEa9PJcGZXBXOjAesQeljM6C7UlBXKA4fKLS0kIdADdDJAai7w6I
         +64w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696348637; x=1696953437;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GTMTkkvOrFaQjz0yOJaB7Q7/cPC8x6m+P9hBCS11kOw=;
        b=gvhyPJu76TIJnLuLAKD4gl9J9mXqSVtUgize2d2gz0GScLBm0FfG6smfmZwbZcyphy
         wTArEPjMKaPKk0eglUHm75lxBPzRs1wyWYJ/qq5xVJHVtGk8ILSDA3vGJa3Cd86XxmpL
         haB8hJoOu4gRY8Ak6B9iYCyw1ySYGJeqy159FApesNVzMUC2wixs55pMqvvDFL4GoZbD
         E8FI3EhlTnEWnhfEZcDhcf/F+OLN4qinCbGCI1jqQobp8UcG8AtXwMBz2bVFyieNz+RU
         pSSC5qr8ZGV46sv7fvi0FYpjxheJ93423xJLEr6zQjGwiTBn7w54LYNmLZDtGNXn8kwM
         kYoQ==
X-Gm-Message-State: AOJu0YzTtgTLnVfP1kOHZfJurK2Ls3mPtcQMxmG6/qCfXgwlKNrxHwBK
	gwT9dwOBsMK7UvjUAOXoxHuZVw==
X-Google-Smtp-Source: 
 AGHT+IH6Iv8pRe5kVjLJr/VnS5qxhiKaTIKJ7fgCvAijxKTfbrDX6qtvCp9N5M3hF1FzRbOXyUwQig==
X-Received: by 2002:a17:906:7383:b0:9ae:5aa5:ee6c with SMTP id
 f3-20020a170906738300b009ae5aa5ee6cmr14822922ejl.12.1696348637599;
        Tue, 03 Oct 2023 08:57:17 -0700 (PDT)
Received: from krzk-bin.. (5-157-101-10.dyn.eolo.it. [5.157.101.10])
        by smtp.gmail.com with ESMTPSA id
 w25-20020a170906481900b0099bc2d1429csm1288088ejq.72.2023.10.03.08.57.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Oct 2023 08:57:17 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 2/2] ASoC: codecs: wsa-macro: handle component name prefix
Date: Tue,  3 Oct 2023 17:57:10 +0200
Message-Id: <20231003155710.821315-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231003155710.821315-1-krzysztof.kozlowski@linaro.org>
References: <20231003155710.821315-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: SQKWCQTRC22EKWL4MXVUA5XF66F5ZHXF
X-Message-ID-Hash: SQKWCQTRC22EKWL4MXVUA5XF66F5ZHXF
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SQKWCQTRC22EKWL4MXVUA5XF66F5ZHXF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

When comparing widget names in wsa_macro_spk_boost_event(), consider
also the component's name prefix.  Otherwise the WSA codec won't have
proper mixer setup resulting in no sound playback through speakers.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/codecs/lpass-wsa-macro.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/lpass-wsa-macro.c b/sound/soc/codecs/lpass-wsa-macro.c
index ea6e3fa7e9e1..7e21cec3c2fb 100644
--- a/sound/soc/codecs/lpass-wsa-macro.c
+++ b/sound/soc/codecs/lpass-wsa-macro.c
@@ -1675,12 +1675,12 @@ static int wsa_macro_spk_boost_event(struct snd_soc_dapm_widget *w,
 	u16 boost_path_ctl, boost_path_cfg1;
 	u16 reg, reg_mix;
 
-	if (!strcmp(w->name, "WSA_RX INT0 CHAIN")) {
+	if (!snd_soc_dapm_widget_name_cmp(w, "WSA_RX INT0 CHAIN")) {
 		boost_path_ctl = CDC_WSA_BOOST0_BOOST_PATH_CTL;
 		boost_path_cfg1 = CDC_WSA_RX0_RX_PATH_CFG1;
 		reg = CDC_WSA_RX0_RX_PATH_CTL;
 		reg_mix = CDC_WSA_RX0_RX_PATH_MIX_CTL;
-	} else if (!strcmp(w->name, "WSA_RX INT1 CHAIN")) {
+	} else if (!snd_soc_dapm_widget_name_cmp(w, "WSA_RX INT1 CHAIN")) {
 		boost_path_ctl = CDC_WSA_BOOST1_BOOST_PATH_CTL;
 		boost_path_cfg1 = CDC_WSA_RX1_RX_PATH_CFG1;
 		reg = CDC_WSA_RX1_RX_PATH_CTL;
-- 
2.34.1

