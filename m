Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C978330C8F
	for <lists+alsa-devel@lfdr.de>; Mon,  8 Mar 2021 12:39:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 89C451887;
	Mon,  8 Mar 2021 12:38:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 89C451887
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615203577;
	bh=92frqUm/t/g603rYhm/sF+1S0xjbjNSinXZQ2Y9isS0=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=l8HU+FCobMO8pkveJLwKGim7jzwn2eYQRuBfcoyRHlTGSspjYiYclU9Pc4aRaax6X
	 jr6TVbejuy5VdQibvnGOyEKjJNO/+OwBZAHeHIskCLlXtfbPV7Mffj/xX6UAp/b54k
	 dB26M1DxiualIehEHiZ+scCOdZiRp9jfWEGl/X9Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CC8C0F801ED;
	Mon,  8 Mar 2021 12:38:06 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1CA54F801D8; Mon,  8 Mar 2021 12:38:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1E436F800D0
 for <alsa-devel@alsa-project.org>; Mon,  8 Mar 2021 12:37:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1E436F800D0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="qTGAAgs1"
Received: by mail-wm1-x32d.google.com with SMTP id
 d139-20020a1c1d910000b029010b895cb6f2so3593425wmd.5
 for <alsa-devel@alsa-project.org>; Mon, 08 Mar 2021 03:37:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=o8ABSumopRxhX3bOOU+CF2r1YImKGUPBBN79DPzPoQc=;
 b=qTGAAgs1+zy1cao2XlPMOo2/qIYHp62VyXADDPlERMV4r9K9nlfQ9GH0iuIgOJza6k
 QgqkH/b8u6xt7ca1LyFoSFBtdxoxS4Cia6VH2aJr5NhtkemK1kx1hUDP7QTJl0SB6xWE
 kCrWKnYBEC29/yt9r0AEvlHoZ+2NU/GuAQoGf6htGAunvnCf9IjsyoPzNZO+f+0zpJq8
 iq2rlAO5xqBLR+gZEe3G6ACQ/Hd1H9/nUdMAobkRovNdogUwJUrPRLIy9OZ1bRZ3Z/rE
 cNWxztnJghjHHpyehxQpgXjDCcrn3TqqNLVDerc0uYM/N3vRhF1aKwX5SfaxVYVL1u7Q
 HNeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=o8ABSumopRxhX3bOOU+CF2r1YImKGUPBBN79DPzPoQc=;
 b=NBUQvkZciVahfcAZQL6GfeHxn2zoBw2kVNJf5BXfntJez85Yngx7ZeqPixl8D1V7Md
 gVoNF+k/siGirqQeVkSVqpjrq/MVcJgl6d5KvHwDSW5/DFyiFS9LeR3HiyD5pUBRRr9c
 JkHBD9NA2Rl+PyqHvYJHCU9q3vw9uqsMx86ssgHCFlUiPQhJvJb5fGLM5m0LQn9kfWjT
 Zn+E6sh+8w/3Jpmdj6CHNRwZFeRIMQPKfZyerfop0jFKTZoT1AK7be87KtQJVw5y307t
 hfqLAOq+UBKDVImakFNjDJtS5thMsCv2PiEmjfyo9SxiIEe+gractZ9UdT95ix8PiO9L
 x+7A==
X-Gm-Message-State: AOAM531mVz1TWbHp1KebEkQhlaO01Yyq34UOovXapWEWUcFcudgyAVB7
 7AXmlY9K149Te7VYYkZgJNWsjQ==
X-Google-Smtp-Source: ABdhPJzvtP3yUsWdjFWnv3mLUSZ+nE32zs5G58Bd972PHZWHpFni40FibDAuNT8E0DM5cs8JyEeZXA==
X-Received: by 2002:a1c:4182:: with SMTP id o124mr22327685wma.61.1615203475530; 
 Mon, 08 Mar 2021 03:37:55 -0800 (PST)
Received: from srini-hackbox.lan
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.gmail.com with ESMTPSA id w6sm19448899wrl.49.2021.03.08.03.37.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Mar 2021 03:37:55 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: vkoul@kernel.org
Subject: [PATCH] soundwire: bus: Fix device found flag correctly
Date: Mon,  8 Mar 2021 11:37:52 +0000
Message-Id: <20210308113752.19661-1-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 linux-kernel@vger.kernel.org,
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

found flag that is used to indicate SoundWire device on the bus is
not reset correctly after one iteration, this could miss adding devices
that are enumerated on the bus but on in device list.

Fixes: d52d7a1be02c ("soundwire: Add Slave status handling helpers")
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 drivers/soundwire/bus.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/soundwire/bus.c b/drivers/soundwire/bus.c
index a9ab4a6264e0..188e391c5a83 100644
--- a/drivers/soundwire/bus.c
+++ b/drivers/soundwire/bus.c
@@ -712,7 +712,7 @@ static int sdw_program_device_num(struct sdw_bus *bus)
 	struct sdw_slave *slave, *_s;
 	struct sdw_slave_id id;
 	struct sdw_msg msg;
-	bool found = false;
+	bool found;
 	int count = 0, ret;
 	u64 addr;
 
@@ -744,6 +744,7 @@ static int sdw_program_device_num(struct sdw_bus *bus)
 
 		sdw_extract_slave_id(bus, addr, &id);
 
+		found = false;
 		/* Now compare with entries */
 		list_for_each_entry_safe(slave, _s, &bus->slaves, node) {
 			if (sdw_compare_devid(slave, id) == 0) {
-- 
2.21.0

