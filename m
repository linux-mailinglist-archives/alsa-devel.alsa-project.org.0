Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6613A7B9B84
	for <lists+alsa-devel@lfdr.de>; Thu,  5 Oct 2023 09:50:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 50E8EDE5;
	Thu,  5 Oct 2023 09:49:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 50E8EDE5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696492220;
	bh=iIPkvRkIJYc26KZbBaGmsE6BIp5eUVJNQvEs3T/iqUY=;
	h=From:Subject:Date:To:Cc:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=YhTvfDAx+lNK1VX1er28JwrnoOHwMLLQgJmQ8eIZC4IZlVpVD8aDEERrpu2FeLLEp
	 lAacrNkXtJSC3VOtpapJhYlFl7YSfR5EJQCKJ056J/QqdScMHeZqxTw3AQbhM/Gl4X
	 vX0HZOTaieBW7vLa+Rme0KzOg5N4VmYWB/sKJo3U=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9DC93F805EB; Thu,  5 Oct 2023 09:47:12 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B741DF805E5;
	Thu,  5 Oct 2023 09:47:11 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D85DDF80553; Mon,  2 Oct 2023 16:00:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B2907F800C1
	for <alsa-devel@alsa-project.org>; Mon,  2 Oct 2023 16:00:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B2907F800C1
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=fairphone.com header.i=@fairphone.com
 header.a=rsa-sha256 header.s=fair header.b=opE7xlAe
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-50444e756deso21619640e87.0
        for <alsa-devel@alsa-project.org>;
 Mon, 02 Oct 2023 07:00:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1696255214; x=1696860014;
 darn=alsa-project.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zpZhytU+mtyOMS/VgBxlj3+c2Lys7k0tYKY4H/RoMIc=;
        b=opE7xlAeHEPDWN2vC/Z2ASnhOSdpva6G7q+4c0slk18+CPhlSaOKneRLeBrPe5z9Am
         OIOwbV57m+PBo92FRyzfS2zo9jr294lU7Fy3q1I5viCQkeKLI+0sU2HRkaQz6zpvp+k6
         xcQonCg9aiBUS576toqHw44T1wHPT+AFClcuODHwsD1Hn5lHrsejDLToIyroAzqUanM2
         YbqQRUze5Eiq5kHxEiNZO55Rl59FMjsN+uWMkff6SX/TF9euwtNKmNrXJQaHadLhv7tx
         wK3LWHpXTs4ilixtMtv3MaFPnZLcAg60XWfyztxRMMaEKQEh1wlaEWZBSsrfUZizOY27
         mGxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696255214; x=1696860014;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zpZhytU+mtyOMS/VgBxlj3+c2Lys7k0tYKY4H/RoMIc=;
        b=Mgn0z5piDDoonmehy79Wr6yDxFL5tTT7gIYUzvqA5+ZPZIhxCi949CcQZSvWB7ZkXS
         0CoCzRR4JRXN5472qAnHBlhvLQICqvbjGyQTFm093MKn5O9G9ACkgRJhB8a/khRlT+l9
         oMYbwOls7aRGWFP6MAtnNaLYhZQcHb1bTUPoIz23K2dxKs86qD9lnVnPiAHuls/kBW2V
         mJyJHXbQwRyO9kOG+YtmHJm2bnm8Zv8V83VeMsoNO3nP3jaFJ1cCCq45RuKC7GgxIVGI
         jxXnpn2kTZidEqrWCSTXlVw5Awn+eMgXZF6VJXAtXE1g8Ad00dXzj01nzMz2lIjk/U9l
         Jbjg==
X-Gm-Message-State: AOJu0YxzS8oMDCfQJAUCpMxYYzJ10klco/y3sb/0gqO9Ih3ICYHvykIQ
	BvtibpxOJxcIDoyHczdERb/1uQ==
X-Google-Smtp-Source: 
 AGHT+IGso9r5zHTjq+JheuE+Q/cqqFcdJ//IYpcalgTIQ1LdA5XgDbH9CA6sx9n8hYQEZLx5OnqiXA==
X-Received: by 2002:a05:6512:ba7:b0:4fe:db6:cb41 with SMTP id
 b39-20020a0565120ba700b004fe0db6cb41mr12425999lfv.39.1696255213950;
        Mon, 02 Oct 2023 07:00:13 -0700 (PDT)
Received: from otso.luca.vpn.lucaweiss.eu
 (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id
 q13-20020a056402518d00b005346925a474sm9350377edd.43.2023.10.02.07.00.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Oct 2023 07:00:13 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Subject: [PATCH v2 0/2] Remove reset GPIO for AW88261
Date: Mon, 02 Oct 2023 16:00:10 +0200
Message-Id: <20231002-aw88261-reset-v2-0-837cb1e7b95c@fairphone.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOrMGmUC/3XMQQ6CMBCF4auQWTumHUQpK+9hWNQyyCykpCVVQ
 3p3K3uX/0vet0HkIByhqzYInCSKn0vQoQI32fnBKENpIEW1MmTQvtqWzhoDR17xwkoNhqkxDUH
 5LIFHee/erS89SVx9+Ox80r/1n5Q0ahzd3bE2J9tSfR2thGXyMx+df0Kfc/4C3Prpf64AAAA=
To: Weidong Wang <wangweidong.a@awinic.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.12.3
X-MailFrom: luca.weiss@fairphone.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: BPXF2HETFGTPITXWBCJ4R22IZGZPCWHU
X-Message-ID-Hash: BPXF2HETFGTPITXWBCJ4R22IZGZPCWHU
X-Mailman-Approved-At: Thu, 05 Oct 2023 07:46:49 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BPXF2HETFGTPITXWBCJ4R22IZGZPCWHU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The AW88261 chip doesn't have a reset gpio, so remove it from the
bindings and from the driver.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
Changes in v2:
- Include dt-bindings change
- Link to v1: https://lore.kernel.org/r/20230929-aw88261-reset-v1-1-fcbce194a823@fairphone.com

---
Luca Weiss (2):
      ASoC: dt-bindings: awinic,aw88395: Remove reset-gpios from AW88261
      ASoC: codecs: aw88261: Remove non-existing reset gpio

 .../devicetree/bindings/sound/awinic,aw88395.yaml        | 16 ++++++++++++----
 sound/soc/codecs/aw88261.c                               | 15 ---------------
 2 files changed, 12 insertions(+), 19 deletions(-)
---
base-commit: df964ce9ef9fea10cf131bf6bad8658fde7956f6
change-id: 20230929-aw88261-reset-7e00d9e25952

Best regards,
-- 
Luca Weiss <luca.weiss@fairphone.com>

