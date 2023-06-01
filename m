Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A5D9F7199A6
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Jun 2023 12:26:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DBCF020C;
	Thu,  1 Jun 2023 12:25:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DBCF020C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685615188;
	bh=na4NYMjq1VZM+ajJ8f2k+aHhm4e2XWoFrDPxVbtJAMc=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=eJsiqcF/ggS8PNDW9qxHKAewTPX8shgYNryCx0Hfep+lnvrkTMYH0d12EW8XVq3bp
	 D+b3a8ltfLZMxIwynoFOCKra+qW/b++K6hW/bW7jjXI4yQY1UDtDn9JqzvHDACYdLT
	 HKY6mx+KqBt+M69ak4clfMBpRN30VLhyeTW7NKi8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 368F3F80132; Thu,  1 Jun 2023 12:25:38 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BBFBAF80132;
	Thu,  1 Jun 2023 12:25:37 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 29E12F80149; Thu,  1 Jun 2023 12:25:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9B088F800C1
	for <alsa-devel@alsa-project.org>; Thu,  1 Jun 2023 12:25:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9B088F800C1
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=gmeGoT8O
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-51458187be1so1066144a12.2
        for <alsa-devel@alsa-project.org>;
 Thu, 01 Jun 2023 03:25:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685615128; x=1688207128;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Biydlf7PIGQ7H2/3MOSbK0GWIW8cjwIGbXqmPIt7ZJ8=;
        b=gmeGoT8OHlZgbn+14JgZQxDwt4oFmVtRUNaFe9JQFXp11mJL0oa7mHcHcMHdcLoWWU
         6GeY4xGQ7rX8jKxEGb8XOlqxV3drixKvl4jyK9ziTlW8RwLo7EIYRMjLhb4QLzLWKids
         MhSkPlaF50xsVbywzC1461158Ea86YsxyPuxlXGmvsM4ZJpXRXRhOwcWrOkPwEkoVU09
         z13bpTcElB3Tv5tW4qDW5e+8S/699KeSHrRT5JVrAc8FDAZ+toX3Yvbp+4DZreCAIMnN
         vo3DeqtKpXZL8sMhUKtPN+3iDcr3E0JR9kaTj0oDGou+ntk1dBJMb7PexIOH4vQoYrnh
         SqxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685615128; x=1688207128;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Biydlf7PIGQ7H2/3MOSbK0GWIW8cjwIGbXqmPIt7ZJ8=;
        b=iMNd0KTGW/xFtdwtPZlMne3e1fnKUryvxX782s5KOFTTtStdbk2+t3/nrycXxINHH7
         Q/puVJR7FSsHFfDpbzdM1GZWLJ0ax/GuDTBr3vL/le/6tHehWczzPIKPzUHcYcTIUYN5
         F7+zVU7Rp4HK7i1Szut4TAgDY/QVnwklrlA6fSYRrdxdaY0/y02UyHBMCe7TfKDJFR2o
         Fp3Jv8kTyq5cRCAgNV9zzDv0Ej8EqRSY4EIocWjbi103PKB/LNNxS35PVZmkHzn7cFFL
         uDExJnPTdKsc5debmhSKIGCXHCvjyxSg6sazHMHLiGr3lIn8JnGkftnrM8x/fxmWBEBi
         YfLg==
X-Gm-Message-State: AC+VfDxoh2auUMd5E2T+M0uqzZloY7CFcjqEhh/2SO4/XB8Pkv14FiJF
	I0LMof6EnjseJ2cHi3B3EMqGjQ==
X-Google-Smtp-Source: 
 ACHHUZ5m3bbTuSL6NcGE8tNmlnw3gV+4MJQV0FHwNUM7U8AKi7QylF5r3rjXHxygr3xpmsbU/xYORw==
X-Received: by 2002:a17:906:fd8b:b0:96a:3e39:f567 with SMTP id
 xa11-20020a170906fd8b00b0096a3e39f567mr7427867ejb.47.1685615128682;
        Thu, 01 Jun 2023 03:25:28 -0700 (PDT)
Received: from krzk-bin.. ([178.197.199.204])
        by smtp.gmail.com with ESMTPSA id
 dk5-20020a170906f0c500b00965b2d3968csm10247758ejb.84.2023.06.01.03.25.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Jun 2023 03:25:28 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Vinod Koul <vkoul@kernel.org>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Sanyog Kale <sanyog.r.kale@intel.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	stable@vger.kernel.org,
	kernel test robot <lkp@intel.com>,
	Dan Carpenter <error27@gmail.com>
Subject: [PATCH] soundwire: qcom: fix storing port config out-of-bounds
Date: Thu,  1 Jun 2023 12:25:25 +0200
Message-Id: <20230601102525.609627-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: HFFHR5RSXNP67R4TKRK6JI5OB46JADH3
X-Message-ID-Hash: HFFHR5RSXNP67R4TKRK6JI5OB46JADH3
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HFFHR5RSXNP67R4TKRK6JI5OB46JADH3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The 'qcom_swrm_ctrl->pconfig' has size of QCOM_SDW_MAX_PORTS (14),
however we index it starting from 1, not 0, to match real port numbers.
This can lead to writing port config past 'pconfig' bounds and
overwriting next member of 'qcom_swrm_ctrl' struct.  Reported also by
smatch:

  drivers/soundwire/qcom.c:1269 qcom_swrm_get_port_config() error: buffer overflow 'ctrl->pconfig' 14 <= 14

Fixes: 9916c02ccd74 ("soundwire: qcom: cleanup internal port config indexing")
Cc: <stable@vger.kernel.org>
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <error27@gmail.com>
Link: https://lore.kernel.org/r/202305201301.sCJ8UDKV-lkp@intel.com/
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/soundwire/qcom.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
index 7cb1b7eba814..88a772075907 100644
--- a/drivers/soundwire/qcom.c
+++ b/drivers/soundwire/qcom.c
@@ -202,7 +202,8 @@ struct qcom_swrm_ctrl {
 	u32 intr_mask;
 	u8 rcmd_id;
 	u8 wcmd_id;
-	struct qcom_swrm_port_config pconfig[QCOM_SDW_MAX_PORTS];
+	/* Port numbers are 1 - 14 */
+	struct qcom_swrm_port_config pconfig[QCOM_SDW_MAX_PORTS + 1];
 	struct sdw_stream_runtime *sruntime[SWRM_MAX_DAIS];
 	enum sdw_slave_status status[SDW_MAX_DEVICES + 1];
 	int (*reg_read)(struct qcom_swrm_ctrl *ctrl, int reg, u32 *val);
-- 
2.34.1

