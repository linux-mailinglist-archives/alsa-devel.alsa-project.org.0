Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 884E233C2FD
	for <lists+alsa-devel@lfdr.de>; Mon, 15 Mar 2021 17:59:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EF96D17E9;
	Mon, 15 Mar 2021 17:58:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EF96D17E9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615827583;
	bh=B4kuDaQ5VU4ut8JXQBqupmAWZYrAQeBy345QGumruv0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=u74uKoeX1xull5ior9NW81dNzqc0sF95c77bbVV4C6IFs7/nyxuGX9hjYmPxqpd+8
	 eYJ4AevuN49Ebwsxy+QrFN9VpuVaQS3BXGMqWbqYGUKzbUZ0ZHDaCc2zojgdS7VvLY
	 VVM5KajouByZkyvMdSRzlevf3V13UYNfh8K9wDoQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D7FA9F80424;
	Mon, 15 Mar 2021 17:57:17 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5C0B3F8032B; Mon, 15 Mar 2021 17:57:13 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8857AF8021C
 for <alsa-devel@alsa-project.org>; Mon, 15 Mar 2021 17:56:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8857AF8021C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="DvVmN0K4"
Received: by mail-wr1-x42a.google.com with SMTP id e9so6046200wrw.10
 for <alsa-devel@alsa-project.org>; Mon, 15 Mar 2021 09:56:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qgWiq0fpW1Ao1ReNyBWnVsZYnSiuoBY4LWY+fyyXN+8=;
 b=DvVmN0K4XDY3htV9Bkl3qmU9Rm69lhS1NtKvpdnnh6nJxKA4m/q3cf6WHrrgbG8+x2
 tvjlkie8aIW7mZYYfH1DT+pxwJJ+HJ6vJ6sw9f8sa68G4g9llVGHL30HcJVjXC7g0b+0
 7IqazsE1TMdnG5L/+7588THq+lREaDEVTtmWx59liQ+GCmAbsoocdQX9OiEUe9wGs4MS
 CO1mdTpBWjLLIYn8wSLJhXyoJVVkeje156i+q7ZMvxQkdFzTp5N/gEQwEVSxxoBCExEu
 uNJ30LA/1ltGByLOid8utVjMo52TEeoEGH2R1PhTV6UubBuUkySQMlXbPEYn2qElVpni
 UqgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qgWiq0fpW1Ao1ReNyBWnVsZYnSiuoBY4LWY+fyyXN+8=;
 b=dComLsk0eiYJUvgqymz+CezZDtT/BzX/RPmyaY6tdjOrR7CFUdh0CAoHtK3NKPLH60
 s9IwxDIiyt2nkbamo1fZin9Dz0yrIpDGHE4wpOS0NaMcfc0AcfZJ+oAOmM/UAxrUk0r3
 c919zrsas2YksxreY4GZCaYTH+UX3u6ZekjEGmRNpPhcA4k9vqhlFXOPjk59KA5JTmr5
 PBmfQkSmANORX1ECvEUcrZ47xhfjM7v4ibNwEFttOVD0nHm4cmN7d7gHNPcOt21oPFBi
 hJ7WhnpvAwd0YXEvijL7XtQJtQWsyu0uHAVUNZBnIec31re/D8GynP9uwncKBUyFiKAC
 ZfKQ==
X-Gm-Message-State: AOAM531gG8wZon1Hjzbt2fxUEJqvfO5CvXCY/Wqd2hrw8bsOomWN2bA/
 ZpTgt4LH0ExbgX/URLzUobxXqg==
X-Google-Smtp-Source: ABdhPJwv9bnsGMX5GXuYFAmFDI33GWoBNKv7Pgg+K85yqfRfH+JIkb7J+Cx/GjUTh1+99N0kTYj3BA==
X-Received: by 2002:a5d:42cb:: with SMTP id t11mr595569wrr.280.1615827414967; 
 Mon, 15 Mar 2021 09:56:54 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.gmail.com with ESMTPSA id o2sm227656wmc.23.2021.03.15.09.56.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Mar 2021 09:56:54 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org,
	vkoul@kernel.org
Subject: [PATCH v4 1/5] soundwire: add static port mapping support
Date: Mon, 15 Mar 2021 16:56:46 +0000
Message-Id: <20210315165650.13392-2-srinivas.kandagatla@linaro.org>
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

Some of the SoundWire device ports are statically mapped to Controller
ports during design, however there is no way to expose this information
to the controller. Controllers like Qualcomm ones use this info to setup
static bandwidth parameters for those ports.

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

