Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 31A00AD701
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Sep 2019 12:39:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BB7CC1672;
	Mon,  9 Sep 2019 12:38:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BB7CC1672
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1568025576;
	bh=9Akb8J2tCbB23jVjo1LF9oM+xi7oAD8BkXyGFGooXZI=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=TNKKcE93ZFJJdFmcQuOfT7EUGKTn8btvNj7SytDrvjtMR/ru0cDlKc8GxxZ1UAmWn
	 4oCtJ9HnYXpeiwbdnYSSvlDA8Vm1zUyaL5DxQpjaH3B5kKgEtFezGC6bHRJ+VpC8ab
	 5izI5zj7x9odPqV8M5L6ibcJnBmUJFNPfpeVCfqs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AAE74F804CF;
	Mon,  9 Sep 2019 12:35:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0428BF80507; Mon,  9 Sep 2019 12:34:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2FCA9F800A9
 for <alsa-devel@alsa-project.org>; Mon,  9 Sep 2019 12:34:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2FCA9F800A9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="GUldx2zO"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=FADI6GBmjOVJOHjLSGMobnRN0OGoa6F3qFcm5svhebo=; b=GUldx2zOeqHZ
 zYVeX2+Jd8vD3j8MXpHizC/1Mp4cFIcdiYjPMNN/43UgfwDsXmtUIujSvPpXZwuQKyQZTPNgss+JB
 HLHSy/qtBt/MMoBfN9HRZoxCNT9L+ujZXsf4+6xYVQMZeDtq4dC/pp4dlOS6Ghvsh+LVSK1PJyVbR
 6gfkk=;
Received: from [148.69.85.38] (helo=fitzroy.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1i7GZq-0001sV-9A; Mon, 09 Sep 2019 10:07:18 +0000
Received: by fitzroy.sirena.org.uk (Postfix, from userid 1000)
 id 938E0D02D18; Mon,  9 Sep 2019 11:07:17 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Peter Ujfalusi <peter.ujfalusi@ti.com>
In-Reply-To: <20190906055524.7393-1-peter.ujfalusi@ti.com>
X-Patchwork-Hint: ignore
Message-Id: <20190909100717.938E0D02D18@fitzroy.sirena.org.uk>
Date: Mon,  9 Sep 2019 11:07:17 +0100 (BST)
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, lgirdwood@gmail.com,
 arthur.she@linaro.org, Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: dmaengine: Make the pcm->name equal to
	pcm->id if the name is not set" to the asoc tree
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

   ASoC: dmaengine: Make the pcm->name equal to pcm->id if the name is not set

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

From 2ec42f3147e1610716f184b02e65d7f493eed925 Mon Sep 17 00:00:00 2001
From: Peter Ujfalusi <peter.ujfalusi@ti.com>
Date: Fri, 6 Sep 2019 08:55:24 +0300
Subject: [PATCH] ASoC: dmaengine: Make the pcm->name equal to pcm->id if the
 name is not set

Some tools use the snd_pcm_info_get_name() to try to identify PCMs or for
other purposes.

Currently it is left empty with the dmaengine-pcm, in this case copy the
pcm->id string as pcm->name.

For example IGT is using this to find the HDMI PCM for testing audio on it.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@ti.com>
Reported-by: Arthur She <arthur.she@linaro.org>
Link: https://lore.kernel.org/r/20190906055524.7393-1-peter.ujfalusi@ti.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/soc-generic-dmaengine-pcm.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/sound/soc/soc-generic-dmaengine-pcm.c b/sound/soc/soc-generic-dmaengine-pcm.c
index 748f5f641002..d93db2c2b527 100644
--- a/sound/soc/soc-generic-dmaengine-pcm.c
+++ b/sound/soc/soc-generic-dmaengine-pcm.c
@@ -306,6 +306,12 @@ static int dmaengine_pcm_new(struct snd_soc_pcm_runtime *rtd)
 
 		if (!dmaengine_pcm_can_report_residue(dev, pcm->chan[i]))
 			pcm->flags |= SND_DMAENGINE_PCM_FLAG_NO_RESIDUE;
+
+		if (rtd->pcm->streams[i].pcm->name[0] == '\0') {
+			strncpy(rtd->pcm->streams[i].pcm->name,
+				rtd->pcm->streams[i].pcm->id,
+				sizeof(rtd->pcm->streams[i].pcm->name));
+		}
 	}
 
 	return 0;
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
