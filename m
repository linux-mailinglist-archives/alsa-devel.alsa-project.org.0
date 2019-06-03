Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 717C333870
	for <lists+alsa-devel@lfdr.de>; Mon,  3 Jun 2019 20:44:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 06B3A1682;
	Mon,  3 Jun 2019 20:43:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 06B3A1682
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559587449;
	bh=sMqt8XtM94bHNJPwyB0I3gU/NBmCQ76Pcp+ATPtFtxs=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QRzDjDl4bViT5nIR6OnUg9YY1LaB4VaQLAUQ0sa2uK7bjoZ5EK6mdssXj/vx10/wk
	 gqth84P98UqXE+YzCyQgaUXGCsomVcBrj8NkyCw5Zgcs1MqqzULRcavChIOdlO8qbI
	 X1huc8yAfpl1gDu3sGO6wN/H+MW3hs9rEL0qyo7Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9933AF89778;
	Mon,  3 Jun 2019 20:34:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 63961F89753; Mon,  3 Jun 2019 20:34:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 91CF0F8973F
 for <alsa-devel@alsa-project.org>; Mon,  3 Jun 2019 20:34:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 91CF0F8973F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="CsQ8HbTO"
Received: by mail-pg1-x544.google.com with SMTP id d30so8762955pgm.7
 for <alsa-devel@alsa-project.org>; Mon, 03 Jun 2019 11:34:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=78EuSAUxvk0eTVYgfPD6z4ab5WOs+lKw0I62++Yl618=;
 b=CsQ8HbTO8IlzQQKGlsM5+fJLbWEI2MJos78k7DutwaUcPfUG0iDsrElkrHoxz2qj1U
 c/NU1Nw/+fAWm57iDd+5sZn+ZnpB95rOe1yUoI+CxyhX2iyPnRmH5w7ZC/FHgXCc+sfN
 3gnF5Q0BZ8ZdFu6cj4VgaxajLMJlW1Who0h34=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=78EuSAUxvk0eTVYgfPD6z4ab5WOs+lKw0I62++Yl618=;
 b=Pf3d1gqHq+UWYYoDCBqYbj61ThCovoFprQswVIBvNm62Tobyi+XUT6k0DXqRXmdG68
 FpNlltQzF8NPNObVNlVT6blSN58l3rPjQ49HNhzCQW3Mn3ZCJgDXDmNSB5Y7yOGgU6sN
 Pu1SFAhJMLyu5sI/GWIkMnIe+U5RfCHsQhNrt9aoL8+Oa3tbTaGJuaZmKCXoeqHMvpEH
 riL6SLex83aMEO13uxRd1CB6yjLpNRno2ltoOtQkjPx0HQTicYBrteFjWJdLyRhhCojs
 tMIwU0COUI6rNrPDiBErkasx6fv4w/lPysb+Ltmyk2iWHFtJtr4nLPce2PhCxPBrqrqu
 +dVw==
X-Gm-Message-State: APjAAAVf/eWJHkocynaANIUNQWyJ2Jf7JTz/TpgM+qIxMrsGiK0SMkhE
 h3dkp/swDarl8vKYrP2SUbcs0g==
X-Google-Smtp-Source: APXvYqxd1tp2oLCjAOIPaRZ+9YiuZUB3isblM3Mx87v1tZEuxJrfwDiG40+SIdeWFfdBs8nbLS6C2Q==
X-Received: by 2002:aa7:8705:: with SMTP id b5mr10340371pfo.27.1559586866606; 
 Mon, 03 Jun 2019 11:34:26 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:3c8f:512b:3522:dfaf])
 by smtp.gmail.com with ESMTPSA id x66sm17074409pfx.139.2019.06.03.11.34.25
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 03 Jun 2019 11:34:26 -0700 (PDT)
From: Gwendal Grignou <gwendal@chromium.org>
To: enric.balletbo@collabora.com, bleung@chromium.org, groeck@chromium.org,
 lee.jones@linaro.org, jic23@kernel.org, broonie@kernel.org,
 cychiang@chromium.org, tiwai@suse.com, fabien.lahoudere@collabora.com
Date: Mon,  3 Jun 2019 11:33:44 -0700
Message-Id: <20190603183401.151408-14-gwendal@chromium.org>
X-Mailer: git-send-email 2.22.0.rc1.311.g5d7573a151-goog
In-Reply-To: <20190603183401.151408-1-gwendal@chromium.org>
References: <20190603183401.151408-1-gwendal@chromium.org>
MIME-Version: 1.0
Cc: linux-iio@vger.kernel.org, Gwendal Grignou <gwendal@chromium.org>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
Subject: [alsa-devel] [RESEND PATCH v3 13/30] mfd: cros_ec: Expand hash API
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
Reviewed-by: Fabien Lahoudere <fabien.lahoudere@collabora.com>
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
