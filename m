Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 75CDF54A8F1
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Jun 2022 07:56:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2393E18B4;
	Tue, 14 Jun 2022 07:55:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2393E18B4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655186172;
	bh=4dS/3zE3zCMUhf+ayEVaNaWw5zghSWcsePWqCoVu0Yg=;
	h=Subject:From:To:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GGLU7R96qV9WL1xwM8KfYbKmu+miCyX2Nt79bQwqebEoAec+qn6nhJ6nIjGROuCts
	 UBNFbjwoif1J/hVFq6Wd91aYhWx9X7z1l6fWex9zWPelDm9NtPFCqDRKaNTQwQRiAi
	 WeYFwuLUal0dil7w1AleUxqe2Syc0Wz3l7IMbxaM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B397BF8052F;
	Tue, 14 Jun 2022 07:54:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1D801F804D8; Fri, 10 Jun 2022 14:44:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE,T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from relay.hostedemail.com (smtprelay0016.hostedemail.com
 [216.40.44.16])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B8F41F800C7
 for <alsa-devel@alsa-project.org>; Fri, 10 Jun 2022 14:44:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B8F41F800C7
Received: from omf09.hostedemail.com (a10.router.float.18 [10.200.18.1])
 by unirelay12.hostedemail.com (Postfix) with ESMTP id 06E07121083;
 Fri, 10 Jun 2022 12:44:30 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by
 omf09.hostedemail.com (Postfix) with ESMTPA id 08E1F2002A; 
 Fri, 10 Jun 2022 12:44:18 +0000 (UTC)
Message-ID: <cd59f3eab3d2b4f069f4ebf169b33307eaa9e50d.camel@perches.com>
Subject: Re: [PATCH 00/12] Clang -Wformat warning fixes
From: Joe Perches <joe@perches.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Bill Wendling
 <morbo@google.com>
Date: Fri, 10 Jun 2022 05:44:18 -0700
In-Reply-To: <YqLUn3RdZ9HAKZKu@kroah.com>
References: <20220609221702.347522-1-morbo@google.com>
 <20220609152527.4ad7862d4126e276e6f76315@linux-foundation.org>
 <CAGG=3QXDt9AeCQOAp1311POFRSByJru4=Q=oFiQn3u2iZYk2_w@mail.gmail.com>
 <nssn2ps-6n86-nqq6-9039-72847760nnq@vanv.qr>
 <CAGG=3QU0XJhQKJXLMayOkQSiF2yjBi2p2TEZ9KNTzU5mmye-gg@mail.gmail.com>
 <YqLUn3RdZ9HAKZKu@kroah.com>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
X-Rspamd-Server: rspamout05
X-Rspamd-Queue-Id: 08E1F2002A
X-Stat-Signature: r8ecgxf89uwg9qffzdumnqfsj56kpo1p
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX19T013fSZHIO4BR28mlFWzRzi2PPI2hbJs=
X-HE-Tag: 1654865058-93434
X-Mailman-Approved-At: Tue, 14 Jun 2022 07:54:10 +0200
Cc: alsa-devel@alsa-project.org, "maintainer:X86 ARCHITECTURE \(32-BIT AND
 64-BIT\)" <x86@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Phillip Potter <phil@philpotter.co.uk>, linux-mm@kvack.org,
 Eric Dumazet <edumazet@google.com>, "H. Peter Anvin" <hpa@zytor.com>,
 Bill Wendling <isanbard@gmail.com>, Daniel Kiper <daniel.kiper@oracle.com>,
 "Rafael J.
 Wysocki" <rafael.j.wysocki@intel.com>, Jozsef Kadlecsik <kadlec@netfilter.org>,
 ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
 Ingo Molnar <mingo@redhat.com>, Tom Rix <trix@redhat.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Pablo Neira Ayuso <pablo@netfilter.org>,
 clang-built-linux <llvm@lists.linux.dev>, coreteam@netfilter.org,
 Arnd Bergmann <arnd@arndb.de>, Ross Philipson <ross.philipson@oracle.com>,
 Nathan Chancellor <nathan@kernel.org>, Borislav Petkov <bp@alien8.de>,
 Thomas Gleixner <tglx@linutronix.de>, linux-edac@vger.kernel.org,
 Tony Luck <tony.luck@intel.com>, Networking <netdev@vger.kernel.org>,
 Florian Westphal <fw@strlen.de>, Takashi Iwai <tiwai@suse.com>,
 LKML <linux-kernel@vger.kernel.org>, Jan Engelhardt <jengelh@inai.de>,
 netfilter-devel@vger.kernel.org, Jan Kara <jack@suse.com>,
 Andrew Morton <akpm@linux-foundation.org>,
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

On Fri, 2022-06-10 at 07:20 +0200, Greg Kroah-Hartman wrote:
> On Thu, Jun 09, 2022 at 04:16:16PM -0700, Bill Wendling wrote:
> > On Thu, Jun 9, 2022 at 4:03 PM Jan Engelhardt <jengelh@inai.de> wrote:
> > > On Friday 2022-06-10 00:49, Bill Wendling wrote:
> > > > On Thu, Jun 9, 2022 at 3:25 PM Andrew Morton <akpm@linux-foundation=
.org> wrote:
> > > > > On Thu,  9 Jun 2022 22:16:19 +0000 Bill Wendling <morbo@google.co=
m> wrote:
> > > > >=20
> > > > > > This patch set fixes some clang warnings when -Wformat is enabl=
ed.
> > > > >=20
> > > > > tldr:
> > > > >=20
> > > > > -       printk(msg);
> > > > > +       printk("%s", msg);
> > > > >=20
> > > > > Otherwise these changes are a
> > > > > useless consumer of runtime resources.

> > > > Calling a "printf" style function is already insanely expensive.

I expect the printk code itself dominates, not the % scan cost.

> > > Perhaps you can split vprintk_store in the middle (after the call to
> > > vsnprintf), and offer the second half as a function of its own (e.g.
> > > "puts"). Then the tldr could be
> > >=20
> > > - printk(msg);
> > > + puts(msg);
> >=20
> > That might be a nice compromise. Andrew, what do you think?
>=20
> You would need to do that for all of the dev_printk() variants, so I
> doubt that would ever be all that useful as almost no one should be
> using a "raw" printk() these days.

True.  The kernel has ~20K variants like that.

$ git grep -P '\b(?:(?:\w+_){1,3}(?:alert|emerg|crit|err|warn|notice|info|c=
ont|debug|dbg)|printk)\s*\(".*"\s*\)\s*;' | wc -l
21160

That doesn't include the ~3K uses like

#define foo "bar"
	printk(foo);

$ git grep -P '\b(?:(?:\w+_){1,3}(?:alert|emerg|crit|err|warn|info|notice|d=
ebug|dbg|cont)|printk)\s*\((?:\s*\w+){1,3}\s*\)\s*;'|wc -l
2922

There are apparently only a few hundred uses of variants like:

	printk("%s", foo)

$ git grep -P '\b(?:(?:\w+_){1,3}(?:alert|emerg|crit|err|warn|info|notice|d=
ebug|dbg|cont)|printk)\s*\(\s*"%s(?:\\n)?"\s*,\s*(?:".*"|\w+)\s*\)\s*;' | w=
c -l
305

unless I screwed up my greps (which of course is quite possible)

