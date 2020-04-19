Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E69FF1AF8B0
	for <lists+alsa-devel@lfdr.de>; Sun, 19 Apr 2020 10:17:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7FE4F1671;
	Sun, 19 Apr 2020 10:17:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7FE4F1671
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587284275;
	bh=ZUDEa4WQUEZoTfuHfSu48MHh6xoge7xkQTGLj33K3lE=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VcAn3NioGZ9kkwrVqsxfU+xEAclMJjafllH6Zyzhpe/TyJBK6t1kvQoqQG5mbLHvW
	 ZCj+m8VblPEa7VKGGR4lzumPKXvkn1W1DFOhBKimxoaiKY/+oi1o1MveAV9PzYxKoH
	 pdqn9Z2mI7ysYyX8f+5oe9vtDu1KeYUurKijGaS0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9811BF800E7;
	Sun, 19 Apr 2020 10:16:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E5466F801EC; Sun, 19 Apr 2020 10:16:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RDNS_NONE,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from bombadil.infradead.org (unknown [IPv6:2607:7c80:54:e::133])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2AB92F800E7
 for <alsa-devel@alsa-project.org>; Sun, 19 Apr 2020 10:16:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2AB92F800E7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org
 header.b="pvwx1GcX"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=5ESkbM+8vdIgFeaQKLQyxVIJU96HxbIdvJ6LQfSPcow=; b=pvwx1GcXIeC3t5uPawsWBkdVHQ
 iiXxl+0atw1Ow7dCeTaEPlV5pGZmU5NeEHgiD6GauX1slXAECXQsFNE9NMWu2519ywz/b+wff/WOX
 TMC/+MPMdjO3TT0Rftrna/Ci0Cahq1lB09MN0hgPjg6UlZQSvFQvI8Hl6eF9ZnaIwxOSfJg5ri8Io
 KIuagSQHqNGIuLyx0OKk7Kr7BqpWFvOxOSCJWQS71I0fmCgMrFQjcaFVpza7oTJ7VbiVVU4LRpdAF
 8xATbPDeZWMvxCY4UHfmtjy1TJqqQqEx8Dbn+J6I61UlAQZJU8HDszvtYFjQWk5yWngyPZTufulmD
 TFNoMHog==;
Received: from hch by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1jQ57G-0008EZ-Na; Sun, 19 Apr 2020 08:15:50 +0000
Date: Sun, 19 Apr 2020 01:15:50 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH 8/9] dax: fix empty-body warnings in bus.c
Message-ID: <20200419081550.GA22341@infradead.org>
References: <20200418184111.13401-1-rdunlap@infradead.org>
 <20200418184111.13401-9-rdunlap@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200418184111.13401-9-rdunlap@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
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

On Sat, Apr 18, 2020 at 11:41:10AM -0700, Randy Dunlap wrote:
>  				rc = -ENOMEM;
>  		} else
> -			/* nothing to remove */;
> +			do_empty(); /* nothing to remove */
>  	} else if (action == ID_REMOVE) {
>  		list_del(&dax_id->list);
>  		kfree(dax_id);
>  	} else
> -		/* dax_id already added */;
> +		do_empty(); /* dax_id already added */

This is just nasty.  Please just always turn this bogus warning off
as the existing code is a perfectly readable idiom while the new code
is just nasty crap for no good reason at all.
