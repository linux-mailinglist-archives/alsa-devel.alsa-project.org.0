Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BAEA1AF83E
	for <lists+alsa-devel@lfdr.de>; Sun, 19 Apr 2020 09:40:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 766741671;
	Sun, 19 Apr 2020 09:39:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 766741671
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587282007;
	bh=yIjZ1P/+g0Fr23HKqwx3erS+mjDVTP5Pa7uWaboxA3c=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aOTf7JNBd+eYvBtBuNY54bhaoLVZ3KVGlpYUv4kXJofEcXnF8yzBErSTwr6GIsw1B
	 XM2J0EOfYHmU7X0GNoUa2dxz1pVBINwAxoywsAvGU5YM/O7nlUfA8x8P9KIBn5hyBN
	 JSQhfMp01ijiGHCapEiRRw2mbqO9UJTfDmKseYwQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 93D8AF801ED;
	Sun, 19 Apr 2020 09:38:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BAAEFF80240; Sat, 18 Apr 2020 20:44:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3BB0BF8012E
 for <alsa-devel@alsa-project.org>; Sat, 18 Apr 2020 20:44:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3BB0BF8012E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org
 header.b="XZDspZHL"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=tL7oBItZTGP6Ja0KJzj5epfoD8nvKm3R0ync/alPIPM=; b=XZDspZHLNEdieJauqz1tT3tU6E
 YTnCIpvp5xSBzMeKUYN/ZrY33Xv8ujXKOpRTHETYgjlXYNG9Bevf+VNJTem44EiEuHW7Kf02I1k/X
 SJhnpcUnJ6bRMlTie1XiEGAADIuP2UhPDajunCcwmIaLQ9R7A0f83xZxenWNGKa6FZUj7cMWrxEBg
 PSon0anIZCVaqUvfDbOlu0w9rllj/BKv5pm+pUXO24gnqsHCRmlgucoKgC2iB8Ur4nykcm4RDvIcd
 Z3/5U9tzWaeZCnR4s79Lw+eywQDgY2zp8dPurJQWwcNvxfQ7gTQUf4A+LyA8bN9q1CVLcYHJlvoR/
 44a0PpaA==;
Received: from willy by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1jPsRm-0008GS-2P; Sat, 18 Apr 2020 18:44:10 +0000
Date: Sat, 18 Apr 2020 11:44:09 -0700
From: Matthew Wilcox <willy@infradead.org>
To: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH 5/9] usb: fix empty-body warning in sysfs.c
Message-ID: <20200418184409.GP5820@bombadil.infradead.org>
References: <20200418184111.13401-1-rdunlap@infradead.org>
 <20200418184111.13401-6-rdunlap@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200418184111.13401-6-rdunlap@infradead.org>
X-Mailman-Approved-At: Sun, 19 Apr 2020 09:38:23 +0200
Cc: alsa-devel@alsa-project.org, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Zzy Wysm <zzy@zzywysm.com>, linux-kernel@vger.kernel.org,
 "J. Bruce Fields" <bfields@fieldses.org>, target-devel@vger.kernel.org,
 Dave Jiang <dave.jiang@intel.com>, linux-scsi@vger.kernel.org,
 linux-nvdimm@lists.01.org, Vishal Verma <vishal.l.verma@intel.com>,
 linux-input@vger.kernel.org, Alexander Viro <viro@zeniv.linux.org.uk>,
 Dan Williams <dan.j.williams@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>, linux-nfs@vger.kernel.org,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Chuck Lever <chuck.lever@oracle.com>,
 linux-fsdevel@vger.kernel.org, Johannes Berg <johannes@sipsolutions.net>,
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

On Sat, Apr 18, 2020 at 11:41:07AM -0700, Randy Dunlap wrote:
> +++ linux-next-20200327/drivers/usb/core/sysfs.c
> @@ -1263,7 +1263,7 @@ void usb_create_sysfs_intf_files(struct
>  	if (!alt->string && !(udev->quirks & USB_QUIRK_CONFIG_INTF_STRINGS))
>  		alt->string = usb_cache_string(udev, alt->desc.iInterface);
>  	if (alt->string && device_create_file(&intf->dev, &dev_attr_interface))
> -		;	/* We don't actually care if the function fails. */
> +		do_empty(); /* We don't actually care if the function fails. */
>  	intf->sysfs_files_created = 1;
>  }

Why not just?

+	if (alt->string)
+		device_create_file(&intf->dev, &dev_attr_interface);

