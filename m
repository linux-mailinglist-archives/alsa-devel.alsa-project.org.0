Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D940C13538
	for <lists+alsa-devel@lfdr.de>; Sat,  4 May 2019 00:05:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4FAD417E3;
	Sat,  4 May 2019 00:04:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4FAD417E3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1556921116;
	bh=tBGtEip4eR2+Px9vtEnHlmpZz3aU4fNOy3uYy3bJkMw=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=De6c9O4ogcAobowviZ/psyvBkHlVu6gaTTePUKc7NxY+ahcJNuk25r2hVHV7zgArf
	 33Wy9qsWjWR1ymvSMHJSg7zeK0ODJowHiPsP388Dqw/juuAB1LpgmOYdH6zkCr8zBF
	 goVPz3kh2P0HLe2KvfCfWgofQDGF2UEUAprVGJzE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6FB5CF89726;
	Sat,  4 May 2019 00:02:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DFF11F896CB; Sat,  4 May 2019 00:02:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6F318F8075A
 for <alsa-devel@alsa-project.org>; Sat,  4 May 2019 00:02:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6F318F8075A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="cTF4y69j"
Received: by mail-pl1-x641.google.com with SMTP id l2so3306483plt.11
 for <alsa-devel@alsa-project.org>; Fri, 03 May 2019 15:02:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=v8u/UWICJawrzrjLKRsjDtgT8+fxH2ub2bD/oCUZO04=;
 b=cTF4y69jR8iirJqdEiwoSqUcywThQjw2vb0JCsP1mctYrZCJv5Ih+xn35SbKEH0Hyd
 WAcuDt0ejpX2FhZNdNuFA00YGUpifRHNmuT9OPuqEMPRIbRcTlq0W6P/JFIIqRdBvIix
 tjZl5edO7sgX3JBMBziASxysSGMnof3aORxaM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=v8u/UWICJawrzrjLKRsjDtgT8+fxH2ub2bD/oCUZO04=;
 b=bE7KLIQ/F1nIWnBsk8dIjCbmiZGX6gDpST2sGBoCPgIBOxRBEVlhtn0ZDPRyLvCmQn
 npb1vd0iUNePoF/YqIHdpCiFGRtIHURL/SPM67Jp9V/5cNZtlrHqzZm5rTZuG+31LvvD
 kklG4X49zt4c5j7AxEu1V3bBLoXRijhTmSZ7oJUXzzOBiUlc38OLVzL3JULUailuxtfa
 T26NrW+BBqpX+7j3esFN586/FEr+vWiv60qr+OIkQJXAONT7cL3excAgPXwyt24Apd60
 iGcTPfqvjGTBuESserNGpl7pwNx8nxULUS+UycfKcfyBag1An22FKGydqA+T/OTUNoPn
 rj9A==
X-Gm-Message-State: APjAAAXGbuQwu2fQ9qNs/astnproKnZCuNVPF3zNZZO0CSytnp5nr1nc
 sqHx26HL4EUJH7Gjs09SjbL4SA==
X-Google-Smtp-Source: APXvYqzIL9rRB4s5BW2jSsZP/BhewykiNVjhhJoLhPb8KanB8NbjVFItJh6KurKfr5QeygFKixUbGg==
X-Received: by 2002:a17:902:6b:: with SMTP id
 98mr13896864pla.271.1556920963689; 
 Fri, 03 May 2019 15:02:43 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:3c8f:512b:3522:dfaf])
 by smtp.gmail.com with ESMTPSA id n11sm3403981pgq.8.2019.05.03.15.02.42
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 03 May 2019 15:02:43 -0700 (PDT)
From: Gwendal Grignou <gwendal@chromium.org>
To: enric.balletbo@collabora.com, bleung@chromium.org, groeck@chromium.org,
 lee.jones@linaro.org, jic23@kernel.org, broonie@kernel.org,
 cychiang@chromium.org, tiwai@suse.com
Date: Fri,  3 May 2019 15:02:04 -0700
Message-Id: <20190503220233.64546-2-gwendal@chromium.org>
X-Mailer: git-send-email 2.21.0.1020.gf2820cf01a-goog
In-Reply-To: <20190503220233.64546-1-gwendal@chromium.org>
References: <20190503220233.64546-1-gwendal@chromium.org>
MIME-Version: 1.0
Cc: linux-iio@vger.kernel.org, alsa-devel@alsa-project.org,
 Gwendal Grignou <gwendal@chromium.org>
Subject: [alsa-devel] [PATCH v2 01/30] mfd: cros_ec: Update license term
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
Signed-off-by: Gwendal Grignou <gwendal@chromium.org>
---
 include/linux/mfd/cros_ec_commands.h | 20 +++++---------------
 1 file changed, 5 insertions(+), 15 deletions(-)

diff --git a/include/linux/mfd/cros_ec_commands.h b/include/linux/mfd/cros_ec_commands.h
index 43bee4f7d137..6fa508643da3 100644
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
