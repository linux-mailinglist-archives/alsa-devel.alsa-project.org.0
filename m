Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EE4F4C049D
	for <lists+alsa-devel@lfdr.de>; Tue, 22 Feb 2022 23:28:44 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 045FC182B;
	Tue, 22 Feb 2022 23:27:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 045FC182B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645568924;
	bh=dwmkCAg4yzp3dQo7YjSrCBPVhlryKnZNxbo5oOtkjL8=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=BQksxVOGkI+NeNwkl5/74ZnuFdvFbbDsR+v9j+Al+BE8+GMEuStgMbIV8Oi7VYXJw
	 jHllUCvtXZ4jvyrEfxwXSZRat2o74vuVD1h+vnLXNYDF0YVGSWX/UcH6CtiQMxB+Kt
	 BuTXrzfAfkfP0GZoEzoU8TSMn1NxhJgfw2R0ZJEo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 57BE2F801F5;
	Tue, 22 Feb 2022 23:27:37 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A5D75F800D1; Tue, 22 Feb 2022 23:27:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5346BF800D1
 for <alsa-devel@alsa-project.org>; Tue, 22 Feb 2022 23:27:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5346BF800D1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="LE8PzEDS"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 48D06617E8;
 Tue, 22 Feb 2022 22:27:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4276C340E8;
 Tue, 22 Feb 2022 22:27:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645568847;
 bh=dwmkCAg4yzp3dQo7YjSrCBPVhlryKnZNxbo5oOtkjL8=;
 h=From:To:Cc:Subject:Date:From;
 b=LE8PzEDSlM4TYVDCSEJ+RMAGtdf+9pb1/NXtIdgcIirgPdSEnDg66MQSxb7S7+h5g
 buPmnt3Ca3PC0lsqorlXAvY3o12nPmo0NnRdK8QlrpUocLbXRFMTovmAzQmBjIY3Gl
 hHaHzMOGPNRm6qm1AONvbVBsjA41x3x38eKnX54ISxF3geyTaxZz7N1ctCxtGB3I61
 qItckEYwuLRE95qRB39abyJeqJj1Kn8mp0QgHOj4vuCYPvV7TJiq2447xFkcUOO4KT
 AAM0IQ4A1sT1QrkyftijX+NSNhV4u89kXVZpcZJNNFqpn2S3x/Iyl3UhJrL/pyZTbm
 MAebp0uYrkCOQ==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH] ASoC: es7134: Use modern ASoC DAI format terminology
Date: Tue, 22 Feb 2022 22:27:15 +0000
Message-Id: <20220222222715.2994339-1-broonie@kernel.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=806; h=from:subject;
 bh=dwmkCAg4yzp3dQo7YjSrCBPVhlryKnZNxbo5oOtkjL8=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBiFWMkO3YDmWVe9R+t0JQWAFyAEY0r8o3l2yKwvwFU
 1BbUFn6JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCYhVjJAAKCRAk1otyXVSH0H/2B/
 wPKzWiWm6bkDPHSeqBDOny+5j05jqX+fvIkC+cMB2i+blI/ff/eVCCxinAa3bRU/wxHDXDzMvdjG4z
 2inp9Q2bX8ZB91rnY1LJ4sotBQEjx6gbfyaV4+ZX0sOmvFWYVU5FMWiDt+FD6p8QuvHBNXGE0B81Xg
 Sjn4NGbqr6gqbmZaUXrLpaihnQV1i++znHO7wU+jhozbt481evX1P0UGoS/VIdgT7YJjjtcedyn5oy
 U59jwxit64BMUeaJJN5ihOEH4ddvFXr6Nq2ua2D4s/cpWIRAClEvG7j5Zb9tlEsoXAqMgFTE69wrxi
 wr1VObl9FrPeJJKnV+NdjcJioR8o0z
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
the es7134 driver to use more modern terminology for clocking.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/es7134.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/es7134.c b/sound/soc/codecs/es7134.c
index e2b79879354b..f443351677df 100644
--- a/sound/soc/codecs/es7134.c
+++ b/sound/soc/codecs/es7134.c
@@ -94,7 +94,7 @@ static int es7134_set_fmt(struct snd_soc_dai *codec_dai, unsigned int fmt)
 		SND_SOC_DAIFMT_MASTER_MASK);
 
 	if (fmt != (SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF |
-		    SND_SOC_DAIFMT_CBS_CFS)) {
+		    SND_SOC_DAIFMT_CBC_CFC)) {
 		dev_err(codec_dai->dev, "Invalid DAI format\n");
 		return -EINVAL;
 	}
-- 
2.30.2

