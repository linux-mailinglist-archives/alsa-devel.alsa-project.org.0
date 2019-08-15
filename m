Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 15E678F1F0
	for <lists+alsa-devel@lfdr.de>; Thu, 15 Aug 2019 19:18:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A7A831657;
	Thu, 15 Aug 2019 19:18:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A7A831657
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565889535;
	bh=gsx+0gsa8m3IM7GxSOEtfpjmr7AsC+iQTdvQps7A3vU=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=URvVhwtKs++Y/mkjpEE70BYdNgpiwATpkAsO5S7cokluqJFTyvpcYZgyXHhPwRyAo
	 0cRF7thncICPrOcR/knkOSU7eRkCmM3vrp1q4xs1Ellob61xj5VS5lplCA2ZvksEBi
	 887FZjxTE7jdyakJgS0GUYbWAwbbt2dlVU5KxpwE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5626DF8065E;
	Thu, 15 Aug 2019 19:14:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 19B68F80659; Thu, 15 Aug 2019 19:14:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wm1-f98.google.com (mail-wm1-f98.google.com
 [209.85.128.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AA9DCF805A0
 for <alsa-devel@alsa-project.org>; Thu, 15 Aug 2019 19:14:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AA9DCF805A0
Received: by mail-wm1-f98.google.com with SMTP id o4so1874617wmh.2
 for <alsa-devel@alsa-project.org>; Thu, 15 Aug 2019 10:14:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:message-id:date;
 bh=KkPpDRxBh4y4Ugsa/l+moUzY5JvfhTqXMrzYyAMXcys=;
 b=TBsC55G+stv4QzjvH+z+l7JBsaan6ZNXSPQXApxtYGCh6xSHI0NgSIyTXjb5D77vPP
 GedzcoiN/yuVyPbp8bJBqTwfy3Gf2Si4rTGF1zFMe07+etitKufEKxHm8jCi0FDhFfzV
 txTLW8wNBmeTdXv9x174dnMDPUcVtTNi7/XI2Dq26HEUsZd/e90bDPY7KPzEb7zT+NB8
 95gdsPoba5/iuhFMA3N4aTCWysueENKfb7sItp/GycMb+PeBWTJvaX4CjFNhnYND5fuz
 4+sMLJQjL8lehqALNY79glsDqGo7F/AauRxQifDpKqJU6Lo/Bhrtl03DtxnqXxGd6r2t
 4edA==
X-Gm-Message-State: APjAAAW50uHKpLWVO9eSTNCQ7lAjk7c/gT/0j2Qfvb79RxSG5j0QaLz/
 oyIEW7/9NliE//9dl9xC/E1V+SlBQ3kgARFEg/85SqQ4mPI2UUghaCOAcfE/tHFfFQ==
X-Google-Smtp-Source: APXvYqxL31/i+9qxWSQ9K0DwiRE3HvKdRQbaqHhmRhxUp+ImMJz5EPYbVHkr6XpYVk+FdqMC5l2hb8BOQuqO
X-Received: by 2002:a05:600c:2255:: with SMTP id
 a21mr3617574wmm.119.1565889264018; 
 Thu, 15 Aug 2019 10:14:24 -0700 (PDT)
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk.
 [2a01:7e01::f03c:91ff:fed4:a3b6])
 by smtp-relay.gmail.com with ESMTPS id x63sm13450wmb.9.2019.08.15.10.14.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Aug 2019 10:14:23 -0700 (PDT)
X-Relaying-Domain: sirena.org.uk
Received: from ypsilon.sirena.org.uk ([2001:470:1f1d:6b5::7])
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1hyJKR-00051R-PY; Thu, 15 Aug 2019 17:14:23 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 318EC2742BD6; Thu, 15 Aug 2019 18:14:23 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: YueHaibing <yuehaibing@huawei.com>
In-Reply-To: <20190815092056.28724-1-yuehaibing@huawei.com>
X-Patchwork-Hint: ignore
Message-Id: <20190815171423.318EC2742BD6@ypsilon.sirena.org.uk>
Date: Thu, 15 Aug 2019 18:14:23 +0100 (BST)
Cc: alsa-devel@alsa-project.org, gustavo@embeddedor.com, tiwai@suse.com,
 lgirdwood@gmail.com, linux-kernel@vger.kernel.org,
 Hulk Robot <hulkci@huawei.com>, Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: es8328: remove unused variable
	'pga_tlv'" to the asoc tree
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

The patch

   ASoC: es8328: remove unused variable 'pga_tlv'

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.4

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.  

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

From 97d39be9ce5befc2e36f15d0df33832e0f633565 Mon Sep 17 00:00:00 2001
From: YueHaibing <yuehaibing@huawei.com>
Date: Thu, 15 Aug 2019 17:20:56 +0800
Subject: [PATCH] ASoC: es8328: remove unused variable 'pga_tlv'

sound/soc/codecs/es8328.c:102:35: warning:
 pga_tlv defined but not used [-Wunused-const-variable=]

They are never used, so can be removed.

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: YueHaibing <yuehaibing@huawei.com>
Link: https://lore.kernel.org/r/20190815092056.28724-1-yuehaibing@huawei.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/es8328.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/codecs/es8328.c b/sound/soc/codecs/es8328.c
index 822a25a8f53c..4a3d303fedfb 100644
--- a/sound/soc/codecs/es8328.c
+++ b/sound/soc/codecs/es8328.c
@@ -99,7 +99,6 @@ static SOC_ENUM_SINGLE_DECL(adcpol,
 
 static const DECLARE_TLV_DB_SCALE(play_tlv, -3000, 100, 0);
 static const DECLARE_TLV_DB_SCALE(dac_adc_tlv, -9600, 50, 0);
-static const DECLARE_TLV_DB_SCALE(pga_tlv, 0, 300, 0);
 static const DECLARE_TLV_DB_SCALE(bypass_tlv, -1500, 300, 0);
 static const DECLARE_TLV_DB_SCALE(mic_tlv, 0, 300, 0);
 
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
