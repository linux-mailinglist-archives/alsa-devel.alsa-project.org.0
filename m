Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DE9213550
	for <lists+alsa-devel@lfdr.de>; Sat,  4 May 2019 00:13:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C77981860;
	Sat,  4 May 2019 00:12:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C77981860
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1556921615;
	bh=Cq1/viddN/Hq6htgdLkG5xx5xQNNnscL4r6Xz+EMj2U=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=I7oCir6nY22vZ15a+6cAeu+nr5iYC3oZef83Yg3a0VNepHXRhAvLcx6G5815Pqt78
	 k32eanakiKwymEmFElNQGEziWKSBb1iZqQxVV57yXR/bGLo2dIJ9lXJs1DgMmgfzdn
	 nAj59CWyHykxkSDDF5W8oltutcpnzXLPKPUJ3kjA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6E81EF896B9;
	Sat,  4 May 2019 00:03:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7819EF8974B; Sat,  4 May 2019 00:03:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D20C5F89731
 for <alsa-devel@alsa-project.org>; Sat,  4 May 2019 00:03:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D20C5F89731
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="KH+5ig0D"
Received: by mail-pg1-x542.google.com with SMTP id n2so3327177pgg.13
 for <alsa-devel@alsa-project.org>; Fri, 03 May 2019 15:03:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9gD0rOjpw9ms8AskrbFlvCfQcUbKxm7TEx3UNlNN04U=;
 b=KH+5ig0DFc1zTwYKNJYOfHBjhc2PDb4Cds1wnM6NJoj1pelSlCwD/PCI21VlyaKWeJ
 WBphiyOpclP72T09Qs/LHN9XCItuX2i3ZLjMOvbJRxd9GWum9L7g5DWHl98Vbr0P2SMq
 vrgaz8+K8v6/032e198xX5xM0XwAzfnEb13YI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9gD0rOjpw9ms8AskrbFlvCfQcUbKxm7TEx3UNlNN04U=;
 b=ArYJIEMYFoBQCgIQQK8g94QmcR4p9oTuowbTR6RyHeO51YkFET9QR1BQCgTY2nGpV8
 6s8TzHodiMajD61ZFi5N8yBwO7NlR7lYl3ecPbhP7IpGZl621MRfefPOSRJzEMGAIlgO
 HvQ44LRc79bbbumMLYGofyhF/BhdX6qSmBxeG/fQ60r1yO5VqiB8TroVFap896D+Z+I/
 3RV35frSFUMb7bxoYfQxkluyeqN8NmnDBqz1LZl4B5WVXFd1oemmpxVSb4uNJjORlYWP
 SsxMboO4e0tNXMVQJ8s++Ac64yBmT6Z0toBEYBOFmT9xswcoGNzisdbRwh3BtFqcl1pS
 zvOA==
X-Gm-Message-State: APjAAAUlLN0SLZ6WB4jz3PiGQVUloHKJZLonIJmMtu/SR3QPq9/Kgneo
 QuF32xbh8tjXZEzHoTYYelLlMg==
X-Google-Smtp-Source: APXvYqwRZYTa/D/WqinOmvSIQQW6Xl5SMl55y+eG88O+PeZB5rLTHyfZLrobLweqWzUamBC3Cj9fRQ==
X-Received: by 2002:aa7:9085:: with SMTP id i5mr11520540pfa.209.1556920984859; 
 Fri, 03 May 2019 15:03:04 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:3c8f:512b:3522:dfaf])
 by smtp.gmail.com with ESMTPSA id f22sm3884355pgv.45.2019.05.03.15.03.03
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 03 May 2019 15:03:04 -0700 (PDT)
From: Gwendal Grignou <gwendal@chromium.org>
To: enric.balletbo@collabora.com, bleung@chromium.org, groeck@chromium.org,
 lee.jones@linaro.org, jic23@kernel.org, broonie@kernel.org,
 cychiang@chromium.org, tiwai@suse.com
Date: Fri,  3 May 2019 15:02:16 -0700
Message-Id: <20190503220233.64546-14-gwendal@chromium.org>
X-Mailer: git-send-email 2.21.0.1020.gf2820cf01a-goog
In-Reply-To: <20190503220233.64546-1-gwendal@chromium.org>
References: <20190503220233.64546-1-gwendal@chromium.org>
MIME-Version: 1.0
Cc: linux-iio@vger.kernel.org, alsa-devel@alsa-project.org,
 Gwendal Grignou <gwendal@chromium.org>
Subject: [alsa-devel] [PATCH v2 13/30] mfd: cros_ec: Expand hash API
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

Improve API to verify EC image signature.

Acked-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Signed-off-by: Gwendal Grignou <gwendal@chromium.org>
---
 include/linux/mfd/cros_ec_commands.h | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/include/linux/mfd/cros_ec_commands.h b/include/linux/mfd/cros_ec_commands.h
index d55f155eb735..29a996832af0 100644
--- a/include/linux/mfd/cros_ec_commands.h
+++ b/include/linux/mfd/cros_ec_commands.h
@@ -1988,8 +1988,15 @@ enum ec_vboot_hash_status {
  * If one of these is specified, the EC will automatically update offset and
  * size to the correct values for the specified image (RO or RW).
  */
-#define EC_VBOOT_HASH_OFFSET_RO 0xfffffffe
-#define EC_VBOOT_HASH_OFFSET_RW 0xfffffffd
+#define EC_VBOOT_HASH_OFFSET_RO		0xfffffffe
+#define EC_VBOOT_HASH_OFFSET_ACTIVE	0xfffffffd
+#define EC_VBOOT_HASH_OFFSET_UPDATE	0xfffffffc
+
+/*
+ * 'RW' is vague if there are multiple RW images; we mean the active one,
+ * so the old constant is deprecated.
+ */
+#define EC_VBOOT_HASH_OFFSET_RW EC_VBOOT_HASH_OFFSET_ACTIVE
 
 /*****************************************************************************/
 /*
-- 
2.21.0.1020.gf2820cf01a-goog

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
