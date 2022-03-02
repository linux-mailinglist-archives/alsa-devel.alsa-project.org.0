Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B3C84CB771
	for <lists+alsa-devel@lfdr.de>; Thu,  3 Mar 2022 08:06:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3F8221A00;
	Thu,  3 Mar 2022 08:06:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3F8221A00
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646291212;
	bh=DL5vRNcM9aJ5Ee/SCMrOl6kP/WBfCGqRrazJ05EWnmg=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BJFWwdpYamG4fR85/L25ZcDV0TPGT4XzPdGvP+uljcVP6qDPT47VL1v/FFeOgdhhA
	 5EZdosXqlXYaxLPAAC8184o4BzcoFm2O99hCi8RdhaoQlt2M+zNnZph6hEE6jrZkxy
	 cCpobf2KSLDo2Jj0oKiPV2PRkS6MWTE4R8MCgzbs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A6876F80534;
	Thu,  3 Mar 2022 08:03:33 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 409EDF801D5; Wed,  2 Mar 2022 21:59:39 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com
 [IPv6:2607:f8b0:4864:20::52f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 76BAAF80054
 for <alsa-devel@alsa-project.org>; Wed,  2 Mar 2022 21:59:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 76BAAF80054
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="d2ZFN7Fz"
Received: by mail-pg1-x52f.google.com with SMTP id o23so2638061pgk.13
 for <alsa-devel@alsa-project.org>; Wed, 02 Mar 2022 12:59:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=R/oQqieG0aXWXHs93Td97reRxAIjZoSgBmUtDJFVhjU=;
 b=d2ZFN7FzXJICmnX4Tyt0wAx0nHny3V7g7RBF7BzoFi4JqvMjvTlFe6r9CSmtZHYpfY
 sI7cCbacBhQSn0c2nYjk/wWGRSWn9quhJSSynH9lMYRKPPdVW/LYlF+HQ4F3tfS4GoN+
 rfxT6gA9HHGJJFfNnOWheyqKpysRyPxkd0f8U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=R/oQqieG0aXWXHs93Td97reRxAIjZoSgBmUtDJFVhjU=;
 b=LTf+MZRN+Yu0GfN+FvsJyrnLJHG/pm1pXzjxWDVI8YRnFJqMMv4ZmcFBLSm1gjojOc
 /oH//piqJYuNyDK5DIhCj2iazvjHlUB346OVLvstoqqhgRHCuBayiLIeqKPnsaVu5FS2
 l3vQ97IjsCRZQFOXBPwowjT8XzB28Aljc0ssEA3NdxxMVYeaX0jqzabGL968JBlkawQC
 ax3kXQSq2sag8vZkFuF8qPA5dvuYqGxN34hiutw8X/GYRMyyk1o1BV9j6v/iVG6Z8PSX
 BuK+geikcXlvQ+jLCZ1EzTR8BjAgxGPOkNoZ3yvS7zK7a5JQCGUerFaWy1RjwKn4fHpC
 RRZw==
X-Gm-Message-State: AOAM531YAao0GhnKlN8uOVBedD+HCtYGJyyf6kn33IlAkgQftNLBO/v5
 mPbfnTo46xhYNAqHSHWUvHAnPg==
X-Google-Smtp-Source: ABdhPJwV5Vftpu3BNFYOd1YAI3xcgBfQbmCq2DPnKYT59xnVma61vCMoUamoUdgwMbiUWTPibOctJw==
X-Received: by 2002:a63:595e:0:b0:378:b203:a74e with SMTP id
 j30-20020a63595e000000b00378b203a74emr13280856pgm.328.1646254769698; 
 Wed, 02 Mar 2022 12:59:29 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id
 z9-20020a655a49000000b00373459df190sm58337pgs.35.2022.03.02.12.59.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Mar 2022 12:59:29 -0800 (PST)
Date: Wed, 2 Mar 2022 12:59:28 -0800
From: Kees Cook <keescook@chromium.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [PATCH 2/6] treewide: remove using list iterator after loop body
 as a ptr
Message-ID: <202203021256.69D7C4BCA6@keescook>
References: <7D0C2A5D-500E-4F38-AD0C-A76E132A390E@kernel.org>
 <73fa82a20910c06784be2352a655acc59e9942ea.camel@HansenPartnership.com>
 <CAHk-=wiT5HX6Kp0Qv4ZYK_rkq9t5fZ5zZ7vzvi6pub9kgp=72g@mail.gmail.com>
 <7dc860874d434d2288f36730d8ea3312@AcuMS.aculab.com>
 <CAHk-=whKqg89zu4T95+ctY-hocR6kDArpo2qO14-kV40Ga7ufw@mail.gmail.com>
 <0ced2b155b984882b39e895f0211037c@AcuMS.aculab.com>
 <CAHk-=wix0HLCBs5sxAeW3uckg0YncXbTjMsE-Tv8WzmkOgLAXQ@mail.gmail.com>
 <78ccb184-405e-da93-1e02-078f90d2b9bc@rasmusvillemoes.dk>
 <202203021158.DB5204A0@keescook>
 <CAHk-=wikKPC0LUqZ8++EC5JOvGdBqVH9uUaTX=DvBioDoReYww@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=wikKPC0LUqZ8++EC5JOvGdBqVH9uUaTX=DvBioDoReYww@mail.gmail.com>
X-Mailman-Approved-At: Thu, 03 Mar 2022 08:03:24 +0100
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
 "linux-iio@vger.kernel.org" <linux-iio@vger.kernel.org>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 James Bottomley <James.Bottomley@hansenpartnership.com>,
 Cristiano Giuffrida <c.giuffrida@vu.nl>, "Bos, H.J." <h.j.bos@vu.nl>,
 "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>,
 "linux1394-devel@lists.sourceforge.net"
 <linux1394-devel@lists.sourceforge.net>,
 "drbd-dev@lists.linbit.com" <drbd-dev@lists.linbit.com>,
 linux-arch <linux-arch@vger.kernel.org>, CIFS <linux-cifs@vger.kernel.org>,
 KVM list <kvm@vger.kernel.org>, linux-scsi <linux-scsi@vger.kernel.org>,
 linux-rdma <linux-rdma@vger.kernel.org>,
 "linux-staging@lists.linux.dev" <linux-staging@lists.linux.dev>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 "intel-wired-lan@lists.osuosl.org" <intel-wired-lan@lists.osuosl.org>,
 "kgdb-bugreport@lists.sourceforge.net" <kgdb-bugreport@lists.sourceforge.net>,
 "bcm-kernel-feedback-list@broadcom.com"
 <bcm-kernel-feedback-list@broadcom.com>,
 Dan Carpenter <dan.carpenter@oracle.com>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 Arnd Bergman <arnd@arndb.de>, Linux PM <linux-pm@vger.kernel.org>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 Brian Johannesmeyer <bjohannesmeyer@gmail.com>,
 Nathan Chancellor <nathan@kernel.org>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Jakob Koschel <jakobkoschel@gmail.com>,
 "v9fs-developer@lists.sourceforge.net" <v9fs-developer@lists.sourceforge.net>,
 linux-tegra <linux-tegra@vger.kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 "linux-sgx@vger.kernel.org" <linux-sgx@vger.kernel.org>,
 linux-block <linux-block@vger.kernel.org>, Netdev <netdev@vger.kernel.org>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 linux-wireless <linux-wireless@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux F2FS Dev Mailing List <linux-f2fs-devel@lists.sourceforge.net>,
 David Laight <David.Laight@aculab.com>,
 "tipc-discussion@lists.sourceforge.net"
 <tipc-discussion@lists.sourceforge.net>,
 Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
 dma <dmaengine@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
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

On Wed, Mar 02, 2022 at 12:18:45PM -0800, Linus Torvalds wrote:
> On Wed, Mar 2, 2022 at 12:07 PM Kees Cook <keescook@chromium.org> wrote:
> >
> > I've long wanted to change kfree() to explicitly set pointers to NULL on
> > free. https://github.com/KSPP/linux/issues/87
> 
> We've had this discussion with the gcc people in the past, and gcc
> actually has some support for it, but it's sadly tied to the actual
> function name (ie gcc has some special-casing for "free()")
> 
> See
> 
>     https://gcc.gnu.org/bugzilla/show_bug.cgi?id=94527
> 
> for some of that discussion.
> 
> Oh, and I see some patch actually got merged since I looked there last
> so that you can mark "deallocator" functions, but I think it's only
> for the context matching, not for actually killing accesses to the
> pointer afterwards.

Ah! I missed that getting added in GCC 11. But yes, there it is:

https://gcc.gnu.org/onlinedocs/gcc/Common-Function-Attributes.html#index-malloc-function-attribute

Hah, now we may need to split __malloc from __alloc_size. ;)

I'd still like the NULL assignment behavior, though, since some things
can easily avoid static analysis.

-- 
Kees Cook
