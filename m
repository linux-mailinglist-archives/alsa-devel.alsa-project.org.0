Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EEB0F10440E
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Nov 2019 20:16:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7AF831748;
	Wed, 20 Nov 2019 20:15:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7AF831748
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1574277368;
	bh=ahdep5rvEZBYmyn6JNKqo4DendtsZvU0GRrxlMHXjFM=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=UWv3ex6RS5gqZi0BDuA+9OQNEaG8gO15YLk9EhxPz6pJbvOYv2lkkZNeuWHS9Ce+o
	 4hn6CO727Hq5gEwZeal+5h3osCEt8wEMkj/1yUqdON1dZtEtrct+aLtnUxCi1WCwb2
	 L2BGkma4niewY6UsieeRmzCq3/wqgofn6rW0UgJQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ABA2CF8014E;
	Wed, 20 Nov 2019 20:14:05 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 850C3F8013C; Wed, 20 Nov 2019 20:14:03 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 892BDF8013C
 for <alsa-devel@alsa-project.org>; Wed, 20 Nov 2019 20:13:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 892BDF8013C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="Ilo4hQID"
Received: by mail-pg1-x541.google.com with SMTP id 15so201887pgh.5
 for <alsa-devel@alsa-project.org>; Wed, 20 Nov 2019 11:13:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=J89rFEpX2bcn4MT2rPqMISIns9zkUW3SAqfx6stcmDY=;
 b=Ilo4hQIDXRCBJhwaaG+5+ySeBNOIBXwb+1Jnv/BQQXF3lQa+wVOawGincaK3X07O5W
 GjbeEkpYBp6Z9Kk9/6dZLOp7U3NOuxjrtLCXo2++0GLYGmGEpaEAIT2EHir67ZMpMvX4
 KeXZMR02iGk+I04L+fGwf9H5K6OFhMMHly1MBKu3qXABkdPt3qz1Qe8jGPKT/FIuRJnY
 p/W1bxkpn14+ifDEH51RnhurjMvwpjtZXgOeVXQZz6v57J1L2U3bBdz0kPIZHdvMB+j5
 55OiNLd0cXPLpjCuNDteWpBQA4fI1SyAZRaaHOo+XGqbVMh6Xp1hppoz0bm93uwRVAlj
 0EwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=J89rFEpX2bcn4MT2rPqMISIns9zkUW3SAqfx6stcmDY=;
 b=aPf1gvlBV9GvScgXrxR4SUlrd4EbqJxELXC4wCVmZHrWiO+cU0i6H0Ovp5fwzPUF8/
 7g/hkuwDwy6F7IR3aIdMtAEW158O9FgvNNQsbcG+U6DzoItKTOQLWu8DqL/HCpbq5Fpf
 MwTRVHob1lHPojwa86bjxNZcDHmJjH/m+N1M3Y1ep+R8rXWKjhKd4X7QWh9+VUzYYuhr
 a+q/ozBv0bhan9X9OH3s5lbTBsVoqo4nsKOsimCiPooqJUbROZDWk4tR1L4+gLwbxCMA
 VB2WhOc7dgciGK5/HJby5unlhFi0+34QGkXlL/Vv1CvBSG438u3ithgPp+oYLjlFFtxG
 iUsg==
X-Gm-Message-State: APjAAAVA5+UL5Pu8Z9/gziY15RLCMFDSUezAFzN7sj7rEb3BEUSNafxE
 r8SzGipo5b9YjSzoEJswloSNS9x9Apc=
X-Google-Smtp-Source: APXvYqw2MJwGotxU4MLpP6LFHlahO6uCmyk5irXKgjwGi5resawjlHaM46RlL4vQfhmLU71qn6ZIMg==
X-Received: by 2002:a63:5508:: with SMTP id j8mr4793043pgb.97.1574277237422;
 Wed, 20 Nov 2019 11:13:57 -0800 (PST)
Received: from mangix-trapnet.lan ([69.42.0.214])
 by smtp.gmail.com with ESMTPSA id m15sm142597pfh.19.2019.11.20.11.13.56
 for <alsa-devel@alsa-project.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Nov 2019 11:13:56 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: alsa-devel@alsa-project.org
Date: Wed, 20 Nov 2019 11:13:55 -0800
Message-Id: <20191120191355.260198-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Subject: [alsa-devel] [PATCHv2] aplay: Limit VUMeter progress bar to 100 for
	negative as well
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

While the progress bar cannot be negative, GCC concludes that it can be
and assumes tmp can be written past the end. Fixes this GCC warning:

aplay.c:1747:18: warning: '%02d' directive writing between 2 and 11 bytes
 into a region of size 4 [-Wformat-overflow=]
 1747 |    sprintf(tmp, "%02d%%", maxperc[c]);

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 v2: Reworded
 aplay/aplay.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/aplay/aplay.c b/aplay/aplay.c
index 78adee2..1a887e4 100644
--- a/aplay/aplay.c
+++ b/aplay/aplay.c
@@ -54,6 +54,8 @@
 #include "formats.h"
 #include "version.h"
 
+#define ABS(a)  (a) < 0 ? -(a) : (a)
+
 #ifdef SND_CHMAP_API_VERSION
 #define CONFIG_SUPPORT_CHMAP	1
 #endif
@@ -1741,7 +1743,7 @@ static void print_vu_meter_stereo(int *perc, int *maxperc)
 			line[bar_length + 6 + 1 + p] = '+';
 		else
 			line[bar_length - p - 1] = '+';
-		if (maxperc[c] > 99)
+		if (ABS(maxperc[c]) > 99)
 			sprintf(tmp, "MAX");
 		else
 			sprintf(tmp, "%02d%%", maxperc[c]);
-- 
2.23.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
