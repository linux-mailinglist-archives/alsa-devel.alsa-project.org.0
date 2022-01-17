Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 24109490972
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Jan 2022 14:23:23 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9BA2817E9;
	Mon, 17 Jan 2022 14:22:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9BA2817E9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1642425802;
	bh=CaYg+p9O0uAGbG4kMt1HbrD2S8z16L4o0uwZIImjC/g=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RuCEqLeLPZUXOP8JUb8KUc9lL6S1SlZRtGCfPZdYvQs23uGKmdAawsT0gHfbtasCj
	 FzoPyfr+q9x0/5/KIGiHhqCrWoJfiZp0EGirpVpTTF81S3Vle7MMUdY6I1nHLkOnt/
	 Ltv/i3XEyYALrVkfz4rhV6FcWqdcDkhguokiqjDk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 57E79F80518;
	Mon, 17 Jan 2022 14:21:52 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 21F36F80517; Mon, 17 Jan 2022 14:21:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,UNPARSEABLE_RELAY,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BEC40F80508
 for <alsa-devel@alsa-project.org>; Mon, 17 Jan 2022 14:21:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BEC40F80508
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com
 header.b="YnrIjYhs"
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: adalessandro) with ESMTPSA id 89B7A1F439D6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1642425698;
 bh=CaYg+p9O0uAGbG4kMt1HbrD2S8z16L4o0uwZIImjC/g=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=YnrIjYhsktlNV9VWQB6Vu9aXtuIPF8B3cBwyYVAMia4ACvZ9PskaiUCyN+16WejaR
 sxslWLJoi/paPh7eiTaExz70GTt7EuAcOW05dRGmGVmkFrPYgBVeR5y3PR+DNjDzgH
 CHDuv7UVJW3cPjOvps4oAKdwHuezLaaFj9opnKeioCjGsrLzE1pEwARlpza8BnCjU0
 5DCJeg8rtmhdfHg3Yf6mlH4oDrG0aeNRV6S9vuIuJAv9+j3RnmkeobDpz117oIPe2E
 4WM7i3m8Y5nPQ5OKjsjgLosu2F5b6/kwafELT8qENcH2h7uDDHsl5O3q7b1D8VKUnY
 sAOWcpFA9veHQ==
From: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
To: alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 2/5] dt-bindings: tlv320aic31xx: Define PLL clock inputs
Date: Mon, 17 Jan 2022 10:21:06 -0300
Message-Id: <20220117132109.283365-3-ariel.dalessandro@collabora.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220117132109.283365-1-ariel.dalessandro@collabora.com>
References: <20220117132109.283365-1-ariel.dalessandro@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: ariel.dalessandro@collabora.com, kuninori.morimoto.gx@renesas.com,
 Xiubo.Lee@gmail.com, tony@atomide.com, shengjiu.wang@gmail.com, tiwai@suse.com,
 lgirdwood@gmail.com, robh+dt@kernel.org, nicoleotsuka@gmail.com,
 broonie@kernel.org, bcousson@baylibre.com, michael@amarulasolutions.com,
 festevam@gmail.com
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

Add constants for the different PLL clock inputs in tlv320aic31xx.

Signed-off-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
---
 include/dt-bindings/sound/tlv320aic31xx.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/include/dt-bindings/sound/tlv320aic31xx.h b/include/dt-bindings/sound/tlv320aic31xx.h
index 3a845fbba992..4a80238ab250 100644
--- a/include/dt-bindings/sound/tlv320aic31xx.h
+++ b/include/dt-bindings/sound/tlv320aic31xx.h
@@ -6,4 +6,9 @@
 #define MICBIAS_2_5V		2
 #define MICBIAS_AVDDV		3
 
+#define PLL_CLKIN_MCLK		0x00
+#define PLL_CLKIN_BCLK		0x01
+#define PLL_CLKIN_GPIO1		0x02
+#define PLL_CLKIN_DIN		0x03
+
 #endif /* __DT_TLV320AIC31XX_H */
-- 
2.34.1

