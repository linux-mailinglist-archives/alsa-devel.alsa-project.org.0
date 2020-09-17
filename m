Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F5A826DAFC
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Sep 2020 14:04:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AA673846;
	Thu, 17 Sep 2020 14:03:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AA673846
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600344258;
	bh=Qqgwo8cAuxe0EVzMFBzzJE6LUSYgCS9EOfcnSgK3ZQk=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=draDZB8oFxyNGDZuSFjzf7EM6veIt/kQhIz62FpAwCwgJo1QOsMMCMBIyS9raaNxO
	 dG9qwA34dm6WOnjOdH86PQ+wzkIDsPW4tQnNtmWoiBgedrcnwJb7K0W1WlITG2ChHs
	 B5FjvnFW1oJZ7fkMQr8BkxLmmeyXROKVOhS0Gm5M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 252FBF801EC;
	Thu, 17 Sep 2020 14:02:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C58F0F802BD; Thu, 17 Sep 2020 14:01:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7269EF8013A
 for <alsa-devel@alsa-project.org>; Thu, 17 Sep 2020 14:01:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7269EF8013A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="Q91wsA08"
Received: by mail-wr1-x444.google.com with SMTP id x14so1746110wrl.12
 for <alsa-devel@alsa-project.org>; Thu, 17 Sep 2020 05:01:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xDW/5TUsrxUdneMS88BtzV57xAqG/0FhZp46vJIbMBk=;
 b=Q91wsA08pCF9KPpTfTTu0zX1S3G9KH+OFJG3zCSDTMo5YOm+XADoO1vluy4jhWRoFQ
 +5tPuNZ+3f82ehiFGlI3NB6z+sdyEt/ysYmnC1XhfZOwfkN19+Cj/H2rOSMxhj7rZmwn
 qzGNZjlfn1wtwx8e1UZSSJZ2Meq7dZffNbgNVXILrINJjTDBdyqb7WD5OldWQe1QeBB1
 xdMXQt9xa+HGI7PtBabx1SM3mp+v8TXnzuwK/1xibK1wd75UANqI5eo1A0voc9a8kcdc
 7Dphg9JH81fBG616juKWxi6FTBS7kiyjoluUbiygfuCfaAgC43lIVWnTbPyI4CF4lENt
 tr0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xDW/5TUsrxUdneMS88BtzV57xAqG/0FhZp46vJIbMBk=;
 b=ooQpjloYULkb2DwxXvgUjcEqdqCqo2d06Njh2lxF+cLJIzqx3iCUeX8E19bM1ZkI0N
 OdqRyKGzo1bk6ViWMiFLtOIyYntbgfqgbnDpWu+1PIbWO5a4tBPySd4up8JJc1iNEMhg
 SIUySMIpLH8s6LtATjWteSfwnihQEcHXZBu2Dqj4QKtBIERNkJY/HZD4OrL5tyvbuBQe
 RKVTX1MYKQkXyc9fD71WC/0VClWezurVzep6RyYeFskrSDDldsAxD4fmSRnnqtAAydRS
 YsBo0v057gOX8KqjfIq9PXRF8Y+/88kbPEttCYymsZz2j5NfTNnEmvIxWaGhMwEvg+p9
 WmMg==
X-Gm-Message-State: AOAM531JL+bTY3GgMqeLWAUMBlo9PUQA1jC2Miwd0KbG/lwOZTWWUKSQ
 nRBN+JCa9hAdkVFy0imsSLVhJ2eOqUTuuA==
X-Google-Smtp-Source: ABdhPJznqkCbHmg/ULWibtL1ntpaNlbG1jCTGBGonNSLtbaisrLzXrRHxExh9sdYXczbULTSx61bmg==
X-Received: by 2002:adf:df05:: with SMTP id y5mr34676147wrl.39.1600344103639; 
 Thu, 17 Sep 2020 05:01:43 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.gmail.com with ESMTPSA id q18sm37584860wre.78.2020.09.17.05.01.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Sep 2020 05:01:42 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: vkoul@kernel.org,
	yung-chuan.liao@linux.intel.com
Subject: [PATCH v4 1/3] soundwire: qcom: clear BIT FIELDs before value set.
Date: Thu, 17 Sep 2020 13:01:36 +0100
Message-Id: <20200917120138.11313-2-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200917120138.11313-1-srinivas.kandagatla@linaro.org>
References: <20200917120138.11313-1-srinivas.kandagatla@linaro.org>
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

Fix this by using u32p_replace_bits() to clear and set the values.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 drivers/soundwire/qcom.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
index d7aabdaffee3..c1bb35884182 100644
--- a/drivers/soundwire/qcom.c
+++ b/drivers/soundwire/qcom.c
@@ -311,7 +311,7 @@ static int qcom_swrm_init(struct qcom_swrm_ctrl *ctrl)
 
 	/* Configure No pings */
 	ctrl->reg_read(ctrl, SWRM_MCP_CFG_ADDR, &val);
-	val |= FIELD_PREP(SWRM_MCP_CFG_MAX_NUM_OF_CMD_NO_PINGS_BMSK, SWRM_DEF_CMD_NO_PINGS);
+	u32p_replace_bits(&val, SWRM_DEF_CMD_NO_PINGS, SWRM_MCP_CFG_MAX_NUM_OF_CMD_NO_PINGS_BMSK);
 	ctrl->reg_write(ctrl, SWRM_MCP_CFG_ADDR, val);
 
 	/* Configure number of retries of a read/write cmd */
@@ -372,8 +372,8 @@ static int qcom_swrm_pre_bank_switch(struct sdw_bus *bus)
 
 	ctrl->reg_read(ctrl, reg, &val);
 
-	val |= FIELD_PREP(SWRM_MCP_FRAME_CTRL_BANK_COL_CTRL_BMSK, SWRM_MAX_COL_VAL);
-	val |= FIELD_PREP(SWRM_MCP_FRAME_CTRL_BANK_ROW_CTRL_BMSK, SWRM_MAX_ROW_VAL);
+	u32p_replace_bits(&val, SWRM_MAX_COL_VAL, SWRM_MCP_FRAME_CTRL_BANK_COL_CTRL_BMSK);
+	u32p_replace_bits(&val, SWRM_MAX_ROW_VAL, SWRM_MCP_FRAME_CTRL_BANK_ROW_CTRL_BMSK);
 
 	return ctrl->reg_write(ctrl, reg, val);
 }
-- 
2.21.0

