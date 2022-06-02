Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B97FD53B93A
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Jun 2022 14:59:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 520FC173C;
	Thu,  2 Jun 2022 14:58:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 520FC173C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654174764;
	bh=sRymWTRrRpXvMY4RAdnnnU/mXRJmd3zsQqLNuqwTV68=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=oOyRCsPQtnc8urNjw/CuP/Uvi1RL5b2+MIooJkCw5LHHk/uAK65ktwTU0xb8OUbrB
	 eXciGbvQqNsq7R0iFWLTfiSF71Kn9jISw1ek6KUZj1z5Ri1n2yTIFMcG/B+Wz2NcEK
	 ao6MJ6brX7YM3e1DdnFj2+z+Kd59UNFW/M7HtOKc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CAE95F80089;
	Thu,  2 Jun 2022 14:58:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 40E21F80236; Thu,  2 Jun 2022 14:58:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D1E36F80149
 for <alsa-devel@alsa-project.org>; Thu,  2 Jun 2022 14:58:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D1E36F80149
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="uzBrlsnV"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E051161740;
 Thu,  2 Jun 2022 12:58:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64B7AC385A5;
 Thu,  2 Jun 2022 12:58:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1654174699;
 bh=sRymWTRrRpXvMY4RAdnnnU/mXRJmd3zsQqLNuqwTV68=;
 h=From:To:Cc:Subject:Date:From;
 b=uzBrlsnVuK/+DNj9FblcXFTGJPt3EGDjR4WNK5Jq47KfBUcGA0GbMMvlqWC9H4sE8
 7bsPucTnfNxEjConnzdirjfIDEW+g6onupZMCwNGEAJ6i7VfmJddEgK+BZTz9zZRjs
 p4rIWivyd+TxfX2CpSFoC7SHEgqRtRM+YIcOF8JGOdfiKErBpdJVFvKBzD5gnldDjE
 f0NIiWFqBiG5dTJIcW8jwnNdkYllVHELmAcKRtq+hHSXOoCsIasL/BDsXjTtR1ezgd
 kVxt3WtOR1VfFqdpz0ObK7evcWX1R0rTEYSIDGhn4ImlvbhAm5oxE0dEYdmYeNgwwL
 vMJ60BxyN4e0Q==
From: Mark Brown <broonie@kernel.org>
To: Peter Rosin <peda@axentia.se>,
	Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH] ASoC: max9860: Use modern ASoC DAI format terminology
Date: Thu,  2 Jun 2022 14:58:12 +0200
Message-Id: <20220602125812.3551947-1-broonie@kernel.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=979; h=from:subject;
 bh=sRymWTRrRpXvMY4RAdnnnU/mXRJmd3zsQqLNuqwTV68=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBimLOt98wdMHSJPBfDpHNTVmPtEZkhFshwesH6i0ac
 3D7cML2JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCYpizrQAKCRAk1otyXVSH0EfoCA
 CE0wenUj6f+Zj6uWxSvhLiRqk7Bp1k8bcl6yK8WWXiWb38YjHeQsn/BTaA9QJ348epe+LgBih+sTcv
 MjRoAByn2lcx5Sxcw0EHXxmYcYRKtigbyN4o0e284347N3DolKZmXanti5D3kWk3b+xeCVcukpbFRQ
 1x31R/K5+S+3B8yAaY/rZMnVsZWykZtUcLAUxIWSXJ6iGOSdBptlayeLDealtXGFxhaBaqgsssEm9u
 oD457leK6LKWNIZeLYl9PzSanzmxNySOyBpp2SavrIXpY/NU8imjeF6Ay0qGoLCuMrIn8TQhzml4MB
 CIB7qHiYqWy3oYkhCi8FgyGao5GPoK
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
the max9860 driver to use more modern terminology for clocking.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/max9860.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/max9860.c b/sound/soc/codecs/max9860.c
index 82f20a8e27ad..a1d0179e12c7 100644
--- a/sound/soc/codecs/max9860.c
+++ b/sound/soc/codecs/max9860.c
@@ -448,9 +448,9 @@ static int max9860_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 	struct snd_soc_component *component = dai->component;
 	struct max9860_priv *max9860 = snd_soc_component_get_drvdata(component);
 
-	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
-	case SND_SOC_DAIFMT_CBM_CFM:
-	case SND_SOC_DAIFMT_CBS_CFS:
+	switch (fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) {
+	case SND_SOC_DAIFMT_CBP_CFP:
+	case SND_SOC_DAIFMT_CBC_CFC:
 		max9860->fmt = fmt;
 		return 0;
 
-- 
2.30.2

