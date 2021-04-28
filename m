Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 495F736D74D
	for <lists+alsa-devel@lfdr.de>; Wed, 28 Apr 2021 14:28:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D6D0016B6;
	Wed, 28 Apr 2021 14:27:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D6D0016B6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1619612900;
	bh=e0PYPYmVp2sTeVyprug7qWsIRtPg4Na1XzmKvy2NQPk=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=mz/23KcZy63EXcyTkd1+2vv0FTqkjw8HBE49jTPbTXmnxSq1XcBIBT05ap9pc2llp
	 PL9MP6kvfzQVPTEPP3NP2ri9qJ/wnhR8kE5zbYNOktxE7gKa6rKdgT3JguYXUSy9Ap
	 z9EjEkWfpisFhkUmuERDI5PKLUv8mdTTH5eepGB4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2FDF8F8016C;
	Wed, 28 Apr 2021 14:26:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 69C75F80218; Wed, 28 Apr 2021 14:26:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E72A0F80165
 for <alsa-devel@alsa-project.org>; Wed, 28 Apr 2021 14:26:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E72A0F80165
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com
 header.i=@baylibre-com.20150623.gappssmtp.com header.b="U9f8f1sM"
Received: by mail-wr1-x42a.google.com with SMTP id l2so10508007wrm.9
 for <alsa-devel@alsa-project.org>; Wed, 28 Apr 2021 05:26:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=L9vJ8MVP6j87QpSAeKDLXQXVxBj32ZGZbJSSBO9KR4k=;
 b=U9f8f1sMIE1pphhlzVUVKvVnrpByG1WlCslO+nr7TxtyVGECQdHCGsftxi8PJsWqcx
 u4rHcfo3PlxDAzCb038jecFAXiMEw8AvZv/xigLejkM4ucxeNJkSTbHCELjFm77FLGcS
 g4VM9U6t24JQyPq2V7kV737Rs8+Mse5R2oUFNfZghUoiQpKq1JZdHCT4Qta5vUgUKIOM
 PLnJc9RiCXrtHjmr2A8xJtwk4Bk3OkDcrDIyFME0K5QIhpMilUYsTviLuwHB4u71E18x
 mAopOWsc4OZ7OsC0BZutcg0ctRrSmzuLnWTAdUs7VNU2BmbCEwG19q+NVDnQAekZ8RxY
 ZJkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=L9vJ8MVP6j87QpSAeKDLXQXVxBj32ZGZbJSSBO9KR4k=;
 b=UiRId+tvGllpQEoSBiO0QQptNjbaGR9iW0iHJglMWp3OQHM/9w2fLznDimnkdeq9tm
 qTcUoqNTdYZT44I7ivoTzRWtzlOuMwJvzeatkjJ3/WaLFj4NJiW6+Sp7aZVDyH4V2PI+
 HDe374wqMre7sMGQw5Hr7t6Dz159/ivZAwHGlZy3RWPFAApoluErm1HURia0vGaPwhmT
 +H8ZVUHUxzX1GyldelvSuG9mWMcHdULHFaFK2ngaRU0UpTCNt39FqscN2r7vgp1DudVP
 T1/l6bb2fp60Bah0lGd0i9ESPkTGF4KmeCVxiaUdEHIxv5MtPR+LNT1/npzIOp+TkjBt
 6vJQ==
X-Gm-Message-State: AOAM533q9D9ZMDFdTDhkduE/YpxuOK1XchGHICvVp5iW3QztkyZ9BSyt
 w2lEF2kqHCoujxySBjduhlFlZQ==
X-Google-Smtp-Source: ABdhPJyCLWhozrwOIpUv2gOjcCW05z9TPA1l9lMzWJazYXUKxSajxGK6YCT2I749kzuUnsrxcHw4nQ==
X-Received: by 2002:adf:d1cd:: with SMTP id b13mr35564902wrd.126.1619612801356; 
 Wed, 28 Apr 2021 05:26:41 -0700 (PDT)
Received: from localhost.localdomain (82-65-169-74.subs.proxad.net.
 [82.65.169.74])
 by smtp.googlemail.com with ESMTPSA id 6sm7872021wmg.9.2021.04.28.05.26.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Apr 2021 05:26:41 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>
Subject: [PATCH 0/2] ASoC: Revert clk_hw_get_clk() cleanup
Date: Wed, 28 Apr 2021 14:26:30 +0200
Message-Id: <20210428122632.46244-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-Patchwork-Bot: notify
Content-Transfer-Encoding: 8bit
Cc: Stephen Boyd <sboyd@kernel.org>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>
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

There is problem with clk_hw_get_hw(). Using it pins the clock provider to
itself, making it impossible to remove the related module.

Revert the two commits using this function until this gets sorted out.

Jerome Brunet (2):
  ASoC: stm32: do not request a new clock consummer reference
  ASoC: da7219: do not request a new clock consummer reference

 sound/soc/codecs/da7219.c     | 5 +----
 sound/soc/stm/stm32_sai_sub.c | 5 +----
 2 files changed, 2 insertions(+), 8 deletions(-)

-- 
2.31.1

