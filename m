Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D5E3434A69
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Oct 2021 13:43:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CD6ED16EB;
	Wed, 20 Oct 2021 13:43:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CD6ED16EB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1634730235;
	bh=VtfFn1Tng4YYL+l/ErFVAz0ZBhNjharg0rPqPNqCkBc=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=DKDDmH4AKbbFqdXsxFQEQjqJ0reO+wWdf89Wj+TroOjEBP04tsIuilIrL2SocFXgY
	 uDVIN8tkRo2VmFhZ+11dV3OSYqocXHKyCOoq+23l8jsKLHlC/qYCo802zVBdNKzwRx
	 GgoMvKM5KgHUFBPJipYmQYL1K6CDJV+VTmvdLzQw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7A73DF802DF;
	Wed, 20 Oct 2021 13:42:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E709FF80253; Wed, 20 Oct 2021 13:42:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4ACB5F80082
 for <alsa-devel@alsa-project.org>; Wed, 20 Oct 2021 13:42:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4ACB5F80082
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=baylibre-com.20210112.gappssmtp.com
 header.i=@baylibre-com.20210112.gappssmtp.com header.b="clVBu1hn"
Received: by mail-wm1-x32d.google.com with SMTP id
 d198-20020a1c1dcf000000b00322f53b9b89so9544460wmd.0
 for <alsa-devel@alsa-project.org>; Wed, 20 Oct 2021 04:42:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1H7Jji7fIBx6bP4sgM7SKKuxwv994hR/z172a1Gf+IQ=;
 b=clVBu1hn1ydfk9h4lru/P+UxNhcv1Kv3w9oJAiA8PQbnMt0aRyKG3l3dAU4NBndB7q
 Pzg7rt2/mgBfXQ7zGU3HYXy+t9Jp/32h/JWn6Un/ciCyJ/mOLlWS+Lwa5QgWgvkPtF7A
 7KrzklV1v5pGzTatrZceRo1p5uMk6zz3xwww4iOoJrhg75Ky5i9NYkvbdqWIAYrpvpjg
 yHii6VOaUDAU6zrSGXgzb37ksn0HxQuG2k93RIFDiEXm/SdF/D4yH89hnLBtsWbf1L4Z
 3PZXRdYyqnKAi2u1hANQyRwqx/jcU+WtX/K7TMefqXHDOziedCeR/VO2wkuYnfEf1vS1
 zPfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1H7Jji7fIBx6bP4sgM7SKKuxwv994hR/z172a1Gf+IQ=;
 b=20ilV0NlwK1QiM9cZWpkA/zkpBvLmEJZtagxb1VjiUp0BfG9G6SylmL2Oe4Ri5c/tV
 OTzH2Xbk/JQ0ov701KlbzPa5mTaFCNTIUpOmQyO9zJcGhYRxlHJKNIh+c07EsWCUYXYn
 LYg1Mq0HEZZABCGmnj/UnM9/yZ/m3fNfyZu8pNgtBNljWztpwqLJsCIgEZuR90b6wqOP
 UIsp6sX+QmBcZ9siUgqiiku2SuDptXHcB9jWPKVzD5mgSeEXy4/WjUN2k78+ffYDC+cG
 PtG01cDGpimW+UAtM38NJoqYqToAXErcJ1OCEAGWuWoYV41GwVBSy8pM7Gt7/SaE8O6j
 Fwag==
X-Gm-Message-State: AOAM5308HInWBuVSFMMfmEhaYDF1CIB8XYO7gIMK2EnlHht2UQZs0iX2
 A7SfnxtpHbuZclUqONSuUDBpPw==
X-Google-Smtp-Source: ABdhPJz8QPobdNYOL533FNTMX2BasL1v0I2f1T3Hos3cXMcZGEiO6xYWEl9dLTPZbfnGUl78FI7H8Q==
X-Received: by 2002:a1c:f712:: with SMTP id v18mr13600190wmh.104.1634730152920; 
 Wed, 20 Oct 2021 04:42:32 -0700 (PDT)
Received: from jackdaw.baylibre.local
 (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id s14sm1732927wro.76.2021.10.20.04.42.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Oct 2021 04:42:32 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH 0/2] ASoC: meson: axg: fix TDM channel order sync
Date: Wed, 20 Oct 2021 13:42:15 +0200
Message-Id: <20211020114217.133153-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
X-Patchwork-Bot: notify
Content-Transfer-Encoding: 8bit
Cc: linux-amlogic@lists.infradead.org, alsa-devel@alsa-project.org,
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

On the Amlogic AXG series, the TODDR FIFO may get out of sync with the TDM
decoder if the decoder is started before the FIFO. The channel appears
shifted in memory in an unpredictable way.

To fix this, the trick is to start the FIFO before the TDM decoder. This
way the FIFO is already waiting when the 1st channel is produced and it is
correctly placed in memory.

Jerome Brunet (2):
  ASoC: meson: axg-card: make links nonatomic
  ASoC: meson: axg-tdm-interface: manage formatters in trigger

 sound/soc/meson/axg-card.c          |  1 +
 sound/soc/meson/axg-tdm-interface.c | 26 +++++++++++++++++++++-----
 2 files changed, 22 insertions(+), 5 deletions(-)

-- 
2.33.0

