Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B66125958
	for <lists+alsa-devel@lfdr.de>; Tue, 21 May 2019 22:46:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 922AC1668;
	Tue, 21 May 2019 22:45:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 922AC1668
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1558471562;
	bh=RJMmmJXoomxqfRDHjCEPNBeoZcI4llLmyc949JNbFAU=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=huI/SdmeST2x9yi2gy6MsnMV5BvO78Xokw7RfWN0kqSBd3CbpqV3f3KL+bdR8MMfg
	 2Hn2kjyu4U692ZUDHbSsBh/mKYiSfj8B462wd0P8GC70ngtYg+CcOi6QtXwJzNDO/F
	 TRHSddGqzMJRSIFhgGQmP/sMbgGddV5sVqY4NDy0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0E265F8973B;
	Tue, 21 May 2019 22:42:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A1BACF89670; Tue, 21 May 2019 22:42:49 +0200 (CEST)
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CDD7AF89707
 for <alsa-devel@alsa-project.org>; Tue, 21 May 2019 22:32:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CDD7AF89707
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="PFHy+I7t"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=dAzJxnon9GLWXKQiC3q94Xs+4pz9rlIkJSYLfHOSoME=; b=PFHy+I7tunml
 JplaOoFq40Abav1hbn9Ly54bfJ+PU0petCYMHhJPpwxGKl9iCIyykEAMz/C4lC1zz7zxoGkpP7FQ3
 DukSfEigmPfsb5gOP8zDYLF33B4HKfnElWIdhns7SSczVbgzBIe5lUKIf+qBkKr93Z3U6shmJfHDh
 J10S4=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=debutante.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpa (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hTBRE-0001yG-Eo; Tue, 21 May 2019 20:32:44 +0000
Received: by debutante.sirena.org.uk (Postfix, from userid 1000)
 id 02D251126D17; Tue, 21 May 2019 21:32:40 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Jiaxin Yu <jiaxin.yu@mediatek.com>
In-Reply-To: <1558430978-2440-2-git-send-email-jiaxin.yu@mediatek.com>
X-Patchwork-Hint: ignore
Message-Id: <20190521203241.02D251126D17@debutante.sirena.org.uk>
Date: Tue, 21 May 2019 21:32:40 +0100 (BST)
Cc: alsa-devel@alsa-project.org, wsd_upstream@mediatek.com,
 Jiaxin@sirena.org.uk, garlic.tseng@mediatek.com, tzungbi@google.com,
 Mark Brown <broonie@kernel.org>, linux-mediatek@lists.infradead.org,
 kaichieh.chuang@mediatek.com
Subject: [alsa-devel] Applied "ASoC: Mediatek: MT8183: fix compile error" to
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

   ASoC: Mediatek: MT8183: fix compile error

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.3

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

From e355d3de196fe08e4de99bc0521c25a36c903b1b Mon Sep 17 00:00:00 2001
From: Jiaxin Yu <jiaxin.yu@mediatek.com>
Date: Tue, 21 May 2019 17:29:37 +0800
Subject: [PATCH] ASoC: Mediatek: MT8183: fix compile error

mtk_regmap_update_bits() has been changed from four
parameters to five parameters.

Fixes: 1628fc3f4771 ("ASoC: Mediatek: MT8183: add memory interface data align")

Signed-off-by: Jiaxin Yu <jiaxin.yu@mediatek.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/mediatek/common/mtk-afe-fe-dai.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/sound/soc/mediatek/common/mtk-afe-fe-dai.c b/sound/soc/mediatek/common/mtk-afe-fe-dai.c
index 19048c3dc324..d16563408465 100644
--- a/sound/soc/mediatek/common/mtk-afe-fe-dai.c
+++ b/sound/soc/mediatek/common/mtk-afe-fe-dai.c
@@ -266,8 +266,7 @@ int mtk_afe_fe_prepare(struct snd_pcm_substream *substream,
 			       1, hd_audio, memif->data->hd_shift);
 
 	mtk_regmap_update_bits(afe->regmap, memif->data->hd_align_reg,
-			       memif->data->hd_align_mshift,
-			       hd_align ? memif->data->hd_align_mshift : 0);
+			       1, hd_align, memif->data->hd_align_mshift);
 
 	return 0;
 }
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
