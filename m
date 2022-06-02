Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5114953BA34
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Jun 2022 15:56:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E587617A8;
	Thu,  2 Jun 2022 15:55:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E587617A8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654178174;
	bh=qcrPqk3+45ISAc5HSWjLgTQRi8UwFHLUSM3O578HDgY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ncGJ63VIJep+T52gsmnYGF6bLkl8442JDzsHaApFPIhksPeR8anW8MjiQrnRTgRCh
	 28IDGEorPadsVGKI1EhmAkW4iagyyD9xdboqcU0IhEKmhOHEOR+auDWX6GH3xzGIOr
	 irGczskFfgZcg+PS+dLiJ+Ud2Qm+CKh43ctQgwhU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7286BF80552;
	Thu,  2 Jun 2022 15:53:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3D29FF80544; Thu,  2 Jun 2022 15:53:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 57F04F80539
 for <alsa-devel@alsa-project.org>; Thu,  2 Jun 2022 15:53:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 57F04F80539
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="O4yV31sk"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id AC269617CF;
 Thu,  2 Jun 2022 13:53:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8AC2C34119;
 Thu,  2 Jun 2022 13:53:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1654178011;
 bh=qcrPqk3+45ISAc5HSWjLgTQRi8UwFHLUSM3O578HDgY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=O4yV31skyKOi9DKVGIttMWLXWuNL0cnQkRiPbDLLd2lnKf8E1JGNlYn44PvMNMsuB
 cSIpo5epicFdgCM5yz/MYNvrA2gTuLvB1ROiQaA9gYl0G6VZNP01KbdjNhyEmnl5aE
 35BfLjH/0ptJFwr2bb8Zpjyk/i/pIy1YWOwJyyyC6WzvN6VOmvqPY99lBxnfpI4GTr
 1ZPLxyZUrdGar/9y8RGyEHnU1M/mPOdIiajbs4y5NKPY2zpSHTgtwGd0qaDTjeiWoL
 9KsWVj0CTlMZ/HT+r8bG9kr0cb+ltqSAIw7sZIDw7yva9n/Nj3aP4JKTjms3JNjTHV
 EKsh70S9VXR7A==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH 08/20] ASoC: tas2770: Use modern ASoC DAI format terminology
Date: Thu,  2 Jun 2022 15:53:04 +0200
Message-Id: <20220602135316.3554400-9-broonie@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220602135316.3554400-1-broonie@kernel.org>
References: <20220602135316.3554400-1-broonie@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=970; h=from:subject;
 bh=qcrPqk3+45ISAc5HSWjLgTQRi8UwFHLUSM3O578HDgY=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBimMCU63B688Jiv1CtXMhAMkzG5AuX1aWVTRnq1NkI
 3UzMldeJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCYpjAlAAKCRAk1otyXVSH0Mk1B/
 49WsNBZIEcs8WoQTQ4T/Doer5o0wl0vLmbwqZ2Nsz0fBZVSqgwF79831XPFCAnMfeEda+94ACdEMl3
 xslGXGw7nrp/Xzz08z3MlkUkboRHCWyWPdxgJkbADXG6ObCELv2j+eBGR/A3pMwYAvrTEOSCM3+UrB
 EEooMPx473RCfz1OXIVlop7/SEQHx2l/49Fk66zqp73nWfFYB6VHdl/q1069QsyU1WxCmMyO0UBXIQ
 aAvIkpHRNIt4ykONt3LIqnw+86TgYASOGYpelM1j6ndzSRaD/wYBRco6iM6kctwVM7sBT/Z/Wx990F
 jWg2XfgM+ius+N5ph2Hdq6mr87ccHL
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
the tas2770 driver to use more modern terminology for clocking.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/tas2770.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/tas2770.c b/sound/soc/codecs/tas2770.c
index c1dbd978d550..f6037a148cb6 100644
--- a/sound/soc/codecs/tas2770.c
+++ b/sound/soc/codecs/tas2770.c
@@ -340,11 +340,11 @@ static int tas2770_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 	u8 tdm_rx_start_slot = 0, asi_cfg_1 = 0;
 	int ret;
 
-	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
-	case SND_SOC_DAIFMT_CBS_CFS:
+	switch (fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) {
+	case SND_SOC_DAIFMT_CBC_CFC:
 		break;
 	default:
-		dev_err(tas2770->dev, "ASI format master is not found\n");
+		dev_err(tas2770->dev, "ASI invalid DAI clocking\n");
 		return -EINVAL;
 	}
 
-- 
2.30.2

