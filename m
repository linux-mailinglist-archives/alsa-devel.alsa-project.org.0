Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2486B332855
	for <lists+alsa-devel@lfdr.de>; Tue,  9 Mar 2021 15:17:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 224DB1828;
	Tue,  9 Mar 2021 15:16:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 224DB1828
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615299444;
	bh=3fXNYzEoOSjndry0TwBfJ8bkWInpJXUM/uq9GUnTpc4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sbnPkX4YyIhp7VKn8quOE8bJ1NPufXT+UUT1yY9AiJY+FYXBoNYnPtYnVrrGW6hei
	 RvVniykCcmBU8tdX2Bw/zq+VzNLjWgkcdkSx42wH/B0ELrm0lvpHdllMifJKn10jzr
	 n6s7mIeTPUNv5vB33KF3Zd3LGUKIbzsrp2w1wYxI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3A331F80227;
	Tue,  9 Mar 2021 15:15:45 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4232EF8032B; Tue,  9 Mar 2021 15:15:42 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 826B0F8019B
 for <alsa-devel@alsa-project.org>; Tue,  9 Mar 2021 15:15:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 826B0F8019B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="a0wPe4uB"
Received: by mail-wr1-x42a.google.com with SMTP id w11so15889488wrr.10
 for <alsa-devel@alsa-project.org>; Tue, 09 Mar 2021 06:15:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wgYYRBqu2Co/W7gReOySnEqRtjbIxnEiAoNrpCeyOWk=;
 b=a0wPe4uBWNYiKbyGGwI6t+Hkruw1OOcXeqba3zAZBCB60ZCLwoQVYScCa8hzieutsh
 SGoyNyzWoaoR2ms5OzwPFK30f5bn+eZ6nzcSFY6ooQqqXgLOYieELbjHJd4fJqpHZ1zf
 MqMZdPNHQ/1kyYAcbRZKr6mjotlwtICa5A+jl2zKTjF829xKvsI4Om2j6fNLqe8ZptL9
 bK2v9xGsqGCCBzA/eGip5CbVucsRc8W8oD1UvjL7Cf3FW/OKgbGuIi3tAdMpc2v7/lfB
 w1VR4MmEPI3kNqlWuC/T+agMZigWjqZNHid4XGC39rkWjTCam3kLtn67ZnhDLJeXoDQZ
 UIAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wgYYRBqu2Co/W7gReOySnEqRtjbIxnEiAoNrpCeyOWk=;
 b=lbU3I1ziuB4Qk/oiMrk4DX1QNGtxP6hM5LHRyGKMvI1y9P6jpvFLyA/4i4qYelGzq2
 ShyAUmgwAKed2tZrhrmFL+MX+/smtPcMtMmaCD/rq6jtIApggQtbrulS2eD01vBhxFXW
 oh4v38LNEQ/AoxQa+f1EaNoC1Nvwl0rU42bgDpS7HKSli5GBfOkkmeHpBWx+X13Om3Pd
 XJ+Awn5SYkToAxW6nu7pC10Su5XEj2ovjA2rTzDUDTrYgUVZGYl0Bf5YmwkH3WYE97uq
 loB8l0rka/MwjGP5tdhdYhbc2sm0Va8g0xk5f0cJen8SEV11l2k1a+y84YiB+oud+878
 mDqw==
X-Gm-Message-State: AOAM5332aOZSMelQpmTS0MTeV4GMf8udF23PC2rhZ+VYwpSxpA748byj
 SMfMHuX4CEBhysMcbdHRbyzr/A==
X-Google-Smtp-Source: ABdhPJzjx+A4weJ+YoAO37xTieQKrFjnYgWo5WE0uu2XX5PvGFn3BCfRxZNQHen1u/9up4DZtcduhw==
X-Received: by 2002:a05:6000:147:: with SMTP id
 r7mr29046369wrx.25.1615299334635; 
 Tue, 09 Mar 2021 06:15:34 -0800 (PST)
Received: from srini-hackbox.lan
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.gmail.com with ESMTPSA id u20sm28007579wru.6.2021.03.09.06.15.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Mar 2021 06:15:34 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org,
	vkoul@kernel.org
Subject: [PATCH v2 2/5] soundwire: qcom: update port map allocation bit mask
Date: Tue,  9 Mar 2021 14:15:11 +0000
Message-Id: <20210309141514.24744-3-srinivas.kandagatla@linaro.org>
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

currently the internal bitmask used for allocating ports starts with offset 0.
This is bit confusing as data port numbers on Qualcomm controller are valid
from 1 to 14. So adjust this bit mask accordingly, this will also help while
adding static port map support.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 drivers/soundwire/qcom.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
index 6d22df01f354..f4f1c5f2af0b 100644
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
+				if (pn > (maxport)) {
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
+	/* port numbers are non zero, so mark port 0 */
+	set_bit(0, &ctrl->dout_port_mask);
+	set_bit(0, &ctrl->din_port_mask);
 
 	ret = of_property_read_u8_array(np, "qcom,ports-offset1",
 					off1, nports);
-- 
2.21.0

