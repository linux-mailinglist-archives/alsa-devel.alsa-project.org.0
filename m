Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D22721AF3B7
	for <lists+alsa-devel@lfdr.de>; Sat, 18 Apr 2020 20:49:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8037B15E0;
	Sat, 18 Apr 2020 20:48:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8037B15E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587235789;
	bh=5ymsXNiuHyrMfrARiiIgk9s3jHf+ieH2hrciNDNB9Ts=;
	h=Subject:From:To:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BSAkEWFXB/tPls6LTgD/FGo88wIy4m/c8boeyVhytyuEJpH6TNhkgsguRYGQal+8b
	 eGfvEf2/BQZizujF8qnhkpRbjpa73/5RGnYzfJz7b5hj2pmLJrWcIfBZgurA88wfur
	 +6iyjT7WIu3qqbR3czzZXBn2uQ7fBSGoseNgY40g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DA416F8028B;
	Sat, 18 Apr 2020 20:47:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6F718F8028C; Sat, 18 Apr 2020 20:47:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=KHOP_HELO_FCRDNS,
 RCVD_IN_MSPIKE_H3, RCVD_IN_MSPIKE_WL, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from smtprelay.hostedemail.com (smtprelay0093.hostedemail.com
 [216.40.44.93])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C6D70F8028A
 for <alsa-devel@alsa-project.org>; Sat, 18 Apr 2020 20:47:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C6D70F8028A
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay05.hostedemail.com (Postfix) with ESMTP id 3F8761802EC1C;
 Sat, 18 Apr 2020 18:47:01 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-HE-Tag: loss63_59e6ce4dc9051
X-Filterd-Recvd-Size: 2163
Received: from XPS-9350.home (unknown [47.151.136.130])
 (Authenticated sender: joe@perches.com)
 by omf12.hostedemail.com (Postfix) with ESMTPA;
 Sat, 18 Apr 2020 18:46:57 +0000 (UTC)
Message-ID: <6bb8d99e6e56fa1622fc7238c1ae37c3b3510ded.camel@perches.com>
Subject: Re: [RFC PATCH 1/9] kernel.h: add do_empty() macro
From: Joe Perches <joe@perches.com>
To: Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org
Date: Sat, 18 Apr 2020 11:44:43 -0700
In-Reply-To: <20200418184111.13401-2-rdunlap@infradead.org>
References: <20200418184111.13401-1-rdunlap@infradead.org>
 <20200418184111.13401-2-rdunlap@infradead.org>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
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

On Sat, 2020-04-18 at 11:41 -0700, Randy Dunlap wrote:
> Add the do_empty() macro to silence gcc warnings about an empty body
> following an "if" statement when -Wextra is used.
> 
> However, for debug printk calls that are being disabled, use either
> no_printk() or pr_debug() [and optionally dynamic printk debugging]
> instead.
[]
> +#define do_empty()		do { } while (0)

If this is really useful
(I think the warning is somewhat silly)

bikeshed:

I think do_nothing() is more descriptive


