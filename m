Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 747F817493
	for <lists+alsa-devel@lfdr.de>; Wed,  8 May 2019 11:07:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1359C191B;
	Wed,  8 May 2019 11:06:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1359C191B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557306450;
	bh=aXpLkbyoQ+ZStrOgJ12NTJRrdtwl+O9WgMqsMTyEsTQ=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=p9DpVd1s1uJT9kVyRdwMyfl2+iIGvjhreOXdWs6zqCqyU6Jtsq1QpfYkZB7zCTi1v
	 BvKlYr4E0munPh8lhvK+nPBUTnKynMfjd/tcM48FxCNQnngRbveQflH3RPCZD2zlqo
	 IZYZUoFiARYyUDlVQrjivZ91G+6evEWvhjg9CetM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4ACDFF89747;
	Wed,  8 May 2019 11:02:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 33CD7F89731; Wed,  8 May 2019 11:01:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4AD3AF8973D
 for <alsa-devel@alsa-project.org>; Wed,  8 May 2019 11:01:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4AD3AF8973D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="NWFoHi2Y"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=/f7yfpQHXR1DVeM2Hc5XKbjEzB5soA7Vo4q+Tlwf8pc=; b=NWFoHi2YNe53
 VZCCbBYi/cxAjTfswalfOXwj9UtvGV8m2fTs42N7+sn65+wgnv2eomnYGXtgDKOzGHRpRpLaHXQX5
 1gV8iOX2LqLBjnr+SNgcukbxqyub3BLl4GA6LjK1BcKwkaYtIxmMh9K2YwRhBZoHGDreodoTW5Q+C
 MVMFI=;
Received: from [61.199.190.11] (helo=finisterre.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hOISO-0007di-Df; Wed, 08 May 2019 09:01:45 +0000
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
 id ABCEE44003B; Wed,  8 May 2019 10:01:30 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Libin Yang <libin.yang@intel.com>
In-Reply-To: <1557210791-20332-1-git-send-email-libin.yang@intel.com>
X-Patchwork-Hint: ignore
Message-Id: <20190508090130.ABCEE44003B@finisterre.sirena.org.uk>
Date: Wed,  8 May 2019 10:01:30 +0100 (BST)
Cc: alsa-devel@alsa-project.org, tiwai@suse.de,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 hui.wang@canonical.com, Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: codec: hdac_hdmi: no checking monitor
	in hw_params" to the asoc tree
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

   ASoC: codec: hdac_hdmi: no checking monitor in hw_params

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.2

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

From 939507f2779836919271ba0311723d1001d3993b Mon Sep 17 00:00:00 2001
From: Libin Yang <libin.yang@intel.com>
Date: Tue, 7 May 2019 14:33:11 +0800
Subject: [PATCH] ASoC: codec: hdac_hdmi: no checking monitor in hw_params

Some userspace apps, like pulseaudio, may call open, hw_params,
prepare to judge whether the pcm is ready or not. Current hdac_hdmi
will return -ENODEV if monitor is not connected, which will cause
the apps believe the pcm is not ready. Actually PCM for hdmi is ready,
even the monitor is not connected.

This patch removes the check of monitor presence in hw_params, just like
what the legacy HD-Audio driver does.

Signed-off-by: Libin Yang <libin.yang@intel.com>
Acked-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/hdac_hdmi.c | 13 -------------
 1 file changed, 13 deletions(-)

diff --git a/sound/soc/codecs/hdac_hdmi.c b/sound/soc/codecs/hdac_hdmi.c
index 4de1fbfa8827..660e0587f399 100644
--- a/sound/soc/codecs/hdac_hdmi.c
+++ b/sound/soc/codecs/hdac_hdmi.c
@@ -455,24 +455,11 @@ static int hdac_hdmi_set_hw_params(struct snd_pcm_substream *substream,
 	struct snd_pcm_hw_params *hparams, struct snd_soc_dai *dai)
 {
 	struct hdac_hdmi_priv *hdmi = snd_soc_dai_get_drvdata(dai);
-	struct hdac_device *hdev = hdmi->hdev;
 	struct hdac_hdmi_dai_port_map *dai_map;
-	struct hdac_hdmi_port *port;
 	struct hdac_hdmi_pcm *pcm;
 	int format;
 
 	dai_map = &hdmi->dai_map[dai->id];
-	port = dai_map->port;
-
-	if (!port)
-		return -ENODEV;
-
-	if ((!port->eld.monitor_present) || (!port->eld.eld_valid)) {
-		dev_err(&hdev->dev,
-			"device is not configured for this pin:port%d:%d\n",
-					port->pin->nid, port->id);
-		return -ENODEV;
-	}
 
 	format = snd_hdac_calc_stream_format(params_rate(hparams),
 			params_channels(hparams), params_format(hparams),
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
