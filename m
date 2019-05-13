Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 078D21B634
	for <lists+alsa-devel@lfdr.de>; Mon, 13 May 2019 14:43:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9873E16BB;
	Mon, 13 May 2019 14:42:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9873E16BB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557751412;
	bh=7u5QZR91nnnHPUSAkzkmZyHHSvJZT0gDKPpdATZ5j+0=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=qqG66nyysLtVtcLdBfRqFj8Pdo9QXMSXckZKPlScbO3haEI44o1EW4PH1dcNgMq9g
	 BZrTWp/zsiYRp+8TDyY/sbSmy0VJ4Dah5OlABPIe2pMUvVQ4szQTXHZU1St9BOClum
	 5B0Y4RPTAuI3cQXU8wsKIVBUIedW/4Tuc/7Yz+SQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9F63FF8972A;
	Mon, 13 May 2019 14:41:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D2D2DF89732; Mon, 13 May 2019 14:31:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D42D3F89733
 for <alsa-devel@alsa-project.org>; Mon, 13 May 2019 14:30:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D42D3F89733
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="YSlqpmaL"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=Cf13V2JtQkCqJEsCmLSe709rW+gPTabERjWqo4es22E=; b=YSlqpmaL4sEm
 YzlCBmJXZheY+j0LLKamW7pmql1BemH1XN7k5ToKZZ6X198Z/v+9IuBHSuLLA81ZIk83GfMaZljAH
 70PsUR8n7pqy35BD/AW+Gkm6f/Eng1aA0dT4Iah7NanDgWj3xmBH/wSQ+CIdzkXyfAiohRr4J8orP
 dqEjc=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=debutante.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpa (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hQA6F-0006YA-3Z; Mon, 13 May 2019 12:30:35 +0000
Received: by debutante.sirena.org.uk (Postfix, from userid 1000)
 id 2B09B1129232; Mon, 13 May 2019 13:30:34 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
In-Reply-To: <20190408193025.22639-1-ranjani.sridharan@linux.intel.com>
X-Patchwork-Hint: ignore
Message-Id: <20190513123034.2B09B1129232@debutante.sirena.org.uk>
Date: Mon, 13 May 2019 13:30:34 +0100 (BST)
Cc: tiwai@suse.de, alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 pierre-louis.bossart@linux.intel.com
Subject: [alsa-devel] Applied "ASoC: pcm: fix error handling when
	try_module_get() fails." to the asoc tree
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

   ASoC: pcm: fix error handling when try_module_get() fails.

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

From 7df8e234449a9a1cd2af5de728b7f811346c6fec Mon Sep 17 00:00:00 2001
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Date: Mon, 8 Apr 2019 12:30:25 -0700
Subject: [PATCH] ASoC: pcm: fix error handling when try_module_get() fails.

Handle error before returning when try_module_get() fails
to prevent inconsistent mutex lock/unlock.

Fixes: 52034add7 (ASoC: pcm: update module refcount if
		  module_get_upon_open is set)
Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/soc-pcm.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index a810f6eeffee..69ea962de585 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -518,8 +518,10 @@ static int soc_pcm_open(struct snd_pcm_substream *substream)
 			continue;
 
 		if (component->driver->module_get_upon_open &&
-		    !try_module_get(component->dev->driver->owner))
-			return -ENODEV;
+		    !try_module_get(component->dev->driver->owner)) {
+			ret = -ENODEV;
+			goto module_err;
+		}
 
 		ret = component->driver->ops->open(substream);
 		if (ret < 0) {
@@ -636,7 +638,7 @@ static int soc_pcm_open(struct snd_pcm_substream *substream)
 
 component_err:
 	soc_pcm_components_close(substream, component);
-
+module_err:
 	if (cpu_dai->driver->ops->shutdown)
 		cpu_dai->driver->ops->shutdown(substream, cpu_dai);
 out:
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
