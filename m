Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D74AC411ABA
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Sep 2021 18:50:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 367DA16CF;
	Mon, 20 Sep 2021 18:49:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 367DA16CF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1632156620;
	bh=iOQZ+EkcLyMgSe78sfBADbvkr2P5sRfxc0rlYKQvG3A=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=l3nvoeb/NxoPm5QghjDOWdv161WL4YKyE0W7ltuJX258TEfCUXeY3y2ngCimWW47D
	 4f3P2FZHDS2vBzKqSI9edWFpEUF7LJ2w0sH0jlWDVO5G26dcuGc/ofLcXIP+OzJvJG
	 xlD6Ep7Mwysxf8NquN6GnYVBA2gLeDNEP/WE0sd0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8A7EFF80246;
	Mon, 20 Sep 2021 18:49:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ADF18F8025D; Mon, 20 Sep 2021 18:49:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
 SPF_HELO_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0FE75F80152
 for <alsa-devel@alsa-project.org>; Mon, 20 Sep 2021 18:48:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0FE75F80152
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="py68BEt+"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 20F506127B;
 Mon, 20 Sep 2021 16:48:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1632156518;
 bh=iOQZ+EkcLyMgSe78sfBADbvkr2P5sRfxc0rlYKQvG3A=;
 h=From:To:Cc:Subject:Date:From;
 b=py68BEt+d6hS4iFQSIR88pfIsfmco2BWzaHgZAGHCFtIQxHTy1CgcYyhcsmswzWEA
 JvHwxT+yutyXAsphwz3wDbzO7PqHah37gN01wXmpKrgNHoUa1qqMFhDqYn3+/uh0LL
 2q4WtnJDklUC8/vY4f8iZbzFzRSxxI3sWQDLT9bNO+rI1y8PaaGLUYHug9ZH6mfhip
 438VCyBStvCekIybb1lZhOK7AlYYT3eqqje0vBhaLMCR/kyzXKrlhtUjZlNSFGfARp
 JHr3RnMkKcxf2O7TUGDl7ks8GggM8lwpmlPeTgcqchsoPkJ+3/n9UCMBJHxWy6zJZ4
 zwlbCRjiZcvhQ==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH] ASoC: ak5558: Use modern ASoC DAI format terminology
Date: Mon, 20 Sep 2021 17:47:53 +0100
Message-Id: <20210920164753.17030-1-broonie@kernel.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1111; h=from:subject;
 bh=iOQZ+EkcLyMgSe78sfBADbvkr2P5sRfxc0rlYKQvG3A=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBhSLq53tJPUWI26Zoq1GSczVk/Lu2cTvV+jFT/zndZ
 +jh4VK6JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCYUi6uQAKCRAk1otyXVSH0FhAB/
 4u35YGXC0fsm8gc5kwZ9FUH7itLRnrXysKpiR4L74z5bwEdRLAm+vuX0zsciAXNjLwpSAH5DRcqae5
 +vCzlCZ3r6X33paX3l1M8HuncHED5DD6zZ7htxo9GW4HcY/SKVxYydxon/tYOrQIUPJ55XzmjvtpTu
 Wnm0RH1zaLk4qnMxR3Y8ZbHKUk3rb7FUZdaMtwAHs9ebiTEGX9/70x9gs77GjhcXrTzBiSnwJ+IOtk
 Itq4RKYn0nvetgRXUKmKzp8fUYJ7xgfkOyLXVYN3WnJKMhjTPQoPcEsyUUOh8+hKMVMH/nj2U8Jdl+
 6K2e6NmZFD8rCegFLfDJlJEgkTA5A+
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
the ak5558 driver to use more modern terminology for clocking.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/ak5558.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/sound/soc/codecs/ak5558.c b/sound/soc/codecs/ak5558.c
index 37d4600b6f2c..c94cfde3e4a8 100644
--- a/sound/soc/codecs/ak5558.c
+++ b/sound/soc/codecs/ak5558.c
@@ -198,13 +198,13 @@ static int ak5558_set_dai_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 	struct snd_soc_component *component = dai->component;
 	u8 format;
 
-	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
-	case SND_SOC_DAIFMT_CBS_CFS:
+	switch (fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) {
+	case SND_SOC_DAIFMT_CBC_CFC:
 		break;
-	case SND_SOC_DAIFMT_CBM_CFM:
+	case SND_SOC_DAIFMT_CBP_CFP:
 		break;
-	case SND_SOC_DAIFMT_CBS_CFM:
-	case SND_SOC_DAIFMT_CBM_CFS:
+	case SND_SOC_DAIFMT_CBC_CFP:
+	case SND_SOC_DAIFMT_CBP_CFC:
 	default:
 		dev_err(dai->dev, "Clock mode unsupported");
 		return -EINVAL;
-- 
2.20.1

