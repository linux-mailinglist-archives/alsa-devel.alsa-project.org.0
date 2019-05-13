Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 269D51B6A7
	for <lists+alsa-devel@lfdr.de>; Mon, 13 May 2019 15:05:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A6608171C;
	Mon, 13 May 2019 15:04:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A6608171C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557752713;
	bh=vjcdhgbkKqIb1IFiMl+iTHJDL1imwCqZq2rvcQF3t3A=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=K7XsJk4s98r9HboYG+EMzmRtEj2bey5sUl7f5VLIb0BPGMGaLjXcK2w5HX96wyWsb
	 OG8wS2GT/Q1XO29wefpfXo79Hue/eMxe1I7NMkfGBU2sq8mp31AObRtP7Z3439fUQO
	 67DCOr0EIj3MciSH0UNjtdbLvdop3W7cuLdtOwRc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0B0A6F8973F;
	Mon, 13 May 2019 15:01:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E8DACF896B8; Mon, 13 May 2019 14:31:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C3EE5F8961A
 for <alsa-devel@alsa-project.org>; Mon, 13 May 2019 14:30:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C3EE5F8961A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="wo/Ztrcu"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=cfxKJLEZzgNvJfiT59Fd0wGBiitez377dAZOl6bfB+c=; b=wo/ZtrcufWpm
 5C/Zm+xvgSiVmUqH28jknAkLrJopZJ31puivZpwa75ajMH0wU4UpwB304OXC678YpA5Z5+QurZBxx
 uPTuGLZBHRDQ/ubBBxrfbuafSBQwhSgWhnHg4eXuyC0bvCvGlmC7Spn2PedT5EfDsnAVOtY0suUIg
 TBzHw=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=debutante.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpa (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hQA67-0006WT-Lp; Mon, 13 May 2019 12:30:27 +0000
Received: by debutante.sirena.org.uk (Postfix, from userid 1000)
 id AB9501129235; Mon, 13 May 2019 13:30:26 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87o946alr1.wl-kuninori.morimoto.gx@renesas.com>
X-Patchwork-Hint: ignore
Message-Id: <20190513123026.AB9501129235@debutante.sirena.org.uk>
Date: Mon, 13 May 2019 13:30:26 +0100 (BST)
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: soc-pcm: do cpu_dai related operation
	at same place" to the asoc tree
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

   ASoC: soc-pcm: do cpu_dai related operation at same place

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

From ca58221d2212aff4f41d05b99b1e2ed288b24ccc Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Mon, 13 May 2019 16:07:43 +0900
Subject: [PATCH] ASoC: soc-pcm: do cpu_dai related operation at same place

cpu_dai related operation is separated by component operation at
soc_pcm_hw_params() somehow.
It is not readable, let's do it at same place

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/soc-pcm.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index 0a4f60c7a188..ad560d9bf06a 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -990,6 +990,14 @@ static int soc_pcm_hw_params(struct snd_pcm_substream *substream,
 	if (ret < 0)
 		goto interface_err;
 
+	/* store the parameters for each DAIs */
+	cpu_dai->rate = params_rate(params);
+	cpu_dai->channels = params_channels(params);
+	cpu_dai->sample_bits =
+		snd_pcm_format_physical_width(params_format(params));
+
+	snd_soc_dapm_update_dai(substream, params, cpu_dai);
+
 	for_each_rtdcom(rtd, rtdcom) {
 		component = rtdcom->component;
 
@@ -1007,14 +1015,6 @@ static int soc_pcm_hw_params(struct snd_pcm_substream *substream,
 	}
 	component = NULL;
 
-	/* store the parameters for each DAIs */
-	cpu_dai->rate = params_rate(params);
-	cpu_dai->channels = params_channels(params);
-	cpu_dai->sample_bits =
-		snd_pcm_format_physical_width(params_format(params));
-
-	snd_soc_dapm_update_dai(substream, params, cpu_dai);
-
 	ret = soc_pcm_params_symmetry(substream, params);
         if (ret)
 		goto component_err;
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
