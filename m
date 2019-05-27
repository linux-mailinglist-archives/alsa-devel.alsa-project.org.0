Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CE6A2B931
	for <lists+alsa-devel@lfdr.de>; Mon, 27 May 2019 18:40:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F11A117B1;
	Mon, 27 May 2019 18:39:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F11A117B1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1558975230;
	bh=03WIMzK6Bo7lxtic5l12dBeaXA/c5q8UqHN1/Z641no=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=oyluU6skQf5JEsdBbc4kDGOiM1qWuOuM0an3lkyDJx1BjUjYUglQfXbEkPsVLmnvD
	 qqXJggGdoqr1TLsZStHmdIN7zHKgzUXuYWez32jjYds/u7gL0ZFJKFE1wjq8LFuQTr
	 mXp6oLSEjkrEGTP9NpkWmLWQG7pUFhyPf2RmdlVI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3EB5CF896E4;
	Mon, 27 May 2019 18:38:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 25A90F896E4; Mon, 27 May 2019 18:38:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8600FF8065A
 for <alsa-devel@alsa-project.org>; Mon, 27 May 2019 18:38:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8600FF8065A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com
 header.i=@baylibre-com.20150623.gappssmtp.com header.b="t9o+VHkG"
Received: by mail-wr1-x443.google.com with SMTP id w13so9039940wru.11
 for <alsa-devel@alsa-project.org>; Mon, 27 May 2019 09:38:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4Bqi68PuSXLVEVLuO7LSaFlse4/AD2TLXqhrMO5+t/s=;
 b=t9o+VHkGvIvT0HDb8ZjOiqBRLOoUc5kWeyRgmYho2RPGRmH0ZnuXzcqn3kg01UlU2j
 JX39ymiB/xdXu3uAGlkcFCnYWbn6kS6rctKh+njpJV/Qey101yz+wlHe46vnii8ReG/X
 l96Pl1jis1PIdZ5RMMvKa+WCa/2/yyqNQ+oB4MgCEjRF7XB6SD8AGKFN8jS24U6UCVg7
 2/bL/EGszKhFv7I03dnmDghnsDfKRRU3elOEVuIx5uC2mexaribalgCtbZBElxBH8Kra
 VbFzUA2XBYYWEaq3QV740Zv2bULz7WdVS+ntoD7Cans8e5YEK9esPTHEGz7J0+YvNAkT
 otOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4Bqi68PuSXLVEVLuO7LSaFlse4/AD2TLXqhrMO5+t/s=;
 b=llUlIXRdQ5i9bfS/y9wYqZcdrQ+kbRIE18IIzFELO1ZHFzp4QOKE/ZHH6JXQkTfEc7
 PybqWNnfG5pb8Q33sK47cSPG5sZ04NDidiVDhvXlF8jBjlV4RczpgI3//ncebtxDBy/z
 IelISJj5Bwrmx6QOtVn5CHbxBvbNktlIv/qj5FvX04LxVP6d1qYDCYbn0FessoSurNx0
 LUuiiSPv7mT+mVc6LbWaSiyQz3GC+orY8DgEwgrqFDN/TT3W6fSWdIPbt9D5yc8Rk1x9
 kgjWhD+Mib8yfVuCPIUdRl2q4s/zgfNz9MzSmcq41bamCPBSrTgN47VpovPXRSFfuHbB
 FEnQ==
X-Gm-Message-State: APjAAAWCti+buMjRjLB07AmNQLIjyiTiL7pSwjnZuetTq/adX264uZiC
 /yGyLBCI61rq9cvs07v3RenDcg==
X-Google-Smtp-Source: APXvYqwW5D2MiFDPr61jSEXTAG4KZCBQjmYLwJacCtcfEehqN4vs2Rft948Q6iSOpPvwE9NSns6L7w==
X-Received: by 2002:a5d:6108:: with SMTP id v8mr19108589wrt.150.1558975119723; 
 Mon, 27 May 2019 09:38:39 -0700 (PDT)
Received: from mjourdan-pc.numericable.fr (abo-99-183-68.mtp.modulonet.fr.
 [85.68.183.99])
 by smtp.gmail.com with ESMTPSA id k8sm9483173wrp.74.2019.05.27.09.38.39
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 27 May 2019 09:38:39 -0700 (PDT)
From: Maxime Jourdan <mjourdan@baylibre.com>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 alsa-devel@alsa-project.org
Date: Mon, 27 May 2019 18:38:09 +0200
Message-Id: <20190527163809.28104-1-mjourdan@baylibre.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Cc: Maxime Jourdan <mjourdan@baylibre.com>, linux-kernel@vger.kernel.org,
 Jerome Brunet <jbrunet@baylibre.com>
Subject: [alsa-devel] [PATCH] ASoC: max98357a: Show KConfig entry
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

The SEI510 board features a standalone MAX98357A codec.
Add a tristate prompt to allow selecting the codec.

Signed-off-by: Maxime Jourdan <mjourdan@baylibre.com>
---
 sound/soc/codecs/Kconfig | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
index e730d47ac85b..48c94065072a 100644
--- a/sound/soc/codecs/Kconfig
+++ b/sound/soc/codecs/Kconfig
@@ -708,7 +708,8 @@ config SND_SOC_MAX98095
        tristate
 
 config SND_SOC_MAX98357A
-       tristate
+	tristate "Maxim MAX98357A CODEC"
+	depends on GPIOLIB
 
 config SND_SOC_MAX98371
        tristate
-- 
2.21.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
