Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8189F127F7B
	for <lists+alsa-devel@lfdr.de>; Fri, 20 Dec 2019 16:38:46 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3775F1668;
	Fri, 20 Dec 2019 16:37:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3775F1668
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576856321;
	bh=iCvVAZBg1PvRHRB2qtW8miuWCtRcxC2b845+UP2NuYw=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RI6GZfxLqm8JWywph/u65UVLF6OHgCsLK8d041lDluzhw+VUUn/befhSPF3sXUySP
	 OlHCyL+W59X/kBCprq7a8kgOMjdRxj7TRrTzUoQdbUZ65GZS86in+JZsuLUrQ5lxzr
	 5RGt9m8lGvHYJk1VJ7rqBV9aqhuxL2UiHv4IYG7A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A31DEF8027D;
	Fri, 20 Dec 2019 16:34:37 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 07EA4F8026F; Fri, 20 Dec 2019 16:34:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A4C75F80266
 for <alsa-devel@alsa-project.org>; Fri, 20 Dec 2019 16:34:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A4C75F80266
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id E6E9CAF94
 for <alsa-devel@alsa-project.org>; Fri, 20 Dec 2019 15:34:25 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Date: Fri, 20 Dec 2019 16:34:15 +0100
Message-Id: <20191220153415.2740-6-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20191220153415.2740-1-tiwai@suse.de>
References: <20191220153415.2740-1-tiwai@suse.de>
Subject: [alsa-devel] [PATCH 5/5] ALSA: uapi: Drop asound.h inclusion from
	asoc.h
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

The asound.h isn't always available while asoc.h itself is distributed
in alsa-lib package.  So we need to avoid the unnecessary inclusion of
asound.h from there.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 include/uapi/sound/asoc.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/include/uapi/sound/asoc.h b/include/uapi/sound/asoc.h
index a74ca232f1fc..6048553c119d 100644
--- a/include/uapi/sound/asoc.h
+++ b/include/uapi/sound/asoc.h
@@ -17,7 +17,6 @@
 #define __LINUX_UAPI_SND_ASOC_H
 
 #include <linux/types.h>
-#include <sound/asound.h>
 
 /*
  * Maximum number of channels topology kcontrol can represent.
-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
