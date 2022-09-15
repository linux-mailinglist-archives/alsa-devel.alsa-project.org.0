Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B9245B9B31
	for <lists+alsa-devel@lfdr.de>; Thu, 15 Sep 2022 14:43:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5F1A81A24;
	Thu, 15 Sep 2022 14:42:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5F1A81A24
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663245801;
	bh=daD0OI39JP4VcLgi2ZDMv2zu3F3TC4B6lr7fy/yyGW4=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=aHcp9+czx+bK5ThR3nxjeMKjvudAT7oCB151EpH9yUG2kWOyLvU6p06HmU3LUVDrN
	 HQfcidUvSV8p9klzSOX9o+M1P+14l5RUkrmO8hrKZjiUj0qNKeF4EaPwz6/YP5wviC
	 EyaKil/0kKokbswsl2zZEI2jASYEPpFmSXjg5OyI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ED4A3F80238;
	Thu, 15 Sep 2022 14:42:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B5D1AF8027D; Thu, 15 Sep 2022 14:42:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3871EF8008E
 for <alsa-devel@alsa-project.org>; Thu, 15 Sep 2022 14:42:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3871EF8008E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="LlF+gnOC"
Received: by mail-wr1-x42c.google.com with SMTP id k9so30747297wri.0
 for <alsa-devel@alsa-project.org>; Thu, 15 Sep 2022 05:42:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=5CMlBI/PrKLuiXDRVCmkwWXBv4d9T3I5m7kPv3uZKXk=;
 b=LlF+gnOCTKInIpXUMWd7obhKq5M2pJu5O+Wb3rhT2HxfBdERUsLE1wWgnOlJfg/q4K
 5Q5NYgl0EI7oudjmN2BXcWJ+A68ZdIYq0HPrx7dvi02Z6xKSkrgyEtaRuwEmGfHU9tMh
 nsM98mhMPbu5R4iLSaJMKjePD/uulH7Xs45cvI3yzh9mvo2cALXcc+hs1wlnMENiyAL0
 3qGjhwXNtoVkDOzxGLFh4G2f3OodGTSla8G8Osdc7DhVa3ehbWXvP9QUnXqVUQwf3V6B
 KLqFvvvFu+W3HaZPn+yMpwjTfJzGURbTj+bOerzKyfrWygYV0lEkt7cWCSwGJ8szxcmx
 cDlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=5CMlBI/PrKLuiXDRVCmkwWXBv4d9T3I5m7kPv3uZKXk=;
 b=F3q5v79SZVFt9JCLz9i1SsUPeRuZrlhUK90c2PebKa+zBLWAd6RLOg2maFCEFR5/fK
 7avpX0APnbPW20EHQca2zlvWd6CBoTyoCu7cm0Cl4jpEOA0G0ybXk6Qv8x2xrvEGDlcS
 ZT11QxC8i7nMUlXlSpZlMVJNNUfOkvw3CFK9I3W4Uw2/fPy1UwO1NK77loiK0Zx5E6ht
 PT5rZ9nom1s0qWcuJvp51oztDnphJDjpcDSjJdXVcNLdEEop+YbBagbyFEscq0fwPqBQ
 3skAu7FCvEVQlwag2cLmbVuRqJgPy90lqriKrnFoqIxY3FUgoYbIawOx3BpDsMfehO1P
 thHg==
X-Gm-Message-State: ACrzQf0kTmsRnzKnxDtAKb1/Dc7WBlDx4tzQMTzIrX+8pVSPqbI0ZGqi
 b9KxXK1gERpqrmlbJy3anXicpw==
X-Google-Smtp-Source: AMsMyM6WelGrs0W65x7NDo18eVH5IHv5aoBArcifU+8Xdkt9zsXkV+YgHzC7srp6z45g4OGNPQCqQw==
X-Received: by 2002:adf:eec3:0:b0:22a:d159:456c with SMTP id
 a3-20020adfeec3000000b0022ad159456cmr1895699wrp.463.1663245740879; 
 Thu, 15 Sep 2022 05:42:20 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
 by smtp.gmail.com with ESMTPSA id
 ay29-20020a05600c1e1d00b003b4ac05a8a4sm2783145wmb.27.2022.09.15.05.42.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Sep 2022 05:42:20 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: vkoul@kernel.org
Subject: [PATCH] soundwire: qcom: update status from device id 1
Date: Thu, 15 Sep 2022 13:42:15 +0100
Message-Id: <20220915124215.13703-1-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
 pierre-louis.bossart@linux.intel.com, linux-kernel@vger.kernel.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, sanyog.r.kale@intel.com,
 yung-chuan.liao@linux.intel.com, quic_srivasam@quicinc.com
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

By default autoenumeration is enabled on QCom SoundWire controller
which means the core should not be dealing with device 0 w.r.t enumeration.
Currently device 0 status is also shared with SoundWire core which confuses
the core sometimes and we endup adding 0:0:0:0 slave device.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 drivers/soundwire/qcom.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
index e21a3306bf01..871e4d8b32c7 100644
--- a/drivers/soundwire/qcom.c
+++ b/drivers/soundwire/qcom.c
@@ -428,7 +428,7 @@ static int qcom_swrm_get_alert_slave_dev_num(struct qcom_swrm_ctrl *ctrl)
 
 	ctrl->reg_read(ctrl, SWRM_MCP_SLV_STATUS, &val);
 
-	for (dev_num = 0; dev_num <= SDW_MAX_DEVICES; dev_num++) {
+	for (dev_num = 1; dev_num <= SDW_MAX_DEVICES; dev_num++) {
 		status = (val >> (dev_num * SWRM_MCP_SLV_STATUS_SZ));
 
 		if ((status & SWRM_MCP_SLV_STATUS_MASK) == SDW_SLAVE_ALERT) {
@@ -448,7 +448,7 @@ static void qcom_swrm_get_device_status(struct qcom_swrm_ctrl *ctrl)
 	ctrl->reg_read(ctrl, SWRM_MCP_SLV_STATUS, &val);
 	ctrl->slave_status = val;
 
-	for (i = 0; i <= SDW_MAX_DEVICES; i++) {
+	for (i = 1; i <= SDW_MAX_DEVICES; i++) {
 		u32 s;
 
 		s = (val >> (i * 2));
-- 
2.21.0

