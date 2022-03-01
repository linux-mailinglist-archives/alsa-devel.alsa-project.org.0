Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 368894CA024
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Mar 2022 09:59:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D1A352090;
	Wed,  2 Mar 2022 09:58:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D1A352090
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646211565;
	bh=DKL/ABmIwfzeiFmo0hhW2ZU2PYI0XORRCwqJ8kHAMfQ=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AdkBr2+AnbWj13hR+bMlLhiVrzdfzQ4V2UVLas77uvPL9pmBeEd5AaSdSRAdE8H4I
	 1ZzQ6JbEILU7tl5XimoWASUwXCygkMcRVciCckF/xk8iw/pUoagGV/1YAzmdh+BGY/
	 hki3VWxgSxChUWl0lTbF06I6xWNN8QeRdbV+phjA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1926BF80844;
	Wed,  2 Mar 2022 09:34:31 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 408BAF80227; Tue,  1 Mar 2022 19:21:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [IPv6:2607:f8b0:4864:20::1029])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B5656F80095
 for <alsa-devel@alsa-project.org>; Tue,  1 Mar 2022 19:21:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B5656F80095
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="kbDptrdu"
Received: by mail-pj1-x1029.google.com with SMTP id
 iq13-20020a17090afb4d00b001bc4437df2cso2953381pjb.2
 for <alsa-devel@alsa-project.org>; Tue, 01 Mar 2022 10:21:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=fds8Vu27HO3VizdZYZX37G2L0kdPjlGJwjydpAC62lk=;
 b=kbDptrdu0f26KgjbD0o2z38w3lkKGDPgX1iTHeFHCTnyp8GdCq5qMftyKUSBh6duUj
 WfNj/A6u5i3SYTvNHtilrjGbJ7XPB9BN5cThiWBPQtUhCrDH1721OqL04qTC03fUauzy
 3YHA9gzqSMuaks5H7GdDPribo7C8kJL0W2A2s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=fds8Vu27HO3VizdZYZX37G2L0kdPjlGJwjydpAC62lk=;
 b=OQqXuZMOGCH5gemubFHvc98i+IDPKuGdtsLqmfEgQoc0jC0rh5SV4DGa0DPC6zCFlP
 45d7E+Yc7EakWGOm5135jxzBPkdobCW/295PLn01qK4TAkgZuJ9GDB/N2bu231rPz/1g
 ni9qQWhD2tHLyUZCTRiTWnUX4r+/OnQDjBM81jqJCSOye2Zdhi6omCow15//cV/jbkZp
 CBR9UV/37katERGtkpMrriEZBH4//bMQqEvGu1eTOCIqMjlmDkwWkBIx3S1ae7aJMdgj
 h5ldyhxGwd8CuqVFO/DH65des/7aWmw9NGaLYhBxeB/MRAbxSnFhDa1zEEn2f7xi+K8f
 NO9g==
X-Gm-Message-State: AOAM5310s/b7BSKEId/0lpZSgBnou2AA50FEwaMraAa+5GjnzU8Wg6yx
 3pWBVvyI4WcUNGWJbcPwsuqHOoGKBhv7Pg==
X-Google-Smtp-Source: ABdhPJxFvMPIFzTXAIIVPlg/eGuYakalp78L+LNg6VrEL06CzJLvdAz6UlqMRKRHGibjFN8E9JB6yg==
X-Received: by 2002:a17:90b:4d86:b0:1bd:223f:6cb5 with SMTP id
 oj6-20020a17090b4d8600b001bd223f6cb5mr16669777pjb.151.1646158885116; 
 Tue, 01 Mar 2022 10:21:25 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id
 oa2-20020a17090b1bc200b001bcff056f09sm2678996pjb.13.2022.03.01.10.21.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Mar 2022 10:21:24 -0800 (PST)
Date: Tue, 1 Mar 2022 10:21:24 -0800
From: Kees Cook <keescook@chromium.org>
To: Jakob Koschel <jakobkoschel@gmail.com>
Subject: Re: [PATCH 2/6] treewide: remove using list iterator after loop body
 as a ptr
Message-ID: <202203011016.48A181EE50@keescook>
References: <20220228110822.491923-1-jakobkoschel@gmail.com>
 <20220228110822.491923-3-jakobkoschel@gmail.com>
 <2e4e95d6-f6c9-a188-e1cd-b1eae465562a@amd.com>
 <CAHk-=wgQps58DPEOe4y5cTh5oE9EdNTWRLXzgMiETc+mFX7jzw@mail.gmail.com>
 <CAHk-=wj8fkosQ7=bps5K+DDazBXk=ypfn49A0sEq+7-nZnyfXA@mail.gmail.com>
 <CAHk-=wiTCvLQkHcJ3y0hpqH7FEk9D28LDvZZogC6OVLk7naBww@mail.gmail.com>
 <FC710A1A-524E-481B-A668-FC258F529A2E@gmail.com>
 <CAHk-=whLK11HyvpUtEftOjc3Gup2V77KpAQ2fycj3uai=qceHw@mail.gmail.com>
 <CEDAD0D9-56EE-4105-9107-72C2EAD940B0@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CEDAD0D9-56EE-4105-9107-72C2EAD940B0@gmail.com>
X-Mailman-Approved-At: Wed, 02 Mar 2022 09:33:35 +0100
Cc: linux-wireless <linux-wireless@vger.kernel.org>,
 alsa-devel@alsa-project.org, KVM list <kvm@vger.kernel.org>,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>, linux-iio@vger.kernel.org,
 nouveau@lists.freedesktop.org, Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Cristiano Giuffrida <c.giuffrida@vu.nl>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 linux1394-devel@lists.sourceforge.net, drbd-dev@lists.linbit.com,
 linux-arch <linux-arch@vger.kernel.org>, CIFS <linux-cifs@vger.kernel.org>,
 linux-aspeed@lists.ozlabs.org, linux-scsi <linux-scsi@vger.kernel.org>,
 linux-rdma <linux-rdma@vger.kernel.org>, linux-staging@lists.linux.dev, "Bos,
 H.J." <h.j.bos@vu.nl>, Jason Gunthorpe <jgg@ziepe.ca>,
 intel-wired-lan@lists.osuosl.org, kgdb-bugreport@lists.sourceforge.net,
 bcm-kernel-feedback-list@broadcom.com,
 Dan Carpenter <dan.carpenter@oracle.com>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 Arnd Bergman <arnd@arndb.de>, Linux PM <linux-pm@vger.kernel.org>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Brian Johannesmeyer <bjohannesmeyer@gmail.com>,
 Nathan Chancellor <nathan@kernel.org>, dma <dmaengine@vger.kernel.org>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 v9fs-developer@lists.sourceforge.net,
 linux-tegra <linux-tegra@vger.kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-sgx@vger.kernel.org,
 linux-block <linux-block@vger.kernel.org>, Netdev <netdev@vger.kernel.org>,
 linux-usb@vger.kernel.org, samba-technical@lists.samba.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux F2FS Dev Mailing List <linux-f2fs-devel@lists.sourceforge.net>,
 tipc-discussion@lists.sourceforge.net,
 Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 linux-mediatek@lists.infradead.org, Andrew Morton <akpm@linux-foundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
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

On Tue, Mar 01, 2022 at 12:28:15PM +0100, Jakob Koschel wrote:
> Based on the coccinelle script there are ~480 cases that need fixing
> in total. I'll now finish all of them and then split them by
> submodules as Greg suggested and repost a patch set per submodule.
> Sounds good?

To help with this splitting, see:
https://github.com/kees/kernel-tools/blob/trunk/split-on-maintainer

It's not perfect, but it'll get you really close. For example, if you
had a single big tree-wide patch applied to your tree:

$ rm 0*.patch
$ git format-patch -1 HEAD
$ mv 0*.patch treewide.patch
$ split-on-maintainer treewide.patch
$ ls 0*.patch

If you have a build log before the patch that spits out warnings, the
--build-log argument can extract those warnings on a per-file basis, too
(though this can be fragile).

-- 
Kees Cook
