Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C98EC7B3EEA
	for <lists+alsa-devel@lfdr.de>; Sat, 30 Sep 2023 10:04:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9BB18DF3;
	Sat, 30 Sep 2023 10:03:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9BB18DF3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696061075;
	bh=O16fW813x9PPwD4+gXvF6fLBzVkiNmOyewkUdCJM/yI=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=B3VJLcUPvqFc5yCmSgrMXX9/FzmdfXRKlE412Q0Dqw7VWAid8v63RN97tiEugZCOE
	 ukRAMpm137a44t/17hjDU46BohD3lLkHvEy7xxaNfQcx0S0xT5q4v3wbv77IC4gtE2
	 wBElXEz3ikSkYLqGpN8mJeFZkQ5DCjNqtmCwoq2w=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1EDA6F80568; Sat, 30 Sep 2023 10:03:03 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 02ED6F80568;
	Sat, 30 Sep 2023 10:03:03 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8300CF80290; Tue, 26 Sep 2023 06:09:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com
 [IPv6:2607:f8b0:4864:20::42f])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B8FACF80130
	for <alsa-devel@alsa-project.org>; Tue, 26 Sep 2023 06:09:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B8FACF80130
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com
 header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com
 header.a=rsa-sha256 header.s=20230601 header.b=MFXnLrKM
Received: by mail-pf1-x42f.google.com with SMTP id
 d2e1a72fcca58-69101d33315so6194920b3a.3
        for <alsa-devel@alsa-project.org>;
 Mon, 25 Sep 2023 21:09:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1695701349; x=1696306149; darn=alsa-project.org;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BXZM3t7Vot72kzO5qEhlUVk+47BaITOgjLbty7qmKqk=;
        b=MFXnLrKMwTp07AoN6LTjFZ8LyyVBEfh0ojRmMx13mGuUjk01PTSiuQiGkU/rKPWNUt
         ojoTYINl7QUSI0fyIMK7N6dWDmR5IkXqk7tOdQqzY67KiZUCFzQHexSEn0ypurP33+Kv
         L+x+Y1LXYJXPlGHFaDneS+KiRA32xsYdNa6ZiixV+LjRxYEOh0Rgf+tvZ8ZUS/LGpIvr
         BeTVTeoXZHGo1hftD8c2/m0EyPf3lwy432xMWyarNM1LdIXxrD2Ghm50xLIZq885z8y2
         zKTEkciVL1DDqHeSQbIP9ppRvc0RaxthB6V640NHnp2ruo+4dOqQUQBas7jleRmFDBFD
         i8/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695701349; x=1696306149;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BXZM3t7Vot72kzO5qEhlUVk+47BaITOgjLbty7qmKqk=;
        b=jZayQO0bTovaflIWxI2O2/lStHQifWwC57pTyLjtw8N07MD1XJOtL4DOnTRNdGTbU0
         baivawkE8no9zgS00ULvMUpbY08bavUyjeX8xZQ4uj/42p7reCvCTHmmH92wwOJxT0H7
         lL66rUi1aSbugFgcXUmZirrqmFTK45FBKUgsQfE3J/cnuw8huAf4oP/T4G2lmf+efUhh
         B09NfqKZOuXL+JTw42pSWFu3k7KvnG8wEtU4L4BWnfGRRu6jX7L/bt+ZaEvEN7jcHm+K
         6PbI6MhISpxTn0kDJDEm4xVYPBNu9eDwWCVlnlRzEEpsG+3LGpuhvfstWJ5/ds+RBqlJ
         Ysdw==
X-Gm-Message-State: AOJu0YzEMW/0DDymwIj5ksolIF50SquQDrKwttZs7ZbIbpWKTJIaIoYs
	8MVrwPFABdlCLyQaUWcYEGQCyw==
X-Google-Smtp-Source: 
 AGHT+IHvbM72jhxZ89SI81WyE4fvEpRvEDerJok1wsO4XJLuvjqRPTmSiem+y6GcAbfaA+vlEsD4FA==
X-Received: by 2002:a05:6a00:812:b0:68c:2be:67bb with SMTP id
 m18-20020a056a00081200b0068c02be67bbmr7115105pfk.20.1695701348557;
        Mon, 25 Sep 2023 21:09:08 -0700 (PDT)
Received: from ubuntu.huaqin.com ([101.78.151.205])
        by smtp.gmail.com with ESMTPSA id
 z22-20020aa791d6000000b00682669dc19bsm8824907pfa.201.2023.09.25.21.09.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Sep 2023 21:09:08 -0700 (PDT)
From: xiazhengqiao <xiazhengqiao@huaqin.corp-partner.google.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	robh+dt@kernel.org,
	matthias.bgg@gmail.com,
	perex@perex.cz,
	trevor.wu@mediatek.com
Cc: alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	xiazhengqiao <xiazhengqiao@huaqin.corp-partner.google.com>
Subject: [v2 0/2] ASoC: mediatek: mt8188-mt6359: add rt5682s support
Date: Tue, 26 Sep 2023 12:08:59 +0800
Message-Id: 
 <20230926040901.20338-1-xiazhengqiao@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.17.1
X-MailFrom: xiazhengqiao@huaqin.corp-partner.google.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: BV7CFC26HO7TIIFQR54HKFOHZY7KR52J
X-Message-ID-Hash: BV7CFC26HO7TIIFQR54HKFOHZY7KR52J
X-Mailman-Approved-At: Sat, 30 Sep 2023 08:02:57 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BV7CFC26HO7TIIFQR54HKFOHZY7KR52J/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

To use RT5682S as the codec and MAX98390 as the amp, add a new
sound card named mt8188_rt5682s.

Changes in v2:
- PATCH 1/2: Modify mt8188_rt5682 to mt8188_rt5682s
- PATCH 2/2: Modify all string "rt5682" to "rt5682s" and merge code 
             in mt8188_fixup_controls
- Link to v1: https://lore.kernel.org/all/20230925083847.1496-3-xiazhengqiao@huaqin.corp-partner.google.com/
              https://lore.kernel.org/all/20230925083847.1496-2-xiazhengqiao@huaqin.corp-partner.google.com/

xiazhengqiao (2):
  ASoC: dt-bindings: mediatek,mt8188-mt6359: add RT5682S support
  ASoC: mediatek: mt8188-mt6359: add rt5682s support

 .../sound/mediatek,mt8188-mt6359.yaml         |   1 +
 sound/soc/mediatek/Kconfig                    |   1 +
 sound/soc/mediatek/mt8188/mt8188-mt6359.c     | 141 +++++++++++++++++-
 3 files changed, 141 insertions(+), 2 deletions(-)

-- 
2.17.1

