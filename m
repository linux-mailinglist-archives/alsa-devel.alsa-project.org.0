Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E2351AF3CA
	for <lists+alsa-devel@lfdr.de>; Sat, 18 Apr 2020 20:51:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BFD081675;
	Sat, 18 Apr 2020 20:51:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BFD081675
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587235913;
	bh=9ITDjCN+DMGTcs8GHEzEQ+pHcQ26TGkj1ZzApmWLLm0=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ELY2klEwDP7QuTTlsJDQVwc8kSFmDjAZ2UErtQG0xRiU1i7/MhHx2e9smCIqPVGAb
	 YY3cL7U+CJVK/GohbRe8Fw3Z6JNjp67tQPeFossQVYxrzL2GBidsna7tUBQeGM0E3x
	 vouHIIPKBIDpQhRqbqx8GaGNmMf7fWqv+RdGfOVk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 07867F8013D;
	Sat, 18 Apr 2020 20:50:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A17A9F8014E; Sat, 18 Apr 2020 20:50:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 261EDF8012E
 for <alsa-devel@alsa-project.org>; Sat, 18 Apr 2020 20:50:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 261EDF8012E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org
 header.b="s8O9bLPQ"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=na4bJ3PkcifD0nFgc5n3XvGryFaz89gkoFznEG5QSiA=; b=s8O9bLPQ3/PwyhlXG8w8qqYbwq
 sTtpsGIripwqUAVAAsu2nj/XCKxMas3tSgjRxl3gHNtvArdEj1uffO6xT7tPA3EqF9wmB93jjToSn
 N4K9MdbnF1AhlTs/5V0mo2YU4ioGpwniS9b7RLbThV642vvH0Oaw4DQvAXombZAy6nkuiqaTG5ZtZ
 3ETZbMbDXUb4qlER1RXVuV+nxpkl9G+aWvUaDQqrcR0Iyoie1anJryeuc5zYhk4x+UQ4IP5g9eBoV
 vQvnY/lULm5KVOhnO0YdeCnzPEXXBNqZu/Zs1RAWjA3aKwPFfzK/pLRb/7u0sH8oOF7NyLx+KXYAJ
 bRYCu/FA==;
Received: from [2601:1c0:6280:3f0::19c2]
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jPsXQ-0003BB-Ls; Sat, 18 Apr 2020 18:50:00 +0000
Subject: Re: [RFC PATCH 1/9] kernel.h: add do_empty() macro
To: Joe Perches <joe@perches.com>, linux-kernel@vger.kernel.org
References: <20200418184111.13401-1-rdunlap@infradead.org>
 <20200418184111.13401-2-rdunlap@infradead.org>
 <6bb8d99e6e56fa1622fc7238c1ae37c3b3510ded.camel@perches.com>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <3990866b-3331-560d-e5e3-6b51ae51c1e2@infradead.org>
Date: Sat, 18 Apr 2020 11:49:58 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <6bb8d99e6e56fa1622fc7238c1ae37c3b3510ded.camel@perches.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Zzy Wysm <zzy@zzywysm.com>, "J. Bruce Fields" <bfields@fieldses.org>,
 target-devel@vger.kernel.org, Dave Jiang <dave.jiang@intel.com>,
 linux-scsi@vger.kernel.org, linux-nvdimm@lists.01.org,
 Vishal Verma <vishal.l.verma@intel.com>, linux-input@vger.kernel.org,
 Alexander Viro <viro@zeniv.linux.org.uk>,
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

On 4/18/20 11:44 AM, Joe Perches wrote:
> On Sat, 2020-04-18 at 11:41 -0700, Randy Dunlap wrote:
>> Add the do_empty() macro to silence gcc warnings about an empty body
>> following an "if" statement when -Wextra is used.
>>
>> However, for debug printk calls that are being disabled, use either
>> no_printk() or pr_debug() [and optionally dynamic printk debugging]
>> instead.
> []
>> +#define do_empty()		do { } while (0)
> 
> If this is really useful
> (I think the warning is somewhat silly)
> 
> bikeshed:
> 
> I think do_nothing() is more descriptive

Yes, I do too, as I more or less mentioned in the cover letter.

-- 
~Randy

