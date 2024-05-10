Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F3F5D8C29A1
	for <lists+alsa-devel@lfdr.de>; Fri, 10 May 2024 19:59:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6C00FE97;
	Fri, 10 May 2024 19:59:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6C00FE97
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1715363958;
	bh=XEetVV5LzjZUd07Qjndu3ZsIUuE/RU2UUw/4u9G5G2Y=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=dq5Uab1fM7g4KFdqK3NwKjg86c00RekBLIkFoDEruc3WDLFIGGLlNtOD0k3yhRkOs
	 nyOubFxWxDrEcCmR1XlC80Rs5DbMxlyKIxPyh800UrVQaMVr/EjgVKvWJ/x1alFo9L
	 C8sVopzFCnnbgB3Zuv0nZsXRlfPNWrgpRR30paYY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 54B87F8059F; Fri, 10 May 2024 19:58:47 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CA6BEF80563;
	Fri, 10 May 2024 19:58:46 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2483BF8049C; Fri, 10 May 2024 19:58:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: ***
X-Spam-Status: No, score=3.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_SBL_CSS,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=no autolearn_force=no
	version=3.4.6
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D864CF800E2
	for <alsa-devel@alsa-project.org>; Fri, 10 May 2024 19:58:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D864CF800E2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=v5coixus
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-41bab13ca81so22955495e9.1
        for <alsa-devel@alsa-project.org>;
 Fri, 10 May 2024 10:58:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715363918; x=1715968718;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BXCAYOzW1kXWnEuZ/9Q/Y2a8adBdw5ihjWlLUmIWrWE=;
        b=v5coixuszoOqRSBUl8R8PG0SEcU25gP9EDsr01kdEuzU9RHgDKZJoDXGd7pYWGLmsq
         OA5lPACZZXPLH2N4sVAkR1tTqRMXbzKdG0eawKQU6pHs22uZN91YPc8fL2t71SJm4ASh
         eQttCx4N9OyzZeOpBFt9GYkBPUdgFetFPFjE+Gpv4kwArud3CNa7KOw/EO7SbwpIuouM
         /meEK092HwhW1XP/I0hV0zrd15izpzH7UyRiM12LVh1fvkBcXhKXNENB8zA7QUjrXQtQ
         DJvFp5JTcz0C3xj5wZp7zUC7y6mBIkfY/n74I1zwVLX+AF4n378+yu8ydBIXlG0iucou
         Lvbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715363918; x=1715968718;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BXCAYOzW1kXWnEuZ/9Q/Y2a8adBdw5ihjWlLUmIWrWE=;
        b=drZtOCbqfbiut+/CXYa8qFHXe5L1APd4BvgUww1XOSruQfFJHrGRV2gxL3QhVzT0UU
         ucGHcW9uXYHLDNsS9hK+QJNXk3GKFcRVaJUUcAURcX3/vGAMZfPCHauipmJMWJaU2lbx
         nAuOuxw2ZaipS2Otd+7Xv7lkiToBMUqb6VkzPjTDhuL33TnIlBPPMKmNTjdYppLu3vsd
         UtlGidJKznkOMaUGSTfo0vx4Q71AU2K2vYY4ePUCh9x1egNnSaDLYXPsHuPlIhzASWYB
         r94gRKj+oR82bAVkvO6KxAJtGMtMU2Il74NWGMYKhOzXwbYnFkfX+2yvqK/oAKRIVkrj
         fjFA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUcBU0tezpz21Gld9Wc56pBKsfb8DWdP6yTj/A6pMS2zqdRpuNVqJucKvcp1DHCdJLLKv/x4HWg3MpiUB+rCV4e737+vEgTcdypG6E=
X-Gm-Message-State: AOJu0Ywpo9nXRnGLhAeYrkPfLzzvGKIgwqI6C3Q9e+2dlmRuHuqUgzFE
	9JZ7TemX9a51GKOonkbQxUKfvAf+Ndyv1K2VrQVgxS1lPCYG2xSwKh0Yeq6AYIY=
X-Google-Smtp-Source: 
 AGHT+IFpNhfIiTH8BJNxZ6X9G34svc9ayq/CjtMPzgYhTlVv2lj1PM6vQcUjlEJ2Boam2c+yC2C1qw==
X-Received: by 2002:a05:600c:2042:b0:41c:8754:8793 with SMTP id
 5b1f17b1804b1-41fead790ecmr27551705e9.41.1715363917705;
        Fri, 10 May 2024 10:58:37 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4200a8e6846sm11046755e9.15.2024.05.10.10.58.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 May 2024 10:58:37 -0700 (PDT)
From: srinivas.kandagatla@linaro.org
To: broonie@kernel.org
Cc: perex@perex.cz,
	tiwai@suse.com,
	alsa-devel@alsa-project.org,
	lgirdwood@gmail.com,
	linux-kernel@vger.kernel.org,
	krzysztof.kozlowski@linaro.org,
	neil.armstrong@linaro.org,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH 0/2] ASoC: codecs: lpass: add support for v2.6 rx macro
Date: Fri, 10 May 2024 18:58:33 +0100
Message-Id: <20240510175835.286775-1-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: JMATANXW536YKFMOSGL7Y77OSNI7ZK4L
X-Message-ID-Hash: JMATANXW536YKFMOSGL7Y77OSNI7ZK4L
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JMATANXW536YKFMOSGL7Y77OSNI7ZK4L/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

This patchset adds support to reading codec version and also adds
support for v2.6 codec version in rx macro. 

LPASS 2.6 has changes in some of the rx block which are required to get
headset functional correctly.

Tested this on X13s and x1e80100 crd.

Thanks,
Srini

Srinivas Kandagatla (2):
  ASoC: codecs: lpass-macro: add helpers to get codec version
  ASoC: codec: lpass-rx-macro: add suppor for 2.6 codec version

 sound/soc/codecs/lpass-macro-common.c |  14 +
 sound/soc/codecs/lpass-macro-common.h |  35 ++
 sound/soc/codecs/lpass-rx-macro.c     | 565 +++++++++++++++++++-------
 sound/soc/codecs/lpass-va-macro.c     |  29 ++
 4 files changed, 488 insertions(+), 155 deletions(-)

-- 
2.25.1

