Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (unknown [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 54867946920
	for <lists+alsa-devel@lfdr.de>; Sat,  3 Aug 2024 12:48:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6D7794768;
	Sat,  3 Aug 2024 12:47:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6D7794768
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722682063;
	bh=/keCe+RYTAEof6iY2K+Bnv28/+hoBwjA1/9NQ0Hke4I=;
	h=From:Subject:Date:To:Cc:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=LUUJE6wHzLACE5mrVJBN25kIpMBFzHKca6HB4BpfJIQbIME742whAkN2PeGdy+bXa
	 81IfmiGXrIcLmNVFPlR7rcHoq3kKrf2g3KGjWzLQiyIkf+Dr04QFYeQK5mhifiPS5M
	 DRngriK1mipATzSKlcSlBk2j5U4zJFP3uMCkDY2c=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4BCA3F8058C; Sat,  3 Aug 2024 12:47:11 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CB609F805AE;
	Sat,  3 Aug 2024 12:47:10 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 69521F802DB; Sat,  3 Aug 2024 12:41:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7DAC5F8019B
	for <alsa-devel@alsa-project.org>; Sat,  3 Aug 2024 12:41:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7DAC5F8019B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=JdFJGS4T
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-52f04b3cb33so19468180e87.0
        for <alsa-devel@alsa-project.org>;
 Sat, 03 Aug 2024 03:41:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722681705; x=1723286505;
 darn=alsa-project.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=X6XfE0wuy/HIDAoO9pP4NYutSvJQFGt1Hra+lGxkJO4=;
        b=JdFJGS4T6x08NIxbZwZ9BE7npvNv8rlm5i7S4Z2UujpMGYKL4G1WezteMwmLK1N5fj
         nApA++Iku/6w7GQZnQVmtM+s/uVCItCnNyVdgXzZaHj1D1ULZClmzX51R5CXFDgyu9Gi
         d71uzCAbq+T3QVbPANm4GqRerqTuvd+qKhWnoHwUcq/hZO+ds/xiqNmnqRNSs9wDr9DD
         5QNHyVha01u38vlV4VSacKNAPEiNJkrvNDnbPOm4zRKVFz0On6QkDWVt8xbHowkMbKp0
         OJNqaG/f9zG4FGK1IvdSUx03W0MHLKWfJkOtd2MJFAdpZMHrD0Cm1kiS4EDqNR9twqyb
         vJxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722681705; x=1723286505;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X6XfE0wuy/HIDAoO9pP4NYutSvJQFGt1Hra+lGxkJO4=;
        b=mffsKrICpSA8Wbu7PKUOnqbTFQQVFFmoE2PACkSD+VQJXdutUg20LgUVgWRmtkmubp
         3Najphry3m7GLmUHR4VqUGfqzsMZSz9TuONfCv2JeGyB2zHmN1ieLaO23p3tfogqb3O1
         bTVXmMzqKXvvvsc3HXPfEz3OVcKF+bcuKhfByBv4JhGBPUJwDy6AExJFIbM0d2oIK2j0
         2GlEAR+uZ2GXPc081bmej6/akPxBIxTZ3Er5wzPbt4l+egfsE/pZHtD5zT7RO4GkNv1R
         I57rIAg6cvMWenJ1cNFqZ/55HjO814WabTeOOS6gemhKzCUKY5DII4sKs0ZCVbSqilpo
         +fJw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXu1CCUEh/TJa+eGu4jurjWHpBpbdLt15z4MqgLIMRhrpa085TQBMFYW9iazstHcu5CRiMbY4h9P5dTwD8AXv2s+47xKSNZAQgcePk=
X-Gm-Message-State: AOJu0Yx/YrHX5N6sT3OESbMr5qPmPU+sS/60JiteO7lAHzLbXyJ54p8A
	8fYy5LHIvzhBs4xEjj042VX7/5h+leZoBI+HuJrQmJfXfpn18QMFb7GBWvTHYmE=
X-Google-Smtp-Source: 
 AGHT+IF800af46goSmkquETHEPslclS/M3eT6WGABoZvnDas++CS/5VA5nNGupa/GwDs2mHuxpiZKg==
X-Received: by 2002:a05:6512:1094:b0:52c:df55:e110 with SMTP id
 2adb3069b0e04-530bb373806mr5208762e87.12.1722681704438;
        Sat, 03 Aug 2024 03:41:44 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7dc9e7feecsm202086366b.176.2024.08.03.03.41.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Aug 2024 03:41:43 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH 0/2] ASoC: codecs: warn on unknown codec version
Date: Sat, 03 Aug 2024 13:41:39 +0300
Message-Id: <20240803-codec-version-v1-0-bc29baa5e417@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGQJrmYC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDCwNj3eT8lNRk3bLUIpBK3ZQkszQz08QkU8PkVCWgnoKi1LTMCrB50bG
 1tQASd7tkXwAAAA==
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=967;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=/keCe+RYTAEof6iY2K+Bnv28/+hoBwjA1/9NQ0Hke4I=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmrglmKnfdtOGxXRACB8UtRgTdRs5sMF7sJRo7w
 3EY4ygT+smJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZq4JZgAKCRCLPIo+Aiko
 1WG/CACayIklwe1wlfXJJ61EnWlvC8/+TtjBvjCNMmW6IlKA8j+pUQYqOb+lXwgofI8nDEAN7mG
 nC4IqS1m583hIVeTvOVh+A714w9AgQ1lRSBHIn//0Wo4RXGYOfuPZUuQg+BknlbWx6iE+X14gwN
 mLSDiebkQtEx5ePwbUl41NGCM3i8XHCssI8Kl9ptHceBty9qD6lwk5XdyTbQn7RbzbeWXk8vVc/
 25iTZbVmDW4iIEG37IzqszToAl+A8YkD4xEN5x/F8Yr1wA5+uZyiY8aO9zAPrdlLKtaiDLf1ME2
 xpy3DXb2xx2u+DNMojPMNf68mgvEShp/c4KgWQNeRq1KjCZC
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
Message-ID-Hash: ONRWW4VV4S5O5USDXAF5C5TXFVSYCRK5
X-Message-ID-Hash: ONRWW4VV4S5O5USDXAF5C5TXFVSYCRK5
X-MailFrom: dmitry.baryshkov@linaro.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ONRWW4VV4S5O5USDXAF5C5TXFVSYCRK5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

While debugging broken audio issues on some of Qualcomm platforms I
stumbled upon the kernel not providing the actual error information.
It prints an error from the wsa_macro driver, but the actual issue is in
the VA macro driver. Add error message to point to the actual error
location.

va_macro 3370000.codec: Unknown VA Codec version, ID: 00 / 0f / 00
wsa_macro 3240000.codec: Unsupported Codec version (0)

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Dmitry Baryshkov (2):
      ASoC: codecs: lpass-macro: fix version strings returned for 1.x codecs
      ASoC: codecs: lpass-va-macro: warn on unknown version

 sound/soc/codecs/lpass-macro-common.h | 6 ++++++
 sound/soc/codecs/lpass-va-macro.c     | 4 ++++
 2 files changed, 10 insertions(+)
---
base-commit: 668d33c9ff922c4590c58754ab064aaf53c387dd
change-id: 20240803-codec-version-db6f65ab51ce

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

