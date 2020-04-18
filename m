Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 638241AF404
	for <lists+alsa-devel@lfdr.de>; Sat, 18 Apr 2020 20:59:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 11B34167D;
	Sat, 18 Apr 2020 20:58:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 11B34167D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587236360;
	bh=Bv6Bkf8b1+I9/IReMTbHed/kL6+Wfd742fbyE3NOyTA=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Vop0Q6b9Wt7ZstXkyDcvbxzAyk3sCLfvgQpgby0jiC1qba98Rn5ArhwKWSfoiKDlh
	 z79yNyw89zDQ7Z3W6lW+8Sat5yyttpe/ezphWmtRUOkJH2CaC3s/cXdsz1LAkjmVRt
	 o3OwJcyGrGhmGFX0To6y/gteQCKbg80pThGUX/Mk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 22236F8021E;
	Sat, 18 Apr 2020 20:57:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9C655F8016F; Sat, 18 Apr 2020 20:57:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6EC50F80122
 for <alsa-devel@alsa-project.org>; Sat, 18 Apr 2020 20:57:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6EC50F80122
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org
 header.b="KyiJJMam"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=v6goMSiM3JqD5eRdn45ZDeyVAxJCt3W7fqpeEGrJJtc=; b=KyiJJMamxfOIjVFL72tLsYD7re
 sd31vDw2o9XAGj4cjlL0iY4LlaG6HfVp+RX/eAnF8cs7BFGA7rm1P50OIDl4CJaSxdZP9IFpIodWa
 qKFndBfM+66S0aonynhdQTK/wJPSVS1Y4GHEToI5QjfeKxEM5UcdrBqdzJ3gwI+cd+itnETKujVao
 no3xr+EdUuBl8Nn1gwFz9atcofq1XkfodTx5dSOb3avPvgI/1CgyqkUdIR/uY0+1yXAWS0ASg6Ion
 xZd3LmWJA+40BpAwWMUlGbYNQaWIgBlBDowZN86RmjMlnIBdG8kobJ5e86SBZIZs/svVAtt0wyDuC
 yjEBGuCw==;
Received: from [2601:1c0:6280:3f0::19c2]
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jPseh-0000VM-7j; Sat, 18 Apr 2020 18:57:31 +0000
Subject: Re: [PATCH 6/9] nfsd: fix empty-body warning in nfs4state.c
To: Joe Perches <joe@perches.com>, Chuck Lever <chuck.lever@oracle.com>
References: <20200418184111.13401-1-rdunlap@infradead.org>
 <20200418184111.13401-7-rdunlap@infradead.org>
 <CDCF7717-7CBC-47CA-9E83-3A18ECB3AB89@oracle.com>
 <6c796219ea79d87093409f2dd1d3bf8e4a157ed7.camel@perches.com>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <c13ddc03-dfb4-9664-ce38-fc56389b67cd@infradead.org>
Date: Sat, 18 Apr 2020 11:57:28 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <6c796219ea79d87093409f2dd1d3bf8e4a157ed7.camel@perches.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Zzy Wysm <zzy@zzywysm.com>, LKML <linux-kernel@vger.kernel.org>,
 Bruce Fields <bfields@fieldses.org>, target-devel@vger.kernel.org,
 Dave Jiang <dave.jiang@intel.com>, linux-scsi@vger.kernel.org,
 linux-nvdimm@lists.01.org, Vishal Verma <vishal.l.verma@intel.com>,
 linux-input@vger.kernel.org, Al Viro <viro@zeniv.linux.org.uk>,
 Dan Williams <dan.j.williams@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linux NFS Mailing List <linux-nfs@vger.kernel.org>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
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

On 4/18/20 11:53 AM, Joe Perches wrote:
> On Sat, 2020-04-18 at 14:45 -0400, Chuck Lever wrote:
>>> On Apr 18, 2020, at 2:41 PM, Randy Dunlap <rdunlap@infradead.org> wrote:
>>>
>>> Fix gcc empty-body warning when -Wextra is used:
>>>
>>> ../fs/nfsd/nfs4state.c:3898:3: warning: suggest braces around empty body in an ‘else’ statement [-Wempty-body]
>>>
>>> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
>>> Cc: Linus Torvalds <torvalds@linux-foundation.org>
>>> Cc: Andrew Morton <akpm@linux-foundation.org>
>>> Cc: "J. Bruce Fields" <bfields@fieldses.org>
>>> Cc: Chuck Lever <chuck.lever@oracle.com>
>>> Cc: linux-nfs@vger.kernel.org
>>
>> I have a patch in my queue that addresses this particular warning,
>> but your change works for me too.
>>
>> Acked-by: Chuck Lever <chuck.lever@oracle.com>
>>
>> Unless Bruce objects.
>>
>>
>>> ---
>>> fs/nfsd/nfs4state.c |    3 ++-
>>> 1 file changed, 2 insertions(+), 1 deletion(-)
>>>
>>> --- linux-next-20200417.orig/fs/nfsd/nfs4state.c
>>> +++ linux-next-20200417/fs/nfsd/nfs4state.c
>>> @@ -34,6 +34,7 @@
>>>
>>> #include <linux/file.h>
>>> #include <linux/fs.h>
>>> +#include <linux/kernel.h>
>>> #include <linux/slab.h>
>>> #include <linux/namei.h>
>>> #include <linux/swap.h>
>>> @@ -3895,7 +3896,7 @@ nfsd4_setclientid(struct svc_rqst *rqstp
>>> 		copy_clid(new, conf);
>>> 		gen_confirm(new, nn);
>>> 	} else /* case 4 (new client) or cases 2, 3 (client reboot): */
>>> -		;
>>> +		do_empty();
>>> 	new->cl_minorversion = 0;
>>> 	gen_callback(new, setclid, rqstp);
>>> 	add_to_unconfirmed(new);
> 
> This empty else seems silly and could likely be better handled by
> a comment above the first if, something like:
> 
> 	/* for now only handle case 1: probable callback update */
> 	if (conf && same_verf(&conf->cl_verifier, &clverifier)) {
> 		copy_clid(new, conf);
> 		gen_confirm(new, nn);
> 	}
> 
> with no else use.

I'll just let Chuck handle it with his current patch,
whatever it is.

thanks.
-- 
~Randy

