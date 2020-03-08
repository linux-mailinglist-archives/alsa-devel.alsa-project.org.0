Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D78E717D429
	for <lists+alsa-devel@lfdr.de>; Sun,  8 Mar 2020 15:27:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 097EC166D;
	Sun,  8 Mar 2020 15:26:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 097EC166D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1583677630;
	bh=lBfMtov3eR9/spOPZw4OQV8lCwFaKXIkYfW10tMXCng=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=QggfofVciSzGXyRMoQ3QWD/qF28bjkuZn5+6H6nvlxQi6slvQWNxFhvW7V6neHd58
	 WnuEz0V/vacPTPAES+hsUd9USVQZG/KMuDV6szo1yagBgf0kJPAHQyg4qY6Mw9H/Ad
	 SpsY1rm24izdlwlmSJnPYAGdUxFvpzu8qFUU+mQs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EDB42F8021C;
	Sun,  8 Mar 2020 15:25:28 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 88542F8020C; Sun,  8 Mar 2020 15:25:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 06384F80130
 for <alsa-devel@alsa-project.org>; Sun,  8 Mar 2020 15:25:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 06384F80130
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.b="LVsMjwVU"
Received: by mail-ed1-x52e.google.com with SMTP id y3so8791172edj.13
 for <alsa-devel@alsa-project.org>; Sun, 08 Mar 2020 07:25:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pSsIxxcYD2IRo/XwqQkOgmnJ6QudV3YD5q1CSFIVsFs=;
 b=LVsMjwVUF8zj3ZeMC71HGla8EmYK6AeKIuuHdeic38AAGGbMrrIT5+pj9oUQfbYfBf
 KsL9cDiFIATIJTYvAoFVk+CX3P7FK3PpuydFFBxwzKylEHitjl2AIw/xjYJXiVDNTGtF
 xQfIYRgJAfmmdTP3jrWAsoswomg37Fh/CsOhDp4JpUl5uBHr0LnStaa0XEqQTa/oFwdZ
 c/DfkYZaKAqshvt4dQwN6tYlY/Wk10suTIDIYA3pcgUvJj83y3bzmXmN0AIypzXTJQcb
 GR67o2l/D6g5s2DWGRFI+E0rnWPCZysZW5hPTYRPUnh2Tiaq9zLCMEkLPekbByOtGfKL
 PcYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pSsIxxcYD2IRo/XwqQkOgmnJ6QudV3YD5q1CSFIVsFs=;
 b=iJrHS0c3f+IZcg/TnettizJceoM3c/zcpAh4bsSpkA0AwvsbS5XqE6KdcagjW+YPz8
 Bu24vyO5W3ebRsWsJli9/90AXGMZG/0xIb/2ydQUGrf5JARPyBqmJ3AiWlOGjpy7ansn
 Iv8a7Cc0RvqW6PJoAd/YznaNB5TnptoUKGcyx8ZSArfV9n1mmQWQGEVOErhiGwxkNL5f
 mTLL02LPQd8XTImwNzX3T1MGQIZtr1ZZuy6jTyikCy4dMPG37cb+zazYE91FVWAAuP1h
 r/iSwP+JnoJrrudGUDxyRovPYsLGYaIsRaqavykjPwSqkeqCUrFpRlO9tVV2Uie7uM9o
 Fayg==
X-Gm-Message-State: ANhLgQ0IZ3OmF+9PK05SNo3Re0IlRT/wuoa9Uasy/IUwYTzzZTCUsSia
 HhAWzko1797BP+KgCMvM2rykD71LA8k=
X-Google-Smtp-Source: ADFU+vtGMT0jubg0n3sS9KKTmYvKTD69LwePZLHVi5uBbRwXqMATDh17TmCuh+4gzCfZ54G74GFheg==
X-Received: by 2002:a50:9d06:: with SMTP id v6mr6929891ede.189.1583677516689; 
 Sun, 08 Mar 2020 07:25:16 -0700 (PDT)
Received: from localhost.localdomain
 ([2a02:a03f:44b4:9700:886c:841d:dea2:ee2a])
 by smtp.googlemail.com with ESMTPSA id h20sm1736516edr.43.2020.03.08.07.25.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Mar 2020 07:25:16 -0700 (PDT)
From: Charles-Antoine Couret <charles-antoine.couret@mind.be>
To: alsa-devel@alsa-project.org
Subject: [PATCH 0/6 V3] TAS5756M codec driver
Date: Sun,  8 Mar 2020 15:25:03 +0100
Message-Id: <20200308142509.27765-1-charles-antoine.couret@mind.be>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Charles-Antoine Couret <charles-antoine.couret@mind.be>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

V3 changes:
 * Fix device tree documentation (thanks to Rob Herring for dt_binding_check)
 * Split main driver commit with hybridflow support

V2 changes:
 * Fix bug in driver itself
 * Change device tree attribute names
 * Convert device tree documentation from txt to YAML format

Charles-Antoine Couret (6):
  ASoC: add TAS5756m driver
  ASoC: tas5756m: add Hybridflow 3 support
  ASoC: tas5756m: add Hybridflow 4 support
  ASoC: tas5756m: add Hybridflow 6 support
  ASoC: tas5756m: add Hybridflow 7 support
  ASoC: tas5756m: Add DT binding document

 .../devicetree/bindings/sound/tas5756m.yaml   |   64 +
 sound/soc/codecs/Kconfig                      |    8 +
 sound/soc/codecs/Makefile                     |    2 +
 sound/soc/codecs/tas5756m.c                   | 2161 ++++++++
 sound/soc/codecs/tas5756m.h                   |  351 ++
 sound/soc/codecs/tas5756m_hf3_cfg.h           | 4508 ++++++++++++++++
 sound/soc/codecs/tas5756m_hf4_cfg.h           | 4510 +++++++++++++++++
 sound/soc/codecs/tas5756m_hf6_cfg.h           | 4510 +++++++++++++++++
 sound/soc/codecs/tas5756m_hf7_cfg.h           | 4510 +++++++++++++++++
 9 files changed, 20624 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/tas5756m.yaml
 create mode 100644 sound/soc/codecs/tas5756m.c
 create mode 100644 sound/soc/codecs/tas5756m.h
 create mode 100644 sound/soc/codecs/tas5756m_hf3_cfg.h
 create mode 100644 sound/soc/codecs/tas5756m_hf4_cfg.h
 create mode 100644 sound/soc/codecs/tas5756m_hf6_cfg.h
 create mode 100644 sound/soc/codecs/tas5756m_hf7_cfg.h

-- 
2.24.1

