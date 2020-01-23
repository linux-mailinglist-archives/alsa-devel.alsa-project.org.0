Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A769F14729D
	for <lists+alsa-devel@lfdr.de>; Thu, 23 Jan 2020 21:34:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3CB0C167F;
	Thu, 23 Jan 2020 21:33:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3CB0C167F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1579811689;
	bh=g1YSURGQ7jCuAQTwIGY5roLPR3oarbI8AGbx0/9snas=;
	h=In-Reply-To:References:To:From:Date:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hUktFDdnxK2tmur7Q+z8B4ePkNmYLaPWrWJ2Q2K/KL+FVkPY7mGwyscx1ePaOJUcM
	 1/K/ntyPiW128BEL4bAwmFoLXuQ0SSzxGj4rusQUCQwgGnc4P3s3/en6/9Ae4oVk8u
	 S8yK5ZajPNF+/Z5v+1vvsFSnoxUaJx9lxpfybmN8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0E290F800E7;
	Thu, 23 Jan 2020 21:33:06 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5FB9EF801D9; Thu, 23 Jan 2020 21:33:03 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=1.0 required=5.0 tests=SPF_HELO_NONE,SPF_SOFTFAIL
 autolearn=disabled version=3.4.0
Received: from herc.mirbsd.org (herc.mirbsd.org
 [IPv6:2001:470:1f15:10c:202:b3ff:feb7:54e8])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EFB1EF800BA
 for <alsa-devel@alsa-project.org>; Thu, 23 Jan 2020 21:32:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EFB1EF800BA
Received: from herc.mirbsd.org (tg@localhost [IPv6:::1])
 by herc.mirbsd.org (8.14.9/8.14.5) with ESMTP id 00NKWOvr002047
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
 Thu, 23 Jan 2020 20:32:26 GMT
Received: (from tg@localhost)
 by herc.mirbsd.org (8.14.9/8.14.5/Submit) id 00NKWMar023632;
 Thu, 23 Jan 2020 20:32:22 GMT
Message-Id: <202001232032.00NKWMar023632@herc.mirbsd.org>
X-Authentication-Warning: herc.mirbsd.org: tg set sender to t.glaser@tarent.de
 using -f
In-Reply-To: <alpine.DEB.2.22.394.2001232123580.6327@tglase-nb.lan.tarent.de>
References: <alpine.DEB.2.22.394.2001232123580.6327@tglase-nb.lan.tarent.de>
 <alpine.DEB.2.21.1911202147000.2011@tglase.lan.tarent.de>
 <s5hzhgpsl7b.wl-tiwai@suse.de>
 <alpine.DEB.2.21.1911211536340.23653@tglase-nb.lan.tarent.de>
 <s5hmuco3unv.wl-tiwai@suse.de>
 <157133531799.6063.9249463816269134459.reportbug@tglase.lan.tarent.de>
To: alsa-devel@alsa-project.org
From: mirabilos <t.glaser@tarent.de>
Date: Thu, 23 Jan 2020 21:17:34 +0100
Cc: 870396@bugs.debian.org
Subject: [alsa-devel] [PATCH 1/3] pcm: ensure amd64-specific asm code is not
	used on x32
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

This fixes segfaults on x32 systems.

Signed-off-by: mirabilos <tg@debian.org>
---
 src/pcm/pcm_dmix.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/src/pcm/pcm_dmix.c b/src/pcm/pcm_dmix.c
index d533f40c..407f644d 100644
--- a/src/pcm/pcm_dmix.c
+++ b/src/pcm/pcm_dmix.c
@@ -142,7 +142,7 @@ static void dmix_server_free(snd_pcm_direct_t *dmix)
 #include "pcm_dmix_generic.c"
 #if defined(__i386__)
 #include "pcm_dmix_i386.c"
-#elif defined(__x86_64__)
+#elif defined(__x86_64__) && !defined(__ILP32__)
 #include "pcm_dmix_x86_64.c"
 #else
 #ifndef DOC_HIDDEN
-- 
2.25.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
