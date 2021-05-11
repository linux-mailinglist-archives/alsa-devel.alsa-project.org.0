Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E5A937A12D
	for <lists+alsa-devel@lfdr.de>; Tue, 11 May 2021 09:50:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 149011771;
	Tue, 11 May 2021 09:49:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 149011771
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1620719409;
	bh=7l+wNptxgWvjdaH5yT+O2BvA243cyZFfafhKF3s9hL8=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=u/qLpOWd/RB2+kQHxNn0H+Jix7ZTCDafDlh0JiGPO7/q1hbxSpPFpyNQPD1B1Z2mT
	 PlPet58pGLjuS8alsgYCRA+NyqOOaigfrha563hdcqn4/rV/PtbGuGL7W2bGXNJb2Z
	 UUgxP3cWAXF74n3PN+8S3lAw6n4Ad1TRnIU6ZoSo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 74039F801D5;
	Tue, 11 May 2021 09:48:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4B1EDF8016B; Tue, 11 May 2021 09:48:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 799E0F800E9
 for <alsa-devel@alsa-project.org>; Tue, 11 May 2021 09:48:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 799E0F800E9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com
 header.i=@baylibre-com.20150623.gappssmtp.com header.b="ppcjXHmV"
Received: by mail-wr1-x42e.google.com with SMTP id e7so555090wrc.11
 for <alsa-devel@alsa-project.org>; Tue, 11 May 2021 00:48:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0aKhMFos6FwrsrnKu5YWX9McpIt7w3RKLcj0tedb3Yw=;
 b=ppcjXHmVF7ECDjdGn2+rwNT/xNSDY7W2WlUffWO3D1QhXtCgJfi8p6WCcmyp6wX+fZ
 x1eWBDHrPvKsmZHDZ3k2FYxwxS47MFsxecKlETjqEIYa9Xc6lcmvOC+hhrxxBP5rs9kk
 1/SXJmR8QSg61HmKzBkuy63yEV3qyTTi0O3Ky5qnUrMCIvA0ITOJ4BeMF8OxTNaf4R07
 Oe9kanSZhXh7akRYewxj+tg3ryw2p5AHx9A01WJKJP4wNB6QyyV2LwaXvIHrKYjUo499
 QBqQBjkytG+nx9Oqyx/EnkM5GtQJAx1hcwnoFUwZkRWFSsHugY5ojoG83/anneDJDHUE
 zL8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0aKhMFos6FwrsrnKu5YWX9McpIt7w3RKLcj0tedb3Yw=;
 b=KlO2NLqG90d3c3yDO/w8NwIoYTTuN5ajy1WfJptt9o6oiLPmZN+63ju51aZSmmO4lY
 YG28vQWJ4OYO1BayHJnIExQf/86/suLGScTfdsZLWh5UBiDRI35nasxdJWlJWubRUseE
 bNJVIIHN1FtdAN/r8RsBDw4ygqhwAm5wIr48PeE2NJnr0/EBsH9BFvM6RL7UF6VheQIx
 Dgf8aoEfk8OfUAK8JoHJMfuD3NJhuWRk/YmDJlDz5xcCAUmGAJYoOOwzS+SaIjHMJJYh
 FnHx7e4oZ9lmDZaqn+XiMyOgpzW00EfR5IHkgJ7HSK5rWgNqarDYoTDZ/X2wB+m6L0Kr
 TtpA==
X-Gm-Message-State: AOAM5310HGMKhAbe44BYT6A4RBw5jyO7YOhIUbh+2V37YofDtdsX9zvP
 OcwOzGHDX86a9m1MEViRPUJjrg==
X-Google-Smtp-Source: ABdhPJxvk8PMcjaew5j2goslEy2L/b/57GiN7V5OJJTi5n7pDuKRnEMLGQs5PnLQ0zrfKH2aErdXPQ==
X-Received: by 2002:a5d:6e11:: with SMTP id h17mr35388990wrz.331.1620719315466; 
 Tue, 11 May 2021 00:48:35 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:90c:e290:ce08:6145:b4e3:5a23])
 by smtp.gmail.com with ESMTPSA id
 f6sm28371111wru.72.2021.05.11.00.48.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 May 2021 00:48:34 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: jbrunet@baylibre.com,
	broonie@kernel.org
Subject: [PATCH v3 0/2] ASoC: meson: g12a-toacodec: add support for SM1
Date: Tue, 11 May 2021 09:48:27 +0200
Message-Id: <20210511074829.4110036-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-amlogic@lists.infradead.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <narmstrong@baylibre.com>
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

This patchset adds Amlogic SM1 support on the TOACODEC driver, first by switching
to regmap fields for some bit fields to avoid code duplication, and then by adding
the corresponding bits & struct for the SM1 changed bits.

Changes since v2 at [2]:
- use raw values instead of defines in REG_FIELD() for g12a_toacodec_match_data

Changes since v1 at [1]:
- switch to regmap field

[1] https://lore.kernel.org/r/20210429170147.3615883-1-narmstrong@baylibre.com
[2] https://lore.kernel.org/r/20210505072607.3815442-1-narmstrong@baylibre.com

Neil Armstrong (2):
  ASoC: meson: g12a-toacodec: use regmap fields to prepare SM1 support
  ASoC: meson: g12a-toacodec: add support for SM1 TOACODEC

 sound/soc/meson/g12a-toacodec.c | 143 +++++++++++++++++++++++++++-----
 1 file changed, 124 insertions(+), 19 deletions(-)

-- 
2.25.1

