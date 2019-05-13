Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AFBB41B699
	for <lists+alsa-devel@lfdr.de>; Mon, 13 May 2019 15:02:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3034F16C4;
	Mon, 13 May 2019 15:01:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3034F16C4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557752547;
	bh=4xPGVVnn4rEKbWEY+wAtJkz4I2GoqiD7invYuqnPvNc=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=LfX5gT0hrzW74So1cKEY9PW4u7FsVlGJS/Oi5oi1d91Q95LJC09AWdJxGOAuPs7Oz
	 vHgjoYtAXEN79PX/kosHAOhPw3sokRbygeMZhXWF4b1r3DB/pP8nAOBH/bgjApFsSD
	 FCdlxCBtVN2ZDP2R/U2YTa7Et/vk/rJFM9B48w6o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0A62EF8968A;
	Mon, 13 May 2019 15:00:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B126BF8961A; Mon, 13 May 2019 14:31:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D3FDBF8972A
 for <alsa-devel@alsa-project.org>; Mon, 13 May 2019 14:30:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D3FDBF8972A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="NEDrc0hF"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=XXyKzoNuk3Z4j+ixmXTIGf0YTq3hDZ6/jObf234BcVY=; b=NEDrc0hFYP1a
 sAbodplxeRvw2717stmV2RtcdlFITA8J0nDdxiPNVUelh9MyEZV/UJttCYPFjaVwNOm/c0fJaFqxc
 xe0odKVR8luNU3Uuh2GUxCfVwXlg7x2zRvd4I94/6Q/+2Uh5hv62X6PdLeBgO9wUI+JaV8pmIpv9G
 rWiLg=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=debutante.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpa (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hQA68-0006Wk-Rx; Mon, 13 May 2019 12:30:29 +0000
Received: by debutante.sirena.org.uk (Postfix, from userid 1000)
 id EDE521129232; Mon, 13 May 2019 13:30:27 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87woiualtp.wl-kuninori.morimoto.gx@renesas.com>
X-Patchwork-Hint: ignore
Message-Id: <20190513123027.EDE521129232@debutante.sirena.org.uk>
Date: Mon, 13 May 2019 13:30:27 +0100 (BST)
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: soc-core: use i on snd_soc_resume()" to
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

   ASoC: soc-core: use i on snd_soc_resume()

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

From 22d251a5964780452aed378a143816fbf2d4201d Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Mon, 13 May 2019 16:06:07 +0900
Subject: [PATCH] ASoC: soc-core: use i on snd_soc_resume()

This patch uses "int i" instead of "int j" on snd_soc_resume(),
and moves struct snd_soc_dai *codec_dai to top of this function.
This is cleanup and prepare for Multi CPU support

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/soc-core.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 2403bec2fccf..0d9b02075050 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -687,6 +687,8 @@ int snd_soc_resume(struct device *dev)
 	struct snd_soc_card *card = dev_get_drvdata(dev);
 	bool bus_control = false;
 	struct snd_soc_pcm_runtime *rtd;
+	struct snd_soc_dai *codec_dai;
+	int i;
 
 	/* If the card is not initialized yet there is nothing to do */
 	if (!card->instantiated)
@@ -694,14 +696,12 @@ int snd_soc_resume(struct device *dev)
 
 	/* activate pins from sleep state */
 	for_each_card_rtds(card, rtd) {
-		struct snd_soc_dai *codec_dai;
 		struct snd_soc_dai *cpu_dai = rtd->cpu_dai;
-		int j;
 
 		if (cpu_dai->active)
 			pinctrl_pm_select_default_state(cpu_dai->dev);
 
-		for_each_rtd_codec_dai(rtd, j, codec_dai) {
+		for_each_rtd_codec_dai(rtd, i, codec_dai) {
 			if (codec_dai->active)
 				pinctrl_pm_select_default_state(codec_dai->dev);
 		}
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
