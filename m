Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DAA0C386A9
	for <lists+alsa-devel@lfdr.de>; Fri,  7 Jun 2019 10:59:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6491482B;
	Fri,  7 Jun 2019 10:58:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6491482B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559897977;
	bh=/DLMvMukj9JZt7NPaHd3DCpjmRq0Z7N5aRdGVV2n4gw=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XWvz+sgTaYqbmrXst/hxU2IqnKXjsry51k2qUvWUlwcMzi+y4fK53hSrqg1M6JY++
	 Fe562cjXvAim81acajfnXhOjEi9t+zd6MGuiCwtBXWYuzuG6F/O2uvO14yUUf/y+od
	 Q9mdEKli/viJIjfoK6BK1nuCugvNlYTULbRhxvF8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E5DB2F896CE;
	Fri,  7 Jun 2019 10:57:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 868C9F8972E; Fri,  7 Jun 2019 10:57:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C21D9F896DB
 for <alsa-devel@alsa-project.org>; Fri,  7 Jun 2019 10:57:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C21D9F896DB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="qzcDMMv6"
Received: by mail-wm1-x344.google.com with SMTP id a15so1174612wmj.5
 for <alsa-devel@alsa-project.org>; Fri, 07 Jun 2019 01:57:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KUhboSAFmz5mtk8bqOkf7FrFn2o/dLGKQrpvRYoaznc=;
 b=qzcDMMv6/dC+W88mLNVStn/1exwxI5WCsOypC3gl2r3+gaoDMIOQYEYcuG41mZg4K4
 W1+wDi7jZIIjYFe0bNSdJb8dlG/Hdk64D0lQNdVEqzyU9mQixYMn/sVvGQUgfbOb4OqH
 n96hpVWConp+8aolrBLU5RAXiICd9cEHnv2TAUrcSEaayPHCnj6dJSpJrXjOzMRw5IA0
 mBvyCeu658+xZPj40wPPTfT7en/Xiv5jINsfwExCLe7XtZ4ZG2ApUlR4ftF4W3DT1GzV
 tVPKkImfEiPpV3dHfL4xblmzzRC5VoTyVg0NLYHV3VcSB2vR8W52pxL4AhlnKiak1Hy5
 V9qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KUhboSAFmz5mtk8bqOkf7FrFn2o/dLGKQrpvRYoaznc=;
 b=pKvmYZqZ6f2h/JSnby+Q7weiad7+twZ2Yel+OVKIWZazlEiWn0mPyZWqUAlPnhvb6V
 /Q7OgSsliAff+2uIyxMBlQAO3cZAX/hlLPScXeJ+sX7tGTheplqeqI6OfqPBnIqAKPpR
 FOw8GhBmrnsH0NrEz1gnpTBAODerpgQ3NpLpYQB4kQszNW1st/M2jkkOabee6cKh2pw+
 5BHs+t+3oZqQ7yuON4AMKB9SknN/uxhnVEngkNkIeU7j92neN25WAVfbOOZIA6/DN6X2
 bB/TDKJVX5dhmYH4stOxcdJjJrS/eGByH/HOQ8bKXk4feTphapzyKACV91XQRi86QJxy
 IQ3Q==
X-Gm-Message-State: APjAAAUCzhEMvX2WP+vf1YJDR9TWk9JmrXWsULdk/5jmAWD2BBiA1u4v
 a1LWUFLjOVuaPv6rfBmelFkuuBEx9XA1yQ==
X-Google-Smtp-Source: APXvYqzJ0U31BGjMNzkX8zVESpp3QIDFY+q4gJbhCTHx2fmvyIfqZREqJHenhK+kiiD0Nec89G7cWA==
X-Received: by 2002:a1c:9a53:: with SMTP id c80mr2627868wme.173.1559897829451; 
 Fri, 07 Jun 2019 01:57:09 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.gmail.com with ESMTPSA id d10sm2035308wrh.91.2019.06.07.01.57.08
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 07 Jun 2019 01:57:08 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org,
	vkoul@kernel.org
Date: Fri,  7 Jun 2019 09:56:39 +0100
Message-Id: <20190607085643.932-3-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190607085643.932-1-srinivas.kandagatla@linaro.org>
References: <20190607085643.932-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [alsa-devel] [RFC PATCH 2/6] soundwire: Add compute_params callback
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Vinod Koul <vkoul@kernel.org>

This callback allows masters to compute the bus parameters required.

Signed-off-by: Vinod Koul <vkoul@kernel.org>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 drivers/soundwire/stream.c    | 9 +++++++++
 include/linux/soundwire/sdw.h | 2 ++
 2 files changed, 11 insertions(+)

diff --git a/drivers/soundwire/stream.c b/drivers/soundwire/stream.c
index 73c52cd4fec8..b86992145799 100644
--- a/drivers/soundwire/stream.c
+++ b/drivers/soundwire/stream.c
@@ -1485,6 +1485,15 @@ static int _sdw_prepare_stream(struct sdw_stream_runtime *stream)
 		bus->params.bandwidth += m_rt->stream->params.rate *
 			m_rt->ch_count * m_rt->stream->params.bps;
 
+		/* Compute params */
+		if (bus->compute_params) {
+			ret = bus->compute_params(bus);
+			if (ret < 0) {
+				dev_err(bus->dev, "Compute params failed: %d", ret);
+				return ret;
+			}
+		}
+
 		/* Program params */
 		ret = sdw_program_params(bus);
 		if (ret < 0) {
diff --git a/include/linux/soundwire/sdw.h b/include/linux/soundwire/sdw.h
index bea46bd8b6ce..aac68e879fae 100644
--- a/include/linux/soundwire/sdw.h
+++ b/include/linux/soundwire/sdw.h
@@ -718,6 +718,7 @@ struct sdw_master_ops {
  * Bit set implies used number, bit clear implies unused number.
  * @bus_lock: bus lock
  * @msg_lock: message lock
+ * @compute_params: points to Bus resource management implementation
  * @ops: Master callback ops
  * @port_ops: Master port callback ops
  * @params: Current bus parameters
@@ -739,6 +740,7 @@ struct sdw_bus {
 	DECLARE_BITMAP(assigned, SDW_MAX_DEVICES);
 	struct mutex bus_lock;
 	struct mutex msg_lock;
+	int (*compute_params)(struct sdw_bus *bus);
 	const struct sdw_master_ops *ops;
 	const struct sdw_master_port_ops *port_ops;
 	struct sdw_bus_params params;
-- 
2.21.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
