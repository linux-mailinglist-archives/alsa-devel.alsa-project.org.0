Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C6401AF390
	for <lists+alsa-devel@lfdr.de>; Sat, 18 Apr 2020 20:44:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AEA2B9F6;
	Sat, 18 Apr 2020 20:43:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AEA2B9F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587235460;
	bh=B+xXdJ6NZQ/rsQFYwTYkDR6IG+JhHN+WLmoRcnyff5A=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=OdxTWJ/l0gSwKIvA7SlFkqq7Aslgt1eIFcKKuWroVPr0Qb2eLn/3tjJkif8LXF2yp
	 /sKfYj0xtnh4kyznAld93cm+XoWYcRL8Fqp9HlV1RoRBFcvSLyhMvykdq758ytMKGC
	 JzHp6HMBJ+QC8f6k3TgoFgf0qKZ5EVngIqGMqA8Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 350C0F8013D;
	Sat, 18 Apr 2020 20:41:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DB6FDF8028B; Sat, 18 Apr 2020 20:41:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 682FCF8016F
 for <alsa-devel@alsa-project.org>; Sat, 18 Apr 2020 20:41:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 682FCF8016F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org
 header.b="XCwSjlVe"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=d5zfrylOKoUmkiJ/VV8Fl3fzLkxXbmDEJr/3MIsevyo=; b=XCwSjlVez+qHxOPmcyTIK6oiMp
 olawr70vtpi0V1QI9XKQUEdNlzc7gZtydJwYjHnNgNwCiR0Y8ytqLU1885mYKcfU2nNRcSQ+hBEej
 MiJH64ZiTrBz5h80SHKV7B2XhV/8NA5dx2/XMstBP2kRcY+jAyFTPEP07dibSEvWPpw6URRhjEARq
 GsW6VSkFXNXfFpWKtacsKtxhxuNePEr2gYhZGljGT1rr1HkTT8hxKqdKHdiJLDwOvTjuHdAESVOeL
 NqEnuUJjyC5UmLntvc7lJwAg8Acv/O1w1fMRoAZtCHCPa4lyuiz4kTPN/HiIYqU17pqZ6fxYiBEQ9
 d15hNa1Q==;
Received: from [2601:1c0:6280:3f0::19c2] (helo=smtpauth.infradead.org)
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jPsOv-0007rZ-9I; Sat, 18 Apr 2020 18:41:13 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Subject: [RFC PATCH 0/9] fix -Wempty-body build warnings
Date: Sat, 18 Apr 2020 11:41:02 -0700
Message-Id: <20200418184111.13401-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.16.4
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

Hi,

When -Wextra is used, gcc emits many warnings about an empty 'if' or
'else' body, like this:

../fs/posix_acl.c: In function ‘get_acl’:
../fs/posix_acl.c:127:22: warning: suggest braces around empty body in an ‘if’ statement [-Wempty-body]
   /* fall through */ ;
                      ^

To quieten these warnings, add a new macro "do_empty()".
I originally wanted to use do_nothing(), but that's already in use.

It would sorta be nice if "fallthrough" could be coerced for this
instead of using something like do_empty().

Or should we just use "{}" in place of ";"?
This causes some odd coding style issue IMO. E.g., see this change:

original:
 	if (cmpxchg(p, ACL_NOT_CACHED, sentinel) != ACL_NOT_CACHED)
		/* fall through */ ;

with new macro:
 	if (cmpxchg(p, ACL_NOT_CACHED, sentinel) != ACL_NOT_CACHED)
		do_empty(); /* fall through */

using {}:
 	if (cmpxchg(p, ACL_NOT_CACHED, sentinel) != ACL_NOT_CACHED)
		{} /* fall through */
or
		{ /* fall through */ }
or even
 	if (cmpxchg(p, ACL_NOT_CACHED, sentinel) != ACL_NOT_CACHED) {
		/* fall through */ }
or
 	if (cmpxchg(p, ACL_NOT_CACHED, sentinel) != ACL_NOT_CACHED) {
		} /* fall through */


 drivers/base/devcoredump.c         |    5 +++--
 drivers/dax/bus.c                  |    5 +++--
 drivers/input/mouse/synaptics.c    |    3 ++-
 drivers/target/target_core_pscsi.c |    3 ++-
 drivers/usb/core/sysfs.c           |    2 +-
 fs/nfsd/nfs4state.c                |    3 ++-
 fs/posix_acl.c                     |    2 +-
 include/linux/kernel.h             |    8 ++++++++
 sound/drivers/vx/vx_core.c         |    3 ++-
 9 files changed, 24 insertions(+), 10 deletions(-)
