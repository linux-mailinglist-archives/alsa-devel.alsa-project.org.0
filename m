Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 17EAD1AF3B4
	for <lists+alsa-devel@lfdr.de>; Sat, 18 Apr 2020 20:47:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B5538166F;
	Sat, 18 Apr 2020 20:47:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B5538166F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587235675;
	bh=V2wPFHzOw/b7V2UWmlY+Ltk+4v0SDRhrQK5E6poS3dk=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DDdZIeMtdY4LzKVFZmsXNieDKp9fL88P0tWq4RdVkP+UtNEp+PmXDS+FfOmWImNTp
	 EpOzXl140rPw6C/mmIeGmyDPNB6xM1rRR72l9MIbPWwYkYzXQ4m98Aai+fyyizbmwj
	 /2LgcqGI2QyQ194AiP7BQ/ztXqj3LkFAzkklYmts=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3DD48F802E1;
	Sat, 18 Apr 2020 20:41:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 74918F8013D; Sat, 18 Apr 2020 20:41:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B53D4F80248
 for <alsa-devel@alsa-project.org>; Sat, 18 Apr 2020 20:41:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B53D4F80248
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org
 header.b="pyHV1Yju"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
 To:From:Sender:Reply-To:Content-ID:Content-Description;
 bh=8++U0J0JftLda//wkFlmbDic7vW6wvPQj9vRP451qyE=; b=pyHV1YjuYgoOSvT5iNE2Y7QesB
 NXrQxVgUayq4HjgeqKsk2tapY3tZ0T5adrg2tRGVb9UDxjDW8Ymr23ZQvkVi+4TN/ycZwkIUkaudG
 oGMqI5Zd6s+C1gyru6NOrS5ZFX1JqPWuYEb45qk0a5RAHpEztnjpgk8xMtaZ2YEB2mXtj14HUzOUk
 LVAd8pg4/P6e1JpzKE3ulBSzOtFhS8JXHt+oL461ce4TL035IHm65XTXUhN54RnOcQ2jZv7YhSCS+
 V6nVFKIksP8CDgK7V6ubm5iolAEN2qiHG681gjIL3NBvd9hAfq4bMBMyPZ7R3p3jHd0ZxUtJLl1rc
 SIUUC5lg==;
Received: from [2601:1c0:6280:3f0::19c2] (helo=smtpauth.infradead.org)
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jPsP0-0007rZ-CC; Sat, 18 Apr 2020 18:41:18 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 5/9] usb: fix empty-body warning in sysfs.c
Date: Sat, 18 Apr 2020 11:41:07 -0700
Message-Id: <20200418184111.13401-6-rdunlap@infradead.org>
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

../drivers/usb/core/sysfs.c: In function ‘usb_create_sysfs_intf_files’:
../drivers/usb/core/sysfs.c:1266:3: warning: suggest braces around empty body in an ‘if’ statement [-Wempty-body]
   ; /* We don't actually care if the function fails. */
   ^

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
Cc: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Andrew Morton <akpm@linux-foundation.org>
---
 drivers/usb/core/sysfs.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- linux-next-20200327.orig/drivers/usb/core/sysfs.c
+++ linux-next-20200327/drivers/usb/core/sysfs.c
@@ -1263,7 +1263,7 @@ void usb_create_sysfs_intf_files(struct
 	if (!alt->string && !(udev->quirks & USB_QUIRK_CONFIG_INTF_STRINGS))
 		alt->string = usb_cache_string(udev, alt->desc.iInterface);
 	if (alt->string && device_create_file(&intf->dev, &dev_attr_interface))
-		;	/* We don't actually care if the function fails. */
+		do_empty(); /* We don't actually care if the function fails. */
 	intf->sysfs_files_created = 1;
 }
 
