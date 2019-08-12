Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 58CF689F85
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Aug 2019 15:21:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EC569168C;
	Mon, 12 Aug 2019 15:21:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EC569168C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565616112;
	bh=CgrVpnF8Ew+c5PjHwt3ZHDlTNGNjb6IXRmXOzdhoq8E=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=HFuW3NsUVXV/Rw7lxeXlOd734IZdS0L5gmlXjps1w4QggnaTCwaH5AtWlsx+HMUEX
	 8KFLDq+aFlj7uocxLUDCNotPlxZBPc3vwb7AuEbVtZWsw7fwjkk9h9pPlfnZyZFxa2
	 eoZ1sCkmEJs6R+wx/Ro/DbFRdUwbLHtq/meT5IOw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6417BF80638;
	Mon, 12 Aug 2019 15:15:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E9861F805F8; Mon, 12 Aug 2019 15:10:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 58EB5F805AF
 for <alsa-devel@alsa-project.org>; Mon, 12 Aug 2019 15:09:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 58EB5F805AF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="HVaxgcH6"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=DdtI4apkG1pn1UMa2CCuGADI3+x3gw5GsbYwXIEjhAw=; b=HVaxgcH6YKcJ
 0kMW5bKY6+PToaS2YL/UnBSpZ2lG3DaSc+ehUAAarwwWuaZq5DaIFDAs0IiYMbT46rzlrj59GWmy/
 OfwYYUCOG/ojiNPvllHCXSSae7w4LBs63WlMwE4qrE6zSww97wbDoU74CvK16FS8pwkgUXKbs21zi
 N1EOA=;
Received: from ypsilon.sirena.org.uk ([2001:470:1f1d:6b5::7])
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1hxA56-0001Lh-Cl; Mon, 12 Aug 2019 13:09:48 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id B354D2740CB7; Mon, 12 Aug 2019 14:09:47 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Peter Ujfalusi <peter.ujfalusi@ti.com>
In-Reply-To: <20190812095226.18870-3-peter.ujfalusi@ti.com>
X-Patchwork-Hint: ignore
Message-Id: <20190812130947.B354D2740CB7@ypsilon.sirena.org.uk>
Date: Mon, 12 Aug 2019 14:09:47 +0100 (BST)
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 lgirdwood@gmail.com, kuninori.morimoto.gx@renesas.com
Subject: [alsa-devel] Applied "ASoC: pcm3168a: Allow reconfiguration of
	tdm_slots and slot_width" to the asoc tree
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

   ASoC: pcm3168a: Allow reconfiguration of tdm_slots and slot_width

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

From 6fa4e0cae684d268d309d1b1f929d52e3df5649c Mon Sep 17 00:00:00 2001
From: Peter Ujfalusi <peter.ujfalusi@ti.com>
Date: Mon, 12 Aug 2019 12:52:26 +0300
Subject: [PATCH] ASoC: pcm3168a: Allow reconfiguration of tdm_slots and
 slot_width

When using right_j format and the codec is slave it can support 16bit
format, but only if slot_width == 16, in the same DAI mode the 24 bit
audio can work with 24 or 32 slot_width.

Because of this, the codec and CPU needs to be reconfigured when the sample
format changes.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@ti.com>
Link: https://lore.kernel.org/r/20190812095226.18870-3-peter.ujfalusi@ti.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/pcm3168a.c | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/sound/soc/codecs/pcm3168a.c b/sound/soc/codecs/pcm3168a.c
index 75fa8e9ee894..50ed86d45c26 100644
--- a/sound/soc/codecs/pcm3168a.c
+++ b/sound/soc/codecs/pcm3168a.c
@@ -402,18 +402,6 @@ static int pcm3168a_set_tdm_slot(struct snd_soc_dai *dai, unsigned int tx_mask,
 		return -EINVAL;
 	}
 
-	if (io_params->tdm_slots && io_params->tdm_slots != slots) {
-		dev_err(component->dev, "Not matching slots %d vs %d\n",
-			io_params->tdm_slots, slots);
-		return -EINVAL;
-	}
-
-	if (io_params->slot_width && io_params->slot_width != slot_width) {
-		dev_err(component->dev, "Not matching slot_width %d vs %d\n",
-			io_params->slot_width, slot_width);
-		return -EINVAL;
-	}
-
 	io_params->tdm_slots = slots;
 	io_params->slot_width = slot_width;
 	/* Ignore the not relevant mask for the DAI/direction */
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
