Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A63454BD925
	for <lists+alsa-devel@lfdr.de>; Mon, 21 Feb 2022 11:43:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B745216A0;
	Mon, 21 Feb 2022 11:42:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B745216A0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645440205;
	bh=/HrfPYImxjh1yk+WzVw8yE0VmOENxTV4OENlPgorNtc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MiOBnTz+Hw+d/SsCLV5kJ9Y5ldmbFYVkCsLgVGWDtVU95jgqg42RTyK88BvTzW9lx
	 pAjfwklnFM39kO1pQDzkftDkw5V+fI0XafyEwNb8NNQHBaNF7pNoY7N7+/XwDT65kU
	 6hvY22FkC6ysfI3sDoTRMWyPl+FSXZeV4CwHQzQI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 71ABAF8051A;
	Mon, 21 Feb 2022 11:41:49 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 84023F80515; Mon, 21 Feb 2022 11:41:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 60F2CF800FA
 for <alsa-devel@alsa-project.org>; Mon, 21 Feb 2022 11:41:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 60F2CF800FA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="nPaWk5Lf"
Received: by mail-wr1-x434.google.com with SMTP id f17so1368188wrh.7
 for <alsa-devel@alsa-project.org>; Mon, 21 Feb 2022 02:41:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=o+5vqkQXPirAu/1Sjt7YkAPFccDLqMMWnr+8F22imTk=;
 b=nPaWk5LfwzEn0LL7hDjXHx+adKazsGK3boQBxuXVtBNxfdkOK746wnkgp6LMGfbhNb
 3KhQCNaITzFt30AfGjK/tMU6Ty0Y1aPMFmaXUWXdSX3geNrC4MbtJgK9NPA6Yi8KYO1o
 EX2g32al3a6ytLBMQhRI0spcxQ9/mBc+6ltz1kvW7dHU3NqyrHAKC2vhfes1UCWGIy4p
 jrYsuSRudJi9MWk7Fmvr9vgyfKZXrma/Y5v6yIlFaDHOZ6O5MQtRWS3HlhGu4Kh9aN/1
 6TvoM04B93mNPWb7ajM4h1WPBNwewoS/SuCfZ7+1gsLqUkKzAQwyQ+veib4QgYSn/z5Z
 wx8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=o+5vqkQXPirAu/1Sjt7YkAPFccDLqMMWnr+8F22imTk=;
 b=vZp4jpmK6Rsb5NQzSlzKszTdXVnj2GsAbMBVSHNdAIcziPtjDNUuK9DoMrzaR8EQm/
 g6sGCqWsQd5rJECIwy1VS+CMagxGf2QNjoH2UAl3Fd7BG0Y1oiyjBsiHoU7wTaZYDtHR
 +xzc4+bArryw/rQVYtdN03qup4WXId4D3c9w2s1uAvISU4aNqqRJRL4P+jUxwHe7fFqn
 xk0W9MHrZrSxiWgR8FOei6nk1YkmJoOI+VqXuR05wQni8J541e7b873JFxQLWXSBw7Lq
 lXRMljMcJQteznmOsVPBqrTVCgCeHe3//zvh8BLL7HwbGFGTSp9/82SFi5+Q95sGdEX+
 o6Ow==
X-Gm-Message-State: AOAM530ldZDoZmPiERYCZnL0akIXR9dEJzsXxr+B9Ojaq0VeYy8U1EGr
 EYn8SD4Vy6v4MNCWSO77a1bULQ==
X-Google-Smtp-Source: ABdhPJzpstyVfklHCpbOqUjZGxa3zUfwEkkM2h9RLHKyNYm3+7V5P1Ua7b4QPNqF21HRAwBj9jw2Ng==
X-Received: by 2002:adf:efcc:0:b0:1e7:cf03:b419 with SMTP id
 i12-20020adfefcc000000b001e7cf03b419mr15153603wrp.122.1645440101330; 
 Mon, 21 Feb 2022 02:41:41 -0800 (PST)
Received: from srini-hackbox.lan
 (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
 by smtp.gmail.com with ESMTPSA id
 n19-20020a05600c4f9300b0037c06fe68casm7584817wmq.44.2022.02.21.02.41.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Feb 2022 02:41:40 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: robh+dt@kernel.org,
	vkoul@kernel.org,
	yung-chuan.liao@linux.intel.com
Subject: [PATCH 2/3] dt-bindings: soundwire: qcom: document optional wake irq
Date: Mon, 21 Feb 2022 10:41:26 +0000
Message-Id: <20220221104127.15670-3-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20220221104127.15670-1-srinivas.kandagatla@linaro.org>
References: <20220221104127.15670-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 pierre-louis.bossart@linux.intel.com, linux-kernel@vger.kernel.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 quic_srivasam@quicinc.com
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

Wake IRQ is optional interrupt that can be wired up on SoundWire controller
instances like RX path along with MBHC(Multi Button Headset connection).
Document this in bindings.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 Documentation/devicetree/bindings/soundwire/qcom,sdw.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/soundwire/qcom,sdw.txt b/Documentation/devicetree/bindings/soundwire/qcom,sdw.txt
index b93a2b3e029d..bade68f429b0 100644
--- a/Documentation/devicetree/bindings/soundwire/qcom,sdw.txt
+++ b/Documentation/devicetree/bindings/soundwire/qcom,sdw.txt
@@ -22,7 +22,7 @@ board specific bus parameters.
 - interrupts:
 	Usage: required
 	Value type: <prop-encoded-array>
-	Definition: should specify the SoundWire Controller IRQ
+	Definition: should specify the SoundWire Controller and optional wake IRQ
 
 - clock-names:
 	Usage: required
-- 
2.21.0

