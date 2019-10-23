Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F596E2049
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Oct 2019 18:14:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EDAD341;
	Wed, 23 Oct 2019 18:13:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EDAD341
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571847244;
	bh=LSelPvWVFHTf9F9AX4VygbykqQxZ2Bqea5pHWWfGkFU=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=otQRFf10E+6HxJSC9zxAtUaoxlxKzQoGHYbvyOo+WFSPOGKvFstjSIvudp4WxBIa0
	 gTbZXaiKJGvQVJ4fBVwT0otZ2TKs69rpukgtT3j4yauv2Zc3OvZ1Y3uiRCZBqsQjkg
	 oTBVBAtDBKeS+UQNLU3GwjeZirWM/fcpmu1pDDms=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AD246F80368;
	Wed, 23 Oct 2019 18:12:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3257FF80393; Wed, 23 Oct 2019 18:12:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E6C38F80112
 for <alsa-devel@alsa-project.org>; Wed, 23 Oct 2019 18:12:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E6C38F80112
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com
 header.i=@baylibre-com.20150623.gappssmtp.com header.b="chwLkcmO"
Received: by mail-wm1-x344.google.com with SMTP id i13so6647231wmd.3
 for <alsa-devel@alsa-project.org>; Wed, 23 Oct 2019 09:12:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5N0IJFJExNFmNBBJWrgzz5LRbQ4JRTZ0BkV4z06vqY0=;
 b=chwLkcmOiUAEQsrWzVQkh32ufJ0dzqhyj+TT5Mvf0JSZNyRKjOsR0F9hP5JPFyUQFV
 KRwWLt6frNQT8guB1ypjCT7BpaNXJvDi6lH4Zs2M1gAamNGSTFUyQ+kssb7CGp3rALvM
 uQINpDSRi+U++BEkW0LAJgFYy3dDW8SZxbX4fTU71Q3d3+CdpcW9nFWDA83f9zFxZ46G
 fOkin3sSD9S9SRRBj0xWA9TWs8eWtMuBJmp75/NQ2ntlOhwCaQV9Mbr+ggF2Eu3twNro
 loH5LKjj4ltNfSuuonVe+Z58243UfsaH4cSEp1+RRmE6hE0Gg9OS9ppljrlFFP6x51en
 q+WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5N0IJFJExNFmNBBJWrgzz5LRbQ4JRTZ0BkV4z06vqY0=;
 b=OzU/VuSlhx1FmWZ5nRJwzbwmkMR8ODqAHMuECzozHFJMK5oEHQZjvSwbvwb67LnX2H
 47kVdM9bUXIxOp+A1gtnCTnLAXqiI+YKfEmzkXjbaeX9sotEigYOpv1AiVZu3+2jPNGj
 /ZvM9k4P8LqLek1dbIZLe7iCK0g27hM3EU8vZpj1rZt0phkY7Z0wKO0ZHvDegGRCK1tS
 3S8Jua7fAzBmRWBlmGN6ze9GhPP8MrxAuHi3U9bF3D/MuslNTmcIDQCCQny6gcjtwszQ
 CTAtj1oE46JlDpLbiWDAoMddmc7gO36a0uitW+IjZv5dgW/GGQXEaBAdzXr/xmFHV3sO
 yrkw==
X-Gm-Message-State: APjAAAUU6W9Qw4/RQADFk+Zpnz3glP1dVOPG71XcT6c9Xe/LZN+TdWek
 OVXYqjm3uWWz6m8GUcPywV7kag==
X-Google-Smtp-Source: APXvYqx89Kr3sR4iD4jsrmNIXNbya2seam5xpxOI6dwozV14X11HSAwDiI7NAjy7VNTee/WFj3dZEA==
X-Received: by 2002:a1c:650b:: with SMTP id z11mr609774wmb.149.1571847131097; 
 Wed, 23 Oct 2019 09:12:11 -0700 (PDT)
Received: from starbuck.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id x7sm30240578wrg.63.2019.10.23.09.12.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Oct 2019 09:12:10 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Date: Wed, 23 Oct 2019 18:12:01 +0200
Message-Id: <20191023161203.28955-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-Patchwork-Bot: notify
Cc: alsa-devel@alsa-project.org, Russell King <rmk+kernel@armlinux.org.uk>,
 linux-kernel@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>
Subject: [alsa-devel] [PATCH 0/2] ASoC: hdmi-codec: fix locking issue
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

This patchset fixes the locking issue reported by Russell.

As explained a mutex was used as flag and held while returning to
userspace.

Patch 2 is entirely optional and switches from bit atomic operation
to mutex again. I tend to prefer bit atomic operation in this
particular case but either way should be fine.

Jerome Brunet (2):
  Revert "ASoC: hdmi-codec: re-introduce mutex locking"
  ASoC: hdmi-codec: re-introduce mutex locking again

 sound/soc/codecs/hdmi-codec.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

-- 
2.21.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
