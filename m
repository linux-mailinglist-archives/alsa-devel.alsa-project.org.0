Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A544658E42
	for <lists+alsa-devel@lfdr.de>; Thu, 29 Dec 2022 16:19:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 78B828242;
	Thu, 29 Dec 2022 16:18:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 78B828242
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1672327147;
	bh=4a5U7BEL+rGYJRlVkx14BPuEsGpf8PZ5w5juP6cL40U=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=RW8tb7Oec9YOsDafwaeUg0H/LkT6oTGYl8ZUF9/c3Wr/Z6JFksReGkG3Slq2KrnGs
	 9tXe8BEebdaG7bS+o/w0ccHMnPkwqDRNmor+38++lf9sAFzIcxWSFUaJzRbJtw+GbM
	 bLt1PZcDe0fh4Jkc9twXqkURHHtM8AjMQkeLwoQk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 87148F804F1;
	Thu, 29 Dec 2022 16:18:07 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C9657F8023B; Thu, 29 Dec 2022 16:18:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_NONE,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from mo4-p02-ob.smtp.rzone.de (mo4-p02-ob.smtp.rzone.de
 [81.169.146.169])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 91961F8023B
 for <alsa-devel@alsa-project.org>; Thu, 29 Dec 2022 16:17:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 91961F8023B
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=gerhold.net header.i=@gerhold.net header.a=rsa-sha256
 header.s=strato-dkim-0002 header.b=TK3tY/pO
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1672327076;
 s=strato-dkim-0002; d=gerhold.net;
 h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
 From:Subject:Sender;
 bh=ufovkPO+jNddBOfj2hrolKoU/q+utp3DmWQhPWZpjlQ=;
 b=TK3tY/pO+q0ZpT65UHNC57hTiYfKr8aSV72LkddUx+WAMKp00yFCrdI5UdTaLi/tAc
 wdkwhxzV+w6vbmrSfFe7FnOjSwjpx6gBQtmBqI6Io6dLA78GYWySeKpGH9WVbTl+o8ou
 gNS36WuTk2u9vqB+1NFUxEXtWxgTAEdth08vdOQugMszLaeVzthUIIaVea2XqyAM+gw3
 eeNMUnxbioNbSw+N8fVsdASOjAquH7oQdMIYwjVbwZSV9mxjTw6/uh6Z/19asfozwJYY
 xj5UgMzP8stU0WrIy6LpQI5IM3weXuXEfazBmbUxP/oK6QHYZZGFi5Zrhhs5yKre3VAO
 IPkw==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVORvLd4SsytBXTbAOHjRHIRvweF+KLA=="
X-RZG-CLASS-ID: mo01
Received: from droid.. by smtp.strato.de (RZmta 48.2.1 DYNA|AUTH)
 with ESMTPSA id Yce349yBTFHuXT3
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Thu, 29 Dec 2022 16:17:56 +0100 (CET)
From: Stephan Gerhold <stephan@gerhold.net>
To: Bjorn Andersson <andersson@kernel.org>,
	Andy Gross <agross@kernel.org>
Subject: [PATCH 1/2] dt-bindings: soc: qcom: apr: Make qcom,
 protection-domain optional again
Date: Thu, 29 Dec 2022 16:16:47 +0100
Message-Id: <20221229151648.19839-2-stephan@gerhold.net>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221229151648.19839-1-stephan@gerhold.net>
References: <20221229151648.19839-1-stephan@gerhold.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Banajit Goswami <bgoswami@quicinc.com>, Stephan Gerhold <stephan@gerhold.net>,
 linux-arm-msm@vger.kernel.org, Jiasheng Jiang <jiasheng@iscas.ac.cn>,
 Rob Herring <robh+dt@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Mark Brown <broonie@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 ~postmarketos/upstreaming@lists.sr.ht,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

The protection domain functionality exists only in SoCs starting from
MSM8998 [1], while the APR bindings are also used on older platforms.

Commit 41288c305836 ("ASoC: dt-bindings: qcom,apr: Split services to
shared schema") made the "qcom,protection-domain" required but it
should remain optional to avoid dtbs_check warnings on older platforms,
e.g.:

arch/arm64/boot/dts/qcom/apq8096-db820c.dtb:
  apr: service@3: 'qcom,protection-domain' is a required property
  From schema: Documentation/devicetree/bindings/soc/qcom/qcom,apr.yaml

[1]: https://lore.kernel.org/all/20200312120842.21991-1-sibis@codeaurora.org/

Fixes: 41288c305836 ("ASoC: dt-bindings: qcom,apr: Split services to shared schema")
Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
---
 .../devicetree/bindings/soc/qcom/qcom,apr-services.yaml      | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,apr-services.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,apr-services.yaml
index 290555426c39..bdf482db32aa 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,apr-services.yaml
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,apr-services.yaml
@@ -39,8 +39,8 @@ properties:
   qcom,protection-domain:
     $ref: /schemas/types.yaml#/definitions/string-array
     description: |
-      Protection domain service name and path for APR service
-      possible values are::
+      Protection domain service name and path for APR service (if supported).
+      Possible values are::
       "avs/audio", "msm/adsp/audio_pd".
       "kernel/elf_loader", "msm/modem/wlan_pd".
       "tms/servreg", "msm/adsp/audio_pd".
@@ -49,6 +49,5 @@ properties:
 
 required:
   - reg
-  - qcom,protection-domain
 
 additionalProperties: true
-- 
2.39.0

