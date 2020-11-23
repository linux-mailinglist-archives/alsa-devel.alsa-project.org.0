Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 896A12C2E44
	for <lists+alsa-devel@lfdr.de>; Tue, 24 Nov 2020 18:17:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 31B9F176F;
	Tue, 24 Nov 2020 18:17:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 31B9F176F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1606238279;
	bh=+EDGs3PYzl3z47JpXWUueALZlElPDdJywkYLk/HcIjg=;
	h=Subject:From:To:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WnAVONpX7dGknXBtRSJOhSPZlTCsQkU9cdOqapk2R4bNZD+5IseK+k9Jkcgs9aidb
	 YM7nQdVZcjYi/MY26d7M2Q/uwNSpCOf/liGOiLFCsJCrZwzH+LDuv5rRSkKOJyodmV
	 KpSc9LGmKppX8ZPQxaUIBGTDupjm9MvLfhk9tAkY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 979EDF8061F;
	Tue, 24 Nov 2020 17:58:55 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 224CAF80255; Mon, 23 Nov 2020 21:38:14 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from bedivere.hansenpartnership.com (bedivere.hansenpartnership.com
 [IPv6:2607:fcd0:100:8a00::2])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AC7C3F8015B
 for <alsa-devel@alsa-project.org>; Mon, 23 Nov 2020 21:38:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AC7C3F8015B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=hansenpartnership.com
 header.i=@hansenpartnership.com header.b="Tyy0xQy0"; 
 dkim=pass (1024-bit key) header.d=hansenpartnership.com
 header.i=@hansenpartnership.com header.b="Tyy0xQy0"
Received: from localhost (localhost [127.0.0.1])
 by bedivere.hansenpartnership.com (Postfix) with ESMTP id 81FC7128092C;
 Mon, 23 Nov 2020 12:38:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=hansenpartnership.com; s=20151216; t=1606163883;
 bh=+EDGs3PYzl3z47JpXWUueALZlElPDdJywkYLk/HcIjg=;
 h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
 b=Tyy0xQy0htMQEdpfMUvFUuPG04g7ZXvYvYsCjWoq+QOlUp2WQfo8Vk+CnXXw5nkQT
 a3Wz7+ONj/4K4WJ6m4qOiNdEl9e5tbHlW07s/zxEoMhv+eMdbQKfvYZ25zqNb6Olj/
 onXIz2W3FBWOnXIoTYXwnsUNPzdRLL+aS2e3QsY4=
Received: from bedivere.hansenpartnership.com ([127.0.0.1])
 by localhost (bedivere.hansenpartnership.com [127.0.0.1]) (amavisd-new,
 port 10024)
 with ESMTP id Fm687JPabQpA; Mon, 23 Nov 2020 12:38:03 -0800 (PST)
Received: from jarvis.int.hansenpartnership.com (unknown
 [IPv6:2601:600:8280:66d1::527])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by bedivere.hansenpartnership.com (Postfix) with ESMTPSA id EBC5C128091E;
 Mon, 23 Nov 2020 12:37:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=hansenpartnership.com; s=20151216; t=1606163883;
 bh=+EDGs3PYzl3z47JpXWUueALZlElPDdJywkYLk/HcIjg=;
 h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
 b=Tyy0xQy0htMQEdpfMUvFUuPG04g7ZXvYvYsCjWoq+QOlUp2WQfo8Vk+CnXXw5nkQT
 a3Wz7+ONj/4K4WJ6m4qOiNdEl9e5tbHlW07s/zxEoMhv+eMdbQKfvYZ25zqNb6Olj/
 onXIz2W3FBWOnXIoTYXwnsUNPzdRLL+aS2e3QsY4=
Message-ID: <4993259d01a0064f8bb22770503490f9252f3659.camel@HansenPartnership.com>
Subject: Re: [PATCH 000/141] Fix fall-through warnings for Clang
From: James Bottomley <James.Bottomley@HansenPartnership.com>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 23 Nov 2020 12:37:58 -0800
In-Reply-To: <CANiq72k5tpDoDPmJ0ZWc1DGqm+81Gi-uEENAtvEs9v3SZcx6_Q@mail.gmail.com>
References: <cover.1605896059.git.gustavoars@kernel.org>
 <20201120105344.4345c14e@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
 <202011201129.B13FDB3C@keescook>
 <20201120115142.292999b2@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
 <202011220816.8B6591A@keescook>
 <9b57fd4914b46f38d54087d75e072d6e947cb56d.camel@HansenPartnership.com>
 <CANiq72nZrHWTA4_Msg6MP9snTyenC6-eGfD27CyfNSu7QoVZbw@mail.gmail.com>
 <1c7d7fde126bc0acf825766de64bf2f9b888f216.camel@HansenPartnership.com>
 <CANiq72m22Jb5_+62NnwX8xds2iUdWDMAqD8PZw9cuxdHd95W0A@mail.gmail.com>
 <fc45750b6d0277c401015b7aa11e16cd15f32ab2.camel@HansenPartnership.com>
 <CANiq72k5tpDoDPmJ0ZWc1DGqm+81Gi-uEENAtvEs9v3SZcx6_Q@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.4 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Tue, 24 Nov 2020 17:58:07 +0100
Cc: alsa-devel@alsa-project.org, linux-atm-general@lists.sourceforge.net,
 reiserfs-devel@vger.kernel.org, linux-iio@vger.kernel.org,
 linux-wireless <linux-wireless@vger.kernel.org>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Nathan Chancellor <natechancellor@gmail.com>, linux-ide@vger.kernel.org,
 dm-devel@redhat.com, keyrings@vger.kernel.org, linux-mtd@lists.infradead.org,
 GR-everest-linux-l2@marvell.com, wcn36xx@lists.infradead.org,
 samba-technical@lists.samba.org, linux-i3c@lists.infradead.org,
 linux1394-devel@lists.sourceforge.net, linux-afs@lists.infradead.org,
 usb-storage@lists.one-eyed-alien.net, drbd-dev@lists.linbit.com,
 devel@driverdev.osuosl.org, linux-cifs@vger.kernel.org,
 rds-devel@oss.oracle.com, Nick Desaulniers <ndesaulniers@google.com>,
 linux-scsi@vger.kernel.org, linux-rdma@vger.kernel.org,
 oss-drivers@netronome.com, bridge@lists.linux-foundation.org,
 linux-security-module@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 linux-stm32@st-md-mailman.stormreply.com, cluster-devel@redhat.com,
 linux-acpi@vger.kernel.org, coreteam@netfilter.org,
 intel-wired-lan@lists.osuosl.org, linux-input <linux-input@vger.kernel.org>,
 Miguel Ojeda <ojeda@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Ext4 Developers List <linux-ext4@vger.kernel.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 Kees Cook <keescook@chromium.org>, selinux@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 linux-geode@lists.infradead.org, linux-can@vger.kernel.org,
 linux-block@vger.kernel.org, linux-gpio@vger.kernel.org,
 op-tee@lists.trustedfirmware.org, linux-mediatek@lists.infradead.org,
 xen-devel@lists.xenproject.org, nouveau@lists.freedesktop.org,
 linux-hams@vger.kernel.org, ceph-devel@vger.kernel.org,
 virtualization@lists.linux-foundation.org,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-hwmon@vger.kernel.org,
 linux-watchdog@vger.kernel.org, linux-nfs@vger.kernel.org,
 GR-Linux-NIC-Dev@marvell.com, tipc-discussion@lists.sourceforge.net,
 Linux-MM <linux-mm@kvack.org>, Network Development <netdev@vger.kernel.org>,
 linux-decnet-user@lists.sourceforge.net, linux-mmc@vger.kernel.org,
 linux-kernel <linux-kernel@vger.kernel.org>,
 "maintainer:X86 ARCHITECTURE \(32-BIT AND 64-BIT\)" <x86@kernel.org>,
 linux-renesas-soc@vger.kernel.org, linux-sctp@vger.kernel.org,
 linux-usb@vger.kernel.org, netfilter-devel@vger.kernel.org,
 Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
 patches@opensource.cirrus.com, Joe Perches <joe@perches.com>,
 linux-integrity@vger.kernel.org, target-devel@vger.kernel.org,
 linux-hardening@vger.kernel.org
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

On Mon, 2020-11-23 at 19:56 +0100, Miguel Ojeda wrote:
> On Mon, Nov 23, 2020 at 4:58 PM James Bottomley
> <James.Bottomley@hansenpartnership.com> wrote:
> > Well, I used git.  It says that as of today in Linus' tree we have
> > 889 patches related to fall throughs and the first series went in
> > in october 2017 ... ignoring a couple of outliers back to February.
> 
> I can see ~10k insertions over ~1k commits and 15 years that mention
> a fallthrough in the entire repo. That is including some commits
> (like the biggest one, 960 insertions) that have nothing to do with C
> fallthrough. A single kernel release has an order of magnitude more
> changes than this...
> 
> But if we do the math, for an author, at even 1 minute per line
> change and assuming nothing can be automated at all, it would take 1
> month of work. For maintainers, a couple of trivial lines is noise
> compared to many other patches.

So you think a one line patch should take one minute to produce ... I
really don't think that's grounded in reality.  I suppose a one line
patch only takes a minute to merge with b4 if no-one reviews or tests
it, but that's not really desirable.

> In fact, this discussion probably took more time than the time it
> would take to review the 200 lines. :-)

I'm framing the discussion in terms of the whole series of changes we
have done for fall through, both what's in the tree currently (889
patches) both in terms of the produce and the consumer.  That's what I
used for my figures for cost.

> > We're also complaining about the inability to recruit maintainers:
> > 
> > https://www.theregister.com/2020/06/30/hard_to_find_linux_maintainers_says_torvalds/
> > 
> > And burn out:
> > 
> > http://antirez.com/news/129
> 
> Accepting trivial and useful 1-line patches

Part of what I'm trying to measure is the "and useful" bit because
that's not a given.

> is not what makes a voluntary maintainer quit...

so the proverb "straw which broke the camel's back" uniquely doesn't
apply to maintainers

>  Thankless work with demanding deadlines is.

That's another potential reason, but it doesn't may other reasons less
valid.

> > The whole crux of your argument seems to be maintainers' time isn't
> > important so we should accept all trivial patches
> 
> I have not said that, at all. In fact, I am a voluntary one and I
> welcome patches like this. It takes very little effort on my side to
> review and it helps the kernel overall.

Well, you know, subsystems are very different in terms of the amount of
patches a maintainer has to process per release cycle of the kernel. 
If a maintainer is close to capacity, additional patches, however
trivial, become a problem.  If a maintainer has spare cycles, trivial
patches may look easy.

> Paid maintainers are the ones that can take care of big
> features/reviews.
> 
> > What I'm actually trying to articulate is a way of measuring value
> > of the patch vs cost ... it has nothing really to do with who foots
> > the actual bill.
> 
> I understand your point, but you were the one putting it in terms of
> a junior FTE.

No, I evaluated the producer side in terms of an FTE.  What we're
mostly arguing about here is the consumer side: the maintainers and
people who have to rework their patch sets. I estimated that at 100h.

>  In my view, 1 month-work (worst case) is very much worth
> removing a class of errors from a critical codebase.
> 
> > One thesis I'm actually starting to formulate is that this
> > continual devaluing of maintainers is why we have so much
> > difficulty keeping and recruiting them.
> 
> That may very well be true, but I don't feel anybody has devalued
> maintainers in this discussion.

You seem to be saying that because you find it easy to merge trivial
patches, everyone should.  I'm reminded of a friend long ago who
thought being a Tees River Pilot was a sinecure because he could
navigate the Tees blindfold.  What he forgot, of course, is that just
because it's easy with a trawler doesn't mean it's easy with an oil
tanker.  In fact it takes longer to qualify as a Tees River Pilot than
it does to get a PhD.

James


