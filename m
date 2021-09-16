Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EA9140DCA8
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Sep 2021 16:24:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BF1E1189B;
	Thu, 16 Sep 2021 16:23:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BF1E1189B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1631802256;
	bh=tR5BN6pgzVJCIm9MS564ZUOdzytE4hVR/sjg3FzV7Hs=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=thDI4+RuMfwgRy+5KBgbjzMw+8n3MwAoozxyfQKwkcqzoEpynp1HSsgbXrzYkgY04
	 hU0L3bxvoWngtt7/Iplp3xvgh6pnLLfs5sSxsnsE+v4vZtcMBoi2MRL8uwUmFalHQE
	 g//yA8IZQzwB0Nh4syUue7tjff7AMfIOCvZoHGe4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 86B1BF80117;
	Thu, 16 Sep 2021 16:23:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A12CAF8025E; Thu, 16 Sep 2021 16:23:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 44DF5F80113
 for <alsa-devel@alsa-project.org>; Thu, 16 Sep 2021 16:23:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 44DF5F80113
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Z936YNBg"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 89AF961207;
 Thu, 16 Sep 2021 14:23:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631802195;
 bh=tR5BN6pgzVJCIm9MS564ZUOdzytE4hVR/sjg3FzV7Hs=;
 h=From:To:Cc:Subject:Date:From;
 b=Z936YNBgXnlY8U1NiGZgOB+wwboLqye8TnsgTVpKEwRmeYq0KxXAQ2gssAC6AogLr
 KvUFNlEGdLenYPtdBkC2M1BufFRzEDtNYnfayPwshCsLe0qivX/y5vTQxkhUhEWDdz
 6/+lynlTa6fjEGVL/PyqUBeDIuI+BM3lljsugeqAMjKp1yKRys2PRD1lRjhBsHGpVy
 PmE1lDdPR1lGRDOjWExIi2bCSMU0cO3WEGlxkQw1p5SsoyUnBTNMEn0tWVrWBG2RnX
 R7DWKgePYOEGPeY2w+N7Th7amP0C66JmUCSC2JJKZLABQ5XEaB2RM2GbBI/WfxPobB
 h8qOrKpO2Bp4A==
From: Mark Brown <broonie@kernel.org>
To: Lars-Peter Clausen <lars@metafoo.de>,
 =?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
 Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH] ASoC: ad193x: Update to modern clocking terminology
Date: Thu, 16 Sep 2021 15:22:32 +0100
Message-Id: <20210916142232.33914-1-broonie@kernel.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1510; h=from:subject;
 bh=tR5BN6pgzVJCIm9MS564ZUOdzytE4hVR/sjg3FzV7Hs=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBhQ1L/YUv/9rWl/SbQrMzWsDTV3D4EJ3bxIu5nOCxd
 nYjUziyJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCYUNS/wAKCRAk1otyXVSH0MIZB/
 92kfM18EFQ4U66F9P8Ln8quwrwmSDU18dWeoYV4CBGAs7CQft2phLZf0dqtfS9gd8NWt2ErcGWMbXe
 PhOBAdeKFpU5u0t5yI1epNjmHLviyS1qfx2/aaW1j9oSubI9ybK8ZD/PPKN06VaLyWjIbWVv9rFobm
 HetW2NC6hBCTfUfrgr/5QZFz6czo19j8zGQZ6NnVIj81hQMk95QWYvQ/iRsFH8THaAsTB2l+U2pXjP
 NSHlYs+Rkh9uOeI0vsosLysakdWEK/1yK8T+oHtmQxOB3DiFU1h57LGOZXW2Y8KKzOqzmpzEK1aA+R
 ztxPA8t65j5xV8sJRu7sUG9AmazLMY
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
Content-Transfer-Encoding: 8bit
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

As part of moving to remove the old style defines for the bus clocks update
the ad193x driver to use more modern terminology for clocking.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/ad193x.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/sound/soc/codecs/ad193x.c b/sound/soc/codecs/ad193x.c
index 278a55af158b..30b98b4267e1 100644
--- a/sound/soc/codecs/ad193x.c
+++ b/sound/soc/codecs/ad193x.c
@@ -243,22 +243,22 @@ static int ad193x_set_dai_fmt(struct snd_soc_dai *codec_dai,
 	if (fmt & SND_SOC_DAIFMT_DSP_A)
 		dac_fmt ^= AD193X_DAC_LEFT_HIGH;
 
-	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
-	case SND_SOC_DAIFMT_CBM_CFM: /* codec clk & frm master */
+	switch (fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) {
+	case SND_SOC_DAIFMT_CBP_CFP:
 		adc_fmt |= AD193X_ADC_LCR_MASTER;
 		adc_fmt |= AD193X_ADC_BCLK_MASTER;
 		dac_fmt |= AD193X_DAC_LCR_MASTER;
 		dac_fmt |= AD193X_DAC_BCLK_MASTER;
 		break;
-	case SND_SOC_DAIFMT_CBS_CFM: /* codec clk slave & frm master */
+	case SND_SOC_DAIFMT_CBC_CFP:
 		adc_fmt |= AD193X_ADC_LCR_MASTER;
 		dac_fmt |= AD193X_DAC_LCR_MASTER;
 		break;
-	case SND_SOC_DAIFMT_CBM_CFS: /* codec clk master & frame slave */
+	case SND_SOC_DAIFMT_CBP_CFC:
 		adc_fmt |= AD193X_ADC_BCLK_MASTER;
 		dac_fmt |= AD193X_DAC_BCLK_MASTER;
 		break;
-	case SND_SOC_DAIFMT_CBS_CFS: /* codec clk & frm slave */
+	case SND_SOC_DAIFMT_CBC_CFC:
 		break;
 	default:
 		return -EINVAL;
-- 
2.20.1

