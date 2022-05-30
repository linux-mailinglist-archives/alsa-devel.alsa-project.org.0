Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C3A3B5373CF
	for <lists+alsa-devel@lfdr.de>; Mon, 30 May 2022 06:05:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 267AA1A42;
	Mon, 30 May 2022 06:04:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 267AA1A42
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1653883517;
	bh=hywgNRaiD32+60/y2UO9NTwK7HTtL5VwuCE7e8C4nkA=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=t3BqYfcpWVDhHYdo+M+GXqjZzxPXKruKBGrHO/2hcDeVNM1Fu32x8GSf063mvTjk/
	 AD/c53NoTgf1tepB1M2VxTh6onA16trSmH7bPZdPaOEx7NpUUYaVXzHXVlBf7OQDPN
	 5xppAy/ReGiuL7jSmRtr5FMkPiosxA/7d1oqAYiw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7925FF801F5;
	Mon, 30 May 2022 06:04:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5FF97F8019D; Mon, 30 May 2022 06:04:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from smtp-relay-canonical-1.canonical.com
 (smtp-relay-canonical-1.canonical.com [185.125.188.121])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7E3FFF800DE
 for <alsa-devel@alsa-project.org>; Mon, 30 May 2022 06:04:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7E3FFF800DE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com
 header.b="O7F1m2DR"
Received: from localhost.localdomain (unknown [123.112.66.143])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPSA id 11F463FBF5; 
 Mon, 30 May 2022 04:04:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1653883452;
 bh=0vF/a5DdI7u/NtBFZrfFxy6DSH1+20/NmWnxBKcjt7k=;
 h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
 b=O7F1m2DRmWvq37HNQ7yebh0K8O/CKjTS5XuMyvG6RBz6cCUymtvp7+7GcvYyZ+xJx
 X+QXFps9iJeufydmh3kGTz4KT+Q0waRO22NAQ75ejYd9xDE91QziBQqeFzQX1EqWim
 1r+X/5zGvzwyjhcarDNTLV8YDJwtlnCRDQUNysoCzbrEMGmIHbdX979AHsNWn7cNWR
 r9WaxRcD/NfCWtMR1Njj8d8dH8ldsjN1R8Hhdqkl/u05tImMNOHnSYtht2tT4Q/TyY
 1jMmfAzHj4ibt2VapM3uJhqdxtKffJ3pQmavPIKIdsbp0/tkurXN+lsz/4diJY6vcD
 fuDLLXhIthBRg==
From: Hui Wang <hui.wang@canonical.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH 0/2] Switch to use internal PLL for iMCLK
Date: Mon, 30 May 2022 12:01:49 +0800
Message-Id: <20220530040151.95221-1-hui.wang@canonical.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: wtli@nuvoton.com, kchsu0@nuvoton.com, ctlin0@nuvoton.com,
 ctlin0.linux@gmail.com
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

Hi David.Lin,

Taking your advice and try to enable internal PLL to get a more
accurate sample rate. And I also changed the fsl-asoc-card.c to support
the nau8822 codec, now the sound quality is pretty good on my imx6sx
EVB.

Please help take a look at these 2 patches on codec driver.

Thanks.

Hui Wang (2):
  ASoC: nau8822: Add operation for internal PLL off and on
  ASoC: nau8822: Disable internal PLL if freq_out is zero

 sound/soc/codecs/nau8822.c | 11 +++++++++++
 sound/soc/codecs/nau8822.h |  3 +++
 2 files changed, 14 insertions(+)

-- 
2.25.1

