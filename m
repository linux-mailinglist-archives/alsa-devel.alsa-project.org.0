Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 39B6629E543
	for <lists+alsa-devel@lfdr.de>; Thu, 29 Oct 2020 08:56:21 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CFC02169F;
	Thu, 29 Oct 2020 08:55:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CFC02169F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1603958180;
	bh=cUrKnAjNj4E/pl3sG4er8eAfljczBhav7aXzF4p/f2Q=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=iQyGoUSul5zM61PP9LrDmauD70SGUjBgyqNU+3Pf5mf2E7J4DyUNNISL1N6GHbSrf
	 5kQSBy7KOKNMM+l8EqPD54NRyw+Zf7wB5MqdcyQXHBQ2WAep+qU5Q6ZOmCiiUxI1dG
	 baY54DqA4YvA3ublhJndx9MGZwfJQ2BHi1kwP27Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D3658F8051F;
	Thu, 29 Oct 2020 08:50:15 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 302D3F8020D; Thu, 29 Oct 2020 08:44:40 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 79509F801D8
 for <alsa-devel@alsa-project.org>; Thu, 29 Oct 2020 08:44:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 79509F801D8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="dpXSOm0J"
Received: by mail-pf1-x442.google.com with SMTP id e15so1646688pfh.6
 for <alsa-devel@alsa-project.org>; Thu, 29 Oct 2020 00:44:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UiWE1BDnMzq0w4cStIBBDPtKZjCua/B3Fm6Q5y7KxII=;
 b=dpXSOm0JyRrfZu6jwKKjBwt+khOLjMt/zuXhuZ0xq+dcyzm90bzcocd647Isfuz5yt
 SRyjBEVneC8nsATMpp6ZusV+e1rFTKDZXxXsTiZtXBAqQPPAfeToEDNfksUQoeZ51S5C
 icfesQUgvmiDyFqv25rtw8jFbZGX0EaLxpY7WHJT5bLTepargjKHO3ZchaQzYzUBwKke
 +FnYKpRUzjSg5chE747eSDPNkLdORqDYKhCzD7Lv1zqc0vuMLw/wapZvyACTqdI3i1pT
 to4pkCiBwEro1T1gUu5i6Mf3DI0Cs6DFpCDq/924BHimW8HMhDjZu57JhmnYN9Q1j1YE
 K5wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UiWE1BDnMzq0w4cStIBBDPtKZjCua/B3Fm6Q5y7KxII=;
 b=gUhV/zDgIBqjll8+RWIiZk8YX49UMbqTxnEU62tpP3Iq2py2gF1Zj6cFVVffFfY5TM
 0H6byt3NwYNdpoabFwQ068rX3Tb/mDTNCk0MxZYeK6NU421HUPF7AsEPRFDJPZqr+94+
 bJlTXyxKoRSeFBsjh0TVlMQryAR+qH2wlMloyZ2Aez/74vPQx0MpOZXi5dFrlh8ZMC0b
 0inrDRpgoJIbn3mj9jFBPHilMWxwqY3bBsir/0EqOWk/iEMLzlfCzmmlXeI3f9EhD2Qe
 agBWxZpye9uIRMtLh+uqG1QMydFn+9I3bj+esRZpEoKm4v4F6UVJp7Mu1XPV3MwnDGce
 Qtbw==
X-Gm-Message-State: AOAM533dN/EyDRlN1vHsvzUMADK2U4QUh1SucdwcpnigdtlCiqwV/pDT
 e7GLxVHMTpIYOq0QfHA++V4=
X-Google-Smtp-Source: ABdhPJw+g/uyNSWUT43pQjWbmj0HYrQtDyg3buKh1aC7FdNCWaAB7PGuvClSfB5HBIPm6hc6PiDxOw==
X-Received: by 2002:a63:7c56:: with SMTP id l22mr264873pgn.19.1603957476052;
 Thu, 29 Oct 2020 00:44:36 -0700 (PDT)
Received: from localhost ([2409:8a28:3c42:6840:9efc:e8ff:fef2:1cdc])
 by smtp.gmail.com with ESMTPSA id w6sm1560937pgr.71.2020.10.29.00.44.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Oct 2020 00:44:35 -0700 (PDT)
From: Coiby Xu <coiby.xu@gmail.com>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Subject: [PATCH 14/25] ASoC: stm32: i2s: remove unnecessary CONFIG_PM_SLEEP
Date: Thu, 29 Oct 2020 15:42:50 +0800
Message-Id: <20201029074301.226644-14-coiby.xu@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201029074301.226644-1-coiby.xu@gmail.com>
References: <20201029074301.226644-1-coiby.xu@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 29 Oct 2020 08:49:55 +0100
Cc: "moderated list:STM32 AUDIO ASoC DRIVERS" <alsa-devel@alsa-project.org>,
 Olivier Moysan <olivier.moysan@st.com>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Arnaud Pouliquen <arnaud.pouliquen@st.com>,
 Liam Girdwood <lgirdwood@gmail.com>, open list <linux-kernel@vger.kernel.org>,
 Mark Brown <broonie@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "moderated list:ARM/STM32 ARCHITECTURE"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "moderated list:ARM/STM32 ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
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

SET_SYSTEM_SLEEP_PM_OPS has already took good care of CONFIG_PM_CONFIG.

Signed-off-by: Coiby Xu <coiby.xu@gmail.com>
---
 sound/soc/stm/stm32_i2s.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/sound/soc/stm/stm32_i2s.c b/sound/soc/stm/stm32_i2s.c
index 7c4d63c33f15..138acfb26882 100644
--- a/sound/soc/stm/stm32_i2s.c
+++ b/sound/soc/stm/stm32_i2s.c
@@ -984,7 +984,6 @@ static int stm32_i2s_probe(struct platform_device *pdev)
 
 MODULE_DEVICE_TABLE(of, stm32_i2s_ids);
 
-#ifdef CONFIG_PM_SLEEP
 static int stm32_i2s_suspend(struct device *dev)
 {
 	struct stm32_i2s_data *i2s = dev_get_drvdata(dev);
@@ -1002,7 +1001,6 @@ static int stm32_i2s_resume(struct device *dev)
 	regcache_cache_only(i2s->regmap, false);
 	return regcache_sync(i2s->regmap);
 }
-#endif /* CONFIG_PM_SLEEP */
 
 static const struct dev_pm_ops stm32_i2s_pm_ops = {
 	SET_SYSTEM_SLEEP_PM_OPS(stm32_i2s_suspend, stm32_i2s_resume)
-- 
2.28.0

