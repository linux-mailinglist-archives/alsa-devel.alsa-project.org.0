Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 13ED55BAE20
	for <lists+alsa-devel@lfdr.de>; Fri, 16 Sep 2022 15:27:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9D7D61AC6;
	Fri, 16 Sep 2022 15:26:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9D7D61AC6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663334820;
	bh=RzPU9nLmOm+eZT8fCLgF6GumyqiP1cjnNINoRzx8cYA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=s5/NDkOYSiZMjDEhYcs+1R+pc3pxT2YdmJVDS7wmwQrzXkoKYaHvV1lBimk9pRS5c
	 lW8tOBXbkfqD7bPSFKqmFLHyiPf2C+8aGQAhTHHWnpu6Gft220Ju85obqIFafE/wMi
	 XE1ziTyC+U/jzTa7qBsZXLN4isbZQ54nwY5P1hfU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9181FF80558;
	Fri, 16 Sep 2022 15:24:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E471DF80535; Fri, 16 Sep 2022 15:24:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C4BE6F80535
 for <alsa-devel@alsa-project.org>; Fri, 16 Sep 2022 15:24:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C4BE6F80535
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="ZH0sIZgn"
Received: by mail-wm1-x334.google.com with SMTP id l8so10723535wmi.2
 for <alsa-devel@alsa-project.org>; Fri, 16 Sep 2022 06:24:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=bXYtZk9DuHwMmE7lTTFLwrOctNB6LlU7vnhCjjk89UE=;
 b=ZH0sIZgnFki3bD+19ezSXw9QfGCvGCSJUkIVLslojq8WR8i/6sqIDtCQPe+TmU6BWE
 6lREtR+DhB3Hfx7pvjDEDI/q3+d9OvTdr7bM8EL3mfTiOWNROCc4iNZwpRi6TegQheJJ
 1/tuRJHOc9kT3jC4J65Kerc1W+b8NGWKqpCbVITCjo4rG5v3KKm252HAwaPt/xK032e6
 I1VTRsV0BYYjsz0LzM6qzsvKSYKNTe9WQ6QgqFfiVFfzNQR9x2wn0VZ7y3tZ+VqOnEdd
 KGCFlmi9pVfSPHV/YLeTIrPQrVNsdPqsxH0+z+plEy5NY0eB4E5Fqqkub1R1Z4GEukA1
 PnIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=bXYtZk9DuHwMmE7lTTFLwrOctNB6LlU7vnhCjjk89UE=;
 b=f69ELwnxFN307hxOJqVNehYg1w/VOxZBUSI3mci7B3YqFG7p9wiLrjhobsICpAGmQY
 KoZedkQ+vc6Tjlb1gtpHNUEuLNdqFPhlXL+3YhCYLORxQyjIkiwtCOBcelX4zbIxBVIA
 rkt/gxosX9bnN3o5DKZG8vlwEj+HgO8Ot9DCHIZsvrtaijlX9YjqzQjg3xdipNCHmAS/
 54AS9uAztcLaJXj6PmHtqi6sx7jXAOTZ9YBWNrdAJ0Vv48dYE8IbBxT4Kn1hbU3i5LJy
 jFdnR6lO+NWYnt5uWYDj/k+Rb/XAXj63nTilFD8UQhUe2hA7FsxgqRD9uM1cyh3AB0ig
 4h3A==
X-Gm-Message-State: ACrzQf3w0G3V6MPQMzxgAQRVl/OlEJTqK9wGZ3HkYpgiHuv+a4iU2uTk
 usvayLUeFd52AWanAXT0jA3PKw==
X-Google-Smtp-Source: AMsMyM4NYRajmi6DsUcjnbjh29HTN041/86Ue8INhhNHcP+iIJ+j/ghsUNko/iPFBv9z40nElL79Lg==
X-Received: by 2002:a05:600c:4211:b0:3b4:6334:9940 with SMTP id
 x17-20020a05600c421100b003b463349940mr3405497wmh.166.1663334680996; 
 Fri, 16 Sep 2022 06:24:40 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
 by smtp.gmail.com with ESMTPSA id
 p5-20020a05600c358500b003a608d69a64sm2387061wmq.21.2022.09.16.06.24.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Sep 2022 06:24:40 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH v5 2/5] ASoC: dt-bindings: qcom: sort compatible strings
Date: Fri, 16 Sep 2022 14:24:24 +0100
Message-Id: <20220916132427.1845-3-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20220916132427.1845-1-srinivas.kandagatla@linaro.org>
References: <20220916132427.1845-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 krzysztof.kozlowski+dt@linaro.org, linux-arm-msm@vger.kernel.org,
 tiwai@suse.com, lgirdwood@gmail.com, robh+dt@kernel.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, bgoswami@quicinc.com,
 linux-kernel@vger.kernel.org
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

Sort compatible strings for consistency reasons.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 Documentation/devicetree/bindings/sound/qcom,sm8250.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
index a3a4289f713e..bab1a6f1890f 100644
--- a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
@@ -20,9 +20,9 @@ properties:
       - qcom,apq8016-sbc-sndcard
       - qcom,db845c-sndcard
       - qcom,msm8916-qdsp6-sndcard
+      - qcom,qrb5165-rb5-sndcard
       - qcom,sdm845-sndcard
       - qcom,sm8250-sndcard
-      - qcom,qrb5165-rb5-sndcard
 
   audio-routing:
     $ref: /schemas/types.yaml#/definitions/non-unique-string-array
-- 
2.21.0

