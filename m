Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 32C472FD7AF
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Jan 2021 19:04:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CF90717F8;
	Wed, 20 Jan 2021 19:03:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CF90717F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611165852;
	bh=P9WbPiksAWe5G6FrtSKQxHooiks3e43VSM8blAXrrx0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EOBsP3uQoMSjSC0xpkafGJPGS7Y3JcTfwcFM8noqEEn2njwC9R7zBPXXbmU8HoV3i
	 TVxcb+B1o+JjIacqCAygkQqdCAC83Cntr+wYimqBDIMjN3J7P8Cjtw9/LbU9wZ2NzN
	 QVW8pofU55pNwElS2uYEVF0C7D0WLt/XPmypF2X8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AE089F804CC;
	Wed, 20 Jan 2021 19:02:00 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 69DCAF804C3; Wed, 20 Jan 2021 19:01:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A1B04F80164
 for <alsa-devel@alsa-project.org>; Wed, 20 Jan 2021 19:01:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A1B04F80164
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="n1TBEkVV"
Received: by mail-wm1-x332.google.com with SMTP id i63so3589678wma.4
 for <alsa-devel@alsa-project.org>; Wed, 20 Jan 2021 10:01:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zQoVeBFspR4mt3piNvLaPW/lHzLoxodJhfaRGQgUT1o=;
 b=n1TBEkVVeRe65EecswdyymfUn7w4pRZ39sPs3d6I+/YsPGlFlkRSPmtoPTLcm/pCL8
 7R62yN0J13Y6ttRM5kWB7NlUsyJ22RODR8K+Cfaqg1PrpGMCBbhDZxgS6aL6Giqjy+Jd
 jEm1XNoT9GsFI5fax/PaWYYmj1hWmwYKJutleqn36DvIBsUiaGCHswZs7aIKL6uE/Bx5
 FLQ/3YKBhdM+0H876HH29jAQUmYlbA7Z8JXw17csFA39INZAEN9BLftUMA42iEc9ufDV
 9ps7E8K69ade4CPGYEimPznqY0ZjGXVZROQxlHOj78+PD08f7uEL+Bo3Z5+eC+CWKri4
 P5ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zQoVeBFspR4mt3piNvLaPW/lHzLoxodJhfaRGQgUT1o=;
 b=V0Y0IK7ZjsgQqdMC4GCV8w5h8pBFPm6YMIWlsH7krdU95NDG7o/+IyXv76Ph7xTffJ
 ARfqEj3O9ORT9OV8mBLJtI0DvKFMqjsbmA33qKPKZKVxQSnQVgLh33L4x/RpmDvkx4FZ
 rUcKAcFOt53QI7R3EpqyRj9/QT4NhNIQ7ebhP61CQnFDozIZ6g2bVnaynar1Gq8ltwQp
 n7F2czSOgL3a8WtNH6oyrpdpcXm0HN2Kr7a0/a0tTKZRwaztWRsTvWgCBiPDfZ236BAi
 gmw59nBFibI/6As6QUAYCPTRio4tac75Yxs8sRN73DXIGIZ9xGQK5/bklCejk3cC9dtb
 O4BQ==
X-Gm-Message-State: AOAM530deP56TKW8Li5H+r/toi5bBn8SxoouIayxBmJY734/H21Fizuj
 dLYW5Ublm6OnTZOhIkTmyWwuJ5bfn6JlBg==
X-Google-Smtp-Source: ABdhPJy+vZ5Ndk2chQmEIUc7iK9pg24cCvNdSKut3bwHquW7xDOJ8GeEpBtiILkL2aWLPoPKAjyxiw==
X-Received: by 2002:a05:600c:299:: with SMTP id
 25mr5414365wmk.183.1611165700508; 
 Wed, 20 Jan 2021 10:01:40 -0800 (PST)
Received: from srini-hackbox.lan
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.gmail.com with ESMTPSA id g194sm5267422wme.39.2021.01.20.10.01.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Jan 2021 10:01:39 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: vkoul@kernel.org,
	yung-chuan.liao@linux.intel.com
Subject: [RFC PATCH 1/2] soundwire: add support for static port mapping
Date: Wed, 20 Jan 2021 18:01:09 +0000
Message-Id: <20210120180110.8357-2-srinivas.kandagatla@linaro.org>
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

Some of the soundwire controllers can have static functions assigned
to each port, like some ports can only do PCM or PDM. This is the situation
with some of the Qualcomm Controllers.

In such cases its not correct to assign/map any free port on master
during streaming.

So, this patch provides a way to pass mapped port number along
with the port config, so that master can assign correct ports based
on the provided static mapping.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 drivers/soundwire/bus.h       | 4 ++++
 drivers/soundwire/stream.c    | 4 ++++
 include/linux/soundwire/sdw.h | 4 ++++
 3 files changed, 12 insertions(+)

diff --git a/drivers/soundwire/bus.h b/drivers/soundwire/bus.h
index 2e049d39c6e5..e812557c3293 100644
--- a/drivers/soundwire/bus.h
+++ b/drivers/soundwire/bus.h
@@ -85,6 +85,8 @@ int sdw_find_col_index(int col);
  * @num: Port number. For audio streams, valid port number ranges from
  * [1,14]
  * @ch_mask: Channel mask
+ * @mapped_port_num: Port number to map on Master or Slave in Static Configuration
+ * @is_static_map: true for static port mapping
  * @transport_params: Transport parameters
  * @port_params: Port parameters
  * @port_node: List node for Master or Slave port_list
@@ -95,6 +97,8 @@ int sdw_find_col_index(int col);
 struct sdw_port_runtime {
 	int num;
 	int ch_mask;
+	unsigned int mapped_port_num;
+	bool is_static_map;
 	struct sdw_transport_params transport_params;
 	struct sdw_port_params port_params;
 	struct list_head port_node;
diff --git a/drivers/soundwire/stream.c b/drivers/soundwire/stream.c
index 1099b5d1262b..eab3bc0c95ed 100644
--- a/drivers/soundwire/stream.c
+++ b/drivers/soundwire/stream.c
@@ -1202,6 +1202,10 @@ static struct sdw_port_runtime
 
 	p_rt->ch_mask = port_config[port_index].ch_mask;
 	p_rt->num = port_config[port_index].num;
+	p_rt->is_static_map = port_config[port_index].is_static_map;
+
+	if (p_rt->is_static_map)
+	       p_rt->mapped_port_num = port_config[port_index].mapped_port_num;
 
 	return p_rt;
 }
diff --git a/include/linux/soundwire/sdw.h b/include/linux/soundwire/sdw.h
index f0b01b728640..a523f062993d 100644
--- a/include/linux/soundwire/sdw.h
+++ b/include/linux/soundwire/sdw.h
@@ -894,10 +894,14 @@ void sdw_bus_master_delete(struct sdw_bus *bus);
  *
  * @num: Port number
  * @ch_mask: channels mask for port
+ * @mapped_port_num: Port number to map on Master or Slave in Static Configuration
+ * @is_static_map: true for static port mapping
  */
 struct sdw_port_config {
 	unsigned int num;
 	unsigned int ch_mask;
+	unsigned int mapped_port_num;
+	bool is_static_map;
 };
 
 /**
-- 
2.21.0

