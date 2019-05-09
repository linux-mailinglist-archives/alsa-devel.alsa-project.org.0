Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 19A6919493
	for <lists+alsa-devel@lfdr.de>; Thu,  9 May 2019 23:25:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9EE03193A;
	Thu,  9 May 2019 23:24:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9EE03193A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557437099;
	bh=EBgu6IJ7uF0DtQ7IXs6AAehb1zM2SPxW/ncqXCSaD70=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pP5xMipKif6DagfJCBgGDLujcnbRFQCv4EQEtSEwJCrijblY93PmwEZrGCownxwig
	 xEurHhOpo8Ikqk9uT523f5y75wlfMSTR2CqRfKfjGJBunk8zz9TKHEHE3c8aoe1XBX
	 0cGcMMPInGuZu7p4s2Krsn6o9KWLzMyI6NZ4KT3c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BCD1BF89771;
	Thu,  9 May 2019 23:14:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8E316F89758; Thu,  9 May 2019 23:14:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8A8F6F8974D
 for <alsa-devel@alsa-project.org>; Thu,  9 May 2019 23:14:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8A8F6F8974D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="cH+VBwgK"
Received: by mail-pg1-x542.google.com with SMTP id d31so1834498pgl.7
 for <alsa-devel@alsa-project.org>; Thu, 09 May 2019 14:14:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=y0IPEAAZhLi1gys+2LirQge8UODqrAqbS/22Qm4bF1s=;
 b=cH+VBwgKsOunqPxtWlu1VRhFgLfNjKBoEnzFUBNyyHA8/Q8GAPqkdWGZXT5t4vH9V2
 G7V2bOhe0nuB+Dqyq7vpAWNVFoM6BhSlslYT1S/UqsnkcFDQjGsa+iOhjVOkVaVJsyBu
 POIUoG2DRasIPlM2Ukm0TaLG42f5fSOJ30za0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=y0IPEAAZhLi1gys+2LirQge8UODqrAqbS/22Qm4bF1s=;
 b=fhwGQ5b47Snj0hm89Cy8WkKg5uNn7LBUc2yY8J5wO3TfOMSpFf9jkWtunQ5VUH+fGV
 nS56oxX+MEJ8hmF4qhIgl1KnGRtS+sEUFhgbTdGK9HaC+xn+/VFvLv5wqNedDRaxLTwJ
 tBnvqpuDkPQYhi/1sRtEisXgzNRcJsOp28aPXPKkLqDCVzZ7/u9z7SbW+qYlazL2iNnl
 eb0tTEzNCib3Zi7guSmUEeImyzIW3Sw765pWkMBPweX4QUg+9oHZEen3v6yRlaBrkNaj
 xbLEq4JiyOjX3cq06QwfY41PW+rxs8/5iFwkUiGJioe769+iaCijB635l43bo2pVaALH
 Ijuw==
X-Gm-Message-State: APjAAAV9ZXWtwq7AVsKvF8AEj2WRE1euCw7hL/dEJutr+EyPRCxqyEqT
 uvCp606ZzBWjJDykSj7fRuZvow==
X-Google-Smtp-Source: APXvYqyE6f1XisQgbEH3d5hrLdGWQVIy/zvCRIyERSNmqjO7MmtzNljBiI83zTxtJqG/PDRN7/ThIQ==
X-Received: by 2002:a62:4c5:: with SMTP id 188mr8667284pfe.29.1557436462597;
 Thu, 09 May 2019 14:14:22 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:3c8f:512b:3522:dfaf])
 by smtp.gmail.com with ESMTPSA id g2sm4443402pfd.134.2019.05.09.14.14.21
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 09 May 2019 14:14:22 -0700 (PDT)
From: Gwendal Grignou <gwendal@chromium.org>
To: enric.balletbo@collabora.com, bleung@chromium.org, groeck@chromium.org,
 lee.jones@linaro.org, jic23@kernel.org, broonie@kernel.org,
 cychiang@chromium.org, tiwai@suse.com
Date: Thu,  9 May 2019 14:13:36 -0700
Message-Id: <20190509211353.213194-14-gwendal@chromium.org>
X-Mailer: git-send-email 2.21.0.1020.gf2820cf01a-goog
In-Reply-To: <20190509211353.213194-1-gwendal@chromium.org>
References: <20190509211353.213194-1-gwendal@chromium.org>
MIME-Version: 1.0
Cc: linux-iio@vger.kernel.org, Gwendal Grignou <gwendal@chromium.org>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
Subject: [alsa-devel] [PATCH v3 13/30] mfd: cros_ec: Expand hash API
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
Acked-by: Benson Leung <bleung@chromium.org>
Signed-off-by: Gwendal Grignou <gwendal@chromium.org>
---
 include/linux/mfd/cros_ec_commands.h | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/include/linux/mfd/cros_ec_commands.h b/include/linux/mfd/cros_ec_commands.h
index 0ff1941288cf..76943e64998a 100644
--- a/include/linux/mfd/cros_ec_commands.h
+++ b/include/linux/mfd/cros_ec_commands.h
@@ -2018,8 +2018,15 @@ enum ec_vboot_hash_status {
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
