Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AC30E4870
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Oct 2019 12:19:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A86B617D3;
	Fri, 25 Oct 2019 12:18:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A86B617D3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571998758;
	bh=2tsIu2ZcRWtsSfpJEkAUk4avzNHNZdOEj45J/m2HjFk=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=XqIoePituFM+JmtQUimvm+VewLV1R9dllZQlFytR53mIB+rmi/+VaN9IfEv7NM7J6
	 hJVyc9BEwmTK7V39HqliMwu5NhZgQymperGXMDCPuf4O0wdIMcDG41A70oAuRar4+G
	 6XmIfOblLJSJHwGPyCuyRyR5SkKr/NPfPezeIXGg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B60FBF80678;
	Fri, 25 Oct 2019 12:12:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1AD73F8060D; Fri, 25 Oct 2019 12:12:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7BEE6F805FB
 for <alsa-devel@alsa-project.org>; Fri, 25 Oct 2019 12:12:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7BEE6F805FB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="u+RXoEvO"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=1SI1Juq8plecqOw7CtHhS6tAinEsg8eNIgi8AtOAtSc=; b=u+RXoEvODYdI
 9NsCy1raTemu+aBtt0XCOZlF2q3X7I2RukDMOZrJ5M6q8thuwwNgMWO5ISUPsaoTA3TusClpjpSo9
 jRS/Z3dImSfI72VlVci93BPqzffS8M34Vm3ncccNNE7dbFUbWxaheTvqdBs0GlquXb3M1rzxFLRgr
 roaOg=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iNwZp-0006eD-LY; Fri, 25 Oct 2019 10:12:13 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 079AA274326E; Fri, 25 Oct 2019 11:12:12 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Curtis Malainey <cujomalainey@chromium.org>
In-Reply-To: <20191024184026.183913-1-cujomalainey@chromium.org>
X-Patchwork-Hint: ignore
Message-Id: <20191025101213.079AA274326E@ypsilon.sirena.org.uk>
Date: Fri, 25 Oct 2019 11:12:12 +0100 (BST)
Cc: Oder Chiou <oder_chiou@realtek.com>, alsa-devel@alsa-project.org,
 kbuild test robot <lkp@intel.com>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Bard Liao <bardliao@realtek.com>
Subject: [alsa-devel] Applied "ASoC: rt5677-spi: fix sparse warnings" to the
	asoc tree
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

   ASoC: rt5677-spi: fix sparse warnings

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

From 6442793abf75a8081aa1f5da439529c08af2a5be Mon Sep 17 00:00:00 2001
From: Curtis Malainey <cujomalainey@chromium.org>
Date: Thu, 24 Oct 2019 11:40:26 -0700
Subject: [PATCH] ASoC: rt5677-spi: fix sparse warnings

Fix bugs reported by kbuild test robot

Fixes: a0e0d135427c ("ASoC: rt5677: Add a PCM device for streaming hotword via SPI")
Reported-by: kbuild test robot <lkp@intel.com>
Signed-off-by: Curtis Malainey <cujomalainey@chromium.org>
Link: https://lore.kernel.org/r/20191024184026.183913-1-cujomalainey@chromium.org
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/rt5677-spi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/rt5677-spi.c b/sound/soc/codecs/rt5677-spi.c
index 3a17643fcd9f..dac1097bc740 100644
--- a/sound/soc/codecs/rt5677-spi.c
+++ b/sound/soc/codecs/rt5677-spi.c
@@ -145,7 +145,7 @@ static int rt5677_spi_hw_free(
 			snd_soc_component_get_drvdata(component);
 
 	mutex_lock(&rt5677_dsp->dma_lock);
-	rt5677_dsp->substream = 0;
+	rt5677_dsp->substream = NULL;
 	mutex_unlock(&rt5677_dsp->dma_lock);
 
 	return snd_pcm_lib_free_vmalloc_buffer(substream);
@@ -362,7 +362,7 @@ static void rt5677_spi_copy_work(struct work_struct *work)
 	mutex_unlock(&rt5677_dsp->dma_lock);
 }
 
-struct page *rt5677_spi_pcm_page(
+static struct page *rt5677_spi_pcm_page(
 		struct snd_soc_component *component,
 		struct snd_pcm_substream *substream,
 		unsigned long offset)
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
