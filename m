Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 29DE2216F51
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Jul 2020 16:50:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D04341660;
	Tue,  7 Jul 2020 16:49:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D04341660
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594133439;
	bh=jVoNhcdJ1bPm+8meHqz22BxhPnJbn/OPJX9JqVrw0Xk=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=spb9Tqvtj3RftEYjxye3UtEHZyhl3mexfPRdRvoAOt8tFU2Ckp2fwwKWdcKKqz7tI
	 TWSVIXTtcqT9G9P1rGBHQD20nmujE8LGCGA6QsuZIhhCHr6a1Kt6hQeu9gqfky9MYa
	 43vkjCmBtntr+lWIdzAhHj2j8i3yENKAcyGoW5Ps=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BCE94F80383;
	Tue,  7 Jul 2020 16:38:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 13A18F80350; Tue,  7 Jul 2020 16:38:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 75B4CF80332
 for <alsa-devel@alsa-project.org>; Tue,  7 Jul 2020 16:38:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 75B4CF80332
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="QqqZZ4pE"
Received: by mail-wr1-x444.google.com with SMTP id z13so45410085wrw.5
 for <alsa-devel@alsa-project.org>; Tue, 07 Jul 2020 07:38:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=i3kHcmoqkZhWZ4oxxNqqC7HGSrDg94q7cDYwU1R7wZ0=;
 b=QqqZZ4pESAuIWwDoPRnNoufHsQOPJdYeYXwBBwabjk1uLwS42wFEAqiWGt+bbkxoUW
 Dt3j7tTPi2S2uGuSN7pApq05aDzKTfIvedNoOVayX3DFlIlmVjjshralPJmUdpHAZFHT
 bC02jDQsGPGvkAYuqHMUQ7SAKmIEE5Wyv/WRDH3TsDo4+Bw+1tP3WM07zo8+K5aWDv0T
 kRTLqiFyThI4W4Ar9ywWWAc2Tw43IULOb4U6bNqk+lako8lgAWUP4Y8adbJUjgSe9ayR
 yO5vgvDWxlAskhJoxs7gLDV7z90M4c5hTTn7ZoTzaC/0ksGTuUevFdvu7htJ+Yqa37w+
 Vi9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=i3kHcmoqkZhWZ4oxxNqqC7HGSrDg94q7cDYwU1R7wZ0=;
 b=pQhhot/b4rBEBrpWoyksDsS86dfor6Y0wC4C0OgL2jQETask0UpZng8fvxL5Y1mTkr
 k9uywAiFZXW6J6yv1m6OEedOS4HmqkFEv51MDBk+0rvp2RjYXpvY0vJGv3OxLErONmE/
 1SO+kNCIOqZ2F4qnLj506Hy25l5nGMrQJz3VzPBEfOd5ISSQ1XR1XtNuo6AAOgNCqgVH
 Es0iqQub8r5CP21sGGUXGCTo4sjdJkKVKo2JVFa3+0OFwRh+7+bxsgksX3Zv5TdOoTZm
 VLJlNIQJSKTpnXdmkIhtdQ1yDKLbwKoEsvNaG8dfMtUZQh5LVIanEn08/dvcGlqOQXr1
 C7sA==
X-Gm-Message-State: AOAM530o3Q8S98EfTXy0idcdAOoO3f1NZ0ZkMNA6Gk9HpWUDZsmtNx7N
 9y02qa2htNmGMpyTnCIqcwDOGg==
X-Google-Smtp-Source: ABdhPJwsSC0UeTUN9Csfj74emOCu/UtJQH5pDIqnq5THkRvAxrdrQ5fybem8qUGk6n26vzyQHj4srg==
X-Received: by 2002:a5d:6a04:: with SMTP id m4mr53013495wru.418.1594132692517; 
 Tue, 07 Jul 2020 07:38:12 -0700 (PDT)
Received: from localhost.localdomain ([2.27.35.206])
 by smtp.gmail.com with ESMTPSA id y16sm1276131wro.71.2020.07.07.07.38.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jul 2020 07:38:11 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: broonie@kernel.org, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com
Subject: [PATCH v2 18/28] ASoC: sunxi: sun4i-spdif: Fix misspelling of
 'reg_dac_txdata'
Date: Tue,  7 Jul 2020 15:37:32 +0100
Message-Id: <20200707143742.2959960-19-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200707143742.2959960-1-lee.jones@linaro.org>
References: <20200707143742.2959960-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Marcus Cooper <codekipper@gmail.com>,
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 Andrea Venturi <be17068@iperbole.bo.it>, Chen-Yu Tsai <wens@csie.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Lee Jones <lee.jones@linaro.org>,
 linux-arm-kernel@lists.infradead.org
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

Property name descriptions need to match exactly.

Fixes the following W=1 kernel build warning(s):

 sound/soc/sunxi/sun4i-spdif.c:178: warning: Function parameter or member 'reg_dac_txdata' not described in 'sun4i_spdif_quirks'

Cc: Maxime Ripard <mripard@kernel.org>
Cc: Chen-Yu Tsai <wens@csie.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Andrea Venturi <be17068@iperbole.bo.it>
Cc: Marcus Cooper <codekipper@gmail.com>
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 sound/soc/sunxi/sun4i-spdif.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/sunxi/sun4i-spdif.c b/sound/soc/sunxi/sun4i-spdif.c
index 86779a99df751..326dd45e39dab 100644
--- a/sound/soc/sunxi/sun4i-spdif.c
+++ b/sound/soc/sunxi/sun4i-spdif.c
@@ -167,7 +167,7 @@
 /**
  * struct sun4i_spdif_quirks - Differences between SoC variants.
  *
- * @reg_dac_tx_data: TX FIFO offset for DMA config.
+ * @reg_dac_txdata: TX FIFO offset for DMA config.
  * @has_reset: SoC needs reset deasserted.
  * @val_fctl_ftx: TX FIFO flush bitmask.
  */
-- 
2.25.1

