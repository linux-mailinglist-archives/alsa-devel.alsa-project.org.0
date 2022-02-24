Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 413674C2D26
	for <lists+alsa-devel@lfdr.de>; Thu, 24 Feb 2022 14:33:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CEAB4190D;
	Thu, 24 Feb 2022 14:32:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CEAB4190D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645709617;
	bh=/HrfPYImxjh1yk+WzVw8yE0VmOENxTV4OENlPgorNtc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FVeh0yajtdLI74V3ZrOgQ4vAI2mig+POI6k8MqVZ7NxEd9BRudnxT4fNeb5MvF/Qn
	 1furwsPx5nc/L7uWT0m/6p1hFcWhPsqLiZn67BTs6uvO9EXZ1IJrSeC6m/AhP0KEnQ
	 ntTXPplwzL3baqvqDVB8cI6zqYWutn4wBq+XCzjs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 27C7FF80529;
	Thu, 24 Feb 2022 14:31:51 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 86B83F80524; Thu, 24 Feb 2022 14:31:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B3D5AF80430
 for <alsa-devel@alsa-project.org>; Thu, 24 Feb 2022 14:31:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B3D5AF80430
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="cveEpeC8"
Received: by mail-wr1-x42d.google.com with SMTP id d28so3074242wra.4
 for <alsa-devel@alsa-project.org>; Thu, 24 Feb 2022 05:31:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=o+5vqkQXPirAu/1Sjt7YkAPFccDLqMMWnr+8F22imTk=;
 b=cveEpeC81vvyATlkuSNHZClxmN73VpdpV7cvx4KhuPNSXWLkSePXj8HvRs4Hzk5Xmn
 4Osni1BnGxlG/kqDZ/3sSnNKKtA20bo6ofouvDh4jP/B8pBvek21tXUjHYJBbOvf00Zj
 r6mvOQ9jEaxSzwJDpmHcYbPFUT24PJXftt0abfrKZnNScUbcDFowiikG0aS8qNi9iZvX
 wv5AMMVVg/71236+PkpaTnBlCc+7tAdhj7bW5uyEtZI2CtkDCdZeas4eb2mjWMDghITx
 dlW+57qXlU5uCPl5EfZH/R+5rKjlcb8Lwn5YX00zCpbG6goQmD+7WpDkAYX0qlT9xQho
 reow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=o+5vqkQXPirAu/1Sjt7YkAPFccDLqMMWnr+8F22imTk=;
 b=okxYd5090l/FVuFuohb9LfkFvPCeHObRjo2a2N2DfPaQUrYTG1/sXHHze8H23yJLc4
 FDdSHERaKqXvM5J8KtANdNI0aHInW/lnDq6O6LxPjbFMyajMtW+/IlQaxqzPMPbbsCEv
 Dql41idR1tcjPpZz/dJhhKymSr75EYMt4tBsyWIYyECzDhlw/U1JsWSfNsPAiLqDbHcb
 MTktOf9+2paHRkCh84sxJbw0EVjxcHv0aMJR1hYIKOyM4HDUOgZ1xc2cCXkaAWJHtJh/
 RtlOnT4GawyPZHG3eS85Fh9pliVUe7yvOWkY4kLVZKDhjOnpGgmAUBRfiPMtnqczguVr
 8/oQ==
X-Gm-Message-State: AOAM530+1LH7yj9TS5+dzjt2JSMuPyN/iVXS/sTZDAHxQsEoQam4Ueut
 KW7hP13oaDtg0PY+tp3PGs5DociafZ1DRA==
X-Google-Smtp-Source: ABdhPJy3Isxl3JRAACJsHIBGlKSiYremn17jHDKeNcB+aafXuJygUeIR+72g6AjkXfnX8baSTfP+Jg==
X-Received: by 2002:a5d:5252:0:b0:1e3:7f5:8312 with SMTP id
 k18-20020a5d5252000000b001e307f58312mr2313128wrc.89.1645709502639; 
 Thu, 24 Feb 2022 05:31:42 -0800 (PST)
Received: from srini-hackbox.lan
 (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
 by smtp.gmail.com with ESMTPSA id
 e33-20020a05600c4ba100b003810c690ba2sm2019142wmp.3.2022.02.24.05.31.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Feb 2022 05:31:42 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: robh+dt@kernel.org,
	vkoul@kernel.org,
	yung-chuan.liao@linux.intel.com
Subject: [PATCH v2 2/3] dt-bindings: soundwire: qcom: document optional wake
 irq
Date: Thu, 24 Feb 2022 13:31:24 +0000
Message-Id: <20220224133125.6674-3-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20220224133125.6674-1-srinivas.kandagatla@linaro.org>
References: <20220224133125.6674-1-srinivas.kandagatla@linaro.org>
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

