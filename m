Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D1484F11FA
	for <lists+alsa-devel@lfdr.de>; Mon,  4 Apr 2022 11:28:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D6EC616D1;
	Mon,  4 Apr 2022 11:27:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D6EC616D1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649064495;
	bh=8ok03ds9Z6xnDBcfANKQ6JWrZaqBB4snAkQON0VXCHE=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=j/mBSfjZYW2WHDb6b2o3AAzyWEM03gq5QIa1d9jl2B1e5FKVJBVgbMqZjka9/Bes2
	 FW94CRx93HmTaHUVRbkiq4pKQc7YdF6De97Vv0jLsCJW5xaFZkXgWOKHiXfRnaK5on
	 1OE/FdVX2hlLN9wW0nJuX9XQ3eBm2lIJ0lHni1Bs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 283F4F800D1;
	Mon,  4 Apr 2022 11:27:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 68764F80162; Mon,  4 Apr 2022 11:27:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail105.syd.optusnet.com.au (mail105.syd.optusnet.com.au
 [211.29.132.249])
 by alsa1.perex.cz (Postfix) with ESMTP id 2357FF8010B
 for <alsa-devel@alsa-project.org>; Mon,  4 Apr 2022 11:27:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2357FF8010B
Received: from dread.disaster.area (pa49-180-43-123.pa.nsw.optusnet.com.au
 [49.180.43.123])
 by mail105.syd.optusnet.com.au (Postfix) with ESMTPS id 29B8410E55FB;
 Mon,  4 Apr 2022 19:26:57 +1000 (AEST)
Received: from dave by dread.disaster.area with local (Exim 4.92.3)
 (envelope-from <david@fromorbit.com>)
 id 1nbIz9-00Dc5C-Sq; Mon, 04 Apr 2022 19:26:55 +1000
Date: Mon, 4 Apr 2022 19:26:55 +1000
From: Dave Chinner <david@fromorbit.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: Build regressions/improvements in v5.18-rc1
Message-ID: <20220404092655.GR1544202@dread.disaster.area>
References: <CAHk-=wg6FWL1xjVyHx7DdjD2dHZETA5_=FqqW17Z19X-WTfWSg@mail.gmail.com>
 <20220404074734.1092959-1-geert@linux-m68k.org>
 <alpine.DEB.2.22.394.2204041006230.1941618@ramsan.of.borg>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.22.394.2204041006230.1941618@ramsan.of.borg>
X-Optus-CM-Score: 0
X-Optus-CM-Analysis: v=2.4 cv=VuxAv86n c=1 sm=1 tr=0 ts=624ab9e5
 a=MV6E7+DvwtTitA3W+3A2Lw==:117 a=MV6E7+DvwtTitA3W+3A2Lw==:17
 a=kj9zAlcOel0A:10 a=z0gMJWrwH1QA:10 a=6Fu7hv2xAAAA:8 a=7-415B0cAAAA:8
 a=L05BbbQJD6-TbP0LrSsA:9 a=CjuIK1q_8ugA:10 a=OCr_TKDY-yBPQKLGgHr3:22
 a=biEYGPWJfzWAr4FL6Ov7:22
Cc: linux-wireless@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-usb@vger.kernel.org, linux-scsi@vger.kernel.org,
 linux-parisc@vger.kernel.org,
 Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>,
 linux-rdma@vger.kernel.org, netdev@vger.kernel.org,
 Mike Marciniszyn <mike.marciniszyn@cornelisnetworks.com>,
 linux-um@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-xfs@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org, linux-serial@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-s390@vger.kernel.org,
 linux-media@vger.kernel.org
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

On Mon, Apr 04, 2022 at 10:16:08AM +0200, Geert Uytterhoeven wrote:
> On Mon, 4 Apr 2022, Geert Uytterhoeven wrote:
> > Below is the list of build error/warning regressions/improvements in
> > v5.18-rc1[1] compared to v5.17[2].
> > 
> > Summarized:
> >  - build errors: +36/-15
> >  - build warnings: +5/-38
> > 
> > Happy fixing! ;-)

Well....

> >  + /kisskb/src/fs/xfs/xfs_buf.h: error: initializer element is not constant:  => 46:23

Looking at:

http://kisskb.ellerman.id.au/kisskb/buildresult/14714961/

The build error is:

/kisskb/src/fs/xfs/./xfs_trace.h:432:2: note: in expansion of macro 'TP_printk'
  TP_printk("dev %d:%d daddr 0x%llx bbcount 0x%x hold %d pincount %d "
  ^
/kisskb/src/fs/xfs/./xfs_trace.h:440:5: note: in expansion of macro '__print_flags'
     __print_flags(__entry->flags, "|", XFS_BUF_FLAGS),
     ^
/kisskb/src/fs/xfs/xfs_buf.h:67:4: note: in expansion of macro 'XBF_UNMAPPED'
  { XBF_UNMAPPED,  "UNMAPPED" }
    ^
/kisskb/src/fs/xfs/./xfs_trace.h:440:40: note: in expansion of macro 'XFS_BUF_FLAGS'
     __print_flags(__entry->flags, "|", XFS_BUF_FLAGS),
                                        ^
/kisskb/src/fs/xfs/./xfs_trace.h: In function 'trace_raw_output_xfs_buf_flags_class':
/kisskb/src/fs/xfs/xfs_buf.h:46:23: error: initializer element is not constant
 #define XBF_UNMAPPED  (1 << 31)/* do not map the buffer */

This doesn't make a whole lotta sense to me. It's blown up in a
tracepoint macro in XFS that was not changed at all in 5.18-rc1, nor
was any of the surrounding XFS code or contexts.  Perhaps something
outside XFS changed to cause this on these platforms?

Can you bisect this, please?

Cheers,

Dave.
-- 
Dave Chinner
david@fromorbit.com
