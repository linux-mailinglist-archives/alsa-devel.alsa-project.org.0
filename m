Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ACD369F616
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Feb 2023 15:04:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8088AEAA;
	Wed, 22 Feb 2023 15:04:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8088AEAA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1677074697;
	bh=JXPx4IDbYwM1OeC46S0LQ+n5xy2UnbDSGsDJHoyednE=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=PSLpAcomEdBLsjtbaX/tMpZogW5DU3IkVULCO2AwAcTBxTKsLcFlLkDw0SsCHSSv5
	 2t/knRfX+t4ih2rarOLCaSBRGAe3pTx1xp1yXcMssOqa7Ef2+ad+jeEBCYOSOLbtyo
	 xJBOrWmMfjy2crpbNWSMh5nDaIMGLoJot1p9O68k=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 469E7F8025A;
	Wed, 22 Feb 2023 15:04:06 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 32999F80266; Wed, 22 Feb 2023 15:04:03 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 31201F80125
	for <alsa-devel@alsa-project.org>; Wed, 22 Feb 2023 15:03:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 31201F80125
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=CrArXo1e
Received: by mail-wr1-x433.google.com with SMTP id r7so7677385wrz.6
        for <alsa-devel@alsa-project.org>;
 Wed, 22 Feb 2023 06:03:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=g5UJMcZWkv0Duw8v6BzxymiOTt/dWj5iraOc3PiPg+w=;
        b=CrArXo1e9kBrDozaImqVOs6XagCQmqDxyhZ0UG/P9YUyxojo5L7Q9op8Cre5bY3evD
         9zgVBqb60t1BECkEf+cWMuB2gxXv3iWWetdi0Q5SA6V2hqCNFdO3xKmjjdIW2OWoon9l
         KOVl/+JoOq02FTFXhwwE/ULn8JScIyhfOBsUNpH3MF8bEBPDs5AdOuZ3N37joRhXClfV
         CNE87vf5v+dQIfwbA7SWsU4wghpzR9Q9r7PHAhiKDH0ntLAMl3yee1Rl/vZShESQdHZu
         nXoCSGj1XjDoK7Q1LGgin0vaeTRRnaWhEBt5Y59j2Q4flB0pQPRaek3fJD0zH9QP6e7x
         QB0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g5UJMcZWkv0Duw8v6BzxymiOTt/dWj5iraOc3PiPg+w=;
        b=U825776y4mZsIrpddB58VAgWuy0FfbvFdTqSObA8dWPa7yvzD2q9q3D1ONDrGdZY7V
         bFOCkkYMBn4bSGLJF+oEJUHiFG4FIbu1rdKU99EsU0YFQe5rCrwV6j+q0hL6Ct/8HuAW
         io696KimMTU844SNtPypLZG9x0eCqc4tA6HcyUKIbVX1UtuGWbXDPCacOY5Vj0oMHclQ
         NFKrB4q7tto7BveMFTtlFg5MLHA+FZCqzDr/qxEKX15yIzgzX/qotoO4/KcL/fhEbeHK
         +dRC4NnDWLSmW10KVQJk/J3EpUptrjtIj80oM3MOjOn1JVXPia95dRnCeMAZ49FW/waa
         irFA==
X-Gm-Message-State: AO0yUKWa8aoAWZfTnkQ5JO0wpbJKsEvB6lUhmOwIHMSGLmTz5NqJF+Z4
	J9XoHJh4f9M100tK4USgDp41KQ==
X-Google-Smtp-Source: 
 AK7set/blT1rphmk6H2VLUJH4NhHkF6T5WNogs23YUXttsGptBpOTkdlvryr8YWMf71d7zV62TafbA==
X-Received: by 2002:a5d:684c:0:b0:2c6:3d2a:435b with SMTP id
 o12-20020a5d684c000000b002c63d2a435bmr7946597wrw.67.1677074628089;
        Wed, 22 Feb 2023 06:03:48 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id
 d1-20020a5d4f81000000b002c5526234d2sm6991346wru.8.2023.02.22.06.03.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Feb 2023 06:03:46 -0800 (PST)
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
Subject: [PATCH] soundwire: qcom: correct setting ignore bit on v1.5.1
Date: Wed, 22 Feb 2023 15:03:43 +0100
Message-Id: <20230222140343.188691-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: NWKSFTCMFGRKPD226IPEUE6A67NPAQGX
X-Message-ID-Hash: NWKSFTCMFGRKPD226IPEUE6A67NPAQGX
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 stable@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NWKSFTCMFGRKPD226IPEUE6A67NPAQGX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

According to the comment and to downstream sources, the
SWRM_CONTINUE_EXEC_ON_CMD_IGNORE in SWRM_CMD_FIFO_CFG_ADDR register
should be set for v1.5.1 and newer, so fix the >= operator.

Fixes: 542d3491cdd7 ("soundwire: qcom: set continue execution flag for ignored commands")
Cc: <stable@vger.kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/soundwire/qcom.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
index d5b73b7f98bf..29035cf15407 100644
--- a/drivers/soundwire/qcom.c
+++ b/drivers/soundwire/qcom.c
@@ -733,7 +733,7 @@ static int qcom_swrm_init(struct qcom_swrm_ctrl *ctrl)
 	}
 
 	/* Configure number of retries of a read/write cmd */
-	if (ctrl->version > 0x01050001) {
+	if (ctrl->version >= 0x01050001) {
 		/* Only for versions >= 1.5.1 */
 		ctrl->reg_write(ctrl, SWRM_CMD_FIFO_CFG_ADDR,
 				SWRM_RD_WR_CMD_RETRIES |
-- 
2.34.1

