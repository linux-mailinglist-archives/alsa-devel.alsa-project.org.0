Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B0F3B4C9F87
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Mar 2022 09:42:12 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5032A1B32;
	Wed,  2 Mar 2022 09:41:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5032A1B32
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646210532;
	bh=tbro1CjlBKP/R8y7Wa27noCyXd9eGjFIrR0Ok1yiLe0=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tddL0tIvp+Yt+QzogILdMZSxm3biMJVRsLXuhVuzIxCpCK1+Dbd5A/7tVf5MnC6Ak
	 9ASxchAPyE0OYDYn/cL3zw9pG4Vq1IlTYH4MfS7/a1Ymz/9mgVBX9cbkiG/91TBNvn
	 U62Ov9GyuvhP68DISXyXHmEguj5NeSIT2vwT7FbA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3DE5DF805D8;
	Wed,  2 Mar 2022 09:33:56 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 21850F80125; Mon, 28 Feb 2022 12:22:43 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from nautica.notk.org (ipv6.notk.org [IPv6:2001:41d0:1:7a93::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E2225F80125
 for <alsa-devel@alsa-project.org>; Mon, 28 Feb 2022 12:22:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E2225F80125
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=codewreck.org header.i=@codewreck.org
 header.b="KzQ5VK5b"; 
 dkim=pass (2048-bit key) header.d=codewreck.org header.i=@codewreck.org
 header.b="E7ShsxTd"
Received: by nautica.notk.org (Postfix, from userid 108)
 id 17E29C01B; Mon, 28 Feb 2022 12:22:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=codewreck.org; s=2;
 t=1646047354; bh=nbIjFrzgDVTmB4SrJnZGd7fIFmdwChwe2lL83Uag4us=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KzQ5VK5bfQJ50dqk23dxDjUwDDK7TA/irQD0Z9CNQKb+g550mz4220rMxu0PuRkB0
 zSH1KEphDNBJ7hKNULh8KlQjyIdBHOs8MI/nUYoPBmpLppCasulnFAsrKdaEXzwMTJ
 IwpM9+gWlHHqb/G70sMsoon8bZGjqe3igvlHvXWdB+dQG/WEtTlWyekznVAIp4LN7e
 b5pg6TDJ9pKPwGgBdsioef4sXDvyaKtcCCYy35g3YAfKpCdoJctnMsERag3cdTSjTi
 8bbBH2/ntqNttGvGikrePwX+5MLUaZ7SwFWR8e1TQHG1akbelVXWBNaL48rZXDJvyO
 7HTqyJ/PLNd5Q==
Received: from odin.codewreck.org (localhost [127.0.0.1])
 by nautica.notk.org (Postfix) with ESMTPS id 6162EC009;
 Mon, 28 Feb 2022 12:22:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=codewreck.org; s=2;
 t=1646047353; bh=nbIjFrzgDVTmB4SrJnZGd7fIFmdwChwe2lL83Uag4us=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=E7ShsxTdVoGEbpDYFF27HXnsiskOzo+90fWYK/YK/pcgewcio/aI2ukKBbk8Ggf8c
 PSXNNRohBAnroHDgJmzD26WOCBS51v3CgaeWJoVRlz3gzi1Wk2c722FgVeG9ZC8Gq1
 VxeMBZJsJJ2s49Z0zkRuzCFT0FdEMmJ4Jlg8so5xUNkI1Pmhr9T77hNpqbhc5MUSIm
 Vf9CZqLUP+U5LMthWxqmxcIfa+qcI6C/HHTtBGWVbD6UPJLDQeI2MK30nqaJN3mP3G
 MxeZ4iTWnejwYcukxHfaPz9ZlYf9Zxp1r7k3O+mRBYZR8EPZsNImCl3hToWu78+1r5
 3QpJ5t/64l3TQ==
Received: from localhost (odin.codewreck.org [local])
 by odin.codewreck.org (OpenSMTPD) with ESMTPA id 8186bc45;
 Mon, 28 Feb 2022 11:22:16 +0000 (UTC)
Date: Mon, 28 Feb 2022 20:22:01 +0900
From: Dominique Martinet <asmadeus@codewreck.org>
To: Jakob Koschel <jakobkoschel@gmail.com>
Subject: Re: [PATCH 6/6] treewide: remove check of list iterator against head
 past the loop body
Message-ID: <YhywWTEIY7UnCYtL@codewreck.org>
References: <20220228110822.491923-1-jakobkoschel@gmail.com>
 <20220228110822.491923-7-jakobkoschel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220228110822.491923-7-jakobkoschel@gmail.com>
X-Mailman-Approved-At: Wed, 02 Mar 2022 09:33:33 +0100
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
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 tipc-discussion@lists.sourceforge.net, linux-crypto@vger.kernel.org,
 netdev@vger.kernel.org, dmaengine@vger.kernel.org,
 linux-mediatek@lists.infradead.org, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org, Mike Rapoport <rppt@kernel.org>
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

This is a bit more work (and a lot more noise), but I'd prefer if
this were split into as many patches as there are components.

I'm not going to review the parts of the patches that don't concern me,
and if something turns out to be a problem later one (it shouldn't but
one never knows) it'll be much easier to revert or put the blame on an
individual smaller commit than on this...

With that being said, ultimately I don't care that much and will leave
that to people who do :)

Jakob Koschel wrote on Mon, Feb 28, 2022 at 12:08:22PM +0100:
>  net/9p/trans_xen.c                            | 11 +++--

This 9p change looks good to me.

Reviewed-by: Dominique Martinet <asmadeus@codewreck.org> # 9p

-- 
Dominique
