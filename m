Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C730A4C9FE6
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Mar 2022 09:52:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7479E1F30;
	Wed,  2 Mar 2022 09:52:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7479E1F30
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646211172;
	bh=5S46misiV5xg6J2qMoLWRpz3C5+GIh/9wghBO0F2uDI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=F8/FN+T4KfNx+36m4e3VVxFZ9PlV8Lka8UEwmg7Bc+ZTxeSkO6YKFrW3xMJTB/qRQ
	 kgQpoO9FLuzrGr6+nd+4khVqtQbmSAybn9Q9cUQWEbuzDNScpd7Qy2czmm5BLrrY+j
	 0fVTaye080m28m1SB/3NgWbMBg+sNjom8dRSa/nw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 03DD9F80717;
	Wed,  2 Mar 2022 09:34:18 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 82E5FF8013C; Tue,  1 Mar 2022 01:58:13 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6D867F80054
 for <alsa-devel@alsa-project.org>; Tue,  1 Mar 2022 01:58:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6D867F80054
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=linux-foundation.org
 header.i=@linux-foundation.org header.b="avIYh8aQ"
Received: by mail-lf1-x131.google.com with SMTP id j7so24301217lfu.6
 for <alsa-devel@alsa-project.org>; Mon, 28 Feb 2022 16:58:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+UrwimTIhzKiU9pJv3o5X6bf+6FXMWBGxz+Z+GIIGDc=;
 b=avIYh8aQ2dDobwKAVUmxzj/7dS14/rGtEVGY0pMiaJUsHbP3qIU6kno3XMfBz/RlQM
 DBr9tOtZ8iqO/uKNwSujAwo9mle8zBl2HT1HDuvvvRH+Bqr8BYPzCJojUUOk2VYbR5wW
 hMzIeM3di7snjNNfrAaBZvtX47IfluwYB/RPY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+UrwimTIhzKiU9pJv3o5X6bf+6FXMWBGxz+Z+GIIGDc=;
 b=QTRivKTf0dfz/zp8JkN2JpvzcIU4A/KJjizXgufVpT94eYcVr2WImM+b+xsPkd5kBr
 JFWa4/t+iZRu0tSs6pjUvnd7eE+cJVbwWgSlDdxRjWaKfCkrAexe9MRAvNlh1EJgYQIQ
 PB3ZiqcqTf0bl8g/dPnoV0KKzBeDUBJbBXztGTDoyiOppAR5S9rhu68iN92YPbZRcqJB
 DjyQf9z7PSeWgceYH6S0nNuVrF/7JOySo+6zXAQWlkQ0GrwtBdLt42GyhBzoOQaatBRn
 AqHCnllkRxQlJOHWdifmumPDNi9aCfzJkwLPPWAMj1wMqwuq3aXMEBrPNoSgP7R87NaT
 HT+w==
X-Gm-Message-State: AOAM533hbP26Vlg0/FT6wplcQkJmAOtBSCmUnkA6p+T2+LxEo7wjxygJ
 jZPp6ZnWq1GLoM7yBSO6z/PV6O7fWWC4iFdhC6M=
X-Google-Smtp-Source: ABdhPJxkgwYvlxUOZBSx+vkZFRtolA+lQWpU9F3Wrhin8I8xtHpwXBlIdFLme15O08mMggu1wDTDWg==
X-Received: by 2002:a05:6512:3054:b0:443:95b2:d795 with SMTP id
 b20-20020a056512305400b0044395b2d795mr14310012lfb.605.1646096286115; 
 Mon, 28 Feb 2022 16:58:06 -0800 (PST)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com.
 [209.85.167.50]) by smtp.gmail.com with ESMTPSA id
 a23-20020ac25057000000b00443974b9bffsm1209348lfm.218.2022.02.28.16.58.03
 for <alsa-devel@alsa-project.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Feb 2022 16:58:04 -0800 (PST)
Received: by mail-lf1-f50.google.com with SMTP id g39so24242336lfv.10
 for <alsa-devel@alsa-project.org>; Mon, 28 Feb 2022 16:58:03 -0800 (PST)
X-Received: by 2002:a05:6512:3042:b0:437:96f5:e68a with SMTP id
 b2-20020a056512304200b0043796f5e68amr14803965lfb.449.1646096282839; Mon, 28
 Feb 2022 16:58:02 -0800 (PST)
MIME-Version: 1.0
References: <20220228110822.491923-1-jakobkoschel@gmail.com>
 <20220228110822.491923-3-jakobkoschel@gmail.com>
 <2e4e95d6-f6c9-a188-e1cd-b1eae465562a@amd.com>
 <CAHk-=wgQps58DPEOe4y5cTh5oE9EdNTWRLXzgMiETc+mFX7jzw@mail.gmail.com>
 <CAHk-=wj8fkosQ7=bps5K+DDazBXk=ypfn49A0sEq+7-nZnyfXA@mail.gmail.com>
 <CAHk-=wiTCvLQkHcJ3y0hpqH7FEk9D28LDvZZogC6OVLk7naBww@mail.gmail.com>
 <Yh0tl3Lni4weIMkl@casper.infradead.org>
 <CAHk-=wgBfJ1-cPA2LTvFyyy8owpfmtCuyiZi4+um8DhFNe+CyA@mail.gmail.com>
 <Yh1aMm3hFe/j9ZbI@casper.infradead.org>
 <CAHk-=wi0gSUMBr2SVF01Gy1xC1w1iGtJT5ztju9BPWYKjdh+NA@mail.gmail.com>
In-Reply-To: <CAHk-=wi0gSUMBr2SVF01Gy1xC1w1iGtJT5ztju9BPWYKjdh+NA@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 28 Feb 2022 16:57:46 -0800
X-Gmail-Original-Message-ID: <CAHk-=whqJmCZ+VHTJPwsHYc1YNNEvWS7=ukqGKfBxcBYAToAkw@mail.gmail.com>
Message-ID: <CAHk-=whqJmCZ+VHTJPwsHYc1YNNEvWS7=ukqGKfBxcBYAToAkw@mail.gmail.com>
Subject: Re: [PATCH 2/6] treewide: remove using list iterator after loop body
 as a ptr
To: Matthew Wilcox <willy@infradead.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Wed, 02 Mar 2022 09:33:36 +0100
Cc: linux-wireless <linux-wireless@vger.kernel.org>,
 alsa-devel@alsa-project.org, KVM list <kvm@vger.kernel.org>,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>, linux-iio@vger.kernel.org,
 nouveau@lists.freedesktop.org, Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Cristiano Giuffrida <c.giuffrida@vu.nl>, "Bos, H.J." <h.j.bos@vu.nl>,
 linux1394-devel@lists.sourceforge.net, drbd-dev@lists.linbit.com,
 linux-arch <linux-arch@vger.kernel.org>, CIFS <linux-cifs@vger.kernel.org>,
 linux-aspeed@lists.ozlabs.org, linux-scsi <linux-scsi@vger.kernel.org>,
 linux-rdma <linux-rdma@vger.kernel.org>, linux-staging@lists.linux.dev,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 intel-wired-lan@lists.osuosl.org, kgdb-bugreport@lists.sourceforge.net,
 bcm-kernel-feedback-list@broadcom.com,
 Dan Carpenter <dan.carpenter@oracle.com>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 Kees Cook <keescook@chromium.org>, Arnd Bergman <arnd@arndb.de>,
 Linux PM <linux-pm@vger.kernel.org>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 Brian Johannesmeyer <bjohannesmeyer@gmail.com>,
 Nathan Chancellor <nathan@kernel.org>, dma <dmaengine@vger.kernel.org>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Jakob Koschel <jakobkoschel@gmail.com>, v9fs-developer@lists.sourceforge.net,
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
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
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

On Mon, Feb 28, 2022 at 4:45 PM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> Yeah, except that's ugly beyond belief, plus it's literally not what
> we do in the kernel.

(Of course, I probably shouldn't have used 'min()' as an example,
because that is actually one of the few places where we do exactly
that, using our __UNIQUE_ID() macros. Exactly because people _have_
tried to do -Wshadow when doing W=2).

                 Linus
