Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BE21971DAA
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Jul 2019 19:26:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4634E18F0;
	Tue, 23 Jul 2019 19:26:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4634E18F0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563902811;
	bh=ID3KWRi3JoA/eJRcb//6c4mdIk6mR+PgKNOUEHXJHMU=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=JIHoNjixj/CB+Qw+LEJMmF9OjqcHi23awS9xzDjG6W5BRo5RyfOU57VMW7xvcXIoU
	 7ksAlj9PYzCAcuL41CawQ/h55NykBaj6PbJPi94kaIu9ryNRDsRxzOPPyOBVH6g9NT
	 JSFlABU3BDnanfcrB8g1HI44HhJmCa85iAh89AY8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D54D3F805F7;
	Tue, 23 Jul 2019 19:19:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 70AA1F804FF; Tue, 23 Jul 2019 19:19:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 72400F80483
 for <alsa-devel@alsa-project.org>; Tue, 23 Jul 2019 19:18:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 72400F80483
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="DsCzByk8"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=wriTNlDlKzb7OFZ7KXbrFQ2JISiYn8rXFcR3pNJf4X0=; b=DsCzByk8MgNs
 XTaBEpgntT7uF8N8D/zpnGbUJsSAYtQoA/r9LRK826JSezP0PRDvw/QWoD/6SvAFennNZOjArRSFy
 Wbz0FshKDHESR/ZP/L+yTtJWWb9QF5K1Npk9dvXfU0FX+vNz9UXoQfVAB+xktMEjIu7UW9vEdaOe5
 5F9PU=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hpyRA-0004Ls-Lh; Tue, 23 Jul 2019 17:18:52 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 2F6182742B60; Tue, 23 Jul 2019 18:18:52 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87sgqyhn40.wl-kuninori.morimoto.gx@renesas.com>
X-Patchwork-Hint: ignore
Message-Id: <20190723171852.2F6182742B60@ypsilon.sirena.org.uk>
Date: Tue, 23 Jul 2019 18:18:52 +0100 (BST)
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: soc-dai: add snd_soc_dai_trigger()" to
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

   ASoC: soc-dai: add snd_soc_dai_trigger()

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.4

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

From 95aef35533844f35544851b0cdc1fc154b603307 Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Mon, 22 Jul 2019 10:33:51 +0900
Subject: [PATCH] ASoC: soc-dai: add snd_soc_dai_trigger()

Current ALSA SoC is directly using dai->driver->ops->xxx,
thus, it has deep nested bracket, and it makes code unreadable.
This patch adds new snd_soc_dai_trigger() and use it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Link: https://lore.kernel.org/r/87sgqyhn40.wl-kuninori.morimoto.gx@renesas.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 include/sound/soc-dai.h |  2 ++
 sound/soc/soc-dai.c     | 12 ++++++++++++
 sound/soc/soc-pcm.c     | 17 ++++++-----------
 3 files changed, 20 insertions(+), 11 deletions(-)

diff --git a/include/sound/soc-dai.h b/include/sound/soc-dai.h
index c7dff6a0b5b9..72b8e76f1cc4 100644
--- a/include/sound/soc-dai.h
+++ b/include/sound/soc-dai.h
@@ -156,6 +156,8 @@ void snd_soc_dai_shutdown(struct snd_soc_dai *dai,
 			  struct snd_pcm_substream *substream);
 int snd_soc_dai_prepare(struct snd_soc_dai *dai,
 			struct snd_pcm_substream *substream);
+int snd_soc_dai_trigger(struct snd_soc_dai *dai,
+			struct snd_pcm_substream *substream, int cmd);
 
 struct snd_soc_dai_ops {
 	/*
diff --git a/sound/soc/soc-dai.c b/sound/soc/soc-dai.c
index cb810888c563..18c447e169f6 100644
--- a/sound/soc/soc-dai.c
+++ b/sound/soc/soc-dai.c
@@ -318,3 +318,15 @@ int snd_soc_dai_prepare(struct snd_soc_dai *dai,
 
 	return ret;
 }
+
+int snd_soc_dai_trigger(struct snd_soc_dai *dai,
+			struct snd_pcm_substream *substream,
+			int cmd)
+{
+	int ret = 0;
+
+	if (dai->driver->ops->trigger)
+		ret = dai->driver->ops->trigger(substream, cmd, dai);
+
+	return ret;
+}
diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index d7611af90dce..a628b08f966e 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -1084,12 +1084,9 @@ static int soc_pcm_trigger(struct snd_pcm_substream *substream, int cmd)
 	int i, ret;
 
 	for_each_rtd_codec_dai(rtd, i, codec_dai) {
-		if (codec_dai->driver->ops->trigger) {
-			ret = codec_dai->driver->ops->trigger(substream,
-							      cmd, codec_dai);
-			if (ret < 0)
-				return ret;
-		}
+		ret = snd_soc_dai_trigger(codec_dai, substream, cmd);
+		if (ret < 0)
+			return ret;
 	}
 
 	for_each_rtdcom(rtd, rtdcom) {
@@ -1104,11 +1101,9 @@ static int soc_pcm_trigger(struct snd_pcm_substream *substream, int cmd)
 			return ret;
 	}
 
-	if (cpu_dai->driver->ops->trigger) {
-		ret = cpu_dai->driver->ops->trigger(substream, cmd, cpu_dai);
-		if (ret < 0)
-			return ret;
-	}
+	snd_soc_dai_trigger(cpu_dai, substream, cmd);
+	if (ret < 0)
+		return ret;
 
 	if (rtd->dai_link->ops->trigger) {
 		ret = rtd->dai_link->ops->trigger(substream, cmd);
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
