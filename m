Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 30DFD33C2C4
	for <lists+alsa-devel@lfdr.de>; Mon, 15 Mar 2021 17:58:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A016D17B1;
	Mon, 15 Mar 2021 17:57:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A016D17B1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615827519;
	bh=v/SDfa6ginKrWw/j78RNJZYzGMTLH71bUYSKM//4Zmc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JyvAUbyzBFfkJIN5K1WNOqdY7jqmL6DTVNvIcE5UtbxZ5vx5j+yXkG5HM5N4fPWo3
	 EkXg3Af4cCcLZRMPuLrafyc5NGreh2rrCJ5CF20UT7y8J/+uA0s4zFS8nZ+W78auyd
	 6yWLQuiszzADrm1t5kDI3KaxnFUcBm3JDmN95iO4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1DFEAF80163;
	Mon, 15 Mar 2021 17:57:11 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0948FF80254; Mon, 15 Mar 2021 17:57:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9CCF9F8010E
 for <alsa-devel@alsa-project.org>; Mon, 15 Mar 2021 17:56:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9CCF9F8010E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="WAQzO0mH"
Received: by mail-wm1-x32b.google.com with SMTP id
 n11-20020a05600c4f8bb029010e5cf86347so2611929wmq.1
 for <alsa-devel@alsa-project.org>; Mon, 15 Mar 2021 09:56:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZdZJGNP62lIlEnEmG/cCC95BLhByXorN62IvToLdpl4=;
 b=WAQzO0mHPFAvj8xI6C+JLfJgBcnurW3P3e7LtcjfLvIf+WQJ9obNauAt0jq26jtK76
 OyiyoEK6/MtbMXRt7XjRdOfJdHcAeqCq6igi58b20Juqge1uldi96B7qgd+Q+qFAzpDp
 cv5NKQbh9xv73qG55vroWhwyxUzHUj+xzuSXUNcJDqHlssvr60Je4bnPaVeRebskFXGT
 tU+CQee1BdIR8CdSHwrSxbFv98zZDq0mUWHSwA0QMsp5HXjxlzXpdqOIQ1q514Ee9jAq
 2vbwOuX3taRNxDjolBiT71am2IVNcwP3DfTisGlPnMKTIoUrIk/KcyVIS2loXhcjnM2b
 Qb6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZdZJGNP62lIlEnEmG/cCC95BLhByXorN62IvToLdpl4=;
 b=SIv41Yj8jkq5bI+6QlSn89Nmr7khL53GvRIklZSuRwy4pnNVArWcnU5j+v5PgCFXAy
 tg4cdyMpjj4PDt3FaCGS9bNuUxJr1QLJ8gv1AImL3S8/4QEKSiOFreaLqZse+4NUMZJz
 ZZ6ssKNV4uIb7FHds5nl7b0H3dlPyhxVCcGD+sLr2O91q+PsF9oLbTewHUswt1hxJA3X
 rAdZYuCl958tTOVaa/24rONIcCxQQZ/xyIPT04+Xl2p+I6C8ZKo/gRdQoPvtS9NtfgHd
 ZxYvFBV+tWvXGJYQDIkmB6NItr4aPjHMFBHqmrbX+ysPu6Tvw4pYB+JAqbQijnqvnWtG
 xDIg==
X-Gm-Message-State: AOAM5312fJmSNtZugfeQ7sgL+WpHflYpCADYXOVMnHni/SwhE8FBX5Lf
 jJlA7JU0rHDqn1js5wi7WYA9iA==
X-Google-Smtp-Source: ABdhPJz+BWyXwz0jvNyXMbTMfZ43xKFg0RJhHtzf6kb7SKHhgc0lis02/+Wod6+ttRTzO1PhItkG9w==
X-Received: by 2002:a7b:c195:: with SMTP id y21mr601189wmi.178.1615827415959; 
 Mon, 15 Mar 2021 09:56:55 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.gmail.com with ESMTPSA id o2sm227656wmc.23.2021.03.15.09.56.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Mar 2021 09:56:55 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org,
	vkoul@kernel.org
Subject: [PATCH v4 2/5] soundwire: qcom: update port map allocation bit mask
Date: Mon, 15 Mar 2021 16:56:47 +0000
Message-Id: <20210315165650.13392-3-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20210315165650.13392-1-srinivas.kandagatla@linaro.org>
References: <20210315165650.13392-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: robh@kernel.org, alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 pierre-louis.bossart@linux.intel.com, linux-kernel@vger.kernel.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, sanyog.r.kale@intel.com,
 yung-chuan.liao@linux.intel.com
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

currently the internal bitmask used for allocating ports starts with offset 0.
This is bit confusing as data port numbers on Qualcomm controller are valid
from 1 to 14. So adjust this bit mask accordingly, this will also help while
adding static port map support.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 drivers/soundwire/qcom.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
index 6d22df01f354..9e70c53e2c7b 100644
--- a/drivers/soundwire/qcom.c
+++ b/drivers/soundwire/qcom.c
@@ -519,7 +519,7 @@ static void qcom_swrm_stream_free_ports(struct qcom_swrm_ctrl *ctrl,
 			port_mask = &ctrl->din_port_mask;
 
 		list_for_each_entry(p_rt, &m_rt->port_list, port_node)
-			clear_bit(p_rt->num - 1, port_mask);
+			clear_bit(p_rt->num, port_mask);
 	}
 
 	mutex_unlock(&ctrl->port_lock);
@@ -552,13 +552,13 @@ static int qcom_swrm_stream_alloc_ports(struct qcom_swrm_ctrl *ctrl,
 			list_for_each_entry(p_rt, &s_rt->port_list, port_node) {
 				/* Port numbers start from 1 - 14*/
 				pn = find_first_zero_bit(port_mask, maxport);
-				if (pn > (maxport - 1)) {
+				if (pn > maxport) {
 					dev_err(ctrl->dev, "All ports busy\n");
 					ret = -EBUSY;
 					goto err;
 				}
 				set_bit(pn, port_mask);
-				pconfig[nports].num = pn + 1;
+				pconfig[nports].num = pn;
 				pconfig[nports].ch_mask = p_rt->ch_mask;
 				nports++;
 			}
@@ -580,7 +580,7 @@ static int qcom_swrm_stream_alloc_ports(struct qcom_swrm_ctrl *ctrl,
 err:
 	if (ret) {
 		for (i = 0; i < nports; i++)
-			clear_bit(pconfig[i].num - 1, port_mask);
+			clear_bit(pconfig[i].num, port_mask);
 	}
 
 	mutex_unlock(&ctrl->port_lock);
@@ -754,6 +754,9 @@ static int qcom_swrm_get_port_config(struct qcom_swrm_ctrl *ctrl)
 	ctrl->num_dout_ports = val;
 
 	nports = ctrl->num_dout_ports + ctrl->num_din_ports;
+	/* Valid port numbers are from 1-14, so mask out port 0 explicitly */
+	set_bit(0, &ctrl->dout_port_mask);
+	set_bit(0, &ctrl->din_port_mask);
 
 	ret = of_property_read_u8_array(np, "qcom,ports-offset1",
 					off1, nports);
-- 
2.21.0

