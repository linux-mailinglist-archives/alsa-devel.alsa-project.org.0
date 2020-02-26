Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D7A2D16F767
	for <lists+alsa-devel@lfdr.de>; Wed, 26 Feb 2020 06:35:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 42BE71685;
	Wed, 26 Feb 2020 06:34:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 42BE71685
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582695338;
	bh=14JEIM/qZPscSn9G3bHWOWhpgQp4kmhPDVuby2vEDqU=;
	h=To:From:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=pAkevbkJV8CeV0p6HNJLGW6sqCnJMBunjrfDBgdFOtrdFN1aG4K+vma8i1nfRPyDi
	 rCrnZ7+HU8Im59FGEomLNdPGvRj90LMf3xZm93E22B6gZ4dSzysIg3IB3jkwg+yRrQ
	 dwdKW3E26cXDkLBuKgMVd9vduSz5Kv2goytRfJW4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 49E20F8016F;
	Wed, 26 Feb 2020 06:33:57 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 60BDFF800E8; Wed, 26 Feb 2020 06:33:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
 SPF_HELO_NONE,SPF_NONE,SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6B1B2F800E8
 for <alsa-devel@alsa-project.org>; Wed, 26 Feb 2020 06:33:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6B1B2F800E8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org
 header.b="UAtOqdCt"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:Date:Message-ID:Subject:From:Cc:To:Sender:Reply-To:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=R7FlMG+Bvduqa3vWTZsVfXNdv+eGdfaeXD+EX3Ia40U=; b=UAtOqdCtIa1gxxR3pMDq5JylXx
 azJWmvIewLWXM6fb3Qjt9wQI3hbwOlkb4pWp67FpIdIpxhf1bvjRPtdR//pAk7Knftf0K37ER/U6q
 S+M704BB8ttr7c2kSFC5WOuxhse7/+E6qzczur9bqiLXOW3XatonRS0zQP1fQl0eJq3jh2mtnLLST
 PBMXdDZq4uXi7rRYMojn0xEezZKWxQHQWR8WY2iHrnMeISKUtwpjLykJ5SG+rCgQsyA+jhxCCt4U1
 1MvkeUIh20O0dwFwssEe8rDixIIp+GeBCjMGC8MekJj26ctgW2NaTqBzb8VShYmhprBK8h0i4PP8L
 UXStqNzQ==;
Received: from [2601:1c0:6280:3f0:897c:6038:c71d:ecac]
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j6pJV-0002Pr-Ll; Wed, 26 Feb 2020 05:32:53 +0000
To: LKML <linux-kernel@vger.kernel.org>,
 moderated for non-subscribers <alsa-devel@alsa-project.org>,
 Takashi Iwai <tiwai@suse.de>
From: Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH] sound: korg1212: fix if-statement empty body warnings
Message-ID: <91fb1e97-a773-5790-3f65-8198403341e1@infradead.org>
Date: Tue, 25 Feb 2020 21:32:49 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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

From: Randy Dunlap <rdunlap@infradead.org>

Fix gcc warnings when -Wextra is used by using an empty do-while
block instead of <nothing>.  Fixes these build warnings:

../sound/pci/korg1212/korg1212.c:674:44: warning: suggest braces around empty body in an ‘if’ statement [-Wempty-body]
../sound/pci/korg1212/korg1212.c:708:43: warning: suggest braces around empty body in an ‘if’ statement [-Wempty-body]
../sound/pci/korg1212/korg1212.c:730:43: warning: suggest braces around empty body in an ‘if’ statement [-Wempty-body]
../sound/pci/korg1212/korg1212.c:853:43: warning: suggest braces around empty body in an ‘if’ statement [-Wempty-body]
../sound/pci/korg1212/korg1212.c:1013:44: warning: suggest braces around empty body in an ‘if’ statement [-Wempty-body]
../sound/pci/korg1212/korg1212.c:1035:43: warning: suggest braces around empty body in an ‘if’ statement [-Wempty-body]
../sound/pci/korg1212/korg1212.c:1052:43: warning: suggest braces around empty body in an ‘if’ statement [-Wempty-body]
../sound/pci/korg1212/korg1212.c:1066:43: warning: suggest braces around empty body in an ‘if’ statement [-Wempty-body]
../sound/pci/korg1212/korg1212.c:1087:43: warning: suggest braces around empty body in an ‘if’ statement [-Wempty-body]
../sound/pci/korg1212/korg1212.c:1094:43: warning: suggest braces around empty body in an ‘if’ statement [-Wempty-body]
../sound/pci/korg1212/korg1212.c:1208:43: warning: suggest braces around empty body in an ‘if’ statement [-Wempty-body]
../sound/pci/korg1212/korg1212.c:2360:102: warning: suggest braces around empty body in an ‘if’ statement [-Wempty-body]

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Jaroslav Kysela <perex@perex.cz>
Cc: Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org
---
 sound/pci/korg1212/korg1212.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- linux-next-20200225.orig/sound/pci/korg1212/korg1212.c
+++ linux-next-20200225/sound/pci/korg1212/korg1212.c
@@ -30,7 +30,7 @@
 #if K1212_DEBUG_LEVEL > 0
 #define K1212_DEBUG_PRINTK(fmt,args...)	printk(KERN_DEBUG fmt,##args)
 #else
-#define K1212_DEBUG_PRINTK(fmt,...)
+#define K1212_DEBUG_PRINTK(fmt,...)	do { } while (0)
 #endif
 #if K1212_DEBUG_LEVEL > 1
 #define K1212_DEBUG_PRINTK_VERBOSE(fmt,args...)	printk(KERN_DEBUG fmt,##args)

