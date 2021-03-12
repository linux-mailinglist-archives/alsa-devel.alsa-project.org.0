Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 692C2338CA6
	for <lists+alsa-devel@lfdr.de>; Fri, 12 Mar 2021 13:24:53 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8D75A1721;
	Fri, 12 Mar 2021 13:24:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8D75A1721
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615551892;
	bh=v/SDfa6ginKrWw/j78RNJZYzGMTLH71bUYSKM//4Zmc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PI1vflnZSfJyp/93AqsvUXYLKyD/ch6cK2ci+O08izyeVU/lRxm0F6I08piXOHgH3
	 omfs4xak/6kbVOu5iEmBNkhbAZEWOQAxZMDnuCdIY8IZXyz+N1QjTpHgSF0dP0Bo9R
	 6QnDdidmS0yJNXkCCrpdo+CW/3cvWgntuf1J1aBM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5763FF800BF;
	Fri, 12 Mar 2021 13:23:12 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0CADEF8020D; Fri, 12 Mar 2021 13:23:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 11E6AF8012A
 for <alsa-devel@alsa-project.org>; Fri, 12 Mar 2021 13:23:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 11E6AF8012A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="ylWoX9xU"
Received: by mail-wr1-x42f.google.com with SMTP id d15so4695007wrv.5
 for <alsa-devel@alsa-project.org>; Fri, 12 Mar 2021 04:23:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZdZJGNP62lIlEnEmG/cCC95BLhByXorN62IvToLdpl4=;
 b=ylWoX9xUNZ8xM+1HGI2ImLh8mOmk1MiOPYZg1P7v+ETDVLVHX9F80XJcdSoCzTBImJ
 tCl38ELjaOK5iwx6nSQQPT7VslSzPgOOrQFPioqLi3t0PxDz7up1bLTv8Q7cVjv8rx+d
 JQ9DXuka8FoHix/r977MhlIq90uFd70y1D5s3DPL2mw3VpHaN5NuI62SauLnwGXb9u8h
 h/JyFg6TGGNyNLMXhkBHKISbJ2s6Hgy9YXEpeqXjFqZep2C8mb4H+IiC+GjWptsjhf0i
 qEHU6URAL24+N9BqJbAOt+9m7QBP7hgOZUvQKGJ1+cTHPsYZkT2Wo+nLouh0OufzcAKw
 CvEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZdZJGNP62lIlEnEmG/cCC95BLhByXorN62IvToLdpl4=;
 b=iWOrw1JOWWsAj+A/9bxKsi4wVu4XKy3n7ceanN3GgN3sArnciU5bnziJQx9xMtO4wj
 c0vtql7P/IctllqIMjoZT1IN7x6k/J9gydThOmC1Ea0BFswmwaXzGdSm0tApI3y2/L5e
 633okTKQKSCruFVuCjavTBAFadJXziJOYNHIcK6NWdNqbjRFh9HAm/cdGkA4qwgiLbHU
 VQ1KpSE6yOWEmj93V+xnTsxtDpHZaBhl8te5BffaMVIfeLD4fqdf33EoELqqod8AhjUw
 DJOx6B5h0A2qaeks73Dtt/vK7Bm3EUwKKzdYYPW2WX6e4NFseO9EuOMMJhMlHHLO5keJ
 /LdQ==
X-Gm-Message-State: AOAM5300EVFUVfYQv8+TKz717TsxhbKPvP5RZfNy1Z+7nkbFjUvWttlx
 HupB6vHeptdUdpGCA9QgdjlKVw==
X-Google-Smtp-Source: ABdhPJzq5ypNFpODDNGdzsu4umFpPzVXaC7hruw4FFz9uUJRLwBTkvMcogwpaVsOC6QKmGEhCz87Jg==
X-Received: by 2002:adf:e603:: with SMTP id p3mr13900719wrm.360.1615551780146; 
 Fri, 12 Mar 2021 04:23:00 -0800 (PST)
Received: from srini-hackbox.lan
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.gmail.com with ESMTPSA id 3sm8804329wry.72.2021.03.12.04.22.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Mar 2021 04:22:59 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org,
	vkoul@kernel.org
Subject: [RESEND PATCH v3 2/5] soundwire: qcom: update port map allocation bit
 mask
Date: Fri, 12 Mar 2021 12:22:52 +0000
Message-Id: <20210312122255.3143-3-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20210312122255.3143-1-srinivas.kandagatla@linaro.org>
References: <20210312122255.3143-1-srinivas.kandagatla@linaro.org>
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

