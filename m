Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ECCD65139B6
	for <lists+alsa-devel@lfdr.de>; Thu, 28 Apr 2022 18:25:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7FC9E161D;
	Thu, 28 Apr 2022 18:25:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7FC9E161D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1651163155;
	bh=GxlUVHR5sSdB3Z4eZDbIsPIIMLKJwO2hi8xt8gL7xrI=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=VUavxf7xOrwpYWJqt6vLgfDv6FgrT4jz3yPa5eMS+xXCUb0Zvw2dNe/SA9zoKUDcd
	 +6j/QY5CtivMx/+cfEC6SDMReQ1SO6Nw4+8oqh6S5svdhv3dNTw3Hv5qH/IgXZmvnG
	 cDbCLSDRrufBIYipmoUfUmYv4pvOw+kZEf2TUWlc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E0D46F8020D;
	Thu, 28 Apr 2022 18:24:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6EF99F800AE; Thu, 28 Apr 2022 18:24:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 25A85F800AE
 for <alsa-devel@alsa-project.org>; Thu, 28 Apr 2022 18:24:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 25A85F800AE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="lb63Wqj8"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 9AD67B82E55;
 Thu, 28 Apr 2022 16:24:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5831BC385A0;
 Thu, 28 Apr 2022 16:24:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651163089;
 bh=GxlUVHR5sSdB3Z4eZDbIsPIIMLKJwO2hi8xt8gL7xrI=;
 h=From:To:Cc:Subject:Date:From;
 b=lb63Wqj8Vja/hXZY2a00hpxL318H9YGDsM4XRrgriyZdHCBRttdTJ3Ps9GRgKlXQY
 Z9+uPe9Bhy4hUX1y5DZnMbmnODhAyCeDs0hiXrz66VaKvDEceNjdNqS//JWDMjbq+X
 UI9HDhulqVjCFUVa9Ez+IssN4XMqfkmVg28jSDwNhf3BGmTC3+s17cc/lffeMthkxk
 EhKeuwORM+iAOL5CufjYlOGP/iDcp9sYKfXRXlc2Em8eRtgXfFxR6I7tstkmIDOexV
 9qga2hnK3EiF6RZf/e+BTG93Nu2HNhpJFXlwDCPK8E1jAFsp3z8iE14m+2n/DrCM23
 K+H0pSKnizLvw==
From: Mark Brown <broonie@kernel.org>
To: Oder Chiou <oder_chiou@realtek.com>,
	Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH] ASoC: rt5514: Fix event generation for "DSP Voice Wake Up"
 control
Date: Thu, 28 Apr 2022 17:24:44 +0100
Message-Id: <20220428162444.3883147-1-broonie@kernel.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=814; h=from:subject;
 bh=GxlUVHR5sSdB3Z4eZDbIsPIIMLKJwO2hi8xt8gL7xrI=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBiar+zo0M4qjBimQ2XhuOPZOmuhO58NzgCi8w651Rp
 Itiy5cOJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCYmq/swAKCRAk1otyXVSH0NkJB/
 9ayBF+QxYn/JXbsAQ6N2gmHLjj1EoaPRVjG168R8w4VZvjUTOMsv33nmXeJ9B4m2v6SUdbPt/Xwni7
 +P2/yKBdrHDTp3VDTo/ug5Rw/iQ3BIJxXskSf652kMoT1ipLLru9TXq/L96/fm4mpoTtw4hlbA5xZW
 QhPT7S2DIbGanJe9DLr5j4u1P2fvvyuxeIpFtfGrzirpFXk26ZBpeAXC57Ki4ykw4bpvOCYkMyJ20O
 /dLLMxZPhDDRQ2DB1ipTteATLUVy61j4ltHUiD2C2uk+1Z4bd7wKkiKKCTiRRHqsxyAZlMsmdvnKnH
 bxuFIxuvd0OngaTVJWs2AutHrjUA1t
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

The driver has a custom put function for "DSP Voice Wake Up" which does
not generate event notifications on change, instead returning 0. Since we
already exit early in the case that there is no change this can be fixed
by unconditionally returning 1 at the end of the function.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/rt5514.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/rt5514.c b/sound/soc/codecs/rt5514.c
index 1b9263460142..be8ece4630df 100644
--- a/sound/soc/codecs/rt5514.c
+++ b/sound/soc/codecs/rt5514.c
@@ -419,7 +419,7 @@ static int rt5514_dsp_voice_wake_up_put(struct snd_kcontrol *kcontrol,
 		}
 	}
 
-	return 0;
+	return 1;
 }
 
 static const struct snd_kcontrol_new rt5514_snd_controls[] = {
-- 
2.30.2

