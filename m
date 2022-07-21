Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3218157C70C
	for <lists+alsa-devel@lfdr.de>; Thu, 21 Jul 2022 11:03:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 50650177E;
	Thu, 21 Jul 2022 11:02:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 50650177E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1658394214;
	bh=rc05WBckxp6Sjt5SPxOQQqKEhMtp4Vr1o4CJ1cdhePo=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=mLQQn/M2GCaGLOiJmJHI7rY0M5DHFgfn7QjEnkQ3a/dHzcGUivR7kFyWfFxSgz2lN
	 LaQoO4+W0cNr6Rli3U8D4Nfsv8b1KzkBhSBHu7NAdCLI/PYQCvMnv0aSg2O7bj+nrE
	 uQ3rvzBR9rVfbxYbdoUuzx1sHTcuHDjFxW/bokf4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A9679F80256;
	Thu, 21 Jul 2022 11:02:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 555E6F8016D; Thu, 21 Jul 2022 11:02:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from smtp.smtpout.orange.fr (smtp-24.smtpout.orange.fr
 [80.12.242.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 80982F800ED
 for <alsa-devel@alsa-project.org>; Thu, 21 Jul 2022 11:02:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 80982F800ED
Received: from pop-os.home ([90.11.190.129]) by smtp.orange.fr with ESMTPA
 id ES4doiupgxFTAES4eoDEeb; Thu, 21 Jul 2022 11:02:26 +0200
X-ME-Helo: pop-os.home
X-ME-Auth: YWZlNiIxYWMyZDliZWIzOTcwYTEyYzlhMmU3ZiQ1M2U2MzfzZDfyZTMxZTBkMTYyNDBjNDJlZmQ3ZQ==
X-ME-Date: Thu, 21 Jul 2022 11:02:26 +0200
X-ME-IP: 90.11.190.129
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: [PATCH] ASoC: qcom: q6dsp: Fix an off-by-one in q6adm_alloc_copp()
Date: Thu, 21 Jul 2022 11:02:22 +0200
Message-Id: <0fca3271649736053eb9649d87e1ca01b056be40.1658394124.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 alsa-devel@alsa-project.org, Banajit Goswami <bgoswami@codeaurora.org>,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
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

find_first_zero_bit() returns MAX_COPPS_PER_PORT at max here.
So 'idx' should be tested with ">=" or the test can't match.

Fixes: 7b20b2be51e1 ("ASoC: qdsp6: q6adm: Add q6adm driver")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 sound/soc/qcom/qdsp6/q6adm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/qcom/qdsp6/q6adm.c b/sound/soc/qcom/qdsp6/q6adm.c
index 01f383888b62..1530e98df165 100644
--- a/sound/soc/qcom/qdsp6/q6adm.c
+++ b/sound/soc/qcom/qdsp6/q6adm.c
@@ -217,7 +217,7 @@ static struct q6copp *q6adm_alloc_copp(struct q6adm *adm, int port_idx)
 	idx = find_first_zero_bit(&adm->copp_bitmap[port_idx],
 				  MAX_COPPS_PER_PORT);
 
-	if (idx > MAX_COPPS_PER_PORT)
+	if (idx >= MAX_COPPS_PER_PORT)
 		return ERR_PTR(-EBUSY);
 
 	c = kzalloc(sizeof(*c), GFP_ATOMIC);
-- 
2.34.1

