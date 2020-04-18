Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 313CF1AF3FD
	for <lists+alsa-devel@lfdr.de>; Sat, 18 Apr 2020 20:58:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C7D801677;
	Sat, 18 Apr 2020 20:57:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C7D801677
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587236301;
	bh=a13otnzlKU+jTEYYF0oGP+qmTmq6ReI6Pfk3xvUGvp8=;
	h=Subject:From:To:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=uBDrGFvpJGqH2OJxz/Um9mB1G+OiiOSkidOJo/Jk+dvtTSkwjm4tGKC5kMQZG9Cyn
	 KSbpIB6kTiaFPaUc7vG+5MJYTg/l2AOLGGokgy/DuskSf9zK5PxGsDoM/MHURCwb7e
	 hIKpr/sCx4wzySb3QCvfzvyTfVDQIFzDv9f4+W3Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 37ECCF80248;
	Sat, 18 Apr 2020 20:56:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F3FC7F80240; Sat, 18 Apr 2020 20:56:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=KHOP_HELO_FCRDNS,
 RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from smtprelay.hostedemail.com (smtprelay0171.hostedemail.com
 [216.40.44.171])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 207CAF8012E
 for <alsa-devel@alsa-project.org>; Sat, 18 Apr 2020 20:56:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 207CAF8012E
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay06.hostedemail.com (Postfix) with ESMTP id BBBA618018500;
 Sat, 18 Apr 2020 18:56:01 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-HE-Tag: money21_1707d78e8f515
X-Filterd-Recvd-Size: 3611
Received: from XPS-9350.home (unknown [47.151.136.130])
 (Authenticated sender: joe@perches.com)
 by omf03.hostedemail.com (Postfix) with ESMTPA;
 Sat, 18 Apr 2020 18:55:58 +0000 (UTC)
Message-ID: <6c796219ea79d87093409f2dd1d3bf8e4a157ed7.camel@perches.com>
Subject: Re: [PATCH 6/9] nfsd: fix empty-body warning in nfs4state.c
From: Joe Perches <joe@perches.com>
To: Chuck Lever <chuck.lever@oracle.com>, Randy Dunlap <rdunlap@infradead.org>
Date: Sat, 18 Apr 2020 11:53:44 -0700
In-Reply-To: <CDCF7717-7CBC-47CA-9E83-3A18ECB3AB89@oracle.com>
References: <20200418184111.13401-1-rdunlap@infradead.org>
 <20200418184111.13401-7-rdunlap@infradead.org>
 <CDCF7717-7CBC-47CA-9E83-3A18ECB3AB89@oracle.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Zzy Wysm <zzy@zzywysm.com>, LKML <linux-kernel@vger.kernel.org>,
 Bruce Fields <bfields@fieldses.org>, target-devel@vger.kernel.org,
 Dave Jiang <dave.jiang@intel.com>, linux-scsi@vger.kernel.org,
 linux-nvdimm@lists.01.org, Vishal Verma <vishal.l.verma@intel.com>,
 linux-input@vger.kernel.org, Al Viro <viro@zeniv.linux.org.uk>,
 Dan Williams <dan.j.williams@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linux NFS Mailing List <linux-nfs@vger.kernel.org>, "Martin K.
 Petersen" <martin.petersen@oracle.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, linux-fsdevel@vger.kernel.org,
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

On Sat, 2020-04-18 at 14:45 -0400, Chuck Lever wrote:
> > On Apr 18, 2020, at 2:41 PM, Randy Dunlap <rdunlap@infradead.org> wrote:
> > 
> > Fix gcc empty-body warning when -Wextra is used:
> > 
> > ../fs/nfsd/nfs4state.c:3898:3: warning: suggest braces around empty body in an ‘else’ statement [-Wempty-body]
> > 
> > Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> > Cc: Linus Torvalds <torvalds@linux-foundation.org>
> > Cc: Andrew Morton <akpm@linux-foundation.org>
> > Cc: "J. Bruce Fields" <bfields@fieldses.org>
> > Cc: Chuck Lever <chuck.lever@oracle.com>
> > Cc: linux-nfs@vger.kernel.org
> 
> I have a patch in my queue that addresses this particular warning,
> but your change works for me too.
> 
> Acked-by: Chuck Lever <chuck.lever@oracle.com>
> 
> Unless Bruce objects.
> 
> 
> > ---
> > fs/nfsd/nfs4state.c |    3 ++-
> > 1 file changed, 2 insertions(+), 1 deletion(-)
> > 
> > --- linux-next-20200417.orig/fs/nfsd/nfs4state.c
> > +++ linux-next-20200417/fs/nfsd/nfs4state.c
> > @@ -34,6 +34,7 @@
> > 
> > #include <linux/file.h>
> > #include <linux/fs.h>
> > +#include <linux/kernel.h>
> > #include <linux/slab.h>
> > #include <linux/namei.h>
> > #include <linux/swap.h>
> > @@ -3895,7 +3896,7 @@ nfsd4_setclientid(struct svc_rqst *rqstp
> > 		copy_clid(new, conf);
> > 		gen_confirm(new, nn);
> > 	} else /* case 4 (new client) or cases 2, 3 (client reboot): */
> > -		;
> > +		do_empty();
> > 	new->cl_minorversion = 0;
> > 	gen_callback(new, setclid, rqstp);
> > 	add_to_unconfirmed(new);

This empty else seems silly and could likely be better handled by
a comment above the first if, something like:

	/* for now only handle case 1: probable callback update */
	if (conf && same_verf(&conf->cl_verifier, &clverifier)) {
		copy_clid(new, conf);
		gen_confirm(new, nn);
	}

with no else use.


