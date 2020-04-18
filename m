Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B7131AF38B
	for <lists+alsa-devel@lfdr.de>; Sat, 18 Apr 2020 20:43:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C75E6166D;
	Sat, 18 Apr 2020 20:42:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C75E6166D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587235397;
	bh=bit41N5P+OHfYUXveR4OqEs8LllxXcWZLOoG+6fQ3cQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Xhi1bEE2Ox5bTLxwvIdMJeb25ulb/x72EXW8soQX5x9BEPsclJ/E2jnOepmtZYm4I
	 5HQg9SXSu7hij+Bl4pdfGca6p6hV7cyOZcGFHohGlO5SEbQTMz50cSFm8MJSuqT4lV
	 7hod0mevyrduplqnn59B/VG0FYqdMnidTD/kF91A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A9AF1F8028D;
	Sat, 18 Apr 2020 20:41:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9AD70F8028D; Sat, 18 Apr 2020 20:41:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5DC3AF80122
 for <alsa-devel@alsa-project.org>; Sat, 18 Apr 2020 20:41:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5DC3AF80122
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org
 header.b="px+muzAC"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
 To:From:Sender:Reply-To:Content-ID:Content-Description;
 bh=SGvFqJlge/g9dh6ag6oSj2PmPKQuD0q8zfCwNpSxj1k=; b=px+muzACVI4ZR8Qma6/M2w08SW
 hySuB9tKA02KzaeL7Bz0hXOlFit5cPmIV408Ey2/X6DSkMu6cgZOGJNeXNArmsoAsUoc5WLXe/hw7
 PUb7y3czjGD9CQNnzOug4xBpyyS7F1rtcwnMYwldVZcEKIxxjt8fEjtiOCtqBiv/YhL1hpiEkcC32
 +Ial0oM3ilDiy7b15NOERaI8soL0uKgf7Q1zCQdIIn1pdo7wE4v1udirhHNffI5G2FWCaDzt7pqmn
 Os3cuV4r/Vol0BRefFeWzgu2YZhyihiwy2DDv2Uyg5GiuU2bN2PxS+V9KP2uy1ZGZchyZTVXk6HhJ
 OTstc49w==;
Received: from [2601:1c0:6280:3f0::19c2] (helo=smtpauth.infradead.org)
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jPsOy-0007rZ-2e; Sat, 18 Apr 2020 18:41:16 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 3/9] input: fix empty-body warning in synaptics.c
Date: Sat, 18 Apr 2020 11:41:05 -0700
Message-Id: <20200418184111.13401-4-rdunlap@infradead.org>
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

../drivers/input/mouse/synaptics.c: In function ‘synaptics_process_packet’:
../drivers/input/mouse/synaptics.c:1106:6: warning: suggest braces around empty body in an ‘if’ statement [-Wempty-body]
      ;   /* Nothing, treat a pen as a single finger */
      ^

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org
Cc: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Andrew Morton <akpm@linux-foundation.org>
---
 drivers/input/mouse/synaptics.c |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

--- linux-next-20200327.orig/drivers/input/mouse/synaptics.c
+++ linux-next-20200327/drivers/input/mouse/synaptics.c
@@ -20,6 +20,7 @@
  * Trademarks are the property of their respective owners.
  */
 
+#include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/delay.h>
 #include <linux/dmi.h>
@@ -1103,7 +1104,7 @@ static void synaptics_process_packet(str
 				break;
 			case 2:
 				if (SYN_MODEL_PEN(info->model_id))
-					;   /* Nothing, treat a pen as a single finger */
+					do_empty(); /* Nothing, treat a pen as a single finger */
 				break;
 			case 4 ... 15:
 				if (SYN_CAP_PALMDETECT(info->capabilities))
