Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D8F34CEDC
	for <lists+alsa-devel@lfdr.de>; Thu, 20 Jun 2019 15:34:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9D98F82A;
	Thu, 20 Jun 2019 15:34:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9D98F82A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1561037698;
	bh=kTGOwisEch//8cixIbTw1leVELe4T97bsJ1i/aUz/AY=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=Mn1YRQP6p8rQLY41QCqNgHEkzsAICIDHvWJNYHoqEaWg8SiBEb7Wnc+yMr1dtHszW
	 eh5J4lugbqvnUmmMr+uqBSuXTPzrzR7hz+osccv5IoXezM2yOzt3Euv7h6LYZsoCRV
	 cZhlRjrdkdnHrJWbB90/ow8AUEP6/cZH//KzKxBw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A9DE9F8972F;
	Thu, 20 Jun 2019 15:32:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 78902F8971F; Thu, 20 Jun 2019 15:32:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: ***
X-Spam-Status: No, score=3.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_SBL_CSS,SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7E39EF80C15
 for <alsa-devel@alsa-project.org>; Thu, 20 Jun 2019 15:32:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7E39EF80C15
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="l69ouT0l"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=PC5mfXvSh/ZM92b89xa76WBhhpXYhndn1bF44N3qn2I=; b=l69ouT0ldt3V
 Ih1h/ZxMEvy4g6bRIpBD2EEiwQFzPHeINvns+QgdT7FWK8F25mm8fAXzb41IGACw6vAiRuPPXHvNh
 3GDzaarBekhpI+muEewhZ+VjgGanVgUDc4E1ra+065I2u3EyAvV46A4LTfYT9AFw0QD3TdjaDXFzU
 CQ3Qw=;
Received: from [2001:470:1f1d:6b5:7e7a:91ff:fede:4a45]
 (helo=finisterre.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hdxAv-0000ia-9I; Thu, 20 Jun 2019 13:32:25 +0000
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
 id 8E2D744004B; Thu, 20 Jun 2019 14:32:24 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Peter Ujfalusi <peter.ujfalusi@ti.com>
In-Reply-To: <20190620092002.13766-3-peter.ujfalusi@ti.com>
X-Patchwork-Hint: ignore
Message-Id: <20190620133224.8E2D744004B@finisterre.sirena.org.uk>
Date: Thu, 20 Jun 2019 14:32:24 +0100 (BST)
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 lgirdwood@gmail.com, jsarha@ti.com, misael.lopez@ti.com
Subject: [alsa-devel] Applied "ASoC: ti: davinci-mcasp: Fix slot mask
	settings when using multiple AXRs" to the asoc tree
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

   ASoC: ti: davinci-mcasp: Fix slot mask settings when using multiple AXRs

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

From fd14f4436fd47d5418023c90e933e66d3645552e Mon Sep 17 00:00:00 2001
From: Peter Ujfalusi <peter.ujfalusi@ti.com>
Date: Thu, 20 Jun 2019 12:20:02 +0300
Subject: [PATCH] ASoC: ti: davinci-mcasp: Fix slot mask settings when using
 multiple AXRs

If multiple serializers are connected in the system and the number of
channels will need to use more than one serializer the mask to enable the
serializers were left to 0 if tdm_mask is provided

Fixes: dd55ff8346a97 ("ASoC: davinci-mcasp: Add set_tdm_slots() support")

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@ti.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/ti/davinci-mcasp.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/sound/soc/ti/davinci-mcasp.c b/sound/soc/ti/davinci-mcasp.c
index 8bec0dc4f754..62222915d632 100644
--- a/sound/soc/ti/davinci-mcasp.c
+++ b/sound/soc/ti/davinci-mcasp.c
@@ -946,14 +946,13 @@ static int mcasp_i2s_hw_param(struct davinci_mcasp *mcasp, int stream,
 		active_slots = hweight32(mcasp->tdm_mask[stream]);
 		active_serializers = (channels + active_slots - 1) /
 			active_slots;
-		if (active_serializers == 1) {
+		if (active_serializers == 1)
 			active_slots = channels;
-			for (i = 0; i < total_slots; i++) {
-				if ((1 << i) & mcasp->tdm_mask[stream]) {
-					mask |= (1 << i);
-					if (--active_slots <= 0)
-						break;
-				}
+		for (i = 0; i < total_slots; i++) {
+			if ((1 << i) & mcasp->tdm_mask[stream]) {
+				mask |= (1 << i);
+				if (--active_slots <= 0)
+					break;
 			}
 		}
 	} else {
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
