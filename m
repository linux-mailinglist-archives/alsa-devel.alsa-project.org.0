Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C972B338CE7
	for <lists+alsa-devel@lfdr.de>; Fri, 12 Mar 2021 13:26:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 59C411715;
	Fri, 12 Mar 2021 13:25:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 59C411715
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615551986;
	bh=5JD/u/4SLVoGXkLrtm1/02PRSaR/nq5DKcsd+dLbtzA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=POTB6EBbTkfP6omVYuWOICibxRA79GQDJlhrJYK1bmnIyTouluDS0cOBm98cKtLlJ
	 7X4R8tIPAwH3lRfh3lKtkWYocE3DCJu1sb46K0ygpRMX+zKV3MSayP69s+GRptNa8w
	 SqIy9xufdm38feAQLKbCcQEcKFShhtWBzee2Cp0o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F08FCF804A9;
	Fri, 12 Mar 2021 13:23:18 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A5517F8032D; Fri, 12 Mar 2021 13:23:14 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 520CAF80272
 for <alsa-devel@alsa-project.org>; Fri, 12 Mar 2021 13:23:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 520CAF80272
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="YRawz45L"
Received: by mail-wr1-x42a.google.com with SMTP id j7so1665718wrd.1
 for <alsa-devel@alsa-project.org>; Fri, 12 Mar 2021 04:23:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6S4oc3H/pGD3ohc32wC+7IuRuvb/2oR7Yf16M/iJXA4=;
 b=YRawz45LNtttk3HenoCONJFDTNNca+FzdessU2tg+yt1grzPilMT9kL/9Wh3yC/Ofe
 wpOC52qJcJSsHIbRBC4+CK/MUpraS78G8Ow2jtKaV6LjUWo7gzq535HIjhIhACv0A1z0
 U1VOs3A7KyrcGJdKpckT/As/AEtmgme9cg3AZ0NP6p2RJyjfT8YhtxLLne7UPuHC0cpC
 4MTVhMV+u6t7vPSVkCsHnjmVnsLMrgJIZUwsC5lXoVBQ0o/vjJu8dH3AGjtq2b0f9acM
 OiB4MkB2fPA6b/pl8NlLc2CNvMqZ/Cwi+ObLOWxvt3zwPL0+CWqRUCzBkDLYtqqQxXz7
 uyHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6S4oc3H/pGD3ohc32wC+7IuRuvb/2oR7Yf16M/iJXA4=;
 b=NtxmAPBSLYXOXBPu2nQNSe3aIMarYFlsvQqzCIRy3HCP4rSTX7xZoeHOqRibtmeSBo
 8Af4cSIy7PDWCuOoKFNKJrhc+fr7tJ8rcbTiJ3yWvo0v9qFnL5DA2D1D6g8tL9s1nwVv
 sGWL4E7qC4+U1JM73WREAqAU0IUVHT6CwzEw61bxCD0LfLLStC4Im8ceN5+9cAhYY9iN
 eFFHZD0ImjTuzoGgTVSHkFRA4gCAAJIkZc3Y+154r+rHYJfyl3ux7Q/1GKAcDdvtlVuD
 IeWRW+lBIRegHmeZUvx+XxmDaU/UderRE52DruzX7eWJx3cqMuKcIMZDG5lQfNc76FGv
 WScQ==
X-Gm-Message-State: AOAM531QZJeNZfxthbg/6s+5fhEJLeg1gyZzSfkalV0Vz3lwaNNxEwRL
 U5SKa0rjeylEtwoS5Cz5lNSOZgw4V/77gQ==
X-Google-Smtp-Source: ABdhPJyECcjI4bJaeKB5525lkzQWeGSZ7fhUMb/PSBwvy9RH+lOuu9IO1s7CygCdkUXDA58e6AU/kw==
X-Received: by 2002:a05:6000:2aa:: with SMTP id
 l10mr13737171wry.368.1615551781175; 
 Fri, 12 Mar 2021 04:23:01 -0800 (PST)
Received: from srini-hackbox.lan
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.gmail.com with ESMTPSA id 3sm8804329wry.72.2021.03.12.04.23.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Mar 2021 04:23:00 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org,
	vkoul@kernel.org
Subject: [RESEND PATCH v3 3/5] soundwire: qcom: add static port map support
Date: Fri, 12 Mar 2021 12:22:53 +0000
Message-Id: <20210312122255.3143-4-srinivas.kandagatla@linaro.org>
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

