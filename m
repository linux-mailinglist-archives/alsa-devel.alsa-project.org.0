Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AE3D4338CA3
	for <lists+alsa-devel@lfdr.de>; Fri, 12 Mar 2021 13:24:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4C17C170D;
	Fri, 12 Mar 2021 13:23:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4C17C170D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615551880;
	bh=TzcSLnTBxY1kJ6YWS9tHnnidnVCz7qO3SLCDMKWFIoE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ammeD72G3PeuraLTlG4/J9kbPuoP5GVplmUrto4Y3OZ18p3eCF0i/Hu+fjMflohr5
	 mQEqQMJL0KdlI+zwed9Qc9INimDd118RzQNPzdDrkVcVoDx+AH4Xwa2SRB5g7/Nlrm
	 cIN1qscM1sh5tWLZm6vnZdeRvWdroQyJgMEa4o3A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 29989F8016C;
	Fri, 12 Mar 2021 13:23:10 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B45C0F80217; Fri, 12 Mar 2021 13:23:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0D30DF800BF
 for <alsa-devel@alsa-project.org>; Fri, 12 Mar 2021 13:22:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0D30DF800BF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="rEb1ZAVk"
Received: by mail-wm1-x331.google.com with SMTP id
 r15-20020a05600c35cfb029010e639ca09eso15685528wmq.1
 for <alsa-devel@alsa-project.org>; Fri, 12 Mar 2021 04:22:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5ru3G/xiV/FesvnfCiQRQW9G+LeLCgjQacdkoFKvPOI=;
 b=rEb1ZAVk7u4jNmffOk7mLfzINp31HOQMZUlWVBN1F2s9P8pN+JhAhtVmrutZZRCR2E
 VvboNivvgKapQp0hLjn1Et0fvwqvFPT3/jQxXbInUp2Zziw0ChMUtR4ReW9vkDNaOa47
 WqpOAvxl6jLyNluRd9IkqSzz/L906chETyQVZxEKp1v58HpOH2+8tX9dS06GJhxI/5d6
 MsR7N/o3fMB+RnAWcbyfGqYYV72Ir5ufpOGUNPlaSI9hyRPzRHF45GWaKhrGTD3dCgI6
 2T8gH/Kjhva1MCuF/zRknPrKHnoZ7aLrdtFx3Gjsij9XrcOgbDF+FbqG2yzct9VzuKeg
 a+Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5ru3G/xiV/FesvnfCiQRQW9G+LeLCgjQacdkoFKvPOI=;
 b=rh+ZDYPnHgc0TxnDgiNLyaqsW2OvpqmXM5sumvMxli02JhvLn8ycaC+Zpo3LJ7R/m5
 Sqv0rWfwK2atLDJ7ZTB9z3tBWbejrI/ctxm+ydOWriDfY+ROxJq76q2a4fSo0fAOk+oY
 nWD080VxudCtCa0uJhRiu+ilwIT4x/ckHBqo69evS0ArTVlaVjedYN+jzNZoATBjgo5p
 3zzyMsNaA/zEOJWj78/pL+TVdJlH39t2JPLwJo6s71XEjS1Takr/rzM76ypN+lEt7qyQ
 OCflR0NrfB/KHpKpmgxuOLk/mN37K87y0ALr8Kf1pqHgtYGVbXReuTPZ3SmFZp+Tc0f1
 g2og==
X-Gm-Message-State: AOAM5331cOE9qlO9Zp93IR+WUdAdMzf4sn2ISFrxkeKEknOJux2EINGr
 FsBzONcrwRycQ0uB81trWgPTCg==
X-Google-Smtp-Source: ABdhPJwpydk8dosdsqVArU7quVgt8gCulgkPEEHFjnRr1TiDAGDr3M4AaBcsKdbXa0SYvUH86WN2vQ==
X-Received: by 2002:a7b:cd04:: with SMTP id f4mr12894536wmj.76.1615551779161; 
 Fri, 12 Mar 2021 04:22:59 -0800 (PST)
Received: from srini-hackbox.lan
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.gmail.com with ESMTPSA id 3sm8804329wry.72.2021.03.12.04.22.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Mar 2021 04:22:58 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org,
	vkoul@kernel.org
Subject: [RESEND PATCH v3 1/5] soundwire: add static port mapping support
Date: Fri, 12 Mar 2021 12:22:51 +0000
Message-Id: <20210312122255.3143-2-srinivas.kandagatla@linaro.org>
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
index d08039d65825..b032d6ac0b39 100644
--- a/include/linux/soundwire/sdw.h
+++ b/include/linux/soundwire/sdw.h
@@ -614,6 +614,7 @@ struct sdw_slave_ops {
  * @debugfs: Slave debugfs
  * @node: node for bus list
  * @port_ready: Port ready completion flag for each Slave port
+ * @m_port_map: static Master port map for each Slave port0 to port14
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

