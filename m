Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 891E36C6E0A
	for <lists+alsa-devel@lfdr.de>; Thu, 23 Mar 2023 17:46:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 743D0ED5;
	Thu, 23 Mar 2023 17:45:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 743D0ED5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679589967;
	bh=dGCMfukBL90fVjVt/PN8ob3e5yVFQAtXFokv1zgd0RM=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=A25gWxth9X4qEh/qBsVN2nMljzoWkN6W8ehZMgr7TKYzhaBtwhCPxJI7nxH54lHmJ
	 /peeBCQEQQwzIuHwjuUMJ1rvxuGHHX4KzGdSRnxNpyJ1EyIXnvjdw/9/cIicdcSAcJ
	 StuhZy3OpvuXMh5TI6JI4ZM9JK+Ujw1KwKFnTebs=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id F05BDF804FE;
	Thu, 23 Mar 2023 17:44:27 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E2B3FF804FE; Thu, 23 Mar 2023 17:44:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9F3C8F8027B
	for <alsa-devel@alsa-project.org>; Thu, 23 Mar 2023 17:44:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9F3C8F8027B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=mkSLbSGc
Received: by mail-ed1-x52a.google.com with SMTP id x3so89456790edb.10
        for <alsa-devel@alsa-project.org>;
 Thu, 23 Mar 2023 09:44:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679589856;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4p58Lw+agHASsKfJ6aDJH9J3fw9PY/7V6UBtha5qnBQ=;
        b=mkSLbSGc8DserzlRocfmGovK4CVXM9wFX93zf+RwrfRNWUdp0Aqb3/jH+3ZaNQ99Mu
         5pnqk8ZX63k1t+viVUk0gpVnV4uNs+fEL6HN7KBXrplCxQSWeBe+qV8rUHCuZCVMfaUJ
         UCmEeyBAG8reHjZxRR+Uk1XhfRgn/00G0CNcSpQfjbGGoeNF/kyd5/CbsnC+e7IoKdo6
         8JzuammEipu17QgSECVds5BEVRGVaL0mooaiJqUw+B6oO2CWoShT5kq9DFIZ3jTg1n+2
         1WaNZ7pGrmOJhHD7qg9vPhIorYzlbU8fynb98St6KupzEuMSjsPbYpaE4hzjlEHyIKqq
         OIdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679589856;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4p58Lw+agHASsKfJ6aDJH9J3fw9PY/7V6UBtha5qnBQ=;
        b=fqVY7n+2yLmU2df815iOXDjsaWMPa/G7ph+D/QU4MADYNdcrGokysND+zRFgt2EaI+
         ORzNdmaMgI4ozC9VRn+waqRcAn+pXM4FhgJmgGtSzbz/FOaOzKbmtg/NRqlHrTVyrvSp
         vosdhgpegoxfv5umvvdbqMZTPDm41RNfDeBZsewei4QPTLFMG4l4wJw+EIu0AuN0je8B
         oE4fvh2zUebg5hzBCO4SECpH18/Nh2qNQlsTQv8QTDryRyM+qcZk5mut2fWRX/km43Al
         amrDEVx+Ac/LwcjWuVf/5VC35yBH25AE2blkhiYbcd0nucjwivui1NPTCC0egpzRW16J
         ZVeA==
X-Gm-Message-State: AO0yUKV0C/6yqk6eQlifqEIJ6SEovG9QmW8SR6lYKQzMi14BL0VbibqQ
	g+9icB2KfDwAU17/nDRbT7JnUg==
X-Google-Smtp-Source: 
 AK7set/1iEUyO0rmlFJ0I7ZZcuxj1Fi1IMkDzUKyo1qAoN5vycDXyk/M6lvLxoh02t6QggEmrhoOiA==
X-Received: by 2002:a17:906:6d4e:b0:8b8:c06e:52d8 with SMTP id
 a14-20020a1709066d4e00b008b8c06e52d8mr11481150ejt.36.1679589855954;
        Thu, 23 Mar 2023 09:44:15 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id
 m10-20020a50998a000000b004e48f8df7e2sm9542187edb.72.2023.03.23.09.44.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Mar 2023 09:44:15 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH 2/4] ASoC: qcom: sdw: do not restart soundwire ports for every
 prepare
Date: Thu, 23 Mar 2023 16:44:01 +0000
Message-Id: <20230323164403.6654-3-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20230323164403.6654-1-srinivas.kandagatla@linaro.org>
References: <20230323164403.6654-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: ULU4FVP5MKKS37H6OMJMQB4SFJY2ZWCU
X-Message-ID-Hash: ULU4FVP5MKKS37H6OMJMQB4SFJY2ZWCU
X-MailFrom: srinivas.kandagatla@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: tiwai@suse.com, lgirdwood@gmail.com, linux-kernel@vger.kernel.org,
 alsa-devel@alsa-project.org, johan+linaro@kernel.org, steev@kali.org,
 dmitry.baryshkov@linaro.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ULU4FVP5MKKS37H6OMJMQB4SFJY2ZWCU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

unpreparing/disabling and preparing/reenabling soundwire ports is not required
for every prepare call, this add lots of click and pop noise if we do this in
middle of playback or capture.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/qcom/sdw.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/sound/soc/qcom/sdw.c b/sound/soc/qcom/sdw.c
index 10249519a39e..1a41419c7eb8 100644
--- a/sound/soc/qcom/sdw.c
+++ b/sound/soc/qcom/sdw.c
@@ -32,11 +32,8 @@ int qcom_snd_sdw_prepare(struct snd_pcm_substream *substream,
 		return 0;
 	}
 
-	if (*stream_prepared) {
-		sdw_disable_stream(sruntime);
-		sdw_deprepare_stream(sruntime);
-		*stream_prepared = false;
-	}
+	if (*stream_prepared)
+		return 0;
 
 	ret = sdw_prepare_stream(sruntime);
 	if (ret)
-- 
2.21.0

