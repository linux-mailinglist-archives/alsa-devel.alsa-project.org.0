Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 28D19E486D
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Oct 2019 12:18:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B605317CB;
	Fri, 25 Oct 2019 12:17:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B605317CB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571998688;
	bh=gS55ysD7exOiKc0AI9jMbUs5WkKnUec0rdPu5fAFXFY=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=jhZvcIsqaROdSj2AoRjTxikXS9ssOGfHf59aBulMxse7B3zr6d8/4mbDxkU7WLAcX
	 wYnnQsAU0ZKeQNHyqSe0CG1lNw+y3L8uRZ6Bqbsu7ti+1W9KlA3QG1P772N+SLT82x
	 bX56ujByy9T5u9i1LGdTaFNd2OVzRuD+vcWKdzjo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 80DD7F8063B;
	Fri, 25 Oct 2019 12:12:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 88CF2F80393; Fri, 25 Oct 2019 12:12:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E714FF8045D
 for <alsa-devel@alsa-project.org>; Fri, 25 Oct 2019 12:12:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E714FF8045D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="PejzMVlZ"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=Mfwi8AbI+njv6OXBWSEU3ESst6lzCiQazpD9WrFtGOs=; b=PejzMVlZbUqx
 fSWESryCFXJJPU17sFwlk8S7+h3cO3184RFLTHRDblukpGYd9k6aH+GZ92FC7DUHc/FverGf3dyhE
 11xAB+QcwD6u3+XkSgQ+ZsuE7z8ez8yPINS6cItdVxMHrr29OdjzG9Ncm+6mzIx6ULE8NaXmNJWy9
 2yxTc=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iNwZo-0006dx-NU; Fri, 25 Oct 2019 10:12:12 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 251942743267; Fri, 25 Oct 2019 11:12:12 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
In-Reply-To: <20191024153130.31082-1-geert+renesas@glider.be>
X-Patchwork-Hint: ignore
Message-Id: <20191025101212.251942743267@ypsilon.sirena.org.uk>
Date: Fri, 25 Oct 2019 11:12:12 +0100 (BST)
Cc: alsa-devel@alsa-project.org, Jiri Kosina <trivial@kernel.org>,
 linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Haojian Zhuang <haojian.zhuang@gmail.com>,
 Mark Brown <broonie@kernel.org>, linux-arm-kernel@lists.infradead.org,
 Robert Jarzmik <robert.jarzmik@free.fr>, Daniel Mack <daniel@zonque.org>
Subject: [alsa-devel] Applied "ASoC: pxa: poodle: Spelling
	s/enpoints/endpoints/, s/connetion/connection/" to the asoc tree
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

   ASoC: pxa: poodle: Spelling s/enpoints/endpoints/, s/connetion/connection/

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

From 16c33235321d5ce3463ebefc205d7cf11929d59f Mon Sep 17 00:00:00 2001
From: Geert Uytterhoeven <geert+renesas@glider.be>
Date: Thu, 24 Oct 2019 17:31:30 +0200
Subject: [PATCH] ASoC: pxa: poodle: Spelling s/enpoints/endpoints/,
 s/connetion/connection/

Fix misspelling of "endpoints" and "connection".

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Link: https://lore.kernel.org/r/20191024153130.31082-1-geert+renesas@glider.be
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/pxa/poodle.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/pxa/poodle.c b/sound/soc/pxa/poodle.c
index 48d5c2252b10..59ef04d0467a 100644
--- a/sound/soc/pxa/poodle.c
+++ b/sound/soc/pxa/poodle.c
@@ -56,7 +56,7 @@ static void poodle_ext_control(struct snd_soc_dapm_context *dapm)
 		snd_soc_dapm_disable_pin(dapm, "Headphone Jack");
 	}
 
-	/* set the enpoints to their new connetion states */
+	/* set the endpoints to their new connection states */
 	if (poodle_spk_func == POODLE_SPK_ON)
 		snd_soc_dapm_enable_pin(dapm, "Ext Spk");
 	else
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
