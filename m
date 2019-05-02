Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 01BB61116D
	for <lists+alsa-devel@lfdr.de>; Thu,  2 May 2019 04:23:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8447D1738;
	Thu,  2 May 2019 04:22:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8447D1738
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1556763801;
	bh=WOlAQddUabNbIG5B5M/4JwulS0OpDGGHCmmGuTMk7js=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=g6/ksaEyAlFg+gSH9wbui1FhZma2uyYfXbRgdIQH6sxDBy5U2tTrB4TaG31cYzfw+
	 dwfzVf7RW+ohh9QHwmm7XHCIMVfzyqAeGJMa2Dy9lPg6+yR/3Wb97P6SBeRMC/VtDJ
	 EXAHbK6ZDtOWSDKIfkkCh/clYiwfBr1ZlDdqyx7E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1AD72F89743;
	Thu,  2 May 2019 04:18:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C49CEF8972F; Thu,  2 May 2019 04:18:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EDCE2F896EA
 for <alsa-devel@alsa-project.org>; Thu,  2 May 2019 04:18:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EDCE2F896EA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="h10UDky+"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=qPjR5TzRDbnAqxV3DwfYDMNhhBwZAe2KIxcyy2P9zos=; b=h10UDky+3huF
 btSF4G/2IKX2b6vivJBPW/IGONFd3A3bVh0bZ/vrZHQWUs0DuB+dp7Pg3IovUUy5dbvhXvvqcDFdg
 YvWf+WOdz29/LdR2ZxTvxxY9fovVeYIUzc2vfGqVu3jxivs/sSwjSnfksyMeeyAcaqSzUuLvnCf/S
 HNOiI=;
Received: from [211.55.52.15] (helo=finisterre.ee.mobilebroadband)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hM1IT-0005pn-MY; Thu, 02 May 2019 02:18:06 +0000
Received: by finisterre.ee.mobilebroadband (Postfix, from userid 1000)
 id 767DF441D3F; Thu,  2 May 2019 03:18:02 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Wei Yongjun <weiyongjun1@huawei.com>
In-Reply-To: <20190429123713.64280-1-weiyongjun1@huawei.com>
X-Patchwork-Hint: ignore
Message-Id: <20190502021802.767DF441D3F@finisterre.ee.mobilebroadband>
Date: Thu,  2 May 2019 03:18:02 +0100 (BST)
Cc: alsa-devel@alsa-project.org, Baolin Wang <baolin.wang@linaro.org>,
 Chunyan Zhang <zhang.lyra@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 kernel-janitors@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Orson Zhai <orsonzhai@gmail.com>,
 linux-kernel@vger.kernel.org
Subject: [alsa-devel] Applied "ASoC: sprd: Fix to use
	list_for_each_entry_safe() when delete items" to the asoc tree
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

   ASoC: sprd: Fix to use list_for_each_entry_safe() when delete items

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

From 81a812c98b6eda7e3101305d57354433e3edc541 Mon Sep 17 00:00:00 2001
From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Mon, 29 Apr 2019 12:37:13 +0000
Subject: [PATCH] ASoC: sprd: Fix to use list_for_each_entry_safe() when delete
 items

Since we will remove items off the list using list_del() we need
to use a safe version of the list_for_each_entry() macro aptly named
list_for_each_entry_safe().

Fixes: d7bff893e04f ("ASoC: sprd: Add Spreadtrum multi-channel data transfer support")
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
Reviewed-by: Baolin Wang <baolin.wang@linaro.org>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/sprd/sprd-mcdt.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/sprd/sprd-mcdt.c b/sound/soc/sprd/sprd-mcdt.c
index e9318d7a4810..7448015a4935 100644
--- a/sound/soc/sprd/sprd-mcdt.c
+++ b/sound/soc/sprd/sprd-mcdt.c
@@ -978,12 +978,12 @@ static int sprd_mcdt_probe(struct platform_device *pdev)
 
 static int sprd_mcdt_remove(struct platform_device *pdev)
 {
-	struct sprd_mcdt_chan *temp;
+	struct sprd_mcdt_chan *chan, *temp;
 
 	mutex_lock(&sprd_mcdt_list_mutex);
 
-	list_for_each_entry(temp, &sprd_mcdt_chan_list, list)
-		list_del(&temp->list);
+	list_for_each_entry_safe(chan, temp, &sprd_mcdt_chan_list, list)
+		list_del(&chan->list);
 
 	mutex_unlock(&sprd_mcdt_list_mutex);
 
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
