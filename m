Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E3F18F21C
	for <lists+alsa-devel@lfdr.de>; Thu, 15 Aug 2019 19:25:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 166F5165D;
	Thu, 15 Aug 2019 19:24:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 166F5165D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565889909;
	bh=pDr4TnIFbdiknIXI2CSXbzffx4uE8fgNPlzSYDfqn78=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=MS+vr464xKCptY9G0fCcO0j6k6FSfmhS8pkghbjoim6wg3q/VYy6oghP2CBeAQ+zq
	 9fe3J6HcHQAiLGd5N+ezJ0a6rXws9SA9bndiVQNmCW3XMQRcJrNr9cOjwPIVI/jEKF
	 jsZm/UQiLCRFb2Fk1XKfx1mSej1W3bC1E/mNPPmo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6D0F1F8070B;
	Thu, 15 Aug 2019 19:15:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 53ED5F8067C; Thu, 15 Aug 2019 19:15:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wr1-f100.google.com (mail-wr1-f100.google.com
 [209.85.221.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2823EF805AE
 for <alsa-devel@alsa-project.org>; Thu, 15 Aug 2019 19:14:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2823EF805AE
Received: by mail-wr1-f100.google.com with SMTP id j16so2854188wrr.8
 for <alsa-devel@alsa-project.org>; Thu, 15 Aug 2019 10:14:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:message-id:date;
 bh=q2b27kNIK6EqgSJpM3zfR9hAioAbBxEiISceYvWjTXE=;
 b=Zf6KRworD/aO+gjerSq+QP3IagiO5fZlq+vUtrKpjov0L2gcedp+/g5DOUbHYx6UoU
 5VudwIaDyUfft2SQDhzwncg9ccSrm1ZXKm6ceQSiKkpfZW/k2ora8hayJ6xoiygsWqsj
 aXZWBci68eJ9v70+0lQZKm2VsJzGzZWAMP8mO9Ezo4wlNzJmsJBJkje8WCpH2BKotp6E
 5YZYAU7ouaejSjRAfAoru9SGOstTonBv6jefWGn39tThBIsrKKEUnMqJvLZxWJAgav9A
 M7JlSfc0IrEtk2XiyT0X7i3ZF5iphZ7Z1u+EzIbu+fDlYzDlRvMA1Rfy4I7DLXAFs1Yy
 VqJA==
X-Gm-Message-State: APjAAAXUHrC3Sa8a85kTTZV2PWK8sWQKFE8FOdwYyur+ubCxV1xZ1Wr7
 FhWosOEKNnCpcQl2ZWN2ohgcje7E29Zt4/oDon7JePp7SJ1fp2rAosYqUoCwRuFjpQ==
X-Google-Smtp-Source: APXvYqzOz+Zqdf+HSDNjzGbbh9zF2epB8ziADuAl2ufBlIUuKwF+X8RjGSMHN6MqxNFhp+aitzIJF7ZNxJOD
X-Received: by 2002:a5d:6a45:: with SMTP id t5mr6944280wrw.228.1565889265011; 
 Thu, 15 Aug 2019 10:14:25 -0700 (PDT)
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk.
 [2a01:7e01::f03c:91ff:fed4:a3b6])
 by smtp-relay.gmail.com with ESMTPS id b7sm61334wrv.31.2019.08.15.10.14.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Aug 2019 10:14:25 -0700 (PDT)
X-Relaying-Domain: sirena.org.uk
Received: from ypsilon.sirena.org.uk ([2001:470:1f1d:6b5::7])
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1hyJKS-00051c-It; Thu, 15 Aug 2019 17:14:24 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 034DC2742BD6; Thu, 15 Aug 2019 18:14:23 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: YueHaibing <yuehaibing@huawei.com>
In-Reply-To: <20190815090602.9000-1-yuehaibing@huawei.com>
X-Patchwork-Hint: ignore
Message-Id: <20190815171424.034DC2742BD6@ypsilon.sirena.org.uk>
Date: Thu, 15 Aug 2019 18:14:23 +0100 (BST)
Cc: oder_chiou@realtek.com, alsa-devel@alsa-project.org, tiwai@suse.com,
 lgirdwood@gmail.com, linux-kernel@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, bardliao@realtek.com
Subject: [alsa-devel] Applied "ASoC: rt1011: remove unused variable
	'dac_vol_tlv' and 'adc_vol_tlv'" to the asoc tree
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

   ASoC: rt1011: remove unused variable 'dac_vol_tlv' and 'adc_vol_tlv'

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

From 5b366753c1c12feead0ae53b45482f569ed5399c Mon Sep 17 00:00:00 2001
From: YueHaibing <yuehaibing@huawei.com>
Date: Thu, 15 Aug 2019 17:06:02 +0800
Subject: [PATCH] ASoC: rt1011: remove unused variable 'dac_vol_tlv' and
 'adc_vol_tlv'

sound/soc/codecs/rt1011.c:981:35: warning:
 dac_vol_tlv defined but not used [-Wunused-const-variable=]
sound/soc/codecs/rt1011.c:982:35: warning:
 adc_vol_tlv defined but not used [-Wunused-const-variable=]

They are never used, so can be removed.

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
Link: https://lore.kernel.org/r/20190815090602.9000-1-yuehaibing@huawei.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/rt1011.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/sound/soc/codecs/rt1011.c b/sound/soc/codecs/rt1011.c
index 638abcaf52b3..fa34565a3938 100644
--- a/sound/soc/codecs/rt1011.c
+++ b/sound/soc/codecs/rt1011.c
@@ -978,9 +978,6 @@ static bool rt1011_readable_register(struct device *dev, unsigned int reg)
 	}
 }
 
-static const DECLARE_TLV_DB_SCALE(dac_vol_tlv, -9435, 37, 0);
-static const DECLARE_TLV_DB_SCALE(adc_vol_tlv, -1739, 37, 0);
-
 static const char * const rt1011_din_source_select[] = {
 	"Left",
 	"Right",
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
