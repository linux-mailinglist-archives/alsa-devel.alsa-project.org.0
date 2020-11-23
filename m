Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 648632C2E2E
	for <lists+alsa-devel@lfdr.de>; Tue, 24 Nov 2020 18:14:53 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ADA6117E7;
	Tue, 24 Nov 2020 18:14:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ADA6117E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1606238092;
	bh=lBjYTVUJkmNX+Ql1BcMOHCS5uLgrfuyir/PBRp4vAgY=;
	h=Subject:From:To:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jsKS/zOpj8lVuqxjyXp7DPFmDIBA+snHvyOivPKmSz5Vh39dekb6/eOYKmniaPEf5
	 DjmRD+qTVW/YVaEMIjpdWMmkaXzEVnUSVO7mYgjDPV9HrfJ/aIHI5tNO3X6eJQlxds
	 BH81OokAQ9uBxZR3CWgwPlz5+ZkvAF0RmhGLi+rM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 60927F805F9;
	Tue, 24 Nov 2020 17:58:48 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 88018F80255; Mon, 23 Nov 2020 16:58:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODYSUB_1,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from bedivere.hansenpartnership.com (bedivere.hansenpartnership.com
 [IPv6:2607:fcd0:100:8a00::2])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A86BFF8015B
 for <alsa-devel@alsa-project.org>; Mon, 23 Nov 2020 16:58:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A86BFF8015B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=hansenpartnership.com
 header.i=@hansenpartnership.com header.b="tw2BKkTz"; 
 dkim=pass (1024-bit key) header.d=hansenpartnership.com
 header.i=@hansenpartnership.com header.b="tw2BKkTz"
Received: from localhost (localhost [127.0.0.1])
 by bedivere.hansenpartnership.com (Postfix) with ESMTP id 8958812803A6;
 Mon, 23 Nov 2020 07:58:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=hansenpartnership.com; s=20151216; t=1606147090;
 bh=lBjYTVUJkmNX+Ql1BcMOHCS5uLgrfuyir/PBRp4vAgY=;
 h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
 b=tw2BKkTzWzFWEQdrm6zgBKJtIh2PRfv5Mb0TfkjZKqSr5KeTmWZWgl8VEPx5No8bX
 gdEQ1NYoCzrZ51ueWl3PIAwT19fSirwyiz4cqIKbNqhoqeMTMjHgs4jilQhkGLvH0x
 +YA09wNIiuW9eCRS9chAzVTlxjJYgA69RXyn6sLU=
Received: from bedivere.hansenpartnership.com ([127.0.0.1])
 by localhost (bedivere.hansenpartnership.com [127.0.0.1]) (amavisd-new,
 port 10024)
 with ESMTP id pNOg0X0CRuCM; Mon, 23 Nov 2020 07:58:10 -0800 (PST)
Received: from jarvis.int.hansenpartnership.com (unknown
 [IPv6:2601:600:8280:66d1::527])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by bedivere.hansenpartnership.com (Postfix) with ESMTPSA id 1690C12802D9;
 Mon, 23 Nov 2020 07:58:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=hansenpartnership.com; s=20151216; t=1606147090;
 bh=lBjYTVUJkmNX+Ql1BcMOHCS5uLgrfuyir/PBRp4vAgY=;
 h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
 b=tw2BKkTzWzFWEQdrm6zgBKJtIh2PRfv5Mb0TfkjZKqSr5KeTmWZWgl8VEPx5No8bX
 gdEQ1NYoCzrZ51ueWl3PIAwT19fSirwyiz4cqIKbNqhoqeMTMjHgs4jilQhkGLvH0x
 +YA09wNIiuW9eCRS9chAzVTlxjJYgA69RXyn6sLU=
Message-ID: <fc45750b6d0277c401015b7aa11e16cd15f32ab2.camel@HansenPartnership.com>
Subject: Re: [PATCH 000/141] Fix fall-through warnings for Clang
From: James Bottomley <James.Bottomley@HansenPartnership.com>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 23 Nov 2020 07:58:06 -0800
In-Reply-To: <CANiq72m22Jb5_+62NnwX8xds2iUdWDMAqD8PZw9cuxdHd95W0A@mail.gmail.com>
References: <cover.1605896059.git.gustavoars@kernel.org>
 <20201120105344.4345c14e@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
 <202011201129.B13FDB3C@keescook>
 <20201120115142.292999b2@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
 <202011220816.8B6591A@keescook>
 <9b57fd4914b46f38d54087d75e072d6e947cb56d.camel@HansenPartnership.com>
 <CANiq72nZrHWTA4_Msg6MP9snTyenC6-eGfD27CyfNSu7QoVZbw@mail.gmail.com>
 <1c7d7fde126bc0acf825766de64bf2f9b888f216.camel@HansenPartnership.com>
 <CANiq72m22Jb5_+62NnwX8xds2iUdWDMAqD8PZw9cuxdHd95W0A@mail.gmail.com>
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

On Mon, 2020-11-23 at 15:19 +0100, Miguel Ojeda wrote:
> On Sun, Nov 22, 2020 at 11:36 PM James Bottomley
> <James.Bottomley@hansenpartnership.com> wrote:
> > Well, it seems to be three years of someone's time plus the
> > maintainer review time and series disruption of nearly a thousand
> > patches.  Let's be conservative and assume the producer worked
> > about 30% on the series and it takes about 5-10 minutes per patch
> > to review, merge and for others to rework existing series.  So
> > let's say it's cost a person year of a relatively junior engineer
> > producing the patches and say 100h of review and application
> > time.  The latter is likely the big ticket item because it's what
> > we have in least supply in the kernel (even though it's 20x vs the
> > producer time).
> 
> How are you arriving at such numbers? It is a total of ~200 trivial
> lines.

Well, I used git.  It says that as of today in Linus' tree we have 889
patches related to fall throughs and the first series went in in
october 2017 ... ignoring a couple of outliers back to February.

> > It's not about the risk of the changes it's about the cost of
> > implementing them.  Even if you discount the producer time (which
> > someone gets to pay for, and if I were the engineering manager, I'd
> > be unhappy about), the review/merge/rework time is pretty
> > significant in exchange for six minor bug fixes.  Fine, when a new
> > compiler warning comes along it's certainly reasonable to see if we
> > can benefit from it and the fact that the compiler people think
> > it's worthwhile is enough evidence to assume this initially.  But
> > at some point you have to ask whether that assumption is supported
> > by the evidence we've accumulated over the time we've been using
> > it.  And if the evidence doesn't support it perhaps it is time to
> > stop the experiment.
> 
> Maintainers routinely review 1-line trivial patches, not to mention
> internal API changes, etc.

We're also complaining about the inability to recruit maintainers:

https://www.theregister.com/2020/06/30/hard_to_find_linux_maintainers_says_torvalds/

And burn out:

http://antirez.com/news/129

The whole crux of your argument seems to be maintainers' time isn't
important so we should accept all trivial patches ... I'm pushing back
on that assumption in two places, firstly the valulessness of the time
and secondly that all trivial patches are valuable.

> If some company does not want to pay for that, that's fine, but they
> don't get to be maintainers and claim `Supported`.

What I'm actually trying to articulate is a way of measuring value of
the patch vs cost ... it has nothing really to do with who foots the
actual bill.

One thesis I'm actually starting to formulate is that this continual
devaluing of maintainers is why we have so much difficulty keeping and
recruiting them.

James



