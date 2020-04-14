Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 59A211A8044
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Apr 2020 16:48:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F229C16B5;
	Tue, 14 Apr 2020 16:48:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F229C16B5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1586875733;
	bh=mpVKItI1FPPfN/gbBhLGz5jUlFal1zEoAn6lKwc4wP8=;
	h=Date:From:To:Subject:In-Reply-To:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=YHb7TLsMqF/YkhuneBq+82ASUOXwhT3zIadsLPAo1Zysy0KbDRsH+6+gMFd56i9WJ
	 BG+Q5L/ITsIMs80Ncdef10a1BgF34uYCFlW8UDcnXGz9ldwNHi+8I2GROPXPvC4ksu
	 Wqn9i9vqbUzAvVg+cNI/F9lPD+qerkeiYeEI40+8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6DE3EF80290;
	Tue, 14 Apr 2020 16:46:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D6687F8028F; Tue, 14 Apr 2020 16:46:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 95F84F80278
 for <alsa-devel@alsa-project.org>; Tue, 14 Apr 2020 16:46:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 95F84F80278
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="vjB+X8Ve"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id EE1322076D;
 Tue, 14 Apr 2020 14:46:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1586875563;
 bh=mpVKItI1FPPfN/gbBhLGz5jUlFal1zEoAn6lKwc4wP8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=vjB+X8VePvvwIr7nj1DDpcc8NyWu/itzQh7UcJiwcJ/XTDSxLvPupsoRVoghMSFyf
 UNOPncwMJ2nuwhU7CaC0dSt3xmhEyvApwh+1HeH0Ir9mM+hwKLucxcwK6sQxyOpixn
 ETvdr1CKTRFTTnu0efn4+ount96mSlm340jBiB8U=
Date: Tue, 14 Apr 2020 15:46:00 +0100
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Applied "ASoC: wsa881x: mark read_only_wordlength flag" to the asoc
 tree
In-Reply-To: 
Message-Id: 
X-Patchwork-Hint: ignore
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

The patch

   ASoC: wsa881x: mark read_only_wordlength flag

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git 

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

From 0f2a3b02274c02eb97697c4d89c019d1d21ac225 Mon Sep 17 00:00:00 2001
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Date: Tue, 14 Apr 2020 12:03:47 +0100
Subject: [PATCH] ASoC: wsa881x: mark read_only_wordlength flag

WSA881x works in PDM mode so the wordlength is fixed, which also makes
the only field "WordLength" in DPN_BlockCtrl1 register a read-only.
Writing to this register will throw up errors with Qualcomm Controller.
So use ro_blockctrl1_reg flag to mark this field as read-only so that
core will not write to this register.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Reviewed-by: Vinod Koul <vkoul@kernel.org>
Link: https://lore.kernel.org/r/20200414110347.23829-1-srinivas.kandagatla@linaro.org
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/wsa881x.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/soc/codecs/wsa881x.c b/sound/soc/codecs/wsa881x.c
index f2d6f2f81f14..d39d479e2378 100644
--- a/sound/soc/codecs/wsa881x.c
+++ b/sound/soc/codecs/wsa881x.c
@@ -394,6 +394,7 @@ static struct sdw_dpn_prop wsa_sink_dpn_prop[WSA881X_MAX_SWR_PORTS] = {
 		.min_ch = 1,
 		.max_ch = 1,
 		.simple_ch_prep_sm = true,
+		.read_only_wordlength = true,
 	}, {
 		/* COMP */
 		.num = 2,
@@ -401,6 +402,7 @@ static struct sdw_dpn_prop wsa_sink_dpn_prop[WSA881X_MAX_SWR_PORTS] = {
 		.min_ch = 1,
 		.max_ch = 1,
 		.simple_ch_prep_sm = true,
+		.read_only_wordlength = true,
 	}, {
 		/* BOOST */
 		.num = 3,
@@ -408,6 +410,7 @@ static struct sdw_dpn_prop wsa_sink_dpn_prop[WSA881X_MAX_SWR_PORTS] = {
 		.min_ch = 1,
 		.max_ch = 1,
 		.simple_ch_prep_sm = true,
+		.read_only_wordlength = true,
 	}, {
 		/* VISENSE */
 		.num = 4,
@@ -415,6 +418,7 @@ static struct sdw_dpn_prop wsa_sink_dpn_prop[WSA881X_MAX_SWR_PORTS] = {
 		.min_ch = 1,
 		.max_ch = 1,
 		.simple_ch_prep_sm = true,
+		.read_only_wordlength = true,
 	}
 };
 
-- 
2.20.1

