Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D60D17227E2
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Jun 2023 15:53:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C8A756C0;
	Mon,  5 Jun 2023 15:52:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C8A756C0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685973213;
	bh=gRsU/q1A3MaJhGNG7ZrfpA8gsrLwCMAkTNR5+WZY19I=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=rKUFeHYbagr8DJBTUAyURIh0BpJKCl0a66LA1NoBojxdv5kzoJXV8e+If/mcwCww/
	 fLRGoAGUNYfaCAeELLsrUebsfB7DAVU6f+jy4pFqIyIZ8UZWbZ9IPT5qVkQY8sTyhR
	 7HpI44lV+Ux8ybIT6hYYOb2+cBwmQ61nqxnmanoY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 301ABF80290; Mon,  5 Jun 2023 15:52:43 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DC3E9F80155;
	Mon,  5 Jun 2023 15:52:42 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D9C9AF8016B; Fri,  2 Jun 2023 11:03:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 18568F800ED
	for <alsa-devel@alsa-project.org>; Fri,  2 Jun 2023 11:03:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 18568F800ED
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=pqrs.dk header.i=@pqrs.dk header.a=rsa-sha256
 header.s=google header.b=KC3pRTXt
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-9707313e32eso276131466b.2
        for <alsa-devel@alsa-project.org>;
 Fri, 02 Jun 2023 02:03:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pqrs.dk; s=google; t=1685696623; x=1688288623;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4z0aWs+76DsOLK1ZdUfTJiO33aieMzJYwE+Vw+aqL5o=;
        b=KC3pRTXttgRIUpt/J5diupn1SqWtaBkgdDbiDRQ9CHSU5XfIvtNfmd13SWzWayo0BX
         HUdX9gDctfwufnP09F5pk6O9FrRX9CPNX0VquDeoRD3xBs+lbLQULNZy2P5SHbu5QOp+
         vVWx2jGeYcbasf0SzGdw2+wev5PColDikoe8BxdKye8N6UOHmNUWu7zWwkWKnIls/aWz
         uOrgsS3LVLZ9/5YpqWY1MowwGZxt0EEyS3xhHdy3nQFyEAXAyfxIn4DNEmt8hJ80Qqmv
         Ih3npZIPQS+r5V3KrJ7tu7rOGu3425u8cI7pePSUbWQAZABx4ktAkyKBM4nbWPA7g8oT
         dnKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685696623; x=1688288623;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4z0aWs+76DsOLK1ZdUfTJiO33aieMzJYwE+Vw+aqL5o=;
        b=gnBW6ddSVamdW7KV9PVZkmevhszTf/9hl6VFDI878AmrgkUOwywWX60jnFrqe9cwcE
         vXRYABo/0oDrQUrGej7YaHgJJLN7mh/lRQHcECy+F6M4E5mewSS0/owb3mzbqTkNQfHD
         eWxCziX89tHok8MbY3CbMQ2Cv28m0tCOM/IE9lKO0GyseNdjrBJ4vrw6sbPQyX8bp/kC
         y8rb02TrevrzwiGu4WbAjVbFnLdFS3Z1GCE9sLOh6wxbGKqH68TV65enWV62uMqkKMI8
         EESY0J34cicyoUbKrAWg+rDMayzfyVBQn8O0tJhPh9C37/Qm74f3iCC5E5VFzMnRgt+I
         fodA==
X-Gm-Message-State: AC+VfDzUZG7exe8DoYB98bqWqTyH1cCzXqmWPQVwAGT1Zl5T7+546DoX
	U9QJBRIUX7Z0gqzEFjQRvvTcVQ==
X-Google-Smtp-Source: 
 ACHHUZ5CDb7hi9sRLxSyOLWk2zLbnISHdDPJk09PJ3HtrxN665G3O5E6naqR5vu6cmuvrQV4abNDig==
X-Received: by 2002:a17:907:8a11:b0:93e:fa12:aa1a with SMTP id
 sc17-20020a1709078a1100b0093efa12aa1amr11368431ejc.1.1685696623017;
        Fri, 02 Jun 2023 02:03:43 -0700 (PDT)
Received: from localhost.localdomain (80.71.142.18.ipv4.parknet.dk.
 [80.71.142.18])
        by smtp.gmail.com with ESMTPSA id
 w23-20020a170906385700b009707fa1c316sm488031ejc.213.2023.06.02.02.03.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jun 2023 02:03:42 -0700 (PDT)
From: =?UTF-8?q?Alvin=20=C5=A0ipraga?= <alvin@pqrs.dk>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: =?UTF-8?q?Alvin=20=C5=A0ipraga?= <alsi@bang-olufsen.dk>,
	alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/4] ASoC: support dai-links with symmetric clock roles
Date: Fri,  2 Jun 2023 11:03:17 +0200
Message-Id: <20230602090322.1876359-1-alvin@pqrs.dk>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MailFrom: alvin@pqrs.dk
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: UNPBL63SYQRKSHJDG7R3Q7VCND7FFUJL
X-Message-ID-Hash: UNPBL63SYQRKSHJDG7R3Q7VCND7FFUJL
X-Mailman-Approved-At: Mon, 05 Jun 2023 13:52:39 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UNPBL63SYQRKSHJDG7R3Q7VCND7FFUJL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Alvin Šipraga <alsi@bang-olufsen.dk>

Currently the ASoC core always assumes that one end of a dai-link is a 
clock provider and the other a consumer. This series adds support for
configuring dai-links where both ends are actually clock consumers.

Alvin Šipraga (4):
  ASoC: dt-bindings: document new symmetric-clock-role flag
  ASoC: core: add support for dai-links with symmetric clock roles
  ASoC: audio-graph-card2: parse symmetric-clock-roles property
  ASoC: simple-card: parse symmetric-clock-roles property

 .../devicetree/bindings/sound/simple-card.yaml        | 11 +++++++++++
 include/sound/soc.h                                   |  3 +++
 sound/soc/generic/audio-graph-card2.c                 |  7 ++++++-
 sound/soc/generic/simple-card.c                       |  4 ++++
 sound/soc/soc-core.c                                  |  4 +++-
 5 files changed, 27 insertions(+), 2 deletions(-)

-- 
2.40.0

