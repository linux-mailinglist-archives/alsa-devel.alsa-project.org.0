Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 80AAE2FD7AE
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Jan 2021 19:03:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B929D1803;
	Wed, 20 Jan 2021 19:02:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B929D1803
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611165813;
	bh=UxQgNCl+yroy3NP5mZr9YW6k+VOM+x3l8gvNSV0XyCw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ghcqH8zYt1SC9xa6eBE7ATxhWZiCQ1Wytl/+ZEwdEgVQd4Z92BgRFnvddlk8QeIJj
	 0W2BUaSyOlQZos6Qo42gmexvsJ6Ug2hHdn/yDXMG/CRSrBsv6RNp1aQ8FOXGiPms+K
	 oRpBqPv+4TGnr5att2AzHiqEUxdAlqWd2IPuIvA4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1260DF804CA;
	Wed, 20 Jan 2021 19:02:00 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3AE7FF802BE; Wed, 20 Jan 2021 19:01:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F2D98F8012C
 for <alsa-devel@alsa-project.org>; Wed, 20 Jan 2021 19:01:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F2D98F8012C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="VSxvdICI"
Received: by mail-wm1-x32e.google.com with SMTP id c124so3593892wma.5
 for <alsa-devel@alsa-project.org>; Wed, 20 Jan 2021 10:01:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5yZ5BO3u6lFnZ9F8UDgKbhKjLGtUQNrjUBzAHGBNeJ0=;
 b=VSxvdICIp48jXqyEITKyru2UcJ9m9c+PJwLnlRlyDflVj1bev2cSqhhoHJWZN/J08F
 PujNT6SeDWCVeWpOph5AePRWcP5Vjv8zMngbkSFGTS35TSU0MVx5/mUipPJ1RouLQNeG
 L50hugDZsMA/Befv5tTE2waM3SmRpqQJoWxAM95TfGGtj/pLQ9NIdCKHkkmIzA+1H7Oh
 TrsydV6uZhIsa5+PGQxDB4yRgT+zx6a5XTINaC50UqwBGIP9N7y5m3L5xssf2TRhxl6H
 bXA1svKxh0o5+Y7Dqhu7A2h4Mw3tX/BoCsI/MnsNEjdfhJt0olw9BOf4WKxfqm6TflJL
 ZcEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5yZ5BO3u6lFnZ9F8UDgKbhKjLGtUQNrjUBzAHGBNeJ0=;
 b=C6ReC+fxi0kDM95WIqgG2n8UJ4YmjVsAotaDSJA8q4m4r+X+2OyaNLivEGQ07SJC7w
 fkcoqOY0o606hX5zCEz/XWnYzm6iUqWmOkdHqBARP1EPTUY2gWW58EZubg0Amq4kple2
 zAUZNDxdU8UddjC2FreakpZVzOksGq/C3T5Ql04783gu5zbr4UE0Y8Rf/gjKR43/Y6yV
 Hk3LbC79AzQepUCOy20FI5e5eH+FCHdHXSSJXwkHPLMTXcnw++sP9gh4SLPwjqajy0/I
 p4/J+uLL9W5prvoPDOhheT6/vSHgpIaCtScm6aqPt50DfT6iITn0DpaYzIqeMizDHQYn
 LmdQ==
X-Gm-Message-State: AOAM530K7gExeeIkRbkyTPfkFdLxRCrgeHTy7n8KLablo+NmhHlSQYBN
 VEKVyZASoz77+31hqTwDyt2Heg==
X-Google-Smtp-Source: ABdhPJz5Y0JvcnhmCsjZZ+kKBCgVdEfttMWHMp7t3aOwOPusy1CsvGlJAMfLnaCstLDe4cxl7J7uDg==
X-Received: by 2002:a1c:7402:: with SMTP id p2mr5364888wmc.43.1611165701757;
 Wed, 20 Jan 2021 10:01:41 -0800 (PST)
Received: from srini-hackbox.lan
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.gmail.com with ESMTPSA id g194sm5267422wme.39.2021.01.20.10.01.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Jan 2021 10:01:41 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: vkoul@kernel.org,
	yung-chuan.liao@linux.intel.com
Subject: [RFC PATCH 2/2] soundwire: qcom: add support for static port mapping
Date: Wed, 20 Jan 2021 18:01:10 +0000
Message-Id: <20210120180110.8357-3-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20210120180110.8357-1-srinivas.kandagatla@linaro.org>
References: <20210120180110.8357-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, gregkh@linuxfoundation.org,
 pierre-louis.bossart@linux.intel.com, linux-kernel@vger.kernel.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, sanyog.r.kale@intel.com
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

On some of Qualcomm SoundWire controller instances ports are statically
mapped based on the functionalities. So add support for such mapping.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 drivers/soundwire/qcom.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
index 6d22df01f354..0641b591037e 100644
--- a/drivers/soundwire/qcom.c
+++ b/drivers/soundwire/qcom.c
@@ -474,7 +474,10 @@ static int qcom_swrm_compute_params(struct sdw_bus *bus)
 
 		list_for_each_entry(s_rt, &m_rt->slave_rt_list, m_rt_node) {
 			list_for_each_entry(p_rt, &s_rt->port_list, port_node) {
-				pcfg = &ctrl->pconfig[i];
+				if (p_rt->is_static_map)
+					pcfg = &ctrl->pconfig[p_rt->mapped_port_num - 1];
+				else
+					pcfg = &ctrl->pconfig[i];
 				p_rt->transport_params.port_num = p_rt->num;
 				p_rt->transport_params.sample_interval =
 					pcfg->si + 1;
@@ -551,7 +554,11 @@ static int qcom_swrm_stream_alloc_ports(struct qcom_swrm_ctrl *ctrl,
 		list_for_each_entry(s_rt, &m_rt->slave_rt_list, m_rt_node) {
 			list_for_each_entry(p_rt, &s_rt->port_list, port_node) {
 				/* Port numbers start from 1 - 14*/
-				pn = find_first_zero_bit(port_mask, maxport);
+				if (p_rt->is_static_map)
+					pn = p_rt->mapped_port_num;
+				else
+					pn = find_first_zero_bit(port_mask, maxport);
+
 				if (pn > (maxport - 1)) {
 					dev_err(ctrl->dev, "All ports busy\n");
 					ret = -EBUSY;
-- 
2.21.0

