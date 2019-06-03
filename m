Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BAD2933836
	for <lists+alsa-devel@lfdr.de>; Mon,  3 Jun 2019 20:37:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 580881668;
	Mon,  3 Jun 2019 20:36:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 580881668
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559587044;
	bh=7XJ/ArRBek4BVE3g3HNr0E7cuWHDVSvLQfEJd35MuI8=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZuLcPujtd6bjskSs17/ZRdnJhHIYrWgmNb/Zo1sxl89xLkQwPTgDJZULK9YqvGiBZ
	 Yyn+3Cbeoo55P/jxXFqhT8hGm2ZKsu5MUwaJ2R2J+M2RvQjh8Q5du+iBKLEKr7enSZ
	 ffPkEu0kBxPmrPttV7puN4eP08nZsqqiXZfAt09Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 659A7F89736;
	Mon,  3 Jun 2019 20:34:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E488BF896EE; Mon,  3 Jun 2019 20:34:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5E01FF896DD
 for <alsa-devel@alsa-project.org>; Mon,  3 Jun 2019 20:34:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5E01FF896DD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="luThx1kX"
Received: by mail-pf1-x444.google.com with SMTP id y11so11074405pfm.13
 for <alsa-devel@alsa-project.org>; Mon, 03 Jun 2019 11:34:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1yT42r3h0cAw/2mpRzLZAzdkYnaKrCVtoe9m/CkNDjI=;
 b=luThx1kXsf4yDgGgnPNd2OH8HzsCff6ZKCEi+2VCHrJ75re5/gzXXHR9iqMrlk9zc1
 syVFTNJw4a6mb1UbFwCOJfq9ojOWzOyDtXQbqDG03auwMlQqIqZTYsXlrPq+WshXxsCb
 eB0Z/bSYyuBnzsUHnAPYN7ieIK2jRttxDmhLU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1yT42r3h0cAw/2mpRzLZAzdkYnaKrCVtoe9m/CkNDjI=;
 b=HuQ03306QxNxV4gur9pnK5wuoTR8WKe16NX1G2BjgHi6nPC8+pN+L1hPrQfCqVcO8i
 2ndtGe83jWgiWThbBT6A9w1mG8HW8wTYVdcE/0v44SUaaJegVTGtp3Oxa1gV0ywn1rwo
 qSHRq23EVJNuoFNGmKizk81mbcXZ31sT76hrIpcudgINBYmLirZGLBrVNU4mN1ssZxVU
 gNNSYZdMWw5AsqOKQYiWMChCKUEj/0Jzier1gCjtxhFJkWxP9SypwzCpyM8jsv5Erv4d
 Z4rxt7LHLpDvMLuKwNNCMc8TpHg3qVyNqqxKmw9k2v9mZXDO+6jTznUQi2Z/BfOIdN4S
 te4g==
X-Gm-Message-State: APjAAAWbwHHuRvTqVN0FD9Z7SvmrtLjlTAbjdC/U00vBS26TYTibTHaT
 h4jo7qAUr40jjezY76ap/K3X1A==
X-Google-Smtp-Source: APXvYqxfndY6StSeMuggFZiuQpa7Krv2RQ7QOAYlgAtsZu5E1HbYKA0/gGTHCbhxTxblEioudV9blA==
X-Received: by 2002:a63:b1d:: with SMTP id 29mr30294938pgl.103.1559586849654; 
 Mon, 03 Jun 2019 11:34:09 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:3c8f:512b:3522:dfaf])
 by smtp.gmail.com with ESMTPSA id v64sm7234518pjb.3.2019.06.03.11.34.08
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 03 Jun 2019 11:34:09 -0700 (PDT)
From: Gwendal Grignou <gwendal@chromium.org>
To: enric.balletbo@collabora.com, bleung@chromium.org, groeck@chromium.org,
 lee.jones@linaro.org, jic23@kernel.org, broonie@kernel.org,
 cychiang@chromium.org, tiwai@suse.com, fabien.lahoudere@collabora.com
Date: Mon,  3 Jun 2019 11:33:33 -0700
Message-Id: <20190603183401.151408-3-gwendal@chromium.org>
X-Mailer: git-send-email 2.22.0.rc1.311.g5d7573a151-goog
In-Reply-To: <20190603183401.151408-1-gwendal@chromium.org>
References: <20190603183401.151408-1-gwendal@chromium.org>
MIME-Version: 1.0
Cc: linux-iio@vger.kernel.org, Gwendal Grignou <gwendal@chromium.org>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
Subject: [alsa-devel] [RESEND PATCH v3 02/30] mfd: cros_ec: Zero BUILD_ macro
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

Defined out build macro used when compiling embedded controller
firmware.

Acked-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Acked-by: Benson Leung <bleung@chromium.org>
Reviewed-by: Fabien Lahoudere <fabien.lahoudere@collabora.com>
Signed-off-by: Gwendal Grignou <gwendal@chromium.org>
---
 include/linux/mfd/cros_ec_commands.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/include/linux/mfd/cros_ec_commands.h b/include/linux/mfd/cros_ec_commands.h
index 48292d449921..7b8fac4d0c89 100644
--- a/include/linux/mfd/cros_ec_commands.h
+++ b/include/linux/mfd/cros_ec_commands.h
@@ -13,6 +13,11 @@
 #ifndef __CROS_EC_COMMANDS_H
 #define __CROS_EC_COMMANDS_H
 
+
+
+
+#define BUILD_ASSERT(_cond)
+
 /*
  * Current version of this protocol
  *
-- 
2.21.0.1020.gf2820cf01a-goog

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
