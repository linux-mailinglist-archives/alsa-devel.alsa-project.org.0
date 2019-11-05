Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 88435F0584
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Nov 2019 19:58:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0AA9216FD;
	Tue,  5 Nov 2019 19:57:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0AA9216FD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572980318;
	bh=6ilSNoPFuhXVIMbPBrv6Dha+3s7GTIkvwVVyjyKU3iA=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=QzLrcG9W2bnX6sboqD8STZCF7oGvu3lOY+l1pFML4IIHPUDtBiL4stseuxhSf+e0E
	 fXYCpnfKxUwajl99ROq2nvCJx2070shdXYl9AWzmp/DNX2dpZq7z+GutPOA5ykZgui
	 MbnOKK+lgXxqNIFLpzol2fv0OFmRHbQNGbqQczHU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AA49EF8060F;
	Tue,  5 Nov 2019 19:55:25 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 42CBDF8049B; Tue,  5 Nov 2019 19:55:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E5FFBF80535
 for <alsa-devel@alsa-project.org>; Tue,  5 Nov 2019 19:55:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E5FFBF80535
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="IgaJgxt1"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=1G9fhThjQX6JETaHjlSPqwo7wO+vrFaCPgnMNC5KMUs=; b=IgaJgxt1W7BW
 h+Kqzjixsa4+e1SqzkkyrXfLJZciVEECeZQMQ3pCm55ck/C2voA+WxLpdXT4sMPTECnfmpE2mGzWu
 ulo9XKBdYL0nhrnBeBgm7evzvjaDbupLIVvjUe7zxWi2QFb1WekpTEZDDZ8vzeoYA+obHcOH7yp0/
 +67GY=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iS3z0-0007Pj-Kv; Tue, 05 Nov 2019 18:55:14 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 4F0082743280; Tue,  5 Nov 2019 18:55:12 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: Yong Zhi <yong.zhi@intel.com>
In-Reply-To: <1572905399-22402-1-git-send-email-yong.zhi@intel.com>
X-Patchwork-Hint: ignore
Message-Id: <20191105185512.4F0082743280@ypsilon.sirena.org.uk>
Date: Tue,  5 Nov 2019 18:55:12 +0000 (GMT)
Cc: alsa-devel@alsa-project.org, kai.vehmanen@linux.intel.com,
 ryans.lee@maximintegrated.com, pierre-louis.bossart@linux.intel.com,
 Mark Brown <broonie@kernel.org>, sathyanarayana.nujella@intel.com,
 daniel.baluta@nxp.com
Subject: [alsa-devel] Applied "ASoC: max98373: replace gpio_request with
	devm_gpio_request" to the asoc tree
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

   ASoC: max98373: replace gpio_request with devm_gpio_request

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

From e44f3d49f900c645af434a3a1dfdbfb79c4a7851 Mon Sep 17 00:00:00 2001
From: Yong Zhi <yong.zhi@intel.com>
Date: Mon, 4 Nov 2019 16:09:59 -0600
Subject: [PATCH] ASoC: max98373: replace gpio_request with devm_gpio_request

Use devm_gpio_request() to automatic unroll when fails and avoid
resource leaks at error paths.

Signed-off-by: Yong Zhi <yong.zhi@intel.com>
Link: https://lore.kernel.org/r/1572905399-22402-1-git-send-email-yong.zhi@intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/max98373.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/max98373.c b/sound/soc/codecs/max98373.c
index eb709d528259..cae1def8902d 100644
--- a/sound/soc/codecs/max98373.c
+++ b/sound/soc/codecs/max98373.c
@@ -960,11 +960,11 @@ static int max98373_i2c_probe(struct i2c_client *i2c,
 
 	/* Power on device */
 	if (gpio_is_valid(max98373->reset_gpio)) {
-		ret = gpio_request(max98373->reset_gpio, "MAX98373_RESET");
+		ret = devm_gpio_request(&i2c->dev, max98373->reset_gpio,
+					"MAX98373_RESET");
 		if (ret) {
 			dev_err(&i2c->dev, "%s: Failed to request gpio %d\n",
 				__func__, max98373->reset_gpio);
-			gpio_free(max98373->reset_gpio);
 			return -EINVAL;
 		}
 		gpio_direction_output(max98373->reset_gpio, 0);
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
