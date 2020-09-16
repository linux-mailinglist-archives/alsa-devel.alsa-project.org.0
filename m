Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E3BD826C479
	for <lists+alsa-devel@lfdr.de>; Wed, 16 Sep 2020 17:43:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8433511C;
	Wed, 16 Sep 2020 17:43:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8433511C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600271031;
	bh=nBxlD5bkAZ3BsXsWaOEr4xMDUm6pfF5Q7hvXgCNXp0c=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rR5gde6f1zeqM1QA5YF+y9Hbhn7KIYTO8TMTfIiVnecIoTB/sHO633F9612iVD4hC
	 22AY4f9h3ejlCI0Sw9xkj208fwfWJFnzKxtoC9vFk+DYbwatU7ggNKbsOxFFxgz/BV
	 kdx6SYHacIE00ZjqyRPerowaD1VmLq1RDTAzo/P4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E279EF802D2;
	Wed, 16 Sep 2020 17:41:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7BD8DF802C3; Wed, 16 Sep 2020 17:41:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6C5CAF80150
 for <alsa-devel@alsa-project.org>; Wed, 16 Sep 2020 17:41:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6C5CAF80150
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="x96G+S6z"
Received: by mail-wr1-x441.google.com with SMTP id s12so7375467wrw.11
 for <alsa-devel@alsa-project.org>; Wed, 16 Sep 2020 08:41:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QR4X/TKCD+d57b2Ze0jlcbxYS6HqjaoNPSGjtgtVeZ8=;
 b=x96G+S6zKbDmbASlvP7erU7iD+GDKspcvh52WK9lO3bptq4o/JN2t6vGLMOkkB5KOG
 Qc5PuhIaOF4Et5HnoBGWs6yPo2pNJ6//0n37joIqJr9LQ+aqEq+DaPbC29flNyFfasUR
 HxACTxe9CJRbPdlbPFOSEBXE94Py6lsccWUI2TS//pkF1pNnwgZVfa+ZI99aXcgKCvlD
 nSNfrCnoJSrykTuLW/uEyIFR82beHvuaOV1doArQS2pa7/XzLVvZUb7CDbP+3JZ0MLU7
 Y3rJNI5f+jALXdF0UEASyVU/p6v8/1Xunbt9Jyr0XrEhRMBwwKeyf5L81A9pB+4eX8TG
 efJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QR4X/TKCD+d57b2Ze0jlcbxYS6HqjaoNPSGjtgtVeZ8=;
 b=eVrdt4Xm/6ZBgHSuvMcf9e9+86/lJUks0eXjH3xlajdgYw8c/UJVfKeK1ncjjuOV6h
 PIscjPRLK7SoSTkkd9qtAdCmOZN8eSBvuOokKE8eRlQWsXJOZKjbZj0kG0gT0furTzR9
 toSO0qSsyzTSLblym4NSNT0vqlyb+jHV0s/TOolDtkM6ZUkOP2CFE47+iRFdNCiQNe5t
 RpcNcOCkmsU/syzvw4pcmpmRdGkkxl++SuwJfvj7b/T/D/+tAXTxkKxcBc6dvzihoGUm
 LMyOjLpeAjJR9BOVVb0/tJEcemITolEidrGzo9DH1Y7qhTBLFb7/FS7akYRYKYVB0ukK
 6mdg==
X-Gm-Message-State: AOAM533yZBf/D/BKOtqEjLhdfQuE7wO/narMmfTe82Xc5gk5OIcRKXJx
 uaVIhdRXMbm2cYZTXTDbN3LLew==
X-Google-Smtp-Source: ABdhPJxvV/oYmxQjdvC/nE1y4Kgb+u9RgTb9KXGP+lXTt6/rlDcYaUJwo3RYwi7k/zRFDaSSopmDiA==
X-Received: by 2002:a05:6000:100c:: with SMTP id
 a12mr29222491wrx.115.1600270868971; 
 Wed, 16 Sep 2020 08:41:08 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.gmail.com with ESMTPSA id t22sm7223901wmt.1.2020.09.16.08.41.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Sep 2020 08:41:08 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: vkoul@kernel.org,
	yung-chuan.liao@linux.intel.com
Subject: [PATCH v3 1/3] soundwire: qcom: clear BIT FIELDs before value set.
Date: Wed, 16 Sep 2020 16:40:59 +0100
Message-Id: <20200916154101.2254-2-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200916154101.2254-1-srinivas.kandagatla@linaro.org>
References: <20200916154101.2254-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: sanyog.r.kale@intel.com,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org,
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

According to usage (bitfields.h) of REG_FIELDS,
Modify is:
  reg &= ~REG_FIELD_C;
  reg |= FIELD_PREP(REG_FIELD_C, c);

Patch ("soundwire: qcom : use FIELD_{GET|PREP}") seems to have
accidentally removed clearing bit field while modifying the register.

Fix this by using u32_replace_bits() to clear and set the values.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 drivers/soundwire/qcom.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
index d7aabdaffee3..0036d3248fb4 100644
--- a/drivers/soundwire/qcom.c
+++ b/drivers/soundwire/qcom.c
@@ -311,7 +311,7 @@ static int qcom_swrm_init(struct qcom_swrm_ctrl *ctrl)
 
 	/* Configure No pings */
 	ctrl->reg_read(ctrl, SWRM_MCP_CFG_ADDR, &val);
-	val |= FIELD_PREP(SWRM_MCP_CFG_MAX_NUM_OF_CMD_NO_PINGS_BMSK, SWRM_DEF_CMD_NO_PINGS);
+	val = u32_replace_bits(val, SWRM_DEF_CMD_NO_PINGS, SWRM_MCP_CFG_MAX_NUM_OF_CMD_NO_PINGS_BMSK);
 	ctrl->reg_write(ctrl, SWRM_MCP_CFG_ADDR, val);
 
 	/* Configure number of retries of a read/write cmd */
@@ -372,8 +372,8 @@ static int qcom_swrm_pre_bank_switch(struct sdw_bus *bus)
 
 	ctrl->reg_read(ctrl, reg, &val);
 
-	val |= FIELD_PREP(SWRM_MCP_FRAME_CTRL_BANK_COL_CTRL_BMSK, SWRM_MAX_COL_VAL);
-	val |= FIELD_PREP(SWRM_MCP_FRAME_CTRL_BANK_ROW_CTRL_BMSK, SWRM_MAX_ROW_VAL);
+	val = u32_replace_bits(val, SWRM_MAX_COL_VAL, SWRM_MCP_FRAME_CTRL_BANK_COL_CTRL_BMSK);
+	val = u32_replace_bits(val, SWRM_MAX_ROW_VAL, SWRM_MCP_FRAME_CTRL_BANK_ROW_CTRL_BMSK);
 
 	return ctrl->reg_write(ctrl, reg, val);
 }
-- 
2.21.0

