Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 768B1332859
	for <lists+alsa-devel@lfdr.de>; Tue,  9 Mar 2021 15:18:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 17713183A;
	Tue,  9 Mar 2021 15:17:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 17713183A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615299493;
	bh=7rJI1iswpadLIDgBFldvh4yR1EkDomri5WTHFp5Jznw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kqUQx6bOHfeVb+hIbJYhXnFd/1vVA6Sj2UlG0ltSIQS+lgUhN6xbU0uO8Iz9LC+Zk
	 IH4dMbpqKWH+CW3vo0yEoWuYwWg8KCCIfCQNtdNzMSSzbCVhuPILHPwUhfY0N3X7fI
	 Hoy6b72BRb+PmKQ0oFQy2H5sOPlpdoI4+c7G8Bf0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2974BF8032D;
	Tue,  9 Mar 2021 15:15:48 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D6E89F80227; Tue,  9 Mar 2021 15:15:43 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E202BF8014E
 for <alsa-devel@alsa-project.org>; Tue,  9 Mar 2021 15:15:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E202BF8014E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="VMfw2/F3"
Received: by mail-wr1-x42f.google.com with SMTP id 7so15930050wrz.0
 for <alsa-devel@alsa-project.org>; Tue, 09 Mar 2021 06:15:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7gDmC37JxzQ5hGBDDct3/T0SwytsBBauAUrn0ZFgLOw=;
 b=VMfw2/F318b244pqC02hJYJaHUKyllWsXMoL96g5Bx3Exg5BpOWKfk396oEP6ylN6h
 Htuzw4Jb7IrefcX1arcdOlAxcp3FHx4SG6Vm9yRoboFzvTvQqx+auDxgKm66yNq6C9wK
 sFnQ92HhHYDwTwdbOUEI6JfWH7wU83fWUqXByEvXQTp1VgaSpZn1TpV6DhwWk7vDMsis
 QWltgCtEx4awHj0350HhRtv3mPIu3YT9AFda+jjqlKDLQDq32/XVDJPFuHclO6J49rV3
 fCGiBPfkiBvcLRzvc2ktHCGlUR1bNS9FH+0nk8Nm5FCDVS2Wr5m6NK0Y2B/8zs5LjjcY
 JQJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7gDmC37JxzQ5hGBDDct3/T0SwytsBBauAUrn0ZFgLOw=;
 b=omjw1oaM3KMESrq8Vgh2pUqNseBMh+exxxCrLOITxYqU1QxRDSvW6tJPojhiuTUynl
 EMHFSPt5BNn4OgcIk2gBuEDS/HpGlZ9OwlxTOuL5DTMENl3zURSCBy3WFF4R6PQ+nLW4
 4PB9u7v3ppPPM11ztCjAP4PUJBVuaji/hWwhubcu+PhI6lJUpYyO8yMUUow3gIjJWbTO
 aBbrmE23be6dr3YN0cG32dI1r5d4NoqUnDEkFNsNJmxH+pZwqAzVTupCfEkrJ8JCdJ7l
 idKG4gmeHqAWrXzZqDR3AZ60J9IWGLzWWzqy216xlh0UL0QMefHBw7afw4CBJQReBU/f
 cdTw==
X-Gm-Message-State: AOAM532cnmMyGcU89mNdvn394/i2+TKDX+JZQJIuRnbGjK3mH3j945RU
 2I13+H2G+EOO1WEbmp5vJkSrv1QtE6rTSw==
X-Google-Smtp-Source: ABdhPJzeXxHYM4+hidJKnBfyZ6yLKrTkfVXOLtOIS2uC0k1nZ9CPT6fh3Kil1zaNtjFJAc39AkgJsw==
X-Received: by 2002:adf:e34f:: with SMTP id n15mr28566940wrj.224.1615299333563; 
 Tue, 09 Mar 2021 06:15:33 -0800 (PST)
Received: from srini-hackbox.lan
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.gmail.com with ESMTPSA id u20sm28007579wru.6.2021.03.09.06.15.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Mar 2021 06:15:32 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org,
	vkoul@kernel.org
Subject: [PATCH v2 1/5] soundwire: add static port mapping support
Date: Tue,  9 Mar 2021 14:15:10 +0000
Message-Id: <20210309141514.24744-2-srinivas.kandagatla@linaro.org>
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

Some of the SoundWire device ports are statically mapped to Controller
ports during design, however there is no way to expose this information
to the controller. Controllers like Qualcomm ones use this info to setup
static bandwith parameters for those ports.

A generic port allocation is not possible in this cases!
So this patch adds a new member m_port_map to struct sdw_slave to expose
this static map.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 include/linux/soundwire/sdw.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/linux/soundwire/sdw.h b/include/linux/soundwire/sdw.h
index d08039d65825..2f52d6609076 100644
--- a/include/linux/soundwire/sdw.h
+++ b/include/linux/soundwire/sdw.h
@@ -614,6 +614,7 @@ struct sdw_slave_ops {
  * @debugfs: Slave debugfs
  * @node: node for bus list
  * @port_ready: Port ready completion flag for each Slave port
+ * @m_port_map: static Master port map for each Slave port
  * @dev_num: Current Device Number, values can be 0 or dev_num_sticky
  * @dev_num_sticky: one-time static Device Number assigned by Bus
  * @probed: boolean tracking driver state
@@ -645,6 +646,7 @@ struct sdw_slave {
 #endif
 	struct list_head node;
 	struct completion port_ready[SDW_MAX_PORTS];
+	unsigned int m_port_map[SDW_MAX_PORTS];
 	enum sdw_clk_stop_mode curr_clk_stop_mode;
 	u16 dev_num;
 	u16 dev_num_sticky;
-- 
2.21.0

