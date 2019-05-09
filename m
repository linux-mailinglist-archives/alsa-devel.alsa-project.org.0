Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B8A211945F
	for <lists+alsa-devel@lfdr.de>; Thu,  9 May 2019 23:16:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3F964186D;
	Thu,  9 May 2019 23:15:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3F964186D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557436598;
	bh=gU60euoX5gYYFMv3UBVfiQ0ZkIDhuvP39vNKXSUJWyo=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hX9wsh1IvatUqhGQo5I7pldAN+F4V0lp5+cZ2154Xm0YnZnoAkp8mw6ar62TekkYK
	 pvI7BBA7jnPJHQUc1CfK69WGH9XnrCe5y0MzYJHxVhpyCS1ulGN7SE5MkHgaMgMw2n
	 J6ffGWjPTwryH/5QHbanjgpF/uFv3EGtg/xFRF+s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 01B54F89726;
	Thu,  9 May 2019 23:14:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C975AF89682; Thu,  9 May 2019 23:14:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BE3FFF89673
 for <alsa-devel@alsa-project.org>; Thu,  9 May 2019 23:14:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BE3FFF89673
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="AUGxOu3D"
Received: by mail-pf1-x441.google.com with SMTP id v80so1963243pfa.3
 for <alsa-devel@alsa-project.org>; Thu, 09 May 2019 14:14:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=d/80tNNoqNchHETXJchLO/lOWqI7WgjPd5nso/co8eY=;
 b=AUGxOu3DHNF8Z86pQz5bIBLujbaK2WibpbQN8fpI80OL1P03ICeh4AplsYpo0qFBRQ
 r5uZOGgYhHqkAkBQk+TDLrEskDWUQKyqbOE1OL82v2vJPV8fy0aE9Fl+cumt3MStvrBm
 Pr+Q2OMf5iZpkU1jtgjbGkbVs6J5r2IZzJJ5w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=d/80tNNoqNchHETXJchLO/lOWqI7WgjPd5nso/co8eY=;
 b=foKyAZ/rmPfAQGVu8nWf1r2qRo1li8KciytvLqKjua2AvhINJM9VXNCksz9D4SOVzK
 e4xjyaZ6nV3pbhsqY20ekrOfy7MD+NqN91mKPHP4/tMpbX1GC1/y6MyywpQzvQyHG7lK
 PNpFs7kSQLmti7WFS6NQwyb1IQzAXJiI7WQehK4E3FlWZUKj5VLbEomnC3vr8aEfZCpn
 3YpDLGhgE35WvwqHkHJag9cgCQ3blvAnyW3cABTaNNbBpgBSz8lUdycE9h8ANwd7HtuU
 DlJ8YTMTifzi7zAJGXOrRH4Z2cPIs3VMfmhKbxxciauDm6f/kDz1BV78nokqnwpJQnzP
 NiEw==
X-Gm-Message-State: APjAAAV4jSNvcz9CWQyZML+4aaHExe4aeVughPkFWCqC59/h8Kqpw812
 rxmA6TEz156AT764gVLPHHTgzw==
X-Google-Smtp-Source: APXvYqzyrCsBLpH98WnNvOPuqptMkqpqV1bnMw3nBAhqRCEzxFqDIvc2gG7qEY/DBoFVTYYkBzObvQ==
X-Received: by 2002:a63:7c54:: with SMTP id l20mr5267168pgn.167.1557436444004; 
 Thu, 09 May 2019 14:14:04 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:3c8f:512b:3522:dfaf])
 by smtp.gmail.com with ESMTPSA id l21sm5186810pff.40.2019.05.09.14.14.02
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 09 May 2019 14:14:03 -0700 (PDT)
From: Gwendal Grignou <gwendal@chromium.org>
To: enric.balletbo@collabora.com, bleung@chromium.org, groeck@chromium.org,
 lee.jones@linaro.org, jic23@kernel.org, broonie@kernel.org,
 cychiang@chromium.org, tiwai@suse.com
Date: Thu,  9 May 2019 14:13:24 -0700
Message-Id: <20190509211353.213194-2-gwendal@chromium.org>
X-Mailer: git-send-email 2.21.0.1020.gf2820cf01a-goog
In-Reply-To: <20190509211353.213194-1-gwendal@chromium.org>
References: <20190509211353.213194-1-gwendal@chromium.org>
MIME-Version: 1.0
Cc: linux-iio@vger.kernel.org, Gwendal Grignou <gwendal@chromium.org>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
Subject: [alsa-devel] [PATCH v3 01/30] mfd: cros_ec: Update license term
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

Update to SPDX-License-Identifier, GPL-2.0

Acked-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Acked-by: Benson Leung <bleung@chromium.org>
Signed-off-by: Gwendal Grignou <gwendal@chromium.org>
---
 include/linux/mfd/cros_ec_commands.h | 20 +++++---------------
 1 file changed, 5 insertions(+), 15 deletions(-)

diff --git a/include/linux/mfd/cros_ec_commands.h b/include/linux/mfd/cros_ec_commands.h
index dcec96f01879..48292d449921 100644
--- a/include/linux/mfd/cros_ec_commands.h
+++ b/include/linux/mfd/cros_ec_commands.h
@@ -1,25 +1,15 @@
+/* SPDX-License-Identifier: GPL-2.0 */
 /*
  * Host communication command constants for ChromeOS EC
  *
  * Copyright (C) 2012 Google, Inc
  *
- * This software is licensed under the terms of the GNU General Public
- * License version 2, as published by the Free Software Foundation, and
- * may be copied, distributed, and modified under those terms.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- *
- * The ChromeOS EC multi function device is used to mux all the requests
- * to the EC device for its multiple features: keyboard controller,
- * battery charging and regulator control, firmware update.
- *
- * NOTE: This file is copied verbatim from the ChromeOS EC Open Source
- * project in an attempt to make future updates easy to make.
+ * NOTE: This file is auto-generated from ChromeOS EC Open Source code from
+ * https://chromium.googlesource.com/chromiumos/platform/ec/+/master/include/ec_commands.h
  */
 
+/* Host communication command constants for Chrome EC */
+
 #ifndef __CROS_EC_COMMANDS_H
 #define __CROS_EC_COMMANDS_H
 
-- 
2.21.0.1020.gf2820cf01a-goog

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
