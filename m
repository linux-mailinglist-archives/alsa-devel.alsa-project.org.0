Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 622944665FE
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Dec 2021 15:58:55 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 81DBD2714;
	Thu,  2 Dec 2021 15:58:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 81DBD2714
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638457134;
	bh=YdaM2dg1nb41xN9NyEzlWusESkVNA45qFVOsHaPRD3M=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=m7cPJFLrfjuY5pY95U0A/4S2Pt7TOhVgG/Wf6BpqYh+jmxVQHtCg11HVeL0m4eAhr
	 X3s6r+lBvrxwILN5xZZMaVOTqCvlJVXGXM48hI6xuXWx38sWosekPTnec+v6RKzDo9
	 WKtOxX+ROTNOM2W8uE6UsxyZx44RBB2GB026gT0s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9CCA5F802A0;
	Thu,  2 Dec 2021 15:57:17 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A2AF1F804EB; Thu,  2 Dec 2021 15:57:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de
 [85.215.255.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 575C1F800BE
 for <alsa-devel@alsa-project.org>; Thu,  2 Dec 2021 15:57:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 575C1F800BE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gerhold.net header.i=@gerhold.net
 header.b="iAPRxMjL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1638457026;
 s=strato-dkim-0002; d=gerhold.net;
 h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
 From:Subject:Sender;
 bh=NNx+hi3aDIPo3ao1SaJ4PvzUDk3d4JiYY4XCPyjzaS0=;
 b=iAPRxMjLGg7XgdPEZt3EtZF1S1Zowi2vlrcKCMm8GaWitjhPamNTQ4jPGN1cSH9kG3
 Wv84Rg01c8+QZQRx7KffCRISbNAIOZ8w8fUQbAxBQXkqT9TijsRImyhR/SFKXGKX3aVW
 N6vekMMzWqLWG1CKvvPDbHMQc1qt8oiAXBfzYwRQ1EZr+NVD/OX6/Fh9pZUWBhSjT3OZ
 kqXtsgl0fL6zzHwR8CT7WK8ZUkZ4XbIgCK8OXreXZYpBtE8mJU2eCoxfXR2XIc/Vym4l
 MWtj0+TdXCdumIaxtrlanagIMSkk5a2nZ9F55IhFTb/ILZf/BxUylF4bWPVzkd4kBN+Z
 Vkzg==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVORvLd4SsytBXQ7UOGqRde+a0fyLyu9s="
X-RZG-CLASS-ID: mo00
Received: from droid.. by smtp.strato.de (RZmta 47.34.10 AUTH)
 with ESMTPSA id j03bcbxB2Ev5pxv
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Thu, 2 Dec 2021 15:57:05 +0100 (CET)
From: Stephan Gerhold <stephan@gerhold.net>
To: Mark Brown <broonie@kernel.org>
Subject: [PATCH 1/5] ASoC: dt-bindings: qcom: sm8250: Drop redundant
 MultiMedia routes
Date: Thu,  2 Dec 2021 15:55:01 +0100
Message-Id: <20211202145505.58852-2-stephan@gerhold.net>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211202145505.58852-1-stephan@gerhold.net>
References: <20211202145505.58852-1-stephan@gerhold.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Banajit Goswami <bgoswami@codeaurora.org>,
 Stephan Gerhold <stephan@gerhold.net>, linux-arm-msm@vger.kernel.org,
 Liam Girdwood <lgirdwood@gmail.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 ~postmarketos/upstreaming@lists.sr.ht
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

The MultiMedia audio routes can be deduced from other parts of the
device tree (e.g. the definitions of the MultiMedia DAIs) and therefore
specifying them again in "audio-routing" is redundant and prone to
mistakes. This is no longer necessary since commit 6fd8d2d275f7
("ASoC: qcom: qdsp6: Move frontend AIFs to q6asm-dai").

Let's drop them from the example in the DT schema as well
to avoid confusion.

Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
---
 Documentation/devicetree/bindings/sound/qcom,sm8250.yaml | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
index 7d57eb91657a..a0f1d7340eb5 100644
--- a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
@@ -86,10 +86,7 @@ examples:
         audio-routing = "SpkrLeft IN", "WSA_SPK1 OUT",
                     "SpkrRight IN", "WSA_SPK2 OUT",
                     "VA DMIC0", "vdd-micb",
-                    "VA DMIC1", "vdd-micb",
-                    "MM_DL1",  "MultiMedia1 Playback",
-                    "MM_DL2",  "MultiMedia2 Playback",
-                    "MultiMedia3 Capture", "MM_UL3";
+                    "VA DMIC1", "vdd-micb";
 
         mm1-dai-link {
             link-name = "MultiMedia0";
-- 
2.34.1

