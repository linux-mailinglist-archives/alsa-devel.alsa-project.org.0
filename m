Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DC81F33C2CF
	for <lists+alsa-devel@lfdr.de>; Mon, 15 Mar 2021 17:58:53 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F0D5D17D2;
	Mon, 15 Mar 2021 17:58:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F0D5D17D2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615827533;
	bh=5JD/u/4SLVoGXkLrtm1/02PRSaR/nq5DKcsd+dLbtzA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=uHG+jGyopK8No/AcHCw/YEnfnuDfurxAqFl///pQII+ZnBJFaUqmqqBCof88jR6bh
	 bVCoaPCBNuRJjVJnEH+Os4/Q7B0P29hLEM10zKzNDnV82AjFqA3SnBmkjGtmDw8qYA
	 ejGREVIpK1wP0SM/8G++hz2z0iGGYYlDzlcbfS00=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E5872F8021C;
	Mon, 15 Mar 2021 17:57:13 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BFC06F802DB; Mon, 15 Mar 2021 17:57:09 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 27150F80163
 for <alsa-devel@alsa-project.org>; Mon, 15 Mar 2021 17:56:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 27150F80163
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="KRguXn6v"
Received: by mail-wm1-x332.google.com with SMTP id
 u5-20020a7bcb050000b029010e9316b9d5so16918722wmj.2
 for <alsa-devel@alsa-project.org>; Mon, 15 Mar 2021 09:56:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6S4oc3H/pGD3ohc32wC+7IuRuvb/2oR7Yf16M/iJXA4=;
 b=KRguXn6v6qWoSKXlekTUoqzfznIkwnBZk388f10HNP0qDrHICvrjYs9zpA07T0bvJ6
 89p0lDFhapxhLq1535ZPsd2sRtkAxs27G7nMs/FG6YuNWkgR0+VqnhrfySnK9UgW10RV
 fzA+ELnQbNMT7oRP2BAxF28RzZvEW9GiV/zfv/HknWeAZIVLX+tFy9nDrtWp+P/xcZ74
 ITZhRtK78sLj79myS0GaSIuMBHRpkGNs8c+986iaYdGRrrbx47xaW9AmypyaZj2E5yQH
 nsXob37tOIjHrOj4r9z4JUg9BuI+1+WG9YAQcehdTgao+qff7BeQ2C1GjGUel2pbzgNb
 o9vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6S4oc3H/pGD3ohc32wC+7IuRuvb/2oR7Yf16M/iJXA4=;
 b=dXEDh8GXkIamjL12MAaVXuqkeQkPGKyUD8mPwlqIZe7RjICw5anpX/wh9X6c0m8Amk
 3bEaGwwTMVmFypT3+Fq+VDLc5tT5m1PtTWjPsmiXNZJ370Qrd6SXIVgczJX1beK90Ko8
 bIQRvmc+wZU0X0q8ibiBx0k2eI/7jk22pE7qa70XwhyDr5Tcbsp05ALDck4CZliAfR31
 yIrp4+JrbXh/YisSowLwWMny6GKwWRkSSeHCQxppv+p27QlWBEwHprq4eHW9GRN1rPf5
 bPp/faT7cFEzJnnQSYyQg6M8r3ev8D8LRTxN42X+eXW1lNmO6l4RZCctZAwIoYbCGQon
 Q4gA==
X-Gm-Message-State: AOAM533dJ3sPtx9aOh9/JfxWsMqfHSswzFfcWKpGAE2Fl9tf9qPknKpK
 CXimezCg4EV3HkCoUfZvHv5iAA==
X-Google-Smtp-Source: ABdhPJwXtGhmGiGVxZL0Drm9x4U7zWV7DUR7M38RjkULKnSi/Ner2wIN08tGO2oYc6gp3Di4umW4iQ==
X-Received: by 2002:a1c:c904:: with SMTP id f4mr647858wmb.14.1615827417008;
 Mon, 15 Mar 2021 09:56:57 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.gmail.com with ESMTPSA id o2sm227656wmc.23.2021.03.15.09.56.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Mar 2021 09:56:56 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org,
	vkoul@kernel.org
Subject: [PATCH v4 3/5] soundwire: qcom: add static port map support
Date: Mon, 15 Mar 2021 16:56:48 +0000
Message-Id: <20210315165650.13392-4-srinivas.kandagatla@linaro.org>
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

SoundWire device ports are statically mapped to Controller ports during
design. Add support to read these from SoundWire devices.
This controller uses static port map info to setup bandwidth
parameters for those ports.

A generic port allocation is not possible in this cases!

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 drivers/soundwire/qcom.c | 20 ++++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
index 9e70c53e2c7b..39222b04a2e0 100644
--- a/drivers/soundwire/qcom.c
+++ b/drivers/soundwire/qcom.c
@@ -460,6 +460,8 @@ static int qcom_swrm_compute_params(struct sdw_bus *bus)
 	struct sdw_slave_runtime *s_rt;
 	struct sdw_port_runtime *p_rt;
 	struct qcom_swrm_port_config *pcfg;
+	struct sdw_slave *slave;
+	unsigned int m_port;
 	int i = 0;
 
 	list_for_each_entry(m_rt, &bus->m_rt_list, bus_node) {
@@ -473,8 +475,14 @@ static int qcom_swrm_compute_params(struct sdw_bus *bus)
 		}
 
 		list_for_each_entry(s_rt, &m_rt->slave_rt_list, m_rt_node) {
+			slave = s_rt->slave;
 			list_for_each_entry(p_rt, &s_rt->port_list, port_node) {
-				pcfg = &ctrl->pconfig[i];
+				m_port = slave->m_port_map[p_rt->num];
+				/* port config starts at offset 0 so -1 from actual port number */
+				if (m_port)
+					pcfg = &ctrl->pconfig[m_port - 1];
+				else
+					pcfg = &ctrl->pconfig[i];
 				p_rt->transport_params.port_num = p_rt->num;
 				p_rt->transport_params.sample_interval =
 					pcfg->si + 1;
@@ -535,8 +543,10 @@ static int qcom_swrm_stream_alloc_ports(struct qcom_swrm_ctrl *ctrl,
 	struct sdw_master_runtime *m_rt;
 	struct sdw_slave_runtime *s_rt;
 	struct sdw_port_runtime *p_rt;
+	struct sdw_slave *slave;
 	unsigned long *port_mask;
 	int i, maxport, pn, nports = 0, ret = 0;
+	unsigned int m_port;
 
 	mutex_lock(&ctrl->port_lock);
 	list_for_each_entry(m_rt, &stream->master_list, stream_node) {
@@ -549,9 +559,15 @@ static int qcom_swrm_stream_alloc_ports(struct qcom_swrm_ctrl *ctrl,
 		}
 
 		list_for_each_entry(s_rt, &m_rt->slave_rt_list, m_rt_node) {
+			slave = s_rt->slave;
 			list_for_each_entry(p_rt, &s_rt->port_list, port_node) {
+				m_port = slave->m_port_map[p_rt->num];
 				/* Port numbers start from 1 - 14*/
-				pn = find_first_zero_bit(port_mask, maxport);
+				if (m_port)
+					pn = m_port;
+				else
+					pn = find_first_zero_bit(port_mask, maxport);
+
 				if (pn > maxport) {
 					dev_err(ctrl->dev, "All ports busy\n");
 					ret = -EBUSY;
-- 
2.21.0

