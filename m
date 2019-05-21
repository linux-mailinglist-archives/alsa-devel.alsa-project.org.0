Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D3812259A9
	for <lists+alsa-devel@lfdr.de>; Tue, 21 May 2019 23:07:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 38F2E1689;
	Tue, 21 May 2019 23:06:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 38F2E1689
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1558472856;
	bh=ueeMuD9o3ltO1A/u0yhZAPPONELjll9NEdm6zPbEL4I=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=EOt5uH6iC/F3gF5Fa2VG6DLeiiQPifKkVOs3fjFCygzNs1m2jYjWE4ja10C2rXD7G
	 v/mJ+CPCAhlH2CFu9ME/a7C9bRWZ/COjPIOfkI8UVVdymSXCcK3txPKaVzu71+9FlC
	 2sK3N8hEx/HjknP2JQ9roLQo3paUTaEGsXKqrVtQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B7B52F89633;
	Tue, 21 May 2019 23:05:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B9787F8079B; Tue, 21 May 2019 23:05:49 +0200 (CEST)
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F2F83F8079B
 for <alsa-devel@alsa-project.org>; Tue, 21 May 2019 23:04:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F2F83F8079B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="kTtEK5fu"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=3kOq2GL8BnKnhrQQgdmhVccDVzqmr39vrGFmIPKCBHk=; b=kTtEK5fujLfs
 SjJCVH4Ulm5EyZuFTfvR/6Qf0H6rlwmJXvbSfB+i0nyp91l2/MzyY+CxgRcpGcdiYEO/iljhKKeFK
 yPWBDiymyi3oYkgzX6lQysNzlGf3ZoxJ2TXd1nGG0wETMUMdpvre3jzKjb0iav0lpeZfZLUbovYtG
 r12FQ=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=debutante.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpa (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hTBvV-0002EU-HJ; Tue, 21 May 2019 21:04:01 +0000
Received: by debutante.sirena.org.uk (Postfix, from userid 1000)
 id 5590D1126D16; Tue, 21 May 2019 22:04:00 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87imu5zzh7.wl-kuninori.morimoto.gx@renesas.com>
X-Patchwork-Hint: ignore
Message-Id: <20190521210400.5590D1126D16@debutante.sirena.org.uk>
Date: Tue, 21 May 2019 22:04:00 +0100 (BST)
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Subject: [alsa-devel] Applied "ASoC: soc-pcm: fixup
	try_module_get()/module_put() timing" to the asoc tree
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

   ASoC: soc-pcm: fixup try_module_get()/module_put() timing

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

From 428306c3b3fe107b1d059ceecf6fda09a1fcedf5 Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Mon, 20 May 2019 10:42:39 +0900
Subject: [PATCH] ASoC: soc-pcm: fixup try_module_get()/module_put() timing

soc_pcm_components_open/close() try to call
try_module_get()/module_put() based on
component->driver->module_get_upon_open.

Here, the purpose why we need to call these functions are to
checking module reference.
Thus, we need to call try_module_open() even though it doesn't
have .open callback.

The same reason, we need to call module_put() even though it
doesn't have .close

This patch calls try_module_get()/module_put() regardless of
.open/.close

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/soc-pcm.c | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index 74c7d38af2c6..4a7096a22b28 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -458,10 +458,6 @@ static int soc_pcm_components_open(struct snd_pcm_substream *substream,
 		component = rtdcom->component;
 		*last = component;
 
-		if (!component->driver->ops ||
-		    !component->driver->ops->open)
-			continue;
-
 		if (component->driver->module_get_upon_open &&
 		    !try_module_get(component->dev->driver->owner)) {
 			dev_err(component->dev,
@@ -470,6 +466,10 @@ static int soc_pcm_components_open(struct snd_pcm_substream *substream,
 			return -ENODEV;
 		}
 
+		if (!component->driver->ops ||
+		    !component->driver->ops->open)
+			continue;
+
 		ret = component->driver->ops->open(substream);
 		if (ret < 0) {
 			dev_err(component->dev,
@@ -495,11 +495,9 @@ static int soc_pcm_components_close(struct snd_pcm_substream *substream,
 		if (component == last)
 			break;
 
-		if (!component->driver->ops ||
-		    !component->driver->ops->close)
-			continue;
-
-		component->driver->ops->close(substream);
+		if (component->driver->ops &&
+		    component->driver->ops->close)
+			component->driver->ops->close(substream);
 
 		if (component->driver->module_get_upon_open)
 			module_put(component->dev->driver->owner);
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
