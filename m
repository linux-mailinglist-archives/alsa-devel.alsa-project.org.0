Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E2CE68ECA1
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Feb 2023 11:17:44 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7C34BE0F;
	Wed,  8 Feb 2023 11:16:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7C34BE0F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675851463;
	bh=6yYwbm4pg7eSuLhj7Ob7cP66gX2ej++NyNuUcyrUcTU=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=VC+eKyenu425ZqH3x/deuD8zYKDIKMHonQK/GK0POESPVmN+mEPvBlTCP08qXCIO7
	 jcw4vdvFHqRs6d9hEsU+k9WKHn+NvU4c/BzFPu/gflxMKvX96ye7xeYLVslbs9FJG4
	 Q18JOswRzpqIs9sC3AeAQxsOl2K2/NNxarhN0RpM=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9BE89F8051D;
	Wed,  8 Feb 2023 11:16:07 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DDA35F80152; Wed,  8 Feb 2023 11:15:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id EADA4F800AF
	for <alsa-devel@alsa-project.org>; Wed,  8 Feb 2023 11:15:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EADA4F800AF
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=VS3V3vJE
Received: by mail-wm1-x329.google.com with SMTP id z13so5483319wmp.2
        for <alsa-devel@alsa-project.org>;
 Wed, 08 Feb 2023 02:15:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eVEuYxssYzS6K5JrTOLvMTdbukj74pIFYD+z30S9/84=;
        b=VS3V3vJEHQN/F+Pe5DaKbbio/v4b9V6vMRPxKMe9+yY+91mSKgemsjWdrDcu1JeGXJ
         cdJIWD2jJi+V4ZySzq1GdZ6g1HP4LYQrGAIAmQB85vYbUIltjKEwAcUuUlDulhhBgsGN
         9BSY0D4iWk9cd8SKjX3wMPBht2t6Mqe9mt9lT2iU1O3Por7ralBb0vCg4kEsX23rOfoS
         cQ6wE6PC34jg/YUoxoDOnlaT+37DKKHzjdCmfrSvO0tIPSs4s0KPx1ynJGU/N7y2PZKQ
         ydEalrfM3VBUK/JwOmihWwkNOC1khv80gD3gmeh4LoVytIVIHbL0HYUTn/jpsQgEvRRV
         XR5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eVEuYxssYzS6K5JrTOLvMTdbukj74pIFYD+z30S9/84=;
        b=UwXj4x63hHl9UUZvRbP8s11q2lfjEsgYzJ1ZbXAQMFaG2183ep7bQCfGH1agno+OmZ
         MjH3RwdFE8Kx/h1Hnyz7nFPdOwM37PlF1VM+YzooMOedm6pf3PY33n5QL7WFx/qZbs/D
         ftEIVW1XJd2VeI4rJXGilfYQgtFz3s/tbWnI4AF9eVTjOFJ7MsX+9zbActbUpSQ49zHD
         P7wBnGe7jdAabRIdrkltBCzb22Y3IXzAFZ5rYIhCoHZ2f0FBHxD/HYoMH0oDKNdwtuOM
         8L2Mrxp6l+SZPchgzZwfXIu3KzNw7gV6QnnXq9Q8ZnPhqhZPxYJ7APqHNS4PHNxZXkkI
         861Q==
X-Gm-Message-State: AO0yUKWeZrnx+ylRHuKsUDpnW/el/NwTgczH0cpvpY92ZU8NjaTQgoej
	/z34kKxQfq6d9LmqT90PXfT09A==
X-Google-Smtp-Source: 
 AK7set8QWSrB1VoOwQDhU4/XDsvh97uKEmQ5ftpRs9Z0p1SnhshHE2kaliOz0S8RQAp+4Zy2+7nrUw==
X-Received: by 2002:a05:600c:13d4:b0:3df:e1e9:200e with SMTP id
 e20-20020a05600c13d400b003dfe1e9200emr6033073wmg.39.1675851351905;
        Wed, 08 Feb 2023 02:15:51 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id
 t14-20020a05600c198e00b003dc4ecfc4d7sm1496328wmq.29.2023.02.08.02.15.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Feb 2023 02:15:51 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Mark Brown <broonie@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	alsa-devel@alsa-project.org
Subject: [PATCH v2 2/7] arm64: dts: qcom: qcs404: align RPM G-Link node with
 bindings
Date: Wed,  8 Feb 2023 11:15:40 +0100
Message-Id: <20230208101545.45711-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230208101545.45711-1-krzysztof.kozlowski@linaro.org>
References: <20230208101545.45711-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 3IS27BMRFCBWNFHKIGM3QS5D63TQQV73
X-Message-ID-Hash: 3IS27BMRFCBWNFHKIGM3QS5D63TQQV73
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3IS27BMRFCBWNFHKIGM3QS5D63TQQV73/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Bindings expect (and most of DTS use) the RPM G-Link node name to be
"rpm-requests".

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

---

Changes since v1:
1. Add Rb tag.
---
 arch/arm64/boot/dts/qcom/qcs404.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/qcs404.dtsi b/arch/arm64/boot/dts/qcom/qcs404.dtsi
index 9c9890cf1b10..bc2ed73afb74 100644
--- a/arch/arm64/boot/dts/qcom/qcs404.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs404.dtsi
@@ -223,7 +223,7 @@ rpm-glink {
 		qcom,rpm-msg-ram = <&rpm_msg_ram>;
 		mboxes = <&apcs_glb 0>;
 
-		rpm_requests: glink-channel {
+		rpm_requests: rpm-requests {
 			compatible = "qcom,rpm-qcs404";
 			qcom,glink-channels = "rpm_requests";
 
-- 
2.34.1

