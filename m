Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B735E206BD8
	for <lists+alsa-devel@lfdr.de>; Wed, 24 Jun 2020 07:38:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4FB591809;
	Wed, 24 Jun 2020 07:37:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4FB591809
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592977129;
	bh=vs0KqsSuzeTxcycWQlcnoRo95hHwAWr2pbyJZu/UC90=;
	h=Date:Subject:From:To:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=QOsOu7UlMCede5wtPKKQDnU4sxVb5sKjl8/a77O+A5MDcxrTWnXFWFKjIzXOW9Hwj
	 5uB5i4ORtNiRx6erf//nxLr4eF9U+5LDdlvHDLfz/h8ck23zDCZoF2/gvWTuv/UA/I
	 z1HaDAWCH1Ht6aqR5OqjcT6pPeDr31WBRsdYD+co=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AC045F802A2;
	Wed, 24 Jun 2020 07:36:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BE371F802A1; Wed, 24 Jun 2020 07:36:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL
 autolearn=disabled version=3.4.0
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com
 [IPv6:2607:f8b0:4864:20::b49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CA0A4F802A0
 for <alsa-devel@alsa-project.org>; Wed, 24 Jun 2020 07:36:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CA0A4F802A0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="CJ9CkwVw"
Received: by mail-yb1-xb49.google.com with SMTP id s90so1141413ybi.6
 for <alsa-devel@alsa-project.org>; Tue, 23 Jun 2020 22:36:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=GAkzm4XJCASn693uxyR1CFgyLYJYXn8EA6JRtwcUKhA=;
 b=CJ9CkwVw32a7EaWbISj96EVSSbSPLspKq5PRf0EC7lSH82o6BQmrbAFcxZgEC32kbK
 MeQJRnyzkfA/RYiZN93QzGod+3f/l8ZxrPki9vvGxaZjWiHKSzKLHaSEJdk9VGMP3me2
 R9uL4XZMtHHmJn9GcfDUrrJ1/XxppplyedCKFx8bZLaj0a33IuY45RysPdJ2adS9gLiw
 EHsT1TLD6WGzM6ZBm3jkwv3Wa1SeKvf/1gfM8X55gz/47cTaTzGCl55v/ZGFcasif6SY
 KC/je0MBq+vnGibDHr8jS9dd1AuK6JOm7jn/8y+DQl/D+wFQPAuzdDkZyAm+cubSoZ2u
 iQAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=GAkzm4XJCASn693uxyR1CFgyLYJYXn8EA6JRtwcUKhA=;
 b=oRQs6p+3r7tB6H/4I3dMy+oLbjZVRUlj2LRq2ULmIfvq1rxISvjDM2ZJv/BRkNqR2Z
 krsY5H4qhF7JipsX6ozviyOe0JSeFgeqs0HgM3wjLVa2slyIDdKF5nWQ2/lvBkzs8HZZ
 Ys29qK1jpjaW7e8eFGQHsEN7MgZtEZ48Ijuwd11BgGzeXm+s/IxQuKSKX3iEkuZVA1gr
 d78fLdu+OKmcvo/TXeKuC/Nor9HHDGvS9xynjLqLGfRtP0avxIyd5LKfRUFXceJl3fX4
 jNhZ4J/Suxhxxi1NHHy6jHsW/eI/TodFxNHxCF2FB2U/RJtJSCiPBf+tFskfKFD+Efnq
 Beow==
X-Gm-Message-State: AOAM533WazqCYI/8gynskxC3cNcwQbpzwt55FuYFLkstmbIFjomTazlQ
 HSb9EFekh9nCIo6FEjxhq/N80fQ7yM47
X-Google-Smtp-Source: ABdhPJw7hEKgbBwHvkwhssVldTU0aIIDES96D3nf6nu5LVYP7W9mJXpEGQ6/pd6Hy3Re9Jvc+93Sqe9GAQlD
X-Received: by 2002:a25:bcc2:: with SMTP id l2mr38114726ybm.154.1592976992437; 
 Tue, 23 Jun 2020 22:36:32 -0700 (PDT)
Date: Wed, 24 Jun 2020 13:36:27 +0800
Message-Id: <20200624053627.65179-1-tzungbi@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.27.0.111.gc72c7da667-goog
Subject: [PATCH] ASoC: rt1015: add missing header inclusion
From: Tzung-Bi Shih <tzungbi@google.com>
To: broonie@kernel.org
Content-Type: text/plain; charset="UTF-8"
Cc: tzungbi@google.com, alsa-devel@alsa-project.org
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

To fix compile error:

error: implicit declaration of function 'ACPI_PTR'
[-Werror,-Wimplicit-function-declaration]
                .acpi_match_table = ACPI_PTR(rt1015_acpi_match),
		                    ^

Adds the missing header inclusion and sorts in alphabetical.

Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
---
 sound/soc/codecs/rt1015.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/sound/soc/codecs/rt1015.c b/sound/soc/codecs/rt1015.c
index 1f61b4aa4353..548f68649064 100644
--- a/sound/soc/codecs/rt1015.c
+++ b/sound/soc/codecs/rt1015.c
@@ -8,23 +8,24 @@
 //
 //
 
+#include <linux/acpi.h>
+#include <linux/delay.h>
+#include <linux/firmware.h>
 #include <linux/fs.h>
+#include <linux/gpio.h>
+#include <linux/i2c.h>
+#include <linux/init.h>
 #include <linux/module.h>
 #include <linux/moduleparam.h>
-#include <linux/init.h>
-#include <linux/delay.h>
+#include <linux/platform_device.h>
 #include <linux/pm.h>
 #include <linux/regmap.h>
-#include <linux/i2c.h>
-#include <linux/platform_device.h>
-#include <linux/firmware.h>
-#include <linux/gpio.h>
 #include <sound/core.h>
+#include <sound/initval.h>
 #include <sound/pcm.h>
 #include <sound/pcm_params.h>
-#include <sound/soc.h>
 #include <sound/soc-dapm.h>
-#include <sound/initval.h>
+#include <sound/soc.h>
 #include <sound/tlv.h>
 
 #include "rl6231.h"
-- 
2.27.0.111.gc72c7da667-goog

