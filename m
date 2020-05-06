Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CD6E91C7B71
	for <lists+alsa-devel@lfdr.de>; Wed,  6 May 2020 22:44:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7259B17BC;
	Wed,  6 May 2020 22:44:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7259B17BC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588797892;
	bh=CibV1wNGlhRQu4E9ZUPA7682vc9utcdRjckI1NQcqx4=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=txjnE2c47zsdLcCpo7MS8VN9qd+3PtnK3EbjfWpBlgm3qeO7l2Oaibq26HGrzMVd0
	 EpXlPRNtGImDVe+Ss3LeXm4oHxiD6QH4maanhnPFrWmKckLiReV4Q911T6S5AyNNHF
	 Ues3zSbM7qw3/92I81vT+cdZwW1CPRsJeu5z50J4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 10DDDF80234;
	Wed,  6 May 2020 22:43:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5EA28F80249; Wed,  6 May 2020 22:42:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F2F61F800AD
 for <alsa-devel@alsa-project.org>; Wed,  6 May 2020 22:42:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F2F61F800AD
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 9481AAC68
 for <alsa-devel@alsa-project.org>; Wed,  6 May 2020 20:42:32 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH alsa-lib] header: Fix build error with old kernel headers
Date: Wed,  6 May 2020 22:42:29 +0200
Message-Id: <20200506204229.27311-1-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
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

Old development environment doesn't necessarily contain the headers
defining __kernel_long_t that is recently used for y2038 timespec
conditional.  Define it explicitly in such a case.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 include/sound/asound.h | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/include/sound/asound.h b/include/sound/asound.h
index 3be4d850a073..89dd7d2f61b8 100644
--- a/include/sound/asound.h
+++ b/include/sound/asound.h
@@ -1 +1,11 @@
+/* workaround for building with old glibc / kernel headers */
+#ifdef __linux__
+#include <linux/types.h>
+#else
+#include <sys/types.h>
+#endif
+#ifndef __kernel_long_t
+#define __kernel_long_t long
+#endif
+
 #include <alsa/sound/uapi/asound.h>
-- 
2.16.4

