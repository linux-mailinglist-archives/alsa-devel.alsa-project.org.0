Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A0ACB6E5E0B
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Apr 2023 11:55:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CBDA9E10;
	Tue, 18 Apr 2023 11:55:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CBDA9E10
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1681811750;
	bh=J5V9liva7UmY2eDMROsVVbGERcUZUS+E/tzhSsGTutY=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=i/n0ch+DvHAsL4MgMmcWiMdqH78jToo/lHY5svNQ0B82Fw/z7NqCvvZiht11QLlOh
	 4dDegZfNL7Jo0uAC14H74VdkH2EWj0VXwQsOd7OOpCAwWNjg5J/MLqBxn1Dwv4xjIj
	 ivXPZDn6RnR9N0p+3FnU2tVzVeJvz1gx7VnJAMUs=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 98743F8019B;
	Tue, 18 Apr 2023 11:54:59 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 89DA2F8019B; Tue, 18 Apr 2023 11:54:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 944F3F800F8
	for <alsa-devel@alsa-project.org>; Tue, 18 Apr 2023 11:54:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 944F3F800F8
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=PlTVbNDB
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-506bf4cbecbso178537a12.1
        for <alsa-devel@alsa-project.org>;
 Tue, 18 Apr 2023 02:54:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681811690; x=1684403690;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2XjTw2b21Lrfk4Jj+V6+6PBPJM9Xvx/rp1PjUa4gW2g=;
        b=PlTVbNDBEYUnR+2Y6PfJVtcYCczUn6Ca3dFuBncv4GXwgOmqtytA4fs28OTeWM4bsi
         OS7QrnQH1b2vjIE72icuKzcpmJFOseNqLoSXZa12NOGqUkcrdFuaxFnFcg4Du1wpRfal
         lca47bv8Mt7LBSSPs5Fr7c+RZ5PJx2XWoXdBVuIXQHWjPKRqm3z+OFgYuAlHm6PnJvlR
         Y3lyID1XKdRBSd6vHlzn/ntqwltwmDwpMNdTt9OBbHVFz2PJIj+e3ZMtUs7wU1rOx2r0
         XpB07nyyJfMShpJfpsx8Jh9VIi115BHRbvIg+Va21QjlNlkQBIS23un1c4Gj86aeqdf0
         quMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681811690; x=1684403690;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2XjTw2b21Lrfk4Jj+V6+6PBPJM9Xvx/rp1PjUa4gW2g=;
        b=ZTgQpAXfTmTgG2UbygqCc2KYFDA4tLGSc0CTRTpKvo5omMtGjU8X7cWFmH3DQ15//H
         cQ5qeTEs/MY4h/ZEprDbNQPKesPxcZKutZRtkwfA6z4xzFQO4gKQwiv+ZCNf/V8NilFa
         sK/nrB35L7dHP/wNf+o8ImSHrQ8AbzFEHtA+NkPQ8CeF2em3XVkbroxtIRGrUVMQi3a/
         atpCzw1i8zbbdt3EQs+5fhvdiIe9gpn8I4l7LN52JJr2yJafpvhDLa7bYjYtJrCUisey
         MlEip/srCmn1Aa7G1bHABG/J3YAzE/Tyr3axbtuKPmKDcfBNCHd3+BjMp2y6OSzUiESu
         HFjA==
X-Gm-Message-State: AAQBX9ffGsmcqevSb/8FrpmwO9bLYEV5c4lBVKgrAF743fJCTj8xSft2
	BRU8TBiL59nvhBP1dB90CtINMw==
X-Google-Smtp-Source: 
 AKy350ZoxJAY3osQymk/xjYIDkdSjS0BzSqPxS/Lm+86HDfHKVxW1WWwARUG2qSTrkpHqDsjf2Kytg==
X-Received: by 2002:a05:6402:748:b0:506:ae87:a36a with SMTP id
 p8-20020a056402074800b00506ae87a36amr1867913edy.14.1681811690360;
        Tue, 18 Apr 2023 02:54:50 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:a276:7d35:5226:1c77])
        by smtp.gmail.com with ESMTPSA id
 o4-20020a509b04000000b00504d04c939fsm7076578edi.59.2023.04.18.02.54.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Apr 2023 02:54:49 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Vinod Koul <vkoul@kernel.org>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Sanyog Kale <sanyog.r.kale@intel.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Rao Mandadapu <quic_srivasam@quicinc.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org
Subject: [PATCH v3 0/7] soundwire: qcom: add support for SM8550 (Soundwire
 v2.0.0)
Date: Tue, 18 Apr 2023 11:54:40 +0200
Message-Id: <20230418095447.577001-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: EIWV4W4YM2XFDGSUFVQY5LQFBOZLZWVC
X-Message-ID-Hash: EIWV4W4YM2XFDGSUFVQY5LQFBOZLZWVC
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EIWV4W4YM2XFDGSUFVQY5LQFBOZLZWVC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi,

Changes since v2:
1. Use uint16 for qcom,ports-sinterval.
   DTS will be fixed in separate patchset.
2. Add tags.

Changes since v1:
1. Patch 1: Increase maxItems to 16 for port-related properties.
2. Re-order patch 1 and 2.
3. Patch 3: Drop unneeded semicolon.
4. Patch 5: Fix lang typo in subject.

Best regards,
Krzysztof

Krzysztof Kozlowski (7):
  dt-bindings: soundwire: qcom: add Qualcomm Soundwire v2.0.0
  dt-bindings: soundwire: qcom: add 16-bit sample interval
  soundwire: qcom: allow 16-bit sample interval for ports
  soundwire: qcom: use consistently 'ctrl' as state variable name
  soundwire: qcom: prepare for handling different register layouts
  soundwire: qcom: add support for v2.0.0 controller
  soundwire: qcom: use tabs for indentation in defines

 .../bindings/soundwire/qcom,soundwire.yaml    |  39 +-
 drivers/soundwire/qcom.c                      | 387 ++++++++++++------
 2 files changed, 287 insertions(+), 139 deletions(-)

-- 
2.34.1

