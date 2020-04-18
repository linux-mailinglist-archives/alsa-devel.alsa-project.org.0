Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AD901AF3AC
	for <lists+alsa-devel@lfdr.de>; Sat, 18 Apr 2020 20:47:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0A435166D;
	Sat, 18 Apr 2020 20:46:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0A435166D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587235639;
	bh=6l+z9h+fyHhIrvgIcJDDwXMG/kVpkTM1CGga7dCXfKQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MOqLCsFwCxFeS2VRx03jffwD5Gm8zyE23v2ruVT0JIQDNTrE6JsrUFcNrzxpm6n9L
	 kx/2OCOvgn5lhCP9t5UKSD0FNqQPHutHW0807FT7iHcPBCTMcnaCBkuTcCyCd2b+aG
	 mNGN9vHkHWrAd9oMPgh+4HPVOg2C9krWhPmxM9ig=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6C878F802DC;
	Sat, 18 Apr 2020 20:41:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4E5FAF8014E; Sat, 18 Apr 2020 20:41:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 61E92F8013D
 for <alsa-devel@alsa-project.org>; Sat, 18 Apr 2020 20:41:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 61E92F8013D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org
 header.b="RZ4Q2VGM"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
 To:From:Sender:Reply-To:Content-ID:Content-Description;
 bh=g1ONOf6MGj3aToaUeBLhJbF3d+tY5CMeHHoXTtmPNsE=; b=RZ4Q2VGMoE1Bka/a+kMpugnl6V
 WMVry8MWAMKA0AfBSRZP5GbN9pJJeG4gjR6sud7qBmDPy8K3i6BprqmwPWH5lOuW2gqRr/Z6Cm0gD
 LgdYYpcS7u+9zN1adQU6TRExKq4DBbaLs/fZ8BFQwxY4cbSn3IER0BNxv3UJFdqify3T+1KdTD2Qi
 vrHfuHPH4Z0QFf2MXKCGJ5k6d3bNzMgrjkWWTemljZSz/KV2Pcv1AoZFf0+EUry4IuzRrudoMMT/C
 ei8L5wfK4u7V/ulhuTnRRFf6mMeS0g5tdTHkmzzebQf9iIBlwwM0f/XqpVSnBSOE3/pCfTfbCtZ3f
 SvwQIVLw==;
Received: from [2601:1c0:6280:3f0::19c2] (helo=smtpauth.infradead.org)
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jPsOw-0007rZ-8d; Sat, 18 Apr 2020 18:41:14 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Subject: [RFC PATCH 1/9] kernel.h: add do_empty() macro
Date: Sat, 18 Apr 2020 11:41:03 -0700
Message-Id: <20200418184111.13401-2-rdunlap@infradead.org>
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

Add the do_empty() macro to silence gcc warnings about an empty body
following an "if" statement when -Wextra is used.

However, for debug printk calls that are being disabled, use either
no_printk() or pr_debug() [and optionally dynamic printk debugging]
instead.

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>
Cc: linux-fsdevel@vger.kernel.org
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org
Cc: Jaroslav Kysela <perex@perex.cz>
Cc: Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
Cc: "J. Bruce Fields" <bfields@fieldses.org>
Cc: Chuck Lever <chuck.lever@oracle.com>
Cc: linux-nfs@vger.kernel.org
Cc: Johannes Berg <johannes@sipsolutions.net>
Cc: Dan Williams <dan.j.williams@intel.com>
Cc: Vishal Verma <vishal.l.verma@intel.com>
Cc: Dave Jiang <dave.jiang@intel.com>
Cc: linux-nvdimm@lists.01.org
Cc: "Martin K. Petersen" <martin.petersen@oracle.com>
Cc: linux-scsi@vger.kernel.org
Cc: target-devel@vger.kernel.org
Cc: Zzy Wysm <zzy@zzywysm.com>
---
 include/linux/kernel.h |    8 ++++++++
 1 file changed, 8 insertions(+)

--- linux-next-20200327.orig/include/linux/kernel.h
+++ linux-next-20200327/include/linux/kernel.h
@@ -40,6 +40,14 @@
 #define READ			0
 #define WRITE			1
 
+/*
+ * When using -Wextra, an "if" statement followed by an empty block
+ * (containing only a ';'), produces a warning from gcc:
+ * warning: suggest braces around empty body in an ‘if’ statement [-Wempty-body]
+ * Replace the empty body with do_empty() to silence this warning.
+ */
+#define do_empty()		do { } while (0)
+
 /**
  * ARRAY_SIZE - get the number of elements in array @arr
  * @arr: array to be sized
