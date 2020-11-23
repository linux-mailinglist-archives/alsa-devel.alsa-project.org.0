Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 672102C2E2F
	for <lists+alsa-devel@lfdr.de>; Tue, 24 Nov 2020 18:15:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0727F17AC;
	Tue, 24 Nov 2020 18:14:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0727F17AC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1606238119;
	bh=Lq6rR4Wq2Ke3/rdOqlmZ/3N0N3gWI5dzH/Hr6oH7uHk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=b+xYaZU7EYRFvFeJ0O+Brhz8SqmnL8Iypwq8nNacz61urQDx2SUS1iiqdTYvaPO1h
	 sm8nQsFS/j8dKJKPZlE6+HoHFe3iWTexN3Y5C5DOQsVpkMsDR7jrhgMZa84grE1E0a
	 gT2oON5ZPv1GU5aPX8BuOU7OJA0JIPRHI9sUckTo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5EC05F805FD;
	Tue, 24 Nov 2020 17:58:49 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9A1F4F80255; Mon, 23 Nov 2020 17:17:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-io1-xd41.google.com (mail-io1-xd41.google.com
 [IPv6:2607:f8b0:4864:20::d41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 49689F80128
 for <alsa-devel@alsa-project.org>; Mon, 23 Nov 2020 17:17:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 49689F80128
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="jzsPhOCP"
Received: by mail-io1-xd41.google.com with SMTP id n129so18660974iod.5
 for <alsa-devel@alsa-project.org>; Mon, 23 Nov 2020 08:17:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9G9wehhbpTZzWWOvGr3rWAgWQ0geLC9Yp77M/YC6Idw=;
 b=jzsPhOCPkH8JcubkL+ilpCqrpmJxzR/ZZhmza1K1c0eddk7+QY69lMXZ1zjj7yUobv
 UPOat94Oznz5N+aYQtyK2tx44PHGHvaT6c5ydFaOoT5387NjxS4giDE0liSNJKSpvdGp
 HKiV67o8ZfM+QomP6uHJNCHgME5k654Lm9OlI5uZEZV/BZyGXhrMcp4osA9RqzKjR7Ze
 0dIcMPHMz9M6e1KbFfvtyGGjldyt3D137VsBHg9GBRp12UjhpWPsI6mtFPtV54IoaC+K
 mSdXyd8g5UOodS4awURhueIsrAq2XHUWM9vJndBZGt3fLtR88qq6iY1NEsTPrUzb2MVL
 n+0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9G9wehhbpTZzWWOvGr3rWAgWQ0geLC9Yp77M/YC6Idw=;
 b=OE1+QheKv9wLYhY3XpJd4ZwuDwoDh5QOX69PcSW2EGzD2tjxjxWXdlU7YtuH1zXQ1C
 Z1m+EXS0mZLXvpBNjc5FUUqdMIk9ZjJ1H8G5BCFNI3Z1MY+EyjmHn1ypiYyeZOOlxxXk
 X1jwqbS/KNH1ar4cleq74ZIJLvOs3W6jg7tN3cIPDbBomj5jhYG73G5DGAXQSLwx9UQj
 ZryMrbw0Xa/AHTveiCG47pT2suL4JrBUrDQGYmXZVeXPnI7FuM3A9tb2KtvleXIDHKtY
 /0IUzLCzVtUbbWpECCgRnAzLUdeOATtPe2EZbZFcWr9vP4n0Cpm6m7Vrghbrax6aRT73
 5frw==
X-Gm-Message-State: AOAM5322OXeUoW+k7BdkN1Fy1SuvSmc3xYCgL/FEdiaqq0FbSFkJyJiu
 BoD2pBaNlgHl1Ch6F+3WTcoZ1zItjZjo2hJN5dI=
X-Google-Smtp-Source: ABdhPJw5wxDBX8QpwE2CghMfFtPIAtnmG9XIUqmbpxXD9wxvuYGnavpxLlav0NBfuecvTCMrGKLgN0Lee5ktV7i8vQ8=
X-Received: by 2002:a05:6602:22c7:: with SMTP id
 e7mr415585ioe.114.1606148231969; 
 Mon, 23 Nov 2020 08:17:11 -0800 (PST)
MIME-Version: 1.0
References: <20201121165058.1644182-1-trix@redhat.com>
 <5843ef910b0e86c00d9c0143dec20f93823b016b.camel@HansenPartnership.com>
 <87y2ism5or.fsf@intel.com>
In-Reply-To: <87y2ism5or.fsf@intel.com>
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Mon, 23 Nov 2020 17:17:00 +0100
Message-ID: <CAKXUXMydH+VtMeuftPRgCg_PYm2iChOMkUYjO=QTG=NRM3QFiw@mail.gmail.com>
Subject: Re: [RFC] MAINTAINERS tag for cleanup robot
To: Jani Nikula <jani.nikula@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Tue, 24 Nov 2020 17:58:07 +0100
Cc: linux-hyperv@vger.kernel.org, kvm@vger.kernel.org,
 Tom Rix <trix@redhat.com>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, platform-driver-x86@vger.kernel.org,
 James Bottomley <James.Bottomley@hansenpartnership.com>,
 ibm-acpi-devel@lists.sourceforge.net,
 "open list:ASYMMETRIC KEYS" <keyrings@vger.kernel.org>,
 linux-mtd@lists.infradead.org, linux-scsi@vger.kernel.org,
 linux-acpi@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 cluster-devel@redhat.com,
 clang-built-linux <clang-built-linux@googlegroups.com>,
 tboot-devel@lists.sourceforge.net, coreteam@netfilter.org,
 xen-devel@lists.xenproject.org, MPT-FusionLinux.pdl@broadcom.com,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 alsa-devel@alsa-project.org, intel-gfx@lists.freedesktop.org,
 ecryptfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-omap@vger.kernel.org, devel@acpica.org, linux-nfs@vger.kernel.org,
 Netdev <netdev@vger.kernel.org>, linux-usb@vger.kernel.org,
 linux-wireless <linux-wireless@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-bluetooth@vger.kernel.org, netfilter-devel@vger.kernel.org,
 linux-crypto@vger.kernel.org, patches@opensource.cirrus.com,
 Joe Perches <joe@perches.com>, bpf@vger.kernel.org
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

On Mon, Nov 23, 2020 at 4:52 PM Jani Nikula <jani.nikula@linux.intel.com> wrote:
>
> On Sat, 21 Nov 2020, James Bottomley <James.Bottomley@HansenPartnership.com> wrote:
> > On Sat, 2020-11-21 at 08:50 -0800, trix@redhat.com wrote:
> >> A difficult part of automating commits is composing the subsystem
> >> preamble in the commit log.  For the ongoing effort of a fixer
> >> producing
> >> one or two fixes a release the use of 'treewide:' does not seem
> >> appropriate.
> >>
> >> It would be better if the normal prefix was used.  Unfortunately
> >> normal is
> >> not consistent across the tree.
> >>
> >>
> >>      D: Commit subsystem prefix
> >>
> >> ex/ for FPGA DFL DRIVERS
> >>
> >>      D: fpga: dfl:
> >>
> >
> > I've got to bet this is going to cause more issues than it solves.
>
> Agreed.
>

Tom, this a problem only kernel janitors encounter; all other
developers really do not have that issue. The time spent on creating
the patch is much larger than the amount saved if the commit log
header line prefix would be derived automatically. I believe Julia
Lawall, Arnd Bergmann and Nathan Chancellor as long-term
high-frequency janitors do have already scripted approaches to that
issue. Maybe they simply need to share these scripts with you and you
consolidate them and share with everyone?

Also, making clean-up patches cumbersome has a positive side as well;
maintainers are not swamped with fully automated patch submissions.
There have been some bad experiences with some submitters on that in
the past...

> > SCSI uses scsi: <driver>: for drivers but not every driver has a
> > MAINTAINERS entry.  We use either scsi: or scsi: core: for mid layer
> > things, but we're not consistent.  Block uses blk-<something>: for all
> > of it's stuff but almost no <somtehing>s have a MAINTAINERS entry.  So
> > the next thing you're going to cause is an explosion of suggested
> > MAINTAINERs entries.
>
> On the one hand, adoption of new MAINTAINERS entries has been really
> slow. Look at B, C, or P, for instance. On the other hand, if this were
> to get adopted, you'll potentially get conflicting prefixes for patches
> touching multiple files. Then what?
>
> I'm guessing a script looking at git log could come up with better
> suggestions for prefixes via popularity contest than manually maintained
> MAINTAINERS entries. It might not always get it right, but then human
> outsiders aren't going to always get it right either.
>
> Now you'll only need Someone(tm) to write the script. ;)
>
> Something quick like this:
>
> git log --since={1year} --pretty=format:%s -- <FILES> |\
>         grep -v "^\(Merge\|Revert\)" |\
>         sed 's/:[^:]*$//' |\
>         sort | uniq -c | sort -rn | head -5
>
> already gives me results that really aren't worse than some of the
> prefixes invented by drive-by contributors.
>

I agree I do not see the need to introduce something in MAINTAINERS;
from my observations maintaining MAINTAINERS, there is sufficient work
on adoption and maintenance of the existing entries already without
such an yet another additional entry. Some entries are outdated or
wrong and the janitor task of cleaning those up is already enough work
for involved janitors and enough churn for involved maintainers. So a
machine-learned approach as above is probably good enough, but if you
think you need more complex rules try to learn them from the data at
hand... certainly a nice task to do with machine learning on commit
message prefixes.

Lukas
