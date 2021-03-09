Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F493332857
	for <lists+alsa-devel@lfdr.de>; Tue,  9 Mar 2021 15:18:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0CCE21831;
	Tue,  9 Mar 2021 15:17:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0CCE21831
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615299483;
	bh=TtTybt5mWETWGuJ4S0X8elkxb6fzO/3aGt+xRMnAw6M=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kMaPEGF8NJvOKuk9+dDQ6wGDe6n0Pl67OnwzjdqvY+ONsZeog+R2LRWJi793F35J5
	 w9UZmZEWG82if4lmAu6PKkEo4IOT7mnwPcRUR7MYYyQGsyeaZ+RPrN7/lDAymgFo/w
	 4mGtxiMOekVhv9YPTD8aJDDhVXK19ntEspgE+mcU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 35D04F8032C;
	Tue,  9 Mar 2021 15:15:47 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A1E27F80275; Tue,  9 Mar 2021 15:15:43 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 92C1FF80256
 for <alsa-devel@alsa-project.org>; Tue,  9 Mar 2021 15:15:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 92C1FF80256
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="VS6jbPEB"
Received: by mail-wr1-x435.google.com with SMTP id b18so15885793wrn.6
 for <alsa-devel@alsa-project.org>; Tue, 09 Mar 2021 06:15:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Ol6OkkC2nUnq8Y6A1v6xDdX14ho/H0K1X/8pX5FNFEo=;
 b=VS6jbPEBrW4C2FdnvkFOBPnTbV0uD/pIpsf1p+n3Eh2OqdKgSICyT5VXU2/IdSZ54f
 rYdTXRYRRhuhJW1X9+bIjk5EWynJCtJuAPkTRePPYK3v8FhgGgy4BKP1cCn3H05ioo2p
 1Xj/fZ17Br0/nUqpmPVkF0aSGAuGGKFc2WURtEbIaX+4yUH4hTBU5hYI0RC/KswRDXtP
 MsOPTqai2Vs4P/+xxasDuCQ7I2OZMSLjbaSQgzWqAczd/0nthktjo1z7mnwBqSceG7E1
 hWLAz4kdK8sieuhZtotcsL0XWJHXHUvofCpP4qNHXJQwqinUFddQ3oe5c/mF2kdYusSu
 or2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ol6OkkC2nUnq8Y6A1v6xDdX14ho/H0K1X/8pX5FNFEo=;
 b=FwMRQXD1rTnIpXicN2ekaipxyfpyC7XvPYZAAgdM+9kC5xZpQdUYot4V05jTuc6tch
 bsQb2tbYg9mnxPensanP8VMmLlQqk7lcx/h1FBmkHfCp8WeE20wKGSrgig/Lu9skTEs8
 W8lFvnLOmIAaMhNSNpS8l9Wsib3IxiTvLo/ABfAHwVVcMD/O0QYDv4uLJ831VquK9OqV
 WCMPp6StcdW1o2bAH7VDu+bMW2TurftiOrtt7qZtKs2+0bzBTzTo7pZirTSk9LKaxM7y
 Fm7p4vS7oXnhFf+7lCSyD3FVvifnqL4FSOUrk/NPOjMDW8cO1RMX/VAQ8fLQpuXitoeV
 c1Ig==
X-Gm-Message-State: AOAM532DwjgxPak7/bg59jGp/2ihul1gvjgpU9nS615s+0m9IM+YlEBB
 WoQqx8o2B0+NVsy0vBO69hipbA==
X-Google-Smtp-Source: ABdhPJyzj+WdvbxrL2gu0kgNza2MM26l6kL+4JccrryB4WRTmzZ/qKQ7QIr0Pnu6eykx/GUjTnNYDQ==
X-Received: by 2002:adf:f292:: with SMTP id k18mr28854329wro.335.1615299335594; 
 Tue, 09 Mar 2021 06:15:35 -0800 (PST)
Received: from srini-hackbox.lan
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.gmail.com with ESMTPSA id u20sm28007579wru.6.2021.03.09.06.15.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Mar 2021 06:15:35 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org,
	vkoul@kernel.org
Subject: [PATCH v2 3/5] soundwire: qcom: add static port map support
Date: Tue,  9 Mar 2021 14:15:12 +0000
Message-Id: <20210309141514.24744-4-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20210309141514.24744-1-srinivas.kandagatla@linaro.org>
References: <20210309141514.24744-1-srinivas.kandagatla@linaro.org>
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
 drivers/soundwire/qcom.c | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
index f4f1c5f2af0b..b4d1aaf535c5 100644
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
@@ -473,8 +475,13 @@ static int qcom_swrm_compute_params(struct sdw_bus *bus)
 		}
 
 		list_for_each_entry(s_rt, &m_rt->slave_rt_list, m_rt_node) {
+			slave = s_rt->slave;
 			list_for_each_entry(p_rt, &s_rt->port_list, port_node) {
-				pcfg = &ctrl->pconfig[i];
+				m_port = slave->m_port_map[p_rt->num - 1];
+				if (m_port)
+					pcfg = &ctrl->pconfig[m_port - 1];
+				else
+					pcfg = &ctrl->pconfig[i];
 				p_rt->transport_params.port_num = p_rt->num;
 				p_rt->transport_params.sample_interval =
 					pcfg->si + 1;
@@ -535,8 +542,10 @@ static int qcom_swrm_stream_alloc_ports(struct qcom_swrm_ctrl *ctrl,
 	struct sdw_master_runtime *m_rt;
 	struct sdw_slave_runtime *s_rt;
 	struct sdw_port_runtime *p_rt;
+	struct sdw_slave *slave;
 	unsigned long *port_mask;
 	int i, maxport, pn, nports = 0, ret = 0;
+	unsigned int m_port;
 
 	mutex_lock(&ctrl->port_lock);
 	list_for_each_entry(m_rt, &stream->master_list, stream_node) {
@@ -549,9 +558,15 @@ static int qcom_swrm_stream_alloc_ports(struct qcom_swrm_ctrl *ctrl,
 		}
 
 		list_for_each_entry(s_rt, &m_rt->slave_rt_list, m_rt_node) {
+			slave = s_rt->slave;
 			list_for_each_entry(p_rt, &s_rt->port_list, port_node) {
+				m_port = slave->m_port_map[p_rt->num - 1];
 				/* Port numbers start from 1 - 14*/
-				pn = find_first_zero_bit(port_mask, maxport);
+				if (m_port)
+					pn = m_port;
+				else
+					pn = find_first_zero_bit(port_mask, maxport);
+
 				if (pn > (maxport)) {
 					dev_err(ctrl->dev, "All ports busy\n");
 					ret = -EBUSY;
-- 
2.21.0

