Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 03A043D4025
	for <lists+alsa-devel@lfdr.de>; Fri, 23 Jul 2021 20:04:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 77DDC174E;
	Fri, 23 Jul 2021 20:03:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 77DDC174E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1627063454;
	bh=j23TEeD42NGRQYH9NNqj/f9W0pPiNSNhlfSaEpInLJA=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=GPWcLN7Xvn3ovVrfYgY6sCsTyjV3DSLwBweiUIILv3Jd8/ABNFxFCS6N7WTPToN4o
	 QX5Nx8OJLQVl35Eg18LR16fNqdZ23odUEq8VwUo5vpVPoGGaFLMtGifFPt4gVAIfTN
	 bHREMY8tKk1HT0Ra3gthqhtxarU/wmiqIVUpoAmc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F1090F804AD;
	Fri, 23 Jul 2021 20:02:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7C11DF804AC; Fri, 23 Jul 2021 20:02:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 315DBF800DA
 for <alsa-devel@alsa-project.org>; Fri, 23 Jul 2021 20:02:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 315DBF800DA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="BKC1eOKv"
Received: by mail.kernel.org (Postfix) with ESMTPSA id E5EF060ED7;
 Fri, 23 Jul 2021 18:02:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1627063360;
 bh=j23TEeD42NGRQYH9NNqj/f9W0pPiNSNhlfSaEpInLJA=;
 h=From:To:Cc:Subject:Date:From;
 b=BKC1eOKvUlR0UX+nX7tcXIRsICuFDxKThTu3h6h3cY8dlNxYUfckY5lgJ4ISEyQWF
 mGWZr5aXhazBkSCQdxk6AOIhUDoKTPu4ix0seXSmevCipx9XwPPVXvVV7mwvANfGCr
 IXL+qS3FWB8k5nQeURPRTYJeuNmlc1YBxBb+eWkDoU6rShc0Cl5tQG77kZQN2mgA+h
 VNgIE4xmEKZvslh4qAov5NjsPrRf4/KDp17+HjnwgloHuCPTm/AIKUOuraXeE0UJVu
 68PzfElsGcIsX3wO8GjL6BNbHZf8GFaHwGpuu/VH/O9MZQaHYsEA0oxVGrculF4itJ
 LCrMBQZdyMVnw==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH] ASoC: tlv320aic31xx: Fix jack detection after suspend
Date: Fri, 23 Jul 2021 19:02:00 +0100
Message-Id: <20210723180200.25105-1-broonie@kernel.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1521; h=from:subject;
 bh=j23TEeD42NGRQYH9NNqj/f9W0pPiNSNhlfSaEpInLJA=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBg+wPvfko+Pga06CbPEZWf7AVXi5O5v7NBHhwSli3C
 ubkQrv6JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCYPsD7wAKCRAk1otyXVSH0PVDCA
 CBiIAf/ZXULsHHoxvMGfOk4/urps+Ez/GQ8SLo/+p63x680ggiWnQNqpc4y/yqr7mk35CAIvPjG/CB
 6xlE4VEykGWHfi95EVthb1QYrFd0+2JlKBkjMgyO2h3nE+i31Gp9g6KmIKqpT4HxPdGFBCh6Lhfxvd
 OweFbB3KqNjnXg1LUm8vX+o1w6nBuz5Ns8e9N9WnmKJpuqi3pRWRCthqnhwK1S2VmoQykZrPr6palw
 L2qj+zOkPLLL7SXa4ACJJZVifSduhKZjfIdl5JrPFgv9Swj+7L1uhQWesudf76g+cOiDGWIsGLLe7G
 w40+2vg/Lt8RAVY9ZB2uszPujkusxt
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

The tlv320aic31xx driver relies on regcache_sync() to restore the register
contents after going to _BIAS_OFF, for example during system suspend. This
does not work for the jack detection configuration since that is configured
via the same register that status is read back from so the register is
volatile and not cached. This can also cause issues during init if the jack
detection ends up getting set up before the CODEC is initially brought out
of _BIAS_OFF, we will reset the CODEC and resync the cache as part of that
process.

Fix this by explicitly reapplying the jack detection configuration after
resyncing the register cache during power on.

This issue was found by an engineer working off-list on a product
kernel, I just wrote up the upstream fix.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/tlv320aic31xx.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/sound/soc/codecs/tlv320aic31xx.c b/sound/soc/codecs/tlv320aic31xx.c
index b504d63385b3..e3da8f41fd1a 100644
--- a/sound/soc/codecs/tlv320aic31xx.c
+++ b/sound/soc/codecs/tlv320aic31xx.c
@@ -1256,6 +1256,13 @@ static int aic31xx_power_on(struct snd_soc_component *component)
 		return ret;
 	}
 
+	/*
+	 * The jack detection configuration is in the same register
+	 * that is used to report jack detect status so is volatile
+	 * and not covered by the cache sync, restore it separately.
+	 */
+	aic31xx_set_jack(component, aic31xx->jack, NULL);
+
 	return 0;
 }
 
-- 
2.20.1

