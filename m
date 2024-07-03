Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A789E9258A0
	for <lists+alsa-devel@lfdr.de>; Wed,  3 Jul 2024 12:31:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7F78B14F2;
	Wed,  3 Jul 2024 12:31:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7F78B14F2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1720002674;
	bh=rVRf9n1bFnXgcGWnl9warbbpA8WJWg1GWzSYHcOBEF0=;
	h=From:Subject:Date:To:Cc:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=J7S0+DjcCWB2NJkn4/ffhTUu3c323OUDyo+7x9/4vcXAzhbi4gyvLkKI39mch/fbn
	 fnOan/Cu1PEexi3aEwbsVju0Ok6dKq98cRpSBbcIFSlt3w01seve8WPHRkdTiZulUC
	 B2kz25uEN3HWqn1lW3wSB6rhotnSjM84s4mKgVi4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E3201F805AB; Wed,  3 Jul 2024 12:30:42 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BF90FF805AD;
	Wed,  3 Jul 2024 12:30:41 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EE01FF8058C; Wed,  3 Jul 2024 12:23:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=unavailable autolearn_force=no
	version=3.4.6
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 77A07F8013D
	for <alsa-devel@alsa-project.org>; Wed,  3 Jul 2024 12:18:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 77A07F8013D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=C48pg3q/
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-a72477a60fbso628500166b.2
        for <alsa-devel@alsa-project.org>;
 Wed, 03 Jul 2024 03:18:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720001771; x=1720606571;
 darn=alsa-project.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8n4l537zzmVevTwRxYF/dAXb8Lz3WH76s41W0uF6dT4=;
        b=C48pg3q/xKorMoChdqXyYf41FQQ+6undrla/rXIazMNgQzbrV/m/plon0dZ5qFaViw
         aAL3qU/rhOlGFc8o1JtpUEtK2EbmR7akTBWNGen8XyStcE1MBL4MhvCyamoB6p8nijJ9
         /PQyUdcGOjJYV/OXWyo2OA3fAGx9WYQJh88z0PAPugqVpQZKeftbF1tJQ9xaByfWFExG
         kXyN7FC0q0szWHo8oHUlNR2ZvEy4okVUj2dkWqIUeGxMnd2tdNk2YZT+2PGedhbKWTls
         qHrLBgXGdkge3zi++4aV/vWKp7fQ1fakNkLux7vpFWhAa7jp6fnJ1Iuq8mb7rglf2Di3
         kZ5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720001771; x=1720606571;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8n4l537zzmVevTwRxYF/dAXb8Lz3WH76s41W0uF6dT4=;
        b=DdbUZuM5CNqm4qfhVDdTdwIH6xNNY+WGcDj02SE6E+zpr55Nlfe9U0z5yCkpSzYDi9
         UAHZIjZjKc2x3nUhNJC9scJPy57fFwxvlo7xYtwqLmkQOi+6Uwra4zf/M6rc2BhRX0zl
         QoABryBnbpCZuGjjzolHC+CtJgZpgFgNbeFt1akaIqheXKmfndWglqF5El2Mz90/AKvB
         CCNdvjj0P4oxrbbmFFF3ARPMooLRiw64b8wefblbcGKTOwJqbJDslhsxHjc4zdYVOdyo
         SXYRxup/OdhpeW5gYSQTv42zBnPox1Og6VZ5hup/Nf1ZcMihu3DZDDsgDTul2b2l3lSN
         KIxQ==
X-Gm-Message-State: AOJu0YyZzVvb9J5wUzBYpv+ktWY5sBxdqyoo0qmYhtTNwVe3pFowhHqw
	0SmnERJ+E9PVLP5a4LgBXBKXivysBvzondwVCq0LVubzuNzCiq/sQzmDrz6RFGE=
X-Google-Smtp-Source: 
 AGHT+IHjh2iPIsDOndUbytlmALDqW/1/ZBtRvtQbnsaiAJOFDAAUYImBknXBOAZcTuBdDGgTPdlzUA==
X-Received: by 2002:a17:906:584f:b0:a72:7e5f:a0af with SMTP id
 a640c23a62f3a-a75144a8f07mr645953066b.55.1720001771282;
        Wed, 03 Jul 2024 03:16:11 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a72ab06565csm494291466b.103.2024.07.03.03.16.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jul 2024 03:16:10 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 0/9] soundwire: simplify code with cleanup.h
Date: Wed, 03 Jul 2024 12:15:52 +0200
Message-Id: <20240703-soundwire-cleanup-h-v1-0-24fa0dbb948f@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANgkhWYC/x3MTQqAIBBA4avErBswE6KuEi1MpxoIFaUfEO+et
 PwW72VIFJkSTE2GSDcn9q6iaxswh3Y7IdtqkEIqMYgek7+cfTgSmpO0uwIeqOU4qm5be2sV1DJ
 E2vj9r/NSygddFtd4ZQAAAA==
To: Vinod Koul <vkoul@kernel.org>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Sanyog Kale <sanyog.r.kale@intel.com>
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1253;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=rVRf9n1bFnXgcGWnl9warbbpA8WJWg1GWzSYHcOBEF0=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmhSTh4vNh28srE5LybUlslx4pM9JAnEQM5PQHj
 jj/t4OlYayJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZoUk4QAKCRDBN2bmhouD
 19DWEACDV3MRzK5iIKIoPiqXrVovBLjGHnXr+WtQcAuAHt+JTG+TlogroB4bLtm9lZCwjz3nkkM
 ZcSupxjD4d11w2qwV4vaUney+SzbwnwwTsfC5cfkEcy0IvWnAb5mg9jC73mBR/v0IkttK9Imwys
 rOMFwwOravADKKcfGX59/gUg3XZbTt4fHtr8TVXIqTGXdyauW5JQuIn3Son97SXrSa6vWt3q+Yf
 V0fclztDuT0+vcQQwuezNry+5mrZZZ2lMEOF7X4jtWeXVioAXVxlOUjyhvEiufxfa9kVLxyT36U
 aRi4kqYzpnIvGTCyDIehUJoUhTnEP53yBP8ouybuNyyrWrX14wbTEL9zYIkWjyz52EK/ancJIWi
 fz2ltZK8CFciAhskExjJfLBYXZhaU+12qNM6XRdVQylHHqLk3JFHMwWyv2RxXgJcFlr1pmeOz7k
 yIuNxIxsNhXTLKiJ7iroz9nlYkQiUpd6AREmxFshBYeqQc0tMfc80M1fuIMu00ukTKg+/4uJqAR
 IXzD4L/UaafnGKHzKE9RfouxSLqwPar02lITaC3kpLYQV8op22EFylp6qra8+h+aIHXsQmbiqTa
 dkAUAttjkf3hC8377GulhB/NPX71dfqYRQbg7dhVy7uIo2gQpn52CwOOJjntw1lBBM+2YyMqW+z
 tKhM1vgxwI+xjIw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Message-ID-Hash: WP3LJHCFY3TJHDPF5ZNAC4MJCP2U6ZX5
X-Message-ID-Hash: WP3LJHCFY3TJHDPF5ZNAC4MJCP2U6ZX5
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WP3LJHCFY3TJHDPF5ZNAC4MJCP2U6ZX5/>
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
Krzysztof Kozlowski (9):
      soundwire: amd: simplify return path in hw_params
      soundwire: amd: simplify with cleanup.h
      soundwire: amd_init: simplify with cleanup.h
      soundwire: intel: simplify return path in hw_params
      soundwire: intel: simplify with cleanup.h
      soundwire: intel_ace2x: simplify return path in hw_params
      soundwire: intel_ace2x: simplify with cleanup.h
      soundwire: cadence: simplify with cleanup.h
      soundwire: debugfs: simplify with cleanup.h

 drivers/soundwire/amd_init.c       |  7 +++----
 drivers/soundwire/amd_manager.c    | 13 +++++--------
 drivers/soundwire/cadence_master.c |  5 ++---
 drivers/soundwire/debugfs.c        |  7 ++-----
 drivers/soundwire/intel.c          | 25 +++++++++----------------
 drivers/soundwire/intel_ace2x.c    | 22 ++++++++--------------
 6 files changed, 29 insertions(+), 50 deletions(-)
---
base-commit: 246cf92bafedeea46cb16964d16478d6b68f8e5a
change-id: 20240703-soundwire-cleanup-h-a29941fb3dd4

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

