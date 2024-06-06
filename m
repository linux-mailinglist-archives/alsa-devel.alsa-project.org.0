Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 317E78FE816
	for <lists+alsa-devel@lfdr.de>; Thu,  6 Jun 2024 15:43:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 51789DEE;
	Thu,  6 Jun 2024 15:43:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 51789DEE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1717681420;
	bh=igd2ZMr0xCbNbEsiWofsuTjgVc3ffaGh82okIEZzyM0=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=ZGOj7EmQU0xmvGju6pVodwccL1nyitZ7Pz64tBte63LDALJtSdq9/T19hPQN2mq5y
	 WdX22W7SrE9meW4ykpAN4UgT9cxMN61xpfJi+knshNc7SGTH0evIGE9TcNOrdxF+j1
	 5szPEbRgLjZR7XjfJXd5+dZzKQKpfRer4Nm0MXI0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A6ADFF804FF; Thu,  6 Jun 2024 15:43:11 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8265CF805A9;
	Thu,  6 Jun 2024 15:43:08 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 70F79F804E5; Thu,  6 Jun 2024 15:43:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_SBL_CSS,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0178DF80088
	for <alsa-devel@alsa-project.org>; Thu,  6 Jun 2024 15:42:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0178DF80088
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=wCtcdGtu
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-35e4d6f7c5cso1007658f8f.2
        for <alsa-devel@alsa-project.org>;
 Thu, 06 Jun 2024 06:42:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717681374; x=1718286174;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FiI3m8vqYXd8PfuguZOQIaxz1AuCQiEaVMJX02AGxvE=;
        b=wCtcdGtu5A4XUv7Bl4k3vihPuqxoKAxfANChnT2KPsaMTvPn25F7fvO+4xT7s8uZOP
         jP4sQ78pf9yssA3y6yoCsiERvNS2lTnnVapD3ld+T88EGzzGYkB4WbqkDllkwMmBIGpQ
         /37VztqNUweIFoKIP7OXtyLU5J1uadkK77mP+GbOKNm1Po16zsGCrYSV1r0Mq2yq0B5J
         DwfZnMAR7WO54ZZPiw1U72ttu7gR/bLX/vOeHWaiA3swa9gdKeBG80m+LpTZJXyPpXDM
         19bHW5rRNUoqe+a94caMXhWegJ3+6zAG1U9tXAbCINVhGBeanlSNi9s2P9c3VzibwMRL
         yQJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717681374; x=1718286174;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FiI3m8vqYXd8PfuguZOQIaxz1AuCQiEaVMJX02AGxvE=;
        b=IC9UQkARROBL8a9HrSz+M6lPzEENI8epOemBfkViNwj0kVCHWqNI7118woc/7RV87g
         lp337keIr17nUopO49GatqiOjXzbIsrAqSNZR1zoIe/CdvFFR+oDPdkv0kYoz4BemYd5
         znQbgYU0TKBN+5UcjnCoZwx4Q5NLtKG37hcbRq1uHeCSvzhVo5hSugW+D8dMn/1Lo0Qk
         il5z0zcJNarns2k24w4mlVEBtBNWx4Ak9gkrYoTVtZXQrVtYUVPcfOhe536+mft/84nC
         s5N/2e5yohnvN9AQrm6nqvNQiukm/h1JVco9+v/rSvpHgkY9LwY7q2MG7StHgz5T0jSg
         lcSQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWxlqQdAWhpvbU38f/Z0Qccn08qtBR5NWWD+wRFgHHGk999VBT4gSMHMfyOLGNhQHbd/XlJYNBrh1AzUF9/LCiZJgc0bQ30tClo4YE=
X-Gm-Message-State: AOJu0YyfuYX3WnQCxUIAxpl+bRFGTpUbKOXwKE/eNsE87WTKWWT8OiSB
	AOaQkKfBeIhJyTd38U//AZ3aX4fvnBDV+qcp+rTDhyByyA6tFIqBcxQ4pV0zOPISVPvXrSyYf6H
	J
X-Google-Smtp-Source: 
 AGHT+IFnjkCpfDikXTbxZhi9pEfUqoheqQ3gc9c6YsNTpVYqcAirKQssG5EKsEz7UrcEhq9RGKfeOQ==
X-Received: by 2002:a05:600c:4c27:b0:421:29f2:8e4d with SMTP id
 5b1f17b1804b1-421562cf261mr41990315e9.14.1717676778212;
        Thu, 06 Jun 2024 05:26:18 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4216412972fsm275325e9.47.2024.06.06.05.26.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jun 2024 05:26:17 -0700 (PDT)
From: srinivas.kandagatla@linaro.org
To: broonie@kernel.org
Cc: perex@perex.cz,
	lgirdwood@gmail.com,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	krzk+dt@kernel.org,
	neil.armstrong@linaro.org,
	krzysztof.kozlowski@linaro.org,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH v2 0/2] ASoC: codecs: lpass: add support for v2.5 rx macro
Date: Thu,  6 Jun 2024 13:25:57 +0100
Message-Id: <20240606122559.116698-1-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1039;
 i=srinivas.kandagatla@linaro.org; h=from:subject;
 bh=K1mJNZxOIlhm1uxG3APaaUP4eSPSxJUaQjy9GT5ncJw=;
 b=owEBbQGS/pANAwAKAXqh/VnHNFU3AcsmYgBmYarX3/ZCfd3+897zKJBq147tlwsUVTmwyuPdF
 LcFsxioHEWJATMEAAEKAB0WIQQi509axvzi9vce3Y16of1ZxzRVNwUCZmGq1wAKCRB6of1ZxzRV
 Ny/TB/4v2jd5jJxptFB5xKmvnQoU8xf6CUtH8dTh82WLx7FLpAyrkguvQt3F0F+9Lnk3WU+iepf
 /Q7mJI0PJWgT8Zwc1tazHbXa57U/4tCbGeVNPaCQBIMmHxDCbXena98So/8/XujOaToMWWY+vKX
 HcY1Q9J6yOdoPGsLbWYO7Xn1N/RRrrnLLT9sTA4nlPYcZc38Zcm2UxQR59CnCFJigmh69NGuIdC
 5ZJ3j3wSGrZUykiBgwrmdLcqPh0XuoS2KNvJU/8ULL6k89eYEwu9gozjJeADyCFyHjZheDihm0J
 oJqBImXFL7Yu1z2yR8oTYWr+oX6z8E8+zTFtpZ119oaQLe1I
X-Developer-Key: i=srinivas.kandagatla@linaro.org; a=openpgp;
 fpr=ED6472765AB36EC43B3EF97AD77E3FC0562560D6
Content-Transfer-Encoding: 8bit
Message-ID-Hash: PS4QPHS2G3I7YFATCLDY5J3GUWXT6HEP
X-Message-ID-Hash: PS4QPHS2G3I7YFATCLDY5J3GUWXT6HEP
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PS4QPHS2G3I7YFATCLDY5J3GUWXT6HEP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

This patchset adds support to reading codec version and also adds
support for v2.5 codec version in rx macro. 

LPASS 2.5 and up versions have changes in some of the rx blocks which
are required to get headset functional correctly.

Tested this on SM8450, X13s and x1e80100 crd.

This changes also fixes issue with sm8450, sm8550, sm8660 and x1e80100.

@Neil Armstrong  can you pl test it on sm8650

@Krzysztof Kozlowski can you pl test it on sm8550

Thanks,
Srini

Changes since v1:
 - renamed all 2_6 variables with 2.5
 - expanded checks for versions from 2.5 till 2.8

Srinivas Kandagatla (2):
  ASoC: codecs: lpass-macro: add helpers to get codec version
  ASoC: codec: lpass-rx-macro: add suppor for 2.5 codec version

 sound/soc/codecs/lpass-macro-common.c |  14 +
 sound/soc/codecs/lpass-macro-common.h |  35 ++
 sound/soc/codecs/lpass-rx-macro.c     | 565 +++++++++++++++++++-------
 sound/soc/codecs/lpass-va-macro.c     |  29 ++
 4 files changed, 488 insertions(+), 155 deletions(-)

-- 
2.21.0

