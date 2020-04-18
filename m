Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 78D6F1AF3F2
	for <lists+alsa-devel@lfdr.de>; Sat, 18 Apr 2020 20:57:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E02631676;
	Sat, 18 Apr 2020 20:56:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E02631676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587236255;
	bh=EsoNIyw53b+Su18wZ/HhqYx525Bl0vkHrQil9p2VruE=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PWo5B9IeX+6O+PQCliBDRmQROaz1fpbU/fOjEPM/Ay9pnDp7NEZ54bVMdyQaa3Lwr
	 hNueK1ITkDq6ZB/4HAjHA1L1n+S7P+wzWpzH8WQpKrDDD0pzM5DMw+FDLU/jx13qzN
	 ICMHUkshccPCXvHocts4oyVtB/3A1ubQDc50CfPw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 11E98F80122;
	Sat, 18 Apr 2020 20:55:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 10B5AF8012E; Sat, 18 Apr 2020 20:55:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2F22AF8012E
 for <alsa-devel@alsa-project.org>; Sat, 18 Apr 2020 20:55:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2F22AF8012E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org
 header.b="ZSd4gPvR"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=Fw5l4YeyjM9q5bGtc9HETB0eI3KSL+di5A5JibSeUVA=; b=ZSd4gPvRX+1EcEyWBtmo2xeq+k
 YGKz4bmzRQ0lBLMGURF5oh6CYWK4W10L7kKdDnAI5hJvRsl3/cWENuwUZYgrll4QOeY8IG2KAIwKm
 DmODoHeVwqhNbpPD2mueD4eauFer8yFIuqk42bawnd9he64bV/jQfHVxkRxNmOAMcICHspMdvF49L
 mwjxdxSsr1vLxgUV9OSBDAPsxY5sxHKI3ovi3k6+D0MPLbEOgd5u2ipYWdww6+1xj13RRsP3BbZTP
 5/uu3l5yRFjedkT+1vldVo7jjG4LvH/c3xDAix8dZm74bZ5+P4Sk4RUlA1MpmcdYVcPWYAQRtLCOh
 CMd3C1UQ==;
Received: from [2601:1c0:6280:3f0::19c2]
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jPscv-0000Nr-Nv; Sat, 18 Apr 2020 18:55:41 +0000
Subject: Re: [PATCH 2/9] fs: fix empty-body warning in posix_acl.c
To: Linus Torvalds <torvalds@linux-foundation.org>
References: <20200418184111.13401-1-rdunlap@infradead.org>
 <20200418184111.13401-3-rdunlap@infradead.org>
 <CAHk-=wjSzuTyyBkmMDG4fx_sXzLJsh+9Xk-ubgbpJzJq_kzPsA@mail.gmail.com>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <722a746a-1438-60e3-04b2-c13eda2ad168@infradead.org>
Date: Sat, 18 Apr 2020 11:55:38 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <CAHk-=wjSzuTyyBkmMDG4fx_sXzLJsh+9Xk-ubgbpJzJq_kzPsA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Zzy Wysm <zzy@zzywysm.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "J. Bruce Fields" <bfields@fieldses.org>,
 target-devel <target-devel@vger.kernel.org>, Dave Jiang <dave.jiang@intel.com>,
 linux-scsi <linux-scsi@vger.kernel.org>,
 linux-nvdimm <linux-nvdimm@lists.01.org>,
 Vishal Verma <vishal.l.verma@intel.com>, linux-input@vger.kernel.org,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Dan Williams <dan.j.williams@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>, "open list:NFS, SUNRPC,
 AND..." <linux-nfs@vger.kernel.org>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Chuck Lever <chuck.lever@oracle.com>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 Johannes Berg <johannes@sipsolutions.net>
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

On 4/18/20 11:53 AM, Linus Torvalds wrote:
> On Sat, Apr 18, 2020 at 11:41 AM Randy Dunlap <rdunlap@infradead.org> wrote:
>>
>> Fix gcc empty-body warning when -Wextra is used:
> 
> Please don't do this.
> 
> First off, "do_empty()" adds nothing but confusion. Now it
> syntactically looks like it does something, and it's a new pattern to
> everybody. I've never seen it before.
> 
> Secondly, even if we were to do this, then the patch would be wrong:
> 
>>         if (cmpxchg(p, ACL_NOT_CACHED, sentinel) != ACL_NOT_CACHED)
>> -               /* fall through */ ;
>> +               do_empty(); /* fall through */
> 
> That comment made little sense before, but it makes _no_ sense now.
> 
> What fall-through? I'm guessing it meant to say "nothing", and
> somebody was confused. With "do_empty()", it's even more confusing.
> 
> Thirdly, there's a *reason* why "-Wextra" isn't used.
> 
> The warnings enabled by -Wextra are usually complete garbage, and
> trying to fix them often makes the code worse. Exactly like here.

OK, no problem.  That's why PATCH 0/9 says RFC.

Oops. Crap. It was *supposed* to say RFC. :(

-- 
~Randy

