Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4981060DF43
	for <lists+alsa-devel@lfdr.de>; Wed, 26 Oct 2022 13:04:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C93013F26;
	Wed, 26 Oct 2022 13:03:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C93013F26
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666782277;
	bh=eWbmVg5+W1edCypNRGrNsdMwNPOC7NYNRxz2Xm0ICWU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PM+ol9+poZ1IPmeQJbdwSrj6YINr2UNED3yU9xeFeFPYOTHkj+KpuqW3+z7EZLGQT
	 I/sfyIk6qAuaNBg63Y3MJGykW9JQ+ehsTYUYdIzrvoOf7n70BYyfLVnF9q3ttdTe3r
	 6y9aoG+HNRKbjbPkcp4utExWLRuFnww9rnKaXMJ8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C4B2AF80563;
	Wed, 26 Oct 2022 13:02:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 14097F80271; Wed, 26 Oct 2022 13:02:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 16223F80508
 for <alsa-devel@alsa-project.org>; Wed, 26 Oct 2022 13:02:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 16223F80508
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="O0WFoE7v"
Received: by mail-wr1-x431.google.com with SMTP id a14so22897751wru.5
 for <alsa-devel@alsa-project.org>; Wed, 26 Oct 2022 04:02:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=M5yIrMJGpCUVHY5GfvEg2i8ek5laLkQGA9zDhfgH9W8=;
 b=O0WFoE7vynG5KsDSLBTFaIikesyRanRpjq1Fbxh8BuIkEZPvwoh44dIJul80ph+gwD
 rZwgeujH8Jrqy5sdsHIof+RuuAV1KqKL3KvfAiG9wLOC8xAfKuEGIHPtn06ySffpqZeN
 aumbCJgl4ls0yXf6bpilHRmPTXLhy5a6pUOkhhqlLa+tzfaJYuttbymXSDmZojdGgdlt
 oloWKlyka5phBa9RRrNKMY1mQ2Uf65iVjz7uBeQzrvMXrP+GScvYRgOY+e9rSC36yBBz
 ed77qagUS1Rob8EEX/CWe50WoKf67T7rcO0R7hgkdOJFEpDEWF0MT5e7ysaxAynioCu8
 9Sqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=M5yIrMJGpCUVHY5GfvEg2i8ek5laLkQGA9zDhfgH9W8=;
 b=uEjEWjaXpH4VFqgiNDgaIrdIpQqPfuk/59RbYHhFnaFd0FdA+nmfsZ1dObyGSDlDso
 cbNF5oWzGay3bNUvYc+/d+FpFaprfVZwuslGCbhfkh+S9iodXxgjdD9jMsu8TDcKe5Eg
 FhwDjlidARtHti38e+uu4KYZGGFRZSnJ6ykSNuVQSqNi7HO+7jwcynfOxh7k5purRznX
 GTl5cNjovOTSNzk/lfEMxP+YIsetMUQ0OMR6lT4jl4IViycPdLjn7zedI1cw1G1iXPng
 T42/eoUA4+aQu/gy/ZaLWjuvRk6HmIoBXEehGSIuseZLZDHKw8nL4Yb0+JorXAN7J75r
 6hpA==
X-Gm-Message-State: ACrzQf3vuxj61/8/TfnAL/PPcuzEmnNdYDqbtpZ8uPGjjSgGXZ4Nrqfe
 jueYjvGfLMQg64Wo2RlrBunszA==
X-Google-Smtp-Source: AMsMyM5yubBRK+wTdLXV82WHsx/yLGwYXhc+1W6ivTLWBc2NSpO2f9tW06JksBg6fsNSAz3QPdSJTQ==
X-Received: by 2002:a05:6000:1f87:b0:236:7683:e5c0 with SMTP id
 bw7-20020a0560001f8700b002367683e5c0mr9178434wrb.193.1666782148331; 
 Wed, 26 Oct 2022 04:02:28 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
 by smtp.gmail.com with ESMTPSA id
 z7-20020a5d44c7000000b0023672104c24sm5237415wrr.74.2022.10.26.04.02.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Oct 2022 04:02:27 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: vkoul@kernel.org,
	yung-chuan.liao@linux.intel.com
Subject: [PATCH 5/6] dt-bindings: soundwire: qcom: add v1.7.0 support
Date: Wed, 26 Oct 2022 12:02:09 +0100
Message-Id: <20221026110210.6575-6-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20221026110210.6575-1-srinivas.kandagatla@linaro.org>
References: <20221026110210.6575-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-arm-msm@vger.kernel.org, andersson@kernel.org,
 pierre-louis.bossart@linux.intel.com, linux-kernel@vger.kernel.org,
 robh+dt@kernel.org, srinivas.kandagatla@linaro.org,
 krzysztof.kozlowski+dt@linaro.org, sanyog.r.kale@intel.com
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

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 Documentation/devicetree/bindings/soundwire/qcom,sdw.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/soundwire/qcom,sdw.txt b/Documentation/devicetree/bindings/soundwire/qcom,sdw.txt
index c85c25779e3f..e0faed8dceac 100644
--- a/Documentation/devicetree/bindings/soundwire/qcom,sdw.txt
+++ b/Documentation/devicetree/bindings/soundwire/qcom,sdw.txt
@@ -13,6 +13,7 @@ board specific bus parameters.
 			"qcom,soundwire-v1.5.0"
 			"qcom,soundwire-v1.5.1"
 			"qcom,soundwire-v1.6.0"
+			"qcom,soundwire-v1.7.0"
 - reg:
 	Usage: required
 	Value type: <prop-encoded-array>
-- 
2.21.0

