Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 80FA32F5E0B
	for <lists+alsa-devel@lfdr.de>; Thu, 14 Jan 2021 10:49:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 02055168A;
	Thu, 14 Jan 2021 10:48:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 02055168A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1610617762;
	bh=6JgAQCm+iP41BtMq7IUCLzdzy0pVsSddOziygKqKf8M=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Ng+4cGII9LK8DxL+YTYPWkhT1JgUUQFn+j55/HDM1IALBkdmQTyH/J669gA75HUlC
	 llMdAD1MlfsroKVNJNIJ1LuHolE8csfEbEj6x1hXuOLgaINtJZR1ANxeUwn/g2W8xw
	 7i8W4QEEeknqYl3N/LQhSjkf5qSdt0VRYTrWGXRk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AC353F804AB;
	Thu, 14 Jan 2021 10:47:39 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AF480F8026F; Thu, 14 Jan 2021 10:47:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de
 [81.169.146.166])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B307FF80134
 for <alsa-devel@alsa-project.org>; Thu, 14 Jan 2021 10:47:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B307FF80134
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gerhold.net header.i=@gerhold.net
 header.b="IZeZ8930"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1610617649;
 s=strato-dkim-0002; d=gerhold.net;
 h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:From:
 Subject:Sender;
 bh=o50rf0uBsQoxIQL8IkxgdEdTOKgxZNoTphjNkUZL0kU=;
 b=IZeZ8930eNpS43K3hnTpjjVZ40+fYzTwyRwxSQO9U+dgle3b/Jb/QEy8/JwcwGHZYG
 LYUyt2rEsutdp9zVHrHl863jYQZrb+s8lt5SxQzL8OeTP3TC5sC+C0pC0UwSCj9y8glD
 BhUH80o0b1TsG2/Wqa9k8ji9IGUvRgITfTi/kzQR2DhSiSZXZPHjjVTIhu8JG5EYTAwD
 E+ENz+hrKrV2pyFojnWg9Nc7pkFIqauMPd8o9/7SdXI5M7ZgfL2Ir6CrY1ctetnM15So
 mJpAXbd5aM/wciIBFC7pXGN8Wo/hOXlUoFhxX0GvhLCRDbeyz4WpZ2COqebPj35zjeJ6
 Equg==
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVORvLd4SsytBXS7IYBkLahKxB426OzeQn"
X-RZG-CLASS-ID: mo00
Received: from droid.. by smtp.strato.de (RZmta 47.12.1 DYNA|AUTH)
 with ESMTPSA id R0a218x0E9lRhrf
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Thu, 14 Jan 2021 10:47:27 +0100 (CET)
From: Stephan Gerhold <stephan@gerhold.net>
To: Mark Brown <broonie@kernel.org>
Subject: [PATCH 2/2] ASoC: qcom: lpass: Avoid redundant DAI ID lookup
Date: Thu, 14 Jan 2021 10:46:15 +0100
Message-Id: <20210114094615.58191-2-stephan@gerhold.net>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210114094615.58191-1-stephan@gerhold.net>
References: <20210114094615.58191-1-stephan@gerhold.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Banajit Goswami <bgoswami@codeaurora.org>,
 Srinivasa Rao Mandadapu <srivasam@codeaurora.org>,
 Stephan Gerhold <stephan@gerhold.net>, Patrick Lai <plai@codeaurora.org>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
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

The "dai_id" given into LPAIF_INTFDMA_REG(...) is already the real
DAI ID, not an index into v->dai_driver. Looking it up again seems
entirely redundant.

Cc: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
---
 sound/soc/qcom/lpass-lpaif-reg.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/qcom/lpass-lpaif-reg.h b/sound/soc/qcom/lpass-lpaif-reg.h
index 332f1b9ba674..583ca53836a5 100644
--- a/sound/soc/qcom/lpass-lpaif-reg.h
+++ b/sound/soc/qcom/lpass-lpaif-reg.h
@@ -133,7 +133,7 @@
 #define	LPAIF_WRDMAPERCNT_REG(v, chan)	LPAIF_WRDMA_REG_ADDR(v, 0x14, (chan))
 
 #define LPAIF_INTFDMA_REG(v, chan, reg, dai_id)  \
-		((v->dai_driver[dai_id].id ==  v->hdmi_dai) ? \
+	((dai_id ==  v->hdmi_dai) ? \
 		LPAIF_HDMI_RDMA##reg##_REG(v, chan) : \
 		 LPAIF_RDMA##reg##_REG(v, chan))
 
-- 
2.30.0

