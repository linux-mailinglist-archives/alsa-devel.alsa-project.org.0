Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C63B01F8DD8
	for <lists+alsa-devel@lfdr.de>; Mon, 15 Jun 2020 08:30:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 62543950;
	Mon, 15 Jun 2020 08:29:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 62543950
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592202618;
	bh=0oX5bUFIZPIh6Yu2gNeMesTtKamWr7cyuqNYHulyo2M=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Meb8mdODmQ60jGUQzUtvpJMyQf71bkPwzFlOYYpCo6CucTFiHWz1UDw/AhIkr+0fw
	 Oj2Zfrp7V3L6uA2JFiZ3mjzykBXvt9r5LVC1VoZoQADKEAxWDTRtPt7MVUJsT3tTfn
	 2R7etCBUCGOYxesRFf4VSlYoldBzT6Gu3BDTJnbc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 12D3EF802C2;
	Mon, 15 Jun 2020 08:26:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1F8EDF8022B; Sun, 14 Jun 2020 05:38:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mta-p7.oit.umn.edu (mta-p7.oit.umn.edu [134.84.196.207])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B336BF800CD
 for <alsa-devel@alsa-project.org>; Sun, 14 Jun 2020 05:37:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B336BF800CD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=umn.edu header.i=@umn.edu
 header.b="LGu4gU9j"
Received: from localhost (unknown [127.0.0.1])
 by mta-p7.oit.umn.edu (Postfix) with ESMTP id 49l0Xh4K1Nz9vJs1
 for <alsa-devel@alsa-project.org>; Sun, 14 Jun 2020 03:37:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at umn.edu
Received: from mta-p7.oit.umn.edu ([127.0.0.1])
 by localhost (mta-p7.oit.umn.edu [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id p2JaL0-_lAH7 for <alsa-devel@alsa-project.org>;
 Sat, 13 Jun 2020 22:37:56 -0500 (CDT)
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com
 [209.85.166.200])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mta-p7.oit.umn.edu (Postfix) with ESMTPS id 49l0Xh2dxQz9vJs3
 for <alsa-devel@alsa-project.org>; Sat, 13 Jun 2020 22:37:56 -0500 (CDT)
DMARC-Filter: OpenDMARC Filter v1.3.2 mta-p7.oit.umn.edu 49l0Xh2dxQz9vJs3
DKIM-Filter: OpenDKIM Filter v2.11.0 mta-p7.oit.umn.edu 49l0Xh2dxQz9vJs3
Received: by mail-il1-f200.google.com with SMTP id e5so9519253ill.10
 for <alsa-devel@alsa-project.org>; Sat, 13 Jun 2020 20:37:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=umn.edu; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=IEXT8U99mfgcaOdzCXO1tyuVnx/v3mvO9nIAZY0Vi9A=;
 b=LGu4gU9jBSN6jiOgLF41ABPSsY/SbnVsxr7z9IYaoaFRSa+PwgUohjJtEcBpz0YquI
 vlvAhzT7q3EJefDVovTfAvEKoSA3LEHZjME9tIv1zzQuyrUAitpTSu2JMzm2RmaCxsrb
 uMimGbJPmVjbDStWXv9le/WaB6MzdbE31YruEjQiOP20nslrOHn3fgHA26itdNxlRmh0
 rRvuuE0Jb3zV974QSZ3Nwfc1tFvOWwPyi8UAeqnVFm5bM7paFHLpFxlgEejUZL0dNfzl
 jw4MehN+jaPcLd1otPtLJ2j8VccfnoNzkWPuld3mku/oqw8aetUMdTEiZLjWlh+4hiis
 1V3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=IEXT8U99mfgcaOdzCXO1tyuVnx/v3mvO9nIAZY0Vi9A=;
 b=Fm6OCEZJpRcB2P0E1ZyppSLAdwVBK1/eSgHYsEKZDkLbl3iOZgld0wFXTaPoccXTD8
 laKOAYbdddei/FnSs5p4B2kVCTYffCJ0cYflKw4t8KvWfY18/rd3102ZPrsPm5eqg9ka
 i56G+4yW4sPcIQAWWPAHbBE8yPi5Rc6/O7z8yLOk17VnlhZ/fndIwuQM5Jf6AU8P7Auz
 ECCG1uqpxsnBM1jLE61HBoeve5gCJ6RWFVS9LrhiBOTJJctrWvt46mOwiFau+YkG0n24
 GmVWk/FYqkyhCAimdO2gwjf5h+awfrvm6qL8zjEY+Xj1BPVKtpndDU4IjofoWNj+oXOH
 BDEw==
X-Gm-Message-State: AOAM533EPkMi+ml2Le2tYKVnLR1SKuPVviOMTsbN4TbuY/+OA+o16g+6
 P8Fs9BhcZL2+FNhCdcR7uIqRUGDYzCnp4LPfT74Q272pqmSfFwWDC85ZS7yS9rC3hhd8wVrRREG
 UrC/cGujbTNMct9YDP6S/spGIDj0=
X-Received: by 2002:a92:c103:: with SMTP id p3mr21158774ile.166.1592105875799; 
 Sat, 13 Jun 2020 20:37:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw6w5D3XCbepCNS+UhKMisNZolwPKq5uHZS4sl0d2Z5/SkMwZE8Awl6R55bbPrcEZdeRAKnUA==
X-Received: by 2002:a92:c103:: with SMTP id p3mr21158757ile.166.1592105875467; 
 Sat, 13 Jun 2020 20:37:55 -0700 (PDT)
Received: from qiushi.cs.umn.edu ([2607:ea00:101:3c74:4874:45:bcb4:df60])
 by smtp.gmail.com with ESMTPSA id y13sm5607734iob.51.2020.06.13.20.37.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Jun 2020 20:37:54 -0700 (PDT)
From: wu000273@umn.edu
To: kjlu@umn.edu
Subject: [PATCH] ASoC: img: Fix a reference count leak in img_i2s_in_set_fmt
Date: Sat, 13 Jun 2020 22:37:48 -0500
Message-Id: <20200614033749.2975-1-wu000273@umn.edu>
X-Mailer: git-send-email 2.17.1
X-Mailman-Approved-At: Mon, 15 Jun 2020 08:26:10 +0200
Cc: alsa-devel@alsa-project.org,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 wu000273@umn.edu
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

From: Qiushi Wu <wu000273@umn.edu>

pm_runtime_get_sync() increments the runtime PM usage counter even
when it returns an error code, causing incorrect ref count if
pm_runtime_put_noidle() is not called in error handling paths.
Thus call pm_runtime_put_noidle() if pm_runtime_get_sync() fails.

Signed-off-by: Qiushi Wu <wu000273@umn.edu>
---
 sound/soc/img/img-i2s-in.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/sound/soc/img/img-i2s-in.c b/sound/soc/img/img-i2s-in.c
index e30b66b94bf6..0843235d73c9 100644
--- a/sound/soc/img/img-i2s-in.c
+++ b/sound/soc/img/img-i2s-in.c
@@ -343,8 +343,10 @@ static int img_i2s_in_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 	chan_control_mask = IMG_I2S_IN_CH_CTL_CLK_TRANS_MASK;
 
 	ret = pm_runtime_get_sync(i2s->dev);
-	if (ret < 0)
+	if (ret < 0) {
+		pm_runtime_put_noidle(i2s->dev);
 		return ret;
+	}
 
 	for (i = 0; i < i2s->active_channels; i++)
 		img_i2s_in_ch_disable(i2s, i);
-- 
2.17.1

