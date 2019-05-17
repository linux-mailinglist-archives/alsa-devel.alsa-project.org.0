Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C0EE32170D
	for <lists+alsa-devel@lfdr.de>; Fri, 17 May 2019 12:38:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5766C1615;
	Fri, 17 May 2019 12:37:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5766C1615
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1558089481;
	bh=kNlxUluI6WihUlzBAbr7W6NbK+WiBAwnv/LlTH0yoNU=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=b3vDoZejyK8IypqzBh9iPO7k1P0Yrr31b5tbVRkNQpApU5jXzT2XQ7m23oX1uiL/M
	 waOny9OT32rDphB+jatkTAXxFLSxPwqZclEkG7mj4vadL7CUSPYx0/rQcFs/tviLl1
	 VpAp05sjKWwsWn7YBG++4Z8dbhve3KMSabFEXRmE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AFC16F8972D;
	Fri, 17 May 2019 12:34:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 96154F8972B; Fri, 17 May 2019 12:34:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A7F3EF8972A
 for <alsa-devel@alsa-project.org>; Fri, 17 May 2019 12:34:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A7F3EF8972A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="lcreit09"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=93NvC3nA8VWXUx8wELE1sJsU2NxjB4mv/EYPVnxhEsI=; b=lcreit09Dppi
 RAnP5PfAMTXQCOg+TKV5ofthBL/7CZ08rwdHFzACqODd2xp/PtsE6rdCJ8JQSOOFagjIGYZXLqWzS
 lPQweWIpnW0TPyGN6gvLxd1H1Rlw2ZXAZ4UeHEvVH8liM9OppovI/78Ls8Ps4FCetvLoRikSUneQ7
 vlnxk=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=debutante.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpa (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hRaCI-0001gZ-F8; Fri, 17 May 2019 10:34:42 +0000
Received: by debutante.sirena.org.uk (Postfix, from userid 1000)
 id 467241126D72; Fri, 17 May 2019 11:34:39 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: S.j. Wang <shengjiu.wang@nxp.com>
In-Reply-To: <e6fb6598dd863b74241e10d14652d12fe701845d.1557986478.git.shengjiu.wang@nxp.com>
X-Patchwork-Hint: ignore
Message-Id: <20190517103439.467241126D72@debutante.sirena.org.uk>
Date: Fri, 17 May 2019 11:34:39 +0100 (BST)
Cc: brian.austin@cirrus.com, alsa-devel@alsa-project.org,
 Shengjiu Wang <shengjiu.wang@nxp.com>, tiwai@suse.com,
 linux-kernel@vger.kernel.org, Paul.Handrigan@cirrus.com, lgirdwood@gmail.com,
 Mark Brown <broonie@kernel.org>, stable@vger.kernel.org
Subject: [alsa-devel] Applied "ASoC: cs42xx8: Add regcache mask dirty" to
	the asoc tree
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

   ASoC: cs42xx8: Add regcache mask dirty

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.2

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

From ad6eecbfc01c987e0253371f274c3872042e4350 Mon Sep 17 00:00:00 2001
From: "S.j. Wang" <shengjiu.wang@nxp.com>
Date: Thu, 16 May 2019 06:04:29 +0000
Subject: [PATCH] ASoC: cs42xx8: Add regcache mask dirty

Add regcache_mark_dirty before regcache_sync for power
of codec may be lost at suspend, then all the register
need to be reconfigured.

Fixes: 0c516b4ff85c ("ASoC: cs42xx8: Add codec driver
support for CS42448/CS42888")
Cc: <stable@vger.kernel.org>
Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/cs42xx8.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/codecs/cs42xx8.c b/sound/soc/codecs/cs42xx8.c
index ebb9e0cf8364..28a4ac36c4f8 100644
--- a/sound/soc/codecs/cs42xx8.c
+++ b/sound/soc/codecs/cs42xx8.c
@@ -558,6 +558,7 @@ static int cs42xx8_runtime_resume(struct device *dev)
 	msleep(5);
 
 	regcache_cache_only(cs42xx8->regmap, false);
+	regcache_mark_dirty(cs42xx8->regmap);
 
 	ret = regcache_sync(cs42xx8->regmap);
 	if (ret) {
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
