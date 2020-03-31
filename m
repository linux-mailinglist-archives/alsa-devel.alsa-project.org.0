Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EBD83198F43
	for <lists+alsa-devel@lfdr.de>; Tue, 31 Mar 2020 11:02:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8236583D;
	Tue, 31 Mar 2020 11:01:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8236583D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1585645337;
	bh=/A7Tl3jid6fQIEApUVIpr47GVwPJlHBKtP77pyI+g30=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=dTfkZXj+3R5LtGgq2meaTvqcWHEV1nrweVHu8ZdjcvvxlvdKzKhbS0eLkZZXJcMHV
	 JWy6+N9UIhANcuR1kJX+KGD7kENp0Llqdyt9Db1nVMTE2gePWScVUSB7HyTq+GbuAX
	 Q94IBbgv7MILyKZDpYKqbRPanJFn/fTPcRDVTTGE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A264EF8010D;
	Tue, 31 Mar 2020 11:00:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5A20FF80146; Tue, 31 Mar 2020 11:00:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BC397F8010C
 for <alsa-devel@alsa-project.org>; Tue, 31 Mar 2020 11:00:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BC397F8010C
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 1303AAE44;
 Tue, 31 Mar 2020 09:00:29 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH] Revert "ALSA: uapi: Drop asound.h inclusion from asoc.h"
Date: Tue, 31 Mar 2020 11:00:23 +0200
Message-Id: <20200331090023.8112-1-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
Cc: "Dmitry V . Levin" <ldv@altlinux.org>
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

This reverts commit 645c08f17f477915f6d900b767e789852f150054
which was reported to break the build a program using this header.

The original issue was addressed in the alsa-lib side recently, so we
can make the header more self-contained again.

Reported-by: Dmitry V. Levin <ldv@altlinux.org>
Fixes: 645c08f17f47 ("ALSA: uapi: Drop asound.h inclusion from asoc.h")
Cc: <stable@vger.kernel.org>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 include/uapi/sound/asoc.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/uapi/sound/asoc.h b/include/uapi/sound/asoc.h
index 6048553c119d..a74ca232f1fc 100644
--- a/include/uapi/sound/asoc.h
+++ b/include/uapi/sound/asoc.h
@@ -17,6 +17,7 @@
 #define __LINUX_UAPI_SND_ASOC_H
 
 #include <linux/types.h>
+#include <sound/asound.h>
 
 /*
  * Maximum number of channels topology kcontrol can represent.
-- 
2.16.4

