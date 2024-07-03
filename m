Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 08E07925FD4
	for <lists+alsa-devel@lfdr.de>; Wed,  3 Jul 2024 14:12:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3E88EF50;
	Wed,  3 Jul 2024 14:12:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3E88EF50
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1720008764;
	bh=38E+3ou+E/LV2E8yp/WlqkpQYFuVfruI6m/kZhWQIwI=;
	h=From:Subject:Date:To:Cc:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=BX6P44kObCQs0XHBs5mng7w4Az6EUDWI2KBraCho9jHr8CtMTqUN8CakkI5BNGS0d
	 wVcEwMES8FWI01SG0+0ppq65XteMWM90v+P4P00yReFehF1x/So3AttchY7CtbpltV
	 Uz7X/iDb4hQpKfpcMPVs5yaJBcK+ArUoqxqy0CwI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 91D48F805AC; Wed,  3 Jul 2024 14:12:12 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DB0A7F805B1;
	Wed,  3 Jul 2024 14:12:11 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 09E03F80568; Wed,  3 Jul 2024 14:11:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1EBFEF800FE
	for <alsa-devel@alsa-project.org>; Wed,  3 Jul 2024 14:11:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1EBFEF800FE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=xdCLXjco
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-2eaa89464a3so54390521fa.3
        for <alsa-devel@alsa-project.org>;
 Wed, 03 Jul 2024 05:11:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720008669; x=1720613469;
 darn=alsa-project.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cedFw99A7YSckyMyYKT6p5GP9raiQYHtK+ru95zornE=;
        b=xdCLXjcoLb+EYfgTBbqYPwDS3xcgveq7+sFb8e/3be/4bE/no2A4bRGrbipA4VJYdZ
         kmUcmZ5ClS+/VT3obxQ+ZO8fiZSJJHigW1e5AiUtlkODt1JomhS36sHidd7T29YYbWa/
         98GR0OmRo1hJtt6Eg1l0FGWgqGgZ6zzwbXzlA7B2wCVZWjc7owIMTToO9Bc2jXoPrniA
         kEr/clirlg0SKI3/TRI5NwjPvQqGa8z4NsA3qbzyPdFSgVZVbHlcQDPh1TIcVG2OdDYJ
         JlloJ/R+nwdcOgkQPvmDBu3HiQK0t0GMZqagfsc3LLUzqk9OPvExEbzjtPY+exNsG18t
         O/mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720008669; x=1720613469;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cedFw99A7YSckyMyYKT6p5GP9raiQYHtK+ru95zornE=;
        b=IMSvOB0vgoK6aqTqayJmb8Nae3sd85rwVp4ve3sZ6VSG9emV9u1b/kAfyCKqz0N0Tc
         cjoj9uIvicuU7s/237dPnUFTVXuf3B+WZAagiHDuaH40m3yRXdS6H7QgbNOPY4467v4Z
         VbghFMQq0xlAYZc4Mhalw+4wZr1XnQE2GVLx/R8MaB9YqG6xTFNMt6l8NJCTz8vWUoRu
         8aZxG/CaXCQkL0rtbXdjAeBkkB0Y3Z30zErhNwst42RfJlLgY/zpvtd+M+pPUcE0dE8G
         lnueSJcEzeLax650NK9v4hSV8kHY87Lv6AjTZVoG4O1iTHATXoQnxUcP5z14ZwTpMT7E
         cfdg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX8v4Q4I3ypWm26dQwF+ZrRTyJLoAE5OXV2A2XuSlLFknj12V5+PmOJAsnfljwRSFb7LbZf5ncycOjr0fcW90mUXUe5G/njz0DTLpw=
X-Gm-Message-State: AOJu0YzDCA3h1Ig0fmPXmOfjDeVicv43irtr7WbTJHznTwpFCtKsNyFC
	wj9mpzosJ1QaWWaQueMRPB5ja3gVIQ/5eKvbmjinDbb08xYsadw8L7/GbWQeMoE=
X-Google-Smtp-Source: 
 AGHT+IEfM0+Ld6ncT+ouSLf7osIs906r0Y0FWWGPtojIiKffNhJRaOyCEHrvJZ4Lf1JkvL2wmGUvJg==
X-Received: by 2002:a2e:a7c2:0:b0:2ec:5172:dbc4 with SMTP id
 38308e7fff4ca-2ee5e393c8cmr73155651fa.12.1720008669249;
        Wed, 03 Jul 2024 05:11:09 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3675a10307bsm15716222f8f.94.2024.07.03.05.11.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jul 2024 05:11:08 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 00/11] ASoC: Simplify code with cleanup.h
Date: Wed, 03 Jul 2024 14:10:54 +0200
Message-Id: <20240703-asoc-cleanup-h-v1-0-71219dfd0aef@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAM8/hWYC/x3MQQqAIBBA0avIrBswC6WuEi3UxhwIC6UIorsnL
 d/i/wcKZaYCo3gg08WF91TRNgJ8tGkl5KUalFS9NLJDW3aPfiObzgMjUhi8C04bpzXU6MgU+P6
 H0/y+H1dRFIhgAAAA
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1657;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=38E+3ou+E/LV2E8yp/WlqkpQYFuVfruI6m/kZhWQIwI=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmhT/R5G66T/ENazdFQQUl8BkzHTGMOaqY5guUy
 WT86/WIaeKJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZoU/0QAKCRDBN2bmhouD
 11luEACJdPtrllcn7nyU28iQn6ZABmnMGhwYKmPRCiJO9rGZe1Ua2bJ9Sa9uSvdYwL857338dsO
 rqc9dp62eIt/FJGnsUV+Q6pH9fav3duzuOv0S3efQBGskRG+4oSi0pF49z3Zr2srf52bq3o1j7w
 IYikBTMiLyvTXAKLoNmHrDOIGm7imjTUIw3+EcQH9iceHRv8cfgRflt5hZKVBxflZzivq6iSKGK
 Dymd0tsWzbYV46WL81f4Fq0nwR9q6Vi3/REU5qMPMNVJrzCZKGySs2UDYuDJw8GKJVgsv3DREWr
 ypsEU3uGoz/q9K42KSVB3DkjuEsZklahVLCjFjPHB9ImFVYZI4zAXovpT1XRtoob1PLdxnMkhvG
 LsBVtekE5MBYQ3UmQif88KWseLAE926zvHfIv7N/TjsjS09DP3cI8yx27hMmPBEOGYy9VjPiEPL
 isWmkWdzm+9gLZIFMP33igefnO/smk6xmBoY/gOsce3fHvn7loIhbTrWhHRI5rAmBkv+Dt1JWcS
 zq1nm8ZBUUIOSscNrXjiAChP/gxojbrHNYaJTBAcmvQqHuyQPMLNeLLjIBeuwvDf6jUhMv0Kwkj
 Za3LssnmMDG/fvG6+ZmvW/3KAOQ9ixu/1WK28FYb/bvYjR9MaFFuI4zlvQ7dJmACvrSzBE8oai9
 9dUOtBj+/gs/E/w==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Message-ID-Hash: Z6BCFG2BCUAQBHGENR5EYIG3FK7TLRKZ
X-Message-ID-Hash: Z6BCFG2BCUAQBHGENR5EYIG3FK7TLRKZ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Z6BCFG2BCUAQBHGENR5EYIG3FK7TLRKZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Allocate the memory with scoped/cleanup.h to reduce error handling
(simpler error paths) and make the code a bit smaller.

Best regards,
Krzysztof

---
Krzysztof Kozlowski (11):
      ASoC: codecs: audio-iio-aux: Simplify audio_iio_aux_add_dapms() with cleanup.h
      ASoC: codecs: audio-iio-aux: Simplify audio_iio_aux_probe() with cleanup.h
      ASoC: codecs: wcd9335: Simplify with cleanup.h
      ASoC: codecs: wcd934x: Simplify with cleanup.h
      ASoC: simple-card-utils: Simplify with cleanup.h
      ASoC: audio-graph-card: Use cleanup.h instead of devm_kfree()
      ASoC: audio-graph-card2: Use cleanup.h instead of devm_kfree()
      ASoC: simple-card: Use cleanup.h instead of devm_kfree()
      ASoC: ops: Simplify with cleanup.h
      ASoC: dapm: Simplify dapm_cnew_widget() with cleanup.h
      ASoC: dapm: Simplify snd_soc_dai_link_event_pre_pmu() with cleanup.h

 sound/soc/codecs/audio-iio-aux.c      | 83 ++++++++++++-----------------------
 sound/soc/codecs/wcd9335.c            | 22 ++++------
 sound/soc/codecs/wcd934x.c            | 22 ++++------
 sound/soc/generic/audio-graph-card.c  |  5 +--
 sound/soc/generic/audio-graph-card2.c |  5 +--
 sound/soc/generic/simple-card-utils.c | 13 +++---
 sound/soc/generic/simple-card.c       |  5 +--
 sound/soc/soc-dapm.c                  | 47 ++++++++------------
 sound/soc/soc-ops.c                   | 26 +++++------
 9 files changed, 87 insertions(+), 141 deletions(-)
---
base-commit: cf601827c51b0496f6bb8a1865f1bf69ebd246b7
change-id: 20240703-asoc-cleanup-h-ef9cbfb67b66

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

