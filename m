Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A8B8FDDC6
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Nov 2019 13:27:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E8EC8165F;
	Fri, 15 Nov 2019 13:26:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E8EC8165F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573820858;
	bh=MJOzxsS5hQZeX+JFD7iMHKX44Pefnjv4z1P9K8AnqEg=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=RUCCJ2tna3MdL7ySopESW81PztjTi7KOPbFqcuGhvtyupykjLRLH7EINvHAjQXQS7
	 +W6BWbeh1ZiL4iMn1mn6b6/eNg8esKQTMQ1TsqTpAMb9I9GmZydRCfoL1yGOk86Wiu
	 XJKWuZl0ZVbaMoo23lMpE+tYZF7yQ8oAD/SsgHxI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EDC0DF80106;
	Fri, 15 Nov 2019 13:25:13 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E677DF8010A; Fri, 15 Nov 2019 13:25:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5EFC0F800CC
 for <alsa-devel@alsa-project.org>; Fri, 15 Nov 2019 13:25:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5EFC0F800CC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="K/ZlR1z2"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=BKIGa5HhDlQlZZez7CZ30Xkhgbr0IeiisDH3wxta7Nk=; b=K/ZlR1z2URAz
 WZE9KAptoaN1aEa5ORchMKebFkspN5WOef1pYyO7ngnWEQBTIHYwXxYnA/JVR7gulIrm174t538qX
 s1JFeKuubJ/T1TUn5pxqd7qwAiGum0ndPR8hBt7VMQhHSM+2KTHdPetFIIIyQ/2isglsTJPlio6CG
 IerzI=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iVaeq-0000Jg-UP; Fri, 15 Nov 2019 12:25:01 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 26FE12741609; Fri, 15 Nov 2019 12:25:00 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: Peter Ujfalusi <peter.ujfalusi@ti.com>
In-Reply-To: <20191113095445.3211-2-peter.ujfalusi@ti.com>
X-Patchwork-Hint: ignore
Message-Id: <20191115122500.26FE12741609@ypsilon.sirena.org.uk>
Date: Fri, 15 Nov 2019 12:25:00 +0000 (GMT)
Cc: alsa-devel@alsa-project.org, lars@metafoo.de, linux-kernel@vger.kernel.org,
 jsarha@ti.com, lgirdwood@gmail.com, vkoul@kernel.org,
 Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: dmaengine: Use dma_request_chan()
	directly for channel request" to the asoc tree
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

   ASoC: dmaengine: Use dma_request_chan() directly for channel request

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.5

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

From de8cf95231102f0b1d71499b89c93902c9bb7908 Mon Sep 17 00:00:00 2001
From: Peter Ujfalusi <peter.ujfalusi@ti.com>
Date: Wed, 13 Nov 2019 11:54:44 +0200
Subject: [PATCH] ASoC: dmaengine: Use dma_request_chan() directly for channel
 request

dma_request_slave_channel_reason() is:
#define dma_request_slave_channel_reason(dev, name) \
	dma_request_chan(dev, name)

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@ti.com>
Link: https://lore.kernel.org/r/20191113095445.3211-2-peter.ujfalusi@ti.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/soc-generic-dmaengine-pcm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/soc-generic-dmaengine-pcm.c b/sound/soc/soc-generic-dmaengine-pcm.c
index f4c755209e03..a428ff393ea2 100644
--- a/sound/soc/soc-generic-dmaengine-pcm.c
+++ b/sound/soc/soc-generic-dmaengine-pcm.c
@@ -387,7 +387,7 @@ static int dmaengine_pcm_request_chan_of(struct dmaengine_pcm *pcm,
 			name = dmaengine_pcm_dma_channel_names[i];
 		if (config && config->chan_names[i])
 			name = config->chan_names[i];
-		chan = dma_request_slave_channel_reason(dev, name);
+		chan = dma_request_chan(dev, name);
 		if (IS_ERR(chan)) {
 			if (PTR_ERR(chan) == -EPROBE_DEFER)
 				return -EPROBE_DEFER;
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
