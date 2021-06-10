Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AEA603A29EC
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Jun 2021 13:11:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3E8381755;
	Thu, 10 Jun 2021 13:10:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3E8381755
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623323478;
	bh=clMpL0heM+DMkrmuFlffgpobuL8mNq0URhAGXbSmF90=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=tPTaYza1d56khvHKTjzMMkWcjuwIzZqo3KpGMdig3ea6jhlLhJcjvTW44wvaGhTX3
	 akAYwg3YDfi7R/yiqilZAkCcxwRmS+BGSXiF/ubRNslqeOubFsfmTpZNjtS+wz1EA6
	 RkuGtFfFMGZj65FFdbmgWUOiGvpPQEmmwek5iH64=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B5853F8020D;
	Thu, 10 Jun 2021 13:09:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EA9DCF80218; Thu, 10 Jun 2021 13:09:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0F78CF800FC
 for <alsa-devel@alsa-project.org>; Thu, 10 Jun 2021 13:09:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0F78CF800FC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="l9Hvs3C/"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="eKCZdYcY"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id EBEB31FD37
 for <alsa-devel@alsa-project.org>; Thu, 10 Jun 2021 11:09:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1623323375; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=HN0Z8IZNOc1T0Shw8cWFPYGgTN2klet4Y8k2o6zj92w=;
 b=l9Hvs3C/ERzPD6QJ3+zhc9prBHM+OfRfSRG6dfZJmg8PAVO0I2ZXnvVR4Y/uI1Ji9rDJuM
 IyeRH46nsEVKMku32nIYmKJwnyRcNxlVG3GffzIK/mNSHYB3vstTlidREwEPp48grSMZXR
 rkNO6+1+8Ocogqsag9gedkGN2hPtREY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1623323375;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=HN0Z8IZNOc1T0Shw8cWFPYGgTN2klet4Y8k2o6zj92w=;
 b=eKCZdYcYZb4NGRwqePHmAWU2eid5vqD4pI3m4Q3VHGPrmxfGdDjRfxhCVHUVmv5X8DPpTO
 yCGM6IDBBU9xpGDg==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id DB604A3B8B;
 Thu, 10 Jun 2021 11:09:35 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: core: Fix build error due to missing PAGE_SIZE
Date: Thu, 10 Jun 2021 13:09:35 +0200
Message-Id: <20210610110935.10393-1-tiwai@suse.de>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

The recent refactoring of memalloc stuff removed the inclusion of
asm/page.h for simplicity, but it turned out this caused a compile
error due the lack of PAGE_SIZE definition on some architectures.
Do a partial revert for recovering from that.

Fixes: 37af81c5998f ("ALSA: core: Abstract memory alloc helpers")
Reported-by: kernel test robot <lkp@intel.com>
Link: https://lore.kernel.org/r/202106101858.PfXMMuAa-lkp@intel.com
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 include/sound/memalloc.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/sound/memalloc.h b/include/sound/memalloc.h
index 1918c60f1f35..44d87775b352 100644
--- a/include/sound/memalloc.h
+++ b/include/sound/memalloc.h
@@ -9,8 +9,9 @@
 #ifndef __SOUND_MEMALLOC_H
 #define __SOUND_MEMALLOC_H
 
+#include <asm/page.h>
+
 struct device;
-struct page;
 struct vm_area_struct;
 
 /*
-- 
2.26.2

