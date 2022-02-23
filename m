Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E2A8F4C05D5
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Feb 2022 01:18:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BE0F518ED;
	Wed, 23 Feb 2022 01:17:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BE0F518ED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645575518;
	bh=2et3GK+Rrdc/8NHSJulL0FZn7vFRL1a3lpTGFAMN2ew=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ix6L5rijCivfOzBDuzCiuBHcShEtl5Josrgy2zrtQ47X9vZm3kE1wjYinffe/a25G
	 eylquZosJ3+EGKAXa9JkRLZ/Kbf6lnjHvmDuCsQSOXmODu07l5jD7Rfi6ylXH/Oila
	 fqi5A+I8rXw8yXPB5DWJQpJRUoXUnCb/S0Dxy+vA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 58C24F80224;
	Wed, 23 Feb 2022 01:17:48 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8B205F80224; Wed, 23 Feb 2022 01:17:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2FFA1F8012C
 for <alsa-devel@alsa-project.org>; Wed, 23 Feb 2022 01:17:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2FFA1F8012C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Uz+W36qd"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B6B4B61260;
 Wed, 23 Feb 2022 00:17:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E624C340F0;
 Wed, 23 Feb 2022 00:17:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645575462;
 bh=2et3GK+Rrdc/8NHSJulL0FZn7vFRL1a3lpTGFAMN2ew=;
 h=From:To:Cc:Subject:Date:From;
 b=Uz+W36qd15Nw9ZRROD3zK7GKzOTE8UXeVJeLa263eORSbzXjaeWz3h3hMbw1tNI7J
 +IUxofcjWLVUluFPCUEpLRF6K/5OX9kvVNLOGEqztdY/RF6zhsjtaWEKLuCQQ9KOmK
 +BXFLIvCf85OfVX4i4e62IzY0ChAY3nP+rqXlkmQAmvWZfNTBlFc+kpB87mI4cJNGX
 plzfGbCqIojqCUQdTf9mTU0RKZA7uvPAn5pBqseMITqa1MXZBVJJ+olIfpQh7p1iMs
 mFZLaV81laAOBqd7fQ+vz2+mqTL4gNHisyFLOw58WEFUWzIKafLzQRoEP1yIgRMGVt
 VRwDITFmh8Aow==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH] ASoC: si476x: Use modern ASoC DAI format terminology
Date: Wed, 23 Feb 2022 00:17:37 +0000
Message-Id: <20220223001737.1360028-1-broonie@kernel.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=805; h=from:subject;
 bh=2et3GK+Rrdc/8NHSJulL0FZn7vFRL1a3lpTGFAMN2ew=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBiFX0Y4ZCv8zJnot/aWMPy1WtPdIEn+j8qe6B49Ido
 66INrliJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCYhV9GAAKCRAk1otyXVSH0D71B/
 wKDZ2ZkYGk8Ufv5laHJqunaus/YiLaaHuhexqA3Xyuk1BWO6BO+/GVzm+UmVp2QUxVDH8uR9FBwCiC
 h2ZjlPGF/N3CERTYNQ1Jo4yI8ksebYp5jQhpbfyTvOtFt77lOyJ+aCbHvs2RYMzVIJMUo3a+OKwOkx
 yEctOpnDrAl6TiCN5yHNB80rv72AN3/GKqcjV0CxyHKi36cbkOOkMHsSU7+T55jkgoB74mMMF2faaS
 3m/VDLhRJOKKC/fu3Pp1hAmbU9XOUxLVwkOy0nnbSbUovooCEmv426MIiG/3xnXcmkkVAeACAvEqiZ
 88OudaqXrSUOcwC+9AIDBX8zLQ+Fja
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
the si476x driver to use more modern terminology for clocking.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/si476x.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/si476x.c b/sound/soc/codecs/si476x.c
index 8d88db9c11a6..8bd2edf70f13 100644
--- a/sound/soc/codecs/si476x.c
+++ b/sound/soc/codecs/si476x.c
@@ -69,7 +69,7 @@ static int si476x_codec_set_dai_fmt(struct snd_soc_dai *codec_dai,
 	int err;
 	u16 format = 0;
 
-	if ((fmt & SND_SOC_DAIFMT_MASTER_MASK) != SND_SOC_DAIFMT_CBS_CFS)
+	if ((fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) != SND_SOC_DAIFMT_CBC_CFC)
 		return -EINVAL;
 
 	switch (fmt & SND_SOC_DAIFMT_FORMAT_MASK) {
-- 
2.30.2

