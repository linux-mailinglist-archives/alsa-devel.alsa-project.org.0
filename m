Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 81B25351200
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Apr 2021 11:26:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0F6401682;
	Thu,  1 Apr 2021 11:25:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0F6401682
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1617269206;
	bh=6sso+/+DbuVTFZQtsuOuz7PVFdqjbudR+rLsbDAbd6U=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=fcamRr5p6XdNmYYEx0CHxAxkTOwIRW1oDC9b1OtdBbo/eRvJZ/TDcL976pVYn9DWH
	 scd1V6rm8pBkYNmz5MVsZkPBvkGfNyA6IBFHyneOOYIvCos38/7GAsa0gAiAq4vZ1t
	 ee8rmiVizxbPxEDrxFryhKTNIumfIRUF4KSjtWso=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 68D38F8013F;
	Thu,  1 Apr 2021 11:25:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5B83EF8026B; Thu,  1 Apr 2021 11:25:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3AE34F80117
 for <alsa-devel@alsa-project.org>; Thu,  1 Apr 2021 11:24:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3AE34F80117
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="Hcyf8uZ1"
Received: by mail-ej1-x633.google.com with SMTP id w3so1864002ejc.4
 for <alsa-devel@alsa-project.org>; Thu, 01 Apr 2021 02:24:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=oOGfrAjnaHDyy1tyd/ITu7l8d1aLT0q9c434VgRCWEU=;
 b=Hcyf8uZ1S+AbwrUswcBEuo0hbJdidSJ3m55scMsQLn6YgcfRifwgdwX9lFIdR0/EwD
 sGhFr60G2F8wy8HLT6Fq5DhdGsBHMiuPlmytuu7EgzkSuqlo95gnVhKjzr1ar1reXWRy
 zFyQ/s7NNZEF2DY6cBUFD4LsxM57FCe1SKmiy823/oelgR+egUmQIK7uO3UEGLNNyiHV
 y+t6qvzdHTboH9aDRDUNYi0DYZsK6YNoYc5CDjo7AeQwjabpspIEd+IprIQHYt+yPhvS
 WReETkGNvh5uLj8sisd8E9GbdkynxeV6Sz2jOsz2Nxo0HTjfX8ZYuwb52ygiKLE07zbC
 Bj/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=oOGfrAjnaHDyy1tyd/ITu7l8d1aLT0q9c434VgRCWEU=;
 b=aN8tjf+BcbXqnCLBWVH3WkH/hb2lxaqfkRY9a6hcv6hNK2FhIfIliuEPzitK7ga0GH
 uh2a6yitFNN4moXxJGeBg85buUUukPwiX++7Ph2jwvf36arezvYgz+OVrOHhfrlvnhc4
 WeTjzUYYBu8ycB1D4etWC19N3FiKa8L4tTDRJHYRecpDSXuJjBX0TUPucabbOqRVQr14
 h6sYaJZSAu5J7YUotOKj/9Gwp8xRIM6S3nHKA/oDAEqBZDDtGYDma/d7Lu4LnWapiVaA
 3/BS5rIuDro1xANWBYw6R1BtA9NtrMdoUX0vRu8zfq0exyETKD9u+p1fUa+8wzuTnWkq
 EJuw==
X-Gm-Message-State: AOAM5319wKOqKA+KBIZBC6FYKTEUAbYT3l0I66iTYml9h7LStfBEXGxd
 /XSqIbFHr3bROkWdRktInuVIDA==
X-Google-Smtp-Source: ABdhPJzc8mO3rKu0OflJbxXCo6lNYZ1oXBNAu5JQfDr5Rx7+ZGLHFGAQPxX9JPUy+kSv8IfVBWKpyg==
X-Received: by 2002:a17:907:94cc:: with SMTP id
 dn12mr8188592ejc.177.1617269097400; 
 Thu, 01 Apr 2021 02:24:57 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.gmail.com with ESMTPSA id cb17sm3221540edb.10.2021.04.01.02.24.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Apr 2021 02:24:56 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: vkoul@kernel.org
Subject: [PATCH] soundwire: qcom: cleanup internal port config indexing
Date: Thu,  1 Apr 2021 10:24:54 +0100
Message-Id: <20210401092454.21299-1-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: robh@kernel.org, alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 pierre-louis.bossart@linux.intel.com, linux-kernel@vger.kernel.org,
 sanyog.r.kale@intel.com, yung-chuan.liao@linux.intel.com
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

Internally used portconfig array for storing port bandwidth
params starts from offset zero. However port zero is not really
used and we also copy the bus parameters to offset zero.
So basically we endup with a code which has to subtract 1 from port
number to get to port parameters.

This is bit confusing to the reader so, make this bit more obvious by only
copying the parameters to offset 1 instead of zero. This will avoid doing
-1 every time when we try to get port params.

Similar thing has been recently done with din/dout_port_mask.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 drivers/soundwire/qcom.c | 27 ++++++++++++++-------------
 1 file changed, 14 insertions(+), 13 deletions(-)

diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
index 94fd58f9dda3..348d9a46f850 100644
--- a/drivers/soundwire/qcom.c
+++ b/drivers/soundwire/qcom.c
@@ -724,7 +724,7 @@ static int qcom_swrm_transport_params(struct sdw_bus *bus,
 	int reg = SWRM_DP_PORT_CTRL_BANK((params->port_num), bank);
 	int ret;
 
-	pcfg = &ctrl->pconfig[params->port_num - 1];
+	pcfg = &ctrl->pconfig[params->port_num];
 
 	value = pcfg->off1 << SWRM_DP_PORT_CTRL_OFFSET1_SHFT;
 	value |= pcfg->off2 << SWRM_DP_PORT_CTRL_OFFSET2_SHFT;
@@ -811,11 +811,11 @@ static int qcom_swrm_compute_params(struct sdw_bus *bus)
 	struct qcom_swrm_port_config *pcfg;
 	struct sdw_slave *slave;
 	unsigned int m_port;
-	int i = 0;
+	int i = 1;
 
 	list_for_each_entry(m_rt, &bus->m_rt_list, bus_node) {
 		list_for_each_entry(p_rt, &m_rt->port_list, port_node) {
-			pcfg = &ctrl->pconfig[p_rt->num - 1];
+			pcfg = &ctrl->pconfig[p_rt->num];
 			p_rt->transport_params.port_num = p_rt->num;
 			if (pcfg->word_length != SWR_INVALID_PARAM) {
 				sdw_fill_port_params(&p_rt->port_params,
@@ -832,7 +832,7 @@ static int qcom_swrm_compute_params(struct sdw_bus *bus)
 				m_port = slave->m_port_map[p_rt->num];
 				/* port config starts at offset 0 so -1 from actual port number */
 				if (m_port)
-					pcfg = &ctrl->pconfig[m_port - 1];
+					pcfg = &ctrl->pconfig[m_port];
 				else
 					pcfg = &ctrl->pconfig[i];
 				p_rt->transport_params.port_num = p_rt->num;
@@ -1167,15 +1167,16 @@ static int qcom_swrm_get_port_config(struct qcom_swrm_ctrl *ctrl)
 	of_property_read_u8_array(np, "qcom,ports-lane-control", lane_control, nports);
 
 	for (i = 0; i < nports; i++) {
-		ctrl->pconfig[i].si = si[i];
-		ctrl->pconfig[i].off1 = off1[i];
-		ctrl->pconfig[i].off2 = off2[i];
-		ctrl->pconfig[i].bp_mode = bp_mode[i];
-		ctrl->pconfig[i].hstart = hstart[i];
-		ctrl->pconfig[i].hstop = hstop[i];
-		ctrl->pconfig[i].word_length = word_length[i];
-		ctrl->pconfig[i].blk_group_count = blk_group_count[i];
-		ctrl->pconfig[i].lane_control = lane_control[i];
+		/* Valid port number range is from 1-14 */
+		ctrl->pconfig[i + 1].si = si[i];
+		ctrl->pconfig[i + 1].off1 = off1[i];
+		ctrl->pconfig[i + 1].off2 = off2[i];
+		ctrl->pconfig[i + 1].bp_mode = bp_mode[i];
+		ctrl->pconfig[i + 1].hstart = hstart[i];
+		ctrl->pconfig[i + 1].hstop = hstop[i];
+		ctrl->pconfig[i + 1].word_length = word_length[i];
+		ctrl->pconfig[i + 1].blk_group_count = blk_group_count[i];
+		ctrl->pconfig[i + 1].lane_control = lane_control[i];
 	}
 
 	return 0;
-- 
2.21.0

