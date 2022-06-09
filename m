Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0493A545C79
	for <lists+alsa-devel@lfdr.de>; Fri, 10 Jun 2022 08:43:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 97C9F2084;
	Fri, 10 Jun 2022 08:43:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 97C9F2084
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654843434;
	bh=r57b5JZu05HxXpZ7JxUE70ULUd9CxhJHyy+EtqqnqNs=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KvVc5PswhAwB3szitxqWPHIHFILzwUWHcaF0G4QMhbWpdQqxtV7CVUKu10qZDHQVx
	 XE4ISHGrgZeu2UWq1qQIhEsOiAw340iBQTNOtyQ5vRqk+7o/6QjZVOHTaAjungL5Ck
	 acBazp30DJBGLRBYRBNIhlA2/AqPHxzs+TZ3PueU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 43AFEF805BE;
	Fri, 10 Jun 2022 08:37:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2E21FF801F5; Fri, 10 Jun 2022 01:03:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from a3.inai.de (a3.inai.de [IPv6:2a01:4f8:10b:45d8::f5])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0C24BF800E9
 for <alsa-devel@alsa-project.org>; Fri, 10 Jun 2022 01:03:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0C24BF800E9
Received: by a3.inai.de (Postfix, from userid 25121)
 id 3364758723354; Fri, 10 Jun 2022 01:03:36 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by a3.inai.de (Postfix) with ESMTP id 30D9E60C247C4;
 Fri, 10 Jun 2022 01:03:36 +0200 (CEST)
Date: Fri, 10 Jun 2022 01:03:36 +0200 (CEST)
From: Jan Engelhardt <jengelh@inai.de>
To: Bill Wendling <morbo@google.com>
Subject: Re: [PATCH 00/12] Clang -Wformat warning fixes
In-Reply-To: <CAGG=3QXDt9AeCQOAp1311POFRSByJru4=Q=oFiQn3u2iZYk2_w@mail.gmail.com>
Message-ID: <nssn2ps-6n86-nqq6-9039-72847760nnq@vanv.qr>
References: <20220609221702.347522-1-morbo@google.com>
 <20220609152527.4ad7862d4126e276e6f76315@linux-foundation.org>
 <CAGG=3QXDt9AeCQOAp1311POFRSByJru4=Q=oFiQn3u2iZYk2_w@mail.gmail.com>
User-Agent: Alpine 2.25 (LSU 592 2021-09-18)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
 LKML <linux-kernel@vger.kernel.org>, netfilter-devel@vger.kernel.org,
 Jan Kara <jack@suse.com>, Andrew Morton <akpm@linux-foundation.org>,
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


On Friday 2022-06-10 00:49, Bill Wendling wrote:
>On Thu, Jun 9, 2022 at 3:25 PM Andrew Morton <akpm@linux-foundation.org> wrote:
>> On Thu,  9 Jun 2022 22:16:19 +0000 Bill Wendling <morbo@google.com> wrote:
>>
>> > This patch set fixes some clang warnings when -Wformat is enabled.
>>
>> tldr:
>>
>> -       printk(msg);
>> +       printk("%s", msg);
>>
>> Otherwise these changes are a
>> useless consumer of runtime resources.
>
>Calling a "printf" style function is already insanely expensive.
>[...]
>The "printk" and similar functions all have the "__printf" attribute.
>I don't know of a modification to that attribute which can turn off
>this type of check.

Perhaps you can split vprintk_store in the middle (after the call to
vsnprintf), and offer the second half as a function of its own (e.g.
"puts"). Then the tldr could be

- printk(msg);
+ puts(msg);
