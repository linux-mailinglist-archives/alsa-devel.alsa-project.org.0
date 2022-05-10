Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CFA0E521F19
	for <lists+alsa-devel@lfdr.de>; Tue, 10 May 2022 17:36:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 70FE11916;
	Tue, 10 May 2022 17:35:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 70FE11916
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652196969;
	bh=sl838P9+RDepr5Ww3vajBnLTKNXBUtJlImr+gdvjUwM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=a5IYm1Zk/pJIs/EBs1+fp+wgFMNlSNir6HS5lHdpRfyjPtkZ9tfxoyqY3RX8DV430
	 X/BspFSYsFkSlBUC7L8jNk8QhwnKXxc+rJjNMSQstR3YWYn3FtPBCmRKcOEbTNRYyD
	 TlMw9qD3MtBuMssiBcPaWykQ/rFVzMjy2oNL8F3w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 759A7F80539;
	Tue, 10 May 2022 17:34:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 690B1F80538; Tue, 10 May 2022 17:34:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE, T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D1566F80536
 for <alsa-devel@alsa-project.org>; Tue, 10 May 2022 17:33:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D1566F80536
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="RDmrB2J1"
Received: by mail-pj1-x102d.google.com with SMTP id
 a15-20020a17090ad80f00b001dc2e23ad84so2309547pjv.4
 for <alsa-devel@alsa-project.org>; Tue, 10 May 2022 08:33:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/E2oYMHtBAv9GRmZnfohgrg/949ahcguOuaoSrbKbFI=;
 b=RDmrB2J1ZPEIKprdrdCO4avF6oVrb5+pne/vzaqtN87noNp1Bli0oHQ6wyNpTU5vI1
 0SMhWzqr/HweH8BysNB5VTufUNTaKfODRGH5FgOUYQ1X4JaIF/BwdanaQDrV2rglyxPt
 gIewzpg+83SMO+qXQynhd74vUUH+dm9cIht1XWcryYKFAbDvU8Uilwfs2axnl1zXzElJ
 NXAYgg1A06xTdfzeiA3A8G57Mz1A8mJIf/qsKD98jkERgTPWi9bW4xtie1blxVu3ulTS
 9zMUXo4w1IAjkCcy0283xKmVQIlCE5QKfr5XSqXAddvBxly0Fow8UPJhqaWohu3WG3Qs
 30Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/E2oYMHtBAv9GRmZnfohgrg/949ahcguOuaoSrbKbFI=;
 b=f6vvubjMu/IVgk7hpYKOhL/ptTxm3zFtYf8wdMXxTySCitunJWEDm1xLOr/VfSnOF3
 8NyUsgEkwVFg5FMx6Cl25GVxa96kxfpMW6qe93CLuM6zbiuls+NBOT/4cCIGQfx2X+8u
 gt+3m/4NLLG7VjuaPWV3HF8yhSO2+aGTGIsKhy/wbtEckOMsCx6E3d9xtylNZks2IiUB
 4jjyA8slIUDml9Vf76aRUj5w8hlVl+x1+kqnggGhG8AVEELEBer2GNiqaUmHwxzfMZ/k
 ZEh0zRMlyD6uUbwa8WAdfD9/4NyjnqXJAae0fcZYfu06v76Scq16+j7BtGxOWBW7zW5k
 Z6kg==
X-Gm-Message-State: AOAM530baUrgCWwrjs2acBm+s9rtxDzYg2gpBU3au3Br9NGA0yfsPK9g
 uaV/UPuMG8B1G+l2qfWFvg==
X-Google-Smtp-Source: ABdhPJy9vXUe8rOvHkj/a1GsFzkDy1LxLZuiQxGOh9KaM/XcRQNRmQ/qpQDd7DGC190YEyfTcsaVTA==
X-Received: by 2002:a17:90b:4f41:b0:1de:bd14:7721 with SMTP id
 pj1-20020a17090b4f4100b001debd147721mr149484pjb.9.1652196838221; 
 Tue, 10 May 2022 08:33:58 -0700 (PDT)
Received: from localhost.localdomain ([144.202.91.207])
 by smtp.gmail.com with ESMTPSA id
 cd10-20020a056a00420a00b0050dc76281d0sm11104248pfb.170.2022.05.10.08.33.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 May 2022 08:33:57 -0700 (PDT)
From: Zheyu Ma <zheyuma97@gmail.com>
To: james.schulman@cirrus.com, david.rhodes@cirrus.com,
 tanureal@opensource.cirrus.com, rf@opensource.cirrus.com,
 lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 oder_chiou@realtek.com
Subject: [PATCH 6/6] ASoC: wm8903: Fix the error handling of wm8903_i2c_probe()
Date: Tue, 10 May 2022 23:32:51 +0800
Message-Id: <20220510153251.1741210-7-zheyuma97@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220510153251.1741210-1-zheyuma97@gmail.com>
References: <20220510153251.1741210-1-zheyuma97@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 Zheyu Ma <zheyuma97@gmail.com>, linux-kernel@vger.kernel.org
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

The driver should goto label 'err' when failing to request the irq.

Signed-off-by: Zheyu Ma <zheyuma97@gmail.com>
---
 sound/soc/codecs/wm8903.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/wm8903.c b/sound/soc/codecs/wm8903.c
index ddcef11dce7c..3c95c2aea515 100644
--- a/sound/soc/codecs/wm8903.c
+++ b/sound/soc/codecs/wm8903.c
@@ -2131,7 +2131,7 @@ static int wm8903_i2c_probe(struct i2c_client *i2c)
 		if (ret != 0) {
 			dev_err(wm8903->dev, "Failed to request IRQ: %d\n",
 				ret);
-			return ret;
+			goto err;
 		}
 
 		/* Enable write sequencer interrupts */
-- 
2.25.1

