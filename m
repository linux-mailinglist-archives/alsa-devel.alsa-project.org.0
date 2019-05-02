Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 477F31117D
	for <lists+alsa-devel@lfdr.de>; Thu,  2 May 2019 04:30:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CEDF31755;
	Thu,  2 May 2019 04:29:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CEDF31755
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1556764205;
	bh=/SS2FkuDURe+kJJZ01CV0KrhVg3hIXVMSufJ1K72ED8=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=q3RWGzq/zMcuA7tOCAOnmj5A6XNLmWjlucsP8Jw1H0q2TnXfmyB9IrHzTNN/jH+Kk
	 foikvQ4QFRb3C+umku81hw04cDSEP740kiI2vEKSrlX5M5tECOlw1+WuKegZvMb218
	 k0v9yy802S886lVb8BI0EEDmI1dkhIiUs7Xg6d8s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8E0B1F89773;
	Thu,  2 May 2019 04:19:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 67BA3F8974D; Thu,  2 May 2019 04:18:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C1265F8972F
 for <alsa-devel@alsa-project.org>; Thu,  2 May 2019 04:18:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C1265F8972F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="W8AbRtvW"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=QjCPGci74UmifJtpBqzOP72e1ynNhraaHvIcf4rf0co=; b=W8AbRtvWtJpZ
 R6IG8s4CIHH0C2oDH5Vs/J5a39kA7O7QUSS9QdngbpqgtsvdLmHWlDXKg29TBcub/TLRLOJ5Ersex
 UhP4nTrRYqbQKcNezLxpAXyUHSFEWZrapbY+dDE3TspbbfdAmHxUsEHVaPDR9e1/ccWElkYH26VUL
 FKGew=;
Received: from [211.55.52.15] (helo=finisterre.ee.mobilebroadband)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hM1Il-0005re-MR; Thu, 02 May 2019 02:18:24 +0000
Received: by finisterre.ee.mobilebroadband (Postfix, from userid 1000)
 id 053F2441D3C; Thu,  2 May 2019 03:18:19 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Kangjie Lu <kjlu@umn.edu>
In-Reply-To: <20190315035120.25913-1-kjlu@umn.edu>
X-Patchwork-Hint: ignore
Message-Id: <20190502021820.053F2441D3C@finisterre.ee.mobilebroadband>
Date: Thu,  2 May 2019 03:18:19 +0100 (BST)
Cc: Brian Austin <brian.austin@cirrus.com>, alsa-devel@alsa-project.org,
 Takashi Iwai <tiwai@suse.com>, kjlu@umn.edu, linux-kernel@vger.kernel.org,
 Paul Handrigan <Paul.Handrigan@cirrus.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 pakki001@umn.edu
Subject: [alsa-devel] Applied "ASoC: cs43130: fix a NULL pointer
	dereference" to the asoc tree
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

   ASoC: cs43130: fix a NULL pointer dereference

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git 

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

From a2be42f18d409213bb7e7a736e3ef6ba005115bb Mon Sep 17 00:00:00 2001
From: Kangjie Lu <kjlu@umn.edu>
Date: Thu, 14 Mar 2019 22:51:20 -0500
Subject: [PATCH] ASoC: cs43130: fix a NULL pointer dereference

In case create_singlethread_workqueue fails, the fix returns
-ENOMEM to avoid potential NULL pointer dereference.

Signed-off-by: Kangjie Lu <kjlu@umn.edu>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/cs43130.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/codecs/cs43130.c b/sound/soc/codecs/cs43130.c
index 3f7b255587e6..80d672710eae 100644
--- a/sound/soc/codecs/cs43130.c
+++ b/sound/soc/codecs/cs43130.c
@@ -2322,6 +2322,8 @@ static int cs43130_probe(struct snd_soc_component *component)
 			return ret;
 
 		cs43130->wq = create_singlethread_workqueue("cs43130_hp");
+		if (!cs43130->wq)
+			return -ENOMEM;
 		INIT_WORK(&cs43130->work, cs43130_imp_meas);
 	}
 
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
