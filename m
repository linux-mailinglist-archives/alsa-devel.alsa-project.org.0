Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 650F81AF397
	for <lists+alsa-devel@lfdr.de>; Sat, 18 Apr 2020 20:45:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 09E659F6;
	Sat, 18 Apr 2020 20:44:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 09E659F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587235544;
	bh=PiPBc4fJl2XiNscOjYOGbaP6QhoANzt0JSu+mMj9eRY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kGDcOhRGXpDI1vFtMEFX29FHbmhAy15kKyVq66OCUizV12AcloXEO559Bt1ZfroiV
	 kiUiqNTIXMWVlUsq2KPdySzB8TlpG8dlrlNocEbTqyv4e8hp+XMS//rsWHgZbY+M7I
	 qIuglf+nKtxKZPmnVwsWi5Hvo0rKqoXEm6c4YxaU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3C186F80299;
	Sat, 18 Apr 2020 20:41:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 48D64F8014E; Sat, 18 Apr 2020 20:41:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C9FB9F8026A
 for <alsa-devel@alsa-project.org>; Sat, 18 Apr 2020 20:41:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C9FB9F8026A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org
 header.b="j5q/SQ1+"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
 To:From:Sender:Reply-To:Content-ID:Content-Description;
 bh=RAwgh7dK6Aq2GUmD2z2q67RSpKe0Qba5fsNnenVzxMI=; b=j5q/SQ1+k3/+/NWSTV/WCIkHyr
 zch6FAcwYZsrW1PmSwaW8sUH6ZWeOC45ea2Cw5ovOtRwJLJOkQhRg13tWis5r+icV/DhjmdEjwv79
 s2h+fCIcRl3RnLCdtSGFczimDTd9m/8AzLPWV2hp+UzgF8z2XnH0R/f/a5DQg9nNd3Y73Ad9ZrO4P
 SE8YtJq+oauVuVNS6MyEi2RLVp6TVtw40sWJHw1JEOXlVu7aGBz0X1bug3Vw49BLE3fO57MGGN/q0
 Pmq5oXAMF6sIRcv8GgeZALDInNNSJ4NKJzYxSO84gAsonX87pABbmdSy94HL9m+wa0jkyxTrzud66
 2h6YWfaA==;
Received: from [2601:1c0:6280:3f0::19c2] (helo=smtpauth.infradead.org)
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jPsP3-0007rZ-5p; Sat, 18 Apr 2020 18:41:21 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 8/9] dax: fix empty-body warnings in bus.c
Date: Sat, 18 Apr 2020 11:41:10 -0700
Message-Id: <20200418184111.13401-9-rdunlap@infradead.org>
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

../drivers/dax/bus.c:93:27: warning: suggest braces around empty body in an ‘else’ statement [-Wempty-body]
../drivers/dax/bus.c:98:29: warning: suggest braces around empty body in an ‘else’ statement [-Wempty-body]

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Dan Williams <dan.j.williams@intel.com>
Cc: Vishal Verma <vishal.l.verma@intel.com>
Cc: Dave Jiang <dave.jiang@intel.com>
Cc: linux-nvdimm@lists.01.org
Cc: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Andrew Morton <akpm@linux-foundation.org>
---
 drivers/dax/bus.c |    5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

--- linux-next-20200417.orig/drivers/dax/bus.c
+++ linux-next-20200417/drivers/dax/bus.c
@@ -2,6 +2,7 @@
 /* Copyright(c) 2017-2018 Intel Corporation. All rights reserved. */
 #include <linux/memremap.h>
 #include <linux/device.h>
+#include <linux/kernel.h>
 #include <linux/mutex.h>
 #include <linux/list.h>
 #include <linux/slab.h>
@@ -90,12 +91,12 @@ static ssize_t do_id_store(struct device
 			} else
 				rc = -ENOMEM;
 		} else
-			/* nothing to remove */;
+			do_empty(); /* nothing to remove */
 	} else if (action == ID_REMOVE) {
 		list_del(&dax_id->list);
 		kfree(dax_id);
 	} else
-		/* dax_id already added */;
+		do_empty(); /* dax_id already added */
 	mutex_unlock(&dax_bus_lock);
 
 	if (rc < 0)
