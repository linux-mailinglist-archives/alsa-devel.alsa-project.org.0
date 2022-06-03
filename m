Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DECAC53CA1C
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Jun 2022 14:41:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6323A184C;
	Fri,  3 Jun 2022 14:40:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6323A184C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654260062;
	bh=48hNjQmcCigxvSelGwLICQAtjNgkyK8k81I8KriiQBg=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=QySiHyYQ4UTPWXa8x+c4ILiapXmMxKr2vYrilV/QnLJmA4Zk7H44RktBh+n0WKOOe
	 tUHAxDwSf4nfMJRYyWbstqK6DMzv/BoarESKwgWqwgwjo0WzJ1H1zF4iH9y4rxQbML
	 nrGUX8NQczZuT9g7mKiC5XTmD6KYfdpiZ5ZlpORY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CC41CF804D1;
	Fri,  3 Jun 2022 14:40:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0CE3AF804CC; Fri,  3 Jun 2022 14:40:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F1AF7F80124
 for <alsa-devel@alsa-project.org>; Fri,  3 Jun 2022 14:39:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F1AF7F80124
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="iS4CH9Ab"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 85A58CE2372;
 Fri,  3 Jun 2022 12:39:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D84CCC385A9;
 Fri,  3 Jun 2022 12:39:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1654259984;
 bh=48hNjQmcCigxvSelGwLICQAtjNgkyK8k81I8KriiQBg=;
 h=From:To:Cc:Subject:Date:From;
 b=iS4CH9AbfpXH6ypAusblbFFTmzSkyD7HjaC86Ii23tgVgRGQ6nFoocuyYOmFvxvXm
 nXKOb6RqRAaZ8o+sE4uzTJemozdjqpJJh04SYDEaneDpl+BqqJLVy8iN4bVZDabCEo
 g3RgBf9GdblyUy84aRaPk8XqSQ4nWw023cXd9twfDEHwEG9KUM7JXUmzTe2v9h9qZb
 3DZQ6g4F/dDjQvYUTMWeOcHlaXZCy+YiJbFkCxNjUcJ3ZK559CKfiwG+M1Bl5Uh8EI
 aXJBoZzBqdaX7rw3CEj4F13zvT8+D6RIgJ9A0eS5ZNTC/DoPEZWoE5+QTQRmGvVEMG
 EnS0KBzPyaLOg==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH] ASoC: es8328: Fix event generation for deemphasis control
Date: Fri,  3 Jun 2022 14:39:37 +0200
Message-Id: <20220603123937.4013603-1-broonie@kernel.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=927; h=from:subject;
 bh=48hNjQmcCigxvSelGwLICQAtjNgkyK8k81I8KriiQBg=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBimgAXQ3lov38LNHPakmBDBbajZURC8pD7ygrMZv8v
 Q+ch0w2JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCYpoAFwAKCRAk1otyXVSH0CdAB/
 458CdL9+W9cBCw87kHA/OXmHasO29ZwOIBJ5qyfI7mlp8hT6GIQKtt3IB+EzK4H4vBkQoVPKHE78Ez
 7x8rPt+AWvfYzUzSEv99zEu0k6II3/F9fmD01BRCjuYHgtUdXbndgombWXU9gwA7BIBC62bfJIooYy
 J+VBAk85Ts8uCucL8VqlW0tV2ECeqjJVd6obASfN7OF79lX6pby2Xes+0dXI6TdW/IJ6Ux+7r59CYl
 aM/cuk8szhKb/d4EW3mGGW72PIbrAzGfIC8W/IJqs5QHannjQxmoMEsV9CavbFVq6MN8wB92Dn4ore
 RckHgKbuHrdSU6PJq3NOgvT57mAZoL
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

Currently the put() method for the deemphasis control returns 0 when a new
value is written to the control even if the value changed, meaning events
are not generated. Fix this, skip the work of updating the value when it is
unchanged and then return 1 after having done so.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/es8328.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/es8328.c b/sound/soc/codecs/es8328.c
index 3f00ead97006..dd53dfd87b04 100644
--- a/sound/soc/codecs/es8328.c
+++ b/sound/soc/codecs/es8328.c
@@ -161,13 +161,16 @@ static int es8328_put_deemph(struct snd_kcontrol *kcontrol,
 	if (deemph > 1)
 		return -EINVAL;
 
+	if (es8328->deemph == deemph)
+		return 0;
+
 	ret = es8328_set_deemph(component);
 	if (ret < 0)
 		return ret;
 
 	es8328->deemph = deemph;
 
-	return 0;
+	return 1;
 }
 
 
-- 
2.30.2

