Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 441081AF38C
	for <lists+alsa-devel@lfdr.de>; Sat, 18 Apr 2020 20:44:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 674FF1676;
	Sat, 18 Apr 2020 20:43:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 674FF1676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587235444;
	bh=T27Hc4y836ulz6fz/AdSl4wNUugAQ5nqH/3NF9zK2Jk=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HsjwiJ0cFP/flQi9Zx/DPAAc3uYEuyDgQ6ZklEvn7fn3QmmQ3nmk67/q5P+5T6yIb
	 h4wkF8TbfF/27LuNGqhIZ3QpdrXUKbPtw/noTHUaouG4lfUDPaTEz4I+Rwb08yAjRZ
	 YLWw3FE1Kt6KxcuOJk3q7qRWJ9tKjVRwr2fOz8/k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 838C3F8016F;
	Sat, 18 Apr 2020 20:41:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3262CF8028C; Sat, 18 Apr 2020 20:41:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9E440F8012E
 for <alsa-devel@alsa-project.org>; Sat, 18 Apr 2020 20:41:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9E440F8012E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org
 header.b="kQXoOERE"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
 To:From:Sender:Reply-To:Content-ID:Content-Description;
 bh=BNcb4DjvEal/26p9FFLHA1PNQV3UKc32zHdLl0ttKSE=; b=kQXoOERERzpS0IoQotzhrC17AM
 BDqI0juPogoA1CutrU8uGOPsgmnH4QRxJkDAbfNciiSq0Z69PFmgx/TEZQgstSuVQf4s8ApWyZOIN
 N0IbkOKt56gcF//A3Gy0d9YkRaR0LroHAHn9xHV3q9Bg5gPjWHvSwd3aZ1XMnWGalvGvI3KsnHTOi
 PkF+38XbJVP04POPyWZMr+qjWfRfv/aYYUcvlXgcFpJEXyrtNbDsB0vSWbenyA4qfTd9ifIw7FyGe
 xHv6sxTZM8XTMTEwomUpQxoXy67XId7pgN/x2b6xhXYuH0hEoT/2krPvePcGZYn4RwiePLRAa3KKE
 lj06imMg==;
Received: from [2601:1c0:6280:3f0::19c2] (helo=smtpauth.infradead.org)
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jPsOx-0007rZ-5c; Sat, 18 Apr 2020 18:41:15 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 2/9] fs: fix empty-body warning in posix_acl.c
Date: Sat, 18 Apr 2020 11:41:04 -0700
Message-Id: <20200418184111.13401-3-rdunlap@infradead.org>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20200418184111.13401-1-rdunlap@infradead.org>
References: <20200418184111.13401-1-rdunlap@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Randy Dunlap <rdunlap@infradead.org>,
 Zzy Wysm <zzy@zzywysm.com>, "J. Bruce Fields" <bfields@fieldses.org>,
 target-devel@vger.kernel.org, Dave Jiang <dave.jiang@intel.com>,
 linux-scsi@vger.kernel.org, linux-nvdimm@lists.01.org,
 Vishal Verma <vishal.l.verma@intel.com>, Chuck Lever <chuck.lever@oracle.com>,
 linux-input@vger.kernel.org, Alexander Viro <viro@zeniv.linux.org.uk>,
 Dan Williams <dan.j.williams@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>, linux-nfs@vger.kernel.org,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 linux-usb@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 Johannes Berg <johannes@sipsolutions.net>,
 Linus Torvalds <torvalds@linux-foundation.org>
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

Fix gcc empty-body warning when -Wextra is used:

../fs/posix_acl.c: In function ‘get_acl’:
../fs/posix_acl.c:127:22: warning: suggest braces around empty body in an ‘if’ statement [-Wempty-body]
   /* fall through */ ;
                      ^

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>
Cc: linux-fsdevel@vger.kernel.org
Cc: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Andrew Morton <akpm@linux-foundation.org>
---
 fs/posix_acl.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- linux-next-20200327.orig/fs/posix_acl.c
+++ linux-next-20200327/fs/posix_acl.c
@@ -124,7 +124,7 @@ struct posix_acl *get_acl(struct inode *
 	 * be an unlikely race.)
 	 */
 	if (cmpxchg(p, ACL_NOT_CACHED, sentinel) != ACL_NOT_CACHED)
-		/* fall through */ ;
+		do_empty(); /* fall through */
 
 	/*
 	 * Normally, the ACL returned by ->get_acl will be cached.
