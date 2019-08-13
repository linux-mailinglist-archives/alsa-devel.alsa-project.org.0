Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C9E6D8B2A4
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Aug 2019 10:38:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 54F74166F;
	Tue, 13 Aug 2019 10:37:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 54F74166F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565685512;
	bh=DfgJv6aqQkLthyNvHByFEqT2u3Ats1t9n071RBjGkiM=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cJ34PrhBTKcrDvY7pVJQJJH9yhUUY/0nF+ijwgFdgbskomAvToUb1t+nkdxcN2thG
	 Y/lsaPM20f3ZygmRiOXJsoW7XAedmqc30iG5x5azy3HEMqLDXJBXAuoiDDpXGTxcKd
	 YkjhgBQLji5W6YKzmXyN4LCRpRLHK/C5eRB1jsjA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 62008F80120;
	Tue, 13 Aug 2019 10:36:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 55103F80274; Tue, 13 Aug 2019 10:35:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B8C1CF8015A
 for <alsa-devel@alsa-project.org>; Tue, 13 Aug 2019 10:35:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B8C1CF8015A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="mtkkTc2z"
Received: by mail-wm1-x341.google.com with SMTP id 10so686550wmp.3
 for <alsa-devel@alsa-project.org>; Tue, 13 Aug 2019 01:35:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=47pjUZtlYEQsWYFM2ZKdkX9DO8aXhwyKbVTpMW5dD0M=;
 b=mtkkTc2za4MBew4vaNmst2IsNgchFGrls0sMOvN2UhPHs9lHa2U93xFQ5xAKx0CpfE
 KQlsxsYeHq6f4pzn2C0P8AycDtTJr1i+m6XGHohquv8ndV8JTM3VNYq0pGDIajQ4ipsp
 42RTztSe+QkgPim00XYgEC6UFfNpm4kgA5SN5/Gv4/os+EoUuhFvpQ6y2GZD2cvhh8yB
 dAA3XpTMCufeDzI2CUEuBRrZoFpTGbWzg0gn7m/qLDh/Lezo4c0raD++1ElZhdyecGSP
 v1G+d5N5+NKrl8INbMURU99BWGpg1TderUW+X/jciZtLZSi85m9oImE1ogDDEbMFmepC
 i8Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=47pjUZtlYEQsWYFM2ZKdkX9DO8aXhwyKbVTpMW5dD0M=;
 b=T0W/QPVv7oA4on6Vuk10xEwgDyTFH0TSUhqzBHd/2G6EvBlY6D6xHhWLwvGyH38Rc1
 fYUTOfWGToOOnyfybhwfPc/eVnP/TKhrhI5ayiTdIGoYdh0RRTyuix5illgGDj61Hkm1
 8B4SA8DmRNNhDCxB7aizd9K0QhnqrhrYEudf0tNke61k5Z/8EpxzZKdS08n91pqJI2Te
 slFwA71pR+YnGcajzk2AmK0qEGl+W0eO4XNuEzdStT310jcsGBpIhJtlxhyLg+/y8BMF
 GrmSLn2cR4CuE5Jbb7K7N+dOgEv8UkElMPS5k5xSRuRa+BkySMzhne5S+1WhQrvyglcJ
 hTvg==
X-Gm-Message-State: APjAAAVbwGup6wjJE1HYGooBQTk1B0k9TEAcoVK2WgcfvC40PFeRWoUk
 uQIop59A7f1GKhBR7k+OFjjAYg==
X-Google-Smtp-Source: APXvYqy7DQnahHv4WYLvvV3qcT2SkUUHTBk00iCKoTTLBlhFu6Xsp5qL9efPIajKTBxlJAkv8lkmFw==
X-Received: by 2002:a05:600c:2292:: with SMTP id
 18mr1755383wmf.156.1565685355813; 
 Tue, 13 Aug 2019 01:35:55 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.gmail.com with ESMTPSA id o11sm8651822wrw.19.2019.08.13.01.35.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Aug 2019 01:35:55 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: vkoul@kernel.org,
	broonie@kernel.org
Date: Tue, 13 Aug 2019 09:35:46 +0100
Message-Id: <20190813083550.5877-2-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190813083550.5877-1-srinivas.kandagatla@linaro.org>
References: <20190813083550.5877-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 bgoswami@codeaurora.org, linux-kernel@vger.kernel.org, plai@codeaurora.org,
 pierre-louis.bossart@linux.intel.com, lgirdwood@gmail.com, robh+dt@kernel.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, spapothi@codeaurora.org
Subject: [alsa-devel] [PATCH v2 1/5] soundwire: Add compute_params callback
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
 drivers/soundwire/stream.c    | 10 ++++++++++
 include/linux/soundwire/sdw.h |  2 ++
 2 files changed, 12 insertions(+)

diff --git a/drivers/soundwire/stream.c b/drivers/soundwire/stream.c
index a0476755a459..60bc2fe42928 100644
--- a/drivers/soundwire/stream.c
+++ b/drivers/soundwire/stream.c
@@ -1483,6 +1483,16 @@ static int _sdw_prepare_stream(struct sdw_stream_runtime *stream)
 		bus->params.bandwidth += m_rt->stream->params.rate *
 			m_rt->ch_count * m_rt->stream->params.bps;
 
+		/* Compute params */
+		if (bus->compute_params) {
+			ret = bus->compute_params(bus);
+			if (ret < 0) {
+				dev_err(bus->dev, "Compute params failed: %d",
+					ret);
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
