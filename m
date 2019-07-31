Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DE5557C021
	for <lists+alsa-devel@lfdr.de>; Wed, 31 Jul 2019 13:37:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6B04C16FF;
	Wed, 31 Jul 2019 13:36:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6B04C16FF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564573024;
	bh=Zcg/1ag6tkhfu0xLPD23VAPUkSbQEpLjvng5ESeQnDE=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=hE+wZQoLewpMeu+THQ5Vuc2D9MgMq7sDxXRwxYJrZsOyBPRIRkzp35d2enP9A4lkG
	 flvgvXyay8cj+FQknANGn3V+w4NAW+01nc7fWKmetiKzK6QcricX3gYvJNfbdQQOiY
	 s1+dShxI/kWMm+tJy7kEX8GjExCmVuIafuy9HIPU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 91AEAF805FF;
	Wed, 31 Jul 2019 13:31:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DEE0AF80214; Wed, 31 Jul 2019 13:30:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 86237F805AF
 for <alsa-devel@alsa-project.org>; Wed, 31 Jul 2019 13:29:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 86237F805AF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="h7mJvPV4"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=qdXfU6r5b5sdjGKJgeKuLM8z6fXd+57ECxKLYJefhRg=; b=h7mJvPV40UEw
 3KaRh1RriPGRhUPlrjB5eVR9O93+MYafPgo89J2bUWnqc2+GsMxE990Eqn+E6iBDJssbzl59fsgb6
 zB5KGcq4W2nywpYg857qEi0d6RNW65Waj0BGjY1rHdgeNloGTTXJxru0tC3ydVbakXreJAvTRhSDx
 +zz5k=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hsmno-0001pr-Br; Wed, 31 Jul 2019 11:29:52 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 80FD42742CDE; Wed, 31 Jul 2019 12:29:51 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: fengchunguo <chunguo.feng@amlogic.com>
In-Reply-To: <20190731074156.5620-1-chunguo.feng@amlogic.com>
X-Patchwork-Hint: ignore
Message-Id: <20190731112951.80FD42742CDE@ypsilon.sirena.org.uk>
Date: Wed, 31 Jul 2019 12:29:51 +0100 (BST)
Cc: pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org,
 RyanS.Lee@maximintegrated.com, grundler@chromium.org, bleung@chromium.org,
 tiwai@suse.com, lgirdwood@gmail.com, linux-kernel@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, chunguo.feng@amlogic.com
Subject: [alsa-devel] Applied "ASoC: max98373: add 88200 and 96000 sampling
	rate support" to the asoc tree
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
Content-Type: multipart/mixed; boundary="===============5837583006037500529=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

--===============5837583006037500529==
Content-Type: text/plain

The patch

   ASoC: max98373: add 88200 and 96000 sampling rate support

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

From b9da500bde81ad820b5d95c6bf52fc33e1f490ee Mon Sep 17 00:00:00 2001
From: fengchunguo <chunguo.feng@amlogic.com>
Date: Wed, 31 Jul 2019 15:41:56 +0800
Subject: [PATCH] ASoC: max98373: add 88200 and 96000 sampling rate support
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

88200 and 96000 sampling rate was not enabled on driver, so can't be played.

The error information:
max98373 3-0031：rate 96000 not supported
max98373 3-0031：ASoC: can't set max98373-aif1 hw params: -22

Signed-off-by: fengchunguo <chunguo.feng@amlogic.com>
Link: https://lore.kernel.org/r/20190731074156.5620-1-chunguo.feng@amlogic.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/max98373.c | 6 ++++++
 sound/soc/codecs/max98373.h | 2 ++
 2 files changed, 8 insertions(+)
 mode change 100644 => 100755 sound/soc/codecs/max98373.c
 mode change 100644 => 100755 sound/soc/codecs/max98373.h

diff --git a/sound/soc/codecs/max98373.c b/sound/soc/codecs/max98373.c
old mode 100644
new mode 100755
index 528695cd6a1c..8c601a3ebc27
--- a/sound/soc/codecs/max98373.c
+++ b/sound/soc/codecs/max98373.c
@@ -267,6 +267,12 @@ static int max98373_dai_hw_params(struct snd_pcm_substream *substream,
 	case 48000:
 		sampling_rate = MAX98373_PCM_SR_SET1_SR_48000;
 		break;
+	case 88200:
+		sampling_rate = MAX98373_PCM_SR_SET1_SR_88200;
+		break;
+	case 96000:
+		sampling_rate = MAX98373_PCM_SR_SET1_SR_96000;
+		break;
 	default:
 		dev_err(component->dev, "rate %d not supported\n",
 			params_rate(params));
diff --git a/sound/soc/codecs/max98373.h b/sound/soc/codecs/max98373.h
old mode 100644
new mode 100755
index f6a37aa02f26..a59e51355a84
--- a/sound/soc/codecs/max98373.h
+++ b/sound/soc/codecs/max98373.h
@@ -130,6 +130,8 @@
 #define MAX98373_PCM_SR_SET1_SR_32000 (0x6 << 0)
 #define MAX98373_PCM_SR_SET1_SR_44100 (0x7 << 0)
 #define MAX98373_PCM_SR_SET1_SR_48000 (0x8 << 0)
+#define MAX98373_PCM_SR_SET1_SR_88200 (0x9 << 0)
+#define MAX98373_PCM_SR_SET1_SR_96000 (0xA << 0)
 
 /* MAX98373_R2028_PCM_SR_SETUP_2 */
 #define MAX98373_PCM_SR_SET2_SR_MASK (0xF << 4)
-- 
2.20.1


--===============5837583006037500529==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============5837583006037500529==--
