Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A0E5E19472
	for <lists+alsa-devel@lfdr.de>; Thu,  9 May 2019 23:17:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2A4FA186A;
	Thu,  9 May 2019 23:16:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2A4FA186A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557436637;
	bh=llLVV0hytLzjtI9H+o0BHUcWbppkzS+A87cqEpkfHTw=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UARr4Wm+kJcUjUexwepoHWsUVBBGtJibJMKiCcuRPvPnyNGWdZpR82Iy0FLINlDTk
	 4XIgYdYcyiKXDAvAd32umxhtMDVPN4SK7pxZ1GhRvkn2t3g0TvJ0L4Clyp0l57Qtlf
	 4Fe0w2a6uD85vYLVxz/5vLwIE/M/LlwVBi5aaWZw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8D31BF8972B;
	Thu,  9 May 2019 23:14:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 202EDF89674; Thu,  9 May 2019 23:14:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EF27CF89674
 for <alsa-devel@alsa-project.org>; Thu,  9 May 2019 23:14:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EF27CF89674
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="mKj2Cgfp"
Received: by mail-pg1-x544.google.com with SMTP id 145so1827222pgg.9
 for <alsa-devel@alsa-project.org>; Thu, 09 May 2019 14:14:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/7P5q4QlYjlB1PoaalbGvh8L1Fqv8yMUpPNP9xHcgwI=;
 b=mKj2Cgfps3G1zkXLP/TIIcygJDNMHzTg6Im1Me8vkc9Tt/pT5I3JuoMevxlhdjlXaP
 vlcQwc3KzzYMSbUXV9An0OBLQ9UIyV07iY9hhxhJV2UqDrw0rS16/AoF0aF59mU0dUKA
 y56TmbTurVjtUNNP1jvaKkxMZAUfZRLEwQHHg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/7P5q4QlYjlB1PoaalbGvh8L1Fqv8yMUpPNP9xHcgwI=;
 b=W6H9qhFjZ0t0XSzybYFmyYl9decqT9sq7gwltzhf3e+Hs0D8ezH+XtPjCrEENrUGD3
 Un3aC3AdTmh7eM/EBrmDUmkNRPU+mbWOJ5jFZjWtzNvdmV0O4Fj6xPUVZveGfZgeU/2L
 yFyLXaMSZfZw+Dg0xGRyZSpxqYhCxfCYELmb9TphYvGWL9Po+RoWHgORcAUg5lCEVp9u
 GxIZNwX5q9XffWjMMgYHFr30lhjbAWxhNKFN6/7bnB/1fdl7kzLbqmgZAVvOTzmWaI4M
 WQ2L5urTJk6y+838ECBMX0Gu8E5Kz4j+AnqK8rtuO11ypgQSjMucGjcnoqA/FO7euYCh
 G70g==
X-Gm-Message-State: APjAAAVO+3PHzLQluLtbj6ksGQat/TkuuslIZEjvINGsX8c3CGn6KB6B
 jGi2uTqCfivZRdmdmn/My55IWA==
X-Google-Smtp-Source: APXvYqxsq242WuHcF8/Wt0+0fgOWnGWASQJ3tDGCiBrsZLC4ZM6LkVI2F+ZEyqL/TfDx1mm8LexPxQ==
X-Received: by 2002:a63:b706:: with SMTP id t6mr2570714pgf.305.1557436445625; 
 Thu, 09 May 2019 14:14:05 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:3c8f:512b:3522:dfaf])
 by smtp.gmail.com with ESMTPSA id p2sm5140870pfi.73.2019.05.09.14.14.04
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 09 May 2019 14:14:04 -0700 (PDT)
From: Gwendal Grignou <gwendal@chromium.org>
To: enric.balletbo@collabora.com, bleung@chromium.org, groeck@chromium.org,
 lee.jones@linaro.org, jic23@kernel.org, broonie@kernel.org,
 cychiang@chromium.org, tiwai@suse.com
Date: Thu,  9 May 2019 14:13:25 -0700
Message-Id: <20190509211353.213194-3-gwendal@chromium.org>
X-Mailer: git-send-email 2.21.0.1020.gf2820cf01a-goog
In-Reply-To: <20190509211353.213194-1-gwendal@chromium.org>
References: <20190509211353.213194-1-gwendal@chromium.org>
MIME-Version: 1.0
Cc: linux-iio@vger.kernel.org, Gwendal Grignou <gwendal@chromium.org>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
Subject: [alsa-devel] [PATCH v3 02/30] mfd: cros_ec: Zero BUILD_ macro
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
