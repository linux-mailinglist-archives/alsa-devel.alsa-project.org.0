Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D389C1A807B
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Apr 2020 16:54:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7EC3A1677;
	Tue, 14 Apr 2020 16:53:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7EC3A1677
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1586876083;
	bh=ASF6LkUhxcrDTAUPAw3OuesI60wD6OBCqOnOXYE90Ls=;
	h=Date:From:To:Subject:In-Reply-To:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=qs7Csrv4GknQEC3p0v+P868oOCvVGde0VG7cFEtHGEYl+mpXEuN5tzEBCSoSZc+20
	 Km5RjSa7HG8WhZMaMCERcbTo2JOydRTntLygmh0hfDOWr91I5hNTYaAjNELYZF+pXV
	 PiCp+BLXSXSl24Wa7ubyQ7xypEnnjWniIGRRnGLk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 23B7BF80316;
	Tue, 14 Apr 2020 16:47:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C7FE8F80321; Tue, 14 Apr 2020 16:46:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0C472F80317
 for <alsa-devel@alsa-project.org>; Tue, 14 Apr 2020 16:46:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0C472F80317
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="xHATSOuS"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 047DD2076D;
 Tue, 14 Apr 2020 14:46:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1586875615;
 bh=ASF6LkUhxcrDTAUPAw3OuesI60wD6OBCqOnOXYE90Ls=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=xHATSOuSFhjSn+7j5wZTQu5MQAzyWKfBJQo91eT/UcyNEezxWjMyf07sDTvBpTlRI
 k/bmiLaRkbPq866dtxn3j5DmbTxtxRbYgOZ+dcc6KQQnKkmFWJFCiJ5NLI6HlKr3oG
 dpeicreDvNv6FiP7zas+e0XJCRtWeohawKyRgEHs=
Date: Tue, 14 Apr 2020 15:46:52 +0100
From: Mark Brown <broonie@kernel.org>
To: Jason Yan <yanaijie@huawei.com>
Subject: Applied "ASoC: wm8900: remove some defined but not used symbols" to
 the asoc tree
In-Reply-To: <20200407082932.41511-5-yanaijie@huawei.com>
Message-Id: <applied-20200407082932.41511-5-yanaijie@huawei.com>
X-Patchwork-Hint: ignore
Cc: alsa-devel@alsa-project.org, tiwai@suse.com, lgirdwood@gmail.com,
 Hulk Robot <hulkci@huawei.com>, Mark Brown <broonie@kernel.org>
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

   ASoC: wm8900: remove some defined but not used symbols

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

From 4c979a775432f8a1c9b6cfd9bf466eba05e96c9d Mon Sep 17 00:00:00 2001
From: Jason Yan <yanaijie@huawei.com>
Date: Tue, 7 Apr 2020 16:29:32 +0800
Subject: [PATCH] ASoC: wm8900: remove some defined but not used symbols
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Fix the following gcc warning:

sound/soc/codecs/wm8900.c:449:38: warning:
‘wm8900_dapm_routput2_control’ defined but not used
[-Wunused-const-variable=]
 static const struct snd_kcontrol_new wm8900_dapm_routput2_control =
                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
sound/soc/codecs/wm8900.c:446:38: warning:
‘wm8900_dapm_loutput2_control’ defined but not used
[-Wunused-const-variable=]
 static const struct snd_kcontrol_new wm8900_dapm_loutput2_control =
                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Jason Yan <yanaijie@huawei.com>
Link: https://lore.kernel.org/r/20200407082932.41511-5-yanaijie@huawei.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/wm8900.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/sound/soc/codecs/wm8900.c b/sound/soc/codecs/wm8900.c
index 271235a69c01..3e239fa9bc8d 100644
--- a/sound/soc/codecs/wm8900.c
+++ b/sound/soc/codecs/wm8900.c
@@ -443,12 +443,6 @@ SOC_SINGLE("LINEOUT2 LP -12dB", WM8900_REG_LOUTMIXCTL1,
 
 };
 
-static const struct snd_kcontrol_new wm8900_dapm_loutput2_control =
-SOC_DAPM_SINGLE("LINEOUT2L Switch", WM8900_REG_POWER3, 6, 1, 0);
-
-static const struct snd_kcontrol_new wm8900_dapm_routput2_control =
-SOC_DAPM_SINGLE("LINEOUT2R Switch", WM8900_REG_POWER3, 5, 1, 0);
-
 static const struct snd_kcontrol_new wm8900_loutmix_controls[] = {
 SOC_DAPM_SINGLE("LINPUT3 Bypass Switch", WM8900_REG_LOUTMIXCTL1, 7, 1, 0),
 SOC_DAPM_SINGLE("AUX Bypass Switch", WM8900_REG_AUXOUT_CTL, 7, 1, 0),
-- 
2.20.1

