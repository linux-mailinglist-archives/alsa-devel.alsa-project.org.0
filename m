Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 169E71AF396
	for <lists+alsa-devel@lfdr.de>; Sat, 18 Apr 2020 20:44:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B1A931671;
	Sat, 18 Apr 2020 20:44:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B1A931671
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587235498;
	bh=6t6e9Euqct0/BGzvIoTcm5FqRObQ6kis9QcjoINxgW4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=uI/l2saYsliJzVjisL56JS1/cQp1yLEqifzJZOZOZmIBIeesINhXrLzyURETbF2PN
	 Nz/Il78D1mZA7SCly21jjIRMk+Sy9mYFLgS4Twav0Q8b0auKKiY056GCl+o4x+pqvn
	 zqFZh/gZV86ma6uz4nGLVTen3j3Ib+jt570U2VSg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 261CEF80292;
	Sat, 18 Apr 2020 20:41:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EB737F80292; Sat, 18 Apr 2020 20:41:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B27A3F80240
 for <alsa-devel@alsa-project.org>; Sat, 18 Apr 2020 20:41:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B27A3F80240
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org
 header.b="rJ3FSC6+"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
 To:From:Sender:Reply-To:Content-ID:Content-Description;
 bh=Z/ABBV2vtDLyfRcjamC38HwxTrQtSwsZcb0OzbkWsUE=; b=rJ3FSC6+DaZYG5qDC0wUPtN1SQ
 6kc24pbTmZHwpWQG5VbJcOvhSND5w9lvWyU0STq3J5awSJ+mQGR6mBrLgoi2n3O6n9Jw35QUg9Y74
 9mmpZhqsG2g9ClzjoUATTOR7PYeSeWpeoKr+IpZYuUcbVJVRFfFgNbPYgpOz2vwvO1ArJnNTugkXf
 e5UqMYAoTNEErclRAZHOgSgCt9idLwF4FUQ0aYMp3ZrqvF+UofS5GPLc/CzBRVxKIeIMKMq5oaCq0
 LHXEtvPs6ntRLkN71ahJU4FlZPCqVhnccZu4pp1C/uv0wBPvLn5xg26bBKm46QINfwvrPOOMyxieh
 11sA8ibQ==;
Received: from [2601:1c0:6280:3f0::19c2] (helo=smtpauth.infradead.org)
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jPsP2-0007rZ-8t; Sat, 18 Apr 2020 18:41:20 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 7/9] drivers/base: fix empty-body warnings in devcoredump.c
Date: Sat, 18 Apr 2020 11:41:09 -0700
Message-Id: <20200418184111.13401-8-rdunlap@infradead.org>
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

../drivers/base/devcoredump.c:297:42: warning: suggest braces around empty body in an ‘if’ statement [-Wempty-body]
../drivers/base/devcoredump.c:301:42: warning: suggest braces around empty body in an ‘if’ statement [-Wempty-body]

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Johannes Berg <johannes@sipsolutions.net>
Cc: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Andrew Morton <akpm@linux-foundation.org>
---
 drivers/base/devcoredump.c |    5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

--- linux-next-20200417.orig/drivers/base/devcoredump.c
+++ linux-next-20200417/drivers/base/devcoredump.c
@@ -9,6 +9,7 @@
  *
  * Author: Johannes Berg <johannes@sipsolutions.net>
  */
+#include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/device.h>
 #include <linux/devcoredump.h>
@@ -294,11 +295,11 @@ void dev_coredumpm(struct device *dev, s
 
 	if (sysfs_create_link(&devcd->devcd_dev.kobj, &dev->kobj,
 			      "failing_device"))
-		/* nothing - symlink will be missing */;
+		do_empty(); /* nothing - symlink will be missing */
 
 	if (sysfs_create_link(&dev->kobj, &devcd->devcd_dev.kobj,
 			      "devcoredump"))
-		/* nothing - symlink will be missing */;
+		do_empty(); /* nothing - symlink will be missing */
 
 	INIT_DELAYED_WORK(&devcd->del_wk, devcd_del);
 	schedule_delayed_work(&devcd->del_wk, DEVCD_TIMEOUT);
