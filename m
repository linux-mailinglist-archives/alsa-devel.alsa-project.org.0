Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7060626C066
	for <lists+alsa-devel@lfdr.de>; Wed, 16 Sep 2020 11:23:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 678EB1687;
	Wed, 16 Sep 2020 11:22:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 678EB1687
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600248223;
	bh=l4CKBXWuOs7ZvtnHXgc4AFiuYlEgUk+xIYN4bMA21iE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lvL2Xxl51Bbr+GxmBDce9uO3qrnFSaA/1NMFtu7t7l7+3e8s9nRVWIktTQ25BS6HD
	 5VM5Mou+DCIqH5HWx6g98dYStfrB9PVenDFkqbNDBr1I2Y0q62D6FaB9NKY3vYumQO
	 1ayPypVVo+G4TNY0q6KYXnEjN908dXQSTqRpgO+E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3C1ADF801F7;
	Wed, 16 Sep 2020 11:22:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C8FF5F8015D; Wed, 16 Sep 2020 11:21:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 98FE3F8015A
 for <alsa-devel@alsa-project.org>; Wed, 16 Sep 2020 11:21:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 98FE3F8015A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="x/WKrGKl"
Received: by mail-wm1-x344.google.com with SMTP id b79so2188646wmb.4
 for <alsa-devel@alsa-project.org>; Wed, 16 Sep 2020 02:21:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LAN7y6gmMq3/PD5iIj3RPLoID/sAvRO9lIlKiy0ArFU=;
 b=x/WKrGKlNXI82tMCd+If83qGZ4A5V0aiez3Q4+B/y4E0Ii27Gjq07m6Z3gwi1CG23y
 E24ooW4ovp0kMi0yOQcyXv7z+vkI5TYNGoLhtxjhqXR1005UJQA6IfOBBL0u2SNze86C
 +UpBB3Gz9ifTz7wnsgQoURBYlUCWQT83Sti5onaAGBlWfOrkbf9n7Eci4PFLJ1LppDBK
 oiKJcSU+bNjwayoeta4NHd107xBTta+5YhPBCBp18zPBNZ3DmZLRE/XGW9dQqW5Tf0x7
 L/9c27aVxvMpRr0DewhXER6jKs50HLLrVjSdAXAQ/LCkdhQ6UgibO7ErYRNCu1fqLfqU
 JGgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LAN7y6gmMq3/PD5iIj3RPLoID/sAvRO9lIlKiy0ArFU=;
 b=AY4Y4ut12oLOlc5mErmekrjg8koKA4NqNBy8OpxxzalGyXWSmEA7XPk30tEqXmCMMl
 axGBlNjgdwL2h1DNLJY++eTaa6bM+CQkZpC7E5bxMYnZS3e2ggLproqGhlbyligHws2I
 MQz+/GEsHLuI+Xl/MRGbuoSMqrEFmsJ0bEejJ1Sk8Q/fo4gxwqYp/cXdRjRsj3S/fqsY
 R52bglUkAp3iadiK2G27b1DHCt2/WvYgvqPKX+fIrClwJRkJ2auaRB0dH65dzMvQE48N
 256bGuHZoxORVPJqTpw5Fzj+unNaYYfngROhj+k0itSVRCTMPDnVMZTbUdSlgHU3FuX+
 kKlw==
X-Gm-Message-State: AOAM532WHMeYvA/1K/nQ/Dp9iQSrA1mK/M27UhsYSF5+jNXHgZzLA4j5
 G+dVVbH3PHgrJXZlWqw46r/wtQ==
X-Google-Smtp-Source: ABdhPJwuzWJ4qsPKBeZ7Q5Qn1v4IuB+iXGGLmkSzblCo6ZCfthm5bcvzLrZLaYJTBbDvBAJj+277cQ==
X-Received: by 2002:a1c:bdd4:: with SMTP id n203mr3612728wmf.119.1600248110995; 
 Wed, 16 Sep 2020 02:21:50 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.gmail.com with ESMTPSA id f6sm32181670wro.5.2020.09.16.02.21.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Sep 2020 02:21:49 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: vkoul@kernel.org,
	yung-chuan.liao@linux.intel.com
Subject: [PATCH v2 1/3] soundwire: qcom: clear BIT FIELDs before value set.
Date: Wed, 16 Sep 2020 10:21:23 +0100
Message-Id: <20200916092125.30898-2-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200916092125.30898-1-srinivas.kandagatla@linaro.org>
References: <20200916092125.30898-1-srinivas.kandagatla@linaro.org>
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

Fix this by adding back clear register mask before setting it up!

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 drivers/soundwire/qcom.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
index d7aabdaffee3..5d26361ab4f6 100644
--- a/drivers/soundwire/qcom.c
+++ b/drivers/soundwire/qcom.c
@@ -311,6 +311,7 @@ static int qcom_swrm_init(struct qcom_swrm_ctrl *ctrl)
 
 	/* Configure No pings */
 	ctrl->reg_read(ctrl, SWRM_MCP_CFG_ADDR, &val);
+	val &= ~SWRM_MCP_CFG_MAX_NUM_OF_CMD_NO_PINGS_BMSK;
 	val |= FIELD_PREP(SWRM_MCP_CFG_MAX_NUM_OF_CMD_NO_PINGS_BMSK, SWRM_DEF_CMD_NO_PINGS);
 	ctrl->reg_write(ctrl, SWRM_MCP_CFG_ADDR, val);
 
@@ -372,6 +373,9 @@ static int qcom_swrm_pre_bank_switch(struct sdw_bus *bus)
 
 	ctrl->reg_read(ctrl, reg, &val);
 
+	val &= ~SWRM_MCP_FRAME_CTRL_BANK_COL_CTRL_BMSK;
+	val &= ~SWRM_MCP_FRAME_CTRL_BANK_ROW_CTRL_BMSK;
+
 	val |= FIELD_PREP(SWRM_MCP_FRAME_CTRL_BANK_COL_CTRL_BMSK, SWRM_MAX_COL_VAL);
 	val |= FIELD_PREP(SWRM_MCP_FRAME_CTRL_BANK_ROW_CTRL_BMSK, SWRM_MAX_ROW_VAL);
 
-- 
2.21.0

