Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A387322B5F7
	for <lists+alsa-devel@lfdr.de>; Thu, 23 Jul 2020 20:43:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 454E41687;
	Thu, 23 Jul 2020 20:42:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 454E41687
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595529818;
	bh=WZ0OWkqLC1SFWAqs9PUKBmDf2lQUyalUvukkzmonUPM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gltUgfpU2TwJdkAsTj7sc9wfGpZPIJJCADaLjxHWFTzh8qckqs2FJxoK4YCnZx4Gx
	 BuYNRDYuQt3ZhdTkNYJSRdo6g5WgZZ4tofVwD7HFzgfrfY29ZzGllL6RrYKhxD7G4P
	 CL08cGAlCsNHAmlxfE2A/gtzndIpoX/rdUNxUa04=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5E5FAF802DD;
	Thu, 23 Jul 2020 20:39:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D651CF80290; Thu, 23 Jul 2020 20:39:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mo4-p02-ob.smtp.rzone.de (mo4-p02-ob.smtp.rzone.de
 [81.169.146.169])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4A325F800CE
 for <alsa-devel@alsa-project.org>; Thu, 23 Jul 2020 20:39:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4A325F800CE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gerhold.net header.i=@gerhold.net
 header.b="LY9lUGo6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1595529563;
 s=strato-dkim-0002; d=gerhold.net;
 h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=nFnjOwKh0kAzFCKAmgmf9MNoRlFHT8sj9s2uKRQ+gjc=;
 b=LY9lUGo6sKRQrnYUQ8QCHEBZ58YCPR0RbVdxeazdWHouhxs2/h5vaBGkZZs2AgV9DF
 /FIZsnGLAA1ys3uDkUtir+J6j4+HchLM1I6PL6B/4oaYcwSP7vx/JJjzmthZvx1eSklM
 XBLGlhRlPVzdOGcRPTB4MWzSH+6+LPyL5j1tYezVXwJcPQHi7OKr7jpsgZAbtCWyGAng
 uueUjvH0Zb3cEMSOeoHCDVgbpGRlLVgBW3n1FgC7/u4pZtVGX6/483p9oEEIgP3CGj3E
 Zsvi5Ix2XP6RNydInkjMzeJZytPeMqEQKQzsPnrxVsn+dnOlzoEqKGzYHuup99hypa1u
 C0bA==
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVORvLd4SsytBXS7IYBkLahKxB4W6OBfnv"
X-RZG-CLASS-ID: mo00
Received: from localhost.localdomain
 by smtp.strato.de (RZmta 46.10.5 DYNA|AUTH)
 with ESMTPSA id Y0939ew6NIdK5IJ
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Thu, 23 Jul 2020 20:39:20 +0200 (CEST)
From: Stephan Gerhold <stephan@gerhold.net>
To: Mark Brown <broonie@kernel.org>
Subject: [PATCH 3/7] ASoC: q6afe: Remove unused q6afe_is_rx_port() function
Date: Thu, 23 Jul 2020 20:39:00 +0200
Message-Id: <20200723183904.321040-4-stephan@gerhold.net>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200723183904.321040-1-stephan@gerhold.net>
References: <20200723183904.321040-1-stephan@gerhold.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Banajit Goswami <bgoswami@codeaurora.org>,
 Stephan Gerhold <stephan@gerhold.net>, Patrick Lai <plai@codeaurora.org>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 ~postmarketos/upstreaming@lists.sr.ht, Cheng-Yi Chiang <cychiang@chromium.org>
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

This reverts commit 4a95737440d ("ASoc: q6afe: add support to get
port direction"), since the function is not needed anymore.

q6afe-dai already exposes the possible directions for a DAI through
the DAI capabilities (playback/capture-only DAI). Now we use
snd_soc_dai_link_set_capabilities() to infer the information
directly from the DAI capabilities.

Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
---
 sound/soc/qcom/qdsp6/q6afe.c | 8 --------
 sound/soc/qcom/qdsp6/q6afe.h | 1 -
 2 files changed, 9 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/q6afe.c b/sound/soc/qcom/qdsp6/q6afe.c
index 0ce4eb60f984..e0945f7a58c8 100644
--- a/sound/soc/qcom/qdsp6/q6afe.c
+++ b/sound/soc/qcom/qdsp6/q6afe.c
@@ -800,14 +800,6 @@ int q6afe_get_port_id(int index)
 }
 EXPORT_SYMBOL_GPL(q6afe_get_port_id);
 
-int q6afe_is_rx_port(int index)
-{
-	if (index < 0 || index >= AFE_PORT_MAX)
-		return -EINVAL;
-
-	return port_maps[index].is_rx;
-}
-EXPORT_SYMBOL_GPL(q6afe_is_rx_port);
 static int afe_apr_send_pkt(struct q6afe *afe, struct apr_pkt *pkt,
 			    struct q6afe_port *port)
 {
diff --git a/sound/soc/qcom/qdsp6/q6afe.h b/sound/soc/qcom/qdsp6/q6afe.h
index 1a0f80a14afe..c7ed5422baff 100644
--- a/sound/soc/qcom/qdsp6/q6afe.h
+++ b/sound/soc/qcom/qdsp6/q6afe.h
@@ -198,7 +198,6 @@ int q6afe_port_start(struct q6afe_port *port);
 int q6afe_port_stop(struct q6afe_port *port);
 void q6afe_port_put(struct q6afe_port *port);
 int q6afe_get_port_id(int index);
-int q6afe_is_rx_port(int index);
 void q6afe_hdmi_port_prepare(struct q6afe_port *port,
 			    struct q6afe_hdmi_cfg *cfg);
 void q6afe_slim_port_prepare(struct q6afe_port *port,
-- 
2.27.0

