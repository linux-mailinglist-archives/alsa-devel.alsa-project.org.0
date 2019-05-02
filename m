Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E900111B5
	for <lists+alsa-devel@lfdr.de>; Thu,  2 May 2019 04:42:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BFD501755;
	Thu,  2 May 2019 04:42:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BFD501755
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1556764978;
	bh=dSffyASDsgFuUKB7JSqfgi1MfohSt0b6L1oJufENcds=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=D65khPYHTiZOvKzLr3MPib5ilD5kzYG0+xuiDcFsexb3D0G8iTbFGBxDBj3pQ4hR9
	 R1ZCVNG1MSWLPOfZey46sCrdv23GRoUvJ/E89qFqqcEraBonahHErWagN0C12v1CN7
	 2IwRLZjm0kev4u85JywvGg9r7+bD2kxNevreipX4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 81898F89725;
	Thu,  2 May 2019 04:40:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 70CC4F89725; Thu,  2 May 2019 04:40:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9E404F8075A
 for <alsa-devel@alsa-project.org>; Thu,  2 May 2019 04:40:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9E404F8075A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="oIhrXmZk"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=cXtMjzP8cWAlpfCwO5TSBDzBd4YnAQjIOZyKXqyt03Y=; b=oIhrXmZkvNtb
 yVF1MyjDyQlIfkSEufz4kVndt34EVQ+uj//AdfYBO5YvLsvW5nSx9NJdZunFwsIaqRf/n0LQ9qd+c
 lF4rHkyyWFql12AGVGW3UwGtr8K1foxSldbufC7espm5jnCCijHfVtaan8gc7Vl/p+9/goj2ZBq6Q
 K2we4=;
Received: from [211.55.52.15] (helo=finisterre.ee.mobilebroadband)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hM1eA-000604-6W; Thu, 02 May 2019 02:40:30 +0000
Received: by finisterre.ee.mobilebroadband (Postfix, from userid 1000)
 id 0D700441D3C; Thu,  2 May 2019 03:40:27 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Adam Thomson <Adam.Thomson.Opensource@diasemi.com>
In-Reply-To: <20190429105733.71FB83FBCC@swsrvapps-01.diasemi.com>
X-Patchwork-Hint: ignore
Message-Id: <20190502024027.0D700441D3C@finisterre.ee.mobilebroadband>
Date: Thu,  2 May 2019 03:40:26 +0100 (BST)
Cc: alsa-devel@alsa-project.org,
 Support Opensource <support.opensource@diasemi.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 Akshu Agrawal <Akshu.Agrawal@amd.com>
Subject: [alsa-devel] Applied "ASoC: da7219: Use clk_round_rate to handle
	enabled bclk/wclk case" to the asoc tree
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

   ASoC: da7219: Use clk_round_rate to handle enabled bclk/wclk case

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

From 1cd472d2ac1654f939ae01164b29e81fc76e0a93 Mon Sep 17 00:00:00 2001
From: Adam Thomson <Adam.Thomson.Opensource@diasemi.com>
Date: Mon, 29 Apr 2019 11:57:33 +0100
Subject: [PATCH] ASoC: da7219: Use clk_round_rate to handle enabled bclk/wclk
 case

For some platforms where DA7219 is the DAI clock master, BCLK/WCLK
will be set and enabled prior to the codec's hw_params() function
being called. It is possible the platform requires a different
BCLK configuration than would be chosen by hw_params(), for
example S16_LE format needed with a 64-bit frame to satisfy certain
devices using the clocks.

To handle those kinds of scenarios, the use of clk_round_rate() is
now employed as part of hw_params(). If BCLK is already enabled
then this function will just return the currently set rate, if it
is valid for the desired frame size, so the subsequent call to
clk_set_rate() will succeed and nothing changes with regards to
clocking. In addition the specific BCLK & WCLK recalc_rate()
implementations needed updating to always give back a real value,
as those functions are called as part of the clk init code and a
real value is needed for the clk_round_rate() call to work as
expected.

Signed-off-by: Adam Thomson <Adam.Thomson.Opensource@diasemi.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/da7219.c | 21 +++++++++++++++------
 1 file changed, 15 insertions(+), 6 deletions(-)

diff --git a/sound/soc/codecs/da7219.c b/sound/soc/codecs/da7219.c
index 5f5fa3416af3..206d01c6eb7e 100644
--- a/sound/soc/codecs/da7219.c
+++ b/sound/soc/codecs/da7219.c
@@ -1621,6 +1621,21 @@ static int da7219_hw_params(struct snd_pcm_substream *substream,
 
 		if (bclk) {
 			bclk_rate = frame_size * sr;
+			/*
+			 * Rounding the rate here avoids failure trying to set a
+			 * new rate on an already enabled bclk. In that
+			 * instance this will just set the same rate as is
+			 * currently in use, and so should continue without
+			 * problem, as long as the BCLK rate is suitable for the
+			 * desired frame size.
+			 */
+			bclk_rate = clk_round_rate(bclk, bclk_rate);
+			if ((bclk_rate / sr) < frame_size) {
+				dev_err(component->dev,
+					"BCLK rate mismatch against frame size");
+				return -EINVAL;
+			}
+
 			ret = clk_set_rate(bclk, bclk_rate);
 			if (ret) {
 				dev_err(component->dev,
@@ -1927,9 +1942,6 @@ static unsigned long da7219_wclk_recalc_rate(struct clk_hw *hw,
 	struct snd_soc_component *component = da7219->component;
 	u8 fs = snd_soc_component_read32(component, DA7219_SR);
 
-	if (!da7219->master)
-		return 0;
-
 	switch (fs & DA7219_SR_MASK) {
 	case DA7219_SR_8000:
 		return 8000;
@@ -2016,9 +2028,6 @@ static unsigned long da7219_bclk_recalc_rate(struct clk_hw *hw,
 	u8 bclks_per_wclk = snd_soc_component_read32(component,
 						     DA7219_DAI_CLK_MODE);
 
-	if (!da7219->master)
-		return 0;
-
 	switch (bclks_per_wclk & DA7219_DAI_BCLKS_PER_WCLK_MASK) {
 	case DA7219_DAI_BCLKS_PER_WCLK_32:
 		return parent_rate * 32;
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
