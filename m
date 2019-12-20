Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EC507127F83
	for <lists+alsa-devel@lfdr.de>; Fri, 20 Dec 2019 16:40:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 84E0B1668;
	Fri, 20 Dec 2019 16:39:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 84E0B1668
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576856413;
	bh=TnQvjeknN631V5Cxp4X/QhuyISMmZIzF/khQnD472kg=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=obhyD2GRfwBGnm5ZmUrAE6/+dolUfzB26m14eZnt5bZr4Q6Gr0HIb+yboiylN1ktv
	 vcvYC386jW8x16cCrYHD1qlew8ghyfPSAT5MB4P/SM5UnZmJyWxAlorG3aZvSTRM3g
	 UA/OK0yqo0OoHTleecYTd/7dHnMYklZT7pNEMB4g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DB904F80247;
	Fri, 20 Dec 2019 16:39:04 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4BE79F8022C; Fri, 20 Dec 2019 16:39:02 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 51B79F80059
 for <alsa-devel@alsa-project.org>; Fri, 20 Dec 2019 16:38:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 51B79F80059
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id E0C12AE35
 for <alsa-devel@alsa-project.org>; Fri, 20 Dec 2019 15:38:58 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Date: Fri, 20 Dec 2019 16:38:57 +0100
Message-Id: <20191220153857.3331-2-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20191220153857.3331-1-tiwai@suse.de>
References: <20191220153857.3331-1-tiwai@suse.de>
Subject: [alsa-devel] [PATCH alsa-lib 2/2] type_compat: Add missing __s64
	and __u64 definitions for non-Linux
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

Just for the case without Linux-compatible definitions.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 include/sound/type_compat.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/sound/type_compat.h b/include/sound/type_compat.h
index d4790c1f0e64..5b765f447e2e 100644
--- a/include/sound/type_compat.h
+++ b/include/sound/type_compat.h
@@ -9,9 +9,11 @@
 typedef uint8_t __u8;
 typedef uint16_t __u16;
 typedef uint32_t __u32;
+typedef uint64_t __u64;
 typedef int8_t __s8;
 typedef int16_t __s16;
 typedef int32_t __s32;
+typedef int64_t __s64;
 
 #include <endian.h>
 #include <byteswap.h>
-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
