Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3056B6D45BA
	for <lists+alsa-devel@lfdr.de>; Mon,  3 Apr 2023 15:26:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F1C7F1FB;
	Mon,  3 Apr 2023 15:25:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F1C7F1FB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680528369;
	bh=fVqkXpRmDrMyGh1u3EYPr0s2Cv6KzGYUZFM4WBgRRm0=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=dL5Pm58CuHNqJMU1kOP+ouoJV7lIkPTBLnn7egjdtKEGAtSvzoQr2a3iErbcVEikr
	 SbmeBPS/xGFbaBdqUUqvjx7kfp3LV9Zd6StPqsv4PHYvI1U+J4ReOD+mrf6tLXpRUF
	 X/oa+oGpPDuduoMcR3mmiCKpkVSV62NWAU/m0hII=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E95EEF8024C;
	Mon,  3 Apr 2023 15:25:17 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 12DADF8028B; Mon,  3 Apr 2023 15:25:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A1226F801C0
	for <alsa-devel@alsa-project.org>; Mon,  3 Apr 2023 15:25:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A1226F801C0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=pNpOc5UB
Received: by mail-ed1-x52c.google.com with SMTP id h8so117329685ede.8
        for <alsa-devel@alsa-project.org>;
 Mon, 03 Apr 2023 06:25:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680528306;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zwlbtwLCLCchB8nq5AAOLgMV4f8t/gppXcqkdT8DK04=;
        b=pNpOc5UBRVM7xKwNZ05L/1+9p2I+X8x71uwXah0iO4oOIl84ZAQ0jI2xgtdzv3XYom
         zxxxKoce2CpdBH6UjXdAzQt0TFKT1P+mBzNQO8d/vzU/j2zVNNHDWEYvQayhLbeuJjOh
         AjCSluJq1ucWutPTGosRty025C0yFwTVx0CTwEVct6OZqtt3MZKjKiTESlmmrfjD4hrV
         4uLHcQ6qonHPbtTvuDVAk1Q2m27QTIdyuokGFl7xMq5VoAreVnC0caHgEawH3plX3cpk
         f3ymmh9lC1NVo2cbfY3VuXdAfHt8r3AH1KqmWt9adX9eoE2fgi6vdIu90vP6Qu2+9m0d
         Uz2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680528306;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zwlbtwLCLCchB8nq5AAOLgMV4f8t/gppXcqkdT8DK04=;
        b=whr+W/o5RBgugWzk1mVvcWjYKxMlHp9xe318INorbwwAuue6EcW+7Q0qje5W0SIX96
         Ne2zZb5Fv6QWUi6+JB9dPLfjSaST1rlkSWqHDbgqzaaSdqmhuddD28d/AyBa9FJB3Q6t
         bdQ2qXEIZnabg37HpDrMrzvntjG7NRH2X1Pp3RmpINPxQftJNkoBpnzFtF5k0Y9foZd8
         boepDwbSCV5QLXojrF3kdyOyqsFsG9e0SvVP6buxddfa5ouDZ7hfRv3L3bjkUy3oARC0
         Xv3B64UpSK6df9MdHUEw19WR62ygq5zoRLO5IJMI66p7Cs1U2fNAX3B8Yz8OWVkTbGNt
         9zGg==
X-Gm-Message-State: AAQBX9ebCeAE9LeE6+C8kC4X/0v3NAPBBlcyYNTFANRL9pGtlK68LLFC
	qSPHrepk3SZ7pb/Kr6k03/pPRQ==
X-Google-Smtp-Source: 
 AKy350aeVlKvxHOBVGpIs3CVXzCPJj+2MS1w0lytghRx33dtBHAD01KiVk7McA482UxmdKHdmQm9cw==
X-Received: by 2002:a17:906:9f04:b0:944:8c30:830d with SMTP id
 fy4-20020a1709069f0400b009448c30830dmr28617784ejc.42.1680528306580;
        Mon, 03 Apr 2023 06:25:06 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:ae90:d80:1069:4805])
        by smtp.gmail.com with ESMTPSA id
 p18-20020a170906229200b00930ba362216sm4658489eja.176.2023.04.03.06.25.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Apr 2023 06:25:06 -0700 (PDT)
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
Subject: [PATCH v2 0/7] soundwire: qcom: add support for SM8550 (Soundwire
 v2.0.0)
Date: Mon,  3 Apr 2023 15:24:56 +0200
Message-Id: <20230403132503.62090-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 333WV7K3C2XHP4P3T35EIOF5FAT2NMOQ
X-Message-ID-Hash: 333WV7K3C2XHP4P3T35EIOF5FAT2NMOQ
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Patrick Lai <quic_plai@quicinc.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/333WV7K3C2XHP4P3T35EIOF5FAT2NMOQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi,

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

 .../bindings/soundwire/qcom,soundwire.yaml    |  41 +-
 drivers/soundwire/qcom.c                      | 387 ++++++++++++------
 2 files changed, 289 insertions(+), 139 deletions(-)

-- 
2.34.1

