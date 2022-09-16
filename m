Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 251BC5BAEA5
	for <lists+alsa-devel@lfdr.de>; Fri, 16 Sep 2022 15:55:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A05141A73;
	Fri, 16 Sep 2022 15:54:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A05141A73
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663336502;
	bh=LcJoDOXfVKTXqw1pySO6ThoYivXbaJAXW1+AP8R0Gww=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=R/1ksbD3vos3jXh/KuC758+A2ORl3Gj9CMP8mZwik7Rho/g0PtsOscaaDqwLQ+oWb
	 uzY11elSI00FfDUu21teTc7CzH5Uktflf2J/0fssGnPY41mIG27V10fajwHZBMNvBx
	 bAmfaanmpacNtJPy9sE7A2Oxaov6YLhMRzJBIgdA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 00902F8024C;
	Fri, 16 Sep 2022 15:54:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 14B3DF80496; Fri, 16 Sep 2022 15:54:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BE93DF800E5
 for <alsa-devel@alsa-project.org>; Fri, 16 Sep 2022 15:53:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BE93DF800E5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="JBQnB7TW"
Received: by mail-wm1-x333.google.com with SMTP id
 r5-20020a1c4405000000b003b494ffc00bso1236964wma.0
 for <alsa-devel@alsa-project.org>; Fri, 16 Sep 2022 06:53:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=VyGv9vQBQ1xkHEaxOJIptX4tbCMnxfIpZYjINCvRYgM=;
 b=JBQnB7TWIBIwF9Lw0s2MP3HKz7duEZi8DDiZEqmm+5O2d1a/3PccKRGMefwnZK4hxA
 grI6/ptDhYWBbo/8uMXmoV2+CXV0EofMC8LM5thFf1r0ne0yr5Gxr0SK+8E02t7Yb/Zf
 zo0NSapqKJ/Ogy6YFSCpoVYXspbPulPf8bEWe+wpOCpmpbMCT6AuoEfECm3RNwTu/VFX
 pql62QumkOU8VuOlvi5H2U9d1MsP7tBOayQJSKcaHJETs81nzH3rDHyf8sER7DOMlHxR
 GiB4/M3s4fS6cGCKA5n4bpujXgaYrIlGPdjbD3yMTHuao0oxR+fTE8adsTEutK1uRZ9S
 2BSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=VyGv9vQBQ1xkHEaxOJIptX4tbCMnxfIpZYjINCvRYgM=;
 b=yYWCUlKLtDZvb7dmb9znbtZs5WlC59OMgi7imtIl5kd4DYLj/57u2SUN+pH7KTcvTn
 7R2gOH55cJTR5/xocWN/jmcmCmYmw804g84yl7swhU5If68iKXFiBhcD5OL8ojHZ1gp6
 fbVNisO5zNIjLP3sI5CsoKK/HjJpNu5ePW8VpCRDoZvpJgEzbrIQpqAxYzX2CJncBBQS
 8iNaWaBRAz0hJqHU0JExnUBFu4oAxObSIvZsKvRnghn0Yol4c997EApgXFIUVNLmvDBU
 pHkz4lhOSsMde4wA45DC3TxMkVUAOYYGZAp0FqzExDo0/vGNIHQzPEOu/NTc4ZLEMuK9
 4BUA==
X-Gm-Message-State: ACrzQf0YlHUba4F/Pvy+6yr3247w5TIUIk75YWTRQF+2hoXh6A+HKFMF
 3AxM1HJPtgsue/kGuSslTyyBJQ==
X-Google-Smtp-Source: AMsMyM5F1iDDMpOc25/B4rrtE9piDv1R7mtcHiPz7EsAWBn3EJ3+mS9oezISk77bPzq6/GOb+nAodA==
X-Received: by 2002:a05:600c:114f:b0:3b4:9a0a:6204 with SMTP id
 z15-20020a05600c114f00b003b49a0a6204mr3490349wmz.132.1663336434900; 
 Fri, 16 Sep 2022 06:53:54 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
 by smtp.gmail.com with ESMTPSA id
 m2-20020a7bce02000000b003b483000583sm2084767wmc.48.2022.09.16.06.53.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Sep 2022 06:53:54 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: vkoul@kernel.org
Subject: [PATCH v2 1/2] soundwire: qcom: update status from device id 1
Date: Fri, 16 Sep 2022 14:53:51 +0100
Message-Id: <20220916135352.19114-1-srinivas.kandagatla@linaro.org>
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

During Enumeration if SoundWire core sees status[0] as SDW_SLAVE_ATTACHED and
start programming the device id, however reading DEVID registers return zeros
which does not match to any of the slaves in the list and the core attempts
to park this device to Group 13.  This results in adding SoundWire device
with enumeration address 0:0:0:0

Fix this by not passing device 0 status to SoundWire core.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
Changes since v1:
	- updated change log and split patch in to two as suggested by Pierre

 drivers/soundwire/qcom.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
index e7f95c41eb70..d3ce580cdeaf 100644
--- a/drivers/soundwire/qcom.c
+++ b/drivers/soundwire/qcom.c
@@ -448,7 +448,7 @@ static void qcom_swrm_get_device_status(struct qcom_swrm_ctrl *ctrl)
 	ctrl->reg_read(ctrl, SWRM_MCP_SLV_STATUS, &val);
 	ctrl->slave_status = val;
 
-	for (i = 0; i <= SDW_MAX_DEVICES; i++) {
+	for (i = 1; i <= SDW_MAX_DEVICES; i++) {
 		u32 s;
 
 		s = (val >> (i * 2));
-- 
2.21.0

