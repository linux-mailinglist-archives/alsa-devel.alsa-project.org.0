Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E7FF03023D0
	for <lists+alsa-devel@lfdr.de>; Mon, 25 Jan 2021 11:47:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 732331818;
	Mon, 25 Jan 2021 11:46:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 732331818
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611571663;
	bh=epBnv2gRUkGD8M40zv3OXgNx4/7zOxpFvGXY2kmSVmI=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=KH1BQMt7uTlw9nR22lTJ5CmaOGeps7eLiPSGlTi/jlNzlCBybOj6wA7CUVu4sv+US
	 t+hnMou1tPngME4nD7J6/vpJDNKMrTad0SDqyV6EdJIVT7Mr1F4lIHgek/XxsGO3FH
	 wZUgI/IZHdXeK/ovRt4/9wNBnDNAjlu7lotKMBhk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8050AF8012D;
	Mon, 25 Jan 2021 11:46:11 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 13A54F80259; Mon, 25 Jan 2021 11:46:08 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de
 [85.215.255.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DFD94F8014D
 for <alsa-devel@alsa-project.org>; Mon, 25 Jan 2021 11:46:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DFD94F8014D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gerhold.net header.i=@gerhold.net
 header.b="lWNgHWGr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1611571561;
 s=strato-dkim-0002; d=gerhold.net;
 h=Message-Id:Date:Subject:Cc:To:From:From:Subject:Sender;
 bh=D96qga/uquDIK3dOEtOs6A/AAGWQ9giEeEsN0PC3AoU=;
 b=lWNgHWGrgL/ui/VACSqAgoyraBL9tjAD89jNC2OlEHiBqF6UnTRl7c3EED6Sl6Yk7R
 bvrH5ohXwTpnU/g4QOlS2NPjImWd2+f3OkiczZUj/wO5tJwAUsyhWTNFBnhG/xCP98zr
 AQye3u77u0+dNnnirugF3tH0zHAJG3vULdXcXsnoBPL2ATJavNAs0+up00s34CsrTcFs
 44FULZd/hD7XrSYQkBNTNzj62Nr0lWdAt/WJ0887DHBRMWigAowh5jY4PUEnQs5lzUSV
 cGkQaI7YHU4/zEUY1Fz4CCNsLlzCUYt1qfg5ApNCMB2HHXl0f7QMG0/8bIbvjsFIM5Td
 DcZg==
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVORvLd4SsytBXS7IYBkLahKxB526O1Om9"
X-RZG-CLASS-ID: mo00
Received: from droid.. by smtp.strato.de (RZmta 47.12.1 DYNA|AUTH)
 with ESMTPSA id R0a218x0PAjxlDZ
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Mon, 25 Jan 2021 11:45:59 +0100 (CET)
From: Stephan Gerhold <stephan@gerhold.net>
To: Mark Brown <broonie@kernel.org>
Subject: [PATCH v2] ASoC: qcom: lpass: Fix out-of-bounds DAI ID lookup
Date: Mon, 25 Jan 2021 11:44:42 +0100
Message-Id: <20210125104442.135899-1-stephan@gerhold.net>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Banajit Goswami <bgoswami@codeaurora.org>,
 Srinivasa Rao Mandadapu <srivasam@codeaurora.org>,
 Stephan Gerhold <stephan@gerhold.net>, Liam Girdwood <lgirdwood@gmail.com>,
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

For IPQ806x (and SC7180 since commit 09a4f6f5d21c
("ASoC: dt-bindings: lpass: Fix and common up lpass dai ids") this is
now often an out-of-bounds read because the indexes in the "dai_driver"
array no longer match the actual DAI ID.

Cc: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Fixes: 7cb37b7bd0d3 ("ASoC: qcom: Add support for lpass hdmi driver")
Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
---
Changes in v2:
  - Extracted from https://lore.kernel.org/alsa-devel/20210114094615.58191-2-stephan@gerhold.net/
  - Change commit message to clarify that this is usually not just
    redundant now but actually a broken out-of-bounds lookup.
---
 sound/soc/qcom/lpass-lpaif-reg.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/qcom/lpass-lpaif-reg.h b/sound/soc/qcom/lpass-lpaif-reg.h
index 405542832e99..baf72f124ea9 100644
--- a/sound/soc/qcom/lpass-lpaif-reg.h
+++ b/sound/soc/qcom/lpass-lpaif-reg.h
@@ -133,7 +133,7 @@
 #define	LPAIF_WRDMAPERCNT_REG(v, chan)	LPAIF_WRDMA_REG_ADDR(v, 0x14, (chan))
 
 #define LPAIF_INTFDMA_REG(v, chan, reg, dai_id)  \
-		((v->dai_driver[dai_id].id ==  LPASS_DP_RX) ? \
+	((dai_id ==  LPASS_DP_RX) ? \
 		LPAIF_HDMI_RDMA##reg##_REG(v, chan) : \
 		 LPAIF_RDMA##reg##_REG(v, chan))
 
-- 
2.30.0

