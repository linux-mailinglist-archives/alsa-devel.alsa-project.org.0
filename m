Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C8424CA01C
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Mar 2022 09:58:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 084F42018;
	Wed,  2 Mar 2022 09:57:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 084F42018
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646211500;
	bh=pTV2MFZ+7d07p5uTbhq3otIc2cmXwQTMtR9OmiTt6ws=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SZXn6lT7u5z7rkO2RSY9FlQcNDyzAYfd62GQ4Ls4PRzi2U7v3smauDnktJ3olyjKb
	 fNwonEs8gzMe1wA0Thduv5TXQkX+xdUloywIYEEj3ZQRRu3fj5zyhqzXye8Cui095M
	 N4LmfbYZYqKIWp11hSiYHNgPgToPh2h0WcbfwBtw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EA83DF80807;
	Wed,  2 Mar 2022 09:34:28 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5A82DF80227; Tue,  1 Mar 2022 18:37:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODYSUB_1,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4F4C5F80054
 for <alsa-devel@alsa-project.org>; Tue,  1 Mar 2022 18:37:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4F4C5F80054
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=linuxfoundation.org
 header.i=@linuxfoundation.org header.b="kpCJZz+2"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 531B4B81BE7;
 Tue,  1 Mar 2022 17:37:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 071ADC340EE;
 Tue,  1 Mar 2022 17:37:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1646156241;
 bh=pTV2MFZ+7d07p5uTbhq3otIc2cmXwQTMtR9OmiTt6ws=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=kpCJZz+2kmNYzjHFDfNSN8QomXtdcPSo3VhSYDe/9DvnLjw6+Gf8JZk1Z8B7/MpEr
 7jyq5w6VtMe9h/eDSvv1UXjGNGEtGZwH42GPuJGwpwQgnv9I5iH7DWZlof3+dZGTFm
 esB5bRgUOyJTALvSP9KXHdoyU5cCbTmKTmS3YsdQ=
Date: Tue, 1 Mar 2022 18:37:16 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Jakob Koschel <jakobkoschel@gmail.com>
Subject: Re: [PATCH 2/6] treewide: remove using list iterator after loop body
 as a ptr
Message-ID: <Yh5ZzNQQQE8rIexy@kroah.com>
References: <20220228110822.491923-1-jakobkoschel@gmail.com>
 <20220228110822.491923-3-jakobkoschel@gmail.com>
 <Yhyv42ONIxTj04mg@kroah.com>
 <79FCD5F4-0EBA-4E3F-8B3F-D450BBA10367@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <79FCD5F4-0EBA-4E3F-8B3F-D450BBA10367@gmail.com>
X-Mailman-Approved-At: Wed, 02 Mar 2022 09:33:35 +0100
Cc: alsa-devel@alsa-project.org, linux-aspeed@lists.ozlabs.org,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>, linux-iio@vger.kernel.org,
 nouveau@lists.freedesktop.org, Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 dri-devel@lists.freedesktop.org, Cristiano Giuffrida <c.giuffrida@vu.nl>,
 amd-gfx@lists.freedesktop.org, samba-technical@lists.samba.org,
 linux1394-devel@lists.sourceforge.net, drbd-dev@lists.linbit.com,
 linux-arch <linux-arch@vger.kernel.org>, linux-cifs@vger.kernel.org,
 kvm@vger.kernel.org, linux-scsi@vger.kernel.org, linux-rdma@vger.kernel.org,
 linux-staging@lists.linux.dev, "Bos, H.J." <h.j.bos@vu.nl>,
 Jason Gunthorpe <jgg@ziepe.ca>, intel-wired-lan@lists.osuosl.org,
 kgdb-bugreport@lists.sourceforge.net, bcm-kernel-feedback-list@broadcom.com,
 Dan Carpenter <dan.carpenter@oracle.com>, linux-media@vger.kernel.org,
 Kees Cook <keescook@chromium.org>, Arnd Bergman <arnd@arndb.de>,
 linux-pm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 Brian Johannesmeyer <bjohannesmeyer@gmail.com>,
 Nathan Chancellor <nathan@kernel.org>, linux-fsdevel@vger.kernel.org,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 v9fs-developer@lists.sourceforge.net, linux-tegra@vger.kernel.org,
 Thomas Gleixner <tglx@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-arm-kernel@lists.infradead.org, linux-sgx@vger.kernel.org,
 linux-block@vger.kernel.org, Linus Torvalds <torvalds@linux-foundation.org>,
 linux-usb@vger.kernel.org, linux-wireless@vger.kernel.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net, tipc-discussion@lists.sourceforge.net,
 linux-crypto@vger.kernel.org, netdev@vger.kernel.org,
 dmaengine@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 Mike Rapoport <rppt@kernel.org>
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

On Mon, Feb 28, 2022 at 01:06:57PM +0100, Jakob Koschel wrote:
> 
> 
> > On 28. Feb 2022, at 12:20, Greg KH <gregkh@linuxfoundation.org> wrote:
> > 
> > On Mon, Feb 28, 2022 at 12:08:18PM +0100, Jakob Koschel wrote:
> >> If the list does not contain the expected element, the value of
> >> list_for_each_entry() iterator will not point to a valid structure.
> >> To avoid type confusion in such case, the list iterator
> >> scope will be limited to list_for_each_entry() loop.
> >> 
> >> In preparation to limiting scope of a list iterator to the list traversal
> >> loop, use a dedicated pointer to point to the found element.
> >> Determining if an element was found is then simply checking if
> >> the pointer is != NULL.
> >> 
> >> Signed-off-by: Jakob Koschel <jakobkoschel@gmail.com>
> >> ---
> >> arch/x86/kernel/cpu/sgx/encl.c       |  6 +++--
> >> drivers/scsi/scsi_transport_sas.c    | 17 ++++++++-----
> >> drivers/thermal/thermal_core.c       | 38 ++++++++++++++++++----------
> >> drivers/usb/gadget/configfs.c        | 22 ++++++++++------
> >> drivers/usb/gadget/udc/max3420_udc.c | 11 +++++---
> >> drivers/usb/gadget/udc/tegra-xudc.c  | 11 +++++---
> >> drivers/usb/mtu3/mtu3_gadget.c       | 11 +++++---
> >> drivers/usb/musb/musb_gadget.c       | 11 +++++---
> >> drivers/vfio/mdev/mdev_core.c        | 11 +++++---
> >> 9 files changed, 88 insertions(+), 50 deletions(-)
> > 
> > The drivers/usb/ portion of this patch should be in patch 1/X, right?
> 
> I kept them separate since it's a slightly different case.
> Using 'ptr' instead of '&ptr->other_member'. Regardless, I'll split
> this commit up as you mentioned.
> 
> > 
> > Also, you will have to split these up per-subsystem so that the
> > different subsystem maintainers can take these in their trees.
> 
> Thanks for the feedback.
> To clarify I understand you correctly:
> I should do one patch set per-subsystem with every instance/(file?)
> fixed as a separate commit?

Yes, each file needs a different commit as they are usually all written
or maintained by different people.

As I said in my other response, if you need any help with this, just let
me know, I'm glad to help.

thanks,

greg k-h
