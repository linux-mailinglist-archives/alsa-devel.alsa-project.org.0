Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 051034A60DE
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Feb 2022 16:59:46 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9C99A186B;
	Tue,  1 Feb 2022 16:58:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9C99A186B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1643731185;
	bh=QTGmCkc8xHsSc4UxccqN8v9eMK0ZjM1hmtWk5qpf5Bc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=eK6OFzsVc/0FE/sXgKHnbvckLn0qPXG8N8gn2aDrQdV7BpIexG0CsS2iuv9J2FXte
	 kC2wyqLGsziAcldj94EB6Nrq/ko/hwueuKHeMIHzEakst23Dtr0MsjamVsdDmB/z6W
	 v0fdHqAUVIMi2MO9cAHLmNp4fMo7wPXlazOsf3w8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DC10EF80520;
	Tue,  1 Feb 2022 16:57:27 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A7264F8051B; Tue,  1 Feb 2022 16:57:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2BA12F80511
 for <alsa-devel@alsa-project.org>; Tue,  1 Feb 2022 16:57:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2BA12F80511
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="qY/b0b96"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3325E616FD;
 Tue,  1 Feb 2022 15:57:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74BDBC340ED;
 Tue,  1 Feb 2022 15:57:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643731034;
 bh=QTGmCkc8xHsSc4UxccqN8v9eMK0ZjM1hmtWk5qpf5Bc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=qY/b0b96iQv7eSGC7spV5Be59adzduJK4OVNElpUiBBcHLAxoF48IHxJJkKwML1AM
 Fbh1cgEGb5WSEDpnboi9DNJAqurwLUOWkZ6V70WtV1yC7cxbKGt4gsObqc2+yW9S4C
 cqz/hlG9w+b8wAFINeHb1QwtbIeK1W2GTSaheHmKyu7VcTijUG8vGFMrc3jezlQBXL
 LnBVVWm4cKw7icB0d+Tbk7ikXL8HdhBveHp5XOAmCLEsBFaon+fWfFKhicdOhEBPMw
 7eBycBxYhxRpDBx1Q9tmjPNTve2Vjr2/qU42xEQ+ncBPPdOYKbJ5hQEXHpdeANjv17
 XeBvS85dQd1xw==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH v1 3/4] ASoC: ops: Fix stereo change notifications in
 snd_soc_put_volsw_range()
Date: Tue,  1 Feb 2022 15:56:28 +0000
Message-Id: <20220201155629.120510-4-broonie@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220201155629.120510-1-broonie@kernel.org>
References: <20220201155629.120510-1-broonie@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1710; h=from:subject;
 bh=QTGmCkc8xHsSc4UxccqN8v9eMK0ZjM1hmtWk5qpf5Bc=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBh+VgrYf8FNriLi0uMk58JVTX8BJUYs7WiQ7xNh/dI
 koeyceWJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCYflYKwAKCRAk1otyXVSH0LpZB/
 0ZRFFHtp2uv2bLQO3T/zGiXDAcmgEGJZRITphls0zTCdtLdwPhVE+6vDRc70aZdcim9wnvoZoDi0TE
 cImeaGr11aVqGVitwsd/Osfzvtie2q8yfJXpOciEHWZe6ZfYK6nxYvGOfS4gxo69OJ9OP2JyoDHjNo
 vr1nibIBP1h1HAo6B+roTYMYKMuN2CcZB6KuFZP9vVTR39aC6chHeCvaOUfmyxXnTFAWyWzAcpGVdX
 NzBspuFT4cd1NNau2lSsw11tINGl+oArZ4LBwdbkMucFWGmOgiOnNdPhaA4ae19tCTXUcbq+xnmBNH
 N0WgH7zjbbtkUhTRjm6q4l5PD6dXDy
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 stable@vger.kernel.org
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

When writing out a stereo control we discard the change notification from
the first channel, meaning that events are only generated based on changes
to the second channel. Ensure that we report a change if either channel
has changed.

Signed-off-by: Mark Brown <broonie@kernel.org>
Cc: stable@vger.kernel.org
---
 sound/soc/soc-ops.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/sound/soc/soc-ops.c b/sound/soc/soc-ops.c
index f0d1aeb38346..fefd4f34cbc1 100644
--- a/sound/soc/soc-ops.c
+++ b/sound/soc/soc-ops.c
@@ -498,7 +498,7 @@ int snd_soc_put_volsw_range(struct snd_kcontrol *kcontrol,
 	unsigned int mask = (1 << fls(max)) - 1;
 	unsigned int invert = mc->invert;
 	unsigned int val, val_mask;
-	int ret;
+	int err, ret;
 
 	if (invert)
 		val = (max - ucontrol->value.integer.value[0]) & mask;
@@ -507,9 +507,10 @@ int snd_soc_put_volsw_range(struct snd_kcontrol *kcontrol,
 	val_mask = mask << shift;
 	val = val << shift;
 
-	ret = snd_soc_component_update_bits(component, reg, val_mask, val);
-	if (ret < 0)
-		return ret;
+	err = snd_soc_component_update_bits(component, reg, val_mask, val);
+	if (err < 0)
+		return err;
+	ret = err;
 
 	if (snd_soc_volsw_is_stereo(mc)) {
 		if (invert)
@@ -519,8 +520,12 @@ int snd_soc_put_volsw_range(struct snd_kcontrol *kcontrol,
 		val_mask = mask << shift;
 		val = val << shift;
 
-		ret = snd_soc_component_update_bits(component, rreg, val_mask,
+		err = snd_soc_component_update_bits(component, rreg, val_mask,
 			val);
+		/* Don't discard any error code or drop change flag */
+		if (ret == 0 || err < 0) {
+			ret = err;
+		}
 	}
 
 	return ret;
-- 
2.30.2

