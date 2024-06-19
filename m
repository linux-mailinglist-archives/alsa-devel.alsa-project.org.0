Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 04B5690EF3D
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Jun 2024 15:42:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EF5B9DEE;
	Wed, 19 Jun 2024 15:42:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EF5B9DEE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718804566;
	bh=rgiEYLNQb3RpLZpQYuT7fM30aAaSLPjiSg2mR2Q0qdU=;
	h=From:Subject:Date:To:Cc:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=Mmf5o8zTFnTqrQmXsE+NnbF6y6Pc54Ue+ab3yifnfwFoNrZHvSyE31hFNV5q/LJKZ
	 5eOrgvWGfN7SopBkuVfNtjXRylpC8qWLfvtMSEyOA3g91z6uO7NBSEI6eAzUNkDzFf
	 VmSC3z93AFU/hWF9zn2aAsySc3nftn0+2PcKP6PQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0D74CF805B6; Wed, 19 Jun 2024 15:42:14 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DEF88F80269;
	Wed, 19 Jun 2024 15:42:13 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D7DC1F8023A; Wed, 19 Jun 2024 15:42:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: ***
X-Spam-Status: No, score=3.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_SBL_CSS,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=no autolearn_force=no
	version=3.4.6
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 13473F80154
	for <alsa-devel@alsa-project.org>; Wed, 19 Jun 2024 15:42:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 13473F80154
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=oWWUyBVK
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-42165f6645fso53478945e9.2
        for <alsa-devel@alsa-project.org>;
 Wed, 19 Jun 2024 06:42:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718804524; x=1719409324;
 darn=alsa-project.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=y7go2tHNRxtX3hgSDycL9uJw0C/nuPgmVzfI4zryzEA=;
        b=oWWUyBVKnDZu9mZTwEps71b/6nmhybFMzX4DfSMoM1lPAo46vksnwiW44ae79VVtj7
         7vLWzEz3TXxyetUW0vO/vXMbA1CFGREw0rbpr7mf9d62QoL4DIylFRJ8wBuMGjP/a1WS
         t2C9GzE1i4Oax0chssBTDXKKySW7i15TOGuMrmMvdnuPVz89LBSEAw3vklXvzOVHfEQg
         ADIy8eLq+LO0Db76yq8Wfe7pGohwLHrFotHeI5JkPPP3Rh462ayfW+BKV/j8ptmWKqV6
         U9FcPIdeMq9fZmbD0Ct6O8ggGbLqG7Ph+/StA8l7SjlqkS2CjQlOvd0pJ098sHCvqxiv
         2kFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718804524; x=1719409324;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y7go2tHNRxtX3hgSDycL9uJw0C/nuPgmVzfI4zryzEA=;
        b=SJI1Vux7OhHUrTrPsgowq+SEFxywzj/JlU8zk99UbZPyuV585Y2/KREtY3EWfGHJjS
         AV/MalEe8ESkj0CsGCH7B02O1UC0JtuSLyKWLqhXI1n5o5EANIiYgoh+qUdH7KO+8cIm
         iKVRWJe8cmEMevfIek54tvq3oE3jjavL9R2nZH47A5CerE+Tpd3sm/E15C3ciff+Zb11
         GxsCP0Jc8W/JLgYvnGdzgyOra4RQvpKgq1z4zC4pnkY18cxXLgrmRo+V8gQQF82P+aKp
         0d2mLPh/Xzaib4HFJTeDr9HdW0PQljNJGnTvNx4W9ILmOXQtAnCgxijITzJrHZ5Fnztc
         3kbA==
X-Gm-Message-State: AOJu0YxnBSod0Gdif78RcOcD0uYCbW/7XFzhs3s69X4Lr1PwGtOnX3Pd
	JM/Jbf1lNcl7NqESELwlxnd/K7ilh/3FbvAuxMXIT9e6DlI1u1Z0E7WSYAwpMT4SjHq5YcBOeVV
	Knck=
X-Google-Smtp-Source: 
 AGHT+IGEJY74VeA/iUAaIflTiACCdqFcTGgnATrpx3F86GZfFf5/C8nUkxOe22alnDGyRaQQxhM5bw==
X-Received: by 2002:a7b:c3cc:0:b0:422:7d95:b815 with SMTP id
 5b1f17b1804b1-42475293d79mr20545735e9.27.1718804524163;
        Wed, 19 Jun 2024 06:42:04 -0700 (PDT)
Received: from [192.168.1.195] ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4229c60f758sm251639505e9.20.2024.06.19.06.42.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jun 2024 06:42:03 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH v2 0/2] ASoC: codecs: lpass-wsa: fix vi capture setup
Date: Wed, 19 Jun 2024 14:41:59 +0100
Message-Id: <20240619-lpass-wsa-vi-v2-0-7aff3f97a490@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACfgcmYC/x2NQQqDQAwAvyI5N7DGItivFA9ZjTVQomysCuLfX
 XschmEOcEkqDq/igCSruk6WgR4FdCPbR1D7zECBnqEuG/zO7I6bM66KoarqgcrQUBTISWQXjIm
 tG+/Ip5/1aLIvt5yTDLr/X+/2PC/kWKvBewAAAA==
To: Banajit Goswami <bgoswami@quicinc.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Manikantan R <quic_manrav@quicinc.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=688;
 i=srinivas.kandagatla@linaro.org; h=from:subject:message-id;
 bh=rgiEYLNQb3RpLZpQYuT7fM30aAaSLPjiSg2mR2Q0qdU=;
 b=owEBbQGS/pANAwAKAXqh/VnHNFU3AcsmYgBmcuArq9LaU4lDY1TIcq5GY+jXvwF5YzEAMvgpe
 bbm0K09BZqJATMEAAEKAB0WIQQi509axvzi9vce3Y16of1ZxzRVNwUCZnLgKwAKCRB6of1ZxzRV
 NySZB/9Kw+4BhXGebevZTGw4wsBxspq/E3A0lEhk3nUEqZvzMdPTOUMjnR9DuJA7U3BFcIUeWop
 nckdsW4X21/tsrAxwFA+A5C39AJaLSiOUXttuPzFgguxCSUmmH/kFE9NCEEmIoQ2gnmHVJqN1py
 9nH2Bt7srdHximNA/isi13m5AZABHOB356Rg+CM/zowkFUzosKyVzVFkCun/Q++lSJjJIdh5l34
 NWV5095lkn7+aApmunvisqxuvMIDqPHjG1xIhEQfpnW5tuOm2RqwY0XigpXRj7FOpQlAcIeJYkM
 QUrW6oW62lmaYVjDHPiyLXoL07ZplToay30NJZqjTHy7afXD
X-Developer-Key: i=srinivas.kandagatla@linaro.org; a=openpgp;
 fpr=ED6472765AB36EC43B3EF97AD77E3FC0562560D6
Message-ID-Hash: XYN6SD7XVWRV3QHEC7Y72WTUVLJEDARS
X-Message-ID-Hash: XYN6SD7XVWRV3QHEC7Y72WTUVLJEDARS
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XYN6SD7XVWRV3QHEC7Y72WTUVLJEDARS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This two patches fixes issues with VI capture rate and path setup.

Changes since v1:
- added missing break statements in switch case.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
Srinivas Kandagatla (2):
      ASoC: codecs:lpass-wsa-macro: Fix vi feedback rate
      ASoC: codecs:lpass-wsa-macro: Fix logic of enabling vi channels

 sound/soc/codecs/lpass-wsa-macro.c | 103 ++++++++++++++++++++++++++++---------
 1 file changed, 80 insertions(+), 23 deletions(-)
---
base-commit: 8aae76179d6b4587368d50614e114b391cf33ec9
change-id: 20240619-lpass-wsa-vi-0336f21092be

Best regards,
-- 
Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

