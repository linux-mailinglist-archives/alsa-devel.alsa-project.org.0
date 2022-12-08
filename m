Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 12E8C646808
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Dec 2022 04:55:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 91E771883;
	Thu,  8 Dec 2022 04:54:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 91E771883
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1670471710;
	bh=JbhdEAOqlUmgORBr+B9yjdSrtKv90+VViwy5UzjSfMU=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=b4c+9hb/lmt6ecaTYQTFOFSFLF722oHmqP78/YUF9QVQd5cp/DxTKTXGE/19cnU+9
	 D1sMHINWCbpigNIrz92SyIfOMxQUJgACslcFSjWOPBn7Y4AXc4L/yBsQR0MziKDCUK
	 E0PG2hKSdfjH8JOtbi05ECOMvDgYGHWl88WeElHE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 20505F8024C;
	Thu,  8 Dec 2022 04:54:13 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E1A0FF8020D; Thu,  8 Dec 2022 04:54:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 90DE0F80089
 for <alsa-devel@alsa-project.org>; Thu,  8 Dec 2022 04:54:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 90DE0F80089
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de
 header.b="kSgF8XPt"
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 510DE8363D;
 Thu,  8 Dec 2022 04:53:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1670471644;
 bh=lpuBG2yZoTMgVBMI8KC17xviFeFI7olLWyma3F566Nk=;
 h=From:To:Cc:Subject:Date:From;
 b=kSgF8XPthdAlT1eaRx9wA+O7YUuGs2wHiq5emIGMT2co1e/ahOV42iymwDFEIdhPz
 ygszGalAHsTJXhQgpj23degzv6BiGhcX1QsEzvKXe/E/r7tfDpAcjrxYaRxio1JlU2
 QKBJt6IHZQq0X72sXiA0g7sAwGvZP5C8+A6dx5kMKHx+ZyCtaV3AK9D1D9jOjexkcc
 294T2xwcnI9YJ6eqIuZ8fmkXLdNsDl9ZTaCbX3O1+1iaNrWndrKyfXU/99etSFqxFr
 aMXFUbqON2LVp5i6MPDVRk3Ghl0dQeVXSIPy0YhtlpyhKEhNdyRdfnoy0jdebJkrcy
 2JOfUVjiFqhIA==
From: Marek Vasut <marex@denx.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ASoC: dt-bindings: fsl-sai: Reinstate i.MX93 SAI compatible
 string
Date: Thu,  8 Dec 2022 04:53:54 +0100
Message-Id: <20221208035354.255438-1-marex@denx.de>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
Cc: Marek Vasut <marex@denx.de>, devicetree@vger.kernel.org,
 Shengjiu Wang <shengjiu.wang@nxp.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
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

The ASoC: dt-bindings: fsl-sai: Fix mx6ul and mx7d compatible strings
dropped i.MX93 SAI compatible string, reinstate it.

Fixes: 81b6c043e7ba ("ASoC: dt-bindings: fsl-sai: Fix mx6ul and mx7d compatible strings")
Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>
Cc: Mark Brown <broonie@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: devicetree@vger.kernel.org
To: alsa-devel@alsa-project.org
---
 Documentation/devicetree/bindings/sound/fsl,sai.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/sound/fsl,sai.yaml b/Documentation/devicetree/bindings/sound/fsl,sai.yaml
index 022da1f4583d6..c59e4edd7570c 100644
--- a/Documentation/devicetree/bindings/sound/fsl,sai.yaml
+++ b/Documentation/devicetree/bindings/sound/fsl,sai.yaml
@@ -38,6 +38,7 @@ properties:
               - fsl,imx8mq-sai
               - fsl,imx8qm-sai
               - fsl,imx8ulp-sai
+              - fsl,imx93-sai
               - fsl,vf610-sai
 
   reg:
-- 
2.35.1

