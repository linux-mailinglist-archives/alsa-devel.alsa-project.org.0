Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 46A8A90D4A4
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Jun 2024 16:23:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 602D4DF6;
	Tue, 18 Jun 2024 16:23:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 602D4DF6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718720629;
	bh=0rziP/IoVXP3TfzQU7TMnmqKwrX7EBGqSRuKglqc2j8=;
	h=From:Subject:Date:To:Cc:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=qCP5ofxOp3JSaUqY87dwRNiXX3GsD49Uo0qZ8dl2MCQwafVMWi9g7zFUpTZJPO5p4
	 exXaAYqW+/vULBHzIbjkn94nwFghMJ3/apK5gEfmneJzdNbuqvPKLQcMv7Qx8fOvMf
	 BwrJr3VcHCI9mdjczUJoBYaKxeSCoMtl8vNgqQlM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C3E0CF80619; Tue, 18 Jun 2024 16:22:24 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7EE8EF8061F;
	Tue, 18 Jun 2024 16:22:24 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B0E28F80266; Tue, 18 Jun 2024 16:20:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: ***
X-Spam-Status: No, score=3.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_SBL_CSS,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=no
	autolearn_force=no version=3.4.6
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 98E6EF80587
	for <alsa-devel@alsa-project.org>; Tue, 18 Jun 2024 16:15:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 98E6EF80587
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=JExa4W6M
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-421a1b834acso46444255e9.3
        for <alsa-devel@alsa-project.org>;
 Tue, 18 Jun 2024 07:15:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718719964; x=1719324764;
 darn=alsa-project.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BuVWP4GVK7L2zp39JVZyz0tyrIh2tPWyuf/GeYuNsvk=;
        b=JExa4W6M45u6q2bBVtHpvDpGrMxKdApHG+anC2Ma1PpO4Zc8MGligtLFVTA05DFDw5
         mqqAVGHmDZDoxIyXGGxZCpRuXwyWyGfYlvWImF23Ot8KzgUARzdlmTdpEBSbWj3jZBgM
         pOLtjEbtEYSLlo1KROAKMRQbQgxV7Hugn14sSCwE0L+MMkP8Lw8UNlJXdvDMH4bEJ621
         AlS+FUhgjK71Zv3NyUy3sfzetuXAWcT++w6KW/GYa4xyN+ioIaDSfBq0y4N5xeeG5Bvt
         dr9reb0RcWpcu6BFJiVVUOo+QM+l7/uPIAEbthEMNEBnuS0BKzPPRmJQVfKnG6vz6z6K
         9L8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718719964; x=1719324764;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BuVWP4GVK7L2zp39JVZyz0tyrIh2tPWyuf/GeYuNsvk=;
        b=JfGiqurHawSP4GHGae8Pu9C88/ZaDFZSx2K0y/e/Iu2lRxl/MP1iZea8dZ8YOHK0yC
         9bB7R0C+Fb3+ZwxPMDNu0t3w8kG6mhdveAl5kdhvijifsshwehkcz35lBeuS4c9YEb/c
         ekZpBvIkyQTiKntC8aYQPW4u6rI7h+Jym4/G0D34+UmBGjUw4a2HfUxAHdi0+eF20y6j
         0zAnl43pwvt/fUkkLlimSg+xX4/pnllh4XgWJnBtZv6X5XuI9cr+DrLYToSLpuhgA0rr
         zymrY4gF3Wu8WxBsm/bxo/l2r+Xf5U6eHXmhqTdNvAHdBq3pb9oqffNtJvMEHJZQHeAc
         iJ8g==
X-Gm-Message-State: AOJu0YzZl0VUHOVYjgNueHieiHBgfGj47DsEbDSe7pCrPxxPm421KF7i
	r/mbtu1Ef/ox1b+DtjQAbJd1aVPELBzOYEr/i/EgUCHLWhEdtiR4l9OEQEH3YHAU5H0/3tYPSo8
	uQG4=
X-Google-Smtp-Source: 
 AGHT+IHtLz8KllMMtdCRU487RnyWpaHO2FxTL+sG63GWh7A5oH2EYJFnivoVxsZYulKG+Tu4+suuqA==
X-Received: by 2002:a50:9518:0:b0:57d:32d:cacd with SMTP id
 4fb4d7f45d1cf-57d032dcc18mr773381a12.29.1718718557369;
        Tue, 18 Jun 2024 06:49:17 -0700 (PDT)
Received: from [192.168.1.195] ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-57cbdfe1428sm6678397a12.27.2024.06.18.06.49.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jun 2024 06:49:16 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH 0/2] ASoC: codecs: lpass-wsa: fix vi capture setup
Date: Tue, 18 Jun 2024 14:48:59 +0100
Message-Id: <20240618-lpass-wsa-vi-v1-0-416a6f162c81@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEuQcWYC/x2N0QqDMAwAf0XyvIBtt274K8OHVOMMbFUS0YH47
 6t7PI7jdjBWYYOm2kF5FZMpF3CXCrqR8otR+sLga3+to3vgeyYz3IxwFUwxhPtt8K6PAUqSyBi
 TUu7GM/qQLaynmJUH+f4/z/Y4fr9rHRN3AAAA
To: Banajit Goswami <bgoswami@quicinc.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Manikantan R <quic_manrav@quicinc.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=617;
 i=srinivas.kandagatla@linaro.org; h=from:subject:message-id;
 bh=0rziP/IoVXP3TfzQU7TMnmqKwrX7EBGqSRuKglqc2j8=;
 b=owEBbQGS/pANAwAKAXqh/VnHNFU3AcsmYgBmcZBchruVRYLTqV2qgDLV2m1brX+2D6w8mliGx
 nMEC4qHyT6JATMEAAEKAB0WIQQi509axvzi9vce3Y16of1ZxzRVNwUCZnGQXAAKCRB6of1ZxzRV
 NzZmB/0b1yOCj8uIGXSEGCFq9LTGF1SrtMQlN/XPPJMs3FCcUZsCVEaN73ZWsKI6sfct1WEIoOv
 HUkjDjBNHrYya09svQYDlJb31l6BOeRAvRd8a1sVqljMaULMQqYWvJopLkB9tS+EUbUErQ0ombC
 XjeM7CZoFGWK88W6r0RdK9M0iA5oSe8nhkABDjfsB4TFr+39znDjipnR7D/wJJmGbrGygNXzWgM
 24IoWC83QY3fhTzOaiNWL2wM4/HMQdtSR8EXKTQwqC5CTYNPPD9wjksR5hn9g3bgJI1Xj+mOsQm
 q0i8dbpSEfEdBDjRAgUthelIv93ynf5RvPmOwHuWEk8x3wo3
X-Developer-Key: i=srinivas.kandagatla@linaro.org; a=openpgp;
 fpr=ED6472765AB36EC43B3EF97AD77E3FC0562560D6
Message-ID-Hash: VA4KBA4XK3QXWH4UR2AAG7QLCBZJG2KX
X-Message-ID-Hash: VA4KBA4XK3QXWH4UR2AAG7QLCBZJG2KX
X-MailFrom: srinivas.kandagatla@linaro.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VA4KBA4XK3QXWH4UR2AAG7QLCBZJG2KX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This two patches fixes issues with VI capture rate and path setup.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
Srinivas Kandagatla (2):
      ASoC: codecs:lpass-wsa-macro: Fix vi feedback rate
      ASoC: codecs:lpass-wsa-macro: Fix logic of enabling vi channels

 sound/soc/codecs/lpass-wsa-macro.c | 111 +++++++++++++++++++++++++++++--------
 1 file changed, 88 insertions(+), 23 deletions(-)
---
base-commit: 1613e604df0cd359cf2a7fbd9be7a0bcfacfabd0
change-id: 20240618-lpass-wsa-vi-b63375f21d63

Best regards,
-- 
Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

