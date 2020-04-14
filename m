Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BC5D41A8049
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Apr 2020 16:49:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 66EBE169C;
	Tue, 14 Apr 2020 16:48:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 66EBE169C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1586875778;
	bh=550yDRRNFH/KAKBnw/zzOaMx4yYeCB4m9knrvjHhjMk=;
	h=Date:From:To:Subject:In-Reply-To:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=LcXlJi7J4KtZ1IWmuoAUzBM5Rjcyq0iMjC50eAdeI9kxJ70UGdT+VPtBGZbr6UBI2
	 VrnuZzJ55USn3qVCKG0Uzha4aLYYCbhQFeYol5697fg3JPC8nbVK0nmZiiiJ9bycq2
	 KkqNVJ1g2hc8Q3r/at7i15c6EwTRGMDdMu4Moa8c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3B9B9F8029A;
	Tue, 14 Apr 2020 16:46:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A1377F8029A; Tue, 14 Apr 2020 16:46:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CEC0DF8028D
 for <alsa-devel@alsa-project.org>; Tue, 14 Apr 2020 16:46:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CEC0DF8028D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="tQXk7Bs2"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A7C512076D;
 Tue, 14 Apr 2020 14:46:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1586875569;
 bh=550yDRRNFH/KAKBnw/zzOaMx4yYeCB4m9knrvjHhjMk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=tQXk7Bs2mmJoHSR0U1aT1XOibvgfQAeB0u3K7jGl7yto1Qe3iqVCOLvuygK6ZCPej
 d2jkNnJYllIIcikjYkc/wjVnjEPcfMc9DeYGghPL9VsHXcqxTji2fujd7y4bdjxMF6
 DqmIziBSu59Kj5cQwWn5h70iRpTu8E1Zdzef+B0Q=
Date: Tue, 14 Apr 2020 15:46:06 +0100
From: Mark Brown <broonie@kernel.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Applied "ASoC: qcom: common: Silence duplicate parse error messages"
 to the asoc tree
In-Reply-To: <20200406003229.2354631-1-bjorn.andersson@linaro.org>
Message-Id: <applied-20200406003229.2354631-1-bjorn.andersson@linaro.org>
X-Patchwork-Hint: ignore
Cc: alsa-devel@alsa-project.org, Banajit Goswami <bgoswami@codeaurora.org>,
 Patrick Lai <plai@codeaurora.org>, Takashi Iwai <tiwai@suse.com>,
 linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, srinivas.kandagatla@linaro.org
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

   ASoC: qcom: common: Silence duplicate parse error messages

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

From d0c56b307f37fd21e2424d3c210e5d85831dd132 Mon Sep 17 00:00:00 2001
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Date: Sun, 5 Apr 2020 17:32:29 -0700
Subject: [PATCH] ASoC: qcom: common: Silence duplicate parse error messages

All error paths in qcom_snd_parse_of() prints more specific error
messages, so silence the one in apq8096_platform_probe() and
sdm845_snd_platform_probe() to avoid spamming the kernel log.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Link: https://lore.kernel.org/r/20200406003229.2354631-1-bjorn.andersson@linaro.org
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/qcom/apq8096.c | 4 +---
 sound/soc/qcom/sdm845.c  | 4 +---
 2 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/sound/soc/qcom/apq8096.c b/sound/soc/qcom/apq8096.c
index d55e3ad96716..287ad2aa27f3 100644
--- a/sound/soc/qcom/apq8096.c
+++ b/sound/soc/qcom/apq8096.c
@@ -116,10 +116,8 @@ static int apq8096_platform_probe(struct platform_device *pdev)
 	card->dev = dev;
 	dev_set_drvdata(dev, card);
 	ret = qcom_snd_parse_of(card);
-	if (ret) {
-		dev_err(dev, "Error parsing OF data\n");
+	if (ret)
 		goto err;
-	}
 
 	apq8096_add_be_ops(card);
 	ret = snd_soc_register_card(card);
diff --git a/sound/soc/qcom/sdm845.c b/sound/soc/qcom/sdm845.c
index b2de65c7f95c..68e9388ff46f 100644
--- a/sound/soc/qcom/sdm845.c
+++ b/sound/soc/qcom/sdm845.c
@@ -559,10 +559,8 @@ static int sdm845_snd_platform_probe(struct platform_device *pdev)
 	card->dev = dev;
 	dev_set_drvdata(dev, card);
 	ret = qcom_snd_parse_of(card);
-	if (ret) {
-		dev_err(dev, "Error parsing OF data\n");
+	if (ret)
 		goto parse_dt_fail;
-	}
 
 	data->card = card;
 	snd_soc_card_set_drvdata(card, data);
-- 
2.20.1

