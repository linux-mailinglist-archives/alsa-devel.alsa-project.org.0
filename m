Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C90AF470051
	for <lists+alsa-devel@lfdr.de>; Fri, 10 Dec 2021 12:49:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3828E20E5;
	Fri, 10 Dec 2021 12:48:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3828E20E5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1639136955;
	bh=wjLoWfU0uyOpEqEaUouQT6PTs7ZGFieDrbqEZTvSD4Q=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=vqhLY8B0ws5ljGvznbWcY7bJVRsHKtkWmN+f4HaLHrsJ/fT8H4t0IaDPNxdwEftLH
	 y1M7G5IDoSdmyBWru6XZr8MpZioBeflaEjh4sio6+WJaKa4ZWcLkjY1p2LNx+1oFpr
	 LDTteJCDJZe4lASSEplgORw5oPKR035sLQuMgrr4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AB838F8028D;
	Fri, 10 Dec 2021 12:48:05 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0FBA3F804EC; Fri, 10 Dec 2021 12:48:03 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9F8A9F804CC
 for <alsa-devel@alsa-project.org>; Fri, 10 Dec 2021 12:47:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9F8A9F804CC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="PwbcylkT"
Received: by mail-wm1-x334.google.com with SMTP id y196so6599489wmc.3
 for <alsa-devel@alsa-project.org>; Fri, 10 Dec 2021 03:47:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DdPRnVGVlNPycJ9DTbcky3GEfi1/qO6rilh8GdIfKm8=;
 b=PwbcylkTeZEeIL6UBJi3g6ypNrRUQOcj0MzGxICst0UQEnZGD4GKrXqHNcF7ANjdmz
 vcmzuEXie0jFhjkU50uMLPZx6wD/EX4AO122aPqsRw/ErgXh5bj4MEuGcRJquZwtWLld
 RmMHDtepCxyMpFJ1SukqoshAu9d2PJ08+4z+c+Qppqio2PrJoOVATfZdryPw+62m+gBY
 94hVO607KSg2weyTuWrVxqgZlEFkMQPp+dSdJ1HRxJJDX8wGvzycs9q93gQW7biMr8y2
 f1J5CSeyx72WhuVgnHn+NExrRUZzfll0H86ltWXcgZLh1q+jtbb5Qdpjw+NfGPRUgaHy
 eGcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DdPRnVGVlNPycJ9DTbcky3GEfi1/qO6rilh8GdIfKm8=;
 b=1Ro293XH06J2mNyXxYaX6x/Pt2739AuV0bSgtKDJ/E71yXIR0Scf+x1cFP0D+DA78c
 vDZQyxVFaQVKUl3EnOI0mdTYVNgN29T2MONS3nEeJrxkSRPt7sdaUkbm+VU/jvjN9+YV
 j7kAoBxVSpCt0DhebNMtH46W3s0ggqyUxLNh40EYsGJuZECY0ExJzrkVtinJI/7C/uV5
 3m+/+DtzNJFJP9HPY5rmeDMAAvBMFEYeQ1UHY1Vu56wWsGSGwcwmAlqJXE9LIPR04t9U
 +LH81Rkjjj9pgUG5I9GeL0Ah9x3r5ewvacg0t17hf6syuwizkHJQosDFh1DjXZpto8mL
 mPew==
X-Gm-Message-State: AOAM533V/ag9TeZw+Dw4ebra7jUApzUaKiHgPim4AFX8WtVjWaq7kWom
 ocDqaBNhvFzKZPZf7Mz2Pp8z1g==
X-Google-Smtp-Source: ABdhPJx7yY3Fqo+dlZ2ZI3y6N+B/3ysazcxkVn8RR8G3dVto96Ljv5epauhXEivULr6OwbtUvuqHKA==
X-Received: by 2002:a7b:c257:: with SMTP id b23mr15907315wmj.67.1639136870916; 
 Fri, 10 Dec 2021 03:47:50 -0800 (PST)
Received: from srini-hackbox.lan
 (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
 by smtp.gmail.com with ESMTPSA id a9sm2412753wrt.66.2021.12.10.03.47.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Dec 2021 03:47:50 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH] mfd: wcd934x: fix typo and a duplicate register define
Date: Fri, 10 Dec 2021 11:47:47 +0000
Message-Id: <20211210114747.1485-1-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
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

Looks like we ended up with a typo and a duplicate in WCD register defines.
Fix these.

Fixes: 6ac7e4d7ad70 ("mfd: wcd934x: Add support to wcd9340/wcd9341 codec")
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 include/linux/mfd/wcd934x/registers.h | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/include/linux/mfd/wcd934x/registers.h b/include/linux/mfd/wcd934x/registers.h
index 76a943c83c63..bcec70a66fff 100644
--- a/include/linux/mfd/wcd934x/registers.h
+++ b/include/linux/mfd/wcd934x/registers.h
@@ -34,7 +34,6 @@
 #define WCD934X_DMIC_RATE_MASK					GENMASK(3, 1)
 #define WCD934X_CPE_SS_DMIC2_CTL				0x021a
 #define WCD934X_CPE_SS_DMIC_CFG					0x021b
-#define WCD934X_CPE_SS_DMIC_CFG					0x021b
 #define WCD934X_CPE_SS_CPAR_CFG					0x021c
 #define WCD934X_INTR_PIN1_MASK0					0x0409
 #define WCD934X_INTR_PIN1_STATUS0				0x0411
@@ -375,7 +374,7 @@
 #define WCD934X_CDC_RX2_RX_PATH_SEC3				0x0b74
 #define WCD934X_CDC_RX2_RX_PATH_DSMDEM_CTL			0x0b7b
 #define WCD934X_CDC_RX3_RX_PATH_CTL				0x0b7d
-#define WCD934X_CDC_RX3_RX_PATH_CFG0				0x0b6e
+#define WCD934X_CDC_RX3_RX_PATH_CFG0				0x0b7e
 #define WCD934X_CDC_RX3_RX_PATH_CFG2				0x0b80
 #define WCD934X_CDC_RX3_RX_VOL_CTL				0x0b81
 #define WCD934X_CDC_RX3_RX_PATH_MIX_CTL				0x0b82
-- 
2.21.0

