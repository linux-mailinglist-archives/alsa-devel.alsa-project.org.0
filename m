Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DE7DF6909B0
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Feb 2023 14:16:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 271F9DF2;
	Thu,  9 Feb 2023 14:15:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 271F9DF2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675948596;
	bh=QIzgqJo1PbgT8kMvAqhqZSCWFoTb7LfwfgQrbOyf8p8=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=NelYxhPaNwOa6y2+SYmDXbvgJaDk2XNF8KSyGKTTYRQnkOsuuUdNjWOeFHYoBRRO3
	 FaDlGmu2D+h00f1owOsj7lEZEavOpKtbknS6/bLAit5dUuQDkYudF8SKp4Yn5MXR5c
	 8VdG/fcF3vWsgWPTrbzAn4RM0PjcutItRXHq2DA4=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id F411CF80558;
	Thu,  9 Feb 2023 14:14:50 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 76D41F80553; Thu,  9 Feb 2023 14:14:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1BC40F80086
	for <alsa-devel@alsa-project.org>; Thu,  9 Feb 2023 14:13:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1BC40F80086
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=P5/7vAmo
Received: by mail-wm1-x336.google.com with SMTP id
 bg5-20020a05600c3c8500b003e00c739ce4so1472697wmb.5
        for <alsa-devel@alsa-project.org>;
 Thu, 09 Feb 2023 05:13:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NPMNrqeZWO55o8AuAcgfBuwWh3I0TkN1wM5VoUAdYRc=;
        b=P5/7vAmoDhtyUlDOFPxWWFRqeYKHw8doDPEZBBNdtIVq/tXEgqP6HDXkgsDHQG75uj
         BuJV5vmjH4QrQCnfFzzcRmVT3ejoinm3y5GEBKxcEeeD05XKfjCBAClKGnST3B8MQWBn
         Oc9ahTVyT17Vg+/x06m23nWOiXJ4PHkiIM5dWbGETfG8UKXs8GnE9P+l+9vGNhAOPryv
         SB4acICvJP0dUJDt6xotz75JpNVjolbpfbeHUVPmCeXC2RzRWI3hzObNL8NU/+9JNPDt
         2mOU8jfUcVHMFTisSeQ4GxV8m4O9Zrv8n5ZG1Pox+2DVnyTohSu+1Kuswuhi67g9tHme
         /3zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NPMNrqeZWO55o8AuAcgfBuwWh3I0TkN1wM5VoUAdYRc=;
        b=XvUYrBT4DfQePUWQgC29jsC1KwUI+wPwRSqqrZpfWbuOzYZ1QJjApc2nrSk/tSC5lP
         oYpM1XuX72IrCDYK85rMiEKHAhzJoBT3qap5C9QvE75oo7rL1HB2R1O2+bAFVIVt6sXH
         lBMvnKa3aDJWHtVbne/b33tLpRbG/5Gd4M96oU/s0e4/wlmxqQiqy1a2SUH0T8gUXO4r
         v9vlmAM/jTUwJ0572JCYjh2jyF9xL2OGf0tezXFp+58NNxIJV1Ep8mld9iq5U4y1kw8i
         j/8ykD5oQfqd3p41PfduHZgCoMqFjRcxQqXWhkYmbPAaBcPqj/+5Qw7p9A84sNt69ONG
         9sHA==
X-Gm-Message-State: AO0yUKXL2waIYmlMjM9IuU2tOK5/dD3B5vN2I43XWihLmv4u+OT8atUr
	ZEjm2p/vTEyfvtorqoqEs/HWXg==
X-Google-Smtp-Source: 
 AK7set8+KF1qJ63RGYOjxvONT/0dXdAeON0gJzSIfKGxOdbH/Nq2pMAk1kkn/QWQI4j+NQDJQZfcUQ==
X-Received: by 2002:a05:600c:4485:b0:3dc:51ad:9dc4 with SMTP id
 e5-20020a05600c448500b003dc51ad9dc4mr9701331wmo.18.1675948433322;
        Thu, 09 Feb 2023 05:13:53 -0800 (PST)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id
 ja13-20020a05600c556d00b003dc4b4dea31sm1789394wmb.27.2023.02.09.05.13.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Feb 2023 05:13:52 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: vkoul@kernel.org
Subject: [PATCH 5/5] soundwire: qcom: set clk stop need reset flag at runtime
Date: Thu,  9 Feb 2023 13:13:36 +0000
Message-Id: <20230209131336.18252-6-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20230209131336.18252-1-srinivas.kandagatla@linaro.org>
References: <20230209131336.18252-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: B5A5BFUYETU7XAADJZ4D4BSFNPHK4QGC
X-Message-ID-Hash: B5A5BFUYETU7XAADJZ4D4BSFNPHK4QGC
X-MailFrom: srinivas.kandagatla@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.intel.com,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, steev@kali.org,
 johan+linaro@kernel.org, quic_bjorande@quicinc.com,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/B5A5BFUYETU7XAADJZ4D4BSFNPHK4QGC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

WSA Soundwire controller needs an full reset if clock stop support
is not available in slave devices. WSA881x does not support clock stop
however WSA883x supports clock stop.

Make setting this flag at runtime to address above issue.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 drivers/soundwire/qcom.c | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
index 74e38c0d651b..0224a5a866de 100644
--- a/drivers/soundwire/qcom.c
+++ b/drivers/soundwire/qcom.c
@@ -536,10 +536,14 @@ static int qcom_swrm_enumerate(struct sdw_bus *bus)
 
 		sdw_extract_slave_id(bus, addr, &id);
 		found = false;
+		ctrl->clock_stop_not_supported = false;
 		/* Now compare with entries */
 		list_for_each_entry_safe(slave, _s, &bus->slaves, node) {
 			if (sdw_compare_devid(slave, id) == 0) {
 				qcom_swrm_set_slave_dev_num(bus, slave, i);
+				if (!slave->prop.simple_clk_stop_capable)
+					ctrl->clock_stop_not_supported = true;
+
 				found = true;
 				break;
 			}
@@ -1500,15 +1504,6 @@ static int qcom_swrm_probe(struct platform_device *pdev)
 		 (ctrl->version >> 24) & 0xff, (ctrl->version >> 16) & 0xff,
 		 ctrl->version & 0xffff);
 
-	/* Clk stop is not supported on WSA Soundwire masters */
-	if (ctrl->version <= 0x01030000) {
-		ctrl->clock_stop_not_supported = true;
-	} else {
-		ctrl->reg_read(ctrl, SWRM_COMP_MASTER_ID, &val);
-		if (val == MASTER_ID_WSA)
-			ctrl->clock_stop_not_supported = true;
-	}
-
 #ifdef CONFIG_DEBUG_FS
 	ctrl->debugfs = debugfs_create_dir("qualcomm-sdw", ctrl->bus.debugfs);
 	debugfs_create_file("qualcomm-registers", 0400, ctrl->debugfs, ctrl,
-- 
2.21.0

