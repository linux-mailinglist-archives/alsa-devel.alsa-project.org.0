Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C8049545C7F
	for <lists+alsa-devel@lfdr.de>; Fri, 10 Jun 2022 08:45:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6953521A6;
	Fri, 10 Jun 2022 08:44:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6953521A6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654843513;
	bh=NUfNzI+Lzqk+ZMoLBcXdIunumPdQxiKPTgtDE7N0Sgk=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nFd+P58t5vnbP62mxxNB/uK7GtJ2RoYALfQp0CFTzdQx8/B3GoH6rJntiAXZp3Fmc
	 xdRBU/fs2GYpZyYYcIC4U+UO8WEg/65PYQs+7FKoY79VfzBJrktALcYR46+0+BJ0s9
	 vvY7onILFV3FCOkbVgiSjMPVBv+tJzNP0buhe9VE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 234CEF805D8;
	Fri, 10 Jun 2022 08:37:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0B981F800C7; Fri, 10 Jun 2022 03:19:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2E454F800E9
 for <alsa-devel@alsa-project.org>; Fri, 10 Jun 2022 03:19:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2E454F800E9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=linux-foundation.org
 header.i=@linux-foundation.org header.b="k2K3VAI6"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 8753DB830E0;
 Fri, 10 Jun 2022 01:19:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 107EEC34114;
 Fri, 10 Jun 2022 01:19:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
 s=korg; t=1654823959;
 bh=NUfNzI+Lzqk+ZMoLBcXdIunumPdQxiKPTgtDE7N0Sgk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=k2K3VAI6SDQeixfuxmPLxZgpiSqDGd0SM+Ll9mgkEIzO4uveLGhDNJt0+TSFK+7Dy
 zU2YexZB9zyyJafX9UAhTSLsmxBgnx4E4qwGlBqJCxclBsikRqriCf9H277tXNvHi5
 35QHlBHe+SBvbWDdRMsPbHvFhnkfmzsajDvPN4sk=
Date: Thu, 9 Jun 2022 18:19:17 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Bill Wendling <morbo@google.com>
Subject: Re: [PATCH 00/12] Clang -Wformat warning fixes
Message-Id: <20220609181917.32e0169b3d33e42b8eb8dcac@linux-foundation.org>
In-Reply-To: <CAGG=3QU0XJhQKJXLMayOkQSiF2yjBi2p2TEZ9KNTzU5mmye-gg@mail.gmail.com>
References: <20220609221702.347522-1-morbo@google.com>
 <20220609152527.4ad7862d4126e276e6f76315@linux-foundation.org>
 <CAGG=3QXDt9AeCQOAp1311POFRSByJru4=Q=oFiQn3u2iZYk2_w@mail.gmail.com>
 <nssn2ps-6n86-nqq6-9039-72847760nnq@vanv.qr>
 <CAGG=3QU0XJhQKJXLMayOkQSiF2yjBi2p2TEZ9KNTzU5mmye-gg@mail.gmail.com>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Fri, 10 Jun 2022 08:37:38 +0200
Cc: alsa-devel@alsa-project.org,
 "maintainer:X86 ARCHITECTURE \(32-BIT AND 64-BIT\)" <x86@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Phillip Potter <phil@philpotter.co.uk>, linux-mm@kvack.org,
 Eric Dumazet <edumazet@google.com>, Networking <netdev@vger.kernel.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Bill Wendling <isanbard@gmail.com>,
 Daniel Kiper <daniel.kiper@oracle.com>,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
 Jozsef Kadlecsik <kadlec@netfilter.org>,
 ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
 Ingo Molnar <mingo@redhat.com>, Tom Rix <trix@redhat.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Pablo Neira Ayuso <pablo@netfilter.org>,
 clang-built-linux <llvm@lists.linux.dev>, coreteam@netfilter.org,
 Arnd Bergmann <arnd@arndb.de>, Ross Philipson <ross.philipson@oracle.com>,
 Nathan Chancellor <nathan@kernel.org>, Borislav Petkov <bp@alien8.de>,
 Thomas Gleixner <tglx@linutronix.de>, linux-edac@vger.kernel.org,
 Tony Luck <tony.luck@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Florian Westphal <fw@strlen.de>, Takashi Iwai <tiwai@suse.com>,
 LKML <linux-kernel@vger.kernel.org>, Jan Engelhardt <jengelh@inai.de>,
 netfilter-devel@vger.kernel.org, Jan Kara <jack@suse.com>,
 "David S. Miller" <davem@davemloft.net>
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

On Thu, 9 Jun 2022 16:16:16 -0700 Bill Wendling <morbo@google.com> wrote:

> On Thu, Jun 9, 2022 at 4:03 PM Jan Engelhardt <jengelh@inai.de> wrote:
> > On Friday 2022-06-10 00:49, Bill Wendling wrote:
> > >On Thu, Jun 9, 2022 at 3:25 PM Andrew Morton <akpm@linux-foundation.org> wrote:
> > >> On Thu,  9 Jun 2022 22:16:19 +0000 Bill Wendling <morbo@google.com> wrote:
> > >>
> > >> > This patch set fixes some clang warnings when -Wformat is enabled.
> > >>
> > >> tldr:
> > >>
> > >> -       printk(msg);
> > >> +       printk("%s", msg);
> > >>
> > >> Otherwise these changes are a
> > >> useless consumer of runtime resources.
> > >
> > >Calling a "printf" style function is already insanely expensive.
> > >[...]
> > >The "printk" and similar functions all have the "__printf" attribute.
> > >I don't know of a modification to that attribute which can turn off
> > >this type of check.
> >
> > Perhaps you can split vprintk_store in the middle (after the call to
> > vsnprintf), and offer the second half as a function of its own (e.g.
> > "puts"). Then the tldr could be
> >
> > - printk(msg);
> > + puts(msg);
> 
> That might be a nice compromise. Andrew, what do you think?
> 

Sure.  It's surprising that we don't already have a puts().
